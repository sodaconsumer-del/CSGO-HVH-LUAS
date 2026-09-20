local function reloaded_0_0(arg_1_0)
	return 0.0054931640625 * bit.band(math.floor(arg_1_0 * 182.04444444444445), 65535)
end

local function reloaded_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0, arg_2_1 = reloaded_0_0(arg_2_0), reloaded_0_0(arg_2_1)

	local reloaded_2_0 = arg_2_0 - arg_2_1

	if arg_2_2 < 0 then
		arg_2_2 = -arg_2_2
	end

	if reloaded_2_0 < -180 then
		reloaded_2_0 = reloaded_2_0 + 360
	elseif reloaded_2_0 > 180 then
		reloaded_2_0 = reloaded_2_0 - 360
	end

	if arg_2_2 < reloaded_2_0 then
		arg_2_1 = arg_2_1 + arg_2_2
	elseif reloaded_2_0 < -arg_2_2 then
		arg_2_1 = arg_2_1 - arg_2_2
	else
		arg_2_1 = arg_2_0
	end

	return arg_2_1
end

local function reloaded_0_2(arg_3_0, arg_3_1)
	local reloaded_3_0 = math.fmod(arg_3_0 - arg_3_1, 360)

	if arg_3_1 < arg_3_0 then
		if reloaded_3_0 >= 180 then
			reloaded_3_0 = reloaded_3_0 - 360
		end
	elseif reloaded_3_0 <= -180 then
		reloaded_3_0 = reloaded_3_0 + 360
	end

	return reloaded_3_0
end

local function reloaded_0_3(arg_4_0, arg_4_1, arg_4_2)
	local reloaded_4_0 = arg_4_1 - arg_4_2
	local reloaded_4_1 = reloaded_4_0:length()

	if reloaded_4_1 <= arg_4_0 then
		if reloaded_4_1 >= -arg_4_0 then
			return arg_4_1
		else
			return arg_4_2 - reloaded_4_0 * (1 / (reloaded_4_1 + 1.1920929e-07)) * arg_4_0
		end
	else
		return arg_4_2 + reloaded_4_0 * (1 / (reloaded_4_1 + 1.1920929e-07)) * arg_4_0
	end
end

local function reloaded_0_4(arg_5_0, ...)
	local reloaded_5_0 = {}
	local reloaded_5_1 = {
		...
	}

	for iter_5_0 = 1, #reloaded_5_1 do
		table.insert(reloaded_5_0, reloaded_5_1[iter_5_0])
	end

	if reloaded_5_0[arg_5_0] == nil then
		return unpack(reloaded_5_1)
	end

	return reloaded_5_0[arg_5_0]
end

local reloaded_0_5 = {
	desync_exact = 0,
	desync = 0,
	server_feet_yaw = 0,
	feet_yaw = 0,
	abs_yaw = 0,
	tickbase = {
		shifting = 0,
		list = {}
	}
}

for iter_0_0 = 1, 16 do
	table.insert(reloaded_0_5.tickbase.list, 0)
end

local reloaded_0_6 = {
	speed = 0,
	walk_record = 0,
	duck_amount = 0,
	old_cache = {
		desync_exact = 0,
		desync = 0,
		server_feet_yaw = 0,
		feet_yaw = 0,
		abs_yaw = 0,
		tickbase = {
			shifting = 0,
			list = (function()
				local reloaded_6_0 = {}

				for iter_6_0 = 1, 16 do
					table.insert(reloaded_6_0, 0)
				end

				return reloaded_6_0
			end)()
		}
	}
}

local function reloaded_0_7()
	reloaded_0_5 = reloaded_0_6.old_cache
	reloaded_0_6.eye_yaw, reloaded_0_6.abs_yaw = nil
	reloaded_0_6.walk_record, reloaded_0_6.duck_amount, reloaded_0_6.speed = 0, 0, 0
end

