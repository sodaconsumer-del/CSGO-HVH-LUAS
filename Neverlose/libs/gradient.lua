local reloaded_0_0 = "[%z\x01-\x7F\xC2-\xF4][\x80-\xBF]*"

local function reloaded_0_1(arg_1_0, arg_1_1)
	if arg_1_0 < 0 then
		arg_1_0 = arg_1_1 + arg_1_0 + 1
	end

	return arg_1_0
end

local reloaded_0_2 = {
	map = function(arg_2_0, arg_2_1, arg_2_2)
		local reloaded_2_0 = 0

		if arg_2_2 then
			for iter_2_0, iter_2_1 in arg_2_0:gmatch("()" .. reloaded_0_0 .. "()") do
				reloaded_2_0 = reloaded_2_0 + 1

				local reloaded_2_1 = iter_2_1 - iter_2_0

				arg_2_1(reloaded_2_0, reloaded_2_1, iter_2_0)
			end
		else
			for iter_2_2, iter_2_3 in arg_2_0:gmatch("()(" .. reloaded_0_0 .. ")") do
				reloaded_2_0 = reloaded_2_0 + 1

				arg_2_1(reloaded_2_0, iter_2_3, iter_2_2)
			end
		end
	end
}

function reloaded_0_2.chars(arg_3_0, arg_3_1)
	return coroutine.wrap(function()
		return reloaded_0_2.map(arg_3_0, coroutine.yield, arg_3_1)
	end)
end

function reloaded_0_2.len(arg_5_0)
	return select(2, arg_5_0:gsub("[^\x80-\xC1]", ""))
end

function reloaded_0_2.replace(arg_6_0, arg_6_1)
	return arg_6_0:gsub(reloaded_0_0, arg_6_1)
end

function reloaded_0_2.reverse(arg_7_0)
	arg_7_0 = arg_7_0:gsub(reloaded_0_0, function(arg_8_0)
		return #arg_8_0 > 1 and arg_8_0:reverse()
	end)

	return arg_7_0:reverse()
end

function reloaded_0_2.strip(arg_9_0)
	return arg_9_0:gsub(reloaded_0_0, function(arg_10_0)
		return #arg_10_0 > 1 and ""
	end)
end

function reloaded_0_2.sub(arg_11_0, arg_11_1, arg_11_2)
	local reloaded_11_0 = reloaded_0_2.len(arg_11_0)

	arg_11_1 = reloaded_0_1(arg_11_1, reloaded_11_0)
	arg_11_2 = arg_11_2 and reloaded_0_1(arg_11_2, reloaded_11_0) or reloaded_11_0

	if arg_11_1 < 1 then
		arg_11_1 = 1
	end

	if reloaded_11_0 < arg_11_2 then
		arg_11_2 = reloaded_11_0
	end

	if arg_11_2 < arg_11_1 then
		return ""
	end

	local reloaded_11_1 = arg_11_2 - arg_11_1
	local reloaded_11_2 = reloaded_0_2.chars(arg_11_0, true)

	for iter_11_0 = 1, arg_11_1 - 1 do
		reloaded_11_2()
	end

	local reloaded_11_3, reloaded_11_4 = select(2, reloaded_11_2())

	if reloaded_11_1 == 0 then
		return string.sub(arg_11_0, reloaded_11_4, reloaded_11_4 + reloaded_11_3 - 1)
	end

	arg_11_1 = reloaded_11_4

	for iter_11_1 = 1, reloaded_11_1 - 1 do
		reloaded_11_2()
	end

	local reloaded_11_5, reloaded_11_6 = select(2, reloaded_11_2())

	return string.sub(arg_11_0, arg_11_1, reloaded_11_6 + reloaded_11_5 - 1)
end

