--by scriptleaks https://discord.gg/kTHUpjVQPV t.me/scriptleakslol

slot_0_0_0 = "elysian"

pcall(files.create_folder, "nl\\elysian")

slot_0_1_0 = require("neverlose/pui")
slot_0_2_0 = require("neverlose/base64")
slot_0_3_0 = require("neverlose/clipboard")
slot_0_4_0 = require("neverlose/inspect")
slot_0_5_0 = require("neverlose/smoothy")
slot_0_6_0 = require("neverlose/easing")
slot_0_7_0, slot_0_8_0 = pcall(require, "neverlose/get_defensive")

function slot_0_9_0()
	if slot_0_7_0 and type(slot_0_8_0) == "function" then
		local var_1_0, var_1_1 = pcall(slot_0_8_0)

		if var_1_0 then
			return var_1_1 == true
		end
	end

	local var_1_2, var_1_3 = pcall(function()
		return rage.exploit:get_defensive()
	end)

	return var_1_2 and var_1_3 == true
end

function slot_0_10_0(arg_3_0, arg_3_1, arg_3_2)
	local var_3_0 = entity.get_players(arg_3_0, arg_3_1)

	if type(arg_3_2) == "function" then
		for iter_3_0 = 1, #var_3_0 do
			arg_3_2(var_3_0[iter_3_0])
		end
	end

	return var_3_0
end

ffi.cdef("    int    VirtualFree   (void* lpAddress, unsigned long dwSize, unsigned long dwFreeType);\n    void*  VirtualAlloc  (void* lpAddress, unsigned long dwSize, unsigned long flAllocationType, unsigned long flProtect);\n    int    VirtualProtect(void* lpAddress, unsigned long dwSize, unsigned long flNewProtect, unsigned long* lpflOldProtect);\n    typedef struct {\n        char  pad0[0x60];\n        void* pEntity;\n        void* pActiveWeapon;\n        void* pLastActiveWeapon;\n        float flLastUpdateTime;\n        int   iLastUpdateFrame;\n        float flLastUpdateIncrement;\n        float flEyeYaw;\n        float flEyePitch;\n        float flGoalFeetYaw;\n        float flLastFeetYaw;\n        float flMoveYaw;\n        float flLastMoveYaw;\n        float flLeanAmount;\n        char  pad1[0x4];\n        float flFeetCycle;\n        float flMoveWeight;\n        float flMoveWeightSmoothed;\n        float flDuckAmount;\n        float flHitGroundCycle;\n        float flRecrouchWeight;\n        float vecOriginX; float vecOriginY; float vecOriginZ;\n        float vecLastOriginX; float vecLastOriginY; float vecLastOriginZ;\n        float vecVX; float vecVY; float vecVZ;\n        float vecVNX; float vecVNY; float vecVNZ;\n        float vecVNNZX; float vecVNNZY; float vecVNNZZ;\n        float flVelocityLenght2D;\n        float flJumpFallVelocity;\n        float flSpeedNormalized;\n        float flRunningSpeed;\n        float flDuckingSpeed;\n        float flDurationMoving;\n        float flDurationStill;\n        bool  bOnGround;\n        bool  bHitGroundAnimation;\n        char  pad2[0x2];\n        float flNextLowerBodyYawUpdateTime;\n        float flDurationInAir;\n        float flLeftGroundHeight;\n        float flHitGroundWeight;\n        float flWalkToRunTransition;\n        char  pad3[0x4];\n        float flAffectedFraction;\n        char  pad4[0x208];\n        float flMinBodyYaw;\n        float flMaxBodyYaw;\n        float flMinPitch;\n        float flMaxPitch;\n        int   iAnimsetVersion;\n    } CSGOAnimState_AB_t;\n")

slot_0_11_1 = nil
slot_0_11_0 = {
	rage = {
		main = {
			dormant_aimbot = ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot"),
			hide_shots = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"),
			hide_shots_options = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options"),
			double_tap = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"),
			double_tap_lag_options = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"),
			double_tap_lag_options_pui = slot_0_1_0.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"),
			peek_assist = {
				switch = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist"),
				style = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist", "Style"),
				auto_stop = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist", "Auto Stop"),
				retreat_mode = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist", "Retreat Mode")
			}
		},
		selection = {
			hit_chance = ui.find("Aimbot", "Ragebot", "Selection", "Hit Chance"),
			minimum_damage = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"),
			minimum_damage_global = ui.find("Aimbot", "Ragebot", "Selection", "Global", "Min. Damage"),
			safe_points = ui.find("Aimbot", "Ragebot", "Safety", "Safe Points"),
			body_aim = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim"),
			hitboxes = ui.find("Aimbot", "Ragebot", "Selection", "Hitboxes"),
			autoscope = ui.find("Aimbot", "Ragebot", "Accuracy", "Auto Scope")
		}
	},
	antiaim = {
		angles = {
			enabled = ui.find("Aimbot", "Anti Aim", "Angles", "Enabled"),
			pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"),
			yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"),
			yaw_base = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"),
			yaw_add = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"),
			avoid_backstab = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab"),
			hidden = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden"),
			yaw_modifier = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"),
			modifier_offset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"),
			body_yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"),
			inverter = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"),
			left_limit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"),
			right_limit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"),
			options = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"),
			freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"),
			freestand_peek = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding"),
			disable_yaw_modifiers = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Disable Yaw Modifiers"),
			body_freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Body Freestanding")
		},
		fake_lag = {
			enabled = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Enabled"),
			limit = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Limit"),
			enabled_pui = slot_0_1_0.find("Aimbot", "Anti Aim", "Fake Lag", "Enabled"),
			limit_pui = slot_0_1_0.find("Aimbot", "Anti Aim", "Fake Lag", "Limit")
		},
		misc = {
			fake_duck = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"),
			slow_walk = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"),
			leg_movement = ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement")
		}
	},
	ping_spike = ui.find("Miscellaneous", "Main", "Other", "Fake Latency"),
	visuals = {
		weapon_chams = ui.find("Visuals", "Players", "Self", "Chams", "Weapon"),
		thirdperson = ui.find("Visuals", "World", "Main", "Force Thirdperson")
	}
}
slot_0_12_0 = {
	states = {
		"standing",
		"running",
		"crouching",
		"sneaking",
		"slowing",
		"air crouching",
		"air",
		"fakelag",
		"legit aa"
	}
}
slot_0_13_0 = {
	message = function(arg_4_0, arg_4_1)
		print_raw(string.format("\a%selysian\aDEFAULT  %s", ui.get_style()["Link Active"]:to_hex(), arg_4_1))
	end,
	error = function(arg_5_0, arg_5_1)
		print_raw(string.format("\a%selysian\aDEFAULT  \aFF3E3EFF%s", ui.get_style()["Link Active"]:to_hex(), arg_5_1))
	end
}
slot_0_14_0 = render.screen_size()
slot_0_15_1 = nil
slot_0_16_1 = nil
slot_0_17_0 = {}
slot_0_18_0 = nil
slot_0_19_0 = nil
slot_0_20_0 = render.load_font("Verdana", 12, "ab")
slot_0_21_0 = render.load_font("Verdana", 10, "ab")
slot_0_22_0 = render.load_font("Verdana", 14, "ab")
slot_0_23_0 = render.load_font("Verdana", 13, "ab")
slot_0_24_0 = render.load_font("Verdana", 12, "ab")
slot_0_25_0 = render.load_font("Verdana", 11, "ab")
slot_0_26_1 = nil
slot_0_27_0 = {}
slot_0_28_0 = render.load_font("Verdana", 24, "ab")
slot_0_29_0 = render.load_font("Verdana", 10, "ab")
slot_0_30_0 = render.load_font("Verdana", 14, "ab")
slot_0_31_0 = render.load_font("Verdana", 13, "ab")
slot_0_32_0 = render.load_font("Verdana", 12, "ab")
slot_0_33_0 = render.load_font("Verdana", 24, "ab")
slot_0_34_0 = nil
slot_0_35_0 = {}

function slot_0_36_0(arg_6_0)
	table.insert(slot_0_35_0, arg_6_0)
end

slot_0_37_0 = {
	rmb_was_down = false,
	anim = 0,
	visible = false,
	hover_no = false,
	hover_yes = false
}
slot_0_38_0 = {
	any_dragging = false,
	anim = 0
}

function slot_0_39_0(arg_7_0, arg_7_1)
	if arg_7_1 < 0.01 then
		return
	end

	local var_7_0 = math.floor(arg_7_0.x * 0.5)
	local var_7_1 = math.floor(arg_7_0.y * 0.5)
	local var_7_2 = math.floor(arg_7_1 * 80)
	local var_7_3 = math.floor(arg_7_1 * 30)
	local var_7_4 = 8
	local var_7_5 = 5
	local var_7_6 = 0

	while var_7_6 < arg_7_0.y do
		render.rect(vector(var_7_0, var_7_6), vector(var_7_0 + 1, math.min(var_7_6 + var_7_4, arg_7_0.y)), color(150, 195, 255, var_7_3))

		var_7_6 = var_7_6 + var_7_4 + var_7_5
	end

	local var_7_7 = 7

	render.line(vector(var_7_0 - var_7_7, var_7_1), vector(var_7_0 + var_7_7, var_7_1), color(150, 195, 255, var_7_2))
	render.line(vector(var_7_0, var_7_1 - var_7_7), vector(var_7_0, var_7_1 + var_7_7), color(150, 195, 255, var_7_2))
	render.rect(vector(var_7_0 - 1, var_7_1 - 1), vector(var_7_0 + 2, var_7_1 + 2), color(150, 195, 255, math.floor(arg_7_1 * 160)))
end

slot_0_40_0 = nil
slot_0_41_0 = nil

function slot_0_42_0()
	if slot_0_41_0 then
		return slot_0_41_0
	end

	if slot_0_40_0 then
		return slot_0_40_0
	end

	local var_8_0, var_8_1 = pcall(function()
		return {
			accent = ui.find("Scripts", "elysian", "elysian", "         ", "notifications", "\a666666FFaccent"),
			glass = ui.find("Scripts", "elysian", "elysian", "         ", "notifications", "\a666666FFglass tint"),
			border = ui.find("Scripts", "elysian", "elysian", "         ", "notifications", "\a666666FFborder"),
			text = ui.find("Scripts", "elysian", "elysian", "         ", "notifications", "text"),
			blur = ui.find("Scripts", "elysian", "elysian", "         ", "notifications", "\a666666FFbackground blur")
		}
	end)

	if var_8_0 and var_8_1 and var_8_1.accent then
		slot_0_40_0 = var_8_1

		return slot_0_40_0
	end

	return nil
end

function slot_0_43_0()
	if menu and menu.info and menu.info.hud and menu.info.hud.master_en then
		local var_10_0, var_10_1 = pcall(function()
			return menu.info.hud.master_en:get()
		end)

		if var_10_0 and var_10_1 and menu.info.hud.theme_col then
			local var_10_2, var_10_3 = pcall(function()
				return menu.info.hud.theme_col:get()
			end)

			if var_10_2 and var_10_3 then
				return var_10_3
			end
		end
	end

	if slot_0_41_0 and slot_0_41_0.col_accent then
		local var_10_4, var_10_5 = pcall(function()
			return slot_0_41_0.col_accent:get()
		end)

		if var_10_4 and var_10_5 then
			return var_10_5
		end
	end

	local var_10_6 = slot_0_42_0()
	local var_10_7 = var_10_6 and var_10_6.accent and pcall(function()
		return var_10_6.accent:get()
	end)
	local var_10_8

	return var_10_7 and var_10_8 or color(150, 195, 255, 255)
end

function slot_0_44_0()
	if slot_0_41_0 and slot_0_41_0.col_glass then
		local var_15_0, var_15_1 = pcall(function()
			return slot_0_41_0.col_glass:get()
		end)

		if var_15_0 and var_15_1 then
			return var_15_1
		end
	end

	local var_15_2 = slot_0_42_0()
	local var_15_3 = var_15_2 and var_15_2.glass and pcall(function()
		return var_15_2.glass:get()
	end)
	local var_15_4

	return var_15_3 and var_15_4 or color(255, 255, 255, 18)
end

function slot_0_45_0()
	if slot_0_41_0 and slot_0_41_0.col_border then
		local var_18_0, var_18_1 = pcall(function()
			return slot_0_41_0.col_border:get()
		end)

		if var_18_0 and var_18_1 then
			return var_18_1
		end
	end

	local var_18_2 = slot_0_42_0()
	local var_18_3 = var_18_2 and var_18_2.border and pcall(function()
		return var_18_2.border:get()
	end)
	local var_18_4

	return var_18_3 and var_18_4 or color(255, 255, 255, 45)
end

function slot_0_46_0()
	if slot_0_41_0 and slot_0_41_0.col_text then
		local var_21_0, var_21_1 = pcall(function()
			return slot_0_41_0.col_text:get()
		end)

		if var_21_0 and var_21_1 then
			return var_21_1
		end
	end

	local var_21_2 = slot_0_42_0()
	local var_21_3 = var_21_2 and var_21_2.text and pcall(function()
		return var_21_2.text:get()
	end)
	local var_21_4

	return var_21_3 and var_21_4 or color(220, 220, 225, 255)
end

function slot_0_47_0()
	if slot_0_41_0 and slot_0_41_0.blur then
		local var_24_0, var_24_1 = pcall(function()
			return slot_0_41_0.blur:get()
		end)

		if var_24_0 then
			return var_24_1
		end
	end

	local var_24_2 = slot_0_42_0()
	local var_24_3 = var_24_2 and var_24_2.blur and pcall(function()
		return var_24_2.blur:get()
	end)
	local var_24_4

	return var_24_3 == nil or var_24_3 and var_24_4 or true
end

function slot_0_48_0(arg_27_0, arg_27_1, arg_27_2)
	if not (ui.get_alpha() > 0) then
		return
	end

	if arg_27_2 < 0.005 then
		return
	end

	local var_27_0 = slot_0_44_0()
	local var_27_1 = slot_0_45_0()
	local var_27_2 = slot_0_47_0()
	local var_27_3 = 6
	local var_27_4 = math.floor(arg_27_1.x * 0.5)
	local var_27_5 = math.floor(arg_27_1.y * 0.5)
	local var_27_6 = math.floor(arg_27_0.x) - var_27_4
	local var_27_7 = math.floor(arg_27_0.y) - var_27_5
	local var_27_8 = math.floor(arg_27_0.x) + var_27_4
	local var_27_9 = math.floor(arg_27_0.y) + var_27_5
	local var_27_10 = math.floor(arg_27_2 * 255)
	local var_27_11 = math.floor(var_27_10 * 0.08)

	if var_27_11 > 1 then
		render.rect(vector(var_27_6 - 2, var_27_7 - 1), vector(var_27_8 + 2, var_27_9 + 3), color(0, 0, 0, var_27_11), var_27_3 + 2)
	end

	if var_27_2 and var_27_10 > 10 then
		render.blur(vector(var_27_6, var_27_7), vector(var_27_8, var_27_9), 4, arg_27_2 * 0.5, var_27_3)
		render.blur(vector(var_27_6, var_27_7), vector(var_27_8, var_27_9), 2, arg_27_2 * 0.3, var_27_3)
	end

	local var_27_12 = math.floor(var_27_0.a * arg_27_2 * 0.55)

	render.rect(vector(var_27_6, var_27_7), vector(var_27_8, var_27_9), color(var_27_0.r, var_27_0.g, var_27_0.b, var_27_12), var_27_3)
	render.rect(vector(var_27_6 + 1, var_27_7 + 1), vector(var_27_8 - 1, var_27_7 + 1 + math.floor((var_27_9 - var_27_7) * 0.35)), color(255, 255, 255, math.floor(var_27_10 * 0.04)), var_27_3)
	render.rect_outline(vector(var_27_6, var_27_7), vector(var_27_8, var_27_9), color(var_27_1.r, var_27_1.g, var_27_1.b, math.floor(var_27_1.a * arg_27_2 * 0.6)), 1, var_27_3)
end

slot_0_49_0 = 0
slot_0_50_0 = 0

function slot_0_51_0(arg_28_0)
	slot_28_1_0 = slot_0_37_0.anim

	if slot_28_1_0 < 0.005 then
		return
	end

	slot_28_2_0 = slot_0_44_0()
	slot_28_3_0 = slot_0_45_0()
	slot_28_4_0 = slot_0_43_0()
	slot_28_5_0 = slot_0_46_0()
	slot_28_6_0 = slot_0_47_0()
	slot_28_7_0 = 210
	slot_28_8_0 = 82
	slot_28_9_0 = math.floor(arg_28_0.x * 0.5 - slot_28_7_0 * 0.5)
	slot_28_10_1 = math.floor(arg_28_0.y * 0.5 - slot_28_8_0 * 0.5 - 20)
	slot_28_11_0 = (1 - slot_28_1_0) * (slot_28_8_0 + 14)
	slot_28_10_0 = slot_28_10_1 + math.floor(slot_28_11_0 * (1 - slot_28_1_0))
	slot_28_12_0 = slot_28_1_0
	slot_28_13_0 = math.floor(slot_28_12_0 * 255)
	slot_28_14_0 = 6
	slot_28_15_0 = math.floor(slot_28_13_0 * 0.18)

	if slot_28_15_0 > 1 then
		render.rect(vector(slot_28_9_0 - 3, slot_28_10_0 - 2), vector(slot_28_9_0 + slot_28_7_0 + 3, slot_28_10_0 + slot_28_8_0 + 4), color(0, 0, 0, slot_28_15_0), slot_28_14_0 + 3)
	end

	if slot_28_6_0 and slot_28_13_0 > 10 then
		render.blur(vector(slot_28_9_0, slot_28_10_0), vector(slot_28_9_0 + slot_28_7_0, slot_28_10_0 + slot_28_8_0), 6, slot_28_12_0 * 0.85, slot_28_14_0)
		render.blur(vector(slot_28_9_0, slot_28_10_0), vector(slot_28_9_0 + slot_28_7_0, slot_28_10_0 + slot_28_8_0), 3, slot_28_12_0 * 0.55, slot_28_14_0)
		render.blur(vector(slot_28_9_0, slot_28_10_0), vector(slot_28_9_0 + slot_28_7_0, slot_28_10_0 + slot_28_8_0), 1, slot_28_12_0 * 0.3, slot_28_14_0)
	end

	render.rect(vector(slot_28_9_0, slot_28_10_0), vector(slot_28_9_0 + slot_28_7_0, slot_28_10_0 + slot_28_8_0), color(slot_28_2_0.r, slot_28_2_0.g, slot_28_2_0.b, math.floor(slot_28_2_0.a * slot_28_12_0)), slot_28_14_0)
	render.rect(vector(slot_28_9_0 + 1, slot_28_10_0 + 1), vector(slot_28_9_0 + slot_28_7_0 - 1, slot_28_10_0 + 1 + math.floor(slot_28_8_0 * 0.4)), color(255, 255, 255, math.floor(slot_28_13_0 * 0.07)), slot_28_14_0)
	render.rect_outline(vector(slot_28_9_0, slot_28_10_0), vector(slot_28_9_0 + slot_28_7_0, slot_28_10_0 + slot_28_8_0), color(slot_28_3_0.r, slot_28_3_0.g, slot_28_3_0.b, math.floor(slot_28_3_0.a * slot_28_12_0)), 1, slot_28_14_0)

	slot_28_16_0 = slot_0_20_0
	slot_28_17_0 = "elysian"
	slot_28_18_0 = "  ·  "
	slot_28_19_0 = "reset positions?"
	slot_28_20_0 = render.measure_text(slot_28_16_0, nil, slot_28_17_0)
	slot_28_21_0 = render.measure_text(slot_28_16_0, nil, slot_28_18_0)
	slot_28_22_0 = render.measure_text(slot_28_16_0, nil, slot_28_19_0)
	slot_28_23_0 = slot_28_20_0.x + slot_28_21_0.x + slot_28_22_0.x
	slot_28_24_2 = slot_28_9_0 + math.floor((slot_28_7_0 - slot_28_23_0) * 0.5)
	slot_28_25_0 = slot_28_10_0 + 13

	render.text(slot_28_16_0, vector(slot_28_24_2, slot_28_25_0), color(slot_28_4_0.r, slot_28_4_0.g, slot_28_4_0.b, math.floor(slot_28_4_0.a * slot_28_12_0)), nil, slot_28_17_0)

	slot_28_24_1 = slot_28_24_2 + slot_28_20_0.x

	render.text(slot_28_16_0, vector(slot_28_24_1, slot_28_25_0), color(slot_28_5_0.r, slot_28_5_0.g, slot_28_5_0.b, math.floor(slot_28_5_0.a * 0.38 * slot_28_12_0)), nil, slot_28_18_0)

	slot_28_24_0 = slot_28_24_1 + slot_28_21_0.x

	render.text(slot_28_16_0, vector(slot_28_24_0, slot_28_25_0), color(slot_28_5_0.r, slot_28_5_0.g, slot_28_5_0.b, math.floor(slot_28_5_0.a * slot_28_12_0)), nil, slot_28_19_0)

	slot_28_26_0 = 82
	slot_28_27_0 = 24
	slot_28_28_0 = slot_28_10_0 + slot_28_8_0 - slot_28_27_0 - 10
	slot_28_29_0 = slot_28_9_0 + math.floor(slot_28_7_0 * 0.5) - slot_28_26_0 - 5
	slot_28_30_0 = slot_28_9_0 + math.floor(slot_28_7_0 * 0.5) + 5
	slot_28_31_0 = 5
	slot_28_32_0 = ui.get_mouse_position()
	slot_0_37_0.hover_yes = slot_28_29_0 <= slot_28_32_0.x and slot_28_32_0.x <= slot_28_29_0 + slot_28_26_0 and slot_28_28_0 <= slot_28_32_0.y and slot_28_32_0.y <= slot_28_28_0 + slot_28_27_0
	slot_0_37_0.hover_no = slot_28_30_0 <= slot_28_32_0.x and slot_28_32_0.x <= slot_28_30_0 + slot_28_26_0 and slot_28_28_0 <= slot_28_32_0.y and slot_28_32_0.y <= slot_28_28_0 + slot_28_27_0
	slot_28_33_0 = 0.18
	slot_0_49_0 = slot_0_49_0 + ((slot_0_37_0.hover_yes and 1 or 0) - slot_0_49_0) * slot_28_33_0
	slot_0_50_0 = slot_0_50_0 + ((slot_0_37_0.hover_no and 1 or 0) - slot_0_50_0) * slot_28_33_0
	slot_28_34_0 = slot_0_49_0
	slot_28_35_0 = slot_0_50_0

	function slot_28_36_0(arg_29_0)
		if slot_28_6_0 and slot_28_13_0 > 10 then
			render.blur(vector(arg_29_0, slot_28_28_0), vector(arg_29_0 + slot_28_26_0, slot_28_28_0 + slot_28_27_0), 4, slot_28_12_0 * 0.55, slot_28_31_0)
		end

		render.rect(vector(arg_29_0, slot_28_28_0), vector(arg_29_0 + slot_28_26_0, slot_28_28_0 + slot_28_27_0), color(slot_28_2_0.r, slot_28_2_0.g, slot_28_2_0.b, math.floor(slot_28_2_0.a * slot_28_12_0 * 1.3)), slot_28_31_0)

		if slot_28_34_0 > 0.005 then
			render.rect(vector(arg_29_0, slot_28_28_0), vector(arg_29_0 + slot_28_26_0, slot_28_28_0 + slot_28_27_0), color(slot_28_4_0.r, slot_28_4_0.g, slot_28_4_0.b, math.floor(slot_28_12_0 * slot_28_34_0 * 60)), slot_28_31_0)
		end

		render.rect(vector(arg_29_0 + 1, slot_28_28_0 + 1), vector(arg_29_0 + slot_28_26_0 - 1, slot_28_28_0 + 1 + math.floor(slot_28_27_0 * 0.45)), color(255, 255, 255, math.floor(slot_28_13_0 * 0.08 * (1 + slot_28_34_0 * 0.5))), slot_28_31_0)

		slot_29_1_0 = color(math.floor(slot_28_3_0.r + (slot_28_4_0.r - slot_28_3_0.r) * slot_28_34_0), math.floor(slot_28_3_0.g + (slot_28_4_0.g - slot_28_3_0.g) * slot_28_34_0), math.floor(slot_28_3_0.b + (slot_28_4_0.b - slot_28_3_0.b) * slot_28_34_0), math.floor((slot_28_3_0.a + (slot_28_4_0.a - slot_28_3_0.a) * slot_28_34_0) * slot_28_12_0))

		render.rect_outline(vector(arg_29_0, slot_28_28_0), vector(arg_29_0 + slot_28_26_0, slot_28_28_0 + slot_28_27_0), slot_29_1_0, 1, slot_28_31_0)

		slot_29_2_0 = render.measure_text(slot_28_16_0, nil, "yes")
		slot_29_3_0 = color(math.floor(slot_28_5_0.r + (slot_28_4_0.r - slot_28_5_0.r) * slot_28_34_0), math.floor(slot_28_5_0.g + (slot_28_4_0.g - slot_28_5_0.g) * slot_28_34_0), math.floor(slot_28_5_0.b + (slot_28_4_0.b - slot_28_5_0.b) * slot_28_34_0), math.floor(slot_28_12_0 * (slot_28_5_0.a * 0.65 + (slot_28_4_0.a - slot_28_5_0.a * 0.65) * slot_28_34_0)))

		render.text(slot_28_16_0, vector(arg_29_0 + math.floor((slot_28_26_0 - slot_29_2_0.x) * 0.5), slot_28_28_0 + math.floor((slot_28_27_0 - slot_29_2_0.y) * 0.5)), slot_29_3_0, nil, "yes")
	end

	function slot_28_37_0(arg_30_0)
		if slot_28_6_0 and slot_28_13_0 > 10 then
			render.blur(vector(arg_30_0, slot_28_28_0), vector(arg_30_0 + slot_28_26_0, slot_28_28_0 + slot_28_27_0), 4, slot_28_12_0 * 0.55, slot_28_31_0)
		end

		render.rect(vector(arg_30_0, slot_28_28_0), vector(arg_30_0 + slot_28_26_0, slot_28_28_0 + slot_28_27_0), color(slot_28_2_0.r, slot_28_2_0.g, slot_28_2_0.b, math.floor(slot_28_2_0.a * slot_28_12_0 * 1.3)), slot_28_31_0)

		if slot_28_35_0 > 0.005 then
			render.rect(vector(arg_30_0, slot_28_28_0), vector(arg_30_0 + slot_28_26_0, slot_28_28_0 + slot_28_27_0), color(slot_28_4_0.r, slot_28_4_0.g, slot_28_4_0.b, math.floor(slot_28_12_0 * slot_28_35_0 * 60)), slot_28_31_0)
		end

		render.rect(vector(arg_30_0 + 1, slot_28_28_0 + 1), vector(arg_30_0 + slot_28_26_0 - 1, slot_28_28_0 + 1 + math.floor(slot_28_27_0 * 0.45)), color(255, 255, 255, math.floor(slot_28_13_0 * 0.08 * (1 + slot_28_35_0 * 0.5))), slot_28_31_0)

		slot_30_1_0 = color(math.floor(slot_28_3_0.r + (slot_28_4_0.r - slot_28_3_0.r) * slot_28_35_0), math.floor(slot_28_3_0.g + (slot_28_4_0.g - slot_28_3_0.g) * slot_28_35_0), math.floor(slot_28_3_0.b + (slot_28_4_0.b - slot_28_3_0.b) * slot_28_35_0), math.floor((slot_28_3_0.a + (slot_28_4_0.a - slot_28_3_0.a) * slot_28_35_0) * slot_28_12_0))

		render.rect_outline(vector(arg_30_0, slot_28_28_0), vector(arg_30_0 + slot_28_26_0, slot_28_28_0 + slot_28_27_0), slot_30_1_0, 1, slot_28_31_0)

		slot_30_2_0 = render.measure_text(slot_28_16_0, nil, "no")
		slot_30_3_0 = color(math.floor(slot_28_5_0.r + (slot_28_4_0.r - slot_28_5_0.r) * slot_28_35_0), math.floor(slot_28_5_0.g + (slot_28_4_0.g - slot_28_5_0.g) * slot_28_35_0), math.floor(slot_28_5_0.b + (slot_28_4_0.b - slot_28_5_0.b) * slot_28_35_0), math.floor(slot_28_12_0 * (slot_28_5_0.a * 0.65 + (slot_28_4_0.a - slot_28_5_0.a * 0.65) * slot_28_35_0)))

		render.text(slot_28_16_0, vector(arg_30_0 + math.floor((slot_28_26_0 - slot_30_2_0.x) * 0.5), slot_28_28_0 + math.floor((slot_28_27_0 - slot_30_2_0.y) * 0.5)), slot_30_3_0, nil, "no")
	end

	slot_28_36_0(slot_28_29_0)
	slot_28_37_0(slot_28_30_0)
end

slot_0_52_0 = {
	new = function(arg_31_0, arg_31_1, arg_31_2, arg_31_3)
		local var_31_0 = arg_31_2 or vector(0, 0)
		local var_31_1 = ui.create("DRAGGING_" .. arg_31_1)
		local var_31_2 = {
			var_31_1:slider(arg_31_1 .. ":x", -16384, 16384, var_31_0.x),
			var_31_1:slider(arg_31_1 .. ":y", -16384, 16384, var_31_0.y)
		}

		var_31_2[1]:visibility(false)
		var_31_2[2]:visibility(false)

		local var_31_3 = {
			hover_anim = 0,
			dragging = false,
			grab_anim = 0,
			was_dragging = false,
			name = arg_31_1,
			axis = arg_31_3 or "xy",
			initial_pos = var_31_0,
			game_refs = var_31_2,
			position = var_31_0,
			size = vector(0, 0),
			drag_offset = vector(0, 0),
			smooth_x = var_31_0.x,
			smooth_y = var_31_0.y,
			reset_pos = function(arg_32_0)
				arg_32_0.game_refs[1]:set(arg_32_0.initial_pos.x)
				arg_32_0.game_refs[2]:set(arg_32_0.initial_pos.y)

				arg_32_0.smooth_x = arg_32_0.initial_pos.x
				arg_32_0.smooth_y = arg_32_0.initial_pos.y
				arg_32_0.position = vector(arg_32_0.initial_pos.x, arg_32_0.initial_pos.y)

				if arg_32_0.reset_callbacks then
					for iter_32_0, iter_32_1 in ipairs(arg_32_0.reset_callbacks) do
						iter_32_1()
					end
				end
			end,
			on_reset_pos = function(arg_33_0, arg_33_1)
				arg_33_0.reset_callbacks = arg_33_0.reset_callbacks or {}

				table.insert(arg_33_0.reset_callbacks, arg_33_1)
			end,
			set_pos = function(arg_34_0, arg_34_1)
				arg_34_0.game_refs[1]:set(arg_34_1.x)
				arg_34_0.game_refs[2]:set(arg_34_1.y)
			end,
			update = function(arg_35_0, arg_35_1)
				arg_35_0.size = arg_35_1
				slot_35_2_0 = ui.get_mouse_position()
				slot_35_3_0 = ui.get_alpha() > 0
				slot_35_4_0 = render.screen_size()
				slot_35_5_0 = arg_35_1.x * 0.5
				slot_35_6_0 = arg_35_1.y * 0.5
				slot_35_7_0 = arg_35_0.game_refs[1]:get()
				slot_35_8_0 = arg_35_0.game_refs[2]:get()

				if arg_35_0.axis == "y" then
					slot_35_7_0 = math.floor(slot_35_4_0.x * 0.5)

					arg_35_0.game_refs[1]:set(slot_35_7_0)
				else
					slot_35_9_1 = math.max(slot_35_5_0, math.min(slot_35_4_0.x - slot_35_5_0, slot_35_7_0))

					if slot_35_9_1 ~= slot_35_7_0 then
						arg_35_0.game_refs[1]:set(slot_35_9_1)

						slot_35_7_0 = slot_35_9_1
					end
				end

				slot_35_9_0 = math.max(slot_35_6_0, math.min(slot_35_4_0.y - slot_35_6_0, slot_35_8_0))

				if slot_35_9_0 ~= slot_35_8_0 then
					arg_35_0.game_refs[2]:set(slot_35_9_0)

					slot_35_8_0 = slot_35_9_0
				end

				slot_35_10_0 = false

				if slot_35_3_0 and slot_0_19_0 then
					slot_35_11_1, slot_35_12_1 = pcall(function()
						return slot_0_19_0:get()
					end)
					slot_35_10_0 = slot_35_11_1 and slot_35_12_1 == 2
				end

				if not slot_35_10_0 then
					if arg_35_0.dragging then
						slot_0_34_0 = nil
					end

					arg_35_0.dragging = false
					arg_35_0.hover_anim = arg_35_0.hover_anim + (0 - arg_35_0.hover_anim) * 0.12
					arg_35_0.grab_anim = arg_35_0.grab_anim + (0 - arg_35_0.grab_anim) * 0.12
					arg_35_0.smooth_x = arg_35_0.smooth_x + (slot_35_7_0 - arg_35_0.smooth_x) * 0.13
					arg_35_0.smooth_y = arg_35_0.smooth_y + (slot_35_8_0 - arg_35_0.smooth_y) * 0.13
					arg_35_0.position = vector(arg_35_0.smooth_x, arg_35_0.smooth_y)

					return
				end

				slot_35_11_0 = slot_35_3_0 and common.is_button_down(1)
				slot_35_12_0 = slot_35_2_0.x >= slot_35_7_0 - slot_35_5_0 and slot_35_2_0.x <= slot_35_7_0 + slot_35_5_0 and slot_35_2_0.y >= slot_35_8_0 - slot_35_6_0 and slot_35_2_0.y <= slot_35_8_0 + slot_35_6_0

				if slot_35_11_0 and not slot_0_37_0.visible then
					if not arg_35_0.dragging then
						if slot_35_12_0 and (slot_0_34_0 == nil or slot_0_34_0 == arg_35_0) then
							arg_35_0.dragging = true
							slot_0_34_0 = arg_35_0
							arg_35_0.drag_offset = vector(slot_35_7_0 - slot_35_2_0.x, slot_35_8_0 - slot_35_2_0.y)
						end
					else
						slot_35_13_1 = slot_35_7_0
						slot_35_14_2 = slot_35_2_0.y + arg_35_0.drag_offset.y

						if arg_35_0.axis == "xy" then
							slot_35_13_1 = slot_35_2_0.x + arg_35_0.drag_offset.x
							slot_35_13_1 = math.max(slot_35_5_0, math.min(slot_35_4_0.x - slot_35_5_0, slot_35_13_1))
						end

						slot_35_14_1 = math.max(slot_35_6_0, math.min(slot_35_4_0.y - slot_35_6_0, slot_35_14_2))

						if arg_35_0.axis ~= "y" then
							arg_35_0.game_refs[1]:set(slot_35_13_1)
						end

						arg_35_0.game_refs[2]:set(slot_35_14_1)
					end
				else
					if arg_35_0.dragging then
						slot_0_34_0 = nil
					end

					arg_35_0.dragging = false
				end

				slot_35_13_0 = slot_35_12_0 and 1 or 0
				arg_35_0.hover_anim = arg_35_0.hover_anim + (slot_35_13_0 - arg_35_0.hover_anim) * 0.12
				slot_35_14_0 = arg_35_0.dragging and 1 or 0
				arg_35_0.grab_anim = arg_35_0.grab_anim + (slot_35_14_0 - arg_35_0.grab_anim) * (arg_35_0.dragging and 0.22 or 0.09)
				slot_35_15_0 = arg_35_0.game_refs[1]:get()
				slot_35_16_0 = arg_35_0.game_refs[2]:get()
				slot_35_17_0 = arg_35_0.dragging and 1 or 0.13
				arg_35_0.smooth_x = arg_35_0.smooth_x + (slot_35_15_0 - arg_35_0.smooth_x) * slot_35_17_0
				arg_35_0.smooth_y = arg_35_0.smooth_y + (slot_35_16_0 - arg_35_0.smooth_y) * slot_35_17_0
				arg_35_0.position = vector(arg_35_0.smooth_x, arg_35_0.smooth_y)
				arg_35_0.was_dragging = arg_35_0.dragging
			end
		}

		table.insert(slot_0_17_0, var_31_3)

		return var_31_3
	end
}

events.render(function()
	if not (ui.get_alpha() > 0) then
		slot_0_37_0.visible = false
		slot_0_37_0.anim = 0
		slot_0_37_0.rmb_was_down = false

		return
	end

	local var_37_0 = false

	if slot_0_19_0 then
		local var_37_1, var_37_2 = pcall(function()
			return slot_0_19_0:get()
		end)

		var_37_0 = var_37_1 and var_37_2 == 2
	end

	local var_37_3 = render.screen_size()
	local var_37_4 = common.is_button_down(2)

	if var_37_0 and var_37_4 and not slot_0_37_0.rmb_was_down and not slot_0_37_0.visible then
		slot_0_37_0.visible = true
		slot_0_37_0.choice = nil
	end

	slot_0_37_0.rmb_was_down = var_37_4

	local var_37_5 = slot_0_37_0.visible and 1 or 0

	slot_0_37_0.anim = slot_0_37_0.anim + (var_37_5 - slot_0_37_0.anim) * 0.18

	if var_37_0 then
		local var_37_6 = false

		for iter_37_0, iter_37_1 in ipairs(slot_0_17_0) do
			if iter_37_1.dragging then
				var_37_6 = true

				break
			end
		end

		slot_0_38_0.anim = slot_0_38_0.anim + ((var_37_6 and 1 or 0) - slot_0_38_0.anim) * 0.15

		slot_0_39_0(var_37_3, slot_0_38_0.anim)
	else
		slot_0_38_0.anim = slot_0_38_0.anim + (0 - slot_0_38_0.anim) * 0.15
	end

	if slot_0_37_0.anim > 0.01 and common.is_button_down(1) and slot_0_37_0.visible then
		if slot_0_37_0.hover_yes then
			for iter_37_2, iter_37_3 in ipairs(slot_0_17_0) do
				iter_37_3:reset_pos()
			end

			for iter_37_4, iter_37_5 in ipairs(slot_0_35_0) do
				iter_37_5()
			end

			slot_0_37_0.visible = false
		elseif slot_0_37_0.hover_no then
			slot_0_37_0.visible = false
		end
	end
end)

slot_0_53_0 = false

function slot_0_54_0()
	if slot_0_53_0 then
		return
	end

	slot_0_53_0 = true

	events.render(function()
		if slot_0_37_0.anim <= 0.01 then
			return
		end

		local var_40_0 = render.screen_size()

		slot_0_51_0(var_40_0)
	end)
end

slot_0_55_0 = {}
slot_0_56_0 = {
	get_original = function(arg_41_0, arg_41_1)
		return tonumber(arg_41_1:string())
	end
}
slot_0_57_0 = {
	animate = function(arg_42_0, arg_42_1, arg_42_2, arg_42_3, arg_42_4)
		if not arg_42_4 or arg_42_4:gsub(" ", "") == "" then
			return arg_42_4
		end

		local var_42_0 = ""
		local var_42_1 = globals.realtime * arg_42_1
		local var_42_2 = 1
		local var_42_3 = #arg_42_4

		while var_42_2 <= var_42_3 do
			local var_42_4 = arg_42_4:byte(var_42_2)

			if (var_42_4 == 208 or var_42_4 == 209) and arg_42_4:byte(var_42_2 + 1) then
				local var_42_5 = arg_42_4:sub(var_42_2, var_42_2 + 1)
				local var_42_6 = (math.sin(var_42_1 + var_42_2 / 3) + 1) / 2

				var_42_0 = var_42_0 .. "\a" .. arg_42_2:lerp(arg_42_3, math.clamp(var_42_6, 0, 1)):to_hex() .. var_42_5
				var_42_2 = var_42_2 + 2
			else
				local var_42_7 = (math.sin(var_42_1 + var_42_2 / 3) + 1) / 2

				var_42_0 = var_42_0 .. "\a" .. arg_42_2:lerp(arg_42_3, math.clamp(var_42_7, 0, 1)):to_hex() .. arg_42_4:sub(var_42_2, var_42_2)
				var_42_2 = var_42_2 + 1
			end
		end

		return var_42_0
	end,
	colored = function(arg_43_0, ...)
		local var_43_0 = ""

		for iter_43_0, iter_43_1 in pairs({
			...
		}) do
			var_43_0 = var_43_0 .. "\a" .. iter_43_1[2]:to_hex() .. iter_43_1[1]
		end

		return var_43_0
	end
}
slot_0_58_0 = {}
slot_0_59_1 = {}
slot_0_60_2 = {
	[0] = "NONE",
	"M1",
	"M2",
	"M3",
	"M4",
	"M5",
	nil,
	nil,
	"BKSP",
	"TAB",
	nil,
	nil,
	nil,
	"ENTER",
	nil,
	nil,
	"SHIFT",
	"CTRL",
	"ALT",
	nil,
	"CAPS",
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	"ESC",
	nil,
	nil,
	nil,
	nil,
	"SPACE",
	"PGUP",
	"PGDN",
	"END",
	"HOME",
	"LEFT",
	"UP",
	"RIGHT",
	"DOWN",
	nil,
	nil,
	nil,
	nil,
	"INS",
	"DEL",
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
	[219] = "[",
	[189] = "-",
	[222] = "'",
	[188] = ",",
	[221] = "]",
	[191] = "/",
	[220] = "\\",
	[190] = ".",
	[144] = "NUMLK",
	[192] = "`",
	[187] = "=",
	[186] = ";"
}

for iter_0_0 = 48, 57 do
	slot_0_60_2[iter_0_0] = string.char(iter_0_0)
end

for iter_0_1 = 65, 90 do
	slot_0_60_2[iter_0_1] = string.char(iter_0_1)
end

for iter_0_2 = 96, 105 do
	slot_0_60_2[iter_0_2] = "NUM" .. iter_0_2 - 96
end

function slot_0_58_0.update(arg_44_0)
	for iter_44_0 in pairs(slot_0_59_1) do
		slot_0_59_1[iter_44_0] = nil
	end

	for iter_44_1, iter_44_2 in ipairs(ui.get_binds()) do
		slot_0_59_1[iter_44_2.name] = {
			value = iter_44_2.value,
			active = iter_44_2.active,
			mode = iter_44_2.mode
		}
	end
end

function slot_0_58_0.is_active(arg_45_0, arg_45_1)
	local var_45_0 = slot_0_59_1[arg_45_1]

	return var_45_0 and var_45_0.active or false
end

function slot_0_58_0.get_label(arg_46_0, arg_46_1)
	local var_46_0 = slot_0_59_1[arg_46_1]

	if not var_46_0 or var_46_0.value == 0 then
		return "[ - ]"
	end

	return "[ " .. (slot_0_60_2[var_46_0.value] or "K" .. var_46_0.value) .. " ]"
end

function slot_0_58_0.get_state(arg_47_0, arg_47_1)
	local var_47_0 = slot_0_59_1[arg_47_1]

	if not var_47_0 then
		return {
			0,
			false
		}
	end

	return {
		var_47_0.value,
		var_47_0.active
	}
end

slot_0_59_0 = {
	info = {}
}

function slot_0_60_1(arg_48_0)
	return "\aA0A0A0FF" .. string.lower(arg_48_0)
end

slot_0_61_2 = {
	antiaim = ui.get_icon("shield-halved"),
	visuals = ui.get_icon("eye"),
	misc = ui.get_icon("gears")
}
slot_0_19_0 = {
	get = function()
		return 2
	end
}
slot_0_63_3 = slot_0_1_0.create(slot_0_61_2.antiaim, "   ", 1)
slot_0_64_4 = {
	"\f<sliders>\r  general",
	"\f<hammer>\r  builder",
	"\f<shield>\r  defensive"
}
slot_0_65_5 = 1
slot_0_66_5 = 2
slot_0_67_5 = 3
slot_0_68_5 = slot_0_63_3:list("", slot_0_64_4)
slot_0_69_4 = slot_0_63_3:list("\nselector", {
	"\f<gear>\r  main",
	"\f<floppy-disk>\r  config"
}):depend({
	slot_0_68_5,
	slot_0_65_5
})
slot_0_70_5 = 1
slot_0_71_6 = 2
slot_0_72_6 = slot_0_1_0.create(slot_0_61_2.antiaim, "         ", 2)
slot_0_73_4 = {}
slot_0_74_5 = {}
slot_0_75_7 = {
	switch = slot_0_63_3:switch("\v\f<robot>\r  ai peek", false):depend({
		slot_0_68_5,
		slot_0_65_5
	}, {
		slot_0_69_4,
		slot_0_70_5
	})
}
slot_0_76_10 = slot_0_75_7.switch:create()
slot_0_75_7.color = slot_0_76_10:color_picker(slot_0_60_1("color"), color(150, 195, 255, 255))
slot_0_75_7.switch_to_knife = slot_0_76_10:switch(slot_0_60_1("knife switch"), false)
slot_0_74_5.aipeek = slot_0_75_7
slot_0_76_9 = {
	switch = slot_0_63_3:switch("\v\f<plane-up>\r  air exploit", false):depend({
		slot_0_68_5,
		slot_0_65_5
	}, {
		slot_0_69_4,
		slot_0_70_5
	})
}
slot_0_77_9 = slot_0_76_9.switch:create()
slot_0_76_9.visualization = slot_0_77_9:switch(slot_0_60_1("visualization"), true)
slot_0_76_9.color = slot_0_77_9:color_picker(slot_0_60_1("color"), color(150, 195, 255, 255)):depend({
	slot_0_76_9.visualization,
	true
})
slot_0_74_5.air_exploit = slot_0_76_9
slot_0_77_8 = {
	switch = slot_0_63_3:switch("\v\f<eye-slash>\r  auto hide shots", false):depend({
		slot_0_68_5,
		slot_0_65_5
	}, {
		slot_0_69_4,
		slot_0_70_5
	})
}
slot_0_78_11 = slot_0_77_8.switch:create()
slot_0_79_13 = {
	"awp",
	"pistol",
	"auto",
	"scout",
	"deagle/rev"
}
slot_0_80_10 = slot_0_78_11:list(slot_0_60_1("weapon"), slot_0_79_13)
slot_0_77_8.wpn_sel = slot_0_80_10
slot_0_81_10 = {
	"standing",
	"running",
	"slowing",
	"crouching",
	"sneaking",
	"air",
	"air crouching"
}
slot_0_77_8.awp = slot_0_78_11:switch(slot_0_60_1("enabled"), true):depend({
	slot_0_80_10,
	1
})
slot_0_77_8.awp_states = slot_0_78_11:selectable(slot_0_60_1("active on states"), slot_0_81_10):depend({
	slot_0_80_10,
	1
})
slot_0_77_8.pistol = slot_0_78_11:switch(slot_0_60_1("enabled"), true):depend({
	slot_0_80_10,
	2
})
slot_0_77_8.pistol_states = slot_0_78_11:selectable(slot_0_60_1("active on states"), slot_0_81_10):depend({
	slot_0_80_10,
	2
})
slot_0_77_8.auto = slot_0_78_11:switch(slot_0_60_1("enabled"), false):depend({
	slot_0_80_10,
	3
})
slot_0_77_8.auto_states = slot_0_78_11:selectable(slot_0_60_1("active on states"), slot_0_81_10):depend({
	slot_0_80_10,
	3
})
slot_0_77_8.scout = slot_0_78_11:switch(slot_0_60_1("enabled"), false):depend({
	slot_0_80_10,
	4
})
slot_0_77_8.scout_states = slot_0_78_11:selectable(slot_0_60_1("active on states"), slot_0_81_10):depend({
	slot_0_80_10,
	4
})
slot_0_77_8.deagle = slot_0_78_11:switch(slot_0_60_1("enabled"), false):depend({
	slot_0_80_10,
	5
})
slot_0_77_8.deagle_states = slot_0_78_11:selectable(slot_0_60_1("active on states"), slot_0_81_10):depend({
	slot_0_80_10,
	5
})
slot_0_74_5.ahs = slot_0_77_8
slot_0_78_10 = {
	enabled = slot_0_63_3:switch("\v\f<person-chalkboard>\r  legit aa"):depend({
		slot_0_68_5,
		slot_0_65_5
	}, {
		slot_0_69_4,
		slot_0_70_5
	})
}
slot_0_78_10.mode = slot_0_78_10.enabled:create():combo(slot_0_60_1("yaw base"), {
	"local view",
	"at target"
}):depend({
	slot_0_78_10.enabled,
	true
})
slot_0_74_5.legit_aa = slot_0_78_10
slot_0_79_12 = {
	switch = slot_0_63_3:switch("\v\f<rotate>\r  freestanding"):depend({
		slot_0_68_5,
		slot_0_65_5
	}, {
		slot_0_69_4,
		slot_0_70_5
	})
}
slot_0_79_12.static = slot_0_79_12.switch:create():switch(slot_0_60_1("static body yaw"))
slot_0_74_5.freestanding = slot_0_79_12
slot_0_80_9 = {
	select = slot_0_63_3:combo("\v\f<arrow-right-arrow-left>\r  manual yaw", {
		"disabled",
		"left",
		"right",
		"forward",
		"back"
	}):depend({
		slot_0_68_5,
		slot_0_65_5
	}, {
		slot_0_69_4,
		slot_0_70_5
	})
}
slot_0_81_9 = slot_0_80_9.select:create()
slot_0_80_9.static = slot_0_81_9:switch(slot_0_60_1("static"))
slot_0_80_9.inverter = slot_0_81_9:switch(slot_0_60_1("inverter")):depend({
	slot_0_80_9.static,
	true
})
slot_0_80_9.force_static = slot_0_81_9:switch(slot_0_60_1("force static"))
slot_0_80_9.base = slot_0_81_9:combo(slot_0_60_1("yaw base"), {
	"local view",
	"at target"
})
slot_0_74_5.manual_yaw = slot_0_80_9
slot_0_74_5.avoid_backstab = {
	switch = slot_0_72_6:switch("\v\f<shield>\r  avoid backstab"):depend({
		slot_0_68_5,
		slot_0_65_5
	}, {
		slot_0_69_4,
		slot_0_70_5
	})
}
slot_0_82_8 = {
	switch = slot_0_72_6:switch("\v\f<helmet-safety>\r  safe head"):depend({
		slot_0_68_5,
		slot_0_65_5
	}, {
		slot_0_69_4,
		slot_0_70_5
	})
}
slot_0_74_5.safe_head = slot_0_82_8
slot_0_83_11 = {
	select = slot_0_72_6:switch("\v\f<shield-halved>\r  force defensive"):depend({
		slot_0_68_5,
		slot_0_65_5
	}, {
		slot_0_69_4,
		slot_0_70_5
	})
}
slot_0_84_14 = slot_0_83_11.select:create()
slot_0_83_11.activate = slot_0_84_14:combo(slot_0_60_1("activate"), {
	"always",
	"conditions"
}):depend({
	slot_0_83_11.select,
	true
})
slot_0_83_11.conditions = slot_0_84_14:selectable(slot_0_60_1("conditions"), {
	"standing",
	"running",
	"air",
	"air crouching",
	"crouching",
	"sneaking",
	"slowwalk",
	"quickpeek"
}):depend({
	slot_0_83_11.select,
	true
}, {
	slot_0_83_11.activate,
	"conditions"
})
slot_0_83_11.game_events = slot_0_84_14:selectable(slot_0_60_1("game events"), {
	"weapon switch",
	"weapon reload"
}):depend({
	slot_0_83_11.select,
	true
})
slot_0_83_11.additions_normal = slot_0_84_14:selectable(slot_0_60_1("additions"), {
	"ignore grenade"
}):depend({
	slot_0_83_11.select,
	true
})
slot_0_83_11.hide_shots = slot_0_84_14:combo(slot_0_60_1("hide shots"), {
	"favor fire rate",
	"favor fake lag",
	"break lc"
})
slot_0_74_5.break_lc = slot_0_83_11
slot_0_84_13 = {}
slot_0_85_14 = slot_0_1_0.create(slot_0_61_2.antiaim, " \n", 2):depend({
	slot_0_68_5,
	slot_0_65_5
}, {
	slot_0_69_4,
	slot_0_71_6
})
slot_0_84_13.list = slot_0_85_14:list("\n", {})
slot_0_84_13.name = slot_0_85_14:input("config name", "")
slot_0_84_13.tabs = slot_0_85_14:listable("\aA0A0A0FFtabs", {
	"\f<shield-halved>\r  anti-aim",
	"    \f<caret-right>\r  general",
	"    \f<caret-right>\r  builder",
	"    \f<caret-right>\r  defensive",
	"\f<eye>\r  visuals",
	"    \f<caret-right>\r  general",
	"    \f<caret-right>\r  ui",
	"\f<gears>\r  misc"
})

slot_0_84_13.tabs:visibility(false)

slot_0_84_13.load = slot_0_85_14:button("  \v\f<toggle-on>\r  load  ", nil, true)
slot_0_84_13.save = slot_0_85_14:button("  \v\f<floppy-disk>\r  save  ", nil, true)
slot_0_84_13.create = slot_0_85_14:button("  \v\f<plus>\r  create  ", nil, true)
slot_0_84_13.delete = slot_0_85_14:button("  \aFF4D4DFF\f<trash-xmark>\r  delete  ", nil, true)
slot_0_84_13.import = slot_0_85_14:button("  \f<download>\r  import  ", nil, true)
slot_0_84_13.export = slot_0_85_14:button("  \f<file-export>\r  export  ", nil, true)
slot_0_84_13.cancel = slot_0_85_14:button("        \aDB6361FF\f<xmark>\r  cancel        ", nil, true)

slot_0_84_13.cancel:visibility(false)

slot_0_84_13.confirm = slot_0_85_14:button("       \v\f<check>\r  confirm       ", nil, true)

slot_0_84_13.confirm:visibility(false)

slot_0_84_13.information = {
	creator = {
		name = function()
			return
		end
	}
}
slot_0_74_5.presets = slot_0_84_13
slot_0_59_0.info.presets = slot_0_84_13
slot_0_73_4.general = slot_0_74_5
slot_0_75_6 = {}
slot_0_76_8 = slot_0_63_3:list("\v\f<hammer>\r  builder state", slot_0_12_0.states):depend({
	slot_0_68_5,
	slot_0_66_5
})
slot_0_73_4.configure = {
	state = slot_0_76_8
}
slot_0_77_7 = slot_0_72_6:label("\v\f<sliders>\r  state settings"):depend({
	slot_0_68_5,
	slot_0_66_5
})
slot_0_78_9 = slot_0_73_4.general.break_lc
slot_0_79_11 = {}

for iter_0_3, iter_0_4 in ipairs(slot_0_12_0.states) do
	slot_0_79_11[iter_0_4] = {}
	slot_0_85_13 = slot_0_79_11[iter_0_4]
	slot_0_85_13.state_label = slot_0_72_6:label(("\aA0A0A0FFcurrently editing: \aFFFFFFFF%s"):format(iter_0_4)):depend({
		slot_0_68_5,
		slot_0_66_5
	}, {
		slot_0_76_8,
		iter_0_3
	})
	slot_0_85_13.allow_state = slot_0_72_6:switch(slot_0_60_1("enable state"), true):depend({
		slot_0_68_5,
		slot_0_66_5
	}, {
		slot_0_76_8,
		iter_0_3
	})
	slot_0_85_13.yaw = slot_0_72_6:label(slot_0_60_1("real angle")):depend({
		slot_0_68_5,
		slot_0_66_5
	}, {
		slot_0_76_8,
		iter_0_3
	}, {
		slot_0_85_13.allow_state,
		true
	})
	slot_0_86_18 = slot_0_85_13.yaw:create()
	slot_0_85_13.yaw_left = slot_0_86_18:slider(slot_0_60_1("left"), -180, 180, 0)
	slot_0_85_13.yaw_right = slot_0_86_18:slider(slot_0_60_1("right"), -180, 180, 0)
	slot_0_85_13.delay_seq_sliders = {}
	slot_0_85_13.delay_seq_idx = 0
	slot_0_85_13.yaw_base = slot_0_72_6:combo(slot_0_60_1("base"), {
		"at target",
		"local view"
	}, "at target"):depend({
		slot_0_68_5,
		slot_0_66_5
	}, {
		slot_0_76_8,
		iter_0_3
	}, {
		slot_0_85_13.allow_state,
		true
	})
	slot_0_85_13.modifier = slot_0_72_6:combo(slot_0_60_1("offset"), {
		"disabled",
		"center",
		"offset",
		"random",
		"spin",
		"3-way",
		"5-way",
		"skitter",
		"chaos",
		"dual"
	}):depend({
		slot_0_68_5,
		slot_0_66_5
	}, {
		slot_0_76_8,
		iter_0_3
	}, {
		slot_0_85_13.allow_state,
		true
	})
	slot_0_86_17 = slot_0_85_13.modifier:create()
	slot_0_85_13.randomize = slot_0_86_17:switch(slot_0_60_1("randomize"), false):depend({
		slot_0_76_8,
		iter_0_3
	}, {
		slot_0_85_13.modifier,
		"disabled",
		true
	})
	slot_0_85_13.modifier_mode = slot_0_86_17:combo(slot_0_60_1("distribution"), {
		"uniform",
		"weighted",
		"pulse",
		"custom"
	}):depend({
		slot_0_76_8,
		iter_0_3
	}, {
		slot_0_85_13.modifier,
		"disabled",
		true
	}, {
		slot_0_85_13.randomize,
		true
	})
	slot_0_85_13.min = slot_0_86_17:slider(slot_0_60_1("min"), -180, 180, -60):depend({
		slot_0_76_8,
		iter_0_3
	}, {
		slot_0_85_13.modifier,
		"disabled",
		true
	}, {
		slot_0_85_13.randomize,
		true
	}, {
		slot_0_85_13.modifier_mode,
		"uniform"
	})
	slot_0_85_13.max = slot_0_86_17:slider(slot_0_60_1("max"), -180, 180, 60):depend({
		slot_0_76_8,
		iter_0_3
	}, {
		slot_0_85_13.modifier,
		"disabled",
		true
	}, {
		slot_0_85_13.randomize,
		true
	}, {
		slot_0_85_13.modifier_mode,
		"uniform"
	})
	slot_0_85_13.modifier_weight_center = slot_0_86_17:slider(slot_0_60_1("center bias"), 0, 100, 50, 1, "%"):depend({
		slot_0_76_8,
		iter_0_3
	}, {
		slot_0_85_13.modifier,
		"disabled",
		true
	}, {
		slot_0_85_13.randomize,
		true
	}, {
		slot_0_85_13.modifier_mode,
		"weighted"
	})
	slot_0_85_13.modifier_weight_spread = slot_0_86_17:slider(slot_0_60_1("spread"), 5, 180, 60, 1, "°"):depend({
		slot_0_76_8,
		iter_0_3
	}, {
		slot_0_85_13.modifier,
		"disabled",
		true
	}, {
		slot_0_85_13.randomize,
		true
	}, {
		slot_0_85_13.modifier_mode,
		"weighted"
	})
	slot_0_85_13.modifier_pulse_a = slot_0_86_17:slider(slot_0_60_1("value a"), -180, 180, -60):depend({
		slot_0_76_8,
		iter_0_3
	}, {
		slot_0_85_13.modifier,
		"disabled",
		true
	}, {
		slot_0_85_13.randomize,
		true
	}, {
		slot_0_85_13.modifier_mode,
		"pulse"
	})
	slot_0_85_13.modifier_pulse_b = slot_0_86_17:slider(slot_0_60_1("value b"), -180, 180, 60):depend({
		slot_0_76_8,
		iter_0_3
	}, {
		slot_0_85_13.modifier,
		"disabled",
		true
	}, {
		slot_0_85_13.randomize,
		true
	}, {
		slot_0_85_13.modifier_mode,
		"pulse"
	})
	slot_0_85_13.modifier_pulse_rate = slot_0_86_17:slider(slot_0_60_1("pulse rate"), 1, 22, 8, 1, "t"):depend({
		slot_0_76_8,
		iter_0_3
	}, {
		slot_0_85_13.modifier,
		"disabled",
		true
	}, {
		slot_0_85_13.randomize,
		true
	}, {
		slot_0_85_13.modifier_mode,
		"pulse"
	})
	slot_0_85_13.modifier_custom_sliders = slot_0_86_17:slider(slot_0_60_1("steps"), 2, 6, 2):depend({
		slot_0_76_8,
		iter_0_3
	}, {
		slot_0_85_13.modifier,
		"disabled",
		true
	}, {
		slot_0_85_13.randomize,
		true
	}, {
		slot_0_85_13.modifier_mode,
		"custom"
	})

	for iter_0_5 = 1, 6 do
		slot_0_85_13["modifier_sliders_" .. iter_0_5] = slot_0_86_17:slider(slot_0_60_1(("step %d"):format(iter_0_5)), -180, 180, 0):depend({
			slot_0_76_8,
			iter_0_3
		}, {
			slot_0_85_13.modifier,
			"disabled",
			true
		}, {
			slot_0_85_13.randomize,
			true
		}, {
			slot_0_85_13.modifier_mode,
			"custom"
		}, {
			slot_0_85_13.modifier_custom_sliders,
			function()
				return iter_0_5 <= 2 or slot_0_85_13.modifier_custom_sliders.value >= iter_0_5
			end
		})
	end

	slot_0_85_13.modifier_offset = slot_0_86_17:slider(slot_0_60_1("offset"), -180, 180, 0):depend({
		slot_0_76_8,
		iter_0_3
	}, {
		slot_0_85_13.modifier,
		"disabled",
		true
	}, {
		slot_0_85_13.randomize,
		false
	}, {
		slot_0_85_13.modifier,
		function()
			return slot_0_85_13.modifier.value ~= "dual"
		end
	})
	slot_0_85_13.skitter_deg = slot_0_86_17:slider(slot_0_60_1("degree"), 1, 90, 45, 1, "°"):depend({
		slot_0_76_8,
		iter_0_3
	}, {
		slot_0_85_13.modifier,
		"skitter"
	})
	slot_0_85_13.dual_left_off = slot_0_86_17:slider(slot_0_60_1("left offset"), -180, 180, -60, 1, "°"):depend({
		slot_0_76_8,
		iter_0_3
	}, {
		slot_0_85_13.modifier,
		"dual"
	})
	slot_0_85_13.dual_right_off = slot_0_86_17:slider(slot_0_60_1("right offset"), -180, 180, 60, 1, "°"):depend({
		slot_0_76_8,
		iter_0_3
	}, {
		slot_0_85_13.modifier,
		"dual"
	})
	slot_0_85_13.dual_distribution = slot_0_86_17:combo(slot_0_60_1("distribution"), {
		"alternate",
		"random",
		"pulse"
	}):depend({
		slot_0_76_8,
		iter_0_3
	}, {
		slot_0_85_13.modifier,
		"dual"
	})
	slot_0_85_13.dual_rate = slot_0_86_17:slider(slot_0_60_1("rate"), 1, 16, 2, 1, "t"):depend({
		slot_0_76_8,
		iter_0_3
	}, {
		slot_0_85_13.modifier,
		"dual"
	}, {
		slot_0_85_13.dual_distribution,
		function()
			return slot_0_85_13.dual_distribution.value ~= "random"
		end
	})
	slot_0_85_13.dual_rate_b = slot_0_86_17:slider(slot_0_60_1("rate b"), 1, 16, 4, 1, "t"):depend({
		slot_0_76_8,
		iter_0_3
	}, {
		slot_0_85_13.modifier,
		"dual"
	}, {
		slot_0_85_13.dual_distribution,
		"pulse"
	})
	slot_0_85_13.body_yaw = slot_0_72_6:switch(slot_0_60_1("fake yaw"), false):depend({
		slot_0_68_5,
		slot_0_66_5
	}, {
		slot_0_76_8,
		iter_0_3
	}, {
		slot_0_85_13.allow_state,
		true
	})
	slot_0_86_16 = slot_0_85_13.body_yaw:create()
	slot_0_85_13.body_yaw_mode = slot_0_86_16:combo(slot_0_60_1("mode"), {
		"static",
		"jitter"
	}):depend({
		slot_0_76_8,
		iter_0_3
	}, {
		slot_0_85_13.body_yaw,
		true
	})
	slot_0_85_13.body_yaw_delay_mode = slot_0_86_16:combo(slot_0_60_1("delay mode"), {
		"static",
		"random",
		"sequence"
	}):depend({
		slot_0_76_8,
		iter_0_3
	}, {
		slot_0_85_13.body_yaw,
		true
	}, {
		slot_0_85_13.body_yaw_mode,
		"jitter"
	})
	slot_0_85_13.body_yaw_delay = slot_0_86_16:slider(slot_0_60_1("delay"), 0, 20, 0, 1, function(arg_54_0)
		if arg_54_0 == 0 then
			return "Off"
		end

		return arg_54_0 .. (arg_54_0 == 1 and " tick" or " ticks")
	end):depend({
		slot_0_76_8,
		iter_0_3
	}, {
		slot_0_85_13.body_yaw,
		true
	}, {
		slot_0_85_13.body_yaw_mode,
		"jitter"
	}, {
		slot_0_85_13.body_yaw_delay_mode,
		"static"
	})
	slot_0_85_13.body_yaw_delay_random_min = slot_0_86_16:slider(slot_0_60_1("min"), 1, 20, 2, 1, "t"):depend({
		slot_0_76_8,
		iter_0_3
	}, {
		slot_0_85_13.body_yaw,
		true
	}, {
		slot_0_85_13.body_yaw_mode,
		"jitter"
	}, {
		slot_0_85_13.body_yaw_delay_mode,
		"random"
	})
	slot_0_85_13.body_yaw_delay_random_max = slot_0_86_16:slider(slot_0_60_1("max"), 1, 20, 6, 1, "t"):depend({
		slot_0_76_8,
		iter_0_3
	}, {
		slot_0_85_13.body_yaw,
		true
	}, {
		slot_0_85_13.body_yaw_mode,
		"jitter"
	}, {
		slot_0_85_13.body_yaw_delay_mode,
		"random"
	})
	slot_0_85_13.body_yaw_delay_seq_count = slot_0_86_16:slider(slot_0_60_1("steps"), 2, 10, 3):depend({
		slot_0_76_8,
		iter_0_3
	}, {
		slot_0_85_13.body_yaw,
		true
	}, {
		slot_0_85_13.body_yaw_mode,
		"jitter"
	}, {
		slot_0_85_13.body_yaw_delay_mode,
		"sequence"
	})
	slot_0_85_13.body_yaw_delay_seq_sliders = {}

	for iter_0_6 = 1, 10 do
		slot_0_91_12 = iter_0_6
		slot_0_92_12 = "body_yaw_delay_seq_s" .. slot_0_91_12
		slot_0_85_13[slot_0_92_12] = slot_0_86_16:slider(slot_0_60_1("step " .. slot_0_91_12), 0, 20, 4, 1, function(arg_55_0)
			if arg_55_0 == 0 then
				return "Off"
			end

			return arg_55_0 .. "t"
		end):depend({
			slot_0_76_8,
			iter_0_3
		}, {
			slot_0_85_13.body_yaw,
			true
		}, {
			slot_0_85_13.body_yaw_mode,
			"jitter"
		}, {
			slot_0_85_13.body_yaw_delay_mode,
			"sequence"
		}, {
			slot_0_85_13.body_yaw_delay_seq_count,
			function()
				return slot_0_85_13.body_yaw_delay_seq_count:get() >= slot_0_91_12
			end
		})
		slot_0_85_13.body_yaw_delay_seq_sliders[slot_0_91_12] = slot_0_85_13[slot_0_92_12]
	end

	slot_0_85_13.fake_limit = slot_0_86_16:slider(slot_0_60_1("limit"), -60, 60, 60):depend({
		slot_0_76_8,
		iter_0_3
	}, {
		slot_0_85_13.body_yaw,
		true
	}, {
		slot_0_85_13.body_yaw_mode,
		"static"
	})
	slot_0_85_13.left_limit = slot_0_86_16:slider(slot_0_60_1("left"), 0, 60, 60):depend({
		slot_0_76_8,
		iter_0_3
	}, {
		slot_0_85_13.body_yaw,
		true
	}, {
		slot_0_85_13.body_yaw_mode,
		"jitter"
	})
	slot_0_85_13.right_limit = slot_0_86_16:slider(slot_0_60_1("right"), 0, 60, 60):depend({
		slot_0_76_8,
		iter_0_3
	}, {
		slot_0_85_13.body_yaw,
		true
	}, {
		slot_0_85_13.body_yaw_mode,
		"jitter"
	})
	slot_0_85_13.freestand_peek = slot_0_86_16:combo(slot_0_60_1("freestand"), {
		"off",
		"peek fake",
		"peek real"
	}, "off"):depend({
		slot_0_76_8,
		iter_0_3
	}, {
		slot_0_85_13.body_yaw,
		true
	})
	slot_0_85_13.choke = slot_0_72_6:combo(slot_0_60_1("tickbase"), {
		"default",
		"custom"
	}):depend({
		slot_0_68_5,
		slot_0_66_5
	}, {
		slot_0_76_8,
		iter_0_3
	}, {
		slot_0_85_13.allow_state,
		true
	})
	slot_0_86_15 = slot_0_85_13.choke:create()
	slot_0_85_13.random_choke = slot_0_86_15:switch(slot_0_60_1("randomize"), false):depend({
		slot_0_76_8,
		iter_0_3
	}, {
		slot_0_85_13.choke,
		"custom"
	})
	slot_0_85_13.choke_slider = slot_0_86_15:slider(slot_0_60_1("ticks"), 2, 22, 16, 1, "t"):depend({
		slot_0_76_8,
		iter_0_3
	}, {
		slot_0_85_13.choke,
		"custom"
	}, {
		slot_0_85_13.random_choke,
		false
	})
	slot_0_85_13.choke_method = slot_0_86_15:combo(slot_0_60_1("random mode"), {
		"range",
		"sequence"
	}):depend({
		slot_0_76_8,
		iter_0_3
	}, {
		slot_0_85_13.choke,
		"custom"
	}, {
		slot_0_85_13.random_choke,
		true
	})
	slot_0_85_13.choke_from = slot_0_86_15:slider(slot_0_60_1("min"), 1, 22, 8, 1, "t"):depend({
		slot_0_76_8,
		iter_0_3
	}, {
		slot_0_85_13.choke,
		"custom"
	}, {
		slot_0_85_13.random_choke,
		true
	}, {
		slot_0_85_13.choke_method,
		"range"
	})
	slot_0_85_13.choke_to = slot_0_86_15:slider(slot_0_60_1("max"), 1, 22, 16, 1, "t"):depend({
		slot_0_76_8,
		iter_0_3
	}, {
		slot_0_85_13.choke,
		"custom"
	}, {
		slot_0_85_13.random_choke,
		true
	}, {
		slot_0_85_13.choke_method,
		"range"
	})
	slot_0_85_13.choke_sliders = slot_0_86_15:slider(slot_0_60_1("steps"), 2, 6, 2):depend({
		slot_0_76_8,
		iter_0_3
	}, {
		slot_0_85_13.choke,
		"custom"
	}, {
		slot_0_85_13.random_choke,
		true
	}, {
		slot_0_85_13.choke_method,
		"sequence"
	})

	for iter_0_7 = 1, 6 do
		slot_0_85_13["choke1_" .. iter_0_7] = slot_0_86_15:slider(slot_0_60_1(("step %d"):format(iter_0_7)), 2, 22, 4, 1, "t"):depend({
			slot_0_76_8,
			iter_0_3
		}, {
			slot_0_85_13.choke,
			"custom"
		}, {
			slot_0_85_13.random_choke,
			true
		}, {
			slot_0_85_13.choke_method,
			"sequence"
		}, {
			slot_0_85_13.choke_sliders,
			function()
				return iter_0_7 <= 2 or slot_0_85_13.choke_sliders.value >= iter_0_7
			end
		})
	end

	slot_0_85_13.anti_bruteforce = slot_0_72_6:switch(slot_0_60_1("anti bruteforce"), false):depend({
		slot_0_68_5,
		slot_0_66_5
	}, {
		slot_0_76_8,
		iter_0_3
	}, {
		slot_0_85_13.allow_state,
		true
	})
	slot_0_86_14 = slot_0_85_13.anti_bruteforce:create()
	slot_0_85_13.abf_reset_timer = slot_0_86_14:slider(slot_0_60_1("reset"), 1, 10, 3, 1, "s"):depend({
		slot_0_85_13.anti_bruteforce,
		true
	})
	slot_0_85_13.abf_trigger = slot_0_86_14:combo(slot_0_60_1("trigger"), {
		"miss",
		"hit",
		"both"
	}, "miss"):depend({
		slot_0_85_13.anti_bruteforce,
		true
	})
	slot_0_85_13.abf_notify = slot_0_86_14:switch(slot_0_60_1("notify"), true):depend({
		slot_0_85_13.anti_bruteforce,
		true
	})
	slot_0_85_13.abf_phases = {}
	slot_0_85_13.abf_phase_n = 1
	slot_0_85_13.abf_phase_sel = slot_0_86_14:combo(slot_0_60_1("phase"), {
		"1"
	}, "1"):depend({
		slot_0_85_13.anti_bruteforce,
		true
	})

	function slot_0_87_14()
		local var_58_0 = {}

		for iter_58_0 = 1, slot_0_85_13.abf_phase_n do
			var_58_0[iter_58_0] = tostring(iter_58_0)
		end

		if #var_58_0 > 0 then
			slot_0_85_13.abf_phase_sel:update(var_58_0)
		end
	end

	slot_0_86_14:button(slot_0_60_1("add phase"), function()
		if slot_0_85_13.abf_phase_n < 10 then
			slot_0_85_13.abf_phase_n = slot_0_85_13.abf_phase_n + 1

			slot_0_87_14()
		end
	end):depend({
		slot_0_85_13.anti_bruteforce,
		true
	})
	slot_0_86_14:button(slot_0_60_1("remove phase"), function()
		if slot_0_85_13.abf_phase_n > 1 then
			slot_0_85_13.abf_phase_n = slot_0_85_13.abf_phase_n - 1

			slot_0_87_14()
		end
	end, true):depend({
		slot_0_85_13.anti_bruteforce,
		true
	})

	for iter_0_8 = 1, 10 do
		slot_0_92_11 = iter_0_8
		slot_0_93_11 = {}

		function slot_0_94_11()
			return slot_0_85_13.abf_phase_n >= slot_0_92_11 and slot_0_85_13.abf_phase_sel:get() == tostring(slot_0_92_11)
		end

		if slot_0_92_11 == 1 then
			slot_0_93_11.rand_min = slot_0_86_14:slider(slot_0_60_1("randomization 1"), -40, 40, 0):depend({
				slot_0_85_13.anti_bruteforce,
				true
			}, {
				slot_0_85_13.abf_phase_sel,
				"1"
			})
			slot_0_93_11.rand_max = slot_0_86_14:slider(slot_0_60_1("randomization 2"), -40, 40, 0):depend({
				slot_0_85_13.anti_bruteforce,
				true
			}, {
				slot_0_85_13.abf_phase_sel,
				"1"
			})
		else
			slot_0_93_11.rand_min = slot_0_86_14:slider(slot_0_60_1("randomization 1"), -40, 40, 0):depend({
				slot_0_85_13.anti_bruteforce,
				true
			}, {
				slot_0_85_13.abf_phase_sel,
				function()
					return slot_0_94_11()
				end
			})
			slot_0_93_11.rand_max = slot_0_86_14:slider(slot_0_60_1("randomization 2"), -40, 40, 0):depend({
				slot_0_85_13.anti_bruteforce,
				true
			}, {
				slot_0_85_13.abf_phase_sel,
				function()
					return slot_0_94_11()
				end
			})
		end

		slot_0_85_13.abf_phases[slot_0_92_11] = slot_0_93_11
	end

	slot_0_79_11[iter_0_4] = slot_0_85_13
end

slot_0_75_6.builder = slot_0_79_11
slot_0_80_8 = {
	switch = slot_0_73_4.general.freestanding.switch
}
slot_0_81_8 = slot_0_80_8.switch:create()
slot_0_80_8.prefer_manual = slot_0_81_8:switch(slot_0_60_1("prefer manual"))
slot_0_80_8.body_fs = slot_0_81_8:switch(slot_0_60_1("body freestanding"))
slot_0_80_8.yaw_mod = slot_0_81_8:switch(slot_0_60_1("disable yaw modifiers"))
slot_0_80_8.force_static = slot_0_81_8:switch(slot_0_60_1("force static"))
slot_0_80_8.disablers = slot_0_81_8:selectable(slot_0_60_1("disablers"), {
	"air",
	"crouch",
	"slowwalk",
	"move"
})
slot_0_75_6.freestanding = slot_0_80_8
slot_0_73_4.angles = slot_0_75_6
slot_0_76_7 = {
	settings = {}
}
slot_0_77_6 = {}

for iter_0_9, iter_0_10 in ipairs(slot_0_12_0.states) do
	if iter_0_10 ~= "legit aa" and iter_0_10 ~= "fakelag" then
		slot_0_77_6[#slot_0_77_6 + 1] = iter_0_10
	end
end

slot_0_77_6[#slot_0_77_6 + 1] = "manual aa"
slot_0_77_6[#slot_0_77_6 + 1] = "safe head"
slot_0_77_6[#slot_0_77_6 + 1] = "freestanding"
slot_0_78_8 = slot_0_63_3:list("\v\f<shield>\r  defensive state", slot_0_77_6):depend({
	slot_0_68_5,
	slot_0_67_5
})
slot_0_76_7.state_selector = slot_0_78_8
slot_0_76_7.active_on = slot_0_63_3:selectable(slot_0_60_1("active on"), {
	"doubletap",
	"hideshots"
}):depend({
	slot_0_68_5,
	slot_0_67_5
})
slot_0_79_10 = slot_0_72_6:label("\v\f<sliders>\r  state settings"):depend({
	slot_0_68_5,
	slot_0_67_5
})

function slot_0_80_7(arg_64_0, arg_64_1)
	slot_64_2_0 = {}
	slot_0_76_7.settings[arg_64_0] = slot_64_2_0
	slot_64_2_0.state_label = slot_0_72_6:label(("\aA0A0A0FFcurrently editing: \aFFFFFFFF%s"):format(arg_64_0)):depend({
		slot_0_68_5,
		slot_0_67_5
	}, {
		slot_0_78_8,
		arg_64_1
	})
	slot_64_2_0.fe = slot_0_72_6:switch(slot_0_60_1("flick exploit"), false):depend({
		slot_0_68_5,
		slot_0_67_5
	}, {
		slot_0_78_8,
		arg_64_1
	})
	slot_64_3_3 = slot_64_2_0.fe:create()
	slot_64_2_0.fe_alt = slot_64_3_3:switch(slot_0_60_1("safe mode"), false):depend({
		slot_64_2_0.fe,
		true
	})
	slot_64_2_0.fe_peek = slot_64_3_3:switch(slot_0_60_1("auto fake"), false):depend({
		slot_64_2_0.fe,
		true
	})
	slot_64_2_0.fe_snap_delay = slot_64_3_3:slider(slot_0_60_1("snap delay"), 0, 14, 3, 1, "t"):depend({
		slot_64_2_0.fe,
		true
	})
	slot_64_2_0.enable = slot_0_72_6:switch(slot_0_60_1("enable"), false):depend({
		slot_0_68_5,
		slot_0_67_5
	}, {
		slot_0_78_8,
		arg_64_1
	})
	slot_64_2_0.pitch_mode = slot_0_72_6:combo(slot_0_60_1("pitch"), {
		"off",
		"down",
		"up",
		"random",
		"custom",
		"elysian",
		"semi-up",
		"semi-down",
		"dynamic",
		"oscillate"
	}):depend({
		slot_0_68_5,
		slot_0_67_5
	}, {
		slot_0_78_8,
		arg_64_1
	}, {
		slot_64_2_0.enable,
		true
	})
	slot_64_3_2 = slot_64_2_0.pitch_mode:create()
	slot_64_2_0.pitch = slot_64_3_2:slider(slot_0_60_1("value"), -89, 89, 89):depend({
		slot_64_2_0.pitch_mode,
		"custom"
	})
	slot_64_2_0.dyn_pitch_min = slot_64_3_2:slider(slot_0_60_1("min"), -89, 89, -89):depend({
		slot_64_2_0.pitch_mode,
		"dynamic"
	})
	slot_64_2_0.dyn_pitch_max = slot_64_3_2:slider(slot_0_60_1("max"), -89, 89, 89):depend({
		slot_64_2_0.pitch_mode,
		"dynamic"
	})
	slot_64_2_0.dyn_pitch_spd = slot_64_3_2:slider(slot_0_60_1("rate"), 1, 200, 60, 1, "t"):depend({
		slot_64_2_0.pitch_mode,
		"dynamic"
	})
	slot_64_2_0.dyn_pitch_mode = slot_64_3_2:combo(slot_0_60_1("wave"), {
		"sine",
		"triangle",
		"step",
		"bounce"
	}, "sine"):depend({
		slot_64_2_0.pitch_mode,
		"dynamic"
	})
	slot_64_2_0.dyn_pitch_rand = slot_64_3_2:slider(slot_0_60_1("noise"), 0, 30, 0, 1, "°"):depend({
		slot_64_2_0.pitch_mode,
		"dynamic"
	})
	slot_64_2_0.osc_pitch_a = slot_64_3_2:slider(slot_0_60_1("pos a"), -89, 89, -89):depend({
		slot_64_2_0.pitch_mode,
		"oscillate"
	})
	slot_64_2_0.osc_pitch_b = slot_64_3_2:slider(slot_0_60_1("pos b"), -89, 89, 89):depend({
		slot_64_2_0.pitch_mode,
		"oscillate"
	})
	slot_64_2_0.osc_pitch_rate = slot_64_3_2:slider(slot_0_60_1("switch rate"), 1, 22, 6, 1, "t"):depend({
		slot_64_2_0.pitch_mode,
		"oscillate"
	})
	slot_64_2_0.osc_pitch_rand = slot_64_3_2:slider(slot_0_60_1("noise"), 0, 20, 0, 1, "t"):depend({
		slot_64_2_0.pitch_mode,
		"oscillate"
	})
	slot_64_2_0.yaw_mode = slot_0_72_6:combo(slot_0_60_1("yaw"), {
		"off",
		"static",
		"flip",
		"sideways",
		"random",
		"opposite",
		"spin",
		"dynamic",
		"jitter",
		"sweep"
	}):depend({
		slot_0_68_5,
		slot_0_67_5
	}, {
		slot_0_78_8,
		arg_64_1
	}, {
		slot_64_2_0.enable,
		true
	})
	slot_64_3_1 = slot_64_2_0.yaw_mode:create()
	slot_64_2_0.yaw = slot_64_3_1:slider(slot_0_60_1("offset"), -180, 180, 0):depend({
		slot_64_2_0.yaw_mode,
		"static"
	})
	slot_64_2_0.yaw_lr_left = slot_64_3_1:slider(slot_0_60_1("left"), -60, 60, 0):depend({
		slot_64_2_0.yaw_mode,
		"flip"
	})
	slot_64_2_0.yaw_lr_right = slot_64_3_1:slider(slot_0_60_1("right"), -60, 60, 0):depend({
		slot_64_2_0.yaw_mode,
		"flip"
	})
	slot_64_2_0.yaw_lr_dt = slot_64_3_1:slider(slot_0_60_1("interval"), 1, 22, 6, 1, "t"):depend({
		slot_64_2_0.yaw_mode,
		"flip"
	})
	slot_64_2_0.yaw_lr_rand = slot_64_3_1:slider(slot_0_60_1("noise"), 0, 60, 0, 1, "°"):depend({
		slot_64_2_0.yaw_mode,
		"flip"
	})
	slot_64_2_0.def_flip_adaptive = slot_64_3_1:switch(slot_0_60_1("adaptive rate"), false):depend({
		slot_64_2_0.yaw_mode,
		"flip"
	})
	slot_64_2_0.def_flip_adp_var = slot_64_3_1:slider(slot_0_60_1("drift"), 1, 8, 3, 1, "t"):depend({
		slot_64_2_0.yaw_mode,
		"flip"
	}, {
		slot_64_2_0.def_flip_adaptive,
		true
	})
	slot_64_2_0.yaw_spin_from = slot_64_3_1:slider(slot_0_60_1("from"), -180, 180, -180):depend({
		slot_64_2_0.yaw_mode,
		"spin"
	})
	slot_64_2_0.yaw_spin_to = slot_64_3_1:slider(slot_0_60_1("to"), -180, 180, 180):depend({
		slot_64_2_0.yaw_mode,
		"spin"
	})
	slot_64_2_0.yaw_spin_spd = slot_64_3_1:slider(slot_0_60_1("speed"), 1, 30, 1, 1, "t"):depend({
		slot_64_2_0.yaw_mode,
		"spin"
	})
	slot_64_2_0.yaw_spin_rand = slot_64_3_1:slider(slot_0_60_1("noise"), 0, 180, 33, 1, "°"):depend({
		slot_64_2_0.yaw_mode,
		"spin"
	})
	slot_64_2_0.dyn_yaw_min = slot_64_3_1:slider(slot_0_60_1("min"), -180, 180, -180):depend({
		slot_64_2_0.yaw_mode,
		"dynamic"
	})
	slot_64_2_0.dyn_yaw_max = slot_64_3_1:slider(slot_0_60_1("max"), -180, 180, 180):depend({
		slot_64_2_0.yaw_mode,
		"dynamic"
	})
	slot_64_2_0.dyn_yaw_spd = slot_64_3_1:slider(slot_0_60_1("rate"), 1, 200, 60, 1, "t"):depend({
		slot_64_2_0.yaw_mode,
		"dynamic"
	})
	slot_64_2_0.dyn_yaw_mode = slot_64_3_1:combo(slot_0_60_1("wave"), {
		"sine",
		"triangle",
		"step",
		"bounce"
	}, "sine"):depend({
		slot_64_2_0.yaw_mode,
		"dynamic"
	})
	slot_64_2_0.dyn_yaw_rand = slot_64_3_1:slider(slot_0_60_1("noise"), 0, 45, 0, 1, "°"):depend({
		slot_64_2_0.yaw_mode,
		"dynamic"
	})
	slot_64_2_0.def_jitter_base = slot_64_3_1:slider(slot_0_60_1("center"), -180, 180, 0):depend({
		slot_64_2_0.yaw_mode,
		"jitter"
	})
	slot_64_2_0.def_jitter_range = slot_64_3_1:slider(slot_0_60_1("range"), 0, 90, 40, 1, "°"):depend({
		slot_64_2_0.yaw_mode,
		"jitter"
	})
	slot_64_2_0.def_jitter_speed = slot_64_3_1:slider(slot_0_60_1("speed"), 1, 14, 3, 1, "t"):depend({
		slot_64_2_0.yaw_mode,
		"jitter"
	})
	slot_64_2_0.def_jitter_style = slot_64_3_1:combo(slot_0_60_1("waveform"), {
		"sine",
		"triangle",
		"bounce",
		"step",
		"noise"
	}):depend({
		slot_64_2_0.yaw_mode,
		"jitter"
	})
	slot_64_2_0.def_jitter_phase = slot_64_3_1:slider(slot_0_60_1("phase"), 0, 359, 0, 1, "°"):depend({
		slot_64_2_0.yaw_mode,
		"jitter"
	})
	slot_64_2_0.sweep_from = slot_64_3_1:slider(slot_0_60_1("from"), -180, 180, -90):depend({
		slot_64_2_0.yaw_mode,
		"sweep"
	})
	slot_64_2_0.sweep_to = slot_64_3_1:slider(slot_0_60_1("to"), -180, 180, 90):depend({
		slot_64_2_0.yaw_mode,
		"sweep"
	})
	slot_64_2_0.sweep_rate = slot_64_3_1:slider(slot_0_60_1("rate"), 1, 22, 6, 1, "t"):depend({
		slot_64_2_0.yaw_mode,
		"sweep"
	})
	slot_64_2_0.sweep_hold = slot_64_3_1:slider(slot_0_60_1("hold"), 0, 10, 2, 1, "t"):depend({
		slot_64_2_0.yaw_mode,
		"sweep"
	})
	slot_64_2_0.sweep_rand = slot_64_3_1:slider(slot_0_60_1("noise"), 0, 40, 0, 1, "°"):depend({
		slot_64_2_0.yaw_mode,
		"sweep"
	})
	slot_64_2_0.activation_mode = slot_0_72_6:combo(slot_0_60_1("activation"), {
		"always",
		"hittable only"
	}):depend({
		slot_0_68_5,
		slot_0_67_5
	}, {
		slot_0_78_8,
		arg_64_1
	}, {
		slot_64_2_0.enable,
		true
	})
	slot_64_2_0.def_abf = slot_0_72_6:switch(slot_0_60_1("anti bruteforce"), false):depend({
		slot_0_68_5,
		slot_0_67_5
	}, {
		slot_0_78_8,
		arg_64_1
	}, {
		slot_64_2_0.enable,
		true
	})
	slot_64_3_0 = slot_64_2_0.def_abf:create()
	slot_64_2_0.def_abf_mode = slot_64_3_0:combo(slot_0_60_1("mode"), {
		"flip yaw",
		"flip pitch",
		"random yaw"
	}):depend({
		slot_64_2_0.def_abf,
		true
	})
	slot_64_2_0.def_abf_trigger = slot_64_3_0:combo(slot_0_60_1("trigger"), {
		"miss",
		"hit",
		"both"
	}, "miss"):depend({
		slot_64_2_0.def_abf,
		true
	})
	slot_64_2_0.def_abf_reset = slot_64_3_0:slider(slot_0_60_1("reset"), 1, 10, 3, 1, "s"):depend({
		slot_64_2_0.def_abf,
		true
	})
	slot_64_2_0.def_abf_notify = slot_64_3_0:switch(slot_0_60_1("notify"), true):depend({
		slot_64_2_0.def_abf,
		true
	})
end

for iter_0_11, iter_0_12 in ipairs(slot_0_77_6) do
	slot_0_80_7(iter_0_12, iter_0_11)
end

slot_0_73_4.defensive = slot_0_76_7
slot_0_59_0.antiaim = slot_0_73_4

slot_0_1_0.create(slot_0_61_2.antiaim, "  ", 2):label("\v✦\r  \aFFFFFFFFelysian \a444444FF— 2026")

slot_0_74_4 = slot_0_1_0.create(slot_0_61_2.visuals, "     ", 1)
slot_0_75_5 = {
	"\f<sliders>\r  general",
	"\f<palette>\r  ui"
}
slot_0_76_6 = 1
slot_0_77_5 = 2
slot_0_78_7 = slot_0_74_4:list("", slot_0_75_5)
slot_0_79_9 = slot_0_1_0.create(slot_0_61_2.visuals, "       ", 1)
slot_0_80_6 = slot_0_1_0.create(slot_0_61_2.visuals, "         ", 2)
slot_0_81_6 = {}
slot_0_82_6 = {
	switch = slot_0_79_9:switch("\v\f<arrow-right-arrow-left>\r  manual arrows"):depend({
		slot_0_78_7,
		slot_0_76_6
	})
}
slot_0_83_9 = slot_0_82_6.switch:create()
slot_0_82_6.color = slot_0_83_9:color_picker(slot_0_60_1("color"), color(255, 255, 255, 255)):depend({
	slot_0_82_6.switch,
	true
})
slot_0_82_6.dynamic = slot_0_83_9:switch(slot_0_60_1("dynamic mode"), false):depend({
	slot_0_82_6.switch,
	true
})
slot_0_82_6.style = slot_0_83_9:combo(slot_0_60_1("style"), {
	"modern",
	"old"
}, "modern"):depend({
	slot_0_82_6.switch,
	true
})
slot_0_82_6.color_enemy = slot_0_83_9:color_picker(slot_0_60_1("enemy side color"), color(255, 60, 60, 255)):depend({
	slot_0_82_6.switch,
	true
}, {
	slot_0_82_6.dynamic,
	true
})
slot_0_82_6.color_opposite = slot_0_83_9:color_picker(slot_0_60_1("opposite side color"), color(60, 60, 60, 200)):depend({
	slot_0_82_6.switch,
	true
}, {
	slot_0_82_6.dynamic,
	true
})
slot_0_81_6.manual_arrows = slot_0_82_6
slot_0_83_8 = {
	switch = slot_0_79_9:switch("\v\f<expand>\r  aspect ratio"):depend({
		slot_0_78_7,
		slot_0_76_6
	})
}
slot_0_84_10 = slot_0_83_8.switch:create()
slot_0_83_8.value = slot_0_84_10:slider(slot_0_60_1("ratio"), 1, 200, 133, 0.01):depend({
	slot_0_83_8.switch,
	true
})
slot_0_85_11 = cvar.r_aspectratio

function slot_0_86_13()
	slot_0_85_11:float(slot_0_56_0:get_original(slot_0_85_11))
end

function slot_0_87_13()
	if not slot_0_83_8.switch:get() then
		slot_0_86_13()

		return
	end

	slot_0_85_11:float(slot_0_83_8.value:get() * 0.01, true)
end

slot_0_83_8.switch:set_callback(slot_0_87_13, true)
slot_0_83_8.value:set_callback(slot_0_87_13)
events.shutdown(slot_0_86_13)

slot_0_81_6.aspect_ratio = slot_0_83_8
slot_0_84_9 = {
	switch = slot_0_80_6:switch("\v\f<chart-bar>\r  lc indicator"):depend({
		slot_0_78_7,
		slot_0_77_5
	})
}
slot_0_85_10 = slot_0_84_9.switch:create()
slot_0_84_9.col_failed = slot_0_85_10:color_picker("failed color", color(255, 64, 64, 255)):depend({
	slot_0_84_9.switch,
	true
})
slot_0_84_9.col_bad = slot_0_85_10:color_picker("bad color", color(255, 175, 104, 255)):depend({
	slot_0_84_9.switch,
	true
})
slot_0_84_9.col_ok = slot_0_85_10:color_picker("ok color", color(185, 185, 190, 255)):depend({
	slot_0_84_9.switch,
	true
})
slot_0_84_9.col_good = slot_0_85_10:color_picker("good color", color(205, 236, 142, 255)):depend({
	slot_0_84_9.switch,
	true
})
slot_0_84_9.col_ideal = slot_0_85_10:color_picker("ideal color", color(101, 213, 255, 255)):depend({
	slot_0_84_9.switch,
	true
})
slot_0_84_9.col_god = slot_0_85_10:color_picker("amazing color", color(207, 145, 255, 255)):depend({
	slot_0_84_9.switch,
	true
})
slot_0_84_9.col_wt = slot_0_85_10:color_picker("$$$ color", color(255, 215, 0, 255)):depend({
	slot_0_84_9.switch,
	true
})
slot_0_84_9.glow = slot_0_85_10:switch("glow", true):depend({
	slot_0_84_9.switch,
	true
})
slot_0_84_9.text_case = slot_0_85_10:combo("text case", {
	"uppercase",
	"lowercase"
}, "uppercase"):depend({
	slot_0_84_9.switch,
	true
})
slot_0_84_9.show_label = slot_0_85_10:switch("show label", true):depend({
	slot_0_84_9.switch,
	true
})
slot_0_84_9.show_ticks = slot_0_85_10:switch("show ticks", true):depend({
	slot_0_84_9.switch,
	true
})
slot_0_84_9.show_bar = slot_0_85_10:switch("show bar", true):depend({
	slot_0_84_9.switch,
	true
})
slot_0_81_6.lc_indicator = slot_0_84_9
slot_0_85_9 = {
	switch = slot_0_80_6:switch("\v\f<gauge-high>\r  velocity indicator"):depend({
		slot_0_78_7,
		slot_0_77_5
	})
}
slot_0_86_12 = slot_0_85_9.switch:create()
slot_0_85_9.col_bar = slot_0_86_12:color_picker("bar high", color(150, 195, 255, 255)):depend({
	slot_0_85_9.switch,
	true
})
slot_0_85_9.col_bar2 = slot_0_86_12:color_picker("bar normal", color(255, 255, 255, 255)):depend({
	slot_0_85_9.switch,
	true
})
slot_0_85_9.glow = slot_0_86_12:switch("glow", true):depend({
	slot_0_85_9.switch,
	true
})
slot_0_85_9.col_text = slot_0_86_12:color_picker("text color", color(185, 185, 190, 255)):depend({
	slot_0_85_9.switch,
	true
})
slot_0_85_9.show_label = slot_0_86_12:switch("show label", true):depend({
	slot_0_85_9.switch,
	true
})
slot_0_85_9.show_percent = slot_0_86_12:switch("show percent", true):depend({
	slot_0_85_9.switch,
	true
})
slot_0_81_6.velocity_indicator = slot_0_85_9
slot_0_86_11 = {
	switch = slot_0_80_6:switch("\v\f<shield-halved>\r  bruteforce indicator"):depend({
		slot_0_78_7,
		slot_0_77_5
	})
}
slot_0_87_12 = slot_0_86_11.switch:create()
slot_0_86_11.col_bar = slot_0_87_12:color_picker("bar color normal", color(150, 195, 255, 255)):depend({
	slot_0_86_11.switch,
	true
})
slot_0_86_11.col_bar2 = slot_0_87_12:color_picker("bar color missed", color(255, 64, 64, 255)):depend({
	slot_0_86_11.switch,
	true
})
slot_0_86_11.glow = slot_0_87_12:switch("glow", true):depend({
	slot_0_86_11.switch,
	true
})
slot_0_86_11.col_idle = slot_0_87_12:color_picker("bar idle", color(80, 80, 90, 255)):depend({
	slot_0_86_11.switch,
	true
})
slot_0_86_11.show_label = slot_0_87_12:switch("show label", true):depend({
	slot_0_86_11.switch,
	true
})
slot_0_86_11.show_timer = slot_0_87_12:switch("show timer", true):depend({
	slot_0_86_11.switch,
	true
})
slot_0_81_6.abf_indicator = slot_0_86_11
slot_0_87_11 = {
	switch = slot_0_80_6:switch("\v\f<shield>\r  defensive indicator"):depend({
		slot_0_78_7,
		slot_0_77_5
	})
}
slot_0_87_11.color = slot_0_87_11.switch:create():color_picker(slot_0_60_1("color"), color(150, 195, 255, 255)):depend({
	slot_0_87_11.switch,
	true
})
slot_0_81_6.def_indicator = slot_0_87_11
slot_0_88_12 = {
	label = slot_0_79_9:label("\v\f<marker>\r  watermark"):depend({
		slot_0_78_7,
		slot_0_77_5
	})
}
slot_0_89_11 = slot_0_88_12.label:create()
slot_0_88_12.style = slot_0_89_11:combo(slot_0_60_1("style"), {
	"classic",
	"modern",
	"logo"
}, "classic")
slot_0_88_12.col1 = slot_0_89_11:color_picker("color 1", color(160, 160, 185, 255)):depend({
	slot_0_88_12.style,
	"classic"
})
slot_0_88_12.col2 = slot_0_89_11:color_picker("color 2", color(255, 255, 255, 255)):depend({
	slot_0_88_12.style,
	"classic"
})
slot_0_88_12.col3 = slot_0_89_11:color_picker("color 3", color(150, 195, 255, 255)):depend({
	slot_0_88_12.style,
	"classic"
})
slot_0_88_12.col_wave = slot_0_89_11:color_picker("wave color", color(255, 255, 255, 255)):depend({
	slot_0_88_12.style,
	"classic"
})
slot_0_88_12.position = slot_0_89_11:combo("position", {
	"bottom center",
	"left center"
}, "bottom center"):depend({
	slot_0_88_12.style,
	"classic"
})
slot_0_88_12.font = slot_0_89_11:combo("font", {
	"classic",
	"pixel"
}, "classic"):depend({
	slot_0_88_12.style,
	"classic"
})
slot_0_88_12.name_case = slot_0_89_11:combo("name case", {
	"uppercase",
	"lowercase"
}, "uppercase"):depend({
	slot_0_88_12.style,
	"classic"
}, {
	slot_0_88_12.font,
	"classic"
})
slot_0_88_12.m_col_bg = slot_0_89_11:color_picker("background", color(15, 15, 18, 210)):depend({
	slot_0_88_12.style,
	"modern"
})
slot_0_88_12.m_col_border = slot_0_89_11:color_picker("border", color(255, 255, 255, 40)):depend({
	slot_0_88_12.style,
	"modern"
})
slot_0_88_12.m_col_text = slot_0_89_11:color_picker("text color", color(133, 133, 133, 191)):depend({
	slot_0_88_12.style,
	"modern"
})
slot_0_88_12.m_col_accent = slot_0_89_11:color_picker("accent", color(133, 133, 133, 191)):depend({
	slot_0_88_12.style,
	"modern"
})
slot_0_88_12.m_col_shimmer = slot_0_89_11:color_picker("shimmer color", color(210, 210, 225, 255)):depend({
	slot_0_88_12.style,
	"modern"
})
slot_0_88_12.m_logo_mode = slot_0_89_11:combo("logo mode", {
	"logo",
	"text"
}, "logo"):depend({
	slot_0_88_12.style,
	"modern"
})
slot_0_88_12.m_text_case = slot_0_89_11:combo(slot_0_60_1("text case"), {
	"lowercase",
	"uppercase"
}, "lowercase"):depend({
	slot_0_88_12.style,
	"modern"
}, {
	slot_0_88_12.m_logo_mode,
	"text"
})
slot_0_88_12.m_font = slot_0_89_11:combo(slot_0_60_1("font"), {
	"inter",
	"verdana"
}, "inter"):depend({
	slot_0_88_12.style,
	"modern"
})
slot_0_88_12.m_show_nick = slot_0_89_11:switch(slot_0_60_1("show nickname"), true):depend({
	slot_0_88_12.style,
	"modern"
})
slot_0_88_12.m_show_fps = slot_0_89_11:switch(slot_0_60_1("show fps"), true):depend({
	slot_0_88_12.style,
	"modern"
})
slot_0_88_12.m_show_ping = slot_0_89_11:switch(slot_0_60_1("show ping"), false):depend({
	slot_0_88_12.style,
	"modern"
})
slot_0_88_12.m_shimmer_en = slot_0_89_11:switch(slot_0_60_1("shimmer"), true):depend({
	slot_0_88_12.style,
	"modern"
})
slot_0_88_12.w_col = slot_0_89_11:color_picker("logo color", color(255, 255, 255, 255)):depend({
	slot_0_88_12.style,
	"logo"
})
slot_0_81_6.watermark = slot_0_88_12
slot_0_89_10 = {
	label = slot_0_79_9:label("\v\f<crosshairs>\r  crosshair indicators"):depend({
		slot_0_78_7,
		slot_0_77_5
	})
}
slot_0_90_10 = slot_0_89_10.label:create()
slot_0_89_10.enabled = slot_0_90_10:switch(slot_0_60_1("enabled"))
slot_0_89_10.style = slot_0_90_10:combo("style", {
	"modern",
	"old"
}, "modern"):depend({
	slot_0_89_10.enabled,
	true
})
slot_0_89_10.font = slot_0_90_10:combo("font", {
	"normal",
	"pixel",
	"bold"
}, "bold"):depend({
	slot_0_89_10.enabled,
	true
}, {
	slot_0_89_10.style,
	"modern"
})
slot_0_89_10.glow = slot_0_90_10:switch("glow", false):depend({
	slot_0_89_10.enabled,
	true
}, {
	slot_0_89_10.style,
	"modern"
})
slot_0_89_10.glow_color = slot_0_90_10:color_picker("glow color", color(255, 255, 255, 255)):depend({
	slot_0_89_10.enabled,
	true
}, {
	slot_0_89_10.glow,
	true
}, {
	slot_0_89_10.style,
	"modern"
})
slot_0_89_10.m_col_accent = slot_0_90_10:color_picker("accent", color(200, 200, 210, 255)):depend({
	slot_0_89_10.enabled,
	true
}, {
	slot_0_89_10.style,
	"modern"
})
slot_0_89_10.col_wave = slot_0_90_10:color_picker("wave color", color(255, 255, 255, 255)):depend({
	slot_0_89_10.enabled,
	true
}, {
	slot_0_89_10.style,
	"modern"
})
slot_0_89_10.m_show_state = slot_0_90_10:switch("show state", true):depend({
	slot_0_89_10.enabled,
	true
}, {
	slot_0_89_10.style,
	"modern"
})
slot_0_89_10.m_show_dt = slot_0_90_10:switch("show dt", true):depend({
	slot_0_89_10.enabled,
	true
}, {
	slot_0_89_10.style,
	"modern"
})
slot_0_89_10.m_show_hs = slot_0_90_10:switch("show hideshots", true):depend({
	slot_0_89_10.enabled,
	true
}, {
	slot_0_89_10.style,
	"modern"
})
slot_0_89_10.m_show_fs = slot_0_90_10:switch("show freestanding", true):depend({
	slot_0_89_10.enabled,
	true
}, {
	slot_0_89_10.style,
	"modern"
})
slot_0_89_10.new_show_state = slot_0_90_10:switch("show state", true):depend({
	slot_0_89_10.enabled,
	true
}, {
	slot_0_89_10.style,
	"old"
})
slot_0_89_10.new_title_col = slot_0_90_10:color_picker("title color", color(185, 190, 255, 255)):depend({
	slot_0_89_10.enabled,
	true
}, {
	slot_0_89_10.style,
	"old"
})
slot_0_89_10.new_grad_col = slot_0_90_10:color_picker("gradient color", color(130, 170, 255, 255)):depend({
	slot_0_89_10.enabled,
	true
}, {
	slot_0_89_10.style,
	"old"
})
slot_0_89_10.new_shot_col = slot_0_90_10:color_picker("shot color", color(255, 255, 255, 255)):depend({
	slot_0_89_10.enabled,
	true
}, {
	slot_0_89_10.style,
	"old"
})
slot_0_89_10.new_state_col = slot_0_90_10:color_picker("state color", color(200, 200, 200, 255)):depend({
	slot_0_89_10.enabled,
	true
}, {
	slot_0_89_10.style,
	"old"
})
slot_0_89_10.new_flags_col = slot_0_90_10:color_picker("flags color", color(255, 255, 255, 255)):depend({
	slot_0_89_10.enabled,
	true
}, {
	slot_0_89_10.style,
	"old"
})
slot_0_81_6.crosshair = slot_0_89_10
slot_0_90_9 = {
	label = slot_0_79_9:label("\v\f<bell>\r  notifications"):depend({
		slot_0_78_7,
		slot_0_77_5
	})
}
slot_0_91_10 = slot_0_90_9.label:create()
slot_0_90_9.log_mode = slot_0_91_10:combo(slot_0_60_1("mode"), {
	"widget",
	"text"
}, "widget")
slot_0_90_9.prefix_mode = slot_0_91_10:combo("prefix", {
	"text",
	"icon"
}, "text"):depend({
	slot_0_90_9.log_mode,
	"widget"
})
slot_0_90_9.blur = slot_0_91_10:switch("background blur", true):depend({
	slot_0_90_9.log_mode,
	"widget"
})
slot_0_90_9.glow = slot_0_91_10:switch("background glow", false):depend({
	slot_0_90_9.log_mode,
	"widget"
})
slot_0_90_9.font = slot_0_91_10:combo("font", {
	"inter",
	"verdana"
}, "inter"):depend({
	slot_0_90_9.log_mode,
	"widget"
})
slot_0_90_9.anim_style = slot_0_91_10:combo("style", {
	"classic",
	"new"
}, "classic"):depend({
	slot_0_90_9.log_mode,
	"widget"
})
slot_0_90_9.col_glass = slot_0_91_10:color_picker("glass tint", color(255, 255, 255, 18)):depend({
	slot_0_90_9.log_mode,
	"widget"
})
slot_0_90_9.col_border = slot_0_91_10:color_picker("border", color(255, 255, 255, 45)):depend({
	slot_0_90_9.log_mode,
	"widget"
})
slot_0_90_9.col_accent = slot_0_91_10:color_picker("accent", color(150, 195, 255, 255)):depend({
	slot_0_90_9.log_mode,
	"widget"
})
slot_0_90_9.col_text = slot_0_91_10:color_picker("text", color(220, 220, 225, 255)):depend({
	slot_0_90_9.log_mode,
	"widget"
})
slot_0_90_9.log_enabled = slot_0_91_10:switch("enabled log", false)
slot_0_90_9.log_hits = slot_0_91_10:switch("show hits", true):depend({
	slot_0_90_9.log_enabled,
	true
})
slot_0_90_9.log_misses = slot_0_91_10:switch("show misses", true):depend({
	slot_0_90_9.log_enabled,
	true
})
slot_0_90_9.log_hurt = slot_0_91_10:switch("show hurt", true):depend({
	slot_0_90_9.log_enabled,
	true
})
slot_0_90_9.log_purchases = slot_0_91_10:switch("show purchases", true):depend({
	slot_0_90_9.log_enabled,
	true
}, {
	slot_0_90_9.log_mode,
	"text"
})
slot_0_90_9.col_purchases = slot_0_91_10:color_picker("purchase color", color(150, 195, 255, 255)):depend({
	slot_0_90_9.log_enabled,
	true
}, {
	slot_0_90_9.log_mode,
	"text"
}, {
	slot_0_90_9.log_purchases,
	true
})
slot_0_90_9.col_hit = slot_0_91_10:color_picker("hit color", color(125, 210, 125, 255)):depend({
	slot_0_90_9.log_enabled,
	true
}, {
	slot_0_90_9.log_hits,
	true
})
slot_0_90_9.col_miss = slot_0_91_10:color_picker("miss color", color(220, 80, 80, 255)):depend({
	slot_0_90_9.log_enabled,
	true
}, {
	slot_0_90_9.log_misses,
	true
})
slot_0_90_9.col_mismatch = slot_0_91_10:color_picker("mismatch color", color(255, 159, 94, 255)):depend({
	slot_0_90_9.log_enabled,
	true
}, {
	slot_0_90_9.log_mode,
	"text"
}, {
	slot_0_90_9.log_hits,
	true
})
slot_0_90_9.col_miss_mismatch = slot_0_91_10:color_picker("miss mismatch color", color(255, 159, 94, 255)):depend({
	slot_0_90_9.log_enabled,
	true
}, {
	slot_0_90_9.log_mode,
	"text"
}, {
	slot_0_90_9.log_misses,
	true
})
slot_0_90_9.log_dormant = slot_0_91_10:switch("show dormant", true):depend({
	slot_0_90_9.log_enabled,
	true
})
slot_0_90_9.col_dormant_hit = slot_0_91_10:color_picker("dormant hit color", color(106, 255, 84, 255)):depend({
	slot_0_90_9.log_enabled,
	true
}, {
	slot_0_90_9.log_dormant,
	true
})
slot_0_90_9.col_dormant_miss = slot_0_91_10:color_picker("dormant miss color", color(255, 115, 115, 255)):depend({
	slot_0_90_9.log_enabled,
	true
}, {
	slot_0_90_9.log_dormant,
	true
})
slot_0_90_9.col_hurt = slot_0_91_10:color_picker("hurt color", color(163, 166, 255, 255)):depend({
	slot_0_90_9.log_enabled,
	true
}, {
	slot_0_90_9.log_hurt,
	true
})
slot_0_90_9.log_console = slot_0_91_10:switch("print to console", true):depend({
	slot_0_90_9.log_enabled,
	true
})
slot_0_90_9.col_abf_hit = slot_0_91_10:color_picker("abf hit color", color(255, 160, 80, 255)):depend({
	slot_0_90_9.log_mode,
	"widget"
})
slot_0_90_9.col_abf_miss = slot_0_91_10:color_picker("abf miss color", color(150, 195, 255, 255)):depend({
	slot_0_90_9.log_mode,
	"widget"
})
slot_0_90_9.col_abf_hit_text = slot_0_91_10:color_picker("abf hit color text", color(255, 160, 80, 255)):depend({
	slot_0_90_9.log_mode,
	"text"
})
slot_0_90_9.col_abf_miss_text = slot_0_91_10:color_picker("abf miss color text", color(150, 195, 255, 255)):depend({
	slot_0_90_9.log_mode,
	"text"
})
slot_0_81_6.notify = slot_0_90_9
slot_0_91_9 = {
	label = slot_0_79_9:label("\v\f<wand-magic-sparkles>\r  visual tweaks"):depend({
		slot_0_78_7,
		slot_0_76_6
	})
}
slot_0_92_10 = slot_0_91_9.label:create()
slot_0_91_9.remove_shadow = slot_0_92_10:switch("remove shadow", false)
slot_0_91_9.remove_weapon = slot_0_92_10:switch("remove weapon on thirdperson", false)
slot_0_81_6.additions = slot_0_91_9
slot_0_92_9 = {
	label = slot_0_79_9:label("\v\f<magnifying-glass>\r  scope zoom"):depend({
		slot_0_78_7,
		slot_0_76_6
	})
}
slot_0_93_10 = slot_0_92_9.label:create()
slot_0_92_9.enabled = slot_0_93_10:switch("animate zoom")
slot_0_92_9.speed = slot_0_93_10:slider("animation speed", 1, 100, 50, 1, "%"):depend({
	slot_0_92_9.enabled,
	true
})
slot_0_81_6.scope_zoom = slot_0_92_9
slot_0_93_9 = {
	label = slot_0_80_6:label("\v\f<bullseye>\r  hitmarker"):depend({
		slot_0_78_7,
		slot_0_77_5
	})
}
slot_0_94_10 = slot_0_93_9.label:create()
slot_0_93_9.enabled = slot_0_94_10:switch("hitmarker")
slot_0_93_9.duration = slot_0_94_10:slider("duration", 0, 10, 1, 1, "s"):depend({
	slot_0_93_9.enabled,
	true
})
slot_0_93_9.size = slot_0_94_10:slider("size", 8, 32, 18, 1, "px"):depend({
	slot_0_93_9.enabled,
	true
})
slot_0_93_9.col_hit = slot_0_94_10:color_picker("color", color(255, 255, 255, 230)):depend({
	slot_0_93_9.enabled,
	true
})
slot_0_93_9.col_miss = slot_0_94_10:color_picker("color miss", color(220, 80, 80, 200)):depend({
	slot_0_93_9.enabled,
	true
})
slot_0_93_9.col_kill = slot_0_94_10:color_picker("color kill", color(255, 180, 0, 255)):depend({
	slot_0_93_9.enabled,
	true
})
slot_0_93_9.explode_effect = slot_0_94_10:switch("explode effect"):depend({
	slot_0_93_9.enabled,
	true
})
slot_0_93_9.dm_enabled = slot_0_94_10:switch("damage numbers")
slot_0_93_9.dm_col_hit = slot_0_94_10:color_picker("dmg color", color(255, 255, 255, 230)):depend({
	slot_0_93_9.dm_enabled,
	true
})
slot_0_93_9.dm_col_kill = slot_0_94_10:color_picker("dmg kill color", color(255, 180, 0, 255)):depend({
	slot_0_93_9.dm_enabled,
	true
})
slot_0_81_6.hitmarker = slot_0_93_9
slot_0_94_9 = {
	label = slot_0_80_6:label("\v\f<camera>\r  viewmodel"):depend({
		slot_0_78_7,
		slot_0_76_6
	})
}
slot_0_95_10 = slot_0_94_9.label:create()
slot_0_94_9.enabled = slot_0_95_10:switch(slot_0_60_1("enabled"))
slot_0_94_9.fov = slot_0_95_10:slider(slot_0_60_1("fov"), 40, 120, 68, 1, function(arg_67_0)
	return "FOV: " .. arg_67_0
end):depend({
	slot_0_94_9.enabled,
	true
})
slot_0_94_9.x = slot_0_95_10:slider(slot_0_60_1("x"), -100, 100, 0, 1, function(arg_68_0)
	return "x: " .. arg_68_0 * 0.1
end):depend({
	slot_0_94_9.enabled,
	true
})
slot_0_94_9.y = slot_0_95_10:slider(slot_0_60_1("y"), -100, 100, 0, 1, function(arg_69_0)
	return "y: " .. arg_69_0 * 0.1
end):depend({
	slot_0_94_9.enabled,
	true
})
slot_0_94_9.z = slot_0_95_10:slider(slot_0_60_1("z"), -100, 100, 0, 1, function(arg_70_0)
	return "z: " .. arg_70_0 * 0.1
end):depend({
	slot_0_94_9.enabled,
	true
})
slot_0_94_9.viewmodel_in_scope = slot_0_95_10:switch(slot_0_60_1("viewmodel in scope"), false):depend({
	slot_0_94_9.enabled,
	true
})
slot_0_94_9.scope_anim_speed = slot_0_95_10:slider(slot_0_60_1("animation speed"), 1, 200, 90, 1, function(arg_71_0)
	return "speed: " .. string.format("%.1f", arg_71_0 * 0.1)
end):depend({
	slot_0_94_9.viewmodel_in_scope,
	true
}):depend({
	slot_0_94_9.enabled,
	true
})
slot_0_94_9.scope_x = slot_0_95_10:slider(slot_0_60_1("scope x"), -100, 100, 0, 1, function(arg_72_0)
	return "x: " .. string.format("%.1f", arg_72_0 * 0.1)
end):depend({
	slot_0_94_9.viewmodel_in_scope,
	true
}):depend({
	slot_0_94_9.enabled,
	true
})
slot_0_94_9.scope_y = slot_0_95_10:slider(slot_0_60_1("scope y"), -100, 100, 0, 1, function(arg_73_0)
	return "y: " .. string.format("%.1f", arg_73_0 * 0.1)
end):depend({
	slot_0_94_9.viewmodel_in_scope,
	true
}):depend({
	slot_0_94_9.enabled,
	true
})
slot_0_94_9.scope_z = slot_0_95_10:slider(slot_0_60_1("scope z"), -100, 100, 0, 1, function(arg_74_0)
	return "z: " .. string.format("%.1f", arg_74_0 * 0.1)
end):depend({
	slot_0_94_9.viewmodel_in_scope,
	true
}):depend({
	slot_0_94_9.enabled,
	true
})
slot_0_94_9.reset = slot_0_95_10:button(slot_0_60_1("reset"), function()
	slot_0_94_9.fov:set(68)
	slot_0_94_9.x:set(0)
	slot_0_94_9.y:set(0)
	slot_0_94_9.z:set(0)
	slot_0_94_9.scope_anim_speed:set(90)
	slot_0_94_9.scope_x:set(0)
	slot_0_94_9.scope_y:set(0)
	slot_0_94_9.scope_z:set(0)
end, true):depend({
	slot_0_94_9.enabled,
	true
})
slot_0_81_6.viewmodel = slot_0_94_9
slot_0_95_9 = {
	label = slot_0_80_6:label("\v\f<crosshairs>\r  custom scope"):depend({
		slot_0_78_7,
		slot_0_76_6
	})
}
slot_0_96_11 = slot_0_95_9.label:create()
slot_0_95_9.enabled = slot_0_96_11:switch(slot_0_60_1("enabled"))
slot_0_95_9.disable_animation = slot_0_96_11:switch(slot_0_60_1("disable animation"), false):depend({
	slot_0_95_9.enabled,
	true
})
slot_0_95_9.anim_speed = slot_0_96_11:slider(slot_0_60_1("animation speed"), 1, 20, 5):depend({
	slot_0_95_9.enabled,
	true
}):depend({
	slot_0_95_9.disable_animation,
	false
})
slot_0_95_9.glow = slot_0_96_11:switch(slot_0_60_1("glow"), false):depend({
	slot_0_95_9.enabled,
	true
})
slot_0_95_9.glow_color = slot_0_96_11:color_picker(slot_0_60_1("glow color"), color(255, 255, 255, 180)):depend({
	slot_0_95_9.enabled,
	true
}):depend({
	slot_0_95_9.glow,
	true
})
slot_0_95_9.length = slot_0_96_11:slider(slot_0_60_1("length"), 10, 300, 185):depend({
	slot_0_95_9.enabled,
	true
})
slot_0_95_9.gap = slot_0_96_11:slider(slot_0_60_1("gap"), 1, 300, 5):depend({
	slot_0_95_9.enabled,
	true
})
slot_0_95_9.color_main = slot_0_96_11:color_picker(slot_0_60_1("main color"), color(255, 255, 255, 255)):depend({
	slot_0_95_9.enabled,
	true
})
slot_0_95_9.color_edge = slot_0_96_11:color_picker(slot_0_60_1("edge color"), color(0, 0, 0, 255)):depend({
	slot_0_95_9.enabled,
	true
})
slot_0_81_6.custom_scope = slot_0_95_9
slot_0_96_10 = {
	switch = slot_0_80_6:switch("\v\f<eye-slash>\r  custom silentaim"):depend({
		slot_0_78_7,
		slot_0_76_6
	})
}
slot_0_97_11 = slot_0_96_10.switch:create()
slot_0_96_10.fov = slot_0_97_11:slider("fov", 1, 180, 5, 1, "°"):depend({
	slot_0_96_10.switch,
	true
})
slot_0_81_6.silent_view = slot_0_96_10
slot_0_81_6.sidebar = {}
slot_0_59_0.visuals = slot_0_81_6
slot_0_59_0.info.notify = slot_0_90_9
slot_0_41_0 = slot_0_90_9
slot_0_59_0.info.crosshair = slot_0_89_10
slot_0_59_0.info.watermark = slot_0_88_12
slot_0_59_0.info.lc_ind = slot_0_84_9
slot_0_59_0.info.velocity = slot_0_85_9
slot_0_59_0.info.abf_ind = slot_0_86_11
slot_0_59_0.info.def_ind = slot_0_87_11
slot_0_59_0.info.additions = slot_0_91_9
slot_0_59_0.info.scope_zoom = slot_0_92_9
slot_0_59_0.info.hitmarker = slot_0_81_6.hitmarker
slot_0_59_0.info.viewmodel = slot_0_94_9
slot_0_59_0.info.custom_scope = slot_0_95_9
;({}).get = function()
	return true
end
slot_0_83_7 = slot_0_79_9:switch("\v\f<chart-line>\r  side indicators", false):depend({
	slot_0_78_7,
	slot_0_77_5
})
slot_0_84_8 = slot_0_83_7:create()
slot_0_85_8 = slot_0_84_8:color_picker("background color", color(0, 0, 0, 200))
slot_0_86_10 = slot_0_84_8:selectable("active side indicators", {
	"double tap",
	"hide shots",
	"freestanding",
	"fake duck",
	"min damage",
	"dormant aimbot",
	"lc",
	"ping"
})
slot_0_27_0.col_dt_on = slot_0_84_8:color_picker("dt  charged", color(175, 175, 180, 255)):depend({
	slot_0_86_10,
	"double tap"
})
slot_0_27_0.col_dt_off = slot_0_84_8:color_picker("dt  not charged", color(200, 80, 80, 255)):depend({
	slot_0_86_10,
	"double tap"
})
slot_0_27_0.col_hs_on = slot_0_84_8:color_picker("hs  color", color(175, 175, 180, 255)):depend({
	slot_0_86_10,
	"hide shots"
})
slot_0_27_0.col_fs_on = slot_0_84_8:color_picker("fs  color", color(175, 175, 180, 255)):depend({
	slot_0_86_10,
	"freestanding"
})
slot_0_27_0.col_fd_on = slot_0_84_8:color_picker("fd  color", color(175, 175, 180, 255)):depend({
	slot_0_86_10,
	"fake duck"
})
slot_0_27_0.col_da_on = slot_0_84_8:color_picker("da  color", color(175, 175, 180, 255)):depend({
	slot_0_86_10,
	"dormant aimbot"
})
slot_0_27_0.col_dmg_on = slot_0_84_8:color_picker("dmg color", color(175, 175, 180, 255)):depend({
	slot_0_86_10,
	"min damage"
})
slot_0_27_0.col_lc_on = slot_0_84_8:color_picker("lc  active", color(175, 175, 180, 255)):depend({
	slot_0_86_10,
	"lc"
})
slot_0_27_0.col_lc_bad = slot_0_84_8:color_picker("lc  bad/failed", color(200, 80, 80, 255)):depend({
	slot_0_86_10,
	"lc"
})
slot_0_27_0.col_ping_on = slot_0_84_8:color_picker("ping color", color(175, 175, 180, 255)):depend({
	slot_0_86_10,
	"ping"
})
slot_0_27_0.col_off = {
	get = function()
		return color(75, 75, 80, 255)
	end
}
slot_0_27_0.col_text = {
	get = function()
		return color(175, 175, 180, 255)
	end
}
slot_0_27_0.enabled = {
	get = function()
		return slot_0_83_7:get()
	end
}
slot_0_27_0.show_dt = {
	get = function()
		return slot_0_86_10:get("double tap")
	end
}
slot_0_27_0.show_hs = {
	get = function()
		return slot_0_86_10:get("hide shots")
	end
}
slot_0_27_0.show_fs = {
	get = function()
		return slot_0_86_10:get("freestanding")
	end
}
slot_0_27_0.show_fd = {
	get = function()
		return slot_0_86_10:get("fake duck")
	end
}
slot_0_27_0.show_dmg = {
	get = function()
		return slot_0_86_10:get("min damage")
	end
}
slot_0_27_0.show_da = {
	get = function()
		return slot_0_86_10:get("dormant aimbot")
	end
}
slot_0_27_0.show_lc = {
	get = function()
		return slot_0_86_10:get("lc")
	end
}
slot_0_27_0.show_ping = {
	get = function()
		return slot_0_86_10:get("ping")
	end
}
slot_0_27_0.col_bg = slot_0_85_8
slot_0_27_0.col_border = {
	get = function()
		return color(0, 0, 0, 0)
	end
}
slot_0_27_0.blur = slot_0_84_8:switch("background blur", false)
slot_0_27_0.font = slot_0_84_8:combo("font", {
	"inter",
	"verdana"
}, "inter")
slot_0_27_0._select = slot_0_86_10
slot_0_27_0._label = slot_0_83_7
slot_0_59_0.info.side_ind = slot_0_83_7
slot_0_87_10 = slot_0_79_9:switch("\v\f<keyboard>\r  keybinds", false):depend({
	slot_0_78_7,
	slot_0_77_5
})
slot_0_88_11 = slot_0_87_10:create()
slot_0_89_9 = {
	enabled = slot_0_87_10,
	show_bg = slot_0_88_11:switch("show keybind background", true),
	col_bg = slot_0_88_11:color_picker("background", color(15, 15, 18, 210)),
	col_border = slot_0_88_11:color_picker("border", color(255, 255, 255, 40)),
	col_text = slot_0_88_11:color_picker("text color", color(133, 133, 133, 191)),
	col_accent = slot_0_88_11:color_picker("accent", color(133, 133, 133, 191)),
	font = slot_0_88_11:combo("font", {
		"inter",
		"verdana"
	}, "inter")
}
slot_0_59_0.info.keybinds = slot_0_87_10
slot_0_59_0.info.keybinds_ui = slot_0_89_9
slot_0_83_6 = slot_0_1_0.create(slot_0_61_2.misc, "       ", 1)
slot_0_84_7 = slot_0_1_0.create(slot_0_61_2.misc, "         ", 2)
slot_0_85_7 = {}
slot_0_86_9 = {}
slot_0_87_9 = {
	switch = slot_0_83_6:switch("\v\f<clock>\r  unlock fake latency", false)
}

slot_0_87_9.switch:set_callback(function(arg_89_0)
	cvar.sv_maxunlag:float(arg_89_0:get() and 2 or 0.1)
end)

slot_0_86_9.latency = slot_0_87_9
slot_0_88_10 = {
	unlock = slot_0_83_6:switch("\v\f<gauge-high>\r  unlock fd speed")
}
slot_0_86_9.fakeduck = slot_0_88_10
slot_0_85_7.aimbot = slot_0_86_9
slot_0_87_8 = {
	fall_damage = slot_0_83_6:switch("\v\f<person-falling>\r  avoid fall damage"),
	fast_ladder = slot_0_83_6:switch("\v\f<stairs>\r  fast ladder")
}
slot_0_85_7.movement = slot_0_87_8
slot_0_88_9 = {
	enabled = slot_0_84_7:switch("\v\f<person-running>\r  anim breaker")
}
slot_0_89_8 = slot_0_88_9.enabled:create()
slot_0_88_9.types = slot_0_89_8:selectable(slot_0_60_1("type"), {
	"in air",
	"on ground",
	"pitch zero on land"
}):depend({
	slot_0_88_9.enabled,
	true
})
slot_0_88_9.in_air_type = slot_0_89_8:combo(slot_0_60_1("in air"), {
	"static",
	"reverse running"
}, "static"):depend({
	slot_0_88_9.enabled,
	true
}, {
	slot_0_88_9.types,
	"in air"
})
slot_0_88_9.on_ground_type = slot_0_89_8:combo(slot_0_60_1("on ground"), {
	"static",
	"jitter",
	"reverse running"
}, "static"):depend({
	slot_0_88_9.enabled,
	true
}, {
	slot_0_88_9.types,
	"on ground"
})
slot_0_85_7.animbreaker = slot_0_88_9
slot_0_89_7 = {
	enabled = slot_0_84_7:switch("\v\f<wine-bottle>\r  drink")
}
slot_0_90_8 = slot_0_89_7.enabled:create()
slot_0_89_7.esp = slot_0_90_8:switch(slot_0_60_1("show esp"), true):depend({
	slot_0_89_7.enabled,
	true
})
slot_0_89_7.esp_color = slot_0_90_8:color_picker(slot_0_60_1("color"), color(255, 255, 255, 255)):depend({
	slot_0_89_7.enabled,
	true
}, {
	slot_0_89_7.esp,
	true
})
slot_0_89_7.distance = slot_0_90_8:slider(slot_0_60_1("esp distance"), 50, 1500, 800, 1, "u"):depend({
	slot_0_89_7.enabled,
	true
}, {
	slot_0_89_7.esp,
	true
})
slot_0_85_7.drink = slot_0_89_7
slot_0_90_7 = {
	enabled = slot_0_84_7:switch("\v\f<tag>\r  clantag")
}
slot_0_85_7.clantag = slot_0_90_7
slot_0_91_8 = {
	enabled = slot_0_84_7:switch("\v\f<comment>\r  kill say")
}
slot_0_92_8 = slot_0_91_8.enabled:create()
slot_0_91_8.modes = slot_0_92_8:selectable(slot_0_60_1("trigger on"), {
	"kill",
	"revenge"
}):depend({
	slot_0_91_8.enabled,
	true
})
slot_0_85_7.killsay = slot_0_91_8
slot_0_59_0.misc = slot_0_85_7
slot_0_86_8 = slot_0_1_0.create(slot_0_61_2.visuals, " \n", 1)
slot_0_15_0 = slot_0_86_8:color_picker("accent color", color(107, 112, 147, 255)):depend({
	slot_0_78_7,
	slot_0_77_5
})
slot_0_16_0 = slot_0_86_8:switch("share logo", false):depend({
	slot_0_78_7,
	slot_0_77_5
})

slot_0_1_0.create(slot_0_61_2.visuals, " \n ", 2):label("\v✦\r  \aFFFFFFFFelysian \a444444FF— 2026")
slot_0_1_0.create(slot_0_61_2.misc, "  ", 2):label("\v✦\r  \aFFFFFFFFelysian \a444444FF— 2026")

slot_0_60_0 = nil
slot_0_61_1 = false
slot_0_62_2 = false
slot_0_63_2 = nil
slot_0_64_3 = false
slot_0_65_4 = nil

function slot_0_66_4()
	local var_90_0 = slot_0_11_0.visuals.weapon_chams

	if not var_90_0 then
		return
	end

	if slot_0_65_4 then
		pcall(function()
			slot_0_65_4:override()
		end)
	end

	if slot_0_63_2 ~= nil then
		var_90_0:override(slot_0_63_2)
	else
		var_90_0:override()
	end

	slot_0_64_3 = false
end

function slot_0_67_4()
	local var_92_0 = slot_0_11_0.visuals.weapon_chams

	if not var_92_0 then
		return
	end

	var_92_0:override(true)

	if not slot_0_65_4 then
		pcall(function()
			slot_0_65_4 = ui.find("Visuals", "Players", "Self", "Chams", "Weapon", "Color")
		end)
	end

	if slot_0_65_4 then
		pcall(function()
			slot_0_65_4:override(color("#6E96F000"))
		end)
	end

	slot_0_64_3 = true
end

function slot_0_68_4()
	local var_95_0 = slot_0_11_0.visuals.weapon_chams

	if not var_95_0 then
		return
	end

	if slot_0_65_4 then
		pcall(function()
			slot_0_65_4:override()
		end)
	end

	if slot_0_63_2 ~= nil then
		var_95_0:override(slot_0_63_2)
	else
		var_95_0:override()
	end

	slot_0_64_3 = false
end

events.createmove(function(arg_97_0)
	local var_97_0 = slot_0_59_0.info.additions

	if not var_97_0 then
		return
	end

	if var_97_0.remove_shadow:get() then
		cvar.cl_csm_shadows:int(0)

		slot_0_61_1 = true
	elseif slot_0_61_1 then
		cvar.cl_csm_shadows:int(1)

		slot_0_61_1 = false
	end

	local var_97_1 = var_97_0.remove_weapon:get()
	local var_97_2 = slot_0_11_0.visuals.weapon_chams
	local var_97_3 = slot_0_11_0.visuals.thirdperson

	if not var_97_2 or not var_97_3 then
		slot_0_62_2 = false

		return
	end

	if slot_0_62_2 and not var_97_1 then
		slot_0_62_2 = false

		slot_0_66_4()

		slot_0_63_2 = nil

		return
	end

	if not slot_0_62_2 and var_97_1 then
		slot_0_62_2 = true

		local var_97_4, var_97_5 = pcall(function()
			return var_97_2:get()
		end)

		slot_0_63_2 = var_97_4 and var_97_5 or nil
	end

	if not var_97_1 then
		return
	end

	if var_97_3:get() or false then
		if not slot_0_64_3 then
			slot_0_67_4()
		end
	elseif slot_0_64_3 then
		slot_0_68_4()
	end
end)
events.shutdown(function()
	if slot_0_61_1 then
		pcall(function()
			cvar.cl_csm_shadows:int(1)
		end)
	end

	if slot_0_62_2 then
		pcall(function()
			slot_0_66_4()
		end)
	end
end)

slot_0_61_0 = nil
slot_0_62_1 = nil

events.override_view(function(arg_102_0)
	local var_102_0 = slot_0_59_0.info.scope_zoom

	if not var_102_0 or not var_102_0.enabled:get() then
		slot_0_62_1 = nil

		return
	end

	local var_102_1 = entity.get_local_player()

	if not var_102_1 or not var_102_1:is_alive() then
		slot_0_62_1 = nil

		return
	end

	local var_102_2 = arg_102_0.fov

	if slot_0_62_1 == nil then
		slot_0_62_1 = var_102_2

		return
	end

	local var_102_3 = 0.095 * (var_102_0.speed:get() / 100) * (globals.frametime * 175)
	local var_102_4 = math.max(0.001, math.min(1, var_102_3))

	if math.abs(var_102_2 - slot_0_62_1) <= 0.095 then
		slot_0_62_1 = var_102_2
	else
		slot_0_62_1 = slot_0_62_1 + (var_102_2 - slot_0_62_1) * var_102_4
	end

	arg_102_0.fov = slot_0_62_1
end)

slot_0_62_0 = nil
slot_0_63_1 = nil
slot_0_64_2 = nil
slot_0_65_3 = nil
slot_0_66_3 = nil
slot_0_67_3 = nil
slot_0_68_3 = nil
slot_0_69_3 = false

function slot_0_70_4()
	if slot_0_67_3 then
		return
	end

	pcall(function()
		slot_0_67_3 = ui.find("Visuals", "World", "Main", "Override Zoom", "Force Viewmodel")
	end)
end

function slot_0_71_5()
	if not slot_0_67_3 then
		return
	end

	if not slot_0_69_3 then
		if slot_0_68_3 == nil then
			pcall(function()
				slot_0_68_3 = slot_0_67_3:get()
			end)
		end

		slot_0_69_3 = true
	end

	pcall(function()
		slot_0_67_3:override(true)
	end)
end

function slot_0_72_5()
	if not slot_0_67_3 then
		return
	end

	if not slot_0_69_3 then
		return
	end

	slot_0_67_3:override()

	if slot_0_68_3 ~= nil then
		pcall(function()
			slot_0_67_3:set(slot_0_68_3)
		end)
	end

	slot_0_69_3 = false
end

events.render(function()
	slot_0_70_4()

	local var_110_0 = slot_0_59_0.info.viewmodel

	if not var_110_0 or not var_110_0.enabled:get() then
		if slot_0_63_1 ~= nil then
			pcall(function()
				cvar.viewmodel_fov:float(68, true)
			end)
			pcall(function()
				cvar.viewmodel_offset_x:float(0, true)
			end)
			pcall(function()
				cvar.viewmodel_offset_y:float(0, true)
			end)
			pcall(function()
				cvar.viewmodel_offset_z:float(0, true)
			end)
		end

		slot_0_63_1 = nil
		slot_0_64_2 = nil
		slot_0_65_3 = nil
		slot_0_66_3 = nil

		slot_0_72_5()

		return
	end

	local var_110_1 = math.max(0.001, math.min(globals.frametime, 0.05))
	local var_110_2 = math.min(1, var_110_1 * 12)
	local var_110_3 = var_110_0.fov:get()
	local var_110_4 = var_110_0.x:get() * 0.1
	local var_110_5 = var_110_0.y:get() * 0.1
	local var_110_6 = var_110_0.z:get() * 0.1

	if var_110_0.viewmodel_in_scope and var_110_0.viewmodel_in_scope:get() then
		slot_0_71_5()

		local var_110_7 = entity.get_local_player()

		if var_110_7 and var_110_7:is_alive() and (pcall(function()
			return var_110_7.m_bIsScoped
		end) and var_110_7.m_bIsScoped or false) then
			var_110_4 = var_110_0.scope_x:get() * 0.1
			var_110_5 = var_110_0.scope_y:get() * 0.1
			var_110_6 = var_110_0.scope_z:get() * 0.1

			local var_110_8 = var_110_0.scope_anim_speed:get() * 0.1

			var_110_2 = math.min(1, var_110_1 * var_110_8)
		end
	else
		slot_0_72_5()
	end

	if slot_0_63_1 == nil then
		slot_0_63_1 = var_110_3
	end

	if slot_0_64_2 == nil then
		slot_0_64_2 = var_110_4
	end

	if slot_0_65_3 == nil then
		slot_0_65_3 = var_110_5
	end

	if slot_0_66_3 == nil then
		slot_0_66_3 = var_110_6
	end

	slot_0_63_1 = slot_0_63_1 + (var_110_3 - slot_0_63_1) * var_110_2
	slot_0_64_2 = slot_0_64_2 + (var_110_4 - slot_0_64_2) * var_110_2
	slot_0_65_3 = slot_0_65_3 + (var_110_5 - slot_0_65_3) * var_110_2
	slot_0_66_3 = slot_0_66_3 + (var_110_6 - slot_0_66_3) * var_110_2

	pcall(function()
		cvar.viewmodel_fov:float(slot_0_63_1, true)
	end)
	pcall(function()
		cvar.viewmodel_offset_x:float(slot_0_64_2, true)
	end)
	pcall(function()
		cvar.viewmodel_offset_y:float(slot_0_65_3, true)
	end)
	pcall(function()
		cvar.viewmodel_offset_z:float(slot_0_66_3, true)
	end)
end)

slot_0_63_0 = nil
slot_0_64_1 = slot_0_5_0.new(0)
slot_0_65_2 = slot_0_5_0.new(0)
slot_0_66_2 = nil
slot_0_67_2 = nil
slot_0_68_2 = false

function slot_0_69_2()
	if slot_0_66_2 then
		return
	end

	pcall(function()
		slot_0_66_2 = ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay")
	end)
end

function slot_0_70_3()
	if slot_0_66_2 and slot_0_67_2 == nil then
		pcall(function()
			slot_0_67_2 = slot_0_66_2:get()
		end)
	end
end

function slot_0_71_4()
	if not slot_0_66_2 then
		return
	end

	if not slot_0_68_2 then
		return
	end

	slot_0_66_2:override()

	if slot_0_67_2 ~= nil then
		pcall(function()
			slot_0_66_2:set(slot_0_67_2)
		end)
	end

	slot_0_68_2 = false
end

function slot_0_72_4()
	if not slot_0_66_2 then
		return
	end

	slot_0_70_3()
	slot_0_66_2:override("Remove All")

	slot_0_68_2 = true
end

slot_0_69_2()
events.render(function()
	slot_0_69_2()

	slot_127_0_0 = entity.get_local_player()

	if slot_127_0_0 == nil or not slot_127_0_0:is_alive() then
		slot_0_64_1(0.05, false)
		slot_0_65_2(0.05, false)
		slot_0_71_4()

		return
	end

	if slot_127_0_0:get_player_weapon() == nil then
		slot_0_64_1(0.05, false)
		slot_0_65_2(0.05, false)
		slot_0_71_4()

		return
	end

	slot_127_2_0 = slot_0_59_0.info.custom_scope
	slot_127_3_0 = slot_127_2_0 and slot_127_2_0.enabled and slot_127_2_0.enabled:get()
	slot_127_4_0 = slot_127_0_0.m_bIsScoped

	if slot_127_2_0.disable_animation and slot_127_2_0.disable_animation:get() then
		slot_0_64_1.value = slot_127_3_0 and 1 or 0
		slot_0_65_2.value = slot_127_3_0 and slot_127_4_0 and 1 or 0
	else
		slot_127_5_1 = (slot_127_2_0.anim_speed and slot_127_2_0.anim_speed:get() or 5) * 0.01

		slot_0_64_1(slot_127_5_1, slot_127_3_0)
		slot_0_65_2(slot_127_5_1, slot_127_3_0 and slot_127_4_0)
	end

	if slot_0_64_1.value <= 0 then
		slot_0_71_4()

		return
	end

	slot_0_72_4()

	slot_127_5_0 = slot_0_64_1.value * slot_0_65_2.value
	slot_127_6_0 = render.screen_size()
	slot_127_7_0 = slot_127_6_0 * 0.5
	slot_127_8_0 = math.floor(slot_127_2_0.gap:get() * slot_127_6_0.y * (1 / slot_127_6_0.y))
	slot_127_9_0 = math.floor(slot_127_2_0.length:get() * slot_127_6_0.y * (1 / slot_127_6_0.y))
	slot_127_10_0 = slot_127_9_0 - slot_127_8_0
	slot_127_11_0 = slot_127_2_0.color_main:get()
	slot_127_12_0 = slot_127_2_0.color_edge:get()
	slot_127_11_0.a = slot_127_11_0.a * slot_127_5_0
	slot_127_12_0.a = slot_127_12_0.a * slot_127_5_0

	if slot_127_2_0.glow and slot_127_2_0.glow:get() then
		slot_127_13_0 = slot_127_2_0.glow_color:get()
		slot_127_14_0 = {
			{
				a_mul = 0.05,
				w = 7
			},
			{
				a_mul = 0.1,
				w = 4
			},
			{
				a_mul = 0.18,
				w = 2
			}
		}

		for iter_127_0, iter_127_1 in ipairs(slot_127_14_0) do
			slot_127_20_0 = math.floor(slot_127_13_0.a * slot_127_5_0 * iter_127_1.a_mul)

			if slot_127_20_0 > 1 then
				slot_127_21_0 = iter_127_1.w
				slot_127_22_0 = color(slot_127_13_0.r, slot_127_13_0.g, slot_127_13_0.b, slot_127_20_0)
				slot_127_23_0 = color(slot_127_13_0.r, slot_127_13_0.g, slot_127_13_0.b, 0)

				render.gradient(vector(slot_127_7_0.x - slot_127_21_0, slot_127_7_0.y - slot_127_8_0 + 1), vector(slot_127_7_0.x + 1 + slot_127_21_0, slot_127_7_0.y - slot_127_9_0 * slot_127_5_0), slot_127_22_0, slot_127_22_0, slot_127_23_0, slot_127_23_0)
				render.gradient(vector(slot_127_7_0.x - slot_127_21_0, slot_127_7_0.y + slot_127_8_0), vector(slot_127_7_0.x + 1 + slot_127_21_0, slot_127_7_0.y + slot_127_9_0 * slot_127_5_0), slot_127_22_0, slot_127_22_0, slot_127_23_0, slot_127_23_0)
				render.gradient(vector(slot_127_7_0.x - slot_127_8_0 + 1, slot_127_7_0.y - slot_127_21_0), vector(slot_127_7_0.x - slot_127_8_0 + 1 - slot_127_10_0 * slot_127_5_0, slot_127_7_0.y + 1 + slot_127_21_0), slot_127_22_0, slot_127_23_0, slot_127_22_0, slot_127_23_0)
				render.gradient(vector(slot_127_7_0.x + slot_127_8_0, slot_127_7_0.y - slot_127_21_0), vector(slot_127_7_0.x + slot_127_8_0 + slot_127_10_0 * slot_127_5_0 + 1, slot_127_7_0.y + 1 + slot_127_21_0), slot_127_22_0, slot_127_23_0, slot_127_22_0, slot_127_23_0)
			end
		end
	end

	render.gradient(vector(slot_127_7_0.x, slot_127_7_0.y - slot_127_8_0 + 1), vector(slot_127_7_0.x + 1, slot_127_7_0.y - slot_127_9_0 * slot_127_5_0), slot_127_11_0, slot_127_11_0, slot_127_12_0, slot_127_12_0)
	render.gradient(vector(slot_127_7_0.x, slot_127_7_0.y + slot_127_8_0), vector(slot_127_7_0.x + 1, slot_127_7_0.y + slot_127_9_0 * slot_127_5_0), slot_127_11_0, slot_127_11_0, slot_127_12_0, slot_127_12_0)
	render.gradient(vector(slot_127_7_0.x - slot_127_8_0 + 1, slot_127_7_0.y), vector(slot_127_7_0.x - slot_127_8_0 + 1 - slot_127_10_0 * slot_127_5_0, slot_127_7_0.y + 1), slot_127_11_0, slot_127_12_0, slot_127_11_0, slot_127_12_0)
	render.gradient(vector(slot_127_7_0.x + slot_127_8_0, slot_127_7_0.y), vector(slot_127_7_0.x + slot_127_8_0 + slot_127_10_0 * slot_127_5_0 + 1, slot_127_7_0.y + 1), slot_127_11_0, slot_127_12_0, slot_127_11_0, slot_127_12_0)
end)

slot_0_64_0 = {}
slot_0_65_1 = {}
slot_0_66_1 = 12
slot_0_67_1 = 7
slot_0_68_1 = 9
slot_0_69_1 = 6
slot_0_70_2 = 11
slot_0_71_3 = 6
slot_0_72_3 = 9
slot_0_73_3 = 10
slot_0_74_3 = 2
slot_0_75_4 = 3.5
slot_0_76_5 = 6
slot_0_78_6 = ui.create("DRAGGING_notifications"):slider("notifications:y", -16384, 16384, 0)

slot_0_78_6:visibility(false)
slot_0_36_0(function()
	slot_0_78_6:set(0)
end)
table.insert(slot_0_55_0, {
	key = "ntf:y",
	get = function()
		return slot_0_78_6:get()
	end,
	set = function(arg_130_0)
		slot_0_78_6:set(arg_130_0)
	end
})

slot_0_79_8 = {
	drag_start_y = 0,
	grab_anim = 0,
	hover_anim = 0,
	dragging = false,
	drag_start_val = 0
}

function slot_0_80_5(arg_131_0)
	return arg_131_0.y - 52 + slot_0_78_6:get()
end

function slot_0_81_5(arg_132_0)
	return arg_132_0.prefix_mode:get() == "icon"
end

function slot_0_82_4(arg_133_0)
	if arg_133_0 and arg_133_0.font then
		local var_133_0, var_133_1 = pcall(function()
			return arg_133_0.font:get()
		end)

		if var_133_0 and var_133_1 == "verdana" then
			return slot_0_29_0, slot_0_30_0
		end
	end

	return slot_0_21_0, slot_0_22_0
end

function slot_0_83_5(arg_135_0, arg_135_1, arg_135_2, arg_135_3)
	local var_135_0, var_135_1 = slot_0_82_4(arg_135_3)
	local var_135_2 = arg_135_2 and var_135_1 or var_135_0
	local var_135_3

	if arg_135_2 then
		var_135_3 = render.measure_text(var_135_2, nil, arg_135_1).x
	else
		var_135_3 = render.measure_text(var_135_2, nil, arg_135_1).x + slot_0_74_3 * (#arg_135_1 - 1)
	end

	local var_135_4 = var_135_3 + slot_0_70_2 * 2
	local var_135_5 = 0

	for iter_135_0, iter_135_1 in ipairs(arg_135_0) do
		var_135_5 = var_135_5 + render.measure_text(var_135_0, nil, tostring(iter_135_1)).x
	end

	local var_135_6 = var_135_5 + slot_0_73_3 * 2
	local var_135_7 = render.measure_text(var_135_2, nil, "A").y

	return var_135_4 + slot_0_71_3 + var_135_6, var_135_7 + slot_0_67_1 * 2
end

function slot_0_84_6(arg_136_0, arg_136_1, arg_136_2)
	return {
		slide_hiding = false,
		fut_hiding = false,
		old_hiding = false,
		dying = false,
		parts = arg_136_0,
		accent = arg_136_1,
		has_custom_accent = arg_136_1 ~= nil,
		born = globals.realtime,
		dur = arg_136_2 or slot_0_75_4,
		alife = slot_0_5_0.new(0),
		adie = slot_0_5_0.new(0),
		old_fraction = slot_0_5_0.new(0),
		old_adder = slot_0_5_0.new(1),
		old_size = slot_0_5_0.new(0),
		fut_fraction = slot_0_5_0.new(0),
		fut_adder = slot_0_5_0.new(0),
		fut_blur_in = slot_0_5_0.new(0),
		fut_blur_out = slot_0_5_0.new(0),
		slide_alpha = slot_0_5_0.new(0),
		slide_adder = slot_0_5_0.new(0)
	}
end

function slot_0_64_0.new(arg_137_0, arg_137_1)
	local var_137_0 = type(arg_137_0) == "table" and arg_137_0 or {
		arg_137_0
	}
	local var_137_1 = 0

	for iter_137_0, iter_137_1 in ipairs(slot_0_65_1) do
		if not iter_137_1.dying then
			var_137_1 = var_137_1 + 1
		end
	end

	if var_137_1 >= slot_0_76_5 then
		for iter_137_2, iter_137_3 in ipairs(slot_0_65_1) do
			if not iter_137_3.dying then
				iter_137_3.dying = true
				iter_137_3.born = 0

				break
			end
		end
	end

	local var_137_2 = slot_0_84_6(var_137_0, arg_137_1)

	table.insert(slot_0_65_1, var_137_2)

	return var_137_2
end

slot_0_85_6 = {}
slot_0_86_7 = {}
slot_0_87_7 = 0
slot_0_88_8 = 1.8
slot_0_89_6 = 3

;(function()
	slot_0_86_7 = {
		{
			ptype = "abf_miss",
			parts = {
				"anti-bruteforce triggered by ",
				"elysian",
				" due to ",
				"miss",
				" impact - angle shifted"
			},
			clr = color(150, 195, 255, 255)
		},
		{
			ptype = "abf_hit",
			parts = {
				"anti-bruteforce triggered by ",
				"elysian",
				" due to ",
				"hit",
				" impact - angle shifted"
			},
			clr = color(255, 160, 80, 255)
		},
		{
			ptype = "hit",
			parts = {
				"hit ",
				"elysian",
				" for ",
				"100",
				" hp"
			},
			clr = color(125, 210, 125, 255)
		},
		{
			ptype = "miss",
			parts = {
				"missed ",
				"elysian",
				" in ",
				"head",
				" due to ",
				"correction"
			},
			clr = color(220, 80, 80, 255)
		}
	}
end)()

slot_0_91_7 = 1

function slot_0_92_7()
	local var_139_0 = slot_0_86_7[slot_0_91_7]

	slot_0_91_7 = slot_0_91_7 % #slot_0_86_7 + 1

	local var_139_1 = 0

	for iter_139_0, iter_139_1 in ipairs(slot_0_85_6) do
		if not iter_139_1.dying then
			var_139_1 = var_139_1 + 1
		end
	end

	if var_139_1 >= slot_0_76_5 then
		for iter_139_2, iter_139_3 in ipairs(slot_0_85_6) do
			if not iter_139_3.dying then
				iter_139_3.dying = true
				iter_139_3.born = 0

				break
			end
		end
	end

	local var_139_2 = slot_0_59_0.info.notify

	if not var_139_2 then
		return
	end

	local var_139_3 = var_139_0.clr

	if var_139_0.ptype == "hit" then
		var_139_3 = var_139_2.col_hit:get()
	elseif var_139_0.ptype == "miss" then
		var_139_3 = var_139_2.col_miss:get()
	elseif var_139_0.ptype == "abf_miss" then
		var_139_3 = var_139_2.col_abf_miss and var_139_2.col_abf_miss:get() or color(150, 195, 255, 255)
	elseif var_139_0.ptype == "abf_hit" then
		var_139_3 = var_139_2.col_abf_hit and var_139_2.col_abf_hit:get() or color(255, 160, 80, 255)
	end

	table.insert(slot_0_85_6, slot_0_84_6(var_139_0.parts, var_139_3, slot_0_89_6))
end

function slot_0_93_8(arg_140_0, arg_140_1, arg_140_2, arg_140_3, arg_140_4, arg_140_5, arg_140_6)
	local var_140_0 = 6
	local var_140_1 = 1 / var_140_0
	local var_140_2 = 1

	for iter_140_0 = 1, var_140_0 do
		local var_140_3 = math.floor(arg_140_4.a * arg_140_5 * var_140_2 * 0.35)

		if var_140_3 > 1 then
			render.rect_outline(vector(arg_140_0 - iter_140_0, arg_140_1 - iter_140_0), vector(arg_140_2 + iter_140_0, arg_140_3 + iter_140_0), color(arg_140_4.r, arg_140_4.g, arg_140_4.b, var_140_3), 1, arg_140_6 + iter_140_0)
		end

		var_140_2 = var_140_2 - var_140_1
	end
end

function slot_0_94_8(arg_141_0, arg_141_1, arg_141_2, arg_141_3, arg_141_4, arg_141_5, arg_141_6)
	slot_141_7_0 = arg_141_0.col_glass:get()
	slot_141_8_0 = arg_141_0.col_border:get()
	slot_141_9_0 = arg_141_1.has_custom_accent and arg_141_1.accent or arg_141_0.col_accent:get()
	slot_141_10_0 = arg_141_0.col_accent:get()
	slot_141_11_0 = arg_141_0.col_text:get()
	slot_141_12_0 = math.floor(arg_141_6 * 255)
	slot_141_13_0 = arg_141_0.blur:get()
	slot_141_14_0 = slot_0_81_5(arg_141_0)
	slot_141_15_0 = slot_141_14_0 and "✦" or "elysian"
	slot_141_16_0, slot_141_17_0 = slot_0_82_4(arg_141_0)
	slot_141_18_0 = slot_141_14_0 and slot_141_17_0 or slot_141_16_0
	slot_141_19_0 = nil

	if slot_141_14_0 then
		slot_141_19_0 = render.measure_text(slot_141_18_0, nil, slot_141_15_0).x
	else
		slot_141_19_0 = render.measure_text(slot_141_18_0, nil, slot_141_15_0).x + slot_0_74_3 * (#slot_141_15_0 - 1)
	end

	slot_141_20_0 = slot_141_19_0 + slot_0_70_2 * 2
	slot_141_21_0 = arg_141_2 + slot_141_20_0 + slot_0_71_3
	slot_141_22_0 = arg_141_4 - slot_141_20_0 - slot_0_71_3
	slot_141_23_0 = math.floor(slot_141_12_0 * 0.18)

	if slot_141_23_0 > 1 then
		render.rect(vector(arg_141_2 - 2, arg_141_3 - 1), vector(arg_141_2 + slot_141_20_0 + 2, arg_141_3 + arg_141_5 + 3), color(0, 0, 0, slot_141_23_0), slot_0_72_3 + 2)
	end

	if slot_141_13_0 and slot_141_12_0 > 10 then
		render.blur(vector(arg_141_2, arg_141_3), vector(arg_141_2 + slot_141_20_0, arg_141_3 + arg_141_5), 6, arg_141_6 * 0.85, slot_0_72_3)
		render.blur(vector(arg_141_2, arg_141_3), vector(arg_141_2 + slot_141_20_0, arg_141_3 + arg_141_5), 3, arg_141_6 * 0.55, slot_0_72_3)
		render.blur(vector(arg_141_2, arg_141_3), vector(arg_141_2 + slot_141_20_0, arg_141_3 + arg_141_5), 1, arg_141_6 * 0.3, slot_0_72_3)
	end

	render.rect(vector(arg_141_2, arg_141_3), vector(arg_141_2 + slot_141_20_0, arg_141_3 + arg_141_5), color(slot_141_7_0.r, slot_141_7_0.g, slot_141_7_0.b, math.floor(slot_141_7_0.a * arg_141_6)), slot_0_72_3)

	if arg_141_0.glow and arg_141_0.glow:get() then
		slot_0_93_8(arg_141_2, arg_141_3, arg_141_2 + slot_141_20_0, arg_141_3 + arg_141_5, slot_141_9_0, arg_141_6 * 0.8, slot_0_72_3)
	end

	render.rect(vector(arg_141_2 + 1, arg_141_3 + 1), vector(arg_141_2 + slot_141_20_0 - 1, arg_141_3 + 1 + math.floor(arg_141_5 * 0.4)), color(255, 255, 255, math.floor(slot_141_12_0 * 0.07)), slot_0_72_3)
	render.rect_outline(vector(arg_141_2, arg_141_3), vector(arg_141_2 + slot_141_20_0, arg_141_3 + arg_141_5), color(slot_141_8_0.r, slot_141_8_0.g, slot_141_8_0.b, math.floor(slot_141_8_0.a * arg_141_6)), 1, slot_0_72_3)

	slot_141_24_0 = render.measure_text(slot_141_18_0, nil, "A").y
	slot_141_25_0 = arg_141_3 + math.floor((arg_141_5 - slot_141_24_0) * 0.5)
	slot_141_26_0 = arg_141_2 + math.floor((slot_141_20_0 - slot_141_19_0) * 0.5)

	if slot_141_14_0 then
		render.text(slot_141_18_0, vector(slot_141_26_0, slot_141_25_0), color(slot_141_10_0.r, slot_141_10_0.g, slot_141_10_0.b, math.floor(slot_141_10_0.a * arg_141_6)), nil, slot_141_15_0)
	else
		slot_141_27_1 = slot_141_26_0

		for iter_141_0 = 1, #slot_141_15_0 do
			slot_141_32_0 = slot_141_15_0:sub(iter_141_0, iter_141_0)
			slot_141_33_1 = render.measure_text(slot_141_18_0, nil, slot_141_32_0).x

			render.text(slot_141_18_0, vector(slot_141_27_1, slot_141_25_0), color(slot_141_10_0.r, slot_141_10_0.g, slot_141_10_0.b, math.floor(slot_141_10_0.a * arg_141_6)), nil, slot_141_32_0)

			slot_141_27_1 = slot_141_27_1 + slot_141_33_1 + (iter_141_0 < #slot_141_15_0 and slot_0_74_3 or 0)
		end
	end

	if slot_141_23_0 > 1 then
		render.rect(vector(slot_141_21_0 - 2, arg_141_3 - 1), vector(slot_141_21_0 + slot_141_22_0 + 2, arg_141_3 + arg_141_5 + 3), color(0, 0, 0, slot_141_23_0), slot_0_72_3 + 2)
	end

	if slot_141_13_0 and slot_141_12_0 > 10 then
		render.blur(vector(slot_141_21_0, arg_141_3), vector(slot_141_21_0 + slot_141_22_0, arg_141_3 + arg_141_5), 4, arg_141_6 * 0.72, slot_0_72_3)
	end

	render.rect(vector(slot_141_21_0, arg_141_3), vector(slot_141_21_0 + slot_141_22_0, arg_141_3 + arg_141_5), color(slot_141_7_0.r, slot_141_7_0.g, slot_141_7_0.b, math.floor(slot_141_7_0.a * arg_141_6)), slot_0_72_3)

	if arg_141_0.glow and arg_141_0.glow:get() then
		slot_0_93_8(slot_141_21_0, arg_141_3, slot_141_21_0 + slot_141_22_0, arg_141_3 + arg_141_5, slot_141_9_0, arg_141_6 * 0.8, slot_0_72_3)
	end

	render.rect(vector(slot_141_21_0 + 1, arg_141_3 + 1), vector(slot_141_21_0 + slot_141_22_0 - 1, arg_141_3 + 1 + math.floor(arg_141_5 * 0.4)), color(255, 255, 255, math.floor(slot_141_12_0 * 0.07)), slot_0_72_3)
	render.rect_outline(vector(slot_141_21_0, arg_141_3), vector(slot_141_21_0 + slot_141_22_0, arg_141_3 + arg_141_5), color(slot_141_8_0.r, slot_141_8_0.g, slot_141_8_0.b, math.floor(slot_141_8_0.a * arg_141_6)), 1, slot_0_72_3)

	slot_141_27_0 = render.measure_text(slot_141_16_0, nil, "A").y
	slot_141_28_0 = arg_141_3 + math.floor((arg_141_5 - slot_141_27_0) * 0.5)
	slot_141_29_0 = slot_141_21_0 + slot_0_73_3

	for iter_141_1, iter_141_2 in ipairs(arg_141_1.parts) do
		slot_141_35_0 = iter_141_1 % 2 == 1 and slot_141_11_0 or slot_141_9_0

		render.text(slot_141_16_0, vector(slot_141_29_0, slot_141_28_0), color(slot_141_35_0.r, slot_141_35_0.g, slot_141_35_0.b, math.floor(slot_141_35_0.a * arg_141_6)), nil, tostring(iter_141_2))

		slot_141_29_0 = slot_141_29_0 + render.measure_text(slot_141_16_0, nil, tostring(iter_141_2)).x
	end
end

function slot_0_95_8(arg_142_0, arg_142_1, arg_142_2, arg_142_3)
	if not (globals.realtime < arg_142_0.born + arg_142_0.dur) then
		arg_142_0.old_hiding = true
	end

	local var_142_0 = arg_142_0.old_fraction(0.06, arg_142_0.old_hiding and 0 or 1)

	if var_142_0 <= 0.005 then
		return true, 0
	end

	local var_142_1 = slot_0_81_5(arg_142_3)
	local var_142_2 = var_142_1 and "✦" or "elysian"
	local var_142_3, var_142_4 = slot_0_83_5(arg_142_0.parts, var_142_2, var_142_1, arg_142_3)
	local var_142_5 = arg_142_0.old_adder(0.06, arg_142_0.old_hiding and 0 or 1)
	local var_142_6 = (1 - var_142_5) * (var_142_4 + 14)
	local var_142_7 = math.floor(arg_142_1 - var_142_3 * 0.5)
	local var_142_8 = math.floor(arg_142_2 + var_142_6)

	slot_0_94_8(arg_142_3, arg_142_0, var_142_7, var_142_8, var_142_3, var_142_4, var_142_0)

	local var_142_9 = arg_142_3.glow and arg_142_3.glow:get() and 14 or slot_0_69_1

	return false, (var_142_4 + var_142_9) * var_142_5
end

function slot_0_96_9(arg_143_0, arg_143_1, arg_143_2, arg_143_3)
	if not arg_143_0.fut_hiding and globals.realtime >= arg_143_0.born + arg_143_0.dur then
		arg_143_0.fut_hiding = true
	end

	slot_143_4_0 = arg_143_0.fut_hiding and 0 or 1
	slot_143_5_0 = arg_143_0.fut_blur_in(0.08, slot_143_4_0)
	slot_143_6_0 = arg_143_0.fut_adder(0.08, slot_143_4_0)

	if arg_143_0.fut_hiding and slot_143_5_0 < 0.004 then
		return true, 0
	end

	slot_143_7_0 = slot_0_81_5(arg_143_3)
	slot_143_8_0 = slot_143_7_0 and "✦" or "elysian"
	slot_143_9_0, slot_143_10_0 = slot_0_83_5(arg_143_0.parts, slot_143_8_0, slot_143_7_0, arg_143_3)
	slot_143_11_0 = (1 - slot_143_5_0) * 6
	slot_143_12_0 = math.floor(arg_143_1 - slot_143_9_0 * 0.5)
	slot_143_13_0 = math.floor(arg_143_2 + slot_143_11_0)
	slot_143_14_0 = math.floor(slot_143_5_0 * 255)

	if slot_143_14_0 < 2 then
		return false, (slot_143_10_0 + slot_0_69_1) * slot_143_6_0
	end

	slot_143_15_0 = arg_143_3.col_glass:get()
	slot_143_16_0 = arg_143_3.col_border:get()

	render.rect(vector(slot_143_12_0 - 1, slot_143_13_0 + 2), vector(slot_143_12_0 + slot_143_9_0 + 1, slot_143_13_0 + slot_143_10_0 + 3), color(0, 0, 0, math.floor(slot_143_14_0 * 0.18)), slot_0_68_1 + 2)

	if arg_143_3.blur:get() and slot_143_14_0 > 10 then
		render.blur(vector(slot_143_12_0, slot_143_13_0), vector(slot_143_12_0 + slot_143_9_0, slot_143_13_0 + slot_143_10_0), 4, slot_143_5_0 * 0.72, slot_0_68_1)
	end

	render.rect(vector(slot_143_12_0, slot_143_13_0), vector(slot_143_12_0 + slot_143_9_0, slot_143_13_0 + slot_143_10_0), color(slot_143_15_0.r, slot_143_15_0.g, slot_143_15_0.b, math.floor(slot_143_15_0.a * slot_143_5_0)), slot_0_68_1)
	render.rect(vector(slot_143_12_0 + 1, slot_143_13_0 + 1), vector(slot_143_12_0 + slot_143_9_0 - 1, slot_143_13_0 + math.max(2, math.floor(slot_143_10_0 * 0.35))), color(255, 255, 255, math.floor(slot_143_14_0 * 0.06)), slot_0_68_1)
	render.rect_outline(vector(slot_143_12_0, slot_143_13_0), vector(slot_143_12_0 + slot_143_9_0, slot_143_13_0 + slot_143_10_0), color(slot_143_16_0.r, slot_143_16_0.g, slot_143_16_0.b, math.floor(slot_143_16_0.a * slot_143_5_0)), 1, slot_0_68_1)

	slot_143_17_0 = nil

	if not arg_143_0.fut_hiding then
		slot_143_17_0 = math.max(0, (slot_143_5_0 - 0.12) / 0.88)
	else
		slot_143_17_0 = math.max(0, (slot_143_5_0 - 0.08) / 0.92)
	end

	if slot_143_17_0 > 0.01 then
		slot_0_94_8(arg_143_3, arg_143_0, slot_143_12_0, slot_143_13_0, slot_143_9_0, slot_143_10_0, math.min(1, slot_143_17_0))
	end

	return false, (slot_143_10_0 + slot_0_69_1) * slot_143_6_0
end

function slot_0_97_10(arg_144_0, arg_144_1, arg_144_2, arg_144_3)
	slot_144_4_0 = globals.realtime

	if not arg_144_0.ntf_frac then
		arg_144_0.ntf_frac = slot_0_5_0.new(0)
	end

	if not arg_144_0.ntf_adder then
		arg_144_0.ntf_adder = slot_0_5_0.new(1)
	end

	if not arg_144_0.ntf_size then
		arg_144_0.ntf_size = slot_0_5_0.new(0)
	end

	if not arg_144_0.ntf_hiding and slot_144_4_0 >= arg_144_0.born + arg_144_0.dur then
		arg_144_0.ntf_hiding = true
	end

	slot_144_5_0 = arg_144_0.ntf_frac(0.05, not arg_144_0.ntf_hiding)

	if slot_144_5_0 <= 0.004 then
		return true, 0
	end

	slot_144_6_0 = arg_144_0.ntf_adder(0.05, false)
	slot_144_7_0 = slot_0_81_5(arg_144_3)
	slot_144_8_0 = slot_144_7_0 and "✦" or "elysian"
	slot_144_9_0, slot_144_10_0 = slot_0_82_4(arg_144_3)
	slot_144_11_0 = slot_144_7_0 and slot_144_10_0 or slot_144_9_0
	slot_144_12_0 = nil

	if slot_144_7_0 then
		slot_144_12_0 = render.measure_text(slot_144_11_0, nil, slot_144_8_0).x
	else
		slot_144_12_0 = render.measure_text(slot_144_11_0, nil, slot_144_8_0).x + slot_0_74_3 * (#slot_144_8_0 - 1)
	end

	slot_144_13_0 = slot_144_12_0 + slot_0_70_2 * 2
	slot_144_14_0 = 0

	for iter_144_0, iter_144_1 in ipairs(arg_144_0.parts) do
		slot_144_14_0 = slot_144_14_0 + render.measure_text(slot_144_9_0, nil, tostring(iter_144_1)).x
	end

	slot_144_15_0 = slot_144_14_0 + slot_0_73_3 * 2 + 1
	slot_144_16_0 = math.ceil(arg_144_0.ntf_size(0.05, not arg_144_0.ntf_hiding and slot_144_15_0 or 0))
	slot_144_17_0 = render.measure_text(slot_144_11_0, nil, "A").y + slot_0_67_1 * 2
	slot_144_18_0 = slot_144_13_0 + slot_0_71_3 + slot_144_16_0
	slot_144_19_0 = math.floor(arg_144_1 - slot_144_18_0 * 0.5)
	slot_144_20_0 = math.floor(arg_144_2 - (slot_144_17_0 + slot_0_69_1) * slot_144_6_0)
	slot_144_21_0 = math.floor(255 * slot_144_5_0)
	slot_144_22_0 = arg_144_3.col_glass:get()
	slot_144_23_0 = arg_144_3.col_border:get()
	slot_144_24_0 = arg_144_0.has_custom_accent and arg_144_0.accent or arg_144_3.col_accent:get()
	slot_144_25_0 = arg_144_3.col_accent:get()
	slot_144_26_0 = arg_144_3.col_text:get()
	slot_144_27_0 = arg_144_3.blur:get()
	slot_144_28_0 = color(slot_144_22_0.r, slot_144_22_0.g, slot_144_22_0.b, math.floor(math.max(slot_144_22_0.a, 140) * slot_144_5_0))
	slot_144_29_0 = color(slot_144_22_0.r, slot_144_22_0.g, slot_144_22_0.b, math.floor(math.max(slot_144_22_0.a, 105) * slot_144_5_0))
	slot_144_30_0 = color(slot_144_23_0.r, slot_144_23_0.g, slot_144_23_0.b, math.floor(slot_144_23_0.a * slot_144_5_0))
	slot_144_31_0 = math.floor(slot_144_21_0 * 0.16)

	if slot_144_31_0 > 1 then
		render.rect(vector(slot_144_19_0 - 2, slot_144_20_0 + 2), vector(slot_144_19_0 + slot_144_13_0 + 2, slot_144_20_0 + slot_144_17_0 + 3), color(0, 0, 0, slot_144_31_0), slot_0_72_3 + 2)
	end

	if slot_144_27_0 and slot_144_21_0 > 8 then
		render.blur(vector(slot_144_19_0, slot_144_20_0), vector(slot_144_19_0 + slot_144_13_0, slot_144_20_0 + slot_144_17_0), 0, slot_144_5_0, slot_0_72_3)
	end

	render.rect(vector(slot_144_19_0, slot_144_20_0), vector(slot_144_19_0 + slot_144_13_0, slot_144_20_0 + slot_144_17_0), slot_144_28_0, slot_0_72_3)

	if arg_144_3.glow and arg_144_3.glow:get() then
		slot_0_93_8(slot_144_19_0, slot_144_20_0, slot_144_19_0 + slot_144_13_0, slot_144_20_0 + slot_144_17_0, slot_144_24_0, slot_144_5_0 * 0.8, slot_0_72_3)
	end

	render.rect_outline(vector(slot_144_19_0, slot_144_20_0), vector(slot_144_19_0 + slot_144_13_0, slot_144_20_0 + slot_144_17_0), slot_144_30_0, 1, slot_0_72_3)

	slot_144_32_0 = render.measure_text(slot_144_11_0, nil, "A").y
	slot_144_33_0 = slot_144_20_0 + math.floor((slot_144_17_0 - slot_144_32_0) * 0.5)
	slot_144_34_0 = slot_144_19_0 + math.floor((slot_144_13_0 - slot_144_12_0) * 0.5)

	if slot_144_7_0 then
		render.text(slot_144_11_0, vector(slot_144_34_0, slot_144_33_0), color(slot_144_25_0.r, slot_144_25_0.g, slot_144_25_0.b, math.floor(slot_144_25_0.a * slot_144_5_0)), nil, slot_144_8_0)
	else
		slot_144_35_2 = slot_144_34_0

		for iter_144_2 = 1, #slot_144_8_0 do
			slot_144_40_0 = slot_144_8_0:sub(iter_144_2, iter_144_2)
			slot_144_41_0 = render.measure_text(slot_144_11_0, nil, slot_144_40_0).x

			render.text(slot_144_11_0, vector(slot_144_35_2, slot_144_33_0), color(slot_144_25_0.r, slot_144_25_0.g, slot_144_25_0.b, math.floor(slot_144_25_0.a * slot_144_5_0)), nil, slot_144_40_0)

			slot_144_35_2 = slot_144_35_2 + slot_144_41_0 + (iter_144_2 < #slot_144_8_0 and slot_0_74_3 or 0)
		end
	end

	if slot_144_16_0 > 1 then
		slot_144_35_1 = slot_144_19_0 + slot_144_13_0 + slot_0_71_3

		if slot_144_31_0 > 1 then
			render.rect(vector(slot_144_35_1 - 2, slot_144_20_0 + 2), vector(slot_144_35_1 + slot_144_16_0 + 2, slot_144_20_0 + slot_144_17_0 + 3), color(0, 0, 0, slot_144_31_0), slot_0_72_3 + 2)
		end

		if slot_144_27_0 and slot_144_21_0 > 8 then
			render.blur(vector(slot_144_35_1, slot_144_20_0), vector(slot_144_35_1 + slot_144_16_0, slot_144_20_0 + slot_144_17_0), 0, slot_144_5_0, slot_0_72_3)
		end

		render.rect(vector(slot_144_35_1, slot_144_20_0), vector(slot_144_35_1 + slot_144_16_0, slot_144_20_0 + slot_144_17_0), slot_144_29_0, slot_0_72_3)

		if arg_144_3.glow and arg_144_3.glow:get() then
			slot_0_93_8(slot_144_35_1, slot_144_20_0, slot_144_35_1 + slot_144_16_0, slot_144_20_0 + slot_144_17_0, slot_144_24_0, slot_144_5_0 * 0.8, slot_0_72_3)
		end

		render.rect_outline(vector(slot_144_35_1, slot_144_20_0), vector(slot_144_35_1 + slot_144_16_0, slot_144_20_0 + slot_144_17_0), slot_144_30_0, 1, slot_0_72_3)

		slot_144_36_0 = render.measure_text(slot_144_9_0, nil, "A").y
		slot_144_37_0 = slot_144_20_0 + math.floor((slot_144_17_0 - slot_144_36_0) * 0.5)
		slot_144_38_0 = slot_144_35_1 + slot_0_73_3

		render.push_clip_rect(vector(slot_144_38_0, slot_144_37_0), vector(slot_144_35_1 + slot_144_16_0 - slot_0_73_3, slot_144_37_0 + slot_144_36_0 + 1))

		for iter_144_3, iter_144_4 in ipairs(arg_144_0.parts) do
			slot_144_44_0 = iter_144_3 % 2 == 1 and slot_144_26_0 or slot_144_24_0
			slot_144_45_0 = tostring(iter_144_4)

			render.text(slot_144_9_0, vector(slot_144_38_0, slot_144_37_0), color(slot_144_44_0.r, slot_144_44_0.g, slot_144_44_0.b, math.floor(slot_144_44_0.a * slot_144_5_0)), nil, slot_144_45_0)

			slot_144_38_0 = slot_144_38_0 + render.measure_text(slot_144_9_0, nil, slot_144_45_0).x
		end

		render.pop_clip_rect()
	end

	slot_144_35_0 = arg_144_3.glow and arg_144_3.glow:get() and 14 or slot_0_69_1

	return false, (slot_144_17_0 + slot_144_35_0) * slot_144_5_0
end

function slot_0_98_10(arg_145_0, arg_145_1)
	if not arg_145_1 then
		slot_0_79_8.dragging = false
		slot_0_79_8.grab_anim = slot_0_79_8.grab_anim + (0 - slot_0_79_8.grab_anim) * 0.1

		return
	end

	local var_145_0 = false

	if slot_0_19_0 then
		local var_145_1, var_145_2 = pcall(function()
			return slot_0_19_0:get()
		end)

		var_145_0 = var_145_1 and var_145_2 == 2
	end

	if not var_145_0 then
		slot_0_79_8.dragging = false

		return
	end

	local var_145_3 = ui.get_mouse_position()
	local var_145_4 = common.is_button_down(1)
	local var_145_5 = arg_145_0.x * 0.5
	local var_145_6 = slot_0_80_5(arg_145_0)
	local var_145_7 = 120
	local var_145_8 = 14

	if var_145_4 and not slot_0_37_0.visible then
		if not slot_0_79_8.dragging then
			if slot_0_34_0 == nil and var_145_3.x >= var_145_5 - var_145_7 * 0.5 and var_145_3.x <= var_145_5 + var_145_7 * 0.5 and var_145_3.y >= var_145_6 - var_145_8 and var_145_6 >= var_145_3.y then
				slot_0_79_8.dragging = true
				slot_0_34_0 = slot_0_79_8
				slot_0_79_8.drag_start_y = var_145_3.y
				slot_0_79_8.drag_start_val = slot_0_78_6:get()
			end
		else
			local var_145_9 = slot_0_79_8.drag_start_val + (var_145_3.y - slot_0_79_8.drag_start_y)

			slot_0_78_6:set(math.max(-arg_145_0.y + 100, math.min(arg_145_0.y - 100, var_145_9)))
		end
	else
		if slot_0_79_8.dragging then
			slot_0_34_0 = nil
		end

		slot_0_79_8.dragging = false
	end

	slot_0_79_8.grab_anim = slot_0_79_8.grab_anim + ((slot_0_79_8.dragging and 1 or 0) - slot_0_79_8.grab_anim) * 0.14

	local var_145_10 = ui.get_mouse_position()
	local var_145_11 = slot_0_80_5(arg_145_0)
	local var_145_12 = var_145_10.x >= var_145_5 - 60 and var_145_10.x <= var_145_5 + 60 and var_145_10.y >= var_145_11 - var_145_8 and var_145_11 >= var_145_10.y

	slot_0_79_8.hover_anim = (slot_0_79_8.hover_anim or 0) + ((var_145_12 and 1 or 0) - (slot_0_79_8.hover_anim or 0)) * 0.12
end

function slot_0_99_12(arg_147_0, arg_147_1)
	if ui.get_alpha() <= 0 then
		return
	end

	local var_147_0 = false

	if slot_0_19_0 then
		local var_147_1, var_147_2 = pcall(function()
			return slot_0_19_0:get()
		end)

		var_147_0 = var_147_1 and var_147_2 == 2
	end

	if not var_147_0 then
		return
	end

	local var_147_3 = math.max(slot_0_79_8.hover_anim or 0, slot_0_79_8.grab_anim)

	if var_147_3 < 0.005 then
		return
	end

	slot_0_48_0(vector(arg_147_1, slot_0_80_5(arg_147_0) - 7), vector(120, 14), var_147_3)
end

events.render(function()
	local var_149_0 = render.screen_size()
	local var_149_1 = var_149_0.x * 0.5
	local var_149_2 = slot_0_59_0.info.notify

	if not var_149_2 then
		return
	end

	local var_149_3 = ui.get_alpha() > 0
	local var_149_4 = slot_0_80_5(var_149_0)
	local var_149_5 = false
	local var_149_6 = var_149_2.anim_style:get() == "new"
	local var_149_7 = false

	if var_149_3 and slot_0_19_0 then
		local var_149_8, var_149_9 = pcall(function()
			return slot_0_19_0:get()
		end)

		var_149_7 = var_149_8 and var_149_9 == 2
	end

	slot_0_98_10(var_149_0, var_149_3)

	local function var_149_10(arg_151_0)
		local var_151_0 = 0

		for iter_151_0 = #arg_151_0, 1, -1 do
			local var_151_1 = arg_151_0[iter_151_0]
			local var_151_2
			local var_151_3

			if var_149_6 then
				var_151_2, var_151_3 = slot_0_97_10(var_151_1, var_149_1, var_149_4 - var_151_0, var_149_2)
			else
				var_151_2, var_151_3 = slot_0_95_8(var_151_1, var_149_1, var_149_4 - var_151_0, var_149_2)
			end

			if var_151_2 then
				table.remove(arg_151_0, iter_151_0)
			else
				var_151_0 = var_151_0 + (var_151_3 or 0)
			end
		end
	end

	if var_149_3 and var_149_7 then
		if globals.realtime >= slot_0_87_7 then
			slot_0_92_7()

			slot_0_87_7 = globals.realtime + slot_0_88_8
		end

		if #slot_0_85_6 > 0 then
			var_149_10(slot_0_85_6)
		end
	else
		if #slot_0_85_6 > 0 then
			slot_0_85_6 = {}
			slot_0_87_7 = globals.realtime + 0.5
		end

		if #slot_0_65_1 == 0 then
			slot_0_99_12(var_149_0, var_149_1)

			return
		end

		var_149_10(slot_0_65_1)
	end

	slot_0_99_12(var_149_0, var_149_1)
end)

slot_0_65_0 = nil
slot_0_66_0 = nil
slot_0_67_0 = nil
slot_0_68_0 = nil
slot_0_69_0 = {}
slot_0_70_1 = "elysian_db"
slot_0_71_2 = db[slot_0_70_1] or {}
slot_0_71_2.default = nil
slot_0_72_2 = "\x8A\xD3\xF7\x1Ee©4\xEBW\x92\r\xBEA|&\x99\x84?p\xC5\x18\xA3^\xF1j\xD5H\x83.\xB9\x14"
slot_0_73_2 = "♡⋆⋆························⋆⋆♡"
slot_0_74_2 = {}

function slot_0_75_3()
	db[slot_0_70_1] = slot_0_71_2
end

slot_0_76_4 = "l29W5AU6JX1CEVIjmNFZM4xv+twdQsHLBrYG3S7h/zkPpbyoaneKqcDR)Tigf0u8"

function slot_0_77_4(arg_153_0)
	local var_153_0 = json.stringify(arg_153_0)

	return (var_153_0:gsub(".", function(arg_154_0)
		local var_154_0 = ""
		local var_154_1 = arg_154_0:byte()

		for iter_154_0 = 8, 1, -1 do
			var_154_0 = var_154_0 .. (var_154_1 % 2^iter_154_0 - var_154_1 % 2^(iter_154_0 - 1) > 0 and "1" or "0")
		end

		return var_154_0
	end) .. "0000"):gsub("%d%d%d?%d?%d?%d?", function(arg_155_0)
		if #arg_155_0 < 6 then
			return ""
		end

		local var_155_0 = 0

		for iter_155_0 = 1, 6 do
			var_155_0 = var_155_0 + (arg_155_0:sub(iter_155_0, iter_155_0) == "1" and 2^(6 - iter_155_0) or 0)
		end

		return slot_0_76_4:sub(var_155_0 + 1, var_155_0 + 1)
	end) .. ({
		"",
		"==",
		"="
	})[#var_153_0 % 3 + 1]
end

function slot_0_78_5(arg_156_0)
	local var_156_0, var_156_1 = pcall(function()
		local var_157_0 = string.gsub(arg_156_0, "[^" .. slot_0_76_4 .. "=]", ""):gsub(".", function(arg_158_0)
			if arg_158_0 == "=" then
				return ""
			end

			local var_158_0 = ""
			local var_158_1 = slot_0_76_4:find(arg_158_0, 1, true) - 1

			for iter_158_0 = 6, 1, -1 do
				var_158_0 = var_158_0 .. (var_158_1 % 2^iter_158_0 - var_158_1 % 2^(iter_158_0 - 1) > 0 and "1" or "0")
			end

			return var_158_0
		end):gsub("%d%d%d?%d?%d?%d?%d?%d?", function(arg_159_0)
			if #arg_159_0 ~= 8 then
				return ""
			end

			local var_159_0 = 0

			for iter_159_0 = 1, 8 do
				var_159_0 = var_159_0 + (arg_159_0:sub(iter_159_0, iter_159_0) == "1" and 2^(8 - iter_159_0) or 0)
			end

			return string.char(var_159_0)
		end)

		return json.parse(var_157_0)
	end)

	if not var_156_0 then
		slot_0_13_0:error("unable to decrypt config")

		return
	end

	return var_156_1
end

function slot_0_79_7()
	local var_160_0 = {}

	for iter_160_0, iter_160_1 in ipairs(slot_0_17_0) do
		var_160_0[iter_160_1.name .. ":x"] = iter_160_1.game_refs[1]:get()
		var_160_0[iter_160_1.name .. ":y"] = iter_160_1.game_refs[2]:get()
	end

	return var_160_0
end

slot_0_80_4 = {}

function slot_0_81_4(arg_161_0, arg_161_1, arg_161_2)
	table.insert(slot_0_80_4, {
		key = arg_161_0,
		get = arg_161_1,
		set = arg_161_2
	})
end

function slot_0_82_3()
	local var_162_0 = slot_0_79_7()

	for iter_162_0, iter_162_1 in ipairs(slot_0_80_4) do
		local var_162_1, var_162_2 = pcall(iter_162_1.get)

		if var_162_1 then
			var_162_0[iter_162_1.key] = var_162_2
		end
	end

	for iter_162_2, iter_162_3 in ipairs(slot_0_55_0) do
		local var_162_3, var_162_4 = pcall(iter_162_3.get)

		if var_162_3 then
			var_162_0[iter_162_3.key] = var_162_4
		end
	end

	return var_162_0
end

function slot_0_83_4(arg_163_0)
	if type(arg_163_0) ~= "table" then
		return
	end

	for iter_163_0, iter_163_1 in ipairs(slot_0_17_0) do
		local var_163_0 = iter_163_1.name .. ":x"
		local var_163_1 = iter_163_1.name .. ":y"

		if arg_163_0[var_163_0] then
			iter_163_1.game_refs[1]:set(arg_163_0[var_163_0])

			iter_163_1.smooth_x = arg_163_0[var_163_0]
		end

		if arg_163_0[var_163_1] then
			iter_163_1.game_refs[2]:set(arg_163_0[var_163_1])

			iter_163_1.smooth_y = arg_163_0[var_163_1]
		end
	end

	for iter_163_2, iter_163_3 in ipairs(slot_0_80_4) do
		if arg_163_0[iter_163_3.key] then
			pcall(iter_163_3.set, arg_163_0[iter_163_3.key])
		end
	end

	for iter_163_4, iter_163_5 in ipairs(slot_0_55_0) do
		if arg_163_0[iter_163_5.key] then
			pcall(iter_163_5.set, arg_163_0[iter_163_5.key])
		end
	end
end

slot_0_69_0.register_position_extra = slot_0_81_4
slot_0_69_0.save_positions_full = slot_0_82_3
slot_0_69_0.load_positions_full = slot_0_83_4
slot_0_84_5 = "default"
slot_0_85_5 = "HeXrsvN/dRJYIYX7+xnKtxMYC9XYsxSptU4eJG/YFU4+QhsDFSSXw62ts7EaQYpRs5nN4vXeMMmqZUNtF7SANYSrmKS+Z6t5m4SqMK2rsc42FRNDN4SXMDXhF7r+Q7mRZ3n3H55zF3QoM3V6d621wAretWsIZUN)MRS1Ne0nmqQeE5EDQASNVqATs55a+YbDmSSXNDnTNZSrx45RmvSqmZ2YsRBzxMS6d6SAVhAaFU4+tFb)4WVDNUVeFWS1wMMT1xAWI4rS1RrMERt5+Rz3xMzzNZ3z+MnUd7s1wAretWsIZUN)mFS1Ne0rmqspQ5z/x6X3VqTEt6rZHMz6CDAWNKJamKtax45RmvSqmZ2Y1Rt9xMS6d6SAIxAtMZs2HvN2EUXRH9StFMspHMMDQv2Jt4rS1RrMERt5+RXJIMzzNZ3z+METxUMPHAmKs3NGH7NtF7SAIFSrZ5tytqz/x6X3VqTEt6r21Mz6CDAWNDnaF7r+Q7mRZ3n3HAVTF3Qo+MV6EG2WVh2tMZs2HvN2EUJPs3XtFMspHMMT+4SNVqATs55a+hs)14SXNDnTNZtnQ5rSxUMPHAmKs3NGQ3BTF7SAIFSrmKS+tFb)4WVDNUVitAS1wMMT1xAEN7ThF7r+Q7mRZ3n3H55zF3Qo+MV6d621wAretWsIZUN)MRS1Ne0rmqQeE6tU+43PHABRs3NMdRV4MKsJN3zzQKt++RNU+43PHABRsSJeCebD4SVDMStZtWS1wMz6V4SWI4re1KsqZA5RV5bqs3TEQc4Z+hNDFSSXNqzTNZSrxFb)xWsDM3TSsRrKw6NDFSSXx4rttAXICqzt+43PHUTatAXKZAAFZhXK4MctFxrItvV)Zv21VqATQc4ZZ9b/xUVK4ZmRtAX+NRNUF7SKVSrGs5trxFpREWVJVW2M1RtNxMS/Z74KH5caFGs+dRmDMqnJH5AFs3NIMDN4m4N1Ne0rmqspQ5/RxU0qVSVEF6r2Mht5ZSV34MAMs3NGdRN4Z4SXx4rCQc42Qvs)N4SWI4rtt5NI46tFMRXK+KlKs6ryQ3BqEUMPHAmKt5NGZUN)mFS1Ne0GmqspQ5/RxU0qVSVEF6r2Mht5ZSV34MAMsSX+Q7mRZ703VW2YsRBzxMS6FhSAIxAt1KQaEqBqEAmPshVEsAMqQ9bDMqnNNWNys3NxdRV)46A1NefzmqspQ5/RxU0qVSVEF6r2Mht5ZSV34MAMsSXxMc5qE5bAN3zzN4zpHMMT+43PVKlKFWma49bDQqnq4ZNa1RtZZAA5VUTDM34yNZS1w4+T1xAWI4rtt5NI46tFMRXK+KlKs6ryQ3BqE5bqs3AEMMb1xMS61RSAIxAt1KQaEqBqEAmPshVEsAMqQ9bDMqnNNWNysSXAFqz6CqbWNDnaFGs+dRmDMqnJH5AFs3NIMDN4m4NDMStZMZmaFc+TF7SXNYSrmKS+xxN5ZSNDMSVeQDEaERN)dhXJVW2Cs6t2ZAACZ4SXNqXTNZSrxFpREWVJVW2M1RtKZ6N4V6lPsSVEMMmqdhtFNMN1Ne0SmqspQ5/RxU0qVSVEF6r2Mht5ZSV34MAMsSXxMc5qE5bxtMzzN4zAHMMT+43PVKlKFWma49bDQqnq4ZNa1RtZZAA5VUTDM3MzF3Qo+qV6d621VcrosWtZZ5r)m4XDN5TZtA4246tF4SVNVW2CFMt1w4+T1xAWI4rtt5NI46tFMRXK+K2Yt5NIMqz6CcSRVcVnQcMqtMzt+43PN6XosqNVxMStxWVqH6NeQRryQMzt+43PN6XosqNVdhtCV4SXNqzTNZSrxFb5Q70RN5cys3b1xMS6VxAWNDnaFGsxCDN5+SVAVUtCF3QotMV6d621Vc+ot5NYMqMqthA1Ne0SmqspQ5/R4Y03NUXZNZN7+qz6CD4WNDnaFGsxCDN5+SVAVUt5F3QotMV6d621Vc+ot5NYMRt5sU43N6AtFMQcN5V6d621Vc+ot5NYMRt5+cVK4vXosWS1wMz/x6X3VRVZFSSrxFb5Q70RNWNEMMNyHhN4VU41Ne0y4S3z+METx5sR4Z2msWmaFDN4MKVqsSrCF3QotMV6d621Vc+ot5NYMRtFZ701Ne0y4S3z+METxWVKH5Aas3NIHSAFZ74RHArGQc4ZdDNtF7S1VqAaQcMqtxmRmvAqN3zaFGsI+eb)d3n34ZmRQq5adRmR1cSXxvA5NZ3z+METxWVKH5AasSX+QhV4Z4SXNqzTNZSrxvmDV6X3mZ2S1RtIMRt5FSSXNDcTNZSrxvmDV6X3mZ2SsRrKCRV2EU0qVebtFMQP+MV6d621VRNesqmqZUN4MDXRs7ctFMQP+MV6d621VRNSs6BqFRV4mvSqmZ2rs6BqM5z6CcS3N6mRFSSrxxN4VWsKmZ2asRrGHhETF7Sxx3XTNZSrxxN)mFS1Ne0rmqspQ5/R+Rz3xMzzNZ3z+METxUX3N5TisWsZMcAtF7S1VqTiMMN2xxN4VWV1xxAtt6BaERs)s6zqsSrE1cJqFRV4EUXDMStasRrIMcA/N4SXNqzTNZSrxxN)EWVRH6Nis6t+ZUN)EWVqN3zzF7BqHvs)sU0NVRAtmKS++7N5ZhzqVcVZM4EadRmRs5bqs7ctFMspHMMT+4S3HWlKsRrqHhNDx5nNVGNaMMmqZ9bUF7SWxYbrmqspQ5/R+D0q44ERsRBqtvtFE7V3VStZs3N1xMS61DAWNDnaFGsGdRN4MKsRHWNSsSJe+DmD4SVDMSreQc4VxMS6mhSAIxAtt6BaERs)s6zqsSrEMMNyHhN4VU4N+DtyF3Qo+MV6d621VDVosA4ZVRs)VU4DMStasRrIMcA/43nAxMzzNZ3z+METxUX3N5TisWsZMcAZE5b344EKs6t+FRtCN4SXNDnTNZSrxxN)EWVRH6Nis6t+ZAA5dhzq4ZNSMxV7QMz6CDAWNDnaFGsGdRN4MKsRHWNSsSXxQ6s)ZSVNwAtE43t1wMMT1xAWI4rYt5NIHhmRMcVNMK2CtA4ZERNDx5bDFebtFMspHMMT+4S3HWlKsRrqHhNDx5nKNWNis5NeQvt54SV3w5TZM4S1w4twd6SAIxAtt6BaERs)s6zqsSrEQqmqHhN5QhADMStrMZQqQhmTF7SxNDnTNZSrx45RmvSq4Z2Ys3NxCDN5+SV1NR/R1RryFRNU+4SNVqATsAMa+hsDHSV1NR/R1RryFRNU+4SNVcV/sKtIZUN4MDXRs7ctFMsV45V6d621wAtmsRtIQvNDx5nq4ZN/F3QoQ4tU1xAWI4rM1RtKZ9pRmMbqN3zzFGs2QM/DZhXNVRVZQKS1Q5z/MRXK+K2as6rqQMz6CDXANK4TNZSrxMr)m4XDMSris5NeQMz6CqbAIFSrZ5trxFb)MD4144tStAJqNRs4MRSqtMzzFU4+Z6t5m4SqMK2rsc42FRmqE6S1Ne0ymqspQ5zZE5aPHABRsSJeCebD4SVNtMzzHAXax45RmvSqmZ2Y1Rt9xMS6MvSAIxAtMZs2HvN2EUXRH9StF4SnFqV6EG2WVh2tMZs2HvN2EUJPs3XtF4SndStS1xAWI4rS1RrMERt5+Rz3xMzzN4/PHMMDQv2Jt4rS1RrMERt5+RXJIMzzN4zpHMMT+4SNVqATs55a+hs)14SXxvAFmqQeE5EDQASNVqATs55a+YbDmSSXNDnTNZSrx45RmvSqmZ2YsRBzxMS6d6SAVhAaFU4+tFb)4WVDNUVeFWS1wMMT1xAWI4rS1RrMERt5+Rz3xMzzNZ3z+MnUd7s1wAretWsIZUN)mFS1Ne0rmqspQ5z/x6X3VqTEt6rZHMz6CDAWNKJamKtax45RmvSqmZ2Y1Rt9xMS6d6SAIxAtMZs2HvN2EUXRH9StFMspHMMDQv2Jt4rS1RrMERt5+RXJIMzzNZ3z+METxUMPHAmKs3NGH7NtF7SAIFSrZ5tytqz/x6X3VqTEt6r21Mz6CDAWNDnaF7r+Q7mRZ3n3HAVTF3Qo+MV6EG2WVh2tMZs2HvN2EUJPs3XtFMspHMMT+4SNVqATs55a+hs)14SXNDnTNZtGQqETx6JPVRNEtWQaQvs)sAN1NRznMxBqMqETx6JPVRNEM44eQSA5V5nNNWNaF3QoxM4UFh21VqAtsAEatvND4SVKmZ2nsRrGMcAtF7SxIFSrmKS+QYpRs5nKVSris5NKMcAtF7S1VcroQc49xMETx6X34xToQDEaFRV4mvAqN3zzQKt++RNU+43PHANnsKmax4A/V6AqH6NoMZsxMqz6HGQPHUTCs5trxFpREWVJVW2M1RtNxMS/Z74KH5caFGs+dRmDMqnJH5AFs3NIMDN4m4N1Ne0rmqspQ5/RxU0qVSVEF6r2Mht5ZSV34MAMs3NGdRN4Z4SXx4rCQc42Qvs)N4SWI4rtt5NI46tFMRXK+KlKs6ryQ3BqEUMPHAmKt5NGZUN)mFS1NefzmqspQ5/RxU0qVSVEF6r2Mht5ZSV34MAMsSX+Q7mRZ703VW2YsRBzxMS6FhSAIxAt1KQaEqBqEAmPshVEsAMqQ9bDMqnNNWNys3NxdRV)46A1Ne0FmqspQ5/RxU0qVSVEF6r2Mht5ZSV34MAMsSXxMc5qE5bAN3zzNxMz+METxAS3N5TMsSXZQhVGEWVqHUTeFWmaFRNDmMnNFK4rF3Qo+MV6d621VcrosWtZZ5r)m4XDN5TZtA4246tF4SVNVW2CN4S1w4tt1xAWI4rtt5NI46tFMRXK+KlKs6ryQ3BqE5bqs3AEMMbAxMS6VMNWNDnaFGs+dRmDMqnJH5AFs3NIMDN4m4NDMStZMZmaFc+TF7SxxFSrmKS+xxN5ZSNDMSVeQDEaERN)dhXJVW2Cs6t2ZAACZ4SXNqzTNZSrxFpREWVJVW2M1RtKZ6N4V6lPsSVEMMmqdhtFNMN1Ne0GmqspQ5/RxU0qVSVEF6r2Mht5ZSV34MAMsSXxMc5qE5bxtMzzN4/cHMMT+43PVKlKFWma49bDQqnq4ZNa1RtZZAA5VUTDM3MzF3QodStt1xAWI4rtt5NI46tFMRXK+KlKs6ryQ3BqE5bqs3AEMMpKxMS6MvSAIxAt1KQaEqBqEAmPshVEt6BaERNUF7S1VRziQKtIMcAtFh21Vc+ot5NYMqz6CcSq4ZmR1R+qQ6ETFh21Vc+ot5NYMqMqt7T1Ne0yNZ3z+METx5sR4Z2msAz2Z54tF7SAxFSrmKS+NRs4EA2qx3AENx41wM4t1xAWI4r6scMaM6NwmMnxIMzzN43z+METx5sR4Z2msAz2ZAtUF7SAxFSrmKS+NRs4EA2qx3AE4SS1wM4t1xAWI4r6scMaM6mqEWsNVK2YF3QodStU1xAWI4r6scMaM6mqEUXqs3)ot5NbxMStxUMPHAN/s5t1Q5/R4Y03NUXZsSXxQ6s)ZSVNxMzzN4zVHMMT+43PN6XosqmqZAA5dhzq4ZNSMx41w4+T1xAWI4r6scMaM6mqE6A3tMzzNMs1HMMT+4SqVGNet55aERsD4hANVcVtQRtIH7N514SXx4rS1RrMEDN5Q4SWI4BKQRr2Q6t5dSVqw5TEt5NqVqz6CDXANYSrmKS+ERV)mv2DMSreQc4VxMS6FhSAIxAtsW+qQ7N2EUMPs3TZs3N1xMS6dvSAIxAtsW+qQ7N2EU4RH6EoQq5adRmR1cSXNqcTNZSrxvmRm42qVW2asRrGHhETF7SxNDnTNZSrxvN/xAVqsStn1RrMERtFESVqH62tF4S+dRmR1cSWI4ras6rqQvt5dhz3HAVnF3Qo+q3T1xAWI4rY1Rt9xMS6FhAWNDnaFGsGH7NtF7SAIFSrmKS++7N5ZhzqVcVZM4S1wM/REWsqwAtZQKS1Q5/R+D0q44ERsRBqtvt547VNM3TotWmaFDN4MKVqsSrCF3QoN5V6d621VDVosA4ZVRs)VU4DNUVosA4VxMStxAXqHAV/sKtIMRmTFh21VDVosA4ZVRs)VU4DNWlRsUrxMRETF7SANYSrmKS++7N5ZhzqVcVZM4Ea+vV)d3bqVW2eF3Qo+St6d6SAIxAtt6BaERs)s6zqsSrEMZ+qQAA5V5aPxMzz43spHMMT+4S3HWlKsRrqHhNDx5nNVGNaMMmqZA5RmvAqN3zzFZ3z+METxUX3N5TisWsZMcAZE5b344EKs6t+FRtCV4SXxvAymqspQ5/R+D0q44ERsRBqtvtF4h2RH5TZMxrxZ54tF7SAxFSrmKS++7N5ZhzqVcVZM4EaFDN4MKVqsSrCs3bAxMStQxTWNDnaFGsGdRN4MKsRHWNSsSXxQ6s)ZSVNwAtE4GS1wM4S1xAWI4rYt5NIHhmRMcVNMK2CtA4ZERNDx5bDFqctF4Snd3V6d621VDVosA4ZVRs)VU4DMStasRrIMcA/43nxxMzzmczbHMMT+4S3HWlKsRrqHhNDx5nKNWNis5NeQvt54SV3w5TZM4S1w4twd6SAIxAtt6BaERs)s6zqsSrEQqmqHhN5QhADMStrMZQqQhmTF7SxNDnTNZSrx45RmvSq4Z2Ys3NxCDN5+SV1NR/R1RryFRNU+4SNVqATsAMa+hsDHSV1NR/R1RryFRNU+4SNVcV/sKtIZUN4MDXRs7ctFMsV45V6d621wAtmsRtIQvNDx5nq4ZN/F3Qo+qV6d621wAVeQDEaxFbD4SV1Ne0t1RtbmhV4mx4qNWNnFSSrxMr)m4XDNUTZsUrbxMStQx4xxFSrmKS+49bDQqnNVcV/sKtbxMS6N4XWNKJamKS+Nc5REUEPN6XitWsNxMS/QASD+K2e1KsqZAA4QhXNNWNEtAS1wMMT1xAWI4rEs3N2xvNZEUAR4MACs6tAxMSZ+7s1wAretWsIZUN)mFS1Ne0rmqspQ5z/x6X3VqTEt6rZHMz6CDAWNKJamKtax45RmvSqmZ2Y1Rt9xMS6d6SAIxAtMZs2HvN2EUXRH9StFMspHMMDQv2Jt4rS1RrMERt5+RXJIMzzNZ3z+METxUMPHAmKs3NGH7NtF7SAIFSrZ5tytqz/x6X3VqTEt6r21Mz6CDAWNDnaF7r+Q7mRZ3n3HAVTF3Qo+MV6EG2WVh2tMZs2HvN2EUJPs3XtFMspHMMT+4SNVqATs55a+hs)14SXNDnTNZtnQ5rSxUMPHAmKs3NGQ3BTF7SAIFSrmKS+tFb)4WVDNUVitAS1wMMT1xAEN7ThF7r+Q7mRZ3n3H55zF3Qo+MV6d621wAretWsIZUN)MRS1Ne0rmqQeE5EDQASNVqATs55a+YbDmSSXNDnTNZSrx45RmvSqmZ2YsRBzxMS6d6SAVhAaFU4+tFb)4WVDNUVeFWS1wMMT1xAWI4rS1RrMERt5+Rz3xMzzNZ3z+MnUd7s1wAretWsIZUN)mFS1Ne0rmqspQ5z/x6X3VqTEt6rZHMz6CDAWNKJas3trxFb)xWsDNANoQc4ZVqrUF7SKVSrGs5trxFb)xWsDMGJo1RtxMRtF4SV3IMzzF3QcxMETx6JPVRNEMZQqFRNDZ3nK44VYs6t1xMS6NvSAIxAt1Rr+VRtFZ74RH6V/s6t1xMStxUXRsStCFSSrxFb)dh23MhVEM4XIQhV4Z4SXw5TSQRrVQ5/RmvSK44VE1Dr++RV4VWs3MSr6s5t1wvmRmv2NN5caFGs+dRmDMqnJH5AFF3siQ4A/VAVWI4rtt5NI46tFMRXK+KlKs6ryQ3rUF7SAIFSrmKS+xxN5ZSNDMSVeQDEaERN)dhXJVW2Yt5NIMqz6CcSNM3TeQc4ZNqzt+43PVKlKFWma49bDQqnq4ZNa1RtZZA5RmvSq4Z2Ys3NGQ3BTF7SxxFSrmKS+xxN5ZSNDMSVeQDEaERN)dhXJVW2S1RrMEDN5+qn3HAVTF3QotMV6d621VcrosWtZZ5r)m4XDN5TZtA4246tF4SVNVW26tAJqHvETF7SAtFSrmKS+xxN5ZSNDMSVeQDEaERN)dhXJVW2Cs6t2ZAACV4SXNDcTNZSrxFpREWVJVW2M1RtKZ6N4V6lPsSVEMMmqdhtFNxTAIMzz4G3z+METxAS3N5TMsSXZQhVGEWVqHUTeFWmaFRNDmMnNFqztFMsbHMMT+43PVKlKFWma49bDQqnq4ZNa1RtZZAA5VUTDM34CF3QoQMV6d621VcrosWtZZ5r)m4XDN5TZtA4246tF4SVNVW2C4GS1w4+T1xAWI4rtt5NI46tFMRXK+KlKs6ryQ3BqE5bqs3AEMMbVxMS6dvSAIxAt1KQaEqBqEAmPshVEsAMqQ9bDMqnNNWNysSXAN5z6CRAWNDnaFGs+dRmDMqnJH5AFs3NIMDN4m4NDMStZMZmaFctSF7SxIFSrmKS+xxN5ZSNDMSVeQDEaERN)dhXJVW2Cs6t2ZAACmSSXNDcTNZSrxFpREWVJVW2M1RtKZ6N4V6lPsSVEMMmqdhtFN4N1Ne0nmqspQ5/RxU0qVSVEF6r2Mht5+D0q4MctF4S+FRV4mvARH54tmKS+NRs4EA2qN3zzFGsIMRmRmxV3V7ctmKS+NRs4EA2qx3AENMt1wM4t1xAWI4r6scMaM6NwmMnAxMzzN43z+METx5sR4Z2msAz2Z54SF7SAxFSrmKS+NRs4EA2qx3AE4GS1wM4wd6SAIxAt1qNedRs5ZxTDFqctFMs1HMMT+43PN6XosqNVdhtC1cSXNqzTNZSrxFb5Q70RNWNEsUr+dDNUF7SAxYbTNZSrxFb5Q70RNWNEt6BqQvs4EWV1Ne0tMZs2HvN5Z4SWI4r6scMaM6mqE5b344EKs6t1xMS6VMNWNDnaFGsxCDN5+SVDMStasRrIMcA/N4SXNqzTNZSrxFb5Q70RNWNEQc47xMS6VMNWNDnaFGsI+eb)d3nq44VCQKt+HYb/V6ARHW2TF3QoxFb)dhAqsSrT1RtIMqzt+4SqVGNet55aQ6N)s6ADNWlRsAS1wMVw1DAWNDnaFGsI+eb)d3nNVqAns5t1wM4t1xAWI4BKQRr2Q6tFx6XK4ZNE1cS1w4+T1xAWI4BKQRr2Q6tFx6zqN6Xns3maVRNtF7SxNDnTNZSrxvmRm42qVW2asRrGHhETF7SxNDnTNZSrxvN/xAVqsStn1RrMERtFESVqH62tF4S+dRmR1cSWI4ras6rqQvt5dhz3HAVnF3QoN5MT1xAWI4rY1Rt9xMS6d6SAIxAtt6rZHMz6CDAWNDnaFGsGdRN4MKsRHWNSF3QoxvN4MqpPHAras6rbxMETxUX3N5TisWsZMcAZE5sKsStnt5NGZAA5dhzq4ZNSMx41w4tU1xAWI4rYt5NIHhmRMcVNMK2Yt5NIMqz6Cc3PMGNCQcMa+3zt+4S3HWlKsRrqHhNDx5n3N6mRMMmqQMz6CDAWNDnaFGsGdRN4MKsRHWNSsSJe+DmD4SVDNW4tF4SnN5MT1xAWI4rYt5NIHhmRMcVNMK2rQRryFRmqEAS1Ne05NZ3z+METxUX3N5TisWsZMcAZEUAKHUTCsWmatFbDZSV1NefzmqspQ5/R+D0q44ERsRBqtvtF4h2RH5TZMxrxZ54UF7SxIFSrmKS++7N5ZhzqVcVZM4EaFDN4MKVqsSrCs3b1xMS6d6SAIxAtt6BaERs)s6zqsSrEMMNyHhN4VU4N+DtCF3QoM3V6d621VDVosA4ZVRs)VU4DMStasRrIMcA/43nxIMzzNZ3z+METxUX3N5TisWsZMcAZE5b344EKs6t+FRtCZ4SXxvAymqspQ5/R+D0q44ERsRBqtvtF4h2RH5TZMxrxZAttF7SAIFSrmKS++7N5ZhzqVcVZM4EaMhN)MDrRV3TE1qmqHvV4VU41Ne0GNZ3z+METxUX3N5TisWsZMcAZEAXqHAV/sKtIZAAFE74qH55KF3QoN5MT1xAWI4rS1RrMEDN5+qaPN6XosqNVxM3Rs6X3VStZmKS+tFb)4WV3NUViFWsVxMS/Z74KH5caF7r+HhN5QhADNUTit6rZQMz6CqNAIFSrmKS+FRs5MRAK4ZNSs3NIMRNSF7Sx4qcTNZSrxMr)m4XDNAreMMNVxMStx6XKIZXn1Rt+w6NDd4SWI4rM1RtKZUN4VWsKIMzzNZ3z+METxAmPshVEMZsZw6QDd4SXNDnTNZtnQ5/Rs6XRNWNa1RrNxMS/QASD+K2e1KsqZAA4QhXNNWNEtAS1wM4U1xAWI4rEs3N2xvNZEUAR4MACs6tAxMSZ+7s1wAretWsIZUN)mFS1Ne0rmqspQ5z/x6X3VqTEt6rZHMz6CDAWNKJamKtax45RmvSqmZ2Y1Rt9xMS6d6SAIxAtMZs2HvN2EUXRH9StFMspHMMDQv2Jt4rS1RrMERt5+RXJIMzzNZ3z+METxUMPHAmKs3NGH7NtF7SAIFSrZ5tytqz/x6X3VqTEt6r21Mz6CDAWNDnaF7r+Q7mRZ3n3HAVTF3Qo+MV6EG2WVh2tMZs2HvN2EUJPs3XtFMspHMMT+4SNVqATs55a+hs)14SXNDnTNZtnQ5rSxUMPHAmKs3NGQ3BTF7SAIFSrmKS+tFb)4WVDNUVitAS1wMMT1xAEN7ThF7r+Q7mRZ3n3H55zF3Qo+MV6d621wAretWsIZUN)MRS1Ne0rmqQeE5EDQASNVqATs55a+YbDmSSXNDnTNZSrx45RmvSqmZ2YsRBzxMS6d6SAVhAaFU4+tFb)4WVDNUVeFWS1wMMT1xAWI4rS1RrMERt5+Rz3xMzzNZ3z+MnUd7s1wAretWsIZUN)mFS1Ne0rmqspQ5z/x6X3VqTEt6rZHMz6CDAWNKJas3trxFb)xWsDNANoQc4ZVqrUF7SKVSrGs5trxFb)xWsDMGJo1RtxMRtF4SV3IMzzF3QcxMETx6JPVRNEMZQqFRNDZ3nK44VYs6t1xMS6NvSAIxAt1Rr+VRtFZ74RH6V/s6t1xMStxUXRsStCFSSrxFb)dh23MhVEM4XIQhV4Z4SXw5TSQRrVQ5/RmvSK44VE1Dr++RV4VWs3MSr6s5t1wvmRmv2NN5caFGs+dRmDMqnJH5AFF3siQ4A/VAVWI4rtt5NI46tFMRXK+KlKs6ryQ3rUF7SAIFSrmKS+xxN5ZSNDMSVeQDEaERN)dhXJVW2Yt5NIMqz6CcSNM3TeQc4ZNqzt+43PVKlKFWma49bDQqnq4ZNa1RtZZA5RmvSq4Z2Ys3NGQ3BTF7SxxFSrmKS+xxN5ZSNDMSVeQDEaERN)dhXJVW2S1RrMEDN5+qn3HAVTF3QotMV6d621VcrosWtZZ5r)m4XDN5TZtA4246tF4SVNVW26tAJqHvETF7SAtFSrmKS+xxN5ZSNDMSVeQDEaERN)dhXJVW2Cs6t2ZAACV4SXNDcTNZSrxFpREWVJVW2M1RtKZ6N4V6lPsSVEMMmqdhtFNxTAIMzz4G3z+METxAS3N5TMsSXZQhVGEWVqHUTeFWmaFRNDmMnNFqztFMsbHMMT+43PVKlKFWma49bDQqnq4ZNa1RtZZAA5VUTDM34CF3QoQMV6d621VcrosWtZZ5r)m4XDN5TZtA4246tF4SVNVW2C4GS1w4+T1xAWI4rtt5NI46tFMRXK+KlKs6ryQ3BqE5bqs3AEMMbVxMS6dvSAIxAt1KQaEqBqEAmPshVEsAMqQ9bDMqnNNWNysSXAN5z6CRAWNDnaFGs+dRmDMqnJH5AFs3NIMDN4m4NDMStZMZmaFctSF7SxIFSrmKS+xxN5ZSNDMSVeQDEaERN)dhXJVW2Cs6t2ZAACmSSXNDcTNZSrxFpREWVJVW2M1RtKZ6N4V6lPsSVEMMmqdhtFN4N1Ne0nmqspQ5/RxU0qVSVEF6r2Mht5+D0q4MctF4S+wRsDZhAqs3ztmKS+NRs4EA2qN3zzFGsIMRmRmxV3V7ctmKS+NRs4EA2qx3AENMt1w4+T1xAWI4r6scMaM6NwmMnAxMzz4G3z+METx5sR4Z2msAz2Z54SF7SxIFSrmKS+NRs4EA2qx3AE4GS1w4+T1xAWI4r6scMaM6NwmMnxN3zz4G3z+METx5sR4Z2msAz2ZAttF7SxIFSrmKS+NRs4EA2qVWlRMZQa+3z6CeSWNDnaFGsxCDN5+SVDNUVZQc4edRmTF7S1wAretWsKMqzt+43PN6XosqmqZAA5dhzq4ZNSF3QodStt1xAWI4r6scMaM6mqE5b344EKs6t+Fqz6CD4WNDnaFGsxCDN5+SVDM3ToF3QodStt1xAWI4BKQRr2Q6t5ZhzNM3TSsRr++RV4MD03xMzzFGs2Q6V4VU43VqAns5t1Q5/RZ7EPHUTEtAMqVRV2EU0qVebtF4SnN5MT1xAWI4BKQRr2Q6tFx6XK4MctFMs1HMMT+4SqVGNet55atFbDZSVDN5ztFMsbHMMT+4SqVGNet55atvs)Qe0KmZ2osWQPxMS61DAWNDnaFGsqQhs5V5n344VYsRtbxMS61DAWNDnaFGsqtvN)V5bK4MATs55a+vN)VA21Ne0tM4MqMRsSEGQPHUXZFSSrxxN4VWsKmZ2asRrGHhETF7SxNDnTNZSrxxN)mFS1Ne05NZ3z+METxUXRH9StF4SnN5MT1xAWI4rYt5NIHhmRMcVNxMzzFGsIHSA5m4S34ZmKFSSrxxN)EWVRH6Nis6t+Z9bFV5bK4Z2YsSXxQ6s)ZSVNw54tFMs1HMMT+4S3HWlKsRrqHhNDx5n3HWlKs5t1wMz/V6SRH6NoMZsnxMETxUX3N5TisWsZMcAZEU0qVRNCs6tbxMS6d6SAIxAtt6BaERs)s6zqsSrEMZ+qQAA5V5aPN3zzmc/P+MV6d621VDVosA4ZVRs)VU4DMGXGtWtxMRt5FSSXNebrmqspQ5/R+D0q44ERsRBqtvtFE7V3VStZsSX+QhV4Z4SXNqXTNZSrxxN)EWVRH6Nis6t+ZAA5dhzq4ZNSMxV7d3z6CDAWNDnaFGsGdRN4MKsRHWNSsSXxQ6s)ZSVNwAtEN4S1wMMT1xAWI4rYt5NIHhmRMcVNMK2CtA4ZERNDx5bDFq4tFMspHMMT+4S3HWlKsRrqHhNDx5nNNUTisAMqt4AGthA1Ne0rmqspQ5/R+D0q44ERsRBqtvtF4h2RH5TZMxrxZAtUF7SAIFSrmKS++7N5ZhzqVcVZM4EaFDN4MKVqsSrCs3pPxMS6d6SAIxAtt6BaERs)s6zqsSrEQqmqHhN5QhADNAtZtUrIMcAtF7Sxx7nTNZSrxxN)EWVRH6Nis6t+Z6V5V6zqN6XnsSXx+45RV6XqIMzz43spHMMT+4SNVqATsAMa+ht54Y03NUXZF3siVeb)d3bqN7AtMZs2HvN4EUXRshzZF3siVeb)d3bqN7AtMZsZw6QDZ3n344VYsRtbxMS61DAWNDnaF7rxM6sDZhAqsSrEsAMqw5z6CRAxNYSrmKS+49bDQqaPVqACs5t1wM/RmvA1V3TeMZsKMRETFh21wAVeQDEaQ6N)s6A1Ne0YN4/KHMMT+4SJH5AFsSX+HhN5QhA1Ne0CNxMz+MnU+4S34ZN/sRtbmYb)V4SXw62ts7EaQYpRs5nN4vXeMMmqZUNtF7SAIFSrmKS+Z6t5m4SqMK2rsc42FRNDN4SXMDXhF7r+Q7mRZ3n3H55zF3Qo+MV6d621wAretWsIZUN)MRS1Ne0rmqQeE5EDQASNVqATs55a+YbDmSSXNDnTNZSrx45RmvSqmZ2YsRBzxMS6d6SAVhAaFU4+tFb)4WVDNUVeFWS1wMMT1xAWI4rS1RrMERt5+Rz3xMzzNZ3z+MnUd7s1wAretWsIZUN)mFS1Ne0rmqspQ5z/x6X3VqTEt6rZHMz6CDAWNKJamKtax45RmvSqmZ2Y1Rt9xMS6d6SAIxAtMZs2HvN2EUXRH9StFMspHMMDQv2Jt4rS1RrMERt5+RXJIMzzNZ3z+METxUMPHAmKs3NGH7NtF7SAIFSrZ5tytqz/x6X3VqTEt6r21Mz6CDAWNDnaF7r+Q7mRZ3n3HAVTF3Qo+MV6EG2WVh2tMZs2HvN2EUJPs3XtFMspHMMT+4SNVqATs55a+hs)14SXNDnTNZtnQ5rSxUMPHAmKs3NGQ3BTF7SAIFSrmKS+tFb)4WVDNUVitAS1wMMT1xAEN7ThF7r+Q7mRZ3n3H55zF3Qo+MV6d621wAretWsIZUN)MRS1Ne0rmqQeE6tU+43PHABRs3NMdRV4MKsJN3zzQKt++RNU+43PHABRsSJeCebD4SVDMStZtWS1wMz6V4SWI4re1KsqZA5RV5bqs3TEQc4Z+hNDFSSXNq4TNZSrxFb)xWsDM3TSsRrKw6NDFSSXx4rYsRtxFqzt+43PHUTatAXKZAAFZhXK4MctFxrItvV)Zv21VqATQc4ZZ9b/xUVK4ZmRtAX+NRNUF7SqVqAaMMNVQ5/RxU0qVSVEF6r2M3z6HhANwWNZmKS+xxN5ZSNDMSVeQDEaERN)dhXJN3zzNZ3z+METxAS3N5TMsSXZQhVGEWVqHUTeFWma+7N5ZSV1Ne0tM4XIQhV4Mqs1xxAt1KQaEqBqEAmPshVEsAMqQ9bDMqnNVqATsAMa+ht5+RXJIMzz4S3z+METxAS3N5TMsSXZQhVGEWVqHUTeFWmatFb)4WV3NUVEt6rZHMz6CD4WNDnaFGs+dRmDMqnJH5AFs3NIMDN4m4NDMStZMZmaNDNFV6SKIMzzNxMz+METxAS3N5TMsSXZQhVGEWVqHUTeFWmaFRNDmMnNFK4tFMsbHMMT+43PVKlKFWma49bDQqnq4ZNa1RtZZAA5VUTDM34yNZS1w4+T1xAWI4rtt5NI46tFMRXK+KlKs6ryQ3BqE5bqs3AEMMb1xMS6dvSAIxAt1KQaEqBqEAmPshVEsAMqQ9bDMqnNNWNysSXAFqz6CRAWNDnaFGs+dRmDMqnJH5AFs3NIMDN4m4NDMStZMZmaFc+TF7SxIFSrmKS+xxN5ZSNDMSVeQDEaERN)dhXJVW2Cs6t2ZAACZ4SXNDcTNZSrxFpREWVJVW2M1RtKZ6N4V6lPsSVEMMmqdhtFNMN1Ne0nmqspQ5/RxU0qVSVEF6r2Mht5ZSV34MAMsSXxMc5qE5bxtMzz4G3z+METxAS3N5TMsSXZQhVGEWVqHUTeFWmaFRNDmMnNFqXtFMsbHMMT+43PVKlKFWma49bDQqnq4ZNa1RtZZAA5VUTDM34MF3QoQMV6d621VcrosWtZZ5r)m4XDNUVosA4VxMStxUbRs3Tns6t1xMETx5sR4Z2ms5t1wM/RZSVqVqAGtWtbxMETx5sR4Z2msAz2Z54UF7SAxFSrmKS+NRs4EA2qx3AEN4S1wM4t1xAWI4r6scMaM6NwmMnAtMzzN43z+METx5sR4Z2msAz2ZA+TF7SAxFSrmKS+NRs4EA2qx3AE43t1wM4t1xAWI4r6scMaM6NwmMnxxMzzN43z+METx5sR4Z2msWmaVc5REUX1Ne0y4S3z+METx5sR4Z2msWma+hNDZY03NUctF4S+tFb)4UrqN3zaFGsxCDN5+SVDMStasRrIMcAtF7SAxYbTNZSrxFb5Q70RNWNEMMNyHhN4VU4NtMzzN43z+METx5sR4Z2msWmaQxNSF7SAxYbTNZSrxvmDV6X3mZlKsRtxQ45RMcSKs3Tit5mzxMStx6X3V3TZMZsMQhV4Z4SWI4BKQRr2Q6t5dSVqw5TEt5NqVqz6CDXxNDnTNZSrxvmDV6X3mZ2S1RtIMqz6CD4WNDnaFGsI+eb)d3nNVqAnsWmaxMz6CRAWNDnaFGsI+eb)d3nNVcV/sKtIZUN5sWs1Ne05NZ3z+METxWQPHUXZs3NyH7N)MRA1Ne05NZ3z+METxWsNVKNZM4XIQ7mRZ3nN4ZNZsD41wMz/ESVqH629sWs2M6NUFh21VDTZsUrIZUN4MDXRs7ctFMQP+MV6d621VDVeFWS1wMMT1xAWI4rYsRBzxMS6d6SAIxAtt6BaERs)s6zqs3ztF4S+ERsD4hJPVDTZsWS1Q5/R+D0q44ERsRBqtvt547VNM3TotWmaFDN4MKVqsSrCF3QotMV6d621VDVosA4ZVRs)VU4DNUVosA4VxMStxUV3VcERtAX++3zt+4S3HWlKsRrqHhNDx5n3N6mRMMmqQMz6CDAWNDnaFGsGdRN4MKsRHWNSsSJe+DmD4SVDNW4tF4SnN5MT1xAWI4rYt5NIHhmRMcVNMK2rQRryFRmqEAS1Ne05NZ3z+METxUX3N5TisWsZMcAZEUAKHUTCsWmatFbDZSV1NefzmqspQ5/R+D0q44ERsRBqtvtF4h2RH5TZMxrxZ54UF7SAIFSrmKS++7N5ZhzqVcVZM4EaFDN4MKVqsSrCs3b1xMS6d6SAIxAtt6BaERs)s6zqsSrEMMNyHhN4VU4N+DtCF3Qo+MV6d621VDVosA4ZVRs)VU4DMStasRrIMcA/43nxIMzzNZ3z+METxUX3N5TisWsZMcAZE5b344EKs6t+FRtCZ4SXNDnTNZSrxxN)EWVRH6Nis6t+ZAA5dhzq4ZNSMxV7N5z6CDAWNDnaFGsGdRN4MKsRHWNSsSXKMRs)Qe0KmZ26s6rMQvNDFSSXNqcrmqspQ5/R+D0q44ERsRBqtvtFQcVRH6EoQq5aFc5DxAEPHUctFMQP+MV6d621wAretWsIdDmqE5sR4Z2ms5t1wvEDxUVqN7AtMZs2HvN4EUXRshzZF3siVeb)d3bqN7AtMZsZw6QDZ3n344VYsRtbxMS61DAWNDnaF7rxM6sDZhAqsSrEsAMqw5z6CRAxNYSrmKS+49bDQqaPVqACs5t1wM/Rd7fPN5AaFGtqHhNDM4SWI4rM1RtKZUN4VWsKIMzzmc/c1MMT1xAWI4rM1RtKZA5RMDrRV7ctF4Snd3Svd6SAVhAaF7r++DmR46z3VcAtFxraxvtGE6JPVRNEM44eQSA5V5n3xMzzNxMz+METx5nDN5AtsAEa+vs4mMbqs34tF4VYtqz/x6X3VqTEt6r21Mz6CcXWNDnaF7r+Q7mRZ3n3HAVTF3Qo+34S1xAEN7ThF7r+Q7mRZ3n3H55zF3Qod34t1xAWI4rS1RrMERt5+Rz3xMzzmc/KHMMDQv2Jt4rS1RrMERt5+RXJIMzzN4zpHMMT+4SNVqATs55a+hs)14SXNq4TNZtnQ5rSxUMPHAmKs3NGQ3BTF7SAIFSrmKS+tFb)4WVDNUVitAS1wMMT1xAEN7ThF7r+Q7mRZ3n3H55zF3Qo+MV6d621wAretWsIZUN)MRS1Ne0rmqQeE5EDQASNVqATs55a+YbDmSSXNDnTNZSrx45RmvSqmZ2YsRBzxMS6d6SAVhAaFU4+tFb)4WVDNUVeFWS1wMMT1xAWI4rS1RrMERt5+Rz3xMzzNZ3z+MnUd7s1wAretWsIZUN)mFS1Ne0rmqspQ5z/x6X3VqTEt6rZHMz6CDAWNKJamKtax45RmvSqmZ2Y1Rt9xMS6d6SAIxAtMZs2HvN2EUXRH9StFMspHMMDQv2Jt4rS1RrMERt5+RXJIMzzNZ3z+METxUMPHAmKs3NGH7NtF7SAIFSrZWNnQ5/Rm4SqMK2TtAXIHhN/EcSXw5TSQRrVQ5/Rm4SqMK2rsc42FRmqE5bqHUAtF4S1d3zt+43PHABRsSX+McA5V6ADM3Tit6BqtMz6CD4WNDnaFGs2xvNZE6ANVcV/s5mqtMz6Cc3PVK2nsKS1Q5/Rmv234Z2FsSXxQFbDZSV1NRznMxBqMqETx6X3w5Tis3N+tvVDZSVqVK2S1qNVxM3Rs6X3VStZmKS+xxN5ZSNDMSVeQD41wvEDxUVqN7At1KQaEqBqEAmPshVEsAMqQ9bDEcSXNDnTNZSrxFpREWVJVW2M1RtKZ6N4V6lPsSVEt6BaERNUF7S1wAtn1RtIHYbSFh21VcrosWtZZ5r)m4XDN5TZtA4246tFx6X3VqTotWma+YbDmSSXNDcTNZSrxFpREWVJVW2M1RtKZ6N4V6lPsSVEMZs2HvN4EUXDNUVitAS1wM4U1xAWI4rtt5NI46tFMRXK+KlKs6ryQ3BqE5bqs3AE1qma+DN/d4SXNq4TNZSrxFpREWVJVW2M1RtKZ6N4V6lPsSVEMMmqdhtFNxT1Ne05mqspQ5/RxU0qVSVEF6r2Mht5ZSV34MAMsSXxMc5qE5bAx7ntFMsbHMMT+43PVKlKFWma49bDQqnq4ZNa1RtZZAA5VUTDM34SF3Qod3MT1xAWI4rtt5NI46tFMRXK+KlKs6ryQ3BqE5bqs3AEMMbAxMS6mhSAIxAt1KQaEqBqEAmPshVEsAMqQ9bDMqnNNWNysSXAQMz6CDTAxFSrmKS+xxN5ZSNDMSVeQDEaERN)dhXJVW2Cs6t2ZAACZ4SXNebTNZSrxFpREWVJVW2M1RtKZ6N4V6lPsSVEMMmqdhtFNMN1Ne0SmqspQ5/RxU0qVSVEF6r2Mht5ZSV34MAMsSXxMc5qE5bxtMzzN4zNHMMT+43PVKlKFWma49bDQqnq4ZNa1RtZZAA5VUTDM3MzF3QoQMV6d621VcrosWtZZ5r)m4XDN5TZtA4246tF4SVNVW2CFMt1w4+T1xAWI4rtt5NI46tFMRXK+K2Yt5NIMqz6CcSRVcVnQcMqtMzt+43PN6XosqNVxMStxWVqH6NeQRryQMzt+43PN6XosqNVdhtCV4SXNK4FmqspQ5/R4Y03NUXZNZN7tMz6CDTAIFSrmKS+NRs4EA2qx3AENx41wM4t1xAWI4r6scMaM6NwmMnxIMzzN43z+METx5sR4Z2msAz2ZAtUF7SAxFSrmKS+NRs4EA2qx3AE4SS1wM4wdvSAIxAt1qNedRs5V5nqwArot5t1w4tt1xAWI4r6scMaM6mqEUXqs3)ot5NbxMStxUMPHAN/s5t1Q5/R4Y03NUXZsSXxQ6s)ZSVNxMzzN4/PHMMT+43PN6XosqmqZAA5dhzq4ZNSMx41w4tU1xAWI4r6scMaM6mqE6A3tMzzN4/PHMMT+4SqVGNet55aERsD4hANVcVtQRtIH7N514SXx4retWtIMc5R46XK4MctmKS+ERV)mv2DNUTZsUrIZUN5sWs1Ne0Y4S3z+METxWVKH5AasSX+QhV4Z4SXNDcTNZSrxvmDV6X3mZ2S1RtIMRt5FSSXNDcTNZSrxvmDV6X3mZ2SsRrKCRV2EU0qVebtFMQctMV6d621VRNesqmqZUN4MDXRs7ctFMQP+MV6d621VRNSs6BqFRV4mvSqmZ2rs6BqM5z6CcS3N6mRFSSrxxN4VWsKmZ2asRrGHhETF7SxxGVTNZSrxxN)mFS1Ne0nmqspQ5/R+Rz3xMzzmcz1HMMT+4S3HWlKsRrqHhNDFSSXx4BKsRtxQYpRdSVqIMzaFGsGdRN4MKsRHWNSs3Nx+cAFZ703VW2CtA4ZERNDx5b1Ne0nmqspQ5/R+D0q44ERsRBqtvt5+D0q4MctF4S+NRVD4hA3N6AtmKS++7N5ZhzqVcVZM4EadRmRs5bqs7ctF4SnFqV6d621VDVosA4ZVRs)VU4DMGXGtWtxMRt5V4SXxvA5NZ3z+METxUX3N5TisWsZMcAZEUAKHUTCsWmaxMz6CqNAIFSrmKS++7N5ZhzqVcVZM4Ea+vV)d3bqVW2S1RtIMqz6CeSWNDnaFGsGdRN4MKsRHWNSsSXxQ6s)ZSVNwAtENMt1wMSU1xAWI4rYt5NIHhmRMcVNMK2CtA4ZERNDx5bDFqztF4Snd33T1xAWI4rYt5NIHhmRMcVNMK2CtA4ZERNDx5bDFq4tFMspHMMT+4S3HWlKsRrqHhNDx5nNNUTisAMqt4AGthA1Ne0MmqspQ5/R+D0q44ERsRBqtvtF4h2RH5TZMxrxZAtUF7SAIFSrmKS++7N5ZhzqVcVZM4EaFDN4MKVqsSrCs3pPxMS6d6SAIxAtt6BaERs)s6zqsSrEQqmqHhN5QhADNAtZtUrIMcAtF7Sxx7nTNZSrxxN)EWVRH6Nis6t+Z6V5V6zqN6XnsSXx+45RV6XqIMzz43spHMMT+4SNVqATsAMa+ht54Y03NUXZF3siQ4A/VAVWI4rS1RrMEDN5+RzJVqctFxrItvV)Zv21wAris5NeQvt5dhz3HAVnF3Qo+q3T1xAWI4rCsqNZQvV4VU4DN5TZsU41w4tU1xAWI4rM1RtKZ9pRmMbqN3zzFGs2QM/DZhXNVRVZQKS1Q5z/MRXK+K2as6rqQMz6CDXANDcTNZSrxMr)m4XDMSris5NeQMz6CqbAtFSrZ5trx4A5d70KNAVTsU41wMrSx5nDN5AtsAEa+vs4mMbqVW2TF3Qo+MV6d621MK2E1Rr+VRtFEYfPsStZMx41wvrFQASNVqATs55a+YbDmSSXNcATNZSrx45RmvSqmZ2YsRBzxMStQvAWNKJamKtax45RmvSqmZ2Y1Rt9xMS6d6SAIxAtMZs2HvN2EUXRH9StFMspHMMDQv2Jt4rS1RrMERt5+RXJIMzzNZ3z+METxUMPHAmKs3NGH7NtF7SAIFSrZ5tytqz/x6X3VqTEt6r21Mz6CDAWNDnaF7r+Q7mRZ3n3HAVTF3Qo+MV6EG2WVh2tMZs2HvN2EUJPs3XtFMspHMMT+4SNVqATs55a+hs)14SXNDnTNZtnQ5rSxUMPHAmKs3NGQ3BTF7SAIFSrmKS+tFb)4WVDNUVitAS1wMMT1xAEN7ThF7r+Q7mRZ3n3H55zF3Qo+MV6d621wAretWsIZUN)MRS1Ne0rmqQeE5EDQASNVqATs55a+YbDmSSXNDnTNZSrx45RmvSqmZ2YsRBzxMS6d6SAVhAaFU4+tFb)4WVDNUVeFWS1wMMT1xAWI4rS1RrMERt5+Rz3xMzzNZ3z+MnUd7s1wAretWsIZUN)mFS1Ne0rmqspQ5z/x6X3VqTEt6rZHMz6CDAWNKJas3trxFb)xWsDNANoQc4ZVqrUF7SKVSrGs5trxFb)xWsDMGJo1RtxMRtF4SV3IMzzF3QcxMETx6JPVRNEMZQqFRNDZ3nK44VYs6t1xMS6VvSAIxAt1Rr+VRtFZ74RH6V/s6t1xMStxAS3M3)oFSSrxFb)dh23MhVEM4XIQhV4Z4SXw5TSQRrVQ5/RmvSK44VE1Dr++RV4VWs3MSr6s5t1wvmRmv2NN5caFGs+dRmDMqnJH5AFF3siQ4A/VAVWI4rtt5NI46tFMRXK+KlKs6ryQ3rUF7SAIFSrmKS+xxN5ZSNDMSVeQDEaERN)dhXJVW2Yt5NIMqz6CcSNM3TeQc4ZNqzt+43PVKlKFWma49bDQqnq4ZNa1RtZZA5RmvSq4Z2Ys3NGQ3BTF7SAx34TNZSrxFpREWVJVW2M1RtKZ6N4V6lPsSVEMZs2HvN4EUXDNUVitAS1wM4t1xAWI4rtt5NI46tFMRXK+KlKs6ryQ3BqE5bqs3AE1qma+DN/d4SXNcATNZSrxFpREWVJVW2M1RtKZ6N4V6lPsSVEMMmqdhtFNxT1Ne0GmqspQ5/RxU0qVSVEF6r2Mht5ZSV34MAMsSXxMc5qE5bAx7ntFMsbHMMT+43PVKlKFWma49bDQqnq4ZNa1RtZZAA5VUTDM34SF3Qod34t1xAWI4rtt5NI46tFMRXK+KlKs6ryQ3BqE5bqs3AEMMbAxMS6ZvSAIxAt1KQaEqBqEAmPshVEsAMqQ9bDMqnNNWNysSXAQMz6CqbWNDnaFGs+dRmDMqnJH5AFs3NIMDN4m4NDMStZMZmaFctUF7SAx34TNZSrxFpREWVJVW2M1RtKZ6N4V6lPsSVEMMmqdhtFNMN1Ne0ymqspQ5/RxU0qVSVEF6r2Mht5ZSV34MAMsSXxMc5qE5bxtMzz47Mz+METxAS3N5TMsSXZQhVGEWVqHUTeFWmaFRNDmMnNFqXtFMsbHMMT+43PVKlKFWma49bDQqnq4ZNa1RtZZAA5VUTDM34MF3QoQMV6d621VcrosWtZZ5r)m4XDNUVosA4VxMStxUbRs3Tns6t1xMETx5sR4Z2ms5t1wM/RZSVqVqAGtWtbxMETx5sR4Z2msAz2Z54UF7SAxFSrmKS+NRs4EA2qx3AEN4S1wM4t1xAWI4r6scMaM6NwmMnAtMzzN43z+METx5sR4Z2msAz2ZA+TF7SAxFSrmKS+NRs4EA2qx3AE43t1wM4wd6SAIxAt1qNedRs5ZxTDFebtFMs1HMMT+43PN6XosqmqZ6N/xU03N3zzN4/PHMMT+43PN6XosqmqZUN)V6AR4ZlKF3Qox45RmvSqN5ctmKS+NRs4EA2qVW2CtA4ZERNDFSSXNK45mqspQ5/R4Y03NUXZsSXxQ6s)ZSVNw54tFMs1HMMT+43PN6XosqmqZ6V4tSSXNK45mqspQ5/RZ7EPHUTEsA4ZFREDx6/PwWNnsRBaHMz6Cc3PHUTns6t+HFbDZSV1xxAtsW+qQ7N2E62qH6Nns3maVRNtF7SWxYbrmqspQ5/RZ7EPHUTEMZs2QvNUF7SAxFSrmKS+ERV)mv2DMSreQcMqZ9btF7SxIFSrmKS+ERV)mv2DMSris5NeQvt5EWsqxMzz43spHMMT+4SqVqAmsWmaQ6s)+RzKIMzz43spHMMT+4SqwArZs6txQFb)4WVDMGXZs6raxMStxU0qVebtmKS+Q6N)s6ADNUTit6rZQMz6CDVXNYSrmKS++YbDmSSXNcATNZSrxxN)MRS1Ne0Y4S3z+METxUX3N5TisWsZMcAtF7S1VKlRsUrxMRETFh21VDVosA4ZVRs)VU4DNAtGM4XIdDmqE5b344EKs6t+Fqz6CDVWNDnaFGsGdRN4MKsRHWNSs3NGdRN4Z4SXx4rGtWsZVDNFxUX1xxAtt6BaERs)s6zqsSrEt5NqVcA5V6A1Ne0YNM+z+METxUX3N5TisWsZMcAZEUAKHUTCsWmaQ3z6CDXxNDnTNZSrxxN)EWVRH6Nis6t+ZA5DV62NNWNE1cS1w4t6d6SAIxAtt6BaERs)s6zqsSrEMZ+qQAA5V5nNVqAns5t1wM3T1xAWI4rYt5NIHhmRMcVNMK2CtA4ZERNDx5bDFK4tF4Snd34t1xAWI4rYt5NIHhmRMcVNMK2CtA4ZERNDx5bDFqztFMspHMMT+4S3HWlKsRrqHhNDx5nNNUTisAMqt4AGt3b1Ne0rmqspQ5/R+D0q44ERsRBqtvtF4h2RH5TZMxrxZA+TF7SAIFSrmKS++7N5ZhzqVcVZM4EaFDN4MKVqsSrCs3bVxMS6d6SAIxAtt6BaERs)s6zqsSrEMMNyHhN4VU4N+Dt5F3Qo+MV6d621VDVosA4ZVRs)VU4DMhVZsRrKCRV2E5sqHANns6t1xMS6ZxAWNDnaFGsGdRN4MKsRHWNSsSXKMRs)Qe0KmZ2CMZt+Meb)d4SXNebrmqspQ5z/x6X3VqTotWmaNRs4EA2qN3zzsWs2QAA5Zv21wAretWsIdDN)MDSqN3zzsWs2QAA5Zv21wAris5NeQvt5dhz3HAVnF3Qo+q3T1xAWI4rCsqNZQvV4VU4DN5TZsU41wM4wd6SAIxAtF6r2Mht5x6XNN5ctF4S+QhETEh5PsSr/s6tbxMETxAmPshVEtAMqVRETF7SWx3MzmqspQ5z/MRXK+K2SsRrKCRETF7Sx4qzTNZtnQ5z/4hSqH5AmsRrMw5z6H7s1MK2E1Rr+VRtFEYfPsStZs3mzxMS6d6SAIxAts7EaQYpRs5nN4vXeMMmqFqz6H7NJt4rS1RrMERt5+RXJIMzzNZ3z+METxUMPHAmKs3NGH7NtF7SAIFSrZ5tytqz/x6X3VqTEt6r21Mz6CDAWNDnaF7r+Q7mRZ3n3HAVTF3Qo+MV6EG2WVh2tMZs2HvN2EUJPs3XtFMspHMMT+4SNVqATs55a+hs)14SXNDnTNZtnQ5rSxUMPHAmKs3NGQ3BTF7SAIFSrmKS+tFb)4WVDNUVitAS1wMMT1xAEN7ThF7r+Q7mRZ3n3H55zF3Qo+MV6d621wAretWsIZUN)MRS1Ne0rmqQeE5EDQASNVqATs55a+YbDmSSXNDnTNZSrx45RmvSqmZ2YsRBzxMS6d6SAVhAaFU4+tFb)4WVDNUVeFWS1wMMT1xAWI4rS1RrMERt5+Rz3xMzzNZ3z+MnUd7s1wAretWsIZUN)mFS1Ne0rmqspQ5z/x6X3VqTEt6rZHMz6CDAWNKJamKtax45RmvSqmZ2Y1Rt9xMS6d6SAIxAtMZs2HvN2EUXRH9StFMspHMMDQv2Jt4rS1RrMERt5+RXJIMzzNZ3z+METxUMPHAmKs3NGH7NtF7SAIFSrZWNnQ5/Rm4SqMK2TtAXIHhN/EcSXw5TSQRrVQ5/Rm4SqMK2rsc42FRmqE5bqHUAtF4S1d3zt+43PHABRsSX+McA5V6ADM3Tit6BqtMz6CqbWNDnaFGs2xvNZE6ANVcV/s5mqtMz6CcS3HAVCMx41Q5/Rmv234Z2FsSXxQFbDZSV1NRznMxBqMqETx6X3w5Tis3N+tvVDZSVqVK2S1qNVxM3Rs6X3VStZmKS+xxN5ZSNDMSVeQD41wvEDxUVqN7At1KQaEqBqEAmPshVEsAMqQ9bDEcSXNDnTNZSrxFpREWVJVW2M1RtKZ6N4V6lPsSVEt6BaERNUF7S1wAtn1RtIHYbSFh21VcrosWtZZ5r)m4XDN5TZtA4246tFx6X3VqTotWma+YbDmSSXNebTNZSrxFpREWVJVW2M1RtKZ6N4V6lPsSVEMZs2HvN4EUXDNUVitAS1wM4t1xAWI4rtt5NI46tFMRXK+KlKs6ryQ3BqE5bqs3AE1qma+DN/d4SXNq4TNZSrxFpREWVJVW2M1RtKZ6N4V6lPsSVEMMmqdhtFNxT1Ne0nmqspQ5/RxU0qVSVEF6r2Mht5ZSV34MAMsSXxMc5qE5bAx7ntFMsbHMMT+43PVKlKFWma49bDQqnq4ZNa1RtZZAA5VUTDM34SF3QoQMV6d621VcrosWtZZ5r)m4XDN5TZtA4246tF4SVNVW2CNx41w4+T1xAWI4rtt5NI46tFMRXK+KlKs6ryQ3BqE5bqs3AEMMbbxMS6dvSAIxAt1KQaEqBqEAmPshVEsAMqQ9bDMqnNNWNysSXA+qz6CRAWNDnaFGs+dRmDMqnJH5AFs3NIMDN4m4NDMStZMZmaFcttF7SxIFSrmKS+xxN5ZSNDMSVeQDEaERN)dhXJVW2Cs6t2ZAACM4SXNDcTNZSrxFpREWVJVW2M1RtKZ6N4V6lPsSVEMMmqdhtFNFS1Ne0nmqspQ5/RxU0qVSVEF6r2Mht5ZSV34MAMsSXxMc5qE5bXN3zz4G3z+METxAS3N5TMsSXZQhVGEUX3N5TZF3Qox4AFZhXK44V6FSSrxFb5Q70RN5ctF4S+ERN)s6XKHUTnFSSrxFb5Q70RN5cys3pcxMS6FhSAIxAt1qNedRs5ZxTDFqztFMs1HMMT+43PN6XosqNVdhtCN4SXNK4rmqspQ5/R4Y03NUXZNZN7QMz6CD4WNDnaFGsxCDN5+SVAVUtGF3QotMV6d621Vc+ot5NYMqMqt3N1Ne0SmqspQ5/R4Y03NUXZs3NqtxN5Q4SXNK45mqspQ5/R4Y03NUXZs3NGMRV4Q70qIMzzF7r+Q7mRQcV1xxAt1qNedRs5V5nNNUTisAMqtMz6CDTxxFSrmKS+NRs4EA2qVW2CtA4ZERNDx5b1Ne0SmqspQ5/R4Y03NUXZsSXIdqz6CDTxxFSrmKS+ERV)mv2DN5TiM4XItvs)xUVK44VotAS1wM/Rmv2K4ZNStWs2QvNUFh21VqTG1RryZUN4VWsKmZ2osWQPxMStQMNAIFSrmKS+ERV)mv2DMSreQc4VxMS6FhSAIxAtsW+qQ7N2EUMPs3TZs3N1xMS6dvSAIxAtsW+qQ7N2EU4RH6EoQq5adRmR1cSXNebrmqspQ5/Rs6XRNWNEtA4Z+hsDd4SXNebrmqspQ5/RsU4qHWNCQc42HvN2EUAqHWNmF3QoxxN5sWs1xxAttAMqVRV2E62RHUViQKS1w4t6d6SAIxAtt6r21Mz6CRAWNDnaFGsGH7NtF7SAIFSrmKS++7N5ZhzqVcVZM4S1wM/RZhzNN5AttAMqEqzt+4S3HWlKsRrqHhNDx5aPMGNCQcMa+htF4h2RH5TZMxrAxMS6FhSAIxAtt6BaERs)s6zqsSrEt6BaERNUF7S1wWNTsRrqdc5RQ4SWI4rYt5NIHhmRMcVNMK2osWsqFRNDd4SXNDnTNZSrxxN)EWVRH6Nis6t+ZA5DV62NNWNE1qt1wMVw1DAWNDnaFGsGdRN4MKsRHWNSsSJe+DmD4SVDN5ztFMQP+MV6d621VDVosA4ZVRs)VU4DMGXGtWtxMRtFx6XK4MctFMs9HMMT+4S3HWlKsRrqHhNDx5nNNUTisAMqt4AGt7T1Ne0rmqspQ5/R+D0q44ERsRBqtvtF4h2RH5TZMxrxZ54tF7SAIFSrmKS++7N5ZhzqVcVZM4EaFDN4MKVqsSrCs3bAxMS6d6SAIxAtt6BaERs)s6zqsSrEMMNyHhN4VU4N+DtnF3Qo+MV6d621VDVosA4ZVRs)VU4DMStasRrIMcA/43nxN3zzNZ3z+METxUX3N5TisWsZMcAZE5b344EKs6t+FRtC1cSXNDnTNZSrxxN)EWVRH6Nis6t+Z6V5V6zqN6Xns3NxMDN/ZSVNxMzz4SzpHMMT+4S3HWlKsRrqHhNDx5nKNWNis5NeQvtF47ANVKNesWS1w4t6d6SAIxAtMZs2HvN4EUXDNA+ot5NYMqz6HGQPHUTCs5trx45RmvSq4Z2YsRtiMqz6HhANwWNZmKS+tvs)Qe0KmZ2asRrGHhETF7SxNDnTNZSrx4A5+hzKV3TZM4EaERN)M4SXNDcGmqspQ5z/MRXK+K2t1RtxMqz6Cc3Ps7c9Qc42tvN5V6A1xxAtF6r2Mht5dSVqwUctFMspHMMT+4SJH5AFsSX+HhN5QhA1Ne0rmqQeE5ETx5bK4MATsA4ZHvNSF7SJt4rEs3N2xvNZEUAR4MACsWmaHMz6CD4WNDnaFSEaZ9b)xWsDMGJo1RtxMcASF7S)Mh2tMZs2HvN2EUJPs3XtFMQctMV6d621wAretWsIZUN)MRS1Ne0Y4S3z+MnUd7s1wAretWsIZUN)mFS1Ne0SmqspQ5z/x6X3VqTEt6rZHMz6CDXAxFSrZ5tytqz/x6X3VqTEt6r21Mz6CDAWNDnaF7r+Q7mRZ3n3HAVTF3Qo+MV6EG2WVh2tMZs2HvN2EUJPs3XtFMspHMMT+4SNVqATs55a+hs)14SXNDnTNZtnQ5rSxUMPHAmKs3NGQ3BTF7SAIFSrmKS+tFb)4WVDNUVitAS1wMMT1xAEN7ThF7r+Q7mRZ3n3H55zF3Qo+MV6d621wAretWsIZUN)MRS1Ne0rmqQeE5EDQASNVqATs55a+YbDmSSXNDnTNZSrx45RmvSqmZ2YsRBzxMS6d6SAVhAaFU4+tFb)4WVDNUVeFWS1wMMT1xAWI4rS1RrMERt5+Rz3xMzzNZ3z+MnUd7s1wAretWsIZUN)mFS1Ne0rmqspQ5z/x6X3VqTEt6rZHMz6CDAWNKJamKtax45RmvSqmZ2Y1Rt9xMS6d6SAIxAtMZs2HvN2EUXRH9StFMspHMMD+RVWI4re1KsqZUmRE6ARH6NMF3siQ4A/VAVWI4re1KsqZAA4QhXNNWNEMMmqQ5z6CcSAN3zaFGs2xvNZEU4qsStZQq5aQvs)+cVNxMzzN43z+METx6JPVRNEQKt+HhN5QcVNxMzzFGsGHSAFN4SWI4retA4ydRVGE5bK4MAns5t1wvEDxUVqN7At1RrMQvQqEASNwWNns6rqdc5R4SV1NR/R1RryFRNU+43PVKlKFWma49bDM4SXw5TSQRrVQ5/RxU0qVSVEF6r2Mht5ZSV34MAMF3Qod3V6d621VcrosWtZZ5r)m4XDN5TZtA4246t5+D0q4MctF4S+FRNDmxVqHAN6s5t1Q5/RxU0qVSVEF6r2Mht5ZSV34MAMsSX+Q7mRZ703VW2Y1Rt9xMS6NvSAIxAt1KQaEqBqEAmPshVEsAMqQ9bDMqnNVqATsAMa+ht5+Rz3xMzzNM+z+METxAS3N5TMsSXZQhVGEWVqHUTeFWmaFRNDmMaPNW2GtUrbxMS6ZvSAIxAt1KQaEqBqEAmPshVEsAMqQ9bDMqnNNWNysSXAd3z6CRAWNDnaFGs+dRmDMqnJH5AFs3NIMDN4m4NDMStZMZmaFq4wdASXNDcTNZSrxFpREWVJVW2M1RtKZ6N4V6lPsSVEMMmqdhtFNx41Ne0yNM+z+METxAS3N5TMsSXZQhVGEWVqHUTeFWmaFRNDmMnNFq4tFMQcHMMT+43PVKlKFWma49bDQqnq4ZNa1RtZZAA5VUTDM34nF3Qod3MT1xAWI4rtt5NI46tFMRXK+KlKs6ryQ3BqE5bqs3AEMMbVxMS61RSAIxAt1KQaEqBqEAmPshVEsAMqQ9bDMqnNNWNysSXAN5z6CRAWNDnaFGs+dRmDMqnJH5AFs3NIMDN4m4NDMStZMZmaFctSF7SxIFSrmKS+xxN5ZSNDMSVeQDEaERN)dhXJVW2Cs6t2ZAACmSSXNDcTNZSrxFpREWVJVW2M1RtKZ6N4V6lPsSVEMMmqdhtFN4N1Ne0nmqspQ5/RxU0qVSVEF6r2Mht5+D0q4MctF4S+wRsDZhAqs3ztmKS+NRs4EA2qN3zzFGsIMRmRmxV3V7ctmKS+NRs4EA2qx3AENMt1wM4t1xAWI4r6scMaM6NwmMnAxMzzN43z+METx5sR4Z2msAz2Z54SF7SAxFSrmKS+NRs4EA2qx3AE4GS1wM4t1xAWI4r6scMaM6NwmMnxN3zzN43z+METx5sR4Z2msAz2ZAttF7SAxFSrmKS+NRs4EA2qVWlRMZQa+3z6CDTxxFSrmKS+NRs4EA2qVW2Ys6tICDN5d4SXx4rS1RrMw6NUFh21Vc+ot5NYMRtF4h2RH5TZM4S1wM4w1RSAIxAt1qNedRs5V5nNNUTisAMqt4ASF7SAxFSrmKS+NRs4EA2qVW2ntU41wM4w1RSAIxAtsW+qQ7N2EWVRsStnMZsZxvVDZhz3N9StF4S+Q7mDZSVNVcNeQc4VxMETxWVKH5Aas3NyMRN/Z3n3N6mRF3Qo+St6d6SAIxAtsW+qQ7N2EUMPs3TZF3QotMV6d621VqTG1RryZA5RmvAqVW2tF3QoQMV6d621VqTG1RryZA5RMDrRV3TEt5NqVqz6CqNAIFSrmKS+Veb)+SVDNUTit6rZQMz6CqNAIFSrmKS+Vc5RVAVNM3TetWsIZAA4VAVRtMzzFGQaVRNtFh21VDTZsUrIZUN4MDXRs7ctFMsV45V6d621VDVeFWS1wMMT1xAWI4rYsRBzxMS6d6SAIxAtt6BaERs)s6zqs3ztF4S+NRN)46Aqs3ztmKS++7N5ZhzqVcVZM4EaNRVD4hA3NUVEMMNyHhN4VU4NtMzzN43z+METxUX3N5TisWsZMcAZEUX3N5TZF3QoxvV)46zqVK2St5t1Q5/R+D0q44ERsRBqtvt5EWsqwAtZQKS1wM4U1xAWI4rYt5NIHhmRMcVNMK2rQRryFRmqE6X1Ne0Y43spHMMT+4S3HWlKsRrqHhNDx5nNVGNaMMmqZ9btF7SxNDnTNZSrxxN)EWVRH6Nis6t+ZA5DV62NNWNEMZs2QvNUF7SXIFSrmKS++7N5ZhzqVcVZM4EaFDN4MKVqsSrCs3pcxMS6NvSAIxAtt6BaERs)s6zqsSrEMMNyHhN4VU4N+DtSF3Qo+34S1xAWI4rYt5NIHhmRMcVNMK2CtA4ZERNDx5bDFq4tFMspHMMT+4S3HWlKsRrqHhNDx5nNNUTisAMqt4AGthA1Ne0rmqspQ5/R+D0q44ERsRBqtvtF4h2RH5TZMxrxZAtUF7SAIFSrmKS++7N5ZhzqVcVZM4EaFDN4MKVqsSrCs3pPxMS6d6SAIxAtt6BaERs)s6zqsSrEQqmqHhN5QhADNAtZtUrIMcAtF7Sxx7nTNZSrxxN)EWVRH6Nis6t+Z6V5V6zqN6XnsSXx+45RV6XqIMzz43spHMMT+4SNVqATsAMa+ht54Y03NUXZF3siVeb)d3bqN7AtMZs2HvN4EUXRshzZF3siVeb)d3bqN7AtMZsZw6QDZ3n344VYsRtbxMS6ZFSWNDnaF7rxM6sDZhAqsSrEsAMqw5z6CD4WNDnaF7rZQhVGEA3PsStZF3QoxFbDdMXK4MASs5mqQMzt+4SJH5AFs3NyMRN/d4SXxvASNM+z+METxAmPshVEMZsZw6QDd4SXNq45mqQeE5nbjZqYC9XGdDT7wxQYIYXJt4rEs3N+H7mRZ3b1NRz3s3trxvtGE6z3VqTEM4XIQhV4Z4SXw62t1KsNxMSZQUAWNDnaNZ3z+MVvd6SAIxASN4spHM42Qv21VcraQRt1xM3Rs6X3VStZmKS+NDN5d3nq4MAEt5mzxMSZQUTxFqcTNZSrdStCZvSAIxAyF4spHMMT+x4xx3cTNMAnQ5/R4703mZlKt6rKZUN514SXMR2y43bVHMMT+xTxFqcTNZSrd3Svd6SAIxAS4SzVHM42Qv21Vctot55aERV2EU0qVebtF4VatM4vd6SAIx5zNZ3z+MVvm7AWNDnaNMsV+qV6EhVWI4r6t5NyZ6mDZ3n3N9StF4VadStCZvSAIxAy43bVHMMT+xTX4DnTNZSrt4twZvSAmvAaFGsxdDN2EWsqmZ2otAS1wvrCV4XxNYSrmcQcMStU1xAW4KMzNZ3z+MVvF7VxNYSrs3trxFb5E62DN6NCs3maHMz6H7NAxSAGmqspQ54wMxVWNDnaN4z9+MV6d62ANqcGmqQeQqETx5s3NUTEsKtxZUN514SXMR2y43bVHMMT+xTxFqcTNZSrd3Svd6SAIxAS4SzVHM42Qv21Vctot55aQ9bGEA3PHUctF4VatM4vd6SAIx5zNZ3z+MVvm7AWNDnaNMsV+qV6EhVWI4r6t5NyZUN443n3N9StF4VadStCZvSAIxAy43bVHMMT+xTX4DnTNZSrt4twZvSAmvAaFGsxdDN2EUARHAN/s3maHMz6H7NAxSAGmqspQ54wMxVWNDnaN4z9+MV6d62ANqcGmqQeQqETxAV3VqAttAMqEqz6HGQPHUTCs5trxvmRE6SKIMzzFGsZHvV4VU41xxAtMMmqQ6N)4hAqHUctF4VaxvN4EUEPVDTZFGtIQS5TFh21VRXisA4VmSA5Q70KV34tmKS+Vc5RVAVNM3TetWsIH7mRM4SWI4BR1RrYMqz4Z7EPN62tmKS++hs)1MXq4MAY1RrKMqzt+4Sq4Z2St6r2HvETEhXRHUVttAXbxMETx6lPtMzaF7BeH7mRM4SDshAaFSEaZ6V4QSV3HWNE1qt1wM46ZxVWNDnaFSEaZ6V4QSV3HWNE1cS1wM46ZxAWNDnaFSEaZ6V4QSV3HWNEsU41wM46ZxAWNDnaFSEaZ6V4QSV3HWNEM4S1wM46ZxAWNDnaFSEaZ6V4QSV3HWNEMMNeQS5RV5n34Z2/tU41wvEDxUVqN7At1RrMQvs)mvz3N3zzFU4+Q7mRQR2qs34tFxraxFb/V6z34MTZM4S1wMrSx6XRs3ztFxraxFb)xWsDNANoQc4ZVqrUF7SKVSrGs5trxFb)xWsDMGJo1RtxMRtF4SV3IMzzF3QcxMETx6JPVRNEM44eQSA5V5b1NRz3FU4+tFb)4WVDNUVeFWS1w4tS1xAWI4rS1RrMERt5+Rz3xMzz4G3z+MnUd7s1wAretWsIZUN)mFS1Ne0rmqspQ5z/x6X3VqTEt6rZHMz6CDAWNKJamKtax45RmvSqmZ2Y1Rt9xMS6d6SAIxAtMZs2HvN2EUXRH9StFMspHMMDQv2Jt4rS1RrMERt5+RXJIMzzNZ3z+METxUMPHAmKs3NGH7NtF7SAIFSrZ5tytqz/x6X3VqTEt6r21Mz6CDAWNDnaF7r+Q7mRZ3n3HAVTF3Qo+MV6EG2WVh2tMZs2HvN2EUJPs3XtFMspHMMT+4SNVqATs55a+hs)14SXNDnTNZtnQ5rSxUMPHAmKs3NGQ3BTF7SAIFSrmKS+tFb)4WVDNUVitAS1wMMT1xAEN7ThF7r+Q7mRZ3n3H55zF3Qo+MV6d621wAretWsIZUN)MRS1Ne0rmqQeE5EDQASNVqATs55a+YbDmSSXNDnTNZSrx45RmvSqmZ2YsRBzxMS6d6SAVhAaFU4+tFb)4WVDNUVeFWS1wMMT1xAWI4rS1RrMERt5+Rz3xMzzNZ3z+MaqQv21VqAtsAEatvND4SVKmZ2nsRrGMcAtF7SAxFSrmKS+QYpRs5nKVSris5NKMcAtF7S1VcroQc49xMETx6X34xToQDEaFRV4mvAqN3zzQKt++RNU+43PHANnsKmax4A/V6AqH6NoMZsxMqz6HhANwWNZmKS+xxN5ZSNDMSVeQD41wvEDxUVqN7At1KQaEqBqEAmPshVEsAMqQ9bDEcSXNDnTNZSrxFpREWVJVW2M1RtKZ6N4V6lPsSVEt6BaERNUF7S1wAtn1RtIHYbSFh21VcrosWtZZ5r)m4XDN5TZtA4246tFx6X3VqTotWma+YbDmSSXNqcTNZSrxFpREWVJVW2M1RtKZ6N4V6lPsSVEMZs2HvN4EUXDNUVitAS1wM4t1xAWI4rtt5NI46tFMRXK+KlKs6ryQ3BqE5bqs3AE1qma+DN/d4SXNqXTNZSrxFpREWVJVW2M1RtKZ6N4V6lPsSVEMMmqdhtFNxT1Ne0yNZ3z+METxAS3N5TMsSXZQhVGEWVqHUTeFWmaFRNDmMnNFK4rF3QoQMV6d621VcrosWtZZ5r)m4XDN5TZtA4246tF4SVNVW2CN4S1w4tt1xAWI4rtt5NI46tFMRXK+KlKs6ryQ3BqE5bqs3AEMMbAxMS6NvSAIxAt1KQaEqBqEAmPshVEsAMqQ9bDMqnNNWNysSXAQMz6CcNWNDnaFGs+dRmDMqnJH5AFs3NIMDN4m4NDMStZMZmaFctUF7SXIFSrmKS+xxN5ZSNDMSVeQDEaERN)dhXJVW2Cs6t2ZAAC1cSXNqzTNZSrxFpREWVJVW2M1RtKZ6N4V6lPsSVEMMmqdhtFN4X1Ne0yNxMz+METxAS3N5TMsSXZQhVGEWVqHUTeFWmaFRNDmMnNFqXtFMsVHMMT+43PVKlKFWma49bDQqnq4ZNa1RtZZAA5VUTDM34MF3QoQMV6d621VcrosWtZZ5r)m4XDN5TZtA4246tF4SVNVW2CtA4ZERNDx5b1NRz3N4zpHMMT+MNWNDnaNxMz+MVvERSAIx5zmqspQ54t1xAW4K4CmqspQAtU1xAW4DcTNZSrQMV6EhVWI4rtt5NI46tFMRXK+K2Yt5NIMqz6CcSRVcVnQcMqtMzt+43PN6XosqNVxMStxWVqH6NeQRryQMzt+43PN6XosqNVdhtCV4SXNqzTNZSrxFb5Q70RN5cys3b1xMS6VxAWNDnaFGsxCDN5+SVAVUtCF3QotMV6d621Vc+ot5NYMqMqthA1Ne0SmqspQ5/R4Y03NUXZNZN7+qz6CD4WNDnaFGsxCDN5+SVAVUt5F3QotMV6d621Vc+ot5NYMRt5sU43N6AtFMQcN5V6d621Vc+ot5NYMRt5+cVK4vXosWS1wMz/x6X3VRVZFSSrxFb5Q70RNWNEMMNyHhN4VU41Ne0y4S3z+METx5sR4Z2msWmaFDN4MKVqsSrCF3QotMV6d621Vc+ot5NYMRtFZ701Ne0y4S3z+METxWVKH5Aas3NIHSAFZ74RHArGQc4ZdDNtF7S1VqAaQcMqtxmRmvAqN3zaFGsI+eb)d3n34ZmRQq5adRmR1cSXxvA5NZ3z+METxWVKH5AasSX+QhV4Z4SXNqzTNZSrxvmDV6X3mZ2S1RtIMRt5FSSXNDcTNZSrxvmDV6X3mZ2SsRrKCRV2EU0qVebtFMQP+MV6d621VRNesqmqZUN4MDXRs7ctFMQP+MV6d621VRNSs6BqFRV4mvSqmZ2rs6BqM5z6CcS3N6mRFSSrxxN4VWsKmZ2asRrGHhETF7Sxx3XTNZSrxxN)mFS1Ne0rmqspQ5/R+Rz3xMzzNZ3z+METxUX3N5TisWsZMcAtF7S1VqTiMMN2xxN4VWV1xxAtt6BaERs)s6zqsSrE1cJqFRV4EUXDMStasRrIMcA/N4SXNqzTNZSrxxN)EWVRH6Nis6t+ZUN)EWVqN3zzF7BqHvs)sU0NVRAtmKS++7N5ZhzqVcVZM4EadRmRs5bqs7ctFMspHMMT+4S3HWlKsRrqHhNDx5nNVGNaMMmqZ9bUF7SWxYbrmqspQ5/R+D0q44ERsRBqtvtFE7V3VStZs3N1xMS61DAWNDnaFGsGdRN4MKsRHWNSsSJe+DmD4SVDMSreQc4VxMS6mhSAIxAtt6BaERs)s6zqsSrEMMNyHhN4VU4N+DtyF3Qo+MV6d621VDVosA4ZVRs)VU4DMStasRrIMcA/43nAxMzzNZ3z+METxUX3N5TisWsZMcAZE5b344EKs6t+FRtCN4SXNDnTNZSrxxN)EWVRH6Nis6t+ZAA5dhzq4ZNSMxV7QMz6CDAWNDnaFGsGdRN4MKsRHWNSsSXxQ6s)ZSVNwAtE43t1wMMT1xAWI4rYt5NIHhmRMcVNMK2CtA4ZERNDx5bDFebtFMspHMMT+4S3HWlKsRrqHhNDx5nKNWNis5NeQvt54SV3w5TZM4S1w4twd6SAIxAtt6BaERs)s6zqsSrEQqmqHhN5QhADMStrMZQqQhmTF7SxNDnTNZSrx45RmvSq4Z2Ys3NxCDN5+SV1NR/R1RryFRNU+4SNVqATsAMa+hsDHSV1NR/R1RryFRNU+4SNVcV/sKtIZUN4MDXRs7ctFMsV45V6d621wAtmsRtIQvNDx5nq4ZN/F3QoQ4tU1xAWI4rM1RtKZ9pRmMbqN3zzFGs2QM/DZhXNVRVZQKS1Q5z/MRXK+K2as6rqQMz6CDXANK4TNZSrxMr)m4XDMSris5NeQMz6CqbAIFSrZ5trxFb)MD4144tStAJqNRs4MRSqtMzzFU4+QYpRs5n3VK2nsRrq45z6HhANwWNZmKS+QYpRs5nN4vXeMMmqZAA5V621Ne0tNMt1Q5/Rm4SqMK2rsc42FRNDN4SXMDXhF7r+Q7mRZ3n3H55zF3QoM3V6d621wAretWsIZUN)MRS1Ne0YNxMz+MnUd7s1wAretWsIZUN)mFS1Ne0YN4zNHMMT+4SNVqATs55a+hs)14SXNK45mqQeE5EDQASNVqATs55a+YbDmSSXNK4rmqspQ5z/x6X3VqTEt6rZHMz6CDXxtFSrZ5tytqz/x6X3VqTEt6r21Mz6CDAWNDnaF7r+Q7mRZ3n3HAVTF3Qo+MV6EG2WVh2tMZs2HvN2EUJPs3XtFMspHMMT+4SNVqATs55a+hs)14SXNDnTNZtnQ5rSxUMPHAmKs3NGQ3BTF7SAIFSrmKS+tFb)4WVDNUVitAS1wMMT1xAEN7ThF7r+Q7mRZ3n3H55zF3Qo+MV6d621wAretWsIZUN)MRS1Ne0rmqQeE5EDQASNVqATs55a+YbDmSSXNDnTNZSrx45RmvSqmZ2YsRBzxMS6d6SAVhAaFU4+tFb)4WVDNUVeFWS1wMMT1xAWI4rS1RrMERt5+Rz3xMzzNZ3z+MnUd7s1wAretWsIZUN)mFS1Ne0rmqspQ5z/x6X3VqTEt6rZHMz6CDAWNKJas3trxFb)xWsDMSrZMMmqQvtFZhz3HWNSF3QoQMV6d621VqAtsAEaQ45RMDrqNWNSF3QoxFpRE6ARIMzaFGs2QUN4EAXDMStn1RtIMqz6HhANwWNZmKS+Q7N/ZhzDNArSQRtIMRmREUMPN5ctFZsqQ7mD4SVWI4rtt5NI46tFMRXKtMzzQKt++RNU+43PVKlKFWma49bDQqnq4ZNa1R+KxMS6d6SAIxAt1KQaEqBqEAmPshVEsAMqQ9bDMqn3HWlKs5t1wMz/4h5Ps3Ti1D41Q5/RxU0qVSVEF6r2Mht5ZSV34MAMsSX+Q7mRZ703VW2Y1Rt9xMS6mhSAIxAt1KQaEqBqEAmPshVEsAMqQ9bDMqnNVqATsAMa+ht5+Rz3xMzzN43z+METxAS3N5TMsSXZQhVGEWVqHUTeFWmaFRNDmMaPNW2GtUrbxMS6MvSAIxAt1KQaEqBqEAmPshVEsAMqQ9bDMqnNNWNysSXAd3z6CqbWNDnaFGs+dRmDMqnJH5AFs3NIMDN4m4NDMStZMZmaFq4wdASXNDnTNZSrxFpREWVJVW2M1RtKZ6N4V6lPsSVEMMmqdhtFNx41Ne05mqspQ5/RxU0qVSVEF6r2Mht5ZSV34MAMsSXxMc5qE5bAtMzzN4/PHMMT+43PVKlKFWma49bDQqnq4ZNa1RtZZAA5VUTDM34nF3QoN5V6d621VcrosWtZZ5r)m4XDN5TZtA4246tF4SVNVW2C43t1wM4t1xAWI4rtt5NI46tFMRXK+KlKs6ryQ3BqE5bqs3AEMMpPxMS6ZvSAIxAt1KQaEqBqEAmPshVEsAMqQ9bDMqnNNWNysSXAM3z6CDTANYSrmKS+xxN5ZSNDMSVeQDEaERN)dhXJVW2Cs6t2ZAACmSSXNK45mqspQ5/RxU0qVSVEF6r2Mht5ZSV34MAMsSXxMc5qE5bXN3zz47Mz+METxAS3N5TMsSXZQhVGEWVqHUTeFWmaFRNDmMnNNUTisAMqt4ASF7S)Fq4TNZSrN5V6d62AxYbTNZSrN5V6d62AxFSrmcsVHMMT+xTANYSrmcQcN5V6d62xtFSrmcspHM42Qv21VcrosWtZZ5r)m4XDNUVosA4VxMStxUbRs3Tns6t1xMETx5sR4Z2ms5t1wM/RZSVqVqAGtWtbxMETx5sR4Z2msAz2Z54UF7SAx7nTNZSrxFb5Q70RN5cys3b1xMS6FhSAIxAt1qNedRs5ZxTDFq4tFMs1HMMT+43PN6XosqNVdhtCd4SXNqzTNZSrxFb5Q70RN5cys3bVxMS6FhSAIxAt1qNedRs5ZxTDFebtFMs1HMMT+43PN6XosqmqZ6N/xU03N3zzN4zVHMMT+43PN6XosqmqZUN)V6AR4ZlKF3Qox45RmvSqN5ctmKS+NRs4EA2qVW2CtA4ZERNDFSSXNK4GmqspQ5/R4Y03NUXZsSXxQ6s)ZSVNw54tFMsbHMMT+43PN6XosqmqZ6V4tSSXNqzSmqspQ5/RZ7EPHUTEsA4ZFREDx6/PwWNnsRBaHMz6CcSNVqATsAMa+3zt+4SqVGNet55aQ6N)s6ADNWlRsAS1wMVwVvSAIxAtsW+qQ7N2EUMPs3TZF3QotMV6d621VqTG1RryZA5RmvAqVW2tF3QoQMV6d621VqTG1RryZA5RMDrRV3TEt5NqVqz6CDVWNDnaFGsqQhs5V5n344VYsRtbxMS61DAWNDnaFGsqtvN)V5bK4MATs55a+vN)VA21Ne0tt5NqVqzt+4S34ZmRQq5aQ6s)+RzKIMzz4Sz9HMMT+4S3H55zF3Qot4+T1xAWI4rYsRBzxMS6d6SAIxAtt6BaERs)s6zqs3ztF4S+dRmRs5bqs7ctmKS++7N5ZhzqVcVZM4EaNRVD4hA3NUVEMMNyHhN4VU4NtMzz4S3z+METxUX3N5TisWsZMcAZEUX3N5TZF3QoxvV5V6zqN6Xns6rbxMETxUX3N5TisWsZMcAZEU0qVRNCs6tbxMS6VvSAIxAtt6BaERs)s6zqsSrEMZ+qQAA5V5aPN3zzmc/P+MV6d621VDVosA4ZVRs)VU4DMGXGtWtxMRt5FSSXNebrmqspQ5/R+D0q44ERsRBqtvtFE7V3VStZsSX+QhV4Z4SXNqXTNZSrxxN)EWVRH6Nis6t+ZAA5dhzq4ZNSMxV7d3z6CDXANYSrmKS++7N5ZhzqVcVZM4EaFDN4MKVqsSrCs3b1xMS6FhSAIxAtt6BaERs)s6zqsSrEMMNyHhN4VU4N+DtCF3Qo+34U1xAWI4rYt5NIHhmRMcVNMK2CtA4ZERNDx5bDFDctFMsAHMMT+4S3HWlKsRrqHhNDx5nNNUTisAMqt4AGt7V1Ne0YNM+z+METxUX3N5TisWsZMcAZE5b344EKs6t+FRtC1cSXxvAnmqspQ5/R+D0q44ERsRBqtvtFQcVRH6EoQq5aNRN)46Aqs3ztFMsV+MV6d621VDVosA4ZVRs)VU4DMhVZsRrKCRV2E5bNVSrZ1RrbxMS61DAWNDnaF7r+Q7mRZ703VW26scMaM6NUF7SqVqAaMMNVQ5z/x6X3VqTot6rZwvNUF7SqVqAaMMNVQ5z/x6zqN6Xns3NyH7N)MRA1Ne0GFM+z+METx5bRNAVnQcMqtvt5ZSVqtMzz43+z+METxAmPshVE1Ks2FRNUF7S1VqAnFGtIQS5RQcVKIMzaF7rZQhVGE62qH6NnF3Qo+3461RSAIxAtF6r2MhtFx6zqN6XnF3QoFctS1xAEN7At1cX+dRV)4Y0RHAN/F3sitq/Rm4SqMK2TtAXIHhN/EcSXw5TSQRrVQ5/Rm4SqMK2rsc42FRmqE5bqHUAtF4S1d3zt+43PHABRsSJeCebD4SVNtMzzHAXax45RmvSqmZ2Y1Rt9xMS6d6SAIxAtMZs2HvN2EUXRH9StFMspHMMDQv2Jt4rS1RrMERt5+RXJIMzzNZ3z+METxUMPHAmKs3NGH7NtF7SAIFSrZ5tytqz/x6X3VqTEt6r21Mz6CDAWNDnaF7r+Q7mRZ3n3HAVTF3Qo+MV6EG2WVh2tMZs2HvN2EUJPs3XtFMspHMMT+4SNVqATs55a+hs)14SXNDnTNZtnQ5rSxUMPHAmKs3NGQ3BTF7SAIFSrmKS+tFb)4WVDNUVitAS1wMMT1xAEN7ThF7r+Q7mRZ3n3H55zF3Qo+MV6d621wAretWsIZUN)MRS1Ne0rmqQeE5EDQASNVqATs55a+YbDmSSXNDnTNZSrx45RmvSqmZ2YsRBzxMS6d6SAVhAaFU4+tFb)4WVDNUVeFWS1wMMT1xAWI4rS1RrMERt5+Rz3xMzzNZ3z+MnUd7s1wAretWsIZUN)mFS1Ne0rmqspQ5z/x6X3VqTEt6rZHMz6CDAWNKJamKtax45RmvSqmZ2Y1Rt9xMS6d6SAIxAtMZs2HvN2EUXRH9StFMspHMMD+RVWI4re1KsqZA5RV5bqs3TEQc4Z+hNDFSSXNq4TNZSrxFb)xWsDM3TSsRrKw6NDFSSXx4rYsRtxFqzt+43PHUTatAXKZAAFZhXK4MctFxrItvV)Zv21VqATQc4ZZ9b/xUVK4ZmRtAX+NRNUF7SqVqAaMMNVQ5/RxU0qVSVEF6r2M3z6HhANwWNZmKS+xxN5ZSNDMSVeQDEaERN)dhXJN3zzNZ3z+METxAS3N5TMsSXZQhVGEWVqHUTeFWma+7N5ZSV1Ne0tM4XIQhV4Mqs1xxAt1KQaEqBqEAmPshVEsAMqQ9bDMqnNVqATsAMa+ht5+RXJIMzz4S3z+METxAS3N5TMsSXZQhVGEWVqHUTeFWmatFb)4WV3NUVEt6rZHMz6CD4WNDnaFGs+dRmDMqnJH5AFs3NIMDN4m4NDMStZMZmaNDNFV6SKIMzzNxMz+METxAS3N5TMsSXZQhVGEWVqHUTeFWmaFRNDmMnNFK4tFMsbHMMT+43PVKlKFWma49bDQqnq4ZNa1RtZZAA5VUTDM34yNZS1w4+T1xAWI4rtt5NI46tFMRXK+KlKs6ryQ3BqE5bqs3AEMMb1xMS6dvSAIxAt1KQaEqBqEAmPshVEsAMqQ9bDMqnNNWNysSXAFqz6CRAWNDnaFGs+dRmDMqnJH5AFs3NIMDN4m4NDMStZMZmaFc+TF7SxIFSrmKS+xxN5ZSNDMSVeQDEaERN)dhXJVW2Cs6t2ZAACZ4SXNDcTNZSrxFpREWVJVW2M1RtKZ6N4V6lPsSVEMMmqdhtFNMN1Ne0nmqspQ5/RxU0qVSVEF6r2Mht5ZSV34MAMsSXxMc5qE5bxtMzz4G3z+METxAS3N5TMsSXZQhVGEWVqHUTeFWmaFRNDmMnNFqXtFMsbHMMT+43PVKlKFWma49bDQqnq4ZNa1RtZZAA5VUTDM34MF3QoQMV6d621VcrosWtZZ5r)m4XDN5TZtA4246tF4SVNVW2CtA4ZERNDx5b1NRz34G3z+MVvdvSAIxAnmqspQA+T1xAW4DcTNZSrQMV6d62xIFSrmcsbHMMT+vAWNDna4G3z+vtU+43PVKlKFWma49bDQqn3HWlKs5t1wMz/4h5Ps3Ti1D41Q5/R4Y03NUXZF3QoxvN4VWQPsGNaQKS1Q5/R4Y03NUXZNZN7d3z6CD4WNDnaFGsxCDN5+SVAVUtSF3QotMV6d621Vc+ot5NYMqMqt3b1Ne0SmqspQ5/R4Y03NUXZNZN7QMz6CDTAIFSrmKS+NRs4EA2qx3AE43t1wM4t1xAWI4r6scMaM6NwmMnxxMzzN43z+METx5sR4Z2msWmaVc5REUX1Ne0y4S3z+METx5sR4Z2msWma+hNDZY03NUctF4S+tFb)4UrqN3zaFGsxCDN5+SVDMStasRrIMcAtF7SAxYbTNZSrxFb5Q70RNWNEMMNyHhN4VU4NtMzzN43z+METx5sR4Z2msWmaQxNSF7SAxYbTNZSrxvmDV6X3mZlKsRtxQ45RMcSKs3Tit5mzxMStx6X3V3TZMZsMQhV4Z4SWI4BKQRr2Q6t5dSVqw5TEt5NqVqz6CDXxNDnTNZSrxvmDV6X3mZ2S1RtIMqz6CD4WNDnaFGsI+eb)d3nNVqAnsWmaxMz6CRAWNDnaFGsI+eb)d3nNVcV/sKtIZUN5sWs1Ne05NZ3z+METxWQPHUXZs3NyH7N)MRA1Ne05NZ3z+METxWsNVKNZM4XIQ7mRZ3nN4ZNZsD41wM/REWsqxMzaFGsyMRN/Z3n344VYsRtbxMS61DAWNDnaFGsGQ3BTF7SAIFSrmKS++hs)14SXNDnTNZSrxxN)EWVRH6Nis6t1xMStxWVRsSte1KsyMRmTFh21VDVosA4ZVRs)VU4DNAtGM4XIdDmqE5b344EKs6t+Fqz6CDVWNDnaFGsGdRN4MKsRHWNSs3NGdRN4Z4SXx4r6QRtxQxN5Q4SWI4rYt5NIHhmRMcVNMK2osWsqFRNDd4SXNDnTNZSrxxN)EWVRH6Nis6t+ZA5DV62NNWNE1qt1wMVw1DAWNDnaFGsGdRN4MKsRHWNSsSJe+DmD4SVDN5ztFMQP+MV6d621VDVosA4ZVRs)VU4DMGXGtWtxMRtFx6XK4MctFMs9HMMT+4S3HWlKsRrqHhNDx5nNNUTisAMqt4AGt7T1Ne0nmqspQ5/R+D0q44ERsRBqtvtF4h2RH5TZMxrxZ54tF7SAIFSrmKS++7N5ZhzqVcVZM4EaFDN4MKVqsSrCs3bAxMS6MvSAIxAtt6BaERs)s6zqsSrEMMNyHhN4VU4N+DtnF3Qo+MV6d621VDVosA4ZVRs)VU4DMStasRrIMcA/43nxN3zzmc/cHMMT+4S3HWlKsRrqHhNDx5nNNUTisAMqt4AGt3N1Ne0rmqspQ5/R+D0q44ERsRBqtvtFQcVRH6EoQq5aNRN)46Aqs3ztFMsV+MV6d621VDVosA4ZVRs)VU4DMhVZsRrKCRV2E5bNVSrZ1RrbxMS61DAWNDnaF7r+Q7mRZ703VW26scMaM6NUF7SqVqAaMMNVQ5z/x6X3VqTot6rZwvNUF7SKVSrGs5trx45RMDrRV3TEtA4Z+hsDd4SXNebrmqspQ5z/4S2Rs3Tns6t+Z6N4VUr1Ne0n43+z+METxAmPshVE1Ks2FRNUF7S1VqAnFGtIQS5RQcVKIMzaF7rZQhVGE62qH6NnF3Qo+MV6d621wAVeQDEatvs)Qe0KIMzzNZ3z+MnU+4SqVqAms6ryQhNSF7SJt4re1KsqZUmRE6ARH6NMF3siQ4A/VAVWI4re1KsqZAA4QhXNNWNEMMmqQ5z6CcSAN3zaFGs2xvNZEUAR4MACs6tAxMSZ+7s1wAretWsIZUN)mFS1Ne0rmqspQ5z/x6X3VqTEt6rZHMz6CDAWNKJamKtax45RmvSqmZ2Y1Rt9xMS6d6SAIxAtMZs2HvN2EUXRH9StFMspHMMDQv2Jt4rS1RrMERt5+RXJIMzzNZ3z+METxUMPHAmKs3NGH7NtF7SAIFSrZ5tytqz/x6X3VqTEt6r21Mz6CDAWNDnaF7r+Q7mRZ3n3HAVTF3Qo+MV6EG2WVh2tMZs2HvN2EUJPs3XtFMspHMMT+4SNVqATs55a+hs)14SXNDnTNZtnQ5rSxUMPHAmKs3NGQ3BTF7SAIFSrmKS+tFb)4WVDNUVitAS1wMMT1xAEN7ThF7r+Q7mRZ3n3H55zF3Qo+MV6d621wAretWsIZUN)MRS1Ne0rmqQeE5EDQASNVqATs55a+YbDmSSXNDnTNZSrx45RmvSqmZ2YsRBzxMS6d6SAVhAaFU4+tFb)4WVDNUVeFWS1wMMT1xAWI4rS1RrMERt5+Rz3xMzzNZ3z+MnUd7s1wAretWsIZUN)mFS1Ne0rmqspQ5z/x6X3VqTEt6rZHMz6CDAWNKJas3trxFb)xWsDMSrZMMmqQvtFZhz3HWNSF3QoFqV6d621VqAtsAEaQ45RMDrqNWNSF3QoxxN)MqbNtMzaFGs2QUN4EAXDMStn1RtIMqz6HhANwWNZmKS+Q7N/ZhzDNArSQRtIMRmREUMPN5ctFZsqQ7mD4SVWI4rtt5NI46tFMRXKtMzzQKt++RNU+43PVKlKFWma49bDQqnq4ZNa1R+KxMS6d6SAIxAt1KQaEqBqEAmPshVEsAMqQ9bDMqn3HWlKs5t1wMz/4h5Ps3Ti1D41Q5/RxU0qVSVEF6r2Mht5ZSV34MAMsSX+Q7mRZ703VW2Y1Rt9xMS61RSAIxAt1KQaEqBqEAmPshVEsAMqQ9bDMqnNVqATsAMa+ht5+Rz3xMzzN43z+METxAS3N5TMsSXZQhVGEWVqHUTeFWmaFRNDmMaPNW2GtUrbxMS6NvSAIxAt1KQaEqBqEAmPshVEsAMqQ9bDMqnNNWNysSXAd3z6CRAWNDnaFGs+dRmDMqnJH5AFs3NIMDN4m4NDMStZMZmaFq4wdASXNDcTNZSrxFpREWVJVW2M1RtKZ6N4V6lPsSVEMMmqdhtFNx41Ne0nmqspQ5/RxU0qVSVEF6r2Mht5ZSV34MAMsSXxMc5qE5bAtMzz4G3z+METxAS3N5TMsSXZQhVGEWVqHUTeFWmaFRNDmMnNFDctFMsbHMMT+43PVKlKFWma49bDQqnq4ZNa1RtZZAA5VUTDM34GF3QoQMV6d621VcrosWtZZ5r)m4XDN5TZtA4246tF4SVNVW2C4SS1w4+T1xAWI4rtt5NI46tFMRXK+KlKs6ryQ3BqE5bqs3AEMMbNxMS6dvSAIxAt1KQaEqBqEAmPshVEsAMqQ9bDMqnNNWNysSXA1Mz6CRAWNDnaFGs+dRmDMqnJH5AFs3NIMDN4m4NDMStZMZmaFqSUF7SxIFSrmKS+xxN5ZSNDMSVeQDEaERN)dhXJVW2Cs6t2ZAA5dhzq4ZNSMx41wvrCdvSAIxAnmqspQA+T1xAW4DcTNZSrQMV6d62xIFSrmcsbHMMT+vAWNDna4G3z+MVvdvSAmvAaFGs+dRmDMqnJH5AFs3NGdRN4Z4SXx4rPsRtIQvNDFSSWI4r6scMaM6NUF7S1VqTZsWs2+DmDd4SWI4r6scMaM6NwmMnAN3zz4G3z+METx5sR4Z2msAz2Z54tF7SxIFSrmKS+NRs4EA2qx3AENx41w4+T1xAWI4r6scMaM6NwmMnxIMzz4G3z+METx5sR4Z2msAz2ZAtUF7SxIFSrmKS+NRs4EA2qx3AE4SS1w4+T1xAWI4r6scMaM6mqEWsNVK2YF3Qo1MV6d621Vc+ot5NYMRt5+cVK4vXosWS1wMz/x6X3VRVZFSSrxFb5Q70RNWNEMMNyHhN4VU41Ne0y4S3z+METx5sR4Z2msWmaFDN4MKVqsSrCF3QotMV6d621Vc+ot5NYMRtFZ701Ne0y4S3z+METxWVKH5Aas3NIHSAFZ74RHArGQc4ZdDNtF7S1VqAaQcMqtxmRmvAqN3zaFGsI+eb)d3n34ZmRQq5adRmR1cSXxvA5NZ3z+METxWVKH5AasSX+QhV4Z4SXNqzTNZSrxvmDV6X3mZ2S1RtIMRt5FSSXNDcTNZSrxvmDV6X3mZ2SsRrKCRV2EU0qVebtFMQP+MV6d621VRNesqmqZUN4MDXRs7ctFMQP+MV6d621VRNSs6BqFRV4mvSqmZ2rs6BqM5z6CcSN4ZNZsDMeVeb)+SV1xxAttAMqVRV2E62RHUViQKS1w4t6d6SAIxAtt6r21Mz6CqNAIFSrmKS++hs)14SXxvA5NZ3z+METxUX3N5TisWsZMcAtF7S1VqTiMMN2xxN4VWV1xxAtt6BaERs)s6zqsSrE1cJqFRV4EUXDMStasRrIMcA/N4SXNqzTNZSrxxN)EWVRH6Nis6t+ZUN)EWVqN3zzF7BqHvs)sU0NVRAtmKS++7N5ZhzqVcVZM4EadRmRs5bqs7ctFMspHMMT+4S3HWlKsRrqHhNDx5nNVGNaMMmqZ9bUF7SWxYbrmqspQ5/R+D0q44ERsRBqtvtFE7V3VStZs3N1xMS61DAWNDnaFGsGdRN4MKsRHWNSsSJe+DmD4SVDMSreQc4VxMS6mhSAIxAtt6BaERs)s6zqsSrEMMNyHhN4VU4N+DtyF3Qo+MV6d621VDVosA4ZVRs)VU4DMStasRrIMcA/43nAxMzzNZ3z+METxUX3N5TisWsZMcAZE5b344EKs6t+FRtCN4SXNDnTNZSrxxN)EWVRH6Nis6t+ZAA5dhzq4ZNSMxV7QMz6CDAWNDnaFGsGdRN4MKsRHWNSsSXxQ6s)ZSVNwAtE43t1wMMT1xAWI4rYt5NIHhmRMcVNMK2CtA4ZERNDx5bDFebtFMspHMMT+4S3HWlKsRrqHhNDx5nKNWNis5NeQvt54SV3w5TZM4S1w4twd6SAIxAtt6BaERs)s6zqsSrEQqmqHhN5QhADMStrMZQqQhmTF7SxNDnTNZSrx45RmvSq4Z2Ys3NxCDN5+SV1NR/R1RryFRNU+4SNVqATsAMa+hsDHSV1NR/R1RryFRNU+4SNVcV/sKtIZUN4MDXRs7ctFMQP+MV6d621wAtmsRtIQvNDx5nq4ZN/F3QoQ4tU1xAWI4rM1RtKZ9pRmMbqN3zzFGs2QM/DZhXNVRVZQKS1Q5z/MRXK+K2as6rqQMz6CDXAxGVTNZSrxMr)m4XDMSris5NeQMz6CqbAtFSrZ5trxxN4VUrRs7c91RBcxMS/QA3PHABRs3NMdRV4MKsJN3zzQKt++RNU+43PHABRsSJeCebD4SVDMStZtWS1wMz6V4SWI4re1KsqZAA4QhXNNWNCF3sit5rSxUMPHAmKs3NGQ3BTF7SAIFSrmKS+tFb)4WVDNUVitAS1wMMT1xAEN7ThF7r+Q7mRZ3n3H55zF3Qo+MV6d621wAretWsIZUN)MRS1Ne0rmqQeE5EDQASNVqATs55a+YbDmSSXNDnTNZSrx45RmvSqmZ2YsRBzxMS6d6SAVhAaFU4+tFb)4WVDNUVeFWS1wMMT1xAWI4rS1RrMERt5+Rz3xMzzNZ3z+MnUd7s1wAretWsIZUN)mFS1Ne0rmqspQ5z/x6X3VqTEt6rZHMz6CDAWNKJamKtax45RmvSqmZ2Y1Rt9xMS6d6SAIxAtMZs2HvN2EUXRH9StFMspHMMDQv2Jt4rS1RrMERt5+RXJIMzzNZ3z+METxUMPHAmKs3NGH7NtF7SAIFSrZ5tytqz/x6X3VqTEt6r21Mz6CDAWNDnaF7r+Q7mRZ3n3HAVTF3Qo+MV6EG2WVh2tMZs2HvN2EUJPs3XtFMspHMMT+4SNVqATs55a+hs)14SXNDnTNZtnQ5rSxUMPHAmKs3NGQ3BTF7SAIFSrmKS+tFb)4WVDNUVitAS1wMMT1xAEV6AaFGs2xvNZEU4qsStZQq5aQvs)+cVNxMzzNxMz+METx6JPVRNEQKt+HhN5QcVNxMzzFGsGHSAFN4SWI4retA4ydRVGE5bK4MAns5t1wvEDxUVqN7At1RrMQvQqEASNwWNns6rqdc5R4SV1NR/R1RryFRNU+43PVKlKFWma49bDM4SXw5TSQRrVQ5/RxU0qVSVEF6r2Mht5ZSV34MAMF3Qo+MV6d621VcrosWtZZ5r)m4XDN5TZtA4246t5+D0q4MctF4S+FRV4mvARH54tmKS+xxN5ZSNDMSVeQDEaERN)dhXJVW2S1RrMEDN5+qn3H55zF3QoN5V6d621VcrosWtZZ5r)m4XDN5TZtA4246tFx6X3VqTotWma+hs)14SXNqzTNZSrxFpREWVJVW2M1RtKZ6N4V6lPsSVEMMmqdht5470KHANnF3QoFqV6d621VcrosWtZZ5r)m4XDN5TZtA4246tF4SVNVW2CNMt1w4+T1xAWI4rtt5NI46tFMRXK+KlKs6ryQ3BqE5bqs3AEMMpc+Mz6CRAWNDnaFGs+dRmDMqnJH5AFs3NIMDN4m4NDMStZMZmaFq4tF7SxIFSrmKS+xxN5ZSNDMSVeQDEaERN)dhXJVW2Cs6t2ZAACN4SXNDcTNZSrxFpREWVJVW2M1RtKZ6N4V6lPsSVEMMmqdhtFNvA1Ne0nmqspQ5/RxU0qVSVEF6r2Mht5ZSV34MAMsSXxMc5qE5bxN3zz4G3z+METxAS3N5TMsSXZQhVGEWVqHUTeFWmaFRNDmMnNFebtFMsbHMMT+43PVKlKFWma49bDQqnq4ZNa1RtZZAA5VUTDM34FF3QoQMV6d621VcrosWtZZ5r)m4XDN5TZtA4246tF4SVNVW2CFZS1w4+T1xAWI4rtt5NI46tFMRXK+KlKs6ryQ3BqE5bqs3AEMMpKxMS6dvSAIxAt1KQaEqBqEAmPshVEsAMqQ9bDMqnNNWNysSXxQ6s)ZSVNw54tF4VaQMV6d62xIFSrmcsbHMMT+vAWNDna4G3z+MVvdvSAIxAnmqspQA+T1xAW4DcTNZSrQMV6EhVWI4rtt5NI46tFMRXK+K2Yt5NIMqz6CcSRVcVnQcMqtMzt+43PN6XosqNVxMStxWVqH6NeQRryQMzt+43PN6XosqNVdhtCV4SXNqzTNZSrxFb5Q70RN5cys3b1xMS6FhSAIxAt1qNedRs5ZxTDFq4tFMs1HMMT+43PN6XosqNVdhtCd4SXNqzTNZSrxFb5Q70RN5cys3bVxMS6FhSAIxAt1qNedRs5ZxTDFebtFMs1HMMT+43PN6XosqmqZ6N/xU03N3zzN4/PHMMT+43PN6XosqmqZUN)V6AR4ZlKF3Qox45RmvSqN5ctmKS+NRs4EA2qVW2CtA4ZERNDFSSXNK45mqspQ5/R4Y03NUXZsSXxQ6s)ZSVNw54tFMs1HMMT+43PN6XosqmqZ6V4tSSXNK45mqspQ5/RZ7EPHUTEsA4ZFREDx6/PwWNnsRBaHMz6Cc3PHUTns6t+HFbDZSV1xxAtsW+qQ7N2E62qH6Nns3maVRNtF7SWxYbrmqspQ5/RZ7EPHUTEMZs2QvNUF7SAxFSrmKS+ERV)mv2DMSreQcMqZ9btF7SxIFSrmKS+ERV)mv2DMSris5NeQvt5EWsqxMzz43spHMMT+4SqVqAmsWmaQ6s)+RzKIMzz43spHMMT+4SqwArZs6txQFb)4WVDMGXZs6raxMStxUAqHWNmFS4qQhs5Z4SWI4ras6rqQvt5dhz3HAVnF3QoN5MT1xAWI4rY1Rt9xMS6d6SAIxAtt6rZHMz6CDAWNDnaFGsGdRN4MKsRHWNSF3QoxvN4MqpPHAras6rbxMETxUX3N5TisWsZMcAZE5sKsStnt5NGZAA5dhzq4ZNSMx41wM4t1xAWI4rYt5NIHhmRMcVNMK2Yt5NIMqz6CcSKHANisWQatxNUFh21VDVosA4ZVRs)VU4DNWlRsUrxMRETF7SAIFSrmKS++7N5ZhzqVcVZM4Ea+vV)d3bqVW2eF3Qo+St6d6SAIxAtt6BaERs)s6zqsSrEMZ+qQAA5V5aPxMzz43spHMMT+4S3HWlKsRrqHhNDx5nNVGNaMMmqZA5RmvAqN3zzFZ3z+METxUX3N5TisWsZMcAZE5b344EKs6t+FRtCV4SXNDnTNZSrxxN)EWVRH6Nis6t+ZAA5dhzq4ZNSMxV7tMz6CDAWNDnaFGsGdRN4MKsRHWNSsSXxQ6s)ZSVNwAtENx41wMMT1xAWI4rYt5NIHhmRMcVNMK2CtA4ZERNDx5bDFDctFMspHMMT+4S3HWlKsRrqHhNDx5nNNUTisAMqt4AGt7V1Ne0rmqspQ5/R+D0q44ERsRBqtvtF4h2RH5TZMxrxZAttF7SAIFSrmKS++7N5ZhzqVcVZM4EaMhN)MDrRV3TE1qmqHvV4VU41Ne0GNZ3z+METxUX3N5TisWsZMcAZEAXqHAV/sKtIZAAFE74qH55KF3QoN5MT1xAWI4rS1RrMEDN5+qaPN6XosqNVxMS/Z74KH5caF7r+Q7mRZ703HAVzs5t1wvmRmv2NN5caF7r+HhN5QhADNUTit6rZQMz6CqNAIFSrmKS+FRs5MRAK4ZNSs3NIMRNSF7Sx4qcTNZSrxMr)m4XDNAreMMNVxMStx623NAtetW3eN6s)VAX1xxAtF6r2Mht5dSVqwUctF4Snd3Svd6SAIxAtF6r2MhtFx6zqN6XnF3Qo+34wm7AWNKJamKS+tvV)46SRHAN/F3sitq/Rm4SqMK2TtAXIHhN/EcSXw5TSQRrVQ5/Rm4SqMK2rsc42FRmqE5bqHUAtF4S1d3zt+43PHABRsSJeCebD4SVNtMzzHAXax45RmvSqmZ2Y1Rt9xMS6MvSAIxAtMZs2HvN2EUXRH9StF4SnFqV6EG2WVh2tMZs2HvN2EUJPs3XtFMQctMV6d621wAretWsIZUN)MRS1Ne0YFM+z+MnUd7s1wAretWsIZUN)mFS1Ne0yNZ3z+METxUMPHAmKs3NGH7NtF7SAtFSrZ5tytqz/x6X3VqTEt6r21Mz6CDAWNDnaF7r+Q7mRZ3n3HAVTF3Qo+MV6EG2WVh2tMZs2HvN2EUJPs3XtFMspHMMT+4SNVqATs55a+hs)14SXNDnTNZtnQ5rSxUMPHAmKs3NGQ3BTF7SAIFSrmKS+tFb)4WVDNUVitAS1wMMT1xAEN7ThF7r+Q7mRZ3n3H55zF3Qo+MV6d621wAretWsIZUN)MRS1Ne0rmqQeE5EDQASNVqATs55a+YbDmSSXNDnTNZSrx45RmvSqmZ2YsRBzxMS6d6SAVhAaFU4+tFb)4WVDNUVeFWS1wMMT1xAWI4rS1RrMERt5+Rz3xMzzNZ3z+MnUd7s1wAretWsIZUN)mFS1Ne0rmqspQ5z/x6X3VqTEt6rZHMz6CDAWNKJas3trxFb)xWsDMSrZMMmqQvtFZhz3HWNSF3QotMV6d621VqAtsAEaQ45RMDrqNWNSF3QoxFpRE6ARIMzaFGs2QUN4EAXDMStn1RtIMqz6HhANwWNZmKS+Q7N/ZhzDNArSQRtIMRmREUMPN5ctFZsqQ7mD4SVWI4rtt5NI46tFMRXKtMzzQKt++RNU+43PVKlKFWma49bDQqnq4ZNa1R+KxMS6d6SAIxAt1KQaEqBqEAmPshVEsAMqQ9bDMqn3HWlKs5t1wMz/4h5Ps3Ti1D41Q5/RxU0qVSVEF6r2Mht5ZSV34MAMsSX+Q7mRZ703VW2Y1Rt9xMS6dvSAIxAt1KQaEqBqEAmPshVEsAMqQ9bDMqnNVqATsAMa+ht5+Rz3xMzzNM+z+METxAS3N5TMsSXZQhVGEWVqHUTeFWmaFRNDmMaPNW2GtUrbxMS6NvSAIxAt1KQaEqBqEAmPshVEsAMqQ9bDMqnNNWNysSXAd3z6CqNWNDnaFGs+dRmDMqnJH5AFs3NIMDN4m4NDMStZMZmaFq4wdASXNDcTNZSrxFpREWVJVW2M1RtKZ6N4V6lPsSVEMMmqdhtFNx41Ne0yNZ3z+METxAS3N5TMsSXZQhVGEWVqHUTeFWmaFRNDmMnNFq4tFMs9HMMT+43PVKlKFWma49bDQqnq4ZNa1RtZZAA5VUTDM34nF3Qod34t1xAWI4rtt5NI46tFMRXK+KlKs6ryQ3BqE5bqs3AEMMbVxMS61RSAIxAt1KQaEqBqEAmPshVEsAMqQ9bDMqnNNWNysSXAN5z6CD4WNDnaFGs+dRmDMqnJH5AFs3NIMDN4m4NDMStZMZmaFctSF7SAxSATNZSrxFpREWVJVW2M1RtKZ6N4V6lPsSVEMMmqdhtFNFS1Ne0nmqspQ5/RxU0qVSVEF6r2Mht5ZSV34MAMsSXxMc5qE5bXN3zz4G3z+METxAS3N5TMsSXZQhVGEWVqHUTeFWmaFRNDmMnNNUTisAMqt4ASF7S)FebTNZSrd3MT1xAW4qXTNZSrd34t1xAW4ebTNZSrtMV6d62AxSATNZSrQMV6d62xIFSrmcsbHM42Qv21VcrosWtZZ5r)m4XDNUVosA4VxMStxUbRs3Tns6t1xMETx5sR4Z2ms5t1wM/RZSVqVqAGtWtbxMETx5sR4Z2msAz2Z54UF7SAxSATNZSrxFb5Q70RN5cys3b1xMS6VxAWNDnaFGsxCDN5+SVAVUtCF3QotMV6d621Vc+ot5NYMqMqthA1Ne0SmqspQ5/R4Y03NUXZNZN7+qz6CD4WNDnaFGsxCDN5+SVAVUt5F3QodS+T1xAWI4r6scMaM6mqEWsNVK2YF3QoN5V6d621Vc+ot5NYMRt5+cVK4vXosWS1wMz/x6X3VRVZFSSrxFb5Q70RNWNEMMNyHhN4VU41Ne0y4S3z+METx5sR4Z2msWmaFDN4MKVqsSrCF3Qo+qV6d621Vc+ot5NYMRtFZ701Ne0y4S3z+METxWVKH5Aas3NIHSAFZ74RHArGQc4ZdDNtF7S1VqAaQcMqtxmRmvAqN3zaFGsI+eb)d3n34ZmRQq5adRmR1cSXxvA5mqspQ5/RZ7EPHUTEMZs2QvNUF7SxIFSrmKS+ERV)mv2DMSreQcMqZ9btF7SxIFSrmKS+ERV)mv2DMSris5NeQvt5EWsqxMzzN4z1HMMT+4SqVqAmsWmaQ6s)+RzKIMzz43spHMMT+4SqwArZs6txQFb)4WVDMGXZs6raxMStxU0qVebtmKS+Q6N)s6ADNUTit6rZQMz6CDVXNYSrmKS++YbDmSSXNDcTNZSrxxN)MRS1Ne0YN43z+METxUX3N5TisWsZMcAtF7S1VqTiMMN2xxN4VWV1xxAtt6BaERs)s6zqsSrE1cJqFRV4EUXDMStasRrIMcA/N4SXNDcTNZSrxxN)EWVRH6Nis6t+ZUN)EWVqN3zzFGsx+cAFZ703N3zaFGsGdRN4MKsRHWNSs3maVRN/4SVKIMzzmczAHMMT+4S3HWlKsRrqHhNDx5nNVGNaMMmqZ9bUF7SWxYbrmqspQ5/R+D0q44ERsRBqtvtFE7V3VStZs3N1xMS61DAWNDnaFGsGdRN4MKsRHWNSsSJe+DmD4SVDMSreQc4VxMS6mhSAIxAtt6BaERs)s6zqsSrEMMNyHhN4VU4N+DtyF3Qo45V6d621VDVosA4ZVRs)VU4DMStasRrIMcA/43nAxMzzmc/c1MV6d621VDVosA4ZVRs)VU4DMStasRrIMcA/43nAtMzzNZ3z+METxUX3N5TisWsZMcAZE5b344EKs6t+FRtCd4SXNKVTNZSrxxN)EWVRH6Nis6t+ZAA5dhzq4ZNSMxV7+qz6CDAWNDnaFGsGdRN4MKsRHWNSsSXxQ6s)ZSVNwAtE4SS1wMMT1xAWI4rYt5NIHhmRMcVNMK2Fs6rZw6QDZ3aPNWNTQcMqtMz6CDVAIFSrmKS++7N5ZhzqVcVZM4EaMhN)MDrRV3TEM4JetvN)mZV1Ne05NZ3z+METxUMPHAmKt5NGZ9b5Q70RN5ctFxrItvV)Zv21wAretWsIdDN)MDSqN3zzQKt++RNU+4SNVcV/sKtIZUN4MDXRs7ctFMsV1MV6d621wAtmsRtIQvNDx5nq4ZN/F3Qo+qV6d621wAVeQDEaxFbD4SV1Ne0t1RtbmhV4mx4qNWNnFSSrxMr)m4XDNUTZsUrbxMStQx4xIFSrmKS+49bDQqnNVcV/sKtbxMS6NMbWNKJamKS+FDN4EAXRHAN/F3sitq/Rm4SqMK2TtAXIHhN/EcSXw5TSQRrVQ5/Rm4SqMK2rsc42FRmqE5bqHUAtF4S1d3zt+43PHABRsSJeCebD4SVNtMzzHAXax45RmvSqmZ2Y1Rt9xMS6MvSAIxAtMZs2HvN2EUXRH9StF4SnQMV6EG2WVh2tMZs2HvN2EUJPs3XtFMspHMMT+4SNVqATs55a+hs)14SXNDnTNZtnQ5rSxUMPHAmKs3NGQ3BTF7SAIFSrmKS+tFb)4WVDNUVitAS1wMMT1xAEN7ThF7r+Q7mRZ3n3H55zF3Qo+MV6d621wAretWsIZUN)MRS1Ne0rmqQeE5EDQASNVqATs55a+YbDmSSXNDnTNZSrx45RmvSqmZ2YsRBzxMS6d6SAVhAaFU4+tFb)4WVDNUVeFWS1wMMT1xAWI4rS1RrMERt5+Rz3xMzzNZ3z+MnUd7s1wAretWsIZUN)mFS1Ne0rmqspQ5z/x6X3VqTEt6rZHMz6CDAWNKJamKtax45RmvSqmZ2Y1Rt9xMS6d6SAIxAtMZs2HvN2EUXRH9StFMspHMMDQv2Jt4rS1RrMERt5+RXJIMzzNZ3z+METxUMPHAmKs3NGH7NtF7SAIFSrZ5tytqz/x6X3VqTEt6r21Mz6CDAWNDnaF7r+Q7mRZ3n3HAVTF3Qo+MV6EG2DN7At1Rr+VRtFxAVNNWNnsSXIH7N)VU41Ne0ymqspQ5/Rm4SqMK2nMZsZw6N5VU41Ne0t1KQaQvQTFh21VqAatAMaMhtF4h5Ps3TZF3siQ4A/VAVWI4retUrIHht5xU4Ks3TZsWQatFb5Z4SXVRNetWtxMqETxAS3N5TMsSXZQhVSF7SKVSrGs5trxFpREWVJVW2M1RtKZ6N4V6lPsGVtFMspHMMT+43PVKlKFWma49bDQqnq4ZNa1RtZZUN)EWVqN3zzF7rxQFbDZh/PtMzaFGs+dRmDMqnJH5AFs3NIMDN4m4NDMSretWsIdDmqEUJPs3XtFMQcFqV6d621VcrosWtZZ5r)m4XDN5TZtA4246tFx6X3VqTotWma+hs)14SXNqzTNZSrxFpREWVJVW2M1RtKZ6N4V6lPsSVEMMmqdht5470KHANnF3QoM3V6d621VcrosWtZZ5r)m4XDN5TZtA4246tF4SVNVW2CNMt1w4tU1xAWI4rtt5NI46tFMRXK+KlKs6ryQ3BqE5bqs3AEMMpc+Mz6CRAWNDnaFGs+dRmDMqnJH5AFs3NIMDN4m4NDMStZMZmaFq4tF7SAx3zTNZSrxFpREWVJVW2M1RtKZ6N4V6lPsSVEMMmqdhtFNMb1Ne0GmqspQ5/RxU0qVSVEF6r2Mht5ZSV34MAMsSXxMc5qE5bxIMzzNxMz+METxAS3N5TMsSXZQhVGEWVqHUTeFWmaFRNDmMnNFqctFMQcFqV6d621VcrosWtZZ5r)m4XDN5TZtA4246tF4SVNVW2C4SS1wM4U1xAWI4rtt5NI46tFMRXK+KlKs6ryQ3BqE5bqs3AEMMbNxMS6MvSAIxAt1KQaEqBqEAmPshVEsAMqQ9bDMqnNNWNysSXA1Mz6CRAWNDnaFGs+dRmDMqnJH5AFs3NIMDN4m4NDMStZMZmaFqSUF7SxIFSrmKS+xxN5ZSNDMSVeQDEaERN)dhXJVW2Cs6t2ZAA5dhzq4ZNSMx41wvrCZvSAIxAyN43z+MVvZvSAIxACmqspQ54wNvSAIxAymqspQAtS1xAW4DcTNZSrQMV6d62xIFSrs3trxFpREWVJVW2M1RtKZUN)EWVqN3zzFGsiHhEDZSVNxMzaFGsxCDN5+SV1Ne0tsAMqVebDV62KIMzaFGsxCDN5+SVAVUtyF3QotMV6d621Vc+ot5NYMqMqt741Ne0SmqspQ5/R4Y03NUXZNZN7Fqz6CD4WNDnaFGsxCDN5+SVAVUtnF3QotMV6d621Vc+ot5NYMqMqt7V1Ne0yNZ3z+METx5sR4Z2msAz2ZAttF7SAxFSrmKS+NRs4EA2qVWlRMZQa+3z6CDTxxFSrmKS+NRs4EA2qVW2Ys6tICDN5d4SXx4rS1RrMw6NUFh21Vc+ot5NYMRtF4h2RH5TZM4S1wM4w1RSAIxAt1qNedRs5V5nNNUTisAMqt4ASF7SAxFSrmKS+NRs4EA2qVW2ntU41wM4w1RSAIxAtsW+qQ7N2EWVRsStnMZsZxvVDZhz3N9StF4S+Q7mDZSVNVcNeQc4VxMETxWVKH5Aas3NyMRN/Z3n3N6mRF3Qo+St6d6SAIxAtsW+qQ7N2EUMPs3TZF3QotMV6d621VqTG1RryZA5RmvAqVW2tF3QoQMV6d621VqTG1RryZA5RMDrRV3TEt5NqVqz6CqNAIFSrmKS+Veb)+SVDNUTit6rZQMz6CqNAIFSrmKS+Vc5RVAVNM3TetWsIZAA4VAVRtMzzFGQaVRNtFh21VDTZsUrIZUN4MDXRs7ctFMsV45V6d621VDVeFWS1w4tS1xAWI4rYsRBzxMStQMNWNDnaFGsGdRN4MKsRHWNSF3QoxxN5sWsNNWNnFSSrxxN)EWVRH6Nis6t+Z9bFV5bK4Z2YsSXxQ6s)ZSVNw54tFMsVHMMT+4S3HWlKsRrqHhNDx5n3HWlKs5t1wMz/V6SRH6NoMZsnxMETxUX3N5TisWsZMcAZEU0qVRNCs6tbxMStQxTWNDnaFGsGdRN4MKsRHWNSsSJe+DmD4SVDNW4tF4SnN5MT1xAWI4rYt5NIHhmRMcVNMK2rQRryFRmqEAS1Ne05NZ3z+METxUX3N5TisWsZMcAZEUAKHUTCsWmatFbDZSV1NefzmqspQ5/R+D0q44ERsRBqtvtF4h2RH5TZMxrxZ54UF7SWxG4SmqspQ5/R+D0q44ERsRBqtvtF4h2RH5TZMxrxZ54tF7SAIFSrmKS++7N5ZhzqVcVZM4EaFDN4MKVqsSrCs3bAxMS6d6SAIxAtt6BaERs)s6zqsSrEMMNyHhN4VU4N+DtnF3Qo+MV6d621VDVosA4ZVRs)VU4DMStasRrIMcA/43nxN3zzNZ3z+METxUX3N5TisWsZMcAZE5b344EKs6t+FRtC1cSXNDnTNZSrxxN)EWVRH6Nis6t+Z6V5V6zqN6Xns3NxMDN/ZSVNxMzz4SzpHMMT+4S3HWlKsRrqHhNDx5nKNWNis5NeQvtF47ANVKNesWS1w4t6d6SAIxAtMZs2HvN4EUXDNA+ot5NYMqz6HGQPHUTCs5trx45RmvSq4Z2YsRtiMqz6HGQPHUTCs5trx45RMDrRV3TEtA4Z+hsDd4SXNqqzmqspQ5z/4S2Rs3Tns6t+Z6N4VUr1Ne0yNZ3z+METxAmPshVE1Ks2FRNUF7S1VqAnFGtIQS5RQcVKIMzaF7rZQhVGE62qH6NnF3Qo+34CmhSAIxAtF6r2MhtFx6zqN6XnF3QoQM4t1xAEN7AtMMNMMeb)+hz3VcAtFxraxFb)xWsDNANoQc4ZVqrUF7SKVSrGs5trxFb)xWsDMGJo1RtxMRtF4SV3IMzzF3QcxMETx6JPVRNEM44eQSA5V5b1NRz3FU4+tFb)4WVDNUVeFWS1wMMT1xAWI4rS1RrMERt5+Rz3xMzzNZ3z+MnUd7s1wAretWsIZUN)mFS1Ne0rmqspQ5z/x6X3VqTEt6rZHMz6CDAWNKJamKtax45RmvSqmZ2Y1Rt9xMS6d6SAIxAtMZs2HvN2EUXRH9StFMspHMMDQv2Jt4rS1RrMERt5+RXJIMzzNZ3z+METxUMPHAmKs3NGH7NtF7SAIFSrZ5tytqz/x6X3VqTEt6r21Mz6CDAWNDnaF7r+Q7mRZ3n3HAVTF3Qo+MV6EG2WVh2tMZs2HvN2EUJPs3XtFMspHMMT+4SNVqATs55a+hs)14SXNDnTNZtnQ5rSxUMPHAmKs3NGQ3BTF7SAIFSrmKS+tFb)4WVDNUVitAS1wMMT1xAEN7ThF7r+Q7mRZ3n3H55zF3Qo+MV6d621wAretWsIZUN)MRS1Ne0rmqQeE5EDQASNVqATs55a+YbDmSSXNDnTNZSrx45RmvSqmZ2YsRBzxMS6d6SAVhAaFU4+tFb)4WVDNUVeFWS1wMMT1xAWI4rS1RrMERt5+Rz3xMzzNZ3z+MaqQv21VqAtsAEatvND4SVKmZ2nsRrGMcAtF7SAtFSrmKS+QYpRs5nKVSris5NKMcAtF7S1VDViM4XAxMETx6X34xToQDEaFRV4mvAqN3zzQKt++RNU+43PHANnsKmax4A/V6AqH6NoMZsxMqz6HGQPHUTCs5trxFpREWVJVW2M1RtNxMS/Z74KH5caFGs+dRmDMqnJH5AFs3NIMDN4m4N1Ne0rmqspQ5/RxU0qVSVEF6r2Mht5ZSV34MAMs3NGdRN4Z4SXx4rCQc42Qvs)N4SWI4rtt5NI46tFMRXK+KlKs6ryQ3BqEUMPHAmKt5NGZUN)mFS1Ne05mqspQ5/RxU0qVSVEF6r2Mht5ZSV34MAMsSX+Q7mRZ703VW2YsRBzxMS6FhSAIxAt1KQaEqBqEAmPshVEsAMqQ9bDMqnNNWNys3NxdRV)46A1Ne0CmqspQ5/RxU0qVSVEF6r2Mht5ZSV34MAMsSXxMc5qE5bAN3zz4G3z+METxAS3N5TMsSXZQhVGEWVqHUTeFWmaFRNDmMnNFK4rF3QoQMV6d621VcrosWtZZ5r)m4XDN5TZtA4246tF4SVNVW2CN4S1w4+T1xAWI4rtt5NI46tFMRXK+KlKs6ryQ3BqE5bqs3AEMMbAxMS6dvSAIxAt1KQaEqBqEAmPshVEsAMqQ9bDMqnNNWNysSXAQMz6CRAWNDnaFGs+dRmDMqnJH5AFs3NIMDN4m4NDMStZMZmaFctUF7SxIFSrmKS+xxN5ZSNDMSVeQDEaERN)dhXJVW2Cs6t2ZAAC1cSXNDcTNZSrxFpREWVJVW2M1RtKZ6N4V6lPsSVEMMmqdhtFN4X1Ne0nmqspQ5/RxU0qVSVEF6r2Mht5ZSV34MAMsSXxMc5qE5bXIMzz4G3z+METxAS3N5TMsSXZQhVGEWVqHUTeFWmaFRNDmMnNFKVtFMsbHMMT+43PVKlKFWma49bDQqnq4ZNa1RtZZAA5VUTDMStasRrIMcA/N4SXMR2nmqspQA+T1xAW4DcTNZSrQMV6d62xIFSrmcsbHMMT+vAWNDna4G3z+MVvdvSAIxAnmqQeQqETxAS3N5TMsSXZQhVGEUX3N5TZF3Qox4AFZhXK44V6FSSrxFb5Q70RN5ctF4S+ERN)s6XKHUTnFSSrxFb5Q70RN5cys3pcxMS6FhSAIxAt1qNedRs5ZxTDFqztFMs1HMMT+43PN6XosqNVdhtCN4SXNK4rmqspQ5/R4Y03NUXZNZN7QMz6CD4WNDnaFGsxCDN5+SVAVUtGF3QotMV6d621Vc+ot5NYMqMqt3N1Ne0SmqspQ5/R4Y03NUXZs3NqtxN5Q4SXNK45mqspQ5/R4Y03NUXZs3NGMRV4Q70qIMzzF7r+Q7mRQcV1xxAt1qNedRs5V5nNNUTisAMqtMz6CDTxxFSrmKS+NRs4EA2qVW2CtA4ZERNDx5b1Ne0SmqspQ5/R4Y03NUXZsSXIdqz6CDTxxFSrmKS+ERV)mv2DN5TiM4XItvs)xUVK44VotAS1wM/Rmv2K4ZNStWs2QvNUFh21VqTG1RryZUN4VWsKmZ2osWQPxMStQMNAIFSrmKS+ERV)mv2DMSreQc4VxMS6FhSAIxAtsW+qQ7N2EUMPs3TZs3N1xMS6dvSAIxAtsW+qQ7N2EU4RH6EoQq5adRmR1cSXNebrmqspQ5/Rs6XRNWNEtA4Z+hsDd4SXNebrmqspQ5/RsU4qHWNCQc42HvN2EUAqHWNmF3QoxxN5sWs1xxAttAMqVRV2E62RHUViQKS1w4t6d6SAIxAtt6r21Mz6CRAWNDnaFGsGH7NtF7SAIFSrmKS++7N5ZhzqVcVZM4S1wM/RZhzNN5AttAMqEqzt+4S3HWlKsRrqHhNDx5aPMGNCQcMa+htF4h2RH5TZMxrAxMS6FhSAIxAtt6BaERs)s6zqsSrEt6BaERNUF7S1wWNTsRrqdc5RQ4SWI4rYt5NIHhmRMcVNMK2osWsqFRNDd4SXNDnTNZSrxxN)EWVRH6Nis6t+ZA5DV62NNWNE1qt1wMVw1DAWNDnaFGsGdRN4MKsRHWNSsSJe+DmD4SVDN5ztFMQP+MV6d621VDVosA4ZVRs)VU4DMGXGtWtxMRtFx6XK4MctFMs9HMMT+4S3HWlKsRrqHhNDx5nNNUTisAMqt4AGt7T1Ne0rmqspQ5/R+D0q44ERsRBqtvtF4h2RH5TZMxrxZ54tF7SAIFSrmKS++7N5ZhzqVcVZM4EaFDN4MKVqsSrCs3bAxMS6d6SAIxAtt6BaERs)s6zqsSrEMMNyHhN4VU4N+DtnF3Qo+MV6d621VDVosA4ZVRs)VU4DMStasRrIMcA/43nxN3zzNZ3z+METxUX3N5TisWsZMcAZE5b344EKs6t+FRtC1cSXNDnTNZSrxxN)EWVRH6Nis6t+Z6V5V6zqN6Xns3NxMDN/ZSVNxMzz4SzpHMMT+4S3HWlKsRrqHhNDx5nKNWNis5NeQvtF47ANVKNesWS1w4t6d6SAIxAtMZs2HvN4EUXDNA+ot5NYMqz6HGQPHUTCs5trx45RmvSq4Z2YsRtiMqz6HhANwWNZmKS+tvs)Qe0KmZ2asRrGHhETF7SxNDnTNZSrx4A5+hzKV3TZM4EaERN)M4SXNDcGmqspQ5z/MRXK+K2t1RtxMqz6Cc3Ps7c9Qc42tvN5V6A1xxAtF6r2Mht5dSVqwUctFMspHMMT+4SJH5AFsSX+HhN5QhA1Ne0rmqQeE5ETx5bK4MATsA4ZHvNSF7SJt4re1KsqZUmRE6ARH6NMF3siQ4A/VAVWI4re1KsqZAA4QhXNNWNEMMmqQ5z6CcSAN3zaFGs2xvNZEUAR4MACs6tAxMSZ+7s1wAretWsIZUN)mFS1Ne0yN43z+METxUMPHAmKs3NGH7NtF7SWxYbTNZtnQ5rSxUMPHAmKs3NGQ3BTF7SAxFSrmKS+tFb)4WVDNUVitAS1wMVwFhSAVhAaFU4+tFb)4WVDNUVeFWS1wMMT1xAWI4rS1RrMERt5+Rz3xMzzNZ3z+MnUd7s1wAretWsIZUN)mFS1Ne0rmqspQ5z/x6X3VqTEt6rZHMz6CDAWNKJamKtax45RmvSqmZ2Y1Rt9xMS6d6SAIxAtMZs2HvN2EUXRH9StFMspHMMDQv2Jt4rS1RrMERt5+RXJIMzzNZ3z+METxUMPHAmKs3NGH7NtF7SAIFSrZ5tytqz/x6X3VqTEt6r21Mz6CDAWNDnaF7r+Q7mRZ3n3HAVTF3Qo+MV6EG2WVh2tMZs2HvN2EUJPs3XtFMspHMMT+4SNVqATs55a+hs)14SXNDnTNZtnQ5rSxUMPHAmKs3NGQ3BTF7SAIFSrmKS+tFb)4WVDNUVitAS1wMMT1xAEN7ThF7r+Q7mRZ3n3H55zF3Qo+MV6d621wAretWsIZUN)MRS1Ne0rmqQeE6tU+43PHABRsSX+McA5V6ADM3Tit6BqtMz6CD4WNDnaFGs2xvNZE6ANVcV/s5mqtMz6CcS3HAVCMx41Q5/Rmv234Z2FsSXxQFbDZSV1NRznMxBqMqETx6X3w5Tis3N+tvVDZSVqVK2S1qNVxM3Rs6X3VStZmKS+xxN5ZSNDMSVeQD41wvEDxUVqN7At1KQaEqBqEAmPshVEsAMqQ9bDEcSXNK4TNZSrxFpREWVJVW2M1RtKZ6N4V6lPsSVEt6BaERNUF7S1wAtZMv+qMDmR4SV1xxAt1KQaEqBqEAmPshVEsAMqQ9bDMqnNVqATsAMa+ht5+RXJIMzzNxMz+METxAS3N5TMsSXZQhVGEWVqHUTeFWmatFb)4WV3NUVEt6rZHMz6CDTWNDnaFGs+dRmDMqnJH5AFs3NIMDN4m4NDMStZMZmaNDNFV6SKIMzz43+z+METxAS3N5TMsSXZQhVGEWVqHUTeFWmaFRNDmMnNFK4tFMsbHMMT+43PVKlKFWma49bDQqnq4ZNa1RtZZAA5VUTDM34yNZS1w4+T1xAWI4rtt5NI46tFMRXK+KlKs6ryQ3BqE5bqs3AEMMb1xMS6VxTWNDnaFGs+dRmDMqnJH5AFs3NIMDN4m4NDMStZMZmaFq4SF7SANYSrmKS+xxN5ZSNDMSVeQDEaERN)dhXJVW2Cs6t2ZAACd4SXNK4rmqspQ5/RxU0qVSVEF6r2Mht5ZSV34MAMsSXxMc5qE5bxN3zz4S3z+METxAS3N5TMsSXZQhVGEWVqHUTeFWmaFRNDmMnNFebtFMsbHMMT+43PVKlKFWma49bDQqnq4ZNa1RtZZAA5VUTDM34FF3QoQMV6d621VcrosWtZZ5r)m4XDN5TZtA4246tF4SVNVW2CFZS1w4+T1xAWI4rtt5NI46tFMRXK+KlKs6ryQ3BqE5bqs3AEMMpKxMS6dvSAIxAt1KQaEqBqEAmPshVEsAMqQ9bDMqnNNWNysSXxQ6s)ZSVNw54tF4VaQMV6d62AxG4TNZSrd3V6d62Ax7nTNZSrN5V6d62xIFSrmcsbHMMT+vAWNDna4G3z+MVvdvSAmvAaFGs+dRmDMqnJH5AFs3NGdRN4Z4SXx4rPsRtIQvNDFSSWI4r6scMaM6NUF7S1VqTZsWs2+DmDd4SWI4r6scMaM6NwmMnAN3zzN43z+METx5sR4Z2msAz2Z54tF7SAxFSrmKS+NRs4EA2qx3AENx41wM4t1xAWI4r6scMaM6NwmMnxIMzzN43z+METx5sR4Z2msAz2ZAtUF7SAxFSrmKS+NRs4EA2qx3AE4SS1wM4t1xAWI4r6scMaM6mqEWsNVK2YF3QodStt1xAWI4r6scMaM6mqEUXqs3)ot5NbxMStxUMPHAN/s5t1Q5/R4Y03NUXZsSXxQ6s)ZSVNxMzzN4/PHMMT+43PN6XosqmqZAA5dhzq4ZNSMx41wM4t1xAWI4r6scMaM6mqE6A3tMzzN4/PHMMT+4SqVGNet55aERsD4hANVcVtQRtIH7N514SXx4retWtIMc5R46XK4MctmKS+ERV)mv2DNUTZsUrIZUN5sWs1Ne0Y43spHMMT+4SqVGNet55atFbDZSV1Ne0SmqspQ5/RZ7EPHUTEMZs2QvmqEAS1Ne0nmqspQ5/RZ7EPHUTEMZsZw6QDZ3n3N6mRF3QoN5MT1xAWI4BR1RrYMRt5dhz3HAVnF3QoN5MT1xAWI4BRMZQqMcAFZhX3VqTEM4MqMRsSF7S1VKlRsAS1Q5/RdSVqw5TEtA4Z+hsDd4SXNqcMmqspQ5/R+RXJIMzzNZ3z+METxUXRH9StFMspHMMT+4S3HWlKsRrqHhNDFSSXx4r6s6rMQvNDFSSWI4rYt5NIHhmRMcVNMK26QRtxQxN5+qnNNUTisAMqt4ASF7SAxFSrmKS++7N5ZhzqVcVZM4Ea+7N5ZSV1Ne0tQRrMHhmREU43N3zaFGsGdRN4MKsRHWNSs3maVRN/4SVKIMzzNM+z+METxUX3N5TisWsZMcAZEUAKHUTCsWmaQ3z6CDXxNDnTNZSrxxN)EWVRH6Nis6t+ZA5DV62NNWNE1cS1w4t6d6SAIxAtt6BaERs)s6zqsSrEMZ+qQAA5V5nNVqAns5t1wM3T1xAWI4rYt5NIHhmRMcVNMK2CtA4ZERNDx5bDFK4tFMsAHMMT+4S3HWlKsRrqHhNDx5nNNUTisAMqt4AGt741Ne0YNxMz+METxUX3N5TisWsZMcAZE5b344EKs6t+FRtCN4SXNDnTNZSrxxN)EWVRH6Nis6t+ZAA5dhzq4ZNSMxV7QMz6CDAWNDnaFGsGdRN4MKsRHWNSsSXxQ6s)ZSVNwAtE43t1wMMT1xAWI4rYt5NIHhmRMcVNMK2CtA4ZERNDx5bDFebtFMspHMMT+4S3HWlKsRrqHhNDx5nKNWNis5NeQvt54SV3w5TZM4S1w4twd6SAIxAtt6BaERs)s6zqsSrEQqmqHhN5QhADMStrMZQqQhmTF7SxNDnTNZSrx45RmvSq4Z2Ys3NxCDN5+SV1NR/R1RryFRNU+4SNVqATsAMa+hsDHSV1NR/R1RryFRNU+4SNVcV/sKtIZUN4MDXRs7ctFMsV1MV6d621wAtmsRtIQvNDx5nq4ZN/F3QotMV6d621wAVeQDEaxFbD4SV1Ne0t1RtbmhV4mx4qNWNnFSSrxMr)m4XDNUTZsUrbxMStQx4ANYSrmKS+49bDQqnNVcV/sKtbxMS6NMNWNKJaZ5trxvN/xAVqsStn1RrMERs)4Ur1NRzhFGs+dRmDMqnqw54tFZsqQ7mD4SVWI4BKsRtxQYpRdSVNw54tF4VaxFb)MD41xxAt1cX+dRV)4Y01xxAtZAS+QqETxWs3MSr6sWmaFRV4mvARH54tFxrItvV)Zv21wWXSs6rqMcAZEUJPHANG1RrrxM3Rs6X3VStZmKS+FRV5MR5PN5XtFZsqQ7mD4SVWI4rM1RtKZUN)EWV1NRznMxBqMqnDQv21VctotWsqHhNFVU4qN3zzFU4+FRV4mvAqN3zz4S3z+MnU+4Sq4ZmRs6rMFRsDsAV1NRzhFGs2NRV4MqNqVW2otAS1wvrSxWV3MGNttAMqQFbDdASWI4BosRrIMcA5Q70KV34tmKS+sMzZQv21wAtZQKtIH7mRQqb1NRzhFGs2HSAtF7SJt4re1cXIHhERmvARHW2Ts3NGdRN4Z4SXx4retWtKQ3rDN4SWI4BKs6rqZ9b)xWs1NR/R1RryFRNU+4Sq4ZmRs3N2xvNZEUX3N5TZF3QoxvmRdhzNIZXM1RtNxMETxWVqH6NE1Rr+VRt54U0K44ERF5t1wvmRmv2NN5caFGsIMRNZE6JPVRNEMZQqFRNDd4SXNK4TNZSrxvN4VWsDN5AtsAEaQ45RMDrqNWNSF3QoxFpRE6ARIMzaFGsIMRNZEWs344Vrs3N2EebDEhARshNZF3siVeb)d3bqN7AtsAMqVRt5s62RsGXE1RrI+vtFs6XNxMzzNxMz+METxWVqH6NEsKsZQvV4VU4DNAreMMNVxMS6d6SAIxAtsAMqVRt5HhzKV3TZM4Ea+vs4mMbqN3zzNZ3z+METxWVqH6NEsKsZQvV4VU4DMSretWsKMqz6CRAAIFSrmKS+ERN)s5nRVcVnQcMqtvtF47AqHWmKF3QoFqV6d621VqTZsAEawRsDZhAqsSrEM4XI4UN4Z4SXx4rCsRrMMqzt+4SqVSVTsSJeHhV44Y0DNUVeFWS1wMSvERSAIxAtsWtZHvtFEhzK44+os3NGH7NtF7SWx3XMmqspQ5/RZSN3MK2rsRtINRs2EUX3N5TZF3Qox4A5MRSqN3zaFGsI4UNZEUARs3T6sq5atFb)4WV1Ne0rmqspQ5/RZSN3MK2rsRtINRs2E5bN4xctFMQP+MV6d621VqTMtAEa49bDQqn3H55zF3Qod3Svd6SAIxAtsWtZHvtFMRXK+K2YsRBzxMStQxTX4DnTNZSrxvmDMRSDMSVeQDEa+7N5ZSV1Ne0tMMNZHvNUFh21VqTMtAEa49bDQqnNVqATsWS1w4tvZvSAIxAtsWtZHvtFMRXK+K2CM44bxMS61DAWNDnaFGQqHFb)x62qN3zzsWs2QAA5Zv21VRNZF3siVeb)d3bqN7AtsWQqZ9b)dhA1NR/R1RryFRNU+4SqVKNEM4MqMRsSF7SqVqAaMMNVQ5/RsAVDMStT1R+eZ6N4V6lPsGVtFMsAHMMT+4S3MSt6sSJeHhV44Y0DNW4tF4Sn1MSU1xAWI4roMMNxZAA4MR5PN6XE1cS1wMVwmSNWNDnaFGQaFebGEUARs3T6sq5atFb)4WV1Ne0rmqspQ5/RE5pP+K2rsRtINRs2EUMPs3TZF3QoN5V6d621wWXiQc4xCqz6CDAWNDnaF7BeHhV44Y0DNUVosA4VxMStxWV3MhVTFSSrx4AFQcVqsGXEsUr+dDNUF7SWxGVrmqspQ5z/4SXqHWNrs3NedDN4d4SXNqzTNZSrx4AFQcVqsGXEMZs2HvmTF7SAFq4TNZSrx4AFQcVqsGXEMZs2QvNUF7SxxFSrmKS+FRV5VAVNmZ2ntU41wMSwd6SAIxAtF6r2M3z6CDAWNDnaF7rZQhVGE62NMKlKQKS1wM46FhSAIxAtF6r2Mht5d74DNUTZsUrbxMStQMNAIFSrmKS+49bDQqn3VSrEMZs2HvmTF7SAFq4TNZSrxMr)m4XDNUTSsSX+HhN5QhA1Ne05NZ3z+METxAmPshVEt6BaERNUF7S1VKlRsAS1Q5z/MRXK+K2CM44ZHvt5sU43N6AtF4Snd3Svd6SAIxAtF6r2MhtF47ARHANEMZs2HvmTF7SAFq4TNZSrxMr)m4XDMStrsRrMZAAFEGV1Ne0yNZ3z+METxAmPshVEM4JeH7NZE6A3tMzzN4z9+MV6EG2WI4resRt1mYbFxU0KHA+osRrMw5z6H7s1VqA6Qc4ZN9bDZhz3NANEt6BaERNUF7S1VqAaQqN24AASFh21VqTZsAEaQYpR1cSXw5TSQRrVQ5/RZSVqMK2e1KsqZUN)EWVqN3zzFGsqQ6sDd5XJH5AFFSSrxvN4VWsDN5AtsAEaHxNFZhzqwWVtFxrItvV)Zv21VqTZsAEaQYpRs5nNVKNCs6tbxMS6FhSAIxAtsAMqVRt5m4SqMK2nMZsZw6N5VU41Ne0t1KQaQvQTFh21VqTZsAEaVDN4MDADN55K1R+eQvsDsAV1NR/R1RryFRNU+4Sq4ZmRs3NqQ6sDE3aPH5TrsSXqQSAtF7SAtFSrmKS+ERN)s5nRVcVnQcMqtvt5x6XNN5ctF4SnQ4tt1xAWI4BKs6rqZ6QRMRAK4ZNSsSJeCebD4SV1Ne054G3z+METxWVqH6NEsKsZQvV4VU4DMSretWsKMqz6CcNAIFSrmKS+ERN)s5nRVcVnQcMqtvtF47AqHWmKF3QotMV6d621VqTZsAEawRsDZhAqsSrEM4XI4UN4Z4SXx4rTt5NZFRNUFh21VqTMtAEa+vsDZ3sRmZ2Y1Rt9xMStQMNXIFSrmKS+Eqr)45nN44Vn1qNeZUN)MRS1Ne0YF4QKHMMT+4SqVSVTsSJeHhV44Y0DNUVosA4VxMStxAS3MGNT1qNVxMETxWVJHANEM44ZQFb5Q3nNVqATsWS1wM46FhSAIxAtsWtZHvtFEhzK44+osSXx+vmTF7SxNKVTNZSrxvmDMRSDMSVeQDEa+YbDmSSXNKMzNZ3z+METxWVJHANEF6r2Mht5+Rz3xMzzmc/c1MMT1xAWI4BKF6rMZ5r)m4XDNUVosA4VxMStxAS3MGNT1qNVxMETxWVJHANEF6r2MhtFx6X3VDctFMsAFqV6d621VqTMtAEa49bDQqnNMGJKF3Qod3SvFhSAIxAts6rMQYpRdSV1NR/R1RryFRNU+4SqVqctFZsqQ7mD4SVWI4BRsWmaQ7mDd4SXVRNetWtxMqETxWsqVW2rs6BqM5z6HGQPHUTCs5trxvmRV5nNNANeMM5aERN)dhXJN3zzNxMz+METxU0NNAtEM44ZQFb5Q3aPN3zzmcz945V6d621VK2C1DEa+vsDZ3sRmZ2tF3Qo+3SvERSAIxAttAXxNRtFEhzK44+osSX+Q7mRd4SXNDnTNZSrxxNF43sDMGXiQc4xCRtFx6XK4MctFMQPHMMT+4SN44Vn1qN9xMS6d6SAIxAtM44ZQFb5Q3n3HWlKs5t1wMz/4SV3HWVYQRtpxMETx5bKNWNZMM5aVc5REUX1Ne0YF4zpHMMT+4SNMhVZs6+eZ6s4E62qIMzzN43z+METx5bKNWNZMM5atFb)4WV1Ne0CNxMz+METx5bKNWNZMM5atFbDZSV1Ne05mqspQ5z/4SXqHWNrsSXIdqz6CcNAIFSrmKS+49bDM4SXNDnTNZSrxMr)m4XDNUTSs3NIQMz6CeSWNDnaF7rZQhVGE62NMK2as6rqQMz6CDXxNDnTNZSrxMr)m4XDNUTSsSX+Q7mRd4SXNq4CmqspQ5z/MRXK+K2aM4Eatvs)Qe0KIMzz43spHMMT+4SJH5AFs3NGdRN4Z4SXx4rCM44ZHMzt+4SJH5AFsSXx+vs)45nqwArot5t1wMVwVFSAIFSrmKS+49bDQqnNMGXitAEatFb)4WV1Ne0GmqspQ5z/MRXK+K2CM44ZHvtF47AqIMzzN4zpHMMT+4SJH5AFsSXx+vs)45nK4xttFMQc1MMT1xAEN7At1cX+dRV)4Y0RHAN/F3sitq/RmMsK44V51RtIH7N545n3HWlKs5t1wM/Rmv2KN5AMMx41Q5/RZSVqMK2e1KQPxM3Rs6X3VStZmKS+ERN)s5aPHABRs3NGdRN4Z4SXx4BRtA4Z+M/DMRXKtMzaFGsIMRNZE6JPVRNEtWQaQvs)sAN1NR/R1RryFRNU+4Sq4ZmRs3N2xvNZEU4qsStZQKS1wM4S1xAWI4BKs6rqZ9b)xWsDM3TSsRrKw6NDFSSXx4rYsRtxFqzt+4Sq4ZmRs3NqQ6sDE3aPH5TeMZtIHhERZ4SXVRNetWtxMqETxWVqH6NEsWsyHSA2E6XqVGXEQKs2tMz6CqbWNDnaFGsIMRNZEUbRs3Tns6t+Z9pRmMbqN3zzNZ3z+METxWVqH6NEsKsZQvV4VU4DMGJo1RtxMqz6CDAWNDnaFGsIMRNZEUbRs3Tns6t+ZA5RmvSqN5ctFMsb+MV6d621VqTZsAEawRsDZhAqsSrEM4JeMRN)d4SXNq4TNZSrxvN4VWsDN6ziQKtIMcAZE5bKVSVas5t1wMz/4hz3VqctmKS+Eqr)45nN44Vn1qNeZUN)mFS1NefzFM+z+METxWVJHANEM44ZQFb5Q3n3HAVTF3Qo+3SvERSAIxAtsWtZHvtFEhzK44+os3NGdRN4Z4SXx4rCsRrMMqzt+4SqVSVTsSJeHhV44Y0DMSretWsbxMS6d6SAIxAtsWtZHvtFEhzK44+osSXx+vmTF7SxNDnTNZSrxvmDMRSDMSVeQDEa+YbDmSSXNKMzNZ3z+METxWVJHANEF6r2Mht5+Rz3xMzzmc/c1MMT1xAWI4BKF6rMZ5r)m4XDNUVosA4VxMStx5bRHANZFSSrxvmDMRSDMSVeQDEatFb)4WV1Ne0CNxMz+METxWVJHANEF6r2MhtF47AqIMzz43spHMMT+4SqHANe1KsyMqz6HhANwWNZmKS+VRNUF7SqVqAaMMNVQ5/RsAVDN5AaQKS1wvmRmv2NN5caFGsqMRtFESVqH62tFZsqQ7mD4SVWI4BRsWmaFDmRmxADN5TZtA4245z6CqbWNDnaFGQaFebGEUARs3T6sq5aQ3z6CDXX4KVTNZSrxxNF43sDMGXiQc4xCRt5FSSXxv5zFM+z+METxU0NNAtEM44ZQFb5Q3nNVqATsWS1wMMT1xAWI4roMMNxZAA4MR5PN6XEMZs2QvNUF7SxxFSrmKS++vsDZ3sRIMzzF4QKHMMT+4SN44Vn1qNeZUN)EWVqN3zzFGQqQ5rD4h/PH9StmKS+FRV5VAVNmZlRMZQa+3z6CDXXx7nTNZSrx4AFQcVqsGXEscMaQ6mTF7SAxFSrmKS+FRV5VAVNmZ2S1RrMEqz6CqbAtFSrmKS+FRV5VAVNmZ2S1RtIMqz6CqNWNDnaF7rxMhN)VUADM3ToF3Qo45MT1xAWI4rM1RtNxMS6d6SAIxAtF6r2Mht5d74DN5TnF3Qo1MV6d621wAVeQDEaQAAZE62qH6NnF3Qo+St6d6SAIxAtF6r2Mht5d74DMSretWsbxMS6NMbWNDnaF7rZQhVGE62NMK2SsRrKCRETF7SxNDnTNZSrxMr)m4XDNUVosA4VxMStxU0NVGXoMMNZQvNUFh21wAVeQDEaFcA4MRSDN6NSt5NnxMStQxTX4DnTNZSrxMr)m4XDMStrsRrMZA5RmvSqIMzzNMbAHMMT+4SJH5AFsSXx+vs)45nNMGJKF3Qod3MT1xAWI4rM1RtKZAAFEhz3MK2ntU41wM4wm7AWNKJamKS+Vc5RVAVNM3TetWsIH7mRM4SXw62t1RrxQvsDs6XK44VotAEa+7N5ZSV1Ne0t1RryMYbDMqb1xxAtsAMqVRt5m4SqxMzzsWs2QAA5Zv21VqTZsAEaQYpRs5n3HWlKs5t1wM/Rs62Rs7n9F6r2M3zt+4Sq4ZmRs3N2xvNZE6S3M3TisUBKxMS/Z74KH5caFGsIMRNZE6JPVRNEMZQqFRNDd4SXNq4TNZSrxvN4VWsDN5AtsAEaQ45RMDrqNWNSF3QoxxN)MqbNtMzaFGsIMRNZEWs344Vrs3N2EebDEhARshNZF3siVeb)d3bqN7AtsAMqVRt5s62RsGXE1RrI+vtFs6XNxMzzNxMz+METxWVqH6NEsKsZQvV4VU4DNAreMMNVxMS6d6SAIxAtsAMqVRt5HhzKV3TZM4Ea+vs4mMbqN3zzNZ3z+METxWVqH6NEsKsZQvV4VU4DMSretWsKMqz6CRAAIFSrmKS+ERN)s5nRVcVnQcMqtvtF47AqHWmKF3QoFqV6d621VqTZsAEawRsDZhAqsSrEM4XI4UN4Z4SXx4rCsRrMMqzt+4SqVSVTsSJeHhV44Y0DNUVeFWS1wMSvERSAIxAtsWtZHvtFEhzK44+os3NGH7NtF7SWx3XMmqspQ5/RZSN3MK2rsRtINRs2EUX3N5TZF3Qox4A5MRSqN3zaFGsI4UNZEUARs3T6sq5atFb)4WV1Ne0rmqspQ5/RZSN3MK2rsRtINRs2E5bN4xctFMQP+MV6d621VqTMtAEa49bDQqn3H55zF3Qod3Svd6SAIxAtsWtZHvtFMRXK+K2YsRBzxMStQxTX4DnTNZSrxvmDMRSDMSVeQDEa+7N5ZSV1Ne0tMMNZHvNUFh21VqTMtAEa49bDQqnNVqATsWS1wM4CNvSAIxAtsWtZHvtFMRXK+K2CM44bxMS61DAWNDnaFGQqHFb)x62qN3zzsWs2QAA5Zv21VRNZF3siVeb)d3bqN7AtsWQqZ9b)dhA1NR/R1RryFRNU+4SqVKNEM4MqMRsSF7SqVqAaMMNVQ5/RsAVDMStT1R+eZ6N4V6lPsGVtFMsAHMMT+4S3MSt6sSJeHhV44Y0DNW4tF4Sn1MSU1xAWI4roMMNxZAA4MR5PN6XE1cS1wMSvERSAIxAttAXxNRtFEhzK44+osSX+Q7mRd4SXNDnTNZSrxxNF43sDMGXiQc4xCRtFx6XK4MctFMQPHMMT+4SN44Vn1qN9xMS6d6SAIxAtM44ZQFb5Q3n3HWlKs5t1wM/R47VNM3Tot5t1Q5z/4SXqHWNrs3NqtxN5Q4SXxvAMNZ3z+METx5bKNWNZMM5aCDN5dGV1Ne0SmqspQ5z/4SXqHWNrsSX+Q7mRd4SXNDnTNZSrx4AFQcVqsGXEMZs2QvNUF7SxxFSrmKS+FRV5VAVNmZ2ntU41wMSwd6SAIxAtF6r2M3z6CDAWNDnaF7rZQhVGE62NMKlKQKS1wM3T1xAWI4rM1RtKZUmDx5n34ZmRQKS1wMVw1DAWNDnaF7rZQhVGE62NMK2S1RrMEqz6CqbAtFSrmKS+49bDQqn3VSrEMZsZw6QDd4SXNebrmqspQ5z/MRXK+K2Yt5NIMqz6CcS3MGXrtAXxHhV4Z4SWI4rM1RtKZAAFEhz3MKlRMZQa+3z6CDXAx3XrmqspQ5z/MRXK+K2CM44ZHvtFx6X3VDctFMsAFqV6d621wAVeQDEaFcA4MRSDMStrsWS1wM4wd6SAIxAtF6r2MhtF47ARHANEQc47xMS6VFSAIFSrZ5trxxN)mvSKH5AaFS42Q3z6H7s1VqA6Qc4ZN9bDZhz3NANEt6BaERNUF7S1VRXiQKtIQYpRdSV14Z2TtW+KxMETxWVqH6NE1Rr+Vqz6HhANwWNZmKS+ERN)s5aPHABRs3NGdRN4Z4SXx4BRtA4Z+M/DMRXKtMzaFGsIMRNZE6JPVRNEtWQaQvs)sAN1NRznMxBqMqETxWVqH6NE1Rr+VRtFxAVNNWNnF3Qo+qV6d621VqTZsAEaQYpRs5nKVSris5NKMcAtF7S1VDViM4XAxMETxWVqH6NEsWsyHSA2E6Xq4MArQc4ZN6NUF7SqVqAaMMNVQ5/RZSVqMKlRtA4Z+vt5mZVNmZ251Rt1xMS6NvSAIxAtsAMqVRt5HhzKV3TZM4EaxFbD4SV1Ne0rmqspQ5/RZSVqMK2PsRtIQvNDx5nN4vXeMMNVxMS6d6SAIxAtsAMqVRt5HhzKV3TZM4EatFb)4UrqN3zz4SspHMMT+4Sq4ZmRs3NiHhEDZSVNMK2CM4MqMRmTF7SAtFSrmKS+ERN)s5nRVcVnQcMqtvtF4hAJHUTZF3Qox4A5MRSqN3zaFGsI4UNZEUARs3T6sq5a+YbDmSSXNqXMmqspQ5/RZSN3MK2rsRtINRs2EUXRH9StF4Sn1MSU1xAWI4BKF6rMZAA4MR5PN6XEt6BaERNUF7S1wAtitWsVxMETxWVJHANEM44ZQFb5Q3nNVqATsWS1wMMT1xAWI4BKF6rMZAA4MR5PN6XEM4JeEqz6CqNAIFSrmKS+Eqr)45nJH5AFs3NGQ3BTF7SAx3XrmqspQ5/RZSN3MK2M1RtKZUN)MRS1Ne0YN4z9+MV6d621VqTMtAEa49bDQqn3HWlKs5t1wMz/4hz3VqctmKS+Eqr)45nJH5AFsSX+Q7mRd4SXNq4CmqspQ5/RZSN3MK2M1RtKZAAFEGV1Ne05NZ3z+METxAV3VqAttA4VxM3Rs6X3VStZmKS+VRNUF7SqVqAaMMNVQ5/RsAVDN5AaQKS1wvEDxUVqN7AtsWQqZAA4VAVRtMzzQKt++RNU+4SqVKNEMMNMQSA2EWVqHUTeF5t1wM4S1xAWI4roMMNxZAA4MR5PN6XE1qt1wMVwmSNWNDnaFGQaFebGEUARs3T6sq5axMz6CDXX4KVTNZSrxxNF43sDMGXiQc4xCRtFx6X3VDctFMQc+qV6d621VK2C1DEa+vsDZ3sRmZ2S1RtIMqz6CqNWNDnaF7BeHhV44Y01Ne0rmqspQ5z/EhzK44+os3NGdRN4Z4SXx4r6QRtxQxN5Q4SWI4rCQqmqMcA2EWsNVK2YF3Qo+3Swd6SAIxAtM4XKMRNDE3nR4Z2asWS1w4+T1xAWI4rCQqmqMcA2EUMPHAmKF3QoFq4S1xAWI4rCQqmqMcA2EUMPs3TZF3QoQMV6d621wAtFs6Bq+vtFZ701Ne0MNZ3z+METxAmPsSAtFMspHMMT+4SJH5AFs3Nytvt5ZhA1Ne05mqspQ5z/MRXK+K2aM4EaQ6N)s6A1Ne0rmqspQ5z/MRXK+K2aM4EatFb)4WV1Ne0CNxMz+METxAmPshVEtWt+ZA5RMDrRV7ctFMspHMMT+4SJH5AFs3NGdRN4Z4SXx4roMZ+edcA5MRAqN3zaF7rZQhVGE5bN44VTs3NqtxN5Q4SXxvAyNMQPHMMT+4SJH5AFsSXx+vs)45nNVqATsWS1wM4CNvSAIxAtF6r2MhtF47ARHANEM4JeEqz6CDTxxFSrmKS+49bDQqnNMGXitAEaQxNSF7SAx3XrmqQeE5ETxU4KHANTsRrMw5z6H7s1VqA6Qc4ZN9bDZhz3NANEt6BaERNUF7S1VRXiQKtIQYpRdSV14Z2TtW+KxMETxWVqH6NE1Rr+Vqz6HGQPHUTCs5trxvN4VWsDN5AtsAEa+7N5ZSV1Ne0tsWsyHS5TESmPsSAtmKS+ERN)s5aPHABRs3NMdRV4MKsJN3zzQKt++RNU+4Sq4ZmRs3N2xvNZEU4qsStZQKS1wM4t1xAWI4BKs6rqZ9b)xWsDM3TSsRrKw6NDFSSXx4rttAXICqzt+4Sq4ZmRs3NqQ6sDE3aPH5TeMZtIHhERZ4SXVRNetWtxMqETxWVqH6NEsWsyHSA2E6XqVGXEQKs2tMz6CqbWNDnaFGsIMRNZEUbRs3Tns6t+Z9pRmMbqN3zzNZ3z+METxWVqH6NEsKsZQvV4VU4DMGJo1RtxMqz6CDAWNDnaFGsIMRNZEUbRs3Tns6t+ZA5RmvSqN5ctFMsb+MV6d621VqTZsAEawRsDZhAqsSrEM4JeMRN)d4SXNq4TNZSrxvN4VWsDN6ziQKtIMcAZE5bKVSVas5t1wMz/4hz3VqctmKS+Eqr)45nN44Vn1qNeZUN)mFS1NefzFM+z+METxWVJHANEM44ZQFb5Q3n3HAVTF3Qo+3SvERSAIxAtsWtZHvtFEhzK44+os3NGdRN4Z4SXx4rCsRrMMqzt+4SqVSVTsSJeHhV44Y0DMSretWsbxMS6d6SAIxAtsWtZHvtFEhzK44+osSXx+vmTF7SxNDnTNZSrxvmDMRSDMSVeQDEa+YbDmSSXNKMzNZ3z+METxWVJHANEF6r2Mht5+Rz3xMzzmc/c1MMT1xAWI4BKF6rMZ5r)m4XDNUVosA4VxMStx5bRHANZFSSrxvmDMRSDMSVeQDEatFb)4WV1Ne0n43+z+METxWVJHANEF6r2MhtF47AqIMzz43spHMMT+4SqHANe1KsyMqz6HGQPHUTCs5trxvmRZ4SXVRNetWtxMqETxWsqVW2etWtbxM3Rs6X3VStZmKS+VRmqEUAqHWNmF3siQ4A/VAVWI4BRsWmaFDmRmxADN5TZtA4245z6CRAWNDnaFGQaFebGEUARs3T6sq5aQ3z6CDXX4KVTNZSrxxNF43sDMGXiQc4xCRt5FSSXxv5zFM+z+METxU0NNAtEM44ZQFb5Q3nNVqATsWS1wMMT1xAWI4roMMNxZAA4MR5PN6XEMZs2QvNUF7SxxFSrmKS++vsDZ3sRIMzzF4QKHMMT+4SN44Vn1qNeZUN)EWVqN3zzF7Bq+Mzt+4SNMhVZs6+eZ6N/xU03N3zzmc/K+MV6d621wAtFs6Bq+vt5Q7034xctFMs1HMMT+4SNMhVZs6+eZA5RmvSqIMzzNMbAHMMT+4SNMhVZs6+eZA5RmvAqN3zz4S3z+METx5bKNWNZMM5aQxNSF7SXx7nTNZSrxMr)m4X1Ne0rmqspQ5z/MRXK+K2aM4EaERETF7SAxFSrmKS+49bDQqn3VSrEtAMqVRETF7SWxYbrmqspQ5z/MRXK+K2aM4EatFb)4WV1Ne0SN43z+METxAmPshVEtWt+ZA5RMDrRV7ctFMQP+MV6d621wAVeQDEa+7N5ZSV1Ne0tMMNZERNDQRXJs34tmKS+49bDQqnNMGXitAEaVc5REUX1Ne0YN4z9+MV6d621wAVeQDEaFcA4MRSDMSretWsbxMS6d6SAIxAtF6r2MhtF47ARHANEM4JeEqz6CDTWNDnaF7rZQhVGE5bN44VTsSXIdqz6CDTX4DnTNZtnQ5z/4hXqVqc9scMqQhmTF7SJt4re1cXIHhERmvARHW2Ts3NGdRN4Z4SXx4retWtKQ3rDN4SWI4BKs6rqZ9b)xWs1NR/R1RryFRNU+4Sq4ZmRs3N2xvNZEUX3N5TZF3QoxvmRdhzNIZXM1RtNxMETxWVqH6NE1Rr+VRt54U0K44ERF5t1wvEDxUVqN7AtsAMqVRt5m4SqMK2Ss6txMRETF7SAtFSrmKS+ERN)s5aPHABRsSXItvs)QDrqs3ztF4S++hsD43b1xxAtsAMqVRt5s62RsGXE1RrIQS5DZhzKVqctFZsqQ7mD4SVWI4BKs6rqZ6mRdhzNmZ2esW+eZ6ERmx41Ne0CmqspQ5/RZSVqMK2PsRtIQvNDx5aPVqACs5t1wMMT1xAWI4BKs6rqZ6QRMRAK4ZNSsSJeCebD4SV1Ne0rmqspQ5/RZSVqMK2PsRtIQvNDx5nNVqATs5NVxMS6dxAWNDnaFGsIMRNZEUbRs3Tns6t+ZAAFESVqHUctFMsAHMMT+4Sq4ZmRs3NiHhEDZSVNMK2CQKtZQ6NUF7S1wAtitWsVxMETxWVJHANEM44ZQFb5Q3n3H55zF3Qo1MSU1xAWI4BKF6rMZAA4MR5PN6XEt6rZHMz6CDXX4KVTNZSrxvmDMRSDMGXiQc4xCRt5+D0q4MctF4S+FRs)4AV1xxAtsWtZHvtFEhzK44+osSX+Q7mRd4SXNDnTNZSrxvmDMRSDMGXiQc4xCRtF47AqIMzz43spHMMT+4SqVSVTsSXZQhVGEUJPs3XtFMQc1MMT1xAWI4BKF6rMZ5r)m4XDNUVitAS1wMVwVFSAIFSrmKS+Eqr)45nJH5AFs3NGdRN4Z4SXx4rCsRrMMqzt+4SqVSVTsSXZQhVGEUMPHAmKF3QoFq4S1xAWI4BKF6rMZ5r)m4XDMStrsWS1w4t6d6SAIxAts6rMQYpRdSV1NRznMxBqMqETxWsqN3zzsWs2QAA5Zv21VRNZs3N2Q6ETF7SqVqAaMMNVQ5/RsAVDMGXZs6raxM3Rs6X3VStZmKS+VRmqE5b3VqArs3NIMDN4m4N1Ne0CmqspQ5/RE5pP+K2rsRtINRs2E6X1Ne0YF4QKHMMT+4S3MSt6sSJeHhV44Y0DN5ztF4Sn1MSU1xAWI4roMMNxZAA4MR5PN6XEMZs2HvmTF7SAIFSrmKS+dcA543nN44Vn1qNeZA5RmvAqN3zz4S3z+METxUARs3T6sKS1wMMT1xAWI4rrsRtINRs2EUX3N5TZF3QoxvN)dSNNNAVetAS1Q5z/4SXqHWNrs3NqtxN5Q4SXxvAMNZ3z+METx5bKNWNZMM5aCDN5dGV1Ne0SmqspQ5z/4SXqHWNrsSX+Q7mRd4SXNq4CmqspQ5z/4SXqHWNrsSX+QhV4Z4SXNebTNZSrx4AFQcVqsGXEQc47xMS6EDAWNDnaF7rZQhVSF7SAIFSrmKS+49bDQqn3VSrEsWtbxMS61RSAIxAtF6r2Mht5d74DNUTZsUrbxMS6d6SAIxAtF6r2Mht5d74DMSretWsbxMS6NMbWNDnaF7rZQhVGE62NMK2SsRrKCRETF7SAIFSrmKS+49bDQqn3HWlKs5t1wMz/4SXqHWNrFSSrxMr)m4XDMStrsRrMZ6N/xU03N3zzmc/c1MMT1xAWI4rM1RtKZAAFEhz3MK2S1RrMEqz6CqbAtFSrmKS+49bDQqnNMGXitAEaFcA4d4SXNq4rmqspQ5z/MRXK+K2CM44ZHvtFZ701Ne0yF4spHMMDQv21wAtatAXKH7mRM4SXw62t1RrxQvsDs6XK44VotAEa+7N5ZSV1Ne0t1RryMYbDMqb1xxAtsAMqVRt5m4SqxMzzsWs2QAA5Zv21VqTZsAEaQYpRs5n3HWlKs5t1wMz/x6X3VqTot5+e49bDM4SWI4BKs6rqZ9b)xWsDNANoQc4ZVqrUF7SKVSrGs5trxvN4VWsDN5AtsAEatvND4SVKIMzzNxMz+METxWVqH6NE1Rr+VRtFZ74RH6V/s6t1xMStxAS3M3)oFSSrxvN4VWsDN6NasR+eZ9b)ZhXNV3TiQKsVxM3Rs6X3VStZmKS+ERN)s5nqVDTiMM5aQhmDE3nKVqASF3QoFqV6d621VqTZsAEawRsDZhAqsSrE1Ks2FRNUF7SAIFSrmKS+ERN)s5nRVcVnQcMqtvtFEYfPsStZF3Qo+MV6d621VqTZsAEawRsDZhAqsSrEMZs2HvN5Z4SXNDcrmqspQ5/RZSVqMK2PsRtIQvNDx5nNMGXZs6rbxMS6NvSAIxAtsAMqVRt5HhzKV3TZM4EaFREDMR2qN3zzF7rxH7mRZ4SWI4BKF6rMZAA4MR5PN6XEt6r21Mz6CeSXNYSrmKS+Eqr)45nN44Vn1qNeZUN)MRS1Ne0YF4QKHMMT+4SqVSVTsSJeHhV44Y0DNUVosA4VxMStx5bRHANZFSSrxvmDMRSDMGXiQc4xCRtFx6X3VDctFMspHMMT+4SqVSVTsSJeHhV44Y0DMStrsWS1w4t6d6SAIxAtsWtZHvtFMRXK+K2Y1Rt9xMS6VFSAIFSrmKS+Eqr)45nJH5AFs3NGH7NtF7SWxGMzNZ3z+METxWVJHANEF6r2Mht5+D0q4MctF4S+FRs)4AV1xxAtsWtZHvtFMRXK+K2S1RrMEqz6CqbAtFSrmKS+Eqr)45nJH5AFsSXx+vmTF7SxNDnTNZSrxvN)46JPVDTZF3siVeb)d3bqN7AtsWsVxM3Rs6X3VStZmKS+VRmqE6X3V7ctFxrItvV)Zv21VRNZsSJeMRN)QASXw5TSQRrVQ5/RsAVDMStT1R+eZ6N4V6lPsGVtFMQcQMV6d621VK2C1DEa+vsDZ3sRmZ2eF3Qo+3SvERSAIxAttAXxNRtFEhzK44+os3N1xMStQFSXNYSrmKS+dcA543nN44Vn1qNeZA5RmvSqIMzzNZ3z+METxU0NNAtEM44ZQFb5Q3nNVqAns5t1w4tt1xAWI4rrsRtINRQTF7SX4KVTNZSrx4A4MR5PN6XEt6BaERNUF7S1VKlRsAS1Q5z/4SXqHWNrs3NqtxN5Q4SXxvAMNZ3z+METx5bKNWNZMM5aCDN5dGV1Ne0SmqspQ5z/4SXqHWNrsSX+Q7mRd4SXNq4CmqspQ5z/4SXqHWNrsSX+QhV4Z4SXNebTNZSrx4AFQcVqsGXEQc47xMS6EDAWNDnaF7rZQhVSF7SAIFSrmKS+49bDQqn3VSrEsWtbxMS6VxTWNDnaF7rZQhVGE62NMK2as6rqQMz6CDXxxG4TNZSrxMr)m4XDNUTSsSX+Q7mRd4SXNebrmqspQ5z/MRXK+K2aM4Eatvs)Qe0KIMzz4SspHMMT+4SJH5AFs3NGdRN4Z4SXx4rosWQPxMETxAmPshVEM4JeH7NZEWsNVK2YF3Qo+34wm7AWNDnaF7rZQhVGE5bN44VTsSX+Q7mRd4SXNebrmqspQ5z/MRXK+K2CM44ZHvtF47AqIMzzN4zpHMMT+4SJH5AFsSXx+vs)45nK4xttFMQc1MMT1xAEN7AtMMNMMeb)+hz3VcAtFxraxFb)4hARshNeQc4ZdDNZEUX3N5TZF3QoxFb)dSJPsSVCFSSrxvN4VWsDN5AtsAS1wvmRmv2NN5caFGsIMRNZE6JPVRNEt6BaERNUF7S1VRNasRtpm3r)m4X1xxAtsAMqVRt5m4SqMK2TtAXIHhN/EcSXVRNetWtxMqETxWVqH6NE1Rr+VRtFxAVNNWNnF3QoFqV6d621VqTZsAEaQYpRs5nKVSris5NKMcAtF7S1VDViM4XAxMETxWVqH6NEsWsyHSA2E6Xq4MArQc4ZN6NUF7SqVqAaMMNVQ5/RZSVqMKlRtA4Z+vt5mZVNmZ251Rt1xMS6NvSAIxAtsAMqVRt5HhzKV3TZM4EaxFbD4SV1Ne0rmqspQ5/RZSVqMK2PsRtIQvNDx5nN4vXeMMNVxMS6d6SAIxAtsAMqVRt5HhzKV3TZM4EatFb)4UrqN3zz4SspHMMT+4Sq4ZmRs3NiHhEDZSVNMK2CM4MqMRmTF7SAtFSrmKS+ERN)s5nRVcVnQcMqtvtF4hAJHUTZF3Qox4A5MRSqN3zaFGsI4UNZEUARs3T6sq5a+YbDmSSXNqXMmqspQ5/RZSN3MK2rsRtINRs2EUXRH9StF4Sn1MSU1xAWI4BKF6rMZAA4MR5PN6XEt6BaERNUF7S1wAtitWsVxMETxWVJHANEM44ZQFb5Q3nNVqATsWS1wMMT1xAWI4BKF6rMZAA4MR5PN6XEM4JeEqz6CqNAIFSrmKS+Eqr)45nJH5AFs3NGQ3BTF7SAx3XrmqspQ5/RZSN3MK2M1RtKZUN)MRS1Ne0YN4z9+MV6d621VqTMtAEa49bDQqn3HWlKs5t1wMz/4hz3VqctmKS+Eqr)45nJH5AFsSX+Q7mRd4SXNq4CmqspQ5/RZSN3MK2M1RtKZAAFEGV1Ne05NZ3z+METxAV3VqAttA4VxMS/Z74KH5caFGsqMqz6HGQPHUTCs5trxvmRV5aPHUTnF3siQ4A/VAVWI4BRsWma+vN)VA21NRznMxBqMqETxWsqVW2CtWs2+vt5ZSV34MAMF3QoFqV6d621VK2C1DEa+vsDZ3sRmZ2eF3Qo+3SvERSAIxAttAXxNRtFEhzK44+os3N1xMStQFSXNYSrmKS+dcA543nN44Vn1qNeZA5RmvSqIMzzNZ3z+METxU0NNAtEM44ZQFb5Q3nNVqAns5t1w4tt1xAWI4rrsRtINRQTF7SX4KVTNZSrx4A4MR5PN6XEt6BaERNUF7S1wAretWsIdDNUFh21wAtFs6Bq+vt5sU43N6AtF4Sn45MT1xAWI4rCQqmqMcA2E903NU)KF3QotMV6d621wAtFs6Bq+vtFx6X3VDctFMsb+MV6d621wAtFs6Bq+vtFx6XK4MctFMQPHMMT+4SNMhVZs6+eZ6V4tSSXNKVrmqspQ5z/MRXKtMzzNZ3z+METxAmPshVEtWt+Z6mDd4SXNqXTNZSrxMr)m4XDNUTSs3NyMRN/d4SXxvA5NZ3z+METxAmPshVEtWt+ZA5RmvSqIMzzNMbAHMMT+4SJH5AFs3NytvtFx6zqN6XnF3QoN5MT1xAWI4rM1RtKZUN)EWVqN3zzFGsqQ6sDdASWI4rM1RtKZAAFEhz3MKlRMZQa+3z6CDXAx3XrmqspQ5z/MRXK+K2CM44ZHvtFx6X3VDctFMsAFqV6d621wAVeQDEaFcA4MRSDMStrsWS1wM4wd6SAIxAtF6r2MhtF47ARHANEQc47xMS6VFSAIFSrZ5trx4AFZhX3VqTitWsNxMS/QA3PHAtnsRtqQhV4MD03MK2Yt5NIMqz6Cc3PHUTF1RtZFqzt+4Sq4ZmRs3N2xvNtF7SKVSrGs5trxvN4VWsDN5AtsAEa+7N5ZSV1Ne0tsWsyHS5TESmPsSAtmKS+ERN)s5aPHABRs3NMdRV4MKsJN3zzQKt++RNU+4Sq4ZmRs3N2xvNZEU4qsStZQKS1wM4U1xAWI4BKs6rqZ9b)xWsDM3TSsRrKw6NDFSSXx4rYsRtxFqzt+4Sq4ZmRs3NqQ6sDE3aPH5TeMZtIHhERZ4SXVRNetWtxMqETxWVqH6NEsWsyHSA2E6XqVGXEQKs2tMz6CqbWNDnaFGsIMRNZEUbRs3Tns6t+Z9pRmMbqN3zzNZ3z+METxWVqH6NEsKsZQvV4VU4DMGJo1RtxMqz6CDAWNDnaFGsIMRNZEUbRs3Tns6t+ZA5RmvSqN5ctFMsb+MV6d621VqTZsAEawRsDZhAqsSrEM4JeMRN)d4SXNq4TNZSrxvN4VWsDN6ziQKtIMcAZE5bKVSVas5t1wMz/4hz3VqctmKS+Eqr)45nN44Vn1qNeZUN)mFS1NefzFM+z+METxWVJHANEM44ZQFb5Q3n3HAVTF3Qo+3SvERSAIxAtsWtZHvtFEhzK44+os3NGdRN4Z4SXx4rCsRrMMqzt+4SqVSVTsSJeHhV44Y0DMSretWsbxMS6d6SAIxAtsWtZHvtFEhzK44+osSXx+vmTF7SxNDnTNZSrxvmDMRSDMSVeQDEa+YbDmSSXNKMzNZ3z+METxWVJHANEF6r2Mht5+Rz3xMzzmc/c1MMT1xAWI4BKF6rMZ5r)m4XDNUVosA4VxMStx5bRHANZFSSrxvmDMRSDMSVeQDEatFb)4WV1Ne0rmqspQ5/RZSN3MK2M1RtKZAAFEGV1Ne05NZ3z+METxAV3VqAttA4VxM3Rs6X3VStZmKS+VRNUF7SqVqAaMMNVQ5/RsAVDN5AaQKS1wvEDxUVqN7AtsWQqZAA4VAVRtMzzQKt++RNU+4SqVKNEMMNMQSA2EWVqHUTeF5t1wM4wdvSAIxAttAXxNRtFEhzK44+os3mcxMStQFSXNYSrmKS+dcA543nN44Vn1qNeZ9btF7SX4KVTNZSrxxNF43sDMGXiQc4xCRtFx6X3VDctFMspHMMT+4S3MSt6sSJeHhV44Y0DMSreQc4VxMS61RSAIxAtM44ZQFb5mSSXNqXMmqspQ5z/EhzK44+os3NGdRN4Z4SXx4BKtAXKHMzt+4SNMhVZs6+eZ6N/xU03N3zzmc/K+MV6d621wAtFs6Bq+vt5Q7034xctFMs1HMMT+4SNMhVZs6+eZA5RmvSqIMzzNZ3z+METx5bKNWNZMM5atFbDZSV1Ne05mqspQ5z/4SXqHWNrsSXIdqz6CcNAIFSrmKS+49bDM4SXNDnTNZSrxMr)m4XDNUTSs3NIQMz6CD4WNDnaF7rZQhVGE62NMK2as6rqQMz6CDXxNDnTNZSrxMr)m4XDNUTSsSX+Q7mRd4SXNq4rmqspQ5z/MRXK+K2aM4Eatvs)Qe0KIMzz43spHMMT+4SJH5AFs3NGdRN4Z4SXx4rosWQPxMETxAmPshVEM4JeH7NZEWsNVK2YF3Qo+34wm7AWNDnaF7rZQhVGE5bN44VTsSX+Q7mRd4SXNDnTNZSrxMr)m4XDMStrsRrMZAAFEGV1Ne0yNZ3z+METxAmPshVEM4JeH7NZE6A3tMzzN4z9+MV6EG2EN7AtM4XIQhV4V5nNNWNas6rxQxNFFSSXNebTNZtnQ5/RQcV3VKNS1RrrxMS/QA3PH6XCF3sitq/RmxVK4xttFxrItvV)Zv21VqAGQcMaZAAFZhXK4ZNCF3sit5z/4h23MhVitWsNxMETx5sNVK2G1qNeH7mRM4SWI4rCtWQqQhs5MRSqtMzaF7BzxvtU+43PshVrF3siVeb)d3bqN7At1RtK+vtF4h5Ps3TZMx41wvrSx5bK4MATsA4ZHvNSFh21VctStAJqNRs4MRSqtMzaF7rxHvN)m42RHAN/FSSrxMntx6VWI4BKs6r2wUN4Z4SXw5TSQRrVQ5/RZSEPH6VasWmaFRV4mvAqs34tF4Vax4AFZhX3VqTitWsNxMETx5b34Z2FsRrMw5zt+43PMSroQRrxCRs)4Ur1xxAtMMNMMeb)+hz3VcAtmKS+sMzZQv21wWXiM4XIdDmTF7SKVSrGs5trx4A4MqbK4Z2asSXxQFbDZSVNtMzzHU4+FRV4mvSq44VTsU41Q5z/xUV3VcNitWsNxMETx5b34Z2FsRrMw5zt+43PMSroQRrxCRs)4Ur1xxAtMMNMMeb)+hz3VcAtmKS+QhsDF3JPMSroQRrxCRs)4Ur1xxAtZAS+QqETx5pPNW2GQKS1wvEDxUVqN7AtMMNxdRVDZ3nNM3TeQcMqFqz6H7N1wAtn1RrMERs)4Ur1xxAtMMNydRV5MRSqtMzaFGsxtxNFV5sR44VTsU41Q5z/4hSqH5AmsRrMw5zt+4SEx4rKmKS+FRV5MR5PN5XtFxrItvV)Zv21w6VrtAEaFRN)+4SXNqzTNZtnQ5/RmvzN4ZNZsD41wMrSx5s3NUToM4S1wMzt4S4IERN4ZGEPFq4tFh21wAtFsRtINRQTF7SqVqAaMMNVQ5z/4SXRs3T6sq5aQxNGEA23VcERs5t1wvEDxUVqshAaFGs2HSAZEAVJVGXat5NZQMz6H7s1VctotAMatMz6CcS1QvN4ZGVq4M)KsA41xxAtM4XKHhV44Y01NR/R1RryFRNU+4SKVcVCQRr2Q6sDHhXK44VotAS1wvEDxUVqshAaFGs2NUN5MKVDNAre1qNYFRV4m4S1NRzhF7rxMhsDZ3sRIMzzQKt++RNDQv21VcrSs6r2M6t5d3s1NRzhFGs2NRV4MqmPs3TZF3QoxFb)dSJPsSVCFSSrxFb)ZGVRs3Tit5NMFRt54U0NVDVetWS1wvrSx6zqNANoMZsVmhNFxAV3Vq5Ks5t1Q5z/14SDN7At1qmaHvN4MRARHW2TMx41wvrSx5bK4MATsA4ZHvNSFh21wArGtWsMH7mRM4SWI4resRt1xMETx6XRs3z91cX+dRV)4Y0RHAN/FSSrxFbFxU0KHA+osRrMw5zt+4SNNANZ1RrYH7mRM4SWI4rCtAMaMhV5mv2RtMzaF7BzxvtU+4SqN5AYsWmaMRERV6SKV34tF4VaxvV5V6XN4Z2TFGtxMhsDZ3sRIMzaF7rKMebDE703xZXSs6rydeb)d4SWI4rcFSVnQ5/RQhzq4ZNEMMNedREDN4SXx4rtMZQqQhsSEhlPtMzaF7rxMDN4V5sKIMzzQKt++RNDQv21VRNSs6BqFRV4mvSq44VTsU41wMrSx5bK4MAnsRrAxM3Rs6X3VStZmKS+FRV5MR5PN5XtFZsqQ7mD4SVEN7AttAMqw6sDZ3aPHW4tFxraxvN)46JPVDTZsWS1wvEDxUVqN7Att6BaERNUF7S1VDTo1qN2Q5/Ds6zqsSAtZ5trxxN)mvSKH5AasSXZQhVSF7SJt4rt1RtxMqz6CcS34Z261RrrmhERMcVKtMzaFGsqdc5R4SVDMStn1RtIHYbSF7SKVSrGs5trxvs)45NqsSrns6t1xM3Rs6X3VStZmKS+FRN)dSEPM7ctF4S+ERsD4hJPVDTZsWS1Q5z/4h5Ps3Ti1D41wvEDxUVqshAaF7BetvND4SVKV34tFxraxxN4MqbKIMzzN43z+METx63PHUVZF3QoxxmRE6Sq4ZmRs6rMFRsDsAV1xxAtQc42x4ASF7S)FK4TNZSrtMV6d62AtFSrmcsbHMMT+xVWNDna4S3z+MVvMvSAIx5zmqspQ5z/14SDshAaF7rxQhmRV5nR4ZNesWS1wMrSx5bKNAVn1qN9xMS/Z74KHWmaZ6tnQ5/RMRSqVDttFxraxFb)xWsDNAVTsWS1wMrSx5s3NUTE1Ks2tMz6CcS1QvN4ZGVq4M)KsA41xxAt1qmaQ6t5x6XNNqztF4S1Nq)K1RAA4DcrZGEPxMETx5s3NUTEsRrIQ6NUF7S1xM4SdMs+IMMKxA4IxMzaFGsKQUNFM4SXw5TSQRrVQ5z/4Y03MhVEtA42xvN)+4SXw5TSQRrVQ5z/4Y03MhVEQc4Z+hNDFSSXVRNetWtxMqETx5bKNAVn1qN9xM3Rs6X3VStZZ5trxFb)ZGVRs3Tit5NMFqz6H7s1wArZt6BaN6mqE5bR4M5KtAXNxM3Rs6X3VStZmKS+tvN)+D0KVKNEQqmqQSA4E6S1NRznMxBqMqnU+43PMSroM4XxCeb)MD41NRzhFGsxdDN2EAJPshNZF3QoxMznsA4I4qT2Z3sAM3zt+4SqHANe1KsyMRmTF7SqVqAaMMNVQ5/RsU03wUctF4S+HxNFxUJPHUAtmKS+wUN4EAX1NRznMxBqMqETxUr34Z2Fs3NxdDN4EU41Ne0tF3pK+MSwEGSxQvN4FSSrxxmqE5s3NUTE1RrxNRN)46A1Ne0tFhA24xc6ZGSxERN4FSSrxxmqE5bR4Z2Fs3NIQMz6HhANwWNZmKS++htF4Y03MhVEsUrAxMS/Z74KH5caFGsGZAA5Q70K+KloMx41wvEDxUVqN7AttWmaFRs4EAXDMStn1RtIMqz6HhANwWNZmKS+HvNDQqnqVDTesAXxZ9b5E621Ne0tF3pPdSt6VMNAxhX2FSSrxxmRVAXDN6VS1RrIZ9b5E621Ne0tF3beE3SwQGXAQM4nFSSrxxmRVAXDMS+otAXIZ9b5E621Ne0tFhAq4M)KsA4IERN4FSSrxxmRVAXDMS+otAXKZAAFZhXK4MctFZsqQ7mD4SVWI4rTs6tKZAAFZhXK4ZNE1qmaQ5z6CcS1Feby43QcN54VsA41xxAttWQqMhtFZhzK4xTZs3NxdDmTF7S1x4t4ZGVx4M)c4GSxN3zaF7rxQMr)dSV1Ne0tt6BaERNDx6S1w6AaFGsx+cAFZ703VW2C1qma+vNUF7SJt4retWsZ+htF47AqHWmKF3Qo45V6d621VctotAMatvt5VWVqN5ctF4S1Nq)KsA4IERN4N4spxMETx5s3NUToM4Ea+Yb)MRS1Ne0tFhAq4M)KsA4INebFFSSrxvN4MqpPHArasWmaQ7mRMDJPs3Tit5mzxM3Rs6X3VStZmKS+MDmRm4S34ZmKF3siQ4A/VAVWI4r/1RtpxMS6VxAWNDnaFGsKQUNFM4SXw5TSQRrVQ5/RQR23MhVE1qmaQUNFFSSXxMz6ZGVq4M)KsA4ANK4tmKS+Q6N)4UrK4MXtFMQc14tS1xAEN7AtsAMqVRt5MRSqIMzzFU4+NDN5d70NxMzzFSSx4M)KsA4IERN4ZSS1Q5z/4SXRs3T6sKS1wvmRmv2NNWmamKS+CRsDZ7JPsSrms6t1xMS/QA3PNW2as3NeHhETF7S1xM4M43pKM3SwMxAAIMzaFGsxdDN2EA2RHUTaF3QoxMzCEcXXxSAM43bp+Mzt+43PNW2as3NGHSAFN4SXxMz6F4zN4AtCEcXA4DntmKS+EDmqE5s3NUTEsc4ZQMz6CcS1Q4r4dZVqIM)KsA41xxAtsA4GZ9b5E62DNUXitA4rxMStF3sbERmTZGV+4M)K1cSWI4BKtWmaMDmRm4S34ZmKF3siVeb)d3bqN7AtsW+qtFbDZhz3N9StFMsAHMMT+4SqHANe1KsyMRmTF7SKVSrGs5trxvNDQ7A34ZlKsWmaMRmRsAEPM7ctFxrItvV)Zv21wAtiFWsVxMS6F7VWNKJamKS+M6NDMcSRHAmKMxEa+RsUF7SJt4r6t5NyZ9b)43sqHANnF3QoxMznsA4bZMTvF4/K1Mzt+43PNW2as3N+w5z6CcS1FDnrN4sp+MMcdx41xxAt1qmaQ6t5xU0NVqTZM4S1wMztNxVI4Kmc43cbtM3TFh21Vctot55aQvNDQhA1Ne0tF3bbt4tvFhAAEcr4FSSrxvN)46JPVDTZsWS1wvEDxUVqN7AtsWQaHvETF7S1VcVTQcMqtMzt+4SNN6XoQDEaxvNSF7SKVSrGs6tnQ5/Rd3sDNAVTsWS1wMrSx5s3NUTE1Ks2Eqz6CcS1QvN4ZGVq4M)KsA41xxAt1qmaQ6t5s6XRHUTZsWS1wMzt4S4IERN4ZGVq4MTtFh21Vctot55awUN5d4SXxMz6ZGVqE3)cN4NXx3XtmKS+NDN5d3nqNW2osWS1wMzt4S4IEq5cdMpK453TFh21Vctot55aHhN4V6X3IMzzFSSx4M)KmZ4bFKVMFZS1Q5/R4703mZ2osD41wMzt4S4IERN4ZGVq4MTtFh21Vctot55aMhETF7S1x4t4ZGV2VxcCEcNXIMzaFGsKQUNFM4SXw5TSQRrVQ5z/4Y03MhVE1Ks2tMz6HhANwWNZmKS+FRs4EAXDNUTe1KQqQ5z6HGQPHUTCs5trx4A5Q70K+K2nsRrxMAASF7SqVqAaMMNVQ5z/4SXRs3T6sKS1wvEDxUVqN7AtQcMq1vV2E5QPsStZF3QoxvVDE7AqsSr61RtxMqz/Qv21VcNoQc4ZVqrUF7SJt4retWsZ+htF4hAJHUTZF3QoxFb5dhXNMSti1D41Q5/Rx62Ks3ztFZsqQ7mD4SVWI4r6t5NyZ9b)xWsDN6XiQKS1wMztNFSAFqXCF4sxIM4SFh21Vctot55aQYpRs5nR44VnsSXIMqBDd4SXxMz6ZGVq4M)KsA4bNDctmKS+NDN5d3aPHABRs3NGHSAFN4SXxMz6F4sA1M4Cm3bbNq4tmKS+NDN5d3aPHABRs3NGHSAF43nK4ZmzQKS1wMzt4S4IERN4ZGVqI4+TFh21Vctot55aQYb54SV3wUctF4S1NDqKxWSbEcBTZGEPxMETx5s3NUTE1KQatvN4VU41Ne0tF3b+4MMKdMbINcBcFSSrxFb5E62DN5ToMZsGQ7N/Z3nR44VnF3QoxMzCsWXIEebG4G4q4Mzt+43PNW2as3NIdc5R+RX3w5TEt6rZFcASF7S1x4t4Z3sNFctC4S4IxMzaFGsxdDN2EUr34MACMx41wMztNxAA4DnrN4spQM)TFh21Vctot55aCRsDd4SXxMz6ZGVq4M)KsA4bNDctmKS+NDN5d3nRVGNSQKS1wMzt4S4IERN4ZGVqI4+TFh21Vctot55a+hsD47JPs3T6sKS1wMzt4S4IERN4ZGVqI4+TFh21Vctot55a+hsD43b1Ne0tFhAq4M)KsA4IEqznFSSrxFb5E62DNUViM4XxZUN)Mqb3H5An1qN9xMStF3sIEebMZ3QqmM)K1cSWI4r6t5NyZA5DVUMPN6XeMMmqFqz6CcS1QvN4ZGVq4M)KFhA1xxAt1qmaQ6tFZSVJV7ctF4S1NDcwQGXXVZMzZGEPxMETxWs3NANnF3QoxvERVU4q4MAT1qt1Q5/RQR23MSAtFxrItvV)Zv21VDTosUEaNDN545b3NUTZF3siQ4A/VAVWI4rat5NKZ6N4EU43H5ATQKS1wvEDxUVqN7AttAMaw6t5V63PHAras6rbxMS/Z74KH5caFGsydRNGE90Rs3TCF3siQ4A/VAVWI4rat5NKZ6QDVU4KIMzzQKt++RNU+4S34Z2/s3NGHSAF4SVNtMzzQKt++RNU+4S34Z2/s3NGdRN4Z4SXx4rns6teQMzt+4S34Z2/sSJe+c5R4YfPsStZMx41wvmRmv2NN5caF7BetvN)s6zJmZ2Yt5NIMqz6CcSRHAtotAS+E5ETx5pPNW2rsWmawxN5EUX1NRzhFGQqHFb)x62qHUctFxrItvV)Zv21wAtrs6BqEqz6CcXxxFSrZ5trx4A5MKVqVW2itWsbxM3Rs6X3VStZmKS+N6N)d7fPNAVnF5t1wMrSx5s3NUTE1Ks2tMz6CcS1QvN4dMcI4qSwEeS1xxAt1qmaQ6t5x6XNNqztF4S1Nq4vdUAA4DnrZGEPxMETx5s3NUTEQcMq1vETF7S1x4t4ZGVq4M)KsA4IxMzaFGsKQUNFM4SXw5TSQRrVQ5z/4Y03MhVEtA42xvN)+4SXw5TSQRrVQ5z/4Y03MhVEM4MqtFb5V6SKIMzzQKt++RNU+4SNMhViQc4xCqz6HhANwWNZZ5trxvERMcVKNUVosAMqQ5z6H7s1VKNT1Rr+Q6N)d4SXw5TSQRrVQ5/RsU0KxMzz4SspHMMT+4SNNAtoM4MqZ9b)46z3VW2CM4MqMRmTF7SXx7nTNZSrx4A5470N4ZNEFWS1wMMT1xAWI4rC1qma+vmqEAN1Ne0rmqspQ5z/43s3MGXZsSJoxMS6d6SAIxAtQKsZMRV5+D0q4ZNas3NZHvtF43s3MGXZF3siVeb)d3bqN7AtFWS1wM4wERSAIxAtF5t1wMVwVMNWNDnaF7BoxMStQMbANYSrZ5trxvV5mvAqsSrY1Rt+M5z6H7s1VctotAQcxMStF3sbxGJeNZ4145)K1cSWI4r6t5NrtMz6CcS1QvN4ZGVq4M)KsA41xxAt1qmaQ54SF7S1x4t4ZGVq4M)KsA4IxMzaFGsxdDN2EAJPshNZF3QoxMzCMxTxFK4FNMcq4Mzt+4SqVK2TQKS1wM/R4hlPsStCsRrAxMETxUXDNAtot55aQYb54SV3wUctF4S1Nq)csW4IEqT4ZGEPxMETxUXDNAtot55axvNSF7S1xM4rZ3Qe4M4wxW4AxMzaFGsGZ9b5E62DNAroMZsIMcAtF7S1x4t4ZGVq4M)K1D4XIMzaFGsGZ9b5E62DMS+osRrG+hNDFSSXxMz6ZSs+VMMKZxTIEebtmKS++ht54703mZ2ns6teQMz6CcS1FqXGF4sV14tVxA41xxAttWmaVDN546A1Ne0tsRrMQvNDFSSWI4rYs3NydRN5E5n3HWlKs5t1wM/Rd70qNUttmKS++htF4Y0RHUVYs6t+Z6N)14SXw5TSQRrVQ5/R+qnNN6XoQDEaVc5DN4SXw5TSQRrVQ5/R+qnNN6XoQDEaHvs)4S21NRznMxBqMqETxUXDMS+otAXKZAA4MRSqtMzzQKt++RNU+4S3VW2ns6teQvt54hXNN5ctF4S+QUNFQcVNVcteMMNVxMETx63PHUVZs3NxQSA5Z4SXx4ratAXKMc5R4hXNN5ctmKS++xNF4hzK44VotAS1wM/RxU0KV3Tot5+eNRN)46Aqs3ztmKS+FREDMR2qN3zzFGsydRN5tSSWI4rFs3NxdDmTF7S1x4t4ZGV2VxcCEcNXI4BaZ5trxxN)MqpPtMzzFU4+Qhs)+cS3M7ctFxraxvmRm42qH5TG1qNaxMS/QASKHANat5NxM5z6HhANwWNZZ5trxxN4mvAqHAN6F5t1wMrSx5bKNAVn1qN9xM3Rs6X3VStZZ6tnQ5/RmvSRHUVtMZQqQhs5VU41NRzhFGQqHFb)x62qHUctFxrItvV)Zv21VcVTs3N2HSAZE6AJsGXZF3Qox4AFZhXK44V6FSSrxxN545nqMSroQRrMERtFZSNN4MctF4S+FRV4mvARH54tmKS+QMrDESVNtMzzHU4+H7NtEhXRs3ztmKS+dDNtE7rNVK2GtWsbxMETxUARs3T6sK3ewvNDxU014Z2TFS4yQ7mRd4SWI4rcFSVGE5ETx5s34MATQc42w5z6H7s1VKNT1Rr+Q6N)d4SXVRNetWtxMqnU+4SqVSritWsaxMS/QASq44VCQc42HFb5Z4SXNqXrNZ3z+METxAV3VqAttAMqEqz6HhANwWNZmKS+McAFdASXw5TSQRrVQ5/RV5bNmZ26t5NydcAtF7S1x4tvNvAAFDcC4S4Ix4BamKS+M6s)dh2NN5AMF3sitq/RV63PHAras6rbxMS/Z74KH5caFGsGdRN4V5b1NRz3FGsYH7N4+4SWI4rSs6tqMDmRQcV1xxAtZAS+QqnU+4S3HW25s6rGMDN/d4SXw62tsWs2QUN2EWEPHUVes5NVxM3Rs6X3VStZmKS+VebD4hADNUTesA4IMcAtF7SKVSrGs6tGE5ETx5NRsStG1RryFqz6H7s1VqACM4MqNRV2EUMPs3TitU41wMrSx5bKNAVn1qN9xMS/Z74KH5caF7rqQ7mDVAV1Ne0y43QcHMMDQv21VDVetUBqQ7N2E6XNwAroQcXAxMS/QA3PNW2atAX1xMStF3sIERN4ZGVq4M)K1cSWI4r6t5NydcAZEAV3VKNYF5t1wMztN4NIEcBTF4ze4MTtFh21VctotAMatvt5EUAN4Z2CsRtIMqz6CcS1Fq4MNMpKFqSVNFS1xxAtsWtZHFb)+R/PtMzzQKt++RNU+4SNM3TMtA4VxMStxUX3N5TZMZQzxMETx5bKNAVn1qN9xMS/Z74KHWmamKS+FRs)dSV3w5TEQKsZMRVSF7SJt4BRtAJPxMS6VxAWNDnaF7rxMhsDZ3sRIMzzQKt++RND+K2EdZq0JYaYtU47txTKwvtSJG/YFU4+QhsDFSSXw62t1RrxQvsDs6XK44VotAEa+7N5ZSV1Ne0t1RryMYbDMqb1xxAtsAMqVRt5m4SqxMzzsWs2QAA5Zv21VqTZsAEaQYpRs5n3HWlKs5t1wM/Rs62Rs7n9F6r2M3zt+4Sq4ZmRs3N2xvNZE6S3M3TisUBKxM3Rs6X3VStZmKS+ERN)s5aPHABRsSX+McA5V6A1Ne0ymqspQ5/RZSVqMK2e1KsqZ6EDx6zqN6VZM4S1wM/RxU0K4MXtmKS+ERN)s5nqVDTiMM5aQhN4mxAK44V5s5t1wvmRmv2NN5caFGsIMRNZEWs344Vrs3N2EcA2E5mPs3ztFMsAHMMT+4Sq4ZmRs3NiHhEDZSVNMK2t1RtxMqz6CDAWNDnaFGsIMRNZEUbRs3Tns6t+ZAA4QhXNN5ctFMspHMMT+4Sq4ZmRs3NiHhEDZSVNMK2S1RrMw6NUF7Sx4DnTNZSrxvN4VWsDN6ziQKtIMcAZE5bN4ZNZsWS1wM4S1xAWI4BKs6rqZ6QRMRAK4ZNSsSXxQMr)dSV1Ne0tMMNZHvNUFh21VqTMtAEa+vsDZ3sRmZ2Y1Rt9xMS6mSNWNDnaFGsI4UNZEUARs3T6sq5a+hs)14SXxv5zFM+z+METxWVJHANEM44ZQFb5Q3n3HWlKs5t1wMz/4hz3VqctmKS+Eqr)45nN44Vn1qNeZA5RmvSqIMzzNZ3z+METxWVJHANEM44ZQFb5Q3nNMGJKF3QoN5MT1xAWI4BKF6rMZ5r)m4XDNUVeFWS1wM4wm7AWNDnaFGsI4UNZEAmPshVEt6rZHMz6CDXAx3XrmqspQ5/RZSN3MK2M1RtKZUN)EWVqN3zzF7rxH7mRZ4SWI4BKF6rMZ5r)m4XDMSretWsbxMS6dxVWNDnaFGsI4UNZEAmPshVEM4JeEqz6CqNAIFSrmKS+MDmRm4S34MctFZsqQ7mD4SVWI4BRs5t1wvmRmv2NN5caFGsqMRt5mv2KIMzzsWs2QAA5Zv21VRNZsSJeMRN)QASXVRNetWtxMqETxWsqVW2CtWs2+vt5ZSV34MAMF3QoFqV6d621VK2C1DEa+vsDZ3sRmZ2eF3Qo+3SvERSAIxAttAXxNRtFEhzK44+os3N1xMStQFSXNYSrmKS+dcA543nN44Vn1qNeZA5RmvSqIMzzNZ3z+METxU0NNAtEM44ZQFb5Q3nNVqAns5t1w4tt1xAWI4rrsRtINRQTF7SAIFSrmKS++vsDZ3sRmZ2Yt5NIMqz6CcSq4Z2FtAS1Q5z/4SXqHWNrs3NqtxN5Q4SXxvAMNZ3z+METx5bKNWNZMM5aCDN5dGV1Ne0SmqspQ5z/4SXqHWNrsSX+Q7mRd4SXNq4CmqspQ5z/4SXqHWNrsSX+QhV4Z4SXNebTNZSrx4AFQcVqsGXEQc47xMS6EDAWNDnaF7rZQhVSF7SAIFSrmKS+49bDQqn3VSrEsWtbxMS6F74WNDnaF7rZQhVGE62NMK2as6rqQMz6CDXxNDnTNZSrxMr)m4XDNUTSsSX+Q7mRd4SXNq4CmqspQ5z/MRXK+K2aM4Eatvs)Qe0KIMzz43spHMMT+4SJH5AFs3NGdRN4Z4SXx4rosWQPxMETxAmPshVEM4JeH7NZEWsNVK2YF3Qo+34wm7AWNDnaF7rZQhVGE5bN44VTsSX+Q7mRd4SXNq4CmqspQ5z/MRXK+K2CM44ZHvtF47AqIMzzN4zpHMMT+4SJH5AFsSXx+vs)45nK4xttFMQc1MMT1xAEN7At1RrZtMz44743MGN6sc4ZHvNSF7SJt4re1cXIHhERmvARHW2Ts3NGdRN4Z4SXx4retWtKQ3rDN4SWI4BKs6rqZ9b)xWs1NRznMxBqMqETxWVqH6NE1Rr+VRt5+D0q4MctF4S+VDN4MDA1VSVeQD41Q5/RZSVqMK2e1KsqZUmRE6ARH6NMF3siQ4A/VAVWI4BKs6rqZ9b)xWsDMSrZMMmqQMz6CD4WNDnaFGsIMRNZE6JPVRNEQKt+HhN5QcVNxMzzFGs+dRV4mSSWI4BKs6rqZ6mRdhzNmZ2esA42+vV4MqNqN3zzsWs2QAA5Zv21VqTZsAEaVDN4MDADN55KMM5aN9bDFSSXNq4TNZSrxvN4VWsDN6ziQKtIMcAZEA3PsStZF3Qo+Stv1RSAIxAtsAMqVRt5HhzKV3TZM4Ea+vs4mMbqN3zz43sbHMMT+4Sq4ZmRs3NiHhEDZSVNMK2S1RrMw6NUF7SXx7nTNZSrxvN4VWsDN6ziQKtIMcAZE5bN4ZNZsWS1wM4t1xAWI4BKs6rqZ6QRMRAK4ZNSsSXxQMr)dSV1Ne0ttWQaHSA5Z4SWI4BKF6rMZAA4MR5PN6XEt6r21Mz6CDXxNqXTNZSrxvmDMRSDMGXiQc4xCRt5+Rz3xMzzmcz945V6d621VqTMtAEa+vsDZ3sRmZ2Yt5NIMqz6Cc3PVK2GtWsxMqzt+4SqVSVTsSJeHhV44Y0DMSretWsbxMS6F74WNDnaFGsI4UNZEUARs3T6sq5aFcA4d4SXNebMmqspQ5/RZSN3MK2M1RtKZUN)mFS1Ne0yF4spHMMT+4SqVSVTsSXZQhVGEUXRH9StF4Snd3Svd6SAIxAtsWtZHvtFMRXK+K2Yt5NIMqz6Cc3PVK2GtWsxMqzt+4SqVSVTsSXZQhVGEUMPHAmKF3QoFq4S1xAWI4BKF6rMZ5r)m4XDMStrsWS1wM4wm74WNDnaFGQqHFb)x62qN3zzsWs2QAA5Zv21VRNZF3siVeb)d3bqN7AtsWQqZ9b)dhA1NR/R1RryFRNU+4SqVKNEM4MqMRsSF7SqVqAaMMNVQ5/RsAVDMStT1R+eZ6N4V6lPsGVtFMsAHMMT+4S3MSt6sSJeHhV44Y0DNW4tF4Sn1MSU1xAWI4roMMNxZAA4MR5PN6XE1cS1wMVwmSNWNDnaFGQaFebGEUARs3T6sq5atFb)4WV1Ne0rmqspQ5/RE5pP+K2rsRtINRs2EUMPs3TZF3QoN5V6d621wWXiQc4xCqz6CDAWNDnaF7BeHhV44Y0DNUVosA4VxMStx5bqHUVimR+q+Mzt+4SNMhVZs6+eZ6N/xU03N3zzmc/K+MV6d621wAtFs6Bq+vt5Q7034xctFMs1HMMT+4SNMhVZs6+eZA5RmvSqIMzzNMbAHMMT+4SNMhVZs6+eZA5RmvAqN3zz4S3z+METx5bKNWNZMM5aQxNSF7SXx7nTNZSrxMr)m4X1Ne0rmqspQ5z/MRXK+K2aM4EaERETF7SXIFSrmKS+49bDQqn3VSrEtAMqVRETF7SWxYbrmqspQ5z/MRXK+K2aM4EatFb)4WV1Ne0CNxMz+METxAmPshVEtWt+ZA5RMDrRV7ctFMQP+MV6d621wAVeQDEa+7N5ZSV1Ne0tM4JeH7NtFh21wAVeQDEaFcA4MRSDN6NSt5NnxMStQxTX4DnTNZSrxMr)m4XDMStrsRrMZA5RmvSqIMzz43+z+METxAmPshVEM4JeH7NZE5bN4xctFMQc+MV6d621wAVeQDEaFcA4MRSDM3ToF3Qod3Svd6SAVhAaFGsxtxNFV5sR44VTsU41wMrSx6JPM3TiQKs2Qvs)E6SDNUVosA4VxMStx6X3VhVeF6tAxMETxWVqH6NE1Rr+Vqz6HGQPHUTCs5trxvN4VWsDN5AtsAEa+7N5ZSV1Ne0tsWsyHS5TESmPsSAtmKS+ERN)s5aPHABRs3NMdRV4MKsJN3zzsWs2QAA5Zv21VqTZsAEaQYpRs5nNVKNCs6tbxMS6NvSAIxAtsAMqVRt5m4SqMK2nMZsZw6N5VU41Ne0tt6rZFcASFh21VqTZsAEaVDN4MDADN55K1R+eQvsDsAV1NR/R1RryFRNU+4Sq4ZmRs3NqQ6sDE3aPH5TrsSXqQSAtF7SAtFSrmKS+ERN)s5nRVcVnQcMqtvt5x6XNN5ctFMspHMMT+4Sq4ZmRs3NiHhEDZSVNMK2rsc42FRNUF7SAIFSrmKS+ERN)s5nRVcVnQcMqtvtFx6X3VRVZF3QoQMMT1xAWI4BKs6rqZ6QRMRAK4ZNSsSXx+vN)VWV1Ne0CmqspQ5/RZSVqMK2PsRtIQvNDx5nNM3TMtA4VxMStx5bRHANZFSSrxvmDMRSDMGXiQc4xCRt5+RXJIMzzF4QKHMMT+4SqVSVTsSJeHhV44Y0DNUVitAS1wMVwmSNWNDnaFGsI4UNZEUARs3T6sq5a+7N5ZSV1Ne0tMMNZHvNUFh21VqTMtAEa+vsDZ3sRmZ2S1RrMEqz6CDAWNDnaFGsI4UNZEUARs3T6sq5aFcA4d4SXNebrmqspQ5/RZSN3MK2M1RtKZUN)mFS1Ne0yF4spHMMT+4SqVSVTsSXZQhVGEUXRH9StF4Snd3Svd6SAIxAtsWtZHvtFMRXK+K2Yt5NIMqz6CcSNNAVTs5t1Q5/RZSN3MK2M1RtKZA5RmvSqIMzzNMbAHMMT+4SqVSVTsSXZQhVGE5bN4xctFMQP+MV6d621VKNT1Rr+Q6NUF7SKVSrGs5trxvmRZ4SXVRNetWtxMqETxWsqVW2etWtbxM3Rs6X3VStZmKS+VRmqEUAqHWNmF3siVeb)d3bqN7AtsWQqZAA546XNmZlKs6ryQ3rUF7SAtFSrmKS+dcA543nN44Vn1qNeZ9bUF7SWx3XMmqspQ5/RE5pP+K2rsRtINRs2EAS1Ne0YF4QKHMMT+4S3MSt6sSJeHhV44Y0DMSretWsbxMS6d6SAIxAttAXxNRtFEhzK44+osSX+QhV4Z4SXNebTNZSrx4A4MR5PN5XtFMs945V6d621wWXiQc4xCRt5+D0q4MctF4S+MDmDMqbRH5ATFSSrx4AFQcVqsGXEsUr+dDNUF7SWxGVrmqspQ5z/4SXqHWNrs3NedDN4d4SXNqzTNZSrx4AFQcVqsGXEMZs2HvmTF7SAFq4TNZSrx4AFQcVqsGXEMZs2QvNUF7SxxFSrmKS+FRV5VAVNmZ2ntU41wMSwd6SAIxAtF6r2M3z6CDAWNDnaF7rZQhVGE62NMKlKQKS1wM3T1xAWI4rM1RtKZUmDx5n34ZmRQKS1wMVw1DAWNDnaF7rZQhVGE62NMK2S1RrMEqz6CqbAtFSrmKS+49bDQqn3VSrEMZsZw6QDd4SXNebrmqspQ5z/MRXK+K2Yt5NIMqz6CcS3MGXrtAXxHhV4Z4SWI4rM1RtKZAAFEhz3MKlRMZQa+3z6CDXAx3XrmqspQ5z/MRXK+K2CM44ZHvtFx6X3VDctFMsAFqV6d621wAVeQDEaFcA4MRSDMStrsWS1wM4wd6SAIxAtF6r2MhtF47ARHANEQc47xMS6VFSAIFSrZ5trxvN/xAVqsStn1RrMERs)4Ur1NRzhFGs2NRV4MqmPs3Tit5NMZUN)EWVqN3zzFGs2Q6V5m4NNtMzaFGsIMRNZE6JPVebtFZsqQ7mD4SVWI4BKs6rqZ9b)xWsDNUVosA4VxMStxWs344VrFGtZQhVSFh21VqTZsAEaQYpRs5n3VK2nsRrq45z6HhANwWNZmKS+ERN)s5aPHABRsSX+McA5V6A1Ne0CmqspQ5/RZSVqMK2e1KsqZ6EDx6zqN6VZM4S1wM/R+RzNM34tmKS+ERN)s5nqVDTiMM5aQhN4mxAK44V5s5t1wvmRmv2NN5caFGsIMRNZEWs344Vrs3N2EcA2E5mPs3ztFMsAHMMT+4Sq4ZmRs3NiHhEDZSVNMK2t1RtxMqz6CDAWNDnaFGsIMRNZEUbRs3Tns6t+ZAA4QhXNN5ctFMspHMMT+4Sq4ZmRs3NiHhEDZSVNMK2S1RrMw6NUF7Sx4DnTNZSrxvN4VWsDN6ziQKtIMcAZE5bN4ZNZsWS1wM4S1xAWI4BKs6rqZ6QRMRAK4ZNSsSXxQMr)dSV1Ne0tMMNZHvNUFh21VqTMtAEa+vsDZ3sRmZ2Y1Rt9xMS6mSNWNDnaFGsI4UNZEUARs3T6sq5a+hs)14SXxv5zFM+z+METxWVJHANEM44ZQFb5Q3n3HWlKs5t1wMz/4hz3VqctmKS+Eqr)45nN44Vn1qNeZA5RmvSqIMzzNZ3z+METxWVJHANEM44ZQFb5Q3nNMGJKF3QoN5MT1xAWI4BKF6rMZ5r)m4XDNUVeFWS1wM4wm7AWNDnaFGsI4UNZEAmPshVEt6rZHMz6CDXAx3XrmqspQ5/RZSN3MK2M1RtKZUN)EWVqN3zzF7rxH7mRZ4SWI4BKF6rMZ5r)m4XDMSretWsbxMS6NMbWNDnaFGsI4UNZEAmPshVEM4JeEqz6CqNAIFSrmKS+MDmRm4S34MctFZsqQ7mD4SVWI4BRs5t1wvmRmv2NN5caFGsqMRt5mv2KIMzzsWs2QAA5Zv21VRNZsSJeMRN)QASXVRNetWtxMqETxWsqVW2CtWs2+vt5ZSV34MAMF3QoFqV6d621VK2C1DEa+vsDZ3sRmZ2eF3Qo+3SvERSAIxAttAXxNRtFEhzK44+os3N1xMS6mSNWNDnaFGQaFebGEUARs3T6sq5atFb)4WV1Ne0rmqspQ5/RE5pP+K2rsRtINRs2EUMPs3TZF3QoN5V6d621wWXiQc4xCqz6CDAWNDnaF7BeHhV44Y0DNUVosA4VxMStx5sKsStnt5NnxMETx5bKNWNZMM5aVc5REUX1Ne0YF4zpHMMT+4SNMhVZs6+eZ6s4E62qIMzzN43z+METx5bKNWNZMM5atFb)4WV1Ne0rmqspQ5z/4SXqHWNrsSX+QhV4Z4SXNebTNZSrx4AFQcVqsGXEQc47xMS6EDAWNDnaF7rZQhVSF7SAIFSrmKS+49bDQqn3VSrEsWtbxMS6mhSAIxAtF6r2Mht5d74DNUTZsUrbxMStQMNAIFSrmKS+49bDQqn3VSrEMZs2HvmTF7SAFq4TNZSrxMr)m4XDNUTSsSX+HhN5QhA1Ne05NZ3z+METxAmPshVEt6BaERNUF7S1VK2rM4MaFRsDZSV1xxAtF6r2MhtF47ARHANEsUr+dDNUF7SWxGMzNZ3z+METxAmPshVEM4JeH7NZEUMPHAmKF3QoFq4S1xAWI4rM1RtKZAAFEhz3MK2CM44bxMS6VxAWNDnaF7rZQhVGE5bN44VTsSXIdqz6CDTX4DnTNZtnQ5/R+RX3wWNetW3eQYbUF7SJt4re1cXIHhERmvARHW2Ts3NGdRN4Z4SXx4BosRtIQFb)x62qNGXotWsy45zt+4Sq4ZmRs3N2xvNtF7SKVSrGs5trxvN4VWsDN5AtsAEa+7N5ZSV1Ne0tsWsyHS5TESmPsSAtmKS+ERN)s5aPHABRs3NMdRV4MKsJN3zzQKt++RNU+4Sq4ZmRs3N2xvNZEU4qsStZQKS1w4tU1xAWI4BKs6rqZ9b)xWsDM3TSsRrKw6NDFSSXx4rYsRtxFqzt+4Sq4ZmRs3NqQ6sDE3aPH5TeMZtIHhERZ4SXVRNetWtxMqETxWVqH6NEsWsyHSA2E6XqVGXEQKs2tMz6CqbWNDnaFGsIMRNZEUbRs3Tns6t+Z9pRmMbqN3zzNZ3z+METxWVqH6NEsKsZQvV4VU4DMGJo1RtxMqz6CDAWNDnaFGsIMRNZEUbRs3Tns6t+ZA5RmvSqN5ctFMsb+MV6d621VqTZsAEawRsDZhAqsSrEM4JeMRN)d4SXNq4TNZSrxvN4VWsDN6ziQKtIMcAZE5bKVSVas5t1wMz/4hz3VqctmKS+Eqr)45nN44Vn1qNeZUN)mFS1NefzFM+z+METxWVJHANEM44ZQFb5Q3n3HAVTF3Qo+3SvERSAIxAtsWtZHvtFEhzK44+os3NGdRN4Z4SXx4rCsRrMMqzt+4SqVSVTsSJeHhV44Y0DMSretWsbxMS6d6SAIxAtsWtZHvtFEhzK44+osSXx+vmTF7SxNDnTNZSrxvmDMRSDMSVeQDEa+YbDmSSXNKMzNZ3z+METxWVJHANEF6r2Mht5+Rz3xMzzmc/c1MMT1xAWI4BKF6rMZ5r)m4XDNUVosA4VxMStx5bRHANZFSSrxvmDMRSDMSVeQDEatFb)4WV1Ne0CNxMz+METxWVJHANEF6r2MhtF47AqIMzz43spHMMT+4SqHANe1KsyMqz6HGQPHUTCs5trxvmRZ4SXVRNetWtxMqETxWsqVW2etWtbxMS/Z74KH5caFGsqMRtFESVqH62tFxrItvV)Zv21VRNZsSXxHFbDE3nq4ZNa1R+KxMS6NvSAIxAttAXxNRtFEhzK44+os3mcxMStQFSXNYSrmKS+dcA543nN44Vn1qNeZ9btF7SWx3XMmqspQ5/RE5pP+K2rsRtINRs2EUMPHAmKF3QodStU1xAWI4roMMNxZAA4MR5PN6XEMZs2QvNUF7SxxFSrmKS++vsDZ3sRIMzzNZ3z+METxUARs3T6sq5a+7N5ZSV1Ne0t1cJqFRV4EUX1xxAtM4XKMRNDE3nqwArot5t1wMVwEDAWNDnaF7rxMhN)VUADN6XotA4bxMS6dvSAIxAtM4XKMRNDE3nNVqATsWS1wM4CNvSAIxAtM4XKMRNDE3nNVqAns5t1w4+T1xAWI4rCQqmqMcA2E6A3tMzzF4zpHMMT+4SJH5AFF3Qo+MV6d621wAVeQDEaQAAZEWVKIMzz4S3z+METxAmPshVEtWt+ZUN4VWsKIMzzNZ3z+METxAmPshVEtWt+ZA5RmvSqIMzzNMbAHMMT+4SJH5AFs3NytvtFx6zqN6XnF3Qo+MV6d621wAVeQDEa+7N5ZSV1Ne0ttAJe+xNF4hzK4MctmKS+49bDQqnNMGXitAEaVc5REUX1Ne0YN4z1N5V6d621wAVeQDEaFcA4MRSDMSretWsbxMS6NMbWNDnaF7rZQhVGE5bN44VTsSXx+vmTF7SAxYbTNZSrxMr)m4XDMStrsRrMZ6V4tSSXNKMzNZ3z+MnU+4SNwWNTtWsZHvNSF7SJt4re1cXIHhERmvARHW2Ts3NGdRN4Z4SXx4BosRtIQFb)x62qNGXotWsy45zt+4Sq4ZmRs3N2xvNtF7SqVqAaMMNVQ5/RZSVqMK2e1KsqZUN)EWVqN3zzFGsqQ6sDd5XJH5AFFSSrxvN4VWsDN5AtsAEaHxNFZhzqwWVtFxrItvV)Zv21VqTZsAEaQYpRs5nNVKNCs6tbxMS6FhSAIxAtsAMqVRt5m4SqMK2nMZsZw6N5VU41Ne0t1KQaQvQTFh21VqTZsAEaVDN4MDADN55K1R+eQvsDsAV1NR/R1RryFRNU+4Sq4ZmRs3NqQ6sDE3aPH5TrsSXqQSAtF7SAtFSrmKS+ERN)s5nRVcVnQcMqtvt5x6XNN5ctFMspHMMT+4Sq4ZmRs3NiHhEDZSVNMK2rsc42FRNUF7SAIFSrmKS+ERN)s5nRVcVnQcMqtvtFx6X3VRVZF3QoQMMT1xAWI4BKs6rqZ6QRMRAK4ZNSsSXx+vN)VWV1Ne0CmqspQ5/RZSVqMK2PsRtIQvNDx5nNM3TMtA4VxMStx5bRHANZFSSrxvmDMRSDMGXiQc4xCRt5+RXJIMzzF4QKHMMT+4SqVSVTsSJeHhV44Y0DNUVitAS1wMVwmSNWNDnaFGsI4UNZEUARs3T6sq5a+7N5ZSV1Ne0tMMNZHvNUFh21VqTMtAEa+vsDZ3sRmZ2S1RrMEqz6CDAWNDnaFGsI4UNZEUARs3T6sq5aFcA4d4SXNebrmqspQ5/RZSN3MK2M1RtKZUN)mFS1Ne0yF4spHMMT+4SqVSVTsSXZQhVGEUXRH9StF4Snd3Svd6SAIxAtsWtZHvtFMRXK+K2Yt5NIMqz6CcSNNAVTs5t1Q5/RZSN3MK2M1RtKZA5RmvSqIMzz4SsVHMMT+4SqVSVTsSXZQhVGE5bN4xctFMQP+MV6d621VKNT1Rr+Q6NUF7SqVqAaMMNVQ5/RsAV1NR/R1RryFRNU+4SqVKNE1RryQMz6HGQPHUTCs5trxvmRV5nN4ZNZsD41wvEDxUVqN7AtsWQqZAA546XNmZlKs6ryQ3rUF7SxIFSrmKS+dcA543nN44Vn1qNeZ9bUF7SWx3XMmqspQ5/RE5pP+K2rsRtINRs2EAS1Ne0YF4QKHMMT+4S3MSt6sSJeHhV44Y0DMSretWsbxMS6d6SAIxAttAXxNRtFEhzK44+osSX+QhV4Z4SXNebTNZSrx4A4MR5PN5XtFMs945V6d621wWXiQc4xCRt5+D0q4MctF4S++c5TFh21wAtFs6Bq+vt5sU43N6AtF4Sn45MT1xAWI4rCQqmqMcA2E903NU)KF3QotMV6d621wAtFs6Bq+vtFx6X3VDctFMsAFqV6d621wAtFs6Bq+vtFx6XK4MctFMQPHMMT+4SNMhVZs6+eZ6V4tSSXNKVrmqspQ5z/MRXKtMzzNZ3z+METxAmPshVEtWt+Z6mDd4SXNqzTNZSrxMr)m4XDNUTSs3NyMRN/d4SXxvA5NZ3z+METxAmPshVEtWt+ZA5RmvSqIMzzNMs1HMMT+4SJH5AFs3NytvtFx6zqN6XnF3QoN5MT1xAWI4rM1RtKZUN)EWVqN3zzF7rxHhN4VAJPsSVCFSSrxMr)m4XDMStrsRrMZ6N/xU03N3zzmc/c1MMT1xAWI4rM1RtKZAAFEhz3MK2S1RrMEqz6CDAWNDnaF7rZQhVGE5bN44VTsSXx+vmTF7SANYSrmKS+49bDQqnNMGXitAEaQxNSF7SAx3XrmqQeE5ETx5pPH6NZFS4eMeb)d4SXw62t1RrxQvsDs6XK44VotAEa+7N5ZSV1Ne0t1RryMYbDMqb1xxAtsAMqVRt5m4SqxMzzsWs2QAA5Zv21VqTZsAEaQYpRs5n3HWlKs5t1wM/Rs62Rs7n9F6r2M3zt+4Sq4ZmRs3N2xvNZE6S3M3TisUBKxMS/Z74KH5caFGsIMRNZE6JPVRNEMZQqFRNDd4SXNq4TNZSrxvN4VWsDN5AtsAEaQ45RMDrqNWNSF3QoxxN)MqbNtMzaFGsIMRNZEWs344Vrs3N2EebDEhARshNZF3siVeb)d3bqN7AtsAMqVRt5s62RsGXE1RrI+vtFs6XNxMzzNxMz+METxWVqH6NEsKsZQvV4VU4DNAreMMNVxMS6d6SAIxAtsAMqVRt5HhzKV3TZM4Ea+vs4mMbqN3zzNZ3z+METxWVqH6NEsKsZQvV4VU4DMSretWsKMqz6CRAAIFSrmKS+ERN)s5nRVcVnQcMqtvtF47AqHWmKF3QoFqV6d621VqTZsAEawRsDZhAqsSrEM4XI4UN4Z4SXx4rCsRrMMqzt+4SqVSVTsSJeHhV44Y0DNUVeFWS1wMSvERSAIxAtsWtZHvtFEhzK44+os3NGH7NtF7SWx3XMmqspQ5/RZSN3MK2rsRtINRs2EUX3N5TZF3Qox4A5MRSqN3zaFGsI4UNZEUARs3T6sq5atFb)4WV1Ne0rmqspQ5/RZSN3MK2rsRtINRs2E5bN4xctFMQP+MV6d621VqTMtAEa49bDQqn3H55zF3Qod3Svd6SAIxAtsWtZHvtFMRXK+K2YsRBzxMStQxTX4DnTNZSrxvmDMRSDMSVeQDEa+7N5ZSV1Ne0tMMNZHvNUFh21VqTMtAEa49bDQqnNVqATsWS1wM4CNvSAIxAtsWtZHvtFMRXK+K2CM44bxMS61DAWNDnaFGQqHFb)x62qN3zzQKt++RNU+4SqVqctFZsqQ7mD4SVWI4BRsWmaQ7mDd4SXVRNetWtxMqETxWsqVW2rs6BqM5z6HGQPHUTCs5trxvmRV5nNNANeMM5aERN)dhXJN3zzNxMz+METxU0NNAtEM44ZQFb5Q3aPN3zzmcz945V6d621VK2C1DEa+vsDZ3sRmZ2tF3Qo+3SvERSAIxAttAXxNRtFEhzK44+osSX+Q7mRd4SXNDnTNZSrxxNF43sDMGXiQc4xCRtFx6XK4MctFMQPHMMT+4SN44Vn1qN9xMS6d6SAIxAtM44ZQFb5Q3n3HWlKs5t1wM/RV62JsSti1RBzxMETx5bKNWNZMM5aVc5REUX1Ne0YF4zpHMMT+4SNMhVZs6+eZ6s4E62qIMzzN43z+METx5bKNWNZMM5atFb)4WV1Ne0CNxMz+METx5bKNWNZMM5atFbDZSV1Ne05mqspQ5z/4SXqHWNrsSXIdqz6CcNAIFSrmKS+49bDM4SXNDnTNZSrxMr)m4XDNUTSs3NIQMz6CqNWNDnaF7rZQhVGE62NMK2as6rqQMz6CDAWNDnaF7rZQhVGE62NMK2S1RrMEqz6CqbAtFSrmKS+49bDQqn3VSrEMZsZw6QDd4SXNDnTNZSrxMr)m4XDNUVosA4VxMStx5bKNWNZMZS1Q5z/MRXK+K2CM44ZHvt5sU43N6AtF4Snd3Svd6SAIxAtF6r2MhtF47ARHANEMZs2HvmTF7SAFq4TNZSrxMr)m4XDMStrsRrMZAAFEGV1Ne0CNZ3z+METxAmPshVEM4JeH7NZE6A3tMzzN4z9+MV6EG2WI4rCtAMaMhs)4Ur1NRzhFGs2NRV4MqmPs3Tit5NMZUN)EWVqN3zzFGs2Q6V5m4NNtMzaFGsIMRNZE6JPVebtFZsqQ7mD4SVWI4BKs6rqZ9b)xWsDNUVosA4VxMStxUMPHAmKt5Nnm3r)m4X1xxAtsAMqVRt5m4SqMK2TtAXIHhN/EcSXw5TSQRrVQ5/RZSVqMK2e1KsqZA5RV5bqs7ctFMsAHMMT+4Sq4ZmRs3N2xvNZE6ANVcV/s5mqtMz6Cc3PVK2nsKS1Q5/RZSVqMKlRtA4Z+vt5mZEPsGXnsRtqMqz6HGQPHUTCs5trxvN4VWsDN6NasR+eZ9b)Z7ADMhNeM4S1wM4S1xAWI4BKs6rqZ6QRMRAK4ZNSs3N+QSA5Z4SXNDnTNZSrxvN4VWsDN6ziQKtIMcAZEUAR4MACs5t1wMMT1xAWI4BKs6rqZ6QRMRAK4ZNSsSX+Q7mRQcV1Ne0nNZ3z+METxWVqH6NEsKsZQvV4VU4DMStrs6BqEqz6CqbWNDnaFGsIMRNZEUbRs3Tns6t+ZAAFZSN34MctF4S+FRs)4AV1xxAtsWtZHvtFEhzK44+os3NGQ3BTF7SX4KVTNZSrxvmDMRSDMGXiQc4xCRt5+Rz3xMzzmcz945V6d621VqTMtAEa+vsDZ3sRmZ2Yt5NIMqz6CcSNNAVTs5t1Q5/RZSN3MK2rsRtINRs2EUMPHAmKF3Qo+MV6d621VqTMtAEa+vsDZ3sRmZ2CM44bxMS61DAWNDnaFGsI4UNZEAmPshVEt6r21Mz6CDTX4DnTNZSrxvmDMRSDMSVeQDEa+hs)14SXxvAyF4spHMMT+4SqVSVTsSXZQhVGEUX3N5TZF3Qox4A5MRSqN3zaFGsI4UNZEAmPshVEMZs2HvmTF7SAFq4TNZSrxvmDMRSDMSVeQDEaFcA4d4SXNebrmqspQ5/RV63PHAras5t1wvmRmv2NN5caFGsqMqz6HGQPHUTCs5trxvmRV5aPHUTnF3siQ4A/VAVWI4BRsWma+vN)VA21NRznMxBqMqETxWsqVW2CtWs2+vt5ZSV34MAMF3QodS+T1xAWI4roMMNxZAA4MR5PN6XE1qt1wMVwmSNWNDnaFGQaFebGEUARs3T6sq5axMz6CDXX4KVTNZSrxxNF43sDMGXiQc4xCRtFx6X3VDctFMspHMMT+4S3MSt6sSJeHhV44Y0DMSreQc4VxMS61RSAIxAtM44ZQFb5mSSXNqXMmqspQ5z/EhzK44+os3NGdRN4Z4SXx4rosWQPxMETx5bKNWNZMM5aVc5REUX1Ne0YF4zpHMMT+4SNMhVZs6+eZ6s4E62qIMzzN43z+METx5bKNWNZMM5atFb)4WV1Ne0CNxMz+METx5bKNWNZMM5atFbDZSV1Ne05mqspQ5z/4SXqHWNrsSXIdqz6CcNAIFSrmKS+49bDM4SXNDnTNZSrxMr)m4XDNUTSs3NIQMz6CDTANYSrmKS+49bDQqn3VSrEtAMqVRETF7SWx3cymqspQ5z/MRXK+K2aM4EatFb)4WV1Ne05NZ3z+METxAmPshVEtWt+ZA5RMDrRV7ctFMsb+MV6d621wAVeQDEa+7N5ZSV1Ne0tt5NqVqzt+4SJH5AFsSXx+vs)45nqwArot5t1wMVwVFSAIFSrmKS+49bDQqnNMGXitAEatFb)4WV1Ne05NZ3z+METxAmPshVEM4JeH7NZE5bN4xctFMQc+MV6d621wAVeQDEaFcA4MRSDM3ToF3Qod3Svd6SAVhAaF7rxHvN)m42RHAN/F3sitq/RmMsK44V51RtIH7N545n3HWlKs5t1wM/Rmv2KN5AMMx41Q5/RZSVqMK2e1KQPxM3Rs6X3VStZmKS+ERN)s5aPHABRs3NGdRN4Z4SXx4BRtA4Z+M/DMRXKtMzaFGsIMRNZE6JPVRNEtWQaQvs)sAN1NR/R1RryFRNU+4Sq4ZmRs3N2xvNZEU4qsStZQKS1wM4S1xAWI4BKs6rqZ9b)xWsDM3TSsRrKw6NDFSSXx4rYsRtxFqzt+4Sq4ZmRs3NqQ6sDE3aPH5TeMZtIHhERZ4SXVRNetWtxMqETxWVqH6NEsWsyHSA2E6XqVGXEQKs2tMz6CqbWNDnaFGsIMRNZEUbRs3Tns6t+Z9pRmMbqN3zzNZ3z+METxWVqH6NEsKsZQvV4VU4DMGJo1RtxMqz6CDAWNDnaFGsIMRNZEUbRs3Tns6t+ZA5RmvSqN5ctFMsb+MV6d621VqTZsAEawRsDZhAqsSrEM4JeMRN)d4SXNq4TNZSrxvN4VWsDN6ziQKtIMcAZE5bKVSVas5t1wMz/4hz3VqctmKS+Eqr)45nN44Vn1qNeZUN)mFS1NefzFM+z+METxWVJHANEM44ZQFb5Q3n3HAVTF3Qo+3SvERSAIxAtsWtZHvtFEhzK44+os3NGdRN4Z4SXx4rCsRrMMqzt+4SqVSVTsSJeHhV44Y0DMSretWsbxMS6d6SAIxAtsWtZHvtFEhzK44+osSXx+vmTF7SxNDnTNZSrxvmDMRSDMSVeQDEa+YbDmSSXNKMzNZ3z+METxWVJHANEF6r2Mht5+Rz3xMzzmc/c1MMT1xAWI4BKF6rMZ5r)m4XDNUVosA4VxMStx5bRHANZFSSrxvmDMRSDMSVeQDEatFb)4WV1Ne0CNxMz+METxWVJHANEF6r2MhtF47AqIMzz43spHMMT+4SqHANe1KsyMqz6HhANwWNZmKS+VRNUF7SqVqAaMMNVQ5/RsAVDN5AaQKS1wvEDxUVqN7AtsWQqZAA4VAVRtMzzQKt++RNU+4SqVKNEMMNMQSA2EWVqHUTeF5t1wM4S1xAWI4roMMNxZAA4MR5PN6XE1qt1wMVwmSNWNDnaFGQaFebGEUARs3T6sq5axMz6CDXX4KVTNZSrxxNF43sDMGXiQc4xCRtFx6X3VDctFMspHMMT+4S3MSt6sSJeHhV44Y0DMSreQc4VxMS61RSAIxAtM44ZQFb5mSSXNqXMmqspQ5z/EhzK44+os3NGdRN4Z4SXx4rS1RrMEDN5Q4SWI4rCQqmqMcA2EWsNVK2YF3Qo+3Swd6SAIxAtM4XKMRNDE3nR4Z2asWS1wM4t1xAWI4rCQqmqMcA2EUMPHAmKF3QoQMMT1xAWI4rCQqmqMcA2EUMPs3TZF3QoN5V6d621wAtFs6Bq+vtFZ701Ne0MNZ3z+METxAmPsSAtFMspHMMT+4SJH5AFs3Nytvt5ZhA1NefzmqspQ5z/MRXK+K2aM4EaQ6N)s6A1Ne0Y43spHMMT+4SJH5AFs3NytvtFx6X3VDctFMsAFqV6d621wAVeQDEaQAAZEU4RH6EoQKS1w4t6d6SAIxAtF6r2Mht5+D0q4MctF4S+VDN4MDA1xxAtF6r2MhtF47ARHANEsUr+dDNUF7SWxGMzNZ3z+METxAmPshVEM4JeH7NZEUMPHAmKF3QoFq4S1xAWI4rM1RtKZAAFEhz3MK2CM44bxMS6VxAWNDnaF7rZQhVGE5bN44VTsSXIdqz6CDTX4DnTNZtnQ5z/4h5PHAmKsRrMw5z6H7s1VqA6Qc4ZN9bDZhz3NANEt6BaERNUF7S1VqAaQqN24AASFh21VqTZsAEaQYpR1cSXw5TSQRrVQ5/RZSVqMK2e1KsqZUN)EWVqN3zzFGsqQ6sDd5XJH5AFFSSrxvN4VWsDN5AtsAEaHxNFZhzqwWVtFxrItvV)Zv21VqTZsAEaQYpRs5nNVKNCs6tbxMS6VvSAIxAtsAMqVRt5m4SqMK2nMZsZw6N5VU41Ne0tt6rZFcASFh21VqTZsAEaVDN4MDADN55K1R+eQvsDsAV1NR/R1RryFRNU+4Sq4ZmRs3NqQ6sDE3aPH5TrsSXqQSAtF7SAtFSrmKS+ERN)s5nRVcVnQcMqtvt5x6XNN5ctFMspHMMT+4Sq4ZmRs3NiHhEDZSVNMK2rsc42FRNUF7SAIFSrmKS+ERN)s5nRVcVnQcMqtvtFx6X3VRVZF3QoQMMT1xAWI4BKs6rqZ6QRMRAK4ZNSsSXx+vN)VWV1Ne0CmqspQ5/RZSVqMK2PsRtIQvNDx5nNM3TMtA4VxMStx5bRHANZFSSrxvmDMRSDMGXiQc4xCRt5+RXJIMzzF4QKHMMT+4SqVSVTsSJeHhV44Y0DNUVitAS1wMVwmSNWNDnaFGsI4UNZEUARs3T6sq5a+7N5ZSV1Ne0tMMNZHvNUFh21VqTMtAEa+vsDZ3sRmZ2S1RrMEqz6CDAWNDnaFGsI4UNZEUARs3T6sq5aFcA4d4SXNebrmqspQ5/RZSN3MK2M1RtKZUN)mFS1Ne0yF4spHMMT+4SqVSVTsSXZQhVGEUXRH9StF4Snd3Svd6SAIxAtsWtZHvtFMRXK+K2Yt5NIMqz6CcSNNAVTs5t1Q5/RZSN3MK2M1RtKZA5RmvSqIMzzNZ3z+METxWVJHANEF6r2MhtF47AqIMzz43spHMMT+4SqHANe1KsyMqz6HGQPHUTCs5trxvmRZ4SXVRNetWtxMqETxWsqVW2etWtbxMS/Z74KH5caFGsqMRtFESVqH62tFxrItvV)Zv21VRNZsSXxHFbDE3nq4ZNa1R+KxMS6VvAWNDnaFGQaFebGEUARs3T6sq5aQ3z6CDXX4KVTNZSrxxNF43sDMGXiQc4xCRt5FSSXNqXMmqspQ5/RE5pP+K2rsRtINRs2EUMPHAmKF3Qo+MV6d621VK2C1DEa+vsDZ3sRmZ2S1RtIMqz6CqNWNDnaF7BeHhV44Y01NefzFM+z+METxUARs3T6sq5a+7N5ZSV1Ne0tsAMaM7NtFh21wAtFs6Bq+vt5sU43N6AtF4Sn45MT1xAWI4rCQqmqMcA2E903NU)KF3QotMV6d621wAtFs6Bq+vtFx6X3VDctFMspHMMT+4SNMhVZs6+eZA5RmvAqN3zz4S3z+METx5bKNWNZMM5aQxNSF7SXx7nTNZSrxMr)m4X1Ne0rmqspQ5z/MRXK+K2aM4EaERETF7SAxFSrmKS+49bDQqn3VSrEtAMqVRETF7SWxYbrmqspQ5z/MRXK+K2aM4EatFb)4WV1Ne0CNZ3z+METxAmPshVEtWt+ZA5RMDrRV7ctFMQP+MV6d621wAVeQDEa+7N5ZSV1Ne0tt5NqVqzt+4SJH5AFsSXx+vs)45nqwArot5t1wMVwVFSAIFSrmKS+49bDQqnNMGXitAEatFb)4WV1Ne0rmqspQ5z/MRXK+K2CM44ZHvtF47AqIMzzN4zpHMMT+4SJH5AFsSXx+vs)45nK4xttFMQc1MMT1xAEsh50JYaYQU0KwvNzdDTKJG/YFU4+QSA/F7SqN5ArF3Qod346d6SAIxAt1Dr++RV4VWs3MSr6sWmaH7mRZh/PN5AntAX1wMBTF7SAx3/zNZ3z+METxASNwWNns6rqdc5R4SVDNAVTsA4ZNebDZ70NNRzMF3Qo4At6ERSAIxAt1cX+dcAF4YfPHAVSs3NZHvN4MqQPs3ToMxrAwMBTF7SAx3/zNZ3z+METx5sNVK2CMMNeQhsDx5nRHAmKsRrxQhV4EU4NFRzMF3QoM34CNvSAIxAtsAMqVRN)45bRshNZs3NZHvN4MqQPs3ToMMsi1Mz6CDTANqXrmqspQ5/RZSVqVKNTMMNZN6mqE6z3VqTi1qN2QxNFF7SJN3zzN4zV45V6d621VRXoQc4YMqrD43n344VCQcsi1Mz6CDTAx7cTNZSrxvs4E6ARNWNMMxEaQ6sD4hAXwWVtFMsVMS+T1xAWI4ra1DEaH7mRZh/PN5AntAX1wMBTF7SAx3/zNZ3z+METx6lP+K2itWsIHYb5mvA3M3zzF5t1wMSwd6SAIxAttUrIVqS/EcSXxvASN4sNHMMT+4SKVKNat5NxHhEDMqnRHAmKsRrxQhV4EU4Xw5XtFMQctMSvd6SAIxAtQKQqQUN54hzKVSVEsRrMERs)4hXK4Z2SFxBKxMS6F3NAxFSrmKS+M7mqE623N6VosSXNwMBTF7SAx3/zN43z+METxAX3VW2at5NKdRtFMxSJN3zzN4zb+4+T1xAWI4rFtWma+7N5ZSVNVeSzFWS1wM4wF3NxxFSrmKS+M7mqEUX3N5TZMZQzwMrUF7SAx7cSNZ3z+MnbjZqYC9XqwxcSJG/nVKQTEZJqVZMnCG20"

if slot_0_85_5 then
	slot_0_86_6 = slot_0_78_5(slot_0_85_5)

	if slot_0_86_6 then
		slot_0_86_6.author = "elysian"
		slot_0_71_2[slot_0_84_5] = slot_0_77_4(slot_0_86_6)
	end

	slot_0_74_2[#slot_0_74_2 + 1] = slot_0_84_5
end

slot_0_86_5 = {
	"\f<shield-halved>\r  anti-aim",
	"    \f<caret-right>\r  general",
	"    \f<caret-right>\r  builder",
	"    \f<caret-right>\r  defensive",
	"\f<eye>\r  visuals",
	"    \f<caret-right>\r  general",
	"    \f<caret-right>\r  ui",
	"\f<gears>\r  misc"
}
slot_0_87_6 = {}

for iter_0_13, iter_0_14 in ipairs(slot_0_86_5) do
	slot_0_87_6[iter_0_14] = iter_0_13
end

slot_0_88_7 = {
	{
		2,
		3,
		4
	},
	[5] = {
		6,
		7
	}
}
slot_0_89_5 = {
	[2] = {
		{
			"antiaim",
			"general"
		}
	},
	[3] = {
		{
			"antiaim",
			"configure"
		},
		{
			"antiaim",
			"angles",
			"builder"
		},
		{
			"antiaim",
			"angles",
			"freestanding"
		}
	},
	[4] = {
		{
			"antiaim",
			"defensive"
		}
	},
	[6] = {
		{
			"info",
			"additions"
		},
		{
			"info",
			"scope_zoom"
		},
		{
			"info",
			"viewmodel"
		},
		{
			"info",
			"custom_scope"
		},
		{
			"visuals",
			"aspect_ratio"
		},
		{
			"visuals",
			"manual_arrows"
		},
		{
			"visuals",
			"silent_view"
		}
	},
	[7] = {
		{
			"info",
			"crosshair"
		},
		{
			"info",
			"lc_ind"
		},
		{
			"info",
			"velocity"
		},
		{
			"info",
			"abf_ind"
		},
		{
			"info",
			"def_ind"
		},
		{
			"info",
			"watermark"
		},
		{
			"info",
			"notify"
		},
		{
			"info",
			"hitmarker"
		},
		{
			"info",
			"side_ind"
		},
		{
			"info",
			"keybinds_ui"
		}
	},
	[8] = {
		{
			"misc",
			"aimbot"
		},
		{
			"misc",
			"movement"
		},
		{
			"misc",
			"animbreaker"
		},
		{
			"misc",
			"drink"
		},
		{
			"misc",
			"clantag"
		},
		{
			"misc",
			"killsay"
		}
	}
}
slot_0_90_6 = {}

function slot_0_91_5()
	local var_164_0 = slot_0_59_0.info.presets.tabs
	local var_164_1 = var_164_0:get()

	if type(var_164_1) ~= "table" then
		var_164_1 = {}
	end

	local var_164_2 = {}

	for iter_164_0, iter_164_1 in ipairs(var_164_1) do
		var_164_2[type(iter_164_1) == "number" and iter_164_1 or slot_0_87_6[iter_164_1] or 0] = true
	end

	local var_164_3 = {}

	for iter_164_2, iter_164_3 in ipairs(slot_0_90_6) do
		var_164_3[iter_164_3] = true
	end

	for iter_164_4 in pairs(var_164_2) do
		if not var_164_3[iter_164_4] then
			if slot_0_88_7[iter_164_4] then
				for iter_164_5, iter_164_6 in ipairs(slot_0_88_7[iter_164_4]) do
					var_164_2[iter_164_6] = true
				end
			else
				for iter_164_7, iter_164_8 in pairs(slot_0_88_7) do
					local var_164_4 = true

					for iter_164_9, iter_164_10 in ipairs(iter_164_8) do
						if not var_164_2[iter_164_10] then
							var_164_4 = false

							break
						end
					end

					if var_164_4 then
						var_164_2[iter_164_7] = true
					end
				end
			end
		end
	end

	for iter_164_11 in pairs(var_164_3) do
		if not var_164_2[iter_164_11] then
			if slot_0_88_7[iter_164_11] then
				for iter_164_12, iter_164_13 in ipairs(slot_0_88_7[iter_164_11]) do
					var_164_2[iter_164_13] = nil
				end
			else
				for iter_164_14, iter_164_15 in pairs(slot_0_88_7) do
					for iter_164_16, iter_164_17 in ipairs(iter_164_15) do
						if iter_164_17 == iter_164_11 then
							var_164_2[iter_164_14] = nil

							break
						end
					end
				end
			end
		end
	end

	local var_164_5 = {}
	local var_164_6 = {}
	local var_164_7 = type(var_164_1[1]) == "string"

	for iter_164_18 = 1, 8 do
		if var_164_2[iter_164_18] then
			var_164_5[#var_164_5 + 1] = iter_164_18
			var_164_6[#var_164_6 + 1] = var_164_7 and slot_0_86_5[iter_164_18] or iter_164_18
		end
	end

	var_164_0:set(var_164_6)

	slot_0_90_6 = var_164_5
end

slot_0_59_0.info.presets.tabs:set_callback(slot_0_91_5, true)

function slot_0_92_5()
	local var_165_0 = slot_0_59_0.info.presets.tabs:get()

	if type(var_165_0) ~= "table" or #var_165_0 == 0 then
		return nil, false
	end

	local var_165_1 = {}
	local var_165_2 = {}

	for iter_165_0, iter_165_1 in ipairs(var_165_0) do
		local var_165_3 = type(iter_165_1) == "number" and iter_165_1 or slot_0_87_6[iter_165_1]
		local var_165_4 = var_165_3 and slot_0_89_5[var_165_3] or nil

		if var_165_4 then
			for iter_165_2, iter_165_3 in ipairs(var_165_4) do
				local var_165_5 = table.concat(iter_165_3, "\x00")

				if not var_165_2[var_165_5] then
					var_165_2[var_165_5] = true
					var_165_1[#var_165_1 + 1] = iter_165_3
				end
			end
		end
	end

	return #var_165_1 > 0 and var_165_1 or nil, #var_165_1 > 0
end

function slot_0_93_7(arg_166_0, arg_166_1)
	if not arg_166_1 then
		return true
	end

	if not arg_166_0 then
		return false
	end

	for iter_166_0, iter_166_1 in ipairs(arg_166_0) do
		if iter_166_1[1] == "info" or iter_166_1[1] == "visuals" then
			return true
		end
	end

	return false
end

function slot_0_94_7(arg_167_0, arg_167_1)
	if not arg_167_0 then
		return false
	end

	for iter_167_0, iter_167_1 in ipairs(arg_167_0) do
		if iter_167_1[1] == arg_167_1 then
			return true
		end
	end

	return false
end

function slot_0_95_7(arg_168_0, arg_168_1)
	if not arg_168_0 then
		return false
	end

	for iter_168_0, iter_168_1 in ipairs(arg_168_0) do
		local var_168_0 = true

		for iter_168_2, iter_168_3 in ipairs(arg_168_1) do
			if iter_168_1[iter_168_2] ~= iter_168_3 then
				var_168_0 = false

				break
			end
		end

		if var_168_0 then
			return true
		end
	end

	return false
end

function slot_0_96_8(arg_169_0, arg_169_1)
	if not arg_169_0 then
		return false
	end

	for iter_169_0, iter_169_1 in ipairs(arg_169_0) do
		if iter_169_1[1] == arg_169_1 and #iter_169_1 > 1 then
			return true
		end
	end

	return false
end

function slot_0_97_9(arg_170_0, arg_170_1)
	if arg_170_1 == false then
		return arg_170_0
	end

	pcall(function()
		local var_171_0 = slot_0_15_0:get()

		arg_170_0.__theme_r = var_171_0.r
		arg_170_0.__theme_g = var_171_0.g
		arg_170_0.__theme_b = var_171_0.b
		arg_170_0.__theme_a = var_171_0.a
		arg_170_0.__theme_share_logo = slot_0_16_0:get()
	end)
	pcall(function()
		local var_172_0 = {}

		for iter_172_0, iter_172_1 in ipairs(ui.get_binds()) do
			if iter_172_1.value and iter_172_1.value > 0 then
				var_172_0[iter_172_1.name] = iter_172_1.value
			end
		end

		arg_170_0.__binds = var_172_0
	end)
	pcall(function()
		local var_173_0 = slot_0_27_0
		local var_173_1 = var_173_0._select

		if not var_173_1 then
			return
		end

		local var_173_2 = {
			"double tap",
			"hide shots",
			"freestanding",
			"fake duck",
			"min damage",
			"dormant aimbot",
			"lc",
			"ping"
		}
		local var_173_3 = {}

		for iter_173_0, iter_173_1 in ipairs(var_173_2) do
			local var_173_4, var_173_5 = pcall(function()
				return var_173_1:get(iter_173_1)
			end)

			if var_173_4 and var_173_5 then
				var_173_3[#var_173_3 + 1] = iter_173_1
			end
		end

		local var_173_6 = {
			selected = var_173_3
		}

		pcall(function()
			var_173_6.enabled = var_173_0._label:get()
		end)

		local function var_173_7(arg_176_0, arg_176_1)
			if arg_176_1 and arg_176_1.get then
				local var_176_0, var_176_1 = pcall(function()
					return arg_176_1:get()
				end)

				if var_176_0 and var_176_1 then
					var_173_6[arg_176_0] = {
						var_176_1.r,
						var_176_1.g,
						var_176_1.b,
						var_176_1.a
					}
				end
			end
		end

		var_173_7("bg", var_173_0.col_bg)
		var_173_7("col_dt_on", var_173_0.col_dt_on)
		var_173_7("col_dt_off", var_173_0.col_dt_off)
		var_173_7("col_hs_on", var_173_0.col_hs_on)
		var_173_7("col_fs_on", var_173_0.col_fs_on)
		var_173_7("col_fd_on", var_173_0.col_fd_on)
		var_173_7("col_da_on", var_173_0.col_da_on)
		var_173_7("col_dmg_on", var_173_0.col_dmg_on)
		var_173_7("col_lc_on", var_173_0.col_lc_on)
		var_173_7("col_lc_bad", var_173_0.col_lc_bad)
		var_173_7("col_ping_on", var_173_0.col_ping_on)
		pcall(function()
			var_173_6.blur = var_173_0.blur:get()
		end)
		pcall(function()
			var_173_6.font = var_173_0.font:get()
		end)

		arg_170_0.__ind_state = var_173_6
	end)

	return arg_170_0
end

function slot_0_98_9(arg_180_0, arg_180_1)
	local var_180_0 = true

	if arg_180_0 and #arg_180_0 > 0 then
		return slot_0_97_9(slot_0_1_0.save(unpack(arg_180_0)), var_180_0)
	end

	return slot_0_97_9(slot_0_1_0.save(), var_180_0)
end

function slot_0_99_11()
	return slot_0_97_9(slot_0_1_0.save())
end

function slot_0_100_12(arg_182_0, arg_182_1)
	if type(arg_182_0) ~= "table" then
		return
	end

	if arg_182_1 and #arg_182_1 > 0 then
		pcall(function()
			slot_0_1_0.load(arg_182_0, false, unpack(arg_182_1))
		end)
	else
		pcall(function()
			slot_0_1_0.load(arg_182_0)
		end)
	end

	pcall(function()
		if arg_182_0.__theme_r then
			slot_0_15_0:set(color(arg_182_0.__theme_r, arg_182_0.__theme_g, arg_182_0.__theme_b, arg_182_0.__theme_a or 255))
		end

		if arg_182_0.__theme_share_logo ~= nil then
			slot_0_16_0:set(arg_182_0.__theme_share_logo)
		end
	end)
	pcall(function()
		local var_186_0 = arg_182_0.__binds

		if not var_186_0 then
			return
		end

		local var_186_1 = {
			["ai peek"] = slot_0_59_0.antiaim and slot_0_59_0.antiaim.general and slot_0_59_0.antiaim.general.aipeek and slot_0_59_0.antiaim.general.aipeek.switch,
			freestanding = slot_0_59_0.antiaim and slot_0_59_0.antiaim.general and slot_0_59_0.antiaim.general.freestanding and slot_0_59_0.antiaim.general.freestanding.switch
		}

		for iter_186_0, iter_186_1 in pairs(var_186_0) do
			local var_186_2 = var_186_1[iter_186_0]

			if var_186_2 then
				pcall(function()
					var_186_2:set_bind(iter_186_1)
				end)
			end
		end
	end)
	pcall(function()
		local var_188_0 = arg_182_0.__ind_state

		if not var_188_0 then
			return
		end

		local var_188_1 = slot_0_27_0
		local var_188_2 = var_188_1._select

		if var_188_0.selected and var_188_2 then
			pcall(function()
				var_188_2:set(var_188_0.selected)
			end)
		end

		if var_188_0.enabled ~= nil then
			pcall(function()
				var_188_1._label:set(var_188_0.enabled)
			end)
		end

		local function var_188_3(arg_191_0, arg_191_1)
			if var_188_0[arg_191_0] and arg_191_1 and arg_191_1.set then
				local var_191_0 = var_188_0[arg_191_0]

				pcall(function()
					arg_191_1:set(color(var_191_0[1], var_191_0[2], var_191_0[3], var_191_0[4]))
				end)
			end
		end

		var_188_3("bg", var_188_1.col_bg)
		var_188_3("col_dt_on", var_188_1.col_dt_on)
		var_188_3("col_dt_off", var_188_1.col_dt_off)
		var_188_3("col_hs_on", var_188_1.col_hs_on)
		var_188_3("col_fs_on", var_188_1.col_fs_on)
		var_188_3("col_fd_on", var_188_1.col_fd_on)
		var_188_3("col_da_on", var_188_1.col_da_on)
		var_188_3("col_dmg_on", var_188_1.col_dmg_on)
		var_188_3("col_lc_on", var_188_1.col_lc_on)
		var_188_3("col_lc_bad", var_188_1.col_lc_bad)
		var_188_3("col_ping_on", var_188_1.col_ping_on)

		if var_188_0.blur ~= nil then
			pcall(function()
				var_188_1.blur:set(var_188_0.blur)
			end)
		end

		if var_188_0.font ~= nil then
			pcall(function()
				var_188_1.font:set(var_188_0.font)
			end)
		end
	end)
end

function slot_0_101_13()
	local var_195_0 = slot_0_59_0.info.presets.name:get()

	if not var_195_0 then
		return
	end

	local var_195_1 = slot_0_71_2[var_195_0]

	if not var_195_1 then
		return
	end

	local var_195_2 = slot_0_78_5(var_195_1)

	if var_195_2 then
		local var_195_3

		var_195_3 = (var_195_0 == slot_0_84_5 or var_195_0 == "default") and "elysian" or var_195_2.author
	end
end

function slot_0_102_13()
	local var_196_0 = {}

	for iter_196_0, iter_196_1 in ipairs(slot_0_74_2) do
		var_196_0[#var_196_0 + 1] = iter_196_1
	end

	for iter_196_2, iter_196_3 in pairs(slot_0_71_2) do
		local var_196_1 = false

		for iter_196_4, iter_196_5 in ipairs(var_196_0) do
			if iter_196_5 == iter_196_2 then
				var_196_1 = true

				break
			end
		end

		if not var_196_1 then
			var_196_0[#var_196_0 + 1] = iter_196_2
		end
	end

	slot_0_59_0.info.presets.list:update(var_196_0)

	local var_196_2 = slot_0_59_0.info.presets.list
	local var_196_3 = var_196_2:list()[var_196_2:get()]

	if not var_196_3 then
		return
	end

	if var_196_3 ~= slot_0_73_2 then
		slot_0_59_0.info.presets.name:set(var_196_3)
		slot_0_101_13()
	end

	local var_196_4 = false

	for iter_196_6, iter_196_7 in ipairs(slot_0_74_2) do
		if iter_196_7 == var_196_3 then
			var_196_4 = true

			break
		end
	end

	slot_0_59_0.info.presets.save:disabled(var_196_4)
	slot_0_59_0.info.presets.export:disabled(false)
	slot_0_59_0.info.presets.delete:disabled(var_196_4)
	slot_0_59_0.info.presets.create:disabled(not var_196_4)
end

function slot_0_103_13(arg_197_0, arg_197_1)
	slot_0_71_2[arg_197_0] = arg_197_1

	slot_0_75_3()
	slot_0_102_13()
end

function slot_0_104_14()
	local var_198_0 = slot_0_59_0.info.presets.name:get()

	if not var_198_0 or var_198_0:gsub(" ", "") == "" then
		slot_0_64_0.new({
			"invalid name"
		})

		return
	end

	if var_198_0 == slot_0_73_2 then
		return
	end

	local var_198_1 = slot_0_71_2[var_198_0]

	if not var_198_1 then
		slot_0_64_0.new({
			"config not found"
		})

		return
	end

	local var_198_2 = slot_0_78_5(var_198_1)
	local var_198_3 = var_198_2 and slot_0_78_5(var_198_2.config) or nil

	if not var_198_3 then
		slot_0_64_0.new({
			"corrupt config"
		})

		return
	end

	local var_198_4, var_198_5 = slot_0_92_5()

	slot_0_100_12(var_198_3, var_198_4)

	if var_198_2.positions and slot_0_93_7(var_198_4, var_198_5) then
		local var_198_6, var_198_7 = pcall(slot_0_78_5, var_198_2.positions)

		if var_198_6 and var_198_7 then
			slot_0_83_4(var_198_7)
		end
	end

	if var_198_2.builder and slot_0_66_0 then
		local var_198_8, var_198_9 = pcall(slot_0_78_5, var_198_2.builder)

		if var_198_8 and var_198_9 then
			pcall(slot_0_66_0, var_198_9)
		end
	end

	if var_198_2.defensive and slot_0_68_0 then
		local var_198_10, var_198_11 = pcall(slot_0_78_5, var_198_2.defensive)

		if var_198_10 and var_198_11 then
			pcall(slot_0_68_0, var_198_11)
		end
	end

	slot_0_13_0:message(("loaded %s · %s"):format(var_198_2.author, var_198_0))
	slot_0_64_0.new({
		"loaded  ",
		var_198_0
	})
end

function slot_0_105_15()
	local var_199_0, var_199_1 = pcall(function()
		return common.get_username()
	end)

	return var_199_0 and var_199_1 and var_199_1 ~= "" and var_199_1 or ""
end

function slot_0_106_15()
	local var_201_0 = slot_0_59_0.info.presets.name:get()

	if not var_201_0 or var_201_0:gsub(" ", "") == "" then
		slot_0_64_0.new({
			"name cannot be empty"
		})

		return
	end

	if var_201_0 == slot_0_73_2 then
		return
	end

	local var_201_1 = false

	for iter_201_0, iter_201_1 in ipairs(slot_0_74_2) do
		if iter_201_1 == var_201_0 then
			var_201_1 = true

			break
		end
	end

	if var_201_1 then
		slot_0_64_0.new({
			"enter a new name to create config"
		})

		return
	end

	local var_201_2 = slot_0_99_11()
	local var_201_3 = slot_0_77_4(slot_0_82_3())
	local var_201_4 = slot_0_65_0 and slot_0_77_4(slot_0_65_0()) or nil
	local var_201_5 = slot_0_67_0 and slot_0_77_4(slot_0_67_0()) or nil

	if slot_0_71_2[var_201_0] then
		local var_201_6 = slot_0_78_5(slot_0_71_2[var_201_0])

		var_201_6.config = slot_0_77_4(var_201_2)
		var_201_6.positions = var_201_3

		if var_201_4 then
			var_201_6.builder = var_201_4
		end

		if var_201_5 then
			var_201_6.defensive = var_201_5
		end

		slot_0_103_13(var_201_0, slot_0_77_4(var_201_6))
	else
		local var_201_7 = {
			config = slot_0_77_4(var_201_2),
			positions = var_201_3,
			author = common.get_username(),
			time = common.get_unixtime()
		}

		if var_201_4 then
			var_201_7.builder = var_201_4
		end

		if var_201_5 then
			var_201_7.defensive = var_201_5
		end

		slot_0_103_13(var_201_0, slot_0_77_4(var_201_7))
	end

	slot_0_64_0.new({
		"saved  ",
		var_201_0
	})
end

function slot_0_107_14()
	local var_202_0 = slot_0_59_0.info.presets.name:get()

	if not var_202_0 or var_202_0:gsub(" ", "") == "" then
		slot_0_64_0.new({
			"enter a name first"
		})

		return
	end

	if var_202_0 == slot_0_73_2 then
		return
	end

	local var_202_1 = false

	for iter_202_0, iter_202_1 in ipairs(slot_0_74_2) do
		if iter_202_1 == var_202_0 then
			var_202_1 = true

			break
		end
	end

	if var_202_1 then
		slot_0_64_0.new({
			"cannot overwrite default"
		})

		return
	end

	if slot_0_71_2[var_202_0] then
		slot_0_64_0.new({
			"config already exists"
		})

		return
	end

	local var_202_2 = slot_0_99_11()
	local var_202_3 = slot_0_77_4(slot_0_82_3())
	local var_202_4 = {
		config = slot_0_77_4(var_202_2),
		positions = var_202_3,
		author = slot_0_105_15(),
		time = common.get_unixtime()
	}

	if slot_0_65_0 then
		local var_202_5 = slot_0_65_0()

		if var_202_5 then
			var_202_4.builder = slot_0_77_4(var_202_5)
		end
	end

	if slot_0_67_0 then
		local var_202_6 = slot_0_67_0()

		if var_202_6 then
			var_202_4.defensive = slot_0_77_4(var_202_6)
		end
	end

	slot_0_103_13(var_202_0, slot_0_77_4(var_202_4))
	slot_0_101_13()
	slot_0_64_0.new({
		"created  ",
		var_202_0
	})
end

slot_0_108_16 = nil

function slot_0_109_18(arg_203_0)
	local var_203_0 = slot_0_59_0.info.presets

	if arg_203_0 == "normal" then
		var_203_0.list:disabled(false)
		var_203_0.name:disabled(false)
		var_203_0.tabs:visibility(false)
		var_203_0.load:visibility(true)
		var_203_0.save:visibility(true)
		var_203_0.create:visibility(true)
		var_203_0.delete:visibility(true)
		var_203_0.import:visibility(true)
		var_203_0.export:visibility(true)
		var_203_0.cancel:visibility(false)
		var_203_0.confirm:visibility(false)
		slot_0_102_13()
	else
		var_203_0.list:disabled(true)
		var_203_0.name:disabled(true)
		var_203_0.tabs:visibility(true)
		var_203_0.load:visibility(false)
		var_203_0.save:visibility(false)
		var_203_0.create:visibility(false)
		var_203_0.delete:visibility(false)
		var_203_0.import:visibility(false)
		var_203_0.export:visibility(false)
		var_203_0.cancel:visibility(true)
		var_203_0.confirm:visibility(true)
	end
end

function slot_0_110_18()
	slot_0_108_16 = "export"

	slot_0_109_18("export")
end

function slot_0_111_23()
	local var_205_0 = slot_0_3_0.get()

	if not var_205_0 or var_205_0:gsub(" ", "") == "" then
		slot_0_64_0.new({
			"clipboard is empty"
		})

		return
	end

	slot_0_108_16 = "import"

	slot_0_109_18("import")
end

function slot_0_112_22()
	slot_0_108_16 = nil

	slot_0_109_18("normal")
end

function slot_0_113_19()
	function slot_207_0_0(arg_208_0, arg_208_1)
		local var_208_0 = arg_208_1 and "\a99FF99FF[ + ]" or "\aFF4D4DFF[ x ]"
		local var_208_1 = arg_208_1 and "\a99FF99FF" or "\a808080FF"

		return string.format("  %s %s%s\aDEFAULT", var_208_0, var_208_1, arg_208_0)
	end

	if slot_0_108_16 == "export" then
		slot_207_1_1, slot_207_2_1 = slot_0_92_5()
		slot_207_3_1 = not slot_207_2_1 or slot_0_95_7(slot_207_1_1, {
			"antiaim",
			"general"
		})
		slot_207_4_1 = not slot_207_2_1 or slot_0_95_7(slot_207_1_1, {
			"antiaim",
			"configure"
		})
		slot_207_5_1 = not slot_207_2_1 or slot_0_95_7(slot_207_1_1, {
			"antiaim",
			"defensive"
		})
		slot_207_6_1 = not slot_207_2_1 or slot_0_95_7(slot_207_1_1, {
			"info",
			"additions"
		})
		slot_207_7_1 = not slot_207_2_1 or slot_0_95_7(slot_207_1_1, {
			"info",
			"lc_ind"
		}) or slot_0_95_7(slot_207_1_1, {
			"info",
			"side_ind"
		}) or slot_0_95_7(slot_207_1_1, {
			"info",
			"crosshair"
		})
		slot_207_8_1 = not slot_207_2_1 or slot_0_95_7(slot_207_1_1, {
			"misc",
			"aimbot"
		})
		slot_207_9_2 = slot_0_93_7(slot_207_1_1, slot_207_2_1)
		slot_207_10_2 = {
			config = slot_0_77_4(slot_0_98_9(slot_207_1_1, slot_207_2_1)),
			author = slot_0_105_15(),
			time = common.get_unixtime()
		}
		slot_207_11_3 = {
			aa_gen = slot_207_3_1,
			vis_gen = slot_207_6_1,
			misc = slot_207_8_1,
			indicators = slot_207_7_1
		}

		if slot_207_4_1 and slot_0_65_0 then
			slot_207_12_5 = slot_0_65_0()

			if slot_207_12_5 then
				slot_207_10_2.builder = slot_0_77_4(slot_207_12_5)
				slot_207_11_3.builder = true
			end
		end

		if slot_207_5_1 and slot_0_67_0 then
			slot_207_12_4 = slot_0_67_0()

			if slot_207_12_4 then
				slot_207_10_2.defensive = slot_0_77_4(slot_207_12_4)
				slot_207_11_3.defensive = true
			end
		end

		if slot_207_9_2 then
			slot_207_10_2.positions = slot_0_77_4(slot_0_82_3())
			slot_207_11_3.positions = true
		end

		if slot_207_7_1 then
			pcall(function()
				local var_209_0 = serialize_ind_state()

				if var_209_0 then
					slot_207_10_2.ind_state = slot_0_77_4(var_209_0)
					slot_207_11_3.indicators = true
				end
			end)
		end

		pcall(function()
			slot_0_3_0.set(slot_0_77_4(slot_207_10_2))
		end)

		slot_207_12_3 = ((((("exported settings:\n" .. slot_207_0_0("anti-aim -> general", slot_207_11_3.aa_gen) .. "\n") .. slot_207_0_0("anti-aim -> builder", slot_207_11_3.builder) .. "\n") .. slot_207_0_0("anti-aim -> defensive", slot_207_11_3.defensive) .. "\n") .. slot_207_0_0("visuals -> general", slot_207_11_3.vis_gen) .. "\n") .. slot_207_0_0("visuals -> ui", slot_207_11_3.indicators) .. "\n") .. slot_207_0_0("misc", slot_207_11_3.misc)

		slot_0_13_0:message(slot_207_12_3)
		slot_0_64_0.new({
			"copied settings"
		})
	elseif slot_0_108_16 == "import" then
		slot_207_1_0 = slot_0_3_0.get()

		if not slot_207_1_0 or slot_207_1_0:gsub(" ", "") == "" then
			slot_0_64_0.new({
				"clipboard is empty"
			})

			return
		end

		slot_207_2_0, slot_207_3_0 = slot_0_92_5()
		slot_207_4_0 = slot_0_78_5(slot_207_1_0)

		if not slot_207_4_0 or not slot_207_4_0.config then
			slot_0_64_0.new({
				"invalid config data"
			})

			return
		end

		slot_207_5_0 = slot_0_78_5(slot_207_4_0.config)

		if not slot_207_5_0 then
			slot_0_64_0.new({
				"corrupt config"
			})

			return
		end

		slot_207_6_0 = {}

		function slot_207_7_0(arg_211_0, arg_211_1)
			for iter_211_0 in pairs(arg_211_0) do
				if iter_211_0:sub(1, #arg_211_1) == arg_211_1 then
					return true
				end
			end

			return false
		end

		slot_0_100_12(slot_207_5_0, slot_207_2_0)

		slot_207_6_0.aa_gen = (not slot_207_3_0 or slot_0_95_7(slot_207_2_0, {
			"antiaim",
			"general"
		})) and slot_207_7_0(slot_207_5_0, "antiaim")
		slot_207_6_0.vis_gen = (not slot_207_3_0 or slot_0_95_7(slot_207_2_0, {
			"info",
			"additions"
		})) and (slot_207_7_0(slot_207_5_0, "info") or slot_207_7_0(slot_207_5_0, "visuals"))
		slot_207_6_0.misc = (not slot_207_3_0 or slot_0_95_7(slot_207_2_0, {
			"misc",
			"aimbot"
		})) and slot_207_7_0(slot_207_5_0, "misc")

		if slot_207_4_0.positions and slot_0_93_7(slot_207_2_0, slot_207_3_0) then
			slot_207_8_0, slot_207_9_1 = pcall(slot_0_78_5, slot_207_4_0.positions)

			if slot_207_8_0 and slot_207_9_1 then
				slot_0_83_4(slot_207_9_1)
			end
		end

		if not slot_207_3_0 or slot_0_94_7(slot_207_2_0, "antiaim") then
			slot_207_9_0 = not slot_207_3_0 or slot_0_95_7(slot_207_2_0, {
				"antiaim",
				"configure"
			})
			slot_207_10_1 = not slot_207_3_0 or slot_0_95_7(slot_207_2_0, {
				"antiaim",
				"defensive"
			})

			if slot_207_9_0 and slot_207_4_0.builder and slot_0_66_0 then
				slot_207_11_2, slot_207_12_2 = pcall(slot_0_78_5, slot_207_4_0.builder)

				if slot_207_11_2 and slot_207_12_2 then
					pcall(slot_0_66_0, slot_207_12_2)

					slot_207_6_0.builder = true
				end
			end

			if slot_207_10_1 and slot_207_4_0.defensive and slot_0_68_0 then
				slot_207_11_1, slot_207_12_1 = pcall(slot_0_78_5, slot_207_4_0.defensive)

				if slot_207_11_1 and slot_207_12_1 then
					pcall(slot_0_68_0, slot_207_12_1)

					slot_207_6_0.defensive = true
				end
			end
		end

		if (not slot_207_3_0 or slot_0_94_7(slot_207_2_0, "visuals")) and (not slot_207_3_0 or slot_0_95_7(slot_207_2_0, {
			"info",
			"lc_ind"
		}) or slot_0_95_7(slot_207_2_0, {
			"info",
			"side_ind"
		}) or slot_0_95_7(slot_207_2_0, {
			"info",
			"crosshair"
		})) and slot_207_4_0.ind_state then
			slot_207_11_0, slot_207_12_0 = pcall(slot_0_78_5, slot_207_4_0.ind_state)

			if slot_207_11_0 and slot_207_12_0 then
				pcall(deserialize_ind_state, slot_207_12_0)

				slot_207_6_0.indicators = true
			end
		end

		slot_207_10_0 = ((((("imported settings:\n" .. slot_207_0_0("anti-aim -> general", slot_207_6_0.aa_gen) .. "\n") .. slot_207_0_0("anti-aim -> builder", slot_207_6_0.builder) .. "\n") .. slot_207_0_0("anti-aim -> defensive", slot_207_6_0.defensive) .. "\n") .. slot_207_0_0("visuals -> general", slot_207_6_0.vis_gen) .. "\n") .. slot_207_0_0("visuals -> ui", slot_207_6_0.indicators) .. "\n") .. slot_207_0_0("misc", slot_207_6_0.misc)

		slot_0_13_0:message(slot_207_10_0)
		slot_0_64_0.new({
			"imported settings"
		})
	end

	slot_0_108_16 = nil

	slot_0_109_18("normal")
end

function slot_0_114_19()
	local var_212_0 = slot_0_59_0.info.presets.name:get()

	if not var_212_0 or var_212_0:gsub(" ", "") == "" then
		return
	end

	if var_212_0 == slot_0_73_2 then
		return
	end

	if not slot_0_71_2[var_212_0] then
		return
	end

	slot_0_13_0:message(("deleted %s"):format(var_212_0))
	slot_0_64_0.new({
		"deleted  ",
		var_212_0
	})
	slot_0_103_13(var_212_0, nil)
end

slot_0_59_0.info.presets.load:set_callback(slot_0_104_14)
slot_0_59_0.info.presets.save:set_callback(slot_0_106_15)
slot_0_59_0.info.presets.create:set_callback(slot_0_107_14)
slot_0_59_0.info.presets.export:set_callback(slot_0_110_18)
slot_0_59_0.info.presets.import:set_callback(slot_0_111_23)
slot_0_59_0.info.presets.cancel:set_callback(slot_0_112_22)
slot_0_59_0.info.presets.confirm:set_callback(slot_0_113_19)
slot_0_59_0.info.presets.delete:set_callback(slot_0_114_19)
slot_0_59_0.info.presets.list:set_callback(slot_0_102_13, true)
events.shutdown(slot_0_75_3)
slot_0_75_3()

slot_0_70_0 = {}
slot_0_71_1 = 0
slot_0_72_1 = 2
slot_0_73_1 = false

events.createmove(function(arg_213_0)
	slot_0_73_1 = arg_213_0 and arg_213_0.in_jump or false
end)

function slot_0_70_0.get(arg_214_0)
	local var_214_0 = entity.get_local_player()

	if var_214_0 == nil or not var_214_0:is_alive() then
		slot_0_71_1 = 0

		return
	end

	if var_214_0:get_anim_state() == nil then
		return
	end

	local var_214_1 = var_214_0.m_flDuckAmount
	local var_214_2 = var_214_0.m_vecVelocity:length2d()
	local var_214_3 = not slot_0_73_1 and bit.band(var_214_0.m_fFlags or 0, 1) == 1
	local var_214_4 = slot_0_59_0.antiaim.angles.builder["legit aa"]

	if arg_214_0 and var_214_4 and var_214_4.allow_state:get() then
		slot_0_71_1 = 0

		return "legit aa"
	end

	local var_214_5 = false
	local var_214_6 = false
	local var_214_7 = false

	pcall(function()
		var_214_5 = slot_0_11_0.rage.main.double_tap:get()
	end)
	pcall(function()
		var_214_6 = slot_0_11_0.rage.main.hide_shots:get()
	end)
	pcall(function()
		var_214_7 = slot_0_11_0.antiaim.fake_lag.enabled_pui:get()
	end)

	if var_214_7 and not var_214_5 and not var_214_6 and var_214_2 > 1.11 then
		slot_0_71_1 = 0

		return "fakelag"
	end

	if var_214_3 then
		slot_0_71_1 = 0

		if slot_0_11_0.antiaim.misc.slow_walk:get() and var_214_2 > 1.11 and var_214_1 <= 0.5 then
			return "slowing"
		end

		if var_214_1 > 0.5 then
			return var_214_2 > 1.11 and "sneaking" or "crouching"
		end

		return var_214_2 > 1.11 and "running" or "standing"
	end

	slot_0_71_1 = slot_0_71_1 + 1

	if slot_0_71_1 < slot_0_72_1 then
		if var_214_1 > 0.5 then
			return var_214_2 > 1.11 and "sneaking" or "crouching"
		end

		return var_214_2 > 1.11 and "running" or "standing"
	end

	return var_214_1 > 0.5 and "air crouching" or "air"
end

function slot_0_70_0.visual(arg_218_0)
	local var_218_0 = entity.get_local_player()

	if var_218_0 == nil or not var_218_0:is_alive() then
		return
	end

	local var_218_1 = var_218_0.m_flDuckAmount or 0
	local var_218_2 = var_218_0.m_vecVelocity or vector(0, 0, 0)
	local var_218_3 = var_218_2.length2d and var_218_2:length2d() or math.sqrt((var_218_2.x or 0) * (var_218_2.x or 0) + (var_218_2.y or 0) * (var_218_2.y or 0))
	local var_218_4 = not slot_0_73_1 and bit.band(var_218_0.m_fFlags or 0, 1) == 1
	local var_218_5 = slot_0_59_0.antiaim.angles.builder["legit aa"]

	if arg_218_0 and var_218_5 and var_218_5.allow_state:get() then
		return "legit aa"
	end

	if var_218_4 then
		if slot_0_11_0.antiaim.misc.slow_walk:get() and var_218_3 > 1.11 and var_218_1 <= 0.5 then
			return "slowing"
		end

		if var_218_1 > 0.5 then
			return var_218_3 > 1.11 and "sneaking" or "crouching"
		end

		return var_218_3 > 1.11 and "running" or "standing"
	end

	return var_218_1 > 0.5 and "air crouching" or "air"
end

slot_0_71_0 = {
	think = function()
		local var_219_0 = slot_0_59_0.antiaim.general.manual_yaw

		if slot_0_58_0:is_active("key left") then
			return true, -90
		end

		if slot_0_58_0:is_active("key right") then
			return true, 90
		end

		if slot_0_58_0:is_active("key forward") then
			return true, 180
		end

		if slot_0_58_0:is_active("key back") then
			return true, 0
		end

		local var_219_1 = var_219_0.select:get()

		if var_219_1 == "disabled" then
			return false, 0
		end

		local var_219_2 = ({
			left = -90,
			back = 0,
			forward = 180,
			right = 90
		})[var_219_1:lower()]

		if not var_219_2 then
			return false, 0
		end

		return true, var_219_2
	end
}

function slot_0_71_0.update(arg_220_0, arg_220_1, arg_220_2)
	local var_220_0, var_220_1 = slot_0_71_0.think()
	local var_220_2 = slot_0_59_0.antiaim.general.manual_yaw.static:get()
	local var_220_3 = slot_0_59_0.antiaim.general.manual_yaw.inverter:get()
	local var_220_4 = slot_0_59_0.antiaim.general.manual_yaw.force_static and slot_0_59_0.antiaim.general.manual_yaw.force_static:get()
	local var_220_5 = slot_0_59_0.antiaim.general.manual_yaw.base and slot_0_59_0.antiaim.general.manual_yaw.base:get() or "at target"

	if var_220_0 then
		arg_220_1.yaw = "backward"
		arg_220_1.yaw_base = var_220_5 == "local view" and "Local View" or "At Target"
		arg_220_1.yaw_offset = var_220_1
		arg_220_1.freestanding = false
		arg_220_1.body_freestanding = false

		if var_220_4 then
			arg_220_1.yaw_modifier = "Disabled"
			arg_220_1.modifier_offset = 0
			arg_220_1.body_yaw = true
			arg_220_1.body_yaw_options = {}
			arg_220_1.left_limit = 60
			arg_220_1.right_limit = 60
			arg_220_1.freestand_peek = "off"
		end

		if var_220_2 then
			rage.antiaim:inverter(var_220_3)
		end
	end
end

slot_0_72_0 = {}
slot_0_73_0 = {}
slot_0_73_0.active = false
slot_0_74_1 = {
	[1] = "pistols",
	[9] = "grenades"
}
slot_0_75_2 = {
	CWeaponSSG08 = 1,
	CKnife = 7,
	pistols = 6,
	CWeaponTec9 = 5,
	CWeaponSCAR20 = 4,
	CWeaponG3SG1 = 3,
	CWeaponAWP = 2
}
slot_0_76_3 = {
	terrorist = {
		standing = {
			-2,
			-2,
			-6.4,
			-2,
			4.2,
			12,
			15
		},
		crouching = {
			2.4,
			2.4,
			2.4,
			2.4,
			-13,
			-13,
			-12
		},
		sneaking = {
			2.4,
			2.4,
			2.4,
			2.4,
			-9.3,
			-8,
			-9
		},
		["air crouching"] = {
			7.5,
			7.5,
			6,
			7,
			-3.5,
			-3.5,
			-15
		},
		air = {
			14,
			14,
			14,
			14,
			12,
			17,
			14
		}
	},
	counter_terrorist = {
		standing = {
			-3.6,
			-3.6,
			-4,
			-4,
			5.2,
			13,
			12
		},
		crouching = {
			-1,
			-1,
			4,
			0.2,
			-11,
			-8.5,
			-6
		},
		sneaking = {
			-1.6,
			-1.6,
			4.3,
			0,
			-7,
			-5,
			-14
		},
		["air crouching"] = {
			10,
			10,
			7,
			7,
			2,
			2,
			-12
		},
		air = {
			14,
			14,
			14,
			14,
			12,
			17,
			14
		}
	}
}
slot_0_77_3 = {
	terrorist = {
		air = 17,
		["air crouching"] = 11,
		sneaking = 16,
		crouching = 23,
		standing = 23
	},
	counter_terrorist = {
		air = 23,
		["air crouching"] = 14,
		sneaking = 30,
		crouching = 35,
		standing = 35
	}
}
slot_0_78_4 = {
	terrorist = {
		air = 43,
		["air crouching"] = 28,
		sneaking = 39,
		crouching = 41,
		standing = 63
	},
	counter_terrorist = {
		air = 65,
		["air crouching"] = 55,
		sneaking = 42,
		crouching = 44,
		standing = 61
	}
}

function slot_0_79_6(arg_221_0, arg_221_1)
	if not arg_221_1 or not arg_221_1:is_alive() then
		return nil
	end

	local var_221_0 = arg_221_1.m_vecVelocity and arg_221_1.m_vecVelocity:length2d() or 0
	local var_221_1 = (not arg_221_0 or not arg_221_0.in_jump) and bit.band(arg_221_1.m_fFlags or 0, 1) == 1
	local var_221_2 = var_221_1 and (arg_221_1.m_flDuckAmount or 0) > 0.5
	local var_221_3 = false
	local var_221_4 = false

	pcall(function()
		var_221_3 = var_221_1 and slot_0_11_0.antiaim.misc.fake_duck:get()
	end)
	pcall(function()
		var_221_4 = var_221_1 and var_221_0 > 1.11 and not var_221_2 and slot_0_11_0.antiaim.misc.slow_walk:get()
	end)

	if not var_221_1 then
		return (arg_221_0 and arg_221_0.in_duck or (arg_221_1.m_flDuckAmount or 0) > 0.5) and "air crouching" or "air"
	elseif var_221_2 or var_221_3 then
		return var_221_0 > 1.11 and "sneaking" or "crouching"
	elseif var_221_4 then
		return "slowing"
	elseif var_221_0 > 1.11 then
		return "running"
	end

	return "standing"
end

function slot_0_73_0.think(arg_224_0)
	local var_224_0 = entity.get_local_player()

	if not var_224_0 or not var_224_0:is_alive() then
		return false
	end

	if not slot_0_59_0.antiaim.general.safe_head.switch:get() then
		return false
	end

	local var_224_1 = entity.get_threat()
	local var_224_2 = entity.get_threat(true)

	if var_224_2 then
		var_224_1 = var_224_2
	end

	if not var_224_1 then
		return false
	end

	local var_224_3 = slot_0_79_6(arg_224_0, var_224_0)

	if var_224_3 == nil or var_224_3 == "running" or var_224_3 == "slowing" then
		return false
	end

	if (var_224_0.m_flNextAttack or 0) > globals.curtime then
		return false
	end

	local var_224_4 = var_224_0:get_player_weapon()

	if not var_224_4 then
		return false
	end

	local var_224_5, var_224_6, var_224_7 = pcall(function()
		return var_224_1:is_dormant(), var_224_1:is_alive()
	end)

	if not var_224_5 or var_224_6 or not var_224_7 then
		return false
	end

	local var_224_8, var_224_9 = pcall(function()
		return var_224_1:get_eye_position()
	end)

	if not var_224_8 or not var_224_9 then
		return false
	end

	local var_224_10 = var_224_0:get_eye_position():to(var_224_9):angles().x
	local var_224_11 = var_224_0.m_iTeamNum == 2 and "terrorist" or "counter_terrorist"
	local var_224_12 = slot_0_78_4[var_224_11]
	local var_224_13 = slot_0_76_3[var_224_11]

	if not var_224_12 or not var_224_12[var_224_3] or not var_224_13 or not var_224_13[var_224_3] then
		return false
	end

	if var_224_10 > var_224_12[var_224_3] then
		return false
	end

	local var_224_14 = var_224_4:get_classname()
	local var_224_15 = var_224_4:get_weapon_info()

	if var_224_10 < (var_224_13[var_224_3][slot_0_75_2[var_224_14] or slot_0_75_2[slot_0_74_1[var_224_15.weapon_type]]] or 15) then
		return false
	end

	return true, var_224_10, var_224_3, var_224_11, var_224_14
end

function slot_0_73_0.update(arg_227_0, arg_227_1, arg_227_2)
	slot_0_73_0.active = false

	local var_227_0, var_227_1, var_227_2, var_227_3, var_227_4 = slot_0_73_0.think(arg_227_0)

	if not var_227_0 then
		return false
	end

	if slot_0_72_0.think() or slot_0_71_0.think() then
		return false
	end

	local var_227_5 = entity.get_local_player()
	local var_227_6 = var_227_5 and var_227_5.m_vecVelocity and var_227_5.m_vecVelocity:length2d() or 0
	local var_227_7 = 0
	local var_227_8 = 0

	if var_227_3 == "terrorist" then
		if var_227_2 == "standing" then
			var_227_7 = -1
		elseif var_227_2 == "crouching" then
			var_227_7 = 32
			var_227_8 = 40
		elseif var_227_2 == "sneaking" then
			var_227_7 = 32
			var_227_8 = 40
			var_227_7 = var_227_7 + (arg_227_0.in_moveleft and -3 or arg_227_0.in_moveright and 4 or 0)
			var_227_7 = var_227_7 + (arg_227_0.in_forward and -5 or arg_227_0.in_back and 2 or 0)
		elseif var_227_2 == "air" then
			var_227_8 = 60
		elseif var_227_2 == "air crouching" then
			if var_227_4 == "CKnife" then
				var_227_7 = 10
			elseif var_227_6 > 100 then
				var_227_7 = 12
				var_227_8 = 60
			else
				var_227_7 = 24
				var_227_8 = 60
			end
		end
	elseif var_227_2 == "crouching" then
		var_227_7 = 32
		var_227_8 = 40
	elseif var_227_2 == "sneaking" then
		var_227_7 = 32
		var_227_8 = 40
		var_227_7 = var_227_7 + (arg_227_0.in_moveleft and -3 or arg_227_0.in_moveright and 4 or 0)
		var_227_7 = var_227_7 + (arg_227_0.in_forward and -3 or arg_227_0.in_back and 2 or 0)
	elseif var_227_2 == "air crouching" then
		if var_227_4 == "CKnife" then
			var_227_7 = 33
			var_227_8 = 60
		elseif var_227_6 > 100 then
			var_227_7 = 12
			var_227_8 = 60
		else
			var_227_7 = 35
			var_227_8 = 60
		end
	end

	local var_227_9 = slot_0_77_3[var_227_3]

	if not var_227_9 or not var_227_9[var_227_2] then
		return false
	end

	if var_227_1 > var_227_9[var_227_2] then
		var_227_7 = var_227_7 + 12
	end

	local var_227_10 = math.max(0, math.min(58, var_227_8))

	arg_227_1.pitch = "Down"
	arg_227_1.yaw = "backward"
	arg_227_1.yaw_base = "At target"
	arg_227_1.avoid_backstab = false
	arg_227_1.yaw_offset = var_227_7
	arg_227_1.yaw_modifier = "Disabled"
	arg_227_1.modifier_offset = 0
	arg_227_1.body_yaw = true
	arg_227_1.inverter = false
	arg_227_1.left_limit = var_227_10
	arg_227_1.right_limit = var_227_10
	arg_227_1.body_yaw_options = {}
	arg_227_1.freestanding = false
	arg_227_1.body_freestanding = false
	arg_227_1.freestand_peek = "off"
	arg_227_1.disable_yaw_modifiers = true

	slot_0_11_0.antiaim.angles.options:override({})

	slot_0_73_0.active = true

	return true
end

slot_0_74_0 = {}
slot_0_75_1 = {
	Head = {
		0
	},
	Chest = {
		4,
		5,
		6
	},
	Stomach = {
		2,
		3
	},
	Arms = {
		13,
		14,
		15,
		16,
		17,
		18
	},
	Legs = {
		7,
		8,
		9,
		10
	},
	Feet = {
		11,
		12
	}
}
slot_0_76_2 = {
	0,
	5,
	2,
	15,
	17,
	9,
	10
}
slot_0_77_2 = {}
slot_0_78_3 = 6
slot_0_79_5 = 18
slot_0_80_3 = 18
slot_0_81_3 = 40
slot_0_82_2 = {
	rage_hitboxes_str = "",
	active_point_index = 0,
	last_returning_time = 0,
	middle_pos = vector(),
	positions = {},
	forward_positions = {}
}
slot_0_83_3 = slot_0_11_0.rage.selection.hitboxes
slot_0_84_4 = slot_0_11_0.rage.selection.body_aim
slot_0_85_4 = slot_0_11_0.rage.selection.autoscope
slot_0_86_4 = slot_0_11_0.rage.selection.minimum_damage
slot_0_87_5 = slot_0_11_0.rage.main.peek_assist.switch
slot_0_88_6 = slot_0_11_0.rage.main.peek_assist.retreat_mode
slot_0_89_4 = slot_0_11_0.rage.main.double_tap
slot_0_90_5 = slot_0_11_0.rage.main.hide_shots

function slot_0_91_4(arg_228_0, arg_228_1)
	for iter_228_0 = 1, #arg_228_0 do
		if arg_228_0[iter_228_0] == arg_228_1 then
			return true
		end
	end

	return false
end

function slot_0_92_4(arg_229_0)
	local var_229_0, var_229_1 = pcall(function()
		return arg_229_0:get()
	end)

	if not var_229_0 or not var_229_1 then
		return
	end

	local var_229_2 = {}
	local var_229_3 = pcall(function()
		return slot_0_84_4.value
	end) and slot_0_84_4.value == "Force"
	local var_229_4 = {
		Arms = true,
		Legs = true,
		Feet = true,
		Head = true
	}

	for iter_229_0 = 1, #var_229_1 do
		if var_229_3 and var_229_4[var_229_1[iter_229_0]] then
			-- block empty
		else
			local var_229_5 = slot_0_75_1[var_229_1[iter_229_0]]

			if var_229_5 then
				for iter_229_1 = 1, #var_229_5 do
					if slot_0_91_4(slot_0_76_2, var_229_5[iter_229_1]) then
						table.insert(var_229_2, var_229_5[iter_229_1])
					end
				end
			end
		end
	end

	if #var_229_2 > 0 then
		slot_0_77_2 = var_229_2
	end
end

slot_0_84_4:set_callback(function()
	slot_0_92_4(slot_0_83_3)
end, true)

function slot_0_93_6(arg_233_0)
	return arg_233_0:is_player() and arg_233_0:is_enemy()
end

function slot_0_94_6(arg_234_0, arg_234_1, arg_234_2)
	local var_234_0 = arg_234_2 * math.pi / 180

	return vector(arg_234_0.x + math.cos(var_234_0) * arg_234_1, arg_234_0.y + math.sin(var_234_0) * arg_234_1, arg_234_0.z)
end

function slot_0_95_6(arg_235_0, arg_235_1, arg_235_2)
	local var_235_0 = arg_235_2:get_origin()
	local var_235_1 = arg_235_1 - var_235_0
	local var_235_2 = math.sqrt(var_235_1.x * var_235_1.x + var_235_1.y * var_235_1.y)

	if var_235_2 < 0.1 then
		return
	end

	local var_235_3 = var_235_0:to(arg_235_1):angles().y

	arg_235_0.in_forward = true
	arg_235_0.in_back = false
	arg_235_0.in_moveleft = false
	arg_235_0.in_moveright = false
	arg_235_0.forwardmove = var_235_2 < 12 and 450 * (var_235_2 / 12) or 450
	arg_235_0.sidemove = 0
	arg_235_0.move_yaw = var_235_3
end

function slot_0_96_7(arg_236_0, arg_236_1, arg_236_2, arg_236_3, arg_236_4, arg_236_5, arg_236_6, arg_236_7, arg_236_8)
	local var_236_0 = arg_236_1 and arg_236_1 - arg_236_5 or arg_236_0
	local var_236_1 = slot_0_94_6(var_236_0, arg_236_4 == 0 and 0 or arg_236_3, arg_236_2)
	local var_236_2 = utils.trace_hull(var_236_0, var_236_0 + vector(0, 0, arg_236_8), arg_236_6, arg_236_7, slot_0_93_6, 33636363).end_pos
	local var_236_3 = utils.trace_hull(vector(var_236_0.x, var_236_0.y, var_236_2.z), vector(var_236_1.x, var_236_1.y, var_236_2.z), arg_236_6, arg_236_7, slot_0_93_6, 33636363).end_pos

	if var_236_1:dist2d(var_236_3) >= arg_236_3 * 0.97 then
		return false
	end

	return utils.trace_hull(var_236_3, vector(var_236_3.x, var_236_3.y, arg_236_0.z - 240), arg_236_6, arg_236_7, slot_0_93_6, 33636363).end_pos + arg_236_5
end

function slot_0_97_8(arg_237_0, arg_237_1, arg_237_2)
	local var_237_0 = arg_237_0.m_vecViewOffset
	local var_237_1 = arg_237_0.m_vecMins
	local var_237_2 = arg_237_0.m_vecMaxs

	for iter_237_0 in pairs(slot_0_82_2.positions) do
		slot_0_82_2.positions[iter_237_0] = nil
	end

	for iter_237_1 in pairs(slot_0_82_2.forward_positions) do
		slot_0_82_2.forward_positions[iter_237_1] = nil
	end

	local var_237_3 = 18
	local var_237_4 = 22
	local var_237_5 = 4

	slot_0_82_2.positions[0] = slot_0_96_7(arg_237_1, nil, 0, var_237_4, 0, var_237_0, var_237_1, var_237_2, var_237_3)

	for iter_237_2 = 1, var_237_5 do
		local var_237_6 = iter_237_2 % 2 == 0 and arg_237_2 - 90 or arg_237_2 + 90
		local var_237_7 = slot_0_82_2.positions[iter_237_2 <= 2 and 0 or iter_237_2 - 2]

		if not var_237_7 then
			for iter_237_3 = iter_237_2, var_237_5, 2 do
				slot_0_82_2.positions[iter_237_3] = false
			end
		else
			local var_237_8 = slot_0_96_7(arg_237_1, var_237_7, var_237_6, var_237_4, iter_237_2, var_237_0, var_237_1, var_237_2, var_237_3)

			if not var_237_8 or var_237_3 < math.abs(var_237_7.z - var_237_8.z) then
				for iter_237_4 = iter_237_2, var_237_5, 2 do
					slot_0_82_2.positions[iter_237_4] = false
				end
			else
				slot_0_82_2.positions[iter_237_2] = var_237_8
			end
		end
	end

	local var_237_9 = slot_0_82_2.positions[0]
	local var_237_10 = {
		arg_237_2,
		arg_237_2 - 20,
		arg_237_2 + 20,
		arg_237_2 - 40,
		arg_237_2 + 40
	}

	for iter_237_5 = 1, #var_237_10 do
		if not var_237_9 then
			slot_0_82_2.forward_positions[iter_237_5] = false
		else
			local var_237_11 = slot_0_96_7(arg_237_1, var_237_9 - var_237_0, var_237_10[iter_237_5], var_237_4, 1, var_237_0, var_237_1, var_237_2, var_237_3)

			slot_0_82_2.forward_positions[iter_237_5] = var_237_11 and var_237_3 >= math.abs(var_237_9.z - var_237_11.z) and var_237_11 or false
		end
	end

	return slot_0_82_2.positions
end

function slot_0_98_8(arg_238_0, arg_238_1, arg_238_2)
	local var_238_0 = 0

	slot_0_10_0(true, false, function(arg_239_0)
		if arg_239_0:is_dormant() or not arg_239_0:is_alive() then
			return
		end

		for iter_239_0 = 1, #arg_238_2 do
			local var_239_0 = arg_239_0:get_hitbox_position(arg_238_2[iter_239_0])

			if var_239_0 then
				local var_239_1 = utils.trace_bullet(arg_238_1, arg_238_0, var_239_0, slot_0_93_6)

				if var_239_1 and var_239_1 > 0 then
					var_238_0 = var_238_0 + 1

					return
				end
			end
		end
	end)

	return var_238_0
end

function slot_0_99_10(arg_240_0, arg_240_1)
	if not arg_240_1 then
		return false
	end

	return math.max(arg_240_0.m_flNextAttack or 0, arg_240_1.m_flNextPrimaryAttack or 0) <= globals.curtime and (arg_240_1.m_iClip1 or 0) > 0
end

slot_0_100_11 = {
	CWeaponSSG08 = true,
	CWeaponSCAR20 = true,
	CWeaponG3SG1 = true,
	CWeaponAWP = true
}

function slot_0_101_12(arg_241_0, arg_241_1)
	if not arg_241_1 or arg_241_1:is_dormant() or not arg_241_1:is_alive() then
		return false
	end

	local var_241_0 = arg_241_0:get_player_weapon()

	if not var_241_0 or not slot_0_99_10(arg_241_0, var_241_0) then
		return false
	end

	local var_241_1 = var_241_0:get_classname()

	if var_241_1 and slot_0_100_11[var_241_1] then
		local var_241_2, var_241_3 = pcall(function()
			return arg_241_0.m_bIsScoped
		end)

		if not slot_0_85_4:get() and (not var_241_2 or not var_241_3) then
			return false
		end
	end

	return true
end

function slot_0_102_12(arg_243_0)
	if (arg_243_0.m_flDuckAmount or 0) < 0.6 then
		return false
	end

	local var_243_0, var_243_1 = pcall(function()
		return arg_243_0:get_eye_position()
	end)
	local var_243_2, var_243_3 = pcall(function()
		return arg_243_0:get_origin()
	end)

	if not var_243_0 or not var_243_2 or not var_243_1 or not var_243_3 then
		return false
	end

	return var_243_1.z - var_243_3.z > 56
end

function slot_0_103_12(arg_246_0, arg_246_1, arg_246_2, arg_246_3, arg_246_4)
	local var_246_0 = math.clamp(slot_0_86_4:get(), 1, 130)
	local var_246_1 = {}

	for iter_246_0 = 0, 10 do
		if arg_246_0[iter_246_0] then
			var_246_1[#var_246_1 + 1] = arg_246_0[iter_246_0]
		end
	end

	for iter_246_1 = 1, 10 do
		if arg_246_1[iter_246_1] then
			var_246_1[#var_246_1 + 1] = arg_246_1[iter_246_1]
		end
	end

	for iter_246_2 = 1, #var_246_1 do
		local var_246_2 = var_246_1[iter_246_2]

		for iter_246_3 = 1, #arg_246_4 do
			local var_246_3 = arg_246_4[iter_246_3]
			local var_246_4 = arg_246_3:get_hitbox_position(var_246_3)

			if var_246_4 then
				if var_246_3 == 0 then
					var_246_4.z = var_246_4.z + 5.2
				end

				local var_246_5 = utils.trace_bullet(arg_246_2, var_246_2, var_246_4, slot_0_93_6)

				if var_246_5 and var_246_0 <= var_246_5 then
					slot_0_82_2.last_peek_pos = var_246_4

					return var_246_2, iter_246_2
				end
			end
		end
	end

	return nil, 0
end

function slot_0_104_13()
	slot_0_87_5:override()
	slot_0_88_6:override()
	pcall(function()
		slot_0_89_4:override()
	end)
	pcall(function()
		slot_0_90_5:override()
	end)
end

slot_0_105_14 = false
slot_0_106_14 = false
slot_0_107_13 = false
slot_0_108_15 = false
slot_0_109_17 = false
slot_0_110_17 = false
slot_0_111_22 = false
slot_0_112_21 = 0
slot_0_113_18 = false
slot_0_114_18 = nil
slot_0_115_17 = nil
slot_0_116_14 = 0
slot_0_117_14 = false
slot_0_118_13 = 0
slot_0_119_12 = false
slot_0_120_12 = -100

events.level_init(function()
	slot_0_113_18 = false
	slot_0_114_18 = nil
	slot_0_115_17 = nil
	slot_0_116_14 = 0
	slot_0_117_14 = false
	slot_0_118_13 = 0
	slot_0_119_12 = false
	slot_0_120_12 = -100
end)

slot_0_121_11 = {
	"CKnife",
	"CKnifeGold",
	"CKnifeCT",
	"CKnifeT",
	"CKnifeGhost",
	"CKnifeWidowmaker",
	"CKnifeCaesar",
	"CKnifeSkeletonKnife",
	"CKnifeCord",
	"CKnifeFalchion",
	"CKnifeButterfly",
	"CKnifeKarambit",
	"CKnifeM9Bayonet",
	"CKnifeTactical",
	"CKnifeFlip",
	"CKnifeGut",
	"CKnifeHunter",
	"CKnifeNomad",
	"CKnifeParacord",
	"CKnifeShadowDagger",
	"CKnifeStiletto",
	"CKnifeSurvivalBowie",
	"CKnifeUrsus",
	"CKnifeYatagan"
}

function slot_0_122_12(arg_251_0)
	local var_251_0 = arg_251_0:get_index()

	for iter_251_0, iter_251_1 in ipairs(slot_0_121_11) do
		local var_251_1, var_251_2 = pcall(entity.get_entities, iter_251_1)

		if var_251_1 and var_251_2 then
			for iter_251_2, iter_251_3 in ipairs(var_251_2) do
				local var_251_3 = iter_251_3.m_hOwnerEntity

				if var_251_3 and var_251_3:get_index() == var_251_0 then
					return iter_251_3
				end
			end
		end
	end

	for iter_251_4, iter_251_5 in ipairs(entity.get_entities("CBaseCombatWeapon")) do
		local var_251_4 = iter_251_5.m_hOwnerEntity

		if var_251_4 and var_251_4:get_index() == var_251_0 then
			local var_251_5 = iter_251_5:get_classname()

			if var_251_5:find("knife") or var_251_5:find("bayonet") or var_251_5 == "weapon_knifegg" then
				return iter_251_5
			end
		end
	end

	return nil
end

function slot_0_123_10(arg_252_0)
	slot_252_2_0 = slot_0_59_0.antiaim.general.aipeek.switch.value or slot_0_58_0:is_active("ai peek")

	if slot_252_2_0 then
		slot_0_120_12 = globals.tickcount
	end

	if slot_252_2_0 and not slot_0_111_22 then
		slot_0_111_22 = true
		slot_0_105_14 = false
		slot_0_106_14 = false
		slot_0_82_2.middle_pos = entity.get_local_player() and entity.get_local_player():get_origin() or vector()
	elseif not slot_252_2_0 and slot_0_111_22 then
		slot_0_111_22 = false
		slot_0_105_14 = false
		slot_0_106_14 = false
		slot_0_112_21 = 0
		cached_index = 0
		slot_0_82_2.active_point_index = 0

		slot_0_104_13()
	end

	if not slot_252_2_0 then
		return
	end

	slot_252_3_0, slot_252_4_0 = pcall(function()
		return slot_0_83_3:get()
	end)

	if slot_252_3_0 and slot_252_4_0 then
		slot_252_5_1 = table.concat(slot_252_4_0)

		if slot_252_5_1 ~= slot_0_82_2.rage_hitboxes_str then
			slot_0_92_4(slot_0_83_3)

			slot_0_82_2.rage_hitboxes_str = slot_252_5_1
		end
	end

	if #slot_0_77_2 == 0 then
		slot_0_92_4(slot_0_83_3)
	end

	slot_252_5_0 = entity.get_local_player()

	if not slot_252_5_0 or not slot_252_5_0:is_alive() then
		slot_0_105_14 = false
		slot_0_106_14 = false
		slot_0_110_17 = false
		slot_0_107_13 = false
		slot_0_109_17 = false

		slot_0_104_13()

		return
	end

	slot_252_6_0 = globals.tickcount
	slot_252_7_0 = bit.band(slot_252_5_0.m_fFlags or 0, 1) ~= 1 or arg_252_0.in_forward or arg_252_0.in_moveleft or arg_252_0.in_moveright or arg_252_0.in_back or arg_252_0.in_jump
	slot_252_8_0 = slot_252_5_0:get_origin()
	slot_252_9_0 = slot_0_82_2.middle_pos
	slot_252_10_0 = slot_252_9_0:dist2d(slot_252_8_0)
	slot_252_11_0 = entity.get_threat()

	if not slot_252_11_0 or slot_252_11_0:is_dormant() or not slot_252_11_0:is_alive() then
		slot_252_12_1 = slot_252_5_0:get_origin()
		slot_252_13_1 = math.huge
		slot_252_14_1 = nil

		slot_0_10_0(true, false, function(arg_254_0)
			if arg_254_0:is_dormant() or not arg_254_0:is_alive() then
				return
			end

			if slot_0_102_12(arg_254_0) then
				return
			end

			local var_254_0 = slot_252_12_1:dist(arg_254_0:get_origin())

			if var_254_0 < slot_252_13_1 then
				slot_252_13_1 = var_254_0
				slot_252_14_1 = arg_254_0
			end
		end)

		slot_252_11_0 = slot_252_14_1
	end

	slot_252_12_0 = slot_252_11_0 and slot_252_11_0:get_origin() or vector()
	slot_252_13_0 = slot_252_11_0 and slot_252_9_0:to(slot_252_12_0):angles().y or render.camera_angles().y
	slot_252_14_0 = slot_0_97_8(slot_252_5_0, slot_252_9_0, slot_252_13_0)
	slot_252_15_0 = nil
	slot_252_16_0 = 0

	if not slot_252_7_0 and not slot_0_106_14 and slot_0_101_12(slot_252_5_0, slot_252_11_0) and slot_252_11_0 and not slot_0_102_12(slot_252_11_0) then
		slot_252_15_0, slot_252_16_0 = slot_0_103_12(slot_252_14_0, slot_0_82_2.forward_positions, slot_252_5_0, slot_252_11_0, slot_0_77_2)
	end

	slot_0_105_14 = slot_252_15_0 ~= nil
	slot_0_82_2.active_point_index = slot_252_16_0

	if slot_0_105_14 then
		slot_0_95_6(arg_252_0, slot_252_15_0, slot_252_5_0)

		slot_0_106_14 = false
		slot_0_110_17 = true
		slot_0_107_13 = false
		slot_0_108_15 = false
		slot_0_109_17 = false
	elseif slot_252_7_0 then
		slot_0_106_14 = false
		slot_0_110_17 = false
		slot_0_107_13 = false
		slot_0_108_15 = false
		slot_0_109_17 = false
	else
		if slot_0_112_21 > 0 then
			slot_0_112_21 = slot_0_112_21 - 1

			if slot_252_10_0 >= 3 then
				slot_0_95_6(arg_252_0, slot_252_9_0, slot_252_5_0)
			end
		elseif slot_252_10_0 >= 3 then
			if not slot_0_106_14 then
				slot_0_107_13 = true
				slot_0_108_15 = false
			end

			slot_0_106_14 = true
		else
			slot_0_106_14 = false
			slot_0_107_13 = false
			slot_0_108_15 = false
		end

		slot_0_110_17 = false
	end

	if not slot_0_106_14 then
		slot_0_82_2.last_returning_time = slot_252_6_0
	end

	if slot_0_106_14 then
		if slot_252_10_0 < 3 then
			slot_0_106_14 = false
			slot_0_107_13 = false
			slot_0_108_15 = false
			slot_0_109_17 = false
		elseif slot_0_107_13 then
			if not slot_0_108_15 then
				slot_0_108_15 = true

				slot_0_11_0.antiaim.fake_lag.limit:override(14)
				slot_0_11_0.rage.main.double_tap_lag_options:override("Always on")
				pcall(function()
					rage.exploit:allow_defensive(true)
				end)
			elseif slot_252_6_0 - slot_0_82_2.last_returning_time >= 6 then
				pcall(function()
					rage.exploit:force_teleport()
				end)
				slot_0_11_0.antiaim.fake_lag.limit:override()

				slot_0_107_13 = false
				slot_0_108_15 = false
				slot_0_106_14 = false
				slot_0_109_17 = true
				slot_0_112_21 = 20
			end
		end

		if not slot_252_7_0 and slot_252_10_0 >= 3 then
			slot_0_95_6(arg_252_0, slot_252_9_0, slot_252_5_0)
		end
	end

	if slot_0_105_14 or slot_0_106_14 then
		slot_0_87_5:override(true)
	else
		slot_0_87_5:override()
	end

	if slot_0_105_14 then
		slot_0_88_6:override("On Shot")
	elseif slot_0_106_14 then
		slot_0_88_6:override({
			"On Shot",
			"On Key Release"
		})
	else
		slot_0_88_6:override()
	end

	if slot_0_107_13 or slot_0_106_14 then
		slot_0_11_0.rage.main.double_tap_lag_options:override("Always on")
	else
		slot_0_11_0.rage.main.double_tap_lag_options:override()
	end

	if slot_0_109_17 then
		pcall(function()
			slot_0_89_4:override()
		end)
		pcall(function()
			slot_0_90_5:override()
		end)
	end
end

slot_0_124_10 = 0
slot_0_125_7 = {}
slot_0_126_9 = 64
slot_0_127_7 = 0.9
slot_0_128_8 = 0
slot_0_129_6 = 0.016
slot_0_130_4 = 0
slot_0_131_3 = 0
slot_0_132_3 = 0
slot_0_133_3 = 7
slot_0_134_3 = 0
slot_0_135_3 = 0
slot_0_136_3 = 0
slot_0_137_2 = 0
slot_0_138_2 = 0
slot_0_139_2 = 0
slot_0_140_2 = false
slot_0_141_2 = false

function slot_0_142_1(arg_259_0)
	return math.max(0, math.min(255, math.floor(arg_259_0 + 0.5)))
end

function slot_0_143_1(arg_260_0, arg_260_1, arg_260_2, arg_260_3, arg_260_4, arg_260_5, arg_260_6, arg_260_7)
	if arg_260_7 < 3 then
		return
	end

	local var_260_0 = arg_260_2 - arg_260_0
	local var_260_1 = arg_260_3 - arg_260_1
	local var_260_2 = math.sqrt(var_260_0 * var_260_0 + var_260_1 * var_260_1)

	if var_260_2 < 0.5 then
		return
	end

	local var_260_3 = 1 / var_260_2
	local var_260_4 = -var_260_1 * var_260_3
	local var_260_5 = var_260_0 * var_260_3
	local var_260_6 = {
		{
			d = 5,
			ao = 0.3
		},
		{
			d = 3,
			ao = 0.52
		},
		{
			d = 2,
			ao = 0.72
		},
		{
			d = 1,
			ao = 0.9
		},
		{
			bright = true,
			d = 0,
			ao = 1
		}
	}

	for iter_260_0, iter_260_1 in ipairs(var_260_6) do
		local var_260_7 = slot_0_142_1(arg_260_7 * iter_260_1.ao)

		if var_260_7 < 2 then
			-- block empty
		else
			local var_260_8 = iter_260_1.bright and slot_0_142_1(arg_260_4 + 80) or arg_260_4
			local var_260_9 = iter_260_1.bright and slot_0_142_1(arg_260_5 + 80) or arg_260_5
			local var_260_10 = iter_260_1.bright and slot_0_142_1(arg_260_6 + 80) or arg_260_6
			local var_260_11 = color(var_260_8, var_260_9, var_260_10, var_260_7)

			if iter_260_1.d > 0 then
				render.line(vector(math.floor(arg_260_0 + var_260_4 * iter_260_1.d + 0.5), math.floor(arg_260_1 + var_260_5 * iter_260_1.d + 0.5)), vector(math.floor(arg_260_2 + var_260_4 * iter_260_1.d + 0.5), math.floor(arg_260_3 + var_260_5 * iter_260_1.d + 0.5)), var_260_11)
				render.line(vector(math.floor(arg_260_0 - var_260_4 * iter_260_1.d + 0.5), math.floor(arg_260_1 - var_260_5 * iter_260_1.d + 0.5)), vector(math.floor(arg_260_2 - var_260_4 * iter_260_1.d + 0.5), math.floor(arg_260_3 - var_260_5 * iter_260_1.d + 0.5)), var_260_11)
			else
				render.line(vector(math.floor(arg_260_0 + 0.5), math.floor(arg_260_1 + 0.5)), vector(math.floor(arg_260_2 + 0.5), math.floor(arg_260_3 + 0.5)), var_260_11)
			end
		end
	end
end

function slot_0_144_1(arg_261_0, arg_261_1, arg_261_2, arg_261_3, arg_261_4, arg_261_5, arg_261_6)
	if arg_261_5 < 4 then
		return
	end

	local var_261_0 = arg_261_6 or 0
	local var_261_1 = math.floor(arg_261_0 + 0.5)
	local var_261_2 = math.floor(arg_261_1 + 0.5)

	render.circle_outline(vector(var_261_1, var_261_2), color(arg_261_2, arg_261_3, arg_261_4, slot_0_142_1(arg_261_5 * 0.42)), slot_0_142_1(8 + var_261_0 * 2), 0, 360, 3)
	render.circle_outline(vector(var_261_1, var_261_2), color(arg_261_2, arg_261_3, arg_261_4, slot_0_142_1(arg_261_5 * 0.68)), slot_0_142_1(6 + var_261_0), 0, 360, 2)
	render.circle_outline(vector(var_261_1, var_261_2), color(slot_0_142_1(arg_261_2 + 50), slot_0_142_1(arg_261_3 + 50), slot_0_142_1(arg_261_4 + 50), slot_0_142_1(arg_261_5 * 0.9)), 4, 0, 360, 1)
	render.circle_outline(vector(var_261_1, var_261_2), color(slot_0_142_1(arg_261_2 + 80), slot_0_142_1(arg_261_3 + 80), slot_0_142_1(arg_261_4 + 80), arg_261_5), 2, 0, 360, 1)
	render.circle(vector(var_261_1, var_261_2), color(slot_0_142_1(arg_261_2 + 100), slot_0_142_1(arg_261_3 + 100), slot_0_142_1(arg_261_4 + 100), arg_261_5), 1, 0, 360)
end

slot_0_145_1 = nil
slot_0_146_1 = nil
slot_0_147_1 = false
slot_0_148_0 = {}

function slot_0_149_0(arg_262_0, arg_262_1, arg_262_2, arg_262_3)
	if not (arg_262_0.switch.value or slot_0_58_0:is_active("ai peek")) then
		slot_0_125_7 = {}
		slot_0_128_8 = 0
		slot_0_140_2 = false
		slot_0_131_3 = 0
		slot_0_132_3 = 0
		slot_0_145_1 = nil
		slot_0_146_1 = nil
		slot_0_147_1 = false

		return
	end

	slot_262_5_0 = arg_262_1:get_origin()
	slot_262_6_0 = arg_262_1.m_vecViewOffset
	slot_262_7_0 = slot_0_105_14 or slot_0_106_14
	slot_262_8_0 = render.world_to_screen(vector(slot_262_5_0.x, slot_262_5_0.y, slot_262_5_0.z + slot_262_6_0.z * 0.82))

	if not slot_262_8_0 then
		return
	end

	slot_262_9_0 = slot_262_8_0.y
	slot_262_10_0 = slot_262_8_0.x
	slot_262_11_0 = false

	if slot_0_145_1 then
		slot_262_12_1 = slot_262_5_0.x - slot_0_145_1
		slot_262_13_1 = slot_262_5_0.y - slot_0_146_1

		if slot_262_12_1 * slot_262_12_1 + slot_262_13_1 * slot_262_13_1 > 10000 then
			slot_262_11_0 = true
		end
	end

	slot_0_145_1 = slot_262_5_0.x
	slot_0_146_1 = slot_262_5_0.y
	slot_262_12_0 = arg_262_0.color.value
	slot_262_13_0 = slot_262_12_0.r
	slot_262_14_0 = slot_262_12_0.g
	slot_262_15_0 = slot_262_12_0.b
	slot_262_16_0 = slot_262_12_0.a

	if slot_262_11_0 then
		slot_0_125_7 = {}
		slot_0_140_2 = false
		slot_0_132_3 = 0
		slot_0_131_3 = 0
		slot_0_147_1 = false
		slot_0_82_2.last_peek_pos = nil
	end

	if not slot_262_7_0 or not slot_0_82_2.last_peek_pos then
		slot_0_132_3 = 0
		slot_0_131_3 = 0
		slot_0_125_7 = {}
		slot_0_147_1 = false

		if slot_0_136_3 == 0 then
			slot_0_136_3 = slot_262_10_0
		end

		slot_262_17_2 = 1 - math.exp(-16 * math.min(arg_262_3, 0.05))
		slot_0_136_3 = slot_0_136_3 + (slot_262_10_0 - slot_0_136_3) * slot_262_17_2
		slot_262_18_1 = math.abs(slot_0_136_3 - slot_262_10_0)

		if slot_262_18_1 < 1.5 then
			slot_0_136_3 = slot_262_10_0
			slot_0_140_2 = false
		end

		slot_262_19_1 = (math.sin(arg_262_2 * 3.4) * 0.5 + 0.5)^2
		slot_262_20_1 = slot_262_18_1 < 6 and slot_0_142_1(slot_262_16_0 * (0.65 + 0.35 * slot_262_19_1)) or slot_0_142_1(slot_262_16_0 * math.min(0.8, slot_262_18_1 / 80))
		slot_262_21_1 = slot_262_18_1 < 6 and slot_262_19_1 or 0

		slot_0_144_1(math.floor(slot_0_136_3 + 0.5), math.floor(slot_262_9_0 + 0.5), slot_262_13_0, slot_262_14_0, slot_262_15_0, slot_262_20_1, slot_262_21_1)

		return
	end

	slot_0_147_1 = false
	slot_262_17_1 = nil
	slot_262_18_0 = render.screen_size().x
	slot_262_19_0 = slot_262_18_0 * 0.5
	slot_262_20_0 = 200
	slot_262_21_0 = arg_262_1.m_vecVelocity
	slot_262_22_0 = slot_262_21_0.x
	slot_262_23_0 = slot_262_21_0.y
	slot_262_24_0 = math.sqrt(slot_262_22_0 * slot_262_22_0 + slot_262_23_0 * slot_262_23_0)

	if slot_262_24_0 > 20 then
		slot_262_25_2 = render.camera_angles().y * math.pi / 180
		slot_262_26_2 = slot_262_22_0 * math.sin(slot_262_25_2) - slot_262_23_0 * math.cos(slot_262_25_2)
		slot_262_17_1 = slot_262_10_0 + math.max(-1, math.min(1, slot_262_26_2 / math.max(slot_262_24_0, 1))) * slot_262_20_0
	else
		slot_262_25_1 = slot_0_82_2.last_peek_pos

		if slot_262_25_1 then
			slot_262_26_1 = render.world_to_screen(vector(slot_262_25_1.x, slot_262_25_1.y, slot_262_25_1.z + slot_262_6_0.z * 0.82))

			if slot_262_26_1 then
				slot_262_17_1 = math.max(slot_262_10_0 - slot_262_20_0, math.min(slot_262_10_0 + slot_262_20_0, slot_262_26_1.x))
			else
				slot_262_17_1 = slot_0_140_2 and slot_0_136_3 or slot_262_10_0
			end
		else
			slot_262_17_1 = slot_0_140_2 and slot_0_136_3 or slot_262_10_0
		end
	end

	slot_262_17_0 = math.max(slot_262_10_0 - slot_262_20_0, math.min(slot_262_10_0 + slot_262_20_0, slot_262_17_1))

	if not slot_0_140_2 then
		slot_0_136_3 = slot_262_10_0
		slot_0_134_3 = slot_262_10_0
		slot_0_138_2 = 0
		slot_0_140_2 = true
	end

	slot_262_25_0 = 1 - math.exp(-4 * math.min(arg_262_3, 0.05))
	slot_262_26_0 = slot_262_17_0 - slot_0_136_3
	slot_262_27_0 = slot_262_18_0 * 0.05
	slot_0_138_2 = math.max(-slot_262_27_0, math.min(slot_262_27_0, slot_262_26_0))
	slot_0_136_3 = slot_0_136_3 + slot_0_138_2 * slot_262_25_0
	slot_0_136_3 = math.max(slot_262_10_0 - slot_262_20_0, math.min(slot_262_10_0 + slot_262_20_0, slot_0_136_3))
	slot_0_134_3 = slot_0_136_3
	slot_262_28_0 = math.floor(slot_0_136_3 + 0.5)
	slot_262_29_0 = math.floor(slot_262_9_0 + 0.5)

	if arg_262_2 >= slot_0_128_8 then
		slot_0_128_8 = arg_262_2 + slot_0_129_6
		slot_262_30_1 = slot_0_125_7[#slot_0_125_7]
		slot_262_31_1 = slot_262_30_1 and slot_0_136_3 - slot_262_30_1.x or 999

		if slot_262_31_1 * slot_262_31_1 >= 1.5 then
			slot_0_125_7[#slot_0_125_7 + 1] = {
				x = slot_0_136_3,
				y = slot_262_9_0,
				born = arg_262_2
			}

			if #slot_0_125_7 > slot_0_126_9 then
				table.remove(slot_0_125_7, 1)
			end
		end
	end

	slot_262_30_0 = {}

	for iter_262_0, iter_262_1 in ipairs(slot_0_125_7) do
		if arg_262_2 - iter_262_1.born < slot_0_127_7 then
			iter_262_1.y = slot_262_9_0
			slot_262_30_0[#slot_262_30_0 + 1] = iter_262_1
		end
	end

	slot_0_125_7 = slot_262_30_0
	slot_0_132_3 = 1
	slot_0_131_3 = 1
	slot_262_31_0 = #slot_0_125_7

	if slot_262_31_0 >= 1 then
		for iter_262_2 = 1, slot_262_31_0 do
			slot_0_148_0[iter_262_2] = slot_0_125_7[iter_262_2]
		end

		slot_0_148_0[slot_262_31_0 + 1] = {
			x = slot_0_136_3,
			y = slot_262_9_0,
			born = arg_262_2
		}

		for iter_262_3 = slot_262_31_0 + 2, #slot_0_148_0 do
			slot_0_148_0[iter_262_3] = nil
		end

		slot_262_32_1 = slot_262_31_0 + 1
		slot_262_33_1 = slot_0_148_0[1].born
		slot_262_34_0 = slot_0_148_0[slot_262_32_1].born
		slot_262_35_0 = math.max(0.001, slot_262_34_0 - slot_262_33_1)

		for iter_262_4 = 2, slot_262_32_1 do
			slot_262_40_0 = slot_0_148_0[iter_262_4 - 1]
			slot_262_41_0 = slot_0_148_0[iter_262_4]
			slot_262_42_0 = ((slot_262_40_0.born + slot_262_41_0.born) * 0.5 - slot_262_33_1) / slot_262_35_0
			slot_262_43_0 = slot_262_42_0 * slot_262_42_0 * (3 - 2 * slot_262_42_0)
			slot_262_44_0 = slot_0_142_1(slot_262_16_0 * slot_262_43_0)

			if slot_262_44_0 >= 4 then
				slot_0_143_1(slot_262_40_0.x, slot_262_9_0, slot_262_41_0.x, slot_262_9_0, slot_262_13_0, slot_262_14_0, slot_262_15_0, slot_262_44_0)
			end
		end
	end

	slot_262_32_0 = (math.sin(arg_262_2 * 3.4) * 0.5 + 0.5)^2
	slot_262_33_0 = slot_0_142_1(slot_262_16_0 * (0.85 + 0.15 * slot_262_32_0))

	slot_0_144_1(slot_262_28_0, slot_262_29_0, slot_262_13_0, slot_262_14_0, slot_262_15_0, slot_262_33_0, slot_262_32_0)
end

function slot_0_150_0()
	local var_263_0 = slot_0_59_0.antiaim.general.aipeek

	if not (var_263_0.switch.value or slot_0_58_0:is_active("ai peek")) then
		slot_0_125_7 = {}
		slot_0_128_8 = 0
		slot_0_131_3 = 0

		return
	end

	local var_263_1 = entity.get_local_player()

	if not var_263_1 or not var_263_1:is_alive() then
		slot_0_125_7 = {}
		slot_0_128_8 = 0
		slot_0_131_3 = 0

		return
	end

	local var_263_2 = globals.realtime
	local var_263_3 = math.min(var_263_2 - slot_0_124_10, 0.05)

	slot_0_124_10 = var_263_2

	slot_0_149_0(var_263_0, var_263_1, var_263_2, var_263_3)
end

function slot_0_74_0.on_createmove(arg_264_0, arg_264_1)
	local var_264_0, var_264_1 = pcall(slot_0_123_10, arg_264_1)

	if not var_264_0 then
		slot_0_105_14 = false
		slot_0_106_14 = false
		slot_0_110_17 = false
		slot_0_107_13 = false
		slot_0_109_17 = false

		slot_0_104_13()
	end
end

function slot_0_74_0.on_render(arg_265_0)
	pcall(slot_0_150_0)
end

events.aim_fire(function(arg_266_0)
	local var_266_0 = slot_0_59_0.antiaim.general.aipeek

	if not var_266_0.switch_to_knife.value then
		return
	end

	local var_266_1 = globals.tickcount
	local var_266_2, var_266_3 = pcall(function()
		return slot_0_87_5:get()
	end)
	local var_266_4 = var_266_0.switch.value or slot_0_58_0:is_active("ai peek")
	local var_266_5 = var_266_1 - slot_0_120_12 <= 6

	if not var_266_4 and (not var_266_2 or not var_266_3) and not var_266_5 then
		return
	end

	local var_266_6 = entity.get_local_player()

	if not var_266_6 or not var_266_6:is_alive() then
		return
	end

	local var_266_7 = var_266_6:get_player_weapon()

	if not var_266_7 then
		return
	end

	local var_266_8 = var_266_7:get_classname()

	if var_266_8 ~= "CWeaponAWP" and var_266_8 ~= "CWeaponSSG08" then
		return
	end

	if var_266_8:find("knife") or var_266_8:find("bayonet") or var_266_8 == "weapon_knifegg" then
		return
	end

	if not slot_0_113_18 then
		slot_0_114_18 = var_266_7:get_index()
		slot_0_115_17 = var_266_8
	end

	slot_0_119_12 = true
	slot_0_113_18 = false
	slot_0_117_14 = false
	slot_0_118_13 = 0
end)
events.createmove(function(arg_268_0)
	local var_268_0 = slot_0_59_0.antiaim.general.aipeek

	if not var_268_0.switch_to_knife.value then
		slot_0_113_18 = false
		slot_0_117_14 = false
		slot_0_118_13 = 0
		slot_0_119_12 = false
		slot_0_114_18 = nil
		slot_0_115_17 = nil

		return
	end

	local var_268_1, var_268_2 = pcall(function()
		return slot_0_87_5:get()
	end)

	if var_268_0.switch.value or slot_0_58_0:is_active("ai peek") or var_268_1 and var_268_2 then
		slot_0_120_12 = globals.tickcount
	end

	local var_268_3 = entity.get_local_player()

	if not var_268_3 or not var_268_3:is_alive() then
		slot_0_113_18 = false
		slot_0_117_14 = false
		slot_0_118_13 = 0
		slot_0_119_12 = false
		slot_0_114_18 = nil
		slot_0_115_17 = nil

		return
	end

	local var_268_4 = var_268_3:get_player_weapon()
	local var_268_5 = var_268_4 and var_268_4:get_classname() or ""
	local var_268_6 = var_268_5:find("knife") or var_268_5:find("bayonet") or var_268_5 == "weapon_knifegg"

	if slot_0_117_14 and not var_268_6 then
		if not slot_0_100_11[var_268_5] then
			slot_0_117_14 = false
			slot_0_118_13 = 0
		elseif globals.tickcount - slot_0_118_13 >= 3 then
			local var_268_7, var_268_8 = pcall(function()
				return var_268_3.m_bIsScoped
			end)

			if var_268_7 and var_268_8 then
				slot_0_117_14 = false
			else
				arg_268_0.in_attack2 = true
			end
		end
	end

	if slot_0_119_12 then
		local var_268_9 = slot_0_122_12(var_268_3)

		if var_268_9 then
			arg_268_0.weaponselect = var_268_9:get_index()
			slot_0_116_14 = globals.tickcount
			slot_0_113_18 = true
			slot_0_119_12 = false
		else
			slot_0_119_12 = false
		end
	elseif slot_0_113_18 and globals.tickcount - slot_0_116_14 >= 1 then
		if slot_0_114_18 then
			arg_268_0.weaponselect = slot_0_114_18

			if slot_0_100_11[slot_0_115_17] then
				slot_0_117_14 = true
				slot_0_118_13 = globals.tickcount
			end

			slot_0_114_18 = nil
			slot_0_115_17 = nil
		end

		slot_0_113_18 = false
	end
end)
events.createmove(function(arg_271_0)
	slot_0_58_0:update()
	slot_0_74_0:on_createmove(arg_271_0)
end)
events.render(function()
	local var_272_0 = entity.get_local_player()

	if not var_272_0 or not var_272_0:is_alive() then
		return
	end

	slot_0_74_0:on_render()
end)

slot_0_75_0 = {}
slot_0_75_0.is_working = false

function slot_0_76_1(arg_273_0)
	local var_273_0 = arg_273_0:get_eye_position()
	local var_273_1 = render.camera_angles()
	local var_273_2 = var_273_0 + vector():angles(var_273_1) * 128
	local var_273_3 = utils.trace_line(var_273_0, var_273_2, 4294967295)

	if var_273_3.entity == nil then
		return false
	end

	local var_273_4 = var_273_3.entity:get_classname()

	return var_273_4:find("Weapon") or var_273_4:find("Door")
end

function slot_0_77_1(arg_274_0)
	if arg_274_0.m_iTeamNum ~= 3 then
		return false
	end

	local var_274_0 = arg_274_0:get_origin()

	for iter_274_0, iter_274_1 in ipairs(entity.get_entities("CPlantedC4")) do
		if iter_274_1 then
			local var_274_1 = iter_274_1:get_origin()

			if var_274_1 and iter_274_1.m_bBombTicking and var_274_0:dist(var_274_1) < 87.5 then
				return true
			end
		end
	end
end

function slot_0_78_2(arg_275_0)
	local var_275_0 = arg_275_0:get_eye_position()
	local var_275_1 = render.camera_angles()
	local var_275_2 = var_275_0 + vector():angles(var_275_1) * 128
	local var_275_3 = utils.trace_hull(var_275_0, var_275_2, vector(-1, -1, -1), vector(1, 1, 1), arg_275_0, bit.bor(1, 2, 8, 16384, 33554432))

	if var_275_3.entity == nil then
		return false
	end

	return arg_275_0:get_origin():dist(var_275_3.entity:get_origin()) < 125 and var_275_3.entity:get_classid() == 97
end

function slot_0_79_4(arg_276_0, arg_276_1, arg_276_2)
	if arg_276_2 and arg_276_2:get_classname() == "CC4" then
		return true
	end

	return slot_0_76_1(arg_276_1) or slot_0_77_1(arg_276_1) or slot_0_78_2(arg_276_1)
end

function slot_0_75_0.think(arg_277_0)
	local var_277_0 = entity.get_local_player()

	if var_277_0 == nil or not var_277_0:is_alive() then
		return false
	end

	local var_277_1 = var_277_0:get_player_weapon()

	if var_277_1 == nil then
		return false
	end

	if not slot_0_59_0.antiaim.general.legit_aa.enabled:get() then
		return false
	end

	if not arg_277_0.in_use then
		return false
	end

	return not slot_0_79_4(arg_277_0, var_277_0, var_277_1)
end

function slot_0_75_0.update(arg_278_0, arg_278_1, arg_278_2)
	slot_0_75_0.is_working = slot_0_75_0.think(arg_278_0)

	if not slot_0_75_0.is_working then
		return
	end

	arg_278_0.in_use = false
	arg_278_1.pitch = "Disabled"
	arg_278_1.yaw_base = slot_0_59_0.antiaim.general.legit_aa.mode:get()
end

slot_0_76_0 = nil
slot_0_77_0 = {}
slot_0_78_1 = {
	restore = false,
	forced = false
}

function slot_0_79_3()
	pcall(function()
		slot_0_11_0.rage.main.double_tap_lag_options_pui:override("Always On")
	end)
	pcall(function()
		slot_0_11_0.rage.main.double_tap_lag_options_pui:override("Always on")
	end)
	pcall(function()
		slot_0_11_0.rage.main.double_tap_lag_options:override("Always On")
	end)
	pcall(function()
		rage.exploit:allow_defensive(true)
	end)
end

function slot_0_80_2()
	pcall(function()
		slot_0_11_0.rage.main.double_tap_lag_options_pui:set("On Peek")
	end)
	pcall(function()
		slot_0_11_0.rage.main.double_tap_lag_options:override("On Peek")
	end)
end

function slot_0_78_1.reset(arg_287_0)
	arg_287_0.forced = false

	slot_0_11_0.antiaim.fake_lag.enabled_pui:override()
	slot_0_11_0.antiaim.fake_lag.limit_pui:override()
end

function slot_0_78_1.force(arg_288_0)
	slot_0_79_3()

	arg_288_0.forced = true
end

function slot_0_78_1.on_net_update_end(arg_289_0)
	local var_289_0, var_289_1 = pcall(function()
		return rage.exploit:get() == 1
	end)

	if not var_289_0 or not var_289_1 then
		arg_289_0:reset()

		return
	end

	if arg_289_0.forced then
		arg_289_0.forced = false

		slot_0_79_3()

		arg_289_0.restore = true

		return
	end

	if arg_289_0.restore then
		arg_289_0.restore = false

		slot_0_80_2()
	end

	if not slot_0_77_0.should_force() then
		slot_0_11_0.antiaim.fake_lag.enabled_pui:override()
		slot_0_11_0.antiaim.fake_lag.limit_pui:override()
	end
end

function slot_0_77_0.think(arg_291_0)
	local var_291_0 = entity.get_local_player()

	if var_291_0 == nil or not var_291_0:is_alive() then
		return false
	end

	local var_291_1 = var_291_0:get_player_weapon()

	if var_291_1 == nil then
		return false
	end

	local var_291_2 = slot_0_59_0.antiaim.general.break_lc

	if not var_291_2.select:get() then
		return false
	end

	local var_291_3 = var_291_1.m_fThrowTime

	if var_291_3 ~= nil and var_291_3 ~= 0 then
		return false
	end

	if var_291_2.additions_normal and var_291_2.additions_normal:get("ignore grenade") and var_291_1:get_weapon_info().weapon_type == 9 then
		return false
	end

	return true
end

function slot_0_81_2(arg_292_0)
	local var_292_0 = entity.get_local_player()

	if not var_292_0 or not var_292_0:is_alive() or not arg_292_0 or not arg_292_0.game_events then
		return false
	end

	if arg_292_0.game_events:get("weapon switch") and var_292_0.m_flNextAttack and var_292_0.m_flNextAttack > globals.curtime then
		return true
	end

	local var_292_1 = var_292_0:get_player_weapon()

	if var_292_1 and arg_292_0.game_events:get("weapon reload") then
		local var_292_2, var_292_3 = pcall(function()
			return var_292_1:get_weapon_reload()
		end)

		if var_292_2 and var_292_3 ~= -1 then
			return true
		end
	end

	return false
end

function slot_0_77_0.should_force(arg_294_0)
	if not slot_0_77_0.think(arg_294_0) then
		return false
	end

	local var_294_0 = slot_0_59_0.antiaim.general.break_lc

	if slot_0_81_2(var_294_0) then
		return true
	end

	local var_294_1 = slot_0_70_0.get()
	local var_294_2 = var_294_0.activate and var_294_0.activate:get() or "always"
	local var_294_3 = var_294_2 == "always"

	if var_294_2 == "conditions" and var_294_0.conditions then
		if var_294_0.conditions:get("standing") and var_294_1 == "standing" then
			var_294_3 = true
		end

		if var_294_0.conditions:get("running") and var_294_1 == "running" then
			var_294_3 = true
		end

		if var_294_0.conditions:get("air") and var_294_1 == "air" then
			var_294_3 = true
		end

		if var_294_0.conditions:get("air crouching") and var_294_1 == "air crouching" then
			var_294_3 = true
		end

		if var_294_0.conditions:get("crouching") and var_294_1 == "crouching" then
			var_294_3 = true
		end

		if var_294_0.conditions:get("sneaking") and var_294_1 == "sneaking" then
			var_294_3 = true
		end

		if var_294_0.conditions:get("slowwalk") and var_294_1 == "slowing" then
			var_294_3 = true
		end

		if var_294_0.conditions:get("quickpeek") then
			local var_294_4, var_294_5 = pcall(function()
				return slot_0_11_0.rage.main.double_tap:get()
			end)

			if var_294_4 and var_294_5 and rage.exploit:get() == 1 then
				var_294_3 = true
			end
		end
	end

	return var_294_3
end

function slot_0_77_0.handle_normal(arg_296_0, arg_296_1)
	if not slot_0_77_0.should_force(arg_296_0) then
		return false
	end

	local var_296_0 = slot_0_59_0.antiaim.general.break_lc

	slot_0_78_1:force()

	local var_296_1 = false

	pcall(function()
		local var_297_0 = slot_0_76_0 and slot_0_76_0.get_debug_state and slot_0_76_0.get_debug_state() or nil

		var_296_1 = var_297_0 and var_297_0.defensive == true
	end)

	if not var_296_1 then
		local var_296_2 = false

		pcall(function()
			local var_298_0 = entity.get_local_player()
			local var_298_1 = var_298_0 and var_298_0.m_vecVelocity and var_298_0.m_vecVelocity:length2d() or 0

			var_296_2 = slot_0_11_0.rage.main.double_tap:get() or slot_0_11_0.rage.main.hide_shots:get() or var_298_1 < 1.11
		end)
		pcall(function()
			if slot_0_11_0.antiaim.fake_lag.limit_pui:get() < 14 then
				slot_0_11_0.antiaim.fake_lag.limit_pui:set(14)
			end
		end)

		if var_296_2 then
			slot_0_11_0.antiaim.fake_lag.enabled_pui:override(false)
		else
			slot_0_11_0.antiaim.fake_lag.enabled_pui:override()
		end
	else
		slot_0_11_0.antiaim.fake_lag.enabled_pui:override()
	end

	if arg_296_1 then
		arg_296_1.lag_options = "Always on"
		arg_296_1.hs_options = var_296_0.hide_shots:get()
	end

	return true
end

function slot_0_77_0.update(arg_300_0, arg_300_1, arg_300_2)
	if not slot_0_77_0.should_force(arg_300_0) then
		return
	end

	local var_300_0 = slot_0_59_0.antiaim.general.break_lc

	slot_0_77_0.handle_normal(arg_300_0, arg_300_1)

	arg_300_1.hs_options = var_300_0.hide_shots:get()
end

events.net_update_end(function()
	slot_0_78_1:on_net_update_end()
end)

slot_0_78_0 = {}
slot_0_79_2 = false
slot_0_78_0.is_active = false

function slot_0_80_1(arg_302_0)
	if not arg_302_0 then
		return nil
	end

	local var_302_0 = arg_302_0:get_classname()
	local var_302_1 = arg_302_0:get_weapon_index()
	local var_302_2 = arg_302_0:get_weapon_info()

	if not var_302_2 then
		return nil
	end

	if var_302_2.weapon_type == 9 or var_302_2.weapon_type == 0 or var_302_1 == 64 then
		return nil
	end

	if var_302_0 == "CWeaponAWP" then
		return "awp"
	end

	if var_302_0 == "CWeaponSSG08" then
		return "scout"
	end

	if var_302_1 == 1 or var_302_2 and var_302_2.is_revolver then
		return "deagle"
	end

	if var_302_2.weapon_type == 1 then
		return "pistol"
	end

	if var_302_2.full_auto then
		return "auto"
	end

	return nil
end

function slot_0_81_1()
	if slot_0_79_2 then
		slot_0_11_0.rage.main.double_tap:override()
		slot_0_11_0.rage.main.hide_shots:override()

		slot_0_79_2 = false
	end

	slot_0_78_0.is_active = false
end

events.createmove(function()
	local var_304_0 = slot_0_59_0.antiaim.general.ahs

	if not var_304_0 or not var_304_0.switch:get() then
		slot_0_81_1()

		return
	end

	local var_304_1 = entity.get_local_player()

	if not var_304_1 or not var_304_1:is_alive() then
		slot_0_81_1()

		return
	end

	local var_304_2

	if slot_0_79_2 then
		var_304_2 = true
	else
		local var_304_3, var_304_4 = pcall(function()
			return slot_0_11_0.rage.main.double_tap:get()
		end)

		var_304_2 = var_304_3 and var_304_4
	end

	local var_304_5 = rage.exploit:get()
	local var_304_6 = var_304_1:get_player_weapon()
	local var_304_7 = slot_0_80_1(var_304_6)
	local var_304_8 = var_304_7 and var_304_0[var_304_7] and var_304_0[var_304_7]:get()
	local var_304_9 = var_304_7 and var_304_0[var_304_7 .. "_states"]
	local var_304_10 = slot_0_70_0.get()
	local var_304_11 = var_304_10 and var_304_9 and var_304_9:get(var_304_10)

	if var_304_8 and var_304_11 and var_304_2 and var_304_5 >= 1 then
		slot_0_11_0.rage.main.hide_shots:override(true)
		slot_0_11_0.rage.main.double_tap:override(false)

		slot_0_79_2 = true
		slot_0_78_0.is_active = true
	else
		slot_0_81_1()
	end
end)
events.shutdown(slot_0_81_1)
events.player_death(function(arg_306_0)
	local var_306_0 = entity.get_local_player()

	if var_306_0 and entity.get(arg_306_0.userid, true) == var_306_0 then
		slot_0_81_1()
	end
end)
events.round_start(slot_0_81_1)

slot_0_72_0.side = false

function slot_0_79_1()
	return slot_0_70_0.visual(slot_0_75_0.is_working) or slot_0_70_0.get(slot_0_75_0.is_working)
end

function slot_0_72_0.think(arg_308_0)
	slot_0_72_0.active = false
	slot_0_72_0.working = false

	if not (slot_0_59_0.antiaim.angles.freestanding.switch:get() or slot_0_58_0:is_active("freestanding")) then
		return false
	end

	local var_308_0 = slot_0_79_1()

	if var_308_0 == "legit aa" or slot_0_71_0.think() then
		return false
	end

	local var_308_1 = slot_0_59_0.antiaim.angles.freestanding

	if var_308_1.disablers then
		local var_308_2 = var_308_1.disablers

		if (var_308_0 == "air" or var_308_0 == "air crouching") and var_308_2:get("air") then
			return false
		end

		if var_308_0 == "slowing" and var_308_2:get("slowwalk") then
			return false
		end

		if (var_308_0 == "crouching" or var_308_0 == "sneaking") and var_308_2:get("crouch") then
			return false
		end

		if var_308_0 == "running" and var_308_2:get("move") then
			return false
		end
	end

	slot_0_72_0.active = true
	slot_0_72_0.working = rage.antiaim:get_target(true) ~= nil

	return true
end

function slot_0_72_0.get_side(arg_309_0)
	local var_309_0 = entity.get_threat(true) or entity.get_threat()

	if not var_309_0 then
		slot_0_72_0.side = false

		return
	end

	if not slot_0_72_0.think(arg_309_0) then
		slot_0_72_0.side = false

		return
	end

	local var_309_1 = slot_0_76_0 and slot_0_76_0.get_debug_state and slot_0_76_0.get_debug_state() or {}

	if arg_309_0 and arg_309_0.choked_commands ~= 0 or var_309_1.defensive then
		return
	end

	local var_309_2 = entity.get_local_player()

	if not var_309_2 or not var_309_2:is_alive() then
		slot_0_72_0.side = false

		return
	end

	local var_309_3, var_309_4 = pcall(function()
		local var_310_0 = var_309_2:get_origin():to(var_309_0:get_origin()):angles().y
		local var_310_1 = var_309_2.m_flLowerBodyYawTarget - var_310_0 + 180

		while var_310_1 > 180 do
			var_310_1 = var_310_1 - 360
		end

		while var_310_1 < -180 do
			var_310_1 = var_310_1 + 360
		end

		return var_310_1
	end)

	if not var_309_3 or not var_309_4 then
		slot_0_72_0.side = false

		return
	end

	if var_309_4 < 91 and var_309_4 > 89 then
		slot_0_72_0.side = "right"
	elseif var_309_4 > -91 and var_309_4 < -89 then
		slot_0_72_0.side = "left"
	else
		slot_0_72_0.side = false
	end
end

function slot_0_72_0.update(arg_311_0, arg_311_1, arg_311_2)
	local var_311_0 = slot_0_59_0.antiaim.general.freestanding.static:get()

	arg_311_1.freestanding = true

	if var_311_0 then
		slot_0_11_0.antiaim.angles.disable_yaw_modifiers:override(true)
		slot_0_11_0.antiaim.angles.body_freestanding:override(false)

		arg_311_1.yaw_offset = 0
		arg_311_1.yaw_modifier = "Disabled"
		arg_311_1.modifier_offset = 0
		arg_311_1.body_yaw = true

		local var_311_1 = arg_311_2 and arg_311_2.left_limit and arg_311_2.left_limit:get() or arg_311_2 and arg_311_2.fake_limit and arg_311_2.fake_limit:get() or 60

		arg_311_1.right_limit, arg_311_1.left_limit = arg_311_2 and arg_311_2.right_limit and arg_311_2.right_limit:get() or arg_311_2 and arg_311_2.fake_limit and arg_311_2.fake_limit:get() or 60, var_311_1
		arg_311_1.freestand_peek = "off"
		arg_311_1.body_freestanding = false
		arg_311_1.disable_yaw_modifiers = true
	end
end

slot_0_79_0 = nil
slot_0_80_0 = ""
slot_0_81_0 = 0
slot_0_76_0 = {}
slot_0_76_0.is_active = false
slot_0_82_1 = {
	active_until = 0,
	active = false,
	ticks = 0,
	active2 = false
}
slot_0_83_2 = false
slot_0_84_3 = 0
slot_0_85_3 = 0

events.net_update_end(function()
	local var_312_0, var_312_1 = pcall(function()
		return rage.exploit:get()
	end)

	slot_0_83_2 = var_312_0 and var_312_1 == 1

	if not slot_0_83_2 then
		slot_0_82_1.active = false
		slot_0_82_1.active_until = 0
		slot_0_82_1.ticks = 0
	end
end)
events.level_change(function()
	slot_0_84_3 = 0
	slot_0_85_3 = 0
	slot_0_82_1.active = false
	slot_0_82_1.active_until = 0
	slot_0_82_1.ticks = 0
	slot_0_82_1.active2 = false
end)
events.createmove(function(arg_315_0)
	local var_315_0 = entity.get_local_player()

	if not var_315_0 or not var_315_0:is_alive() then
		return
	end

	local var_315_1 = var_315_0.m_nTickBase
	local var_315_2 = globals.server_tick
	local var_315_3 = var_315_1 - slot_0_84_3

	slot_0_84_3 = math.max(var_315_1, slot_0_84_3)

	if var_315_3 > 1 then
		slot_0_85_3 = var_315_2 + 1
		slot_0_82_1.active_until = 0
	elseif var_315_3 < 0 then
		slot_0_82_1.ticks = -var_315_3
		slot_0_82_1.active_until = var_315_2 - var_315_3 - 4
	elseif slot_0_85_3 == var_315_2 then
		slot_0_82_1.active_until = var_315_2 + 1
	end

	slot_0_82_1.active = var_315_2 <= slot_0_82_1.active_until
	slot_0_82_1.active2 = slot_0_9_0()
end)

function slot_0_76_0.get_debug_state()
	return {
		hidden = slot_0_76_0.is_active,
		defensive = slot_0_82_1.active,
		defensive_c = slot_0_82_1.active2,
		match = slot_0_82_1.active == slot_0_82_1.active2,
		ticks = slot_0_82_1.ticks,
		charged = slot_0_83_2
	}
end

slot_0_86_3 = {}

for iter_0_15, iter_0_16 in ipairs(slot_0_12_0.states) do
	if iter_0_16 ~= "legit aa" then
		slot_0_86_3[#slot_0_86_3 + 1] = iter_0_16
	end
end

slot_0_86_3[#slot_0_86_3 + 1] = "manual aa"
slot_0_86_3[#slot_0_86_3 + 1] = "safe head"
slot_0_86_3[#slot_0_86_3 + 1] = "freestanding"
slot_0_87_4 = {}
slot_0_88_5 = {}
slot_0_89_3 = {}

for iter_0_17, iter_0_18 in ipairs(slot_0_86_3) do
	slot_0_87_4[iter_0_18] = 0
	slot_0_88_5[iter_0_18] = false
	slot_0_89_3[iter_0_18] = 0
end

slot_0_90_3 = {}
slot_0_91_2 = {}
slot_0_92_3 = {}
slot_0_93_4 = {}
slot_0_94_4 = {}

for iter_0_19, iter_0_20 in ipairs(slot_0_86_3) do
	slot_0_90_3[iter_0_20] = 0
	slot_0_91_2[iter_0_20] = 0
	slot_0_92_3[iter_0_20] = 0
	slot_0_93_4[iter_0_20] = 0
	slot_0_94_4[iter_0_20] = 0
end

slot_0_95_5 = {}

for iter_0_21, iter_0_22 in ipairs(slot_0_86_3) do
	slot_0_95_5[iter_0_22] = 0
end

slot_0_96_6 = {}
slot_0_97_7 = {}

for iter_0_23, iter_0_24 in ipairs(slot_0_86_3) do
	slot_0_96_6[iter_0_24] = false
	slot_0_97_7[iter_0_24] = 0
end

slot_0_98_6 = {}

for iter_0_25, iter_0_26 in ipairs(slot_0_86_3) do
	slot_0_98_6[iter_0_26] = 0
end

slot_0_99_7 = {}
slot_0_100_9 = {}

for iter_0_27, iter_0_28 in ipairs(slot_0_86_3) do
	slot_0_99_7[iter_0_28] = 0
	slot_0_100_9[iter_0_28] = 0
end

slot_0_101_10 = {}
slot_0_102_9 = {}
slot_0_103_10 = {}
slot_0_104_11 = {}

for iter_0_29, iter_0_30 in ipairs(slot_0_86_3) do
	slot_0_101_10[iter_0_30] = 0
	slot_0_102_9[iter_0_30] = 0
	slot_0_103_10[iter_0_30] = false
	slot_0_104_11[iter_0_30] = 0
end

slot_0_105_12 = {}

for iter_0_31, iter_0_32 in ipairs(slot_0_86_3) do
	slot_0_105_12[iter_0_32] = {
		notified = false,
		reset_dur = 3,
		reset_time = 0,
		yaw_extra = 0,
		pitch_flipped = false
	}
end

slot_0_106_13 = {}
slot_0_107_12 = {}
slot_0_108_13 = {}

function slot_0_109_14(arg_317_0)
	while arg_317_0 > 180 do
		arg_317_0 = arg_317_0 - 360
	end

	while arg_317_0 < -180 do
		arg_317_0 = arg_317_0 + 360
	end

	return arg_317_0
end

function slot_0_110_15(arg_318_0, arg_318_1, arg_318_2)
	local var_318_0 = arg_318_2 * math.pi / 180

	return vector(arg_318_0.x + math.cos(var_318_0) * arg_318_1, arg_318_0.y + math.sin(var_318_0) * arg_318_1, arg_318_0.z)
end

events.player_hurt(function(arg_319_0)
	local var_319_0 = entity.get_local_player()

	if not var_319_0 or not var_319_0:is_alive() then
		return
	end

	local var_319_1 = entity.get(arg_319_0.userid, true)
	local var_319_2 = entity.get(arg_319_0.attacker, true)

	if not var_319_2 or not var_319_2:is_enemy() or var_319_1 ~= var_319_0 then
		return
	end

	local var_319_3 = {
		"knife",
		"hegrenade",
		"inferno",
		"flashbang",
		"decoy",
		"smokegrenade",
		"taser"
	}

	for iter_319_0, iter_319_1 in ipairs(var_319_3) do
		if arg_319_0.weapon == iter_319_1 then
			return
		end
	end

	local var_319_4 = var_319_2:get_index()
	local var_319_5, var_319_6 = pcall(function()
		return var_319_2:get_name()
	end)

	slot_0_107_12[var_319_4] = {
		name = var_319_5 and var_319_6 or "?",
		time = globals.curtime
	}
end)
events.bullet_impact(function(arg_321_0)
	local var_321_0 = entity.get_local_player()

	if not var_321_0 or not var_321_0:is_alive() then
		return
	end

	local var_321_1 = entity.get(arg_321_0.userid, true)

	if not var_321_1 or not var_321_1:is_enemy() or not var_321_1:is_alive() or var_321_1:is_dormant() then
		return
	end

	local var_321_2 = var_321_1:get_index()
	local var_321_3 = var_321_0.m_vecOrigin
	local var_321_4 = var_321_1.m_vecOrigin
	local var_321_5 = math.atan(var_321_3.y - var_321_4.y, var_321_3.x - var_321_4.x) * 180 / math.pi
	local var_321_6 = var_321_0:get_origin() + var_321_0.m_vecViewOffset
	local var_321_7 = var_321_1:get_origin() + var_321_1.m_vecViewOffset
	local var_321_8 = vector(arg_321_0.x, arg_321_0.y, arg_321_0.z)
	local var_321_9 = slot_0_110_15(var_321_6, 16, slot_0_109_14(var_321_5 - 45 + 180))
	local var_321_10 = slot_0_110_15(var_321_6, 16, slot_0_109_14(var_321_5 + 45 + 180))
	local var_321_11 = var_321_9:closest_ray_point(var_321_7, var_321_8)
	local var_321_12 = var_321_10:closest_ray_point(var_321_7, var_321_8)

	if var_321_11:dist(var_321_9) < 70 or var_321_12:dist(var_321_10) < 70 then
		local var_321_13, var_321_14 = pcall(function()
			return var_321_1:get_name()
		end)

		slot_0_106_13[var_321_2] = {
			name = var_321_13 and var_321_14 or "?",
			time = globals.curtime
		}
	end
end)
events.render(function()
	local var_323_0 = entity.get_local_player()

	if not var_323_0 or not var_323_0:is_alive() then
		return
	end

	slot_0_10_0(true, true, function(arg_324_0)
		local var_324_0 = arg_324_0:get_index()

		local function var_324_1(arg_325_0, arg_325_1)
			if slot_0_75_0.is_working then
				return
			end

			local var_325_0 = slot_0_70_0.get(slot_0_75_0.is_working)

			if not var_325_0 then
				return
			end

			local var_325_1 = slot_0_59_0.antiaim.defensive

			if not var_325_1 or not var_325_1.settings then
				return
			end

			local var_325_2 = var_325_1.active_on:get("doubletap")
			local var_325_3 = var_325_1.active_on:get("hideshots")

			if var_325_2 or var_325_3 then
				local var_325_4, var_325_5 = pcall(function()
					return slot_0_11_0.rage.main.double_tap:get()
				end)
				local var_325_6, var_325_7 = pcall(function()
					return slot_0_11_0.rage.main.hide_shots:get()
				end)

				if (not var_325_2 or not var_325_4 or not var_325_5) and (not var_325_3 or not var_325_6 or not var_325_7) then
					return
				end
			end

			local var_325_8 = slot_0_73_0.think(entity.get_local_player())
			local var_325_9 = slot_0_71_0.think()
			local var_325_10 = slot_0_72_0.think()
			local var_325_11
			local var_325_12 = var_325_8 and "safe head" or var_325_9 and "manual aa" or var_325_10 and "freestanding" or var_325_0
			local var_325_13 = var_325_1.settings[var_325_12]

			if not var_325_13 or not var_325_13.enable:get() then
				return
			end

			if not var_325_13.def_abf or not var_325_13.def_abf:get() then
				return
			end

			local var_325_14 = var_325_13.def_abf_trigger and var_325_13.def_abf_trigger:get() or "miss"

			if arg_325_1 and var_325_14 == "miss" then
				return
			end

			if not arg_325_1 and var_325_14 == "hit" then
				return
			end

			local var_325_15 = slot_0_105_12[var_325_12]

			if var_325_15.reset_time > 0 and globals.realtime >= var_325_15.reset_time then
				var_325_15.yaw_extra = 0
				var_325_15.pitch_flipped = false
				var_325_15.reset_time = 0
				var_325_15.notified = false
				slot_0_76_0.def_ind_latch.is_working = false
				slot_0_76_0.def_ind_latch.reset_time = 0
				slot_0_76_0.def_ind_latch.triggered_state = nil

				return
			end

			local var_325_16 = var_325_13.def_abf_mode:get()

			if var_325_16 == "flip yaw" then
				var_325_15.yaw_extra = var_325_15.yaw_extra == 0 and 180 or 0
			elseif var_325_16 == "flip pitch" then
				var_325_15.pitch_flipped = not var_325_15.pitch_flipped
			elseif var_325_16 == "random yaw" then
				var_325_15.yaw_extra = math.random(-180, 180)
			end

			var_325_15.reset_dur = var_325_13.def_abf_reset:get()
			var_325_15.reset_time = globals.realtime + var_325_15.reset_dur
			slot_0_76_0.def_ind_latch.is_working = true
			slot_0_76_0.def_ind_latch.reset_time = var_325_15.reset_time
			slot_0_76_0.def_ind_latch.reset_dur = var_325_15.reset_dur
			slot_0_76_0.def_ind_latch.triggered_state = var_325_12

			if var_325_13.def_abf_notify and var_325_13.def_abf_notify:get() and not var_325_15.notified then
				var_325_15.notified = true

				slot_0_79_0(arg_325_0.name, arg_325_1, true)
			end
		end

		if slot_0_107_12[var_324_0] then
			local var_324_2 = slot_0_107_12[var_324_0]

			if slot_0_108_13[var_324_0] == var_324_2.time then
				slot_0_107_12[var_324_0] = nil
				slot_0_106_13[var_324_0] = nil

				return
			end

			slot_0_108_13[var_324_0] = var_324_2.time

			var_324_1(var_324_2, true)

			slot_0_107_12[var_324_0] = nil
			slot_0_106_13[var_324_0] = nil
		end

		if slot_0_106_13[var_324_0] then
			local var_324_3 = slot_0_106_13[var_324_0]

			if slot_0_108_13[var_324_0] == var_324_3.time then
				slot_0_106_13[var_324_0] = nil

				return
			end

			slot_0_108_13[var_324_0] = var_324_3.time

			var_324_1(var_324_3, false)

			slot_0_106_13[var_324_0] = nil
		end
	end)
end)

function slot_0_111_21(arg_328_0, arg_328_1, arg_328_2, arg_328_3, arg_328_4)
	local var_328_0 = math.max(1, arg_328_1)
	local var_328_1 = arg_328_0 % var_328_0 / var_328_0
	local var_328_2

	if arg_328_4 == "sine" then
		var_328_2 = (math.sin(var_328_1 * math.pi * 2 - math.pi * 0.5) + 1) * 0.5
	elseif arg_328_4 == "triangle" then
		var_328_2 = var_328_1 < 0.5 and var_328_1 * 2 or (1 - var_328_1) * 2
	elseif arg_328_4 == "step" then
		var_328_2 = var_328_1 < 0.5 and 0 or 1
	elseif arg_328_4 == "bounce" then
		local var_328_3 = math.sin(var_328_1 * math.pi)

		var_328_2 = var_328_3 * var_328_3
	else
		var_328_2 = var_328_1
	end

	return arg_328_2 + var_328_2 * (arg_328_3 - arg_328_2)
end

slot_0_112_20 = {}
slot_0_113_17 = {}
slot_0_114_17 = {}
slot_0_115_16 = {}
slot_0_116_13 = {}
slot_0_117_13 = {}
slot_0_118_12 = {}
slot_0_119_11 = {}

for iter_0_33, iter_0_34 in ipairs(slot_0_86_3) do
	slot_0_112_20[iter_0_34] = 0
	slot_0_113_17[iter_0_34] = 0
	slot_0_114_17[iter_0_34] = 0
	slot_0_115_16[iter_0_34] = 0
	slot_0_116_13[iter_0_34] = 0
	slot_0_117_13[iter_0_34] = false
	slot_0_118_12[iter_0_34] = 0
	slot_0_119_11[iter_0_34] = 0
end

function slot_0_120_11(arg_329_0)
	local var_329_0 = slot_0_105_12[arg_329_0]

	if var_329_0 then
		var_329_0.yaw_extra = 0
		var_329_0.pitch_flipped = false
		var_329_0.reset_time = 0
		var_329_0.notified = false
	end

	slot_0_97_7[arg_329_0] = 0
	slot_0_96_6[arg_329_0] = false
	slot_0_93_4[arg_329_0] = 0
	slot_0_101_10[arg_329_0] = 0
	slot_0_102_9[arg_329_0] = 0
	slot_0_103_10[arg_329_0] = false
	slot_0_99_7[arg_329_0] = 0
	slot_0_100_9[arg_329_0] = 0
	slot_0_114_17[arg_329_0] = 0
	slot_0_115_16[arg_329_0] = 0
	slot_0_116_13[arg_329_0] = 0
	slot_0_117_13[arg_329_0] = false
	slot_0_118_12[arg_329_0] = 0
	slot_0_119_11[arg_329_0] = 0
end

function slot_0_121_10(arg_330_0, arg_330_1, arg_330_2, arg_330_3)
	if arg_330_0 == "off" then
		return nil
	end

	if arg_330_0 == "down" then
		return arg_330_3 and -89 or 89
	end

	if arg_330_0 == "up" then
		return arg_330_3 and 89 or -89
	end

	if arg_330_0 == "random" then
		return math.random() > 0.5 and math.random(-89, 60) or -math.random(-89, 60)
	end

	if arg_330_0 == "custom" then
		return arg_330_1.pitch:get()
	end

	if arg_330_0 == "elysian" then
		return math.map(math.abs(globals.realtime % 0.3 - 0.15), 0, 0.15, -89, 89)
	end

	if arg_330_0 == "semi-up" then
		return arg_330_3 and 52 or -52
	end

	if arg_330_0 == "semi-down" then
		return arg_330_3 and -52 or 52
	end

	if arg_330_0 == "dynamic" then
		slot_0_99_7[arg_330_2] = slot_0_99_7[arg_330_2] + 1

		local var_330_0 = arg_330_1.dyn_pitch_min and arg_330_1.dyn_pitch_min:get() or -89
		local var_330_1 = arg_330_1.dyn_pitch_max and arg_330_1.dyn_pitch_max:get() or 89
		local var_330_2 = arg_330_1.dyn_pitch_spd and arg_330_1.dyn_pitch_spd:get() or 60
		local var_330_3 = arg_330_1.dyn_pitch_mode and arg_330_1.dyn_pitch_mode:get() or "sine"
		local var_330_4 = arg_330_1.dyn_pitch_rand and arg_330_1.dyn_pitch_rand:get() or 0
		local var_330_5 = slot_0_111_21(slot_0_99_7[arg_330_2], var_330_2, var_330_0, var_330_1, var_330_3)

		if var_330_4 > 0 then
			var_330_5 = var_330_5 + math.random(-var_330_4, var_330_4)
		end

		local var_330_6 = math.max(-89, math.min(89, var_330_5))
		local var_330_7 = math.max(0.01, math.min(1, var_330_2 / 200))

		slot_0_113_17[arg_330_2] = slot_0_113_17[arg_330_2] + (var_330_6 - slot_0_113_17[arg_330_2]) * var_330_7

		return math.max(-89, math.min(89, slot_0_113_17[arg_330_2]))
	end

	if arg_330_0 == "oscillate" then
		slot_0_115_16[arg_330_2] = slot_0_115_16[arg_330_2] + 1

		local var_330_8 = arg_330_1.osc_pitch_a and arg_330_1.osc_pitch_a:get() or -89
		local var_330_9 = arg_330_1.osc_pitch_b and arg_330_1.osc_pitch_b:get() or 89
		local var_330_10 = arg_330_1.osc_pitch_rate and arg_330_1.osc_pitch_rate:get() or 6
		local var_330_11 = arg_330_1.osc_pitch_rand and arg_330_1.osc_pitch_rand:get() or 0
		local var_330_12 = var_330_10 > slot_0_115_16[arg_330_2] % (var_330_10 * 2) and var_330_8 or var_330_9

		if var_330_11 > 0 then
			var_330_12 = var_330_12 + math.random(-var_330_11, var_330_11)
		end

		return math.max(-89, math.min(89, var_330_12))
	end

	return nil
end

function slot_0_122_11()
	local var_331_0 = entity.get_local_player()

	if not var_331_0 or not var_331_0:is_alive() then
		return nil
	end

	local var_331_1 = entity.get_threat(true) or entity.get_threat()

	if not var_331_1 then
		return nil
	end

	local var_331_2 = var_331_0:get_origin()
	local var_331_3 = 0

	pcall(function()
		local var_332_0 = var_331_0:get_anim_state()

		if var_332_0 then
			var_331_3 = var_332_0.foot_yaw
		end
	end)

	local var_331_4, var_331_5 = pcall(function()
		return var_331_1:get_origin() - var_331_2
	end)

	if not var_331_4 or not var_331_5 then
		return nil
	end

	local var_331_6 = math.deg(math.atan2(var_331_5.y, var_331_5.x)) - var_331_3

	while var_331_6 > 180 do
		var_331_6 = var_331_6 - 360
	end

	while var_331_6 < -180 do
		var_331_6 = var_331_6 + 360
	end

	return var_331_6 >= 0
end

function slot_0_123_8(arg_334_0, arg_334_1, arg_334_2, arg_334_3, arg_334_4)
	arg_334_3 = arg_334_3 or 0

	if arg_334_0 == "off" then
		return nil
	end

	if arg_334_0 == "static" then
		return arg_334_1.yaw:get() + arg_334_3
	end

	if arg_334_0 == "sideways" then
		return (rage.antiaim:inverter() and -90 or 90) + arg_334_3
	end

	if arg_334_0 == "random" then
		return math.random(-180, 180)
	end

	if arg_334_0 == "opposite" then
		return 180 + arg_334_3
	end

	if arg_334_0 == "flip" then
		slot_334_5_4 = arg_334_1.yaw_lr_left and arg_334_1.yaw_lr_left:get() or 0
		slot_334_6_4 = arg_334_1.yaw_lr_right and arg_334_1.yaw_lr_right:get() or 0
		slot_334_7_4 = arg_334_1.yaw_lr_dt and arg_334_1.yaw_lr_dt:get() or 6
		slot_334_8_4 = arg_334_1.yaw_lr_rand and arg_334_1.yaw_lr_rand:get() or 0
		slot_334_9_4 = slot_334_7_4

		if arg_334_1.def_flip_adaptive and arg_334_1.def_flip_adaptive:get() then
			slot_334_10_4 = arg_334_1.def_flip_adp_var and arg_334_1.def_flip_adp_var:get() or 3
			slot_334_9_4 = math.max(1, slot_334_7_4 + utils.random_int(-slot_334_10_4, slot_334_10_4))
		end

		if arg_334_4 then
			slot_0_97_7[arg_334_2] = slot_0_97_7[arg_334_2] + 1

			if slot_334_9_4 <= slot_0_97_7[arg_334_2] then
				slot_0_97_7[arg_334_2] = 0
				slot_0_96_6[arg_334_2] = not slot_0_96_6[arg_334_2]
			end
		end

		slot_334_10_3 = slot_0_96_6[arg_334_2] and slot_334_5_4 or slot_334_6_4

		if slot_334_8_4 > 0 then
			slot_334_10_3 = slot_334_10_3 + math.random(-slot_334_8_4, slot_334_8_4)
		end

		return math.max(-60, math.min(60, slot_334_10_3)) + arg_334_3
	end

	if arg_334_0 == "spin" then
		slot_334_5_3 = arg_334_1.yaw_spin_spd and arg_334_1.yaw_spin_spd:get() or 1
		slot_334_6_3 = arg_334_1.yaw_spin_from and arg_334_1.yaw_spin_from:get() or -180
		slot_334_7_3 = arg_334_1.yaw_spin_to and arg_334_1.yaw_spin_to:get() or 180
		slot_334_8_3 = arg_334_1.yaw_spin_rand and arg_334_1.yaw_spin_rand:get() or 0
		slot_0_93_4[arg_334_2] = slot_0_93_4[arg_334_2] + slot_334_5_3
		slot_334_9_3 = slot_334_7_3 - slot_334_6_3

		if slot_334_9_3 == 0 then
			return slot_334_6_3 + arg_334_3
		end

		slot_334_11_3 = slot_334_6_3 + slot_0_93_4[arg_334_2] % 360 / 360 * slot_334_9_3

		if slot_334_8_3 > 0 then
			slot_334_11_3 = slot_334_11_3 + math.random(-slot_334_8_3, slot_334_8_3)
		end

		return slot_334_11_3 + arg_334_3
	end

	if arg_334_0 == "dynamic" then
		slot_0_100_9[arg_334_2] = slot_0_100_9[arg_334_2] + 1
		slot_334_5_2 = arg_334_1.dyn_yaw_min and arg_334_1.dyn_yaw_min:get() or -180
		slot_334_6_2 = arg_334_1.dyn_yaw_max and arg_334_1.dyn_yaw_max:get() or 180
		slot_334_7_2 = arg_334_1.dyn_yaw_spd and arg_334_1.dyn_yaw_spd:get() or 60
		slot_334_8_2 = arg_334_1.dyn_yaw_mode and arg_334_1.dyn_yaw_mode:get() or "sine"
		slot_334_9_2 = arg_334_1.dyn_yaw_rand and arg_334_1.dyn_yaw_rand:get() or 0
		slot_334_10_2 = slot_0_111_21(slot_0_100_9[arg_334_2], slot_334_7_2, slot_334_5_2, slot_334_6_2, slot_334_8_2)

		if slot_334_9_2 > 0 then
			slot_334_10_2 = slot_334_10_2 + math.random(-slot_334_9_2, slot_334_9_2)
		end

		slot_334_11_2 = math.max(0.01, math.min(1, slot_334_7_2 / 200))
		slot_0_112_20[arg_334_2] = slot_0_112_20[arg_334_2] + (slot_334_10_2 - slot_0_112_20[arg_334_2]) * slot_334_11_2

		return slot_0_112_20[arg_334_2] + arg_334_3
	end

	if arg_334_0 == "jitter" then
		slot_0_114_17[arg_334_2] = slot_0_114_17[arg_334_2] + 1
		slot_334_5_1 = arg_334_1.def_jitter_base and arg_334_1.def_jitter_base:get() or 0
		slot_334_6_1 = arg_334_1.def_jitter_range and arg_334_1.def_jitter_range:get() or 40
		slot_334_7_1 = arg_334_1.def_jitter_speed and arg_334_1.def_jitter_speed:get() or 3
		slot_334_8_1 = arg_334_1.def_jitter_style and arg_334_1.def_jitter_style:get() or "sine"
		slot_334_9_1 = arg_334_1.def_jitter_phase and arg_334_1.def_jitter_phase:get() or 0
		slot_334_10_1 = 0
		slot_334_11_1 = math.max(1, slot_334_7_1) * 2
		slot_334_12_1 = slot_0_114_17[arg_334_2] % slot_334_11_1 / slot_334_11_1
		slot_334_13_1 = slot_334_9_1 * math.pi / 180

		if slot_334_8_1 == "sine" then
			slot_334_10_1 = math.sin(slot_334_12_1 * math.pi * 2 + slot_334_13_1) * slot_334_6_1
		elseif slot_334_8_1 == "triangle" then
			slot_334_14_1 = slot_334_12_1 * 2

			if slot_334_14_1 > 1 then
				slot_334_14_1 = 2 - slot_334_14_1
			end

			slot_334_10_1 = (slot_334_14_1 * 2 - 1) * slot_334_6_1
		elseif slot_334_8_1 == "bounce" then
			slot_334_14_0 = slot_334_12_1 * 2

			if slot_334_14_0 > 1 then
				slot_334_14_0 = 2 - slot_334_14_0
			end

			slot_334_10_1 = (slot_334_14_0 * 2 - 1) * slot_334_6_1
		elseif slot_334_8_1 == "step" then
			slot_334_10_1 = slot_334_12_1 < 0.5 and slot_334_6_1 or -slot_334_6_1
		elseif slot_334_8_1 == "noise" then
			slot_334_10_1 = math.random(-math.floor(slot_334_6_1), math.floor(slot_334_6_1))
		end

		return slot_334_5_1 + slot_334_10_1 + arg_334_3
	end

	if arg_334_0 == "sweep" then
		slot_0_116_13[arg_334_2] = slot_0_116_13[arg_334_2] + 1
		slot_334_5_0 = arg_334_1.sweep_from and arg_334_1.sweep_from:get() or -90
		slot_334_6_0 = arg_334_1.sweep_to and arg_334_1.sweep_to:get() or 90
		slot_334_7_0 = arg_334_1.sweep_rate and arg_334_1.sweep_rate:get() or 6
		slot_334_8_0 = arg_334_1.sweep_hold and arg_334_1.sweep_hold:get() or 2
		slot_334_9_0 = arg_334_1.sweep_rand and arg_334_1.sweep_rand:get() or 0
		slot_334_10_0 = slot_334_7_0 + slot_334_8_0
		slot_334_11_0 = slot_0_116_13[arg_334_2] % (slot_334_10_0 * 2)
		slot_334_12_0 = nil

		if slot_334_11_0 < slot_334_7_0 then
			slot_334_12_0 = slot_334_5_0 + (slot_334_6_0 - slot_334_5_0) * (slot_334_11_0 / math.max(1, slot_334_7_0 - 1))
		elseif slot_334_11_0 < slot_334_10_0 then
			slot_334_12_0 = slot_334_6_0
		elseif slot_334_11_0 < slot_334_10_0 + slot_334_7_0 then
			slot_334_13_0 = (slot_334_11_0 - slot_334_10_0) / math.max(1, slot_334_7_0 - 1)
			slot_334_12_0 = slot_334_6_0 + (slot_334_5_0 - slot_334_6_0) * slot_334_13_0
		else
			slot_334_12_0 = slot_334_5_0
		end

		if slot_334_9_0 > 0 then
			slot_334_12_0 = slot_334_12_0 + math.random(-slot_334_9_0, slot_334_9_0)
		end

		return slot_334_12_0 + arg_334_3
	end

	return nil
end

function slot_0_76_0.get_abf_state(arg_335_0)
	return slot_0_105_12[arg_335_0]
end

slot_0_76_0.def_ind_latch = {
	is_working = false,
	reset_dur = 3,
	reset_time = 0
}
slot_0_76_0.head_vuln_ticks = 0

function slot_0_76_0.update(arg_336_0, arg_336_1, arg_336_2, arg_336_3)
	if slot_0_75_0.is_working then
		slot_0_76_0.is_active = false

		rage.antiaim:override_hidden_pitch(0)
		rage.antiaim:override_hidden_yaw_offset(0)

		return false
	end

	local var_336_0 = slot_0_59_0.antiaim.defensive

	local function var_336_1()
		slot_0_76_0.is_active = false

		rage.antiaim:override_hidden_pitch(0)
		rage.antiaim:override_hidden_yaw_offset(0)
	end

	local var_336_2 = slot_0_71_0.think()
	local var_336_3 = slot_0_72_0.think()
	local var_336_4

	var_336_4 = arg_336_3 or var_336_2 or var_336_3

	if not var_336_0 or not var_336_0.settings then
		var_336_1()

		return false
	end

	local var_336_5 = slot_0_77_0.think(arg_336_0)
	local var_336_6 = var_336_0.active_on:get("doubletap")
	local var_336_7 = var_336_0.active_on:get("hideshots")

	if not var_336_5 and (var_336_6 or var_336_7) then
		local var_336_8, var_336_9 = pcall(function()
			return slot_0_11_0.rage.main.double_tap:get()
		end)
		local var_336_10, var_336_11 = pcall(function()
			return slot_0_11_0.rage.main.hide_shots:get()
		end)
		local var_336_12 = var_336_10 and var_336_11 or slot_0_78_0.is_active

		if (not var_336_6 or not var_336_8 or not var_336_9) and (not var_336_7 or not var_336_12) then
			var_336_1()

			return false
		end
	end

	local var_336_13
	local var_336_14 = arg_336_3 and "safe head" or var_336_2 and "manual aa" or var_336_3 and "freestanding" or arg_336_2
	local var_336_15 = var_336_0.settings[var_336_14]

	if not var_336_15 or not var_336_15.enable:get() then
		var_336_1()

		return false
	end

	if var_336_15.activation_mode:get() == "hittable only" and not entity.get_threat(true) then
		var_336_1()

		return false
	end

	local var_336_16 = slot_0_105_12[var_336_14]

	if not var_336_15.def_abf or not var_336_15.def_abf:get() then
		if var_336_16 then
			var_336_16.yaw_extra = 0
			var_336_16.pitch_flipped = false
			var_336_16.reset_time = 0
			var_336_16.notified = false
		end

		if slot_0_76_0.def_ind_latch.triggered_state == var_336_14 then
			slot_0_76_0.def_ind_latch.is_working = false
			slot_0_76_0.def_ind_latch.reset_time = 0
			slot_0_76_0.def_ind_latch.triggered_state = nil
		end
	end

	if var_336_16 and var_336_16.reset_time > 0 and globals.realtime >= var_336_16.reset_time then
		var_336_16.yaw_extra = 0
		var_336_16.pitch_flipped = false
		var_336_16.reset_time = 0
		var_336_16.notified = false
	end

	slot_0_11_0.antiaim.angles.hidden:override(true)

	slot_0_76_0.is_active = true

	local var_336_17 = var_336_15.def_duration and var_336_15.def_duration:get() or 0

	if var_336_17 > 0 then
		if var_336_17 > slot_0_119_11[var_336_14] then
			slot_0_119_11[var_336_14] = slot_0_119_11[var_336_14] + 1
		end

		if var_336_17 <= slot_0_119_11[var_336_14] then
			var_336_1()

			return false
		end
	else
		slot_0_119_11[var_336_14] = 0
	end

	local var_336_18 = var_336_16 and var_336_16.pitch_flipped or false
	local var_336_19 = slot_0_121_10(var_336_15.pitch_mode:get(), var_336_15, var_336_14, var_336_18)

	rage.antiaim:override_hidden_pitch(var_336_19 ~= nil and var_336_19 or 0)

	local var_336_20 = var_336_16 and var_336_16.yaw_extra or 0
	local var_336_21 = arg_336_0.choked_commands == 0
	local var_336_22 = slot_0_123_8(var_336_15.yaw_mode:get(), var_336_15, var_336_14, var_336_20, var_336_21)

	rage.antiaim:override_hidden_yaw_offset(var_336_22 ~= nil and var_336_22 or 0)

	return false
end

function slot_0_124_8()
	for iter_340_0, iter_340_1 in ipairs(slot_0_86_3) do
		local var_340_0 = slot_0_105_12[iter_340_1]

		if var_340_0 then
			var_340_0.yaw_extra = 0
			var_340_0.pitch_flipped = false
			var_340_0.reset_time = 0
			var_340_0.notified = false
		end

		slot_0_97_7[iter_340_1] = 0
		slot_0_96_6[iter_340_1] = false
		slot_0_93_4[iter_340_1] = 0
		slot_0_101_10[iter_340_1] = 0
		slot_0_102_9[iter_340_1] = 0
		slot_0_103_10[iter_340_1] = false
		slot_0_99_7[iter_340_1] = 0
		slot_0_100_9[iter_340_1] = 0
		slot_0_114_17[iter_340_1] = 0
		slot_0_115_16[iter_340_1] = 0
		slot_0_116_13[iter_340_1] = 0
		slot_0_117_13[iter_340_1] = false
		slot_0_118_12[iter_340_1] = 0
		slot_0_119_11[iter_340_1] = 0
	end

	slot_0_76_0.def_ind_latch.is_working = false
	slot_0_76_0.def_ind_latch.reset_time = 0
	slot_0_76_0.def_ind_latch.triggered_state = nil
	slot_0_108_13 = {}
	slot_0_107_12 = {}
	slot_0_106_13 = {}
end

events.round_start(slot_0_124_8)
events.level_change(slot_0_124_8)
events.player_death(function(arg_341_0)
	local var_341_0 = entity.get_local_player()

	if not var_341_0 then
		return
	end

	if entity.get(arg_341_0.userid, true) == var_341_0 then
		slot_0_124_8()
	end
end)

function slot_0_79_0(arg_342_0, arg_342_1, arg_342_2)
	arg_342_0 = arg_342_0 or "?"

	local var_342_0 = arg_342_0 .. (arg_342_1 and ":hit" or ":miss")
	local var_342_1 = globals.realtime

	if var_342_0 == slot_0_80_0 and var_342_1 - slot_0_81_0 < 0.1 then
		return
	end

	slot_0_80_0 = var_342_0
	slot_0_81_0 = var_342_1

	local var_342_2 = slot_0_70_0.get and slot_0_70_0.get(slot_0_75_0.is_working)
	local var_342_3 = false
	local var_342_4 = false
	local var_342_5 = false
	local var_342_6 = false

	if var_342_2 then
		local var_342_7 = slot_0_59_0.antiaim.angles.builder and slot_0_59_0.antiaim.angles.builder[var_342_2]

		var_342_3 = var_342_7 and var_342_7.anti_bruteforce and var_342_7.anti_bruteforce:get() or false
		var_342_5 = var_342_7 and var_342_7.abf_notify ~= nil and var_342_7.abf_notify:get() or false

		local var_342_8 = slot_0_59_0.antiaim.defensive
		local var_342_9 = var_342_8 and var_342_8.settings and var_342_8.settings[var_342_2]

		var_342_4 = var_342_9 and var_342_9.def_abf and var_342_9.def_abf:get() or false
		var_342_6 = var_342_9 and var_342_9.def_abf_notify and var_342_9.def_abf_notify:get() or false
	end

	if arg_342_2 and not var_342_6 then
		return
	end

	if not arg_342_2 and not var_342_5 then
		return
	end

	local var_342_10
	local var_342_11

	var_342_11 = var_342_3 and var_342_4 and "anti-bruteforce" or arg_342_2 and "def abf" or "abf"

	local var_342_12 = slot_0_59_0.info and slot_0_59_0.info.notify
	local var_342_13

	if arg_342_1 then
		var_342_13 = var_342_12 and var_342_12.col_abf_hit and var_342_12.col_abf_hit:get() or color(255, 160, 80, 255)
	else
		var_342_13 = var_342_12 and var_342_12.col_abf_miss and var_342_12.col_abf_miss:get() or color(150, 195, 255, 255)
	end

	local var_342_14 = arg_342_1 and "hit" or "miss"
	local var_342_15, var_342_16 = pcall(function()
		return slot_0_59_0.info.notify.log_mode:get()
	end)

	slot_0_64_0.new({
		"anti-bruteforce triggered by ",
		string.lower(arg_342_0),
		" due to ",
		var_342_14,
		" impact - angle shifted"
	}, var_342_13)
end

slot_0_82_0 = {}
slot_0_83_1 = {}

for iter_0_35, iter_0_36 in ipairs(slot_0_12_0.states) do
	slot_0_83_1[iter_0_36] = {
		rnd_shots = 0,
		phase_current = 0,
		reset_dur = 3,
		reset_time = 0,
		last_tick = 0,
		is_working = false,
		offset = 0,
		saved_inv = false,
		trick_tick = 0,
		trigger_time = 0,
		rnd_amount = 0
	}
end

slot_0_84_2 = {}

for iter_0_37, iter_0_38 in ipairs(slot_0_12_0.states) do
	slot_0_84_2[iter_0_38] = false
end

slot_0_85_2 = {
	rnd_shots = 0,
	phase_current = 0,
	reset_time = 0,
	is_working = false,
	offset = 0,
	saved_inv = false,
	trick_tick = 0,
	trigger_time = 0,
	rnd_amount = 0
}
slot_0_86_2 = {}
slot_0_87_2 = {}
slot_0_88_2 = {}

function slot_0_89_1(arg_344_0)
	while arg_344_0 > 180 do
		arg_344_0 = arg_344_0 - 360
	end

	while arg_344_0 < -180 do
		arg_344_0 = arg_344_0 + 360
	end

	return arg_344_0
end

function slot_0_90_2(arg_345_0, arg_345_1, arg_345_2)
	local var_345_0 = arg_345_2 * math.pi / 180

	return vector(arg_345_0.x + math.cos(var_345_0) * arg_345_1, arg_345_0.y + math.sin(var_345_0) * arg_345_1, arg_345_0.z)
end

events.player_hurt(function(arg_346_0)
	local var_346_0 = entity.get_local_player()

	if not var_346_0 or not var_346_0:is_alive() then
		return
	end

	local var_346_1 = entity.get(arg_346_0.userid, true)
	local var_346_2 = entity.get(arg_346_0.attacker, true)

	if not var_346_2 or not var_346_2:is_enemy() or var_346_1 ~= var_346_0 then
		return
	end

	local var_346_3 = {
		"knife",
		"hegrenade",
		"inferno",
		"flashbang",
		"decoy",
		"smokegrenade",
		"taser"
	}

	for iter_346_0, iter_346_1 in ipairs(var_346_3) do
		if arg_346_0.weapon == iter_346_1 then
			return
		end
	end

	local var_346_4 = var_346_2:get_index()
	local var_346_5, var_346_6 = pcall(function()
		return var_346_2:get_name()
	end)

	slot_0_87_2[var_346_4] = {
		name = var_346_5 and var_346_6 or "?",
		time = globals.curtime
	}
end)
events.bullet_impact(function(arg_348_0)
	local var_348_0 = entity.get_local_player()

	if not var_348_0 or not var_348_0:is_alive() then
		return
	end

	local var_348_1 = entity.get(arg_348_0.userid, true)

	if not var_348_1 or not var_348_1:is_enemy() or not var_348_1:is_alive() or var_348_1:is_dormant() then
		return
	end

	local var_348_2 = var_348_1:get_index()
	local var_348_3 = var_348_0.m_vecOrigin
	local var_348_4 = var_348_1.m_vecOrigin
	local var_348_5 = math.atan(var_348_3.y - var_348_4.y, var_348_3.x - var_348_4.x) * 180 / math.pi
	local var_348_6 = var_348_0:get_origin() + var_348_0.m_vecViewOffset
	local var_348_7 = var_348_1:get_origin() + var_348_1.m_vecViewOffset
	local var_348_8 = vector(arg_348_0.x, arg_348_0.y, arg_348_0.z)
	local var_348_9 = slot_0_90_2(var_348_6, 16, slot_0_89_1(var_348_5 - 45 + 180))
	local var_348_10 = slot_0_90_2(var_348_6, 16, slot_0_89_1(var_348_5 + 45 + 180))
	local var_348_11 = var_348_9:closest_ray_point(var_348_7, var_348_8)
	local var_348_12 = var_348_10:closest_ray_point(var_348_7, var_348_8)
	local var_348_13 = var_348_11:dist(var_348_9)
	local var_348_14 = var_348_12:dist(var_348_10)

	if var_348_13 < 70 or var_348_14 < 70 then
		local var_348_15, var_348_16 = pcall(function()
			return var_348_1:get_name()
		end)

		slot_0_86_2[var_348_2] = {
			name = var_348_15 and var_348_16 or "?",
			time = globals.curtime
		}
	end
end)
events.render(function()
	local var_350_0 = entity.get_local_player()

	if not var_350_0 or not var_350_0:is_alive() then
		return
	end

	slot_0_10_0(true, true, function(arg_351_0)
		local var_351_0 = arg_351_0:get_index()

		local function var_351_1(arg_352_0, arg_352_1)
			local var_352_0 = slot_0_70_0.get(slot_0_75_0.is_working)

			if not var_352_0 then
				return
			end

			local var_352_1 = slot_0_83_1[var_352_0]

			if not var_352_1 then
				return
			end

			local var_352_2 = slot_0_59_0.antiaim.angles.builder[var_352_0]

			if not var_352_2 or not var_352_2.anti_bruteforce:get() then
				return
			end

			local var_352_3 = var_352_2.abf_trigger and var_352_2.abf_trigger:get() or "miss"

			if arg_352_1 and var_352_3 == "miss" then
				return
			end

			if not arg_352_1 and var_352_3 == "hit" then
				return
			end

			local var_352_4 = var_352_2.abf_reset_timer and var_352_2.abf_reset_timer:get() or 3

			if var_352_1.reset_time > 0 and globals.realtime >= var_352_1.reset_time then
				slot_0_84_2[var_352_0] = false
				var_352_1.reset_time = 0
				slot_0_85_2.is_working = false
				slot_0_85_2.reset_time = 0
				slot_0_85_2.triggered_state = nil
			end

			if var_352_1.last_tick == globals.tickcount then
				return
			end

			var_352_1.last_tick = globals.tickcount
			var_352_1.reset_dur = var_352_4
			var_352_1.reset_time = globals.realtime + var_352_4
			var_352_1.trigger_time = globals.realtime
			var_352_1.trick_tick = 0
			var_352_1.saved_inv = rage.antiaim:inverter()

			if (var_352_2.abf_phase_n or 0) > 0 then
				var_352_1.phase_current = var_352_1.phase_current + 1
				var_352_1.is_working = true
			end

			slot_0_85_2.is_working = var_352_1.is_working
			slot_0_85_2.offset = var_352_1.offset
			slot_0_85_2.phase_current = var_352_1.phase_current
			slot_0_85_2.rnd_shots = var_352_1.rnd_shots
			slot_0_85_2.rnd_amount = var_352_1.rnd_amount
			slot_0_85_2.reset_time = var_352_1.reset_time
			slot_0_85_2.triggered_state = var_352_0
			slot_0_85_2.mode = "custom"
			slot_0_85_2.trigger_time = var_352_1.trigger_time
			slot_0_85_2.trick_tick = 0
			slot_0_85_2.saved_inv = var_352_1.saved_inv
			slot_0_82_0.ind_latch.is_working = true
			slot_0_82_0.ind_latch.reset_time = var_352_1.reset_time
			slot_0_82_0.ind_latch.reset_dur = var_352_1.reset_dur
			slot_0_82_0.ind_latch.triggered_state = var_352_0

			if var_352_2.abf_notify ~= nil and var_352_2.abf_notify:get() and not slot_0_84_2[var_352_0] then
				slot_0_84_2[var_352_0] = true

				slot_0_79_0(arg_352_0.name, arg_352_1, false)
			end
		end

		if slot_0_87_2[var_351_0] then
			local var_351_2 = slot_0_87_2[var_351_0]

			if slot_0_88_2[var_351_0] and slot_0_88_2[var_351_0] == var_351_2.time then
				slot_0_87_2[var_351_0] = nil
				slot_0_86_2[var_351_0] = nil

				return
			end

			slot_0_88_2[var_351_0] = var_351_2.time

			var_351_1(var_351_2, true)

			slot_0_87_2[var_351_0] = nil
			slot_0_86_2[var_351_0] = nil
		end

		if slot_0_86_2[var_351_0] then
			local var_351_3 = slot_0_86_2[var_351_0]

			if slot_0_88_2[var_351_0] and slot_0_88_2[var_351_0] == var_351_3.time then
				slot_0_86_2[var_351_0] = nil

				return
			end

			slot_0_88_2[var_351_0] = var_351_3.time

			var_351_1(var_351_3, false)

			slot_0_86_2[var_351_0] = nil
		end
	end)
end)

slot_0_82_0.abf_state = slot_0_83_1
slot_0_82_0.ind_latch = {
	is_working = false,
	reset_dur = 3,
	reset_time = 0
}

function slot_0_82_0.reset(arg_353_0)
	local var_353_0 = arg_353_0 and {
		arg_353_0
	} or slot_0_12_0.states

	for iter_353_0, iter_353_1 in ipairs(var_353_0) do
		local var_353_1 = slot_0_83_1[iter_353_1]

		if var_353_1 then
			var_353_1.last_tick = 0
			var_353_1.reset_time = 0
			var_353_1.is_working = false
			var_353_1.offset = 0
			var_353_1.phase_current = 0
			var_353_1.rnd_shots = 0
			var_353_1.rnd_amount = 0
			var_353_1.trigger_time = 0
			var_353_1.trick_tick = 0
			var_353_1.saved_inv = false
		end

		slot_0_84_2[iter_353_1] = false
	end

	if not arg_353_0 or slot_0_85_2.triggered_state == arg_353_0 then
		slot_0_85_2.is_working = false
		slot_0_85_2.offset = 0
		slot_0_85_2.phase_current = 0
		slot_0_85_2.rnd_shots = 0
		slot_0_85_2.rnd_amount = 0
		slot_0_85_2.reset_time = 0
		slot_0_85_2.triggered_state = nil
		slot_0_85_2.mode = nil
		slot_0_85_2.trigger_time = 0
		slot_0_85_2.trick_tick = 0
		slot_0_85_2.saved_inv = false

		if not arg_353_0 then
			slot_0_82_0.ind_latch.is_working = false
			slot_0_82_0.ind_latch.reset_time = 0
		end
	end
end

function slot_0_82_0.update(arg_354_0, arg_354_1, arg_354_2, arg_354_3)
	if not arg_354_3 or not arg_354_3.anti_bruteforce:get() then
		local var_354_0 = slot_0_83_1[arg_354_2]

		if var_354_0 and var_354_0.is_working then
			slot_0_82_0.reset(arg_354_2)
		end

		local var_354_1 = slot_0_82_0.ind_latch

		if var_354_1.is_working then
			local var_354_2 = var_354_1.triggered_state
			local var_354_3 = slot_0_59_0.antiaim.angles.builder and var_354_2 and slot_0_59_0.antiaim.angles.builder[var_354_2]

			if not (var_354_3 and var_354_3.anti_bruteforce and var_354_3.anti_bruteforce:get() or false) then
				var_354_1.is_working = false
				var_354_1.reset_time = 0
				var_354_1.triggered_state = nil
			end
		end

		return
	end

	local var_354_4 = slot_0_83_1[arg_354_2]

	if not var_354_4 then
		return
	end

	if var_354_4.reset_time > 0 and globals.realtime >= var_354_4.reset_time then
		slot_0_82_0.reset(arg_354_2)
	end

	if slot_0_85_2.reset_time > 0 and globals.realtime >= slot_0_85_2.reset_time then
		slot_0_85_2.is_working = false
		slot_0_85_2.reset_time = 0
		slot_0_85_2.triggered_state = nil
		slot_0_85_2.trigger_time = 0
		slot_0_85_2.trick_tick = 0
		slot_0_85_2.saved_inv = false
	end

	local var_354_5 = var_354_4.is_working and var_354_4 or slot_0_85_2.is_working and slot_0_85_2 or nil

	if not var_354_5 then
		return
	end

	if arg_354_0.choked_commands == 0 then
		var_354_5.trick_tick = var_354_5.trick_tick + 1
	end

	local var_354_6 = var_354_5 == var_354_4 and arg_354_3 or slot_0_59_0.antiaim.angles.builder[slot_0_85_2.triggered_state] or arg_354_3
	local var_354_7 = var_354_6.abf_phase_n or 0
	local var_354_8 = var_354_5.phase_current

	if var_354_7 > 0 and var_354_8 > 0 then
		local var_354_9 = (var_354_8 - 1) % var_354_7 + 1
		local var_354_10 = var_354_6.abf_phases and var_354_6.abf_phases[var_354_9]

		if var_354_10 then
			local var_354_11 = var_354_10.rand_min:get()
			local var_354_12 = var_354_10.rand_max:get()

			if var_354_12 < var_354_11 then
				var_354_11, var_354_12 = var_354_12, var_354_11
			end

			local var_354_13 = math.random(var_354_11, var_354_12)

			arg_354_1.yaw_offset = (arg_354_1.yaw_offset or 0) + var_354_13
		end
	end
end

events.round_start(function()
	slot_0_82_0.reset()

	slot_0_82_0.ind_latch.triggered_state = nil
	slot_0_85_2.is_working = false
	slot_0_85_2.offset = 0
	slot_0_85_2.phase_current = 0
	slot_0_85_2.rnd_shots = 0
	slot_0_85_2.rnd_amount = 0
	slot_0_85_2.reset_time = 0
	slot_0_85_2.triggered_state = nil
	slot_0_85_2.mode = nil
	slot_0_85_2.trigger_time = 0
	slot_0_85_2.trick_tick = 0
	slot_0_85_2.saved_inv = false
	slot_0_87_2 = {}
	slot_0_86_2 = {}
	slot_0_88_2 = {}
end)
events.player_disconnect(function(arg_356_0)
	local var_356_0 = arg_356_0.userid

	slot_0_87_2[var_356_0] = nil
	slot_0_86_2[var_356_0] = nil
	slot_0_88_2[var_356_0] = nil
end)
events.player_death(function(arg_357_0)
	local var_357_0 = entity.get_local_player()

	if not var_357_0 then
		return
	end

	if entity.get(arg_357_0.userid, true) == var_357_0 then
		slot_0_82_0.reset()

		slot_0_82_0.ind_latch.triggered_state = nil
	end
end)

slot_0_83_0 = {}
slot_0_84_1 = {
	reset = function(arg_358_0)
		for iter_358_0, iter_358_1 in pairs(slot_0_11_0.antiaim.angles) do
			iter_358_1:override()
		end
	end,
	define = function(arg_359_0)
		arg_359_0.pitch = nil
		arg_359_0.yaw = nil
		arg_359_0.yaw_offset = nil
		arg_359_0.yaw_base = nil
		arg_359_0.yaw_modifier = nil
		arg_359_0.modifier_offset = nil
		arg_359_0.left_limit = nil
		arg_359_0.right_limit = nil
		arg_359_0.body_yaw = nil
		arg_359_0.body_yaw_options = nil
		arg_359_0.disable_yaw_modifiers = nil
		arg_359_0.body_freestanding = nil
		arg_359_0.freestanding = nil
		arg_359_0.freestand_peek = nil
		arg_359_0.lag_options = nil
		arg_359_0.hs_options = nil
		arg_359_0.avoid_backstab = nil
		arg_359_0.ignore_inverter = false
		arg_359_0.inverter = nil
		arg_359_0.way = nil
	end,
	run = function(arg_360_0)
		if arg_360_0.yaw_modifier == "Custom Ways" and arg_360_0.way then
			local var_360_0 = #arg_360_0.way

			if var_360_0 > 0 then
				local var_360_1 = globals.tickcount % var_360_0 + 1

				arg_360_0.yaw_offset = (arg_360_0.yaw_offset or 0) + (arg_360_0.way[var_360_1] or 0)
			end

			arg_360_0.yaw_modifier = "Disabled"
			arg_360_0.modifier_offset = 0
		end

		slot_0_11_0.antiaim.angles.pitch:override(arg_360_0.pitch or "Disabled")
		slot_0_11_0.antiaim.angles.yaw:override(arg_360_0.yaw or "disabled")
		slot_0_11_0.antiaim.angles.yaw_add:override(arg_360_0.yaw_offset or 0)

		local var_360_2 = {
			["Local view"] = "Local View",
			["Local View"] = "Local View",
			["At Target"] = "At Target",
			["At target"] = "At Target",
			["at target"] = "At Target",
			["local view"] = "Local View"
		}

		slot_0_11_0.antiaim.angles.yaw_base:override(var_360_2[arg_360_0.yaw_base] or arg_360_0.yaw_base or "Local View")
		slot_0_11_0.antiaim.angles.yaw_modifier:override(arg_360_0.yaw_modifier or "Disabled")
		slot_0_11_0.antiaim.angles.modifier_offset:override(arg_360_0.modifier_offset or 0)
		slot_0_11_0.antiaim.angles.body_yaw:override(arg_360_0.body_yaw or false)

		if arg_360_0.body_yaw then
			local var_360_3 = arg_360_0.inverter == nil and rage.antiaim:inverter() or arg_360_0.inverter

			slot_0_11_0.antiaim.angles.inverter:override(var_360_3)
			slot_0_11_0.antiaim.angles.left_limit:override(arg_360_0.left_limit or 0)
			slot_0_11_0.antiaim.angles.right_limit:override(arg_360_0.right_limit or 0)
		else
			slot_0_11_0.antiaim.angles.left_limit:override(arg_360_0.left_limit or 0)
			slot_0_11_0.antiaim.angles.right_limit:override(arg_360_0.right_limit or 0)
		end

		slot_0_11_0.antiaim.angles.options:override(arg_360_0.body_yaw_options or {})
		slot_0_11_0.antiaim.angles.disable_yaw_modifiers:override(arg_360_0.disable_yaw_modifiers or false)
		slot_0_11_0.antiaim.angles.body_freestanding:override(arg_360_0.body_freestanding or false)
		slot_0_11_0.antiaim.angles.freestanding:override(arg_360_0.freestanding or false)

		local var_360_4 = {
			["peek real"] = "Peek Real",
			off = "Off",
			["peek fake"] = "Peek Fake",
			["Peek Real"] = "Peek Real",
			["Peek Fake"] = "Peek Fake",
			Off = "Off"
		}

		slot_0_11_0.antiaim.angles.freestand_peek:override(var_360_4[arg_360_0.freestand_peek] or arg_360_0.freestand_peek or "Off")

		local var_360_5 = {
			["On Peek"] = "On Peek",
			["Always on"] = "Always On",
			["Always On"] = "Always On"
		}

		slot_0_11_0.rage.main.double_tap_lag_options:override(var_360_5[arg_360_0.lag_options] or arg_360_0.lag_options or "On Peek")

		local var_360_6 = {
			["favor fire rate"] = "Favor Fire Rate",
			["break lc"] = "Break LC",
			["favor fake lag"] = "Favor Fake Lag"
		}

		slot_0_11_0.rage.main.hide_shots_options:override(var_360_6[arg_360_0.hs_options] or arg_360_0.hs_options or "Favor Fire Rate")
		slot_0_11_0.antiaim.angles.avoid_backstab:override(arg_360_0.avoid_backstab or false)
	end
}

slot_0_84_1:reset()

function slot_0_83_0.create_antiaim()
	return setmetatable({}, {
		__index = slot_0_84_1
	})
end

slot_0_84_0 = {}
slot_0_85_1 = {
	running = true,
	air = true,
	["air crouching"] = true,
	slowing = true,
	sneaking = true,
	crouching = true,
	standing = true
}
slot_0_84_0.active = false
slot_0_86_1 = 0
slot_0_87_1 = false
slot_0_88_1 = nil

function slot_0_84_0.think(arg_362_0)
	if not slot_0_85_1[arg_362_0] then
		return false
	end

	local var_362_0 = entity.get_local_player()

	if not var_362_0 or not var_362_0:is_alive() then
		return false
	end

	local var_362_1 = var_362_0:get_player_weapon()

	if not var_362_1 or var_362_1:get_weapon_index() == 64 then
		return false
	end

	local var_362_2 = slot_0_11_0.rage.main.double_tap
	local var_362_3 = slot_0_11_0.rage.main.hide_shots

	if (not var_362_2 or not var_362_2:get()) and (not var_362_3 or not var_362_3:get()) and not slot_0_78_0.is_active then
		return false
	end

	if rage.exploit:get() ~= 1 then
		return false
	end

	local var_362_4 = slot_0_59_0.antiaim.defensive.settings[arg_362_0]

	if not var_362_4 or not var_362_4.fe or not var_362_4.fe:get() then
		return false
	end

	local var_362_5 = var_362_4.fe_alt and var_362_4.fe_alt:get() or false
	local var_362_6 = var_362_4.fe_peek and var_362_4.fe_peek:get() or false
	local var_362_7 = var_362_4.fe_snap_delay and var_362_4.fe_snap_delay:get() or 0

	return true, var_362_5, var_362_6, var_362_7
end

function slot_0_84_0.apply(arg_363_0, arg_363_1, arg_363_2, arg_363_3, arg_363_4)
	slot_0_84_0.active = true
	arg_363_1.pitch = "Down"
	arg_363_1.yaw = "backward"
	arg_363_1.yaw_base = "At Target"
	arg_363_1.yaw_offset = 12
	arg_363_1.yaw_modifier = "Disabled"
	arg_363_1.modifier_offset = 0
	arg_363_1.body_yaw = true
	arg_363_1.body_yaw_options = arg_363_3 and {
		"Avoid Overlap"
	} or {}
	arg_363_1.left_limit = 60
	arg_363_1.right_limit = 60
	arg_363_1.freestanding = false
	arg_363_1.body_freestanding = false
	arg_363_1.freestand_peek = arg_363_3 and "peek fake" or "off"

	slot_0_11_0.antiaim.angles.hidden:override(true)
	rage.antiaim:inverter(false)

	local var_363_0 = arg_363_0.choked_commands == 0

	if slot_0_88_1 == nil then
		slot_0_88_1 = globals.tickcount
		slot_0_86_1 = 0
		slot_0_87_1 = false
	end

	if arg_363_4 == 0 then
		if var_363_0 then
			slot_0_87_1 = not slot_0_87_1
		end
	elseif var_363_0 then
		if arg_363_4 <= slot_0_86_1 then
			slot_0_87_1 = not slot_0_87_1
			slot_0_86_1 = 0
		else
			slot_0_86_1 = slot_0_86_1 + 1
		end
	end

	local var_363_1 = rage.antiaim:inverter()
	local var_363_2 = slot_0_87_1 and not var_363_1 or not slot_0_87_1 and var_363_1

	rage.antiaim:override_hidden_yaw_offset(var_363_2 and 90 or -90)
	rage.antiaim:override_hidden_pitch(arg_363_2 and utils.random_float(-5, 5) or 89)
end

function slot_0_84_0.reset_snap()
	slot_0_88_1 = nil
	slot_0_86_1 = 0
	slot_0_87_1 = false
end

slot_0_85_0 = {
	yaw = 0,
	oz = 0,
	oy = 0,
	ox = 0,
	fired = false
}
slot_0_86_0 = false
slot_0_87_0 = 0

function slot_0_88_0(arg_365_0, arg_365_1, arg_365_2)
	local var_365_0 = math.max(1, arg_365_1 or 2)

	if arg_365_0.choked_commands == 0 then
		slot_0_87_0 = slot_0_87_0 + 1
	end

	local var_365_1 = false

	if var_365_0 <= slot_0_87_0 then
		slot_0_87_0 = 0
		slot_0_86_0 = not slot_0_86_0
		var_365_1 = true
	end

	rage.antiaim:inverter(slot_0_86_0)

	return var_365_1
end

slot_0_89_0 = {}
slot_0_90_1 = slot_0_83_0.create_antiaim()

function slot_0_89_0.get_exploit_values(arg_366_0, arg_366_1)
	return ({
		-arg_366_0,
		-arg_366_0 / 2,
		-arg_366_0 / 3,
		arg_366_0 / 3,
		arg_366_0 / 2,
		arg_366_0
	})[arg_366_1 or 1]
end

function slot_0_89_0.get_preset(arg_367_0)
	return slot_0_59_0.antiaim.angles.builder[arg_367_0]
end

slot_0_91_1 = 1
slot_0_92_2 = 0
slot_0_93_3 = 0
slot_0_94_3 = false
slot_0_95_4 = false
slot_0_96_5 = false
slot_0_97_6 = {}
slot_0_98_5 = {}
slot_0_99_6 = {}
slot_0_100_8 = {}
slot_0_101_9 = {}
slot_0_102_8 = {}
slot_0_103_9 = {}
slot_0_104_10 = {}
slot_0_105_11 = {}
slot_0_106_12 = {}
slot_0_107_11 = {}
slot_0_108_12 = {}
slot_0_109_13 = {}
slot_0_110_14 = {}
slot_0_111_20 = {}
slot_0_112_19 = {}
slot_0_113_16 = {}
slot_0_114_16 = {}
slot_0_115_15 = {}
slot_0_116_12 = {}
slot_0_117_12 = {}
slot_0_118_11 = {}
slot_0_119_10 = {}

function slot_0_120_10(arg_368_0)
	if slot_0_97_6[arg_368_0] ~= nil then
		return
	end

	slot_0_97_6[arg_368_0] = 0
	slot_0_98_5[arg_368_0] = false
	slot_0_99_6[arg_368_0] = 0
	slot_0_100_8[arg_368_0] = 0
	slot_0_101_9[arg_368_0] = 0
	slot_0_102_8[arg_368_0] = 0
	slot_0_103_9[arg_368_0] = 0
	slot_0_104_10[arg_368_0] = 0
	slot_0_105_11[arg_368_0] = 1
	slot_0_106_12[arg_368_0] = 1
	slot_0_107_11[arg_368_0] = 0
	slot_0_108_12[arg_368_0] = 0
	slot_0_109_13[arg_368_0] = 0
	slot_0_110_14[arg_368_0] = 0
	slot_0_111_20[arg_368_0] = 0
	slot_0_112_19[arg_368_0] = 0
	slot_0_113_16[arg_368_0] = 0
	slot_0_114_16[arg_368_0] = 0
	slot_0_115_15[arg_368_0] = 0
	slot_0_116_12[arg_368_0] = 0
	slot_0_117_12[arg_368_0] = 1
	slot_0_118_11[arg_368_0] = false
	slot_0_119_10[arg_368_0] = false
end

slot_0_121_9 = {
	3,
	2,
	4,
	2,
	3,
	2
}
slot_0_122_10 = 1
slot_0_123_7 = 0
slot_0_124_7 = false
slot_0_125_6 = 0
slot_0_126_8 = false

function slot_0_127_6(arg_369_0)
	if arg_369_0.choked_commands == 0 then
		if slot_0_126_8 then
			slot_0_126_8 = false
		end

		slot_0_125_6 = 0
		slot_0_123_7 = slot_0_123_7 + 1

		if slot_0_123_7 >= slot_0_121_9[slot_0_122_10] then
			slot_0_123_7 = 0
			slot_0_122_10 = slot_0_122_10 % #slot_0_121_9 + 1
			slot_0_124_7 = not slot_0_124_7
		end

		rage.antiaim:inverter(slot_0_124_7)
	else
		slot_0_125_6 = slot_0_125_6 + 1

		if slot_0_125_6 == 3 and not slot_0_126_8 then
			slot_0_126_8 = true

			rage.antiaim:inverter(not slot_0_124_7)
		end
	end
end

slot_0_128_7 = 0
slot_0_129_5 = 0
slot_0_130_3 = 0
slot_0_131_2 = 0
slot_0_132_2 = 0
slot_0_133_2 = 0
slot_0_134_2 = 1
slot_0_135_2 = 8
slot_0_136_2 = 58
slot_0_137_1 = 0

function slot_0_138_1()
	local var_370_0 = entity.get_local_player()

	if not var_370_0 or not var_370_0:is_alive() then
		return 1
	end

	local var_370_1 = var_370_0:get_origin()
	local var_370_2 = render.camera_angles().y
	local var_370_3 = 0
	local var_370_4 = 0

	slot_0_10_0(true, false, function(arg_371_0)
		if arg_371_0:is_dormant() or not arg_371_0:is_alive() then
			return
		end

		local var_371_0 = arg_371_0:get_origin()
		local var_371_1 = var_370_1:dist(var_371_0)

		if var_371_1 < 1 then
			return
		end

		local var_371_2 = 1 / (var_371_1 * var_371_1)

		var_370_3 = var_370_3 + var_371_0.x * var_371_2
		var_370_4 = var_370_4 + var_371_0.y * var_371_2
	end)

	if var_370_3 == 0 and var_370_4 == 0 then
		return 1
	end

	local var_370_5 = math.deg(math.atan2(var_370_4 - var_370_1.y, var_370_3 - var_370_1.x))

	return math.fmod(var_370_5 - var_370_2 + 540, 360) - 180 >= 0 and -1 or 1
end

function slot_0_139_1(arg_372_0, arg_372_1, arg_372_2, arg_372_3, arg_372_4, arg_372_5)
	local var_372_0 = math.max(1, arg_372_1) * 2
	local var_372_1 = arg_372_0 % var_372_0 / var_372_0
	local var_372_2 = (arg_372_4 or 0) * math.pi / 180
	local var_372_3 = arg_372_5 and arg_372_5 / 100 or 0
	local var_372_4 = 0

	if arg_372_3 == "sine" then
		var_372_4 = math.sin(var_372_1 * math.pi * 2 + var_372_2) * arg_372_2
	elseif arg_372_3 == "triangle" then
		local var_372_5 = var_372_1 * 2

		if var_372_5 > 1 then
			var_372_5 = 2 - var_372_5
		end

		var_372_4 = (var_372_5 * 2 - 1) * arg_372_2
	elseif arg_372_3 == "bounce" then
		local var_372_6 = var_372_1 * 2

		if var_372_6 > 1 then
			var_372_6 = 2 - var_372_6
		end

		var_372_4 = (var_372_6 * 2 - 1) * arg_372_2
	elseif arg_372_3 == "step" then
		var_372_4 = var_372_1 < 0.5 and arg_372_2 or -arg_372_2
	elseif arg_372_3 == "noise" then
		var_372_4 = math.random(-math.floor(arg_372_2), math.floor(arg_372_2))
	end

	if var_372_3 ~= 0 then
		var_372_4 = var_372_4 * (1 + (var_372_4 > 0 and var_372_3 or -var_372_3))
	end

	return var_372_4
end

function slot_0_140_1(arg_373_0, arg_373_1, arg_373_2, arg_373_3)
	if not arg_373_0.flip_jitter or not arg_373_0.flip_jitter:get() then
		return arg_373_1
	end

	local var_373_0 = arg_373_0.flip_jitter_mode:get()
	local var_373_1 = arg_373_0.flip_jitter_amt:get()

	if var_373_0 == "additive" then
		return arg_373_1 + math.random(0, var_373_1)
	elseif var_373_0 == "subtractive" then
		return arg_373_1 - math.random(0, var_373_1)
	elseif var_373_0 == "alternating" then
		local var_373_2 = arg_373_0.flip_jitter_rate:get()

		slot_0_99_6[arg_373_3] = slot_0_99_6[arg_373_3] + 1

		if var_373_2 <= slot_0_99_6[arg_373_3] then
			slot_0_99_6[arg_373_3] = 0
			slot_0_98_5[arg_373_3] = not slot_0_98_5[arg_373_3]
		end

		return arg_373_1 + (slot_0_98_5[arg_373_3] and var_373_1 or -var_373_1)
	elseif var_373_0 == "noise" then
		return arg_373_1 + math.random(-var_373_1, var_373_1)
	elseif var_373_0 == "spike" then
		local var_373_3 = arg_373_0.flip_jitter_spike_dur and arg_373_0.flip_jitter_spike_dur:get() or 1

		if arg_373_2 then
			slot_0_100_8[arg_373_3] = var_373_3
		end

		if slot_0_100_8[arg_373_3] > 0 then
			slot_0_100_8[arg_373_3] = slot_0_100_8[arg_373_3] - 1

			return arg_373_1 + (slot_0_94_3 and var_373_1 or -var_373_1)
		end
	end

	return arg_373_1
end

function slot_0_89_0.update_yaw(arg_374_0, arg_374_1, arg_374_2, arg_374_3)
	arg_374_1.pitch = "Down"
	arg_374_1.yaw = "backward"

	local var_374_0 = false

	if arg_374_2.yaw_base and arg_374_2.yaw_base:get() == "at target" then
		local var_374_1 = entity.get_local_player()
		local var_374_2 = var_374_1 and var_374_1:get_origin()
		local var_374_3 = math.huge

		slot_0_10_0(true, false, function(arg_375_0)
			if arg_375_0:is_dormant() or not arg_375_0:is_alive() then
				return
			end

			local var_375_0 = arg_375_0:get_bbox()

			if not var_375_0 or var_375_0.alpha < 0.05 then
				return
			end

			local var_375_1 = var_374_2 and var_374_2:dist2d(arg_375_0:get_origin()) or 0

			if var_375_1 < var_374_3 then
				var_374_3 = var_375_1
				var_374_0 = true
			end
		end)
	end

	arg_374_1.yaw_base = var_374_0 and "At Target" or "Local View"

	local var_374_4 = "left/right"

	if var_374_4 == "left/right" then
		arg_374_1._lr_left = arg_374_2.yaw_left:get()
		arg_374_1._lr_right = arg_374_2.yaw_right:get()
		arg_374_1._lr_side = false
		arg_374_1.yaw_offset = arg_374_1._lr_right
	elseif var_374_4 == "jitter" then
		if arg_374_0.choked_commands == 0 then
			slot_0_97_6[arg_374_3] = slot_0_97_6[arg_374_3] + 1
		end

		local var_374_5 = slot_0_139_1(slot_0_97_6[arg_374_3], arg_374_2.jitter_speed:get(), arg_374_2.jitter_range:get(), arg_374_2.jitter_style:get(), arg_374_2.jitter_phase:get(), arg_374_2.jitter_asymmetry:get())

		arg_374_1.yaw_offset = arg_374_2.jitter_base:get() + var_374_5

		rage.antiaim:inverter(var_374_5 >= 0)
	elseif var_374_4 == "chaotic" then
		local var_374_6 = arg_374_2.chaotic_range:get()
		local var_374_7 = arg_374_2.chaotic_seed_rate:get()
		local var_374_8 = arg_374_2.chaotic_smooth and arg_374_2.chaotic_smooth:get()

		if arg_374_0.choked_commands == 0 then
			slot_0_102_8[arg_374_3] = slot_0_102_8[arg_374_3] + 1
		end

		if var_374_7 <= slot_0_102_8[arg_374_3] then
			slot_0_102_8[arg_374_3] = 0
			slot_0_101_9[arg_374_3] = slot_0_101_9[arg_374_3] + 1
			slot_0_103_9[arg_374_3] = slot_0_104_10[arg_374_3]

			math.randomseed(globals.tickcount + slot_0_101_9[arg_374_3] * 137)

			slot_0_104_10[arg_374_3] = math.random(-math.floor(var_374_6), math.floor(var_374_6))

			math.randomseed(globals.tickcount)
		end

		local var_374_9

		if var_374_8 then
			local var_374_10 = var_374_7 > 0 and slot_0_102_8[arg_374_3] / var_374_7 or 0

			var_374_9 = slot_0_103_9[arg_374_3] + (slot_0_104_10[arg_374_3] - slot_0_103_9[arg_374_3]) * var_374_10
		else
			var_374_9 = slot_0_104_10[arg_374_3]
		end

		arg_374_1.yaw_offset = var_374_9

		rage.antiaim:inverter(var_374_9 >= 0)
	end
end

function slot_0_89_0.update_body_yaw(arg_376_0, arg_376_1, arg_376_2, arg_376_3)
	if not arg_376_2.body_yaw:get() then
		arg_376_1.body_yaw = false
		arg_376_1._lr_side = false

		if arg_376_1._lr_left ~= nil and arg_376_1._lr_right ~= nil then
			arg_376_1.yaw_offset = arg_376_1._lr_right
		end

		return
	end

	local var_376_0 = arg_376_2.body_yaw_mode and arg_376_2.body_yaw_mode:get() or "static"
	local var_376_1 = tostring(var_376_0):lower()
	local var_376_2 = false
	local var_376_3 = 0

	arg_376_1.body_yaw = true

	if var_376_1 == "jitter" then
		local var_376_4 = arg_376_2.body_yaw_delay_mode and arg_376_2.body_yaw_delay_mode:get() or "static"

		if var_376_4 == "static" then
			local var_376_5 = arg_376_2.body_yaw_delay and arg_376_2.body_yaw_delay:get() or 0

			if var_376_5 > 0 then
				local var_376_6 = var_376_5 + 2

				if arg_376_0.choked_commands == 0 then
					slot_0_95_4 = var_376_6 > arg_376_0.tickcount % (var_376_6 * 2)
				end

				var_376_2 = slot_0_95_4
			else
				var_376_2 = slot_0_96_5
			end
		elseif var_376_4 == "random" then
			slot_0_116_12[arg_376_3] = slot_0_116_12[arg_376_3] - 1

			if slot_0_116_12[arg_376_3] <= 0 then
				local var_376_7 = arg_376_2.body_yaw_delay_random_min and arg_376_2.body_yaw_delay_random_min:get() or 2
				local var_376_8 = arg_376_2.body_yaw_delay_random_max and arg_376_2.body_yaw_delay_random_max:get() or 6

				if var_376_8 < var_376_7 then
					var_376_7, var_376_8 = var_376_8, var_376_7
				end

				slot_0_116_12[arg_376_3] = math.random(var_376_7, var_376_8) + 2
				slot_0_118_11[arg_376_3] = not slot_0_118_11[arg_376_3]
			end

			if arg_376_0.choked_commands == 0 then
				slot_0_95_4 = slot_0_118_11[arg_376_3]
			end

			var_376_2 = slot_0_95_4
		elseif var_376_4 == "sequence" then
			local var_376_9 = arg_376_2.body_yaw_delay_seq_count and arg_376_2.body_yaw_delay_seq_count:get() or 3

			if var_376_9 < slot_0_117_12[arg_376_3] then
				slot_0_117_12[arg_376_3] = 1
			end

			local var_376_10 = arg_376_2["body_yaw_delay_seq_s" .. slot_0_117_12[arg_376_3]]
			local var_376_11 = var_376_10 and var_376_10:get() or 4

			if var_376_11 == 0 then
				if arg_376_0.choked_commands == 0 then
					slot_0_118_11[arg_376_3] = not slot_0_118_11[arg_376_3]

					if slot_0_119_10[arg_376_3] then
						slot_0_117_12[arg_376_3] = slot_0_117_12[arg_376_3] + 1

						if var_376_9 < slot_0_117_12[arg_376_3] then
							slot_0_117_12[arg_376_3] = 1
						end

						slot_0_119_10[arg_376_3] = false
					else
						slot_0_119_10[arg_376_3] = true
					end
				end

				slot_0_116_12[arg_376_3] = 0
			else
				slot_0_116_12[arg_376_3] = slot_0_116_12[arg_376_3] - 1

				if slot_0_116_12[arg_376_3] <= 0 then
					slot_0_116_12[arg_376_3] = var_376_11 + 2
					slot_0_118_11[arg_376_3] = not slot_0_118_11[arg_376_3]

					if slot_0_119_10[arg_376_3] then
						slot_0_117_12[arg_376_3] = slot_0_117_12[arg_376_3] + 1

						if var_376_9 < slot_0_117_12[arg_376_3] then
							slot_0_117_12[arg_376_3] = 1
						end

						slot_0_119_10[arg_376_3] = false
					else
						slot_0_119_10[arg_376_3] = true
					end
				end
			end

			if arg_376_0.choked_commands == 0 then
				slot_0_95_4 = slot_0_118_11[arg_376_3]
			end

			var_376_2 = slot_0_95_4
		end

		local var_376_12 = arg_376_2.left_limit and arg_376_2.left_limit:get() or 60
		local var_376_13 = arg_376_2.right_limit and arg_376_2.right_limit:get() or 60

		var_376_3 = var_376_2 and var_376_12 or var_376_13
		arg_376_1.inverter = var_376_2
	else
		var_376_2 = rage.antiaim:inverter()
		var_376_3 = arg_376_2.fake_limit and arg_376_2.fake_limit:get() or 60
		arg_376_1.inverter = false
	end

	arg_376_1._lr_side = var_376_2

	if arg_376_1._lr_left ~= nil and arg_376_1._lr_right ~= nil then
		arg_376_1.yaw_offset = var_376_2 and arg_376_1._lr_left or arg_376_1._lr_right
	end

	arg_376_1.left_limit = var_376_3
	arg_376_1.right_limit = var_376_3
	arg_376_1.body_yaw_options = {}

	if arg_376_2.freestand_peek then
		arg_376_1.freestand_peek = arg_376_2.freestand_peek:get()
	end
end

function slot_0_89_0.update_modifier(arg_377_0, arg_377_1, arg_377_2, arg_377_3)
	slot_377_4_0 = arg_377_2.modifier:get()
	slot_377_5_0 = arg_377_2.modifier_mode:get()
	slot_377_6_0 = arg_377_2.randomize:get()
	slot_377_7_0 = arg_377_2.modifier_offset:get()
	slot_377_8_0 = arg_377_2.modifier_custom_sliders:get()
	slot_377_9_0 = math.max(arg_377_2["modifier_sliders_" .. (slot_0_106_12[arg_377_3] or 1)]:get() or 1, 1)

	if not slot_377_6_0 then
		if slot_377_4_0 == "center" then
			arg_377_1.yaw_modifier = "Center"
			arg_377_1.modifier_offset = slot_377_7_0

			return
		elseif slot_377_4_0 == "offset" then
			arg_377_1.yaw_modifier = "Offset"
			arg_377_1.modifier_offset = slot_377_7_0

			return
		elseif slot_377_4_0 == "random" then
			arg_377_1.yaw_modifier = "Random"
			arg_377_1.modifier_offset = slot_377_7_0

			return
		elseif slot_377_4_0 == "spin" then
			arg_377_1.yaw_modifier = "Spin"
			arg_377_1.modifier_offset = slot_377_7_0

			return
		elseif slot_377_4_0 == "skitter" then
			if arg_377_0.choked_commands == 0 then
				slot_0_109_13[arg_377_3] = (slot_0_109_13[arg_377_3] + 1) % 65535
			end

			slot_377_10_3 = {
				-1,
				1,
				0,
				-1,
				1,
				0,
				-1,
				0,
				1,
				-1,
				0,
				1
			}
			slot_377_11_7 = arg_377_2.skitter_deg and arg_377_2.skitter_deg:get() or 45
			slot_377_13_4 = slot_377_10_3[slot_0_109_13[arg_377_3] % #slot_377_10_3 + 1]
			arg_377_1.yaw_offset = (arg_377_1.yaw_offset or 0) + slot_377_11_7 * slot_377_13_4
			arg_377_1.yaw_modifier = "Disabled"
			arg_377_1.modifier_offset = 0

			return
		end
	end

	if slot_377_4_0 == "skitter" then
		if arg_377_0.choked_commands == 0 then
			slot_0_109_13[arg_377_3] = (slot_0_109_13[arg_377_3] + 1) % 65535
		end

		slot_377_10_2 = {
			-1,
			1,
			0,
			-1,
			1,
			0,
			-1,
			0,
			1,
			-1,
			0,
			1
		}
		slot_377_11_6 = arg_377_2.skitter_deg and arg_377_2.skitter_deg:get() or 45
		slot_377_13_3 = slot_377_10_2[slot_0_109_13[arg_377_3] % #slot_377_10_2 + 1]
		arg_377_1.yaw_offset = (arg_377_1.yaw_offset or 0) + slot_377_11_6 * slot_377_13_3
		arg_377_1.yaw_modifier = "Disabled"
		arg_377_1.modifier_offset = 0

		return
	end

	if arg_377_0.choked_commands == 0 then
		slot_0_105_11[arg_377_3] = (slot_0_105_11[arg_377_3] or 1) + 1

		if slot_0_105_11[arg_377_3] >= 7 then
			slot_0_105_11[arg_377_3] = 1
		end

		slot_0_108_12[arg_377_3] = (slot_0_108_12[arg_377_3] or 0) + 1

		if slot_377_4_0 == "dual" then
			slot_377_10_1 = arg_377_2.dual_distribution and arg_377_2.dual_distribution:get() or "alternate"
			slot_377_11_5 = arg_377_2.dual_rate and arg_377_2.dual_rate:get() or 2
			slot_377_12_3 = arg_377_2.dual_rate_b and arg_377_2.dual_rate_b:get() or 4

			if slot_377_10_1 == "random" then
				slot_0_110_14[arg_377_3] = math.random(0, 1)
			elseif slot_377_10_1 == "pulse" then
				if (slot_0_110_14[arg_377_3] or 0) == 0 then
					slot_0_111_20[arg_377_3] = (slot_0_111_20[arg_377_3] or 0) + 1

					if slot_377_11_5 <= slot_0_111_20[arg_377_3] then
						slot_0_111_20[arg_377_3] = 0
						slot_0_110_14[arg_377_3] = 1
					end
				else
					slot_0_112_19[arg_377_3] = (slot_0_112_19[arg_377_3] or 0) + 1

					if slot_377_12_3 <= slot_0_112_19[arg_377_3] then
						slot_0_112_19[arg_377_3] = 0
						slot_0_110_14[arg_377_3] = 0
					end
				end
			else
				slot_0_111_20[arg_377_3] = (slot_0_111_20[arg_377_3] or 0) + 1

				if slot_377_11_5 <= slot_0_111_20[arg_377_3] then
					slot_0_111_20[arg_377_3] = 0
					slot_0_110_14[arg_377_3] = slot_0_110_14[arg_377_3] == 0 and 1 or 0
				end
			end
		end
	end

	function slot_377_10_0(arg_378_0)
		local var_378_0 = slot_0_110_14[arg_377_3] or 0
		local var_378_1 = arg_377_2.dual_left_off and arg_377_2.dual_left_off:get() or -60
		local var_378_2 = arg_377_2.dual_right_off and arg_377_2.dual_right_off:get() or 60

		return (var_378_0 == 0 and var_378_1 or var_378_2) + (arg_378_0 or 0)
	end

	if slot_377_6_0 then
		if slot_377_5_0 == "uniform" then
			slot_377_11_4 = math.random(arg_377_2.min:get(), arg_377_2.max:get())
			arg_377_1.modifier_offset = slot_377_4_0 == "chaos" and slot_0_89_0.get_exploit_values(slot_377_11_4, slot_0_105_11[arg_377_3]) or slot_377_4_0 == "dual" and slot_377_10_0(slot_377_11_4) or slot_377_11_4
		elseif slot_377_5_0 == "weighted" then
			slot_377_11_3 = arg_377_2.modifier_weight_center and arg_377_2.modifier_weight_center:get() or 50
			slot_377_12_2 = arg_377_2.modifier_weight_spread and arg_377_2.modifier_weight_spread:get() or 60
			slot_377_13_2 = slot_377_11_3 / 100 * 2 - 1
			slot_377_15_2 = slot_377_13_2 + (math.random() - 0.5) * (1 - math.abs(slot_377_13_2) * 0.5) * 2
			slot_377_15_1 = math.max(-1, math.min(1, slot_377_15_2))
			slot_377_16_0 = math.floor(slot_377_15_1 * slot_377_12_2)
			arg_377_1.modifier_offset = slot_377_4_0 == "chaos" and slot_0_89_0.get_exploit_values(slot_377_16_0, slot_0_105_11[arg_377_3]) or slot_377_4_0 == "dual" and slot_377_10_0(slot_377_16_0) or slot_377_16_0
		elseif slot_377_5_0 == "pulse" then
			slot_377_11_2 = arg_377_2.modifier_pulse_a and arg_377_2.modifier_pulse_a:get() or -60
			slot_377_12_1 = arg_377_2.modifier_pulse_b and arg_377_2.modifier_pulse_b:get() or 60
			slot_377_13_1 = arg_377_2.modifier_pulse_rate and arg_377_2.modifier_pulse_rate:get() or 8
			slot_377_15_0 = slot_377_13_1 > slot_0_108_12[arg_377_3] % (slot_377_13_1 * 2) and slot_377_11_2 or slot_377_12_1
			arg_377_1.modifier_offset = slot_377_4_0 == "chaos" and slot_0_89_0.get_exploit_values(slot_377_15_0, slot_0_105_11[arg_377_3]) or slot_377_4_0 == "dual" and slot_377_10_0(slot_377_15_0) or slot_377_15_0
		elseif slot_377_5_0 == "custom" then
			if arg_377_0.choked_commands == 0 then
				slot_0_107_11[arg_377_3] = slot_0_107_11[arg_377_3] + 1

				if slot_377_9_0 <= slot_0_107_11[arg_377_3] then
					slot_0_107_11[arg_377_3] = 0
					slot_0_106_12[arg_377_3] = slot_0_106_12[arg_377_3] + 1

					if slot_377_8_0 < slot_0_106_12[arg_377_3] then
						slot_0_106_12[arg_377_3] = 1
					end
				end
			end

			slot_377_11_1 = arg_377_2["modifier_sliders_" .. slot_0_106_12[arg_377_3]]:get()
			arg_377_1.modifier_offset = slot_377_4_0 == "chaos" and slot_0_89_0.get_exploit_values(slot_377_11_1, slot_0_105_11[arg_377_3]) or slot_377_4_0 == "dual" and slot_377_10_0(slot_377_11_1) or slot_377_11_1
		end
	elseif slot_377_4_0 == "dual" then
		slot_377_11_0 = slot_0_110_14[arg_377_3] or 0
		slot_377_12_0 = arg_377_2.dual_left_off and arg_377_2.dual_left_off:get() or -60
		slot_377_13_0 = arg_377_2.dual_right_off and arg_377_2.dual_right_off:get() or 60
		arg_377_1.modifier_offset = slot_377_11_0 == 0 and slot_377_12_0 or slot_377_13_0
	elseif slot_377_4_0 == "chaos" then
		arg_377_1.modifier_offset = slot_0_89_0.get_exploit_values(slot_377_7_0, slot_0_105_11[arg_377_3])
	else
		arg_377_1.modifier_offset = slot_377_7_0
	end

	if slot_377_4_0 == "chaos" then
		arg_377_1.yaw_modifier = "3-Way"
	elseif slot_377_4_0 == "dual" then
		arg_377_1.yaw_modifier = "3-Way"
	elseif slot_377_4_0 == "3-way" then
		arg_377_1.yaw_modifier = "3-Way"
	elseif slot_377_4_0 == "5-way" then
		arg_377_1.yaw_modifier = "5-Way"
	elseif slot_377_4_0 == "center" then
		arg_377_1.yaw_modifier = "Center"
	elseif slot_377_4_0 == "offset" then
		arg_377_1.yaw_modifier = "Offset"
	elseif slot_377_4_0 == "random" then
		arg_377_1.yaw_modifier = "Random"
	elseif slot_377_4_0 == "spin" then
		arg_377_1.yaw_modifier = "Spin"
	else
		arg_377_1.yaw_modifier = "Disabled"
	end
end

function slot_0_141_1(arg_379_0, arg_379_1)
	slot_0_134_2 = slot_0_138_1()
	slot_0_135_2 = arg_379_0
	slot_0_136_2 = arg_379_1
	slot_0_131_2 = arg_379_0
	slot_0_132_2 = 0
	slot_0_133_2 = 0

	local var_379_0 = entity.get_local_player()

	if var_379_0 and var_379_0:is_alive() then
		local var_379_1 = var_379_0:get_origin()
		local var_379_2 = 0

		pcall(function()
			local var_380_0 = rage.antiaim:get_target()

			if var_380_0 then
				var_379_2 = var_380_0 * math.pi / 180
			end
		end)

		slot_0_85_0.fired = true
		slot_0_85_0.ox = var_379_1.x
		slot_0_85_0.oy = var_379_1.y
		slot_0_85_0.oz = var_379_1.z
		slot_0_85_0.yaw = var_379_2
	end
end

slot_0_142_0 = 0
slot_0_143_0 = 0
slot_0_144_0 = 1
slot_0_145_0 = true

function slot_0_146_0(arg_381_0)
	slot_381_1_0 = slot_0_59_0.antiaim.general.reset_aa_trace

	if not slot_381_1_0 or not slot_381_1_0.twist:get() then
		slot_0_131_2 = 0
		slot_0_142_0 = 0

		return
	end

	if slot_0_76_0.is_active then
		slot_0_131_2 = 0
		slot_0_142_0 = 0

		return
	end

	if slot_0_75_0.is_working then
		slot_0_131_2 = 0
		slot_0_142_0 = 0

		return
	end

	slot_381_2_0, slot_381_3_0 = pcall(function()
		return slot_0_73_0.think(entity.get_local_player())
	end)

	if slot_381_2_0 and slot_381_3_0 then
		slot_0_131_2 = 0
		slot_0_142_0 = 0

		return
	end

	if slot_0_71_0.think() then
		slot_0_131_2 = 0
		slot_0_142_0 = 0

		return
	end

	if slot_0_72_0.think() then
		slot_0_131_2 = 0
		slot_0_142_0 = 0

		return
	end

	slot_381_4_0 = entity.get_local_player()

	if slot_381_4_0 and slot_381_4_0:is_alive() then
		slot_381_5_2, slot_381_6_2 = pcall(function()
			return slot_381_4_0:get_anim_state()
		end)

		if slot_381_5_2 and slot_381_6_2 then
			slot_381_7_2 = slot_381_6_2.on_ground

			if slot_381_7_2 and not slot_0_145_0 and slot_0_142_0 <= 0 and slot_0_131_2 <= 0 then
				slot_0_144_0 = slot_0_138_1()
				slot_0_142_0 = 18
				slot_0_143_0 = 0
				slot_381_9_3 = slot_381_4_0:get_origin()
				slot_381_10_1 = 0

				pcall(function()
					local var_384_0 = rage.antiaim:get_target()

					if var_384_0 then
						slot_381_10_1 = var_384_0 * math.pi / 180
					end
				end)

				slot_0_85_0.fired = true
				slot_0_85_0.ox = slot_381_9_3.x
				slot_0_85_0.oy = slot_381_9_3.y
				slot_0_85_0.oz = slot_381_9_3.z
				slot_0_85_0.yaw = slot_381_10_1
			end

			slot_0_145_0 = slot_381_7_2
		end
	end

	if slot_0_137_1 == 0 then
		slot_0_137_1 = globals.realtime + 2 + math.random() * 2
	end

	if globals.realtime >= slot_0_137_1 and slot_0_131_2 <= 0 and slot_0_142_0 <= 0 then
		slot_0_141_1(22, 52)

		slot_0_137_1 = globals.realtime + 2 + math.random() * 2
	end

	if slot_0_142_0 > 0 then
		slot_0_143_0 = slot_0_143_0 + 1
		slot_0_142_0 = slot_0_142_0 - 1
		slot_381_5_1 = slot_0_143_0 / 18
		slot_381_6_1 = slot_381_5_1 * slot_381_5_1 * (3 - 2 * slot_381_5_1)
		slot_381_7_1 = math.sin(slot_381_6_1 * math.pi)
		slot_381_8_1 = math.sin(slot_381_5_1 * math.pi * 1.2)
		slot_381_9_2 = slot_0_144_0 * slot_381_7_1 * slot_381_8_1 * 32

		slot_0_11_0.antiaim.angles.hidden:override(true)
		rage.antiaim:override_hidden_pitch(89)
		rage.antiaim:override_hidden_yaw_offset(slot_381_9_2)

		if slot_0_142_0 == 0 then
			if not slot_0_76_0.def_ind_latch.is_working then
				slot_0_11_0.antiaim.angles.hidden:override()
			end

			rage.antiaim:override_hidden_pitch(0)
			rage.antiaim:override_hidden_yaw_offset(0)
		end

		return
	end

	if slot_0_131_2 <= 0 then
		return
	end

	slot_381_5_0 = slot_0_135_2
	slot_381_6_0 = slot_0_136_2
	slot_0_133_2 = slot_0_133_2 + 1
	slot_0_131_2 = slot_0_131_2 - 1
	slot_381_7_0 = slot_0_133_2 / math.max(1, slot_381_5_0)
	slot_381_8_0 = math.max(0, math.min(1, slot_381_7_0))
	slot_381_9_1 = slot_381_8_0 * slot_381_8_0 * slot_381_8_0 * (slot_381_8_0 * (slot_381_8_0 * 6 - 15) + 10)
	slot_381_9_0 = math.sin(slot_381_9_1 * math.pi)
	slot_381_10_0 = 0.9
	slot_381_11_0 = math.sin(slot_381_7_0 * math.pi * slot_381_10_0 * 2)
	slot_381_12_0 = slot_0_134_2 * slot_381_9_0 * slot_381_11_0 * slot_381_6_0

	slot_0_11_0.antiaim.angles.hidden:override(true)
	rage.antiaim:override_hidden_pitch(89)
	rage.antiaim:override_hidden_yaw_offset(slot_381_12_0)

	if slot_0_131_2 == 0 then
		if not slot_0_76_0.def_ind_latch.is_working then
			slot_0_11_0.antiaim.angles.hidden:override()
		end

		rage.antiaim:override_hidden_pitch(0)
		rage.antiaim:override_hidden_yaw_offset(0)
	end
end

function slot_0_147_0(arg_385_0)
	local var_385_0 = entity.get_local_player()

	if not var_385_0 or not var_385_0:is_alive() then
		return
	end

	local var_385_1 = var_385_0.m_vecVelocity and var_385_0.m_vecVelocity:length2d() or 0
	local var_385_2 = false
	local var_385_3 = false

	pcall(function()
		var_385_2 = slot_0_11_0.rage.main.double_tap:get()
	end)
	pcall(function()
		var_385_3 = slot_0_11_0.rage.main.hide_shots:get()
	end)

	local var_385_4 = slot_0_76_0 and slot_0_76_0.get_debug_state and slot_0_76_0.get_debug_state() or {}

	if (var_385_2 or var_385_3 or var_385_1 < 1.11) and not var_385_4.defensive and not slot_0_76_0.is_active then
		slot_0_11_0.antiaim.fake_lag.enabled_pui:override(false)
	else
		slot_0_11_0.antiaim.fake_lag.enabled_pui:override()
	end

	pcall(function()
		if slot_0_11_0.antiaim.fake_lag.limit_pui:get() < 14 then
			slot_0_11_0.antiaim.fake_lag.limit_pui:set(14)
		end
	end)
end

function slot_0_89_0.update(arg_389_0, arg_389_1, arg_389_2)
	slot_0_147_0(arg_389_0)
	slot_0_90_1:define()
	pcall(function()
		slot_0_11_0.antiaim.angles.hidden:override(false)
	end)

	slot_0_73_0.active = false

	slot_0_77_0.handle_normal(arg_389_0, slot_0_90_1)

	slot_389_3_0 = slot_0_89_0.get_preset(arg_389_1)

	if slot_389_3_0 == nil then
		return
	end

	if not slot_389_3_0.allow_state:get() then
		slot_0_90_1:run()
		slot_0_146_0(arg_389_0)

		return
	end

	slot_0_90_1.avoid_backstab = slot_0_59_0.antiaim.general.avoid_backstab.switch:get()

	slot_0_120_10(arg_389_1)

	if arg_389_0.choked_commands == 0 then
		slot_0_96_5 = not slot_0_96_5
	end

	slot_0_89_0.update_yaw(arg_389_0, slot_0_90_1, slot_389_3_0, arg_389_1)

	if not slot_0_73_0.think(arg_389_0) then
		slot_0_89_0.update_body_yaw(arg_389_0, slot_0_90_1, slot_389_3_0, arg_389_1)
	end

	slot_0_89_0.update_modifier(arg_389_0, slot_0_90_1, slot_389_3_0, arg_389_1)
	slot_0_77_0.update(arg_389_0, slot_0_90_1, slot_389_3_0)

	slot_389_5_0 = slot_0_75_0.think(arg_389_0)
	slot_0_75_0.is_working = slot_389_5_0

	if slot_389_5_0 then
		slot_0_75_0.update(arg_389_0, slot_0_90_1, slot_389_3_0)
		slot_0_76_0.update(arg_389_0, slot_0_90_1, arg_389_1, false)
		slot_0_90_1:run()
		slot_0_146_0(arg_389_0)

		return
	end

	slot_389_6_0 = slot_0_73_0.update(arg_389_0, slot_0_90_1, slot_389_3_0)

	if not slot_389_6_0 then
		slot_0_82_0.update(arg_389_0, slot_0_90_1, arg_389_1, slot_389_3_0)
	end

	slot_389_7_0 = slot_0_71_0.think()
	slot_389_8_0 = slot_0_72_0.think()

	slot_0_72_0.get_side(arg_389_0)

	if slot_389_6_0 and not slot_389_8_0 then
		-- block empty
	elseif slot_389_7_0 then
		slot_0_71_0.update(arg_389_0, slot_0_90_1, slot_389_3_0)
	elseif slot_389_8_0 then
		slot_0_72_0.update(arg_389_0, slot_0_90_1, slot_389_3_0)
	else
		slot_0_71_0.update(arg_389_0, slot_0_90_1, slot_389_3_0)
	end

	slot_389_9_0, slot_389_10_0 = slot_0_76_0.update(arg_389_0, slot_0_90_1, arg_389_1, slot_389_6_0)
	slot_389_11_0, slot_389_12_0, slot_389_13_0, slot_389_14_0 = slot_0_84_0.think(arg_389_1)

	if slot_389_11_0 and not slot_389_6_0 then
		slot_0_84_0.apply(arg_389_0, slot_0_90_1, slot_389_12_0, slot_389_13_0, slot_389_14_0)
	else
		slot_0_84_0.active = false

		slot_0_84_0.reset_snap()
	end

	slot_0_90_1:run()
	slot_0_146_0(arg_389_0)

	slot_389_15_0 = slot_0_59_0.antiaim.general.freestanding

	if slot_389_15_0 and slot_389_15_0.static and slot_389_15_0.static:get() and slot_389_8_0 then
		slot_389_16_0 = rage.antiaim:get_target()
		slot_389_17_0 = rage.antiaim:get_target(true)

		if slot_389_16_0 and slot_389_17_0 and math.fmod(math.abs(slot_389_16_0 - slot_389_17_0), 360) > 5 then
			slot_0_11_0.antiaim.angles.body_yaw:override(false)
		end
	end
end

events.createmove(function(arg_391_0)
	local var_391_0 = entity.get_local_player()
	local var_391_1 = slot_0_75_0.think(arg_391_0)

	slot_0_89_0.update(arg_391_0, slot_0_70_0.get(var_391_1), var_391_0)
end)
events.round_start(function()
	slot_0_128_7 = 0
	slot_0_129_5 = 0
	slot_0_130_3 = 0
	slot_0_137_1 = 0
	slot_0_131_2 = 0
	slot_0_142_0 = 0
	slot_0_143_0 = 0
	slot_0_144_0 = 1
	slot_0_145_0 = true
	slot_0_123_7 = 0
	ds_flip_at = 0
	ds_base_side = false
	ds_ghost_on = false
	slot_0_125_6 = 0
	ds_flip_done = false
	slot_0_132_2 = 0
	slot_0_133_2 = 0
	slot_0_134_2 = 1
	slot_0_135_2 = 8
	slot_0_136_2 = 58
	slot_0_94_3 = false
	slot_0_92_2 = 0
	slot_0_93_3 = 0
	jitter_tick = 0
end)
events.player_death(function(arg_393_0)
	local var_393_0 = entity.get_local_player()

	if not var_393_0 then
		return
	end

	if entity.get(arg_393_0.userid, true) == var_393_0 then
		slot_0_128_7 = 0
		slot_0_129_5 = 0
		slot_0_130_3 = 0
		slot_0_137_1 = 0
		slot_0_131_2 = 0
		slot_0_123_7 = 0
		ds_flip_at = 0
		ds_base_side = false
		ds_ghost_on = false
		slot_0_125_6 = 0
		ds_flip_done = false
		slot_0_132_2 = 0
		slot_0_133_2 = 0
		slot_0_134_2 = 1
		slot_0_135_2 = 8
		slot_0_136_2 = 58
		slot_0_94_3 = false
		slot_0_92_2 = 0
		slot_0_93_3 = 0
		jitter_tick = 0
	end
end)

slot_0_90_0 = nil

events.createmove_run(function(arg_394_0)
	if not slot_0_59_0.misc.aimbot.fakeduck.unlock:get() then
		return
	end

	if not slot_0_11_0.antiaim.misc.fake_duck:get() then
		return
	end

	local var_394_0 = arg_394_0.forwardmove
	local var_394_1 = arg_394_0.sidemove

	if math.abs(var_394_0) > 5 or math.abs(var_394_1) > 5 then
		local var_394_2 = 450 / (var_394_0 * var_394_0 + var_394_1 * var_394_1)^0.5

		arg_394_0.forwardmove = var_394_0 * var_394_2
		arg_394_0.sidemove = var_394_1 * var_394_2
	end
end)

slot_0_91_0 = nil
slot_0_92_1 = utils.opcode_scan("engine.dll", "FF E1")
slot_0_93_2 = utils.opcode_scan("engine.dll", "FF 15 ? ? ? ? A3 ? ? ? ? EB 05")
slot_0_94_2 = utils.opcode_scan("engine.dll", "FF 15 ? ? ? ? 85 C0 74 0B")

if slot_0_92_1 and slot_0_93_2 and slot_0_94_2 then
	slot_0_95_3 = ffi.cast("uint32_t(__fastcall*)(unsigned int,unsigned int,const char*)", slot_0_92_1)
	slot_0_96_4 = ffi.cast("uint32_t(__fastcall*)(unsigned int,unsigned int,uint32_t,const char*)", slot_0_92_1)
	slot_0_97_5 = ffi.cast("uint32_t**", ffi.cast("uint32_t", slot_0_93_2) + 2)[0][0]
	slot_0_98_4 = ffi.cast("uint32_t**", ffi.cast("uint32_t", slot_0_94_2) + 2)[0][0]
	slot_0_100_7 = (function(arg_395_0, arg_395_1, arg_395_2)
		local var_395_0 = ffi.typeof(arg_395_2)

		return function(...)
			return ffi.cast(var_395_0, slot_0_92_1)(slot_0_96_4(slot_0_97_5, 0, slot_0_95_3(slot_0_98_4, 0, arg_395_0), arg_395_1), 0, ...)
		end
	end)("user32.dll", "EnumDisplaySettingsA", "int(__fastcall*)(unsigned int,unsigned int,unsigned int,unsigned long,void*)")
	slot_0_101_8 = ffi.new("struct { char pad_0[120]; unsigned long dmDisplayFrequency; char pad_2[32]; }[1]")

	slot_0_100_7(0, 4294967295, slot_0_101_8[0])
end

slot_0_92_0 = nil
slot_0_93_1 = {
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

function slot_0_94_1(arg_397_0, arg_397_1)
	return "\a" .. arg_397_1 .. arg_397_0 .. "\aDEFAULT"
end

slot_0_95_2 = {}
slot_0_96_3 = 4.5
slot_0_97_4 = 6
slot_0_98_3 = 6
slot_0_99_5 = 16
slot_0_100_6 = 14

function slot_0_101_7(arg_398_0, arg_398_1)
	if #slot_0_95_2 >= slot_0_100_6 then
		table.remove(slot_0_95_2, 1)
	end

	table.insert(slot_0_95_2, {
		parts = arg_398_0,
		born = globals.realtime,
		dur = arg_398_1 or slot_0_96_3
	})
end

slot_0_26_0 = slot_0_101_7

events.render(function()
	local var_399_0 = slot_0_59_0.info and slot_0_59_0.info.notify

	if not var_399_0 or not var_399_0.log_enabled:get() then
		return
	end

	local var_399_1, var_399_2 = pcall(function()
		return var_399_0.log_mode:get()
	end)

	if not var_399_1 or var_399_2 ~= "text" then
		return
	end

	local var_399_3 = globals.realtime
	local var_399_4 = 1
	local var_399_5 = slot_0_98_3
	local var_399_6 = 1

	while var_399_6 <= #slot_0_95_2 do
		local var_399_7 = slot_0_95_2[var_399_6]
		local var_399_8 = var_399_3 - var_399_7.born

		if var_399_8 > var_399_7.dur then
			table.remove(slot_0_95_2, var_399_6)
		else
			local var_399_9 = 1
			local var_399_10 = var_399_7.dur - 0.8

			if var_399_10 < var_399_8 then
				var_399_9 = math.max(0, 1 - (var_399_8 - var_399_10) / 0.8)
			end

			local var_399_11 = slot_0_97_4

			for iter_399_0, iter_399_1 in ipairs(var_399_7.parts) do
				local var_399_12 = iter_399_1[1]
				local var_399_13 = tostring(iter_399_1[2])
				local var_399_14 = color(var_399_12.r, var_399_12.g, var_399_12.b, math.floor(var_399_12.a * var_399_9))

				render.text(var_399_4, vector(var_399_11, var_399_5), var_399_14, nil, var_399_13)

				var_399_11 = var_399_11 + render.measure_text(var_399_4, nil, var_399_13).x
			end

			var_399_5 = var_399_5 + slot_0_99_5
			var_399_6 = var_399_6 + 1
		end
	end
end)
events.aim_ack(function(arg_401_0)
	slot_401_1_0 = slot_0_59_0.info.notify

	if not slot_401_1_0.log_enabled:get() then
		return
	end

	slot_401_2_0 = entity.get_local_player()

	if slot_401_2_0 == nil or not slot_401_2_0:is_alive() then
		return
	end

	slot_401_3_0 = arg_401_0.target

	if slot_401_3_0 == nil then
		return
	end

	slot_401_4_0, slot_401_5_0 = pcall(function()
		return slot_401_1_0.log_mode:get()
	end)
	slot_401_6_0 = slot_401_4_0 and slot_401_5_0 == "text"
	slot_401_7_0 = color(180, 180, 185, 255)

	if arg_401_0.state == nil then
		if not slot_401_1_0.log_hits:get() then
			return
		end

		slot_401_8_1 = slot_0_93_1[arg_401_0.hitgroup] or "generic"
		slot_401_9_1 = slot_0_93_1[arg_401_0.wanted_hitgroup] or "generic"
		slot_401_10_1 = arg_401_0.hitgroup == arg_401_0.wanted_hitgroup
		slot_401_11_1 = arg_401_0.damage == arg_401_0.wanted_damage
		slot_401_12_1, slot_401_13_1 = pcall(function()
			return slot_401_1_0.col_mismatch:get()
		end)

		if not slot_401_12_1 then
			slot_401_13_1 = color(255, 159, 94, 255)
		end

		slot_401_14_1 = (not slot_401_10_1 or not slot_401_11_1) and slot_401_13_1 or slot_401_1_0.col_hit:get()
		slot_401_15_1 = math.floor(arg_401_0.backtrack * globals.tickinterval * 1000 + 0.5)

		if slot_401_6_0 then
			slot_401_16_1 = {
				{
					slot_401_14_1,
					slot_0_0_0
				},
				{
					slot_401_7_0,
					" · hit "
				},
				{
					slot_401_14_1,
					string.lower(slot_401_3_0:get_name())
				},
				{
					slot_401_7_0,
					"'s "
				},
				{
					slot_401_14_1,
					slot_401_8_1
				},
				{
					slot_401_7_0,
					" for "
				},
				{
					slot_401_14_1,
					tostring(arg_401_0.damage)
				},
				{
					slot_401_7_0,
					" damage ( hc ~ "
				},
				{
					slot_401_14_1,
					tostring(arg_401_0.hitchance) .. "%"
				},
				{
					slot_401_7_0,
					" / bt ~ "
				},
				{
					slot_401_14_1,
					tostring(arg_401_0.backtrack) .. "ticks"
				}
			}

			if not slot_401_10_1 then
				table.insert(slot_401_16_1, {
					slot_401_7_0,
					" / mismatched hg ~ "
				})
				table.insert(slot_401_16_1, {
					slot_401_13_1,
					slot_401_8_1 .. "(" .. slot_401_9_1 .. ")"
				})
			end

			if not slot_401_11_1 then
				table.insert(slot_401_16_1, {
					slot_401_7_0,
					" / mismatched dmg ~ "
				})
				table.insert(slot_401_16_1, {
					slot_401_13_1,
					tostring(arg_401_0.damage) .. "(" .. tostring(arg_401_0.wanted_damage) .. ")"
				})
			end

			table.insert(slot_401_16_1, {
				slot_401_7_0,
				" )"
			})
			slot_0_101_7(slot_401_16_1)
		else
			slot_0_64_0.new({
				"hit ",
				string.lower(slot_401_3_0:get_name()),
				"'s ",
				slot_401_8_1,
				" for ",
				arg_401_0.damage,
				" dmg"
			}, slot_401_14_1)
		end

		if slot_401_1_0.log_console:get() then
			slot_401_16_0 = slot_0_94_1(slot_0_0_0, ui.get_style()["Link Active"]:to_hex())
			slot_401_17_4 = slot_0_94_1(string.lower(slot_401_3_0:get_name()), slot_401_14_1:to_hex())
			slot_401_18_3 = slot_401_10_1 and "" or " / mismatched hg ~ " .. slot_401_8_1 .. "(" .. slot_401_9_1 .. ")"
			slot_401_19_1 = slot_401_11_1 and "" or " / mismatched dmg ~ " .. tostring(arg_401_0.damage) .. "(" .. tostring(arg_401_0.wanted_damage) .. ")"

			print_raw(("%s · hit %s's %s for %s damage ( hc ~ %s%% / bt ~ %sticks%s%s )"):format(slot_401_16_0, slot_401_17_4, slot_401_8_1, tostring(arg_401_0.damage), tostring(arg_401_0.hitchance), tostring(arg_401_0.backtrack), slot_401_18_3, slot_401_19_1))
		end
	else
		if not slot_401_1_0.log_misses:get() then
			return
		end

		slot_401_8_0 = slot_401_1_0.col_miss:get()
		slot_401_9_0, slot_401_10_0 = pcall(function()
			return slot_401_1_0.col_miss_mismatch:get()
		end)

		if not slot_401_9_0 then
			slot_401_10_0 = color(255, 159, 94, 255)
		end

		slot_401_11_0 = slot_0_93_1[arg_401_0.wanted_hitgroup] or "generic"
		slot_401_12_0 = slot_0_93_1[arg_401_0.hitgroup] or nil
		slot_401_13_0 = slot_401_12_0 == nil or arg_401_0.hitgroup == arg_401_0.wanted_hitgroup
		slot_401_14_0 = not slot_401_13_0 and slot_401_10_0 or slot_401_8_0
		slot_401_15_0 = string.lower(slot_401_3_0:get_name())

		if arg_401_0.state == "player death" or arg_401_0.state == "death" then
			if slot_401_6_0 then
				slot_401_17_3 = {
					{
						slot_401_14_0,
						slot_0_0_0
					},
					{
						slot_401_7_0,
						" · missed "
					},
					{
						slot_401_14_0,
						slot_401_15_0
					},
					{
						slot_401_7_0,
						"'s "
					},
					{
						slot_401_14_0,
						slot_401_11_0
					},
					{
						slot_401_7_0,
						" ( missed due to death )"
					}
				}

				slot_0_101_7(slot_401_17_3)
			else
				slot_0_64_0.new({
					"missed ",
					slot_401_15_0,
					"'s ",
					slot_401_11_0,
					" — died"
				}, slot_401_8_0)
			end

			if slot_401_1_0.log_console:get() then
				slot_401_17_2 = slot_0_94_1(slot_0_0_0, ui.get_style()["Link Active"]:to_hex())
				slot_401_18_2 = slot_0_94_1(slot_401_15_0, slot_401_8_0:to_hex())

				print_raw(("%s · missed %s's %s ( missed due to death )"):format(slot_401_17_2, slot_401_18_2, slot_401_11_0))
			end

			return
		end

		if slot_401_6_0 then
			slot_401_17_1 = math.floor((arg_401_0.backtrack or 0) * globals.tickinterval * 1000 + 0.5)
			slot_401_18_1 = {
				{
					slot_401_14_0,
					slot_0_0_0
				},
				{
					slot_401_7_0,
					" · missed "
				},
				{
					slot_401_14_0,
					slot_401_15_0
				},
				{
					slot_401_7_0,
					"'s "
				},
				{
					slot_401_14_0,
					slot_401_11_0
				},
				{
					slot_401_7_0,
					" due to "
				},
				{
					slot_401_14_0,
					tostring(arg_401_0.state)
				},
				{
					slot_401_7_0,
					" ( hc ~ "
				},
				{
					slot_401_14_0,
					tostring(arg_401_0.hitchance) .. "%"
				},
				{
					slot_401_7_0,
					" / dmg ~ "
				},
				{
					slot_401_14_0,
					tostring(arg_401_0.wanted_damage)
				},
				{
					slot_401_7_0,
					" / bt ~ "
				},
				{
					slot_401_14_0,
					tostring(arg_401_0.backtrack or 0) .. "ticks"
				}
			}

			if not slot_401_13_0 then
				table.insert(slot_401_18_1, {
					slot_401_7_0,
					" / mismatched hg ~ "
				})
				table.insert(slot_401_18_1, {
					slot_401_10_0,
					slot_401_11_0 .. "(" .. slot_401_12_0 .. ")"
				})
			end

			table.insert(slot_401_18_1, {
				slot_401_7_0,
				" )"
			})
			slot_0_101_7(slot_401_18_1)
		else
			slot_0_64_0.new({
				"missed ",
				slot_401_15_0,
				" in ",
				slot_401_11_0,
				" — ",
				arg_401_0.state
			}, slot_401_8_0)
		end

		if slot_401_1_0.log_console:get() then
			slot_401_17_0 = slot_0_94_1(slot_0_0_0, ui.get_style()["Link Active"]:to_hex())
			slot_401_18_0 = slot_0_94_1(slot_401_15_0, slot_401_8_0:to_hex())
			slot_401_19_0 = slot_401_13_0 and "" or " / mismatched hg ~ " .. slot_401_11_0 .. "(" .. (slot_401_12_0 or "?") .. ")"

			print_raw(("%s · missed %s's %s due to %s ( hc ~ %s%% / dmg ~ %s%s )"):format(slot_401_17_0, slot_401_18_0, slot_401_11_0, tostring(arg_401_0.state), tostring(arg_401_0.hitchance), tostring(arg_401_0.wanted_damage), slot_401_19_0))
		end
	end
end)

slot_0_102_7 = {}
slot_0_103_8 = {}

events.player_hurt(function(arg_405_0)
	slot_405_1_0 = slot_0_59_0.info and slot_0_59_0.info.notify

	if not slot_405_1_0 or not slot_405_1_0.log_enabled:get() then
		return
	end

	if not slot_405_1_0.log_hits:get() then
		return
	end

	slot_405_2_0 = entity.get_local_player()

	if not slot_405_2_0 or not slot_405_2_0:is_alive() then
		return
	end

	if entity.get(arg_405_0.attacker, true) ~= slot_405_2_0 then
		return
	end

	slot_405_4_0 = tostring(arg_405_0.weapon or "")
	slot_405_5_0 = slot_405_4_0 == "hegrenade"
	slot_405_6_0 = slot_405_4_0 == "inferno"
	slot_405_7_0 = slot_405_4_0 == "knife" or slot_405_4_0 == "knife_t" or slot_405_4_0 == "knifegg" or slot_405_4_0:find("knife") ~= nil

	if not slot_405_5_0 and not slot_405_6_0 and not slot_405_7_0 then
		return
	end

	slot_405_8_0 = entity.get(arg_405_0.userid, true)

	if not slot_405_8_0 then
		return
	end

	slot_405_9_0, slot_405_10_0 = pcall(function()
		return slot_405_8_0:get_name()
	end)
	slot_405_11_0 = string.lower(string.sub(slot_405_9_0 and slot_405_10_0 or "unknown", 1, 15))
	slot_405_12_0 = arg_405_0.dmg_health
	slot_405_13_0 = arg_405_0.health
	slot_405_14_0, slot_405_15_0 = pcall(function()
		return slot_405_1_0.log_mode:get()
	end)
	slot_405_16_0 = slot_405_14_0 and slot_405_15_0 == "text"
	slot_405_17_0 = color(180, 180, 185, 255)
	slot_405_18_0 = slot_405_5_0 and "naded" or slot_405_6_0 and "burned" or "knifed"
	slot_405_19_0 = slot_405_1_0.col_hit:get()

	if slot_405_6_0 then
		slot_405_20_3 = globals.realtime

		if slot_405_16_0 then
			slot_405_21_3 = slot_0_102_7[slot_405_11_0]

			if slot_405_21_3 and slot_405_21_3.entry and slot_405_20_3 - slot_405_21_3.entry.born < slot_405_21_3.entry.dur then
				slot_405_21_3.total_dmg = slot_405_21_3.total_dmg + slot_405_12_0
				slot_405_21_3.entry.born = slot_405_20_3
				slot_405_21_3.entry.parts = {
					{
						slot_405_19_0,
						slot_0_0_0
					},
					{
						slot_405_17_0,
						" · "
					},
					{
						slot_405_17_0,
						slot_405_18_0
					},
					{
						slot_405_17_0,
						" "
					},
					{
						slot_405_19_0,
						slot_405_11_0
					},
					{
						slot_405_17_0,
						" for "
					},
					{
						slot_405_19_0,
						tostring(slot_405_21_3.total_dmg)
					},
					{
						slot_405_17_0,
						" dmg ( left ~ "
					},
					{
						slot_405_19_0,
						tostring(slot_405_13_0)
					},
					{
						slot_405_17_0,
						" )"
					}
				}
			else
				slot_405_22_2 = {
					{
						slot_405_19_0,
						slot_0_0_0
					},
					{
						slot_405_17_0,
						" · "
					},
					{
						slot_405_17_0,
						slot_405_18_0
					},
					{
						slot_405_17_0,
						" "
					},
					{
						slot_405_19_0,
						slot_405_11_0
					},
					{
						slot_405_17_0,
						" for "
					},
					{
						slot_405_19_0,
						tostring(slot_405_12_0)
					},
					{
						slot_405_17_0,
						" dmg ( left ~ "
					},
					{
						slot_405_19_0,
						tostring(slot_405_13_0)
					},
					{
						slot_405_17_0,
						" )"
					}
				}
				slot_405_23_1 = {
					parts = slot_405_22_2,
					born = slot_405_20_3,
					dur = slot_0_96_3
				}

				if #slot_0_95_2 >= slot_0_100_6 then
					table.remove(slot_0_95_2, 1)
				end

				table.insert(slot_0_95_2, slot_405_23_1)

				slot_0_102_7[slot_405_11_0] = {
					entry = slot_405_23_1,
					total_dmg = slot_405_12_0
				}
			end
		else
			slot_405_21_2 = slot_0_103_8[slot_405_11_0]

			if slot_405_21_2 and not slot_405_21_2.dying then
				slot_405_21_2.total_dmg = (slot_405_21_2.total_dmg or 0) + slot_405_12_0
				slot_405_21_2.born = slot_405_20_3
				slot_405_21_2.parts = {
					slot_405_18_0 .. " " .. slot_405_11_0 .. " for " .. tostring(slot_405_21_2.total_dmg) .. " dmg",
					" ( left ~ " .. tostring(slot_405_13_0) .. " )"
				}
			else
				slot_405_22_1 = {
					slot_405_18_0 .. " " .. slot_405_11_0 .. " for " .. tostring(slot_405_12_0) .. " dmg",
					" ( left ~ " .. tostring(slot_405_13_0) .. " )"
				}
				slot_405_23_0 = slot_0_64_0.new(slot_405_22_1, slot_405_19_0)
				slot_405_23_0.total_dmg = slot_405_12_0
				slot_0_103_8[slot_405_11_0] = slot_405_23_0
			end
		end

		if slot_405_1_0.log_console:get() then
			slot_405_21_1 = slot_0_94_1(slot_0_0_0, ui.get_style()["Link Active"]:to_hex())
			slot_405_22_0 = slot_0_94_1(slot_405_11_0, slot_405_19_0:to_hex())

			print_raw(("%s · %s %s for %s dmg ( left ~ %s )"):format(slot_405_21_1, slot_405_18_0, slot_405_22_0, tostring(slot_405_12_0), tostring(slot_405_13_0)))
		end

		return
	end

	if slot_405_16_0 then
		slot_405_20_2 = {
			{
				slot_405_19_0,
				slot_0_0_0
			},
			{
				slot_405_17_0,
				" · "
			},
			{
				slot_405_17_0,
				slot_405_18_0
			},
			{
				slot_405_17_0,
				" "
			},
			{
				slot_405_19_0,
				slot_405_11_0
			},
			{
				slot_405_17_0,
				" for "
			},
			{
				slot_405_19_0,
				tostring(slot_405_12_0)
			},
			{
				slot_405_17_0,
				" dmg"
			}
		}

		if not slot_405_7_0 then
			table.insert(slot_405_20_2, {
				slot_405_17_0,
				" ( left ~ "
			})
			table.insert(slot_405_20_2, {
				slot_405_19_0,
				tostring(slot_405_13_0)
			})
			table.insert(slot_405_20_2, {
				slot_405_17_0,
				" )"
			})
		end

		slot_0_101_7(slot_405_20_2)
	else
		slot_405_20_1 = {
			slot_405_18_0 .. " " .. slot_405_11_0 .. " for " .. tostring(slot_405_12_0) .. " dmg"
		}

		if not slot_405_7_0 then
			table.insert(slot_405_20_1, " ( left ~ " .. tostring(slot_405_13_0) .. " )")
		end

		slot_0_64_0.new(slot_405_20_1, slot_405_19_0)
	end

	if slot_405_1_0.log_console:get() then
		slot_405_20_0 = slot_0_94_1(slot_0_0_0, ui.get_style()["Link Active"]:to_hex())
		slot_405_21_0 = slot_0_94_1(slot_405_11_0, slot_405_19_0:to_hex())

		if slot_405_7_0 then
			print_raw(("%s · knifed %s for %s dmg"):format(slot_405_20_0, slot_405_21_0, tostring(slot_405_12_0)))
		else
			print_raw(("%s · %s %s for %s dmg ( left ~ %s )"):format(slot_405_20_0, slot_405_18_0, slot_405_21_0, tostring(slot_405_12_0), tostring(slot_405_13_0)))
		end
	end
end)
events.player_hurt(function(arg_408_0)
	local var_408_0 = slot_0_59_0.info and slot_0_59_0.info.notify

	if not var_408_0 or not var_408_0.log_enabled:get() then
		return
	end

	local var_408_1, var_408_2 = pcall(function()
		return var_408_0.log_hurt:get()
	end)

	if not var_408_1 or not var_408_2 then
		return
	end

	local var_408_3 = entity.get_local_player()

	if not var_408_3 then
		return
	end

	if entity.get(arg_408_0.userid, true) ~= var_408_3 then
		return
	end

	local var_408_4 = entity.get(arg_408_0.attacker, true)

	if not var_408_4 then
		return
	end

	local var_408_5, var_408_6 = pcall(function()
		return var_408_4:get_name()
	end)
	local var_408_7 = string.lower(string.sub(var_408_5 and var_408_6 or "unknown", 1, 15))
	local var_408_8 = slot_0_93_1[arg_408_0.hitgroup] or "generic"
	local var_408_9 = arg_408_0.dmg_health
	local var_408_10 = arg_408_0.health
	local var_408_11, var_408_12 = pcall(function()
		return var_408_0.col_hurt:get()
	end)

	if not var_408_11 then
		var_408_12 = color(163, 166, 255, 255)
	end

	local var_408_13, var_408_14 = pcall(function()
		return var_408_0.log_mode:get()
	end)
	local var_408_15 = var_408_13 and var_408_14 == "text"
	local var_408_16 = color(180, 180, 185, 255)

	if var_408_15 then
		local var_408_17 = {
			{
				var_408_12,
				slot_0_0_0
			},
			{
				var_408_16,
				" · hurt by "
			},
			{
				var_408_12,
				var_408_7
			},
			{
				var_408_16,
				" in "
			},
			{
				var_408_12,
				var_408_8
			},
			{
				var_408_16,
				" for "
			},
			{
				var_408_12,
				tostring(var_408_9)
			},
			{
				var_408_16,
				" dmg"
			}
		}

		if var_408_10 > 0 then
			table.insert(var_408_17, {
				var_408_16,
				" ( hp ~ "
			})
			table.insert(var_408_17, {
				var_408_12,
				tostring(var_408_10)
			})
			table.insert(var_408_17, {
				var_408_16,
				" )"
			})
		end

		slot_0_101_7(var_408_17)
	end

	if var_408_0.log_console:get() then
		local var_408_18 = slot_0_94_1(slot_0_0_0, ui.get_style()["Link Active"]:to_hex())
		local var_408_19 = slot_0_94_1(var_408_7, var_408_12:to_hex())

		print_raw(("%s · hurt by %s in %s for %s dmg%s"):format(var_408_18, var_408_19, var_408_8, tostring(var_408_9), var_408_10 > 0 and " ( hp ~ " .. tostring(var_408_10) .. " )" or ""))
	end
end)

slot_0_104_9 = {}
slot_0_105_10 = 0.35
slot_0_106_11 = 3
slot_0_107_10 = false
slot_0_108_11 = false

function slot_0_109_12()
	local var_413_0, var_413_1 = pcall(function()
		return entity.get_game_rules()
	end)

	if not var_413_0 or not var_413_1 then
		return false
	end

	local var_413_2, var_413_3 = pcall(function()
		return var_413_1.m_bFreezePeriod
	end)

	return var_413_2 and var_413_3 == true
end

function slot_0_110_13()
	local var_416_0, var_416_1 = pcall(function()
		return entity.get_game_rules()
	end)

	if not var_416_0 or not var_416_1 then
		return nil
	end

	local var_416_2, var_416_3 = pcall(function()
		return var_416_1.m_bFreezePeriod
	end)

	if not var_416_2 or not var_416_3 then
		return nil
	end

	local var_416_4, var_416_5 = pcall(function()
		return var_416_1.m_flRestartRoundTime
	end)

	if not var_416_4 or not var_416_5 then
		return nil
	end

	return var_416_5 - globals.curtime
end

function slot_0_111_19(arg_420_0)
	local var_420_0, var_420_1 = pcall(function()
		return arg_420_0:get_name()
	end)

	if var_420_0 and var_420_1 and var_420_1 ~= "" then
		return string.lower(string.sub(var_420_1, 1, 15))
	end

	return nil
end

events.item_purchase(function(arg_422_0)
	local var_422_0 = slot_0_59_0.info and slot_0_59_0.info.notify

	if not var_422_0 or not var_422_0.log_enabled:get() then
		return
	end

	local var_422_1, var_422_2 = pcall(function()
		return var_422_0.log_mode:get()
	end)

	if not var_422_1 or var_422_2 ~= "text" then
		return
	end

	local var_422_3 = entity.get_local_player()
	local var_422_4 = entity.get(arg_422_0.userid, true)

	if not var_422_4 or var_422_4 == var_422_3 then
		return
	end

	local var_422_5 = var_422_4:get_index()
	local var_422_6 = tostring(arg_422_0.weapon or "")
	local var_422_7 = var_422_6:gsub("^weapon_", ""):gsub("^item_", "")

	if var_422_7 == "assaultsuit" then
		var_422_7 = "kevlar+helmet"
	end

	if var_422_7 == "hegrenade" then
		var_422_7 = "nade"
	end

	if var_422_7 == "smokegrenade" then
		var_422_7 = "smoke"
	end

	if var_422_7 == "flashbang" then
		var_422_7 = "flash"
	end

	if var_422_7 == "incgrenade" then
		var_422_7 = "molly"
	end

	if var_422_7 == "molotov" then
		var_422_7 = "molly"
	end

	if var_422_7 == "" or var_422_7 == var_422_6 or var_422_7 == "unknown" then
		return
	end

	if not slot_0_104_9[var_422_5] then
		slot_0_104_9[var_422_5] = {
			buyer = var_422_4,
			name = slot_0_111_19(var_422_4),
			items = {},
			time = globals.realtime
		}
	end

	table.insert(slot_0_104_9[var_422_5].items, var_422_7)

	slot_0_104_9[var_422_5].time = globals.realtime
end)

function slot_0_112_18(arg_424_0)
	local var_424_0, var_424_1 = pcall(function()
		return arg_424_0.col_purchases:get()
	end)
	local var_424_2 = color(180, 180, 185, 255)
	local var_424_3 = var_424_0 and var_424_1 and var_424_1 or color(150, 195, 255, 255)

	for iter_424_0, iter_424_1 in pairs(slot_0_104_9) do
		if not iter_424_1.name and iter_424_1.buyer then
			iter_424_1.name = slot_0_111_19(iter_424_1.buyer)
		end

		local var_424_4 = iter_424_1.name or "unknown"

		if var_424_4 == "unknown" then
			slot_0_104_9[iter_424_0] = nil
		else
			local var_424_5 = {}

			for iter_424_2, iter_424_3 in ipairs(iter_424_1.items) do
				if iter_424_3 ~= "unknown" then
					var_424_5[#var_424_5 + 1] = iter_424_3
				end
			end

			if #var_424_5 == 0 then
				slot_0_104_9[iter_424_0] = nil
			else
				local var_424_6 = table.concat(var_424_5, ", ")
				local var_424_7 = {
					{
						var_424_3,
						slot_0_0_0
					},
					{
						var_424_2,
						" · "
					},
					{
						var_424_3,
						var_424_4
					},
					{
						var_424_2,
						" bought "
					},
					{
						var_424_3,
						var_424_6
					}
				}

				slot_0_101_7(var_424_7)

				if arg_424_0.log_console:get() then
					local var_424_8 = slot_0_94_1(slot_0_0_0, ui.get_style()["Link Active"]:to_hex())
					local var_424_9 = slot_0_94_1(var_424_4, var_424_3:to_hex())

					print_raw(("%s · %s bought %s"):format(var_424_8, var_424_9, var_424_6))
				end

				slot_0_104_9[iter_424_0] = nil
			end
		end
	end
end

events.render(function()
	local var_426_0 = slot_0_59_0.info and slot_0_59_0.info.notify

	if not var_426_0 or not var_426_0.log_enabled:get() then
		return
	end

	if not var_426_0.log_purchases:get() then
		return
	end

	local var_426_1, var_426_2 = pcall(function()
		return var_426_0.log_mode:get()
	end)

	if not var_426_1 or var_426_2 ~= "text" then
		return
	end

	local var_426_3 = slot_0_109_12()

	if next(slot_0_104_9) == nil then
		if not var_426_3 then
			slot_0_108_11 = false
		end

		slot_0_107_10 = var_426_3

		return
	end

	if slot_0_107_10 and not var_426_3 then
		slot_0_108_11 = false

		slot_0_112_18(var_426_0)
	elseif var_426_3 and not slot_0_108_11 then
		local var_426_4 = slot_0_110_13()

		if var_426_4 and var_426_4 <= slot_0_106_11 then
			slot_0_108_11 = true

			slot_0_112_18(var_426_0)
		end
	elseif not var_426_3 then
		local var_426_5 = globals.realtime
		local var_426_6 = false

		for iter_426_0, iter_426_1 in pairs(slot_0_104_9) do
			if var_426_5 - iter_426_1.time >= slot_0_105_10 then
				var_426_6 = true

				break
			end
		end

		if var_426_6 then
			slot_0_112_18(var_426_0)
		end
	end

	slot_0_107_10 = var_426_3
end)
events.dormant_hit(function(arg_428_0)
	slot_428_1_0 = slot_0_59_0.info and slot_0_59_0.info.notify

	if not slot_428_1_0 or not slot_428_1_0.log_enabled:get() then
		return
	end

	slot_428_2_0, slot_428_3_0 = pcall(function()
		return slot_428_1_0.log_dormant:get()
	end)

	if not slot_428_2_0 or not slot_428_3_0 then
		return
	end

	slot_428_4_0, slot_428_5_0 = pcall(function()
		return slot_0_11_0.rage.main.dormant_aimbot:get()
	end)

	if not slot_428_4_0 or not slot_428_5_0 then
		return
	end

	slot_428_6_0 = entity.get_local_player()

	if not slot_428_6_0 or not slot_428_6_0:is_alive() then
		return
	end

	slot_428_7_0 = entity.get(arg_428_0.userid, true)

	if not slot_428_7_0 then
		return
	end

	slot_428_8_0, slot_428_9_0 = pcall(function()
		return slot_428_7_0:get_name()
	end)
	slot_428_10_0 = string.lower(string.sub(slot_428_8_0 and slot_428_9_0 or "unknown", 1, 15))
	slot_428_11_0 = slot_0_93_1[arg_428_0.hitgroup] or "generic"
	slot_428_12_0 = string.lower(tostring(arg_428_0.aim_hitbox or ""))
	slot_428_13_0 = slot_428_11_0 == slot_428_12_0
	slot_428_14_0 = math.floor((arg_428_0.accuracy or 0) * 100 + 0.5)
	slot_428_15_0 = arg_428_0.dmg_health
	slot_428_16_0 = arg_428_0.health
	slot_428_17_0, slot_428_18_0 = pcall(function()
		return slot_428_1_0.log_mode:get()
	end)
	slot_428_19_0 = slot_428_17_0 and slot_428_18_0 == "text"
	slot_428_20_0 = color(180, 180, 185, 255)
	slot_428_21_0, slot_428_22_0 = pcall(function()
		return slot_428_1_0.col_dormant_hit:get()
	end)

	if not slot_428_21_0 then
		slot_428_22_0 = color(106, 255, 84, 255)
	end

	slot_428_23_0, slot_428_24_0 = pcall(function()
		return slot_428_1_0.col_mismatch:get()
	end)

	if not slot_428_23_0 then
		slot_428_24_0 = color(255, 159, 94, 255)
	end

	slot_428_25_0 = not slot_428_13_0 and slot_428_24_0 or slot_428_22_0

	if slot_428_19_0 then
		slot_428_26_2 = {
			{
				slot_428_25_0,
				slot_0_0_0
			},
			{
				slot_428_20_0,
				" · dormant hit "
			},
			{
				slot_428_25_0,
				slot_428_10_0
			},
			{
				slot_428_20_0,
				"'s "
			},
			{
				slot_428_25_0,
				slot_428_11_0
			}
		}

		if not slot_428_13_0 then
			table.insert(slot_428_26_2, {
				slot_428_20_0,
				"["
			})
			table.insert(slot_428_26_2, {
				slot_428_22_0,
				slot_428_12_0
			})
			table.insert(slot_428_26_2, {
				slot_428_20_0,
				"]"
			})
		end

		table.insert(slot_428_26_2, {
			slot_428_20_0,
			" for "
		})
		table.insert(slot_428_26_2, {
			slot_428_25_0,
			tostring(slot_428_15_0)
		})
		table.insert(slot_428_26_2, {
			slot_428_20_0,
			" dmg ( ac ~ "
		})
		table.insert(slot_428_26_2, {
			slot_428_25_0,
			tostring(slot_428_14_0) .. "%"
		})

		if slot_428_16_0 > 0 then
			table.insert(slot_428_26_2, {
				slot_428_20_0,
				" / hp ~ "
			})
			table.insert(slot_428_26_2, {
				slot_428_25_0,
				tostring(slot_428_16_0)
			})
		end

		table.insert(slot_428_26_2, {
			slot_428_20_0,
			" )"
		})
		slot_0_101_7(slot_428_26_2)
	else
		slot_428_26_1 = {
			"dormant hit ",
			slot_428_10_0,
			"'s ",
			slot_428_11_0,
			" for ",
			slot_428_15_0,
			" dmg"
		}

		if not slot_428_13_0 then
			table.insert(slot_428_26_1, " [" .. slot_428_12_0 .. "]")
		end

		slot_0_64_0.new(slot_428_26_1, slot_428_25_0)
	end

	if slot_428_1_0.log_console:get() then
		slot_428_26_0 = slot_0_94_1(slot_0_0_0, ui.get_style()["Link Active"]:to_hex())
		slot_428_27_0 = slot_0_94_1(slot_428_10_0, slot_428_25_0:to_hex())
		slot_428_28_0 = slot_428_13_0 and "" or " [aimed: " .. slot_428_12_0 .. "]"

		print_raw(("%s · dormant hit %s's %s%s for %s dmg ( ac ~ %s%% / hp ~ %s )"):format(slot_428_26_0, slot_428_27_0, slot_428_11_0, slot_428_28_0, tostring(slot_428_15_0), tostring(slot_428_14_0), tostring(slot_428_16_0)))
	end
end)
events.dormant_miss(function(arg_435_0)
	local var_435_0 = slot_0_59_0.info and slot_0_59_0.info.notify

	if not var_435_0 or not var_435_0.log_enabled:get() then
		return
	end

	local var_435_1, var_435_2 = pcall(function()
		return var_435_0.log_dormant:get()
	end)

	if not var_435_1 or not var_435_2 then
		return
	end

	local var_435_3, var_435_4 = pcall(function()
		return slot_0_11_0.rage.main.dormant_aimbot:get()
	end)

	if not var_435_3 or not var_435_4 then
		return
	end

	local var_435_5 = entity.get_local_player()

	if not var_435_5 or not var_435_5:is_alive() then
		return
	end

	local var_435_6 = entity.get(arg_435_0.userid, true)

	if not var_435_6 then
		return
	end

	local var_435_7, var_435_8 = pcall(function()
		return var_435_6:get_name()
	end)
	local var_435_9 = string.lower(string.sub(var_435_7 and var_435_8 or "unknown", 1, 15))
	local var_435_10 = string.lower(tostring(arg_435_0.aim_hitbox or "unknown"))
	local var_435_11 = string.lower(tostring(arg_435_0.aim_point or "unknown"))
	local var_435_12 = math.floor((arg_435_0.accuracy or 0) * 100 + 0.5)
	local var_435_13, var_435_14 = pcall(function()
		return var_435_0.log_mode:get()
	end)
	local var_435_15 = var_435_13 and var_435_14 == "text"
	local var_435_16 = color(180, 180, 185, 255)
	local var_435_17, var_435_18 = pcall(function()
		return var_435_0.col_dormant_miss:get()
	end)

	if not var_435_17 then
		var_435_18 = color(255, 115, 115, 255)
	end

	if var_435_15 then
		local var_435_19 = {
			{
				var_435_18,
				slot_0_0_0
			},
			{
				var_435_16,
				" · dormant miss "
			},
			{
				var_435_18,
				var_435_9
			},
			{
				var_435_16,
				"'s "
			},
			{
				var_435_18,
				var_435_10
			},
			{
				var_435_16,
				" ["
			},
			{
				var_435_18,
				var_435_11
			},
			{
				var_435_16,
				"] ( ac ~ "
			},
			{
				var_435_18,
				tostring(var_435_12) .. "%"
			},
			{
				var_435_16,
				" )"
			}
		}

		slot_0_101_7(var_435_19)
	else
		slot_0_64_0.new({
			"dormant miss ",
			var_435_9,
			"'s ",
			var_435_10,
			" [",
			var_435_11,
			"]"
		}, var_435_18)
	end

	if var_435_0.log_console:get() then
		local var_435_20 = slot_0_94_1(slot_0_0_0, ui.get_style()["Link Active"]:to_hex())
		local var_435_21 = slot_0_94_1(var_435_9, var_435_18:to_hex())

		print_raw(("%s · dormant miss %s's %s [%s] ( ac ~ %s%% )"):format(var_435_20, var_435_21, var_435_10, var_435_11, tostring(var_435_12)))
	end
end)
pcall(ffi.cdef, "void* AddFontMemResourceEx(void* pFileView, unsigned long cjSize, void* pvResrved, unsigned long* pNumFonts);")

slot_0_93_0 = nil

pcall(function()
	slot_0_93_0 = ffi.load("gdi32")
end)

slot_0_94_0 = {}
slot_0_95_1 = render.load_font("Verdana", vector(0, 10, 3), "ab")
slot_0_96_2 = 2
slot_0_97_3 = render.load_font("Verdana", 10, "ab")
slot_0_98_2 = render.load_font("Verdana", 14, "ab")
slot_0_99_4 = render.load_font("Verdana", 14, "ab")
slot_0_100_5 = "nl\\elysian\\Inter_28pt-Bold.ttf"
slot_0_101_6 = "https://cdn.jsdelivr.net/gh/yirahvh-spec/elysian@main/Inter_28pt-Bold.ttf"
slot_0_102_6 = "Inter 28pt"

function slot_0_103_7(arg_442_0)
	if not arg_442_0 or #arg_442_0 < 4096 then
		return false
	end

	local var_442_0, var_442_1, var_442_2, var_442_3 = arg_442_0:byte(1, 4)
	local var_442_4 = var_442_0 == 0 and var_442_1 == 1 and var_442_2 == 0 and var_442_3 == 0 or var_442_0 == 116 and var_442_1 == 114 and var_442_2 == 117 and var_442_3 == 101
	local var_442_5 = var_442_0 == 79 and var_442_1 == 84 and var_442_2 == 84 and var_442_3 == 79

	return var_442_4 or var_442_5
end

slot_0_104_8 = slot_0_97_3

function slot_0_105_9()
	local var_443_0, var_443_1 = pcall(render.load_font, slot_0_100_5, 12, "ab")

	if var_443_0 and var_443_1 then
		slot_0_104_8 = var_443_1
	end

	local var_443_2, var_443_3 = pcall(render.load_font, slot_0_100_5, 15, "ab")

	if var_443_2 and var_443_3 then
		slot_0_99_4 = var_443_3
	end

	local var_443_4, var_443_5 = pcall(render.load_font, slot_0_100_5, 22, "ab")

	if var_443_4 and var_443_5 then
		slot_0_28_0 = var_443_5
	end

	local var_443_6, var_443_7 = pcall(render.load_font, slot_0_100_5, 10, "ab")

	if var_443_6 and var_443_7 then
		slot_0_21_0 = var_443_7
	end

	local var_443_8, var_443_9 = pcall(render.load_font, slot_0_100_5, 14, "ab")

	if var_443_8 and var_443_9 then
		slot_0_22_0 = var_443_9
	end

	local var_443_10, var_443_11 = pcall(render.load_font, slot_0_100_5, 11, "ab")

	if var_443_10 and var_443_11 then
		slot_0_25_0 = var_443_11
	end

	local var_443_12, var_443_13 = pcall(render.load_font, slot_0_100_5, 12, "ab")

	if var_443_12 and var_443_13 then
		slot_0_23_0 = var_443_13
	end

	local var_443_14, var_443_15 = pcall(render.load_font, slot_0_100_5, 11, "ab")

	if var_443_14 and var_443_15 then
		slot_0_24_0 = var_443_15
	end
end

slot_0_106_10 = files.read(slot_0_100_5, true)

if slot_0_103_7(slot_0_106_10) then
	slot_0_105_9()
else
	if slot_0_106_10 then
		pcall(files.write, slot_0_100_5, "", true)
	end

	network.get(slot_0_101_6, nil, function(arg_444_0)
		if not slot_0_103_7(arg_444_0) then
			slot_0_13_0:error("failed to download font. please place Inter_28pt-Bold.ttf manually in nl\\elysian\\Inter_28pt-Bold.ttf and install it for all users.")

			return
		end

		files.write(slot_0_100_5, arg_444_0, true)
		slot_0_13_0:message("font downloaded! reloading script...")
		common.reload_script()
	end)
end

slot_0_107_9 = 0
slot_0_108_10 = 0
slot_0_109_11 = 0
slot_0_110_12 = 0
slot_0_111_18 = 0
slot_0_112_17 = 0
slot_0_113_15 = slot_0_52_0:new("wm_modern", vector(slot_0_14_0.x * 0.5, slot_0_14_0.y - 28), "xy")
slot_0_114_15 = "✦"
slot_0_115_14 = render.load_font("Verdana", 13, "ab")
slot_0_116_11 = render.load_font("Verdana", 22, "ab")
slot_0_117_11 = "nl\\elysian\\elysian_E_logo.png"
slot_0_118_10 = "https://cdn.jsdelivr.net/gh/yirahvh-spec/elysian@main/elysian_E_logo.png"
slot_0_119_9 = nil
slot_0_120_9 = 120
slot_0_121_8 = 92
slot_0_122_9 = 34
slot_0_123_6 = 15
slot_0_124_6 = slot_0_52_0:new("wm_logo_w", vector(slot_0_14_0.x - 80, 80), "xy")

;(function()
	local var_445_0 = files.read(slot_0_117_11, true)

	if var_445_0 and #var_445_0 > 64 then
		local var_445_1, var_445_2 = pcall(render.load_image_from_file, slot_0_117_11, vector(slot_0_120_9, slot_0_121_8))

		if var_445_1 and var_445_2 then
			slot_0_119_9 = var_445_2

			return
		end
	end

	network.get(slot_0_118_10, nil, function(arg_446_0)
		if not arg_446_0 or #arg_446_0 < 64 then
			return
		end

		pcall(files.write, slot_0_117_11, arg_446_0, true)

		local var_446_0, var_446_1 = pcall(render.load_image_from_file, slot_0_117_11, vector(slot_0_120_9, slot_0_121_8))

		if var_446_0 and var_446_1 then
			slot_0_119_9 = var_446_1
		end
	end)
end)()

function slot_0_126_7(arg_447_0)
	if arg_447_0 and arg_447_0.font and arg_447_0.font:get() == "pixel" then
		return slot_0_96_2
	end

	return slot_0_95_1
end

function slot_0_127_5(arg_448_0)
	if arg_448_0 and arg_448_0.font and arg_448_0.font:get() == "pixel" then
		return "E L Y S I A N"
	end

	return (arg_448_0 and arg_448_0.name_case and arg_448_0.name_case:get()) == "lowercase" and "elysian" or "ELYSIAN"
end

function slot_0_128_6(arg_449_0, arg_449_1, arg_449_2)
	arg_449_2 = math.max(0, math.min(1, arg_449_2))

	return color(math.floor(arg_449_0.r + (arg_449_1.r - arg_449_0.r) * arg_449_2), math.floor(arg_449_0.g + (arg_449_1.g - arg_449_0.g) * arg_449_2), math.floor(arg_449_0.b + (arg_449_1.b - arg_449_0.b) * arg_449_2), math.floor(arg_449_0.a + (arg_449_1.a - arg_449_0.a) * arg_449_2))
end

function slot_0_129_4(arg_450_0, arg_450_1, arg_450_2, arg_450_3, arg_450_4, arg_450_5, arg_450_6, arg_450_7, arg_450_8)
	local var_450_0 = math.floor(arg_450_8 * 0.22)

	if var_450_0 > 1 then
		render.rect(vector(arg_450_0 - 2, arg_450_1), vector(arg_450_2 + 2, arg_450_3 + 4), color(0, 0, 0, var_450_0), arg_450_4 + 2)
	end

	if arg_450_5 then
		render.blur(vector(arg_450_0, arg_450_1), vector(arg_450_2, arg_450_3), 6, 0.85, arg_450_4)
		render.blur(vector(arg_450_0, arg_450_1), vector(arg_450_2, arg_450_3), 3, 0.55, arg_450_4)
		render.blur(vector(arg_450_0, arg_450_1), vector(arg_450_2, arg_450_3), 1, 0.25, arg_450_4)
	end

	render.rect(vector(arg_450_0, arg_450_1), vector(arg_450_2, arg_450_3), color(arg_450_6.r, arg_450_6.g, arg_450_6.b, arg_450_6.a), arg_450_4)

	local var_450_1 = arg_450_3 - arg_450_1

	render.rect(vector(arg_450_0 + 1, arg_450_1 + 1), vector(arg_450_2 - 1, arg_450_1 + 1 + math.floor(var_450_1 * 0.44)), color(255, 255, 255, 22), arg_450_4)
	render.rect_outline(vector(arg_450_0, arg_450_1), vector(arg_450_2, arg_450_3), color(arg_450_7.r, arg_450_7.g, arg_450_7.b, arg_450_7.a), 1, arg_450_4)
end

function slot_0_130_2(arg_451_0, arg_451_1, arg_451_2)
	slot_451_3_0 = arg_451_0.m_col_accent:get()
	slot_451_4_0 = arg_451_0.m_col_text:get()
	slot_451_5_0 = arg_451_0.m_show_nick:get()
	slot_451_6_0 = arg_451_0.m_show_fps:get()
	slot_451_7_0 = arg_451_0.m_show_ping:get()
	slot_451_8_0 = slot_0_104_8 and slot_0_104_8 ~= 0 and slot_0_104_8 ~= 1 and slot_0_104_8 or slot_0_97_3

	if arg_451_0.m_font and (function()
		local var_452_0, var_452_1 = pcall(function()
			return arg_451_0.m_font:get()
		end)

		return var_452_0 and var_452_1 == "verdana"
	end)() then
		slot_451_8_0 = slot_0_97_3
	end

	slot_451_9_0 = arg_451_0.m_col_bg and arg_451_0.m_col_bg:get() or color(15, 15, 18, 210)
	slot_451_12_0, slot_451_11_0 = arg_451_0.m_col_border and arg_451_0.m_col_border:get() or color(255, 255, 255, 40), slot_451_9_0
	slot_451_13_0 = slot_0_47_0()
	slot_451_14_0 = slot_451_3_0.r
	slot_451_15_0 = slot_451_3_0.g
	slot_451_16_0 = slot_451_3_0.b
	slot_451_17_0 = slot_451_3_0.a
	slot_451_18_0 = slot_451_4_0.r
	slot_451_19_0 = slot_451_4_0.g
	slot_451_20_0 = slot_451_4_0.b
	slot_451_21_0 = slot_451_4_0.a
	slot_451_22_0 = arg_451_0.m_shimmer_en and arg_451_0.m_shimmer_en:get() or false
	slot_451_23_0 = slot_451_22_0 and arg_451_0.m_col_shimmer and arg_451_0.m_col_shimmer:get() or nil
	slot_451_24_0 = slot_451_23_0 and slot_451_23_0.r or slot_451_18_0
	slot_451_25_0 = slot_451_23_0 and slot_451_23_0.g or slot_451_19_0
	slot_451_26_0 = slot_451_23_0 and slot_451_23_0.b or slot_451_20_0
	slot_451_27_0 = slot_451_23_0 and slot_451_23_0.a or slot_451_21_0
	slot_451_29_0 = (arg_451_0.m_logo_mode and arg_451_0.m_logo_mode:get() or "logo") == "text"
	slot_451_31_0 = (arg_451_0.m_text_case and arg_451_0.m_text_case:get() or "lowercase") == "uppercase" and "ELYSIAN" or "elysian"
	slot_451_32_0 = 3
	slot_451_33_0 = 9
	slot_451_34_0 = slot_451_29_0 and 18 or 13
	slot_451_35_0 = 40
	slot_451_36_0 = 13
	slot_451_37_0 = 9
	slot_451_38_0 = 1
	slot_451_39_0 = arg_451_0.m_font and (function()
		local var_454_0, var_454_1 = pcall(function()
			return arg_451_0.m_font:get()
		end)

		return var_454_0 and var_454_1 == "verdana"
	end)()
	slot_451_40_0 = slot_451_29_0 and (slot_451_39_0 and slot_0_98_2 or slot_0_99_4 and slot_0_99_4 ~= 0 and slot_0_99_4 ~= 1 and slot_0_99_4 or slot_0_97_3) or slot_0_98_2
	slot_451_41_0 = render.measure_text(slot_451_40_0, nil, slot_451_31_0)
	slot_451_42_0 = 2
	slot_451_43_0 = slot_451_41_0.x + slot_451_42_0 * (#slot_451_31_0 - 1)
	slot_451_44_0 = nil

	if slot_451_29_0 then
		slot_451_44_0 = slot_451_43_0 + slot_451_34_0 * 2
	else
		slot_451_44_0 = 24 + slot_451_34_0 * 2
	end

	slot_451_45_0 = render.measure_text(slot_451_8_0, nil, "A").y
	slot_451_46_0 = slot_451_45_0 + 18
	slot_451_47_0 = ""
	slot_451_48_0 = "·"
	slot_451_49_0 = 5
	slot_451_50_0 = {}

	if slot_451_5_0 then
		slot_451_51_3, slot_451_52_3 = pcall(function()
			return common.get_username()
		end)
		slot_451_53_3 = slot_451_51_3 and slot_451_52_3 and slot_451_52_3 ~= "" and slot_451_52_3 or "player"
		slot_451_55_4 = slot_451_53_3 == "inmyhell" and "meduza" or slot_451_53_3
		slot_451_56_2 = render.measure_text(slot_451_8_0, nil, slot_451_55_4)
		slot_451_57_1 = render.measure_text(slot_0_115_14, nil, slot_451_47_0)
		slot_451_58_1 = render.measure_text(slot_451_8_0, nil, slot_451_48_0)
		slot_451_59_1 = slot_451_57_1.x + slot_451_49_0 + slot_451_58_1.x + slot_451_49_0
		slot_451_50_0[#slot_451_50_0 + 1] = {
			text = slot_451_55_4,
			w = slot_451_59_1 + slot_451_56_2.x,
			nick_only_w = slot_451_56_2.x,
			prefix_icon = slot_451_47_0,
			prefix_icon_w = slot_451_57_1.x,
			dot_sep = slot_451_48_0,
			dot_sep_w = slot_451_58_1.x,
			prefix_w = slot_451_59_1,
			icon_gap = slot_451_49_0
		}
	end

	if slot_451_6_0 then
		slot_451_51_2 = 1 / math.max(globals.frametime, 0.0001)
		slot_0_110_12 = slot_0_110_12 + (slot_451_51_2 - slot_0_110_12) * math.min(1, arg_451_1 * 15)

		if slot_0_111_18 == 0 then
			slot_0_111_18 = slot_0_110_12
		end

		slot_0_111_18 = slot_0_111_18 + (slot_0_110_12 - slot_0_111_18) * math.min(1, arg_451_1 * 0.6)
		slot_451_52_2 = math.floor(slot_0_111_18 + 0.5) .. "fps"
		slot_451_53_2 = render.measure_text(slot_451_8_0, nil, "000fps").x
		slot_451_50_0[#slot_451_50_0 + 1] = {
			right_align = true,
			text = slot_451_52_2,
			w = slot_451_53_2
		}
	end

	if slot_451_7_0 then
		slot_451_51_1 = 0
		slot_451_52_1, slot_451_53_1 = pcall(function()
			return utils.net_channel()
		end)

		if slot_451_52_1 and slot_451_53_1 then
			slot_451_54_1, slot_451_55_3 = pcall(function()
				if type(slot_451_53_1.latency) == "table" then
					return (slot_451_53_1.latency[1] or 0) * 1000
				end

				return 0
			end)

			if slot_451_54_1 and slot_451_55_3 then
				slot_451_51_1 = math.floor(slot_451_55_3 + 0.5)
			end
		end

		slot_0_109_11 = slot_0_109_11 + (slot_451_51_1 - slot_0_109_11) * math.min(1, arg_451_1 * 6)
		slot_451_55_2 = math.floor(slot_0_109_11 + 0.5) .. "ms"
		slot_451_50_0[#slot_451_50_0 + 1] = {
			text = slot_451_55_2,
			w = render.measure_text(slot_451_8_0, nil, slot_451_55_2).x
		}
	end

	slot_451_51_0 = 0

	for iter_451_0, iter_451_1 in ipairs(slot_451_50_0) do
		if iter_451_0 > 1 then
			slot_451_51_0 = slot_451_51_0 + slot_451_37_0 + slot_451_38_0 + slot_451_37_0
		end

		slot_451_51_0 = slot_451_51_0 + iter_451_1.w
	end

	slot_451_52_0 = #slot_451_50_0 > 0 and slot_451_36_0 + slot_451_51_0 + slot_451_36_0 or 0
	slot_451_53_0 = math.min(1, arg_451_1 * 20)
	slot_0_112_17 = slot_0_112_17 + (slot_451_52_0 - slot_0_112_17) * slot_451_53_0
	slot_451_54_0 = math.floor(slot_0_112_17 + 0.5)
	slot_451_55_0 = slot_451_54_0 > 8
	slot_451_56_0 = slot_451_44_0 + (slot_451_55_0 and slot_451_32_0 + slot_451_54_0 or 0)
	slot_451_57_0 = math.max(slot_451_35_0, slot_451_46_0)
	slot_451_58_0 = ui.get_alpha() > 0
	slot_451_59_0 = false

	if slot_451_58_0 and slot_0_19_0 then
		slot_451_60_1, slot_451_61_1 = pcall(function()
			return slot_0_19_0:get()
		end)
		slot_451_59_0 = slot_451_60_1 and slot_451_61_1 == 2
	end

	if slot_451_59_0 then
		slot_0_113_15:update(vector(slot_451_56_0, slot_451_57_0))
	end

	slot_451_60_0 = math.max(slot_0_113_15.hover_anim, slot_0_113_15.grab_anim)

	if slot_451_60_0 > 0.005 then
		slot_0_48_0(slot_0_113_15.position, vector(slot_451_56_0, slot_451_57_0), slot_451_60_0)
	end

	slot_451_61_0 = math.floor(slot_0_113_15.position.x)
	slot_451_62_0 = math.floor(slot_0_113_15.position.y)
	slot_451_63_0 = slot_451_61_0 - math.floor(slot_451_56_0 * 0.5)
	slot_0_107_9 = slot_0_107_9 + arg_451_1
	slot_0_108_10 = slot_0_108_10 + arg_451_1
	slot_451_64_0 = slot_0_107_9 * 0.6 % 1.3 - 0.15
	slot_451_65_0 = slot_451_63_0
	slot_451_66_0 = slot_451_62_0 - math.floor(slot_451_35_0 * 0.5)
	slot_451_67_0 = slot_451_65_0 + slot_451_44_0
	slot_451_68_0 = slot_451_66_0 + slot_451_35_0
	slot_451_69_0 = slot_451_65_0 + math.floor(slot_451_44_0 * 0.5)
	slot_451_70_0 = slot_451_66_0 + math.floor(slot_451_35_0 * 0.5)
	slot_451_71_0 = slot_451_69_0 - math.floor(slot_451_43_0 * 0.5)
	slot_451_73_0 = slot_451_63_0 + slot_451_44_0 + slot_451_32_0 + math.floor((slot_451_54_0 - slot_451_51_0) * 0.5)
	slot_451_74_0 = slot_451_55_0 and slot_451_73_0 + slot_451_51_0 or slot_451_71_0 + slot_451_43_0
	slot_451_75_0 = math.max(slot_451_74_0 - slot_451_71_0, 1)

	slot_0_129_4(slot_451_65_0, slot_451_66_0, slot_451_67_0, slot_451_68_0, slot_451_33_0, slot_451_13_0, slot_451_11_0, slot_451_12_0, 210)

	slot_451_76_0 = (math.sin(slot_0_108_10 * 1.4) + 1) * 0.5
	slot_451_77_0 = slot_451_65_0
	slot_451_78_0 = slot_451_55_0 and slot_451_67_0 + slot_451_32_0 + slot_451_54_0 or slot_451_67_0
	slot_451_79_0 = math.max(slot_451_78_0 - slot_451_77_0, 1)

	if not slot_451_29_0 then
		slot_451_80_2 = render.measure_text(slot_0_116_11, nil, slot_0_114_15)
		slot_451_81_2 = slot_451_69_0 - math.floor(slot_451_80_2.x * 0.5)
		slot_451_82_2 = slot_451_70_0 - math.floor(slot_451_80_2.y * 0.5) - 2
		slot_451_83_2 = slot_451_76_0 * slot_451_76_0
		slot_451_84_2 = math.abs((slot_451_69_0 - slot_451_77_0) / slot_451_79_0 - slot_451_64_0)
		slot_451_85_2 = math.max(0, 1 - slot_451_84_2 / 0.22)
		slot_451_85_1 = slot_451_85_2 * slot_451_85_2 * slot_451_85_2
		slot_451_86_1 = slot_451_22_0 and math.min(1, slot_451_83_2 * 0.5 + slot_451_85_1 * 0.8) or 0.28 + slot_451_76_0 * 0.72
		slot_451_87_1 = slot_451_22_0 and slot_451_24_0 or slot_451_14_0
		slot_451_88_1 = slot_451_22_0 and slot_451_25_0 or slot_451_15_0
		slot_451_89_1 = slot_451_22_0 and slot_451_26_0 or slot_451_16_0
		slot_451_90_1 = slot_451_22_0 and slot_451_27_0 or slot_451_17_0
		slot_451_91_1 = {
			{
				4,
				slot_451_86_1 * 0.05
			},
			{
				2,
				slot_451_86_1 * 0.14
			},
			{
				1,
				slot_451_86_1 * 0.32
			}
		}

		for iter_451_2, iter_451_3 in ipairs(slot_451_91_1) do
			slot_451_97_2 = iter_451_3[1]
			slot_451_98_1 = iter_451_3[2]
			slot_451_99_2 = math.floor(slot_451_90_1 * slot_451_98_1)

			if slot_451_99_2 > 1 then
				slot_451_100_2 = color(slot_451_87_1, slot_451_88_1, slot_451_89_1, slot_451_99_2)

				for iter_451_4, iter_451_5 in ipairs({
					{
						-slot_451_97_2,
						0
					},
					{
						slot_451_97_2,
						0
					},
					{
						0,
						-slot_451_97_2
					},
					{
						0,
						slot_451_97_2
					}
				}) do
					render.text(slot_0_116_11, vector(slot_451_81_2 + iter_451_5[1], slot_451_82_2 + iter_451_5[2]), slot_451_100_2, nil, slot_0_114_15)
				end
			end
		end

		slot_451_92_2 = math.floor(slot_451_17_0 * (0.88 + slot_451_86_1 * 0.12))

		render.text(slot_0_116_11, vector(slot_451_81_2, slot_451_82_2), color(slot_451_14_0, slot_451_15_0, slot_451_16_0, slot_451_92_2), nil, slot_0_114_15)
	else
		slot_451_80_1 = slot_451_41_0.y
		slot_451_81_1 = slot_451_71_0
		slot_451_82_1 = slot_451_70_0 - math.floor(slot_451_80_1 * 0.5) - 1
		slot_451_83_1 = {}
		slot_451_84_1 = {}

		for iter_451_6 = 1, #slot_451_31_0 do
			slot_451_83_1[iter_451_6] = slot_451_31_0:sub(iter_451_6, iter_451_6)
			slot_451_84_1[iter_451_6] = render.measure_text(slot_451_40_0, nil, slot_451_83_1[iter_451_6]).x
		end

		slot_451_85_0 = slot_451_81_1

		for iter_451_7, iter_451_8 in ipairs(slot_451_83_1) do
			slot_451_92_1 = (slot_451_85_0 + slot_451_84_1[iter_451_7] * 0.5 - slot_451_71_0) / slot_451_75_0
			slot_451_93_2 = math.abs(slot_451_92_1 - slot_451_64_0)
			slot_451_94_3 = math.max(0, 1 - slot_451_93_2 / 0.12)
			slot_451_94_2 = slot_451_94_3 * slot_451_94_3 * slot_451_94_3
			slot_451_95_3 = slot_451_22_0 and slot_451_94_2 or 0
			slot_451_96_2 = math.min(255, math.floor(slot_451_14_0 + (slot_451_24_0 - slot_451_14_0) * slot_451_95_3 * 0.85))
			slot_451_97_1 = math.min(255, math.floor(slot_451_15_0 + (slot_451_25_0 - slot_451_15_0) * slot_451_95_3 * 0.85))
			slot_451_98_0 = math.min(255, math.floor(slot_451_16_0 + (slot_451_26_0 - slot_451_16_0) * slot_451_95_3 * 0.85))
			slot_451_99_1 = math.floor(slot_451_17_0 * (0.92 + slot_451_76_0 * 0.08))
			slot_451_100_1 = slot_451_22_0 and math.floor(slot_451_27_0 * slot_451_94_2 * 0.28) or 0

			if slot_451_100_1 > 2 then
				render.text(slot_451_40_0, vector(slot_451_85_0 + 1, slot_451_82_1 + 1), color(slot_451_24_0, slot_451_25_0, slot_451_26_0, slot_451_100_1), nil, iter_451_8)
				render.text(slot_451_40_0, vector(slot_451_85_0 - 1, slot_451_82_1 + 1), color(slot_451_24_0, slot_451_25_0, slot_451_26_0, math.floor(slot_451_100_1 * 0.5)), nil, iter_451_8)
			end

			render.text(slot_451_40_0, vector(slot_451_85_0, slot_451_82_1), color(slot_451_96_2, slot_451_97_1, slot_451_98_0, slot_451_99_1), nil, iter_451_8)

			slot_451_85_0 = slot_451_85_0 + slot_451_84_1[iter_451_7] + (iter_451_7 < #slot_451_83_1 and slot_451_42_0 or 0)
		end
	end

	if slot_451_55_0 then
		slot_451_80_0 = slot_451_63_0 + slot_451_44_0 + slot_451_32_0
		slot_451_81_0 = slot_451_62_0 - math.floor(slot_451_46_0 * 0.5)
		slot_451_82_0 = slot_451_80_0 + slot_451_54_0
		slot_451_83_0 = slot_451_81_0 + slot_451_46_0

		slot_0_129_4(slot_451_80_0, slot_451_81_0, slot_451_82_0, slot_451_83_0, slot_451_33_0, slot_451_13_0, slot_451_11_0, slot_451_12_0, 210)

		slot_451_84_0 = slot_451_81_0 + math.floor(slot_451_46_0 * 0.5)
		slot_451_86_0 = slot_451_73_0

		function slot_451_87_0(arg_460_0, arg_460_1, arg_460_2)
			local var_460_0 = arg_460_2 - arg_460_1
			local var_460_1 = math.floor(slot_451_12_0.r * 0.55 + 12.75)
			local var_460_2 = math.floor(slot_451_12_0.g * 0.55 + 12.75)
			local var_460_3 = math.floor(slot_451_12_0.b * 0.55 + 12.75)
			local var_460_4 = math.max(slot_451_12_0.a, 55)

			for iter_460_0 = arg_460_1, arg_460_2 do
				local var_460_5 = (iter_460_0 - arg_460_1) / math.max(var_460_0, 1)
				local var_460_6 = math.sin(var_460_5 * math.pi)
				local var_460_7 = var_460_6 * var_460_6
				local var_460_8 = math.floor(var_460_4 * var_460_7)

				if var_460_8 > 1 then
					render.rect(vector(arg_460_0, iter_460_0), vector(arg_460_0 + slot_451_38_0, iter_460_0 + 1), color(var_460_1, var_460_2, var_460_3, var_460_8))
				end
			end
		end

		for iter_451_9, iter_451_10 in ipairs(slot_451_50_0) do
			if iter_451_9 > 1 then
				slot_451_86_0 = slot_451_86_0 + slot_451_37_0
				slot_451_93_1 = slot_451_84_0 - math.floor(slot_451_45_0 * 0.5) - 3
				slot_451_94_1 = slot_451_84_0 + math.floor(slot_451_45_0 * 0.5) + 3

				slot_451_87_0(slot_451_86_0, slot_451_93_1, slot_451_94_1)

				slot_451_86_0 = slot_451_86_0 + slot_451_38_0 + slot_451_37_0
			end

			slot_451_93_0 = slot_451_84_0 - math.floor(slot_451_45_0 * 0.5)
			slot_451_94_0 = slot_451_86_0

			if iter_451_10.prefix_icon then
				slot_451_95_2 = render.measure_text(slot_0_115_14, nil, iter_451_10.prefix_icon).y
				slot_451_96_1 = slot_451_84_0 - math.floor(slot_451_95_2 * 0.5)

				render.text(slot_0_115_14, vector(slot_451_86_0, slot_451_96_1), color(slot_451_18_0, slot_451_19_0, slot_451_20_0, math.floor(slot_451_21_0 * 0.85)), nil, iter_451_10.prefix_icon)

				slot_451_97_0 = slot_451_86_0 + iter_451_10.prefix_icon_w + iter_451_10.icon_gap

				render.text(slot_451_8_0, vector(slot_451_97_0, slot_451_93_0), color(slot_451_18_0, slot_451_19_0, slot_451_20_0, math.floor(slot_451_21_0 * 0.55)), nil, iter_451_10.dot_sep)

				slot_451_94_0 = slot_451_86_0 + iter_451_10.prefix_w
			else
				slot_451_95_1 = render.measure_text(slot_451_8_0, nil, iter_451_10.text).x

				if iter_451_10.right_align then
					slot_451_94_0 = slot_451_86_0 + iter_451_10.w - slot_451_95_1
				else
					slot_451_94_0 = slot_451_86_0 + math.floor((iter_451_10.w - slot_451_95_1) * 0.5)
				end
			end

			slot_451_95_0 = {}

			for iter_451_11 = 1, #iter_451_10.text do
				slot_451_95_0[iter_451_11] = iter_451_10.text:sub(iter_451_11, iter_451_11)
			end

			slot_451_96_0 = slot_451_94_0

			for iter_451_12, iter_451_13 in ipairs(slot_451_95_0) do
				slot_451_102_0 = render.measure_text(slot_451_8_0, nil, iter_451_13)
				slot_451_103_0 = (slot_451_96_0 + slot_451_102_0.x * 0.5 - slot_451_77_0) / slot_451_79_0
				slot_451_104_0 = math.abs(slot_451_103_0 - slot_451_64_0)
				slot_451_105_1 = math.max(0, 1 - slot_451_104_0 / 0.15)
				slot_451_105_0 = slot_451_105_1 * slot_451_105_1 * slot_451_105_1
				slot_451_106_0 = slot_451_22_0 and slot_451_105_0 or 0
				slot_451_107_0 = math.min(255, math.floor(slot_451_18_0 + (slot_451_24_0 - slot_451_18_0) * slot_451_106_0 * 0.92))
				slot_451_108_0 = math.min(255, math.floor(slot_451_19_0 + (slot_451_25_0 - slot_451_19_0) * slot_451_106_0 * 0.92))
				slot_451_109_0 = math.min(255, math.floor(slot_451_20_0 + (slot_451_26_0 - slot_451_20_0) * slot_451_106_0 * 0.92))
				slot_451_110_0 = slot_451_22_0 and math.floor(slot_451_27_0 * slot_451_105_0 * 0.3) or 0

				if slot_451_110_0 > 2 then
					render.text(slot_451_8_0, vector(slot_451_96_0 + 1, slot_451_93_0), color(slot_451_24_0, slot_451_25_0, slot_451_26_0, slot_451_110_0), nil, iter_451_13)
					render.text(slot_451_8_0, vector(slot_451_96_0 - 1, slot_451_93_0), color(slot_451_24_0, slot_451_25_0, slot_451_26_0, math.floor(slot_451_110_0 * 0.55)), nil, iter_451_13)
					render.text(slot_451_8_0, vector(slot_451_96_0, slot_451_93_0 - 1), color(slot_451_24_0, slot_451_25_0, slot_451_26_0, math.floor(slot_451_110_0 * 0.4)), nil, iter_451_13)
				end

				render.text(slot_451_8_0, vector(slot_451_96_0, slot_451_93_0), color(slot_451_107_0, slot_451_108_0, slot_451_109_0, slot_451_21_0), nil, iter_451_13)

				slot_451_96_0 = slot_451_96_0 + slot_451_102_0.x
			end

			slot_451_86_0 = slot_451_86_0 + iter_451_10.w
		end
	end
end

events.render(function()
	slot_461_0_0 = slot_0_59_0.info.watermark

	if not slot_461_0_0 then
		return
	end

	slot_461_1_0 = entity.get_local_player()

	if slot_461_1_0 == nil then
		return
	end

	slot_461_2_0 = math.max(0.001, math.min(globals.frametime, 0.05))

	if slot_461_0_0.style and slot_461_0_0.style:get() == "modern" then
		slot_0_130_2(slot_461_0_0, slot_461_2_0, slot_461_1_0)

		return
	end

	if slot_461_0_0.style and slot_461_0_0.style:get() == "logo" then
		if slot_0_119_9 then
			slot_461_3_1 = slot_0_120_9 - slot_0_122_9 * 2
			slot_461_4_1 = slot_0_121_8 - slot_0_123_6 * 2
			slot_461_5_1 = ui.get_alpha() > 0
			slot_461_6_1 = false

			if slot_461_5_1 and slot_0_19_0 then
				slot_461_7_2, slot_461_8_2 = pcall(function()
					return slot_0_19_0:get()
				end)
				slot_461_6_1 = slot_461_7_2 and slot_461_8_2 == 2
			end

			if slot_461_6_1 then
				slot_0_124_6:update(vector(slot_461_3_1, slot_461_4_1))
			end

			slot_461_7_1 = math.max(slot_0_124_6.hover_anim, slot_0_124_6.grab_anim)

			if slot_461_7_1 > 0.005 then
				slot_0_48_0(slot_0_124_6.position, vector(slot_461_3_1, slot_461_4_1), slot_461_7_1)
			end

			slot_461_8_1 = math.floor(slot_0_124_6.position.x)
			slot_461_9_1 = math.floor(slot_0_124_6.position.y)
			slot_461_10_1 = slot_461_8_1 - math.floor(slot_0_120_9 * 0.5)
			slot_461_11_1 = slot_461_9_1 - math.floor(slot_0_121_8 * 0.5)
			slot_461_12_1 = slot_461_0_0.w_col and slot_461_0_0.w_col:get() or color(255, 255, 255, 255)

			render.texture(slot_0_119_9, vector(slot_461_10_1, slot_461_11_1), vector(slot_0_120_9, slot_0_121_8), color(slot_461_12_1.r, slot_461_12_1.g, slot_461_12_1.b, slot_461_12_1.a))
		end

		return
	end

	slot_461_3_0 = slot_0_59_0.info.crosshair

	if not slot_461_3_0 then
		return
	end

	if slot_461_3_0.enabled:get() then
		return
	end

	slot_461_4_0 = slot_461_0_0.col1:get()
	slot_461_5_0 = slot_461_0_0.col2:get()
	slot_461_6_0 = slot_461_0_0.col3:get()
	slot_461_7_0 = slot_461_0_0.col_wave:get()
	slot_461_8_0 = render.screen_size()
	slot_461_9_0 = slot_461_0_0.position:get()
	slot_461_10_0 = slot_461_0_0 and slot_461_0_0.font and slot_461_0_0.font:get() == "pixel"
	slot_461_11_0 = nil
	slot_461_12_0 = nil

	if slot_461_9_0 == "bottom center" then
		slot_461_11_0 = slot_461_8_0.x * 0.5
		slot_461_12_0 = slot_461_8_0.y - (slot_461_10_0 and 20 or 28)
	elseif slot_461_9_0 == "left center" then
		slot_461_11_0 = slot_461_10_0 and 32 or 43
		slot_461_12_0 = slot_461_8_0.y * 0.5
	else
		slot_461_11_0 = slot_461_8_0.x * 0.5
		slot_461_12_0 = slot_461_8_0.y - 28
	end

	slot_461_13_0 = slot_0_126_7(slot_461_0_0)
	slot_461_14_0 = slot_0_127_5(slot_461_0_0)
	slot_461_15_0 = {}
	slot_461_16_0 = {}
	slot_461_17_0 = 0

	for iter_461_0 = 1, #slot_461_14_0 do
		slot_461_15_0[iter_461_0] = slot_461_14_0:sub(iter_461_0, iter_461_0)
		slot_461_22_1 = render.measure_text(slot_461_13_0, nil, slot_461_15_0[iter_461_0])
		slot_461_16_0[iter_461_0] = slot_461_22_1.x
		slot_461_17_0 = slot_461_17_0 + slot_461_22_1.x
	end

	slot_461_18_0 = render.measure_text(slot_461_13_0, nil, "A").y
	slot_461_19_0 = 165
	slot_461_21_0 = (math.sin(globals.realtime * 1.6) + 1) * 0.5 * 1.4 - 0.2
	slot_461_22_0 = slot_461_11_0 - slot_461_17_0 * 0.5
	slot_461_23_0 = slot_461_22_0

	for iter_461_1, iter_461_2 in ipairs(slot_461_15_0) do
		slot_461_29_0 = (slot_461_23_0 - slot_461_22_0 + slot_461_16_0[iter_461_1] * 0.5) / math.max(slot_461_17_0, 1)
		slot_461_30_0 = slot_461_29_0 < 0.5 and slot_0_128_6(slot_461_4_0, slot_461_5_0, slot_461_29_0 * 2) or slot_0_128_6(slot_461_5_0, slot_461_6_0, (slot_461_29_0 - 0.5) * 2)
		slot_461_31_0 = math.abs(slot_461_29_0 - slot_461_21_0)
		slot_461_32_1 = math.max(0, 1 - slot_461_31_0 / 0.38)
		slot_461_32_0 = slot_461_32_1 * slot_461_32_1 * (3 - 2 * slot_461_32_1)
		slot_461_33_1 = slot_0_128_6(slot_461_30_0, slot_461_7_0, slot_461_32_0 * 0.6)
		slot_461_34_0 = math.min(255, math.floor(slot_461_19_0 + slot_461_32_0 * 90))
		slot_461_33_0 = color(slot_461_33_1.r, slot_461_33_1.g, slot_461_33_1.b, slot_461_34_0)

		render.push_clip_rect(vector(slot_461_23_0 - 2, slot_461_12_0 - 2), vector(slot_461_23_0 + slot_461_16_0[iter_461_1] + 2, slot_461_12_0 + slot_461_18_0 + 2))

		slot_461_35_0 = math.floor(slot_461_34_0 * 0.09)
		slot_461_36_0 = math.floor(slot_461_35_0 * 0.5)

		if slot_461_35_0 > 0 then
			slot_461_37_0 = color(slot_461_33_0.r, slot_461_33_0.g, slot_461_33_0.b, slot_461_35_0)
			slot_461_38_0 = color(slot_461_33_0.r, slot_461_33_0.g, slot_461_33_0.b, slot_461_36_0)

			render.text(slot_461_13_0, vector(slot_461_23_0, slot_461_12_0 - 1), slot_461_37_0, nil, iter_461_2)
			render.text(slot_461_13_0, vector(slot_461_23_0, slot_461_12_0 + 1), slot_461_37_0, nil, iter_461_2)
			render.text(slot_461_13_0, vector(slot_461_23_0 - 1, slot_461_12_0), slot_461_37_0, nil, iter_461_2)
			render.text(slot_461_13_0, vector(slot_461_23_0 + 1, slot_461_12_0), slot_461_37_0, nil, iter_461_2)
			render.text(slot_461_13_0, vector(slot_461_23_0 - 1, slot_461_12_0 - 1), slot_461_38_0, nil, iter_461_2)
			render.text(slot_461_13_0, vector(slot_461_23_0 + 1, slot_461_12_0 - 1), slot_461_38_0, nil, iter_461_2)
			render.text(slot_461_13_0, vector(slot_461_23_0 - 1, slot_461_12_0 + 1), slot_461_38_0, nil, iter_461_2)
			render.text(slot_461_13_0, vector(slot_461_23_0 + 1, slot_461_12_0 + 1), slot_461_38_0, nil, iter_461_2)
		end

		render.text(slot_461_13_0, vector(slot_461_23_0, slot_461_12_0), slot_461_33_0, nil, iter_461_2)
		render.pop_clip_rect()

		slot_461_23_0 = slot_461_23_0 + slot_461_16_0[iter_461_1]
	end
end)

slot_0_95_0 = nil
slot_0_96_1 = slot_0_52_0:new("hotkeys_list", vector(slot_0_14_0.x - 180, slot_0_14_0.y * 0.5), "xy")
slot_0_97_2 = 28
slot_0_98_1 = 3
slot_0_99_3 = 20
slot_0_100_4 = 10
slot_0_101_5 = 3
slot_0_102_5 = 9
slot_0_103_6 = 109
slot_0_104_7 = "hotkeys"
slot_0_105_8 = 0
slot_0_106_9 = 0
slot_0_107_8 = 119
slot_0_108_9 = 0
slot_0_109_10 = 0
slot_0_110_11 = 0
slot_0_111_17 = 0
slot_0_112_16 = 8
slot_0_113_14 = {}
slot_0_114_14 = {}
slot_0_115_13 = {}

function slot_0_116_10(arg_463_0, arg_463_1, arg_463_2, arg_463_3, arg_463_4, arg_463_5, arg_463_6, arg_463_7, arg_463_8)
	local var_463_0 = math.floor(arg_463_6.a * 0.2)

	if var_463_0 > 1 then
		render.rect(vector(arg_463_0 - 2, arg_463_1), vector(arg_463_2 + 2, arg_463_3 + 4), color(0, 0, 0, var_463_0), arg_463_4 + 2)
	end

	if arg_463_5 and arg_463_8 > 0.01 then
		render.blur(vector(arg_463_0, arg_463_1), vector(arg_463_2, arg_463_3), 6, 0.85 * arg_463_8, arg_463_4)
		render.blur(vector(arg_463_0, arg_463_1), vector(arg_463_2, arg_463_3), 3, 0.55 * arg_463_8, arg_463_4)
		render.blur(vector(arg_463_0, arg_463_1), vector(arg_463_2, arg_463_3), 1, 0.25 * arg_463_8, arg_463_4)
	end

	render.rect(vector(arg_463_0, arg_463_1), vector(arg_463_2, arg_463_3), color(arg_463_6.r, arg_463_6.g, arg_463_6.b, arg_463_6.a), arg_463_4)

	local var_463_1 = arg_463_3 - arg_463_1

	render.rect(vector(arg_463_0 + 1, arg_463_1 + 1), vector(arg_463_2 - 1, arg_463_1 + 1 + math.floor(var_463_1 * 0.44)), color(255, 255, 255, math.floor(22 * arg_463_8)), arg_463_4)
	render.rect_outline(vector(arg_463_0, arg_463_1), vector(arg_463_2, arg_463_3), color(arg_463_7.r, arg_463_7.g, arg_463_7.b, arg_463_7.a), 1, arg_463_4)
end

function slot_0_117_10(arg_464_0, arg_464_1, arg_464_2, arg_464_3, arg_464_4, arg_464_5, arg_464_6, arg_464_7, arg_464_8)
	local var_464_0 = math.floor(arg_464_6.a * 0.2)

	if var_464_0 > 1 then
		render.rect(vector(arg_464_0 - 2, arg_464_1), vector(arg_464_2 + 2, arg_464_3 + 4), color(0, 0, 0, var_464_0), arg_464_4 + 2)
	end

	if arg_464_5 and arg_464_8 > 0.01 then
		render.blur(vector(arg_464_0, arg_464_1), vector(arg_464_2, arg_464_3), 6, 0.85 * arg_464_8, arg_464_4)
		render.blur(vector(arg_464_0, arg_464_1), vector(arg_464_2, arg_464_3), 3, 0.55 * arg_464_8, arg_464_4)
		render.blur(vector(arg_464_0, arg_464_1), vector(arg_464_2, arg_464_3), 1, 0.25 * arg_464_8, arg_464_4)
	end

	render.rect(vector(arg_464_0, arg_464_1), vector(arg_464_2, arg_464_3), color(arg_464_6.r, arg_464_6.g, arg_464_6.b, arg_464_6.a), arg_464_4)
	render.rect_outline(vector(arg_464_0, arg_464_1), vector(arg_464_2, arg_464_3), color(arg_464_7.r, arg_464_7.g, arg_464_7.b, arg_464_7.a), 1, arg_464_4)
end

function slot_0_118_9(arg_465_0)
	if not arg_465_0 or arg_465_0 == "" then
		return arg_465_0
	end

	local var_465_0 = arg_465_0:lower()

	if var_465_0:find("ai peek") or var_465_0:find("robot") then
		return "aipeek"
	end

	if var_465_0:find("air exploit") or var_465_0:find("plane%-up") then
		return "airexploit"
	end

	if var_465_0:find("freestand") or var_465_0:find("rotate") then
		return "freestanding"
	end

	arg_465_0 = arg_465_0:gsub("[%c]", "")
	arg_465_0 = arg_465_0:gsub("%b<>", "")
	arg_465_0 = arg_465_0:gsub("[^\x01-\x7F]", "")
	arg_465_0 = arg_465_0:gsub("\a%x%x%x%x%x%x%x%x", "")
	arg_465_0 = arg_465_0:gsub("\\a%x%x%x%x%x%x%x%x", "")
	arg_465_0 = arg_465_0:gsub("^%s+", "")
	arg_465_0 = arg_465_0:gsub("%s+$", "")

	return arg_465_0:lower()
end

function slot_0_119_8(arg_466_0)
	if arg_466_0.name and arg_466_0.name:lower() == "min. damage" then
		local var_466_0, var_466_1 = pcall(function()
			return slot_0_11_0.rage.selection.minimum_damage:get()
		end)

		if var_466_0 and type(var_466_1) == "number" then
			return tostring(math.floor(var_466_1))
		end
	end

	return "on"
end

function slot_0_120_8(arg_468_0)
	if not arg_468_0 then
		return nil
	end

	local var_468_0, var_468_1 = pcall(function()
		return arg_468_0:get()
	end)

	return var_468_0 and var_468_1 or nil
end

events.render(function()
	slot_470_0_0 = slot_0_59_0.info and slot_0_59_0.info.keybinds_ui

	if not slot_470_0_0 then
		return
	end

	if not slot_0_120_8(slot_470_0_0.enabled) then
		return
	end

	slot_470_1_0 = ui.get_alpha() > 0
	slot_470_2_0 = false

	if slot_470_1_0 and slot_0_19_0 then
		slot_470_3_1, slot_470_4_0 = pcall(function()
			return slot_0_19_0:get()
		end)
		slot_470_2_0 = slot_470_3_1 and slot_470_4_0 == 2
	end

	slot_470_3_0 = slot_470_1_0 and slot_470_2_0

	if entity.get_local_player() == nil and not slot_470_3_0 then
		return
	end

	slot_470_5_0 = math.max(0.001, math.min(globals.frametime, 0.05))
	slot_0_105_8 = slot_0_105_8 + slot_470_5_0
	slot_0_106_9 = slot_0_106_9 + slot_470_5_0
	slot_470_6_0 = slot_0_120_8(slot_470_0_0.col_bg) or color(15, 15, 18, 210)
	slot_470_7_0 = slot_0_120_8(slot_470_0_0.col_border) or color(255, 255, 255, 40)
	slot_470_8_0 = slot_0_120_8(slot_470_0_0.col_text) or color(133, 133, 133, 191)
	slot_470_9_0 = slot_0_120_8(slot_470_0_0.col_accent) or slot_0_43_0()
	slot_470_10_0 = slot_0_47_0()
	slot_470_11_0 = true

	if slot_470_0_0.show_bg then
		slot_470_12_1, slot_470_13_1 = pcall(function()
			return slot_470_0_0.show_bg:get()
		end)

		if slot_470_12_1 then
			slot_470_11_0 = slot_470_13_1 ~= false
		end
	end

	slot_470_12_0 = {}
	slot_470_13_0, slot_470_14_0 = pcall(ui.get_binds)

	if slot_470_13_0 and slot_470_14_0 then
		for iter_470_0, iter_470_1 in ipairs(slot_470_14_0) do
			if iter_470_1.value and iter_470_1.value ~= 0 then
				slot_470_12_0[#slot_470_12_0 + 1] = iter_470_1
			end
		end
	end

	if slot_0_78_0 and slot_0_78_0.is_active or false then
		slot_470_16_1 = nil
		slot_470_17_1 = nil

		for iter_470_2, iter_470_3 in ipairs(slot_470_12_0) do
			slot_470_23_2 = iter_470_3.name and iter_470_3.name:lower()

			if slot_470_23_2 == "double tap" then
				slot_470_16_1 = iter_470_2
			end

			if slot_470_23_2 == "hide shots" then
				slot_470_17_1 = iter_470_2
			end
		end

		if slot_470_16_1 and not slot_470_17_1 then
			slot_470_18_3 = slot_470_12_0[slot_470_16_1]
			slot_470_12_0[slot_470_16_1] = {
				active = true,
				name = "hide shots",
				value = slot_470_18_3.value,
				mode = slot_470_18_3.mode
			}
		elseif slot_470_16_1 and slot_470_17_1 then
			table.remove(slot_470_12_0, slot_470_16_1)

			slot_470_18_2 = slot_470_16_1 < slot_470_17_1 and slot_470_17_1 - 1 or slot_470_17_1
			slot_470_19_1 = slot_470_12_0[slot_470_18_2]
			slot_470_12_0[slot_470_18_2] = {
				active = true,
				name = slot_470_19_1.name,
				value = slot_470_19_1.value,
				mode = slot_470_19_1.mode
			}
		elseif not slot_470_16_1 and not slot_470_17_1 then
			slot_470_12_0[#slot_470_12_0 + 1] = {
				value = 1,
				active = true,
				mode = "toggle",
				name = "hide shots"
			}
		elseif slot_470_17_1 then
			slot_470_18_1 = slot_470_12_0[slot_470_17_1]
			slot_470_12_0[slot_470_17_1] = {
				active = true,
				name = slot_470_18_1.name,
				value = slot_470_18_1.value,
				mode = slot_470_18_1.mode
			}
		end
	end

	if slot_470_3_0 and #slot_470_12_0 == 0 then
		slot_470_12_0 = {
			{
				value = 1,
				active = true,
				mode = "toggle",
				name = "double tap"
			},
			{
				value = 2,
				active = false,
				mode = "toggle",
				name = "hide shots"
			},
			{
				value = 3,
				active = true,
				mode = "hold",
				name = "min. damage"
			}
		}
	end

	slot_470_16_0 = {}

	for iter_470_4, iter_470_5 in ipairs(slot_470_12_0) do
		slot_470_16_0[iter_470_5.name] = true
	end

	slot_470_17_0 = {
		["min. damage"] = 3,
		["hide shots"] = 2,
		["double tap"] = 1
	}

	function slot_470_18_0(arg_473_0)
		return slot_470_17_0[arg_473_0 and arg_473_0:lower()] or 999
	end

	slot_470_19_0 = math.min(1, slot_470_5_0 * 18)
	slot_470_20_0 = math.min(1, slot_470_5_0 * 30)

	for iter_470_6, iter_470_7 in ipairs(slot_470_12_0) do
		if not slot_0_113_14[iter_470_7.name] then
			slot_0_113_14[iter_470_7.name] = 0
			slot_0_114_14[iter_470_7.name] = -slot_0_112_16
			slot_0_115_13[#slot_0_115_13 + 1] = iter_470_7.name
		end

		if slot_470_3_0 then
			slot_0_113_14[iter_470_7.name] = 1
			slot_0_114_14[iter_470_7.name] = 0
		else
			slot_0_113_14[iter_470_7.name] = slot_0_113_14[iter_470_7.name] + (1 - slot_0_113_14[iter_470_7.name]) * slot_470_19_0
			slot_0_114_14[iter_470_7.name] = slot_0_114_14[iter_470_7.name] + (0 - slot_0_114_14[iter_470_7.name]) * slot_470_19_0
		end
	end

	for iter_470_8 = #slot_0_115_13, 1, -1 do
		slot_470_25_1 = slot_0_115_13[iter_470_8]

		if not slot_470_16_0[slot_470_25_1] then
			if slot_470_3_0 then
				slot_0_113_14[slot_470_25_1] = 0

				table.remove(slot_0_115_13, iter_470_8)

				slot_0_113_14[slot_470_25_1] = nil
				slot_0_114_14[slot_470_25_1] = nil
			else
				slot_0_113_14[slot_470_25_1] = slot_0_113_14[slot_470_25_1] + (0 - slot_0_113_14[slot_470_25_1]) * slot_470_20_0
				slot_0_114_14[slot_470_25_1] = slot_0_114_14[slot_470_25_1] + (-slot_0_112_16 - slot_0_114_14[slot_470_25_1]) * slot_470_20_0

				if (slot_0_113_14[slot_470_25_1] or 0) < 0.015 then
					table.remove(slot_0_115_13, iter_470_8)

					slot_0_113_14[slot_470_25_1] = nil
					slot_0_114_14[slot_470_25_1] = nil
				end
			end
		end
	end

	table.sort(slot_0_115_13, function(arg_474_0, arg_474_1)
		local var_474_0 = slot_470_18_0(arg_474_0)
		local var_474_1 = slot_470_18_0(arg_474_1)

		if var_474_0 ~= var_474_1 then
			return var_474_0 < var_474_1
		end

		return arg_474_0 < arg_474_1
	end)

	slot_470_21_0 = #slot_0_115_13
	slot_470_22_0 = slot_470_21_0 > 0 and 1 or 0

	if slot_470_3_0 and slot_470_21_0 > 0 then
		slot_0_111_17 = 1
	else
		slot_470_23_1 = slot_470_22_0 < slot_0_111_17 and math.min(1, slot_470_5_0 * 22) or math.min(1, slot_470_5_0 * 12)
		slot_0_111_17 = slot_0_111_17 + (slot_470_22_0 - slot_0_111_17) * slot_470_23_1
	end

	slot_470_23_0 = slot_0_111_17

	if slot_470_23_0 < 0.01 then
		return
	end

	slot_470_24_0 = slot_470_0_0.font and (function()
		local var_475_0, var_475_1 = pcall(function()
			return slot_470_0_0.font:get()
		end)

		return var_475_0 and var_475_1 == "verdana"
	end)()
	slot_470_25_0 = slot_470_24_0 and slot_0_31_0 or slot_0_23_0
	slot_470_26_0 = slot_470_24_0 and slot_0_32_0 or slot_0_24_0
	slot_470_27_0 = render.measure_text(slot_470_26_0, nil, "A").y
	slot_470_28_0 = render.measure_text(slot_470_25_0, nil, slot_0_104_7)
	slot_470_29_0 = 18
	slot_470_30_0 = slot_470_28_0.x + slot_470_29_0 * 2
	slot_470_31_0 = {}

	for iter_470_9, iter_470_10 in ipairs(slot_470_12_0) do
		slot_470_31_0[iter_470_10.name] = iter_470_10
	end

	slot_470_32_0 = 0
	slot_470_33_0 = 0

	for iter_470_11, iter_470_12 in ipairs(slot_0_115_13) do
		slot_470_39_2 = slot_470_31_0[iter_470_12]
		slot_470_40_2 = slot_0_118_9(iter_470_12)
		slot_470_41_1 = slot_470_39_2 and slot_0_119_8(slot_470_39_2) or "on"
		slot_470_42_1 = render.measure_text(slot_470_26_0, nil, slot_470_40_2).x
		slot_470_43_1 = render.measure_text(slot_470_26_0, nil, slot_470_41_1).x

		if slot_470_32_0 < slot_470_42_1 then
			slot_470_32_0 = slot_470_42_1
		end

		if slot_470_33_0 < slot_470_43_1 then
			slot_470_33_0 = slot_470_43_1
		end
	end

	slot_470_34_0 = slot_470_21_0 > 0 and slot_0_100_4 + slot_470_32_0 + 16 + slot_470_33_0 + slot_0_100_4 or 0
	slot_470_35_0 = math.max(slot_0_103_6, slot_470_30_0, slot_470_34_0)

	if slot_470_3_0 then
		slot_0_107_8 = slot_470_35_0
	else
		slot_0_107_8 = slot_0_107_8 + (slot_470_35_0 - slot_0_107_8) * math.min(1, slot_470_5_0 * 18)
	end

	slot_470_36_0 = math.floor(slot_0_107_8 + 0.5)
	slot_470_37_0 = slot_470_21_0 > 0 and slot_0_101_5 + slot_470_21_0 * slot_0_99_3 + math.max(0, slot_470_21_0 - 1) * 4 + slot_0_101_5 or 0
	slot_470_38_0 = math.min(1, slot_470_5_0 * 22)

	if slot_470_3_0 then
		slot_0_108_9 = slot_470_37_0
		slot_0_109_10 = slot_470_21_0 > 0 and slot_470_36_0 or 0
		slot_0_110_11 = slot_470_21_0 > 0 and 1 or 0
	else
		slot_0_108_9 = slot_0_108_9 + (slot_470_37_0 - slot_0_108_9) * slot_470_38_0
		slot_470_39_1 = slot_470_21_0 > 0 and slot_470_36_0 or 0
		slot_0_109_10 = slot_0_109_10 + (slot_470_39_1 - slot_0_109_10) * slot_470_38_0
		slot_470_40_1 = slot_470_21_0 > 0 and 1 or 0
		slot_0_110_11 = slot_0_110_11 + (slot_470_40_1 - slot_0_110_11) * math.min(1, slot_470_5_0 * 5)
	end

	slot_470_39_0 = math.floor(slot_0_108_9 + 0.5)
	slot_470_40_0 = math.floor(slot_0_109_10 + 0.5)
	slot_470_41_0 = slot_470_39_0 > 2 and slot_0_110_11 * slot_470_23_0 > 0.01
	slot_470_42_0 = slot_0_97_2 + (slot_470_41_0 and slot_0_98_1 + slot_470_39_0 or 0)

	slot_0_96_1:update(vector(slot_470_36_0, slot_470_42_0))

	slot_470_43_0 = math.max(slot_0_96_1.hover_anim, slot_0_96_1.grab_anim)

	if slot_470_43_0 > 0.005 then
		slot_0_48_0(slot_0_96_1.position, vector(slot_470_36_0, slot_470_42_0), slot_470_43_0)
	end

	slot_470_44_0 = math.floor(slot_0_96_1.position.x)
	slot_470_45_0 = math.floor(slot_0_96_1.position.y)
	slot_470_46_0 = slot_470_44_0 - math.floor(slot_470_36_0 * 0.5)
	slot_470_47_0 = slot_470_45_0 - math.floor(slot_470_42_0 * 0.5)
	slot_470_48_0 = slot_470_46_0
	slot_470_49_0 = slot_470_47_0
	slot_470_50_0 = slot_470_46_0 + slot_470_36_0
	slot_470_51_0 = slot_470_47_0 + slot_0_97_2
	slot_470_52_0 = color(slot_470_6_0.r, slot_470_6_0.g, slot_470_6_0.b, math.floor(slot_470_6_0.a * slot_470_23_0))
	slot_470_53_0 = color(slot_470_7_0.r, slot_470_7_0.g, slot_470_7_0.b, math.floor(slot_470_7_0.a * slot_470_23_0))

	slot_0_116_10(slot_470_48_0, slot_470_49_0, slot_470_50_0, slot_470_51_0, slot_0_102_5, slot_470_10_0, slot_470_52_0, slot_470_53_0, slot_470_23_0)

	slot_470_54_0 = slot_0_106_9 * 0.55 % 1.3 - 0.15
	slot_470_55_0 = (math.sin(slot_0_105_8 * 1.4) + 1) * 0.5
	slot_470_56_0 = slot_470_28_0.x
	slot_470_57_0 = slot_470_44_0 - math.floor(slot_470_56_0 * 0.5)
	slot_470_58_0 = slot_470_49_0 + math.floor((slot_0_97_2 - slot_470_28_0.y) * 0.5)
	slot_470_59_0 = slot_470_57_0

	for iter_470_13 = 1, #slot_0_104_7 do
		slot_470_64_1 = slot_0_104_7:sub(iter_470_13, iter_470_13)
		slot_470_65_2 = render.measure_text(slot_470_25_0, nil, slot_470_64_1)
		slot_470_66_2 = (slot_470_59_0 - slot_470_57_0 + slot_470_65_2.x * 0.5) / math.max(slot_470_56_0, 1)
		slot_470_67_0 = math.abs(slot_470_66_2 - slot_470_54_0)
		slot_470_68_1 = math.max(0, 1 - slot_470_67_0 / 0.15)
		slot_470_68_0 = slot_470_68_1 * slot_470_68_1 * slot_470_68_1
		slot_470_69_0 = math.floor(slot_470_9_0.a * slot_470_23_0 * (0.88 + slot_470_55_0 * 0.12))
		slot_470_70_1 = math.floor(slot_470_9_0.a * slot_470_23_0 * slot_470_68_0 * 0.3)

		if slot_470_70_1 > 2 then
			render.text(slot_470_25_0, vector(slot_470_59_0 + 1, slot_470_58_0 + 1), color(slot_470_9_0.r, slot_470_9_0.g, slot_470_9_0.b, slot_470_70_1), nil, slot_470_64_1)
			render.text(slot_470_25_0, vector(slot_470_59_0 - 1, slot_470_58_0), color(slot_470_9_0.r, slot_470_9_0.g, slot_470_9_0.b, math.floor(slot_470_70_1 * 0.5)), nil, slot_470_64_1)
			render.text(slot_470_25_0, vector(slot_470_59_0, slot_470_58_0 - 1), color(slot_470_9_0.r, slot_470_9_0.g, slot_470_9_0.b, math.floor(slot_470_70_1 * 0.4)), nil, slot_470_64_1)
		end

		render.text(slot_470_25_0, vector(slot_470_59_0, slot_470_58_0), color(slot_470_9_0.r, slot_470_9_0.g, slot_470_9_0.b, slot_470_69_0), nil, slot_470_64_1)

		slot_470_59_0 = slot_470_59_0 + slot_470_65_2.x
	end

	if slot_470_41_0 then
		slot_470_60_0 = slot_470_46_0
		slot_470_61_0 = slot_470_51_0 + slot_0_98_1
		slot_470_62_0 = slot_470_46_0 + slot_470_36_0
		slot_470_63_0 = slot_470_61_0 + slot_470_39_0
		slot_470_64_0 = slot_0_110_11 * slot_470_23_0

		if slot_470_11_0 then
			slot_470_65_1 = color(slot_470_6_0.r, slot_470_6_0.g, slot_470_6_0.b, math.floor(slot_470_6_0.a * slot_470_64_0))
			slot_470_66_1 = color(slot_470_7_0.r, slot_470_7_0.g, slot_470_7_0.b, math.floor(slot_470_7_0.a * slot_470_64_0))

			slot_0_117_10(slot_470_60_0, slot_470_61_0, slot_470_62_0, slot_470_63_0, slot_0_102_5, slot_470_10_0, slot_470_65_1, slot_470_66_1, slot_470_64_0)
		end

		slot_470_65_0 = math.floor(slot_470_40_0 * 0.5)

		render.push_clip_rect(vector(slot_470_44_0 - slot_470_65_0, slot_470_61_0 - 1), vector(slot_470_44_0 + slot_470_65_0, slot_470_63_0 + 2))

		slot_470_66_0 = slot_470_61_0 + slot_0_101_5

		for iter_470_14, iter_470_15 in ipairs(slot_0_115_13) do
			if slot_470_66_0 + slot_470_27_0 > slot_470_63_0 + 4 then
				break
			end

			slot_470_72_0 = slot_470_31_0[iter_470_15]
			slot_470_73_0 = slot_0_118_9(iter_470_15)
			slot_470_74_0 = slot_470_72_0 and slot_470_72_0.active or false
			slot_470_75_0 = slot_470_74_0 and (slot_470_72_0 and slot_0_119_8(slot_470_72_0) or "on") or "off"
			slot_470_76_0 = slot_470_74_0 and 1 or 0.45
			slot_470_77_0 = (slot_0_113_14[iter_470_15] or 0) * slot_470_23_0
			slot_470_78_0 = slot_0_114_14[iter_470_15] or 0
			slot_470_79_0 = math.floor(slot_470_8_0.a * slot_470_77_0 * slot_470_76_0)
			slot_470_80_0 = math.floor(slot_470_9_0.a * slot_470_77_0 * slot_470_76_0)
			slot_470_81_0 = math.floor(slot_470_78_0)
			slot_470_82_0 = slot_470_66_0 + math.floor((slot_0_99_3 - slot_470_27_0) * 0.5)

			render.text(slot_470_26_0, vector(slot_470_60_0 + slot_0_100_4 + slot_470_81_0, slot_470_82_0), color(slot_470_8_0.r, slot_470_8_0.g, slot_470_8_0.b, slot_470_79_0), nil, slot_470_73_0)
			render.text(slot_470_26_0, vector(slot_470_62_0 - slot_0_100_4 + slot_470_81_0, slot_470_82_0), color(slot_470_9_0.r, slot_470_9_0.g, slot_470_9_0.b, slot_470_80_0), "r", slot_470_75_0)

			if slot_470_11_0 and iter_470_14 < slot_470_21_0 then
				slot_470_83_0 = slot_470_66_0 + slot_0_99_3 + 2
				slot_470_84_0 = math.floor(slot_470_7_0.a * 0.35 * slot_470_77_0)

				if slot_470_84_0 > 1 then
					render.line(vector(slot_470_60_0 + slot_0_100_4, slot_470_83_0), vector(slot_470_62_0 - slot_0_100_4, slot_470_83_0), color(slot_470_7_0.r, slot_470_7_0.g, slot_470_7_0.b, slot_470_84_0))
				end
			end

			slot_470_66_0 = slot_470_66_0 + slot_0_99_3 + 4
		end

		render.pop_clip_rect()
	end
end)

slot_0_96_0 = nil
slot_0_97_1 = {
	left = 1,
	forward = 3,
	right = 2
}
slot_0_99_2 = ui.create("DRAGGING_arrows"):slider("arrows:gap", 20, 120, 42)

slot_0_99_2:visibility(false)
slot_0_36_0(function()
	slot_0_99_2:set(42)
end)
table.insert(slot_0_55_0, {
	key = "arr:gap",
	get = function()
		return slot_0_99_2:get()
	end,
	set = function(arg_479_0)
		slot_0_99_2:set(arg_479_0)
	end
})

slot_0_100_3 = 5
slot_0_101_4 = slot_0_100_3 + 2
slot_0_102_4 = slot_0_100_3 * 0.65
slot_0_103_5 = 10
slot_0_104_6 = 14
slot_0_105_7 = render.load_font("Verdana", 22, "bs")

function slot_0_106_8(arg_480_0, arg_480_1, arg_480_2)
	return arg_480_0 + (arg_480_1 - arg_480_0) * arg_480_2
end

function slot_0_107_7(arg_481_0, arg_481_1, arg_481_2, arg_481_3, arg_481_4, arg_481_5, arg_481_6)
	if arg_481_3 < 0.01 then
		return
	end

	if arg_481_6 == "old" then
		slot_481_7_1 = arg_481_5 == 1 and "<" or arg_481_5 == 2 and ">" or arg_481_5 == 3 and "^" or nil

		if not slot_481_7_1 then
			return
		end

		slot_481_8_3 = arg_481_0
		slot_481_9_0 = arg_481_1

		if arg_481_5 == 1 then
			slot_481_8_3 = arg_481_0 - arg_481_4
		elseif arg_481_5 == 2 then
			slot_481_8_3 = arg_481_0 + arg_481_4
		elseif arg_481_5 == 3 then
			slot_481_9_0 = arg_481_1 - arg_481_4
		end

		slot_481_10_0 = render.measure_text(slot_0_105_7, nil, slot_481_7_1)

		render.text(slot_0_105_7, vector(math.floor(slot_481_8_3 - slot_481_10_0.x * 0.5), math.floor(slot_481_9_0 - slot_481_10_0.y * 0.5)), color(arg_481_2.r, arg_481_2.g, arg_481_2.b, math.max(0, math.min(255, math.floor(arg_481_2.a * arg_481_3)))), nil, slot_481_7_1)

		return
	end

	function slot_481_7_0(arg_482_0, arg_482_1, arg_482_2, arg_482_3, arg_482_4)
		render.line(vector(arg_482_0, arg_482_1), vector(arg_482_2, arg_482_3), color(arg_481_2.r, arg_481_2.g, arg_481_2.b, math.max(0, math.min(255, math.floor(arg_481_2.a * arg_481_3 * arg_482_4)))))
	end

	if arg_481_5 == 1 then
		slot_481_8_2 = arg_481_0 - arg_481_4

		slot_481_7_0(slot_481_8_2, arg_481_1, slot_481_8_2 + slot_0_101_4, arg_481_1 - slot_0_101_4, 0.22)
		slot_481_7_0(slot_481_8_2, arg_481_1, slot_481_8_2 + slot_0_101_4, arg_481_1 + slot_0_101_4, 0.22)
		slot_481_7_0(slot_481_8_2, arg_481_1, slot_481_8_2 + slot_0_100_3, arg_481_1 - slot_0_100_3, 0.6)
		slot_481_7_0(slot_481_8_2, arg_481_1, slot_481_8_2 + slot_0_100_3, arg_481_1 + slot_0_100_3, 0.6)
		slot_481_7_0(slot_481_8_2, arg_481_1, slot_481_8_2 + slot_0_102_4, arg_481_1 - slot_0_102_4, 1)
		slot_481_7_0(slot_481_8_2, arg_481_1, slot_481_8_2 + slot_0_102_4, arg_481_1 + slot_0_102_4, 1)
	elseif arg_481_5 == 2 then
		slot_481_8_1 = arg_481_0 + arg_481_4

		slot_481_7_0(slot_481_8_1, arg_481_1, slot_481_8_1 - slot_0_101_4, arg_481_1 - slot_0_101_4, 0.22)
		slot_481_7_0(slot_481_8_1, arg_481_1, slot_481_8_1 - slot_0_101_4, arg_481_1 + slot_0_101_4, 0.22)
		slot_481_7_0(slot_481_8_1, arg_481_1, slot_481_8_1 - slot_0_100_3, arg_481_1 - slot_0_100_3, 0.6)
		slot_481_7_0(slot_481_8_1, arg_481_1, slot_481_8_1 - slot_0_100_3, arg_481_1 + slot_0_100_3, 0.6)
		slot_481_7_0(slot_481_8_1, arg_481_1, slot_481_8_1 - slot_0_102_4, arg_481_1 - slot_0_102_4, 1)
		slot_481_7_0(slot_481_8_1, arg_481_1, slot_481_8_1 - slot_0_102_4, arg_481_1 + slot_0_102_4, 1)
	elseif arg_481_5 == 3 then
		slot_481_8_0 = arg_481_1 - arg_481_4

		slot_481_7_0(arg_481_0, slot_481_8_0, arg_481_0 - slot_0_101_4, slot_481_8_0 + slot_0_101_4, 0.22)
		slot_481_7_0(arg_481_0, slot_481_8_0, arg_481_0 + slot_0_101_4, slot_481_8_0 + slot_0_101_4, 0.22)
		slot_481_7_0(arg_481_0, slot_481_8_0, arg_481_0 - slot_0_100_3, slot_481_8_0 + slot_0_100_3, 0.6)
		slot_481_7_0(arg_481_0, slot_481_8_0, arg_481_0 + slot_0_100_3, slot_481_8_0 + slot_0_100_3, 0.6)
		slot_481_7_0(arg_481_0, slot_481_8_0, arg_481_0 - slot_0_102_4, slot_481_8_0 + slot_0_102_4, 1)
		slot_481_7_0(arg_481_0, slot_481_8_0, arg_481_0 + slot_0_102_4, slot_481_8_0 + slot_0_102_4, 1)
	end
end

slot_0_108_8 = {
	hover_anim = 0,
	grab_anim = 0,
	grabbed_id = 0,
	dragging = false,
	drag_start_gap = 0,
	drag_start_x = 0
}

function slot_0_109_9(arg_483_0, arg_483_1, arg_483_2)
	if not arg_483_2 then
		slot_0_108_8.dragging = false
		slot_0_108_8.grab_anim = slot_0_108_8.grab_anim + (0 - slot_0_108_8.grab_anim) * 0.1

		return
	end

	local var_483_0 = false

	if slot_0_19_0 then
		local var_483_1, var_483_2 = pcall(function()
			return slot_0_19_0:get()
		end)

		var_483_0 = var_483_1 and var_483_2 == 2
	end

	if not var_483_0 then
		slot_0_108_8.dragging = false

		return
	end

	local var_483_3 = ui.get_mouse_position()
	local var_483_4 = common.is_button_down(1)
	local var_483_5 = slot_0_99_2:get()
	local var_483_6 = var_483_5

	if var_483_4 and not slot_0_37_0.visible then
		if not slot_0_108_8.dragging then
			if slot_0_34_0 == nil then
				for iter_483_0, iter_483_1 in ipairs({
					1,
					2
				}) do
					local var_483_7 = iter_483_1 == 1 and arg_483_0 - var_483_6 or arg_483_0 + var_483_6
					local var_483_8 = 16

					if var_483_8 > math.abs(var_483_3.x - var_483_7) and var_483_8 > math.abs(var_483_3.y - arg_483_1) then
						slot_0_108_8.dragging = true
						slot_0_34_0 = slot_0_108_8
						slot_0_108_8.drag_start_x = var_483_3.x
						slot_0_108_8.drag_start_gap = var_483_5
						slot_0_108_8.grabbed_id = iter_483_1

						break
					end
				end
			end
		else
			local var_483_9 = var_483_3.x - slot_0_108_8.drag_start_x
			local var_483_10

			if slot_0_108_8.grabbed_id == 1 then
				var_483_10 = slot_0_108_8.drag_start_gap - var_483_9
			else
				var_483_10 = slot_0_108_8.drag_start_gap + var_483_9
			end

			local var_483_11 = math.max(20, math.min(120, var_483_10))

			slot_0_99_2:set(var_483_11)
		end
	else
		if slot_0_108_8.dragging then
			slot_0_34_0 = nil
		end

		slot_0_108_8.dragging = false
	end

	local var_483_12 = slot_0_108_8.dragging and 1 or 0

	slot_0_108_8.grab_anim = slot_0_108_8.grab_anim + (var_483_12 - slot_0_108_8.grab_anim) * 0.14

	local var_483_13 = slot_0_99_2:get()
	local var_483_14 = ui.get_mouse_position()
	local var_483_15 = false

	for iter_483_2, iter_483_3 in ipairs({
		1,
		2
	}) do
		local var_483_16 = iter_483_3 == 1 and arg_483_0 - var_483_13 or arg_483_0 + var_483_13

		if math.abs(var_483_14.x - var_483_16) < 20 and math.abs(var_483_14.y - arg_483_1) < 20 then
			var_483_15 = true
		end
	end

	local var_483_17 = var_483_15 and 1 or 0

	slot_0_108_8.hover_anim = (slot_0_108_8.hover_anim or 0) + (var_483_17 - (slot_0_108_8.hover_anim or 0)) * 0.12
end

slot_0_110_10 = {
	{
		a = 0,
		d = 0
	},
	{
		a = 0,
		d = 0
	},
	{
		a = 0,
		d = 0
	}
}

function slot_0_111_16(arg_485_0, arg_485_1, arg_485_2, arg_485_3, arg_485_4, arg_485_5)
	local var_485_0 = arg_485_4 + slot_0_103_5

	for iter_485_0 = 1, 3 do
		local var_485_1 = arg_485_3 == iter_485_0 and 1 or 0

		slot_0_110_10[iter_485_0].a = slot_0_106_8(slot_0_110_10[iter_485_0].a, var_485_1, 0.14)
		slot_0_110_10[iter_485_0].d = slot_0_106_8(slot_0_110_10[iter_485_0].d, var_485_1, 0.12)

		if slot_0_110_10[iter_485_0].a > 0.01 then
			slot_0_107_7(arg_485_0, arg_485_1, arg_485_2, slot_0_110_10[iter_485_0].a, arg_485_4 + (var_485_0 - arg_485_4) * slot_0_110_10[iter_485_0].d, iter_485_0, arg_485_5)
		end
	end
end

slot_0_112_15 = 6
slot_0_113_13 = 55
slot_0_114_13 = 0
slot_0_115_12 = 0
slot_0_116_9 = 0
slot_0_117_9 = 0
slot_0_118_8 = 0
slot_0_119_7 = 0
slot_0_120_7 = 0
slot_0_121_7 = 0
slot_0_122_8 = 0

function slot_0_123_5(arg_486_0)
	if not arg_486_0 then
		return 0
	end

	local var_486_0 = entity.get_threat(true)

	if not var_486_0 or var_486_0:is_dormant() or not var_486_0:is_alive() then
		return 0
	end

	local var_486_1 = arg_486_0:get_origin()
	local var_486_2 = 0

	pcall(function()
		local var_487_0 = arg_486_0:get_anim_state()

		if var_487_0 then
			var_486_2 = var_487_0.foot_yaw
		end
	end)

	local var_486_3, var_486_4 = pcall(function()
		return var_486_0:get_origin() - var_486_1
	end)

	if not var_486_3 or not var_486_4 then
		return 0
	end

	local var_486_5 = math.deg(math.atan2(var_486_4.y, var_486_4.x)) - var_486_2

	while var_486_5 > 180 do
		var_486_5 = var_486_5 - 360
	end

	while var_486_5 < -180 do
		var_486_5 = var_486_5 + 360
	end

	return var_486_5 < 0 and 1 or 2
end

function slot_0_124_5(arg_489_0, arg_489_1, arg_489_2, arg_489_3, arg_489_4, arg_489_5)
	local var_489_0 = arg_489_3.color_enemy:get()
	local var_489_1 = arg_489_3.color_opposite:get()
	local var_489_2 = slot_0_123_5(arg_489_2)

	if var_489_2 ~= 0 then
		slot_0_117_9 = 0

		if var_489_2 == slot_0_115_12 then
			slot_0_116_9 = slot_0_116_9 + 1
		else
			slot_0_115_12 = var_489_2
			slot_0_116_9 = 1
		end

		if slot_0_116_9 >= slot_0_112_15 then
			slot_0_114_13 = slot_0_115_12
		end
	else
		slot_0_116_9 = 0
		slot_0_117_9 = slot_0_117_9 + 1

		if slot_0_117_9 >= slot_0_113_13 then
			slot_0_114_13 = 0
		end
	end

	local var_489_3 = slot_0_114_13 ~= 0

	slot_0_122_8 = slot_0_106_8(slot_0_122_8, var_489_3 and 1 or 0, var_489_3 and 0.1 or 0.03)
	slot_0_118_8 = slot_0_106_8(slot_0_118_8, slot_0_122_8, var_489_3 and 0.14 or 0.05)

	if slot_0_118_8 < 0.004 then
		slot_0_119_7 = 0
		slot_0_120_7 = 0
		slot_0_121_7 = 0
		slot_0_122_8 = 0

		return
	end

	slot_0_119_7 = slot_0_106_8(slot_0_119_7, slot_0_118_8 * 0.55, 0.1)

	local var_489_4 = var_489_3 and 1 or 0

	slot_0_120_7 = slot_0_106_8(slot_0_120_7, var_489_4, 0.12)
	slot_0_121_7 = slot_0_106_8(slot_0_121_7, var_489_4, 0.08)

	local var_489_5 = arg_489_4 + slot_0_103_5
	local var_489_6 = arg_489_4 + (var_489_5 - arg_489_4) * slot_0_120_7
	local var_489_7 = arg_489_4 + (var_489_5 - arg_489_4) * slot_0_121_7 + slot_0_104_6
	local var_489_8 = slot_0_114_13 ~= 0 and slot_0_114_13 or 2
	local var_489_9 = var_489_8 == 1 and 2 or 1

	slot_0_107_7(arg_489_0, arg_489_1, var_489_0, slot_0_118_8, var_489_6, var_489_8, arg_489_5)
	slot_0_107_7(arg_489_0, arg_489_1, var_489_0, slot_0_119_7, var_489_7, var_489_8, arg_489_5)
	slot_0_107_7(arg_489_0, arg_489_1, var_489_1, slot_0_118_8 * 0.7, var_489_6, var_489_9, arg_489_5)
end

slot_0_125_5 = 2
slot_0_126_6 = 0
slot_0_127_4 = 0
slot_0_128_5 = 0

function slot_0_129_3(arg_490_0, arg_490_1, arg_490_2, arg_490_3)
	local var_490_0 = slot_0_99_2:get()
	local var_490_1 = var_490_0 + slot_0_103_5
	local var_490_2 = arg_490_2.color_enemy:get()
	local var_490_3 = arg_490_2.color_opposite:get()

	if globals.realtime > slot_0_126_6 then
		slot_0_125_5 = slot_0_125_5 == 1 and 2 or 1
		slot_0_126_6 = globals.realtime + 2.2
	end

	local var_490_4 = 1

	slot_0_127_4 = slot_0_127_4 + (var_490_4 - slot_0_127_4) * 0.08
	slot_0_128_5 = slot_0_128_5 + (slot_0_127_4 * 0.55 - slot_0_128_5) * 0.1

	local var_490_5 = var_490_0 + (var_490_1 - var_490_0) * 0.8
	local var_490_6 = var_490_5 + slot_0_104_6
	local var_490_7 = slot_0_125_5
	local var_490_8 = var_490_7 == 1 and 2 or 1

	slot_0_107_7(arg_490_0, arg_490_1, var_490_2, slot_0_127_4 * 0.7, var_490_5, var_490_7, arg_490_3)
	slot_0_107_7(arg_490_0, arg_490_1, var_490_2, slot_0_128_5 * 0.5, var_490_6, var_490_7, arg_490_3)
	slot_0_107_7(arg_490_0, arg_490_1, var_490_3, slot_0_127_4 * 0.5, var_490_5, var_490_8, arg_490_3)

	local var_490_9 = math.max(slot_0_108_8.hover_anim or 0, slot_0_108_8.grab_anim)

	if var_490_9 > 0.005 then
		local var_490_10 = math.floor((slot_0_101_4 + slot_0_103_5) * 2.2)
		local var_490_11 = math.floor((slot_0_101_4 + slot_0_103_5) * 2.2)

		if slot_0_108_8.grab_anim > 0.01 and slot_0_108_8.grabbed_id > 0 then
			local var_490_12 = slot_0_108_8.grabbed_id == 1 and arg_490_0 - var_490_0 or arg_490_0 + var_490_0

			slot_0_48_0(vector(var_490_12, arg_490_1), vector(var_490_10, var_490_11), var_490_9)
		else
			slot_0_48_0(vector(arg_490_0 - var_490_0, arg_490_1), vector(var_490_10, var_490_11), var_490_9)
			slot_0_48_0(vector(arg_490_0 + var_490_0, arg_490_1), vector(var_490_10, var_490_11), var_490_9)
		end
	end
end

events.render(function()
	local var_491_0 = slot_0_59_0.visuals.manual_arrows

	if not var_491_0.switch:get() then
		slot_0_118_8 = 0
		slot_0_119_7 = 0
		slot_0_122_8 = 0
		slot_0_114_13 = 0
		slot_0_115_12 = 0
		slot_0_116_9 = 0
		slot_0_117_9 = 0
		slot_0_108_8.dragging = false

		return
	end

	local var_491_1 = render.screen_size()
	local var_491_2 = var_491_1.x * 0.5
	local var_491_3 = var_491_1.y * 0.5
	local var_491_4 = ui.get_alpha() > 0
	local var_491_5 = slot_0_99_2:get()
	local var_491_6 = var_491_5 + slot_0_103_5

	slot_0_109_9(var_491_2, var_491_3, var_491_4)

	local var_491_7 = var_491_0.style and var_491_0.style:get() or "modern"

	if var_491_4 then
		local var_491_8 = false

		if slot_0_19_0 then
			local var_491_9, var_491_10 = pcall(function()
				return slot_0_19_0:get()
			end)

			var_491_8 = var_491_9 and var_491_10 == 2
		end

		if var_491_8 then
			slot_0_129_3(var_491_2, var_491_3, var_491_0, var_491_7)

			return
		end
	end

	local var_491_11 = entity.get_local_player()

	if not var_491_11 or not var_491_11:is_alive() then
		return
	end

	local var_491_12 = slot_0_59_0.antiaim.general.manual_yaw.select:get()
	local var_491_13 = var_491_12 ~= "disabled"

	if var_491_13 then
		slot_0_111_16(var_491_2, var_491_3, var_491_0.color:get(), slot_0_97_1[var_491_12] or -1, var_491_5, var_491_7)
	else
		for iter_491_0 = 1, 3 do
			slot_0_110_10[iter_491_0].a = slot_0_106_8(slot_0_110_10[iter_491_0].a, 0, 0.14)

			if slot_0_110_10[iter_491_0].a > 0.01 then
				slot_0_107_7(var_491_2, var_491_3, var_491_0.color:get(), slot_0_110_10[iter_491_0].a, var_491_5 + (var_491_6 - var_491_5) * slot_0_110_10[iter_491_0].d, iter_491_0, var_491_7)
			end
		end
	end

	if var_491_0.dynamic:get() and not var_491_13 then
		slot_0_124_5(var_491_2, var_491_3, var_491_11, var_491_0, var_491_5, var_491_7)
	elseif var_491_13 then
		slot_0_118_8 = slot_0_106_8(slot_0_118_8, 0, 0.08)
		slot_0_119_7 = slot_0_106_8(slot_0_119_7, 0, 0.08)
		slot_0_122_8 = 0

		if slot_0_118_8 < 0.005 then
			slot_0_114_13 = 0
			slot_0_115_12 = 0
			slot_0_116_9 = 0
			slot_0_117_9 = 0
		end
	end
end)

slot_0_97_0 = {
	data = {},
	icon = render.load_image_from_file("materials/panorama/images/icons/ui/bomb_c4.svg", vector(32, 32)),
	font = render.load_font("Calibri Bold", vector(25, 23.5, 0), "da"),
	progress_bar = function(arg_493_0, arg_493_1, arg_493_2, arg_493_3, arg_493_4)
		local var_493_0 = arg_493_4 * arg_493_3

		render.rect(vector(0, 0), vector(20, arg_493_4), color(0, 0, 0, 120))
		render.rect(vector(1, var_493_0 + 1), vector(19, var_493_0 + 1 + arg_493_4 - var_493_0 - 3), color(arg_493_0, arg_493_1, arg_493_2, 120))
	end
}

function slot_0_97_0.indicator(arg_494_0, arg_494_1, arg_494_2, arg_494_3)
	slot_0_97_0.data[#slot_0_97_0.data + 1] = {
		clr = arg_494_0,
		text = arg_494_1,
		pct = arg_494_2 or -1,
		should_draw_bomb = arg_494_3 or false
	}
end

slot_0_98_0 = nil
slot_0_99_1 = slot_0_52_0:new("crosshair_indicators", vector(slot_0_14_0.x * 0.5, slot_0_14_0.y * 0.5 + 22), "y")
slot_0_100_2 = render.load_font("Verdana", 11, "a")
slot_0_101_3 = 2
slot_0_102_3 = render.load_font("Verdana Bold", 12, "ab")
slot_0_103_4 = render.load_font("Verdana", 10, "ab")
slot_0_104_5 = 2
slot_0_105_6 = render.load_font("Verdana Bold", 10, "ab")
slot_0_106_7 = render.load_font("Calibri Bold", 14, "ab")
slot_0_107_6 = render.load_font("Calibri Bold", 10, "ab")
slot_0_108_7 = 0

function slot_0_109_8(arg_495_0)
	if arg_495_0 and arg_495_0.font then
		local var_495_0 = arg_495_0.font:get()

		if var_495_0 == "normal" then
			return 1
		end

		if var_495_0 == "pixel" then
			return 2
		end

		if var_495_0 == "bold" then
			return slot_0_102_3
		end
	end

	return slot_0_102_3
end

function slot_0_110_9(arg_496_0)
	if arg_496_0 and arg_496_0.font and arg_496_0.font:get() == "pixel" then
		return slot_0_104_5
	end

	if arg_496_0 and arg_496_0.font and arg_496_0.font:get() == "bold" then
		return slot_0_105_6
	end

	return slot_0_103_4
end

slot_0_111_15 = slot_0_100_2
slot_0_112_14 = {}
slot_0_113_12 = {}
slot_0_114_12 = {}
slot_0_115_11 = ""
slot_0_116_8 = ""
slot_0_117_8 = 1
slot_0_118_7 = 165
slot_0_119_6 = 39
slot_0_120_6 = {
	was_scoped = false,
	x_current = 0,
	x_settled = 0,
	blur_alpha = 0
}
slot_0_121_6 = 1
slot_0_122_7 = slot_0_5_0.new(1)

function slot_0_123_4(arg_497_0, arg_497_1, arg_497_2)
	if slot_0_112_14[arg_497_0] == nil then
		slot_0_112_14[arg_497_0] = arg_497_1
	end

	slot_0_112_14[arg_497_0] = slot_0_112_14[arg_497_0] + (arg_497_1 - slot_0_112_14[arg_497_0]) * arg_497_2

	return slot_0_112_14[arg_497_0]
end

function slot_0_124_4(arg_498_0, arg_498_1, arg_498_2)
	arg_498_2 = math.max(0, math.min(1, arg_498_2))

	return color(math.floor(arg_498_0.r + (arg_498_1.r - arg_498_0.r) * arg_498_2), math.floor(arg_498_0.g + (arg_498_1.g - arg_498_0.g) * arg_498_2), math.floor(arg_498_0.b + (arg_498_1.b - arg_498_0.b) * arg_498_2), math.floor(arg_498_0.a + (arg_498_1.a - arg_498_0.a) * arg_498_2))
end

function slot_0_125_4(arg_499_0)
	if not arg_499_0 then
		return false
	end

	local var_499_0 = arg_499_0:get_player_weapon()

	if not var_499_0 then
		return false
	end

	local var_499_1 = var_499_0:get_weapon_info()

	if not var_499_1 or var_499_1.weapon_type ~= 9 then
		return false
	end

	return true
end

slot_0_126_5 = {
	pulse = 0,
	scope = 0,
	dt = {
		active = 0,
		alpha = 0,
		last_text = "",
		adder = 0,
		fraction = 0,
		recharge = {
			0,
			0
		}
	},
	hs = {
		active = 0,
		alpha = 0,
		last_text = "",
		adder = 0,
		fraction = 0,
		inactive = {
			0,
			0,
			0
		}
	},
	fs = {
		fraction = 0,
		alpha = 0,
		last_text = "",
		adder = 0,
		disabled = {
			0,
			0,
			0
		}
	},
	state = {
		fraction = 0
	},
	star = {
		alpha = 1
	}
}
slot_0_127_3 = 0

function slot_0_128_4(arg_500_0, arg_500_1, arg_500_2, arg_500_3, arg_500_4)
	local var_500_0 = ""
	local var_500_1 = arg_500_0:len()

	for iter_500_0 = 1, var_500_1 do
		local var_500_2 = arg_500_4 and 1 - arg_500_3 - (var_500_1 - iter_500_0) / (var_500_1 - 1) + (1 - arg_500_3) or iter_500_0 - arg_500_3 * var_500_1
		local var_500_3 = math.max(0, math.min(1, var_500_2))
		local var_500_4 = slot_0_124_4(arg_500_1, arg_500_2, var_500_3)
		local var_500_5 = string.format("%02x%02x%02x%02x", var_500_4.r, var_500_4.g, var_500_4.b, var_500_4.a)
		local var_500_6 = ("\a%s%s"):format(var_500_5, arg_500_0:sub(iter_500_0, iter_500_0))

		var_500_0 = var_500_0 .. var_500_6
	end

	return var_500_0
end

function slot_0_129_2(arg_501_0, arg_501_1, arg_501_2, arg_501_3)
	slot_501_4_0 = math.max(0.001, arg_501_2)
	slot_0_127_3 = slot_0_127_3 + slot_501_4_0
	slot_501_5_0 = slot_0_99_1.position
	slot_501_6_1 = arg_501_0.m_col_accent and arg_501_0.m_col_accent:get() or color(200, 200, 210, 255)
	slot_501_6_0 = color(slot_501_6_1.r, slot_501_6_1.g, slot_501_6_1.b, 255)
	slot_501_7_0 = 0.07
	slot_501_8_0 = 0.055
	slot_501_9_0 = slot_0_109_8(arg_501_0)
	slot_501_10_0 = slot_501_9_0 == 1
	slot_501_11_0 = slot_501_9_0 == 2
	slot_501_12_0 = slot_501_11_0 and string.upper or string.lower

	function slot_501_13_0(arg_502_0)
		return slot_501_12_0(arg_502_0)
	end

	slot_501_14_0 = slot_501_10_0 and " " or "  "
	slot_501_15_0 = vector()
	slot_501_16_0 = arg_501_1.m_bIsScoped == true
	slot_0_126_5.scope = math.max(0, math.min(1, slot_0_126_5.scope + (slot_501_16_0 and slot_501_4_0 * 3.5 or -slot_501_4_0 * 3.5)))
	slot_501_17_0 = slot_0_6_0.quad_in_out(slot_0_126_5.scope, 0, 1, 1)
	slot_0_126_5.star.alpha = math.max(0, math.min(1, slot_0_126_5.star.alpha + (slot_501_16_0 and -slot_501_4_0 * 4 or slot_501_4_0 * 4)))
	slot_501_18_0 = slot_0_6_0.quad_in_out(slot_0_126_5.star.alpha, 0, 1, 1)

	if slot_0_126_5.scope > 0.99 then
		slot_0_126_5.pulse = slot_0_126_5.pulse + slot_501_4_0 * 4
	else
		slot_0_126_5.pulse = 0
	end

	slot_501_19_0 = 1

	if slot_0_126_5.pulse > 0 then
		slot_501_19_0 = 0.5 + 0.5 * math.abs(math.sin(slot_0_126_5.pulse))
	end

	slot_501_20_4 = slot_501_13_0("elysian")
	slot_501_21_5 = arg_501_0.col_wave and arg_501_0.col_wave:get() or color(255, 255, 255, 255)
	slot_501_23_4 = (math.sin(globals.realtime * 1.6) + 1) * 0.5 * 1.4 - 0.2
	slot_501_24_4 = 0
	slot_501_25_4 = {}

	for iter_501_0 = 1, #slot_501_20_4 do
		slot_501_30_7 = slot_501_20_4:sub(iter_501_0, iter_501_0)
		slot_501_31_5 = render.measure_text(slot_501_9_0, nil, slot_501_30_7).x
		slot_501_32_4 = slot_501_11_0 and 2 or 0
		slot_501_25_4[iter_501_0] = {
			char = slot_501_30_7,
			w = slot_501_31_5,
			gap = slot_501_32_4
		}
		slot_501_24_4 = slot_501_24_4 + slot_501_31_5 + (iter_501_0 < #slot_501_20_4 and slot_501_32_4 or 0)
	end

	slot_501_26_4 = render.measure_text(slot_501_9_0, nil, slot_501_20_4).y
	slot_501_27_4 = vector(slot_501_24_4, slot_501_26_4)
	slot_501_28_4 = vector(math.floor(-(slot_501_27_4.x / 2) * (1 - slot_501_17_0) + 8 * slot_501_17_0))

	if arg_501_0.glow and arg_501_0.glow:get() then
		slot_501_30_6 = arg_501_0.glow_color and arg_501_0.glow_color:get() or slot_501_6_0

		render.rect(slot_501_5_0 + slot_501_28_4 + vector(1, 6), slot_501_5_0 + slot_501_28_4 + slot_501_27_4 + vector(1, 5) - vector(2, 10), color(slot_501_30_6.r, slot_501_30_6.g, slot_501_30_6.b, math.floor(70 * slot_501_19_0)), 5)
		render.shadow(slot_501_5_0 + slot_501_28_4 + vector(5, 6), slot_501_5_0 + slot_501_28_4 + slot_501_27_4 + vector(5, 5) - vector(10, 10), color(slot_501_30_6.r, slot_501_30_6.g, slot_501_30_6.b, math.floor(slot_501_30_6.a * slot_501_19_0)), nil, nil, 5)
	end

	slot_501_30_5 = 0

	for iter_501_1 = 1, #slot_501_25_4 do
		slot_501_35_3 = (iter_501_1 - 1) / math.max(#slot_501_20_4 - 1, 1)
		slot_501_36_2 = math.abs(slot_501_35_3 - slot_501_23_4)
		slot_501_37_4 = math.max(0, 1 - slot_501_36_2 / 0.12)
		slot_501_37_3 = slot_501_37_4 * slot_501_37_4 * slot_501_37_4 * slot_501_37_4
		slot_501_38_4 = math.max(0, 1 - slot_501_36_2 / 0.5)
		slot_501_38_3 = slot_501_38_4 * slot_501_38_4 * 0.35
		slot_501_39_2 = math.min(1, slot_501_37_3 + slot_501_38_3)
		slot_501_40_2 = math.floor(slot_501_6_0.r + (slot_501_21_5.r - slot_501_6_0.r) * slot_501_39_2)
		slot_501_41_2 = math.floor(slot_501_6_0.g + (slot_501_21_5.g - slot_501_6_0.g) * slot_501_39_2)
		slot_501_42_1 = math.floor(slot_501_6_0.b + (slot_501_21_5.b - slot_501_6_0.b) * slot_501_39_2)
		slot_501_43_1 = color(slot_501_40_2, slot_501_41_2, slot_501_42_1, math.floor(255 * slot_501_19_0))

		render.text(slot_501_9_0, slot_501_5_0 + slot_501_28_4 + vector(slot_501_30_5, 0), slot_501_43_1, nil, slot_501_25_4[iter_501_1].char)

		slot_501_30_5 = slot_501_30_5 + slot_501_25_4[iter_501_1].w + slot_501_25_4[iter_501_1].gap
	end

	slot_501_15_0.y = slot_501_15_0.y + (slot_501_27_4.y - 2)
	slot_501_31_4 = ui.get_alpha() > 0
	slot_501_32_3 = false

	if slot_501_31_4 and slot_0_19_0 then
		slot_501_33_3, slot_501_34_3 = pcall(function()
			return slot_0_19_0:get()
		end)
		slot_501_32_3 = slot_501_33_3 and slot_501_34_3 == 2
	end

	if slot_501_32_3 then
		slot_0_99_1:update(vector(slot_501_27_4.x, slot_501_27_4.y + 10))
	end

	if arg_501_0.m_show_state and arg_501_0.m_show_state:get() then
		slot_501_20_3 = false

		pcall(function()
			slot_501_20_3 = slot_0_11_0.antiaim.misc.fake_duck:get()
		end)

		slot_501_21_4 = nil

		if slot_0_73_0.active then
			slot_501_21_3 = "safehead"
		elseif slot_501_20_3 then
			slot_501_21_3 = "fakeduck"
		else
			slot_501_22_4 = slot_0_70_0.visual(slot_0_75_0.is_working) or slot_0_70_0.get(slot_0_75_0.is_working) or "standing"
			slot_501_21_3 = ({
				running = "moving",
				["legit aa"] = "legit",
				air = "air",
				["air crouching"] = "air crouch",
				slowing = "slowwalk",
				sneaking = "crouch",
				crouching = "crouch",
				standing = "standing"
			})[slot_501_22_4] or "standing"
		end

		slot_501_22_3 = slot_501_13_0(slot_501_21_3)
		slot_501_23_3 = render.measure_text(slot_501_9_0, nil, slot_501_22_3)
		slot_501_24_3 = "·"
		slot_501_25_3 = "·"
		slot_501_26_3 = render.measure_text(slot_501_9_0, nil, slot_501_24_3)
		slot_0_126_5.state.fraction = slot_0_6_0.linear(slot_501_4_0, slot_0_126_5.state.fraction, slot_501_23_3.x + 3 - slot_0_126_5.state.fraction, slot_501_8_0)
		slot_501_27_3 = math.floor(slot_0_126_5.state.fraction)
		slot_501_28_3 = vector(math.floor(-(slot_501_23_3.x / 2) * (1 - slot_501_17_0) * (math.max(1, slot_501_27_3) / (slot_501_23_3.x + 3)) + (slot_501_26_3.x + 2) * slot_501_17_0 + 8 * slot_501_17_0 + 0.5))

		render.push_clip_rect(slot_501_5_0 + slot_501_28_3 + slot_501_15_0, slot_501_5_0 + slot_501_28_3 + slot_501_15_0 + vector(slot_501_27_3, slot_501_23_3.y + 5))
		render.text(slot_501_9_0, slot_501_5_0 + slot_501_28_3 + slot_501_15_0, color(255, 255, 255, math.floor(255 * slot_501_19_0)), nil, slot_501_22_3)
		render.pop_clip_rect()

		slot_501_29_5 = vector(math.floor((-slot_501_27_3 / 2 - slot_501_26_3.x - 1) * (1 - slot_501_17_0) + 8 * slot_501_17_0 + 0.6))
		slot_501_30_4 = vector(math.floor(slot_501_27_3 / 2 * (1 + slot_501_17_0) + (slot_501_26_3.x + 1) * slot_501_17_0 + 8 * slot_501_17_0 + 0.6))
		slot_501_31_3 = color(255, 255, 255, math.floor(255 * slot_501_19_0))

		render.text(slot_501_9_0, slot_501_5_0 + slot_501_29_5 + slot_501_15_0, slot_501_31_3, nil, slot_501_24_3)
		render.text(slot_501_9_0, slot_501_5_0 + slot_501_30_4 + slot_501_15_0, slot_501_31_3, nil, slot_501_25_3)

		slot_501_15_0.y = slot_501_15_0.y + (slot_501_23_3.y - 2)
	end

	if arg_501_0.m_show_dt and arg_501_0.m_show_dt:get() then
		slot_501_20_2 = rage.exploit:get() == 1
		slot_501_21_2, slot_501_22_2 = pcall(function()
			return slot_0_11_0.rage.main.double_tap:get()
		end)
		slot_501_23_2 = slot_501_21_2 and slot_501_22_2 and not slot_0_78_0.is_active
		slot_0_126_5.dt.alpha = math.max(0, math.min(1, slot_0_126_5.dt.alpha + (slot_501_23_2 and slot_501_4_0 * 2.5 or -slot_501_4_0 * 2.5)))
		slot_501_24_2 = slot_0_126_5.dt.alpha
		slot_501_25_2 = 0
		slot_501_26_2 = slot_501_13_0("dt")
		slot_501_27_2 = render.measure_text(slot_501_9_0, nil, slot_501_26_2)
		slot_501_28_2 = ""

		if slot_501_24_2 > 0 then
			if slot_501_23_2 and slot_501_24_2 > 0.1 then
				slot_501_25_2 = slot_501_25_2 + slot_501_27_2.x
			end

			slot_0_126_5.dt.recharge[1] = math.max(0, math.min(1, slot_0_126_5.dt.recharge[1] + (slot_501_24_2 == 1 and slot_501_20_2 and slot_501_4_0 * 2.5 or -slot_501_4_0 * 2.5)))
			slot_501_29_4 = slot_0_126_5.dt.recharge[1]
			slot_0_126_5.dt.recharge[2] = math.max(0, math.min(1, slot_0_126_5.dt.recharge[2] + (slot_501_29_4 == 1 and slot_501_4_0 * 3.5 or -slot_501_4_0 * 3.5)))
			slot_501_30_3 = slot_0_126_5.dt.recharge[2]
			slot_501_31_2 = slot_501_13_0("charging")
			slot_501_32_2 = slot_0_128_4(slot_501_31_2, color(150, 220, 160, math.floor(255 * slot_501_19_0)), color(255, 66, 66, math.floor(255 * slot_501_19_0)), slot_501_29_4, true)
			slot_501_33_2 = render.measure_text(slot_501_9_0, nil, slot_501_14_0 .. slot_501_31_2)
			slot_0_126_5.dt.active = math.max(0, math.min(1, slot_0_126_5.dt.active + (slot_501_30_3 == 1 and slot_501_4_0 * 1.5 or -slot_501_4_0 * 3)))
			slot_501_34_2 = slot_0_126_5.dt.active
			slot_501_35_2 = slot_501_13_0("charged")
			slot_501_36_1 = slot_0_128_4(slot_501_35_2, color(150, 220, 160, math.floor(255 * slot_501_19_0)), color(255, 255, 255, math.floor(50 * slot_501_19_0)), slot_501_34_2, true)
			slot_501_37_2 = render.measure_text(slot_501_9_0, nil, slot_501_14_0 .. slot_501_35_2)

			if slot_501_23_2 and slot_501_24_2 > 0.95 then
				slot_501_25_2 = slot_501_25_2 + slot_501_33_2.x
			end

			if slot_501_30_3 < 1 then
				slot_501_28_2 = slot_501_14_0 .. slot_501_32_2
			end

			if slot_501_30_3 > 0 then
				slot_501_25_2 = slot_501_27_2.x
			end

			if slot_501_30_3 > 0.5 then
				slot_501_28_2 = slot_501_14_0 .. slot_501_36_1
			end

			if slot_501_30_3 == 1 then
				slot_501_25_2 = slot_501_25_2 + slot_501_37_2.x
			end

			if slot_501_23_2 then
				slot_0_126_5.dt.last_text = slot_501_28_2
			end

			if not slot_501_23_2 or slot_501_24_2 == 0 then
				slot_501_25_2 = 0
			end

			slot_0_126_5.dt.fraction = slot_0_6_0.linear(slot_501_4_0, slot_0_126_5.dt.fraction, slot_501_25_2 - slot_0_126_5.dt.fraction, slot_501_7_0)
			slot_501_38_2 = math.floor(slot_0_126_5.dt.fraction)
			slot_501_40_1 = string.format("\a%02x%02x%02x%02x", 255, 255, 255, math.floor(255 * slot_501_19_0)) .. slot_501_26_2 .. slot_0_126_5.dt.last_text
			slot_501_41_1 = render.measure_text(slot_501_9_0, nil, slot_501_26_2 .. string.gsub(slot_0_126_5.dt.last_text, "\a%x%x%x%x%x%x%x%x", ""))
			slot_501_42_0 = vector(math.floor(-(slot_501_41_1.x / 2) * (1 - slot_501_17_0) * (slot_501_38_2 / math.max(1, slot_501_41_1.x)) + 8 * slot_501_17_0))

			render.push_clip_rect(slot_501_5_0 + slot_501_42_0 + slot_501_15_0 + vector(0, 2), slot_501_5_0 + slot_501_42_0 + slot_501_15_0 - vector(0, 1) + vector(slot_501_38_2, slot_501_41_1.y + 5))
			render.text(slot_501_9_0, slot_501_5_0 + slot_501_42_0 + slot_501_15_0, color(255, 255, 255, 255), nil, slot_501_40_1)
			render.pop_clip_rect()
		end

		slot_0_126_5.dt.adder = math.max(0, math.min(1, slot_0_126_5.dt.adder + (slot_501_23_2 and slot_501_4_0 * 5.5 or -slot_501_4_0 * 5.5)))
		slot_501_29_3 = slot_0_6_0.quad_out(slot_0_126_5.dt.adder, 0, 1, 1)
		slot_501_15_0.y = slot_501_15_0.y + (slot_501_27_2.y - 2) * slot_501_29_3
	end

	if arg_501_0.m_show_hs and arg_501_0.m_show_hs:get() then
		slot_501_20_1, slot_501_21_1 = pcall(function()
			return slot_0_11_0.rage.main.hide_shots:get()
		end)
		slot_501_22_1 = slot_0_78_0.is_active
		slot_501_23_1 = slot_501_20_1 and slot_501_21_1 or slot_501_22_1
		slot_501_24_1 = false

		pcall(function()
			slot_501_24_1 = slot_0_11_0.rage.main.double_tap:get()
		end)

		slot_0_126_5.hs.alpha = math.max(0, math.min(1, slot_0_126_5.hs.alpha + (slot_501_23_1 and slot_501_4_0 * 2.5 or -slot_501_4_0 * 2.5)))
		slot_501_25_1 = slot_0_126_5.hs.alpha
		slot_501_26_1 = 0
		slot_501_27_1 = slot_501_13_0("hide")
		slot_501_28_1 = render.measure_text(slot_501_9_0, nil, slot_501_27_1)
		slot_501_29_2 = ""

		if slot_501_25_1 > 0 then
			if slot_501_23_1 and slot_501_25_1 > 0.1 then
				slot_501_26_1 = slot_501_26_1 + slot_501_28_1.x
			end

			slot_0_126_5.hs.inactive[1] = math.max(0, math.min(1, slot_0_126_5.hs.inactive[1] + (slot_501_24_1 and not slot_501_22_1 and slot_501_4_0 * 3.5 or -slot_501_4_0 * 3.5)))
			slot_501_30_2 = slot_0_126_5.hs.inactive[1]
			slot_0_126_5.hs.inactive[2] = math.max(0, math.min(1, slot_0_126_5.hs.inactive[2] + (slot_501_30_2 == 1 and slot_501_4_0 * 3.5 or -slot_501_4_0 * 3.5)))
			slot_501_31_1 = slot_0_126_5.hs.inactive[2]
			slot_0_126_5.hs.inactive[3] = math.max(0, math.min(1, slot_0_126_5.hs.inactive[3] + (slot_501_25_1 == 1 and slot_501_31_1 > 0.1 and slot_501_4_0 * 1.5 or -slot_501_4_0 * 4)))
			slot_501_32_1 = slot_0_126_5.hs.inactive[3]
			slot_501_33_1 = slot_501_13_0("inactive")
			slot_501_34_1 = slot_0_128_4(slot_501_33_1, color(242, 189, 75, math.floor(255 * slot_501_19_0)), color(0, 0, 0, 0), slot_501_32_1, true)
			slot_501_35_1 = render.measure_text(slot_501_9_0, nil, slot_501_14_0 .. slot_501_33_1)
			slot_0_126_5.hs.active = math.max(0, math.min(1, slot_0_126_5.hs.active + (slot_501_25_1 == 1 and (slot_501_22_1 or not slot_501_24_1) and slot_501_4_0 * 1.5 or -slot_501_4_0 * 4)))
			slot_501_36_0 = slot_0_126_5.hs.active
			slot_501_37_1 = slot_501_22_1 and "auto" or "active"
			slot_501_38_1 = slot_501_13_0(slot_501_37_1)
			slot_501_39_1 = slot_0_128_4(slot_501_38_1, color(112, 161, 224, math.floor(255 * slot_501_19_0)), color(0, 0, 0, 0), slot_501_36_0, true)
			slot_501_40_0 = render.measure_text(slot_501_9_0, nil, slot_501_14_0 .. slot_501_38_1)

			if slot_501_23_1 and slot_501_25_1 > 0.95 and slot_501_31_1 ~= 1 then
				slot_501_29_2 = slot_501_14_0 .. slot_501_39_1
				slot_501_26_1 = slot_501_26_1 + slot_501_40_0.x
			end

			if slot_501_23_1 and slot_501_25_1 > 0.95 and slot_501_30_2 > 0 then
				slot_501_26_1 = slot_501_28_1.x
			end

			if slot_501_23_1 and slot_501_25_1 > 0.95 and slot_501_31_1 > 0 then
				slot_501_29_2 = slot_501_14_0 .. slot_501_34_1
			end

			if slot_501_23_1 and slot_501_25_1 > 0.95 and slot_501_30_2 == 1 then
				slot_501_26_1 = slot_501_26_1 + slot_501_35_1.x
			end

			if slot_501_23_1 then
				slot_0_126_5.hs.last_text = slot_501_29_2
			end

			if not slot_501_23_1 or slot_501_25_1 == 0 then
				slot_501_26_1 = 0
			end

			slot_0_126_5.hs.fraction = slot_0_6_0.linear(slot_501_4_0, slot_0_126_5.hs.fraction, slot_501_26_1 - slot_0_126_5.hs.fraction, slot_501_7_0)
			slot_501_41_0 = math.floor(slot_0_126_5.hs.fraction)
			slot_501_43_0 = string.format("\a%02x%02x%02x%02x", 255, 255, 255, math.floor(255 * slot_501_19_0)) .. slot_501_27_1 .. slot_0_126_5.hs.last_text
			slot_501_44_0 = render.measure_text(slot_501_9_0, nil, slot_501_27_1 .. string.gsub(slot_0_126_5.hs.last_text, "\a%x%x%x%x%x%x%x%x", ""))
			slot_501_45_0 = vector(math.floor(-(slot_501_44_0.x / 2) * (1 - slot_501_17_0) * (slot_501_41_0 / math.max(1, slot_501_44_0.x)) + 8 * slot_501_17_0))

			render.push_clip_rect(slot_501_5_0 + slot_501_45_0 + slot_501_15_0 + vector(0, 2), slot_501_5_0 + slot_501_45_0 + slot_501_15_0 - vector(0, 1) + vector(slot_501_41_0, slot_501_44_0.y + 5))
			render.text(slot_501_9_0, slot_501_5_0 + slot_501_45_0 + slot_501_15_0, color(255, 255, 255, 255), nil, slot_501_43_0)
			render.pop_clip_rect()
		end

		slot_0_126_5.hs.adder = math.max(0, math.min(1, slot_0_126_5.hs.adder + (slot_501_23_1 and slot_501_4_0 * 5.5 or -slot_501_4_0 * 5.5)))
		slot_501_30_1 = slot_0_6_0.quad_out(slot_0_126_5.hs.adder, 0, 1, 1)
		slot_501_15_0.y = slot_501_15_0.y + (slot_501_28_1.y - 2) * slot_501_30_1
	end

	if arg_501_0.m_show_fs and arg_501_0.m_show_fs:get() then
		slot_501_20_0 = slot_0_72_0.think()
		slot_501_21_0 = false
		slot_0_126_5.fs.alpha = math.max(0, math.min(1, slot_0_126_5.fs.alpha + (slot_501_20_0 and slot_501_4_0 * 2.5 or -slot_501_4_0 * 2.5)))
		slot_501_22_0 = slot_0_126_5.fs.alpha
		slot_501_23_0 = 0
		slot_501_24_0 = slot_501_13_0("freestand")
		slot_501_25_0 = render.measure_text(slot_501_9_0, nil, slot_501_24_0)
		slot_501_26_0 = slot_501_13_0("fs")
		slot_501_27_0 = render.measure_text(slot_501_9_0, nil, slot_501_26_0)
		slot_501_28_0 = ""

		if slot_501_22_0 > 0 then
			if slot_501_20_0 and slot_501_22_0 > 0.1 then
				slot_501_23_0 = slot_501_23_0 + slot_501_25_0.x
			end

			slot_0_126_5.fs.disabled[1] = math.max(0, math.min(1, slot_0_126_5.fs.disabled[1] + (slot_501_21_0 and slot_501_4_0 * 3.3 or -slot_501_4_0 * 3)))
			slot_501_29_1 = slot_0_126_5.fs.disabled[1]
			slot_0_126_5.fs.disabled[2] = math.max(0, math.min(1, slot_0_126_5.fs.disabled[2] + (slot_501_29_1 == 1 and slot_501_4_0 * 2.5 or -slot_501_4_0 * 5)))
			slot_501_30_0 = slot_0_126_5.fs.disabled[2]
			slot_0_126_5.fs.disabled[3] = math.max(0, math.min(1, slot_0_126_5.fs.disabled[3] + (slot_501_22_0 == 1 and slot_501_30_0 == 1 and slot_501_4_0 * 1.5 or -slot_501_4_0 * 4)))
			slot_501_31_0 = slot_0_126_5.fs.disabled[3]
			slot_501_32_0 = slot_501_13_0("disabled")
			slot_501_33_0 = slot_0_128_4(slot_501_32_0, color(120, 120, 120, math.floor(255 * slot_501_19_0)), color(0, 0, 0, 0), slot_501_31_0, true)
			slot_501_34_0 = render.measure_text(slot_501_9_0, nil, slot_501_14_0 .. slot_501_32_0)

			if slot_501_29_1 ~= 0 then
				slot_501_23_0 = slot_501_27_0.x - 7
			end

			if slot_501_29_1 > 0.5 then
				slot_501_24_0 = slot_501_26_0
			end

			if slot_501_29_1 == 1 then
				slot_501_23_0 = slot_501_27_0.x
			end

			if slot_501_30_0 > 0 then
				slot_501_24_0 = slot_501_24_0 .. slot_501_14_0 .. slot_501_33_0
			end

			if slot_501_22_0 > 0.95 and slot_501_30_0 > 0.95 then
				slot_501_23_0 = slot_501_23_0 + slot_501_34_0.x
			end

			if slot_501_20_0 then
				slot_0_126_5.fs.last_text = slot_501_24_0 .. slot_501_28_0
			end

			if not slot_501_20_0 or slot_501_22_0 == 0 then
				slot_501_23_0 = 0
			end

			slot_0_126_5.fs.fraction = slot_0_6_0.linear(slot_501_4_0, slot_0_126_5.fs.fraction, slot_501_23_0 - slot_0_126_5.fs.fraction, slot_501_7_0)
			slot_501_35_0 = math.floor(slot_0_126_5.fs.fraction)
			slot_501_37_0 = string.format("\a%02x%02x%02x%02x", 255, 255, 255, math.floor(255 * slot_501_19_0)) .. slot_0_126_5.fs.last_text
			slot_501_38_0 = render.measure_text(slot_501_9_0, nil, string.gsub(slot_0_126_5.fs.last_text, "\a%x%x%x%x%x%x%x%x", ""))
			slot_501_39_0 = vector(math.floor(-(slot_501_38_0.x / 2) * (1 - slot_501_17_0) * (slot_501_35_0 / math.max(1, slot_501_38_0.x)) + 8 * slot_501_17_0))

			render.push_clip_rect(slot_501_5_0 + slot_501_39_0 + slot_501_15_0 + vector(0, 2), slot_501_5_0 + slot_501_39_0 + slot_501_15_0 - vector(0, 1) + vector(slot_501_35_0, slot_501_38_0.y + 5))
			render.text(slot_501_9_0, slot_501_5_0 + slot_501_39_0 + slot_501_15_0, color(255, 255, 255, 255), nil, slot_501_37_0)
			render.pop_clip_rect()
		end

		slot_0_126_5.fs.adder = math.max(0, math.min(1, slot_0_126_5.fs.adder + (slot_501_20_0 and slot_501_4_0 * 5.5 or -slot_501_4_0 * 5.5)))
		slot_501_29_0 = slot_0_6_0.quad_out(slot_0_126_5.fs.adder, 0, 1, 1)
		slot_501_15_0.y = slot_501_15_0.y + (slot_501_25_0.y - 2) * slot_501_29_0
	end
end

slot_0_130_1 = 0

events.aim_fire(function(arg_508_0)
	local var_508_0 = entity.get_local_player()

	if not var_508_0 or not var_508_0:is_alive() then
		return
	end

	slot_0_130_1 = globals.realtime
end)
events.createmove(function()
	local var_509_0 = slot_0_59_0.visuals.silent_view

	if not var_509_0 or not var_509_0.switch:get() then
		return
	end

	local var_509_1 = ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Silent Aim")

	if var_509_1 then
		var_509_1:set(true)
	end
end)
events.aim_fire(function(arg_510_0)
	local var_510_0 = slot_0_59_0.visuals.silent_view

	if not var_510_0 or not var_510_0.switch:get() then
		return
	end

	local var_510_1 = ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Silent Aim")

	if not var_510_1 then
		return
	end

	local var_510_2 = entity.get_local_player()

	if not var_510_2 or not var_510_2:is_alive() then
		return
	end

	local var_510_3 = render.camera_position()
	local var_510_4 = render.camera_angles()
	local var_510_5 = (arg_510_0.aim - var_510_3):angles()
	local var_510_6 = var_510_4.x - var_510_5.x
	local var_510_7 = var_510_4.y - var_510_5.y

	while var_510_7 > 180 do
		var_510_7 = var_510_7 - 360
	end

	while var_510_7 < -180 do
		var_510_7 = var_510_7 + 360
	end

	if math.sqrt(var_510_6^2 + var_510_7^2) < var_510_0.fov:get() then
		var_510_1:set(false)
		render.camera_angles(var_510_5)
	end
end)

slot_0_131_1 = 0
slot_0_132_1 = 0

events.render(function()
	local var_511_0 = slot_0_59_0.visuals.silent_view

	if not var_511_0 or not var_511_0.switch:get() then
		return
	end

	local var_511_1 = var_511_0.fov:get()

	if var_511_1 ~= slot_0_131_1 then
		slot_0_131_1 = var_511_1
		slot_0_132_1 = globals.realtime
	end

	local var_511_2 = globals.realtime - slot_0_132_1

	if var_511_2 > 1.5 then
		return
	end

	if not (ui.get_alpha() > 0) then
		return
	end

	local var_511_3 = false

	if slot_0_19_0 then
		local var_511_4, var_511_5 = pcall(function()
			return slot_0_19_0:get()
		end)

		var_511_3 = var_511_4 and var_511_5 == 2
	end

	if not var_511_3 then
		return
	end

	local var_511_6 = entity.get_local_player()

	if not var_511_6 or not var_511_6:is_alive() then
		return
	end

	local var_511_7 = render.screen_size()
	local var_511_8 = vector(var_511_7.x / 2, var_511_7.y / 2)
	local var_511_9 = var_511_0.fov:get()
	local var_511_10 = 90
	local var_511_11, var_511_12 = pcall(function()
		return ui.find("Visuals", "World", "Main", "Field of View"):get()
	end)

	if var_511_11 and var_511_12 ~= 0 then
		var_511_10 = var_511_12
	end

	local var_511_13 = var_511_9 / var_511_10 * (var_511_7.y / 2)
	local var_511_14 = globals.realtime
	local var_511_15 = math.sin(var_511_14 * 3) * 0.5 + 0.5
	local var_511_16 = color(255, 255, 255, 255)

	pcall(function()
		var_511_16 = slot_0_15_0:get()
	end)

	local var_511_17 = 1

	if var_511_2 > 1 then
		var_511_17 = math.max(0, 1 - (var_511_2 - 1) / 0.5)
	end

	local var_511_18 = color(var_511_16.r, var_511_16.g, var_511_16.b, (60 + 100 * var_511_15) * var_511_17)
	local var_511_19 = 200
	local var_511_20 = math.pi * 2 / var_511_19

	for iter_511_0 = 0, var_511_19 - 1 do
		local var_511_21 = iter_511_0 * var_511_20
		local var_511_22 = (iter_511_0 + 1) * var_511_20
		local var_511_23 = var_511_8 + vector(math.cos(var_511_21) * var_511_13, math.sin(var_511_21) * var_511_13)
		local var_511_24 = var_511_8 + vector(math.cos(var_511_22) * var_511_13, math.sin(var_511_22) * var_511_13)

		render.line(var_511_23, var_511_24, var_511_18)
	end
end)

slot_0_133_1 = render.load_font("Verdana Bold", 11, "ab")
slot_0_134_1 = render.load_font("Verdana", 10, "a")
slot_0_135_1 = {
	bar_frac = 0,
	bar_alpha = 0,
	title_a = 0,
	gap = 0,
	dt_ticks = 0,
	scope = 0
}

function slot_0_136_1(arg_515_0, arg_515_1, arg_515_2)
	slot_515_3_0 = slot_0_99_1.position
	slot_515_4_0, slot_515_5_0, slot_515_6_0, slot_515_7_0 = (function()
		local var_516_0 = arg_515_0.new_title_col:get()

		return var_516_0.r, var_516_0.g, var_516_0.b, var_516_0.a
	end)()
	slot_515_8_0, slot_515_9_0, slot_515_10_0, slot_515_11_0 = (function()
		local var_517_0 = arg_515_0.new_grad_col:get()

		return var_517_0.r, var_517_0.g, var_517_0.b, var_517_0.a
	end)()
	slot_515_12_0, slot_515_13_0, slot_515_14_0, slot_515_15_0 = (function()
		local var_518_0 = arg_515_0.new_shot_col:get()

		return var_518_0.r, var_518_0.g, var_518_0.b, var_518_0.a
	end)()
	slot_515_16_0, slot_515_17_0, slot_515_18_0, slot_515_19_0 = (function()
		local var_519_0 = arg_515_0.new_state_col:get()

		return var_519_0.r, var_519_0.g, var_519_0.b, var_519_0.a
	end)()
	slot_515_20_0, slot_515_21_0, slot_515_22_0, slot_515_23_0 = (function()
		local var_520_0 = arg_515_0.new_flags_col:get()

		return var_520_0.r, var_520_0.g, var_520_0.b, var_520_0.a
	end)()
	slot_515_24_0 = arg_515_1.m_bIsScoped == true
	slot_0_135_1.scope = slot_0_135_1.scope + ((slot_515_24_0 and 1 or 0) - slot_0_135_1.scope) * (1 - math.exp(-arg_515_2 * 12))
	slot_0_135_1.title_a = math.max(0, math.min(1, slot_0_135_1.title_a + arg_515_2 * 3))
	slot_0_135_1.gap = slot_0_135_1.gap + ((slot_515_24_0 and 1 or 0) - slot_0_135_1.gap) * (1 - math.exp(-arg_515_2 * 12))
	slot_0_135_1.bar_alpha = slot_0_135_1.bar_alpha + (1 - slot_0_135_1.bar_alpha) * (1 - math.exp(-arg_515_2 * 8))
	slot_515_25_0 = slot_0_135_1.scope
	slot_515_26_0 = slot_0_135_1.title_a
	slot_515_27_0 = math.floor(slot_515_3_0.x + 22 * slot_515_25_0 + 0.5)
	slot_515_28_1 = math.floor(slot_515_3_0.y + 0.5)
	slot_515_29_0 = slot_0_70_0.get and slot_0_70_0.get(slot_0_75_0.is_working) or "standing"

	if (arg_515_0.new_show_state == nil or arg_515_0.new_show_state:get()) and slot_515_29_0 then
		slot_515_31_1 = slot_515_29_0:upper()
		slot_515_32_1 = render.measure_text(2, nil, slot_515_31_1).x
		slot_515_33_1 = math.floor(slot_515_27_0 - slot_515_32_1 / 2 * (1 - slot_515_25_0) + 0.5)

		render.text(2, vector(slot_515_33_1, slot_515_28_1 - 1), color(slot_515_16_0, slot_515_17_0, slot_515_18_0, math.floor(slot_515_19_0 * slot_515_26_0)), nil, slot_515_31_1)

		slot_515_28_1 = slot_515_28_1 + 8
	end

	slot_515_31_0 = "elysian"
	slot_515_32_0 = render.measure_text(slot_0_133_1, nil, slot_515_31_0)
	slot_515_33_0 = slot_515_32_0.x
	slot_515_34_0 = slot_515_32_0.y
	slot_515_35_0 = math.floor(40 * slot_515_26_0)
	slot_515_36_0 = math.floor(slot_515_27_0 + slot_515_25_0 - slot_515_33_0 / 2 * (1 - slot_515_25_0) + 0.5)

	render.text(slot_0_133_1, vector(slot_515_36_0 + 1, slot_515_28_1 + 1), color(0, 0, 0, slot_515_35_0), nil, slot_515_31_0)
	render.text(slot_0_133_1, vector(slot_515_36_0, slot_515_28_1), color(slot_515_4_0, slot_515_5_0, slot_515_6_0, math.floor(slot_515_7_0 * slot_515_26_0)), nil, slot_515_31_0)

	slot_515_37_0 = slot_515_28_1 + slot_515_34_0 + 3
	slot_515_38_0 = arg_515_1.m_flPoseParameter and arg_515_1.m_flPoseParameter[11] or 0
	slot_515_39_0 = math.abs(slot_515_38_0 * 120 - 60)
	slot_515_40_0 = math.max(0, math.min(1, slot_515_39_0 / 58))
	slot_0_135_1.bar_frac = slot_0_135_1.bar_frac + (slot_515_40_0 - slot_0_135_1.bar_frac) * (1 - math.exp(-arg_515_2 * 10))
	slot_515_41_0 = slot_515_33_0 / 2 + 15
	slot_515_42_0 = math.max(1, math.floor(slot_515_41_0 * slot_0_135_1.bar_frac))
	slot_515_43_0 = globals.realtime - slot_0_130_1
	slot_515_44_0 = math.max(0, 1 - slot_515_43_0 / 0.5)
	slot_515_45_0 = math.floor(slot_515_8_0 + (slot_515_12_0 - slot_515_8_0) * slot_515_44_0)
	slot_515_46_0 = math.floor(slot_515_9_0 + (slot_515_13_0 - slot_515_9_0) * slot_515_44_0)
	slot_515_47_0 = math.floor(slot_515_10_0 + (slot_515_14_0 - slot_515_10_0) * slot_515_44_0)
	slot_515_48_0 = math.floor(slot_515_11_0 * slot_515_26_0 * slot_0_135_1.bar_alpha)

	if slot_515_42_0 > 0 and slot_515_48_0 > 0 then
		slot_515_49_1 = slot_515_42_0 * (1 + 1.8 * slot_515_25_0)
		slot_515_50_1 = slot_515_42_0 * (1 - slot_515_25_0)
		slot_515_51_1 = color(slot_515_45_0, slot_515_46_0, slot_515_47_0, slot_515_48_0)
		slot_515_52_2 = color(slot_515_45_0, slot_515_46_0, slot_515_47_0, 0)

		render.gradient(vector(slot_515_27_0, slot_515_37_0), vector(slot_515_27_0 + slot_515_49_1, slot_515_37_0 + 1), slot_515_51_1, slot_515_52_2, slot_515_51_1, slot_515_52_2)

		if slot_515_50_1 > 1 then
			render.gradient(vector(slot_515_27_0 - slot_515_50_1, slot_515_37_0), vector(slot_515_27_0, slot_515_37_0 + 1), slot_515_52_2, slot_515_51_1, slot_515_52_2, slot_515_51_1)
		end
	end

	slot_515_28_0 = slot_515_37_0 + 2
	slot_515_49_0 = {}
	slot_515_50_0, slot_515_51_0 = pcall(function()
		return slot_0_11_0.rage.main.double_tap:get()
	end)

	if slot_515_50_0 and slot_515_51_0 and not slot_0_78_0.is_active then
		slot_515_52_1 = rage.exploit:get() == 1
		slot_515_53_1 = 15
		slot_515_54_1 = slot_515_52_1 and slot_515_53_1 or 0
		slot_0_135_1.dt_ticks = slot_0_135_1.dt_ticks + (slot_515_54_1 - slot_0_135_1.dt_ticks) * (1 - math.exp(-arg_515_2 * 10))
		slot_515_55_1 = math.floor(slot_0_135_1.dt_ticks + 0.5)

		table.insert(slot_515_49_0, {
			n = string.format("DOUBLE TAP [%d]", slot_515_55_1),
			glow = not slot_515_52_1
		})
	else
		slot_0_135_1.dt_ticks = 0
	end

	slot_515_52_0, slot_515_53_0 = pcall(function()
		return slot_0_11_0.rage.main.hide_shots:get()
	end)

	if slot_515_52_0 and slot_515_53_0 or slot_0_78_0.is_active then
		table.insert(slot_515_49_0, {
			n = "HIDESHOTS"
		})
	end

	if slot_0_72_0.think() then
		table.insert(slot_515_49_0, {
			n = "FREESTANDING"
		})
	end

	slot_515_54_0 = false
	slot_515_55_0, slot_515_56_0 = pcall(ui.get_binds)

	if slot_515_55_0 and slot_515_56_0 then
		for iter_515_0, iter_515_1 in ipairs(slot_515_56_0) do
			slot_515_62_1 = (iter_515_1.name or ""):lower()

			if iter_515_1.active and (slot_515_62_1:find("damage") or slot_515_62_1:find("min%.") or slot_515_62_1 == "min. damage") then
				slot_515_54_0 = true

				break
			end
		end
	end

	if not slot_515_54_0 then
		slot_515_57_1, slot_515_58_1 = pcall(function()
			return slot_0_11_0.rage.selection.minimum_damage_global:get()
		end)
		slot_515_54_0 = slot_515_57_1 and slot_515_58_1 == true
	end

	if slot_515_54_0 then
		table.insert(slot_515_49_0, {
			n = "DAMAGE"
		})
	end

	for iter_515_2, iter_515_3 in ipairs(slot_515_49_0) do
		slot_515_59_0 = iter_515_3.glow and 0.5 + 0.5 * math.abs(math.sin(globals.curtime * 3 + iter_515_2)) or 1
		slot_515_60_0 = math.floor(slot_515_23_0 * slot_515_26_0 * slot_515_59_0)
		slot_515_61_0 = render.measure_text(2, nil, iter_515_3.n).x
		slot_515_62_0 = math.floor(slot_515_27_0 - slot_515_61_0 / 2 * (1 - slot_515_25_0) + 0.5)

		render.text(2, vector(slot_515_62_0, slot_515_28_0), color(slot_515_20_0, slot_515_21_0, slot_515_22_0, slot_515_60_0), nil, iter_515_3.n)

		slot_515_28_0 = slot_515_28_0 + 8
	end
end

events.render(function()
	slot_0_97_0.data = {}

	local var_524_0 = slot_0_59_0.info.crosshair

	if not var_524_0 then
		return
	end

	if not var_524_0.enabled:get() then
		return
	end

	local var_524_1 = entity.get_local_player()

	if not var_524_1 or not var_524_1:is_alive() then
		return
	end

	local var_524_2, var_524_3 = pcall(function()
		return var_524_0.style:get()
	end)

	if var_524_2 and var_524_3 == "old" then
		slot_0_136_1(var_524_0, var_524_1, globals.frametime)
	else
		slot_0_129_2(var_524_0, var_524_1, globals.frametime, slot_0_47_0())
	end
end)

slot_0_99_0 = nil
slot_0_100_1 = false
slot_0_101_2 = 0
slot_0_102_2 = 0
slot_0_103_3 = 0
slot_0_104_4 = false

events.net_update_end(function()
	local var_526_0, var_526_1 = pcall(function()
		return rage.exploit:get()
	end)

	slot_0_100_1 = var_526_0 and var_526_1 == 1

	if not slot_0_100_1 then
		slot_0_104_4 = false
		slot_0_103_3 = 0
	end
end)
events.createmove(function(arg_528_0)
	if not slot_0_100_1 then
		slot_0_104_4 = false

		return
	end

	local var_528_0 = entity.get_local_player()

	if not var_528_0 or not var_528_0:is_alive() then
		slot_0_104_4 = false

		return
	end

	local var_528_1 = var_528_0.m_nTickBase
	local var_528_2 = globals.server_tick
	local var_528_3 = var_528_1 - slot_0_101_2

	slot_0_101_2 = math.max(var_528_1, slot_0_101_2)

	if var_528_3 > 1 then
		slot_0_102_2 = var_528_2 + 1
		slot_0_103_3 = 0
	elseif var_528_3 < 0 then
		slot_0_103_3 = var_528_2 - var_528_3 - 4
	elseif slot_0_102_2 == var_528_2 then
		slot_0_103_3 = var_528_2 + 1
	end

	slot_0_104_4 = var_528_2 <= slot_0_103_3

	local var_528_4, var_528_5 = pcall(function()
		return rage.exploit:get_defensive()
	end)

	if var_528_4 and var_528_5 then
		slot_0_104_4 = true
	end
end)
events.level_change(function()
	slot_0_101_2 = 0
	slot_0_102_2 = 0
	slot_0_103_3 = 0
	slot_0_104_4 = false
	slot_0_100_1 = false
	anim_cache = {}
	bar_cache = {}
	pulse_cache = {}
end)
events.round_start(function()
	slot_0_101_2 = 0
	slot_0_102_2 = 0
	slot_0_103_3 = 0
	slot_0_104_4 = false
	anim_cache = {}
	bar_cache = {}
	pulse_cache = {}
end)

slot_0_105_5 = "✦"
slot_0_106_6 = 52
slot_0_107_5 = 52
slot_0_108_6 = vector(slot_0_106_6, slot_0_107_5)
slot_0_109_7 = slot_0_52_0:new("defensive_indicator", vector(slot_0_14_0.x * 0.5, slot_0_14_0.y - 55), "y")
slot_0_110_8 = slot_0_5_0.new(0)
slot_0_111_14 = slot_0_5_0.new(0)
slot_0_112_13 = slot_0_5_0.new(0)
slot_0_113_11 = render.load_font("Verdana", vector(0, 30, 0), "ab")
slot_0_114_11 = render.load_font("Verdana", vector(0, 34, 0), "ab")

events.render(function()
	slot_532_0_0 = slot_0_59_0.info and slot_0_59_0.info.def_ind

	if not slot_532_0_0 then
		return
	end

	slot_532_1_0 = ui.get_alpha() > 0
	slot_532_2_0 = false

	if slot_532_1_0 and slot_0_19_0 then
		slot_532_3_1, slot_532_4_1 = pcall(function()
			return slot_0_19_0:get()
		end)
		slot_532_2_0 = slot_532_3_1 and slot_532_4_1 == 2
	end

	slot_532_3_0 = slot_532_1_0 and slot_532_2_0

	if not slot_532_0_0.switch:get() then
		slot_0_110_8(0.06, false)

		return
	end

	slot_0_109_7:update(slot_0_108_6)

	if slot_532_3_0 then
		slot_0_48_0(slot_0_109_7.position, slot_0_108_6, math.max(slot_0_109_7.hover_anim, slot_0_109_7.grab_anim))
	end

	slot_532_4_0 = entity.get_local_player()
	slot_532_6_0 = slot_532_4_0 ~= nil and slot_532_4_0:is_alive() and slot_0_104_4 or slot_532_3_0

	slot_0_110_8(slot_532_6_0 and 0.09 or 0.04, slot_532_6_0)

	slot_532_7_0 = slot_0_110_8.value

	if slot_532_7_0 < 0.004 then
		return
	end

	slot_532_8_0 = globals.realtime
	slot_532_9_1 = (math.sin(slot_532_8_0 * 3) + 1) * 0.5
	slot_532_9_0 = slot_532_9_1 * slot_532_9_1

	slot_0_111_14(0.08, slot_532_9_0)

	slot_532_10_1 = (math.sin(slot_532_8_0 * 1.8 - 1) + 1) * 0.5
	slot_532_10_0 = slot_532_10_1 * slot_532_10_1

	slot_0_112_13(0.06, slot_532_10_0)

	slot_532_11_0 = slot_0_111_14.value
	slot_532_12_0 = slot_0_112_13.value
	slot_532_13_0 = slot_532_0_0.color:get()
	slot_532_14_0 = math.max(0, math.min(255, math.floor(slot_532_13_0.r * 0.55 + slot_532_13_0.r * 0.45 * slot_532_12_0)))
	slot_532_15_0 = math.max(0, math.min(255, math.floor(slot_532_13_0.g * 0.55 + slot_532_13_0.g * 0.45 * slot_532_12_0)))
	slot_532_16_0 = math.max(0, math.min(255, math.floor(slot_532_13_0.b * 0.55 + slot_532_13_0.b * 0.45 * slot_532_12_0)))
	slot_532_17_0 = math.floor(slot_532_7_0 * (22 + slot_532_12_0 * 18 + slot_532_11_0 * 10))
	slot_532_18_0 = math.floor(slot_532_7_0 * (185 + slot_532_12_0 * 40 + slot_532_11_0 * 20))
	slot_532_19_0 = slot_0_109_7.position
	slot_532_20_0 = math.floor(slot_532_19_0.x)
	slot_532_21_0 = math.floor(slot_532_19_0.y + math.sin(slot_532_8_0 * 1.3) * 2 * slot_532_7_0)

	if slot_532_17_0 > 2 then
		slot_532_22_1 = {
			3,
			2,
			1
		}

		for iter_532_0, iter_532_1 in ipairs(slot_532_22_1) do
			slot_532_28_1 = math.floor(slot_532_17_0 * (1 - (iter_532_0 - 1) / #slot_532_22_1) * 0.5)

			if slot_532_28_1 > 1 then
				slot_532_29_0 = color(slot_532_14_0, slot_532_15_0, slot_532_16_0, slot_532_28_1)

				for iter_532_2, iter_532_3 in ipairs({
					{
						-iter_532_1,
						-iter_532_1
					},
					{
						iter_532_1,
						-iter_532_1
					},
					{
						-iter_532_1,
						iter_532_1
					},
					{
						iter_532_1,
						iter_532_1
					},
					{
						0,
						-iter_532_1
					},
					{
						0,
						iter_532_1
					},
					{
						-iter_532_1,
						0
					},
					{
						iter_532_1,
						0
					}
				}) do
					render.text(slot_0_114_11, vector(slot_532_20_0 + iter_532_3[1], slot_532_21_0 + iter_532_3[2]), slot_532_29_0, "c", slot_0_105_5)
				end
			end
		end
	end

	slot_532_22_0 = math.floor(slot_532_7_0 * (70 + slot_532_12_0 * 50))

	if slot_532_22_0 > 2 then
		slot_532_23_0 = color(slot_532_14_0, slot_532_15_0, slot_532_16_0, slot_532_22_0)

		for iter_532_4, iter_532_5 in ipairs({
			{
				-1,
				-1
			},
			{
				1,
				-1
			},
			{
				-1,
				1
			},
			{
				1,
				1
			}
		}) do
			render.text(slot_0_113_11, vector(slot_532_20_0 + iter_532_5[1], slot_532_21_0 + iter_532_5[2]), slot_532_23_0, "c", slot_0_105_5)
		end
	end

	render.text(slot_0_113_11, vector(slot_532_20_0, slot_532_21_0), color(slot_532_14_0, slot_532_15_0, slot_532_16_0, slot_532_18_0), "c", slot_0_105_5)
end)

slot_0_100_0 = nil
slot_0_101_1 = 120
slot_0_102_1 = 3
slot_0_103_2 = 2
slot_0_104_3 = 3
slot_0_105_4 = 6
slot_0_106_5 = slot_0_52_0:new("velocity_indicator", vector(slot_0_14_0.x * 0.5, slot_0_14_0.y - 55), "y")
slot_0_107_4 = slot_0_5_0.new(0)
slot_0_108_5 = slot_0_5_0.new(0)
slot_0_109_6 = -9
slot_0_110_7 = 0
slot_0_111_13 = render.load_font("Verdana", 13, "ab")

function slot_0_112_12(arg_534_0, arg_534_1, arg_534_2)
	arg_534_2 = math.max(0, math.min(1, arg_534_2))

	return color(math.floor(arg_534_0.r + (arg_534_1.r - arg_534_0.r) * arg_534_2), math.floor(arg_534_0.g + (arg_534_1.g - arg_534_0.g) * arg_534_2), math.floor(arg_534_0.b + (arg_534_1.b - arg_534_0.b) * arg_534_2), math.floor(arg_534_0.a + (arg_534_1.a - arg_534_0.a) * arg_534_2))
end

events.render(function()
	slot_535_0_0 = slot_0_59_0.info.velocity

	if not slot_535_0_0 then
		return
	end

	slot_535_1_0 = render.measure_text(slot_0_111_13, nil, "A").y
	slot_535_2_0 = slot_535_0_0.switch:get() and slot_535_0_0.show_label:get()
	slot_535_3_0 = slot_535_0_0.switch:get() and slot_535_0_0.show_percent:get()
	slot_535_4_0 = 0

	if slot_535_2_0 then
		slot_535_4_0 = slot_535_4_0 + slot_535_1_0 + (slot_535_3_0 and slot_0_104_3 or 0)
	end

	if slot_535_3_0 then
		slot_535_4_0 = slot_535_4_0 + slot_535_1_0
	end

	slot_535_5_0 = slot_535_4_0 + (slot_535_4_0 > 0 and slot_0_105_4 or 0) + slot_0_102_1

	if not slot_535_0_0.switch:get() then
		slot_0_108_5(0.08, false)
		slot_0_106_5:update(vector(slot_0_101_1, slot_535_5_0))

		return
	end

	slot_535_6_0 = entity.get_local_player()

	if slot_535_6_0 == nil then
		return
	end

	slot_535_7_0 = slot_535_6_0.m_flVelocityModifier or 1
	slot_535_8_0 = slot_535_6_0:is_alive()
	slot_535_9_0 = ui.get_alpha() > 0
	slot_535_10_0 = false

	if slot_535_9_0 and slot_0_19_0 then
		slot_535_11_1, slot_535_12_2 = pcall(function()
			return slot_0_19_0:get()
		end)
		slot_535_10_0 = slot_535_11_1 and slot_535_12_2 == 2
	end

	slot_535_11_0 = slot_535_7_0

	if slot_535_9_0 and slot_535_10_0 then
		slot_535_12_1 = globals.realtime * 0.18 % 1
		slot_535_11_0 = slot_535_12_1 < 0.5 and slot_535_12_1 * 2 or 2 - slot_535_12_1 * 2
		slot_535_11_0 = slot_535_11_0 * slot_535_11_0 * (3 - 2 * slot_535_11_0)
	end

	slot_535_12_0 = slot_535_8_0 and slot_535_11_0 < 0.99 or slot_535_9_0 and slot_535_10_0

	slot_0_108_5(0.07, slot_535_12_0)
	slot_0_106_5:update(vector(slot_0_101_1, slot_535_5_0))

	if slot_535_9_0 and slot_535_10_0 then
		slot_0_48_0(slot_0_106_5.position, vector(slot_0_101_1, slot_535_5_0), math.max(slot_0_106_5.hover_anim, slot_0_106_5.grab_anim))
	end

	if slot_0_108_5.value <= 0.01 then
		return
	end

	slot_0_107_4(0.055, slot_535_11_0)

	slot_535_13_0 = math.max(0, math.min(1, slot_0_107_4.value))

	if slot_0_110_7 < 0.97 and slot_535_13_0 >= 0.97 then
		slot_0_109_6 = globals.realtime
	end

	slot_0_110_7 = slot_535_13_0
	slot_535_14_0 = math.max(0, math.min(1, (globals.realtime - slot_0_109_6) / 0.55))
	slot_535_15_0 = slot_535_14_0 < 1 and math.sin(slot_535_14_0 * math.pi) or 0
	slot_535_16_0 = slot_535_0_0.col_bar:get()
	slot_535_17_0 = slot_535_0_0.col_low and slot_535_0_0.col_low:get() or slot_535_0_0.col_bar2 and slot_535_0_0.col_bar2:get() or color(255, 255, 255, 255)
	slot_535_18_0 = slot_0_112_12(slot_535_17_0, slot_535_16_0, slot_535_13_0)
	slot_535_19_0 = slot_0_108_5.value
	slot_535_20_0 = math.floor(slot_535_19_0 * 255)
	slot_535_21_0 = slot_0_106_5.position
	slot_535_22_0 = math.floor(slot_535_21_0.x)
	slot_535_24_0 = math.floor(slot_535_21_0.y - slot_535_5_0 * 0.5)

	if slot_535_2_0 then
		slot_535_25_2 = render.measure_text(slot_0_111_13, nil, "velocity")

		render.text(slot_0_111_13, vector(slot_535_22_0 - math.floor(slot_535_25_2.x * 0.5), slot_535_24_0), color(105, 105, 110, math.floor(slot_535_20_0 * 0.78)), nil, "velocity")

		slot_535_24_0 = slot_535_24_0 + slot_535_1_0 + slot_0_104_3
	end

	if slot_535_3_0 then
		slot_535_25_1 = ("%d%%"):format(math.floor(slot_535_11_0 * 100))
		slot_535_26_1 = render.measure_text(slot_0_111_13, nil, slot_535_25_1)
		slot_535_27_1 = slot_0_112_12(color(105, 105, 110, 255), slot_535_18_0, slot_535_13_0)

		render.text(slot_0_111_13, vector(slot_535_22_0 - math.floor(slot_535_26_1.x * 0.5) + 1, slot_535_24_0 + 1), color(0, 0, 0, math.floor(slot_535_20_0 * 0.18)), nil, slot_535_25_1)
		render.text(slot_0_111_13, vector(slot_535_22_0 - math.floor(slot_535_26_1.x * 0.5), slot_535_24_0), color(slot_535_27_1.r, slot_535_27_1.g, slot_535_27_1.b, math.floor(slot_535_20_0 * 0.88)), nil, slot_535_25_1)

		slot_535_24_0 = slot_535_24_0 + slot_535_1_0
	end

	slot_535_25_0 = slot_535_22_0 - math.floor(slot_0_101_1 * 0.5)
	slot_535_26_0 = slot_535_25_0 + slot_0_101_1
	slot_535_27_0 = slot_535_24_0 + (slot_535_4_0 > 0 and slot_0_105_4 or 0)
	slot_535_28_0 = slot_535_27_0 + slot_0_102_1

	render.rect(vector(slot_535_25_0, slot_535_27_0), vector(slot_535_26_0, slot_535_28_0), color(255, 255, 255, math.floor(slot_535_20_0 * 0.09)), slot_0_103_2)

	slot_535_29_0 = math.floor(slot_0_101_1 * slot_535_13_0)

	if slot_535_29_0 > 1 then
		slot_535_30_0 = slot_535_25_0 + slot_535_29_0
		slot_535_31_0 = math.floor(slot_535_20_0 * 0.16 * slot_535_13_0)

		if slot_535_31_0 > 2 then
			render.rect(vector(slot_535_25_0, slot_535_27_0 - 1), vector(slot_535_30_0, slot_535_28_0 + 2), color(slot_535_18_0.r, slot_535_18_0.g, slot_535_18_0.b, slot_535_31_0), slot_0_103_2)
		end

		render.rect(vector(slot_535_25_0, slot_535_27_0), vector(slot_535_30_0, slot_535_28_0), color(slot_535_18_0.r, slot_535_18_0.g, slot_535_18_0.b, math.floor(slot_535_20_0 * 0.88)), slot_0_103_2)
		render.rect(vector(slot_535_25_0, slot_535_27_0), vector(slot_535_30_0, slot_535_27_0 + math.ceil(slot_0_102_1 * 0.5)), color(255, 255, 255, math.floor(slot_535_20_0 * 0.16)), slot_0_103_2)

		if slot_535_15_0 > 0.01 then
			render.rect(vector(slot_535_25_0, slot_535_27_0), vector(slot_535_30_0, slot_535_28_0), color(255, 255, 255, math.floor(slot_535_20_0 * 0.45 * slot_535_15_0)), slot_0_103_2)
		end

		if slot_535_13_0 >= 0.97 then
			slot_535_32_1 = (math.sin(globals.realtime * 3.2) + 1) * 0.5
			slot_535_32_0 = slot_535_32_1 * slot_535_32_1

			if slot_535_32_0 > 0.01 then
				render.rect(vector(slot_535_25_0 - 2, slot_535_27_0 - 2), vector(slot_535_30_0 + 2, slot_535_28_0 + 2), color(slot_535_18_0.r, slot_535_18_0.g, slot_535_18_0.b, math.floor(slot_535_20_0 * 0.2 * slot_535_32_0)), slot_0_103_2 + 1)
			end
		end
	end
end)

slot_0_101_0 = {
	breaking = false,
	last_lc = 0,
	discharge = 0
}
slot_0_102_0 = nil
slot_0_103_1 = 14
slot_0_104_2 = 7
slot_0_105_3 = 5
slot_0_106_4 = 2
slot_0_107_3 = 2
slot_0_108_4 = 8
slot_0_109_5 = 5
slot_0_110_6 = slot_0_103_1 * (slot_0_104_2 + slot_0_106_4) - slot_0_106_4 + slot_0_108_4 * 2
slot_0_111_12 = slot_0_52_0:new("lc_indicator", vector(slot_0_14_0.x * 0.5, slot_0_14_0.y - 55), "y")
slot_0_112_11 = slot_0_5_0.new(0)
slot_0_113_10 = render.load_font("Verdana", 12, "ab")
slot_0_114_10 = render.load_font("Verdana", 13, "ab")
slot_0_115_10 = nil
slot_0_116_7 = 0
slot_0_117_7 = 0
slot_0_118_6 = 0
slot_0_119_5 = false
slot_0_120_5 = false
slot_0_121_5 = 0
slot_0_122_6 = {}
slot_0_123_3 = {}
slot_0_124_3 = 0

for iter_0_39 = 1, slot_0_103_1 do
	slot_0_122_6[iter_0_39] = 0
end

function slot_0_125_3(arg_537_0, arg_537_1, arg_537_2)
	arg_537_2 = math.max(0, math.min(1, arg_537_2))

	return color(math.floor(arg_537_0.r + (arg_537_1.r - arg_537_0.r) * arg_537_2), math.floor(arg_537_0.g + (arg_537_1.g - arg_537_0.g) * arg_537_2), math.floor(arg_537_0.b + (arg_537_1.b - arg_537_0.b) * arg_537_2), math.floor(arg_537_0.a + (arg_537_1.a - arg_537_0.a) * arg_537_2))
end

function slot_0_126_4(arg_538_0, arg_538_1)
	if arg_538_1 == 14 then
		return "$$$", arg_538_0.col_wt:get()
	elseif arg_538_1 == 13 then
		return "amazing", arg_538_0.col_god:get()
	elseif arg_538_1 == 12 then
		return "ideal lc", arg_538_0.col_ideal:get()
	elseif arg_538_1 >= 10 then
		return "nice", arg_538_0.col_ideal:get()
	elseif arg_538_1 >= 7 then
		return "good", arg_538_0.col_good:get()
	elseif arg_538_1 >= 4 then
		return "ok", arg_538_0.col_ok:get()
	elseif arg_538_1 >= 1 then
		return "bad", arg_538_0.col_bad:get()
	else
		return "failed", arg_538_0.col_failed:get()
	end
end

events.createmove(function()
	local var_539_0 = slot_0_59_0.info.lc_ind
	local var_539_1 = entity.get_local_player()

	if not var_539_1 or not var_539_1:is_alive() then
		slot_0_121_5 = 0

		return
	end

	local var_539_2 = var_539_1.m_nTickBase or 0

	if math.abs(var_539_2 - slot_0_121_5) > 64 then
		slot_0_121_5 = 0
	end

	if var_539_2 > slot_0_121_5 then
		slot_0_121_5 = var_539_2
	end

	local var_539_3 = math.min(14, math.max(0, slot_0_121_5 - var_539_2 - 1))
	local var_539_4 = rage.exploit:get()
	local var_539_5 = var_539_1.m_vecVelocity.z > 0

	if var_539_4 < slot_0_117_7 and var_539_5 and not slot_0_119_5 then
		slot_0_119_5 = true
		slot_0_116_7 = slot_0_118_6
		slot_0_115_10 = globals.realtime + (slot_0_118_6 == 14 and 2 or 0.66)
	end

	if slot_0_119_5 and var_539_4 == 0 then
		slot_0_119_5 = false
	end

	if slot_0_115_10 and globals.realtime > slot_0_115_10 then
		slot_0_115_10 = nil
	end

	slot_0_117_7 = var_539_4
	slot_0_118_6 = var_539_3

	local var_539_6 = slot_0_11_0.rage.main.double_tap:get()
	local var_539_7 = slot_0_11_0.rage.main.hide_shots:get()

	slot_0_120_5 = var_539_6 or var_539_7 or slot_0_115_10 ~= nil or var_539_3 > 0
	slot_0_101_0.last_lc = slot_0_118_6
	slot_0_101_0.breaking = slot_0_120_5
	slot_0_101_0.timer = slot_0_115_10
	slot_0_101_0.discharge = slot_0_116_7
end)
events.render(function()
	slot_540_0_0 = slot_0_59_0.info.lc_ind

	if not slot_540_0_0 then
		return
	end

	slot_540_1_0 = math.max(0.001, math.min(globals.frametime, 0.05))
	slot_540_2_0 = render.measure_text(slot_0_114_10, nil, "A").y
	slot_540_3_0 = render.measure_text(slot_0_113_10, nil, "A").y
	slot_540_4_0 = 0

	if slot_540_0_0.switch:get() and slot_540_0_0.show_label:get() then
		slot_540_4_0 = slot_540_4_0 + slot_540_2_0 + slot_0_109_5
	end

	if slot_540_0_0.switch:get() and slot_540_0_0.show_ticks:get() then
		slot_540_4_0 = slot_540_4_0 + slot_540_3_0 + slot_0_109_5
	end

	slot_540_6_0 = slot_540_4_0 + (slot_540_0_0.switch:get() and slot_540_0_0.show_bar:get() and slot_0_105_3 or 0) + slot_0_108_4

	if not slot_540_0_0.switch:get() then
		slot_0_112_11(0.08, false)
		slot_0_111_12:update(vector(slot_0_110_6, math.max(slot_540_6_0, 20)))

		return
	end

	slot_540_7_0 = entity.get_local_player()

	if not slot_540_7_0 then
		return
	end

	slot_540_8_0 = ui.get_alpha() > 0
	slot_540_9_0 = false

	if slot_540_8_0 and slot_0_19_0 then
		slot_540_10_1, slot_540_11_1 = pcall(function()
			return slot_0_19_0:get()
		end)
		slot_540_9_0 = slot_540_10_1 and slot_540_11_1 == 2
	end

	slot_540_10_0 = slot_540_7_0:is_alive()
	slot_540_11_0 = slot_540_10_0 and slot_0_120_5 and slot_0_115_10 ~= nil or slot_540_8_0 and slot_540_9_0

	slot_0_112_11(0.08, slot_540_11_0)
	slot_0_111_12:update(vector(slot_0_110_6, math.max(slot_540_6_0, 20)))

	if slot_540_8_0 and slot_540_9_0 then
		slot_0_48_0(slot_0_111_12.position, vector(slot_0_110_6, math.max(slot_540_6_0, 20)), math.max(slot_0_111_12.hover_anim, slot_0_111_12.grab_anim))
	end

	if slot_0_112_11.value <= 0.01 then
		return
	end

	slot_540_12_0 = slot_0_112_11.value
	slot_540_13_0 = math.floor(slot_540_12_0 * 255)
	slot_540_14_0 = slot_0_111_12.position
	slot_540_15_0 = math.floor(slot_540_14_0.x)
	slot_540_17_0 = math.floor(slot_540_14_0.y - math.max(slot_540_6_0, 20) * 0.5)
	slot_540_18_0 = slot_0_118_6

	if slot_540_8_0 and slot_540_9_0 and not slot_540_10_0 then
		slot_540_18_0 = math.floor((math.sin(globals.realtime * 0.9) + 1) * 0.5 * 14)
	end

	slot_540_19_0 = nil
	slot_540_20_0 = nil

	if slot_0_115_10 then
		slot_540_19_0, slot_540_20_0 = slot_0_126_4(slot_540_0_0, slot_0_116_7)
	elseif slot_540_8_0 and slot_540_9_0 and not slot_540_10_0 then
		slot_540_19_0 = "lc status"
		slot_540_20_0 = slot_540_0_0.col_ok:get()
	else
		slot_540_19_0, slot_540_20_0 = slot_0_126_4(slot_540_0_0, slot_540_18_0)
	end

	slot_0_124_3 = slot_0_124_3 + slot_540_1_0 * 1.8

	if slot_540_0_0.show_label:get() then
		slot_540_21_1 = slot_540_19_0 or "lc status"
		slot_540_22_2 = slot_540_20_0 or slot_540_0_0.col_ok:get()
		slot_540_23_2 = render.measure_text(slot_0_114_10, nil, slot_540_21_1)
		slot_540_24_1 = slot_540_15_0 - math.floor(slot_540_23_2.x * 0.5)
		slot_540_25_1 = slot_0_124_3 % 1.3 - 0.15
		slot_540_26_1 = {}

		for iter_540_0 = 1, #slot_540_21_1 do
			slot_540_26_1[iter_540_0] = slot_540_21_1:sub(iter_540_0, iter_540_0)
		end

		slot_540_27_2 = slot_540_23_2.x
		slot_540_28_0 = slot_540_24_1

		for iter_540_1, iter_540_2 in ipairs(slot_540_26_1) do
			slot_540_34_1 = render.measure_text(slot_0_114_10, nil, iter_540_2)
			slot_540_35_1 = (slot_540_28_0 - slot_540_24_1 + slot_540_34_1.x * 0.5) / math.max(slot_540_27_2, 1)
			slot_540_36_1 = math.abs(slot_540_35_1 - slot_540_25_1)
			slot_540_37_2 = math.max(0, 1 - slot_540_36_1 / 0.15)
			slot_540_37_1 = slot_540_37_2 * slot_540_37_2 * slot_540_37_2
			slot_540_38_1 = math.floor(slot_540_12_0 * (slot_540_22_2.a / 255) * (0.88 + slot_540_37_1 * 0.12) * 255)
			slot_540_39_1 = math.min(255, math.floor(slot_540_22_2.r + (255 - slot_540_22_2.r) * slot_540_37_1 * 0.55))
			slot_540_40_1 = math.min(255, math.floor(slot_540_22_2.g + (255 - slot_540_22_2.g) * slot_540_37_1 * 0.55))
			slot_540_41_1 = math.min(255, math.floor(slot_540_22_2.b + (255 - slot_540_22_2.b) * slot_540_37_1 * 0.55))
			slot_540_42_1 = math.floor(slot_540_38_1 * 0.18)

			if slot_540_42_1 > 3 then
				render.text(slot_0_114_10, vector(slot_540_28_0 + 1, slot_540_17_0 + 1), color(0, 0, 0, slot_540_42_1), nil, iter_540_2)
			end

			render.text(slot_0_114_10, vector(slot_540_28_0, slot_540_17_0), color(slot_540_39_1, slot_540_40_1, slot_540_41_1, slot_540_38_1), nil, iter_540_2)

			slot_540_28_0 = slot_540_28_0 + slot_540_34_1.x
		end

		slot_540_17_0 = slot_540_17_0 + slot_540_2_0 + slot_0_109_5
	end

	if slot_540_0_0.show_ticks:get() then
		slot_540_22_1 = (slot_0_115_10 and slot_0_116_7 or slot_540_18_0) .. "t"
		slot_540_23_1 = render.measure_text(slot_0_113_10, nil, slot_540_22_1)

		render.text(slot_0_113_10, vector(slot_540_15_0 - math.floor(slot_540_23_1.x * 0.5), slot_540_17_0), color(185, 185, 190, math.floor(slot_540_13_0 * 0.55)), nil, slot_540_22_1)

		slot_540_17_0 = slot_540_17_0 + slot_540_3_0 + slot_0_109_5
	end

	slot_540_21_0 = slot_0_115_10 and slot_0_116_7 or slot_540_18_0
	slot_540_22_0 = globals.realtime
	slot_540_23_0 = math.min(0.22 * slot_540_1_0 / 0.01667, 0.9)

	if slot_540_0_0.show_bar:get() then
		slot_540_24_0 = slot_0_103_1 * (slot_0_104_2 + slot_0_106_4) - slot_0_106_4
		slot_540_25_0 = slot_540_15_0 - math.floor(slot_540_24_0 * 0.5)
		slot_540_26_0 = slot_540_20_0 or slot_540_0_0.col_ok:get()

		for iter_540_3 = 1, slot_0_103_1 do
			slot_540_32_1 = slot_540_21_0 >= slot_0_103_1 - iter_540_3 + 1 and 1 or 0
			slot_0_122_6[iter_540_3] = slot_0_122_6[iter_540_3] + (slot_540_32_1 - slot_0_122_6[iter_540_3]) * slot_540_23_0
			slot_540_33_0 = slot_0_122_6[iter_540_3]

			if slot_540_33_0 < 0.01 then
				slot_540_33_0 = 0
			end

			slot_540_34_0 = slot_540_25_0 + (iter_540_3 - 1) * (slot_0_104_2 + slot_0_106_4)
			slot_540_35_0 = slot_540_34_0 + slot_0_104_2
			slot_540_36_0 = slot_540_17_0
			slot_540_37_0 = slot_540_36_0 + slot_0_105_3
			slot_540_38_0 = (iter_540_3 - 1) / math.max(slot_0_103_1 - 1, 1)
			slot_540_39_0 = 0

			if slot_540_21_0 >= 12 then
				slot_540_39_0 = (math.sin(slot_540_22_0 * 4.5 + slot_540_38_0 * math.pi * 2) + 1) * 0.5
				slot_540_39_0 = slot_540_39_0 * slot_540_39_0 * 0.45
			end

			slot_540_40_0 = math.floor(slot_540_13_0 * 0.12)

			render.rect(vector(slot_540_34_0, slot_540_36_0), vector(slot_540_35_0, slot_540_37_0), color(18, 18, 22, slot_540_40_0), slot_0_107_3)

			if slot_540_33_0 > 0.005 then
				slot_540_41_0 = math.floor(slot_540_12_0 * slot_540_33_0 * (0.8 + slot_540_39_0 * 0.2) * 255)
				slot_540_42_0 = math.floor(slot_540_41_0 * 0.2 * slot_540_33_0)

				if slot_540_42_0 > 2 then
					render.rect(vector(slot_540_34_0 - 1, slot_540_36_0 - 1), vector(slot_540_35_0 + 1, slot_540_37_0 + 1), color(slot_540_26_0.r, slot_540_26_0.g, slot_540_26_0.b, slot_540_42_0), slot_0_107_3 + 1)
				end

				render.rect(vector(slot_540_34_0, slot_540_36_0), vector(slot_540_35_0, slot_540_37_0), color(slot_540_26_0.r, slot_540_26_0.g, slot_540_26_0.b, slot_540_41_0), slot_0_107_3)

				slot_540_43_0 = math.floor(slot_540_41_0 * 0.2)

				if slot_540_43_0 > 2 then
					render.rect(vector(slot_540_34_0, slot_540_36_0), vector(slot_540_35_0, slot_540_36_0 + math.ceil(slot_0_105_3 * 0.45)), color(255, 255, 255, slot_540_43_0), slot_0_107_3)
				end
			end
		end

		slot_540_27_1 = math.floor(slot_540_13_0 * 0.08)

		if slot_540_27_1 > 1 then
			for iter_540_4 = 1, slot_0_103_1 do
				slot_540_32_0 = slot_540_25_0 + (iter_540_4 - 1) * (slot_0_104_2 + slot_0_106_4)

				render.rect_outline(vector(slot_540_32_0, slot_540_17_0), vector(slot_540_32_0 + slot_0_104_2, slot_540_17_0 + slot_0_105_3), color(255, 255, 255, slot_540_27_1), 1, slot_0_107_3)
			end
		end
	else
		for iter_540_5 = 1, slot_0_103_1 do
			slot_0_122_6[iter_540_5] = 0
		end
	end
end)

slot_0_103_0 = nil
slot_0_104_1 = 120
slot_0_105_2 = 3
slot_0_106_3 = 2
slot_0_107_2 = 3
slot_0_108_3 = 6
slot_0_109_4 = "✓"
slot_0_110_5 = slot_0_52_0:new("bruteforce_indicator", vector(slot_0_14_0.x * 0.5, slot_0_14_0.y - 55), "y")
slot_0_111_11 = slot_0_5_0.new(0)
slot_0_112_10 = render.load_font("Verdana", 13, "ab")
slot_0_113_9 = slot_0_5_0.new(0)
slot_0_114_9 = slot_0_5_0.new(0)
slot_0_115_9 = slot_0_5_0.new(0)
slot_0_116_6 = slot_0_5_0.new(0.5)
slot_0_117_6 = slot_0_5_0.new(0.5)
slot_0_118_5 = {
	rem_n = 0,
	fill_d = 0,
	fill_n = 0,
	active = false,
	prev_fr = 0,
	shim_tr = -9,
	prev_fl = 0,
	shim_tl = -9,
	def_valid = false,
	abf_valid = false,
	def_expire = 0,
	abf_expire = 0,
	reset_d = 3,
	reset_n = 3,
	rem_d = 0,
	alpha = slot_0_5_0.new(0),
	anim_l = slot_0_5_0.new(0),
	anim_r = slot_0_5_0.new(0)
}
slot_0_119_4 = {
	prev_f = 0,
	shim_t = -9,
	col_is_def = false,
	rem = 0,
	active = false,
	expire = 0,
	fill = 0,
	reset = 3,
	alpha = slot_0_5_0.new(0),
	anim = slot_0_5_0.new(0)
}

function slot_0_120_4(arg_542_0, arg_542_1, arg_542_2)
	arg_542_2 = math.max(0, math.min(1, arg_542_2))

	return color(math.floor(arg_542_0.r + (arg_542_1.r - arg_542_0.r) * arg_542_2), math.floor(arg_542_0.g + (arg_542_1.g - arg_542_0.g) * arg_542_2), math.floor(arg_542_0.b + (arg_542_1.b - arg_542_0.b) * arg_542_2), math.floor(arg_542_0.a + (arg_542_1.a - arg_542_0.a) * arg_542_2))
end

function slot_0_121_4(arg_543_0, arg_543_1, arg_543_2, arg_543_3, arg_543_4, arg_543_5, arg_543_6, arg_543_7)
	local var_543_0 = math.floor((arg_543_1 - arg_543_0) * 0.5)
	local var_543_1 = arg_543_0 + var_543_0
	local var_543_2 = math.floor(var_543_0 * arg_543_4)

	if var_543_2 < 1 then
		return
	end

	local var_543_3
	local var_543_4

	if arg_543_7 then
		var_543_3 = var_543_1 - var_543_2
		var_543_4 = var_543_1
	else
		var_543_3 = var_543_1
		var_543_4 = var_543_1 + var_543_2
	end

	local var_543_5 = math.floor(arg_543_6 * 0.16 * arg_543_4)

	if var_543_5 > 2 then
		render.rect(vector(var_543_3, arg_543_2 - 1), vector(var_543_4, arg_543_3 + 2), color(arg_543_5.r, arg_543_5.g, arg_543_5.b, var_543_5), slot_0_106_3)
	end

	render.rect(vector(var_543_3, arg_543_2), vector(var_543_4, arg_543_3), color(arg_543_5.r, arg_543_5.g, arg_543_5.b, math.floor(arg_543_6 * 0.88)), slot_0_106_3)
	render.rect(vector(var_543_3, arg_543_2), vector(var_543_4, arg_543_2 + math.ceil(slot_0_105_2 * 0.5)), color(255, 255, 255, math.floor(arg_543_6 * 0.16)), slot_0_106_3)
end

function slot_0_122_5(arg_544_0, arg_544_1, arg_544_2, arg_544_3)
	local var_544_0 = math.min(arg_544_2 * arg_544_3 / 0.01667, 0.95)

	arg_544_0(var_544_0, arg_544_1)
end

events.render(function()
	slot_545_0_0 = slot_0_59_0.info.abf_ind

	if not slot_545_0_0 then
		return
	end

	slot_545_1_0 = math.max(0.001, math.min(globals.frametime, 0.05))
	slot_545_2_0 = render.measure_text(slot_0_112_10, nil, "A").y
	slot_545_3_0 = slot_545_0_0.switch:get() and slot_545_0_0.show_label:get()
	slot_545_4_0 = slot_545_0_0.switch:get() and slot_545_0_0.show_timer:get()
	slot_545_5_0 = 0

	if slot_545_3_0 then
		slot_545_5_0 = slot_545_5_0 + slot_545_2_0 + (slot_545_4_0 and slot_0_107_2 or 0)
	end

	if slot_545_4_0 then
		slot_545_5_0 = slot_545_5_0 + slot_545_2_0
	end

	slot_545_6_0 = slot_545_5_0 + (slot_545_5_0 > 0 and slot_0_108_3 or 0) + slot_0_105_2

	if not slot_545_0_0.switch:get() then
		slot_0_111_11(0.08, false)
		slot_0_110_5:update(vector(slot_0_104_1, slot_545_6_0))

		return
	end

	slot_545_7_0 = entity.get_local_player()
	slot_545_8_0 = slot_545_7_0 ~= nil and slot_545_7_0:is_alive()
	slot_545_9_0 = ui.get_alpha() > 0
	slot_545_10_0 = false

	if slot_545_9_0 and slot_0_19_0 then
		slot_545_11_1, slot_545_12_1 = pcall(function()
			return slot_0_19_0:get()
		end)
		slot_545_10_0 = slot_545_11_1 and slot_545_12_1 == 2
	end

	slot_545_11_0 = slot_545_9_0 and slot_545_10_0
	slot_545_12_0 = globals.realtime
	slot_545_13_0 = slot_0_70_0.get(slot_0_75_0.is_working)
	slot_545_14_0 = slot_0_59_0.antiaim.defensive
	slot_545_15_0 = slot_0_82_0.ind_latch

	if slot_545_15_0.is_working and slot_545_12_0 >= slot_545_15_0.reset_time then
		slot_545_15_0.is_working = false
		slot_545_15_0.triggered_state = nil
	end

	slot_545_16_0 = slot_0_76_0.def_ind_latch

	if slot_545_16_0.is_working and slot_545_12_0 >= slot_545_16_0.reset_time then
		slot_545_16_0.is_working = false
		slot_545_16_0.triggered_state = nil
	end

	slot_545_17_0 = slot_545_15_0.is_working
	slot_545_18_0 = slot_545_15_0.triggered_state
	slot_545_19_0 = slot_0_59_0.antiaim.angles.builder and slot_545_18_0 and slot_0_59_0.antiaim.angles.builder[slot_545_18_0]
	slot_545_20_0 = slot_545_19_0 and slot_545_19_0.anti_bruteforce and slot_545_19_0.anti_bruteforce:get() or false
	slot_545_21_0 = slot_545_17_0 and slot_545_20_0
	slot_545_22_0 = slot_545_15_0.reset_dur and slot_545_15_0.reset_dur > 0 and slot_545_15_0.reset_dur or slot_545_19_0 and slot_545_19_0.abf_reset_timer and slot_545_19_0.abf_reset_timer:get() or 3
	slot_545_23_1 = slot_545_21_0 and math.max(0, slot_545_15_0.reset_time - slot_545_12_0) or 0
	slot_545_24_0 = slot_545_21_0 and slot_545_22_0 > 0 and math.min(1, slot_545_23_1 / slot_545_22_0) or 0
	slot_545_25_0 = slot_545_16_0.is_working
	slot_545_26_0 = slot_545_16_0.triggered_state
	slot_545_27_0 = slot_545_14_0 and slot_545_14_0.settings and slot_545_26_0 and slot_545_14_0.settings[slot_545_26_0]
	slot_545_28_0 = slot_545_27_0 and slot_545_27_0.def_abf and slot_545_27_0.def_abf:get() or false
	slot_545_29_0 = slot_545_25_0 and slot_545_28_0
	slot_545_30_0 = slot_545_16_0.reset_dur and slot_545_16_0.reset_dur > 0 and slot_545_16_0.reset_dur or slot_545_27_0 and slot_545_27_0.def_abf_reset and slot_545_27_0.def_abf_reset:get() or 3
	slot_545_31_1 = slot_545_29_0 and math.max(0, slot_545_16_0.reset_time - slot_545_12_0) or 0
	slot_545_32_0 = slot_545_29_0 and slot_545_30_0 > 0 and math.min(1, slot_545_31_1 / slot_545_30_0) or 0
	slot_545_33_0 = slot_545_17_0 and slot_545_25_0

	if slot_545_11_0 then
		slot_545_34_1 = 0.3 + 0.55 * ((math.sin(slot_545_12_0 * 1.4) + 1) * 0.5)
		slot_545_35_2 = 0.3 + 0.55 * ((math.sin(slot_545_12_0 * 1.4 + 1.3) + 1) * 0.5)

		slot_0_122_5(slot_0_116_6, slot_545_34_1, 0.12, slot_545_1_0)
		slot_0_122_5(slot_0_117_6, slot_545_35_2, 0.12, slot_545_1_0)

		slot_545_24_0 = slot_0_116_6.value
		slot_545_32_0 = slot_0_117_6.value
		slot_545_23_0 = slot_545_24_0 * slot_545_22_0
		slot_545_31_0 = slot_545_32_0 * slot_545_30_0
		slot_545_21_0 = true
		slot_545_29_0 = true
		slot_545_33_0 = true

		slot_0_122_5(slot_0_118_5.anim_l, slot_545_24_0, 0.12, slot_545_1_0)
		slot_0_122_5(slot_0_118_5.anim_r, slot_545_32_0, 0.12, slot_545_1_0)

		slot_0_118_5.abf_valid = true
		slot_0_118_5.def_valid = true
	end

	slot_545_34_0 = slot_545_8_0 and (slot_545_21_0 or slot_545_29_0) or slot_545_11_0

	slot_0_111_11(0.07, slot_545_34_0)

	if slot_545_33_0 and not slot_545_11_0 and not (slot_0_119_4.active and slot_0_119_4.alpha.value > 0.01) and not slot_0_118_5.active then
		slot_0_118_5.active = true
		slot_0_118_5.abf_expire = slot_545_15_0.reset_time
		slot_0_118_5.def_expire = slot_545_16_0.reset_time
		slot_0_118_5.reset_n = slot_545_22_0
		slot_0_118_5.reset_d = slot_545_30_0
		slot_0_118_5.shim_tl = -9
		slot_0_118_5.prev_fl = 0
		slot_0_118_5.shim_tr = -9
		slot_0_118_5.prev_fr = 0

		slot_0_118_5.anim_l(1, slot_545_24_0)
		slot_0_118_5.anim_r(1, slot_545_32_0)
	end

	if slot_0_118_5.active then
		slot_545_35_1 = slot_545_12_0 < slot_0_118_5.abf_expire
		slot_545_36_1 = slot_545_12_0 < slot_0_118_5.def_expire
		slot_0_118_5.abf_valid = slot_545_35_1
		slot_0_118_5.def_valid = slot_545_36_1

		if slot_545_35_1 then
			slot_0_118_5.rem_n = math.max(0, slot_0_118_5.abf_expire - slot_545_12_0)
			slot_0_118_5.fill_n = slot_0_118_5.reset_n > 0 and math.min(1, slot_0_118_5.rem_n / slot_0_118_5.reset_n) or 0
		else
			slot_0_118_5.rem_n = 0
			slot_0_118_5.fill_n = 0
		end

		if slot_545_36_1 then
			slot_0_118_5.rem_d = math.max(0, slot_0_118_5.def_expire - slot_545_12_0)
			slot_0_118_5.fill_d = slot_0_118_5.reset_d > 0 and math.min(1, slot_0_118_5.rem_d / slot_0_118_5.reset_d) or 0
		else
			slot_0_118_5.rem_d = 0
			slot_0_118_5.fill_d = 0
		end

		slot_545_37_1 = slot_545_35_1 or slot_545_36_1

		slot_0_118_5.alpha(0.07, slot_545_37_1)

		if slot_0_118_5.alpha.value <= 0.01 then
			slot_0_118_5.active = false
			slot_0_118_5.abf_valid = false
			slot_0_118_5.def_valid = false
		end
	end

	slot_545_35_0 = slot_545_21_0 and not slot_545_29_0 or slot_545_29_0 and not slot_545_21_0
	slot_545_36_0 = slot_0_118_5.active and slot_0_118_5.alpha.value > 0.01

	if slot_0_119_4.active then
		slot_545_37_0 = slot_0_119_4.alpha.value > 0.01
	end

	if slot_545_35_0 and not slot_545_33_0 and not slot_0_119_4.active and not slot_545_36_0 and not slot_545_11_0 then
		slot_0_119_4.active = true
		slot_0_119_4.col_is_def = slot_545_29_0 and not slot_545_21_0

		if slot_0_119_4.col_is_def then
			slot_0_119_4.expire = slot_545_16_0.reset_time
			slot_0_119_4.reset = slot_545_30_0
			slot_545_38_3 = slot_545_32_0

			slot_0_119_4.anim(1, slot_545_38_3)
		else
			slot_0_119_4.expire = slot_545_15_0.reset_time
			slot_0_119_4.reset = slot_545_22_0
			slot_545_38_2 = slot_545_24_0

			slot_0_119_4.anim(1, slot_545_38_2)
		end

		slot_0_119_4.shim_t = -9
		slot_0_119_4.prev_f = 0
	end

	if slot_0_119_4.active then
		slot_545_38_1 = slot_545_12_0 < slot_0_119_4.expire

		if slot_545_38_1 then
			slot_0_119_4.rem = math.max(0, slot_0_119_4.expire - slot_545_12_0)
			slot_0_119_4.fill = slot_0_119_4.reset > 0 and math.min(1, slot_0_119_4.rem / slot_0_119_4.reset) or 0
		else
			slot_0_119_4.rem = 0
			slot_0_119_4.fill = 0
		end

		slot_0_119_4.alpha(0.07, slot_545_38_1)

		if slot_0_119_4.alpha.value <= 0.01 then
			slot_0_119_4.active = false
		end
	end

	slot_0_110_5:update(vector(slot_0_104_1, slot_545_6_0))

	if slot_545_11_0 then
		slot_0_48_0(slot_0_110_5.position, vector(slot_0_104_1, slot_545_6_0), math.max(slot_0_110_5.hover_anim, slot_0_110_5.grab_anim))
	end

	slot_545_38_0 = slot_545_0_0.col_bar:get()
	slot_545_39_0 = slot_545_0_0.col_bar_def and slot_545_0_0.col_bar_def:get() or color(255, 140, 80, 255)
	slot_545_40_0 = slot_545_0_0.col_idle:get()
	slot_545_41_0 = slot_0_110_5.position
	slot_545_42_0 = math.floor(slot_545_41_0.x)

	if slot_0_118_5.active and slot_0_118_5.alpha.value > 0.01 or slot_545_11_0 then
		slot_545_43_1 = slot_545_11_0 and 255 or math.floor(slot_0_118_5.alpha.value * 255)
		slot_545_44_1 = math.floor(slot_545_41_0.y - slot_545_6_0 * 0.5)
		slot_545_45_1 = slot_545_11_0 and slot_0_116_6.value or slot_0_118_5.fill_n
		slot_545_46_1 = slot_545_11_0 and slot_0_117_6.value or slot_0_118_5.fill_d
		slot_545_47_1 = slot_545_11_0 and slot_545_45_1 * slot_545_22_0 or slot_0_118_5.rem_n
		slot_545_48_1 = slot_545_11_0 and slot_545_46_1 * slot_545_30_0 or slot_0_118_5.rem_d

		if slot_545_11_0 then
			-- block empty
		end

		slot_545_49_1 = not slot_0_118_5.abf_valid

		if slot_545_11_0 then
			-- block empty
		end

		slot_545_50_1 = not slot_0_118_5.def_valid

		slot_0_122_5(slot_0_118_5.anim_l, slot_545_45_1, 0.1, slot_545_1_0)
		slot_0_122_5(slot_0_118_5.anim_r, slot_545_46_1, 0.1, slot_545_1_0)

		slot_545_51_1 = math.max(0, math.min(1, slot_0_118_5.anim_l.value))
		slot_545_52_3 = math.max(0, math.min(1, slot_0_118_5.anim_r.value))

		if slot_0_118_5.prev_fl < 0.97 and slot_545_51_1 >= 0.97 then
			slot_0_118_5.shim_tl = slot_545_12_0
		end

		slot_0_118_5.prev_fl = slot_545_51_1

		if slot_0_118_5.prev_fr < 0.97 and slot_545_52_3 >= 0.97 then
			slot_0_118_5.shim_tr = slot_545_12_0
		end

		slot_0_118_5.prev_fr = slot_545_52_3
		slot_545_53_2 = math.max(0, math.min(1, (slot_545_12_0 - slot_0_118_5.shim_tl) / 0.55))
		slot_545_54_2 = slot_545_53_2 < 1 and math.sin(slot_545_53_2 * math.pi) or 0
		slot_545_55_1 = math.max(0, math.min(1, (slot_545_12_0 - slot_0_118_5.shim_tr) / 0.55))
		slot_545_56_1 = slot_545_55_1 < 1 and math.sin(slot_545_55_1 * math.pi) or 0

		if slot_545_3_0 then
			slot_545_57_3 = render.measure_text(slot_0_112_10, nil, "bruteforce")

			render.text(slot_0_112_10, vector(slot_545_42_0 - math.floor(slot_545_57_3.x * 0.5), slot_545_44_1), color(105, 105, 110, math.floor(slot_545_43_1 * 0.78)), nil, "bruteforce")

			slot_545_44_1 = slot_545_44_1 + slot_545_2_0 + slot_0_107_2
		end

		if slot_545_4_0 then
			slot_545_57_2 = math.floor(slot_0_104_1 * 0.5)

			if slot_545_49_1 then
				slot_545_58_5 = slot_0_120_4(color(105, 105, 110, 255), slot_545_38_0, slot_545_51_1)
				slot_545_59_6 = render.measure_text(slot_0_112_10, nil, slot_0_109_4)

				render.text(slot_0_112_10, vector(slot_545_42_0 - slot_545_57_2 + math.floor((slot_545_57_2 - slot_545_59_6.x) * 0.5), slot_545_44_1), color(slot_545_58_5.r, slot_545_58_5.g, slot_545_58_5.b, math.floor(slot_545_43_1 * 0.88)), nil, slot_0_109_4)
			else
				slot_545_58_4 = ("%.1fs"):format(slot_545_47_1)
				slot_545_59_5 = render.measure_text(slot_0_112_10, nil, slot_545_58_4)
				slot_545_60_2 = slot_0_120_4(color(105, 105, 110, 255), slot_545_38_0, slot_545_51_1)

				render.text(slot_0_112_10, vector(slot_545_42_0 - slot_545_57_2 + math.floor((slot_545_57_2 - slot_545_59_5.x) * 0.5), slot_545_44_1), color(slot_545_60_2.r, slot_545_60_2.g, slot_545_60_2.b, math.floor(slot_545_43_1 * 0.88)), nil, slot_545_58_4)
			end

			if slot_545_50_1 then
				slot_545_58_3 = slot_0_120_4(color(105, 105, 110, 255), slot_545_39_0, slot_545_52_3)
				slot_545_59_4 = render.measure_text(slot_0_112_10, nil, slot_0_109_4)

				render.text(slot_0_112_10, vector(slot_545_42_0 + math.floor((slot_545_57_2 - slot_545_59_4.x) * 0.5), slot_545_44_1), color(slot_545_58_3.r, slot_545_58_3.g, slot_545_58_3.b, math.floor(slot_545_43_1 * 0.88)), nil, slot_0_109_4)
			else
				slot_545_58_2 = ("%.1fs"):format(slot_545_48_1)
				slot_545_59_3 = render.measure_text(slot_0_112_10, nil, slot_545_58_2)
				slot_545_60_1 = slot_0_120_4(color(105, 105, 110, 255), slot_545_39_0, slot_545_52_3)

				render.text(slot_0_112_10, vector(slot_545_42_0 + math.floor((slot_545_57_2 - slot_545_59_3.x) * 0.5), slot_545_44_1), color(slot_545_60_1.r, slot_545_60_1.g, slot_545_60_1.b, math.floor(slot_545_43_1 * 0.88)), nil, slot_545_58_2)
			end

			slot_545_44_1 = slot_545_44_1 + slot_545_2_0
		end

		slot_545_57_1 = slot_545_42_0 - math.floor(slot_0_104_1 * 0.5)
		slot_545_58_1 = slot_545_57_1 + slot_0_104_1
		slot_545_59_2 = slot_545_44_1 + (slot_545_5_0 > 0 and slot_0_108_3 or 0)
		slot_545_60_0 = slot_545_59_2 + slot_0_105_2
		slot_545_61_0 = slot_545_57_1 + math.floor(slot_0_104_1 * 0.5)

		render.rect(vector(slot_545_57_1, slot_545_59_2), vector(slot_545_58_1, slot_545_60_0), color(255, 255, 255, math.floor(slot_545_43_1 * 0.09)), slot_0_106_3)

		if not slot_545_49_1 then
			slot_0_121_4(slot_545_57_1, slot_545_58_1, slot_545_59_2, slot_545_60_0, slot_545_51_1, slot_0_120_4(slot_545_40_0, slot_545_38_0, slot_545_51_1), slot_545_43_1, true)
		end

		if not slot_545_50_1 then
			slot_0_121_4(slot_545_57_1, slot_545_58_1, slot_545_59_2, slot_545_60_0, slot_545_52_3, slot_0_120_4(slot_545_40_0, slot_545_39_0, slot_545_52_3), slot_545_43_1, false)
		end

		slot_545_62_0 = math.floor(slot_0_104_1 * 0.5)
		slot_545_63_0 = slot_545_57_1 + slot_545_62_0

		if not slot_545_49_1 then
			slot_545_64_1 = math.floor(slot_545_62_0 * slot_545_51_1)

			if slot_545_64_1 > 1 then
				slot_545_65_1 = slot_545_63_0 - slot_545_64_1

				if slot_545_54_2 > 0.01 then
					render.rect(vector(slot_545_65_1, slot_545_59_2), vector(slot_545_63_0, slot_545_60_0), color(255, 255, 255, math.floor(slot_545_43_1 * 0.45 * slot_545_54_2)), slot_0_106_3)
				end

				if slot_545_51_1 >= 0.97 then
					slot_545_66_3 = (math.sin(slot_545_12_0 * 3.2) + 1) * 0.5
					slot_545_66_2 = slot_545_66_3 * slot_545_66_3
					slot_545_67_1 = slot_0_120_4(slot_545_40_0, slot_545_38_0, slot_545_51_1)

					if slot_545_66_2 > 0.01 then
						render.rect(vector(slot_545_65_1 - 2, slot_545_59_2 - 2), vector(slot_545_63_0 + 2, slot_545_60_0 + 2), color(slot_545_67_1.r, slot_545_67_1.g, slot_545_67_1.b, math.floor(slot_545_43_1 * 0.2 * slot_545_66_2)), slot_0_106_3 + 1)
					end
				end
			end
		end

		if not slot_545_50_1 then
			slot_545_64_0 = math.floor(slot_545_62_0 * slot_545_52_3)

			if slot_545_64_0 > 1 then
				slot_545_65_0 = slot_545_63_0 + slot_545_64_0

				if slot_545_56_1 > 0.01 then
					render.rect(vector(slot_545_63_0, slot_545_59_2), vector(slot_545_65_0, slot_545_60_0), color(255, 255, 255, math.floor(slot_545_43_1 * 0.45 * slot_545_56_1)), slot_0_106_3)
				end

				if slot_545_52_3 >= 0.97 then
					slot_545_66_1 = (math.sin(slot_545_12_0 * 3.2 + 1.57) + 1) * 0.5
					slot_545_66_0 = slot_545_66_1 * slot_545_66_1
					slot_545_67_0 = slot_0_120_4(slot_545_40_0, slot_545_39_0, slot_545_52_3)

					if slot_545_66_0 > 0.01 then
						render.rect(vector(slot_545_63_0 - 2, slot_545_59_2 - 2), vector(slot_545_65_0 + 2, slot_545_60_0 + 2), color(slot_545_67_0.r, slot_545_67_0.g, slot_545_67_0.b, math.floor(slot_545_43_1 * 0.2 * slot_545_66_0)), slot_0_106_3 + 1)
					end
				end
			end
		end

		render.rect(vector(slot_545_61_0, slot_545_59_2 - 1), vector(slot_545_61_0 + 1, slot_545_60_0 + 1), color(255, 255, 255, math.floor(slot_545_43_1 * 0.55)), 0)
	end

	if slot_0_119_4.active and slot_0_119_4.alpha.value > 0.01 then
		slot_545_43_0 = math.floor(slot_0_119_4.alpha.value * 255)
		slot_545_44_0 = math.floor(slot_545_41_0.y - slot_545_6_0 * 0.5)
		slot_545_45_0 = slot_0_119_4.col_is_def and slot_545_39_0 or slot_545_38_0
		slot_545_46_0 = slot_0_119_4.fill
		slot_545_47_0 = slot_0_119_4.rem

		if slot_545_11_0 then
			slot_545_46_0 = slot_0_116_6.value
			slot_545_47_0 = slot_545_46_0 * slot_0_119_4.reset
		end

		slot_0_122_5(slot_0_119_4.anim, slot_545_46_0, 0.1, slot_545_1_0)

		slot_545_48_0 = math.max(0, math.min(1, slot_0_119_4.anim.value))

		if slot_0_119_4.prev_f < 0.97 and slot_545_48_0 >= 0.97 then
			slot_0_119_4.shim_t = slot_545_12_0
		end

		slot_0_119_4.prev_f = slot_545_48_0
		slot_545_49_0 = math.max(0, math.min(1, (slot_545_12_0 - slot_0_119_4.shim_t) / 0.55))
		slot_545_50_0 = slot_545_49_0 < 1 and math.sin(slot_545_49_0 * math.pi) or 0
		slot_545_51_0 = slot_0_120_4(slot_545_40_0, slot_545_45_0, slot_545_48_0)

		if slot_545_3_0 then
			slot_545_52_2 = render.measure_text(slot_0_112_10, nil, "bruteforce")

			render.text(slot_0_112_10, vector(slot_545_42_0 - math.floor(slot_545_52_2.x * 0.5), slot_545_44_0), color(105, 105, 110, math.floor(slot_545_43_0 * 0.78)), nil, "bruteforce")

			slot_545_44_0 = slot_545_44_0 + slot_545_2_0 + slot_0_107_2
		end

		if slot_545_4_0 then
			slot_545_52_1 = ("%.1fs"):format(slot_545_47_0)
			slot_545_53_1 = render.measure_text(slot_0_112_10, nil, slot_545_52_1)
			slot_545_54_1 = slot_0_120_4(color(105, 105, 110, 255), slot_545_45_0, slot_545_48_0)

			render.text(slot_0_112_10, vector(slot_545_42_0 - math.floor(slot_545_53_1.x * 0.5) + 1, slot_545_44_0 + 1), color(0, 0, 0, math.floor(slot_545_43_0 * 0.18)), nil, slot_545_52_1)
			render.text(slot_0_112_10, vector(slot_545_42_0 - math.floor(slot_545_53_1.x * 0.5), slot_545_44_0), color(slot_545_54_1.r, slot_545_54_1.g, slot_545_54_1.b, math.floor(slot_545_43_0 * 0.88)), nil, slot_545_52_1)

			slot_545_44_0 = slot_545_44_0 + slot_545_2_0
		end

		slot_545_52_0 = slot_545_42_0 - math.floor(slot_0_104_1 * 0.5)
		slot_545_53_0 = slot_545_52_0 + slot_0_104_1
		slot_545_54_0 = slot_545_44_0 + (slot_545_5_0 > 0 and slot_0_108_3 or 0)
		slot_545_55_0 = slot_545_54_0 + slot_0_105_2

		render.rect(vector(slot_545_52_0, slot_545_54_0), vector(slot_545_53_0, slot_545_55_0), color(255, 255, 255, math.floor(slot_545_43_0 * 0.09)), slot_0_106_3)

		slot_545_56_0 = math.floor(slot_0_104_1 * slot_545_48_0)

		if slot_545_56_0 > 1 then
			slot_545_57_0 = slot_545_52_0 + slot_545_56_0
			slot_545_58_0 = math.floor(slot_545_43_0 * 0.16 * slot_545_48_0)

			if slot_545_58_0 > 2 then
				render.rect(vector(slot_545_52_0, slot_545_54_0 - 1), vector(slot_545_57_0, slot_545_55_0 + 2), color(slot_545_51_0.r, slot_545_51_0.g, slot_545_51_0.b, slot_545_58_0), slot_0_106_3)
			end

			render.rect(vector(slot_545_52_0, slot_545_54_0), vector(slot_545_57_0, slot_545_55_0), color(slot_545_51_0.r, slot_545_51_0.g, slot_545_51_0.b, math.floor(slot_545_43_0 * 0.88)), slot_0_106_3)
			render.rect(vector(slot_545_52_0, slot_545_54_0), vector(slot_545_57_0, slot_545_54_0 + math.ceil(slot_0_105_2 * 0.5)), color(255, 255, 255, math.floor(slot_545_43_0 * 0.16)), slot_0_106_3)

			if slot_545_50_0 > 0.01 then
				render.rect(vector(slot_545_52_0, slot_545_54_0), vector(slot_545_57_0, slot_545_55_0), color(255, 255, 255, math.floor(slot_545_43_0 * 0.45 * slot_545_50_0)), slot_0_106_3)
			end

			if slot_545_48_0 >= 0.97 then
				slot_545_59_1 = (math.sin(slot_545_12_0 * 3.2) + 1) * 0.5
				slot_545_59_0 = slot_545_59_1 * slot_545_59_1

				if slot_545_59_0 > 0.01 then
					render.rect(vector(slot_545_52_0 - 2, slot_545_54_0 - 2), vector(slot_545_57_0 + 2, slot_545_55_0 + 2), color(slot_545_51_0.r, slot_545_51_0.g, slot_545_51_0.b, math.floor(slot_545_43_0 * 0.2 * slot_545_59_0)), slot_0_106_3 + 1)
				end
			end
		end
	end
end)

slot_0_104_0 = nil
slot_0_105_1 = "ground"
slot_0_106_2 = 0
slot_0_107_1 = {}
slot_0_108_2 = 0
slot_0_109_3 = false
slot_0_110_4 = 3
slot_0_111_10 = 0
slot_0_112_9 = 0

function slot_0_113_8()
	slot_0_105_1 = "ground"
	slot_0_106_2 = 0
	slot_0_110_4 = 3
	slot_0_111_10 = 0
	slot_0_112_9 = 0
	slot_0_107_1 = {}
	slot_0_108_2 = 0
	slot_0_109_3 = false
	slot_0_76_0.head_vuln_ticks = 0

	pcall(function()
		slot_0_11_0.antiaim.fake_lag.limit:override()
		slot_0_11_0.rage.main.double_tap_lag_options:override()
	end)
end

events.createmove(function()
	local var_549_0 = entity.get_local_player()

	if not var_549_0 or not var_549_0:is_alive() then
		slot_0_113_8()

		return
	end

	local var_549_1, var_549_2 = pcall(function()
		return slot_0_11_0.rage.main.double_tap:get()
	end)
	local var_549_3 = var_549_1 and var_549_2
	local var_549_4 = 14
	local var_549_5 = 6
	local var_549_6 = 14
	local var_549_7 = var_549_0.m_fFlags
	local var_549_8 = var_549_7 == 257 or var_549_7 == 263

	if slot_0_109_3 then
		slot_0_108_2 = slot_0_108_2 + 1
	end

	if slot_0_112_9 > 0 then
		slot_0_112_9 = slot_0_112_9 - 1
	end

	if var_549_8 then
		slot_0_110_4 = slot_0_110_4 + 1

		if slot_0_105_1 ~= "ground" then
			slot_0_111_10 = 0
		end

		slot_0_105_1 = "ground"
		slot_0_106_2 = 0
		slot_0_109_3 = false
	else
		if slot_0_105_1 == "ground" then
			local var_549_9 = slot_0_110_4 <= 3

			slot_0_110_4 = 0
			slot_0_105_1 = "air"
			slot_0_106_2 = 1
			slot_0_108_2 = 0
			slot_0_109_3 = true
			slot_0_107_1 = {}

			if var_549_9 and slot_0_112_9 == 0 then
				slot_0_111_10 = var_549_4
			else
				slot_0_111_10 = 0
			end
		else
			slot_0_106_2 = slot_0_106_2 + 1
		end

		if slot_0_111_10 > 0 and var_549_3 then
			if slot_0_76_0.is_active and slot_0_111_10 <= var_549_4 - var_549_5 then
				slot_0_111_10 = 0
				slot_0_112_9 = var_549_6
			else
				slot_0_111_10 = slot_0_111_10 - 1
			end
		end
	end

	if not slot_0_84_0.active and not slot_0_76_0.is_active and not slot_0_77_0.should_force() then
		slot_0_11_0.antiaim.fake_lag.limit:override()
		slot_0_11_0.rage.main.double_tap_lag_options:override()
	end

	slot_0_76_0.head_vuln_ticks = slot_0_111_10
end)
events.level_change(slot_0_113_8)
events.round_start(slot_0_113_8)

slot_0_105_0 = nil

function slot_0_106_1(arg_551_0, arg_551_1)
	if not slot_0_59_0.misc.movement.fall_damage:get() then
		return false
	end

	local var_551_0 = arg_551_0:get_origin()
	local var_551_1 = math.pi

	for iter_551_0 = 0, var_551_1 * 2, var_551_1 / 4 do
		if utils.trace_line(var_551_0, var_551_0 + vector(10 * math.cos(iter_551_0), 10 * math.sin(iter_551_0), -arg_551_1), arg_551_0).fraction < 0.9921875 then
			return true
		end
	end

	return false
end

events.createmove(function(arg_552_0)
	if not slot_0_59_0.misc.movement.fall_damage:get() then
		return false
	end

	local var_552_0 = entity.get_local_player()

	if var_552_0 == nil or not var_552_0:is_alive() then
		return
	end

	if var_552_0.m_vecVelocity.z >= -500 then
		return
	end

	arg_552_0.in_duck = not slot_0_106_1(var_552_0, 15) and slot_0_106_1(var_552_0, 75)
end)

slot_0_106_0 = nil

events.createmove(function(arg_553_0)
	if not slot_0_59_0.misc.movement.fast_ladder:get() then
		return
	end

	if arg_553_0.in_use then
		return
	end

	local var_553_0 = entity.get_local_player()

	if var_553_0 == nil or not var_553_0:is_alive() then
		return
	end

	if var_553_0.m_MoveType ~= 9 then
		return
	end

	local var_553_1 = var_553_0:get_player_weapon()

	if var_553_1 == nil or var_553_1.m_bPinPulled then
		return
	end

	if render.camera_angles().x < 45 and arg_553_0.forwardmove ~= 0 then
		local var_553_2 = arg_553_0.forwardmove > 0

		arg_553_0.view_angles.x = 89
		arg_553_0.in_forward = not var_553_2
		arg_553_0.in_back = var_553_2
		arg_553_0.in_moveleft = not var_553_2
		arg_553_0.in_moveright = var_553_2

		if arg_553_0.sidemove == 0 then
			arg_553_0.view_angles.y = arg_553_0.view_angles.y + 90
		elseif arg_553_0.sidemove < 0 then
			arg_553_0.view_angles.y = arg_553_0.view_angles.y + (var_553_2 and 150 or 30)
		elseif arg_553_0.sidemove > 0 then
			arg_553_0.view_angles.y = arg_553_0.view_angles.y + (var_553_2 and 30 or 150)
		end
	end
end)

slot_0_107_0 = nil
slot_0_108_1 = {}
slot_0_109_2 = {}
slot_0_110_3 = render.load_font("Verdana", 14, "ab")
slot_0_111_9 = "✦"

events.createmove(function(arg_554_0)
	if not slot_0_59_0.misc.drink.enabled:get() then
		slot_0_108_1 = {}

		return
	end

	if entity.get_threat(true) then
		slot_0_108_1 = {}

		return
	end

	local var_554_0 = entity.get_local_player()

	if not var_554_0 or not var_554_0:is_alive() then
		slot_0_108_1 = {}

		return
	end

	slot_0_108_1 = {}

	if var_554_0.m_iHealth > 100 then
		return
	end

	local var_554_1 = var_554_0:get_eye_position()
	local var_554_2 = entity.get_entities("CPhysicsProp")
	local var_554_3 = false

	if arg_554_0.choked_commands == 0 then
		var_554_3 = true
	end

	for iter_554_0 = 1, #var_554_2 do
		local var_554_4 = var_554_2[iter_554_0]

		if not var_554_4 then
			-- block empty
		else
			local var_554_5 = var_554_4:get_origin()
			local var_554_6 = var_554_1:dist(var_554_5)

			slot_0_108_1[iter_554_0] = var_554_5

			if var_554_6 > 88 then
				-- block empty
			else
				local var_554_7 = utils.trace_line(var_554_1, var_554_5, var_554_0)

				if not var_554_7.entity or var_554_7.entity:get_index() == 0 then
					-- block empty
				else
					local var_554_8 = var_554_1:to(var_554_5):angles()

					if var_554_3 then
						var_554_3 = false
						arg_554_0.no_choke = true
						arg_554_0.view_angles = var_554_8
						arg_554_0.in_use = true
					end
				end
			end
		end
	end
end)
events.render(function()
	if not slot_0_59_0.misc.drink.enabled:get() then
		return
	end

	if not slot_0_59_0.misc.drink.esp:get() then
		return
	end

	local var_555_0 = entity.get_local_player()

	if not var_555_0 or not var_555_0:is_alive() then
		return
	end

	local var_555_1 = var_555_0:get_eye_position()
	local var_555_2 = slot_0_59_0.misc.drink.esp_color:get()
	local var_555_3 = slot_0_59_0.misc.drink.distance:get()
	local var_555_4 = globals.realtime
	local var_555_5 = #slot_0_108_1

	for iter_555_0 in pairs(slot_0_109_2) do
		if var_555_5 < iter_555_0 then
			slot_0_109_2[iter_555_0] = nil
		end
	end

	for iter_555_1 = 1, var_555_5 do
		local var_555_6 = slot_0_108_1[iter_555_1]

		if not var_555_6 then
			-- block empty
		else
			local var_555_7 = var_555_1:dist(var_555_6)
			local var_555_8 = 1

			if var_555_7 > var_555_3 * 0.6 then
				var_555_8 = math.max(0, 1 - (var_555_7 - var_555_3 * 0.6) / (var_555_3 * 0.4))
			end

			if var_555_3 < var_555_7 then
				var_555_8 = 0
			end

			if not slot_0_109_2[iter_555_1] then
				slot_0_109_2[iter_555_1] = {
					alpha = 0,
					breath_off = math.random() * math.pi * 2,
					ping_phase = iter_555_1 * 0.73 % 1
				}
			end

			local var_555_9 = slot_0_109_2[iter_555_1]
			local var_555_10 = var_555_8 > var_555_9.alpha and 0.08 or 0.04

			var_555_9.alpha = var_555_9.alpha + (var_555_8 - var_555_9.alpha) * var_555_10

			local var_555_11 = var_555_9.alpha

			if var_555_11 < 0.008 then
				-- block empty
			else
				local var_555_12 = render.world_to_screen(var_555_6)

				if not var_555_12 then
					-- block empty
				else
					local var_555_13 = var_555_2.a / 255
					local var_555_14 = (math.sin(var_555_4 * 1.4 + var_555_9.breath_off) + 1) * 0.5
					local var_555_15 = math.floor(var_555_13 * var_555_11 * (0.7 + var_555_14 * 0.3) * 255)

					if var_555_15 > 4 then
						local var_555_16 = render.measure_text(slot_0_110_3, nil, slot_0_111_9)
						local var_555_17 = math.floor(var_555_12.x - var_555_16.x * 0.5)
						local var_555_18 = math.floor(var_555_12.y - var_555_16.y * 0.5)
						local var_555_19 = math.floor(var_555_15 * 0.25)

						if var_555_19 > 2 then
							render.text(slot_0_110_3, vector(var_555_17 + 1, var_555_18 + 1), color(0, 0, 0, var_555_19), nil, slot_0_111_9)
						end

						render.text(slot_0_110_3, vector(var_555_17, var_555_18), color(var_555_2.r, var_555_2.g, var_555_2.b, var_555_15), nil, slot_0_111_9)
					end
				end
			end
		end
	end
end)

slot_0_108_0 = nil
slot_0_109_1 = ffi.typeof("        struct {\n            char  pad_0000[20];\n            int m_nOrder;\n            int m_nSequence;\n            float m_flPrevCycle;\n            float m_flWeight;\n            float m_flWeightDeltaRate;\n            float m_flPlaybackRate;\n            float m_flCycle;\n            void *m_pOwner;\n            char  pad_0038[4];\n        } **\n    ")
slot_0_110_2 = 0
slot_0_111_8 = 0

function slot_0_112_8(arg_556_0)
	local var_556_0 = entity.get_local_player()

	if var_556_0 == nil then
		return
	end

	if arg_556_0 ~= var_556_0 then
		return
	end

	local var_556_1 = slot_0_59_0.misc.animbreaker

	if not var_556_1.enabled:get() then
		return
	end

	local var_556_2 = var_556_1.types
	local var_556_3 = bit.band(var_556_0.m_fFlags, 1) == 1

	if not var_556_3 and var_556_2:get("in air") then
		local var_556_4 = var_556_1.in_air_type:get()

		if var_556_4 == "static" then
			var_556_0.m_flPoseParameter[6] = 1
		elseif var_556_4 == "reverse running" then
			pcall(function()
				ffi.cast(slot_0_109_1, ffi.cast("uintptr_t", arg_556_0[0]) + 10640)[0][6].m_flWeight = 1
			end)
		end
	elseif var_556_3 and var_556_2:get("on ground") then
		local var_556_5 = var_556_1.on_ground_type:get()

		if var_556_5 == "static" then
			var_556_0.m_flPoseParameter[0] = 1

			slot_0_11_0.antiaim.misc.leg_movement:override("Sliding")
		elseif var_556_5 == "jitter" then
			var_556_0.m_flPoseParameter[globals.client_tick % 3] = 3

			slot_0_11_0.antiaim.misc.leg_movement:override("Sliding")
		elseif var_556_5 == "reverse running" then
			var_556_0.m_flPoseParameter[7] = -1

			slot_0_11_0.antiaim.misc.leg_movement:override("Walking")
		end
	end

	if var_556_2:get("pitch zero on land") then
		if var_556_3 then
			slot_0_110_2 = slot_0_110_2 + 1
		else
			slot_0_110_2 = 0
			slot_0_111_8 = globals.curtime + 1
		end

		if slot_0_110_2 > 15 and slot_0_111_8 > globals.curtime then
			var_556_0.m_flPoseParameter[12] = 0.5
		end
	end
end

events.post_update_clientside_animation(function(arg_558_0)
	if not arg_558_0 or arg_558_0[0] == nil then
		return
	end

	slot_0_112_8(arg_558_0)
end)

slot_0_109_0 = nil
slot_0_110_1 = "✦"
slot_0_111_7 = render.load_font("Verdana", 10, "ab")
slot_0_112_7 = {}
slot_0_113_7 = 0
slot_0_114_8 = {}

function slot_0_115_8(arg_559_0)
	arg_559_0 = 1 - arg_559_0

	return 1 - arg_559_0 * arg_559_0 * arg_559_0
end

events.player_hurt(function(arg_560_0)
	if arg_560_0.health <= 0 then
		local var_560_0 = entity.get_local_player()
		local var_560_1 = var_560_0 and entity.get(arg_560_0.attacker, true)

		if var_560_1 and var_560_0 and var_560_1:get_index() == var_560_0:get_index() then
			local var_560_2 = entity.get(arg_560_0.userid, true)

			if var_560_2 then
				slot_0_114_8[var_560_2:get_index()] = true
			end
		end
	end
end)
events.aim_ack(function(arg_561_0)
	local var_561_0 = slot_0_59_0.info.hitmarker

	if not var_561_0 or not var_561_0.enabled:get() then
		return
	end

	local var_561_1 = entity.get_local_player()

	if var_561_1 == nil or not var_561_1:is_alive() then
		return
	end

	local var_561_2 = arg_561_0.aim

	if not var_561_2 or var_561_2.x == nil then
		return
	end

	local var_561_3 = arg_561_0.state == nil
	local var_561_4 = false

	if var_561_3 and arg_561_0.target then
		local var_561_5 = arg_561_0.target:get_index()

		if slot_0_114_8[var_561_5] then
			var_561_4 = true
			slot_0_114_8[var_561_5] = nil
		end
	end

	slot_0_113_7 = slot_0_113_7 + 1
	slot_0_112_7[slot_0_113_7] = {
		fade = 1,
		pos = vector(var_561_2.x, var_561_2.y, var_561_2.z),
		is_hit = var_561_3,
		is_kill = var_561_4
	}
end)
events.render(function()
	slot_562_0_0 = slot_0_59_0.info.hitmarker

	if not slot_562_0_0 or not slot_562_0_0.enabled:get() then
		return
	end

	slot_562_1_0 = slot_562_0_0.duration:get()

	if slot_562_1_0 <= 0 then
		slot_0_112_7 = {}

		return
	end

	slot_562_2_0 = globals.frametime

	for iter_562_0, iter_562_1 in pairs(slot_0_112_7) do
		iter_562_1.fade = iter_562_1.fade - slot_562_2_0 / slot_562_1_0

		if iter_562_1.fade <= 0 then
			slot_0_112_7[iter_562_0] = nil
		else
			slot_562_8_0 = render.world_to_screen(iter_562_1.pos)

			if slot_562_8_0 then
				slot_562_9_0 = iter_562_1.fade
				slot_562_10_0 = slot_562_9_0 < 0.25 and slot_562_9_0 / 0.25 or 1
				slot_562_11_0 = nil

				if iter_562_1.is_kill then
					slot_562_11_0 = slot_562_0_0.col_kill:get()
				elseif iter_562_1.is_hit then
					slot_562_11_0 = slot_562_0_0.col_hit:get()
				else
					slot_562_11_0 = slot_562_0_0.col_miss:get()
				end

				slot_562_12_0 = slot_562_11_0.a
				slot_562_13_0 = color(slot_562_11_0.r, slot_562_11_0.g, slot_562_11_0.b, math.min(255, math.floor(slot_562_12_0 * slot_562_10_0)))

				if slot_562_13_0.a > 0 then
					slot_562_14_1 = render.measure_text(slot_0_111_7, nil, slot_0_110_1)
					slot_562_15_1 = (slot_562_0_0.size and slot_562_0_0.size:get() or 18) / 18
					slot_562_16_0 = slot_562_14_1.x * 0.5 * slot_562_15_1
					slot_562_17_1 = slot_562_14_1.y * 0.5 * slot_562_15_1
					slot_562_18_1 = math.floor(slot_562_13_0.a * 0.5)
					slot_562_19_0 = math.max(2, math.floor(3 * slot_562_15_1))

					if slot_562_18_1 > 4 then
						slot_562_20_0 = color(slot_562_13_0.r, slot_562_13_0.g, slot_562_13_0.b, slot_562_18_1)

						for iter_562_2, iter_562_3 in ipairs({
							{
								-slot_562_19_0,
								0
							},
							{
								slot_562_19_0,
								0
							},
							{
								0,
								-slot_562_19_0
							},
							{
								0,
								slot_562_19_0
							}
						}) do
							render.text(slot_0_111_7, vector(slot_562_8_0.x - slot_562_16_0 + iter_562_3[1], slot_562_8_0.y - slot_562_17_1 + iter_562_3[2]), slot_562_20_0, nil, slot_0_110_1)
						end
					end

					render.text(slot_0_111_7, vector(slot_562_8_0.x - slot_562_16_0, slot_562_8_0.y - slot_562_17_1), slot_562_13_0, nil, slot_0_110_1)
				end

				if slot_562_0_0.explode_effect and slot_562_0_0.explode_effect:get() then
					slot_562_14_0 = 1 - slot_562_9_0
					slot_562_15_0 = math.min(1, slot_562_14_0 * 6)
					slot_562_17_0 = ((iter_562_1.is_hit or iter_562_1.is_kill) and 26 or 13) * slot_562_15_0
					slot_562_18_0 = math.floor((1 - slot_562_15_0) * 81)

					if slot_562_17_0 >= 0.5 and slot_562_18_0 > 0 then
						render.circle(vector(slot_562_8_0.x, slot_562_8_0.y), color(255, 255, 255, slot_562_18_0), math.max(1, math.floor(slot_562_17_0)), 0, 1)
					end

					render.circle(vector(slot_562_8_0.x, slot_562_8_0.y), color(255, 255, 255, 54), 2, 0, 1)
				end
			end
		end
	end
end)
events.round_start(function()
	slot_0_112_7 = {}
	slot_0_113_7 = 0
	slot_0_114_8 = {}
end)
events.player_spawned(function()
	slot_0_112_7 = {}
	slot_0_113_7 = 0
	slot_0_114_8 = {}
end)
events.level_change(function()
	slot_0_112_7 = {}
	slot_0_113_7 = 0
	slot_0_114_8 = {}
end)

slot_0_110_0 = nil
slot_0_111_6 = render.load_font("Tahoma Bold", vector(0, 13, 0), "ab")
slot_0_112_6 = {}
slot_0_113_6 = 0.55
slot_0_114_7 = 2.2
slot_0_115_7 = 31

events.aim_ack(function(arg_566_0)
	local var_566_0 = slot_0_59_0.info.hitmarker

	if not var_566_0 or not var_566_0.dm_enabled:get() then
		return
	end

	local var_566_1 = entity.get_local_player()

	if var_566_1 == nil or not var_566_1:is_alive() then
		return
	end

	if arg_566_0.state ~= nil then
		return
	end

	local var_566_2 = arg_566_0.aim

	if not var_566_2 or var_566_2.x == nil then
		return
	end

	local var_566_3 = arg_566_0.damage or 0

	if var_566_3 <= 0 then
		return
	end

	local var_566_4 = false

	if arg_566_0.target then
		local var_566_5, var_566_6 = pcall(function()
			return arg_566_0.target.m_iHealth
		end)

		if var_566_5 and var_566_6 and var_566_6 <= 0 then
			var_566_4 = true
		end
	end

	slot_0_112_6[#slot_0_112_6 + 1] = {
		t = 0,
		pos = vector(var_566_2.x, var_566_2.y, var_566_2.z),
		target = var_566_3,
		is_kill = var_566_4
	}
end)
events.render(function()
	local var_568_0 = slot_0_59_0.info.hitmarker

	if not var_568_0 or not var_568_0.dm_enabled:get() then
		slot_0_112_6 = {}

		return
	end

	local var_568_1 = globals.frametime

	for iter_568_0 = #slot_0_112_6, 1, -1 do
		local var_568_2 = slot_0_112_6[iter_568_0]

		var_568_2.t = var_568_2.t + var_568_1

		if var_568_2.t >= slot_0_114_7 then
			table.remove(slot_0_112_6, iter_568_0)
		else
			local var_568_3 = math.min(1, var_568_2.t / slot_0_113_6)
			local var_568_4

			if var_568_3 < 1 then
				local var_568_5 = 1 - var_568_3

				var_568_4 = 1 - var_568_5 * var_568_5 * var_568_5 * var_568_5
			else
				var_568_4 = 1
			end

			local var_568_6 = math.floor(var_568_2.target * var_568_4 + 0.5)
			local var_568_7 = tostring(var_568_6)
			local var_568_8 = render.world_to_screen(var_568_2.pos)

			if var_568_8 then
				local var_568_9 = math.min(1, var_568_2.t / slot_0_114_7 * 1.6)
				local var_568_10 = var_568_9 * var_568_9 * (3 - 2 * var_568_9)
				local var_568_11 = var_568_2.t / slot_0_114_7
				local var_568_12

				if var_568_11 < 0.07 then
					var_568_12 = var_568_11 / 0.07
				elseif var_568_11 < 0.7 then
					var_568_12 = 1
				else
					local var_568_13 = (var_568_11 - 0.7) / 0.3

					var_568_12 = 1 - var_568_13 * var_568_13 * (3 - 2 * var_568_13)
				end

				local var_568_14 = math.max(0, var_568_12)
				local var_568_15 = var_568_2.is_kill and var_568_0.dm_col_kill:get() or var_568_0.dm_col_hit:get()
				local var_568_16 = math.min(255, math.floor(var_568_15.a * var_568_14 * 2))
				local var_568_17 = color(var_568_15.r, var_568_15.g, var_568_15.b, var_568_16)
				local var_568_18 = render.measure_text(slot_0_111_6, nil, var_568_7)
				local var_568_19 = math.floor(var_568_8.x - var_568_18.x * 0.5)
				local var_568_20 = math.floor(var_568_8.y - var_568_10 * slot_0_115_7)
				local var_568_21 = math.floor(var_568_16 * 0.65)

				if var_568_21 > 2 then
					render.text(slot_0_111_6, vector(var_568_19 + 1, var_568_20 + 1), color(0, 0, 0, var_568_21), nil, var_568_7)
				end

				render.text(slot_0_111_6, vector(var_568_19, var_568_20), var_568_17, nil, var_568_7)
			end
		end
	end
end)
events.round_start(function()
	slot_0_112_6 = {}
end)
events.player_spawned(function()
	slot_0_112_6 = {}
end)

slot_0_111_5 = {
	{
		"1"
	},
	{
		"wyd",
		"?"
	},
	{
		"hs"
	},
	{
		"1",
		"?"
	},
	{
		"xddd",
		"1"
	},
	{
		"baited",
		"bot"
	},
	{
		"1",
		"bot"
	},
	{
		"too slow"
	}
}
slot_0_112_5 = nil
slot_0_113_5 = nil
slot_0_114_6 = nil
slot_0_115_6 = nil

function slot_0_116_5(arg_571_0)
	local var_571_0 = 1 + #arg_571_0 / 10 * 2
	local var_571_1 = (math.random() - 0.5) * 0.6

	return math.max(1, math.min(4, var_571_0 + var_571_1))
end

function slot_0_117_5()
	local var_572_0

	repeat
		var_572_0 = math.random(1, #slot_0_111_5)
	until var_572_0 ~= slot_0_114_6

	slot_0_114_6 = var_572_0

	local var_572_1 = slot_0_111_5[var_572_0]
	local var_572_2 = slot_0_116_5(var_572_1[1])

	slot_0_112_5 = {
		text = var_572_1[1],
		time = globals.realtime + var_572_2,
		next = var_572_1[2]
	}
end

function slot_0_118_4()
	local var_573_0 = 1 + math.random() * 0.8

	slot_0_112_5 = {
		text = "ofc body u fkn nn xd",
		time = globals.realtime + var_573_0
	}
end

events.net_update_end(function()
	if slot_0_112_5 and globals.realtime >= slot_0_112_5.time then
		utils.console_exec("say \"" .. slot_0_112_5.text .. "\"")

		local var_574_0 = slot_0_112_5.next

		slot_0_112_5 = nil

		if var_574_0 then
			local var_574_1 = 1.2 + math.random() * 0.8

			slot_0_112_5 = {
				text = var_574_0,
				time = globals.realtime + var_574_1
			}
		end
	end
end)
events.round_start(function()
	slot_0_113_5 = nil
	slot_0_115_6 = nil
end)
events.level_change(function()
	slot_0_113_5 = nil
	slot_0_112_5 = nil
	slot_0_115_6 = nil
end)
events.player_hurt(function(arg_577_0)
	local var_577_0 = entity.get_local_player()

	if not var_577_0 then
		return
	end

	if entity.get(arg_577_0.userid, true) == var_577_0 then
		slot_0_115_6 = arg_577_0.hitgroup
	end
end)
events.player_death(function(arg_578_0)
	local var_578_0 = slot_0_59_0.misc.killsay

	if not var_578_0 or not var_578_0.enabled:get() then
		return
	end

	if arg_578_0.userid == arg_578_0.attacker then
		return
	end

	local var_578_1 = entity.get_local_player()

	if not var_578_1 then
		return
	end

	local var_578_2 = entity.get(arg_578_0.attacker, true)
	local var_578_3 = entity.get(arg_578_0.userid, true)

	if var_578_2 == var_578_1 and var_578_0.modes:get("kill") then
		slot_0_117_5()
	end

	if var_578_3 == var_578_1 and var_578_2 ~= var_578_1 then
		local var_578_4 = arg_578_0.weapon or ""
		local var_578_5 = var_578_4 == "hegrenade" or var_578_4 == "inferno" or var_578_4 == "molotov" or var_578_4 == "decoy" or var_578_4 == "flashbang" or var_578_4 == "smokegrenade" or var_578_4 == "tagrenade" or var_578_4 == "firebomb" or var_578_4 == "diversion" or var_578_4 == "taser"
		local var_578_6 = var_578_4:find("knife") or var_578_4:find("bayonet") or var_578_4 == "knifegg"

		if not var_578_5 and not var_578_6 and slot_0_115_6 ~= nil and slot_0_115_6 ~= 1 then
			slot_0_118_4()
		end

		slot_0_113_5 = arg_578_0.attacker
	end

	if slot_0_113_5 and arg_578_0.userid == slot_0_113_5 and var_578_2 ~= var_578_1 and var_578_0.modes:get("revenge") then
		slot_0_117_5()

		slot_0_113_5 = nil
	end
end)

slot_0_111_4 = "elysian"
slot_0_112_4 = "✦"
slot_0_113_4 = nil
slot_0_114_5, slot_0_115_5 = pcall(function()
	return ui.find("Miscellaneous", "Main", "Other", "Clan Tag")
end)

if slot_0_114_5 then
	slot_0_113_4 = slot_0_115_5
end

function slot_0_114_4(arg_580_0)
	if slot_0_113_4 then
		pcall(function()
			slot_0_113_4:override(true)
		end)
	end

	pcall(function()
		common.set_clan_tag(arg_580_0)
	end)
end

function slot_0_115_4()
	if slot_0_113_4 then
		pcall(function()
			slot_0_113_4:override()
		end)
	end

	pcall(function()
		common.set_clan_tag("")
	end)
end

slot_0_116_4 = nil
slot_0_117_4 = 0
slot_0_118_3 = 0
slot_0_119_3 = 0.13
slot_0_120_3 = ""
slot_0_121_3 = {}
slot_0_122_4 = #slot_0_111_4
slot_0_121_3[1] = slot_0_112_4 .. " " .. slot_0_111_4

for iter_0_40 = 1, slot_0_122_4 do
	slot_0_121_3[#slot_0_121_3 + 1] = slot_0_111_4:sub(1, iter_0_40 - 1) .. slot_0_112_4 .. slot_0_111_4:sub(iter_0_40)
end

slot_0_121_3[#slot_0_121_3 + 1] = slot_0_111_4 .. " " .. slot_0_112_4
slot_0_122_3 = #slot_0_121_3

events.render(function()
	local var_586_0 = slot_0_59_0.misc.clantag

	if not var_586_0 then
		return
	end

	if not var_586_0.enabled:get() then
		if slot_0_116_4 then
			slot_0_115_4()

			slot_0_116_4 = false
			slot_0_120_3 = ""
		end

		return
	end

	slot_0_116_4 = true
	slot_0_117_4 = slot_0_117_4 + globals.frametime

	if slot_0_117_4 >= slot_0_119_3 then
		slot_0_117_4 = slot_0_117_4 - slot_0_119_3
		slot_0_118_3 = slot_0_118_3 % slot_0_122_3 + 1

		local var_586_1 = slot_0_121_3[slot_0_118_3]

		if var_586_1 ~= slot_0_120_3 then
			slot_0_120_3 = var_586_1

			slot_0_114_4(var_586_1)
		end
	end
end)
events.level_change(function()
	slot_0_116_4 = nil
	slot_0_118_3 = 0
	slot_0_117_4 = 0
	slot_0_120_3 = ""
end)
events.shutdown(slot_0_115_4)
slot_0_1_0.setup(slot_0_59_0)

slot_0_111_3 = "elysian_builder_v2"
slot_0_112_3 = "elysian_pui_v2"
slot_0_113_3 = "elysian_positions_v2"
slot_0_114_3 = "elysian_theme_v2"
slot_0_115_3 = "elysian_ind_state_v1"
slot_0_116_3 = "elysian_defensive_v1"
slot_0_117_3 = false
slot_0_118_2 = 0
slot_0_119_2 = true
slot_0_120_2 = {
	"allow_state",
	"yaw_left",
	"yaw_right",
	"yaw_add",
	"yaw_jitter",
	"lr_rand_pct",
	"delay",
	"delay_mode",
	"delay_ticks",
	"delay_random_min",
	"delay_random_max",
	"delay_seq_count",
	"delay_seq_s1",
	"delay_seq_s2",
	"delay_seq_s3",
	"delay_seq_s4",
	"delay_seq_s5",
	"delay_seq_s6",
	"delay_seq_s7",
	"delay_seq_s8",
	"jitter_base",
	"jitter_range",
	"jitter_speed",
	"jitter_style",
	"jitter_phase",
	"jitter_asymmetry",
	"chaotic_range",
	"chaotic_seed_rate",
	"chaotic_smooth",
	"yaw_base",
	"modifier",
	"randomize",
	"modifier_mode",
	"min",
	"max",
	"modifier_weight_center",
	"modifier_weight_spread",
	"modifier_pulse_a",
	"modifier_pulse_b",
	"modifier_pulse_rate",
	"modifier_custom_sliders",
	"modifier_sliders_1",
	"modifier_sliders_2",
	"modifier_sliders_3",
	"modifier_sliders_4",
	"modifier_sliders_5",
	"modifier_sliders_6",
	"modifier_offset",
	"skitter_deg",
	"dual_left_off",
	"dual_right_off",
	"dual_distribution",
	"dual_rate",
	"dual_rate_b",
	"body_yaw",
	"body_yaw_mode",
	"body_yaw_delay_mode",
	"body_yaw_delay",
	"body_yaw_delay_random_min",
	"body_yaw_delay_random_max",
	"body_yaw_delay_seq_count",
	"body_yaw_delay_seq_s1",
	"body_yaw_delay_seq_s2",
	"body_yaw_delay_seq_s3",
	"body_yaw_delay_seq_s4",
	"body_yaw_delay_seq_s5",
	"body_yaw_delay_seq_s6",
	"body_yaw_delay_seq_s7",
	"body_yaw_delay_seq_s8",
	"body_yaw_delay_seq_s9",
	"body_yaw_delay_seq_s10",
	"fake_limit",
	"freestand_peek",
	"left_limit",
	"right_limit",
	"choke",
	"random_choke",
	"choke_slider",
	"choke_method",
	"choke_from",
	"choke_to",
	"choke_sliders",
	"choke1_1",
	"choke1_2",
	"choke1_3",
	"choke1_4",
	"choke1_5",
	"choke1_6",
	"anti_bruteforce",
	"abf_reset_timer",
	"abf_trigger",
	"abf_notify",
	"abf_phase_sel"
}

function slot_0_121_2()
	local var_588_0 = slot_0_59_0.antiaim.angles.builder

	if not var_588_0 then
		return nil
	end

	local var_588_1 = {}

	for iter_588_0, iter_588_1 in pairs(var_588_0) do
		local var_588_2 = {}

		for iter_588_2, iter_588_3 in ipairs(slot_0_120_2) do
			local var_588_3 = iter_588_1[iter_588_3]

			if var_588_3 then
				pcall(function()
					var_588_2[iter_588_3] = var_588_3:get()
				end)
			end
		end

		if iter_588_1.abf_phases then
			local var_588_4 = {}

			for iter_588_4 = 1, 10 do
				local var_588_5 = iter_588_1.abf_phases[iter_588_4]

				if var_588_5 then
					local var_588_6 = {}

					pcall(function()
						var_588_6.rand_min = var_588_5.rand_min:get()
					end)
					pcall(function()
						var_588_6.rand_max = var_588_5.rand_max:get()
					end)

					var_588_4[iter_588_4] = var_588_6
				end
			end

			var_588_2.__abf_phases = var_588_4

			pcall(function()
				var_588_2.__abf_phase_n = iter_588_1.abf_phase_n
			end)
		end

		var_588_1[iter_588_0] = var_588_2
	end

	return var_588_1
end

function slot_0_122_2(arg_593_0)
	if not arg_593_0 then
		return
	end

	local var_593_0 = slot_0_59_0.antiaim.angles.builder

	if not var_593_0 then
		return
	end

	for iter_593_0, iter_593_1 in pairs(arg_593_0) do
		local var_593_1 = var_593_0[iter_593_0]

		if var_593_1 then
			for iter_593_2, iter_593_3 in ipairs(slot_0_120_2) do
				local var_593_2 = var_593_1[iter_593_3]
				local var_593_3 = iter_593_1[iter_593_3]

				if var_593_2 and var_593_3 ~= nil then
					pcall(function()
						var_593_2:set(var_593_3)
					end)
				end
			end

			if iter_593_1.__abf_phase_n and var_593_1.abf_phase_n ~= nil then
				pcall(function()
					var_593_1.abf_phase_n = iter_593_1.__abf_phase_n
				end)
				pcall(function()
					if var_593_1.abf_phase_sel then
						local var_596_0 = {}

						for iter_596_0 = 1, var_593_1.abf_phase_n do
							var_596_0[iter_596_0] = tostring(iter_596_0)
						end

						if #var_596_0 > 0 then
							var_593_1.abf_phase_sel:update(var_596_0)
						end
					end
				end)
			end

			if iter_593_1.__abf_phases and var_593_1.abf_phases then
				for iter_593_4 = 1, 10 do
					local var_593_4 = var_593_1.abf_phases[iter_593_4]
					local var_593_5 = iter_593_1.__abf_phases[iter_593_4]

					if var_593_4 and var_593_5 then
						if var_593_5.rand_min ~= nil then
							pcall(function()
								var_593_4.rand_min:set(var_593_5.rand_min)
							end)
						end

						if var_593_5.rand_max ~= nil then
							pcall(function()
								var_593_4.rand_max:set(var_593_5.rand_max)
							end)
						end
					end
				end
			end
		end
	end
end

slot_0_123_2 = {
	"fe",
	"fe_alt",
	"fe_peek",
	"fe_snap_delay",
	"enable",
	"pitch_mode",
	"pitch",
	"dyn_pitch_min",
	"dyn_pitch_max",
	"dyn_pitch_spd",
	"dyn_pitch_mode",
	"dyn_pitch_rand",
	"osc_pitch_a",
	"osc_pitch_b",
	"osc_pitch_rate",
	"osc_pitch_rand",
	"yaw_mode",
	"yaw",
	"yaw_lr_left",
	"yaw_lr_right",
	"yaw_lr_dt",
	"yaw_lr_rand",
	"def_flip_adaptive",
	"def_flip_adp_var",
	"yaw_spin_from",
	"yaw_spin_to",
	"yaw_spin_spd",
	"yaw_spin_rand",
	"dyn_yaw_min",
	"dyn_yaw_max",
	"dyn_yaw_spd",
	"dyn_yaw_mode",
	"dyn_yaw_rand",
	"def_jitter_base",
	"def_jitter_range",
	"def_jitter_speed",
	"def_jitter_style",
	"def_jitter_phase",
	"sweep_from",
	"sweep_to",
	"sweep_rate",
	"sweep_hold",
	"sweep_rand",
	"activation_mode",
	"def_abf",
	"def_abf_mode",
	"def_abf_trigger",
	"def_abf_reset",
	"def_abf_notify"
}

function slot_0_124_2()
	local var_599_0 = slot_0_59_0.antiaim.defensive

	if not var_599_0 or not var_599_0.settings then
		return nil
	end

	local var_599_1 = {}

	for iter_599_0, iter_599_1 in pairs(var_599_0.settings) do
		local var_599_2 = {}

		for iter_599_2, iter_599_3 in ipairs(slot_0_123_2) do
			local var_599_3 = iter_599_1[iter_599_3]

			if var_599_3 then
				pcall(function()
					var_599_2[iter_599_3] = var_599_3:get()
				end)
			end
		end

		var_599_1[iter_599_0] = var_599_2
	end

	return var_599_1
end

function slot_0_125_2(arg_601_0)
	if not arg_601_0 then
		return
	end

	local var_601_0 = slot_0_59_0.antiaim.defensive

	if not var_601_0 or not var_601_0.settings then
		return
	end

	for iter_601_0, iter_601_1 in pairs(arg_601_0) do
		local var_601_1 = var_601_0.settings[iter_601_0]

		if var_601_1 then
			for iter_601_2, iter_601_3 in ipairs(slot_0_123_2) do
				local var_601_2 = var_601_1[iter_601_3]
				local var_601_3 = iter_601_1[iter_601_3]

				if var_601_2 and var_601_3 ~= nil then
					pcall(function()
						var_601_2:set(var_601_3)
					end)
				end
			end
		end
	end
end

slot_0_65_0 = slot_0_121_2
slot_0_66_0 = slot_0_122_2
slot_0_67_0 = slot_0_124_2
slot_0_68_0 = slot_0_125_2
slot_0_126_2 = {
	"double tap",
	"hide shots",
	"freestanding",
	"fake duck",
	"min damage",
	"dormant aimbot",
	"lc",
	"ping"
}

function slot_0_127_2()
	local var_603_0 = slot_0_27_0
	local var_603_1 = var_603_0._select

	if not var_603_1 then
		return nil
	end

	local var_603_2 = {}

	for iter_603_0, iter_603_1 in ipairs(slot_0_126_2) do
		local var_603_3, var_603_4 = pcall(function()
			return var_603_1:get(iter_603_1)
		end)

		if var_603_3 and var_603_4 then
			var_603_2[#var_603_2 + 1] = iter_603_1
		end
	end

	local var_603_5 = {
		selected = var_603_2
	}

	pcall(function()
		var_603_5.enabled = var_603_0._label:get()
	end)

	local function var_603_6(arg_606_0, arg_606_1)
		if arg_606_1 and arg_606_1.get then
			local var_606_0, var_606_1 = pcall(function()
				return arg_606_1:get()
			end)

			if var_606_0 and var_606_1 then
				var_603_5[arg_606_0] = {
					var_606_1.r,
					var_606_1.g,
					var_606_1.b,
					var_606_1.a
				}
			end
		end
	end

	var_603_6("bg", var_603_0.col_bg)
	var_603_6("col_dt_on", var_603_0.col_dt_on)
	var_603_6("col_dt_off", var_603_0.col_dt_off)
	var_603_6("col_hs_on", var_603_0.col_hs_on)
	var_603_6("col_fs_on", var_603_0.col_fs_on)
	var_603_6("col_fd_on", var_603_0.col_fd_on)
	var_603_6("col_da_on", var_603_0.col_da_on)
	var_603_6("col_dmg_on", var_603_0.col_dmg_on)
	var_603_6("col_lc_on", var_603_0.col_lc_on)
	var_603_6("col_lc_bad", var_603_0.col_lc_bad)
	var_603_6("col_ping_on", var_603_0.col_ping_on)
	pcall(function()
		var_603_5.blur = var_603_0.blur:get()
	end)
	pcall(function()
		var_603_5.font = var_603_0.font:get()
	end)

	return var_603_5
end

function slot_0_128_2(arg_610_0)
	if not arg_610_0 then
		return
	end

	local var_610_0 = slot_0_27_0
	local var_610_1 = var_610_0._select

	if arg_610_0.selected and var_610_1 then
		pcall(function()
			var_610_1:set(arg_610_0.selected)
		end)
	end

	if arg_610_0.enabled ~= nil then
		pcall(function()
			var_610_0._label:set(arg_610_0.enabled)
		end)
	end

	local function var_610_2(arg_613_0, arg_613_1)
		if arg_610_0[arg_613_0] and arg_613_1 and arg_613_1.set then
			local var_613_0 = arg_610_0[arg_613_0]

			pcall(function()
				arg_613_1:set(color(var_613_0[1], var_613_0[2], var_613_0[3], var_613_0[4]))
			end)
		end
	end

	var_610_2("bg", var_610_0.col_bg)
	var_610_2("col_dt_on", var_610_0.col_dt_on)
	var_610_2("col_dt_off", var_610_0.col_dt_off)
	var_610_2("col_hs_on", var_610_0.col_hs_on)
	var_610_2("col_fs_on", var_610_0.col_fs_on)
	var_610_2("col_fd_on", var_610_0.col_fd_on)
	var_610_2("col_da_on", var_610_0.col_da_on)
	var_610_2("col_dmg_on", var_610_0.col_dmg_on)
	var_610_2("col_lc_on", var_610_0.col_lc_on)
	var_610_2("col_lc_bad", var_610_0.col_lc_bad)
	var_610_2("col_ping_on", var_610_0.col_ping_on)

	if arg_610_0.blur ~= nil then
		pcall(function()
			var_610_0.blur:set(arg_610_0.blur)
		end)
	end

	if arg_610_0.font ~= nil then
		pcall(function()
			var_610_0.font:set(arg_610_0.font)
		end)
	end
end

function slot_0_129_1()
	if slot_0_119_2 then
		return
	end

	local var_617_0 = slot_0_121_2()

	if var_617_0 then
		db[slot_0_111_3] = var_617_0
	end

	local var_617_1 = slot_0_124_2()

	if var_617_1 then
		db[slot_0_116_3] = var_617_1
	end

	local var_617_2, var_617_3 = pcall(function()
		return slot_0_1_0.save()
	end)

	if var_617_2 and var_617_3 then
		db[slot_0_112_3] = var_617_3
	end

	if slot_0_69_0.save_positions_full then
		local var_617_4, var_617_5 = pcall(slot_0_69_0.save_positions_full)

		if var_617_4 and var_617_5 then
			db[slot_0_113_3] = var_617_5
		end
	end

	pcall(function()
		local var_619_0 = slot_0_15_0:get()

		db[slot_0_114_3] = {
			r = var_619_0.r,
			g = var_619_0.g,
			b = var_619_0.b,
			a = var_619_0.a,
			share_logo = slot_0_16_0:get()
		}
	end)

	local var_617_6 = slot_0_127_2()

	if var_617_6 then
		db[slot_0_115_3] = var_617_6
	end
end

utils.execute_after(0.5, function()
	local var_620_0 = db[slot_0_112_3]

	if var_620_0 then
		pcall(function()
			slot_0_1_0.load(var_620_0)
		end)
	end

	local var_620_1 = db[slot_0_113_3]

	if var_620_1 and slot_0_69_0.load_positions_full then
		pcall(slot_0_69_0.load_positions_full, var_620_1)
	end

	local var_620_2 = db[slot_0_114_3]

	if var_620_2 then
		pcall(function()
			slot_0_15_0:set(color(var_620_2.r, var_620_2.g, var_620_2.b, var_620_2.a or 255))
			slot_0_16_0:set(var_620_2.share_logo == true)
		end)
	end

	local var_620_3 = db[slot_0_111_3]

	if var_620_3 then
		utils.execute_after(0.05, function()
			slot_0_122_2(var_620_3)

			slot_0_117_3 = true
			slot_0_118_2 = globals.realtime
			slot_0_119_2 = false
		end)
	else
		slot_0_117_3 = true
		slot_0_118_2 = globals.realtime
		slot_0_119_2 = false
	end

	local var_620_4 = db[slot_0_116_3]

	if var_620_4 then
		utils.execute_after(0.05, function()
			slot_0_125_2(var_620_4)
		end)
	end

	local var_620_5 = db[slot_0_115_3]

	if var_620_5 then
		utils.execute_after(0.2, function()
			slot_0_128_2(var_620_5)
		end)
	end
end)
events.render(function()
	if slot_0_119_2 then
		return
	end

	local var_626_0 = globals.realtime

	if var_626_0 - slot_0_118_2 >= 2 then
		slot_0_118_2 = var_626_0

		slot_0_129_1()
	end
end)
events.shutdown(slot_0_129_1)
slot_0_54_0()

slot_0_111_2 = "https://cdn.jsdelivr.net/gh/yirahvh-spec/elysian@main/elysiann.png"
slot_0_112_2 = {
	code_mul = 97,
	latest_rollcall = 0,
	users = {}
}

function slot_0_113_2()
	if not globals.is_in_game then
		return
	end

	local var_627_0 = #cvar.name:string()
	local var_627_1 = utils.random_int(256, 4095)

	events.voice_message:call(function(arg_628_0)
		arg_628_0:write_bits(0, 4)
		arg_628_0:write_bits(var_627_0, 8)
		arg_628_0:write_bits(1, 4)
		arg_628_0:write_bits(var_627_1 * (slot_0_112_2.code_mul - var_627_0 - 1), 20)
		arg_628_0:write_bits(var_627_1, 12)
	end)
end

function slot_0_114_2(arg_629_0, arg_629_1, arg_629_2)
	if not arg_629_0 or arg_629_0:is_bot() then
		return
	end

	local var_629_0 = arg_629_0:get_player_info().steamid

	if slot_0_16_0 and slot_0_16_0:get() and arg_629_1 and arg_629_1 == 1 then
		if not slot_0_112_2.users[var_629_0] then
			pcall(function()
				arg_629_0:set_icon(slot_0_111_2)
			end)

			slot_0_112_2.users[var_629_0] = true
		end
	elseif slot_0_112_2.users[var_629_0] and not arg_629_2 then
		pcall(function()
			arg_629_0:set_icon()
		end)

		slot_0_112_2.users[var_629_0] = nil
	end
end

function slot_0_115_2(arg_632_0)
	if arg_632_0 or math.abs(globals.tickcount - slot_0_112_2.latest_rollcall) > 256 then
		slot_0_113_2()

		local var_632_0 = entity.get_local_player()

		if var_632_0 then
			if arg_632_0 then
				local var_632_1 = var_632_0:get_player_info().steamid

				slot_0_112_2.users[var_632_1] = nil
			end

			slot_0_114_2(var_632_0, 1, true)
		end

		slot_0_112_2.latest_rollcall = globals.tickcount
	end
end

function slot_0_116_2(arg_633_0)
	if arg_633_0.entity and arg_633_0.xuid == 0 then
		local var_633_0 = #arg_633_0.entity:get_name()
		local var_633_1 = arg_633_0.buffer:read_bits(4)
		local var_633_2 = arg_633_0.buffer:read_bits(8)
		local var_633_3 = arg_633_0.buffer:read_bits(4)
		local var_633_4 = arg_633_0.buffer:read_bits(20)
		local var_633_5 = arg_633_0.buffer:read_bits(12)
		local var_633_6 = slot_0_112_2.code_mul - var_633_0 - 1

		if var_633_1 == 0 and var_633_2 == var_633_0 and var_633_3 == 1 and var_633_6 ~= 0 and var_633_5 ~= 0 and var_633_4 % var_633_6 == 0 and var_633_4 % var_633_5 == 0 then
			slot_0_114_2(arg_633_0.entity, 1)
		end
	end

	slot_0_115_2()
end

function slot_0_117_2()
	slot_0_10_0(false, true, function(arg_635_0)
		slot_0_114_2(arg_635_0)
	end)

	slot_0_112_2.users = {}
end

slot_0_113_2()

if slot_0_16_0 then
	slot_0_16_0:set_callback(function(arg_636_0)
		events.voice_message(slot_0_116_2, arg_636_0:get())

		if arg_636_0:get() then
			slot_0_115_2(true)

			local var_636_0 = entity.get_local_player()

			if var_636_0 then
				slot_0_114_2(var_636_0, 1, true)
			end
		else
			slot_0_117_2()
		end
	end, true)
end

events.player_spawned(function()
	slot_0_115_2(true)
end)
events.player_death(slot_0_115_2)
events.round_start(function()
	slot_0_117_2()
	slot_0_115_2(true)
end)
events.round_prestart(slot_0_117_2)
events.level_change(function()
	slot_0_117_2()
	slot_0_115_2(true)
end)
events.shutdown(slot_0_117_2)

slot_0_111_1 = 1
slot_0_112_1 = false
slot_0_113_1 = slot_0_11_0.antiaim.misc.fake_duck
slot_0_114_1 = slot_0_11_0.rage.main.double_tap
slot_0_115_1 = slot_0_11_0.rage.main.hide_shots

function slot_0_116_1()
	pcall(function()
		slot_0_113_1:override()
	end)
end

slot_0_117_1 = {}
slot_0_118_1 = 1
slot_0_119_1 = 0
slot_0_120_1 = 0
slot_0_121_1 = 80
slot_0_122_1 = 1.6
slot_0_123_1 = 0.025
slot_0_124_1 = 0
slot_0_125_1 = nil
slot_0_126_1 = nil
slot_0_127_1 = 0
slot_0_128_1 = 0
slot_0_129_0 = 0
slot_0_130_0 = 5
slot_0_131_0 = false
slot_0_132_0 = -1000
slot_0_133_0 = 0.45
slot_0_134_0 = false

function slot_0_135_0()
	local var_642_0 = slot_0_59_0.antiaim.general.air_exploit

	if not var_642_0 then
		return false
	end

	if not var_642_0.switch:get() then
		return false
	end

	local var_642_1, var_642_2 = pcall(function()
		return var_642_0.visualization:get()
	end)

	return var_642_1 and var_642_2
end

function slot_0_136_0()
	local var_644_0 = slot_0_59_0.antiaim.general.air_exploit
	local var_644_1, var_644_2 = pcall(function()
		return var_644_0.color:get()
	end)

	if var_644_1 and var_644_2 then
		return var_644_2
	end

	return color(150, 195, 255, 255)
end

function slot_0_137_0(arg_646_0)
	return math.max(0, math.min(255, math.floor(arg_646_0 + 0.5)))
end

function slot_0_138_0(arg_647_0, arg_647_1, arg_647_2, arg_647_3, arg_647_4, arg_647_5, arg_647_6, arg_647_7)
	if arg_647_7 < 3 then
		return
	end

	slot_647_8_0 = arg_647_2 - arg_647_0
	slot_647_9_0 = arg_647_3 - arg_647_1
	slot_647_10_0 = math.sqrt(slot_647_8_0 * slot_647_8_0 + slot_647_9_0 * slot_647_9_0)

	if slot_647_10_0 < 0.5 then
		return
	end

	slot_647_11_0 = 1 / slot_647_10_0
	slot_647_12_0 = -slot_647_9_0 * slot_647_11_0
	slot_647_13_0 = slot_647_8_0 * slot_647_11_0
	slot_647_14_0 = math.floor(arg_647_0 + 0.5)
	slot_647_15_0 = math.floor(arg_647_1 + 0.5)
	slot_647_16_0 = math.floor(arg_647_2 + 0.5)
	slot_647_17_0 = math.floor(arg_647_3 + 0.5)
	slot_647_18_0 = slot_0_137_0(arg_647_7 * 0.06)

	if slot_647_18_0 > 1 then
		slot_647_19_1 = color(arg_647_4, arg_647_5, arg_647_6, slot_647_18_0)
		slot_647_20_2 = math.floor(slot_647_12_0 * 8 + 0.5)
		slot_647_21_3 = math.floor(slot_647_13_0 * 8 + 0.5)
		slot_647_22_4 = math.floor(slot_647_12_0 * 6 + 0.5)
		slot_647_23_3 = math.floor(slot_647_13_0 * 6 + 0.5)

		render.line(vector(slot_647_14_0 - slot_647_20_2, slot_647_15_0 - slot_647_21_3), vector(slot_647_16_0 - slot_647_20_2, slot_647_17_0 - slot_647_21_3), slot_647_19_1)
		render.line(vector(slot_647_14_0 - slot_647_22_4, slot_647_15_0 - slot_647_23_3), vector(slot_647_16_0 - slot_647_22_4, slot_647_17_0 - slot_647_23_3), slot_647_19_1)
		render.line(vector(slot_647_14_0 + slot_647_22_4, slot_647_15_0 + slot_647_23_3), vector(slot_647_16_0 + slot_647_22_4, slot_647_17_0 + slot_647_23_3), slot_647_19_1)
		render.line(vector(slot_647_14_0 + slot_647_20_2, slot_647_15_0 + slot_647_21_3), vector(slot_647_16_0 + slot_647_20_2, slot_647_17_0 + slot_647_21_3), slot_647_19_1)
	end

	slot_647_19_0 = slot_0_137_0(arg_647_7 * 0.13)

	if slot_647_19_0 > 2 then
		slot_647_20_1 = color(arg_647_4, arg_647_5, arg_647_6, slot_647_19_0)
		slot_647_21_2 = math.floor(slot_647_12_0 * 4 + 0.5)
		slot_647_22_3 = math.floor(slot_647_13_0 * 4 + 0.5)
		slot_647_23_2 = math.floor(slot_647_12_0 * 3 + 0.5)
		slot_647_24_1 = math.floor(slot_647_13_0 * 3 + 0.5)

		render.line(vector(slot_647_14_0 - slot_647_21_2, slot_647_15_0 - slot_647_22_3), vector(slot_647_16_0 - slot_647_21_2, slot_647_17_0 - slot_647_22_3), slot_647_20_1)
		render.line(vector(slot_647_14_0 - slot_647_23_2, slot_647_15_0 - slot_647_24_1), vector(slot_647_16_0 - slot_647_23_2, slot_647_17_0 - slot_647_24_1), slot_647_20_1)
		render.line(vector(slot_647_14_0 + slot_647_23_2, slot_647_15_0 + slot_647_24_1), vector(slot_647_16_0 + slot_647_23_2, slot_647_17_0 + slot_647_24_1), slot_647_20_1)
		render.line(vector(slot_647_14_0 + slot_647_21_2, slot_647_15_0 + slot_647_22_3), vector(slot_647_16_0 + slot_647_21_2, slot_647_17_0 + slot_647_22_3), slot_647_20_1)
	end

	slot_647_20_0 = slot_0_137_0(arg_647_7 * 0.28)

	if slot_647_20_0 > 3 then
		slot_647_21_1 = color(arg_647_4, arg_647_5, arg_647_6, slot_647_20_0)
		slot_647_22_2 = math.floor(slot_647_12_0 * 2 + 0.5)
		slot_647_23_1 = math.floor(slot_647_13_0 * 2 + 0.5)

		render.line(vector(slot_647_14_0 - slot_647_22_2, slot_647_15_0 - slot_647_23_1), vector(slot_647_16_0 - slot_647_22_2, slot_647_17_0 - slot_647_23_1), slot_647_21_1)
		render.line(vector(slot_647_14_0 + slot_647_22_2, slot_647_15_0 + slot_647_23_1), vector(slot_647_16_0 + slot_647_22_2, slot_647_17_0 + slot_647_23_1), slot_647_21_1)
	end

	slot_647_21_0 = slot_0_137_0(arg_647_7 * 0.55)

	if slot_647_21_0 > 4 then
		slot_647_22_1 = color(slot_0_137_0(arg_647_4 + 40), slot_0_137_0(arg_647_5 + 40), slot_0_137_0(arg_647_6 + 40), slot_647_21_0)
		slot_647_23_0 = math.floor(slot_647_12_0 + 0.5)
		slot_647_24_0 = math.floor(slot_647_13_0 + 0.5)

		render.line(vector(slot_647_14_0 - slot_647_23_0, slot_647_15_0 - slot_647_24_0), vector(slot_647_16_0 - slot_647_23_0, slot_647_17_0 - slot_647_24_0), slot_647_22_1)
		render.line(vector(slot_647_14_0 + slot_647_23_0, slot_647_15_0 + slot_647_24_0), vector(slot_647_16_0 + slot_647_23_0, slot_647_17_0 + slot_647_24_0), slot_647_22_1)
	end

	slot_647_22_0 = color(slot_0_137_0(arg_647_4 + 90), slot_0_137_0(arg_647_5 + 90), slot_0_137_0(arg_647_6 + 90), slot_0_137_0(arg_647_7 * 0.97))

	render.line(vector(slot_647_14_0, slot_647_15_0), vector(slot_647_16_0, slot_647_17_0), slot_647_22_0)
end

function slot_0_139_0(arg_648_0, arg_648_1, arg_648_2, arg_648_3, arg_648_4, arg_648_5)
	if arg_648_5 < 8 then
		return
	end

	local var_648_0 = math.floor(arg_648_0 + 0.5)
	local var_648_1 = math.floor(arg_648_1 + 0.5)

	render.circle_outline(vector(var_648_0, var_648_1), color(arg_648_2, arg_648_3, arg_648_4, slot_0_137_0(arg_648_5 * 0.1)), 9, 0, 360, 3)
	render.circle_outline(vector(var_648_0, var_648_1), color(arg_648_2, arg_648_3, arg_648_4, slot_0_137_0(arg_648_5 * 0.18)), 7, 0, 360, 2)
	render.circle_outline(vector(var_648_0, var_648_1), color(slot_0_137_0(arg_648_2 + 40), slot_0_137_0(arg_648_3 + 40), slot_0_137_0(arg_648_4 + 40), slot_0_137_0(arg_648_5 * 0.35)), 5, 0, 360, 2)
	render.circle_outline(vector(var_648_0, var_648_1), color(slot_0_137_0(arg_648_2 + 70), slot_0_137_0(arg_648_3 + 70), slot_0_137_0(arg_648_4 + 70), slot_0_137_0(arg_648_5 * 0.65)), 3, 0, 360, 1)
	render.circle(vector(var_648_0, var_648_1), color(slot_0_137_0(arg_648_2 + 90), slot_0_137_0(arg_648_3 + 90), slot_0_137_0(arg_648_4 + 90), slot_0_137_0(arg_648_5 * 0.95)), 2, 0, 360)
end

function slot_0_140_0(arg_649_0, arg_649_1, arg_649_2, arg_649_3)
	if slot_0_126_1 then
		local var_649_0 = arg_649_1 - slot_0_126_1[1]
		local var_649_1 = arg_649_2 - slot_0_126_1[2]
		local var_649_2 = arg_649_3 - slot_0_126_1[3]

		if var_649_0 * var_649_0 + var_649_1 * var_649_1 + var_649_2 * var_649_2 > 16384 then
			slot_0_117_1 = {}
			slot_0_118_1 = 1
			slot_0_119_1 = 0
			slot_0_120_1 = 0
			slot_0_125_1 = nil
		end
	end

	slot_0_126_1 = {
		arg_649_1,
		arg_649_2,
		arg_649_3
	}

	if slot_0_125_1 then
		local var_649_3 = arg_649_1 - slot_0_125_1[1]
		local var_649_4 = arg_649_2 - slot_0_125_1[2]
		local var_649_5 = arg_649_3 - slot_0_125_1[3]

		if var_649_3 * var_649_3 + var_649_4 * var_649_4 + var_649_5 * var_649_5 < 1 then
			return
		end
	end

	slot_0_125_1 = {
		arg_649_1,
		arg_649_2,
		arg_649_3
	}
	slot_0_119_1 = slot_0_119_1 % slot_0_121_1 + 1
	slot_0_117_1[slot_0_119_1] = {
		x = arg_649_1,
		y = arg_649_2,
		z = arg_649_3 + 18,
		born = arg_649_0
	}

	if slot_0_120_1 < slot_0_121_1 then
		slot_0_120_1 = slot_0_120_1 + 1
	else
		slot_0_118_1 = slot_0_118_1 % slot_0_121_1 + 1
	end
end

events.createmove(function(arg_650_0)
	local var_650_0 = slot_0_59_0.antiaim.general.air_exploit

	if not var_650_0 then
		return
	end

	if not var_650_0.switch:get() then
		if not slot_0_112_1 then
			slot_0_116_1()

			slot_0_112_1 = true
		end

		return
	end

	local var_650_1 = entity.get_local_player()

	if not var_650_1 or not var_650_1:is_alive() then
		if not slot_0_112_1 then
			slot_0_116_1()

			slot_0_112_1 = true
		end

		return
	end

	local var_650_2 = bit.band(var_650_1.m_fFlags or 0, 1) == 1
	local var_650_3, var_650_4 = pcall(function()
		return slot_0_114_1:get()
	end)
	local var_650_5, var_650_6 = pcall(function()
		return slot_0_115_1:get()
	end)
	local var_650_7 = var_650_3 and var_650_4 or var_650_5 and var_650_6

	if var_650_2 or not var_650_7 then
		slot_0_116_1()

		slot_0_111_1 = 1
		slot_0_112_1 = false

		if slot_0_131_0 then
			slot_0_132_0 = globals.realtime
		end

		slot_0_131_0 = false

		local var_650_8 = globals.realtime

		if slot_0_135_0() and var_650_8 - slot_0_132_0 < slot_0_133_0 and var_650_8 >= slot_0_124_1 then
			slot_0_124_1 = var_650_8 + slot_0_123_1

			local var_650_9, var_650_10 = pcall(function()
				return var_650_1:get_origin()
			end)

			if var_650_9 and var_650_10 then
				slot_0_140_0(var_650_8, var_650_10.x, var_650_10.y, var_650_10.z)
			end
		end

		if globals.realtime - slot_0_132_0 >= slot_0_133_0 then
			slot_0_125_1 = nil
			slot_0_126_1 = nil
		end

		return
	end

	slot_0_132_0 = -1000
	slot_0_131_0 = true

	if slot_0_135_0() then
		local var_650_11 = globals.realtime

		if var_650_11 >= slot_0_124_1 then
			slot_0_124_1 = var_650_11 + slot_0_123_1

			local var_650_12, var_650_13 = pcall(function()
				return var_650_1:get_origin()
			end)

			if var_650_12 and var_650_13 then
				slot_0_140_0(var_650_11, var_650_13.x, var_650_13.y, var_650_13.z)
			end
		end
	end

	if globals.tickcount % 2 == 1 then
		slot_0_111_1 = slot_0_111_1 + 1
	end

	if slot_0_111_1 > 2 then
		pcall(function()
			slot_0_113_1:override(true)
		end)

		slot_0_111_1 = 1
	else
		pcall(function()
			slot_0_113_1:override(false)
		end)
	end

	slot_0_112_1 = false
end)
events.render(function()
	slot_657_0_0 = slot_0_135_0()
	slot_0_128_1 = slot_657_0_0 and (slot_0_131_0 or slot_0_120_1 > 0) and 1 or 0
	slot_657_1_0 = globals.realtime
	slot_657_2_0 = math.min(slot_657_1_0 - slot_0_129_0, 0.05)
	slot_0_129_0 = slot_657_1_0

	if slot_0_127_1 < slot_0_128_1 then
		slot_0_127_1 = math.min(slot_0_128_1, slot_0_127_1 + slot_0_130_0 * slot_657_2_0)
	elseif slot_0_127_1 > slot_0_128_1 then
		slot_0_127_1 = math.max(slot_0_128_1, slot_0_127_1 - slot_0_130_0 * slot_657_2_0)
	end

	if slot_0_127_1 < 0.004 then
		if not slot_657_0_0 then
			slot_0_117_1 = {}
			slot_0_118_1 = 1
			slot_0_119_1 = 0
			slot_0_120_1 = 0
		end

		return
	end

	slot_657_3_0 = globals.realtime
	slot_657_4_0 = slot_0_136_0()
	slot_657_5_0 = slot_657_4_0.r
	slot_657_6_0 = slot_657_4_0.g
	slot_657_7_0 = slot_657_4_0.b
	slot_657_8_0 = slot_657_4_0.a
	slot_657_9_0 = {}

	for iter_657_0 = 0, slot_0_120_1 - 1 do
		slot_657_14_2 = (slot_0_118_1 - 1 + iter_657_0) % slot_0_121_1 + 1
		slot_657_15_3 = slot_0_117_1[slot_657_14_2]

		if slot_657_3_0 - slot_657_15_3.born < slot_0_122_1 then
			slot_657_9_0[#slot_657_9_0 + 1] = slot_657_15_3
		end
	end

	slot_0_117_1 = {}
	slot_0_118_1 = 1
	slot_0_119_1 = #slot_657_9_0
	slot_0_120_1 = #slot_657_9_0

	for iter_657_1 = 1, #slot_657_9_0 do
		slot_0_117_1[iter_657_1] = slot_657_9_0[iter_657_1]
	end

	slot_657_10_0 = entity.get_local_player()
	slot_657_11_0 = {}

	for iter_657_2 = 1, slot_0_120_1 do
		slot_657_11_0[iter_657_2] = slot_0_117_1[iter_657_2]
	end

	if slot_657_10_0 and slot_657_10_0:is_alive() then
		slot_657_12_1, slot_657_13_1 = pcall(function()
			return slot_657_10_0:get_origin()
		end)

		if slot_657_12_1 and slot_657_13_1 then
			slot_657_14_1 = true

			if #slot_657_11_0 > 0 then
				slot_657_15_1 = slot_657_11_0[#slot_657_11_0]
				slot_657_16_1 = slot_657_13_1.x - slot_657_15_1.x
				slot_657_17_2 = slot_657_13_1.y - slot_657_15_1.y
				slot_657_18_2 = slot_657_13_1.z + 18 - slot_657_15_1.z

				if slot_657_16_1 * slot_657_16_1 + slot_657_17_2 * slot_657_17_2 + slot_657_18_2 * slot_657_18_2 > 16384 then
					slot_657_14_1 = false
				end
			end

			if slot_657_14_1 then
				slot_657_11_0[#slot_657_11_0 + 1] = {
					x = slot_657_13_1.x,
					y = slot_657_13_1.y,
					z = slot_657_13_1.z + 18,
					born = slot_657_3_0
				}
			end
		end
	end

	slot_657_12_0 = #slot_657_11_0

	if slot_657_12_0 < 2 then
		return
	end

	slot_657_13_0 = {
		0
	}

	for iter_657_3 = 2, slot_657_12_0 do
		slot_657_18_1 = slot_657_11_0[iter_657_3 - 1]
		slot_657_19_1 = slot_657_11_0[iter_657_3]
		slot_657_13_0[iter_657_3] = slot_657_13_0[iter_657_3 - 1] + math.sqrt((slot_657_19_1.x - slot_657_18_1.x)^2 + (slot_657_19_1.y - slot_657_18_1.y)^2 + (slot_657_19_1.z - slot_657_18_1.z)^2)
	end

	slot_657_14_0 = math.max(0.001, slot_657_13_0[slot_657_12_0])

	function slot_657_15_0(arg_659_0, arg_659_1, arg_659_2, arg_659_3, arg_659_4, arg_659_5)
		local var_659_0 = (arg_659_3 - arg_659_0)^2 + (arg_659_4 - arg_659_1)^2 + (arg_659_5 - arg_659_2)^2

		return math.max(var_659_0^0.25, 1e-05)
	end

	function slot_657_16_0(arg_660_0, arg_660_1, arg_660_2, arg_660_3, arg_660_4)
		if math.abs(arg_660_3 - arg_660_2) < 1e-07 then
			return arg_660_0
		end

		return arg_660_0 + (arg_660_1 - arg_660_0) * (arg_660_4 - arg_660_2) / (arg_660_3 - arg_660_2)
	end

	function slot_657_17_0(arg_661_0, arg_661_1, arg_661_2, arg_661_3, arg_661_4, arg_661_5, arg_661_6, arg_661_7, arg_661_8)
		local var_661_0 = slot_657_16_0(arg_661_0, arg_661_1, arg_661_4, arg_661_5, arg_661_8)
		local var_661_1 = slot_657_16_0(arg_661_1, arg_661_2, arg_661_5, arg_661_6, arg_661_8)
		local var_661_2 = slot_657_16_0(arg_661_2, arg_661_3, arg_661_6, arg_661_7, arg_661_8)
		local var_661_3 = slot_657_16_0(var_661_0, var_661_1, arg_661_4, arg_661_6, arg_661_8)
		local var_661_4 = slot_657_16_0(var_661_1, var_661_2, arg_661_5, arg_661_7, arg_661_8)

		return slot_657_16_0(var_661_3, var_661_4, arg_661_5, arg_661_6, arg_661_8)
	end

	slot_657_18_0 = {
		[0] = {
			x = 2 * slot_657_11_0[1].x - slot_657_11_0[2].x,
			y = 2 * slot_657_11_0[1].y - slot_657_11_0[2].y,
			z = 2 * slot_657_11_0[1].z - slot_657_11_0[2].z,
			born = slot_657_11_0[1].born
		}
	}

	for iter_657_4 = 1, slot_657_12_0 do
		slot_657_18_0[iter_657_4] = slot_657_11_0[iter_657_4]
	end

	slot_657_18_0[slot_657_12_0 + 1] = {
		x = 2 * slot_657_11_0[slot_657_12_0].x - slot_657_11_0[slot_657_12_0 - 1].x,
		y = 2 * slot_657_11_0[slot_657_12_0].y - slot_657_11_0[slot_657_12_0 - 1].y,
		z = 2 * slot_657_11_0[slot_657_12_0].z - slot_657_11_0[slot_657_12_0 - 1].z,
		born = slot_657_11_0[slot_657_12_0].born
	}
	slot_657_19_0 = 2.5
	slot_657_20_0 = nil
	slot_657_21_0 = nil
	slot_657_22_0 = nil
	slot_657_23_0 = nil
	slot_657_24_0 = render.world_to_screen(vector(slot_657_11_0[slot_657_12_0].x, slot_657_11_0[slot_657_12_0].y, slot_657_11_0[slot_657_12_0].z))

	if slot_657_24_0 then
		slot_657_22_0, slot_657_23_0 = slot_657_24_0.x, slot_657_24_0.y
	end

	for iter_657_5 = 1, slot_657_12_0 - 1 do
		slot_657_29_0 = slot_657_18_0[iter_657_5 - 1]
		slot_657_30_0 = slot_657_18_0[iter_657_5]
		slot_657_31_0 = slot_657_18_0[iter_657_5 + 1]
		slot_657_32_0 = slot_657_18_0[iter_657_5 + 2]
		slot_657_33_0 = 0
		slot_657_34_0 = slot_657_33_0 + slot_657_15_0(slot_657_29_0.x, slot_657_29_0.y, slot_657_29_0.z, slot_657_30_0.x, slot_657_30_0.y, slot_657_30_0.z)
		slot_657_35_0 = slot_657_34_0 + slot_657_15_0(slot_657_30_0.x, slot_657_30_0.y, slot_657_30_0.z, slot_657_31_0.x, slot_657_31_0.y, slot_657_31_0.z)
		slot_657_36_0 = slot_657_35_0 + slot_657_15_0(slot_657_31_0.x, slot_657_31_0.y, slot_657_31_0.z, slot_657_32_0.x, slot_657_32_0.y, slot_657_32_0.z)
		slot_657_37_0 = slot_657_13_0[iter_657_5] / slot_657_14_0
		slot_657_38_0 = slot_657_13_0[iter_657_5 + 1] / slot_657_14_0
		slot_657_39_0 = math.sqrt((slot_657_31_0.x - slot_657_30_0.x)^2 + (slot_657_31_0.y - slot_657_30_0.y)^2 + (slot_657_31_0.z - slot_657_30_0.z)^2)
		slot_657_40_0 = math.max(4, math.min(48, math.ceil(slot_657_39_0 / slot_657_19_0)))
		slot_657_41_0 = math.max(slot_657_35_0 - slot_657_34_0, 1e-07)
		slot_657_42_0 = 1 / slot_657_40_0

		for iter_657_6 = 0, slot_657_40_0 - 1 do
			slot_657_47_0 = iter_657_6 * slot_657_42_0
			slot_657_48_0 = (iter_657_6 + 1) * slot_657_42_0
			slot_657_49_0 = slot_657_37_0 + (slot_657_38_0 - slot_657_37_0) * (slot_657_47_0 + slot_657_48_0) * 0.5
			slot_657_50_0 = slot_657_49_0 * slot_657_49_0 * (3 - 2 * slot_657_49_0)
			slot_657_51_0 = slot_0_137_0(slot_657_8_0 * slot_657_50_0 * slot_0_127_1)

			if slot_657_51_0 >= 4 then
				slot_657_52_0 = slot_657_34_0 + slot_657_47_0 * slot_657_41_0
				slot_657_53_0 = slot_657_34_0 + slot_657_48_0 * slot_657_41_0
				slot_657_54_0 = slot_657_17_0(slot_657_29_0.x, slot_657_30_0.x, slot_657_31_0.x, slot_657_32_0.x, slot_657_33_0, slot_657_34_0, slot_657_35_0, slot_657_36_0, slot_657_52_0)
				slot_657_55_0 = slot_657_17_0(slot_657_29_0.y, slot_657_30_0.y, slot_657_31_0.y, slot_657_32_0.y, slot_657_33_0, slot_657_34_0, slot_657_35_0, slot_657_36_0, slot_657_52_0)
				slot_657_56_0 = slot_657_17_0(slot_657_29_0.z, slot_657_30_0.z, slot_657_31_0.z, slot_657_32_0.z, slot_657_33_0, slot_657_34_0, slot_657_35_0, slot_657_36_0, slot_657_52_0)
				slot_657_57_0 = slot_657_17_0(slot_657_29_0.x, slot_657_30_0.x, slot_657_31_0.x, slot_657_32_0.x, slot_657_33_0, slot_657_34_0, slot_657_35_0, slot_657_36_0, slot_657_53_0)
				slot_657_58_0 = slot_657_17_0(slot_657_29_0.y, slot_657_30_0.y, slot_657_31_0.y, slot_657_32_0.y, slot_657_33_0, slot_657_34_0, slot_657_35_0, slot_657_36_0, slot_657_53_0)
				slot_657_59_0 = slot_657_17_0(slot_657_29_0.z, slot_657_30_0.z, slot_657_31_0.z, slot_657_32_0.z, slot_657_33_0, slot_657_34_0, slot_657_35_0, slot_657_36_0, slot_657_53_0)
				slot_657_60_0 = render.world_to_screen(vector(slot_657_54_0, slot_657_55_0, slot_657_56_0))
				slot_657_61_0 = render.world_to_screen(vector(slot_657_57_0, slot_657_58_0, slot_657_59_0))

				if slot_657_60_0 and slot_657_61_0 then
					slot_0_138_0(slot_657_60_0.x, slot_657_60_0.y, slot_657_61_0.x, slot_657_61_0.y, slot_657_5_0, slot_657_6_0, slot_657_7_0, slot_0_137_0(slot_657_51_0 * 0.7))

					slot_657_20_0, slot_657_21_0 = slot_657_61_0.x, slot_657_61_0.y
				end
			end
		end
	end

	slot_657_25_0 = slot_657_22_0 or slot_657_20_0
	slot_657_26_0 = slot_657_23_0 or slot_657_21_0

	if slot_657_25_0 then
		slot_0_139_0(slot_657_25_0, slot_657_26_0, slot_657_5_0, slot_657_6_0, slot_657_7_0, slot_0_137_0(slot_657_8_0 * slot_0_127_1))
	end
end)

function slot_0_141_0()
	slot_0_117_1 = {}
	slot_0_118_1 = 1
	slot_0_119_1 = 0
	slot_0_120_1 = 0
	slot_0_125_1 = nil
	slot_0_124_1 = 0
	slot_0_126_1 = nil
	slot_0_134_0 = false
	slot_0_132_0 = -1000
end

events.round_start(slot_0_141_0)
events.level_change(slot_0_141_0)
events.player_death(function(arg_663_0)
	local var_663_0 = entity.get_local_player()

	if var_663_0 and entity.get(arg_663_0.userid, true) == var_663_0 then
		slot_0_141_0()
	end
end)

slot_0_111_0 = 0
slot_0_112_0 = 46
slot_0_113_0 = 4
slot_0_114_0 = 7
slot_0_115_0 = 16
slot_0_116_0 = 14
slot_0_117_0 = 26
slot_0_118_0 = 240
slot_0_119_0 = {}
slot_0_120_0 = {}
slot_0_121_0 = {}
slot_0_122_0 = 0

function slot_0_123_0(arg_664_0, arg_664_1, arg_664_2)
	arg_664_2 = math.max(0, math.min(1, arg_664_2))

	return arg_664_0 + (arg_664_1 - arg_664_0) * arg_664_2
end

function slot_0_124_0(arg_665_0, arg_665_1, arg_665_2)
	arg_665_2 = math.max(0, math.min(1, arg_665_2))

	return color(math.floor(arg_665_0.r + (arg_665_1.r - arg_665_0.r) * arg_665_2), math.floor(arg_665_0.g + (arg_665_1.g - arg_665_0.g) * arg_665_2), math.floor(arg_665_0.b + (arg_665_1.b - arg_665_0.b) * arg_665_2), math.floor(arg_665_0.a + (arg_665_1.a - arg_665_0.a) * arg_665_2))
end

function slot_0_125_0(arg_666_0, arg_666_1, arg_666_2, arg_666_3, arg_666_4, arg_666_5, arg_666_6)
	local var_666_0 = 16

	for iter_666_0 = 0, var_666_0 - 1 do
		local var_666_1 = iter_666_0 / var_666_0
		local var_666_2 = (iter_666_0 + 1) / var_666_0
		local var_666_3 = color(math.floor(arg_666_4.r + (arg_666_5.r - arg_666_4.r) * var_666_1), math.floor(arg_666_4.g + (arg_666_5.g - arg_666_4.g) * var_666_1), math.floor(arg_666_4.b + (arg_666_5.b - arg_666_4.b) * var_666_1), math.floor(arg_666_4.a + (arg_666_5.a - arg_666_4.a) * var_666_1))
		local var_666_4 = math.floor(arg_666_0 + var_666_1 * (arg_666_2 - arg_666_0))
		local var_666_5 = math.floor(arg_666_0 + var_666_2 * (arg_666_2 - arg_666_0))
		local var_666_6 = (iter_666_0 == 0 or iter_666_0 == var_666_0 - 1) and arg_666_6 or 0

		render.rect(vector(var_666_4, arg_666_1), vector(var_666_5, arg_666_3), var_666_3, var_666_6)
	end
end

function slot_0_126_0(arg_667_0, arg_667_1, arg_667_2)
	render.line(vector(arg_667_0 - 7, arg_667_1 + 7), vector(arg_667_0 + 6, arg_667_1 - 6), arg_667_2)
	render.line(vector(arg_667_0 - 6, arg_667_1 + 7), vector(arg_667_0 + 6, arg_667_1 - 4), arg_667_2)
	render.line(vector(arg_667_0 - 7, arg_667_1 + 6), vector(arg_667_0 + 4, arg_667_1 - 6), arg_667_2)
	render.line(vector(arg_667_0 + 4, arg_667_1 - 6), vector(arg_667_0 + 9, arg_667_1 - 7), arg_667_2)
	render.line(vector(arg_667_0 + 4, arg_667_1 - 4), vector(arg_667_0 + 7, arg_667_1 - 7), arg_667_2)

	local var_667_0 = color(arg_667_2.r, arg_667_2.g, arg_667_2.b, math.floor(arg_667_2.a * 0.65))

	render.line(vector(arg_667_0 - 10, arg_667_1 + 9), vector(arg_667_0 - 7, arg_667_1 + 12), var_667_0)
	render.line(vector(arg_667_0 - 9, arg_667_1 + 9), vector(arg_667_0 - 6, arg_667_1 + 12), var_667_0)
	render.line(vector(arg_667_0 - 11, arg_667_1 + 7), vector(arg_667_0 - 9, arg_667_1 + 10), var_667_0)

	local var_667_1 = color(arg_667_2.r, arg_667_2.g, arg_667_2.b, math.floor(arg_667_2.a * 0.85))

	render.line(vector(arg_667_0 - 7, arg_667_1 + 4), vector(arg_667_0 - 4, arg_667_1 + 7), var_667_1)
end

slot_0_127_0 = 160

function slot_0_128_0(arg_668_0, arg_668_1, arg_668_2, arg_668_3, arg_668_4, arg_668_5, arg_668_6, arg_668_7, arg_668_8, arg_668_9, arg_668_10, arg_668_11, arg_668_12)
	slot_668_13_0 = arg_668_2 == "DT"
	slot_668_14_0 = render.measure_text(arg_668_12 or slot_0_28_0, nil, arg_668_3)
	slot_668_15_0 = slot_668_13_0 and slot_0_117_0 or 0
	slot_668_16_0 = slot_0_116_0 + slot_668_15_0 + slot_668_14_0.x + slot_0_116_0
	slot_668_17_0 = arg_668_0 + slot_668_16_0
	slot_668_18_0 = arg_668_1 + slot_0_112_0
	slot_668_19_0 = math.floor(arg_668_6 * 255)

	if slot_668_19_0 < 2 then
		return
	end

	if arg_668_10 and slot_668_19_0 > 18 then
		render.blur(vector(arg_668_0, arg_668_1), vector(slot_668_17_0, slot_668_18_0), 7, arg_668_6 * 0.85, slot_0_114_0)
	end

	slot_668_20_0 = math.floor(slot_0_127_0 * arg_668_6)
	slot_668_21_0 = arg_668_0 + math.floor(slot_668_16_0 * 0.5)
	slot_668_22_0 = color(arg_668_7.r, arg_668_7.g, arg_668_7.b, 0)
	slot_668_23_0 = color(arg_668_7.r, arg_668_7.g, arg_668_7.b, slot_668_20_0)

	render.gradient(vector(arg_668_0, arg_668_1), vector(slot_668_21_0, slot_668_18_0), slot_668_22_0, slot_668_23_0, slot_668_22_0, slot_668_23_0)
	render.gradient(vector(slot_668_21_0, arg_668_1), vector(slot_668_17_0, slot_668_18_0), slot_668_23_0, slot_668_22_0, slot_668_23_0, slot_668_22_0)

	slot_668_24_0 = math.floor(arg_668_4.a * arg_668_6 * 0.12)

	if slot_668_24_0 > 3 then
		slot_668_25_1 = color(arg_668_4.r, arg_668_4.g, arg_668_4.b, 0)
		slot_668_26_1 = color(arg_668_4.r, arg_668_4.g, arg_668_4.b, slot_668_24_0)

		render.gradient(vector(arg_668_0, arg_668_1), vector(slot_668_21_0, slot_668_18_0), slot_668_25_1, slot_668_26_1, slot_668_25_1, slot_668_26_1)
		render.gradient(vector(slot_668_21_0, arg_668_1), vector(slot_668_17_0, slot_668_18_0), slot_668_26_1, slot_668_25_1, slot_668_26_1, slot_668_25_1)
	end

	render.rect_outline(vector(arg_668_0, arg_668_1), vector(slot_668_17_0, slot_668_18_0), color(arg_668_8.r, arg_668_8.g, arg_668_8.b, math.floor(arg_668_8.a * arg_668_6 * 0.45)), 1, slot_0_114_0)
	render.gradient(vector(arg_668_0, arg_668_1), vector(slot_668_21_0, arg_668_1 + 1), color(255, 255, 255, 0), color(255, 255, 255, math.floor(arg_668_6 * 30)), color(255, 255, 255, 0), color(255, 255, 255, math.floor(arg_668_6 * 30)))
	render.gradient(vector(slot_668_21_0, arg_668_1), vector(slot_668_17_0, arg_668_1 + 1), color(255, 255, 255, math.floor(arg_668_6 * 30)), color(255, 255, 255, 0), color(255, 255, 255, math.floor(arg_668_6 * 30)), color(255, 255, 255, 0))

	slot_668_25_0 = math.floor(arg_668_4.a * arg_668_6)
	slot_668_26_0 = color(arg_668_4.r, arg_668_4.g, arg_668_4.b, slot_668_25_0)

	if slot_668_13_0 then
		slot_668_27_1 = arg_668_0 + slot_0_116_0 + math.floor(slot_0_117_0 * 0.5) - 1
		slot_668_28_1 = arg_668_1 + math.floor(slot_0_112_0 * 0.5) - 3

		if arg_668_2 == "DT" then
			slot_0_126_0(slot_668_27_1, slot_668_28_1, slot_668_26_0)
		end
	end

	slot_668_27_0 = arg_668_1 + math.floor((slot_0_112_0 - slot_668_14_0.y) * 0.5)
	slot_668_28_0 = arg_668_0 + slot_0_116_0 + slot_668_15_0
	slot_668_29_0 = math.floor(slot_668_25_0 * 0.45)

	if slot_668_29_0 > 3 then
		render.text(arg_668_12 or slot_0_28_0, vector(slot_668_28_0 + 1, slot_668_27_0 + 1), color(0, 0, 0, slot_668_29_0), nil, arg_668_3)
	end

	render.text(arg_668_12 or slot_0_28_0, vector(slot_668_28_0, slot_668_27_0), slot_668_26_0, nil, arg_668_3)
end

events.render(function()
	slot_669_0_0 = slot_0_27_0

	if not pcall(function()
		slot_669_0_0.enabled:get()
	end) then
		return
	end

	if not slot_669_0_0.enabled:get() then
		slot_669_2_1 = {}

		for iter_669_0 in pairs(slot_0_119_0) do
			slot_669_2_1[#slot_669_2_1 + 1] = iter_669_0
		end

		for iter_669_1, iter_669_2 in ipairs(slot_669_2_1) do
			slot_0_119_0[iter_669_2] = nil
			slot_0_120_0[iter_669_2] = nil
			slot_0_121_0[iter_669_2] = nil
		end

		return
	end

	slot_669_2_0 = entity.get_local_player()

	if not slot_669_2_0 or not slot_669_2_0:is_alive() then
		return
	end

	slot_669_3_0 = render.screen_size()
	slot_669_4_0 = globals.frametime
	slot_669_5_0 = math.min(1, slot_669_4_0 * 14)
	slot_669_6_0 = math.min(1, slot_669_4_0 * 7)
	slot_669_7_0 = slot_669_0_0.blur and slot_669_0_0.blur:get() or false
	slot_669_9_0 = slot_669_0_0.font and (function()
		local var_671_0, var_671_1 = pcall(function()
			return slot_669_0_0.font:get()
		end)

		return var_671_0 and var_671_1 == "verdana"
	end)() and slot_0_33_0 or slot_0_28_0
	slot_669_10_0 = slot_669_0_0.col_bg:get()
	slot_669_11_0 = slot_669_0_0.col_border:get()
	slot_669_12_0 = slot_669_0_0.col_text:get()
	slot_669_13_0, slot_669_14_0 = pcall(function()
		return slot_0_11_0.rage.main.double_tap:get()
	end)
	slot_669_15_0, slot_669_16_0 = pcall(function()
		return slot_0_11_0.rage.main.hide_shots:get()
	end)
	slot_669_17_0, slot_669_18_0 = pcall(function()
		return rage.exploit:get()
	end)
	slot_669_19_0 = true
	slot_669_20_0 = slot_0_72_0.think()
	slot_669_21_0, slot_669_22_0 = pcall(function()
		return slot_0_11_0.antiaim.misc.fake_duck:get()
	end)
	slot_669_23_0, slot_669_24_0 = pcall(function()
		return slot_0_11_0.rage.main.dormant_aimbot:get()
	end)
	slot_669_25_0 = slot_669_17_0 and type(slot_669_18_0) == "number" and slot_669_18_0 or 0
	slot_669_26_0 = slot_0_78_0.is_active
	slot_669_27_0 = {}

	if slot_669_0_0.show_dt:get() and slot_669_13_0 and slot_669_14_0 and not slot_669_26_0 then
		slot_669_28_3 = slot_669_25_0 > 0.01 and slot_669_0_0.col_dt_on:get() or slot_669_0_0.col_dt_off:get()
		slot_669_27_0[#slot_669_27_0 + 1] = {
			label = "DT",
			key = "DT",
			rc = slot_669_28_3,
			fill_t = slot_669_25_0,
			charge_t = slot_669_25_0
		}
	end

	if slot_669_0_0.show_hs:get() and (slot_669_15_0 and slot_669_16_0 or slot_669_26_0) then
		slot_669_27_0[#slot_669_27_0 + 1] = {
			label = "HS",
			fill_t = 1,
			key = "HS",
			rc = slot_669_0_0.col_hs_on:get()
		}
	end

	if slot_669_0_0.show_fs:get() and slot_669_19_0 and slot_669_20_0 then
		slot_669_27_0[#slot_669_27_0 + 1] = {
			label = "FS",
			fill_t = 1,
			key = "FS",
			rc = slot_669_0_0.col_fs_on:get()
		}
	end

	if slot_669_0_0.show_fd:get() and slot_669_21_0 and slot_669_22_0 then
		slot_669_27_0[#slot_669_27_0 + 1] = {
			label = "FD",
			fill_t = 1,
			key = "FD",
			rc = slot_669_0_0.col_fd_on:get()
		}
	end

	if slot_669_0_0.show_da:get() and slot_669_23_0 and slot_669_24_0 then
		slot_669_27_0[#slot_669_27_0 + 1] = {
			label = "DA",
			fill_t = 1,
			key = "DA",
			rc = slot_669_0_0.col_da_on:get()
		}
	end

	if slot_669_0_0.show_ping and slot_669_0_0.show_ping:get() then
		slot_669_28_2, slot_669_29_3 = pcall(function()
			return slot_0_11_0.ping_spike:get()
		end)

		if slot_669_28_2 and type(slot_669_29_3) == "number" and slot_669_29_3 > 0 then
			slot_669_27_0[#slot_669_27_0 + 1] = {
				label = "PING",
				fill_t = 1,
				key = "PING",
				rc = slot_669_0_0.col_ping_on and slot_669_0_0.col_ping_on:get() or color(175, 175, 180, 255)
			}
		end
	end

	if slot_669_0_0.show_lc and slot_669_0_0.show_lc:get() and not (slot_669_21_0 and slot_669_22_0) then
		slot_669_29_2 = slot_669_2_0.m_fFlags
		slot_669_30_2 = slot_669_2_0.m_vecVelocity
		slot_669_31_2 = math.sqrt(slot_669_30_2.x * slot_669_30_2.x + slot_669_30_2.y * slot_669_30_2.y)
		slot_669_32_3 = slot_669_29_2 ~= 257 and slot_669_29_2 ~= 263

		if slot_669_32_3 then
			slot_0_122_0 = 0.2
		else
			slot_0_122_0 = math.max(0, slot_0_122_0 - slot_669_4_0)
		end

		if slot_669_32_3 or slot_0_122_0 > 0 then
			slot_669_33_3 = slot_669_31_2 >= 270 and globals.choked_commands > 2 and (slot_669_0_0.col_lc_on and slot_669_0_0.col_lc_on:get() or color(127, 189, 20, 255)) or slot_669_0_0.col_lc_bad and slot_669_0_0.col_lc_bad:get() or color(255, 0, 0, 255)
			slot_669_27_0[#slot_669_27_0 + 1] = {
				label = "LC",
				fill_t = 1,
				key = "LC",
				rc = slot_669_33_3
			}
		end
	end

	if slot_669_0_0.show_dmg:get() then
		slot_669_28_1 = slot_669_2_0:get_player_weapon()
		slot_669_29_1 = slot_669_28_1 and slot_669_28_1:get_classname() or ""
		slot_669_30_1 = slot_669_29_1:find("knife") or slot_669_29_1:find("bayonet") or slot_669_29_1 == "weapon_knifegg"
		slot_669_31_1 = slot_669_29_1:find("taser")

		if not slot_669_30_1 and not slot_669_31_1 then
			slot_669_32_2, slot_669_33_2 = pcall(function()
				return slot_0_11_0.rage.selection.minimum_damage:get()
			end)
			slot_669_34_4 = slot_0_58_0:is_active("min. damage")

			if not slot_669_34_4 then
				slot_669_35_4, slot_669_36_0 = pcall(function()
					return slot_0_11_0.rage.selection.minimum_damage_global:get()
				end)
				slot_669_34_4 = slot_669_35_4 and slot_669_36_0 == true
			end

			if slot_669_34_4 and slot_669_32_2 and slot_669_33_2 then
				slot_669_27_0[#slot_669_27_0 + 1] = {
					fill_t = 1,
					key = "DMG",
					label = tostring(math.floor(slot_669_33_2)),
					rc = slot_669_0_0.col_dmg_on:get()
				}
			end
		end
	end

	slot_669_28_0 = {}

	for iter_669_3, iter_669_4 in ipairs(slot_669_27_0) do
		slot_669_28_0[iter_669_4.key] = true
	end

	slot_669_29_0 = {
		DT = slot_669_0_0.show_dt:get(),
		HS = slot_669_0_0.show_hs:get(),
		FS = slot_669_0_0.show_fs:get(),
		FD = slot_669_0_0.show_fd:get(),
		DA = slot_669_0_0.show_da:get(),
		LC = slot_669_0_0.show_lc and slot_669_0_0.show_lc:get(),
		DMG = slot_669_0_0.show_dmg:get(),
		PING = slot_669_0_0.show_ping and slot_669_0_0.show_ping:get()
	}
	slot_669_30_0 = {}

	for iter_669_5 in pairs(slot_0_119_0) do
		if not slot_669_28_0[iter_669_5] then
			if slot_669_29_0[iter_669_5] == false then
				slot_669_30_0[#slot_669_30_0 + 1] = iter_669_5
			else
				slot_0_119_0[iter_669_5] = slot_0_123_0(slot_0_119_0[iter_669_5], 0, slot_669_5_0)
				slot_0_120_0[iter_669_5] = slot_0_123_0(slot_0_120_0[iter_669_5] or 0, -slot_0_118_0, slot_669_5_0)
				slot_0_121_0[iter_669_5] = slot_0_123_0(slot_0_121_0[iter_669_5] or 0, 0, slot_669_6_0)

				if slot_0_119_0[iter_669_5] < 0.015 then
					slot_669_30_0[#slot_669_30_0 + 1] = iter_669_5
				end
			end
		end
	end

	for iter_669_6, iter_669_7 in ipairs(slot_669_30_0) do
		slot_0_119_0[iter_669_7] = nil
		slot_0_120_0[iter_669_7] = nil
		slot_0_121_0[iter_669_7] = nil
	end

	for iter_669_8, iter_669_9 in ipairs(slot_669_27_0) do
		if not slot_0_119_0[iter_669_9.key] then
			slot_0_119_0[iter_669_9.key] = 0
			slot_0_120_0[iter_669_9.key] = -slot_0_118_0
			slot_0_121_0[iter_669_9.key] = 0
		end

		slot_0_119_0[iter_669_9.key] = slot_0_123_0(slot_0_119_0[iter_669_9.key], 1, slot_669_5_0)
		slot_0_120_0[iter_669_9.key] = slot_0_123_0(slot_0_120_0[iter_669_9.key], 0, slot_669_5_0)
		slot_0_121_0[iter_669_9.key] = slot_0_123_0(slot_0_121_0[iter_669_9.key], iter_669_9.fill_t, slot_669_6_0)
	end

	slot_669_31_0 = #slot_669_27_0

	for iter_669_10 in pairs(slot_0_119_0) do
		if not slot_669_28_0[iter_669_10] and (slot_0_119_0[iter_669_10] or 0) >= 0.015 then
			slot_669_31_0 = slot_669_31_0 + 1
		end
	end

	slot_669_32_0 = slot_669_31_0 * slot_0_112_0 + math.max(0, slot_669_31_0 - 1) * slot_0_113_0
	slot_669_33_0 = math.floor(slot_669_3_0.y * 0.5 - slot_669_32_0 * 0.5)
	slot_669_34_0 = 0

	for iter_669_11, iter_669_12 in ipairs(slot_669_27_0) do
		slot_669_40_1 = slot_0_119_0[iter_669_12.key] or 0
		slot_669_41_1 = slot_0_120_0[iter_669_12.key] or 0
		slot_669_42_1 = slot_0_121_0[iter_669_12.key] or 0
		slot_669_43_1 = slot_669_33_0 + slot_669_34_0 * (slot_0_112_0 + slot_0_113_0)

		slot_0_128_0(slot_0_115_0 + math.floor(slot_669_41_1), slot_669_43_1, iter_669_12.key, iter_669_12.label, iter_669_12.rc, slot_669_42_1, slot_669_40_1, slot_669_10_0, slot_669_11_0, slot_669_12_0, slot_669_7_0, iter_669_12.charge_t, slot_669_9_0)

		slot_669_34_0 = slot_669_34_0 + 1
	end

	slot_669_35_0 = slot_669_0_0.col_off:get()

	for iter_669_13, iter_669_14 in pairs(slot_0_119_0) do
		if not slot_669_28_0[iter_669_13] and iter_669_14 and iter_669_14 >= 0.015 and slot_669_29_0[iter_669_13] ~= false then
			slot_669_41_0 = slot_0_120_0[iter_669_13] or 0
			slot_669_42_0 = slot_0_121_0[iter_669_13] or 0
			slot_669_43_0 = slot_669_33_0 + slot_669_34_0 * (slot_0_112_0 + slot_0_113_0)

			slot_0_128_0(slot_0_115_0 + math.floor(slot_669_41_0), slot_669_43_0, iter_669_13, iter_669_13, slot_669_35_0, slot_669_42_0, iter_669_14, slot_669_10_0, slot_669_11_0, slot_669_12_0, slot_669_7_0, nil, slot_669_9_0)

			slot_669_34_0 = slot_669_34_0 + 1
		end
	end
end)
events.render(function()
	slot_0_111_0 = slot_0_111_0 + globals.frametime
	slot_681_0_0, slot_681_1_0 = pcall(function()
		return slot_0_15_0:get()
	end)
	slot_681_1_0 = slot_681_0_0 and slot_681_1_0 or color(107, 112, 147, 255)
	slot_681_2_0 = slot_681_1_0.r
	slot_681_3_0 = slot_681_1_0.g
	slot_681_4_0 = slot_681_1_0.b
	slot_681_5_0 = slot_0_0_0
	slot_681_6_0 = #slot_681_5_0
	slot_681_7_0 = ""
	slot_681_8_0 = slot_0_111_0 * 0.5 % 1.3 - 0.15

	for iter_681_0 = 1, slot_681_6_0 do
		slot_681_13_1 = (iter_681_0 - 1) / math.max(slot_681_6_0 - 1, 1)
		slot_681_14_1 = math.abs(slot_681_13_1 - slot_681_8_0)
		slot_681_15_1 = math.max(0, 1 - slot_681_14_1 / 0.12)
		slot_681_15_0 = slot_681_15_1 * slot_681_15_1 * slot_681_15_1 * slot_681_15_1
		slot_681_16_1 = math.max(0, 1 - slot_681_14_1 / 0.5)
		slot_681_16_0 = slot_681_16_1 * slot_681_16_1 * 0.35
		slot_681_17_0 = math.min(1, slot_681_15_0 * 1 + slot_681_16_0)
		slot_681_18_0 = math.max(0, math.min(255, math.floor(8 + (slot_681_2_0 - 8) * slot_681_17_0 + 0.5)))
		slot_681_19_0 = math.max(0, math.min(255, math.floor(8 + (slot_681_3_0 - 8) * slot_681_17_0 + 0.5)))
		slot_681_20_0 = math.max(0, math.min(255, math.floor(8 + (slot_681_4_0 - 8) * slot_681_17_0 + 0.5)))
		slot_681_7_0 = slot_681_7_0 .. string.format("\a%02x%02x%02xff%s", slot_681_18_0, slot_681_19_0, slot_681_20_0, slot_681_5_0:sub(iter_681_0, iter_681_0))
	end

	slot_681_9_0 = slot_0_111_0 * 0.45 % 1
	slot_681_10_0 = 0

	if slot_681_9_0 < 0.2 then
		slot_681_11_1 = slot_681_9_0 / 0.2
		slot_681_10_0 = math.sin(slot_681_11_1 * math.pi)
		slot_681_10_0 = slot_681_10_0 * slot_681_10_0 * slot_681_10_0 * slot_681_10_0
	end

	slot_681_11_0 = math.max(0, math.min(255, math.floor(8 + (slot_681_2_0 - 8) * slot_681_10_0 + 0.5)))
	slot_681_12_0 = math.max(0, math.min(255, math.floor(8 + (slot_681_3_0 - 8) * slot_681_10_0 + 0.5)))
	slot_681_13_0 = math.max(0, math.min(255, math.floor(8 + (slot_681_4_0 - 8) * slot_681_10_0 + 0.5)))
	slot_681_14_0 = string.format("\a%02x%02x%02xff✦", slot_681_11_0, slot_681_12_0, slot_681_13_0)

	ui.sidebar("\a00000000     " .. slot_681_14_0 .. " " .. slot_681_7_0, " ")
end)
