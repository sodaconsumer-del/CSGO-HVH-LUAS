--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol

slot_0_0_0 = "BETA"
slot_0_1_0 = {
	misc_subtick_autostop = true,
	jumpscout_vis_enabled = true,
	misc_auto_smoke = true,
	aa_freestanding = true,
	misc_quick_reload = true,
	misc_landing_autostop = true,
	misc_edge_stop = true,
	jumpscout_enabled = true,
	wb_enable = true,
	ai_peek_enabled = true,
	misc_auto_defuse = true
}

function slot_0_2_0(arg_1_0)
	if slot_0_0_0 ~= "LIVE" then
		return false
	end

	if slot_0_1_0[arg_1_0] then
		return true
	end

	if arg_1_0:find("acc_ap_enabled_") or arg_1_0:find("acc_dy_hc_enabled_") or arg_1_0:find("acc_lethal_mp_enabled_") then
		return true
	end

	if arg_1_0:find("ai_peek_") then
		return true
	end

	if arg_1_0:find("wb_") then
		return true
	end

	return false
end

slot_0_3_0 = {
	LocalVisibleChamsCol = nil,
	[0] = nil,
	LocalVisibleChams = gui.ctx:find("visuals>players>local>model>visible")
}

if slot_0_3_0.LocalVisibleChams then
	slot_0_3_0.LocalVisibleChamsCol = slot_0_3_0.LocalVisibleChams:find("Color")
end

slot_0_4_0 = {
	[0] = nil,
	Accent = draw.color(255, 255, 255, 255)
}
slot_0_5_0 = {
	HEAD = 0,
	NECK = 1,
	PELVIS = 2,
	THORAX = 3,
	CHEST = 4,
	UPPER_CHEST = 5,
	LEFT_UPPER_LEG = 12,
	RIGHT_UPPER_LEG = 13,
	LEFT_LOWER_LEG = 14,
	RIGHT_LOWER_LEG = 15,
	LEFT_FOOT = 16,
	RIGHT_FOOT = 17,
	LEFT_HAND = 10,
	RIGHT_HAND = 11,
	LEFT_UPPER_ARM = 6,
	LEFT_LOWER_ARM = 8,
	RIGHT_UPPER_ARM = 7,
	RIGHT_LOWER_ARM = 9,
	[0] = nil
}
slot_0_6_0 = {
	SIL_DB_CONFIGS = {}
}
slot_0_6_0.SIL_DB_INDEX_LOADED = false

if utils and utils.FileCreateDirectories then
	utils.FileCreateDirectories("fatality/silentium/")
end

slot_0_7_0 = bit or bit32 or {}

if not slot_0_7_0.band then
	function slot_0_7_0.band(arg_2_0, arg_2_1)
		return arg_2_1 <= arg_2_0 % (arg_2_1 + arg_2_1) and arg_2_0 or 0
	end
end

if not slot_0_7_0.rshift then
	function slot_0_7_0.rshift(arg_3_0, arg_3_1)
		return math.floor(arg_3_0 / 2^arg_3_1)
	end
end

function slot_0_8_0()
	if draw and draw.GetScale then
		return draw.GetScale()
	end

	return 1
end

function slot_0_9_0()
	if draw and draw.GetDisplay then
		local var_5_0 = draw.GetDisplay()

		if var_5_0 then
			return var_5_0.x, var_5_0.y
		end
	end

	return game.engine:GetScreenSize()
end

function slot_0_10_0()
	local var_6_0

	if gui and gui.input then
		var_6_0 = gui.input:Cursor()
	end

	if not var_6_0 and input then
		if input.get_cursor_pos then
			var_6_0 = input.get_cursor_pos()
		elseif input.get_mouse_pos then
			var_6_0 = input.get_mouse_pos()
		end
	end

	if not var_6_0 then
		return nil
	end

	local var_6_1 = slot_0_8_0()

	return {
		["draw a smooth, flowing path behind your player model"] = nil,
		x = var_6_0.x / var_6_1,
		y = var_6_0.y / var_6_1
	}
end

function slot_0_11_0()
	if gui and gui.input and gui.input.IsMouseDown and gui.MouseButton then
		return gui.input:IsMouseDown(gui.MouseButton.LEFT)
	end

	return false
end

function slot_0_6_0.get_resource_dir()
	-- local var_8_0 = ws and (ws.GetResourceDir or ws.get_resource_dir)

	-- if var_8_0 then
	-- 	local var_8_1 = var_8_0()

	-- 	if var_8_1 and var_8_1 ~= "" then
	-- 		local var_8_2 = var_8_1:gsub("\\", "/")

	-- 		if not var_8_2:match("/$") then
	-- 			var_8_2 = var_8_2 .. "/"
	-- 		end

	-- 		return var_8_2
	-- 	end
	-- end

	return "fatality/silentium/"
end

slot_0_6_0.SILENTIUM_DIR = "fatality/silentium/"

function slot_0_6_0.normalize_path_internal(arg_9_0)
	if not arg_9_0 then
		return ""
	end

	return arg_9_0:gsub("\\", "/"):gsub("^/", "")
end

function slot_0_6_0.ensure_dir_internal(arg_10_0)
	if not arg_10_0 then
		return
	end

	utils.FileCreateDirectories(arg_10_0)
end

function slot_0_6_0.sil_write_file(arg_11_0, arg_11_1)
	if not arg_11_0 or not arg_11_1 then
		return false
	end

	local var_11_0 = slot_0_6_0.normalize_path_internal(arg_11_0)
	local var_11_1 = var_11_0:match("(.*[/\\])")

	if var_11_1 then
		slot_0_6_0.ensure_dir_internal(var_11_1)
	end

	local var_11_2 = utils.StringToArray(tostring(arg_11_1))

	return utils.FileWrite(var_11_0, var_11_2) ~= false
end

function slot_0_6_0.sil_save_file(arg_12_0, arg_12_1)
	return slot_0_6_0.sil_write_file(arg_12_0, arg_12_1)
end

function slot_0_6_0.sil_read_file(arg_13_0)
	if not arg_13_0 then
		return nil
	end

	local var_13_0 = slot_0_6_0.normalize_path_internal(arg_13_0)

	if not utils.FileExists(var_13_0) then
		return nil
	end

	local var_13_1 = utils.FileRead(var_13_0)

	if var_13_1 and #var_13_1 > 0 then
		return utils.ArrayToString(var_13_1)
	end

	return nil
end

slot_0_12_0 = {}
slot_0_13_0 = 0
UI = {
	link_code_copied = false,
	cloud_scroll = 0,
	dpi_scale = 1,
	active_tab = "Home",
	cloud_scroll_target = 0,
	AnimationSpeed = 0.2,
	[0] = nil,
	mouse_keys = {},
	animations = {},
	snap_guides = {
		y = false,
		show = false,
		x = false
	},
	cfg = {
		config_active = false,
		config_input_text = ""
	},
	theme = {
		accent = {
			255,
			90,
			130,
			255,
			[0] = nil
		},
		text = {
			255,
			255,
			255,
			255,
			[0] = nil
		},
		text_dim = {
			150,
			150,
			160,
			255,
			[0] = nil
		}
	},
	group_heights = {},
	cloud_manager = {
		selected = nil
	}
}

setmetatable(UI.cfg, {
	__index = function(arg_14_0, arg_14_1)
		if slot_0_2_0(arg_14_1) then
			return false
		end

		return rawget(arg_14_0, arg_14_1)
	end
})

function slot_0_14_0(arg_15_0)
	if arg_15_0 == 40 then
		return "scout"
	elseif arg_15_0 == 9 then
		return "awp"
	elseif arg_15_0 == 11 or arg_15_0 == 38 then
		return "auto"
	elseif arg_15_0 == 1 or arg_15_0 == 64 then
		return "hpistol"
	elseif arg_15_0 == 4 or arg_15_0 == 61 or arg_15_0 == 32 or arg_15_0 == 2 or arg_15_0 == 36 or arg_15_0 == 63 or arg_15_0 == 3 or arg_15_0 == 30 then
		return "pistol"
	end

	return "global"
end

function UI.get_scale()
	return UI.dpi_scale or 1
end

function UI.refresh_fonts()
	if not UI.dpi_scale then
		local var_17_0 = 1
	end

	load_custom_fonts(true)
end

function UI.refresh_textures()
	return
end

slot_0_12_0.color_picker = draw.shader("        cbuffer cb : register(b0) {\n            float4x4 mvp;\n            float2 tex;\n            float time;\n            float alpha;\n        };\n        struct PS_INPUT {\n            float4 pos : SV_POSITION;\n            float4 col : COLOR0;\n            float2 uv : TEXCOORD0;\n        };\n        float3 HUEtoRGB(float H) {\n            float R = abs(H * 6 - 3) - 1;\n            float G = 2 - abs(H * 6 - 2);\n            float B = 2 - abs(H * 6 - 4);\n            return saturate(float3(R,G,B));\n        }\n        float3 HSVtoRGB(float3 HSV) {\n            float3 RGB = HUEtoRGB(HSV.x);\n            return ((RGB - 1) * HSV.y + 1) * HSV.z;\n        }\n        float4 main(PS_INPUT inp) : SV_Target {\n            float2 dir = inp.uv - float2(0.5, 0.5);\n            float dist = length(dir);\n            float angle = atan2(dir.y, dir.x) / (2.0 * 3.1415) + 0.5;\n            float4 clr = float4(HSVtoRGB(float3(angle, 1.0, 1.0)), 1.0 - smoothstep(0.48, 0.5, dist));\n            return clr;\n        }\n    ")

if draw.shaders and slot_0_12_0.color_picker then
	draw.shaders.color_picker = slot_0_12_0.color_picker
end

function is_enabled(arg_19_0)
	if slot_0_2_0(arg_19_0) then
		return false
	end

	return UI.cfg and UI.cfg[arg_19_0] == true
end

function log_console(arg_20_0)
	if is_enabled("hitlogs_console") then
		print(arg_20_0)
	end
end

function notify(arg_21_0, arg_21_1)
	log_console(string.format(" [Silentium] [%s] %s", (arg_21_1 or "info"):upper(), arg_21_0))
end

function slot_0_15_0(arg_22_0)
	if not arg_22_0 then
		return 255, 255, 255, 255
	end

	local var_22_0 = 0

	while type(arg_22_0) == "function" and var_22_0 < 5 do
		arg_22_0 = arg_22_0()
		var_22_0 = var_22_0 + 1
	end

	local var_22_1 = type(arg_22_0)

	if var_22_1 == "table" then
		return tonumber(arg_22_0[1] or arg_22_0.r or 255), tonumber(arg_22_0[2] or arg_22_0.g or 255), tonumber(arg_22_0[3] or arg_22_0.b or 255), tonumber(arg_22_0[4] or arg_22_0.a or 255)
	end

	if var_22_1 == "userdata" or var_22_1 == "Color" then
		if arg_22_0.get_r then
			return arg_22_0:get_r(), arg_22_0:get_g(), arg_22_0:get_b(), arg_22_0:get_a()
		end

		if arg_22_0.r then
			return arg_22_0.r, arg_22_0.g, arg_22_0.b, arg_22_0.a or 255
		end

		if arg_22_0.red then
			return arg_22_0.red, arg_22_0.green, arg_22_0.blue, arg_22_0.alpha or 255
		end

		if arg_22_0.RGBA then
			local var_22_2 = arg_22_0:RGBA()

			if var_22_2 and var_22_2 ~= 0 then
				return math.floor(var_22_2 / 16777216) % 256, math.floor(var_22_2 / 65536) % 256, math.floor(var_22_2 / 256) % 256, var_22_2 % 256
			end
		end
	end

	return 255, 255, 255, 255
end

function slot_0_16_0(arg_23_0, arg_23_1)
	if not arg_23_0 then
		return draw.Color(255, 255, 255, arg_23_1 or 255)
	end

	if type(arg_23_0) == "function" then
		arg_23_0 = arg_23_0()
	end

	if not arg_23_1 and (type(arg_23_0) == "userdata" or type(arg_23_0) == "Color") then
		return arg_23_0
	end

	if arg_23_1 and type(arg_23_0) == "userdata" and arg_23_0.a then
		local var_23_0 = arg_23_1 > 1 and arg_23_1 / 255 or arg_23_1

		return arg_23_0:a(var_23_0)
	end

	local var_23_1, var_23_2, var_23_3, var_23_4 = slot_0_15_0(arg_23_0)
	local var_23_5 = tonumber(arg_23_1 or var_23_4) or 255

	return draw.Color(math.floor(var_23_1), math.floor(var_23_2), math.floor(var_23_3), math.floor(var_23_5))
end

function slot_0_17_0(arg_24_0, arg_24_1, arg_24_2)
	if draw.color.interpolate then
		local var_24_0 = type(arg_24_0) == "table" and draw.Color(arg_24_0[1], arg_24_0[2], arg_24_0[3], arg_24_0[4]) or arg_24_0
		local var_24_1 = type(arg_24_1) == "table" and draw.Color(arg_24_1[1], arg_24_1[2], arg_24_1[3], arg_24_1[4]) or arg_24_1

		return draw.color.interpolate(var_24_0, var_24_1, arg_24_2)
	end

	local var_24_2, var_24_3, var_24_4, var_24_5 = slot_0_15_0(arg_24_0)
	local var_24_6, var_24_7, var_24_8, var_24_9 = slot_0_15_0(arg_24_1)

	return draw.Color(math.floor(math.Lerp(var_24_2, var_24_6, arg_24_2)), math.floor(math.Lerp(var_24_3, var_24_7, arg_24_2)), math.floor(math.Lerp(var_24_4, var_24_8, arg_24_2)), math.floor(math.Lerp(var_24_5, var_24_9, arg_24_2)))
end

function get_key_state(arg_25_0, arg_25_1)
	if not arg_25_0 or arg_25_0 == 0 then
		return false
	end

	if arg_25_0 <= 6 then
		if UI and UI.mouse_keys and UI.mouse_keys[arg_25_0] then
			return true
		end

		if gui and gui.input and gui.input.IsMouseDown and gui.MouseButton then
			local var_25_0 = gui.MouseButton

			if arg_25_0 == 1 then
				return gui.input:IsMouseDown(var_25_0.LEFT)
			end

			if arg_25_0 == 2 then
				return gui.input:IsMouseDown(var_25_0.RIGHT)
			end

			if arg_25_0 == 4 then
				return gui.input:IsMouseDown(var_25_0.MIDDLE)
			end

			if arg_25_0 == 5 then
				return gui.input:IsMouseDown(var_25_0.BACK or var_25_0.X1 or 5)
			end

			if arg_25_0 == 6 then
				return gui.input:IsMouseDown(var_25_0.FORWARD or var_25_0.X2 or 6)
			end
		end

		return false
	end

	if gui and gui.input and gui.input.IsKeyDown then
		return gui.input:IsKeyDown(arg_25_0)
	end

	return false
end

function slot_0_18_0(arg_26_0, arg_26_1, arg_26_2)
	if not UI.animations then
		UI.animations = {}
	end

	local var_26_0 = UI.animations[arg_26_0] or 0
	local var_26_1 = game.globalVars and game.globalVars.m_flAbsFrameTime or 0.016
	local var_26_2 = math.Lerp(var_26_0, arg_26_1, math.min(1, var_26_1 * arg_26_2))

	UI.animations[arg_26_0] = var_26_2

	return var_26_2
end

function slot_0_19_0(arg_27_0)
	if not arg_27_0 then
		return false
	end

	local function var_27_0(arg_28_0)
		if arg_28_0 == nil then
			return false
		end

		if (type(arg_28_0) == "table" or type(arg_28_0) == "userdata") and arg_28_0.get then
			arg_28_0 = arg_28_0:Get()
		end

		return arg_28_0 == 1 or arg_28_0 == true
	end

	if arg_27_0.get_prop then
		local var_27_1 = arg_27_0:get_prop("m_bIsScoped")

		if var_27_0(var_27_1) then
			return true
		end
	end

	if arg_27_0.is_scoped then
		local var_27_2 = arg_27_0:is_scoped()

		if var_27_0(var_27_2) then
			return true
		end
	end

	if arg_27_0.m_bIsScoped and var_27_0(arg_27_0.m_bIsScoped) then
		return true
	end

	return false
end

function slot_0_20_0(arg_29_0, arg_29_1, arg_29_2, arg_29_3, arg_29_4)
	if not arg_29_4 or not arg_29_0 or not arg_29_1 or not arg_29_2 or not arg_29_3 then
		return arg_29_0 or 0, arg_29_1 or 0
	end

	local var_29_0, var_29_1 = slot_0_9_0()

	if not var_29_0 then
		return arg_29_0, arg_29_1
	end

	local var_29_2 = var_29_0 / 2
	local var_29_3 = var_29_1 / 2
	local var_29_4 = 20

	UI.snap_guides.x, UI.snap_guides.y = false, false

	local var_29_5 = arg_29_0 + arg_29_2 / 2
	local var_29_6 = arg_29_1 + arg_29_3 / 2
	local var_29_7 = arg_29_0
	local var_29_8 = arg_29_1

	if var_29_4 > math.abs(var_29_5 - var_29_2) then
		var_29_7 = var_29_2 - arg_29_2 / 2
		UI.snap_guides.x = true
	end

	if var_29_4 > math.abs(var_29_6 - var_29_3) then
		var_29_8 = var_29_3 - arg_29_3 / 2
		UI.snap_guides.y = true
	end

	UI.snap_guides.show = UI.snap_guides.x or UI.snap_guides.y

	return var_29_7, var_29_8
end

slot_0_21_0 = nil

function slot_0_22_0()
	if not gui or not gui.ctx then
		return
	end

	local function var_30_0(arg_31_0)
		return gui.ctx:find(arg_31_0)
	end

	slot_0_21_0 = {
		[0] = nil,
		manual_l = var_30_0("rage>anti-aim>angles>manual override>override left"),
		manual_r = var_30_0("rage>anti-aim>angles>manual override>override right"),
		mindmg = var_30_0("rage>weapon>general>accuracy>min damage"),
		hitchance = var_30_0("rage>weapon>general>accuracy>hitchance"),
		dt = var_30_0("rage>aimbot>aimbot>double tap") or var_30_0("rage>aimbot>double tap"),
		fs = var_30_0("rage>aimbot>general>force shoot")
	}
end

function slot_0_23_0(arg_32_0, arg_32_1, arg_32_2)
	local var_32_0 = draw.surface
	local var_32_1 = draw.Color(0, 0, 0, 255)

	for iter_32_0 = -1, 1 do
		for iter_32_1 = -1, 1 do
			if iter_32_0 ~= 0 or iter_32_1 ~= 0 then
				var_32_0:AddText(draw.Vec2(arg_32_0.x + iter_32_0, arg_32_0.y + iter_32_1), arg_32_1, var_32_1)
			end
		end
	end

	var_32_0:AddText(arg_32_0, arg_32_1, arg_32_2)
end

function slot_0_24_0(arg_33_0, arg_33_1)
	if not arg_33_0 or not arg_33_1 or arg_33_1 == "" then
		return draw.Vec2(0, 0)
	end

	if arg_33_0.get_text_size then
		return arg_33_0:GetTextSize(arg_33_1)
	end

	local var_33_0 = draw.surface

	if var_33_0 and var_33_0.get_text_size then
		local var_33_1 = var_33_0.font

		var_33_0.font = arg_33_0

		local var_33_2 = var_33_0:GetTextSize(arg_33_1)

		var_33_0.font = var_33_1

		return var_33_2
	end

	return draw.Vec2(0, 0)
end

function slot_0_25_0(arg_34_0, arg_34_1, arg_34_2, arg_34_3)
	draw.surface:AddRectFilledRounded(arg_34_0, arg_34_1, arg_34_2)
end

function slot_0_26_0(arg_35_0, arg_35_1, arg_35_2, arg_35_3, arg_35_4, arg_35_5)
	local var_35_0 = draw.surface
	local var_35_1 = arg_35_4 or 1
	local var_35_2 = math.floor(arg_35_3 / 2)

	if var_35_0.add_background_blur then
		var_35_0:AddBackgroundBlur(draw.Rect(arg_35_0, arg_35_1, arg_35_0 + arg_35_2, arg_35_1 + arg_35_3), var_35_2)
	end

	var_35_0:AddRectFilledRounded(draw.Rect(arg_35_0, arg_35_1, arg_35_0 + arg_35_2, arg_35_1 + arg_35_3), draw.Color(20, 22, 30, math.floor(100 * var_35_1)), var_35_2, var_35_2)
	var_35_0:AddRectRounded(draw.Rect(arg_35_0, arg_35_1, arg_35_0 + arg_35_2, arg_35_1 + arg_35_3), draw.Color(255, 255, 255, math.floor(28 * var_35_1)), var_35_2, var_35_2, 1)
end

function slot_0_27_0()
	local var_36_0 = game.engine:get_netchan()

	if var_36_0 and not var_36_0:is_null() then
		local var_36_1 = var_36_0:get_latency()

		if var_36_1 then
			return math.floor(var_36_1 * 1000)
		end
	end

	return 0
end

if not utils then
	utils = {}
end

function utils.set_dropdown_value(arg_37_0, arg_37_1)
	if not arg_37_0 or not arg_37_0.GetValue then
		return
	end

	if arg_37_0.SetValue then
		arg_37_0:SetValue(arg_37_1)

		return
	end

	local var_37_0 = arg_37_0:GetValue()

	if not var_37_0 or not var_37_0.Get then
		return
	end

	local var_37_1 = var_37_0:Get()

	if type(var_37_1) == "userdata" and var_37_1.set_raw then
		local var_37_2 = tonumber(arg_37_1) or 0
		local var_37_3 = var_37_2 > 0 and 2^(var_37_2 - 1) or 0

		var_37_1:set_raw(var_37_3)
		var_37_0:Set(var_37_1)
	else
		var_37_0:Set(arg_37_1)
	end
end

function utils.random_int(arg_38_0, arg_38_1)
	return math.random(arg_38_0, arg_38_1)
end

function utils.random_float(arg_39_0, arg_39_1)
	return arg_39_0 + math.random() * (arg_39_1 - arg_39_0)
end

function utils.StringToArray(arg_40_0)
	local var_40_0 = {}

	for iter_40_0 = 1, #arg_40_0 do
		table.insert(var_40_0, string.byte(arg_40_0:sub(iter_40_0, iter_40_0)))
	end

	return var_40_0
end

function utils.url_encode(arg_41_0)
	if not arg_41_0 then
		return ""
	end

	arg_41_0 = arg_41_0:gsub("\n", "\r\n")
	arg_41_0 = arg_41_0:gsub("([^%w %-%_%.%~])", function(arg_42_0)
		return string.format("%%%02X", string.byte(arg_42_0))
	end)
	arg_41_0 = arg_41_0:gsub(" ", "+")

	return arg_41_0
end

slot_0_28_0 = {
	[0] = nil,
	instances = {},
	easings = {}
}

function slot_0_28_0.easings.linear(arg_43_0)
	return arg_43_0
end

function slot_0_28_0.easings.in_sine(arg_44_0)
	return 1 - math_cos(arg_44_0 * math_pi * 0.5)
end

function slot_0_28_0.easings.in_quad(arg_45_0)
	return arg_45_0 * arg_45_0
end

function slot_0_28_0.easings.in_cubic(arg_46_0)
	return arg_46_0 * arg_46_0 * arg_46_0
end

function slot_0_28_0.easings.in_quart(arg_47_0)
	return arg_47_0 * arg_47_0 * arg_47_0 * arg_47_0
end

function slot_0_28_0.easings.in_quint(arg_48_0)
	return arg_48_0 * arg_48_0 * arg_48_0 * arg_48_0 * arg_48_0
end

function slot_0_28_0.easings.in_circ(arg_49_0)
	return 1 - math_sqrt(1 - arg_49_0 * arg_49_0)
end

function slot_0_28_0.easings.in_expo(arg_50_0)
	return arg_50_0 == 0 and 0 or math_pow(2, 10 * arg_50_0 - 10)
end

function slot_0_28_0.easings.in_back(arg_51_0)
	local var_51_0 = 1.70158

	return (var_51_0 + 1) * arg_51_0 * arg_51_0 * arg_51_0 - var_51_0 * arg_51_0 * arg_51_0
end

function slot_0_28_0.easings.out_sine(arg_52_0)
	return math_sin(arg_52_0 * math_pi * 0.5)
end

function slot_0_28_0.easings.out_quad(arg_53_0)
	return 1 - (1 - arg_53_0) * (1 - arg_53_0)
end

function slot_0_28_0.easings.out_cubic(arg_54_0)
	return 1 - math_pow(1 - arg_54_0, 3)
end

function slot_0_28_0.easings.out_quart(arg_55_0)
	return 1 - math_pow(1 - arg_55_0, 4)
end

function slot_0_28_0.easings.out_quint(arg_56_0)
	return 1 - math_pow(1 - arg_56_0, 5)
end

function slot_0_28_0.easings.out_circ(arg_57_0)
	return math_sqrt(1 - (arg_57_0 - 1) * (arg_57_0 - 1))
end

function slot_0_28_0.easings.out_expo(arg_58_0)
	return arg_58_0 == 1 and 1 or 1 - math_pow(2, -10 * arg_58_0)
end

function slot_0_28_0.easings.out_back(arg_59_0)
	local var_59_0 = 1.70158

	return 1 + (var_59_0 + 1) * math_pow(arg_59_0 - 1, 3) + var_59_0 * math.pow(arg_59_0 - 1, 2)
end

function slot_0_28_0.easings.out_bounce(arg_60_0)
	local var_60_0 = 7.5625
	local var_60_1 = 2.75

	if arg_60_0 < 1 / var_60_1 then
		return var_60_0 * arg_60_0 * arg_60_0
	elseif arg_60_0 < 2 / var_60_1 then
		arg_60_0 = arg_60_0 - 1.5 / var_60_1

		return var_60_0 * arg_60_0 * arg_60_0 + 0.75
	elseif arg_60_0 < 2.5 / var_60_1 then
		arg_60_0 = arg_60_0 - 2.25 / var_60_1

		return var_60_0 * arg_60_0 * arg_60_0 + 0.9375
	else
		arg_60_0 = arg_60_0 - 2.625 / var_60_1

		return var_60_0 * arg_60_0 * arg_60_0 + 0.984375
	end
end

function slot_0_28_0.easings.in_out_sine(arg_61_0)
	return -(math_cos(math_pi * arg_61_0) - 1) * 0.5
end

function slot_0_28_0.create(arg_62_0, arg_62_1, arg_62_2, arg_62_3, arg_62_4)
	local var_62_0 = {
		destroyed = false,
		[0] = nil,
		duration = arg_62_1,
		start_time = game.globalVars.m_flRealTime,
		start_value = arg_62_2,
		end_value = arg_62_3,
		value = arg_62_2,
		easing = arg_62_4 or slot_0_28_0.easings.linear
	}

	slot_0_28_0.instances[#slot_0_28_0.instances + 1] = var_62_0

	return var_62_0
end

function slot_0_28_0.update(arg_63_0)
	local var_63_0 = game.globalVars.m_flRealTime
	local var_63_1 = 1

	for iter_63_0 = 1, #slot_0_28_0.instances do
		local var_63_2 = slot_0_28_0.instances[iter_63_0]

		if var_63_2 and not var_63_2.destroyed then
			local var_63_3 = var_63_0 - var_63_2.start_time

			if var_63_3 >= var_63_2.duration then
				var_63_2.value = var_63_2.end_value
				var_63_2.destroyed = true
			else
				local var_63_4 = var_63_3 / var_63_2.duration
				local var_63_5 = var_63_2.easing(var_63_4)

				var_63_2.value = var_63_2.start_value + (var_63_2.end_value - var_63_2.start_value) * var_63_5
				slot_0_28_0.instances[var_63_1] = var_63_2
				var_63_1 = var_63_1 + 1
			end
		end
	end

	for iter_63_1 = var_63_1, #slot_0_28_0.instances do
		slot_0_28_0.instances[iter_63_1] = nil
	end
end

slot_0_29_0 = {
	m_pSurfaceProperties = nil,
	Cache = {},
	Helpers = {}
}
slot_0_30_1 = gui.ctx.find

function gui.ctx.find(arg_64_0, arg_64_1)
	if not slot_0_29_0.Cache[arg_64_1] then
		slot_0_29_0.Cache[arg_64_1] = slot_0_30_1(gui.ctx, arg_64_1)
	end

	return slot_0_29_0.Cache[arg_64_1]
end

function slot_0_29_0.Helpers.GetComboValue(arg_65_0, arg_65_1)
	if not arg_65_0 or arg_65_0.type ~= 5 then
		return -1
	end

	local var_65_0 = arg_65_0:GetValue():Get()

	if type(var_65_0) ~= "number" then
		return -1
	end

	for iter_65_0 = 1, arg_65_1 do
		if slot_0_7_0.band(var_65_0, 2^(iter_65_0 - 1)) ~= 0 then
			return iter_65_0
		end
	end

	return -1
end

slot_0_31_1 = {
	["1"] = {
		category = "Heavy Pistols",
		name = "Desert Eagle"
	},
	["2"] = {
		category = "Pistols",
		name = "Dual Berettas",
		graph = nil
	},
	["3"] = {
		category = "Pistols",
		name = "Five-SeveN"
	},
	["4"] = {
		category = "Pistols",
		name = "Glock-18"
	},
	["7"] = {
		category = "Rifles",
		name = "AK-47"
	},
	["8"] = {
		category = "Rifles",
		name = "AUG"
	},
	["9"] = {
		category = "Bolt Snipers",
		name = "AWP"
	},
	["10"] = {
		category = "Rifles",
		name = "FAMAS"
	},
	["11"] = {
		category = "Auto Snipers",
		name = "G3SG1",
		Overlaps = nil
	},
	["13"] = {
		category = "Rifles",
		name = "Galil AR",
		["sol.DIcn"] = nil
	},
	["14"] = {
		category = "Heavy",
		name = "M249",
		[0] = nil
	},
	["16"] = {
		category = "Rifles",
		name = "M4A4",
		[0] = nil
	},
	["17"] = {
		category = "SMGs",
		name = "MAC-10",
		margin_bottom = nil
	},
	["19"] = {
		category = "SMGs",
		name = "P90",
		["sol.Hbi}"] = nil
	},
	["24"] = {
		category = "SMGs",
		name = "UMP-45",
		["sol.C7[U.user"] = nil
	},
	["25"] = {
		category = "Heavy",
		name = "XM1014",
		[0] = nil
	},
	["26"] = {
		category = "SMGs",
		name = "PP Bizon",
		W = nil
	},
	["27"] = {
		category = "Heavy",
		name = "MAG-7",
		[0] = nil
	},
	["28"] = {
		category = "Heavy",
		name = "Negev",
		[0] = nil
	},
	["29"] = {
		category = "Heavy",
		name = "Sawed Off",
		[0] = nil
	},
	["30"] = {
		category = "Pistols",
		name = "Tec-9",
		[0] = nil
	},
	["32"] = {
		category = "Pistols",
		name = "P2000",
		[0] = nil
	},
	["33"] = {
		category = "SMGs",
		name = "MP7",
		[0] = nil
	},
	["34"] = {
		category = "SMGs",
		name = "MP9",
		[0] = nil
	},
	["35"] = {
		category = "Heavy",
		name = "Nova",
		[0] = nil
	},
	["36"] = {
		category = "Pistols",
		name = "P250",
		[0] = nil
	},
	["38"] = {
		category = "Auto Snipers",
		name = "SCAR-20",
		[0] = nil
	},
	["39"] = {
		category = "Rifles",
		name = "SG 553",
		[0] = nil
	},
	["40"] = {
		category = "Bolt Snipers",
		name = "SSG-08",
		["sol.~]YS"] = nil
	},
	["60"] = {
		category = "Rifles",
		name = "M4A1-S"
	},
	["61"] = {
		category = "Pistols",
		name = "USP-S",
		[0] = nil
	},
	["63"] = {
		category = "Pistols",
		name = "CZ-75 Auto",
		[0] = nil
	},
	["64"] = {
		category = "Heavy Pistols",
		name = "R8 Revolver",
		["sol.BrFE.♻"] = nil
	}
}

function slot_0_29_0.Helpers.GetWeaponData(arg_66_0)
	local var_66_0 = slot_0_31_1[tostring(arg_66_0)]

	if var_66_0 then
		if gui.ctx:find("rage>weapon>" .. var_66_0.name .. ">weapon") then
			return {
				[0] = nil,
				mindamage = gui.ctx:find("rage>weapon>" .. var_66_0.name .. ">weapon>mindamage"),
				hitchance = gui.ctx:find("rage>weapon>" .. var_66_0.name .. ">weapon>hitchance"),
				pointscale = gui.ctx:find("rage>weapon>" .. var_66_0.name .. ">weapon>pointscale"),
				delay = gui.ctx:find("rage>weapon>" .. var_66_0.name .. ">extra>delay shot"),
				baim = gui.ctx:find("rage>aimbot>general>force bodyaim")
			}
		elseif gui.ctx:find("rage>weapon>" .. var_66_0.category .. ">weapon") then
			return {
				[0] = nil,
				mindamage = gui.ctx:find("rage>weapon>" .. var_66_0.category .. ">weapon>mindamage"),
				hitchance = gui.ctx:find("rage>weapon>" .. var_66_0.category .. ">weapon>hitchance"),
				pointscale = gui.ctx:find("rage>weapon>" .. var_66_0.category .. ">weapon>pointscale"),
				delay = gui.ctx:find("rage>weapon>" .. var_66_0.category .. ">extra>delay shot"),
				baim = gui.ctx:find("rage>aimbot>general>force bodyaim")
			}
		end
	end

	return {
		[0] = nil,
		mindamage = gui.ctx:find("rage>weapon>general>weapon>mindamage"),
		hitchance = gui.ctx:find("rage>weapon>general>weapon>hitchance"),
		pointscale = gui.ctx:find("rage>weapon>general>weapon>pointscale"),
		delay = gui.ctx:find("rage>weapon>general>extra>delay shot"),
		baim = gui.ctx:find("rage>aimbot>general>force bodyaim")
	}
end

slot_0_32_1 = false

function slot_0_29_0.Helpers.SafeSet(arg_67_0, arg_67_1)
	if arg_67_0 == nil or arg_67_1 == nil or slot_0_32_1 then
		return
	end

	if type(arg_67_0) ~= "userdata" or not arg_67_0.GetValue then
		return
	end

	local var_67_0 = arg_67_0:GetValue()

	if not var_67_0 or type(var_67_0) ~= "userdata" or not var_67_0.set or not var_67_0.get then
		return
	end

	local var_67_1 = var_67_0:Get()

	if var_67_1 == nil then
		return
	end

	local var_67_2 = type(var_67_1)
	local var_67_3 = type(arg_67_1)

	if var_67_2 == "number" then
		if var_67_3 == "boolean" then
			arg_67_1 = arg_67_1 and 1 or 0
		elseif var_67_3 ~= "number" then
			return
		end
	elseif var_67_2 == "boolean" then
		if var_67_3 == "number" then
			arg_67_1 = arg_67_1 ~= 0
		elseif var_67_3 ~= "boolean" then
			return
		end
	elseif var_67_2 ~= var_67_3 then
		return
	end

	if var_67_1 == arg_67_1 then
		return
	end

	slot_0_32_1 = true

	local var_67_4 = true

	var_67_0:Set(arg_67_1)

	slot_0_32_1 = false

	return var_67_4
end

slot_0_29_0.Helpers.SetValue = slot_0_29_0.Helpers.SafeSet

function slot_0_29_0.Helpers.GetHealth(arg_68_0)
	if not arg_68_0 then
		return 100
	end

	if arg_68_0.m_iHealth and arg_68_0.m_iHealth.get then
		return arg_68_0.m_iHealth:Get() or 100
	end

	if arg_68_0.get_health then
		return arg_68_0:GetHealth()
	end

	return 100
end

function slot_0_29_0.Helpers.Init(arg_69_0, arg_69_1)
	local var_69_0 = {
		id = gui.ctx:find(arg_69_0.id),
		id_string = arg_69_0.id,
		values = arg_69_0.values or 1
	}

	var_69_0.value = var_69_0.id.type == 5 and slot_0_29_0.Helpers.GetComboValue(var_69_0.id, var_69_0.values) or var_69_0.id:GetValue():Get()
	var_69_0.state = var_69_0.id:GetHotkeyState()

	if arg_69_1 then
		var_69_0.animation = {
			value = 0
		}
	end

	local function var_69_1(arg_70_0, arg_70_1, arg_70_2)
		if var_69_0.animation.end_value == arg_70_1 or var_69_0.animation.value == arg_70_1 then
			return var_69_0.animation or {
				["Max Distance"] = nil,
				value = arg_70_1
			}
		end

		return slot_0_28_0:create(AnimationSpeed, arg_70_0, arg_70_1, arg_70_2)
	end

	if arg_69_1 and var_69_0.state then
		var_69_0.animation = var_69_1(0, 1, slot_0_28_0.easings.out_sine)
	end

	var_69_0.id:AddCallback(function()
		var_69_0.value = var_69_0.id.type == 5 and slot_0_29_0.Helpers.GetComboValue(var_69_0.id, var_69_0.values) or var_69_0.id:GetValue():Get()
		var_69_0.state = var_69_0.id:GetHotkeyState()

		if var_69_0.animation then
			if var_69_0.state then
				var_69_0.animation = var_69_1(var_69_0.animation.value, 1, slot_0_28_0.easings.out_sine)
			elseif var_69_0.animation.value > 0 then
				var_69_0.animation = var_69_1(var_69_0.animation.value, 0, slot_0_28_0.easings.in_sine)
			end
		end
	end)

	function var_69_0.Set(arg_72_0, arg_72_1)
		var_69_0.id:GetValue():Set(arg_72_1)

		var_69_0.value = arg_72_1
	end

	return var_69_0
end

function slot_0_30_0()
	if gui and gui.ctx and gui.ctx.user and gui.ctx.user.username then
		return gui.ctx.user.username
	end

	if entities then
		if entities.get_local_controller then
			local var_73_0 = entities.get_local_controller()

			if var_73_0 and var_73_0.GetName then
				local var_73_1 = var_73_0:GetName()

				if var_73_1 and var_73_1 ~= "" then
					return var_73_1
				end
			end
		end

		if entities.GetLocalPawn then
			local var_73_2 = entities.GetLocalPawn()

			if var_73_2 and var_73_2.GetName then
				local var_73_3 = var_73_2:GetName()

				if var_73_3 and var_73_3 ~= "" then
					return var_73_3
				end
			end
		end
	end

	return "User"
end

function slot_0_31_0(arg_74_0, arg_74_1, arg_74_2)
	local var_74_0
	local var_74_1
	local var_74_2
	local var_74_3 = math.floor(arg_74_0 * 6)
	local var_74_4 = arg_74_0 * 6 - var_74_3
	local var_74_5 = arg_74_2 * (1 - arg_74_1)
	local var_74_6 = arg_74_2 * (1 - var_74_4 * arg_74_1)
	local var_74_7 = arg_74_2 * (1 - (1 - var_74_4) * arg_74_1)
	local var_74_8 = var_74_3 % 6

	if var_74_8 == 0 then
		var_74_0, var_74_1, var_74_2 = arg_74_2, var_74_7, var_74_5
	elseif var_74_8 == 1 then
		var_74_0, var_74_1, var_74_2 = var_74_6, arg_74_2, var_74_5
	elseif var_74_8 == 2 then
		var_74_0, var_74_1, var_74_2 = var_74_5, arg_74_2, var_74_7
	elseif var_74_8 == 3 then
		var_74_0, var_74_1, var_74_2 = var_74_5, var_74_6, arg_74_2
	elseif var_74_8 == 4 then
		var_74_0, var_74_1, var_74_2 = var_74_7, var_74_5, arg_74_2
	elseif var_74_8 == 5 then
		var_74_0, var_74_1, var_74_2 = arg_74_2, var_74_5, var_74_6
	end

	return math.floor(var_74_0 * 255), math.floor(var_74_1 * 255), math.floor(var_74_2 * 255)
end

function slot_0_32_0(arg_75_0, arg_75_1, arg_75_2)
	arg_75_0, arg_75_1, arg_75_2 = arg_75_0 / 255, arg_75_1 / 255, arg_75_2 / 255

	local var_75_0 = math.max(arg_75_0, arg_75_1, arg_75_2)
	local var_75_1 = math.min(arg_75_0, arg_75_1, arg_75_2)
	local var_75_2
	local var_75_3
	local var_75_4
	local var_75_5 = var_75_0
	local var_75_6 = var_75_0 - var_75_1
	local var_75_7 = var_75_0 == 0 and 0 or var_75_6 / var_75_0

	if var_75_0 == var_75_1 then
		var_75_2 = 0
	else
		if var_75_0 == arg_75_0 then
			var_75_2 = (arg_75_1 - arg_75_2) / var_75_6

			if arg_75_1 < arg_75_2 then
				var_75_2 = var_75_2 + 6
			end
		elseif var_75_0 == arg_75_1 then
			var_75_2 = (arg_75_2 - arg_75_0) / var_75_6 + 2
		elseif var_75_0 == arg_75_2 then
			var_75_2 = (arg_75_0 - arg_75_1) / var_75_6 + 4
		end

		var_75_2 = var_75_2 / 6
	end

	return var_75_2, var_75_7, var_75_5
end

function slot_0_33_0(arg_76_0, arg_76_1, arg_76_2, arg_76_3)
	if arg_76_3 then
		return string.format("#%02X%02X%02X%02X", arg_76_0, arg_76_1, arg_76_2, arg_76_3)
	end

	return string.format("#%02X%02X%02X", arg_76_0, arg_76_1, arg_76_2)
end

function slot_0_34_0(arg_77_0)
	arg_77_0 = arg_77_0:gsub("#", ""):gsub("0x", "")

	if #arg_77_0 == 6 then
		local var_77_0 = tonumber(arg_77_0:sub(1, 2), 16)
		local var_77_1 = tonumber(arg_77_0:sub(3, 4), 16)
		local var_77_2 = tonumber(arg_77_0:sub(5, 6), 16)

		if var_77_0 and var_77_1 and var_77_2 then
			return var_77_0, var_77_1, var_77_2, 255
		end
	elseif #arg_77_0 == 8 then
		local var_77_3 = tonumber(arg_77_0:sub(1, 2), 16)
		local var_77_4 = tonumber(arg_77_0:sub(3, 4), 16)
		local var_77_5 = tonumber(arg_77_0:sub(5, 6), 16)
		local var_77_6 = tonumber(arg_77_0:sub(7, 8), 16)

		if var_77_3 and var_77_4 and var_77_5 and var_77_6 then
			return var_77_3, var_77_4, var_77_5, var_77_6
		end
	end

	return nil
end

function slot_0_35_0(arg_78_0)
	if not arg_78_0 then
		return nil
	end

	if arg_78_0.GetAbsOrigin then
		return arg_78_0:GetAbsOrigin()
	end

	if arg_78_0.get_origin then
		return arg_78_0:get_origin()
	end

	if arg_78_0.get_render_origin then
		return arg_78_0:get_render_origin()
	end

	return nil
end

slot_0_36_0 = {
	slowed_dragging = false,
	aim_misses = 0,
	last_vel_z = 0,
	round_ended = false,
	enemies_outlived = 0,
	current_hand_state = -1,
	last_click_state = false,
	active = false,
	dragging = false,
	hitlogs_drag_off_x = 0,
	hitlogs_dragging = false,
	mouse_down = false,
	drag_offset_y = 0,
	drag_offset_x = 0,
	aa_manual_pulse_val = 0,
	last_land_time = 0,
	aa_manual_timer = 0,
	fps_update_time = 0,
	smoothed_fps = 0,
	quickswitch_was_scoped = false,
	quickswitch_should_rescope = false,
	was_on_ground = true,
	landing_old_sw_speed = 30,
	landing_old_sw_state = false,
	landing_autostop_override = false,
	landing_stop_tick = 0,
	last_sup_tick = 0,
	last_sup_yaw = 0,
	acc_last_target_time = 0,
	acc_last_target_idx = -1,
	netgraph_dragging = false,
	aa_last_side = 0,
	session_start_time = 0,
	session_kills = 0,
	rounds_played = 0,
	netgraph_drag_off_x = 0,
	netgraph_drag_off_y = 0,
	last_shot_hc = 0,
	rage_fs_crouch_old = false,
	rage_fs_crouch_forced = false,
	hitlogs_drag_off_y = 0,
	slowed_drag_y = 0,
	slowed_drag_x = 0,
	[0] = nil,
	username = slot_0_30_0(),
	logs = {},
	molotovs = {},
	smokes = {},
	sparks = {},
	damage_rings = {},
	bullet_impacts = {},
	killstreak = {
		best_streak = 0,
		last_kill_time = 0,
		pos_y = 60,
		dragging = false,
		count = 0
	},
	acc_cache = {
		ps = {},
		hc = {}
	},
	watermark = {
		chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()_+-=[]{}|;:,.<>?",
		current_text = "",
		is_decrypting = false,
		frame = 0,
		last_update = 0,
		last_effect = 0,
		target_text = "silentium",
		anim_progress = 0,
		dragging = false,
		drag_offset_x = 0,
		drag_offset_y = 0,
		[0] = nil
	},
	jump_circles = {},
	velocity = {
		pos_x = 20,
		dragging = false
	},
	floating_damage = {},
	soul_particles = {},
	trails = {},
	hitmarkers = {},
	keybinds = {
		pos_y = 400,
		pos_x = 20,
		dragging = false,
		list = {
			{
				name = "Double Tap",
				id = "rage>aimbot>doubletap"
			},
			{
				name = "Hide Shots",
				id = "rage>aimbot>hideshots",
				acc_dy_hc_key = nil
			},
			{
				name = "Safe Point",
				id = "rage>aimbot>safepoint",
				[0] = nil
			},
			{
				name = "Force Shoot",
				id = "rage>aimbot>general>force shoot"
			},
			{
				name = "Force Baim",
				id = "rage>aimbot>general>force bodyaim"
			},
			{
				name = "Min Damage",
				id = "rage>weapon>general>weapon>mindamage"
			},
			{
				name = "AI Peek",
				id = "custom_ai_peek"
			},
			{
				name = "Fake Duck",
				id = "misc>movement>duck peek assist"
			},
			{
				name = "Quick Peek",
				id = "misc>movement>peek assist",
				[0] = nil
			},
			{
				name = "Slowwalk",
				id = "misc>movement>slowwalk"
			},
			{
				name = "No Land Inaccuracy",
				id = "misc>movement>no land inaccuracy",
				[0] = nil
			},
			{
				name = "Force HAim",
				id = "rage>aimbot>general>headshot only",
				[0] = nil
			},
			{
				name = "Force Lethal Air",
				id = "rage>aimbot>general>force lethal in air",
				[0] = nil
			},
			{
				name = "Hitchance",
				id = "rage>weapon>general>weapon>hitchance"
			},
			{
				name = "Pointscale",
				id = "rage>weapon>general>weapon>pointscale"
			},
			{
				name = "Dynamic HC",
				id = "custom_dynamic_hc",
				[0] = nil
			},
			{
				name = "Auto Pointscale",
				id = "custom_auto_ps"
			},
			{
				name = "Edge Stop",
				id = "misc_edge_stop"
			},
			{
				name = "Freestanding",
				id = "custom_freestanding"
			}
		}
	},
	clantag = {
		last_update = 0,
		last_tag = "",
		animation_idx = 0,
		[0] = nil
	},
	air_brake_vars = {
		old_speed = 30,
		old_state = false,
		override = false,
		sw_speed_ref = nil,
		[0] = nil
	},
	jumpscout = {
		old_multipoint = -1,
		apex_peak_window = 72,
		old_hitchance = -1,
		can_fire_at_apex = true,
		old_autostop_bits = -1,
		dragging = false,
		drag_off_x = 0,
		post_shot_duration = 0.2,
		in_air_flag = 4,
		was_enabled_last_frame = false,
		drag_off_y = 0,
		is_initialized = false,
		pos_y = 500,
		pos_x = 500,
		shot_time = 0,
		reset_velocity = 80,
		["Simulates camera bobbing while fakeducking"] = nil
	},
	time_played_start = game.globalVars.m_flRealTime,
	auto_pointscale_data = {
		[0] = nil,
		["40"] = {
			max = 70,
			inaccuracy = 0.57831001281738
		},
		["9"] = {
			max = 65,
			inaccuracy = 0.73682999610901
		},
		["1"] = {
			max = 50,
			inaccuracy = 1,
			__div = nil
		}
	},
	loading = {
		active = true,
		logo_tex = nil,
		target_progress = 0,
		progress = 0,
		fade_alpha = 255,
		status = "Initializing Silentium...",
		[0] = nil,
		start_time = game.globalVars.m_flRealTime,
		status_list = {
			"Initializing kernel modules...",
			"Loading local resources...",
			"Connecting to cloud server...",
			"Decrypting configuration...",
			"Applying visual theme...",
			"Synchronizing game state...",
			"Silentium is ready!",
			[0] = nil
		}
	},
	bomb = {
		is_planted = false,
		drag_off_y = 0,
		drag_off_x = 0,
		dragging = false,
		defuse_duration = 0,
		defuse_start_time = 0,
		plant_time = 0,
		is_planting = false,
		is_exploded = false,
		is_defused = false,
		is_defusing = false
	},
	qr = {
		was_reloading = false,
		qr_delay = 0.01,
		switch_time = 0,
		should_switch = false,
		return_to_slot = 1,
		reload_start_time = 0,
		sparks = nil
	},
	edge_stop_vars = {
		last_key_state = false,
		state = false
	},
	target_history = {},
	aa = {
		was_shot_pitch = false,
		pitch_timer = 0,
		fs_active = false,
		[0] = nil,
		fs_hits = {}
	},
	ls_indicator = {
		dragging = false,
		drag_off_y = 0,
		drag_off_x = 0
	},
	ai_peek = {
		active = false
	},
	silentium_logs = {},
	last_shot = {
		dmg = 0,
		hc = 0,
		bt = 0,
		hg = "Generic"
	},
	auto_connect = {
		last_connect_time = 0,
		last_check_time = -1,
		last_ip = ""
	}
}

function slot_0_6_0.sil_is_file(arg_79_0)
	if utils and utils.FileExists then
		return utils.FileExists(arg_79_0)
	end

	return false
end

slot_0_37_0 = {}
slot_0_37_0.currentUserUID = nil
slot_0_37_0.isVerified = false
slot_0_37_0.CLOUD_API_URL = "https://silentium.onrender.com"
slot_0_37_0.API_KEY = "getgoodgetsilentium"
slot_0_37_0.currentUserRank = nil
slot_0_37_0.currentUserDiscordID = nil
slot_0_37_0.initial_fetch_done = false
slot_0_37_0.pending_actions = {}
slot_0_38_0 = "silentum/discord_cache.json"

function slot_0_37_0.pushAction(arg_80_0, arg_80_1, arg_80_2)
	table.insert(slot_0_37_0.pending_actions, {
		mapName = nil,
		type = arg_80_0,
		data = arg_80_1,
		callback = arg_80_2
	})
end

function slot_0_37_0.processQueue()
	if #slot_0_37_0.pending_actions == 0 then
		return
	end

	local var_81_0 = slot_0_37_0.pending_actions

	slot_0_37_0.pending_actions = {}

	for iter_81_0, iter_81_1 in ipairs(var_81_0) do
		if iter_81_1.type == "uid_fetch" then
			local var_81_1 = iter_81_1.data

			if var_81_1 and var_81_1.found then
				local var_81_2 = var_81_1.uid or var_81_1.details and var_81_1.details.id

				if var_81_2 then
					slot_0_37_0.currentUserUID = tostring(var_81_2)
					slot_0_37_0.currentUserRank = var_81_1.rank or "User"
					slot_0_37_0.currentUserDiscordID = var_81_1.discord_id
					slot_0_37_0.isVerified = true

					local var_81_3 = utils.JsonEncode({
						verified = true,
						[0] = nil,
						uid = tostring(var_81_2),
						rank = slot_0_37_0.currentUserRank,
						discord_id = slot_0_37_0.currentUserDiscordID
					})

					slot_0_6_0.sil_write_file(slot_0_38_0, var_81_3)

					if iter_81_1.callback then
						iter_81_1.callback(true)
					end
				elseif iter_81_1.callback then
					iter_81_1.callback(false)
				end
			elseif iter_81_1.callback then
				iter_81_1.callback(false)
			end
		elseif iter_81_1.type == "configs_fetch" then
			local var_81_4 = iter_81_1.data

			if var_81_4 and var_81_4.configs then
				slot_0_37_0.cloud_configs = var_81_4.configs
				slot_0_37_0.last_refresh = game.globalVars.m_flRealTime
				slot_0_37_0.cloud_status = "Success"
			else
				slot_0_37_0.cloud_status = "Parse Error"
			end
		elseif iter_81_1.type == "config_download" then
			local var_81_5 = iter_81_1.data.response
			local var_81_6 = iter_81_1.data.name

			if var_81_5 and #var_81_5 > 10 then
				local var_81_7 = var_81_5:sub(1, 1) == "{" and utils.JsonDecode(var_81_5) or nil
				local var_81_8 = var_81_7 and var_81_7.content

				if not var_81_8 and var_81_5:sub(1, 1) ~= "{" then
					var_81_8 = var_81_5
				end

				if var_81_8 then
					slot_0_6_0.load_config(var_81_6, nil, var_81_8)
					slot_0_37_0.fetchConfigs(true)
				else
					notify("Cloud Download Failed (Empty Content)", "error")
				end
			else
				notify("Cloud Download Failed (Empty)", "error")
			end
		elseif iter_81_1.type == "sync_success" then
			slot_0_36_0.session_kills = 0
			slot_0_36_0.session_start_time = game.globalVars.m_flRealTime
		elseif iter_81_1.type == "link_code" and iter_81_1.callback then
			iter_81_1.callback(iter_81_1.data)
		end
	end
end

function slot_0_37_0.cloudApiRequest(arg_82_0, arg_82_1)
	local var_82_0 = slot_0_37_0.CLOUD_API_URL

	if var_82_0:sub(-1) ~= "/" then
		var_82_0 = var_82_0 .. "/"
	end

	if arg_82_0:sub(1, 1) == "/" then
		arg_82_0 = arg_82_0:sub(2)
	end

	local var_82_1 = var_82_0 .. arg_82_0:gsub(" ", "%%20")
	local var_82_2 = {
		[0] = nil,
		headers = {
			Accept = "application/json",
			["User-Agent"] = "Silentium-Cloud",
			[0] = nil,
			["x-api-key"] = slot_0_37_0.API_KEY
		}
	}

	http.Get(var_82_1, var_82_2, function(arg_83_0, arg_83_1)
		if arg_82_1 then
			if arg_83_0 == 200 then
				arg_82_1(arg_83_1)
			else
				arg_82_1(nil)
			end
		end
	end)
end

function slot_0_37_0.requestLinkCode(arg_84_0)
	local var_84_0 = slot_0_30_0()
	local var_84_1 = slot_0_37_0.CLOUD_API_URL

	if var_84_1:sub(-1) ~= "/" then
		var_84_1 = var_84_1 .. "/"
	end

	local var_84_2 = var_84_1 .. "api/link/request"
	local var_84_3 = utils.JsonEncode({
		[0] = nil,
		username = var_84_0,
		version = slot_0_0_0 or "1.0"
	})
	local var_84_4 = {
		contentType = "application/json",
		[0] = nil,
		headers = {
			["User-Agent"] = "Silentium-Cloud",
			[0] = nil,
			["x-api-key"] = slot_0_37_0.API_KEY
		},
		data = var_84_3
	}

	http.Post(var_84_2, var_84_4, function(arg_85_0, arg_85_1)
		print(string.format("[Silentium] Link Code Callback | Status: %s | Resp Size: %d", tostring(arg_85_0), arg_85_1 and #arg_85_1 or 0))

		if arg_85_0 == 200 then
			local var_85_0 = utils.JsonDecode(arg_85_1)
			local var_85_1

			if var_85_0 ~= nil then
				if type(var_85_0) == "table" then
					var_85_1 = var_85_0.code or var_85_0.link_code
				else
					var_85_1 = var_85_0
				end
			end

			if not var_85_1 and arg_85_1 and arg_85_1 ~= "" then
				var_85_1 = arg_85_1:match("\"code\"%s*:%s*\"([^\"]+)\"") or arg_85_1:match("\"link_code\"%s*:%s*\"([^\"]+)\"")

				if var_85_1 then
					print("[Silentium] Link: Used manual fallback parsing")
				end
			end

			if var_85_1 then
				if arg_84_0 then
					arg_84_0(tostring(var_85_1))
				end
			else
				print(string.format("[Silentium] Link Error: Invalid response format (Decoded Type: %s)", type(var_85_0)))

				if arg_85_1 then
					print("[Silentium] Raw response: " .. tostring(arg_85_1))
				end

				if arg_84_0 then
					arg_84_0(nil)
				end
			end
		else
			print("[Silentium] Link Error: http " .. tostring(arg_85_0))

			if arg_85_1 then
				print("[Silentium] Response: " .. tostring(arg_85_1))
			end

			if arg_84_0 then
				arg_84_0(nil)
			end
		end
	end)
end

slot_0_37_0.is_fetching_uid = false

function slot_0_37_0.fetchUserUID(arg_86_0)
	if slot_0_37_0.is_fetching_uid then
		return
	end

	slot_0_37_0.is_fetching_uid = true

	local var_86_0 = slot_0_30_0()
	local var_86_1 = "/api/user/" .. utils.url_encode(var_86_0) .. "?t=" .. math.floor(game.globalVars.m_flRealTime * 100)

	slot_0_37_0.cloudApiRequest(var_86_1, function(arg_87_0)
		slot_0_37_0.is_fetching_uid = false

		if arg_87_0 then
			local var_87_0 = utils.JsonDecode(arg_87_0)

			if var_87_0 and var_87_0.found then
				local var_87_1 = var_87_0.uid or var_87_0.details and var_87_0.details.id

				if var_87_1 then
					slot_0_37_0.pushAction("uid_fetch", {
						found = true,
						[0] = nil,
						uid = var_87_1,
						rank = var_87_0.rank,
						discord_id = var_87_0.discord_id,
						details = var_87_0.details
					}, function(arg_88_0)
						if arg_86_0 then
							arg_86_0(arg_88_0)
						end
					end)

					return
				end
			end
		end

		slot_0_37_0.pushAction("uid_fetch", {
			found = false
		}, function(arg_89_0)
			if arg_86_0 then
				arg_86_0(arg_89_0)
			end
		end)
	end)
end

function slot_0_37_0.saveCache()
	if not slot_0_37_0.currentUserUID then
		return
	end

	local var_90_0 = {
		uid = slot_0_37_0.currentUserUID,
		rank = slot_0_37_0.currentUserRank,
		discord_id = slot_0_37_0.currentUserDiscordID,
		verified = slot_0_37_0.isVerified
	}
	local var_90_1 = utils.JsonEncode(var_90_0)

	slot_0_6_0.sil_write_file(slot_0_38_0, var_90_1)
end

function slot_0_37_0.loadCache()
	if not slot_0_6_0.sil_is_file(slot_0_38_0) then
		return false
	end

	local var_91_0 = slot_0_6_0.sil_read_file(slot_0_38_0)

	if not var_91_0 or #var_91_0 == 0 then
		return false
	end

	local var_91_1 = utils.JsonDecode(var_91_0)

	if var_91_1 and var_91_1.uid then
		slot_0_37_0.currentUserUID = var_91_1.uid
		slot_0_37_0.currentUserRank = var_91_1.rank
		slot_0_37_0.currentUserDiscordID = var_91_1.discord_id
		slot_0_37_0.isVerified = var_91_1.verified

		return true
	end

	return false
end

slot_0_37_0.loadCache()

if not slot_0_37_0.currentUserUID then
	slot_0_37_0.fetchUserUID()
end

slot_0_37_0.last_sync_time = 0
slot_0_37_0.is_syncing = false

function slot_0_37_0.syncStats()
	if not is_enabled("cloud_sync") then
		return
	end

	if not slot_0_37_0.currentUserUID then
		return
	end

	local var_92_0 = draw.GetTime()

	if var_92_0 - (slot_0_37_0.last_sync_time or 0) < 10 then
		return
	end

	slot_0_37_0.last_sync_time = var_92_0

	if not slot_0_36_0.session_start_time or slot_0_36_0.session_start_time == 0 then
		slot_0_36_0.session_start_time = var_92_0
	end

	local var_92_1 = math.floor(var_92_0 - slot_0_36_0.session_start_time)
	local var_92_2 = slot_0_36_0.session_kills or 0
	local var_92_3 = slot_0_30_0()

	if var_92_2 == 0 and var_92_1 < 10 then
		return
	end

	local var_92_4 = slot_0_37_0.CLOUD_API_URL

	if var_92_4:sub(-1) ~= "/" then
		var_92_4 = var_92_4 .. "/"
	end

	local var_92_5 = var_92_4 .. "api/stats/update"
	local var_92_6 = utils.JsonEncode({
		version = "BETA",
		[0] = nil,
		username = var_92_3,
		kills = var_92_2,
		playtime = var_92_1
	})
	local var_92_7 = {
		headers = {
			["Content-Type"] = "application/json",
			["User-Agent"] = "Silentium-Cloud",
			[0] = nil,
			["x-api-key"] = slot_0_37_0.API_KEY
		},
		data = var_92_6
	}

	http.Post(var_92_5, var_92_7, function(arg_93_0, arg_93_1)
		if arg_93_0 == 200 then
			slot_0_36_0.session_kills = 0
			slot_0_36_0.session_start_time = draw.GetTime()

			slot_0_37_0.pushAction("sync_success")
		end
	end)
end

slot_0_37_0.cloud_configs = {}
slot_0_37_0.last_refresh = 0
slot_0_37_0.is_fetching_configs = false

function slot_0_37_0.fetchConfigs(arg_94_0)
	if not arg_94_0 and draw.GetTime() - slot_0_37_0.last_refresh < 60 and #slot_0_37_0.cloud_configs > 0 then
		return
	end

	if slot_0_37_0.is_fetching_configs then
		return
	end

	slot_0_37_0.is_fetching_configs = true
	slot_0_37_0.cloud_status = "Loading..."

	local var_94_0 = "/api/configs?t=" .. math.floor(draw.GetTime() * 100)

	slot_0_37_0.cloudApiRequest(var_94_0, function(arg_95_0)
		slot_0_37_0.is_fetching_configs = false

		if arg_95_0 then
			local var_95_0 = utils.JsonDecode(arg_95_0)

			slot_0_37_0.pushAction("configs_fetch", var_95_0)
		else
			slot_0_37_0.pushAction("configs_fetch", nil)
		end
	end)
end

slot_0_37_0.is_downloading = false

function slot_0_37_0.downloadConfig(arg_96_0, arg_96_1)
	if slot_0_37_0.is_downloading then
		return
	end

	slot_0_37_0.is_downloading = true

	local var_96_0 = "/api/config/" .. arg_96_0 .. "/download?t=" .. math.floor(game.globalVars.m_flRealTime * 100)

	slot_0_37_0.cloudApiRequest(var_96_0, function(arg_97_0)
		slot_0_37_0.is_downloading = false

		slot_0_37_0.pushAction("config_download", {
			soul_particles_color = nil,
			response = arg_97_0,
			name = arg_96_1
		})
	end)
end

slot_0_37_0.is_uploading = false

function slot_0_37_0.uploadConfig(arg_98_0, arg_98_1)
	if slot_0_37_0.is_uploading then
		return
	end

	if not slot_0_37_0.currentUserUID then
		notify("Discord link required for cloud upload", "error")

		return
	end

	slot_0_37_0.is_uploading = true

	notify("Uploading " .. arg_98_0 .. " to cloud...", "info")

	local var_98_0 = "/api/config/upload"
	local var_98_1 = slot_0_37_0.CLOUD_API_URL

	if var_98_1:sub(-1) == "/" then
		var_98_1 = var_98_1:sub(1, -2)
	end

	local var_98_2 = var_98_1 .. var_98_0
	local var_98_3 = {
		contentType = "application/json",
		headers = {
			["User-Agent"] = "Silentium-Cloud",
			[0] = nil,
			["x-api-key"] = slot_0_37_0.API_KEY
		},
		data = utils.JsonEncode({
			description = "Uploaded via Silentium Beta",
			[0] = nil,
			username = slot_0_30_0(),
			name = arg_98_0,
			content = arg_98_1,
			discord_id = slot_0_37_0.currentUserDiscordID,
			version = slot_0_0_0 or "1.0"
		})
	}

	http.Post(var_98_2, var_98_3, function(arg_99_0, arg_99_1)
		slot_0_37_0.is_uploading = false

		if arg_99_0 == 200 or arg_99_0 == 201 then
			notify("Cloud Upload Success!", "success")
			slot_0_37_0.fetchConfigs(true)
		else
			notify("Cloud Upload Failed: http " .. tostring(arg_99_0), "error")

			if arg_99_1 and #arg_99_1 > 0 then
				print("[Silentium] Upload Error: " .. arg_99_1)
			end
		end
	end)
end

function slot_0_37_0.deleteCloudConfig(arg_100_0)
	if not arg_100_0 then
		return
	end

	local var_100_0 = "/api/config/" .. arg_100_0 .. "/delete"
	local var_100_1 = slot_0_37_0.CLOUD_API_URL

	if var_100_1:sub(-1) == "/" then
		var_100_1 = var_100_1:sub(1, -2)
	end

	local var_100_2 = var_100_1 .. var_100_0
	local var_100_3 = {
		contentType = "application/json",
		headers = {
			["User-Agent"] = "Silentium-Cloud",
			[0] = nil,
			["x-api-key"] = slot_0_37_0.API_KEY
		},
		data = utils.JsonEncode({
			username = slot_0_30_0()
		})
	}

	notify("Deleting cloud config...", "info")
	http.Post(var_100_2, var_100_3, function(arg_101_0, arg_101_1)
		if arg_101_0 == 200 or arg_101_0 == 204 then
			notify("Cloud Config Deleted", "success")
			slot_0_37_0.fetchConfigs(true)
		else
			notify("Delete Failed: http " .. tostring(arg_101_0), "error")
		end
	end)
end

function slot_0_37_0.updateCloudConfig(arg_102_0, arg_102_1)
	if not arg_102_0 or slot_0_37_0.is_uploading then
		return
	end

	slot_0_37_0.is_uploading = true

	notify("Updating Cloud Config...", "info")

	local var_102_0 = "/api/config/" .. arg_102_0 .. "/update"
	local var_102_1 = slot_0_37_0.CLOUD_API_URL

	if var_102_1:sub(-1) == "/" then
		var_102_1 = var_102_1:sub(1, -2)
	end

	local var_102_2 = var_102_1 .. var_102_0
	local var_102_3 = utils.JsonEncode({
		[0] = nil,
		content = arg_102_1,
		version = slot_0_0_0 or "1.0",
		username = slot_0_30_0()
	})
	local var_102_4 = {
		contentType = "application/json",
		headers = {
			["User-Agent"] = "Silentium-Cloud",
			["x-api-key"] = slot_0_37_0.API_KEY
		},
		data = var_102_3
	}

	http.Post(var_102_2, var_102_4, function(arg_103_0, arg_103_1)
		slot_0_37_0.is_uploading = false

		if arg_103_0 == 200 or arg_103_0 == 201 or arg_103_0 == 204 then
			notify("Config Updated Successfully!", "success")
			slot_0_37_0.fetchConfigs(true)
		else
			notify("Update Failed: http " .. tostring(arg_103_0), "error")

			if arg_103_1 then
				print("[Silentium] Update Error: " .. tostring(arg_103_1))
			end
		end
	end)
end

function slot_0_37_0.sendWebhook(arg_104_0, arg_104_1)
	if not arg_104_0 or arg_104_0 == "" then
		return
	end

	local var_104_0 = {
		contentType = "application/json",
		headers = {
			["Content-Type"] = "application/json"
		},
		data = utils.JsonEncode(arg_104_1)
	}

	http.Post(arg_104_0, var_104_0, function(arg_105_0, arg_105_1)
		return
	end)
end

UI = {
	w = 650,
	picker_x = 0,
	link_modal_open = false,
	h = 450,
	open = false,
	settings_open = false,
	drag_off_y = 0,
	x = 200,
	last_ins = false,
	sidebar_width = 160,
	hovered_tab = nil,
	sidebar_expanded = true,
	anim_progress = 0,
	active_tab = "Home",
	last_mouse_state = false,
	dragging = false,
	tooltip_anim = 0,
	picker_drag_off_y = 0,
	picker_drag_off_x = 0,
	picker_dragging = false,
	picker_release_guarded = false,
	picker_just_opened = 0,
	picker_y = 0,
	drag_off_x = 0,
	y = 200,
	[0] = nil,
	mouse_keys = {},
	snap_guides = UI.snap_guides,
	animations = UI.animations,
	toggle_states = {},
	last_key_states = {},
	group_heights = {},
	embedded_icons = {
		hotkeys = " <svg version=\"1.1\" id=\"svg1\" width=\"24\" height=\"24\" viewBox=\"0 0 24 24\" xmlns=\"http://www.w3.org/2000/svg\" xmlns:svg=\"http://www.w3.org/2000/svg\"> <defs id=\"defs1\" /> <g id=\"g1\" transform=\"matrix(1.1996209,0,0,1.1996209,-2.395896,-3.0032146)\"> <path style=\"fill:#ffffff\" d=\"M 2.6542859,17.931136 C 2.0700025,17.722868 1.8273043,16.950329 2.1857618,16.439763 2.2620543,16.331097 2.4184607,16.189453 2.5333315,16.125 l 0.208856,-0.117188 H 4.5 6.2578125 L 6.4666685,16.125 c 0.5990982,0.336149 0.6956764,1.154385 0.1901604,1.611088 -0.099794,0.09016 -0.262038,0.186303 -0.3605424,0.213656 -0.2847277,0.07906 -3.4128228,0.06308 -3.6420006,-0.01861 z m 6,0 C 8.0700025,17.722868 7.8273043,16.950329 8.1857618,16.439763 8.2620543,16.331097 8.4184607,16.189453 8.5333315,16.125 l 0.208856,-0.117188 H 12 15.257813 L 15.466669,16.125 c 0.599098,0.336149 0.695676,1.154385 0.19016,1.611088 -0.09979,0.09016 -0.262038,0.186303 -0.360543,0.213656 -0.118373,0.03287 -1.243964,0.04912 -3.319723,0.04794 -2.5493279,-0.0015 -3.1748258,-0.01399 -3.3222771,-0.06655 z m 9.0000001,0 c -0.584283,-0.208268 -0.826982,-0.980807 -0.468524,-1.491373 0.07629,-0.108666 0.232699,-0.25031 0.347569,-0.314763 l 0.208856,-0.117188 H 19.5 21.257812 L 21.466669,16.125 c 0.599098,0.336149 0.695676,1.154385 0.19016,1.611088 -0.09979,0.09016 -0.262038,0.186303 -0.360543,0.213656 -0.284727,0.07906 -3.412822,0.06308 -3.642,-0.01861 z M 7.3359375,13.657391 C 7.1041624,13.536693 4.8300019,11.251226 4.7305633,11.039063 4.6192828,10.801634 4.6182781,10.483411 4.728046,10.241785 4.81968,10.040078 5.0944716,9.7711677 5.2816964,9.699985 5.4575927,9.633109 5.8422697,9.64786 6.0366618,9.728935 c 0.2117301,0.088306 2.4599245,2.307055 2.5861863,2.552315 0.1286689,0.249935 0.156543,0.450345 0.0971,0.69813 -0.065108,0.271401 -0.2733792,0.537049 -0.5194898,0.662605 -0.2220745,0.113294 -0.6615087,0.121125 -0.8645209,0.01541 z m 8.4535325,-0.01774 c -0.238866,-0.126191 -0.445566,-0.394099 -0.509418,-0.660267 -0.05944,-0.247785 -0.03157,-0.448195 0.0971,-0.69813 0.126262,-0.24526 2.374456,-2.4640095 2.586186,-2.5523153 0.217755,-0.090818 0.584949,-0.093614 0.792656,-0.00604 0.475171,0.200353 0.727188,0.8086253 0.531366,1.2825133 -0.08894,0.215244 -2.354184,2.505412 -2.609711,2.63843 -0.231512,0.120516 -0.655908,0.118512 -0.888179,-0.0042 z M 11.654286,11.93114 c -0.09991,-0.03561 -0.252577,-0.133494 -0.339264,-0.217514 -0.298591,-0.289405 -0.304451,-0.335961 -0.289449,-2.2994999 l 0.01349,-1.7655654 0.142706,-0.2031846 c 0.405986,-0.5780398 1.230476,-0.5780398 1.636462,0 l 0.142707,0.2031846 0.01349,1.7655654 c 0.0152,1.9890949 0.01017,2.0258469 -0.317598,2.3219659 -0.281157,0.254008 -0.640823,0.323982 -1.002544,0.195048 z\" id=\"path1\" /> </g> </svg> ",
		switch_off = " <svg version=\"1.1\" id=\"svg1\" width=\"512\" height=\"512\" viewBox=\"0 0 512 512\" xmlns=\"http://www.w3.org/2000/svg\" xmlns:svg=\"http://www.w3.org/2000/svg\"> <defs id=\"defs1\" /> <g id=\"g1\"> <path style=\"fill:#ffffff\" d=\"M 104.40446,382.77877 C 75.434856,376.92431 49.715586,362.0403 31.282262,340.46217 0.97175317,304.98056 -8.1870381,258.10465 6.6072226,214.17204 19.273595,176.55835 50.866261,145.55222 89.252497,133.06113 108.01872,126.9545 104.26337,127.089 256,127.089 c 151.79563,0 147.9552,-0.13793 166.81989,5.99138 38.11666,12.38444 69.96729,43.65846 82.56602,81.07126 5.31407,15.78052 6.36265,22.79383 6.33782,42.39 -0.0216,17.02038 -0.27502,19.37256 -3.34484,31.04122 -12.2367,46.51282 -46.14061,80.47399 -93.71976,93.87804 l -10.32371,2.90841 -145.0753,0.19298 c -136.57203,0.18167 -145.64856,0.0771 -154.85566,-1.78352 z m 285.80378,-23.86316 c 27.01874,-2.3988 47.54327,-11.9238 66.32435,-30.77971 13.43256,-13.48607 22.52644,-29.78295 27.33926,-48.99387 2.58107,-10.30268 2.58107,-35.98138 0,-46.28406 -4.81282,-19.21092 -13.9067,-35.5078 -27.33926,-48.99387 -18.78108,-18.85591 -39.30561,-28.38091 -66.32435,-30.77971 -15.83121,-1.40554 -252.58527,-1.40554 -268.41648,0 -27.311759,2.42482 -50.230026,13.303 -68.008897,32.28052 -38.233896,40.81161 -37.287614,104.18935 2.139553,143.29756 17.956914,17.81165 39.637735,28.02721 64.089424,30.19765 14.13285,1.25449 256.13175,1.30419 270.1964,0.0555 z M 114.18481,343.09866 C 82.071423,335.96952 57.286869,312.95338 47.18286,280.87739 44.969454,273.85076 44.635605,270.59027 44.635605,256 c 0,-14.57645 0.335805,-17.86245 2.54619,-24.91557 7.662587,-24.45056 24.328708,-44.13124 46.355598,-54.74037 15.155507,-7.29956 21.240337,-8.59812 40.208137,-8.58079 15.56328,0.0142 16.76756,0.17516 26.62431,3.55795 29.3451,10.07113 50.45632,32.15179 58.91513,61.62055 3.46545,12.07294 3.46459,34.04639 -0.002,46.12299 -8.5303,29.71878 -29.54644,51.67194 -58.91333,61.54001 -9.11156,3.06173 -11.98245,3.51094 -24.4509,3.82583 -9.97794,0.252 -16.36139,-0.1392 -21.73413,-1.33194 z\" id=\"path1\" /> </g> </svg> ",
		switch_on = " <svg version=\"1.1\" id=\"svg1\" width=\"512\" height=\"512\" viewBox=\"0 0 512 512\" xmlns=\"http://www.w3.org/2000/svg\" xmlns:svg=\"http://www.w3.org/2000/svg\"> <defs id=\"defs1\" /> <g id=\"g1\"> <path style=\"fill:#ffffff\" d=\"M 104.83274,382.8198 C 75.94498,376.96345 50.298372,362.07462 31.917125,340.48951 1.692248,304.99642 -7.4406682,258.10533 7.3117963,214.15851 19.942384,176.53264 51.445796,145.51648 89.723584,133.02135 108.43679,126.91274 104.69205,127.04728 256,127.04728 c 151.36678,0 147.5372,-0.13797 166.3486,5.99332 38.00897,12.38845 69.76962,43.67258 82.33275,81.09749 5.29906,15.78564 6.34468,22.80122 6.31992,42.40373 -0.0215,17.02588 -0.27424,19.37882 -3.33539,31.05126 -12.20213,46.52788 -46.01025,80.50003 -93.45498,93.90842 l -10.29455,2.90935 -144.66544,0.19305 c -136.1862,0.18173 -145.23708,0.0772 -154.41817,-1.7841 z m 284.99634,-23.87089 c 26.94241,-2.39957 47.40896,-11.92765 66.13698,-30.78966 13.3946,-13.49044 22.46279,-29.79259 27.26201,-49.00973 2.57379,-10.30601 2.57379,-35.99303 0,-46.29904 -4.79922,-19.21714 -13.86741,-35.51929 -27.26201,-49.00973 -18.72802,-18.86201 -39.19457,-28.39009 -66.13698,-30.78966 -15.78649,-1.406 -251.87167,-1.406 -267.65816,0 -27.2346,2.42559 -50.088119,13.3073 -67.816762,32.29096 -38.125879,40.82482 -37.18227,104.22307 2.133508,143.34394 17.906184,17.81741 39.525752,28.03628 63.908364,30.20742 14.09292,1.25489 255.40813,1.30461 269.43305,0.0555 z M 360.5709,343.31669 C 318.52659,333.59177 289.59272,297.9976 289.59272,256 c 0,-43.23239 31.4518,-80.40472 74.35213,-87.87549 9.07253,-1.57991 28.91905,-0.67204 37.80423,1.72934 9.71257,2.62499 25.12251,10.51827 32.83035,16.81635 9.6417,7.87823 18.003,18.43537 23.58359,29.77708 6.4411,13.09054 8.20939,20.28377 8.85992,36.04137 0.46197,11.1899 0.1706,14.92023 -1.84757,23.65389 -4.39095,19.00193 -15.4887,36.84313 -30.59594,49.18726 -7.68051,6.27575 -23.06671,14.16686 -32.83035,16.83767 -8.97072,2.45392 -32.67712,3.11552 -41.17818,1.14922 z\" id=\"path1\" /> </g> </svg> ",
		[0] = nil
	},
	is_hotkey_active = function(arg_106_0, arg_106_1)
		local var_106_0 = UI.cfg[arg_106_0]

		if not var_106_0 or var_106_0 == 0 then
			return arg_106_1 == true
		end

		local var_106_1 = UI.cfg[arg_106_0 .. "_mode"] or "Hold"
		local var_106_2 = get_key_state(var_106_0)

		if var_106_1 == "Toggle" then
			if var_106_2 and not UI.last_key_states[arg_106_0] then
				UI.toggle_states[arg_106_0] = not UI.toggle_states[arg_106_0]
			end

			UI.last_key_states[arg_106_0] = var_106_2

			return UI.toggle_states[arg_106_0] == true
		else
			UI.last_key_states[arg_106_0] = var_106_2

			return var_106_2
		end
	end,
	cfg = {
		spectator_list_x = 20,
		spectator_list_y = 400,
		ai_peek_retreat_shot = false,
		ai_peek_radius = 50,
		acc_ap_key = 0,
		acc_dy_hc_key = 0,
		acc_dy_hc_enabled_auto = false,
		acc_dy_hc_min_auto = 70,
		acc_dy_hc_max_auto = 95,
		acc_dy_hc_dist_auto = 3000,
		acc_ap_enabled_auto = false,
		acc_ap_max_auto = 90,
		acc_ap_inc_auto = 1.2,
		acc_dy_hc_enabled_scout = false,
		acc_dy_hc_min_scout = 70,
		acc_dy_hc_max_scout = 90,
		acc_dy_hc_dist_scout = 3000,
		acc_ap_enabled_scout = false,
		acc_ap_max_scout = 85,
		acc_ap_inc_scout = 1,
		acc_dy_hc_enabled_awp = false,
		acc_dy_hc_min_awp = 75,
		acc_dy_hc_max_awp = 99,
		acc_dy_hc_dist_awp = 3000,
		acc_ap_enabled_awp = false,
		acc_ap_max_awp = 90,
		acc_ap_inc_awp = 1.5,
		acc_dy_hc_enabled_hpistol = false,
		acc_dy_hc_min_hpistol = 60,
		acc_dy_hc_max_hpistol = 85,
		acc_dy_hc_dist_hpistol = 3000,
		acc_ap_enabled_hpistol = false,
		acc_ap_max_hpistol = 80,
		acc_ap_inc_hpistol = 1,
		acc_dy_hc_enabled_pistol = false,
		acc_dy_hc_min_pistol = 55,
		acc_dy_hc_max_pistol = 80,
		acc_dy_hc_dist_pistol = 3000,
		acc_ap_enabled_pistol = false,
		acc_ap_max_pistol = 75,
		acc_ap_inc_pistol = 0.8,
		acc_dy_hc_enabled_other = false,
		acc_dy_hc_min_other = 60,
		acc_dy_hc_max_other = 85,
		acc_dy_hc_dist_other = 3000,
		acc_ap_enabled_other = false,
		acc_ap_max_other = 80,
		acc_ap_inc_other = 1,
		wb_spot_name_editor = "",
		misc_zeus_quickswitch = false,
		wb_aim_spot_instructions = "",
		misc_quick_reload = false,
		ssg_always_scoped = false,
		misc_quickswitch = false,
		misc_hitsound_vol = 100,
		velocity_x = 0,
		keybinds_y = 400,
		keybinds_x = 20,
		killstreak_y = 100,
		killstreak_x = 400,
		damage_rings = false,
		bomb_timer_y = 250,
		bomb_timer_x = 20,
		acc_ap_enabled_global = false,
		ls_indicator_y = 1050,
		acc_dy_hc_enabled_global = false,
		misc_hitsound_file = "Bell",
		misc_hitsound_enabled = false,
		keybinds_style = 1,
		viewmodel_scope_offset_z = -1.5,
		viewmodel_scope_offset_y = 2,
		sparks_size = 2.5,
		viewmodel_scope_offset_x = -3,
		misc_jitter_legs = false,
		misc_slide_walk = false,
		viewmodel_scope_anim = false,
		scope_length = 0,
		hitlogs_y = 20,
		config_input_text = "",
		netgraph_y = 600,
		soul_particles_count = 80,
		acc_baim_hp_val = 50,
		esp_flag_noshoot = false,
		fakeduck_speed = 14,
		esp_flag_reloading = false,
		killsay_ws = false,
		esp_flag_slowed = false,
		gui_particles = true,
		scope_animation = false,
		gui_dim = true,
		scope_invert = false,
		esp_flags_enabled = false,
		scope_t_style = false,
		recoil_crosshair = false,
		scope_rotation = 0,
		scope_thickness = 1,
		ai_peek_key_mode = "Hold",
		scope_auto_rotate = false,
		rage_force_shoot_crouch = false,
		slowed_x = 0,
		slowed_y = 0,
		aa_freestanding_visualize = false,
		visuals_lefthand_knife = false,
		aa_freestanding_key = 0,
		aa_freestanding = false,
		viewmodel_scope_speed = 10,
		visualize_fakeduck = false,
		aa_avoid_backstab_dist = 250,
		hitmarker_style = "Aesthetic",
		hitmarker_ws = false,
		aa_avoid_backstab = false,
		floating_damage_style = "Classic",
		floating_damage = false,
		slowed_indicator = false,
		hitlogs_x = 20,
		velocity_y = 0,
		soul_particles_lifetime = 1.5,
		safe_head = false,
		aa_default_pitch = "Down",
		soul_particles = false,
		hitlogs_ws = false,
		ai_peek_key = 0,
		aa_victory_mode = "Disable",
		sparks_trail_length = 1,
		aa_disable_no_enemies = false,
		ai_peek_mode = "Predictive",
		sparks_velocity = 400,
		sparks_lifetime = 1.2,
		sparks_count = 15,
		sparks_enabled = false,
		jumpscout_enabled = false,
		ai_peek_enabled = false,
		netgraph_x = 20,
		wb_data_json = "",
		menu_y = 200,
		misc_edge_stop = false,
		velocity = false,
		misc_subtick_autostop = false,
		wb_enable = false,
		aa_disable_round_end = false,
		esp_flag_godmode = false,
		esp_flag_lethal = false,
		custom_scope = false,
		scope_gap = 0,
		ai_peek_key_toggle_state = false,
		trails = false,
		visuals_custom_thirdperson_dist = 40,
		misc_impact_viz_duration = 1,
		ls_indicator_x = 20,
		misc_clantag = false,
		misc_drop_all_key = 0,
		dmg_indicator_scoped = "Always",
		killstreak = false,
		dmg_indicator_side = "Left",
		dmg_indicator = false,
		misc_drop_molly_key = 0,
		misc_drop_smoke_key = 0,
		gs_indicators = false,
		misc_knife_main_hand = "Right",
		acc_weapon_group = "Global",
		jumpscout_vis_enabled = false,
		keybinds_always_show = false,
		misc_impact_viz_enabled = false,
		aa_suppress_breathing = false,
		aa_instant_manual = false,
		manual_arrows_x = 0,
		manual_arrows = false,
		ls_indicator = false,
		cloud_sync = true,
		hitlogs_console = false,
		crosshair_indicators_y = 0,
		crosshair_indicators = false,
		misc_auto_smoke = false,
		misc_drop_he_key = 0,
		misc_drop_nades = false,
		watermark_ws = true,
		bomb_timer = false,
		wb_aim_spot_selector = 1,
		wb_spot_selector = 1,
		wb_edit_mode = false,
		misc_landing_autostop = false,
		wb_remove_lines = false,
		wb_distance_edit = 2000,
		wb_distance_normal = 1000,
		misc_auto_defuse_dist = 100,
		misc_auto_defuse = false,
		menu_x = 200,
		air_brake = false,
		misc_r8_disable_right = false,
		ls_indicator_pos = "Left",
		acc_dy_hc_dist_global = 3000,
		acc_dy_hc_max_global = 95,
		acc_dy_hc_min_global = 65,
		visuals_custom_thirdperson_enabled = false,
		misc_edge_stop_mode = "Hold",
		misc_edge_stop_key = 0,
		acc_ap_inc_global = 1.5,
		acc_ap_max_global = 85,
		misc_quickladder = false,
		keybinds_ws = false,
		rage_knife_dt = false,
		wm_logo = true,
		netgraph_ws = false,
		wm_fps = true,
		acc_delay_peek = false,
		misc_auto_smoke_key = 0,
		wm_time = true,
		misc_auto_smoke_always = false,
		manual_arrows_glow = false,
		auto_pointscale = false,
		wm_ping = true,
		acc_delay_unduck = false,
		acc_delay_lethal = false,
		acc_baim_hp_enabled = false,
		wm_user = true,
		acc_dynamic_hitchance = false,
		acc_dynamic_hitchance_min = 65,
		acc_dynamic_hitchance_max = 95,
		spectator_list = false,
		[0] = nil,
		dmg_indicator_color = {
			255,
			255,
			255,
			255,
			[0] = nil
		},
		manual_arrows_color = {
			255,
			90,
			130,
			255,
			[0] = nil
		},
		watermark_color = {
			255,
			90,
			130,
			255,
			[0] = nil
		},
		keybinds_color = {
			255,
			255,
			255,
			255,
			[0] = nil
		},
		trails_color = {
			255,
			90,
			130,
			255,
			[0] = nil
		},
		sparks_color = {
			255,
			90,
			130,
			255,
			[0] = nil
		},
		soul_particles_color = {
			0,
			255,
			255,
			255,
			[0] = nil
		},
		hitmarker_color = {
			255,
			90,
			130,
			255,
			[0] = nil
		},
		recoil_crosshair_color = {
			255,
			90,
			130,
			255,
			[0] = nil
		},
		theme_accent = {
			255,
			90,
			130,
			255,
			[0] = nil
		},
		theme_bg = {
			8,
			8,
			8,
			255,
			[0] = nil
		},
		theme_bg_alt = {
			12,
			12,
			12,
			255,
			[0] = nil
		},
		theme_text = {
			220,
			220,
			220,
			255,
			[0] = nil
		},
		misc_impact_viz_color = {
			255,
			90,
			130,
			255,
			[0] = nil
		},
		esp_flags_color = {
			255,
			255,
			255,
			255,
			[0] = nil
		},
		scope_line_color = {
			0,
			0,
			0,
			255,
			[0] = nil
		},
		scope_line_color_2 = {
			255,
			255,
			255,
			255,
			[0] = nil
		},
		ls_indicator_color = {
			255,
			50,
			50,
			255,
			[0] = nil
		},
		floating_damage_color = {
			255,
			255,
			255,
			255,
			[0] = nil
		}
	},
	animations = {},
	tab_anim = {
		progress = 1,
		current_tab = "Home",
		last_tab = "Home",
		Cooldown = nil
	},
	search = {
		active = false,
		last_pos = nil,
		query = "",
		cursor_blink = 0,
		hover_idx = 0,
		results = {}
	},
	tabs = {
		"Home",
		"Ragebot",
		"Antiaim",
		"Visuals",
		"WallbangHelper",
		"Misc",
		"Config",
		[0] = nil
	},
	theme = {
		bg = {
			5,
			5,
			5,
			255,
			[0] = nil
		},
		bg_alt = {
			8,
			8,
			8,
			255,
			[0] = nil
		},
		control_bg = {
			40,
			40,
			40,
			255,
			[0] = nil
		},
		control_border = {
			30,
			30,
			30,
			255,
			[0] = nil
		},
		accent = {
			255,
			90,
			130,
			255,
			[0] = nil
		},
		text = {
			255,
			255,
			255,
			255,
			[0] = nil
		},
		text_dim = {
			150,
			150,
			160,
			255,
			[0] = nil
		},
		glow = {
			255,
			90,
			130,
			100,
			[0] = nil
		}
	},
	presets = {},
	search = {
		active = false,
		query = "",
		cursor_blink = 0,
		cursor_pos = 0,
		[0] = nil,
		results = {}
	},
	collapsed_groups = {},
	preset_manager = {
		input_active = false,
		open = false,
		new_name = "",
		["sol.kVB3.user"] = nil,
		presets = {}
	},
	tooltips = {
		hover_start = 0,
		["sol.jV?v.user"] = nil,
		data = {
			gs_indicators = "Display minimalist indicators on the left side of the screen (hc and other info is wrong since api doesnt support them yet)",
			jumpscout_vis_enabled = "Visual indicator for jump apex",
			visualize_fakeduck = "Highlights if you're in fakeduck",
			stars_radius = "Controls the radius of the star particles",
			gui_particles = "Animated particles in menu background",
			manual_arrows = "Displays manual anti-aim direction arrows",
			stars_fall = "Enables gravity physics for the particles",
			stars_density = "Controls the number of stars rendered",
			damage_rings = "Rings appear when dealing damage",
			stars_color = "Sets the Color of the star particles",
			crosshair_indicators = "Shows indicators near crosshair",
			stars_size = "Constant size of stars regardless of distance",
			floating_damage = "Damage numbers float up from hits",
			trails_rainbow = "Rainbow colored movement trails",
			sparks_trail_length = "Controls the stretching length of trails",
			sparks_size = "Constant size of sparks regardless of distance",
			sparks_velocity = "Controls the initial speed and spread area",
			sparks_lifetime = "Controls how long sparks stay on screen",
			sparks_enabled = "Particle effects on bullet impacts",
			hitlogs_ws = "Shows hit information on screen",
			velocity = "Shows current velocity meter",
			keybinds_ws = "Shows active keybinds list",
			netgraph_ws = "Displays modern network & performance stats",
			master_switch = "Enables/disables all visual features",
			trails = "Draws movement trail behind player",
			jumpscout_enabled = "Auto-shoot at jump apex with scout",
			killstreak = "Displays current kill streak",
			hitmarker_ws = "3D hitmarker at hit location",
			killsay_ws = "Sends message in chat on kill",
			gui_dim = "Dark overlay when menu is open",
			stars_enabled = "Renders advanced polygon star particles in the 3D world",
			watermark_ws = "Displays customizable watermark",
			stars_glow_power = "Controls the intensity of the star aura",
			["sol.si)5.user"] = nil
		}
	},
	search_registry = {
		{
			label = "Kill Streak",
			group = "General",
			tab = "Ragebot",
			[0] = nil
		},
		{
			label = "Jumpscout",
			group = "General",
			tab = "Ragebot"
		},
		{
			label = "Apex Visualizer",
			group = "Indicators",
			tab = "Visuals"
		},
		{
			label = "Auto Pointscale",
			group = "General",
			tab = "Ragebot"
		},
		{
			label = "Double Tap on Knife",
			group = "General",
			tab = "Ragebot"
		},
		{
			label = "Smart Delay Shot",
			group = "Accuracy",
			tab = "Ragebot"
		},
		{
			label = "Body Aim on Health",
			group = "Accuracy",
			tab = "Ragebot"
		},
		{
			label = "Force Shoot on Crouch",
			group = "General",
			tab = "Ragebot"
		},
		{
			label = "AI Peek (WIP)",
			group = "Auto Peek",
			tab = "Ragebot",
			["sol.n[8y"] = nil
		},
		{
			label = "Disable AA on Round End",
			group = "AA Automation",
			tab = "Antiaim"
		},
		{
			label = "Disable AA when No Enemies",
			group = "AA Automation",
			tab = "Antiaim"
		},
		{
			label = "AA Victory Mode",
			group = "AA Automation",
			tab = "Antiaim"
		},
		{
			label = "Instant Manual Rotation",
			group = "AA Features",
			tab = "Antiaim",
			["$|?4"] = nil
		},
		{
			label = "Default Pitch",
			group = "AA Automation",
			tab = "Antiaim"
		},
		{
			label = "Avoid BackStab",
			group = "AA Features",
			tab = "Antiaim"
		},
		{
			label = "Visualize Fake Duck",
			group = "Misc",
			tab = "Antiaim"
		},
		{
			label = "Fakeduck Speed",
			group = "Misc",
			tab = "Antiaim",
			[0] = nil
		},
		{
			label = "Watermark",
			group = "Interface",
			tab = "Visuals"
		},
		{
			label = "Keybinds List",
			group = "Interface",
			tab = "Visuals",
			[0] = nil
		},
		{
			label = "On Screen Logs",
			group = "Interface",
			tab = "Visuals"
		},
		{
			label = "Auto Smoke",
			group = "General",
			tab = "Misc"
		},
		{
			label = "Luasense Watermark",
			group = "Interface",
			tab = "Visuals",
			weapon_tabs_layout = nil
		},
		{
			label = "Crosshair Indicators",
			group = "Indicators",
			tab = "Visuals"
		},
		{
			label = "Manual Arrows",
			group = "Indicators",
			tab = "Visuals"
		},
		{
			label = "Arrows Glow",
			group = "Indicators",
			tab = "Visuals",
			[0] = nil
		},
		{
			label = "Movement Trails",
			group = "Movement",
			tab = "Visuals"
		},
		{
			label = "Velocity Meter",
			group = "Movement",
			tab = "Visuals"
		},
		{
			label = "Slowed Down Indicator",
			group = "Movement",
			tab = "Visuals"
		},
		{
			label = "Impact Sparks",
			group = "World ESP",
			tab = "Visuals"
		},
		{
			label = "Floating Damage",
			group = "World ESP",
			tab = "Visuals"
		},
		{
			label = "World Hitmarker",
			group = "World ESP",
			tab = "Visuals"
		},
		{
			label = "Impact Visualizer",
			group = "World ESP",
			tab = "Visuals"
		},
		{
			label = "Hit Sound",
			group = "Miscellaneous",
			tab = "Misc"
		},
		{
			label = "Quick Switch (SSG)",
			group = "Miscellaneous",
			tab = "Misc",
			[0] = nil
		},
		{
			label = "Quick Reload",
			group = "Miscellaneous",
			tab = "Misc"
		},
		{
			label = "Quick Ladder",
			group = "Miscellaneous",
			tab = "Misc"
		},
		{
			label = "Knife on Opposite Hand",
			group = "Miscellaneous",
			tab = "Misc"
		},
		{
			label = "Drop Grenades",
			group = "Miscellaneous",
			tab = "Misc"
		},
		{
			label = "Enable Console Logs",
			group = "Miscellaneous",
			tab = "Misc"
		},
		{
			label = "Kill Say",
			group = "Miscellaneous",
			tab = "Misc",
			[0] = nil
		},
		{
			label = "Cloud Stats Sync",
			group = "Miscellaneous",
			var = "cloud_sync",
			tab = "Misc",
			[0] = nil
		},
		{
			label = "Enable Wallbang Helper",
			group = "Settings",
			tab = "WallbangHelper"
		},
		{
			label = "Render Distance",
			group = "Settings",
			tab = "WallbangHelper",
			spawn = nil
		},
		{
			label = "Edit Mode",
			group = "Editor",
			tab = "WallbangHelper"
		},
		{
			label = "Select Spot",
			group = "Editor",
			tab = "WallbangHelper"
		},
		{
			label = "Background Particles",
			group = "Interface",
			tab = "Visuals"
		},
		{
			label = "Dark Dim Overlay",
			group = "Interface",
			tab = "Visuals"
		},
		{
			label = "Viewmodel Scoping Animation",
			group = "World ESP",
			tab = "Visuals",
			[0] = nil
		}
	}
}

function is_enabled(arg_107_0)
	return UI.cfg and UI.cfg[arg_107_0] == true
end

function log_console(arg_108_0)
	if is_enabled("hitlogs_console") then
		print(arg_108_0)
	end
end

function notify(arg_109_0, arg_109_1)
	log_console(string.format(" [Silentium] [%s] %s", (arg_109_1 or "info"):upper(), arg_109_0))
end

function slot_0_39_0(arg_110_0)
	return true
end

function math.Lerp(arg_111_0, arg_111_1, arg_111_2)
	return arg_111_0 + (arg_111_1 - arg_111_0) * arg_111_2
end

function slot_0_40_0(arg_112_0)
	if not arg_112_0 then
		return 255, 255, 255, 255
	end

	local var_112_0 = 0

	while type(arg_112_0) == "function" and var_112_0 < 5 do
		arg_112_0 = arg_112_0()
		var_112_0 = var_112_0 + 1
	end

	local var_112_1 = type(arg_112_0)

	if var_112_1 == "table" then
		return tonumber(arg_112_0[1] or arg_112_0.r or 255), tonumber(arg_112_0[2] or arg_112_0.g or 255), tonumber(arg_112_0[3] or arg_112_0.b or 255), tonumber(arg_112_0[4] or arg_112_0.a or 255)
	end

	if var_112_1 == "userdata" or var_112_1 == "Color" then
		if arg_112_0.get_r then
			return arg_112_0:get_r(), arg_112_0:get_g(), arg_112_0:get_b(), arg_112_0:get_a()
		end

		if arg_112_0.r then
			return arg_112_0.r, arg_112_0.g, arg_112_0.b, arg_112_0.a or 255
		end

		if arg_112_0.red then
			return arg_112_0.red, arg_112_0.green, arg_112_0.blue, arg_112_0.alpha or 255
		end

		if arg_112_0.RGBA then
			local var_112_2 = arg_112_0:RGBA()

			if var_112_2 and var_112_2 ~= 0 then
				return math.floor(var_112_2 / 16777216) % 256, math.floor(var_112_2 / 65536) % 256, math.floor(var_112_2 / 256) % 256, var_112_2 % 256
			end
		end
	end

	return 255, 255, 255, 255
end

function slot_0_41_0(arg_113_0, arg_113_1)
	if not arg_113_0 then
		return draw.Color(255, 255, 255, arg_113_1 or 255)
	end

	if type(arg_113_0) == "function" then
		arg_113_0 = arg_113_0()
	end

	if not arg_113_1 and (type(arg_113_0) == "userdata" or type(arg_113_0) == "Color") then
		return arg_113_0
	end

	if arg_113_1 and type(arg_113_0) == "userdata" and arg_113_0.a then
		local var_113_0 = arg_113_1 > 1 and arg_113_1 / 255 or arg_113_1

		return arg_113_0:a(var_113_0)
	end

	local var_113_1, var_113_2, var_113_3, var_113_4 = slot_0_40_0(arg_113_0)
	local var_113_5 = tonumber(arg_113_1 or var_113_4) or 255

	return draw.Color(math.floor(var_113_1), math.floor(var_113_2), math.floor(var_113_3), math.floor(var_113_5))
end

function slot_0_42_0(arg_114_0, arg_114_1, arg_114_2)
	if draw.color.interpolate then
		local var_114_0 = type(arg_114_0) == "table" and draw.Color(arg_114_0[1], arg_114_0[2], arg_114_0[3], arg_114_0[4]) or arg_114_0
		local var_114_1 = type(arg_114_1) == "table" and draw.Color(arg_114_1[1], arg_114_1[2], arg_114_1[3], arg_114_1[4]) or arg_114_1

		return draw.color.interpolate(var_114_0, var_114_1, arg_114_2)
	end

	local var_114_2, var_114_3, var_114_4, var_114_5 = slot_0_40_0(arg_114_0)
	local var_114_6, var_114_7, var_114_8, var_114_9 = slot_0_40_0(arg_114_1)

	return draw.Color(math.floor(math.Lerp(var_114_2, var_114_6, arg_114_2)), math.floor(math.Lerp(var_114_3, var_114_7, arg_114_2)), math.floor(math.Lerp(var_114_4, var_114_8, arg_114_2)), math.floor(math.Lerp(var_114_5, var_114_9, arg_114_2)))
end

function slot_0_43_0(arg_115_0, arg_115_1, arg_115_2)
	if not UI.animations then
		UI.animations = {}
	end

	local var_115_0 = UI.animations[arg_115_0] or 0
	local var_115_1 = game.globalVars and game.globalVars.m_flAbsFrameTime or 0.016
	local var_115_2 = math.Lerp(var_115_0, arg_115_1, math.min(1, var_115_1 * arg_115_2))

	UI.animations[arg_115_0] = var_115_2

	return var_115_2
end

function slot_0_44_0(arg_116_0, arg_116_1, arg_116_2, arg_116_3, arg_116_4, arg_116_5, arg_116_6)
	local var_116_0 = draw.surface
	local var_116_1 = 10
	local var_116_2, var_116_3, var_116_4, var_116_5 = slot_0_40_0(arg_116_4)
	local var_116_6 = arg_116_5 or 50

	for iter_116_0 = 1, var_116_1 do
		local var_116_7 = iter_116_0 * (iter_116_0 * 0.4)
		local var_116_8 = math.max(0, var_116_6 * 0.5^(iter_116_0 * 0.8))
		local var_116_9 = draw.Color(math.floor(var_116_2), math.floor(var_116_3), math.floor(var_116_4), math.floor(var_116_8))

		var_116_0:AddRectFilledRounded(draw.Rect(arg_116_0 - var_116_7, arg_116_1 - var_116_7, arg_116_0 + arg_116_2 + var_116_7, arg_116_1 + arg_116_3 + var_116_7), var_116_9, arg_116_6 or 8, 15)
	end
end

function slot_0_45_0(arg_117_0, arg_117_1, arg_117_2, arg_117_3, arg_117_4, arg_117_5)
	if not gui or not gui.textures then
		return
	end

	local var_117_0 = gui.textures[arg_117_0]

	if not var_117_0 then
		return
	end

	local var_117_1 = draw.surface

	if var_117_1.g and var_117_1.g.set_texture then
		var_117_1.g:set_texture(var_117_0)
		var_117_1:AddRectFilled(draw.Rect(arg_117_1, arg_117_2, arg_117_1 + arg_117_3, arg_117_2 + arg_117_4), arg_117_5 or draw.Color(255, 255, 255, 255))
		var_117_1.g:set_texture(nil)
	end
end

function slot_0_46_0(arg_118_0, arg_118_1, arg_118_2, arg_118_3)
	local var_118_0 = draw.surface
	local var_118_1 = draw.textures.gui_user_avatar

	if not var_118_1 then
		return false
	end

	if draw.fonts then
		var_118_0.font = draw.fonts.gui_main or draw.fonts.gui_semi_bold or draw.fonts.gui_bold
	end

	if var_118_0.add_image then
		var_118_0:AddImage(draw.Vec2(arg_118_0, arg_118_1), draw.Vec2(arg_118_2, arg_118_2), var_118_1)

		return true
	end

	if var_118_0.g and var_118_0.g.set_texture then
		var_118_0.g:set_texture(var_118_1)
		var_118_0:AddRectFilled(draw.Rect(arg_118_0, arg_118_1, arg_118_0 + arg_118_2, arg_118_1 + arg_118_2), draw.color.white())
		var_118_0.g:set_texture(nil)

		return true
	end

	return false
end

slot_0_47_0 = {
	wm_silentium = nil,
	wm_alt = nil
}
slot_0_48_0 = {
	switch_off = nil,
	switch_on = nil
}
slot_0_49_0 = "fatality/scripts/lib/"
slot_0_50_0 = "fatality/scripts/lib/"

function slot_0_51_0(arg_119_0, arg_119_1)
	if not arg_119_0 or not arg_119_1 then
		return draw.Vec2(0, 0)
	end

	local var_119_0 = arg_119_0:GetTextSize(tostring(arg_119_1))

	if var_119_0 then
		return var_119_0
	end

	return draw.Vec2(0, 0)
end

function slot_0_52_0(arg_120_0)
	if not draw or not draw.font then
		return
	end

	if not arg_120_0 and UI.fonts_loaded then
		return
	end

	UI.fonts_loaded = true

	if not UI.dpi_scale then
		slot_120_1_0 = 1
	end

	slot_120_2_0 = slot_0_7_0.bor(draw.font_flags.anti_alias, draw.font_flags.no_dpi)

	function slot_120_3_0(arg_121_0, arg_121_1, arg_121_2)
		local var_121_0 = slot_0_6_0.get_resource_dir()
		local var_121_1 = {
			var_121_0,
			var_121_0 .. "resources/",
			var_121_0 .. "Fonts/",
			"fatality/scripts/silentium/",
			"fatality/silentium/",
			"silentium/",
			"",
			"C:/Windows/Fonts/",
			[0] = nil
		}
		local var_121_2 = {
			arg_121_0,
			arg_121_0:gsub("%.ttf$", ""),
			arg_121_0:lower()
		}

		if not arg_121_0:match("%.ttf$") then
			table.insert(var_121_2, 1, arg_121_0 .. ".ttf")
		end

		for iter_121_0, iter_121_1 in ipairs(var_121_1) do
			for iter_121_2, iter_121_3 in ipairs(var_121_2) do
				local var_121_3 = (iter_121_1 == "" and "" or iter_121_1) .. iter_121_3

				if var_121_3:find(":") then
					var_121_3 = var_121_3:gsub("/", "\\")
				end

				local var_121_4 = draw.font(var_121_3, arg_121_1, arg_121_2, 0, 65535)

				if var_121_4 then
					var_121_4:create()
					print(string.format(" [Silentium] [SUCCESS] Loaded font: %s", iter_121_3))

					return var_121_4
				end
			end
		end

		return nil
	end

	if not slot_0_47_0.main then
		slot_0_47_0.main = slot_120_3_0("icons.ttf", 13, slot_120_2_0)
	end

	if not slot_0_47_0.alt then
		slot_0_47_0.alt = slot_120_3_0("Untitled1.ttf", 13, slot_120_2_0)
	end

	if not slot_0_47_0.silentium then
		slot_0_47_0.silentium = slot_120_3_0("silentium.ttf", 13, slot_120_2_0)
	end

	if not slot_0_47_0.wm_main then
		slot_0_47_0.wm_main = slot_120_3_0("icons.ttf", 13, slot_120_2_0)
	end

	if not slot_0_47_0.wm_alt then
		slot_0_47_0.wm_alt = slot_120_3_0("Untitled1.ttf", 13, slot_120_2_0)
	end

	if not slot_0_47_0.wm_silentium then
		slot_0_47_0.wm_silentium = slot_120_3_0("silentium.ttf", 13, slot_120_2_0)
	end

	if not UI.font then
		UI.font = draw.fonts.gui_semi_bold or draw.fonts.gui_main or draw.fonts.gui_bold
	end

	if not UI.font_small or arg_120_0 then
		UI.font_small = slot_120_3_0("Verdana.ttf", 8, 0) or draw.fonts.gui_main
	end

	if not UI.font_ls or arg_120_0 then
		UI.font_ls = slot_120_3_0("Verdana.ttf", 11, 0) or draw.fonts.gui_main
	end

	if not UI.font_middle or arg_120_0 then
		UI.font_middle = slot_120_3_0("Verdana.ttf", 8, 0) or draw.fonts.gui_main
	end

	if not UI.font_branding or arg_120_0 then
		UI.font_branding = slot_120_3_0("silentium.ttf", 20, 1) or slot_120_3_0("FreeSerifItalic.ttf", 20, 1) or slot_120_3_0("Verdana.ttf", 20, 1) or draw.fonts.gui_bold
	end

	if not UI.font_indicator or arg_120_0 then
		UI.font_indicator = slot_120_3_0("calibrib.ttf", 25, 1) or slot_120_3_0("calibri.ttf", 25, 1) or slot_120_3_0("Calibri Bold.ttf", 25, 1) or slot_120_3_0("Calibri.ttf", 25, 1)

		if not UI.font_indicator and draw and draw.create_font then
			slot_120_4_0, slot_120_5_0 = pcall(function()
				return draw.create_font("Calibri", 25, 700, true)
			end)

			if slot_120_4_0 and slot_120_5_0 then
				UI.font_indicator = slot_120_5_0

				print(" [Silentium] [SUCCESS] Created font via system: Calibri")
			end
		end

		UI.font_indicator = UI.font_indicator or slot_120_3_0("silentium.ttf", 25, 1) or slot_120_3_0("Verdana.ttf", 25, 1) or draw.fonts.gui_title or draw.fonts.gui_bold
	end

	if not UI.font_title or arg_120_0 then
		UI.font_title = slot_120_3_0("silentium.ttf", 15, slot_120_2_0) or slot_120_3_0("FreeSerifItalic.ttf", 15, slot_120_2_0)
	end

	if not UI.font_italic or arg_120_0 then
		UI.font_italic = slot_120_3_0("FreeSerifItalic.ttf", 14, 1) or slot_120_3_0("silentium.ttf", 14, 1)
	end

	if draw.svg_texture then
		if not slot_0_48_0.hotkeys then
			slot_0_48_0.hotkeys = draw.svg_texture(UI.embedded_icons.hotkeys, 14)

			slot_0_48_0.hotkeys:create()
		end

		if not slot_0_48_0.switch_on then
			slot_0_48_0.switch_on = draw.svg_texture(UI.embedded_icons.switch_on, 14)

			slot_0_48_0.switch_on:create()
		end

		if not slot_0_48_0.switch_off then
			slot_0_48_0.switch_off = draw.svg_texture(UI.embedded_icons.switch_off, 14)

			slot_0_48_0.switch_off:create()
		end
	end

	if not slot_0_47_0.wm_silentium then
		print(" [Silentium] [INFO] Custom fonts not found. For the full experience, please place 'silentium.ttf' and 'icons.ttf' in 'fatality/silentium/'.")
	end
end

slot_0_53_0 = {
	search = {
		"A",
		"main",
		[0] = nil
	},
	warning = {
		"B",
		"main",
		[0] = nil
	},
	folder = {
		"D",
		"main",
		[0] = nil
	},
	gear_thin = {
		"E",
		"main",
		[0] = nil
	},
	refresh = {
		"F",
		"main",
		[0] = nil
	},
	home = {
		"G",
		"main",
		[0] = nil
	},
	globe = {
		"G",
		"main",
		[0] = nil
	},
	crosshair = {
		"I",
		"main",
		[0] = nil
	},
	info = {
		"J",
		"main",
		[0] = nil
	},
	close = {
		"K",
		"main",
		[0] = nil
	},
	debug = {
		"N",
		"main",
		[0] = nil
	},
	keyboard = {
		"O",
		"main",
		[0] = nil
	},
	dashboard = {
		"P",
		"alt",
		[0] = nil
	},
	user = {
		"C",
		"alt",
		[0] = nil
	},
	pulse = {
		"T",
		"alt",
		[0] = nil
	},
	atom = {
		"F",
		"alt",
		[0] = nil
	},
	diamond = {
		"W",
		"alt",
		[0] = nil
	},
	download = {
		"X",
		"alt",
		[0] = nil
	},
	trash = {
		"Y",
		"alt",
		[0] = nil
	},
	alert = {
		"Z",
		"alt",
		[0] = nil
	},
	bug_small = {
		"a",
		"alt",
		[0] = nil
	},
	ladder = {
		"b",
		"alt",
		[0] = nil
	},
	pliers = {
		"c",
		"alt",
		[0] = nil
	},
	file = {
		"d",
		"alt",
		[0] = nil
	},
	chicken = {
		"e",
		"alt",
		[0] = nil
	},
	build = {
		"E",
		"alt",
		[0] = nil
	},
	version = {
		"F",
		"alt",
		[0] = nil
	},
	movement = {
		"=",
		"alt",
		[0] = nil
	},
	jumpscout = {
		"=",
		"alt",
		[0] = nil
	},
	skull = {
		"D",
		"alt",
		[0] = nil
	},
	ragebot = {
		"9",
		"alt",
		[0] = nil
	},
	shield = {
		"9",
		"alt",
		[0] = nil
	},
	["anti-aim"] = {
		"Q",
		"silentium",
		[0] = nil
	},
	eye = {
		"5",
		"alt",
		[0] = nil
	},
	visuals = {
		"5",
		"alt",
		[0] = nil
	},
	star = {
		"R",
		"silentium",
		[0] = nil
	},
	sparkle = {
		"r",
		"alt",
		[0] = nil
	},
	misc = {
		"E",
		"main",
		[0] = nil
	},
	gear = {
		"8",
		"alt",
		[0] = nil
	},
	settings = {
		"8",
		"alt",
		[0] = nil
	},
	config = {
		"6",
		"alt",
		[0] = nil
	},
	action_save = {
		"D",
		"silentium",
		[0] = nil
	},
	action_load = {
		"E",
		"silentium",
		[0] = nil
	},
	action_import = {
		"B",
		"silentium",
		[0] = nil
	},
	action_export = {
		"C",
		"silentium",
		[0] = nil
	},
	action_delete = {
		"F",
		"silentium",
		[0] = nil
	},
	action_refresh = {
		"G",
		"silentium",
		[0] = nil
	},
	lotus = {
		"P",
		"alt",
		[0] = nil
	},
	tools = {
		"c",
		"alt",
		[0] = nil
	},
	link = {
		"A",
		"silentium",
		[0] = nil
	},
	social = {
		"C",
		"main",
		[0] = nil
	},
	wifi = {
		"H",
		"silentium",
		[0] = nil
	},
	["wallbang helper"] = {
		"I",
		"main",
		[0] = nil
	},
	target = {
		"9",
		"alt",
		[0] = nil
	},
	plus = {
		"E",
		"main",
		[0] = nil
	},
	pliers = {
		"8",
		"alt",
		[0] = nil
	},
	cloud = {
		"X",
		"alt",
		[0] = nil
	}
}

function draw_icon_proc(arg_123_0, arg_123_1, arg_123_2, arg_123_3, arg_123_4)
	slot_123_5_0 = draw.surface
	slot_123_6_0 = arg_123_4

	if type(arg_123_4) ~= "userdata" and type(arg_123_4) ~= "Color" then
		slot_123_7_1, slot_123_8_2, slot_123_9_2, slot_123_10_1 = slot_0_40_0(arg_123_4)
		slot_123_6_0 = draw.Color(slot_123_7_1, slot_123_8_2, slot_123_9_2, slot_123_10_1)
	end

	slot_123_7_0 = slot_0_53_0[arg_123_0]

	if slot_123_7_0 then
		slot_123_8_1 = slot_123_7_0[1]
		slot_123_9_1 = slot_0_47_0[slot_123_7_0[2]]

		if slot_123_9_1 and slot_123_8_1 then
			slot_123_10_0 = slot_123_9_1:GetTextSize(slot_123_8_1)
			slot_123_11_0 = (arg_123_3 - slot_123_10_0.x) / 2
			slot_123_12_0 = (arg_123_3 - slot_123_10_0.y) / 2
			slot_123_13_1 = slot_123_5_0.font
			slot_123_5_0.font = slot_123_9_1

			slot_123_5_0:AddText(draw.Vec2(arg_123_1 + slot_123_11_0, arg_123_2 + slot_123_12_0), slot_123_8_1, slot_123_6_0)

			slot_123_5_0.font = slot_123_13_1

			return
		end
	end

	slot_123_8_0 = arg_123_1 + arg_123_3 / 2
	slot_123_9_0 = arg_123_2 + arg_123_3 / 2

	if arg_123_0 == "home" then
		slot_123_5_0:AddRectFilled(draw.Rect(arg_123_1 + arg_123_3 * 0.2, slot_123_9_0, arg_123_1 + arg_123_3 * 0.8, arg_123_2 + arg_123_3 * 0.8), slot_123_6_0)
		slot_123_5_0:AddTriangleFilled(draw.Vec2(arg_123_1, slot_123_9_0), draw.Vec2(arg_123_1 + arg_123_3, slot_123_9_0), draw.Vec2(slot_123_8_0, arg_123_2), slot_123_6_0)
	elseif arg_123_0 == "skull" or arg_123_0 == "ragebot" then
		slot_123_5_0:AddCircleFilled(draw.Vec2(slot_123_8_0, slot_123_9_0 - arg_123_3 * 0.1), arg_123_3 * 0.35, slot_123_6_0)
		slot_123_5_0:AddRectFilled(draw.Rect(slot_123_8_0 - arg_123_3 * 0.2, slot_123_9_0 + arg_123_3 * 0.1, slot_123_8_0 + arg_123_3 * 0.2, slot_123_9_0 + arg_123_3 * 0.4), slot_123_6_0)
	elseif arg_123_0 == "shield" or arg_123_0 == "anti-aim" then
		slot_123_5_0:AddRectFilled(draw.Rect(arg_123_1 + arg_123_3 * 0.2, arg_123_2 + arg_123_3 * 0.1, arg_123_1 + arg_123_3 * 0.8, slot_123_9_0 + arg_123_3 * 0.1), slot_123_6_0)
		slot_123_5_0:AddTriangleFilled(draw.Vec2(arg_123_1 + arg_123_3 * 0.2, slot_123_9_0 + arg_123_3 * 0.1), draw.Vec2(arg_123_1 + arg_123_3 * 0.8, slot_123_9_0 + arg_123_3 * 0.1), draw.Vec2(slot_123_8_0, arg_123_2 + arg_123_3 * 0.9), slot_123_6_0)
	elseif arg_123_0 == "eye" or arg_123_0 == "visuals" then
		slot_123_5_0:AddCircle(draw.Vec2(slot_123_8_0, slot_123_9_0), arg_123_3 * 0.4, slot_123_6_0, 24, 1.5)
		slot_123_5_0:AddCircleFilled(draw.Vec2(slot_123_8_0, slot_123_9_0), arg_123_3 * 0.15, slot_123_6_0)
	elseif arg_123_0 == "star" or arg_123_0 == "misc" then
		slot_123_5_0:AddCircleFilled(draw.Vec2(slot_123_8_0, slot_123_9_0), arg_123_3 * 0.25, slot_123_6_0)

		for iter_123_0 = 0, 4 do
			slot_123_14_0 = math.rad(iter_123_0 * 72 - 90)

			slot_123_5_0:AddLine(draw.Vec2(slot_123_8_0, slot_123_9_0), draw.Vec2(slot_123_8_0 + math.cos(slot_123_14_0) * arg_123_3 * 0.45, slot_123_9_0 + math.sin(slot_123_14_0) * arg_123_3 * 0.45), slot_123_6_0, 2)
		end
	elseif arg_123_0 == "gear" or arg_123_0 == "settings" or arg_123_0 == "config" then
		slot_123_5_0:AddCircle(draw.Vec2(slot_123_8_0, slot_123_9_0), arg_123_3 * 0.35, slot_123_6_0, 24, 1.5)
		slot_123_5_0:AddCircleFilled(draw.Vec2(slot_123_8_0, slot_123_9_0), arg_123_3 * 0.15, slot_123_6_0)
	elseif arg_123_0 == "user" then
		slot_123_5_0:AddCircleFilled(draw.Vec2(slot_123_8_0, slot_123_9_0 - arg_123_3 * 0.15), arg_123_3 * 0.2, slot_123_6_0)
		slot_123_5_0:AddCircle(draw.Vec2(slot_123_8_0, slot_123_9_0 + arg_123_3 * 0.25), arg_123_3 * 0.35, slot_123_6_0, 24, 1.5)
	elseif arg_123_0 == "save" then
		slot_123_5_0:AddRect(draw.Rect(arg_123_1 + arg_123_3 * 0.15, arg_123_2 + arg_123_3 * 0.1, arg_123_1 + arg_123_3 * 0.85, arg_123_2 + arg_123_3 * 0.9), slot_123_6_0, 1.5)
		slot_123_5_0:AddRectFilled(draw.Rect(arg_123_1 + arg_123_3 * 0.3, arg_123_2 + arg_123_3 * 0.1, arg_123_1 + arg_123_3 * 0.7, arg_123_2 + arg_123_3 * 0.35), slot_123_6_0)
	elseif arg_123_0 == "load" or arg_123_0 == "download" then
		slot_123_5_0:AddLine(draw.Vec2(slot_123_8_0, arg_123_2 + arg_123_3 * 0.2), draw.Vec2(slot_123_8_0, arg_123_2 + arg_123_3 * 0.7), slot_123_6_0, 2)
		slot_123_5_0:AddTriangleFilled(draw.Vec2(slot_123_8_0 - arg_123_3 * 0.2, slot_123_9_0 + arg_123_3 * 0.1), draw.Vec2(slot_123_8_0 + arg_123_3 * 0.2, slot_123_9_0 + arg_123_3 * 0.1), draw.Vec2(slot_123_8_0, arg_123_2 + arg_123_3 * 0.8), slot_123_6_0)
	elseif arg_123_0 == "export" or arg_123_0 == "file-up" then
		slot_123_5_0:AddLine(draw.Vec2(slot_123_8_0, arg_123_2 + arg_123_3 * 0.3), draw.Vec2(slot_123_8_0, arg_123_2 + arg_123_3 * 0.8), slot_123_6_0, 2)
		slot_123_5_0:AddTriangleFilled(draw.Vec2(slot_123_8_0 - arg_123_3 * 0.2, slot_123_9_0 - arg_123_3 * 0.1), draw.Vec2(slot_123_8_0 + arg_123_3 * 0.2, slot_123_9_0 - arg_123_3 * 0.1), draw.Vec2(slot_123_8_0, arg_123_2 + arg_123_3 * 0.2), slot_123_6_0)
	elseif arg_123_0 == "globe" then
		slot_123_5_0:AddCircle(draw.Vec2(slot_123_8_0, slot_123_9_0), arg_123_3 * 0.4, slot_123_6_0, 24, 1.5)
		slot_123_5_0:AddLine(draw.Vec2(slot_123_8_0, arg_123_2 + arg_123_3 * 0.1), draw.Vec2(slot_123_8_0, arg_123_2 + arg_123_3 * 0.9), slot_123_6_0, 1)
		slot_123_5_0:AddLine(draw.Vec2(arg_123_1 + arg_123_3 * 0.1, slot_123_9_0), draw.Vec2(arg_123_1 + arg_123_3 * 0.9, slot_123_9_0), slot_123_6_0, 1)
	elseif arg_123_0 == "wrench" or arg_123_0 == "tools" then
		slot_123_5_0:AddRect(draw.Rect(arg_123_1 + arg_123_3 * 0.6, arg_123_2 + arg_123_3 * 0.2, arg_123_1 + arg_123_3 * 0.8, arg_123_2 + arg_123_3 * 0.8), slot_123_6_0, 1.5)
		slot_123_5_0:AddCircle(draw.Vec2(arg_123_1 + arg_123_3 * 0.3, slot_123_9_0 - arg_123_3 * 0.1), arg_123_3 * 0.15, slot_123_6_0, 16, 1.5)
	elseif arg_123_0 == "move" then
		slot_123_5_0:AddLine(draw.Vec2(slot_123_8_0, arg_123_2 + arg_123_3 * 0.2), draw.Vec2(slot_123_8_0, arg_123_2 + arg_123_3 * 0.8), slot_123_6_0, 1.5)
		slot_123_5_0:AddLine(draw.Vec2(arg_123_1 + arg_123_3 * 0.2, slot_123_9_0), draw.Vec2(arg_123_1 + arg_123_3 * 0.8, slot_123_9_0), slot_123_6_0, 1.5)
	elseif arg_123_0 == "youtube" then
		slot_123_5_0:AddRectFilledRounded(draw.Rect(arg_123_1 + arg_123_3 * 0.1, arg_123_2 + arg_123_3 * 0.25, arg_123_1 + arg_123_3 * 0.9, arg_123_2 + arg_123_3 * 0.75), slot_123_6_0, 2)
		slot_123_5_0:AddTriangleFilled(draw.Vec2(arg_123_1 + arg_123_3 * 0.35, arg_123_2 + arg_123_3 * 0.35), draw.Vec2(arg_123_1 + arg_123_3 * 0.35, arg_123_2 + arg_123_3 * 0.65), draw.Vec2(arg_123_1 + arg_123_3 * 0.65, slot_123_9_0), slot_123_6_0)
	elseif arg_123_0 == "discord" then
		slot_123_5_0:AddRectFilledRounded(draw.Rect(arg_123_1 + arg_123_3 * 0.2, arg_123_2 + arg_123_3 * 0.3, arg_123_1 + arg_123_3 * 0.8, arg_123_2 + arg_123_3 * 0.7), slot_123_6_0, 3)
		slot_123_5_0:AddCircleFilled(draw.Vec2(arg_123_1 + arg_123_3 * 0.4, slot_123_9_0), arg_123_3 * 0.08, slot_123_6_0)
		slot_123_5_0:AddCircleFilled(draw.Vec2(arg_123_1 + arg_123_3 * 0.6, slot_123_9_0), arg_123_3 * 0.08, slot_123_6_0)
	end
end

UI.notifications = UI.notifications or {}

function draw_splash_screen()
	if not slot_0_36_0.loading.active then
		return
	end

	slot_124_0_0 = draw.surface

	if not slot_124_0_0 then
		return
	end

	slot_124_1_0 = game.globalVars.m_flRealTime

	if slot_0_36_0.loading.start_time == 0 then
		slot_0_36_0.loading.start_time = slot_124_1_0
	end

	slot_124_2_0 = slot_124_1_0 - slot_0_36_0.loading.start_time
	slot_124_3_0 = 2.5

	if slot_124_3_0 < slot_124_2_0 then
		slot_0_36_0.loading.active = false
		UI.open = true

		notify("Silentium Loaded", "success")

		return
	end

	slot_124_4_0 = math.min(slot_124_2_0 / (slot_124_3_0 - 0.5), 1)
	slot_0_36_0.loading.progress = slot_124_4_0
	slot_124_5_0 = 255

	if slot_124_2_0 < 0.5 then
		slot_124_5_0 = math.floor(slot_124_2_0 / 0.5 * 255)
	elseif slot_124_2_0 > slot_124_3_0 - 0.5 then
		slot_124_5_0 = math.floor((slot_124_3_0 - slot_124_2_0) / 0.5 * 255)
	end

	slot_124_6_0, slot_124_7_0 = game.engine:GetScreenSize()
	slot_124_8_0 = slot_124_6_0 / 2
	slot_124_9_0 = slot_124_7_0 / 2
	slot_124_10_0 = UI.theme

	slot_124_0_0:AddRectFilled(draw.Rect(0, 0, slot_124_6_0, slot_124_7_0), draw.Color(25, 25, 25, math.floor(slot_124_5_0 * 0.9)))

	slot_124_11_0 = slot_0_41_0(slot_124_10_0.accent, slot_124_5_0)
	slot_124_12_0 = draw.Color(255, 255, 255, slot_124_5_0)

	if slot_0_36_0.loading.logo_tex then
		slot_124_13_2 = 140

		slot_124_0_0.g:set_texture(slot_0_36_0.loading.logo_tex)
		slot_124_0_0:AddRectFilled(draw.Rect(slot_124_8_0 - slot_124_13_2 / 2, slot_124_9_0 - slot_124_13_2 / 2 - 40, slot_124_8_0 + slot_124_13_2 / 2, slot_124_9_0 + slot_124_13_2 / 2 - 40), draw.Color(255, 255, 255, 255))
	else
		slot_124_0_0.font = UI.font_branding or draw.fonts.gui_bold or draw.fonts.gui_main
		slot_124_13_1 = "S I L E N T I U M"
		slot_124_14_1 = slot_0_51_0(slot_124_0_0.font, slot_124_13_1)

		slot_124_0_0:AddText(draw.Vec2(slot_124_8_0 - slot_124_14_1.x / 2 + 1, slot_124_9_0 - slot_124_14_1.y / 2 - 59), slot_124_13_1, draw.Color(0, 0, 0, math.floor(slot_124_5_0 * 0.5)))
		slot_124_0_0:AddText(draw.Vec2(slot_124_8_0 - slot_124_14_1.x / 2, slot_124_9_0 - slot_124_14_1.y / 2 - 60), slot_124_13_1, slot_124_11_0)
	end

	slot_124_0_0.font = draw.fonts.gui_main
	slot_124_13_0 = "setting the benchmark"
	slot_124_14_0 = slot_0_51_0(slot_124_0_0.font, slot_124_13_0)

	slot_124_0_0:AddText(draw.Vec2(slot_124_8_0 - slot_124_14_0.x / 2, slot_124_9_0 - 20), slot_124_13_0, draw.Color(180, 180, 180, math.floor(slot_124_5_0 * 0.7)))

	slot_124_15_0 = 260
	slot_124_16_0 = 2
	slot_124_17_0 = slot_124_8_0 - slot_124_15_0 / 2
	slot_124_18_0 = slot_124_9_0 + 40

	slot_124_0_0:AddRectFilled(draw.Rect(slot_124_17_0, slot_124_18_0, slot_124_17_0 + slot_124_15_0, slot_124_18_0 + slot_124_16_0), draw.Color(255, 255, 255, math.floor(slot_124_5_0 * 0.1)))
	slot_124_0_0:AddRectFilled(draw.Rect(slot_124_17_0, slot_124_18_0, slot_124_17_0 + slot_124_15_0 * slot_124_4_0, slot_124_18_0 + slot_124_16_0), draw.Color(255, 255, 255, math.floor(slot_124_5_0 * 0.8)))

	slot_124_19_0 = "Initializing..."

	if slot_124_4_0 > 0.8 then
		slot_124_19_0 = "Starting UI Engine..."
	elseif slot_124_4_0 > 0.6 then
		slot_124_19_0 = "Fetching Cloud Configs..."
	elseif slot_124_4_0 > 0.3 then
		slot_124_19_0 = "Linking AA Modules..."
	elseif slot_124_4_0 > 0.1 then
		slot_124_19_0 = "Loading Script Resources..."
	end

	slot_124_0_0.font = draw.fonts.gui_main
	slot_124_20_0 = slot_0_51_0(draw.fonts.gui_main, slot_124_19_0)

	slot_124_0_0:AddText(draw.Vec2(slot_124_8_0 - slot_124_20_0.x / 2, slot_124_18_0 + 15), slot_124_19_0, draw.Color(200, 200, 200, math.floor(slot_124_5_0 * 0.8)))

	slot_124_21_0 = "v1.0"
	slot_124_22_0 = slot_0_51_0(draw.fonts.gui_main, slot_124_21_0)

	slot_124_0_0:AddText(draw.Vec2(slot_124_8_0 - slot_124_22_0.x / 2, slot_124_18_0 + 40), slot_124_21_0, draw.Color(100, 100, 100, math.floor(slot_124_5_0 * 0.5)))
end

function notify(arg_125_0, arg_125_1)
	table.insert(UI.notifications, {
		alpha = 0,
		[0] = nil,
		message = arg_125_0,
		type = arg_125_1 or "info",
		time = game.globalVars and game.globalVars.m_flRealTime or 0
	})

	if #UI.notifications > 5 then
		table.remove(UI.notifications, 1)
	end
end

function slot_0_54_0()
	if not UI.notifications or #UI.notifications == 0 then
		return
	end

	slot_126_0_0 = draw.surface

	if not slot_126_0_0 then
		return
	end

	slot_126_1_0, slot_126_2_0 = game.engine:GetScreenSize()
	slot_126_3_0 = slot_126_0_0.font
	slot_126_4_0 = 220
	slot_126_5_0 = 32
	slot_126_6_0 = slot_126_1_0 - slot_126_4_0 - 20
	slot_126_7_0 = 60
	slot_126_8_0 = UI.theme
	slot_126_9_0 = draw.fonts.gui_main
	slot_126_0_0.font = slot_126_9_0

	for iter_126_0 = #UI.notifications, 1, -1 do
		slot_126_14_0 = UI.notifications[iter_126_0]
		slot_126_15_0 = 3
		slot_126_16_0 = (game.globalVars and game.globalVars.m_flRealTime or 0) - slot_126_14_0.time

		if slot_126_15_0 < slot_126_16_0 then
			table.remove(UI.notifications, iter_126_0)
		else
			slot_126_17_0 = 1

			if slot_126_16_0 < 0.4 then
				slot_126_17_0 = 1 - math.pow(1 - slot_126_16_0 / 0.4, 3)
			elseif slot_126_16_0 > slot_126_15_0 - 0.6 then
				slot_126_17_0 = 1 - math.pow(1 - (slot_126_15_0 - slot_126_16_0) / 0.6, 3)
			end

			slot_126_18_0 = math.floor(255 * slot_126_17_0)
			slot_126_19_0 = slot_126_7_0
			slot_126_20_0 = slot_126_6_0

			if slot_126_16_0 < 0.4 then
				slot_126_20_0 = slot_126_6_0 + (1 - slot_126_17_0) * 100
			end

			slot_126_21_0 = slot_126_8_0.accent or {
				255,
				90,
				130,
				255,
				[0] = nil
			}
			slot_126_22_0 = slot_126_21_0[1] or 255
			slot_126_23_0 = slot_126_21_0[2] or 90
			slot_126_24_0 = slot_126_21_0[3] or 130
			slot_126_25_0 = draw.GetTime()
			slot_126_26_0 = math.sin(slot_126_25_0 * 1.5) * 0.5 + 0.5

			for iter_126_1 = 1, 4 do
				slot_126_31_1 = iter_126_1 * 1.5
				slot_126_32_1 = math.floor((18 - iter_126_1 * 5) * (0.4 + slot_126_26_0 * 0.6) * slot_126_17_0)

				if slot_126_32_1 > 0 then
					slot_126_0_0:AddRectFilledRounded(draw.Rect(slot_126_20_0 - slot_126_31_1, slot_126_19_0 - slot_126_31_1, slot_126_20_0 + slot_126_4_0 + slot_126_31_1, slot_126_19_0 + slot_126_5_0 + slot_126_31_1), draw.Color(slot_126_22_0, slot_126_23_0, slot_126_24_0, slot_126_32_1), 8, 15)
				end
			end

			if slot_126_0_0.add_background_blur then
				slot_126_0_0:AddBackgroundBlur(draw.Rect(slot_126_20_0, slot_126_19_0, slot_126_20_0 + slot_126_4_0, slot_126_19_0 + slot_126_5_0), 2)
			end

			function slot_126_27_0(arg_127_0, arg_127_1)
				local var_127_0 = math.sin(slot_126_25_0 * 1.2 + arg_127_0) * 0.5 + 0.5

				return draw.Color(math.floor(5 + slot_126_22_0 * 0.15 * var_127_0), math.floor(5 + slot_126_23_0 * 0.15 * var_127_0), math.floor(8 + slot_126_24_0 * 0.15 * var_127_0), math.floor(arg_127_1 * (0.8 + var_127_0 * 0.2) * slot_126_17_0))
			end

			slot_126_0_0:AddRectFilledRoundedMulticolor(draw.Rect(slot_126_20_0, slot_126_19_0, slot_126_20_0 + slot_126_4_0, slot_126_19_0 + slot_126_5_0), {
				slot_126_27_0(0, 225),
				slot_126_27_0(2, 255),
				slot_126_27_0(4, 245),
				slot_126_27_0(6, 220)
			}, 6, 15)
			slot_126_0_0:AddRectFilledRounded(draw.Rect(slot_126_20_0 + 2, slot_126_19_0, slot_126_20_0 + slot_126_4_0 - 2, slot_126_19_0 + 1), draw.Color(255, 255, 255, math.floor(30 * slot_126_17_0)), 6)

			slot_126_28_0 = slot_0_51_0(slot_126_9_0, slot_126_14_0.message)
			slot_126_29_0 = slot_126_20_0 + (slot_126_4_0 - slot_126_28_0.x) / 2
			slot_126_30_0 = slot_126_19_0 + (slot_126_5_0 - slot_126_28_0.y) / 2

			slot_126_0_0:AddText(draw.Vec2(slot_126_29_0, slot_126_30_0), slot_126_14_0.message, slot_0_41_0(slot_126_8_0.text, slot_126_18_0))

			slot_126_31_0 = 1 - slot_126_16_0 / slot_126_15_0
			slot_126_32_0 = math.floor((slot_126_4_0 - 20) * slot_126_31_0)

			if slot_126_32_0 > 0 then
				slot_126_33_0 = slot_126_20_0 + 10
				slot_126_34_0 = slot_126_19_0 + slot_126_5_0 - 4

				slot_126_0_0:AddRectFilled(draw.Rect(slot_126_33_0, slot_126_34_0 - 1, slot_126_33_0 + slot_126_32_0, slot_126_34_0 + 2), slot_0_41_0(slot_126_21_0, math.floor(40 * slot_126_17_0)))
				slot_126_0_0:AddRectFilled(draw.Rect(slot_126_33_0, slot_126_34_0, slot_126_33_0 + slot_126_32_0, slot_126_34_0 + 1), slot_0_41_0(slot_126_21_0, slot_126_18_0))
			end

			slot_126_7_0 = slot_126_7_0 + slot_126_5_0 + 10
		end
	end

	slot_126_0_0.font = slot_126_3_0
end

function slot_0_55_0()
	if not UI.open then
		return
	end

	local var_128_0 = draw.surface

	if not var_128_0 then
		return
	end

	local var_128_1, var_128_2 = game.engine:GetScreenSize()
	local var_128_3 = var_128_1 / 2
	local var_128_4 = var_128_2 / 2
	local var_128_5 = UI.theme
	local var_128_6 = UI.snap_guides.x and 1 or 0
	local var_128_7 = UI.snap_guides.y and 1 or 0
	local var_128_8 = slot_0_43_0("snap_x", var_128_6, 15)
	local var_128_9 = slot_0_43_0("snap_y", var_128_7, 15)
	local var_128_10 = 60

	if var_128_8 > 0.01 then
		local var_128_11 = slot_0_41_0(var_128_5.accent, math.floor(var_128_10 * var_128_8))

		var_128_0:AddLine(draw.Vec2(var_128_3, 0), draw.Vec2(var_128_3, var_128_2), var_128_11, 1.5)
		var_128_0:AddLine(draw.Vec2(var_128_3, 0), draw.Vec2(var_128_3, var_128_2), slot_0_41_0(var_128_5.accent, math.floor(20 * var_128_8)), 4)
	end

	if var_128_9 > 0.01 then
		local var_128_12 = slot_0_41_0(var_128_5.accent, math.floor(var_128_10 * var_128_9))

		var_128_0:AddLine(draw.Vec2(0, var_128_4), draw.Vec2(var_128_1, var_128_4), var_128_12, 1.5)
		var_128_0:AddLine(draw.Vec2(0, var_128_4), draw.Vec2(var_128_1, var_128_4), slot_0_41_0(var_128_5.accent, math.floor(20 * var_128_9)), 4)
	end
end

function slot_0_56_0()
	if not is_enabled("recoil_crosshair") then
		return
	end

	local var_129_0 = entities.GetLocalPawn()

	if not var_129_0 or not var_129_0:IsAlive() then
		return
	end

	local var_129_1 = draw.surface
	local var_129_2, var_129_3 = game.engine:GetScreenSize()
	local var_129_4 = var_129_2 / 2
	local var_129_5 = var_129_3 / 2
	local var_129_6 = var_129_0:get_aim_punch()

	if var_129_6 and (var_129_6.x ~= 0 or var_129_6.y ~= 0) then
		local var_129_7 = 90

		if entities.get_local_player then
			local var_129_8 = entities:get_local_player()

			if var_129_8 and var_129_8.get_fov then
				var_129_7 = var_129_8:get_fov()
			end
		end

		local var_129_9 = var_129_6.y / var_129_7 * (var_129_2 / 2)
		local var_129_10 = var_129_6.x / var_129_7 * (var_129_3 / 2)
		local var_129_11 = var_129_4 - var_129_9
		local var_129_12 = var_129_5 + var_129_10
		local var_129_13 = UI.cfg.recoil_crosshair_color
		local var_129_14 = draw.Color(var_129_13[1], var_129_13[2], var_129_13[3], var_129_13[4] or 255)

		slot_0_44_0(var_129_11 - 2, var_129_12 - 2, 4, 4, var_129_13, 60, 2)
		var_129_1:AddRectFilledRounded(draw.Rect(var_129_11 - 1.5, var_129_12 - 1.5, var_129_11 + 1.5, var_129_12 + 1.5), var_129_14, 2)
	end
end

function slot_0_57_0(arg_130_0, arg_130_1, arg_130_2, arg_130_3, arg_130_4)
	local var_130_0 = game.globalVars.m_flRealTime or 0
	local var_130_1 = 30 + (math.sin(var_130_0 * 2) + 1) * 0.5 * 20

	slot_0_44_0(arg_130_0, arg_130_1, arg_130_2, arg_130_3, arg_130_4.glow, var_130_1, 8)
end

function slot_0_51_0(arg_131_0, arg_131_1)
	arg_131_1 = arg_131_1 or ""

	local function var_131_0(arg_132_0, arg_132_1)
		if draw and draw.vec2 then
			return draw.Vec2(arg_132_0, arg_132_1)
		end

		return {
			x = arg_132_0,
			y = arg_132_1
		}
	end

	if type(arg_131_0) == "number" then
		if draw and draw.get_text_size then
			local var_131_1, var_131_2 = draw.get_text_size(arg_131_0, arg_131_1)

			if var_131_1 and var_131_2 then
				return var_131_0(var_131_1, var_131_2)
			end
		end

		return var_131_0(10, 10)
	end

	if (type(arg_131_0) == "table" or type(arg_131_0) == "userdata") and arg_131_0.get_text_size then
		return arg_131_0:GetTextSize(arg_131_1)
	end

	return var_131_0(0, 0)
end

if not draw.fonts then
	draw.fonts = {}
end

function slot_0_58_0(arg_133_0, arg_133_1)
	return nil
end

slot_0_59_0 = {
	y = 0,
	clicked_on_popup = false,
	x = 0,
	clicked = false,
	mouse_down = false,
	group_w = 180,
	input_blocked = false,
	match = nil,
	char_buffer = {}
}
slot_0_60_0 = false

events.input:Add(function(arg_134_0, arg_134_1, arg_134_2)
	if UI and UI.mouse_keys then
		if arg_134_0 == 513 then
			UI.mouse_keys[1] = true
			slot_0_60_0 = true
		elseif arg_134_0 == 514 then
			UI.mouse_keys[1] = false
			slot_0_60_0 = false
		elseif arg_134_0 == 516 then
			UI.mouse_keys[2] = true
		elseif arg_134_0 == 517 then
			UI.mouse_keys[2] = false
		elseif arg_134_0 == 519 then
			UI.mouse_keys[4] = true
		elseif arg_134_0 == 520 then
			UI.mouse_keys[4] = false
		elseif arg_134_0 == 523 or arg_134_0 == 524 then
			local var_134_0 = 1

			if type(arg_134_1) == "number" then
				var_134_0 = slot_0_7_0.rshift(arg_134_1, 16)
			end

			local var_134_1 = arg_134_0 == 523

			if var_134_0 == 1 then
				UI.mouse_keys[5] = var_134_1
			elseif var_134_0 == 2 then
				UI.mouse_keys[6] = var_134_1
			end
		end

		UI.last_msg = arg_134_0
	end

	if arg_134_0 == 522 then
		local var_134_2 = 0

		if type(arg_134_1) == "number" then
			local var_134_3 = slot_0_7_0.rshift(arg_134_1, 16)

			if var_134_3 > 32767 then
				var_134_3 = var_134_3 - 65536
			end

			slot_0_59_0.scroll_delta = var_134_3 / 120
		end
	end

	if arg_134_0 == 258 then
		if type(arg_134_1) == "number" and arg_134_1 >= 0 and arg_134_1 <= 255 then
			table.insert(slot_0_59_0.char_buffer, string.char(arg_134_1))
		end
	elseif arg_134_0 == 256 and arg_134_1 == 8 then
		table.insert(slot_0_59_0.char_buffer, "BACKSPACE")
	end
end)

function slot_0_61_0(arg_135_0, arg_135_1, arg_135_2, arg_135_3)
	slot_0_59_0.input_blocked = false
	slot_0_59_0.scroll_delta = slot_0_59_0.scroll_delta or 0
	slot_0_59_0.x = arg_135_0
	slot_0_59_0.y = arg_135_1
	slot_0_59_0.Mouse = arg_135_2
	slot_0_59_0.mouse_down = arg_135_3
	slot_0_59_0.clicked = arg_135_3 and not UI.last_mouse_state
	UI.last_mouse_state = arg_135_3
	slot_0_59_0.clicked_on_popup = false

	if UI.active_settings_popup and UI.active_settings_data then
		local var_135_0 = UI.active_settings_data
		local var_135_1 = 210

		if arg_135_2 and arg_135_2.x >= var_135_0.x and arg_135_2.x <= var_135_0.x + var_135_1 and arg_135_2.y >= var_135_0.y then
			slot_0_59_0.clicked_on_popup = true
		end
	end
end

function slot_0_62_0(arg_136_0, arg_136_1, arg_136_2, arg_136_3, arg_136_4, arg_136_5)
	if arg_136_5 ~= nil then
		if type(arg_136_5) == "function" then
			if not arg_136_5() then
				return 0
			end
		elseif not arg_136_5 then
			return 0
		end
	end

	local var_136_0 = slot_0_59_0.x
	local var_136_1 = slot_0_59_0.y
	local var_136_2 = UI.theme
	local var_136_3 = draw.surface
	local var_136_4 = 28
	local var_136_5 = 16
	local var_136_6 = false
	local var_136_7 = arg_136_0
	local var_136_8 = var_136_6 and "this feature is beta only" or arg_136_2
	local var_136_9 = false

	if slot_0_59_0.Mouse and var_136_0 <= slot_0_59_0.Mouse.x and slot_0_59_0.Mouse.x <= var_136_0 + var_136_4 and var_136_1 <= slot_0_59_0.Mouse.y and slot_0_59_0.Mouse.y <= var_136_1 + var_136_5 then
		var_136_9 = true

		if var_136_8 then
			slot_0_59_0.hovered_tooltip = var_136_8
		end
	end

	local var_136_10 = UI.cfg[arg_136_1]

	if not UI.active_settings_data and not UI.active_combo_data and not var_136_6 and var_136_9 and slot_0_59_0.clicked and not slot_0_59_0.clicked_on_popup then
		UI.cfg[arg_136_1] = not UI.cfg[arg_136_1]
		slot_0_59_0.clicked = false
	end

	local var_136_11 = slot_0_43_0(arg_136_1, var_136_10 and 1 or 0, 12)
	local var_136_12 = slot_0_42_0({
		60,
		60,
		65,
		255,
		[0] = nil
	}, var_136_2.accent, var_136_11)
	local var_136_13 = slot_0_42_0({
		30,
		30,
		35,
		255,
		[0] = nil
	}, var_136_2.accent, var_136_11 * 0.2)

	if var_136_6 then
		var_136_13 = draw.Color(25, 25, 30, 100)
	end

	var_136_3:AddRectFilledRounded(draw.Rect(var_136_0, var_136_1, var_136_0 + var_136_4, var_136_1 + var_136_5), var_136_13, var_136_5 / 2)

	local var_136_14 = var_136_0 + 2 + (var_136_4 - var_136_5) * var_136_11
	local var_136_15 = var_136_5 - 4
	local var_136_16 = var_136_6 and draw.Color(100, 100, 110, 255) or draw.Color(255, 255, 255, 255)

	var_136_3:AddCircleFilled(draw.Vec2(var_136_14 + var_136_15 / 2, var_136_1 + 2 + var_136_15 / 2), var_136_15 / 2, var_136_16)

	local var_136_17

	if var_136_6 then
		var_136_17 = draw.Color(100, 100, 110, 255)
	elseif var_136_10 then
		var_136_17 = slot_0_41_0(var_136_2.text)
	else
		var_136_17 = draw.Color(150, 150, 160, 255)
	end

	draw.surface:AddText(draw.Vec2(var_136_0 + var_136_4 + 8, var_136_1 + 2), var_136_7, var_136_17)

	slot_0_59_0.y = slot_0_59_0.y + var_136_5 + 6

	return var_136_5 + 6
end

function slot_0_63_0(arg_137_0, arg_137_1, arg_137_2, arg_137_3, arg_137_4, arg_137_5)
	slot_137_6_0 = slot_0_59_0.x
	slot_137_7_0 = slot_0_59_0.y
	slot_137_8_0 = UI.theme
	slot_137_9_0 = draw.surface
	slot_137_10_0 = 28
	slot_137_11_0 = 16
	slot_137_12_0 = false
	slot_137_13_0 = arg_137_0
	slot_137_14_0 = slot_137_12_0 and "this feature is beta only" or arg_137_3
	slot_137_15_0 = false

	if slot_0_59_0.Mouse and slot_137_6_0 <= slot_0_59_0.Mouse.x and slot_0_59_0.Mouse.x <= slot_137_6_0 + slot_137_10_0 and slot_137_7_0 <= slot_0_59_0.Mouse.y and slot_0_59_0.Mouse.y <= slot_137_7_0 + slot_137_11_0 then
		slot_137_15_0 = true

		if slot_137_14_0 then
			slot_0_59_0.hovered_tooltip = slot_137_14_0
		end
	end

	slot_137_16_0 = UI.cfg[arg_137_1]

	if not UI.active_settings_data and not UI.active_combo_data and not slot_137_12_0 and slot_137_15_0 and slot_0_59_0.clicked and not slot_0_59_0.clicked_on_popup then
		UI.cfg[arg_137_1] = not UI.cfg[arg_137_1]
		slot_0_59_0.clicked = false
	end

	slot_137_17_0 = slot_0_43_0(arg_137_1, slot_137_16_0 and 1 or 0, 12)
	slot_137_18_0 = slot_0_42_0({
		60,
		60,
		65,
		255,
		[0] = nil
	}, slot_137_8_0.accent, slot_137_17_0)
	slot_137_19_0 = slot_0_42_0({
		30,
		30,
		35,
		255,
		[0] = nil
	}, slot_137_8_0.accent, slot_137_17_0 * 0.2)

	if slot_137_12_0 then
		slot_137_19_0 = draw.Color(25, 25, 25, 100)
	end

	slot_137_9_0:AddRectFilledRounded(draw.Rect(slot_137_6_0, slot_137_7_0, slot_137_6_0 + slot_137_10_0, slot_137_7_0 + slot_137_11_0), slot_137_19_0, slot_137_11_0 / 2)

	slot_137_20_0 = slot_137_6_0 + 2 + (slot_137_10_0 - slot_137_11_0) * slot_137_17_0
	slot_137_21_0 = slot_137_11_0 - 4
	slot_137_22_0 = slot_137_12_0 and draw.Color(100, 100, 105, 255) or draw.Color(255, 255, 255, 255)

	slot_137_9_0:AddCircleFilled(draw.Vec2(slot_137_20_0 + slot_137_21_0 / 2, slot_137_7_0 + 2 + slot_137_21_0 / 2), slot_137_21_0 / 2, slot_137_22_0)

	slot_137_23_0 = nil

	if slot_137_12_0 then
		slot_137_23_0 = draw.Color(100, 100, 110, 255)
	elseif slot_137_16_0 then
		slot_137_23_0 = slot_0_41_0(slot_137_8_0.text)
	else
		slot_137_23_0 = draw.Color(150, 150, 160, 255)
	end

	slot_137_9_0:AddText(draw.Vec2(slot_137_6_0 + slot_137_10_0 + 8, slot_137_7_0 + 2), slot_137_13_0, slot_137_23_0)

	slot_137_24_0 = slot_137_6_0 + (slot_0_59_0.group_w or 180) - 40
	slot_137_25_0 = slot_0_43_0(arg_137_1 .. "_color_expand", slot_137_16_0 and not slot_137_12_0 and 1 or 0, 10)

	if slot_137_25_0 > 0.01 then
		slot_137_26_0 = slot_137_24_0
		slot_137_27_0 = slot_137_7_0 + 1
		slot_137_28_0 = 14
		slot_137_29_0 = (1 - slot_137_25_0) * 10
		slot_137_30_0 = math.floor(255 * slot_137_25_0)
		slot_137_31_0 = slot_137_26_0 - slot_137_29_0
		slot_137_32_0 = UI.cfg[arg_137_2] or {
			255,
			90,
			130,
			255,
			[0] = nil
		}

		slot_137_9_0:AddRectFilledRounded(draw.Rect(slot_137_31_0 - 1, slot_137_27_0 - 1, slot_137_31_0 + slot_137_28_0 + 1, slot_137_27_0 + slot_137_28_0 + 1), draw.Color(80, 80, 80, slot_137_30_0), 4)
		slot_137_9_0:AddRectFilledRounded(draw.Rect(slot_137_31_0, slot_137_27_0, slot_137_31_0 + slot_137_28_0, slot_137_27_0 + slot_137_28_0), slot_0_41_0(slot_137_32_0, slot_137_30_0), 4)

		if UI.active_color_picker == arg_137_2 then
			slot_137_9_0:AddRect(draw.Rect(slot_137_31_0 - 2, slot_137_27_0 - 2, slot_137_31_0 + slot_137_28_0 + 2, slot_137_27_0 + slot_137_28_0 + 2), slot_0_41_0(slot_137_8_0.accent, slot_137_30_0), 2)
		end

		if slot_0_59_0.Mouse and slot_137_31_0 <= slot_0_59_0.Mouse.x and slot_0_59_0.Mouse.x <= slot_137_31_0 + slot_137_28_0 and slot_137_27_0 <= slot_0_59_0.Mouse.y and slot_0_59_0.Mouse.y <= slot_137_27_0 + slot_137_28_0 and slot_0_59_0.clicked then
			if UI.active_color_picker == arg_137_2 then
				UI.active_color_picker = nil
			else
				UI.active_color_picker = arg_137_2
				UI.picker_x = slot_137_31_0 + slot_137_28_0 + 25
				UI.picker_y = slot_137_27_0 + slot_137_28_0 / 2 - 137.5
				UI.picker_just_opened = 3
				UI.picker_release_guarded = true
			end

			slot_0_59_0.clicked = false
		end
	end

	slot_0_59_0.y = slot_0_59_0.y + slot_137_11_0 + 6

	return slot_137_11_0 + 6
end

function slot_0_64_0(arg_138_0, arg_138_1, arg_138_2, arg_138_3, arg_138_4, arg_138_5, arg_138_6, arg_138_7)
	slot_138_8_0 = slot_0_59_0.x
	slot_138_9_0 = slot_0_59_0.y
	slot_138_10_0 = UI.theme
	slot_138_11_0 = draw.surface
	slot_138_12_0 = 28
	slot_138_13_0 = 16
	slot_138_14_0 = false
	slot_138_15_0 = arg_138_0
	slot_138_16_0 = slot_138_14_0 and "this feature is beta only" or arg_138_5
	slot_138_17_0 = false

	if slot_0_59_0.Mouse and slot_138_8_0 <= slot_0_59_0.Mouse.x and slot_0_59_0.Mouse.x <= slot_138_8_0 + slot_138_12_0 and slot_138_9_0 <= slot_0_59_0.Mouse.y and slot_0_59_0.Mouse.y <= slot_138_9_0 + slot_138_13_0 then
		slot_138_17_0 = true

		if slot_138_16_0 then
			slot_0_59_0.hovered_tooltip = slot_138_16_0
		end
	end

	slot_138_18_0 = UI.cfg[arg_138_1]

	if not UI.active_settings_data and not UI.active_combo_data and not slot_138_14_0 and slot_138_17_0 and slot_0_59_0.clicked and not slot_0_59_0.clicked_on_popup then
		UI.cfg[arg_138_1] = not UI.cfg[arg_138_1]
		slot_0_59_0.clicked = false
	end

	slot_138_19_0 = slot_0_43_0(arg_138_1, slot_138_18_0 and 1 or 0, 12)
	slot_138_20_0 = slot_0_42_0({
		60,
		60,
		65,
		255,
		[0] = nil
	}, slot_138_10_0.accent, slot_138_19_0)
	slot_138_21_0 = slot_0_42_0({
		30,
		30,
		35,
		255,
		[0] = nil
	}, slot_138_10_0.accent, slot_138_19_0 * 0.2)

	if slot_138_14_0 then
		slot_138_21_0 = draw.Color(25, 25, 25, 100)
	end

	slot_138_11_0:AddRectFilledRounded(draw.Rect(slot_138_8_0, slot_138_9_0, slot_138_8_0 + slot_138_12_0, slot_138_9_0 + slot_138_13_0), slot_138_21_0, slot_138_13_0 / 2)

	slot_138_22_0 = slot_138_8_0 + 2 + (slot_138_12_0 - slot_138_13_0) * slot_138_19_0
	slot_138_23_0 = slot_138_13_0 - 4
	slot_138_24_0 = slot_138_14_0 and draw.Color(100, 100, 105, 255) or draw.Color(255, 255, 255, 255)

	slot_138_11_0:AddCircleFilled(draw.Vec2(slot_138_22_0 + slot_138_23_0 / 2, slot_138_9_0 + 2 + slot_138_23_0 / 2), slot_138_23_0 / 2, slot_138_24_0)

	slot_138_25_0 = nil

	if slot_138_14_0 then
		slot_138_25_0 = draw.Color(100, 100, 110, 255)
	elseif slot_138_18_0 then
		slot_138_25_0 = slot_0_41_0(slot_138_10_0.text)
	else
		slot_138_25_0 = draw.Color(150, 150, 160, 255)
	end

	slot_138_11_0:AddText(draw.Vec2(slot_138_8_0 + slot_138_12_0 + 8, slot_138_9_0 + 2), slot_138_15_0, slot_138_25_0)

	slot_138_26_0 = slot_138_8_0 + (slot_0_59_0.group_w or 180) - 40
	slot_138_27_0 = slot_0_43_0(arg_138_1 .. "_slider_expand", slot_138_18_0 and not slot_138_14_0 and 1 or 0, 10)

	if slot_138_27_0 > 0.01 then
		slot_138_29_0 = 30 * slot_138_27_0
		slot_138_30_0 = slot_0_59_0.y
		slot_138_31_0 = slot_138_8_0
		slot_138_32_0 = 160
		slot_138_33_0 = math.floor(30 * slot_138_27_0)

		slot_138_11_0:AddRectFilledRounded(draw.Rect(slot_138_31_0, slot_138_30_0, slot_138_31_0 + slot_138_32_0 + 12, slot_138_30_0 + slot_138_29_0), draw.Color(40, 40, 45, slot_138_33_0), 4)

		slot_138_34_0 = UI.cfg[arg_138_2] or arg_138_3
		slot_138_35_0 = (slot_138_34_0 - arg_138_3) / (arg_138_4 - arg_138_3)
		slot_138_36_0 = slot_138_31_0 + 6
		slot_138_37_0 = slot_138_30_0 + slot_138_29_0 / 2
		slot_138_38_0 = slot_138_32_0
		slot_138_39_0 = false

		if slot_0_59_0.Mouse and slot_138_36_0 <= slot_0_59_0.Mouse.x and slot_0_59_0.Mouse.x <= slot_138_36_0 + slot_138_38_0 and slot_138_30_0 <= slot_0_59_0.Mouse.y and slot_0_59_0.Mouse.y <= slot_138_30_0 + slot_138_29_0 then
			slot_138_39_0 = true
		end

		if slot_138_39_0 and slot_0_59_0.mouse_down and slot_138_27_0 > 0.9 then
			slot_138_40_1 = math.min(1, math.max(0, (slot_0_59_0.Mouse.x - slot_138_36_0) / slot_138_38_0))
			UI.cfg[arg_138_2] = math.floor(arg_138_3 + slot_138_40_1 * (arg_138_4 - arg_138_3))
			slot_138_35_0 = slot_138_40_1
		end

		slot_138_40_0 = math.floor(255 * slot_138_27_0)

		slot_138_11_0:AddRectFilledRounded(draw.Rect(slot_138_36_0, slot_138_37_0 - 2, slot_138_36_0 + slot_138_38_0, slot_138_37_0 + 2), draw.Color(50, 50, 55, slot_138_40_0), 2)
		slot_138_11_0:AddRectFilledRounded(draw.Rect(slot_138_36_0, slot_138_37_0 - 2, slot_138_36_0 + slot_138_38_0 * slot_138_35_0, slot_138_37_0 + 2), slot_0_41_0(slot_138_10_0.accent, slot_138_40_0), 2)

		slot_138_41_0 = slot_138_36_0 + slot_138_38_0 * slot_138_35_0

		slot_138_11_0:AddCircleFilled(draw.Vec2(slot_138_41_0, slot_138_37_0), 5, draw.Color(255, 255, 255, slot_138_40_0))

		slot_138_42_0 = tostring(slot_138_34_0)
		slot_138_43_0 = slot_0_41_0(slot_138_10_0.text, slot_138_40_0)

		slot_138_11_0:AddText(draw.Vec2(slot_138_36_0 + slot_138_38_0 + 8, slot_138_30_0 + (slot_138_29_0 - 12) / 2), slot_138_42_0, slot_138_43_0)

		slot_0_59_0.y = slot_0_59_0.y + slot_138_29_0 + 2
	end

	return slot_138_13_0 + 6 + (slot_138_27_0 > 0.01 and 30 * slot_138_27_0 + 2 or 0)
end

function slot_0_65_0(arg_139_0, arg_139_1, arg_139_2, arg_139_3, arg_139_4, arg_139_5, arg_139_6)
	slot_139_7_0 = slot_0_59_0.x
	slot_139_8_0 = slot_0_59_0.y
	slot_139_9_0 = UI.theme
	slot_139_10_0 = draw.surface
	slot_139_11_0 = 28
	slot_139_12_0 = 16
	slot_139_14_0 = (arg_139_0 and #arg_139_0 or 0) * 7
	slot_139_15_0 = slot_139_11_0
	slot_139_16_0 = false
	slot_139_17_0 = arg_139_0
	slot_139_18_0 = slot_139_16_0 and "this feature is beta only" or arg_139_4
	slot_139_19_0 = false

	if slot_0_59_0.Mouse and slot_139_7_0 <= slot_0_59_0.Mouse.x and slot_0_59_0.Mouse.x <= slot_139_7_0 + slot_139_15_0 and slot_139_8_0 <= slot_0_59_0.Mouse.y and slot_0_59_0.Mouse.y <= slot_139_8_0 + slot_139_12_0 then
		slot_139_19_0 = true

		if slot_139_18_0 then
			slot_0_59_0.hovered_tooltip = slot_139_18_0
		end
	end

	slot_139_20_0 = UI.cfg[arg_139_1]

	if not UI.active_settings_data and not UI.active_combo_data and not slot_139_16_0 and slot_139_19_0 and slot_0_59_0.clicked and not slot_0_59_0.input_blocked then
		UI.cfg[arg_139_1] = not UI.cfg[arg_139_1]
		slot_0_59_0.clicked = false
	end

	slot_139_21_0 = slot_0_43_0(arg_139_1, slot_139_20_0 and 1 or 0, 12)
	slot_139_22_0 = slot_0_42_0({
		60,
		60,
		65,
		255,
		[0] = nil
	}, slot_139_9_0.accent, slot_139_21_0)
	slot_139_23_0 = slot_0_42_0({
		30,
		30,
		35,
		255,
		[0] = nil
	}, slot_139_9_0.accent, slot_139_21_0 * 0.2)

	if slot_139_16_0 then
		slot_139_23_0 = draw.Color(25, 25, 25, 100)
	end

	slot_139_10_0:AddRectFilledRounded(draw.Rect(slot_139_7_0, slot_139_8_0, slot_139_7_0 + slot_139_11_0, slot_139_8_0 + slot_139_12_0), slot_139_23_0, slot_139_12_0 / 2)

	slot_139_24_0 = slot_139_7_0 + 2 + (slot_139_11_0 - slot_139_12_0) * slot_139_21_0
	slot_139_25_0 = slot_139_12_0 - 4
	slot_139_26_0 = slot_139_16_0 and draw.Color(100, 100, 110, 255) or draw.Color(255, 255, 255, 255)

	slot_139_10_0:AddCircleFilled(draw.Vec2(slot_139_24_0 + slot_139_25_0 / 2, slot_139_8_0 + 2 + slot_139_25_0 / 2), slot_139_25_0 / 2, slot_139_26_0)

	slot_139_27_0 = nil

	if slot_139_16_0 then
		slot_139_27_0 = draw.Color(100, 100, 110, 255)
	elseif slot_139_20_0 then
		slot_139_27_0 = slot_0_41_0(slot_139_9_0.text)
	else
		slot_139_27_0 = draw.Color(150, 150, 160, 255)
	end

	slot_139_10_0:AddText(draw.Vec2(slot_139_7_0 + slot_139_11_0 + 8, slot_139_8_0 + 2), slot_139_17_0, slot_139_27_0)

	slot_139_28_0 = slot_139_7_0 + (slot_0_59_0.group_w or 180) - 40

	if slot_139_20_0 and arg_139_3 and not slot_139_16_0 then
		slot_139_29_1 = slot_139_28_0
		slot_139_30_1 = slot_139_8_0 + 1
		slot_139_31_1 = 14
		slot_139_32_1 = UI.cfg[arg_139_3] or {
			255,
			255,
			255,
			255,
			[0] = nil
		}
		slot_139_33_1 = false

		if slot_139_29_1 <= slot_0_59_0.Mouse.x and slot_0_59_0.Mouse.x <= slot_139_29_1 + slot_139_31_1 and slot_139_30_1 <= slot_0_59_0.Mouse.y and slot_0_59_0.Mouse.y <= slot_139_30_1 + slot_139_31_1 and slot_0_59_0.clicked then
			if UI.active_color_picker == arg_139_3 then
				UI.active_color_picker = nil
			else
				UI.active_color_picker = arg_139_3
				UI.picker_x = slot_139_29_1 + slot_139_31_1 + 25
				UI.picker_y = slot_139_30_1 + slot_139_31_1 / 2 - 137.5
				UI.picker_just_opened = 3
				UI.picker_release_guarded = true
			end

			slot_0_59_0.clicked = false
		end

		slot_139_10_0:AddRectFilledRounded(draw.Rect(slot_139_29_1 - 1, slot_139_30_1 - 1, slot_139_29_1 + slot_139_31_1 + 1, slot_139_30_1 + slot_139_31_1 + 1), draw.Color(80, 80, 80, 255), 4)
		slot_139_10_0:AddRectFilledRounded(draw.Rect(slot_139_29_1, slot_139_30_1, slot_139_29_1 + slot_139_31_1, slot_139_30_1 + slot_139_31_1), draw.Color(slot_139_32_1[1], slot_139_32_1[2], slot_139_32_1[3], slot_139_32_1[4]), 4)

		if UI.active_color_picker == arg_139_3 then
			slot_139_10_0:AddRect(draw.Rect(slot_139_29_1 - 2, slot_139_30_1 - 2, slot_139_29_1 + slot_139_31_1 + 2, slot_139_30_1 + slot_139_31_1 + 2), slot_0_41_0(slot_139_9_0.accent), 2)
		end

		slot_139_28_0 = slot_139_28_0 - 20
	end

	if arg_139_2 and slot_139_20_0 and not slot_139_16_0 then
		slot_139_29_0 = 14
		slot_139_30_0 = slot_139_28_0
		slot_139_31_0 = slot_139_8_0 + 4
		slot_139_32_0 = false

		if slot_0_59_0.Mouse and slot_139_30_0 <= slot_0_59_0.Mouse.x and slot_0_59_0.Mouse.x <= slot_139_30_0 + slot_139_29_0 and slot_139_31_0 <= slot_0_59_0.Mouse.y and slot_0_59_0.Mouse.y <= slot_139_31_0 + slot_139_29_0 then
			slot_139_32_0 = true

			if slot_0_59_0.clicked then
				if UI.active_settings_popup == arg_139_1 then
					UI.active_settings_popup = nil
					UI.active_settings_data = nil
				else
					UI.active_settings_popup = arg_139_1
					UI.active_settings_data = {
						x = slot_139_30_0 + 20,
						y = slot_139_31_0,
						list = arg_139_2,
						spawn_time = game.globalVars.m_flRealTime
					}
				end

				slot_0_59_0.clicked = false
			end
		end

		slot_139_33_0 = (slot_139_32_0 or UI.active_settings_popup == arg_139_1) and slot_0_41_0(slot_139_9_0.accent) or slot_0_41_0(slot_139_9_0.text_dim, 200)

		draw_icon_proc("gear_thin", slot_139_30_0, slot_139_31_0, slot_139_29_0, slot_139_33_0)
	end

	slot_0_59_0.y = slot_0_59_0.y + slot_139_12_0 + 6

	return slot_139_12_0 + 6
end

function slot_0_66_0(arg_140_0, arg_140_1, arg_140_2, arg_140_3, arg_140_4, arg_140_5, arg_140_6, arg_140_7)
	if arg_140_7 ~= nil then
		if type(arg_140_7) == "function" then
			if not arg_140_7() then
				return 0
			end
		elseif not arg_140_7 then
			return 0
		end
	end

	slot_140_8_0 = slot_0_59_0.x + 2
	slot_140_9_1 = slot_0_59_0.y
	slot_140_10_0 = UI.theme
	slot_140_11_0 = draw.surface
	slot_140_13_0 = (slot_0_59_0.group_w or 200) - 32
	slot_140_14_0 = 10
	slot_140_15_0 = false
	slot_140_16_0 = arg_140_0
	slot_140_17_0 = slot_140_15_0 and "this feature is beta only" or arg_140_4
	slot_140_18_0 = UI.cfg[arg_140_1] or arg_140_2
	slot_140_19_0 = (slot_140_18_0 - arg_140_2) / (arg_140_3 - arg_140_2)
	slot_140_20_0 = false

	if slot_0_59_0.Mouse and slot_140_8_0 <= slot_0_59_0.Mouse.x and slot_0_59_0.Mouse.x <= slot_140_8_0 + slot_140_13_0 and slot_140_9_1 <= slot_0_59_0.Mouse.y and slot_0_59_0.Mouse.y <= slot_140_9_1 + slot_140_14_0 + 15 then
		slot_140_20_0 = true

		if slot_140_17_0 then
			slot_0_59_0.hovered_tooltip = slot_140_17_0
		end
	end

	if not UI.active_settings_data and not UI.active_combo_data and not slot_140_15_0 and slot_140_20_0 and slot_0_59_0.mouse_down and not slot_0_59_0.clicked_on_popup and slot_0_59_0.Mouse then
		slot_140_21_1 = math.min(1, math.max(0, (slot_0_59_0.Mouse.x - slot_140_8_0) / slot_140_13_0))
		UI.cfg[arg_140_1] = math.floor(arg_140_2 + slot_140_21_1 * (arg_140_3 - arg_140_2))
		slot_140_19_0 = slot_140_21_1
	end

	slot_140_21_0 = slot_140_15_0 and draw.Color(100, 100, 110, 255) or slot_0_41_0(slot_140_10_0.text_dim)
	slot_140_22_0 = slot_140_15_0 and draw.Color(100, 100, 110, 255) or slot_0_41_0(slot_140_10_0.text)

	draw.surface:AddText(draw.Vec2(slot_140_8_0, slot_140_9_1), slot_140_16_0, slot_140_21_0)

	slot_140_23_0 = slot_0_51_0(slot_140_11_0.font, tostring(slot_140_18_0))

	draw.surface:AddText(draw.Vec2(slot_140_8_0 + slot_140_13_0 - slot_140_23_0.x, slot_140_9_1), tostring(slot_140_18_0), slot_140_22_0)

	slot_140_9_0 = slot_140_9_1 + 16
	slot_140_24_0 = slot_140_8_0 + 2
	slot_140_25_0 = slot_140_13_0
	slot_140_26_0 = slot_140_9_0 + 4
	slot_140_27_0 = slot_140_15_0 and draw.Color(40, 40, 45, 100) or draw.Color(40, 40, 45, 255)

	slot_140_11_0:AddRectFilledRounded(draw.Rect(slot_140_24_0, slot_140_26_0 - 2, slot_140_24_0 + slot_140_25_0, slot_140_26_0 + 2), draw.Color(60, 60, 65, slot_140_15_0 and 100 or 255), 2)
	slot_140_11_0:AddRectFilledRounded(draw.Rect(slot_140_24_0 + 1, slot_140_26_0 - 1, slot_140_24_0 + slot_140_25_0 - 1, slot_140_26_0 + 1), slot_140_27_0, 2)

	slot_140_28_0 = slot_140_15_0 and draw.Color(80, 80, 85, 150) or slot_0_41_0(slot_140_10_0.accent)

	slot_140_11_0:AddRectFilledRounded(draw.Rect(slot_140_24_0, slot_140_26_0 - 2, slot_140_24_0 + slot_140_25_0 * slot_140_19_0, slot_140_26_0 + 2), slot_140_28_0, 2, 15)

	slot_140_29_0 = slot_140_24_0 + slot_140_25_0 * slot_140_19_0
	slot_140_30_0 = slot_140_26_0
	slot_140_31_0 = slot_140_15_0 and draw.Color(100, 100, 105, 255) or slot_140_20_0 and draw.Color(255, 255, 255, 255) or slot_0_41_0(slot_140_10_0.accent)

	slot_140_11_0:AddCircleFilled(draw.Vec2(slot_140_29_0, slot_140_30_0), 5, slot_140_31_0)

	if not slot_140_15_0 and slot_140_20_0 then
		slot_140_11_0:AddCircleFilled(draw.Vec2(slot_140_29_0, slot_140_30_0), 8, slot_0_41_0(slot_140_10_0.accent, 50))
	end

	slot_0_59_0.y = slot_0_59_0.y + 35

	return 35
end

function slot_0_67_0(arg_141_0, arg_141_1, arg_141_2, arg_141_3)
	if arg_141_3 ~= nil then
		if type(arg_141_3) == "function" then
			if not arg_141_3() then
				return 0
			end
		elseif not arg_141_3 then
			return 0
		end
	end

	slot_141_4_0 = slot_0_59_0.x
	slot_141_5_0 = slot_0_59_0.y
	slot_141_6_0 = UI.theme
	slot_141_7_0 = draw.surface
	slot_141_8_0 = 180

	if not UI.key_names then
		UI.key_names = {
			[0] = "None",
			"M1",
			"M2",
			nil,
			"M3",
			"M4",
			"M5",
			nil,
			"Back",
			"Tab",
			nil,
			nil,
			nil,
			"Enter",
			nil,
			nil,
			"Shift",
			"Ctrl",
			"Alt",
			nil,
			"Caps",
			nil,
			nil,
			nil,
			nil,
			nil,
			nil,
			"Esc",
			nil,
			nil,
			nil,
			nil,
			"Space",
			"PgUp",
			"PgDn",
			"End",
			"Home",
			"Left",
			"Up",
			"Right",
			"Down",
			nil,
			nil,
			nil,
			nil,
			"Ins",
			"Del",
			nil,
			"0",
			"1",
			"2",
			"3",
			"4",
			"5",
			"6",
			"7",
			"8",
			"9",
			nil,
			nil,
			nil,
			nil,
			nil,
			nil,
			nil,
			"A",
			"B",
			"C",
			"D",
			"E",
			"F",
			"G",
			"H",
			"I",
			"J",
			"K",
			"L",
			"M",
			"N",
			"O",
			"P",
			"Q",
			"R",
			"S",
			"T",
			"U",
			"V",
			"W",
			"X",
			"Y",
			"Z",
			nil,
			nil,
			nil,
			nil,
			nil,
			nil,
			nil,
			nil,
			nil,
			nil,
			nil,
			nil,
			nil,
			nil,
			nil,
			nil,
			nil,
			nil,
			nil,
			nil,
			nil,
			"F1",
			"F2",
			"F3",
			"F4",
			"F5",
			"F6",
			"F7",
			"F8",
			"F9",
			"F10",
			"F11",
			"F12",
			[0] = nil
		}
	end

	slot_141_9_0 = UI.cfg[arg_141_1] or 0
	slot_141_10_0 = arg_141_1 .. "_mode"
	slot_141_11_0 = UI.cfg[slot_141_10_0] or "Hold"
	slot_141_12_0 = UI.binding_focus == arg_141_1

	slot_141_7_0:AddText(draw.Vec2(slot_141_4_0, slot_141_5_0), arg_141_0, slot_0_41_0(slot_141_6_0.text_dim))

	if arg_141_2 and slot_0_59_0.Mouse and slot_141_4_0 <= slot_0_59_0.Mouse.x and slot_0_59_0.Mouse.x <= slot_141_4_0 + slot_141_8_0 and slot_141_5_0 <= slot_0_59_0.Mouse.y and slot_0_59_0.Mouse.y <= slot_141_5_0 + 36 then
		slot_0_59_0.hovered_tooltip = arg_141_2
	end

	slot_141_13_0 = 65
	slot_141_14_0 = 16
	slot_141_15_0 = slot_141_4_0 + slot_141_8_0 - slot_141_13_0
	slot_141_16_0 = slot_141_5_0
	slot_141_17_0 = UI.key_names[slot_141_9_0] or slot_141_9_0 > 0 and "Key " .. slot_141_9_0 or "None"
	slot_141_18_0 = slot_141_12_0 and "..." or slot_141_17_0
	slot_141_19_0 = slot_0_51_0(slot_141_7_0.font, slot_141_18_0)
	slot_141_20_0 = slot_0_59_0.Mouse and slot_141_15_0 <= slot_0_59_0.Mouse.x and slot_0_59_0.Mouse.x <= slot_141_15_0 + slot_141_13_0 and slot_141_16_0 <= slot_0_59_0.Mouse.y and slot_0_59_0.Mouse.y <= slot_141_16_0 + slot_141_14_0

	if slot_141_20_0 and slot_0_59_0.clicked and not slot_141_12_0 then
		UI.binding_focus = arg_141_1
		UI.binding_wait_release = true
		slot_0_59_0.clicked = false
	elseif slot_141_12_0 then
		slot_141_21_1 = false

		for iter_141_0 = 2, 255 do
			if get_key_state(iter_141_0, true) then
				slot_141_21_1 = true

				if not UI.binding_wait_release then
					if iter_141_0 == 27 then
						UI.cfg[arg_141_1] = 0
					else
						UI.cfg[arg_141_1] = iter_141_0
					end

					UI.binding_focus = nil
					UI.binding_wait_release = nil

					break
				end
			end
		end

		if not slot_141_21_1 then
			UI.binding_wait_release = false
		end

		if slot_0_59_0.mouse_down and not slot_141_20_0 and not UI.popup_click_state_prev and not UI.binding_wait_release then
			UI.binding_focus = nil
		end
	end

	slot_141_21_0 = slot_141_12_0 and slot_0_41_0(slot_141_6_0.accent, 40) or draw.Color(255, 255, 255, 10)

	if slot_141_12_0 then
		slot_0_44_0(slot_141_15_0, slot_141_16_0, slot_141_13_0, slot_141_14_0, slot_141_6_0.accent, 25, 4)
	end

	slot_141_7_0:AddRectFilledRounded(draw.Rect(slot_141_15_0, slot_141_16_0, slot_141_15_0 + slot_141_13_0, slot_141_16_0 + slot_141_14_0), slot_141_21_0, 4)

	slot_141_22_0 = slot_141_12_0 and slot_0_41_0(slot_141_6_0.accent, 220) or draw.Color(255, 255, 255, 18)

	slot_141_7_0:AddRect(draw.Rect(slot_141_15_0, slot_141_16_0, slot_141_15_0 + slot_141_13_0, slot_141_16_0 + slot_141_14_0), slot_141_22_0, 1)

	slot_141_23_0 = slot_141_12_0 and slot_0_41_0(slot_141_6_0.text) or slot_0_41_0(slot_141_6_0.text_dim)

	slot_141_7_0:AddText(draw.Vec2(slot_141_15_0 + (slot_141_13_0 - slot_141_19_0.x) / 2, slot_141_16_0 + (slot_141_14_0 - slot_141_19_0.y) / 2), slot_141_18_0, slot_141_23_0)

	if slot_141_12_0 then
		slot_141_24_1 = 0

		for iter_141_1 = 2, 255 do
			if get_key_state(iter_141_1, true) then
				slot_141_24_1 = iter_141_1

				break
			end
		end

		if slot_141_24_1 > 0 then
			slot_141_7_0:AddText(draw.Vec2(slot_141_15_0, slot_141_16_0 + slot_141_14_0 + 2), slot_0_41_0(slot_141_6_0.text_dim, 150), string.format("DETECTED: %d", slot_141_24_1))
		end
	end

	slot_141_24_0 = slot_141_5_0 + 20

	slot_141_7_0:AddText(draw.Vec2(slot_141_4_0, slot_141_24_0), "Mode", draw.Color(160, 160, 165, 255))

	slot_141_25_0 = {
		"Hold",
		"Toggle",
		[0] = nil
	}
	slot_141_26_0 = slot_141_4_0 + slot_141_8_0 - slot_141_13_0
	slot_141_27_0 = slot_141_24_0

	if slot_0_59_0.Mouse and slot_141_26_0 <= slot_0_59_0.Mouse.x and slot_0_59_0.Mouse.x <= slot_141_26_0 + slot_141_13_0 and slot_141_27_0 <= slot_0_59_0.Mouse.y and slot_0_59_0.Mouse.y <= slot_141_27_0 + slot_141_14_0 and slot_0_59_0.clicked and not UI.popup_click_state_prev then
		UI.active_combo_data = {
			id = slot_141_10_0,
			x = slot_141_26_0,
			y = slot_141_27_0 + slot_141_14_0,
			w = slot_141_13_0,
			options = slot_141_25_0,
			var = slot_141_10_0,
			open_time = game.globalVars.m_flRealTime
		}
		slot_0_59_0.clicked = false
	end

	slot_141_7_0:AddRectFilledRounded(draw.Rect(slot_141_26_0, slot_141_27_0, slot_141_26_0 + slot_141_13_0, slot_141_27_0 + slot_141_14_0), draw.Color(255, 255, 255, 10), 4)
	slot_141_7_0:AddRect(draw.Rect(slot_141_26_0, slot_141_27_0, slot_141_26_0 + slot_141_13_0, slot_141_27_0 + slot_141_14_0), draw.Color(255, 255, 255, 18), 1)

	slot_141_29_0 = slot_0_51_0(slot_141_7_0.font, slot_141_11_0)

	slot_141_7_0:AddText(draw.Vec2(slot_141_26_0 + (slot_141_13_0 - slot_141_29_0.x) / 2, slot_141_27_0 + (slot_141_14_0 - slot_141_29_0.y) / 2), slot_141_11_0, slot_0_41_0(slot_141_6_0.text_dim))

	slot_0_59_0.y = slot_0_59_0.y + 42

	return 42
end

function slot_0_68_0(arg_142_0, arg_142_1, arg_142_2, arg_142_3, arg_142_4, arg_142_5, arg_142_6)
	if arg_142_6 ~= nil then
		if type(arg_142_6) == "function" then
			if not arg_142_6() then
				return 0
			end
		elseif not arg_142_6 then
			return 0
		end
	end

	slot_142_7_0 = slot_0_59_0.x
	slot_142_8_0 = slot_0_59_0.y
	slot_142_9_0 = UI.theme
	slot_142_10_0 = draw.surface
	slot_142_11_0 = 180
	slot_142_12_0 = 24
	slot_142_13_0 = false
	slot_142_14_0 = arg_142_0
	slot_142_15_0 = slot_142_13_0 and "this feature is beta only" or arg_142_3
	slot_142_16_0 = false

	if slot_0_59_0.Mouse and slot_142_7_0 <= slot_0_59_0.Mouse.x and slot_0_59_0.Mouse.x <= slot_142_7_0 + slot_142_11_0 and slot_0_59_0.Mouse.y >= slot_142_8_0 + 16 and slot_0_59_0.Mouse.y <= slot_142_8_0 + 16 + slot_142_12_0 then
		slot_142_16_0 = true

		if slot_142_15_0 then
			slot_0_59_0.hovered_tooltip = slot_142_15_0
		end
	end

	slot_142_17_0 = UI.cfg[arg_142_1]
	slot_142_18_0 = 1

	if type(slot_142_17_0) == "number" then
		slot_142_18_0 = slot_142_17_0
	elseif type(slot_142_17_0) == "string" then
		for iter_142_0, iter_142_1 in ipairs(arg_142_2) do
			if iter_142_1 == slot_142_17_0 then
				slot_142_18_0 = iter_142_0

				break
			end
		end
	end

	slot_142_19_0 = arg_142_2[math.min(#arg_142_2, math.max(1, slot_142_18_0))] or arg_142_2[1] or "None"
	slot_142_20_0 = slot_142_13_0 and draw.Color(100, 100, 110, 255) or UI.theme.text_dim

	if type(slot_142_20_0) == "table" and not slot_142_13_0 then
		slot_142_20_0 = draw.Color(slot_142_20_0[1], slot_142_20_0[2], slot_142_20_0[3], 255)
	end

	draw.surface:AddText(draw.Vec2(slot_142_7_0, slot_142_8_0), slot_142_14_0, slot_142_20_0)

	slot_142_21_0 = slot_142_8_0 + 16
	slot_142_22_0 = slot_142_13_0 and draw.Color(50, 50, 55, 100) or slot_142_16_0 and draw.Color(255, 255, 255, 35) or draw.Color(255, 255, 255, 20)

	slot_142_10_0:AddRectFilledRounded(draw.Rect(slot_142_7_0, slot_142_21_0, slot_142_7_0 + slot_142_11_0, slot_142_21_0 + slot_142_12_0), slot_142_22_0, 4)

	slot_142_23_0 = slot_142_13_0 and draw.Color(30, 30, 35, 100) or slot_0_41_0(slot_142_9_0.control_bg, 255)

	slot_142_10_0:AddRectFilledRounded(draw.Rect(slot_142_7_0 + 1, slot_142_21_0 + 1, slot_142_7_0 + slot_142_11_0 - 1, slot_142_21_0 + slot_142_12_0 - 1), slot_142_23_0, 4)

	slot_142_24_0 = slot_142_13_0 and draw.Color(120, 120, 125, 255) or draw.Color(220, 220, 220, 255)

	draw.surface:AddText(draw.Vec2(slot_142_7_0 + 8, slot_142_21_0 + 6), slot_142_19_0, slot_142_24_0)

	slot_142_25_0 = slot_142_13_0 and draw.Color(100, 100, 105, 150) or draw.Color(150, 150, 150, 255)

	draw.surface:AddTriangleFilled(draw.Vec2(slot_142_7_0 + slot_142_11_0 - 16, slot_142_21_0 + 10), draw.Vec2(slot_142_7_0 + slot_142_11_0 - 8, slot_142_21_0 + 10), draw.Vec2(slot_142_7_0 + slot_142_11_0 - 12, slot_142_21_0 + 16), slot_142_25_0)

	if not UI.active_settings_data and not UI.active_combo_data and not slot_142_13_0 and slot_142_16_0 and slot_0_59_0.clicked and not slot_0_59_0.clicked_on_popup then
		UI.active_combo_data = {
			[0] = nil,
			id = arg_142_1,
			x = slot_142_7_0,
			y = slot_142_21_0 + slot_142_12_0,
			w = slot_142_11_0,
			options = arg_142_2,
			var = arg_142_1,
			open_time = game.globalVars.m_flRealTime
		}
		slot_0_59_0.clicked = false
	end

	slot_0_59_0.y = slot_0_59_0.y + 45

	return 45
end

function slot_0_69_0()
	if not UI.active_combo_data then
		return
	end

	local var_143_0 = UI.active_combo_data
	local var_143_1 = draw.surface
	local var_143_2 = UI.theme
	local var_143_3 = 24
	local var_143_4 = var_143_0.w
	local var_143_5 = #var_143_0.options * var_143_3
	local var_143_6 = var_143_0.x
	local var_143_7 = var_143_0.y

	if slot_0_59_0.clicked then
		local var_143_8 = slot_0_59_0.Mouse.x
		local var_143_9 = slot_0_59_0.Mouse.y

		if var_143_6 <= var_143_8 and var_143_8 <= var_143_6 + var_143_4 and var_143_7 <= var_143_9 and var_143_9 <= var_143_7 + var_143_5 then
			-- block empty
		elseif game.globalVars.m_flRealTime > (var_143_0.open_time or 0) + 0.1 then
			UI.active_combo_data = nil
			slot_0_59_0.clicked = false

			return
		end
	end

	if var_143_1.add_background_blur then
		var_143_1:AddBackgroundBlur(draw.Rect(var_143_6, var_143_7, var_143_6 + var_143_4, var_143_7 + var_143_5), 2)
	end

	slot_0_44_0(var_143_6, var_143_7, var_143_4, var_143_5, var_143_2.accent, 20, 6)
	var_143_1:AddRectFilledRounded(draw.Rect(var_143_6, var_143_7, var_143_6 + var_143_4, var_143_7 + var_143_5), slot_0_41_0(var_143_2.bg_alt, 250), 4)
	var_143_1:AddRectRounded(draw.Rect(var_143_6, var_143_7, var_143_6 + var_143_4, var_143_7 + var_143_5), draw.Color(255, 255, 255, 15), 4, 1)

	for iter_143_0, iter_143_1 in ipairs(var_143_0.options) do
		local var_143_10 = var_143_6
		local var_143_11 = var_143_7 + (iter_143_0 - 1) * var_143_3

		if slot_0_59_0.Mouse and var_143_10 <= slot_0_59_0.Mouse.x and slot_0_59_0.Mouse.x <= var_143_10 + var_143_4 and var_143_11 <= slot_0_59_0.Mouse.y and slot_0_59_0.Mouse.y <= var_143_11 + var_143_3 then
			var_143_1:AddRectFilledRounded(draw.Rect(var_143_10 + 2, var_143_11 + 2, var_143_10 + var_143_4 - 2, var_143_11 + var_143_3 - 2), draw.Color(255, 255, 255, 10), 4)

			if slot_0_59_0.clicked and game.globalVars.m_flRealTime > (var_143_0.open_time or 0) + 0.1 then
				UI.cfg[var_143_0.var] = iter_143_1
				UI.active_combo_data = nil
				slot_0_59_0.clicked = false

				return
			end
		end

		local var_143_12 = UI.cfg[var_143_0.var] == iter_143_1 and slot_0_41_0(var_143_2.accent) or draw.Color(200, 200, 205, 255)

		var_143_1:AddText(draw.Vec2(var_143_10 + 10, var_143_11 + 5), iter_143_1, var_143_12)
	end
end

function slot_0_70_0()
	local var_144_0 = draw.surface
	local var_144_1 = slot_0_59_0.x
	local var_144_2 = slot_0_59_0.y
	local var_144_3 = (slot_0_59_0.group_w or 180) - 12
	local var_144_4 = draw.Color(255, 255, 255, 12)

	var_144_0:AddRectFilled(draw.Rect(var_144_1, var_144_2 + 2, var_144_1 + var_144_3, var_144_2 + 3), var_144_4)

	slot_0_59_0.y = slot_0_59_0.y + 6
end

function slot_0_71_0(arg_145_0, arg_145_1, arg_145_2, arg_145_3, arg_145_4, arg_145_5, arg_145_6, arg_145_7, arg_145_8)
	slot_145_9_0 = draw.surface
	slot_145_10_0 = UI.theme
	slot_0_59_0.group_w = arg_145_2

	if arg_145_6 == nil then
		arg_145_6 = true
	end

	slot_145_11_0 = arg_145_4

	if UI.collapsed_groups[slot_145_11_0] == nil then
		UI.collapsed_groups[slot_145_11_0] = false
	end

	slot_145_12_0 = UI.collapsed_groups[slot_145_11_0]
	slot_145_13_0 = 28
	slot_145_14_0 = UI.group_heights[slot_145_11_0] or arg_145_3

	if slot_145_14_0 < slot_145_13_0 then
		slot_145_14_0 = arg_145_3
	end

	slot_145_15_0 = arg_145_8 or slot_0_41_0(slot_145_10_0.accent, 150)
	slot_145_16_0 = false
	slot_145_17_1 = false

	if slot_0_59_0.Mouse and arg_145_0 <= slot_0_59_0.Mouse.x and slot_0_59_0.Mouse.x <= arg_145_0 + arg_145_2 and arg_145_1 <= slot_0_59_0.Mouse.y and slot_0_59_0.Mouse.y <= arg_145_1 + slot_145_13_0 then
		slot_145_16_0 = true
		slot_145_17_0 = true

		if arg_145_6 and slot_0_59_0.clicked then
			UI.collapsed_groups[slot_145_11_0] = not UI.collapsed_groups[slot_145_11_0]
			slot_145_12_0 = UI.collapsed_groups[slot_145_11_0]
		end
	end

	if slot_145_16_0 then
		UI.hovered_group = arg_145_4
	end

	slot_145_18_0 = slot_0_43_0("group_collapse_" .. slot_145_11_0, slot_145_12_0 and 0 or 1, 12)
	slot_145_19_0 = slot_145_13_0 + (slot_145_14_0 - slot_145_13_0) * slot_145_18_0
	slot_145_20_0 = slot_0_41_0(slot_145_10_0.control_border)

	slot_145_9_0:AddRectFilledRounded(draw.Rect(arg_145_0, arg_145_1, arg_145_0 + arg_145_2, arg_145_1 + slot_145_19_0), slot_145_20_0, 6, 15)

	slot_145_21_0 = slot_0_41_0(slot_145_10_0.bg, 255)

	slot_145_9_0:AddRectFilledRounded(draw.Rect(arg_145_0 + 1, arg_145_1 + 1, arg_145_0 + arg_145_2 - 1, arg_145_1 + slot_145_19_0 - 1), slot_145_21_0, 6, 15)

	if slot_145_16_0 and arg_145_6 then
		slot_145_9_0:AddRectFilledRounded(draw.Rect(arg_145_0 + 1, arg_145_1 + 1, arg_145_0 + arg_145_2 - 1, arg_145_1 + slot_145_13_0 - 1), slot_0_41_0(slot_145_10_0.accent, 35), 6)
	end

	if arg_145_7 then
		slot_145_22_1 = slot_0_51_0(UI.font, arg_145_4)
		slot_145_23_1 = 13
		slot_145_24_1 = 22
		slot_145_27_0 = arg_145_0 + (arg_145_2 - ((arg_145_5 and slot_145_24_1 or 0) + slot_145_22_1.x)) / 2

		if arg_145_5 then
			draw_icon_proc(arg_145_5, slot_145_27_0, arg_145_1 + (slot_145_13_0 - slot_145_23_1) / 2, slot_145_23_1, slot_0_41_0(slot_145_10_0.accent, 255))
			slot_145_9_0:AddText(draw.Vec2(slot_145_27_0 + slot_145_24_1, arg_145_1 + 8), arg_145_4, slot_0_41_0(slot_145_10_0.text))
		else
			slot_145_9_0:AddText(draw.Vec2(slot_145_27_0, arg_145_1 + 8), arg_145_4, slot_0_41_0(slot_145_10_0.text))
		end
	elseif arg_145_5 then
		draw_icon_proc(arg_145_5, arg_145_0 + 12, arg_145_1 + 10, 13, slot_0_41_0(slot_145_10_0.accent, 255))
		slot_145_9_0:AddText(draw.Vec2(arg_145_0 + 32, arg_145_1 + 8), arg_145_4, slot_0_41_0(slot_145_10_0.text))
	else
		slot_145_9_0:AddText(draw.Vec2(arg_145_0 + 12, arg_145_1 + 8), arg_145_4, slot_0_41_0(slot_145_10_0.text))
	end

	if arg_145_6 then
		slot_145_22_0 = arg_145_0 + arg_145_2 - 20
		slot_145_23_0 = arg_145_1 + 14
		slot_145_24_0 = 4
		slot_145_25_0 = slot_145_16_0 and slot_145_15_0 or slot_0_41_0(slot_145_10_0.text_dim)

		if slot_145_12_0 then
			slot_145_9_0:AddTriangleFilled(draw.Vec2(slot_145_22_0 - slot_145_24_0, slot_145_23_0 - slot_145_24_0), draw.Vec2(slot_145_22_0 - slot_145_24_0, slot_145_23_0 + slot_145_24_0), draw.Vec2(slot_145_22_0 + slot_145_24_0, slot_145_23_0), slot_145_25_0)
		else
			slot_145_9_0:AddTriangleFilled(draw.Vec2(slot_145_22_0 - slot_145_24_0, slot_145_23_0 - slot_145_24_0), draw.Vec2(slot_145_22_0 + slot_145_24_0, slot_145_23_0 - slot_145_24_0), draw.Vec2(slot_145_22_0, slot_145_23_0 + slot_145_24_0), slot_145_25_0)
		end
	end

	return arg_145_0 + 10, arg_145_1 + slot_145_13_0 + 10, slot_145_12_0, slot_145_18_0, slot_145_19_0
end

function slot_0_72_0(arg_146_0, arg_146_1)
	local var_146_0 = slot_0_59_0.y - arg_146_0 + 38 + 15

	UI.group_heights[arg_146_1] = var_146_0
end

function slot_0_73_0(arg_147_0, arg_147_1, arg_147_2, arg_147_3, arg_147_4, arg_147_5, arg_147_6)
	slot_147_7_0 = draw.surface
	slot_147_8_0 = UI.theme
	arg_147_1, arg_147_2, arg_147_3, arg_147_4 = math.floor(arg_147_1), math.floor(arg_147_2), math.floor(arg_147_3), math.floor(arg_147_4)
	slot_147_9_0 = UI.active_tab == arg_147_0
	slot_147_10_0 = false

	if slot_0_59_0.Mouse and arg_147_1 <= slot_0_59_0.Mouse.x and slot_0_59_0.Mouse.x <= arg_147_1 + arg_147_3 and arg_147_2 <= slot_0_59_0.Mouse.y and slot_0_59_0.Mouse.y <= arg_147_2 + arg_147_4 then
		slot_147_10_0 = true
	end

	if not UI.active_combo_data and slot_147_10_0 and slot_0_59_0.clicked and not slot_0_59_0.input_blocked then
		if UI.active_tab ~= arg_147_0 then
			UI.tab_anim.last_tab = UI.active_tab
			UI.active_tab = arg_147_0
			UI.tab_anim.progress = 0

			if arg_147_0 == "Config" then
				slot_0_6_0.refresh_presets()

				if slot_0_37_0 and slot_0_37_0.fetchConfigs then
					slot_0_37_0.fetchConfigs(true)
				end
			end
		end

		slot_0_59_0.clicked = false
	end

	slot_147_11_0 = slot_0_43_0("tab_" .. arg_147_0, slot_147_9_0 and 1 or slot_147_10_0 and 0.5 or 0, 12)

	if slot_147_11_0 > 0.01 then
		slot_147_12_1 = math.floor((slot_147_9_0 and 40 or 12) * slot_147_11_0)
		slot_147_13_1 = slot_0_41_0(slot_147_8_0.accent, slot_147_12_1)

		slot_147_7_0:AddRectFilledRounded(draw.Rect(arg_147_1, arg_147_2, arg_147_1 + arg_147_3, arg_147_2 + arg_147_4), slot_147_13_1, 4)

		if slot_147_9_0 then
			slot_147_14_1 = 40

			for iter_147_0 = 0, slot_147_14_1 do
				slot_147_19_1 = math.floor(40 * (1 - iter_147_0 / slot_147_14_1))

				slot_147_7_0:AddRectFilled(draw.Rect(arg_147_1 + iter_147_0, arg_147_2, arg_147_1 + iter_147_0 + 1, arg_147_2 + arg_147_4), slot_0_41_0(slot_147_8_0.accent, slot_147_19_1))
			end

			slot_147_7_0:AddRectFilledRounded(draw.Rect(arg_147_1, arg_147_2 + 4, arg_147_1 + 3, arg_147_2 + arg_147_4 - 4), slot_0_41_0(slot_147_8_0.accent, 255), 2)
		end
	end

	slot_147_12_0 = slot_147_8_0.text
	slot_147_13_0 = slot_147_8_0.text_dim

	if type(slot_147_12_0) == "table" then
		slot_147_12_0 = draw.Color(slot_147_12_0[1], slot_147_12_0[2], slot_147_12_0[3], slot_147_12_0[4])
	end

	if type(slot_147_13_0) == "table" then
		slot_147_13_0 = draw.Color(slot_147_13_0[1], slot_147_13_0[2], slot_147_13_0[3], slot_147_13_0[4])
	end

	slot_147_14_0 = slot_147_13_0:interpolate(draw.color.white(), 0.15)
	slot_147_15_0 = slot_0_42_0(slot_147_14_0, slot_147_12_0, slot_147_11_0)

	if slot_147_9_0 then
		slot_147_15_0 = draw.color.white()
	end

	slot_147_16_0 = 14
	slot_147_17_0 = 12 + slot_147_11_0 * 4

	if arg_147_5 then
		slot_147_18_1 = math.floor(arg_147_1 + 15)
		slot_147_19_0 = math.floor(arg_147_2 + (arg_147_4 - slot_147_16_0) / 2 + 3)
		slot_147_20_0 = draw.Color(160, 160, 175, 180)
		slot_147_21_0 = slot_0_41_0(slot_147_8_0.accent, 255)
		slot_147_22_0 = slot_0_42_0(slot_147_20_0, slot_147_21_0, slot_147_11_0)

		if slot_147_9_0 then
			slot_147_23_0 = slot_0_41_0(slot_147_8_0.accent, 60)

			draw_icon_proc(arg_147_5, slot_147_18_1, slot_147_19_0, slot_147_16_0, slot_147_23_0)

			slot_147_22_0 = slot_147_21_0
		end

		draw_icon_proc(arg_147_5, slot_147_18_1, slot_147_19_0, slot_147_16_0, slot_147_22_0)

		slot_147_17_0 = slot_147_17_0 + slot_147_16_0 + 10
	end

	if slot_147_9_0 then
		slot_147_7_0:AddText(draw.Vec2(arg_147_1 + slot_147_17_0 + 1, arg_147_2 + arg_147_4 / 2 - 4), arg_147_0, draw.Color(0, 0, 0, 100))
	end

	slot_147_7_0:AddText(draw.Vec2(arg_147_1 + slot_147_17_0, arg_147_2 + arg_147_4 / 2 - 5), arg_147_0, slot_147_15_0)

	slot_147_18_0 = draw.Color(255, 255, 255, 12)

	slot_147_7_0:AddRectFilled(draw.Rect(arg_147_1 + 10, arg_147_2 + arg_147_4, arg_147_1 + arg_147_3 - 10, arg_147_2 + arg_147_4 + 1), slot_147_18_0)

	return arg_147_4 + 2
end

function set_clipboard_safe(arg_148_0)
	if not arg_148_0 then
		return
	end

	if utils.ClipboardSet then
		utils.ClipboardSet(arg_148_0)
	elseif utils.set_clipboard then
		utils.set_clipboard(arg_148_0)
	end
end

function get_clipboard_safe()
	if utils.ClipboardGet then
		return utils.ClipboardGet()
	elseif utils.GetClipboard then
		return utils.GetClipboard()
	elseif utils.get_clipboard then
		return utils.get_clipboard()
	end

	return nil
end

if not UI.active_color_picker then
	UI.active_color_picker = nil
end

function slot_0_74_0(arg_150_0, arg_150_1, arg_150_2)
	if arg_150_2 ~= nil then
		if type(arg_150_2) == "function" then
			if not arg_150_2() then
				return 0
			end
		elseif not arg_150_2 then
			return 0
		end
	end

	local var_150_0 = slot_0_59_0.x
	local var_150_1 = slot_0_59_0.y
	local var_150_2 = UI.theme
	local var_150_3 = draw.surface
	local var_150_4 = 14
	local var_150_5 = 8
	local var_150_6 = UI.cfg[arg_150_1] or {
		255,
		90,
		130,
		255,
		[0] = nil
	}
	local var_150_7 = var_150_2.text_dim

	if type(var_150_7) == "table" then
		var_150_7 = draw.Color(var_150_7[1], var_150_7[2], var_150_7[3], 255)
	end

	var_150_3:AddText(draw.Vec2(var_150_0, var_150_1 + 2), arg_150_0, var_150_7)

	local var_150_8 = var_150_0 + (slot_0_59_0.group_w or 180) - 40
	local var_150_9 = var_150_1 + 1
	local var_150_10 = false

	if slot_0_59_0.Mouse and var_150_8 <= slot_0_59_0.Mouse.x and slot_0_59_0.Mouse.x <= var_150_8 + var_150_4 and var_150_9 <= slot_0_59_0.Mouse.y and slot_0_59_0.Mouse.y <= var_150_9 + var_150_4 then
		var_150_10 = true
	end

	if var_150_10 and slot_0_59_0.clicked and not slot_0_59_0.input_blocked then
		if UI.active_color_picker == arg_150_1 then
			UI.active_color_picker = nil
		else
			UI.active_color_picker = arg_150_1
			UI.picker_x = var_150_8 + var_150_4 + 25
			UI.picker_y = var_150_9 + var_150_4 / 2 - 137.5
			UI.picker_just_opened = 3
			UI.picker_release_guarded = true
		end

		slot_0_59_0.clicked = false
	end

	var_150_3:AddRectFilledRounded(draw.Rect(var_150_8 - 1, var_150_9 - 1, var_150_8 + var_150_4 + 1, var_150_9 + var_150_4 + 1), draw.Color(255, 255, 255, 20), 3)
	var_150_3:AddRectFilledRounded(draw.Rect(var_150_8, var_150_9, var_150_8 + var_150_4, var_150_9 + var_150_4), draw.Color(var_150_6[1], var_150_6[2], var_150_6[3], 255), 3)

	if var_150_10 or UI.active_color_picker == arg_150_1 then
		var_150_3:AddRect(draw.Rect(var_150_8 - 2, var_150_9 - 2, var_150_8 + var_150_4 + 2, var_150_9 + var_150_4 + 2), slot_0_41_0(var_150_2.accent), 2)
	end

	slot_0_59_0.y = slot_0_59_0.y + var_150_4 + var_150_5

	return var_150_4 + var_150_5
end

function slot_0_75_0(arg_151_0, arg_151_1, arg_151_2)
	slot_151_3_0 = draw.surface
	slot_151_4_0 = UI.theme
	slot_151_5_0 = 220
	slot_151_6_0 = 275
	slot_151_7_0 = slot_0_59_0.Mouse
	slot_151_8_0 = slot_0_60_0 or slot_0_11_0()
	slot_151_9_0 = 30

	if slot_151_7_0 and arg_151_1 <= slot_151_7_0.x and slot_151_7_0.x <= arg_151_1 + slot_151_5_0 and arg_151_2 <= slot_151_7_0.y and slot_151_7_0.y <= arg_151_2 + slot_151_9_0 and slot_0_59_0.clicked then
		UI.picker_dragging = true
		UI.picker_drag_off_x = slot_151_7_0.x - arg_151_1
		UI.picker_drag_off_y = slot_151_7_0.y - arg_151_2
	end

	if UI.picker_dragging then
		if slot_151_8_0 then
			UI.picker_x = slot_151_7_0.x - UI.picker_drag_off_x
			UI.picker_y = slot_151_7_0.y - UI.picker_drag_off_y
			arg_151_1, arg_151_2 = UI.picker_x, UI.picker_y
		else
			UI.picker_dragging = false
		end
	end

	if not slot_151_8_0 then
		UI.picker_release_guarded = false
	end

	if not (slot_151_7_0 and arg_151_1 <= slot_151_7_0.x and slot_151_7_0.x <= arg_151_1 + slot_151_5_0 and arg_151_2 <= slot_151_7_0.y and slot_151_7_0.y <= arg_151_2 + slot_151_6_0) and slot_0_59_0.clicked and not UI.picker_dragging and UI.picker_just_opened == 0 and not UI.picker_release_guarded then
		UI.active_color_picker = nil
		slot_0_59_0.clicked = false

		return
	end

	if UI.picker_just_opened > 0 then
		UI.picker_just_opened = UI.picker_just_opened - 1
	end

	if not UI.picker_dragging then
		slot_151_12_1 = arg_151_2 + 137.5

		slot_151_3_0:AddTriangleFilled(draw.Vec2(arg_151_1, slot_151_12_1 - 7), draw.Vec2(arg_151_1, slot_151_12_1 + 7), draw.Vec2(arg_151_1 - 7, slot_151_12_1), slot_0_41_0(slot_151_4_0.bg_alt, 255))
	end

	if slot_151_3_0.add_background_blur then
		slot_151_3_0:AddBackgroundBlur(draw.Rect(arg_151_1, arg_151_2, arg_151_1 + slot_151_5_0, arg_151_2 + slot_151_6_0), 2)
	end

	slot_0_44_0(arg_151_1, arg_151_2, slot_151_5_0, slot_151_6_0, slot_151_4_0.accent, 25, 8)
	slot_151_3_0:AddRectFilledRounded(draw.Rect(arg_151_1, arg_151_2, arg_151_1 + slot_151_5_0, arg_151_2 + slot_151_6_0), slot_0_41_0(slot_151_4_0.bg_alt, 250), 12)
	slot_151_3_0:AddRectRounded(draw.Rect(arg_151_1, arg_151_2, arg_151_1 + slot_151_5_0, arg_151_2 + slot_151_6_0), draw.Color(255, 255, 255, 10), 12, 1)
	slot_151_3_0:AddText(draw.Vec2(arg_151_1 + 12, arg_151_2 + 10), "Color Picker", slot_0_41_0(slot_151_4_0.text))

	slot_151_12_0 = arg_151_1 + slot_151_5_0 - 24
	slot_151_13_0 = arg_151_2 + 10
	slot_151_14_0 = 14

	if slot_151_7_0 and slot_151_12_0 <= slot_151_7_0.x and slot_151_7_0.x <= slot_151_12_0 + slot_151_14_0 and slot_151_13_0 <= slot_151_7_0.y and slot_151_7_0.y <= slot_151_13_0 + slot_151_14_0 then
		if slot_0_59_0.clicked then
			UI.active_color_picker = nil
			slot_0_59_0.clicked = false

			return
		end

		slot_151_3_0:AddRectFilledRounded(draw.Rect(slot_151_12_0, slot_151_13_0, slot_151_12_0 + slot_151_14_0, slot_151_13_0 + slot_151_14_0), draw.Color(255, 100, 100, 60), 4)
	end

	slot_151_3_0:AddText(draw.Vec2(slot_151_12_0 + 3, slot_151_13_0 - 1), "x", draw.Color(255, 255, 255, 180))

	slot_151_15_0 = 12
	slot_151_16_0 = UI.cfg[arg_151_0] or {
		255,
		255,
		255,
		255,
		[0] = nil
	}
	slot_151_17_0, slot_151_18_0, slot_151_19_0 = slot_0_32_0(slot_151_16_0[1], slot_151_16_0[2], slot_151_16_0[3])
	slot_151_20_0 = arg_151_1 + slot_151_15_0
	slot_151_21_0 = arg_151_2 + 40
	slot_151_22_0 = slot_151_5_0 - slot_151_15_0 * 2
	slot_151_23_0 = 120

	slot_151_3_0:AddRectFilledRounded(draw.Rect(slot_151_20_0 - 1, slot_151_21_0 - 1, slot_151_20_0 + slot_151_22_0 + 1, slot_151_21_0 + slot_151_23_0 + 1), draw.Color(40, 40, 45, 255), 6)

	slot_151_24_0, slot_151_25_0, slot_151_26_0 = slot_0_31_0(slot_151_17_0, 1, 1)

	for iter_151_0 = 0, slot_151_22_0 - 1 do
		slot_151_31_2 = math.floor(iter_151_0 / (slot_151_22_0 - 1) * 255)

		slot_151_3_0:AddRectFilled(draw.Rect(slot_151_20_0 + iter_151_0, slot_151_21_0, slot_151_20_0 + iter_151_0 + 1, slot_151_21_0 + slot_151_23_0), draw.Color(slot_151_24_0, slot_151_25_0, slot_151_26_0, slot_151_31_2))
	end

	for iter_151_1 = 0, slot_151_23_0 - 1 do
		slot_151_31_1 = math.floor(iter_151_1 / (slot_151_23_0 - 1) * 255)

		slot_151_3_0:AddRectFilled(draw.Rect(slot_151_20_0, slot_151_21_0 + iter_151_1, slot_151_20_0 + slot_151_22_0, slot_151_21_0 + iter_151_1 + 1), draw.Color(0, 0, 0, slot_151_31_1))
	end

	if slot_0_59_0.mouse_down and slot_151_20_0 <= slot_0_59_0.Mouse.x and slot_0_59_0.Mouse.x <= slot_151_20_0 + slot_151_22_0 and slot_151_21_0 <= slot_0_59_0.Mouse.y and slot_0_59_0.Mouse.y <= slot_151_21_0 + slot_151_23_0 then
		slot_151_18_0 = math.max(0, math.min(1, (slot_0_59_0.Mouse.x - slot_151_20_0) / slot_151_22_0))
		slot_151_19_0 = math.max(0, math.min(1, 1 - (slot_0_59_0.Mouse.y - slot_151_21_0) / slot_151_23_0))
		slot_151_27_1, slot_151_28_1, slot_151_29_1 = slot_0_31_0(slot_151_17_0, slot_151_18_0, slot_151_19_0)

		if not UI.cfg[arg_151_0] then
			UI.cfg[arg_151_0] = {
				255,
				255,
				255,
				255,
				[0] = nil
			}
		end

		UI.cfg[arg_151_0][1], UI.cfg[arg_151_0][2], UI.cfg[arg_151_0][3] = slot_151_27_1, slot_151_28_1, slot_151_29_1
	end

	slot_151_27_0 = slot_151_20_0 + slot_151_18_0 * slot_151_22_0
	slot_151_28_0 = slot_151_21_0 + (1 - slot_151_19_0) * slot_151_23_0

	slot_151_3_0:AddCircleFilled(draw.Vec2(slot_151_27_0, slot_151_28_0), 4, draw.Color(255, 255, 255, 255), 16)
	slot_151_3_0:AddCircleFilled(draw.Vec2(slot_151_27_0, slot_151_28_0), 3, draw.Color(slot_151_16_0[1], slot_151_16_0[2], slot_151_16_0[3], 255), 16)

	slot_151_29_0 = slot_151_20_0
	slot_151_30_0 = slot_151_21_0 + slot_151_23_0 + 10
	slot_151_31_0 = slot_151_22_0
	slot_151_32_0 = 12
	slot_151_33_0 = slot_151_31_0

	for iter_151_2 = 0, slot_151_33_0 - 1 do
		slot_151_38_1, slot_151_39_1, slot_151_40_1 = slot_0_31_0(iter_151_2 / slot_151_33_0, 1, 1)

		slot_151_3_0:AddRectFilled(draw.Rect(slot_151_29_0 + iter_151_2, slot_151_30_0, slot_151_29_0 + iter_151_2 + 1, slot_151_30_0 + slot_151_32_0), draw.Color(slot_151_38_1, slot_151_39_1, slot_151_40_1, 255))
	end

	if slot_0_59_0.mouse_down and slot_151_29_0 <= slot_0_59_0.Mouse.x and slot_0_59_0.Mouse.x <= slot_151_29_0 + slot_151_31_0 and slot_151_30_0 <= slot_0_59_0.Mouse.y and slot_0_59_0.Mouse.y <= slot_151_30_0 + slot_151_32_0 then
		slot_151_17_0 = math.max(0, math.min(0.99, (slot_0_59_0.Mouse.x - slot_151_29_0) / slot_151_31_0))
		slot_151_34_1, slot_151_35_1, slot_151_36_1 = slot_0_31_0(slot_151_17_0, slot_151_18_0, slot_151_19_0)

		if not UI.cfg[arg_151_0] then
			UI.cfg[arg_151_0] = {
				255,
				255,
				255,
				255,
				[0] = nil
			}
		end

		UI.cfg[arg_151_0][1], UI.cfg[arg_151_0][2], UI.cfg[arg_151_0][3] = slot_151_34_1, slot_151_35_1, slot_151_36_1
	end

	slot_151_34_0 = slot_151_29_0 + slot_151_17_0 * slot_151_31_0

	slot_151_3_0:AddRectFilled(draw.Rect(slot_151_34_0 - 1, slot_151_30_0 - 2, slot_151_34_0 + 1, slot_151_30_0 + slot_151_32_0 + 2), draw.Color(255, 255, 255, 255))

	slot_151_35_0 = slot_151_29_0
	slot_151_36_0 = slot_151_30_0 + slot_151_32_0 + 10
	slot_151_37_0 = slot_151_31_0
	slot_151_38_0 = 12
	slot_151_39_0 = slot_151_37_0

	for iter_151_3 = 0, slot_151_39_0 - 1 do
		slot_151_44_1 = math.floor(iter_151_3 / slot_151_39_0 * 255)

		slot_151_3_0:AddRectFilled(draw.Rect(slot_151_35_0 + iter_151_3, slot_151_36_0, slot_151_35_0 + iter_151_3 + 1, slot_151_36_0 + slot_151_38_0), draw.Color(slot_151_16_0[1], slot_151_16_0[2], slot_151_16_0[3], slot_151_44_1))
	end

	if slot_0_59_0.mouse_down and slot_151_35_0 <= slot_0_59_0.Mouse.x and slot_0_59_0.Mouse.x <= slot_151_35_0 + slot_151_37_0 and slot_151_36_0 <= slot_0_59_0.Mouse.y and slot_0_59_0.Mouse.y <= slot_151_36_0 + slot_151_38_0 then
		if not UI.cfg[arg_151_0] then
			UI.cfg[arg_151_0] = {
				255,
				255,
				255,
				255,
				[0] = nil
			}
		end

		UI.cfg[arg_151_0][4] = math.floor(math.max(0, math.min(255, (slot_0_59_0.Mouse.x - slot_151_35_0) / slot_151_37_0 * 255)))
	end

	slot_151_40_0 = slot_151_35_0 + slot_151_16_0[4] / 255 * slot_151_37_0

	slot_151_3_0:AddRectFilled(draw.Rect(slot_151_40_0 - 1, slot_151_36_0 - 2, slot_151_40_0 + 1, slot_151_36_0 + slot_151_38_0 + 2), draw.Color(255, 255, 255, 255))

	slot_151_41_0 = slot_151_36_0 + slot_151_38_0 + 10

	slot_151_3_0:AddRectFilledRounded(draw.Rect(slot_151_20_0, slot_151_41_0, slot_151_20_0 + slot_151_22_0, slot_151_41_0 + 15), draw.Color(slot_151_16_0[1], slot_151_16_0[2], slot_151_16_0[3], 255), 4)
	slot_151_3_0:AddRectRounded(draw.Rect(slot_151_20_0, slot_151_41_0, slot_151_20_0 + slot_151_22_0, slot_151_41_0 + 15), draw.Color(255, 255, 255, 60), 4, 1)

	slot_151_42_0 = slot_151_41_0 + 25
	slot_151_43_0 = slot_151_22_0 - 75
	slot_151_44_0 = slot_0_33_0(slot_151_16_0[1], slot_151_16_0[2], slot_151_16_0[3], slot_151_16_0[4])

	slot_151_3_0:AddRectFilledRounded(draw.Rect(slot_151_20_0, slot_151_42_0, slot_151_20_0 + slot_151_43_0, slot_151_42_0 + 20), draw.Color(30, 30, 35, 255), 4)
	slot_151_3_0:AddText(draw.Vec2(slot_151_20_0 + 8, slot_151_42_0 + 4), slot_151_44_0, draw.Color(200, 200, 205, 255))

	slot_151_45_0 = 34
	slot_151_46_0 = slot_151_20_0 + slot_151_43_0 + 4
	slot_151_47_0 = slot_151_46_0 + slot_151_45_0 + 3
	slot_151_48_0 = slot_151_46_0 <= slot_0_59_0.Mouse.x and slot_0_59_0.Mouse.x <= slot_151_46_0 + slot_151_45_0 and slot_151_42_0 <= slot_0_59_0.Mouse.y and slot_0_59_0.Mouse.y <= slot_151_42_0 + 20
	slot_151_49_0 = slot_151_47_0 <= slot_0_59_0.Mouse.x and slot_0_59_0.Mouse.x <= slot_151_47_0 + slot_151_45_0 and slot_151_42_0 <= slot_0_59_0.Mouse.y and slot_0_59_0.Mouse.y <= slot_151_42_0 + 20

	slot_151_3_0:AddRectFilledRounded(draw.Rect(slot_151_46_0, slot_151_42_0, slot_151_46_0 + slot_151_45_0, slot_151_42_0 + 20), slot_151_48_0 and draw.Color(60, 60, 65, 255) or draw.Color(45, 45, 50, 255), 4)
	slot_151_3_0:AddText(draw.Vec2(slot_151_46_0 + 5, slot_151_42_0 + 4), "CPY", draw.Color(220, 220, 225, 255))
	slot_151_3_0:AddRectFilledRounded(draw.Rect(slot_151_47_0, slot_151_42_0, slot_151_47_0 + slot_151_45_0, slot_151_42_0 + 20), slot_151_49_0 and draw.Color(60, 60, 65, 255) or draw.Color(45, 45, 50, 255), 4)
	slot_151_3_0:AddText(draw.Vec2(slot_151_47_0 + 4, slot_151_42_0 + 4), "PST", draw.Color(220, 220, 225, 255))

	if slot_0_59_0.clicked then
		if slot_151_48_0 then
			set_clipboard_safe(slot_151_44_0)

			slot_0_59_0.clicked = false
		elseif slot_151_49_0 then
			slot_151_50_0 = get_clipboard_safe()

			if slot_151_50_0 then
				slot_151_51_0, slot_151_52_0, slot_151_53_0, slot_151_54_0 = slot_0_34_0(slot_151_50_0)

				if slot_151_51_0 then
					UI.cfg[arg_151_0] = {
						slot_151_51_0,
						slot_151_52_0,
						slot_151_53_0,
						slot_151_54_0
					}
				end
			end

			slot_0_59_0.clicked = false
		end
	end
end

function slot_0_76_0(arg_152_0, arg_152_1, arg_152_2, arg_152_3, arg_152_4)
	slot_152_5_0 = draw.surface
	slot_152_6_0 = UI.theme
	slot_152_7_0 = 210
	slot_152_8_0 = 10
	slot_152_10_0 = slot_152_8_0 + 8

	for iter_152_0, iter_152_1 in ipairs(arg_152_3) do
		slot_152_16_2 = true

		if iter_152_1.show ~= nil then
			if type(iter_152_1.show) == "function" then
				slot_152_16_2 = iter_152_1.show()
			elseif type(iter_152_1.show) == "boolean" then
				slot_152_16_2 = iter_152_1.show
			end
		end

		if slot_152_16_2 then
			slot_152_17_2 = iter_152_1.type or "checkbox"

			if slot_152_17_2 == "slider" then
				slot_152_10_0 = slot_152_10_0 + 28
			elseif slot_152_17_2 == "combo" then
				slot_152_10_0 = slot_152_10_0 + 36
			elseif slot_152_17_2 == "hotkey" or slot_152_17_2 == "keybind" then
				slot_152_10_0 = slot_152_10_0 + 42
			else
				slot_152_10_0 = slot_152_10_0 + 24
			end
		end
	end

	slot_152_11_0 = 255

	if slot_152_5_0.add_background_blur then
		slot_152_5_0:AddBackgroundBlur(draw.Rect(arg_152_1, arg_152_2, arg_152_1 + slot_152_7_0, arg_152_2 + slot_152_10_0), 2)
	end

	slot_0_44_0(arg_152_1, arg_152_2, slot_152_7_0, slot_152_10_0, slot_152_6_0.accent, 35, 12)

	slot_152_12_0 = slot_0_41_0(slot_152_6_0.bg_alt, 255)

	slot_152_5_0:AddRectFilledRounded(draw.Rect(arg_152_1, arg_152_2, arg_152_1 + slot_152_7_0, arg_152_2 + slot_152_10_0), slot_152_12_0, 8)

	slot_152_13_0 = arg_152_2 + slot_152_8_0

	if not UI.active_combo_data then
		UI.active_combo_data = nil
	end

	for iter_152_2, iter_152_3 in ipairs(arg_152_3) do
		slot_152_19_1 = true

		if iter_152_3.show ~= nil then
			if type(iter_152_3.show) == "function" then
				slot_152_19_1 = iter_152_3.show()
			elseif type(iter_152_3.show) == "boolean" then
				slot_152_19_1 = iter_152_3.show
			end
		end

		if slot_152_19_1 then
			slot_152_20_0 = iter_152_3.type or "checkbox"
			slot_152_21_0 = iter_152_3.label or iter_152_3[1]
			slot_152_22_0 = iter_152_3.id or iter_152_3.var or iter_152_3[2]

			if not iter_152_3.tooltip then
				slot_152_23_1 = iter_152_3[3]
			end

			slot_152_24_1 = arg_152_1 + 10
			slot_152_25_1 = slot_152_13_0
			slot_152_26_1 = slot_152_7_0 - 20
			slot_152_27_1 = 20

			if slot_152_20_0 == "slider" then
				slot_152_27_1 = 24
				slot_152_28_4 = UI.cfg[slot_152_22_0] or iter_152_3.min or 0
				slot_152_29_4 = iter_152_3.min or 0
				slot_152_30_4 = iter_152_3.max or 100

				slot_152_5_0:AddText(draw.Vec2(slot_152_24_1, slot_152_25_1), slot_152_21_0, slot_0_41_0(slot_152_6_0.text))

				slot_152_31_4 = tostring(math.floor(slot_152_28_4))
				slot_152_32_2 = slot_0_51_0(slot_152_5_0.font, slot_152_31_4)

				slot_152_5_0:AddText(draw.Vec2(arg_152_1 + slot_152_7_0 - 10 - slot_152_32_2.x, slot_152_25_1), slot_152_31_4, slot_0_41_0(slot_152_6_0.accent))

				slot_152_33_4 = slot_152_25_1 + 14
				slot_152_34_4 = slot_152_7_0 - 20
				slot_152_35_3 = 4
				slot_152_36_2 = (slot_152_28_4 - slot_152_29_4) / (slot_152_30_4 - slot_152_29_4)

				if slot_152_24_1 <= slot_0_59_0.Mouse.x and slot_0_59_0.Mouse.x <= slot_152_24_1 + slot_152_34_4 and slot_0_59_0.Mouse.y >= slot_152_33_4 - 4 and slot_0_59_0.Mouse.y <= slot_152_33_4 + slot_152_35_3 + 4 and arg_152_4 then
					slot_152_39_2 = math.max(0, math.min(slot_152_34_4, slot_0_59_0.Mouse.x - slot_152_24_1)) / slot_152_34_4
					slot_152_40_1 = slot_152_29_4 + slot_152_39_2 * (slot_152_30_4 - slot_152_29_4)
					UI.cfg[slot_152_22_0] = slot_152_40_1
					slot_152_36_2 = slot_152_39_2
				end

				slot_152_5_0:AddRectFilledRounded(draw.Rect(slot_152_24_1, slot_152_33_4, slot_152_24_1 + slot_152_34_4, slot_152_33_4 + slot_152_35_3), draw.Color(255, 255, 255, 12), 2)
				slot_152_5_0:AddRectFilledRounded(draw.Rect(slot_152_24_1, slot_152_33_4, slot_152_24_1 + slot_152_34_4 * slot_152_36_2, slot_152_33_4 + slot_152_35_3), slot_0_41_0(slot_152_6_0.accent), 2)

				slot_152_38_3 = slot_152_24_1 + slot_152_34_4 * slot_152_36_2
				slot_152_39_1 = slot_152_33_4 + 2

				slot_0_44_0(slot_152_38_3 - 4, slot_152_39_1 - 4, 8, 8, slot_152_6_0.accent, 20, 2)
				slot_152_5_0:AddCircleFilled(draw.Vec2(slot_152_38_3, slot_152_39_1), 4, draw.Color(255, 255, 255, 255))
			elseif slot_152_20_0 == "combo" then
				slot_152_27_1 = 32
				slot_152_28_3 = UI.cfg[slot_152_22_0] or iter_152_3.options and iter_152_3.options[1]
				slot_152_29_3 = iter_152_3.options or {}

				slot_152_5_0:AddText(draw.Vec2(slot_152_24_1 + 4, slot_152_25_1), slot_152_21_0, draw.Color(210, 210, 215, 255))

				slot_152_30_3 = 18
				slot_152_31_3 = slot_152_25_1 + 12
				slot_152_32_1 = slot_152_24_1 <= slot_0_59_0.Mouse.x and slot_0_59_0.Mouse.x <= slot_152_24_1 + slot_152_26_1 and slot_152_31_3 <= slot_0_59_0.Mouse.y and slot_0_59_0.Mouse.y <= slot_152_31_3 + slot_152_30_3
				slot_152_33_3 = false

				if UI.active_combo_data then
					slot_152_34_3 = UI.active_combo_data

					if slot_0_59_0.Mouse.x >= slot_152_34_3.x and slot_0_59_0.Mouse.x <= slot_152_34_3.x + slot_152_34_3.w and slot_0_59_0.Mouse.y >= slot_152_34_3.y and slot_0_59_0.Mouse.y <= slot_152_34_3.y + #slot_152_34_3.options * 20 then
						slot_152_33_3 = true
					end
				end

				if not slot_152_33_3 and slot_152_32_1 and arg_152_4 and not UI.popup_click_state_prev then
					if UI.active_combo_data and UI.active_combo_data.id == slot_152_22_0 then
						UI.active_combo_data = nil
					else
						UI.active_combo_data = {
							[0] = nil,
							id = slot_152_22_0,
							x = slot_152_24_1,
							y = slot_152_31_3 + slot_152_30_3,
							w = slot_152_26_1,
							options = slot_152_29_3,
							var = slot_152_22_0,
							open_time = game.globalVars.m_flRealTime
						}
					end

					slot_0_59_0.clicked = false
				end

				slot_152_5_0:AddRectFilled(draw.Rect(slot_152_24_1, slot_152_31_3, slot_152_24_1 + slot_152_26_1, slot_152_31_3 + slot_152_30_3), draw.Color(255, 255, 255, 10))

				slot_152_34_2 = slot_152_5_0.font:GetTextSize(tostring(slot_152_28_3))

				slot_152_5_0:AddText(draw.Vec2(slot_152_24_1 + 6, slot_152_31_3 + (slot_152_30_3 - slot_152_34_2.y) / 2), tostring(slot_152_28_3), slot_0_41_0(slot_152_6_0.text))

				slot_152_35_2 = slot_152_31_3 + slot_152_30_3 / 2 - 2

				slot_152_5_0:AddTriangleFilled(draw.Vec2(slot_152_24_1 + slot_152_26_1 - 12, slot_152_35_2), draw.Vec2(slot_152_24_1 + slot_152_26_1 - 6, slot_152_35_2), draw.Vec2(slot_152_24_1 + slot_152_26_1 - 9, slot_152_35_2 + 4), draw.Color(150, 150, 150, 255))
				slot_152_5_0:AddTriangleFilled(draw.Vec2(slot_152_24_1 + slot_152_26_1 - 12, slot_152_35_2), draw.Vec2(slot_152_24_1 + slot_152_26_1 - 6, slot_152_35_2), draw.Vec2(slot_152_24_1 + slot_152_26_1 - 9, slot_152_35_2 + 4), draw.Color(150, 150, 150, 255))
			elseif slot_152_20_0 == "Color" then
				slot_152_27_1 = 20

				slot_152_5_0:AddText(draw.Vec2(slot_152_24_1 + 4, slot_152_25_1), slot_152_21_0, draw.Color(200, 200, 205, 255))

				slot_152_28_2 = 14
				slot_152_29_2 = arg_152_1 + slot_152_7_0 - 10 - slot_152_28_2
				slot_152_30_2 = slot_152_25_1
				slot_152_31_2 = UI.cfg[slot_152_22_0] or {
					255,
					255,
					255,
					255,
					[0] = nil
				}

				if slot_152_29_2 <= slot_0_59_0.Mouse.x and slot_0_59_0.Mouse.x <= slot_152_29_2 + slot_152_28_2 and slot_152_30_2 <= slot_0_59_0.Mouse.y and slot_0_59_0.Mouse.y <= slot_152_30_2 + slot_152_28_2 and arg_152_4 and not UI.popup_click_state_prev then
					slot_152_33_2 = UI

					if UI.active_color_picker == slot_152_22_0 then
						-- block empty
					end

					slot_152_33_2.active_color_picker = slot_152_22_0
					slot_0_59_0.clicked = false
				end

				slot_152_5_0:AddRectFilledRounded(draw.Rect(slot_152_29_2 - 1, slot_152_30_2 - 1, slot_152_29_2 + slot_152_28_2 + 1, slot_152_30_2 + slot_152_28_2 + 1), draw.Color(255, 255, 255, 15), 4)
				slot_152_5_0:AddRectFilledRounded(draw.Rect(slot_152_29_2, slot_152_30_2, slot_152_29_2 + slot_152_28_2, slot_152_30_2 + slot_152_28_2), draw.Color(slot_152_31_2[1], slot_152_31_2[2], slot_152_31_2[3], slot_152_31_2[4]), 4)

				if UI.active_color_picker == slot_152_22_0 then
					slot_152_5_0:AddRect(draw.Rect(slot_152_29_2 - 2, slot_152_30_2 - 2, slot_152_29_2 + slot_152_28_2 + 2, slot_152_30_2 + slot_152_28_2 + 2), slot_0_41_0(slot_152_6_0.accent), 2)
				end
			elseif slot_152_20_0 == "hotkey" or slot_152_20_0 == "keybind" then
				slot_152_27_1 = 38
				slot_152_28_1 = UI.cfg[slot_152_22_0] or 0

				if not UI.key_names then
					UI.key_names = {
						[0] = "None",
						"M1",
						"M2",
						"Break",
						"M3",
						"M4",
						"M5",
						nil,
						"Back",
						"Tab",
						nil,
						nil,
						nil,
						"Enter",
						nil,
						nil,
						"Shift",
						"Ctrl",
						"Alt",
						nil,
						"Caps",
						nil,
						nil,
						nil,
						nil,
						nil,
						nil,
						"Esc",
						nil,
						nil,
						nil,
						nil,
						"Space",
						"PgUp",
						"PgDn",
						"End",
						"Home",
						"Left",
						"Up",
						"Right",
						"Down",
						nil,
						nil,
						nil,
						nil,
						"Ins",
						"Del",
						nil,
						"0",
						"1",
						"2",
						"3",
						"4",
						"5",
						"6",
						"7",
						"8",
						"9",
						nil,
						nil,
						nil,
						nil,
						nil,
						nil,
						nil,
						"A",
						"B",
						"C",
						"D",
						"E",
						"F",
						"G",
						"H",
						"I",
						"J",
						"K",
						"L",
						"M",
						"N",
						"O",
						"P",
						"Q",
						"R",
						"S",
						"T",
						"U",
						"V",
						"W",
						"X",
						"Y",
						"Z",
						nil,
						nil,
						nil,
						nil,
						nil,
						nil,
						nil,
						nil,
						nil,
						nil,
						nil,
						nil,
						nil,
						nil,
						nil,
						nil,
						nil,
						nil,
						nil,
						nil,
						nil,
						"F1",
						"F2",
						"F3",
						"F4",
						"F5",
						"F6",
						"F7",
						"F8",
						"F9",
						"F10",
						"F11",
						"F12",
						[0] = nil
					}
				end

				slot_152_5_0:AddText(draw.Vec2(slot_152_24_1 + 4, slot_152_25_1), slot_152_21_0, draw.Color(200, 200, 205, 255))

				slot_152_29_1 = UI.binding_focus == slot_152_22_0
				slot_152_30_1 = UI.key_names[slot_152_28_1] or slot_152_28_1 > 0 and "Key " .. slot_152_28_1 or "None"
				slot_152_31_1 = slot_152_29_1 and "..." or slot_152_30_1
				slot_152_32_0 = slot_0_51_0(slot_152_5_0.font, slot_152_31_1)
				slot_152_33_1 = 65
				slot_152_34_1 = 16
				slot_152_35_1 = arg_152_1 + slot_152_7_0 - 10 - slot_152_33_1
				slot_152_36_1 = slot_152_25_1
				slot_152_37_1 = slot_152_35_1 <= slot_0_59_0.Mouse.x and slot_0_59_0.Mouse.x <= slot_152_35_1 + slot_152_33_1 and slot_152_36_1 <= slot_0_59_0.Mouse.y and slot_0_59_0.Mouse.y <= slot_152_36_1 + slot_152_34_1

				if slot_152_37_1 and arg_152_4 and not UI.popup_click_state_prev and not slot_152_29_1 then
					UI.binding_focus = slot_152_22_0
					slot_0_59_0.clicked = false
				elseif slot_152_29_1 then
					for iter_152_4 = 2, 255 do
						if get_key_state(iter_152_4) then
							if iter_152_4 == 27 then
								UI.binding_focus = nil

								break
							end

							UI.cfg[slot_152_22_0] = iter_152_4
							UI.binding_focus = nil

							break
						end
					end

					if arg_152_4 and not slot_152_37_1 and not UI.popup_click_state_prev then
						UI.binding_focus = nil
					end
				end

				slot_152_38_2 = slot_152_29_1 and slot_0_41_0(slot_152_6_0.accent, 40) or draw.Color(255, 255, 255, 10)

				if not slot_152_29_1 or not slot_0_41_0(slot_152_6_0.accent, 200) then
					slot_152_39_0 = draw.Color(255, 255, 255, 15)
				end

				if slot_152_29_1 then
					slot_0_44_0(slot_152_35_1, slot_152_36_1, slot_152_33_1, slot_152_34_1, slot_152_6_0.accent, 25, 4)
				end

				slot_152_5_0:AddRectFilledRounded(draw.Rect(slot_152_35_1, slot_152_36_1, slot_152_35_1 + slot_152_33_1, slot_152_36_1 + slot_152_34_1), slot_152_38_2, 4)

				slot_152_40_0 = slot_152_29_1 and slot_0_41_0(slot_152_6_0.text) or slot_0_41_0(slot_152_6_0.text_dim)

				slot_152_5_0:AddText(draw.Vec2(slot_152_35_1 + (slot_152_33_1 - slot_152_32_0.x) / 2, slot_152_36_1 + (slot_152_34_1 - slot_152_32_0.y) / 2), slot_152_31_1, slot_152_40_0)

				slot_152_41_0 = slot_152_22_0 .. "_mode"
				slot_152_42_0 = UI.cfg[slot_152_41_0] or "Hold"
				slot_152_43_0 = {
					"Hold",
					"Toggle",
					[0] = nil
				}
				slot_152_44_0 = "Mode"
				slot_152_45_0 = slot_152_24_1 + 4
				slot_152_46_0 = slot_152_25_1 + 20

				slot_152_5_0:AddText(draw.Vec2(slot_152_45_0, slot_152_46_0), slot_152_44_0, draw.Color(160, 160, 165, 255))

				slot_152_47_0 = 65
				slot_152_48_0 = 16
				slot_152_49_0 = arg_152_1 + slot_152_7_0 - 10 - slot_152_47_0
				slot_152_50_0 = slot_152_46_0

				if slot_152_49_0 <= slot_0_59_0.Mouse.x and slot_0_59_0.Mouse.x <= slot_152_49_0 + slot_152_47_0 and slot_152_50_0 <= slot_0_59_0.Mouse.y and slot_0_59_0.Mouse.y <= slot_152_50_0 + slot_152_48_0 and arg_152_4 and not UI.popup_click_state_prev then
					UI.active_combo_data = {
						id = slot_152_41_0,
						x = slot_152_49_0,
						y = slot_152_50_0 + slot_152_48_0,
						w = slot_152_47_0,
						options = slot_152_43_0,
						var = slot_152_41_0,
						open_time = game.globalVars.m_flRealTime
					}
					slot_0_59_0.clicked = false
				end

				slot_152_5_0:AddRectFilled(draw.Rect(slot_152_49_0, slot_152_50_0, slot_152_49_0 + slot_152_47_0, slot_152_50_0 + slot_152_48_0), draw.Color(255, 255, 255, 10))

				slot_152_52_0 = tostring(slot_152_42_0)
				slot_152_53_0 = slot_0_51_0(slot_152_5_0.font, slot_152_52_0)

				slot_152_5_0:AddText(draw.Vec2(slot_152_49_0 + (slot_152_47_0 - slot_152_53_0.x) / 2, slot_152_50_0 + (slot_152_48_0 - slot_152_53_0.y) / 2), slot_152_52_0, slot_0_41_0(slot_152_6_0.text_dim))
			else
				slot_152_27_1 = 24
				slot_152_28_0 = false

				if slot_152_22_0 then
					slot_152_28_0 = UI.cfg[slot_152_22_0]
				end

				slot_152_29_0 = false

				if arg_152_1 <= slot_0_59_0.Mouse.x and slot_0_59_0.Mouse.x <= arg_152_1 + slot_152_7_0 and slot_152_25_1 <= slot_0_59_0.Mouse.y and slot_0_59_0.Mouse.y <= slot_152_25_1 + slot_152_27_1 then
					slot_152_29_0 = true

					if arg_152_4 and not UI.popup_click_state_prev then
						UI.cfg[slot_152_22_0] = not UI.cfg[slot_152_22_0]
						slot_0_59_0.clicked = false
					end
				end

				slot_152_30_0 = slot_0_43_0("pop_chk_" .. (slot_152_22_0 or "unk"), slot_152_28_0 and 1 or 0, 12)
				slot_152_31_0 = 12
				slot_152_33_0 = slot_152_24_1 + 4
				slot_152_34_0 = slot_152_25_1 + 6
				slot_152_35_0 = draw.Color(255, 255, 255, 35)
				slot_152_36_0 = slot_0_41_0(slot_152_6_0.accent, 255)
				slot_152_37_0 = slot_0_42_0(slot_152_35_0, slot_152_36_0, slot_152_30_0)

				if slot_152_30_0 > 0.01 then
					slot_0_44_0(slot_152_33_0 - 2, slot_152_34_0 - 2, slot_152_31_0 + 4, slot_152_31_0 + 4, slot_152_6_0.accent, 15 * slot_152_30_0, 2)
				end

				slot_152_5_0:AddRectFilledRounded(draw.Rect(slot_152_33_0, slot_152_34_0, slot_152_33_0 + slot_152_31_0, slot_152_34_0 + slot_152_31_0), slot_152_37_0, 4)
				slot_152_5_0:AddRectFilledRounded(draw.Rect(slot_152_33_0 + 1, slot_152_34_0 + 1, slot_152_33_0 + slot_152_31_0 - 1, slot_152_34_0 + slot_152_31_0 - 1), slot_0_41_0(slot_152_6_0.bg_alt, 255), 3)

				if slot_152_30_0 > 0.01 then
					slot_152_38_1 = slot_0_41_0(slot_152_6_0.accent, math.floor(255 * slot_152_30_0))

					slot_152_5_0:AddRectFilledRounded(draw.Rect(slot_152_33_0 + 1, slot_152_34_0 + 1, slot_152_33_0 + slot_152_31_0 - 1, slot_152_34_0 + slot_152_31_0 - 1), slot_152_38_1, 3)
				end

				slot_152_38_0 = (slot_152_29_0 or slot_152_28_0) and slot_0_41_0(slot_152_6_0.text) or slot_0_41_0(slot_152_6_0.text_dim)

				slot_152_5_0:AddText(draw.Vec2(slot_152_33_0 + slot_152_31_0 + 12, slot_152_25_1 + 7), slot_152_21_0 or "", slot_152_38_0)
			end

			slot_152_13_0 = slot_152_13_0 + slot_152_27_1
		end
	end

	if slot_0_59_0.Mouse and arg_152_1 <= slot_0_59_0.Mouse.x and slot_0_59_0.Mouse.x <= arg_152_1 + slot_152_7_0 and arg_152_2 <= slot_0_59_0.Mouse.y and slot_0_59_0.Mouse.y <= arg_152_2 + slot_152_10_0 and slot_0_59_0.clicked then
		slot_0_59_0.clicked = false
	end

	if UI.active_combo_data then
		slot_152_14_1 = UI.active_combo_data
		slot_152_15_1 = 24
		slot_152_16_1 = #slot_152_14_1.options * slot_152_15_1
		slot_152_17_0 = 240

		slot_152_5_0:AddRectFilled(draw.Rect(slot_152_14_1.x, slot_152_14_1.y, slot_152_14_1.x + slot_152_14_1.w, slot_152_14_1.y + slot_152_16_1), slot_0_41_0(slot_152_6_0.bg_alt, 250))

		slot_152_18_0 = slot_152_14_1.y
		slot_152_19_0 = -1

		if slot_0_59_0.Mouse.x >= slot_152_14_1.x and slot_0_59_0.Mouse.x <= slot_152_14_1.x + slot_152_14_1.w and slot_0_59_0.Mouse.y >= slot_152_14_1.y and slot_0_59_0.Mouse.y <= slot_152_14_1.y + slot_152_16_1 then
			slot_152_19_0 = math.floor((slot_0_59_0.Mouse.y - slot_152_14_1.y) / slot_152_15_1) + 1
		end

		for iter_152_5, iter_152_6 in ipairs(slot_152_14_1.options) do
			slot_152_25_0 = iter_152_5 == slot_152_19_0
			slot_152_26_0 = iter_152_6 == UI.cfg[slot_152_14_1.var]

			if slot_152_26_0 then
				slot_152_5_0:AddRectFilled(draw.Rect(slot_152_14_1.x + 1, slot_152_18_0, slot_152_14_1.x + slot_152_14_1.w - 1, slot_152_18_0 + slot_152_15_1), slot_0_41_0(slot_152_6_0.accent, 30))
			elseif slot_152_25_0 then
				slot_152_5_0:AddRectFilled(draw.Rect(slot_152_14_1.x + 1, slot_152_18_0, slot_152_14_1.x + slot_152_14_1.w - 1, slot_152_18_0 + slot_152_15_1), draw.Color(255, 255, 255, 10))
			end

			slot_152_27_0 = (slot_152_26_0 or slot_152_25_0) and slot_0_41_0(slot_152_6_0.text) or slot_0_41_0(slot_152_6_0.text_dim)

			slot_152_5_0:AddText(draw.Vec2(slot_152_14_1.x + 6, slot_152_18_0 + 6), tostring(iter_152_6), slot_152_27_0)

			if slot_152_25_0 and arg_152_4 and not UI.popup_click_state_prev then
				UI.cfg[slot_152_14_1.var] = iter_152_6
				UI.active_combo_data = nil
				slot_0_59_0.clicked = false
			end

			slot_152_18_0 = slot_152_18_0 + slot_152_15_1
		end

		if arg_152_4 and not UI.popup_click_state_prev and slot_152_19_0 == -1 and not (slot_0_59_0.Mouse.x >= slot_152_14_1.x and slot_0_59_0.Mouse.x <= slot_152_14_1.x + slot_152_14_1.w and slot_0_59_0.Mouse.y >= slot_152_14_1.y - 20 and slot_0_59_0.Mouse.y <= slot_152_14_1.y) then
			UI.active_combo_data = nil
			slot_0_59_0.clicked = false
		end
	end

	UI.popup_click_state_prev = arg_152_4
	slot_152_14_0 = game.globalVars.m_flRealTime
	slot_152_15_0 = UI.active_settings_data and UI.active_settings_data.spawn_time or 0
	slot_152_16_0 = false

	if arg_152_4 and not UI.popup_click_state then
		slot_152_16_0 = true
	end

	UI.popup_click_state = arg_152_4

	if slot_152_16_0 and slot_152_14_0 - slot_152_15_0 > 0.1 and (not (arg_152_1 <= slot_0_59_0.Mouse.x) or not (slot_0_59_0.Mouse.x <= arg_152_1 + slot_152_7_0) or not (arg_152_2 <= slot_0_59_0.Mouse.y) or not (slot_0_59_0.Mouse.y <= arg_152_2 + slot_152_10_0)) then
		return true
	end

	return false
end

slot_0_77_0 = {
	stars = {},
	shooters = {}
}
slot_0_78_0 = 200
slot_0_79_0 = false

function slot_0_80_0()
	slot_0_77_0 = {
		stars = {},
		shooters = {}
	}

	local var_153_0, var_153_1 = game.engine:GetScreenSize()

	for iter_153_0 = 1, slot_0_78_0 do
		table.insert(slot_0_77_0.stars, {
			[0] = nil,
			x = math.random(0, var_153_0),
			y = math.random(0, var_153_1),
			size = math.random(10, 25) / 10,
			flicker_speed = math.random(5, 15) / 10,
			flicker_offset = math.random(0, 100) / 10
		})
	end

	slot_0_79_0 = true
end

function slot_0_81_0()
	local var_154_0, var_154_1 = game.engine:GetScreenSize()
	local var_154_2 = math.random(0, 1) == 0 and 1 or -1
	local var_154_3 = var_154_2 == 1 and -50 or var_154_0 + 50
	local var_154_4 = math.random(0, var_154_1 * 0.6)

	table.insert(slot_0_77_0.shooters, {
		life = 1,
		[0] = nil,
		x = var_154_3,
		y = var_154_4,
		vx = var_154_2 * math.random(400, 800),
		vy = math.random(100, 300),
		trail = {}
	})
end

function slot_0_82_0(arg_155_0, arg_155_1)
	if not UI.cfg.gui_particles then
		return
	end

	if not slot_0_79_0 then
		slot_0_80_0()
	end

	local var_155_0, var_155_1 = game.engine:GetScreenSize()

	for iter_155_0, iter_155_1 in ipairs(slot_0_77_0.stars) do
		iter_155_1.x = (iter_155_1.x + arg_155_0 * 5) % var_155_0
	end

	if #slot_0_77_0.shooters < 3 and math.random() < arg_155_0 * 0.5 then
		slot_0_81_0()
	end

	for iter_155_2 = #slot_0_77_0.shooters, 1, -1 do
		local var_155_2 = slot_0_77_0.shooters[iter_155_2]

		table.insert(var_155_2.trail, 1, {
			[0] = nil,
			x = var_155_2.x,
			y = var_155_2.y
		})

		if #var_155_2.trail > 15 then
			table.remove(var_155_2.trail)
		end

		var_155_2.x = var_155_2.x + var_155_2.vx * arg_155_0
		var_155_2.y = var_155_2.y + var_155_2.vy * arg_155_0
		var_155_2.life = var_155_2.life - arg_155_0 * 0.8

		if var_155_2.life <= 0 or var_155_2.x < -100 or var_155_2.x > var_155_0 + 100 or var_155_2.y > var_155_1 + 100 then
			table.remove(slot_0_77_0.shooters, iter_155_2)
		end
	end
end

function slot_0_83_0()
	if not UI.cfg.gui_particles then
		return
	end

	if not slot_0_79_0 then
		return
	end

	local var_156_0 = draw.surface
	local var_156_1 = UI.theme
	local var_156_2 = game.globalVars.m_flRealTime

	for iter_156_0, iter_156_1 in ipairs(slot_0_77_0.stars) do
		local var_156_3 = math.floor(30 + 40 * math.sin(var_156_2 * iter_156_1.flicker_speed + iter_156_1.flicker_offset))
		local var_156_4 = slot_0_41_0(var_156_1.text, var_156_3)

		var_156_0:AddCircleFilled(draw.Vec2(iter_156_1.x, iter_156_1.y), iter_156_1.size, var_156_4)
	end

	for iter_156_2, iter_156_3 in ipairs(slot_0_77_0.shooters) do
		local var_156_5 = math.floor(255 * iter_156_3.life)

		if var_156_5 > 5 then
			for iter_156_4 = 1, #iter_156_3.trail - 1 do
				local var_156_6 = iter_156_3.trail[iter_156_4]
				local var_156_7 = iter_156_3.trail[iter_156_4 + 1]
				local var_156_8 = math.floor(var_156_5 * (1 - iter_156_4 / #iter_156_3.trail))

				if var_156_8 > 5 then
					var_156_0:AddLine(draw.Vec2(var_156_6.x, var_156_6.y), draw.Vec2(var_156_7.x, var_156_7.y), slot_0_41_0(var_156_1.accent, var_156_8), 1.5)
				end
			end

			var_156_0:AddCircleFilled(draw.Vec2(iter_156_3.x, iter_156_3.y), 2.5, slot_0_41_0(var_156_1.text, var_156_5))
			var_156_0:AddCircleFilled(draw.Vec2(iter_156_3.x, iter_156_3.y), 4, slot_0_41_0(var_156_1.accent, math.floor(var_156_5 * 0.4)))
		end
	end
end

function slot_0_84_0(arg_157_0, arg_157_1, arg_157_2)
	if not UI.search or not UI.search.active or #UI.search.query == 0 then
		return
	end

	if #UI.search.results == 0 then
		return
	end

	slot_157_3_0 = draw.surface
	slot_157_4_0 = UI.theme
	slot_157_5_0 = 32
	slot_157_6_0 = math.min(6, #UI.search.results) * slot_157_5_0 + 10
	slot_157_7_0 = arg_157_1 + 5

	slot_0_44_0(arg_157_0, slot_157_7_0, arg_157_2, slot_157_6_0, slot_157_4_0.accent, 25, 8)
	slot_157_3_0:AddRectFilledRounded(draw.Rect(arg_157_0, slot_157_7_0, arg_157_0 + arg_157_2, slot_157_7_0 + slot_157_6_0), slot_0_41_0(slot_157_4_0.bg_alt, 250), 6)
	slot_157_3_0:AddRectRounded(draw.Rect(arg_157_0, slot_157_7_0, arg_157_0 + arg_157_2, slot_157_7_0 + slot_157_6_0), slot_0_41_0(slot_157_4_0.control_border, 100), 6, 1)

	slot_157_8_0 = slot_157_7_0 + 5

	for iter_157_0, iter_157_1 in ipairs(UI.search.results) do
		if iter_157_0 > 6 then
			break
		end

		slot_157_14_0 = false

		if slot_0_59_0.Mouse and arg_157_0 <= slot_0_59_0.Mouse.x and slot_0_59_0.Mouse.x <= arg_157_0 + arg_157_2 and slot_157_8_0 <= slot_0_59_0.Mouse.y and slot_0_59_0.Mouse.y <= slot_157_8_0 + slot_157_5_0 then
			slot_157_14_0 = true
			UI.search.hover_idx = iter_157_0

			if slot_0_59_0.clicked then
				UI.active_tab = iter_157_1.tab

				if iter_157_1.tab == "Config" then
					slot_0_6_0.refresh_presets()

					if slot_0_37_0 and slot_0_37_0.fetchConfigs then
						slot_0_37_0.fetchConfigs(true)
					end
				end

				if iter_157_1.group then
					UI.collapsed_groups[iter_157_1.group] = false
				end

				UI.search.results = {}
				UI.search.query = ""
				UI.search.active = false

				notify("Jumped to " .. iter_157_1.label .. " in " .. (iter_157_1.group or iter_157_1.tab) .. "!", "success")
			end
		end

		if slot_157_14_0 or UI.search.hover_idx == iter_157_0 then
			slot_157_3_0:AddRectFilled(draw.Rect(arg_157_0 + 5, slot_157_8_0, arg_157_0 + arg_157_2 - 5, slot_157_8_0 + slot_157_5_0), slot_0_41_0(slot_157_4_0.accent, 30))
			slot_157_3_0:AddRectFilled(draw.Rect(arg_157_0 + 5, slot_157_8_0, arg_157_0 + 7, slot_157_8_0 + slot_157_5_0), slot_0_41_0(slot_157_4_0.accent))
		end

		slot_157_3_0:AddText(draw.Vec2(arg_157_0 + 15, slot_157_8_0 + 8), iter_157_1.label, slot_0_41_0(slot_157_4_0.text))

		slot_157_15_0 = iter_157_1.tab .. " -> " .. iter_157_1.group
		slot_157_16_0 = slot_0_51_0(UI.font, slot_157_15_0)

		slot_157_3_0:AddText(draw.Vec2(arg_157_0 + arg_157_2 - slot_157_16_0.x - 15, slot_157_8_0 + 8), slot_157_15_0, slot_0_41_0(slot_157_4_0.text_dim, 150))

		slot_157_8_0 = slot_157_8_0 + slot_157_5_0
	end
end

function slot_0_85_0(arg_158_0, arg_158_1, arg_158_2)
	slot_158_3_0 = draw.surface
	slot_158_4_0 = UI.theme
	slot_158_5_0 = 32
	slot_158_6_0 = UI.search.active and slot_0_41_0(slot_158_4_0.accent, 120) or slot_0_41_0(slot_158_4_0.control_border)

	slot_158_3_0:AddRectFilledRounded(draw.Rect(arg_158_0, arg_158_1, arg_158_0 + arg_158_2, arg_158_1 + slot_158_5_0), slot_158_6_0, 6)
	slot_158_3_0:AddRectFilledRounded(draw.Rect(arg_158_0 + 1, arg_158_1 + 1, arg_158_0 + arg_158_2 - 1, arg_158_1 + slot_158_5_0 - 1), slot_0_41_0(slot_158_4_0.bg, 255), 6)

	slot_158_7_0 = arg_158_0 + 10
	slot_158_8_0 = arg_158_1 + slot_158_5_0 / 2
	slot_158_9_0 = 12

	slot_158_3_0:AddCircle(draw.Vec2(slot_158_7_0 + 4, slot_158_8_0 - 2), 4, slot_0_41_0(slot_158_4_0.text_dim, 200))
	slot_158_3_0:AddLine(draw.Vec2(slot_158_7_0 + 7, slot_158_8_0 + 1), draw.Vec2(slot_158_7_0 + 10, slot_158_8_0 + 4), slot_0_41_0(slot_158_4_0.text_dim, 200))

	slot_158_10_0 = arg_158_0 + 30
	slot_158_11_0 = UI.search.query

	if slot_158_11_0 == "" and not UI.search.active then
		slot_158_11_0 = "Search settings..."

		slot_158_3_0:AddText(draw.Vec2(slot_158_10_0, arg_158_1 + slot_158_5_0 / 2 - 6), slot_158_11_0, slot_0_41_0(slot_158_4_0.text_dim, 150))
	else
		slot_158_3_0:AddText(draw.Vec2(slot_158_10_0, arg_158_1 + slot_158_5_0 / 2 - 6), slot_158_11_0, slot_0_41_0(slot_158_4_0.text))

		if UI.search.active then
			UI.search.cursor_blink = (UI.search.cursor_blink or 0) + game.globalVars.m_flAbsFrameTime

			if math.floor(UI.search.cursor_blink * 2) % 2 == 0 then
				slot_158_12_1 = slot_158_10_0 + (slot_0_51_0(UI.font, slot_158_11_0).x or 0)

				slot_158_3_0:AddLine(draw.Vec2(slot_158_12_1 + 2, arg_158_1 + 8), draw.Vec2(slot_158_12_1 + 2, arg_158_1 + slot_158_5_0 - 8), slot_0_41_0(slot_158_4_0.accent))
			end
		end
	end

	if slot_0_59_0.Mouse and arg_158_0 <= slot_0_59_0.Mouse.x and slot_0_59_0.Mouse.x <= arg_158_0 + arg_158_2 and arg_158_1 <= slot_0_59_0.Mouse.y and slot_0_59_0.Mouse.y <= arg_158_1 + slot_158_5_0 and slot_0_59_0.clicked then
		UI.search.active = true
	end

	if UI.search.active then
		slot_158_12_0 = UI.search.query

		for iter_158_0, iter_158_1 in ipairs(slot_0_59_0.char_buffer) do
			if iter_158_1 == "BACKSPACE" then
				if #UI.search.query > 0 then
					UI.search.query = string.sub(UI.search.query, 1, -2)
				end
			elseif iter_158_1 == "ENTER" then
				UI.search.active = false
			elseif type(iter_158_1) == "string" and #iter_158_1 == 1 then
				slot_158_18_1 = string.byte(iter_158_1)

				if slot_158_18_1 >= 32 and slot_158_18_1 <= 126 and #UI.search.query < 32 then
					UI.search.query = UI.search.query .. iter_158_1
				end
			end
		end

		if UI.search.query ~= slot_158_12_0 then
			UI.search.results = {}

			if #UI.search.query > 0 then
				slot_158_13_0 = string.lower(UI.search.query)

				for iter_158_2, iter_158_3 in ipairs(UI.search_registry) do
					if string.find(string.lower(iter_158_3.label), slot_158_13_0, 1, true) then
						table.insert(UI.search.results, iter_158_3)
					end
				end
			end

			UI.search.hover_idx = 0
		end
	end

	UI.search.last_pos = {
		[0] = nil,
		x = arg_158_0,
		y = arg_158_1,
		w = arg_158_2,
		h = slot_158_5_0
	}

	return slot_158_5_0 + 10
end

function slot_0_86_0(arg_159_0, arg_159_1, arg_159_2, arg_159_3, arg_159_4, arg_159_5, arg_159_6, arg_159_7, arg_159_8)
	if arg_159_8 ~= nil then
		if type(arg_159_8) == "function" then
			if not arg_159_8() then
				return 0
			end
		elseif not arg_159_8 then
			return 0
		end
	end

	slot_159_9_0 = draw.surface
	slot_159_10_0 = UI.theme
	slot_159_11_0 = 28
	slot_159_12_0 = false
	slot_159_13_0 = arg_159_3

	if not UI.input_focused then
		UI.input_focused = {}
	end

	slot_159_14_0 = not slot_159_12_0 and (UI.input_focused[arg_159_5] or false)
	slot_159_15_0 = slot_159_12_0 and draw.Color(25, 25, 30, 100) or slot_159_14_0 and slot_0_41_0(slot_159_10_0.control_bg, 255) or slot_0_41_0(slot_159_10_0.control_bg, 200)

	slot_159_9_0:AddRectFilledRounded(draw.Rect(arg_159_0, arg_159_1, arg_159_0 + arg_159_2, arg_159_1 + slot_159_11_0), slot_159_15_0, 4)

	if slot_159_14_0 then
		slot_159_9_0:AddRectRounded(draw.Rect(arg_159_0, arg_159_1, arg_159_0 + arg_159_2, arg_159_1 + slot_159_11_0), slot_0_41_0(slot_159_10_0.accent, 150), 4, 1)

		if (math.sin(game.globalVars.m_flRealTime * 8) + 1) * 0.5 > 0.2 then
			slot_159_17_1 = UI.cfg[arg_159_4] or ""
			slot_159_18_0 = slot_0_51_0(UI.font, slot_159_17_1).x or 0
			slot_159_19_0 = arg_159_0 + 8 + slot_159_18_0

			slot_159_9_0:AddLine(draw.Vec2(slot_159_19_0, arg_159_1 + 6), draw.Vec2(slot_159_19_0, arg_159_1 + slot_159_11_0 - 6), slot_0_41_0(slot_159_10_0.accent))
		end

		for iter_159_0, iter_159_1 in ipairs(slot_0_59_0.char_buffer) do
			if iter_159_1 == "BACKSPACE" then
				if UI.cfg[arg_159_4] and #UI.cfg[arg_159_4] > 0 then
					UI.cfg[arg_159_4] = string.sub(UI.cfg[arg_159_4], 1, -2)
				end
			elseif iter_159_1 == "ENTER" then
				UI.input_focused[arg_159_5] = false
			elseif type(iter_159_1) == "string" and #iter_159_1 == 1 then
				slot_159_22_1 = string.byte(iter_159_1)

				if slot_159_22_1 >= 32 and slot_159_22_1 <= 126 and #(UI.cfg[arg_159_4] or "") < 32 then
					UI.cfg[arg_159_4] = (UI.cfg[arg_159_4] or "") .. iter_159_1
				end
			end
		end
	end

	slot_159_16_0 = UI.cfg[arg_159_4] or ""
	slot_159_17_0 = slot_159_12_0 and draw.Color(100, 100, 110, 255) or slot_0_41_0(slot_159_10_0.text)

	if slot_159_16_0 == "" and not slot_159_14_0 then
		slot_159_9_0:AddText(draw.Vec2(arg_159_0 + 8, arg_159_1 + slot_159_11_0 / 2 - 6), slot_159_13_0, slot_0_41_0(slot_159_10_0.text_dim, 150))
	else
		slot_159_9_0:AddText(draw.Vec2(arg_159_0 + 8, arg_159_1 + slot_159_11_0 / 2 - 6), slot_159_16_0, slot_159_17_0)
	end

	if not slot_159_12_0 and slot_0_59_0.Mouse then
		if arg_159_0 <= slot_0_59_0.Mouse.x and slot_0_59_0.Mouse.x <= arg_159_0 + arg_159_2 and arg_159_1 <= slot_0_59_0.Mouse.y and slot_0_59_0.Mouse.y <= arg_159_1 + slot_159_11_0 then
			if slot_0_59_0.clicked then
				for iter_159_2, iter_159_3 in pairs(UI.input_focused) do
					UI.input_focused[iter_159_2] = false
				end

				UI.input_focused[arg_159_5] = true
			end
		elseif slot_0_59_0.clicked then
			UI.input_focused[arg_159_5] = false
		end
	end

	slot_0_59_0.y = slot_0_59_0.y + slot_159_11_0 + 6

	return slot_159_11_0 + 6
end

function slot_0_87_0(arg_160_0, arg_160_1, arg_160_2, arg_160_3, arg_160_4, arg_160_5, arg_160_6, arg_160_7, arg_160_8, arg_160_9, arg_160_10, arg_160_11)
	if arg_160_11 ~= nil then
		if type(arg_160_11) == "function" then
			if not arg_160_11() then
				return 0
			end
		elseif not arg_160_11 then
			return 0
		end
	end

	local var_160_0 = draw.surface
	local var_160_1 = UI.theme
	local var_160_2 = false
	local var_160_3 = arg_160_0
	local var_160_4 = false

	if slot_0_59_0.Mouse and arg_160_1 <= slot_0_59_0.Mouse.x and slot_0_59_0.Mouse.x <= arg_160_1 + arg_160_3 and arg_160_2 <= slot_0_59_0.Mouse.y and slot_0_59_0.Mouse.y <= arg_160_2 + arg_160_4 then
		var_160_4 = true
	end

	local var_160_5 = var_160_2 and draw.Color(30, 30, 35, 100) or slot_0_41_0(var_160_1.control_bg, 180)

	var_160_0:AddRectFilledRounded(draw.Rect(arg_160_1, arg_160_2, arg_160_1 + arg_160_3, arg_160_2 + arg_160_4), var_160_5, 4)

	if not var_160_2 and var_160_4 then
		var_160_0:AddRectFilledRounded(draw.Rect(arg_160_1, arg_160_2, arg_160_1 + arg_160_3, arg_160_2 + arg_160_4), slot_0_41_0(var_160_1.accent, 15), 4)

		if arg_160_9 and type(arg_160_9) == "string" and arg_160_9 ~= "" then
			slot_0_59_0.hovered_tooltip = arg_160_9
		end

		if not UI.active_combo_data and slot_0_59_0.clicked and arg_160_5 then
			arg_160_5()

			slot_0_59_0.clicked = false
		end
	end

	local var_160_6 = slot_0_51_0(UI.font, var_160_3)
	local var_160_7 = var_160_2 and draw.Color(100, 100, 110, 255) or slot_0_41_0(var_160_1.text)
	local var_160_8 = arg_160_6 and slot_0_53_0[arg_160_6]

	if arg_160_6 and var_160_8 then
		local var_160_9 = 14
		local var_160_10 = 6
		local var_160_11 = arg_160_1 + (arg_160_3 - (var_160_9 + var_160_10 + var_160_6.x)) / 2
		local var_160_12 = arg_160_2 + (arg_160_4 - var_160_6.y) / 2
		local var_160_13 = var_160_2 and draw.Color(80, 80, 85, 150) or slot_0_41_0(var_160_1.accent, 150)

		draw_icon_proc(arg_160_6, var_160_11, arg_160_2, var_160_9, var_160_13)

		local var_160_14 = var_160_11 + var_160_9 + var_160_10

		var_160_0:AddText(draw.Vec2(var_160_14, var_160_12), var_160_3, var_160_7)
	else
		local var_160_15 = arg_160_1 + (arg_160_3 - var_160_6.x) / 2
		local var_160_16 = arg_160_2 + (arg_160_4 - var_160_6.y) / 2

		var_160_0:AddText(draw.Vec2(var_160_15, var_160_16), var_160_3, var_160_7)
	end

	if not arg_160_10 then
		slot_0_59_0.y = slot_0_59_0.y + arg_160_4 + 6
	end

	return arg_160_4 + 6
end

function slot_0_88_0(arg_161_0, arg_161_1, arg_161_2, arg_161_3, arg_161_4, arg_161_5, arg_161_6)
	local var_161_0 = draw.surface
	local var_161_1 = UI.theme

	if var_161_0.add_background_blur then
		var_161_0:AddBackgroundBlur(draw.Rect(arg_161_0, arg_161_1, arg_161_0 + arg_161_2, arg_161_1 + arg_161_3), 2)
	end

	slot_0_44_0(arg_161_0, arg_161_1, arg_161_2, arg_161_3, var_161_1.accent, 15, 6)
	var_161_0:AddRectFilledRounded(draw.Rect(arg_161_0, arg_161_1, arg_161_0 + arg_161_2, arg_161_1 + arg_161_3), slot_0_41_0(var_161_1.control_bg, 200), 4)

	local var_161_2 = 24
	local var_161_3 = arg_161_1 + 2

	if arg_161_4 then
		for iter_161_0, iter_161_1 in ipairs(arg_161_4) do
			if var_161_3 + var_161_2 > arg_161_1 + arg_161_3 then
				break
			end

			local var_161_4 = iter_161_0 == arg_161_5
			local var_161_5 = false

			if slot_0_59_0.Mouse and arg_161_0 <= slot_0_59_0.Mouse.x and slot_0_59_0.Mouse.x <= arg_161_0 + arg_161_2 and var_161_3 <= slot_0_59_0.Mouse.y and slot_0_59_0.Mouse.y <= var_161_3 + var_161_2 then
				var_161_5 = true

				if slot_0_59_0.clicked and arg_161_6 then
					arg_161_6(iter_161_0)
				end
			end

			if var_161_4 then
				var_161_0:AddRectFilled(draw.Rect(arg_161_0 + 2, var_161_3, arg_161_0 + arg_161_2 - 2, var_161_3 + var_161_2), slot_0_41_0(var_161_1.accent, 50))
			elseif var_161_5 then
				var_161_0:AddRectFilled(draw.Rect(arg_161_0 + 2, var_161_3, arg_161_0 + arg_161_2 - 2, var_161_3 + var_161_2), draw.Color(255, 255, 255, 10))
			end

			local var_161_6 = slot_0_41_0(var_161_4 and var_161_1.accent or var_161_1.text)

			var_161_0:AddText(draw.Vec2(arg_161_0 + 8, var_161_3 + 4), iter_161_1, var_161_6)

			var_161_3 = var_161_3 + var_161_2
		end
	end

	var_161_0:AddRectRounded(draw.Rect(arg_161_0, arg_161_1, arg_161_0 + arg_161_2, arg_161_1 + arg_161_3), draw.Color(255, 255, 255, 15), 4, 1)

	return arg_161_3 + 10
end

function slot_0_89_0(arg_162_0, arg_162_1, arg_162_2)
	if not arg_162_0 or arg_162_0 == "" then
		UI.tooltip_anim = math.max(0, UI.tooltip_anim - 8 * game.globalVars.m_flAbsFrameTime)

		return
	end

	UI.tooltip_anim = math.min(1, UI.tooltip_anim + 10 * game.globalVars.m_flAbsFrameTime)
	slot_162_3_0 = 1 - math.pow(1 - UI.tooltip_anim, 3)
	slot_162_4_0 = draw.surface
	slot_162_5_0 = UI.theme
	slot_162_6_0 = 10
	slot_162_7_0 = 210
	slot_162_8_0 = draw.fonts.gui_main or draw.fonts.gui_semi_bold or draw.fonts.gui_bold or draw.fonts.default
	slot_162_9_0 = {}
	slot_162_10_0 = ""

	for iter_162_0 in arg_162_0:gmatch("%S+") do
		slot_162_15_1 = slot_162_10_0 == "" and iter_162_0 or slot_162_10_0 .. " " .. iter_162_0

		if slot_0_51_0(slot_162_8_0, slot_162_15_1).x > slot_162_7_0 - 28 then
			table.insert(slot_162_9_0, slot_162_10_0)

			slot_162_10_0 = iter_162_0
		else
			slot_162_10_0 = slot_162_15_1
		end
	end

	table.insert(slot_162_9_0, slot_162_10_0)

	slot_162_11_0 = 0
	slot_162_12_0 = 0

	for iter_162_1, iter_162_2 in ipairs(slot_162_9_0) do
		slot_162_18_1 = slot_0_51_0(slot_162_8_0, iter_162_2)
		slot_162_11_0 = slot_162_11_0 + slot_162_18_1.y + 2
		slot_162_12_0 = math.max(slot_162_12_0, slot_162_18_1.x)
	end

	slot_162_13_0 = slot_162_12_0 + 30
	slot_162_14_0 = slot_162_11_0 + slot_162_6_0 * 2 - 2
	slot_162_15_0 = arg_162_1 + 18
	slot_162_16_0 = arg_162_2 + 18
	slot_162_17_0, slot_162_18_0 = game.engine:GetScreenSize()

	if slot_162_17_0 < slot_162_15_0 + slot_162_13_0 then
		slot_162_15_0 = arg_162_1 - slot_162_13_0 - 10
	end

	if slot_162_18_0 < slot_162_16_0 + slot_162_14_0 then
		slot_162_16_0 = arg_162_2 - slot_162_14_0 - 10
	end

	slot_162_19_0 = slot_162_5_0.glow or {
		255,
		90,
		130,
		100,
		[0] = nil
	}

	slot_0_44_0(slot_162_15_0, slot_162_16_0, slot_162_13_0, slot_162_14_0, slot_162_19_0, 25 * slot_162_3_0, 6)

	slot_162_20_0 = slot_0_41_0(slot_162_5_0.bg, math.floor(250 * slot_162_3_0))
	slot_162_21_0 = slot_0_41_0(slot_162_5_0.accent, math.floor(255 * slot_162_3_0))

	if slot_162_4_0.add_background_blur then
		slot_162_4_0:AddBackgroundBlur(draw.Rect(slot_162_15_0, slot_162_16_0, slot_162_15_0 + slot_162_13_0, slot_162_16_0 + slot_162_14_0), 2)
	end

	slot_162_4_0:AddRectFilledRounded(draw.Rect(slot_162_15_0, slot_162_16_0, slot_162_15_0 + slot_162_13_0, slot_162_16_0 + slot_162_14_0), slot_162_20_0, 6)
	slot_162_4_0:AddRectFilled(draw.Rect(slot_162_15_0, slot_162_16_0 + 2, slot_162_15_0 + 2, slot_162_16_0 + slot_162_14_0 - 2), slot_162_21_0)

	slot_162_22_0 = draw.Color(240, 240, 245, math.floor(255 * slot_162_3_0))
	slot_162_23_0 = slot_162_16_0 + slot_162_6_0

	for iter_162_3, iter_162_4 in ipairs(slot_162_9_0) do
		slot_162_4_0:AddText(draw.Vec2(slot_162_15_0 + 14, slot_162_23_0), iter_162_4, slot_162_22_0)

		slot_162_23_0 = slot_162_23_0 + slot_0_51_0(slot_162_8_0, iter_162_4).y + 2
	end
end

function slot_0_6_0.refresh_presets()
	local var_163_0 = {}
	local var_163_1 = {}

	if utils and utils.FileEnumerate then
		local var_163_2 = {
			"fatality/silentium/*.cfg",
			"fatality/workshop/silentium/*.cfg",
			"fatality/scripts/silentium/*.cfg",
			"silentium/*.cfg",
			[0] = nil
		}

		for iter_163_0, iter_163_1 in ipairs(var_163_2) do
			local var_163_3 = utils.FileEnumerate(iter_163_1)

			if var_163_3 and type(var_163_3) == "table" then
				local var_163_4 = iter_163_1:match("(.-)%*") or ""

				for iter_163_2, iter_163_3 in ipairs(var_163_3) do
					if type(iter_163_3) == "string" then
						local var_163_5 = iter_163_3:gsub("%.cfg$", "")
						local var_163_6 = var_163_5:lower()

						if not var_163_1[var_163_6] then
							table.insert(var_163_0, {
								time = "Local",
								[0] = nil,
								name = var_163_5,
								path = var_163_4 .. iter_163_3
							})

							var_163_1[var_163_6] = true
						end
					end
				end
			end
		end
	end

	if #var_163_0 == 0 then
		table.insert(var_163_0, {
			path = "default.cfg",
			time = "Static",
			name = "default",
			[0] = nil
		})
	end

	UI.preset_manager.presets = var_163_0
end

function slot_0_90_0()
	return game.globalVars.mapName or ""
end

slot_0_91_0 = {
	positions_by_map = {},
	font_color = draw.Color(255, 255, 255, 255),
	font_color_shadow = draw.Color(0, 0, 0, 200),
	animations = {}
}

function slot_0_92_0(arg_165_0, arg_165_1, arg_165_2)
	if not slot_0_91_0.animations[arg_165_0] then
		slot_0_91_0.animations[arg_165_0] = {
			offset = 10,
			val = 0
		}
	end

	local var_165_0 = slot_0_91_0.animations[arg_165_0]
	local var_165_1 = game.globalVars.m_flAbsFrameTime * (arg_165_2 or 10)

	if arg_165_1 > var_165_0.val then
		var_165_0.val = math.min(arg_165_1, var_165_0.val + var_165_1)
	elseif arg_165_1 < var_165_0.val then
		var_165_0.val = math.max(arg_165_1, var_165_0.val - var_165_1)
	end

	if arg_165_1 > 0 then
		var_165_0.offset = math.max(0, var_165_0.offset - var_165_1 * 15)
	else
		var_165_0.offset = math.min(10, var_165_0.offset + var_165_1 * 15)
	end

	return var_165_0.val, var_165_0.offset
end

function slot_0_91_0.save_data()
	if slot_0_91_0 and slot_0_91_0.positions_by_map and type(slot_0_91_0.positions_by_map) == "table" then
		local var_166_0 = utils.JsonEncode(slot_0_91_0.positions_by_map)

		if var_166_0 and type(var_166_0) == "string" then
			UI.cfg.wb_data_json = var_166_0
		end
	end
end

function slot_0_6_0.save_config(arg_167_0)
	if not arg_167_0 then
		return
	end

	arg_167_0 = arg_167_0:gsub("[%c]", "")
	arg_167_0 = arg_167_0:gsub("[\\/:*?\"<>|]", "")

	if arg_167_0 == "" then
		notify("Invalid name", "error")

		return
	end

	local var_167_0 = arg_167_0:gsub("%.cfg$", "") .. ".cfg"

	slot_0_91_0.save_data()

	local var_167_1 = slot_0_6_0.serialize_cfg()
	local var_167_2 = false
	local var_167_3 = {
		slot_0_6_0.SILENTIUM_DIR,
		"fatality/silentium/",
		"silentium/",
		"",
		[0] = nil
	}

	for iter_167_0, iter_167_1 in ipairs(var_167_3) do
		if iter_167_1 ~= "" then
			slot_0_6_0.ensure_dir_internal(iter_167_1)
		end

		if slot_0_6_0.sil_save_file(iter_167_1 .. var_167_0, var_167_1) then
			var_167_2 = true

			break
		end
	end

	if var_167_2 then
		notify("Saved " .. var_167_0, "success")
		slot_0_6_0.refresh_presets()
	else
		notify("Failed to save config", "error")
	end
end

slot_0_93_0 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
slot_0_94_0 = {}

for iter_0_0 = 1, 64 do
	slot_0_94_0[slot_0_93_0:sub(iter_0_0, iter_0_0)] = iter_0_0 - 1
end

function slot_0_6_0.base64_encode(arg_168_0)
	if not arg_168_0 or arg_168_0 == "" then
		return ""
	end

	slot_168_1_0 = {}
	slot_168_2_0 = #arg_168_0 % 3
	slot_168_3_0 = #arg_168_0 - slot_168_2_0

	for iter_168_0 = 1, slot_168_3_0, 3 do
		slot_168_8_0, slot_168_9_0, slot_168_10_0 = arg_168_0:byte(iter_168_0, iter_168_0 + 2)
		slot_168_11_0 = slot_168_8_0 * 65536 + slot_168_9_0 * 256 + slot_168_10_0

		table.insert(slot_168_1_0, slot_0_93_0:sub(math.floor(slot_168_11_0 / 262144) + 1, math.floor(slot_168_11_0 / 262144) + 1))
		table.insert(slot_168_1_0, slot_0_93_0:sub(math.floor(slot_168_11_0 / 4096) % 64 + 1, math.floor(slot_168_11_0 / 4096) % 64 + 1))
		table.insert(slot_168_1_0, slot_0_93_0:sub(math.floor(slot_168_11_0 / 64) % 64 + 1, math.floor(slot_168_11_0 / 64) % 64 + 1))
		table.insert(slot_168_1_0, slot_0_93_0:sub(slot_168_11_0 % 64 + 1, slot_168_11_0 % 64 + 1))
	end

	if slot_168_2_0 == 1 then
		slot_168_5_1 = arg_168_0:byte(#arg_168_0) * 65536

		table.insert(slot_168_1_0, slot_0_93_0:sub(math.floor(slot_168_5_1 / 262144) + 1, math.floor(slot_168_5_1 / 262144) + 1))
		table.insert(slot_168_1_0, slot_0_93_0:sub(math.floor(slot_168_5_1 / 4096) % 64 + 1, math.floor(slot_168_5_1 / 4096) % 64 + 1))
		table.insert(slot_168_1_0, "==")
	elseif slot_168_2_0 == 2 then
		slot_168_4_0, slot_168_5_0 = arg_168_0:byte(#arg_168_0 - 1, #arg_168_0)
		slot_168_6_0 = slot_168_4_0 * 65536 + slot_168_5_0 * 256

		table.insert(slot_168_1_0, slot_0_93_0:sub(math.floor(slot_168_6_0 / 262144) + 1, math.floor(slot_168_6_0 / 262144) + 1))
		table.insert(slot_168_1_0, slot_0_93_0:sub(math.floor(slot_168_6_0 / 4096) % 64 + 1, math.floor(slot_168_6_0 / 4096) % 64 + 1))
		table.insert(slot_168_1_0, slot_0_93_0:sub(math.floor(slot_168_6_0 / 64) % 64 + 1, math.floor(slot_168_6_0 / 64) % 64 + 1))
		table.insert(slot_168_1_0, "=")
	end

	return table.concat(slot_168_1_0)
end

function slot_0_6_0.base64_decode(arg_169_0)
	if not arg_169_0 or arg_169_0 == "" then
		return ""
	end

	arg_169_0 = arg_169_0:gsub("[^" .. slot_0_93_0 .. "=]", "")

	local var_169_0 = {}
	local var_169_1 = 0
	local var_169_2 = 0

	for iter_169_0 = 1, #arg_169_0 do
		local var_169_3 = arg_169_0:sub(iter_169_0, iter_169_0)

		if var_169_3 == "=" then
			break
		end

		local var_169_4 = slot_0_94_0[var_169_3]

		if var_169_4 then
			var_169_2 = var_169_2 * 64 + var_169_4
			var_169_1 = var_169_1 + 6

			if var_169_1 >= 8 then
				var_169_1 = var_169_1 - 8

				local var_169_5 = math.floor(var_169_2 / 2^var_169_1)

				table.insert(var_169_0, string.char(var_169_5 % 256))

				var_169_2 = var_169_2 % 2^var_169_1
			end
		end
	end

	return table.concat(var_169_0)
end

slot_0_6_0.cfg_map = {
	"master_switch",
	"hitlogs_ws",
	"hitlogs_console",
	"hitlogs_x",
	"hitlogs_y",
	"watermark_ws",
	"wm_logo",
	"wm_user",
	"wm_ping",
	"wm_fps",
	"wm_time",
	"watermark_color",
	"keybinds_ws",
	"keybinds_always_show",
	"keybinds_style",
	"keybinds_color",
	"keybinds_x",
	"keybinds_y",
	"trails",
	"trails_color",
	"velocity",
	"velocity_x",
	"velocity_y",
	"sparks_enabled",
	"sparks_count",
	"sparks_color",
	"damage_rings",
	"floating_damage",
	"hitmarker_ws",
	"hitmarker_color",
	"hitmarker_style",
	"killstreak",
	"killstreak_x",
	"killstreak_y",
	"jumpscout_enabled",
	"jumpscout_vis_enabled",
	"jumpscout_x",
	"jumpscout_y",
	"jumpscout_hitchance",
	"jumpscout_multipoint",
	"jumpscout_force_shoot",
	"killsay_ws",
	"gui_particles",
	"gui_dim",
	"recoil_crosshair",
	"recoil_crosshair_color",
	"aa_disable_round_end",
	"aa_disable_no_enemies",
	"aa_victory_mode",
	"aa_default_pitch",
	"aa_avoid_backstab",
	"aa_avoid_backstab_dist",
	"aa_fake_pitch",
	"theme_accent",
	"theme_bg",
	"theme_bg_alt",
	"theme_text",
	"manual_arrows",
	"manual_arrows_color",
	"manual_arrows_x",
	"manual_arrows_glow",
	"slowed_indicator",
	"slowed_x",
	"slowed_y",
	"auto_pointscale",
	"ls_indicator",
	"ls_indicator_pos",
	"ls_indicator_color",
	"ls_indicator_x",
	"ls_indicator_y",
	"acc_delay_peek",
	"acc_delay_unduck",
	"acc_delay_lethal",
	"acc_baim_hp_enabled",
	"acc_baim_hp_val",
	"acc_dynamic_hitchance",
	"acc_dynamic_hitchance_min",
	"acc_dynamic_hitchance_max",
	"misc_quickswitch",
	"misc_quickladder",
	"misc_hitsound_enabled",
	"misc_hitsound_file",
	"misc_hitsound_vol",
	"visuals_lefthand_knife",
	"menu_x",
	"menu_y",
	"rage_knife_dt",
	"rage_force_shoot_crouch",
	"wb_enable",
	"wb_distance_normal",
	"wb_distance_edit",
	"wb_show_backgrounds",
	"wb_data_json",
	"spectator_list",
	"spectator_list_x",
	"spectator_list_y",
	"bomb_timer",
	"bomb_timer_x",
	"bomb_timer_y",
	"crosshair_indicators",
	"visualize_fakeduck",
	"fakeduck_speed",
	"safe_head",
	"dmg_indicator",
	"dmg_indicator_side",
	"dmg_indicator_scoped",
	"dmg_indicator_color",
	"scope_transparency",
	"scope_alpha",
	"custom_scope",
	"scope_gap",
	"scope_length",
	"scope_thickness",
	"scope_line_color",
	"scope_line_color_2",
	"scope_rotation",
	"scope_t_style",
	"scope_invert",
	"scope_animation",
	"scope_auto_rotate",
	"esp_flags_enabled",
	"esp_flag_godmode",
	"esp_flag_lethal",
	"esp_flag_slowed",
	"esp_flag_reloading",
	"esp_flag_noshoot",
	"esp_flags_color",
	"misc_quick_reload",
	"misc_knife_main_hand",
	"misc_drop_nades",
	"misc_drop_all_key",
	"misc_drop_he_key",
	"misc_drop_molly_key",
	"misc_drop_smoke_key",
	"misc_slide_walk",
	"misc_jitter_legs",
	"wb_remove_lines",
	"ai_peek_retreat_shot",
	"ai_peek_radius",
	"aa_freestanding",
	"aa_freestanding_key",
	"aa_freestanding_visualize",
	"aa_instant_manual",
	"misc_edge_stop",
	"misc_edge_stop_key",
	"misc_edge_stop_mode",
	"misc_subtick_autostop",
	"netgraph_ws",
	"netgraph_x",
	"netgraph_y",
	"sparks_lifetime",
	"sparks_velocity",
	"sparks_size",
	"sparks_trail_length",
	"floating_damage_style",
	"floating_damage_color",
	"aa_pitch_on_shot",
	"aa_pitch_on_shot_awp",
	"aa_pitch_on_shot_ssg08",
	"acc_weapon_group",
	"acc_ap_key",
	"acc_dy_hc_key",
	"acc_dy_hc_enabled_global",
	"acc_dy_hc_min_global",
	"acc_dy_hc_max_global",
	"acc_dy_hc_dist_global",
	"acc_ap_enabled_global",
	"acc_ap_max_global",
	"acc_ap_inc_global",
	"acc_dy_hc_enabled_auto",
	"acc_dy_hc_min_auto",
	"acc_dy_hc_max_auto",
	"acc_dy_hc_dist_auto",
	"acc_ap_enabled_auto",
	"acc_ap_max_auto",
	"acc_ap_inc_auto",
	"acc_dy_hc_enabled_scout",
	"acc_dy_hc_min_scout",
	"acc_dy_hc_max_scout",
	"acc_dy_hc_dist_scout",
	"acc_ap_enabled_scout",
	"acc_ap_max_scout",
	"acc_ap_inc_scout",
	"acc_dy_hc_enabled_awp",
	"acc_dy_hc_min_awp",
	"acc_dy_hc_max_awp",
	"acc_dy_hc_dist_awp",
	"acc_ap_enabled_awp",
	"acc_ap_max_awp",
	"acc_ap_inc_awp",
	"acc_dy_hc_enabled_hpistol",
	"acc_dy_hc_min_hpistol",
	"acc_dy_hc_max_hpistol",
	"acc_dy_hc_dist_hpistol",
	"acc_ap_enabled_hpistol",
	"acc_ap_max_hpistol",
	"acc_ap_inc_hpistol",
	"acc_dy_hc_enabled_pistol",
	"acc_dy_hc_min_pistol",
	"acc_dy_hc_max_pistol",
	"acc_dy_hc_dist_pistol",
	"acc_ap_enabled_pistol",
	"acc_ap_max_pistol",
	"acc_ap_inc_pistol",
	"acc_dy_hc_enabled_other",
	"acc_dy_hc_min_other",
	"acc_dy_hc_max_other",
	"acc_dy_hc_dist_other",
	"acc_ap_enabled_other",
	"acc_ap_max_other",
	"acc_ap_inc_other",
	"misc_impact_viz_enabled",
	"misc_impact_viz_color",
	"misc_impact_viz_duration",
	"visuals_custom_thirdperson_enabled",
	"visuals_custom_thirdperson_dist",
	"misc_r8_disable_right",
	"crosshair_indicators_y",
	"manual_arrows_scoped_y",
	"misc_zeus_quickswitch",
	"aa_suppress_breathing",
	"misc_auto_defuse",
	"misc_auto_defuse_dist",
	"misc_landing_autostop",
	"gs_indicators",
	"air_brake",
	"wb_edit_mode",
	"jump_circles_enabled",
	"jump_circles_size",
	"jump_circles_lifetime",
	"jump_circles_color",
	"soul_particles",
	"soul_particles_count",
	"soul_particles_lifetime",
	"soul_particles_color",
	"misc_clantag",
	"misc_clantag_style",
	"misc_clantag_speed",
	"misc_auto_smoke",
	"misc_auto_smoke_always",
	"misc_auto_smoke_key",
	"acc_delay_lethal_global",
	"acc_delay_lethal_auto",
	"acc_delay_lethal_scout",
	"acc_delay_lethal_awp",
	"acc_delay_lethal_hpistol",
	"acc_delay_lethal_pistol",
	"acc_baim_hp_enabled_global",
	"acc_baim_hp_val_global",
	"acc_baim_hp_enabled_auto",
	"acc_baim_hp_val_auto",
	"acc_baim_hp_enabled_scout",
	"acc_baim_hp_val_scout",
	"acc_baim_hp_enabled_awp",
	"acc_baim_hp_val_awp",
	"acc_baim_hp_enabled_hpistol",
	"acc_baim_hp_val_hpistol",
	"acc_baim_hp_enabled_pistol",
	"acc_baim_hp_val_pistol",
	"acc_lethal_mp_enabled_global",
	"acc_lethal_mp_hp_global",
	"acc_lethal_mp_val_global",
	"acc_lethal_mp_enabled_auto",
	"acc_lethal_mp_hp_auto",
	"acc_lethal_mp_val_auto",
	"acc_lethal_mp_enabled_scout",
	"acc_lethal_mp_hp_scout",
	"acc_lethal_mp_val_scout",
	"acc_lethal_mp_enabled_awp",
	"acc_lethal_mp_hp_awp",
	"acc_lethal_mp_val_awp",
	"acc_lethal_mp_enabled_hpistol",
	"acc_lethal_mp_hp_hpistol",
	"acc_lethal_mp_val_hpistol",
	"acc_lethal_mp_enabled_pistol",
	"acc_lethal_mp_hp_pistol",
	"acc_lethal_mp_val_pistol",
	"acc_dy_hc_key_global",
	"acc_dy_hc_key_auto",
	"acc_dy_hc_key_scout",
	"acc_dy_hc_key_awp",
	"acc_dy_hc_key_hpistol",
	"acc_dy_hc_key_pistol",
	"acc_ap_key_global",
	"acc_ap_key_auto",
	"acc_ap_key_scout",
	"acc_ap_key_awp",
	"acc_ap_key_hpistol",
	"acc_ap_key_pistol",
	"stars_enabled",
	"stars_fall",
	"stars_density",
	"stars_radius",
	"stars_size",
	"stars_glow_power",
	"stars_color",
	"watermark_enabled",
	"watermark_effect",
	"watermark_text",
	"watermark_color",
	"watermark_x",
	"watermark_y",
	"bottom_ws_enabled",
	"bottom_ws_style",
	"ai_peek_enabled",
	"ai_peek_key",
	"ai_peek_debug",
	"ai_peek_console",
	"ai_peek_smooth",
	"ai_peek_offset",
	"ai_peek_slowwalk",
	"ai_peek_unduck",
	"ai_peek_freestand",
	"viewmodel_scope_anim",
	"viewmodel_scope_speed",
	"viewmodel_scope_offset_x",
	"viewmodel_scope_offset_y",
	"viewmodel_scope_offset_z",
	[0] = nil
}

function slot_0_6_0.init_cfg_defaults()
	for iter_170_0, iter_170_1 in ipairs(slot_0_6_0.cfg_map) do
		if UI.cfg[iter_170_1] == nil then
			if iter_170_1:find("_color") or iter_170_1:find("theme_") or iter_170_1:find("_col") then
				UI.cfg[iter_170_1] = {
					255,
					255,
					255,
					255,
					[0] = nil
				}
			elseif iter_170_1:find("_x") or iter_170_1:find("_y") or iter_170_1:find("_dist") or iter_170_1:find("_speed") or iter_170_1:find("_val") or iter_170_1:find("_min") or iter_170_1:find("_max") or iter_170_1:find("_radius") or iter_170_1:find("_vol") or iter_170_1:find("_duration") or iter_170_1:find("_count") or iter_170_1:find("_lifetime") or iter_170_1:find("_size") or iter_170_1:find("_thickness") or iter_170_1:find("_gap") or iter_170_1:find("_length") or iter_170_1:find("_rotation") or iter_170_1:find("_opacity") or iter_170_1:find("_alpha") or iter_170_1:find("_transparency") then
				UI.cfg[iter_170_1] = 0
			elseif iter_170_1:find("_input") or iter_170_1:find("_text") or iter_170_1:find("_file") or iter_170_1:find("_json") or iter_170_1:find("_name") or iter_170_1:find("_style") or iter_170_1:find("_mode") or iter_170_1:find("_type") or iter_170_1:find("_group") or iter_170_1:find("_pos") or iter_170_1:find("_instructions") or iter_170_1:find("_selector") or iter_170_1:find("_effect") then
				UI.cfg[iter_170_1] = ""
			elseif iter_170_1 == "aa_instant_manual" or iter_170_1 == "aa_suppress_breathing" or iter_170_1:find("_enabled") or iter_170_1:find("visualize") or iter_170_1:find("_enabled") or iter_170_1:find("_sync") or iter_170_1:find("_lock") or iter_170_1:find("_indicator") or iter_170_1:find("_glow") or iter_170_1:find("_shadow") or iter_170_1:find("_blur") or iter_170_1:find("_animation") or iter_170_1:find("_invert") or iter_170_1:find("_rotate") or iter_170_1:find("_noshoot") or iter_170_1:find("_godmode") or iter_170_1:find("_lethal") or iter_170_1:find("_slowed") or iter_170_1:find("_reloading") then
				UI.cfg[iter_170_1] = false
			else
				UI.cfg[iter_170_1] = false
			end
		end
	end
end

slot_0_6_0.init_cfg_defaults()

function slot_0_6_0.serialize_cfg()
	local var_171_0 = {}

	for iter_171_0, iter_171_1 in ipairs(slot_0_6_0.cfg_map) do
		local var_171_1 = UI.cfg[iter_171_1]
		local var_171_2 = type(var_171_1)
		local var_171_3 = "0"

		if var_171_2 == "boolean" then
			var_171_3 = var_171_1 and "1" or "0"
		elseif var_171_2 == "number" then
			var_171_3 = tostring(math.floor(var_171_1))
		elseif var_171_2 == "string" then
			var_171_3 = var_171_1:gsub("|", "??")
		elseif var_171_2 == "table" or var_171_2 == "userdata" then
			local var_171_4 = 255
			local var_171_5 = 255
			local var_171_6 = 255
			local var_171_7 = 255

			if var_171_2 == "userdata" or var_171_2 == "table" and var_171_1.is_color then
				var_171_4 = var_171_1.r and (type(var_171_1.r) == "function" and var_171_1:r() or var_171_1.r) or 255
				var_171_5 = var_171_1.g and (type(var_171_1.g) == "function" and var_171_1:g() or var_171_1.g) or 255
				var_171_6 = var_171_1.b and (type(var_171_1.b) == "function" and var_171_1:b() or var_171_1.b) or 255
				var_171_7 = var_171_1.a and (type(var_171_1.a) == "function" and var_171_1:a() or var_171_1.a) or 255
			elseif var_171_2 == "table" then
				var_171_4, var_171_5, var_171_6, var_171_7 = var_171_1[1] or 255, var_171_1[2] or 255, var_171_1[3] or 255, var_171_1[4] or 255
			end

			var_171_3 = string.format("%d,%d,%d,%d", math.floor(var_171_4 or 255), math.floor(var_171_5 or 255), math.floor(var_171_6 or 255), math.floor(var_171_7 or 255))
		end

		table.insert(var_171_0, var_171_3)
	end

	return "SLNT-RAW|" .. table.concat(var_171_0, "|")
end

function slot_0_6_0.deserialize_cfg(arg_172_0)
	if not arg_172_0 or type(arg_172_0) ~= "string" or arg_172_0 == "" then
		return false, "Empty string"
	end

	arg_172_0 = arg_172_0:gsub("^%s*(.-)%s*$", "%1")

	local var_172_0

	if arg_172_0:find("^SLNT%-RAW%|") then
		var_172_0 = arg_172_0:match("^SLNT%-RAW%|(.+)$")
	elseif arg_172_0:find("^SLNT4%-") then
		local var_172_1 = arg_172_0:match("^SLNT4%-(.+)$")

		if var_172_1 then
			local var_172_2 = slot_0_6_0.base64_decode(var_172_1)

			if var_172_2 and #var_172_2 > 0 then
				var_172_0 = var_172_2
			end
		end
	end

	if not var_172_0 or #var_172_0 == 0 then
		return false, "Invalid format (No recognizable Sil header)"
	end

	local var_172_3 = {}
	local var_172_4 = 1

	while true do
		local var_172_5, var_172_6 = var_172_0:find("|", var_172_4)

		if not var_172_5 then
			table.insert(var_172_3, var_172_0:sub(var_172_4))

			break
		end

		table.insert(var_172_3, var_172_0:sub(var_172_4, var_172_5 - 1))

		var_172_4 = var_172_6 + 1
	end

	for iter_172_0, iter_172_1 in ipairs(slot_0_6_0.cfg_map) do
		local var_172_7 = var_172_3[iter_172_0]

		if var_172_7 and type(var_172_7) == "string" and var_172_7 ~= "" then
			local var_172_8 = type(UI.cfg[iter_172_1])

			if var_172_8 == "nil" then
				var_172_8 = (iter_172_1:find("_color") or iter_172_1:find("theme_") or iter_172_1:find("_col")) and "table" or (iter_172_1:find("_x") or iter_172_1:find("_y") or iter_172_1:find("_dist") or iter_172_1:find("_val") or iter_172_1:find("_min") or iter_172_1:find("_max")) and "number" or (iter_172_1:find("_input") or iter_172_1:find("_text") or iter_172_1:find("_file") or iter_172_1:find("_json")) and "string" or "boolean"
			end

			if var_172_8 == "boolean" then
				UI.cfg[iter_172_1] = var_172_7 == "1"
			elseif var_172_8 == "number" then
				UI.cfg[iter_172_1] = tonumber(var_172_7) or 0
			elseif var_172_8 == "string" then
				UI.cfg[iter_172_1] = var_172_7 == "??" and "" or var_172_7:gsub("??", "|")
			elseif var_172_8 == "table" then
				local var_172_9, var_172_10, var_172_11, var_172_12 = var_172_7:match("(%d+),(%d+),(%d+),(%d+)")

				if var_172_9 and var_172_10 and var_172_11 and var_172_12 then
					UI.cfg[iter_172_1] = {
						tonumber(var_172_9),
						tonumber(var_172_10),
						tonumber(var_172_11),
						tonumber(var_172_12)
					}
				end
			end
		end
	end

	return true, "Success"
end

function slot_0_6_0.load_config(arg_173_0, arg_173_1, arg_173_2)
	if not arg_173_0 and not arg_173_1 and not arg_173_2 then
		return
	end

	arg_173_0 = arg_173_0 and arg_173_0:gsub("%.cfg$", ""):lower()

	local function var_173_0(arg_174_0)
		if not arg_174_0 or type(arg_174_0) ~= "string" or arg_174_0 == "" then
			print("[Silentium] Load Error: String is empty")

			return false
		end

		local var_174_0, var_174_1 = slot_0_6_0.deserialize_cfg(arg_174_0)

		if var_174_0 then
			if UI.cfg.wb_data_json and type(UI.cfg.wb_data_json) == "string" and UI.cfg.wb_data_json ~= "" then
				local var_174_2 = utils.JsonDecode(UI.cfg.wb_data_json)

				if var_174_2 and type(var_174_2) == "table" then
					slot_0_91_0.positions_by_map = var_174_2
					slot_0_91_0.last_map_name = slot_0_90_0()

					slot_0_91_0.save_data()
				end
			end

			return true
		end

		print("[Silentium] Deserialization failed: " .. tostring(var_174_1 or "Unknown error"))

		return false, var_174_1
	end

	if arg_173_2 then
		local var_173_1, var_173_2 = var_173_0(arg_173_2)

		if var_173_1 then
			notify("Loaded " .. (arg_173_0 or "Cloud Config"), "success")

			return
		else
			notify("Cloud Load Failed: " .. tostring(var_173_2), "error")

			return
		end
	end

	local var_173_3 = "Config file not found"

	if arg_173_1 then
		local var_173_4 = slot_0_6_0.sil_read_file(arg_173_1)

		if var_173_4 then
			local var_173_5, var_173_6 = var_173_0(var_173_4)

			if var_173_5 then
				notify("Loaded from path: " .. arg_173_1, "success")

				return
			else
				var_173_3 = "Failed to parse: " .. tostring(var_173_6)
			end
		end
	end

	if arg_173_0 then
		local var_173_7 = {
			slot_0_6_0.SILENTIUM_DIR,
			"silentum/",
			"silentium/",
			"scripts/silentum/",
			"scripts/silentium/",
			"fatality/scripts/silentum/",
			"fatality/scripts/silentium/",
			"fatality/silentium/",
			"",
			[0] = nil
		}

		for iter_173_0, iter_173_1 in ipairs(var_173_7) do
			local var_173_8 = iter_173_1 .. arg_173_0 .. ".cfg"
			local var_173_9 = slot_0_6_0.sil_read_file(var_173_8)

			if var_173_9 then
				local var_173_10, var_173_11 = var_173_0(var_173_9)

				if var_173_10 then
					notify("Loaded " .. arg_173_0, "success")

					return
				else
					var_173_3 = "Failed to parse: " .. tostring(var_173_11)
				end
			end
		end
	end

	notify(var_173_3, "error")
end

function slot_0_6_0.delete_config(arg_175_0)
	local var_175_0 = arg_175_0:gsub("%.cfg$", "") .. ".cfg"
	local var_175_1 = false
	local var_175_2 = {
		slot_0_6_0.SILENTIUM_DIR,
		"fatality/silentium/",
		"silentium/",
		"",
		[0] = nil
	}

	for iter_175_0, iter_175_1 in ipairs(var_175_2) do
		local var_175_3 = iter_175_1 .. var_175_0
		local var_175_4 = slot_0_6_0.normalize_path_internal(var_175_3)

		if utils and utils.FileExists and utils.FileExists(var_175_4) and utils.FileRemove and utils.FileRemove(var_175_4) ~= false then
			var_175_1 = true
		end

		if not var_175_1 and type(Filesystem) == "table" and Filesystem.remove then
			Filesystem.remove(var_175_3)

			var_175_1 = true
		end
	end

	if var_175_1 then
		notify("Deleted " .. arg_175_0, "success")
		slot_0_6_0.refresh_presets()
	else
		notify("Failed to delete", "error")
	end
end

function slot_0_91_0.load_data()
	local var_176_0 = slot_0_6_0.sil_read_file(slot_0_6_0.SILENTIUM_DIR .. "Helpers/wallbang_data.json")

	if var_176_0 and type(var_176_0) == "string" and var_176_0 ~= "" then
		local var_176_1 = utils.JsonDecode(var_176_0)

		if var_176_1 and type(var_176_1) == "table" then
			slot_0_91_0.positions_by_map = var_176_1

			return true
		end
	end

	return false
end

function slot_0_91_0.draw_world_marker(arg_177_0, arg_177_1, arg_177_2, arg_177_3, arg_177_4, arg_177_5)
	if not arg_177_4 then
		local var_177_0 = tostring(arg_177_0.x) .. tostring(arg_177_0.y) .. (arg_177_1 or "node")

		arg_177_4, arg_177_5 = slot_0_92_0(var_177_0, 1, 6)
	end

	if arg_177_4 <= 0.01 then
		return
	end

	local var_177_1 = math.WorldToScreen(arg_177_0)

	if not var_177_1 then
		return
	end

	local var_177_2 = draw.surface
	local var_177_3 = 1
	local var_177_4 = UI.theme
	local var_177_5 = slot_0_41_0(var_177_4.accent)
	local var_177_6 = (arg_177_3 and 5 or 3) * var_177_3
	local var_177_7 = (math.sin(game.globalVars.m_flRealTime * 4) + 1) / 2
	local var_177_8 = math.floor((arg_177_3 and 180 + 75 * var_177_7 or 15) * arg_177_4)

	var_177_2:AddCircle(var_177_1, var_177_6, slot_0_41_0(arg_177_2, var_177_8), 32, 1)

	local var_177_9 = slot_0_41_0(var_177_4.accent, math.floor(255 * arg_177_4))

	var_177_2:AddCircleFilled(var_177_1, 1.2 * var_177_3, var_177_9)

	if arg_177_1 and arg_177_1 ~= "" then
		local var_177_10 = draw.fonts.gui_main or UI.font
		local var_177_11 = slot_0_51_0(var_177_10, arg_177_1)
		local var_177_12 = 20 * var_177_3
		local var_177_13 = 8 * var_177_3
		local var_177_14 = 6 * var_177_3
		local var_177_15 = var_177_11.x + var_177_13 * 3 + var_177_14
		local var_177_16 = var_177_1.x + var_177_6 + 12 * var_177_3 + arg_177_5
		local var_177_17 = var_177_1.y - var_177_12 / 2

		if not UI.cfg.wb_remove_lines then
			var_177_2:AddLine(draw.Vec2(var_177_1.x + var_177_6, var_177_1.y), draw.Vec2(var_177_16, var_177_1.y), slot_0_41_0(var_177_5, math.floor(80 * arg_177_4)), 1)
		end

		var_177_2:AddRectFilledRounded(draw.Rect(var_177_16, var_177_17, var_177_16 + var_177_15, var_177_17 + var_177_12), draw.Color(5, 5, 8, math.floor(220 * arg_177_4)), 4)
		var_177_2:AddRectFilled(draw.Rect(var_177_16, var_177_17 + 2, var_177_16 + 2, var_177_17 + var_177_12 - 2), slot_0_41_0(var_177_5, math.floor(255 * arg_177_4)))

		var_177_2.font = var_177_10

		var_177_2:AddText(draw.Vec2(var_177_16 + 10, var_177_17 + (var_177_12 - var_177_11.y) / 2), arg_177_1, draw.Color(255, 255, 255, math.floor(255 * arg_177_4)))
	end

	return var_177_1, var_177_6
end

function slot_0_91_0.get_selected_spot_id()
	local var_178_0 = slot_0_90_0()

	if var_178_0 == "" then
		return nil
	end

	if not slot_0_91_0.positions_by_map[var_178_0] then
		return nil
	end

	local var_178_1 = UI.cfg.wb_spot_selector or 1
	local var_178_2 = var_178_1

	if type(var_178_1) == "string" then
		local var_178_3 = {}

		for iter_178_0, iter_178_1 in pairs(slot_0_91_0.positions_by_map[var_178_0].pos or {}) do
			table.insert(var_178_3, tonumber(iter_178_0))
		end

		table.sort(var_178_3)

		local var_178_4 = {
			"None",
			[0] = nil
		}

		for iter_178_2, iter_178_3 in ipairs(var_178_3) do
			table.insert(var_178_4, iter_178_3 .. ": " .. (slot_0_91_0.positions_by_map[var_178_0].pos[tostring(iter_178_3)].name or "Spot"))
		end

		for iter_178_4, iter_178_5 in ipairs(var_178_4) do
			if iter_178_5 == var_178_1 then
				var_178_2 = iter_178_4

				break
			end
		end
	end

	if type(var_178_2) ~= "number" or var_178_2 <= 1 then
		return nil
	end

	local var_178_5 = {}

	for iter_178_6, iter_178_7 in pairs(slot_0_91_0.positions_by_map[var_178_0].pos) do
		table.insert(var_178_5, tonumber(iter_178_6))
	end

	table.sort(var_178_5)

	local var_178_6 = var_178_2 - 1

	if not var_178_5[var_178_6] then
		return nil
	end

	return tostring(var_178_5[var_178_6])
end

function slot_0_91_0.draw_aim_spot_widget(arg_179_0, arg_179_1, arg_179_2, arg_179_3, arg_179_4)
	if not arg_179_3 then
		arg_179_3, arg_179_4 = slot_0_92_0(tostring(arg_179_0.x) .. "aim", 1, 8)
	end

	if arg_179_3 <= 0.01 then
		return
	end

	local var_179_0 = draw.surface
	local var_179_1 = 1
	local var_179_2 = UI.theme
	local var_179_3 = 4 * var_179_1
	local var_179_4 = (math.sin(game.globalVars.m_flRealTime * 6) + 1) / 2
	local var_179_5 = slot_0_41_0(var_179_2.accent)

	var_179_0:AddCircle(arg_179_1, var_179_3, slot_0_41_0(var_179_5, math.floor(255 * arg_179_3)), 32, 1)
	var_179_0:AddCircleFilled(arg_179_1, 2 * var_179_1 * var_179_4, slot_0_41_0(var_179_5, math.floor(255 * arg_179_3)))

	if arg_179_2 and arg_179_2 ~= "" then
		local var_179_6 = draw.fonts.gui_main or UI.font
		local var_179_7 = slot_0_51_0(var_179_6, arg_179_2)
		local var_179_8 = 20 * var_179_1
		local var_179_9 = 8 * var_179_1
		local var_179_10 = 6 * var_179_1
		local var_179_11 = var_179_7.x + var_179_9 * 3 + var_179_10
		local var_179_12 = arg_179_1.x + var_179_3 + 12 * var_179_1 + arg_179_4
		local var_179_13 = arg_179_1.y - var_179_8 / 2

		if not UI.cfg.wb_remove_lines then
			var_179_0:AddLine(draw.Vec2(arg_179_1.x + var_179_3, arg_179_1.y), draw.Vec2(var_179_12, arg_179_1.y), slot_0_41_0(var_179_5, math.floor(80 * arg_179_3)), 1)
		end

		var_179_0:AddRectFilledRounded(draw.Rect(var_179_12, var_179_13, var_179_12 + var_179_11, var_179_13 + var_179_8), draw.Color(5, 5, 8, math.floor(220 * arg_179_3)), 4)
		var_179_0:AddRectFilled(draw.Rect(var_179_12, var_179_13 + 2, var_179_12 + 2, var_179_13 + var_179_8 - 2), slot_0_41_0(var_179_5, math.floor(255 * arg_179_3)))

		var_179_0.font = var_179_6

		var_179_0:AddText(draw.Vec2(var_179_12 + 10, var_179_13 + (var_179_8 - var_179_7.y) / 2), arg_179_2, draw.Color(255, 255, 255, math.floor(255 * arg_179_3)))
	end
end

function slot_0_91_0.render_normal_view()
	local var_180_0 = entities.GetLocalPawn()

	if not var_180_0 or not var_180_0:IsAlive() then
		return
	end

	local var_180_1 = var_180_0:GetActiveWeapon()

	if not var_180_1 then
		return
	end

	local var_180_2 = var_180_1:GetDefIndex()
	local var_180_3 = game.globalVars.mapName
	local var_180_4 = slot_0_91_0.positions_by_map[var_180_3]

	if not var_180_4 or not var_180_4.pos then
		return
	end

	local var_180_5 = var_180_0:GetAbsOrigin()
	local var_180_6 = UI.cfg.wb_distance_normal or 1000
	local var_180_7 = UI.cfg.wb_show_backgrounds
	local var_180_8 = 50
	local var_180_9 = draw.surface

	for iter_180_0, iter_180_1 in pairs(var_180_4.pos) do
		local var_180_10 = vector(iter_180_1.pos.x, iter_180_1.pos.y, iter_180_1.pos.z)
		local var_180_11 = var_180_5:dist(var_180_10)
		local var_180_12 = false

		if iter_180_1.aim_spots then
			for iter_180_2, iter_180_3 in ipairs(iter_180_1.aim_spots) do
				if iter_180_3.weapons then
					for iter_180_4, iter_180_5 in ipairs(iter_180_3.weapons) do
						if iter_180_5 == var_180_2 then
							var_180_12 = true

							break
						end
					end
				end

				if var_180_12 then
					break
				end
			end
		end

		local var_180_13 = var_180_12 and var_180_11 < var_180_6 and 1 or 0
		local var_180_14, var_180_15 = slot_0_92_0(tostring(var_180_10.x) .. tostring(var_180_10.y) .. "node", var_180_13, 5)

		if var_180_14 > 0.01 then
			local var_180_16 = iter_180_1.name or "Spot #" .. iter_180_0

			slot_0_91_0.draw_world_marker(var_180_10, var_180_16, slot_0_41_0(UI.theme.accent, 150), false, var_180_14, var_180_15)
		end

		if var_180_12 and iter_180_1.aim_spots then
			for iter_180_6, iter_180_7 in ipairs(iter_180_1.aim_spots) do
				local var_180_17 = false

				if iter_180_7.weapons then
					for iter_180_8, iter_180_9 in ipairs(iter_180_7.weapons) do
						if iter_180_9 == var_180_2 then
							var_180_17 = true

							break
						end
					end
				end

				if var_180_17 then
					local var_180_18 = var_180_11 < var_180_8 and 1 or 0
					local var_180_19, var_180_20 = slot_0_92_0(tostring(iter_180_7.aim_pos.x) .. "aim", var_180_18, 8)

					if var_180_19 > 0.01 then
						local var_180_21 = vector(iter_180_7.aim_pos.x, iter_180_7.aim_pos.y, iter_180_7.aim_pos.z)
						local var_180_22 = math.WorldToScreen(var_180_21)
						local var_180_23 = math.WorldToScreen(var_180_10)

						if var_180_22 and var_180_23 and not UI.cfg.wb_remove_lines then
							var_180_9:AddLine(var_180_23, var_180_22, slot_0_41_0(UI.theme.accent, math.floor(120 * var_180_19)), 1.5)
						end

						if var_180_22 then
							slot_0_91_0.draw_aim_spot_widget(var_180_21, var_180_22, iter_180_7.instructions, var_180_19, var_180_20)
						end
					end
				end
			end
		end
	end
end

function slot_0_91_0.render_edit_view()
	local var_181_0 = game.globalVars.mapName

	if not var_181_0 or var_181_0 == "" then
		return
	end

	local var_181_1 = slot_0_91_0.positions_by_map[var_181_0]

	if not var_181_1 or not var_181_1.pos then
		return
	end

	local var_181_2 = slot_0_91_0.get_selected_spot_id()

	for iter_181_0, iter_181_1 in pairs(var_181_1.pos or {}) do
		local var_181_3 = vector(iter_181_1.pos.x, iter_181_1.pos.y, iter_181_1.pos.z)
		local var_181_4 = iter_181_0 == var_181_2

		slot_0_91_0.draw_world_marker(var_181_3, iter_181_1.name or "Spot #" .. iter_181_0, var_181_4 and slot_0_41_0(UI.theme.accent) or draw.Color(200, 200, 200, 150), var_181_4)

		if var_181_4 and iter_181_1.aim_spots then
			local var_181_5 = UI.cfg.wb_aim_spot_selector or 1

			for iter_181_2, iter_181_3 in ipairs(iter_181_1.aim_spots) do
				local var_181_6 = vector(iter_181_3.aim_pos.x, iter_181_3.aim_pos.y, iter_181_3.aim_pos.z)
				local var_181_7 = iter_181_2 == var_181_5

				slot_0_91_0.draw_world_marker(var_181_6, "Aim #" .. iter_181_2, var_181_7 and draw.Color(255, 100, 100, 255) or draw.Color(255, 150, 150, 100), var_181_7)
			end
		end
	end
end

function slot_0_91_0.update_and_render()
	if not UI.cfg.wb_enable then
		return
	end

	local var_182_0 = game.globalVars.mapName

	if not var_182_0 or var_182_0 == "" then
		return
	end

	if var_182_0 ~= slot_0_91_0.last_map_name then
		if not slot_0_91_0.positions_by_map[var_182_0] then
			slot_0_91_0.load_data()
		end

		slot_0_91_0.last_map_name = var_182_0
		slot_0_91_0.animations = {}
	end

	local var_182_1 = entities.GetLocalPawn()

	if var_182_1 then
		local var_182_2 = var_182_1:GetActiveWeapon()

		if var_182_2 then
			local var_182_3 = var_182_2:GetDefIndex()

			if var_182_3 ~= slot_0_91_0.last_weapon_id then
				slot_0_91_0.last_weapon_id = var_182_3
				slot_0_91_0.animations = {}
			end
		end
	end

	if UI.cfg.wb_edit_mode then
		slot_0_91_0.render_edit_view()
	else
		slot_0_91_0.render_normal_view()
	end
end

function slot_0_91_0.add_standing_spot()
	local var_183_0 = entities.GetLocalPawn()

	if not var_183_0 then
		return
	end

	local var_183_1 = var_183_0:GetAbsOrigin()
	local var_183_2 = slot_0_90_0()

	if not var_183_2 or var_183_2 == "" then
		notify("Cannot add spot: Map not loaded!", "error")

		return
	end

	if not slot_0_91_0.positions_by_map[var_183_2] then
		slot_0_91_0.positions_by_map[var_183_2] = {
			[0] = nil,
			pos = {}
		}
	end

	local var_183_3 = tostring(math.floor(game.globalVars.m_flRealTime * 1000))

	slot_0_91_0.positions_by_map[var_183_2].pos[var_183_3] = {
		name = "New Spot",
		["Drop Smoke"] = nil,
		pos = {
			x = var_183_1.x,
			y = var_183_1.y,
			z = var_183_1.z
		},
		aim_spots = {}
	}

	slot_0_91_0.save_data()
	notify("Added Standing Spot", "success")
end

function slot_0_91_0.update_standing_spot()
	local var_184_0 = slot_0_91_0.get_selected_spot_id()

	if not var_184_0 then
		return
	end

	local var_184_1 = game.globalVars.mapName
	local var_184_2 = slot_0_91_0.positions_by_map[var_184_1].pos[var_184_0]

	if not var_184_2 then
		return
	end

	if UI.cfg.wb_spot_name_editor and UI.cfg.wb_spot_name_editor ~= "" then
		var_184_2.name = UI.cfg.wb_spot_name_editor
	end

	local var_184_3 = entities.GetLocalPawn()

	if var_184_3 then
		local var_184_4 = var_184_3:GetAbsOrigin()

		var_184_2.pos = {
			[0] = nil,
			x = var_184_4.x,
			y = var_184_4.y,
			z = var_184_4.z
		}
	end

	slot_0_91_0.save_data()
	notify("Updated spot #" .. var_184_0, "success")
end

function slot_0_91_0.delete_standing_spot()
	local var_185_0 = slot_0_91_0.get_selected_spot_id()

	if not var_185_0 then
		return
	end

	slot_0_91_0.positions_by_map[game.globalVars.mapName].pos[var_185_0] = nil

	slot_0_91_0.save_data()
	notify("Deleted spot #" .. var_185_0, "warning")
end

function slot_0_91_0.add_aim_spot()
	local var_186_0 = slot_0_91_0.get_selected_spot_id()

	if not var_186_0 then
		notify("No spot selected to add aim point to!", "error")

		return
	end

	local var_186_1 = entities.GetLocalPawn()

	if not var_186_1 then
		return
	end

	local var_186_2 = var_186_1:GetActiveWeapon()

	if not var_186_2 then
		notify("Hold a weapon to add aim point!", "warning")

		return
	end

	local var_186_3 = game.input:GetViewAngles()
	local var_186_4 = math.rad(var_186_3.x)
	local var_186_5 = math.rad(var_186_3.y)
	local var_186_6 = vector(math.cos(var_186_4) * math.cos(var_186_5), math.cos(var_186_4) * math.sin(var_186_5), -math.sin(var_186_4))
	local var_186_7 = var_186_1:GetEyePos()
	local var_186_8 = vector(var_186_7.x + var_186_6.x * 8192, var_186_7.y + var_186_6.y * 8192, var_186_7.z + var_186_6.z * 8192)
	local var_186_9 = ray_t()
	local var_186_10 = game.physics_query_interface:trace_ray(var_186_9, var_186_7, var_186_8)

	if not var_186_10 or var_186_10.fraction >= 1 then
		notify("Trace failed - target is sky or too far!", "warning")

		return
	end

	local var_186_11 = var_186_10.endpos
	local var_186_12 = slot_0_90_0()
	local var_186_13 = slot_0_91_0.positions_by_map[var_186_12].pos[var_186_0]

	table.insert(var_186_13.aim_spots, {
		aim_pos = {
			[0] = nil,
			x = var_186_11.x,
			y = var_186_11.y,
			z = var_186_11.z
		},
		instructions = UI.cfg.wb_aim_spot_instructions or "",
		weapons = {
			var_186_2:GetDefIndex()
		}
	})
	slot_0_91_0.save_data()
	notify("Added aim spot to #" .. var_186_0, "success")
end

function slot_0_91_0.update_aim_spot()
	local var_187_0 = slot_0_91_0.get_selected_spot_id()

	if not var_187_0 then
		return
	end

	local var_187_1 = UI.cfg.wb_aim_spot_selector or 1
	local var_187_2 = var_187_1

	if type(var_187_1) == "string" then
		var_187_2 = var_187_1:match("Aim #(%d+)")
		var_187_2 = tonumber(var_187_2) or 1
		var_187_2 = var_187_2 + 1
	end

	local var_187_3 = (tonumber(var_187_2) or 1) - 1

	if var_187_3 <= 0 then
		notify("No aim point selected to update!", "warning")

		return
	end

	local var_187_4 = slot_0_90_0()
	local var_187_5 = slot_0_91_0.positions_by_map[var_187_4].pos[var_187_0]

	if not var_187_5 or not var_187_5.aim_spots[var_187_3] then
		notify("Target aim spot not found!", "error")

		return
	end

	local var_187_6 = var_187_5.aim_spots[var_187_3]

	if UI.cfg.wb_aim_spot_instructions and UI.cfg.wb_aim_spot_instructions ~= "" then
		var_187_6.instructions = UI.cfg.wb_aim_spot_instructions
	end

	local var_187_7 = entities.GetLocalPawn()

	if var_187_7 then
		local var_187_8 = var_187_7:GetActiveWeapon()

		if var_187_8 then
			local var_187_9 = false

			for iter_187_0, iter_187_1 in ipairs(var_187_6.weapons) do
				if iter_187_1 == var_187_8:GetDefIndex() then
					var_187_9 = true

					break
				end
			end

			if not var_187_9 then
				table.insert(var_187_6.weapons, var_187_8:GetDefIndex())
			end
		end

		local var_187_10 = game.input:GetViewAngles()
		local var_187_11 = math.rad(var_187_10.x)
		local var_187_12 = math.rad(var_187_10.y)
		local var_187_13 = vector(math.cos(var_187_11) * math.cos(var_187_12), math.cos(var_187_11) * math.sin(var_187_12), -math.sin(var_187_11))
		local var_187_14 = var_187_7:GetEyePos()
		local var_187_15 = vector(var_187_14.x + var_187_13.x * 8192, var_187_14.y + var_187_13.y * 8192, var_187_14.z + var_187_13.z * 8192)
		local var_187_16 = ray_t()
		local var_187_17 = game.physics_query_interface:trace_ray(var_187_16, var_187_14, var_187_15)

		if var_187_17 and var_187_17.fraction < 1 then
			var_187_6.aim_pos = {
				[0] = nil,
				x = var_187_17.endpos.x,
				y = var_187_17.endpos.y,
				z = var_187_17.endpos.z
			}
		end
	end

	slot_0_91_0.save_data()
	notify("Updated aim spot #" .. var_187_3, "success")
end

function slot_0_91_0.delete_aim_spot()
	local var_188_0 = slot_0_91_0.get_selected_spot_id()

	if not var_188_0 then
		return
	end

	local var_188_1 = UI.cfg.wb_aim_spot_selector or 1
	local var_188_2 = var_188_1

	if type(var_188_1) == "string" then
		var_188_2 = var_188_1:match("Aim #(%d+)")
		var_188_2 = tonumber(var_188_2) or 1
		var_188_2 = var_188_2 + 1
	end

	local var_188_3 = (tonumber(var_188_2) or 1) - 1

	if var_188_3 <= 0 then
		notify("No aim point selected to delete!", "warning")

		return
	end

	local var_188_4 = slot_0_90_0()
	local var_188_5 = slot_0_91_0.positions_by_map[var_188_4].pos[var_188_0]

	if not var_188_5 or not var_188_5.aim_spots[var_188_3] then
		notify("Aim spot not found for deletion!", "error")

		return
	end

	table.remove(var_188_5.aim_spots, var_188_3)
	slot_0_91_0.save_data()
	notify("Deleted aim spot #" .. var_188_3, "warning")
end

if draw.fonts then
	UI.font = draw.fonts.gui_main or draw.fonts.gui_semi_bold or draw.fonts.gui_bold
elseif slot_0_36_0.font then
	UI.font = slot_0_36_0.font
end

function slot_0_95_0(arg_189_0, arg_189_1, arg_189_2, arg_189_3, arg_189_4)
	local var_189_0 = arg_189_1.x
	local var_189_1 = arg_189_1.y
	local var_189_2 = arg_189_2
	local var_189_3 = arg_189_2 * 0.38
	local var_189_4 = {}
	local var_189_5 = draw.vec2

	for iter_189_0 = 0, 4 do
		local var_189_6 = math.rad(iter_189_0 * 72 - 90 + arg_189_3)
		local var_189_7 = math.rad(iter_189_0 * 72 - 90 + 36 + arg_189_3)

		var_189_4[2 * iter_189_0 + 1] = var_189_5(var_189_0 + var_189_2 * math.cos(var_189_6), var_189_1 + var_189_2 * math.sin(var_189_6))
		var_189_4[2 * iter_189_0 + 2] = var_189_5(var_189_0 + var_189_3 * math.cos(var_189_7), var_189_1 + var_189_3 * math.sin(var_189_7))
	end

	for iter_189_1 = 0, 4 do
		arg_189_0:AddTriangleFilled(var_189_4[2 * iter_189_1 + 1], var_189_4[2 * iter_189_1 + 2], var_189_4[2 * ((iter_189_1 + 4) % 5) + 2], arg_189_4)
	end

	for iter_189_2 = 0, 2 do
		arg_189_0:AddTriangleFilled(var_189_4[2], var_189_4[2 * (iter_189_2 + 1) + 2], var_189_4[2 * (iter_189_2 + 2) + 2], arg_189_4)
	end
end

slot_0_96_0 = {
	last_spawn = 0,
	trace_idx = 1,
	[0] = nil,
	list = {}
}

function slot_0_96_0.spawn(arg_190_0)
	local var_190_0 = entities.GetLocalPawn()

	if not var_190_0 or not var_190_0:IsAlive() then
		return false
	end

	local var_190_1 = var_190_0:GetAbsOrigin()
	local var_190_2 = var_190_0:GetEyePos()
	local var_190_3 = UI.cfg.stars_radius and UI.cfg.stars_radius > 0 and UI.cfg.stars_radius or 1000
	local var_190_4 = var_190_1
	local var_190_5 = var_190_0:GetAbsVelocity()
	local var_190_6 = var_190_5 and var_190_5:length() or 0

	if var_190_6 > 100 then
		var_190_4 = var_190_1 + var_190_5 * (math.min(var_190_6 * 0.8, var_190_3 * 0.9) / var_190_6)
	end

	local var_190_7 = var_190_3 * math.random()^0.5
	local var_190_8 = math.random() * 2 * math.pi
	local var_190_9 = -40 + math.random() * 260
	local var_190_10 = vector(var_190_4.x + var_190_7 * math.cos(var_190_8), var_190_4.y + var_190_7 * math.sin(var_190_8), var_190_4.z + var_190_9)
	local var_190_11 = 25

	for iter_190_0, iter_190_1 in ipairs(slot_0_96_0.list) do
		if var_190_11 > var_190_10:dist(iter_190_1.pos) then
			return false
		end
	end

	local var_190_12 = true

	if game.physics_query_interface and (not arg_190_0 or arg_190_0 < 400) then
		local var_190_13 = game.physics_query_interface:trace_ray(ray_t(), var_190_2, var_190_10)

		if var_190_13 and var_190_13.fraction < 0.95 then
			var_190_12 = false
		end
	end

	if var_190_12 then
		table.insert(slot_0_96_0.list, {
			visible = true,
			[0] = nil,
			pos = var_190_10,
			born = game.globalVars.m_flRealTime,
			base_rand_size = 0.5 + math.random() * 1.5,
			rot = math.random(0, 360),
			rot_speed = (math.random() - 0.5) * 120,
			twinkle_off = math.random() * 10,
			twinkle_spd = 0.4 + math.random() * 2.5
		})

		return true
	end

	return false
end

function slot_0_96_0.update_logic()
	if not UI.cfg.stars_enabled then
		if #slot_0_96_0.list > 0 then
			slot_0_96_0.list = {}
		end

		return
	end

	local var_191_0 = entities.GetLocalPawn()

	if not var_191_0 or not var_191_0:IsAlive() then
		return
	end

	local var_191_1 = var_191_0:GetAbsOrigin()
	local var_191_2 = var_191_0:GetEyePos()
	local var_191_3 = UI.cfg.stars_density and UI.cfg.stars_density > 0 and UI.cfg.stars_density or 200
	local var_191_4 = UI.cfg.stars_radius and UI.cfg.stars_radius > 0 and UI.cfg.stars_radius or 1000
	local var_191_5 = UI.cfg.stars_fall
	local var_191_6 = var_191_0:GetAbsVelocity()
	local var_191_7 = var_191_6 and var_191_6:length() or 0
	local var_191_8 = var_191_3 - #slot_0_96_0.list

	if var_191_8 > 0 then
		local var_191_9 = math.ceil(math.min(var_191_8, 12 + var_191_7 / 40))
		local var_191_10 = 0
		local var_191_11 = 0

		while var_191_10 < var_191_9 and var_191_11 < var_191_9 * 1.5 do
			if slot_0_96_0.spawn(var_191_7) then
				var_191_10 = var_191_10 + 1
			end

			var_191_11 = var_191_11 + 1
		end
	end

	if #slot_0_96_0.list > 0 then
		local var_191_12 = math.floor(30 + var_191_7 / 80 * 15)
		local var_191_13 = math.min(var_191_12, 80)

		for iter_191_0 = 1, var_191_13 do
			slot_0_96_0.trace_idx = slot_0_96_0.trace_idx % #slot_0_96_0.list + 1

			local var_191_14 = slot_0_96_0.list[slot_0_96_0.trace_idx]

			if var_191_14 and game.physics_query_interface then
				local var_191_15 = game.physics_query_interface:trace_ray(ray_t(), var_191_2, var_191_14.pos)

				var_191_14.visible = not var_191_15 or var_191_15.fraction > 0.985
			end
		end

		if var_191_5 then
			for iter_191_1, iter_191_2 in ipairs(slot_0_96_0.list) do
				iter_191_2.pos.z = iter_191_2.pos.z - (0.12 + math.random() * 0.08)
			end
		end
	end

	local var_191_16 = game.globalVars.m_flRealTime

	for iter_191_3 = #slot_0_96_0.list, 1, -1 do
		local var_191_17 = slot_0_96_0.list[iter_191_3]

		if (var_191_17.pos - var_191_1):length() > var_191_4 + 1000 or var_191_16 > var_191_17.born + 80 or var_191_17.pos.z < var_191_1.z - 500 then
			table.remove(slot_0_96_0.list, iter_191_3)
		end
	end
end

function slot_0_96_0.draw()
	if not UI.cfg.stars_enabled or #slot_0_96_0.list == 0 then
		return
	end

	local var_192_0 = draw.surface
	local var_192_1 = entities.GetLocalPawn()

	if not var_192_1 then
		return
	end

	local var_192_2 = var_192_1:GetEyePos()

	if not var_192_2 then
		return
	end

	local var_192_3 = game.globalVars.m_flRealTime
	local var_192_4 = UI.cfg.stars_size and UI.cfg.stars_size > 0 and UI.cfg.stars_size or 6
	local var_192_5 = UI.cfg.stars_glow_power or 40
	local var_192_6 = UI.cfg.stars_color or {
		255,
		255,
		255,
		255,
		[0] = nil
	}

	for iter_192_0, iter_192_1 in ipairs(slot_0_96_0.list) do
		if iter_192_1.visible then
			local var_192_7 = math.WorldToScreen(iter_192_1.pos)

			if var_192_7 then
				local var_192_8 = (iter_192_1.pos - var_192_2):length()

				if var_192_8 < 2500 then
					local var_192_9 = var_192_3 - iter_192_1.born
					local var_192_10 = math.min(1, var_192_9 / 1)
					local var_192_11 = math.sin(var_192_3 * iter_192_1.twinkle_spd + iter_192_1.twinkle_off) * 0.5 + 0.5
					local var_192_12 = math.clamp(1400 / var_192_8, 0.45, 3.5)
					local var_192_13 = var_192_4 * iter_192_1.base_rand_size * var_192_12 * (0.8 + 0.4 * var_192_11)
					local var_192_14 = math.floor(var_192_6[4] * var_192_10 * (0.6 + 0.4 * var_192_11))
					local var_192_15 = iter_192_1.rot + var_192_3 * iter_192_1.rot_speed

					if var_192_5 > 0 and (var_192_13 > 2.5 or var_192_8 < 800) then
						local var_192_16 = var_192_5 / 100 * (var_192_14 / 255)
						local var_192_17 = draw.Color(var_192_6[1], var_192_6[2], var_192_6[3], math.floor(102 * var_192_16))
						local var_192_18 = draw.Color(var_192_6[1], var_192_6[2], var_192_6[3], math.floor(30.599999999999998 * var_192_16))

						slot_0_95_0(var_192_0, var_192_7, var_192_13 * 1.8, var_192_15, var_192_17)
						slot_0_95_0(var_192_0, var_192_7, var_192_13 * 3.8, var_192_15, var_192_18)
					end

					local var_192_19 = draw.Color(var_192_6[1], var_192_6[2], var_192_6[3], var_192_14)

					slot_0_95_0(var_192_0, var_192_7, var_192_13, var_192_15, var_192_19)
				end
			end
		end
	end
end

function slot_0_96_0.run_move(arg_193_0)
	slot_0_96_0.update_logic()
end

function slot_0_96_0.run_paint()
	slot_0_96_0.draw()
end

function slot_0_97_0()
	if not UI.theme then
		UI.theme = {}
	end

	UI.theme.accent = UI.cfg.theme_accent or {
		255,
		90,
		130,
		255,
		[0] = nil
	}
	UI.theme.bg = UI.cfg.theme_bg or {
		5,
		5,
		5,
		255,
		[0] = nil
	}
	UI.theme.bg_alt = UI.cfg.theme_bg_alt or {
		8,
		8,
		8,
		255,
		[0] = nil
	}
	UI.theme.text = UI.cfg.theme_text or {
		255,
		255,
		255,
		255,
		[0] = nil
	}
	slot_195_0_0 = UI.theme.accent[1]
	slot_195_1_0 = UI.theme.accent[2]
	slot_195_2_0 = UI.theme.accent[3]
	UI.theme.glow = {
		slot_195_0_0,
		slot_195_1_0,
		slot_195_2_0,
		100,
		[0] = nil
	}
	slot_0_59_0.hovered_tooltip = nil
	slot_195_3_0 = 8 * game.globalVars.m_flAbsFrameTime

	if not UI.anim_progress then
		UI.anim_progress = 0
	end

	if UI.open then
		UI.anim_progress = math.min(1, UI.anim_progress + slot_195_3_0)
	else
		UI.anim_progress = math.max(0, UI.anim_progress - slot_195_3_0)
	end

	if UI.anim_progress <= 0.01 then
		return
	end

	slot_195_4_0 = 1 - math.pow(1 - UI.anim_progress, 3)
	UI.post_draw = nil
	slot_195_5_0 = draw.surface

	if not slot_195_5_0 then
		return
	end

	if UI.font then
		slot_195_5_0.font = UI.font
	end

	slot_195_6_0 = UI.theme

	if not UI.dumped_ctx_input then
		UI.dumped_ctx_input = true
	end

	slot_195_7_0 = slot_0_10_0()
	slot_195_8_0 = slot_0_11_0() or slot_0_60_0
	slot_195_9_0, slot_195_10_0 = slot_0_9_0()
	slot_195_11_0 = 700
	slot_195_12_0 = 500
	slot_195_13_0 = 180

	if UI.cfg.menu_x == nil then
		UI.cfg.menu_x = (slot_195_9_0 - slot_195_11_0) / 2
	end

	if UI.cfg.menu_y == nil then
		UI.cfg.menu_y = (slot_195_10_0 - slot_195_12_0) / 2
	end

	slot_195_14_0 = UI.cfg.menu_x
	slot_195_15_0 = UI.cfg.menu_y
	slot_195_16_0 = slot_195_12_0
	slot_195_17_0 = slot_195_12_0

	if slot_195_7_0 and slot_195_8_0 and UI.open then
		if not UI.dragging and not UI.menu_dragging then
			if slot_195_14_0 <= slot_195_7_0.x and slot_195_7_0.x <= slot_195_14_0 + slot_195_13_0 and slot_195_15_0 <= slot_195_7_0.y and slot_195_7_0.y <= slot_195_15_0 + slot_195_17_0 or slot_195_14_0 <= slot_195_7_0.x and slot_195_7_0.x <= slot_195_14_0 + slot_195_11_0 and slot_195_15_0 <= slot_195_7_0.y and slot_195_7_0.y <= slot_195_15_0 + 50 then
				UI.dragging = true
				UI.drag_off_x = slot_195_7_0.x - slot_195_14_0
				UI.drag_off_y = slot_195_7_0.y - slot_195_15_0
			end
		else
			UI.cfg.menu_x = slot_195_7_0.x - UI.drag_off_x
			UI.cfg.menu_y = slot_195_7_0.y - UI.drag_off_y
			slot_195_14_0, slot_195_15_0 = UI.cfg.menu_x, UI.cfg.menu_y
		end
	else
		UI.dragging = false
	end

	slot_195_18_0 = slot_0_41_0(slot_195_6_0.bg, math.floor(250 * slot_195_4_0))
	slot_195_19_0 = slot_0_41_0(slot_195_6_0.bg, math.floor(255 * slot_195_4_0))
	slot_195_20_0 = slot_0_41_0(slot_195_6_0.control_border, math.floor(100 * slot_195_4_0))

	if UI.cfg.gui_dim then
		slot_195_5_0:AddRectFilled(draw.Rect(0, 0, slot_195_9_0, slot_195_10_0), draw.Color(0, 0, 0, 120))
	end

	slot_195_21_0 = game.globalVars.m_flAbsFrameTime or 0.016

	slot_0_82_0(slot_195_21_0, slot_195_7_0)
	slot_0_83_0()

	if slot_195_4_0 > 0.1 then
		slot_0_44_0(slot_195_14_0, slot_195_15_0, slot_195_11_0, slot_195_16_0, slot_195_6_0.glow, 40 * slot_195_4_0, 8)
	end

	slot_195_5_0:AddRectFilledRounded(draw.Rect(slot_195_14_0, slot_195_15_0, slot_195_14_0 + slot_195_11_0, slot_195_15_0 + slot_195_16_0), slot_195_18_0, 8, 15)
	slot_195_5_0:AddRectFilledRounded(draw.Rect(slot_195_14_0, slot_195_15_0, slot_195_14_0 + slot_195_13_0, slot_195_15_0 + slot_195_16_0), slot_195_19_0, 8, 5)

	slot_195_22_0 = slot_195_14_0 + slot_195_13_0

	slot_195_5_0:AddLine(draw.Vec2(slot_195_22_0, slot_195_15_0 + 10), draw.Vec2(slot_195_22_0, slot_195_15_0 + slot_195_16_0 - 10), draw.Color(255, 255, 255, 25), 1)

	if UI.settings_open then
		slot_0_59_0.clicked = false
		slot_0_59_0.mouse_down = false
	end

	slot_0_61_0(slot_195_14_0, slot_195_15_0, slot_195_7_0, slot_195_8_0)

	if slot_0_36_0.loading.logo_tex then
		slot_195_23_2 = 170

		slot_195_5_0.g:set_texture(slot_0_36_0.loading.logo_tex)

		slot_195_24_1 = slot_195_14_0 + (180 - slot_195_23_2) / 2
		slot_195_25_2 = slot_195_15_0 - 43
		slot_195_26_1 = math.floor(255 * slot_195_4_0)

		slot_195_5_0:AddRectFilled(draw.Rect(slot_195_24_1, slot_195_25_2, slot_195_24_1 + slot_195_23_2, slot_195_25_2 + slot_195_23_2), draw.Color(255, 255, 255, 255))

		if slot_195_5_0.g.set_texture then
			slot_195_5_0.g:set_texture(nil)
		end
	else
		slot_195_23_1 = "SILENTIUM"
		slot_195_5_0.font = UI.font_branding or draw.fonts.gui_bold or draw.fonts.gui_main
		slot_195_25_1 = math.floor(255 * slot_195_4_0)

		slot_195_5_0:AddText(draw.Vec2(slot_195_14_0 + 20, slot_195_15_0 + 25), slot_195_23_1, slot_0_41_0(slot_195_6_0.accent, slot_195_25_1))
	end

	slot_195_5_0.font = UI.font or draw.fonts.gui_main
	slot_195_23_0 = 180
	slot_195_24_0 = slot_195_15_0 + 105
	slot_195_25_0 = 34

	slot_195_5_0:AddText(draw.Vec2(slot_195_14_0 + 20, slot_195_24_0 - 25), "Main", slot_0_41_0(slot_195_6_0.text_dim))

	slot_195_26_0 = {
		ragebot = "ragebot",
		home = "home",
		config = "config",
		antiaim = "anti-aim",
		visuals = "visuals",
		wallbanghelper = "pliers",
		misc = "misc",
		int8_t = nil
	}

	for iter_195_0, iter_195_1 in ipairs(UI.tabs) do
		slot_195_33_1 = slot_195_26_0[iter_195_1:lower():gsub("^%s*(.-)%s*$", "%1")]

		slot_0_73_0(iter_195_1, slot_195_14_0 + 10, slot_195_24_0, slot_195_23_0 - 20, slot_195_25_0, slot_195_33_1)

		slot_195_24_0 = slot_195_24_0 + slot_195_25_0 + 2
	end

	slot_195_27_0 = slot_195_15_0 + slot_195_16_0 - 65

	slot_195_5_0:AddRectFilledRounded(draw.Rect(slot_195_14_0 + 10, slot_195_27_0, slot_195_14_0 + slot_195_23_0 - 10, slot_195_27_0 + 55), draw.Color(255, 255, 255, 3), 6)
	slot_195_5_0:AddLine(draw.Vec2(slot_195_14_0 + 20, slot_195_27_0), draw.Vec2(slot_195_14_0 + slot_195_23_0 - 20, slot_195_27_0), draw.Color(255, 255, 255, 10), 1)

	if not slot_0_46_0(slot_195_14_0 + 22, slot_195_27_0 + 11, 33, 8) then
		slot_195_5_0:AddCircleFilled(draw.Vec2(slot_195_14_0 + 38, slot_195_27_0 + 27), 16, draw.Color(40, 40, 45, 255))
	end

	slot_195_28_0 = slot_0_36_0.username or "User"

	slot_195_5_0:AddText(draw.Vec2(slot_195_14_0 + 60, slot_195_27_0 + 18), slot_195_28_0, slot_0_41_0(slot_195_6_0.text))

	slot_195_29_0 = slot_0_37_0 and slot_0_37_0.currentUserUID and "UID: " .. slot_0_37_0.currentUserUID or "Unlinked"

	slot_195_5_0:AddText(draw.Vec2(slot_195_14_0 + 60, slot_195_27_0 + 34), slot_195_29_0, slot_0_41_0(slot_195_6_0.accent, 150))

	slot_195_30_0 = 18
	slot_195_31_0 = slot_195_14_0 + slot_195_23_0 - 40
	slot_195_32_0 = slot_195_27_0 + 25
	slot_195_33_0 = slot_195_7_0 and slot_195_31_0 <= slot_195_7_0.x and slot_195_7_0.x <= slot_195_31_0 + slot_195_30_0 and slot_195_32_0 <= slot_195_7_0.y and slot_195_7_0.y <= slot_195_32_0 + slot_195_30_0

	if slot_195_33_0 and slot_195_8_0 and not UI.last_click_state then
		UI.settings_open = not UI.settings_open
		UI.last_click_state = true
	end

	if not slot_195_8_0 then
		UI.last_click_state = false
	end

	draw_icon_proc("gear", slot_195_31_0, slot_195_32_0, slot_195_30_0, slot_0_41_0(slot_195_33_0 and {
		255,
		255,
		255,
		255,
		[0] = nil
	} or slot_195_6_0.text_dim))

	slot_195_34_0 = slot_195_14_0 + slot_195_23_0 + 30
	slot_195_35_0 = slot_195_15_0 + 25
	slot_195_36_0 = slot_195_11_0 - slot_195_23_0 - 50
	slot_195_37_0 = slot_195_16_0 - 50

	if UI.tab_anim.progress < 1 then
		UI.tab_anim.progress = math.min(1, UI.tab_anim.progress + 10 * game.globalVars.m_flAbsFrameTime)
	end

	slot_195_38_0 = 1 - math.pow(1 - UI.tab_anim.progress, 3)
	slot_195_39_0 = math.floor(255 * slot_195_38_0 * slot_195_4_0)
	slot_195_40_0 = (1 - slot_195_38_0) * 15
	slot_0_59_0.x = slot_195_34_0
	slot_0_59_0.y = slot_195_35_0 + slot_195_40_0
	slot_195_41_0 = slot_0_59_0.x
	slot_195_42_1 = slot_0_59_0.y
	slot_195_42_0 = slot_195_42_1 + slot_0_85_0(slot_195_41_0, slot_195_42_1, slot_195_36_0 - 100)
	slot_195_44_0 = 16
	slot_195_45_0 = (slot_195_36_0 - slot_195_44_0) / 2
	UI.hovered_group = nil

	if UI.search.active and #UI.search.query > 0 then
		slot_195_46_13 = "Searching for '" .. UI.search.query .. "'..."
		slot_195_47_20 = slot_0_51_0(UI.font, slot_195_46_13)

		slot_195_5_0:AddText(draw.Vec2(slot_195_41_0 + (slot_195_36_0 - slot_195_47_20.x) / 2, slot_195_42_0 + 100), slot_195_46_13, slot_0_41_0(slot_195_6_0.text_dim, 150))
	elseif UI.active_tab == "Home" then
		slot_195_46_12 = slot_195_41_0
		slot_195_47_19 = slot_195_42_0
		slot_195_48_22, slot_195_49_9, slot_195_50_9, slot_195_51_9, slot_195_52_9 = slot_0_71_0(slot_195_46_12, slot_195_47_19, slot_195_45_0, 200, "General", "home", true, false)

		if not slot_195_50_9 then
			slot_0_59_0.x, slot_0_59_0.y = slot_195_48_22, slot_195_49_9

			function slot_195_53_9(arg_196_0, arg_196_1, arg_196_2, arg_196_3)
				local var_196_0 = slot_0_59_0.y
				local var_196_1 = slot_0_41_0(slot_195_6_0.accent, 255)
				local var_196_2 = slot_0_41_0(arg_196_3 or slot_195_6_0.accent, 255)
				local var_196_3 = 24
				local var_196_4 = 13

				draw_icon_proc(arg_196_0, slot_0_59_0.x + 2, var_196_0 + 7, var_196_4, var_196_1)
				slot_195_5_0:AddLine(draw.Vec2(slot_0_59_0.x, var_196_0 + var_196_3 - 2), draw.Vec2(slot_0_59_0.x + slot_195_45_0 - 20, var_196_0 + var_196_3 - 2), draw.Color(255, 255, 255, 12), 1)

				local var_196_5 = arg_196_1 .. ":"

				slot_195_5_0:AddText(draw.Vec2(slot_0_59_0.x + 22, var_196_0 + 5), var_196_5, slot_0_41_0(slot_195_6_0.text_dim))

				local var_196_6 = slot_0_51_0(UI.font, var_196_5).x

				slot_195_5_0:AddText(draw.Vec2(slot_0_59_0.x + 22 + var_196_6 + 6, var_196_0 + 5), tostring(arg_196_2), var_196_2)

				slot_0_59_0.y = slot_0_59_0.y + var_196_3 + 4
			end

			slot_195_53_9("user", "User", slot_0_36_0.username or "User", slot_195_6_0.text)
			slot_195_53_9("build", "Build", "Beta", slot_195_6_0.accent)
			slot_195_53_9("version", "Version", "v1.3", slot_195_6_0.accent)
			slot_195_53_9("refresh", "Last update", "10/4/26", slot_195_6_0.accent)
			slot_195_53_9("skull", "Enemies outlived", slot_0_36_0.enemies_outlived or 0, slot_195_6_0.accent)

			slot_195_54_10 = math.floor(game.globalVars.m_flRealTime - (slot_0_36_0.time_played_start or 0))
			slot_195_55_8 = math.floor(slot_195_54_10 / 3600)
			slot_195_56_8 = math.floor(slot_195_54_10 % 3600 / 60)
			slot_195_57_10 = slot_195_54_10 % 60

			slot_195_53_9("wifi", "Time played", string.format("%02d:%02d:%02d", slot_195_55_8, slot_195_56_8, slot_195_57_10), slot_195_6_0.accent)
			slot_0_72_0(slot_195_49_9, "General")
		end

		slot_195_46_11 = slot_195_41_0 + slot_195_45_0 + slot_195_44_0
		slot_195_47_18 = slot_195_42_0
		slot_195_53_8 = slot_0_37_0
		slot_195_54_9, slot_195_55_7, slot_195_56_7, slot_195_57_9, slot_195_58_7 = slot_0_71_0(slot_195_46_11, slot_195_47_18, slot_195_45_0, 185, "Profile", "user", true, false)

		if not slot_195_56_7 then
			slot_0_59_0.x, slot_0_59_0.y = slot_195_54_9, slot_195_55_7
			slot_195_59_7 = 46
			slot_195_60_7 = slot_0_59_0.x + 2
			slot_195_61_9 = slot_0_59_0.y + 2

			if not slot_0_46_0(slot_195_60_7, slot_195_61_9, slot_195_59_7, 8) then
				slot_195_5_0:AddCircleFilled(draw.Vec2(slot_195_60_7 + slot_195_59_7 / 2, slot_195_61_9 + slot_195_59_7 / 2), slot_195_59_7 / 2, slot_0_41_0(slot_195_6_0.control_bg))
				draw_icon_proc("user", slot_195_60_7 + 12, slot_195_61_9 + 12, 22, slot_0_41_0(slot_195_6_0.accent, 150))
			end

			slot_195_62_8 = "Unlinked"
			slot_195_63_8 = false

			if slot_195_53_8 and slot_195_53_8.currentUserUID then
				slot_195_62_8 = slot_195_53_8.currentUserUID
				slot_195_63_8 = true
			end

			slot_195_64_7 = slot_0_36_0.username or "User"
			slot_195_65_7 = slot_0_51_0(UI.font, slot_195_64_7)

			slot_195_5_0:AddText(draw.Vec2(slot_195_60_7 + slot_195_59_7 + 12, slot_195_61_9 + 4), slot_195_64_7, slot_0_41_0(slot_195_6_0.text))

			if slot_195_63_8 then
				slot_195_66_8 = slot_195_53_8.currentUserRank or "User"
				slot_195_67_4 = slot_0_41_0(slot_195_6_0.accent, 150)

				if slot_195_66_8:lower() == "dev" then
					slot_195_67_4 = draw.Color(255, 80, 80, 150)
				end

				slot_195_5_0:AddText(draw.Vec2(slot_195_60_7 + slot_195_59_7 + 12, slot_195_61_9 + 20), "UID: " .. slot_195_62_8, slot_0_41_0(slot_195_6_0.accent, 150))
				slot_195_5_0:AddText(draw.Vec2(slot_195_60_7 + slot_195_59_7 + 12, slot_195_61_9 + 34), "Rank: " .. slot_195_66_8, slot_0_41_0(slot_195_67_4))
			else
				slot_195_66_7 = "UNLINKED"
				slot_195_67_3 = draw.Color(255, 100, 100, 255)
				slot_195_68_3 = 65

				slot_195_5_0:AddRectFilledRounded(draw.Rect(slot_195_60_7 + slot_195_59_7 + 12, slot_195_61_9 + 22, slot_195_60_7 + slot_195_59_7 + 12 + slot_195_68_3, slot_195_61_9 + 38), slot_0_41_0(slot_195_67_3, 30), 4)
				slot_195_5_0:AddText(draw.Vec2(slot_195_60_7 + slot_195_59_7 + 18, slot_195_61_9 + 24), slot_195_66_7, slot_0_41_0(slot_195_67_3))
			end

			slot_0_59_0.y = slot_0_59_0.y + slot_195_59_7 + 12
			slot_195_66_6 = slot_195_45_0 - 20

			slot_0_87_0("Link Discord Account", slot_0_59_0.x, slot_0_59_0.y, slot_195_66_6, 32, function()
				local var_197_0 = slot_0_30_0()

				UI.last_link_code = "Requesting..."
				UI.link_modal_open = true
				UI.link_modal_can_close = false
				UI.link_code_copied = false

				if slot_0_37_0 and slot_0_37_0.requestLinkCode then
					slot_0_37_0.requestLinkCode(function(arg_198_0)
						if arg_198_0 then
							UI.last_link_code = arg_198_0
						else
							UI.last_link_code = "ERROR"

							notify("Failed to get link code", "error")
						end

						UI.link_modal_can_close = true
					end)
				else
					UI.last_link_code = "ERROR"
					UI.link_modal_can_close = true
				end
			end, nil, nil, nil, "Copy command to clipboard")

			slot_195_67_2 = (slot_195_66_6 - 10) / 2

			slot_0_87_0("Sync UID", slot_0_59_0.x, slot_0_59_0.y, slot_195_67_2, 28, function()
				if slot_0_37_0 and slot_0_37_0.fetchUserUID then
					notify("Syncing UID...", "info")
					slot_0_37_0.fetchUserUID(function(arg_200_0)
						if arg_200_0 then
							notify("UID Synchronized!", "success")
						else
							notify("UID Sync Failed", "error")
						end
					end)
				end
			end, nil, nil, nil, nil, true)
			slot_0_87_0("Test Cloud", slot_0_59_0.x + slot_195_67_2 + 10, slot_0_59_0.y, slot_195_67_2, 28, function()
				if slot_0_37_0 and slot_0_37_0.cloudApiRequest then
					notify("Testing...", "info")
					slot_0_37_0.cloudApiRequest("/api/status", function(arg_202_0)
						if arg_202_0 then
							notify("Connection Success!", "success")
						else
							notify("Connection Failed", "error")
						end
					end)
				end
			end)
			slot_0_72_0(slot_195_55_7, "Profile")
		end

		slot_195_47_17 = slot_195_47_18 + slot_195_58_7 + 10
		slot_195_59_6, slot_195_60_6, slot_195_61_8, slot_195_62_7, slot_195_63_7 = slot_0_71_0(slot_195_46_11, slot_195_47_17, slot_195_45_0, 140, "Social", "social", true, false)

		if not slot_195_61_8 then
			slot_0_59_0.x, slot_0_59_0.y = slot_195_59_6, slot_195_60_6

			function slot_195_64_6(arg_203_0, arg_203_1)
				draw_icon_proc("link", slot_0_59_0.x + 2, slot_0_59_0.y + 2, 13, arg_203_1)
				slot_195_5_0:AddText(draw.Vec2(slot_0_59_0.x + 22, slot_0_59_0.y), arg_203_0, slot_0_41_0(slot_195_6_0.text_dim))

				slot_0_59_0.y = slot_0_59_0.y + 24
			end

			slot_195_64_6("YouTube: @hucfr", draw.Color(255, 50, 50, 255))
			slot_195_64_6("Discord: @h_uc", draw.Color(88, 101, 242, 255))

			slot_0_59_0.y = slot_0_59_0.y + 6
			slot_195_65_6 = slot_195_45_0 - 20

			slot_0_87_0("Discord Server", slot_0_59_0.x, slot_0_59_0.y, slot_195_65_6, 32, function()
				notify("Discord link copied!", "success")
				set_clipboard_safe("https://discord.gg/silentium")
			end)
			slot_0_72_0(slot_195_60_6, "Social")
		end

		slot_195_47_16 = slot_195_47_17 + slot_195_63_7 + 10
	elseif UI.active_tab == "Ragebot" then
		slot_195_46_10 = slot_195_41_0
		slot_195_47_15 = slot_195_42_0
		slot_195_48_21, slot_195_49_8, slot_195_50_8, slot_195_51_8, slot_195_52_8 = slot_0_71_0(slot_195_46_10, slot_195_47_15, slot_195_45_0, 150, "General", "shield")

		if not slot_195_50_8 then
			slot_0_59_0.x, slot_0_59_0.y = slot_195_48_21, slot_195_49_8

			slot_0_62_0("Kill Streak", "killstreak")
			slot_0_65_0("Jumpscout", "jumpscout_enabled", {
				{
					label = "Multipoint",
					type = "slider",
					min = 0,
					max = 100,
					var = "jumpscout_multipoint",
					[0] = nil
				},
				{
					label = "Force Shoot",
					type = "checkbox",
					var = "jumpscout_force_shoot",
					["sol.]#iY"] = nil
				},
				{
					label = "Hitchance",
					type = "slider",
					min = 0,
					max = 100,
					var = "jumpscout_hitchance",
					misc_r8_disable_right = nil,
					show = function()
						return not UI.cfg.jumpscout_force_shoot
					end
				}
			}, nil, "Highly accurate jump-scout assistant", true)
			slot_0_62_0("Double Tap on Knife", "rage_knife_dt", "Automatically enables Double Tap when holding a knife")
			slot_0_62_0("Force Shoot on Crouch", "rage_force_shoot_crouch", "Automatically enables Force Shoot while you are crouching")
			slot_0_72_0(slot_195_49_8, "General")
		end

		slot_195_47_14 = slot_195_47_15 + slot_195_52_8 + 10
		slot_195_53_7, slot_195_54_8, slot_195_55_6, slot_195_56_6, slot_195_57_8 = slot_0_71_0(slot_195_46_10, slot_195_47_14, slot_195_45_0, 280, "AI Peek", "target")

		if not slot_195_55_6 then
			slot_0_59_0.x, slot_0_59_0.y = slot_195_53_7, slot_195_54_8

			slot_0_65_0("AI Peek Enable", "ai_peek_enabled", {
				{
					label = "Keybind",
					type = "hotkey",
					var = "ai_peek_key",
					[0] = nil
				}
			}, nil, "Fully autonomous peek / retract system", true)
			slot_0_62_0("Debug Mode", "ai_peek_debug", "Enable all debug output", true)
			slot_0_62_0("Console Logs", "ai_peek_console_debug", "Print decision log to console", true)
			slot_0_62_0("Debug Visuals", "ai_peek_visual_debug", "draw debug HUD and world markers", true)
			slot_0_62_0("Auto Freestanding", "ai_peek_freestanding", "Automatically uses manual AA/Freestanding while peeking", true)
			slot_0_66_0("Multipoint Scale", "ai_peek_multipoint", 0, 100, "%", true)
			slot_0_62_0("Jump Scout", "ai_peek_jumpscout", "Enables jump-peek logic for SSG-08", true)
			slot_0_62_0("Calibration Logs", "ai_peek_calibrate", "Print jump calibration telemetry", true)
			slot_0_66_0("Safe Point Distance", "ai_peek_safedist", 10, 500, nil, true)
			slot_0_72_0(slot_195_54_8, "AI Peek")
		end

		slot_195_46_9 = slot_195_41_0 + slot_195_45_0 + slot_195_44_0
		slot_195_47_13 = slot_195_42_0
		slot_195_58_6, slot_195_59_5, slot_195_60_5, slot_195_61_7, slot_195_62_6 = slot_0_71_0(slot_195_46_9, slot_195_47_13, slot_195_45_0, 350, "Accuracy", "crosshair")

		if not slot_195_60_5 then
			slot_0_59_0.x, slot_0_59_0.y = slot_195_58_6, slot_195_59_5
			slot_195_63_6 = {
				"Global",
				"Auto",
				"Scout",
				"AWP",
				"Heavy Pistols",
				"Pistols",
				[0] = nil
			}
			slot_195_64_5 = {
				AWP = "awp",
				Global = "global",
				Scout = "scout",
				Auto = "auto",
				["Heavy Pistols"] = "hpistol",
				Pistols = "pistol",
				[0] = nil
			}

			slot_0_68_0("Weapon Group", "acc_weapon_group", slot_195_63_6, "Select which weapon group to configure")

			slot_195_65_5 = UI.cfg.acc_weapon_group or "Global"
			slot_195_66_5 = slot_195_64_5[slot_195_65_5] or "global"
			slot_0_59_0.y = slot_0_59_0.y + 10

			slot_0_70_0()

			slot_0_59_0.y = slot_0_59_0.y + 10

			slot_0_62_0("Smart Delay Shot", "acc_delay_lethal_" .. slot_195_66_5, "Automatically manages Peek/Unduck delay based on target health")
			slot_0_65_0("Body Aim on Health", "acc_baim_hp_enabled_" .. slot_195_66_5, {
				{
					label = "Threshold",
					type = "slider",
					min = 1,
					max = 100,
					[0] = nil,
					var = "acc_baim_hp_val_" .. slot_195_66_5
				}
			}, nil, nil)

			slot_0_59_0.y = slot_0_59_0.y + 10

			slot_0_70_0()

			slot_0_59_0.y = slot_0_59_0.y + 10

			slot_0_65_0("Auto Pointscale", "acc_ap_enabled_" .. slot_195_66_5, {
				{
					label = "Hotkey",
					type = "hotkey",
					[0] = nil,
					var = "acc_ap_key_" .. slot_195_66_5
				},
				{
					label = "Max Scale",
					type = "slider",
					min = 1,
					max = 100,
					[0] = nil,
					var = "acc_ap_max_" .. slot_195_66_5
				},
				{
					label = "Inaccuracy Factor",
					type = "slider",
					min = 1,
					max = 100,
					[0] = nil,
					var = "acc_ap_inc_" .. slot_195_66_5
				}
			}, nil, "Scales pointscale based on spread for " .. slot_195_65_5, true)
			slot_0_65_0("Dynamic Hitchance", "acc_dy_hc_enabled_" .. slot_195_66_5, {
				{
					label = "Hotkey",
					type = "hotkey",
					[0] = nil,
					var = "acc_dy_hc_key_" .. slot_195_66_5
				},
				{
					label = "Min HC",
					type = "slider",
					min = 1,
					max = 100,
					[0] = nil,
					var = "acc_dy_hc_min_" .. slot_195_66_5
				},
				{
					label = "Max HC",
					type = "slider",
					min = 1,
					max = 100,
					[0] = nil,
					var = "acc_dy_hc_max_" .. slot_195_66_5
				},
				{
					label = "Distance Factor",
					type = "slider",
					min = 500,
					max = 5000,
					[0] = nil,
					var = "acc_dy_hc_dist_" .. slot_195_66_5
				}
			}, nil, "Scales hitchance based on distance for " .. slot_195_65_5, true)
			slot_0_65_0("Lethal Multi-Points", "acc_lethal_mp_enabled_" .. slot_195_66_5, {
				{
					label = "HP Threshold",
					type = "slider",
					min = 1,
					max = 100,
					[0] = nil,
					var = "acc_lethal_mp_hp_" .. slot_195_66_5
				},
				{
					label = "Pointscale",
					type = "slider",
					min = 1,
					max = 100,
					[0] = nil,
					var = "acc_lethal_mp_val_" .. slot_195_66_5
				}
			}, nil, "Automatically increases pointscale on lethal targets", true)
			slot_0_72_0(slot_195_59_5, "Accuracy")
		end

		slot_195_47_12 = slot_195_47_13 + slot_195_62_6 + 10
	elseif UI.active_tab == "Antiaim" then
		slot_195_46_8 = (slot_195_36_0 - slot_195_44_0) / 2
		slot_195_47_11 = slot_195_41_0
		slot_195_48_20 = slot_195_42_0
		slot_195_49_7, slot_195_50_7, slot_195_51_7, slot_195_52_7, slot_195_53_6 = slot_0_71_0(slot_195_47_11, slot_195_48_20, slot_195_46_8, 150, "AA Automation", "gear")

		if not slot_195_51_7 then
			slot_0_59_0.x, slot_0_59_0.y = slot_195_49_7, slot_195_50_7

			slot_0_62_0("Disable AA on Round End", "aa_disable_round_end")
			slot_0_62_0("Disable AA when No Enemies", "aa_disable_no_enemies")
			slot_0_68_0("AA Victory Mode", "aa_victory_mode", {
				"Disable",
				"Spin",
				[0] = nil
			})
			slot_0_68_0("Default Pitch", "aa_default_pitch", {
				"None",
				"Down",
				"Up",
				"Zero",
				"Random",
				[0] = nil
			})
			slot_0_65_0("Random Pitch on Shoot", "aa_pitch_on_shot", {
				{
					label = "Enable for AWP",
					var = "aa_pitch_on_shot_awp",
					[0] = nil
				},
				{
					label = "Enable for Scout",
					var = "aa_pitch_on_shot_ssg08",
					[0] = nil
				}
			}, nil, "Briefly offsets pitch to random after firing with snipers")
			slot_0_72_0(slot_195_50_7, "AA Automation")
		end

		slot_195_48_19 = slot_195_48_20 + slot_195_53_6 + 10
		slot_195_47_10 = slot_195_41_0 + slot_195_46_8 + slot_195_44_0
		slot_195_48_18 = slot_195_42_0
		slot_195_54_7, slot_195_55_5, slot_195_56_5, slot_195_57_7, slot_195_58_5 = slot_0_71_0(slot_195_47_10, slot_195_48_18, slot_195_46_8, 150, "AA Features", "shield")

		if not slot_195_56_5 then
			slot_0_59_0.x, slot_0_59_0.y = slot_195_54_7, slot_195_55_5

			slot_0_62_0("Avoid BackStab", "aa_avoid_backstab", "Automatically faces enemies approaching with a knife")

			if is_enabled("aa_avoid_backstab") then
				slot_0_66_0("Max Distance", "aa_avoid_backstab_dist", 50, 500, "Distance to trigger avoid backstab")
			end

			slot_0_65_0("Freestanding", "aa_freestanding", {
				{
					label = "Key",
					type = "hotkey",
					var = "aa_freestanding_key",
					[0] = nil
				},
				{
					label = "Visualize",
					type = "checkbox",
					var = "aa_freestanding_visualize",
					[0] = nil
				}
			}, nil, "Automatically uses Manual AA Left/Right based on nearest walls.", true)
			slot_0_62_0("Instant Manual", "aa_instant_manual", "Enables instant manual AA (No delays)")
			slot_0_62_0("Suppress Breathing Animations", "aa_suppress_breathing", "Suppress legs shuffle and breathing animations")
			slot_0_62_0("Safe Head", "safe_head", "Forces a short crouch before jumping to protect head hitbox")
			slot_0_72_0(slot_195_55_5, "AA Features")
		end

		slot_195_48_17 = slot_195_48_18 + slot_195_58_5 + 10
		slot_195_59_4, slot_195_60_4, slot_195_61_6, slot_195_62_5, slot_195_63_5 = slot_0_71_0(slot_195_47_10, slot_195_48_17, slot_195_46_8, 100, "Misc", "plus")

		if not slot_195_61_6 then
			slot_0_59_0.x, slot_0_59_0.y = slot_195_59_4, slot_195_60_4

			slot_0_62_0("Visualize Fake Duck", "visualize_fakeduck", "Simulates camera bobbing while fakeducking")
			slot_0_66_0("Speed", "fakeduck_speed", 1, 30, "Speed of the camera bobbing animation")
			slot_0_72_0(slot_195_60_4, "Misc")
		end
	elseif UI.active_tab == "Visuals" then
		slot_195_46_7 = (slot_195_36_0 - slot_195_44_0) / 2
		slot_195_47_9 = slot_195_41_0
		slot_195_48_16 = slot_195_42_0
		slot_195_49_6, slot_195_50_6, slot_195_51_6, slot_195_52_6, slot_195_53_5 = slot_0_71_0(slot_195_47_9, slot_195_48_16, slot_195_46_7, 180, "Interface", "dashboard")

		if not slot_195_51_6 then
			slot_0_59_0.x, slot_0_59_0.y = slot_195_49_6, slot_195_50_6

			slot_0_65_0("Watermark", "watermark_ws", {
				{
					label = "Show Logo",
					var = "wm_logo",
					[0] = nil
				},
				{
					label = "Show Username",
					var = "wm_user",
					[0] = nil
				},
				{
					label = "Show Build",
					var = "wm_build",
					[0] = nil
				},
				{
					label = "Show Ping",
					var = "wm_ping",
					[0] = nil
				},
				{
					label = "Show FPS",
					var = "wm_fps",
					[0] = nil
				},
				{
					label = "Show Time",
					var = "wm_time",
					[0] = nil
				}
			}, nil, "Customizable screen overlay with system info")
			slot_0_62_0("Modern Netgraph", "netgraph_ws", "Sleek, accented draggable network stats panel")
			slot_0_62_0("Hotkey List", "keybinds_ws", "Show a draggable list of your current keybinds")
			slot_0_62_0("On Screen Logs", "hitlogs_ws", "Show detailed hit information on screen")
			slot_0_62_0("Silentium Hitlog", "silentium_hitlog_enabled", "Displays sleek hit information in a custom minimalist style")
			slot_0_65_0("Bottom Screen Watermark", "bottom_ws_enabled", {
				{
					label = "Style",
					type = "combo",
					var = "bottom_ws_style",
					[0] = nil,
					options = {
						"Classic",
						"Premium",
						[0] = nil
					}
				},
				{
					label = "Position (Premium)",
					type = "combo",
					var = "ls_indicator_pos",
					[0] = nil,
					options = {
						"Left",
						"Center",
						"Custom",
						[0] = nil
					},
					show = function()
						return UI.cfg.bottom_ws_style == "Premium" or UI.cfg.bottom_ws_style == 2
					end
				},
				{
					label = "Accent Color (Premium)",
					type = "Color",
					var = "ls_indicator_color",
					[0] = nil,
					show = function()
						return UI.cfg.bottom_ws_style == "Premium" or UI.cfg.bottom_ws_style == 2
					end
				},
				{
					label = "Effect (Classic)",
					type = "combo",
					var = "watermark_effect",
					[0] = nil,
					options = {
						"None",
						"Decrypt",
						"Slide",
						"Flicker",
						"Stars",
						[0] = nil
					},
					show = function()
						return UI.cfg.bottom_ws_style == "Classic" or UI.cfg.bottom_ws_style == 1 or UI.cfg.bottom_ws_style == nil
					end
				},
				{
					label = "Watermark Text (Classic)",
					type = "text",
					var = "watermark_text",
					[0] = nil,
					show = function()
						return UI.cfg.bottom_ws_style == "Classic" or UI.cfg.bottom_ws_style == 1 or UI.cfg.bottom_ws_style == nil
					end
				},
				{
					label = "Color (Classic)",
					type = "Color",
					var = "watermark_color",
					[0] = nil,
					show = function()
						return UI.cfg.bottom_ws_style == "Classic" or UI.cfg.bottom_ws_style == 1 or UI.cfg.bottom_ws_style == nil
					end
				}
			}, nil, "Premium minimalist bottom screen watermark")
			slot_0_62_0("Bomb Timer", "bomb_timer", "Draggable theme-matching bomb & defuse timer")
			slot_0_72_0(slot_195_50_6, "Interface")
		end

		slot_195_48_15 = slot_195_48_16 + slot_195_53_5 + 10
		slot_195_54_6, slot_195_55_4, slot_195_56_4, slot_195_57_6, slot_195_58_4 = slot_0_71_0(slot_195_47_9, slot_195_48_15, slot_195_46_7, 150, "Indicators", "atom")

		if not slot_195_56_4 then
			slot_0_59_0.x, slot_0_59_0.y = slot_195_54_6, slot_195_55_4

			slot_0_65_0("Crosshair Indicators", "crosshair_indicators", {
				{
					label = "Vertical Offset",
					type = "slider",
					min = -100,
					max = 100,
					var = "crosshair_indicators_y",
					[0] = nil
				}
			}, nil, "Display situational markers under your crosshair")
			slot_0_65_0("Manual Arrows", "manual_arrows", {
				{
					label = "Horizontal Offset",
					type = "slider",
					min = -50,
					max = 150,
					var = "manual_arrows_x",
					[0] = nil
				}
			}, "manual_arrows_color", "Visual indicators for your manual anti-aim direction")
			slot_0_62_0("Apex Visualizer", "jumpscout_vis_enabled", "Displays a premium badge when at your jump's peak", true)
			slot_0_62_0("Side Indicators (GS Style)", "gs_indicators", "Display minimalist indicators on the left side")
			slot_0_65_0("Min Damage Indicator", "dmg_indicator", {
				{
					label = "Side",
					type = "combo",
					var = "dmg_indicator_side",
					[0] = nil,
					options = {
						"Left",
						"Right",
						[0] = nil
					}
				},
				{
					label = "Mode",
					type = "combo",
					var = "dmg_indicator_scoped",
					[0] = nil,
					options = {
						"Always",
						"Only Scoped",
						[0] = nil
					}
				}
			}, "dmg_indicator_color", "Display current minimum damage next to crosshair")
			slot_0_72_0(slot_195_55_4, "Indicators")
		end

		slot_195_48_14 = slot_195_48_15 + slot_195_58_4 + 10
		slot_195_47_8 = slot_195_41_0 + slot_195_46_7 + slot_195_44_0
		slot_195_48_13 = slot_195_42_0
		slot_195_59_3, slot_195_60_3, slot_195_61_5, slot_195_62_4, slot_195_63_4 = slot_0_71_0(slot_195_47_8, slot_195_48_13, slot_195_46_7, 150, "Movement", "movement")

		if not slot_195_61_5 then
			slot_0_59_0.x, slot_0_59_0.y = slot_195_59_3, slot_195_60_3

			slot_0_63_0("Movement Trails", "trails", "trails_color", "draw a smooth, flowing path behind your player model")
			slot_0_65_0("Jump Circles", "jump_circles_enabled", {
				{
					label = "Size",
					type = "slider",
					min = 5,
					max = 50,
					var = "jump_circles_size",
					[0] = nil
				},
				{
					label = "Lifetime",
					type = "slider",
					min = 0.5,
					max = 5,
					var = "jump_circles_lifetime",
					step = 0.1,
					[0] = nil
				}
			}, "jump_circles_color", "Renders a fading circle on the ground when you jump")
			slot_0_62_0("Velocity Meter", "velocity", "Real-time display of your current movement speed")
			slot_0_62_0("Slowed Down Indicator", "slowed_indicator", "Shows speed reduction percentage")
			slot_0_72_0(slot_195_60_3, "Movement")
		end

		slot_195_48_12 = slot_195_48_13 + slot_195_63_4 + 10
		slot_195_64_4, slot_195_65_4, slot_195_66_4, slot_195_67_1, slot_195_68_2 = slot_0_71_0(slot_195_47_8, slot_195_48_12, slot_195_46_7, 320, "World ESP", "globe")

		if not slot_195_66_4 then
			slot_0_59_0.x, slot_0_59_0.y = slot_195_64_4, slot_195_65_4

			slot_0_65_0("Impact Sparks", "sparks_enabled", {
				{
					label = "Count",
					type = "slider",
					min = 1,
					max = 50,
					var = "sparks_count",
					[0] = nil
				},
				{
					label = "Lifetime",
					type = "slider",
					min = 0.2,
					max = 4,
					var = "sparks_lifetime",
					step = 0.1,
					[0] = nil
				},
				{
					label = "Velocity",
					type = "slider",
					min = 50,
					max = 1500,
					var = "sparks_velocity",
					[0] = nil
				},
				{
					label = "Size",
					type = "slider",
					min = 0.5,
					max = 10,
					var = "sparks_size",
					step = 0.1,
					[0] = nil
				},
				{
					label = "Length",
					type = "slider",
					min = 0.1,
					max = 5,
					var = "sparks_trail_length",
					step = 0.1,
					[0] = nil
				}
			}, "sparks_color", "Creates custom particle effects at the point of impact")
			slot_0_65_0("Soul Particles", "soul_particles", {
				{
					label = "Count",
					type = "slider",
					min = 10,
					max = 200,
					var = "soul_particles_count",
					[0] = nil
				},
				{
					label = "Lifetime",
					type = "slider",
					min = 0.5,
					max = 3,
					var = "soul_particles_lifetime",
					step = 0.1,
					[0] = nil
				}
			}, "soul_particles_color", "Rising misty soul cloud on enemy death")
			slot_0_65_0("Floating Damage", "floating_damage", {
				{
					label = "Style",
					type = "combo",
					var = "floating_damage_style",
					[0] = nil,
					options = {
						"Classic",
						"Enhanced",
						[0] = nil
					}
				}
			}, "floating_damage_color", "Creates RPG-style rising damage numbers")
			slot_0_65_0("World Hitmarker", "hitmarker_ws", {
				{
					label = "Hitmarker Style",
					type = "combo",
					var = "hitmarker_style",
					[0] = nil,
					options = {
						"Aesthetic",
						"X",
						[0] = nil
					}
				},
				{
					label = "Hitmarker Duration",
					type = "slider",
					min = 0.1,
					max = 5,
					var = "hitmarker_lifetime",
					step = 0.1,
					[0] = nil
				}
			}, "hitmarker_color", "Displays a premium 3D hitmarker in the game world")
			slot_0_65_0("Custom Scope Lines", "custom_scope", {
				{
					label = "Initial Pos",
					type = "slider",
					min = 0,
					max = 500,
					var = "scope_gap",
					[0] = nil
				},
				{
					label = "Offset",
					type = "slider",
					min = 0,
					max = 500,
					var = "scope_length",
					[0] = nil
				},
				{
					label = "Thickness",
					type = "slider",
					min = 1,
					max = 10,
					var = "scope_thickness",
					[0] = nil
				},
				{
					label = "Rotation",
					type = "slider",
					min = 0,
					max = 360,
					var = "scope_rotation",
					[0] = nil
				},
				{
					label = "T-Style",
					type = "checkbox",
					var = "scope_t_style",
					[0] = nil
				},
				{
					label = "Invert",
					type = "checkbox",
					var = "scope_invert",
					[0] = nil
				},
				{
					label = "Animation",
					type = "checkbox",
					var = "scope_animation",
					[0] = nil
				},
				{
					label = "Rotate",
					type = "checkbox",
					var = "scope_auto_rotate",
					[0] = nil
				},
				{
					label = "Color 2",
					type = "Color",
					var = "scope_line_color_2",
					[0] = nil
				}
			}, "scope_line_color", "draw highly customizable scope lines")
			slot_0_65_0("ESP Flags", "esp_flags_enabled", {
				{
					label = "Godmode",
					var = "esp_flag_godmode",
					[0] = nil
				},
				{
					label = "Lethal",
					var = "esp_flag_lethal",
					[0] = nil
				},
				{
					label = "Slowed",
					var = "esp_flag_slowed",
					[0] = nil
				},
				{
					label = "Reloading",
					var = "esp_flag_reloading",
					[0] = nil
				},
				{
					label = "No Shoot",
					var = "esp_flag_noshoot",
					[0] = nil
				}
			}, "esp_flags_color", "Situational markers above enemy heads")
			slot_0_65_0("Impact Visualizer", "misc_impact_viz_enabled", {
				{
					label = "Duration",
					type = "slider",
					min = 0.1,
					max = 5,
					var = "misc_impact_viz_duration",
					step = 0.1,
					[0] = nil
				}
			}, "misc_impact_viz_color", "Render glow effects at bullet impact locations")
			slot_0_65_0("Scoping Animation", "viewmodel_scope_anim", {
				{
					label = "Animation Speed",
					type = "slider",
					min = 1,
					max = 30,
					var = "viewmodel_scope_speed",
					[0] = nil
				},
				{
					label = "Offset X",
					type = "slider",
					min = -10,
					max = 10,
					var = "viewmodel_scope_offset_x",
					step = 0.1,
					[0] = nil
				},
				{
					label = "Offset Y",
					type = "slider",
					min = -10,
					max = 10,
					var = "viewmodel_scope_offset_y",
					step = 0.1,
					[0] = nil
				},
				{
					label = "Offset Z",
					type = "slider",
					min = -10,
					max = 10,
					var = "viewmodel_scope_offset_z",
					step = 0.1,
					[0] = nil
				}
			}, nil, "Tweaks viewmodel offsets when scoping for a premium look")
			slot_0_72_0(slot_195_65_4, "World ESP")
		end
	elseif UI.active_tab == "Misc" then
		slot_195_46_6 = (slot_195_36_0 - slot_195_44_0) / 2
		slot_195_47_7 = slot_195_41_0
		slot_195_48_11 = slot_195_42_0
		slot_195_49_5, slot_195_50_5, slot_195_51_5, slot_195_52_5, slot_195_53_4 = slot_0_71_0(slot_195_47_7, slot_195_48_11, slot_195_46_6, 250, "Utility", "gear")

		if not slot_195_51_5 then
			slot_0_59_0.x, slot_0_59_0.y = slot_195_49_5 + 5, slot_195_50_5

			slot_0_65_0("Hit Sound", "misc_hitsound_enabled", {
				{
					label = "Sound",
					type = "combo",
					var = "misc_hitsound_file",
					[0] = nil,
					options = {
						"Agpa 1",
						"Agpa 2",
						"Aimbooster",
						"Arena Switch",
						"Bameware",
						"Bell",
						"Bonk",
						"Bubble",
						"Click",
						"COD",
						"Killcard",
						"Minecraft Hit",
						"Minecraft XP",
						"Rust Headshot",
						"Satisfying",
						"Stony",
						"Trident",
						"Water Drop",
						"Zelda",
						[0] = nil
					}
				},
				{
					label = "Volume",
					type = "slider",
					min = 1,
					max = 100,
					var = "misc_hitsound_vol",
					[0] = nil
				}
			}, nil, "Play a sound when you hit an enemy")
			slot_0_62_0("Quick Switch", "misc_quickswitch", "Automatically swaps to knife and back after firing a primary weapon")
			slot_0_62_0("SSG-08 Always Scoped", "ssg_always_scoped", "Forces the SSG-08 (Scout) to remain zoomed in at all times")
			slot_0_62_0("Quick Reload", "misc_quick_reload", "Automatically performs a quick switch to skip reload animations", true)
			slot_0_62_0("Zeus Quick Switch", "misc_zeus_quickswitch", "Automatically switches to primary weapon after a Zeus kill")
			slot_0_65_0("Custom 3rd Person Dist", "visuals_custom_thirdperson_enabled", {
				{
					label = "Distance",
					type = "slider",
					min = 30,
					max = 180,
					var = "visuals_custom_thirdperson_dist",
					[0] = nil
				}
			}, nil, "Override Fatality's thirdperson distance (allows < 40)")
			slot_0_62_0("Disable R8 Right Click", "misc_r8_disable_right", "Prevents accidental firing/cocking when using the R8 Revolver")
			slot_0_62_0("Quick Ladder", "misc_quickladder", "Optimizes movement on ladders")
			slot_0_65_0("Knife on Opposite Hand", "visuals_lefthand_knife", {
				{
					label = "Main Hand",
					type = "combo",
					var = "misc_knife_main_hand",
					[0] = nil,
					options = {
						"Right",
						"Left",
						[0] = nil
					}
				}
			}, nil, "Switch to the opposite hand when holding a knife")
			slot_0_65_0("Drop Grenades", "misc_drop_nades", {
				{
					label = "Drop All",
					type = "hotkey",
					var = "misc_drop_all_key",
					["Max HC"] = nil
				},
				{
					label = "Drop HE",
					type = "hotkey",
					var = "misc_drop_he_key",
					[0] = nil
				},
				{
					label = "Drop Molly",
					type = "hotkey",
					var = "misc_drop_molly_key",
					[0] = nil
				},
				{
					label = "Drop Smoke",
					type = "hotkey",
					var = "misc_drop_smoke_key",
					[0] = nil
				}
			}, nil, "Quick drop grenades with binds")
			slot_0_65_0("Animated Clantag", "misc_clantag", {
				{
					label = "Style",
					type = "combo",
					var = "misc_clantag_style",
					[0] = nil,
					options = {
						"Classic",
						"Slide",
						"Stars",
						"Flicker",
						"Static",
						[0] = nil
					}
				},
				{
					label = "Speed",
					type = "slider",
					min = 5,
					max = 50,
					var = "misc_clantag_speed",
					["Show Username"] = nil
				}
			}, nil, "Prefixes your name with various animated 'silentium' styles")
			slot_0_65_0("Auto Smoke", "misc_auto_smoke", {
				{
					label = "Always On",
					type = "checkbox",
					var = "misc_auto_smoke_always",
					[0] = nil
				},
				{
					label = "Hotkey",
					type = "hotkey",
					var = "misc_auto_smoke_key",
					[0] = nil
				}
			}, nil, "Automatically extinguishes nearby molotovs with a smoke grenade", true)
			slot_0_72_0(slot_195_50_5, "Utility")
		end

		slot_195_48_10 = slot_195_48_11 + slot_195_53_4 + 10
		slot_195_47_6 = slot_195_41_0 + slot_195_46_6 + slot_195_44_0
		slot_195_48_9 = slot_195_42_0
		slot_195_54_5, slot_195_55_3, slot_195_56_3, slot_195_57_5, slot_195_58_3 = slot_0_71_0(slot_195_47_6, slot_195_48_9, slot_195_46_6, 150, "Automation", "atom")

		if not slot_195_56_3 then
			slot_0_59_0.x, slot_0_59_0.y = slot_195_54_5 + 5, slot_195_55_3

			slot_0_62_0("Enable Console Logs", "hitlogs_console", "Print hit/miss info to console")
			slot_0_62_0("Auto Connect", "misc_auto_connect", "Automatically connect to server IPs copied to clipboard")
			slot_0_65_0("Edge Stop", "misc_edge_stop", {
				{
					label = "Hotkey",
					type = "hotkey",
					var = "misc_edge_stop_key",
					[0] = nil
				},
				{
					label = "Mode",
					type = "combo",
					var = "misc_edge_stop_mode",
					[0] = nil,
					options = {
						"Hold",
						"Toggle",
						"Always",
						[0] = nil
					}
				}
			}, nil, "Prevents falling off edges using early raytracing and slowwalk", true)
			slot_0_62_0("Sub-Tick Autostop", "misc_subtick_autostop", "Zero-momentum stopping for maximum precision", true)
			slot_0_62_0("Air Brake", "air_brake", "Instantly stops horizontal momentum when releasing WASD in mid-air")
			slot_0_65_0("Auto Defuse", "misc_auto_defuse", {
				{
					label = "Distance",
					type = "slider",
					min = 50,
					max = 250,
					var = "misc_auto_defuse_dist",
					[0] = nil
				}
			}, nil, "Automatically defuse bombs within range", true)
			slot_0_62_0("On Land Auto Stop", "misc_landing_autostop", "Automatically stops movement upon landing", true)
			slot_0_72_0(slot_195_55_3, "Automation")
		end

		slot_195_48_8 = slot_195_48_9 + slot_195_58_3 + 10
	elseif UI.active_tab == "WallbangHelper" then
		slot_195_46_5 = (slot_195_36_0 - slot_195_44_0) / 2
		slot_195_47_5 = slot_195_41_0
		slot_195_48_7 = slot_195_42_0
		slot_195_49_4, slot_195_50_4, slot_195_51_4, slot_195_52_4, slot_195_53_3 = slot_0_71_0(slot_195_47_5, slot_195_48_7, slot_195_46_5, 150, "Wallbang Helper", "gear")

		if not slot_195_51_4 then
			slot_0_59_0.x, slot_0_59_0.y = slot_195_49_4, slot_195_50_4

			function slot_195_54_4()
				return UI.cfg.wb_enable
			end

			slot_0_62_0("Enable Wallbang Helper", "wb_enable", "Visualize and manage wallbang spots", true)
			slot_0_66_0("Render Distance (Normal)", "wb_distance_normal", 100, 5000, "Distance to render markers in normal mode", true)
			slot_0_66_0("Render Distance (Edit)", "wb_distance_edit", 100, 10000, "Distance to render markers in edit mode", true)
			slot_0_62_0("Remove Lines", "wb_remove_lines", "Hide the connector lines between standing and aiming spots", true)
			slot_0_72_0(slot_195_50_4, "Settings")
		end

		slot_195_48_6 = slot_195_48_7 + slot_195_53_3 + 10
		slot_195_47_4 = slot_195_41_0 + slot_195_46_5 + slot_195_44_0
		slot_195_48_5 = slot_195_42_0
		slot_195_54_3, slot_195_55_2, slot_195_56_2, slot_195_57_4, slot_195_58_2 = slot_0_71_0(slot_195_47_4, slot_195_48_5, slot_195_46_5, 400, "Editor", "pliers")

		if not slot_195_56_2 then
			slot_0_59_0.x, slot_0_59_0.y = slot_195_54_3, slot_195_55_2

			slot_0_62_0("Edit Mode", "wb_edit_mode", "Enable world editor for spots", true, true, wb_show)

			if UI.cfg.wb_enable and UI.cfg.wb_edit_mode then
				slot_195_59_2 = game.globalVars.mapName
				slot_195_60_2 = {
					"None",
					[0] = nil
				}

				if slot_195_59_2 and slot_195_59_2 ~= "" and slot_0_91_0.positions_by_map[slot_195_59_2] then
					slot_195_61_4 = {}

					for iter_195_2, iter_195_3 in pairs(slot_0_91_0.positions_by_map[slot_195_59_2].pos) do
						table.insert(slot_195_61_4, {
							id = tonumber(iter_195_2),
							name = iter_195_3.name or "Spot #" .. iter_195_2
						})
					end

					table.sort(slot_195_61_4, function(arg_212_0, arg_212_1)
						return arg_212_0.id < arg_212_1.id
					end)

					for iter_195_4, iter_195_5 in ipairs(slot_195_61_4) do
						table.insert(slot_195_60_2, iter_195_5.id .. ": " .. iter_195_5.name)
					end
				end

				slot_0_68_0("Select Spot", "wb_spot_selector", slot_195_60_2, "Choose a standing spot to manage", true, true)
				slot_0_86_0(slot_0_59_0.x, slot_0_59_0.y, slot_195_46_5 - 20, "Spot Name...", "wb_spot_name_editor", "wb_name_active", true, true)

				slot_195_61_3 = (slot_195_46_5 - 30) / 2

				slot_0_87_0("Add Spot", slot_0_59_0.x, slot_0_59_0.y, slot_195_61_3, 28, slot_0_91_0.add_standing_spot, nil, true, true, nil, true)
				slot_0_87_0("Update Spot", slot_0_59_0.x + slot_195_61_3 + 10, slot_0_59_0.y, slot_195_61_3, 28, slot_0_91_0.update_standing_spot, nil, true, true)
				slot_0_87_0("Delete Spot", slot_0_59_0.x, slot_0_59_0.y, slot_195_46_5 - 20, 28, slot_0_91_0.delete_standing_spot, nil, true, true)

				slot_0_59_0.y = slot_0_59_0.y + 15

				slot_195_5_0:AddText(draw.Vec2(slot_0_59_0.x, slot_0_59_0.y), "Aim Spots", slot_0_41_0(UI.theme.text_dim))

				slot_0_59_0.y = slot_0_59_0.y + 20
				slot_195_62_3 = {
					"None",
					[0] = nil
				}
				slot_195_63_3 = slot_0_91_0.get_selected_spot_id()

				if slot_195_63_3 and slot_195_59_2 and slot_0_91_0.positions_by_map[slot_195_59_2].pos[slot_195_63_3] then
					slot_195_64_3 = slot_0_91_0.positions_by_map[slot_195_59_2].pos[slot_195_63_3]

					if slot_195_64_3.aim_spots then
						for iter_195_6, iter_195_7 in ipairs(slot_195_64_3.aim_spots) do
							table.insert(slot_195_62_3, "Aim Spot #" .. iter_195_6)
						end
					end
				end

				slot_0_68_0("Select Aim Spot", "wb_aim_spot_selector", slot_195_62_3, "Choose an aim spot for the current spot", true, true)
				slot_0_86_0(slot_0_59_0.x, slot_0_59_0.y, slot_195_46_5 - 20, "Instructions...", "wb_aim_spot_instructions", "wb_instr_active", true, true)
				slot_0_87_0("Add Aim Point", slot_0_59_0.x, slot_0_59_0.y, slot_195_61_3, 28, slot_0_91_0.add_aim_spot, nil, true, true, nil, true)
				slot_0_87_0("Update Aim Point", slot_0_59_0.x + slot_195_61_3 + 10, slot_0_59_0.y, slot_195_61_3, 28, slot_0_91_0.update_aim_spot, nil, true, true)
				slot_0_87_0("Delete Aim Point", slot_0_59_0.x, slot_0_59_0.y, slot_195_46_5 - 20, 28, slot_0_91_0.delete_aim_spot, nil, true, true)
			end

			slot_0_72_0(slot_195_55_2, "Editor")
		end

		slot_195_48_4 = slot_195_48_5 + slot_195_58_2 + 10
	elseif UI.active_tab == "Config" then
		UI.cloud_manager = UI.cloud_manager or {
			selected = nil,
			[0] = nil
		}

		if not UI.config_list_initialized then
			UI.config_list_initialized = true

			slot_0_6_0.refresh_presets()

			if #UI.preset_manager.presets > 0 and not UI.preset_manager.selected then
				UI.preset_manager.selected = 1
			end
		end

		slot_195_46_4 = math.floor(slot_195_36_0 * 0.4)
		slot_195_47_3 = 15
		slot_195_48_3 = slot_195_36_0 - slot_195_46_4 - slot_195_47_3
		slot_195_49_3 = 160
		slot_195_50_3, slot_195_51_3, slot_195_52_3 = slot_0_71_0(slot_195_41_0, slot_195_42_0, slot_195_46_4, slot_195_49_3, "LOCAL CONFIGS", nil, false)
		slot_195_53_2 = slot_195_50_3 + slot_195_46_4 - 40
		slot_195_54_2 = slot_195_42_0 + 11
		slot_195_55_1 = slot_0_59_0.Mouse and slot_195_53_2 <= slot_0_59_0.Mouse.x and slot_0_59_0.Mouse.x <= slot_195_53_2 + 20 and slot_195_54_2 <= slot_0_59_0.Mouse.y and slot_0_59_0.Mouse.y <= slot_195_54_2 + 20
		slot_195_56_1 = slot_195_55_1 and slot_0_41_0(slot_195_6_0.accent) or slot_0_41_0(slot_195_6_0.text_dim, 120)

		slot_195_5_0:AddText(draw.Vec2(slot_195_53_2, slot_195_54_2), "R", slot_195_56_1)

		if slot_195_55_1 and slot_0_59_0.clicked then
			slot_195_57_3 = game.globalVars.m_flRealTime

			if slot_195_57_3 - (UI.last_refresh_time or 0) > 1 then
				UI.last_refresh_time = slot_195_57_3

				slot_0_6_0.refresh_presets()
				notify("Local list refreshed", "success")
			end
		end

		if not slot_195_52_3 then
			slot_195_57_2 = 32

			for iter_195_8, iter_195_9 in ipairs(UI.preset_manager.presets) do
				slot_195_63_2 = slot_195_51_3 + (iter_195_8 - 1) * slot_195_57_2

				if slot_195_63_2 + slot_195_57_2 > slot_195_51_3 + slot_195_49_3 - 20 then
					break
				end

				slot_195_64_2 = UI.preset_manager.selected == iter_195_8
				slot_195_65_1 = slot_0_59_0.Mouse and slot_0_59_0.Mouse.x >= slot_195_50_3 - 5 and slot_0_59_0.Mouse.x <= slot_195_50_3 + slot_195_46_4 - 15 and slot_195_63_2 <= slot_0_59_0.Mouse.y and slot_0_59_0.Mouse.y <= slot_195_63_2 + slot_195_57_2

				if slot_195_65_1 and slot_0_59_0.clicked then
					UI.preset_manager.selected = iter_195_8
					UI.cfg.config_input_text = iter_195_9.name

					if UI.cloud_manager then
						UI.cloud_manager.selected = nil
					end
				end

				if slot_195_64_2 then
					slot_195_5_0:AddRectFilledRounded(draw.Rect(slot_195_50_3 - 5, slot_195_63_2, slot_195_50_3 + slot_195_46_4 - 15, slot_195_63_2 + slot_195_57_2), slot_0_41_0(slot_195_6_0.accent, 25), 4)
					slot_195_5_0:AddRectFilled(draw.Rect(slot_195_50_3 - 5, slot_195_63_2 + 4, slot_195_50_3 - 3, slot_195_63_2 + slot_195_57_2 - 4), slot_0_41_0(slot_195_6_0.accent))
				elseif slot_195_65_1 then
					slot_195_5_0:AddRectFilledRounded(draw.Rect(slot_195_50_3 - 5, slot_195_63_2, slot_195_50_3 + slot_195_46_4 - 15, slot_195_63_2 + slot_195_57_2), draw.Color(255, 255, 255, 5), 4)
				end

				slot_195_66_1 = slot_195_64_2 and slot_0_41_0(slot_195_6_0.accent) or slot_0_41_0(slot_195_6_0.text)

				slot_195_5_0:AddText(draw.Vec2(slot_195_50_3 + 8, slot_195_63_2 + 3), iter_195_9.name, slot_195_66_1)
				slot_195_5_0:AddText(draw.Vec2(slot_195_50_3 + 8, slot_195_63_2 + 16), "Mod: " .. (iter_195_9.time or "Unknown"), slot_0_41_0(slot_195_6_0.text_dim, 150))
			end
		end

		slot_195_57_1 = slot_195_42_0 + slot_195_49_3 + 15
		slot_195_58_1 = slot_195_16_0 - (slot_195_57_1 - slot_195_15_0) - 30
		slot_195_59_1, slot_195_60_1, slot_195_61_1 = slot_0_71_0(slot_195_41_0, slot_195_57_1, slot_195_46_4, slot_195_58_1, "CLOUD CONFIGS", nil, false)
		slot_195_62_1 = slot_0_37_0.cloud_configs or {}
		slot_195_63_1 = 40
		slot_195_64_1 = #slot_195_62_1 * slot_195_63_1
		slot_195_66_0 = slot_195_58_1 - 42
		slot_195_67_0 = math.max(0, slot_195_64_1 - slot_195_66_0 + 10)

		if not slot_195_61_1 then
			if slot_0_59_0.Mouse and slot_195_41_0 <= slot_0_59_0.Mouse.x and slot_0_59_0.Mouse.x <= slot_195_41_0 + slot_195_46_4 and slot_195_57_1 <= slot_0_59_0.Mouse.y and slot_0_59_0.Mouse.y <= slot_195_57_1 + slot_195_58_1 and slot_0_59_0.scroll_delta and slot_0_59_0.scroll_delta ~= 0 then
				UI.cloud_scroll_target = (UI.cloud_scroll_target or 0) - slot_0_59_0.scroll_delta * 40
				slot_0_59_0.scroll_delta = 0
			end

			UI.cloud_scroll_target = math.max(0, math.min(slot_195_67_0, UI.cloud_scroll_target or 0))
			UI.cloud_scroll = (UI.cloud_scroll or 0) + ((UI.cloud_scroll_target or 0) - (UI.cloud_scroll or 0)) * (15 * (game.globalVars.m_flAbsFrameTime or 0.016))

			if math.abs((UI.cloud_scroll or 0) - (UI.cloud_scroll_target or 0)) < 0.1 then
				UI.cloud_scroll = UI.cloud_scroll_target
			end
		end

		slot_195_68_0 = slot_195_59_1 + slot_195_46_4 - 40
		slot_195_69_0 = slot_195_57_1 + 11
		slot_195_70_0 = slot_0_59_0.Mouse and slot_195_68_0 <= slot_0_59_0.Mouse.x and slot_0_59_0.Mouse.x <= slot_195_68_0 + 20 and slot_195_69_0 <= slot_0_59_0.Mouse.y and slot_0_59_0.Mouse.y <= slot_195_69_0 + 20
		slot_195_71_0 = slot_195_70_0 and slot_0_41_0(slot_195_6_0.accent) or slot_0_41_0(slot_195_6_0.text_dim, 120)

		slot_195_5_0:AddText(draw.Vec2(slot_195_68_0, slot_195_69_0), "R", slot_195_71_0)

		if slot_195_70_0 and slot_0_59_0.clicked then
			slot_0_37_0.fetchConfigs(true)
		end

		if not slot_195_61_1 then
			if #slot_195_62_1 == 0 then
				slot_195_72_2 = slot_0_37_0.cloud_status or "Click 'R' to fetch"

				slot_195_5_0:AddText(draw.Vec2(slot_195_59_1 + 15, slot_195_60_1 + 10), slot_195_72_2, slot_0_41_0(slot_195_6_0.text_dim, 150))
			else
				for iter_195_10, iter_195_11 in ipairs(slot_195_62_1) do
					slot_195_77_1 = slot_195_60_1 + (iter_195_10 - 1) * slot_195_63_1 - (UI.cloud_scroll or 0)

					if slot_195_77_1 > slot_195_57_1 + slot_195_58_1 - 20 then
						break
					end

					if slot_195_60_1 > slot_195_77_1 + slot_195_63_1 then
						-- block empty
					else
						if slot_195_77_1 + slot_195_63_1 > slot_195_57_1 + slot_195_58_1 - 5 then
							break
						end

						slot_195_78_1 = slot_0_59_0.Mouse and slot_0_59_0.Mouse.x >= slot_195_59_1 - 5 and slot_0_59_0.Mouse.x <= slot_195_59_1 + slot_195_46_4 - 28 and slot_195_77_1 <= slot_0_59_0.Mouse.y and slot_0_59_0.Mouse.y <= slot_195_77_1 + slot_195_63_1 and slot_195_60_1 <= slot_0_59_0.Mouse.y and slot_0_59_0.Mouse.y <= slot_195_57_1 + slot_195_58_1 - 10
						slot_195_79_1 = iter_195_11.author_id and slot_0_37_0.currentUserUID and tostring(iter_195_11.author_id) == tostring(slot_0_37_0.currentUserUID) or iter_195_11.author_name == slot_0_30_0()
						slot_195_80_1 = UI.cloud_manager and UI.cloud_manager.selected == iter_195_10

						if slot_195_78_1 then
							slot_195_5_0:AddRectFilledRounded(draw.Rect(slot_195_59_1 - 5, slot_195_77_1, slot_195_59_1 + slot_195_46_4 - 12, slot_195_77_1 + slot_195_63_1), draw.Color(255, 255, 255, 5), 4)

							if slot_0_59_0.clicked then
								if not UI.cloud_manager then
									UI.cloud_manager = {
										selected = nil,
										[0] = nil
									}
								end

								UI.cloud_manager.selected = iter_195_10
								UI.cfg.config_input_text = iter_195_11.name
								UI.preset_manager.selected = nil
							end
						end

						if slot_195_80_1 then
							slot_195_5_0:AddRectFilledRounded(draw.Rect(slot_195_59_1 - 5, slot_195_77_1, slot_195_59_1 + slot_195_46_4 - 12, slot_195_77_1 + slot_195_63_1), slot_0_41_0(slot_195_6_0.accent, 25), 4)
							slot_195_5_0:AddRectFilled(draw.Rect(slot_195_59_1 - 5, slot_195_77_1 + 4, slot_195_59_1 - 3, slot_195_77_1 + slot_195_63_1 - 4), slot_0_41_0(slot_195_6_0.accent))
						end

						slot_195_5_0:AddText(draw.Vec2(slot_195_59_1 + 8, slot_195_77_1 + 4), iter_195_11.name, slot_195_80_1 and slot_0_41_0(slot_195_6_0.accent) or slot_0_41_0(slot_195_6_0.text))

						slot_195_81_1 = iter_195_11.author_name or "Unknown"
						slot_195_82_1 = "By " .. slot_195_81_1
						slot_195_83_1 = "(" .. tostring(iter_195_11.downloads or 0) .. " loads)"
						slot_195_84_1 = slot_0_51_0(UI.font, slot_195_83_1)
						slot_195_85_1 = slot_195_46_4 - slot_195_84_1.x - 35

						if slot_195_85_1 < slot_0_51_0(UI.font, slot_195_82_1).x then
							slot_195_82_1 = slot_195_82_1:sub(1, math.floor(slot_195_85_1 / 7)) .. "..."
						end

						slot_195_5_0:AddText(draw.Vec2(slot_195_59_1 + 8, slot_195_77_1 + 20), slot_195_82_1, slot_0_41_0(slot_195_6_0.text_dim, 150))
						slot_195_5_0:AddText(draw.Vec2(slot_195_59_1 + slot_195_46_4 - 20 - slot_195_84_1.x, slot_195_77_1 + 20), slot_195_83_1, slot_0_41_0(slot_195_6_0.text_dim, 100))
					end
				end

				if slot_195_67_0 > 0 then
					slot_195_72_1 = (UI.cloud_scroll or 0) / slot_195_67_0
					slot_195_73_1 = slot_195_66_0 - 15
					slot_195_74_2 = math.max(15, slot_195_73_1 / slot_195_64_1 * slot_195_73_1)
					slot_195_75_1 = slot_195_60_1 + slot_195_72_1 * (slot_195_73_1 - slot_195_74_2)

					slot_195_5_0:AddRectFilled(draw.Rect(slot_195_59_1 + slot_195_46_4 - 10, slot_195_75_1, slot_195_59_1 + slot_195_46_4 - 8, slot_195_75_1 + slot_195_74_2), slot_0_41_0(slot_195_6_0.accent, 150), 2)
				end
			end
		end

		slot_195_72_0 = UI.cloud_manager and UI.cloud_manager.selected
		slot_195_73_0 = false

		if slot_195_72_0 then
			slot_195_74_1 = (slot_0_37_0.cloud_configs or {})[slot_195_72_0]

			if slot_195_74_1 then
				slot_195_73_0 = slot_195_74_1.author_id and slot_0_37_0.currentUserUID and tostring(slot_195_74_1.author_id) == tostring(slot_0_37_0.currentUserUID) or slot_195_74_1.author_name == slot_0_30_0()
			end
		end

		slot_195_74_0 = 150

		if slot_195_72_0 and slot_195_73_0 then
			slot_195_74_0 = 250
		end

		if UI.group_heights then
			UI.group_heights["ACTIVE CONFIG"] = slot_195_74_0
		end

		slot_195_75_0, slot_195_76_0, slot_195_77_0 = slot_0_71_0(slot_195_41_0 + slot_195_46_4 + slot_195_47_3, slot_195_42_0, slot_195_48_3, slot_195_74_0, "ACTIVE CONFIG", nil, false)

		if not slot_195_77_0 then
			slot_195_78_0 = slot_195_76_0 + 5
			slot_195_79_0 = slot_195_48_3 - 30
			slot_195_80_0 = 28

			slot_0_86_0(slot_195_75_0, slot_195_78_0, slot_195_79_0, "Enter config name...", "config_input_text", "config_active")

			slot_195_81_0 = {
				{
					label = "Save",
					id = "action_save",
					[0] = nil,
					cb = function()
						slot_0_6_0.save_config(UI.cfg.config_input_text ~= "" and UI.cfg.config_input_text or "config")
					end
				},
				{
					label = "Load",
					id = "action_load",
					[0] = nil,
					cb = function()
						local var_214_0 = UI.cfg.config_input_text ~= "" and UI.cfg.config_input_text or nil
						local var_214_1

						if not var_214_0 and UI.preset_manager.selected then
							local var_214_2 = UI.preset_manager.presets[UI.preset_manager.selected]

							var_214_0 = var_214_2 and var_214_2.name
							var_214_1 = var_214_2 and var_214_2.path
						end

						slot_0_6_0.load_config(var_214_0, var_214_1)
					end
				},
				{
					label = "Import",
					id = "action_import",
					[0] = nil,
					cb = function()
						if slot_0_6_0.deserialize_cfg(get_clipboard_safe()) then
							notify("Config imported!", "success")
						else
							notify("Import failed", "error")
						end
					end
				},
				{
					label = "Export",
					id = "action_export",
					[0] = nil,
					cb = function()
						set_clipboard_safe(slot_0_6_0.serialize_cfg())
						notify("Exported config", "success")
					end
				},
				{
					label = "Delete",
					id = "action_delete",
					is_delete = true,
					[0] = nil,
					cb = function()
						if UI.preset_manager.selected then
							local var_217_0 = UI.preset_manager.presets[UI.preset_manager.selected]

							if var_217_0 then
								slot_0_6_0.delete_config(var_217_0.name)

								UI.preset_manager.selected = nil

								slot_0_6_0.refresh_presets()
							end
						else
							notify("Select config to delete", "error")
						end
					end
				}
			}
			slot_195_82_0 = slot_195_78_0 + slot_195_80_0 + 10
			slot_195_83_0 = #slot_195_81_0
			slot_195_84_0 = 22
			slot_195_85_0 = math.floor(slot_195_79_0 / 5.5)
			slot_195_87_0 = (slot_195_79_0 - ((slot_195_83_0 - 1) * slot_195_85_0 + slot_195_84_0)) / 2

			for iter_195_12, iter_195_13 in ipairs(slot_195_81_0) do
				slot_195_93_0 = slot_195_75_0 + slot_195_87_0 + (iter_195_12 - 1) * slot_195_85_0
				slot_195_94_0 = slot_0_59_0.Mouse and slot_0_59_0.Mouse.x >= slot_195_93_0 - 8 and slot_0_59_0.Mouse.x <= slot_195_93_0 + 30 and slot_0_59_0.Mouse.y >= slot_195_82_0 - 8 and slot_0_59_0.Mouse.y <= slot_195_82_0 + 30

				if slot_195_94_0 then
					slot_0_59_0.hovered_tooltip = iter_195_13.label

					if slot_0_59_0.clicked then
						iter_195_13.cb()
					end
				end

				slot_195_95_0 = slot_195_94_0 and (iter_195_13.is_delete and draw.Color(255, 80, 80, 255) or slot_0_41_0(slot_195_6_0.accent)) or slot_0_41_0(slot_195_6_0.text_dim, 200)

				draw_icon_proc(iter_195_13.id, slot_195_93_0, slot_195_82_0, 20, slot_195_95_0)

				if slot_195_94_0 then
					slot_0_44_0(slot_195_93_0, slot_195_82_0, 20, 20, slot_195_95_0, 15, 10)
				end
			end

			slot_0_59_0.y = slot_195_82_0 + 32
			slot_0_59_0.x = slot_195_75_0

			if slot_195_72_0 then
				slot_195_88_0 = (slot_0_37_0.cloud_configs or {})[slot_195_72_0]

				if slot_195_88_0 then
					slot_0_87_0("Load Cloud Config", slot_0_59_0.x, slot_0_59_0.y, slot_195_79_0, 28, function()
						notify("Downloading " .. slot_195_88_0.name .. "...", "info")
						slot_0_37_0.downloadConfig(slot_195_88_0.id, slot_195_88_0.name)
					end)

					if slot_195_73_0 then
						slot_0_87_0("Update Cloud Config", slot_0_59_0.x, slot_0_59_0.y, slot_195_79_0, 28, function()
							slot_0_37_0.updateCloudConfig(slot_195_88_0.id, slot_0_6_0.serialize_cfg())
						end)
						slot_0_87_0("Delete Cloud Config", slot_0_59_0.x, slot_0_59_0.y, slot_195_79_0, 28, function()
							slot_0_37_0.deleteCloudConfig(slot_195_88_0.id)

							UI.cloud_manager.selected = nil
						end, nil, draw.Color(230, 60, 60, 255))
					end
				end
			else
				slot_0_87_0("Upload to Cloud", slot_0_59_0.x, slot_0_59_0.y, slot_195_79_0, 28, function()
					local var_221_0 = UI.cfg.config_input_text ~= "" and UI.cfg.config_input_text or "config"
					local var_221_1 = slot_0_6_0.serialize_cfg()

					slot_0_37_0.uploadConfig(var_221_0, var_221_1)
				end)
			end

			slot_0_59_0.y = slot_0_59_0.y + 2
		end

		slot_0_59_0.char_buffer = {}
	end

	if UI.active_settings_popup and UI.active_settings_data then
		slot_195_46_3 = UI.active_settings_data

		if slot_0_76_0(UI.active_settings_popup, slot_195_46_3.x, slot_195_46_3.y, slot_195_46_3.list, slot_195_8_0) then
			UI.active_settings_popup = nil
			UI.active_settings_data = nil
		end
	end

	slot_0_69_0()

	if UI.post_draw then
		UI.post_draw()
	end

	if UI.settings_open then
		slot_195_5_0:AddRectFilled(draw.Rect(slot_195_14_0, slot_195_15_0, slot_195_14_0 + slot_195_11_0, slot_195_15_0 + slot_195_16_0), draw.Color(0, 0, 0, 150))

		slot_195_46_2 = 360
		slot_195_47_2 = 320
		slot_195_48_2 = slot_195_14_0 + (slot_195_11_0 - slot_195_46_2) / 2
		slot_195_49_2 = slot_195_15_0 + (slot_195_16_0 - slot_195_47_2) / 2

		slot_0_44_0(slot_195_48_2, slot_195_49_2, slot_195_46_2, slot_195_47_2, slot_195_6_0.accent, 45 * slot_195_4_0, 12)
		slot_195_5_0:AddRectFilledRounded(draw.Rect(slot_195_48_2, slot_195_49_2, slot_195_48_2 + slot_195_46_2, slot_195_49_2 + slot_195_47_2), slot_0_41_0(slot_195_6_0.bg_alt, 255), 12)
		slot_195_5_0:AddText(draw.Vec2(slot_195_48_2 + 20, slot_195_49_2 + 20), "Settings & About", draw.Color(255, 255, 255, 255))

		slot_195_50_2 = slot_195_48_2 + slot_195_46_2 - 30
		slot_195_51_2 = slot_195_49_2 + 20

		slot_195_5_0:AddText(draw.Vec2(slot_195_50_2, slot_195_51_2), "X", draw.Color(255, 100, 100, 255))

		if slot_195_7_0 and slot_195_8_0 and not UI.last_click_state and slot_195_50_2 <= slot_195_7_0.x and slot_195_7_0.x <= slot_195_50_2 + 20 and slot_195_51_2 <= slot_195_7_0.y and slot_195_7_0.y <= slot_195_51_2 + 20 then
			UI.settings_open = false
			UI.last_click_state = true
		end

		slot_195_52_2 = slot_195_49_2 + 55

		slot_195_5_0:AddText(draw.Vec2(slot_195_48_2 + 20, slot_195_52_2), "Developer & Credits", slot_0_41_0(slot_195_6_0.text_dim))
		slot_195_5_0:AddRectFilled(draw.Rect(slot_195_48_2 + 20, slot_195_52_2 + 18, slot_195_48_2 + slot_195_46_2 - 20, slot_195_52_2 + 19), draw.Color(255, 255, 255, 10))
		slot_195_5_0:AddText(draw.Vec2(slot_195_48_2 + 20, slot_195_52_2 + 25), "huc - Lead Developer", draw.Color(255, 255, 255, 255))
		slot_195_5_0:AddText(draw.Vec2(slot_195_48_2 + 20, slot_195_52_2 + 42), "Oli - For helping me", draw.Color(180, 180, 180, 255))

		slot_195_53_1 = slot_195_52_2 + 80

		slot_195_5_0:AddText(draw.Vec2(slot_195_48_2 + 20, slot_195_53_1), "Global Configuration", slot_0_41_0(slot_195_6_0.text_dim))
		slot_195_5_0:AddRectFilled(draw.Rect(slot_195_48_2 + 20, slot_195_53_1 + 18, slot_195_48_2 + slot_195_46_2 - 20, slot_195_53_1 + 19), draw.Color(255, 255, 255, 10))

		slot_0_59_0.x = slot_195_48_2 + 20
		slot_0_59_0.y = slot_195_53_1 + 25

		slot_0_62_0("Dark Dim Overlay", "gui_dim", "Dark overlay when menu is open")
		slot_0_74_0("Menu Accent", "theme_accent")
		slot_0_62_0("Show Chat Indicators", "chat_indicators", "Draggable chat feedback and status updates")
		slot_0_62_0("Background Particles", "gui_particles", "Render subtle particle effects in the background")

		slot_195_54_1 = slot_0_59_0.y + 10

		slot_195_5_0:AddText(draw.Vec2(slot_195_48_2 + 20, slot_195_54_1), "Build: Beta Version", slot_0_41_0(slot_195_6_0.accent, 180))
	end

	if UI.link_modal_open then
		slot_195_5_0:AddRectFilled(draw.Rect(slot_195_14_0, slot_195_15_0, slot_195_14_0 + slot_195_11_0, slot_195_15_0 + slot_195_16_0), draw.Color(0, 0, 0, 180))

		slot_195_46_1 = 380
		slot_195_47_1 = 240
		slot_195_48_1 = slot_195_14_0 + (slot_195_11_0 - slot_195_46_1) / 2
		slot_195_49_1 = slot_195_15_0 + (slot_195_16_0 - slot_195_47_1) / 2

		slot_0_44_0(slot_195_48_1, slot_195_49_1, slot_195_46_1, slot_195_47_1, slot_195_6_0.accent, 45 * slot_195_4_0, 12)
		slot_195_5_0:AddRectFilledRounded(draw.Rect(slot_195_48_1, slot_195_49_1, slot_195_48_1 + slot_195_46_1, slot_195_49_1 + slot_195_47_1), slot_0_41_0(slot_195_6_0.bg_alt, 255), 12)
		draw_icon_proc("link", slot_195_48_1 + (slot_195_46_1 - 32) / 2, slot_195_49_1 + 30, 32, slot_0_41_0(slot_195_6_0.accent, 150))

		slot_195_50_1 = "Discord Account Linking"
		slot_195_51_1 = slot_0_51_0(UI.font, slot_195_50_1)

		slot_195_5_0:AddText(draw.Vec2(slot_195_48_1 + (slot_195_46_1 - slot_195_51_1.x) / 2, slot_195_49_1 + 75), slot_195_50_1, draw.Color(255, 255, 255, 255))

		slot_195_52_1 = "Paste the command below in #bot-commands on Discord"
		slot_195_53_0 = slot_0_51_0(UI.font, slot_195_52_1)

		slot_195_5_0:AddText(draw.Vec2(slot_195_48_1 + (slot_195_46_1 - slot_195_53_0.x) / 2, slot_195_49_1 + 105), slot_195_52_1, slot_0_41_0(slot_195_6_0.text_dim))

		slot_195_54_0 = UI.last_link_code or "XXXXXX"
		slot_195_55_0 = "/link username:" .. slot_0_30_0() .. " code:" .. slot_195_54_0
		slot_195_56_0 = slot_0_51_0(UI.font, slot_195_55_0)
		slot_195_57_0 = math.max(200, slot_195_56_0.x + 40)
		slot_195_58_0 = 32
		slot_195_59_0 = slot_195_49_1 + 130
		slot_195_60_0 = slot_195_48_1 + (slot_195_46_1 - slot_195_57_0) / 2
		slot_195_61_0 = false

		if slot_195_7_0 and slot_195_60_0 <= slot_195_7_0.x and slot_195_7_0.x <= slot_195_60_0 + slot_195_57_0 and slot_195_59_0 <= slot_195_7_0.y and slot_195_7_0.y <= slot_195_59_0 + slot_195_58_0 then
			slot_195_61_0 = true
		end

		slot_195_62_0 = slot_195_55_0

		if UI.link_code_copied then
			slot_195_62_0 = "Copied to clipboard!"
		elseif slot_195_61_0 then
			slot_195_62_0 = "Click to copy command"
		end

		slot_0_87_0(slot_195_62_0, slot_195_60_0, slot_195_59_0, slot_195_57_0, slot_195_58_0, function()
			if slot_195_54_0 ~= "XXXXXX" and slot_195_54_0 ~= "ERROR" and slot_195_54_0 ~= "Requesting..." then
				set_clipboard_safe(slot_195_55_0 .. " version:" .. (slot_0_0_0 or "1.0"))

				UI.link_code_copied = true
			end
		end)

		slot_195_63_0 = true

		if slot_195_7_0 and slot_195_48_1 <= slot_195_7_0.x and slot_195_7_0.x <= slot_195_48_1 + slot_195_46_1 and slot_195_49_1 <= slot_195_7_0.y and slot_195_7_0.y <= slot_195_49_1 + slot_195_47_1 then
			slot_195_63_0 = false
		end

		slot_195_64_0 = "Click outside to close"
		slot_195_65_0 = slot_0_51_0(UI.font, slot_195_64_0)

		slot_195_5_0:AddText(draw.Vec2(slot_195_48_1 + (slot_195_46_1 - slot_195_65_0.x) / 2, slot_195_49_1 + slot_195_47_1 - 20), slot_195_64_0, slot_0_41_0(slot_195_6_0.text_dim, 80))

		if not slot_195_8_0 then
			UI.link_modal_can_close = true
		end

		if slot_195_7_0 and slot_195_8_0 and not UI.last_click_state and UI.link_modal_can_close and slot_195_63_0 then
			UI.link_modal_open = false
		end

		if UI.link_modal_can_close and slot_0_59_0.clicked and slot_195_63_0 then
			UI.link_modal_open = false
		end
	end

	if slot_195_7_0 then
		slot_0_89_0(slot_0_59_0.hovered_tooltip, slot_195_7_0.x, slot_195_7_0.y)
	end

	if UI.search and UI.search.active and UI.search.last_pos then
		slot_195_46_0 = UI.search.last_pos

		slot_0_84_0(slot_195_46_0.x, slot_195_46_0.y + slot_195_46_0.h, slot_195_46_0.w)

		if slot_0_59_0.clicked then
			slot_195_47_0 = slot_0_59_0.Mouse.x
			slot_195_48_0 = slot_0_59_0.Mouse.y
			slot_195_49_0 = slot_195_47_0 >= slot_195_46_0.x and slot_195_47_0 <= slot_195_46_0.x + slot_195_46_0.w and slot_195_48_0 >= slot_195_46_0.y and slot_195_48_0 <= slot_195_46_0.y + slot_195_46_0.h
			slot_195_50_0 = 32
			slot_195_51_0 = math.min(6, #UI.search.results) * slot_195_50_0 + 10
			slot_195_52_0 = slot_195_47_0 >= slot_195_46_0.x and slot_195_47_0 <= slot_195_46_0.x + slot_195_46_0.w and slot_195_48_0 >= slot_195_46_0.y + slot_195_46_0.h + 5 and slot_195_48_0 <= slot_195_46_0.y + slot_195_46_0.h + 5 + slot_195_51_0

			if not slot_195_49_0 and not slot_195_52_0 then
				UI.search.active = false
			end
		end
	end

	if UI.active_color_picker then
		slot_0_75_0(UI.active_color_picker, UI.picker_x, UI.picker_y)
	end

	slot_0_59_0.scroll_delta = 0
end

function slot_0_98_0(arg_223_0)
	return 1 - math.pow(1 - arg_223_0, 3)
end

function slot_0_99_0()
	if not is_enabled("keybinds_ws") then
		return
	end

	slot_224_0_0 = slot_0_36_0.keybinds

	if not slot_0_47_0.untitled1 then
		if render and render.create_font then
			slot_0_47_0.untitled1 = render.create_font("untitled1", 20, 400, true)
		elseif draw and draw.create_font then
			slot_0_47_0.untitled1 = draw.create_font("untitled1", 20, 400, true)
		end
	end

	if not (UI.theme or {
		accent = {
			255,
			90,
			130,
			255,
			[0] = nil
		}
	}).accent then
		slot_224_2_0 = {
			255,
			90,
			130,
			255,
			[0] = nil
		}
	end

	slot_224_3_0 = draw.surface
	slot_224_4_0 = UI.cfg.keybinds_style or 1
	slot_224_5_0 = slot_0_10_0()
	slot_224_6_0 = slot_0_11_0() or slot_0_60_0
	slot_224_7_0 = UI.font or draw.fonts.gui_semi_bold or draw.fonts.default
	slot_224_3_0.font = slot_224_7_0

	function slot_224_8_0(arg_225_0)
		local var_225_0 = arg_225_0:lower()

		if var_225_0:find("double tap") then
			return "action_refresh"
		elseif var_225_0:find("hide shots") then
			return "eye"
		elseif var_225_0:find("safe point") then
			return "shield"
		elseif var_225_0:find("force shoot") then
			return "skull"
		elseif var_225_0:find("force baim") then
			return "skull"
		elseif var_225_0:find("min damage") then
			return "pliers"
		elseif var_225_0:find("fake duck") then
			return "chicken"
		elseif var_225_0:find("quick peek") then
			return "action_export"
		elseif var_225_0:find("slowwalk") then
			return "ladder"
		elseif var_225_0:find("no land") then
			return "atom"
		elseif var_225_0:find("force haim") then
			return "skull"
		elseif var_225_0:find("lethal air") then
			return "diamond"
		elseif var_225_0:find("hitchance") then
			return "lotus"
		elseif var_225_0:find("pointscale") then
			return "diamond"
		end

		return "star"
	end

	slot_224_9_0 = {}
	slot_224_10_0 = false
	slot_224_11_0 = 130
	slot_224_12_0 = entities.GetLocalPawn()
	slot_224_13_0 = nil
	slot_224_14_0 = nil

	if slot_224_12_0 then
		slot_224_13_0 = slot_224_12_0:GetActiveWeapon()

		if slot_224_13_0 then
			slot_224_14_0 = slot_0_29_0.Helpers.GetWeaponData(slot_224_13_0:GetDefIndex())
		end
	end

	for iter_224_0, iter_224_1 in ipairs(slot_224_0_0.list) do
		slot_224_20_1 = false

		if iter_224_1.id == "misc_edge_stop" then
			slot_224_20_1 = slot_0_36_0.edge_stop_vars.state
		elseif iter_224_1.id == "custom_ai_peek" then
			slot_224_20_1 = slot_0_36_0 ~= nil and slot_0_36_0.ai_peek ~= nil and slot_0_36_0.ai_peek.active == true
		elseif iter_224_1.id == "custom_freestanding" then
			slot_224_20_1 = UI.is_hotkey_active("aa_freestanding_key") and is_enabled("aa_freestanding")
		elseif iter_224_1.id == "custom_dynamic_hc" then
			slot_224_21_4 = slot_224_13_0 and slot_0_14_0(slot_224_13_0:GetDefIndex()) or "global"
			slot_224_20_1 = (UI.cfg["acc_dy_hc_enabled_" .. slot_224_21_4] or UI.cfg.acc_dy_hc_enabled_global) and UI.is_hotkey_active("acc_dy_hc_key_" .. slot_224_21_4, false)
		elseif iter_224_1.id == "custom_auto_ps" then
			slot_224_21_3 = slot_224_13_0 and slot_0_14_0(slot_224_13_0:GetDefIndex()) or "global"
			slot_224_20_1 = (UI.cfg["acc_ap_enabled_" .. slot_224_21_3] or UI.cfg.acc_ap_enabled_global) and UI.is_hotkey_active("acc_ap_key_" .. slot_224_21_3, false)
		elseif gui and gui.ctx and gui.ctx.find then
			slot_224_21_2 = nil

			if iter_224_1.name == "Min Damage" and slot_224_14_0 and slot_224_14_0.mindamage then
				slot_224_21_2 = slot_224_14_0.mindamage
			elseif iter_224_1.name == "Hitchance" and slot_224_14_0 and slot_224_14_0.hitchance then
				slot_224_21_2 = slot_224_14_0.hitchance
			else
				slot_224_21_2 = gui.ctx:find(iter_224_1.id)
			end

			if slot_224_21_2 and slot_224_21_2.GetHotkeyState then
				slot_224_20_1 = slot_224_21_2:GetHotkeyState()
			end
		end

		if slot_224_20_1 then
			slot_224_10_0 = true
		end

		slot_224_21_1 = slot_0_43_0("kb_" .. iter_224_1.name, slot_224_20_1 and 1 or 0, 15)

		if slot_224_21_1 > 0.01 then
			slot_224_22_1 = slot_0_51_0(slot_224_7_0, iter_224_1.name)
			slot_224_23_1 = slot_224_20_1 and "on" or "off"

			if iter_224_1.name == "Min Damage" and slot_224_14_0 and slot_224_14_0.mindamage then
				slot_224_24_3 = slot_224_14_0.mindamage:GetValue()

				if slot_224_24_3 then
					slot_224_25_2 = slot_224_24_3:Get()
					slot_224_23_1 = slot_224_25_2 > 100 and "HP+" .. tostring(slot_224_25_2 - 100) or tostring(slot_224_25_2)
				else
					slot_224_23_1 = "off"
				end
			elseif iter_224_1.name == "Hitchance" and slot_224_14_0 and slot_224_14_0.hitchance then
				slot_224_24_2 = slot_224_14_0.hitchance:GetValue()
				slot_224_23_1 = slot_224_24_2 and tostring(slot_224_24_2:Get()) or "off"
			end

			slot_224_24_1 = slot_0_51_0(slot_224_7_0, slot_224_23_1)
			slot_224_25_1 = slot_224_22_1.x + 40 + slot_224_24_1.x

			if slot_224_11_0 < slot_224_25_1 then
				slot_224_11_0 = slot_224_25_1
			end

			table.insert(slot_224_9_0, {
				[0] = nil,
				name = iter_224_1.name,
				alpha = slot_224_21_1,
				is_active = slot_224_20_1,
				name_size = slot_224_22_1,
				val_text = slot_224_23_1,
				val_size = slot_224_24_1
			})
		end
	end

	if UI.open and #slot_224_9_0 == 0 then
		slot_224_10_0 = true

		table.insert(slot_224_9_0, {
			val_text = "on",
			is_dummy = true,
			is_active = true,
			name = "Keybinds",
			alpha = 1,
			[0] = nil,
			name_size = slot_0_51_0(slot_224_7_0, "Keybinds"),
			val_size = slot_0_51_0(slot_224_7_0, "on")
		})
	end

	if UI.open then
		slot_224_10_0 = true
	end

	slot_224_15_0 = slot_0_43_0("kb_container", slot_224_10_0 and 1 or 0, 10)

	if UI.open then
		slot_224_15_0 = 1
	end

	if slot_224_15_0 < 0.01 then
		return
	end

	if UI.cfg.keybinds_x == nil then
		UI.cfg.keybinds_x = 100
	end

	if UI.cfg.keybinds_y == nil then
		UI.cfg.keybinds_y = 300
	end

	slot_224_16_0 = UI.cfg.keybinds_x
	slot_224_17_0 = UI.cfg.keybinds_y
	slot_224_18_0 = 24
	slot_224_19_0 = 6
	slot_224_20_0 = 24
	slot_224_21_0 = math.max(130, slot_224_11_0)
	slot_224_22_0 = 0

	for iter_224_2, iter_224_3 in ipairs(slot_224_9_0) do
		slot_224_22_0 = slot_224_22_0 + (slot_224_18_0 + slot_224_19_0) * iter_224_3.alpha
	end

	slot_224_23_0 = slot_224_20_0 + slot_224_19_0 + slot_224_22_0

	if slot_224_5_0 and slot_224_6_0 and UI.open then
		if not slot_224_0_0.dragging then
			if slot_224_16_0 <= slot_224_5_0.x and slot_224_5_0.x <= slot_224_16_0 + slot_224_21_0 and slot_224_17_0 <= slot_224_5_0.y and slot_224_5_0.y <= slot_224_17_0 + slot_224_23_0 then
				slot_224_0_0.dragging = true
				slot_224_0_0.drag_off_x = slot_224_5_0.x - slot_224_16_0
				slot_224_0_0.drag_off_y = slot_224_5_0.y - slot_224_17_0
			end
		else
			UI.cfg.keybinds_x = slot_224_5_0.x - slot_224_0_0.drag_off_x
			UI.cfg.keybinds_y = slot_224_5_0.y - slot_224_0_0.drag_off_y
			UI.cfg.keybinds_x, UI.cfg.keybinds_y = slot_0_20_0(UI.cfg.keybinds_x, UI.cfg.keybinds_y, slot_224_21_0, slot_224_23_0, slot_224_0_0.dragging)
			slot_224_16_0, slot_224_17_0 = UI.cfg.keybinds_x, UI.cfg.keybinds_y
		end
	else
		slot_224_0_0.dragging = false
	end

	slot_224_24_0 = slot_224_16_0
	slot_224_25_0 = slot_224_17_0
	slot_224_26_0 = UI.cfg.keybinds_color or {
		255,
		255,
		255,
		255,
		[0] = nil
	}
	slot_224_27_0 = slot_224_15_0

	if slot_224_4_0 == 1 then
		slot_224_28_1 = UI.theme and UI.theme.accent or {
			255,
			90,
			130,
			255,
			[0] = nil
		}
		slot_224_29_1 = draw.GetTime()
		slot_224_30_0 = math.sin(slot_224_29_1 * 1.5) * 0.5 + 0.5
		slot_224_31_0 = slot_224_28_1[1] or 255
		slot_224_32_0 = slot_224_28_1[2] or 90
		slot_224_33_1 = slot_224_28_1[3] or 130

		for iter_224_4 = 1, 4 do
			slot_224_38_0 = iter_224_4 * 1.5
			slot_224_39_1 = math.floor((22 - iter_224_4 * 5) * (0.4 + slot_224_30_0 * 0.6) * slot_224_27_0)

			if slot_224_39_1 > 0 then
				slot_224_3_0:AddRectFilledRounded(draw.Rect(slot_224_24_0 - slot_224_38_0, slot_224_25_0 - slot_224_38_0, slot_224_24_0 + slot_224_21_0 + slot_224_38_0, slot_224_25_0 + slot_224_20_0 + slot_224_38_0), draw.Color(slot_224_31_0, slot_224_32_0, slot_224_33_1, slot_224_39_1), 6)
			end
		end

		function slot_224_34_1(arg_226_0, arg_226_1)
			local var_226_0 = math.sin(slot_224_29_1 * 1.2 + arg_226_0) * 0.5 + 0.5

			return draw.Color(math.floor(5 + slot_224_31_0 * 0.15 * var_226_0), math.floor(5 + slot_224_32_0 * 0.15 * var_226_0), math.floor(8 + slot_224_33_1 * 0.15 * var_226_0), math.floor(arg_226_1 * (0.8 + var_226_0 * 0.2) * slot_224_27_0))
		end

		slot_224_3_0:AddRectFilledRoundedMulticolor(draw.Rect(slot_224_24_0, slot_224_25_0, slot_224_24_0 + slot_224_21_0, slot_224_25_0 + slot_224_20_0), {
			slot_224_34_1(0, 225),
			slot_224_34_1(2, 255),
			slot_224_34_1(4, 245),
			slot_224_34_1(6, 220)
		}, 6)

		if slot_0_47_0.alt then
			slot_224_35_2 = slot_224_3_0.font
			slot_224_3_0.font = slot_0_47_0.alt

			slot_224_3_0:AddText(draw.Vec2(slot_224_24_0 + 10, slot_224_25_0 + 9), "A", slot_0_41_0(slot_224_28_1, 200 * slot_224_27_0))

			slot_224_3_0.font = slot_224_35_2
		end

		slot_224_3_0:AddText(draw.Vec2(slot_224_24_0 + 30, slot_224_25_0 + 7), "Hotkey List", draw.Color(255, 255, 255, 255 * slot_224_27_0))

		slot_224_35_1 = slot_224_25_0 + slot_224_20_0 + slot_224_19_0

		for iter_224_5, iter_224_6 in ipairs(slot_224_9_0) do
			slot_224_41_0 = iter_224_6.alpha * slot_224_27_0
			slot_224_43_0 = slot_224_35_1 + (1 - iter_224_6.alpha) * 5

			if iter_224_6.alpha > 0.05 then
				for iter_224_7 = 1, 3 do
					slot_224_48_1 = iter_224_7
					slot_224_49_1 = math.floor((12 - iter_224_7 * 3) * slot_224_41_0)

					slot_224_3_0:AddRectFilledRounded(draw.Rect(slot_224_24_0 - slot_224_48_1, slot_224_43_0 - slot_224_48_1, slot_224_24_0 + slot_224_21_0 + slot_224_48_1, slot_224_43_0 + slot_224_18_0 + slot_224_48_1), slot_0_41_0(slot_224_28_1, slot_224_49_1), 6)
				end
			end

			slot_224_44_0 = draw.Color(25, 25, 25, 120 * slot_224_41_0)

			slot_224_3_0:AddRectFilledRounded(draw.Rect(slot_224_24_0, slot_224_43_0, slot_224_24_0 + slot_224_21_0, slot_224_43_0 + slot_224_18_0), slot_224_44_0, 6)

			slot_224_45_0 = slot_224_43_0 + slot_224_18_0 / 2 - iter_224_6.name_size.y / 2

			slot_224_3_0:AddText(draw.Vec2(slot_224_24_0 + 12, slot_224_45_0), iter_224_6.name, draw.Color(255, 255, 255, 255 * slot_224_41_0))

			if not iter_224_6.is_dummy then
				slot_224_46_0 = 24
				slot_224_47_0 = 14
				slot_224_48_0 = slot_224_24_0 + slot_224_21_0 - slot_224_46_0 - 6
				slot_224_49_0 = slot_224_43_0 + slot_224_18_0 / 2 - slot_224_47_0 / 2

				if tonumber(iter_224_6.val_text) ~= nil or iter_224_6.val_text:find("HP+", 1, true) ~= nil then
					slot_224_51_1 = slot_224_43_0 + slot_224_18_0 / 2 - iter_224_6.val_size.y / 2

					slot_224_3_0:AddText(draw.Vec2(slot_224_48_0 + slot_224_46_0 - iter_224_6.val_size.x - 2, slot_224_51_1), iter_224_6.val_text, draw.Color(255, 255, 255, 255 * slot_224_41_0))
				else
					slot_224_51_0 = iter_224_6.is_active and 1 or 0
					slot_224_52_0 = nil

					if iter_224_6.is_active then
						slot_224_53_1 = 30 + (slot_224_28_1[1] - 30) * 0.2
						slot_224_54_1 = 30 + (slot_224_28_1[2] - 30) * 0.2
						slot_224_55_1 = 35 + (slot_224_28_1[3] - 35) * 0.2
						slot_224_52_0 = draw.Color(math.floor(slot_224_53_1), math.floor(slot_224_54_1), math.floor(slot_224_55_1), 255 * slot_224_41_0)
					else
						slot_224_52_0 = draw.Color(30, 30, 35, 255 * slot_224_41_0)
					end

					slot_224_3_0:AddRectFilledRounded(draw.Rect(slot_224_48_0, slot_224_49_0, slot_224_48_0 + slot_224_46_0, slot_224_49_0 + slot_224_47_0), slot_224_52_0, slot_224_47_0 / 2)

					slot_224_53_0 = iter_224_6.is_active and 1 or 0
					slot_224_54_0 = slot_224_47_0 - 4
					slot_224_55_0 = math.Lerp(slot_224_48_0 + 2, slot_224_48_0 + slot_224_46_0 - 2 - slot_224_54_0, slot_224_53_0)

					slot_224_3_0:AddCircleFilled(draw.Vec2(slot_224_55_0 + slot_224_54_0 / 2, slot_224_49_0 + 2 + slot_224_54_0 / 2), slot_224_54_0 / 2, draw.Color(255, 255, 255, 255 * slot_224_41_0))
				end
			end

			slot_224_35_1 = slot_224_35_1 + (slot_224_18_0 + slot_224_19_0) * iter_224_6.alpha
		end
	else
		slot_224_3_0:AddRectFilled(draw.Rect(slot_224_24_0, slot_224_25_0, slot_224_24_0 + slot_224_21_0, slot_224_25_0 + slot_224_20_0), draw.Color(28, 28, 28, 255 * slot_224_27_0))
		slot_224_3_0:AddRectFilled(draw.Rect(slot_224_24_0, slot_224_25_0, slot_224_24_0 + slot_224_21_0, slot_224_25_0 + 2), draw.Color(slot_224_26_0[1], slot_224_26_0[2], slot_224_26_0[3], slot_224_26_0[4] * slot_224_27_0))

		slot_224_28_0 = slot_0_51_0(slot_224_7_0, "keybinds")

		slot_224_3_0:AddText(draw.Vec2(slot_224_24_0 + slot_224_21_0 / 2 - slot_224_28_0.x / 2, slot_224_25_0 + 4), "keybinds", draw.Color(255, 255, 255, 255 * slot_224_27_0))

		slot_224_29_0 = slot_224_25_0 + slot_224_20_0 + slot_224_19_0

		for iter_224_8, iter_224_9 in ipairs(slot_224_9_0) do
			slot_224_35_0 = iter_224_9.alpha * slot_224_27_0
			slot_224_37_0 = slot_224_29_0 + (1 - iter_224_9.alpha) * 10

			slot_224_3_0:AddText(draw.Vec2(slot_224_24_0 + 2, slot_224_37_0), iter_224_9.name, draw.Color(255, 255, 255, 255 * slot_224_35_0))
			slot_224_3_0:AddText(draw.Vec2(slot_224_24_0 + slot_224_21_0 - iter_224_9.val_size.x - 5, slot_224_37_0), "[" .. iter_224_9.val_text .. "]", draw.Color(180, 180, 180, 255 * slot_224_35_0))

			slot_224_29_0 = slot_224_29_0 + (slot_224_18_0 + slot_224_19_0) * iter_224_9.alpha
		end
	end
end

function slot_0_100_0()
	if not UI.cfg.netgraph_ws then
		return
	end

	slot_227_0_0 = draw.surface
	slot_227_2_0 = UI.theme.accent or {
		255,
		0,
		255,
		255,
		[0] = nil
	}
	slot_227_3_0 = UI.font
	slot_227_4_0 = slot_0_47_0.alt or UI.font
	slot_227_5_0 = slot_0_36_0.smooth_fps or 60
	slot_227_6_0 = 0
	slot_227_7_0 = game.engine:get_netchan()

	if slot_227_7_0 and not slot_227_7_0:is_null() then
		slot_227_6_0 = math.floor(slot_227_7_0:get_latency(0) * 1000)
	end

	slot_227_8_0 = game.globalVars and game.globalVars.intervalPerTick or 0.015625
	slot_227_9_0 = math.floor(1 / slot_227_8_0 + 0.5)

	if UI.cfg.netgraph_x == nil then
		UI.cfg.netgraph_x = 100
	end

	if UI.cfg.netgraph_y == nil then
		UI.cfg.netgraph_y = 500
	end

	slot_227_10_0 = UI.cfg.netgraph_x
	slot_227_11_0 = UI.cfg.netgraph_y
	slot_227_12_0 = 230
	slot_227_13_0 = 56

	if UI.open then
		slot_227_14_1 = slot_0_10_0()

		if slot_227_14_1 and slot_0_60_0 then
			if not slot_0_36_0.netgraph_dragging then
				if slot_227_10_0 <= slot_227_14_1.x and slot_227_14_1.x <= slot_227_10_0 + slot_227_12_0 and slot_227_11_0 <= slot_227_14_1.y and slot_227_14_1.y <= slot_227_11_0 + slot_227_13_0 then
					slot_0_36_0.netgraph_dragging = true
					slot_0_36_0.netgraph_drag_off_x = slot_227_14_1.x - slot_227_10_0
					slot_0_36_0.netgraph_drag_off_y = slot_227_14_1.y - slot_227_11_0
				end
			else
				UI.cfg.netgraph_x = slot_227_14_1.x - slot_0_36_0.netgraph_drag_off_x
				UI.cfg.netgraph_y = slot_227_14_1.y - slot_0_36_0.netgraph_drag_off_y
				slot_227_10_0, slot_227_11_0 = UI.cfg.netgraph_x, UI.cfg.netgraph_y
			end
		else
			slot_0_36_0.netgraph_dragging = false
		end
	end

	for iter_227_0 = 1, 3 do
		slot_227_18_1 = iter_227_0 * 1
		slot_227_19_1 = math.floor(10 / iter_227_0)

		slot_227_0_0:AddRectFilledRounded(draw.Rect(slot_227_10_0 - slot_227_18_1, slot_227_11_0 - slot_227_18_1, slot_227_10_0 + slot_227_12_0 + slot_227_18_1, slot_227_11_0 + slot_227_13_0 + slot_227_18_1), slot_0_41_0(slot_227_2_0, slot_227_19_1), 6)
	end

	slot_227_0_0:AddRectFilledRounded(draw.Rect(slot_227_10_0, slot_227_11_0, slot_227_10_0 + slot_227_12_0, slot_227_11_0 + slot_227_13_0), draw.Color(10, 10, 10, 140), 6)
	slot_227_0_0:AddRectFilled(draw.Rect(slot_227_10_0 + 5, slot_227_11_0, slot_227_10_0 + slot_227_12_0 - 5, slot_227_11_0 + 1.2), draw.Color(slot_227_2_0[1], slot_227_2_0[2], slot_227_2_0[3], 200))

	slot_227_14_0 = draw.Color(slot_227_2_0[1], slot_227_2_0[2], slot_227_2_0[3], 255)
	slot_227_15_0 = 10
	slot_227_16_0 = slot_227_10_0 + slot_227_12_0 / 2

	draw_icon_proc("sparkle", slot_227_16_0 - 5, slot_227_11_0 + 5, slot_227_15_0, slot_227_14_0)

	slot_227_17_0 = 12
	slot_227_18_0 = slot_227_11_0 + 13

	function slot_227_19_0(arg_228_0, arg_228_1, arg_228_2, arg_228_3)
		local var_228_0 = slot_227_10_0 + slot_227_17_0
		local var_228_1 = var_228_0 + 16
		local var_228_2 = slot_227_0_0.font

		slot_227_0_0.font = slot_227_4_0

		slot_227_0_0:AddText(draw.Vec2(var_228_0, slot_227_18_0 + 2), arg_228_0, slot_227_14_0)

		slot_227_0_0.font = var_228_2

		slot_227_0_0:AddText(draw.Vec2(var_228_1, slot_227_18_0), arg_228_1 .. ":", draw.Color(140, 140, 140, 255))

		local var_228_3 = slot_0_51_0(slot_227_3_0, arg_228_1 .. ": ")

		slot_227_0_0:AddText(draw.Vec2(var_228_1 + var_228_3.x + 3, slot_227_18_0), arg_228_2, arg_228_3 or draw.Color(220, 220, 220, 255))

		slot_227_18_0 = slot_227_18_0 + 13.5
	end

	slot_227_20_0 = draw.Color(slot_227_2_0[1], slot_227_2_0[2], slot_227_2_0[3], 255)
	slot_227_21_0 = draw.Color(220, 220, 220, 255)

	slot_227_19_0("D", "fps", string.format("%d (99%%: %d)", slot_227_5_0, math.floor(slot_227_5_0 * 0.85)), slot_227_20_0)
	slot_227_19_0("C", "ping", string.format("%dms (%dt) | loss: 0%%", slot_227_6_0, math.floor(slot_227_6_0 / (slot_227_8_0 * 1000))), slot_227_20_0)
	slot_227_19_0(";", "server", string.format("%.1fms | rate: %.0f tps", slot_227_8_0 * 1000, slot_227_9_0), slot_227_21_0)
end

function slot_0_101_0(arg_229_0)
	function slot_229_1_0(arg_230_0, arg_230_1)
		if not arg_230_0 then
			return
		end

		local var_230_0 = arg_230_0:GetValue()

		if var_230_0 then
			local var_230_1 = var_230_0:Get()

			if var_230_1 and type(var_230_1) == "userdata" and (var_230_1.SetRaw or var_230_1.set_raw) then
				if var_230_1.SetRaw then
					var_230_1:SetRaw(arg_230_1)
				else
					var_230_1:set_raw(arg_230_1)
				end

				var_230_0:Set(var_230_1)
			end
		end
	end

	if not is_enabled("jumpscout_enabled") then
		if slot_0_36_0.jumpscout.was_enabled_last_frame then
			slot_0_36_0.jumpscout.was_enabled_last_frame = false

			if slot_0_36_0.jumpscout.old_autostop_bits ~= -1 then
				slot_229_1_0(slot_0_36_0.jumpscout.autostop_ctl, slot_0_36_0.jumpscout.old_autostop_bits)

				slot_0_36_0.jumpscout.old_autostop_bits = -1
			end

			if slot_0_36_0.jumpscout.old_hitchance ~= -1 then
				slot_0_29_0.Helpers.SetValue(slot_0_36_0.jumpscout.hitchance_ctl, slot_0_36_0.jumpscout.old_hitchance)

				slot_0_36_0.jumpscout.old_hitchance = -1
			end

			if slot_0_36_0.jumpscout.old_multipoint ~= -1 then
				slot_0_29_0.Helpers.SetValue(slot_0_36_0.jumpscout.multipoint_ctl, slot_0_36_0.jumpscout.old_multipoint)

				slot_0_36_0.jumpscout.old_multipoint = -1
			end

			if slot_0_36_0.jumpscout.old_force_shoot ~= nil then
				slot_0_29_0.Helpers.SetValue(slot_0_36_0.jumpscout.force_shoot_ctl, slot_0_36_0.jumpscout.old_force_shoot)

				slot_0_36_0.jumpscout.old_force_shoot = nil
			end

			slot_0_36_0.jumpscout.shot_time = 0
		end

		return
	end

	slot_229_2_0 = slot_0_36_0.jumpscout
	slot_229_2_0.was_enabled_last_frame = true

	if not slot_229_2_0.is_initialized then
		slot_229_3_1 = "rage>weapon>SSG-08>extra>autostop>settings>mode"
		slot_229_4_1 = "rage>weapon>SSG-08>weapon>hitchance"
		slot_229_5_1 = "rage>weapon>SSG-08>weapon>pointscale"
		slot_229_6_0 = "rage>aimbot>general>force shoot"
		slot_229_2_0.autostop_ctl = gui.ctx:find(slot_229_3_1) or gui.ctx:Find(slot_229_3_1)
		slot_229_2_0.force_shoot_ctl = gui.ctx:find(slot_229_6_0) or gui.ctx:Find(slot_229_6_0)
		slot_229_2_0.hitchance_ctl = gui.ctx:find(slot_229_4_1) or gui.ctx:Find(slot_229_4_1)
		slot_229_2_0.multipoint_ctl = gui.ctx:find(slot_229_5_1) or gui.ctx:Find(slot_229_5_1)

		if slot_229_2_0.autostop_ctl and slot_229_2_0.force_shoot_ctl then
			slot_229_2_0.is_initialized = true

			print("[JS] Initialized Successfully with updated paths!")
		elseif not slot_229_2_0.gave_error then
			print("[JS] FAILED TO INITIALIZE - Paths not found")

			slot_229_2_0.gave_error = true
		end

		if not slot_229_2_0.is_initialized then
			return
		end
	end

	slot_229_3_0 = entities.GetLocalPawn()

	if not slot_229_3_0 or not slot_229_3_0:IsAlive() then
		return
	end

	slot_229_4_0 = slot_229_3_0:GetActiveWeapon()

	if not slot_229_4_0 or slot_229_4_0:GetClassName() ~= "C_WeaponSSG08" then
		if slot_229_2_0.old_autostop_bits ~= -1 then
			slot_229_1_0(slot_229_2_0.autostop_ctl, slot_229_2_0.old_autostop_bits)

			slot_229_2_0.old_autostop_bits = -1
		end

		if slot_229_2_0.old_hitchance ~= -1 then
			slot_0_29_0.Helpers.SetValue(slot_229_2_0.hitchance_ctl, slot_229_2_0.old_hitchance)

			slot_229_2_0.old_hitchance = -1
		end

		if slot_229_2_0.old_multipoint ~= -1 then
			slot_0_29_0.Helpers.SetValue(slot_229_2_0.multipoint_ctl, slot_229_2_0.old_multipoint)

			slot_229_2_0.old_multipoint = -1
		end

		if slot_229_2_0.old_force_shoot ~= nil then
			slot_0_29_0.Helpers.SetValue(slot_229_2_0.force_shoot_ctl, slot_229_2_0.old_force_shoot)

			slot_229_2_0.old_force_shoot = nil
		end

		slot_229_2_0.can_fire_at_apex = true
		slot_229_2_0.shot_time = 0

		return
	end

	slot_229_5_0 = slot_229_3_0:GetAbsVelocity().z
	slot_229_7_0 = slot_0_7_0.band(slot_229_3_0.m_fFlags:Get() or 0, 1) == 0 and math.abs(slot_229_5_0) < slot_229_2_0.apex_peak_window
	slot_229_8_0 = game.globalVars and game.globalVars.realTime or game.globalVars and game.globalVars.m_flRealTime or 0

	if slot_229_5_0 > slot_229_2_0.reset_velocity then
		slot_229_2_0.can_fire_at_apex = true
		slot_229_2_0.shot_time = 0
	end

	if slot_229_7_0 and slot_229_2_0.can_fire_at_apex then
		if slot_229_2_0.old_autostop_bits == -1 then
			slot_229_9_1 = slot_229_2_0.autostop_ctl:GetValue()

			if slot_229_9_1 then
				slot_229_10_1 = slot_229_9_1:Get()

				if slot_229_10_1 and type(slot_229_10_1) == "userdata" then
					slot_229_2_0.old_autostop_bits = slot_229_10_1.GetRaw and slot_229_10_1:GetRaw() or slot_229_10_1:get_raw()
				end
			end
		end

		if slot_229_2_0.old_hitchance == -1 and slot_229_2_0.hitchance_ctl then
			slot_229_2_0.old_hitchance = slot_229_2_0.hitchance_ctl:GetValue():Get()
		end

		if slot_229_2_0.old_multipoint == -1 and slot_229_2_0.multipoint_ctl then
			slot_229_2_0.old_multipoint = slot_229_2_0.multipoint_ctl:GetValue():Get()
		end

		if slot_229_2_0.old_force_shoot == nil and slot_229_2_0.force_shoot_ctl then
			slot_229_2_0.old_force_shoot = slot_229_2_0.force_shoot_ctl:GetValue():Get()
		end

		slot_229_2_0.shot_time = slot_229_8_0
		slot_229_2_0.can_fire_at_apex = false
		slot_229_9_0 = slot_229_4_0.m_zoomLevel

		if (slot_229_9_0 and (slot_229_9_0.Get and slot_229_9_0:Get() or slot_229_9_0:get()) or 0) < 1 then
			arg_229_0:SetButton(1024)
		end
	end

	if slot_229_2_0.shot_time > 0 and slot_229_8_0 - slot_229_2_0.shot_time <= slot_229_2_0.post_shot_duration then
		slot_229_1_0(slot_229_2_0.autostop_ctl, slot_229_2_0.in_air_flag)

		slot_229_10_0 = is_enabled("jumpscout_force_shoot")
		slot_229_11_0 = UI.cfg.jumpscout_hitchance
		slot_229_12_0 = UI.cfg.jumpscout_multipoint

		if slot_229_2_0.force_shoot_ctl then
			slot_0_29_0.Helpers.SetValue(slot_229_2_0.force_shoot_ctl, slot_229_10_0)
		end

		if slot_229_2_0.hitchance_ctl and not slot_229_10_0 then
			slot_0_29_0.Helpers.SetValue(slot_229_2_0.hitchance_ctl, slot_229_11_0)
		end

		if slot_229_2_0.multipoint_ctl then
			slot_0_29_0.Helpers.SetValue(slot_229_2_0.multipoint_ctl, slot_229_12_0)
		end
	else
		if slot_229_2_0.old_autostop_bits ~= -1 then
			slot_229_1_0(slot_229_2_0.autostop_ctl, slot_229_2_0.old_autostop_bits)

			slot_229_2_0.old_autostop_bits = -1
		end

		if slot_229_2_0.old_hitchance ~= -1 then
			slot_0_29_0.Helpers.SetValue(slot_229_2_0.hitchance_ctl, slot_229_2_0.old_hitchance)

			slot_229_2_0.old_hitchance = -1
		end

		if slot_229_2_0.old_multipoint ~= -1 then
			slot_0_29_0.Helpers.SetValue(slot_229_2_0.multipoint_ctl, slot_229_2_0.old_multipoint)

			slot_229_2_0.old_multipoint = -1
		end

		if slot_229_2_0.old_force_shoot ~= nil then
			slot_0_29_0.Helpers.SetValue(slot_229_2_0.force_shoot_ctl, slot_229_2_0.old_force_shoot)

			slot_229_2_0.old_force_shoot = nil
		end
	end
end

function slot_0_102_0()
	if not is_enabled("jumpscout_vis_enabled") then
		return
	end

	slot_231_0_0 = slot_0_36_0.jumpscout
	slot_231_1_0 = draw.surface

	if not UI.theme.accent then
		slot_231_3_0 = {
			255,
			90,
			130,
			255,
			[0] = nil
		}
	end

	slot_231_4_0 = UI.font
	slot_231_5_0 = 200
	slot_231_6_0 = 10
	slot_231_7_0 = UI.cfg.jumpscout_x
	slot_231_8_0 = UI.cfg.jumpscout_y

	if slot_231_7_0 == nil or slot_231_8_0 == nil or slot_231_7_0 == 0 and slot_231_8_0 == 0 then
		slot_231_9_2, slot_231_10_1 = game.engine:GetScreenSize()

		if slot_231_9_2 and slot_231_10_1 then
			UI.cfg.jumpscout_x = slot_231_9_2 / 2 - 100
			UI.cfg.jumpscout_y = slot_231_10_1 - 150
			slot_231_7_0, slot_231_8_0 = UI.cfg.jumpscout_x, UI.cfg.jumpscout_y
		else
			slot_231_7_0, slot_231_8_0 = 500, 500
		end
	end

	if UI.open then
		slot_231_9_1 = slot_0_10_0()

		if slot_231_9_1 and slot_0_60_0 then
			if not slot_231_0_0.dragging then
				if slot_231_7_0 <= slot_231_9_1.x and slot_231_9_1.x <= slot_231_7_0 + slot_231_5_0 and slot_231_8_0 <= slot_231_9_1.y and slot_231_9_1.y <= slot_231_8_0 + slot_231_6_0 then
					slot_231_0_0.dragging = true
					slot_231_0_0.drag_off_x = slot_231_9_1.x - slot_231_7_0
					slot_231_0_0.drag_off_y = slot_231_9_1.y - slot_231_8_0
				end
			else
				UI.cfg.jumpscout_x = slot_231_9_1.x - slot_231_0_0.drag_off_x
				UI.cfg.jumpscout_y = slot_231_9_1.y - slot_231_0_0.drag_off_y

				if not get_key_state(16) then
					UI.cfg.jumpscout_x, UI.cfg.jumpscout_y = slot_0_20_0(UI.cfg.jumpscout_x, UI.cfg.jumpscout_y, slot_231_5_0, slot_231_6_0, true)
				end

				slot_231_7_0, slot_231_8_0 = UI.cfg.jumpscout_x, UI.cfg.jumpscout_y
			end
		else
			slot_231_0_0.dragging = false
		end
	end

	slot_231_9_0 = entities.GetLocalPawn()

	if not slot_231_9_0 or not slot_231_9_0:IsAlive() then
		return
	end

	slot_231_10_0 = false
	slot_231_11_0 = false
	slot_231_12_0 = slot_231_5_0
	slot_231_13_0 = 10
	slot_231_14_0 = slot_231_12_0
	slot_231_15_0 = slot_231_9_0:GetActiveWeapon()

	if slot_231_15_0 and slot_231_15_0:GetClassName() == "C_WeaponSSG08" then
		slot_231_16_1 = slot_231_9_0.m_fFlags
		slot_231_17_1 = slot_231_16_1 and (slot_231_16_1.Get and slot_231_16_1:Get() or slot_231_16_1:get()) or 0

		if not (slot_0_7_0.band(slot_231_17_1, 1) ~= 0) then
			slot_231_11_0 = true
			slot_231_19_1 = math.abs(slot_231_9_0:GetAbsVelocity().z)
			slot_231_20_1 = 300
			slot_231_21_1 = math.min(1, slot_231_19_1 / slot_231_20_1)
			slot_231_14_0 = slot_231_13_0 + (slot_231_12_0 - slot_231_13_0) * slot_231_21_1

			if slot_231_19_1 < (slot_231_0_0.apex_peak_window or 72) then
				slot_231_10_0 = true
			end
		end
	end

	slot_231_16_0 = slot_0_43_0("js_vis_alpha", (slot_231_11_0 or UI.open) and 1 or 0, 10)

	if slot_231_16_0 < 0.01 then
		return
	end

	slot_231_17_0 = math.floor(255 * slot_231_16_0)
	slot_231_18_0 = slot_231_7_0 + slot_231_5_0 / 2
	slot_231_19_0 = slot_231_18_0 - slot_231_14_0 / 2
	slot_231_20_0 = slot_231_18_0 + slot_231_14_0 / 2
	slot_231_21_0 = 8
	slot_231_22_0 = slot_231_8_0 + slot_231_6_0 / 2 - slot_231_21_0 / 2
	slot_231_23_0 = draw.Rect(slot_231_19_0, slot_231_22_0, slot_231_20_0, slot_231_22_0 + slot_231_21_0)
	slot_231_24_0 = 255
	slot_231_25_0 = 255
	slot_231_26_0 = 255

	if slot_231_10_0 then
		slot_231_24_0, slot_231_25_0, slot_231_26_0 = 50, 255, 50
	end

	slot_231_27_0 = draw.Color(slot_231_24_0, slot_231_25_0, slot_231_26_0, slot_231_17_0)

	slot_231_1_0:AddRectFilledRounded(slot_231_23_0, slot_231_27_0, 8)

	slot_231_28_0 = "Apex"
	slot_231_29_0 = slot_0_51_0(slot_231_4_0, slot_231_28_0)
	slot_231_30_0 = 4
	slot_231_31_0 = slot_231_8_0 < slot_231_29_0.y + slot_231_30_0 + 10
	slot_231_32_0 = slot_231_18_0 - slot_231_29_0.x / 2
	slot_231_33_0 = slot_231_8_0 - slot_231_29_0.y - slot_231_30_0

	if slot_231_31_0 then
		slot_231_33_0 = slot_231_8_0 + slot_231_6_0 + slot_231_30_0
	end

	slot_231_1_0:AddText(draw.Vec2(slot_231_32_0 + 1, slot_231_33_0 + 1), slot_231_28_0, draw.Color(0, 0, 0, math.floor(200 * slot_231_16_0)))
	slot_231_1_0:AddText(draw.Vec2(slot_231_32_0, slot_231_33_0), slot_231_28_0, draw.Color(255, 255, 255, slot_231_17_0))

	if slot_231_0_0.dragging and slot_231_16_0 > 0.5 then
		slot_231_34_0 = "Hold SHIFT to disable snapping"
		slot_231_35_0 = slot_0_51_0(slot_231_4_0, slot_231_34_0)
		slot_231_36_0 = slot_231_8_0 + slot_231_6_0 + slot_231_35_0.y - 2

		if slot_231_31_0 then
			slot_231_36_0 = slot_231_8_0 - slot_231_35_0.y - 2
		end

		slot_231_37_0 = slot_231_18_0 - slot_231_35_0.x / 2

		slot_231_1_0:AddText(draw.Vec2(slot_231_37_0 + 1, slot_231_36_0 + 1), slot_231_34_0, draw.Color(0, 0, 0, math.floor(150 * slot_231_16_0)))
		slot_231_1_0:AddText(draw.Vec2(slot_231_37_0, slot_231_36_0), slot_231_34_0, draw.Color(220, 220, 220, math.floor(255 * slot_231_16_0)))
	end
end

function slot_0_103_0(arg_232_0)
	local var_232_0 = 1.70158

	return 1 + (var_232_0 + 1) * math.pow(arg_232_0 - 1, 3) + var_232_0 * math.pow(arg_232_0 - 1, 2)
end

function slot_0_104_0()
	if not is_enabled("silentium_hitlog_enabled") then
		return
	end

	local var_233_0 = draw.surface
	local var_233_1 = game.globalVars.m_flRealTime
	local var_233_2 = (UI.theme or {
		accent = {
			255,
			90,
			130,
			255,
			[0] = nil
		}
	}).accent or {
		255,
		90,
		130,
		255,
		[0] = nil
	}
	local var_233_3 = draw.fonts.gui_semi_bold or draw.fonts.gui_main or draw.fonts.default

	var_233_0.font = var_233_3

	local var_233_4 = 10
	local var_233_5 = 7
	local var_233_6 = 16

	for iter_233_0 = #slot_0_36_0.silentium_logs, 1, -1 do
		local var_233_7 = slot_0_36_0.silentium_logs[iter_233_0]
		local var_233_8 = var_233_1 - var_233_7.time
		local var_233_9 = 4

		if var_233_9 < var_233_8 then
			table.remove(slot_0_36_0.silentium_logs, iter_233_0)
		else
			local var_233_10 = 255

			if var_233_8 < 0.2 then
				var_233_10 = math.floor(var_233_8 / 0.2 * 255)
			elseif var_233_8 > var_233_9 - 0.5 then
				var_233_10 = math.floor((var_233_9 - var_233_8) / 0.5 * 255)
			end

			local var_233_11 = var_233_5 + (iter_233_0 - 1) * var_233_6
			local var_233_12 = "$ilentium . "
			local var_233_13 = string.format("Hit %s's %s(%s) for %d(%d) damage [hc: %d%% . bt: %dt]", tostring(var_233_7.target):lower(), tostring(var_233_7.hitgroup):lower(), tostring(var_233_7.pred_hitgroup or "body"):lower(), tonumber(var_233_7.damage) or 0, tonumber(var_233_7.pred_damage) or 0, tonumber(var_233_7.hc) or 0, tonumber(var_233_7.bt) or 0)
			local var_233_14 = slot_0_51_0(var_233_3, var_233_12)

			var_233_0:AddText(draw.Vec2(var_233_4 + 1, var_233_11 + 1), var_233_12 .. var_233_13, draw.Color(0, 0, 0, math.floor(var_233_10 * 0.6)))
			var_233_0:AddText(draw.Vec2(var_233_4, var_233_11), var_233_12, slot_0_41_0(var_233_2, var_233_10))
			var_233_0:AddText(draw.Vec2(var_233_4 + var_233_14.x, var_233_11), var_233_13, draw.Color(225, 225, 225, var_233_10))
		end
	end
end

function slot_0_105_0()
	if not is_enabled("hitlogs_ws") then
		return
	end

	slot_234_0_0 = draw.surface
	slot_234_1_0 = UI.theme
	slot_234_2_0 = draw.fonts.gui_semi_bold or UI.font or draw.fonts.default
	slot_234_0_0.font = slot_234_2_0
	slot_234_3_0, slot_234_4_0 = slot_0_9_0()
	slot_234_5_0 = slot_0_8_0()
	slot_234_6_0 = game.globalVars.m_flRealTime
	slot_234_7_0 = 6
	slot_234_8_0 = 28 * slot_234_5_0
	slot_234_9_0 = 6 * slot_234_5_0

	if UI.cfg.hitlogs_y == 20 and UI.cfg.hitlogs_x == 20 then
		UI.cfg.hitlogs_y = slot_234_4_0 * 0.75
		UI.cfg.hitlogs_x = slot_234_3_0 / 2
	end

	if UI.cfg.hitlogs_x == nil then
		UI.cfg.hitlogs_x = slot_234_3_0 / 2
	end

	if UI.cfg.hitlogs_y == nil then
		UI.cfg.hitlogs_y = slot_234_4_0 * 0.75
	end

	slot_234_10_0 = UI.cfg.hitlogs_y
	slot_234_11_0 = UI.cfg.hitlogs_x
	slot_234_12_0 = 240 * slot_234_5_0
	slot_234_13_0 = 24 * slot_234_5_0

	if UI.open then
		slot_234_14_1 = slot_0_10_0()
		slot_234_15_0 = slot_0_11_0() or slot_0_60_0
		slot_234_16_0 = slot_234_11_0 - slot_234_12_0 / 2
		slot_234_17_1 = slot_234_10_0

		if slot_234_14_1 and slot_234_15_0 then
			if not slot_0_36_0.hitlogs_dragging then
				if slot_234_16_0 <= slot_234_14_1.x and slot_234_14_1.x <= slot_234_16_0 + slot_234_12_0 and slot_234_17_1 <= slot_234_14_1.y and slot_234_14_1.y <= slot_234_17_1 + slot_234_13_0 then
					slot_0_36_0.hitlogs_dragging = true
					slot_0_36_0.hitlogs_drag_off_x = slot_234_14_1.x - slot_234_11_0
					slot_0_36_0.hitlogs_drag_off_y = slot_234_14_1.y - slot_234_10_0
				end
			else
				UI.cfg.hitlogs_x = slot_234_14_1.x - slot_0_36_0.hitlogs_drag_off_x
				UI.cfg.hitlogs_y = slot_234_14_1.y - slot_0_36_0.hitlogs_drag_off_y
				slot_234_18_3, slot_234_19_2 = slot_0_20_0(UI.cfg.hitlogs_x - slot_234_12_0 / 2, UI.cfg.hitlogs_y, slot_234_12_0, slot_234_13_0, slot_0_36_0.hitlogs_dragging)
				UI.cfg.hitlogs_x = slot_234_18_3 + slot_234_12_0 / 2
				UI.cfg.hitlogs_y = slot_234_19_2
			end
		else
			slot_0_36_0.hitlogs_dragging = false
		end

		slot_234_18_2 = draw.GetTime()
		slot_234_19_1 = math.sin(slot_234_18_2 * 1.5) * 0.5 + 0.5
		slot_234_20_1 = slot_234_1_0.accent or {
			255,
			90,
			130,
			255,
			[0] = nil
		}
		slot_234_21_1 = slot_234_20_1[1] or 255
		slot_234_22_1 = slot_234_20_1[2] or 90
		slot_234_23_1 = slot_234_20_1[3] or 130

		for iter_234_0 = 1, 3 do
			slot_234_28_1 = iter_234_0 * 1.2
			slot_234_29_1 = math.floor((18 - iter_234_0 * 5) * (0.4 + slot_234_19_1 * 0.6))

			if slot_234_29_1 > 0 then
				slot_234_0_0:AddRectFilledRounded(draw.Rect(slot_234_16_0 - slot_234_28_1, slot_234_17_1 - slot_234_28_1, slot_234_16_0 + slot_234_12_0 + slot_234_28_1, slot_234_17_1 + slot_234_13_0 + slot_234_28_1), draw.Color(slot_234_21_1, slot_234_22_1, slot_234_23_1, slot_234_29_1), 4, 15)
			end
		end

		function slot_234_24_1(arg_235_0, arg_235_1)
			local var_235_0 = math.sin(slot_234_18_2 * 1.2 + arg_235_0) * 0.5 + 0.5

			return draw.Color(math.floor(5 + slot_234_21_1 * 0.15 * var_235_0), math.floor(5 + slot_234_22_1 * 0.15 * var_235_0), math.floor(8 + slot_234_23_1 * 0.15 * var_235_0), math.floor(arg_235_1 * (0.8 + var_235_0 * 0.2)))
		end

		slot_234_0_0:AddRectFilledRoundedMulticolor(draw.Rect(slot_234_16_0, slot_234_17_1, slot_234_16_0 + slot_234_12_0, slot_234_17_1 + slot_234_13_0), {
			slot_234_24_1(0, 225),
			slot_234_24_1(2, 255),
			slot_234_24_1(4, 245),
			slot_234_24_1(6, 220)
		}, 4, 15)
		slot_234_0_0:AddRectFilledRounded(draw.Rect(slot_234_16_0 + 2, slot_234_17_1, slot_234_16_0 + slot_234_12_0 - 2, slot_234_17_1 + 1), draw.Color(255, 255, 255, 30), 4)

		slot_234_25_2 = "Hitlogs Position"
		slot_234_26_1 = slot_0_51_0(slot_234_2_0, slot_234_25_2)

		slot_234_0_0:AddText(draw.Vec2(slot_234_11_0 - slot_234_26_1.x / 2, slot_234_17_1 + slot_234_13_0 / 2 - slot_234_26_1.y / 2), slot_234_25_2, draw.Color(255, 255, 255, 150))
	end

	for iter_234_1 = #slot_0_36_0.logs, 1, -1 do
		if slot_234_6_0 - slot_0_36_0.logs[iter_234_1].time > 3 then
			table.remove(slot_0_36_0.logs, iter_234_1)
		end
	end

	slot_234_14_0 = {}

	for iter_234_2 = 1, math.min(#slot_0_36_0.logs, slot_234_7_0) do
		table.insert(slot_234_14_0, slot_0_36_0.logs[iter_234_2])
	end

	for iter_234_3, iter_234_4 in ipairs(slot_234_14_0) do
		slot_234_20_0 = slot_234_6_0 - iter_234_4.time
		slot_234_21_0 = math.min(slot_234_20_0 / 0.4, 1)
		slot_234_22_0 = slot_0_103_0(slot_234_21_0)
		slot_234_23_0 = 1
		slot_234_24_0 = 0

		if slot_234_20_0 > 2.2 then
			slot_234_25_1 = (slot_234_20_0 - 2.2) / 0.8
			slot_234_23_0 = 1 - slot_234_25_1
			slot_234_24_0 = slot_234_25_1 * slot_234_25_1 * 50
		end

		if slot_234_23_0 > 0.01 then
			slot_234_25_0 = slot_234_23_0
			slot_234_26_0 = (1 - slot_234_22_0) * 25
			slot_234_27_0 = slot_234_10_0 + (iter_234_3 - 1) * (slot_234_8_0 + slot_234_9_0) + slot_234_26_0
			slot_234_28_0 = slot_234_1_0.accent or {
				255,
				90,
				130,
				255,
				[0] = nil
			}
			slot_234_29_0 = slot_234_28_0
			slot_234_30_0 = {}

			if iter_234_4.type == "miss" then
				slot_234_30_0 = {
					{
						text = "Missed ",
						["Parse Error"] = nil,
						col = draw.Color(255, 100, 100, 255)
					},
					{
						text = "shot due to ",
						[0] = nil,
						col = slot_234_1_0.text_dim
					},
					{
						[0] = nil,
						text = iter_234_4.reason or "unknown",
						col = draw.Color(255, 255, 255, 255)
					}
				}
			else
				slot_234_31_1 = (iter_234_4.health_rem or 0) <= 0
				slot_234_30_0 = {
					{
						acc_lethal_mp_hp_ = nil,
						text = slot_234_31_1 and "Killed " or "Hit ",
						col = slot_234_1_0.text_dim
					},
					{
						[0] = nil,
						text = iter_234_4.target or "Enemy",
						col = slot_234_28_0
					},
					{
						text = " in ",
						NONE = nil,
						col = slot_234_1_0.text_dim
					},
					{
						[0] = nil,
						text = (iter_234_4.hitgroup or "Body"):lower(),
						col = slot_234_29_0
					},
					{
						text = " with ",
						[0] = nil,
						col = slot_234_1_0.text_dim
					},
					{
						[0] = nil,
						text = iter_234_4.weapon or "unknown",
						col = slot_234_28_0
					},
					{
						text = " for ",
						MarginRight = nil,
						col = slot_234_1_0.text_dim
					},
					{
						text = tostring(iter_234_4.damage or 0),
						col = slot_234_1_0.text
					},
					{
						text = " damage",
						SELECTABLE = nil,
						col = slot_234_1_0.text_dim
					}
				}

				if not slot_234_31_1 then
					table.insert(slot_234_30_0, {
						[0] = nil,
						text = string.format(" (%d)", iter_234_4.health_rem),
						col = slot_234_28_0
					})
				end
			end

			slot_234_31_0 = 0
			slot_234_32_0 = 20
			slot_234_33_0 = 10

			for iter_234_5, iter_234_6 in ipairs(slot_234_30_0) do
				slot_234_31_0 = slot_234_31_0 + slot_0_51_0(slot_234_2_0, iter_234_6.text).x
			end

			slot_234_34_0 = slot_234_31_0 + slot_234_32_0 + slot_234_33_0 * 2 + 10
			slot_234_35_0 = slot_234_11_0 - slot_234_34_0 / 2 + slot_234_24_0
			slot_234_36_0 = draw.GetTime()
			slot_234_37_0 = math.sin(slot_234_36_0 * 1.5) * 0.5 + 0.5
			slot_234_38_0 = slot_234_28_0[1] or 255
			slot_234_39_0 = slot_234_28_0[2] or 90
			slot_234_40_0 = slot_234_28_0[3] or 130

			for iter_234_7 = 1, 3 do
				slot_234_45_1 = iter_234_7 * 1.2
				slot_234_46_1 = math.floor((18 - iter_234_7 * 5) * (0.4 + slot_234_37_0 * 0.6) * slot_234_25_0)

				if slot_234_46_1 > 0 then
					slot_234_0_0:AddRectFilledRounded(draw.Rect(slot_234_35_0 - slot_234_45_1, slot_234_27_0 - slot_234_45_1, slot_234_35_0 + slot_234_34_0 + slot_234_45_1, slot_234_27_0 + slot_234_8_0 + slot_234_45_1), draw.Color(slot_234_38_0, slot_234_39_0, slot_234_40_0, slot_234_46_1), 6)
				end
			end

			function slot_234_41_0(arg_236_0, arg_236_1)
				local var_236_0 = math.sin(slot_234_36_0 * 1.2 + arg_236_0) * 0.5 + 0.5

				return draw.Color(math.floor(5 + slot_234_38_0 * 0.15 * var_236_0), math.floor(5 + slot_234_39_0 * 0.15 * var_236_0), math.floor(8 + slot_234_40_0 * 0.15 * var_236_0), math.floor(arg_236_1 * (0.8 + var_236_0 * 0.2) * slot_234_25_0))
			end

			slot_234_0_0:AddRectFilledRoundedMulticolor(draw.Rect(slot_234_35_0, slot_234_27_0, slot_234_35_0 + slot_234_34_0, slot_234_27_0 + slot_234_8_0), {
				slot_234_41_0(0, 225),
				slot_234_41_0(2, 255),
				slot_234_41_0(4, 245),
				slot_234_41_0(6, 220)
			}, 6)
			slot_234_0_0:AddRectFilledRounded(draw.Rect(slot_234_35_0 + 2, slot_234_27_0, slot_234_35_0 + slot_234_34_0 - 2, slot_234_27_0 + 1), draw.Color(255, 255, 255, math.floor(30 * slot_234_25_0)), 6)

			slot_234_42_0 = slot_234_0_0.font
			slot_234_0_0.font = slot_0_47_0.wm_silentium or slot_0_47_0.silentium or slot_234_42_0
			slot_234_43_0 = "R"
			slot_234_44_0 = slot_0_51_0(slot_234_0_0.font, slot_234_43_0)

			slot_234_0_0:AddText(draw.Vec2(slot_234_35_0 + 8, slot_234_27_0 + slot_234_8_0 / 2 - slot_234_44_0.y / 2 + 2), slot_234_43_0, slot_0_41_0(slot_234_28_0, math.floor(200 * slot_234_25_0)))

			slot_234_0_0.font = slot_234_42_0
			slot_234_45_0 = slot_234_35_0 + slot_234_32_0 + slot_234_33_0
			slot_234_46_0 = slot_234_27_0 + slot_234_8_0 / 2

			for iter_234_8, iter_234_9 in ipairs(slot_234_30_0) do
				slot_234_52_0 = slot_0_51_0(slot_234_2_0, iter_234_9.text)
				slot_234_53_0 = iter_234_9.col

				if type(slot_234_53_0) == "table" then
					slot_234_53_0 = draw.Color(slot_234_53_0[1], slot_234_53_0[2], slot_234_53_0[3], math.floor((slot_234_53_0[4] or 255) * slot_234_25_0))
				end

				slot_234_0_0:AddText(draw.Vec2(slot_234_45_0, slot_234_46_0 - slot_234_52_0.y / 2), iter_234_9.text, slot_234_53_0)

				slot_234_45_0 = slot_234_45_0 + slot_234_52_0.x
			end
		end
	end
end

function slot_0_106_0()
	if not is_enabled("esp_flags_enabled") then
		return
	end

	local var_237_0 = entities.GetLocalPawn()

	if not var_237_0 or not var_237_0:IsAlive() then
		return
	end

	local var_237_1 = draw.surface
	local var_237_2 = draw.fonts.gui_main

	if not var_237_2 then
		return
	end

	var_237_1.font = var_237_2

	local var_237_3 = UI.cfg.esp_flags_color or {
		255,
		0,
		125,
		255,
		[0] = nil
	}
	local var_237_4 = is_enabled("esp_flag_godmode")
	local var_237_5 = is_enabled("esp_flag_lethal")
	local var_237_6 = is_enabled("esp_flag_slowed")
	local var_237_7 = is_enabled("esp_flag_reloading")
	local var_237_8 = is_enabled("esp_flag_noshoot")

	entities.players:for_each(function(arg_238_0)
		local var_238_0 = arg_238_0.entity

		if not var_238_0 or not var_238_0:IsAlive() then
			return
		end

		local var_238_1 = var_238_0 == var_237_0

		if not var_238_1 and not var_238_0:IsEnemy() then
			return
		end

		local var_238_2 = var_238_0:GetAbsOrigin()
		local var_238_3 = var_238_0:GetEyePos() + vector(0, 0, 8)

		if not var_238_2 or not var_238_3 then
			return
		end

		local var_238_4 = math.WorldToScreen(var_238_2)
		local var_238_5 = math.WorldToScreen(var_238_3)

		if not var_238_4 or not var_238_5 then
			return
		end

		local var_238_6 = (var_238_4.y - var_238_5.y) / 2
		local var_238_7 = var_238_4.x + var_238_6 / 2 + 3
		local var_238_8 = var_238_5.y
		local var_238_9 = 10

		if not var_238_1 then
			if var_237_4 and var_238_0.m_bGunGameImmunity and var_238_0.m_bGunGameImmunity:Get() then
				local var_238_10 = "godmode"

				var_237_1:AddText(draw.Vec2(var_238_7, var_238_8), var_238_10, slot_0_41_0(var_237_3))

				var_238_8 = var_238_8 + var_238_9
			end

			if var_237_5 and var_238_0.m_iHealth and var_238_0.m_iHealth:Get() <= 92 then
				local var_238_11 = "lethal"

				var_237_1:AddText(draw.Vec2(var_238_7, var_238_8), var_238_11, slot_0_41_0(var_237_3))

				var_238_8 = var_238_8 + var_238_9
			end

			if var_237_6 and var_238_0.m_flVelocityModifier then
				local var_238_12 = var_238_0.m_flVelocityModifier:Get()

				if var_238_12 < 1 then
					local var_238_13 = string.format("slow: %d%%", math.floor((1 - var_238_12) * 100 + 0.5))

					var_237_1:AddText(draw.Vec2(var_238_7, var_238_8), var_238_13, slot_0_41_0(var_237_3))

					var_238_8 = var_238_8 + var_238_9
				end
			end

			if var_237_7 or var_237_8 then
				local var_238_14 = var_238_0:GetActiveWeapon()

				if var_238_14 then
					if var_237_7 and var_238_14.m_bInReload and var_238_14.m_bInReload:Get() then
						local var_238_15 = "reload"

						var_237_1:AddText(draw.Vec2(var_238_7, var_238_8), var_238_15, slot_0_41_0(var_237_3))

						var_238_8 = var_238_8 + var_238_9
					end

					if var_237_8 and var_238_14.m_flNextPrimaryAttack then
						local var_238_16 = var_238_14.m_flNextPrimaryAttack:Get()
						local var_238_17 = game.globalVars.m_flRealTime

						if var_238_17 < var_238_16 then
							local var_238_18 = var_238_16 - var_238_17
							local var_238_19 = string.format("%.1fs", var_238_18)

							var_237_1:AddText(draw.Vec2(var_238_7, var_238_8), var_238_19, slot_0_41_0(var_237_3))

							local var_238_20 = var_238_8 + var_238_9
						end
					end
				end
			end
		end
	end)
end

function slot_0_107_0()
	if not gui or not draw or not game or not game.engine or not game.globalVars then
		return
	end

	if slot_0_37_0 and slot_0_37_0.processQueue then
		slot_0_37_0.processQueue()
	end

	if not UI.font then
		UI.refresh_fonts()
	end

	UI.snap_guides.x = false
	UI.snap_guides.y = false

	if is_enabled("misc_slide_walk") or is_enabled("misc_jitter_legs") then
		slot_239_0_2 = (math.sin(game.globalVars.m_flRealTime * 4) + 1) / 2
		slot_239_1_2 = math.floor(180 + 75 * slot_239_0_2)
		slot_239_2_1 = draw.Color(255, 182, 193, slot_239_1_2)
		draw.surface.font = draw.fonts.gui_main

		draw.surface:AddText(draw.Vec2(30, 620), "ANIMATION BREAKER: ACTIVE", slot_239_2_1)
	end

	if UI.open and is_enabled("gui_dim") and draw.surface then
		slot_239_0_1, slot_239_1_1 = game.engine:GetScreenSize()

		draw.surface:AddRectFilled(draw.Rect(0, 0, slot_239_0_1, slot_239_1_1), draw.Color(0, 0, 0, 150))
	end

	slot_0_97_0()

	slot_239_0_0 = draw.surface

	if not slot_239_0_0 then
		return
	end

	slot_239_1_0 = draw.fonts.gui_main or draw.fonts.gui_semi_bold or draw.fonts.gui_bold

	if not slot_239_1_0 then
		return
	end

	slot_239_0_0.font = slot_239_1_0
	slot_239_2_0 = UI.theme

	if not slot_239_2_0 or not slot_239_2_0.accent then
		slot_239_3_0 = {
			255,
			0,
			255,
			255,
			[0] = nil
		}
	end

	slot_239_4_0 = entities.GetLocalPawn()
	slot_239_5_0, slot_239_6_0 = game.engine:GetScreenSize()
	slot_239_7_0 = game.globalVars.m_flRealTime
	slot_239_8_0 = slot_239_5_0 / 2
	slot_239_9_0 = slot_239_6_0 / 2

	slot_0_44_0(0, 0, 0, 0, {
		0,
		0,
		0,
		0,
		[0] = nil
	}, 0)
	slot_0_56_0()
	slot_0_106_0()

	if not slot_0_36_0.smooth_fps then
		slot_0_36_0.smooth_fps = 60
	end

	if not slot_0_36_0.wm_fps_acc then
		slot_0_36_0.wm_fps_acc = {
			fps = 60,
			frames = 0,
			[0] = nil,
			last = game.globalVars.m_flRealTime
		}
	end

	slot_0_36_0.wm_fps_acc.frames = slot_0_36_0.wm_fps_acc.frames + 1
	slot_239_10_0 = game.globalVars.m_flRealTime - slot_0_36_0.wm_fps_acc.last

	if slot_239_10_0 >= 1 then
		slot_239_11_10 = math.floor(slot_0_36_0.wm_fps_acc.frames / slot_239_10_0 + 0.5)

		if slot_239_11_10 > 0 and slot_239_11_10 < 999 then
			slot_0_36_0.wm_fps_acc.fps = slot_239_11_10
			slot_0_36_0.smooth_fps = slot_239_11_10
		end

		slot_0_36_0.wm_fps_acc.frames = 0
		slot_0_36_0.wm_fps_acc.last = game.globalVars.m_flRealTime
	else
		slot_0_36_0.smooth_fps = slot_0_36_0.wm_fps_acc.fps
	end

	if is_enabled("watermark_ws") then
		slot_239_11_9 = UI.dpi_scale or 1
		slot_239_12_8 = 22 * (UI.dpi_scale or 1)
		slot_239_13_7 = 12 * slot_239_11_9
		slot_239_14_5 = 16 * slot_239_11_9
		slot_239_15_7 = 12 * slot_239_11_9
		slot_239_16_8 = 6 * slot_239_11_9
		slot_239_17_9 = UI.font or draw.fonts.gui_semi_bold or draw.fonts.default

		function slot_239_18_10(arg_240_0, arg_240_1, arg_240_2, arg_240_3, arg_240_4)
			local var_240_0 = slot_239_0_0.font
			local var_240_1 = arg_240_2 + arg_240_3 / 2 + 2
			local var_240_2 = arg_240_1 + slot_239_15_7 / 2

			if arg_240_0 == "sparkle" then
				slot_239_0_0.font = slot_0_47_0.wm_silentium or slot_0_47_0.silentium or var_240_0

				local var_240_3 = slot_0_51_0(slot_239_0_0.font, "R")

				slot_239_0_0:AddText(draw.vec2(var_240_2 - var_240_3.x / 2, var_240_1 - var_240_3.y / 2), "R", arg_240_4)
			elseif arg_240_0 == "user" then
				slot_239_0_0.font = slot_0_47_0.wm_alt or slot_0_47_0.alt or var_240_0

				local var_240_4 = slot_0_51_0(slot_239_0_0.font, "C")

				slot_239_0_0:AddText(draw.vec2(var_240_2 - var_240_4.x / 2, var_240_1 - var_240_4.y / 2), "C", arg_240_4)
			elseif arg_240_0 == "graph" then
				slot_239_0_0.font = slot_0_47_0.wm_alt or slot_0_47_0.alt or var_240_0

				local var_240_5 = slot_0_51_0(slot_239_0_0.font, "D")

				slot_239_0_0:AddText(draw.vec2(var_240_2 - var_240_5.x / 2, var_240_1 - var_240_5.y / 2), "D", arg_240_4)
			elseif arg_240_0 == "signal" then
				slot_239_0_0.font = slot_0_47_0.wm_alt or slot_0_47_0.alt or var_240_0

				local var_240_6 = slot_0_51_0(slot_239_0_0.font, ";")

				slot_239_0_0:AddText(draw.vec2(var_240_2 - var_240_6.x / 2, var_240_1 - var_240_6.y / 2), ";", arg_240_4)
			elseif arg_240_0 == "clock" then
				slot_239_0_0.font = slot_0_47_0.wm_silentium or slot_0_47_0.silentium or var_240_0

				local var_240_7 = slot_0_51_0(slot_239_0_0.font, "H")

				slot_239_0_0:AddText(draw.vec2(var_240_2 - var_240_7.x / 2, var_240_1 - var_240_7.y / 2), "H", arg_240_4)
			elseif arg_240_0 == "build" then
				slot_239_0_0.font = slot_0_47_0.wm_alt or slot_0_47_0.alt or var_240_0

				local var_240_8 = slot_0_51_0(slot_239_0_0.font, "E")

				slot_239_0_0:AddText(draw.Vec2(var_240_2 - var_240_8.x / 2, var_240_1 - var_240_8.y / 2 + 1), "E", arg_240_4)
			end

			slot_239_0_0.font = var_240_0
		end

		slot_239_19_8 = utils and utils.GetDate and utils.GetDate() or {
			minute = 0,
			hour = 0,
			second = 0,
			[0] = nil
		}
		slot_239_20_8 = string.format("%02d:%02d:%02d", slot_239_19_8.hour or 0, slot_239_19_8.minute or 0, slot_239_19_8.second or 0)
		slot_239_21_8 = {
			{
				type = "sparkle",
				is_logo = true,
				text = "silentium",
				[0] = nil,
				show = is_enabled("wm_logo")
			},
			{
				type = "user",
				text = slot_0_36_0.username or "User",
				show = is_enabled("wm_user")
			},
			{
				type = "build",
				text = "Beta",
				show = is_enabled("wm_build") or true
			},
			{
				type = "graph",
				text = slot_0_36_0.smooth_fps .. " Fps",
				show = is_enabled("wm_fps")
			},
			{
				type = "signal",
				[0] = nil,
				text = slot_0_27_0() .. " ms",
				show = is_enabled("wm_ping")
			},
			{
				type = "clock",
				[0] = nil,
				text = slot_239_20_8,
				show = is_enabled("wm_time")
			}
		}
		slot_239_22_11 = {}

		for iter_239_0, iter_239_1 in ipairs(slot_239_21_8) do
			if iter_239_1.show then
				table.insert(slot_239_22_11, iter_239_1)
			end
		end

		if #slot_239_22_11 == 0 then
			return
		end

		slot_239_23_10 = slot_239_22_11
		slot_239_0_0.font = slot_239_17_9
		slot_239_24_10 = 0
		slot_239_25_8 = 0
		slot_239_26_12 = false

		for iter_239_2, iter_239_3 in ipairs(slot_239_23_10) do
			slot_239_32_8 = slot_0_51_0(slot_239_17_9, iter_239_3.text)
			iter_239_3.text_w, iter_239_3.text_h = slot_239_32_8.x, slot_239_32_8.y

			if iter_239_3.is_logo then
				slot_239_25_8 = slot_239_32_8.x + slot_239_13_7 * 2
				slot_239_26_12 = true
			else
				iter_239_3.w = slot_239_15_7 + slot_239_16_8 + slot_239_32_8.x
				slot_239_24_10 = slot_239_24_10 + iter_239_3.w + slot_239_14_5
			end
		end

		if slot_239_24_10 > 0 then
			slot_239_24_10 = slot_239_24_10 - slot_239_14_5 + slot_239_13_7 * 2
		end

		if not slot_239_26_12 then
			slot_239_24_10 = slot_239_24_10 + 5
		end

		slot_239_27_10 = slot_239_25_8 + slot_239_24_10
		slot_239_28_9 = slot_239_5_0 - slot_239_27_10 - 25
		slot_239_29_9 = 12
		slot_239_30_7 = 6 * slot_239_11_9
		slot_239_31_8 = UI.theme and UI.theme.accent or {
			255,
			90,
			130,
			255,
			[0] = nil
		}
		slot_239_32_7 = slot_239_31_8[1] or 255
		slot_239_33_12 = slot_239_31_8[2] or 90
		slot_239_34_6 = slot_239_31_8[3] or 130
		slot_239_35_6 = draw.GetTime()
		slot_239_36_6 = math.sin(draw.GetTime() * 1.5) * 0.5 + 0.5

		for iter_239_4 = 1, 4 do
			slot_239_41_6 = iter_239_4 * 1.5
			slot_239_42_5 = math.floor((22 - iter_239_4 * 5) * (0.4 + slot_239_36_6 * 0.6))

			if slot_239_42_5 > 0 then
				slot_239_0_0:AddRectFilledRounded(draw.Rect(slot_239_28_9 - slot_239_41_6, slot_239_29_9 - slot_239_41_6, slot_239_28_9 + slot_239_27_10 + slot_239_41_6, slot_239_29_9 + slot_239_12_8 + slot_239_41_6), draw.Color(slot_239_32_7, slot_239_33_12, slot_239_34_6, slot_239_42_5), slot_239_30_7 + slot_239_41_6, 15)
			end
		end

		function slot_239_37_1(arg_241_0, arg_241_1)
			local var_241_0 = math.sin(slot_239_35_6 * 1.2 + arg_241_0) * 0.5 + 0.5

			return draw.Color(math.floor(5 + slot_239_32_7 * 0.15 * var_241_0), math.floor(5 + slot_239_33_12 * 0.15 * var_241_0), math.floor(8 + slot_239_34_6 * 0.15 * var_241_0), math.floor(arg_241_1 * (0.8 + var_241_0 * 0.2)))
		end

		slot_239_38_1 = draw.Color(12, 12, 14, 255)
		slot_239_39_3 = 8 * slot_239_11_9
		slot_239_40_4 = slot_239_28_9 + slot_239_25_8

		slot_239_0_0:AddRectRounded(draw.Rect(slot_239_28_9, slot_239_29_9, slot_239_28_9 + slot_239_27_10, slot_239_29_9 + slot_239_12_8), draw.Color(255, 255, 255, 6), slot_239_30_7, 15, 1)
		slot_239_0_0:AddRectFilledRoundedMulticolor(draw.Rect(slot_239_28_9, slot_239_29_9, slot_239_28_9 + slot_239_27_10, slot_239_29_9 + slot_239_12_8), {
			slot_239_37_1(0, 200),
			slot_239_37_1(2, 220),
			slot_239_37_1(4, 210),
			slot_239_37_1(6, 190)
		}, slot_239_30_7, 15)

		if slot_239_26_12 then
			slot_239_41_5 = draw.Rect(slot_239_28_9 + slot_239_30_7, slot_239_29_9, slot_239_40_4 - slot_239_39_3 + 1.5, slot_239_29_9 + slot_239_12_8)

			slot_239_0_0:AddCircleFilled(draw.Vec2(slot_239_28_9 + slot_239_30_7, slot_239_29_9 + slot_239_30_7), slot_239_30_7, slot_239_38_1)
			slot_239_0_0:AddCircleFilled(draw.Vec2(slot_239_28_9 + slot_239_30_7, slot_239_29_9 + slot_239_12_8 - slot_239_30_7), slot_239_30_7, slot_239_38_1)
			slot_239_0_0:AddRectFilled(draw.Rect(slot_239_28_9, slot_239_29_9 + slot_239_30_7, slot_239_28_9 + slot_239_30_7 + 0.5, slot_239_29_9 + slot_239_12_8 - slot_239_30_7), slot_239_38_1)
			slot_239_0_0:AddRectFilled(slot_239_41_5, slot_239_38_1)

			for iter_239_5 = 0, slot_239_12_8 - 1 do
				slot_239_46_3 = iter_239_5 / slot_239_12_8 * (slot_239_39_3 * 2) - slot_239_39_3
				slot_239_47_3 = slot_239_40_4 - slot_239_39_3
				slot_239_48_3 = slot_239_40_4 + slot_239_46_3

				if slot_239_47_3 < slot_239_48_3 then
					slot_239_0_0:AddRectFilled(draw.Rect(slot_239_47_3, slot_239_29_9 + iter_239_5, slot_239_48_3 + 1.5, slot_239_29_9 + iter_239_5 + 1), slot_239_38_1)
				end
			end

			slot_239_0_0:AddLine(draw.Vec2(slot_239_40_4 - slot_239_39_3, slot_239_29_9), draw.Vec2(slot_239_40_4 + slot_239_39_3, slot_239_29_9 + slot_239_12_8), draw.Color(255, 255, 255, 12), 1)
		end

		slot_239_41_4 = slot_239_28_9 + (slot_239_26_12 and slot_239_13_7 - 3 * slot_239_11_9 or slot_239_13_7)

		for iter_239_6, iter_239_7 in ipairs(slot_239_23_10) do
			slot_239_47_2 = slot_239_29_9 + slot_239_12_8 / 2 - iter_239_7.text_h / 2

			if iter_239_7.is_logo then
				slot_239_0_0.font = UI.font_italic or slot_239_17_9
				slot_239_48_2 = "silentium"
				slot_239_49_1 = slot_239_41_4

				for iter_239_8 = 1, #slot_239_48_2 do
					slot_239_54_1 = slot_239_48_2:sub(iter_239_8, iter_239_8)
					slot_239_55_1 = math.sin(slot_239_35_6 * 3 + iter_239_8 * 0.4) * 0.5 + 0.5
					slot_239_56_0 = draw.Color(math.floor(255 + (slot_239_32_7 - 255) * slot_239_55_1), math.floor(255 + (slot_239_33_12 - 255) * slot_239_55_1), math.floor(255 + (slot_239_34_6 - 255) * slot_239_55_1), 255)

					slot_239_0_0:AddText(draw.Vec2(slot_239_49_1, slot_239_47_2 - 2), slot_239_54_1, slot_239_56_0)

					slot_239_49_1 = slot_239_49_1 + slot_0_51_0(slot_239_0_0.font, slot_239_54_1).x
				end

				slot_239_41_4 = slot_239_28_9 + slot_239_25_8 + slot_239_13_7
			else
				slot_239_18_10(iter_239_7.type, slot_239_41_4, slot_239_29_9, slot_239_12_8, draw.Color(slot_239_32_7, slot_239_33_12, slot_239_34_6, 255))

				slot_239_0_0.font = slot_239_17_9

				slot_239_0_0:AddText(draw.Vec2(slot_239_41_4 + slot_239_15_7 + slot_239_16_8, slot_239_47_2), iter_239_7.text, draw.Color(255, 255, 255, 255))

				slot_239_41_4 = slot_239_41_4 + slot_239_15_7 + slot_239_16_8 + iter_239_7.text_w + slot_239_14_5
			end
		end
	end

	slot_0_102_0()
	slot_0_100_0()

	if is_enabled("manual_arrows") and slot_239_4_0 and slot_239_4_0:IsAlive() then
		slot_239_11_8 = gui.ctx:find("rage>anti-aim>angles>yaw>settings>amount")
		slot_239_12_7 = gui.ctx:find("rage>anti-aim>angles>manual override>override left")
		slot_239_13_6 = gui.ctx:find("rage>anti-aim>angles>manual override>override right")

		function slot_239_14_4(arg_242_0, arg_242_1, arg_242_2, arg_242_3)
			local var_242_0 = arg_242_2 * arg_242_1
			local var_242_1 = var_242_0 * (1 - math.abs(arg_242_0 / 60 % 2 - 1))
			local var_242_2 = arg_242_2 - var_242_0
			local var_242_3
			local var_242_4
			local var_242_5

			if arg_242_0 < 60 then
				var_242_3, var_242_4, var_242_5 = var_242_0, var_242_1, 0
			elseif arg_242_0 < 120 then
				var_242_3, var_242_4, var_242_5 = var_242_1, var_242_0, 0
			elseif arg_242_0 < 180 then
				var_242_3, var_242_4, var_242_5 = 0, var_242_0, var_242_1
			elseif arg_242_0 < 240 then
				var_242_3, var_242_4, var_242_5 = 0, var_242_1, var_242_0
			elseif arg_242_0 < 300 then
				var_242_3, var_242_4, var_242_5 = var_242_1, 0, var_242_0
			else
				var_242_3, var_242_4, var_242_5 = var_242_0, 0, var_242_1
			end

			return draw.Color((var_242_3 + var_242_2) * 255, (var_242_4 + var_242_2) * 255, (var_242_5 + var_242_2) * 255, arg_242_3 * 255)
		end

		function slot_239_15_6()
			if slot_239_11_8 and slot_239_11_8.GetHotkeyState and slot_239_11_8:GetHotkeyState() then
				local var_243_0 = slot_239_11_8:GetValue()

				if var_243_0 and var_243_0.get then
					local var_243_1 = var_243_0:Get()

					if var_243_1 == -180 then
						return 2
					elseif var_243_1 <= -90 then
						return 1
					elseif var_243_1 >= 65 then
						return -1
					else
						return 0
					end
				end
			end

			for iter_243_0, iter_243_1 in pairs({
				slot_239_12_7,
				slot_239_13_6
			}) do
				if iter_243_1 and iter_243_1.GetHotkeyState and iter_243_1:GetHotkeyState() then
					return iter_243_1 == slot_239_12_7 and -1 or 1
				end

				if iter_243_1 and iter_243_1.GetValue then
					local var_243_2 = iter_243_1:GetValue()

					if var_243_2 and var_243_2.get_direct and var_243_2:get_direct() then
						return iter_243_1 == slot_239_12_7 and -1 or 1
					end
				end
			end

			return 0
		end

		function slot_239_16_7(arg_244_0, arg_244_1, arg_244_2, arg_244_3, arg_244_4, arg_244_5, arg_244_6)
			local var_244_0 = arg_244_3 * arg_244_6
			local var_244_1, var_244_2, var_244_3, var_244_4 = slot_0_40_0(arg_244_4)
			local var_244_5 = var_244_0 * 0.9
			local var_244_6
			local var_244_7
			local var_244_8

			if arg_244_5 == -1 then
				var_244_6 = draw.Vec2(arg_244_1 + var_244_0, arg_244_2 - var_244_5)
				var_244_7 = draw.Vec2(arg_244_1, arg_244_2)
				var_244_8 = draw.Vec2(arg_244_1 + var_244_0, arg_244_2 + var_244_5)
			else
				var_244_6 = draw.Vec2(arg_244_1 - var_244_0, arg_244_2 - var_244_5)
				var_244_7 = draw.Vec2(arg_244_1, arg_244_2)
				var_244_8 = draw.Vec2(arg_244_1 - var_244_0, arg_244_2 + var_244_5)
			end

			arg_244_0:AddTriangleFilled(var_244_6, var_244_7, var_244_8, draw.Color(var_244_1, var_244_2, var_244_3, math.floor(var_244_4 * 0.35)))

			local var_244_9 = draw.Color(var_244_1, var_244_2, var_244_3, var_244_4)

			arg_244_0:AddLine(var_244_6, var_244_7, var_244_9, 1.5)
			arg_244_0:AddLine(var_244_7, var_244_8, var_244_9, 1.5)
			arg_244_0:AddLine(var_244_8, var_244_6, var_244_9, 1.5)
		end

		if not UI.manual_arrows_state then
			UI.manual_arrows_state = {
				cur_alpha_right = 0,
				cur_alpha_left = 0,
				last_active = 0,
				cur_scale_right = 0.7,
				cur_scale_left = 0.7,
				[0] = nil
			}
		end

		slot_239_17_8 = UI.manual_arrows_state
		slot_239_18_9 = slot_239_5_0 / 2
		slot_239_19_7 = slot_239_6_0 / 2
		slot_239_20_7 = slot_0_19_0(slot_239_4_0)

		if not slot_239_17_8.scope_anim then
			slot_239_17_8.scope_anim = 0
		end

		slot_239_21_7 = math.min(1, 10 * game.globalVars.m_flRenderFrameTime)
		slot_239_17_8.scope_anim = slot_239_17_8.scope_anim + ((slot_239_20_7 and 1 or 0) - slot_239_17_8.scope_anim) * slot_239_21_7
		slot_239_22_10 = slot_239_17_8.scope_anim * 10
		slot_239_23_9 = 85 + (UI.cfg.manual_arrows_x or 0)
		slot_239_24_9 = 5
		slot_239_25_7 = false
		slot_239_26_11 = slot_239_15_6()
		slot_239_27_9 = 0
		slot_239_28_8 = 0
		slot_239_29_8 = 0.7
		slot_239_30_6 = 0.7

		if slot_239_26_11 == -1 then
			slot_239_27_9 = 255
			slot_239_28_8 = 0
			slot_239_29_8 = 1.2
			slot_239_30_6 = 0.5
			slot_239_17_8.last_active = slot_239_7_0
		elseif slot_239_26_11 == 1 then
			slot_239_27_9 = 0
			slot_239_28_8 = 255
			slot_239_29_8 = 0.5
			slot_239_30_6 = 1.2
			slot_239_17_8.last_active = slot_239_7_0
		elseif slot_239_26_11 == 2 then
			slot_239_27_9 = 255
			slot_239_28_8 = 255
			slot_239_31_7 = math.sin(slot_239_7_0 * 4) * 0.15 + 1
			slot_239_29_8 = slot_239_31_7
			slot_239_30_6 = slot_239_31_7
			slot_239_17_8.last_active = slot_239_7_0
		elseif slot_239_7_0 - slot_239_17_8.last_active > 0.8 then
			slot_239_27_9 = 0
			slot_239_28_8 = 0
			slot_239_29_8 = 0.5
			slot_239_30_6 = 0.5
		else
			slot_239_29_8 = 0.7
			slot_239_30_6 = 0.7
		end

		slot_239_31_6 = game.globalVars.m_flRenderFrameTime
		slot_239_32_6 = math.min(1, 14 * slot_239_31_6)
		slot_239_33_11 = math.min(1, 10 * slot_239_31_6)
		slot_239_17_8.cur_alpha_left = slot_239_17_8.cur_alpha_left + (slot_239_27_9 - slot_239_17_8.cur_alpha_left) * slot_239_32_6
		slot_239_17_8.cur_alpha_right = slot_239_17_8.cur_alpha_right + (slot_239_28_8 - slot_239_17_8.cur_alpha_right) * slot_239_32_6
		slot_239_17_8.cur_scale_left = slot_239_17_8.cur_scale_left + (slot_239_29_8 - slot_239_17_8.cur_scale_left) * slot_239_33_11
		slot_239_17_8.cur_scale_right = slot_239_17_8.cur_scale_right + (slot_239_30_6 - slot_239_17_8.cur_scale_right) * slot_239_33_11
		slot_239_34_5 = UI.cfg.manual_arrows_color or {
			255,
			255,
			255,
			255,
			[0] = nil
		}

		if slot_239_17_8.cur_alpha_left > 5 then
			slot_239_35_5 = slot_239_17_8.cur_alpha_left / 255
			slot_239_36_5 = draw.Color(slot_239_34_5[1], slot_239_34_5[2], slot_239_34_5[3], math.floor(slot_239_34_5[4] * slot_239_35_5))

			slot_239_16_7(slot_239_0_0, slot_239_18_9 - slot_239_23_9, slot_239_19_7 + slot_239_22_10, slot_239_24_9, slot_239_36_5, -1, slot_239_17_8.cur_scale_left)
		end

		if slot_239_17_8.cur_alpha_right > 5 then
			slot_239_35_4 = slot_239_17_8.cur_alpha_right / 255
			slot_239_36_4 = draw.Color(slot_239_34_5[1], slot_239_34_5[2], slot_239_34_5[3], math.floor(slot_239_34_5[4] * slot_239_35_4))

			slot_239_16_7(slot_239_0_0, slot_239_18_9 + slot_239_23_9, slot_239_19_7 + slot_239_22_10, slot_239_24_9, slot_239_36_4, 1, slot_239_17_8.cur_scale_right)
		end
	end

	if is_enabled("damage_rings") then
		slot_239_11_7 = 0.8

		for iter_239_9 = #slot_0_36_0.damage_rings, 1, -1 do
			slot_239_16_6 = slot_0_36_0.damage_rings[iter_239_9]
			slot_239_17_7 = slot_239_7_0 - slot_239_16_6.time

			if slot_239_11_7 < slot_239_17_7 then
				table.remove(slot_0_36_0.damage_rings, iter_239_9)
			else
				slot_239_18_8 = slot_239_17_7 / slot_239_11_7
				slot_239_20_6 = slot_239_18_8 * 60
				slot_239_21_6 = math.floor(255 * (1 - slot_239_18_8))
				slot_239_22_9 = nil
				slot_239_23_8 = nil
				slot_239_24_8 = nil

				if slot_239_16_6.damage >= 75 then
					slot_239_22_9, slot_239_23_8, slot_239_24_8 = 255, 50, 50
				elseif slot_239_16_6.damage >= 40 then
					slot_239_22_9, slot_239_23_8, slot_239_24_8 = 255, 150, 50
				else
					slot_239_22_9, slot_239_23_8, slot_239_24_8 = 255, 255, 50
				end

				slot_239_0_0:AddCircle(draw.Vec2(slot_239_16_6.center_x, slot_239_16_6.center_y), slot_239_20_6, draw.Color(slot_239_22_9, slot_239_23_8, slot_239_24_8, slot_239_21_6), 32, 2)
			end
		end
	end

	if is_enabled("killstreak") and slot_0_36_0.killstreak.count > 0 then
		slot_239_11_6 = slot_0_36_0.killstreak.count
		slot_239_12_6 = string.format("%d KILL%s", slot_239_11_6, slot_239_11_6 > 1 and "S" or "")
		slot_239_13_5 = slot_0_51_0(slot_239_1_0, slot_239_12_6)
		slot_239_14_3 = slot_239_13_5.x + 40
		slot_239_15_4 = 32

		if UI.cfg.killstreak_x == nil then
			UI.cfg.killstreak_x = slot_239_5_0 / 2
		end

		if UI.cfg.killstreak_y == nil then
			UI.cfg.killstreak_y = slot_239_6_0 / 2 + 100
		end

		slot_239_16_5 = UI.cfg.killstreak_x
		slot_239_17_6 = UI.cfg.killstreak_y

		if UI.open then
			slot_239_18_7 = slot_0_10_0()
			slot_239_19_6 = slot_0_11_0() or slot_0_60_0

			if slot_239_18_7 and slot_239_19_6 then
				if not slot_0_36_0.killstreak.dragging then
					if slot_239_16_5 <= slot_239_18_7.x and slot_239_18_7.x <= slot_239_16_5 + slot_239_14_3 and slot_239_17_6 <= slot_239_18_7.y and slot_239_18_7.y <= slot_239_17_6 + slot_239_15_4 then
						slot_0_36_0.killstreak.dragging = true
						slot_0_36_0.killstreak.drag_offset_x = slot_239_18_7.x - slot_239_16_5
						slot_0_36_0.killstreak.drag_offset_y = slot_239_18_7.y - slot_239_17_6
					end
				else
					UI.cfg.killstreak_x = slot_239_18_7.x - slot_0_36_0.killstreak.drag_offset_x
					UI.cfg.killstreak_y = slot_239_18_7.y - slot_0_36_0.killstreak.drag_offset_y
					UI.cfg.killstreak_x, UI.cfg.killstreak_y = slot_0_20_0(UI.cfg.killstreak_x, UI.cfg.killstreak_y, slot_239_14_3, slot_239_15_4, slot_0_36_0.killstreak.dragging)
				end
			else
				slot_0_36_0.killstreak.dragging = false
			end
		end

		slot_239_16_4 = UI.cfg.killstreak_x
		slot_239_17_5 = UI.cfg.killstreak_y
		slot_239_19_5 = 1 + (math.sin(slot_239_7_0 * 5) + 1) / 2 * 0.1
		slot_239_20_5 = math.min(slot_239_11_6 / 10, 1)
		slot_239_21_5 = slot_239_2_0.accent
		slot_239_22_8 = {
			255,
			255,
			255,
			255,
			[0] = nil
		}
		slot_239_23_7 = slot_239_20_5 * 0.5
		slot_239_24_7 = math.Lerp(slot_239_21_5[1], slot_239_22_8[1], slot_239_23_7)
		slot_239_25_6 = math.Lerp(slot_239_21_5[2], slot_239_22_8[2], slot_239_23_7)
		slot_239_26_10 = math.Lerp(slot_239_21_5[3], slot_239_22_8[3], slot_239_23_7)
		slot_239_27_8 = draw.Color(slot_239_24_7, slot_239_25_6, slot_239_26_10, 255)
		slot_239_28_7 = math.min(3 + math.floor(slot_239_11_6 / 5), 8)
		slot_239_29_7 = UI.cfg.theme_accent or slot_239_2_0.accent or {
			255,
			90,
			130,
			255,
			[0] = nil
		}

		for iter_239_10 = 1, slot_239_28_7 do
			slot_239_34_4 = iter_239_10 * 2
			slot_239_35_3 = math.floor((20 - iter_239_10 * 2) * slot_239_19_5)

			slot_239_0_0:AddRectFilledRounded(draw.Rect(slot_239_16_4 - slot_239_34_4, slot_239_17_5 - slot_239_34_4, slot_239_16_4 + slot_239_14_3 + slot_239_34_4, slot_239_17_5 + slot_239_15_4 + slot_239_34_4), slot_0_41_0(slot_239_29_7, slot_239_35_3), 8)
		end

		slot_239_0_0:AddRectFilledRounded(draw.Rect(slot_239_16_4, slot_239_17_5, slot_239_16_4 + slot_239_14_3, slot_239_17_5 + slot_239_15_4), draw.Color(20, 10, 20, 240), 6)
		slot_239_0_0:AddText(draw.Vec2(slot_239_16_4 + 20, slot_239_17_5 + slot_239_15_4 / 2 - slot_239_13_5.y / 2), slot_239_12_6, draw.Color(255, 255, 255, 255))
	end

	if is_enabled("velocity") then
		slot_239_11_5 = entities:GetLocalPawn()

		if slot_239_11_5 and slot_239_11_5.get_abs_velocity then
			slot_239_12_5 = slot_239_11_5:GetAbsVelocity()

			if slot_239_12_5 then
				slot_239_13_4 = math.sqrt(slot_239_12_5.x * slot_239_12_5.x + slot_239_12_5.y * slot_239_12_5.y)
				slot_239_14_2 = 200
				slot_239_15_3 = 24

				if UI.cfg.velocity_y == nil or UI.cfg.velocity_y == 0 then
					UI.cfg.velocity_x = slot_239_5_0 / 2 - slot_239_14_2 / 2
					UI.cfg.velocity_y = slot_239_6_0 - 60
				end

				slot_239_16_3 = UI.cfg.velocity_x
				slot_239_17_4 = UI.cfg.velocity_y

				if UI.open then
					slot_239_18_6 = slot_0_10_0()
					slot_239_19_4 = slot_0_11_0() or slot_0_60_0

					if slot_239_18_6 and slot_239_19_4 then
						if not slot_0_36_0.velocity.dragging then
							if slot_239_16_3 <= slot_239_18_6.x and slot_239_18_6.x <= slot_239_16_3 + slot_239_14_2 and slot_239_17_4 <= slot_239_18_6.y and slot_239_18_6.y <= slot_239_17_4 + slot_239_15_3 then
								slot_0_36_0.velocity.dragging = true
								slot_0_36_0.velocity.drag_offset_x = slot_239_18_6.x - slot_239_16_3
								slot_0_36_0.velocity.drag_offset_y = slot_239_18_6.y - slot_239_17_4
							end
						else
							UI.cfg.velocity_x = slot_239_18_6.x - slot_0_36_0.velocity.drag_offset_x
							UI.cfg.velocity_y = slot_239_18_6.y - slot_0_36_0.velocity.drag_offset_y
							UI.cfg.velocity_x, UI.cfg.velocity_y = slot_0_20_0(UI.cfg.velocity_x, UI.cfg.velocity_y, slot_239_14_2, slot_239_15_3, slot_0_36_0.velocity.dragging)
							slot_239_16_3, slot_239_17_4 = UI.cfg.velocity_x, UI.cfg.velocity_y
						end
					else
						slot_0_36_0.velocity.dragging = false
					end
				end

				slot_239_18_5 = 300
				slot_239_19_3 = math.min(slot_239_13_4 / slot_239_18_5, 1)
				slot_239_20_4 = slot_239_2_0.accent or {
					255,
					90,
					130,
					255,
					[0] = nil
				}
				slot_239_21_4 = nil
				slot_239_22_7 = nil
				slot_239_23_6 = nil
				slot_239_24_6 = false
				slot_239_25_5 = slot_239_11_5:GetActiveWeapon()

				if slot_239_25_5 and slot_239_25_5:GetClassName() == "C_WeaponSSG08" and slot_0_7_0.band(slot_239_11_5.m_fFlags:Get(), 1) == 0 then
					slot_239_26_9 = slot_239_25_5:GetInaccuracy(0)
					slot_239_27_7 = math.sqrt(slot_239_12_5.x * slot_239_12_5.x + slot_239_12_5.y * slot_239_12_5.y)
					slot_239_24_6 = slot_239_26_9 <= (0.085 + math.min(1, slot_239_27_7 / 12) * 0.22499999999999998) * 1.05 or slot_239_12_5.z > -10 and slot_239_12_5.z < 15
				end

				if slot_239_24_6 then
					slot_239_21_4, slot_239_22_7, slot_239_23_6 = slot_239_20_4[1], slot_239_20_4[2], slot_239_20_4[3]
				else
					slot_239_26_8 = slot_239_19_3
					slot_239_21_4 = math.floor(255 + (slot_239_20_4[1] - 255) * slot_239_26_8)
					slot_239_22_7 = math.floor(255 + (slot_239_20_4[2] - 255) * slot_239_26_8)
					slot_239_23_6 = math.floor(255 + (slot_239_20_4[3] - 255) * slot_239_26_8)
				end

				slot_239_0_0:AddRectFilledRounded(draw.Rect(slot_239_16_3, slot_239_17_4, slot_239_16_3 + slot_239_14_2, slot_239_17_4 + slot_239_15_3), draw.Color(20, 10, 20, 200), 4)

				slot_239_26_7 = slot_239_14_2 * slot_239_19_3

				if slot_239_26_7 > 0 then
					slot_239_0_0:AddRectFilledRounded(draw.Rect(slot_239_16_3, slot_239_17_4, slot_239_16_3 + slot_239_26_7, slot_239_17_4 + slot_239_15_3), draw.Color(slot_239_21_4, slot_239_22_7, slot_239_23_6, 200), 4)
				end

				slot_239_0_0:AddRectRounded(draw.Rect(slot_239_16_3, slot_239_17_4, slot_239_16_3 + slot_239_14_2, slot_239_17_4 + slot_239_15_3), draw.Color(slot_239_21_4, slot_239_22_7, slot_239_23_6, 255), 4)

				slot_239_27_6 = string.format("%.0f u/s", slot_239_13_4)
				slot_239_28_6 = slot_0_51_0(slot_239_1_0, slot_239_27_6)

				slot_239_0_0:AddText(draw.Vec2(slot_239_16_3 + slot_239_14_2 / 2 - slot_239_28_6.x / 2, slot_239_17_4 + slot_239_15_3 / 2 - slot_239_28_6.y / 2), slot_239_27_6, draw.Color(255, 255, 255, 255))
			end
		end
	end

	if is_enabled("trails") then
		if not game.engine:InGame() then
			slot_0_36_0.trails = {}
		else
			slot_239_11_4 = entities:GetLocalPawn()

			if slot_239_11_4 then
				slot_239_12_4 = slot_0_35_0(slot_239_11_4)
				slot_239_13_3 = nil
				slot_239_14_1 = nil
				slot_239_15_2 = nil

				if slot_239_12_4 then
					slot_239_13_3, slot_239_14_1, slot_239_15_2 = slot_239_12_4.x, slot_239_12_4.y, slot_239_12_4.z
				end

				if slot_239_13_3 and slot_239_14_1 and slot_239_15_2 then
					slot_239_16_2 = vector(slot_239_13_3, slot_239_14_1, slot_239_15_2)
					slot_239_17_3 = true

					if #slot_0_36_0.trails > 0 then
						slot_239_18_4 = slot_0_36_0.trails[1]

						if math.sqrt((slot_239_13_3 - slot_239_18_4.pos.x)^2 + (slot_239_14_1 - slot_239_18_4.pos.y)^2 + (slot_239_15_2 - slot_239_18_4.pos.z)^2) < 5 then
							slot_239_17_3 = false
						end
					end

					if slot_239_17_3 then
						table.insert(slot_0_36_0.trails, 1, {
							[0] = nil,
							pos = slot_239_16_2,
							time = slot_239_7_0
						})
					end

					slot_239_18_3 = 1

					for iter_239_11 = #slot_0_36_0.trails, 1, -1 do
						if slot_239_18_3 < slot_239_7_0 - slot_0_36_0.trails[iter_239_11].time then
							table.remove(slot_0_36_0.trails, iter_239_11)
						end
					end

					if #slot_0_36_0.trails > 1 then
						for iter_239_12 = 1, #slot_0_36_0.trails - 1 do
							slot_239_23_5 = slot_0_36_0.trails[iter_239_12]
							slot_239_24_5 = slot_0_36_0.trails[iter_239_12 + 1]
							slot_239_25_4 = math.WorldToScreen(slot_239_23_5.pos)
							slot_239_26_6 = math.WorldToScreen(slot_239_24_5.pos)

							if slot_239_25_4 and slot_239_26_6 then
								slot_239_27_5 = slot_239_7_0 - slot_239_23_5.time
								slot_239_28_5 = math.floor(255 * (1 - slot_239_27_5 / slot_239_18_3))
								slot_239_29_6 = UI.cfg.trails_color or {
									255,
									90,
									130,
									255,
									[0] = nil
								}

								slot_239_0_0:AddLine(draw.Vec2(slot_239_25_4.x, slot_239_25_4.y), draw.Vec2(slot_239_26_6.x, slot_239_26_6.y), draw.Color(slot_239_29_6[1], slot_239_29_6[2], slot_239_29_6[3], slot_239_28_5), 2)
							end
						end
					end
				end
			else
				slot_0_36_0.trails = {}
			end
		end
	end

	if is_enabled("floating_damage") then
		slot_239_11_3 = 600
		slot_239_12_3 = -0.45
		slot_239_13_2 = draw.surface

		for iter_239_13 = #slot_0_36_0.floating_damage, 1, -1 do
			slot_239_18_2 = slot_0_36_0.floating_damage[iter_239_13]
			slot_239_19_2 = slot_239_7_0 - slot_239_18_2.time
			slot_239_20_3 = slot_239_18_2.enhanced and 2.5 or 1.5

			if slot_239_20_3 < slot_239_19_2 then
				table.remove(slot_0_36_0.floating_damage, iter_239_13)
			else
				slot_239_21_3 = game.globalVars.m_flRenderFrameTime

				if slot_239_18_2.enhanced then
					slot_239_22_4 = vector(slot_239_18_2.pos.x + slot_239_18_2.vel_x * slot_239_21_3, slot_239_18_2.pos.y + slot_239_18_2.vel_y * slot_239_21_3, slot_239_18_2.pos.z + (slot_239_18_2.vel_z - 0.5 * slot_239_11_3 * slot_239_21_3) * slot_239_21_3)
					slot_239_23_4 = Ray_t()
					slot_239_24_4 = game.physicsQueryInterface:TraceRay(slot_239_23_4, slot_239_18_2.pos, slot_239_22_4)

					if slot_239_24_4:DidHit() and (slot_239_18_2.bounces or 0) < 3 then
						slot_239_25_3 = slot_239_24_4.m_Plane.normal
						slot_239_26_5 = slot_239_18_2.vel_x * slot_239_25_3.x + slot_239_18_2.vel_y * slot_239_25_3.y + slot_239_18_2.vel_z * slot_239_25_3.z
						slot_239_18_2.vel_x = (slot_239_18_2.vel_x - 2 * slot_239_26_5 * slot_239_25_3.x) * math.abs(slot_239_12_3)
						slot_239_18_2.vel_y = (slot_239_18_2.vel_y - 2 * slot_239_26_5 * slot_239_25_3.y) * math.abs(slot_239_12_3)
						slot_239_18_2.vel_z = (slot_239_18_2.vel_z - 2 * slot_239_26_5 * slot_239_25_3.z) * math.abs(slot_239_12_3)
						slot_239_18_2.pos = slot_239_24_4.m_vEndPos + slot_239_25_3
						slot_239_18_2.bounces = (slot_239_18_2.bounces or 0) + 1
					else
						slot_239_18_2.vel_z = slot_239_18_2.vel_z - slot_239_11_3 * slot_239_21_3
						slot_239_18_2.pos = slot_239_22_4
					end
				else
					slot_239_18_2.pos.z = slot_239_18_2.pos.z + slot_239_18_2.vel_z * slot_239_21_3 * (1 - slot_239_19_2 / slot_239_20_3)
				end

				slot_239_22_3 = math.WorldToScreen(slot_239_18_2.pos)

				if slot_239_22_3 then
					slot_239_23_3 = slot_239_19_2 / slot_239_20_3
					slot_239_24_3 = math.floor(255 * math.pow(1 - slot_239_23_3, 1.5))
					slot_239_25_2 = tostring(slot_239_18_2.damage)
					slot_239_26_4 = slot_239_18_2.style == "Enhanced"
					slot_239_27_4 = slot_239_26_4 and (draw.fonts.gui_bold or draw.fonts.gui_main) or draw.fonts.gui_main
					slot_239_28_4 = slot_0_51_0(slot_239_27_4, slot_239_25_2)

					if slot_239_26_4 then
						slot_239_29_5 = 1

						if slot_239_19_2 < 0.12 then
							slot_239_29_5 = 1 + (1 - slot_239_19_2 / 0.12) * 1.2
						end

						slot_239_30_5 = 255
						slot_239_31_5 = 255
						slot_239_32_5 = 255
						slot_239_33_9 = UI.cfg.floating_damage_color or {
							255,
							255,
							255,
							255,
							[0] = nil
						}

						if slot_239_18_2.is_critical then
							slot_239_30_5, slot_239_31_5, slot_239_32_5 = slot_239_33_9[1], slot_239_33_9[2], slot_239_33_9[3]
						else
							slot_239_30_5, slot_239_31_5, slot_239_32_5 = 255, 255, 255
						end

						slot_239_34_3 = slot_239_22_3.x - slot_239_28_4.x * slot_239_29_5 / 2
						slot_239_35_2 = slot_239_22_3.y - slot_239_28_4.y * slot_239_29_5 / 2
						slot_239_36_3 = slot_239_13_2.font
						slot_239_13_2.font = slot_239_27_4

						for iter_239_14 = 3, 1, -1 do
							slot_239_41_3 = math.floor(slot_239_24_3 * (0.12 / iter_239_14))
							slot_239_42_4 = iter_239_14 * 2 * slot_239_29_5

							slot_239_13_2:AddText(draw.Vec2(slot_239_34_3 - slot_239_42_4, slot_239_35_2 - slot_239_42_4), slot_239_25_2, draw.Color(slot_239_30_5, slot_239_31_5, slot_239_32_5, slot_239_41_3))
							slot_239_13_2:AddText(draw.Vec2(slot_239_34_3 + slot_239_42_4, slot_239_35_2 - slot_239_42_4), slot_239_25_2, draw.Color(slot_239_30_5, slot_239_31_5, slot_239_32_5, slot_239_41_3))
							slot_239_13_2:AddText(draw.Vec2(slot_239_34_3 - slot_239_42_4, slot_239_35_2 + slot_239_42_4), slot_239_25_2, draw.Color(slot_239_30_5, slot_239_31_5, slot_239_32_5, slot_239_41_3))
							slot_239_13_2:AddText(draw.Vec2(slot_239_34_3 + slot_239_42_4, slot_239_35_2 + slot_239_42_4), slot_239_25_2, draw.Color(slot_239_30_5, slot_239_31_5, slot_239_32_5, slot_239_41_3))
						end

						slot_239_13_2:AddText(draw.Vec2(slot_239_34_3 + 1, slot_239_35_2 + 1), slot_239_25_2, draw.Color(0, 0, 0, slot_239_24_3))
						slot_239_13_2:AddText(draw.Vec2(slot_239_34_3 - 1, slot_239_35_2 + 1), slot_239_25_2, draw.Color(0, 0, 0, slot_239_24_3))
						slot_239_13_2:AddText(draw.Vec2(slot_239_34_3, slot_239_35_2), slot_239_25_2, draw.Color(slot_239_30_5, slot_239_31_5, slot_239_32_5, slot_239_24_3))

						slot_239_13_2.font = slot_239_36_3
					else
						slot_239_29_4 = 255
						slot_239_30_4 = 255
						slot_239_31_4 = 255
						slot_239_32_4 = UI.cfg.floating_damage_color or {
							255,
							255,
							255,
							255,
							[0] = nil
						}

						if slot_239_18_2.is_critical then
							slot_239_29_4, slot_239_30_4, slot_239_31_4 = 255, 80, 80
						else
							slot_239_29_4, slot_239_30_4, slot_239_31_4 = slot_239_32_4[1], slot_239_32_4[2], slot_239_32_4[3]
						end

						slot_239_33_8 = 1

						if slot_239_19_2 < 0.15 then
							slot_239_33_7 = slot_239_19_2 / 0.15
						elseif slot_239_19_2 > slot_239_20_3 - 0.3 then
							slot_239_33_6 = (slot_239_20_3 - slot_239_19_2) / 0.3
						end

						slot_239_34_2 = slot_239_22_3.x - slot_239_28_4.x / 2
						slot_239_35_1 = slot_239_22_3.y - slot_239_28_4.y / 2
						slot_239_36_2 = slot_239_13_2.font
						slot_239_13_2.font = slot_239_27_4

						slot_239_13_2:AddText(draw.Vec2(slot_239_34_2 + 1, slot_239_35_1 + 1), slot_239_25_2, draw.Color(0, 0, 0, slot_239_24_3))
						slot_239_13_2:AddText(draw.Vec2(slot_239_34_2, slot_239_35_1), slot_239_25_2, draw.Color(slot_239_29_4, slot_239_30_4, slot_239_31_4, slot_239_24_3))

						slot_239_13_2.font = slot_239_36_2
					end
				end
			end
		end
	end

	if is_enabled("soul_particles") then
		slot_239_11_2 = UI.cfg.soul_particles_lifetime or 1.5
		slot_239_12_2 = UI.cfg.soul_particles_color or {
			255,
			255,
			255,
			255,
			[0] = nil
		}

		for iter_239_15 = #slot_0_36_0.soul_particles, 1, -1 do
			slot_239_17_1 = slot_0_36_0.soul_particles[iter_239_15]
			slot_239_18_1 = slot_239_7_0 - slot_239_17_1.time

			if slot_239_11_2 < slot_239_18_1 then
				table.remove(slot_0_36_0.soul_particles, iter_239_15)
			else
				slot_239_19_1 = game.globalVars.m_flRenderFrameTime
				slot_239_17_1.pos.x = slot_239_17_1.pos.x + (slot_239_17_1.vel_x or 0) * slot_239_19_1
				slot_239_17_1.pos.y = slot_239_17_1.pos.y + (slot_239_17_1.vel_y or 0) * slot_239_19_1
				slot_239_17_1.pos.z = slot_239_17_1.pos.z + slot_239_17_1.vel_z * slot_239_19_1
				slot_239_17_1.vel_x = (slot_239_17_1.vel_x or 0) * (1 - slot_239_19_1 * 2)
				slot_239_17_1.vel_y = (slot_239_17_1.vel_y or 0) * (1 - slot_239_19_1 * 2)
				slot_239_17_1.vel_z = slot_239_17_1.vel_z * (1 - slot_239_19_1 * 2)
				slot_239_20_2 = math.WorldToScreen(slot_239_17_1.pos)

				if slot_239_20_2 then
					slot_239_21_2 = entities:GetLocalPawn()
					slot_239_22_2 = slot_239_21_2 and slot_0_35_0(slot_239_21_2)
					slot_239_23_2 = 1000

					if slot_239_22_2 then
						slot_239_23_2 = math.sqrt((slot_239_17_1.pos.x - slot_239_22_2.x)^2 + (slot_239_17_1.pos.y - slot_239_22_2.y)^2 + (slot_239_17_1.pos.z - slot_239_22_2.z)^2)
					end

					slot_239_24_2 = slot_239_18_1 / slot_239_11_2
					slot_239_25_1 = math.floor(slot_239_12_2[4] * (1 - slot_239_24_2))
					slot_239_26_3 = math.max(0.2, math.min(2, 500 / slot_239_23_2))
					slot_239_27_3 = slot_239_17_1.size * slot_239_26_3 * (1 - slot_239_24_2 * 0.5)
					slot_239_28_3 = math.sin(slot_239_17_1.seed * 100 + slot_239_7_0 * 5) * 2 * slot_239_26_3
					slot_239_29_3 = math.cos(slot_239_17_1.seed * 100 + slot_239_7_0 * 5) * 2 * slot_239_26_3
					slot_239_30_3 = draw.Color(slot_239_12_2[1], slot_239_12_2[2], slot_239_12_2[3], slot_239_25_1)
					slot_239_31_3 = draw.Color(slot_239_12_2[1], slot_239_12_2[2], slot_239_12_2[3], math.floor(slot_239_25_1 * 0.15))
					slot_239_32_3 = draw.Color(slot_239_12_2[1], slot_239_12_2[2], slot_239_12_2[3], math.floor(slot_239_25_1 * 0.35))
					slot_239_33_5 = draw.Vec2(slot_239_20_2.x + slot_239_28_3, slot_239_20_2.y + slot_239_29_3)

					slot_239_0_0:AddCircleFilled(slot_239_33_5, slot_239_27_3 * 4, slot_239_31_3, 8)
					slot_239_0_0:AddCircleFilled(slot_239_33_5, slot_239_27_3 * 2.2, slot_239_32_3, 8)
					slot_239_0_0:AddCircleFilled(slot_239_33_5, slot_239_27_3, slot_239_30_3, 8)
				end
			end
		end
	end

	if is_enabled("sparks_enabled") then
		slot_239_11_1 = UI.cfg.sparks_lifetime or 1.2
		slot_239_12_1 = math.min(0.033, game.globalVars.m_flRenderFrameTime or 0.01)
		slot_239_13_1 = 800
		slot_239_14_0 = UI.cfg.sparks_color or {
			255,
			255,
			255,
			255,
			[0] = nil
		}
		slot_239_15_1 = entities:GetLocalPawn()

		if not slot_239_15_1 or not slot_0_35_0(slot_239_15_1) then
			slot_239_16_0 = vector(0, 0, 0)
		end

		for iter_239_16 = #slot_0_36_0.sparks, 1, -1 do
			slot_239_21_1 = slot_0_36_0.sparks[iter_239_16]
			slot_239_22_1 = slot_239_7_0 - slot_239_21_1.time

			if slot_239_11_1 < slot_239_22_1 then
				table.remove(slot_0_36_0.sparks, iter_239_16)
			else
				slot_239_23_1 = 1 - slot_239_22_1 / slot_239_11_1
				slot_239_24_1 = math.floor(slot_239_14_0[4] * slot_239_23_1)

				for iter_239_17, iter_239_18 in ipairs(slot_239_21_1.particles) do
					slot_239_30_2 = vector(iter_239_18.pos.x, iter_239_18.pos.y, iter_239_18.pos.z)

					if iter_239_18.vel:length() > 1 then
						iter_239_18.vel.z = iter_239_18.vel.z - slot_239_13_1 * slot_239_12_1
						iter_239_18.pos = iter_239_18.pos + iter_239_18.vel * slot_239_12_1
						slot_239_31_2 = game.physicsQueryInterface:TraceRay(ray_t(), slot_239_30_2, iter_239_18.pos)

						if slot_239_31_2 and slot_239_31_2:DidHit() and slot_239_31_2.m_Plane and slot_239_31_2.m_Plane.normal then
							slot_239_32_2 = slot_239_31_2.m_Plane.normal
							iter_239_18.pos = slot_239_31_2.m_vEndPos + slot_239_32_2 * 0.1
							slot_239_33_4 = iter_239_18.vel.x * slot_239_32_2.x + iter_239_18.vel.y * slot_239_32_2.y + iter_239_18.vel.z * slot_239_32_2.z
							iter_239_18.vel.x = (iter_239_18.vel.x - 2 * slot_239_33_4 * slot_239_32_2.x) * 0.4
							iter_239_18.vel.y = (iter_239_18.vel.y - 2 * slot_239_33_4 * slot_239_32_2.y) * 0.4
							iter_239_18.vel.z = (iter_239_18.vel.z - 2 * slot_239_33_4 * slot_239_32_2.z) * 0.4

							if slot_239_32_2.z > 0.7 then
								iter_239_18.vel.x = iter_239_18.vel.x * 0.8
								iter_239_18.vel.y = iter_239_18.vel.y * 0.8
							end
						end
					end

					slot_239_31_1 = math.WorldToScreen(iter_239_18.pos)
					slot_239_32_1 = math.WorldToScreen(slot_239_30_2)

					if slot_239_31_1 and slot_239_32_1 then
						slot_239_33_3 = tonumber(UI.cfg.sparks_size) or 2.5
						slot_239_34_1 = tonumber(UI.cfg.sparks_trail_length) or 1
						slot_239_35_0 = slot_239_31_1.x + (slot_239_32_1.x - slot_239_31_1.x) * slot_239_34_1
						slot_239_36_1 = slot_239_31_1.y + (slot_239_32_1.y - slot_239_31_1.y) * slot_239_34_1
						slot_239_37_0 = draw.Vec2(slot_239_35_0, slot_239_36_1)
						slot_239_38_0 = slot_239_33_3

						for iter_239_19 = 3, 1, -1 do
							slot_239_43_2 = slot_239_38_0 * (iter_239_19 * 1.8)
							slot_239_44_2 = math.floor(slot_239_24_1 * (0.12 / iter_239_19))

							if slot_239_44_2 > 0 then
								slot_239_0_0:AddCircleFilled(draw.Vec2(slot_239_31_1.x, slot_239_31_1.y), slot_239_43_2, draw.Color(slot_239_14_0[1], slot_239_14_0[2], slot_239_14_0[3], slot_239_44_2), 12)
							end
						end

						slot_239_0_0:AddCircleFilled(draw.Vec2(slot_239_31_1.x, slot_239_31_1.y), slot_239_38_0 * 0.8, draw.Color(slot_239_14_0[1], slot_239_14_0[2], slot_239_14_0[3], slot_239_24_1), 12)
						slot_239_0_0:AddCircleFilled(draw.Vec2(slot_239_31_1.x, slot_239_31_1.y), slot_239_38_0 * 0.4, draw.Color(255, 255, 255, slot_239_24_1), 8)

						slot_239_39_2 = draw.Color(slot_239_14_0[1], slot_239_14_0[2], slot_239_14_0[3], math.floor(slot_239_24_1 * 0.5))

						slot_239_0_0:AddLine(draw.Vec2(slot_239_31_1.x, slot_239_31_1.y), slot_239_37_0, slot_239_39_2, slot_239_38_0 * 0.7)
					end
				end
			end
		end
	end

	if is_enabled("hitmarker_ws") and slot_0_36_0.hitmarkers then
		slot_239_11_0 = UI.cfg.hitmarker_lifetime or 1.2

		for iter_239_20 = #slot_0_36_0.hitmarkers, 1, -1 do
			if slot_239_11_0 < slot_239_7_0 - slot_0_36_0.hitmarkers[iter_239_20].time then
				table.remove(slot_0_36_0.hitmarkers, iter_239_20)
			end
		end

		slot_239_12_0 = UI.cfg.hitmarker_color or {
			255,
			255,
			255,
			255,
			[0] = nil
		}
		slot_239_13_0 = UI.cfg.hitmarker_style or "Aesthetic"

		for iter_239_21, iter_239_22 in ipairs(slot_0_36_0.hitmarkers) do
			slot_239_19_0 = slot_239_7_0 - iter_239_22.time
			slot_239_20_0 = slot_239_19_0 / slot_239_11_0
			slot_239_21_0 = 1 - math.pow(slot_239_20_0, 1.5)
			slot_239_22_0 = math.floor(slot_239_12_0[4] * slot_239_21_0)
			slot_239_23_0 = math.WorldToScreen(iter_239_22.pos) or math.WorldToScreen(iter_239_22.pos + vector(0, 0, 10))

			if slot_239_23_0 then
				slot_239_24_0 = entities.GetLocalPawn()
				slot_239_25_0 = 1

				if slot_239_24_0 then
					slot_239_26_2 = slot_239_24_0:GetAbsOrigin()

					if slot_239_26_2 then
						slot_239_27_2 = iter_239_22.pos.x - slot_239_26_2.x
						slot_239_28_1 = iter_239_22.pos.y - slot_239_26_2.y
						slot_239_29_1 = iter_239_22.pos.z - slot_239_26_2.z
						slot_239_30_1 = math.sqrt(slot_239_27_2 * slot_239_27_2 + slot_239_28_1 * slot_239_28_1 + slot_239_29_1 * slot_239_29_1)
						slot_239_25_0 = math.max(0.3, math.min(2, 200 / math.max(slot_239_30_1, 50)))
					end
				end

				slot_239_26_1 = 10 * slot_239_25_0
				slot_239_27_1 = 3 * slot_239_25_0
				slot_239_28_0 = 2 * slot_239_25_0
				slot_239_29_0 = math.min(1, slot_239_20_0 / 0.2)
				slot_239_30_0 = 0.5 + 0.5 * (1 - math.pow(1 - slot_239_29_0, 2))
				slot_239_26_0 = slot_239_26_1 * slot_239_30_0
				slot_239_27_0 = slot_239_27_1 * slot_239_30_0
				slot_239_31_0 = draw.Color(slot_239_12_0[1], slot_239_12_0[2], slot_239_12_0[3], slot_239_22_0)
				slot_239_32_0 = draw.Color(slot_239_12_0[1], slot_239_12_0[2], slot_239_12_0[3], math.floor(slot_239_22_0 * 0.3))

				if slot_239_13_0 == "X" or slot_239_13_0 == 2 then
					slot_239_33_2 = slot_239_26_0 * 0.4

					slot_239_0_0:AddLine(draw.Vec2(slot_239_23_0.x - slot_239_26_0, slot_239_23_0.y - slot_239_26_0), draw.Vec2(slot_239_23_0.x - slot_239_33_2, slot_239_23_0.y - slot_239_33_2), slot_239_31_0, 1)
					slot_239_0_0:AddLine(draw.Vec2(slot_239_23_0.x + slot_239_26_0, slot_239_23_0.y - slot_239_26_0), draw.Vec2(slot_239_23_0.x + slot_239_33_2, slot_239_23_0.y - slot_239_33_2), slot_239_31_0, 1)
					slot_239_0_0:AddLine(draw.Vec2(slot_239_23_0.x - slot_239_26_0, slot_239_23_0.y + slot_239_26_0), draw.Vec2(slot_239_23_0.x - slot_239_33_2, slot_239_23_0.y + slot_239_33_2), slot_239_31_0, 1)
					slot_239_0_0:AddLine(draw.Vec2(slot_239_23_0.x + slot_239_26_0, slot_239_23_0.y + slot_239_26_0), draw.Vec2(slot_239_23_0.x + slot_239_33_2, slot_239_23_0.y + slot_239_33_2), slot_239_31_0, 1)
				else
					slot_239_33_1 = slot_239_26_0 * 1.2
					slot_239_34_0 = slot_239_19_0 * 3
					slot_239_33_0 = slot_239_33_1 * (1 + math.sin(slot_239_19_0 * 10) * 0.1)

					for iter_239_23 = 2, 0, -1 do
						slot_239_40_2 = slot_239_33_0 + iter_239_23 * 3
						slot_239_41_2 = math.floor(slot_239_22_0 * (0.2 + 0.1 * (2 - iter_239_23)))
						slot_239_42_2 = draw.Color(slot_239_12_0[1], slot_239_12_0[2], slot_239_12_0[3], slot_239_41_2)

						for iter_239_24 = 0, 4 do
							slot_239_47_1 = slot_239_34_0 + iter_239_24 * 72 * (math.pi / 180)
							slot_239_48_1 = slot_239_34_0 + (iter_239_24 + 0.5) * 72 * (math.pi / 180)
							slot_239_49_0 = slot_239_34_0 + (iter_239_24 + 1) * 72 * (math.pi / 180)
							slot_239_50_0 = slot_239_23_0.x + math.cos(slot_239_47_1) * slot_239_40_2
							slot_239_51_0 = slot_239_23_0.y + math.sin(slot_239_47_1) * slot_239_40_2
							slot_239_52_0 = slot_239_23_0.x + math.cos(slot_239_48_1) * (slot_239_40_2 * 0.45)
							slot_239_53_0 = slot_239_23_0.y + math.sin(slot_239_48_1) * (slot_239_40_2 * 0.45)
							slot_239_54_0 = slot_239_23_0.x + math.cos(slot_239_49_0) * slot_239_40_2
							slot_239_55_0 = slot_239_23_0.y + math.sin(slot_239_49_0) * slot_239_40_2

							slot_239_0_0:AddLine(draw.Vec2(slot_239_50_0, slot_239_51_0), draw.Vec2(slot_239_52_0, slot_239_53_0), slot_239_42_2, slot_239_28_0 + iter_239_23)
							slot_239_0_0:AddLine(draw.Vec2(slot_239_52_0, slot_239_53_0), draw.Vec2(slot_239_54_0, slot_239_55_0), slot_239_42_2, slot_239_28_0 + iter_239_23)
						end
					end

					for iter_239_25 = 0, 4 do
						slot_239_40_1 = slot_239_34_0 + iter_239_25 * 72 * (math.pi / 180)
						slot_239_41_1 = slot_239_34_0 + (iter_239_25 + 0.5) * 72 * (math.pi / 180)
						slot_239_42_1 = slot_239_34_0 + (iter_239_25 + 1) * 72 * (math.pi / 180)
						slot_239_43_1 = slot_239_23_0.x + math.cos(slot_239_40_1) * slot_239_33_0
						slot_239_44_1 = slot_239_23_0.y + math.sin(slot_239_40_1) * slot_239_33_0
						slot_239_45_0 = slot_239_23_0.x + math.cos(slot_239_41_1) * (slot_239_33_0 * 0.45)
						slot_239_46_0 = slot_239_23_0.y + math.sin(slot_239_41_1) * (slot_239_33_0 * 0.45)
						slot_239_47_0 = slot_239_23_0.x + math.cos(slot_239_42_1) * slot_239_33_0
						slot_239_48_0 = slot_239_23_0.y + math.sin(slot_239_42_1) * slot_239_33_0

						slot_239_0_0:AddLine(draw.Vec2(slot_239_43_1, slot_239_44_1), draw.Vec2(slot_239_45_0, slot_239_46_0), slot_239_31_0, slot_239_28_0)
						slot_239_0_0:AddLine(draw.Vec2(slot_239_45_0, slot_239_46_0), draw.Vec2(slot_239_47_0, slot_239_48_0), slot_239_31_0, slot_239_28_0)
					end

					slot_239_0_0:AddCircleFilled(draw.Vec2(slot_239_23_0.x, slot_239_23_0.y), 3 * slot_239_25_0, draw.Color(255, 255, 255, slot_239_22_0))

					slot_239_36_0 = 3

					for iter_239_26 = 1, slot_239_36_0 do
						slot_239_41_0 = slot_239_34_0 * -2 + iter_239_26 / slot_239_36_0 * math.pi * 2
						slot_239_42_0 = slot_239_33_0 * (1.2 + math.sin(slot_239_19_0 * 5 + iter_239_26) * 0.3)
						slot_239_43_0 = slot_239_23_0.x + math.cos(slot_239_41_0) * slot_239_42_0
						slot_239_44_0 = slot_239_23_0.y + math.sin(slot_239_41_0) * slot_239_42_0

						slot_239_0_0:AddCircleFilled(draw.Vec2(slot_239_43_0, slot_239_44_0), 1.5 * slot_239_25_0, draw.Color(255, 255, 255, math.floor(slot_239_22_0 * 0.6)))
					end
				end
			end
		end
	end

	slot_0_99_0()
	slot_0_105_0()
	slot_0_104_0()
end

function slot_0_108_0(arg_245_0)
	if not gui or not entities or not game then
		return
	end

	if not arg_245_0 then
		return
	end

	slot_245_1_0 = arg_245_0:GetName()

	if not slot_245_1_0 then
		return
	end

	if slot_245_1_0 == "player_death" and is_enabled("soul_particles") then
		slot_245_2_13 = entities:GetLocalPawn()

		if slot_245_2_13 then
			slot_245_3_11 = arg_245_0:GetPawnFromId("attacker")
			slot_245_4_10 = arg_245_0:GetPawnFromId("userid")
			slot_245_5_10 = slot_245_3_11 == slot_245_2_13

			if not slot_245_5_10 and slot_245_3_11 and slot_245_3_11.get_index and slot_245_2_13.get_index then
				slot_245_5_10 = slot_245_3_11:GetIndex() == slot_245_2_13:GetIndex()
			end

			if slot_245_5_10 and slot_245_4_10 then
				slot_245_6_8 = slot_0_35_0(slot_245_4_10)
				slot_245_7_7 = vector(slot_245_6_8.x, slot_245_6_8.y, slot_245_6_8.z)
				slot_245_8_3 = {
					slot_0_5_0.HEAD,
					slot_0_5_0.CHEST,
					slot_0_5_0.PELVIS,
					slot_0_5_0.LEFT_UPPER_ARM,
					slot_0_5_0.RIGHT_UPPER_ARM,
					slot_0_5_0.LEFT_UPPER_LEG,
					slot_0_5_0.RIGHT_UPPER_LEG,
					slot_0_5_0.LEFT_LOWER_LEG,
					slot_0_5_0.RIGHT_LOWER_LEG,
					slot_0_5_0.LEFT_FOOT,
					slot_0_5_0.RIGHT_FOOT
				}
				slot_245_9_1 = UI.cfg.soul_particles_count or 80

				for iter_245_0 = 1, slot_245_9_1 do
					slot_245_14_1 = slot_245_8_3[math.random(1, #slot_245_8_3)]
					slot_245_15_8 = slot_245_7_7

					if slot_245_4_10.GetHitboxCenter then
						slot_245_15_8 = slot_245_4_10:GetHitboxCenter(slot_245_14_1) or slot_245_7_7
					elseif slot_245_4_10.GetHitboxCenter then
						slot_245_15_8 = slot_245_4_10:GetHitboxCenter(slot_245_14_1) or slot_245_7_7
					end

					table.insert(slot_0_36_0.soul_particles, {
						[0] = nil,
						pos = vector(slot_245_15_8.x + math.random(-10, 10), slot_245_15_8.y + math.random(-10, 10), slot_245_15_8.z + math.random(-5, 5)),
						time = game.globalVars.m_flRealTime,
						vel_x = (math.random() - 0.5) * 40,
						vel_y = (math.random() - 0.5) * 40,
						vel_z = 15 + math.random() * 40,
						size = 0.4 + math.random() * 0.6,
						seed = math.random()
					})
				end

				while #slot_0_36_0.soul_particles > 1000 do
					table.remove(slot_0_36_0.soul_particles, 1)
				end
			end
		end
	end

	if slot_245_1_0 == "bullet_impact" and is_enabled("misc_impact_viz_enabled") then
		slot_245_2_12 = entities.GetLocalPawn()

		if slot_245_2_12 then
			slot_245_3_10 = arg_245_0:GetPawnFromId("userid")
			slot_245_4_9 = slot_245_3_10 == slot_245_2_12

			if not slot_245_4_9 and slot_245_3_10 and slot_245_3_10.get_index and slot_245_2_12.get_index then
				slot_245_4_9 = slot_245_3_10:GetIndex() == slot_245_2_12:GetIndex()
			end

			if slot_245_4_9 then
				slot_245_5_9 = arg_245_0:GetFloat("x")
				slot_245_6_7 = arg_245_0:GetFloat("y")
				slot_245_7_6 = arg_245_0:GetFloat("z")

				table.insert(slot_0_36_0.bullet_impacts, {
					normal = nil,
					pos = vector(slot_245_5_9, slot_245_6_7, slot_245_7_6),
					time = game.globalVars.m_flRealTime
				})

				while #slot_0_36_0.bullet_impacts > 20 do
					table.remove(slot_0_36_0.bullet_impacts, 1)
				end
			end
		end
	end

	if slot_245_1_0 == "weapon_fire" and is_enabled("misc_quickswitch") then
		slot_245_2_11 = entities.GetLocalPawn()

		if slot_245_2_11 and slot_245_2_11:IsAlive() then
			slot_245_3_9 = arg_245_0:GetPawnFromId("userid")

			if slot_245_3_9 then
				slot_245_4_8 = slot_245_3_9 == slot_245_2_11

				if not slot_245_4_8 and slot_245_3_9.get_index and slot_245_2_11.get_index then
					slot_245_4_8 = slot_245_3_9:GetIndex() == slot_245_2_11:GetIndex()
				end

				if slot_245_4_8 then
					slot_245_5_8 = slot_245_2_11:GetActiveWeapon()

					if slot_245_5_8 then
						slot_245_6_6 = slot_245_5_8:GetDefIndex()

						if not slot_245_5_8.get_type or not slot_245_5_8:GetType() then
							slot_245_7_5 = -1
						end

						if slot_245_6_6 == 40 or slot_245_6_6 == 9 then
							slot_0_36_0.quickswitch_should_rescope = slot_0_36_0.quickswitch_was_scoped

							game.engine:ClientCmd("slot3")

							slot_0_36_0.quickswitch_tick = (game.globalVars.tick_count or 0) + 3
						end
					end
				end
			end
		end
	end

	if slot_245_1_0 == "player_hurt" and (is_enabled("hitlogs_ws") or is_enabled("silentium_hitlog_enabled") or is_enabled("hitlogs_console") or is_enabled("floating_damage") or is_enabled("hitmarker_ws") or is_enabled("sparks_enabled") or is_enabled("damage_rings") or is_enabled("soul_particles") or is_enabled("misc_hitsound_enabled")) then
		slot_245_2_10 = entities:GetLocalPawn()

		if not slot_245_2_10 then
			return
		end

		slot_245_3_8 = arg_245_0:GetPawnFromId("attacker")

		if not slot_245_3_8 then
			return
		end

		slot_245_4_7 = arg_245_0:GetPawnFromId("userid")
		slot_245_5_7 = slot_245_3_8 == slot_245_2_10

		if not slot_245_5_7 and slot_245_3_8.get_index and slot_245_2_10.get_index then
			slot_245_5_7 = slot_245_3_8:GetIndex() == slot_245_2_10:GetIndex()
		end

		if slot_245_5_7 then
			slot_245_6_5 = arg_245_0:GetInt("dmg_health") or 0
			slot_245_7_4 = arg_245_0:GetInt("hitgroup") or 0
			slot_245_8_2 = arg_245_0:GetString("weapon") or "unknown"

			if string.find(slot_245_8_2, "weapon_") then
				slot_245_8_2 = string.gsub(slot_245_8_2, "weapon_", "")
			end

			slot_245_10_1 = ({
				"Generic",
				"Head",
				"Chest",
				"Stomach",
				"Left Arm",
				"Right Arm",
				"Left Leg",
				"Right Leg",
				[0] = nil
			})[slot_245_7_4 + 1] or "Body"
			slot_245_11_1 = arg_245_0:GetPawnFromId("userid")
			slot_245_12_1 = "enemy"
			slot_245_13_0 = 0
			slot_245_14_0 = nil

			if slot_245_11_1 then
				if slot_245_11_1.GetName then
					slot_245_15_7 = slot_245_11_1:GetName()

					if slot_245_15_7 and slot_245_15_7 ~= "" then
						slot_245_12_1 = slot_245_15_7
					end
				end

				slot_245_13_0 = arg_245_0:GetInt("health") or 0

				if (not slot_245_13_0 or slot_245_13_0 == 0) and slot_245_6_5 < 100 and slot_245_11_1.get_health then
					slot_245_15_6 = slot_245_11_1:GetHealth()

					if slot_245_15_6 and slot_245_15_6 > 0 then
						slot_245_13_0 = slot_245_15_6
					end
				end

				slot_245_15_5 = slot_0_35_0(slot_245_11_1)
				slot_245_16_6 = nil
				slot_245_17_4 = nil
				slot_245_18_4 = nil

				if slot_245_15_5 then
					slot_245_16_6, slot_245_17_4, slot_245_18_4 = slot_245_15_5.x, slot_245_15_5.y, slot_245_15_5.z
				end

				if slot_245_16_6 and slot_245_17_4 and slot_245_18_4 then
					slot_245_14_0 = vector(slot_245_16_6, slot_245_17_4, slot_245_18_4 + 50)
				end
			end

			table.insert(slot_0_36_0.logs, 1, {
				[0] = nil,
				hitgroup = slot_245_10_1,
				damage = slot_245_6_5,
				target = slot_245_12_1,
				weapon = slot_245_8_2,
				health_rem = slot_245_13_0,
				time = game.globalVars.m_flRealTime
			})

			if #slot_0_36_0.logs > 10 then
				table.remove(slot_0_36_0.logs)
			end

			if is_enabled("silentium_hitlog_enabled") then
				table.insert(slot_0_36_0.silentium_logs, 1, {
					type = "hit",
					alpha = 0,
					[0] = nil,
					damage = slot_245_6_5,
					pred_damage = slot_0_36_0.last_shot.dmg,
					hc = slot_0_36_0.last_shot.hc,
					bt = slot_0_36_0.last_shot.bt,
					hitgroup = slot_245_10_1,
					pred_hitgroup = slot_0_36_0.last_shot.hg,
					target = slot_245_12_1,
					time = game.globalVars.m_flRealTime
				})

				if #slot_0_36_0.silentium_logs > 8 then
					table.remove(slot_0_36_0.silentium_logs)
				end
			end

			if is_enabled("hitlogs_console") then
				print(string.format(" [Silentium] Hit %s in %s for %d damage | HP Left: %d", slot_245_12_1, slot_245_10_1, slot_245_6_5, slot_245_13_0))
			end

			if is_enabled("discord_hitlogs") then
				slot_245_15_4 = slot_0_37_0

				if slot_245_15_4 and slot_245_15_4.sendWebhook then
					slot_245_16_5 = slot_245_15_4.WEBHOOK_URL or ""

					if slot_245_16_5 ~= "" then
						slot_245_17_3 = {
							[0] = nil,
							embeds = {
								{
									title = "?? Silentium Hitlog",
									Color = 16738740,
									[0] = nil,
									description = string.format("**%s** hit **%s** in the **%s** for **%d** damage.", slot_0_36_0.username, slot_245_12_1, slot_245_10_1, slot_245_6_5),
									fields = {
										{
											name = "Weapon",
											inline = true,
											["sol.WvC%"] = nil,
											value = slot_245_8_2
										},
										{
											name = "Health Left",
											inline = true,
											menuToggled = nil,
											value = tostring(slot_245_13_0)
										}
									},
									footer = {
										[0] = nil,
										text = "Silentium v4 | UID: " .. (slot_245_15_4.currentUserUID or "Unlinked")
									}
								}
							}
						}

						slot_245_15_4.sendWebhook(slot_245_16_5, slot_245_17_3)
					end
				end
			end

			if is_enabled("damage_rings") then
				slot_245_15_3, slot_245_16_4 = game.engine:GetScreenSize()

				table.insert(slot_0_36_0.damage_rings, {
					[0] = nil,
					time = game.globalVars.m_flRealTime,
					damage = slot_245_6_5,
					center_x = slot_245_15_3 / 2,
					center_y = slot_245_16_4 / 2
				})

				if #slot_0_36_0.damage_rings > 10 then
					table.remove(slot_0_36_0.damage_rings, 1)
				end
			end

			if (is_enabled("floating_damage") or is_enabled("soul_particles")) and slot_245_11_1 then
				slot_245_15_2 = nil
				slot_245_16_3 = slot_0_5_0.CHEST

				if slot_245_7_4 == 1 then
					slot_245_16_3 = slot_0_5_0.HEAD
				elseif slot_245_7_4 == 2 then
					slot_245_16_3 = slot_0_5_0.CHEST
				elseif slot_245_7_4 == 3 then
					slot_245_16_3 = slot_0_5_0.PELVIS
				elseif slot_245_7_4 == 4 then
					slot_245_16_3 = slot_0_5_0.LEFT_UPPER_ARM
				elseif slot_245_7_4 == 5 then
					slot_245_16_3 = slot_0_5_0.RIGHT_UPPER_ARM
				elseif slot_245_7_4 == 6 then
					slot_245_16_3 = slot_0_5_0.LEFT_UPPER_LEG
				elseif slot_245_7_4 == 7 then
					slot_245_16_3 = slot_0_5_0.RIGHT_UPPER_LEG
				elseif slot_245_7_4 == 10 then
					slot_245_16_3 = slot_0_5_0.NECK
				end

				if slot_245_11_1.GetHitboxCenter then
					slot_245_15_2 = slot_245_11_1:GetHitboxCenter(slot_245_16_3)
				elseif slot_245_11_1.GetHitboxCenter then
					slot_245_15_2 = slot_245_11_1:GetHitboxCenter(slot_245_16_3)
				end

				if not slot_245_15_2 and slot_245_14_0 then
					slot_245_15_2 = slot_245_14_0
				end

				if slot_245_15_2 and is_enabled("floating_damage") then
					slot_245_17_2 = (UI.cfg.floating_damage_style or "Classic") == "Enhanced"
					slot_245_18_3 = slot_245_17_2 and 25 or 15
					slot_245_19_3 = slot_245_17_2 and math.random(250, 400) or math.random(150, 250)

					table.insert(slot_0_36_0.floating_damage, {
						bounces = 0,
						pos = vector(slot_245_15_2.x, slot_245_15_2.y, slot_245_15_2.z + 5),
						damage = slot_245_6_5,
						time = game.globalVars.m_flRealTime,
						vel_x = (math.random() - 0.5) * slot_245_18_3 * 2,
						vel_y = (math.random() - 0.5) * slot_245_18_3 * 2,
						vel_z = slot_245_19_3,
						is_critical = slot_245_7_4 == 1,
						style = UI.cfg.floating_damage_style or "Classic",
						enhanced = slot_245_17_2
					})

					if #slot_0_36_0.floating_damage > 20 then
						table.remove(slot_0_36_0.floating_damage, 1)
					end
				end
			end

			if slot_245_6_5 > 0 and is_enabled("misc_hitsound_enabled") then
				slot_245_15_1 = UI.cfg.misc_hitsound_file or "Bell"
				slot_245_16_2 = (UI.cfg.misc_hitsound_vol or 100) / 100
				slot_245_17_1 = type(ws) == "table" and ws.get_resource_dir and ws.get_resource_dir() or ""
				slot_245_18_2 = nil

				if slot_245_17_1 ~= "" then
					slot_245_18_2 = slot_245_17_1 .. "/sounds/"
				else
					slot_245_18_2 = "fatality/silentium/sounds/"
				end

				slot_245_19_2 = nil

				if slot_245_15_1 == "Agpa 1" then
					slot_245_19_2 = slot_245_18_2 .. "agpa1"
				elseif slot_245_15_1 == "Agpa 2" then
					slot_245_19_2 = slot_245_18_2 .. "agpa2"
				elseif slot_245_15_1 == "Aimbooster" then
					slot_245_19_2 = slot_245_18_2 .. "aimbooster"
				elseif slot_245_15_1 == "Arena Switch" then
					slot_245_19_2 = slot_245_18_2 .. "arena_switch"
				elseif slot_245_15_1 == "Bameware" then
					slot_245_19_2 = slot_245_18_2 .. "bameware"
				elseif slot_245_15_1 == "Bonk" then
					slot_245_19_2 = slot_245_18_2 .. "bonk"
				elseif slot_245_15_1 == "Bubble" then
					slot_245_19_2 = slot_245_18_2 .. "bubble"
				elseif slot_245_15_1 == "Click" then
					slot_245_19_2 = slot_245_18_2 .. "click"
				elseif slot_245_15_1 == "COD" then
					slot_245_19_2 = slot_245_18_2 .. "cod"
				elseif slot_245_15_1 == "Killcard" then
					slot_245_19_2 = slot_245_18_2 .. "killcard_1"
				elseif slot_245_15_1 == "Minecraft Hit" then
					slot_245_19_2 = slot_245_18_2 .. "minecraft_hit"
				elseif slot_245_15_1 == "Minecraft XP" then
					slot_245_19_2 = slot_245_18_2 .. "minecraft_xp_gain"
				elseif slot_245_15_1 == "Rust Headshot" then
					slot_245_19_2 = slot_245_18_2 .. "rust_headshot"
				elseif slot_245_15_1 == "Satisfying" then
					slot_245_19_2 = slot_245_18_2 .. "satisfying click"
				elseif slot_245_15_1 == "Stony" then
					slot_245_19_2 = slot_245_18_2 .. "stony"
				elseif slot_245_15_1 == "Trident" then
					slot_245_19_2 = slot_245_18_2 .. "trident_pierce"
				elseif slot_245_15_1 == "Water Drop" then
					slot_245_19_2 = slot_245_18_2 .. "water_drop"
				elseif slot_245_15_1 == "Zelda" then
					slot_245_19_2 = slot_245_18_2 .. "zelda"
				end

				if slot_245_19_2 then
					game.engine:ClientCmd(string.format("snd_toolvolume %.2f", slot_245_16_2))
					game.engine:ClientCmd(string.format("play \"%s\"", slot_245_19_2))
				end
			end

			if is_enabled("hitmarker_ws") and slot_245_11_1 then
				if not slot_0_36_0.hitmarkers then
					slot_0_36_0.hitmarkers = {}
				end

				slot_245_15_0 = nil
				slot_245_16_1 = slot_245_11_1
				slot_245_17_0 = arg_245_0:GetInt("hitgroup") or 0
				slot_245_18_1 = 0
				slot_245_18_0 = slot_245_17_0 == 1 and 0 or slot_245_17_0 == 2 and 4 or slot_245_17_0 == 3 and 2 or slot_245_17_0 == 4 and 13 or slot_245_17_0 == 5 and 14 or slot_245_17_0 == 6 and 22 or slot_245_17_0 == 7 and 23 or 3

				if slot_245_16_1.GetHitboxCenter then
					slot_245_19_1 = slot_245_16_1:GetHitboxCenter(slot_245_18_0)

					if slot_245_19_1 and slot_245_19_1.x ~= 0 then
						slot_245_15_0 = slot_245_19_1
					end
				end

				if not slot_245_15_0 then
					slot_245_19_0 = slot_0_35_0(slot_245_16_1)

					if slot_245_19_0 then
						if slot_245_17_0 == 1 then
							slot_245_15_0 = vector(slot_245_19_0.x, slot_245_19_0.y, slot_245_19_0.z + 70)
						elseif slot_245_17_0 == 6 or slot_245_17_0 == 7 then
							slot_245_15_0 = vector(slot_245_19_0.x, slot_245_19_0.y, slot_245_19_0.z + 15)
						else
							slot_245_15_0 = vector(slot_245_19_0.x, slot_245_19_0.y, slot_245_19_0.z + 45)
						end
					end
				end

				if slot_245_15_0 then
					table.insert(slot_0_36_0.hitmarkers, {
						[0] = nil,
						pos = slot_245_15_0,
						time = game.globalVars.m_flRealTime,
						damage = slot_245_6_5
					})

					if #slot_0_36_0.hitmarkers > 15 then
						table.remove(slot_0_36_0.hitmarkers, 1)
					end
				end
			end
		end
	elseif slot_245_1_0 == "player_death" then
		slot_245_2_9 = entities:GetLocalPawn()

		if not slot_245_2_9 then
			return
		end

		slot_245_3_7 = arg_245_0:GetPawnFromId("attacker")
		slot_245_4_6 = arg_245_0:GetPawnFromId("userid")

		if not slot_245_3_7 or not slot_245_4_6 then
			return
		end

		slot_245_5_6 = slot_245_3_7 == slot_245_2_9

		if not slot_245_5_6 and slot_245_3_7.get_index and slot_245_2_9.get_index then
			slot_245_5_6 = slot_245_3_7:GetIndex() == slot_245_2_9:GetIndex()
		end

		slot_245_6_4 = slot_245_4_6 == slot_245_2_9

		if not slot_245_6_4 and slot_245_4_6.get_index and slot_245_2_9.get_index then
			slot_245_6_4 = slot_245_4_6:GetIndex() == slot_245_2_9:GetIndex()
		end

		if slot_245_5_6 and not slot_245_6_4 then
			slot_245_7_3 = arg_245_0:GetString("weapon") or ""

			if is_enabled("misc_zeus_quickswitch") and (slot_245_7_3 == "taser" or slot_245_7_3 == "weapon_taser") then
				slot_0_36_0.quickswitch_tick = (game.globalVars.tick_count or 0) + 1
			end

			slot_0_36_0.enemies_outlived = slot_0_36_0.enemies_outlived + 1
			slot_0_36_0.session_kills = (slot_0_36_0.session_kills or 0) + 1

			if is_enabled("killstreak") then
				slot_0_36_0.killstreak.count = slot_0_36_0.killstreak.count + 1
				slot_0_36_0.killstreak.last_kill_time = game.globalVars.m_flRealTime

				if slot_0_36_0.killstreak.count > slot_0_36_0.killstreak.best_streak then
					slot_0_36_0.killstreak.best_streak = slot_0_36_0.killstreak.count
				end
			end
		elseif slot_245_6_4 and is_enabled("killstreak") then
			slot_0_36_0.killstreak.count = 0
		end
	elseif slot_245_1_0 == "bullet_impact" then
		slot_245_2_8 = entities.GetLocalPawn()

		if not slot_245_2_8 then
			return
		end

		slot_245_3_6 = arg_245_0:GetPawnFromId("userid")

		if not slot_245_3_6 then
			return
		end

		slot_245_4_5 = slot_245_3_6 == slot_245_2_8

		if not slot_245_4_5 and slot_245_3_6.get_index and slot_245_2_8.get_index then
			slot_245_4_5 = slot_245_3_6:GetIndex() == slot_245_2_8:GetIndex()
		end

		if slot_245_4_5 then
			if is_enabled("aa_pitch_on_shot") then
				slot_245_5_5 = slot_245_2_8:GetActiveWeapon()
				slot_245_6_3 = slot_245_5_5 and slot_245_5_5:GetDefIndex()
				slot_245_7_2 = false

				if slot_245_6_3 == 9 and is_enabled("aa_pitch_on_shot_awp") then
					slot_245_7_2 = true
				end

				if slot_245_6_3 == 40 and is_enabled("aa_pitch_on_shot_ssg08") then
					slot_245_7_2 = true
				end

				if slot_245_7_2 then
					slot_0_36_0.aa.pitch_timer = game.globalVars.m_flRealTime + 0.1
				end
			end

			if is_enabled("sparks_enabled") then
				slot_245_5_4 = entities.GetLocalPawn()
				slot_245_6_2 = arg_245_0:GetFloat("x")
				slot_245_7_1 = arg_245_0:GetFloat("y")
				slot_245_8_1 = arg_245_0:GetFloat("z")

				if slot_245_6_2 and slot_245_7_1 and slot_245_8_1 then
					slot_245_9_0 = vector(slot_245_6_2, slot_245_7_1, slot_245_8_1)
					slot_245_10_0 = tonumber(UI.cfg.sparks_count) or 15
					slot_245_11_0 = tonumber(UI.cfg.sparks_velocity) or 400

					if slot_245_10_0 < 1 then
						slot_245_10_0 = 1
					end

					if slot_245_10_0 > 100 then
						slot_245_10_0 = 100
					end

					slot_245_12_0 = {}

					for iter_245_1 = 1, slot_245_10_0 do
						table.insert(slot_245_12_0, {
							[0] = nil,
							pos = vector(slot_245_9_0.x, slot_245_9_0.y, slot_245_9_0.z),
							vel = vector((math.random() - 0.5) * slot_245_11_0 * 1.5, (math.random() - 0.5) * slot_245_11_0 * 1.5, math.random(slot_245_11_0 * 0.2, slot_245_11_0)),
							size = math.random(2, 4)
						})
					end

					table.insert(slot_0_36_0.sparks, {
						time = game.globalVars.m_flRealTime,
						particles = slot_245_12_0
					})

					if #slot_0_36_0.sparks > 20 then
						table.remove(slot_0_36_0.sparks, 1)
					end
				end
			end
		end
	elseif slot_245_1_0 == "player_spawn" then
		slot_245_2_7 = entities:GetLocalPawn()

		if slot_245_2_7 then
			slot_245_3_5 = arg_245_0:GetPawnFromId("userid")

			if slot_245_3_5 and slot_245_3_5 == slot_245_2_7 and slot_0_37_0 and slot_0_37_0.syncStats then
				slot_0_37_0.syncStats()
			end
		end
	elseif slot_245_1_0 == "round_start" or slot_245_1_0 == "round_freeze_end" then
		slot_0_36_0.round_ended = false
	elseif slot_245_1_0 == "round_end" then
		slot_0_36_0.round_ended = true
	elseif slot_245_1_0 == "aimbot_miss" then
		slot_0_36_0.aim_misses = slot_0_36_0.aim_misses + 1
		slot_245_2_6 = {
			[0] = "spread",
			"occlusion",
			"prediction",
			"animation",
			"correction",
			"mismatch",
			[0] = nil
		}
		slot_245_3_4 = arg_245_0:GetInt("reason") or -1
		slot_245_4_4 = arg_245_0:GetString("reason") or slot_245_2_6[slot_245_3_4] or "unknown"

		if is_enabled("hitlogs_console") then
			print(string.format(" [Silentium] Missed shot | Reason: %s", slot_245_4_4))
		end

		if is_enabled("hitlogs_ws") then
			table.insert(slot_0_36_0.logs, 1, {
				type = "miss",
				values_arr = nil,
				reason = slot_245_4_4,
				time = game.globalVars.m_flRealTime
			})

			if #slot_0_36_0.logs > 10 then
				table.remove(slot_0_36_0.logs)
			end
		end
	elseif slot_245_1_0 == "aimbot_shoot" then
		slot_0_36_0.dt_last_shoot = game.globalVars.m_flRealTime
		slot_245_2_5 = arg_245_0:GetInt("hit_chance") or arg_245_0:GetInt("hitchance") or 0
		slot_0_36_0.last_shot_hc = slot_245_2_5
		slot_0_36_0.last_shot.hc = slot_245_2_5
		slot_0_36_0.last_shot.bt = arg_245_0:GetInt("backtrack") or 0
		slot_0_36_0.last_shot.dmg = arg_245_0:GetInt("damage") or 0
		slot_245_3_3 = arg_245_0:GetInt("hitgroup") or 0
		slot_245_4_3 = {
			"Generic",
			"Head",
			"Chest",
			"Stomach",
			"Left Arm",
			"Right Arm",
			"Left Leg",
			"Right Leg",
			[0] = nil
		}
		slot_0_36_0.last_shot.hg = slot_245_4_3[slot_245_3_3 + 1] or "Body"

		if is_enabled("aa_pitch_on_shot") then
			slot_245_5_3 = entities.GetLocalPawn()
			slot_245_6_1 = slot_245_5_3 and slot_245_5_3:GetActiveWeapon()
			slot_245_7_0 = slot_245_6_1 and slot_245_6_1:GetDefIndex()
			slot_245_8_0 = false

			if slot_245_7_0 == 9 and is_enabled("aa_pitch_on_shot_awp") then
				slot_245_8_0 = true
			end

			if slot_245_7_0 == 40 and is_enabled("aa_pitch_on_shot_ssg08") then
				slot_245_8_0 = true
			end

			if slot_245_8_0 then
				slot_0_36_0.aa.pitch_timer = game.globalVars.m_flRealTime + 0.1
			end
		end
	elseif slot_245_1_0 == "weapon_fire" then
		slot_245_2_4 = entities.GetLocalPawn()

		if not slot_245_2_4 then
			return
		end

		slot_245_3_2 = arg_245_0:GetPawnFromId("userid")

		if slot_245_3_2 and (slot_245_3_2 == slot_245_2_4 or slot_245_3_2.get_index and slot_245_2_4.get_index and slot_245_3_2:GetIndex() == slot_245_2_4:GetIndex()) and is_enabled("aa_pitch_on_shot") then
			slot_245_4_2 = slot_245_2_4:GetActiveWeapon()
			slot_245_5_2 = slot_245_4_2 and slot_245_4_2:GetDefIndex()
			slot_245_6_0 = false

			if slot_245_5_2 == 9 and is_enabled("aa_pitch_on_shot_awp") then
				slot_245_6_0 = true
			end

			if slot_245_5_2 == 40 and is_enabled("aa_pitch_on_shot_ssg08") then
				slot_245_6_0 = true
			end

			if slot_245_6_0 then
				slot_0_36_0.aa.pitch_timer = game.globalVars.m_flRealTime + 0.1
			end
		end
	elseif slot_245_1_0 == "inferno_startburn" then
		slot_245_2_3 = arg_245_0:GetFloat("x")
		slot_245_3_1 = arg_245_0:GetFloat("y")
		slot_245_4_1 = arg_245_0:GetFloat("z")
		slot_245_5_1 = arg_245_0:GetInt("entityid")

		if slot_245_2_3 and slot_245_3_1 and slot_245_4_1 and slot_245_5_1 then
			slot_0_36_0.molotovs[slot_245_5_1] = vector(slot_245_2_3, slot_245_3_1, slot_245_4_1)
		end
	elseif slot_245_1_0 == "inferno_expire" or slot_245_1_0 == "inferno_extinguish" then
		slot_245_2_2 = arg_245_0:GetInt("entityid")

		if slot_245_2_2 then
			slot_0_36_0.molotovs[slot_245_2_2] = nil
		end
	elseif slot_245_1_0 == "smokegrenade_detonate" then
		slot_245_2_1 = arg_245_0:GetFloat("x")
		slot_245_3_0 = arg_245_0:GetFloat("y")
		slot_245_4_0 = arg_245_0:GetFloat("z")
		slot_245_5_0 = arg_245_0:GetInt("entityid")

		if slot_245_2_1 and slot_245_3_0 and slot_245_4_0 and slot_245_5_0 then
			slot_0_36_0.smokes[slot_245_5_0] = {
				["sol..eF8.♻"] = nil,
				pos = vector(slot_245_2_1, slot_245_3_0, slot_245_4_0),
				time = game.globalVars.m_flRealTime
			}
		end
	elseif slot_245_1_0 == "smokegrenade_expired" then
		slot_245_2_0 = arg_245_0:GetInt("entityid")

		if slot_245_2_0 then
			slot_0_36_0.smokes[slot_245_2_0] = nil
		end
	end
end

function slot_0_109_0(arg_246_0)
	if not UI.cfg.misc_auto_smoke then
		slot_0_36_0.auto_smoke_state = 0
		slot_0_36_0.auto_smoke_throw_tick = 0

		return
	end

	local var_246_0 = UI.cfg.misc_auto_smoke_key > 0 and get_key_state(UI.cfg.misc_auto_smoke_key)
	local var_246_1 = UI.cfg.misc_auto_smoke_always

	if not var_246_0 and not var_246_1 then
		slot_0_36_0.auto_smoke_state = 0
		slot_0_36_0.auto_smoke_throw_tick = 0

		return
	end

	local var_246_2 = entities.GetLocalPawn()

	if not var_246_2 or not var_246_2:IsAlive() then
		return
	end

	local var_246_3 = var_246_2:GetAbsOrigin()

	if not var_246_3 then
		return
	end

	local var_246_4 = game.globalVars.m_flRealTime
	local var_246_5 = game.globalVars.tick_count

	for iter_246_0, iter_246_1 in pairs(slot_0_36_0.smokes) do
		if var_246_4 - iter_246_1.time > 20 then
			slot_0_36_0.smokes[iter_246_0] = nil
		end
	end

	local var_246_6
	local var_246_7 = 200

	for iter_246_2, iter_246_3 in pairs(slot_0_36_0.molotovs) do
		local var_246_8 = (iter_246_3 - var_246_3):length()

		if var_246_8 < var_246_7 then
			local var_246_9 = false

			for iter_246_4, iter_246_5 in pairs(slot_0_36_0.smokes) do
				if (iter_246_5.pos - iter_246_3):length() < 150 then
					var_246_9 = true

					break
				end
			end

			if not var_246_9 and slot_0_36_0.auto_smoke_last_fire_pos and (slot_0_36_0.auto_smoke_last_fire_pos - iter_246_3):length() < 50 and var_246_4 - (slot_0_36_0.auto_smoke_last_throw_time or 0) < 2 then
				var_246_9 = true
			end

			if not var_246_9 then
				var_246_7 = var_246_8
				var_246_6 = iter_246_3
			end
		end
	end

	if var_246_6 then
		local var_246_10 = var_246_2:GetActiveWeapon()

		if not var_246_10 then
			return
		end

		if not (var_246_10:GetDefIndex() == 45) then
			if var_246_4 > (slot_0_36_0.auto_smoke_last_switch or 0) + 0.1 then
				game.engine:ClientCmd("slot8")

				slot_0_36_0.auto_smoke_last_switch = var_246_4
			end
		else
			local var_246_11 = arg_246_0:GetViewangles()

			arg_246_0:SetViewangles(vector(89, var_246_11.y, 0))

			if slot_0_36_0.auto_smoke_throw_tick == 0 then
				slot_0_36_0.auto_smoke_throw_tick = var_246_5
				slot_0_36_0.auto_smoke_last_throw_time = var_246_4
				slot_0_36_0.auto_smoke_last_fire_pos = var_246_6
			end

			if var_246_5 - slot_0_36_0.auto_smoke_throw_tick < 2 then
				arg_246_0:SetButton(1)
			else
				slot_0_36_0.auto_smoke_throw_tick = 0
			end
		end
	else
		slot_0_36_0.auto_smoke_throw_tick = 0
	end
end

slot_0_110_0 = nil
slot_0_111_0 = false

function slot_0_112_0()
	if not gui or not gui.checkbox then
		return
	end

	if not slot_0_111_0 then
		slot_0_111_0 = true
	end
end

slot_0_113_0 = nil
slot_0_114_0 = 0

function slot_0_115_0()
	if not gui or not gui.ctx then
		return
	end

	local function var_248_0(arg_249_0)
		return gui.ctx:find(arg_249_0)
	end

	slot_0_113_0 = {
		manual_l = var_248_0("rage>anti-aim>angles>manual override>override left"),
		manual_r = var_248_0("rage>anti-aim>angles>manual override>override right"),
		mindmg = var_248_0("rage>weapon>general>accuracy>min damage"),
		hitchance = var_248_0("rage>weapon>general>accuracy>hitchance"),
		dt = var_248_0("rage>aimbot>aimbot>double tap") or var_248_0("rage>aimbot>double tap"),
		fs = var_248_0("rage>aimbot>general>force shoot")
	}
end

function slot_0_116_0()
	if not is_enabled("gs_indicators") then
		return
	end

	local var_250_0 = entities.GetLocalPawn()

	if not var_250_0 or not var_250_0:IsAlive() then
		return
	end

	local var_250_1 = slot_0_36_0.keybinds

	if not var_250_1 or not var_250_1.list then
		return
	end

	local var_250_2 = draw.surface
	local var_250_3 = var_250_2.font
	local var_250_4, var_250_5 = slot_0_9_0()
	local var_250_6 = 14
	local var_250_7 = var_250_5 * 0.6

	var_250_2.font = UI.font_indicator or draw.fonts.gui_bold or draw.fonts.default

	local var_250_8 = {}
	local var_250_9 = draw.Color(255, 255, 255, 255)
	local var_250_10 = {
		["Min Damage"] = "MD",
		Slowwalk = "WALK",
		["Force Shoot"] = "FORCE",
		Freestanding = "FS",
		["AI Peek"] = "AI",
		["Quick Peek"] = "PEEK",
		["Force Baim"] = "BAIM",
		["Fake Duck"] = "DUCK",
		["Double Tap"] = "DT",
		Hitchance = "HC",
		["Safe Point"] = "SP",
		["/sounds/"] = nil
	}

	for iter_250_0, iter_250_1 in ipairs(var_250_1.list) do
		local var_250_11 = false

		if iter_250_1.id == "misc_edge_stop" then
			var_250_11 = slot_0_36_0.edge_stop_vars and slot_0_36_0.edge_stop_vars.state
		elseif iter_250_1.id == "custom_ai_peek" then
			var_250_11 = slot_0_36_0 ~= nil and slot_0_36_0.ai_peek ~= nil and slot_0_36_0.ai_peek.active == true
		elseif iter_250_1.id == "custom_freestanding" then
			local var_250_12 = is_enabled("aa_freestanding")
			local var_250_13 = UI.cfg.aa_freestanding_key
			local var_250_14 = true

			if var_250_13 and var_250_13 > 0 then
				var_250_14 = get_key_state(var_250_13)
			end

			var_250_11 = var_250_12 and var_250_14
		elseif gui and gui.ctx and gui.ctx.find then
			local var_250_15 = gui.ctx:find(iter_250_1.id)

			if var_250_15 then
				if iter_250_1.name == "Double Tap" then
					var_250_11 = var_250_15:GetValue():Get()
				elseif var_250_15.GetHotkeyState then
					var_250_11 = var_250_15:GetHotkeyState()
				end
			end
		end

		if var_250_11 then
			local var_250_16 = var_250_10[iter_250_1.name] or iter_250_1.name

			table.insert(var_250_8, var_250_16)
		end
	end

	local var_250_17 = var_250_7
	local var_250_18 = 32
	local var_250_19 = draw.Color(180, 255, 0, 255)

	for iter_250_2, iter_250_3 in ipairs(var_250_8) do
		local var_250_20 = draw.Color(0, 0, 0, 200)

		var_250_2:AddText(draw.Vec2(var_250_6 + 1, var_250_17 + 1), iter_250_3, var_250_20)

		local var_250_21 = var_250_9

		if iter_250_3 == "DT" then
			var_250_21 = draw.Color(255, 75, 75, 255)
		elseif iter_250_3 == "HC" or iter_250_3 == "MD" or iter_250_3 == "FORCE" or iter_250_3 == "BAIM" then
			var_250_21 = var_250_19
		end

		var_250_2:AddText(draw.Vec2(var_250_6, var_250_17), iter_250_3, var_250_21)

		var_250_17 = var_250_17 + var_250_18
	end

	var_250_2.font = var_250_3
end

function slot_0_117_0()
	if not gui or not gui.ctx or not entities or not game then
		return
	end

	slot_251_0_0 = is_enabled("crosshair_indicators")
	slot_251_1_0 = is_enabled("dmg_indicator")

	if not slot_251_0_0 and not slot_251_1_0 then
		return
	end

	slot_251_2_0 = draw.surface

	if not slot_251_2_0 then
		return
	end

	slot_251_3_0 = slot_251_2_0.font
	slot_251_4_0 = draw.fonts.gui_main or draw.fonts.default or slot_251_3_0
	slot_251_5_0 = UI.font_italic or slot_251_4_0
	slot_251_2_0.font = slot_251_4_0
	slot_251_6_0 = entities.GetLocalPawn()

	if not slot_251_6_0 or not slot_251_6_0:IsAlive() then
		return
	end

	if not slot_0_113_0 then
		slot_0_115_0()
	end

	slot_251_7_0, slot_251_8_0 = game.engine:GetScreenSize()

	if slot_251_7_0 < 10 or slot_251_8_0 < 10 then
		return
	end

	slot_251_9_0 = slot_0_19_0(slot_251_6_0)
	slot_251_10_0 = "scope_shift_anim"
	slot_251_11_0 = 0

	if slot_0_43_0 then
		slot_251_11_0 = slot_0_43_0(slot_251_10_0, slot_251_9_0 and 1 or 0, 15)
	else
		slot_251_11_0 = slot_251_9_0 and 1 or 0
	end

	slot_251_12_0 = slot_251_7_0 / 2
	slot_251_13_0 = slot_251_12_0 + 28 * slot_251_11_0
	slot_251_14_0 = slot_251_8_0 / 2
	slot_251_15_0 = slot_251_12_0
	slot_251_16_0 = slot_251_14_0 + (UI.cfg.crosshair_indicators_y or 0)
	slot_251_17_1 = 5
	slot_251_18_0 = UI.theme or {}
	slot_251_19_0 = slot_251_18_0.accent or {
		255,
		90,
		130,
		255,
		[0] = nil
	}
	slot_251_20_0 = slot_0_41_0(slot_251_19_0, 255)
	slot_251_21_0 = draw.Color(255, 255, 255, 255)
	slot_251_22_0 = draw.Color(0, 0, 0, 200)

	function slot_251_23_0(arg_252_0, arg_252_1, arg_252_2)
		local var_252_0 = draw.Color(0, 0, 0, 255)

		slot_251_2_0:AddText(draw.Vec2(arg_252_0.x + 1, arg_252_0.y), arg_252_1, var_252_0)
		slot_251_2_0:AddText(draw.Vec2(arg_252_0.x - 1, arg_252_0.y), arg_252_1, var_252_0)
		slot_251_2_0:AddText(draw.Vec2(arg_252_0.x, arg_252_0.y + 1), arg_252_1, var_252_0)
		slot_251_2_0:AddText(draw.Vec2(arg_252_0.x, arg_252_0.y - 1), arg_252_1, var_252_0)
		slot_251_2_0:AddText(arg_252_0, arg_252_1, arg_252_2)
	end

	slot_251_24_0 = slot_251_2_0.font

	if not slot_251_24_0 then
		return
	end

	function slot_251_25_0(arg_253_0)
		if not arg_253_0 then
			return false
		end

		if arg_253_0.GetValue then
			local var_253_0 = arg_253_0:GetValue()

			if var_253_0 and var_253_0.get then
				return var_253_0:Get()
			end
		end

		return false
	end

	function slot_251_26_0(arg_254_0)
		if not arg_254_0 then
			return 0
		end

		if arg_254_0.GetValue then
			local var_254_0 = arg_254_0:GetValue()

			if var_254_0 and var_254_0.get then
				return var_254_0:Get()
			end
		end

		return 0
	end

	function slot_251_27_0(arg_255_0)
		if not arg_255_0 then
			return false
		end

		if arg_255_0.GetHotkeyState then
			return arg_255_0:GetHotkeyState()
		end

		return false
	end

	function slot_251_28_0(arg_256_0)
		local var_256_0 = 0.5 * (1 - slot_251_11_0)
		local var_256_1 = 4 * slot_251_11_0

		return slot_251_12_0 - arg_256_0 * var_256_0 + var_256_1
	end

	if slot_251_0_0 then
		slot_251_2_0.font = slot_251_5_0
		slot_251_29_1 = "silentium"
		slot_251_30_1 = slot_251_2_0.font:GetTextSize(slot_251_29_1)
		slot_251_31_1 = 1
		slot_251_32_1 = slot_251_30_1.x + #slot_251_29_1 * slot_251_31_1
		slot_251_33_3 = slot_251_28_0(slot_251_32_1)
		slot_251_34_2 = slot_251_16_0 + slot_251_17_1
		slot_0_114_0 = slot_0_114_0 + 0.015
		slot_251_35_1 = slot_0_114_0
		slot_251_36_3 = 2.5
		slot_251_37_3 = slot_251_33_3
		slot_251_38_3 = slot_251_18_0.accent or {
			255,
			90,
			130,
			255,
			[0] = nil
		}
		slot_251_39_3 = 1
		slot_251_40_3 = slot_251_38_3[1]
		slot_251_41_3 = slot_251_38_3[2]
		slot_251_42_2 = slot_251_38_3[3]
		slot_251_43_1 = math.min(255, slot_251_40_3 + 60)
		slot_251_44_1 = math.min(255, slot_251_41_3 + 60)
		slot_251_45_1 = math.min(255, slot_251_42_2 + 60)
		slot_251_46_1 = math.max(0, slot_251_40_3 - 40)
		slot_251_47_0 = math.max(0, slot_251_41_3 - 40)
		slot_251_48_0 = math.max(0, slot_251_42_2 - 40)

		for iter_251_0 = 1, #slot_251_29_1 do
			slot_251_53_0 = slot_251_29_1:sub(iter_251_0, iter_251_0)
			slot_251_54_0 = slot_251_5_0:GetTextSize(slot_251_53_0)
			slot_251_56_0 = (math.sin(slot_251_35_1 * slot_251_36_3 + iter_251_0 * 0.4) + 1) * 0.5
			slot_251_57_0 = nil
			slot_251_58_0 = nil
			slot_251_59_0 = nil

			if slot_251_56_0 < 0.5 then
				slot_251_60_2 = slot_251_56_0 * 2
				slot_251_57_0 = math.floor(slot_251_46_1 + (slot_251_40_3 - slot_251_46_1) * slot_251_60_2)
				slot_251_58_0 = math.floor(slot_251_47_0 + (slot_251_41_3 - slot_251_47_0) * slot_251_60_2)
				slot_251_59_0 = math.floor(slot_251_48_0 + (slot_251_42_2 - slot_251_48_0) * slot_251_60_2)
			else
				slot_251_60_1 = (slot_251_56_0 - 0.5) * 2
				slot_251_57_0 = math.floor(slot_251_40_3 + (slot_251_43_1 - slot_251_40_3) * slot_251_60_1)
				slot_251_58_0 = math.floor(slot_251_41_3 + (slot_251_44_1 - slot_251_41_3) * slot_251_60_1)
				slot_251_59_0 = math.floor(slot_251_42_2 + (slot_251_45_1 - slot_251_42_2) * slot_251_60_1)
			end

			slot_251_60_0 = draw.Color(slot_251_57_0, slot_251_58_0, slot_251_59_0, 255)
			slot_251_61_0 = 35
			slot_251_62_0 = draw.Color(slot_251_57_0, slot_251_58_0, slot_251_59_0, slot_251_61_0)

			slot_251_2_0:AddText(draw.Vec2(slot_251_37_3 + 1, slot_251_34_2 + 1), slot_251_53_0, slot_251_62_0)
			slot_251_2_0:AddText(draw.Vec2(slot_251_37_3 - 1, slot_251_34_2 - 1), slot_251_53_0, slot_251_62_0)
			slot_251_2_0:AddText(draw.Vec2(slot_251_37_3 + 1, slot_251_34_2 - 1), slot_251_53_0, slot_251_62_0)
			slot_251_2_0:AddText(draw.Vec2(slot_251_37_3 - 1, slot_251_34_2 + 1), slot_251_53_0, slot_251_62_0)
			slot_251_2_0:AddText(draw.Vec2(slot_251_37_3 + 2, slot_251_34_2), slot_251_53_0, draw.Color(slot_251_57_0, slot_251_58_0, slot_251_59_0, 20))
			slot_251_2_0:AddText(draw.Vec2(slot_251_37_3 - 2, slot_251_34_2), slot_251_53_0, draw.Color(slot_251_57_0, slot_251_58_0, slot_251_59_0, 20))
			slot_251_2_0:AddText(draw.Vec2(slot_251_37_3, slot_251_34_2 + 2), slot_251_53_0, draw.Color(slot_251_57_0, slot_251_58_0, slot_251_59_0, 20))
			slot_251_2_0:AddText(draw.Vec2(slot_251_37_3, slot_251_34_2 - 2), slot_251_53_0, draw.Color(slot_251_57_0, slot_251_58_0, slot_251_59_0, 20))
			slot_251_2_0:AddText(draw.Vec2(slot_251_37_3, slot_251_34_2), slot_251_53_0, slot_251_60_0)

			slot_251_37_3 = slot_251_37_3 + slot_251_54_0.x + slot_251_39_3
		end

		slot_251_17_1 = slot_251_17_1 + slot_251_30_1.y + 5
	end

	slot_251_29_0 = {}
	slot_251_2_0.font = UI.font_middle or slot_251_24_0
	slot_251_30_0 = draw.Color(180, 180, 180, 255)
	slot_251_31_0 = draw.Color(255, 255, 255, 255)
	slot_251_32_0 = draw.Color(130, 180, 0, 255)

	if is_enabled("dmg_indicator") then
		slot_251_33_2 = UI.cfg.dmg_indicator_scoped or "Always"

		if slot_251_33_2 == 1 or slot_251_33_2 == "Always" or (slot_251_33_2 == 2 or slot_251_33_2 == "Only Scoped") and slot_251_9_0 then
			slot_251_35_0 = slot_251_6_0:GetActiveWeapon()

			if slot_251_35_0 then
				slot_251_36_2 = slot_0_29_0.Helpers.GetWeaponData(slot_251_35_0:GetDefIndex())

				if slot_251_36_2 and slot_251_36_2.mindamage then
					slot_251_37_2 = slot_251_36_2.mindamage
					slot_251_38_2 = 0

					if slot_251_37_2.GetValue then
						slot_251_39_2 = slot_251_37_2:GetValue()

						if slot_251_39_2 and slot_251_39_2.get then
							slot_251_38_2 = slot_251_39_2:Get()
						end
					elseif slot_251_37_2.get then
						slot_251_38_2 = slot_251_37_2:Get()
					end

					if slot_251_38_2 ~= nil then
						slot_251_39_1 = math.floor(slot_251_38_2)
						slot_251_40_2 = slot_251_39_1 > 100 and "HP+" .. tostring(slot_251_39_1 - 100) or tostring(slot_251_39_1)
						slot_251_41_2 = slot_251_2_0.font
						slot_251_2_0.font = UI.font_small or slot_251_41_2
						slot_251_42_1 = slot_251_2_0.font:GetTextSize(slot_251_40_2)
						slot_251_43_0 = UI.cfg.dmg_indicator_side or "Left"
						slot_251_44_0 = (slot_251_43_0 == 1 or slot_251_43_0 == "Left") and slot_251_12_0 - 6 - slot_251_42_1.x or slot_251_12_0 + 6
						slot_251_45_0 = slot_251_14_0 - 12
						slot_251_46_0 = slot_0_41_0(UI.cfg.dmg_indicator_color or {
							255,
							255,
							255,
							255,
							[0] = nil
						})

						slot_251_23_0(draw.Vec2(slot_251_44_0, slot_251_45_0), slot_251_40_2, slot_251_46_0)

						slot_251_2_0.font = slot_251_41_2
					end
				end
			end
		end
	end

	if slot_251_0_0 then
		if slot_0_113_0 then
			slot_251_33_1 = slot_251_25_0(slot_0_113_0.manual_l)
			slot_251_34_1 = slot_251_25_0(slot_0_113_0.manual_r)

			if slot_251_33_1 then
				table.insert(slot_251_29_0, {
					simple = "< Manual",
					val = "",
					["@YJo"] = nil,
					col = slot_251_31_0
				})
			elseif slot_251_34_1 then
				table.insert(slot_251_29_0, {
					simple = "Manual >",
					val = "",
					[0] = nil,
					col = slot_251_31_0
				})
			end
		end

		if slot_0_36_0 and slot_0_36_0.keybinds and slot_0_36_0.keybinds.list then
			for iter_251_1, iter_251_2 in ipairs(slot_0_36_0.keybinds.list) do
				slot_251_38_1 = iter_251_2.name
				slot_251_39_0 = nil

				if slot_251_38_1 == "Min Damage" then
					slot_251_39_0 = "Damage"
				elseif slot_251_38_1 == "Hitchance" then
					slot_251_39_0 = "HC"
				elseif slot_251_38_1 == "Fake Duck" then
					slot_251_39_0 = "Duck"
				elseif slot_251_38_1 == "Quick Peek" then
					slot_251_39_0 = "Peek"
				end

				if slot_251_39_0 then
					slot_251_40_1 = false

					if iter_251_2.id and gui.ctx then
						slot_251_41_1 = gui.ctx:find(iter_251_2.id)

						if slot_251_41_1 and slot_251_41_1.GetHotkeyState then
							slot_251_40_1 = slot_251_41_1:GetHotkeyState()
						end
					end

					if slot_251_40_1 then
						table.insert(slot_251_29_0, {
							val = "",
							[0] = nil,
							col = slot_251_31_0,
							simple = slot_251_39_0
						})
					end
				end
			end
		end

		if slot_0_113_0 and slot_251_25_0(slot_0_113_0.dt) then
			table.insert(slot_251_29_0, {
				simple = "DT",
				val = "",
				col = slot_251_31_0
			})
		end

		if slot_0_113_0 and slot_251_25_0(slot_0_113_0.fs) then
			table.insert(slot_251_29_0, {
				simple = "Force",
				val = "",
				[0] = nil,
				col = slot_251_31_0
			})
		end

		for iter_251_3, iter_251_4 in ipairs(slot_251_29_0) do
			slot_251_38_0 = ""

			if iter_251_4.simple ~= nil then
				slot_251_38_0 = iter_251_4.simple
			else
				slot_251_38_0 = iter_251_4.key .. ": " .. iter_251_4.val
			end

			slot_251_40_0 = string.upper(slot_251_38_0)
			slot_251_41_0 = slot_251_2_0.font:GetTextSize(slot_251_40_0)
			slot_251_42_0 = slot_251_28_0(slot_251_41_0.x)

			slot_251_23_0(draw.Vec2(slot_251_42_0, slot_251_16_0 + slot_251_17_1), slot_251_40_0, iter_251_4.col)

			slot_251_17_1 = slot_251_17_1 + 9
		end
	end

	if is_enabled("aa_fake_pitch") then
		slot_251_33_0 = "FAKE"
		slot_251_34_0 = slot_251_2_0.font:GetTextSize(slot_251_33_0)

		slot_251_23_0(draw.Vec2(slot_251_28_0(slot_251_34_0.x), slot_251_16_0 + slot_251_17_1), slot_251_33_0, slot_251_32_0)

		slot_251_17_0 = slot_251_17_1 + slot_251_34_0.y + 2
	end

	slot_251_2_0.font = slot_251_3_0
end

function slot_0_118_0()
	if not UI.theme then
		slot_257_0_0 = {}
	end

	if not is_enabled("slowed_indicator") then
		return
	end

	slot_257_1_0 = draw.surface
	slot_257_2_0, slot_257_3_0 = game.engine:GetScreenSize()
	slot_257_4_0 = slot_257_1_0.font
	slot_257_1_0.font = draw.fonts.gui_main or draw.fonts.gui_semi_bold or draw.fonts.gui_bold
	slot_257_6_0 = entities.GetLocalPawn()
	slot_257_7_0 = 1

	if slot_257_6_0 and slot_257_6_0:IsAlive() and slot_257_6_0.m_flVelocityModifier then
		slot_257_7_0 = slot_257_6_0.m_flVelocityModifier:Get()
	end

	if slot_257_7_0 >= 0.99 and not UI.open then
		slot_257_1_0.font = slot_257_4_0

		return
	end

	slot_257_8_0 = math.floor(slot_257_7_0 * 100)
	slot_257_9_0 = string.format("slowed %d%%", slot_257_8_0)
	slot_257_10_0 = slot_257_1_0.font:GetTextSize(slot_257_9_0)
	slot_257_11_0 = 16
	slot_257_12_0 = 4
	slot_257_13_0 = 10
	slot_257_14_0 = slot_257_13_0 * 2 + slot_257_11_0 + slot_257_12_0 + slot_257_10_0.x
	slot_257_15_0 = 24

	if (UI.cfg.slowed_y or 0) == 0 then
		UI.cfg.slowed_x = 50
		UI.cfg.slowed_y = slot_257_3_0 - 150
	end

	slot_257_16_0 = UI.cfg.slowed_x
	slot_257_17_0 = UI.cfg.slowed_y

	if UI.open then
		slot_257_18_1 = slot_0_10_0()
		slot_257_19_1 = slot_0_11_0() or slot_0_60_0

		if slot_257_18_1 and slot_257_19_1 then
			if not slot_0_36_0.slowed_dragging then
				slot_257_20_1 = slot_257_16_0 - 10
				slot_257_21_1 = slot_257_17_0 - 10
				slot_257_22_1 = slot_257_14_0 + 20
				slot_257_23_1 = slot_257_15_0 + 20

				if slot_257_20_1 <= slot_257_18_1.x and slot_257_18_1.x <= slot_257_20_1 + slot_257_22_1 and slot_257_21_1 <= slot_257_18_1.y and slot_257_18_1.y <= slot_257_21_1 + slot_257_23_1 then
					slot_0_36_0.slowed_dragging = true
					slot_0_36_0.slowed_drag_x = slot_257_18_1.x - slot_257_16_0
					slot_0_36_0.slowed_drag_y = slot_257_18_1.y - slot_257_17_0
				end
			else
				UI.cfg.slowed_x = slot_257_18_1.x - slot_0_36_0.slowed_drag_x
				UI.cfg.slowed_y = slot_257_18_1.y - slot_0_36_0.slowed_drag_y
				UI.cfg.slowed_x, UI.cfg.slowed_y = slot_0_20_0(UI.cfg.slowed_x, UI.cfg.slowed_y, slot_257_14_0, slot_257_15_0, slot_0_36_0.slowed_dragging)
				slot_257_16_0, slot_257_17_0 = UI.cfg.slowed_x, UI.cfg.slowed_y
			end
		else
			slot_0_36_0.slowed_dragging = false
		end

		slot_257_1_0:AddRect(draw.Rect(slot_257_16_0 - 2, slot_257_17_0 - 2, slot_257_16_0 + slot_257_14_0 + 2, slot_257_17_0 + slot_257_15_0 + 2), draw.Color(255, 255, 255, slot_0_36_0.slowed_dragging and 100 or 40), 6, 15)
	end

	slot_257_18_0 = UI.theme and UI.theme.accent or {
		255,
		0,
		255,
		255,
		[0] = nil
	}
	slot_257_19_0 = draw.GetTime()
	slot_257_20_0 = math.sin(slot_257_19_0 * 1.5) * 0.5 + 0.5
	slot_257_21_0 = slot_257_18_0[1] or 255
	slot_257_22_0 = slot_257_18_0[2] or 90
	slot_257_23_0 = slot_257_18_0[3] or 130

	for iter_257_0 = 1, 4 do
		slot_257_28_2 = iter_257_0 * 1.5
		slot_257_29_2 = math.floor((20 - iter_257_0 * 4) * (0.4 + slot_257_20_0 * 0.6))

		if slot_257_29_2 > 0 then
			slot_257_1_0:AddRectFilledRounded(draw.Rect(slot_257_16_0 - slot_257_28_2, slot_257_17_0 - slot_257_28_2, slot_257_16_0 + slot_257_14_0 + slot_257_28_2, slot_257_17_0 + slot_257_15_0 + slot_257_28_2), slot_0_41_0(slot_257_18_0, slot_257_29_2), 6, 15)
		end
	end

	function slot_257_24_0(arg_258_0, arg_258_1)
		local var_258_0 = math.sin(slot_257_19_0 * 1.2 + arg_258_0) * 0.5 + 0.5

		return draw.Color(math.floor(5 + slot_257_21_0 * 0.15 * var_258_0), math.floor(5 + slot_257_22_0 * 0.15 * var_258_0), math.floor(8 + slot_257_23_0 * 0.15 * var_258_0), math.floor(arg_258_1 * (0.8 + var_258_0 * 0.2)))
	end

	slot_257_1_0:AddRectFilledRoundedMulticolor(draw.Rect(slot_257_16_0, slot_257_17_0, slot_257_16_0 + slot_257_14_0, slot_257_17_0 + slot_257_15_0), {
		slot_257_24_0(0, 225),
		slot_257_24_0(2, 255),
		slot_257_24_0(4, 245),
		slot_257_24_0(6, 220)
	}, 6, 15)

	slot_257_25_0 = slot_0_47_0 and (slot_0_47_0.wm_main or slot_0_47_0.main)

	if slot_257_25_0 then
		slot_257_26_1 = slot_257_1_0.font
		slot_257_1_0.font = slot_257_25_0
		slot_257_27_1 = slot_257_1_0.font:GetTextSize("B")
		slot_257_28_1 = slot_257_17_0 + slot_257_15_0 / 2 + 2
		slot_257_29_1 = slot_257_16_0 + slot_257_13_0 + slot_257_11_0 / 2

		slot_257_1_0:AddText(draw.Vec2(slot_257_29_1 - slot_257_27_1.x / 2, slot_257_28_1 - slot_257_27_1.y / 2), "B", slot_0_41_0(slot_257_18_0, 150))

		slot_257_1_0.font = slot_257_26_1
	end

	slot_257_26_0 = slot_257_16_0 + slot_257_13_0 + slot_257_11_0 + slot_257_12_0
	slot_257_27_0 = slot_257_17_0 + slot_257_15_0 / 2 - slot_257_10_0.y / 2

	slot_257_1_0:AddText(draw.Vec2(slot_257_26_0, slot_257_27_0), slot_257_9_0, draw.Color(255, 255, 255, 255))

	slot_257_28_0 = 1
	slot_257_29_0 = slot_257_14_0 - 12
	slot_257_30_0 = slot_257_16_0 + 6
	slot_257_31_0 = slot_257_17_0 + slot_257_15_0 - slot_257_28_0 - 1
	slot_257_32_0 = slot_257_29_0 * slot_257_7_0

	slot_257_1_0:AddRectFilled(draw.Rect(slot_257_30_0, slot_257_31_0, slot_257_30_0 + slot_257_29_0, slot_257_31_0 + slot_257_28_0), slot_0_41_0(slot_257_18_0, 15))
	slot_257_1_0:AddRectFilled(draw.Rect(slot_257_30_0, slot_257_31_0, slot_257_30_0 + slot_257_32_0, slot_257_31_0 + slot_257_28_0), slot_0_41_0(slot_257_18_0, 150))

	slot_257_1_0.font = slot_257_4_0
end

function slot_0_119_0()
	slot_259_0_0 = draw.surface

	if not slot_259_0_0 then
		return
	end

	slot_259_1_0 = slot_259_0_0.font
	slot_259_2_0, slot_259_3_0 = game.engine:GetScreenSize()
	slot_259_4_0 = slot_259_2_0 / 2
	slot_259_5_0 = slot_259_3_0 / 2
	slot_259_6_0 = game.globalVars.m_flRealTime

	if not slot_0_36_0.loading.start_time or slot_0_36_0.loading.start_time == 0 then
		slot_0_36_0.loading.start_time = slot_259_6_0
	end

	slot_259_7_0 = slot_259_6_0 - slot_0_36_0.loading.start_time
	slot_259_8_0 = 3.5
	slot_259_9_0 = math.min(1, slot_259_7_0 / slot_259_8_0)
	slot_0_36_0.loading.progress = slot_0_36_0.loading.progress + (slot_259_9_0 - slot_0_36_0.loading.progress) * 0.05

	if slot_0_36_0.loading.progress > 0.999 then
		slot_0_36_0.loading.fade_alpha = slot_0_36_0.loading.fade_alpha - 10

		if slot_0_36_0.loading.fade_alpha <= 0 then
			slot_0_36_0.loading.active = false
		end
	end

	slot_259_10_0 = slot_0_36_0.loading.fade_alpha / 255
	slot_259_11_0 = UI.cfg and UI.cfg.theme_accent or {
		255,
		90,
		130,
		255,
		[0] = nil
	}

	function slot_259_12_0(arg_260_0, arg_260_1)
		local var_260_0 = arg_260_0[4] or 255

		return draw.Color(arg_260_0[1], arg_260_0[2], arg_260_0[3], math.floor(var_260_0 * slot_259_10_0 * (arg_260_1 or 1)))
	end

	if slot_259_0_0.add_background_blur then
		slot_259_0_0:AddBackgroundBlur(draw.Rect(0, 0, slot_259_2_0, slot_259_3_0), 1)
	end

	slot_259_0_0:AddRectFilled(draw.Rect(0, 0, slot_259_2_0, slot_259_3_0), draw.Color(0, 0, 0, math.floor(180 * slot_259_10_0)))

	slot_259_13_0 = slot_259_5_0 - 35

	if slot_0_36_0.loading.logo_tex and slot_259_0_0.g and slot_259_0_0.g.set_texture then
		slot_259_0_0.g:set_texture(slot_0_36_0.loading.logo_tex)

		slot_259_14_2 = 180

		slot_259_0_0:AddRectFilled(draw.Rect(slot_259_4_0 - slot_259_14_2 / 2, slot_259_13_0 - slot_259_14_2 / 2, slot_259_4_0 + slot_259_14_2 / 2, slot_259_13_0 + slot_259_14_2 / 2), draw.Color(255, 255, 255, math.floor(255 * slot_259_10_0)))
		slot_259_0_0.g:set_texture(nil)
	else
		slot_259_14_1 = draw.fonts.gui_main or slot_259_0_0.font

		if slot_259_14_1 then
			slot_259_0_0.font = slot_259_14_1
			slot_259_15_1 = "SILENTIUM"
			slot_259_16_1 = slot_259_0_0.font:GetTextSize(slot_259_15_1)

			slot_259_0_0:AddText(draw.Vec2(slot_259_4_0 - slot_259_16_1.x / 2, slot_259_13_0 - slot_259_16_1.y / 2), slot_259_15_1, draw.Color(255, 255, 255, math.floor(255 * slot_259_10_0)))
		end
	end

	slot_259_14_0 = 300
	slot_259_15_0 = 6
	slot_259_16_0 = slot_259_4_0 - slot_259_14_0 / 2
	slot_259_17_0 = slot_259_5_0 + 85

	slot_259_0_0:AddRectFilledRounded(draw.Rect(slot_259_16_0 - 2, slot_259_17_0 - 2, slot_259_16_0 + slot_259_14_0 + 2, slot_259_17_0 + slot_259_15_0 + 2), draw.Color(20, 20, 25, math.floor(200 * slot_259_10_0)), 4, 15)

	slot_259_18_0 = slot_259_14_0 * slot_0_36_0.loading.progress

	if slot_259_18_0 > 4 then
		for iter_259_0 = 1, 3 do
			slot_259_0_0:AddRectFilledRounded(draw.Rect(slot_259_16_0 - iter_259_0, slot_259_17_0 - iter_259_0, slot_259_16_0 + slot_259_18_0 + iter_259_0, slot_259_17_0 + slot_259_15_0 + iter_259_0), slot_259_12_0(slot_259_11_0, (10 - iter_259_0 * 3) / 255), 4, 15)
		end

		slot_259_0_0:AddRectFilledRounded(draw.Rect(slot_259_16_0, slot_259_17_0, slot_259_16_0 + slot_259_18_0, slot_259_17_0 + slot_259_15_0), slot_259_12_0(slot_259_11_0, 1), 4, 15)
	end

	slot_259_19_0 = draw.fonts.gui_main or slot_259_0_0.font

	if slot_259_19_0 then
		slot_259_0_0.font = slot_259_19_0

		if slot_0_36_0.loading.status_list then
			slot_259_20_1 = math.max(1, math.min(#slot_0_36_0.loading.status_list, math.floor(slot_0_36_0.loading.progress * #slot_0_36_0.loading.status_list) + 1))
			slot_0_36_0.loading.status = slot_0_36_0.loading.status_list[slot_259_20_1]
		end

		slot_259_20_0 = string.format("%d%%", math.floor(slot_0_36_0.loading.progress * 100))
		slot_259_21_0 = slot_259_0_0.font:GetTextSize(slot_259_20_0)

		slot_259_0_0:AddText(draw.Vec2(slot_259_4_0 + slot_259_14_0 / 2 - slot_259_21_0.x, slot_259_17_0 - 25), slot_259_20_0, draw.Color(255, 255, 255, math.floor(230 * slot_259_10_0)))

		if slot_0_36_0.loading.status then
			slot_259_22_0 = slot_259_0_0.font:GetTextSize(slot_0_36_0.loading.status)

			slot_259_0_0:AddText(draw.Vec2(slot_259_4_0 - slot_259_14_0 / 2, slot_259_17_0 - 25), slot_0_36_0.loading.status, draw.Color(255, 255, 255, math.floor(150 * slot_259_10_0)))
		end
	end

	slot_259_0_0.font = slot_259_1_0
end

function handle_auto_connect(arg_261_0)
	if not UI or not UI.cfg then
		return
	end

	if not arg_261_0 and not UI.cfg.misc_auto_connect then
		return
	end

	if UI.open and not arg_261_0 then
		return
	end

	local var_261_0 = draw.GetTime()

	if not arg_261_0 and slot_0_36_0.auto_connect.last_check_time ~= -1 and var_261_0 - slot_0_36_0.auto_connect.last_check_time < 2 then
		return
	end

	slot_0_36_0.auto_connect.last_check_time = var_261_0

	local var_261_1 = get_clipboard_safe()

	if not var_261_1 or type(var_261_1) ~= "string" or var_261_1 == "" then
		if arg_261_0 then
			notify("Clipboard is empty.", "error")
		end

		return
	end

	local var_261_2 = var_261_1:gsub("^%s+", ""):gsub("%s+$", ""):gsub("^\"", ""):gsub("\"$", ""):gsub("\r", ""):gsub("\n", " ")
	local var_261_3 = var_261_2:match("connect%s+([%d%.]+:%d+)") or var_261_2:match("connect%s+([%d%.]+%s+%d+)") or var_261_2:match("connect%s+([%d%.]+)") or var_261_2:match("([%d%.]+:%d+)") or var_261_2:match("([%d%.]+%s+%d+)") or var_261_2:match("([%d%.]+)")

	if var_261_3 and var_261_3:match("%d+%.%d+") and #var_261_3 >= 7 then
		local var_261_4 = var_261_3:gsub("%s+", ":")

		if arg_261_0 or var_261_4 ~= slot_0_36_0.auto_connect.last_ip then
			slot_0_36_0.auto_connect.last_ip = var_261_4
			slot_0_36_0.auto_connect.last_connect_time = var_261_0

			game.engine:ClientCmd("connect " .. var_261_4)
			notify("Auto-connecting to " .. var_261_4, "success")
			print("[Silentium] Auto-connected to: " .. var_261_4)
		end
	elseif arg_261_0 then
		notify("No valid server IP found in clipboard.", "error")
		print("[Silentium] Manual connect failed. Clipboard: " .. tostring(var_261_2))
	end
end

slot_0_120_0 = slot_0_107_0

function slot_0_121_0()
	local var_262_0 = slot_0_11_0()

	if var_262_0 and not UI.last_click_debug then
		UI.last_click_debug = true
	elseif not var_262_0 then
		UI.last_click_debug = false
	end

	if slot_0_37_0 and not slot_0_37_0.initial_fetch_done and slot_0_37_0.fetchUserUID then
		slot_0_37_0.fetchUserUID()

		slot_0_37_0.initial_fetch_done = true
	end

	if slot_0_37_0 and slot_0_37_0.processQueue then
		slot_0_37_0.processQueue()
	end

	if not UI.fonts_loaded then
		slot_0_52_0()
	end

	if not slot_0_111_0 then
		slot_0_112_0()

		slot_0_111_0 = true
	end

	local var_262_1 = draw.surface

	if var_262_1 then
		var_262_1.font = draw.fonts.default
	end

	if gui and gui.is_visible then
		UI.open = gui.is_visible()
	end

	if slot_0_36_0.loading.active then
		slot_0_119_0()

		return
	end

	if slot_0_120_0 then
		slot_0_120_0()
	end

	slot_0_118_0()
	slot_0_117_0()
	slot_0_116_0()
	slot_0_55_0()
	slot_0_54_0()

	if is_enabled("misc_impact_viz_enabled") and slot_0_36_0.bullet_impacts then
		local var_262_2 = game.globalVars.m_flRealTime
		local var_262_3 = UI.cfg.misc_impact_viz_duration or 1
		local var_262_4 = UI.cfg.misc_impact_viz_color or {
			255,
			90,
			130,
			255,
			[0] = nil
		}

		for iter_262_0 = #slot_0_36_0.bullet_impacts, 1, -1 do
			local var_262_5 = slot_0_36_0.bullet_impacts[iter_262_0]
			local var_262_6 = var_262_2 - var_262_5.time

			if var_262_3 < var_262_6 then
				table.remove(slot_0_36_0.bullet_impacts, iter_262_0)
			else
				local var_262_7 = var_262_6 / var_262_3
				local var_262_8 = 1 - math.pow(var_262_7, 2)
				local var_262_9 = math.floor(var_262_4[4] * var_262_8)

				if var_262_9 > 0 then
					local var_262_10 = math.WorldToScreen(var_262_5.pos)

					if var_262_10 then
						local var_262_11 = draw.surface
						local var_262_12 = 3 + var_262_7 * 5

						for iter_262_1 = 3, 1, -1 do
							local var_262_13 = var_262_12 * iter_262_1
							local var_262_14 = math.floor(var_262_9 * (0.1 / iter_262_1))

							var_262_11:AddCircleFilled(draw.Vec2(var_262_10.x, var_262_10.y), var_262_13, draw.Color(var_262_4[1], var_262_4[2], var_262_4[3], var_262_14), 16)
						end

						var_262_11:AddCircleFilled(draw.Vec2(var_262_10.x, var_262_10.y), 2, draw.Color(255, 255, 255, var_262_9), 8)
					end
				end
			end
		end
	end

	if handle_auto_connect then
		handle_auto_connect()
	end

	slot_0_59_0.char_buffer = {}
end

slot_0_122_0 = {
	p = 0,
	s = false,
	y = 0,
	b = 0,
	a = 0
}

function slot_0_123_0(arg_263_0)
	if not is_enabled("aa_avoid_backstab") then
		if slot_0_122_0.s then
			slot_263_1_1 = gui.ctx:find("rage>anti-aim>angles>pitch")
			slot_263_2_1 = gui.ctx:find("rage>anti-aim>angles>yaw")
			slot_263_3_1 = gui.ctx:find("rage>anti-aim>angles>yaw base")
			slot_263_4_1 = gui.ctx:find("rage>anti-aim>angles>yaw>settings>amount")

			slot_0_29_0.Helpers.SetValue(slot_263_1_1, slot_0_122_0.p)
			slot_0_29_0.Helpers.SetValue(slot_263_2_1, slot_0_122_0.y)
			slot_0_29_0.Helpers.SetValue(slot_263_3_1, slot_0_122_0.b)
			slot_0_29_0.Helpers.SetValue(slot_263_4_1, slot_0_122_0.a)

			slot_0_122_0.s = false
		end

		return
	end

	slot_263_1_0 = entities.GetLocalPawn()

	if not slot_263_1_0 or not slot_263_1_0:IsAlive() then
		return
	end

	slot_263_2_0 = slot_263_1_0:GetAbsOrigin()
	slot_263_3_0 = slot_263_1_0:GetEyePos()

	if not slot_263_2_0 or not slot_263_3_0 then
		return
	end

	slot_263_4_0 = 0
	slot_263_5_0 = game.engine:get_netchan()

	if slot_263_5_0 and not slot_263_5_0:is_null() then
		slot_263_4_0 = math.floor(slot_263_5_0:get_latency() * 1000) * 0.8
	end

	slot_263_6_0 = UI.cfg and UI.cfg.aa_avoid_backstab_dist or 175
	slot_263_7_0 = false
	slot_263_8_0 = nil
	slot_263_9_0 = 100000

	entities.players:for_each(function(arg_264_0)
		local var_264_0 = arg_264_0.entity

		if not var_264_0 or var_264_0 == slot_263_1_0 or not var_264_0:IsAlive() or not var_264_0:IsEnemy() then
			return
		end

		local var_264_1 = var_264_0:GetActiveWeapon()

		if not var_264_1 or var_264_1:GetType() ~= 0 then
			return
		end

		local var_264_2 = var_264_0:GetAbsOrigin()
		local var_264_3 = var_264_0:GetAbsVelocity()

		if var_264_2 and var_264_3 then
			local var_264_4 = (slot_263_2_0 - var_264_2):length_2d()
			local var_264_5 = var_264_3:length_2d()

			if var_264_4 - slot_263_4_0 - var_264_5 / 2 <= slot_263_6_0 and var_264_4 < slot_263_9_0 then
				slot_263_7_0 = true
				slot_263_9_0 = var_264_4
				slot_263_8_0 = var_264_0
			end
		end
	end)

	slot_263_10_0 = gui.ctx:find("rage>anti-aim>angles>pitch")
	slot_263_11_0 = gui.ctx:find("rage>anti-aim>angles>yaw")
	slot_263_12_0 = gui.ctx:find("rage>anti-aim>angles>yaw base")
	slot_263_13_0 = gui.ctx:find("rage>anti-aim>angles>yaw>settings>amount")

	if slot_263_7_0 and slot_263_8_0 then
		if not slot_0_122_0.s and slot_263_10_0 and slot_263_11_0 and slot_263_12_0 and slot_263_13_0 then
			slot_263_14_0 = slot_263_10_0:GetValue():Get()
			slot_263_15_0 = slot_263_11_0:GetValue():Get()
			slot_263_16_0 = slot_263_12_0:GetValue():Get()
			slot_263_17_0 = slot_263_13_0:GetValue():Get()
			slot_0_122_0.p = type(slot_263_14_0) == "number" and slot_263_14_0 or slot_0_122_0.p
			slot_0_122_0.y = type(slot_263_15_0) == "number" and slot_263_15_0 or slot_0_122_0.y
			slot_0_122_0.b = type(slot_263_16_0) == "number" and slot_263_16_0 or slot_0_122_0.b
			slot_0_122_0.a = type(slot_263_17_0) == "number" and slot_263_17_0 or slot_0_122_0.a
			slot_0_122_0.s = true

			slot_0_29_0.Helpers.SetValue(slot_263_10_0, 8)
			slot_0_29_0.Helpers.SetValue(slot_263_11_0, 4)
			slot_0_29_0.Helpers.SetValue(slot_263_12_0, 1)
			slot_0_29_0.Helpers.SetValue(slot_263_13_0, 0)
		end
	elseif slot_0_122_0.s then
		slot_0_122_0.s = false

		slot_0_29_0.Helpers.SetValue(slot_263_10_0, slot_0_122_0.p)
		slot_0_29_0.Helpers.SetValue(slot_263_11_0, slot_0_122_0.y)
		slot_0_29_0.Helpers.SetValue(slot_263_12_0, slot_0_122_0.b)
		slot_0_29_0.Helpers.SetValue(slot_263_13_0, slot_0_122_0.a)
	end
end

slot_0_124_1 = 0.015625
slot_0_125_1 = 0.2
slot_0_126_1 = math.floor(slot_0_125_1 / slot_0_124_1)
slot_0_127_1 = {}
slot_0_128_1 = {
	HideAAActive = false,
	ScanSticks = 0,
	LastBreadcrumbTime = 0,
	LastScanTime = 0,
	Fired = false,
	JumpAngle = 0,
	JumpInitialVelocity = 0,
	Active = false,
	IsEPeek = false,
	State = "IDLE",
	VisibleEnemies = 0,
	Cooldown = 0,
	JSActive = false,
	[0] = nil,
	OriginalAA = {
		aa_enabled = true,
		amount = 0,
		yaw_raw = 0
	},
	OriginalJS = {
		autostop_raw = 0
	},
	DebugRays = {},
	Calibration = {
		ActualApexPos = nil,
		JumpDir = nil,
		MaxZ = 0,
		StartVelZ = 0,
		IsJumping = false,
		LastSpeed = 0,
		AirTicks = 0
	},
	ScanResults = {
		lastSuccessfulScan = 0,
		[0] = nil,
		reasons = {}
	},
	TraceStats = {
		Movement = 0,
		Firebullet = 0,
		Normal = 0
	},
	Breadcrumbs = {}
}

function slot_0_129_1()
	slot_0_128_1.TraceStats.Normal = 0
	slot_0_128_1.TraceStats.Firebullet = 0
	slot_0_128_1.TraceStats.Movement = 0
end

function slot_0_130_1(arg_266_0)
	if not slot_0_128_1.TraceStats[arg_266_0] then
		return
	end

	slot_0_128_1.TraceStats[arg_266_0] = slot_0_128_1.TraceStats[arg_266_0] + 1
end

function slot_0_131_1()
	local var_267_0 = {}

	entities.players:for_each(function(arg_268_0)
		local var_268_0 = arg_268_0.entity

		if var_268_0 and var_268_0:IsAlive() and var_268_0:IsEnemy() then
			table.insert(var_267_0, var_268_0)
		end
	end)

	return var_267_0
end

function slot_0_132_1(arg_269_0, arg_269_1)
	local var_269_0 = arg_269_1:GetDefIndex()
	local var_269_1 = ({
		"Desert Eagle",
		nil,
		nil,
		"Glock-18",
		nil,
		nil,
		"AK-47",
		nil,
		"AWP",
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		"M4A4",
		[36] = "P250",
		[32] = "P2000",
		[63] = "CZ75-Auto",
		[61] = "USP-S",
		[60] = "M4A1-S",
		[64] = "R8 Revolver",
		[40] = "SSG-08",
		[38] = "SCAR-20",
		[0] = nil
	})[var_269_0]
	local var_269_2 = var_269_1 and "rage>weapon>" .. var_269_1 .. ">weapon>mindamage" or "rage>weapon>general>weapon>mindamage"
	local var_269_3 = gui.ctx:find(var_269_2)

	if var_269_3 and var_269_3.Get then
		return var_269_3:Get()
	end

	return 1
end

function slot_0_133_1(arg_270_0)
	local var_270_0 = arg_270_0:GetDefIndex()
	local var_270_1 = {
		"Desert Eagle",
		"Dualies",
		"Five-SeveN",
		"Glock-18",
		nil,
		nil,
		"AK-47",
		"AUG",
		"AWP",
		"FAMAS",
		"G3SG1",
		nil,
		"Galil",
		"M249",
		nil,
		"M4A4",
		"MAC-10",
		nil,
		"P90",
		nil,
		nil,
		nil,
		nil,
		"UMP-45",
		"XM1014",
		"Bizon",
		"MAG-7",
		"Negev",
		"Sawed-Off",
		"Tec-9",
		nil,
		"P2000",
		"MP7",
		"MP9",
		"Nova",
		"P250",
		nil,
		"SCAR-20",
		"SG 553",
		"SSG-08",
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		"M4A1-S",
		"USP-S",
		nil,
		"CZ75-Auto",
		"R8 Revolver",
		[0] = nil
	}
	local var_270_2 = {
		MP7 = "SMGs",
		MP9 = "SMGs",
		P250 = "Pistols",
		["Desert Eagle"] = "Heavy Pistols",
		["Glock-18"] = "Pistols",
		["AK-47"] = "Rifles",
		M4A4 = "Rifles",
		["SCAR-20"] = "Auto Snipers",
		["SSG-08"] = "Bolt Snipers",
		["R8 Revolver"] = "Heavy Pistols",
		["M4A1-S"] = "Rifles",
		["USP-S"] = "Pistols",
		["CZ75-Auto"] = "Pistols",
		P2000 = "Pistols",
		["Tec-9"] = "Pistols",
		Nova = "Heavy",
		["Five-SeveN"] = "Pistols",
		Negev = "Heavy",
		["MAG-7"] = "Heavy",
		AUG = "Rifles",
		AWP = "Bolt Snipers",
		FAMAS = "Rifles",
		G3SG1 = "Auto Snipers",
		Bizon = "SMGs",
		M249 = "Heavy",
		Dualies = "Pistols",
		["SG 553"] = "Rifles",
		P90 = "SMGs",
		XM1014 = "Heavy",
		Galil = "Rifles",
		["Sawed-Off"] = "Heavy",
		["MAC-10"] = "SMGs",
		["UMP-45"] = "SMGs",
		cloud_scroll_target = nil
	}

	local function var_270_3(arg_271_0)
		if not arg_271_0 or not arg_271_0.GetValue then
			return nil
		end

		local var_271_0 = arg_271_0:GetValue()

		if not var_271_0 or not var_271_0.Get then
			return nil
		end

		local var_271_1 = var_271_0:Get()

		if not var_271_1 then
			return nil
		end

		if type(var_271_1) == "number" then
			return var_271_1
		end

		if var_271_1.Get then
			for iter_271_0 = 0, 2 do
				if var_271_1:Get(iter_271_0) then
					return iter_271_0
				end
			end
		end

		return nil
	end

	local var_270_4 = var_270_1[var_270_0]
	local var_270_5 = ">weapon>target selection"

	if var_270_4 then
		local var_270_6 = var_270_3(gui.ctx:find("rage>weapon>" .. var_270_4 .. var_270_5))

		if var_270_6 then
			return var_270_6
		end

		local var_270_7 = var_270_2[var_270_4]

		if var_270_7 then
			local var_270_8 = var_270_3(gui.ctx:find("rage>weapon>" .. var_270_7 .. var_270_5))

			if var_270_8 then
				return var_270_8
			end
		end
	end

	local var_270_9 = var_270_3(gui.ctx:find("rage>weapon>general" .. var_270_5))

	if var_270_9 then
		return var_270_9
	end

	return 0
end

function slot_0_134_1(arg_272_0, arg_272_1, arg_272_2, arg_272_3, arg_272_4)
	arg_272_3 = arg_272_3 or 3

	if arg_272_3 >= #arg_272_1 then
		return arg_272_1
	end

	local var_272_0 = arg_272_0:GetAbsOrigin()
	local var_272_1 = arg_272_0:GetEyePos()
	local var_272_2 = arg_272_4 or game.engine and game.engine.GetViewAngles and game.engine:GetViewAngles() or Vector(0, 0, 0)
	local var_272_3 = var_272_2 and var_272_2.y or 0
	local var_272_4 = var_272_2 and var_272_2.x or 0
	local var_272_5 = {}

	for iter_272_0, iter_272_1 in ipairs(arg_272_1) do
		local var_272_6 = iter_272_1:GetAbsOrigin() - var_272_0
		local var_272_7 = var_272_6:Length()
		local var_272_8 = 0
		local var_272_9 = iter_272_1.m_fFlags and iter_272_1.m_fFlags:Get() or 0

		if slot_0_7_0.band(var_272_9, 1) == 0 then
			var_272_8 = var_272_8 + 5000
		end

		if arg_272_2 == 0 then
			var_272_8 = var_272_8 + (200 - (iter_272_1.m_iHealth and iter_272_1.m_iHealth:Get() or 100)) + 12000 / math.max(var_272_7, 1)
		elseif arg_272_2 == 1 then
			local var_272_10 = math.deg(math.atan2(var_272_6.y, var_272_6.x))
			local var_272_11 = math.abs(var_272_10 - var_272_3)

			if var_272_11 > 180 then
				var_272_11 = 360 - var_272_11
			end

			local var_272_12 = iter_272_1:GetHitboxCenter(slot_0_5_0.HEAD)
			local var_272_13 = 0

			if var_272_12 then
				local var_272_14 = var_272_12 - var_272_1
				local var_272_15 = -math.deg(math.atan2(var_272_14.z, var_272_14:Length2d()))

				var_272_13 = math.abs(var_272_15 - var_272_4)
			end

			var_272_8 = var_272_8 + (1000 - (var_272_11 * 3 + var_272_13 * 2))
		elseif arg_272_2 == 2 then
			local var_272_16 = iter_272_1:GetAbsVelocity():Length2d()
			local var_272_17 = math.min(var_272_16, 300)

			var_272_8 = var_272_8 + 5000 / math.max(var_272_7, 1) + (500 - var_272_17)
		end

		table.insert(var_272_5, {
			enemy = iter_272_1,
			score = var_272_8
		})
	end

	table.sort(var_272_5, function(arg_273_0, arg_273_1)
		return arg_273_0.score > arg_273_1.score
	end)

	local var_272_18 = {}

	for iter_272_2 = 1, math.min(arg_272_3, #var_272_5) do
		table.insert(var_272_18, var_272_5[iter_272_2].enemy)
	end

	return var_272_18
end

function slot_0_135_1()
	local var_274_0 = game.engine:get_netchan()

	if not var_274_0 or var_274_0:is_null() then
		return 4
	end

	local var_274_1 = var_274_0:get_latency() or 0.05

	return (math.max(2, math.min(12, math.floor(var_274_1 / slot_0_124_1))))
end

function slot_0_136_1()
	local var_275_0 = {}

	entities.players:for_each(function(arg_276_0)
		local var_276_0 = arg_276_0.entity

		if not var_276_0 or not var_276_0:IsAlive() or not var_276_0:IsEnemy() then
			return
		end

		local var_276_1 = var_276_0.get_index and var_276_0:GetIndex() or tostring(var_276_0)

		if not var_276_1 then
			return
		end

		var_275_0[var_276_1] = true

		if not slot_0_127_1[var_276_1] then
			slot_0_127_1[var_276_1] = {}
		end

		local var_276_2 = {
			entity = var_276_0,
			time = game.globalVars.m_flRealTime,
			origin = var_276_0:GetAbsOrigin(),
			hitboxes = {}
		}
		local var_276_3 = {
			slot_0_5_0.HEAD,
			slot_0_5_0.NECK,
			slot_0_5_0.UPPER_CHEST,
			slot_0_5_0.CHEST,
			slot_0_5_0.THORAX,
			slot_0_5_0.PELVIS,
			slot_0_5_0.RIGHT_UPPER_ARM,
			slot_0_5_0.LEFT_UPPER_ARM,
			slot_0_5_0.RIGHT_LOWER_ARM,
			slot_0_5_0.LEFT_LOWER_ARM,
			slot_0_5_0.RIGHT_HAND,
			slot_0_5_0.LEFT_HAND,
			slot_0_5_0.RIGHT_UPPER_LEG,
			slot_0_5_0.LEFT_UPPER_LEG,
			slot_0_5_0.RIGHT_LOWER_LEG,
			slot_0_5_0.LEFT_LOWER_LEG,
			slot_0_5_0.RIGHT_FOOT,
			slot_0_5_0.LEFT_FOOT
		}

		for iter_276_0, iter_276_1 in ipairs(var_276_3) do
			if not var_276_0.GetHitboxCenter then
				break
			end

			local var_276_4 = var_276_0:GetHitboxCenter(iter_276_1)
			local var_276_5 = var_276_0.GetHitbox and var_276_0:GetHitbox(iter_276_1)

			if var_276_4 then
				var_276_2.hitboxes[iter_276_1] = {
					atom = nil,
					center = var_276_4,
					mins = var_276_5 and var_276_5.GetMinBounds and var_276_5:GetMinBounds() or nil,
					maxs = var_276_5 and var_276_5.GetMaxBounds and var_276_5:GetMaxBounds() or nil
				}
			end
		end

		table.insert(slot_0_127_1[var_276_1], 1, var_276_2)

		if #slot_0_127_1[var_276_1] > slot_0_126_1 then
			table.remove(slot_0_127_1[var_276_1])
		end
	end)

	for iter_275_0, iter_275_1 in pairs(slot_0_127_1) do
		if not var_275_0[iter_275_0] then
			slot_0_127_1[iter_275_0] = nil
		end
	end
end

function slot_0_137_1(arg_277_0)
	if type(arg_277_0) == "number" then
		return arg_277_0
	end

	if type(arg_277_0) == "userdata" and arg_277_0.value then
		return arg_277_0.value
	end

	return 0
end

function slot_0_138_1(arg_278_0)
	if not arg_278_0 or not arg_278_0.m_pWeaponServices then
		return nil
	end

	local var_278_0 = arg_278_0.m_pWeaponServices

	if var_278_0.GetAs then
		return var_278_0:GetAs("client.dll", "CCSPlayer_WeaponServices")
	end

	return var_278_0
end

function slot_0_139_1(arg_279_0, arg_279_1, arg_279_2, arg_279_3)
	local var_279_0 = gui.ctx:find("rage>anti-aim>angles>anti-aim")
	local var_279_1 = gui.ctx:find("rage>anti-aim>angles>yaw")
	local var_279_2 = gui.ctx:find("rage>anti-aim>angles>yaw>settings>amount")

	if not var_279_1 or not var_279_2 or not arg_279_1 then
		return
	end

	if not is_enabled("ai_peek_freestanding") then
		return
	end

	local var_279_3 = var_279_1:GetValue()
	local var_279_4 = var_279_3:Get()

	if not var_279_4 then
		return
	end

	if arg_279_0 then
		if not slot_0_128_1.HideAAActive then
			slot_0_128_1.OriginalAA.yaw_raw = var_279_4:GetRaw()
			slot_0_128_1.OriginalAA.amount = var_279_2:GetValue():Get()
			slot_0_128_1.OriginalAA.aa_enabled = var_279_0 and var_279_0:GetValue():Get() or true
			slot_0_128_1.HideAAActive = true
		end

		if arg_279_3 then
			if var_279_0 then
				var_279_0:SetValue(false)
			end
		else
			if var_279_0 then
				var_279_0:SetValue(true)
			end

			local var_279_5 = 0

			if arg_279_2 and #arg_279_2 > 0 then
				local var_279_6 = arg_279_1:GetAbsOrigin()
				local var_279_7 = arg_279_2[1]:GetAbsOrigin()

				var_279_5 = math.deg(math.atan2(var_279_7.y - var_279_6.y, var_279_7.x - var_279_6.x))
			end

			local var_279_8 = arg_279_1:GetAbsOrigin()
			local var_279_9 = 180
			local var_279_10 = 999

			for iter_279_0 = 0, 11 do
				local var_279_11 = iter_279_0 * 30
				local var_279_12 = math.rad(var_279_11)
				local var_279_13 = Vector(math.cos(var_279_12), math.sin(var_279_12), 0)
				local var_279_14 = ray_t()

				slot_0_130_1("Normal")

				local var_279_15 = game.physics_query_interface:TraceMovement(var_279_14, var_279_8, var_279_8 + var_279_13 * 100)

				if var_279_15.m_flFraction < 1 then
					local var_279_16 = var_279_15.m_flFraction * 100

					if var_279_16 < var_279_10 then
						var_279_10 = var_279_16

						local var_279_17 = (var_279_11 + 90) % 360
						local var_279_18 = (var_279_11 - 90) % 360
						local var_279_19 = math.abs(var_279_17 - var_279_5)

						if var_279_19 > 180 then
							var_279_19 = 360 - var_279_19
						end

						local var_279_20 = math.abs(var_279_18 - var_279_5)

						if var_279_20 > 180 then
							var_279_20 = 360 - var_279_20
						end

						var_279_9 = var_279_20 < var_279_19 and var_279_17 or var_279_18
					end
				end
			end

			var_279_4:SetRaw(4)
			var_279_3:Set(var_279_4)
			var_279_2:GetValue():Set(var_279_9)
		end
	elseif slot_0_128_1.HideAAActive then
		var_279_4:SetRaw(slot_0_128_1.OriginalAA.yaw_raw)
		var_279_3:Set(var_279_4)
		var_279_2:GetValue():Set(slot_0_128_1.OriginalAA.amount)

		if var_279_0 then
			var_279_0:SetValue(slot_0_128_1.OriginalAA.aa_enabled)
		end

		slot_0_128_1.HideAAActive = false
	end
end

function slot_0_140_1(arg_280_0)
	local var_280_0 = gui.ctx:find("rage>weapon>SSG-08>extra>autostop>settings>mode")
	local var_280_1 = gui.ctx:find("rage>aimbot>general>force shoot")

	if not var_280_0 or not var_280_1 then
		return
	end

	local var_280_2 = var_280_0:GetValue()
	local var_280_3 = var_280_2:Get()

	if not var_280_3 then
		return
	end

	if arg_280_0 then
		if not slot_0_128_1.JSActive then
			slot_0_128_1.OriginalJS.autostop_raw = var_280_3:GetRaw()
			slot_0_128_1.JSActive = true
		end

		var_280_3:SetRaw(20)
		var_280_2:Set(var_280_3)
		var_280_1:SetValue(true)
	elseif slot_0_128_1.JSActive then
		var_280_3:SetRaw(slot_0_128_1.OriginalJS.autostop_raw)
		var_280_2:Set(var_280_3)
		var_280_1:SetValue(false)

		slot_0_128_1.JSActive = false
	end
end

slot_0_141_1 = {
	slot_0_5_0.HEAD,
	slot_0_5_0.PELVIS,
	slot_0_5_0.CHEST,
	slot_0_5_0.UPPER_CHEST,
	slot_0_5_0.THORAX
}
slot_0_142_1 = {
	slot_0_5_0.HEAD,
	slot_0_5_0.CHEST,
	slot_0_5_0.PELVIS
}
slot_0_143_1 = {
	slot_0_5_0.HEAD,
	slot_0_5_0.CHEST,
	slot_0_5_0.PELVIS,
	slot_0_5_0.THORAX
}

function slot_0_144_1(arg_281_0, arg_281_1)
	local var_281_0 = arg_281_0:GetAbsOrigin()
	local var_281_1 = arg_281_0:GetAbsVelocity()
	local var_281_2 = arg_281_0.m_fFlags and arg_281_0.m_fFlags:Get() or 0

	if slot_0_7_0.band(var_281_2, 1) ~= 0 then
		return var_281_0 + var_281_1 * (arg_281_1 * slot_0_124_1)
	end

	local var_281_3 = game.cvar:Find("sv_gravity")
	local var_281_4 = var_281_3 and var_281_3.value or 800
	local var_281_5 = slot_0_124_1
	local var_281_6 = Vector(var_281_0.x, var_281_0.y, var_281_0.z)
	local var_281_7 = Vector(var_281_1.x, var_281_1.y, var_281_1.z)

	for iter_281_0 = 1, arg_281_1 do
		var_281_6.x = var_281_6.x + var_281_7.x * var_281_5
		var_281_6.y = var_281_6.y + var_281_7.y * var_281_5
		var_281_6.z = var_281_6.z + var_281_7.z * var_281_5
		var_281_7.z = var_281_7.z - var_281_4 * var_281_5
	end

	return var_281_6
end

function slot_0_145_1(arg_282_0, arg_282_1, arg_282_2, arg_282_3, arg_282_4, arg_282_5, arg_282_6, arg_282_7)
	slot_282_8_0 = 0
	slot_282_9_0 = false
	slot_282_10_0 = entities.GetLocalPawn()
	slot_282_11_0 = false
	slot_282_12_0 = arg_282_0.m_iHealth and arg_282_0.m_iHealth:Get()

	if not tonumber(tostring(slot_282_12_0)) then
		slot_282_13_0 = 100
	end

	if not tonumber(tostring(arg_282_7)) then
		slot_282_14_0 = 0
	end

	slot_282_15_0 = arg_282_0.m_iHealth and arg_282_0.m_iHealth:Get()
	slot_282_16_0 = tonumber(tostring(slot_282_15_0)) or 100
	slot_282_17_0 = tonumber(tostring(arg_282_7)) or 0
	slot_282_18_0 = {
		reasons = {}
	}
	slot_282_19_0 = game.globalVars.m_flRealTime
	slot_282_20_0 = slot_282_10_0 and slot_282_10_0:GetActiveWeapon()
	slot_282_21_0 = tonumber(tostring(slot_282_20_0 and slot_282_20_0.m_flNextPrimaryAttack and slot_282_20_0.m_flNextPrimaryAttack:Get())) or 0
	slot_282_22_0 = math.max(slot_282_19_0, slot_282_21_0) + arg_282_6
	slot_282_23_0 = arg_282_0:GetActiveWeapon()
	slot_282_24_0 = slot_282_16_0 <= slot_282_17_0
	slot_282_25_0 = arg_282_0:GetAbsVelocity()
	slot_282_26_0 = slot_282_25_0:Length2d()
	slot_282_27_0 = slot_282_25_0.z
	slot_282_28_0 = arg_282_0.m_fFlags and arg_282_0.m_fFlags:Get() or 0
	slot_282_29_0 = slot_0_7_0.band(slot_282_28_0, 1) ~= 0
	slot_282_30_0 = slot_0_7_0.band(slot_282_28_0, 2) ~= 0
	slot_282_31_0 = math.floor(arg_282_6 / slot_0_124_1)
	slot_282_32_0 = slot_0_144_1(arg_282_0, math.min(64, slot_282_31_0))
	slot_282_33_0 = slot_0_127_1[arg_282_0] or {}
	slot_282_34_0 = slot_282_33_0[#slot_282_33_0]
	slot_282_35_0 = slot_282_34_0 and slot_282_34_0.origin or slot_282_32_0 - slot_282_25_0 * 0.2
	slot_282_18_0.speed = string.format("%d", slot_282_26_0)
	slot_282_18_0.futurePos = slot_282_32_0
	slot_282_18_0.backtrackPos = slot_282_35_0
	slot_282_18_0.bonus = slot_282_8_0

	if slot_282_23_0 then
		slot_282_36_1 = slot_282_23_0:GetType()
		slot_282_37_1 = slot_282_23_0.m_bInReload and slot_282_23_0.m_bInReload:Get()
		slot_282_38_1 = slot_282_23_0.m_flNextPrimaryAttack and slot_282_23_0.m_flNextPrimaryAttack:Get()
		slot_282_39_1 = tonumber(tostring(slot_282_38_1)) or 0
		slot_282_40_1 = false
		slot_282_41_1 = slot_0_127_1[arg_282_0] or {}

		if #slot_282_41_1 >= 4 then
			slot_282_42_2 = 0

			for iter_282_0 = #slot_282_41_1, #slot_282_41_1 - 2, -1 do
				slot_282_47_3 = slot_282_41_1[iter_282_0]
				slot_282_48_1 = slot_282_41_1[iter_282_0 - 1]

				if slot_282_47_3 and slot_282_48_1 then
					slot_282_49_1 = slot_282_47_3.velocity:Normalized()
					slot_282_50_1 = slot_282_48_1.velocity:Normalized()

					if slot_282_49_1:Dot(slot_282_50_1) < -0.5 then
						slot_282_42_2 = slot_282_42_2 + 1
					end
				end
			end

			if slot_282_42_2 >= 2 then
				slot_282_40_1 = true
				slot_282_8_0 = slot_282_8_0 - 200

				table.insert(slot_282_18_0.reasons, "DANGER: Enemy Jiggling (Shoulder Baiting/Baiting) (-200)")
			end
		end

		slot_282_42_1 = slot_282_39_1 > slot_282_22_0 + 0.1

		if slot_282_24_0 then
			slot_282_43_1 = slot_282_10_0 and slot_282_10_0.m_iHealth:Get() or 100
			slot_282_44_1 = slot_0_7_0.band(arg_282_0.m_fFlags:Get() or 0, 1) ~= 0
			slot_282_46_1 = arg_282_0:GetAbsVelocity():Length2d()
			slot_282_47_2 = slot_282_44_1 and not slot_282_40_1 and slot_282_46_1 < 250 and slot_282_39_1 <= slot_282_19_0 + 0.05

			if slot_282_42_1 or not slot_282_44_1 then
				slot_282_8_0 = slot_282_8_0 + 600
				slot_282_11_0 = true

				table.insert(slot_282_18_0.reasons, string.format("LETHAL: Initiative Advantage (+600)"))
			elseif slot_282_43_1 < 40 and slot_282_47_2 and slot_282_36_1 ~= 0 then
				slot_282_9_0 = true

				table.insert(slot_282_18_0.reasons, "BLOCKED: Unsafe Lethal Trade (Enemy ready & Low HP)")

				return slot_282_8_0, slot_282_9_0, slot_282_11_0, slot_282_18_0
			else
				slot_282_8_0 = slot_282_8_0 + 300

				table.insert(slot_282_18_0.reasons, "LETHAL: Risky Trade Opportunity (+300)")
			end
		end

		if slot_282_36_1 == 0 or slot_282_36_1 == 7 or slot_282_36_1 == 8 or slot_282_36_1 == 9 then
			slot_282_8_0 = slot_282_8_0 + 500

			table.insert(slot_282_18_0.reasons, "Vulnerable: Target holding non-lethal equipment (+500)")
		elseif slot_282_37_1 or slot_282_23_0.m_iClip1 and slot_282_23_0.m_iClip1:Get() == 0 then
			slot_282_8_0 = slot_282_8_0 + 300

			table.insert(slot_282_18_0.reasons, "Vulnerable: Target is Reloading (+300)")
		elseif slot_282_19_0 < slot_282_39_1 then
			slot_282_8_0 = slot_282_8_0 + 150

			table.insert(slot_282_18_0.reasons, string.format("Vulnerable: Post-firing window (+150)"))
		end
	end

	slot_282_36_0 = arg_282_0:GetAbsVelocity()
	slot_282_37_0 = slot_282_36_0:Length2d()
	slot_282_38_0 = slot_282_36_0.z
	slot_282_39_0 = arg_282_0.m_fFlags and arg_282_0.m_fFlags:Get() or 0
	slot_282_40_0 = slot_0_7_0.band(slot_282_39_0, 1) ~= 0
	slot_282_41_0 = slot_0_7_0.band(slot_282_39_0, 2) ~= 0
	slot_282_42_0 = false
	slot_282_43_0 = arg_282_0:GetAbsOrigin()
	slot_282_44_0 = (slot_282_43_0 - arg_282_5):Length()
	slot_282_45_0 = slot_282_43_0.z - arg_282_5.z
	slot_282_46_0 = slot_282_10_0 and slot_282_10_0.m_iHealth and slot_282_10_0.m_iHealth:Get() or 100

	if slot_282_46_0 < 20 then
		slot_282_42_0 = true
		slot_282_8_0 = slot_282_8_0 + 10

		table.insert(slot_282_18_0.reasons, string.format("Safety: Critical HP (%d) -> Forced E-Peek (+10)", slot_282_46_0))
	end

	if slot_282_46_0 < 70 then
		slot_282_47_1 = (100 - slot_282_46_0) / 1.5
		slot_282_8_0 = slot_282_8_0 - math.max(0, slot_282_47_1 - 10)

		table.insert(slot_282_18_0.reasons, string.format("Safety: HP Buffer Active (-%d)", math.floor(slot_282_47_1)))

		if slot_282_46_0 < 30 and slot_282_8_0 < 80 then
			slot_282_9_0 = true

			table.insert(slot_282_18_0.reasons, string.format("BLOCKED: Critical HP Risk (HP: %d, Safety: %d < 80)", slot_282_46_0, slot_282_8_0))

			return slot_282_8_0, slot_282_9_0, slot_282_42_0, slot_282_18_0
		end
	end

	slot_282_47_0 = math.floor(arg_282_6 / slot_0_124_1)
	slot_282_48_0 = slot_0_144_1(arg_282_0, math.min(64, slot_282_47_0))
	slot_282_49_0 = arg_282_0.get_index and arg_282_0:GetIndex() or tostring(arg_282_0)
	slot_282_50_0 = slot_282_49_0 and slot_0_127_1[slot_282_49_0] or {}
	slot_282_51_0 = slot_282_50_0[#slot_282_50_0]
	slot_282_52_0 = slot_282_51_0 and slot_282_51_0.origin or slot_282_48_0 - slot_282_36_0 * 0.2
	slot_282_53_0 = {
		[0] = nil,
		speed = string.format("%d", slot_282_37_0),
		crouched = slot_282_41_0,
		heightDiff = string.format("%d", slot_282_45_0),
		futurePos = slot_282_48_0,
		backtrackPos = slot_282_52_0
	}

	for iter_282_1, iter_282_2 in pairs(slot_282_53_0) do
		slot_282_18_0[iter_282_1] = iter_282_2
	end

	slot_282_54_0 = game.physics_query_interface:TraceMovement(arg_282_4, arg_282_1, slot_282_48_0 + Vector(0, 0, 45))

	slot_0_130_1("Normal")

	if slot_282_54_0.m_flFraction < 0.95 and slot_282_37_0 > 50 then
		slot_0_130_1("Normal")

		if game.physics_query_interface:TraceMovement(arg_282_4, arg_282_1, slot_282_52_0 + Vector(0, 0, 45)).m_flFraction > 0.95 then
			slot_282_8_0 = slot_282_8_0 + 20

			table.insert(slot_282_18_0.reasons, "Target retreating, but 200ms backtrack ghost remains exposed (+20)")
		else
			slot_282_8_0 = slot_282_8_0 - 60

			table.insert(slot_282_18_0.reasons, "Target retreating, and 200ms backtrack fully hidden (-60)")
		end
	elseif slot_282_37_0 > 50 then
		slot_282_8_0 = slot_282_8_0 + 30

		table.insert(slot_282_18_0.reasons, "Target moving actively into open space (+30)")
	end

	if not slot_282_40_0 then
		slot_282_55_1 = math.abs(slot_282_38_0) < 25
		slot_282_56_0 = slot_282_38_0 < -40

		if slot_282_55_1 then
			slot_282_57_0 = arg_282_0:GetActiveWeapon()

			if slot_282_57_0 and slot_282_57_0.m_iItemDefinitionIndex and slot_282_57_0:m_iItemDefinitionIndex():Get() == 40 and slot_282_16_0 > (arg_282_7 or 0) then
				slot_282_9_0 = true

				table.insert(slot_282_18_0.reasons, "DANGER: Enemy at jump apex with Scout -> Peeking blocked!")

				return slot_282_8_0, slot_282_9_0, slot_282_42_0, slot_282_18_0
			else
				slot_282_8_0 = slot_282_8_0 + 400

				table.insert(slot_282_18_0.reasons, "Target at Jump Apex (Non-Scout) (+400)")
			end
		elseif slot_282_56_0 then
			slot_282_8_0 = slot_282_8_0 + 1500

			table.insert(slot_282_18_0.reasons, "Vulnerable: Target is Falling (Major Advantage) (+1500)")
		else
			slot_282_8_0 = slot_282_8_0 + 1000

			table.insert(slot_282_18_0.reasons, "Vulnerable: Target Rising/Moving in Air (+1000)")
		end
	end

	if slot_282_51_0 then
		slot_282_55_0 = {
			slot_282_51_0.hitboxes[slot_0_5_0.HEAD],
			slot_282_51_0.hitboxes[slot_0_5_0.CHEST],
			slot_282_51_0.hitboxes[slot_0_5_0.PELVIS]
		}

		for iter_282_3, iter_282_4 in ipairs(slot_282_55_0) do
			if iter_282_4 and iter_282_4.center then
				slot_0_130_1("Normal")

				if game.physics_query_interface:TraceMovement(arg_282_4, arg_282_1, iter_282_4.center).m_flFraction > 0.95 then
					slot_0_130_1("Firebullet")

					slot_282_62_0, slot_282_63_0 = mods.penetration.FireBullet(arg_282_1, iter_282_4.center - arg_282_1, arg_282_2, arg_282_0)

					if slot_282_63_0 and arg_282_3 <= slot_282_63_0.damage then
						slot_282_8_0 = slot_282_8_0 + 150

						table.insert(slot_282_18_0.reasons, "Enemy was also exposed 200ms ago (Stationary/Predictable) (+150)")

						break
					end
				end
			end
		end
	end

	if slot_282_40_0 then
		if slot_282_37_0 < 5 then
			slot_282_8_0 = slot_282_8_0 + 80

			table.insert(slot_282_18_0.reasons, "Enemy is standing completely still (+80)")
		elseif slot_282_37_0 < 55 then
			slot_282_8_0 = slot_282_8_0 + 60
			slot_282_42_0 = true

			table.insert(slot_282_18_0.reasons, "Enemy is slow-walking -> E-PEEK ENGAGED (+60)")
		elseif slot_282_37_0 < 130 then
			slot_282_8_0 = slot_282_8_0 + 50

			table.insert(slot_282_18_0.reasons, "Enemy is moving moderately (+50)")
		elseif slot_282_37_0 < 180 then
			slot_282_8_0 = slot_282_8_0 + 40

			table.insert(slot_282_18_0.reasons, "Enemy is running (+40)")
		else
			slot_282_8_0 = slot_282_8_0 + 120

			table.insert(slot_282_18_0.reasons, "Vulnerable: Enemy Running (High Spread/Inaccurate) (+120)")
		end
	end

	if slot_282_41_0 then
		slot_282_8_0 = slot_282_8_0 + 35

		table.insert(slot_282_18_0.reasons, "Enemy is crouched (easier target) (+35)")

		if math.abs(slot_282_45_0) < 40 and slot_282_44_0 < 800 then
			slot_282_8_0 = slot_282_8_0 + 100
			slot_282_42_0 = true

			table.insert(slot_282_18_0.reasons, "Enemy crouched on same elevation plane -> LEVEL CROUCH E-PEEK (+100)")
		end
	end

	if slot_282_45_0 > 50 then
		slot_282_8_0 = slot_282_8_0 + 20

		table.insert(slot_282_18_0.reasons, "Enemy has high ground, but MinDmg shot exists -> Encourage counter-peek (+20)")
	elseif slot_282_45_0 < -50 then
		table.insert(slot_282_18_0.reasons, "We have high ground advantage over target")
	end

	if slot_282_8_0 <= -50 then
		slot_282_9_0 = true

		table.insert(slot_282_18_0.reasons, "BLOCKED: Highly Suicidal Safety Score (" .. tostring(slot_282_8_0) .. " <= -50)")
	end

	slot_282_18_0.bonus = slot_282_8_0

	return slot_282_8_0, slot_282_9_0, slot_282_42_0, slot_282_18_0
end

function slot_0_146_1(arg_283_0, arg_283_1, arg_283_2, arg_283_3, arg_283_4, arg_283_5, arg_283_6, arg_283_7, arg_283_8)
	local var_283_0 = Vector(arg_283_0.x, arg_283_0.y, arg_283_0.z)
	local var_283_1 = Vector(arg_283_1.x, arg_283_1.y, arg_283_1.z)
	local var_283_2 = 0.015625
	local var_283_3 = game.cvar:Find("sv_gravity")
	local var_283_4 = (var_283_3 and var_283_3.value or 800) * var_283_2
	local var_283_5 = arg_283_5 or 640
	local var_283_6 = arg_283_4 or 30
	local var_283_7 = arg_283_7 or 0
	local var_283_8 = math.floor((arg_283_6 or arg_283_3) + 0.5)
	local var_283_9 = arg_283_8 or 15
	local var_283_10 = slot_0_128_1.Calibration.EMA_JumpImpulse or 286.4
	local var_283_11 = Vector(arg_283_2.x, arg_283_2.y, 0):Normalized()
	local var_283_12 = var_283_1 + var_283_11 * var_283_9

	var_283_12.z = var_283_10

	if math.abs(var_283_7) > 0.01 then
		local var_283_13 = math.rad(var_283_7)
		local var_283_14 = math.cos(var_283_13)
		local var_283_15 = math.sin(var_283_13)

		var_283_11 = Vector(var_283_11.x * var_283_14 - var_283_11.y * var_283_15, var_283_11.x * var_283_15 + var_283_11.y * var_283_14, 0)
	end

	arg_283_2 = var_283_11

	local var_283_16 = {}

	for iter_283_0 = 1, math.min(arg_283_3, var_283_8) do
		local var_283_17 = var_283_5 - var_283_12:Dot(arg_283_2)

		if var_283_17 > 0 then
			local var_283_18 = math.min(var_283_17, var_283_6)

			if iter_283_0 == 1 then
				var_283_18 = var_283_18 * 0.4
			elseif iter_283_0 == 2 then
				var_283_18 = var_283_18 * 0.1
			end

			var_283_12 = var_283_12 + arg_283_2 * var_283_18
		end

		table.insert(var_283_16, var_283_12:Length2d())

		var_283_12.z = var_283_12.z - var_283_4
		var_283_0 = var_283_0 + var_283_12 * var_283_2
	end

	return var_283_0, var_283_12, var_283_16
end

function slot_0_147_1(arg_284_0, arg_284_1, arg_284_2)
	slot_284_3_0 = arg_284_0:GetAbsOrigin()
	slot_284_4_0 = arg_284_0:GetEyePos()
	slot_284_5_0 = slot_284_4_0 - slot_284_3_0

	slot_0_129_1()

	slot_284_6_0 = slot_0_132_1(arg_284_0, arg_284_1)
	slot_284_7_0 = (UI.cfg.ai_peek_multipoint or 80) / 100
	slot_284_8_0 = arg_284_1:GetDefIndex() == 40
	slot_284_10_0 = arg_284_0:GetAbsVelocity():Length2d()
	slot_284_11_0 = game.cvar:Find("sv_airaccelerate")
	slot_284_12_0 = game.cvar:Find("sv_gravity")
	slot_284_13_0 = slot_284_11_0 and slot_284_11_0.value or 12
	slot_284_14_0 = slot_284_13_0 >= 12 and slot_284_13_0 <= 25
	slot_284_15_0 = false
	slot_284_16_0 = slot_284_12_0 and slot_284_12_0.value or 800
	slot_284_17_0 = slot_0_128_1.Calibration.EMA_JumpImpulse or 286.4
	slot_284_18_0 = math.ceil(slot_284_17_0 / (slot_284_16_0 * slot_0_124_1))
	slot_284_19_0 = slot_284_18_0 * slot_0_124_1
	slot_284_20_0 = slot_284_8_0 and math.max(slot_284_10_0, 210) or slot_284_10_0
	slot_284_21_0 = nil
	slot_284_22_1 = nil
	slot_284_23_0 = false
	slot_284_24_0 = 1
	slot_284_25_0 = nil
	slot_284_26_0 = -1
	slot_284_27_0 = {
		noPoints = false,
		noEnemies = false,
		geoBlocked = 0,
		maxDmg = 0,
		[0] = nil,
		safetyBlocked = {},
		jsBlocked = {
			multi = 0,
			ceil = 0,
			rise = 0,
			horiz = 0,
			["%s+"] = nil
		}
	}
	slot_284_28_0 = slot_0_131_1()
	slot_284_29_0 = slot_0_133_1(arg_284_1)
	slot_284_30_0 = {
		[0] = "Damage",
		"Crosshair",
		"Hit Chance",
		[0] = nil
	}
	slot_284_31_0 = slot_0_134_1(arg_284_0, slot_284_28_0, slot_284_29_0, 3, arg_284_2)
	slot_284_22_0 = #slot_284_31_0 > 0 and slot_284_31_0[1] or nil
	slot_0_128_1.TargetingDebug = {
		[0] = nil,
		mode = slot_284_29_0,
		modeName = slot_284_30_0[slot_284_29_0] or "Unknown",
		totalEnemies = #slot_284_28_0,
		filteredEnemies = #slot_284_31_0
	}
	slot_284_32_0 = 0
	slot_284_33_0 = math.min(#slot_284_28_0, 3)
	slot_284_34_0 = #slot_284_31_0

	for iter_284_0 = 1, slot_284_33_0 do
		slot_284_39_1 = slot_284_28_0[iter_284_0]
		slot_284_40_1 = false
		slot_284_41_1 = {
			slot_0_5_0.HEAD,
			slot_0_5_0.CHEST,
			slot_0_5_0.PELVIS
		}

		for iter_284_1, iter_284_2 in ipairs(slot_284_41_1) do
			if not slot_284_39_1.GetHitboxCenter then
				break
			end

			slot_284_47_3 = slot_284_39_1:GetHitboxCenter(iter_284_2)

			if slot_284_47_3 then
				slot_284_48_2 = {
					slot_284_47_3
				}

				if slot_284_7_0 > 0 then
					slot_284_49_3 = slot_284_39_1.GetHitbox and slot_284_39_1:GetHitbox(iter_284_2)

					if slot_284_49_3 and slot_284_49_3.GetMinBounds then
						slot_284_50_3 = slot_284_49_3:GetMinBounds()
						slot_284_51_1 = slot_284_49_3:GetMaxBounds()

						table.insert(slot_284_48_2, slot_284_47_3 + Vector(slot_284_50_3.x, slot_284_50_3.y, slot_284_50_3.z) * slot_284_7_0)
						table.insert(slot_284_48_2, slot_284_47_3 + Vector(slot_284_51_1.x, slot_284_51_1.y, slot_284_51_1.z) * slot_284_7_0)
					else
						slot_284_50_2 = slot_284_7_0 * 4

						table.insert(slot_284_48_2, slot_284_47_3 + Vector(slot_284_50_2, 0, 0))
						table.insert(slot_284_48_2, slot_284_47_3 + Vector(-slot_284_50_2, 0, 0))
						table.insert(slot_284_48_2, slot_284_47_3 + Vector(0, slot_284_50_2, 0))
						table.insert(slot_284_48_2, slot_284_47_3 + Vector(0, -slot_284_50_2, 0))

						if iter_284_2 == slot_0_5_0.HEAD then
							table.insert(slot_284_48_2, slot_284_47_3 + Vector(0, 0, slot_284_50_2))
							table.insert(slot_284_48_2, slot_284_47_3 + Vector(0, 0, -slot_284_50_2))
						end
					end
				end

				for iter_284_3, iter_284_4 in ipairs(slot_284_48_2) do
					slot_0_130_1("Firebullet")

					slot_284_54_2, slot_284_55_2 = mods.penetration.FireBullet(slot_284_4_0, iter_284_4 - slot_284_4_0, arg_284_1, slot_284_39_1)

					if slot_284_55_2 and slot_284_55_2.damage > 0 then
						slot_284_40_1 = true

						break
					end
				end
			end

			if slot_284_40_1 then
				break
			end
		end

		if slot_284_40_1 then
			slot_284_32_0 = slot_284_32_0 + 1
		end
	end

	slot_0_128_1.VisibleEnemies = slot_284_32_0
	slot_284_35_0 = arg_284_0.m_fFlags:Get() or 0
	slot_284_36_0 = slot_0_7_0.band(slot_284_35_0, 1) ~= 0
	slot_284_37_0 = slot_284_8_0 and is_enabled("ai_peek_jumpscout") and not slot_284_14_0

	if (not slot_284_36_0 or slot_0_128_1.Calibration.IsJumping) and slot_0_128_1.State == "PEEKING" and slot_0_128_1.PeekMode == 2 and not slot_284_14_0 then
		slot_284_37_0 = true
	end

	slot_284_38_0 = slot_284_32_0 > 0 and 20 or 40
	slot_284_39_0 = 250
	slot_284_40_0 = ray_t()
	slot_284_41_0 = {}

	if slot_0_128_1.State == "PEEKING" and slot_0_128_1.PeekPos then
		table.insert(slot_284_41_0, slot_0_128_1.PeekPos)
	end

	slot_284_42_0 = {}

	for iter_284_5, iter_284_6 in ipairs(slot_284_31_0) do
		slot_284_49_2 = iter_284_6:GetAbsOrigin() - slot_284_3_0
		slot_284_50_1 = math.deg(math.atan2(slot_284_49_2.y, slot_284_49_2.x))

		for iter_284_7 = -45, 45, slot_284_38_0 do
			slot_284_55_1 = (slot_284_50_1 + iter_284_7) % 360
			slot_284_42_0[math.floor(slot_284_55_1 / slot_284_38_0)] = slot_284_55_1
		end
	end

	for iter_284_8, iter_284_9 in pairs(slot_284_42_0) do
		slot_284_48_1 = math.rad(iter_284_9)
		slot_284_49_1 = Vector(math.cos(slot_284_48_1), math.sin(slot_284_48_1), 0)

		for iter_284_10 = 40, slot_284_39_0, 40 do
			table.insert(slot_284_41_0, slot_284_3_0 + slot_284_49_1 * iter_284_10)
		end
	end

	for iter_284_11, iter_284_12 in ipairs(slot_284_41_0) do
		slot_284_48_0 = (iter_284_12 - slot_284_3_0):Normalized()
		slot_284_49_0 = (iter_284_12 - slot_284_3_0):Length()

		if slot_284_49_0 < 5 then
			slot_284_48_0 = Vector(1, 0, 0)
		end

		slot_284_50_0 = slot_284_48_0 * slot_284_20_0
		slot_284_50_0.z = 286.4
		slot_284_51_0, slot_284_52_0 = slot_0_146_1(slot_284_3_0, slot_284_50_0, slot_284_48_0, slot_284_18_0, slot_0_128_1.Calibration.EMA_Accel, slot_0_128_1.Calibration.EMA_WishSpeed, slot_0_128_1.Calibration.EMA_AirTicks, slot_0_128_1.Calibration.EMA_Drift, slot_0_128_1.Calibration.EMA_InitialBoost)
		slot_284_53_0 = (slot_284_51_0 - slot_284_3_0):Length()

		slot_0_130_1("Movement")

		slot_284_54_0 = game.physics_query_interface:TraceMovement(slot_284_40_0, iter_284_12 + Vector(0, 0, 64), iter_284_12 - Vector(0, 0, 64))

		if slot_284_54_0.m_flFraction > 0.9 or slot_284_54_0.m_flFraction < 0.05 then
			-- block empty
		else
			slot_284_55_0 = slot_284_54_0.m_vEndPos
			slot_284_56_0 = slot_284_55_0.z - slot_284_3_0.z

			if math.abs(slot_284_56_0) > 72 then
				-- block empty
			else
				slot_0_130_1("Movement")

				if game.physics_query_interface:TraceMovement(slot_284_40_0, slot_284_3_0 + Vector(0, 0, 36), slot_284_55_0 + Vector(0, 0, 36)).m_flFraction < 0.95 then
					slot_284_27_0.geoBlocked = slot_284_27_0.geoBlocked + 1
				else
					slot_284_58_0 = true
					slot_284_59_0 = {
						Vector(12, 0, 0),
						Vector(-12, 0, 0),
						Vector(0, 12, 0),
						Vector(0, -12, 0)
					}

					for iter_284_13, iter_284_14 in ipairs(slot_284_59_0) do
						slot_0_130_1("Movement")

						if game.physics_query_interface:TraceMovement(slot_284_40_0, slot_284_55_0 + Vector(0, 0, 36), slot_284_55_0 + iter_284_14 + Vector(0, 0, 36)).m_flFraction < 0.95 then
							slot_284_58_0 = false

							break
						end
					end

					if not slot_284_58_0 then
						slot_284_27_0.geoBlocked = slot_284_27_0.geoBlocked + 1
					else
						for iter_284_15 = slot_284_15_0 and 2 or 1, slot_284_37_0 and 2 or 1 do
							slot_284_64_0 = iter_284_15 == 2
							slot_284_65_0 = slot_284_55_0 + slot_284_5_0
							slot_284_66_0 = 0

							if slot_284_64_0 then
								slot_284_66_0 = math.min(slot_284_49_0, slot_284_53_0)
								slot_284_67_1 = slot_284_3_0 + slot_284_48_0 * slot_284_66_0
								slot_284_65_0 = slot_284_67_1 + Vector(0, 0, 42.96) + slot_284_5_0

								slot_0_130_1("Movement")

								slot_284_68_1 = game.physics_query_interface:TraceMovement(slot_284_40_0, slot_284_3_0, slot_284_3_0 + Vector(0, 0, 72))

								slot_0_130_1("Movement")

								slot_284_69_1 = game.physics_query_interface:TraceMovement(slot_284_40_0, slot_284_65_0 - slot_284_5_0, slot_284_65_0 - slot_284_5_0 + Vector(0, 0, 20))

								if slot_284_68_1.m_flFraction < 1 or slot_284_69_1.m_flFraction < 1 then
									slot_284_64_0 = false
									slot_284_27_0.jsBlocked.ceil = slot_284_27_0.jsBlocked.ceil + 1

									goto label_284_0
								end

								slot_0_130_1("Movement")

								if game.physics_query_interface:TraceMovement(slot_284_40_0, slot_284_3_0 + Vector(0, 0, 36), slot_284_67_1 + Vector(0, 0, 36)).m_flFraction < 0.9 then
									slot_284_64_0 = false
									slot_284_27_0.jsBlocked.horiz = slot_284_27_0.jsBlocked.horiz + 1

									goto label_284_0
								end
							end

							slot_284_67_0 = 0
							slot_284_68_0 = 0
							slot_284_69_0 = 0
							slot_284_70_0 = {}
							slot_284_71_0 = -1
							slot_284_72_0 = nil
							slot_284_73_0 = 1
							slot_284_74_0 = nil

							for iter_284_16 = 1, slot_284_34_0 do
								slot_284_79_0 = slot_284_31_0[iter_284_16]
								slot_284_80_0 = slot_284_79_0.get_index and slot_284_79_0:GetIndex() or tostring(slot_284_79_0)
								slot_284_82_0 = (slot_0_127_1[slot_284_80_0] or {})[1] or {
									[0] = nil,
									hitboxes = {},
									origin = slot_284_79_0:GetAbsOrigin()
								}

								if (slot_284_82_0.origin - slot_284_55_0):LengthSqr() > 6250000 then
									-- block empty
								else
									slot_284_83_0 = slot_284_79_0.m_iHealth and slot_284_79_0.m_iHealth:Get() or 100
									slot_284_84_0 = {
										slot_0_5_0.HEAD,
										slot_0_5_0.CHEST,
										slot_0_5_0.PELVIS,
										slot_0_5_0.THORAX
									}

									if slot_284_83_0 < 70 or not slot_284_8_0 then
										table.insert(slot_284_84_0, slot_0_5_0.LEFT_UPPER_LEG)
										table.insert(slot_284_84_0, slot_0_5_0.RIGHT_UPPER_LEG)
									end

									slot_284_85_0 = 0
									slot_284_86_1 = nil
									slot_284_87_1 = false
									slot_284_88_0 = 0

									if not slot_284_79_0.GetHitboxCenter then
										-- block empty
									else
										for iter_284_17, iter_284_18 in ipairs(slot_284_84_0) do
											slot_284_94_3 = slot_284_79_0.GetHitbox and slot_284_79_0:GetHitbox(iter_284_18)
											slot_284_95_4 = slot_284_79_0:GetHitboxCenter(iter_284_18)

											if slot_284_95_4 then
												slot_284_96_2 = {
													slot_284_95_4
												}

												if iter_284_18 == slot_0_5_0.HEAD then
													slot_284_97_6 = 3

													table.insert(slot_284_96_2, slot_284_95_4 + Vector(0, 0, slot_284_97_6))
													table.insert(slot_284_96_2, slot_284_95_4 + Vector(0, 0, -slot_284_97_6))
													table.insert(slot_284_96_2, slot_284_95_4 + Vector(slot_284_97_6, 0, 0))
													table.insert(slot_284_96_2, slot_284_95_4 + Vector(-slot_284_97_6, 0, 0))
													table.insert(slot_284_96_2, slot_284_95_4 + Vector(slot_284_97_6, slot_284_97_6, slot_284_97_6))
													table.insert(slot_284_96_2, slot_284_95_4 + Vector(-slot_284_97_6, -slot_284_97_6, slot_284_97_6))
												elseif slot_284_7_0 > 0 then
													if slot_284_94_3 and slot_284_94_3.GetMinBounds then
														slot_284_97_5 = slot_284_94_3:GetMinBounds()
														slot_284_98_2 = slot_284_94_3:GetMaxBounds()

														table.insert(slot_284_96_2, slot_284_95_4 + Vector(slot_284_97_5.x, slot_284_97_5.y, slot_284_97_5.z) * slot_284_7_0)
														table.insert(slot_284_96_2, slot_284_95_4 + Vector(slot_284_98_2.x, slot_284_98_2.y, slot_284_98_2.z) * slot_284_7_0)
													else
														slot_284_97_4 = slot_284_7_0 * 4

														table.insert(slot_284_96_2, slot_284_95_4 + Vector(slot_284_97_4, 0, 0))
														table.insert(slot_284_96_2, slot_284_95_4 + Vector(-slot_284_97_4, 0, 0))
														table.insert(slot_284_96_2, slot_284_95_4 + Vector(0, slot_284_97_4, 0))
														table.insert(slot_284_96_2, slot_284_95_4 + Vector(0, -slot_284_97_4, 0))
													end
												end

												slot_284_97_3 = false
												slot_284_98_1 = false

												for iter_284_19, iter_284_20 in ipairs(slot_284_96_2) do
													slot_284_104_2 = slot_284_65_0 + slot_284_48_0 * 6

													slot_0_130_1("Normal")

													if game.physics_query_interface:TraceMovement(slot_284_40_0, slot_284_104_2, iter_284_20).m_flFraction > 0.95 then
														slot_284_87_0 = true
														slot_284_98_1 = true
													end

													slot_0_130_1("Firebullet")

													slot_284_106_1, slot_284_107_0 = mods.penetration.FireBullet(slot_284_65_0, iter_284_20 - slot_284_65_0, arg_284_1, slot_284_79_0)

													if slot_284_107_0 and slot_284_6_0 <= slot_284_107_0.damage then
														if slot_284_85_0 < slot_284_107_0.damage then
															slot_284_85_0 = slot_284_107_0.damage
															slot_284_86_0 = iter_284_20
														end

														if slot_284_6_0 <= slot_284_107_0.damage then
															slot_284_97_3 = true
															slot_284_98_1 = true

															break
														end
													end
												end

												if slot_284_98_1 then
													slot_284_88_0 = slot_284_88_0 + 1
												end

												if slot_284_97_3 then
													break
												end
											end

											if slot_284_85_0 >= 100 then
												break
											end
										end

										slot_284_89_0 = arg_284_0:GetAbsVelocity():Length2d() > 50 and slot_284_49_0 / arg_284_0:GetAbsVelocity():Length2d() or slot_284_49_0 / 250

										if slot_284_64_0 then
											slot_284_90_1 = slot_284_79_0:GetAbsVelocity()

											if slot_284_90_1:Length2d() > 50 and (slot_284_3_0 - slot_284_82_0.origin):Normalized():Dot(slot_284_90_1:Normalized()) < 0.3 then
												slot_284_94_2 = slot_284_82_0.origin + slot_284_90_1 * slot_284_19_0

												slot_0_130_1("Normal")

												if game.physics_query_interface:TraceMovement(slot_284_40_0, slot_284_65_0, slot_284_94_2 + Vector(0, 0, 45)).m_flFraction < 0.95 then
													slot_284_64_0 = false

													goto label_284_0
												end
											end

											for iter_284_21, iter_284_22 in ipairs(slot_0_142_1) do
												slot_284_97_2 = slot_284_79_0:GetHitboxCenter(iter_284_22)

												if slot_284_97_2 then
													slot_284_99_1 = slot_284_97_2 + slot_284_79_0:GetAbsVelocity() * slot_284_89_0

													slot_0_130_1("Firebullet")

													slot_284_100_1, slot_284_101_1 = mods.penetration.FireBullet(slot_284_65_0, slot_284_97_2 - slot_284_65_0, arg_284_1, slot_284_79_0)

													slot_0_130_1("Firebullet")

													slot_284_102_2, slot_284_103_2 = mods.penetration.FireBullet(slot_284_65_0, slot_284_99_1 - slot_284_65_0, arg_284_1, slot_284_79_0)

													if slot_284_101_1 and slot_284_101_1.damage > 0 or slot_284_103_2 and slot_284_103_2.damage > 0 then
														slot_284_68_0 = slot_284_68_0 + 1

														break
													end
												end
											end

											slot_284_92_1 = slot_284_3_0 + slot_284_48_0 * (slot_284_66_0 * 0.5) + Vector(0, 0, 36) + slot_284_5_0
											slot_284_93_1 = slot_284_79_0:GetHitboxCenter(slot_0_5_0.HEAD)

											if slot_284_93_1 then
												slot_0_130_1("Firebullet")

												slot_284_94_1, slot_284_95_2 = mods.penetration.FireBullet(slot_284_92_1, slot_284_93_1 - slot_284_92_1, arg_284_1, slot_284_79_0)

												if slot_284_95_2 and slot_284_95_2.damage > 0 then
													slot_284_69_0 = slot_284_69_0 + 1
												end
											end
										end

										if slot_284_6_0 <= slot_284_85_0 then
											slot_284_67_0 = slot_284_67_0 + 1
											slot_284_90_0 = (slot_284_82_0.origin - slot_284_55_0):Length()
											slot_284_91_0, slot_284_92_0, slot_284_93_0, slot_284_94_0 = slot_0_145_1(slot_284_79_0, slot_284_65_0, arg_284_1, slot_284_6_0, slot_284_40_0, slot_284_3_0, slot_284_89_0, slot_284_85_0)

											if slot_284_92_0 then
												slot_284_95_1 = slot_284_94_0.reasons[#slot_284_94_0.reasons] or "Safety Evaluation Blocked"
												slot_284_27_0.safetyBlocked[slot_284_95_1] = true
											else
												slot_284_27_0.maxDmg = math.max(slot_284_27_0.maxDmg, slot_284_85_0)
												slot_284_95_0 = 0

												if slot_0_128_1.State == "PEEKING" and slot_0_128_1.PeekPos then
													if (slot_284_55_0 - slot_0_128_1.PeekPos):LengthSqr() < 1600 then
														slot_284_95_0 = slot_284_95_0 + 1500

														table.insert(slot_284_94_0.reasons, "SPOT HYSTERESIS: Keeping current position (+1500)")
													end

													if slot_0_128_1.PeekMode == iter_284_15 then
														slot_284_95_0 = slot_284_95_0 + 2500

														table.insert(slot_284_94_0.reasons, "MODE HYSTERESIS: Strong commitment to " .. (iter_284_15 == 2 and "Jumpscout" or "Normal") .. " (+2500)")
													end

													slot_284_97_1 = game.globalVars.m_flRealTime - (slot_0_128_1.LastModeChangeTime or 0)

													if slot_0_128_1.PeekMode ~= iter_284_15 and slot_284_97_1 < 0.8 then
														slot_284_95_0 = slot_284_95_0 - 10000

														table.insert(slot_284_94_0.reasons, "THROTTLED: Mode change prevented (cooldown: " .. string.format("%.1f", 0.8 - slot_284_97_1) .. "s)")
													end
												end

												slot_284_96_0 = slot_284_55_0.z - slot_284_3_0.z
												slot_284_97_0 = math.max(0, slot_284_96_0) * 1.5
												slot_284_98_0 = slot_0_133_1(arg_284_1)
												slot_284_99_0 = 0

												if slot_0_128_1.TargetPawn and tostring(slot_0_128_1.TargetPawn) == tostring(slot_284_79_0) then
													slot_284_99_0 = 4000

													table.insert(slot_284_94_0.reasons, "TARGET HYSTERESIS: Locked on current target (+4000)")
												end

												slot_284_100_0 = 0

												if slot_284_98_0 == 0 then
													slot_284_100_0 = slot_284_85_0 * 3
												elseif slot_284_98_0 == 1 then
													slot_284_102_1 = slot_284_79_0:GetAbsOrigin() - slot_284_3_0
													slot_284_103_1 = math.deg(math.atan2(slot_284_102_1.y, slot_284_102_1.x))
													slot_284_104_1 = ViewAngles and ViewAngles.y or 0
													slot_284_105_0 = math.abs(slot_284_103_1 - slot_284_104_1)

													if slot_284_105_0 > 180 then
														slot_284_105_0 = 360 - slot_284_105_0
													end

													slot_284_106_0 = 1 - slot_284_105_0 / 180
													slot_284_100_0 = slot_284_106_0 * 5000 + slot_284_85_0

													table.insert(slot_284_94_0.reasons, string.format("CROSSHAIR MODE: FOV Bias (%.0f%%) (+%.0f)", slot_284_106_0 * 100, slot_284_106_0 * 5000))
												elseif slot_284_98_0 == 2 then
													slot_284_100_0 = slot_284_88_0 * 800 + slot_284_85_0 * 1.5

													table.insert(slot_284_94_0.reasons, string.format("EXPOSURE MODE: %d Hitboxes Visible (+%.0f)", slot_284_88_0, slot_284_88_0 * 800))
												end

												slot_284_101_0 = slot_284_83_0 <= slot_284_85_0 and 1000 or 0
												slot_284_102_0 = (slot_284_67_0 - 1) * 800
												slot_284_103_0 = (slot_284_100_0 or 0) + (300 - slot_284_49_0) + slot_284_90_0 * 0.5 + (slot_284_64_0 and 100 or 0) + (slot_284_97_0 or 0) + (slot_284_91_0 or 0) + (slot_284_95_0 or 0) + (slot_284_99_0 or 0) + slot_284_101_0 - slot_284_102_0

												if slot_284_71_0 < slot_284_103_0 then
													slot_284_71_0 = slot_284_103_0
													slot_284_72_0 = slot_284_79_0
													slot_284_73_0 = iter_284_15
													slot_284_74_0 = slot_284_94_0
													slot_284_104_0 = {}

													for iter_284_23, iter_284_24 in ipairs(slot_284_94_0.reasons) do
														table.insert(slot_284_104_0, iter_284_24)
													end

													slot_284_74_0.reasons = slot_284_104_0
													slot_284_74_0.expectedDmg = slot_284_85_0
													slot_284_74_0.peekDist = slot_284_49_0
													slot_284_74_0.targetDist = slot_284_90_0

													if slot_284_64_0 then
														table.insert(slot_284_74_0.reasons, "Jumpscout Geometry/Air-Safety Validation Passed")
													else
														table.insert(slot_284_74_0.reasons, "Normal Ground Peek Selected")
													end

													if slot_284_85_0 >= 100 then
														table.insert(slot_284_74_0.reasons, "Lethal One-Shot Damage Found")
													elseif slot_284_85_0 >= 60 then
														table.insert(slot_284_74_0.reasons, "High Damage Found (>60)")
													else
														table.insert(slot_284_74_0.reasons, "MinDmg Threshold Met (" .. tostring(math.floor(slot_284_85_0)) .. ")")
													end

													slot_0_128_1.IsEPeek = slot_284_93_0
													slot_0_128_1.IsClearShot = slot_284_6_0 <= slot_284_85_0
												end
											end
										end
									end
								end
							end

							slot_284_75_0 = slot_0_128_1.State == "PEEKING" and 3 or 2

							if slot_284_64_0 and (slot_284_75_0 <= slot_284_68_0 or slot_284_69_0 >= 1) then
								-- block empty
							else
								if slot_284_26_0 < slot_284_71_0 then
									slot_284_26_0 = slot_284_71_0
									slot_284_21_0 = slot_284_55_0
									slot_284_22_0 = slot_284_72_0
									slot_284_24_0 = slot_284_73_0
									slot_284_25_0 = slot_284_74_0
									slot_0_128_1.VisibleEnemies = slot_284_67_0
									slot_0_128_1.DebugRays = slot_284_70_0
									slot_284_23_0 = slot_0_128_1.IsClearShot
								end

								if slot_284_71_0 > 2000 then
									return slot_284_21_0, slot_284_22_0, true, slot_284_24_0, slot_284_25_0
								end
							end

							::label_284_0::
						end
					end
				end
			end
		end
	end

	if not slot_284_21_0 then
		return nil, slot_284_22_0, false, nil, slot_284_27_0
	end

	return slot_284_21_0, slot_284_22_0, slot_284_23_0, slot_284_24_0, slot_284_25_0
end

function slot_0_148_1(arg_285_0, arg_285_1, arg_285_2, arg_285_3)
	local var_285_0 = arg_285_0:GetAbsOrigin()
	local var_285_1 = arg_285_0:GetEyePos() - var_285_0
	local var_285_2 = arg_285_0:GetAbsVelocity():Length2d()
	local var_285_3 = (arg_285_2 - var_285_0):Length()
	local var_285_4 = (arg_285_2 - var_285_0):Normalized()

	slot_0_130_1("Movement")

	if game.physics_query_interface:TraceMovement(ray_t(), var_285_0, var_285_0 + Vector(0, 0, 72)).m_flFraction < 1 then
		return false
	end

	local var_285_5 = game.cvar:Find("sv_airaccelerate").value
	local var_285_6 = game.cvar:Find("sv_gravity").value
	local var_285_7 = math.ceil(286.4 / (var_285_6 * slot_0_124_1))
	local var_285_8 = var_285_7 * slot_0_124_1
	local var_285_9 = 286.4 * var_285_8 - 0.5 * var_285_6 * var_285_8 * var_285_8
	local var_285_10 = var_285_4 * var_285_2

	var_285_10.z = 286.4

	local var_285_11, var_285_12 = slot_0_146_1(var_285_0, var_285_10, var_285_4, var_285_7, slot_0_128_1.Calibration.EMA_Accel, slot_0_128_1.Calibration.EMA_WishSpeed, slot_0_128_1.Calibration.EMA_AirTicks, slot_0_128_1.Calibration.EMA_Drift, slot_0_128_1.Calibration.EMA_InitialBoost)
	local var_285_13 = var_285_11
	local var_285_14 = var_285_13 + var_285_1

	slot_0_128_1.Calibration.PredictedApexPos = var_285_13
	slot_0_128_1.Calibration.JumpStartPos = var_285_0
	slot_0_128_1.Calibration.LastSpeed = var_285_2
	slot_0_128_1.Calibration.AA = var_285_5
	slot_0_128_1.Calibration.Grav = var_285_6
	slot_0_128_1.Calibration.TApex = var_285_8

	if not (slot_0_127_1[arg_285_3] or {})[1] then
		local var_285_15 = {
			[0] = nil,
			hitboxes = {},
			origin = arg_285_3:GetAbsOrigin()
		}
	end

	if arg_285_3:GetHitbox(slot_0_5_0.HEAD) then
		local var_285_16 = arg_285_3:GetHitboxCenter(slot_0_5_0.HEAD)

		slot_0_130_1("Firebullet")

		local var_285_17, var_285_18 = mods.penetration.FireBullet(var_285_14, var_285_16 - var_285_14, arg_285_1, arg_285_3)

		if var_285_18 and var_285_18.damage > 0 then
			return true
		end
	end

	return false
end

function slot_0_149_1()
	local var_286_0 = entities.GetLocalPawn()
	local var_286_1 = var_286_0 and slot_0_131_1() or {}

	slot_0_139_1(false, var_286_0, var_286_1)
	slot_0_140_1(false)

	slot_0_128_1.Active = false
	slot_0_128_1.State = "IDLE"
	slot_0_128_1.SafePos = nil
	slot_0_128_1.PeekPos = nil
	slot_0_128_1.TargetPawn = nil
	slot_0_128_1.Fired = false
	slot_0_128_1.LastScanTime = 0
	slot_0_128_1.LastRetractTime = 0
	slot_0_128_1.VisibleEnemies = 0
	slot_0_128_1.DebugRays = {}
	slot_0_128_1.IsClearShot = false
	slot_0_128_1.IsEPeek = false
	slot_0_128_1.LastRetractDist = nil
	slot_0_128_1.LastModeChangeTime = 0
	slot_0_128_1.Calibration = {
		LastSpeed = 0,
		IsJumping = false,
		M4A1 = nil
	}
end

events.createMove:Add(function(arg_287_0)
	slot_287_1_0 = UI.cfg.ai_peek_key or 0
	slot_287_2_0 = UI.cfg.ai_peek_key_mode or "Hold"
	slot_287_3_0 = false

	if slot_287_1_0 and slot_287_1_0 > 0 then
		if slot_287_2_0 == "Toggle" then
			slot_287_4_1 = get_key_state(slot_287_1_0)

			if slot_287_4_1 and not UI.ai_peek_key_was_down then
				UI.cfg.ai_peek_key_toggle_state = not UI.cfg.ai_peek_key_toggle_state
			end

			UI.ai_peek_key_was_down = slot_287_4_1
			slot_287_3_0 = UI.cfg.ai_peek_key_toggle_state
		else
			slot_287_3_0 = get_key_state(slot_287_1_0)
		end
	end

	slot_287_4_0 = is_enabled("ai_peek_enabled") or slot_287_3_0

	if not slot_287_4_0 and not is_enabled("ai_peek_debug") then
		slot_0_149_1()

		return
	end

	slot_0_136_1()

	slot_287_5_0 = entities.GetLocalPawn()

	if not slot_287_5_0 or not slot_287_5_0:IsAlive() then
		return
	end

	slot_287_6_0 = slot_287_5_0:GetActiveWeapon()
	slot_287_6_0 = slot_287_6_0 and slot_287_6_0:to_weapon_base()

	if not slot_287_6_0 then
		return
	end

	slot_287_7_0 = slot_287_6_0:GetType()

	if slot_287_7_0 == 0 or slot_287_7_0 == 7 or slot_287_7_0 == 8 or slot_287_7_0 == 9 then
		slot_0_128_1.State = "IDLE"
		slot_0_128_1.Active = false

		return
	end

	slot_287_8_0 = slot_287_4_0

	if slot_0_36_0 and slot_0_36_0.ai_peek then
		slot_0_36_0.ai_peek.active = slot_287_8_0
	end

	slot_287_9_0 = is_enabled("ai_peek_debug")
	slot_287_10_0 = game.globalVars.m_flRealTime
	slot_287_11_0 = slot_0_138_1(slot_287_5_0)
	slot_287_12_0 = slot_0_137_1(slot_287_11_0 and slot_287_11_0.m_flNextAttack and slot_287_11_0.m_flNextAttack:Get())
	slot_287_13_0 = slot_0_137_1(slot_287_6_0.m_nNextPrimaryAttackTick and slot_287_6_0.m_nNextPrimaryAttackTick:Get())
	slot_287_14_0 = slot_0_137_1(slot_287_6_0.m_flPostponeFireReadyFrac and slot_287_6_0.m_flPostponeFireReadyFrac:Get())
	slot_287_15_0 = slot_287_5_0.ToPlayerController and slot_287_5_0:ToPlayerController() or nil
	slot_287_16_0 = slot_0_137_1(slot_287_15_0 and slot_287_15_0.m_nTickBase and slot_287_15_0.m_nTickBase:Get())

	if slot_287_16_0 == 0 and game and game.engine and game.engine.get_last_server_tick then
		slot_287_17_1 = game.globalVars.tick_count

		if slot_287_17_1 and type(slot_287_17_1) == "number" and slot_287_17_1 > 0 then
			slot_287_16_0 = slot_287_17_1
		end
	end

	if slot_287_16_0 == 0 then
		slot_287_16_0 = game.globalVars.m_iTickCount or 0
	end

	slot_287_17_0 = nil

	if slot_287_16_0 > 0 then
		slot_287_17_0 = slot_287_12_0 <= slot_287_10_0 and slot_287_13_0 <= slot_287_16_0 and slot_287_14_0 <= slot_287_10_0
	else
		slot_287_17_0 = slot_287_12_0 <= slot_287_10_0 and slot_287_14_0 <= slot_287_10_0
	end

	slot_0_128_1.DebugData = {
		Z = nil,
		curTime = slot_287_10_0,
		nextAttack = slot_287_12_0,
		nextPrimaryTick = slot_287_13_0,
		postponeFrac = slot_287_14_0,
		tickBase = slot_287_16_0,
		canFire = slot_287_17_0
	}

	if slot_287_9_0 and not slot_287_8_0 then
		slot_0_128_1.DebugRays = {}
		slot_287_18_6 = slot_287_5_0 and slot_287_5_0:IsAlive() and slot_0_131_1() or {}

		slot_0_139_1(false, slot_287_5_0, slot_287_18_6)
	end

	if slot_287_8_0 then
		slot_287_18_5 = slot_287_5_0:GetAbsOrigin()
		slot_287_19_6 = arg_287_0:GetForwardMove() ~= 0 or arg_287_0:GetLeftMove() ~= 0
		slot_287_20_4 = slot_0_128_1.SafePos and (slot_287_18_5 - slot_0_128_1.SafePos):Length() or 0
		slot_287_21_5 = UI.cfg.ai_peek_safedist or 50

		if slot_287_19_6 then
			if slot_287_21_5 < slot_287_20_4 then
				slot_0_128_1.SafePos = slot_287_18_5
			end

			if slot_0_128_1.State ~= "IDLE" and slot_0_128_1.State ~= "SCANNING" then
				slot_0_128_1.State = "SCANNING"
				slot_0_128_1.TargetPawn = nil
				slot_0_128_1.PeekPos = nil

				slot_0_139_1(false, slot_287_5_0, slot_0_131_1())
				slot_0_140_1(false)
			end

			slot_0_128_1.LastRetractTime = game.globalVars.m_flRealTime
		end
	end

	if slot_287_8_0 and slot_0_128_1.State == "IDLE" then
		slot_0_128_1.State = "SCANNING"

		if not slot_0_128_1.SafePos then
			slot_0_128_1.SafePos = slot_287_5_0:GetAbsOrigin()
		end

		slot_0_128_1.Fired = false
		slot_0_128_1.Breadcrumbs = {}
		slot_0_128_1.LastBreadcrumbTime = slot_287_10_0
	elseif not slot_287_8_0 then
		slot_0_149_1()

		return
	end

	if slot_287_8_0 and (slot_0_128_1.State == "IDLE" or slot_0_128_1.State == "SCANNING") then
		slot_287_18_4 = slot_287_5_0:GetAbsOrigin()
		slot_287_19_5 = slot_287_5_0.m_fFlags:Get() or 0

		if slot_0_7_0.band(slot_287_19_5, 1) ~= 0 and slot_287_10_0 - slot_0_128_1.LastBreadcrumbTime > 0.15 then
			slot_287_21_4 = slot_0_128_1.Breadcrumbs[#slot_0_128_1.Breadcrumbs]

			if not slot_287_21_4 or (slot_287_18_4 - slot_287_21_4):Length() > 35 then
				table.insert(slot_0_128_1.Breadcrumbs, slot_287_18_4)

				if #slot_0_128_1.Breadcrumbs > 15 then
					table.remove(slot_0_128_1.Breadcrumbs, 1)
				end
			end

			slot_0_128_1.LastScanTime = slot_287_10_0
			slot_287_22_5 = slot_0_128_1.LastRetractTime or 0

			if (slot_0_128_1.VisibleEnemies > 0 and 0.2 or 0.8) < slot_287_10_0 - slot_0_128_1.LastScanTime and slot_287_10_0 - slot_287_22_5 > 0.4 then
				slot_0_128_1.LastScanTime = slot_287_10_0
				slot_287_24_6, slot_287_25_5, slot_287_26_5, slot_287_27_4, slot_287_28_5 = slot_0_147_1(slot_287_5_0, slot_287_6_0, arg_287_0:GetViewangles())
				slot_0_128_1.TargetPawn = slot_287_25_5

				if slot_287_24_6 and slot_287_26_5 then
					slot_0_128_1.PeekPos = slot_287_24_6
					slot_0_128_1.State = "PEEKING"
					slot_0_128_1.PeekMode = slot_287_27_4
					slot_0_128_1.DebugData.lastPeeks = slot_287_28_5
					slot_0_128_1.ScanSticks = 0

					if slot_287_9_0 then
						print("\n==================================================")
						print("[AI PEEK] COMMITTING TO NEW PEEK DECISION")
					end
				else
					slot_0_128_1.ScanDebugStr = string.format("FBP: Pos=%s, clr=%s", tostring(slot_287_24_6 ~= nil), tostring(slot_287_26_5))
				end
			end

			slot_0_128_1.LastBreadcrumbTime = slot_287_10_0
		end
	end

	if slot_0_128_1.State == "IDLE" and slot_287_10_0 - (slot_0_128_1.LastRetractTime or 0) > 1 then
		slot_0_128_1.PeekMode = nil
	end

	if slot_0_128_1.State == "SCANNING" then
		if not slot_0_128_1.DebugData or not slot_0_128_1.DebugData.canFire then
			return
		end

		slot_287_18_3 = game.globalVars.m_flRealTime
		slot_287_19_4 = slot_0_128_1.VisibleEnemies > 0 and 0.2 or 0.8
		slot_287_20_3 = slot_0_128_1.LastRetractTime or 0

		if slot_287_19_4 < slot_287_18_3 - slot_0_128_1.LastScanTime and slot_287_18_3 - slot_287_20_3 > 0.4 then
			slot_0_140_1(false)

			slot_0_128_1.LastScanTime = slot_287_18_3
			slot_287_21_3, slot_287_22_4, slot_287_23_4, slot_287_24_5, slot_287_25_4 = slot_0_147_1(slot_287_5_0, slot_287_6_0, arg_287_0:GetViewangles())
			slot_0_128_1.TargetPawn = slot_287_22_4

			if slot_287_21_3 and slot_287_23_4 then
				slot_0_128_1.PeekPos = slot_287_21_3
				slot_0_128_1.PeekMode = slot_287_24_5
				slot_0_128_1.LastModeChangeTime = slot_287_18_3
				slot_0_128_1.TargetDebugInfo = slot_287_25_4
				slot_0_128_1.State = "PEEKING"

				if is_enabled("ai_peek_debug") and is_enabled("ai_peek_console_debug") and slot_287_25_4 then
					slot_287_26_4 = slot_0_128_1.TargetingDebug or {}

					print("\n==================================================")
					print("[AI PEEK] COMMITTING TO NEW PEEK DECISION")
					print(string.format("Target Selection: %s | Enemies: %d/%d", slot_287_26_4.modeName or "?", slot_287_26_4.filteredEnemies or 0, slot_287_26_4.totalEnemies or 0))
					print(string.format("Target: %s | Mode: %s | E-Peek: %s", tostring(slot_287_22_4), slot_287_24_5 == 2 and "JUMPSCOUT" or "NORMAL", tostring(slot_0_128_1.IsEPeek)))
					print(string.format("Move Dist: %.1f | Target Dist: %.1f | Expected Dmg: %.1f", slot_287_25_4.peekDist or 0, slot_287_25_4.targetDist or 0, slot_287_25_4.expectedDmg or 0))
					print(string.format("Target Speed: %s | Height Diff: %s | Crouched: %s", slot_287_25_4.speed, slot_287_25_4.heightDiff, tostring(slot_287_25_4.crouched)))
					print(string.format("Total Safety Bonus: %d", slot_287_25_4.bonus or 0))
					print("--- Evaluation Reasons & Logic ---")

					for iter_287_0, iter_287_1 in ipairs(slot_287_25_4.reasons) do
						print(" " .. iter_287_1)
					end

					print("==================================================\n")
				end
			elseif is_enabled("ai_peek_debug") and is_enabled("ai_peek_console_debug") and slot_287_18_3 - (slot_0_128_1.ScanResults.lastReasonPrint or 0) > 1.5 then
				print("\n[AI PEEK] SCANNING REASONS")

				if #slot_0_128_1.ScanResults.reasons > 0 then
					for iter_287_2, iter_287_3 in ipairs(slot_0_128_1.ScanResults.reasons) do
						print(" " .. iter_287_3)
					end
				else
					print(" No valid enemies or points found.")
				end

				print("--------------------------------------------------\n")

				slot_0_128_1.ScanResults.lastReasonPrint = slot_287_18_3
			end
		end
	elseif slot_0_128_1.State == "PEEKING" then
		if not slot_0_128_1.TargetPawn or not slot_0_128_1.TargetPawn:IsAlive() then
			slot_0_128_1.State = "RETRACTING"

			return
		end

		slot_287_18_2 = slot_287_5_0:GetAbsOrigin()
		slot_287_19_3 = (slot_0_128_1.PeekPos - slot_287_18_2):Length()

		if slot_287_19_3 > 5 then
			slot_287_20_2 = slot_287_6_0:GetDefIndex()

			if slot_287_20_2 == 40 then
				slot_287_21_2 = slot_287_5_0:GetAbsVelocity()
				slot_287_22_3 = slot_287_21_2.z
				slot_287_23_3 = slot_287_21_2:Length2d()
				slot_287_24_4 = slot_287_5_0.m_fFlags:Get() or 0
				slot_287_25_3 = slot_0_7_0.band(slot_287_24_4, 1) ~= 0
				slot_287_26_3 = math.abs(slot_287_22_3) < 72

				if not slot_287_25_3 then
					if slot_287_26_3 then
						slot_0_140_1(true)

						if slot_287_6_0.m_zoomLevel and slot_287_6_0.m_zoomLevel:Get() < 1 then
							arg_287_0:SetButton(slot_0_7_0.lshift(1, 11))
						end
					end

					if arg_287_0:GetButton(1) or slot_287_22_3 < -20 then
						slot_0_128_1.State = "RETRACTING"

						slot_0_140_1(true)
						slot_0_139_1(false, slot_287_5_0, slot_0_131_1())

						if slot_0_128_1.SafePos then
							slot_287_28_4 = math.deg(math.atan2(slot_0_128_1.SafePos.y - slot_287_18_2.y, slot_0_128_1.SafePos.x - slot_287_18_2.x))

							arg_287_0:SetForwardMove(450)
							arg_287_0:SetLeftMove(0)
							arg_287_0:RotateMovement(slot_287_28_4)
						end

						return
					end
				else
					slot_0_140_1(false)

					slot_287_28_3 = slot_287_23_3 * (286.4 / (game.cvar:Find("sv_gravity").value or 800))

					if slot_0_128_1.PeekMode == 2 and slot_287_19_3 > 60 and slot_287_19_3 < slot_287_28_3 + 15 and slot_0_148_1(slot_287_5_0, slot_287_6_0, slot_0_128_1.PeekPos, slot_0_128_1.TargetPawn) then
						arg_287_0:SetButton(2)

						slot_287_29_2 = slot_287_5_0:GetAbsOrigin()
						slot_0_128_1.JumpAngle = math.deg(math.atan2(slot_0_128_1.PeekPos.y - slot_287_29_2.y, slot_0_128_1.PeekPos.x - slot_287_29_2.x))
						slot_0_128_1.JumpAngleLocked = true
					end
				end
			end

			slot_287_21_1 = game.globalVars.m_flRealTime
			slot_287_22_2 = slot_287_5_0.m_fFlags:Get() or 0

			if slot_0_7_0.band(slot_287_22_2, 1) ~= 0 and slot_287_21_1 - slot_0_128_1.LastScanTime > 0.15 then
				slot_0_128_1.LastScanTime = slot_287_21_1
				slot_287_24_3, slot_287_25_2, slot_287_26_2, slot_287_27_3, slot_287_28_2 = slot_0_147_1(slot_287_5_0, slot_287_6_0, arg_287_0:GetViewangles())

				if not slot_287_24_3 or not slot_287_26_2 then
					slot_0_128_1.ScanSticks = (slot_0_128_1.ScanSticks or 0) + 1

					if slot_0_128_1.ScanSticks > 2 then
						slot_0_128_1.State = "RETRACTING"
						slot_0_128_1.PeekPos = nil
						slot_0_128_1.TargetingDebug = nil
						slot_0_128_1.ScanSticks = 0
					end
				else
					slot_0_128_1.ScanSticks = 0

					if is_enabled("ai_peek_debug") and is_enabled("ai_peek_console_debug") and slot_287_25_2 and slot_287_28_2 then
						slot_287_29_1 = slot_0_128_1.TargetPawn ~= slot_287_25_2
						slot_287_30_1 = slot_0_128_1.PeekMode ~= slot_287_27_3

						if slot_287_29_1 or slot_287_30_1 then
							slot_287_31_1 = slot_0_128_1.TargetingDebug or {}

							print("\n==================================================")
							print("[silentium] ADJUSTING PEEK DECISION MID-MOVE")
							print(string.format("Target Selection: %s | Enemies: %d/%d", slot_287_31_1.modeName or "?", slot_287_31_1.filteredEnemies or 0, slot_287_31_1.totalEnemies or 0))
							print(string.format("New Target: %s | New Mode: %s | E-Peek: %s", tostring(slot_287_25_2), slot_287_27_3 == 2 and "JUMPSCOUT" or "NORMAL", tostring(slot_0_128_1.IsEPeek)))
							print(string.format("Move Dist: %.1f | Target Dist: %.1f | Expected Dmg: %.1f", slot_287_28_2.peekDist or 0, slot_287_28_2.targetDist or 0, slot_287_28_2.expectedDmg or 0))
							print("--- Updated Evaluation Reasons & Logic ---")

							for iter_287_4, iter_287_5 in ipairs(slot_287_28_2.reasons) do
								print(" " .. iter_287_5)
							end

							print("==================================================\n")
						end
					end

					slot_0_128_1.PeekPos = slot_287_24_3
					slot_0_128_1.TargetPawn = slot_287_25_2
					slot_0_128_1.PeekMode = slot_287_27_3
					slot_0_128_1.TargetDebugInfo = slot_287_28_2
				end
			end

			if slot_287_20_2 == 9 and (slot_287_6_0.m_zoomLevel and slot_287_6_0.m_zoomLevel:Get() or 0) >= 1 then
				arg_287_0:SetButton(slot_0_7_0.lshift(1, 11))
			end

			slot_287_24_2 = slot_287_5_0.m_fFlags:Get()
			slot_287_25_1 = slot_0_7_0.band(slot_287_24_2, 1) ~= 0
			slot_287_26_1 = slot_0_128_1.Calibration.TickHistory

			if slot_287_25_1 and slot_0_128_1.PeekMode == 2 and slot_0_128_1.HasJumped and not slot_0_128_1.Calibration.IsJumping and slot_287_26_1 and #slot_287_26_1 > 10 then
				slot_0_128_1.State = "RETRACTING"
				slot_0_128_1.HasJumped = false

				return
			end

			if slot_287_25_1 and not slot_0_128_1.JumpAngleLocked then
				slot_287_27_2 = slot_0_128_1.PeekPos or slot_0_128_1.SafePos

				if slot_287_27_2 then
					slot_0_128_1.JumpAngle = math.deg(math.atan2(slot_287_27_2.y - slot_287_18_2.y, slot_287_27_2.x - slot_287_18_2.x))
				end
			end

			arg_287_0:SetForwardMove(450)
			arg_287_0:SetLeftMove(0)

			if slot_0_128_1.JumpAngle then
				arg_287_0:RotateMovement(slot_0_128_1.JumpAngle)
			end

			if slot_287_25_1 and slot_0_128_1.JumpAngleLocked then
				slot_0_128_1.JumpAngleLocked = false
			end

			slot_287_27_1 = slot_0_131_1()

			if slot_287_20_2 == 40 and not slot_287_25_1 then
				slot_0_139_1(false, slot_287_5_0, slot_287_27_1)
			elseif slot_0_128_1.IsEPeek then
				slot_287_28_1 = slot_287_5_0:GetAbsVelocity():Length2d()

				if (slot_287_28_1 > 10 and slot_287_19_3 / slot_287_28_1 / slot_0_124_1 or 999) <= slot_0_135_1() + 2 or slot_287_19_3 < 25 then
					slot_0_139_1(true, slot_287_5_0, slot_287_27_1, true)
				else
					slot_0_139_1(true, slot_287_5_0, slot_287_27_1, false)
				end
			else
				slot_0_139_1(true, slot_287_5_0, slot_287_27_1, false)
			end
		else
			slot_0_128_1.State = "READY"
		end
	elseif slot_0_128_1.State == "READY" then
		if not slot_0_128_1.TargetPawn or not slot_0_128_1.TargetPawn:IsAlive() then
			slot_0_128_1.State = "RETRACTING"

			return
		end

		if arg_287_0:GetButton(1) then
			slot_0_128_1.Fired = true
			slot_0_128_1.State = "RETRACTING"
		end
	elseif slot_0_128_1.State == "RETRACTING" then
		slot_287_18_1 = slot_287_5_0:GetAbsOrigin()
		slot_287_19_2 = (slot_0_128_1.SafePos - slot_287_18_1):Length()
		slot_287_20_1 = slot_287_5_0.m_fFlags:Get()

		if slot_0_7_0.band(slot_287_20_1, 1) ~= 0 or slot_0_128_1.IsEPeek then
			slot_0_140_1(false)
			slot_0_139_1(false, slot_287_5_0, slot_0_131_1())

			slot_0_128_1.IsEPeek = false
		end

		slot_287_22_1 = slot_0_128_1.SafePos

		if #slot_0_128_1.Breadcrumbs > 0 then
			slot_287_23_2 = slot_0_128_1.Breadcrumbs[#slot_0_128_1.Breadcrumbs]

			if (slot_287_18_1 - slot_287_23_2):Length() < 40 then
				table.remove(slot_0_128_1.Breadcrumbs, #slot_0_128_1.Breadcrumbs)

				if #slot_0_128_1.Breadcrumbs > 0 then
					slot_287_23_2 = slot_0_128_1.Breadcrumbs[#slot_0_128_1.Breadcrumbs]
				else
					slot_287_23_2 = slot_0_128_1.SafePos
				end
			end

			slot_287_22_1 = slot_287_23_2
		end

		slot_287_19_1 = (slot_287_22_1 - slot_287_18_1):Length()
		slot_287_23_1 = slot_0_128_1.LastRetractDist and slot_287_19_1 > slot_0_128_1.LastRetractDist + 5

		if slot_287_19_1 < 10 or slot_287_23_1 then
			slot_0_128_1.State = "IDLE"
			slot_0_128_1.LastRetractTime = game.globalVars.m_flRealTime
			slot_0_128_1.LastRetractDist = nil
			slot_0_128_1.HasJumped = false

			slot_0_140_1(false)
			slot_0_139_1(false, slot_287_5_0, slot_0_131_1())
		else
			slot_0_128_1.LastRetractDist = slot_287_19_1
			slot_287_24_1 = math.deg(math.atan2(slot_287_22_1.y - slot_287_18_1.y, slot_287_22_1.x - slot_287_18_1.x))

			arg_287_0:SetForwardMove(450)
			arg_287_0:SetLeftMove(0)
			arg_287_0:RotateMovement(slot_287_24_1)
		end
	end

	if slot_287_8_0 and is_enabled("ai_peek_jumpscout") then
		slot_287_18_0 = slot_287_5_0.m_fFlags:Get()
		slot_287_19_0 = slot_0_7_0.band(slot_287_18_0, 1) ~= 0
		slot_287_20_0 = slot_287_5_0:GetAbsVelocity()

		if slot_287_19_0 and slot_0_128_1.Calibration.IsJumping and #slot_0_128_1.Calibration.TickHistory > 10 then
			slot_0_128_1.Calibration.IsJumping = false
		end

		if slot_287_19_0 and arg_287_0:GetButton(2) then
			slot_0_128_1.Calibration.EMA_Accel = slot_0_128_1.Calibration.EMA_Accel or 30
			slot_0_128_1.Calibration.EMA_Drift = slot_0_128_1.Calibration.EMA_Drift or 0
			slot_0_128_1.Calibration.EMA_WishSpeed = slot_0_128_1.Calibration.EMA_WishSpeed or 640
			slot_0_128_1.Calibration.EMA_AirTicks = slot_0_128_1.Calibration.EMA_AirTicks or 18
			slot_0_128_1.Calibration.EMA_InitialBoost = slot_0_128_1.Calibration.EMA_InitialBoost or 15
			slot_0_128_1.Calibration.EMA_JumpImpulse = slot_0_128_1.Calibration.EMA_JumpImpulse or 286.4
			slot_0_128_1.Calibration.MaxObservedSpeed = 0
			slot_0_128_1.Calibration.TickHistory = {}
			slot_0_128_1.Calibration.IsJumping = true
			slot_0_128_1.HasJumped = true
			slot_0_128_1.Calibration.JumpStartPos = slot_287_5_0:GetAbsOrigin()
			slot_0_128_1.Calibration.AirTicks = 0
			slot_0_128_1.Calibration.StartVelZ = 0
			slot_0_128_1.Calibration.MaxZ = slot_0_128_1.Calibration.JumpStartPos.z
			slot_0_128_1.Calibration.JumpDir = nil
			slot_0_128_1.Calibration.ActualApexPos = nil
		end

		if not slot_287_19_0 and slot_0_128_1.Calibration.IsJumping then
			slot_0_128_1.Calibration.AirTicks = slot_0_128_1.Calibration.AirTicks + 1
			slot_287_21_0 = slot_287_5_0:GetAbsOrigin()

			if slot_287_21_0.z > slot_0_128_1.Calibration.MaxZ then
				slot_0_128_1.Calibration.MaxZ = slot_287_21_0.z
				slot_0_128_1.Calibration.ActualApexPos = slot_287_21_0
			end

			slot_0_128_1.Calibration.TickHistory = slot_0_128_1.Calibration.TickHistory or {}
			slot_287_22_0 = slot_287_20_0:Length2d()

			if #slot_0_128_1.Calibration.TickHistory < 30 then
				table.insert(slot_0_128_1.Calibration.TickHistory, slot_287_22_0)
			end

			slot_287_23_0 = slot_287_20_0.z < 20

			if #slot_0_128_1.Calibration.TickHistory > 5 and slot_287_23_0 then
				slot_0_128_1.Calibration.ActualAirTicks = slot_0_128_1.Calibration.ActualAirTicks or #slot_0_128_1.Calibration.TickHistory
			end

			slot_0_128_1.Calibration.MaxObservedSpeed = math.max(slot_0_128_1.Calibration.MaxObservedSpeed or 0, slot_287_22_0)

			if slot_0_128_1.Calibration.AirTicks == 1 then
				slot_0_128_1.Calibration.StartVelZ = slot_287_20_0.z
				slot_0_128_1.Calibration.JumpDir = Vector(slot_287_20_0.x, slot_287_20_0.y, 0):Normalized()
			end

			if slot_287_20_0.z < 5 then
				slot_287_24_0 = slot_0_128_1.Calibration.ActualApexPos or slot_287_5_0:GetAbsOrigin()
				slot_287_25_0 = game.cvar:Find("sv_airaccelerate")
				slot_287_26_0 = game.cvar:Find("sv_gravity")
				slot_287_27_0 = slot_287_25_0 and slot_287_25_0.value or 12
				slot_287_28_0 = slot_287_26_0 and slot_287_26_0.value or 800
				slot_287_29_0 = math.ceil(286.4 / (slot_287_28_0 * slot_0_124_1))
				slot_287_30_0 = slot_287_29_0 * slot_0_124_1
				slot_287_31_0 = slot_0_128_1.Calibration.JumpDir or Vector(1, 0, 0)
				slot_287_32_0 = Vector(slot_287_31_0.x * slot_0_128_1.Calibration.LastSpeed, slot_287_31_0.y * slot_0_128_1.Calibration.LastSpeed, 286.4)
				slot_287_33_0, slot_287_34_0, slot_287_35_0 = slot_0_146_1(slot_0_128_1.Calibration.JumpStartPos, slot_287_32_0, slot_287_31_0, slot_287_29_0, slot_0_128_1.Calibration.EMA_Accel, slot_0_128_1.Calibration.EMA_WishSpeed, slot_0_128_1.Calibration.EMA_AirTicks, slot_0_128_1.Calibration.EMA_Drift, slot_0_128_1.Calibration.EMA_InitialBoost)
				slot_0_128_1.Calibration.PredictedApexPos = slot_287_33_0
				slot_0_128_1.Calibration.PredictedFinalSpeed = slot_287_34_0:Length2d()
				slot_287_36_0 = slot_0_128_1.Calibration.PredictedApexPos

				if slot_287_36_0 then
					slot_287_37_0 = slot_0_128_1.Calibration.TickHistory or {}
					slot_287_38_0 = (slot_287_24_0 - slot_287_36_0):Length()
					slot_287_39_0 = (slot_287_24_0 - slot_0_128_1.Calibration.JumpStartPos):Length()
					slot_287_40_0 = (slot_287_36_0 - slot_0_128_1.Calibration.JumpStartPos):Length()
					slot_287_41_0 = slot_0_128_1.Calibration.MaxZ - slot_0_128_1.Calibration.JumpStartPos.z
					slot_287_42_0 = slot_287_24_0:Dot(slot_287_31_0)
					slot_287_44_0 = (slot_287_39_0 / slot_287_30_0 - slot_0_128_1.Calibration.LastSpeed) / ((slot_287_29_0 + 1) * 0.5)
					slot_287_45_0 = slot_0_128_1.Calibration.MaxObservedSpeed or 640
					slot_0_128_1.Calibration.EMA_WishSpeed = slot_0_128_1.Calibration.EMA_WishSpeed or slot_287_45_0
					slot_0_128_1.Calibration.EMA_WishSpeed = slot_0_128_1.Calibration.EMA_WishSpeed * 0.7 + slot_287_45_0 * 0.3
					slot_287_46_0 = slot_0_128_1.Calibration.ActualAirTicks or slot_0_128_1.Calibration.AirTicks
					slot_0_128_1.Calibration.EMA_AirTicks = slot_0_128_1.Calibration.EMA_AirTicks or slot_287_46_0
					slot_0_128_1.Calibration.EMA_AirTicks = slot_0_128_1.Calibration.EMA_AirTicks * 0.6 + slot_287_46_0 * 0.4
					slot_287_47_0 = slot_0_128_1.Calibration.StartVelZ or 286.4
					slot_0_128_1.Calibration.EMA_JumpImpulse = slot_0_128_1.Calibration.EMA_JumpImpulse or slot_287_47_0
					slot_0_128_1.Calibration.EMA_JumpImpulse = slot_0_128_1.Calibration.EMA_JumpImpulse * 0.8 + slot_287_47_0 * 0.2
					slot_287_48_0 = slot_287_37_0[1] or slot_0_128_1.Calibration.LastSpeed
					slot_287_49_0 = slot_287_48_0 - slot_0_128_1.Calibration.LastSpeed
					slot_0_128_1.Calibration.EMA_InitialBoost = slot_0_128_1.Calibration.EMA_InitialBoost or slot_287_49_0
					slot_0_128_1.Calibration.EMA_InitialBoost = slot_0_128_1.Calibration.EMA_InitialBoost * 0.7 + slot_287_49_0 * 0.3
					slot_287_52_0 = (slot_287_39_0 / (slot_287_46_0 * slot_0_124_1) - slot_287_48_0) / ((slot_287_46_0 - 2) * 0.5)
					slot_0_128_1.Calibration.EMA_Accel = slot_0_128_1.Calibration.EMA_Accel or slot_287_52_0
					slot_0_128_1.Calibration.EMA_Accel = slot_0_128_1.Calibration.EMA_Accel * 0.4 + slot_287_52_0 * 0.6
					slot_287_53_0 = (slot_287_24_0 - slot_0_128_1.Calibration.JumpStartPos):Normalized()
					slot_287_54_0 = math.rad(slot_0_128_1.JumpAngle or 0)
					slot_287_55_0 = Vector(math.cos(slot_287_54_0), math.sin(slot_287_54_0), 0)
					slot_287_58_0 = math.atan2(slot_287_53_0.y, slot_287_53_0.x) - math.atan2(slot_287_55_0.y, slot_287_55_0.x)

					while slot_287_58_0 > math.pi do
						slot_287_58_0 = slot_287_58_0 - 2 * math.pi
					end

					while slot_287_58_0 < -math.pi do
						slot_287_58_0 = slot_287_58_0 + 2 * math.pi
					end

					slot_287_59_0 = math.deg(slot_287_58_0)
					slot_0_128_1.Calibration.EMA_Drift = slot_0_128_1.Calibration.EMA_Drift or slot_287_59_0
					slot_0_128_1.Calibration.EMA_Drift = slot_0_128_1.Calibration.EMA_Drift * 0.7 + slot_287_59_0 * 0.3

					if is_enabled("ai_peek_calibrate") then
						print("\n[AI CALIB TELEMETRY]")
						print(string.format(" > PHYS: AA: %.1f | Grav: %.1f", slot_287_27_0, slot_287_28_0))
						print(string.format(" > MOVE: Speed: %.1f -> %.1f | ActualDist: %.2f | PredDist: %.2f (D: %.2f)", slot_0_128_1.Calibration.LastSpeed, slot_0_128_1.Calibration.PredictedFinalSpeed or 0, slot_287_39_0, slot_287_40_0, slot_287_38_0))
						print(string.format(" > JUMP: Ticks: %d (Actual: %d) | Impulse: %.1f", slot_0_128_1.Calibration.AirTicks, slot_287_46_0, slot_287_47_0))
						print(string.format(" > AUTO: Accel: %.1f | Drift: %.1f | Wish: %.0f | Air: %.1f | Boost: %.1f", slot_0_128_1.Calibration.EMA_Accel, slot_0_128_1.Calibration.EMA_Drift, slot_0_128_1.Calibration.EMA_WishSpeed, slot_0_128_1.Calibration.EMA_AirTicks, slot_0_128_1.Calibration.EMA_InitialBoost))
						print(string.format(" > RAW:  Accel: %.1f | Drift: %.1f | Boost: %.1f", slot_287_52_0, slot_287_59_0, slot_287_49_0))

						slot_287_60_0 = slot_287_35_0 or {}

						print(" > TICK COMP: ACTL | PRED | GAIN")

						for iter_287_6 = 1, math.min(#slot_287_37_0, 24) do
							slot_287_65_0 = slot_287_37_0[iter_287_6] or 0
							slot_287_66_0 = slot_287_60_0[iter_287_6] or 0
							slot_287_68_0 = slot_287_65_0 - (slot_287_37_0[iter_287_6 - 1] or slot_0_128_1.Calibration.LastSpeed)

							if iter_287_6 <= 15 then
								print(string.format("   Tick %02d: %4.0f | %4.0f | +%2.0f", iter_287_6, slot_287_65_0, slot_287_66_0, slot_287_68_0))
							end
						end

						print("--------------------------------------------------")
					end
				end

				slot_0_128_1.Calibration.IsJumping = false
			end
		end
	end
end)
events.event:Add(function(arg_288_0)
	if not is_enabled("ai_peek_enabled") then
		return
	end

	if slot_0_128_1.State ~= "PEEKING" and slot_0_128_1.State ~= "READY" then
		return
	end

	if arg_288_0:GetName() == "weapon_fire" then
		local var_288_0 = entities.GetLocalPawn()
		local var_288_1 = arg_288_0:GetPawnFromId("userid")

		if var_288_0 and var_288_1 and var_288_0 == var_288_1 then
			slot_0_128_1.State = "RETRACTING"
		end
	end
end)
events.presentQueue:Add(function()
	if not is_enabled("ai_peek_debug") then
		return
	end

	slot_289_0_0 = is_enabled("ai_peek_visual_debug")

	if slot_289_0_0 then
		function slot_289_1_1(arg_290_0, arg_290_1, arg_290_2, arg_290_3, arg_290_4)
			local var_290_0 = game.globalVars.m_flRealTime * 4 % (math.pi * 2)
			local var_290_1 = 12
			local var_290_2 = 3
			local var_290_3 = 16
			local var_290_4

			for iter_290_0 = 0, var_290_3 do
				local var_290_5 = var_290_0 + iter_290_0 / var_290_3 * var_290_2
				local var_290_6 = arg_290_0 + Vector(math.cos(var_290_5) * var_290_1, math.sin(var_290_5) * var_290_1, 0.5)
				local var_290_7 = math.WorldToScreen(var_290_6)

				if var_290_7 and var_290_4 then
					local var_290_8 = iter_290_0 / var_290_3 * arg_290_4

					draw.surface:AddLine(var_290_4, var_290_7, draw.Color(arg_290_1, arg_290_2, arg_290_3, math.floor(var_290_8)))
				end

				var_290_4 = var_290_7
			end
		end

		function slot_289_2_1(arg_291_0, arg_291_1)
			local var_291_0 = Vector(-16, -16, 0)
			local var_291_1 = Vector(16, 16, 72)
			local var_291_2 = {
				arg_291_0 + Vector(var_291_0.x, var_291_0.y, var_291_0.z),
				arg_291_0 + Vector(var_291_1.x, var_291_0.y, var_291_0.z),
				arg_291_0 + Vector(var_291_1.x, var_291_1.y, var_291_0.z),
				arg_291_0 + Vector(var_291_0.x, var_291_1.y, var_291_0.z),
				arg_291_0 + Vector(var_291_0.x, var_291_0.y, var_291_1.z),
				arg_291_0 + Vector(var_291_1.x, var_291_0.y, var_291_1.z),
				arg_291_0 + Vector(var_291_1.x, var_291_1.y, var_291_1.z),
				arg_291_0 + Vector(var_291_0.x, var_291_1.y, var_291_1.z)
			}
			local var_291_3 = {}

			for iter_291_0 = 1, 8 do
				var_291_3[iter_291_0] = math.WorldToScreen(var_291_2[iter_291_0])
			end

			for iter_291_1 = 1, 4 do
				local var_291_4 = iter_291_1 % 4 + 1

				if var_291_3[iter_291_1] and var_291_3[var_291_4] then
					draw.surface:AddLine(var_291_3[iter_291_1], var_291_3[var_291_4], arg_291_1)
				end

				if var_291_3[iter_291_1 + 4] and var_291_3[var_291_4 + 4] then
					draw.surface:AddLine(var_291_3[iter_291_1 + 4], var_291_3[var_291_4 + 4], arg_291_1)
				end

				if var_291_3[iter_291_1] and var_291_3[iter_291_1 + 4] then
					draw.surface:AddLine(var_291_3[iter_291_1], var_291_3[iter_291_1 + 4], arg_291_1)
				end
			end
		end

		if slot_0_128_1.State ~= "IDLE" then
			if slot_0_128_1.SafePos then
				slot_289_1_1(slot_0_128_1.SafePos, 255, 255, 255, 180)
			end

			if slot_0_128_1.PeekPos then
				slot_289_2_1(slot_0_128_1.PeekPos, draw.Color(255, 255, 255, 120))
			end
		end

		if slot_0_128_1.TargetPawn and slot_0_128_1.TargetPawn:IsAlive() then
			slot_289_3_1 = slot_0_128_1.TargetPawn
			slot_289_4_1 = slot_0_128_1.TargetDebugInfo
			slot_289_5_1 = slot_289_3_1:GetAbsOrigin()
			slot_289_6_1 = math.WorldToScreen(slot_289_5_1 or Vector(0, 0, 45))

			if slot_289_6_1 then
				draw.surface:AddCircleFilled(slot_289_6_1, 2, draw.Color(255, 255, 255, 200))
			end

			slot_289_7_1 = slot_289_6_1

			for iter_289_0 = 2, 10, 2 do
				slot_289_12_2 = slot_0_144_1(slot_289_3_1, iter_289_0)
				slot_289_13_0 = math.WorldToScreen(slot_289_12_2 + Vector(0, 0, 45))

				if slot_289_13_0 then
					slot_289_14_0 = 200 - iter_289_0 * 15

					draw.surface:AddCircleFilled(slot_289_13_0, 2, draw.Color(0, 255, 200, slot_289_14_0))

					if slot_289_7_1 then
						draw.surface:AddLine(slot_289_7_1, slot_289_13_0, draw.Color(0, 255, 200, slot_289_14_0 / 2))
					end

					slot_289_7_1 = slot_289_13_0
				end
			end

			if slot_289_4_1 and slot_289_4_1.backtrackPos then
				slot_289_8_2 = math.WorldToScreen(slot_289_4_1.backtrackPos + Vector(0, 0, 45))

				if slot_289_8_2 then
					draw.surface:AddCircle(slot_289_8_2, 6, draw.Color(255, 0, 80, 200))
					draw.surface:AddCircle(slot_289_8_2, 2, draw.Color(255, 0, 80, 100))
				end
			end

			if slot_289_4_1 and slot_289_4_1.futurePos then
				slot_289_8_1 = math.WorldToScreen(slot_289_4_1.futurePos + Vector(0, 0, 45))

				if slot_289_8_1 and slot_289_6_1 then
					draw.surface:AddLine(slot_289_6_1, slot_289_8_1, draw.Color(255, 255, 0, 120))
				end
			end
		end
	end

	if not slot_289_0_0 then
		return
	end

	slot_289_1_0, slot_289_2_0 = slot_0_9_0()
	slot_289_3_0 = slot_0_8_0()
	slot_289_4_0 = 20 * slot_289_3_0
	slot_289_5_0 = math.floor(slot_289_2_0 * 0.45)
	slot_289_6_0 = 14 * slot_289_3_0
	draw.surface.font = draw.fonts.gui_main or draw.surface.font
	slot_289_7_0 = draw.Color(240, 240, 240, 255)
	slot_289_8_0 = draw.Color(160, 160, 160, 200)
	slot_289_9_0 = "none"

	if slot_0_128_1.TargetPawn and slot_0_128_1.TargetPawn:IsAlive() then
		slot_289_9_0 = slot_0_128_1.TargetPawn:GetName()

		if string.len(slot_289_9_0) > 12 then
			slot_289_9_0 = string.sub(slot_289_9_0, 1, 12) .. ".."
		end
	end

	slot_289_10_0 = math.floor((slot_0_135_1() or 0) * (slot_0_124_1 or 0.015) * 1000)
	slot_289_11_0 = {}

	table.insert(slot_289_11_0, {
		with_h = nil,
		text = string.format("silentium [ai peek] | %s | %dms", slot_0_128_1.State:lower(), slot_289_10_0),
		color = slot_289_7_0
	})

	if slot_0_128_1.State ~= "IDLE" then
		if slot_289_9_0 ~= "none" then
			table.insert(slot_289_11_0, {
				[0] = nil,
				text = string.format("- target: %s", slot_289_9_0:lower()),
				color = slot_289_8_0
			})
		end

		table.insert(slot_289_11_0, {
			GetComboValue = nil,
			text = string.format("- mode: %s", slot_0_128_1.PeekMode == 2 and "jumpscout" or "normal"),
			color = slot_289_8_0
		})

		if slot_0_128_1.TargetDebugInfo then
			slot_289_12_1 = slot_0_128_1.TargetDebugInfo

			table.insert(slot_289_11_0, {
				[0] = nil,
				text = string.format("- safety: %d", slot_289_12_1.bonus or 0),
				color = slot_289_8_0
			})

			if slot_289_12_1.expectedDmg then
				table.insert(slot_289_11_0, {
					[0] = nil,
					text = string.format("- exp dmg: %d", math.floor(slot_289_12_1.expectedDmg)),
					color = slot_289_8_0
				})
			end
		end

		if slot_0_128_1.IsEPeek then
			table.insert(slot_289_11_0, {
				text = "- condition: e-peek",
				["sol.H[!)"] = nil,
				color = slot_289_8_0
			})
		end
	end

	slot_289_12_0 = slot_289_5_0

	for iter_289_1, iter_289_2 in ipairs(slot_289_11_0) do
		draw.surface:AddText(draw.Vec2(slot_289_4_0 + 1, slot_289_12_0 + 1), iter_289_2.text, draw.Color(0, 0, 0, 230))

		if iter_289_2.color then
			draw.surface:AddText(draw.Vec2(slot_289_4_0, slot_289_12_0), iter_289_2.text, iter_289_2.color)
		end

		slot_289_12_0 = slot_289_12_0 + slot_289_6_0
	end
end)

function __shutdown()
	local var_292_0 = entities.GetLocalPawn()

	if var_292_0 then
		slot_0_139_1(false, var_292_0)
	end

	slot_0_140_1(false)
end

function slot_0_124_0(arg_293_0, arg_293_1)
	local var_293_0 = is_enabled("aa_freestanding")

	if var_293_0 and not UI.is_hotkey_active("aa_freestanding_key", true) then
		var_293_0 = false
	end

	if not var_293_0 or not arg_293_0 or not arg_293_0:IsAlive() then
		if slot_0_36_0.aa.fs_active then
			if slot_0_36_0.aa_yaw_amount_ctl then
				if slot_0_36_0.aa_yaw_amount_ctl.set_hotkey_state then
					slot_0_36_0.aa_yaw_amount_ctl:set_hotkey_state(false)
				end

				slot_0_29_0.Helpers.SetValue(slot_0_36_0.aa_yaw_amount_ctl, 180)
			end

			slot_0_36_0.aa.fs_active = false
		end

		return
	end

	if not slot_0_36_0.aa_yaw_amount_ctl then
		slot_0_36_0.aa_yaw_amount_ctl = gui.ctx:find("rage>anti-aim>angles>yaw>settings>amount")
	end

	if not slot_0_36_0.aa_yaw_base_ctl then
		slot_0_36_0.aa_yaw_base_ctl = gui.ctx:find("rage>anti-aim>angles>yaw base")
	end

	if not slot_0_36_0.aa_left_ctl then
		slot_0_36_0.aa_left_ctl = gui.ctx:find("rage>anti-aim>angles>manual override>override left") or gui.ctx:find("rage>anti-aim>angles>override left")
	end

	if not slot_0_36_0.aa_right_ctl then
		slot_0_36_0.aa_right_ctl = gui.ctx:find("rage>anti-aim>angles>manual override>override right") or gui.ctx:find("rage>anti-aim>angles>override right")
	end

	if not slot_0_36_0.aa_yaw_amount_ctl then
		return
	end

	local var_293_1 = arg_293_0:GetAbsOrigin()

	if not var_293_1 then
		return
	end

	local var_293_2 = vector(var_293_1.x, var_293_1.y, var_293_1.z + 64)
	local var_293_3 = vector(var_293_1.x, var_293_1.y, var_293_1.z + 32)
	local var_293_4 = arg_293_1:GetViewangles()

	if not var_293_4 or not var_293_4.y then
		return
	end

	local var_293_5 = 140
	local var_293_6 = 35

	slot_0_36_0.aa.fs_hits = {}

	local function var_293_7(arg_294_0, arg_294_1)
		local var_294_0 = 1
		local var_294_1
		local var_294_2

		for iter_294_0, iter_294_1 in ipairs(arg_294_0) do
			local var_294_3 = math.rad(var_293_4.y + iter_294_1)
			local var_294_4 = vector(var_293_2.x + math.cos(var_294_3) * var_293_5, var_293_2.y + math.sin(var_294_3) * var_293_5, var_293_2.z)

			if game.physics_query_interface and ray_t then
				local var_294_5 = vector(var_293_2.x + math.cos(var_294_3) * 5, var_293_2.y + math.sin(var_294_3) * 5, var_293_2.z)
				local var_294_6 = game.physics_query_interface:trace_ray(ray_t(), var_294_5, var_294_4)

				if var_294_6 and var_294_0 > var_294_6.fraction then
					var_294_0 = var_294_6.fraction
					var_294_1 = var_294_6.endpos
					var_294_2 = var_294_5
				end

				if var_294_0 >= 1 then
					local var_294_7 = vector(var_293_3.x + math.cos(var_294_3) * 5, var_293_3.y + math.sin(var_294_3) * 5, var_293_3.z)
					local var_294_8 = vector(var_293_3.x + math.cos(var_294_3) * var_293_5, var_293_3.y + math.sin(var_294_3) * var_293_5, var_293_3.z)
					local var_294_9 = game.physics_query_interface:trace_ray(ray_t(), var_294_7, var_294_8)

					if var_294_9 and var_294_0 > var_294_9.fraction then
						var_294_0 = var_294_9.fraction
						var_294_1 = var_294_9.endpos
						var_294_2 = var_294_7
					end
				end
			end
		end

		if var_294_1 and is_enabled("aa_freestanding_visualize") then
			local var_294_10 = var_294_0 * var_293_5 < var_293_6

			table.insert(slot_0_36_0.aa.fs_hits, {
				kb_ = nil,
				start_p = var_294_2,
				end_p = var_294_1,
				side = arg_294_1,
				active = var_294_10
			})
		end

		return var_294_0 * var_293_5
	end

	local var_293_8 = var_293_7({
		-60,
		-90,
		-120,
		[0] = nil
	}, "Left")
	local var_293_9 = var_293_7({
		60,
		90,
		120,
		[0] = nil
	}, "Right")
	local var_293_10 = var_293_7({
		160,
		180,
		-160,
		[0] = nil
	}, "Back")

	if var_293_8 < var_293_6 or var_293_9 < var_293_6 or var_293_10 < var_293_6 then
		slot_0_36_0.aa.fs_active = true

		if slot_0_36_0.aa_yaw_amount_ctl and slot_0_36_0.aa_yaw_amount_ctl.set_hotkey_state then
			slot_0_36_0.aa_yaw_amount_ctl:set_hotkey_state(true)
		end

		if var_293_10 < var_293_8 and var_293_10 < var_293_9 and var_293_10 < var_293_6 * 0.8 then
			slot_0_29_0.Helpers.SetValue(slot_0_36_0.aa_yaw_amount_ctl, 180)
		elseif var_293_8 < var_293_9 then
			slot_0_29_0.Helpers.SetValue(slot_0_36_0.aa_yaw_amount_ctl, -90)
		else
			slot_0_29_0.Helpers.SetValue(slot_0_36_0.aa_yaw_amount_ctl, 90)
		end
	elseif slot_0_36_0.aa.fs_active then
		if slot_0_36_0.aa_yaw_amount_ctl then
			if slot_0_36_0.aa_yaw_amount_ctl.set_hotkey_state then
				slot_0_36_0.aa_yaw_amount_ctl:set_hotkey_state(false)
			end

			slot_0_29_0.Helpers.SetValue(slot_0_36_0.aa_yaw_amount_ctl, 180)
		end

		slot_0_36_0.aa.fs_active = false
	end
end

function slot_0_125_0(arg_295_0, arg_295_1)
	if not is_enabled("aa_instant_manual") or not arg_295_0 or not arg_295_0:IsAlive() then
		slot_0_36_0.aa_manual_timer = 0
		slot_0_36_0.aa_last_side = 0

		return
	end

	if not slot_0_36_0.aa_yaw_jitter_mode_ctl then
		slot_0_36_0.aa_yaw_jitter_mode_ctl = gui.ctx:find("rage>anti-aim>angles>yaw jitter")
	end

	if not slot_0_36_0.aa_yaw_jitter_amount_ctl then
		slot_0_36_0.aa_yaw_jitter_amount_ctl = gui.ctx:find("rage>anti-aim>angles>yaw jitter>settings>amount")
	end

	if not slot_0_36_0.aa_left_ctl then
		slot_0_36_0.aa_left_ctl = gui.ctx:find("rage>anti-aim>angles>manual override>override left") or gui.ctx:find("rage>anti-aim>angles>override left")
	end

	if not slot_0_36_0.aa_right_ctl then
		slot_0_36_0.aa_right_ctl = gui.ctx:find("rage>anti-aim>angles>manual override>override right") or gui.ctx:find("rage>anti-aim>angles>override right")
	end

	if not slot_0_36_0.aa_yaw_jitter_mode_ctl or not slot_0_36_0.aa_yaw_jitter_amount_ctl then
		return
	end

	local var_295_0 = slot_0_36_0.aa_left_ctl and slot_0_36_0.aa_left_ctl:GetHotkeyState()
	local var_295_1 = slot_0_36_0.aa_right_ctl and slot_0_36_0.aa_right_ctl:GetHotkeyState()
	local var_295_2 = var_295_0 and -1 or var_295_1 and 1 or 0

	if var_295_2 ~= slot_0_36_0.aa_last_side then
		slot_0_36_0.aa_manual_timer = 3

		if var_295_2 ~= 0 then
			slot_0_36_0.aa_manual_pulse_val = var_295_2 * 90
		elseif slot_0_36_0.aa_last_side ~= 0 then
			slot_0_36_0.aa_manual_pulse_val = -(slot_0_36_0.aa_last_side * 90)
		else
			slot_0_36_0.aa_manual_pulse_val = 0
		end

		slot_0_36_0.aa_last_side = var_295_2
	end

	if slot_0_36_0.aa_manual_timer > 0 then
		slot_0_36_0.aa_manual_timer = slot_0_36_0.aa_manual_timer - 1

		slot_0_29_0.Helpers.SetValue(slot_0_36_0.aa_yaw_jitter_mode_ctl, 2)
		slot_0_29_0.Helpers.SetValue(slot_0_36_0.aa_yaw_jitter_amount_ctl, slot_0_36_0.aa_manual_pulse_val or 0)
	else
		slot_0_29_0.Helpers.SetValue(slot_0_36_0.aa_yaw_jitter_mode_ctl, 2)
		slot_0_29_0.Helpers.SetValue(slot_0_36_0.aa_yaw_jitter_amount_ctl, 0)
	end
end

function slot_0_126_0(arg_296_0)
	if not UI.cfg.misc_auto_defuse then
		return
	end

	local var_296_0 = slot_0_36_0.bomb

	if not var_296_0.is_planted or not var_296_0.position then
		return
	end

	local var_296_1 = entities.GetLocalPawn()

	if not var_296_1 or not var_296_1:IsAlive() then
		return
	end

	if (var_296_1.m_iTeamNum and var_296_1.m_iTeamNum:Get() or 0) ~= 3 then
		return
	end

	local var_296_2 = var_296_1:GetAbsOrigin()

	if not var_296_2 then
		return
	end

	if (var_296_0.position - var_296_2):length() <= (UI.cfg.misc_auto_defuse_dist or 100) then
		arg_296_0:SetButton(32)
	end
end

function slot_0_127_0(arg_297_0, arg_297_1)
	if not UI.cfg.misc_landing_autostop then
		slot_0_36_0.landing_stop_tick = 0

		if slot_0_36_0.landing_autostop_override then
			local var_297_0 = gui.ctx:find("misc>movement>slowwalk")
			local var_297_1 = gui.ctx:find("misc>movement>slowwalk speed")

			if var_297_0 and var_297_1 then
				slot_0_29_0.Helpers.SetValue(var_297_0, slot_0_36_0.landing_old_sw_state)
				slot_0_29_0.Helpers.SetValue(var_297_1, slot_0_36_0.landing_old_sw_speed)
			end

			slot_0_36_0.landing_autostop_override = false
		end

		return
	end

	local var_297_2 = arg_297_1.m_fFlags and arg_297_1.m_fFlags:Get() or 0
	local var_297_3 = slot_0_7_0.band(var_297_2, 1) ~= 0
	local var_297_4 = arg_297_0:GetButton(2)

	if var_297_3 and not slot_0_36_0.was_on_ground and not var_297_4 then
		slot_0_36_0.landing_stop_tick = game.globalVars.tick_count + 5
	end

	if slot_0_36_0.landing_stop_tick and game.globalVars.tick_count < slot_0_36_0.landing_stop_tick then
		arg_297_0:SetForwardMove(0)
		arg_297_0:SetLeftMove(0)

		if not slot_0_36_0.edge_stop_sw then
			slot_0_36_0.edge_stop_sw = gui.ctx:find("misc>movement>slowwalk")
		end

		if not slot_0_36_0.edge_stop_sw_speed then
			slot_0_36_0.edge_stop_sw_speed = gui.ctx:find("misc>movement>slowwalk speed")
		end

		if slot_0_36_0.edge_stop_sw and slot_0_36_0.edge_stop_sw_speed then
			if not slot_0_36_0.landing_autostop_override then
				slot_0_36_0.landing_old_sw_state = slot_0_36_0.edge_stop_sw:GetValue():Get()
				slot_0_36_0.landing_old_sw_speed = slot_0_36_0.edge_stop_sw_speed:GetValue():Get()
				slot_0_36_0.landing_autostop_override = true
			end

			slot_0_29_0.Helpers.SetValue(slot_0_36_0.edge_stop_sw, true)
			slot_0_29_0.Helpers.SetValue(slot_0_36_0.edge_stop_sw_speed, 1)
		end
	elseif slot_0_36_0.landing_autostop_override then
		if slot_0_36_0.edge_stop_sw and slot_0_36_0.edge_stop_sw_speed then
			slot_0_29_0.Helpers.SetValue(slot_0_36_0.edge_stop_sw, slot_0_36_0.landing_old_sw_state)
			slot_0_29_0.Helpers.SetValue(slot_0_36_0.edge_stop_sw_speed, slot_0_36_0.landing_old_sw_speed)
		end

		slot_0_36_0.landing_autostop_override = false
	end
end

function slot_0_128_0(arg_298_0)
	if UI.cfg.air_brake then
		slot_298_1_2 = entities.GetLocalPawn()

		if slot_298_1_2 and slot_298_1_2:IsAlive() then
			slot_298_2_10 = slot_298_1_2.m_fFlags and slot_298_1_2.m_fFlags:Get() or 0
			slot_298_3_7 = slot_0_7_0.band(slot_298_2_10, 1) ~= 0
			slot_298_4_8 = arg_298_0:GetForwardMove()
			slot_298_5_7 = arg_298_0:GetLeftMove()
			slot_298_6_7 = slot_298_4_8 == 0 and slot_298_5_7 == 0

			if not slot_298_3_7 and slot_298_6_7 then
				slot_298_7_6 = slot_298_1_2:GetAbsVelocity()

				if math.sqrt(slot_298_7_6.x * slot_298_7_6.x + slot_298_7_6.y * slot_298_7_6.y) > 5 then
					if not slot_0_36_0.air_brake_vars.sw_ref then
						slot_0_36_0.air_brake_vars.sw_ref = gui.ctx:find("misc>movement>slowwalk")
					end

					if not slot_0_36_0.air_brake_vars.sw_speed_ref then
						slot_0_36_0.air_brake_vars.sw_speed_ref = gui.ctx:find("misc>movement>slowwalk speed")
					end

					if slot_0_36_0.air_brake_vars.sw_ref and slot_0_36_0.air_brake_vars.sw_speed_ref then
						if not slot_0_36_0.air_brake_vars.override then
							slot_298_9_6 = slot_0_36_0.air_brake_vars.sw_ref:GetValue()
							slot_298_10_5 = slot_0_36_0.air_brake_vars.sw_speed_ref:GetValue()
							slot_0_36_0.air_brake_vars.old_state = slot_298_9_6 and slot_298_9_6:Get() or false
							slot_0_36_0.air_brake_vars.old_speed = slot_298_10_5 and slot_298_10_5:Get() or 30
							slot_0_36_0.air_brake_vars.override = true
						end

						slot_0_29_0.Helpers.SetValue(slot_0_36_0.air_brake_vars.sw_ref, true)
						slot_0_29_0.Helpers.SetValue(slot_0_36_0.air_brake_vars.sw_speed_ref, 1)
					end
				end
			elseif slot_0_36_0.air_brake_vars.override then
				if slot_0_36_0.air_brake_vars.sw_ref and slot_0_36_0.air_brake_vars.sw_speed_ref then
					slot_0_29_0.Helpers.SetValue(slot_0_36_0.air_brake_vars.sw_ref, slot_0_36_0.air_brake_vars.old_state)
					slot_0_29_0.Helpers.SetValue(slot_0_36_0.air_brake_vars.sw_speed_ref, slot_0_36_0.air_brake_vars.old_speed)
				end

				slot_0_36_0.air_brake_vars.override = false
			end
		end
	elseif slot_0_36_0.air_brake_vars.override then
		if slot_0_36_0.air_brake_vars.sw_ref and slot_0_36_0.air_brake_vars.sw_speed_ref then
			slot_0_29_0.Helpers.SetValue(slot_0_36_0.air_brake_vars.sw_ref, slot_0_36_0.air_brake_vars.old_state)
			slot_0_29_0.Helpers.SetValue(slot_0_36_0.air_brake_vars.sw_speed_ref, slot_0_36_0.air_brake_vars.old_speed)
		end

		slot_0_36_0.air_brake_vars.override = false
	end

	if UI.cfg.jump_circles_enabled then
		slot_298_1_1 = entities.GetLocalPawn()

		if slot_298_1_1 and slot_298_1_1:IsAlive() then
			slot_298_2_9 = slot_298_1_1.m_fFlags and slot_298_1_1.m_fFlags:Get() or 0
			slot_298_3_6 = slot_0_7_0.band(slot_298_2_9, 1) ~= 0
			slot_298_5_6 = slot_298_1_1:GetAbsVelocity().z
			slot_298_6_6 = game.globalVars.m_flRealTime
			slot_298_7_5 = slot_298_1_1:GetAbsOrigin()
			slot_298_8_4 = false

			if slot_0_36_0.last_vel_z < -5 and slot_298_5_6 > 2 then
				slot_298_8_4 = true
			end

			if slot_298_3_6 and not slot_0_36_0.was_on_ground or not slot_298_3_6 and slot_0_36_0.was_on_ground then
				slot_298_8_4 = true
			end

			if slot_298_8_4 then
				slot_298_9_5 = vector(slot_298_7_5.x, slot_298_7_5.y, slot_298_7_5.z + 15)
				slot_298_10_4 = vector(slot_298_7_5.x, slot_298_7_5.y, slot_298_7_5.z - 50)
				slot_298_11_1 = ray_t()
				slot_298_12_6 = game.physics_query_interface:trace_ray(slot_298_11_1, slot_298_9_5, slot_298_10_4)
				slot_298_13_4 = slot_298_12_6.fraction < 1 and slot_298_12_6.endpos or slot_298_7_5
				slot_298_14_4 = slot_0_36_0.jump_circles[#slot_0_36_0.jump_circles]
				slot_298_15_4 = false

				if slot_298_14_4 and (slot_298_13_4.x - slot_298_14_4.pos.x)^2 + (slot_298_13_4.y - slot_298_14_4.pos.y)^2 < 16 and slot_298_6_6 - slot_298_14_4.time < 0.1 then
					slot_298_15_4 = true
				end

				if not slot_298_15_4 then
					table.insert(slot_0_36_0.jump_circles, {
						pos = {
							[0] = nil,
							x = slot_298_13_4.x,
							y = slot_298_13_4.y,
							z = slot_298_13_4.z
						},
						time = slot_298_6_6
					})
				end
			end

			slot_0_36_0.last_vel_z = slot_298_5_6
		end
	end

	if is_enabled("visuals_custom_thirdperson_enabled") then
		if not slot_0_36_0.tp_dist_ctl then
			slot_0_36_0.tp_dist_ctl = gui.ctx:find("visuals>misc>local>thirdperson>settings>distance")
		end

		if slot_0_36_0.tp_dist_ctl then
			slot_0_29_0.Helpers.SetValue(slot_0_36_0.tp_dist_ctl, UI.cfg.visuals_custom_thirdperson_dist)
		end
	end

	if UI.open and arg_298_0.RemoveButton then
		arg_298_0:RemoveButton(1)
	end

	slot_298_1_0 = entities.GetLocalPawn()

	if not slot_298_1_0 or not slot_298_1_0:IsAlive() then
		return
	end

	if is_enabled("ssg_always_scoped") then
		slot_298_2_8 = slot_298_1_0:GetActiveWeapon()

		if (slot_298_2_8 and slot_298_2_8:GetDefIndex() or 0) == 40 then
			slot_298_4_7 = slot_298_1_0.m_bIsScoped and slot_298_1_0.m_bIsScoped:Get() or false
			slot_298_5_5 = game.globalVars.tick_count or 0

			if not slot_298_4_7 then
				if not slot_0_36_0.ssg_scope_retry or slot_298_5_5 > slot_0_36_0.ssg_scope_retry then
					game.engine:ClientCmd("+attack2")

					slot_0_36_0.ssg_scope_release_tick = slot_298_5_5 + 2
					slot_0_36_0.ssg_scope_retry = slot_298_5_5 + 15
				end
			else
				slot_0_36_0.ssg_scope_retry = nil
			end

			if slot_0_36_0.ssg_scope_release_tick and slot_298_5_5 >= slot_0_36_0.ssg_scope_release_tick then
				game.engine:ClientCmd("-attack2")

				slot_0_36_0.ssg_scope_release_tick = nil
			end
		else
			slot_0_36_0.ssg_scope_retry = nil
			slot_0_36_0.ssg_scope_release_tick = nil
		end
	else
		slot_0_36_0.ssg_scope_retry = nil
		slot_0_36_0.ssg_scope_release_tick = nil
	end

	if is_enabled("misc_r8_disable_right") then
		slot_298_2_7 = slot_298_1_0:GetActiveWeapon()

		if slot_298_2_7 and slot_298_2_7:GetDefIndex() == 64 and arg_298_0.RemoveButton then
			arg_298_0:RemoveButton(2048)
		end
	end

	slot_0_125_0(slot_298_1_0, arg_298_0)
	slot_0_124_0(slot_298_1_0, arg_298_0)
	slot_0_101_0(arg_298_0)

	if is_enabled("rage_force_shoot_crouch") then
		if slot_298_1_0 and slot_298_1_0:IsAlive() then
			slot_298_2_6 = slot_298_1_0.m_fFlags and slot_298_1_0.m_fFlags:Get() or slot_298_1_0.m_fFlags and slot_298_1_0.m_fFlags:Get() or 0
			slot_298_3_5 = slot_0_7_0.band(slot_298_2_6, 2) ~= 0
			slot_298_4_6 = gui.ctx:find("rage>aimbot>general>force shoot")

			if slot_298_4_6 then
				if slot_298_3_5 then
					if not slot_0_36_0.rage_fs_crouch_forced then
						slot_298_5_4 = slot_298_4_6:GetValue()

						if slot_298_5_4 and slot_298_5_4.get then
							slot_0_36_0.rage_fs_crouch_old = slot_298_5_4:Get()
						end

						slot_0_36_0.rage_fs_crouch_forced = true
					end

					slot_0_29_0.Helpers.SetValue(slot_298_4_6, true)
				elseif slot_0_36_0.rage_fs_crouch_forced then
					slot_0_29_0.Helpers.SetValue(slot_298_4_6, slot_0_36_0.rage_fs_crouch_old)

					slot_0_36_0.rage_fs_crouch_forced = false
				end
			end
		end
	elseif slot_0_36_0.rage_fs_crouch_forced then
		slot_298_2_5 = gui.ctx:find("rage>aimbot>general>force shoot")

		if slot_298_2_5 then
			slot_0_29_0.Helpers.SetValue(slot_298_2_5, slot_0_36_0.rage_fs_crouch_old)
		end

		slot_0_36_0.rage_fs_crouch_forced = false
	end

	if is_enabled("misc_quick_reload") then
		slot_298_2_4 = entities.GetLocalPawn()

		if slot_298_2_4 and slot_298_2_4:IsAlive() then
			slot_298_3_4 = slot_298_2_4:GetActiveWeapon()

			if slot_298_3_4 then
				slot_298_4_5 = slot_298_3_4:GetData()

				if slot_298_4_5 then
					slot_298_5_3 = slot_298_3_4.m_bInReload:Get()
					slot_298_6_5 = game.globalVars.m_flRealTime
					slot_298_7_4 = slot_298_3_4:GetType()

					if slot_298_5_3 and not slot_0_36_0.qr.was_reloading then
						slot_0_36_0.qr.return_to_slot = slot_298_7_4 == 1 and 2 or 1
					end

					if slot_298_5_3 and (slot_298_3_4.m_iClip1:Get() == slot_298_4_5.m_iMaxClip1:Get() or slot_298_3_4.m_iClip2 and slot_298_3_4.m_iClip2:Get() == 0) and not slot_0_36_0.qr.should_switch then
						game.engine:ClientCmd("slot3")

						slot_0_36_0.qr.switch_time = slot_298_6_5 + slot_0_36_0.qr.qr_delay
						slot_0_36_0.qr.should_switch = true
					end

					slot_0_36_0.qr.was_reloading = slot_298_5_3

					if slot_0_36_0.qr.should_switch and slot_298_6_5 >= slot_0_36_0.qr.switch_time then
						game.engine:ClientCmd("slot" .. slot_0_36_0.qr.return_to_slot)

						slot_0_36_0.qr.should_switch = false
					end
				end
			end
		end
	end

	if is_enabled("rage_knife_dt") then
		slot_298_2_3 = entities.GetLocalPawn()

		if slot_298_2_3 and slot_298_2_3:IsAlive() then
			slot_298_3_3 = slot_298_2_3:GetActiveWeapon()

			if slot_298_3_3 then
				slot_298_5_2 = slot_298_3_3:GetType() == 0
				slot_298_6_4 = gui.ctx:find("rage>aimbot>doubletap")

				if slot_298_6_4 then
					slot_298_6_4:GetValue():Set(slot_298_5_2)
				end
			end
		end
	end

	if slot_0_36_0.quickswitch_tick and game.globalVars.tick_count >= slot_0_36_0.quickswitch_tick then
		game.engine:ClientCmd("slot1")

		if slot_0_36_0.quickswitch_should_rescope then
			slot_0_36_0.quickswitch_rescope_tick = game.globalVars.tick_count + 40
		end

		slot_0_36_0.quickswitch_tick = nil
	end

	if slot_0_36_0.quickswitch_rescope_tick and slot_0_36_0.quickswitch_should_rescope and game.globalVars.tick_count >= slot_0_36_0.quickswitch_rescope_tick then
		slot_298_2_2 = entities.GetLocalPawn()

		if slot_298_2_2 and slot_298_2_2:IsAlive() then
			slot_298_3_2 = slot_298_2_2:GetActiveWeapon()

			if slot_298_3_2 then
				slot_298_4_4 = slot_298_3_2:GetDefIndex()

				if slot_298_4_4 == 40 or slot_298_4_4 == 9 or slot_298_4_4 == 38 or slot_298_4_4 == 11 then
					game.engine:ClientCmd("+attack2")

					slot_0_36_0.quickswitch_rescope_timeout = game.globalVars.tick_count + 3
				end
			end
		end

		slot_0_36_0.quickswitch_rescope_tick = nil
	end

	if slot_0_36_0.quickswitch_rescope_timeout then
		if game.globalVars.tick_count >= slot_0_36_0.quickswitch_rescope_timeout then
			game.engine:ClientCmd("-attack2")

			slot_0_36_0.quickswitch_rescope_timeout = nil
			slot_0_36_0.quickswitch_should_rescope = false
		elseif arg_298_0.SetButton then
			arg_298_0:SetButton(2048)
		end
	end

	if is_enabled("misc_quickladder") then
		slot_298_2_1 = entities.GetLocalPawn()

		if slot_298_2_1 and slot_298_2_1:IsAlive() and (slot_298_2_1.m_fFlags and slot_298_2_1.m_fFlags:Get() or 0) == 65664 then
			slot_298_4_3 = slot_298_2_1:GetAbsVelocity()

			if slot_298_4_3 and math.sqrt(slot_298_4_3.x * slot_298_4_3.x + slot_298_4_3.y * slot_298_4_3.y) < 50 and slot_298_4_3.z > 20 and arg_298_0:GetForwardMove() > 0 then
				slot_298_6_3 = arg_298_0:GetViewangles()

				if slot_298_6_3 then
					arg_298_0:SetViewangles(vector(slot_298_6_3.x - 80, slot_298_6_3.y + 80, slot_298_6_3.z))
					arg_298_0:SetLeftMove(-1)
				end
			end
		end
	end

	slot_298_2_0 = entities.GetLocalPawn()

	if slot_298_2_0 and slot_298_2_0:IsAlive() then
		slot_298_3_1 = slot_298_2_0:GetActiveWeapon()

		if slot_298_3_1 then
			slot_298_4_2 = slot_298_3_1:GetDefIndex()
			slot_298_5_1 = slot_0_29_0.Helpers.GetWeaponData(slot_298_4_2)

			if slot_298_5_1 then
				for iter_298_0, iter_298_1 in ipairs(slot_0_36_0.keybinds.list) do
					if iter_298_1.name == "Hitchance" and slot_298_5_1.hitchance then
						iter_298_1.id = slot_298_5_1.hitchance.id_string
					elseif iter_298_1.name == "Pointscale" and slot_298_5_1.pointscale then
						iter_298_1.id = slot_298_5_1.pointscale.id_string
					elseif iter_298_1.name == "Min Damage" and slot_298_5_1.mindamage then
						iter_298_1.id = slot_298_5_1.mindamage.id_string
					end
				end

				slot_298_6_2 = slot_0_14_0(slot_298_4_2)
				slot_298_7_3 = UI.cfg.acc_ap_enabled_global
				slot_298_8_3 = UI.cfg.acc_dy_hc_enabled_global
				slot_298_9_3 = UI.is_hotkey_active("acc_ap_key_" .. slot_298_6_2, true)
				slot_298_10_2 = UI.is_hotkey_active("acc_dy_hc_key_" .. slot_298_6_2, true)

				if (UI.cfg["acc_ap_enabled_" .. slot_298_6_2] or slot_298_7_3) and slot_298_9_3 and slot_298_5_1.pointscale then
					if slot_0_36_0.acc_cache.ps[slot_298_6_2] == nil then
						slot_0_36_0.acc_cache.ps[slot_298_6_2] = slot_298_5_1.pointscale:GetValue():Get()
					end

					slot_298_12_5 = UI.cfg["acc_ap_max_" .. slot_298_6_2] or slot_298_7_3 and UI.cfg.acc_ap_max_global or 70
					slot_298_13_3 = UI.cfg["acc_ap_inc_" .. slot_298_6_2] or slot_298_7_3 and UI.cfg.acc_ap_inc_global or 50
					slot_298_14_3 = 0.5

					if slot_298_4_2 == 40 then
						slot_298_14_3 = 0.57831001281738
					elseif slot_298_4_2 == 9 then
						slot_298_14_3 = 0.73682999610901
					elseif slot_298_4_2 == 1 then
						slot_298_14_3 = 1
					end

					slot_298_15_3 = slot_298_3_1:GetInaccuracy(0)
					slot_298_16_4 = slot_298_13_3 / 100 * 2
					slot_298_17_3 = math.floor(slot_298_12_5 - slot_298_15_3 / (slot_298_14_3 * slot_298_16_4) * slot_298_12_5)

					slot_0_29_0.Helpers.SetValue(slot_298_5_1.pointscale, math.max(1, slot_298_17_3))
				elseif slot_0_36_0.acc_cache.ps[slot_298_6_2] ~= nil and slot_298_5_1.pointscale then
					slot_0_29_0.Helpers.SetValue(slot_298_5_1.pointscale, slot_0_36_0.acc_cache.ps[slot_298_6_2])

					slot_0_36_0.acc_cache.ps[slot_298_6_2] = nil
				end

				slot_298_12_4 = nil
				slot_298_13_2 = 99999
				slot_298_14_2, slot_298_15_2 = game.engine:GetScreenSize()
				slot_298_16_3 = slot_298_14_2 / 2
				slot_298_17_2 = slot_298_15_2 / 2

				entities.players:for_each(function(arg_299_0)
					local var_299_0 = arg_299_0.entity

					if not var_299_0 or var_299_0 == slot_298_2_0 or not var_299_0:IsEnemy() or not var_299_0:IsAlive() then
						return
					end

					local var_299_1 = var_299_0:GetAbsOrigin()

					if var_299_1 then
						local var_299_2 = math.WorldToScreen(var_299_1)

						if var_299_2 then
							local var_299_3 = var_299_2.x - slot_298_16_3
							local var_299_4 = var_299_2.y - slot_298_17_2
							local var_299_5 = math.sqrt(var_299_3 * var_299_3 + var_299_4 * var_299_4)

							if var_299_5 < 300 and var_299_5 < slot_298_13_2 then
								slot_298_13_2 = var_299_5
								slot_298_12_4 = var_299_0
							end
						end
					end
				end)

				if slot_298_12_4 and slot_298_12_4.get_index then
					slot_0_36_0.acc_last_target_idx = slot_298_12_4:GetIndex()
					slot_0_36_0.acc_last_target_time = game.globalVars.m_flRealTime
				end

				slot_298_18_1 = slot_298_12_4

				if not slot_298_18_1 and slot_0_36_0.acc_last_target_idx ~= -1 then
					slot_298_19_1 = entities.players:GetByIndex(slot_0_36_0.acc_last_target_idx)

					if slot_298_19_1 and slot_298_19_1.IsAlive and slot_298_19_1:IsAlive() and slot_298_19_1:IsEnemy() then
						if game.globalVars.m_flRealTime - (slot_0_36_0.acc_last_target_time or 0) < 0.2 then
							slot_298_18_1 = slot_298_19_1
						end
					else
						slot_0_36_0.acc_last_target_idx = -1
					end
				end

				if (UI.cfg["acc_dy_hc_enabled_" .. slot_298_6_2] or slot_298_8_3) and slot_298_10_2 and slot_298_5_1.hitchance then
					if slot_0_36_0.acc_cache.hc[slot_298_6_2] == nil then
						slot_0_36_0.acc_cache.hc[slot_298_6_2] = slot_298_5_1.hitchance:GetValue():Get()
					end

					slot_298_20_1 = UI.cfg["acc_dy_hc_min_" .. slot_298_6_2] or slot_298_8_3 and UI.cfg.acc_dy_hc_min_global or 30
					slot_298_21_1 = UI.cfg["acc_dy_hc_max_" .. slot_298_6_2] or slot_298_8_3 and UI.cfg.acc_dy_hc_max_global or 85
					slot_298_22_2 = UI.cfg["acc_dy_hc_dist_" .. slot_298_6_2] or slot_298_8_3 and UI.cfg.acc_dy_hc_dist_global or 3000
					slot_298_23_2 = slot_298_20_1

					if slot_298_18_1 then
						slot_298_24_0 = slot_298_2_0:GetAbsOrigin()
						slot_298_25_0 = slot_298_18_1:GetAbsOrigin()

						if slot_298_24_0 and slot_298_25_0 then
							slot_298_26_0 = (slot_298_25_0 - slot_298_24_0):length()
							slot_298_27_0 = math.clamp(slot_298_26_0 / slot_298_22_2, 0, 1)
							slot_298_23_2 = math.floor(slot_298_20_1 + slot_298_27_0 * (slot_298_21_1 - slot_298_20_1))
						end
					end

					if slot_298_3_1:GetInaccuracy(0) > 0.05 then
						slot_298_23_2 = math.max(slot_298_23_2, math.floor(slot_298_20_1 + (slot_298_21_1 - slot_298_20_1) * 0.5))
					end

					slot_0_29_0.Helpers.SetValue(slot_298_5_1.hitchance, math.clamp(slot_298_23_2, 1, 100))
				elseif slot_0_36_0.acc_cache.hc[slot_298_6_2] ~= nil and slot_298_5_1.hitchance then
					slot_0_29_0.Helpers.SetValue(slot_298_5_1.hitchance, slot_0_36_0.acc_cache.hc[slot_298_6_2])

					slot_0_36_0.acc_cache.hc[slot_298_6_2] = nil
				end

				if UI.cfg["acc_lethal_mp_enabled_" .. slot_298_6_2] and slot_298_18_1 and slot_298_5_1.pointscale and slot_0_29_0.Helpers.GetHealth(slot_298_18_1) <= (UI.cfg["acc_lethal_mp_hp_" .. slot_298_6_2] or 30) then
					slot_298_23_1 = UI.cfg["acc_lethal_mp_val_" .. slot_298_6_2] or 80

					slot_0_29_0.Helpers.SetValue(slot_298_5_1.pointscale, slot_298_23_1)
				end

				slot_298_21_0 = UI.cfg["acc_delay_lethal_" .. slot_298_6_2]

				if slot_298_5_1.delay and slot_298_21_0 then
					slot_298_22_1 = 0

					if slot_298_18_1 then
						slot_298_23_0 = slot_0_29_0.Helpers.GetHealth(slot_298_18_1)

						if slot_298_4_2 == 40 then
							slot_298_22_1 = slot_298_23_0 >= 94 and 5 or 0
						else
							slot_298_22_1 = slot_298_23_0 >= 30 and 5 or 0
						end
					end

					slot_0_29_0.Helpers.SetValue(slot_298_5_1.delay, slot_298_22_1)
				end

				if slot_298_5_1.baim then
					slot_298_22_0 = false

					if UI.cfg["acc_baim_hp_enabled_" .. slot_298_6_2] and slot_298_18_1 then
						slot_298_22_0 = slot_0_29_0.Helpers.GetHealth(slot_298_18_1) < (slot_298_4_2 == 40 and 93 or UI.cfg["acc_baim_hp_val_" .. slot_298_6_2] or 0)
					end

					slot_0_29_0.Helpers.SetValue(slot_298_5_1.baim, slot_298_22_0)
				end
			end
		end
	end

	slot_298_3_0 = entities.GetLocalPawn()

	if slot_298_3_0 and slot_298_3_0:IsAlive() then
		slot_298_4_1 = slot_0_7_0.band(slot_298_3_0.m_fFlags:Get(), 1) ~= 0
		slot_298_5_0 = slot_298_3_0:GetAbsVelocity()
		slot_298_6_1 = slot_298_5_0:length_2d()

		if UI.cfg.misc_subtick_autostop and slot_298_4_1 and slot_298_6_1 > 5 then
			slot_298_7_2 = math.rad(arg_298_0:GetViewangles().y)
			slot_298_8_2 = slot_298_5_0.x * math.cos(slot_298_7_2) + slot_298_5_0.y * math.sin(slot_298_7_2)
			slot_298_9_2 = slot_298_5_0.y * math.cos(slot_298_7_2) - slot_298_5_0.x * math.sin(slot_298_7_2)

			arg_298_0:SetForwardMove(-slot_298_8_2 * 2)
			arg_298_0:SetLeftMove(-slot_298_9_2 * 2)
		end

		slot_298_7_1 = false

		if UI.cfg.misc_edge_stop then
			slot_298_8_1 = UI.cfg.misc_edge_stop_key
			slot_298_9_1 = UI.cfg.misc_edge_stop_mode
			slot_298_10_1 = type(slot_298_9_1) == "string" and slot_298_9_1 or ({
				"Hold",
				"Toggle",
				"Always",
				[0] = nil
			})[slot_298_9_1] or "Hold"
			slot_298_11_0 = false

			if not slot_298_8_1 or slot_298_8_1 == 0 then
				slot_298_11_0 = true
			else
				slot_298_12_3 = false
				slot_298_12_2 = get_key_state(slot_298_8_1)

				if slot_298_10_1 == "Always" then
					slot_298_11_0 = true
				elseif slot_298_10_1 == "Hold" then
					slot_298_11_0 = slot_298_12_2
				elseif slot_298_10_1 == "Toggle" then
					if slot_298_12_2 and not slot_0_36_0.edge_stop_vars.last_key_state then
						slot_0_36_0.edge_stop_vars.toggle = not slot_0_36_0.edge_stop_vars.toggle
					end

					slot_298_11_0 = slot_0_36_0.edge_stop_vars.toggle
				end

				slot_0_36_0.edge_stop_vars.last_key_state = slot_298_12_2
			end

			slot_0_36_0.edge_stop_vars.state = slot_298_11_0

			if slot_298_11_0 then
				slot_298_12_1 = game.globalVars and game.globalVars.intervalPerTick or 0.015625
				slot_298_13_1 = slot_298_3_0:GetAbsOrigin()
				slot_298_14_1 = slot_298_5_0:length_2d()

				if not slot_0_36_0.edge_stop_sw then
					slot_0_36_0.edge_stop_sw = gui.ctx:find("misc>movement>slowwalk")
				end

				if not slot_0_36_0.edge_stop_sw_speed then
					slot_0_36_0.edge_stop_sw_speed = gui.ctx:find("misc>movement>slowwalk speed")
				end

				slot_298_15_1 = false

				if slot_298_4_1 and slot_298_14_1 > 5 then
					slot_298_16_2 = vector(slot_298_13_1.x + slot_298_5_0.x * slot_298_12_1 * 3.5, slot_298_13_1.y + slot_298_5_0.y * slot_298_12_1 * 3.5, slot_298_13_1.z + slot_298_5_0.z * slot_298_12_1 * 3.5)
					slot_298_17_1 = ray_t()
					slot_298_18_0 = game.physics_query_interface:trace_ray(slot_298_17_1, slot_298_16_2 + vector(0, 0, 10), slot_298_16_2 - vector(0, 0, 60))

					if not slot_298_18_0 or slot_298_18_0.fraction >= 1 then
						slot_298_7_1 = true
					else
						slot_298_19_0 = vector(slot_298_13_1.x + slot_298_5_0.x * slot_298_12_1 * 18, slot_298_13_1.y + slot_298_5_0.y * slot_298_12_1 * 18, slot_298_13_1.z + slot_298_5_0.z * slot_298_12_1 * 18)
						slot_298_20_0 = game.physics_query_interface:trace_ray(slot_298_17_1, slot_298_19_0 + vector(0, 0, 10), slot_298_19_0 - vector(0, 0, 60))

						if not slot_298_20_0 or slot_298_20_0.fraction >= 1 then
							slot_298_15_1 = true
						end
					end
				end

				if slot_298_7_1 then
					arg_298_0:SetForwardMove(0)
					arg_298_0:SetLeftMove(0)

					if arg_298_0.RemoveButton then
						arg_298_0:RemoveButton(2)
					end
				end

				if slot_0_36_0.edge_stop_sw and slot_0_36_0.edge_stop_sw_speed then
					if slot_298_15_1 or slot_298_7_1 then
						if not slot_0_36_0.edge_stop_override then
							slot_298_16_1 = slot_0_36_0.edge_stop_sw:GetValue()
							slot_298_17_0 = slot_0_36_0.edge_stop_sw_speed:GetValue()
							slot_0_36_0.edge_stop_old_state = slot_298_16_1 and slot_298_16_1:Get() or false
							slot_0_36_0.edge_stop_old_speed = slot_298_17_0 and slot_298_17_0:Get() or 30
							slot_0_36_0.edge_stop_override = true
						end

						slot_0_29_0.Helpers.SetValue(slot_0_36_0.edge_stop_sw, true)
						slot_0_29_0.Helpers.SetValue(slot_0_36_0.edge_stop_sw_speed, slot_298_7_1 and 1 or 12)
					elseif slot_0_36_0.edge_stop_override then
						slot_0_29_0.Helpers.SetValue(slot_0_36_0.edge_stop_sw, slot_0_36_0.edge_stop_old_state)
						slot_0_29_0.Helpers.SetValue(slot_0_36_0.edge_stop_sw_speed, slot_0_36_0.edge_stop_old_speed)

						slot_0_36_0.edge_stop_override = false
					end
				end
			end
		end
	end

	slot_0_109_0(arg_298_0)
	slot_0_126_0(arg_298_0)
	slot_0_127_0(arg_298_0, slot_298_3_0)

	if is_enabled("aa_suppress_breathing") then
		slot_298_4_0 = entities.GetLocalPawn()

		if slot_298_4_0 and slot_298_4_0:IsAlive() then
			slot_298_6_0 = slot_298_4_0:GetAbsVelocity():length_2d()
			slot_298_7_0 = slot_298_4_0.m_fFlags:Get()
			slot_298_8_0 = slot_0_7_0.band(slot_298_7_0, 1) ~= 0
			slot_298_9_0 = slot_0_7_0.band(slot_298_7_0, 2) ~= 0
			slot_298_10_0 = arg_298_0:GetViewangles().y

			if math.abs(slot_298_10_0 - slot_0_36_0.last_sup_yaw) > 1 then
				slot_0_36_0.last_sup_tick = game.globalVars.tick_count
			end

			slot_0_36_0.last_sup_yaw = slot_298_10_0
			slot_298_12_0 = game.globalVars.tick_count - (slot_0_36_0.last_sup_tick or 0) > 24
			slot_298_13_0 = arg_298_0:GetButton(1) or arg_298_0:GetButton(2048) or arg_298_0:GetButton(32) or arg_298_0:GetButton(8) or arg_298_0:GetButton(16) or arg_298_0:GetButton(512) or arg_298_0:GetButton(1024) or arg_298_0:GetButton(2)

			if slot_298_8_0 and slot_298_6_0 < 2 and slot_298_12_0 and not slot_298_13_0 then
				slot_298_14_0 = arg_298_0:GetForwardMove()
				slot_298_15_0 = arg_298_0:GetLeftMove()

				if math.abs(slot_298_14_0) < 0.1 and math.abs(slot_298_15_0) < 0.1 then
					slot_0_36_0.active = true
					slot_298_16_0 = slot_298_9_0 and 0.015 or 0.005

					if not slot_0_36_0.breathing_acc then
						slot_0_36_0.breathing_acc = 0
					end

					if slot_0_36_0.breathing_acc == 0 then
						arg_298_0:SetForwardMove(slot_298_16_0)

						slot_0_36_0.breathing_acc = 1
					else
						arg_298_0:SetForwardMove(-slot_298_16_0)

						slot_0_36_0.breathing_acc = 0
					end
				else
					slot_0_36_0.active = false
				end
			else
				slot_0_36_0.active = false
			end
		end
	end

	if slot_298_3_0 and slot_298_3_0:IsAlive() then
		slot_0_36_0.was_on_ground = slot_0_7_0.band(slot_298_3_0.m_fFlags:Get(), 1) ~= 0
	end
end

if events and events.presentQueue then
	events.presentQueue:Add(slot_0_121_0)
end

if events and events.event then
	events.event:Add(slot_0_108_0)
end

if events and events.createMove then
	events.createMove:Add(slot_0_128_0)
end

if mods and mods.events then
	mods.events:AddListener("player_death")
	mods.events:AddListener("player_hurt")
	mods.events:AddListener("weapon_fire")
	mods.events:AddListener("bullet_impact")
	mods.events:AddListener("round_start")
	mods.events:AddListener("round_end")
	mods.events:AddListener("round_freeze_end")
	mods.events:AddListener("aimbot_miss")
	mods.events:AddListener("inferno_startburn")
	mods.events:AddListener("inferno_expire")
	mods.events:AddListener("smokegrenade_detonate")
	mods.events:AddListener("smokegrenade_expired")
end

slot_0_129_0 = {
	"rage>anti-aim>angles>anti-aim",
	"rage>anti-aim>enabled",
	"rage>anti-aim>active",
	"rage>anti-aim>angles>enabled",
	"rage>anti-aim>angles>active",
	"rage>anti-aim>angles>master",
	"rage>anti-aim>angles",
	"rage>anti-aim>main>enabled",
	"rage>anti-aim>general>enabled",
	"aimbot>anti-aim>enabled",
	"aimbot>anti-aim>active",
	[0] = nil
}
slot_0_130_0 = false
slot_0_131_0 = false
slot_0_132_0 = nil
slot_0_133_0 = 0
slot_0_134_0 = nil
slot_0_135_0 = nil
slot_0_136_0 = nil
slot_0_137_0 = nil
slot_0_138_0 = nil
slot_0_139_0 = nil
slot_0_140_0 = nil
slot_0_141_0 = nil
slot_0_142_0 = nil

function slot_0_143_0()
	if not slot_0_134_0 then
		for iter_300_0, iter_300_1 in ipairs(slot_0_129_0) do
			local var_300_0 = gui.ctx:find(iter_300_1)

			if var_300_0 then
				slot_0_134_0 = var_300_0

				break
			end
		end
	end

	if not slot_0_135_0 then
		local var_300_1 = gui.ctx:find("rage>anti-aim>angles>pitch")

		if var_300_1 then
			slot_0_135_0 = var_300_1
		end
	end

	if not slot_0_140_0 then
		local var_300_2 = gui.ctx:find("rage>anti-aim>angles>spin")

		if var_300_2 then
			slot_0_140_0 = var_300_2
		end
	end

	if not slot_0_137_0 then
		slot_0_137_0 = gui.ctx:find("misc>extra>untrusted features")
	end

	if not slot_0_136_0 then
		slot_0_136_0 = gui.ctx:find("rage>anti-aim>angles>pitch>settings>value")
	end

	if not slot_0_138_0 then
		slot_0_138_0 = gui.ctx:find("rage>anti-aim>angles>hide shot")
	end

	if not slot_0_139_0 then
		slot_0_139_0 = gui.ctx:find("rage>aimbot>general>aimbot")
	end

	if not slot_0_141_0 then
		slot_0_141_0 = gui.ctx:find("rage>anti-aim>angles>yaw>settings>amount")
	end

	if not slot_0_142_0 then
		slot_0_142_0 = gui.ctx:find("rage>anti-aim>angles>add")
	end
end

function slot_0_144_0()
	if not is_enabled("aa_freestanding") or not is_enabled("aa_freestanding_visualize") then
		return
	end

	if not slot_0_36_0.aa or not slot_0_36_0.aa.fs_hits then
		return
	end

	local var_301_0 = entities.GetLocalPawn()

	if not var_301_0 or not var_301_0:IsAlive() then
		return
	end

	for iter_301_0, iter_301_1 in ipairs(slot_0_36_0.aa.fs_hits) do
		if iter_301_1.start_p and iter_301_1.end_p then
			local var_301_1 = math.WorldToScreen(iter_301_1.start_p)
			local var_301_2 = math.WorldToScreen(iter_301_1.end_p)

			if var_301_1 and var_301_2 then
				local var_301_3 = iter_301_1.active and 200 or 40
				local var_301_4 = draw.Color(255, 255, 255, var_301_3)

				if iter_301_1.side == "Left" then
					var_301_4 = draw.Color(255, 50, 50, var_301_3)
				elseif iter_301_1.side == "Right" then
					var_301_4 = draw.Color(50, 255, 50, var_301_3)
				elseif iter_301_1.side == "Back" then
					var_301_4 = draw.Color(50, 50, 255, var_301_3)
				end

				draw.surface:AddLine(var_301_1, var_301_2, var_301_4, iter_301_1.active and 2 or 1)
				draw.surface:AddCircleFilled(var_301_2, iter_301_1.active and 3 or 1, var_301_4)
			end
		end
	end
end

events.presentQueue:Add(slot_0_144_0)

function slot_0_145_0(arg_302_0, arg_302_1)
	if not arg_302_0 or not arg_302_0.GetValue then
		return
	end

	local var_302_0 = arg_302_0:GetValue()

	if not var_302_0 then
		return
	end

	local var_302_1 = var_302_0:Get()

	if type(var_302_1) == "userdata" and var_302_1.set_raw then
		var_302_1:set_raw(arg_302_1)
		var_302_0:Set(var_302_1)
	else
		var_302_0:Set(arg_302_1)
	end
end

function slot_0_146_0()
	slot_0_143_0()

	if not UI or not UI.cfg then
		return
	end

	local var_303_0 = UI.cfg.aa_victory_mode or "Disable"
	local var_303_1 = type(var_303_0) == "string" and var_303_0 or ({
		"Disable",
		"Spin",
		[0] = nil
	})[var_303_0] or "Disable"
	local var_303_2 = {
		None = 1,
		Down = 2,
		Up = 4,
		Zero = 8,
		Random = 16
	}
	local var_303_3 = UI.cfg.aa_default_pitch or "Down"
	local var_303_4 = type(var_303_3) == "string" and var_303_3 or ({
		"None",
		"Down",
		"Up",
		"Zero",
		"Random",
		[0] = nil
	})[var_303_3] or "Down"
	local var_303_5 = var_303_2[var_303_4]

	if not var_303_5 and type(var_303_4) == "number" then
		var_303_5 = var_303_4
	end

	var_303_5 = var_303_5 or 2

	if not slot_0_134_0 and (is_enabled("aa_disable_round_end") or is_enabled("aa_disable_no_enemies") or is_enabled("aa_fake_pitch")) then
		local var_303_6 = game.globalVars and game.globalVars.m_flRealTime or 0

		if var_303_6 > slot_0_133_0 + 15 then
			notify("AA Module: Master switch not found!", "error")

			slot_0_133_0 = var_303_6
		end

		return
	end

	local var_303_7 = false

	if is_enabled("aa_disable_round_end") and slot_0_36_0.round_ended then
		var_303_7 = true
	end

	if not var_303_7 and is_enabled("aa_disable_no_enemies") then
		local var_303_8 = 0
		local var_303_9 = entities.GetLocalPawn()

		if var_303_9 and var_303_9:IsAlive() then
			entities.players:for_each(function(arg_304_0)
				local var_304_0 = arg_304_0.entity

				if var_304_0 and var_304_0:IsAlive() and var_304_0:IsEnemy() then
					var_303_8 = var_303_8 + 1
				end
			end)

			if var_303_8 == 0 then
				var_303_7 = true
			end
		end
	end

	if slot_0_134_0 then
		local var_303_10 = slot_0_134_0:GetValue()
		local var_303_11 = is_enabled("aa_pitch_on_shot") and game.globalVars.m_flRealTime < (slot_0_36_0.aa.pitch_timer or 0)

		if var_303_7 or var_303_11 then
			if slot_0_132_0 == nil and slot_0_135_0 then
				local var_303_12 = slot_0_135_0:GetValue()

				if var_303_12 then
					local var_303_13 = var_303_12:Get()

					if var_303_13 and type(var_303_13) == "userdata" and var_303_13.get_raw then
						slot_0_132_0 = var_303_13:get_raw()
					elseif type(var_303_13) == "number" then
						slot_0_132_0 = var_303_13
					end
				end
			end

			if var_303_11 then
				if slot_0_135_0 then
					local var_303_14 = game.globalVars.tick_count % 2 == 0 and 4 or 8

					slot_0_145_0(slot_0_135_0, var_303_14)
				end

				slot_0_36_0.aa.was_shot_pitch = true
			elseif var_303_1 == "Disable" then
				slot_0_145_0(slot_0_134_0, false)

				slot_0_130_0 = true
			elseif var_303_1 == "Spin" then
				slot_0_145_0(slot_0_134_0, true)

				if slot_0_140_0 then
					slot_0_145_0(slot_0_140_0, true)

					slot_0_131_0 = true
				end

				if slot_0_135_0 then
					slot_0_145_0(slot_0_135_0, var_303_5)
				end
			end
		else
			if slot_0_36_0.aa.was_shot_pitch then
				if slot_0_135_0 then
					slot_0_145_0(slot_0_135_0, 2)

					slot_0_132_0 = nil
				end

				slot_0_36_0.aa.was_shot_pitch = false
			end

			if slot_0_130_0 then
				slot_0_145_0(slot_0_134_0, true)

				if slot_0_135_0 and slot_0_132_0 ~= nil then
					slot_0_145_0(slot_0_135_0, slot_0_132_0)

					slot_0_132_0 = nil
				end

				slot_0_130_0 = false
			end

			if slot_0_131_0 then
				if slot_0_140_0 then
					slot_0_145_0(slot_0_140_0, false)
				end

				if slot_0_135_0 and slot_0_132_0 ~= nil then
					slot_0_145_0(slot_0_135_0, slot_0_132_0)

					slot_0_132_0 = nil
				end

				slot_0_131_0 = false
			end
		end
	end
end

events.presentQueue:Add(slot_0_146_0)

function slot_0_147_0()
	if not is_enabled("visuals_lefthand_knife") then
		if slot_0_36_0.current_hand_state ~= -1 then
			game.engine:ClientCmd("switchhandsright")

			slot_0_36_0.current_hand_state = -1
		end

		return
	end

	if not entities or not entities.GetLocalPawn then
		return
	end

	local var_305_0 = entities.GetLocalPawn()

	if not var_305_0 or not var_305_0:IsAlive() then
		return
	end

	local var_305_1 = var_305_0:GetActiveWeapon()

	if not var_305_1 then
		return
	end

	local var_305_2 = (UI.cfg.misc_knife_main_hand or "Right") == "Right"
	local var_305_3 = false

	if var_305_1.get_type then
		var_305_3 = var_305_1:GetType() == 0
	end

	if var_305_3 then
		local var_305_4 = var_305_2 and 1 or 0

		if slot_0_36_0.current_hand_state ~= var_305_4 then
			game.engine:ClientCmd(var_305_4 == 1 and "switchhandsleft" or "switchhandsright")

			slot_0_36_0.current_hand_state = var_305_4
		end
	else
		local var_305_5 = var_305_2 and 0 or 1

		if slot_0_36_0.current_hand_state ~= var_305_5 then
			game.engine:ClientCmd(var_305_5 == 1 and "switchhandsleft" or "switchhandsright")

			slot_0_36_0.current_hand_state = var_305_5
		end
	end
end

events.presentQueue:Add(slot_0_147_0)

function slot_0_148_0(arg_306_0)
	if not is_enabled("visualize_fakeduck") or not game.engine:InGame() then
		return
	end

	local var_306_0 = entities.GetLocalPawn()

	if not var_306_0 or not var_306_0:IsAlive() then
		return
	end

	local var_306_1 = var_306_0.m_fFlags and var_306_0.m_fFlags:Get() or 0
	local var_306_2 = slot_0_7_0.band(var_306_1, 1) ~= 0
	local var_306_3

	var_306_3 = slot_0_7_0.band(var_306_1, 2) ~= 0

	if var_306_2 then
		local var_306_4 = false
		local var_306_5 = gui.ctx:find("misc>movement>duck peek assist")

		if var_306_5 and var_306_5.GetHotkeyState then
			var_306_4 = var_306_5:GetHotkeyState()
		end

		if var_306_4 then
			local var_306_6 = UI.cfg.fakeduck_speed or 14

			arg_306_0.origin.z = arg_306_0.origin.z - 4 * math.sin(game.globalVars.m_flRealTime * var_306_6)
		end
	end
end

if events then
	if events.presentQueue then
		events.presentQueue:Add(slot_0_147_0)

		if not UI.rpc_client and slot_0_37_0 and slot_0_37_0.RPC then
			UI.rpc_client = slot_0_37_0.RPC.new("1275628543886495764")

			UI.rpc_client:connect()
		end

		events.presentQueue:Add(function()
			if UI.last_rpc_update == nil then
				UI.last_rpc_update = 0
			end

			local var_307_0 = game.globalVars.m_flRealTime

			if var_307_0 - UI.last_rpc_update > 5 and UI.rpc_client then
				UI.last_rpc_update = var_307_0

				local var_307_1 = game.engine:GetLevelNameShort() or "MainMenu"
				local var_307_2 = game.engine:InGame()
				local var_307_3 = var_307_2 and "Playing " .. var_307_1 or "In Main Menu"
				local var_307_4 = var_307_2 and "Competitive" or "Idle"

				UI.rpc_client:set_activity({
					[0] = nil,
					state = var_307_3,
					details = var_307_4,
					assets = {
						small_text = "CS2",
						large_text = "Silentium Cheats",
						large_image = "silentium_logo",
						small_image = "cs2_logo",
						[0] = nil
					},
					timestamps = {
						["sol._3RS.user"] = nil,
						start = UI.rpc_start_time or utils.get_unix_time()
					}
				})

				if not UI.rpc_start_time then
					UI.rpc_start_time = utils.get_unix_time()
				end
			end
		end)
	end

	if events.override_view then
		events.override_view:Add(slot_0_148_0)
	end

	if events.event then
		events.event:Add(slot_0_108_0)
	end
end

if game.globalVars then
	slot_0_36_0.session_start_time = game.globalVars.m_flRealTime
end

slot_0_149_0 = {
	active = false,
	timer = 0,
	index = 1,
	state = 0,
	[0] = nil,
	last_keys = {
		he = false,
		all = false,
		smoke = false,
		molly = false
	},
	active_sequence = {},
	items = {
		he = {
			label = "HE",
			slot = 6,
			cfg = "misc_drop_he",
			[0] = nil
		},
		molly = {
			label = "Molly",
			slot = 10,
			cfg = "misc_drop_molly",
			["sol.xt{S"] = nil
		},
		smoke = {
			label = "Smoke",
			slot = 8,
			cfg = "misc_drop_smoke",
			[0] = nil
		}
	}
}

function slot_0_149_0.run()
	if not UI.cfg.misc_drop_nades then
		slot_0_149_0.active = false
		slot_0_149_0.state = 0

		return
	end

	local var_308_0 = entities.GetLocalPawn()

	if not var_308_0 or not var_308_0:IsAlive() then
		slot_0_149_0.active = false
		slot_0_149_0.state = 0

		return
	end

	local function var_308_1(arg_309_0)
		local var_309_0 = UI.cfg[arg_309_0] or 0

		return var_309_0 > 0 and get_key_state(var_309_0) or false
	end

	local var_308_2 = {
		all = var_308_1("misc_drop_all_key"),
		he = var_308_1("misc_drop_he_key"),
		molly = var_308_1("misc_drop_molly_key"),
		smoke = var_308_1("misc_drop_smoke_key")
	}

	local function var_308_3(arg_310_0)
		slot_0_149_0.active = true
		slot_0_149_0.state = 1
		slot_0_149_0.index = 1
		slot_0_149_0.timer = 0
		slot_0_149_0.active_sequence = arg_310_0
	end

	if var_308_2.all and not slot_0_149_0.last_keys.all then
		var_308_3({
			slot_0_149_0.items.he,
			slot_0_149_0.items.molly,
			slot_0_149_0.items.smoke
		})
	elseif var_308_2.he and not slot_0_149_0.last_keys.he then
		var_308_3({
			slot_0_149_0.items.he
		})
	elseif var_308_2.molly and not slot_0_149_0.last_keys.molly then
		var_308_3({
			slot_0_149_0.items.molly
		})
	elseif var_308_2.smoke and not slot_0_149_0.last_keys.smoke then
		var_308_3({
			slot_0_149_0.items.smoke
		})
	end

	slot_0_149_0.last_keys = var_308_2

	if not slot_0_149_0.active then
		return
	end

	local var_308_4 = game.globalVars.m_flRealTime

	if var_308_4 < slot_0_149_0.timer then
		return
	end

	if slot_0_149_0.index > #slot_0_149_0.active_sequence then
		slot_0_149_0.active = false
		slot_0_149_0.state = 0

		return
	end

	local var_308_5 = slot_0_149_0.active_sequence[slot_0_149_0.index]

	if slot_0_149_0.state == 1 then
		local var_308_6 = true

		if #slot_0_149_0.active_sequence > 1 then
			var_308_6 = UI.cfg[var_308_5.cfg]

			if var_308_6 == nil then
				var_308_6 = true
			end
		end

		if var_308_6 then
			game.engine:ClientCmd("slot" .. var_308_5.slot)

			slot_0_149_0.state = 2
			slot_0_149_0.timer = var_308_4 + 0.1
		else
			slot_0_149_0.index = slot_0_149_0.index + 1
			slot_0_149_0.timer = var_308_4 + 0.05
		end
	elseif slot_0_149_0.state == 2 then
		game.engine:ClientCmd("drop")

		slot_0_149_0.state = 1
		slot_0_149_0.index = slot_0_149_0.index + 1
		slot_0_149_0.timer = var_308_4 + 0.15
	end
end

if events and events.presentQueue then
	events.presentQueue:Add(slot_0_149_0.run)
end

slot_0_150_0 = {}

function slot_0_150_0.run()
	if not UI.cfg.custom_scope then
		return
	end

	local var_311_0 = entities.GetLocalPawn()

	if not var_311_0 or not var_311_0:IsAlive() then
		return
	end

	local var_311_1 = var_311_0.m_bIsScoped and var_311_0.m_bIsScoped:Get() or false

	if not var_311_1 and (not slot_0_150_0.anim_val or slot_0_150_0.anim_val < 0.01) then
		return
	end

	local var_311_2, var_311_3 = slot_0_9_0()
	local var_311_4 = math.floor(var_311_2 * 0.5)
	local var_311_5 = math.floor(var_311_3 * 0.5)
	local var_311_6 = draw.surface
	local var_311_7 = UI.cfg.scope_gap or 0
	local var_311_8 = UI.cfg.scope_length or 0
	local var_311_9 = UI.cfg.scope_thickness or 1
	local var_311_10 = UI.cfg.scope_rotation or 0
	local var_311_11 = UI.cfg.scope_t_style
	local var_311_12 = UI.cfg.scope_invert
	local var_311_13 = UI.cfg.scope_animation
	local var_311_14 = UI.cfg.scope_auto_rotate
	local var_311_15 = UI.cfg.scope_line_color or {
		0,
		0,
		0,
		255,
		[0] = nil
	}
	local var_311_16 = UI.cfg.scope_line_color_2 or {
		255,
		255,
		255,
		255,
		[0] = nil
	}
	local var_311_17 = slot_0_41_0(var_311_15)
	local var_311_18 = slot_0_41_0(var_311_16)

	if not slot_0_150_0.anim_val then
		slot_0_150_0.anim_val = 0
	end

	local var_311_19 = var_311_1 and 1 or 0

	slot_0_150_0.anim_val = slot_0_150_0.anim_val + (var_311_19 - slot_0_150_0.anim_val) * (game.globalVars.m_flRenderFrameTime * 15)

	if slot_0_150_0.anim_val < 0.01 and not var_311_1 then
		return
	end

	local var_311_20 = math.max(0, math.min(1, slot_0_150_0.anim_val))
	local var_311_21 = var_311_15[1]
	local var_311_22 = var_311_15[2]
	local var_311_23 = var_311_15[3]
	local var_311_24 = math.floor(var_311_15[4] * var_311_20)
	local var_311_25 = var_311_16[1]
	local var_311_26 = var_311_16[2]
	local var_311_27 = var_311_16[3]
	local var_311_28 = math.floor(var_311_16[4] * var_311_20)
	local var_311_29 = 0

	if var_311_13 then
		var_311_29 = -((1 - slot_0_150_0.anim_val) * var_311_7)
	end

	if var_311_14 then
		var_311_10 = var_311_10 + game.globalVars.m_flRealTime * 50 % 360
	end

	local var_311_30 = math.rad(var_311_10)
	local var_311_31 = math.cos(var_311_30)
	local var_311_32 = math.sin(var_311_30)

	local function var_311_33(arg_312_0, arg_312_1)
		return arg_312_0 * var_311_31 - arg_312_1 * var_311_32 + var_311_4, arg_312_0 * var_311_32 + arg_312_1 * var_311_31 + var_311_5
	end

	local function var_311_34(arg_313_0, arg_313_1, arg_313_2, arg_313_3)
		local var_313_0 = 15
		local var_313_1 = var_311_9 / 2
		local var_313_2 = arg_313_1 > 0 and arg_313_1 or (arg_313_2 and var_311_3 / 2 or var_311_2 / 2) - arg_313_0

		if var_313_2 <= 0 then
			return
		end

		local var_313_3 = var_313_2 / var_313_0

		for iter_313_0 = 0, var_313_0 - 1 do
			local var_313_4 = iter_313_0 / var_313_0
			local var_313_5 = (iter_313_0 + 1) / var_313_0
			local var_313_6 = arg_313_0 + var_313_4 * var_313_2
			local var_313_7 = arg_313_0 + var_313_5 * var_313_2
			local var_313_8 = var_311_25 + (var_311_21 - var_311_25) * var_313_4
			local var_313_9 = var_311_26 + (var_311_22 - var_311_26) * var_313_4
			local var_313_10 = var_311_27 + (var_311_23 - var_311_27) * var_313_4
			local var_313_11 = var_311_28 + (var_311_24 - var_311_28) * var_313_4
			local var_313_12 = draw.Color(math.floor(var_313_8), math.floor(var_313_9), math.floor(var_313_10), math.floor(var_313_11))
			local var_313_13 = arg_313_3 and -var_313_6 or var_313_6
			local var_313_14 = arg_313_3 and -var_313_7 or var_313_7
			local var_313_15
			local var_313_16
			local var_313_17
			local var_313_18
			local var_313_19
			local var_313_20
			local var_313_21
			local var_313_22

			if not arg_313_2 then
				var_313_15, var_313_16 = var_313_13, -var_313_1
				var_313_17, var_313_18 = var_313_14, -var_313_1
				var_313_19, var_313_20 = var_313_14, var_313_1
				var_313_21, var_313_22 = var_313_13, var_313_1
			else
				var_313_15, var_313_16 = -var_313_1, var_313_13
				var_313_17, var_313_18 = -var_313_1, var_313_14
				var_313_19, var_313_20 = var_313_1, var_313_14
				var_313_21, var_313_22 = var_313_1, var_313_13
			end

			local var_313_23, var_313_24 = var_311_33(var_313_15, var_313_16)
			local var_313_25, var_313_26 = var_311_33(var_313_17, var_313_18)
			local var_313_27, var_313_28 = var_311_33(var_313_19, var_313_20)
			local var_313_29, var_313_30 = var_311_33(var_313_21, var_313_22)

			var_311_6:AddTriangleFilled(draw.Vec2(var_313_23, var_313_24), draw.Vec2(var_313_25, var_313_26), draw.Vec2(var_313_27, var_313_28), var_313_12)
			var_311_6:AddTriangleFilled(draw.Vec2(var_313_23, var_313_24), draw.Vec2(var_313_27, var_313_28), draw.Vec2(var_313_29, var_313_30), var_313_12)
		end
	end

	local var_311_35 = var_311_7 + var_311_29

	if var_311_35 < 0 then
		var_311_35 = 0
	end

	var_311_34(var_311_35, var_311_8, false, false)
	var_311_34(var_311_35, var_311_8, false, true)
	var_311_34(var_311_35, var_311_8, true, false)

	if not var_311_11 then
		var_311_34(var_311_35, var_311_8, true, true)
	end
end

if events and events.presentQueue then
	events.presentQueue:Add(slot_0_150_0.run)
end

slot_0_151_0 = {
	jump = false,
	duck_ticks = 0,
	duck = false
}

function slot_0_151_0.run(arg_314_0)
	local var_314_0 = entities.GetLocalPawn()

	if not var_314_0 or not var_314_0:IsAlive() then
		return
	end

	if not UI.cfg.safe_head then
		slot_0_151_0.jump = arg_314_0:GetButton(2)
		slot_0_151_0.duck = false
		slot_0_151_0.duck_ticks = 0

		return
	end

	local var_314_1 = var_314_0.m_fFlags:Get()
	local var_314_2 = slot_0_7_0.band(var_314_1, 1) ~= 0
	local var_314_3 = arg_314_0:GetButton(2)

	if var_314_2 then
		if not slot_0_151_0.jump and var_314_3 and not slot_0_151_0.duck then
			slot_0_151_0.duck = true
			slot_0_151_0.duck_ticks = 0

			arg_314_0:RemoveButton(2)
			arg_314_0:SetButton(4)
		elseif slot_0_151_0.duck then
			if slot_0_151_0.duck_ticks < 4 then
				arg_314_0:SetButton(4)
				arg_314_0:RemoveButton(2)

				slot_0_151_0.duck_ticks = slot_0_151_0.duck_ticks + 1
			else
				arg_314_0:SetButton(2)
				arg_314_0:SetButton(4)

				slot_0_151_0.duck = false
			end
		end
	else
		slot_0_151_0.duck = false
		slot_0_151_0.duck_ticks = 0
	end

	slot_0_151_0.jump = var_314_3
end

if events and events.createMove then
	events.createMove:Add(function(arg_315_0)
		slot_0_101_0(arg_315_0)
		slot_0_151_0.run(arg_315_0)

		if slot_0_96_0 and slot_0_96_0.run_move then
			slot_0_96_0.run_move(arg_315_0)
		end
	end)
end

function slot_0_152_0()
	slot_0_36_0.bomb.is_planted = false
	slot_0_36_0.bomb.is_defusing = false
	slot_0_36_0.bomb.is_defused = false
	slot_0_36_0.bomb.is_exploded = false
	slot_0_36_0.bomb.is_planting = false
	slot_0_36_0.bomb.position = nil
	slot_0_36_0.bomb.plant_site = nil
	slot_0_36_0.bomb.plant_time = 0
	slot_0_36_0.bomb.defuse_start_time = 0
	slot_0_36_0.bomb.defuse_duration = 0
end

function slot_0_153_0(arg_317_0)
	local var_317_0 = arg_317_0:GetName()
	local var_317_1 = slot_0_36_0.bomb

	if var_317_0 == "bomb_beginplant" then
		var_317_1.is_planting = true
		var_317_1.plant_start_time = game.globalVars.m_flRealTime
	elseif var_317_0 == "bomb_abortplant" then
		var_317_1.is_planting = false
	elseif var_317_0 == "bomb_planted" then
		var_317_1.is_planting = false
		var_317_1.is_planted = true
		var_317_1.plant_site = arg_317_0:GetInt("site")
		var_317_1.plant_time = game.globalVars.m_flRealTime

		local var_317_2 = arg_317_0:GetPawnFromId("userid")

		if var_317_2 then
			var_317_1.position = var_317_2:GetAbsOrigin()
		end
	elseif var_317_0 == "bomb_begindefuse" then
		var_317_1.is_defusing = true
		var_317_1.defuse_start_time = game.globalVars.m_flRealTime
		var_317_1.defuse_duration = arg_317_0:GetBool("haskit") and 5 or 10
	elseif var_317_0 == "bomb_abortdefuse" then
		var_317_1.is_defusing = false
	elseif var_317_0 == "bomb_defused" or var_317_0 == "bomb_exploded" then
		slot_0_152_0()
	elseif var_317_0 == "round_start" or var_317_0 == "round_prestart" then
		slot_0_152_0()
	end
end

function slot_0_154_0()
	if not UI.cfg.bomb_timer then
		return
	end

	local var_318_0 = slot_0_36_0.bomb
	local var_318_1 = draw.surface
	local var_318_2 = UI.theme
	local var_318_3 = var_318_2.accent or {
		255,
		90,
		130,
		255,
		[0] = nil
	}

	if not UI.fonts_loaded then
		slot_0_52_0()
	end

	local var_318_4 = UI.dpi_scale or 1
	local var_318_5 = 180 * var_318_4
	local var_318_6 = 28 * var_318_4
	local var_318_7 = slot_0_10_0()
	local var_318_8 = slot_0_60_0
	local var_318_9 = UI.cfg.bomb_timer_x or 500
	local var_318_10 = UI.cfg.bomb_timer_y or 500
	local var_318_11 = 1

	if var_318_7 and var_318_8 and UI.open then
		if not var_318_0.dragging then
			if var_318_9 <= var_318_7.x and var_318_7.x <= var_318_9 + var_318_5 and var_318_10 <= var_318_7.y and var_318_7.y <= var_318_10 + var_318_6 then
				var_318_0.dragging = true
				var_318_0.drag_off_x = var_318_7.x - var_318_9
				var_318_0.drag_off_y = var_318_7.y - var_318_10
			end
		else
			UI.cfg.bomb_timer_x = var_318_7.x - var_318_0.drag_off_x
			UI.cfg.bomb_timer_y = var_318_7.y - var_318_0.drag_off_y
			UI.cfg.bomb_timer_x, UI.cfg.bomb_timer_y = slot_0_20_0(UI.cfg.bomb_timer_x, UI.cfg.bomb_timer_y, var_318_5, var_318_6, var_318_0.dragging)
			var_318_9, var_318_10 = UI.cfg.bomb_timer_x, UI.cfg.bomb_timer_y
		end
	else
		var_318_0.dragging = false
	end

	local function var_318_12(arg_319_0, arg_319_1, arg_319_2, arg_319_3, arg_319_4, arg_319_5)
		slot_319_6_0 = math.floor(255 * var_318_11)
		slot_319_7_0 = draw.Color(5, 5, 5, math.floor(250 * var_318_11))
		slot_319_8_0 = draw.Color(255, 255, 255, slot_319_6_0)
		slot_319_9_0 = slot_0_41_0(arg_319_5 and {
			100,
			200,
			255,
			[0] = nil
		} or var_318_3, math.floor(255 * var_318_11))
		slot_319_10_0 = 32 * var_318_4
		slot_319_11_0 = var_318_6 + slot_319_10_0

		for iter_319_0 = 1, 3 do
			slot_319_16_1 = iter_319_0
			slot_319_17_1 = math.floor((15 - iter_319_0 * 4) * var_318_11)

			if slot_319_17_1 > 0 then
				var_318_1:AddRectFilledRounded(draw.Rect(arg_319_0 - slot_319_16_1, arg_319_1 - slot_319_16_1, arg_319_0 + var_318_5 + slot_319_16_1, arg_319_1 + slot_319_11_0 + slot_319_16_1), slot_0_41_0(var_318_3, slot_319_17_1), 6, 15)
			end
		end

		var_318_1:AddRectFilledRounded(draw.Rect(arg_319_0, arg_319_1, arg_319_0 + var_318_5, arg_319_1 + slot_319_11_0), slot_319_7_0, 6, 15)
		draw_icon_proc("dashboard", arg_319_0 + 10, arg_319_1 + 8, 13, slot_319_9_0)
		var_318_1:AddText(draw.Vec2(arg_319_0 + 30, arg_319_1 + 6), "Bomb Timer", slot_0_41_0(var_318_2.text, slot_319_6_0))

		slot_319_12_0 = arg_319_2
		slot_319_13_0 = slot_0_51_0(UI.font, slot_319_12_0)
		slot_319_14_0 = 8 * var_318_4

		var_318_1:AddText(draw.Vec2(arg_319_0 + var_318_5 - slot_319_14_0 - slot_319_13_0.x, arg_319_1 + 6), slot_319_12_0, slot_0_41_0(var_318_2.text_dim, slot_319_6_0))

		slot_319_15_0 = arg_319_1 + var_318_6 + 8
		slot_319_16_0 = string.format("%.1fs", math.max(0, arg_319_3))
		slot_319_17_0 = slot_0_51_0(UI.font, slot_319_16_0)

		var_318_1:AddText(draw.Vec2(arg_319_0 + slot_319_14_0, slot_319_15_0), arg_319_5 and "Defuse" or "Explode", slot_0_41_0(var_318_2.text_dim, slot_319_6_0))
		var_318_1:AddText(draw.Vec2(arg_319_0 + var_318_5 - slot_319_14_0 - slot_319_17_0.x, slot_319_15_0), slot_319_16_0, slot_319_8_0)

		slot_319_18_0 = slot_319_15_0 + 16 * var_318_4
		slot_319_19_0 = 2 * var_318_4
		slot_319_20_0 = math.clamp(arg_319_3 / arg_319_4, 0, 1)
		slot_319_21_0 = var_318_5 - slot_319_14_0 * 2
		slot_319_22_0 = slot_319_21_0 * slot_319_20_0

		var_318_1:AddRectFilledRounded(draw.Rect(arg_319_0 + slot_319_14_0, slot_319_18_0, arg_319_0 + slot_319_14_0 + slot_319_21_0, slot_319_18_0 + slot_319_19_0), draw.Color(255, 255, 255, math.floor(15 * var_318_11)), 2, 15)
		var_318_1:AddRectFilledRounded(draw.Rect(arg_319_0 + slot_319_14_0, slot_319_18_0, arg_319_0 + slot_319_14_0 + slot_319_22_0, slot_319_18_0 + slot_319_19_0), slot_319_9_0, 2, 15)

		return slot_319_11_0
	end

	local var_318_13 = var_318_10

	if var_318_0.is_planted or UI.open then
		local var_318_14 = 40
		local var_318_15 = var_318_0.plant_time or 0
		local var_318_16 = game.globalVars.m_flRealTime - var_318_15
		local var_318_17 = math.max(0, var_318_14 - var_318_16)

		if UI.open and not var_318_0.is_planted then
			var_318_17 = 40
		end

		local var_318_18 = var_318_0.plant_site == 0 and "Site A" or var_318_0.plant_site == 1 and "Site B" or "Planted"

		var_318_13 = var_318_13 + var_318_12(var_318_9, var_318_13, var_318_18, var_318_17, var_318_14, false) + 6
	end

	if var_318_0.is_defusing or UI.open and var_318_0.is_planted then
		local var_318_19 = game.globalVars.m_flRealTime - var_318_0.defuse_start_time
		local var_318_20 = math.max(0, var_318_0.defuse_duration - var_318_19)

		if UI.open and not var_318_0.is_defusing then
			var_318_20 = 5
			var_318_0.defuse_duration = 5
		end

		var_318_12(var_318_9, var_318_13, "Defusing", var_318_20, var_318_0.defuse_duration, true)
	end
end

function slot_0_155_0()
	if not is_enabled("bottom_ws_enabled") or UI.cfg.bottom_ws_style ~= "Premium" and UI.cfg.bottom_ws_style ~= 2 then
		return
	end

	slot_320_0_0 = UI.dpi_scale or 1
	slot_320_1_0, slot_320_2_0 = game.engine:GetScreenSize()
	slot_320_3_0 = UI.font_ls or UI.font or draw.fonts.gui_main
	slot_320_4_0 = draw.surface
	slot_320_5_0 = slot_320_4_0.font
	slot_320_6_0 = "S I L E N T I U M"
	slot_320_7_0 = slot_0_0_0 == "LIVE" and "[ L I V E ]" or "[ B E T A ]"
	slot_320_8_0 = draw.Color(255, 255, 255, 140)
	slot_320_9_0 = slot_0_41_0(UI.cfg.ls_indicator_color or {
		255,
		50,
		50,
		255,
		[0] = nil
	}, 200)
	slot_320_4_0.font = slot_320_3_0
	slot_320_10_0 = slot_0_51_0(slot_320_3_0, slot_320_6_0)
	slot_320_11_0 = slot_0_51_0(slot_320_3_0, "  " .. slot_320_7_0)
	slot_320_12_0 = 2 * slot_320_0_0
	slot_320_13_0 = slot_320_10_0.x + slot_320_11_0.x + slot_320_12_0
	slot_320_14_0 = slot_320_10_0.y
	slot_320_15_0 = 14 * slot_320_0_0
	slot_320_16_0 = slot_320_2_0 * 0.5
	slot_320_17_0 = UI.cfg.ls_indicator_pos or "Left"

	if slot_320_17_0 == "Center" then
		slot_320_15_0 = (slot_320_1_0 - slot_320_13_0) / 2
		slot_320_16_0 = slot_320_2_0 - 22 * slot_320_0_0
	elseif slot_320_17_0 == "Custom" or slot_320_17_0 == 3 then
		if UI.cfg.ls_indicator_x == nil then
			UI.cfg.ls_indicator_x = 20 * slot_320_0_0
		end

		if UI.cfg.ls_indicator_y == nil then
			UI.cfg.ls_indicator_y = slot_320_2_0 - 20 * slot_320_0_0
		end

		slot_320_15_0 = UI.cfg.ls_indicator_x
		slot_320_16_0 = UI.cfg.ls_indicator_y

		if UI.open then
			slot_320_18_1 = slot_0_10_0()
			slot_320_19_1 = slot_0_60_0 or slot_0_11_0()
			slot_320_20_1 = slot_0_36_0.ls_indicator

			if slot_320_18_1 and slot_320_19_1 then
				if not slot_320_20_1.dragging then
					if slot_320_18_1.x >= slot_320_15_0 - 10 and slot_320_18_1.x <= slot_320_15_0 + slot_320_13_0 + 10 and slot_320_18_1.y >= slot_320_16_0 - 10 and slot_320_18_1.y <= slot_320_16_0 + slot_320_14_0 + 10 then
						slot_320_20_1.dragging = true
						slot_320_20_1.drag_off_x = slot_320_18_1.x - slot_320_15_0
						slot_320_20_1.drag_off_y = slot_320_18_1.y - slot_320_16_0
					end
				else
					UI.cfg.ls_indicator_x = slot_320_18_1.x - slot_320_20_1.drag_off_x
					UI.cfg.ls_indicator_y = slot_320_18_1.y - slot_320_20_1.drag_off_y
					slot_320_15_0, slot_320_16_0 = UI.cfg.ls_indicator_x, UI.cfg.ls_indicator_y
				end
			else
				slot_320_20_1.dragging = false
			end

			slot_320_4_0:AddRectFilled(draw.Rect(slot_320_15_0 - 2, slot_320_16_0 - 2, slot_320_15_0 + slot_320_13_0 + 2, slot_320_16_0 + slot_320_14_0 + 2), draw.Color(255, 255, 255, 10))
		end
	end

	slot_320_18_0 = draw.surface and draw.surface.font
	slot_320_19_0 = {
		"S",
		"I",
		"L",
		"E",
		"N",
		"T",
		"I",
		"U",
		"M",
		[0] = nil
	}
	slot_320_20_0 = slot_320_15_0
	slot_320_21_0 = draw.GetTime()

	for iter_320_0, iter_320_1 in ipairs(slot_320_19_0) do
		slot_320_27_0 = math.sin(slot_320_21_0 * 3 + iter_320_0 * 0.4) * 0.5 + 0.5
		slot_320_28_0 = math.floor(math.Lerp(60, 160, slot_320_27_0))
		slot_320_29_0 = draw.Color(255, 255, 255, slot_320_28_0)

		slot_320_4_0:AddText(draw.Vec2(slot_320_20_0 + 1, slot_320_16_0 + 1), iter_320_1, draw.Color(0, 0, 0, 200))
		slot_320_4_0:AddText(draw.Vec2(slot_320_20_0, slot_320_16_0), iter_320_1, slot_320_29_0)

		slot_320_20_0 = slot_320_20_0 + slot_0_51_0(slot_320_18_0, iter_320_0 < #slot_320_19_0 and iter_320_1 .. " " or iter_320_1).x
	end

	slot_320_4_0:AddText(draw.Vec2(slot_320_20_0 + slot_320_12_0 + 1, slot_320_16_0 + 1), slot_320_7_0, draw.Color(0, 0, 0, 200))
	slot_320_4_0:AddText(draw.Vec2(slot_320_20_0 + slot_320_12_0, slot_320_16_0), slot_320_7_0, slot_320_9_0)

	slot_320_4_0.font = slot_320_5_0
end

slot_0_156_0 = {
	Classic = {
		"s",
		"si",
		"sil",
		"sile",
		"silen",
		"silent",
		"silenti",
		"silentiu",
		"silentium",
		"silentium",
		".ilentium",
		"s.lentium",
		"si.entium",
		"sil.ntium",
		"sile.tium",
		"silen.ium",
		"silent.um",
		"silenti.m",
		"silentiu.",
		"silentium",
		"$ilentium",
		"$ilentium",
		"$ilentium",
		"$.lentium",
		"$i.entium",
		"$il.ntium",
		"$ile.tium",
		"$ilen.ium",
		"$ilent.um",
		"$ilenti.m",
		"$ilentiu.",
		"$ilentium",
		"$ilentium",
		"$ilentium",
		"$ilentiu",
		"$ilenti",
		"$ilent",
		"$ilen",
		"$ile",
		"$il",
		"$i",
		"$",
		"",
		"",
		"",
		[0] = nil
	},
	Slide = {
		"s",
		"si",
		"sil",
		"sile",
		"silen",
		"silent",
		"silenti",
		"silentiu",
		"silentium",
		"silentiu",
		"silenti",
		"silent",
		"silen",
		"sile",
		"sil",
		"si",
		"s",
		"",
		[0] = nil
	},
	Stars = {
		"?",
		"??",
		"??°",
		"??°.",
		"??°.?",
		"??°.? s",
		"??°.? si",
		"??°.? sil",
		"??°.? sile",
		"??°.? silen",
		"??°.? silent",
		"??°.? silenti",
		"??°.? silentiu",
		"??°.? silentium",
		"??°.? silentium",
		"??°.? silentium",
		"??°.? silentium",
		"??°.? silentiu",
		"??°.? silenti",
		"??°.? silent",
		"??°.? silen",
		"??°.? sile",
		"??°.? sil",
		"??°.? si",
		"??°.? s",
		"??°.?",
		"??°.",
		"??°",
		"??",
		"?",
		"",
		[0] = nil
	},
	Flicker = {
		"silentium",
		"s1lentium",
		"si1entium",
		"sil3ntium",
		"silen7ium",
		"silentium",
		"S1L3NT1UM",
		"silentium",
		"s_l_nt_um",
		"silentium",
		[0] = nil
	},
	Static = {
		"silentium",
		[0] = nil
	}
}
slot_0_157_0 = 1
slot_0_158_0 = 0
slot_0_159_0 = nil
slot_0_160_0 = nil
slot_0_161_0 = false

function slot_0_162_0(arg_321_0)
	if not arg_321_0 or arg_321_0 == "" then
		return nil
	end

	local var_321_0 = arg_321_0:gsub("^%?+%.?%?+ ", ""):gsub("^%$.* ", ""):gsub("^s[i1l3en7]*t*[i1]*u*m* ", "")

	if var_321_0:lower():find("silentium") or var_321_0:lower():find("^s[i1]+l") then
		return nil
	end

	return (var_321_0 == "" or var_321_0 == " ") and arg_321_0 or var_321_0
end

function slot_0_163_0()
	slot_0_157_0 = 1
	slot_0_158_0 = 0

	if slot_0_159_0 and game.engine:InGame() then
		game.engine:ClientCmd("setinfo name \"" .. slot_0_159_0 .. "\"")
	end
end

function handle_clantag()
	if not UI or not UI.cfg or not UI.cfg.misc_clantag then
		if slot_0_159_0 then
			game.engine:ClientCmd("setinfo name \"" .. slot_0_159_0 .. "\"")

			slot_0_159_0 = nil

			slot_0_163_0()
		end

		return
	end

	if slot_0_161_0 and game.engine:InGame() then
		slot_0_163_0()

		slot_0_161_0 = false
	end

	local var_323_0 = entities.GetLocalController()

	if not var_323_0 then
		return
	end

	local var_323_1 = var_323_0:GetStringSteamID()

	if var_323_1 and var_323_1 ~= "" and var_323_1 ~= slot_0_160_0 then
		slot_0_160_0 = var_323_1
		slot_0_159_0 = nil

		slot_0_163_0()
	end

	if not game.engine:InGame() then
		return
	end

	local var_323_2 = entities.GetLocalPawn()

	if not var_323_2 then
		return
	end

	if not slot_0_159_0 or slot_0_159_0 == "" then
		local var_323_3 = ""

		if var_323_0.m_sSanitizedPlayerName then
			var_323_3 = var_323_0.m_sSanitizedPlayerName:Get() or ""
		end

		if var_323_3 == "" then
			var_323_3 = var_323_2:GetName() or ""
		end

		local var_323_4 = slot_0_162_0(var_323_3)

		if var_323_4 then
			slot_0_159_0 = var_323_4
		else
			return
		end
	end

	if not slot_0_159_0 or slot_0_159_0 == "" then
		return
	end

	local var_323_5 = (55 - (UI.cfg.misc_clantag_speed or 17)) / 100
	local var_323_6 = draw.GetTime()

	if var_323_5 > var_323_6 - slot_0_158_0 then
		return
	end

	slot_0_158_0 = var_323_6

	local var_323_7 = UI.cfg.misc_clantag_style or "Classic"
	local var_323_8 = slot_0_156_0[var_323_7] or slot_0_156_0.Classic
	local var_323_9 = var_323_8[slot_0_157_0]

	if not var_323_9 then
		slot_0_157_0 = 1
		var_323_9 = var_323_8[1]
	end

	local var_323_10 = var_323_9 == "" and slot_0_159_0 or var_323_9 .. " " .. slot_0_159_0

	game.engine:ClientCmd("setinfo name \"" .. var_323_10 .. "\"")

	slot_0_157_0 = slot_0_157_0 + 1

	if slot_0_157_0 > #var_323_8 then
		slot_0_157_0 = 1
	end
end

if events and events.event then
	events.event:Add(slot_0_153_0)
end

if events and events.game_newmap then
	events.game_newmap:Add(function()
		slot_0_161_0 = true
	end)
end

events.presentQueue:Add(function()
	if slot_0_37_0 and not slot_0_37_0.initial_fetch_done and slot_0_37_0.fetchUserUID then
		slot_0_37_0.fetchUserUID()

		slot_0_37_0.initial_fetch_done = true
	end

	if slot_0_37_0 and slot_0_37_0.processQueue then
		slot_0_37_0.processQueue()
	end
end)

if handle_clantag then
	events.presentQueue:Add(handle_clantag)
end

slot_0_164_0 = {
	active = false,
	orig_z = nil,
	[0] = nil
}

function slot_0_165_0()
	if not UI or not UI.cfg then
		return
	end

	slot_326_0_0 = entities.GetLocalPawn()

	if not slot_326_0_0 or not slot_326_0_0:IsAlive() then
		if slot_0_164_0.active then
			slot_326_1_1 = gui.ctx:find("visuals>misc>local>viewmodel override>settings>offset x")
			slot_326_2_1 = gui.ctx:find("visuals>misc>local>viewmodel override>settings>offset y")
			slot_326_3_1 = gui.ctx:find("visuals>misc>local>viewmodel override>settings>offset z")

			if slot_326_1_1 and slot_326_2_1 and slot_326_3_1 then
				if slot_0_164_0.orig_x then
					slot_326_1_1:GetValue():Set(slot_0_164_0.orig_x)
				end

				if slot_0_164_0.orig_y then
					slot_326_2_1:GetValue():Set(slot_0_164_0.orig_y)
				end

				if slot_0_164_0.orig_z then
					slot_326_3_1:GetValue():Set(slot_0_164_0.orig_z)
				end
			end

			slot_0_164_0.active = false
		end

		if UI.animations then
			UI.animations.vm_scope_anim_v2 = 0
		end

		return
	end

	slot_326_1_0 = gui.ctx:find("visuals>misc>local>viewmodel override>settings>offset x")
	slot_326_2_0 = gui.ctx:find("visuals>misc>local>viewmodel override>settings>offset y")
	slot_326_3_0 = gui.ctx:find("visuals>misc>local>viewmodel override>settings>offset z")

	if not slot_326_1_0 or not slot_326_2_0 or not slot_326_3_0 then
		return
	end

	if not UI.cfg.viewmodel_scope_anim then
		if slot_0_164_0.active then
			if slot_0_164_0.orig_x then
				slot_326_1_0:GetValue():Set(slot_0_164_0.orig_x)
			end

			if slot_0_164_0.orig_y then
				slot_326_2_0:GetValue():Set(slot_0_164_0.orig_y)
			end

			if slot_0_164_0.orig_z then
				slot_326_3_0:GetValue():Set(slot_0_164_0.orig_z)
			end

			slot_0_164_0.active = false
		end

		return
	end

	slot_326_4_0 = slot_0_19_0(slot_326_0_0)
	slot_326_5_0 = slot_0_43_0("vm_scope_anim_v2", slot_326_4_0 and 1 or 0, UI.cfg.viewmodel_scope_speed or 10)

	if slot_326_5_0 <= 0.001 and not slot_326_4_0 then
		if slot_0_164_0.active then
			if slot_0_164_0.orig_x then
				slot_326_1_0:GetValue():Set(slot_0_164_0.orig_x)
			end

			if slot_0_164_0.orig_y then
				slot_326_2_0:GetValue():Set(slot_0_164_0.orig_y)
			end

			if slot_0_164_0.orig_z then
				slot_326_3_0:GetValue():Set(slot_0_164_0.orig_z)
			end

			slot_0_164_0.active = false
		end

		return
	end

	if not slot_0_164_0.active and slot_326_4_0 then
		slot_0_164_0.orig_x = slot_326_1_0:GetValue():Get()
		slot_0_164_0.orig_y = slot_326_2_0:GetValue():Get()
		slot_0_164_0.orig_z = slot_326_3_0:GetValue():Get()
		slot_0_164_0.active = true
	end

	if slot_0_164_0.active then
		slot_326_6_0 = UI.cfg.viewmodel_scope_offset_x or 0
		slot_326_7_0 = UI.cfg.viewmodel_scope_offset_y or 0
		slot_326_8_0 = UI.cfg.viewmodel_scope_offset_z or 0

		slot_326_1_0:GetValue():Set((slot_0_164_0.orig_x or 0) + slot_326_6_0 * slot_326_5_0)
		slot_326_2_0:GetValue():Set((slot_0_164_0.orig_y or 0) + slot_326_7_0 * slot_326_5_0)
		slot_326_3_0:GetValue():Set((slot_0_164_0.orig_z or 0) + slot_326_8_0 * slot_326_5_0)
	end
end

events.presentQueue:Add(slot_0_165_0)

if slot_0_154_0 then
	events.presentQueue:Add(slot_0_154_0)
end

if slot_0_150_0 and slot_0_150_0.run then
	events.presentQueue:Add(slot_0_150_0.run)
end

if slot_0_155_0 then
	events.presentQueue:Add(slot_0_155_0)
end

events.presentQueue:Add(function()
	if slot_0_91_0 and slot_0_91_0.update_and_render then
		slot_0_91_0.update_and_render()
	end
end)
events.presentQueue:Add(function()
	if slot_0_96_0 and slot_0_96_0.run_paint then
		slot_0_96_0.run_paint()
	end
end)
events.presentQueue:Add(function()
	if not UI.cfg.jump_circles_enabled or #slot_0_36_0.jump_circles == 0 then
		return
	end

	local var_329_0 = draw.surface
	local var_329_1 = draw.GetTime()
	local var_329_2 = UI.cfg.jump_circles_lifetime or 2
	local var_329_3 = UI.cfg.jump_circles_color or {
		255,
		255,
		255,
		255,
		[0] = nil
	}

	local function var_329_4(arg_330_0, arg_330_1, arg_330_2, arg_330_3)
		local var_330_0 = {}
		local var_330_1 = 11.25

		for iter_330_0 = 0, 360, var_330_1 do
			local var_330_2 = math.rad(iter_330_0)
			local var_330_3 = vector(arg_330_0.x + math.cos(var_330_2) * arg_330_1, arg_330_0.y + math.sin(var_330_2) * arg_330_1, arg_330_0.z)
			local var_330_4 = math.WorldToScreen(var_330_3)

			if var_330_4 then
				table.insert(var_330_0, var_330_4)
			end
		end

		if #var_330_0 > 2 then
			for iter_330_1 = 1, #var_330_0 - 1 do
				var_329_0:AddLine(var_330_0[iter_330_1], var_330_0[iter_330_1 + 1], arg_330_2, arg_330_3)
			end

			var_329_0:AddLine(var_330_0[#var_330_0], var_330_0[1], arg_330_2, arg_330_3)
		end
	end

	for iter_329_0 = #slot_0_36_0.jump_circles, 1, -1 do
		local var_329_5 = slot_0_36_0.jump_circles[iter_329_0]
		local var_329_6 = var_329_1 - var_329_5.time

		if var_329_2 < var_329_6 then
			table.remove(slot_0_36_0.jump_circles, iter_329_0)
		else
			local var_329_7 = 1 - var_329_6 / var_329_2
			local var_329_8 = UI.cfg.jump_circles_size or 25
			local var_329_9 = var_329_8 + var_329_6 * (var_329_8 * 0.6)

			for iter_329_1 = 1, 3 do
				local var_329_10 = math.floor(var_329_3[4] * var_329_7 * (0.4 / iter_329_1))
				local var_329_11 = slot_0_41_0(var_329_3, var_329_10)
				local var_329_12 = 1.5 + iter_329_1 * 2

				var_329_4(var_329_5.pos, var_329_9, var_329_11, var_329_12)
			end

			local var_329_13 = slot_0_41_0(var_329_3, math.floor(var_329_3[4] * var_329_7))

			var_329_4(var_329_5.pos, var_329_9, var_329_13, 2)
		end
	end
end)

if draw and draw.texture then
	slot_0_166_0 = type(ws) == "table" and ws.get_resource_dir and ws.get_resource_dir() or ""
	slot_0_167_1 = slot_0_6_0.SILENTIUM_DIR .. "logo.png"
	slot_0_168_0 = {
		slot_0_167_1,
		slot_0_166_0 .. "/logo.png",
		"fatality/scripts/silentium/logo.png",
		"silentium/logo.png",
		"logo.png",
		[0] = nil
	}

	for iter_0_1, iter_0_2 in ipairs(slot_0_168_0) do
		if iter_0_2 ~= "" and (not utils.FileExists or utils.FileExists(iter_0_2)) then
			slot_0_174_0 = draw.texture(iter_0_2)

			if slot_0_174_0 then
				slot_0_174_0:create()

				slot_0_36_0.loading.logo_tex = slot_0_174_0

				break
			end
		end
	end
end

if game and game.globalVars and game.globalVars.m_flRealTime then
	slot_0_36_0.session_start_time = game.globalVars.m_flRealTime
else
	slot_0_36_0.session_start_time = 0
end

if not slot_0_36_0.session_start_time then
	slot_0_36_0.session_start_time = 0
end

slot_0_36_0.session_kills = 0

;(function()
	if not gui or not gui.ctx then
		return
	end
end)()
slot_0_6_0.refresh_presets()

function slot_0_167_0()
	if not is_enabled("bottom_ws_enabled") or UI.cfg.bottom_ws_style ~= "Classic" and UI.cfg.bottom_ws_style ~= 1 and UI.cfg.bottom_ws_style ~= nil then
		return
	end

	slot_332_0_0 = draw.surface

	if not slot_332_0_0 then
		return
	end

	slot_332_1_0 = UI.cfg.watermark_effect or "None"
	slot_332_2_0 = UI.cfg.watermark_text

	if type(slot_332_2_0) ~= "string" or slot_332_2_0 == "" then
		slot_332_2_0 = "silentium"
	end

	slot_332_3_0 = slot_0_36_0.watermark

	if not slot_332_3_0 then
		return
	end

	slot_332_4_0 = draw.GetTime()

	if slot_332_3_0.target_text ~= slot_332_2_0 or slot_332_3_0.last_effect ~= slot_332_1_0 then
		slot_332_3_0.target_text = slot_332_2_0
		slot_332_3_0.last_effect = slot_332_1_0
		slot_332_3_0.last_update = 0
		slot_332_3_0.frame = 0
		slot_332_3_0.is_decrypting = slot_332_1_0 == "Decrypt"

		if slot_332_1_0 == "Decrypt" then
			slot_332_3_0.current_text = ""

			for iter_332_0 = 1, #slot_332_2_0 do
				slot_332_3_0.current_text = slot_332_3_0.current_text .. slot_332_3_0.chars:sub(math.random(1, #slot_332_3_0.chars), math.random(1, #slot_332_3_0.chars))
			end
		end
	end

	if slot_332_1_0 == "None" or slot_332_1_0 == "" then
		slot_332_3_0.current_text = slot_332_2_0
	elseif slot_332_1_0 == "Decrypt" then
		if slot_332_3_0.is_decrypting and slot_332_4_0 - slot_332_3_0.last_update > 0.05 then
			slot_332_3_0.last_update = slot_332_4_0
			slot_332_5_3 = ""
			slot_332_6_3 = true

			for iter_332_1 = 1, #slot_332_3_0.target_text do
				slot_332_11_2 = slot_332_3_0.target_text:sub(iter_332_1, iter_332_1)

				if (slot_332_3_0.current_text:sub(iter_332_1, iter_332_1) or "") ~= slot_332_11_2 then
					if math.random() > 0.85 then
						slot_332_5_3 = slot_332_5_3 .. slot_332_11_2
					else
						slot_332_5_3 = slot_332_5_3 .. slot_332_3_0.chars:sub(math.random(1, #slot_332_3_0.chars), math.random(1, #slot_332_3_0.chars))
						slot_332_6_3 = false
					end
				else
					slot_332_5_3 = slot_332_5_3 .. slot_332_11_2
				end
			end

			slot_332_3_0.current_text = slot_332_5_3

			if slot_332_6_3 then
				slot_332_3_0.is_decrypting = false
			end
		end
	elseif slot_332_1_0 == "Slide" then
		if 0.12 < slot_332_4_0 - slot_332_3_0.last_update then
			slot_332_3_0.last_update = slot_332_4_0
			slot_332_3_0.frame = (slot_332_3_0.frame or 0) + 1
			slot_332_6_2 = #slot_332_2_0
			slot_332_7_1 = slot_332_3_0.frame % (slot_332_6_2 * 2 + 8)

			if slot_332_7_1 <= slot_332_6_2 then
				slot_332_3_0.current_text = slot_332_2_0:sub(1, slot_332_7_1)
			elseif slot_332_7_1 <= slot_332_6_2 + 8 then
				slot_332_3_0.current_text = slot_332_2_0
			else
				slot_332_3_0.current_text = slot_332_2_0:sub(1, math.max(0, slot_332_6_2 - (slot_332_7_1 - (slot_332_6_2 + 8))))
			end
		end
	elseif slot_332_1_0 == "Flicker" then
		if slot_332_4_0 - slot_332_3_0.last_update > 0.08 then
			slot_332_3_0.last_update = slot_332_4_0
			slot_332_5_2 = ""

			for iter_332_2 = 1, #slot_332_2_0 do
				if math.random() > 0.9 then
					slot_332_5_2 = slot_332_5_2 .. slot_332_3_0.chars:sub(math.random(1, #slot_332_3_0.chars), math.random(1, #slot_332_3_0.chars)):sub(1, 1)
				else
					slot_332_5_2 = slot_332_5_2 .. slot_332_2_0:sub(iter_332_2, iter_332_2)
				end
			end

			slot_332_3_0.current_text = slot_332_5_2
		end
	elseif slot_332_1_0 == "Stars" and slot_332_4_0 - slot_332_3_0.last_update > 0.4 then
		slot_332_3_0.last_update = slot_332_4_0
		slot_332_3_0.frame = (slot_332_3_0.frame or 0) + 1
		slot_332_5_1 = {
			"?",
			"??",
			"??°",
			"*",
			"**",
			"***",
			[0] = nil
		}
		slot_332_6_1 = slot_332_5_1[slot_332_3_0.frame % #slot_332_5_1 + 1]
		slot_332_3_0.current_text = slot_332_6_1 .. " " .. slot_332_2_0 .. " " .. slot_332_6_1
	end

	slot_332_5_0, slot_332_6_0 = slot_0_9_0()

	if not slot_332_5_0 then
		return
	end

	slot_332_7_0 = UI.font or 0
	slot_332_8_0 = slot_332_3_0.current_text
	slot_332_9_0 = slot_0_51_0(slot_332_7_0, slot_332_8_0)

	if UI.cfg.watermark_x == nil or UI.cfg.watermark_x == 0 then
		UI.cfg.watermark_x = (slot_332_5_0 - slot_332_9_0.x) / 2
	end

	if UI.cfg.watermark_y == nil or UI.cfg.watermark_y == 0 then
		UI.cfg.watermark_y = slot_332_6_0 - slot_332_9_0.y - 20
	end

	if UI.open then
		slot_332_10_1 = slot_0_10_0 and slot_0_10_0() or slot_0_59_0.Mouse
		slot_332_11_1 = slot_0_11_0 and slot_0_11_0() or slot_0_60_0

		if slot_332_10_1 and slot_332_11_1 then
			slot_332_12_1 = 10
			slot_332_13_1 = slot_332_9_0.x + slot_332_12_1 * 2
			slot_332_14_0 = slot_332_9_0.y + slot_332_12_1 * 2
			slot_332_15_0 = UI.cfg.watermark_x - slot_332_12_1
			slot_332_16_0 = UI.cfg.watermark_y - slot_332_12_1

			if not slot_332_3_0.dragging then
				if slot_332_15_0 <= slot_332_10_1.x and slot_332_10_1.x <= slot_332_15_0 + slot_332_13_1 and slot_332_16_0 <= slot_332_10_1.y and slot_332_10_1.y <= slot_332_16_0 + slot_332_14_0 then
					slot_332_3_0.dragging = true
					slot_332_3_0.drag_offset_x = slot_332_10_1.x - UI.cfg.watermark_x
					slot_332_3_0.drag_offset_y = slot_332_10_1.y - UI.cfg.watermark_y
				end
			else
				UI.cfg.watermark_x = slot_332_10_1.x - slot_332_3_0.drag_offset_x
				UI.cfg.watermark_y = slot_332_10_1.y - slot_332_3_0.drag_offset_y

				if slot_0_20_0 then
					UI.cfg.watermark_x, UI.cfg.watermark_y = slot_0_20_0(UI.cfg.watermark_x, UI.cfg.watermark_y, slot_332_9_0.x, slot_332_9_0.y, slot_332_3_0.dragging)
				end
			end
		else
			slot_332_3_0.dragging = false
		end

		if slot_332_3_0.dragging or slot_332_10_1 and slot_332_10_1.x >= UI.cfg.watermark_x and slot_332_10_1.x <= UI.cfg.watermark_x + slot_332_9_0.x and slot_332_10_1.y >= UI.cfg.watermark_y and slot_332_10_1.y <= UI.cfg.watermark_y + slot_332_9_0.y then
			slot_332_0_0:AddRect(draw.Rect(UI.cfg.watermark_x - 4, UI.cfg.watermark_y - 2, UI.cfg.watermark_x + slot_332_9_0.x + 4, UI.cfg.watermark_y + slot_332_9_0.y + 2), slot_0_41_0(UI.theme.accent, 100), 1)
		end
	end

	slot_332_10_0 = UI.cfg.watermark_x
	slot_332_11_0 = UI.cfg.watermark_y
	slot_332_12_0 = UI.cfg.watermark_color or {
		255,
		255,
		255,
		255,
		[0] = nil
	}
	slot_332_13_0 = draw.Color(0, 0, 0, math.floor((slot_332_12_0[4] or 255) * 0.5))

	slot_332_0_0:AddText(draw.Vec2(slot_332_10_0 + 1, slot_332_11_0 + 1), slot_332_8_0, slot_332_13_0)
	slot_332_0_0:AddText(draw.Vec2(slot_332_10_0, slot_332_11_0), slot_332_8_0, slot_0_41_0(slot_332_12_0))
end

if events and events.presentQueue then
	events.presentQueue:Add(slot_0_167_0)
	events.presentQueue:Add(slot_0_102_0)
end
