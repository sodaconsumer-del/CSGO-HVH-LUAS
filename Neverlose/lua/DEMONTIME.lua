--by scriptleaks https://discord.gg/kTHUpjVQPV t.me/scriptleakslol

slot_0_0_0 = require("neverlose/base64")
slot_0_1_0 = require("neverlose/clipboard")

function table.contains(arg_1_0, arg_1_1)
	if type(arg_1_0) ~= "table" then
		return false
	end

	for iter_1_0 = 0, #arg_1_0 do
		if arg_1_0[iter_1_0] == arg_1_1 then
			return true, iter_1_0
		end
	end

	return false
end

slot_0_2_0 = {
	hitboxes = ui.find("Aimbot", "Ragebot", "Selection", "Hitboxes"),
	multipoint = {
		head_scale = ui.find("Aimbot", "Ragebot", "Selection", "Multipoint", "Head Scale")
	},
	min_damage = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"),
	auto_scope = ui.find("Aimbot", "Ragebot", "Accuracy", "Auto Scope"),
	dt = {
		switch = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"),
		lag_options = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"),
		fakelag_limit = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Fake Lag Limit"),
		immediate_teleport = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Immediate Teleport")
	},
	peek = {
		switch = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist"),
		autostop = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist", "Auto Stop"),
		retreat_mode = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist", "Retreat Mode"),
		max_distance = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist", "Max Distance")
	},
	body_aim = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim")
}
slot_0_3_0 = {
	safepoints = ui.find("Aimbot", "Ragebot", "Safety", "SSG-08", "Safe Points"),
	min_damage = ui.find("Aimbot", "Ragebot", "Selection", "SSG-08", "Min. Damage"),
	hitchance = ui.find("Aimbot", "Ragebot", "Selection", "SSG-08", "Hit Chance"),
	delay_shot = ui.find("Aimbot", "Ragebot", "Selection", "SSG-08", "Min. Damage", "Delay Shot"),
	autostop = ui.find("Aimbot", "Ragebot", "Accuracy", "SSG-08", "Auto Stop", "Options"),
	head_scale = ui.find("Aimbot", "Ragebot", "Selection", "SSG-08", "Multipoint", "Head Scale"),
	body_scale = ui.find("Aimbot", "Ragebot", "Selection", "SSG-08", "Multipoint", "Body Scale")
}
slot_0_4_0 = {
	CWeaponSSG08 = {
		"Aimbot",
		"Ragebot",
		"Selection",
		"SSG-08",
		"Min. Damage"
	},
	CWeaponAWP = {
		"Aimbot",
		"Ragebot",
		"Selection",
		"AWP",
		"Min. Damage"
	},
	CWeaponTaser = {
		"Aimbot",
		"Ragebot",
		"Selection",
		"Zeus x27",
		"Min. Damage"
	}
}

function slot_0_5_0(arg_2_0)
	local var_2_0 = slot_0_4_0[arg_2_0]

	if not var_2_0 then
		return nil
	end

	local var_2_1, var_2_2 = pcall(ui.find, table.unpack(var_2_0))

	return var_2_1 and var_2_2 or nil
end

ui.sidebar("DEMONTIME", "😈😈‼️👿🎮")

slot_0_6_1 = nil
slot_0_8_0 = ui.create("DEMONTIME", "navigation", 1):list("tabs", {
	"combat 👿👿",
	"preset 💾"
})
slot_0_9_0 = ui.create("DEMONTIME", "peek 👿👿👿", 1)
slot_0_10_0 = slot_0_9_0:switch("demontime peek 🔥🔥🔥")
slot_0_11_0 = slot_0_9_0:switch("teleportation 🌀")
slot_0_12_0 = slot_0_11_0:create()
slot_0_13_0 = slot_0_12_0:slider("teleport range 📏", 100, 150, 100, 1, "u")
slot_0_14_0 = slot_0_12_0:slider("recharge delay ⏳", 32, 128, 64, 1, "t")
slot_0_15_0 = slot_0_12_0:combo("recharge mode 🧠", "safe recharge 🐢🛡️", "AGGRESSIVE 💀💀")
slot_0_16_0 = slot_0_9_0:slider("movement adaptation 🏃", 0, 200, 135, 1, "%")
slot_0_17_0 = ui.create("DEMONTIME", "aerobic 🚀🚀", 2)
slot_0_18_0 = slot_0_17_0:switch("aerobic peek 💨💨💨")
slot_0_19_0 = slot_0_18_0:create()
slot_0_20_0 = slot_0_19_0:slider("jump height 🦘", 50, 200, 111, 1, "u")
slot_0_21_0 = slot_0_19_0:slider("crouch jump height 🐸", 50, 200, 112, 1, "u")
slot_0_22_0 = slot_0_19_0:slider("override hitchance 🎯", 0, 100, 44, 1, "%")
slot_0_23_0 = slot_0_19_0:slider("override head scale 🧠", 1, 100, 60, 1, "%")
slot_0_24_0 = slot_0_19_0:slider("override body scale 💪", 1, 100, 80, 1, "%")
slot_0_25_0 = slot_0_19_0:switch("disable delay shot ⚡", true)
slot_0_26_0 = slot_0_19_0:selectable("autostop 🛑", "early", "move between shots", "in air", "full stop")

slot_0_26_0:set({
	"move between shots",
	"in air"
})

slot_0_27_0 = slot_0_19_0:switch("airborne enemy 🪂", false)
slot_0_28_0 = slot_0_19_0:slider("recharge delay ⏳", 0, 200, 64, 1, "t")
slot_0_29_0 = ui.create("DEMONTIME", "additions 💀💀", 2)
slot_0_30_0 = slot_0_29_0:selectable("additions 😈", "ignore crouching 🧎", "ignore awp 🔫", "ignore unsafe edge 🚧", "ignore autosniper 🎯", "force safe point 🛡️", "all hitboxes 💀")
slot_0_31_0 = ui.create("DEMONTIME", "presets 💾💾", 1)
slot_0_32_0 = slot_0_31_0:list("presets", {
	"no presets"
})
slot_0_33_0 = slot_0_31_0:input(string.format("%s  name", ui.get_icon("pen")), "")
slot_0_34_0 = slot_0_31_0:button(ui.get_icon("floppy-disk"), nil, true)
slot_0_35_0 = slot_0_31_0:button(ui.get_icon("upload"), nil, true)
slot_0_36_0 = slot_0_31_0:button(ui.get_icon("file-export"), nil, true)
slot_0_37_0 = slot_0_31_0:button(ui.get_icon("file-import"), nil, true)
slot_0_38_0 = slot_0_31_0:button("\aed8179ff" .. ui.get_icon("trash") .. "\r", nil, true)
slot_0_39_0 = slot_0_31_0:button(ui.get_icon("check"), nil, true)
slot_0_40_0 = slot_0_31_0:button(ui.get_icon("xmark"), nil, true)

