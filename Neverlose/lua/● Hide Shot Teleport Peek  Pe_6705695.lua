if not pcall(ffi.sizeof, "ConvarVtable") then
	ffi.cdef([[
		typedef struct {
			char pad[0x14];
			int flags;
			char pad1[0x2c];
		} ConvarFlags;

		typedef struct {
			void** virtual_function_table;
			unsigned char pad[20];
			void* changeCallback;
			void* parent;
			const char* defaultValue;
			char* string;
			int m_StringLength;
			float m_fValue;
			int m_nValue;
			int m_bHasMin;
			float m_fMinVal;
			int m_bHasMax;
			float m_fMaxVal;
			void* onChangeCallbacks_memory;
			int onChangeCallbacks_allocationCount;
			int onChangeCallbacks_growSize;
			int onChangeCallbacks_size;
			void* onChangeCallbacks_elements;
		} ConvarVtable;
	]])
end

local data = {
	CvarList = {},
	State = false,
	Should = true,
	Success = false,
	PrevSettings = "",
	RoundState = false,
	LastCommand = nil,
	RechargedTimer = 0,
	Author = "SYR1337",
	ConnectedState = false,
	SmartPeekWorking = false,
	FreestandingSuccess = false,
	SmartPeekMovement = false,
	ScriptName = "On-Shot Peek",
	SmartPeekView = vector(0, 0, 0),
	SmartPeekOrigin = vector(0, 0, 0),
	SmartPeekWorkingOrigin = vector(0, 0, 0),
	RefineShot = {
		Ticks = 0,
		Index = 0,
		Timer = 0,
		State = false
	},

	OptionsConvar = {
		["Anti-Defensive"] = "Break LC",
		["Offensive"] = "Favor Fire Rate",
		["Defensive"] = "Favor Fake Lag"
	},

	Reference = {
		OnShot = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"),
		PeekAssist = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist"),
		Backtrack = ui.find("Miscellaneous", "Main", "Other", "Fake Latency"),
		Freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"),
		MinimumDamage = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"),
		OnShotOptions = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options"),
		PeekAssistMode = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist", "Retreat Mode")
	}
}

local RgbaToHexText = function(colors, text)
	return ("\a%02x%02x%02x%02x%s"):format(colors.r, colors.g, colors.b, colors.a, text)
end

local ColorToTable = function(colors)
	return {
		r = math.floor(colors.r),
		a = math.floor(colors.a),
		b = math.floor(colors.b),
		g = math.floor(colors.g)
	}
end

local RgbaToHexGradientText = function(g_color_1, g_color_2, text)
	local output = ""
	local len = text:len() - 1
	local color_1 = ColorToTable(g_color_1)
	local color_2 = ColorToTable(g_color_2)
	local rinc = (color_2.r - color_1.r) / len
	local ainc = (color_2.a - color_1.a) / len
	local ginc = (color_2.g - color_1.g) / len
	local binc = (color_2.b - color_1.b) / len
	for i = 1, len + 1 do
		output = ("%s%s"):format(output, RgbaToHexText(color_1, text:sub(i, i)))
		color_1.r = math.clamp(math.floor(color_1.r + rinc), 0, 255)
		color_1.a = math.clamp(math.floor(color_1.a + ainc), 0, 255)
		color_1.g = math.clamp(math.floor(color_1.g + ginc), 0, 255)
		color_1.b = math.clamp(math.floor(color_1.b + binc), 0, 255)
	end

	return output
end

