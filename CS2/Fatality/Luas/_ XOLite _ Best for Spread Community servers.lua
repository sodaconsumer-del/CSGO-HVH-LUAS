--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol

slot_0_0_0 = {
	auto_peek = false,
	label = "xolite",
	username = gui.ctx.user.username,
	scheduled_tasks = {},
	screen = {
		game.engine:get_screen_size()
	}
}
slot_0_1_0 = (function()
	local var_1_0 = utils.find_pattern("tier0.dll", "40 56 48 83 EC ? E8")
	local var_1_1 = utils.find_pattern("tier0.dll", "48 85 C9 74 ? 53 48 83 EC ? 80 39")

	if not var_1_0 or not var_1_1 then
		error("Clipboard functions not found in tier0.dll")

		return nil
	end

	local var_1_2 = ffi.cast("const char*(*)()", var_1_0)
	local var_1_3 = ffi.cast("void(*)(const char*)", var_1_1)

	local function var_1_4()
		local var_2_0 = var_1_2()

		if var_2_0 == nil then
			return ""
		end

		return ffi.string(var_2_0)
	end

	local function var_1_5(...)
		local var_3_0 = tostring(table.concat({
			...
		}))

		var_1_3(var_3_0)

		return true
	end

	local function var_1_6()
		var_1_5("  ")
	end

	return {
		get = var_1_4,
		set = var_1_5,
		clear = var_1_6
	}
end)()
slot_0_2_0 = {}
slot_0_3_0 = {
	data = {},
	tick_to_time = function(arg_5_0)
		return 0.015625 * arg_5_0
	end,
	vector_to_angle = function(arg_6_0)
		local var_6_0 = -math.deg(math.atan(arg_6_0.z / math.sqrt(arg_6_0.x * arg_6_0.x + arg_6_0.y * arg_6_0.y)))
		local var_6_1 = math.deg(math.atan2(arg_6_0.y, arg_6_0.x))

		return vector(var_6_0, var_6_1, 0)
	end,
	execute_after = function(arg_7_0, arg_7_1)
		table.insert(slot_0_0_0.scheduled_tasks, {
			time_remaining = arg_7_0,
			callback = arg_7_1
		})
	end,
	round = function(arg_8_0)
		return math.floor(arg_8_0 + 0.5)
	end,
	string_split = function(arg_9_0, arg_9_1)
		local var_9_0 = {}
		local var_9_1 = string.format("(.-)%s", arg_9_1)
		local var_9_2 = 0
		local var_9_3, var_9_4, var_9_5 = string.find(arg_9_0, var_9_1, 1)

		while var_9_3 do
			if var_9_3 ~= 1 or var_9_5 ~= "" then
				table.insert(var_9_0, var_9_5)
			end

			var_9_2 = var_9_4 + 1
			var_9_3, var_9_4, var_9_5 = string.find(arg_9_0, var_9_1, var_9_2)
		end

		if var_9_2 <= #arg_9_0 then
			local var_9_6 = arg_9_0:sub(var_9_2)

			table.insert(var_9_0, var_9_6)
		end

		return var_9_0
	end,
	string_proper_len = function(arg_10_0)
		return #arg_10_0:gsub("[\x80-\xBF]", "")
	end,
	closest = function(arg_11_0, arg_11_1)
		local var_11_0 = arg_11_1[1]
		local var_11_1 = math.huge

		for iter_11_0 = 1, #arg_11_1 do
			local var_11_2 = arg_11_1[iter_11_0]
			local var_11_3 = math.abs(var_11_2 - arg_11_0)

			if var_11_3 < var_11_1 then
				var_11_0 = var_11_2
				var_11_1 = var_11_3
			end
		end

		return var_11_0
	end
}

function slot_0_3_0.linear(arg_12_0, arg_12_1, arg_12_2)
	if not slot_0_3_0.data[arg_12_0] then
		slot_0_3_0.data[arg_12_0] = 0
	end

	arg_12_2 = arg_12_2 or 6

	local var_12_0 = game.global_vars.frame_time * (arg_12_1 and 1 or -1) * arg_12_2

	slot_0_3_0.data[arg_12_0] = math.clamp(slot_0_3_0.data[arg_12_0] + var_12_0, 0, 1)

	return slot_0_3_0.data[arg_12_0]
end

function slot_0_3_0.lerp(arg_13_0, arg_13_1, arg_13_2, arg_13_3)
	arg_13_3 = arg_13_3 or 0.01

	if arg_13_3 > math.abs(arg_13_0 - arg_13_1) then
		return arg_13_1
	end

	arg_13_2 = arg_13_2 or 0.095

	local var_13_0 = game.global_vars.frame_time * (175 * arg_13_2)

	return (arg_13_1 - arg_13_0) * var_13_0 + arg_13_0
end

function slot_0_3_0.breathe(arg_14_0, arg_14_1)
	arg_14_1 = arg_14_1 or 1

	local var_14_0 = game.global_vars.real_time * arg_14_1 % math.pi

	return math.abs(math.sin(var_14_0 + (arg_14_0 or 0)))
end

function slot_0_3_0.lerp_color(arg_15_0, arg_15_1, arg_15_2)
	return draw.color(slot_0_3_0.lerp(arg_15_0:get_r(), arg_15_1:get_r(), arg_15_2), slot_0_3_0.lerp(arg_15_0:get_g(), arg_15_1:get_g(), arg_15_2), slot_0_3_0.lerp(arg_15_0:get_b(), arg_15_1:get_b(), arg_15_2), slot_0_3_0.lerp(arg_15_0:get_a(), arg_15_1:get_a(), arg_15_2))
end

function slot_0_3_0.render_container(arg_16_0, arg_16_1, arg_16_2, arg_16_3, arg_16_4, arg_16_5, arg_16_6, arg_16_7)
	slot_16_8_0 = draw.surface
	slot_16_8_0.font = draw.fonts.gui_main
	slot_16_9_0 = 7
	slot_16_10_0 = {}
	slot_16_11_0 = {}

	for iter_16_0 in string.gmatch(arg_16_0, "[^|]+") do
		iter_16_0 = iter_16_0:match("^%s*(.-)%s*$")

		table.insert(slot_16_11_0, iter_16_0)
	end

	arg_16_1 = arg_16_1 * 255
	slot_16_12_0 = draw.color(160, 160, 170, arg_16_1 * 0.75)
	slot_16_13_0 = draw.color(255, 255, 255, arg_16_1)

	if arg_16_5 then
		slot_16_13_0 = draw.color(arg_16_5:get_r(), arg_16_5:get_g(), arg_16_5:get_b(), arg_16_1)
	end

	function slot_16_14_0(arg_17_0)
		local var_17_0 = {}

		if arg_17_0:match("^%d+:%d+%s+[ap]m$") then
			local var_17_1, var_17_2 = arg_17_0:match("^(%d+:%d+)%s+([ap]m)$")

			table.insert(var_17_0, {
				is_number = true,
				text = var_17_1
			})
			table.insert(var_17_0, {
				text = " ",
				is_number = false
			})
			table.insert(var_17_0, {
				is_number = false,
				text = var_17_2
			})

			return var_17_0
		end

		for iter_17_0 in string.gmatch(arg_17_0, "%S+") do
			if iter_17_0:match("^[%d%.]+") then
				local var_17_3, var_17_4 = iter_17_0:match("^([%d%.]+)(.*)$")

				if var_17_3 then
					table.insert(var_17_0, {
						is_number = true,
						text = var_17_3
					})

					if var_17_4 and var_17_4 ~= "" then
						table.insert(var_17_0, {
							is_number = false,
							text = var_17_4
						})
					end
				end
			else
				table.insert(var_17_0, {
					is_number = false,
					text = iter_17_0
				})
			end

			table.insert(var_17_0, {
				text = " ",
				is_number = false
			})
		end

		if #var_17_0 > 0 and var_17_0[#var_17_0].text == " " then
			table.remove(var_17_0)
		end

		return var_17_0
	end

	if slot_16_11_0[1] then
		table.insert(slot_16_10_0, {
			text = " " .. slot_16_11_0[1],
			color = slot_16_13_0
		})
	end

	for iter_16_1 = 2, #slot_16_11_0 do
		table.insert(slot_16_10_0, {
			text = "   ",
			color = slot_16_12_0
		})

		slot_16_19_1 = slot_16_14_0(slot_16_11_0[iter_16_1])

		for iter_16_2, iter_16_3 in ipairs(slot_16_19_1) do
			slot_16_25_1 = iter_16_3.is_number and slot_16_13_0 or slot_16_12_0

			table.insert(slot_16_10_0, {
				text = iter_16_3.text,
				color = slot_16_25_1
			})
		end
	end

	slot_16_15_0 = 0
	slot_16_16_0 = 0

	for iter_16_4, iter_16_5 in ipairs(slot_16_10_0) do
		slot_16_22_1 = slot_16_8_0.font:get_text_size(iter_16_5.text, true)
		slot_16_15_0 = slot_16_15_0 + slot_16_22_1.x

		if slot_16_16_0 < slot_16_22_1.y then
			slot_16_16_0 = slot_16_22_1.y
		end
	end

	slot_16_17_0 = slot_16_15_0 + slot_16_9_0 * 2
	slot_16_18_0 = slot_16_16_0 + slot_16_9_0 * 2
	slot_16_19_0 = arg_16_2
	slot_16_20_0 = arg_16_3

	if arg_16_4 == "right" then
		slot_16_19_0 = arg_16_2 - slot_16_17_0
	elseif arg_16_4 == "center" then
		slot_16_19_0 = arg_16_2 - slot_16_17_0 * 0.5
		slot_16_20_0 = arg_16_3 - slot_16_18_0 - 10
	end

	slot_16_21_0 = draw.color(12, 12, 14, arg_16_1 * 0.65)
	slot_16_22_0 = draw.color(35, 35, 40, arg_16_1 * 0.4)
	slot_16_23_0 = draw.rect(draw.vec2(slot_16_19_0 - 0.5, slot_16_20_0 - 0.5), draw.vec2(slot_16_19_0 + slot_16_17_0 + 0.5, slot_16_20_0 + slot_16_18_0 + 0.5))

	slot_16_8_0:add_rect_filled_rounded(slot_16_23_0, slot_16_22_0, 6)

	slot_16_24_0 = draw.rect(draw.vec2(slot_16_19_0, slot_16_20_0), draw.vec2(slot_16_19_0 + slot_16_17_0, slot_16_20_0 + slot_16_18_0))

	slot_16_8_0:add_rect_filled_rounded(slot_16_24_0, slot_16_21_0, 5.5)

	slot_16_25_0 = draw.color(255, 255, 255, arg_16_1 * 0.08)
	slot_16_26_0 = draw.rect(draw.vec2(slot_16_19_0 + 1, slot_16_20_0 + 1), draw.vec2(slot_16_19_0 + slot_16_17_0 - 1, slot_16_20_0 + slot_16_18_0 * 0.45))

	slot_16_8_0:add_rect_filled_rounded_multicolor(slot_16_26_0, {
		slot_16_25_0,
		slot_16_25_0,
		draw.color(255, 255, 255, 0),
		draw.color(255, 255, 255, 0)
	}, 5, draw.rounding.top)

	if arg_16_6 then
		slot_16_27_1 = arg_16_7 and arg_16_7 or slot_16_13_0
		slot_16_28_1 = slot_16_27_1:mod_a(0)
		slot_16_29_0 = 1.5
		slot_16_30_0 = slot_16_18_0 * 0.7
		slot_16_31_0 = slot_16_20_0 + (slot_16_18_0 - slot_16_30_0) / 2
		slot_16_32_1 = draw.rect(draw.vec2(slot_16_19_0 + 1, slot_16_31_0), draw.vec2(slot_16_19_0 + 1 + slot_16_29_0, slot_16_31_0 + slot_16_30_0 / 2))
		slot_16_33_1 = draw.rect(draw.vec2(slot_16_19_0 + 1, slot_16_31_0 + slot_16_30_0 / 2), draw.vec2(slot_16_19_0 + 1 + slot_16_29_0, slot_16_31_0 + slot_16_30_0))

		slot_16_8_0:add_rect_filled_multicolor(slot_16_32_1, {
			slot_16_28_1,
			slot_16_28_1,
			slot_16_27_1,
			slot_16_27_1
		})
		slot_16_8_0:add_rect_filled_multicolor(slot_16_33_1, {
			slot_16_27_1,
			slot_16_27_1,
			slot_16_28_1,
			slot_16_28_1
		})
	end

	slot_16_27_0 = slot_16_19_0 + slot_16_9_0
	slot_16_28_0 = slot_16_20_0 + slot_16_9_0

	for iter_16_6, iter_16_7 in ipairs(slot_16_10_0) do
		slot_16_34_0 = draw.vec2(slot_16_27_0, slot_16_28_0)

		slot_16_8_0:add_text(slot_16_34_0, iter_16_7.text, iter_16_7.color, draw.text_params)

		slot_16_27_0 = slot_16_27_0 + slot_16_8_0.font:get_text_size(iter_16_7.text, true).x
	end

	return slot_16_17_0, slot_16_18_0
end

function slot_0_3_0.getThrowTime()
	local var_18_0 = entities.get_local_pawn()

	if not var_18_0 then
		return
	end

	local var_18_1 = var_18_0:get_active_weapon()

	if not var_18_1 then
		return
	end

	local var_18_2 = var_18_1.m_fThrowTime

	if not var_18_2 then
		return
	end

	return var_18_2:get().value
end

slot_0_4_0 = {}
slot_0_5_0 = nil
slot_0_6_1 = {}
slot_0_7_2 = 0

function slot_0_4_0.process()
	local var_19_0 = game.global_vars.frame_time
	local var_19_1 = tonumber((slot_0_5_0 and slot_0_5_0() or 0) / 1000)

	if var_19_0 == 0 then
		var_19_0 = var_19_1 - slot_0_7_2
	end

	local var_19_2 = 10
	local var_19_3 = 10
	local var_19_4 = 0

	for iter_19_0 = 7, #slot_0_6_1 do
		slot_0_6_1[iter_19_0].time_left = 0
	end

	for iter_19_1, iter_19_2 in ipairs(slot_0_6_1) do
		local var_19_5 = iter_19_2.time_left > 0

		if not var_19_5 and iter_19_2.fraction <= 0 then
			table.remove(slot_0_6_1, iter_19_1)
		else
			iter_19_2.fraction = math.clamp(iter_19_2.fraction + (var_19_5 and 6 * var_19_0 or -(6 * var_19_0)), 0, 1)
			iter_19_2.offset = math.min(var_19_4, iter_19_2.offset + 200 * var_19_0)

			local var_19_6, var_19_7 = slot_0_3_0.render_container(iter_19_2.text, iter_19_2.fraction, var_19_2, var_19_3 + iter_19_2.offset, nil, nil, true, iter_19_2.color_override)

			iter_19_2.time_left = iter_19_2.time_left - var_19_0
			var_19_4 = var_19_4 + var_19_7 + 5
		end
	end

	slot_0_7_2 = var_19_1
end

function slot_0_4_0.add(arg_20_0, arg_20_1, arg_20_2)
	if type(arg_20_0) == "string" then
		arg_20_2 = arg_20_1
		arg_20_1 = arg_20_0
		arg_20_0 = 4
	end

	table.insert(slot_0_6_1, 1, {
		offset = 0,
		fraction = 0,
		color_override = arg_20_2,
		time_left = arg_20_0,
		base_time = arg_20_0,
		text = arg_20_1
	})
end

events.present_queue:add(slot_0_4_0.process)

if not ffi then
	game.engine:client_cmd("play sounds/ui/panorama/lobby_error_01")
	slot_0_4_0.add(4, "Allow insecure (lock icon) should be enabled", draw.color(148, 24, 15))

	return
end

if not ws.test_capability("clipboard") then
	game.engine:client_cmd("play sounds/ui/panorama/lobby_error_01")
	slot_0_4_0.add(4, "You must allow the script to use the clipboard", draw.color(148, 24, 15))

	return
end

