local ffi = require("ffi")
local csgo_weapons = require("neverlose/csgo_weapons")
local get_weapon_info_t = ffi.typeof("\tstruct {\n\t\tchar pad[0x64];\n\t\tint index;\n\t}\n")
local animation_layer_t = ffi.typeof("\tstruct {\n\t\tchar\t\tpad0[0x18];\n\t\tuint32_t\tsequence;\n\t\tfloat\t\tprev_cycle;\n\t\tfloat\t\tweight;\n\t\tfloat\t\tweight_delta_rate;\n\t\tfloat\t\tplayback_rate;\n\t\tfloat\t\tcycle;\n\t\tvoid*\t\tentity;\n\t\tchar\t\tpad1[0x4];\n\t} **\n")
local animation_state_t = ffi.typeof("\tstruct {\n\t\tchar\tpad0[0x18];\n\t\tfloat\tanim_update_timer;\n\t\tchar\tpad1[0xC];\n\t\tfloat\tstarted_moving_time;\n\t\tfloat\tlast_move_time;\n\t\tchar\tpad2[0x10];\n\t\tfloat\tlast_lby_time;\n\t\tchar\tpad3[0x8];\n\t\tfloat\trun_amount;\n\t\tchar\tpad4[0x10];\n\t\tvoid*\tentity;\n\t\tvoid*\tactive_weapon;\n\t\tvoid*\tlast_active_weapon;\n\t\tfloat\tlast_client_side_animation_update_time;\n\t\tint\t\tlast_client_side_animation_update_framecount;\n\t\tfloat\teye_timer;\n\t\tfloat\teye_angles_y;\n\t\tfloat\teye_angles_x;\n\t\tfloat\tgoal_feet_yaw;\n\t\tfloat\tcurrent_feet_yaw;\n\t\tfloat\ttorso_yaw;\n\t\tfloat\tlast_move_yaw;\n\t\tfloat\tlean_amount;\n\t\tchar\tpad5[0x4];\n\t\tfloat\tfeet_cycle;\n\t\tfloat\tfeet_yaw_rate;\n\t\tchar\tpad6[0x4];\n\t\tfloat\tduck_amount;\n\t\tfloat\tlanding_duck_amount;\n\t\tchar\tpad7[0x4];\n\t\tfloat\tcurrent_origin[3];\n\t\tfloat\tlast_origin[3];\n\t\tfloat\tvelocity_x;\n\t\tfloat\tvelocity_y;\n\t\tchar\tpad8[0x4];\n\t\tfloat\tunknown_float1;\n\t\tchar\tpad9[0x8];\n\t\tfloat\tunknown_float2;\n\t\tfloat\tunknown_float3;\n\t\tfloat\tunknown;\n\t\tfloat\tm_velocity;\n\t\tfloat\tjump_fall_velocity;\n\t\tfloat\tclamped_velocity;\n\t\tfloat\tfeet_speed_forwards_or_sideways;\n\t\tfloat\tfeet_speed_unknown_forwards_or_sideways;\n\t\tfloat\tlast_time_started_moving;\n\t\tfloat\tlast_time_stopped_moving;\n\t\tbool\ton_ground;\n\t\tbool\thit_in_ground_animation;\n\t\tchar\tpad10[0x4];\n\t\tfloat\ttime_since_in_air;\n\t\tfloat\tlast_origin_z;\n\t\tfloat\thead_from_ground_distance_standing;\n\t\tfloat\tstop_to_full_running_fraction;\n\t\tchar\tpad11[0x4];\n\t\tfloat\tmagic_fraction;\n\t\tchar\tpad12[0x3C];\n\t\tfloat\tworld_force;\n\t\tchar\tpad13[0x1CA];\n\t\tfloat\tmin_yaw;\n\t\tfloat\tmax_yaw;\n\t} **\n")
local get_client_networkable = utils.get_vfunc("client.dll", "VClientEntityList003", 0, "void*(__thiscall*)(void*, int)")
local get_client_unknown = utils.get_vfunc(0, "void*(__thiscall*)(void*)")
local get_sequence_activity_match = utils.opcode_scan("client.dll", "55 8B EC 53 8B 5D ? 56 8B F1 83 FB") or error("invalid GetSequenceActivity signature")
local get_sequence_activity = ffi.cast("int(__thiscall*)(void*, int)", get_sequence_activity_match)

