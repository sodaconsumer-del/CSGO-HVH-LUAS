local reloaded_0_0 = {}
local reloaded_0_1 = 1
local reloaded_0_2 = {}

reloaded_0_2.__index = reloaded_0_2

function reloaded_0_2.create(arg_1_0, arg_1_1, arg_1_2, ...)
	local reloaded_1_0 = {
		...
	}

	if type(arg_1_1) == "function" then
		reloaded_1_0 = {
			arg_1_2,
			...
		}
		arg_1_2 = arg_1_1
		arg_1_1 = false
	end

	if arg_1_1 then
		arg_1_2(unpack(reloaded_1_0))
	end

	local reloaded_1_1 = setmetatable({
		active = true,
		forced_old_time = 0,
		forced_delay = 0,
		forced_call = false,
		timer_id = reloaded_0_1,
		callback = arg_1_2,
		args = reloaded_1_0,
		update_time = arg_1_0,
		old_time = common.get_timestamp()
	}, reloaded_0_2)

	reloaded_0_0[reloaded_0_1] = reloaded_1_1
	reloaded_0_1 = reloaded_0_1 + 1

	return reloaded_1_1
end

function reloaded_0_2.set_update_time(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.update_time = arg_2_1

	if arg_2_2 then
		arg_2_0.old_time = common.get_timestamp()
	end
end

function reloaded_0_2.force_call(arg_3_0, arg_3_1)
	if arg_3_1 then
		arg_3_0.forced_delay = arg_3_1
		arg_3_0.forced_old_time = common.get_timestamp()
		arg_3_0.forced_call = true
	else
		arg_3_0.callback(unpack(arg_3_0.args))

		arg_3_0.old_time = common.get_timestamp()
	end
end

function reloaded_0_2.start(arg_4_0)
	arg_4_0.active = true
end

function reloaded_0_2.stop(arg_5_0)
	arg_5_0.active = false
end

function reloaded_0_2.delete(arg_6_0)
	reloaded_0_0[arg_6_0.timer_id] = nil
end

events.render:set(function(arg_7_0)
	for iter_7_0, iter_7_1 in pairs(reloaded_0_0) do
		local reloaded_7_0 = common.get_timestamp()

		if not iter_7_1.forced_call and reloaded_7_0 >= iter_7_1.old_time + iter_7_1.update_time and iter_7_1.active then
			iter_7_1.callback(unpack(iter_7_1.args))

			iter_7_1.old_time = reloaded_7_0
		elseif iter_7_1.forced_call and reloaded_7_0 >= iter_7_1.forced_old_time + iter_7_1.forced_delay then
			iter_7_1.callback(unpack(iter_7_1.args))

			iter_7_1.old_time = reloaded_7_0
			iter_7_1.forced_call = false
		end
	end
end)

return reloaded_0_2