local Main = ui.create(RgbaToHexGradientText(color(120, 162, 255, 255), color(255, 128, 247, 255), "On-Shot Peek"))
ui.sidebar(RgbaToHexGradientText(color(120, 162, 255, 255), color(255, 128, 247, 255), data.ScriptName), "wheelchair")
local Elements = {
	MasterSwitch = Main:switch("Master-Switch"),
	MasterSwitchKey = Main:switch("> On Shot-Peek[Key]"),
	OnShotPeekLag = Main:combo("> On Shot-Lag", {"Off", "Peek"}),
	OnShotPeekStyle = Main:combo("> On Shot-Peek Style", {"Anti-Defensive", "Offensive", "Defensive"}),
	OnShotPeekFactionIndication = Main:switch("> On Shot-Peek Re-Charged Indication"),
	OnShotPeekFactionIndicationText = Main:input("> On Shot-Peek Re-Charged Indication Text", "OS-PEEK CHARGED:"),
	OnShotPeekFactionIndicationColor = Main:color_picker("> On Shot-Peek Re-Charged Color", color(255, 255, 255, 255)),
	OnShotPeekFactionIndicationDifferentColor = Main:color_picker("> On Shot-Peek Re-Charged Different Color", color(0, 255, 255, 255)),
	OnShotPeekFactionIndicationX = Main:slider("> On Shot-Peek Re-Charged X", - render.screen_size().x, render.screen_size().x, render.screen_size().x / 2),
	OnShotPeekFactionIndicationY = Main:slider("> On Shot-Peek Re-Charged Y", - render.screen_size().y, render.screen_size().y, (render.screen_size().y / 2) + 50),
	OnShotPeekSettings = Main:selectable("> On Shot-Peek Settings", {"Force Block Peek", "Freestanding", "Smart-Peek[Beta] !Unsafe > Fps Break", [[Bypass "cl_lagcompensation" On OS-Peek]]}),
	ClientLagCompSationState = Main:slider([[> Control On Shot-Peek "cl_lagcompensation" State]], 0, 1, 1),
	SmartPeekKey = Main:switch("Smart-Peek Key", false),
	SmartPeekScopedDetected = Main:switch("Smart-Peek Scoped Detected", true),
	SmartPeekMode = Main:combo("Smart-Peek Detection", {"Risky", "Safest"}),
	SmartPeekTarget = Main:combo("Smart-Peek Target", {"Ideal", "Current", "All Enemies"}),
	SmartPeekHitbox = Main:selectable("Smart-Peek Hitbox", {"Head", "Neck", "Chest", "Stomach", "Arms", "Legs", "Feet"}),
	SmartPeekExtrapolateTicks = Main:slider("Smart-Peek Extrapolate Tick", 0, 5, 0),
	SmartPeekSegament = Main:slider("Smart-Peek Segament", 2, 60, 2),
	SmartPeekRadius = Main:slider("Smart-Peek Distance", 0, 250, 50),
	SmartPeekDepart = Main:slider("Smart-Peek Department", 1, 12, 2),
	SmartPeekUnlock = Main:switch("Smart-Peek Unlock Camera"),
	SmartPeekMiddle = Main:switch("Smart-Peek Middle Point"),
	SmartPeekLimit = Main:switch("Smart-Peek Limitation Target"),
	SmartPeekLimitMax = Main:slider("Smart-Peek Limitation Max", 0, 20, 5),
	SmartPeekDebugger = Main:selectable("Debugger Indication", {"Line Player-Predict", "Line Predict-Target", "Fraction Detection", "Base"}),
	SmartPeekColor = Main:color_picker("Debugger Indication Color", color(255, 255, 255, 255)),
	SmartPeekActivateColor = Main:color_picker("Debugger Indication Activate Color", color(0, 255, 255, 255))
}

local CHelpers = {
	Cvar = (function()
		local CvarSystem = utils.get_vfunc("vstdlib.dll", "VEngineCvar007", 15, "ConvarVtable*(__thiscall*)(void*, const char*)")
		local CvarFlagSystem = utils.get_vfunc("vstdlib.dll", "VEngineCvar007", 16, "ConvarFlags*(__thiscall*)(void*, const char*)")
		local CvarRate = CvarSystem("rate")
		local CvarSetInt = ffi.cast("void(__thiscall*)(void*, int)", CvarRate.virtual_function_table[16])
		local CvarSetFloat = ffi.cast("void(__thiscall*)(void*, float)", CvarRate.virtual_function_table[15])
		local CvarMetaTable = {
			__index = {
				int = function(self, var)
					self.Stored = false
					if self.Cvar ~= ffi.NULL and self.Current ~= var then
						CvarSetInt(self.Cvar, var)
						self.Current = var
					end
				end,

				float = function(self, var)
					self.Stored = false
					if self.Cvar ~= ffi.NULL and self.Current ~= var then
						CvarSetFloat(self.Cvar, var)
						self.Current = var
					end
				end,

				bypass = function(self, bypass_state)
					self.Stored = false
					if self.CvarFlag ~= ffi.NULL and not self.Bypass and bypass_state and self.CvarFlag.flags ~= 0 then
						self.CvarFlag.flags = 0
						self.Bypass = true
					elseif self.CvarFlag ~= ffi.NULL and self.Bypass and not bypass_state and self.CvarFlag.flags ~= self.Flags then
						self.CvarFlag.flags = self.Flags
						self.Bypass = false
					end
				end,

				stored = function(self)
					self:bypass(false)
					self:int(self.Value)
					self:float(self.Value)
					self.Stored = true
				end
			}
		}

		return function(cvar_name)
			if not data.CvarList[cvar_name] then
				local CvarPointer = CvarSystem(cvar_name)
				local CvarFlagsPointer = CvarFlagSystem(cvar_name)
				local CvarValue = tonumber(ffi.string(CvarPointer.defaultValue))
				data.CvarList[cvar_name] = {
					Stored = true,
					Bypass = false,
					Value = CvarValue,
					Cvar = CvarPointer,
					Current = CvarValue,
					CvarFlag = CvarFlagsPointer,
					Flags = CvarFlagsPointer.flags
				}
			end

			return setmetatable(data.CvarList[cvar_name], CvarMetaTable)
		end
	end)()
}

local ContainUI = function(ui, max)
	for index = 1, max do
		if ui:get(index) then
			return true
		end
	end

	return false
end

local MultiCallBack = function(tab, callback)
	for _, data in pairs(tab) do
		if type(data) == "table" then
			MultiCallBack(data, callback)
		else
			data:set_callback(callback)
		end
	end
end

