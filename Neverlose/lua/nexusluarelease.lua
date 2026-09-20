--by scriptleaks https://discord.gg/kTHUpjVQPV t.me/scriptleakslol

ffi.cdef("    typedef struct {\n        char  pad_0000[20];\n        int m_nOrder;\n        int m_nSequence;\n        float m_flPrevCycle;\n        float m_flWeight;\n        float m_flWeightDeltaRate;\n        float m_flPlaybackRate;\n        float m_flCycle;\n        void *m_pOwner;\n        char  pad_0038[4];\n    } CAnimationLayer;\n")
math.randomseed(common.get_unixtime())

slot_0_0_0 = (function()
	ffi.cdef("        typedef struct {\n            long long QuadPart;\n        } LARGE_INTEGER;\n        int QueryPerformanceCounter(LARGE_INTEGER* lpPerformanceCount);\n        int QueryPerformanceFrequency(LARGE_INTEGER* lpFrequency);\n        uint64_t GetTickCount64(void);\n        uint32_t timeGetDevCaps(void* ptc, uint32_t cbtc);\n    ")

	local var_1_0 = ffi.new("LARGE_INTEGER")
	local var_1_1 = ffi.new("LARGE_INTEGER")

	if ffi.C.QueryPerformanceFrequency(var_1_0) == 1 then
		local var_1_2 = tonumber(var_1_0.QuadPart)

		return function()
			if ffi.C.QueryPerformanceCounter(var_1_1) == 1 then
				return tonumber(var_1_1.QuadPart) / var_1_2
			end

			return ffi.C.GetTickCount64() / 1000
		end
	end

	return function()
		return ffi.C.GetTickCount64() / 1000
	end
end)()
slot_0_1_0 = require("neverlose/events")
slot_0_2_0 = require("neverlose/clipboard")
slot_0_3_0 = require("neverlose/smoothy")
slot_0_4_0 = require("neverlose/base64")
slot_0_5_0 = require("neverlose/pui")
slot_0_6_0 = math.random
slot_0_7_0 = math.normalize_yaw
slot_0_8_0 = math.abs
slot_0_9_0 = math.ceil
slot_0_10_0 = math.cos
slot_0_11_0 = math.floor
slot_0_12_0 = math.fmod
slot_0_13_0 = math.max
slot_0_14_0 = math.min
slot_0_15_0 = math.rad
slot_0_16_0 = math.sin
slot_0_17_0 = math.sqrt
slot_0_18_0 = math.clamp
slot_0_19_0 = table.concat

function math.round(arg_4_0)
	return arg_4_0 and math.floor(arg_4_0 + 0.5) or 0
end

function slot_0_20_0(arg_5_0, arg_5_1, arg_5_2)
	return arg_5_0 + (arg_5_1 - arg_5_0) * arg_5_2
end

function slot_0_21_0(arg_6_0, arg_6_1)
	local var_6_0 = {}

	for iter_6_0, iter_6_1 in pairs(arg_6_0) do
		var_6_0[iter_6_0] = arg_6_1(iter_6_1)
	end

	return var_6_0
end

function slot_0_22_0(arg_7_0, arg_7_1)
	for iter_7_0, iter_7_1 in ipairs(arg_7_0) do
		if iter_7_1 == arg_7_1 then
			return true
		end
	end

	return false
end

function slot_0_23_0(arg_8_0, arg_8_1)
	local var_8_0 = {}

	for iter_8_0 in (arg_8_0 .. arg_8_1):gmatch("(.-)" .. arg_8_1) do
		table.insert(var_8_0, iter_8_0)
	end

	return var_8_0
end

function slot_0_24_0(arg_9_0, arg_9_1, arg_9_2, arg_9_3)
	if not arg_9_0 or arg_9_0 == "" then
		return ""
	end

	local var_9_0 = {}
	local var_9_1 = string.len(arg_9_0) > 1 and 1 / (string.len(arg_9_0) - 1) or 1

	for iter_9_0 in arg_9_0:gmatch(".[\x80-\xBF]*") do
		local var_9_2 = arg_9_1 % 2

		var_9_2 = var_9_2 > 1 and 2 - var_9_2 or var_9_2

		local var_9_3 = arg_9_2.r + (arg_9_3.r - arg_9_2.r) * var_9_2
		local var_9_4 = arg_9_2.g + (arg_9_3.g - arg_9_2.g) * var_9_2
		local var_9_5 = arg_9_2.b + (arg_9_3.b - arg_9_2.b) * var_9_2
		local var_9_6 = arg_9_2.a + (arg_9_3.a - arg_9_2.a) * var_9_2

		var_9_0[#var_9_0 + 1] = "\a" .. color(var_9_3, var_9_4, var_9_5, var_9_6):to_hex() .. iter_9_0
		arg_9_1 = arg_9_1 + var_9_1
	end

	return slot_0_19_0(var_9_0)
end

function slot_0_25_0(arg_10_0)
	return (arg_10_0:lower():gsub("\a%x%x%x%x%x%x%x%x", ""):gsub("\a{[^}]+}", ""):gsub("\a", ""):gsub("\t", ""):gsub("[\xF0-\xF4][\x80-\xBF][\x80-\xBF][\x80-\xBF]", ""):gsub("[\xE0-\xEF][\x80-\xBF][\x80-\xBF]", ""):gsub("[\xC0-\xDF][\x80-\xBF]", ""):gsub("default%s*", ""):gsub("%s+", " "):gsub("^%s*(.-)%s*$", "%1"))
end

slot_0_26_0 = {
	icon = "atom",
	name = "nexus",
	sidebar_name = "Nexus",
	branch = "release"
}
slot_0_27_0 = {
	"Default",
	"Standing",
	"Running",
	"Slowwalking",
	"Ducking",
	"Sneaking",
	"In Air",
	"In Air & Crouching"
}
;({}).player_state = {
	"Default",
	"Standing",
	"Running",
	"Slowwalking",
	"Ducking",
	"Sneaking",
	"In Air",
	"In Air & Crouching"
}
slot_0_29_0 = {
	FL_ONGROUND = bit.lshift(1, 0),
	FL_FROZEN = bit.lshift(1, 5)
}
slot_0_30_0 = render.screen_size()
slot_0_31_0 = {}
slot_0_32_1 = "ui/beepclear.wav"
slot_0_33_1 = "resource/warning.wav"
slot_0_34_1 = cvar.playvol

function slot_0_31_0.success(...)
	slot_0_34_1:call(slot_0_32_1, 1)
end

function slot_0_31_0.failure(...)
	slot_0_34_1:call(slot_0_33_1, 1)
end

function slot_0_31_0.click()
	slot_0_34_1:call(string.format("ui\\csgo_ui_contract_type%d", math.random(1, 10)), 1)
end

function slot_0_32_0(arg_14_0, arg_14_1, arg_14_2)
	slot_0_5_0.sidebar("##nexus_notification", slot_0_5_0.string(arg_14_0))
	common.add_notify(slot_0_5_0.string(arg_14_1), slot_0_5_0.string(arg_14_2))
end

function slot_0_33_0(arg_15_0)
	slot_0_32_0("\f<triangle-exclamation>", "Error", arg_15_0)
	slot_0_31_0.failure()
end

function slot_0_34_0(arg_16_0)
	slot_0_32_0("\f<circle-check>", "Success", arg_16_0)
	slot_0_31_0.success()
end

slot_0_35_1 = {}
slot_0_36_0 = false
slot_0_37_1 = {
	map = {},
	performance = {},
	setup = {}
}
slot_0_38_1 = {
	set = function(arg_17_0, arg_17_1)
		if not slot_0_37_1.setup[arg_17_0.name] then
			slot_0_37_1.setup[arg_17_0.name] = {}
		end

		if not arg_17_0.handlers[arg_17_1] then
			table.insert(slot_0_37_1.setup[arg_17_0.name], arg_17_1)

			arg_17_0.handlers[arg_17_1] = arg_17_1

			return true
		end

		return false
	end,
	unset = function(arg_18_0, arg_18_1)
		if arg_18_0.handlers[arg_18_1] then
			arg_18_0.handlers[arg_18_1] = nil

			return true
		end

		return false
	end,
	call = function(arg_19_0, ...)
		local var_19_0 = slot_0_1_0[arg_19_0.name]

		if var_19_0 then
			var_19_0:call(...)
		end
	end
}

function slot_0_39_2(arg_20_0, arg_20_1)
	if type(arg_20_0) == "string" then
		slot_0_1_0[arg_20_0](function(...)
			if EXPIRED and TRIAL_REMAINING <= 0 and arg_20_0 ~= "shutdown" then
				return
			end

			slot_0_37_1.performance[arg_20_0] = {}

			xpcall(function(...)
				for iter_22_0, iter_22_1 in pairs(arg_20_1) do
					local var_22_0 = slot_0_0_0()

					iter_22_1(...)

					slot_0_37_1.performance[arg_20_0][iter_22_1] = (slot_0_0_0() - var_22_0) * 1000
				end
			end, function(arg_23_0)
				print(string.format("[%s] Error: %s", arg_20_0, arg_23_0))
			end, ...)
		end)
	end
end

slot_0_35_0 = slot_0_1_0

if slot_0_36_0 then
	slot_0_35_0 = setmetatable({}, {
		__index = function(arg_24_0, arg_24_1)
			local var_24_0 = slot_0_37_1.map[arg_24_1]

			if not var_24_0 then
				print(string.format("Registering new event: %s", arg_24_1))

				var_24_0 = setmetatable({
					handlers = {},
					name = arg_24_1
				}, {
					__index = slot_0_38_1,
					__call = function(arg_25_0, arg_25_1, arg_25_2)
						if arg_25_2 == nil then
							arg_25_2 = true
						end

						arg_25_0[arg_25_2 and "set" or "unset"](arg_25_0, arg_25_1)
					end
				})
				slot_0_37_1.map[arg_24_1] = var_24_0

				slot_0_39_2(arg_24_1, var_24_0.handlers)
			end

			return var_24_0
		end
	})
	slot_0_40_3 = 3
	slot_0_41_3 = 16

	slot_0_1_0.render(function()
		local var_26_0 = render.screen_size()
		local var_26_1 = vector(5, var_26_0.y * 0.25)

		for iter_26_0, iter_26_1 in pairs(slot_0_37_1.performance) do
			render.text(slot_0_40_3, var_26_1, color(255, 255, 255), nil, iter_26_0)

			var_26_1.y = var_26_1.y + slot_0_41_3

			for iter_26_2, iter_26_3 in ipairs(slot_0_37_1.setup[iter_26_0] or {}) do
				local var_26_2 = iter_26_1[iter_26_3] or 0
				local var_26_3 = string.format("  [%d]: %.3fms", iter_26_2, var_26_2)
				local var_26_4 = var_26_2 > 1 and color(255, 100, 100) or color(255, 255, 255)

				render.text(slot_0_40_3, var_26_1, var_26_4, nil, var_26_3)

				var_26_1.y = var_26_1.y + slot_0_41_3
			end

			var_26_1.y = var_26_1.y + 8
		end
	end)
end

slot_0_37_0 = {
	list = {}
}
slot_0_37_0.__index = slot_0_37_0

function slot_0_37_0.new(arg_27_0, arg_27_1)
	arg_27_1 = arg_27_1 or 0

	if slot_0_37_0.list[arg_27_0] == nil then
		slot_0_37_0.list[arg_27_0] = slot_0_3_0.new(0)
	end

	return setmetatable({
		name = arg_27_0
	}, slot_0_37_0)
end

function slot_0_37_0.update(arg_28_0, arg_28_1, arg_28_2)
	local var_28_0 = slot_0_37_0.list[arg_28_0.name]

	var_28_0:update(arg_28_1, arg_28_2)

	return var_28_0
end

function slot_0_37_0.clear(arg_29_0)
	for iter_29_0, iter_29_1 in pairs(slot_0_37_0.list) do
		if iter_29_0:find(arg_29_0) then
			slot_0_37_0.list[iter_29_0] = nil
		end
	end
end

slot_0_38_0 = {}
slot_0_39_1 = {}
slot_0_40_2 = nil
slot_0_41_2 = nil
slot_0_42_3 = slot_0_5_0.create("##WINDOWS")

slot_0_42_3:visibility(false)

slot_0_43_4 = slot_0_3_0.new(0)

function slot_0_44_5(...)
	local var_30_0, var_30_1 = pcall(json.parse, ...)

	if var_30_0 then
		return var_30_1
	end

	return nil
end

function slot_0_45_6(...)
	return json.stringify(...)
end

function slot_0_46_7(arg_32_0, arg_32_1, arg_32_2)
	return arg_32_0.x >= arg_32_1.x and arg_32_0.x <= arg_32_1.x + arg_32_2.x and arg_32_0.y >= arg_32_1.y and arg_32_0.y <= arg_32_1.y + arg_32_2.y
end

function slot_0_47_4(arg_33_0, arg_33_1, arg_33_2)
	return vector(slot_0_18_0(arg_33_0.x, arg_33_1.x, arg_33_2.x), slot_0_18_0(arg_33_0.y, arg_33_1.y, arg_33_2.y))
end

slot_0_48_4 = {
	pos = vector(),
	prev_pos = vector(),
	delta = vector()
}
slot_0_48_4.down = false
slot_0_48_4.clicked = false
slot_0_48_4.down_duration = 0

function slot_0_48_4.update()
	local var_34_0 = ui.get_mouse_position()
	local var_34_1 = common.is_button_down(1)

	slot_0_48_4.prev_pos = slot_0_48_4.pos
	slot_0_48_4.pos = var_34_0
	slot_0_48_4.delta = slot_0_48_4.pos - slot_0_48_4.prev_pos
	slot_0_48_4.down = var_34_1
	slot_0_48_4.clicked = var_34_1 and slot_0_48_4.down_duration < 0
	slot_0_48_4.down_duration = var_34_1 and (slot_0_48_4.down_duration < 0 and 0 or slot_0_48_4.down_duration + 1) or -1
end

slot_0_49_5 = {
	get_pos = function(arg_35_0, arg_35_1)
		local var_35_0 = slot_0_44_5(arg_35_0.item:get())

		if not var_35_0 then
			return vector()
		end

		if arg_35_1 then
			return var_35_0[arg_35_1]
		end

		return vector(var_35_0.x, var_35_0.y)
	end,
	set_pos = function(arg_36_0, arg_36_1, arg_36_2)
		if type(arg_36_1) == "number" then
			if arg_36_2 == "x" then
				arg_36_0.pos.x = arg_36_1
			elseif arg_36_2 == "y" then
				arg_36_0.pos.y = arg_36_1
			end

			arg_36_0.item:set(slot_0_45_6({
				x = arg_36_0.pos.x,
				y = arg_36_0.pos.y
			}))
		else
			arg_36_0.pos = arg_36_1

			arg_36_0.item:set(slot_0_45_6({
				x = arg_36_0.pos.x,
				y = arg_36_0.pos.y
			}))
		end

		return arg_36_0
	end,
	set_size = function(arg_37_0, arg_37_1, arg_37_2)
		if type(arg_37_1) == "number" then
			if arg_37_2 == "x" then
				arg_37_0.size.x = arg_37_1
			elseif arg_37_2 == "y" then
				arg_37_0.size.y = arg_37_1
			end
		else
			arg_37_0.size = arg_37_1
		end

		return arg_37_0
	end,
	set_min = function(arg_38_0, arg_38_1)
		arg_38_0.min = arg_38_1

		return arg_38_0
	end,
	set_max = function(arg_39_0, arg_39_1)
		arg_39_0.max = arg_39_1

		return arg_39_0
	end,
	set_rules = function(arg_40_0, arg_40_1)
		arg_40_0.rules = arg_40_1

		return arg_40_0
	end,
	update = function(arg_41_0, arg_41_1)
		if arg_41_1 then
			local var_41_0 = slot_0_44_5(arg_41_0.item:get())

			if var_41_0 then
				if var_41_0.x then
					arg_41_0:set_pos(var_41_0.x, "x")
				end

				if var_41_0.y then
					arg_41_0:set_pos(var_41_0.y, "y")
				end
			end

			return arg_41_0
		end

		if not arg_41_0.is_active then
			return
		end

		arg_41_0.is_hovered = slot_0_46_7(slot_0_48_4.pos, arg_41_0.pos, arg_41_0.size)
		arg_41_0.in_dragging = false

		if arg_41_0.is_hovered then
			slot_0_41_2 = arg_41_0
		end

		if arg_41_0.is_hovered and slot_0_48_4.clicked then
			slot_0_40_2 = arg_41_0
			arg_41_0.offset = arg_41_0.pos - slot_0_48_4.pos
		end

		local var_41_1 = arg_41_0.offset and slot_0_48_4.pos + arg_41_0.offset or arg_41_0.pos
		local var_41_2 = {}
		local var_41_3 = arg_41_0.pos + arg_41_0.size * 0.5
		local var_41_4 = var_41_1 + arg_41_0.size * 0.5
		local var_41_5 = common.is_button_down(162)

		for iter_41_0, iter_41_1 in ipairs(arg_41_0.rules) do
			local var_41_6 = iter_41_1.pos
			local var_41_7 = iter_41_1.end_pos
			local var_41_8 = iter_41_1.horizontal
			local var_41_9 = arg_41_0.animations[iter_41_0] or (function()
				arg_41_0.animations[iter_41_0] = slot_0_3_0.new(0)

				return arg_41_0.animations[iter_41_0]
			end)()
			local var_41_10 = var_41_8 and "x" or "y"
			local var_41_11 = math.abs(var_41_4[var_41_10] - var_41_6[var_41_10])

			if slot_0_40_2 == arg_41_0 and not var_41_5 and var_41_11 < 8 then
				var_41_2[var_41_10] = var_41_6[var_41_10] - arg_41_0.size[var_41_10] * 0.5
			end

			local var_41_12 = math.abs(var_41_3[var_41_10] - var_41_6[var_41_10])
			local var_41_13 = var_41_9(0.05, slot_0_40_2 == arg_41_0 and not var_41_5 and (var_41_12 < 10 and 120 or 60) or 0)
			local var_41_14 = var_41_8 and vector(var_41_6.x, var_41_7 and var_41_6.y or 0) or vector(var_41_7 and var_41_6.x or 0, var_41_6.y)
			local var_41_15 = var_41_8 and vector(var_41_6.x + 1, var_41_7 and var_41_7.y or slot_0_30_0.y) or vector(var_41_7 and var_41_7.x or slot_0_30_0.x, var_41_6.y + 1)

			render.rect(var_41_14, var_41_15, color(255, var_41_13))
		end

		if slot_0_40_2 == arg_41_0 then
			local var_41_16 = vector(var_41_2.x or var_41_1.x, var_41_2.y or var_41_1.y)
			local var_41_17 = arg_41_0.min
			local var_41_18 = arg_41_0.max

			if arg_41_0.is_centered then
				var_41_17 = arg_41_0.min - arg_41_0.size * 0.5
				var_41_18 = arg_41_0.max - arg_41_0.size * 0.5
			end

			local var_41_19 = slot_0_47_4(var_41_17, vector(0, 0), slot_0_30_0 - arg_41_0.size)
			local var_41_20 = slot_0_47_4(var_41_18, vector(0, 0), slot_0_30_0 - arg_41_0.size)
			local var_41_21 = slot_0_47_4(var_41_16, var_41_19, var_41_20)

			if arg_41_0.on_dragging then
				arg_41_0:on_dragging()
			end

			arg_41_0.in_dragging = true

			arg_41_0:set_pos(var_41_21)
		end

		arg_41_0.item:set(slot_0_45_6({
			x = arg_41_0.pos.x,
			y = arg_41_0.pos.y
		}))

		return arg_41_0
	end,
	render = function(arg_43_0)
		local var_43_0 = arg_43_0.pos
		local var_43_1 = arg_43_0.animations.hover(0.05, arg_43_0.is_active and (arg_43_0.is_hovered and (common.is_button_down(1) and 0.4 or 0.2) or 0) or 0) * ui.get_alpha()

		if var_43_1 > 0 then
			render.rect(var_43_0 - 1, var_43_0 + arg_43_0.size + 1, color(255, 170 * var_43_1), 4)
		end

		local var_43_2 = arg_43_0.animations.border(0.05, arg_43_0.is_active and arg_43_0.render_border and slot_0_40_2 == arg_43_0 and 1 or 0) * ui.get_alpha()

		if var_43_2 > 0 then
			render.rect_outline(arg_43_0.min, arg_43_0.max + arg_43_0.size, color(255, 127 * var_43_2), 1, 4)
		end

		if arg_43_0.pos < vector(0, 0) then
			arg_43_0:set_pos(vector(0, 0))
		elseif arg_43_0.pos > slot_0_30_0 - arg_43_0.size then
			arg_43_0:set_pos(slot_0_30_0 - arg_43_0.size)
		end

		if arg_43_0.render_callback then
			arg_43_0.render_callback(arg_43_0)
		end
	end
}
slot_0_49_5.__index = slot_0_49_5
slot_0_38_0.items = {}
slot_0_38_0.list = slot_0_39_1

function slot_0_38_0.new(arg_44_0)
	local var_44_0 = {
		render_border = false,
		is_hovered = false,
		is_centered = true,
		is_dragging = false,
		is_active = true,
		name = arg_44_0,
		item = slot_0_42_3:value(arg_44_0, ""),
		offset = vector(0, 0),
		pos = vector(0, 0),
		size = vector(0, 0),
		min = vector(0, 0),
		max = vector(slot_0_30_0.x, slot_0_30_0.y),
		rules = {},
		animations = {
			rulers = {},
			border = slot_0_3_0.new(0),
			hover = slot_0_3_0.new(0)
		}
	}

	table.insert(slot_0_38_0.items, var_44_0.item)
	setmetatable(var_44_0, slot_0_49_5)
	table.insert(slot_0_39_1, var_44_0)

	return var_44_0
end

slot_0_1_0.render(function()
	slot_0_48_4.update()

	slot_0_41_2 = nil

	if not slot_0_48_4.down then
		if slot_0_40_2 and slot_0_40_2.on_release then
			slot_0_40_2:on_release()
		end

		slot_0_40_2 = nil
	end

	slot_0_43_4:update(0.075, slot_0_40_2 ~= nil and slot_0_38_0.background and 1 or 0)

	if slot_0_43_4.value > 0 then
		render.rect(vector(), slot_0_30_0, color(0, 75 * slot_0_43_4.value))
		render.blur(vector(), slot_0_30_0, 1, slot_0_43_4.value)
	end

	for iter_45_0 = #slot_0_39_1, 1, -1 do
		local var_45_0 = slot_0_39_1[iter_45_0]

		if ui.get_alpha() > 0 then
			var_45_0:update()
		end

		var_45_0:render()
	end
end)
slot_0_35_0.mouse_input(function(arg_46_0)
	if slot_0_41_2 or slot_0_40_2 then
		return ui.get_alpha() == 0
	end
end)

slot_0_39_0 = {}

function slot_0_40_1(arg_47_0)
	local var_47_0 = entity.get_player_resource()

	if var_47_0 == nil then
		return "?"
	end

	local var_47_1 = vector()
	local var_47_2 = vector()
	local var_47_3 = var_47_0.m_bombsiteCenterA
	local var_47_4 = var_47_0.m_bombsiteCenterB

	return arg_47_0:dist(var_47_3) < arg_47_0:dist(var_47_4) and "A" or "B"
end

slot_0_41_1 = 450.7
slot_0_42_2 = 75.68
slot_0_43_3 = 789.2

function slot_0_44_4(arg_48_0, arg_48_1)
	local var_48_0 = (arg_48_0 - slot_0_42_2) / slot_0_43_3
	local var_48_1 = slot_0_41_1 * math.exp(-var_48_0 * var_48_0)

	if arg_48_1 > 0 then
		local var_48_2 = 0.5
		local var_48_3 = 0.5
		local var_48_4 = var_48_1 * var_48_2

		if arg_48_1 < (var_48_1 - var_48_4) * var_48_3 then
			var_48_4 = var_48_1 - arg_48_1 * (1 / var_48_3)
		end

		var_48_1 = var_48_4
	end

	return math.max(math.floor(var_48_1 + 0.5), 0)
end

function slot_0_39_0.get_damage(arg_49_0, arg_49_1, arg_49_2)
	if arg_49_1 == nil or arg_49_2 == nil then
		return -1
	end

	local var_49_0 = arg_49_1.m_ArmorValue
	local var_49_1 = arg_49_1:get_eye_position()
	local var_49_2 = arg_49_2:get_origin():dist(var_49_1)

	return slot_0_44_4(var_49_2, var_49_0)
end

slot_0_45_5 = {}
slot_0_45_5.time = 0
slot_0_45_5.remaining = 0
slot_0_45_5.site = "?"

function slot_0_46_6()
	local var_50_0 = slot_0_45_5
	local var_50_1 = entity.get_entities("CC4", true)[1]

	if var_50_1 == nil or var_50_1.m_bStartedArming == false then
		var_50_0.time = 0
		var_50_0.remaining = 0
		var_50_0.site = "?"

		return
	end

	var_50_0.time = var_50_1.m_fArmedTime
	var_50_0.remaining = (var_50_0.time - globals.curtime) / 3
	var_50_0.site = slot_0_40_1(var_50_1:get_origin())
end

slot_0_35_0.net_update_start:set(slot_0_46_6)

slot_0_46_5 = {}
slot_0_46_5.site = "?"
slot_0_46_5.time = 0
slot_0_46_5.defuser = nil
slot_0_46_5.defuse_length = 0
slot_0_46_5.defuse_countdown = 0
slot_0_46_5.defuse_remaining = 0

function slot_0_47_3()
	local var_51_0 = slot_0_46_5
	local var_51_1 = entity.get_entities("CPlantedC4", true)[1]

	var_51_0.site = "?"
	var_51_0.time = 0
	var_51_0.defuse_remaining = 0

	if var_51_1 == nil or var_51_1.m_bBombTicking == false then
		return
	end

	var_51_0.site = slot_0_40_1(var_51_1:get_origin())
	var_51_0.time = var_51_1.m_flC4Blow
	var_51_0.is_defused = var_51_1.m_bBombDefused

	if not var_51_0.is_defused then
		local var_51_2 = var_51_1.m_hBombDefuser

		if var_51_2 ~= nil then
			var_51_0.defuser = var_51_2
			var_51_0.defuse_length = var_51_1.m_flDefuseLength
			var_51_0.defuse_countdown = var_51_1.m_flDefuseCountDown
			var_51_0.defuse_remaining = math.clamp((var_51_0.defuse_countdown - globals.curtime) / var_51_0.defuse_length, 0, 1)
		end
	end
end

slot_0_35_0.net_update_start:set(slot_0_47_3)

slot_0_39_0.planted = slot_0_46_5
slot_0_39_0.planting = slot_0_45_5
slot_0_40_0 = {
	ragebot = {
		dormant_aimbot = slot_0_5_0.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot"),
		hide_shots = slot_0_5_0.find("Aimbot", "Ragebot", "Main", "Hide Shots", {
			options = "Options"
		}),
		double_tap = slot_0_5_0.find("Aimbot", "Ragebot", "Main", "Double Tap", {
			lag_options = "Lag Options"
		}),
		safety = {
			safe_points = slot_0_5_0.find("Aimbot", "Ragebot", "Safety", "Safe Points"),
			body_aim = slot_0_5_0.find("Aimbot", "Ragebot", "Safety", "Body Aim")
		}
	},
	anti_aim = {
		angles = {
			pitch = slot_0_5_0.find("Aimbot", "Anti Aim", "Angles", "Pitch"),
			yaw = slot_0_5_0.find("Aimbot", "Anti Aim", "Angles", "Yaw", {
				base = "Base",
				avoid_backstab = "Avoid Backstab",
				hidden = "Hidden",
				offset = "Offset"
			}),
			yaw_modifier = slot_0_5_0.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", {
				offset = "Offset"
			}),
			body_yaw = slot_0_5_0.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", {
				options = "Options",
				inverter = "Inverter",
				freestanding = "Freestanding",
				right_limit = "Right Limit",
				left_limit = "Left Limit"
			}),
			freestanding = slot_0_5_0.find("Aimbot", "Anti Aim", "Angles", "Freestanding", {
				body = "Body Freestanding",
				disable_yaw_modifiers = "Disable Yaw Modifiers"
			})
		},
		fake_lag = {
			enabled = slot_0_5_0.find("Aimbot", "Anti Aim", "Fake Lag", "Enabled"),
			limit = slot_0_5_0.find("Aimbot", "Anti Aim", "Fake Lag", "Limit"),
			variability = slot_0_5_0.find("Aimbot", "Anti Aim", "Fake Lag", "Variability")
		},
		other = {
			fake_duck = slot_0_5_0.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"),
			slow_walk = slot_0_5_0.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"),
			leg_movement = slot_0_5_0.find("Aimbot", "Anti Aim", "Misc", "Leg Movement")
		}
	},
	world = {
		main = {
			override_zoom = slot_0_5_0.find("Visuals", "World", "Main", "Override Zoom", {
				scope_overlay = "Scope Overlay"
			})
		}
	},
	misc = {
		other = {
			windows = slot_0_5_0.find("Miscellaneous", "Main", "Other", "Windows"),
			fake_latency = slot_0_5_0.find("Miscellaneous", "Main", "Other", "Fake Latency")
		},
		in_game = {
			clan_tag = slot_0_5_0.find("Miscellaneous", "Main", "In-Game", "Clan Tag"),
			shared_features = slot_0_5_0.find("Miscellaneous", "Main", "In-Game", "Shared Features")
		}
	}
}