local function create_entity(idx)
    if idx == nil then return end
    return entity.get(idx)
end

local ent_c = { }

local proxy_mt = {
  __index = function(self, k)
    local f = ent_c[k]
    if type(f) == "function" then
      return function(_, ...)
        return f(self._ent, ...)
      end
    end
    local ent = rawget(self, "_ent")
    local v = ent and ent[k]
    if type(v) == "function" then
      return function(_, ...)
        return v(ent, ...)
      end
    end
    return v
  end,
  __tostring = function(self)
    return tostring(self._ent and self._ent:get_index() or "nil")
  end,
  __concat = function(a, b) return tostring(a) .. tostring(b) end
}

local function create_proxy(idx_or_ent)
  local ent = idx_or_ent
  if type(idx_or_ent) == "number" then
    ent = entity.get(idx_or_ent)
  end
  if not ent then return nil end
  return setmetatable({ _ent = ent }, proxy_mt)
end

function ent_c.new(x)
    return create_proxy(x)
end

function ent_c.new_from_userid(userid)
    return create_proxy(entity.get(userid, true))
end

function ent_c.get_local_player()
    local lp = entity.get_local_player()
    return lp and create_proxy(lp) or nil
end

function ent_c.get_all(...)
    local entities = entity.get_entities(...)
    for i, idx in ipairs(entities) do
        entities[i] = create_proxy(idx)
    end
    return entities
end

function ent_c.get_players(...)
    return entity.get_players(...)
end

function ent_c.get_player_weapon(ent, all_weapons)
    local weapon = ent:get_player_weapon(all_weapons or false)
    if not weapon then return nil end

    if type(weapon) == "table" then
        for i, w in ipairs(weapon) do
            weapon[i] = create_proxy(w)
        end
        return weapon
    else
        return create_proxy(weapon)
    end
end

function ent_c.get_index(ent)
    if ent == nil then return end
    return ent:get_index()
end

function ent_c.get_anim_state(ent)
    return ffi.cast(animation_state_t, ffi.cast("char*", ent[0]) + 39264)[0][0]
end

function ent_c.get_anim_overlay(ent, idx)
    local overlay_ptr = ffi.cast(animation_layer_t, ffi.cast("char*", ent[0]) + 10640)[0]
    return overlay_ptr[idx or 0]
end

function ent_c.get_sequence_activity(ent, seq)
    if not ent or not ent:is_alive() then return nil end

    local ok, result = pcall(function()
        return get_sequence_activity(ent[0], seq)
    end)

    if ok then
        return result
    end
	
    return nil
end


function ent_c.get_client_networkable(ent)
	local networkable_ptr = get_client_networkable(ent:get_index())

	if networkable_ptr == nil then
		return
	end

	return networkable_ptr
end

function ent_c.get_client_unknown(ent)
    if not ent or not ent:is_alive() then return nil end

    local networkable = ent_c.get_client_networkable(ent)
    if not networkable then return nil end

    local ok, unknown = pcall(function()
        return get_client_unknown(networkable)
    end)

    if ok then
        return unknown
    end

    return nil
end


function ent_c.get_weapon_info(ent)
	local item_def_index = ent.m_iItemDefinitionIndex

	return csgo_weapons[item_def_index]
end

local entity_metatable = {
	__index = ent_c,
	__tostring = function(ent)
		return string.format("%d", ent:get_index())
	end,
	__concat = function(a, b)
		return string.format("%s%s", a, b)
	end
}

ffi.metatype(get_weapon_info_t, entity_metatable)

return setmetatable(ent_c, {
	__metatable = true,
    __call = function(_, idx)
        return create_proxy(idx)
    end
})
