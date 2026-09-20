local reloaded_0_0 = {
	screen = render.screen_size()
}

reloaded_0_0.y = 0
reloaded_0_0.x = 20
reloaded_0_0.dpi = 1
reloaded_0_0.size = 0
reloaded_0_0.white_color = color(255, 255, 255, 200)
reloaded_0_0.red_color = color(255, 0, 50, 255)
reloaded_0_0.green_color = color(162, 198, 31, 255)
reloaded_0_0.yellow_color = color(252, 243, 105, 255)
reloaded_0_0.font = render.load_font("Calibri Bold", 25, "ad")
reloaded_0_0.icon = render.load_font("neverlose/ICON.ttf", 25, "ad")

function reloaded_0_0.draw(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4)
	local reloaded_1_0 = arg_1_1.r
	local reloaded_1_1 = arg_1_1.g
	local reloaded_1_2 = arg_1_1.b
	local reloaded_1_3 = arg_1_1.a
	local reloaded_1_4 = type(arg_1_0) == "boolean" and arg_1_0 or ""
	local reloaded_1_5 = arg_1_3 ~= nil and arg_1_3 or false
	local reloaded_1_6 = 0

	reloaded_0_0.size = render.measure_text(reloaded_0_0.font, "ad", arg_1_2)

	if reloaded_1_4 ~= "" then
		render.text(reloaded_0_0.icon, vector(reloaded_0_0.x + 5, reloaded_0_0.screen.y * 0.75 + reloaded_0_0.y), color(reloaded_1_0, reloaded_1_1, reloaded_1_2, reloaded_1_3), nil, "t")
		render.text(reloaded_0_0.icon, vector(reloaded_0_0.x, reloaded_0_0.screen.y * 0.75 + reloaded_0_0.y), color(reloaded_1_0, reloaded_1_1, reloaded_1_2, 255), nil, "o")

		reloaded_1_6 = render.measure_text(reloaded_0_0.icon, "ad", "to").x - 15
	end

	render.gradient(vector(reloaded_0_0.x / 2, reloaded_0_0.screen.y * 0.75 + reloaded_0_0.y - reloaded_0_0.size.y * 0.2), vector(reloaded_0_0.x + reloaded_0_0.size.x * 0.5, reloaded_0_0.screen.y * 0.75 + reloaded_0_0.y + reloaded_0_0.size.y * 1.2), color(0, 0, 0, 0), color(0, 0, 0, reloaded_1_3 / 255 * 60), color(0, 0, 0, 0), color(0, 0, 0, reloaded_1_3 / 255 * 60))
	render.gradient(vector(reloaded_0_0.x + reloaded_0_0.size.x * 0.5, reloaded_0_0.screen.y * 0.75 + reloaded_0_0.y - reloaded_0_0.size.y * 0.2), vector(reloaded_0_0.x + 10 + reloaded_0_0.size.x + reloaded_1_6, reloaded_0_0.screen.y * 0.75 + reloaded_0_0.y + reloaded_0_0.size.y * 1.2), color(0, 0, 0, reloaded_1_3 / 255 * 60), color(0, 0, 0, 0), color(0, 0, 0, reloaded_1_3 / 255 * 60), color(0, 0, 0, 0))
	render.text(reloaded_0_0.font, vector(reloaded_0_0.x + reloaded_1_6, reloaded_0_0.screen.y * 0.75 + reloaded_0_0.y), color(reloaded_1_0, reloaded_1_1, reloaded_1_2, reloaded_1_3), nil, arg_1_2)

	if reloaded_1_5 then
		render.circle_outline(vector(reloaded_0_0.x + reloaded_1_6 * 2, reloaded_0_0.screen.y * 0.75 + reloaded_0_0.y + reloaded_0_0.size.y * 0.4), color(0, 0, 0, 255), reloaded_0_0.dpi * 12, 0, 1, reloaded_0_0.dpi * 3 + 1)
		render.circle_outline(vector(reloaded_0_0.x + reloaded_1_6 * 2, reloaded_0_0.screen.y * 0.75 + reloaded_0_0.y + reloaded_0_0.size.y * 0.4), reloaded_0_0.white_color, reloaded_0_0.dpi * 12 - 1, 0, arg_1_4, reloaded_0_0.dpi * 3 - 1)
	end

	reloaded_0_0.y = reloaded_0_0.y - reloaded_0_0.size.y * 1.6
end

return reloaded_0_0
