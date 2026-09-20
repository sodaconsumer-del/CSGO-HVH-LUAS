local reloaded_0_0 = {}
local reloaded_0_1 = -1

events.createmove:set(function(arg_1_0)
	local reloaded_1_0 = entity.get_local_player()
	local reloaded_1_1 = reloaded_1_0.m_vecVelocity.x
	local reloaded_1_2 = reloaded_1_0.m_vecVelocity.y
	local reloaded_1_3 = reloaded_1_0:get_origin()
	local reloaded_1_4 = 1 / globals.tickinterval

	if arg_1_0.choked_commands == 0 then
		reloaded_0_0[#reloaded_0_0 + 1] = reloaded_1_3

		if reloaded_1_4 <= #reloaded_0_0 then
			local reloaded_1_5 = reloaded_0_0[reloaded_1_4]

			if math.sqrt(reloaded_1_1^2 + reloaded_1_2^2) > 255 and (reloaded_1_3 - reloaded_1_5):lengthsqr() < 4096 then
				reloaded_0_1 = 0
			elseif (reloaded_1_3 - reloaded_1_5):lengthsqr() > 4096 then
				reloaded_0_1 = 1
			else
				reloaded_0_1 = -1
			end
		end
	end

	if reloaded_1_4 < #reloaded_0_0 then
		table.remove(reloaded_0_0, 1)
	end

	if math.sqrt(reloaded_1_1^2 + reloaded_1_2^2) < 255 and reloaded_0_1 ~= 1 then
		reloaded_0_1 = -1
	end
end)

function get_lc()
	return reloaded_0_1
end

return get_lc