local HandleMain = function()
	Elements.OnShotPeekLag:visibility(Elements.MasterSwitch:get())
	Elements.MasterSwitchKey:visibility(Elements.MasterSwitch:get())
	Elements.OnShotPeekStyle:visibility(Elements.MasterSwitch:get())
	Elements.OnShotPeekSettings:visibility(Elements.MasterSwitch:get())
	Elements.OnShotPeekFactionIndication:visibility(Elements.MasterSwitch:get())
	Elements.ClientLagCompSationState:visibility(Elements.MasterSwitch:get() and Elements.OnShotPeekSettings:get(4))
	Elements.OnShotPeekFactionIndicationY:visibility(Elements.MasterSwitch:get() and Elements.OnShotPeekFactionIndication:get())
	Elements.OnShotPeekFactionIndicationX:visibility(Elements.MasterSwitch:get() and Elements.OnShotPeekFactionIndication:get())
	Elements.OnShotPeekFactionIndicationText:visibility(Elements.MasterSwitch:get() and Elements.OnShotPeekFactionIndication:get())
	Elements.OnShotPeekFactionIndicationColor:visibility(Elements.MasterSwitch:get() and Elements.OnShotPeekFactionIndication:get())
	Elements.SmartPeekKey:visibility(Elements.MasterSwitch:get() and Elements.OnShotPeekSettings:get(3) and Elements.MasterSwitchKey:get())
	Elements.OnShotPeekFactionIndicationDifferentColor:visibility(Elements.MasterSwitch:get() and Elements.OnShotPeekFactionIndication:get())
	Elements.SmartPeekLimit:visibility(Elements.MasterSwitch:get() and Elements.OnShotPeekSettings:get(3) and Elements.MasterSwitchKey:get())
	Elements.SmartPeekMode:visibility(Elements.MasterSwitch:get() and Elements.OnShotPeekSettings:get(3) and Elements.MasterSwitchKey:get())
	Elements.SmartPeekTarget:visibility(Elements.MasterSwitch:get() and Elements.OnShotPeekSettings:get(3) and Elements.MasterSwitchKey:get())
	Elements.SmartPeekHitbox:visibility(Elements.MasterSwitch:get() and Elements.OnShotPeekSettings:get(3) and Elements.MasterSwitchKey:get())
	Elements.SmartPeekRadius:visibility(Elements.MasterSwitch:get() and Elements.OnShotPeekSettings:get(3) and Elements.MasterSwitchKey:get())
	Elements.SmartPeekDepart:visibility(Elements.MasterSwitch:get() and Elements.OnShotPeekSettings:get(3) and Elements.MasterSwitchKey:get())
	Elements.SmartPeekUnlock:visibility(Elements.MasterSwitch:get() and Elements.OnShotPeekSettings:get(3) and Elements.MasterSwitchKey:get())
	Elements.SmartPeekMiddle:visibility(Elements.MasterSwitch:get() and Elements.OnShotPeekSettings:get(3) and Elements.MasterSwitchKey:get())
	Elements.SmartPeekDebugger:visibility(Elements.MasterSwitch:get() and Elements.OnShotPeekSettings:get(3) and Elements.MasterSwitchKey:get())
	Elements.SmartPeekSegament:visibility(Elements.MasterSwitch:get() and Elements.OnShotPeekSettings:get(3) and Elements.MasterSwitchKey:get())
	Elements.SmartPeekExtrapolateTicks:visibility(Elements.MasterSwitch:get() and Elements.OnShotPeekSettings:get(3) and Elements.MasterSwitchKey:get())
	Elements.SmartPeekScopedDetected:visibility(Elements.MasterSwitch:get() and Elements.OnShotPeekSettings:get(3) and Elements.MasterSwitchKey:get())
	Elements.SmartPeekLimitMax:visibility(Elements.MasterSwitch:get() and Elements.OnShotPeekSettings:get(3) and Elements.SmartPeekLimit:get() and Elements.MasterSwitchKey:get())
	Elements.SmartPeekColor:visibility(Elements.MasterSwitch:get() and Elements.OnShotPeekSettings:get(3) and ContainUI(Elements.SmartPeekDebugger, 4) and Elements.MasterSwitchKey:get())
	Elements.SmartPeekActivateColor:visibility(Elements.MasterSwitch:get() and Elements.OnShotPeekSettings:get(3) and ContainUI(Elements.SmartPeekDebugger, 4) and Elements.MasterSwitchKey:get())
end

local Air = function(player)
	return bit.band(player["m_fFlags"], 1) == 0
end

local Extrapolate = function(player, ticks, vector)
	local velocity =  player["m_vecVelocity"]
	local extrapolate_vector = vector + globals.tickinterval * velocity * ticks
	return extrapolate_vector
end

local SmartPeekCall = function()
	local me = entity.get_local_player()
	if not me or not me:is_alive() then
		return
	end

	local camera_pos = render.camera_angles()
	data.SmartPeekOrigin = me:get_hitbox_position(3)
	data.SmartPeekView = vector(camera_pos.x, camera_pos.y, 0)
end

local WeaponIsKnife = function(ent)
	if not ent then
		return false
	end

	local console_name = ent:get_weapon_info().console_name
	if console_name:find("knife") then
		return true
	end

	return false
end