function slot_0_40_0.is_slow_motion()
	return slot_0_40_0.anti_aim.other.slow_walk:get() or slot_0_40_0.anti_aim.other.slow_walk:get_override()
end

slot_0_41_0 = {}
slot_0_42_1 = 3.63
slot_0_43_2 = 0.45
slot_0_44_3 = 0
slot_0_45_4 = 0

function slot_0_46_4(arg_53_0)
	return slot_0_7_0(arg_53_0.eye_yaw - arg_53_0.abs_yaw)
end

slot_0_41_0.flags = 0
slot_0_41_0.packets = 0
slot_0_41_0.body_yaw = 0
slot_0_41_0.duck_amount = 0
slot_0_41_0.movetype = 0
slot_0_41_0.velocity = 0
slot_0_41_0.is_frozen = false
slot_0_41_0.is_onground = false
slot_0_41_0.is_crouched = false
slot_0_41_0.is_moving = false
slot_0_41_0.is_landing = false
slot_0_41_0.is_airborne = false
slot_0_41_0.in_scoreboard = false

function slot_0_41_0.setup_command(arg_54_0)
	local var_54_0 = entity.get_local_player()

	if not var_54_0 then
		return
	end

	slot_0_44_3 = var_54_0.m_fFlags
end

function slot_0_41_0.run_command(arg_55_0)
	local var_55_0 = entity.get_local_player()

	if not var_55_0 then
		return
	end

	slot_0_45_4 = var_55_0.m_fFlags
end

function slot_0_41_0.net_update_end()
	local var_56_0 = entity.get_local_player()

	if not var_56_0 then
		return
	end

	local var_56_1 = var_56_0:get_anim_state()

	if not var_56_1 then
		return
	end

	local var_56_2 = var_56_0.m_fFlags
	local var_56_3 = var_56_0.m_MoveType
	local var_56_4 = var_56_0.m_flDuckAmount

	slot_0_41_0.flags = var_56_2
	slot_0_41_0.movetype = var_56_3
	slot_0_41_0.velocity = var_56_1.velocity

	if globals.choked_commands == 0 then
		slot_0_41_0.body_yaw = slot_0_46_4(var_56_1)
		slot_0_41_0.duck_amount = var_56_4
	end

	slot_0_41_0.is_frozen = bit.band(var_56_2, slot_0_29_0.FL_FROZEN) ~= 0
	slot_0_41_0.is_onground = var_56_1.on_ground
	slot_0_41_0.is_crouched = slot_0_41_0.duck_amount > slot_0_43_2
	slot_0_41_0.is_moving = slot_0_41_0.velocity > vector(slot_0_42_1, slot_0_42_1, slot_0_42_1)
	slot_0_41_0.is_landing = var_56_1.landing
	slot_0_41_0.is_airborne = bit.band(slot_0_44_3, slot_0_45_4, slot_0_29_0.FL_ONGROUND) == 0
end

function slot_0_41_0.createmove(arg_57_0)
	if globals.choked_commands == 0 then
		slot_0_41_0.packets = slot_0_41_0.packets + 1
	end

	slot_0_41_0.in_scoreboard = arg_57_0.in_score
end

slot_0_5_0.colors.accent = color("#7396FFFF")
slot_0_5_0.colors.hit = color("#7396FFFF")
slot_0_5_0.colors.miss = color("#FF7373FF")
slot_0_42_0 = {}
slot_0_43_1 = true
slot_0_44_2 = "ui/beepclear.wav"
slot_0_45_3 = "resource/warning.wav"
slot_0_46_3 = "ui/menu_back.wav"
slot_0_47_2 = cvar.playvol
slot_0_48_3 = {
	warning = "\aFFFF32FF",
	error = "\aFF3232FF",
	info = "\a7f7fFFFF"
}

function slot_0_49_4(arg_58_0, arg_58_1, arg_58_2)
	if not slot_0_43_1 then
		return
	end

	if arg_58_2 then
		slot_0_47_2:call(arg_58_2, 1)
	end

	print_raw(string.format("%s[%s]\aDEFAULT %s", slot_0_48_3[arg_58_0], arg_58_0, arg_58_1))
	print_dev(arg_58_1)
end

function slot_0_42_0.info(arg_59_0)
	slot_0_49_4("info", arg_59_0, slot_0_44_2)
end

function slot_0_42_0.warning(arg_60_0)
	slot_0_49_4("warning", arg_60_0, slot_0_45_3)
end

function slot_0_42_0.error(arg_61_0)
	slot_0_49_4("error", arg_61_0, slot_0_46_3)
end

slot_0_43_0 = {}
slot_0_44_1 = "NEXUS::USERDATA"
slot_0_45_2 = db[slot_0_44_1]

if not slot_0_45_2 then
	slot_0_42_0.warning("no nexus userdata found, creating new one")

	slot_0_45_2 = {}
end

if not slot_0_45_2.configurations then
	slot_0_45_2.configurations = {}
end

if not slot_0_45_2.time_spent then
	slot_0_45_2.time_spent = 0
end

if not slot_0_45_2.kills then
	slot_0_45_2.kills = 0
end

if not slot_0_45_2.misses then
	slot_0_45_2.misses = 0
end

slot_0_1_0.player_death:set(function(arg_62_0)
	local var_62_0 = entity.get_local_player()
	local var_62_1 = entity.get(arg_62_0.userid, true)

	if var_62_1:is_bot() then
		return
	end

	if var_62_0 == entity.get(arg_62_0.attacker, true) and var_62_0 ~= var_62_1 then
		slot_0_43_0.kills = slot_0_43_0.kills + 1
	end
end)
slot_0_1_0.aim_ack:set(function(arg_63_0)
	if not arg_63_0.state then
		return
	end

	if arg_63_0.target:is_bot() then
		return
	end

	slot_0_43_0.misses = slot_0_43_0.misses + 1
end)
slot_0_1_0.shutdown(function()
	db[slot_0_44_1] = slot_0_45_2
end)

slot_0_43_0 = slot_0_45_2
slot_0_44_0 = {}
slot_0_45_1 = "nexus::cfg"
slot_0_46_2 = {}
slot_0_47_1 = {
	"nexus::cfg::g6ZhdXRob3Klc3F3YXSkbmFtZadEZWZhdWx0p2NvbnRlbnSCq2FudGlfYWltYm90hKdnZW5lcmFshqptYW51YWxfeWF3qERpc2FibGVkq35tYW51YWxfeWF3gah5YXdfYmFzZapMb2NhbCBWaWV3rmF2b2lkX2JhY2tzdGFiw6l+ZWRnZV95YXeBqHdoaWxlX2ZkwqhlZGdlX3lhd8KsZnJlZXN0YW5kaW5nwq5zdGF0ZV9zZWxlY3RvcginYnVpbGRlcpiJqG92ZXJyaWRlw6d+ZGVzeW5jg6RsZWZ0PKVyaWdodDysZnJlZXN0YW5kaW5no09mZql+bW9kaWZpZXKCpHdheXMDpm9mZnNldACpZGVmZW5zaXZlwqhtb2RpZmllcqhEaXNhYmxlZKZkZXN5bmPDqn5kZWZlbnNpdmWCpXBpdGNopERvd26jeWF3qERpc2FibGVko3lhd6kxODDCsCBML1Kkfnlhd4akbGVmdOqmb2Zmc2V0AKlyYW5kb21pemUAq3ZhcmlhYmlsaXR5NKVyaWdodCylZGVsYXkIiahvdmVycmlkZcOnfmRlc3luY4OkbGVmdDylcmlnaHQ8rGZyZWVzdGFuZGluZ6NPZmapfm1vZGlmaWVygqR3YXlzA6ZvZmZzZXQAqWRlZmVuc2l2ZcKobW9kaWZpZXKoRGlzYWJsZWSmZGVzeW5jw6p+ZGVmZW5zaXZlgqVwaXRjaKhEaXNhYmxlZKN5YXeoRGlzYWJsZWSjeWF3qTE4MMKwIEwvUqR+eWF3hqRsZWZ066ZvZmZzZXQAqXJhbmRvbWl6ZRqrdmFyaWFiaWxpdHkjpXJpZ2h0KaVkZWxheQKJqG92ZXJyaWRlw6d+ZGVzeW5jg6RsZWZ0PKVyaWdodDysZnJlZXN0YW5kaW5no09mZql+bW9kaWZpZXKCpHdheXMDpm9mZnNldACpZGVmZW5zaXZlwqhtb2RpZmllcqhEaXNhYmxlZKZkZXN5bmPDqn5kZWZlbnNpdmWCpXBpdGNoqERpc2FibGVko3lhd6hEaXNhYmxlZKN5YXepMTgwwrAgTC9SpH55YXeGpGxlZnTkpm9mZnNldACpcmFuZG9taXplEKt2YXJpYWJpbGl0eRKlcmlnaHQipWRlbGF5A4mob3ZlcnJpZGXDp35kZXN5bmODpGxlZnQ3pXJpZ2h0PKxmcmVlc3RhbmRpbmejT2ZmqX5tb2RpZmllcoKkd2F5cwOmb2Zmc2V0AKlkZWZlbnNpdmXCqG1vZGlmaWVyqERpc2FibGVkpmRlc3luY8OqfmRlZmVuc2l2ZYKlcGl0Y2ioRGlzYWJsZWSjeWF3qERpc2FibGVko3lhd6kxODDCsCBML1Kkfnlhd4akbGVmdNDXpm9mZnNldACpcmFuZG9taXplFat2YXJpYWJpbGl0eRKlcmlnaHQppWRlbGF5BYmob3ZlcnJpZGXDp35kZXN5bmODpGxlZnQ8pXJpZ2h0PKxmcmVlc3RhbmRpbmejT2ZmqX5tb2RpZmllcoKkd2F5cwOmb2Zmc2V0AKlkZWZlbnNpdmXCqG1vZGlmaWVyqERpc2FibGVkpmRlc3luY8OqfmRlZmVuc2l2ZYKlcGl0Y2ioRGlzYWJsZWSjeWF3qERpc2FibGVko3lhd6kxODDCsCBML1Kkfnlhd4akbGVmdOumb2Zmc2V0zLSpcmFuZG9taXplEqt2YXJpYWJpbGl0eROlcmlnaHQppWRlbGF5BImob3ZlcnJpZGXDp35kZXN5bmODpGxlZnQ8pXJpZ2h0PKxmcmVlc3RhbmRpbmejT2ZmqX5tb2RpZmllcoKkd2F5cwOmb2Zmc2V0AKlkZWZlbnNpdmXCqG1vZGlmaWVyqERpc2FibGVkpmRlc3luY8OqfmRlZmVuc2l2ZYKlcGl0Y2ioRGlzYWJsZWSjeWF3qERpc2FibGVko3lhd6kxODDCsCBML1Kkfnlhd4akbGVmdOumb2Zmc2V0AKlyYW5kb21pemUQq3ZhcmlhYmlsaXR5FaVyaWdodCmlZGVsYXkDiahvdmVycmlkZcOnfmRlc3luY4OkbGVmdDylcmlnaHQ8rGZyZWVzdGFuZGluZ6NPZmapfm1vZGlmaWVygqR3YXlzA6ZvZmZzZXQAqWRlZmVuc2l2ZcKobW9kaWZpZXKoRGlzYWJsZWSmZGVzeW5jw6p+ZGVmZW5zaXZlgqVwaXRjaKhEaXNhYmxlZKN5YXeoRGlzYWJsZWSjeWF3qTE4MMKwIEwvUqR+eWF3hqRsZWZ05KZvZmZzZXQAqXJhbmRvbWl6ZRCrdmFyaWFiaWxpdHkSpXJpZ2h0IqVkZWxheQOJqG92ZXJyaWRlw6d+ZGVzeW5jg6RsZWZ0PKVyaWdodDysZnJlZXN0YW5kaW5no09mZql+bW9kaWZpZXKCpHdheXMDpm9mZnNldACpZGVmZW5zaXZlwqhtb2RpZmllcqhEaXNhYmxlZKZkZXN5bmPDqn5kZWZlbnNpdmWCpXBpdGNoqERpc2FibGVko3lhd6hEaXNhYmxlZKN5YXepMTgwwrAgTC9SpH55YXeGpGxlZnTkpm9mZnNldACpcmFuZG9taXplFat2YXJpYWJpbGl0eTWlcmlnaHQspWRlbGF5BqVvdGhlcoSpZGlzYWJsZXJzgqhub19lbmVtecKmd2FybXVwwqp+ZGVmZW5zaXZlgbpjb21wYXRpYmxlX3dpdGhfaGlkZV9zaG90c8OpZGVmZW5zaXZlr0ZvcmNlIERlZmVuc2l2ZapzdGF0aWNfeWF3kqpNYW51YWwgWWF3oX6oc2V0dGluZ3OIpHJhZ2WHpGxvZ3PDpX5sb2dzgqdkaXNwbGF5lKZTY3JlZW6mRXZlbnRzp0NvbnNvbGWhfqNjbHKTo0hpdKkjOUFBREU1RkahfqpoaWRkZW5fdGFwwq9+ZG9ybWFudF9haW1ib3SEqmF1dG9fc2NvcGXDqGFjY3VyYWN5S6ZkYW1hZ2UBqGhpdGJveGVzlKRIZWFkpUNoZXN0p1N0b21hY2ihfqx+cGVla19hc3Npc3SBqWJlaGF2aW9yc5WqUXVpY2sgUGVla6lFZGdlIFN0b3CyRXh0ZW5kZWQgQmFja3RyYWNrrEZyZWVzdGFuZGluZ6F+q3BlZWtfYXNzaXN0wq5kb3JtYW50X2FpbWJvdMKoZmVhdHVyZXOGsX5ncmVuYWRlX2ZlYXR1cmVzhal0aHJvd19maXjDqnN1cGVyX3Rvc3PDp21vbG90b3bCpmRhbWFnZQGsYXV0b19yZWxlYXNlwqt+Z2FtZV9mb2N1c4KlZmxhc2jDpWZvY3VzwqtmYXN0X2xhZGRlcsOqZ2FtZV9mb2N1c8OwZ3JlbmFkZV9mZWF0dXJlc8Oubm9fZmFsbF9kYW1hZ2XCpW90aGVyhKlmYWtlX2R1Y2uTrFVubG9jayBzcGVlZKtGcmVlemUgdGltZaF+qWVkZ2Vfc3RvcMKudW5sb2NrX2xhdGVuY3nDrWFpcl9jb2xsaXNpb27CqmluZGljYXRvcnOFsHNjcmVlbl9pbmRpY2F0b3LDsGRhbWFnZV9pbmRpY2F0b3LDrW1hbnVhbF9hcnJvd3PDsX5kYW1hZ2VfaW5kaWNhdG9ygqVzbWFsbMKoYW5pbWF0ZWTDrn5tYW51YWxfYXJyb3dzgaVzdHlsZaZNb2Rlcm6nd2lkZ2V0c4WwdmVsb2NpdHlfd2FybmluZ8Kpd2F0ZXJtYXJrw6hrZXliaW5kc8Oqc3BlY3RhdG9yc8KqfndhdGVybWFya4KmZmllbGRzkaF+qHVzZXJuYW1loKdpbl9nYW1liLBza2VldF9pbmRpY2F0b3Jzw6l2aWV3bW9kZWzDqn52aWV3bW9kZWyEoXj2o2Zvds0CbKF54qF64q1+YXNwZWN0X3JhdGlvgahldmFsdWF0ZXutfmN1c3RvbV9zY29wZYSmb2Zmc2V0CqZsZW5ndGhkqGludmVydGVywqkqaW52ZXJ0ZXKpIzk3OTc5N0ZGrGFzcGVjdF9yYXRpb8OsY3VzdG9tX3Njb3Blw7F+c2tlZXRfaW5kaWNhdG9yc4Goc2VsZWN0ZWSYAQIDBAUGB6F+pWNhY2hlgqhwb3NfeF93bQCoYWxpZ25fd20CpXN0eWxlg6RnbG93w6ZhY2NlbnSpI0M5QzdFQTgypGJsdXLD::nexus::cfg"
}

function slot_0_48_2(arg_65_0, arg_65_1, arg_65_2)
	return {
		name = arg_65_1,
		author = arg_65_0,
		content = arg_65_2
	}
end

function slot_0_49_3(arg_66_0)
	arg_66_0 = msgpack.pack(arg_66_0)
	arg_66_0 = slot_0_4_0.encode(arg_66_0)

	return table.concat({
		slot_0_45_1,
		arg_66_0,
		slot_0_45_1
	}, "::")
end

function slot_0_50_3(arg_67_0)
	arg_67_0 = arg_67_0:match(slot_0_45_1 .. "::(.+)::" .. slot_0_45_1)

	if not arg_67_0 then
		return nil
	end

	arg_67_0 = slot_0_4_0.decode(arg_67_0)
	arg_67_0 = msgpack.unpack(arg_67_0)

	return arg_67_0
end

function slot_0_51_3(arg_68_0)
	for iter_68_0, iter_68_1 in ipairs(slot_0_47_1) do
		local var_68_0, var_68_1 = pcall(slot_0_50_3, iter_68_1)

		if var_68_0 and var_68_1 and arg_68_0 == var_68_1.name then
			return iter_68_1, -2
		end
	end

	for iter_68_2 = #slot_0_46_2, 1, -1 do
		local var_68_2 = slot_0_46_2[iter_68_2]

		if slot_0_50_3(var_68_2).name == arg_68_0 then
			return var_68_2, iter_68_2
		end
	end

	return nil, -1
end

function slot_0_44_0.save(arg_69_0)
	arg_69_0 = arg_69_0:match("^%s*(.*%S)%s*$") or ""

	if arg_69_0 == "" then
		slot_0_42_0.error("configuration name cannot be empty")

		return false
	end

	local var_69_0, var_69_1 = slot_0_51_3(arg_69_0)

	if var_69_1 == -2 then
		slot_0_42_0.error("cannot modify pinned configuration")

		return false
	end

	local var_69_2 = slot_0_48_2(common.get_username(), arg_69_0, slot_0_5_0.save())
	local var_69_3 = slot_0_49_3(var_69_2)
	local var_69_4 = -1

	if var_69_0 == nil then
		table.insert(slot_0_46_2, var_69_3)

		var_69_4 = #slot_0_46_2
	else
		slot_0_46_2[var_69_1] = var_69_3
		var_69_4 = var_69_1
	end

	slot_0_43_0.configurations = slot_0_46_2

	slot_0_42_0.info("configuration saved successfully")

	return #slot_0_47_1 + var_69_4
end

