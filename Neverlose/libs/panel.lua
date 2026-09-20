local reloaded_0_0 = require("neverlose/inspect")
local reloaded_0_1 = require("neverlose/strings")
local reloaded_0_2 = {}

reloaded_0_2.__index = reloaded_0_2

local function reloaded_0_3(arg_1_0, arg_1_1, arg_1_2)
	if arg_1_2 == 0 then
		return arg_1_0
	end

	return ("%s%s"):format(string.rep(arg_1_1, arg_1_2), arg_1_0)
end

local function reloaded_0_4(arg_2_0)
	return json.stringify(arg_2_0):gsub("[\"']?[%w%s]+[\"']?", function(arg_3_0)
		return ("\a{%s}"):format(arg_3_0)
	end)
end

function reloaded_0_2.new(arg_4_0, arg_4_1, arg_4_2)
	return setmetatable({
		font = arg_4_0,
		highlight_values = arg_4_1,
		elements_schema = arg_4_2
	}, reloaded_0_2)
end

function reloaded_0_2.render_text(arg_5_0, arg_5_1, arg_5_2, arg_5_3, arg_5_4, arg_5_5)
	render.text(arg_5_0, arg_5_1, arg_5_2, arg_5_3, arg_5_4)

	if arg_5_5 then
		return render.measure_text(arg_5_0, arg_5_3, arg_5_4)
	end
end

function reloaded_0_2.format_line(arg_6_0, arg_6_1, arg_6_2)
	if arg_6_0.highlight_values and type(arg_6_2) == "table" then
		return ("%s: %s"):format(arg_6_1, reloaded_0_4(arg_6_2):highlight())
	elseif arg_6_0.highlight_values then
		return ("%s: \a{%s}"):format(arg_6_1, arg_6_2):highlight()
	else
		return ("%s: %s"):format(arg_6_1, arg_6_2)
	end
end

function reloaded_0_2.render_element(arg_7_0, arg_7_1, arg_7_2, arg_7_3, arg_7_4)
	arg_7_2 = reloaded_0_3(arg_7_2, " ", arg_7_4)

	local reloaded_7_0 = arg_7_0:format_line(arg_7_2, arg_7_3)

	return reloaded_0_2.render_text(arg_7_0.font, arg_7_1, color(255, 255, 255, 255), nil, reloaded_7_0, true)
end

function reloaded_0_2.render_title(arg_8_0, arg_8_1, arg_8_2)
	return reloaded_0_2.render_text(arg_8_0.font, arg_8_1, color(), nil, arg_8_2, true)
end

function reloaded_0_2.render_elements(arg_9_0, arg_9_1, arg_9_2, arg_9_3)
	arg_9_3 = arg_9_3 or 0

	local reloaded_9_0 = arg_9_1:clone()
	local reloaded_9_1 = 0

	arg_9_3 = arg_9_3 + 3

	for iter_9_0, iter_9_1 in pairs(arg_9_2) do
		local reloaded_9_2 = iter_9_1.value

		if reloaded_9_2 == nil then
			reloaded_9_2 = ""
		end

		local reloaded_9_3 = arg_9_0:render_element(reloaded_9_0, iter_9_1.name, reloaded_9_2, arg_9_3)

		reloaded_9_0.y = reloaded_9_0.y + reloaded_9_3.y

		if iter_9_1.childs ~= nil then
			local reloaded_9_4 = arg_9_0:render_elements(reloaded_9_0, iter_9_1.childs, arg_9_3)

			reloaded_9_3.x = math.max(reloaded_9_3.x, reloaded_9_4.x)
			reloaded_9_3.y = reloaded_9_3.y + reloaded_9_4.y
			reloaded_9_0.y = reloaded_9_0.y + reloaded_9_4.y
		end

		if reloaded_9_1 < reloaded_9_3.x then
			reloaded_9_1 = reloaded_9_3.x
		end
	end

	return vector(reloaded_9_1, (reloaded_9_0 - arg_9_1).y)
end

return reloaded_0_2
