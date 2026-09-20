local reloaded_0_0 = cvar.sv_maxunlag
local reloaded_0_1 = ffi.cast("uint32_t*", utils.opcode_scan("engine.dll", "03 05 ? ? ? ? 83 CF 10", 2))
local reloaded_0_2 = ffi.cast("uint32_t*", utils.opcode_scan("engine.dll", "2B 05 ? ? ? ? 03 05 ? ? ? ? 83 CF 10", 2))

local function reloaded_0_3(arg_1_0, arg_1_1)
	local reloaded_1_0 = {}

	reloaded_1_0[#reloaded_1_0 + 1] = arg_1_1

	for iter_1_0, iter_1_1 in pairs(arg_1_0) do
		if iter_1_1 ~= nil then
			reloaded_1_0[#reloaded_1_0 + 1] = iter_1_1
		end
	end

	return reloaded_1_0
end

local reloaded_0_4

;(function()
	local reloaded_2_0 = {}

	local function reloaded_2_1(arg_3_0)
		assert(type(arg_3_0) == "function", "callback has to be a function")

		local reloaded_3_0 = false

		for iter_3_0, iter_3_1 in pairs(reloaded_2_0) do
			if iter_3_1 == arg_3_0 then
				reloaded_3_0 = true

				break
			end
		end

		if reloaded_3_0 then
			error("the function callback is already registered", 3)
		end

		table.insert(reloaded_2_0, arg_3_0)
	end

	local function reloaded_2_2(arg_4_0)
		assert(type(arg_4_0) == "function", "callback has to be a function")

		for iter_4_0, iter_4_1 in pairs(reloaded_2_0) do
			if iter_4_1 == arg_4_0 then
				table.remove(reloaded_2_0, iter_4_0)

				return true
			end
		end

		return false
	end

	local function reloaded_2_3()
		return reloaded_2_0
	end

	local function reloaded_2_4(...)
		local reloaded_6_0 = false

		for iter_6_0, iter_6_1 in ipairs(reloaded_2_0) do
			local reloaded_6_1, reloaded_6_2 = pcall(iter_6_1, ...)

			if reloaded_6_1 == true and reloaded_6_2 == true then
				reloaded_6_0 = true

				break
			end
		end

		return reloaded_6_0
	end

	reloaded_0_4 = {
		register = reloaded_2_1,
		unregister = reloaded_2_2,
		fire_callback = reloaded_2_4,
		get_list = reloaded_2_3
	}
end)()

local reloaded_0_5 = new_class():struct("lagrecord")({
	local_player_tickbase = 0,
	estimated_tickbase = 0,
	data = {},
	purge = function(arg_7_0, arg_7_1)
		if arg_7_1 == nil then
			arg_7_0.estimated_tickbase = 0
			arg_7_0.local_player_tickbase = 0
			arg_7_0.data = {}

			return
		end

		arg_7_0.data[arg_7_1:get_index()] = {}
	end,
	track_time = function(arg_8_0, arg_8_1)
		arg_8_0.estimated_tickbase = globals.estimated_tickbase

		if arg_8_1.choked_commands == 0 then
			arg_8_0.local_player_tickbase = entity.get_local_player().m_nTickBase
		end
	end,
	get_server_time = function(arg_9_0, arg_9_1)
		local reloaded_9_0 = globals.client_tick + globals.clock_offset

		if reloaded_0_1 ~= nil and reloaded_0_2 ~= nil then
			local reloaded_9_1 = reloaded_0_1[0] - reloaded_0_2[0]
			local reloaded_9_2 = math.floor(1 / globals.tickinterval) / 8

			if reloaded_9_1 > 0 and reloaded_9_1 < reloaded_9_2 then
				reloaded_9_0 = reloaded_9_0 + reloaded_9_1
			end
		end

		return arg_9_1 ~= true and to_time(reloaded_9_0) or reloaded_9_0
	end,
	get_player_time = function(arg_10_0, arg_10_1, arg_10_2)
		assert(arg_10_1 ~= nil and arg_10_1.get_simulation_time ~= nil, "invalid player")

		if arg_10_1 == entity.get_local_player() then
			local reloaded_10_0 = arg_10_0.local_player_tickbase

			return arg_10_2 ~= true and to_time(reloaded_10_0) or reloaded_10_0
		end

		local reloaded_10_1 = arg_10_1:get_simulation_time().current

		return arg_10_2 == true and arg_10_0:to_ticks(reloaded_10_1) or reloaded_10_1
	end,
	get_dead_time = function(arg_11_0, arg_11_1)
		local reloaded_11_0 = reloaded_0_0:float()
		local reloaded_11_1 = utils.net_channel().latency[0]
		local reloaded_11_2 = to_time(arg_11_0.estimated_tickbase) - reloaded_11_1 - reloaded_11_0

		return arg_11_1 == true and to_ticks(reloaded_11_2) or reloaded_11_2
	end,
	verify_records = function(arg_12_0, arg_12_1, arg_12_2)
		if arg_12_1 == nil or arg_12_1.records == nil or arg_12_1.localdata == nil then
			return
		end

		local reloaded_12_0 = arg_12_1.records
		local reloaded_12_1 = arg_12_1.localdata
		local reloaded_12_2 = reloaded_12_0[1] and reloaded_12_0[1].origin
		local reloaded_12_3 = reloaded_12_1.allow_updates

		for iter_12_0, iter_12_1 in ipairs(reloaded_12_0) do
			local reloaded_12_4 = iter_12_0 ~= 1

			if reloaded_12_3 == false then
				reloaded_12_4 = true
			end

			if is_alive == false then
				rawset(reloaded_12_0, iter_12_0, nil)
			elseif reloaded_12_4 == true and reloaded_12_2 then
				if arg_12_2 >= iter_12_1.simulation_time then
					rawset(reloaded_12_0, iter_12_0, nil)
				elseif reloaded_12_2:distsqr(iter_12_1.origin) > 4096 then
					for iter_12_2 = 2, #reloaded_12_0 do
						rawset(reloaded_12_0, iter_12_2, nil)
					end

					break
				end
			end
		end
	end,
	on_net_update = function(arg_13_0, arg_13_1, arg_13_2, arg_13_3)
		assert(arg_13_1 ~= nil and arg_13_1.get_simulation_time ~= nil, "invalid player")

		local reloaded_13_0 = arg_13_1:get_index()
		local reloaded_13_1 = arg_13_1:get_origin()
		local reloaded_13_2 = arg_13_1:is_alive()

		arg_13_0.data[reloaded_13_0] = arg_13_0.data[reloaded_13_0] or new_class():struct("records")({}):struct("localdata")({
			allow_updates = false,
			cycle = 0,
			last_animated_simulation = 0,
			updated_this_frame = false,
			no_entry = vector()
		})

		local reloaded_13_3 = arg_13_0.data[reloaded_13_0]
		local reloaded_13_4 = reloaded_13_3.records
		local reloaded_13_5 = reloaded_13_3.localdata
		local reloaded_13_6 = arg_13_0:get_player_time(arg_13_1)

		reloaded_13_5.allow_updates = reloaded_0_4.fire_callback(arg_13_1)
		reloaded_13_5.updated_this_frame = false

		if reloaded_13_5.allow_updates == false or reloaded_13_2 == false or arg_13_1:is_dormant() == true then
			-- block empty
		else
			local reloaded_13_7 = reloaded_13_4[1] and math.max(0, to_ticks(reloaded_13_4[1].simulation_time - reloaded_13_6)) or 0

			if reloaded_13_7 > 0 and reloaded_13_5.no_entry.x == 0 then
				reloaded_13_5.no_entry.y = reloaded_13_7
			elseif reloaded_13_7 <= 0 then
				reloaded_13_5.no_entry.y = 0
			end

			reloaded_13_5.cycle = reloaded_13_4[1] and math.max(0, arg_13_2 - reloaded_13_4[1].tick - 1) or 0
			reloaded_13_5.no_entry.x = reloaded_13_7
			reloaded_13_5.last_animated_simulation = reloaded_13_6

			if reloaded_13_4[1] and reloaded_13_6 <= reloaded_13_4[1].simulation_time then
				-- block empty
			else
				reloaded_13_5.updated_this_frame = true

				rawset(reloaded_13_3, "records", reloaded_0_3(reloaded_13_4, {
					tick = arg_13_2,
					shifting = to_ticks(reloaded_13_6) - arg_13_2 - 1,
					elapsed = math.clamp(reloaded_13_4[1] and arg_13_2 - reloaded_13_4[1].tick - 1 or 0, 0, 72),
					choked = math.clamp(reloaded_13_4[1] and to_ticks(reloaded_13_6 - reloaded_13_4[1].simulation_time) - 1 or 0, 0, 72),
					origin = reloaded_13_1,
					origin_old = reloaded_13_4[1] and reloaded_13_4[1].origin or reloaded_13_1,
					simulation_time = reloaded_13_6,
					simulation_time_old = reloaded_13_4[1] and reloaded_13_4[1].simulation_time or reloaded_13_6,
					angles = arg_13_1:get_angles(),
					eye_position = arg_13_1:get_eye_position(),
					volume = {
						arg_13_1.m_vecMins,
						arg_13_1.m_vecMaxs
					}
				}))
				events.entity_update:call({
					tick = arg_13_2,
					index = reloaded_13_0,
					entity = arg_13_1
				})
			end
		end

		arg_13_0:verify_records(reloaded_13_3, arg_13_3)
	end
}):struct("output")({
	get_player_idx = function(arg_14_0, ...)
		local reloaded_14_0 = {
			...
		}

		if #reloaded_14_0 == 0 then
			local reloaded_14_1 = entity.get_local_player()

			if reloaded_14_1 == nil then
				return
			end

			return reloaded_14_1:get_index()
		end

		local reloaded_14_2 = reloaded_14_0[1]
		local reloaded_14_3 = type(reloaded_14_2)

		if reloaded_14_2 == nil or reloaded_14_3 == "nil" then
			return
		end

		if reloaded_14_3 == "userdata" and reloaded_14_2.get_index then
			return reloaded_14_2:get_index()
		end

		if reloaded_14_3 == "userdata" or reloaded_14_3 == "cdata" or reloaded_14_3 == "number" then
			local reloaded_14_4 = entity.get(reloaded_14_2)

			if reloaded_14_4 == nil then
				return
			end

			return reloaded_14_4:get_index()
		end

		return nil
	end,
	get_player_data = function(arg_15_0, ...)
		local reloaded_15_0 = arg_15_0:get_player_idx(...)

		if reloaded_15_0 == nil then
			return
		end

		local reloaded_15_1 = arg_15_0.lagrecord.data[reloaded_15_0]

		if reloaded_15_1 == nil or reloaded_15_1.localdata == nil or reloaded_15_1.records == nil then
			return
		end

		return reloaded_15_1
	end,
	get_all = function(arg_16_0, ...)
		local reloaded_16_0 = arg_16_0:get_player_data(...)

		if reloaded_16_0 == nil then
			return
		end

		return reloaded_16_0.records
	end,
	get_record = function(arg_17_0, ...)
		local reloaded_17_0 = arg_17_0:get_player_data(...)

		if reloaded_17_0 == nil then
			return
		end

		return reloaded_17_0.records[({
			...
		})[2] or 1]
	end,
	get_snapshot = function(arg_18_0, ...)
		local reloaded_18_0 = arg_18_0:get_player_data(...)

		if reloaded_18_0 == nil then
			return
		end

		local reloaded_18_1 = ({
			...
		})[2] or 1
		local reloaded_18_2 = reloaded_18_0.records[reloaded_18_1]

		if reloaded_18_2 == nil then
			return
		end

		return {
			id = reloaded_18_1,
			tick = reloaded_18_2.tick,
			updated_this_frame = reloaded_18_0.localdata.updated_this_frame,
			origin = {
				angles = reloaded_18_2.angles,
				volume = reloaded_18_2.volume,
				current = reloaded_18_2.origin,
				previous = reloaded_18_2.origin_old,
				change = reloaded_18_2.origin:distsqr(reloaded_18_2.origin_old)
			},
			simulation_time = {
				animated = reloaded_18_0.localdata.last_animated_simulation,
				current = reloaded_18_2.simulation_time,
				previous = reloaded_18_2.simulation_time_old,
				change = reloaded_18_2.simulation_time - reloaded_18_2.simulation_time_old
			},
			command = {
				elapsed = reloaded_18_2.elapsed,
				choke = reloaded_18_2.choked,
				cycle = reloaded_18_0.localdata.cycle,
				shifting = reloaded_18_2.shifting,
				no_entry = reloaded_18_0.localdata.no_entry
			}
		}, reloaded_18_2
	end,
	get_server_time = function(arg_19_0, ...)
		return arg_19_0.lagrecord:get_server_time(...)
	end
})

events.level_init:set(function()
	reloaded_0_5.lagrecord:purge()
end)
events.createmove:set(function(arg_21_0)
	reloaded_0_5.lagrecord:track_time(arg_21_0)
end)
events.net_update_end:set(function()
	local reloaded_22_0 = reloaded_0_5.lagrecord
	local reloaded_22_1 = entity.get_local_player()
	local reloaded_22_2 = reloaded_22_0:get_server_time(true)
	local reloaded_22_3 = reloaded_22_0:get_dead_time(false)

	if reloaded_22_1 == nil or globals.is_in_game == false then
		reloaded_22_0:purge()

		return
	end

	if reloaded_22_1:is_alive() == false then
		reloaded_22_0.estimated_tickbase = globals.client_tick + globals.clock_offset
	end

	entity.get_players(false, true, function(arg_23_0)
		reloaded_22_0:on_net_update(arg_23_0, reloaded_22_2, reloaded_22_3)
	end)
end)

local reloaded_0_6 = {
	set_update_callback = function(...)
		return reloaded_0_4.register(...)
	end,
	unset_update_callback = function(...)
		return reloaded_0_4.unregister(...)
	end,
	get_player_data = function(...)
		return reloaded_0_5.output:get_player_data(...)
	end,
	get_all = function(...)
		return reloaded_0_5.output:get_all(...)
	end,
	get_record = function(...)
		return reloaded_0_5.output:get_record(...)
	end,
	get_snapshot = function(...)
		return reloaded_0_5.output:get_snapshot(...)
	end,
	get_server_time = function(...)
		return reloaded_0_5.output:get_server_time(...)
	end
}

local function reloaded_0_7()
	return bit.lshift(utils.random_int(65535, math.huge), 64)
end

local reloaded_0_8
local reloaded_0_9 = reloaded_0_7

events.render:set(function()
	reloaded_0_9 = reloaded_0_7()
end)

return setmetatable({}, {
	__metatable = false,
	__pow = function(arg_33_0, arg_33_1)
		return reloaded_0_9 == arg_33_1 and reloaded_0_6 or error("security measurement failure", 2)
	end,
	__index = function(arg_34_0, arg_34_1)
		return arg_34_1 == "SIGNED" and reloaded_0_9 or error("security measurement failure", 2)
	end
})