function slot_0_44_0.load(arg_70_0)
	if arg_70_0 == nil or arg_70_0 <= 0 then
		slot_0_42_0.error("invalid configuration index")

		return false
	end

	local var_70_0

	if arg_70_0 <= #slot_0_47_1 then
		var_70_0 = slot_0_47_1[arg_70_0]
	else
		var_70_0 = slot_0_46_2[arg_70_0 - #slot_0_47_1]
	end

	if var_70_0 == nil then
		slot_0_42_0.error("configuration not found")

		return false
	end

	local var_70_1, var_70_2 = pcall(slot_0_50_3, var_70_0)

	if not var_70_1 then
		slot_0_42_0.error("failed to decode configuration data")

		return false
	end

	local var_70_3 = var_70_2.content or var_70_2.settings

	if not pcall(slot_0_5_0.load, var_70_3) then
		slot_0_42_0.error("failed to load configuration data")

		return false
	end

	slot_0_42_0.info("successfully loaded " .. var_70_2.author .. "'s configuration")

	return true
end

function slot_0_44_0.export(arg_71_0)
	local var_71_0 = slot_0_48_2(common.get_username(), arg_71_0, slot_0_5_0.save())
	local var_71_1, var_71_2 = pcall(slot_0_49_3, var_71_0)

	if not var_71_1 then
		slot_0_42_0.error("failed to encode configuration data: " .. var_71_2)

		return
	end

	slot_0_2_0.set(var_71_2)
	slot_0_42_0.info("successfully copied configuration to clipboard")
end

function slot_0_44_0.import(arg_72_0)
	local var_72_0, var_72_1 = pcall(slot_0_50_3, arg_72_0)

	if not var_72_0 then
		slot_0_42_0.error("failed to decode configuration data")

		return
	end

	local var_72_2 = var_72_1.content or var_72_1.settings

	if not pcall(slot_0_5_0.load, var_72_2) then
		slot_0_42_0.error("failed to load configuration data")

		return
	end

	slot_0_42_0.info("successfully imported " .. var_72_1.author .. "'s configuration")
end

function slot_0_44_0.delete(arg_73_0)
	if arg_73_0 == nil or arg_73_0 <= #slot_0_47_1 then
		slot_0_42_0.error("cannot delete pinned configuration")

		return false
	end

	local var_73_0 = arg_73_0 - #slot_0_47_1

	if not slot_0_46_2[var_73_0] then
		slot_0_42_0.error("configuration not found")

		return false
	end

	table.remove(slot_0_46_2, var_73_0)

	slot_0_43_0.configurations = slot_0_46_2

	slot_0_42_0.info("successfully deleted configuration")

	return true
end

function slot_0_44_0.get_list()
	local var_74_0 = {}

	for iter_74_0, iter_74_1 in ipairs(slot_0_47_1) do
		local var_74_1, var_74_2 = pcall(slot_0_50_3, iter_74_1)

		if var_74_1 and var_74_2 then
			table.insert(var_74_0, var_74_2.name .. " \a{Disabled Text}(pinned)")
		end
	end

	for iter_74_2 = 1, #slot_0_46_2 do
		local var_74_3 = slot_0_50_3(slot_0_46_2[iter_74_2])

		table.insert(var_74_0, var_74_3.name)
	end

	return var_74_0
end

function slot_0_44_0.get(arg_75_0)
	if arg_75_0 == nil or arg_75_0 <= 0 then
		return nil
	end

	local var_75_0

	if arg_75_0 <= #slot_0_47_1 then
		var_75_0 = slot_0_47_1[arg_75_0]
	else
		var_75_0 = slot_0_46_2[arg_75_0 - #slot_0_47_1]
	end

	if var_75_0 == nil then
		return nil
	end

	local var_75_1, var_75_2 = pcall(slot_0_50_3, var_75_0)

	if not var_75_1 then
		return nil
	end

	return var_75_2
end

function slot_0_44_0.update_list()
	slot_0_46_2 = slot_0_43_0.configurations or {}
end

slot_0_44_0.update_list()

slot_0_45_0 = false
slot_0_46_1 = 0

slot_0_1_0.createmove(function()
	local var_77_0 = entity.get_local_player()

	if not var_77_0 then
		return
	end

	local var_77_1 = utils.net_channel()
	local var_77_2 = var_77_0:get_simulation_time()

	if not var_77_2 or not var_77_1 then
		return
	end

	local var_77_3 = to_ticks(var_77_2.current - var_77_2.old)

	if var_77_3 < 0 then
		slot_0_46_1 = globals.tickcount + math.abs(var_77_3) - to_ticks(var_77_1.latency[0])
	end

	slot_0_45_0 = slot_0_46_1 > globals.tickcount
end)

slot_0_46_0 = slot_0_0_0()
slot_0_47_0 = {}
slot_0_48_1 = " "

function slot_0_49_2(arg_78_0)
	return string.rep(slot_0_48_1, arg_78_0)
end

function slot_0_50_2(arg_79_0, arg_79_1)
	local var_79_0 = slot_0_49_2(arg_79_1)

	return var_79_0 .. arg_79_0 .. var_79_0
end

slot_0_51_2 = false
slot_0_52_2 = false
slot_0_53_2 = 3

function slot_0_54_2(arg_80_0, arg_80_1, arg_80_2, arg_80_3)
	if slot_0_51_2 then
		arg_80_1 = " \a{Small Text}|\aDEFAULT  " .. arg_80_1
		slot_0_53_2 = 0
	end

	local var_80_0 = string.format("\f<%s>\r", arg_80_0)

	if not arg_80_3 then
		var_80_0 = "\v" .. var_80_0
	end

	if slot_0_52_2 then
		arg_80_1 = arg_80_1:lower()
	end

	return slot_0_5_0.string(var_80_0 .. slot_0_49_2(arg_80_2 + slot_0_53_2 or slot_0_53_2) .. arg_80_1)
end

function slot_0_55_2(arg_81_0, arg_81_1)
	local var_81_0 = arg_81_0:list("")

	local function var_81_1()
		local var_82_0 = var_81_0.value
		local var_82_1 = {}

		for iter_82_0, iter_82_1 in ipairs(arg_81_1) do
			local var_82_2 = var_82_0 == iter_82_0 and "\v" or "\a{Small Text}"

			var_82_1[iter_82_0] = slot_0_5_0.string(var_82_2 .. iter_82_1)
		end

		var_81_0:update(var_82_1)

		if ui.get_alpha() > 0 then
			slot_0_31_0.click()
		end
	end

	local function var_81_2()
		var_81_1()
	end

	var_81_0:set_callback(var_81_2, true)

	return var_81_0
end

slot_0_1_0.render(function()
	if ui.get_alpha() == 0 then
		return
	end

	local var_84_0 = ui.get_style()
	local var_84_1 = slot_0_24_0("nexus  ", globals.realtime, var_84_0["Link Active"], var_84_0["Text Preview"])

	slot_0_5_0.sidebar(var_84_1, slot_0_26_0.icon)
end)

slot_0_56_2 = {
	PROFILE = {
		ICON = "\f<house>",
		TABS = {
			slot_0_54_2("angle-right", "About", 3, true),
			slot_0_54_2("angle-right", "Configs", 3, true)
		},
		SECTIONS = {
			{
				"tabs",
				"##PROFILE"
			},
			{
				"notation",
				"##NOTATION",
				1
			},
			{
				"dashboard",
				"##DASHBOARD"
			},
			{
				"statistics",
				"STATISTICS",
				2
			},
			{
				"statistics_2",
				"##STATISTICS_2",
				2
			},
			{
				"configurations",
				"##CONFIGURATIONS"
			}
		}
	},
	ANTI_AIM = {
		ICON = "\f<shield-cat>",
		TABS = {
			slot_0_54_2("microchip", "General", 3, true),
			slot_0_54_2("trowel", "Builder", 3, true)
		},
		SECTIONS = {
			{
				"tabs",
				"##ANTI_AIM"
			},
			{
				"state_selector",
				"##STATE_SELECTOR",
				1
			},
			{
				"general",
				"##GENERAL"
			},
			{
				"other",
				"##OTHER"
			},
			{
				"yaw",
				"YAW",
				2
			},
			{
				"desync",
				"DESYNC",
				2
			},
			{
				"defensive",
				"DEFENSIVE",
				2
			}
		}
	},
	SETTINGS = {
		ICON = "\f<square-sliders>",
		TABS = {
			slot_0_54_2("bars-staggered", "Features", 4, true),
			slot_0_54_2("eye", "Visuals", 3, true),
			slot_0_54_2("symbols", "Other", 4, true)
		},
		SECTIONS = {
			{
				"tabs",
				"##SETTINGS"
			},
			{
				"features",
				"##FEATURES"
			},
			{
				"ragebot",
				"##RAGEBOT",
				2
			},
			{
				"in_game",
				"##IN_GAME",
				1
			},
			{
				"style",
				"##STYLE",
				2
			},
			{
				"indicators",
				"##INDICATORS",
				2
			},
			{
				"widgets",
				"##WIDGETS",
				2
			},
			{
				"cache",
				"##CACHE"
			},
			{
				"other",
				"##OTHER"
			},
			{
				"shared",
				"##SHARED",
				2
			}
		}
	}
}
slot_0_57_2 = {}
slot_0_58_3 = slot_0_56_2.PROFILE
slot_0_59_5 = slot_0_58_3.TABS
slot_0_60_4 = slot_0_58_3.SECTIONS
slot_0_61_5 = slot_0_58_3.ICON
slot_0_62_6 = slot_0_5_0.create(slot_0_61_5, slot_0_60_4)
slot_0_63_6 = slot_0_55_2(slot_0_62_6.tabs, slot_0_59_5)
slot_0_64_10 = slot_0_62_6.notation
slot_0_65_13 = slot_0_62_6.dashboard
slot_0_66_16 = slot_0_62_6.statistics
slot_0_67_16 = slot_0_62_6.statistics_2

slot_0_64_10:label(slot_0_54_2("wand-magic-sparkles", "We wish you good luck, thank you for using our script!", 5))
slot_0_65_13:label(slot_0_54_2("circle-user", "User", 6))
slot_0_65_13:button("\v" .. common.get_username(), nil, true)
slot_0_65_13:label(slot_0_54_2("brackets-curly", "Branch", 5))
slot_0_65_13:button("\v" .. slot_0_26_0.branch, nil, true)
slot_0_66_16:label(slot_0_54_2("stopwatch", "Session time", 7))

slot_0_68_16 = slot_0_66_16:button("\v0 Minutes", nil, true)

slot_0_66_16:label(slot_0_54_2("clock", "Time spent", 6))

slot_0_69_15 = slot_0_66_16:button("\v0 Minutes", nil, true)

slot_0_67_16:label(slot_0_54_2("skull", "Kills", 6))

slot_0_70_11 = slot_0_67_16:button("\v0", nil, true)

slot_0_67_16:label(slot_0_54_2("triangle-exclamation", "Misses", 6))

slot_0_71_11 = slot_0_67_16:button("\v0", nil, true)

function slot_0_72_12(arg_85_0)
	local var_85_0 = math.floor(arg_85_0 / 3600)
	local var_85_1 = math.floor(arg_85_0 / 60)

	return var_85_0, var_85_1
end

slot_0_73_12 = 0
slot_0_74_10 = false
slot_0_75_10 = false

slot_0_68_16:set_callback(function()
	slot_0_74_10 = not slot_0_74_10

	if slot_0_73_12 < 3600 then
		slot_0_74_10 = false
	end
end, true)
slot_0_69_15:set_callback(function()
	slot_0_75_10 = not slot_0_75_10

	if slot_0_43_0.time_spent < 3600 then
		slot_0_75_10 = false
	end
end, true)
slot_0_1_0.render(function()
	local var_88_0 = globals.frametime

	slot_0_73_12 = slot_0_73_12 + var_88_0
	slot_0_43_0.time_spent = slot_0_43_0.time_spent + var_88_0

	if ui.get_alpha() > 0 then
		local var_88_1, var_88_2 = slot_0_72_12(slot_0_73_12)
		local var_88_3 = slot_0_74_10 and var_88_1 or var_88_2
		local var_88_4 = slot_0_74_10 and "Hours" or "Minutes"

		slot_0_68_16:name("\v" .. var_88_3 .. " " .. var_88_4)

		local var_88_5, var_88_6 = slot_0_72_12(slot_0_43_0.time_spent)
		local var_88_7 = slot_0_75_10 and var_88_5 or var_88_6
		local var_88_8 = slot_0_75_10 and "Hours" or "Minutes"

		slot_0_69_15:name("\v" .. var_88_7 .. " " .. var_88_8)
	end

	local var_88_9 = "\v" .. slot_0_43_0.kills
	local var_88_10 = "\v" .. slot_0_43_0.misses

	if var_88_9 ~= slot_0_70_11 or var_88_10 ~= slot_0_71_11 then
		slot_0_70_11:name(var_88_9)
		slot_0_71_11:name(var_88_10)
	end
end)
slot_0_65_13:depend({
	slot_0_63_6,
	1
})
slot_0_66_16:depend({
	slot_0_63_6,
	1
})
slot_0_67_16:depend({
	slot_0_63_6,
	1
})
slot_0_64_10:depend({
	slot_0_63_6,
	1
})

slot_0_64_9 = slot_0_62_6.configurations
slot_0_65_12 = slot_0_64_9:list("##PRESET_LIST", slot_0_44_0.get_list())
slot_0_66_15 = slot_0_64_9:input("##PRESET_NAME", "Default")

slot_0_64_9:button(slot_0_50_2(slot_0_54_2("download", "Load", 3), 3), function()
	slot_0_44_0.load(slot_0_65_12:get())

	for iter_89_0, iter_89_1 in ipairs(slot_0_38_0.list) do
		iter_89_1:update(true)
	end

	slot_0_44_0.update_list()
	slot_0_65_12:update(slot_0_44_0.get_list())
end, true):tooltip("Click to load the configuration you selected from the list above.\n\n\vNote:\r This will overwrite your current settings with the selected configuration.")
slot_0_64_9:button(slot_0_50_2(slot_0_54_2("floppy-disk", "Save", 3), 3), function()
	local var_90_0 = slot_0_44_0.save(slot_0_66_15:get())

	slot_0_44_0.update_list()
	slot_0_65_12:update(slot_0_44_0.get_list())

	if var_90_0 and var_90_0 > 0 then
		slot_0_65_12:set(var_90_0)
	end
end, true):tooltip("Click to save your current settings as a new configuration with the name entered above or overwrite the selected configuration.")
slot_0_64_9:button(slot_0_50_2("\aFF3232FF\f<trash>", 3), function()
	slot_0_44_0.delete(slot_0_65_12:get())
	slot_0_44_0.update_list()
	slot_0_65_12:update(slot_0_44_0.get_list())
end, true):tooltip("Click to permanently delete the selected configuration.\n\n\vNote:\r This action cannot be undone.")
slot_0_64_9:button(slot_0_50_2("\f<copy>", 3), function()
	slot_0_44_0.export(slot_0_66_15:get())
end, true):tooltip("Click to copy your current settings to clipboard.\n\n\vNote:\r This only copies your active settings, not the settings from the selected configuration.")
slot_0_64_9:button(slot_0_50_2("\f<paste>", 3), function()
	slot_0_44_0.import(slot_0_2_0.get())
end, true):tooltip("Click to apply settings from your clipboard.\n\n\vNote:\r This will update your active settings but will not modify the selected configuration.")
slot_0_65_12:set_callback(function(arg_94_0)
	local var_94_0 = arg_94_0:get()

	if var_94_0 == nil or var_94_0 <= 0 then
		return
	end

	local var_94_1 = slot_0_44_0.get(var_94_0)

	if var_94_1 == nil then
		return
	end

	slot_0_66_15:set(var_94_1.name)
end)
slot_0_64_9:depend({
	slot_0_63_6,
	2
})

slot_0_58_2 = {}
slot_0_59_4 = slot_0_56_2.ANTI_AIM
slot_0_60_3 = slot_0_59_4.TABS
slot_0_61_4 = slot_0_59_4.SECTIONS
slot_0_62_5 = slot_0_59_4.ICON
slot_0_63_5 = slot_0_5_0.create(slot_0_62_5, slot_0_61_4)
slot_0_64_8 = slot_0_55_2(slot_0_63_5.tabs, slot_0_60_3)
slot_0_58_2.general = {}
slot_0_65_11 = slot_0_58_2.general
slot_0_66_14 = slot_0_63_5.general
slot_0_65_11.manual_yaw = slot_0_66_14:combo(slot_0_54_2("arrows-repeat", "Manual Yaw", 3), {
	"Disabled",
	"Forward",
	"Backward",
	"Left",
	"Right"
}, function(arg_95_0)
	return {
		yaw_base = arg_95_0:combo(slot_0_54_2("crosshairs", "Yaw Base", 4), {
			"Local View",
			"At Target"
		})
	}
end)
slot_0_65_11.freestanding = slot_0_66_14:switch(slot_0_54_2("arrows-spin", "Freestanding", 3))
slot_0_65_11.edge_yaw = slot_0_66_14:switch(slot_0_54_2("triangle", "Edge Yaw", 3), false, function(arg_96_0)
	return {
		while_fd = arg_96_0:switch(slot_0_54_2("duck", "While Fake Duck", 3), false, "Automatically enables \"Edge Yaw\" on Fake Duck.")
	}
end)
slot_0_65_11.avoid_backstab = slot_0_66_14:switch(slot_0_54_2("arrows-spin", "Avoid Backstab", 3))
slot_0_65_11.safe_head = slot_0_66_14:switch(slot_0_54_2("helmet-safety", "Safe Head", 2), false, function(arg_97_0)
	return {
		weapon = arg_97_0:listable(slot_0_54_2("gun", "Weapon", 3), {
			"Knife",
			"Zeus"
		}),
		height_difference = arg_97_0:slider(slot_0_54_2("line-height", "Height Difference", 3), 0, 35, 20, 1, function(arg_98_0)
			if arg_98_0 == 0 then
				return "N/A"
			end

			if arg_98_0 == 35 then
				return "Max"
			end

			return arg_98_0 .. "u"
		end)
	}, true
end)
slot_0_65_11.jitter_move = slot_0_66_14:switch(slot_0_54_2("waveform-lines", "Jitter Move", 1), true)

slot_0_66_14:depend({
	slot_0_64_8,
	1
})

slot_0_58_2.other = {}
slot_0_65_10 = slot_0_58_2.other
slot_0_66_13 = slot_0_63_5.other
slot_0_65_10.defensive = slot_0_66_13:label(slot_0_54_2("sparkles", "Defensive", 3), function(arg_99_0)
	return {
		compatible_with_hide_shots = arg_99_0:switch(slot_0_54_2("eye-slash", "Compatible with Hide Shots", 3), false, "\v\f<circle-info>  \rRemember it overwrites Hide Shots mode"),
		conditions = arg_99_0:listable("##CONDITIONS", {
			"Standing",
			"Running",
			"Slowwalking",
			"Ducking",
			"Sneaking",
			"In Air",
			"In Air & Crouching"
		})
	}
end)
slot_0_65_10.disablers = slot_0_66_13:label(slot_0_54_2("lock", "Disablers", 4), function(arg_100_0)
	return {
		warmup = arg_100_0:switch(slot_0_54_2("wind", "Warmup", 5)),
		no_enemy = arg_100_0:switch(slot_0_54_2("users-slash", "No Enemy", 3))
	}
end)
slot_0_65_10.static_yaw = slot_0_66_13:selectable(slot_0_54_2("chart-radar", "Static Yaw", 3), {
	"Freestanding",
	"Manual Yaw"
})
slot_0_65_10.animation_breaker = slot_0_66_13:switch(slot_0_54_2("person-falling", "Animation Breaker", 4), false, function(arg_101_0)
	return {
		interpolation = arg_101_0:slider(slot_0_54_2("wave-square", "Interpolation", 5), 0, 14, 0, 1, function(arg_102_0)
			if arg_102_0 == 0 then
				return "Default"
			elseif arg_102_0 == 9 then
				return "Medium"
			elseif arg_102_0 == 14 then
				return "High"
			else
				return arg_102_0 .. "t"
			end
		end),
		leaning = arg_101_0:slider(slot_0_54_2("scale-balanced", "Leaning", 5), 0, 100, 0, 50, function(arg_103_0)
			if arg_103_0 == 0 then
				return "Disabled"
			elseif arg_103_0 == 100 then
				return "Maximum"
			else
				return arg_103_0 .. "%"
			end
		end),
		ground = arg_101_0:combo(slot_0_54_2("mountain", "Ground", 6), {
			"None",
			"Follow direction",
			"Jitter legs",
			"Moon walk",
			"Kangaroo"
		}),
		air = arg_101_0:combo(slot_0_54_2("wind", "Air", 6), {
			"None",
			"Falling",
			"Walking",
			"Kangaroo"
		})
	}
end)
slot_0_65_10.fakelag_disablers = slot_0_66_13:selectable(slot_0_54_2("align-slash", "FL Disablers", 1), {
	"Double Tap",
	"Hide Shots",
	"Standing"
})

slot_0_66_13:depend({
	slot_0_64_8,
	1
})

slot_0_58_2.builder = {}
slot_0_65_9 = slot_0_58_2.builder
slot_0_66_12 = slot_0_55_2(slot_0_63_5.state_selector, {
	slot_0_54_2("user", "Default", 7, true),
	slot_0_54_2("person", "Standing", 8, true),
	slot_0_54_2("person-running", "Running", 6, true),
	slot_0_54_2("person-walking", "Slowwalking", 8, true),
	slot_0_54_2("person-seat", "Ducking", 7, true),
	slot_0_54_2("wheelchair-move", "Sneaking", 6, true),
	slot_0_54_2("person-ski-jumping", "In Air", 5, true),
	slot_0_54_2("person-sledding", "In Air & Crouching", 5, true)
})

function slot_0_67_15()
	local var_104_0 = slot_0_66_12:get()

	for iter_104_0, iter_104_1 in pairs(slot_0_65_9) do
		iter_104_1.override:visibility(var_104_0 == iter_104_0)
		iter_104_1.yaw:visibility(var_104_0 == iter_104_0)
		iter_104_1.modifier:visibility(var_104_0 == iter_104_0)
		iter_104_1.desync:visibility(var_104_0 == iter_104_0)
		iter_104_1.defensive:visibility(var_104_0 == iter_104_0)
	end
end

for iter_0_0, iter_0_1 in ipairs(slot_0_27_0) do
	slot_0_73_11 = {
		override = slot_0_63_5.state_selector:switch(slot_0_54_2(iter_0_1 == "Default" and "toggle-on" or "toggle-off", string.format("Override \v%s", iter_0_1), 5), iter_0_1 == "Default"),
		yaw = slot_0_63_5.yaw:combo(slot_0_54_2("angle", "Yaw", 6), {
			"Default",
			"180° L/R"
		}, function(arg_105_0, arg_105_1)
			local var_105_0 = {
				offset = arg_105_0:slider(slot_0_54_2("angle", "Offset", 4), -180, 180, 0, 1, "°"),
				left = arg_105_0:slider(slot_0_54_2("left", "Left", 6), -180, 180, 0, 1, "°"),
				right = arg_105_0:slider(slot_0_54_2("right", "Right", 6), -180, 180, 0, 1, "°"),
				randomize = arg_105_0:slider(slot_0_54_2("shuffle", "Randomize", 5), 0, 100, 0, 1, function(arg_106_0)
					return arg_106_0 == 0 and "Off" or arg_106_0 .. "%"
				end),
				delay = arg_105_0:slider(slot_0_54_2("clock", "Delay", 5), 1, 20, 1, 1, function(arg_107_0)
					return arg_107_0 == 1 and "Off" or arg_107_0 .. "t"
				end),
				variability = arg_105_0:slider(slot_0_54_2("dice", "Variability", 3), 0, 100, 0, 1, function(arg_108_0)
					return arg_108_0 == 0 and "Off" or arg_108_0 .. "%"
				end)
			}

			var_105_0.offset:depend({
				arg_105_1,
				"Default"
			})
			var_105_0.left:depend({
				arg_105_1,
				"180° L/R"
			})
			var_105_0.right:depend({
				arg_105_1,
				"180° L/R"
			})
			var_105_0.delay:depend({
				arg_105_1,
				"180° L/R"
			})
			var_105_0.variability:depend({
				arg_105_1,
				"180° L/R"
			})

			return var_105_0
		end),
		modifier = slot_0_63_5.yaw:combo(slot_0_54_2("sparkles", "Modifier", 5), {
			"Disabled",
			"Center",
			"Offset",
			"Random",
			"Spin",
			"X-Way"
		}, function(arg_109_0, arg_109_1)
			local var_109_0 = {
				offset = slot_0_63_5.yaw:slider("  \a4d4d4dff" .. slot_0_54_2("angles-right", "\rOffset", 3, true), -180, 180, 0, 1, "°"),
				ways = slot_0_63_5.yaw:slider("  \a4d4d4dff" .. slot_0_54_2("angles-right", "\rWays", 3, true), 3, 9, 3, 1, "w")
			}

			var_109_0.offset:depend({
				slot_0_66_12,
				iter_0_0
			}, {
				arg_109_1,
				"Disabled",
				true
			})
			var_109_0.ways:depend({
				slot_0_66_12,
				iter_0_0
			}, {
				arg_109_1,
				"X-Way"
			})

			return var_109_0
		end),
		desync = slot_0_63_5.desync:switch(slot_0_54_2("waveform-lines", "Body Yaw", 3), false, function(arg_110_0, arg_110_1)
			local var_110_0 = {
				left = slot_0_63_5.desync:slider("  \a4d4d4dff" .. slot_0_54_2("angles-right", "\rLeft", 3, true), 0, 60, 0, 1, "°"),
				right = slot_0_63_5.desync:slider("  \a4d4d4dff" .. slot_0_54_2("angles-right", "\rRight", 3, true), 0, 60, 0, 1, "°"),
				freestanding = slot_0_63_5.desync:combo(slot_0_54_2("split", "Freestanding", 5), {
					"Off",
					"Peek Fake",
					"Peek Real"
				}),
				options = slot_0_63_5.desync:label(slot_0_54_2("spa", "Options", 4), function(arg_111_0)
					return {
						avoid_overlap = arg_111_0:switch(slot_0_54_2("diagram-venn", "Avoid Overlap", 3)),
						jitter = arg_111_0:switch(slot_0_54_2("tornado", "Jitter", 6)),
						randomize_jitter = arg_111_0:switch(slot_0_54_2("shuffle", "Randomize Jitter", 5)),
						anti_bruteforce = arg_111_0:switch(slot_0_54_2("shield-virus", "Anti Bruteforce", 5))
					}
				end)
			}

			var_110_0.left:depend({
				slot_0_66_12,
				iter_0_0
			}, {
				arg_110_1,
				true
			})
			var_110_0.right:depend({
				slot_0_66_12,
				iter_0_0
			}, {
				arg_110_1,
				true
			})
			var_110_0.freestanding:depend({
				slot_0_66_12,
				iter_0_0
			})
			var_110_0.options:depend({
				slot_0_66_12,
				iter_0_0
			})

			return var_110_0
		end),
		defensive = slot_0_63_5.defensive:switch(slot_0_54_2("bug", "Enable", 5), false, function()
			local var_112_0 = {
				pitch = slot_0_63_5.defensive:combo(slot_0_54_2("hat-witch", "Pitch", 4), {
					"Disabled",
					"Down",
					"Up",
					"Random",
					"Jitter",
					"Custom"
				}, function(arg_113_0, arg_113_1)
					local var_113_0 = {
						first = arg_113_0:slider(slot_0_54_2("up", "First", 3), -89, 89, 0, 1, "°"),
						second = arg_113_0:slider(slot_0_54_2("down", "Second", 3), -89, 89, 0, 1, "°"),
						amount = arg_113_0:slider(slot_0_54_2("angle", "Offset", 4), -89, 89, 0, 1, "°")
					}

					var_113_0.amount:depend({
						slot_0_66_12,
						iter_0_0
					}, {
						arg_113_1,
						"Custom"
					})
					var_113_0.first:depend({
						slot_0_66_12,
						iter_0_0
					}, {
						arg_113_1,
						"Random",
						"Jitter"
					})
					var_113_0.second:depend({
						slot_0_66_12,
						iter_0_0
					}, {
						arg_113_1,
						"Random",
						"Jitter"
					})

					return var_113_0
				end),
				yaw = slot_0_63_5.defensive:combo(slot_0_54_2("scribble", "Yaw", 5), {
					"Disabled",
					"Forward",
					"Sideways",
					"Random",
					"Spin",
					"Center",
					"Custom"
				}, function(arg_114_0, arg_114_1)
					local var_114_0 = {
						speed = arg_114_0:slider(slot_0_54_2("gauge", "Speed", 3), 1, 30, 3, 1, "t"),
						amount = arg_114_0:slider(slot_0_54_2("angle", "Offset", 4), -180, 180, 0, 1, "°")
					}

					var_114_0.speed:depend({
						slot_0_66_12,
						iter_0_0
					}, {
						arg_114_1,
						"Spin"
					})
					var_114_0.amount:depend({
						slot_0_66_12,
						iter_0_0
					}, {
						arg_114_1,
						"Custom",
						"Center"
					})

					return var_114_0
				end)
			}

			var_112_0.pitch:depend({
				slot_0_66_12,
				iter_0_0
			})
			var_112_0.yaw:depend({
				slot_0_66_12,
				iter_0_0
			})

			return var_112_0
		end)
	}
	slot_0_65_9[iter_0_0] = slot_0_73_11

	slot_0_73_11.override:depend({
		slot_0_66_12,
		iter_0_0
	})
	slot_0_73_11.yaw:depend({
		slot_0_66_12,
		iter_0_0
	})
	slot_0_73_11.modifier:depend({
		slot_0_66_12,
		iter_0_0
	})
	slot_0_73_11.desync:depend({
		slot_0_66_12,
		iter_0_0
	})
	slot_0_73_11.defensive:depend({
		slot_0_66_12,
		iter_0_0
	})

	if iter_0_1 == "Default" then
		slot_0_73_11.override:disabled(true)
	end

	slot_0_73_11.override:set_callback(function(arg_115_0)
		arg_115_0:name(slot_0_54_2(arg_115_0:get() and "toggle-on" or "toggle-off", string.format("Override \v%s", iter_0_1), 5))
	end, true)
end

slot_0_66_12:set_callback(slot_0_67_15, true)

slot_0_58_2.state_selector = slot_0_66_12

slot_0_63_5.state_selector:depend({
	slot_0_64_8,
	2
})
slot_0_63_5.yaw:depend({
	slot_0_64_8,
	2
})
slot_0_63_5.desync:depend({
	slot_0_64_8,
	2
})
slot_0_63_5.defensive:depend({
	slot_0_64_8,
	2
})

slot_0_47_0.anti_aimbot = slot_0_58_2
slot_0_59_3 = {}
slot_0_60_2 = slot_0_56_2.SETTINGS
slot_0_61_3 = slot_0_60_2.TABS
slot_0_62_4 = slot_0_60_2.SECTIONS
slot_0_63_4 = slot_0_60_2.ICON
slot_0_64_7 = slot_0_5_0.create(slot_0_63_4, slot_0_62_4)
slot_0_65_8 = slot_0_55_2(slot_0_64_7.tabs, slot_0_61_3)
slot_0_66_11 = {}
slot_0_67_14 = slot_0_64_7.style
slot_0_68_15 = ui.get_style()
slot_0_66_11.accent = slot_0_67_14:color_picker(slot_0_54_2("palette", "Accent", 5), slot_0_68_15["Link Active"]:alpha_modulate(153))
slot_0_66_11.glow = slot_0_67_14:switch(slot_0_54_2("sparkles", "Glow", 5), true)
slot_0_66_11.blur = slot_0_67_14:switch(slot_0_54_2("waveform", "Blur", 3), true)

slot_0_66_11.accent:set_callback(function(arg_116_0)
	slot_0_5_0.accent = arg_116_0.value:alpha_modulate(255)
end, true)
slot_0_67_14:depend({
	slot_0_65_8,
	2
})

slot_0_67_13 = {}
slot_0_68_14 = slot_0_64_7.widgets
slot_0_67_13.watermark = slot_0_68_14:label(slot_0_54_2("circle-nodes", "Watermark", 5), function(arg_117_0)
	return {
		fields = arg_117_0:listable(slot_0_54_2("list", "Fields", 3), {
			"User",
			"Time",
			"Ping"
		}),
		username = arg_117_0:input(slot_0_54_2("user-pen", "Custom Name", 3))
	}
end)
slot_0_67_13.keybinds = slot_0_68_14:switch(slot_0_54_2("keyboard", "Keybinds", 4))
slot_0_67_13.spectators = slot_0_68_14:switch(slot_0_54_2("eye", "Spectators", 4))
slot_0_67_13.velocity_warning = slot_0_68_14:switch(slot_0_54_2("gauge-high", "Velocity Warning", 5))

slot_0_68_14:depend({
	slot_0_65_8,
	2
})

slot_0_68_13 = {}
slot_0_69_14 = slot_0_64_7.indicators
slot_0_68_13.screen_indicator = slot_0_69_14:switch(slot_0_54_2("sparkles", "Screen Indicator", 5), false, function(arg_118_0)
	return {
		glow = arg_118_0:switch(slot_0_54_2("sparkles", "Glow", 4), false)
	}
end)
slot_0_68_13.manual_arrows = slot_0_69_14:switch(slot_0_54_2("left-right", "Manual Arrows", 5), false, function(arg_119_0)
	return {
		style = arg_119_0:combo(slot_0_54_2("pen-fancy-slash", "Style", 3), {
			"Classic",
			"Modern"
		})
	}, true
end)
slot_0_68_13.damage_indicator = slot_0_69_14:switch(slot_0_54_2("burst", "Damage Indicator", 5), false, function(arg_120_0)
	return {
		animated = arg_120_0:switch(slot_0_54_2("bars-progress", "Animated", 4), true),
		small = arg_120_0:switch(slot_0_54_2("minimize", "Small", 4), false)
	}, true
end)

slot_0_69_14:depend({
	slot_0_65_8,
	2
})

slot_0_69_13 = {}
slot_0_70_10 = slot_0_64_7.in_game
slot_0_69_13.custom_scope = slot_0_70_10:switch(slot_0_54_2("crosshairs", "Custom Scope", 3), false, function(arg_121_0)
	return {
		inverter = arg_121_0:switch(slot_0_54_2("palette", "Color", 4), false, color("#9CD1FFFF"), "Inverts color"),
		offset = arg_121_0:slider(slot_0_54_2("droplet", "Offset", 6), 10, 100, 10, 1),
		length = arg_121_0:slider(slot_0_54_2("brush", "Length", 6), 10, 100, 50, 1)
	}, true
end)
slot_0_69_13.aspect_ratio = slot_0_70_10:switch(slot_0_54_2("expand", "Aspect Ratio", 4), false, function(arg_122_0)
	local var_122_0 = {
		evaluate = arg_122_0:slider("", 0, 300, 0, 0.01, function(arg_123_0)
			return ({
				[0] = "Off",
				[1.33] = "4:3",
				[1.5] = "3:2",
				[1.25] = "5:4",
				[1.6] = "16:10",
				[1.78] = "16:9"
			})[arg_123_0 / 100] or nil
		end)
	}

	var_122_0.button169 = arg_122_0:button("16:9", function()
		var_122_0.evaluate:set(177.77777777777777)
	end, true)
	var_122_0.button1610 = arg_122_0:button("16:10", function()
		var_122_0.evaluate:set(160)
	end, true)
	var_122_0.button32 = arg_122_0:button("3:2", function()
		var_122_0.evaluate:set(150)
	end, true)
	var_122_0.button43 = arg_122_0:button("4:3", function()
		var_122_0.evaluate:set(133.33333333333331)
	end, true)
	var_122_0.button54 = arg_122_0:button("5:4", function()
		var_122_0.evaluate:set(125)
	end, true)

	return var_122_0
end)
slot_0_69_13.viewmodel = slot_0_70_10:switch(slot_0_54_2("hand", "Viewmodel", 3), false, function(arg_129_0)
	local var_129_0 = {
		fov = arg_129_0:slider("Field of View", 0, 1000, cvar.viewmodel_fov:float() * 10, 0.1),
		x = arg_129_0:slider("X", -100, 100, cvar.viewmodel_offset_x:float() * 10, 0.1),
		y = arg_129_0:slider("Y", -100, 100, cvar.viewmodel_offset_y:float() * 10, 0.1),
		z = arg_129_0:slider("Z", -100, 100, cvar.viewmodel_offset_z:float() * 10, 0.1),
		opposite_knife_hand = arg_129_0:switch("Opposite Knife Hand", false)
	}

	var_129_0.reset = arg_129_0:button("Reset", function()
		var_129_0.fov:set(600)
		var_129_0.x:set(10)
		var_129_0.y:set(10)
		var_129_0.z:set(15)
	end)

	return var_129_0
end)
slot_0_69_13.skeet_indicators = slot_0_70_10:switch(slot_0_54_2("circle", "\a43ff64d9$500\r Indicators", 3), false, function(arg_131_0)
	return {
		selected = arg_131_0:listable("##SELECTED", {
			"Safe Points",
			"Double Tap",
			"Hide Shots",
			"Fake Duck",
			"Body Aim",
			"Minimum Damage",
			"Dormant Aimbot",
			"Freestanding",
			"Fake Latency",
			"Bomb Info",
			"Hit Rate"
		})
	}
end)
slot_0_69_13.keep_transparency = slot_0_70_10:switch(slot_0_54_2("face-dotted", "Keep Model Transparency", 3))

slot_0_70_10:depend({
	slot_0_65_8,
	2
})

slot_0_70_9 = {}
slot_0_71_9 = slot_0_64_7.features
slot_0_70_9.grenade_features = slot_0_71_9:switch(slot_0_54_2("bomb", "Grenade features", 5), false, function(arg_132_0)
	return {
		throw_fix = arg_132_0:switch(slot_0_54_2("explosion", "Throw fix", 3), false),
		super_toss = arg_132_0:switch(slot_0_54_2("superpowers", "Super toss", 5), false),
		auto_release = arg_132_0:switch(slot_0_54_2("hand", "Auto release", 4), false),
		damage = arg_132_0:slider(slot_0_54_2("heart-crack", "Damage", 4), 1, 99, 30, nil, "hp"),
		molotov = arg_132_0:switch(slot_0_54_2("fire-flame", "Molotov", 5), false)
	}
end)
slot_0_70_9.no_fall_damage = slot_0_71_9:switch(slot_0_54_2("person-falling", "No fall damage", 6))
slot_0_70_9.fast_ladder = slot_0_71_9:switch(slot_0_54_2("water-ladder", "Fast ladder", 4))
slot_0_70_9.game_focus = slot_0_71_9:switch(slot_0_54_2("gamepad", "Game focus", 3), false, function(arg_133_0)
	return {
		flash = arg_133_0:switch(slot_0_54_2("bolt", "Flash window", 5), true),
		focus = arg_133_0:switch(slot_0_54_2("expand", "Auto focus", 4), false)
	}
end)

slot_0_71_9:depend({
	slot_0_65_8,
	3
})

slot_0_71_8 = {}
slot_0_72_10 = slot_0_64_7.shared
slot_0_71_8.icon = slot_0_72_10:switch(slot_0_54_2("rectangle-ad", "Shared icon", 4), false, "\n\affffffff\f<atom>\r - User\n\n\aFFC78FFF\f<atom>\r - Developer")

slot_0_72_10:depend({
	slot_0_65_8,
	3
})

slot_0_72_9 = {}
slot_0_73_10 = slot_0_64_7.other
slot_0_72_9.fake_duck = slot_0_73_10:selectable(slot_0_54_2("duck", "Fake duck", 6), {
	"Unlock speed",
	"Freeze time"
})
slot_0_72_9.air_collision = slot_0_73_10:switch(slot_0_54_2("wind", "Air collision", 6))
slot_0_72_9.unlock_latency = slot_0_73_10:switch(slot_0_54_2("timer", "Unlock latency", 6))
slot_0_72_9.edge_stop = slot_0_73_10:switch(slot_0_54_2("arrow-down-up-lock", "Edge Stop", 4))

slot_0_73_10:depend({
	slot_0_65_8,
	3
})

slot_0_73_9 = {}
slot_0_74_9 = slot_0_64_7.cache
slot_0_73_9.align_wm = slot_0_74_9:value("##watermark align", 2)
slot_0_73_9.pos_x_wm = slot_0_74_9:value("##watermark x pos", 0)
slot_0_74_8 = {}
slot_0_75_9 = slot_0_64_7.ragebot
slot_0_74_8.peek_assist = slot_0_75_9:switch(slot_0_54_2("circle-dashed", "Peek Assist", 4), false, function(arg_134_0)
	return {
		behaviors = arg_134_0:selectable(slot_0_54_2("sliders-simple", "Behaviors", 3), {
			"Quick Peek",
			"Edge Stop",
			"Extended Backtrack",
			"Freestanding"
		})
	}
end)
slot_0_74_8.dormant_aimbot = slot_0_75_9:switch(slot_0_54_2("eye-low-vision", "Dormant aimbot", 2), false, function(arg_135_0)
	return {
		hitboxes = arg_135_0:selectable(slot_0_54_2("layer-group", "Hitboxes", 4), {
			"Head",
			"Chest",
			"Stomach"
		}),
		accuracy = arg_135_0:slider(slot_0_54_2("microscope", "Accuracy", 4), 35, 100, 75, nil, "%"),
		damage = arg_135_0:slider(slot_0_54_2("claw-marks", "Min. Damage", 3), 1, 126, 10, nil, function(arg_136_0)
			if arg_136_0 == 1 then
				return "Inherited"
			end

			if arg_136_0 > 100 then
				return string.format("HP+ %i", arg_136_0 - 100)
			end

			return arg_136_0
		end),
		auto_scope = arg_135_0:switch(slot_0_54_2("crosshairs-simple", "Auto scope", 4))
	}
end)
slot_0_74_8.logs = slot_0_75_9:switch(slot_0_54_2("terminal", "Logs", 3), true, function(arg_137_0)
	return {
		clr = arg_137_0:color_picker(slot_0_54_2("palette", "Accent", 3), {
			Miss = {
				slot_0_5_0.colors.miss
			},
			Hit = {
				slot_0_5_0.colors.hit
			}
		}),
		display = arg_137_0:selectable(slot_0_54_2("desktop", "Display", 2), {
			"Screen",
			"Events",
			"Console"
		})
	}, true
end)
slot_0_74_8.decrase_hold_aim_ticks = slot_0_75_9:switch(slot_0_54_2("crosshairs", "Decrase hold aim ticks", 4))

slot_0_74_8.decrase_hold_aim_ticks:set_callback(function(arg_138_0)
	cvar.sv_maxusrcmdprocessticks_holdaim:int(arg_138_0:get() and 0 or 1)
end)
slot_0_1_0.shutdown:set(function()
	cvar.sv_maxusrcmdprocessticks_holdaim:int(1)
end)
slot_0_75_9:depend({
	slot_0_65_8,
	1
})

slot_0_59_3.widgets = slot_0_67_13
slot_0_59_3.in_game = slot_0_69_13
slot_0_59_3.indicators = slot_0_68_13
slot_0_59_3.features = slot_0_70_9
slot_0_59_3.shared = slot_0_71_8
slot_0_59_3.other = slot_0_72_9
slot_0_59_3.cache = slot_0_73_9
slot_0_59_3.style = slot_0_66_11
slot_0_59_3.rage = slot_0_74_8
slot_0_47_0.settings = slot_0_59_3

utils.execute_after(0.1, slot_0_5_0.setup, slot_0_47_0)

slot_0_48_0 = {}
slot_0_49_1 = {
	sended = 0,
	yaw = {
		[0] = "Disabled",
		switch_side = false,
		avoid_backstab = false,
		next_switch = 0,
		offset = 0,
		base = "Local View",
		hidden = false
	},
	yaw_modifier = {
		[0] = "Disabled",
		offset = 0
	},
	body_yaw = {
		[0] = false,
		inverter = false,
		freestanding = "Off",
		right_limit = 0,
		left_limit = 0,
		options = {}
	}
}
slot_0_50_1 = slot_0_47_0.anti_aimbot
slot_0_51_1 = false
slot_0_52_1 = false
slot_0_53_1 = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk")
slot_0_54_1 = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck")

function slot_0_55_1(arg_140_0, arg_140_1)
	local var_140_0 = slot_0_49_1.sended % arg_140_0
	local var_140_1 = math.floor(arg_140_0 * 0.5)

	if var_140_1 <= var_140_0 then
		if arg_140_0 % 2 == 0 then
			var_140_0 = var_140_0 + 1
		end

		if var_140_0 == var_140_1 then
			return 0
		end
	end

	local var_140_2 = (var_140_0 - var_140_1) / var_140_1

	return (math.floor(arg_140_1 * var_140_2))
end

function slot_0_48_0.get_statement()
	local var_141_0 = entity.get_local_player()

	if not var_141_0 or not var_141_0:is_alive() then
		return 1
	end

	local var_141_1 = var_141_0.m_fFlags
	local var_141_2 = var_141_0.m_vecVelocity:length()
	local var_141_3 = bit.band(var_141_1, 2) == 2
	local var_141_4 = slot_0_51_1 or bit.band(var_141_1, 1) ~= 1
	local var_141_5 = slot_0_52_1 or slot_0_53_1:get()

	if var_141_4 then
		return var_141_3 and 8 or 7
	elseif var_141_3 or slot_0_54_1:get() then
		return var_141_2 > 2 and 6 or 5
	end

	if var_141_2 > 2 then
		return var_141_5 and 4 or 3
	end

	return 2
end

slot_0_56_1 = {
	enabled = slot_0_5_0.find("Aimbot", "Anti Aim", "Angles", "Enabled"),
	yaw = slot_0_5_0.find("Aimbot", "Anti Aim", "Angles", "Yaw", {
		base = "Base",
		avoid_backstab = "Avoid Backstab",
		hidden = "Hidden",
		offset = "Offset"
	}),
	yaw_modifier = slot_0_5_0.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", {
		offset = "Offset"
	}),
	body_yaw = slot_0_5_0.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", {
		options = "Options",
		inverter = "Inverter",
		freestanding = "Freestanding",
		right_limit = "Right Limit",
		left_limit = "Left Limit"
	}),
	freestanding = slot_0_5_0.find("Aimbot", "Anti Aim", "Angles", "Freestanding", {
		body_freestanding = "Body Freestanding",
		disable_yaw_modifiers = "Disable Yaw Modifiers"
	})
}

