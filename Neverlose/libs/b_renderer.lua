local reloaded_0_0 = {}
local reloaded_0_1 = {
	n = render.load_font("verdana", 11, "a"),
	b = render.load_font("verdana", 11, "ab"),
	add = render.load_font("arial", 33, "ab")
}

function reloaded_0_0.text(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4, arg_1_5, arg_1_6, arg_1_7, ...)
	local reloaded_1_0 = {
		...
	}
	local reloaded_1_1 = {
		"c+",
		"c-",
		"+c",
		"-c",
		"b",
		"c",
		"+",
		"-",
		"bc",
		""
	}
	local reloaded_1_2 = (arg_1_6 == reloaded_1_1[1] or arg_1_6 == reloaded_1_1[3]) and reloaded_0_1.add or (arg_1_6 == reloaded_1_1[2] or arg_1_6 == reloaded_1_1[4]) and 2 or arg_1_6 == reloaded_1_1[5] and reloaded_0_1.b or arg_1_6 == reloaded_1_1[6] and reloaded_0_1.n or arg_1_6 == reloaded_1_1[7] and reloaded_0_1.add or arg_1_6 == reloaded_1_1[8] and 2 or arg_1_6 == reloaded_1_1[9] and reloaded_0_1.b or arg_1_6 == reloaded_1_1[10] and reloaded_0_1.n or arg_1_6 == reloaded_1_1[11] and reloaded_0_1.n
	local reloaded_1_3 = string.find(arg_1_6, "c") and "c" or nil

	if not string.find(arg_1_6, "-") then
		render.text(reloaded_1_2, vector(arg_1_0 + 1, arg_1_1 + 1), color(17, 17, 17, arg_1_5), reloaded_1_3, string.sub(unpack(reloaded_1_0), arg_1_7))
	end

	render.text(reloaded_1_2, vector(arg_1_0, arg_1_1), color(arg_1_2, arg_1_3, arg_1_4, arg_1_5), reloaded_1_3, string.sub(unpack(reloaded_1_0), arg_1_7))
end

function reloaded_0_0.measure_text(arg_2_0, ...)
	local reloaded_2_0 = {
		...
	}
	local reloaded_2_1 = {
		"c+",
		"c-",
		"+c",
		"-c",
		"b",
		"c",
		"+",
		"-",
		"bc",
		""
	}
	local reloaded_2_2 = (arg_2_0 == reloaded_2_1[1] or arg_2_0 == reloaded_2_1[3]) and reloaded_0_1.add or (arg_2_0 == reloaded_2_1[2] or arg_2_0 == reloaded_2_1[4]) and 2 or arg_2_0 == reloaded_2_1[5] and reloaded_0_1.b or arg_2_0 == reloaded_2_1[6] and reloaded_0_1.n or arg_2_0 == reloaded_2_1[7] and reloaded_0_1.add or arg_2_0 == reloaded_2_1[8] and 2 or arg_2_0 == reloaded_2_1[9] and reloaded_0_1.b or arg_2_0 == reloaded_2_1[10] and reloaded_0_1.n or arg_2_0 == reloaded_2_1[11] and reloaded_0_1.n
	local reloaded_2_3 = string.find(arg_2_0, "c") and "c" or nil

	render.measure_text(reloaded_2_2, reloaded_2_3, unpack(reloaded_2_0))
end

function reloaded_0_0.rectangle(arg_3_0, arg_3_1, arg_3_2, arg_3_3, arg_3_4, arg_3_5, arg_3_6, arg_3_7, arg_3_8)
	arg_3_8 = arg_3_8 or 0

	render.rect(vector(arg_3_0, arg_3_1), vector(arg_3_0 + arg_3_2, arg_3_1 + arg_3_3), color(arg_3_4, arg_3_5, arg_3_6, arg_3_7), arg_3_8)
end

function reloaded_0_0.line(arg_4_0, arg_4_1, arg_4_2, arg_4_3, arg_4_4, arg_4_5, arg_4_6, arg_4_7)
	render.poly_line(color(arg_4_4, arg_4_5, arg_4_6, arg_4_7), vector(arg_4_0, arg_4_1), vector(arg_4_2, arg_4_3))
end

function reloaded_0_0.gradient(arg_5_0, arg_5_1, arg_5_2, arg_5_3, arg_5_4, arg_5_5, arg_5_6, arg_5_7, arg_5_8, arg_5_9, arg_5_10, arg_5_11, arg_5_12)
	local reloaded_5_0 = color(arg_5_4, arg_5_5, arg_5_6, arg_5_7)
	local reloaded_5_1 = color(arg_5_8, arg_5_9, arg_5_10, arg_5_11)

	if arg_5_12 == true then
		render.gradient(vector(arg_5_0, arg_5_1), vector(arg_5_0 + arg_5_2, arg_5_1 + arg_5_3), reloaded_5_0, reloaded_5_1, reloaded_5_0, reloaded_5_1)
	elseif arg_5_12 == false then
		render.gradient(vector(arg_5_0, arg_5_1), vector(arg_5_0 + arg_5_2, arg_5_1 + arg_5_3), reloaded_5_0, reloaded_5_0, reloaded_5_1, reloaded_5_1)
	end
end

function reloaded_0_0.circle(arg_6_0, arg_6_1, arg_6_2, arg_6_3, arg_6_4, arg_6_5, arg_6_6, arg_6_7, arg_6_8)
	render.circle(vector(arg_6_0, arg_6_1), color(arg_6_2, arg_6_3, arg_6_4, arg_6_5), arg_6_6, arg_6_7, arg_6_8)
end

function reloaded_0_0.circle_outline(arg_7_0, arg_7_1, arg_7_2, arg_7_3, arg_7_4, arg_7_5, arg_7_6, arg_7_7, arg_7_8, arg_7_9)
	arg_7_9 = arg_7_9 or 1

	render.circle_outline(vector(arg_7_0, arg_7_1), color(arg_7_2, arg_7_3, arg_7_4, arg_7_5), arg_7_6, arg_7_7, arg_7_8, arg_7_9)
end

function reloaded_0_0.world_to_screen(arg_8_0, arg_8_1, arg_8_2)
	render.world_to_screen(vector(arg_8_0, arg_8_1, arg_8_2))
end

function reloaded_0_0.texture(arg_9_0, arg_9_1, arg_9_2, arg_9_3, arg_9_4, arg_9_5, arg_9_6, arg_9_7, arg_9_8, arg_9_9, arg_9_10)
	arg_9_10 = arg_9_10 or 0

	render.texture(arg_9_0, vector(arg_9_1, arg_9_2), vector(arg_9_3, arg_9_4), color(arg_9_5, arg_9_6, arg_9_7, arg_9_8), arg_9_9, arg_9_10)
end

return reloaded_0_0