slot_0_6_0 = {
	contains = function(arg_21_0, arg_21_1)
		local var_21_0 = false

		for iter_21_0 = 1, #arg_21_0 do
			if arg_21_0[iter_21_0] == arg_21_1 then
				var_21_0 = true

				break
			end
		end

		return var_21_0
	end,
	object_contains = function(arg_22_0, arg_22_1)
		for iter_22_0, iter_22_1 in pairs(arg_22_0) do
			if iter_22_1 == arg_22_1 then
				return true
			end
		end

		return false
	end
}
slot_0_7_1 = nil
slot_0_8_1 = nil
slot_0_9_1 = nil
slot_0_7_0, slot_0_8_0, slot_0_9_0 = {}, {}, {}
slot_0_10_1 = {}
slot_0_11_1 = {}

function slot_0_12_2(arg_23_0)
	return math.floor(math.log(arg_23_0) / math.log(2)) + 1
end

function slot_0_13_1(arg_24_0, arg_24_1)
	local var_24_0 = arg_24_0 % 4294967296
	local var_24_1 = math.floor(arg_24_0 / 4294967296)

	if arg_24_1 < 32 then
		return bit.band(bit.rshift(var_24_0, arg_24_1), 1) == 1
	else
		return bit.band(bit.rshift(var_24_1, arg_24_1 - 32), 1) == 1
	end
end