local function reloaded_0_3(arg_12_0)
	if #arg_12_0 < 2 then
		error("2 or more colors required!")
	end

	if arg_12_0[1][2] ~= 0 then
		error("First color must start at position 0!")
	end

	if arg_12_0[#arg_12_0][2] ~= 1 then
		error("Last color must end at position 1!")
	end

	local reloaded_12_0 = 0

	for iter_12_0, iter_12_1 in ipairs(arg_12_0) do
		local reloaded_12_1 = iter_12_1[2]

		if not reloaded_12_1 then
			error("Color doesn't have a stop property!")
		end

		if reloaded_12_1 < 0 or reloaded_12_1 > 1 then
			error("Color stop is out of boundaries!")
		end

		if reloaded_12_0 <= reloaded_12_1 then
			reloaded_12_0 = reloaded_12_1
		else
			error("Color stops are out of order!")
		end
	end

	return arg_12_0
end

local function reloaded_0_4(arg_13_0, arg_13_1, arg_13_2)
	arg_13_1 = (arg_13_1 + arg_13_2 - 1) % #arg_13_0 + 1

	return arg_13_0[arg_13_1], arg_13_1
end

local function reloaded_0_5(arg_14_0, arg_14_1)
	return (color((arg_14_0.r / 255)^(1 / arg_14_1) * 255, (arg_14_0.g / 255)^(1 / arg_14_1) * 255, (arg_14_0.b / 255)^(1 / arg_14_1) * 255))
end

local function reloaded_0_6(arg_15_0, arg_15_1)
	local reloaded_15_0 = #arg_15_0
	local reloaded_15_1 = arg_15_1 / (1 / (reloaded_15_0 - 1))
	local reloaded_15_2 = 1 + math.floor(reloaded_15_1)

	if reloaded_15_1 == reloaded_15_0 - 1 then
		return arg_15_0[reloaded_15_0]
	end

	local reloaded_15_3 = reloaded_15_1 % 1

	return arg_15_0[reloaded_15_2]:lerp(arg_15_0[reloaded_15_2 + 1], reloaded_15_3)
end

local reloaded_0_7 = {}
local reloaded_0_8 = {}

reloaded_0_8.__index = reloaded_0_8

local reloaded_0_9 = {}

reloaded_0_9.__index = reloaded_0_9

function reloaded_0_8.linear(arg_16_0, arg_16_1)
	if type(arg_16_0[1]) ~= "table" then
		return reloaded_0_6(arg_16_0, arg_16_1)
	end

	local reloaded_16_0 = reloaded_0_3(arg_16_0)
	local reloaded_16_1 = 1

	while arg_16_1 > reloaded_16_0[reloaded_16_1 + 1][2] do
		reloaded_16_1 = reloaded_16_1 + 1
	end

	local reloaded_16_2 = (arg_16_1 - reloaded_16_0[reloaded_16_1][2]) / (reloaded_16_0[reloaded_16_1 + 1][2] - reloaded_16_0[reloaded_16_1][2])

	return reloaded_16_0[reloaded_16_1][1]:lerp(reloaded_16_0[reloaded_16_1 + 1][1], reloaded_16_2)
end

function reloaded_0_8.text(arg_17_0, arg_17_1, arg_17_2)
	local reloaded_17_0 = ""
	local reloaded_17_1 = reloaded_0_2.len(arg_17_0) - 1

	for iter_17_0, iter_17_1, iter_17_2 in reloaded_0_2.chars(arg_17_0) do
		local reloaded_17_2 = reloaded_0_8.linear(arg_17_2, (iter_17_0 - 1) / reloaded_17_1):to_hex()

		if arg_17_1 then
			reloaded_17_2 = reloaded_17_2:sub(1, 6)
		end

		reloaded_17_0 = string.format("%s\a%s%s", reloaded_17_0, reloaded_17_2, reloaded_0_2.sub(arg_17_0, iter_17_0, iter_17_0))
	end

	return reloaded_17_0
end

function reloaded_0_8.text_animate(arg_18_0, arg_18_1, arg_18_2)
	local reloaded_18_0 = arg_18_0 .. arg_18_1

	for iter_18_0, iter_18_1 in ipairs(arg_18_2) do
		reloaded_18_0 = reloaded_18_0 .. tostring(iter_18_1)
	end

	local reloaded_18_1 = reloaded_0_7[reloaded_18_0]

	if not reloaded_18_1 then
		reloaded_18_1 = setmetatable({}, reloaded_0_9)
		reloaded_18_1.text = arg_18_0
		reloaded_18_1.animated_text = ""
		reloaded_18_1.speed = 1 / arg_18_1
		reloaded_18_1.current_pos = 0
		reloaded_18_1.colors = arg_18_2
		reloaded_18_1.colors[#reloaded_18_1.colors + 1] = reloaded_18_1.colors[1]

		reloaded_18_1:populate_gradient()
	end

	reloaded_0_7[reloaded_18_0] = reloaded_18_1

	return reloaded_18_1
end

function reloaded_0_9.populate_gradient(arg_19_0)
	local reloaded_19_0 = arg_19_0:get_colors()
	local reloaded_19_1 = arg_19_0:get_text()
	local reloaded_19_2 = {}
	local reloaded_19_3 = reloaded_0_2.len(reloaded_19_1)
	local reloaded_19_4 = #reloaded_19_0
	local reloaded_19_5 = reloaded_19_1 .. string.rep("|", math.floor(reloaded_19_3 / (reloaded_19_4 - 2) + 0.5))
	local reloaded_19_6 = reloaded_0_2.len(reloaded_19_5)

	for iter_19_0, iter_19_1, iter_19_2 in reloaded_0_2.chars(reloaded_19_5) do
		local reloaded_19_7 = reloaded_0_8.linear(reloaded_19_0, (iter_19_0 - 1) / (reloaded_19_6 - 1))

		reloaded_19_2[#reloaded_19_2 + 1] = reloaded_19_7:to_hex()
	end

	arg_19_0.gradients = reloaded_19_2

	arg_19_0:populate_text()
end

function reloaded_0_9.populate_text(arg_20_0)
	local reloaded_20_0 = arg_20_0.text

	arg_20_0.animated_text = ""

	for iter_20_0, iter_20_1, iter_20_2 in reloaded_0_2.chars(reloaded_20_0) do
		arg_20_0.animated_text = string.format("%s\a%s%s", arg_20_0.animated_text, reloaded_0_4(arg_20_0.gradients, iter_20_0, 0), reloaded_0_2.sub(reloaded_20_0, iter_20_0, iter_20_0))
	end
end

function reloaded_0_9.animate(arg_21_0)
	if math.abs(arg_21_0.current_pos) >= 1 then
		arg_21_0.current_pos = arg_21_0.speed * globals.frametime
	end

	arg_21_0.animated_text = ""
	arg_21_0.current_pos = arg_21_0.current_pos + arg_21_0.speed * globals.frametime

	local reloaded_21_0 = arg_21_0.text
	local reloaded_21_1 = math.floor(arg_21_0.current_pos * #arg_21_0.gradients)

	for iter_21_0, iter_21_1, iter_21_2 in reloaded_0_2.chars(reloaded_21_0) do
		arg_21_0.animated_text = string.format("%s\a%s%s", arg_21_0.animated_text, reloaded_0_4(arg_21_0.gradients, iter_21_0, reloaded_21_1), reloaded_0_2.sub(reloaded_21_0, iter_21_0, iter_21_0))
	end
end

function reloaded_0_9.get_colors(arg_22_0)
	return arg_22_0.colors
end

function reloaded_0_9.set_colors(arg_23_0, arg_23_1)
	local reloaded_23_0 = false

	for iter_23_0, iter_23_1 in ipairs(arg_23_1) do
		if arg_23_0.colors[iter_23_0] ~= iter_23_1 then
			reloaded_23_0 = true
		end
	end

	if reloaded_23_0 then
		arg_23_0.colors = arg_23_1
		arg_23_0.colors[#arg_23_0.colors + 1] = arg_23_0.colors[1]

		arg_23_0:populate_gradient()
	end
end

function reloaded_0_9.get_speed(arg_24_0)
	return 1 / arg_24_0.speed
end

function reloaded_0_9.set_speed(arg_25_0, arg_25_1)
	arg_25_0.speed = 1 / arg_25_1
end

function reloaded_0_9.get_current_position(arg_26_0)
	return arg_26_0.current_pos
end

function reloaded_0_9.set_current_position(arg_27_0, arg_27_1)
	arg_27_0.current_pos = math.clamp(arg_27_1, -1, 1)
	arg_27_0.animated_text = ""

	local reloaded_27_0 = arg_27_0.text
	local reloaded_27_1 = math.floor(arg_27_0.current_pos * #arg_27_0.gradients)

	for iter_27_0, iter_27_1, iter_27_2 in reloaded_0_2.chars(reloaded_27_0) do
		arg_27_0.animated_text = string.format("%s\a%s%s", arg_27_0.animated_text, reloaded_0_4(arg_27_0.gradients, iter_27_0, reloaded_27_1), reloaded_0_2.sub(reloaded_27_0, iter_27_0, iter_27_0))
	end
end

function reloaded_0_9.get_text(arg_28_0)
	return arg_28_0.text
end

function reloaded_0_9.set_text(arg_29_0, arg_29_1)
	if arg_29_0.text ~= arg_29_1 then
		arg_29_0.text = arg_29_1

		arg_29_0:populate_gradient()
	end
end

function reloaded_0_9.get_animated_text(arg_30_0)
	return arg_30_0.animated_text
end

function reloaded_0_9.gamma_correct(arg_31_0, arg_31_1)
	for iter_31_0, iter_31_1 in ipairs(arg_31_0.gradients) do
		arg_31_0.gradients[iter_31_0] = reloaded_0_5(color(iter_31_1), arg_31_1):to_hex()
	end
end

return reloaded_0_8
