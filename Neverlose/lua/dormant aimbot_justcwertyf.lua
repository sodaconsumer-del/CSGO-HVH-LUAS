-- DaCrib OWNS me & all,  https://discord.gg/EtjunmbdA2

--justcwertyf technoloies

local ragebot = { } do
    local hitgroup_str = {
        [0] = 'generic',
        'head', 'chest', 'stomach',
        'left arm', 'right arm',
        'left leg', 'right leg',
        'neck', 'generic', 'gear'
    }
    local WEAPONTYPE_SNIPER_RIFLE = 5
    local aim_target
    local aim_point
    local aim_hitbox
    local aim_damage
    local aim_accuracy
    local is_hit = false
    local is_shot = false
    local target_index = 1
    local round_started = 0.0
    local e_hitbox = {
        [0]  = "Generic",
        [1]  = "Head",
        [2]  = "Chest",
        [3]  = "Stomach",
        [4]  = "Chest",
        [5]  = "Chest",
        [6]  = "Legs",
        [7]  = "Legs",
        [8]  = "Head",
        [10] = "Gear"
    }
    local hitbox_points = {
        {
            scale = 5,
            hitbox = "Stomach",
            vec = vector(0, 0, 40)
        },
        {
            scale = 6,
            hitbox = "Chest",
            vec = vector(0, 0, 50)
        },
        {
            scale = 3,
            hitbox = "Head",
            vec = vector(0, 0, 58)
        },
        {
            scale = 4,
            hitbox = "Legs",
            vec = vector(0, 0, 20)
        }
    }
end
local pui = require "neverlose/pui"
local tabs = {}
tabs.labels = { "\f<house-night>", "\f<users-gear>", "\f<gears>" }
tabs.other = { 
    ragebot = pui.create(tabs.labels[3], "Ragebot", 1), 
}
local elements = {}
elements.other = {
    ragebot = {
        dormant_aimbot = tabs.other.ragebot:switch("Dormant Aimbot", false, function(gear)
            return {}
        end),
        
        hitboxes = tabs.other.ragebot:selectable("Hitboxes", {"Head", "Chest", "Stomach", "Legs"}),
        accuracy = tabs.other.ragebot:slider("Accuracy", 50, 85, 0, 1, "%"),
        minimum_damage = tabs.other.ragebot:slider("Min. Damage", 0, 130, 0, 1),
        auto_scope = tabs.other.ragebot:switch("Auto Scope", false),
    },
}