local function reloaded_0_8()
	local reloaded_8_0 = entity.get_local_player()

	if not reloaded_8_0 or not reloaded_8_0:is_alive() then
		reloaded_0_7()

		return
	end

	local reloaded_8_1 = reloaded_8_0:get_anim_state()

	if not reloaded_8_1 or reloaded_8_1.last_update_time <= 0 then
		reloaded_0_7()

		return
	end

	if not reloaded_0_6.eye_yaw or not reloaded_0_6.abs_yaw then
		reloaded_0_6.eye_yaw = reloaded_8_1.eye_yaw
		reloaded_0_6.abs_yaw = reloaded_8_1.abs_yaw
	end

	if globals.choked_commands == 0 then
		reloaded_0_6.eye_yaw = reloaded_8_1.eye_yaw
		reloaded_0_6.duck_amount = reloaded_8_1.anim_duck_amount
		reloaded_0_6.walk_record = reloaded_8_1.walk_run_transition

		local reloaded_8_2 = vector()
		local reloaded_8_3 = reloaded_8_0.m_vecVelocity
		local reloaded_8_4 = reloaded_0_3(globals.tickinterval * 2000, reloaded_8_2, reloaded_8_3)

		reloaded_0_6.speed = math.min(reloaded_8_4:length(), 260)
	end

	local reloaded_8_5 = reloaded_8_0:get_player_weapon()
	local reloaded_8_6 = reloaded_8_5 and math.max(0.001, reloaded_8_5:get_weapon_info().max_player_speed) or 260
	local reloaded_8_7 = math.clamp(reloaded_0_6.speed / (reloaded_8_6 * 0.52), 0, 1)
	local reloaded_8_8 = (reloaded_0_6.walk_record * -0.3 - 0.2) * reloaded_8_7 + 1

	if reloaded_0_6.duck_amount > 0 then
		reloaded_8_8 = reloaded_8_8 + reloaded_0_6.duck_amount * math.clamp(reloaded_0_6.speed / (reloaded_8_6 * 0.34), 0, 1) * (0.5 - reloaded_8_8)
	end

	reloaded_0_6.abs_yaw = math.clamp(reloaded_0_6.abs_yaw, -360, 360)

	local reloaded_8_9 = reloaded_0_2(reloaded_0_6.eye_yaw, reloaded_0_6.abs_yaw)
	local reloaded_8_10 = reloaded_8_8 * 58
	local reloaded_8_11 = reloaded_8_8 * -58

	if reloaded_8_9 <= reloaded_8_10 then
		if reloaded_8_9 < reloaded_8_11 then
			reloaded_0_6.abs_yaw = math.abs(reloaded_8_11) + reloaded_0_6.eye_yaw
		end
	else
		reloaded_0_6.abs_yaw = reloaded_0_6.eye_yaw - math.abs(reloaded_8_10)
	end

	if reloaded_0_6.speed > 0.1 then
		reloaded_0_6.abs_yaw = reloaded_0_1(reloaded_0_6.eye_yaw, math.normalize_yaw(reloaded_0_6.abs_yaw), (reloaded_0_6.walk_record * 20 + 30) * globals.tickinterval)
	else
		reloaded_0_6.abs_yaw = reloaded_0_1(reloaded_8_0.m_flLowerBodyYawTarget, math.normalize_yaw(reloaded_0_6.abs_yaw), globals.tickinterval * 100)
	end

	if globals.choked_commands == 0 then
		local reloaded_8_12 = math.abs(reloaded_0_2(reloaded_8_1.eye_yaw, reloaded_8_1.abs_yaw))

		reloaded_0_5.abs_yaw = reloaded_8_1.eye_yaw
		reloaded_0_5.feet_yaw = reloaded_8_1.abs_yaw
		reloaded_0_5.server_feet_yaw = reloaded_0_6.abs_yaw
		reloaded_0_5.desync_exact = reloaded_0_2(reloaded_0_6.abs_yaw, reloaded_8_1.abs_yaw)
		reloaded_0_5.desync = math.clamp(reloaded_0_5.desync_exact, -reloaded_8_12, reloaded_8_12)
	end
