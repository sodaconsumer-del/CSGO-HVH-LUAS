local reloaded_0_0 = {}
local reloaded_0_1 = render.load_font("Calibri", vector(23, 23.5), "abd")

function reloaded_0_0.indicator(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	ts = render.measure_text(reloaded_0_1, "c", arg_1_1)

	local reloaded_1_0 = render.get_scale(2)

	if arg_1_3 == false then
		return
	end

	if arg_1_1 == nil or arg_1_1 == "" or arg_1_1 == " " then
		return
	end

	if arg_1_3 then
		render.gradient(vector(13 * reloaded_1_0, render.screen_size().y / 1.48 - 5 + arg_1_2 * reloaded_1_0), vector(13 + ts.x / 2 * reloaded_1_0, render.screen_size().y / 1.48 - 5 + arg_1_2 + 28 * reloaded_1_0), color(0, 0, 0, 0), color(0, 0, 0, 65), color(0, 0, 0, 0), color(0, 0, 0, 65))
		render.gradient(vector(13 + ts.x / 2 * reloaded_1_0, render.screen_size().y / 1.48 - 5 + arg_1_2 * reloaded_1_0), vector(13 + ts.x * reloaded_1_0, render.screen_size().y / 1.48 - 5 + arg_1_2 + 28 * reloaded_1_0), color(0, 0, 0, 65), color(0, 0, 0, 0), color(0, 0, 0, 65), color(0, 0, 0, 0))
		render.text(reloaded_0_1, vector(render.screen_size().x / 100 + 2 * reloaded_1_0, render.screen_size().y / 1.48 - 5 + 5 + arg_1_2 * reloaded_1_0), color(0, 0, 0, 1), nil, arg_1_1)
		render.text(reloaded_0_1, vector(render.screen_size().x / 100 + 2 * reloaded_1_0, render.screen_size().y / 1.48 - 5 + 4 + arg_1_2 * reloaded_1_0), arg_1_0, nil, arg_1_1)
	else
		render.gradient(vector(13, render.screen_size().y / 1.48 - 5 + arg_1_2), vector(13 + ts.x / 2, render.screen_size().y / 1.48 - 5 + arg_1_2 + 28), color(0, 0, 0, 0), color(0, 0, 0, 65), color(0, 0, 0, 0), color(0, 0, 0, 65))
		render.gradient(vector(13 + ts.x / 2, render.screen_size().y / 1.48 - 5 + arg_1_2), vector(13 + ts.x, render.screen_size().y / 1.48 - 5 + arg_1_2 + 28), color(0, 0, 0, 65), color(0, 0, 0, 0), color(0, 0, 0, 65), color(0, 0, 0, 0))
		render.text(reloaded_0_1, vector(render.screen_size().x / 100 + 2, render.screen_size().y / 1.48 - 5 + 5 + arg_1_2), color(0, 0, 0, 1), nil, arg_1_1)
		render.text(reloaded_0_1, vector(render.screen_size().x / 100 + 2, render.screen_size().y / 1.48 - 5 + 4 + arg_1_2), arg_1_0, nil, arg_1_1)
	end
end

return reloaded_0_0
