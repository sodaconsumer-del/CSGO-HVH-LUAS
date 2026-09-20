local reloaded_0_0 = color()
local reloaded_0_1 = getmetatable(reloaded_0_0)

function reloaded_0_1.scale_alpha(arg_1_0, arg_1_1)
	return color(arg_1_0.r, arg_1_0.g, arg_1_0.b, arg_1_0.a * arg_1_1)
end

function reloaded_0_1.hex(arg_2_0)
	return ("%s"):format(arg_2_0:to_hex()):sub(1, 6)
end

local function reloaded_0_2()
	local reloaded_3_0 = {
		"scale_alpha",
		"hex"
	}

	for iter_3_0, iter_3_1 in ipairs(reloaded_3_0) do
		reloaded_0_1[iter_3_1] = nil
	end
end

events.shutdown:set(function()
	utils.execute_after(0.1, reloaded_0_2)
end)

return color