local WeaponIsGrenade = function(ent)
	if not ent then
		return false
	end

	local console_name = ent:get_weapon_info().console_name
	if console_name:find("grenade") or console_name:find("molotov") or console_name:find("flashbang") or console_name:find("flashbang") or console_name:find("decoy") or console_name:find("decoy") then
		return true
	end

	return false
end

local VectorToAngles = function(self, target)
	local origin = vector(0, 0, 0)
	local target_origin = vector(0, 0, 0)
	local local_player = entity.get_local_player()
	if not target then
		target_origin = self
		origin = local_player:get_eye_position()
		if not origin then
			return
		end
	else
		origin = self
		target_origin = target
	end

	local delta_between = target_origin - origin
	if delta_between.x == 0 and delta_between.y == 0 then
		return vector(delta_between.z > 0 and 270 or 90, 0, 0)
	else
		local yaw = math.deg(math.atan2(delta_between.y, delta_between.x))
		local hyp = math.sqrt(delta_between.x * delta_between.x + delta_between.y * delta_between.y)
		local pitch = math.deg(math.atan2(- delta_between.z, hyp))
		return vector(pitch, yaw, 0)
	end
end

local GetViewPoint = function(radius, v, vector_origin)
	local eye_pos = vector_origin
	local viewangle = data.SmartPeekView
	local new_view_vec = eye_pos + vector(0, 0, 0):angles(0, (90 + viewangle.y + radius)) * v
	return new_view_vec
end

local GetPredictPoint = function(radius, segament, vector_origin)
	local points = {}
	local my_vec = vector_origin
	local angles_pre_point = 360 / math.max(2, math.floor(segament))
	for i = 0, 360, angles_pre_point do
		local view_point = GetViewPoint(i, radius, my_vec)
		table.insert(points, view_point)
	end

	return points
end

local GetDepartPoint = function(vec, my_vec, department, limit_vec)
	local points = {}
	local vec_1 = vector(vec.x, vec.y, 0)
	local vec_2 = vector(my_vec.x, my_vec.y, 0)
	local vec_3 = vector(limit_vec.x, limit_vec.y, 0)
	local each_plus = (vec_1 - vec_2) / department
	local limit_vec_cal = (vec_3 - vec_2):length()
	for i = 1, department do
		local add_vec = each_plus * i
		if add_vec:length() < limit_vec_cal then
			table.insert(points, my_vec + add_vec)
		end
	end

	return points
end

local TraceEndPosition = function(origin, dest)
	local local_player = entity.get_local_player()
	local traced = utils.trace_line(origin, dest, local_player)
	return traced.end_pos, traced.fraction
end

local CalculateEndPosition = function(draw_line, draw_circle, debug_fraction, vec, my_vec)
	local me = entity.get_local_player()
	local original = me:get_origin()
	local debug_vec = vector(my_vec.x, my_vec.y, original.z + 5)
	local debug_vec_2 = vector(vec.x, vec.y, original.z + 5)
	local pos_1, fraction_1 = TraceEndPosition(my_vec, vec)
	local pos_2, fraction_2 = TraceEndPosition(debug_vec, debug_vec_2)
	local end_Pos = vector(pos_2.x, pos_2.y, vec.z)
	local debug_color = (data.SmartPeekMovement and data.SmartPeekWorking) and Elements.SmartPeekActivateColor:get() or Elements.SmartPeekColor:get()
	if draw_line then
		local start_pos = render.world_to_screen(pos_2)
		local end_pos = render.world_to_screen(debug_vec)
		if start_pos and end_pos then
			render.line(start_pos, end_pos, debug_color)
		end
	end

	if debug_fraction then
		local debug_text = tostring(math.floor(fraction_1) * 100)
		local text_pos = render.world_to_screen(debug_vec_2)
		if text_pos then
			render.text(1, textpos, debug_color, "c", debug_text)
		end
	end

	return end_Pos
end

local CalculateRealPoint = function(draw_line, draw_circle, debug_fraction, vec)
	local my_vec = vec
	local points_list = {}
	local middle_point = Elements.SmartPeekMiddle:get()
	local points = GetPredictPoint(Elements.SmartPeekRadius:get(), Elements.SmartPeekSegament:get(), my_vec)
	for i, pointer in pairs(points) do
		if middle_point then
			local halfone = points[i + 1]
			halfone = halfone == nil and points[1] or halfone
			local halfpoint = vector((halfone.x + pointer.x) / 2, (halfone.y + pointer.y) / 2, pointer.z)
			local end_pos = CalculateEndPosition(draw_line, draw_circle, debug_fraction, halfpoint, my_vec)
			table.insert(points_list, {
				endpos = end_pos,
				ideal = halfpoint
			})
		end

		local end_pos = CalculateEndPosition(draw_line, draw_circle, debug_fraction, pointer, my_vec)
		table.insert(points_list, {
			ideal = pointer,
			endpos = end_pos
		})
	end

	return points_list
end

