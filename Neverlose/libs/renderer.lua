local reloaded_0_0 = render

reloaded_0_0.load_image_file = render.load_image_from_file
reloaded_0_0.load_rgba = render.load_image_rgba
reloaded_0_0.rectangle = render.rect
reloaded_0_0.rectangle_blur = render.blur
reloaded_0_0.rectangle_outline = render.rect_outline

function reloaded_0_0.circle_blur(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4, arg_1_5)
	for iter_1_0 = arg_1_2, arg_1_2 + math.abs(arg_1_3 * 360) do
		local reloaded_1_0 = arg_1_0 + vector(math.cos(iter_1_0 * math.pi / 180) * arg_1_1, math.sin(iter_1_0 * math.pi / 180) * arg_1_1)
		local reloaded_1_1 = arg_1_0 + vector(math.cos((iter_1_0 + 1) * math.pi / 180) * arg_1_1, math.sin((iter_1_0 + 1) * math.pi / 180) * arg_1_1)

		render.poly_blur(arg_1_5 or 1, arg_1_4 or 0, arg_1_0, arg_1_0, reloaded_1_1)
		render.poly_blur(arg_1_5 or 1, arg_1_4 or 0, arg_1_0, reloaded_1_0, reloaded_1_1)
	end
end

function reloaded_0_0.circle_outline_blur(arg_2_0, arg_2_1, arg_2_2, arg_2_3, arg_2_4, arg_2_5, arg_2_6)
	arg_2_4 = arg_2_1 - (arg_2_4 or 0)

	for iter_2_0 = arg_2_2, arg_2_2 + math.abs(arg_2_3 * 360) do
		local reloaded_2_0 = math.cos(iter_2_0 * math.pi / 180)
		local reloaded_2_1 = math.sin(iter_2_0 * math.pi / 180)
		local reloaded_2_2 = math.cos((iter_2_0 + 1) * math.pi / 180)
		local reloaded_2_3 = math.sin((iter_2_0 + 1) * math.pi / 180)
		local reloaded_2_4 = arg_2_0 + vector(reloaded_2_0 * arg_2_1, reloaded_2_1 * arg_2_1)
		local reloaded_2_5 = arg_2_0 + vector(reloaded_2_2 * arg_2_1, reloaded_2_3 * arg_2_1)
		local reloaded_2_6 = arg_2_0 + vector(reloaded_2_0 * arg_2_4, reloaded_2_1 * arg_2_4)
		local reloaded_2_7 = arg_2_0 + vector(reloaded_2_2 * arg_2_4, reloaded_2_3 * arg_2_4)

		render.poly_blur(arg_2_6 or 1, arg_2_5 or 0, reloaded_2_4, reloaded_2_5, reloaded_2_6)
		render.poly_blur(arg_2_6 or 1, arg_2_5 or 0, reloaded_2_5, reloaded_2_6, reloaded_2_7)
	end
end

return reloaded_0_0