slot_0_34_0:tooltip("save / create preset")
slot_0_35_0:tooltip("load selected preset")
slot_0_36_0:tooltip("export to clipboard")
slot_0_37_0:tooltip("import from clipboard")
slot_0_38_0:tooltip("delete selected")
slot_0_39_0:tooltip("confirm delete")
slot_0_40_0:tooltip("cancel")
slot_0_39_0:visibility(false)
slot_0_40_0:visibility(false)

slot_0_41_0 = {
	"ignore crouching 🧎",
	"ignore awp 🔫",
	"ignore unsafe edge 🚧",
	"ignore autosniper 🎯",
	"force safe point 🛡️",
	"all hitboxes 💀"
}
slot_0_42_0 = {
	"early",
	"move between shots",
	"in air",
	"full stop"
}
slot_0_43_0 = {
	{
		key = "teleport",
		ref = slot_0_11_0
	},
	{
		key = "tp_range",
		ref = slot_0_13_0
	},
	{
		key = "recharge",
		ref = slot_0_14_0
	},
	{
		key = "tp_mode",
		ref = slot_0_15_0
	},
	{
		key = "vel_expand",
		ref = slot_0_16_0
	},
	{
		key = "aerobic",
		ref = slot_0_18_0
	},
	{
		key = "jump_h",
		ref = slot_0_20_0
	},
	{
		key = "crouch_h",
		ref = slot_0_21_0
	},
	{
		key = "aero_hc",
		ref = slot_0_22_0
	},
	{
		key = "aero_head",
		ref = slot_0_23_0
	},
	{
		key = "aero_body",
		ref = slot_0_24_0
	},
	{
		key = "aero_nodelay",
		ref = slot_0_25_0
	},
	{
		type = "selectable",
		key = "aero_autostop",
		ref = slot_0_26_0,
		options = slot_0_42_0
	},
	{
		key = "airborne_enemy",
		ref = slot_0_27_0
	},
	{
		key = "aero_recharge",
		ref = slot_0_28_0
	},
	{
		type = "selectable",
		key = "additions",
		ref = slot_0_30_0,
		options = slot_0_41_0
	}
}

function slot_0_44_0()
	local var_3_0 = {}

	for iter_3_0, iter_3_1 in ipairs(slot_0_43_0) do
		if iter_3_1.type == "selectable" then
			local var_3_1 = {}

			for iter_3_2, iter_3_3 in ipairs(iter_3_1.options) do
				var_3_1[iter_3_3] = iter_3_1.ref:get(iter_3_3)
			end

			var_3_0[iter_3_1.key] = var_3_1
		else
			var_3_0[iter_3_1.key] = iter_3_1.ref:get()
		end
	end

	return var_3_0
end