local GetAllPointers = function(debug_line, debug_cir, debug_fraction, department, vec)
	local points = {}
	local me = entity.get_local_player()
	local original = me:get_origin()
	local debug_color = Elements.SmartPeekColor:get()
	local debug_activate_color = Elements.SmartPeekActivateColor:get()
	local m_points = CalculateRealPoint(debug_line, debug_cir, debug_fraction, vec)
	for i, pointer in pairs(m_points) do
		local limit_vec = pointer.endpos
		local calculate_vec = pointer.ideal
		local current_color = (data.SmartPeekMovement and data.SmartPeekWorking) and debug_activate_color or debug_color
		if debug_cir then
			render.circle_3d(vector(limit_vec.x, limit_vec.y, original.z + 5), current_color, 5, 0, 1.0)
		end

		table.insert(points, limit_vec)
		if department ~= 1 then
			for _, depart_vec in pairs(GetDepartPoint(calculate_vec, vec, department, limit_vec)) do
				table.insert(points, depart_vec)
				if debug_cir then
					render.circle_3d(vector(depart_vec.x, depart_vec.y, original.z + 5), current_color, 5, 0, 1.0)
				end
			end
		end
	end

	return points
end

local GetCanHitboxes = function(ui)
	local hitbox = {}
	if ui:get(1) then
		table.insert(hitbox, 0)
	end

	if ui:get(2) then
		table.insert(hitbox, 1)
	end

	if ui:get(3) then
		table.insert(hitbox, 4)
		table.insert(hitbox, 5)
		table.insert(hitbox, 6)
	end

	if ui:get(4) then
		table.insert(hitbox, 2)
		table.insert(hitbox, 3)
	end

	if ui:get(5) then
		table.insert(hitbox, 13)
		table.insert(hitbox, 14)
		table.insert(hitbox, 15)
		table.insert(hitbox, 16)
		table.insert(hitbox, 17)
		table.insert(hitbox, 18)
	end

	if ui:get(6) then
		table.insert(hitbox, 7)
		table.insert(hitbox, 8)
		table.insert(hitbox, 9)
		table.insert(hitbox, 10)
	end

	if ui:get(7) then
		table.insert(hitbox, 11)
		table.insert(hitbox, 12)
	end

	return hitbox
end

local SmartPeekCalculate = function()
	local me = entity.get_local_player()
	local master_switch = Elements.MasterSwitch:get() and Elements.MasterSwitchKey:get() and Elements.OnShotPeekSettings:get(3)
	if not me or not me:is_alive() or not Elements.SmartPeekKey:get() or not master_switch then
		return
	end

	local hitbox_c = me:get_hitbox_position(3)
	local my_vec = hitbox_c
	local camera_pos = render.camera_angles()
	local mpitch, myaw = camera_pos.x, camera_pos.y
	local predict_tick = Elements.SmartPeekExtrapolateTicks:get()
	local m_points = GetAllPointers(
		Elements.SmartPeekDebugger:get(1),
		Elements.SmartPeekDebugger:get(4),
		Elements.SmartPeekDebugger:get(3),
		Elements.SmartPeekDepart:get(),
		data.SmartPeekOrigin
	)

	local p_List = {}
	local self_origin = me:get_origin()
	local sort_type = Elements.SmartPeekMode:get()
	local current_target = Elements.SmartPeekTarget:get()
	local min_damage = data.Reference.MinimumDamage:get()
	local p_Hitbox = GetCanHitboxes(Elements.SmartPeekHitbox)
	if current_target == "Ideal" then
		local current_entity = nil
		local current_distance = math.huge
		local players = entity.get_players(true, true)
		if #players == 0 then
			data.SmartPeekWorking = false
			data.SmartPeekWorkingOrigin = nil
			return 
		end

		for i, o in pairs(m_points) do
			for _, player in pairs(players) do
				if player:is_alive() and not player:is_dormant() then
					local ent_origin = player:get_origin()
					local end_position, faction = TraceEndPosition(self_origin, o)
					if end_position and faction >= 0.98 then
						local between = end_position:dist(ent_origin)
						if current_distance > between then
							current_entity = player
							current_distance = between
						end
					end
				end
			end

			if current_entity then
				for _, v in pairs(p_Hitbox) do
					local hitbox_c = current_entity:get_hitbox_position(v)
					local end_position, faction = TraceEndPosition(self_origin, o)
					if end_position and faction >= 0.98 then
						local new_pos = Extrapolate(current_entity, predict_tick, hitbox_c)
						local dmg = utils.trace_bullet(me, end_position, new_pos)
						if dmg >= math.min(min_damage, current_entity["m_iHealth"]) then
							table.insert(p_List, {
								vec = o,
								damage = dmg,
								enemy_vec = new_pos,
								TARGET = current_entity
							})
						end
					end
				end
			end
		end

	elseif current_target == "All Enemies" then
		local players = entity.get_players(true, true)
		local limitation = Elements.SmartPeekLimit:get()
		local limitation_max = Elements.SmartPeekLimitMax:get()
		if #players == 0 then
			data.SmartPeekWorking = false
			data.SmartPeekWorkingOrigin = nil
			return 
		end

		for i, o in pairs(m_points) do
			for _, player in pairs(players) do
				if player:is_alive() and not player:is_dormant() then
					local best_target = player
					for _, v in pairs(p_Hitbox) do
						local hitbox_c = best_target:get_hitbox_position(v)
						local new_pos = Extrapolate(best_target, predict_tick, hitbox_c)
						local dmg = utils.trace_bullet(me, o, new_pos)
						if dmg >= math.min(min_damage, best_target["m_iHealth"]) then
							table.insert(p_List, {
								vec = o,
								damage = dmg,
								TARGET = best_target,
								enemy_vec = new_pos
							})
						end
					end
				end
			end

			if limitation and #p_List >= limitation_max then
				break
			end
		end
	else
		local best_target = entity.get_threat()
		if best_target == nil or not best_target:is_alive() or best_target:is_dormant() then
			data.SmartPeekWorking = false
			data.SmartPeekWorkingOrigin = nil
			return 
		end

		for i, o in pairs(m_points) do
			for k, v in pairs(p_Hitbox) do
				local hitbox_c = best_target:get_hitbox_position(v)
				local new_pointer = Extrapolate(best_target, predict_tick, hitbox_c)
				local dmg = utils.trace_bullet(me, o, new_pointer)
				if dmg > math.min(min_damage, best_target["m_iHealth"]) then
					table.insert(p_List, {
						vec = o,
						damage = dmg,
						TARGET = best_target,
						enemy_vec = new_pointer
					})
				end
			end

			if limitation and #p_List >= limitation_max then
				break
			end
		end
	end

	table.sort(p_List, function(a, b)
		if sort_type == "Risky" then
			return a.damage > b.damage
		else
			return a.damage < b.damage
		end
	end)

	for i, o in pairs(p_List) do
		if not o.TARGET:is_alive() then
			table.remove(p_List, i)
		end
	end

	local debug_point = me:get_origin().z
	if #p_List >= 1 then
		local lib = p_List[1]
		local vec = lib.vec
		local damage = lib.damage 
		local e_vec = lib.enemy_vec
		local new_debug = vector(vec.x, vec.y, debug_point + 5)
		local debug_2d1 = render.world_to_screen(new_debug)
		local debug_color = (data.SmartPeekMovement and data.SmartPeekWorking) and Elements.SmartPeekActivateColor:get() or Elements.SmartPeekColor:get()
		if debug_2d1 == nil then
			return
		end

		if Elements.SmartPeekDebugger:get(2)  then
			local debug_2d2 = render.world_to_screen(e_vec)
			if debug_2d2 then
				render.line(debug_2d1, debug_2d2, debug_color)
			end
		end

		if debug_2d1.y ~= nil then
			debug_2d1.y = debug_2d1.y - 12
		end

		data.SmartPeekWorking = true
		data.SmartPeekWorkingOrigin = vec
		local render_text = tostring(math.floor(damage))
		render.text(1, debug_2d1, debug_color, "c", render_text)
	else
		data.SmartPeekWorking = false
		data.SmartPeekWorkingOrigin = nil
	end