function slot_0_57_1()
	local var_142_0 = entity.get_local_player()

	if not var_142_0 or not var_142_0:is_alive() then
		return
	end

	local var_142_1 = var_142_0:get_eye_position()
	local var_142_2 = slot_0_50_1.general.edge_yaw
	local var_142_3 = var_142_2.while_fd:get() and slot_0_54_1:get()

	if var_142_2:get() or var_142_3 then
		local var_142_4
		local var_142_5 = math.huge

		for iter_142_0 = 30, 360, 30 do
			local var_142_6 = math.normalize_yaw(iter_142_0)
			local var_142_7 = var_142_1 + vector():angles(0, var_142_6) * 1000
			local var_142_8 = utils.trace_line(var_142_1, var_142_7, var_142_0)
			local var_142_9 = var_142_8.start_pos:dist(var_142_8.end_pos)

			if var_142_9 < var_142_5 then
				var_142_5 = var_142_9
				var_142_4 = iter_142_0
			end
		end

		if var_142_4 then
			slot_0_49_1.yaw[0] = "Static"
			slot_0_49_1.yaw.offset = var_142_4
			slot_0_49_1.body_yaw[0] = false
			slot_0_49_1.yaw_modifier[0] = "Disabled"
		end

		return true
	end
end

function slot_0_58_1(arg_143_0)
	local var_143_0 = slot_0_57_1()
	local var_143_1 = slot_0_50_1.general.manual_yaw
	local var_143_2 = var_143_1:get()
	local var_143_3 = slot_0_50_1.general.freestanding

	if var_143_0 then
		return
	end

	if var_143_2 ~= "Disabled" then
		local var_143_4 = {
			Left = -90,
			Backward = 0,
			Forward = 180,
			Right = 90
		}

		slot_0_49_1.yaw.base = var_143_1.yaw_base:get()

		if arg_143_0:get("Manual Yaw") then
			slot_0_49_1.yaw[0] = "Backward"
			slot_0_49_1.yaw.offset = var_143_4[var_143_2] or 0
			slot_0_49_1.body_yaw[0] = true
			slot_0_49_1.body_yaw.left_limit = 60
			slot_0_49_1.body_yaw.right_limit = 60
			slot_0_49_1.yaw_modifier[0] = "Disabled"
		else
			slot_0_49_1.yaw.offset = slot_0_49_1.yaw.offset + (var_143_4[var_143_2] or 0)
		end
	elseif (var_143_3:get() or var_143_3:get_override()) and rage.antiaim:get_target(true) and arg_143_0:get("Freestanding") then
		slot_0_49_1.yaw[0] = "Backward"
		slot_0_49_1.yaw.offset = 0
		slot_0_49_1.body_yaw[0] = true
		slot_0_49_1.body_yaw.left_limit = 60
		slot_0_49_1.body_yaw.right_limit = 60
		slot_0_49_1.yaw_modifier[0] = "Disabled"
	end
end