function slot_0_45_0(arg_4_0)
	if type(arg_4_0) ~= "table" then
		return false
	end

	for iter_4_0, iter_4_1 in ipairs(slot_0_43_0) do
		local var_4_0 = arg_4_0[iter_4_1.key]

		if var_4_0 ~= nil then
			if iter_4_1.type == "selectable" and type(var_4_0) == "table" then
				local var_4_1 = {}

				for iter_4_2, iter_4_3 in ipairs(iter_4_1.options) do
					if var_4_0[iter_4_3] then
						var_4_1[#var_4_1 + 1] = iter_4_3
					end
				end

				if #var_4_1 > 0 then
					pcall(iter_4_1.ref.set, iter_4_1.ref, unpack(var_4_1))
				else
					pcall(iter_4_1.ref.set, iter_4_1.ref)
				end
			else
				pcall(iter_4_1.ref.set, iter_4_1.ref, var_4_0)
			end
		end
	end

	return true
end

slot_0_46_0 = "dtcfg_"
slot_0_47_0 = "_dtcfg"

function slot_0_48_0(arg_5_0)
	local var_5_0, var_5_1 = pcall(json.stringify, arg_5_0)

	if not var_5_0 then
		return nil
	end

	return slot_0_0_0.encode(var_5_1)
end

function slot_0_49_0(arg_6_0)
	if type(arg_6_0) ~= "string" then
		return nil
	end

	arg_6_0 = arg_6_0:gsub(slot_0_46_0, ""):gsub(slot_0_47_0, "")

	local var_6_0, var_6_1 = pcall(slot_0_0_0.decode, arg_6_0)

	if not var_6_0 or not var_6_1 then
		return nil
	end

	local var_6_2, var_6_3 = pcall(json.parse, var_6_1)

	if not var_6_2 then
		return nil
	end

	return var_6_3
end

slot_0_50_0 = "demontime_presets"
slot_0_51_0 = db[slot_0_50_0] or {}

function slot_0_52_0()
	db[slot_0_50_0] = slot_0_51_0
end

slot_0_53_0 = {}

function slot_0_54_0()
	slot_0_53_0 = {}

	for iter_8_0 in pairs(slot_0_51_0) do
		slot_0_53_0[#slot_0_53_0 + 1] = iter_8_0
	end

	table.sort(slot_0_53_0)
end

function slot_0_55_0()
	slot_0_54_0()

	local var_9_0 = {}

	for iter_9_0, iter_9_1 in ipairs(slot_0_53_0) do
		var_9_0[iter_9_0] = iter_9_1
	end

	if #var_9_0 == 0 then
		var_9_0[1] = "no presets"
	end

	slot_0_32_0:update(var_9_0)
end

function slot_0_56_0()
	if #slot_0_53_0 == 0 then
		return nil
	end

	return slot_0_53_0[slot_0_32_0:get()]
end

slot_0_34_0:set_callback(function()
	local var_11_0 = slot_0_33_0:get()

	if not var_11_0 or var_11_0:gsub(" ", "") == "" then
		return
	end

	slot_0_51_0[var_11_0] = slot_0_48_0({
		config = slot_0_48_0(slot_0_44_0()),
		time = common.get_unixtime()
	})

	slot_0_52_0()
	slot_0_55_0()
	utils.console_exec("play ui/beepclear")
end)
slot_0_35_0:set_callback(function()
	local var_12_0 = slot_0_56_0()

	if not var_12_0 or not slot_0_51_0[var_12_0] then
		return
	end

	local var_12_1 = slot_0_49_0(slot_0_51_0[var_12_0])

	if not var_12_1 or not var_12_1.config then
		return
	end

	local var_12_2 = slot_0_49_0(var_12_1.config)

	if var_12_2 and slot_0_45_0(var_12_2) then
		utils.console_exec("play ui/beepclear")
	end
end)
slot_0_36_0:set_callback(function()
	local var_13_0 = slot_0_56_0()

	if not var_13_0 or not slot_0_51_0[var_13_0] then
		return
	end

	slot_0_1_0.set(slot_0_46_0 .. slot_0_51_0[var_13_0] .. slot_0_47_0)
	utils.console_exec("play ui/beepclear")
end)
slot_0_37_0:set_callback(function()
	local var_14_0 = slot_0_1_0.get()

	if not var_14_0 or var_14_0:gsub(" ", "") == "" then
		return
	end

	local var_14_1 = slot_0_33_0:get()

	if not var_14_1 or var_14_1:gsub(" ", "") == "" then
		return
	end

	if slot_0_51_0[var_14_1] then
		return
	end

	local var_14_2 = var_14_0:gsub(slot_0_46_0, ""):gsub(slot_0_47_0, "")
	local var_14_3 = slot_0_49_0(var_14_2)

	if not var_14_3 or not var_14_3.config then
		return
	end

	slot_0_51_0[var_14_1] = var_14_2

	slot_0_52_0()
	slot_0_55_0()
	utils.console_exec("play ui/beepclear")
end)
slot_0_38_0:set_callback(function()
	if not slot_0_56_0() then
		return
	end

	slot_0_38_0:visibility(false)
	slot_0_39_0:visibility(true)
	slot_0_40_0:visibility(true)
end)
slot_0_39_0:set_callback(function()
	local var_16_0 = slot_0_56_0()

	if var_16_0 and slot_0_51_0[var_16_0] then
		slot_0_51_0[var_16_0] = nil

		slot_0_52_0()
		slot_0_55_0()
		utils.console_exec("play buttons/weapon_cant_buy")
	end

	slot_0_38_0:visibility(true)
	slot_0_39_0:visibility(false)
	slot_0_40_0:visibility(false)
end)
slot_0_40_0:set_callback(function()
	slot_0_38_0:visibility(true)
	slot_0_39_0:visibility(false)
	slot_0_40_0:visibility(false)
end)
slot_0_32_0:set_callback(function()
	local var_18_0 = slot_0_56_0()

	if var_18_0 then
		slot_0_33_0:set(var_18_0)
	end
end)
slot_0_54_0()
slot_0_55_0()

function slot_0_6_0()
	local var_19_0 = slot_0_8_0:get()

	slot_0_9_0:visibility(var_19_0 == 1)
	slot_0_17_0:visibility(var_19_0 == 1)
	slot_0_29_0:visibility(var_19_0 == 1)
	slot_0_31_0:visibility(var_19_0 == 2)
end

slot_0_8_0:set_callback(slot_0_6_0, true)
slot_0_6_0()

slot_0_57_0 = {
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
	}
}
slot_0_58_0 = {
	0,
	5,
	2,
	15,
	17
}
slot_0_59_0 = {
	"Head",
	"Arms"
}
slot_0_60_0 = {
	"CWeaponSSG08",
	"CWeaponTaser",
	"CWeaponAWP"
}
slot_0_61_0 = {
	"CWeaponSSG08"
}
slot_0_62_0 = {
	"CWeaponSSG08",
	"CWeaponAWP",
	"CWeaponG3SG1",
	"CWeaponSCAR20"
}
slot_0_63_0 = {
	CWeaponAWP = 4,
	CWeaponSSG08 = 4,
	CWeaponSCAR20 = 4,
	CWeaponG3SG1 = 4,
	CWeaponTaser = 1
}
slot_0_64_0 = 22
slot_0_65_0 = 18
slot_0_66_0 = vector(-16, -16, 0)
slot_0_67_0 = vector(16, 16, 72)
slot_0_68_0 = 33636363
slot_0_69_0 = 0.06
slot_0_70_0 = 64
slot_0_71_0 = {
	peek_wants_off = false,
	aero_restore_at = 0,
	peek_restore_at = 0,
	aero_wants_off = false
}
slot_0_72_0 = nil

function slot_0_73_0(arg_20_0)
	local var_20_0 = slot_0_71_0.peek_restore_at
	local var_20_1 = slot_0_71_0.aero_restore_at

	if var_20_0 ~= 0 then
		local var_20_2 = var_20_0 - arg_20_0

		if var_20_2 > 5 or var_20_2 < -1 then
			slot_0_71_0.peek_restore_at = 0
			var_20_0 = 0
		end
	end

	if var_20_1 ~= 0 then
		local var_20_3 = var_20_1 - arg_20_0

		if var_20_3 > 5 or var_20_3 < -1 then
			slot_0_71_0.aero_restore_at = 0
			var_20_1 = 0
		end
	end

	if var_20_0 > 0 and var_20_0 <= arg_20_0 then
		slot_0_71_0.peek_restore_at = 0
		var_20_0 = 0
	end

	if var_20_1 > 0 and var_20_1 <= arg_20_0 then
		slot_0_71_0.aero_restore_at = 0
		var_20_1 = 0
	end

	local var_20_4 = slot_0_71_0.peek_wants_off or var_20_0 > 0
	local var_20_5 = slot_0_71_0.aero_wants_off or var_20_1 > 0

	if var_20_4 then
		if slot_0_72_0 == nil then
			slot_0_72_0 = slot_0_2_0.dt.switch:get()
		end

		if slot_0_72_0 then
			slot_0_2_0.dt.switch:set(false)
		end
	elseif slot_0_72_0 ~= nil then
		slot_0_2_0.dt.switch:set(slot_0_72_0)

		slot_0_72_0 = nil
	end

	if var_20_5 then
		slot_0_2_0.dt.switch:override(false)
	elseif not var_20_4 then
		slot_0_2_0.dt.switch:override()
	end
end

slot_0_74_0 = {
	should_return = false,
	returning = false,
	targeting = false,
	last_target_rt = 0,
	dt_was_targeting = false,
	force_baim_held = false,
	key_held = false
}
slot_0_75_0 = {
	current_velocity = 0,
	last_returning_tick = 0,
	active_point_index = 0,
	middle_pos = vector(),
	positions = {}
}
slot_0_76_0 = {
	last_fire_rt = 0,
	was_in_air = false,
	cooldown_end = 0,
	dt_was_targeting = false
}
slot_0_77_0 = false
slot_0_78_0 = {}
slot_0_79_0 = {
	active = false
}

function slot_0_80_0(arg_21_0)
	return table.contains(slot_0_30_0:get(), arg_21_0)
end

function slot_0_81_0(arg_22_0, arg_22_1, arg_22_2)
	local var_22_0 = arg_22_2 * math.pi / 180

	return vector(arg_22_0.x + math.cos(var_22_0) * arg_22_1, arg_22_0.y + math.sin(var_22_0) * arg_22_1, arg_22_0.z)
end

function slot_0_82_0(arg_23_0)
	return arg_23_0:get_classname() == "CCSPlayer" and arg_23_0:is_enemy()
end

function slot_0_83_0(arg_24_0, arg_24_1, arg_24_2, arg_24_3)
	local var_24_0 = globals.tickinterval
	local var_24_1 = 800 * var_24_0
	local var_24_2 = 301.993377 * var_24_0
	local var_24_3 = arg_24_0.m_vecVelocity
	local var_24_4 = var_24_3.z > 0 and -var_24_1 or var_24_2
	local var_24_5 = arg_24_1

	for iter_24_0 = 1, arg_24_2 do
		local var_24_6 = var_24_5
		local var_24_7 = arg_24_3 and -1 or 1

		var_24_5 = vector(var_24_5.x + var_24_7 * var_24_3.x * var_24_0, var_24_5.y + var_24_7 * var_24_3.y * var_24_0, var_24_5.z + var_24_7 * (var_24_3.z + var_24_4) * var_24_0)

		if utils.trace_line(var_24_6, var_24_5, slot_0_82_0, 33570827).fraction <= 0.99 then
			return var_24_6
		end
	end

	return var_24_5
end

function slot_0_84_0(arg_25_0, arg_25_1, arg_25_2, arg_25_3)
	if arg_25_2 == 0 then
		return 1
	end

	local var_25_0 = math.max(50, math.min(arg_25_1, 250))
	local var_25_1 = math.pow((var_25_0 - 50) / 200, 0.7)
	local var_25_2 = 1 + arg_25_2 / 100
	local var_25_3 = arg_25_0.m_vecVelocity
	local var_25_4 = render.camera_angles().y
	local var_25_5 = (math.atan2(var_25_3.y, var_25_3.x) * 180 / math.pi - var_25_4 + 180) % 360 - 180

	if arg_25_3 and var_25_5 > 15 or not arg_25_3 and var_25_5 < -15 then
		return 1 + (var_25_2 - 1) * var_25_1
	else
		return 1 + (var_25_2 - 1) * var_25_1 * 0.3
	end
end

function slot_0_85_0(arg_26_0, arg_26_1, arg_26_2, arg_26_3, arg_26_4, arg_26_5, arg_26_6, arg_26_7)
	local var_26_0 = arg_26_1 and arg_26_1 - arg_26_5 or arg_26_0
	local var_26_1 = slot_0_81_0(var_26_0, arg_26_4 == 0 and 0 or arg_26_3, arg_26_2)
	local var_26_2 = utils.trace_hull(var_26_0, var_26_0 + vector(0, 0, slot_0_65_0), arg_26_6, arg_26_7, slot_0_82_0, 33636363).end_pos
	local var_26_3 = utils.trace_hull(vector(var_26_0.x, var_26_0.y, var_26_2.z), vector(var_26_1.x, var_26_1.y, var_26_2.z), arg_26_6, arg_26_7, slot_0_82_0, 33636363)

	if var_26_3.fraction < 0.97 then
		return false
	end

	if var_26_1:dist2d(var_26_3.end_pos) >= arg_26_3 * 0.97 then
		return false
	end

	return utils.trace_hull(var_26_3.end_pos, vector(var_26_3.end_pos.x, var_26_3.end_pos.y, arg_26_0.z - 240), arg_26_6, arg_26_7, slot_0_82_0, 33636363).end_pos + arg_26_5
end

function slot_0_86_0(arg_27_0, arg_27_1, arg_27_2, arg_27_3, arg_27_4, arg_27_5, arg_27_6, arg_27_7, arg_27_8, arg_27_9)
	local var_27_0 = arg_27_9 and arg_27_2 + 90 or arg_27_2 - 90
	local var_27_1 = slot_0_85_0(arg_27_1, arg_27_8, var_27_0, arg_27_3, arg_27_4, arg_27_5, arg_27_6, arg_27_7)

	if var_27_1 and (not arg_27_8 or math.abs(arg_27_8.z - var_27_1.z) <= slot_0_65_0) then
		return var_27_1
	end

	for iter_27_0, iter_27_1 in ipairs({
		10,
		-10,
		20,
		-20,
		30,
		-30,
		40,
		-40
	}) do
		local var_27_2 = slot_0_85_0(arg_27_1, arg_27_8, var_27_0 + iter_27_1, arg_27_3, arg_27_4, arg_27_5, arg_27_6, arg_27_7)

		if var_27_2 and (not arg_27_8 or math.abs(arg_27_8.z - var_27_2.z) <= slot_0_65_0) then
			return var_27_2
		end
	end

	return false
end

function slot_0_87_0(arg_28_0, arg_28_1, arg_28_2, arg_28_3, arg_28_4, arg_28_5, arg_28_6)
	local var_28_0 = arg_28_0.m_vecViewOffset
	local var_28_1 = arg_28_0.m_vecMins
	local var_28_2 = arg_28_0.m_vecMaxs
	local var_28_3 = {
		[0] = slot_0_85_0(arg_28_1, nil, 0, arg_28_3, 0, var_28_0, var_28_1, var_28_2)
	}

	if not var_28_3[0] then
		return var_28_3
	end

	local var_28_4 = arg_28_0.m_vecVelocity:length2d()
	local var_28_5 = slot_0_84_0(arg_28_0, var_28_4, arg_28_6, true)
	local var_28_6 = slot_0_84_0(arg_28_0, var_28_4, arg_28_6, false)

	if arg_28_4 and not arg_28_4:is_dormant() then
		arg_28_2 = (arg_28_4:get_origin() - arg_28_1):angles().y
	end

	var_28_3[1] = slot_0_86_0(arg_28_0, arg_28_1, arg_28_2, arg_28_3 * arg_28_5 * var_28_5, 1, var_28_0, var_28_1, var_28_2, var_28_3[0], true)
	var_28_3[2] = slot_0_86_0(arg_28_0, arg_28_1, arg_28_2, arg_28_3 * arg_28_5 * var_28_6, 2, var_28_0, var_28_1, var_28_2, var_28_3[0], false)

	return var_28_3
end

function slot_0_88_0(arg_29_0, arg_29_1, arg_29_2, arg_29_3, arg_29_4)
	local var_29_0 = arg_29_0.m_vecViewOffset
	local var_29_1 = arg_29_0.m_vecMins
	local var_29_2 = arg_29_0.m_vecMaxs
	local var_29_3 = {
		[0] = slot_0_85_0(arg_29_1, nil, 0, arg_29_3, 0, var_29_0, var_29_1, var_29_2)
	}

	if not var_29_3[0] then
		return var_29_3
	end

	local var_29_4 = arg_29_0.m_vecVelocity:length2d()
	local var_29_5 = slot_0_84_0(arg_29_0, var_29_4, arg_29_4, true)
	local var_29_6 = slot_0_84_0(arg_29_0, var_29_4, arg_29_4, false)

	var_29_3[1] = slot_0_86_0(arg_29_0, arg_29_1, arg_29_2, arg_29_3 * var_29_5, 1, var_29_0, var_29_1, var_29_2, var_29_3[0], true)
	var_29_3[2] = slot_0_86_0(arg_29_0, arg_29_1, arg_29_2, arg_29_3 * var_29_6, 2, var_29_0, var_29_1, var_29_2, var_29_3[0], false)

	return var_29_3
end

function slot_0_89_0(arg_30_0, arg_30_1, arg_30_2)
	local var_30_0 = arg_30_2:get_origin()
	local var_30_1 = (arg_30_1 - var_30_0):angles().y

	if slot_0_80_0("ignore unsafe edge 🚧") then
		local var_30_2 = var_30_1 * math.pi / 180
		local var_30_3 = vector(var_30_0.x + math.cos(var_30_2) * 20, var_30_0.y + math.sin(var_30_2) * 20, var_30_0.z)
		local var_30_4 = utils.trace_hull(var_30_3, vector(var_30_3.x, var_30_3.y, var_30_3.z - 100), slot_0_66_0, slot_0_67_0, arg_30_2, slot_0_68_0)

		if var_30_3.z - var_30_4.end_pos.z > 18 then
			arg_30_0.in_forward = false
			arg_30_0.in_back = false
			arg_30_0.in_moveleft = false
			arg_30_0.in_moveright = false
			arg_30_0.forwardmove = 0
			arg_30_0.sidemove = 0

			return
		end
	end

	arg_30_0.in_forward = true
	arg_30_0.in_back = false
	arg_30_0.in_moveleft = false
	arg_30_0.in_moveright = false
	arg_30_0.in_speed = false
	arg_30_0.forwardmove = 800
	arg_30_0.sidemove = 0
	arg_30_0.move_yaw = var_30_1
end

function slot_0_90_0(arg_31_0, arg_31_1)
	if not arg_31_1 then
		return false
	end

	local var_31_0 = arg_31_0.m_flNextAttack or 0
	local var_31_1 = arg_31_1.m_flNextPrimaryAttack or 0

	return not (math.max(0, var_31_0, var_31_1) > globals.curtime) and not (arg_31_1.m_iClip1 <= 0)
end

function slot_0_91_0(arg_32_0, arg_32_1)
	local var_32_0 = arg_32_0:get_player_weapon()
	local var_32_1 = var_32_0 and var_32_0:get_classname() or ""
	local var_32_2
	local var_32_3 = slot_0_5_0(var_32_1)

	if var_32_3 then
		local var_32_4, var_32_5 = pcall(function()
			return var_32_3:get()
		end)

		var_32_2 = var_32_4 and var_32_5 or slot_0_2_0.min_damage:get()
	else
		var_32_2 = slot_0_2_0.min_damage:get()
	end

	if var_32_2 > 100 then
		var_32_2 = arg_32_1.m_iHealth + (var_32_2 - 100)
	end

	return var_32_2
end

function slot_0_92_0(arg_34_0, arg_34_1, arg_34_2)
	if not arg_34_1 or arg_34_1:is_dormant() then
		return false
	end

	if not arg_34_1:is_enemy() then
		return false
	end

	local var_34_0 = arg_34_0:get_player_weapon()

	if not slot_0_90_0(arg_34_0, var_34_0) then
		return false
	end

	if not slot_0_2_0.auto_scope:get() and table.contains(slot_0_62_0, var_34_0:get_classname()) and not arg_34_0.m_bIsScoped then
		return false
	end

	if not arg_34_2 and rage.exploit:get() ~= 1 then
		return false
	end

	if arg_34_0.m_flVelocityModifier ~= 1 then
		return false
	end

	if arg_34_1:get_bbox().alpha < 1 then
		return false
	end

	return true
end

function slot_0_93_0(arg_35_0, arg_35_1)
	if not arg_35_1 or arg_35_1:is_dormant() then
		return false
	end

	if not arg_35_1:is_enemy() then
		return false
	end

	local var_35_0 = arg_35_0:get_player_weapon()

	if not slot_0_90_0(arg_35_0, var_35_0) then
		return false
	end

	if not slot_0_2_0.auto_scope:get() and table.contains(slot_0_62_0, var_35_0:get_classname()) and not arg_35_0.m_bIsScoped then
		return false
	end

	if arg_35_0.m_flVelocityModifier ~= 1 then
		return false
	end

	if slot_0_27_0:get() and bit.band(arg_35_1.m_fFlags, 1) == 1 then
		return false
	end

	if arg_35_1:get_bbox().alpha < 1 then
		return false
	end

	return true
end

function slot_0_94_0(arg_36_0)
	if not arg_36_0 then
		return false
	end

	if slot_0_80_0("ignore awp 🔫") then
		local var_36_0 = arg_36_0:get_player_weapon()

		if var_36_0 and var_36_0:get_classname() == "CWeaponAWP" then
			return true
		end
	end

	if slot_0_80_0("ignore autosniper 🎯") then
		local var_36_1 = arg_36_0:get_player_weapon()

		if var_36_1 then
			local var_36_2 = var_36_1:get_classname()

			if var_36_2 == "CWeaponG3SG1" or var_36_2 == "CWeaponSCAR20" then
				return true
			end
		end
	end

	if slot_0_80_0("ignore crouching 🧎") then
		local var_36_3 = arg_36_0.m_fFlags or 0
		local var_36_4 = arg_36_0.m_flDuckAmount or 0

		if bit.band(var_36_3, 1) == 1 and var_36_4 > 0.3 then
			return true
		end
	end

	return false
end

function slot_0_95_0(arg_37_0, arg_37_1, arg_37_2, arg_37_3)
	if not arg_37_2 or arg_37_2:is_dormant() or not arg_37_2:is_enemy() then
		return nil, 0
	end

	if not arg_37_3 or #arg_37_3 == 0 then
		return nil, 0
	end

	if slot_0_94_0(arg_37_2) then
		return nil, 0
	end

	local var_37_0 = slot_0_91_0(arg_37_1, arg_37_2)
	local var_37_1 = arg_37_2.m_iHealth
	local var_37_2 = arg_37_1:get_player_weapon()
	local var_37_3 = var_37_2 and var_37_2:get_classname() or ""
	local var_37_4 = slot_0_63_0[var_37_3] or 4

	for iter_37_0 = 1, #arg_37_0 do
		local var_37_5 = arg_37_0[iter_37_0]

		if not var_37_5 then
			-- block empty
		else
			for iter_37_1 = 1, #arg_37_3 do
				local var_37_6 = arg_37_3[iter_37_1]
				local var_37_7 = arg_37_2:get_hitbox_position(var_37_6)

				if var_37_7 then
					local var_37_8 = utils.trace_bullet(arg_37_1, var_37_5, var_37_7)

					if var_37_6 == 0 then
						var_37_8 = var_37_8 * var_37_4
					end

					if var_37_8 > 0 and var_37_8 >= math.min(var_37_0, var_37_1) then
						return var_37_5, iter_37_0
					end
				end
			end
		end
	end

	return nil, 0
end

function slot_0_96_0(arg_38_0)
	local var_38_0 = arg_38_0:get_origin()
	local var_38_1 = bit.band(arg_38_0.m_fFlags, 2) == 2
	local var_38_2 = var_38_1 and slot_0_21_0:get() or slot_0_20_0:get()
	local var_38_3 = var_38_1 and 18 or 0

	return vector(var_38_0.x, var_38_0.y, var_38_0.z + var_38_2 - var_38_3)
end

function slot_0_97_0(arg_39_0, arg_39_1, arg_39_2, arg_39_3)
	if not arg_39_2 or arg_39_2:is_dormant() or not arg_39_2:is_enemy() then
		return false
	end

	if not arg_39_3 or #arg_39_3 == 0 then
		return false
	end

	if slot_0_94_0(arg_39_2) then
		return false
	end

	local var_39_0 = arg_39_1:get_player_weapon()
	local var_39_1 = var_39_0 and var_39_0:get_classname() or ""
	local var_39_2 = slot_0_63_0[var_39_1] or 4
	local var_39_3 = slot_0_91_0(arg_39_1, arg_39_2)
	local var_39_4 = arg_39_2.m_iHealth

	for iter_39_0 = 1, #arg_39_3 do
		local var_39_5 = arg_39_3[iter_39_0]
		local var_39_6 = arg_39_2:get_hitbox_position(var_39_5)

		if var_39_6 then
			local var_39_7 = utils.trace_bullet(arg_39_1, arg_39_0, var_39_6)

			if var_39_5 == 0 then
				var_39_7 = var_39_7 * var_39_2
			end

			if var_39_7 > 0 and var_39_7 >= math.min(var_39_3, var_39_4) then
				return true
			end
		end
	end

	return false
end

function slot_0_98_0(arg_40_0)
	local var_40_0 = slot_0_80_0("all hitboxes 💀") and {
		0,
		4,
		5,
		6,
		2,
		3,
		13,
		14,
		15,
		16,
		17,
		18
	} or {
		0,
		5,
		2,
		15,
		17
	}
	local var_40_1 = slot_0_2_0.hitboxes:get()

	if not var_40_1 or #var_40_1 == 0 then
		slot_0_78_0 = {}

		return
	end

	local var_40_2 = {}

	for iter_40_0, iter_40_1 in ipairs(var_40_1) do
		if not arg_40_0 or not table.contains(slot_0_59_0, iter_40_1) then
			local var_40_3 = slot_0_57_0[iter_40_1]

			if var_40_3 then
				for iter_40_2, iter_40_3 in ipairs(var_40_3) do
					if table.contains(var_40_0, iter_40_3) then
						table.insert(var_40_2, iter_40_3)
					end
				end
			end
		end
	end

	slot_0_78_0 = var_40_2
end

function slot_0_99_0()
	slot_0_2_0.multipoint.head_scale:override()

	if slot_0_72_0 ~= nil then
		slot_0_2_0.dt.switch:set(slot_0_72_0)

		slot_0_72_0 = nil
	end

	slot_0_2_0.dt.switch:override()
	slot_0_2_0.dt.lag_options:override()
	slot_0_2_0.dt.fakelag_limit:override()
	slot_0_2_0.dt.immediate_teleport:override()
	slot_0_2_0.peek.switch:override()
	slot_0_2_0.peek.retreat_mode:override()
	slot_0_2_0.peek.max_distance:override()
	slot_0_2_0.peek.autostop:override()
	slot_0_3_0.safepoints:override()
	slot_0_3_0.hitchance:override()
	slot_0_3_0.delay_shot:override()
	slot_0_3_0.autostop:override()
	slot_0_3_0.head_scale:override()
	slot_0_3_0.body_scale:override()
end

function slot_0_100_0()
	slot_0_74_0.targeting = false
	slot_0_74_0.returning = false
	slot_0_74_0.should_return = false
	slot_0_74_0.key_held = false
	slot_0_74_0.dt_was_targeting = false
	slot_0_74_0.last_target_rt = 0
	slot_0_74_0.last_target_point = nil
	slot_0_71_0.peek_wants_off = false
	slot_0_71_0.peek_restore_at = 0
	slot_0_79_0.active = false
	slot_0_75_0.positions = {}
	slot_0_75_0.active_point_index = 0

	slot_0_2_0.peek.switch:override()
	slot_0_2_0.peek.retreat_mode:override()
end

function slot_0_101_0()
	slot_0_76_0.cooldown_end = 0
	slot_0_76_0.was_in_air = false
	slot_0_76_0.last_fire_rt = 0
	slot_0_77_0 = false

	slot_0_3_0.hitchance:override()
	slot_0_3_0.head_scale:override()
	slot_0_3_0.body_scale:override()
	slot_0_3_0.delay_shot:override()
	slot_0_3_0.autostop:override()
end

function slot_0_102_0()
	slot_0_101_0()

	slot_0_76_0.dt_was_targeting = false
	slot_0_71_0.aero_wants_off = false
	slot_0_71_0.aero_restore_at = 0
end

function slot_0_103_0()
	slot_0_99_0()
	slot_0_100_0()
	slot_0_102_0()
end

function slot_0_104_0()
	slot_0_3_0.hitchance:override(slot_0_22_0:get())
	slot_0_3_0.head_scale:override(slot_0_23_0:get())
	slot_0_3_0.body_scale:override(slot_0_24_0:get())

	if slot_0_25_0:get() then
		slot_0_3_0.delay_shot:override(false)
	end

	local var_46_0 = slot_0_26_0:get()

	if #var_46_0 > 0 then
		slot_0_3_0.autostop:override(var_46_0)
	end
end

function slot_0_105_0(arg_47_0)
	slot_47_1_0 = entity.get_local_player()

	if not slot_47_1_0 or not slot_47_1_0:is_alive() then
		slot_0_103_0()

		return
	end

	slot_47_2_0 = slot_47_1_0:get_player_weapon()

	if not slot_47_2_0 then
		slot_0_103_0()

		return
	end

	slot_47_3_0 = slot_47_2_0:get_classname()
	slot_47_4_0 = globals.tickcount
	slot_47_5_0 = globals.realtime
	slot_47_6_0 = bit.band(slot_47_1_0.m_fFlags, 1) == 1
	slot_47_7_0 = not slot_47_6_0
	slot_0_71_0.peek_wants_off = false
	slot_0_71_0.aero_wants_off = false

	if #slot_0_78_0 == 0 then
		slot_0_98_0(slot_0_2_0.body_aim:get() == "Force")
	end

	slot_47_8_0 = slot_0_2_0.body_aim:get() == "Force"

	if slot_47_8_0 ~= slot_0_74_0.force_baim_held then
		slot_0_98_0(slot_47_8_0)

		slot_0_74_0.force_baim_held = slot_47_8_0
	end

	if slot_0_80_0("force safe point 🛡️") then
		slot_0_3_0.safepoints:override("Force")
	end

	slot_47_9_0 = slot_0_5_0(slot_47_3_0)
	slot_47_10_0 = false

	if slot_47_9_0 then
		slot_47_11_3, slot_47_12_2 = pcall(function()
			return slot_47_9_0:get() < 100
		end)

		if slot_47_11_3 then
			slot_47_10_0 = slot_47_12_2
		end
	end

	slot_47_11_2 = slot_0_10_0:get()

	if not slot_47_11_2 and slot_0_74_0.key_held then
		slot_0_100_0()
	elseif slot_47_10_0 or not table.contains(slot_0_60_0, slot_47_3_0) then
		-- block empty
	else
		if slot_47_11_2 and not slot_0_74_0.key_held then
			slot_0_75_0.middle_pos = slot_0_83_0(slot_47_1_0, slot_47_1_0:get_origin(), 13, true)
			slot_0_74_0.key_held = true
			slot_0_74_0.dt_was_targeting = false
			slot_0_71_0.peek_restore_at = 0
		end

		if not slot_47_11_2 then
			slot_0_74_0.targeting = false
			slot_0_74_0.returning = false
			slot_0_74_0.should_return = false
			slot_0_79_0.active = false
		else
			slot_0_2_0.peek.switch:override(true)
			slot_0_2_0.dt.fakelag_limit:override(1)
			slot_0_2_0.dt.immediate_teleport:override(false)

			slot_47_12_1 = slot_47_1_0:get_origin()
			slot_47_13_1 = slot_47_1_0.m_vecVelocity:length2d()
			slot_47_14_1 = slot_0_75_0.middle_pos:dist2d(slot_47_12_1)
			slot_0_75_0.current_velocity = slot_47_13_1

			if not slot_0_74_0.targeting and not slot_0_74_0.returning or slot_47_14_1 > 0.15 and slot_47_13_1 < 1.011 and slot_47_13_1 ~= 0 then
				slot_0_75_0.middle_pos = slot_47_12_1
			end

			slot_47_15_1 = entity.get_threat()
			slot_47_16_1 = render.camera_angles().y
			slot_47_17_0 = slot_0_11_0:get()
			slot_47_18_0 = slot_0_13_0:get() / 100
			slot_47_19_0 = slot_0_16_0:get()
			slot_0_75_0.current_target = slot_47_15_1

			if slot_47_17_0 then
				slot_0_75_0.positions = slot_0_87_0(slot_47_1_0, slot_0_75_0.middle_pos, slot_47_16_1, slot_0_64_0, slot_47_15_1, slot_47_18_0, slot_47_19_0)
			else
				slot_0_75_0.positions = slot_0_88_0(slot_47_1_0, slot_0_75_0.middle_pos, slot_47_16_1, slot_0_64_0, slot_47_19_0)
			end

			slot_0_79_0.active = true
			slot_47_20_0 = nil
			slot_47_21_0 = 0

			if not slot_47_7_0 and not slot_0_74_0.returning and slot_0_92_0(slot_47_1_0, slot_47_15_1, slot_47_17_0) then
				slot_47_20_0, slot_47_21_0 = slot_0_95_0(slot_0_75_0.positions, slot_47_1_0, slot_47_15_1, slot_0_78_0)
			end

			if slot_47_20_0 then
				slot_0_74_0.last_target_rt = slot_47_5_0
				slot_0_74_0.last_target_point = slot_47_20_0
			end

			if not slot_47_20_0 and slot_0_74_0.last_target_rt > 0 and slot_47_5_0 - slot_0_74_0.last_target_rt < slot_0_69_0 and slot_0_74_0.last_target_point then
				slot_47_22_1 = slot_0_75_0.current_target

				if slot_47_22_1 and not slot_47_22_1:is_dormant() and slot_47_22_1:get_bbox().alpha >= 1 then
					slot_0_74_0.targeting = true
					slot_47_20_0 = slot_0_74_0.last_target_point
				else
					slot_0_74_0.last_target_rt = 0
					slot_0_74_0.last_target_point = nil
					slot_0_74_0.targeting = false
					slot_47_21_0 = 0
				end
			else
				slot_0_74_0.targeting = slot_47_20_0 ~= nil

				if not slot_0_74_0.targeting then
					slot_0_74_0.last_target_rt = 0
					slot_0_74_0.last_target_point = nil
					slot_47_21_0 = 0
				end
			end

			slot_0_75_0.active_point_index = slot_47_21_0

			if slot_47_17_0 then
				slot_47_22_0 = slot_0_15_0:get() == "AGGRESSIVE 💀💀"
				slot_47_23_0 = slot_0_14_0:get() * globals.tickinterval

				if slot_0_74_0.targeting then
					slot_0_71_0.peek_wants_off = true

					if not slot_0_74_0.dt_was_targeting then
						slot_0_74_0.dt_was_targeting = true
						slot_0_71_0.peek_restore_at = 0
					end
				else
					if slot_0_74_0.dt_was_targeting then
						if not slot_47_22_0 and slot_0_71_0.peek_restore_at == 0 then
							slot_0_71_0.peek_restore_at = slot_47_5_0 + slot_47_23_0
						end

						slot_0_74_0.dt_was_targeting = false
					end

					if not slot_47_22_0 and slot_0_71_0.peek_restore_at > 0 then
						slot_0_71_0.peek_wants_off = true
					end
				end
			end

			if slot_0_74_0.targeting then
				slot_0_89_0(arg_47_0, slot_47_20_0, slot_47_1_0)

				slot_0_74_0.returning = false
				slot_0_74_0.should_return = true
			elseif slot_47_7_0 then
				slot_0_74_0.returning = false
				slot_0_74_0.should_return = false
			elseif slot_0_74_0.should_return then
				slot_0_74_0.returning = true
				slot_0_74_0.should_return = false
			end

			if not slot_0_74_0.returning then
				slot_0_75_0.last_returning_tick = slot_47_4_0
			end

			if slot_0_74_0.returning and (slot_47_14_1 < 0.15 or slot_47_13_1 < 1) then
				slot_0_74_0.returning = false
			end

			if slot_0_74_0.targeting then
				slot_0_2_0.multipoint.head_scale:override(100)
			else
				slot_0_2_0.multipoint.head_scale:override()
			end

			if slot_0_74_0.returning then
				slot_0_2_0.peek.retreat_mode:override({
					"On Shot",
					"On Key Release"
				})
			else
				slot_0_2_0.peek.retreat_mode:override()
			end
		end
	end

	if not slot_0_18_0:get() or not table.contains(slot_0_61_0, slot_47_3_0) then
		if slot_0_76_0.dt_was_targeting then
			slot_47_11_1 = slot_0_28_0:get() * globals.tickinterval

			if slot_0_71_0.aero_restore_at == 0 then
				slot_0_71_0.aero_restore_at = slot_47_5_0 + slot_47_11_1
			end

			slot_0_76_0.dt_was_targeting = false
		end

		if slot_0_71_0.aero_restore_at > 0 then
			slot_0_71_0.aero_wants_off = true
		end

		slot_0_101_0()
	else
		slot_0_104_0()
		slot_0_2_0.dt.fakelag_limit:override(1)
		slot_0_2_0.dt.immediate_teleport:override(false)

		slot_47_11_0 = entity.get_threat()
		slot_47_12_0 = slot_0_96_0(slot_47_1_0)
		slot_47_13_0 = false

		if slot_47_11_0 and slot_0_93_0(slot_47_1_0, slot_47_11_0) then
			slot_47_13_0 = slot_0_97_0(slot_47_12_0, slot_47_1_0, slot_47_11_0, slot_0_78_0)
		end

		if slot_47_13_0 then
			slot_0_76_0.last_fire_rt = slot_47_5_0
		end

		slot_47_14_0 = not slot_47_13_0 and slot_0_76_0.last_fire_rt > 0 and slot_47_5_0 - slot_0_76_0.last_fire_rt < slot_0_69_0 and slot_47_11_0 ~= nil and not slot_47_11_0:is_dormant() and slot_47_11_0:get_bbox().alpha >= 1
		slot_47_15_0 = slot_47_13_0 or slot_47_14_0
		slot_47_16_0 = slot_0_28_0:get() * globals.tickinterval

		if slot_47_15_0 then
			slot_0_71_0.aero_wants_off = true

			if not slot_0_76_0.dt_was_targeting then
				slot_0_76_0.dt_was_targeting = true
				slot_0_71_0.aero_restore_at = 0
			end
		else
			if slot_0_76_0.dt_was_targeting then
				if slot_0_71_0.aero_restore_at == 0 then
					slot_0_71_0.aero_restore_at = slot_47_5_0 + slot_47_16_0
				end

				slot_0_76_0.dt_was_targeting = false
			end

			if slot_0_71_0.aero_restore_at > 0 then
				slot_0_71_0.aero_wants_off = true
			end
		end

		if slot_47_15_0 and slot_47_6_0 and slot_47_4_0 > slot_0_76_0.cooldown_end then
			if slot_47_1_0.m_vecVelocity:length2d() > 15 then
				slot_0_77_0 = true
				arg_47_0.in_speed = true
				arg_47_0.forwardmove = 0
				arg_47_0.sidemove = 0
				arg_47_0.in_forward = false
				arg_47_0.in_back = false
				arg_47_0.in_moveleft = false
				arg_47_0.in_moveright = false
			else
				slot_0_77_0 = false
				arg_47_0.in_jump = true
				arg_47_0.in_speed = true
				arg_47_0.forwardmove = 0
				arg_47_0.sidemove = 0
				slot_0_76_0.cooldown_end = slot_47_4_0 + slot_0_70_0
				slot_0_76_0.was_in_air = true
			end
		elseif slot_0_77_0 and slot_47_6_0 then
			arg_47_0.in_speed = true
			arg_47_0.forwardmove = 0
			arg_47_0.sidemove = 0
			arg_47_0.in_forward = false
			arg_47_0.in_back = false
			arg_47_0.in_moveleft = false
			arg_47_0.in_moveright = false

			if slot_47_1_0.m_vecVelocity:length2d() <= 15 then
				slot_0_77_0 = false
			end
		elseif not slot_47_15_0 then
			slot_0_77_0 = false
		end

		if slot_0_76_0.was_in_air and slot_47_6_0 then
			slot_0_76_0.was_in_air = false
		end
	end

	slot_0_73_0(slot_47_5_0)
end

function slot_0_106_0()
	slot_0_103_0()
end

slot_0_98_0(false)
slot_0_2_0.hitboxes:set_callback(function()
	slot_0_98_0(slot_0_2_0.body_aim:get() == "Force")
end)
slot_0_2_0.body_aim:set_callback(function()
	slot_0_98_0(slot_0_2_0.body_aim:get() == "Force")
end)
slot_0_30_0:set_callback(function()
	slot_0_98_0(slot_0_2_0.body_aim:get() == "Force")
end, true)
events.createmove:set(slot_0_105_0)
events.shutdown:set(slot_0_106_0)