slot_0_14_2 = nil
slot_0_15_3 = nil
slot_0_15_2 = {
	depend = function(arg_25_0, arg_25_1)
		if type(arg_25_1) == "table" and arg_25_1.__name == "element" then
			arg_25_0.dependance[#arg_25_0.dependance + 1] = function()
				return arg_25_1:get() == true
			end
		elseif type(arg_25_1) == "table" then
			local var_25_0, var_25_1, var_25_2 = unpack(arg_25_1)

			if type(var_25_1) == "function" then
				arg_25_0.dependance[#arg_25_0.dependance + 1] = function()
					local var_27_0 = var_25_1(var_25_0)

					if var_25_2 then
						return not var_27_0
					end

					return var_27_0
				end
			elseif var_25_0.type == gui.control_type.combo_box and var_25_0.is_multiselect then
				if type(var_25_1) == "string" then
					arg_25_0.dependance[#arg_25_0.dependance + 1] = function()
						local var_28_0 = slot_0_6_0.contains(var_25_0:get(), var_25_1)

						if var_25_2 then
							return not var_28_0
						end

						return var_28_0
					end
				elseif type(var_25_1) == "table" then
					arg_25_0.dependance[#arg_25_0.dependance + 1] = function()
						local var_29_0 = var_25_0:get()
						local var_29_1

						for iter_29_0 = 1, #var_25_1 do
							if slot_0_6_0.contains(var_29_0, var_25_1[iter_29_0]) then
								var_29_1 = true

								break
							end
						end

						if var_25_2 then
							return not var_29_1
						end

						return var_29_1
					end
				end
			elseif var_25_0.type == gui.control_type.combo_box then
				if type(var_25_1) == "string" then
					arg_25_0.dependance[#arg_25_0.dependance + 1] = function()
						local var_30_0 = var_25_0:get() == var_25_1

						if var_25_2 then
							return not var_30_0
						end

						return var_30_0
					end
				elseif type(var_25_1) == "table" then
					arg_25_0.dependance[#arg_25_0.dependance + 1] = function()
						local var_31_0 = var_25_0:get()
						local var_31_1

						for iter_31_0 = 1, #var_25_1 do
							if var_31_0 == var_25_1[iter_31_0] then
								var_31_1 = true

								break
							end
						end

						if var_25_2 then
							return not var_31_1
						end

						return var_31_1
					end
				end
			else
				arg_25_0.dependance[#arg_25_0.dependance + 1] = function()
					local var_32_0 = var_25_0:get() == var_25_1

					if var_25_2 then
						return not var_32_0
					end

					return var_32_0
				end
			end
		end

		return arg_25_0
	end,
	get_hotkey_state = function(arg_33_0)
		return arg_33_0.reference:get_hotkey_state()
	end,
	get = function(arg_34_0, arg_34_1)
		if not arg_34_0.is_value then
			return nil
		end

		if arg_34_0.type == gui.control_type.text_input then
			return arg_34_0.reference.value
		end

		if arg_34_0.type == gui.control_type.combo_box then
			local var_34_0 = arg_34_0.reference:get_value()

			if arg_34_1 then
				var_34_0 = var_34_0:get_direct()
			else
				var_34_0 = var_34_0:get()
			end

			local var_34_1 = var_34_0:get_raw()

			if arg_34_0.is_multiselect then
				local var_34_2 = {}
				local var_34_3 = 1

				for iter_34_0, iter_34_1 in ipairs(arg_34_0.elements) do
					if slot_0_13_1(var_34_1, iter_34_0 - 1) then
						var_34_2[var_34_3] = iter_34_1
						var_34_3 = var_34_3 + 1
					end
				end

				return var_34_2
			else
				return arg_34_0.elements[slot_0_12_2(var_34_1)]
			end
		elseif arg_34_1 then
			return arg_34_0.reference:get_value():get_direct()
		else
			return arg_34_0.reference:get_value():get()
		end
	end,
	add = function(arg_35_0, arg_35_1)
		if arg_35_0.type ~= gui.control_type.combo_box then
			return error("cannot invoke on this type")
		end

		arg_35_0.element_controls[#arg_35_0.element_controls + 1] = gui.selectable(gui.control_id(("xo_lite_%s"):format(arg_35_1)), arg_35_1)
		arg_35_0.elements[#arg_35_0.elements + 1] = arg_35_1

		arg_35_0.reference:add(arg_35_0.element_controls[#arg_35_0.element_controls])
	end,
	remove = function(arg_36_0, arg_36_1)
		if arg_36_0.type ~= gui.control_type.combo_box then
			return error("cannot invoke on this type")
		end

		for iter_36_0, iter_36_1 in ipairs(arg_36_0.element_controls) do
			if iter_36_1.id == ("xo_lite_%s"):format(arg_36_1) then
				arg_36_0.reference:remove(iter_36_1)
				table.remove(arg_36_0.element_controls, iter_36_0)
				table.remove(arg_36_0.elements, iter_36_0)
			end
		end
	end,
	set = function(arg_37_0, arg_37_1)
		if not arg_37_0.is_value then
			return
		end

		if arg_37_0.type == gui.control_type.text_input then
			return
		end

		local var_37_0 = arg_37_0.reference:get_value()

		if not var_37_0 then
			return
		end

		if arg_37_0.type == gui.control_type.combo_box then
			if arg_37_0.is_multiselect then
				local var_37_1 = 0

				if type(arg_37_1) == "table" then
					for iter_37_0, iter_37_1 in ipairs(arg_37_0.elements) do
						if slot_0_6_0.contains(arg_37_1, iter_37_1) then
							var_37_1 = bit.bor(var_37_1, bit.lshift(1, iter_37_0 - 1))
						end
					end
				end

				local var_37_2 = var_37_0:get_direct()

				var_37_2:set_raw(var_37_1)
				var_37_0:set(var_37_2)

				slot_0_8_0[arg_37_0.id] = arg_37_0:get()
			else
				local var_37_3 = 1

				for iter_37_2 = 1, #arg_37_0.elements do
					if arg_37_1 == arg_37_0.elements[iter_37_2] then
						var_37_3 = iter_37_2

						break
					end
				end

				local var_37_4 = var_37_0:get_direct()

				var_37_4:set_raw(bit.lshift(1, var_37_3 - 1))
				var_37_0:set(var_37_4)

				slot_0_8_0[arg_37_0.id] = arg_37_1
			end
		else
			var_37_0:set(arg_37_1)

			slot_0_8_0[arg_37_0.id] = arg_37_1
		end
	end,
	sameRow = function(arg_38_0, arg_38_1, arg_38_2, ...)
		local var_38_0 = gui[arg_38_1](gui.control_id(("xo_lite_%s"):format(arg_38_2)), ...)

		arg_38_0.row:add(var_38_0)

		arg_38_0.same_row = arg_38_0.same_row or {}
		arg_38_0.same_row[#arg_38_0.same_row + 1] = slot_0_14_2({
			ref = var_38_0,
			row = arg_38_0.row,
			group = arg_38_0.group,
			group_mt = arg_38_0.group_mt
		}, arg_38_2, true)

		return arg_38_0.same_row[#arg_38_0.same_row]
	end,
	override = function(arg_39_0, arg_39_1)
		arg_39_0.overriden = false

		if arg_39_1 == nil then
			if arg_39_0.old_value ~= nil then
				arg_39_0:set(arg_39_0.old_value)

				arg_39_0.old_value = nil
			end

			return
		end

		if arg_39_0.old_value == nil then
			arg_39_0.old_value = arg_39_0:get(true)
		end

		arg_39_0.overriden = true

		arg_39_0:set(arg_39_1)
	end,
	set_tooltip = function(arg_40_0, arg_40_1)
		arg_40_0.reference.tooltip = arg_40_1

		return arg_40_0
	end,
	set_visible = function(arg_41_0, arg_41_1)
		if not arg_41_0.row then
			return
		end

		arg_41_0.row:set_visible(arg_41_1)
	end,
	__runSpecialCb = function(arg_42_0, arg_42_1)
		if arg_42_0.is_value then
			slot_0_8_0[arg_42_0.id] = arg_42_0:get()
		end

		if arg_42_0.cached_value ~= nil and slot_0_8_0[arg_42_0.id] ~= arg_42_0.cached_value then
			arg_42_1(arg_42_0)
		end

		arg_42_0.cached_value = slot_0_8_0[arg_42_0.id]
	end,
	set_callback = function(arg_43_0, arg_43_1, arg_43_2, arg_43_3)
		arg_43_0.callback_list[#arg_43_0.callback_list + 1] = arg_43_3 and {
			arg_43_1,
			true
		} or arg_43_1

		if arg_43_2 then
			void_ret = arg_43_3 and arg_43_0:__runSpecialCb(arg_43_1) or arg_43_1(arg_43_0)
		end
	end,
	update = function(arg_44_0, arg_44_1)
		return
	end,
	on_callback = function(arg_45_0)
		if config_system and config_system.is_loading and config_system.is_loading() then
			return
		end

		if arg_45_0.is_value then
			slot_0_8_0[arg_45_0.id] = arg_45_0:get()
		end

		for iter_45_0 = 1, #arg_45_0.callback_list do
			local var_45_0 = arg_45_0.callback_list[iter_45_0]

			if type(var_45_0) == "table" and var_45_0[2] then
				arg_45_0:__runSpecialCb(var_45_0[1])
			else
				var_45_0(arg_45_0)
			end
		end
	end,
	invoke = function(arg_46_0)
		arg_46_0:on_callback()
	end
}
slot_0_16_4 = {
	[gui.control_type.button] = true,
	[gui.control_type.label] = true,
	[gui.control_type.hotkey] = true
}

function slot_0_14_2(arg_47_0, arg_47_1, arg_47_2, arg_47_3)
	local var_47_0 = arg_47_0.ref.type
	local var_47_1 = setmetatable({
		__name = "element",
		is_inside_container = true,
		id = arg_47_1,
		reference = arg_47_0.ref,
		group = arg_47_0.group,
		group_mt = arg_47_0.group_mt,
		row = arg_47_0.row,
		type = var_47_0,
		is_multiselect = arg_47_0.is_multiselect,
		elements = arg_47_0.elements,
		element_controls = arg_47_0.element_controls,
		is_builtin = arg_47_1:match("ftref"),
		is_value = not slot_0_16_4[var_47_0],
		ignore_save = slot_0_16_4[var_47_0],
		dependance = {}
	}, {
		__index = slot_0_15_2
	})

	if not var_47_1.is_builtin then
		for iter_47_0 = 1, #slot_0_11_1 do
			var_47_1:depend(slot_0_11_1[iter_47_0])
		end

		if arg_47_0.group_mt and arg_47_0.group_mt.tab and arg_47_0.group_mt.tab_name then
			var_47_1:depend({
				arg_47_0.group_mt.tab,
				arg_47_0.group_mt.tab_name
			})
		end
	end

	slot_0_10_1[arg_47_1] = var_47_1
	slot_0_9_0[arg_47_1] = var_47_1

	if arg_47_2 then
		var_47_1.callback_list = {
			arg_47_3
		}

		arg_47_0.ref:add_callback(function()
			if config_system and config_system.is_loading and config_system.is_loading() then
				return
			end

			slot_0_7_0:update_visibility()
			var_47_1:on_callback()
		end)
		table.insert(slot_0_0_0.scheduled_tasks, {
			time_remaining = 0.1,
			callback = function()
				slot_0_8_0[var_47_1.id] = var_47_1:get()
			end
		})

		slot_0_8_0[arg_47_1] = var_47_1:get()
	end

	return var_47_1
end

function slot_0_7_0.update_visibility(arg_50_0)
	for iter_50_0, iter_50_1 in pairs(slot_0_10_1) do
		if not iter_50_1.is_builtin then
			local var_50_0 = true

			for iter_50_2 = 1, #iter_50_1.dependance do
				if not iter_50_1.dependance[iter_50_2](iter_50_1) then
					var_50_0 = false

					break
				end
			end

			iter_50_1:set_visible(var_50_0)
		end
	end
end

function slot_0_7_0.reference(arg_51_0, arg_51_1, arg_51_2)
	local var_51_0 = gui.ctx:find(arg_51_0)
	local var_51_1 = true

	if not var_51_0 then
		var_51_1 = nil
		var_51_0 = gui.ctx:find(arg_51_2)
	end

	local var_51_2 = string.format("%s:ftref", arg_51_0)
	local var_51_3 = false

	if arg_51_1 and arg_51_1[#arg_51_1] == true then
		var_51_3 = true

		table.remove(arg_51_1, #arg_51_1)
	end

	return slot_0_14_2({
		ref = var_51_0,
		elements = arg_51_1,
		is_multiselect = var_51_3
	}, var_51_2, nil, nil), var_51_1
end

slot_0_7_0.callbacks = {}

function slot_0_7_0.callbacks.shutdown()
	for iter_52_0, iter_52_1 in pairs(slot_0_10_1) do
		iter_52_1:override()
	end
end

slot_0_16_3 = nil
slot_0_17_13 = nil
slot_0_17_12 = {
	reset = function(arg_53_0)
		arg_53_0.group:reset()
	end,
	checkbox = function(arg_54_0, arg_54_1, arg_54_2, ...)
		local var_54_0 = gui.checkbox(gui.control_id(("xo_lite_%s"):format(arg_54_1)))
		local var_54_1 = gui.make_control(arg_54_2, var_54_0)
		local var_54_2 = slot_0_14_2({
			ref = var_54_0,
			row = var_54_1,
			group = arg_54_0.group,
			group_mt = arg_54_0
		}, arg_54_1, true)
		local var_54_3 = {
			...
		}

		for iter_54_0 = 1, #var_54_3 do
			local var_54_4 = var_54_3[iter_54_0]

			if var_54_4 == "color" then
				local var_54_5 = gui.color_picker(gui.control_id(("xo_lite_%s_%s_%d"):format(arg_54_1, var_54_4, iter_54_0)))

				var_54_1:add(var_54_5)

				var_54_2[("color_%d"):format(iter_54_0)] = slot_0_14_2({
					ref = var_54_5,
					row = var_54_1,
					group = arg_54_0.group,
					group_mt = arg_54_0
				}, string.format("%s_%s%d", arg_54_1, var_54_4, iter_54_0), true)
			elseif type(var_54_4) == "table" then
				local var_54_6 = false

				if var_54_4[#var_54_4] == true then
					var_54_6 = true

					table.remove(var_54_4, #var_54_4)
				end

				local var_54_7 = var_54_6 and "multiselect" or "combo"
				local var_54_8 = gui.combo_box(gui.control_id(("xo_lite_%s_%s_%d"):format(arg_54_1, var_54_7, iter_54_0)))

				if var_54_6 then
					var_54_8.allow_multiple = true
				end

				local var_54_9 = slot_0_14_2({
					ref = var_54_8,
					row = var_54_1,
					group = arg_54_0.group,
					is_multiselect = var_54_6,
					elements = var_54_4,
					group_mt = arg_54_0
				}, string.format("%s_%s%d", arg_54_1, var_54_7, iter_54_0), true)
				local var_54_10 = 1

				var_54_9.element_controls = {}

				for iter_54_1, iter_54_2 in ipairs(var_54_4) do
					local var_54_11 = gui.selectable(gui.control_id(("xo_lite_%s_%d_%d"):format(arg_54_1, iter_54_1, var_54_10)), iter_54_2)

					var_54_8:add(var_54_11)

					var_54_9.element_controls[var_54_10] = var_54_11
					var_54_10 = var_54_10 + 1
				end

				var_54_1:add(var_54_8)

				var_54_2[("%s_%d"):format(var_54_7, iter_54_0)] = var_54_9
			end
		end

		arg_54_0.group:add(var_54_1)

		return var_54_2
	end,
	combobox = function(arg_55_0, arg_55_1, arg_55_2, arg_55_3)
		local var_55_0 = gui.combo_box(gui.control_id(("xo_lite_%s"):format(arg_55_1)))
		local var_55_1 = gui.make_control(arg_55_2, var_55_0)
		local var_55_2 = slot_0_14_2({
			ref = var_55_0,
			row = var_55_1,
			group = arg_55_0.group,
			group_mt = arg_55_0,
			elements = arg_55_3,
			element_controls = {}
		}, arg_55_1, true)

		var_55_2.elements = arg_55_3
		var_55_2.element_controls = {}

		for iter_55_0, iter_55_1 in ipairs(arg_55_3) do
			local var_55_3 = gui.selectable(gui.control_id(("xo_lite_%s%d"):format(arg_55_1, iter_55_0)), iter_55_1)

			var_55_0:add(var_55_3)

			var_55_2.element_controls[iter_55_0] = var_55_3
		end

		arg_55_0.group:add(var_55_1)

		return var_55_2
	end,
	multiselect = function(arg_56_0, arg_56_1, arg_56_2, arg_56_3)
		local var_56_0 = gui.combo_box(gui.control_id(("xo_lite_%s"):format(arg_56_1)))
		local var_56_1 = gui.make_control(arg_56_2, var_56_0)
		local var_56_2 = slot_0_14_2({
			is_multiselect = true,
			ref = var_56_0,
			row = var_56_1,
			group = arg_56_0.group,
			group_mt = arg_56_0,
			elements = arg_56_3,
			element_controls = {}
		}, arg_56_1, true)

		var_56_0.allow_multiple = true

		for iter_56_0, iter_56_1 in ipairs(arg_56_3) do
			local var_56_3 = gui.selectable(gui.control_id(("xo_lite_%s%d"):format(arg_56_1, iter_56_0)), iter_56_1)

			var_56_0:add(var_56_3)

			var_56_2.element_controls[iter_56_0] = var_56_3
		end

		arg_56_0.group:add(var_56_1)

		return var_56_2
	end,
	button = function(arg_57_0, arg_57_1, arg_57_2, arg_57_3)
		local var_57_0 = gui.button(gui.control_id(("xo_lite_%s"):format(arg_57_1)), arg_57_2)
		local var_57_1 = gui.make_control("", var_57_0)
		local var_57_2 = slot_0_14_2({
			ref = var_57_0,
			row = var_57_1,
			group = arg_57_0.group,
			group_mt = arg_57_0
		}, arg_57_1, true, arg_57_3)

		arg_57_0.group:add(var_57_1)

		return var_57_2
	end,
	label = function(arg_58_0, arg_58_1)
		local var_58_0 = gui.label(gui.control_id(arg_58_1))
		local var_58_1 = gui.make_control(arg_58_1, var_58_0)
		local var_58_2 = slot_0_14_2({
			ref = var_58_0,
			row = var_58_1,
			group = arg_58_0.group,
			group_mt = arg_58_0
		}, arg_58_1, true)
		local var_58_3 = gui.spacer(gui.control_id(arg_58_1 .. "spacer"))

		var_58_1:add(var_58_3)
		arg_58_0.group:add(var_58_1)

		return var_58_2
	end,
	slider = function(arg_59_0, arg_59_1, arg_59_2, arg_59_3, arg_59_4, arg_59_5, arg_59_6)
		local var_59_0 = gui.slider(gui.control_id(("xo_lite_%s"):format(arg_59_1)), arg_59_3, arg_59_4, arg_59_5, arg_59_6)
		local var_59_1 = gui.make_control(arg_59_2, var_59_0)
		local var_59_2 = slot_0_14_2({
			ref = var_59_0,
			row = var_59_1,
			group = arg_59_0.group,
			group_mt = arg_59_0
		}, arg_59_1, true)

		arg_59_0.group:add(var_59_1)

		return var_59_2
	end,
	color_picker = function(arg_60_0, arg_60_1, arg_60_2)
		local var_60_0 = gui.color_picker(gui.control_id(("xo_lite_%s"):format(arg_60_1)))
		local var_60_1 = gui.make_control(arg_60_2, var_60_0)
		local var_60_2 = slot_0_14_2({
			ref = var_60_0,
			row = var_60_1,
			group = arg_60_0.group,
			group_mt = arg_60_0
		}, arg_60_1, true)

		arg_60_0.group:add(var_60_1)

		return var_60_2
	end,
	textbox = function(arg_61_0, arg_61_1, arg_61_2)
		local var_61_0 = gui.text_input(gui.control_id(("xo_lite_%s"):format(arg_61_1)))
		local var_61_1 = gui.make_control(arg_61_2, var_61_0)
		local var_61_2 = slot_0_14_2({
			ref = var_61_0,
			row = var_61_1,
			group = arg_61_0.group,
			group_mt = arg_61_0
		}, arg_61_1, true)

		arg_61_0.group:add(var_61_1)

		return var_61_2
	end
}

function slot_0_17_12.subtab(arg_62_0, arg_62_1)
	arg_62_0.tab:add(arg_62_1)

	return setmetatable({
		group = arg_62_0.group,
		tab = arg_62_0.tab,
		tab_name = arg_62_1
	}, {
		__index = slot_0_17_12
	})
end

function slot_0_16_2(arg_63_0, arg_63_1)
	local var_63_0 = gui.ctx:find(arg_63_0)
	local var_63_1 = setmetatable({
		group = var_63_0
	}, {
		__index = slot_0_17_12
	})

	var_63_1.tab = var_63_1:combobox("menu_tab", "Tab: ", {})

	return var_63_1
end

function slot_0_18_6(...)
	local var_64_0 = {}
	local var_64_1 = {
		...
	}
	local var_64_2 = 1

	for iter_64_0 = 1, #var_64_1 do
		for iter_64_1, iter_64_2 in pairs(var_64_1[iter_64_0]) do
			var_64_0[var_64_2] = iter_64_2
			var_64_2 = var_64_2 + 1
		end
	end

	return var_64_0
end

function slot_0_7_0.push_dependence(...)
	slot_0_11_1 = slot_0_18_6(slot_0_11_1, {
		...
	})
end

function slot_0_7_0.fill_dependence(arg_66_0)
	for iter_66_0 = 1, #slot_0_11_1 do
		arg_66_0:depend(slot_0_11_1[iter_66_0])
	end
end

function slot_0_19_6(arg_67_0, arg_67_1)
	for iter_67_0, iter_67_1 in pairs(arg_67_0) do
		if iter_67_1 ~= arg_67_1[iter_67_0] then
			return false
		end
	end

	for iter_67_2, iter_67_3 in pairs(arg_67_1) do
		if iter_67_3 ~= arg_67_0[iter_67_2] then
			return false
		end
	end

	return true
end

function slot_0_7_0.pop_dependence(...)
	local var_68_0 = {
		...
	}

	if not var_68_0[1] then
		slot_0_11_1 = {}

		return
	end

	for iter_68_0, iter_68_1 in ipairs(slot_0_11_1) do
		for iter_68_2 = 1, #var_68_0 do
			local var_68_1 = var_68_0[iter_68_2]

			if slot_0_19_6(var_68_1, iter_68_1) then
				table.remove(slot_0_11_1, iter_68_0)
			end
		end
	end

	return slot_0_11_1
end

function slot_0_7_0.group(arg_69_0, arg_69_1)
	return slot_0_16_2(arg_69_0, arg_69_1)
end

slot_0_10_0 = {
	override_left = slot_0_7_0.reference("rage>anti-aim>angles>manual override>override left"),
	override_right = slot_0_7_0.reference("rage>anti-aim>angles>manual override>override right"),
	override_back = slot_0_7_0.reference("rage>anti-aim>angles>manual override>override back"),
	override_forward = slot_0_7_0.reference("rage>anti-aim>angles>manual override>override forward"),
	yaw = slot_0_7_0.reference("rage>anti-aim>angles>yaw", {
		"None",
		"Backwards",
		"Custom"
	}),
	anti_aim = slot_0_7_0.reference("rage>anti-aim>angles>anti-aim"),
	yaw_offset_control = slot_0_7_0.reference("rage>anti-aim>angles>yaw>settings>amount"),
	jump_bug = slot_0_7_0.reference("misc>movement>jumpbug"),
	no_land_inaccuracy = slot_0_7_0.reference("misc>movement>no land inaccuracy"),
	double_tap = slot_0_7_0.reference("rage>aimbot>doubletap"),
	double_tap_manual = slot_0_7_0.reference("rage>aimbot>doubletap>settings>on manual shot"),
	knife_bot = slot_0_7_0.reference("rage>general>knife bot"),
	peek_assist = {
		main = slot_0_7_0.reference("misc>movement>peek assist"),
		col1 = slot_0_7_0.reference("misc>movement>peek assist>col 1"),
		col2 = slot_0_7_0.reference("misc>movement>peek assist>col 2"),
		cancel_movement = slot_0_7_0.reference("misc>movement>peek assist>cancel on movement"),
		distance = slot_0_7_0.reference("misc>movement>peek assist>distance"),
		retreat_on_release = slot_0_7_0.reference("misc>movement>peek assist>retreat on release")
	},
	slowwalk = slot_0_7_0.reference("misc>movement>slowwalk"),
	force_shot = slot_0_7_0.reference("rage>aimbot>general>force shoot")
}

function slot_0_3_0.vec2_add(arg_70_0, arg_70_1)
	return draw.vec2(arg_70_0.x + arg_70_1.x, arg_70_0.y + arg_70_1.y)
end

slot_0_11_0 = {}
slot_0_12_1 = ffi.cast("void*", -1)

ffi.cdef("        typedef void *PVOID;\n        typedef int BOOL;\n        typedef unsigned char BYTE;\n        typedef char CHAR;\n        typedef unsigned long DWORD;\n        typedef unsigned __int64 DWORD_PTR;\n        typedef void * __ptr64 HANDLE;\n        typedef struct HINSTANCE*  HMODULE;\n        typedef void * __ptr64 HINTERNET;\n        typedef struct HINSTANCE__ * __ptr64 HINSTANCE;\n        typedef struct HKEY__ * __ptr64 HKEY;\n        typedef long HRESULT;\n        typedef struct HWND__ * __ptr64 HWND;\n        typedef int INT;\n        typedef unsigned short INTERNET_PORT;\n        typedef long LONG;\n        typedef struct IBindCtx* LPBC;\n        typedef struct IBindStatusCallback* LPBINDSTATUSCALLBACK;\n        typedef unsigned char * __ptr64 LPBYTE;\n        typedef char const * __ptr64 LPCSTR;\n        typedef wchar_t const* LPCTSTR;\n        typedef wchar_t const* LPCWSTR;\n        typedef unsigned long * __ptr64 LPDWORD;\n        typedef struct _FILETIME * __ptr64 LPFILETIME;\n        typedef struct _OVERLAPPED * LPOVERLAPPED;\n        typedef struct _SECURITY_ATTRIBUTES * __ptr64 LPSECURITY_ATTRIBUTES;\n        typedef char* LPSTR;\n        typedef void * __ptr64 LPVOID;\n        typedef void const * __ptr64 LPCVOID;\n        typedef struct IUnknown* LPUNKNOWN;\n        typedef long LSTATUS;\n        typedef long long LONGLONG;\n        typedef struct HKEY__ * __ptr64 * __ptr64 PHKEY;\n        typedef unsigned long REGSAM;\n        typedef unsigned long ULONG_PTR;\n        typedef unsigned short WORD;\n        typedef unsigned int  UINT;\n        typedef unsigned __int64 ULONG_PTR;\n        typedef unsigned long long ULONGLONG;\n        typedef ULONGLONG *PULONGLONG;\n        typedef ULONGLONG DWORDLONG, *PDWORDLONG;\n        typedef unsigned long SIZE_T;\n\n        typedef struct {\n            long x;\n            long y;\n        } POINT;\n\n        typedef struct {\n            float x, y, z;\n        } vec3_t;\n\n        typedef struct {\n            unsigned short wYear;\n            unsigned short wMonth;\n            unsigned short wDayOfWeek;\n            unsigned short wDay;\n            unsigned short wHour;\n            unsigned short wMinute;\n            unsigned short wSecond;\n            unsigned short wMilliseconds;\n        } SYSTEMTIME;\n\n        typedef DWORD (__stdcall *LPTHREAD_START_ROUTINE) (  \n            LPVOID lpThreadParameter  \n        );\n\n        long GetLastError();\n    ")

slot_0_13_0 = ffi.cast("uint64_t(__stdcall*)(const char*)", utils.find_export("kernel32.dll", "GetModuleHandleA"))
slot_0_14_1 = ffi.cast("uint64_t(__stdcall*)(uint64_t, const char*)", utils.find_export("kernel32.dll", "GetProcAddress"))
slot_0_15_1 = setmetatable({}, {
	__call = function(arg_71_0, arg_71_1, arg_71_2, arg_71_3, arg_71_4)
		if arg_71_0[arg_71_3] then
			return arg_71_0[arg_71_3]
		end

		arg_71_4 = arg_71_4 or {}

		local var_71_0 = string.format("%s(__stdcall*)(%s)", arg_71_2, table.concat(arg_71_4, ", "))
		local var_71_1 = ffi.typeof(var_71_0)
		local var_71_2 = slot_0_13_0(arg_71_1)
		local var_71_3 = slot_0_14_1(var_71_2, arg_71_3)

		arg_71_0[arg_71_3] = ffi.cast(var_71_1, var_71_3)

		return arg_71_0[arg_71_3]
	end
})
slot_0_11_0.GetFunction = slot_0_15_1
slot_0_16_1 = slot_0_15_1("kernel32.dll", "DWORD", "GetLastError")
slot_0_17_11 = slot_0_15_1("user32.dll", "short", "GetAsyncKeyState", {
	"int vKey"
})

function slot_0_11_0.GetKeyState(arg_72_0)
	return bit.band(slot_0_17_11(arg_72_0), 32768) ~= 0
end

slot_0_17_10 = slot_0_15_1("user32.dll", "bool", "GetCursorPos", {
	"void* lpPoint"
})

function slot_0_11_0.GetCursorPos()
	local var_73_0 = ffi.new("POINT")

	slot_0_17_10(var_73_0)

	return draw.vec2(var_73_0.x, var_73_0.y)
end

slot_0_17_9 = slot_0_15_1("kernel32.dll", "void", "GetLocalTime", {
	"void* lpSystemTime"
})

function slot_0_11_0.GetSystemTime()
	local var_74_0 = ffi.new("SYSTEMTIME")

	slot_0_17_9(var_74_0)

	return {
		year = var_74_0.wYear,
		month = var_74_0.wMonth,
		day_of_week = var_74_0.wDayOfWeek,
		day = var_74_0.wDay,
		hour = var_74_0.wHour,
		minute = var_74_0.wMinute,
		second = var_74_0.wSecond,
		milliseconds = var_74_0.wMilliseconds
	}
end

slot_0_17_8 = slot_0_15_1("kernel32.dll", "HANDLE", "FindFirstFileA", {
	"LPCSTR lpFileName",
	"LPVOID lpFindFileData"
})
slot_0_18_5 = slot_0_15_1("kernel32.dll", "BOOL", "FindNextFileA", {
	"HANDLE hFindFile",
	"LPVOID lpFindFileData"
})
slot_0_19_5 = slot_0_15_1("kernel32.dll", "BOOL", "FindClose", {
	"HANDLE hFindFile"
})

ffi.cdef("            typedef struct _FILETIME {\n                DWORD dwLowDateTime;\n                DWORD dwHighDateTime;\n            } FILETIME, *PFILETIME, *LPFILETIME;\n\n            typedef struct {\n                DWORD    dwFileAttributes;\n                FILETIME ftCreationTime;\n                FILETIME ftLastAccessTime;\n                FILETIME ftLastWriteTime;\n                DWORD    nFileSizeHigh;\n                DWORD    nFileSizeLow;\n                DWORD    dwReserved0;\n                DWORD    dwReserved1;\n                CHAR     cFileName[260];\n                CHAR     cAlternateFileName[14];\n                DWORD    dwFileType; // Obsolete. Do not use.\n                DWORD    dwCreatorType; // Obsolete. Do not use\n                WORD     wFinderFlags; // Obsolete. Do not use\n            } WIN32_FIND_DATAA;\n        ")

function slot_0_11_0.ListFiles(arg_75_0, arg_75_1)
	local var_75_0 = ("%s\\*%s"):format(arg_75_0, arg_75_1 or "")
	local var_75_1 = ffi.new("WIN32_FIND_DATAA")
	local var_75_2 = slot_0_17_8(var_75_0, var_75_1)

	if var_75_2 == nil or var_75_2 == slot_0_12_1 then
		return {}
	end

	local var_75_3 = {}

	repeat
		table.insert(var_75_3, ffi.string(var_75_1.cFileName))
	until slot_0_18_5(var_75_2, var_75_1) == 0

	slot_0_19_5(var_75_2)

	return var_75_3
end

slot_0_17_7 = slot_0_15_1("kernel32.dll", "BOOL", "ReadProcessMemory", {
	"HANDLE  hProcess",
	"LPCVOID lpBaseAddress",
	"LPVOID  lpBuffer",
	"SIZE_T  nSize",
	"SIZE_T  *lpNumberOfBytesRead"
})

function slot_0_11_0.GetModuleAddress(arg_76_0)
	local var_76_0 = slot_0_13_0(arg_76_0)

	return ffi.cast("uint64_t", var_76_0)
end

function slot_0_11_0.ReadMemory(arg_77_0, arg_77_1)
	local var_77_0 = ffi.sizeof(arg_77_1)
	local var_77_1 = ffi.new("uint8_t[?]", var_77_0)
	local var_77_2 = ffi.new("SIZE_T[1]")
	local var_77_3 = slot_0_17_7(slot_0_12_1, ffi.cast("LPCVOID", arg_77_0), var_77_1, var_77_0, var_77_2)

	if var_77_2[0] ~= var_77_0 or var_77_3 == 0 then
		return
	end

	return ffi.cast(("%s*"):format(arg_77_1), var_77_1)[0]
end

slot_0_17_6 = slot_0_15_1("kernel32.dll", "void", "CloseHandle", {
	"HANDLE pObject"
})
slot_0_18_4 = slot_0_15_1("kernel32.dll", "HANDLE", "CreateFileA", {
	"LPCSTR lpFileName",
	"DWORD dwDesiredAccess",
	"DWORD dwShareMode",
	"LPSECURITY_ATTRIBUTES lpSecurityAttributes",
	"DWORD dwCreationDisposion",
	"DWORD dwFlagsAndAttributes",
	"HANDLE hTemplateFile"
})
slot_0_19_4 = slot_0_15_1("kernel32.dll", "bool", "ReadFile", {
	"HANDLE hFile",
	"LPVOID lpBuffer",
	"DWORD nNumberOfBytesToRead",
	"LPDWORD lpNumberOfBytesRead",
	"LPOVERLAPPED lpOverlapped"
})
slot_0_20_6 = slot_0_15_1("kernel32.dll", "DWORD", "GetFileSize", {
	"HANDLE hFile",
	"LPDWORD lpFileSizeHigh"
})
slot_0_21_5 = slot_0_15_1("kernel32.dll", "bool", "WriteFile", {
	"HANDLE hFile",
	"LPCVOID lpBuffer",
	"DWORD nNumberOfBytesToWrite",
	"LPDWORD lpNumberOfBytesWritten",
	"LPOVERLAPPED lpOverlapped"
})
slot_0_22_6 = 4294967295
slot_0_23_6 = ffi.cast("void*", -1)

function slot_0_11_0.ReadFile(arg_78_0)
	local var_78_0 = slot_0_18_4(arg_78_0, 2147483648, 1, nil, 3, 128, nil)

	if var_78_0 == slot_0_23_6 then
		return
	end

	local var_78_1 = slot_0_20_6(var_78_0, nil)

	if var_78_1 == slot_0_22_6 then
		print("invalid file size")
		slot_0_17_6(var_78_0)

		return
	end

	local var_78_2 = ffi.new("char[?]", var_78_1)
	local var_78_3 = ffi.new("DWORD[1]")
	local var_78_4 = slot_0_19_4(var_78_0, var_78_2, var_78_1, var_78_3, nil)

	slot_0_17_6(var_78_0)

	if not var_78_4 or var_78_3[0] ~= var_78_1 then
		print("did not succeed")

		return
	end

	return ffi.string(var_78_2, var_78_1)
end

function slot_0_11_0.WriteFile(arg_79_0, arg_79_1)
	local var_79_0 = slot_0_18_4(arg_79_0, 1073741824, 1, nil, 2, 128, nil)

	if var_79_0 == slot_0_23_6 then
		print("invalid handle for write")

		return false
	end

	local var_79_1 = #arg_79_1
	local var_79_2 = ffi.new("DWORD[1]")
	local var_79_3 = ffi.new("char[?]", var_79_1)

	ffi.copy(var_79_3, arg_79_1, var_79_1)

	local var_79_4 = slot_0_21_5(var_79_0, var_79_3, var_79_1, var_79_2, nil)

	slot_0_17_6(var_79_0)

	if not var_79_4 or var_79_2[0] ~= var_79_1 then
		print("write failed, bytes written:", var_79_2[0], "expected:", var_79_1)

		return false
	end

	return true
end

function slot_0_17_5(arg_80_0, arg_80_1)
	local var_80_0 = ffi.cast("uint8_t*", arg_80_0)
	local var_80_1 = {}

	for iter_80_0 = 0, 7 do
		var_80_1[iter_80_0] = bit.band(arg_80_1, 255)
		arg_80_1 = bit.rshift(arg_80_1, 8)
	end

	local var_80_2 = 0

	for iter_80_1 = 0, 7 do
		local var_80_3 = var_80_0[iter_80_1] - (var_80_1[iter_80_1] or 0) - var_80_2

		if var_80_3 < 0 then
			var_80_3 = var_80_3 + 256
			var_80_2 = 1
		else
			var_80_2 = 0
		end

		var_80_0[iter_80_1] = var_80_3
	end
end

function slot_0_18_3(arg_81_0)
	local var_81_0 = tonumber(bit.rshift(arg_81_0, 32))
	local var_81_1 = tonumber(bit.band(arg_81_0, 4294967295))

	return string.format("0x%08X%08X", var_81_0, var_81_1)
end

function slot_0_11_0.ResolveRelative(arg_82_0)
	local var_82_0 = ffi.cast("int32_t*", arg_82_0 + 1)[0]
	local var_82_1 = arg_82_0 + ffi.cast("uint64_t", 1 + ffi.sizeof("int32_t"))

	if var_82_0 > 0 then
		var_82_1 = var_82_1 + var_82_0
	else
		local var_82_2 = ffi.new("uint64_t[1]", var_82_1)

		slot_0_17_5(var_82_2, -var_82_0)

		var_82_1 = var_82_2[0]
	end

	return ffi.cast("void*", var_82_1)
end

slot_0_17_4 = slot_0_15_1("kernel32.dll", "int", "Beep", {
	"DWORD dwFreq",
	"DWORD dwDuration"
})

function slot_0_11_0.Beep(arg_83_0, arg_83_1)
	slot_0_17_4(arg_83_0, arg_83_1)
end

slot_0_17_3 = slot_0_15_1("kernel32.dll", "ULONGLONG", "GetTickCount64")

function slot_0_11_0.GetTimestamp()
	return slot_0_17_3()
end

slot_0_5_0 = slot_0_11_0.GetTimestamp

function slot_0_11_0.CreateInterface(arg_85_0, arg_85_1)
	return slot_0_15_1(arg_85_0, "uint64_t**", "CreateInterface", {
		"const char*",
		"int*"
	})(arg_85_1, ffi.cast("int*", 0))
end

slot_0_12_0 = {}

function slot_0_12_0.encode(arg_86_0, arg_86_1)
	arg_86_1 = arg_86_1 or 0

	local var_86_0 = type(arg_86_0)

	if var_86_0 == "nil" then
		return "null"
	elseif var_86_0 == "boolean" then
		return arg_86_0 and "true" or "false"
	elseif var_86_0 == "number" then
		return tostring(arg_86_0)
	elseif var_86_0 == "string" then
		return string.format("%q", arg_86_0):gsub("\\\n", "\\n")
	elseif var_86_0 == "table" then
		local var_86_1 = true
		local var_86_2 = 0

		for iter_86_0, iter_86_1 in pairs(arg_86_0) do
			if type(iter_86_0) ~= "number" or iter_86_0 < 1 or math.floor(iter_86_0) ~= iter_86_0 then
				var_86_1 = false

				break
			end

			var_86_2 = math.max(var_86_2, iter_86_0)
		end

		if var_86_1 and var_86_2 == #arg_86_0 then
			local var_86_3 = {}

			for iter_86_2, iter_86_3 in ipairs(arg_86_0) do
				var_86_3[iter_86_2] = slot_0_12_0.encode(iter_86_3, arg_86_1 + 1)
			end

			return "[" .. table.concat(var_86_3, ",") .. "]"
		else
			local var_86_4 = {}
			local var_86_5 = 1

			for iter_86_4, iter_86_5 in pairs(arg_86_0) do
				var_86_4[var_86_5] = (type(iter_86_4) == "string" and string.format("%q", iter_86_4) or "[" .. iter_86_4 .. "]") .. ":" .. slot_0_12_0.encode(iter_86_5, arg_86_1 + 1)
				var_86_5 = var_86_5 + 1
			end

			return "{" .. table.concat(var_86_4, ",") .. "}"
		end
	else
		return "null"
	end
end

function slot_0_12_0.decode(arg_87_0)
	local var_87_0 = 1

	local function var_87_1()
		slot_88_0_1 = arg_87_0:sub(var_87_0, var_87_0)

		while slot_88_0_1 ~= "" and slot_88_0_1:match("%s") do
			var_87_0 = var_87_0 + 1
			slot_88_0_1 = arg_87_0:sub(var_87_0, var_87_0)
		end

		if slot_88_0_1 == "" then
			return nil
		end

		if slot_88_0_1 == "{" then
			var_87_0 = var_87_0 + 1
			slot_88_1_3 = {}
			slot_88_0_1 = arg_87_0:sub(var_87_0, var_87_0)

			while slot_88_0_1 ~= "" and slot_88_0_1:match("%s") do
				var_87_0 = var_87_0 + 1
				slot_88_0_1 = arg_87_0:sub(var_87_0, var_87_0)
			end

			if slot_88_0_1 == "" then
				return nil
			end

			if slot_88_0_1 == "}" then
				var_87_0 = var_87_0 + 1

				return slot_88_1_3
			end

			while true do
				slot_88_0_1 = arg_87_0:sub(var_87_0, var_87_0)

				while slot_88_0_1 ~= "" and slot_88_0_1:match("%s") do
					var_87_0 = var_87_0 + 1
					slot_88_0_1 = arg_87_0:sub(var_87_0, var_87_0)
				end

				if slot_88_0_1 == "" then
					return nil
				end

				slot_88_2_3 = var_87_1()

				if slot_88_2_3 == nil then
					return nil
				end

				slot_88_0_1 = arg_87_0:sub(var_87_0, var_87_0)

				while slot_88_0_1 ~= "" and slot_88_0_1:match("%s") do
					var_87_0 = var_87_0 + 1
					slot_88_0_1 = arg_87_0:sub(var_87_0, var_87_0)
				end

				if slot_88_0_1 ~= ":" then
					return nil
				end

				var_87_0 = var_87_0 + 1
				slot_88_3_1 = var_87_1()

				if slot_88_3_1 == nil and arg_87_0:sub(var_87_0 - 4, var_87_0 - 1) ~= "null" then
					return nil
				end

				slot_88_1_3[slot_88_2_3] = slot_88_3_1
				slot_88_0_1 = arg_87_0:sub(var_87_0, var_87_0)

				while slot_88_0_1 ~= "" and slot_88_0_1:match("%s") do
					var_87_0 = var_87_0 + 1
					slot_88_0_1 = arg_87_0:sub(var_87_0, var_87_0)
				end

				if slot_88_0_1 == "}" then
					var_87_0 = var_87_0 + 1

					return slot_88_1_3
				elseif slot_88_0_1 == "," then
					var_87_0 = var_87_0 + 1
				else
					return nil
				end
			end
		elseif slot_88_0_1 == "[" then
			var_87_0 = var_87_0 + 1
			slot_88_1_2 = {}
			slot_88_2_2 = 1
			slot_88_0_1 = arg_87_0:sub(var_87_0, var_87_0)

			while slot_88_0_1 ~= "" and slot_88_0_1:match("%s") do
				var_87_0 = var_87_0 + 1
				slot_88_0_1 = arg_87_0:sub(var_87_0, var_87_0)
			end

			if slot_88_0_1 == "" then
				return nil
			end

			if slot_88_0_1 == "]" then
				var_87_0 = var_87_0 + 1

				return slot_88_1_2
			end

			while true do
				slot_88_3_0 = var_87_1()

				if slot_88_3_0 == nil and arg_87_0:sub(var_87_0 - 4, var_87_0 - 1) ~= "null" then
					return nil
				end

				slot_88_1_2[slot_88_2_2] = slot_88_3_0
				slot_88_2_2 = slot_88_2_2 + 1
				slot_88_0_1 = arg_87_0:sub(var_87_0, var_87_0)

				while slot_88_0_1 ~= "" and slot_88_0_1:match("%s") do
					var_87_0 = var_87_0 + 1
					slot_88_0_1 = arg_87_0:sub(var_87_0, var_87_0)
				end

				if slot_88_0_1 == "]" then
					var_87_0 = var_87_0 + 1

					return slot_88_1_2
				elseif slot_88_0_1 == "," then
					var_87_0 = var_87_0 + 1
				else
					return nil
				end
			end
		elseif slot_88_0_1 == "\"" then
			var_87_0 = var_87_0 + 1
			slot_88_1_1 = var_87_0

			while true do
				slot_88_0_0 = arg_87_0:sub(var_87_0, var_87_0)

				if slot_88_0_0 == "" then
					return nil
				elseif slot_88_0_0 == "\"" then
					slot_88_2_1 = arg_87_0:sub(slot_88_1_1, var_87_0 - 1)
					var_87_0 = var_87_0 + 1

					return (slot_88_2_1:gsub("\\n", "\n"):gsub("\\\"", "\""):gsub("\\\\", "\\"))
				elseif slot_88_0_0 == "\\" then
					var_87_0 = var_87_0 + 2
				else
					var_87_0 = var_87_0 + 1
				end
			end
		elseif arg_87_0:sub(var_87_0, var_87_0 + 3) == "null" then
			var_87_0 = var_87_0 + 4

			return nil
		elseif arg_87_0:sub(var_87_0, var_87_0 + 3) == "true" then
			var_87_0 = var_87_0 + 4

			return true
		elseif arg_87_0:sub(var_87_0, var_87_0 + 4) == "false" then
			var_87_0 = var_87_0 + 5

			return false
		else
			slot_88_1_0 = var_87_0

			while arg_87_0:sub(var_87_0, var_87_0):match("[%d%.%-%+eE]") do
				var_87_0 = var_87_0 + 1
			end

			slot_88_2_0 = arg_87_0:sub(slot_88_1_0, var_87_0 - 1)

			if slot_88_2_0 == "" then
				return nil
			end

			return tonumber(slot_88_2_0)
		end
	end

	return var_87_1()
end

events.present_queue:add(function()
	local var_89_0 = game.global_vars.frame_time

	for iter_89_0 = #slot_0_0_0.scheduled_tasks, 1, -1 do
		local var_89_1 = slot_0_0_0.scheduled_tasks[iter_89_0]

		var_89_1.time_remaining = var_89_1.time_remaining - var_89_0

		if var_89_1.time_remaining <= 0 then
			if var_89_1.callback then
				var_89_1.callback()
			end

			table.remove(slot_0_0_0.scheduled_tasks, iter_89_0)
		end
	end
end)

slot_0_14_0 = (function()
	local var_90_0 = {}
	local var_90_1 = 1
	local var_90_2 = slot_0_11_0.ListFiles(".\\..\\..\\csgo\\sounds\\hitsounds", ".vsnd_c")

	for iter_90_0, iter_90_1 in ipairs(var_90_2) do
		var_90_0[var_90_1] = {
			name = iter_90_1:match("^(.+)%.vsnd_c$"),
			file = iter_90_1
		}

		if var_90_1 == 62 then
			slot_0_4_0.add("Unable to load more hitsounds. Only last 62 were loaded", draw.color(148, 24, 15))

			break
		end

		var_90_1 = var_90_1 + 1
	end

	return var_90_0
end)()
slot_0_15_0 = {}
slot_0_16_0 = slot_0_7_0.group("lua>elements b", "")
slot_0_17_2 = slot_0_16_0:subtab("Main")

slot_0_17_2:checkbox("peek_assist", "Peek Assist", {
	"Grenade Throw",
	"Retreat on Release",
	"Cancel on Movement",
	"Jump on Retreat",
	"> Jump only on standing",
	true
}, "color"):set_tooltip("Just enable this and bind the key to your desired key")
slot_0_17_2:checkbox("fast_ladder", "Fast Ladder")
slot_0_17_2:checkbox("jump_bug", "Jump Bug")
slot_0_17_2:checkbox("trashtalk", "Trashtalk")
slot_0_17_2:checkbox("clipboard_hack", "\fE86B1AFFAuto-connect to the server"):set_tooltip("Auto-connect to server when clipboard contains \"connect IP:port\" command.")
slot_0_17_2:checkbox("kill_lol", "\fFF2F2FFFKill Reconnect"):set_tooltip("Reconnect to the server")
slot_0_17_2:multiselect("additive", "Additive", {
	"Disable AA if no Enemy",
	"Supress Breath Animation",
	"Bombsite E Fix",
	"Disable RMB on Revolver"
})
slot_0_17_2:checkbox("drop_nades", "Drop Nades", {
	"HE",
	"Molotov",
	"Smoke",
	"Decoy",
	true
}):set_tooltip("Fast drop nades, \fa8bfffffbind this on hold button and click one time")
slot_0_9_0.drop_nades:sameRow("checkbox", "self_smoke"):set_tooltip("Self smoke, \fa8bfffffbind this on hold button and click one time")
slot_0_17_2:checkbox("in_air_mode", "SSG-08 In Air Mode", {
	"Force Shot",
	"Override Hit chance",
	"Override Point scale",
	true
})
slot_0_9_0.in_air_mode_multiselect1:set_tooltip("Overrides SSG-08 config values while you in air.")
slot_0_17_2:slider("override_hitchance", "Hit chance", -1, 100, {
	"%.0f%%"
}):depend({
	slot_0_9_0.in_air_mode_multiselect1,
	"Override Hit chance"
}):depend(slot_0_9_0.in_air_mode):set_tooltip("-1 = Auto")
slot_0_17_2:slider("override_pointscale", "Point scale", 0, 100, {
	"%.0f%%"
}):depend({
	slot_0_9_0.in_air_mode_multiselect1,
	"Override Point scale"
}):depend(slot_0_9_0.in_air_mode)
slot_0_17_2:checkbox("dfsapo2390dfdxalk", "Noscope Mode", {
	"Auto",
	"AWP",
	true
})
slot_0_9_0.dfsapo2390dfdxalk:sameRow("checkbox", "noscope_flag"):set_tooltip("Noscope ESP Flag")
slot_0_17_2:slider("auto_noscope_dist", "Auto - Distance", 100, 800, {
	"%.0fu"
}):depend({
	slot_0_9_0.dfsapo2390dfdxalk_multiselect1,
	"Auto"
}):depend(slot_0_9_0.dfsapo2390dfdxalk)
slot_0_17_2:slider("auto_noscope_hitchance", "Auto - Hit chance", -1, 100, {
	"%.0f%%"
}):depend({
	slot_0_9_0.dfsapo2390dfdxalk_multiselect1,
	"Auto"
}):depend(slot_0_9_0.dfsapo2390dfdxalk):set_tooltip("-1 = Auto")
slot_0_17_2:slider("awp_noscope_dist", "AWP - Distance", 100, 800, {
	"%.0fu"
}):depend({
	slot_0_9_0.dfsapo2390dfdxalk_multiselect1,
	"AWP"
}):depend(slot_0_9_0.dfsapo2390dfdxalk)
slot_0_17_2:slider("awp_noscope_hitchance", "AWP - Hit chance", -1, 100, {
	"%.0f%%"
}):depend({
	slot_0_9_0.dfsapo2390dfdxalk_multiselect1,
	"AWP"
}):depend(slot_0_9_0.dfsapo2390dfdxalk):set_tooltip("-1 = Auto")
slot_0_17_2:button("load_cfg", "Load local config")
slot_0_9_0.load_cfg:sameRow("button", "save_cfg", "Save local config")

if slot_0_8_0.peek_assist_color2:rgba() == 0 then
	slot_0_9_0.peek_assist_color2:set(draw.color("#a8bfff8b"))
end

slot_0_18_2 = slot_0_16_0:subtab("Visuals")

slot_0_18_2:multiselect("ui_interface", "UI", {
	"Watermark"
})
slot_0_9_0.ui_interface:sameRow("color_picker", "ui_interface_color2")
slot_0_18_2:checkbox("manual_circle", "Manual Circle", "color")

if slot_0_8_0.ui_interface_color2:rgba() == 0 then
	slot_0_9_0.ui_interface_color2:set(draw.color("#a8bfffff"))
end

if slot_0_8_0.manual_circle_color1:rgba() == 0 then
	slot_0_9_0.manual_circle_color1:set(draw.color("#a8bfffff"))
end

slot_0_19_3 = slot_0_16_0:subtab("Hitsounds")
slot_0_20_5 = {}

for iter_0_0, iter_0_1 in ipairs(slot_0_14_0) do
	slot_0_15_0[iter_0_1.name] = iter_0_1.name
	slot_0_20_5[#slot_0_20_5 + 1] = iter_0_1.name
end

slot_0_19_3:checkbox("hit_sound", "Hit Sound", slot_0_20_5)
slot_0_19_3:checkbox("hs_sound", "HS Sound", slot_0_20_5)
slot_0_19_3:checkbox("kill_sound", "Kill Sound", slot_0_20_5)
slot_0_19_3:slider("sound_volume", "Sound volume", 0, 100, {
	"%.0f%%"
})
slot_0_9_0.sound_volume:depend({
	element,
	function()
		return slot_0_9_0.hit_sound:get() or slot_0_9_0.hs_sound:get() or slot_0_9_0.kill_sound:get()
	end
})

slot_0_20_4 = slot_0_16_0:subtab("Ping Brutter")

slot_0_20_4:textbox("ping_to_brute", "Latency (ms)")
slot_0_20_4:button("stop_button", "\fffa8a8ffStop")
slot_0_9_0.stop_button:sameRow("button", "start_button", "\fa8bfffffStart")
slot_0_16_0:reset()
mods.events:add_listener("player_hurt")
mods.events:add_listener("player_death")

slot_0_17_1 = nil
slot_0_18_1 = "xolite_config.json"
slot_0_19_2 = false
slot_0_20_3 = "sefa_in_army_we_all_waiting_him"

function slot_0_21_4(arg_92_0, arg_92_1)
	local var_92_0 = {}
	local var_92_1 = #arg_92_1

	for iter_92_0 = 1, #arg_92_0 do
		local var_92_2 = string.byte(arg_92_0, iter_92_0)
		local var_92_3 = string.byte(arg_92_1, (iter_92_0 - 1) % var_92_1 + 1)

		var_92_0[iter_92_0] = string.char(bit.bxor(var_92_2, var_92_3))
	end

	return table.concat(var_92_0)
end

function slot_0_22_5(arg_93_0)
	local var_93_0 = slot_0_21_4(arg_93_0, slot_0_20_3)

	return utils.base64_encode(var_93_0)
end

function slot_0_23_5(arg_94_0)
	local var_94_0 = utils.base64_decode(arg_94_0)

	return slot_0_21_4(var_94_0, slot_0_20_3)
end

function slot_0_24_5()
	local var_95_0 = {}

	for iter_95_0, iter_95_1 in pairs(slot_0_8_0) do
		local var_95_1 = slot_0_9_0[iter_95_0]

		if var_95_1 and not var_95_1.ignore_save and not var_95_1.is_builtin and var_95_1.type ~= gui.control_type.text_input and iter_95_1 ~= nil and iter_95_1 ~= slot_0_12_0.null then
			var_95_0[iter_95_0] = iter_95_1
		end
	end

	local var_95_2 = slot_0_12_0.encode(var_95_0)
	local var_95_3 = slot_0_22_5(var_95_2)

	if slot_0_11_0.WriteFile(slot_0_18_1, var_95_3) then
		print("Local config saved")
	else
		print("Failed to save config")
	end

	slot_0_16_0:reset()
end

function slot_0_25_5()
	local var_96_0 = slot_0_11_0.ReadFile(slot_0_18_1)

	if not var_96_0 then
		print("No config file found")

		return
	end

	local var_96_1 = slot_0_23_5(var_96_0)

	if not var_96_1 then
		print("Failed to decrypt config")

		return
	end

	local var_96_2 = slot_0_12_0.decode(var_96_1)

	if not var_96_2 then
		print("Failed to parse config JSON")

		return
	end

	slot_0_19_2 = true

	for iter_96_0, iter_96_1 in pairs(var_96_2) do
		local var_96_3 = slot_0_9_0[iter_96_0]

		if var_96_3 and var_96_3.set and var_96_3.is_value and iter_96_1 ~= nil and iter_96_1 ~= slot_0_12_0.null and var_96_3.type ~= gui.control_type.button and var_96_3.type ~= gui.control_type.label and var_96_3.type ~= gui.control_type.text_input then
			slot_0_9_0[iter_96_0]:set(iter_96_1)
		end
	end

	slot_0_19_2 = false

	slot_0_7_0:update_visibility()
	slot_0_16_0:reset()
	print("Loaded config successfully")
end

slot_0_9_0.save_cfg:set_callback(slot_0_24_5)
slot_0_9_0.load_cfg:set_callback(slot_0_25_5)

;({}).is_loading = function()
	return slot_0_19_2
end
slot_0_18_0 = nil

function slot_0_19_1(arg_98_0)
	local var_98_0 = {
		["\""] = "\\\"",
		["\r"] = "\\r",
		["\t"] = "\\t",
		["\n"] = "\\n"
	}

	return (arg_98_0:gsub(".", function(arg_99_0)
		return var_98_0[arg_99_0] or arg_99_0
	end))
end

function slot_0_20_2(arg_100_0, arg_100_1)
	local var_100_0 = slot_0_8_0.sound_volume

	game.engine:client_cmd(string.format("snd_toolvolume %.2f", var_100_0 / 100))
	game.engine:client_cmd(string.format("play \"sounds/hitsounds/%s\"", slot_0_19_1(arg_100_1)))
end

function slot_0_21_3(arg_101_0)
	return function()
		local var_102_0 = slot_0_15_0[slot_0_8_0[arg_101_0 .. "_sound_combo1"]]

		if not var_102_0 then
			return
		end

		slot_0_20_2(arg_101_0, var_102_0)
	end
end

slot_0_9_0.hit_sound_combo1:set_callback(slot_0_21_3("hit"), false, true)
slot_0_9_0.hs_sound_combo1:set_callback(slot_0_21_3("hs"), false, true)
slot_0_9_0.kill_sound_combo1:set_callback(slot_0_21_3("kill"), false, true)

function slot_0_22_4(arg_103_0, arg_103_1, arg_103_2)
	local var_103_0 = "hit"

	if arg_103_2 then
		var_103_0 = "kill"
	elseif arg_103_1 == 1 then
		var_103_0 = "hs"
	elseif arg_103_0 == 0 then
		var_103_0 = "kill"
	end

	if not slot_0_8_0[("%s_sound"):format(var_103_0)] then
		return
	end

	local var_103_1 = slot_0_8_0[("%s_sound_combo1"):format(var_103_0)]

	if not var_103_1 then
		return
	end

	local var_103_2 = slot_0_15_0[var_103_1]

	slot_0_20_2(var_103_0, var_103_2)
end

events.event:add(function(arg_104_0)
	if arg_104_0:get_name() ~= "player_hurt" and arg_104_0:get_name() ~= "player_death" then
		return
	end

	local var_104_0 = entities.get_local_pawn()
	local var_104_1 = entities.get_local_controller()
	local var_104_2 = arg_104_0:get_controller("userid")
	local var_104_3 = arg_104_0:get_controller("attacker")

	if not var_104_2 or not var_104_3 or not var_104_0 or not var_104_1 then
		return
	end

	if var_104_3 ~= var_104_1 or var_104_2 == var_104_1 or not var_104_2:is_enemy() then
		return
	end

	local var_104_4 = arg_104_0:get_int("health")
	local var_104_5 = arg_104_0:get_int("hitgroup")

	slot_0_22_4(var_104_4, var_104_5, arg_104_0:get_name() == "player_death")
end)

slot_0_19_0 = nil

function slot_0_20_1()
	local var_105_0 = entities.get_local_pawn()

	if not var_105_0 then
		return
	end

	local var_105_1 = ffi.cast("uint64_t*", var_105_0)[0]

	if not _MOVE_TYPE_OFFSET then
		_MOVE_TYPE_OFFSET = ffi.cast("uint32_t*", ffi.cast("uint64_t", utils.find_pattern("client.dll", "0F B6 BE ? ? ? ? 48 8D 8D") or var_105_1) + 3)[0]
	end

	return ffi.cast("uint8_t*", var_105_1 + _MOVE_TYPE_OFFSET)[0] == 9
end

function slot_0_21_2()
	local var_106_0 = entities.get_local_pawn()

	if not var_106_0 then
		return
	end

	local var_106_1 = ffi.cast("uint64_t*", var_106_0)[0]

	if not _LADDER_VEC_OFFSET then
		_LADDER_VEC_OFFSET = ffi.cast("uint32_t*", ffi.cast("uint64_t", utils.find_pattern("client.dll", "F3 0F 10 9F ? ? ? ? F3 0F 10 97 ? ? ? ? 0F 57 D8") or var_106_1) + 4)[0]
	end

	local var_106_2 = ffi.cast("uint64_t*", var_106_1 + 5144)[0]

	if not var_106_2 or var_106_2 == 0 then
		return
	end

	local var_106_3 = ffi.cast("vec3_t*", var_106_2 + _LADDER_VEC_OFFSET)

	return var_106_3.x, var_106_3.y, var_106_3.z
end

function slot_0_22_3()
	local var_107_0, var_107_1 = slot_0_21_2()
	local var_107_2, var_107_3 = slot_0_3_0.round(var_107_0), slot_0_3_0.round(var_107_1)

	return var_107_2 == 1 and 180 or var_107_2 == -1 and 0 or var_107_3 == 1 and -90 or 90
end

function slot_0_23_4(arg_108_0, arg_108_1)
	local var_108_0 = arg_108_0:get_forwardmove()
	local var_108_1 = -arg_108_0:get_leftmove()

	if arg_108_1 == 0 then
		return var_108_0 > 0, var_108_0 < 0, var_108_1 == 0, var_108_1 < 0, var_108_1 > 0
	end

	if arg_108_1 == 180 or arg_108_1 == -180 then
		return var_108_0 < 0, var_108_0 > 0, var_108_1 == 0, var_108_1 > 0, var_108_1 < 0
	end

	if arg_108_1 == 90 then
		return var_108_1 > 0, var_108_1 < 0, var_108_0 == 0, var_108_0 > 0, var_108_0 < 0
	end

	if arg_108_1 == -90 then
		return var_108_1 < 0, var_108_1 > 0, var_108_0 == 0, var_108_0 < 0, var_108_0 > 0
	end
end

slot_0_24_4 = 0
slot_0_25_4 = 0

events.create_move:add(function(arg_109_0)
	if not slot_0_8_0.fast_ladder then
		return
	end

	if not slot_0_20_1() then
		slot_0_25_4 = 0
		slot_0_24_4 = 0

		return
	end

	local var_109_0 = slot_0_3_0.getThrowTime()
	local var_109_1 = entities.get_local_pawn()
	local var_109_2 = var_109_1:get_active_weapon()
	local var_109_3 = arg_109_0:get_viewangles()
	local var_109_4 = arg_109_0:get_forwardmove()
	local var_109_5 = -arg_109_0:get_leftmove()
	local var_109_6 = var_109_4 > 0
	local var_109_7 = var_109_4 < 0
	local var_109_8 = var_109_5 == 0
	local var_109_9

	var_109_9 = var_109_5 < 0

	local var_109_10

	var_109_10 = var_109_5 > 0

	if var_109_6 or var_109_7 or not var_109_8 then
		slot_0_24_4 = slot_0_24_4 + 1
	else
		slot_0_24_4 = 0
	end

	if slot_0_25_4 < 1 then
		slot_0_25_4 = slot_0_25_4 + 1
	end

	if slot_0_24_4 < 4 or slot_0_25_4 < 1 then
		return
	end

	if arg_109_0:get_button(input_bit_mask.in_jump) then
		return
	end

	if not var_109_2 or not var_109_0 or var_109_0 == 0 then
		local var_109_11 = slot_0_22_3(var_109_1)
		local var_109_12 = slot_0_3_0.closest(math.angle_normalize(var_109_3.y - var_109_11), {
			-180,
			-90,
			0,
			90,
			180
		})
		local var_109_13, var_109_14, var_109_15, var_109_16, var_109_17 = slot_0_23_4(arg_109_0, var_109_12)
		local var_109_18 = arg_109_0:get_viewangles()

		if var_109_13 then
			if var_109_3.x < 45 then
				var_109_18.x = 89

				arg_109_0:set_leftmove(-1)
				arg_109_0:set_forwardmove(-1)

				if var_109_15 then
					var_109_11 = var_109_11 + 90
				end

				if var_109_16 then
					var_109_11 = var_109_11 + 150
				end

				if var_109_17 then
					var_109_11 = var_109_11 + 30
				end
			end
		elseif var_109_14 then
			var_109_18.x = 89

			arg_109_0:set_leftmove(1)
			arg_109_0:set_forwardmove(1)

			if var_109_15 then
				var_109_11 = var_109_11 + 90
			end

			if var_109_17 then
				var_109_11 = var_109_11 + 150
			end

			if var_109_16 then
				var_109_11 = var_109_11 + 30
			end
		elseif var_109_16 or var_109_17 then
			arg_109_0:set_leftmove(0)
			arg_109_0:set_forwardmove(1)

			var_109_11 = var_109_11 + (var_109_16 and 90 or -90)
		end

		var_109_18.y = math.angle_normalize(var_109_11)

		arg_109_0:set_viewangles(var_109_18)
	end
end)

slot_0_20_0 = nil
slot_0_21_1 = {
	retreat_on_release = false,
	should_retreat = false,
	is_turned_on = false,
	peek_alpha = 0,
	grenade_was_pulled = false,
	start_pos = vector(0, 0, 0)
}

function slot_0_22_2()
	slot_0_21_1.is_turned_on = false
	slot_0_21_1.should_retreat = false

	slot_0_10_0.peek_assist.main:override()
	slot_0_10_0.slowwalk:override()
end

slot_0_23_3 = 0.015625

function slot_0_24_3()
	local var_111_0 = entities.get_local_pawn()

	if not var_111_0 then
		return math.huge
	end

	local var_111_1 = var_111_0:get_active_weapon()

	if not var_111_1 then
		return math.huge
	end

	local var_111_2 = var_111_1.m_fLastShotTime

	if not var_111_2 then
		return math.huge
	end

	local var_111_3 = var_111_2:get().value

	return game.global_vars.cur_time - var_111_3
end

function slot_0_25_3(arg_112_0)
	local var_112_0 = arg_112_0:get_abs_origin()
	local var_112_1 = arg_112_0.m_fFlags and arg_112_0.m_fFlags:get() or 0

	if bit.band(var_112_1, 1) == 0 then
		var_112_0 = var_112_0 - vector(0, 0, 10)
	end

	local var_112_2 = ray_t()

	var_112_2:set_hull(vector(-16, -16, 0), vector(16, 16, 0))

	local var_112_3 = game.physics_query_interface:trace_ray(var_112_2, var_112_0, var_112_0 - vector(0, 0, 8192))

	if not var_112_3 then
		return var_112_0
	end

	local var_112_4 = var_112_3.endpos

	return vector(var_112_4.x, var_112_4.y, var_112_4.z)
end

function slot_0_26_3(arg_113_0)
	local var_113_0 = math.sqrt(arg_113_0.x^2 + arg_113_0.y^2 + arg_113_0.z^2)

	if var_113_0 == 0 then
		return vector(0, 0, 0)
	end

	return vector(arg_113_0.x / var_113_0, arg_113_0.y / var_113_0, arg_113_0.z / var_113_0)
end

function slot_0_27_3(arg_114_0, arg_114_1, arg_114_2, arg_114_3, arg_114_4)
	local var_114_0 = math.world_to_screen(arg_114_0)

	if not var_114_0 then
		return
	end

	local var_114_1 = {}

	for iter_114_0 = 0, arg_114_2 do
		local var_114_2 = 2 * math.pi * (iter_114_0 / arg_114_2)
		local var_114_3 = arg_114_0.x + math.cos(var_114_2) * arg_114_1
		local var_114_4 = arg_114_0.y + math.sin(var_114_2) * arg_114_1
		local var_114_5 = arg_114_0.z
		local var_114_6 = math.world_to_screen(vector(var_114_3, var_114_4, var_114_5))

		if var_114_6 then
			table.insert(var_114_1, var_114_6)
		end
	end

	if #var_114_1 < 2 then
		return
	end

	for iter_114_1 = 1, #var_114_1 - 1 do
		draw.surface:add_triangle_filled_multicolor(var_114_0, var_114_1[iter_114_1], var_114_1[iter_114_1 + 1], {
			arg_114_3,
			arg_114_4,
			arg_114_4
		})
	end

	if #var_114_1 > 0 then
		draw.surface:add_triangle_filled_multicolor(var_114_0, var_114_1[#var_114_1], var_114_1[1], {
			arg_114_3,
			arg_114_4,
			arg_114_4
		})
	end
end

slot_0_28_3 = 0
slot_0_29_4 = 0

events.create_move:add(function(arg_115_0)
	slot_0_0_0.auto_peek = slot_0_21_1.should_retreat

	if not slot_0_9_0.peek_assist:get(true) or not slot_0_9_0.peek_assist:get_hotkey_state() then
		slot_0_22_2()

		return
	end

	slot_0_10_0.peek_assist.main:override(false)
	slot_0_10_0.peek_assist.main.reference:get_value():disable_hotkeys()

	slot_115_1_0 = entities.get_local_pawn()

	if not slot_115_1_0 or not slot_115_1_0:is_alive() then
		slot_0_22_2()

		return
	end

	slot_115_2_0 = slot_115_1_0:get_active_weapon()

	if not slot_115_2_0 then
		slot_0_22_2()

		return
	end

	slot_115_3_0 = slot_115_2_0:get_type()
	slot_115_4_0 = slot_115_3_0 == csweapon_type.grenade
	slot_115_5_0 = slot_115_4_0 and slot_115_2_0.m_bPinPulled and slot_115_2_0.m_bPinPulled:get() or false
	slot_115_6_0 = slot_0_3_0.getThrowTime() or 0
	slot_115_7_0 = slot_115_3_0 == csweapon_type.knife
	slot_115_8_0 = slot_115_1_0.m_fFlags and slot_115_1_0.m_fFlags:get() or 0
	slot_115_9_0 = bit.band(slot_115_8_0, 1) == 0
	slot_115_10_0 = bit.band(slot_115_8_0, 2) ~= 0
	slot_115_11_0 = slot_0_8_0.peek_assist_multiselect1
	slot_115_12_0 = slot_115_1_0:get_abs_velocity():length_2d()

	if slot_0_6_0.contains(slot_115_11_0, "Grenade Throw") then
		if slot_115_5_0 then
			slot_0_21_1.grenade_was_pulled = true
		end

		if slot_115_4_0 and slot_115_6_0 > 0 then
			slot_0_21_1.saved_throw_time = slot_115_6_0
		end

		if slot_0_21_1.grenade_was_pulled and slot_0_21_1.saved_throw_time and game.global_vars.cur_time > slot_0_21_1.saved_throw_time then
			slot_0_21_1.should_retreat = true
			slot_0_21_1.retreat_on_release = false
			slot_0_21_1.grenade_was_pulled = false
			slot_0_21_1.saved_throw_time = nil
		end
	end

	if not slot_115_4_0 and not slot_115_7_0 and slot_0_24_3() < slot_0_23_3 then
		slot_0_21_1.should_retreat = true
		slot_0_21_1.retreat_on_release = false
	end

	if not slot_115_4_0 and not slot_115_7_0 and slot_0_24_3() < slot_0_23_3 then
		slot_0_21_1.should_retreat = true
		slot_0_21_1.retreat_on_release = false
	end

	if not slot_0_21_1.is_turned_on then
		slot_0_28_3 = 0
		slot_0_21_1.is_turned_on = true
		slot_0_21_1.should_retreat = false
		slot_0_21_1.start_pos = slot_0_25_3(slot_115_1_0)

		slot_0_10_0.slowwalk:override()
	end

	slot_115_13_0 = 0

	if arg_115_0:get_button(input_bit_mask.in_moveleft) then
		slot_115_13_0 = bit.bor(slot_115_13_0, input_bit_mask.in_moveleft)
	end

	if arg_115_0:get_button(input_bit_mask.in_moveright) then
		slot_115_13_0 = bit.bor(slot_115_13_0, input_bit_mask.in_moveright)
	end

	if arg_115_0:get_button(input_bit_mask.in_forward) then
		slot_115_13_0 = bit.bor(slot_115_13_0, input_bit_mask.in_forward)
	end

	if arg_115_0:get_button(input_bit_mask.in_back) then
		slot_115_13_0 = bit.bor(slot_115_13_0, input_bit_mask.in_back)
	end

	if arg_115_0:get_button(input_bit_mask.in_jump) then
		slot_115_13_0 = bit.bor(slot_115_13_0, input_bit_mask.in_jump)
	end

	slot_115_14_0 = slot_115_1_0:get_abs_origin()

	if slot_0_6_0.contains(slot_115_11_0, "Retreat on Release") then
		if slot_0_28_3 ~= 0 and slot_115_13_0 == 0 then
			slot_0_21_1.retreat_on_release = true
			slot_0_21_1.should_retreat = true
		end

		if slot_0_21_1.should_retreat and slot_115_13_0 ~= 0 and slot_0_28_3 ~= slot_115_13_0 then
			slot_0_21_1.should_retreat = false
		end
	end

	slot_115_15_0 = slot_115_14_0:dist_2d(slot_0_21_1.start_pos)
	slot_115_16_0 = slot_115_14_0:dist(slot_0_21_1.start_pos)

	slot_0_10_0.slowwalk:override(slot_115_9_0 and slot_0_21_1.should_retreat and slot_115_15_0 < 25 and slot_115_16_0 > 1.1)

	if not slot_0_21_1.should_retreat then
		slot_0_28_3 = slot_115_13_0
		slot_0_29_4 = game.global_vars.real_time

		return
	end

	if slot_115_15_0 < 1.1 then
		slot_0_10_0.slowwalk:override()

		slot_0_21_1.should_retreat = false

		return
	end

	slot_115_17_0 = game.global_vars.real_time

	if slot_115_13_0 == 0 then
		slot_0_28_3 = 0
	end

	if not slot_0_21_1.retreat_on_release then
		if slot_0_6_0.contains(slot_115_11_0, "Cancel on Movement") and slot_0_28_3 ~= slot_115_13_0 and slot_115_13_0 ~= 0 then
			if slot_115_9_0 then
				if slot_115_17_0 - slot_0_29_4 > 0.5 then
					slot_0_21_1.should_retreat = false

					return
				end
			elseif slot_115_17_0 - slot_0_29_4 > 0.1 then
				slot_0_21_1.should_retreat = false

				return
			end
		end

		if slot_0_6_0.contains(slot_115_11_0, "Jump on Retreat") then
			if slot_0_6_0.contains(slot_115_11_0, "> Jump only on standing") then
				if slot_115_15_0 > 25 and (slot_115_12_0 < 7.6 or slot_115_10_0) then
					arg_115_0:set_button(input_bit_mask.in_jump)
				end
			elseif slot_115_15_0 > 25 then
				arg_115_0:set_button(input_bit_mask.in_jump)
			end
		end
	end

	slot_115_18_0 = slot_0_21_1.start_pos - slot_115_14_0
	slot_115_19_0 = slot_0_21_1.start_pos + slot_0_26_3(slot_115_18_0) * vector(10, 10, 10)
	slot_115_20_0 = math.vector_angles(slot_115_19_0 - slot_115_14_0).y

	arg_115_0:set_leftmove(0)

	if slot_115_15_0 > 21 then
		arg_115_0:set_forwardmove(1)

		if slot_115_9_0 then
			arg_115_0:remove_button(input_bit_mask.in_jump)
		end
	else
		slot_115_21_0 = math.min(450, math.max(11.1, slot_115_15_0 * 15))

		if slot_115_12_0 >= math.min(900, slot_115_21_0) + 15 then
			arg_115_0:set_forwardmove(0)
		else
			arg_115_0:set_forwardmove(math.max(6, slot_115_12_0 >= math.min(900, slot_115_21_0) and slot_115_21_0 * 0.9 or slot_115_21_0) / 450)
			arg_115_0:remove_button(input_bit_mask.in_jump)
		end
	end

	arg_115_0:remove_button(input_bit_mask.in_moveleft)
	arg_115_0:remove_button(input_bit_mask.in_moveright)
	arg_115_0:remove_button(input_bit_mask.in_forward)
	arg_115_0:remove_button(input_bit_mask.in_back)
	arg_115_0:rotate_movement(slot_115_20_0)
end)
events.present_queue:add(function()
	local var_116_0 = entities.get_local_pawn()

	if not var_116_0 or not var_116_0:is_alive() then
		return
	end

	local var_116_1 = slot_0_9_0.peek_assist:get(true)
	local var_116_2 = slot_0_9_0.peek_assist:get_hotkey_state()

	if var_116_1 then
		slot_0_10_0.peek_assist.col1:override(draw.color(0, 0, 0, 0))
		slot_0_10_0.peek_assist.col2:override(draw.color(0, 0, 0, 0))
	else
		slot_0_10_0.peek_assist.col1:override()
		slot_0_10_0.peek_assist.col2:override()
	end

	slot_0_21_1.peek_alpha = slot_0_3_0.linear("peek_alpha", var_116_1 and var_116_2, 7)

	if slot_0_21_1.peek_alpha <= 0.001 then
		slot_0_21_1.start_pos = vector(0, 0, 0)

		return
	end

	local var_116_3 = slot_0_8_0.peek_assist_color2
	local var_116_4 = var_116_3:mod_a(slot_0_21_1.peek_alpha)
	local var_116_5 = var_116_3:mod_a(0)

	slot_0_27_3(slot_0_21_1.start_pos, 20, 32, var_116_4, var_116_5)
end)

slot_0_21_0 = nil

function slot_0_22_1()
	return slot_0_10_0.override_left:get() or slot_0_10_0.override_right:get() or slot_0_10_0.override_back:get() or slot_0_10_0.override_forward:get()
end

function slot_0_23_2(arg_118_0)
	local var_118_0 = slot_0_22_1()
	local var_118_1 = slot_0_10_0.yaw_offset_control:get_hotkey_state()

	if var_118_1 and arg_118_0 == 180 and not var_118_0 or slot_0_10_0.override_back:get() then
		return "back"
	end

	if var_118_1 and arg_118_0 == 0 and not var_118_0 or slot_0_10_0.override_forward:get() then
		return "forward"
	end

	if var_118_1 and arg_118_0 > 0 and not var_118_0 or slot_0_10_0.override_left:get() then
		return "left"
	end

	if var_118_1 and arg_118_0 < 0 and not var_118_0 or slot_0_10_0.override_right:get() then
		return "right"
	end
end

slot_0_24_2 = {
	left = 0,
	right = 0,
	back = 0,
	forward = 0
}

events.present_queue:add(function()
	local var_119_0 = slot_0_3_0.linear("Manual Circle", slot_0_8_0.manual_circle)

	if var_119_0 <= 0 then
		return
	end

	local var_119_1 = entities.get_local_pawn()

	if not var_119_1 or not var_119_1:is_alive() then
		return
	end

	local var_119_2 = slot_0_10_0.yaw_offset_control:get()
	local var_119_3 = slot_0_23_2(var_119_2)

	for iter_119_0, iter_119_1 in pairs(slot_0_24_2) do
		local var_119_4 = var_119_3 == iter_119_0 and 255 or 0

		slot_0_24_2[iter_119_0] = slot_0_3_0.lerp(iter_119_1, var_119_4, 0.1)
	end

	local var_119_5 = slot_0_0_0.screen[1]
	local var_119_6 = slot_0_0_0.screen[2]
	local var_119_7 = draw.vec2(var_119_5 * 0.5, var_119_6 * 0.5)
	local var_119_8 = slot_0_8_0.manual_circle_color1
	local var_119_9 = draw.surface
	local var_119_10 = {
		left = slot_0_3_0.vec2_add(var_119_7, draw.vec2(-100, 0)),
		right = slot_0_3_0.vec2_add(var_119_7, draw.vec2(100, 0)),
		back = slot_0_3_0.vec2_add(var_119_7, draw.vec2(0, 100)),
		forward = slot_0_3_0.vec2_add(var_119_7, draw.vec2(0, -100))
	}

	for iter_119_2, iter_119_3 in pairs(var_119_10) do
		local var_119_11 = math.floor(slot_0_24_2[iter_119_2] or 0)

		if var_119_11 > 1 then
			local var_119_12 = var_119_8:get_a()
			local var_119_13 = var_119_11 * var_119_0 * var_119_12 / 255
			local var_119_14 = draw.color(var_119_8:get_r(), var_119_8:get_g(), var_119_8:get_b(), var_119_13)
			local var_119_15 = draw.color(var_119_8:get_r(), var_119_8:get_g(), var_119_8:get_b(), 0)

			var_119_9:add_pill_multicolor(iter_119_3, iter_119_3, 15, 15, {
				var_119_14,
				var_119_15
			}, 16)
		end
	end
end)

slot_0_22_0 = nil
slot_0_23_1 = {
	crouch = false,
	in_air = false
}

events.create_move:add(function(arg_120_0)
	if not slot_0_8_0.jump_bug then
		return
	end

	local var_120_0 = entities.get_local_pawn()

	if not var_120_0 or not var_120_0:is_alive() then
		return
	end

	local var_120_1 = var_120_0.m_fFlags and var_120_0.m_fFlags:get() or 0

	slot_0_23_1.in_air = bit.band(var_120_1, 1) == 0
	slot_0_23_1.crouch = arg_120_0:get_button(input_bit_mask.in_duck)

	slot_0_10_0.jump_bug:set(slot_0_23_1.in_air and not slot_0_23_1.crouch)
	slot_0_10_0.no_land_inaccuracy:set(not slot_0_23_1.crouch)
end)

slot_0_23_0 = nil
slot_0_24_1 = {}
slot_0_25_2 = {}

function slot_0_26_2()
	local var_121_0 = slot_0_8_0.drop_nades_multiselect1
	local var_121_1 = {}

	if slot_0_6_0.contains(var_121_0, "Molotov") then
		var_121_1[#var_121_1 + 1] = {
			slot = "slot10",
			id = weapon_id.molotov
		}
		var_121_1[#var_121_1 + 1] = {
			slot = "slot10",
			id = weapon_id.incgrenade
		}
	end

	if slot_0_6_0.contains(var_121_0, "HE") then
		var_121_1[#var_121_1 + 1] = {
			slot = "slot6",
			id = weapon_id.hegrenade
		}
	end

	if slot_0_6_0.contains(var_121_0, "Smoke") then
		var_121_1[#var_121_1 + 1] = {
			slot = "slot8",
			id = weapon_id.smokegrenade
		}
	end

	if slot_0_6_0.contains(var_121_0, "Decoy") then
		var_121_1[#var_121_1 + 1] = {
			slot = "slot9",
			id = weapon_id.decoy
		}
	end

	return var_121_1
end

slot_0_27_2 = 0

slot_0_9_0.self_smoke:set_callback(function()
	slot_0_27_2 = 0

	if not slot_0_8_0.self_smoke then
		return
	end

	if #slot_0_25_2 > 0 then
		return
	end

	local var_122_0 = entities.get_local_pawn()

	if not var_122_0 or not var_122_0:is_alive() then
		return
	end

	local var_122_1 = var_122_0:get_active_weapon()

	if not var_122_1 then
		return
	end

	local var_122_2 = var_122_1:get_id() == weapon_id.smokegrenade

	local function var_122_3()
		slot_0_25_2[#slot_0_25_2 + 1] = function(arg_124_0)
			arg_124_0:set_button(input_bit_mask.in_attack2)
		end
		slot_0_25_2[#slot_0_25_2 + 1] = function(arg_125_0)
			arg_125_0:remove_button(input_bit_mask.in_attack2)
		end
	end

	local function var_122_4()
		for iter_126_0 = 1, 8 do
			slot_0_25_2[#slot_0_25_2 + 1] = function(arg_127_0)
				local var_127_0 = arg_127_0:get_viewangles()

				arg_127_0:set_viewangles(vector(89, var_127_0.y, 0))
			end
		end
	end

	if var_122_2 then
		var_122_3()
		var_122_4()
	else
		slot_0_25_2[#slot_0_25_2 + 1] = function(arg_128_0)
			game.engine:client_cmd("slot8")
		end

		local var_122_5

		local function var_122_6(arg_129_0)
			local var_129_0 = entities.get_local_pawn()

			if not var_129_0 or not var_129_0:is_alive() then
				return
			end

			local var_129_1 = var_129_0:get_active_weapon()

			if not var_129_1 then
				return
			end

			if var_129_1:get_id() ~= weapon_id.smokegrenade then
				if slot_0_27_2 == 1 then
					return
				end

				slot_0_3_0.execute_after(1, function()
					slot_0_25_2[#slot_0_25_2 + 1] = var_122_6
				end)

				slot_0_27_2 = slot_0_27_2 + 1

				return
			end

			var_122_3()
			var_122_4()
		end

		slot_0_25_2[#slot_0_25_2 + 1] = var_122_6
	end
end)
slot_0_9_0.drop_nades:set_callback(function()
	if not slot_0_8_0.drop_nades then
		return
	end

	local var_131_0 = entities.get_local_pawn()

	if not var_131_0 or not var_131_0:is_alive() then
		return
	end

	if #slot_0_24_1 > 0 then
		return
	end

	local var_131_1 = slot_0_26_2()

	for iter_131_0, iter_131_1 in ipairs(var_131_1) do
		table.insert(slot_0_24_1, function()
			game.engine:client_cmd(iter_131_1.slot)
		end)
		table.insert(slot_0_24_1, function()
			return
		end)
		table.insert(slot_0_24_1, function(arg_134_0)
			local var_134_0 = entities.get_local_pawn()

			if not var_134_0 or not var_134_0:is_alive() then
				return
			end

			local var_134_1 = var_134_0:get_active_weapon()

			if not var_134_1 or var_134_1:get_id() ~= iter_131_1.id then
				return
			end

			game.engine:client_cmd("drop")
		end)
	end
end)
events.create_move:add(function(arg_135_0)
	if #slot_0_24_1 > 0 then
		local var_135_0 = table.remove(slot_0_24_1, 1)

		if var_135_0 then
			var_135_0(arg_135_0)
		end
	end

	if #slot_0_25_2 > 0 then
		local var_135_1 = table.remove(slot_0_25_2, 1)

		if var_135_1 then
			var_135_1(arg_135_0)
		end
	end
end)

slot_0_24_0 = nil

slot_0_9_0.in_air_mode:set_callback(function()
	local var_136_0 = true

	slot_0_10_0.ssg_08 = slot_0_10_0.ssg_08 or {}

	local var_136_1

	slot_0_10_0.ssg_08.hitchance, var_136_1 = slot_0_7_0.reference("rage>weapon>SSG-08>weapon>hitchance", nil, "rage>weapon>general>weapon>hitchance")

	local var_136_2

	slot_0_10_0.ssg_08.pointscale, var_136_2 = slot_0_7_0.reference("rage>weapon>SSG-08>weapon>pointscale", nil, "rage>weapon>general>weapon>pointscale")

	local var_136_3

	slot_0_10_0.ssg_08.autostop_enabled, var_136_3 = slot_0_7_0.reference("rage>weapon>SSG-08>extra>autostop", nil, "rage>weapon>general>extra>autostop")

	local var_136_4

	slot_0_10_0.ssg_08.autostop_mode, var_136_4 = slot_0_7_0.reference("rage>weapon>SSG-08>extra>autostop>settings>mode", {
		"Full stop",
		"Between shots",
		"Early",
		"Only when lethal",
		"In air"
	}, "rage>weapon>general>extra>autostop>settings>mode")

	if not var_136_4 then
		game.engine:client_cmd("play sounds/ui/panorama/lobby_error_01")
		slot_0_4_0.add(5, "[In Air Mode] SSG-08 config values was not found. Using general aimbot tab until feature / script re-enable", draw.color(148, 24, 15))
	end
end)

function slot_0_25_1()
	if not slot_0_10_0.ssg_08 then
		return
	end

	slot_0_10_0.force_shot:override()
	slot_0_10_0.ssg_08.hitchance:override()
	slot_0_10_0.ssg_08.pointscale:override()
	slot_0_10_0.ssg_08.autostop_enabled:override()
	slot_0_10_0.ssg_08.autostop_mode:override()
end

events.present_queue:add(function()
	if not slot_0_10_0.ssg_08 then
		return
	end

	if not slot_0_8_0.in_air_mode then
		slot_0_25_1()

		return
	end

	local var_138_0 = entities.get_local_pawn()

	if not var_138_0 or not var_138_0:is_alive() then
		slot_0_25_1()

		return
	end

	local var_138_1 = var_138_0:get_active_weapon()

	if not var_138_1 or var_138_1:get_id() ~= weapon_id.ssg08 then
		slot_0_25_1()

		return
	end

	local var_138_2 = var_138_0.m_fFlags and var_138_0.m_fFlags:get() or 0

	if bit.band(var_138_2, 1) ~= 0 then
		slot_0_25_1()

		return
	end

	local var_138_3 = slot_0_8_0.in_air_mode_multiselect1

	if slot_0_6_0.contains(var_138_3, "Override Hit chance") and not slot_0_10_0.ssg_08.hitchance:get_hotkey_state() then
		slot_0_10_0.ssg_08.hitchance:override(slot_0_8_0.override_hitchance)
	end

	if slot_0_6_0.contains(var_138_3, "Force Shot") and not slot_0_10_0.force_shot:get_hotkey_state() then
		slot_0_10_0.force_shot:override(true)
	end

	if slot_0_6_0.contains(var_138_3, "Override Point scale") and not slot_0_10_0.ssg_08.pointscale:get_hotkey_state() then
		slot_0_10_0.ssg_08.pointscale:override(slot_0_8_0.override_pointscale)
	end
end)

slot_0_25_0 = nil

slot_0_9_0.dfsapo2390dfdxalk:set_callback(function()
	local var_139_0 = true

	slot_0_10_0.autosniper = slot_0_10_0.autosniper or {}

	local var_139_1

	slot_0_10_0.autosniper.hitchance, var_139_1 = slot_0_7_0.reference("rage>weapon>Auto Snipers>weapon>hitchance", nil, "rage>weapon>general>weapon>hitchance")

	local var_139_2

	slot_0_10_0.autosniper.autoscope, var_139_2 = slot_0_7_0.reference("rage>weapon>Auto Snipers>extra>autoscope", nil, "rage>weapon>general>extra>autoscope")
	slot_0_10_0.awp = slot_0_10_0.awp or {}

	local var_139_3

	slot_0_10_0.awp.hitchance, var_139_3 = slot_0_7_0.reference("rage>weapon>AWP>weapon>hitchance", nil, "rage>weapon>general>weapon>hitchance")

	local var_139_4

	slot_0_10_0.awp.autoscope, var_139_4 = slot_0_7_0.reference("rage>weapon>AWP>extra>autoscope", nil, "rage>weapon>general>extra>autoscope")

	if not var_139_4 then
		game.engine:client_cmd("play sounds/ui/panorama/lobby_error_01")
		slot_0_4_0.add(5, "[Noscope Mode] Auto / AWP config values was not found. Using general aimbot tab until feature / script re-enable", draw.color(148, 24, 15))
	end
end)

function slot_0_26_1()
	if not slot_0_10_0.autosniper or not slot_0_10_0.awp then
		return
	end

	slot_0_10_0.autosniper.hitchance:override()
	slot_0_10_0.autosniper.autoscope:override()
	slot_0_10_0.awp.hitchance:override()
	slot_0_10_0.awp.autoscope:override()
end

events.present_queue:add(function()
	if not slot_0_10_0.autosniper or not slot_0_10_0.awp then
		return
	end

	if not slot_0_8_0.dfsapo2390dfdxalk then
		slot_0_26_1()

		return
	end

	local var_141_0 = entities.get_local_pawn()

	if not var_141_0 or not var_141_0:is_alive() then
		slot_0_26_1()

		return
	end

	local var_141_1 = var_141_0:get_active_weapon()

	if not var_141_1 then
		slot_0_26_1()

		return
	end

	local var_141_2 = var_141_1:get_id()
	local var_141_3 = var_141_2 == weapon_id.awp
	local var_141_4 = var_141_2 == weapon_id.g3sg1 or var_141_2 == weapon_id.scar20

	if not var_141_3 and not var_141_4 then
		slot_0_26_1()

		return
	end

	if var_141_0.m_bIsScoped:get() then
		slot_0_26_1()

		return
	end

	local var_141_5 = slot_0_8_0.dfsapo2390dfdxalk_multiselect1
	local var_141_6 = math.huge
	local var_141_7 = var_141_0:get_abs_origin()
	local var_141_8

	entities.players:for_each(function(arg_142_0)
		local var_142_0 = arg_142_0.entity

		if var_142_0 and var_142_0:is_alive() and var_142_0:is_enemy() then
			local var_142_1 = var_141_7:dist(var_142_0:get_abs_origin())

			if var_142_1 < var_141_6 then
				var_141_8 = var_142_0
				var_141_6 = var_142_1
			end
		end
	end)

	local var_141_9 = var_141_4 and slot_0_6_0.contains(var_141_5, "Auto") and var_141_6 <= slot_0_8_0.auto_noscope_dist
	local var_141_10 = var_141_3 and slot_0_6_0.contains(var_141_5, "AWP") and var_141_6 <= slot_0_8_0.awp_noscope_dist

	if not var_141_9 and not var_141_10 then
		slot_0_26_1()

		return
	end

	if var_141_9 then
		if not slot_0_10_0.autosniper.hitchance:get_hotkey_state() then
			slot_0_10_0.autosniper.hitchance:override(slot_0_8_0.auto_noscope_hitchance)
		end

		if not slot_0_10_0.autosniper.autoscope:get_hotkey_state() then
			slot_0_10_0.autosniper.autoscope:override(false)
		end
	end

	if var_141_10 then
		if not slot_0_10_0.awp.hitchance:get_hotkey_state() then
			slot_0_10_0.awp.hitchance:override(slot_0_8_0.awp_noscope_hitchance)
		end

		if not slot_0_10_0.awp.autoscope:get_hotkey_state() then
			slot_0_10_0.awp.autoscope:override(false)
		end
	end

	if slot_0_8_0.noscope_flag and var_141_8 then
		local var_141_11 = var_141_8:get_abs_origin() + vector(0, 0, 100)
		local var_141_12 = math.world_to_screen(var_141_11)

		if var_141_12 then
			local var_141_13 = draw.surface

			var_141_13.font = draw.fonts.gui_main_fb

			var_141_13:add_text(var_141_12, "NOSCOPE", draw.color(58, 191, 54), draw.text_params.with_h(draw.text_alignment.center))
		end
	end
end)

slot_0_26_0 = nil
slot_0_27_1 = {
	default = {
		"?",
		"бля ты че делаешь краб",
		"​ебаный скитлс / как ты стараешься жест",
		"?",
		"THIS IS LCCCCCCC (◣_◢)",
		"зря пикнул братан / наивный",
		"1",
		"отправлен в сон / уебище",
		"? /  1",
		"S[[DF[F[FS[SDF[DS[FSD[FDS[F[F[F[F / сын говна",
		"1 / муср саный",
		"слабак наивный / ты не исправим",
		"1 хуесос",
		"ебать читло пенит",
		"? / what you do dog?"
	},
	taser = {
		"шлюха на зевсе",
		"a12 / f12",
		"yt bot",
		"лови электрический привет / долбаеб"
	},
	inferno = {
		"сгорел пидорас ебаный",
		"че смок тяжело кинуть долбаеб?",
		"гори в аду",
		"нихуя я тебя зажарил ублюдка",
		"F]DFDSFSD]F[DSFSDFS] / BURN TO THE HELL"
	},
	hegrenade = {
		"взорван хуйсос",
		"allah akbar хуйсос",
		"лети обратно к матери / ебанат",
		"бахнуло как надо / кровь да кишки"
	},
	death = {
		"что ты сделал / безмозглый",
		"не повезло",
		"ну фу / что ты делаешь",
		"хуя меня пингануло жоско",
		"ну конечно / животное нихуя не может кроме как ползти",
		"ну отлично / опять в дез мисснул",
		"F][SD[]FSD][FD[]FSD[]] / хуесосу опять повезло",
		"фу / ублюдок что ты сделал в очередной раз",
		"ебаный сочник / как ты заебал",
		"так держать / сын шлюхи ебаный",
		"впредиктило опять / иди нахуй"
	},
	revenge = {
		"1",
		"?"
	}
}
slot_0_28_2 = false
slot_0_29_3 = nil
slot_0_30_2 = {}

function slot_0_31_2(arg_143_0)
	local var_143_0 = slot_0_27_1[arg_143_0]

	if not var_143_0 or #var_143_0 == 0 then
		return nil
	end

	if not slot_0_30_2[arg_143_0] then
		slot_0_30_2[arg_143_0] = 1
	end

	local var_143_1 = slot_0_30_2[arg_143_0]
	local var_143_2 = var_143_0[var_143_1]

	slot_0_30_2[arg_143_0] = var_143_1 % #var_143_0 + 1

	return slot_0_3_0.string_split(var_143_2, " / ")
end

function slot_0_32_1(arg_144_0)
	slot_0_28_2 = true

	local var_144_0 = 0

	for iter_144_0, iter_144_1 in ipairs(arg_144_0) do
		var_144_0 = var_144_0 + slot_0_3_0.string_proper_len(iter_144_1) / 7

		slot_0_3_0.execute_after(var_144_0, function()
			game.engine:client_cmd("say " .. iter_144_1)
		end)
	end

	slot_0_3_0.execute_after(var_144_0, function()
		slot_0_28_2 = false
	end)
end

events.event:add(function(arg_147_0)
	if not slot_0_8_0.trashtalk or slot_0_28_2 then
		return
	end

	if arg_147_0:get_name() ~= "player_death" then
		return
	end

	local var_147_0 = entities.get_local_pawn()
	local var_147_1 = entities.get_local_controller()
	local var_147_2 = arg_147_0:get_controller("userid")
	local var_147_3 = arg_147_0:get_controller("attacker")

	if not var_147_2 or not var_147_3 or not var_147_0 or not var_147_1 then
		return
	end

	local var_147_4

	if var_147_3 == var_147_1 and var_147_2:is_enemy() then
		var_147_4 = "default"

		local var_147_5 = arg_147_0:get_string("weapon")

		if slot_0_27_1[var_147_5] then
			var_147_4 = var_147_5
		end
	end

	if var_147_2 == var_147_1 and var_147_3:is_enemy() then
		var_147_4 = "death"
		slot_0_29_3 = var_147_3
	end

	if var_147_2 == slot_0_29_3 then
		var_147_4 = "revenge"
		slot_0_29_3 = nil
	end

	if not var_147_4 then
		return
	end

	local var_147_6 = slot_0_31_2(var_147_4)

	if var_147_6 then
		slot_0_32_1(var_147_6)
	end
end)
events.event:add(function(arg_148_0)
	if arg_148_0:get_name() == "round_start" then
		slot_0_29_3 = nil
		last_phrase = nil
	end
end)

slot_0_27_0 = nil
slot_0_28_1 = {
	max_frame_ms = 0,
	fps_counter = 0,
	fps = 0,
	last_calculated_tick = 0,
	max_frame_ms_accum = 0,
	ping = 0,
	alpha = 0
}

function slot_0_29_2()
	local var_149_0 = slot_0_11_0.GetSystemTime()
	local var_149_1 = var_149_0.hour
	local var_149_2 = var_149_0.minute
	local var_149_3 = var_149_1 >= 12 and "pm" or "am"
	local var_149_4 = var_149_1 % 12

	if var_149_4 == 0 then
		var_149_4 = 12
	end

	return string.format("%d:%02d %s", var_149_4, var_149_2, var_149_3)
end

events.present_queue:add(function()
	local var_150_0 = slot_0_3_0.linear("watermark", slot_0_6_0.contains(slot_0_8_0.ui_interface, "Watermark"))

	if var_150_0 <= 0 then
		return
	end

	local var_150_1 = 0

	if game.engine:in_game() then
		local var_150_2 = game.engine:get_netchan()

		if var_150_2 and not var_150_2:is_null() and not var_150_2:is_loopback() then
			var_150_1 = math.floor(var_150_2:get_latency() * 1000 + 0.5)
		end
	end

	slot_0_28_1.ping = slot_0_3_0.lerp(slot_0_28_1.ping, var_150_1, 0.01)

	local var_150_3 = math.floor(slot_0_28_1.ping + 0.5)
	local var_150_4 = game.global_vars.frame_time * 1000

	if var_150_4 > slot_0_28_1.max_frame_ms_accum then
		slot_0_28_1.max_frame_ms_accum = var_150_4
	end

	local var_150_5 = game.global_vars.real_time

	if var_150_5 - slot_0_28_1.last_calculated_tick >= 1 or var_150_5 < slot_0_28_1.last_calculated_tick then
		slot_0_28_1.fps = slot_0_28_1.fps_counter
		slot_0_28_1.fps_counter = 0
		slot_0_28_1.last_calculated_tick = var_150_5
		slot_0_28_1.max_frame_ms = slot_0_28_1.max_frame_ms_accum
		slot_0_28_1.max_frame_ms_accum = 0
	else
		slot_0_28_1.fps_counter = slot_0_28_1.fps_counter + 1
	end

	local var_150_6 = {
		slot_0_0_0.label,
		slot_0_0_0.username,
		string.format("%.1f ms", slot_0_28_1.max_frame_ms),
		string.format("%d fps", slot_0_28_1.fps)
	}

	if var_150_3 > 0 then
		table.insert(var_150_6, string.format("%d ms", var_150_3))
	end

	table.insert(var_150_6, slot_0_29_2())

	local var_150_7 = table.concat(var_150_6, " | ")
	local var_150_8 = slot_0_0_0.screen[1]
	local var_150_9 = slot_0_0_0.screen[2]
	local var_150_10 = 10
	local var_150_11 = var_150_8 - var_150_10
	local var_150_12 = var_150_10

	slot_0_3_0.render_container(var_150_7, var_150_0, var_150_11, var_150_12, "right", slot_0_8_0.ui_interface_color2, "line", nil)
end)

slot_0_28_0 = nil
slot_0_29_1 = {
	enabled = false,
	time_accumulator = 0,
	last_connect = 0,
	failed_connects = 0
}

slot_0_9_0.stop_button:set_callback(function()
	slot_0_29_1.enabled = false

	slot_0_4_0.add("Brutter disabled", draw.color(148, 24, 15))
end)
slot_0_9_0.start_button:set_callback(function()
	slot_0_29_1.enabled = true

	slot_0_4_0.add("Brutter enabled", draw.color(24, 148, 15))
end)
events.frame_stage_notify:add(function(arg_153_0)
	if not slot_0_29_1.enabled then
		return
	end

	local var_153_0 = game.engine:get_netchan()

	if not var_153_0 or var_153_0:is_null() then
		return
	end

	local var_153_1 = var_153_0:get_address()

	if not var_153_1 then
		return
	end

	local var_153_2 = var_153_0:get_latency()

	if not var_153_2 then
		return
	end

	local var_153_3 = slot_0_9_0.ping_to_brute:get():gsub("%D", "")
	local var_153_4 = tonumber(var_153_3)

	if not var_153_4 or var_153_4 <= 0 then
		return
	end

	local var_153_5 = slot_0_5_0()
	local var_153_6 = math.floor(var_153_2 * 1000 + 0.5)

	if var_153_4 < var_153_6 and slot_0_29_1.failed_connects < 30 then
		if var_153_5 - slot_0_29_1.last_connect >= 333 then
			slot_0_4_0.add(string.format("Latency: %dms - reconnecting to the server", var_153_6), draw.color(24, 15, 148))
			game.engine:client_cmd(string.format("connect %s", var_153_1))

			slot_0_29_1.last_connect = var_153_5
			slot_0_29_1.failed_connects = slot_0_29_1.failed_connects + 1
		end
	else
		slot_0_29_1.failed_connects = 0

		slot_0_4_0.add(string.format("Latency: %dms - connecting to the server", var_153_6), draw.color(24, 148, 15))
		game.engine:client_cmd("play \\sounds\\ui\\beepclear.vsnd_c")

		slot_0_29_1.enabled = false
	end
end)

slot_0_29_0 = nil

function slot_0_30_1(arg_154_0)
	local var_154_0 = slot_0_8_0.additive

	return slot_0_6_0.contains(var_154_0, arg_154_0)
end

slot_0_31_1 = {
	reset2 = false,
	reset1 = false
}
slot_0_32_0 = nil
slot_0_33_1 = false

events.create_move:add(function(arg_155_0)
	if not slot_0_30_1("Disable AA if no Enemy") then
		if slot_0_31_1.reset1 == false then
			slot_0_31_1.reset1 = true

			slot_0_10_0.anti_aim:override()
		end

		return
	end

	local var_155_0 = entities.get_local_pawn()

	if var_155_0 and var_155_0.m_bIsDefusing:get() then
		return
	end

	slot_0_33_1 = true

	entities.players:for_each(function(arg_156_0)
		if arg_156_0.entity:is_enemy() and arg_156_0.entity:is_alive() then
			slot_0_33_1 = false
		end
	end)

	if slot_0_33_1 then
		slot_0_31_1.reset1 = false

		slot_0_10_0.anti_aim:override(false)
	elseif slot_0_31_1.reset1 == false then
		slot_0_31_1.reset1 = true

		slot_0_10_0.anti_aim:override()
	end
end)

slot_0_33_0 = nil

events.create_move:add(function(arg_157_0)
	if not slot_0_30_1("Bombsite E Fix") then
		if slot_0_31_1.reset2 == false then
			slot_0_31_1.reset2 = true

			slot_0_10_0.anti_aim:override()
		end

		return
	end

	local var_157_0 = entities.get_local_pawn()
	local var_157_1 = var_157_0:get_active_weapon()

	if var_157_1 and var_157_1:get_type() ~= csweapon_type.c4 and var_157_0.m_bInBombZone:get() and arg_157_0:get_button(input_bit_mask.in_use) then
		slot_0_31_1.reset2 = false

		slot_0_10_0.anti_aim:override(false)
		arg_157_0:remove_button(input_bit_mask.in_use)
	elseif slot_0_31_1.reset2 == false then
		slot_0_31_1.reset2 = true

		slot_0_10_0.anti_aim:override()
	end
end)

slot_0_34_0 = nil

events.create_move:add(function(arg_158_0)
	if not slot_0_30_1("Disable RMB on Revolver") then
		return
	end

	local var_158_0 = entities.get_local_pawn():get_active_weapon()

	if not var_158_0 or var_158_0:get_id() ~= weapon_id.revolver then
		return
	end

	arg_158_0:remove_button(input_bit_mask.in_attack2)
end)

slot_0_35_0 = nil

events.create_move:add(function(arg_159_0)
	if not slot_0_30_1("Supress Breath Animation") then
		return
	end

	local var_159_0 = entities.get_local_pawn()
	local var_159_1 = var_159_0.m_fFlags and var_159_0.m_fFlags:get() or 0
	local var_159_2 = bit.band(var_159_1, 1) == 0
	local var_159_3 = var_159_0:get_abs_velocity():length_2d()
	local var_159_4 = var_159_0:get_active_weapon()

	if not var_159_4 then
		return
	end

	if var_159_4:get_type() == csweapon_type.grenade then
		return
	end

	if arg_159_0:get_button(input_bit_mask.in_moveleft) or arg_159_0:get_button(input_bit_mask.in_moveright) or arg_159_0:get_button(input_bit_mask.in_forward) or arg_159_0:get_button(input_bit_mask.in_back) then
		return
	end

	if slot_0_0_0.auto_peek then
		return
	end

	if var_159_2 then
		return
	end

	if var_159_3 > 8 then
		return
	end

	if arg_159_0.command_number % 2 == 0 then
		arg_159_0:set_leftmove(-0.03)
	else
		arg_159_0:set_leftmove(0.03)
	end
end)

slot_0_30_0 = nil

slot_0_9_0.clipboard_hack:set_callback(function()
	if not slot_0_8_0.clipboard_hack then
		return
	end

	if slot_0_1_0.get():match("^%s*[Cc][Oo][Nn][Nn][Ee][Cc][Tt]%s+([%d%.]+:%d+)%s*$") then
		slot_0_1_0.clear()
	end
end)
events.frame_stage_notify:add(function()
	if not slot_0_8_0.clipboard_hack then
		return
	end

	local var_161_0 = slot_0_1_0.get()

	if not var_161_0 or not var_161_0:match("^%s*[Cc][Oo][Nn][Nn][Ee][Cc][Tt]%s+([%d%.]+:%d+)%s*$") then
		return
	end

	game.engine:client_cmd(var_161_0)
	slot_0_4_0.add(4, "Auto-connect -> OK", draw.color(24, 148, 15))
	slot_0_1_0.clear()
end)

slot_0_31_0 = nil

slot_0_9_0.kill_lol:set_callback(function()
	if not slot_0_8_0.kill_lol then
		return
	end

	local var_162_0 = game.engine:get_netchan()

	if not var_162_0 or var_162_0:is_null() then
		return
	end

	local var_162_1 = var_162_0:get_address()

	if not var_162_1 then
		return
	end

	game.engine:client_cmd(string.format("connect %s", var_162_1))
	slot_0_9_0.kill_lol:set(false)
end)