end

local OnRoundEnd = function()
	data.RoundState = false
end

local OnRoundStart = function()
	data.RoundState = true
end

local OnAimFire = function(e)
	data.SmartPeekMovement = false
end

local SetMovement = function(cmd, desired_pos)
	local local_player = entity.get_local_player()
	local original = local_player["m_vecOrigin"]
	local movement_pointer = VectorToAngles(original, desired_pos)
	cmd.sidemove = 0
	cmd.in_back = false
	cmd.in_speed = false
	cmd.in_forward = true
	cmd.in_moveleft = false
	cmd.forwardmove = 800
	cmd.in_moveright = false
	cmd.move_yaw = movement_pointer.y
end

local SmartPeekRetreat = function(cmd)
	local me = entity.get_local_player()
	local master_switch = Elements.MasterSwitch:get() and Elements.MasterSwitchKey:get() and Elements.OnShotPeekSettings:get(3)
	if not me or not me:is_alive() or not master_switch then
		return
	end

	local is_left = cmd.in_moveleft
	local is_backward = cmd.in_back
	local is_right = cmd.in_moveright
	local is_forward = cmd.in_forward
	if Elements.SmartPeekKey:get() then
		local my_weapon = me:get_player_weapon()
		if not my_weapon then 
			return 
		end

		local in_air = Air(me)
		local timer = globals.curtime
		local original_pos = me:get_origin()
		local WeaponIndex = my_weapon:get_weapon_index()
		local ScopedWeapon = (WeaponIndex == 40 or WeaponIndex == 38 or WeaponIndex == 9 or WeaponIndex == 11)
		local can_attack = (me["m_flNextAttack"] <= globals.curtime and my_weapon["m_flNextPrimaryAttack"] <= globals.curtime)
		local ShouldMovement = not ScopedWeapon or (ScopedWeapon and me["m_bIsScoped"]) or (not Elements.SmartPeekScopedDetected:get())
		if math.abs(original_pos.x - data.SmartPeekOrigin.x) <= 10 then
			data.SmartPeekMovement = true
		end

		if not can_attack then
			data.SmartPeekMovement = false 
		end

		if not ShouldMovement then
			data.SmartPeekWorking = false
			data.SmartPeekMovement = false
		end

		if not in_air and data.SmartPeekWorking and data.SmartPeekMovement and data.SmartPeekWorkingOrigin then
			SetMovement(cmd, data.SmartPeekWorkingOrigin)
			data.Reference.PeekAssistMode:set({"On Shot"})
		elseif not in_air and not is_forward and not is_backward and not is_left and not is_right and data.SmartPeekWorking then
			SetMovement(cmd, data.SmartPeekWorkingOrigin)
			data.Reference.PeekAssistMode:set({"On Shot", "On Key Release"})
		else
			data.Reference.PeekAssistMode:set({"On Shot", "On Key Release"})
		end
	end
