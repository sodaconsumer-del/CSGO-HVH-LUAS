return {
	scale = function(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
		arg_1_2 = arg_1_2 or 0.75
		arg_1_3 = arg_1_3 or 2

		local reloaded_1_0 = arg_1_0 + (render.get_scale(1) - arg_1_2) * (arg_1_1 - arg_1_0) / (arg_1_3 - arg_1_2)

		return (vector(reloaded_1_0, reloaded_1_0))
	end,
	create = function(arg_2_0, arg_2_1, arg_2_2, arg_2_3, arg_2_4, arg_2_5)
		arg_2_3 = arg_2_3 or color(255, 255, 255, 255)
		arg_2_4 = arg_2_4 or "f"
		arg_2_5 = arg_2_5 or 0

		local reloaded_2_0 = render.load_image_from_file(arg_2_1, arg_2_2)

		arg_2_0:texture(reloaded_2_0, arg_2_2, arg_2_2, arg_2_3, arg_2_4, arg_2_5)
	end,
	text_pulse = function(arg_3_0, arg_3_1, arg_3_2, arg_3_3, arg_3_4)
		arg_3_0 = arg_3_0 or 128
		arg_3_1 = arg_3_1 or 255
		arg_3_2 = arg_3_2 or 1
		arg_3_3 = arg_3_3 or arg_3_3(255, 255, 255)
		arg_3_4 = arg_3_4 or ""

		return function()
			local reloaded_4_0 = math.sin(globals.realtime * arg_3_2)
			local reloaded_4_1 = arg_3_0 + (arg_3_1 - arg_3_0) * (reloaded_4_0 + 1) / 2
			local reloaded_4_2 = arg_3_3:alpha_modulate(reloaded_4_1)

			return string.format("\a%s%s", reloaded_4_2:to_hex(), arg_3_4)
		end
	end,
	text_flow = function(arg_5_0, arg_5_1, arg_5_2, arg_5_3, arg_5_4)
		arg_5_0 = arg_5_0 or 128
		arg_5_1 = arg_5_1 or 255
		arg_5_2 = arg_5_2 or 1
		arg_5_3 = arg_5_3 or arg_5_3(255, 255, 255)
		arg_5_4 = arg_5_4 or ""

		return function()
			local reloaded_6_0 = ""

			for iter_6_0 = 1, #arg_5_4 do
				local reloaded_6_1 = math.sin((globals.realtime + iter_6_0 / #arg_5_4) * arg_5_2)
				local reloaded_6_2 = arg_5_0 + (arg_5_1 - arg_5_0) * (reloaded_6_1 + 1) / 2
				local reloaded_6_3 = arg_5_3:alpha_modulate(reloaded_6_2)

				reloaded_6_0 = reloaded_6_0 .. string.format("\a%s%s", reloaded_6_3:to_hex(), arg_5_4:sub(iter_6_0, iter_6_0))
			end

			return reloaded_6_0
		end
	end,
	vera_animation = function(arg_7_0, arg_7_1, arg_7_2, arg_7_3, arg_7_4, arg_7_5, arg_7_6)
		arg_7_0 = arg_7_0 or 128
		arg_7_1 = arg_7_1 or 255
		arg_7_5 = arg_7_5 or 1
		arg_7_6 = arg_7_6 or "Vera: use text in scopes"
		arg_7_2 = arg_7_2 or 0
		arg_7_3 = arg_7_3 or 0
		arg_7_4 = arg_7_4 or 0

		return function()
			local reloaded_8_0 = ""

			for iter_8_0 = 1, #arg_7_6 do
				local reloaded_8_1 = math.sin((globals.realtime + iter_8_0 / #arg_7_6) * arg_7_5)
				local reloaded_8_2 = arg_7_0 + (arg_7_1 - arg_7_0) * (reloaded_8_1 + 1) / 2
				local reloaded_8_3 = color(arg_7_2, arg_7_3, arg_7_4, reloaded_8_2)

				reloaded_8_0 = reloaded_8_0 .. string.format("\a%s%s", reloaded_8_3:to_hex(), arg_7_6:sub(iter_8_0, iter_8_0))
			end

			return reloaded_8_0
		end
	end,
	tricolor_text = function(arg_9_0, arg_9_1, arg_9_2, arg_9_3)
		arg_9_0 = arg_9_0 or 128
		arg_9_1 = arg_9_1 or 255
		arg_9_2 = arg_9_2 or 1
		arg_9_3 = arg_9_3 or "Tricolor Text!"

		local reloaded_9_0 = color(255, 0, 0)
		local reloaded_9_1 = color(0, 200, 0)
		local reloaded_9_2 = color(0, 0, 220)

		return function()
			local reloaded_10_0 = ""

			for iter_10_0 = 1, #arg_9_3 do
				local reloaded_10_1 = math.sin((globals.realtime + iter_10_0 / #arg_9_3) * arg_9_2)
				local reloaded_10_2 = arg_9_0 + (arg_9_1 - arg_9_0) * (reloaded_10_1 + 1) / 2
				local reloaded_10_3 = (1 + math.sin(reloaded_10_1 + 0)) / 2
				local reloaded_10_4 = (1 + math.sin(reloaded_10_1 + 2 * math.pi / 3)) / 2
				local reloaded_10_5 = (1 + math.sin(reloaded_10_1 + 4 * math.pi / 3)) / 2
				local reloaded_10_6 = reloaded_9_0:lerp(reloaded_9_1, reloaded_10_4):lerp(reloaded_9_2, reloaded_10_5):alpha_modulate(reloaded_10_2)

				reloaded_10_0 = reloaded_10_0 .. string.format("\a%s%s", reloaded_10_6:to_hex(), arg_9_3:sub(iter_10_0, iter_10_0))
			end

			return reloaded_10_0
		end
	end,
	dancing_text = function(arg_11_0, arg_11_1, arg_11_2, arg_11_3)
		arg_11_0 = arg_11_0 or 128
		arg_11_1 = arg_11_1 or 255
		arg_11_2 = arg_11_2 or 1
		arg_11_3 = arg_11_3 or "Dancing Text!"

		return function()
			local reloaded_12_0 = ""
			local reloaded_12_1 = globals.realtime

			for iter_12_0 = 1, #arg_11_3 do
				local reloaded_12_2 = math.sin((globals.realtime + iter_12_0 / #arg_11_3) * arg_11_2)
				local reloaded_12_3 = arg_11_0 + (arg_11_1 - arg_11_0) * (reloaded_12_2 + 1) / 2
				local reloaded_12_4 = math.min(128 * ((reloaded_12_2 + 1) / 2 + reloaded_12_1 % 2), 255)
				local reloaded_12_5 = math.min(128 * ((reloaded_12_2 + 1) / 2 + (reloaded_12_1 + 1) % 2), 200)
				local reloaded_12_6 = color(reloaded_12_4, 0, reloaded_12_5, reloaded_12_3)
				local reloaded_12_7 = 10 * math.sin((reloaded_12_1 + iter_12_0 / #arg_11_3) * arg_11_2)

				reloaded_12_0 = reloaded_12_0 .. string.format("\a%s%s", reloaded_12_6:to_hex(), arg_11_3:sub(iter_12_0, iter_12_0))
			end

			return reloaded_12_0
		end
	end,
	dancing_2 = function(arg_13_0, arg_13_1, arg_13_2, arg_13_3)
		arg_13_0 = arg_13_0 or 128
		arg_13_1 = arg_13_1 or 255
		arg_13_2 = arg_13_2 or 1
		arg_13_3 = arg_13_3 or "Created by Vera"

		return function()
			local reloaded_14_0 = ""
			local reloaded_14_1 = globals.realtime

			for iter_14_0 = 1, #arg_13_3 do
				if reloaded_14_1 > iter_14_0 / arg_13_2 then
					local reloaded_14_2 = math.sin((globals.realtime + iter_14_0 / #arg_13_3) * arg_13_2)
					local reloaded_14_3 = arg_13_0 + (arg_13_1 - arg_13_0) * (reloaded_14_2 + 1) / 2
					local reloaded_14_4 = math.min(200 * ((reloaded_14_2 + 1) / 2 + reloaded_14_1 % 2), 255)
					local reloaded_14_5 = math.min(200 * ((reloaded_14_2 + 1) / 2 + (reloaded_14_1 + 1) % 2), 200)
					local reloaded_14_6 = color(0, reloaded_14_4, reloaded_14_5, reloaded_14_3)

					reloaded_14_0 = reloaded_14_0 .. string.format("\a%s%s", reloaded_14_6:to_hex(), arg_13_3:sub(iter_14_0, iter_14_0))
				end
			end

			return reloaded_14_0
		end
	end,
	fading_letters = function(arg_15_0, arg_15_1, arg_15_2, arg_15_3)
		arg_15_0 = arg_15_0 or 128
		arg_15_1 = arg_15_1 or 255
		arg_15_2 = arg_15_2 or 1
		arg_15_3 = arg_15_3 or "Fading Letters!"

		return function()
			local reloaded_16_0 = ""

			for iter_16_0 = 1, #arg_15_3 do
				local reloaded_16_1 = math.sin((globals.realtime + iter_16_0 / #arg_15_3) * arg_15_2)
				local reloaded_16_2 = arg_15_0 + (arg_15_1 - arg_15_0) * (reloaded_16_1 + 1) / 2
				local reloaded_16_3 = math.min(128 * ((reloaded_16_1 + 1) / 2), 255)
				local reloaded_16_4 = math.min(128 * ((reloaded_16_1 + 1) / 2), 255)
				local reloaded_16_5 = color(reloaded_16_3, 0, reloaded_16_4, reloaded_16_2)

				reloaded_16_0 = reloaded_16_0 .. string.format("\a%s%s", reloaded_16_5:to_hex(), arg_15_3:sub(iter_16_0, iter_16_0))
			end

			return reloaded_16_0
		end
	end,
	wave_text = function(arg_17_0, arg_17_1, arg_17_2, arg_17_3)
		arg_17_0 = arg_17_0 or 128
		arg_17_1 = arg_17_1 or 255
		arg_17_2 = arg_17_2 or 1
		arg_17_3 = arg_17_3 or "Wave Text!"

		return function()
			local reloaded_18_0 = ""
			local reloaded_18_1 = globals.realtime

			for iter_18_0 = 1, #arg_17_3 do
				local reloaded_18_2 = math.sin((globals.realtime + iter_18_0 / #arg_17_3) * arg_17_2)
				local reloaded_18_3 = arg_17_0 + (arg_17_1 - arg_17_0) * (reloaded_18_2 + 1) / 2
				local reloaded_18_4 = math.min(255 * ((reloaded_18_2 + 1) / 2 + reloaded_18_1 % 2), 255)
				local reloaded_18_5 = math.min(255 * ((reloaded_18_2 + 1) / 2 + (reloaded_18_1 + 1) % 2), 255)
				local reloaded_18_6 = color(reloaded_18_4, 0, reloaded_18_5, reloaded_18_3)
				local reloaded_18_7 = string.rep("\n", math.floor(1.5 * (reloaded_18_2 + 1) / 2))

				reloaded_18_0 = reloaded_18_0 .. reloaded_18_7 .. string.format("\a%s%s", reloaded_18_6:to_hex(), arg_17_3:sub(iter_18_0, iter_18_0))
			end

			return reloaded_18_0
		end
	end,
	wave_text2 = function(arg_19_0, arg_19_1, arg_19_2, arg_19_3)
		arg_19_0 = arg_19_0 or 128
		arg_19_1 = arg_19_1 or 255
		arg_19_2 = arg_19_2 or 1
		arg_19_3 = arg_19_3 or "Wave Text!"

		return function()
			local reloaded_20_0 = ""
			local reloaded_20_1 = globals.realtime

			for iter_20_0 = 1, #arg_19_3 do
				local reloaded_20_2 = math.sin((globals.realtime + iter_20_0 / #arg_19_3) * arg_19_2)
				local reloaded_20_3 = arg_19_0 + (arg_19_1 - arg_19_0) * (reloaded_20_2 + 1) / 2
				local reloaded_20_4 = math.min(255 * ((reloaded_20_2 + 1) / 2 + reloaded_20_1 % 2), 255)
				local reloaded_20_5 = math.min(255 * ((reloaded_20_2 + 1) / 2 + (reloaded_20_1 + 1) % 2), 255)
				local reloaded_20_6 = color(reloaded_20_4, 0, reloaded_20_5, reloaded_20_3)

				reloaded_20_0 = reloaded_20_0 .. string.format("\a%s%s", reloaded_20_6:to_hex(), arg_19_3:sub(iter_20_0, iter_20_0))
			end

			return reloaded_20_0
		end
	end
}