function slot_0_59_2(arg_144_0)
	if entity.get_game_rules().m_bWarmupPeriod and arg_144_0.warmup:get() then
		return true
	end

	local var_144_0 = {}

	entity.get_players(true, true, function(arg_145_0)
		if arg_145_0:is_alive() then
			var_144_0[#var_144_0 + 1] = arg_145_0
		end
	end)

	if #var_144_0 == 0 and arg_144_0.no_enemy:get() then
		return true
	end
end

function slot_0_60_1(arg_146_0)
	local var_146_0 = arg_146_0.options

	slot_0_49_1.body_yaw[0] = arg_146_0:get()
	slot_0_49_1.body_yaw.left_limit = arg_146_0.left:get()
	slot_0_49_1.body_yaw.right_limit = arg_146_0.right:get()
	slot_0_49_1.body_yaw.options = {
		var_146_0.avoid_overlap:get() and "Avoid Overlap" or "",
		var_146_0.jitter:get() and "Jitter" or "",
		var_146_0.randomize_jitter:get() and "Randomize Jitter" or "",
		var_146_0.anti_bruteforce:get() and "Anti Bruteforce" or ""
	}
	slot_0_49_1.body_yaw.freestanding = arg_146_0.freestanding:get()
end

function slot_0_61_2(arg_147_0)
	if arg_147_0:get() == "X-Way" then
		slot_0_49_1.yaw_modifier[0] = "Disabled"

		local var_147_0 = arg_147_0.ways:get()
		local var_147_1 = arg_147_0.offset:get()

		slot_0_49_1.yaw.offset = math.normalize_yaw(slot_0_49_1.yaw.offset + slot_0_55_1(var_147_0, var_147_1) * 0.5)
	else
		slot_0_49_1.yaw_modifier[0] = arg_147_0:get()
		slot_0_49_1.yaw_modifier.offset = arg_147_0.offset:get()
	end
end

function slot_0_62_3(arg_148_0, arg_148_1)
	if arg_148_0 <= 0 then
		return arg_148_1
	end

	local var_148_0 = math.abs(arg_148_1) * (arg_148_0 / 100)

	return arg_148_1 + (math.random() * 2 - 1) * var_148_0
end

function slot_0_63_3(arg_149_0)
	local var_149_0 = arg_149_0

	slot_0_49_1.yaw[0] = "Backward"
	slot_0_49_1.yaw.base = "At Target"

	local var_149_1 = var_149_0.randomize:get()
	local var_149_2 = var_149_0.left:get()
	local var_149_3 = var_149_0.right:get()

	if var_149_0:get() == "180° L/R" then
		local var_149_4 = arg_149_0.delay:get()

		if var_149_4 > 1 then
			if slot_0_49_1.sended >= slot_0_49_1.yaw.next_switch then
				slot_0_49_1.yaw.switch_side = not slot_0_49_1.yaw.switch_side

				local var_149_5 = arg_149_0.variability:get()
				local var_149_6 = slot_0_62_3(var_149_5, var_149_4)

				slot_0_49_1.yaw.next_switch = slot_0_49_1.sended + math.max(1, var_149_6)
			end

			slot_0_49_1.yaw.offset = slot_0_49_1.yaw.switch_side and slot_0_62_3(var_149_1, var_149_2) or slot_0_62_3(var_149_1, var_149_3)

			if slot_0_22_0(slot_0_49_1.body_yaw.options, "Jitter") then
				rage.antiaim:inverter(slot_0_49_1.yaw.switch_side)
			end
		else
			slot_0_49_1.yaw.offset = rage.antiaim:inverter() and slot_0_62_3(var_149_1, var_149_2) or slot_0_62_3(var_149_1, var_149_3)
		end
	else
		slot_0_49_1.yaw.offset = slot_0_62_3(var_149_1, var_149_0.offset:get())
	end
end

function slot_0_64_6(arg_150_0, arg_150_1, arg_150_2, arg_150_3)
	local var_150_0 = arg_150_0.conditions:get(arg_150_3)
	local var_150_1 = slot_0_40_0.ragebot.hide_shots:get() or slot_0_40_0.ragebot.hide_shots:get_override()
	local var_150_2 = arg_150_0.compatible_with_hide_shots:get()
	local var_150_3 = arg_150_1:get()
	local var_150_4
	local var_150_5

	if var_150_0 then
		if not var_150_1 then
			var_150_4 = "Always On"
		end

		if var_150_2 and var_150_1 then
			var_150_5 = "Break LC"
		end
	end

	slot_0_49_1.yaw.hidden = (var_150_4 ~= nil or var_150_5 ~= nil) and var_150_0 and var_150_3

	slot_0_40_0.ragebot.double_tap.lag_options:override(var_150_4)
	slot_0_40_0.ragebot.hide_shots.options:override(var_150_5)
end

function slot_0_65_7(arg_151_0, arg_151_1, arg_151_2)
	local var_151_0 = slot_0_40_0.ragebot.double_tap:get() or slot_0_40_0.ragebot.hide_shots:get() and (slot_0_40_0.ragebot.hide_shots.options:get() == "Break LC" or slot_0_40_0.ragebot.hide_shots.options:get_override() == "Break LC")

	if not arg_151_0:get() or not var_151_0 then
		return
	end

	if slot_0_45_0 then
		slot_0_49_1.body_yaw[0] = true
		slot_0_49_1.body_yaw.inverter = false
		slot_0_49_1.body_yaw.left_limit = 0
		slot_0_49_1.body_yaw.right_limit = 0
		slot_0_49_1.body_yaw.options = {}
		slot_0_49_1.body_yaw.freestanding = "Off"

		if arg_151_0.yaw:get() ~= "Disabled" then
			slot_0_49_1.yaw.offset = 0
			slot_0_49_1.yaw_modifier[0] = "Disabled"
		end
	else
		return
	end

	local var_151_1 = arg_151_0.pitch:get()
	local var_151_2 = 0

	if var_151_1 == "Custom" then
		var_151_2 = arg_151_0.pitch.amount:get()
	elseif var_151_1 == "Random" then
		local var_151_3 = arg_151_0.pitch.first:get()
		local var_151_4 = arg_151_0.pitch.second:get()

		var_151_2 = math.random(math.min(var_151_3, var_151_4), math.max(var_151_3, var_151_4))
	elseif var_151_1 == "Jitter" then
		var_151_2 = arg_151_2 and arg_151_0.pitch.second:get() or arg_151_0.pitch.first:get()
	else
		var_151_2 = ({
			Up = -89,
			Down = 89,
			Disabled = 89
		})[var_151_1] or 89
	end

	rage.antiaim:override_hidden_pitch(var_151_2)

	local var_151_5 = arg_151_0.yaw:get()
	local var_151_6 = 0
	local var_151_7 = arg_151_0.yaw.amount:get()

	if var_151_5 == "Forward" then
		var_151_6 = 180
	elseif var_151_5 == "Custom" then
		var_151_6 = var_151_7
	elseif var_151_5 == "Sideways" then
		var_151_6 = arg_151_2 and 90 or -90
	elseif var_151_5 == "Random" then
		var_151_6 = math.random(-180, 180)
	elseif var_151_5 == "Center" then
		var_151_6 = arg_151_2 and -var_151_7 * 0.5 or var_151_7 * 0.5
	elseif var_151_5 == "Spin" then
		if not slot_0_49_1.spin_yaw then
			slot_0_49_1.spin_yaw = 0
		end

		slot_0_49_1.spin_yaw = (slot_0_49_1.spin_yaw + 180 * (arg_151_0.yaw.speed:get() / 10)) % 360
		var_151_6 = slot_0_49_1.spin_yaw
	else
		var_151_6 = 0
	end

	rage.antiaim:override_hidden_yaw_offset(var_151_6)
end

function slot_0_66_10()
	local var_152_0
	local var_152_1 = slot_0_50_1.other.fakelag_disablers:get()

	if slot_0_22_0(var_152_1, "Double Tap") and slot_0_40_0.ragebot.double_tap:get() then
		var_152_0 = false
	elseif slot_0_22_0(var_152_1, "Hide Shots") and slot_0_40_0.ragebot.hide_shots:get() then
		var_152_0 = false
	elseif slot_0_22_0(var_152_1, "Standing") and slot_0_48_0.get_statement() == 2 then
		var_152_0 = false
	end

	slot_0_40_0.anti_aim.fake_lag.enabled:override(var_152_0)
end

function slot_0_67_12()
	local var_153_0 = slot_0_50_1.general.safe_head
	local var_153_1 = var_153_0.weapon
	local var_153_2 = var_153_0.height_difference:get()

	if not var_153_0:get() then
		return
	end

	local var_153_3 = entity.get_local_player()

	if not var_153_3 or not var_153_3:is_alive() then
		return
	end

	local var_153_4 = var_153_3:get_player_weapon()

	if not var_153_4 then
		return
	end

	local var_153_5 = var_153_4:get_classid()
	local var_153_6 = false

	if var_153_1:get("Knife") and var_153_5 == 107 then
		var_153_6 = true
	elseif var_153_1:get("Zeus") and var_153_5 == 268 then
		var_153_6 = true
	end

	if not slot_0_27_0[slot_0_48_0.get_statement()]:find("In Air") then
		var_153_6 = false
	end

	local var_153_7 = entity.get_threat()

	if not var_153_7 then
		return
	end

	local var_153_8 = var_153_3:get_eye_position()
	local var_153_9 = var_153_7:get_eye_position()
	local var_153_10 = var_153_8.z - var_153_9.z

	if var_153_2 > 0 and var_153_10 < var_153_2 then
		var_153_6 = false
	end

	if var_153_6 then
		slot_0_49_1.yaw[0] = "Backward"
		slot_0_49_1.yaw.base = "At Target"
		slot_0_49_1.yaw.offset = -18
		slot_0_49_1.yaw.hidden = false
		slot_0_49_1.yaw_modifier[0] = "Disabled"
		slot_0_49_1.body_yaw[0] = true
		slot_0_49_1.body_yaw.inverter = true
		slot_0_49_1.body_yaw.left_limit = 60
		slot_0_49_1.body_yaw.right_limit = 60
		slot_0_49_1.body_yaw.options = {}
		slot_0_49_1.body_yaw.freestanding = "Off"
	end
end

slot_0_68_12 = {}
slot_0_69_12 = slot_0_50_1.other.animation_breaker
slot_0_70_8 = slot_0_40_0.anti_aim.other.leg_movement
slot_0_71_7 = {}
slot_0_72_8 = {}

function slot_0_73_8(arg_154_0, arg_154_1, arg_154_2)
	slot_0_70_8:override()

	if arg_154_0 == "Falling" then
		arg_154_2[6] = 1
	elseif arg_154_0 == "Jitter legs" then
		slot_0_70_8:override("Sliding")

		arg_154_2[0] = utils.random_float(0.1, 0.9)
	elseif arg_154_0 == "Follow direction" then
		slot_0_70_8:override("Sliding")

		arg_154_2[0] = 1
	elseif arg_154_0 == "Moon walk" then
		slot_0_70_8:override("Walking")

		arg_154_2[7] = 0
	elseif arg_154_0 == "Walking" then
		arg_154_1[6].m_flWeight = 1.5
	elseif arg_154_0 == "Kangaroo" then
		arg_154_2[3] = math.random()
		arg_154_2[7] = math.random()
		arg_154_2[6] = math.random()
	end
end

function slot_0_74_7(arg_155_0, arg_155_1, arg_155_2)
	if arg_155_0.m_vecVelocity:length2d() > 3.3 then
		arg_155_1[12].m_flWeight = arg_155_2 * 0.1
	end
end

function slot_0_75_8(arg_156_0, arg_156_1, arg_156_2, arg_156_3)
	for iter_156_0 = 0, 12 do
		local var_156_0 = arg_156_1[iter_156_0]
		local var_156_1 = arg_156_2 * (slot_0_71_7[iter_156_0] or 0) + arg_156_3 * var_156_0

		slot_0_71_7[iter_156_0] = var_156_1
		arg_156_1[iter_156_0] = var_156_1
	end

	for iter_156_1 = 0, 12 do
		local var_156_2 = arg_156_0[iter_156_1]

		if var_156_2 then
			local var_156_3 = var_156_2.m_flWeight
			local var_156_4 = arg_156_2 * (slot_0_72_8[iter_156_1] or 0) + arg_156_3 * var_156_3

			slot_0_72_8[iter_156_1] = var_156_4
			var_156_2.m_flWeight = var_156_4
		end
	end
end

function slot_0_68_12.post_anim_update(arg_157_0)
	if not slot_0_69_12:get() then
		slot_0_70_8:override()

		return
	end

	local var_157_0 = entity.get_local_player()

	if not var_157_0 or not var_157_0:is_alive() then
		return
	end

	if globals.curtime - to_time(var_157_0.m_nTickBase) ~= 0 then
		return
	end

	if arg_157_0:get_index() ~= var_157_0:get_index() then
		return
	end

	local var_157_1 = ffi.cast("uintptr_t", var_157_0[0])
	local var_157_2 = ffi.cast("CAnimationLayer**", var_157_1 + 10640)[0]
	local var_157_3 = slot_0_69_12.leaning:get()
	local var_157_4 = slot_0_69_12.interpolation:get()
	local var_157_5 = slot_0_27_0[slot_0_48_0.get_statement()]:find("Air") and slot_0_69_12.air:get() or slot_0_69_12.ground:get()

	slot_0_74_7(var_157_0, var_157_2, var_157_3)

	if var_157_4 > 0 then
		local var_157_6 = globals.tickinterval * var_157_4
		local var_157_7 = 1 - var_157_6
		local var_157_8 = var_157_0.m_flPoseParameter

		slot_0_75_8(var_157_2, var_157_8, var_157_6, var_157_7)
	end

	slot_0_73_8(var_157_5, var_157_2, var_157_0.m_flPoseParameter)
end

function slot_0_48_0.post_update_clientside_animation(arg_158_0)
	slot_0_68_12.post_anim_update(arg_158_0)
end

function slot_0_48_0.render()
	return
end

function slot_0_48_0.shutdown()
	slot_0_40_0.anti_aim.other.leg_movement:override()
end

function slot_0_48_0.createmove(arg_161_0)
	slot_0_51_1 = arg_161_0.in_jump
	slot_0_52_1 = arg_161_0.in_speed

	if arg_161_0.choked_commands == 0 then
		slot_0_49_1.sended = slot_0_49_1.sended + 1
	end

	slot_161_1_0 = slot_0_48_0.get_statement()
	slot_161_2_0 = slot_0_50_1.builder[slot_161_1_0].override:get() and slot_0_50_1.builder[slot_161_1_0] or slot_0_50_1.builder[1]
	slot_161_3_0 = slot_0_49_1.sended % 2 == 0

	slot_0_60_1(slot_161_2_0.desync)
	slot_0_63_3(slot_161_2_0.yaw)
	slot_0_61_2(slot_161_2_0.modifier)
	slot_0_58_1(slot_0_50_1.other.static_yaw)
	slot_0_64_6(slot_0_50_1.other.defensive, slot_161_2_0.defensive, arg_161_0, slot_161_1_0 - 1)
	slot_0_65_7(slot_161_2_0.defensive, arg_161_0, slot_161_3_0)
	slot_0_66_10()
	slot_0_67_12()
	slot_0_56_1.enabled:override(not slot_0_59_2(slot_0_50_1.other.disablers))
	slot_0_56_1.yaw:override(slot_0_49_1.yaw[0])
	slot_0_56_1.yaw.base:override(slot_0_49_1.yaw.base)
	slot_0_56_1.yaw.offset:override(slot_0_49_1.yaw.offset)
	slot_0_56_1.yaw.avoid_backstab:override(slot_0_50_1.general.avoid_backstab:get())
	slot_0_56_1.yaw.hidden:override(slot_0_49_1.yaw.hidden)
	slot_0_56_1.yaw_modifier:override(slot_0_49_1.yaw_modifier[0])
	slot_0_56_1.yaw_modifier.offset:override(slot_0_49_1.yaw_modifier.offset)
	slot_0_56_1.body_yaw:override(slot_0_49_1.body_yaw[0])
	slot_0_56_1.body_yaw.inverter:override(slot_0_49_1.body_yaw.inverter)
	slot_0_56_1.body_yaw.left_limit:override(slot_0_49_1.body_yaw.left_limit)
	slot_0_56_1.body_yaw.right_limit:override(slot_0_49_1.body_yaw.right_limit)
	slot_0_56_1.body_yaw.options:override(slot_0_49_1.body_yaw.options)
	slot_0_56_1.body_yaw.freestanding:override(slot_0_49_1.body_yaw.freestanding)

	arg_161_0.jitter_move = slot_0_50_1.general.jitter_move:get()
	slot_161_4_0 = slot_0_50_1.general.freestanding:get() or slot_0_50_1.general.freestanding:get_override()

	if slot_0_50_1.general.manual_yaw:get() ~= "Disabled" and slot_0_50_1.other.static_yaw:get("Manual Yaw") then
		slot_161_4_0 = false
	end

	slot_0_56_1.freestanding:override(slot_161_4_0)
end

slot_0_49_0 = {}
slot_0_50_0 = slot_0_47_0.settings
slot_0_51_0 = slot_0_50_0.style

function slot_0_52_0(arg_162_0)
	local var_162_0 = slot_0_5_0.get_binds()

	for iter_162_0 = 1, #var_162_0 do
		local var_162_1 = var_162_0[iter_162_0]

		if var_162_1.active and var_162_1.name == arg_162_0 then
			return true
		end
	end

	return false
end

slot_0_53_0 = render.load_font("Trebuc", 13, "ad")
slot_0_54_0 = render.load_font("Trebuc", 20, "ad")
slot_0_55_0 = 5
slot_0_56_0 = 3
slot_0_57_0 = 0.5
slot_0_58_0 = 5
slot_0_59_1 = nil

function slot_0_59_0(arg_163_0, arg_163_1, arg_163_2, arg_163_3, arg_163_4)
	if slot_0_51_0.blur:get() then
		render.blur(arg_163_0, arg_163_0 + arg_163_1, slot_0_57_0, arg_163_2 / 255, slot_0_56_0)
	end

	render.rect(arg_163_0, arg_163_0 + arg_163_1, color(0, 0, 0, arg_163_2 * arg_163_4), slot_0_56_0)

	local var_163_0 = arg_163_1.x
	local var_163_1 = vector(2, arg_163_1.y - 8)
	local var_163_2 = arg_163_0 + vector(-1, 4)

	if slot_0_51_0.glow:get() then
		render.shadow(var_163_2, var_163_2 + var_163_1, arg_163_3:alpha_modulate(arg_163_2))
	end

	render.rect(var_163_2, var_163_2 + var_163_1, arg_163_3:alpha_modulate(arg_163_2), slot_0_56_0)

	local var_163_3 = arg_163_0 + vector(var_163_0 - 1, 4)

	if slot_0_51_0.glow:get() then
		render.shadow(var_163_3, var_163_3 + var_163_1, arg_163_3:alpha_modulate(arg_163_2))
	end

	render.rect(var_163_3, var_163_3 + var_163_1, arg_163_3:alpha_modulate(arg_163_2), slot_0_56_0)
end

slot_0_60_0 = {}
slot_0_61_1 = slot_0_50_0.widgets
slot_0_62_2 = slot_0_50_0.cache
slot_0_63_2 = {}
slot_0_64_5 = slot_0_61_1.watermark
slot_0_65_6 = 10
slot_0_66_9 = slot_0_3_0.new(0)
slot_0_67_11 = slot_0_3_0.new(54 + slot_0_55_0 * 2)
slot_0_68_11 = slot_0_38_0.new("Watermark"):set_pos(vector(slot_0_30_0.x - slot_0_65_6, slot_0_65_6)):update(true)
slot_0_68_11.align = slot_0_62_2.align_wm.value or 0
slot_0_69_11 = slot_0_62_2.pos_x_wm.value ~= 0 and slot_0_62_2.pos_x_wm.value or slot_0_68_11.pos.x

function slot_0_68_11.on_dragging(arg_164_0)
	slot_0_69_11 = arg_164_0.pos.x
	arg_164_0.align = 0

	slot_0_62_2.align_wm:set(0)
end

function slot_0_68_11.on_release(arg_165_0)
	local var_165_0 = slot_0_30_0.x / 3
	local var_165_1 = slot_0_69_11 + arg_165_0.size.x * 0.5
	local var_165_2 = math.floor(var_165_1 / var_165_0)

	if arg_165_0.align ~= var_165_2 then
		arg_165_0.align = var_165_2

		if arg_165_0.align == 1 then
			slot_0_69_11 = slot_0_69_11 + arg_165_0.size.x * 0.5
		elseif arg_165_0.align == 2 then
			slot_0_69_11 = slot_0_69_11 + arg_165_0.size.x
		end

		slot_0_62_2.align_wm:set(arg_165_0.align)
		slot_0_62_2.pos_x_wm:set(slot_0_69_11)
	end
end

function slot_0_68_11.render_callback(arg_166_0)
	slot_166_1_0 = arg_166_0.pos

	slot_0_66_9:update(0.05, 255)

	slot_0_68_11.is_active = slot_0_66_9.value > 1

	if slot_0_66_9.value <= 1 then
		return
	end

	slot_166_2_0 = slot_0_66_9.value
	slot_166_3_1 = slot_0_51_0.accent:get()
	slot_166_4_0 = slot_166_3_1.a / 255
	slot_166_3_0 = slot_166_3_1:alpha_modulate(255)
	slot_166_5_0 = {
		string.format("\a%s\f<%s>\r %s", slot_166_3_0:to_hex(), slot_0_26_0.icon, slot_0_26_0.name)
	}

	if slot_0_64_5.fields:get("User") then
		slot_166_6_2 = slot_0_64_5.username:get():match("^%s*(.*%S)%s*$") or ""
		slot_166_7_1 = #slot_166_6_2 > 0 and slot_166_6_2 or common.get_username()

		table.insert(slot_166_5_0, string.format("\a%s\f<user>\r %s", slot_166_3_0:to_hex(), slot_166_7_1))
	end

	if slot_0_64_5.fields:get("Ping") and globals.is_connected then
		slot_166_6_1 = math.floor(utils.net_channel().avg_latency[1] * 1000 + 0.5)

		table.insert(slot_166_5_0, string.format("\a%s\f<wifi>\r %sms", slot_166_3_0:to_hex(), slot_166_6_1))
	end

	if slot_0_64_5.fields:get("Time") then
		table.insert(slot_166_5_0, string.format("\a%s\f<clock>\r %s", slot_166_3_0:to_hex(), string.lower(common.get_date("%I:%M %p", common.get_unixtime()))))
	end

	slot_166_6_0 = slot_0_5_0.string(table.concat(slot_166_5_0, " "))
	slot_166_7_0 = render.measure_text(slot_0_53_0, nil, slot_166_6_0)

	slot_0_67_11:update(0.05, slot_166_7_0.x + slot_0_55_0 * 2)

	slot_166_8_0 = slot_0_67_11.value
	slot_166_9_0 = slot_166_7_0.y + slot_0_55_0 * 1.5
	slot_166_10_0 = vector(slot_166_8_0, slot_166_9_0)

	if arg_166_0.align == 1 then
		arg_166_0.pos.x = slot_0_69_11 - slot_166_8_0 * 0.5
	elseif arg_166_0.align == 2 then
		arg_166_0.pos.x = slot_0_69_11 - slot_166_8_0
	end

	slot_0_59_0(slot_166_1_0, slot_166_10_0, slot_166_2_0, slot_166_3_0, slot_166_4_0)
	render.push_clip_rect(slot_166_1_0, slot_166_1_0 + slot_166_10_0)
	render.text(slot_0_53_0, slot_166_1_0 + slot_166_10_0 * 0.5, color(255, slot_166_2_0), "c", slot_166_6_0)
	render.pop_clip_rect()
	arg_166_0:set_rules({
		{
			horizontal = true,
			pos = vector(slot_0_30_0.x / 2, slot_0_30_0.y / 2)
		},
		{
			horizontal = true,
			pos = vector(slot_166_10_0.x * 0.5 + slot_0_65_6, slot_0_30_0.y / 2)
		},
		{
			horizontal = true,
			pos = vector(slot_0_30_0.x - (slot_166_10_0.x * 0.5 + slot_0_65_6), slot_0_30_0.y / 2)
		},
		{
			horizontal = false,
			pos = vector(0, slot_0_30_0.y * 0.5)
		},
		{
			horizontal = false,
			pos = vector(slot_0_30_0.x / 2, slot_166_10_0.y * 0.5 + slot_0_65_6)
		},
		{
			horizontal = false,
			pos = vector(slot_0_30_0.x / 2, slot_0_30_0.y - slot_166_10_0.y * 0.5 - slot_0_65_6)
		}
	})
	arg_166_0:set_size(slot_166_10_0)
end

slot_0_64_4 = {}
slot_0_65_5 = slot_0_61_1.keybinds
slot_0_66_8 = 18
slot_0_67_10 = 2
slot_0_68_10 = 120
slot_0_69_10 = 22
slot_0_70_7 = slot_0_3_0.new(0)
slot_0_71_6 = slot_0_3_0.new(slot_0_68_10)
slot_0_72_7 = slot_0_3_0.new(0)
slot_0_73_7 = slot_0_38_0.new("Keybinds"):set_pos(vector(slot_0_30_0.x - 140, 80)):update(true)

function slot_0_74_6(arg_167_0)
	local var_167_0 = arg_167_0.value
	local var_167_1 = arg_167_0.mode

	if type(var_167_0) == "boolean" then
		return var_167_1 == 1 and "hold" or "toggle"
	end

	if type(var_167_0) == "table" then
		return table.concat(var_167_0, ", ")
	end

	return tostring(var_167_0)
end

function slot_0_75_7()
	local var_168_0 = slot_0_5_0.get_binds()
	local var_168_1 = {}

	for iter_168_0, iter_168_1 in pairs(var_168_0) do
		local var_168_2 = slot_0_37_0.new(iter_168_1.name .. " / keybinds", 0):update(0.05, iter_168_1.active and 1 or 0)

		if var_168_2.value > 0.1 then
			var_168_1[#var_168_1 + 1] = {
				name = iter_168_1.name,
				value = slot_0_74_6(iter_168_1),
				anim = var_168_2.value
			}
		end
	end

	return var_168_1, #var_168_1 >= 1
end

function slot_0_73_7.render_callback(arg_169_0)
	slot_169_1_0 = arg_169_0.pos
	slot_169_2_0, slot_169_3_0 = slot_0_75_7()
	slot_169_4_0 = slot_0_65_5:get() and (slot_169_3_0 or ui.get_alpha() > 0)

	slot_0_70_7:update(0.05, slot_169_4_0 and 255 or 0)

	slot_0_73_7.is_active = slot_0_70_7.value > 1

	if slot_0_70_7.value <= 1 then
		return
	end

	slot_169_5_0 = slot_0_70_7.value
	slot_169_6_0 = slot_0_51_0.accent:get()
	slot_169_7_0 = slot_169_6_0.a / 255
	slot_169_8_0 = slot_0_68_10

	for iter_169_0, iter_169_1 in ipairs(slot_169_2_0) do
		slot_169_16_1 = render.measure_text(slot_0_53_0, nil, iter_169_1.name).x + render.measure_text(slot_0_53_0, nil, iter_169_1.value).x + slot_0_55_0 * 4

		if slot_169_8_0 < slot_169_16_1 then
			slot_169_8_0 = slot_169_16_1
		end
	end

	slot_0_71_6:update(0.05, slot_169_8_0)

	slot_169_9_0 = math.ceil(slot_0_71_6.value)
	slot_169_10_0 = slot_0_5_0.string(string.format("\a%s\f<keyboard> \rkeybinds", slot_0_51_0.accent:get():alpha_modulate(slot_169_5_0):to_hex()))
	slot_169_11_0 = vector(slot_169_9_0, slot_0_69_10)

	slot_0_59_0(slot_169_1_0, slot_169_11_0, slot_169_5_0, slot_169_6_0, slot_169_7_0)
	render.text(slot_0_53_0, slot_169_1_0 + slot_169_11_0 * 0.5, color(255, slot_169_5_0), "c", slot_169_10_0)

	slot_169_12_0 = 0
	slot_169_13_0 = slot_169_1_0 + vector(0, slot_0_69_10 + 1)
	slot_169_14_0 = 0

	for iter_169_2, iter_169_3 in ipairs(slot_169_2_0) do
		slot_169_14_0 = slot_169_14_0 + (slot_0_66_8 + slot_0_67_10) * iter_169_3.anim
	end

	slot_0_72_7:update(0.05, math.ceil(slot_169_14_0))

	slot_169_15_0 = math.ceil(slot_0_72_7.value)

	if slot_169_15_0 > 0 then
		slot_169_16_0 = vector(slot_169_9_0, slot_169_15_0 + slot_0_55_0)

		if slot_0_51_0.blur:get() then
			render.blur(slot_169_13_0, slot_169_13_0 + slot_169_16_0, slot_0_57_0, slot_169_5_0 / 255, slot_0_56_0)
		end

		render.rect(slot_169_13_0, slot_169_13_0 + slot_169_16_0, color(0, 0, 0, slot_169_5_0 * slot_169_7_0 * 0.7), slot_0_56_0)
	end

	for iter_169_4, iter_169_5 in ipairs(slot_169_2_0) do
		slot_169_21_0 = slot_169_5_0 * iter_169_5.anim
		slot_169_22_0 = slot_0_11_0(slot_169_12_0)
		slot_169_23_0 = tostring(iter_169_5.value):lower()

		render.text(slot_0_53_0, slot_169_13_0 + vector(slot_0_55_0, slot_169_22_0 + slot_0_55_0), color(255, slot_169_21_0), nil, slot_0_25_0(iter_169_5.name))

		slot_169_24_0 = render.measure_text(slot_0_53_0, nil, slot_169_23_0).x

		render.text(slot_0_53_0, slot_169_13_0 + vector(slot_169_9_0 - slot_0_55_0 - slot_169_24_0, slot_169_22_0 + slot_0_55_0), color(180, 180, 180, slot_169_21_0), nil, slot_169_23_0)

		slot_169_12_0 = slot_169_12_0 + (slot_0_66_8 + slot_0_67_10) * iter_169_5.anim
	end

	arg_169_0:set_size(vector(slot_169_9_0, slot_0_69_10 + 1 + slot_169_15_0 + slot_0_55_0))
end

slot_0_65_4 = {}
slot_0_66_7 = slot_0_61_1.spectators
slot_0_67_9 = 18
slot_0_68_9 = 2
slot_0_69_9 = 120
slot_0_70_6 = 22
slot_0_71_5 = slot_0_3_0.new(0)
slot_0_72_6 = slot_0_3_0.new(slot_0_69_9)
slot_0_73_6 = slot_0_3_0.new(0)
slot_0_74_5 = slot_0_38_0.new("Spectators"):set_pos(vector(slot_0_30_0.x - 140, 200)):update(true)

function slot_0_75_6()
	local var_170_0 = entity.get_local_player()

	if not var_170_0 then
		return {}, false
	end

	local var_170_1 = var_170_0.m_hObserverTarget and (var_170_0.m_iObserverMode == 4 or var_170_0.m_iObserverMode == 5) and var_170_0.m_hObserverTarget or var_170_0
	local var_170_2 = {}

	entity.get_players(false, false, function(arg_171_0)
		local var_171_0 = arg_171_0:get_player_info()
		local var_171_1 = arg_171_0.m_hObserverTarget == var_170_1 and (arg_171_0.m_iObserverMode == 4 or arg_171_0.m_iObserverMode == 5 or var_171_0.is_fake_player)
		local var_171_2 = not arg_171_0:is_alive() and arg_171_0 ~= var_170_0 and var_171_1
		local var_171_3 = slot_0_37_0.new(arg_171_0:get_index() .. " / spectators", 0):update(0.05, var_171_2 and 1 or 0)

		if var_171_3.value > 0.1 then
			var_170_2[#var_170_2 + 1] = {
				name = arg_171_0:get_name(),
				avatar = arg_171_0:get_steam_avatar(),
				anim = var_171_3.value
			}
		end
	end)

	return var_170_2, #var_170_2 >= 1
end

function slot_0_65_4.level_init()
	slot_0_37_0.clear(" / spectators")
end

function slot_0_65_4.level_shutdown()
	slot_0_37_0.clear(" / spectators")
end

function slot_0_74_5.render_callback(arg_174_0)
	slot_174_1_0 = arg_174_0.pos
	slot_174_2_0, slot_174_3_0 = slot_0_75_6()
	slot_174_4_0 = slot_0_66_7:get() and (slot_174_3_0 or ui.get_alpha() > 0)

	slot_0_71_5:update(0.05, slot_174_4_0 and 255 or 0)

	slot_0_74_5.is_active = slot_0_71_5.value > 1

	if slot_0_71_5.value <= 1 then
		return
	end

	slot_174_5_0 = slot_0_71_5.value
	slot_174_6_0 = slot_0_51_0.accent:get()
	slot_174_7_0 = slot_174_6_0.a / 255
	slot_174_8_0 = 14
	slot_174_9_0 = slot_0_69_9

	for iter_174_0, iter_174_1 in ipairs(slot_174_2_0) do
		slot_174_17_1 = render.measure_text(slot_0_53_0, nil, iter_174_1.name).x + (iter_174_1.avatar and slot_174_8_0 + slot_0_55_0 or 0) + slot_0_55_0 * 3

		if slot_174_9_0 < slot_174_17_1 then
			slot_174_9_0 = slot_174_17_1
		end
	end

	slot_0_72_6:update(0.05, slot_174_9_0)

	slot_174_10_0 = math.ceil(slot_0_72_6.value)
	slot_174_11_0 = slot_0_5_0.string(string.format("\a%s\f<eye> \rspectators", slot_0_51_0.accent:get():alpha_modulate(slot_174_5_0):to_hex()))
	slot_174_12_0 = vector(slot_174_10_0, slot_0_70_6)

	slot_0_59_0(slot_174_1_0, slot_174_12_0, slot_174_5_0, slot_174_6_0, slot_174_7_0)
	render.text(slot_0_53_0, slot_174_1_0 + slot_174_12_0 * 0.5, color(255, slot_174_5_0), "c", slot_174_11_0)

	slot_174_13_0 = 0
	slot_174_14_0 = slot_174_1_0 + vector(0, slot_0_70_6 + 1)
	slot_174_15_0 = 0

	for iter_174_2, iter_174_3 in ipairs(slot_174_2_0) do
		slot_174_15_0 = slot_174_15_0 + (slot_0_67_9 + slot_0_68_9) * iter_174_3.anim
	end

	slot_0_73_6:update(0.05, math.ceil(slot_174_15_0))

	slot_174_16_0 = math.ceil(slot_0_73_6.value)

	if slot_174_16_0 > 0 then
		slot_174_17_0 = vector(slot_174_10_0, slot_174_16_0 + slot_0_55_0)

		if slot_0_51_0.blur:get() then
			render.blur(slot_174_14_0, slot_174_14_0 + slot_174_17_0, slot_0_57_0, slot_174_5_0 / 255, slot_0_56_0)
		end

		render.rect(slot_174_14_0, slot_174_14_0 + slot_174_17_0, color(0, 0, 0, slot_174_5_0 * slot_174_7_0 * 0.7), slot_0_56_0)
	end

	for iter_174_4, iter_174_5 in ipairs(slot_174_2_0) do
		slot_174_22_0 = slot_174_5_0 * iter_174_5.anim
		slot_174_23_0 = slot_0_11_0(slot_174_13_0)

		render.text(slot_0_53_0, slot_174_14_0 + vector(slot_0_55_0, slot_174_23_0 + slot_0_55_0), color(255, slot_174_22_0), nil, iter_174_5.name)

		if iter_174_5.avatar then
			slot_174_24_0 = slot_174_14_0 + vector(slot_174_10_0 - slot_0_55_0 - slot_174_8_0, slot_174_23_0 + slot_0_55_0)

			render.texture(iter_174_5.avatar, slot_174_24_0, vector(slot_174_8_0, slot_174_8_0), color(255, slot_174_22_0), "f", 2)
		end

		slot_174_13_0 = slot_174_13_0 + (slot_0_67_9 + slot_0_68_9) * iter_174_5.anim
	end

	arg_174_0:set_size(vector(slot_174_10_0, slot_0_70_6 + 1 + slot_174_16_0 + slot_0_55_0))
end

slot_0_66_6 = {}
slot_0_67_8 = slot_0_61_1.velocity_warning
slot_0_68_8 = slot_0_3_0.new(0)
slot_0_69_8 = slot_0_3_0.new(0)
slot_0_70_5 = slot_0_38_0.new("Velocity Warning"):set_pos(vector(slot_0_30_0.x / 2 - 75, slot_0_30_0.y / 2 + 100)):update(true)

function slot_0_70_5.render_callback(arg_175_0)
	slot_175_1_0 = entity.get_local_player()
	slot_175_2_0 = 1

	if ui.get_alpha() > 0.5 then
		slot_175_2_0 = 1 - math.abs(math.sin(globals.realtime * 2)) * 0.4
	elseif slot_175_1_0 and slot_175_1_0:is_alive() then
		slot_175_2_0 = slot_175_1_0.m_flVelocityModifier
	end

	slot_175_3_0 = slot_0_67_8:get() and (slot_175_2_0 < 0.99 or ui.get_alpha() > 0)

	slot_0_68_8:update(0.05, slot_175_3_0 and 255 or 0)

	slot_0_70_5.is_active = slot_0_68_8.value > 1

	if slot_0_68_8.value <= 1 then
		return
	end

	slot_175_4_0 = slot_0_68_8.value
	slot_175_5_0 = slot_0_51_0.accent:get()
	slot_175_6_0 = slot_175_5_0.a / 255
	slot_175_7_0 = slot_0_5_0.string("\f<triangle-exclamation>")
	slot_175_8_0 = slot_0_5_0.string("slowed down")
	slot_175_9_0 = slot_0_5_0.string(string.format("\a%s%d%%", slot_0_51_0.accent:get():alpha_modulate(255):to_hex(), math.floor(slot_175_2_0 * 100 + 0.5)))
	slot_175_10_0 = render.measure_text(slot_0_54_0, nil, slot_175_7_0)
	slot_175_11_0 = render.measure_text(slot_0_53_0, nil, slot_175_8_0)
	slot_175_12_0 = 8
	slot_175_13_0 = slot_175_10_0.x + slot_175_12_0 * 2
	slot_175_15_0 = slot_175_13_0 + 132
	slot_175_16_0 = 38
	slot_175_17_0 = vector(slot_175_15_0, slot_175_16_0)
	slot_175_18_0 = arg_175_0.pos

	slot_0_59_0(slot_175_18_0, slot_175_17_0, slot_175_4_0, slot_175_5_0, slot_175_6_0)
	render.text(slot_0_54_0, slot_175_18_0 + vector((slot_175_13_0 - slot_175_10_0.x) / 2 + slot_175_12_0 / 4.5, (slot_175_17_0.y - slot_175_10_0.y) / 2), slot_0_51_0.accent:get():alpha_modulate(slot_175_4_0), "", slot_175_7_0)

	slot_175_19_0 = color(255, 255, 255, slot_175_4_0 * 0.1)

	render.rect(slot_175_18_0 + vector(slot_175_13_0, 6), slot_175_18_0 + vector(slot_175_13_0 + 1, slot_175_17_0.y - 6), slot_175_19_0)

	slot_175_20_0 = slot_175_13_0 + slot_0_55_0 * 2

	render.text(slot_0_53_0, slot_175_18_0 + vector(slot_175_20_0, 7), color(255, slot_175_4_0), nil, slot_175_8_0)
	render.text(slot_0_53_0, slot_175_18_0 + vector(slot_175_17_0.x - slot_0_55_0 * 2, 7), color(255, slot_175_4_0), "r", slot_175_9_0)

	slot_175_21_0 = slot_175_18_0 + vector(slot_175_20_0, 24)
	slot_175_22_0 = vector(slot_175_17_0.x - slot_175_20_0 - slot_0_55_0 * 2, 2)

	render.rect(slot_175_21_0, slot_175_21_0 + slot_175_22_0, color(0, 0, 0, slot_175_4_0 * 0.5), 1)

	slot_175_23_0 = slot_175_22_0.x * slot_175_2_0

	slot_0_69_8:update(0.1, slot_175_23_0)
	render.rect(slot_175_21_0, slot_175_21_0 + vector(slot_0_69_8.value, slot_175_22_0.y), slot_175_5_0:alpha_modulate(slot_175_4_0), 1)
	arg_175_0:set_size(slot_175_17_0)
	arg_175_0:set_rules({
		{
			horizontal = true,
			pos = vector(slot_0_30_0.x / 2, slot_0_30_0.y / 2)
		}
	})
end

slot_0_67_7 = slot_0_3_0.new(0)

function slot_0_68_7(arg_176_0)
	return (arg_176_0:gsub(".", "%1 "):gsub("%s+$", ""))
end

function slot_0_60_0.render()
	return
end

function slot_0_60_0.level_init()
	slot_0_65_4.level_init()
end

function slot_0_60_0.level_shutdown()
	slot_0_65_4.level_shutdown()
end

slot_0_61_0 = {}
slot_0_62_1 = slot_0_50_0.in_game
slot_0_63_1 = render.load_font("Calibri Bold", vector(25, 23.5, -0.4), "a")
slot_0_64_3 = render.load_image_from_file("materials\\panorama\\images\\icons\\ui\\bomb_c4.svg")
slot_0_65_3 = cvar.sv_maxunlag
slot_0_66_5 = {}

function slot_0_67_6(arg_180_0, arg_180_1, arg_180_2, arg_180_3, arg_180_4, arg_180_5, arg_180_6)
	local var_180_0 = (arg_180_3 - arg_180_0) * arg_180_6 + arg_180_0
	local var_180_1 = (arg_180_4 - arg_180_1) * arg_180_6 + arg_180_1
	local var_180_2 = (arg_180_5 - arg_180_2) * arg_180_6 + arg_180_2

	return var_180_0, var_180_1, var_180_2
end

function slot_0_68_6()
	local var_181_0 = utils.net_channel()

	if var_181_0 == nil then
		return nil
	end

	local var_181_1 = slot_0_65_3:float()
	local var_181_2 = slot_0_40_0.misc.other.fake_latency:get()
	local var_181_3 = (var_181_0.sequence_nr[0] + var_181_0.sequence_nr[1]) / math.clamp(var_181_2 * 0.001, 0.001, var_181_1)

	return math.clamp(var_181_3, 0, 1)
end

slot_0_69_7 = {
	hits = 0,
	misses = 0
}

function slot_0_70_4()
	local var_182_0 = slot_0_69_7.hits + slot_0_69_7.misses

	if var_182_0 == 0 then
		return 100
	end

	return math.floor(slot_0_69_7.hits / var_182_0 * 100)
end

function slot_0_61_0.update(arg_183_0, arg_183_1)
	slot_0_69_7[arg_183_1] = slot_0_69_7[arg_183_1] + 1
end

function slot_0_61_0.reset(arg_184_0)
	slot_0_69_7 = {
		hits = 0,
		misses = 0
	}
end

function slot_0_61_0.add(arg_185_0, arg_185_1, arg_185_2, arg_185_3, arg_185_4)
	arg_185_2 = arg_185_2 or color(255, 200)

	local var_185_0 = render.measure_text(slot_0_63_1, "", arg_185_1)
	local var_185_1 = #slot_0_66_5 == 0 and slot_0_30_0.y - 350 or slot_0_66_5[#slot_0_66_5].offset - (var_185_0.y + 11) - 8

	table.insert(slot_0_66_5, {
		text = arg_185_1,
		color = arg_185_2,
		offset = var_185_1,
		size = var_185_0,
		is_bomb = arg_185_3,
		pct = arg_185_4
	})
end

function slot_0_61_0.render(arg_186_0)
	for iter_186_0, iter_186_1 in ipairs(slot_0_66_5) do
		local var_186_0 = vector(0, iter_186_1.offset)
		local var_186_1 = iter_186_1.is_bomb
		local var_186_2 = var_186_0 + vector(28, 8.5)

		if var_186_1 then
			var_186_2 = var_186_2 + vector(38)
		end

		local var_186_3 = 56

		if var_186_1 then
			var_186_3 = var_186_3 + 38
		end

		if iter_186_1.pct ~= nil then
			var_186_3 = var_186_3 + 18
		end

		local var_186_4 = vector(iter_186_1.size.x + var_186_3, iter_186_1.size.y + 11)
		local var_186_5 = vector(var_186_4.x * 0.5, var_186_4.y)
		local var_186_6 = color(0, 0)
		local var_186_7 = color(0, 51)
		local var_186_8 = color(0, 128)

		render.gradient(var_186_0, var_186_0 + var_186_5, var_186_6, var_186_7, var_186_6, var_186_7)
		render.gradient(var_186_0 + vector(var_186_5.x, 0), var_186_0 + var_186_4, var_186_7, var_186_6, var_186_7, var_186_6)
		render.text(slot_0_63_1, var_186_2 + vector(1, 1), var_186_8, nil, iter_186_1.text)
		render.text(slot_0_63_1, var_186_2, iter_186_1.color, nil, iter_186_1.text)

		if var_186_1 then
			render.texture(slot_0_64_3, var_186_0 + vector(29, 2), vector(slot_0_64_3.width, slot_0_64_3.height - 3), iter_186_1.color)
		end

		if iter_186_1.pct ~= nil then
			local var_186_9 = var_186_0 + vector(var_186_4.x - 29, iter_186_1.size.y / 2 + 5)

			render.circle_outline(var_186_9, color(0, 200), 10, 0, 1, 4)
			render.circle_outline(var_186_9, color(255, 255), 9.5, 361, iter_186_1.pct, 3)
		end
	end

	slot_0_66_5 = {}
end

slot_0_35_0.render:set(function()
	local var_187_0 = entity.get_local_player()

	if not var_187_0 or not var_187_0:is_alive() then
		return
	end

	slot_0_61_0:render()
end)
slot_0_35_0.render:set(function()
	slot_188_0_0 = entity.get_local_player()

	if not slot_188_0_0 or not slot_188_0_0:is_alive() then
		return
	end

	slot_188_1_0 = slot_0_62_1.skeet_indicators
	slot_188_2_0 = slot_188_1_0.selected

	if not slot_188_1_0:get() then
		return
	end

	slot_188_3_0, slot_188_4_0, slot_188_5_0 = color(255, 255, 255):to_hsv()
	slot_188_6_0, slot_188_7_0, slot_188_8_0 = color(151, 175, 54):to_hsv()
	slot_188_9_0 = color()
	slot_188_10_1, slot_188_11_1, slot_188_12_1 = slot_0_67_6(slot_188_3_0, slot_188_4_0, slot_188_5_0, slot_188_6_0, slot_188_7_0, slot_188_8_0, slot_0_68_6())

	slot_188_9_0:as_hsv(slot_188_10_1, slot_188_11_1, slot_188_12_1, 200)

	slot_188_10_0 = slot_0_40_0.misc.other.fake_latency:get() > 0
	slot_188_11_0 = slot_0_40_0.ragebot.dormant_aimbot:get() or slot_0_50_0.rage.dormant_aimbot:get()
	slot_188_12_0 = slot_0_40_0.anti_aim.other.fake_duck:get()
	slot_188_13_0 = slot_0_40_0.ragebot.double_tap:get()
	slot_188_14_0 = slot_0_40_0.ragebot.hide_shots:get()
	slot_188_15_0 = slot_0_40_0.anti_aim.angles.freestanding:get() or slot_0_40_0.anti_aim.angles.freestanding:get_override()
	slot_188_16_0 = slot_0_40_0.ragebot.safety.safe_points:get() == "Force" and slot_0_52_0("Safe Points")
	slot_188_17_0 = slot_0_40_0.ragebot.safety.body_aim:get() == "Force" and slot_0_52_0("Body Aim")
	slot_188_18_0 = slot_0_52_0("Min. Damage")

	if slot_188_10_0 and slot_188_2_0:get("Fake Latency") then
		slot_0_61_0:add("PING", slot_188_9_0)
	end

	if slot_188_12_0 and slot_188_2_0:get("Fake Duck") then
		slot_0_61_0:add("DUCK")
	elseif slot_188_13_0 and slot_188_2_0:get("Double Tap") then
		slot_0_61_0:add("DT", rage.exploit:get() == 1 and color(255, 200) or color(255, 0, 50, 255))
	elseif slot_188_14_0 and slot_188_2_0:get("Hide Shots") then
		slot_0_61_0:add("OSAA")
	end

	if slot_188_17_0 and slot_188_2_0:get("Body Aim") then
		slot_0_61_0:add("BA")
	end

	if slot_188_16_0 and slot_188_2_0:get("Safe Points") then
		slot_0_61_0:add("SP")
	end

	if slot_188_18_0 and slot_188_2_0:get("Minimum Damage") then
		slot_0_61_0:add("MD")
	end

	if slot_188_15_0 and slot_188_2_0:get("Freestanding") then
		slot_0_61_0:add("FS")
	end

	if slot_188_2_0:get("Bomb Info") then
		slot_188_19_0 = slot_0_39_0.planting
		slot_188_20_0 = slot_0_39_0.planted

		if slot_188_19_0.time > 0 then
			slot_0_61_0:add(slot_188_19_0.site, color(252, 243, 105, 255), true, 1 - slot_188_19_0.remaining)
		end

		if slot_188_20_0.time > 0 and slot_188_20_0.time - globals.curtime >= 0 then
			slot_0_61_0:add(string.format("%s - %.1fs", slot_188_20_0.site, slot_188_20_0.time - globals.curtime), color(255, 200), true)

			slot_188_21_0 = slot_0_39_0:get_damage(slot_188_0_0, entity.get_entities("CPlantedC4", true)[1])

			if slot_188_21_0 > 0 then
				slot_188_22_1 = slot_188_21_0 >= slot_188_0_0.m_iHealth
				slot_188_23_1 = slot_188_22_1 and "FATAL" or string.format("-%d HP", slot_188_21_0)
				slot_188_24_1 = slot_188_22_1 and color(255, 0, 50, 255) or color(252, 243, 105, 255)

				slot_0_61_0:add(slot_188_23_1, slot_188_24_1)
			end

			if slot_188_20_0.defuse_remaining > 0 then
				slot_188_22_0 = render.screen_size()
				slot_188_23_0 = 20
				slot_188_24_0 = slot_188_20_0.defuse_remaining
				slot_188_26_0 = slot_188_20_0.defuse_countdown <= slot_188_20_0.time and color(64, 200, 70, 160) or color(255, 0, 0, 125)

				render.rect(vector(), vector(slot_188_23_0, slot_188_22_0.y), color(0, 110))
				render.rect(vector(1, 1 + slot_188_22_0.y * (1 - slot_188_24_0)), vector(slot_188_23_0, slot_188_22_0.y) - 1, slot_188_26_0)
			end
		end
	end

	if slot_188_2_0:get("Hit Rate") then
		slot_0_61_0:add(string.format("%d%%", slot_0_70_4()))
	end

	if slot_188_11_0 and slot_188_2_0:get("Dormant Aimbot") then
		slot_0_61_0:add("DA")
	end
end)

slot_0_62_0 = {}
slot_0_64_2 = slot_0_50_0.in_game.aspect_ratio
slot_0_65_2 = slot_0_64_2.evaluate
slot_0_66_4 = 0
slot_0_67_5 = cvar.r_aspectratio

function slot_0_62_0.net_update_end()
	if not slot_0_64_2:get() then
		if slot_0_66_4 ~= 0 then
			slot_0_67_5:float(0, true)

			slot_0_66_4 = 0
		end

		return
	end

	if slot_0_66_4 ~= slot_0_65_2:get() then
		slot_0_67_5:float(slot_0_65_2:get() / 100, true)

		slot_0_66_4 = slot_0_65_2:get()
	end
end

function slot_0_62_0.shutdown()
	slot_0_67_5:float(0, true)
end

slot_0_63_0 = {}
slot_0_64_1 = slot_0_50_0.in_game.viewmodel
slot_0_65_1 = cvar.viewmodel_fov
slot_0_66_3 = cvar.viewmodel_offset_x
slot_0_67_4 = cvar.viewmodel_offset_y
slot_0_68_5 = cvar.viewmodel_offset_z
slot_0_69_6 = cvar.cl_righthand
slot_0_70_3 = {
	fov = tonumber(slot_0_65_1:string()),
	x = tonumber(slot_0_66_3:string()),
	y = tonumber(slot_0_67_4:string()),
	z = tonumber(slot_0_68_5:string()),
	righthand = tonumber(slot_0_69_6:string())
}
slot_0_71_4 = {
	fov = slot_0_70_3.fov,
	x = slot_0_70_3.x,
	y = slot_0_70_3.y,
	z = slot_0_70_3.z,
	righthand = slot_0_70_3.righthand
}
slot_0_72_5 = slot_0_3_0.new(slot_0_70_3.fov)
slot_0_73_5 = slot_0_3_0.new(slot_0_70_3.x)
slot_0_74_4 = slot_0_3_0.new(slot_0_70_3.y)
slot_0_75_5 = slot_0_3_0.new(slot_0_70_3.z)

function slot_0_76_6(arg_191_0)
	if arg_191_0.fov ~= slot_0_71_4.fov then
		slot_0_65_1:float(arg_191_0.fov, true)

		slot_0_71_4.fov = arg_191_0.fov
	end

	if arg_191_0.x ~= slot_0_71_4.x then
		slot_0_66_3:float(arg_191_0.x, true)

		slot_0_71_4.x = arg_191_0.x
	end

	if arg_191_0.y ~= slot_0_71_4.y then
		slot_0_67_4:float(arg_191_0.y, true)

		slot_0_71_4.y = arg_191_0.y
	end

	if arg_191_0.z ~= slot_0_71_4.z then
		slot_0_68_5:float(arg_191_0.z, true)

		slot_0_71_4.z = arg_191_0.z
	end
end

function slot_0_77_6()
	local var_192_0 = slot_0_64_1.value
	local var_192_1 = {
		fov = slot_0_72_5:update(0.05, var_192_0 and slot_0_64_1.fov.value * 0.1 or slot_0_70_3.fov),
		x = slot_0_73_5:update(0.05, var_192_0 and slot_0_64_1.x.value * 0.1 or slot_0_70_3.x),
		y = slot_0_74_4:update(0.05, var_192_0 and slot_0_64_1.y.value * 0.1 or slot_0_70_3.y),
		z = slot_0_75_5:update(0.05, var_192_0 and slot_0_64_1.z.value * 0.1 or slot_0_70_3.z)
	}

	slot_0_76_6(var_192_1)
end

function slot_0_63_0.render()
	local var_193_0 = entity.get_local_player():get_player_weapon()
	local var_193_1 = slot_0_70_3.righthand

	if var_193_0 and var_193_0:get_classid() == 107 and slot_0_64_1.opposite_knife_hand:get() then
		var_193_1 = slot_0_70_3.righthand == 1 and 0 or 1
	end

	if var_193_1 ~= slot_0_71_4.righthand then
		slot_0_69_6:int(var_193_1, true)

		slot_0_71_4.righthand = var_193_1
	end

	slot_0_77_6()
end

function slot_0_63_0.shutdown()
	slot_0_76_6(slot_0_70_3)
end

slot_0_64_0 = {}
slot_0_66_2 = slot_0_50_0.other.fake_duck
slot_0_67_3 = 0

function slot_0_68_4()
	if slot_0_67_3 >= 14 then
		slot_0_67_3 = 0
	end

	slot_0_67_3 = slot_0_67_3 + 1
end

function slot_0_69_5()
	slot_0_40_0.ragebot.hide_shots:override()
	slot_0_40_0.ragebot.double_tap:override()
end

function slot_0_64_0.createmove_run(arg_197_0)
	if not slot_0_66_2:get("Unlock speed") then
		return
	end

	local var_197_0 = entity.get_local_player()

	if not var_197_0 or not var_197_0:is_alive() then
		return
	end

	if slot_0_41_0.is_onground and slot_0_40_0.anti_aim.other.fake_duck:get() then
		arg_197_0.forwardmove = arg_197_0.forwardmove * 2
		arg_197_0.sidemove = arg_197_0.sidemove * 2
	end
end

function slot_0_64_0.createmove(arg_198_0)
	if not slot_0_66_2:get("Freeze time") or not slot_0_40_0.anti_aim.other.fake_duck:get() then
		slot_0_69_5()

		return
	end

	if not entity.get_local_player() then
		return
	end

	local var_198_0 = entity.get_game_rules()

	if var_198_0 == nil or not var_198_0.m_bFreezePeriod then
		return
	end

	slot_0_68_4()

	arg_198_0.in_duck = slot_0_67_3 > 7
	arg_198_0.send_packet = slot_0_67_3 == 14

	slot_0_40_0.ragebot.hide_shots:override(false)
	slot_0_40_0.ragebot.double_tap:override(false)
end

function slot_0_64_0.override_view(arg_199_0)
	if not slot_0_66_2:get("Freeze time") then
		return
	end

	local var_199_0 = entity.get_local_player()

	if not var_199_0 or not var_199_0:is_alive() then
		return
	end

	local var_199_1 = entity.get_game_rules()

	if var_199_1 == nil or not var_199_1.m_bFreezePeriod then
		return
	end

	if not slot_0_40_0.anti_aim.other.fake_duck:get() then
		return
	end

	arg_199_0.camera.z = var_199_0:get_origin().z + 64
end

function slot_0_64_0.shutdown()
	slot_0_69_5()
end

slot_0_65_0 = {}
slot_0_66_1 = ffi.load("user32")
slot_0_67_2 = slot_0_50_0.features.game_focus

ffi.cdef("            typedef void* HWND;\n            typedef int BOOL;\n            BOOL FlashWindow(HWND hWnd, BOOL bInvert);\n            HWND GetForegroundWindow(void);\n            BOOL SetForegroundWindow(HWND hWnd);\n        ")

slot_0_68_3 = utils.opcode_scan("engine.dll", "8B 0D ?? ?? ?? ?? 85 C9 74 16 8B 01 8B", 2) or slot_0_33_0("invalid signature")
slot_0_69_4 = ffi.cast("void**", ffi.cast("char*", ffi.cast("void***", slot_0_68_3)[0][0]) + 8)[0]

function slot_0_65_0.round_start()
	if not slot_0_67_2:get() then
		return
	end

	if slot_0_66_1.GetForegroundWindow() == slot_0_69_4 then
		return
	end

	if slot_0_67_2.flash:get() then
		slot_0_66_1.FlashWindow(slot_0_69_4, true)
	end

	if slot_0_67_2.focus:get() then
		slot_0_66_1.SetForegroundWindow(slot_0_69_4)
	end
end

slot_0_66_0 = {}
slot_0_67_1 = slot_0_50_0.features.fast_ladder

function slot_0_68_2()
	if slot_0_41_0.movetype ~= 9 then
		return false
	end

	if slot_0_41_0.is_onground then
		return false
	end

	return true
end

function slot_0_69_3(arg_203_0)
	if arg_203_0:get_weapon_info().weapon_type ~= 9 then
		return
	end

	if arg_203_0.m_fThrowTime == 0 then
		return false
	end

	return true
end

function slot_0_66_0.createmove(arg_204_0)
	if not slot_0_67_1.value then
		return
	end

	if not slot_0_68_2() then
		return
	end

	local var_204_0 = entity.get_local_player()

	if not var_204_0 then
		return
	end

	local var_204_1 = var_204_0:get_player_weapon()

	if var_204_1 == nil or slot_0_69_3(var_204_1) then
		return
	end

	local var_204_2 = var_204_0.m_vecLadderNormal

	if var_204_2:lengthsqr() == 0 then
		return
	end

	local var_204_3 = render.camera_angles()
	local var_204_4 = var_204_2:angles()
	local var_204_5 = var_204_4.y - var_204_3.y + 180
	local var_204_6 = var_204_4.x - var_204_3.x
	local var_204_7 = slot_0_7_0(var_204_5)
	local var_204_8 = slot_0_18_0(var_204_6, -89, 89)
	local var_204_9 = slot_0_8_0(var_204_7)
	local var_204_10 = 89
	local var_204_11 = -90
	local var_204_12 = var_204_8 < -45
	local var_204_13 = var_204_7 > 0
	local var_204_14 = arg_204_0.sidemove > 0
	local var_204_15 = arg_204_0.forwardmove > 0

	if var_204_9 > 70 and var_204_9 < 135 then
		if arg_204_0.forwardmove ~= 0 or arg_204_0.sidemove == 0 then
			return
		end

		if not var_204_13 then
			var_204_11 = -var_204_11
		end

		if var_204_13 then
			var_204_14 = not var_204_14
		end

		arg_204_0.in_back = var_204_14 and 1 or 0
		arg_204_0.in_forward = var_204_14 and 0 or 1

		if var_204_13 then
			var_204_14 = not var_204_14
		end

		arg_204_0.in_moveleft = var_204_14 and 1 or 0
		arg_204_0.in_moveright = var_204_14 and 0 or 1
		arg_204_0.view_angles.x = var_204_10
		arg_204_0.view_angles.y = slot_0_7_0(var_204_4.y + var_204_11)

		return
	end

	if arg_204_0.sidemove ~= 0 or arg_204_0.forwardmove == 0 then
		return
	end

	if not var_204_13 then
		var_204_11 = -var_204_11
	end

	if not var_204_12 then
		var_204_15 = not var_204_15
	end

	arg_204_0.in_back = var_204_15 and 0 or 1
	arg_204_0.in_forward = var_204_15 and 1 or 0

	if not var_204_13 then
		var_204_15 = not var_204_15
	end

	arg_204_0.in_moveleft = var_204_15 and 1 or 0
	arg_204_0.in_moveright = var_204_15 and 0 or 1
	arg_204_0.view_angles.x = var_204_10
	arg_204_0.view_angles.y = slot_0_7_0(var_204_4.y + var_204_11)
end

slot_0_67_0 = {}
slot_0_68_1 = slot_0_50_0.features.grenade_features

function slot_0_69_2()
	local var_205_0 = entity.get_local_player()

	if not var_205_0 then
		return
	end

	local var_205_1 = var_205_0:get_player_weapon()

	if not var_205_1 then
		return
	end

	if var_205_1:get_weapon_info().weapon_type ~= 9 then
		return false
	end

	if var_205_1.m_fThrowTime < globals.curtime - to_time(globals.clock_offset) then
		return false
	end

	return true
end

function slot_0_67_0.createmove(arg_206_0)
	if not slot_0_68_1.throw_fix.value then
		return
	end

	if not slot_0_69_2() then
		return
	end

	rage.exploit:allow_defensive(false)

	arg_206_0.no_choke = true
end

slot_0_68_0 = {}
slot_0_69_1 = slot_0_50_0.features.grenade_features
slot_0_70_2 = slot_0_69_1.auto_release
slot_0_71_3 = nil
slot_0_72_4 = -1

function slot_0_68_0.grenade_prediction(arg_207_0)
	slot_0_71_3 = nil
	slot_0_72_4 = -1

	if arg_207_0.target ~= nil then
		slot_0_71_3 = arg_207_0
		slot_0_72_4 = globals.tickcount
	end
end

function slot_0_68_0.createmove(arg_208_0)
	if not slot_0_69_1:get() or not slot_0_70_2.value or slot_0_72_4 == -1 or arg_208_0.tickcount ~= slot_0_72_4 or slot_0_71_3 == nil then
		return
	end

	local var_208_0 = entity.get_local_player()

	if not var_208_0 then
		return
	end

	local var_208_1 = var_208_0:get_player_weapon()

	if not var_208_1 or not var_208_1.m_bPinPulled then
		return
	end

	local var_208_2 = slot_0_71_3.type

	if var_208_2 == "Frag" and not (slot_0_71_3.damage >= slot_0_69_1.damage:get()) and not slot_0_71_3.fatal then
		return
	end

	if var_208_2 == "Molly" and not slot_0_69_1.molotov:get() then
		return
	end

	arg_208_0.in_attack = 0
	arg_208_0.in_attack2 = 0
end

slot_0_69_0 = {}
slot_0_70_1 = slot_0_50_0.features.grenade_features
slot_0_71_2 = slot_0_70_1.super_toss
slot_0_72_3 = 0.3

function slot_0_73_4(arg_209_0, arg_209_1, arg_209_2, arg_209_3)
	arg_209_0.x = arg_209_0.x - 10 + math.abs(arg_209_0.x) / 9

	local var_209_0 = vector():angles(arg_209_0)
	local var_209_1 = arg_209_3 * 1.25
	local var_209_2 = math.clamp(arg_209_1 * 0.9, 15, 750)
	local var_209_3 = math.clamp(arg_209_2, 0, 1)
	local var_209_4 = var_209_2 * slot_0_20_0(slot_0_72_3, 1, var_209_3)
	local var_209_5 = var_209_0

	for iter_209_0 = 1, 8 do
		local var_209_6 = (var_209_5 * var_209_4 + var_209_1):length()

		if var_209_6 < 0.001 then
			break
		end

		var_209_5 = (var_209_0 * var_209_6 - var_209_1) / var_209_4

		local var_209_7 = var_209_5:length()

		if var_209_7 < 0.001 then
			var_209_5 = var_209_0
		else
			var_209_5 = var_209_5 / var_209_7
		end
	end

	local var_209_8 = var_209_5:angles()

	if var_209_8.x > -10 then
		var_209_8.x = 0.9 * var_209_8.x + 9
	else
		var_209_8.x = 1.125 * var_209_8.x + 11.25
	end

	return var_209_8
end

function slot_0_69_0.createmove(arg_210_0)
	if not slot_0_70_1:get() or not slot_0_71_2:get() then
		return
	end

	local var_210_0 = entity.get_local_player()

	if not var_210_0 then
		return
	end

	local var_210_1 = var_210_0:get_player_weapon()

	if not var_210_1 then
		return
	end

	local var_210_2 = var_210_1:get_weapon_info()

	if not var_210_2 or var_210_2.weapon_type ~= 9 then
		return
	end

	if var_210_1.m_fThrowTime < globals.curtime - to_time(globals.clock_offset) or not arg_210_0.jitter_move then
		return
	end

	local var_210_3 = var_210_0:simulate_movement()

	var_210_3:think()

	arg_210_0.view_angles = slot_0_73_4(arg_210_0.view_angles, var_210_2.throw_velocity, var_210_1.m_flThrowStrength, var_210_3.velocity)
end

function slot_0_69_0.grenade_override_view(arg_211_0)
	if not slot_0_70_1:get() or not slot_0_71_2:get() then
		return
	end

	local var_211_0 = entity.get_local_player()

	if not var_211_0 then
		return
	end

	local var_211_1 = var_211_0:get_player_weapon()

	if not var_211_1 then
		return
	end

	local var_211_2 = var_211_1:get_weapon_info()

	if not var_211_2 then
		return
	end

	arg_211_0.angles = slot_0_73_4(arg_211_0.angles, var_211_2.throw_velocity, var_211_1.m_flThrowStrength, arg_211_0.velocity)
end

slot_0_70_0 = {}
slot_0_71_1 = slot_0_50_0.other.unlock_latency
slot_0_72_2 = cvar.sv_maxunlag
slot_0_73_3 = 0

function slot_0_70_0.render(arg_212_0)
	if not slot_0_71_1:get() then
		if slot_0_73_3 ~= slot_0_72_2:float() then
			slot_0_72_2:float(0.2, true)

			slot_0_73_3 = 0.2
		end

		return
	end

	if slot_0_73_3 ~= slot_0_72_2:float() then
		slot_0_72_2:float(0.6, true)

		slot_0_73_3 = 0.6
	end
end

function slot_0_70_0.shutdown()
	slot_0_72_2:float(0.2, true)
end

slot_0_71_0 = {}
slot_0_72_1 = slot_0_50_0.other.no_fall_damage
slot_0_73_2 = cvar.sv_gravity
slot_0_74_3 = utils.get_vfunc(76, "float*(__thiscall*)(void*)")
slot_0_75_4 = utils.get_vfunc(77, "float*(__thiscall*)(void*)")

function slot_0_76_5(arg_214_0, arg_214_1, arg_214_2)
	local var_214_0 = slot_0_74_3(arg_214_0[0])
	local var_214_1 = slot_0_75_4(arg_214_0[0])
	local var_214_2 = vector(var_214_0[0], var_214_0[1], var_214_0[2])
	local var_214_3 = vector(var_214_1[0], var_214_1[1], 54)
	local var_214_4 = utils.trace_hull(arg_214_1, arg_214_1 - vector(0, 0, arg_214_2), var_214_2, var_214_3, arg_214_0, 1)

	return var_214_4.fraction < 1 and not var_214_4.start_solid and not var_214_4.all_solid and var_214_4.plane.normal.z >= 0.7, var_214_4
end

function slot_0_77_5(arg_215_0, arg_215_1)
	local var_215_0 = globals.tickinterval
	local var_215_1 = slot_0_73_2:float() * var_215_0 * 0.5
	local var_215_2 = arg_215_0
	local var_215_3 = arg_215_1
	local var_215_4
	local var_215_5

	while var_215_2 > 11 do
		local var_215_6 = var_215_3 - var_215_1
		local var_215_7 = var_215_0 * var_215_6

		var_215_3 = var_215_6 - var_215_1
		var_215_2 = var_215_2 + var_215_7
	end

	return var_215_3 <= -580 and var_215_2 >= 9
end

function slot_0_71_0.createmove(arg_216_0)
	if not slot_0_72_1.value then
		return
	end

	local var_216_0 = entity.get_local_player()
	local var_216_1 = bit.band(var_216_0.m_fFlags, 1) == 1

	if var_216_0.m_MoveType == 2 and not var_216_1 then
		local var_216_2 = var_216_0:get_origin()

		if bit.band(var_216_0.m_fFlags, 2) == 0 then
			var_216_2.z = var_216_2.z + 9
		end

		local var_216_3, var_216_4 = slot_0_76_5(var_216_0, var_216_2, 1000)

		if var_216_3 then
			local var_216_5 = var_216_4.fraction * 1000
			local var_216_6 = var_216_0.m_vecVelocity.z

			if var_216_6 >= 0 or var_216_5 >= 11 then
				if not slot_0_77_5(var_216_5, var_216_6) then
					return
				else
					arg_216_0.in_duck = 1
					arg_216_0.in_jump = 0

					return
				end
			elseif var_216_6 < -580 and var_216_5 > 9 then
				arg_216_0.in_jump = 1
				arg_216_0.in_duck = 0

				return
			end
		end
	end
end

slot_0_72_0 = {}
slot_0_73_1 = slot_0_50_0.other.air_collision
slot_0_74_2 = ui.find("Miscellaneous", "Main", "Movement", "Air Strafe", "WASD Strafe")
slot_0_75_3 = ui.find("Miscellaneous", "Main", "Movement", "Edge Jump")
slot_0_76_4 = 450
slot_0_77_4 = 46
slot_0_78_4 = 36
slot_0_79_5 = 20
slot_0_80_6 = 33636363
slot_0_81_6 = 536870912

function slot_0_72_0.createmove(arg_217_0)
	if not slot_0_73_1.value then
		return
	end

	if slot_0_75_3:get_override() or slot_0_75_3:get() then
		return
	end

	local var_217_0 = entity.get_local_player()

	if var_217_0.m_MoveType ~= 2 then
		return
	end

	if bit.band(var_217_0.m_fFlags, 1) == 1 then
		return
	end

	if arg_217_0.in_duck or arg_217_0.in_speed then
		return
	end

	local var_217_1 = var_217_0.m_vecVelocity
	local var_217_2 = var_217_0.m_vecMins
	local var_217_3 = var_217_0.m_vecMaxs
	local var_217_4 = vector():angles(0, arg_217_0.view_angles.y)
	local var_217_5 = var_217_4:vectors()
	local var_217_6 = 0
	local var_217_7 = 0

	if arg_217_0.sidemove == 0 then
		var_217_6 = slot_0_76_4
	end

	if slot_0_74_2:get() then
		var_217_6 = arg_217_0.forwardmove == 0 and arg_217_0.sidemove == 0 and slot_0_76_4 or arg_217_0.forwardmove
		var_217_7 = arg_217_0.sidemove
	end

	local var_217_8 = vector(var_217_4.x * var_217_6 + var_217_5.x * var_217_7, var_217_4.y * var_217_6 + var_217_5.y * var_217_7)

	var_217_8:normalize()

	local var_217_9 = var_217_0:get_origin()

	var_217_9.z = var_217_9.z + slot_0_79_5
	var_217_1.z = 0
	var_217_3.z = slot_0_78_4

	local var_217_10 = var_217_1:normalized()

	if var_217_10:dot(var_217_8) <= 0 then
		return
	end

	local var_217_11 = var_217_9 + var_217_8 * slot_0_77_4
	local var_217_12 = utils.trace_hull(var_217_9, var_217_11, var_217_2, var_217_3, var_217_0, slot_0_80_6)
	local var_217_13 = var_217_12.plane.normal

	if not var_217_12:did_hit_world() then
		return
	end

	if math.abs(var_217_13.z) >= 0.1 then
		return
	end

	if bit.band(var_217_12.contents, slot_0_81_6) == slot_0_81_6 then
		return
	end

	if var_217_12.entity:is_breakable() then
		return
	end

	if var_217_10:dot(var_217_13) < -0.85 then
		var_217_10 = var_217_8
	end

	local var_217_14 = var_217_13:vectors()

	if var_217_14:dot(var_217_10) < 0 then
		var_217_14 = var_217_14 * -1
	end

	arg_217_0.move_yaw = math.deg(math.atan2(var_217_14.y, var_217_14.x))
	arg_217_0.forwardmove = slot_0_76_4
	arg_217_0.sidemove = 0
end

slot_0_73_0 = {}
slot_0_74_1 = slot_0_40_0.world.main.override_zoom.scope_overlay
slot_0_75_2 = slot_0_3_0.new(0)
slot_0_76_3 = slot_0_3_0.new(0)

function slot_0_73_0.render()
	local var_218_0 = entity.get_local_player()
	local var_218_1 = slot_0_30_0 * 0.5
	local var_218_2 = slot_0_50_0.in_game.custom_scope:get() and var_218_0 and var_218_0:is_alive() and var_218_0.m_bIsScoped

	slot_0_75_2:update(0.05, var_218_2 and 1 or 0)
	slot_0_74_1:override(slot_0_50_0.in_game.custom_scope:get() and "Remove All" or nil)

	if slot_0_75_2.value < 0.11 then
		return
	end

	local var_218_3 = slot_0_75_2.value
	local var_218_4 = slot_0_50_0.in_game.custom_scope.offset:get() * var_218_3
	local var_218_5 = slot_0_50_0.in_game.custom_scope.length:get() * var_218_3

	slot_0_76_3:update(0.05, common.is_button_down(9) and 120 or 255)

	local var_218_6 = slot_0_76_3.value
	local var_218_7 = slot_0_50_0.in_game.custom_scope.inverter.color:get()
	local var_218_8 = slot_0_50_0.in_game.custom_scope.inverter:get()
	local var_218_9 = var_218_7:alpha_modulate(var_218_8 and 0 or math.round(var_218_6))
	local var_218_10 = var_218_7:alpha_modulate(var_218_8 and math.round(255) or 0)

	render.gradient(var_218_1 + vector(var_218_4 + 1, 0), var_218_1 + vector(var_218_4 + var_218_5 + 1, 1), var_218_9, var_218_10, var_218_9, var_218_10)
	render.gradient(var_218_1 - vector(var_218_4, 0), var_218_1 - vector(var_218_4 + var_218_5, -1), var_218_9, var_218_10, var_218_9, var_218_10)
	render.gradient(var_218_1 + vector(0, var_218_4 + 1), var_218_1 + vector(1, var_218_4 + var_218_5 + 1), var_218_9, var_218_9, var_218_10, var_218_10)
	render.gradient(var_218_1 - vector(0, var_218_4), var_218_1 - vector(-1, var_218_4 + var_218_5), var_218_9, var_218_9, var_218_10, var_218_10)
end

slot_0_74_0 = {}
slot_0_75_1 = slot_0_50_0.indicators.screen_indicator
slot_0_76_2 = slot_0_75_1.glow
slot_0_77_3 = slot_0_50_0.style
slot_0_78_3 = slot_0_3_0.new(0)
slot_0_79_4 = slot_0_3_0.new(0)
slot_0_80_5 = color(0, 0, 0, 150)
slot_0_81_5 = slot_0_38_0.new("Crosshair"):set_pos(slot_0_30_0.y / 2 + 15, "y"):update(true)
slot_0_82_6 = 5
slot_0_83_6 = {
	"standing",
	"moving",
	"slowwalk",
	"ducking",
	"sneaking",
	"in air",
	"in air&c"
}
slot_0_84_5 = {
	{
		font = 4,
		text = function()
			local var_219_0 = slot_0_77_3.accent:get():alpha_modulate(255)
			local var_219_1 = color(50, 200)
			local var_219_2 = globals.realtime * 1.5

			return slot_0_24_0(slot_0_26_0.name, var_219_2, var_219_0, var_219_1)
		end,
		alpha = slot_0_3_0.new(0),
		update = function(arg_220_0)
			return arg_220_0.alpha:update(0.05, 1)
		end
	},
	{
		font = 2,
		text = function(arg_221_0)
			local var_221_0 = slot_0_48_0.get_statement()
			local var_221_1 = var_221_0 > 1 and slot_0_83_6[var_221_0 - 1] or "dead"

			return string.format("* %s *", string.upper(var_221_1))
		end,
		alpha = slot_0_3_0.new(0),
		update = function(arg_222_0)
			return arg_222_0.alpha:update(0.05, 1)
		end
	},
	{
		font = 2,
		text = function()
			return "DUCK"
		end,
		alpha = slot_0_3_0.new(0),
		update = function(arg_224_0)
			return arg_224_0.alpha:update(0.05, slot_0_40_0.anti_aim.other.fake_duck:get() and 1 or 0)
		end
	},
	{
		circle = true,
		font = 2,
		text = function()
			return "DT"
		end,
		alpha = slot_0_3_0.new(0),
		update = function(arg_226_0)
			local var_226_0 = slot_0_40_0.ragebot.double_tap:get()

			if slot_0_40_0.anti_aim.other.fake_duck:get() then
				var_226_0 = false
			end

			return arg_226_0.alpha:update(0.05, var_226_0 and 1 or 0)
		end,
		progress_circle = function(arg_227_0)
			return rage.exploit:get()
		end
	},
	{
		font = 2,
		text = function()
			return "HS"
		end,
		alpha = slot_0_3_0.new(0),
		update = function(arg_229_0)
			local var_229_0 = slot_0_40_0.ragebot.hide_shots:get()

			if slot_0_40_0.anti_aim.other.fake_duck:get() or slot_0_40_0.ragebot.double_tap:get() then
				var_229_0 = false
			end

			return arg_229_0.alpha:update(0.05, var_229_0 and 1 or 0)
		end
	},
	{
		font = 2,
		text = function()
			return "BODY"
		end,
		alpha = slot_0_3_0.new(0),
		update = function(arg_231_0)
			return arg_231_0.alpha:update(0.05, slot_0_52_0("Body Aim") and 1 or 0)
		end
	},
	{
		font = 2,
		text = function()
			return "SAFE"
		end,
		alpha = slot_0_3_0.new(0),
		update = function(arg_233_0)
			return arg_233_0.alpha:update(0.05, slot_0_52_0("Safe Points") and 1 or 0)
		end
	},
	{
		font = 2,
		text = function()
			return "DMG"
		end,
		alpha = slot_0_3_0.new(0),
		update = function(arg_235_0)
			return arg_235_0.alpha:update(0.05, slot_0_52_0("Min. Damage") and 1 or 0)
		end
	},
	{
		font = 2,
		text = function()
			return "FS"
		end,
		alpha = slot_0_3_0.new(0),
		update = function(arg_237_0)
			return arg_237_0.alpha:update(0.05, slot_0_52_0("Freestanding") and 1 or 0)
		end
	}
}

function slot_0_85_3(arg_238_0, arg_238_1, arg_238_2)
	if arg_238_1 < 0.01 then
		return
	end

	local var_238_0 = 0
	local var_238_1 = slot_0_77_3.accent:get()

	for iter_238_0 = 1, #slot_0_84_5 do
		local var_238_2 = slot_0_84_5[iter_238_0]
		local var_238_3 = var_238_2.font
		local var_238_4 = var_238_2.alpha.value

		if var_238_4 > 0.01 then
			local var_238_5 = var_238_2:text()
			local var_238_6 = render.measure_text(var_238_3, nil, var_238_5)
			local var_238_7 = math.round(255 * var_238_4 * arg_238_1)
			local var_238_8 = var_238_6
			local var_238_9 = 4
			local var_238_10 = 1

			if var_238_2.circle then
				var_238_8 = var_238_8 + vector(var_238_9 * 2 + var_238_10, 0)
			end

			local var_238_11 = arg_238_2 and slot_0_82_6 or -(var_238_8.x * 0.5)
			local var_238_12 = vector(arg_238_0.x + var_238_11, arg_238_0.y + var_238_0)

			if iter_238_0 == 1 and slot_0_76_2:get() then
				local var_238_13 = var_238_12 + vector(0, var_238_6.y * 0.5)

				render.shadow(var_238_13, var_238_13 + vector(var_238_6.x, 0), var_238_1:alpha_modulate(var_238_7))
			end

			render.text(var_238_3, var_238_12, color(255, var_238_7), nil, var_238_5)

			if var_238_2.circle then
				local var_238_14 = var_238_2:progress_circle()
				local var_238_15 = var_238_12 + vector(var_238_6.x + var_238_10 + var_238_9, var_238_6.y * 0.5)

				render.circle_outline(var_238_15, color(0, var_238_7 * 0.8), var_238_9, 0, 1, 2)
				render.circle_outline(var_238_15, var_238_1:alpha_modulate(var_238_7), var_238_9, 180, var_238_14, 1)
			end

			var_238_0 = var_238_0 + math.round((var_238_8.y - 2) * var_238_4)
		end
	end
end

function slot_0_86_3()
	local var_239_0 = entity.get_local_player()

	if not var_239_0 or not var_239_0:is_alive() then
		return 0, 0
	end

	local var_239_1 = var_239_0:get_player_weapon()
	local var_239_2 = var_239_1 and var_239_1:get_weapon_info()
	local var_239_3 = var_239_2 and var_239_2.weapon_type or 0
	local var_239_4 = slot_0_75_1:get() and 1 or 0

	if var_239_3 == 9 then
		var_239_4 = var_239_4 * 0.5
	end

	if slot_0_41_0.in_scoreboard then
		var_239_4 = 0
	end

	local var_239_5 = slot_0_78_3:update(0.05, var_239_4)

	if var_239_5 < 0.01 then
		return 0, 0
	end

	for iter_239_0 = 1, #slot_0_84_5 do
		slot_0_84_5[iter_239_0]:update()
	end

	slot_0_79_4:update(0.05, var_239_0.m_bIsScoped and 1 or 0)

	local var_239_6 = slot_0_79_4.value

	return var_239_5, var_239_6
end

function slot_0_81_5.render_callback(arg_240_0)
	local var_240_0, var_240_1 = slot_0_86_3()

	if var_240_0 < 0.01 then
		slot_0_81_5.is_active = false

		return
	end

	slot_0_81_5.is_active = true

	local var_240_2 = "nexus"
	local var_240_3 = render.measure_text(4, nil, var_240_2) + vector(0, 5)
	local var_240_4 = slot_0_81_5:get_pos() + vector(var_240_3.x * 0.5, 0)

	slot_0_85_3(var_240_4, var_240_0 * (1 - var_240_1), false)
	slot_0_85_3(var_240_4, var_240_0 * var_240_1, true)
	arg_240_0:set_min(vector(slot_0_30_0.x / 2, slot_0_30_0.y / 2 + 10))
	arg_240_0:set_max(vector(slot_0_30_0.x / 2, slot_0_30_0.y / 2 + 120))
	arg_240_0:set_rules({
		{
			horizontal = true,
			pos = vector(slot_0_30_0.x / 2, slot_0_30_0.y / 2 + 10),
			end_pos = vector(slot_0_30_0.x / 2, slot_0_30_0.y / 2 + 120)
		}
	})

	if slot_0_30_0.x * 0.5 - var_240_3.x * 0.5 ~= arg_240_0.pos.x then
		arg_240_0:set_pos(slot_0_30_0.x * 0.5 - var_240_3.x * 0.5, "x")
	end

	arg_240_0:set_size(var_240_3)
end

function slot_0_74_0.render()
	return
end

slot_0_75_0 = {}
slot_0_76_1 = slot_0_50_0.in_game.keep_transparency
slot_0_77_2 = slot_0_5_0.find("Visuals", "Players", "Self", "Chams", "Model", {
	transparency = "Transparency"
})

function slot_0_75_0.localplayer_transparency(arg_242_0)
	local var_242_0 = entity.get_local_player()

	if not var_242_0 then
		return
	end

	if not slot_0_76_1:get() then
		return arg_242_0
	end

	if slot_0_77_2:get() then
		return arg_242_0
	end

	if not slot_0_77_2.transparency:get("In scope") then
		return arg_242_0
	end

	local var_242_1 = var_242_0:get_player_weapon()

	if not var_242_1 then
		return
	end

	local var_242_2 = var_242_1.m_zoomLevel

	if not var_242_2 or var_242_2 == 0 then
		return
	end

	return 59
end

slot_0_76_0 = {}
slot_0_77_1 = slot_0_50_0.indicators.manual_arrows
slot_0_78_2 = 45
slot_0_79_3 = render.load_font("Verdana", 20, "abd")
slot_0_80_4 = render.load_font("Verdana", 27, "ab")
slot_0_81_4 = slot_0_3_0.new(0)
slot_0_82_5 = slot_0_3_0.new(0)
slot_0_83_5 = slot_0_3_0.new(0)
slot_0_84_4 = slot_0_3_0.new(0)

function slot_0_76_0.render()
	if not slot_0_77_1:get() then
		return
	end

	slot_243_0_0 = entity.get_local_player()

	if not slot_243_0_0 or not slot_243_0_0:is_alive() then
		return
	end

	slot_243_1_0 = slot_0_47_0.anti_aimbot.general.manual_yaw:get()
	slot_243_2_0 = slot_243_1_0 == "Left"
	slot_243_3_0 = slot_243_1_0 == "Right"

	slot_0_81_4:update(0.05, slot_243_2_0 and 1 or 0)
	slot_0_82_5:update(0.05, slot_243_3_0 and 1 or 0)
	slot_0_83_5:update(0.05, is_back and 1 or 0)
	slot_0_84_4:update(0.05, slot_243_0_0.m_bIsScoped and 1 or 0)

	slot_243_4_0 = -20 * slot_0_84_4.value
	slot_243_5_0 = slot_0_30_0 * 0.5 + vector(0, slot_243_4_0)
	slot_243_6_0 = slot_0_77_1.style:get()
	slot_243_7_0 = slot_0_50_0.style.accent:get()
	slot_243_8_0 = color(180, 180, 180, 0)

	if slot_243_6_0 == "Classic" then
		slot_243_9_1 = slot_0_79_3

		if slot_0_81_4.value > 0.01 then
			slot_243_10_3 = slot_0_81_4.value
			slot_243_11_3 = "<"
			slot_243_12_3 = render.measure_text(slot_243_9_1, "s", slot_243_11_3)
			slot_243_13_3 = slot_243_7_0:alpha_modulate(math.round(255 * slot_243_10_3))
			slot_243_14_3 = vector(slot_243_5_0.x - slot_243_12_3.x - slot_0_78_2 + 1, slot_243_5_0.y - slot_243_12_3.y * 0.5 - 1)

			render.text(slot_243_9_1, slot_243_14_3, slot_243_13_3, "s", slot_243_11_3)
		end

		if slot_0_82_5.value > 0.01 then
			slot_243_10_2 = slot_0_82_5.value
			slot_243_11_2 = ">"
			slot_243_12_2 = render.measure_text(slot_243_9_1, "s", slot_243_11_2)
			slot_243_13_2 = slot_243_7_0:alpha_modulate(math.round(255 * slot_243_10_2))
			slot_243_14_2 = vector(slot_243_5_0.x + slot_0_78_2, slot_243_5_0.y - slot_243_12_2.y * 0.5 - 1)

			render.text(slot_243_9_1, slot_243_14_2, slot_243_13_2, "s", slot_243_11_2)
		end
	elseif slot_243_6_0 == "Modern" then
		slot_243_9_0 = slot_0_80_4

		if slot_0_81_4.value > 0.01 then
			slot_243_10_1 = slot_0_81_4.value
			slot_243_11_1 = "⮜"
			slot_243_12_1 = render.measure_text(slot_243_9_0, "s", slot_243_11_1)
			slot_243_13_1 = slot_243_7_0:alpha_modulate(math.round(255 * slot_243_10_1))
			slot_243_14_1 = vector(slot_243_5_0.x - slot_243_12_1.x - slot_0_78_2 + 1, slot_243_5_0.y - slot_243_12_1.y * 0.5 - 1)
			slot_243_15_1 = vector(slot_243_14_1.x + slot_243_12_1.x * 0.5, slot_243_5_0.y)

			render.shadow(slot_243_15_1, slot_243_15_1, slot_243_13_1, slot_243_9_0.height + 4)
			render.text(slot_243_9_0, slot_243_14_1, slot_243_13_1, "s", slot_243_11_1)
		end

		if slot_0_82_5.value > 0.01 then
			slot_243_10_0 = slot_0_82_5.value
			slot_243_11_0 = "⮞"
			slot_243_12_0 = render.measure_text(slot_243_9_0, "s", slot_243_11_0)
			slot_243_13_0 = slot_243_7_0:alpha_modulate(math.round(255 * slot_243_10_0))
			slot_243_14_0 = vector(slot_243_5_0.x + slot_0_78_2, slot_243_5_0.y - slot_243_12_0.y * 0.5 - 1)
			slot_243_15_0 = vector(slot_243_14_0.x + slot_243_12_0.x * 0.5, slot_243_5_0.y)

			render.shadow(slot_243_15_0, slot_243_15_0, slot_243_13_0, slot_243_9_0.height + 4)
			render.text(slot_243_9_0, slot_243_14_0, slot_243_13_0, "s", slot_243_11_0)
		end
	end
end

slot_0_77_0 = {}
slot_0_78_1 = slot_0_50_0.indicators.damage_indicator
slot_0_79_2 = slot_0_5_0.find("Aimbot", "Ragebot", "Selection", "Min. Damage")
slot_0_80_3 = render.load_font("Verdana", 13, "ad")

function slot_0_81_3(arg_244_0)
	if not arg_244_0 then
		return false
	end

	local var_244_0 = arg_244_0:get_weapon_info()

	if not var_244_0 then
		return false
	end

	if var_244_0.weapon_type == 0 or var_244_0.weapon_type > 6 then
		return false
	end

	return true
end

slot_0_82_4 = slot_0_38_0.new("Damage Indicator"):set_pos(vector(slot_0_30_0.x / 2 + 8, slot_0_30_0.y / 2 - 8 - 12)):update(true)
slot_0_83_4 = slot_0_3_0.new(0)
slot_0_84_3 = slot_0_3_0.new(0)

function slot_0_82_4.render_callback(arg_245_0)
	local var_245_0 = entity.get_local_player()
	local var_245_1 = var_245_0 and var_245_0:is_alive()
	local var_245_2 = slot_0_78_1:get()
	local var_245_3 = var_245_1 and var_245_2 and 1 or 0

	if var_245_3 == 1 then
		local var_245_4 = var_245_0:get_player_weapon()

		if not slot_0_81_3(var_245_4) then
			var_245_3 = 0
		end
	end

	slot_0_83_4:update(0.05, var_245_3)

	if slot_0_83_4.value < 0.1 then
		return
	end

	local var_245_5 = slot_0_78_1.small:get() and 2 or slot_0_80_3
	local var_245_6 = slot_0_79_2:get()
	local var_245_7 = slot_0_84_3:update(0.05, var_245_6)
	local var_245_8 = math.floor(var_245_7 + 0.5)

	if slot_0_78_1.animated:get() then
		var_245_6 = var_245_8
	end

	if var_245_6 < 1 then
		var_245_6 = "A"
	elseif var_245_6 > 100 then
		var_245_6 = string.format("+%d", var_245_6 - 100)
	else
		var_245_6 = tostring(var_245_6)
	end

	local var_245_9 = render.measure_text(var_245_5, nil, var_245_6)
	local var_245_10 = color():alpha_modulate(math.round(255 * slot_0_83_4.value))

	render.text(var_245_5, arg_245_0.pos, var_245_10, nil, var_245_6)

	arg_245_0.is_centered = false
	arg_245_0.render_border = true

	arg_245_0:set_min(vector(slot_0_30_0.x / 2 - 100, slot_0_30_0.y / 2 - 100))
	arg_245_0:set_max(vector(slot_0_30_0.x / 2 + 100 - var_245_9.x, slot_0_30_0.y / 2 + 100 - var_245_9.y))
	arg_245_0:set_size(var_245_9)
end

slot_0_78_0 = {}
slot_0_79_1 = slot_0_50_0.other.edge_stop
slot_0_80_2 = slot_0_5_0.find("Miscellaneous", "Main", "Movement", "Edge Jump")

function slot_0_78_0.createmove(arg_246_0)
	if slot_0_79_1:get() or slot_0_79_1:get_override() then
		if arg_246_0.in_jump or slot_0_80_2:get() or slot_0_80_2:get_override() then
			return
		end

		local var_246_0 = entity.get_local_player()

		if not var_246_0 then
			return
		end

		local var_246_1 = var_246_0:simulate_movement()

		var_246_1:think(4)

		if var_246_1.velocity.z ~= 0 then
			arg_246_0.block_movement = 2
		end
	end
end

slot_0_79_0 = {}
slot_0_80_1 = slot_0_5_0.find("Aimbot", "Ragebot", "Main", "Peek Assist")
slot_0_81_2 = slot_0_5_0.find("Aimbot", "Ragebot", "Main", "Enabled", "Extended Backtrack")
slot_0_82_3 = slot_0_50_0.other.edge_stop
slot_0_83_3 = slot_0_47_0.anti_aimbot.general.freestanding

slot_0_50_0.rage.peek_assist:set_callback(function(arg_247_0)
	local var_247_0 = arg_247_0:get()

	slot_0_80_1:override(var_247_0 and arg_247_0.behaviors:get("Quick Peek") or nil)
	slot_0_81_2:override(var_247_0 and arg_247_0.behaviors:get("Extended Backtrack") or nil)
	slot_0_82_3:override(var_247_0 and arg_247_0.behaviors:get("Edge Stop") or nil)
	slot_0_83_3:override(var_247_0 and arg_247_0.behaviors:get("Freestanding") or nil)
end)

function slot_0_79_0.shutdown()
	slot_0_80_1:override()
	slot_0_81_2:override()
	slot_0_82_3:override()
end

slot_0_80_0 = {}
slot_0_81_1 = -1
slot_0_82_2 = 1
slot_0_83_2 = {
	{
		scale = 3,
		hitbox = "Head",
		vec = vector(0, 0, 58)
	},
	{
		scale = 6,
		hitbox = "Chest",
		vec = vector(0, 0, 50)
	},
	{
		scale = 5,
		hitbox = "Stomach",
		vec = vector(0, 0, 40)
	}
}
slot_0_84_2 = slot_0_5_0.find("Aimbot", "Ragebot", "Selection", "Min. Damage")
slot_0_85_2 = slot_0_50_0.rage.dormant_aimbot

function slot_0_86_2()
	local var_249_0 = {}
	local var_249_1 = entity.get_player_resource()

	for iter_249_0 = 1, globals.max_players do
		local var_249_2 = entity.get(iter_249_0)

		if var_249_2 and var_249_1.m_bConnected[iter_249_0] and var_249_2:is_enemy() and var_249_2:is_dormant() then
			table.insert(var_249_0, var_249_2)
		end
	end

	return var_249_0
end

function slot_0_87_2(arg_250_0, arg_250_1, arg_250_2)
	local var_250_0 = arg_250_0:to(arg_250_1):angles()
	local var_250_1 = math.rad(var_250_0.y + 90)
	local var_250_2 = vector(math.cos(var_250_1), math.sin(var_250_1), 0) * arg_250_2

	return {
		{
			text = "Middle",
			vec = arg_250_1
		},
		{
			text = "Left",
			vec = arg_250_1 + var_250_2
		},
		{
			text = "Right",
			vec = arg_250_1 - var_250_2
		}
	}
end

function slot_0_80_0.createmove(arg_251_0)
	local var_251_0 = entity.get_local_player()

	if not var_251_0 or not var_251_0:is_alive() or not slot_0_85_2:get() then
		return
	end

	local var_251_1 = var_251_0:get_player_weapon()

	if not var_251_1 then
		return
	end

	local var_251_2 = var_251_1:get_weapon_info()

	if not var_251_2 then
		return
	end

	local var_251_3 = var_251_1:get_inaccuracy()

	if not var_251_3 then
		return
	end

	if globals.tickcount < slot_0_81_1 then
		return
	end

	local var_251_4 = var_251_0:get_anim_state()

	if not var_251_4 or arg_251_0.in_jump and not var_251_4.on_ground then
		return
	end

	local var_251_5 = var_251_2.weapon_type

	if not (var_251_5 >= 1) or not (var_251_5 <= 6) or var_251_1.m_iClip1 <= 0 then
		return
	end

	local var_251_6 = slot_0_86_2()

	if #var_251_6 == 0 then
		return
	end

	local var_251_7 = slot_0_85_2.hitboxes:get()

	slot_0_82_2 = globals.tickcount % #var_251_6 ~= 0 and slot_0_82_2 + 1 or 1

	local var_251_8 = var_251_6[slot_0_82_2]

	if not var_251_8 then
		return
	end

	local var_251_9 = var_251_8:get_bbox()
	local var_251_10 = var_251_8:get_origin()
	local var_251_11 = var_251_8.m_flDuckAmount
	local var_251_12 = slot_0_85_2.accuracy:get()
	local var_251_13 = slot_0_85_2.damage:get() or slot_0_84_2:get()

	if var_251_13 > 100 then
		var_251_13 = var_251_13 - 100 + var_251_8.m_iHealth
	end

	local function var_251_14(arg_252_0, arg_252_1)
		for iter_252_0 = 1, #arg_252_0 do
			if arg_252_0[iter_252_0] == arg_252_1 then
				return true
			end
		end

		return false
	end

	local var_251_15 = {}

	for iter_251_0, iter_251_1 in ipairs(slot_0_83_2) do
		local var_251_16 = iter_251_1.vec

		if iter_251_1.hitbox == "Head" then
			var_251_16 = var_251_16 - vector(0, 0, 10 * var_251_11)
		elseif iter_251_1.hitbox == "Chest" then
			var_251_16 = var_251_16 - vector(0, 0, 4 * var_251_11)
		end

		if #var_251_7 == 0 or var_251_14(var_251_7, iter_251_1.hitbox) then
			table.insert(var_251_15, {
				vec = var_251_16,
				scale = iter_251_1.scale,
				hitbox = iter_251_1.hitbox
			})
		end
	end

	local var_251_17 = var_251_0:get_eye_position()
	local var_251_18 = var_251_0:get_simulation_time().current

	if not (var_251_2.is_revolver and var_251_18 > var_251_1.m_flNextPrimaryAttack or var_251_18 > math.max(var_251_0.m_flNextAttack, var_251_1.m_flNextPrimaryAttack, var_251_1.m_flNextSecondaryAttack)) or var_251_12 >= math.floor(var_251_9.alpha * 100) + 5 then
		return
	end

	local var_251_19

	for iter_251_2, iter_251_3 in ipairs(var_251_15) do
		local var_251_20 = slot_0_87_2(var_251_17, var_251_10 + iter_251_3.vec, iter_251_3.scale)

		for iter_251_4, iter_251_5 in ipairs(var_251_20) do
			local var_251_21, var_251_22 = utils.trace_bullet(var_251_0, var_251_17, iter_251_5.vec, function(arg_253_0)
				return arg_253_0 == var_251_8
			end)

			if var_251_22 and not var_251_22:is_visible() and var_251_21 ~= 0 and var_251_13 < var_251_21 then
				var_251_19 = iter_251_5.vec

				break
			end
		end

		if var_251_19 then
			break
		end
	end

	if not var_251_19 then
		return
	end

	local var_251_23 = var_251_17:to(var_251_19):angles()

	arg_251_0.block_movement = 1

	if slot_0_85_2.auto_scope:get() and not var_251_0.m_bIsScoped and not var_251_0.m_bResumeZoom and var_251_2.weapon_type == 5 and var_251_4.on_ground then
		arg_251_0.in_attack2 = true
	end

	if var_251_3 < 0.01 then
		arg_251_0.view_angles = var_251_23
		arg_251_0.in_attack = true
	end
end

function slot_0_80_0.round_start()
	slot_0_81_1 = globals.tickcount
end

slot_0_81_0 = {}
slot_0_82_1 = slot_0_47_0.settings.style
slot_0_83_1 = {}
slot_0_84_1 = slot_0_50_0.rage.logs
slot_0_85_1 = slot_0_84_1.display
slot_0_86_1 = 5
slot_0_87_1 = slot_0_38_0.new("Aimbot Logs"):set_pos(vector(slot_0_86_1, slot_0_86_1)):update(true)
slot_0_88_1 = {
	[0] = "generic",
	"head",
	"chest",
	"stomach",
	"left arm",
	"right arm",
	"left leg",
	"right leg",
	"neck",
	"generic",
	"gear"
}

function slot_0_89_1(arg_255_0)
	return arg_255_0:to_hex()
end

function slot_0_81_0.add(arg_256_0, arg_256_1, arg_256_2, arg_256_3)
	if slot_0_22_0(arg_256_2, "Screen") then
		if #slot_0_83_1 >= 10 then
			table.remove(slot_0_83_1, #slot_0_83_1)
		end

		slot_0_83_1[#slot_0_83_1 + 1] = {
			time = 4,
			text = arg_256_1.text,
			init_time = common.get_unixtime(),
			alpha = slot_0_3_0.new(0),
			accent = arg_256_3
		}
	end

	local var_256_0 = slot_0_5_0.string(string.format("\a%s%s \a646464ff» \r%s", arg_256_3:alpha_modulate(255):to_hex(), "nexus", arg_256_1.text_console))

	if slot_0_22_0(arg_256_2, "Events") then
		print_dev(arg_256_1.text_console)
	end

	if slot_0_22_0(arg_256_2, "Console") then
		print_raw(var_256_0)
	end
end

slot_0_90_0 = {
	{
		type = "Hit",
		time = -1,
		text = "Killed \a%s" .. common.get_username() .. " \rin the \a%shead",
		alpha = slot_0_3_0.new(0)
	},
	{
		type = "Miss",
		text = "Missed at \a%ssqwat\r's \a%shead \rdue to \a%sspread",
		time = -1,
		alpha = slot_0_3_0.new(0)
	}
}

function slot_0_81_0.aim_ack(arg_257_0)
	if not slot_0_84_1:get() then
		return
	end

	local var_257_0 = arg_257_0.target

	if not var_257_0 then
		return
	end

	local var_257_1 = var_257_0:get_name()
	local var_257_2 = arg_257_0.damage or 0
	local var_257_3 = arg_257_0.wanted_damage or 0
	local var_257_4 = slot_0_88_1[arg_257_0.hitgroup] or "?"
	local var_257_5 = slot_0_88_1[arg_257_0.wanted_hitgroup] or "?"
	local var_257_6 = arg_257_0.backtrack or 0
	local var_257_7 = var_257_0.m_iHealth or 0
	local var_257_8 = math.floor((arg_257_0.hitchance or 0) + 0.5)
	local var_257_9 = arg_257_0.spread or 0
	local var_257_10 = arg_257_0.state
	local var_257_11 = slot_0_84_1.clr
	local var_257_12 = ""
	local var_257_13 = ""
	local var_257_14 = color():to_hex()

	if not var_257_10 then
		var_257_13 = string.format("^0Hit ^1%s^0's ^1%s^0(^1%s^0) for ^1%d^0(^1%d^0) damage %s(hc: ^1%s^0%% spread: ^1%.2f^0° bt: ^1%d^0t)", var_257_1, var_257_4, var_257_5, var_257_2, var_257_3, var_257_7 > 0 and string.format("(^1%s^0hp left)", var_257_7) or "", var_257_8, var_257_9, var_257_6)

		if var_257_7 > 0 then
			var_257_12 = string.format("Hit ^1%s^0's ^1%s ^0for ^1%d^0 damage (^1%s^0hp left)", var_257_1, var_257_4, var_257_2, var_257_7)
		else
			var_257_12 = string.format("Killed ^1%s^0 in ^1%s^0", var_257_1, var_257_4)
		end

		var_257_14 = var_257_11:get("Hit")[1]
	else
		var_257_13 = string.format("^0Missed at ^1%s^0's ^1%s^0 due to ^1%s^0 (^1%d^0 dmg)(hc: ^1%s^0%% spread: ^1%.2f^0° bt: ^1%d^0t)", var_257_1, var_257_5, var_257_10, var_257_3, var_257_8, var_257_9, var_257_6)
		var_257_12 = string.format("Missed at ^1%s^0 due to ^1%s", var_257_1, var_257_10)
		var_257_14 = var_257_11:get("Miss")[1]
	end

	local var_257_15 = var_257_13:gsub("%^1", "\a" .. slot_0_89_1(var_257_14)):gsub("%^0", "\affffffff")
	local var_257_16 = var_257_12:gsub("%^1", "\a" .. slot_0_89_1(var_257_14)):gsub("%^0", "\affffffff")

	slot_0_81_0:add({
		text = var_257_16,
		text_console = var_257_15
	}, slot_0_85_1:get(), var_257_14)
end

slot_0_91_0 = slot_0_3_0.new(0)

function slot_0_87_1.render_callback(arg_258_0)
	slot_258_1_0 = slot_0_83_1

	if #slot_258_1_0 == 0 then
		slot_258_1_0 = slot_0_90_0
	end

	arg_258_0.is_active = ui.get_alpha() > 0 and slot_0_84_1:get() and slot_0_85_1:get("Screen")
	slot_258_2_0 = common.get_unixtime()
	slot_258_3_0 = 0

	for iter_258_0, iter_258_1 in pairs(slot_258_1_0) do
		slot_258_9_0 = iter_258_1.accent
		slot_258_10_0 = iter_258_1.text

		if iter_258_1.type then
			slot_258_9_0 = slot_0_84_1.clr:get(iter_258_1.type)[1]:alpha_modulate(255)
			slot_258_10_0 = slot_0_5_0.string(iter_258_1.text:gsub("%%s", slot_258_9_0:to_hex()))
		end

		slot_258_11_0 = render.measure_text(slot_0_53_0, nil, slot_258_10_0)

		if iter_258_1.time == -1 or not math.clamp(iter_258_1.init_time + iter_258_1.time - slot_258_2_0, 0, iter_258_1.time) then
			slot_258_12_0 = 1
		end

		slot_258_13_0 = 0

		if iter_258_1.time == -1 then
			slot_258_13_0 = slot_0_84_1:get() and slot_0_85_1:get("Screen") and 255 or 0
		else
			slot_258_13_0 = math.clamp(iter_258_1.init_time + iter_258_1.time - slot_258_2_0, 0, iter_258_1.time) > 0 and 255 or 0
		end

		slot_258_14_0 = math.clamp(iter_258_1.alpha:update(0.075, slot_258_13_0), 0, 255)

		if iter_258_1.time == -1 then
			slot_258_14_0 = slot_258_14_0 * ui.get_alpha()
		end

		slot_258_15_0 = slot_258_11_0.x + slot_0_55_0 * 2
		slot_258_16_0 = slot_258_11_0.y + slot_0_55_0 * 1.5
		slot_258_17_0 = vector(slot_258_15_0, slot_258_16_0)
		slot_258_18_0 = slot_0_20_0(arg_258_0.pos.x + slot_0_86_1, arg_258_0.pos.x + arg_258_0.size.x * 0.5 - slot_258_17_0.x * 0.5, slot_0_91_0.value)
		slot_258_19_0 = vector(math.round(slot_258_18_0), slot_0_11_0(arg_258_0.pos.y + slot_0_86_1 + slot_258_3_0))

		slot_0_59_0(slot_258_19_0, slot_258_17_0, slot_258_14_0, slot_258_9_0, slot_0_82_1.accent:get().a / 255)
		render.text(slot_0_53_0, slot_258_19_0 + slot_258_17_0 * 0.5, color(255, slot_258_14_0), "c", slot_258_10_0)

		if iter_258_1.time == -1 then
			slot_258_3_0 = slot_258_3_0 + (slot_258_16_0 + slot_0_55_0)
		else
			slot_258_3_0 = slot_258_3_0 + (slot_258_16_0 + slot_0_55_0) * (slot_258_14_0 / 255)
		end
	end

	for iter_258_2, iter_258_3 in pairs(slot_258_1_0) do
		if iter_258_3.time ~= -1 and math.clamp(iter_258_3.init_time + iter_258_3.time - slot_258_2_0, 0, iter_258_3.time) <= 0 and iter_258_3.alpha.value <= 0 then
			table.remove(slot_0_83_1, iter_258_2)
		end
	end

	slot_0_91_0:update(0.05, arg_258_0.pos.x < slot_0_30_0.x / 3 and 0 or 1)
	arg_258_0:set_rules({
		{
			horizontal = true,
			pos = vector(arg_258_0.size.x * 0.5 + 10, 0)
		},
		{
			horizontal = false,
			pos = vector(10, 5 + arg_258_0.size.y * 0.5)
		},
		{
			horizontal = true,
			pos = slot_0_30_0 * 0.5
		}
	})
	arg_258_0:set_size(vector(266, 46 + slot_0_86_1))
end

function slot_0_81_0.render()
	return
end

function slot_0_49_0.render()
	slot_0_60_0.render()
	slot_0_70_0.render()
	slot_0_73_0.render()
	slot_0_74_0.render()
	slot_0_76_0.render()
	slot_0_81_0.render()
end

slot_0_82_0 = {}
slot_0_83_0 = slot_0_50_0.shared.icon
slot_0_84_0 = {
	XOR_KEY = 1514880045,
	SECURITY_KEY = "*v5_#fX9!zL2@mK8*",
	AUTHOR = "emptyspotify",
	DEV_ID = 1064967573,
	ID = 1064967572
}
slot_0_85_0 = {
	user = "https://raw.githubusercontent.com/emptyspotify/icons/main/nexus.png",
	dev = "https://raw.githubusercontent.com/emptyspotify/icons/main/nexus_dev.png"
}
slot_0_86_0 = 0
slot_0_87_0 = {}

function slot_0_88_0()
	slot_0_87_0 = {}

	local var_261_0 = entity.get_players(false, true)

	for iter_261_0, iter_261_1 in ipairs(var_261_0) do
		iter_261_1:set_icon()
	end

	local var_261_1 = entity.get_local_player()

	if var_261_1 then
		var_261_1:set_icon()
	end
end

function slot_0_89_0()
	slot_0_35_0.voice_message:call(function(arg_263_0)
		arg_263_0:write_bits(slot_0_84_0.ID, 32)

		if common.get_username() == slot_0_84_0.AUTHOR then
			arg_263_0:write_bits(slot_0_84_0.DEV_ID, 32)
		end

		arg_263_0:crypt(slot_0_84_0.SECURITY_KEY)
	end)
end

slot_0_83_0:set_callback(function(arg_264_0)
	if not arg_264_0:get() then
		slot_0_88_0()
	end
end)

function slot_0_82_0.render()
	if not slot_0_83_0:get() then
		return
	end

	local var_265_0 = entity.get_local_player()

	if not var_265_0 then
		return
	end

	local var_265_1 = common.get_username() == slot_0_84_0.AUTHOR

	var_265_0:set_icon(var_265_1 and slot_0_85_0.dev or slot_0_85_0.user)

	if math.abs(globals.realtime - slot_0_86_0) > 1 then
		slot_0_89_0()

		slot_0_86_0 = globals.realtime
	end

	local var_265_2 = globals.server_tick
	local var_265_3 = entity.get_players(false, true)
	local var_265_4 = {}

	for iter_265_0, iter_265_1 in ipairs(var_265_3) do
		local var_265_5 = iter_265_1:get_xuid()

		var_265_4[var_265_5] = true

		local var_265_6 = slot_0_87_0[var_265_5]

		if var_265_6 then
			if to_time(var_265_2 - var_265_6.last_heartbeat) > 3 then
				slot_0_87_0[var_265_5] = nil

				iter_265_1:set_icon()
			else
				iter_265_1:set_icon(var_265_6.is_author and slot_0_85_0.dev or slot_0_85_0.user)
			end
		end
	end

	for iter_265_2, iter_265_3 in pairs(slot_0_87_0) do
		if not var_265_4[iter_265_2] then
			slot_0_87_0[iter_265_2] = nil
		end
	end
end

function slot_0_82_0.voice_message(arg_266_0)
	local var_266_0 = arg_266_0.entity

	if not var_266_0 or var_266_0 == entity.get_local_player() then
		return
	end

	local var_266_1 = arg_266_0.buffer

	var_266_1:crypt(slot_0_84_0.SECURITY_KEY)

	local var_266_2 = var_266_1:read_bits(32)
	local var_266_3 = var_266_1:read_bits(32) == slot_0_84_0.DEV_ID

	if var_266_2 == slot_0_84_0.ID then
		local var_266_4 = var_266_0:get_xuid()

		slot_0_87_0[var_266_4] = {
			last_heartbeat = globals.server_tick,
			player = var_266_0,
			is_author = var_266_3
		}
	end
end

function slot_0_82_0.shutdown()
	local var_267_0 = entity.get_local_player()

	if not var_267_0 then
		return
	end

	var_267_0:set_icon()
end

function slot_0_49_0.shutdown()
	slot_0_70_0.shutdown()
	slot_0_63_0.shutdown()
	slot_0_79_0.shutdown()
	slot_0_64_0.shutdown()
	slot_0_82_0.shutdown()
	slot_0_62_0.shutdown()
end

function slot_0_49_0.createmove_run(arg_269_0)
	slot_0_64_0.createmove_run(arg_269_0)
end

function slot_0_49_0.voice_message(arg_270_0)
	slot_0_82_0.voice_message(arg_270_0)
end

function slot_0_49_0.createmove(arg_271_0)
	slot_0_66_0.createmove(arg_271_0)
	slot_0_67_0.createmove(arg_271_0)
	slot_0_68_0.createmove(arg_271_0)
	slot_0_72_0.createmove(arg_271_0)
	slot_0_78_0.createmove(arg_271_0)
	slot_0_80_0.createmove(arg_271_0)
	slot_0_64_0.createmove(arg_271_0)
end

function slot_0_49_0.aim_ack(arg_272_0)
	slot_0_81_0.aim_ack(arg_272_0)

	if not arg_272_0.state then
		slot_0_61_0:update("hits")
	else
		slot_0_61_0:update("misses")
	end
end

function slot_0_49_0.player_death(arg_273_0)
	return
end

function slot_0_49_0.round_start()
	slot_0_80_0.round_start()
	slot_0_65_0.round_start()
end

function slot_0_49_0.grenade_prediction(arg_275_0)
	slot_0_68_0.grenade_prediction(arg_275_0)
end

function slot_0_49_0.grenade_override_view(arg_276_0)
	slot_0_69_0.grenade_override_view(arg_276_0)
end

function slot_0_49_0.net_update_end()
	slot_0_62_0.net_update_end()
	slot_0_63_0.render()
	slot_0_82_0.render()
end

function slot_0_49_0.override_view(arg_278_0)
	slot_0_64_0.override_view(arg_278_0)
end

function slot_0_49_0.level_init()
	slot_0_60_0.level_init()
	slot_0_61_0:reset()
end

function slot_0_49_0.level_shutdown()
	slot_0_60_0.level_shutdown()
end

function slot_0_49_0.localplayer_transparency(arg_281_0)
	return slot_0_75_0.localplayer_transparency(arg_281_0)
end

slot_0_35_0.render(function()
	slot_0_49_0.render()
	slot_0_48_0.render()
end)
slot_0_35_0.createmove(function(arg_283_0)
	slot_0_41_0.createmove(arg_283_0)
	slot_0_48_0.createmove(arg_283_0)
	slot_0_49_0.createmove(arg_283_0)
end)
slot_0_35_0.voice_message(function(arg_284_0)
	slot_0_49_0.voice_message(arg_284_0)
end)
slot_0_35_0.override_view(function(arg_285_0)
	slot_0_49_0.override_view(arg_285_0)
end)
slot_0_35_0.aim_ack(function(arg_286_0)
	slot_0_49_0.aim_ack(arg_286_0)
end)
slot_0_35_0.player_death(function(arg_287_0)
	slot_0_49_0.player_death(arg_287_0)
end)
slot_0_35_0.round_start(function()
	slot_0_49_0.round_start()
end)
slot_0_35_0.run_command(function(arg_289_0)
	slot_0_41_0.run_command(arg_289_0)
end)
slot_0_35_0.net_update_end(function()
	slot_0_41_0.net_update_end()
	slot_0_49_0.net_update_end()
end)
slot_0_35_0.post_update_clientside_animation(function(arg_291_0)
	slot_0_48_0.post_update_clientside_animation(arg_291_0)
end)
slot_0_35_0.setup_command(function(arg_292_0)
	slot_0_41_0.setup_command(arg_292_0)
end)
slot_0_35_0.createmove_run(function(arg_293_0)
	slot_0_49_0.createmove_run(arg_293_0)
end)
slot_0_35_0.grenade_override_view(function(arg_294_0)
	slot_0_49_0.grenade_override_view(arg_294_0)
end)
slot_0_35_0.grenade_prediction(function(arg_295_0)
	slot_0_49_0.grenade_prediction(arg_295_0)
end)
slot_0_35_0.shutdown(function()
	slot_0_49_0.shutdown()
	slot_0_48_0.shutdown()
end)
slot_0_35_0.level_init(function()
	slot_0_49_0.level_init()
end)
slot_0_35_0.level_shutdown(function()
	slot_0_49_0.level_shutdown()
end)
slot_0_35_0.localplayer_transparency(function(arg_299_0)
	return slot_0_49_0.localplayer_transparency(arg_299_0)
end)
utils.execute_after(0.1, print_raw, string.format(slot_0_5_0.string("\vnexus\r loaded in \v%.2f\r ms"), (slot_0_0_0() - slot_0_46_0) * 1000))