end

local OnCreateMove = function(e)
	local local_player = entity.get_local_player()
	local MasterSwitch = Elements.MasterSwitch:get() and Elements.MasterSwitchKey:get()
	if not MasterSwitch or not local_player or not local_player:is_alive() then
		data.Should = true
		data.RefineShot.State = false
		if not MasterSwitch and data.Success then
			data.Success = false
			data.Reference.OnShot:set(false)
		end

		return
	end

	if not data.State then
		data.State = true
		data.PrevSettings = data.Reference.OnShotOptions:get()
		return
	end

	local Weapon = local_player:get_player_weapon()
	local OnPeekLag = Elements.OnShotPeekLag:get()
	local OnPeekStyle = Elements.OnShotPeekStyle:get()
	local OnShotStyle = data.OptionsConvar[OnPeekStyle]
	if OnPeekStyle == "Anti-Defensive" then
		data.Reference.Backtrack:set(0)
	end

	if Weapon then
		local WeaponIndex = Weapon:get_weapon_index()
		local WeaponTimer = Weapon["m_fLastShotTime"]
		if WeaponIsGrenade(Weapon) or WeaponIsGrenade(Weapon) then
			return
		end

		if not data.Success then
			data.Success = true
			data.RefineShot.State = false
			data.RefineShot.Timer = WeaponTimer
		end

		if data.RefineShot.Index ~= WeaponIndex then
			data.RefineShot.Timer = WeaponTimer
			data.RefineShot.Index = WeaponIndex
			data.RefineShot.Ticks = globals.tickcount
		end

		if data.RefineShot.Timer ~= WeaponTimer then
			data.RefineShot.State = true
			data.RefineShot.Timer = WeaponTimer
			data.RechargedTimer = globals.curtime
			data.RefineShot.Ticks = globals.tickcount
		end
	end

	if Elements.OnShotPeekSettings:get(4) and Elements.ClientLagCompSationState:get() == 0 then
		OnShotStyle = "Favor Fire Rate"
	end

	if data.Should then
		data.Reference.OnShot:set(true)
		if Elements.OnShotPeekSettings:get(2) and not data.FreestandingSuccess then
			data.FreestandingSuccess = true
			data.Reference.Freestanding:set(true)
		end

	elseif not data.Should then
		if Weapon then
			local WeaponInfo = Weapon:get_weapon_info()
			local CanNextAttackTimer = (globals.curtime - Weapon["m_flNextPrimaryAttack"])
			local NextAttackAmount = math.abs(1 - (math.abs(CanNextAttackTimer) / WeaponInfo.cycle_time))
			if CanNextAttackTimer < 0 and NextAttackAmount >= 0.98 then
				if data.FreestandingSuccess then
					data.FreestandingSuccess = false
					data.Reference.Freestanding:set(false)
				end

				if Elements.OnShotPeekSettings:get(1) then
					e.in_duck = false
					e.in_jump = false
					e.block_movement = 2
					data.Reference.OnShot:set(true)
					if (globals.curtime - data.RechargedTimer) > WeaponInfo.cycle_time then
						data.Should = true
					end
				else
					data.Should = true
				end
			end
		end
	end

	if OnPeekLag == "Off" and data.RefineShot.State then
		data.Should = false
		data.RefineShot.State = false
		data.Reference.OnShot:set(false)
	elseif OnPeekLag == "Peek" and data.RefineShot.State and (globals.tickcount - data.RefineShot.Ticks) > 10 then
		data.Should = false
		data.RefineShot.State = false
		data.Reference.OnShot:set(false)
	end

	SmartPeekRetreat(e)
	data.Reference.OnShotOptions:set(OnShotStyle)
end

local OnCreateMoveRun = function(e)
	local me = entity.get_local_player()
	if not me or not me:is_alive() then
		return
	end

	local camera_pos = render.camera_angles()
	local hitbox_pos = me:get_hitbox_position(3)
	local smart_peek_key = Elements.SmartPeekKey:get()
	local MasterSwitch = Elements.MasterSwitch:get() and Elements.MasterSwitchKey:get()
	if not smart_peek_key or Elements.SmartPeekUnlock:get() or not MasterSwitch then
		data.SmartPeekView = vector(camera_pos.x, camera_pos.y, 0)
	end

	if not smart_peek_key then
		data.SmartPeekOrigin = hitbox_pos
	end
end

