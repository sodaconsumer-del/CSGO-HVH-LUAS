function do_circle(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4, arg_1_5)
	amount_color = color(255, 255, 255, 255)

	if arg_1_0 > arg_1_1 / 3 * 2 then
		amount_color = color(0, 255, 0, 255)
	elseif arg_1_0 <= arg_1_1 / 3 * 2 and arg_1_0 > arg_1_1 / 3 then
		amount_color = color(255, 255, 0, 255)
	elseif arg_1_0 <= arg_1_1 / 3 * 2 and arg_1_0 < arg_1_1 / 3 then
		amount_color = color(255, 0, 0, 255)
	end

	render.circle(vector(arg_1_2, arg_1_3), color(0, 0, 0, 150), arg_1_5, 0, 1)
	render.circle_outline(vector(arg_1_2, arg_1_3), amount_color, arg_1_5, 0, arg_1_0 / arg_1_1, arg_1_4)
end

function do_number(arg_2_0, arg_2_1, arg_2_2, arg_2_3, arg_2_4, arg_2_5, arg_2_6)
	amount_color = color(255, 255, 255, arg_2_6)

	if arg_2_2 > arg_2_3 / 3 * 2 then
		amount_color = color(0, 255, 0, arg_2_6)
	elseif arg_2_2 <= arg_2_3 / 3 * 2 and arg_2_2 > arg_2_3 / 3 then
		amount_color = color(255, 255, 0, arg_2_6)
	elseif arg_2_2 <= arg_2_3 / 3 then
		amount_color = color(255, 0, 0, arg_2_6)
	end

	render.text(arg_2_0, vector(arg_2_4, arg_2_5), amount_color, nil, arg_2_1)
end

function do_statuscheck(arg_3_0)
	if arg_3_0:get_override() ~= nil then
		return arg_3_0:get_override()
	else
		return arg_3_0:get()
	end
end

function do_return_bool(arg_4_0, arg_4_1, arg_4_2)
	if arg_4_2 == true then
		return arg_4_0
	else
		return arg_4_1
	end
end