ragebot.create_move = function(cmd)
    local lp = entity.get_local_player()
    if lp == nil or not lp:is_alive() then return end

    if elements.other.ragebot.grenades.throw_fix:get() then
        local weapon = lp:get_player_weapon()
        if weapon == nil then return end

        local weapon_info = weapon:get_weapon_info()
        if weapon_info == nil then return end

        if weapon_info.weapon_type == 9 then
            refs.weapon_actions:override({ })
        else
            refs.weapon_actions:override()
        end
    end

    if elements.other.ragebot.no_scope_mode:get() or elements.other.ragebot.air_mode:get() then
        local weapon = lp:get_player_weapon()
        if weapon == nil then return end

        local weapon_index = weapon:get_weapon_index()
        if weapon_index == nil then return end

        if bit.band(entity.get_local_player().m_fFlags, bit.lshift(1, 0)) == 0 then
            if weapon_index == 40 then
                refs.ssg_hitchance:override(elements.other.ragebot.air_mode.ssg_amount:get())
            end
            if weapon_index == 9 then
                refs.awp_hitchance:override(elements.other.ragebot.air_mode.awp_amount:get())
            end
            if weapon_index == 38 or weapon_index == 11 then
                refs.autosnipers_hitchance:override(elements.other.ragebot.air_mode.autosnipers_amount:get())
            end
        else
            refs.ssg_hitchance:override()
            refs.awp_hitchance:override()
            refs.autosnipers_hitchance:override()
        end

        if not lp.m_bIsScoped or bit.band(entity.get_local_player().m_fFlags, bit.lshift(1, 0)) == 0 then
            if bit.band(entity.get_local_player().m_fFlags, bit.lshift(1, 0)) == 0 and elements.other.ragebot.air_mode:get()  then
                if weapon_index == 40 then
                    refs.ssg_hitchance:override(elements.other.ragebot.air_mode.ssg_amount:get())
                end
                if weapon_index == 9 then
                    refs.awp_hitchance:override(elements.other.ragebot.air_mode.awp_amount:get())
                end
                if weapon_index == 38 or weapon_index == 11 then
                    refs.autosnipers_hitchance:override(elements.other.ragebot.air_mode.autosnipers_amount:get())
                end
            else
                if elements.other.ragebot.no_scope_mode:get() then
                    if weapon_index == 40 then
                        refs.ssg_hitchance:override(elements.other.ragebot.no_scope_mode.ssg_amount:get())
                    end
                    if weapon_index == 9 then
                        refs.awp_hitchance:override(elements.other.ragebot.no_scope_mode.awp_amount:get())
                    end
                    if weapon_index == 38 or weapon_index == 11 then
                        refs.autosnipers_hitchance:override(elements.other.ragebot.no_scope_mode.autosnipers_amount:get())
                    end
                else
                    refs.ssg_hitchance:override()
                    refs.awp_hitchance:override()
                    refs.autosnipers_hitchance:override()
                end
            end
        else
            refs.ssg_hitchance:override()
            refs.awp_hitchance:override()
            refs.autosnipers_hitchance:override()
        end
    end
    if elements.other.ragebot.grenades.super_toss:get() then
        if render.camera_angles() ~= cmd.view_angles:clone() then return end
        local lp = entity.get_local_player()
        if lp == nil then return end
        local weapon = lp:get_player_weapon()
        if weapon == nil then return end
        local weapon_info = weapon:get_weapon_info()
        if weapon_info == nil then return end
        local weapon_type = weapon_info.weapon_type
        if weapon_type == WEAPONTYPE_GRENADE then
            local predicted_time = globals.curtime - to_time(globals.clock_offset)
            if weapon.m_fThrowTime > predicted_time then
                cmd.in_speed = true
                cmd.view_angles = get_throw_toss(
                    render.camera_angles(),
                    weapon_info.throw_velocity,
                    weapon.m_flThrowStrength,
                    lp.m_vecVelocity
                )
            end
        end
    end
    if elements.other.ragebot.dormant_aimbot:get() then
        refs.dormant_aimbot:override(false)
        local weapon = lp:get_player_weapon()
        if weapon == nil then return end
        local weapon_info = weapon:get_weapon_info()
        if weapon_info == nil then return end
        local inaccuracy = weapon:get_inaccuracy()
        if inaccuracy == nil then return end
        local tickcount = globals.tickcount
        local eye_pos = lp:get_eye_position()
        local simtime = lp:get_simulation_time().current
        local onground = bit.band(lp.m_fFlags, bit.lshift(1, 0)) ~= 0
        if tickcount < round_started then
            return
        end
        if cmd.in_jump and not onground then
            return
        end
        local weapon_type = weapon_info.weapon_type
        if not is_weapon_gun(weapon_type) or weapon.m_iClip1 <= 0 then
            return false
        end
        local targets = get_aimbot_targets()
        local hitboxes = elements.other.ragebot.dormant_aimbot.hitboxes:get()
        if tickcount % #targets ~= 0 then
            target_index = target_index + 1
        else
            target_index = 1
        end
        local target = targets[target_index]
        if target == nil then
            return
        end
        local bbox = target:get_bbox()
        local origin = target:get_origin()
        local duck_amount = target.m_flDuckAmount
        local hitchance = elements.other.ragebot.dormant_aimbot.accuracy:get()
        local desired_damage = elements.other.ragebot.dormant_aimbot.minimum_damage:get()
        if desired_damage == -1 then
            desired_damage = refs.minimum_damage:get()
        end
        if desired_damage > 100 then
            desired_damage = desired_damage - 100 + target.m_iHealth
        end
        local points = { }
        for i = 1, #hitbox_points do
            local data = hitbox_points[i]
            local vec = data.vec
            local scale = data.scale
            local hitbox = data.hitbox
            if hitbox == "Head" then
                vec = vec - vector(0, 0, 10 * duck_amount)
            end
            if hitbox == "Chest" then
                vec = vec - vector(0, 0, 4 * duck_amount)
            end
            if #hitboxes ~= 0 then
                if contains(hitboxes, hitbox) then
                    table.insert(points, {
                        vec = vec,
                        scale = scale,
                        hitbox = hitbox
                    })
                end
            else
                table.insert(points, 1, {
                    vec = vec,
                    scale = scale,
                    hitbox = hitbox
                })
            end
        end
        local is_available_to_shoot = weapon_info.is_revolver and weapon.m_flNextPrimaryAttack < simtime or math.max(lp.m_flNextAttack, weapon.m_flNextPrimaryAttack, weapon.m_flNextSecondaryAttack) < simtime
        if not is_available_to_shoot then
            return
        end
        local found_pos
        local found_damage
        if hitchance >= math.floor(bbox.alpha * 100) + 5 then
            return
        end
        for j = 1, #points do
            local point = points[j]
            local multipoints = create_multipoints(eye_pos, origin + point.vec, point.scale)
            for k = 1, #multipoints do
                local multipoint = multipoints[k]
                local aimpoint = multipoint.vec
                local damage, tr = trace_bullet(lp, eye_pos, aimpoint, function(ent)
                    return ent == target
                end)
                if tr ~= nil and tr:is_visible() then
                    goto continue
                end
                if damage ~= 0 and desired_damage < damage then
                    found_pos = aimpoint
                    found_damage = damage
                    aim_target = target
                    aim_hitbox = point.hitbox
                    aim_damage = damage
                    aim_point = multipoint.text
                    aim_accuracy = bbox.alpha
                    break
                end
                ::continue::
            end
            if found_pos and found_damage then
                break
            end
        end
        if not found_pos or not found_damage then
            return
        end
        local angles = eye_pos:to(found_pos):angles()
        cmd.block_movement = 1
        if elements.other.ragebot.dormant_aimbot.auto_scope:get() then
            local is_onground = not cmd.in_jump and onground
            local is_scoped = lp.m_bIsScoped or lp.m_bResumeZoom
            local is_sniper = weapon_info.weapon_type == WEAPONTYPE_SNIPER_RIFLE
            if not is_scoped and is_sniper and is_onground then
                cmd.in_attack2 = true
            end
        end
        if inaccuracy < 0.01 then
            cmd.view_angles = angles
            cmd.in_attack = true
            is_shot = true
        end
    else
        refs.dormant_aimbot:override()
    end
end