local OnRender = function()
	local local_player = entity.get_local_player()
	local AliveState = local_player and local_player:is_alive()
	local CurrentTimer = (common.get_timestamp() / 1000)
	local ClientLagCompSation = CHelpers.Cvar("cl_lagcompensation")
	local MasterSwitch = Elements.MasterSwitch:get() and Elements.MasterSwitchKey:get()
	if not globals.is_in_game then
		data.SuccessToCallAlive = false
	end

	if data.ConnectedState ~= AliveState then
		data.ConnectedState = AliveState
		if AliveState then
			data.RoundState = true
			data.SuccessToCallAlive = true
		end
	end

	if Elements.OnShotPeekSettings:get(4) then
		if data.RoundState and data.Success and data.ConnectedState then
			local ClientLagCompSationState = Elements.ClientLagCompSationState:get()
			if ClientLagCompSationState == 0 then
				ClientLagCompSation:bypass(true)
				if ClientLagCompSation.CvarFlag.flags == 0 then
					ClientLagCompSation:int(0)
					if MasterSwitch then
						data.Reference.Backtrack:set(0)
					end
				end
			else
				ClientLagCompSation:int(1)
				ClientLagCompSation:stored()
				ClientLagCompSation:bypass(false)
			end

		elseif not data.RoundState or not data.Success or not data.ConnectedState then
			ClientLagCompSation:stored()
			ClientLagCompSation:bypass(false)
		end
	else
		ClientLagCompSation:stored()
		ClientLagCompSation:bypass(false)
	end

	if not MasterSwitch or not AliveState then
		return
	end

	SmartPeekCalculate()
	local smart_peek = Elements.OnShotPeekSettings:get(3)
	local master_switch = Elements.MasterSwitch:get() and Elements.MasterSwitchKey:get()
	if Elements.OnShotPeekFactionIndication:get() and (smart_peek and Elements.SmartPeekKey:get()) or not (smart_peek and Elements.MasterSwitchKey:get()) then
		local Weapon = local_player:get_player_weapon()
		if Weapon then
			local WeaponInfo = Weapon:get_weapon_info()
			local StartFactionColor = Elements.OnShotPeekFactionIndicationColor:get()
			local CanNextAttackTimer = (globals.curtime - Weapon["m_flNextPrimaryAttack"])
			local TargetFactionColor = Elements.OnShotPeekFactionIndicationDifferentColor:get()
			local NextAttackAmount = CanNextAttackTimer < 0 and math.abs(1 - (math.abs(CanNextAttackTimer) / WeaponInfo.cycle_time)) or 1
			local MinAmountColor = color(
				math.min(StartFactionColor.r, TargetFactionColor.r),
				math.min(StartFactionColor.g, TargetFactionColor.g),
				math.min(StartFactionColor.b, TargetFactionColor.b),
				math.min(StartFactionColor.a, TargetFactionColor.a)
			)

			local MaxAmountColor = color(
				math.max(StartFactionColor.r, TargetFactionColor.r),
				math.max(StartFactionColor.g, TargetFactionColor.g),
				math.max(StartFactionColor.b, TargetFactionColor.b),
				math.max(StartFactionColor.a, TargetFactionColor.a)
			)

			local CurrentFactionColor = color(
				math.clamp(MaxAmountColor.r - (math.max(0, MaxAmountColor.r - MinAmountColor.r) * NextAttackAmount), 0, 255),
				math.clamp(MaxAmountColor.g - (math.max(0, MaxAmountColor.g - MinAmountColor.g) * NextAttackAmount), 0, 255),
				math.clamp(MaxAmountColor.b - (math.max(0, MaxAmountColor.b - MinAmountColor.b) * NextAttackAmount), 0, 255),
				math.clamp(MaxAmountColor.a - (math.max(0, MaxAmountColor.a - MinAmountColor.a) * NextAttackAmount), 0, 255)
			)

			local current_text = ("%s %.1f"):format(Elements.OnShotPeekFactionIndicationText:get(), NextAttackAmount)
			local current_position = vector(Elements.OnShotPeekFactionIndicationX:get(), Elements.OnShotPeekFactionIndicationY:get())
			local current_text_size = render.measure_text(1, "s", current_text)
			render.text(1, current_position, CurrentFactionColor, "s", current_text)
			render.circle_outline(current_position - vector(10, - (current_text_size.y / 2)), CurrentFactionColor, 6, 0, NextAttackAmount, 2)
		end
	end
end

local OnShutDown = function()
	data.Reference.OnShot:set(false)
	data.Reference.OnShotOptions:set(data.PrevSettings)
	for name, cvar in pairs(data.CvarList) do
		cvar:stored()
	end
end

local CallBacks = {
	["render"] = function(e)
		OnRender(e)
	end,

	["aim_fire"] = function(e)
		OnAimFire(e)
	end,

	["shutdown"] = function(e)
		OnShutDown(e)
	end,

	["round_end"] = function(e)
		OnRoundEnd(e)
	end,

	["round_start"] = function(e)
		OnRoundStart(e)
	end,

	["createmove"] = function(e)
		OnCreateMove(e)
	end,

	["createmove_run"] = function(e)
		OnCreateMoveRun(e)
	end
}

local InitMain = function()
	HandleMain()
	SmartPeekCall()
	CHelpers.Cvar("sv_cheats"):int(1)
	MultiCallBack(Elements, HandleMain)
	for Name, Func in pairs(CallBacks) do
		events[Name]:set(Func)
	end
end

InitMain()