end

events.render:set(reloaded_0_8)

local function reloaded_0_9()
	local reloaded_9_0 = entity.get_local_player()

	if not reloaded_9_0 or not reloaded_9_0:is_alive() then
		return
	end

	local reloaded_9_1 = math.max(unpack(reloaded_0_5.tickbase.list))

	reloaded_0_5.tickbase.shifting = reloaded_9_1 < 0 and math.abs(reloaded_9_1) or 0

	table.insert(reloaded_0_5.tickbase.list, reloaded_9_0.m_flSimulationTime / globals.tickinterval - globals.tickcount)
	table.remove(reloaded_0_5.tickbase.list, 1)
end

events.net_update_start:set(reloaded_0_9)

local function reloaded_0_10(arg_10_0)
	return globals.curtime - arg_10_0 * globals.tickinterval
end

local function reloaded_0_11()
	local reloaded_11_0 = entity.get_local_player()

	if not reloaded_11_0 or not reloaded_11_0:is_alive() then
		return false
	end

	local reloaded_11_1 = reloaded_11_0:get_player_weapon()

	if not reloaded_11_1 then
		return false
	end

	if reloaded_11_0.m_flNextAttack > reloaded_0_10(16) then
		return false
	end

	if reloaded_11_1.m_flNextPrimaryAttack > reloaded_0_10(0) then
		return false
	end

	return true
end

local function reloaded_0_12()
	local reloaded_12_0 = entity.get_local_player()

	if not reloaded_12_0 or not reloaded_12_0:is_alive() then
		return 0
	end

	local reloaded_12_1 = reloaded_12_0:get_player_weapon()

	if not reloaded_12_1 then
		return 0
	end

	if reloaded_0_5.tickbase.shifting == 0 then
		return 0
	end

	local reloaded_12_2 = reloaded_12_0.m_flNextAttack - 0.75
	local reloaded_12_3 = reloaded_12_1.m_flNextPrimaryAttack - 1
	local reloaded_12_4 = math.abs(globals.curtime - math.max(reloaded_12_2, reloaded_12_3))

	return math.clamp(reloaded_12_4, 0, 1)
end

return {
	get_abs_yaw = function()
		return reloaded_0_5.abs_yaw
	end,
	get_body_yaw = function(arg_14_0)
		return reloaded_0_4(arg_14_0, reloaded_0_5.feet_yaw, reloaded_0_5.server_feet_yaw)
	end,
	get_desync_delta = function(arg_15_0)
		return reloaded_0_4(arg_15_0, reloaded_0_5.desync, reloaded_0_5.desync_exact)
	end,
	get_inverter_state = function(arg_16_0)
		return reloaded_0_4(arg_16_0, reloaded_0_5.desync, reloaded_0_5.desync_exact) <= 0 and true or false
	end,
	get_exploit_charge = function()
		return reloaded_0_12()
	end,
	get_tickbase_value = function()
		return reloaded_0_5.tickbase.shifting
	end,
	get_doubletap_state = function()
		return reloaded_0_11() and reloaded_0_5.tickbase.shifting > 0
	end,
	get_overlap = function(arg_20_0)
		local reloaded_20_0 = reloaded_0_5.feet_yaw
		local reloaded_20_1 = reloaded_0_5.server_feet_yaw
		local reloaded_20_2 = reloaded_0_2(reloaded_0_5.abs_yaw, reloaded_0_5.feet_yaw)

		if type(arg_20_0) == "number" then
			reloaded_20_0 = math.clamp(arg_20_0, reloaded_0_5.abs_yaw - math.abs(reloaded_20_2), reloaded_0_5.abs_yaw + math.abs(reloaded_20_2))
		end

		if arg_20_0 then
			reloaded_20_0 = reloaded_0_5.abs_yaw + reloaded_20_2
		end

		return 1 - math.abs(reloaded_0_2(reloaded_20_0, reloaded_20_1)) / 120 * 1, reloaded_20_0
	end
}
