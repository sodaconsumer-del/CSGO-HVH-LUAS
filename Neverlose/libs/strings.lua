local reloaded_0_0 = {}
local reloaded_0_1 = {
	FALSE = "\aFF2527FF",
	STRING = "\a98A84BFF",
	NIL = "\a98729FFF",
	DEFAULT = "\aFFFFFFFF",
	NUMBER = "\a608AB1FF",
	TRUE = "\a128A49FF"
}
local reloaded_0_2 = {
	steps = {
		function(arg_1_0)
			return arg_1_0:gsub("\a{[+-]?%d+%.?%d*}", function(arg_2_0)
				local reloaded_2_0 = arg_2_0:sub(3, #arg_2_0 - 1)

				return ("%s%s%s"):format(reloaded_0_1.NUMBER, reloaded_2_0, reloaded_0_1.DEFAULT)
			end)
		end,
		function(arg_3_0)
			return arg_3_0:gsub("\a{0?x?[A-Fa-f%d]+}", function(arg_4_0)
				local reloaded_4_0 = arg_4_0:sub(3, #arg_4_0 - 1)

				return ("%s%s%s"):format(reloaded_0_1.NUMBER, reloaded_4_0, reloaded_0_1.DEFAULT)
			end)
		end,
		function(arg_5_0)
			local function reloaded_5_0(arg_6_0, arg_6_1)
				return arg_5_0:gsub(("\a{%s}"):format(arg_6_0), function(arg_7_0)
					local reloaded_7_0 = arg_7_0:sub(3, #arg_7_0 - 1)

					return ("%s%s%s"):format(arg_6_1, reloaded_7_0, reloaded_0_1.DEFAULT)
				end)
			end

			local reloaded_5_1 = {
				["nil"] = reloaded_0_1.NIL,
				["false"] = reloaded_0_1.FALSE,
				["true"] = reloaded_0_1.TRUE
			}

			for iter_5_0, iter_5_1 in pairs(reloaded_5_1) do
				arg_5_0 = reloaded_5_0(iter_5_0, iter_5_1)
			end

			return arg_5_0
		end,
		function(arg_8_0)
			return arg_8_0:gsub("\a{[^}]+}", function(arg_9_0)
				local reloaded_9_0 = arg_9_0:sub(3, #arg_9_0 - 1)

				return ("%s%s%s"):format(reloaded_0_1.STRING, reloaded_9_0, reloaded_0_1.DEFAULT)
			end)
		end
	},
	process = function(arg_10_0, arg_10_1)
		for iter_10_0, iter_10_1 in ipairs(arg_10_0.steps) do
			arg_10_1 = iter_10_1(arg_10_1)
		end

		return arg_10_1
	end
}

function reloaded_0_0.remove_color_tags(arg_11_0)
	if type(arg_11_0) ~= "string" then
		error(("Invalid argument type, string expected, got: %s"):format(type(arg_11_0)))
	end

	return arg_11_0:gsub("\a%x%x%x%x%x%x", "")
end

function reloaded_0_0.highlight(arg_12_0)
	return reloaded_0_2:process(arg_12_0)
end

for iter_0_0, iter_0_1 in pairs(reloaded_0_0) do
	getmetatable("").__index[iter_0_0] = iter_0_1
end

return reloaded_0_0
