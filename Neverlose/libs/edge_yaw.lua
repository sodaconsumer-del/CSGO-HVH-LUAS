local reloaded_0_0 = {}

local function reloaded_0_1(arg_1_0, arg_1_1)
	local reloaded_1_0 = arg_1_1 - arg_1_0
	local reloaded_1_1 = -math.deg(math.atan2(reloaded_1_0.z, math.sqrt(reloaded_1_0.x^2 + reloaded_1_0.y^2)))
	local reloaded_1_2 = math.deg(math.atan2(reloaded_1_0.y, reloaded_1_0.x))

	return reloaded_1_1, reloaded_1_2
end

function reloaded_0_0.get()
	local reloaded_2_0 = entity.get_local_player()
	local reloaded_2_1 = reloaded_2_0:get_eye_position()
	local reloaded_2_2 = render.camera_angles():angles()
	local reloaded_2_3 = 8192
	local reloaded_2_4

	for iter_2_0 = reloaded_2_2.y - 180, reloaded_2_2.y + 180, 15 do
		local reloaded_2_5 = math.rad(iter_2_0)
		local reloaded_2_6 = vector(reloaded_2_1.x + math.cos(reloaded_2_5) * 100, reloaded_2_1.y + math.sin(reloaded_2_5) * 100, reloaded_2_1.z)
		local reloaded_2_7 = utils.trace_line(reloaded_2_1, reloaded_2_6, reloaded_2_0, 1174421515)

		if reloaded_2_3 > reloaded_2_7.fraction * 100 then
			reloaded_2_3 = reloaded_2_7.fraction * 100
			reloaded_2_4 = reloaded_2_6
		end
	end

	if reloaded_2_3 > 30 then
		return
	end

	local reloaded_2_8, reloaded_2_9 = reloaded_0_1(reloaded_2_1, reloaded_2_4)
	local reloaded_2_10 = math.normalize_yaw(reloaded_2_2.y - 180)

	return (math.normalize_yaw(reloaded_2_9 - reloaded_2_10))
end

return reloaded_0_0
