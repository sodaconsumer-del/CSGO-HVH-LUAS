--by scriptleaks https://discord.gg/kTHUpjVQPV t.me/scriptleakslol

_DEBUG = true
slot_0_0_0 = {
	PRO = "Pro",
	TRIAL = "Trial",
	BASE = "Base",
	RECODE = "Recode"
}
slot_0_1_0 = slot_0_0_0.RECODE
slot_0_2_0 = "2"
slot_0_3_0 = "https://api.evalate.com/v2"
slot_0_4_0 = "wss://api.evalate.com/v2"
slot_0_5_0 = "0615683616"
slot_0_6_0 = {
	["content-type"] = "application/json"
}
slot_0_7_0 = {
	time = 0,
	start = function(arg_1_0)
		arg_1_0.time = common.get_timestamp()
	end,
	stop = function(arg_2_0)
		return common.get_timestamp() - arg_2_0.time
	end
}

slot_0_7_0:start()

slot_0_8_0 = require("neverlose/pui")
slot_0_9_0 = require("neverlose/base64")
slot_0_10_0 = require("neverlose/hashing")
slot_0_11_0 = require("neverlose/gradient")
slot_0_12_0 = require("neverlose/clipboard")
slot_0_13_0 = require("neverlose/websockets")
slot_0_8_0.colors.red = color(255, 125, 125)
slot_0_8_0.colors.grey = color(141, 141, 141)
slot_0_8_0.colors.green = color(169, 182, 81)
slot_0_14_1 = nil
slot_0_15_2 = nil

function slot_0_15_1(arg_3_0)
	local var_3_0 = {}

	for iter_3_0, iter_3_1 in pairs(arg_3_0) do
		table.insert(var_3_0, iter_3_0)
	end

	table.sort(var_3_0)

	local var_3_1 = ""

	for iter_3_2, iter_3_3 in ipairs(var_3_0) do
		local var_3_2 = arg_3_0[iter_3_3]

		if type(var_3_2) == "table" then
			var_3_1 = var_3_1 .. iter_3_3 .. slot_0_15_1(var_3_2)
		else
			var_3_1 = var_3_1 .. iter_3_3 .. tostring(var_3_2)
		end
	end

	return var_3_1
end

function slot_0_14_0(arg_4_0, arg_4_1)
	return slot_0_10_0.sha256(slot_0_15_1(arg_4_0) .. arg_4_1)
end

function slot_0_15_0(arg_5_0, arg_5_1, arg_5_2)
	return arg_5_0 + (arg_5_1 - arg_5_0) * arg_5_2
end

function slot_0_16_0(arg_6_0, arg_6_1, arg_6_2)
	if arg_6_0 < arg_6_1 then
		return arg_6_1
	elseif arg_6_2 < arg_6_0 then
		return arg_6_2
	else
		return arg_6_0
	end
end

function slot_0_17_0(arg_7_0, arg_7_1, arg_7_2)
	return vector(slot_0_16_0(arg_7_0.x, arg_7_1.x, arg_7_2.x), slot_0_16_0(arg_7_0.y, arg_7_1.y, arg_7_2.y), slot_0_16_0(arg_7_0.z, arg_7_1.z, arg_7_2.z))
end

function slot_0_18_0(arg_8_0, arg_8_1, arg_8_2)
	local var_8_0 = {}

	for iter_8_0, iter_8_1 in ipairs(arg_8_0) do
		if iter_8_1 == arg_8_1 then
			table.insert(var_8_0, arg_8_2)
		else
			table.insert(var_8_0, iter_8_1)
		end
	end

	return var_8_0
end

slot_0_19_0 = panorama.SteamOverlayAPI.OpenExternalBrowserURL
slot_0_20_0 = common.get_username()
slot_0_21_0 = render.screen_size()
slot_0_22_0 = {}
slot_0_23_0 = {}
slot_0_24_1 = {}
slot_0_25_1 = {}

function slot_0_23_0.find(arg_9_0)
	return slot_0_25_1[arg_9_0]
end

function slot_0_23_0.get_storage()
	return slot_0_25_1
end

function slot_0_23_0.new(arg_11_0, arg_11_1, ...)
	assert(slot_0_25_1[arg_11_0] == nil, string.format("menu.new - element with same name already exist (%s)", arg_11_0))

	if ... then
		arg_11_1:depend(...)
	end

	slot_0_25_1[arg_11_0] = arg_11_1
end

function slot_0_23_0.set_callback_list(arg_12_0, arg_12_1)
	local var_12_0 = arg_12_0:id()

	slot_0_24_1[var_12_0] = {
		arg_12_0:list()
	}

	local function var_12_1()
		local var_13_0 = arg_12_0:get()
		local var_13_1 = slot_0_24_1[var_12_0][1]

		if not var_13_1[var_13_0] then
			return
		end

		local var_13_2 = slot_0_8_0.string(arg_12_1 and string.format("\v•  \r%s", var_13_1[var_13_0]) or string.format("\v%s\r %s", var_13_1[var_13_0]:sub(1, 3), var_13_1[var_13_0]:sub(5)))

		arg_12_0:update(slot_0_18_0(var_13_1, var_13_1[var_13_0], var_13_2))
	end

	slot_0_24_1[var_12_0][2] = var_12_1

	arg_12_0:set_callback(var_12_1, true)
end

slot_0_24_0 = {
	movement = slot_0_8_0.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"),
	auto_stop = slot_0_8_0.find("Aimbot", "Ragebot", "Accuracy", "SSG-08", "Auto Stop", {
		double_tab = "Double Tap",
		options = "Options"
	}),
	freestanding = slot_0_8_0.find("Aimbot", "Anti Aim", "Angles", "Freestanding", {
		yaw = "Disable Yaw Modifiers",
		body = "Body Freestanding"
	}),
	double_tap = slot_0_8_0.find("Aimbot", "Ragebot", "Main", "Double Tap", {
		lag_limit = "Fake Lag Limit",
		options = "Lag Options",
		quick_switch = "Quick-Switch"
	}),
	hide_shots = slot_0_8_0.find("Aimbot", "Ragebot", "Main", "Hide Shots", {
		options = "Options"
	}),
	weapon_actions = slot_0_8_0.find("Miscellaneous", "Main", "Other", "Weapon Actions"),
	air_strafe = slot_0_8_0.find("Miscellaneous", "Main", "Movement", "Air Strafe"),
	strafe_assist = slot_0_8_0.find("Miscellaneous", "Main", "Movement", "Strafe Assist"),
	body_aim = slot_0_8_0.find("Aimbot", "Ragebot", "Safety", "Body Aim"),
	safe_points = slot_0_8_0.find("Aimbot", "Ragebot", "Safety", "Safe Points"),
	peek_assist = slot_0_8_0.find("Aimbot", "Ragebot", "Main", "Peek Assist", {
		retreat_mode = "Retreat Mode"
	}),
	scope_overlay = slot_0_8_0.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay"),
	hitchance = slot_0_8_0.find("Aimbot", "Ragebot", "Selection", "Hit Chance"),
	damage = slot_0_8_0.find("Aimbot", "Ragebot", "Selection", "Min. Damage"),
	slow_walk = slot_0_8_0.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"),
	fake_duck = slot_0_8_0.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"),
	fake_lag = slot_0_8_0.find("Aimbot", "Anti Aim", "Fake Lag", "Enabled"),
	unlock_cvars = slot_0_8_0.find("Miscellaneous", "Main", "Other", "Unlock Hidden Cvars"),
	avoid_backstab = slot_0_8_0.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab"),
	is_min_damage = function(arg_14_0)
		for iter_14_0, iter_14_1 in ipairs(ui.get_binds()) do
			if iter_14_1.reference:id() == arg_14_0.damage:id() and iter_14_1.active then
				return true
			end
		end

		return false
	end,
	antiaim = {}
}
slot_0_24_0.antiaim.enabled = slot_0_8_0.find("Aimbot", "Anti Aim", "Angles", "Enabled")
slot_0_24_0.antiaim.yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw")
slot_0_24_0.antiaim.pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Pitch")
slot_0_24_0.antiaim.base = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base")
slot_0_24_0.antiaim.hidden = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden")
slot_0_24_0.antiaim.offset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset")
slot_0_24_0.antiaim.modifier = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier")
slot_0_24_0.antiaim.modifier_degree = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset")
slot_0_24_0.antiaim.desync = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw")
slot_0_24_0.antiaim.options = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options")
slot_0_24_0.antiaim.inverter = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter")
slot_0_24_0.antiaim.left_limit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit")
slot_0_24_0.antiaim.right_limit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit")
slot_0_24_0.antiaim.freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding")
slot_0_25_0 = {
	home = slot_0_8_0.create("\v\f<house-blank>", {
		{
			"main",
			"## main",
			1
		},
		{
			"lyrics",
			"## lyrics",
			2
		},
		{
			"about",
			"## about",
			2
		},
		{
			"leaderboard",
			"## leaderboard",
			2
		},
		{
			"discord",
			"## discord",
			2
		},
		{
			"stats_one",
			"## stats_one",
			1
		},
		{
			"stats_two",
			"## stats_two",
			1
		},
		{
			"stats_three",
			"## stats_three",
			1
		},
		{
			"presets_setup",
			"## presets setup",
			1
		},
		{
			"preset_information",
			"## preset information ",
			1
		},
		{
			"preset_creation",
			"## preset creation",
			2
		},
		{
			"preset_actions",
			"## preset actions",
			2
		},
		{
			"local_presets",
			"## local presets",
			2
		},
		{
			"cloud_presets",
			"## cloud presets",
			2
		}
	}),
	features = slot_0_8_0.create("\v\f<wave-sine>", {
		{
			"main",
			"## main",
			1
		},
		{
			"settings",
			"## settings",
			1
		},
		{
			"predict",
			"## predict",
			2
		},
		{
			"air",
			"## air",
			2
		},
		{
			"premium",
			"## premium",
			2
		},
		{
			"widgets",
			"## widgets",
			2
		},
		{
			"stack",
			"## stack",
			2
		},
		{
			"crosshair",
			"## crosshair",
			2
		},
		{
			"world",
			"## world",
			1
		},
		{
			"breakers",
			"## breakers",
			1
		},
		{
			"movement",
			"## movement",
			2
		},
		{
			"game_focus",
			"## game focus",
			1
		},
		{
			"grenade_features",
			"## grenade features",
			2
		},
		{
			"scoreboard",
			"## scoreboard",
			2
		},
		{
			"unlocks",
			"## unlocks",
			1
		}
	}),
	antiaim = slot_0_8_0.create("\v\f<shield>", {
		{
			"main",
			"## main",
			1
		},
		{
			"enable",
			"## enable",
			2
		},
		{
			"setup",
			"## setup",
			2
		},
		{
			"setup_two",
			"## setup two",
			2
		},
		{
			"binds",
			"## binds",
			1
		},
		{
			"state",
			"## state",
			1
		},
		{
			"defensive_state",
			"## defensive state",
			1
		},
		{
			"message",
			"## message",
			2
		}
	})
}
slot_0_26_0 = {
	__home_list = {
		"\f<inbox>    Overview",
		"\f<file>     Presets"
	}
}
slot_0_26_0.home = slot_0_25_0.home.main:list("", slot_0_26_0.__home_list, nil, false)
slot_0_26_0.__features_list = {
	"\f<wave-sine>   Aimbot",
	"\f<paintbrush>    Visual",
	"\f<bars-sort>     Misc"
}
slot_0_26_0.features = slot_0_25_0.features.main:list("", slot_0_26_0.__features_list, nil, false)
slot_0_26_0.__antiaim_list = {
	"\f<clone>    Setup",
	"\f<code-branch>     Builder",
	"\f<solar-system>    Defensive"
}
slot_0_26_0.antiaim = slot_0_25_0.antiaim.main:list("", slot_0_26_0.__antiaim_list, nil, false)

slot_0_23_0.set_callback_list(slot_0_26_0.home)
slot_0_23_0.set_callback_list(slot_0_26_0.antiaim)
slot_0_23_0.set_callback_list(slot_0_26_0.features)

slot_0_27_0 = {
	home = {}
}
slot_0_27_0.home.overview = {
	slot_0_26_0.home,
	1
}
slot_0_27_0.home.presets = {
	slot_0_26_0.home,
	2
}
slot_0_27_0.home.not_presets = {
	slot_0_26_0.home,
	2,
	true
}
slot_0_27_0.features = {}
slot_0_27_0.features.aimbot = {
	slot_0_26_0.features,
	1
}
slot_0_27_0.features.visual = {
	slot_0_26_0.features,
	2
}
slot_0_27_0.features.misc = {
	slot_0_26_0.features,
	3
}
slot_0_27_0.antiaim = {}
slot_0_27_0.antiaim.setup = {
	slot_0_26_0.antiaim,
	1
}
slot_0_27_0.antiaim.builder = {
	slot_0_26_0.antiaim,
	2
}
slot_0_27_0.antiaim.defensive = {
	slot_0_26_0.antiaim,
	3
}
slot_0_28_1 = nil
slot_0_29_1 = nil
slot_0_30_1 = {}

function slot_0_28_0(arg_15_0, arg_15_1)
	if slot_0_30_1[arg_15_0] == nil then
		slot_0_30_1[arg_15_0] = {}
	end

	if slot_0_30_1[arg_15_0][arg_15_1] == true then
		return
	end

	events[arg_15_0]:set(arg_15_1)

	slot_0_30_1[arg_15_0][arg_15_1] = true
end

function slot_0_29_0(arg_16_0, arg_16_1)
	if slot_0_30_1[arg_16_0] and slot_0_30_1[arg_16_0][arg_16_1] == true then
		slot_0_30_1[arg_16_0][arg_16_1] = nil
	end

	events[arg_16_0]:unset(arg_16_1)
end

slot_0_30_0 = nil
slot_0_31_1 = {}

function slot_0_32_1(...)
	for iter_17_0, iter_17_1 in pairs(slot_0_31_1) do
		if iter_17_1 then
			iter_17_0(...)
		end
	end
end

function events.close_shot(arg_18_0, arg_18_1)
	if arg_18_1 then
		slot_0_31_1[arg_18_0] = nil
	else
		slot_0_31_1[arg_18_0] = true
	end
end

slot_0_33_1 = 0

function slot_0_34_5(arg_19_0)
	local var_19_0 = entity.get_local_player()
	local var_19_1 = entity.get(arg_19_0.userid, true)
	local var_19_2 = entity.get(arg_19_0.attacker, true)

	if var_19_0 == var_19_1 and var_19_0 ~= var_19_2 then
		slot_0_33_1 = globals.tickcount
	end
end

slot_0_35_5 = nil

function slot_0_36_9(arg_20_0)
	local var_20_0 = globals.tickcount

	if slot_0_35_5 == var_20_0 then
		return
	end

	local var_20_1 = entity.get_local_player()
	local var_20_2 = entity.get(arg_20_0.userid, true)

	if not var_20_1 or not var_20_1:is_alive() or not var_20_2 or var_20_2:is_dormant() or not var_20_2:is_enemy() then
		return
	end

	local var_20_3 = var_20_1:get_eye_position()
	local var_20_4 = var_20_2:get_eye_position()

	if not var_20_3 or not var_20_4 then
		return
	end

	local var_20_5 = vector(arg_20_0.x, arg_20_0.y, arg_20_0.z)
	local var_20_6 = var_20_3:closest_ray_point(var_20_4, var_20_5):dist(var_20_3)

	if var_20_6 < 60 then
		utils.execute_after(to_time(1), function()
			if var_20_0 - slot_0_33_1 ~= 0 then
				slot_0_32_1({
					distance = var_20_6,
					entity = var_20_2,
					impact = var_20_5
				})
			end
		end)

		slot_0_35_5 = globals.tickcount
	end
end

events.player_hurt(slot_0_34_5)
events.bullet_impact(slot_0_36_9)

slot_0_31_0 = nil

function slot_0_32_0(arg_22_0)
	return slot_0_10_0.sha256(string.format("%sua", arg_22_0))
end

slot_0_33_0 = nil
slot_0_34_4 = slot_0_25_0.home.about:switch("полотенчег")

slot_0_34_4:visibility(false)

function slot_0_35_4()
	slot_0_34_4:set(not slot_0_34_4:get())
end

slot_0_25_0.home.about:label("\v\f<user>     \rWhat's up"):depend(slot_0_27_0.home.overview)
slot_0_25_0.home.about:button(slot_0_20_0, nil, true):depend(slot_0_27_0.home.overview)
slot_0_25_0.home.about:label("\v\f<code>    \rVersion"):depend(slot_0_27_0.home.overview)
slot_0_25_0.home.about:button(slot_0_1_0, nil, true):depend(slot_0_27_0.home.overview)

slot_0_36_8 = false

function slot_0_37_8()
	return slot_0_36_8
end

slot_0_38_7 = slot_0_25_0.home.about:label(" \v\f<fire-flame-curved>     \rStreak"):depend(slot_0_27_0.home.overview, {
	slot_0_34_4,
	slot_0_37_8
})
slot_0_39_9 = slot_0_25_0.home.about:button("", nil, true):depend(slot_0_27_0.home.overview, {
	slot_0_34_4,
	slot_0_37_8
})

slot_0_39_9:tooltip("\v\f<circle-info>   \rYour streak loves daily attention!")

function slot_0_40_9(arg_25_0)
	local var_25_0, var_25_1 = pcall(json.parse, arg_25_0)

	if not var_25_0 or not var_25_1 or not var_25_1.streak then
		return print("Streak request failed. Response: ", arg_25_0)
	end

	slot_0_39_9:name(("%sx"):format(var_25_1.streak))

	slot_0_36_8 = true

	slot_0_35_4()
end

slot_0_41_10 = {
	cheat = "NL",
	script = slot_0_1_0,
	username = slot_0_20_0,
	timestamp = common.get_timestamp()
}
slot_0_41_10.signature = slot_0_14_0(slot_0_41_10, slot_0_5_0)

network.post(slot_0_3_0 .. "/streak/", slot_0_41_10, slot_0_6_0, slot_0_40_9)

slot_0_36_7 = false

function slot_0_37_7()
	return slot_0_36_7
end

slot_0_38_6 = slot_0_25_0.home.about:label("\v\f<tower-broadcast>    \rOnline"):depend(slot_0_27_0.home.overview, {
	slot_0_34_4,
	slot_0_37_7
})
slot_0_39_8 = slot_0_25_0.home.about:button("", nil, true):depend(slot_0_27_0.home.overview, {
	slot_0_34_4,
	slot_0_37_7
})
slot_0_40_8 = nil
slot_0_41_9 = nil
slot_0_42_7 = 0
slot_0_43_8 = false

function slot_0_44_7()
	local var_27_0 = utils.net_channel()

	if not var_27_0 or var_27_0.is_loopback then
		return
	end

	local var_27_1 = var_27_0:get_server_info()

	if not var_27_1 then
		return
	end

	return var_27_1.address
end

function slot_0_45_8()
	utils.execute_after(1, function()
		if not slot_0_41_9 then
			return
		end

		slot_0_41_9:send(slot_0_44_7() or "")
	end)
end

slot_0_46_8 = {
	open = function(arg_30_0)
		slot_0_42_7 = 0
		slot_0_41_9 = arg_30_0

		slot_0_45_8()
	end,
	message = function(arg_31_0, arg_31_1)
		local var_31_0, var_31_1 = pcall(json.parse, arg_31_1)

		if var_31_0 then
			slot_0_39_8:name(tostring(#var_31_1))

			slot_0_36_7 = true

			slot_0_35_4()

			slot_0_31_0 = var_31_1
		else
			slot_0_39_8:name("")

			slot_0_36_7 = false

			slot_0_35_4()
		end
	end,
	error = function(arg_32_0, arg_32_1)
		slot_0_41_9 = nil

		slot_0_40_8()
	end,
	close = function(arg_33_0, arg_33_1, arg_33_2, arg_33_3)
		slot_0_41_9 = nil

		slot_0_40_8()
	end
}

function slot_0_47_7()
	if slot_0_42_7 > 2 then
		return print("unable to reconnect after 3 attempts")
	end

	slot_0_42_7 = slot_0_42_7 + 1
	slot_0_43_8 = false

	local var_34_0 = slot_0_32_0(panorama.MyPersonaAPI.GetXuid())
	local var_34_1 = {
		cheat = "NL",
		secret = var_34_0,
		username = slot_0_20_0,
		build_name = slot_0_1_0,
		timestamp = common.get_unixtime()
	}

	var_34_1.signature = slot_0_14_0(var_34_1, slot_0_5_0)

	local function var_34_2(arg_35_0)
		local var_35_0, var_35_1 = pcall(json.parse, arg_35_0)

		if not var_35_0 or not var_35_1 or not var_35_1.key then
			return print("Failed to register websocket key. Response: ", arg_35_0)
		end

		slot_0_13_0.connect(slot_0_4_0 .. "/communication/" .. var_35_1.key, slot_0_46_8)
	end

	network.post(slot_0_3_0 .. "/communication/register-key", var_34_1, slot_0_6_0, var_34_2)
end

function slot_0_40_8()
	if slot_0_41_9 or slot_0_43_8 then
		return print("attempted futile reconnection stopped")
	end

	slot_0_43_8 = true

	utils.execute_after(5, slot_0_47_7)
end

slot_0_47_7()
events.level_init(slot_0_45_8)
events.round_start(slot_0_45_8)

slot_0_48_8 = false

events.render(function()
	local var_37_0 = globals.is_in_game

	if slot_0_48_8 ~= var_37_0 then
		if not var_37_0 then
			slot_0_45_8()
		end

		slot_0_48_8 = var_37_0
	end
end)

slot_0_36_6 = {
	"I wanna be your lover",
	"Too sexy for this world",
	"I love to watch you dance",
	"You were on top, I put you on top",
	"Oh, I choose you to fill your void",
	"But falling for you was my mistake",
	"Give it up, give up that threesome",
	"You're the one, you're the only one",
	"Tell me lies, ooh, girl, tell me lies",
	"I'm in love with both at the same time",
	"Goddamn, you look good in this lighting",
	"Say you're mine, I'm yours for the night",
	"Ooh, she mine, ooh, girl, bump and grind",
	"Call out my name when I kiss you so gently",
	"Woke up by a girl, I don't even know her name",
	"I said I didn't feel nothing, baby, but I lied",
	"But if you call me up, I'm fuckin' you on sight",
	"You try to fill the void with every man you meet",
	"Your face is like a melody - It won't leave my head",
	"That all the nights you slept alone, dryin' your eyes"
}
slot_0_37_6 = slot_0_25_0.home.lyrics:label(""):depend(slot_0_27_0.home.overview)

function slot_0_38_5(arg_38_0)
	if arg_38_0.value == 1 then
		local var_38_0 = math.random(1, #slot_0_36_6)
		local var_38_1 = slot_0_36_6[var_38_0] or ""

		slot_0_37_6:name(var_38_1)
	end
end

slot_0_26_0.home:set_callback(slot_0_38_5, true)

slot_0_36_5 = math.huge
slot_0_37_5 = false
slot_0_38_4 = false
slot_0_39_7 = {
	participate = slot_0_25_0.home.leaderboard:switch(" \v\f<play>     \rParticipate"):depend(slot_0_27_0.home.overview, {
		slot_0_34_4,
		function()
			return slot_0_38_4
		end
	})
}

slot_0_25_0.home.leaderboard:label("\v\f<circle-info>     \rWhat's that"):depend(slot_0_27_0.home.overview, slot_0_39_7.participate, {
	slot_0_34_4,
	function()
		return slot_0_38_4
	end
})
slot_0_25_0.home.leaderboard:button(" \v\f<arrow-up-right-from-square> ", function()
	slot_0_19_0("https://evalate.com/competition")
end, true):depend(slot_0_27_0.home.overview, slot_0_39_7.participate, {
	slot_0_34_4,
	function()
		return slot_0_38_4
	end
})
slot_0_25_0.home.leaderboard:label("\v\f<trophy>    \rLeaderboard"):depend(slot_0_27_0.home.overview, slot_0_39_7.participate, {
	slot_0_34_4,
	function()
		return slot_0_37_5 and slot_0_38_4
	end
})

slot_0_39_7.place = slot_0_25_0.home.leaderboard:button("", nil, true):depend(slot_0_27_0.home.overview, slot_0_39_7.participate, {
	slot_0_34_4,
	function()
		return slot_0_37_5 and slot_0_38_4
	end
})
slot_0_39_7.points = slot_0_25_0.home.leaderboard:button("", nil, true):depend(slot_0_27_0.home.overview, slot_0_39_7.participate, {
	slot_0_34_4,
	function()
		return slot_0_37_5 and slot_0_38_4
	end
})

function slot_0_40_7(arg_46_0, arg_46_1)
	slot_0_39_7.place:name(arg_46_0)
	slot_0_39_7.points:name(arg_46_1)

	slot_0_37_5 = true

	slot_0_35_4()
end

slot_0_41_8 = {
	username = slot_0_20_0,
	timestamp = common.get_unixtime()
}
slot_0_41_8.signature = slot_0_14_0(slot_0_41_8, slot_0_5_0)

function slot_0_42_6(arg_47_0)
	local var_47_0, var_47_1 = pcall(json.parse, arg_47_0)

	if not var_47_0 or not var_47_1 then
		return print("Failed to get leaderboard player. Response: ", arg_47_0)
	end

	if var_47_1.message == "Account not found." or var_47_1.username then
		slot_0_38_4 = true

		slot_0_35_4()
	end

	if var_47_1.username then
		if var_47_1.banned then
			slot_0_40_7("Banned", var_47_1.reason and var_47_1.reason or "?")
		else
			slot_0_40_7(string.format("%s place", var_47_1.place), string.format("%s points", var_47_1.points))

			slot_0_36_5 = var_47_1.place
		end
	end
end

network.post(slot_0_3_0 .. "/leaderboard/me", slot_0_41_8, slot_0_6_0, slot_0_42_6)

slot_0_41_7 = 0
slot_0_42_5 = 0
slot_0_43_7 = 0
slot_0_44_6 = {}
slot_0_45_7 = {}

function slot_0_46_7()
	slot_0_41_7 = 0
	slot_0_42_5 = 0
	slot_0_43_7 = 0
	slot_0_44_6 = {}
	slot_0_45_7 = {}
end

slot_0_47_6 = {}

function slot_0_48_7()
	local var_49_0 = utils.net_channel()

	if not var_49_0 or var_49_0.is_loopback then
		return
	end

	local var_49_1 = string.lower(panorama.GameStateAPI.GetServerName())

	local function var_49_2(arg_50_0)
		return string.find(var_49_1, arg_50_0) ~= nil
	end

	return var_49_2("hvh") or var_49_2("unmatched.gg")
end

function slot_0_49_7()
	local var_51_0 = entity.get_game_rules()

	return var_51_0 and var_51_0.m_bWarmupPeriod
end

function slot_0_50_8()
	return #entity.get_players(false, true)
end

function slot_0_51_9()
	return slot_0_48_7() and not slot_0_49_7() and slot_0_50_8() >= 8
end

function slot_0_52_9()
	local var_54_0 = entity.get_game_rules()

	if not var_54_0 then
		return
	end

	return var_54_0.m_totalRoundsPlayed, math.floor(globals.curtime - var_54_0.m_fRoundStartTime)
end

function slot_0_53_9(arg_55_0)
	local var_55_0 = arg_55_0.entity:get_xuid()

	if not arg_55_0.entity:is_bot() and slot_0_51_9() and not slot_0_45_7[var_55_0] then
		slot_0_42_5 = slot_0_42_5 + 1
		slot_0_45_7[var_55_0] = true
	end
end

function slot_0_54_10()
	local var_56_0 = utils.net_channel()

	if not var_56_0 or var_56_0.is_loopback then
		return
	end

	local var_56_1 = var_56_0:get_server_info()

	if not var_56_1 then
		return
	end

	return var_56_1.address
end

function slot_0_55_11(arg_57_0)
	local var_57_0 = entity.get_local_player()
	local var_57_1 = entity.get(arg_57_0.userid, true)
	local var_57_2 = entity.get(arg_57_0.attacker, true)
	local var_57_3 = var_57_1:get_xuid()

	if var_57_0 == var_57_2 and var_57_0 ~= var_57_1 and not var_57_1:is_bot() and slot_0_51_9() and not slot_0_44_6[var_57_3] then
		slot_0_41_7 = slot_0_41_7 + 1

		if arg_57_0.headshot then
			slot_0_43_7 = slot_0_43_7 + 1
		end

		slot_0_44_6[var_57_3] = true
	end
end

function slot_0_56_12()
	if slot_0_41_7 + slot_0_43_7 + slot_0_42_5 < 1 then
		return
	end

	local var_58_0 = slot_0_54_10()
	local var_58_1 = slot_0_50_8()
	local var_58_2, var_58_3 = slot_0_52_9()
	local var_58_4 = {
		cheat = "NL",
		script = slot_0_1_0,
		kills = slot_0_41_7,
		misses = slot_0_42_5,
		headshots = slot_0_43_7,
		server_ip = var_58_0,
		round = var_58_2,
		round_time = var_58_3,
		players_on_the_server = var_58_1,
		username = slot_0_20_0,
		timestamp = common.get_unixtime()
	}

	var_58_4.signature = slot_0_14_0(var_58_4, slot_0_5_0)

	local function var_58_5(arg_59_0)
		local var_59_0, var_59_1 = pcall(json.parse, arg_59_0)

		if not var_59_0 or not var_59_1 then
			return print("Failed to send leaderboard data. Response: ", arg_59_0)
		end

		if not var_59_1.points_got then
			return
		end

		local var_59_2 = slot_0_22_0.build("You got {points_got} points", nil, {
			points_got = var_59_1.points_got
		})

		local function var_59_3(arg_60_0, arg_60_1)
			return slot_0_22_0.center(arg_60_1, nil, arg_60_0.alpha, var_59_2)
		end

		slot_0_22_0.print(var_59_2)
		slot_0_22_0.screen(var_59_3)

		local var_59_4

		if var_59_1.place > slot_0_36_5 then
			var_59_4 = "▼ You moved down to {place} place"
		end

		if var_59_1.place < slot_0_36_5 then
			var_59_4 = "▲ You moved up to {place} place"
		end

		if var_59_4 then
			local var_59_5 = slot_0_22_0.build(var_59_4, nil, {
				place = var_59_1.place
			})

			local function var_59_6(arg_61_0, arg_61_1)
				return slot_0_22_0.center(arg_61_1, nil, arg_61_0.alpha, var_59_5)
			end

			slot_0_22_0.print(var_59_5)
			slot_0_22_0.screen(var_59_6)
		end

		slot_0_40_7(string.format("%s place", var_59_1.place), string.format("%s points", var_59_1.points))

		slot_0_36_5 = var_59_1.place
	end

	network.post(slot_0_3_0 .. "/leaderboard/data", var_58_4, slot_0_6_0, var_58_5)
	slot_0_46_7()
end

function slot_0_57_16(arg_62_0)
	events.close_shot(slot_0_53_9, not arg_62_0.value)
	events.round_start(slot_0_56_12, arg_62_0.value)
	events.player_death(slot_0_55_11, arg_62_0.value)
end

slot_0_39_7.participate:set_callback(slot_0_57_16, true)

function slot_0_34_3()
	slot_0_19_0("https://neverlose.cc/market/item?id=I7FKHv")
end

slot_0_25_0.home.discord:label("\v\f<trophy>    \rGreatest config for evalate"):depend(slot_0_27_0.home.overview)
slot_0_25_0.home.discord:button(" \v\f<arrow-up-right-from-square> ", slot_0_34_3, true):depend(slot_0_27_0.home.overview)
slot_0_25_0.home.discord:label("\v\f<discord>    \rJoin community"):depend(slot_0_27_0.home.overview)

slot_0_34_2 = slot_0_25_0.home.discord:button(" \v\f<arrow-up-right-from-square> ", nil, true):depend(slot_0_27_0.home.overview)

function slot_0_35_3()
	slot_0_19_0("https://discord.gg/VS4msFx6EE")
end

slot_0_34_2:set_callback(slot_0_35_3)

slot_0_34_1 = slot_0_25_0.home.discord:label("\v\f<user-tag>    \rUnlock channels"):depend(slot_0_27_0.home.overview)
slot_0_35_2 = slot_0_25_0.home.discord:button(" \v\f<key> ", nil, true):depend(slot_0_27_0.home.overview)
slot_0_36_4 = "\v\f<circle-info>   \rHow to get role on the server:\n\n1. Join discord server\n\n2. Get code using   \v\f<key>  \rbutton\n\n3. Paste your code in the \v#get-role \rchannel on the server"

slot_0_34_1:tooltip(slot_0_36_4)
slot_0_35_2:tooltip(slot_0_36_4)

function slot_0_37_4(arg_65_0)
	local var_65_0, var_65_1 = pcall(json.parse, arg_65_0)

	if not var_65_0 or not var_65_1 or not var_65_1.code then
		return print("Failed to get verification code: Response: ", arg_65_0)
	end

	slot_0_12_0.set(var_65_1.code)
	common.add_notify("Discord", "Code was successfully copied")
end

slot_0_35_2:set_callback(function()
	local var_66_0 = {
		cheat = "NL",
		username = slot_0_20_0,
		build_name = slot_0_1_0,
		timestamp = common.get_unixtime()
	}

	var_66_0.signature = slot_0_14_0(var_66_0, slot_0_5_0)

	network.post(slot_0_3_0 .. "/discord-verification/get-code", var_66_0, slot_0_6_0, slot_0_37_4)
end)

slot_0_34_0 = nil
slot_0_35_1 = "evalate_activity"
slot_0_36_3 = db[slot_0_35_1] or {
	total_time = 0,
	game = {
		total_kills = 0,
		misses_at_you = 0,
		headshots = 0
	}
}
slot_0_36_3.ragebot = slot_0_36_3.ragebot or {}
slot_0_36_3.ragebot.hit = slot_0_36_3.ragebot.hit or 0
slot_0_36_3.ragebot.miss = slot_0_36_3.ragebot.miss or 0
slot_0_37_3 = common.get_timestamp()

function slot_0_38_3()
	return common.get_timestamp() - slot_0_37_3
end

function slot_0_39_6(arg_68_0)
	local var_68_0 = math.floor(arg_68_0 / 1000)
	local var_68_1 = math.floor(var_68_0 / 60)
	local var_68_2 = var_68_1 / 60

	if math.floor(var_68_2) > 0 then
		return ("%.1fh"):format(var_68_2)
	end

	if var_68_1 > 0 then
		return var_68_1 .. "m"
	end

	return var_68_0 .. "s"
end

slot_0_40_6 = {}

function slot_0_41_6(arg_69_0, arg_69_1, arg_69_2)
	arg_69_0:label(arg_69_1):depend(slot_0_27_0.home.overview)

	local var_69_0 = arg_69_2()
	local var_69_1 = arg_69_0:button(string.format("%s", var_69_0), nil, true):depend(slot_0_27_0.home.overview)

	table.insert(slot_0_40_6, {
		name = arg_69_1,
		button = var_69_1,
		callback = arg_69_2,
		old = var_69_0
	})
end

function slot_0_42_4()
	if ui.get_alpha() > 0 then
		for iter_70_0, iter_70_1 in next, slot_0_40_6 do
			if iter_70_1.old ~= iter_70_1.callback() then
				iter_70_1.button:name(string.format("%s", iter_70_1.callback()))

				iter_70_1.old = iter_70_1.callback()
			end
		end
	end
end

function slot_0_43_6(arg_71_0)
	local var_71_0 = entity.get_local_player()
	local var_71_1 = entity.get(arg_71_0.userid, true)

	if entity.get(arg_71_0.attacker, true) == var_71_0 and var_71_1 ~= var_71_0 and not var_71_1:is_bot() then
		slot_0_36_3.game.total_kills = slot_0_36_3.game.total_kills + 1

		if arg_71_0.headshot then
			slot_0_36_3.game.headshots = slot_0_36_3.game.headshots + 1
		end
	end
end

function slot_0_44_5(arg_72_0)
	if not arg_72_0.entity:is_bot() then
		slot_0_36_3.game.misses_at_you = slot_0_36_3.game.misses_at_you + 1
	end
end

function slot_0_45_6()
	slot_0_36_3.total_time = slot_0_36_3.total_time + slot_0_38_3()
	db[slot_0_35_1] = slot_0_36_3
end

function slot_0_46_6(arg_74_0)
	if not arg_74_0.target:is_bot() then
		if arg_74_0.state then
			slot_0_36_3.ragebot.miss = slot_0_36_3.ragebot.miss + 1
		else
			slot_0_36_3.ragebot.hit = slot_0_36_3.ragebot.hit + 1
		end
	end
end

slot_0_41_6(slot_0_25_0.home.stats_one, "\v\f<clock>     \rTotal", function()
	return slot_0_39_6(slot_0_36_3.total_time + slot_0_38_3())
end)
slot_0_41_6(slot_0_25_0.home.stats_one, "\v\f<timer>     \rSession", function()
	return slot_0_39_6(slot_0_38_3())
end)
slot_0_41_6(slot_0_25_0.home.stats_two, "\v\f<skull>     \rHeadshots", function()
	local var_77_0 = slot_0_36_3.game.headshots / slot_0_36_3.game.total_kills

	return string.format("%s%%", var_77_0 > 0 and math.floor(100 * var_77_0) or 0)
end)
slot_0_41_6(slot_0_25_0.home.stats_two, "\v\f<user-slash>    \rEnemy killed", function()
	return slot_0_36_3.game.total_kills
end)
slot_0_41_6(slot_0_25_0.home.stats_two, "\v\f<user-xmark>    \rMisses at me", function()
	return slot_0_36_3.game.misses_at_you
end)
slot_0_41_6(slot_0_25_0.home.stats_three, "\v\f<user-check>    \rHit rate", function()
	local var_80_0 = slot_0_36_3.ragebot.hit / (slot_0_36_3.ragebot.hit + slot_0_36_3.ragebot.miss)
	local var_80_1 = var_80_0 > 0 and math.floor(100 * var_80_0) or 0

	return string.format("%s%%", var_80_1)
end)
slot_0_41_6(slot_0_25_0.home.stats_three, "\v\f<check>      \rShots hit", function()
	return slot_0_36_3.ragebot.hit
end)
slot_0_41_6(slot_0_25_0.home.stats_three, " \v\f<xmark>      \rShots missed", function()
	return slot_0_36_3.ragebot.miss
end)
events.aim_ack(slot_0_46_6)
events.render(slot_0_42_4)
events.shutdown(slot_0_45_6)
events.close_shot(slot_0_44_5)
events.player_death(slot_0_43_6)

slot_0_35_0 = {}
_menu = {}
_depend = {}
_menu.preset_information = {}
slot_0_36_2 = false
_menu.storage = slot_0_25_0.home.presets_setup:combo("\v\f<database>    \rStorage", {
	"\v\f<cloud>   \rCloud",
	"\v\f<desktop>    \rLocal"
}):depend(slot_0_27_0.home.presets)
_depend.storage = {
	cloud = {
		_menu.storage,
		_menu.storage:list()[1]
	},
	["local"] = {
		_menu.storage,
		_menu.storage:list()[2]
	}
}
_menu.settings = slot_0_25_0.home.presets_setup:label("\v\f<gear>   \rSettings", nil, function(arg_83_0)
	return {
		sort = arg_83_0:combo("\v\f<bars-sort>    \rSort", {
			"\v\f<floppy-disk>    \rLast Update",
			"\v\f<heart>   \rMost Liked",
			" \v\f<play>   \rMost Loaded"
		}),
		filter = arg_83_0:combo("\v\f<bars-filter>    \rFilter", {
			"\v\f<list>   \rNone",
			"\v\f<user>   \rMy",
			"\v\f<heart>   \rLiked"
		}),
		show_info = arg_83_0:switch("\v\f<bars>    \rShow Information", true)
	}
end)

_menu.settings:depend(slot_0_27_0.home.presets)
_menu.settings.sort:depend(_depend.storage.cloud)
_menu.settings.filter:depend(_depend.storage.cloud)

slot_0_37_2 = {
	slot_0_8_0.string("\v\f<spinner>   \rLoading...")
}
slot_0_38_2 = {
	slot_0_8_0.string("\v\f<face-frown-slight>    \rNo presets found")
}
_menu.local_actions = {}
_menu.local_actions.load = slot_0_25_0.home.local_presets:button("   \f<play>  ", nil, false, "Load"):depend(slot_0_27_0.home.presets, _depend.storage["local"])
_menu.local_actions.load_antiaims = slot_0_25_0.home.local_presets:button("  \f<shield>  ", nil, false, "Load only anti-aim's"):depend(slot_0_27_0.home.presets, _depend.storage["local"])
_menu.local_actions.copy = slot_0_25_0.home.local_presets:button("  \f<copy>  ", nil, true, "Copy to clipboard"):depend(slot_0_27_0.home.presets, _depend.storage["local"])
_menu.local_actions.save = slot_0_25_0.home.local_presets:button("  \f<floppy-disk>  ", nil, true, "Save"):depend(slot_0_27_0.home.presets, _depend.storage["local"])
_menu.local_actions.delete = slot_0_25_0.home.local_presets:button("  \a[red]\f<trash>  ", nil, true, "Delete"):depend(slot_0_27_0.home.presets, _depend.storage["local"])
_menu.local_presets = slot_0_25_0.home.local_presets:list("", slot_0_37_2):depend(slot_0_27_0.home.presets, _depend.storage["local"])
_menu.cloud_actions = {}
_menu.cloud_actions.load = slot_0_25_0.home.cloud_presets:button("   \f<play>  ", nil, false, "Load"):depend(slot_0_27_0.home.presets, _depend.storage.cloud)
_menu.cloud_actions.load_antiaims = slot_0_25_0.home.cloud_presets:button("  \f<shield>  ", nil, false, "Load only anti-aim's"):depend(slot_0_27_0.home.presets, _depend.storage.cloud)
_menu.cloud_actions.like = slot_0_25_0.home.cloud_presets:button("  \f<heart>  ", nil, true, "Like"):depend(slot_0_27_0.home.presets, _depend.storage.cloud)
_menu.cloud_actions.save = slot_0_25_0.home.cloud_presets:button("  \f<floppy-disk>  ", nil, true, "Save"):depend(slot_0_27_0.home.presets, _depend.storage.cloud)
_menu.cloud_actions.delete = slot_0_25_0.home.cloud_presets:button("  \a[red]\f<trash>  ", nil, true, "Delete"):depend(slot_0_27_0.home.presets, _depend.storage.cloud)
_menu.cloud_presets = slot_0_25_0.home.cloud_presets:list("", slot_0_37_2):depend(slot_0_27_0.home.presets, _depend.storage.cloud)

slot_0_25_0.home.preset_actions:label("\v\f<arrow-pointer>    \rActions"):depend(slot_0_27_0.home.presets, _depend.storage.cloud)

_menu.upload = slot_0_25_0.home.preset_actions:button(" \v\f<cloud-arrow-up>   \rUpload ", nil, true):depend(slot_0_27_0.home.presets, _depend.storage.cloud):disabled(slot_0_1_0 == slot_0_0_0.TRIAL)
_menu.actions_label = slot_0_25_0.home.preset_actions:label("\v\f<arrow-pointer>    \rActions "):depend(slot_0_27_0.home.presets, _depend.storage["local"])
_menu.create = slot_0_25_0.home.preset_actions:button(" \v\f<file>   \rCreate ", nil, true):depend(slot_0_27_0.home.presets, _depend.storage["local"])
_menu.import = slot_0_25_0.home.preset_actions:button(" \v\f<file-import>   \rImport ", nil, true):depend(slot_0_27_0.home.presets, _depend.storage["local"])
_menu.name = slot_0_25_0.home.preset_creation:input(""):depend(slot_0_27_0.home.presets, _depend.storage["local"], _menu.create)
_menu.create_final = slot_0_25_0.home.preset_creation:button("    \rCreate    "):depend(slot_0_27_0.home.presets, _depend.storage["local"], _menu.create)
_menu.create_cancel = slot_0_25_0.home.preset_creation:button("    \rCancel    ", nil, true):depend(slot_0_27_0.home.presets, _depend.storage["local"], _menu.create)

function slot_0_39_5(arg_84_0)
	_menu.name:visibility(arg_84_0)
	_menu.create_final:visibility(arg_84_0)
	_menu.create_cancel:visibility(arg_84_0)

	local var_84_0 = {
		_menu.storage,
		_menu.settings,
		_menu.local_presets,
		_menu.local_actions.load,
		_menu.local_actions.load_antiaims,
		_menu.local_actions.copy,
		_menu.local_actions.save,
		_menu.local_actions.delete,
		_menu.actions_label,
		_menu.create,
		_menu.import
	}

	for iter_84_0, iter_84_1 in next, var_84_0 do
		iter_84_1:visibility(not arg_84_0)
	end

	for iter_84_2, iter_84_3 in next, _menu.preset_information do
		iter_84_3.label:visibility(not arg_84_0)
		iter_84_3.button:visibility(not arg_84_0)
	end
end

function slot_0_40_5()
	slot_0_39_5(false)
end

function slot_0_41_5()
	slot_0_39_5(true)
end

_menu.create:set_callback(slot_0_41_5)
_menu.create_final:set_callback(slot_0_40_5)
_menu.create_cancel:set_callback(slot_0_40_5)

slot_0_39_4 = _menu.storage:list()

function slot_0_40_4()
	return _menu.storage.value == slot_0_39_4[1]
end

function slot_0_41_4()
	return _menu.storage.value == slot_0_39_4[2]
end

slot_0_42_3 = {}
slot_0_43_5 = {}

function slot_0_42_3.create(arg_89_0, arg_89_1, arg_89_2)
	assert(slot_0_43_5[arg_89_1] == nil, "same key already exist")

	local var_89_0 = slot_0_25_0.home.preset_information:label(arg_89_2)
	local var_89_1 = slot_0_25_0.home.preset_information:button("", nil, true)

	slot_0_43_5[arg_89_1] = {}
	_menu.preset_information[arg_89_1] = {
		label = var_89_0,
		button = var_89_1
	}

	local function var_89_2()
		return slot_0_43_5[arg_89_1] and slot_0_43_5[arg_89_1].value ~= nil
	end

	local var_89_3 = {
		slot_0_27_0.home.presets,
		_menu.settings.show_info,
		{
			_menu.storage,
			var_89_2
		},
		{
			_menu.cloud_presets,
			var_89_2
		},
		{
			_menu.local_presets,
			var_89_2
		}
	}

	var_89_0:depend(unpack(var_89_3))
	var_89_1:depend(unpack(var_89_3))
end

function slot_0_42_3.update(arg_91_0, arg_91_1, arg_91_2)
	assert(slot_0_43_5[arg_91_1] ~= nil, "key not found")

	slot_0_43_5[arg_91_1].value = arg_91_2

	_menu.preset_information[arg_91_1].button:name(arg_91_2 == nil and "" or tostring(arg_91_2))

	if slot_0_41_4() then
		_menu.local_presets:set(_menu.local_presets.value)
	end

	if slot_0_40_4() then
		_menu.cloud_presets:set(_menu.cloud_presets.value)
	end
end

slot_0_42_3:create("likes", "\v\f<heart>    \rLikes")
slot_0_42_3:create("loads", " \v\f<play>    \rLoads")
slot_0_42_3:create("author", "\v\f<user>    \rAuthor")
slot_0_42_3:create("script", "\v\f<brackets-curly>   \rScript")
slot_0_42_3:create("relevance", "\v\f<code-branch>    \rRelevance")
slot_0_42_3:create("last_update", "\v\f<floppy-disk>    \rLast Update")

function slot_0_43_4()
	local var_92_0, var_92_1 = pcall(function()
		return slot_0_9_0.encode(json.stringify(slot_0_35_0.package:save()))
	end)

	return var_92_1
end

function slot_0_44_4(arg_94_0)
	local var_94_0 = pcall(function()
		slot_0_12_0.set(("evalate>%s<"):format(slot_0_9_0.encode(json.stringify(arg_94_0))))
	end)

	common.add_notify("Presets", var_94_0 and "Preset successfully copied." or "Failed to copy preset.")
end

slot_0_45_5 = {}
slot_0_46_5 = {}
slot_0_47_5 = {}

function slot_0_48_6()
	local var_96_0 = _menu.cloud_presets:get()

	return slot_0_47_5[var_96_0], var_96_0
end

function slot_0_49_6()
	local var_97_0 = slot_0_48_6() or {}

	slot_0_42_3:update("author", var_97_0.username)
	slot_0_42_3:update("script", var_97_0.build_name)
	slot_0_42_3:update("likes", var_97_0.likes)
	slot_0_42_3:update("loads", var_97_0.loads)
	slot_0_42_3:update("last_update", var_97_0.last_updated_at and common.get_date("%d.%m.%y %H:%M", var_97_0.last_updated_at) or nil)
	slot_0_42_3:update("relevance", var_97_0.build_version and slot_0_8_0.string(var_97_0.build_version == slot_0_2_0 and " \a[green]\f<check>  \rUpdated " or " \a[red]\f<xmark>  \rOutdated ") or nil)
end

slot_0_49_6()
_menu.storage:set_callback(slot_0_49_6)
_menu.cloud_presets:set_callback(slot_0_49_6)

function slot_0_50_7()
	local var_98_0, var_98_1 = slot_0_48_6()
	local var_98_2 = var_98_0 and var_98_0.username == slot_0_20_0

	_menu.cloud_actions.like:disabled(var_98_0 == nil)
	_menu.cloud_actions.load:disabled(var_98_0 == nil)
	_menu.cloud_actions.load_antiaims:disabled(var_98_0 == nil)
	_menu.cloud_actions.save:disabled(var_98_0 == nil or not var_98_2)
	_menu.cloud_actions.delete:disabled(var_98_0 == nil or not var_98_2)
	_menu.cloud_actions.like:name(var_98_0 and var_98_0.liked and " ❤️ " or "  \f<heart>  ")
end

_menu.cloud_presets:set_callback(slot_0_50_7)

function slot_0_51_8()
	local var_99_0 = {}

	for iter_99_0, iter_99_1 in next, slot_0_47_5 do
		var_99_0[#var_99_0 + 1] = iter_99_1.username
	end

	_menu.cloud_presets:update(#var_99_0 > 0 and var_99_0 or slot_0_38_2)
end

function slot_0_52_8(arg_100_0)
	slot_0_47_5 = arg_100_0 or {}

	slot_0_51_8()
	slot_0_50_7()
	slot_0_49_6()
end

function slot_0_53_8(arg_101_0)
	local var_101_0 = arg_101_0
	local var_101_1 = _menu.settings.filter:list()
	local var_101_2 = _menu.settings.filter:get()

	if var_101_2 ~= var_101_1[1] then
		local var_101_3 = {}

		for iter_101_0, iter_101_1 in next, var_101_0 do
			if var_101_2 == var_101_1[2] and iter_101_1.username == slot_0_20_0 then
				var_101_3[#var_101_3 + 1] = iter_101_1
			end

			if var_101_2 == var_101_1[3] and iter_101_1.liked then
				var_101_3[#var_101_3 + 1] = iter_101_1
			end
		end

		var_101_0 = var_101_3
	end

	local var_101_4 = _menu.settings.sort:list()
	local var_101_5 = _menu.settings.sort:get()

	if var_101_5 == var_101_4[1] then
		table.sort(var_101_0, function(arg_102_0, arg_102_1)
			return arg_102_0.last_updated_at > arg_102_1.last_updated_at
		end)
	end

	if var_101_5 == var_101_4[2] then
		table.sort(var_101_0, function(arg_103_0, arg_103_1)
			return arg_103_0.likes > arg_103_1.likes
		end)
	end

	if var_101_5 == var_101_4[3] then
		table.sort(var_101_0, function(arg_104_0, arg_104_1)
			return arg_104_0.loads > arg_104_1.loads
		end)
	end

	return var_101_0
end

function slot_0_54_9()
	slot_0_52_8(slot_0_53_8(slot_0_46_5))
end

_menu.settings.sort:set_callback(slot_0_54_9)
_menu.settings.filter:set_callback(slot_0_54_9)

function slot_0_55_10()
	if slot_0_41_4() then
		return
	end

	slot_0_52_8({})
	_menu.cloud_presets:update(slot_0_37_2)

	local var_106_0 = {
		username = slot_0_20_0,
		timestamp = common.get_timestamp()
	}

	var_106_0.signature = slot_0_14_0(var_106_0, slot_0_5_0)

	network.post(slot_0_3_0 .. "/presets-recode/get", var_106_0, slot_0_6_0, function(arg_107_0)
		local var_107_0, var_107_1 = pcall(json.parse, arg_107_0)

		if not var_107_0 or not var_107_1 then
			return print("Failed to fetch presets. Response: ", arg_107_0)
		end

		slot_0_46_5 = var_107_1

		slot_0_52_8(slot_0_53_8(var_107_1))
	end)
end

_menu.storage:set_callback(slot_0_55_10, true)

function slot_0_56_11(arg_108_0)
	local var_108_0 = slot_0_48_6()

	if not var_108_0 then
		return common.add_notify("Presets", "Preset not found.")
	end

	local function var_108_1(arg_109_0)
		local var_109_0, var_109_1 = pcall(json.parse, arg_109_0)

		if not var_109_0 or not var_109_1 or not var_109_1.status then
			if var_109_1.message then
				common.add_notify("Presets", var_109_1.message)
			else
				return print("Request failed. Response: ", arg_109_0)
			end
		end

		local var_109_2 = pcall(function()
			return slot_0_35_0.package:load(json.parse(slot_0_9_0.decode(var_109_1.data)), arg_108_0 and "antiaim" or nil)
		end)

		if arg_108_0 then
			common.add_notify("Presets", var_109_2 and "Anti-aim's successfully loaded from preset." or "Failed to load anti-aim's from preset.")
		else
			common.add_notify("Presets", var_109_2 and "Preset successfully loaded." or "Failed to load preset.")
		end
	end

	local var_108_2 = {
		username = slot_0_20_0,
		preset_author = var_108_0.username,
		timestamp = common.get_timestamp()
	}

	var_108_2.signature = slot_0_14_0(var_108_2, slot_0_5_0)

	network.post(slot_0_3_0 .. "/presets-recode/load", var_108_2, slot_0_6_0, var_108_1)
end

_menu.cloud_actions.load:set_callback(function()
	slot_0_56_11()
end)
_menu.cloud_actions.load_antiaims:set_callback(function()
	slot_0_56_11(true)
end)

function slot_0_57_15()
	local var_113_0 = {
		data = slot_0_43_4(),
		username = slot_0_20_0,
		build_name = slot_0_1_0,
		build_version = slot_0_2_0,
		timestamp = common.get_timestamp()
	}

	var_113_0.signature = slot_0_14_0(var_113_0, slot_0_5_0)

	network.post(slot_0_3_0 .. "/presets-recode/create", var_113_0, slot_0_6_0, function(arg_114_0)
		local var_114_0, var_114_1 = pcall(json.parse, arg_114_0)

		if (not var_114_0 or not var_114_1 or not var_114_1.status) and not var_114_1.message then
			return print("Request failed. Response: ", raw)
		end

		if var_114_1.status then
			slot_0_55_10()
		end

		pcall(function()
			common.add_notify("Presets", tostring(var_114_1.message))
		end)
	end)
end

_menu.upload:set_callback(slot_0_57_15)

function slot_0_58_16()
	local var_116_0 = {
		username = slot_0_20_0,
		timestamp = common.get_timestamp()
	}

	var_116_0.signature = slot_0_14_0(var_116_0, slot_0_5_0)

	network.post(slot_0_3_0 .. "/presets-recode/delete", var_116_0, slot_0_6_0, function(arg_117_0)
		local var_117_0, var_117_1 = pcall(json.parse, arg_117_0)

		if (not var_117_0 or not var_117_1 or not var_117_1.status) and not var_117_1.message then
			return print("Request failed. Response: ", raw)
		end

		slot_0_55_10()
		pcall(function()
			common.add_notify("Presets", tostring(var_117_1.message))
		end)
	end)
end

_menu.cloud_actions.delete:set_callback(slot_0_58_16)

function slot_0_59_12()
	local var_119_0 = {
		data = slot_0_43_4(),
		username = slot_0_20_0,
		build_name = slot_0_1_0,
		build_version = slot_0_2_0,
		timestamp = common.get_timestamp()
	}

	var_119_0.signature = slot_0_14_0(var_119_0, slot_0_5_0)

	network.post(slot_0_3_0 .. "/presets-recode/update", var_119_0, slot_0_6_0, function(arg_120_0)
		local var_120_0, var_120_1 = pcall(json.parse, arg_120_0)

		if (not var_120_0 or not var_120_1 or not var_120_1.status) and not var_120_1.message then
			return print("Request failed. Response: ", raw)
		end

		slot_0_55_10()
		pcall(function()
			common.add_notify("Presets", tostring(var_120_1.message))
		end)
	end)
end

_menu.cloud_actions.save:set_callback(slot_0_59_12)

function slot_0_60_8()
	local var_122_0 = slot_0_48_6()

	if not var_122_0 then
		return
	end

	local var_122_1 = {
		username = slot_0_20_0,
		preset_author = var_122_0.username,
		timestamp = common.get_timestamp()
	}

	var_122_1.signature = slot_0_14_0(var_122_1, slot_0_5_0)

	network.post(slot_0_3_0 .. "/presets-recode/like", var_122_1, slot_0_6_0, function(arg_123_0)
		local var_123_0, var_123_1 = pcall(json.parse, arg_123_0)

		if (not var_123_0 or not var_123_1 or not var_123_1.status) and not var_123_1.message then
			return print("Request failed. Response: ", raw)
		end

		slot_0_55_10()
		pcall(function()
			common.add_notify("Presets", tostring(var_123_1.message))
		end)
	end)
end

_menu.cloud_actions.like:set_callback(slot_0_60_8)

slot_0_46_4 = {}
slot_0_47_4 = "evalate_presets_19082378980123"
slot_0_48_5 = {}

function slot_0_49_5()
	return db[slot_0_47_4] or {}
end

function slot_0_50_6(arg_126_0)
	db[slot_0_47_4] = arg_126_0
end

function slot_0_51_7()
	local var_127_0 = _menu.local_presets:get()

	return slot_0_48_5[var_127_0], var_127_0
end

function slot_0_52_7()
	local var_128_0 = slot_0_51_7() or {}

	slot_0_42_3:update("author", var_128_0.username)
	slot_0_42_3:update("script", var_128_0.build_name)
	slot_0_42_3:update("likes")
	slot_0_42_3:update("loads")
	slot_0_42_3:update("last_update", var_128_0.last_updated_at and common.get_date("%d.%m.%y %H:%M", var_128_0.last_updated_at) or nil)
	slot_0_42_3:update("relevance", var_128_0.build_version and slot_0_8_0.string(var_128_0.build_version == slot_0_2_0 and " \a[green]\f<check>  \rUpdated " or " \a[red]\f<xmark>  \rOutdated ") or nil)
end

_menu.local_presets:set_callback(slot_0_52_7, true)

function slot_0_53_7()
	local var_129_0 = slot_0_51_7()

	_menu.local_actions.copy:disabled(var_129_0 == nil)
	_menu.local_actions.load:disabled(var_129_0 == nil)
	_menu.local_actions.load_antiaims:disabled(var_129_0 == nil)
	_menu.local_actions.save:disabled(var_129_0 == nil)
	_menu.local_actions.delete:disabled(var_129_0 == nil)
end

_menu.local_presets:set_callback(slot_0_53_7)

function slot_0_54_8()
	local var_130_0 = {}

	for iter_130_0, iter_130_1 in next, slot_0_48_5 do
		var_130_0[#var_130_0 + 1] = iter_130_1.name
	end

	_menu.local_presets:update(#var_130_0 > 0 and var_130_0 or slot_0_38_2)
end

function slot_0_55_9(arg_131_0)
	slot_0_48_5 = arg_131_0 or {}

	slot_0_54_8()
	slot_0_53_7()
	slot_0_52_7()
end

function slot_0_56_10()
	if slot_0_40_4() then
		return
	end

	slot_0_55_9(slot_0_49_5())
end

_menu.storage:set_callback(slot_0_56_10, true)

function slot_0_57_14()
	local var_133_0 = pcall(function()
		local var_134_0 = slot_0_49_5()
		local var_134_1 = #_menu.name.value > 0 and _menu.name.value or string.format("Preset %s", #var_134_0 + 1)
		local var_134_2 = {
			name = var_134_1,
			data = slot_0_35_0.package:save(),
			last_updated_at = common.get_unixtime(),
			username = slot_0_20_0,
			build_name = slot_0_1_0,
			build_version = slot_0_2_0
		}

		table.insert(var_134_0, 1, var_134_2)
		slot_0_50_6(var_134_0)
		slot_0_55_9(slot_0_49_5())
		_menu.name:set("")
	end)

	common.add_notify("Presets", var_133_0 and "Preset successfully created." or "Failed to create preset.")
end

_menu.create_final:set_callback(slot_0_57_14)

function slot_0_58_15()
	local var_135_0, var_135_1 = slot_0_51_7()

	if not slot_0_48_5[var_135_1] then
		return common.add_notify("Presets", "Preset not found.")
	end

	local var_135_2 = pcall(function()
		slot_0_48_5[var_135_1].data = slot_0_35_0.package:save()
		slot_0_48_5[var_135_1].last_updated_at = common.get_unixtime()

		slot_0_50_6(slot_0_48_5)
		slot_0_55_9(slot_0_48_5)
	end)

	common.add_notify("Presets", var_135_2 and "Preset successfully saved." or "Failed to save preset.")
end

_menu.local_actions.save:set_callback(slot_0_58_15)

function slot_0_59_11()
	local var_137_0 = pcall(function()
		local var_138_0, var_138_1 = slot_0_51_7()

		table.remove(slot_0_48_5, var_138_1)
		slot_0_50_6(slot_0_48_5)
		slot_0_55_9(slot_0_49_5())
	end)

	common.add_notify("Presets", var_137_0 and "Preset successfully deleted." or "Failed to delete preset.")
end

_menu.local_actions.delete:set_callback(slot_0_59_11)

function slot_0_60_7()
	local var_139_0 = slot_0_51_7()

	if not var_139_0 then
		return common.add_notify("Presets", "Preset not found.")
	end

	local var_139_1 = pcall(function()
		slot_0_12_0.set(("evalate>%s<"):format(slot_0_9_0.encode(json.stringify(var_139_0))))
	end)

	common.add_notify("Presets", var_139_1 and "Preset successfully copied." or "Failed to copy preset.")
end

_menu.local_actions.copy:set_callback(slot_0_60_7)

function slot_0_61_7()
	local var_141_0 = pcall(function()
		local var_142_0 = json.parse(slot_0_9_0.decode(slot_0_12_0.get():match("evalate>(.-)<")))
		local var_142_1 = slot_0_49_5()

		table.insert(var_142_1, 1, var_142_0)
		slot_0_50_6(var_142_1)
		slot_0_55_9(slot_0_49_5())
	end)

	common.add_notify("Presets", var_141_0 and "Preset successfully imported." or "Failed to import preset.")
end

_menu.import:set_callback(slot_0_61_7)

function slot_0_62_8()
	local var_143_0 = slot_0_51_7()

	if not var_143_0 then
		return common.add_notify("Presets", "Preset not found.")
	end

	local var_143_1 = pcall(function()
		return slot_0_35_0.package:load(var_143_0.data)
	end)

	common.add_notify("Presets", var_143_1 and "Preset successfully loaded." or "Failed to load preset.")
end

_menu.local_actions.load:set_callback(slot_0_62_8)

function slot_0_63_7()
	local var_145_0 = slot_0_51_7()

	if not var_145_0 then
		return common.add_notify("Presets", "Preset not found.")
	end

	local var_145_1 = pcall(function()
		return slot_0_35_0.package:load(var_145_0.data, "antiaim")
	end)

	common.add_notify("Presets", var_145_1 and "Anti-aim's from preset successfully loaded." or "Failed to anti-aim's from preset.")
end

_menu.local_actions.load_antiaims:set_callback(slot_0_63_7)

slot_0_36_1 = nil

function slot_0_37_1(arg_147_0, arg_147_1, arg_147_2)
	local var_147_0 = 3 * arg_147_0
	local var_147_1 = 3 * (arg_147_1 - arg_147_0) - var_147_0

	return (((1 - var_147_0 - var_147_1) * arg_147_2 + var_147_1) * arg_147_2 + var_147_0) * arg_147_2
end

function slot_0_38_1(arg_148_0, arg_148_1, arg_148_2)
	local var_148_0 = 3 * arg_148_0
	local var_148_1 = 3 * (arg_148_1 - arg_148_0) - var_148_0

	return (3 * (1 - var_148_0 - var_148_1) * arg_148_2 + 2 * var_148_1) * arg_148_2 + var_148_0
end

function slot_0_39_3(arg_149_0, arg_149_1, arg_149_2, arg_149_3)
	return function(arg_150_0)
		local var_150_0 = arg_150_0
		local var_150_1 = arg_150_0

		for iter_150_0 = 1, 5 do
			local var_150_2 = slot_0_37_1(arg_149_0, arg_149_2, var_150_1) - var_150_0
			local var_150_3 = slot_0_38_1(arg_149_0, arg_149_2, var_150_1)

			if math.abs(var_150_2) < 1e-05 or math.abs(var_150_3) < 1e-05 then
				break
			end

			var_150_1 = var_150_1 - var_150_2 / var_150_3
		end

		return slot_0_37_1(arg_149_1, arg_149_3, var_150_1)
	end
end

function slot_0_40_3(arg_151_0)
	return arg_151_0
end

function slot_0_41_3(arg_152_0, arg_152_1, arg_152_2)
	if type(arg_152_0) == "number" and type(arg_152_1) == "number" then
		return arg_152_0 + (arg_152_1 - arg_152_0) * arg_152_2
	end

	if type(arg_152_0) == "userdata" and arg_152_0.__name and (arg_152_0.__name == "sol.Vector" or arg_152_0.__name == "sol.ImColor") and type(arg_152_1) == "userdata" and arg_152_1.__name and (arg_152_1.__name == "sol.Vector" or arg_152_1.__name == "sol.ImColor") then
		return arg_152_0:lerp(arg_152_1, arg_152_2)
	end

	error("Unsupported types for lerp: " .. type(arg_152_0))
end

function __call(arg_153_0, arg_153_1, arg_153_2, arg_153_3)
	local var_153_0 = arg_153_2 or 0.25
	local var_153_1 = arg_153_3 or arg_153_0.default
	local var_153_2 = arg_153_1 or 0
	local var_153_3 = {
		time = 0,
		active = false,
		from = var_153_2,
		to = var_153_2,
		value = var_153_2
	}

	return function(arg_154_0)
		if type(arg_154_0) == "boolean" then
			arg_154_0 = arg_154_0 and 1 or 0
		end

		if arg_154_0 ~= nil and arg_154_0 ~= var_153_3.to then
			var_153_3.from = var_153_3.value
			var_153_3.to = arg_154_0
			var_153_3.time = 0
			var_153_3.active = true
		end

		if var_153_3.active then
			var_153_3.time = math.min(var_153_3.time + globals.frametime, var_153_0)

			local var_154_0 = var_153_3.time / var_153_0

			var_153_3.value = slot_0_41_3(var_153_3.from, var_153_3.to, var_153_1(var_154_0))

			if var_154_0 >= 1 then
				var_153_3.active = false
			end
		end

		return var_153_3.value
	end
end

slot_0_36_0 = setmetatable({
	linear = slot_0_40_3,
	ease_in = slot_0_39_3(0.42, 0, 1, 1),
	ease_out = slot_0_39_3(0, 0, 0.58, 1),
	ease_in_out = slot_0_39_3(0.42, 0, 0.58, 1),
	bezier_easing = slot_0_39_3,
	default = slot_0_39_3(0.34, 1.6, 0.64, 1)
}, {
	__call = __call
})

function slot_0_37_0(arg_155_0)
	local var_155_0, var_155_1 = pcall(function()
		return arg_155_0[0]
	end)

	return var_155_0 and var_155_1 ~= nil
end

slot_0_38_0 = {}
slot_0_39_2 = slot_0_36_0()
slot_0_38_0.players = {}
slot_0_40_2 = 0

function slot_0_41_2()
	local var_157_0 = slot_0_38_0.me
	local var_157_1 = slot_0_38_0.eye
	local var_157_2 = slot_0_38_0.threat
	local var_157_3 = slot_0_38_0.velocity
	local var_157_4 = slot_0_38_0.camera_angles
	local var_157_5 = globals.tickcount

	if var_157_5 < slot_0_40_2 + 20 then
		return
	end

	if not var_157_0 or not var_157_1 or not var_157_2 or not var_157_3 or var_157_3 < 2 or not var_157_4 or var_157_2:is_visible() then
		slot_0_38_0.on_peek = false
		slot_0_38_0.peek_yaw = nil

		return
	end

	local var_157_6 = var_157_0:simulate_movement()

	var_157_6:think(13)

	local var_157_7 = var_157_2:get_hitbox_position(6)
	local var_157_8, var_157_9 = utils.trace_bullet(var_157_0, vector(var_157_6.origin.x, var_157_6.origin.y, var_157_1.z), var_157_7, function(arg_158_0)
		return arg_158_0:is_player() and arg_158_0:is_enemy()
	end)

	if var_157_8 > 0 and var_157_9.entity == var_157_2 then
		local var_157_10 = (var_157_9.start_pos - var_157_1):angles().y - var_157_4.y + 180

		slot_0_38_0.on_peek = true
		slot_0_38_0.peek_yaw = var_157_10
		slot_0_40_2 = var_157_5
	else
		slot_0_38_0.on_peek = false
		slot_0_38_0.peek_yaw = nil
	end
end

function slot_0_42_2()
	slot_0_38_0.threat = entity.get_threat()
	slot_0_38_0.me = entity.get_local_player()
	slot_0_38_0.is_alive = slot_0_38_0.me and slot_0_38_0.me:is_alive()
	slot_0_38_0.origin = slot_0_38_0.me and slot_0_38_0.me:get_origin()
	slot_0_38_0.eye = slot_0_38_0.me and slot_0_38_0.me:get_eye_position()
	slot_0_38_0.weapon = slot_0_38_0.me and slot_0_38_0.me:get_player_weapon()
	slot_0_38_0.weapons = slot_0_38_0.me and slot_0_38_0.me:get_player_weapon(true)
	slot_0_38_0.weapon_info = slot_0_38_0.weapon and slot_0_38_0.weapon:get_weapon_info()
	slot_0_38_0.anim_state = slot_0_38_0.me and slot_0_38_0.me:get_anim_state()
	slot_0_38_0.velocity = slot_0_38_0.anim_state and slot_0_38_0.anim_state.velocity:length()
	slot_0_38_0.is_scoped = slot_0_38_0.me and slot_0_38_0.me.m_bIsScoped
	slot_0_38_0.players = {}

	for iter_159_0, iter_159_1 in ipairs(entity.get_players()) do
		slot_0_38_0.players[#slot_0_38_0.players + 1] = {
			entity = iter_159_1,
			is_enemy = iter_159_1:is_enemy(),
			is_alive = iter_159_1:is_alive(),
			is_dormant = iter_159_1:is_dormant()
		}
	end

	slot_0_38_0.game_rules = entity.get_game_rules()
	slot_0_38_0.is_warmup = slot_0_38_0.game_rules and slot_0_38_0.game_rules.m_bWarmupPeriod
	slot_0_38_0.exploit_charge = rage.exploit:get()

	slot_0_41_2()
end

function slot_0_43_3()
	slot_0_38_0.binds = ui.get_binds()
	slot_0_38_0.ui_size = ui.get_size()
	slot_0_38_0.ui_alpha = ui.get_alpha()
	slot_0_38_0.ui_position = ui.get_position()
	slot_0_38_0.mouse_position = ui.get_mouse_position()
	slot_0_38_0.camera_angles = render.camera_angles()
	slot_0_38_0.is_min_damage = slot_0_24_0:is_min_damage()
	slot_0_38_0.is_double_tap = slot_0_24_0.double_tap:get()
	slot_0_38_0.is_hide_shots = slot_0_24_0.hide_shots:get()
	slot_0_38_0.is_slow_walk = slot_0_24_0.slow_walk:get()
	slot_0_38_0.realtime = globals.realtime
	slot_0_38_0.absoluteframetime = globals.absoluteframetime
	slot_0_38_0.anim_scoped = slot_0_39_2(slot_0_38_0.is_scoped)
	slot_0_38_0.pulse = math.abs(slot_0_38_0.realtime * 1.5 % 2 - 1)
end

slot_0_44_3 = 0

function slot_0_45_4()
	slot_0_38_0.net_channel = utils.net_channel()

	if slot_0_38_0.net_channel then
		slot_0_38_0.server_info = slot_0_38_0.net_channel:get_server_info()
	end

	local var_161_0 = entity.get_local_player()

	if var_161_0 then
		local var_161_1 = var_161_0.m_nTickBase

		if math.abs(var_161_1 - slot_0_44_3) > 64 then
			slot_0_44_3 = 0
		end

		slot_0_38_0.defensive_ticks_left = 0

		if var_161_1 > slot_0_44_3 then
			slot_0_44_3 = var_161_1
		elseif var_161_1 < slot_0_44_3 then
			slot_0_38_0.defensive_ticks_left = math.min(14, math.max(0, slot_0_44_3 - var_161_1 - 1))
		end

		slot_0_38_0.is_defensive = slot_0_38_0.defensive_ticks_left > 0
	end
end

slot_0_43_3()
slot_0_45_4()
slot_0_42_2()
events.render(slot_0_43_3)
events.createmove(slot_0_45_4)
events.pre_render(slot_0_42_2)
events.createmove(slot_0_42_2)
events.level_init(slot_0_42_2)

slot_0_39_1 = nil
slot_0_40_1 = slot_0_8_0.accent:clone()
slot_0_41_1 = {
	Static = {
		slot_0_40_1
	},
	Rainbow = {
		slot_0_40_1
	}
}
slot_0_42_1 = slot_0_25_0.features.settings:switch("\v\f<paintbrush>   \rAccent color", false, "Enable to use custom color", slot_0_41_1)

slot_0_42_1.color:depend(slot_0_42_1)
slot_0_23_0.new("accent", slot_0_42_1, slot_0_27_0.features.visual)

function slot_0_43_2()
	local var_162_0, var_162_1 = slot_0_42_1.color:get()

	if var_162_0 == "Rainbow" then
		local var_162_2, var_162_3, var_162_4 = var_162_1:to_hsv()
		local var_162_5 = color():as_hsv(slot_0_38_0.realtime % 3 / 3, var_162_3, var_162_4, var_162_1.a / 255)

		slot_0_42_1.color:set("Rainbow", {
			var_162_5
		})
	end
end

slot_0_44_2 = slot_0_40_1

function slot_0_45_3()
	local var_163_0, var_163_1 = slot_0_42_1.color:get()

	slot_0_44_2 = slot_0_42_1:get() and var_163_1:clone() or slot_0_8_0.accent:clone()
end

function slot_0_39_0()
	return slot_0_44_2:clone()
end

function slot_0_46_3()
	slot_0_8_0.colors.accent = slot_0_39_0()
end

events.render(function()
	slot_0_45_3()
	slot_0_46_3()
	slot_0_43_2()
end)

slot_0_40_0 = 1
slot_0_41_0 = ""
slot_0_42_0 = {}
slot_0_42_0.blur = true
slot_0_42_0.shadow = true
slot_0_42_0.blur_alpha = 1
slot_0_42_0.shadow_alpha = 1
slot_0_43_1 = slot_0_25_0.features.settings:label("\v\f<bars>    \rSettings", nil, function(arg_167_0)
	return {
		dpi = arg_167_0:switch("\v\f<font>   \rScaling"),
		blur = arg_167_0:switch("\v\f<droplet>    \rBlur", true),
		shadow = arg_167_0:switch("\v\f<brightness>   \rGlow", true)
	}
end)

slot_0_43_1:depend(slot_0_27_0.features.visual)
slot_0_43_1.blur:tooltip("\v\f<circle-info>   \rProblems with FPS? Turn it off!")
slot_0_43_1.shadow:tooltip("\v\f<circle-info>   \rProblems with FPS? Turn it off!")
slot_0_43_1.blur:set_callback(function()
	slot_0_42_0.blur = slot_0_43_1.blur.value
end, true)
slot_0_43_1.shadow:set_callback(function()
	slot_0_42_0.shadow = slot_0_43_1.shadow.value
end, true)

slot_0_44_1 = slot_0_36_0(slot_0_42_0.blur_alpha, nil, slot_0_36_0.ease_in_out)
slot_0_45_2 = slot_0_36_0(slot_0_42_0.shadow_alpha, nil, slot_0_36_0.ease_in_out)

events.render(function()
	slot_0_40_0 = slot_0_43_1.dpi.value and render.get_scale(2) or 1
	slot_0_41_0 = slot_0_43_1.dpi.value and "s" or ""
	slot_0_42_0.blur_alpha = slot_0_44_1(slot_0_43_1.blur.value)
	slot_0_42_0.shadow_alpha = slot_0_45_2(slot_0_43_1.shadow.value)
end)

slot_0_46_2 = render.text

function render.text(arg_171_0, arg_171_1, arg_171_2, arg_171_3, ...)
	slot_0_46_2(arg_171_0, arg_171_1, arg_171_2, arg_171_3 and arg_171_3 .. slot_0_41_0 or slot_0_41_0, ...)
end

slot_0_47_3 = render.blur

function render.blur(arg_172_0, arg_172_1, arg_172_2, arg_172_3, ...)
	if not slot_0_42_0.blur and not (slot_0_42_0.blur_alpha > 0) then
		return
	end

	slot_0_47_3(arg_172_0, arg_172_1, arg_172_2, arg_172_3 * slot_0_42_0.blur_alpha, ...)
end

slot_0_48_4 = render.shadow

function render.shadow(arg_173_0, arg_173_1, arg_173_2, arg_173_3, ...)
	if not slot_0_42_0.shadow and not (slot_0_42_0.shadow_alpha > 0) then
		return
	end

	slot_0_48_4(arg_173_0, arg_173_1, arg_173_2:alpha_modulate(arg_173_2.a * slot_0_42_0.shadow_alpha), arg_173_3 * slot_0_42_0.shadow_alpha, ...)
end

slot_0_43_0 = {
	layout = {
		shadow_spread = 70,
		rounding = 12,
		height = 12,
		padding = vector(25, 13)
	},
	fonts = {
		header = render.load_font("arial", 14, "ad"),
		content = render.load_font("arial", vector(13, 11), "a")
	},
	colors = {
		rect = {
			outline = color(255, 20),
			background = color(150, 40)
		},
		text = {
			primary = color(240),
			secondary = color(170)
		}
	}
}

function slot_0_43_0.render_rect(arg_174_0, arg_174_1, arg_174_2, arg_174_3, arg_174_4)
	local var_174_0 = slot_0_43_0.layout.height * slot_0_40_0
	local var_174_1 = slot_0_43_0.layout.padding * slot_0_40_0
	local var_174_2 = slot_0_43_0.layout.rounding * slot_0_40_0
	local var_174_3 = slot_0_43_0.layout.shadow_spread * slot_0_40_0
	local var_174_4 = (arg_174_0 + vector(var_174_1.x / 2, var_174_0 / 2 + var_174_1.y / 2)):floor()
	local var_174_5 = math.max(1, (arg_174_4 or var_174_0) / 16) - 1
	local var_174_6 = vector(arg_174_3, 2 + 16 * var_174_5):floor()

	if slot_0_42_0.shadow_alpha > 0 then
		render.rect(var_174_4, var_174_4 + var_174_6, arg_174_1:alpha_modulate(65 * arg_174_2 * slot_0_42_0.shadow_alpha), var_174_2)
	end

	render.shadow(var_174_4, var_174_4 + var_174_6, arg_174_1:alpha_modulate(255 * arg_174_2), var_174_3, 0, var_174_2)
	render.blur(arg_174_0, arg_174_0 + var_174_1 + vector(arg_174_3, arg_174_4 or var_174_0), 0, arg_174_2, var_174_2)
	render.rect(arg_174_0, arg_174_0 + var_174_1 + vector(arg_174_3, arg_174_4 or var_174_0), slot_0_43_0.colors.rect.background:alpha_modulate(slot_0_43_0.colors.rect.background.a * arg_174_2), var_174_2)
	render.rect_outline(arg_174_0, arg_174_0 + var_174_1 + vector(arg_174_3, arg_174_4 or var_174_0), slot_0_43_0.colors.rect.outline:alpha_modulate(slot_0_43_0.colors.rect.outline.a * arg_174_2), 1, var_174_2)
end

function slot_0_43_0.render_text_header(arg_175_0, arg_175_1, arg_175_2, ...)
	render.text(slot_0_43_0.fonts.header, arg_175_0, arg_175_1, arg_175_2, ...)
end

function slot_0_43_0.render_text_content(arg_176_0, arg_176_1, arg_176_2, ...)
	render.text(slot_0_43_0.fonts.content, arg_176_0, arg_176_1, arg_176_2, ...)
end

function slot_0_44_0(arg_177_0, arg_177_1, arg_177_2)
	local var_177_0 = arg_177_0 + (arg_177_1 - arg_177_0) * slot_0_38_0.absoluteframetime * arg_177_2

	return math.abs(arg_177_1 - var_177_0) < 0.005 and arg_177_1 or var_177_0
end

slot_0_45_1 = nil
slot_0_46_1 = setmetatable({}, {
	__mode = "kv"
})

function slot_0_45_0(arg_178_0, arg_178_1, arg_178_2)
	local var_178_0 = string.format("%s:%s:%s", arg_178_0, arg_178_1, arg_178_2)

	if slot_0_46_1[var_178_0] == nil or slot_0_46_1[var_178_0].x == 0 then
		slot_0_46_1[var_178_0] = render.measure_text(arg_178_0, arg_178_1 and arg_178_1 .. slot_0_41_0 or slot_0_41_0, arg_178_2)
	end

	return slot_0_46_1[var_178_0]
end

slot_0_46_0 = {}
slot_0_47_2 = nil
slot_0_48_3 = nil

events.mouse_input(function()
	if slot_0_47_2 or slot_0_48_3 then
		return false
	end
end)

function slot_0_49_4(arg_180_0, arg_180_1)
	return slot_0_38_0.mouse_position.x >= arg_180_0.x and slot_0_38_0.mouse_position.x <= arg_180_0.x + arg_180_1.x and slot_0_38_0.mouse_position.y >= arg_180_0.y and slot_0_38_0.mouse_position.y <= arg_180_0.y + arg_180_1.y
end

slot_0_50_5 = slot_0_8_0.create("evalate-dragger")
slot_0_51_6 = 10000

function slot_0_46_0.new(arg_181_0, arg_181_1, arg_181_2)
	local var_181_0 = {
		dragging = false,
		action = false,
		hover = false,
		last_mouse_position = vector(),
		size = arg_181_2,
		position = arg_181_1,
		reference = {
			px = slot_0_50_5:slider(string.format("drag[%s].px", arg_181_0), -slot_0_51_6, slot_0_51_6, math.floor(arg_181_1.x / slot_0_21_0.x * slot_0_51_6)),
			py = slot_0_50_5:slider(string.format("drag[%s].py", arg_181_0), -slot_0_51_6, slot_0_51_6, math.floor(arg_181_1.y / slot_0_21_0.y * slot_0_51_6))
		},
		get_position = function(arg_182_0)
			local var_182_0 = arg_182_0.reference.px:get() / slot_0_51_6
			local var_182_1 = arg_182_0.reference.py:get() / slot_0_51_6

			return vector(var_182_0 * slot_0_21_0.x, var_182_1 * slot_0_21_0.y)
		end,
		set_limit = function(arg_183_0, arg_183_1, arg_183_2)
			arg_183_0.limit = {
				size = arg_183_2,
				position = arg_183_1
			}
		end,
		lines = {},
		add_line = function(arg_184_0, arg_184_1, arg_184_2)
			arg_184_0.lines[#arg_184_0.lines + 1] = {
				position = arg_184_1,
				horizontal = arg_184_2
			}
		end,
		anim_box_alpha = slot_0_36_0(0, 0.15, slot_0_36_0.ease_in_out),
		anim_line_alpha = slot_0_36_0(0, 0.15, slot_0_36_0.ease_in_out),
		anim_box_border_alpha = slot_0_36_0(0, 0.15, slot_0_36_0.ease_in_out),
		update = function(arg_185_0, arg_185_1, arg_185_2, arg_185_3)
			slot_185_4_0 = slot_0_38_0.ui_alpha * arg_185_1
			slot_185_5_0 = slot_0_38_0.mouse_position
			slot_185_6_0 = slot_0_38_0.ui_alpha > 0
			slot_185_7_0 = common.is_button_down(1)
			slot_185_8_0 = slot_0_38_0.ui_size
			slot_185_9_0 = slot_0_38_0.ui_position
			slot_185_10_0 = slot_0_49_4(slot_185_9_0, slot_185_8_0)

			if arg_185_2 then
				arg_185_0.size = arg_185_2
			end

			arg_185_0.position = arg_185_0:get_position()
			arg_185_0.hover = slot_0_49_4(arg_185_0.position, arg_185_0.size) and not slot_185_10_0
			arg_185_0.action = arg_185_0.dragging or arg_185_0.hover

			if arg_185_0.action and slot_185_7_0 and slot_185_6_0 and (slot_0_47_2 == arg_181_0 or slot_0_47_2 == nil) then
				slot_185_11_1 = nil
				slot_185_12_1 = nil

				if #arg_185_0.lines > 0 then
					for iter_185_0, iter_185_1 in ipairs(arg_185_0.lines) do
						slot_185_18_1 = 10
						slot_185_19_1 = math.abs(iter_185_1.position.x - arg_185_0.position.x - arg_185_0.size.x / 2)
						slot_185_20_0 = math.abs(iter_185_1.position.y - arg_185_0.position.y - arg_185_0.size.y / 2)

						if iter_185_1.horizontal then
							if not slot_185_12_1 and slot_185_20_0 < slot_185_18_1 then
								slot_185_12_1 = iter_185_1.position.y - arg_185_0.size.y / 2

								if not arg_185_0.last_mouse_stick then
									arg_185_0.last_mouse_stick = slot_185_5_0
								end
							end

							if slot_185_12_1 and arg_185_0.last_mouse_stick and slot_185_18_1 < math.abs(arg_185_0.last_mouse_stick.y - slot_185_5_0.y) then
								slot_185_12_1 = nil
								arg_185_0.last_mouse_stick = nil
							end
						else
							if not slot_185_11_1 and slot_185_19_1 < slot_185_18_1 then
								slot_185_11_1 = iter_185_1.position.x - arg_185_0.size.x / 2

								if not arg_185_0.last_mouse_stick then
									arg_185_0.last_mouse_stick = slot_185_5_0
								end
							end

							if slot_185_11_1 and arg_185_0.last_mouse_stick and slot_185_18_1 < math.abs(arg_185_0.last_mouse_stick.x - slot_185_5_0.x) then
								slot_185_11_1 = nil
								arg_185_0.last_mouse_stick = nil
							end
						end
					end
				end

				slot_185_13_1 = slot_185_5_0 + arg_185_0.last_mouse_position
				slot_185_14_1 = vector(slot_185_11_1 and slot_185_11_1 or slot_185_13_1.x, slot_185_12_1 and slot_185_12_1 or slot_185_13_1.y)
				slot_185_15_0 = slot_0_17_0(slot_185_14_1, vector(), slot_0_21_0 - arg_185_0.size)

				if arg_185_0.limit then
					slot_185_15_0 = slot_0_17_0(slot_185_15_0, arg_185_0.limit.position, arg_185_0.limit.position + arg_185_0.limit.size - arg_185_0.size)
				end

				arg_185_0.reference.px:set(math.floor(slot_185_15_0.x / slot_0_21_0.x * slot_0_51_6))
				arg_185_0.reference.py:set(math.floor(slot_185_15_0.y / slot_0_21_0.y * slot_0_51_6))

				arg_185_0.dragging = true
				slot_0_47_2 = arg_181_0
			else
				arg_185_0.last_mouse_position = arg_185_0.position - slot_185_5_0
				arg_185_0.dragging = false

				if slot_0_47_2 == arg_181_0 then
					slot_0_47_2 = nil
				end
			end

			if arg_185_0.hover and slot_185_6_0 then
				slot_0_48_3 = arg_181_0
			elseif slot_0_48_3 == arg_181_0 then
				slot_0_48_3 = nil
			end

			slot_185_11_0 = arg_185_0.anim_box_alpha(arg_185_0.action and 30 or 20) * slot_185_4_0
			slot_185_12_0 = arg_185_0.anim_line_alpha(arg_185_0.action and 40 or 0) * slot_185_4_0
			slot_185_13_0 = arg_185_0.anim_box_border_alpha(arg_185_0.dragging and 40 or 0) * slot_185_4_0

			if slot_185_4_0 > 0 then
				slot_185_14_0 = (arg_185_3 or 16) * slot_0_40_0

				if arg_185_0.limit then
					render.rect_outline(arg_185_0.limit.position, arg_185_0.limit.position + arg_185_0.limit.size, color(255, slot_185_12_0), 1, slot_185_14_0)
				end

				if #arg_185_0.lines > 0 then
					for iter_185_2, iter_185_3 in ipairs(arg_185_0.lines) do
						if iter_185_3.horizontal then
							render.rect(iter_185_3.position, iter_185_3.position + vector(slot_0_21_0.x, 1), color())
						else
							render.rect(iter_185_3.position, iter_185_3.position + vector(1, slot_0_21_0.y), color())
						end
					end
				end

				if slot_185_11_0 > 0 then
					render.rect(arg_185_0.position, arg_185_0.position + arg_185_0.size, color(255, slot_185_11_0), slot_185_14_0)
				end

				if slot_185_13_0 > 0 then
					render.rect_outline(arg_185_0.position, arg_185_0.position + arg_185_0.size, color(255, slot_185_13_0), 1, slot_185_14_0)
				end
			end
		end
	}

	local function var_181_1()
		var_181_0.reference.px:set_visible(false)
		var_181_0.reference.py:set_visible(false)
	end

	var_181_1()
	var_181_0.reference.px:set_callback(var_181_1)
	var_181_0.reference.py:set_callback(var_181_1)
	slot_0_23_0.new(string.format("drag[%s].xy", arg_181_0), var_181_0.reference)

	return var_181_0
end

function slot_0_46_0.new_offset(arg_187_0, arg_187_1, arg_187_2, arg_187_3, arg_187_4, arg_187_5, arg_187_6)
	local var_187_0 = {
		action = false,
		dragging = false,
		hover = false,
		last_mouse_position = vector(),
		size = arg_187_2,
		position = arg_187_1,
		offset = arg_187_3,
		max_offset = arg_187_4,
		horizontal = arg_187_5,
		reference = {
			offset = slot_0_50_5:slider(string.format("drag[%s].offset", arg_187_0), -slot_0_51_6, slot_0_51_6, arg_187_3)
		},
		get_offset = function(arg_188_0)
			return arg_188_0.reference.offset:get()
		end,
		anim_box_alpha = slot_0_36_0(0, 0.15, slot_0_36_0.ease_in_out),
		anim_line_alpha = slot_0_36_0(0, 0.15, slot_0_36_0.ease_in_out),
		anim_box_border_alpha = slot_0_36_0(0, 0.15, slot_0_36_0.ease_in_out),
		update = function(arg_189_0, arg_189_1, arg_189_2, arg_189_3)
			slot_189_4_0 = slot_0_38_0.ui_alpha * arg_189_1
			slot_189_5_0 = slot_0_38_0.mouse_position
			slot_189_6_0 = slot_0_38_0.ui_alpha > 0
			slot_189_7_0 = common.is_button_down(1)
			slot_189_8_0 = slot_0_38_0.ui_size
			slot_189_9_0 = slot_0_38_0.ui_position
			slot_189_10_0 = slot_0_49_4(slot_189_9_0, slot_189_8_0)

			if arg_189_2 then
				arg_189_0.size = arg_189_2
			end

			arg_189_0.offset = arg_189_0:get_offset()
			arg_189_0.hover = (arg_189_0.horizontal and slot_0_49_4(arg_189_0.position - arg_189_0.size / 2 + vector(arg_189_0.offset, 0), arg_189_0.size) or slot_0_49_4(arg_189_0.position + vector(-(arg_189_0.size.x / 2), arg_189_0.offset), arg_189_0.size)) and not slot_189_10_0
			arg_189_0.action = arg_189_0.dragging or arg_189_0.hover

			if arg_189_0.action and slot_189_7_0 and slot_189_6_0 and (slot_0_47_2 == arg_187_0 or slot_0_47_2 == nil) then
				if arg_189_0.horizontal then
					arg_189_0.reference.offset:set(slot_0_16_0(-(arg_189_0.position.x - (slot_189_5_0.x + arg_189_0.last_mouse_position.x)), 0, arg_189_0.max_offset))
				else
					arg_189_0.reference.offset:set(slot_0_16_0(-(arg_189_0.position.y - (slot_189_5_0.y + arg_189_0.last_mouse_position.y)), 0, arg_189_0.max_offset))
				end

				arg_189_0.dragging = true
				slot_0_47_2 = arg_187_0
			else
				arg_189_0.last_mouse_position = arg_189_0.horizontal and arg_189_0.position - slot_189_5_0 + vector(arg_189_0.offset, 0) or arg_189_0.position - slot_189_5_0 + vector(0, arg_189_0.offset)
				arg_189_0.dragging = false

				if slot_0_47_2 == arg_187_0 then
					slot_0_47_2 = nil
				end
			end

			if arg_189_0.hover and slot_189_6_0 then
				slot_0_48_3 = arg_187_0
			elseif slot_0_48_3 == arg_187_0 then
				slot_0_48_3 = nil
			end

			slot_189_11_0 = arg_189_0.anim_box_alpha(arg_189_0.action and 30 or 20) * slot_189_4_0
			slot_189_12_0 = arg_189_0.anim_line_alpha(arg_189_0.action and 40 or 0) * slot_189_4_0
			slot_189_13_0 = arg_189_0.anim_box_border_alpha(arg_189_0.dragging and 40 or 0) * slot_189_4_0

			if slot_189_4_0 > 0 then
				if slot_189_12_0 > 0 then
					slot_189_14_1 = arg_189_0.horizontal and vector(arg_187_4, 1) or vector(1, arg_187_4)

					render.rect(arg_189_0.position, arg_189_0.position + slot_189_14_1, color(255, slot_189_12_0))
				end

				slot_189_14_0 = (arg_189_3 or 16) * slot_0_40_0
				slot_189_15_0 = arg_189_0.position - (arg_187_6 and arg_189_0.size / 2 or vector(arg_189_0.size.x / 2, 0)) + (arg_189_0.horizontal and vector(arg_189_0.offset, 0) or vector(0, arg_189_0.offset))

				if slot_189_11_0 > 0 then
					render.rect(slot_189_15_0, slot_189_15_0 + arg_189_0.size, color(255, slot_189_11_0), slot_189_14_0)
				end

				if slot_189_13_0 > 0 then
					render.rect_outline(slot_189_15_0, slot_189_15_0 + arg_189_0.size, color(255, slot_189_13_0), 1, slot_189_14_0)
				end
			end
		end
	}

	local function var_187_1()
		var_187_0.reference.offset:set_visible(false)
	end

	var_187_1()
	var_187_0.reference.offset:set_callback(var_187_1)
	slot_0_23_0.new(string.format("drag[%s].offset", arg_187_0), var_187_0.reference.offset)

	return var_187_0
end

slot_0_22_0 = {}
slot_0_47_1 = slot_0_25_0.features.widgets:switch("\v\f<bell>     \rNotifications", false, nil, function(arg_191_0)
	return {
		debug = arg_191_0:switch("\v\f<fingerprint>     \rDebug"),
		screen = arg_191_0:switch("\v\f<screencast>    \rScreen"),
		console = arg_191_0:switch("\v\f<terminal>    \rConsole")
	}, true
end)

slot_0_23_0.new("notifications", slot_0_47_1, slot_0_27_0.features.visual)

slot_0_48_2 = slot_0_21_0.y / 1.7
slot_0_49_3 = slot_0_46_0.new_offset("notifications", vector(slot_0_21_0.x / 2, slot_0_48_2), vector(200, 30), 50, slot_0_21_0.y / 1.1 - slot_0_48_2, false)
slot_0_50_4 = {
	default = {},
	preview = {}
}
slot_0_51_5 = 5
slot_0_52_6 = 5
slot_0_53_6 = false
slot_0_54_7 = false
slot_0_55_8 = false
slot_0_56_9 = false
slot_0_57_13 = {
	spread = color("edc477"),
	correction = color("ff5d52"),
	misprediction = color("ff5d52"),
	["prediction error"] = color("ff5d52"),
	["damage rejection"] = color("ff5d52"),
	["backtrack failure"] = color("7a9ffa"),
	death = color("8c8c8c"),
	["player death"] = color("8c8c8c"),
	["unregistered shot"] = color("8c8c8c")
}
slot_0_58_14 = {
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
slot_0_59_10 = {
	inferno = "Burned",
	taser = "Tased",
	hegrenade = "Naded",
	knife = "Knifed"
}
slot_0_60_6 = {
	inferno = "Burned",
	taser = "Tased",
	hegrenade = "Exploded",
	knife = "Stabbed"
}

function slot_0_22_0.center(arg_192_0, arg_192_1, arg_192_2, arg_192_3)
	local var_192_0 = arg_192_1 or slot_0_39_0()
	local var_192_1 = vector(10, 0) * slot_0_40_0
	local var_192_2 = slot_0_43_0.layout.padding * slot_0_40_0
	local var_192_3 = slot_0_45_0(slot_0_43_0.fonts.content, nil, arg_192_3) + var_192_1
	local var_192_4 = arg_192_0 - vector(var_192_2.x / 2 + var_192_3.x / 2, 0)

	slot_0_43_0.render_rect(var_192_4, var_192_0, arg_192_2, var_192_3.x)
	slot_0_43_0.render_text_content(var_192_4 + var_192_1 + var_192_2 / 2, color(255, 255 * arg_192_2), nil, arg_192_3)

	local var_192_5 = var_192_4 + vector(13, 12) * slot_0_40_0

	render.circle(var_192_5, var_192_0:alpha_modulate(75 * arg_192_2), 4 * slot_0_40_0, 0, 1 * slot_0_40_0)
	render.circle(var_192_5, var_192_0:alpha_modulate(255 * arg_192_2), 2 * slot_0_40_0, 0, 1 * slot_0_40_0)

	return var_192_3.x
end

function slot_0_22_0.screen(arg_193_0, arg_193_1)
	if arg_193_1 then
		table.insert(slot_0_50_4.preview, 1, {
			alpha = 0,
			animate = slot_0_36_0(),
			callback = arg_193_0
		})

		return slot_0_50_4.preview[1]
	elseif slot_0_54_7 then
		table.insert(slot_0_50_4.default, 1, {
			alpha = 0,
			animate = slot_0_36_0(),
			realtime = slot_0_38_0.realtime,
			callback = arg_193_0
		})

		return slot_0_50_4.default[1]
	else
		return {
			realtime = slot_0_38_0.realtime
		}
	end
end

function slot_0_22_0.print(arg_194_0)
	local var_194_0 = slot_0_8_0.string("\a[accent]evalate\a[inactive] › \r")

	if slot_0_53_6 then
		print_dev(var_194_0 .. tostring(arg_194_0))
	end

	if slot_0_55_8 then
		print_raw(var_194_0 .. tostring(arg_194_0))
	end
end

function slot_0_22_0.build(arg_195_0, arg_195_1, arg_195_2)
	local var_195_0 = (arg_195_1 or slot_0_39_0()):to_hex()
	local var_195_1 = "\a" .. var_195_0
	local var_195_2 = "\a[inactive]"
	local var_195_3 = var_195_2 .. tostring(arg_195_0)

	for iter_195_0, iter_195_1 in pairs(arg_195_2) do
		local var_195_4 = "{" .. tostring(iter_195_0) .. "}"
		local var_195_5 = var_195_1 .. tostring(iter_195_1) .. var_195_2

		var_195_3 = var_195_3:gsub(var_195_4, var_195_5)
	end

	return slot_0_8_0.string(var_195_3)
end

slot_0_61_6 = slot_0_36_0()
slot_0_62_7 = slot_0_36_0()
slot_0_63_6 = 100
slot_0_64_7 = nil

function slot_0_64_6()
	local var_196_0 = slot_0_56_9 and slot_0_54_7
	local var_196_1 = slot_0_61_6(var_196_0)

	if not var_196_0 and not (var_196_1 > 0) then
		if not slot_0_56_9 or not slot_0_54_7 then
			slot_0_29_0("render", slot_0_64_6)
		end

		return
	end

	local var_196_2 = slot_0_62_7(slot_0_63_6)
	local var_196_3 = vector(var_196_2 + slot_0_43_0.layout.padding.x * slot_0_40_0 + 8 * slot_0_40_0, 33 * slot_0_40_0)

	slot_0_49_3:update(var_196_1, var_196_3)

	local var_196_4 = vector(slot_0_49_3.position.x, slot_0_49_3.position.y + slot_0_49_3.offset + 4 * slot_0_40_0)
	local var_196_5 = 0

	if #slot_0_50_4.default > 0 then
		for iter_196_0, iter_196_1 in ipairs(slot_0_50_4.default) do
			local var_196_6 = slot_0_38_0.realtime > iter_196_1.realtime + slot_0_52_6

			if iter_196_1.alpha > 0 then
				local var_196_7 = iter_196_1:callback(vector(var_196_4.x, var_196_4.y + 33 * slot_0_40_0 * var_196_5))

				if iter_196_0 == 1 then
					slot_0_63_6 = var_196_7
				end
			end

			iter_196_1.alpha = iter_196_1.animate(not var_196_6) * var_196_1
			var_196_5 = var_196_5 + iter_196_1.alpha

			if #slot_0_50_4.default > slot_0_51_5 then
				table.remove(slot_0_50_4.default)
			end

			if var_196_6 and not (iter_196_1.alpha > 0) then
				table.remove(slot_0_50_4.default, iter_196_0)
			end
		end
	else
		for iter_196_2, iter_196_3 in ipairs(slot_0_50_4.preview) do
			if iter_196_3.alpha > 0 then
				local var_196_8 = iter_196_3:callback(vector(var_196_4.x, var_196_4.y + 33 * slot_0_40_0 * var_196_5))

				if iter_196_2 == 1 then
					slot_0_63_6 = var_196_8
				end
			end

			iter_196_3.alpha = iter_196_3.animate(slot_0_38_0.ui_alpha > 0) * var_196_1
			var_196_5 = var_196_5 + iter_196_3.alpha
		end
	end
end

function slot_0_65_9(arg_197_0, arg_197_1)
	local var_197_0 = slot_0_39_0()
	local var_197_1 = slot_0_22_0.build("your face is like a {melody} - it won't leave my {head}", var_197_0, {
		head = "head",
		melody = "melody"
	})

	return slot_0_22_0.center(arg_197_1, var_197_0, arg_197_0.alpha, var_197_1)
end

slot_0_22_0.screen(slot_0_65_9, true)

function slot_0_65_8(arg_198_0, arg_198_1)
	local var_198_0 = slot_0_39_0()
	local var_198_1 = slot_0_22_0.build("Glad to see you again, {name}!", var_198_0, {
		name = slot_0_20_0
	})

	return slot_0_22_0.center(arg_198_1, var_198_0, arg_198_0.alpha, var_198_1)
end

slot_0_22_0.screen(slot_0_65_8, true)

function slot_0_65_7(arg_199_0, arg_199_1, arg_199_2, arg_199_3, arg_199_4, arg_199_5, arg_199_6, arg_199_7, arg_199_8)
	local var_199_0 = {}

	var_199_0[#var_199_0 + 1] = "{backtrack}t"
	var_199_0[#var_199_0 + 1] = "{hitchance}%"
	var_199_0[#var_199_0 + 1] = "{spread}°"

	if not arg_199_0 and arg_199_8 > 0 then
		var_199_0[#var_199_0 + 1] = "{health} hp"
	end

	local var_199_1 = arg_199_2 ~= arg_199_4
	local var_199_2 = arg_199_3 ~= arg_199_5 and not arg_199_0

	if var_199_1 and var_199_2 then
		var_199_0[#var_199_0 + 1] = "{wanted_hitgroup} ({wanted_damage} dmg)"
	else
		if var_199_1 then
			var_199_0[#var_199_0 + 1] = "{wanted_damage} dmg"
		end

		if var_199_2 then
			var_199_0[#var_199_0 + 1] = "{wanted_hitgroup}"
		end
	end

	if #var_199_0 > 0 then
		return " › " .. table.concat(var_199_0, " · ") .. " ‹"
	end

	return ""
end

function slot_0_66_6(arg_200_0)
	local var_200_0 = slot_0_38_0.me
	local var_200_1 = arg_200_0.target

	if not var_200_1 or not var_200_0 then
		return
	end

	local var_200_2 = var_200_1:get_name()
	local var_200_3 = var_200_1:is_alive()
	local var_200_4 = math.floor(arg_200_0.hitchance + 0.5)
	local var_200_5 = arg_200_0.damage
	local var_200_6 = slot_0_58_14[arg_200_0.hitgroup] or "?"
	local var_200_7 = arg_200_0.wanted_damage
	local var_200_8 = slot_0_58_14[arg_200_0.wanted_hitgroup] or "?"
	local var_200_9 = arg_200_0.state
	local var_200_10 = slot_0_57_13[var_200_9] or slot_0_39_0()
	local var_200_11 = ("%.2f"):format(arg_200_0.spread or 0)
	local var_200_12 = arg_200_0.backtrack
	local var_200_13 = var_200_1.m_iHealth
	local var_200_14 = ""

	if var_200_9 then
		var_200_14 = slot_0_22_0.build("Miss in {name}'s {wanted_hitgroup} due to {reason}", var_200_10, {
			name = var_200_2,
			reason = var_200_9,
			wanted_hitgroup = var_200_8
		})
	elseif var_200_3 then
		var_200_14 = slot_0_22_0.build("Hit {name} in {hitgroup} for {damage} damage", var_200_10, {
			name = var_200_2,
			damage = var_200_5,
			hitgroup = var_200_6
		})
	else
		var_200_14 = slot_0_22_0.build("Killed {name} in {hitgroup}", var_200_10, {
			name = var_200_2,
			hitgroup = var_200_6
		})
	end

	local function var_200_15(arg_201_0, arg_201_1)
		return slot_0_22_0.center(arg_201_1, var_200_10, arg_201_0.alpha, var_200_14)
	end

	slot_0_22_0.screen(var_200_15)

	local var_200_16 = ""
	local var_200_17 = slot_0_65_7(var_200_9, var_200_4, var_200_5, var_200_6, var_200_7, var_200_8, var_200_11, var_200_12, var_200_13)
	local var_200_18 = {
		name = var_200_2,
		reason = var_200_9,
		damage = var_200_5,
		health = var_200_13,
		spread = var_200_11,
		hitgroup = var_200_6,
		hitchance = var_200_4,
		backtrack = var_200_12,
		wanted_damage = var_200_7,
		wanted_hitgroup = var_200_8
	}

	if var_200_9 then
		var_200_16 = slot_0_22_0.build("Miss in {name}'s {wanted_hitgroup} due to {reason}" .. var_200_17, var_200_10, var_200_18)
	elseif var_200_3 then
		var_200_16 = slot_0_22_0.build("Hit {name} in {hitgroup} for {damage} damage" .. var_200_17, var_200_10, var_200_18)
	else
		var_200_16 = slot_0_22_0.build("Killed {name} in {hitgroup}" .. var_200_17, var_200_10, var_200_18)
	end

	slot_0_22_0.print(var_200_16)
end

slot_0_67_5 = {
	"Suicide is not a solution. Let's talk.",
	"Let's talk before it’s too late.",
	"You're not alone. Let's talk.",
	"You matter more than you know.",
	"No shame in pain. Just talk.",
	"Breathe. Break. Talk. Repeat.",
	"Scream, cry, curse — just don't disappear.",
	"Death is quiet. Don't be.",
	"I'm calling 911."
}

function slot_0_68_5(arg_202_0)
	local var_202_0 = slot_0_38_0.me
	local var_202_1 = entity.get(arg_202_0.userid, true)
	local var_202_2 = entity.get(arg_202_0.attacker, true)

	if var_202_0 ~= var_202_1 or not var_202_2 then
		return
	end

	local var_202_3 = var_202_2:get_name()
	local var_202_4 = slot_0_57_13.death or slot_0_39_0()
	local var_202_5 = "Killed by {name}"

	if var_202_0 == var_202_2 then
		local var_202_6 = math.random(1, #slot_0_67_5)

		var_202_5 = slot_0_67_5[var_202_6] or "Suicide is not a solution. Let's talk."
	end

	local var_202_7 = slot_0_22_0.build(var_202_5, var_202_4, {
		name = var_202_3
	})

	local function var_202_8(arg_203_0, arg_203_1)
		return slot_0_22_0.center(arg_203_1, var_202_4, arg_203_0.alpha, var_202_7)
	end

	slot_0_22_0.screen(var_202_8)
	slot_0_22_0.print(var_202_7)
end

slot_0_69_5 = {}
slot_0_70_8 = nil

function slot_0_70_7()
	local var_204_0 = 0

	for iter_204_0, iter_204_1 in pairs(slot_0_69_5) do
		if iter_204_1.notify then
			if iter_204_1.notify.realtime + slot_0_52_6 < slot_0_38_0.realtime then
				slot_0_22_0.print(iter_204_1.text)

				slot_0_69_5[iter_204_0] = nil
			end

			var_204_0 = var_204_0 + 1
		end
	end

	if var_204_0 == 0 then
		slot_0_29_0("render", slot_0_70_7)
	end
end

function slot_0_71_6(arg_205_0, arg_205_1)
	local var_205_0 = arg_205_1:get_name()
	local var_205_1 = arg_205_1:get_index()
	local var_205_2 = tostring(var_205_1) .. tostring(var_205_0)

	slot_0_69_5[var_205_2] = slot_0_69_5[var_205_2] or {
		damage = 0,
		text = "",
		notify = slot_0_22_0.screen(function()
			return
		end)
	}

	if slot_0_69_5[var_205_2].notify == nil then
		return
	end

	slot_0_69_5[var_205_2].damage = slot_0_69_5[var_205_2].damage + arg_205_0.dmg_health

	local var_205_3 = slot_0_39_0()
	local var_205_4 = arg_205_0.health > 0
	local var_205_5 = slot_0_22_0.build(var_205_4 and "{name} was burned for {damage} hp" or "{name} burned out", var_205_3, {
		name = var_205_0,
		damage = slot_0_69_5[var_205_2].damage
	})

	if arg_205_0.health <= 0 then
		slot_0_69_5[var_205_2].damage = 0
	end

	slot_0_69_5[var_205_2].text = var_205_5
	slot_0_69_5[var_205_2].notify.realtime = slot_0_38_0.realtime
	slot_0_69_5[var_205_2].notify.callback = function(arg_207_0, arg_207_1)
		slot_0_22_0.center(arg_207_1, var_205_3, arg_207_0.alpha, var_205_5)
	end

	slot_0_28_0("render", slot_0_70_7)
end

function slot_0_72_7(arg_208_0)
	local var_208_0 = slot_0_38_0.me
	local var_208_1 = entity.get(arg_208_0.userid, true)
	local var_208_2 = entity.get(arg_208_0.attacker, true)
	local var_208_3 = arg_208_0.weapon
	local var_208_4 = slot_0_59_10[var_208_3]
	local var_208_5 = slot_0_60_6[var_208_3]

	if not var_208_5 or not var_208_4 or not var_208_0 or var_208_0 ~= var_208_2 then
		return
	end

	if var_208_3 == "inferno" then
		return slot_0_71_6(arg_208_0, var_208_1)
	end

	local var_208_6 = slot_0_39_0()
	local var_208_7 = var_208_1:get_name()
	local var_208_8 = arg_208_0.dmg_health
	local var_208_9 = ""

	if arg_208_0.health > 0 then
		var_208_9 = slot_0_22_0.build(var_208_4 .. " {name} for {damage} damage", var_208_6, {
			name = var_208_7,
			damage = var_208_8
		})
	else
		var_208_9 = slot_0_22_0.build(var_208_5 .. " {name}", var_208_6, {
			name = var_208_7
		})
	end

	local function var_208_10(arg_209_0, arg_209_1)
		return slot_0_22_0.center(arg_209_1, var_208_6, arg_209_0.alpha, var_208_9)
	end

	slot_0_22_0.screen(var_208_10)
	slot_0_22_0.print(var_208_9)
end

function slot_0_73_7()
	if slot_0_55_8 then
		print_raw("")
	end
end

function slot_0_74_8(arg_211_0)
	local var_211_0 = arg_211_0.entity:get_name()
	local var_211_1 = slot_0_39_0()
	local var_211_2 = slot_0_22_0.build("Evaded {name}'s shot", var_211_1, {
		name = var_211_0
	})

	local function var_211_3(arg_212_0, arg_212_1)
		return slot_0_22_0.center(arg_212_1, var_211_1, arg_212_0.alpha, var_211_2)
	end

	slot_0_22_0.screen(var_211_3)
	slot_0_22_0.print(var_211_2)
end

function slot_0_75_5()
	slot_0_56_9 = slot_0_47_1:get()
	slot_0_53_6 = slot_0_56_9 and slot_0_47_1.debug:get()
	slot_0_54_7 = slot_0_56_9 and slot_0_47_1.screen:get()
	slot_0_55_8 = slot_0_56_9 and slot_0_47_1.console:get()

	if slot_0_56_9 and slot_0_54_7 then
		slot_0_28_0("render", slot_0_64_6)
	end

	if slot_0_56_9 and (slot_0_53_6 or slot_0_54_7 or slot_0_55_8) then
		slot_0_28_0("aim_ack", slot_0_66_6)
		slot_0_28_0("round_start", slot_0_73_7)
		slot_0_28_0("player_hurt", slot_0_72_7)
		slot_0_28_0("player_death", slot_0_68_5)
		events.close_shot(slot_0_74_8)
	else
		slot_0_29_0("aim_ack", slot_0_66_6)
		slot_0_29_0("round_start", slot_0_73_7)
		slot_0_29_0("player_hurt", slot_0_72_7)
		slot_0_29_0("player_death", slot_0_68_5)
		events.close_shot(slot_0_74_8, true)
	end
end

slot_0_75_5()
slot_0_47_1:set_callback(slot_0_75_5)
slot_0_47_1.debug:set_callback(slot_0_75_5)
slot_0_47_1.screen:set_callback(slot_0_75_5)
slot_0_47_1.console:set_callback(slot_0_75_5)

slot_0_47_0 = nil
slot_0_48_1 = slot_0_25_0.features.widgets:switch("\v\f<tarp>    \rWatermark", true, nil, function(arg_214_0)
	local var_214_0 = {
		version = arg_214_0:switch("\v\f<code>   \rVersion", true),
		username = arg_214_0:switch("\v\f<user>     \rUsername", true)
	}

	var_214_0.username_source = arg_214_0:combo("## Username source", {
		"Cheat",
		"Steam",
		"Custom"
	}):depend(var_214_0.username)
	var_214_0.username_custom = arg_214_0:input("## Username custom"):depend(var_214_0.username, {
		var_214_0.username_source,
		"Custom"
	})
	var_214_0.latency = arg_214_0:switch("\v\f<arrows-rotate>     \rLatency", true)
	var_214_0.frames = arg_214_0:switch("\v\f<layer-group>     \rFrames", true)
	var_214_0.time = arg_214_0:switch("\v\f<clock>     \rTime", true)
	var_214_0.time_format = arg_214_0:combo("## Time format", {
		"24h",
		"12h"
	}):depend(var_214_0.time)
	var_214_0.position = arg_214_0:combo("\v\f<arrows-up-down-left-right>     \rPosition", {
		"Top Right",
		"Top Left",
		"Bottom Center"
	})

	return var_214_0, true
end)

slot_0_23_0.new("watermark", slot_0_48_1, slot_0_27_0.features.visual)

slot_0_49_2 = slot_0_36_0()
slot_0_50_3 = slot_0_36_0()
slot_0_51_4 = slot_0_36_0()
slot_0_52_5 = panorama.MyPersonaAPI.GetName
slot_0_53_5 = slot_0_11_0.text_animate("𝒆𝒗𝒂𝒍𝒂𝒕𝒆", -1.3, {
	color()
})
slot_0_54_6 = 0
slot_0_55_7 = 0

function slot_0_56_8()
	local var_215_0 = {}

	if slot_0_48_1.version.value then
		var_215_0[#var_215_0 + 1] = string.format("\a[accent]\f<code>  \r%s", slot_0_1_0)
	end

	if slot_0_48_1.username.value then
		local var_215_1 = slot_0_48_1.username_source.value == "Steam" and slot_0_52_5() or slot_0_48_1.username_source.value == "Custom" and slot_0_48_1.username_custom.value or slot_0_20_0

		var_215_0[#var_215_0 + 1] = string.format("\a[accent]\f<user>  \r%s", var_215_1)
	end

	if slot_0_48_1.latency.value and slot_0_38_0.net_channel and slot_0_38_0.server_info and slot_0_38_0.server_info.address ~= "loopback" and slot_0_38_0.net_channel.latency then
		var_215_0[#var_215_0 + 1] = string.format("\a[accent]\f<arrows-rotate>  \r%i ms", slot_0_38_0.net_channel.latency[1] * 1000)
	end

	if slot_0_48_1.frames.value then
		if slot_0_38_0.realtime > slot_0_55_7 + 0.8 then
			slot_0_54_6 = 1 / slot_0_38_0.absoluteframetime
			slot_0_55_7 = slot_0_38_0.realtime
		end

		var_215_0[#var_215_0 + 1] = string.format("\a[accent]\f<layer-group>  \r%i fps", slot_0_54_6)
	end

	if slot_0_48_1.time.value then
		var_215_0[#var_215_0 + 1] = string.format("\a[accent]\f<clock>  \r%s", common.get_date(slot_0_48_1.time_format.value == "24h" and "%H:%M" or "%I:%M %p"):lower())
	end

	return var_215_0
end

slot_0_57_12 = nil

function slot_0_57_11()
	local var_216_0 = slot_0_48_1.value
	local var_216_1 = slot_0_49_2(var_216_0)

	if not var_216_0 and not (var_216_1 > 0) then
		if not slot_0_48_1.value then
			slot_0_29_0("render", slot_0_57_11)
		end

		return
	end

	local var_216_2 = slot_0_39_0()
	local var_216_3 = slot_0_56_8()
	local var_216_4 = slot_0_8_0.string(table.concat(var_216_3, "   "))
	local var_216_5 = slot_0_45_0(slot_0_43_0.fonts.content, nil, var_216_4)

	slot_0_53_5:set_colors({
		var_216_2,
		var_216_2:alpha_modulate(50)
	})
	slot_0_53_5:animate()

	local var_216_6 = slot_0_51_4(#var_216_3 > 0)
	local var_216_7 = slot_0_50_3(var_216_5.x)
	local var_216_8 = slot_0_53_5:get_animated_text()
	local var_216_9 = slot_0_45_0(slot_0_43_0.fonts.header, nil, var_216_8)
	local var_216_10 = var_216_7 + var_216_9.x + slot_0_43_0.layout.padding.x * slot_0_40_0 * (2 - (1 - var_216_6))
	local var_216_11 = vector(slot_0_21_0.x - var_216_10 - (10 + 5 * var_216_6) * slot_0_40_0, 10 * var_216_1)

	if slot_0_48_1.position.value == "Top Left" then
		var_216_11 = vector(10, 10 * var_216_1)
	end

	if slot_0_48_1.position.value == "Bottom Center" then
		var_216_11 = vector(slot_0_21_0.x / 2 - var_216_10 / 2, slot_0_21_0.y - 44 * slot_0_40_0 * var_216_1)
	end

	slot_0_43_0.render_rect(var_216_11, var_216_2, var_216_1, var_216_9.x)
	slot_0_43_0.render_text_header(var_216_11 + slot_0_43_0.layout.padding * slot_0_40_0 / 2 - vector(0, 2 * slot_0_40_0), var_216_2:alpha_modulate(255 * var_216_1), nil, var_216_8)

	if var_216_6 > 0 then
		var_216_11.x = var_216_11.x + var_216_9.x + slot_0_43_0.layout.padding.x * slot_0_40_0 + 5 * slot_0_40_0

		slot_0_43_0.render_rect(var_216_11, var_216_2, var_216_1 * var_216_6, var_216_7)
		slot_0_43_0.render_text_content(var_216_11 + slot_0_43_0.layout.padding * slot_0_40_0 / 2, slot_0_43_0.colors.text.primary:alpha_modulate(255 * var_216_1 * var_216_6), nil, var_216_4)
	end
end

function slot_0_58_13(arg_217_0)
	if arg_217_0.value then
		slot_0_28_0("render", slot_0_57_11)
	end
end

slot_0_48_1:set_callback(slot_0_58_13, true)

slot_0_48_0 = nil
slot_0_49_1 = slot_0_25_0.features.widgets:switch("\v\f<magnifying-glass>    \rSpectators")

slot_0_23_0.new("specs", slot_0_49_1, slot_0_27_0.features.visual)

slot_0_50_2 = {}

function slot_0_51_3()
	local var_218_0 = false
	local var_218_1 = {}
	local var_218_2 = slot_0_38_0.me

	if not var_218_2 then
		return var_218_0, var_218_1
	end

	for iter_218_0, iter_218_1 in ipairs(slot_0_38_0.players) do
		local var_218_3 = iter_218_1.entity

		if not slot_0_37_0(var_218_3) then
			-- block empty
		else
			local var_218_4 = var_218_3:get_player_info()

			if not var_218_4 then
				-- block empty
			else
				local var_218_5 = var_218_3:get_name()
				local var_218_6 = string.format("%s&%s&%s", var_218_5, var_218_4.steamid64, var_218_3:get_index())

				slot_0_50_2[var_218_6] = slot_0_50_2[var_218_6] or {
					alpha = 0,
					name = var_218_5,
					player = var_218_3,
					animate = slot_0_36_0()
				}
				slot_0_50_2[var_218_6].player = var_218_3

				local var_218_7 = var_218_3.m_hObserverTarget == (slot_0_38_0.is_alive and var_218_2 or var_218_2.m_hObserverTarget)

				if var_218_7 then
					var_218_0 = true
				end

				slot_0_50_2[var_218_6].alpha = slot_0_50_2[var_218_6].animate(var_218_7)

				if slot_0_50_2[var_218_6].alpha > 0 then
					table.insert(var_218_1, 1, slot_0_50_2[var_218_6])
				end
			end
		end
	end

	return var_218_0, var_218_1
end

slot_0_52_4 = slot_0_36_0()
slot_0_53_4 = slot_0_36_0(95, nil, slot_0_36_0.ease_in_out)
slot_0_54_5 = 103
slot_0_55_6 = slot_0_36_0()
slot_0_56_7 = slot_0_46_0.new("specs", vector(450, 300), vector(100, 44))
slot_0_57_10 = render.load_image("\xFF\xD8\xFF\xE0\x00\x10JFIF\x00\x01\x01\x00\x00\x01\x00\x01\x00\x00\xFF\xFE\x00;CREATOR: gd-jpeg v1.0 (using IJG JPEG v62), quality = 80\n\xFF\xDB\x00C\x00\x06\x04\x05\x06\x05\x04\x06\x06\x05\x06\a\a\x06\b\n\x10\n\n\t\t\n\x14\x0E\x0F\f\x10\x17\x14\x18\x18\x17\x14\x16\x16\x1A\x1D%\x1F\x1A\x1B#\x1C\x16\x16 , #&')*)\x19\x1F-0-(0%()(\xFF\xDB\x00C\x01\a\a\a\n\b\n\x13\n\n\x13(\x1A\x16\x1A((((((((((((((((((((((((((((((((((((((((((((((((((\xFF\xC0\x00\x11\b\x00\xB8\x00\xB8\x03\x01\"\x00\x02\x11\x01\x03\x11\x01\xFF\xC4\x00\x1F\x00\x00\x01\x05\x01\x01\x01\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x01\x02\x03\x04\x05\x06\a\b\t\n\v\xFF\xC4\x00\xB5\x10\x00\x02\x01\x03\x03\x02\x04\x03\x05\x05\x04\x04\x00\x00\x01}\x01\x02\x03\x00\x04\x11\x05\x12!1A\x06\x13Qa\a\"q\x142\x81\x91\xA1\b#B\xB1\xC1\x15R\xD1\xF0$3br\x82\t\n\x16\x17\x18\x19\x1A%&'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz\x83\x84\x85\x86\x87\x88\x89\x8A\x92\x93\x94\x95\x96\x97\x98\x99\x9A\xA2\xA3\xA4\xA5\xA6\xA7\xA8\xA9\xAA\xB2\xB3\xB4\xB5\xB6\xB7\xB8\xB9\xBA\xC2\xC3\xC4\xC5\xC6\xC7\xC8\xC9\xCA\xD2\xD3\xD4\xD5\xD6\xD7\xD8\xD9\xDA\xE1\xE2\xE3\xE4\xE5\xE6\xE7\xE8\xE9\xEA\xF1\xF2\xF3\xF4\xF5\xF6\xF7\xF8\xF9\xFA\xFF\xC4\x00\x1F\x01\x00\x03\x01\x01\x01\x01\x01\x01\x01\x01\x01\x00\x00\x00\x00\x00\x00\x01\x02\x03\x04\x05\x06\a\b\t\n\v\xFF\xC4\x00\xB5\x11\x00\x02\x01\x02\x04\x04\x03\x04\a\x05\x04\x04\x00\x01\x02w\x00\x01\x02\x03\x11\x04\x05!1\x06\x12AQ\aaq\x13\"2\x81\b\x14B\x91\xA1\xB1\xC1\t#3R\xF0\x15br\xD1\n\x16$4\xE1%\xF1\x17\x18\x19\x1A&'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz\x82\x83\x84\x85\x86\x87\x88\x89\x8A\x92\x93\x94\x95\x96\x97\x98\x99\x9A\xA2\xA3\xA4\xA5\xA6\xA7\xA8\xA9\xAA\xB2\xB3\xB4\xB5\xB6\xB7\xB8\xB9\xBA\xC2\xC3\xC4\xC5\xC6\xC7\xC8\xC9\xCA\xD2\xD3\xD4\xD5\xD6\xD7\xD8\xD9\xDA\xE2\xE3\xE4\xE5\xE6\xE7\xE8\xE9\xEA\xF2\xF3\xF4\xF5\xF6\xF7\xF8\xF9\xFA\xFF\xDA\x00\f\x03\x01\x00\x02\x11\x03\x11\x00?\x00\xF1]F\xF6\xEE\x1DB\xE6(ng\x8E4\x95\x95Ud \x00\t\xF7\xAA\xDF\xDA7\xDF\xF3\xFBs\xFF\x00\x7F[\xFChտ\xE4+{\xFF\x00]\x9F\xFF\x00B5V\x80-\x7Fh\xDF\x7F\xCF\xED\xCF\xFD\xFDo\xF1\xA3\xFBF\xFB\xFE\x7Fn\x7F\xEF\xEB\x7F\x8DU\xA2\x80-\x7Fh\xDF\x7F\xCF\xED\xCF\xFD\xFDo\xF1\xA3\xFBF\xFB\xFE\x7Fn\x7F\xEF\xEB\x7F\x8DU\xA2\x80-\x7Fh\xDF\x7F\xCF\xED\xCF\xFD\xFDo\xF1\xA3\xFBF\xFB\xFE\x7Fn\x7F\xEF\xEB\x7F\x8DU\xA2\x80-\x7Fh\xDF\x7F\xCF\xED\xCF\xFD\xFDo\xF1\xA3\xFBF\xFB\xFE\x7Fn\x7F\xEF\xEB\x7F\x8DU\xA2\x80-\x7Fh\xDF\x7F\xCF\xED\xCF\xFD\xFDo\xF1\xA3\xFBF\xFB\xFE\x7Fn\x7F\xEF\xEB\x7F\x8DU\xA2\x80-\x7Fh\xDF\x7F\xCF\xED\xCF\xFD\xFDo\xF1\xA3\xFBF\xFB\xFE\x7Fn\x7F\xEF\xEB\x7F\x8DU\xA2\x80-\x7Fh\xDF\x7F\xCF\xED\xCF\xFD\xFDo\xF1\xA3\xFBF\xFB\xFE\x7Fn\x7F\xEF\xEB\x7F\x8DU\xA2\x80-\x7Fh\xDF\x7F\xCF\xED\xCF\xFD\xFDo\xF1\xA3\xFBF\xFB\xFE\x7Fn\x7F\xEF\xEB\x7F\x8DU\xA2\x80-\x7Fh\xDF\x7F\xCF\xED\xCF\xFD\xFDo\xF1\xA3\xFBF\xFB\xFE\x7Fn\x7F\xEF\xEB\x7F\x8DU\xA2\x80-\x7Fh\xDF\x7F\xCF\xED\xCF\xFD\xFDo\xF1\xA3\xFBF\xFB\xFE\x7Fn\x7F\xEF\xEB\x7F\x8DU\xA2\x804\xF4\xEB۹\xB5\vh\xA6\xB9\x9EH\xDEUVV\x90\x90A#ފ\xAD\xA4\xFF\x00\xC8V\xCB\xFE\xBB'\xFE\x84(\xA0\x03V\xFF\x00\x90\xAD\xEF\xFDv\x7F\xFD\b\xD5Z\xB5\xAB\x7F\xC8V\xF7\xFE\xBB?\xFE\x84j\xAD\x00\x14QE\x00\x14QE\x00\x14QE\x00\x14QE\x00\x14QE\x00\x14QE\x00\x14QE\x00\x14QE\x00\x14QE\x00\x14QE\x00Z\xD2\x7F\xE4+e\xFF\x00]\x93\xFF\x00B\x14Q\xA4\xFF\x00\xC8V\xCB\xFE\xBB'\xFE\x84(\xA0\x03V\xFF\x00\x90\xAD\xEF\xFDv\x7F\xFD\b\xD5Z\xB5\xAB\x7F\xC8V\xF7\xFE\xBB?\xFE\x84j\xAD\x00\x14QE\x00\x14QE\x00\x14QE\x00\x14Q[^\x14\xF0\xBE\xAF\xE2\xADDYh\x96\x8F;\x8C\x19\x1C\xF0\x91\x0FVn\xC3\xF5=\xB3@\x18\xB4W\xD2\x1E\x19\xF8\x01\xA6A\x12I\xE2=Fk\xBB\x8Cd\xC5k\x88\xE3\a\xB8\xDCAf\xFA\xF1]j\xFC\x1C\xF0*\xA8\aD,GRn\xE7\xC9\xFF\x00\xC7\xE8\x03\xE4*+\xEA\rs\xE0/\x86\xEF#'J\xB9\xBDӦ\xC7\xCB\xF3\t\x93\xF1V\xE4\xFE\x04W\x89\xF8\xF7Ά\xE0\xC6\xF3ob\x17:q8[\xC82S=\x83\feO׏Bh\x03\x8B\xA2\x8A(\x00\xA2\x8A(\x00\xA2\x8A(\x00\xA2\x8A(\x02֓\xFF\x00![/\xFA\xEC\x9F\xFA\x10\xA2\x8D'\xFEB\xB6_\xF5\xD9?\xF4!E\x00\x1A\xB7\xFC\x85o\x7F\xEB\xB3\xFF\x00\xE8F\xAAխ[\xFEB\xB7\xBF\xF5\xD9\xFF\x00\xF4#Uh\x00\xA2\x8A(\x00\xA2\x8A(\x00\xA2\x8A(\x03o\xC1\x9E\x1C\xBB\xF1_\x88\xED4\x9B\x1F\x95\xE6l\xBC\x84dD\x83\x96c\xF4\xFDO\x15\xF6W\x84\xBC7\xA7xWE\x87M\xD2a\t\x12\x00]\xC8\x1B\xE5|`\xB3\x1E\xE4\xE3\xFA\x0E+\xCA\xFF\x00f\x1D\x05-\xF4\x1DG\\\x91?\x7Fw/\xD9\xE3'\xB4h\x018\xFA\xB1\xFF\x00\xC7k\xDBh\x00\xA2\xBCS\xE3\x7F\xC5+\xBF\x0Fޝ\x03Î\x91߄\rsr@c\b#!T\x7F{\a9#\x80x秀\xDCx\x93\\\xB8\x9C\xCF>\xB1\xA8\xBC\xC4\xE7{\\\xB99\xFA\xE6\x80>\xE9\xA8\xEE`\x8A\xEA\xDEK{\x98\xA3\x9A\tT\xAB\xC7\"\x82\xAC\b\xC1\x04w\x15\xF3/\xC3\x0F\x8Cz\x9E\x95\x7F\r\x8F\x8A.d\xBFҤ!L\xF2\x92\xD2\xC0zn-՗\xD4\x1C\x9FOC\xF4\xEA:\xBA+\xA3\x06R\x03\x02\xA7 \x8E\xB9\x06\x80>K\xF8\xD7\xF0\xFF\x00\xFE\x10\xEDe.\xB4\xE5'E\xBDc\xE5\x03\x92a~\xF1\x93\xE9\xDC\x13\xDB\xE9\x9A\xF3j\xFBK⮂\x9E\"\xF0\x1E\xADdWt\xC9\x11\x9E\x03\xDCH\x83r\xE3\xD38#\xE8k\xE2\xDA\x00(\xA2\x8A\x00(\xA2\x8A\x00(\xA2\x8A\x00\xB5\xA4\xFF\x00\xC8V\xCB\xFE\xBB'\xFE\x84(\xA3I\xFF\x00\x90\xAD\x97\xFDvO\xFD\bQ@\x06\xAD\xFF\x00![\xDF\xFA\xEC\xFF\x00\xFA\x11\xAA\xB5kV\xFF\x00\x90\xAD\xEF\xFDv\x7F\xFD\b\xD5Z\x00(\xA2\x8A\x00(\xA2\x8A\x00(\xA2\x8A\x00\xFA\xE3\xE0=Ŵ_\n\xB4Uy\xA1G&r\xC0\xB0\a>{\xF5\xE7\xD3\x15\xDF}\xB6\xD7\xFE~a\xFF\x00\xBE\xC7\xF8\xD7\xC14P\x06\xBF\x8C/\x9BR\xF1^\xB1z\xED\xBC\xCFw+\x83\x9C\x8C\x168\x00\xFAc\x8AȢ\x8A\x00+\xED?\x853O?Ï\x0F=\xCE|ϱ\xA2\xE4\xF5*\x06\x14\xFE@W\xCA\x1F\x0F\xFC)w\xE3\x1F\x12\xDB閠\xACD︘\x0E!\x8C\x11\xB9\xBE\xBD\x80\xEEk\xEDK\x1BXll\xAD\xED-P$\x10F\xB1F\x83\xA2\xA2\x80\x00\xFD(\x02VP\xCAU\x80ea\x82\x0F \x8A\xF8\n\xBE\xE4񮮚\x17\x84\xB5}I\xD8)\xB7\xB6vRx\xCB\xE3\b?\x16*+\xE1\xBA\x00(\xA2\x8A\x00(\xA2\x8A\x00(\xA2\x8A\x00\xB5\xA4\xFF\x00\xC8V\xCB\xFE\xBB'\xFE\x84(\xA3I\xFF\x00\x90\xAD\x97\xFDvO\xFD\bQ@\x06\xAD\xFF\x00![\xDF\xFA\xEC\xFF\x00\xFA\x11\xAA\xB5kV\xFF\x00\x90\xAD\xEF\xFDv\x7F\xFD\b\xD5Z\x00(\xA2\x8A\x00(\xA2\x8A\x00(\xA2\x8A\x00(\xA2\x8A\x00*[[y\xAE\xB5\x8D帕\xC4qƃ%؞\x00\x1D\xCEME_C\xFE\xCE\xDE\x01\xF2\"_\x15\xEA\xD0\xFE\xF6E\"\xC27\x1C\xAA\xF7\x97\x1E\xA7\xA0\xF6\xC9\xEE(\x03о\x14x&\x1F\x05xm p\x8F\xA9\xDCbK\xB9W\x9C\xBE8P\x7F\xBA\xB9ǿ'\xBDv\xB4W\x9A\xFCm\xF1\xF0\xF0\x8E\x87\xF6=>O\xF8\x9D_!X\xB1\xD6\x14\xE8d>\xFD\x87\xBF=\x8D\x00y\xCF\xED\x15\xE3\xA4ԯ\a\x864\xC97[Zɺ\xEEE<<\xA38A\xEC\xB9\xE7\xDF\xFD\xDA\xF1\x1AVb\xCCY\x89fc\x92O$\x9FSI@\x05\x14Q@\x05\x14Q@\x05\x14Q@\x16\xB4\x9F\xF9\n\xD9\x7F\xD7d\xFF\x00Ѕ\x14i?\xF2\x15\xB2\xFF\x00\xAE\xC9\xFF\x00\xA1\n(\x00տ\xE4+{\xFF\x00]\x9F\xFF\x00B5V\xADj\xDF\xF2\x15\xBD\xFF\x00\xAE\xCF\xFF\x00\xA1\x1A\xAB@\x05\x14Q@\x05\x14Q@\x05\x14Q@\x05\x14Q@\x1D\x0F\xC3\xED\r|I\xE3M#I\x93>M\xC4\xC3\xCD\x03\xA9\x8DAg\x00\xFA\xEDS_m\xC5\x1AC\x12G\x12\x04\x8D\x14*\xAA\x8C\x05\x00`\x00;\fW\xC9_\xB3\xD8\xFF\x00\x8B\xA5\xA6\xFF\x00\xD7)\xBF\xF4[W\xD6\xF4\x01\x8D\xE3\x0F\x11Y\xF8W\xC3\xD7Z\xB6\xA0s\x14+\xF2\xA082\xB9\xE1T{\x93\xF9\x0E{W\xC5\xDE'\xD7o|I\xAE]j\xBA\x94\x9B\xEE.\x1Fq\x038A\xD0*\x8E\xC0\x0E+\xDD\x7Fj\x9B\xB7M/\xC3\xD6a\x88If\x9Ab\xBD\x89EP\t\xFF\x00\xBE\xCD|\xED@\x05\x14Q@\x05\x14Q@\x05\x14Q@\x05\x14Q@\x16\xB4\x9F\xF9\n\xD9\x7F\xD7d\xFF\x00Ѕ\x14i?\xF2\x15\xB2\xFF\x00\xAE\xC9\xFF\x00\xA1\n(\x00տ\xE4+{\xFF\x00]\x9F\xFF\x00B5V\xADj\xDF\xF2\x15\xBD\xFF\x00\xAE\xCF\xFF\x00\xA1\x1A\xAB@\x05\x14Q@\x05\x14Q@\x05\x14Q@\x05\x14Q@\x1D\xD7\xC1MZ\xC7E\xF8\x85c{\xAA\xDC\xC7mh\x91\xCC\x1AY8\x00\x98\xC8\x1F\xA9\xAF\xA5\x7F\xE1e\xF87\xFE\x86\x1B\x1F\xFB\xE8\xFF\x00\x85|aE\x00{?\xED\x1B\xE2m\x1B\xC4_\xF0\x8F\x7Fbj0\xDE\xF9\x1Fh\xF3|\xB2N\xCD\xDEV\xDC\xF1\xFEɯ\x18\xA2\x8A\x00(\xA2\x8A\x00(\xA2\x8A\x00(\xA2\x8A\x00(\xA2\x8A\x00\xB5\xA4\xFF\x00\xC8V\xCB\xFE\xBB'\xFE\x84(\xA3I\xFF\x00\x90\xAD\x97\xFDvO\xFD\bQ@\x06\xAD\xFF\x00![\xDF\xFA\xEC\xFF\x00\xFA\x11\xAA\xB5kV\xFF\x00\x90\xAD\xEF\xFDv\x7F\xFD\b\xD5Z\x00(\xA2\x8A\x00(\xA2\x8A\x00(\xA2\x8A\x00(\xA2\x8A\x00\xF4?\x80pCs\xF17O\x8A\xE6(\xE5\x8C\xC71)\"\x86\a\xF7d\x8E+\xEA\xBF\xEC]+\xFE\x81\x96?\xF8\x0E\xBF\xE1_'\xFC\f\xBF\xB3\xD3~$X\\\xEA7v\xF6\x96\xCB\x1C\xC1\xA5\x9EA\x1A\x02c \x02Ā9\xAF\xA8?\xE15\xF0\xB7\xFD\f\xBA'\xFE\f\"\xFF\x00\xE2\xA8\x03\xC6?j++K?\xF8F~\xC9m\f\x1B\xBEջ\xCB@\xBB\xBF\xD5c8\x1C\xF5\xAF\b\xAFo\xFD\xA5\xF5\xAD+X\xFF\x00\x84s\xFB#S\xB1\xBF\xF2\xBE\xD3\xE6}\x96\xE1eٟ+\x1B\xB6\x93\x8C\xE0\xF5\xF4\xAF\x10\xA0\x02\x8A(\xA0\x02\x8A(\xA0\x02\x8A(\xA0\x02\x8A(\xA0\vZO\xFC\x85l\xBF\xEB\xB2\x7F\xE8B\x8A4\x9F\xF9\n\xD9\x7F\xD7d\xFF\x00Ѕ\x14\x00j\xDF\xF2\x15\xBD\xFF\x00\xAE\xCF\xFF\x00\xA1\x1A\xABV\xB5o\xF9\n\xDE\xFF\x00\xD7g\xFF\x00ЍU\xA0\x02\x8A(\xA0\x02\x8A(\xA0\x02\x8A(\xA0\x02\x8A(\xA0\x02\x8A(\xA0\x02\x8A(\xA0\x02\x8A(\xA0\x02\x8A(\xA0\x02\x8A(\xA0\x02\x8A(\xA0\vZO\xFC\x85l\xBF\xEB\xB2\x7F\xE8B\x8A4\x9F\xF9\n\xD9\x7F\xD7d\xFF\x00Ѕ\x14\x00j\xDF\xF2\x15\xBD\xFF\x00\xAE\xCF\xFF\x00\xA1\x1A\xABV\xB5o\xF9\n\xDE\xFF\x00\xD7g\xFF\x00ЍU\xA0\x02\x8A(\xA0\x02\x8A(\xA0\x02\x8A(\xA0\x02\x8A(\xA0\x02\x8A(\xA0\x02\x8A(\xA0\x02\x8A(\xA0\x02\x8A(\xA0\x02\x8A(\xA0\x02\x8A(\xA0\vZO\xFC\x85l\xBF\xEB\xB2\x7F\xE8B\x8A4\x9F\xF9\n\xD9\x7F\xD7d\xFF\x00Ѕ\x14\x01gQ\xB2\xBB\x9BP\xB9\x96\x1Bi\xE4\x8D\xE5fVX\xC9\x04\x12}\xAA\xB7\xF6u\xF7\xFC\xF9\\\xFF\x00ߦ\xFF\x00\n(\xA0\x03\xFB:\xFB\xFE|\xAE\x7F\xEF\xD3\x7F\x85\x1F\xD9\xD7\xDF\xF3\xE5s\xFF\x00~\x9B\xFC(\xA2\x80\x0F\xEC\xEB\xEF\xF9\xF2\xB9\xFF\x00\xBFM\xFE\x14\x7Fg_\x7Fϕ\xCF\xFD\xFAo\xF0\xA2\x8A\x00?\xB3\xAF\xBF\xE7\xCA\xE7\xFE\xFD7\xF8Q\xFD\x9D}\xFF\x00>W?\xF7\xE9\xBF\xC2\x8A(\x00\xFEξ\xFF\x00\x9F+\x9F\xFB\xF4\xDF\xE1G\xF6u\xF7\xFC\xF9\\\xFF\x00ߦ\xFF\x00\n(\xA0\x03\xFB:\xFB\xFE|\xAE\x7F\xEF\xD3\x7F\x85\x1F\xD9\xD7\xDF\xF3\xE5s\xFF\x00~\x9B\xFC(\xA2\x80\x0F\xEC\xEB\xEF\xF9\xF2\xB9\xFF\x00\xBFM\xFE\x14\x7Fg_\x7Fϕ\xCF\xFD\xFAo\xF0\xA2\x8A\x00?\xB3\xAF\xBF\xE7\xCA\xE7\xFE\xFD7\xF8Q\xFD\x9D}\xFF\x00>W?\xF7\xE9\xBF\xC2\x8A(\x00\xFEξ\xFF\x00\x9F+\x9F\xFB\xF4\xDF\xE1G\xF6u\xF7\xFC\xF9\\\xFF\x00ߦ\xFF\x00\n(\xA0\x03\xFB:\xFB\xFE|\xAE\x7F\xEF\xD3\x7F\x85\x1F\xD9\xD7\xDF\xF3\xE5s\xFF\x00~\x9B\xFC(\xA2\x80\x0F\xEC\xEB\xEF\xF9\xF2\xB9\xFF\x00\xBFM\xFE\x14\x7Fg_\x7Fϕ\xCF\xFD\xFAo\xF0\xA2\x8A\x00\xB3\xA7Y]è[K5\xB4\xF1ƒ\xAB34d\x00\x01\x1E\xD4QE\x00\x7F\xFF\xD9", vector(30, 30))
slot_0_58_12 = nil

function slot_0_58_11()
	slot_219_0_0, slot_219_1_0 = slot_0_51_3()
	slot_219_2_0 = slot_0_49_1.value and (slot_219_0_0 or slot_0_38_0.ui_alpha > 0)
	slot_219_3_0 = slot_0_52_4(slot_219_2_0)

	if not slot_219_2_0 and not (slot_219_3_0 > 0) then
		if not slot_0_49_1.value then
			slot_0_29_0("render", slot_0_58_11)
		end

		return
	end

	slot_219_4_0 = slot_0_39_0()
	slot_219_5_0 = vector() + 4 * slot_0_40_0
	slot_219_6_0 = slot_0_56_7.position + slot_219_5_0
	slot_219_7_0 = slot_0_8_0.string("\a[accent]\f<magnifying-glass>  \rSpectators")
	slot_219_8_0 = slot_0_45_0(slot_0_43_0.fonts.content, nil, slot_219_7_0)
	slot_219_9_0 = slot_0_43_0.layout.padding * slot_0_40_0

	slot_0_43_0.render_rect(slot_219_6_0, slot_219_4_0, slot_219_3_0, slot_0_54_5)
	slot_0_43_0.render_text_content(slot_219_6_0 + vector(slot_0_54_5 / 2 - slot_219_8_0.x / 2 + slot_219_9_0.x / 2, slot_219_9_0.y / 2), slot_0_43_0.colors.text.primary:alpha_modulate(255 * slot_219_3_0), nil, slot_219_7_0)

	slot_219_10_0 = 0
	slot_219_11_0 = slot_0_55_6(slot_219_0_0)

	for iter_219_0, iter_219_1 in ipairs(slot_219_1_0) do
		slot_219_10_0 = slot_219_10_0 + iter_219_1.alpha
	end

	slot_219_12_0 = 0
	slot_219_13_0 = 0

	if slot_219_11_0 > 0 then
		slot_0_43_0.render_rect(slot_219_6_0 + vector(0, 30 * slot_0_40_0), slot_219_4_0, slot_219_11_0 * slot_219_3_0, slot_0_54_5, 16 * slot_0_40_0 * slot_219_10_0)

		for iter_219_2, iter_219_3 in ipairs(slot_219_1_0) do
			slot_219_20_0 = slot_0_45_0(slot_0_43_0.fonts.content, nil, iter_219_3.name).x + 10 * slot_0_40_0

			slot_0_43_0.render_text_content(slot_219_6_0 + vector(slot_219_9_0.x / 2 + 16 * slot_0_40_0, 39 * slot_0_40_0 + 16 * slot_0_40_0 * slot_219_12_0), slot_0_43_0.colors.text.primary:alpha_modulate(255 * iter_219_3.alpha * slot_219_3_0), nil, iter_219_3.name)

			slot_219_21_0 = iter_219_3.player:get_steam_avatar()

			if not slot_219_21_0 or slot_219_21_0.resolution < 1 then
				slot_219_21_0 = slot_0_57_10
			end

			render.texture(slot_219_21_0, slot_219_6_0 + vector(slot_219_9_0.x / 2, 39 * slot_0_40_0 + 16 * slot_0_40_0 * slot_219_12_0), vector() + 12 * slot_0_40_0, color(255, 255 * iter_219_3.alpha * slot_219_3_0), 5 * slot_0_40_0)

			if slot_219_13_0 < slot_219_20_0 and slot_219_20_0 > 103 * slot_0_40_0 then
				slot_219_13_0 = slot_219_20_0
			end

			slot_219_12_0 = slot_219_12_0 + iter_219_3.alpha
		end
	end

	slot_0_54_5 = slot_0_53_4(math.max(slot_219_13_0, 103 * slot_0_40_0))

	slot_0_56_7:update(slot_219_3_0, vector(slot_0_54_5 + slot_219_9_0.x + slot_219_5_0.x * 2, 33 * slot_0_40_0))
end

function slot_0_59_9(arg_220_0)
	if arg_220_0.value then
		slot_0_28_0("render", slot_0_58_11)
	end
end

slot_0_49_1:set_callback(slot_0_59_9, true)

slot_0_49_0 = nil
slot_0_50_1 = slot_0_25_0.features.widgets:switch("\v\f<brackets-curly>    \rHotkeys")

slot_0_23_0.new("hotkeys", slot_0_50_1, slot_0_27_0.features.visual)

slot_0_51_2 = {}
slot_0_52_3 = {
	"hold",
	"toggle"
}

function slot_0_53_3(arg_221_0)
	return arg_221_0:gsub("\aDEFAULT", ""):gsub("\a%b{}", ""):gsub("\a%x%x%x%x%x%x%x%x", ""):gsub("[^%w%s]", ""):gsub("^%s+", ""):gsub("%s+$", "")
end

function slot_0_54_4()
	local var_222_0 = false
	local var_222_1 = {}

	for iter_222_0, iter_222_1 in ipairs(slot_0_38_0.binds) do
		local var_222_2 = iter_222_1.active
		local var_222_3 = slot_0_53_3(tostring(iter_222_1.name))
		local var_222_4 = iter_222_1.value

		if type(var_222_4) == "table" then
			local var_222_5 = {}

			for iter_222_2, iter_222_3 in ipairs(var_222_4) do
				table.insert(var_222_5, tostring(iter_222_3):sub(1, 1))
			end

			if #var_222_5 > 0 then
				var_222_4 = table.concat(var_222_5, ", ")
			else
				var_222_4 = true
			end
		end

		if type(var_222_4) == "boolean" then
			var_222_4 = slot_0_52_3[iter_222_1.mode] or "?"
		end

		if var_222_2 then
			var_222_0 = true
		end

		slot_0_51_2[var_222_3] = slot_0_51_2[var_222_3] or {
			alpha = 0,
			name = var_222_3,
			value = var_222_4,
			animate = slot_0_36_0()
		}

		if slot_0_51_2[var_222_3].value ~= var_222_4 then
			slot_0_51_2[var_222_3].value = var_222_4
		end

		slot_0_51_2[var_222_3].alpha = slot_0_51_2[var_222_3].animate(var_222_2)

		if slot_0_51_2[var_222_3].alpha > 0 then
			table.insert(var_222_1, 1, slot_0_51_2[var_222_3])
		end
	end

	return var_222_0, var_222_1
end

slot_0_55_5 = slot_0_36_0()
slot_0_56_6 = slot_0_36_0(95, nil, slot_0_36_0.ease_in_out)
slot_0_57_9 = 103
slot_0_58_10 = slot_0_36_0()
slot_0_59_8 = slot_0_46_0.new("hotkeys", vector(300, 300), vector(100, 44))
slot_0_60_5 = nil

function slot_0_60_4()
	slot_223_0_0, slot_223_1_0 = slot_0_54_4()
	slot_223_2_0 = slot_0_50_1.value and (slot_223_0_0 or slot_0_38_0.ui_alpha > 0)
	slot_223_3_0 = slot_0_55_5(slot_223_2_0)

	if not slot_223_2_0 and not (slot_223_3_0 > 0) then
		if not slot_0_50_1.value then
			slot_0_29_0("render", slot_0_60_4)
		end

		return
	end

	slot_223_4_0 = slot_0_39_0()
	slot_223_5_0 = vector() + 4 * slot_0_40_0
	slot_223_6_0 = slot_0_59_8.position + slot_223_5_0
	slot_223_7_0 = slot_0_8_0.string("\a[accent]\f<brackets-curly>  \rHotkeys")
	slot_223_8_0 = slot_0_45_0(slot_0_43_0.fonts.content, nil, slot_223_7_0)
	slot_223_9_0 = slot_0_43_0.layout.padding * slot_0_40_0

	slot_0_43_0.render_rect(slot_223_6_0, slot_223_4_0, slot_223_3_0, slot_0_57_9)
	slot_0_43_0.render_text_content(slot_223_6_0 + vector(slot_0_57_9 / 2 - slot_223_8_0.x / 2 + slot_223_9_0.x / 2, slot_223_9_0.y / 2), slot_0_43_0.colors.text.primary:alpha_modulate(255 * slot_223_3_0), nil, slot_223_7_0)

	slot_223_10_0 = 0
	slot_223_11_0 = slot_0_58_10(slot_223_0_0)

	for iter_223_0, iter_223_1 in ipairs(slot_223_1_0) do
		slot_223_10_0 = slot_223_10_0 + iter_223_1.alpha
	end

	slot_223_12_0 = 0
	slot_223_13_0 = 0

	if slot_223_11_0 > 0 then
		slot_0_43_0.render_rect(slot_223_6_0 + vector(0, 30 * slot_0_40_0), slot_223_4_0, slot_223_11_0 * slot_223_3_0, slot_0_57_9, 16 * slot_0_40_0 * slot_223_10_0)

		for iter_223_2, iter_223_3 in ipairs(slot_223_1_0) do
			slot_223_19_0 = slot_0_45_0(slot_0_43_0.fonts.content, nil, iter_223_3.name)
			slot_223_20_0 = slot_0_45_0(slot_0_43_0.fonts.content, nil, iter_223_3.value)
			slot_223_21_0 = slot_223_19_0.x + slot_223_20_0.x + 10 * slot_0_40_0

			slot_0_43_0.render_text_content(slot_223_6_0 + vector(slot_223_9_0.x / 2, 39 * slot_0_40_0 + 16 * slot_0_40_0 * slot_223_12_0), slot_0_43_0.colors.text.primary:alpha_modulate(255 * iter_223_3.alpha * slot_223_3_0), nil, iter_223_3.name)
			slot_0_43_0.render_text_content(slot_223_6_0 + vector(slot_0_57_9 + slot_223_9_0.x / 2 - slot_223_20_0.x, 39 * slot_0_40_0 + 16 * slot_0_40_0 * slot_223_12_0), slot_0_43_0.colors.text.primary:alpha_modulate(150 * iter_223_3.alpha * slot_223_3_0), nil, iter_223_3.value)

			if slot_223_13_0 < slot_223_21_0 and slot_223_21_0 > 103 * slot_0_40_0 then
				slot_223_13_0 = slot_223_21_0
			end

			slot_223_12_0 = slot_223_12_0 + iter_223_3.alpha
		end
	end

	slot_0_57_9 = slot_0_56_6(math.max(slot_223_13_0, 103 * slot_0_40_0))

	slot_0_59_8:update(slot_223_3_0, vector(slot_0_57_9 + slot_223_9_0.x + slot_223_5_0.x * 2, 33 * slot_0_40_0))
end

function slot_0_61_5(arg_224_0)
	if arg_224_0.value then
		slot_0_28_0("render", slot_0_60_4)
	end
end

slot_0_50_1:set_callback(slot_0_61_5, true)

slot_0_50_0 = nil
slot_0_51_1 = slot_0_25_0.features.crosshair:switch("\v\f<triangle>     \rCrosshair")

slot_0_23_0.new("crosshair_indicators", slot_0_51_1, slot_0_27_0.features.visual)

slot_0_52_2 = vector(55, 18)
slot_0_53_2 = slot_0_46_0.new_offset("crosshair", vector(slot_0_21_0.x / 2, slot_0_21_0.y / 2), slot_0_52_2, 10, 100, false)
slot_0_54_3 = {}

function slot_0_55_4(arg_225_0, arg_225_1)
	slot_0_54_3[arg_225_0] = {
		off = 0,
		data = {},
		offset = arg_225_1 or 0,
		create = function(arg_226_0, arg_226_1)
			table.insert(arg_226_0.data, setmetatable(arg_226_1, {
				__index = {
					alpha = 0,
					anim_alpha = slot_0_36_0(),
					get = function(arg_227_0)
						return true
					end,
					paint = function(arg_228_0)
						return
					end
				}
			}))
		end
	}

	return slot_0_54_3[arg_225_0]
end

slot_0_56_5 = slot_0_36_0()
slot_0_57_8 = nil

function slot_0_57_7()
	local var_229_0 = slot_0_51_1.value and (slot_0_38_0.is_alive or slot_0_38_0.ui_alpha > 0)
	local var_229_1 = slot_0_56_5(var_229_0)

	if not var_229_0 and not (var_229_1 > 0) then
		if not slot_0_51_1.value then
			slot_0_29_0("render", slot_0_57_7)
		end

		return
	end

	local var_229_2 = 1
	local var_229_3 = vector(slot_0_53_2.position.x + 5 * slot_0_40_0 * slot_0_38_0.anim_scoped, slot_0_53_2.position.y + slot_0_53_2.offset)

	for iter_229_0, iter_229_1 in pairs(slot_0_54_3) do
		local var_229_4 = 0

		for iter_229_2, iter_229_3 in ipairs(iter_229_1.data) do
			local var_229_5 = iter_229_3:get() and var_229_2 == iter_229_0

			iter_229_3.alpha = iter_229_3.anim_alpha(var_229_5) * var_229_1

			if iter_229_3.alpha > 0 then
				iter_229_3:paint(vector(var_229_3.x, var_229_3.y + iter_229_1.offset * slot_0_40_0 * var_229_4), slot_0_38_0.anim_scoped)
			end

			var_229_4 = var_229_4 + iter_229_3.alpha
		end
	end

	slot_0_53_2:update(var_229_1, slot_0_52_2 * slot_0_40_0, 5)
end

function slot_0_58_9(arg_230_0)
	if arg_230_0.value then
		slot_0_28_0("render", slot_0_57_7)
	end
end

slot_0_51_1:set_callback(slot_0_58_9, true)

slot_0_59_7 = slot_0_55_4(1, 10)

slot_0_59_7:create({
	header_text = slot_0_11_0.text_animate("𝒆𝒗𝒂𝒍𝒂𝒕𝒆", -1, {
		slot_0_39_0()
	}),
	paint = function(arg_231_0, arg_231_1, arg_231_2)
		local var_231_0 = slot_0_39_0():alpha_modulate(255 * arg_231_0.alpha)

		arg_231_0.header_text:set_colors({
			var_231_0,
			var_231_0:alpha_modulate(50)
		})
		arg_231_0.header_text:animate()

		local var_231_1 = arg_231_0.header_text:get_animated_text()
		local var_231_2 = slot_0_45_0(slot_0_43_0.fonts.header, "", var_231_1)

		arg_231_1.x = arg_231_1.x - var_231_2.x / 2 * (1 - arg_231_2)

		local var_231_3 = vector(arg_231_1.x, arg_231_1.y + 10 * slot_0_40_0)

		render.shadow(var_231_3, var_231_3 + vector(var_231_2.x, 0), var_231_0, 40 * slot_0_40_0)
		slot_0_43_0.render_text_header(arg_231_1, var_231_0, nil, var_231_1)

		local var_231_4 = rage.antiaim:get_max_desync()
		local var_231_5 = math.min(math.abs(math.normalize_yaw(rage.antiaim:get_rotation(true) - rage.antiaim:get_rotation())), var_231_4) / var_231_4

		if var_231_5 < 0.9 then
			return
		end

		arg_231_1.y = arg_231_1.y + 13 * slot_0_40_0

		local var_231_6 = 1 * slot_0_40_0
		local var_231_7 = var_231_0:alpha_modulate(0)
		local var_231_8 = var_231_2.x / 2

		render.gradient(arg_231_1 + vector(var_231_8, 0), arg_231_1 + vector(var_231_8, 0) - vector(var_231_8 * var_231_5, -var_231_6), var_231_0, var_231_7, var_231_0, var_231_7)
		render.gradient(arg_231_1 + vector(var_231_8, 0), arg_231_1 + vector(var_231_8, 0) + vector(var_231_8 * var_231_5, var_231_6), var_231_0, var_231_7, var_231_0, var_231_7)
	end
})
slot_0_59_7:create({
	get = function(arg_232_0)
		return slot_0_38_0.is_double_tap
	end,
	paint = function(arg_233_0, arg_233_1, arg_233_2)
		local var_233_0 = slot_0_24_0.double_tap:get_override()
		local var_233_1 = var_233_0 ~= nil and var_233_0 == false and 100 or 255
		local var_233_2 = color():alpha_modulate(var_233_1 * arg_233_0.alpha)
		local var_233_3 = color(0):alpha_modulate(50 * arg_233_0.alpha)
		local var_233_4 = "DT"
		local var_233_5 = slot_0_45_0(2, "", var_233_4)

		arg_233_1.x = arg_233_1.x - var_233_5.x / 2 * (1 - arg_233_2) - 4 * slot_0_40_0 * (1 - arg_233_2)
		arg_233_1.y = arg_233_1.y + 5 * slot_0_40_0

		render.text(2, arg_233_1, var_233_2, nil, var_233_4)
		render.circle_outline(arg_233_1 + vector(15, 6) * slot_0_40_0, var_233_3, 3.4 * slot_0_40_0, 0, 1, slot_0_40_0)
		render.circle_outline(arg_233_1 + vector(15, 6) * slot_0_40_0, var_233_2, 3.4 * slot_0_40_0, 0, slot_0_38_0.exploit_charge, slot_0_40_0)
	end
})
slot_0_59_7:create({
	get = function(arg_234_0)
		return slot_0_24_0.hide_shots:get_override() or slot_0_38_0.is_hide_shots
	end,
	paint = function(arg_235_0, arg_235_1, arg_235_2)
		local var_235_0 = slot_0_38_0.is_double_tap and slot_0_24_0.double_tap:get_override() == nil and 100 or 255
		local var_235_1 = color():alpha_modulate(var_235_0 * arg_235_0.alpha)
		local var_235_2 = "HS"
		local var_235_3 = slot_0_45_0(2, "", var_235_2)

		arg_235_1.x = arg_235_1.x - var_235_3.x / 2 * (1 - arg_235_2)
		arg_235_1.y = arg_235_1.y + 5 * slot_0_40_0

		render.text(2, arg_235_1, var_235_1, nil, var_235_2)
	end
})
slot_0_59_7:create({
	get = function(arg_236_0)
		return slot_0_38_0.is_min_damage
	end,
	paint = function(arg_237_0, arg_237_1, arg_237_2)
		local var_237_0 = color():alpha_modulate(255 * arg_237_0.alpha)
		local var_237_1 = "DMG"
		local var_237_2 = slot_0_45_0(2, "", var_237_1)

		arg_237_1.x = arg_237_1.x - var_237_2.x / 2 * (1 - arg_237_2)
		arg_237_1.y = arg_237_1.y + 5 * slot_0_40_0

		render.text(2, arg_237_1, var_237_0, nil, var_237_1)
	end
})

slot_0_51_0 = nil
slot_0_52_1 = slot_0_25_0.features.crosshair:switch("\v\f<hundred-points>     \rDamage", false, nil, function(arg_238_0)
	local var_238_0 = {
		font = arg_238_0:list("\v\f<font>    \rFont", {
			"Base",
			"Pixel",
			"Custom"
		}),
		animate = arg_238_0:switch("\v\f<wave-sine>    \rAnimate", true),
		always_on = arg_238_0:switch(" \v\f<power-off>    \rAlways on", true)
	}

	slot_0_23_0.set_callback_list(var_238_0.font, true)

	return var_238_0, true
end)

slot_0_23_0.new("damage_indicator", slot_0_52_1, slot_0_27_0.features.visual)

slot_0_53_1 = slot_0_46_0.new("damage", vector(slot_0_21_0.x / 2 + 1, slot_0_21_0.y / 2 - 17), vector(25, 14))
slot_0_54_2 = slot_0_36_0()
slot_0_55_3 = slot_0_36_0(0, 0.1, slot_0_36_0.ease_in_out)
slot_0_56_4 = render.load_font("arial", vector(11, 9), "a")
slot_0_57_6 = nil

function slot_0_57_5()
	local var_239_0 = slot_0_52_1.value and (slot_0_38_0.is_alive or slot_0_38_0.ui_alpha > 0)
	local var_239_1 = slot_0_54_2(var_239_0)

	if not var_239_0 and not (var_239_1 > 0) then
		if not slot_0_52_1.value then
			slot_0_29_0("render", slot_0_57_5)
		end

		return
	end

	slot_0_53_1:set_limit(vector(slot_0_21_0.x / 2 - 50, slot_0_21_0.y / 2 - 50), vector(100, 100))

	local var_239_2 = vector()
	local var_239_3 = vector(7, 5) * slot_0_40_0
	local var_239_4 = slot_0_24_0.damage:get()
	local var_239_5 = math.floor(slot_0_55_3(var_239_4))
	local var_239_6 = slot_0_52_1.animate.value and var_239_5 or var_239_4
	local var_239_7 = tostring(var_239_6 == 0 and "A" or var_239_6)
	local var_239_8 = color():alpha_modulate((slot_0_38_0.is_min_damage and 255 or 50 * (slot_0_52_1.always_on.value and 1 or slot_0_38_0.ui_alpha)) * var_239_1)
	local var_239_9 = slot_0_52_1.font.value

	if var_239_9 == 1 then
		var_239_2 = slot_0_45_0(1, "", var_239_7)

		render.text(1, slot_0_53_1.position + var_239_3 / 2, var_239_8, nil, var_239_7)
	end

	if var_239_9 == 2 then
		var_239_2 = slot_0_45_0(2, "", var_239_7)

		render.text(2, slot_0_53_1.position + var_239_3 / 2, var_239_8, nil, var_239_7)
	end

	if var_239_9 == 3 then
		var_239_2 = slot_0_45_0(slot_0_56_4, "", var_239_7)

		render.text(slot_0_56_4, slot_0_53_1.position + var_239_3 / 2, var_239_8, nil, var_239_7)
	end

	slot_0_53_1:update(var_239_1, var_239_2 + var_239_3, 5)
end

function slot_0_58_8(arg_240_0)
	if arg_240_0.value then
		slot_0_28_0("render", slot_0_57_5)
	end
end

slot_0_52_1:set_callback(slot_0_58_8, true)

slot_0_52_0 = nil
slot_0_53_0 = nil
slot_0_54_1 = slot_0_25_0.features.crosshair:switch("\v\f<angle>      \rArrows", false, nil, function(arg_241_0)
	local var_241_0 = {
		style = arg_241_0:list("\v\f<palette>   \rStyle", {
			"\f<location-arrow>    \rPrimed",
			"\f<angles-right>    \rDelicate"
		}),
		always_on = arg_241_0:switch(" \v\f<power-off>    \rAlways on", true)
	}

	slot_0_23_0.set_callback_list(var_241_0.style)

	return var_241_0, true
end)

slot_0_23_0.new("arrows", slot_0_54_1, slot_0_27_0.features.visual)

slot_0_55_2 = slot_0_46_0.new_offset("arrows", vector(slot_0_21_0.x / 2, slot_0_21_0.y / 2), vector(15, 15), 30, 100, true, true)
slot_0_56_3 = {
	primed = {
		left = render.load_image("<svg width=\"39\" height=\"45\" viewBox=\"0 0 39 45\" fill=\"none\" xmlns=\"http://www.w3.org/2000/svg\"> <path d=\"M34.41 1.07819C36.8485 -0.329653 39.7081 2.09415 38.7188 4.73032L32.3794 21.6229C32.1244 22.3024 32.1244 23.0514 32.3794 23.731L38.7188 40.6235C39.7081 43.2597 36.8485 45.6835 34.41 44.2756L1.49996 25.275C-0.500042 24.1203 -0.500043 21.2335 1.49996 20.0788L34.41 1.07819Z\" fill=\"white\"/> </svg>", vector() + 10),
		right = render.load_image("<svg width=\"39\" height=\"45\" viewBox=\"0 0 39 45\" fill=\"none\" xmlns=\"http://www.w3.org/2000/svg\"> <path d=\"M4.58032 44.3833C2.14187 45.7912 -0.717708 43.3674 0.271586 40.7312L6.61098 23.8387C6.866 23.1591 6.866 22.4101 6.61098 21.7306L0.271582 4.83803C-0.717712 2.20186 2.14186 -0.221952 4.58031 1.18589L37.4904 20.1865C39.4904 21.3412 39.4904 24.228 37.4904 25.3827L4.58032 44.3833Z\" fill=\"white\"/> </svg>", vector() + 10)
	},
	delicate = {
		left = render.load_image("<svg width=\"5\" height=\"10\" viewBox=\"0 0 5 10\" fill=\"none\" xmlns=\"http://www.w3.org/2000/svg\"><path d=\"M5 0L2 0L0 4.5L0 5.5L2 10H5L3 5.5L3 5L3 4.5L5 0Z\" fill=\"white\"/></svg>", vector(5, 10)),
		right = render.load_image("<svg width=\"5\" height=\"10\" viewBox=\"0 0 5 10\" fill=\"none\" xmlns=\"http://www.w3.org/2000/svg\"><path d=\"M0 10L3 10L5 5.5L5 4.5L3 -1.74846e-07L8.74228e-07 -4.37114e-07L2 4.5L2 5L2 5.5L0 10Z\" fill=\"white\"/></svg>", vector(5, 10))
	}
}
slot_0_57_4 = slot_0_36_0()
slot_0_58_7 = nil

function slot_0_58_6()
	local var_242_0 = slot_0_54_1.value and (slot_0_38_0.is_alive or slot_0_38_0.ui_alpha > 0)
	local var_242_1 = slot_0_57_4(var_242_0)

	if not var_242_0 and not (var_242_1 > 0) then
		if not slot_0_54_1.value then
			slot_0_29_0("render", slot_0_58_6)
		end

		return
	end

	slot_0_55_2:update(var_242_1, vector() + 15 * slot_0_40_0, 4)

	local var_242_2 = slot_0_39_0():alpha_modulate(255 * var_242_1)
	local var_242_3 = slot_0_54_1.style.value
	local var_242_4 = slot_0_55_2.offset
	local var_242_5 = slot_0_55_2.position - vector(0, 12 * slot_0_40_0 * slot_0_38_0.anim_scoped)
	local var_242_6 = slot_0_52_0 and slot_0_52_0.value
	local var_242_7 = var_242_6 == "Left"
	local var_242_8 = var_242_6 == "Right"
	local var_242_9 = color(0, 75 * (slot_0_54_1.always_on.value and 1 or slot_0_38_0.ui_alpha) * var_242_1)
	local var_242_10 = var_242_7 and var_242_2 or var_242_9
	local var_242_11 = var_242_8 and var_242_2 or var_242_9

	if var_242_3 == 1 then
		local var_242_12 = vector() + 10 * slot_0_40_0

		render.texture(slot_0_56_3.primed.left, vector(var_242_5.x - var_242_4 - 5 * slot_0_40_0, var_242_5.y - 5 * slot_0_40_0), var_242_12, var_242_10)
		render.texture(slot_0_56_3.primed.right, vector(var_242_5.x + var_242_4 - 5 * slot_0_40_0, var_242_5.y - 5 * slot_0_40_0), var_242_12, var_242_11)
	end

	if var_242_3 == 2 then
		local var_242_13 = vector(5, 10) * slot_0_40_0

		render.texture(slot_0_56_3.delicate.left, vector(var_242_5.x - var_242_4 - 2.5 * slot_0_40_0, var_242_5.y - 5 * slot_0_40_0), var_242_13, var_242_10)
		render.texture(slot_0_56_3.delicate.right, vector(var_242_5.x + var_242_4 - 2.5 * slot_0_40_0, var_242_5.y - 5 * slot_0_40_0), var_242_13, var_242_11)
	end
end

function slot_0_59_6(arg_243_0)
	if arg_243_0.value then
		slot_0_28_0("render", slot_0_58_6)
	end
end

slot_0_54_1:set_callback(slot_0_59_6, true)

slot_0_54_0 = nil
slot_0_55_1 = slot_0_25_0.features.crosshair:switch("\v\f<scribble>     \rScope", false, nil, function(arg_244_0)
	local var_244_0 = {
		gap = arg_244_0:slider("\v\f<circle-arrow-up-right>    \rGap", 0, 100, 5, 1, "px"),
		length = arg_244_0:slider("\v\f<ruler>    \rLength", 0, 300, 55, 1, "px"),
		invert = arg_244_0:switch("\v\f<arrow-up-arrow-down>     \rInvert"),
		custom_color = arg_244_0:switch("\v\f<palette>    \rCustom color", false, "Enable to use custom color instead of accent color", color(255, 121))
	}

	var_244_0.custom_color.color:depend(var_244_0.custom_color)

	return var_244_0, true
end)

slot_0_23_0.new("scope_lines", slot_0_55_1, slot_0_27_0.features.visual)

slot_0_56_2 = slot_0_36_0(nil, 0.15, slot_0_36_0.ease_in_out)
slot_0_57_3 = slot_0_36_0(nil, 0.3, slot_0_36_0.ease_in_out)
slot_0_58_5 = nil

function slot_0_58_4()
	local var_245_0 = slot_0_55_1.value and slot_0_38_0.is_scoped
	local var_245_1 = slot_0_16_0(slot_0_56_2(var_245_0 and 1.1 or 0), 0, 1)

	if not var_245_0 and not (var_245_1 > 0) then
		if not slot_0_55_1.value then
			slot_0_24_0.scope_overlay:override()
			slot_0_29_0("render", slot_0_58_4)
		end

		return
	end

	slot_0_24_0.scope_overlay:override("Remove All")

	local var_245_2 = slot_0_21_0 / 2
	local var_245_3 = slot_0_55_1.gap.value * var_245_1
	local var_245_4 = slot_0_55_1.length.value * var_245_1
	local var_245_5 = math.max(slot_0_40_0, 1)
	local var_245_6 = slot_0_39_0()

	if slot_0_55_1.custom_color.value then
		var_245_6 = slot_0_55_1.custom_color.color.value
	end

	local var_245_7 = slot_0_57_3(slot_0_55_1.invert.value)
	local var_245_8 = var_245_6:alpha_modulate(var_245_6.a * var_245_1 * (1 - var_245_7))
	local var_245_9 = var_245_6:alpha_modulate(var_245_6.a * var_245_1 * var_245_7)

	render.gradient(vector(var_245_2.x - var_245_3 + var_245_5, var_245_2.y), vector(var_245_2.x - var_245_3 - var_245_4 + var_245_5, var_245_2.y + var_245_5), var_245_8, var_245_9, var_245_8, var_245_9)
	render.gradient(vector(var_245_2.x + var_245_3, var_245_2.y), vector(var_245_2.x + var_245_3 + var_245_4, var_245_2.y + var_245_5), var_245_8, var_245_9, var_245_8, var_245_9)
	render.gradient(vector(var_245_2.x, var_245_2.y + var_245_3), vector(var_245_2.x + var_245_5, var_245_2.y + var_245_3 + var_245_4), var_245_8, var_245_8, var_245_9, var_245_9)
	render.gradient(vector(var_245_2.x, var_245_2.y - var_245_3 + var_245_5), vector(var_245_2.x + var_245_5, var_245_2.y - var_245_3 - var_245_4 + var_245_5), var_245_8, var_245_8, var_245_9, var_245_9)
end

function slot_0_59_5(arg_246_0)
	if arg_246_0.value then
		slot_0_28_0("render", slot_0_58_4)
	end
end

slot_0_55_1:set_callback(slot_0_59_5, true)

slot_0_55_0 = {}
slot_0_56_1 = {}
slot_0_57_2 = 0
slot_0_58_3 = slot_0_36_0()
slot_0_59_4 = slot_0_36_0()
slot_0_60_3 = slot_0_46_0.new_offset("stack", vector(slot_0_21_0.x / 2, 0), vector(100, 44), slot_0_21_0.y / 3, slot_0_21_0.y, false)

function slot_0_61_4()
	for iter_247_0, iter_247_1 in ipairs(slot_0_56_1) do
		if iter_247_1.element:get() then
			return true
		end
	end

	return false
end

slot_0_62_6 = nil

function slot_0_62_5()
	local var_248_0 = slot_0_61_4()
	local var_248_1 = var_248_0 and (slot_0_38_0.is_alive or slot_0_38_0.ui_alpha > 0)
	local var_248_2 = slot_0_58_3(var_248_1)

	if not (var_248_2 > 0) then
		if not var_248_0 then
			slot_0_29_0("render", slot_0_62_5)
		end

		return
	end

	slot_0_57_2 = 0

	local var_248_3 = 0
	local var_248_4 = slot_0_60_3.position + vector(0, slot_0_60_3.offset) + vector(0, 4) * slot_0_40_0

	for iter_248_0, iter_248_1 in ipairs(slot_0_56_1) do
		iter_248_1:paint(var_248_4, var_248_3, var_248_2)

		iter_248_1.alpha = iter_248_1.alpha * var_248_2

		if iter_248_1.alpha > 0 and iter_248_1.width > slot_0_57_2 then
			slot_0_57_2 = iter_248_1.width
		end

		var_248_3 = var_248_3 + iter_248_1.alpha
	end

	local var_248_5 = slot_0_59_4(slot_0_57_2 + 8 * slot_0_40_0)

	slot_0_60_3:update(var_248_2, vector(var_248_5, 33 * slot_0_40_0 * var_248_3), 16)
end

function slot_0_63_5(arg_249_0)
	if arg_249_0.value then
		slot_0_28_0("render", slot_0_62_5)
	end
end

function slot_0_55_0.create(arg_250_0, arg_250_1, arg_250_2, arg_250_3)
	local var_250_0 = {
		alpha = 0,
		width = 0,
		anim_alpha = slot_0_36_0(),
		name = arg_250_1,
		element = arg_250_2,
		paint = function(arg_251_0, arg_251_1, arg_251_2)
			return
		end
	}

	arg_250_2:set_callback(slot_0_63_5, true)

	slot_0_56_1[#slot_0_56_1 + 1] = setmetatable(arg_250_3, {
		__index = var_250_0
	})
end

slot_0_56_0 = nil
slot_0_57_1 = slot_0_25_0.features.stack:switch("\v\f<person-running>     \rSlow down")

slot_0_23_0.new("slow_down", slot_0_57_1, slot_0_27_0.features.visual)

slot_0_58_2 = {
	person = slot_0_8_0.string("\f<person>"),
	person_running = slot_0_8_0.string("\f<person-running>")
}
slot_0_59_3 = {
	white = color(),
	red = color(255, 0, 0),
	yellow = color(213, 197, 84)
}

slot_0_55_0:create("slow_down", slot_0_57_1, {
	anim_velocity_modifier = slot_0_36_0(),
	paint = function(arg_252_0, arg_252_1, arg_252_2, arg_252_3)
		local var_252_0 = slot_0_38_0.me
		local var_252_1 = 110 * slot_0_40_0
		local var_252_2 = arg_252_0.anim_velocity_modifier(var_252_0 and slot_0_37_0(var_252_0) and var_252_0.m_flVelocityModifier or 0)

		arg_252_0.alpha = arg_252_0.anim_alpha(slot_0_57_1.value and (var_252_2 < 1 or slot_0_38_0.ui_alpha > 0))

		if not (arg_252_0.alpha > 0) then
			return
		end

		local var_252_3 = (var_252_2 >= 0.7 and slot_0_59_3.white:lerp(slot_0_59_3.yellow, (1 - var_252_2) / 0.3) or slot_0_59_3.yellow:lerp(slot_0_59_3.red, (0.7 - var_252_2) / 0.7)):alpha_modulate(255 * arg_252_0.alpha)
		local var_252_4 = slot_0_43_0.layout.padding * slot_0_40_0
		local var_252_5 = arg_252_1 - vector(var_252_4.x / 2 + var_252_1 / 2, 0) + vector(0, 32 * slot_0_40_0 * arg_252_2)

		slot_0_43_0.render_rect(var_252_5, var_252_3, arg_252_0.alpha, var_252_1)
		slot_0_43_0.render_text_content(var_252_5 + var_252_4 / 2, var_252_3, nil, slot_0_58_2.person_running)
		slot_0_43_0.render_text_content(var_252_5 + vector(var_252_1 + var_252_4.x / 2, var_252_4.y / 2), var_252_3, "r", slot_0_58_2.person)

		local var_252_6 = var_252_1 - 23 * slot_0_40_0
		local var_252_7 = var_252_6 * (1 - var_252_2)
		local var_252_8 = var_252_5 + vector(25, 11) * slot_0_40_0

		render.rect(var_252_8, var_252_8 + vector(var_252_6, 3), color(255, 30 * arg_252_0.alpha), 4 * slot_0_40_0)

		if var_252_7 > 0 then
			render.rect(var_252_8, var_252_8 + vector(var_252_7, 3 * slot_0_40_0), var_252_3, 4 * slot_0_40_0)
		end

		arg_252_0.width = var_252_1 + var_252_4.x
	end
})

slot_0_57_0 = nil
slot_0_58_1 = slot_0_25_0.features.stack:switch("\v\f<snowflake>    \rFake lag", false, nil, function(arg_253_0)
	local var_253_0 = {
		style = arg_253_0:list("\v\f<palette>   \rStyle", {
			"\f<bars-filter>     Lines",
			"\f<circle-o>    Circle"
		})
	}

	slot_0_23_0.set_callback_list(var_253_0.style)

	return var_253_0, true
end)

slot_0_23_0.new("fl_indicator", slot_0_58_1, slot_0_27_0.features.visual)

slot_0_59_2 = 2.5
slot_0_60_2 = 0
slot_0_61_3 = 0
slot_0_62_4 = {}

slot_0_58_1:set_event("createmove", function(arg_254_0)
	slot_0_61_3 = arg_254_0.choked_commands

	if slot_0_61_3 > 3 then
		slot_0_60_2 = slot_0_38_0.realtime
	end

	table.insert(slot_0_62_4, arg_254_0.choked_commands)

	if #slot_0_62_4 > 14 then
		table.remove(slot_0_62_4, 1)
	end
end)
slot_0_55_0:create("FL", slot_0_58_1, {
	anim_velocity_modifier = slot_0_36_0(),
	paint = function(arg_255_0, arg_255_1, arg_255_2, arg_255_3)
		arg_255_0.alpha = arg_255_0.anim_alpha(slot_0_58_1.value and (slot_0_60_2 + slot_0_59_2 > slot_0_38_0.realtime or slot_0_38_0.ui_alpha > 0))

		if not (arg_255_0.alpha > 0) then
			return
		end

		local var_255_0 = slot_0_39_0():alpha_modulate(255 * arg_255_0.alpha)
		local var_255_1 = slot_0_58_1.style.value
		local var_255_2 = slot_0_8_0.string("\a[accent]\f<snowflake>  \rFL")
		local var_255_3 = slot_0_45_0(slot_0_43_0.fonts.content, nil, var_255_2)
		local var_255_4 = slot_0_43_0.layout.padding * slot_0_40_0
		local var_255_5 = var_255_3.x + (var_255_1 == 1 and 35 or 20) * slot_0_40_0
		local var_255_6 = arg_255_1 - vector(var_255_4.x / 2 + var_255_5 / 2, 0) + vector(0, 32 * slot_0_40_0 * arg_255_2)

		slot_0_43_0.render_rect(var_255_6, var_255_0, arg_255_0.alpha, var_255_5)
		slot_0_43_0.render_text_content(var_255_6 + var_255_4 / 2, color(255, 255 * arg_255_0.alpha), nil, var_255_2)

		if var_255_1 == 1 then
			for iter_255_0, iter_255_1 in ipairs(slot_0_62_4) do
				local var_255_7 = 8 * (iter_255_1 / 14) * slot_0_40_0
				local var_255_8 = var_255_6 + var_255_4 / 2 + vector(1 + 2 * iter_255_0, 0) * slot_0_40_0 - vector(0, var_255_7 / 2) + vector(var_255_3.x + 5 * slot_0_40_0, 6 * slot_0_40_0)
				local var_255_9 = vector(1, var_255_7)

				render.rect(var_255_8, var_255_8 + var_255_9, var_255_0)
			end
		end

		if var_255_1 == 2 then
			local var_255_10 = var_255_6 + var_255_4 / 2 + vector(var_255_3.x + 14 * slot_0_40_0, 6 * slot_0_40_0)
			local var_255_11 = 9 * (slot_0_61_3 / 14) * slot_0_40_0

			render.circle(var_255_10, var_255_0, 2, 0, 1)
			render.circle_outline(var_255_10, var_255_0, var_255_11, 0, 1, 1)
		end

		arg_255_0.width = var_255_5 + var_255_4.x
	end
})

slot_0_58_0 = nil
slot_0_59_1 = slot_0_25_0.features.stack:switch("\v\f<wind>    \rExploit")

slot_0_23_0.new("exp_indicator", slot_0_59_1, slot_0_27_0.features.visual)
slot_0_55_0:create("EXP", slot_0_59_1, {
	anim_is_defensive = slot_0_36_0(0, 0.12, slot_0_36_0.ease_in_out),
	paint = function(arg_256_0, arg_256_1, arg_256_2, arg_256_3)
		local var_256_0 = slot_0_38_0.is_double_tap or slot_0_38_0.is_hide_shots

		arg_256_0.alpha = arg_256_0.anim_alpha(slot_0_59_1.value and (var_256_0 or slot_0_38_0.ui_alpha > 0))

		if not (arg_256_0.alpha > 0) then
			return
		end

		local var_256_1 = arg_256_0.anim_is_defensive(not slot_0_38_0.is_defensive)
		local var_256_2 = slot_0_39_0():alpha_modulate(255 * arg_256_0.alpha)
		local var_256_3 = slot_0_8_0.string("\a[accent]\f<wind>  \rEX")
		local var_256_4 = slot_0_45_0(slot_0_43_0.fonts.content, nil, var_256_3)
		local var_256_5 = var_256_4.x + 15 * slot_0_40_0
		local var_256_6 = slot_0_43_0.layout.padding * slot_0_40_0
		local var_256_7 = arg_256_1 - vector(var_256_6.x / 2 + var_256_5 / 2, 0) + vector(0, 32 * slot_0_40_0 * arg_256_2)

		slot_0_43_0.render_rect(var_256_7, var_256_2, arg_256_0.alpha, var_256_5)
		slot_0_43_0.render_text_content(var_256_7 + var_256_6 / 2, color(255, 255 * arg_256_0.alpha), nil, var_256_3)

		local var_256_8 = var_256_7 + var_256_6 / 2 + vector(var_256_4.x + 11 * slot_0_40_0, 6 * slot_0_40_0)

		render.circle_outline(var_256_8, color(0, 25 * arg_256_0.alpha), 6 * slot_0_40_0, 0, 1, 2 * slot_0_40_0)
		render.circle_outline(var_256_8, var_256_2, 6 * slot_0_40_0, 0, slot_0_38_0.exploit_charge * var_256_1, 2 * slot_0_40_0)

		arg_256_0.width = var_256_5 + var_256_6.x
	end
})

slot_0_59_0 = nil
slot_0_60_1 = {
	"fov",
	"offset_x",
	"offset_y",
	"offset_z"
}
slot_0_61_2 = slot_0_25_0.features.world:switch("\v\f<hand>     \rViewmodel", false, nil, function(arg_257_0)
	local var_257_0 = {
		fov = arg_257_0:slider("## fov", 0, 1500, 680, 0.1),
		offset_x = arg_257_0:slider("## x", -100, 100, 25, 0.1),
		offset_y = arg_257_0:slider("## y", -100, 100, 0, 0.1),
		offset_z = arg_257_0:slider("## z", -100, 100, -20, 0.1),
		opposite_knife = arg_257_0:switch("\v\f<sword>    \rOpposite knife")
	}

	arg_257_0:label("\v\f<rotate-right>    \rReset")

	var_257_0.reset = arg_257_0:button("   \v\f<rotate-right>   ", nil, true)

	local function var_257_1()
		for iter_258_0, iter_258_1 in ipairs(slot_0_60_1) do
			var_257_0[iter_258_1]:reset()
		end
	end

	var_257_0.reset:set_callback(var_257_1)

	return var_257_0, true
end)

slot_0_23_0.new("viewmodel", slot_0_61_2, slot_0_27_0.features.visual)

slot_0_62_3 = {
	fov = cvar.viewmodel_fov,
	offset_x = cvar.viewmodel_offset_x,
	offset_y = cvar.viewmodel_offset_y,
	offset_z = cvar.viewmodel_offset_z,
	cl_righthand = cvar.cl_righthand
}
slot_0_63_4 = {
	fov = slot_0_62_3.fov:float(),
	offset_x = slot_0_62_3.offset_x:float(),
	offset_y = slot_0_62_3.offset_y:float(),
	offset_z = slot_0_62_3.offset_z:float(),
	righthand = slot_0_62_3.cl_righthand:int()
}

function slot_0_64_5()
	slot_0_62_3.fov:float(slot_0_63_4.fov, true)
	slot_0_62_3.offset_x:float(slot_0_63_4.offset_x, true)
	slot_0_62_3.offset_y:float(slot_0_63_4.offset_y, true)
	slot_0_62_3.offset_z:float(slot_0_63_4.offset_z, true)
	slot_0_62_3.cl_righthand:int(slot_0_63_4.righthand, true)
end

slot_0_65_6 = {
	fov = slot_0_63_4.fov,
	offset_x = slot_0_63_4.offset_x,
	offset_y = slot_0_63_4.offset_y,
	offset_z = slot_0_63_4.offset_z
}
slot_0_66_5 = nil

function slot_0_66_4()
	local var_260_0 = slot_0_61_2.value
	local var_260_1 = 0

	for iter_260_0, iter_260_1 in ipairs(slot_0_60_1) do
		local var_260_2 = var_260_0 and slot_0_61_2[iter_260_1].value * 0.1 or slot_0_63_4[iter_260_1]

		slot_0_65_6[iter_260_1] = slot_0_44_0(slot_0_65_6[iter_260_1], var_260_2, 10)

		if var_260_2 == slot_0_65_6[iter_260_1] and slot_0_65_6[iter_260_1] == slot_0_62_3[iter_260_1]:float() then
			var_260_1 = var_260_1 + 1
		else
			slot_0_62_3[iter_260_1]:float(slot_0_65_6[iter_260_1], true)
		end
	end

	if var_260_1 >= #slot_0_60_1 then
		if not var_260_0 then
			slot_0_64_5()
		end

		slot_0_29_0("render", slot_0_66_4)
	end
end

function slot_0_67_4()
	slot_0_28_0("render", slot_0_66_4)
end

events.shutdown(slot_0_64_5)
slot_0_61_2:set_callback(slot_0_67_4, true)
slot_0_61_2.fov:set_callback(slot_0_67_4)
slot_0_61_2.offset_x:set_callback(slot_0_67_4)
slot_0_61_2.offset_y:set_callback(slot_0_67_4)
slot_0_61_2.offset_z:set_callback(slot_0_67_4)

function slot_0_68_4(arg_262_0)
	local var_262_0 = slot_0_38_0.weapon_info

	if arg_262_0.weaponselect ~= 0 or var_262_0 == nil then
		return
	end

	local var_262_1 = var_262_0.weapon_type == 0
	local var_262_2 = slot_0_63_4.righthand == 1 and 0 or 1

	slot_0_62_3.cl_righthand:int(var_262_1 and var_262_2 or slot_0_63_4.righthand, true)
end

function slot_0_69_4(arg_263_0, arg_263_1, arg_263_2)
	if slot_0_61_2:get() and slot_0_61_2.opposite_knife:get() then
		slot_0_63_4.righthand = tonumber(arg_263_2)
	end
end

function slot_0_70_6()
	if slot_0_61_2:get() and slot_0_61_2.opposite_knife:get() then
		slot_0_28_0("createmove", slot_0_68_4)
		slot_0_62_3.cl_righthand:set_callback(slot_0_69_4)
	else
		slot_0_29_0("createmove", slot_0_68_4)
		slot_0_62_3.cl_righthand:unset_callback(slot_0_69_4)
		slot_0_62_3.cl_righthand:int(slot_0_63_4.righthand, true)
	end
end

slot_0_61_2:set_callback(slot_0_70_6, true)
slot_0_61_2.opposite_knife:set_callback(slot_0_70_6)

slot_0_60_0 = nil
slot_0_61_1 = slot_0_25_0.features.world:switch("\v\f<expand-wide>     \rAspect ratio", false, nil, function(arg_265_0)
	return {
		amount = arg_265_0:slider("", 100, 250, 140, 0.01)
	}, true
end)

slot_0_23_0.new("aspect_ratio", slot_0_61_1, slot_0_27_0.features.visual)

slot_0_62_2 = 1.78
slot_0_63_3 = cvar.r_aspectratio

function slot_0_64_4()
	slot_0_63_3:int(0)
end

slot_0_65_5 = nil

function slot_0_65_4()
	local var_267_0 = slot_0_61_1.value and slot_0_61_1.amount.value * 0.01 or 1.78

	slot_0_62_2 = slot_0_44_0(slot_0_62_2, var_267_0, 10)

	if slot_0_63_3:float() == slot_0_62_2 then
		if not slot_0_61_1.value then
			slot_0_64_4()
		end

		slot_0_29_0("render", slot_0_65_4)
	else
		slot_0_63_3:float(slot_0_62_2, true)
	end
end

function slot_0_66_3()
	slot_0_28_0("render", slot_0_65_4)
end

slot_0_61_1:set_event("shutdown", slot_0_64_4)
slot_0_61_1:set_callback(slot_0_66_3, true)
slot_0_61_1.amount:set_callback(slot_0_66_3, true)

slot_0_61_0 = nil
slot_0_62_1 = slot_0_25_0.features.breakers:switch(" \v\f<person-skating>     \rAnim. breaker", false, nil, function(arg_269_0)
	local var_269_0 = {
		air = arg_269_0:combo("\v\f<arrow-up>    \rAir", {
			"None",
			"Static",
			"Walking"
		}),
		move = arg_269_0:combo("\v\f<arrow-down>    \rGround", {
			"None",
			"Slide",
			"Shake",
			"Walking"
		}),
		other = arg_269_0:selectable("\v\f<code-compare>    \rOther", {
			"Flashed",
			"Move lean",
			"Landing pitch",
			"Static creeping"
		})
	}

	var_269_0.lean_weight = arg_269_0:slider("\a[grey]\f<angle>     \rLean weight", 0, 100, 100, 1, "%"):depend({
		var_269_0.other,
		"Move lean"
	})

	return var_269_0, true
end)

slot_0_23_0.new("anim_breaker", slot_0_62_1, slot_0_27_0.features.visual)

slot_0_63_2 = ffi.typeof("        struct {\t\t\t\t\t\t\t\t\t\tchar pad_0x0000[0x18];\n            int\tsequence;\n            float\t\tprev_cycle;\n            float\t\tweight;\n            float\t\tweight_delta_rate;\n            float\t\tplayback_rate;\n            float\t\tcycle;\n            void\t\t*entity;\t\t\t\t\t\tchar pad_0x0038[0x4];\n        } **\n    ")

function slot_0_64_3(arg_270_0)
	local var_270_0 = slot_0_38_0.me
	local var_270_1 = slot_0_38_0.anim_state

	if not var_270_0 or not var_270_1 or not slot_0_37_0(var_270_0) then
		return
	end

	if arg_270_0 ~= var_270_0 then
		return
	end

	slot_0_24_0.movement:override()

	local var_270_2 = ffi.cast(slot_0_63_2, ffi.cast("uintptr_t", arg_270_0[0]) + 10640)[0]
	local var_270_3 = not var_270_1.on_ground

	if slot_0_62_1.move.value == "Slide" then
		slot_0_24_0.movement:override("Sliding")

		var_270_0.m_flPoseParameter[0] = 0
	end

	if slot_0_62_1.move.value == "Walking" then
		slot_0_24_0.movement:override("Walking")

		var_270_0.m_flPoseParameter[7] = 0
	end

	if slot_0_62_1.move.value == "Shake" then
		slot_0_24_0.movement:override("Sliding")

		var_270_0.m_flPoseParameter[0] = globals.tickcount % 4 > 1 and 0.5 or 0
	end

	if slot_0_62_1.air.value == "Static" then
		var_270_0.m_flPoseParameter[6] = 1
	end

	if slot_0_62_1.air.value == "Walking" and var_270_3 then
		var_270_2[6].weight = 1
		var_270_0.m_flPoseParameter[7] = 0
	end

	if slot_0_62_1.other:get(1) then
		var_270_2[0].sequence = 227
	end

	if slot_0_62_1.other:get(2) then
		var_270_2[12].weight = slot_0_62_1.lean_weight.value * 0.01
	end

	if slot_0_62_1.other:get(3) and var_270_1.landing and not var_270_3 then
		var_270_0.m_flPoseParameter[12] = 0.5
	end

	if slot_0_62_1.other:get(4) then
		var_270_0.m_flPoseParameter[8] = 0
	end
end

function slot_0_65_3()
	slot_0_24_0.movement:override()
end

slot_0_62_1:set_event("post_update_clientside_animation", slot_0_64_3)
events.shutdown(slot_0_65_3)
slot_0_62_1:set_callback(function(arg_272_0)
	if not arg_272_0.value then
		slot_0_65_3()
	end
end)

slot_0_62_0 = nil
slot_0_63_1 = slot_0_25_0.features.movement:switch("\v\f<line-height>    \rFast ladder")

slot_0_63_1:tooltip("\v\f<circle-info>   \rAllow you to climb ladders more quickly")
slot_0_23_0.new("fast_ladder", slot_0_63_1, slot_0_27_0.features.misc)

function slot_0_64_2(arg_273_0)
	local var_273_0 = slot_0_38_0.me

	if not var_273_0 or not slot_0_38_0.is_alive then
		return
	end

	if var_273_0.m_MoveType ~= 9 then
		return
	end

	if arg_273_0.forwardmove > 0 then
		if arg_273_0.view_angles.x < 45 then
			arg_273_0.view_angles.x = 89
			arg_273_0.in_moveright = 1
			arg_273_0.in_moveleft = 0
			arg_273_0.in_forward = 0
			arg_273_0.in_back = 1

			if arg_273_0.sidemove == 0 then
				arg_273_0.view_angles.y = arg_273_0.view_angles.y + 90
			end

			if arg_273_0.sidemove < 0 then
				arg_273_0.view_angles.y = arg_273_0.view_angles.y + 150
			end

			if arg_273_0.sidemove > 0 then
				arg_273_0.view_angles.y = arg_273_0.view_angles.y + 30
			end
		end
	elseif arg_273_0.forwardmove < 0 then
		arg_273_0.view_angles.x = 89
		arg_273_0.in_moveleft = 1
		arg_273_0.in_moveright = 0
		arg_273_0.in_forward = 1
		arg_273_0.in_back = 0

		if arg_273_0.sidemove == 0 then
			arg_273_0.view_angles.y = arg_273_0.view_angles.y + 90
		end

		if arg_273_0.sidemove > 0 then
			arg_273_0.view_angles.y = arg_273_0.view_angles.y + 150
		end

		if arg_273_0.sidemove < 0 then
			arg_273_0.view_angles.y = arg_273_0.view_angles.y + 30
		end
	end
end

slot_0_63_1:set_event("createmove", slot_0_64_2)

slot_0_63_0 = nil
slot_0_64_1 = slot_0_25_0.features.movement:switch(" \v\f<person-falling>    \rNo fall damage")

slot_0_64_1:tooltip("\v\f<circle-info>   \rAvoid getting hit when falling from a height when possible")
slot_0_23_0.new("no_fall_damage", slot_0_64_1, slot_0_27_0.features.misc)

function slot_0_65_2(arg_274_0)
	local var_274_0 = slot_0_38_0.me
	local var_274_1 = slot_0_38_0.origin

	if not var_274_0 or not var_274_1 then
		return
	end

	if var_274_0.m_vecVelocity.z <= -500 then
		if utils.trace_line(var_274_1, var_274_1 - vector(0, 0, 15)).fraction ~= 1 then
			arg_274_0.in_duck = 0
		elseif utils.trace_line(var_274_1, var_274_1 - vector(0, 0, 50)).fraction ~= 1 then
			arg_274_0.in_duck = 1
		end
	end
end

slot_0_64_1:set_event("createmove", slot_0_65_2)

slot_0_64_0 = nil
slot_0_65_1 = slot_0_25_0.features.movement:switch("\v\f<person-walking-arrow-loop-left>    \rAvoid collisions")

slot_0_65_1:tooltip("\v\f<circle-info>   \rAvoid getting hit when falling from a height when possible")
slot_0_23_0.new("avoid_collisions", slot_0_65_1, slot_0_27_0.features.misc)

function slot_0_66_2(arg_275_0, arg_275_1)
	return vector():angles(arg_275_0, arg_275_1)
end

function slot_0_67_3(arg_276_0)
	local var_276_0 = slot_0_38_0.me
	local var_276_1 = slot_0_38_0.origin
	local var_276_2 = slot_0_38_0.camera_angles

	if not var_276_0 or not var_276_1 or not var_276_2 then
		return
	end

	local var_276_3 = var_276_0.m_vecVelocity:length()
	local var_276_4 = 7
	local var_276_5 = math.huge
	local var_276_6 = math.huge

	for iter_276_0 = 20, 180, 20 do
		local var_276_7 = slot_0_66_2(0, var_276_2.y + iter_276_0 - 90).x
		local var_276_8 = slot_0_66_2(0, var_276_2.y + iter_276_0 - 90).y
		local var_276_9 = slot_0_66_2(0, var_276_2.y).z
		local var_276_10 = var_276_1.x + var_276_7 * 70
		local var_276_11 = var_276_1.y + var_276_8 * 70
		local var_276_12 = var_276_1.z + 60
		local var_276_13 = utils.trace_line(var_276_1, vector(var_276_10, var_276_11, var_276_12), nil, nil, 1)

		if var_276_5 > var_276_1:dist(var_276_13.end_pos) then
			var_276_5 = var_276_1:dist(var_276_13.end_pos)
			var_276_6 = iter_276_0
		end
	end

	if var_276_5 < 25 + var_276_4 and arg_276_0.in_jump and not arg_276_0.in_moveright and not arg_276_0.in_moveleft and not arg_276_0.in_back then
		arg_276_0.forwardmove = math.abs(var_276_3 * math.cos(math.rad(var_276_6)))

		if math.abs(var_276_6 - 90) < 40 then
			side_velo = var_276_3 * math.sin(math.rad(var_276_6)) * (25 + var_276_4 - var_276_5) / 15
		else
			side_velo = var_276_3 * math.sin(math.rad(var_276_6))
		end

		if var_276_6 >= 90 then
			arg_276_0.sidemove = side_velo
		else
			arg_276_0.sidemove = side_velo * -1
		end
	end
end

slot_0_65_1:set_event("createmove", slot_0_67_3)

slot_0_65_0 = nil
slot_0_66_1 = slot_0_25_0.features.game_focus:switch("\v\f<terminal>    \rConsole color", false, nil, {
	color("3838389A"),
	true
})

slot_0_23_0.new("console_color", slot_0_66_1, slot_0_27_0.features.misc)

slot_0_67_2 = {}
slot_0_68_3 = {
	"vgui_white",
	"vgui/hud/800corner1",
	"vgui/hud/800corner2",
	"vgui/hud/800corner3",
	"vgui/hud/800corner4"
}

;(function()
	slot_0_67_2 = {}

	for iter_277_0, iter_277_1 in ipairs(slot_0_68_3) do
		local var_277_0 = materials.get(iter_277_1)

		if var_277_0 == nil then
			var_277_0 = materials.get_materials(iter_277_1)[1]
		end

		if var_277_0 ~= nil and var_277_0:is_valid() then
			slot_0_67_2[iter_277_1] = var_277_0
		end
	end
end)()

slot_0_70_5 = nil
slot_0_71_5 = utils.get_vfunc("engine.dll", "VEngineClient014", 11, "bool(__thiscall*)(void*)")

function slot_0_72_6(arg_278_0)
	if not slot_0_71_5() then
		arg_278_0 = color()
	end

	if slot_0_70_5 == arg_278_0 then
		return
	end

	for iter_278_0, iter_278_1 in pairs(slot_0_67_2) do
		iter_278_1:alpha_modulate(arg_278_0.a / 255)
		iter_278_1:color_modulate(color(arg_278_0.r, arg_278_0.g, arg_278_0.b))
	end

	slot_0_70_5 = arg_278_0
end

function slot_0_73_6()
	slot_0_72_6(slot_0_66_1.color.value)
end

function slot_0_74_7()
	slot_0_72_6(color())
end

slot_0_66_1:set_event("render", slot_0_73_6)
slot_0_66_1:set_event("shutdown", slot_0_74_7)
slot_0_66_1:set_callback(slot_0_74_7)

slot_0_66_0 = nil
slot_0_67_1 = slot_0_25_0.features.game_focus:switch("\v\f<lightbulb-on>   \rFlash game icon")

slot_0_67_1:tooltip("\v\f<circle-info>   \rAllows you to avoid bumping into walls and losing speed")
slot_0_23_0.new("flask_game_icon", slot_0_67_1, slot_0_27_0.features.misc)

function slot_0_68_2()
	ffi.cdef("            int GetForegroundWindow();\n            bool FlashWindow(int hwnd, bool invert);\n            int FindWindowA(const char* class, const char* name);\n        ")

	local var_281_0 = ffi.load("user32")
	local var_281_1 = var_281_0.FindWindowA("Valve001", "Counter-Strike: Global Offensive - Direct3D 9")

	local function var_281_2()
		return var_281_0.GetForegroundWindow() == var_281_1
	end

	local function var_281_3()
		if not var_281_2() then
			var_281_0.FlashWindow(var_281_1, true)
		end
	end

	slot_0_67_1:set_event("round_start", var_281_3)
end

slot_0_69_3 = false

function slot_0_70_4()
	if slot_0_67_1.value and not slot_0_69_3 then
		slot_0_69_3 = true

		slot_0_68_2()
	end
end

slot_0_70_4()
slot_0_67_1:set_callback(slot_0_70_4)

slot_0_67_0 = nil
slot_0_68_1 = slot_0_25_0.features.game_focus:switch(" \v\f<user>    \rClient-side nickname", false, nil, function(arg_285_0)
	return {
		input = arg_285_0:input("\v\f<text>   \rNickname", "prince")
	}, true
end)

slot_0_68_1:tooltip("\v\f<circle-info>   \rThis nickname will only be visible to you in the kill-feed, scoreboard, etc")
slot_0_23_0.new("client_side_nickname", slot_0_68_1, slot_0_27_0.features.misc)

slot_0_69_2 = {
	local_client_base = ffi.cast("uintptr_t**", utils.opcode_scan("engine.dll", "A1 ? ? ? ? 0F 28 C1 F3 0F 5C 80 ? ? ? ? F3 0F 11 45 ? A1 ? ? ? ? 56 85 C0 75 04 33 F6 EB 26 80 78 14 00 74 F6 8B 4D 08 33 D2 E8 ? ? ? ? 8B F0 85 F6", 1)),
	player_struct = ffi.typeof("            struct {\n                int64_t         unknown;\n                int64_t         steamID64;\n                char            szName[128];\n                int             userId;\n                char            szSteamID[20];\n                char            pad_0x00A8[0x10];\n                unsigned long   iSteamID;\n                char            szFriendsName[128];\n                bool            fakeplayer;\n                bool            ishltv;\n                unsigned int    customfiles[4];\n                unsigned char   filesdownloaded;\n            }\n        ")
}
slot_0_69_2.get_userdata = utils.get_vfunc(11, ffi.typeof("$*(__thiscall*)(void*, int, int*)", slot_0_69_2.player_struct))

function slot_0_70_3(arg_286_0)
	local var_286_0 = slot_0_38_0.me

	if not var_286_0 then
		return
	end

	slot_0_69_2.local_client = slot_0_69_2.local_client_base[0][0]

	if not slot_0_69_2.local_client then
		return
	end

	slot_0_69_2.userinfo = ffi.cast("void***", slot_0_69_2.local_client + 21184)[0]

	if not slot_0_69_2.userinfo then
		return
	end

	local var_286_1 = slot_0_69_2.get_userdata(slot_0_69_2.userinfo, var_286_0:get_index() - 1, nil)

	if not var_286_1 then
		return
	end

	if ffi.string(var_286_1[0].szName) ~= arg_286_0 then
		var_286_1[0].szName = ffi.new("char[128]", arg_286_0)
	end
end

function slot_0_71_4()
	slot_0_70_3(panorama.MyPersonaAPI.GetName())
end

function slot_0_72_5()
	local var_288_0 = slot_0_68_1.input.value

	if slot_0_68_1.value and #var_288_0 > 0 then
		return slot_0_70_3(var_288_0)
	end

	slot_0_71_4()
end

slot_0_72_5()
slot_0_68_1:set_callback(slot_0_72_5)
slot_0_68_1.input:set_callback(slot_0_72_5)
slot_0_68_1:set_event("shutdown", slot_0_71_4)
slot_0_68_1:set_event("round_prestart", slot_0_72_5)
slot_0_68_1:set_event("player_connect_full", slot_0_72_5)

slot_0_68_0 = nil
slot_0_69_1 = slot_0_25_0.features.grenade_features:switch(" \v\f<arrow-down-left-and-arrow-up-right-to-center>    \rSuper toss")

slot_0_69_1:tooltip("\v\f<circle-info>   \rCompensates for the trajectory of a grenade when moving")
slot_0_23_0.new("super_toss", slot_0_69_1, slot_0_27_0.features.misc)

slot_0_70_2 = false

function slot_0_71_3(arg_289_0, arg_289_1, arg_289_2, arg_289_3)
	local var_289_0 = vector():angles(arg_289_0.x - 10 + math.abs(arg_289_0.x) / 9, arg_289_0.y)
	local var_289_1 = slot_0_16_0(arg_289_2 * 0.9, 15, 750) * (slot_0_16_0(arg_289_3, 0, 1) * 0.7 + 0.3)
	local var_289_2 = var_289_0

	for iter_289_0 = 1, 8 do
		var_289_2 = (var_289_0 * (var_289_2 * var_289_1 + arg_289_1 * 1.25):length() - arg_289_1 * 1.25) / var_289_1

		var_289_2:normalize()
	end

	local var_289_3 = var_289_2:angles()

	if var_289_3.x > -10 then
		var_289_3.x = 0.9 * var_289_3.x + 9
	else
		var_289_3.x = 1.125 * var_289_3.x + 11.25
	end

	return var_289_3
end

function slot_0_72_4(arg_290_0)
	local var_290_0 = slot_0_38_0.me
	local var_290_1 = slot_0_38_0.weapon
	local var_290_2 = slot_0_38_0.weapon_info

	if not var_290_0 or not slot_0_38_0.is_alive or not var_290_1 or not var_290_2 or not var_290_2.throw_velocity or not var_290_1.m_flThrowStrength then
		return
	end

	arg_290_0.angles = slot_0_71_3(arg_290_0.angles, arg_290_0.velocity, var_290_2.throw_velocity, var_290_1.m_flThrowStrength)
end

function slot_0_73_5(arg_291_0)
	if slot_0_70_2 then
		slot_0_70_2 = false

		slot_0_24_0.air_strafe:override()
		slot_0_24_0.strafe_assist:override()
	end

	if not arg_291_0.jitter_move then
		return
	end

	local var_291_0 = slot_0_38_0.me
	local var_291_1 = slot_0_38_0.weapon
	local var_291_2 = slot_0_38_0.weapon_info

	if not var_291_0 or not slot_0_38_0.is_alive or not var_291_1 or not var_291_2 or not var_291_2.throw_velocity or not var_291_1.m_flThrowStrength then
		return
	end

	if var_291_2.weapon_type ~= 9 or not (var_291_1.m_fThrowTime > 0) or not (var_291_1.m_fThrowTime - 0.1 * slot_0_38_0.exploit_charge <= globals.curtime) then
		return
	end

	slot_0_70_2 = true

	slot_0_24_0.air_strafe:override(false)
	slot_0_24_0.strafe_assist:override(false)

	local var_291_3 = var_291_0:simulate_movement()

	var_291_3:think()

	arg_291_0.view_angles = slot_0_71_3(arg_291_0.view_angles, var_291_3.velocity, var_291_2.throw_velocity, var_291_1.m_flThrowStrength)
end

function slot_0_74_6(arg_292_0)
	if not arg_292_0.value then
		slot_0_24_0.air_strafe:override()
		slot_0_24_0.strafe_assist:override()
	end
end

slot_0_69_1:set_callback(slot_0_74_6)
slot_0_69_1:set_event("createmove", slot_0_73_5)
slot_0_69_1:set_event("grenade_override_view", slot_0_72_4)

slot_0_69_0 = nil
slot_0_70_1 = slot_0_25_0.features.grenade_features:switch("\v\f<hand-sparkles>    \rAuto release", false, nil, function(arg_293_0)
	return {
		on_pin_pulled = arg_293_0:switch("\v\f<circle-notch>    \rOn pin pulled"),
		release_damage = arg_293_0:slider("\v\f<wine-bottle>    \rMin. damage", 1, 60, 20),
		allowed_grenades = arg_293_0:listable("", {
			"Molotov",
			"High Explosive"
		})
	}, true
end)

slot_0_70_1:tooltip("\v\f<circle-info>   \rCompensates for the trajectory of a grenade when moving")
slot_0_23_0.new("auto_release", slot_0_70_1, slot_0_27_0.features.misc)

slot_0_71_2 = {
	CIncendiaryGrenade = 1,
	CMolotovGrenade = 1,
	CHEGrenade = 2
}
slot_0_72_3 = 0

function slot_0_73_4(arg_294_0)
	if arg_294_0.type == "Frag" or arg_294_0.type == "Molly" then
		slot_0_72_3 = arg_294_0.damage

		return
	end

	slot_0_72_3 = 0
end

function slot_0_74_5(arg_295_0)
	local var_295_0 = slot_0_38_0.me
	local var_295_1 = slot_0_38_0.weapon

	if not var_295_0 or not var_295_1 then
		return
	end

	local var_295_2 = var_295_1:get_classname()
	local var_295_3 = slot_0_71_2[var_295_2]

	if not var_295_3 then
		return
	end

	if not slot_0_70_1.allowed_grenades:get(var_295_3) then
		return
	end

	if not (slot_0_72_3 >= slot_0_70_1.release_damage.value) then
		return
	end

	if slot_0_70_1.on_pin_pulled.value then
		if arg_295_0.in_attack and var_295_1.m_bPinPulled then
			arg_295_0.in_attack = false
		end
	else
		if arg_295_0.in_attack and var_295_1.m_bPinPulled then
			arg_295_0.in_attack = false
		end

		if not var_295_1.m_bPinPulled then
			arg_295_0.in_attack = true
		end
	end
end

slot_0_70_1:set_event("createmove", slot_0_74_5)
slot_0_70_1:set_event("grenade_prediction", slot_0_73_4)

slot_0_70_0 = nil
slot_0_71_1 = slot_0_25_0.features.grenade_features:switch(" \v\f<bomb>    \rDrop grenades")

slot_0_71_1:tooltip("\v\f<circle-info>  \rThrows out all grenades. \ac2a04affBind to hold!")
slot_0_23_0.new("drop_grenades", slot_0_71_1, slot_0_27_0.features.misc)

slot_0_72_2 = {
	CIncendiaryGrenade = "weapon_incgrenade",
	CMolotovGrenade = "weapon_molotov",
	CHEGrenade = "weapon_hegrenade"
}
slot_0_73_3 = false

function slot_0_74_4(arg_296_0)
	local var_296_0 = slot_0_38_0.me
	local var_296_1 = slot_0_38_0.weapons

	if not var_296_0 or not var_296_1 then
		return
	end

	local var_296_2 = slot_0_71_1.value

	if var_296_2 then
		arg_296_0.in_use = true

		if not slot_0_73_3 then
			local var_296_3 = 1

			for iter_296_0, iter_296_1 in ipairs(var_296_1) do
				local var_296_4 = iter_296_1:get_classname()
				local var_296_5 = slot_0_72_2[var_296_4]

				if var_296_5 then
					utils.execute_after(0.02 * var_296_3, function()
						utils.console_exec("use " .. var_296_5 .. "; drop")
					end)
				end

				var_296_3 = var_296_3 + 1
			end
		end
	end

	slot_0_73_3 = var_296_2
end

events.createmove(slot_0_74_4)

slot_0_71_0 = nil
slot_0_72_1 = slot_0_25_0.features.scoreboard:switch("\v\f<tag>     \rClantag")

slot_0_23_0.new("clantag", slot_0_72_1, slot_0_27_0.features.misc)

slot_0_73_2 = {
	"",
	"6",
	"e7",
	"ev4",
	"eva7",
	"eval2",
	"evala5",
	"evalat3",
	"evalate$",
	"evalate.7",
	"evalate.c9",
	"evalate.co#",
	"evalate.com",
	"evalate.com",
	"evalate.com",
	"evalate.com",
	"evalate.com",
	"evalate.co#",
	"evalate.c9",
	"evalate.7",
	"evalate$",
	"evalat3",
	"evala5",
	"eval2",
	"eva7",
	"ev4",
	"e7",
	"6",
	""
}
slot_0_74_3 = ""
slot_0_75_4 = 17

function slot_0_76_5(arg_298_0)
	if arg_298_0 ~= slot_0_74_3 then
		slot_0_74_3 = arg_298_0

		common.set_clan_tag(arg_298_0)
	end
end

function slot_0_77_6()
	if not globals.is_connected then
		return
	end

	local var_299_0 = slot_0_38_0.net_channel

	if not var_299_0 then
		return
	end

	local var_299_1 = var_299_0.latency[1] or 0
	local var_299_2 = to_ticks(var_299_1)
	local var_299_3 = globals.tickcount + var_299_2
	local var_299_4 = math.floor(var_299_3 / slot_0_75_4) % #slot_0_73_2 + 1

	slot_0_76_5(slot_0_73_2[var_299_4])
end

function slot_0_78_5()
	slot_0_76_5("")
end

slot_0_72_1:set_event("render", slot_0_77_6)
slot_0_72_1:set_event("shutdown", slot_0_78_5)
slot_0_72_1:set_callback(slot_0_78_5)

slot_0_72_0 = nil
slot_0_73_1 = {}
slot_0_74_2 = {
	mute = utils.get_vfunc("client.dll", "GameClientExports001", 2, "void(__thiscall*)(void*, int idx)"),
	unmute = utils.get_vfunc("client.dll", "GameClientExports001", 3, "void(__thiscall*)(void*, int idx)"),
	is_muted = utils.get_vfunc("client.dll", "GameClientExports001", 1, "bool(__thiscall*)(void*, int idx)")
}
slot_0_75_3 = slot_0_25_0.features.scoreboard:switch("\v\f<face-woozy>    \rVoice state", false, nil, function(arg_301_0)
	return {
		state = arg_301_0:list("", " \v\f<microphone>    \rUnmute", "\v\f<microphone-slash>   \rMute")
	}, true
end)

slot_0_75_3:tooltip("\v\f<circle-info>  \rYou can unmute players, also mute everyone")
slot_0_23_0.new("voice_state", slot_0_75_3, slot_0_27_0.features.misc)

function slot_0_76_4()
	local var_302_0 = slot_0_38_0.me
	local var_302_1 = slot_0_38_0.players

	if not var_302_0 or not var_302_1 then
		return
	end

	for iter_302_0, iter_302_1 in ipairs(var_302_1) do
		local var_302_2 = iter_302_1.entity

		if not slot_0_37_0(var_302_2) then
			-- block empty
		elseif var_302_2 == var_302_0 then
			-- block empty
		else
			local var_302_3 = var_302_2:get_name()
			local var_302_4 = var_302_2:get_index()
			local var_302_5 = string.format("%s::%s", var_302_3, var_302_4)

			if slot_0_75_3.state:get() == 1 and slot_0_74_2.is_muted(var_302_4) == true and slot_0_73_1[var_302_5] ~= "unmuted" then
				slot_0_74_2.unmute(var_302_4)

				slot_0_73_1[var_302_5] = "unmuted"
			end

			if slot_0_75_3.state:get() == 2 and slot_0_74_2.is_muted(var_302_4) == false and slot_0_73_1[var_302_5] ~= "muted" then
				slot_0_74_2.mute(var_302_4)

				slot_0_73_1[var_302_5] = "muted"
			end
		end
	end
end

function slot_0_77_5()
	slot_0_73_1 = {}

	local var_303_0 = slot_0_38_0.players

	if not var_303_0 then
		return
	end

	for iter_303_0, iter_303_1 in ipairs(var_303_0) do
		if slot_0_37_0(iter_303_1.entity) then
			slot_0_74_2.unmute(iter_303_1.entity:get_index())
		end
	end
end

slot_0_75_3:set_event("render", slot_0_76_4)
slot_0_75_3:set_event("shutdown", slot_0_77_5)
slot_0_75_3:set_event("level_init", slot_0_77_5)
slot_0_75_3:set_callback(slot_0_77_5)

slot_0_73_0 = nil
slot_0_74_1 = slot_0_25_0.features.scoreboard:switch("\v\f<screencast>    \rShared icon")

slot_0_23_0.new("shared_icon", slot_0_74_1, slot_0_27_0.features.misc)

slot_0_75_2 = {
	["NL Stable"] = "https://raw.githubusercontent.com/kissprince/evalate-shared-logo/refs/heads/main/nl-evalate.png",
	["GS Pro"] = "https://raw.githubusercontent.com/kissprince/evalate-shared-logo/refs/heads/main/gs-debug-pro.png",
	["NL Trial"] = "https://raw.githubusercontent.com/kissprince/evalate-shared-logo/refs/heads/main/nl-evalate-trial.png",
	["GS Debug"] = "https://raw.githubusercontent.com/kissprince/evalate-shared-logo/refs/heads/main/gs-evalate-debug.png",
	["NL Pro"] = "https://raw.githubusercontent.com/kissprince/evalate-shared-logo/refs/heads/main/nl-evalate-pro.png",
	["GS Stable"] = "https://raw.githubusercontent.com/kissprince/evalate-shared-logo/refs/heads/main/gs-evalate.png",
	["NL Recode"] = "https://raw.githubusercontent.com/kissprince/evalate-shared-logo/refs/heads/main/nl-evalate-recode.png"
}

function slot_0_76_3()
	if globals.tickcount % 64 ~= 0 then
		return
	end

	if not slot_0_31_0 then
		return
	end

	local var_304_0 = {}

	for iter_304_0, iter_304_1 in ipairs(slot_0_31_0) do
		var_304_0[iter_304_1.secret] = string.format("%s %s", iter_304_1.cheat, iter_304_1.build_name)
	end

	for iter_304_2, iter_304_3 in ipairs(slot_0_38_0.players) do
		local var_304_1 = iter_304_3.entity

		if not var_304_1 or not slot_0_37_0(var_304_1) then
			-- block empty
		else
			local var_304_2 = var_304_1:get_player_info()

			if not var_304_2 then
				-- block empty
			else
				local var_304_3 = var_304_0[slot_0_32_0(var_304_2.steamid64)]

				if not var_304_3 then
					-- block empty
				else
					local var_304_4 = slot_0_75_2[var_304_3]

					if not var_304_4 then
						-- block empty
					else
						var_304_1:set_icon(var_304_4)
					end
				end
			end
		end
	end
end

function slot_0_77_4()
	for iter_305_0, iter_305_1 in ipairs(slot_0_38_0.players) do
		local var_305_0 = iter_305_1.entity

		if not var_305_0 or not slot_0_37_0(var_305_0) then
			-- block empty
		else
			var_305_0:set_icon()
		end
	end
end

events.shutdown(slot_0_77_4)
slot_0_74_1:set_event("net_update_end", slot_0_76_3)
slot_0_74_1:set_callback(function(arg_306_0)
	if not arg_306_0.value then
		slot_0_77_4()
	end
end)

slot_0_74_0 = nil
slot_0_75_1 = 2
slot_0_76_2 = slot_0_25_0.features.unlocks:switch("\v\f<trash>     \rTrashtalk", false, nil, function(arg_307_0)
	local var_307_0 = {
		events = arg_307_0:listable("\v\f<check>   \rEvents", {
			"On Kill",
			"On Death"
		}),
		style = arg_307_0:list("\v\f<font>   \rStyle", {
			"Simple",
			"Russian",
			"English"
		})
	}

	local function var_307_1()
		return #var_307_0.events.value > 0
	end

	var_307_0.style:depend({
		var_307_0.events,
		var_307_1
	})

	return var_307_0, true
end)

slot_0_23_0.set_callback_list(slot_0_76_2.style, true)
slot_0_23_0.new("trashtalk", slot_0_76_2, slot_0_27_0.features.misc)

slot_0_77_3 = {
	{
		on_kill = {
			"1"
		},
		on_death = {}
	},
	{
		on_kill = {
			"дым дым казино и бляди",
			"ниче цезарь тоже не сразу салатом стал",
			"evalate.com/competition",
			"я на первом месте чекай  evalate.com/leaderboard",
			"ты видел мои огромные яйца?!?!?!?!...",
			"вх рипнулось сори что убил",
			"вся консоль в твоих смертях",
			{
				"такой тупорылый",
				"я вахуе"
			},
			"ибо нехуй тебе тыркать по клавиатуре и надеется на удачу",
			"ха, обезьянка, убил тебя",
			{
				"иди диспутни свою хуйню",
				"не бустит тебя"
			},
			"тебе время для триал версии evalate выдать или что?",
			"поиграй с триалом евалейта я хз market.neverlose.cc/k3jdRt",
			"♛ 𝐎𝐖𝐍𝐄𝐃 𝐁𝐘 𝐄𝐕𝐀𝐋𝐀𝐓𝐄 𝐋𝐔𝐎 ♛",
			{
				"моча твоя луа, гетни 𝒆𝒗𝒂𝒍𝒂𝒕𝒆",
				"если конечно денег хватит хахахаа)"
			},
			"кто контролирует пятерочку в судже - тот правит миром",
			"у тебя лаги или ты по жизни такой медленный?",
			"Ты стреляешь как моя бабуля, а она слепая!",
			"во дебил умер опять"
		},
		on_death = {
			{
				"подсос ебаный",
				"а теперь думай, это я пишу или трештолк",
				"хуеглот блядь"
			},
			{
				"ну не не",
				"ну такой пидорас меня убил"
			},
			"ну фу блять",
			"ну ебанат блядь",
			"ну маму ебал ты как убил меня",
			"фу блядота с нлом убивает опять",
			"а тимейт как всегда на Б",
			"КАК ТЫ ТУТ ВЫСТРЕЛИЛ ДАУН",
			"это ты сколько кнопок прожал чтобы убить меня?",
			"это в сколько тиков?",
			"𝐞𝐛𝐚𝐧𝐚𝐭...",
			"потужно",
			"ты так кемперишь что пора уже палатку ставить",
			"урод",
			{
				"долбаеб фейк флик вжал и ходит",
				"ебаната кусок"
			},
			"чит еще не научился предиктить мувы такого долбаеба",
			{
				"тупой хуесос",
				"",
				"",
				"а теперь думай, это трештолк пишет или я"
			}
		}
	},
	{
		on_kill = {
			"evalate.com/competition",
			"Bruh, you aiming or praying?",
			"Is your mouse broken or are you just that bad?",
			"Choose your excuse: 1.Lags | 2.New mouse | 3.Low FPS | 4.Low team | 5.Hacker | 6.Lucker | 7.Smurf | 8.Hitbox | 9.Tickrate",
			"ez",
			"𝒕𝒖𝒓𝒏 𝒆𝒗𝒆𝒓𝒚 𝒎𝒂𝒕𝒄𝒉 𝒊𝒏𝒕𝒐 𝒚𝒐𝒖𝒓 𝒉𝒊𝒈𝒉𝒍𝒊𝒈𝒉𝒕 𝒓𝒆𝒆𝒍 𝒘𝒊𝒕𝒉 𝒆𝒗𝒂𝒍𝒂𝒕𝒆",
			"♛ 𝐎𝐖𝐍𝐄𝐃 𝐁𝐘 𝐄𝐕𝐀𝐋𝐀𝐓𝐄 𝐋𝐔𝐎 ♛",
			"bruh, your aim is like a potato on a spin cycle",
			"you sure you're not playing with your feet?",
			"are you lagging, or just naturally slow?",
			"you aim like my grandma, and she's blind!"
		},
		on_death = {
			"mcdonalds resolver",
			"i can't believe i can die"
		}
	}
}

function slot_0_78_4(arg_309_0, arg_309_1)
	utils.execute_after(arg_309_0, function()
		utils.console_exec("say " .. arg_309_1)
	end)
end

function slot_0_79_5(arg_311_0)
	local var_311_0 = slot_0_75_1

	if type(arg_311_0) == "string" then
		return slot_0_78_4(var_311_0, arg_311_0)
	end

	for iter_311_0, iter_311_1 in ipairs(arg_311_0) do
		slot_0_78_4(var_311_0, iter_311_1)

		var_311_0 = var_311_0 + slot_0_75_1
	end
end

function slot_0_80_5(arg_312_0)
	local var_312_0 = slot_0_77_3[slot_0_76_2.style.value]

	if not var_312_0 then
		return
	end

	local var_312_1 = var_312_0[arg_312_0]

	if not var_312_1 or #var_312_1 < 1 then
		return
	end

	local var_312_2 = var_312_1[utils.random_int(1, #var_312_1)]

	if not var_312_2 then
		return
	end

	slot_0_79_5(var_312_2)
end

function slot_0_81_5(arg_313_0)
	local var_313_0 = entity.get(arg_313_0.attacker, true)
	local var_313_1 = entity.get(arg_313_0.userid, true)
	local var_313_2 = slot_0_38_0.me

	if slot_0_76_2.events:get("On Death") and var_313_0 ~= var_313_2 and var_313_1 == var_313_2 then
		slot_0_80_5("on_death")
	end

	if slot_0_76_2.events:get("On Kill") and var_313_0 == var_313_2 and var_313_1 ~= var_313_2 then
		slot_0_80_5("on_kill")
	end
end

slot_0_76_2:set_event("player_death", slot_0_81_5)

slot_0_75_0 = nil
slot_0_76_1 = slot_0_25_0.features.unlocks:switch("\v\f<link>    \rUnlock latency")

slot_0_23_0.new("unlock_latency", slot_0_76_1, slot_0_27_0.features.misc)
slot_0_76_1:tooltip("\v\f<circle-info>   \rUnlocks the Fake latency value and allows you to set the value higher.\n\n\v\f<folder>   \rMiscellaneous > Main > Other > Fake Latency")

slot_0_77_2 = cvar.sv_maxunlag:float()

function slot_0_78_3()
	cvar.sv_maxunlag:float(slot_0_77_2)
end

function slot_0_79_4()
	if slot_0_76_1:get() then
		cvar.sv_maxunlag:float(1)
	else
		slot_0_78_3()
	end
end

slot_0_76_1:set_event("shutdown", slot_0_78_3)
slot_0_76_1:set_callback(slot_0_79_4)

slot_0_76_0 = nil
slot_0_77_1 = slot_0_25_0.features.unlocks:switch("\v\f<rabbit>     \rUnlock fake duck speed")

slot_0_23_0.new("unlock_fake_duck_speed", slot_0_77_1, slot_0_27_0.features.misc)

slot_0_78_2 = 5

function slot_0_79_3(arg_316_0)
	if not slot_0_38_0.is_alive then
		return
	end

	local var_316_0 = arg_316_0.sidemove
	local var_316_1 = arg_316_0.forwardmove

	if math.abs(var_316_1) > slot_0_78_2 or math.abs(var_316_0) > slot_0_78_2 then
		local var_316_2 = 450 / (var_316_1 * var_316_1 + var_316_0 * var_316_0)^0.5

		arg_316_0.forwardmove = var_316_1 * var_316_2
		arg_316_0.sidemove = var_316_0 * var_316_2
	end
end

function slot_0_80_4(arg_317_0)
	events.createmove_run(slot_0_79_3, arg_317_0.value)
end

function slot_0_81_4(arg_318_0)
	if arg_318_0.value then
		slot_0_24_0.fake_duck:set_callback(slot_0_80_4)
	else
		slot_0_24_0.fake_duck:unset_callback(slot_0_80_4)
	end
end

slot_0_77_1:set_callback(slot_0_81_4)

slot_0_77_0 = {}
slot_0_78_1 = ffi.typeof("        struct {\n            float x, y, z;\n        }\n    ")
slot_0_79_2 = ffi.typeof("        struct {\n            uint8_t r, g, b, a;\n        }\n    ")
slot_0_80_3 = utils.get_vfunc("engine.dll", "VDebugOverlay004", 1, ffi.typeof("void(__thiscall*)(void *thisptr, const $ &origin, const $ &mins, const $ &maxs, const $ &angles, int r, int g, int b, int a, float duration)", slot_0_78_1, slot_0_78_1, slot_0_78_1, slot_0_78_1))
slot_0_81_3 = utils.get_vfunc("engine.dll", "VDebugOverlay004", 20, ffi.typeof("void(__thiscall*)(void *thisptr, const $ &origin, const $ &dest, int r, int g, int b, int a, bool noDepthTest, float duration)", slot_0_78_1, slot_0_78_1))
slot_0_82_4 = utils.get_vfunc("engine.dll", "VDebugOverlay004", 21, "void(__thiscall*)(void *thisptr, const $ &origin, const $ &mins, const $ &maxs, const $ &angles, $ *face_color, $ *edge_color, float duration)", slot_0_78_1, slot_0_78_1, slot_0_78_1, slot_0_78_1, slot_0_79_2, slot_0_79_2)

function slot_0_77_0.box(arg_319_0, arg_319_1, arg_319_2, arg_319_3, arg_319_4, arg_319_5, arg_319_6, arg_319_7, arg_319_8)
	arg_319_0 = slot_0_78_1(arg_319_0:unpack())
	arg_319_1 = slot_0_78_1(arg_319_1:unpack())
	arg_319_2 = slot_0_78_1(arg_319_2:unpack())
	arg_319_3 = slot_0_78_1(arg_319_3:unpack())

	slot_0_80_3(arg_319_0, arg_319_1, arg_319_2, arg_319_3, arg_319_4, arg_319_5, arg_319_6, arg_319_7, arg_319_8)
end

function slot_0_77_0.line(arg_320_0, arg_320_1, arg_320_2, arg_320_3, arg_320_4)
	arg_320_0 = slot_0_78_1(arg_320_0:unpack())
	arg_320_1 = slot_0_78_1(arg_320_1:unpack())

	slot_0_81_3(arg_320_0, arg_320_1, arg_320_2.r, arg_320_2.g, arg_320_2.b, arg_320_2.a, arg_320_3, arg_320_4)
end

function slot_0_77_0.box_new(arg_321_0, arg_321_1, arg_321_2, arg_321_3, arg_321_4, arg_321_5, arg_321_6)
	arg_321_0 = slot_0_78_1(arg_321_0:unpack())
	arg_321_1 = slot_0_78_1(arg_321_1:unpack())
	arg_321_2 = slot_0_78_1(arg_321_2:unpack())
	arg_321_3 = slot_0_78_1(arg_321_3:unpack())
	arg_321_4 = slot_0_79_2(arg_321_4:unpack())
	arg_321_5 = slot_0_79_2(arg_321_5:unpack())

	slot_0_82_4(arg_321_0, arg_321_1, arg_321_2, arg_321_3, arg_321_4, arg_321_5, arg_321_6)
end

slot_0_78_0 = nil
slot_0_79_1 = slot_0_25_0.features.predict:switch("\v\f<sparkles>    \rPredict", false, "\v\f<circle-info>    \rAllows you to predict the player's position and shoot earlier.\n\n\v\f<user-gear>   \rStrength must be tested, as it varies for each player and depends on your pc and latency.", function(arg_322_0, arg_322_1)
	return {
		strength = arg_322_0:list("\v\f<user-gear>   \rStrength", {
			"Soft",
			"Medium",
			"Extreme",
			"Ultimate"
		})
	}, true
end)

slot_0_23_0.new("predict", slot_0_79_1, slot_0_27_0.features.aimbot)

slot_0_80_2 = cvar.cl_interpolate
slot_0_81_2 = cvar.cl_interp_ratio
slot_0_82_3 = cvar.cl_interp

function slot_0_83_4()
	slot_0_80_2:int(1)
	slot_0_81_2:int(2)
	slot_0_82_3:float(0.015625)
end

function slot_0_84_5()
	local var_324_0 = slot_0_79_1.strength.value

	if var_324_0 == 1 then
		slot_0_80_2:int(1)
		slot_0_81_2:int(3)
		slot_0_82_3:float(0.031)
	end

	if var_324_0 == 2 then
		slot_0_80_2:int(1)
		slot_0_81_2:int(2)
		slot_0_82_3:float(0.026)
	end

	if var_324_0 == 3 then
		slot_0_80_2:int(1)
		slot_0_81_2:int(1)
		slot_0_82_3:float(0.015625)
	end

	if var_324_0 == 4 then
		slot_0_80_2:int(0)
		slot_0_81_2:int(1)
		slot_0_82_3:float(0.015625)
	end
end

function slot_0_85_6(arg_325_0)
	if arg_325_0.value then
		slot_0_28_0("createmove", slot_0_84_5)
	else
		slot_0_29_0("createmove", slot_0_84_5)
		slot_0_83_4()
	end
end

events.shutdown(slot_0_83_4)
slot_0_79_1:set_callback(slot_0_85_6, true)

slot_0_79_0 = nil
slot_0_80_1 = slot_0_25_0.features.predict:switch("\v\f<person-walking-arrow-right>   \rAI Peek", false, nil, function(arg_326_0, arg_326_1)
	local var_326_0 = {
		simulation = arg_326_0:slider("\v\f<timer>     \rSimulation", 25, 35, 30, nil, "ms"),
		rate_limit = arg_326_0:slider("\v\f<circle-pause>     \rProcess limit", 0, 30, 3, nil, function(arg_327_0)
			if arg_327_0 == 0 then
				return "Off"
			end

			return arg_327_0 .. "ms"
		end),
		hitboxes = arg_326_0:selectable("\v\f<shield>     \rHitboxes", {
			"Head",
			"Chest",
			"Stomach",
			"Arms",
			"Legs"
		}),
		weapons = arg_326_0:selectable("\v\f<axe>    \rWeapons", {
			"Snipers",
			"Pistols"
		}),
		show_simulation = arg_326_0:switch("\v\f<cube>     \rShow simulation", false, nil, {
			color(255, 0, 0),
			true
		})
	}

	arg_326_1:tooltip("\v\f<circle-info>    \rRecommended to bind this switch to a same button as \vPeek Assist\r.")
	var_326_0.rate_limit:tooltip("\v\f<circle-info>    \rAllows you to limit the amount of processing and maintain performance.")

	return var_326_0
end)

slot_0_23_0.new("ai_peek", slot_0_80_1, slot_0_27_0.features.aimbot)

slot_0_81_1 = bit.lshift(1, 0)
slot_0_82_2 = 0
slot_0_83_3 = 1
slot_0_84_4 = 2
slot_0_85_5 = 3
slot_0_86_5 = 4
slot_0_87_4 = 5
slot_0_88_3 = 6
slot_0_89_3 = 7
slot_0_90_2 = 10
slot_0_91_1 = 0
slot_0_92_1 = 1
slot_0_93_1 = 2
slot_0_94_1 = 3
slot_0_95_1 = 4
slot_0_96_1 = 5
slot_0_97_1 = 6
slot_0_98_1 = 7
slot_0_99_1 = 8
slot_0_100_1 = 9
slot_0_101_2 = 10
slot_0_102_2 = 11
slot_0_103_2 = 12
slot_0_104_1 = 13
slot_0_105_1 = 14
slot_0_106_1 = 15
slot_0_107_1 = 16
slot_0_108_2 = 17
slot_0_109_3 = 18
slot_0_110_2 = {
	[slot_0_91_1] = slot_0_83_3,
	[slot_0_96_1] = slot_0_84_4,
	[slot_0_94_1] = slot_0_85_5,
	[slot_0_99_1] = slot_0_88_3,
	[slot_0_98_1] = slot_0_89_3,
	[slot_0_103_2] = slot_0_88_3,
	[slot_0_102_2] = slot_0_89_3,
	[slot_0_108_2] = slot_0_86_5,
	[slot_0_106_1] = slot_0_87_4
}
slot_0_111_1 = nil
slot_0_112_1 = 0
slot_0_113_2 = nil

function slot_0_114_3()
	slot_0_111_1 = nil
	slot_0_112_1 = 0
end

function slot_0_115_2()
	slot_0_24_0.double_tap:override()
	slot_0_24_0.peek_assist.retreat_mode:override()
end

function slot_0_116_1()
	slot_0_24_0.peek_assist.retreat_mode:override("On Shot")
end

function slot_0_117_1(arg_331_0)
	if arg_331_0 == slot_0_83_3 then
		return 4
	end

	if arg_331_0 == slot_0_85_5 then
		return 1.25
	end

	if arg_331_0 == slot_0_88_3 then
		return 0.75
	end

	if arg_331_0 == slot_0_89_3 then
		return 0.75
	end

	return 1
end

function slot_0_118_1(arg_332_0, arg_332_1, arg_332_2, arg_332_3)
	arg_332_1 = arg_332_1 * slot_0_117_1(arg_332_2)

	if arg_332_0.m_ArmorValue > 0 then
		if arg_332_2 == slot_0_83_3 then
			if arg_332_0.m_bHasHelmet then
				arg_332_1 = arg_332_1 * (arg_332_3 * 0.5)
			end
		else
			arg_332_1 = arg_332_1 * (arg_332_3 * 0.5)
		end
	end

	return arg_332_1
end

function slot_0_119_1(arg_333_0, arg_333_1, arg_333_2, arg_333_3, arg_333_4)
	local var_333_0 = arg_333_1 - arg_333_0
	local var_333_1 = arg_333_4.damage
	local var_333_2 = arg_333_4.armor_ratio
	local var_333_3 = arg_333_4.range
	local var_333_4 = arg_333_4.range_modifier
	local var_333_5 = math.min(var_333_3, var_333_0:length())
	local var_333_6 = var_333_1 * math.pow(var_333_4, var_333_5 * 0.002)

	return (slot_0_118_1(arg_333_2, var_333_6, arg_333_3, var_333_2))
end

function slot_0_120_1()
	return slot_0_80_1.simulation:get() * 0.01
end

function slot_0_121_1()
	return slot_0_80_1.rate_limit:get() * 0.01
end

function slot_0_122_1()
	return slot_0_24_0.damage:get()
end

function slot_0_123_1(arg_337_0)
	if arg_337_0 == nil then
		return
	end

	local var_337_0 = arg_337_0:get_origin()

	if bit.band(arg_337_0.m_fFlags, slot_0_81_1) == 0 then
		return utils.trace_line(var_337_0, var_337_0 - vector(0, 0, 8192), arg_337_0, 33636363).end_pos
	end

	return var_337_0
end

function slot_0_124_1()
	local var_338_0 = {}

	if slot_0_80_1.hitboxes:get("Head") then
		table.insert(var_338_0, slot_0_91_1)
	end

	if slot_0_80_1.hitboxes:get("Chest") then
		table.insert(var_338_0, slot_0_96_1)
	end

	if slot_0_80_1.hitboxes:get("Stomach") then
		table.insert(var_338_0, slot_0_94_1)
	end

	if slot_0_80_1.hitboxes:get("Arms") then
		table.insert(var_338_0, slot_0_108_2)
		table.insert(var_338_0, slot_0_106_1)
	end

	if slot_0_80_1.hitboxes:get("Legs") then
		table.insert(var_338_0, slot_0_99_1)
		table.insert(var_338_0, slot_0_98_1)
		table.insert(var_338_0, slot_0_101_2)
		table.insert(var_338_0, slot_0_100_1)
	end

	return var_338_0
end

function slot_0_125_1(arg_339_0)
	return slot_0_110_2[arg_339_0] or slot_0_82_2
end

function slot_0_126_1(arg_340_0, arg_340_1)
	local var_340_0 = arg_340_0:get_weapon_index()
	local var_340_1 = arg_340_1.weapon_type

	if var_340_1 == 1 then
		return "Pistols"
	end

	if var_340_1 == 5 then
		return "Snipers"
	end

	return nil
end

function slot_0_127_1(arg_341_0, arg_341_1, arg_341_2, arg_341_3, arg_341_4)
	local var_341_0 = {}
	local var_341_1 = arg_341_1:get_eye_position()
	local var_341_2 = arg_341_2:get_weapon_info()
	local var_341_3 = arg_341_3.m_iHealth

	for iter_341_0 = 1, #arg_341_0 do
		local var_341_4 = arg_341_0[iter_341_0]
		local var_341_5 = slot_0_125_1(var_341_4)
		local var_341_6 = arg_341_3:get_hitbox_position(var_341_4)
		local var_341_7 = slot_0_119_1(var_341_1, var_341_6, arg_341_3, var_341_5, var_341_2)
		local var_341_8 = var_341_7 < arg_341_4
		local var_341_9 = var_341_7 < var_341_3

		if var_341_8 and var_341_9 then
			-- block empty
		else
			table.insert(var_341_0, {
				index = iter_341_0,
				pos = var_341_6
			})
		end
	end

	return var_341_0
end

function slot_0_128_1(arg_342_0)
	return slot_0_37_0(arg_342_0.target)
end

function slot_0_129_1(arg_343_0)
	return not arg_343_0.in_forward and not arg_343_0.in_back and not arg_343_0.in_moveleft and not arg_343_0.in_moveright
end

function slot_0_130_1(arg_344_0)
	return slot_0_80_1.weapons:get(arg_344_0)
end

function slot_0_131_1(arg_345_0, arg_345_1, arg_345_2)
	if arg_345_0 == nil or arg_345_1 == nil then
		return false
	end

	if arg_345_2.max_clip1 == 0 or arg_345_1.m_iClip1 == 0 then
		return false
	end

	local var_345_0 = globals.curtime

	if var_345_0 < arg_345_0.m_flNextAttack then
		return false
	end

	if var_345_0 < arg_345_1.m_flNextPrimaryAttack then
		return false
	end

	return true
end

function slot_0_132_1()
	if not slot_0_38_0.is_double_tap then
		return false
	end

	return true
end

function slot_0_133_1(arg_347_0, arg_347_1)
	local var_347_0 = {
		ctx = arg_347_0,
		target = arg_347_1
	}

	var_347_0.simtime = 0
	var_347_0.retreat = -1

	return var_347_0
end

function slot_0_134_1(arg_348_0)
	return arg_348_0:simulate_movement(nil, vector(), 1)
end

function slot_0_135_1(arg_349_0, arg_349_1, arg_349_2)
	local var_349_0, var_349_1 = utils.trace_bullet(arg_349_0, arg_349_1, arg_349_2, function(arg_350_0)
		return arg_350_0 ~= arg_349_0 and arg_350_0:is_enemy()
	end)

	return var_349_0, var_349_1
end

function slot_0_136_1(arg_351_0, arg_351_1, arg_351_2, arg_351_3, arg_351_4)
	local var_351_0 = arg_351_2.m_iHealth
	local var_351_1 = arg_351_0.origin + vector(0, 0, arg_351_0.view_offset)

	for iter_351_0 = 1, #arg_351_3 do
		local var_351_2 = arg_351_3[iter_351_0]
		local var_351_3, var_351_4 = slot_0_135_1(arg_351_1, var_351_1, var_351_2.pos)
		local var_351_5 = arg_351_4 <= var_351_3
		local var_351_6 = var_351_0 <= var_351_3

		if var_351_5 or var_351_6 then
			return arg_351_0, true
		end
	end

	return arg_351_0, false
end

function slot_0_137_1(arg_352_0)
	local var_352_0 = entity.get_local_player()

	if not var_352_0 or var_352_0 == nil then
		return
	end

	if not arg_352_0 or arg_352_0 == nil then
		arg_352_0 = var_352_0
	end

	if slot_0_113_2 == nil then
		slot_0_113_2 = slot_0_123_1(arg_352_0)
	end
end

function slot_0_138_1(arg_353_0, arg_353_1, arg_353_2, arg_353_3, arg_353_4, arg_353_5, arg_353_6)
	arg_353_0.view_angles.y = arg_353_4

	arg_353_3:think(1)

	if bit.band(arg_353_3.flags, slot_0_81_1) == 0 then
		return nil, false
	end

	local var_353_0, var_353_1 = slot_0_136_1(arg_353_3, arg_353_1, arg_353_2, arg_353_5, arg_353_6)

	if var_353_1 then
		arg_353_3:think(1)
	end

	return arg_353_3, var_353_1
end

function slot_0_139_1(arg_354_0, arg_354_1, arg_354_2)
	if not slot_0_132_1() then
		return false
	end

	local var_354_0 = globals.frametime
	local var_354_1 = slot_0_121_1()
	local var_354_2 = slot_0_122_1()
	local var_354_3 = slot_0_124_1()

	if slot_0_111_1 ~= nil and slot_0_128_1(slot_0_111_1) then
		local var_354_4 = slot_0_111_1.ctx
		local var_354_5 = slot_0_111_1.target
		local var_354_6 = var_354_5.m_iHealth

		if var_354_2 >= 100 then
			var_354_2 = var_354_2 + var_354_6 - 100
		end

		local var_354_7 = slot_0_127_1(var_354_3, arg_354_1, arg_354_2, var_354_5, var_354_2)
		local var_354_8, var_354_9 = slot_0_136_1(var_354_4, arg_354_1, var_354_5, var_354_7, var_354_2)

		if var_354_9 then
			slot_0_111_1.simtime = 0
		end

		slot_0_111_1.simtime = slot_0_111_1.simtime + var_354_0

		return true
	end

	if var_354_1 > 0 then
		if slot_0_112_1 > 0 then
			slot_0_112_1 = slot_0_112_1 - var_354_0

			return false
		end

		slot_0_112_1 = var_354_1
	end

	if not slot_0_129_1(arg_354_0) then
		return false
	end

	local var_354_10 = arg_354_1.m_fFlags

	if bit.band(var_354_10, slot_0_81_1) == 0 then
		return false
	end

	if arg_354_1.m_vecVelocity:length2dsqr() > 6400 then
		return false
	end

	local var_354_11 = entity.get_threat()

	if var_354_11 == nil or var_354_11:is_dormant() then
		return false
	end

	local var_354_12 = var_354_11.m_iHealth

	if var_354_2 >= 100 then
		var_354_2 = var_354_2 + var_354_12 - 100
	end

	local var_354_13 = slot_0_127_1(var_354_3, arg_354_1, arg_354_2, var_354_11, var_354_2)
	local var_354_14
	local var_354_15
	local var_354_16 = arg_354_1:get_origin()
	local var_354_17 = (var_354_11:get_origin() - var_354_16):angles().y + 180
	local var_354_18 = var_354_17 - 90
	local var_354_19 = var_354_17 + 90
	local var_354_20 = arg_354_0.view_angles:clone()
	local var_354_21 = arg_354_0.forwardmove
	local var_354_22 = arg_354_0.sidemove
	local var_354_23 = arg_354_0.in_duck
	local var_354_24 = arg_354_0.in_jump
	local var_354_25 = arg_354_0.in_speed

	arg_354_0.forwardmove = 450
	arg_354_0.sidemove = 0
	arg_354_0.in_duck = false
	arg_354_0.in_jump = false
	arg_354_0.in_speed = false

	local var_354_26 = slot_0_134_1(arg_354_1)
	local var_354_27 = slot_0_134_1(arg_354_1)
	local var_354_28 = 0
	local var_354_29 = 0

	for iter_354_0 = 1, 20 do
		if var_354_28 ~= -1 then
			var_354_28 = iter_354_0

			local var_354_30, var_354_31 = slot_0_138_1(arg_354_0, arg_354_1, var_354_11, var_354_26, var_354_18, var_354_13, var_354_2)

			if var_354_30 == nil then
				var_354_28 = -1
			end

			if var_354_31 then
				slot_0_111_1 = slot_0_133_1(var_354_30, var_354_11)

				break
			end
		end

		if var_354_29 ~= -1 then
			var_354_29 = iter_354_0

			local var_354_32, var_354_33 = slot_0_138_1(arg_354_0, arg_354_1, var_354_11, var_354_27, var_354_19, var_354_13, var_354_2)

			if var_354_32 == nil then
				var_354_29 = -1
			end

			if var_354_33 then
				slot_0_111_1 = slot_0_133_1(var_354_32, var_354_11)

				break
			end
		end
	end

	arg_354_0.view_angles.y = var_354_20.y
	arg_354_0.forwardmove = var_354_21
	arg_354_0.sidemove = var_354_22
	arg_354_0.in_duck = var_354_23
	arg_354_0.in_jump = var_354_24
	arg_354_0.in_speed = var_354_25

	return slot_0_111_1 ~= nil
end

function slot_0_140_1(arg_355_0, arg_355_1, arg_355_2)
	local var_355_0 = arg_355_2 - arg_355_1:get_origin()
	local var_355_1 = var_355_0:length2dsqr()

	if var_355_1 < 25 then
		local var_355_2 = arg_355_1.m_vecVelocity
		local var_355_3 = var_355_2:length()

		arg_355_0.move_yaw = var_355_2:angles().y
		arg_355_0.forwardmove = -var_355_3
		arg_355_0.sidemove = 0

		return true, var_355_1
	end

	arg_355_0.move_yaw = var_355_0:angles().y
	arg_355_0.forwardmove = 450
	arg_355_0.sidemove = 0

	return false, var_355_1
end

function slot_0_141_1(arg_356_0)
	arg_356_0.in_duck = false
	arg_356_0.in_jump = false
	arg_356_0.in_speed = false
	arg_356_0.in_forward = true
	arg_356_0.in_back = false
	arg_356_0.in_moveleft = false
	arg_356_0.in_moveright = false
end

function slot_0_142_1(arg_357_0, arg_357_1, arg_357_2, arg_357_3)
	slot_0_137_1(arg_357_1)

	local var_357_0 = slot_0_131_1(arg_357_1, arg_357_2, arg_357_3)
	local var_357_1 = slot_0_139_1(arg_357_0, arg_357_1, arg_357_2)

	if slot_0_111_1 == nil then
		return
	end

	if slot_0_120_1() < slot_0_111_1.simtime then
		var_357_1 = false
	end

	if arg_357_3.weapon_type == 5 and not arg_357_1.m_bIsScoped then
		var_357_1 = false
	end

	if slot_0_111_1.retreat <= 0 and var_357_0 and var_357_1 then
		local var_357_2 = slot_0_111_1.ctx
		local var_357_3, var_357_4 = slot_0_140_1(arg_357_0, arg_357_1, var_357_2.origin)

		slot_0_141_1(arg_357_0)
		slot_0_116_1()

		slot_0_111_1.retreat = 0

		if var_357_3 then
			slot_0_111_1.retreat = 1
		end

		if slot_0_80_1.show_simulation.value then
			slot_0_77_0.box_new(var_357_2.origin, var_357_2.obb_mins, var_357_2.obb_maxs, vector(), color(0, 0, 0, 0), slot_0_80_1.show_simulation.color.value, globals.tickinterval * 2)
		end

		return
	end

	if slot_0_111_1.retreat == -1 then
		return
	end

	local var_357_5, var_357_6 = slot_0_140_1(arg_357_0, arg_357_1, slot_0_113_2)

	slot_0_141_1(arg_357_0)

	slot_0_111_1.retreat = slot_0_111_1.retreat + 1

	if slot_0_111_1.retreat >= 3 then
		slot_0_24_0.double_tap:override(false)
	end

	if var_357_0 and var_357_5 then
		slot_0_114_3()
		slot_0_115_2()
	end
end

function slot_0_143_1(arg_358_0)
	local var_358_0 = entity.get_local_player()

	if var_358_0 == nil then
		return
	end

	local var_358_1 = var_358_0:get_player_weapon()

	if var_358_1 == nil then
		return
	end

	local var_358_2 = var_358_1:get_weapon_info()

	if var_358_2 == nil then
		return
	end

	local var_358_3 = slot_0_126_1(var_358_1, var_358_2)

	if not slot_0_130_1(var_358_3) then
		return
	end

	slot_0_142_1(arg_358_0, var_358_0, var_358_1, var_358_2)
end

function slot_0_144_1()
	if slot_0_111_1 == nil then
		return nil
	end

	slot_0_111_1.retreat = 1
end

slot_0_80_1:set_callback(function(arg_360_0)
	local var_360_0 = arg_360_0:get()

	if not var_360_0 then
		slot_0_114_3()
		slot_0_115_2()

		slot_0_113_2 = nil
	end

	if var_360_0 then
		slot_0_113_2 = slot_0_137_1()
	end

	events.aim_fire(slot_0_144_1, var_360_0)
	events.createmove(slot_0_143_1, var_360_0)
end, true)

slot_0_80_0 = true
slot_0_81_0 = nil
slot_0_82_1 = slot_0_25_0.features.predict:switch("\v\f<person-ski-jumping>    \rJump scout", false, "\v\f<circle-info>    \rAllows you to jump in place without moving. Also works with a revolver.")

slot_0_23_0.new("jump_scout", slot_0_82_1, slot_0_27_0.features.aimbot)

slot_0_83_2 = false

function slot_0_84_3()
	if slot_0_83_2 then
		slot_0_83_2 = false
		slot_0_80_0 = true

		slot_0_24_0.air_strafe:override()
		slot_0_24_0.auto_stop.options:override()
	end
end

function slot_0_85_4(arg_362_0)
	if not slot_0_80_0 then
		slot_0_84_3()
	end

	local var_362_0 = slot_0_38_0.velocity
	local var_362_1 = slot_0_38_0.anim_state
	local var_362_2 = slot_0_38_0.weapon_info

	if not var_362_1 or not var_362_2 or not var_362_0 then
		return
	end

	local var_362_3 = var_362_2.console_name

	if var_362_3 ~= "weapon_ssg08" and var_362_3 ~= "weapon_revolver" then
		return
	end

	if arg_362_0.in_moveleft or arg_362_0.in_moveright or arg_362_0.in_forward or arg_362_0.in_back or arg_362_0.in_left or arg_362_0.in_right then
		return
	end

	if arg_362_0.forwardmove + arg_362_0.sidemove > 0 then
		return
	end

	if var_362_1.on_ground and not arg_362_0.in_jump then
		return
	end

	if var_362_0 > 1.2 then
		return
	end

	slot_0_83_2 = true
	slot_0_80_0 = false

	slot_0_24_0.air_strafe:override(false)
	slot_0_24_0.auto_stop.options:override({
		"In Air"
	})
end

slot_0_82_1:set_event("createmove", slot_0_85_4)
slot_0_82_1:set_callback(function(arg_363_0)
	if not arg_363_0.value then
		slot_0_84_3()
	end
end)

slot_0_82_0 = nil
slot_0_83_1 = slot_0_25_0.features.air:switch("\v\f<tower-broadcast>    \rAir exploit", false, nil, function(arg_364_0, arg_364_1)
	return {
		ticks = arg_364_0:slider("\v\f<clock-rotate-left>      \rDuration", 5, 40, 10, 1, "t")
	}, true
end)

slot_0_23_0.new("air_exploit", slot_0_83_1, slot_0_27_0.features.aimbot)

function slot_0_84_2()
	slot_0_24_0.double_tap.lag_limit:override()
end

function slot_0_85_3(arg_366_0)
	local var_366_0 = slot_0_38_0.anim_state
	local var_366_1 = slot_0_38_0.weapon_info

	if not var_366_0 or not var_366_1 then
		return slot_0_84_2()
	end

	if var_366_0.on_ground and not arg_366_0.in_jump then
		return slot_0_84_2()
	end

	if var_366_1.weapon_type == 9 then
		return slot_0_84_2()
	end

	if slot_0_38_0.exploit_charge == 1 and globals.tickcount % slot_0_83_1.ticks.value == 0 then
		arg_366_0.force_defensive = true

		slot_0_24_0.double_tap.lag_limit:override(math.random(7))
		rage.exploit:force_teleport()
	else
		rage.exploit:force_charge()
	end
end

slot_0_83_1:set_event("createmove", slot_0_85_3)
slot_0_83_1:set_callback(function(arg_367_0)
	if not arg_367_0.value then
		slot_0_84_2()
	end
end)

slot_0_83_0 = nil
slot_0_84_1 = slot_0_25_0.features.air:switch("\v\f<person-from-portal>     \rAir teleport", false, "\v\f<circle-info>    \rJump out with teleportation onto your opponents.", function(arg_368_0, arg_368_1)
	return {
		allow_on_cross = arg_368_0:switch("\v\f<person-running>    \rAllow on cross"),
		weapons = arg_368_0:listable("\v\f<shield>    \rWeapons", {
			"Awp",
			"Scout",
			"Taser"
		})
	}, true
end)

slot_0_23_0.new("air_teleport", slot_0_84_1, slot_0_27_0.features.aimbot)

slot_0_85_2 = {
	[9] = 1,
	[40] = 2,
	[31] = 3
}

function slot_0_86_4(arg_369_0)
	if not slot_0_80_0 then
		return
	end

	local var_369_0 = slot_0_38_0.me
	local var_369_1 = slot_0_38_0.eye
	local var_369_2 = slot_0_38_0.weapon
	local var_369_3 = slot_0_38_0.players
	local var_369_4 = slot_0_38_0.is_alive
	local var_369_5 = slot_0_38_0.anim_state
	local var_369_6 = slot_0_38_0.is_double_tap
	local var_369_7 = slot_0_38_0.exploit_charge

	if not var_369_0 or not var_369_1 or not var_369_2 or not var_369_4 or not var_369_5 or var_369_5.on_ground or not (#var_369_3 > 0) then
		return
	end

	if not slot_0_38_0.is_double_tap or slot_0_38_0.exploit_charge ~= 1 then
		return
	end

	if arg_369_0.in_jump and not slot_0_84_1.allow_on_cross.value then
		return
	end

	local var_369_8 = var_369_2:get_weapon_index()

	if not var_369_8 then
		return
	end

	local var_369_9 = slot_0_85_2[var_369_8]

	if not var_369_9 then
		return
	end

	if not slot_0_84_1.weapons:get(var_369_9) then
		return
	end

	local var_369_10 = var_369_0:simulate_movement()

	var_369_10:think(6)

	local var_369_11 = vector(var_369_10.origin.x, var_369_10.origin.y, var_369_1.z)
	local var_369_12 = false

	for iter_369_0, iter_369_1 in ipairs(var_369_3) do
		if not iter_369_1.is_enemy or not iter_369_1.is_alive or iter_369_1.is_dormant then
			-- block empty
		else
			local var_369_13 = iter_369_1.entity:get_hitbox_position(3)
			local var_369_14, var_369_15 = utils.trace_bullet(var_369_0, var_369_11, var_369_13)

			if var_369_14 > 10 and var_369_15.entity and var_369_15.entity == iter_369_1.entity then
				var_369_12 = true

				break
			end
		end
	end

	if var_369_12 then
		rage.exploit:force_teleport()
	end
end

slot_0_84_1:set_event("createmove", slot_0_86_4)

slot_0_84_0 = nil
slot_0_85_1 = {
	data = {},
	names = {},
	new = function(arg_370_0, arg_370_1, arg_370_2)
		arg_370_0.data[arg_370_1] = arg_370_2

		table.insert(arg_370_0.names, arg_370_1)
	end
}

slot_0_85_1:new("Stand", function(arg_371_0, arg_371_1, arg_371_2, arg_371_3)
	return arg_371_2.on_ground and arg_371_3 < 2 and not arg_371_0.in_duck and not arg_371_0.in_jump
end)
slot_0_85_1:new("Crouch", function(arg_372_0, arg_372_1, arg_372_2, arg_372_3)
	return arg_372_2.on_ground and arg_372_0.in_duck and not arg_372_0.in_jump
end)
slot_0_85_1:new("Slow walk", function(arg_373_0, arg_373_1, arg_373_2, arg_373_3)
	return slot_0_38_0.is_slow_walk and not arg_373_0.in_jump
end)

slot_0_86_3 = {
	data = {},
	names = {},
	new = function(arg_374_0, arg_374_1, arg_374_2)
		arg_374_0.data[arg_374_1] = arg_374_2

		table.insert(arg_374_0.names, arg_374_1)
	end
}

slot_0_86_3:new("Pistols", function(arg_375_0, arg_375_1, arg_375_2, arg_375_3, arg_375_4, arg_375_5)
	return arg_375_1.weapon_type == 1 and arg_375_0 ~= "CDEagle"
end)
slot_0_86_3:new("Desert Eagle", function(arg_376_0, arg_376_1, arg_376_2, arg_376_3, arg_376_4, arg_376_5)
	return arg_376_0 == "CDEagle" and (not arg_376_4.on_ground or not arg_376_2.in_duck)
end)
slot_0_86_3:new("Auto Snipers", function(arg_377_0, arg_377_1, arg_377_2, arg_377_3, arg_377_4, arg_377_5)
	return arg_377_0 == "CWeaponSCAR20" or arg_377_0 == "CWeaponG3SG1"
end)
slot_0_86_3:new("Desert Eagle & Crouch", function(arg_378_0, arg_378_1, arg_378_2, arg_378_3, arg_378_4, arg_378_5)
	return arg_378_0 == "CDEagle" and arg_378_4.on_ground and arg_378_2.in_duck
end)

slot_0_87_3 = slot_0_25_0.features.premium:switch("\v\f<shield>    \rAuto OS", false, nil, function(arg_379_0, arg_379_1)
	local var_379_0 = {
		states = arg_379_0:listable("\v\f<wave-pulse>   \rStates", slot_0_85_1.names),
		avoid_states = arg_379_0:listable("\v\f<arrow-rotate-right>   \rAvoid", slot_0_86_3.names)
	}

	arg_379_1:tooltip("\v\f<circle-info>   \rEnables hide shots in certain situations with double tap.")
	var_379_0.avoid_states:tooltip("\v\f<circle-info>   \rSelect a state from the list that you would not want the function to work with.\n\n\v\f<lightbulb>   \rFor example, if you select \vPistols\r, then \vAuto OS\r will not work if you are holding a pistol.")
	var_379_0.avoid_states:depend({
		var_379_0.states,
		function()
			return #var_379_0.states.value > 0
		end
	})

	return var_379_0, true
end)

slot_0_23_0.new("auto_hide_shots", slot_0_87_3, slot_0_27_0.features.aimbot)

function slot_0_86_3.get_active(arg_381_0, arg_381_1, arg_381_2, arg_381_3, arg_381_4, arg_381_5, arg_381_6)
	if arg_381_2.is_revolver then
		return true
	end

	for iter_381_0, iter_381_1 in ipairs(arg_381_0.names) do
		local var_381_0 = arg_381_0.data[iter_381_1]

		if slot_0_87_3.avoid_states:get(iter_381_0) and var_381_0 and var_381_0(arg_381_1, arg_381_2, arg_381_3, arg_381_4, arg_381_5, arg_381_6) then
			return true
		end
	end

	return false
end

function slot_0_85_1.get_active(arg_382_0, arg_382_1, arg_382_2, arg_382_3, arg_382_4)
	for iter_382_0, iter_382_1 in ipairs(arg_382_0.names) do
		local var_382_0 = arg_382_0.data[iter_382_1]

		if slot_0_87_3.states:get(iter_382_0) and var_382_0 and var_382_0(arg_382_1, arg_382_2, arg_382_3, arg_382_4) then
			return true
		end
	end

	return false
end

function slot_0_88_2()
	slot_0_24_0.hide_shots:override()
	slot_0_24_0.double_tap:override()
end

function slot_0_89_2(arg_384_0)
	local var_384_0 = slot_0_38_0.me
	local var_384_1 = slot_0_38_0.weapon
	local var_384_2 = slot_0_38_0.weapon_info
	local var_384_3 = slot_0_38_0.anim_state

	if not var_384_0 or not var_384_1 or not var_384_2 or not var_384_3 then
		return
	end

	local var_384_4 = var_384_1:get_classname()
	local var_384_5 = var_384_3.velocity:length()

	if slot_0_24_0.double_tap:get() and not slot_0_24_0.hide_shots:get() and slot_0_38_0.exploit_charge == 1 and not slot_0_24_0.peek_assist:get_override() and not slot_0_24_0.peek_assist:get() and slot_0_85_1:get_active(arg_384_0, var_384_0, var_384_3, var_384_5) and not slot_0_86_3:get_active(var_384_4, var_384_2, arg_384_0, var_384_0, var_384_3, var_384_5) then
		slot_0_24_0.hide_shots:override(true)
		slot_0_24_0.double_tap:override(false)

		return
	end

	slot_0_88_2()
end

slot_0_87_3:set_callback(slot_0_88_2)
slot_0_87_3:set_event("createmove", slot_0_89_2)

slot_0_85_0 = nil
slot_0_86_2 = slot_0_25_0.features.premium:switch("\v\f<syringe>    \rDormant aimbot", false, nil, function(arg_385_0)
	return {
		min_damage = arg_385_0:slider("\v\f<angle>    \rDamage", 0, 100, 20),
		min_inaccuracy = arg_385_0:slider(" \v\f<person-walking>     \rInaccuracy", 0, 100, 80)
	}
end)

slot_0_23_0.new("dormant_aimbot", slot_0_86_2, slot_0_27_0.features.aimbot)

function slot_0_87_2(arg_386_0, arg_386_1)
	local var_386_0 = math.sqrt(arg_386_0.forwardmove * arg_386_0.forwardmove + arg_386_0.sidemove * arg_386_0.sidemove)

	if arg_386_1 <= 0 or var_386_0 <= 0 then
		return
	end

	if arg_386_0.in_duck then
		arg_386_1 = arg_386_1 * 2.94117647
	end

	if var_386_0 <= arg_386_1 then
		return
	end

	local var_386_1 = arg_386_1 / var_386_0

	arg_386_0.forwardmove = arg_386_0.forwardmove * var_386_1
	arg_386_0.sidemove = arg_386_0.sidemove * var_386_1
end

slot_0_88_1 = {
	"100% info",
	"updated by shared esp",
	"updated by sounds",
	"not updated",
	"data is unavailable or too old"
}

function slot_0_89_1(arg_387_0)
	local var_387_0
	local var_387_1 = slot_0_38_0.eye

	for iter_387_0, iter_387_1 in ipairs(slot_0_38_0.players) do
		if not iter_387_1.is_alive or not iter_387_1.is_dormant or not iter_387_1.is_enemy then
			-- block empty
		else
			local var_387_2 = iter_387_1.entity
			local var_387_3 = var_387_2:get_bbox()
			local var_387_4 = var_387_2:get_network_state()

			if var_387_4 == 0 or not (var_387_3.alpha > 0) then
				-- block empty
			else
				local var_387_5 = var_387_2:get_origin() + vector(0, 0, 35) + vector(utils.random_float(-7, 7), utils.random_float(-7, 7), utils.random_float(-10, 25))
				local var_387_6, var_387_7 = utils.trace_bullet(arg_387_0, var_387_1, var_387_5, function(arg_388_0)
					return arg_388_0:is_player() and arg_388_0:is_enemy()
				end)

				if var_387_6 >= slot_0_86_2.min_damage.value then
					var_387_0 = {
						entity = var_387_2,
						damage = var_387_6,
						angles = var_387_1:to(var_387_5):angles(),
						network_state = slot_0_88_1[var_387_4] or var_387_4
					}
				end
			end
		end
	end

	return var_387_0
end

function slot_0_90_1(arg_389_0)
	local var_389_0 = slot_0_38_0.me
	local var_389_1 = slot_0_38_0.weapon
	local var_389_2 = slot_0_38_0.weapon_info

	if not var_389_0 or not slot_0_38_0.is_alive or not var_389_1 or not var_389_2 then
		return
	end

	if not slot_0_38_0.anim_state.on_ground or arg_389_0.in_jump then
		return
	end

	if var_389_2.bullets < 1 then
		return
	end

	local var_389_3 = globals.curtime
	local var_389_4 = var_389_2.weapon_type == 5
	local var_389_5 = math.clamp(1 / var_389_1:get_inaccuracy(), 0, 666)
	local var_389_6 = false

	if var_389_4 or var_389_2.is_revolver then
		var_389_6 = var_389_3 + 0.3 > var_389_0.m_flNextAttack and var_389_3 + 0.3 > var_389_1.m_flNextPrimaryAttack
	end

	if not var_389_6 then
		return
	end

	local var_389_7 = slot_0_89_1(var_389_0)

	if not var_389_7 then
		return
	end

	if var_389_4 and not var_389_0.m_bIsScoped then
		arg_389_0.in_attack2 = true
	end

	local var_389_8 = var_389_0.m_bIsScoped and var_389_2.max_player_speed_alt or var_389_2.max_player_speed

	slot_0_87_2(arg_389_0, var_389_8 * 0.1)

	if var_389_5 < slot_0_86_2.min_inaccuracy.value then
		return
	end

	local var_389_9 = var_389_0.m_aimPunchAngle * cvar.weapon_recoil_scale:float()

	arg_389_0.view_angles = var_389_7.angles - var_389_9
	arg_389_0.in_attack = true
end

slot_0_86_2:set_event("createmove", slot_0_90_1)

slot_0_86_1 = nil
slot_0_87_1 = false
slot_0_88_0 = {}
slot_0_89_0 = {}
slot_0_90_0 = {}
slot_0_91_0 = slot_0_25_0.antiaim.main.par:name()
slot_0_92_0 = 3
slot_0_93_0 = 8
slot_0_94_0 = "Global"
slot_0_95_0 = {
	slot_0_94_0,
	"Stand",
	"Run",
	"Walk",
	"Crouch",
	"Creeping",
	"Air",
	"Air crouch",
	"On use"
}
slot_0_96_0 = {
	"Stand",
	"Run",
	"Walk",
	"Crouch",
	"Creeping",
	"Air",
	"Air crouch",
	"On peek"
}
slot_0_97_0 = {
	"Terrorists",
	"Counter-Terrorists"
}
slot_0_98_0 = {
	Terrorists = "T",
	["Counter-Terrorists"] = "CT"
}
slot_0_99_0 = {
	"Base",
	"Terrorists",
	"Counter-Terrorists"
}
slot_0_100_0 = {
	Right = 90,
	Forward = 180,
	Left = -90
}
slot_0_88_0.unmatched_features = slot_0_25_0.antiaim.enable:label("\v\f<trophy>    \rUnmatched features", nil, function(arg_390_0)
	return {
		disable_defensive = arg_390_0:switch("\v\f<solar-system>    \rDisable defensive"),
		warmup_fake_duck = arg_390_0:switch("\v\f<duck>    \rFake duck on warmup")
	}
end)

slot_0_88_0.unmatched_features:depend(slot_0_27_0.antiaim.setup)

slot_0_88_0.fake_flick = slot_0_25_0.antiaim.setup:switch("\v\f<arrows-turn-right>     \rFake flick"):depend(slot_0_27_0.antiaim.setup)

slot_0_88_0.fake_flick:disabled(true)

slot_0_88_0.allow_on_use = slot_0_25_0.antiaim.setup:switch("\v\f<flag-swallowtail>     \rAllow on use"):depend(slot_0_27_0.antiaim.setup)
slot_0_88_0.avoid_backstab = slot_0_25_0.antiaim.setup:switch("\v\f<knife-kitchen>    \rAvoid backstab"):depend(slot_0_27_0.antiaim.setup)
slot_0_88_0.safe_head = slot_0_25_0.antiaim.setup_two:switch("\v\f<shield-check>     \rSafe head", false, nil, function(arg_391_0)
	return {
		states = arg_391_0:listable(" \v\f<person-walking>     \rStates", {
			"Air",
			"Stand",
			"Crouch"
		}),
		options = arg_391_0:listable("\a[grey]\f<knife-kitchen>    \rAir options", {
			"Zeus",
			"Knife",
			"Other weapons too"
		}),
		height_difference = arg_391_0:slider("\a[grey]\f<line-height>    \rH. Gap", 0, 100, 35, 1, function(arg_392_0)
			return arg_392_0 == 0 and "Off" or arg_392_0
		end)
	}, true
end)

slot_0_88_0.safe_head:depend(slot_0_27_0.antiaim.setup)
slot_0_88_0.safe_head.options:depend({
	slot_0_88_0.safe_head.states,
	1
})
slot_0_88_0.safe_head:tooltip("\v\f<circle-info>   \rAllows to use safe presets on different states to hide head behind body")

slot_0_88_0.unsafe_yaw = slot_0_25_0.antiaim.setup_two:switch("\v\f<shield-exclamation>     \rUnsafe yaw", false, nil, function(arg_393_0)
	local var_393_0 = {
		events = arg_393_0:listable("\v\f<circle-waveform-lines>    \rEvents", {
			"Warmup",
			"No enemies"
		}),
		yaw = arg_393_0:list("\a[grey]\f<arrow-right-arrow-left>    \rYaw", {
			"\f<arrow-rotate-right>    Spin",
			"\f<shuffle>    Random"
		}),
		pitch = arg_393_0:list("\a[grey]\f<arrow-down-arrow-up>     \rPitch", {
			"\f<circle-small>     Zero",
			"\f<arrow-down>    Down"
		})
	}

	slot_0_23_0.set_callback_list(var_393_0.yaw)
	slot_0_23_0.set_callback_list(var_393_0.pitch)

	local var_393_1 = {
		var_393_0.events,
		function(arg_394_0)
			return #arg_394_0:get() > 0
		end
	}

	var_393_0.yaw:depend(var_393_1)
	var_393_0.pitch:depend(var_393_1)

	return var_393_0, true
end)

slot_0_88_0.unsafe_yaw:depend(slot_0_27_0.antiaim.setup)

slot_0_88_0.view = slot_0_25_0.antiaim.binds:combo("\v\f<magnifying-glass>     \rView", {
	"At target",
	"Local view"
}):depend(slot_0_27_0.antiaim.setup)
slot_0_88_0.manual = slot_0_25_0.antiaim.binds:combo("\v\f<location-arrow>     \rManual", {
	"Backward",
	"Forward",
	"Right",
	"Left"
}, nil, function(arg_395_0)
	return {
		static = arg_395_0:switch("\v\f<lock>    \rStatic")
	}
end)
slot_0_52_0 = slot_0_88_0.manual

slot_0_88_0.manual:depend(slot_0_27_0.antiaim.setup)

slot_0_88_0.freestanding = slot_0_25_0.antiaim.binds:switch("\v\f<arrows-split-up-and-left>     \rFreestand", false, nil, function(arg_396_0)
	return {
		static = arg_396_0:switch("\v\f<lock>    \rStatic")
	}
end)

slot_0_88_0.freestanding:depend(slot_0_27_0.antiaim.setup)

slot_0_88_0.state = slot_0_25_0.antiaim.state:combo(" \v\f<person-walking>     \rState", slot_0_95_0, false, nil, function(arg_397_0, arg_397_1)
	local var_397_0 = {
		use_teams = arg_397_0:switch(" \v\f<person-falling>    \rUse teams")
	}

	var_397_0.apply_to_opposite_team = arg_397_0:button("          \v\f<share>    \rApply to opposite team          ", nil, true):depend(var_397_0.use_teams)
	var_397_0.export_state = arg_397_0:button("    \v\f<file-export>    \rCopy    ", nil, true)
	var_397_0.import_state = arg_397_0:button("    \v\f<file-import>    \rPaste    ", nil, true)
	var_397_0.reset_state = arg_397_0:button("   \v\f<rotate-right>   ", nil, true)
	var_397_0.log = arg_397_0:label("")

	var_397_0.log:visibility(false)

	local function var_397_1()
		local var_398_0 = arg_397_1.value
		local var_398_1 = var_397_0.use_teams.value and slot_0_88_0.team.value or slot_0_99_0[1]

		for iter_398_0, iter_398_1 in pairs(slot_0_89_0[var_398_1][var_398_0]) do
			pcall(iter_398_1.reset, iter_398_1)
		end
	end

	local function var_397_2()
		local var_399_0, var_399_1, var_399_2, var_399_3, var_399_4 = pcall(function()
			local var_400_0 = arg_397_1.value
			local var_400_1 = var_397_0.use_teams.value and slot_0_88_0.team.value or slot_0_99_0[1]
			local var_400_2 = json.parse(slot_0_9_0.decode(string.match(slot_0_12_0.get(), ">(.-)<")))

			if var_400_2.settings.antiaim.states[var_400_2.team][var_400_2.state].enable == nil then
				var_400_2.settings.antiaim.states[var_400_2.team][var_400_2.state].enable = true
			end

			local var_400_3 = {
				antiaim = {
					states = {
						[var_400_1] = {
							[var_400_0] = var_400_2.settings.antiaim.states[var_400_2.team][var_400_2.state]
						}
					}
				}
			}

			slot_0_35_0.package:load(var_400_3, "antiaim", "states", var_400_1, var_400_0)

			return slot_0_98_0[var_400_2.team] or var_400_2.team, var_400_2.state, slot_0_98_0[var_400_1] or var_400_1, var_400_0
		end)
		local var_399_5 = slot_0_8_0.string(var_399_0 and string.format("\v\f<check>    \r[\v%s\r] \v%s \rsuccessfully imported to \r[\v%s\r] \v%s\r.", var_399_1, var_399_2, var_399_3, var_399_4) or "\v\f<xmark>   \rSomething went wrong...")

		var_397_0.log:name(var_399_5)
		var_397_0.log:visibility(true)
		utils.execute_after(2, function()
			var_397_0.log:visibility(false)
		end)
	end

	local function var_397_3()
		local var_402_0, var_402_1, var_402_2 = pcall(function()
			local var_403_0 = arg_397_1.value
			local var_403_1 = var_397_0.use_teams.value and slot_0_88_0.team.value or slot_0_99_0[1]
			local var_403_2 = slot_0_98_0[var_403_1] or var_403_1
			local var_403_3 = slot_0_35_0.package:save("antiaim", "states", var_403_1, var_403_0)
			local var_403_4 = {
				team = var_403_1,
				state = var_403_0,
				settings = var_403_3
			}

			slot_0_12_0.set(("evalate[Builder:%s:%s]>%s<"):format(var_403_2, var_403_0, slot_0_9_0.encode(json.stringify(var_403_4))))

			return var_403_0, var_403_2
		end)
		local var_402_3 = slot_0_8_0.string(var_402_0 and string.format("\v\f<check>    \r[\v%s\r] \v%s \rsuccessfully copied.", var_402_2, var_402_1) or "\v\f<xmark>   \rSomething went wrong...")

		var_397_0.log:name(var_402_3)
		var_397_0.log:visibility(true)
		utils.execute_after(2, function()
			var_397_0.log:visibility(false)
		end)
	end

	local function var_397_4()
		local var_405_0, var_405_1, var_405_2, var_405_3 = pcall(function()
			local var_406_0 = slot_0_88_0.team.value
			local var_406_1 = arg_397_1.value
			local var_406_2 = slot_0_35_0.package:save("antiaim", "states", var_406_0, var_406_1)
			local var_406_3 = slot_0_88_0.team.value == slot_0_97_0[1] and slot_0_97_0[2] or slot_0_97_0[1]
			local var_406_4 = {
				antiaim = {
					states = {
						[var_406_3] = {
							[var_406_1] = var_406_2.antiaim.states[var_406_0][var_406_1]
						}
					}
				}
			}

			slot_0_35_0.package:load(var_406_4, "antiaim", "states", var_406_3, var_406_1)

			return var_406_1, slot_0_98_0[var_406_0], slot_0_98_0[var_406_3]
		end)
		local var_405_4 = slot_0_8_0.string(var_405_0 and string.format("\v\f<check>    \v%s\r's \v%s \rapplied to \v%s\r.", var_405_2, var_405_1, var_405_3) or "\v\f<xmark>   \rSomething went wrong...")

		var_397_0.log:name(var_405_4)
		var_397_0.log:visibility(true)
		utils.execute_after(2, function()
			var_397_0.log:visibility(false)
		end)
	end

	var_397_0.reset_state:set_callback(var_397_1)
	var_397_0.import_state:set_callback(var_397_2)
	var_397_0.export_state:set_callback(var_397_3)
	var_397_0.apply_to_opposite_team:set_callback(var_397_4)

	return var_397_0
end)

slot_0_88_0.state:depend(slot_0_27_0.antiaim.builder)

slot_0_88_0.team = slot_0_25_0.antiaim.state:combo(" \v\f<person-falling>    \rTeam", slot_0_97_0)

slot_0_88_0.team:depend(slot_0_88_0.state.use_teams, slot_0_27_0.antiaim.builder)
slot_0_25_0.antiaim.message:label("\aFFA500FF\f<triangle-exclamation>    \rSeems like \aFFA500FFunmatched feature \renabled"):depend(slot_0_88_0.unmatched_features.disable_defensive, slot_0_27_0.antiaim.defensive)

slot_0_88_0.defensive_state = slot_0_25_0.antiaim.defensive_state:combo(" \v\f<person-walking>     \rState", slot_0_96_0, false, nil, function(arg_408_0, arg_408_1)
	local var_408_0 = {
		use_teams = arg_408_0:switch(" \v\f<person-falling>    \rUse teams")
	}

	var_408_0.apply_to_opposite_team = arg_408_0:button("          \v\f<share>    \rApply to opposite team          ", nil, true):depend(var_408_0.use_teams)
	var_408_0.export_state = arg_408_0:button("    \v\f<file-export>    \rCopy    ", nil, true)
	var_408_0.import_state = arg_408_0:button("    \v\f<file-import>    \rPaste    ", nil, true)
	var_408_0.reset_state = arg_408_0:button("   \v\f<rotate-right>   ", nil, true)
	var_408_0.log = arg_408_0:label("")

	var_408_0.log:visibility(false)

	local function var_408_1()
		local var_409_0 = arg_408_1.value
		local var_409_1 = var_408_0.use_teams.value and slot_0_88_0.defensive_team.value or slot_0_99_0[1]

		print(staet, var_409_1)

		for iter_409_0, iter_409_1 in pairs(slot_0_90_0[var_409_1][var_409_0]) do
			pcall(iter_409_1.reset, iter_409_1)
		end
	end

	local function var_408_2()
		local var_410_0, var_410_1, var_410_2, var_410_3, var_410_4 = pcall(function()
			local var_411_0 = arg_408_1.value
			local var_411_1 = var_408_0.use_teams.value and slot_0_88_0.defensive_team.value or slot_0_99_0[1]
			local var_411_2 = json.parse(slot_0_9_0.decode(string.match(slot_0_12_0.get(), ">(.-)<")))
			local var_411_3 = {
				antiaim = {
					defensive_states = {
						[var_411_1] = {
							[var_411_0] = var_411_2.settings.antiaim.defensive_states[var_411_2.team][var_411_2.state]
						}
					}
				}
			}

			slot_0_35_0.package:load(var_411_3, "antiaim", "defensive_states", var_411_1, var_411_0)

			return slot_0_98_0[var_411_2.team] or var_411_2.team, var_411_2.state, slot_0_98_0[var_411_1] or var_411_1, var_411_0
		end)
		local var_410_5 = slot_0_8_0.string(var_410_0 and string.format("\v\f<check>    \r[\v%s\r] \v%s \rsuccessfully imported to \r[\v%s\r] \v%s\r.", var_410_1, var_410_2, var_410_3, var_410_4) or "\v\f<xmark>   \rSomething went wrong...")

		var_408_0.log:name(var_410_5)
		var_408_0.log:visibility(true)
		utils.execute_after(2, function()
			var_408_0.log:visibility(false)
		end)
	end

	local function var_408_3()
		local var_413_0, var_413_1, var_413_2 = pcall(function()
			local var_414_0 = arg_408_1.value
			local var_414_1 = var_408_0.use_teams.value and slot_0_88_0.defensive_team.value or slot_0_99_0[1]
			local var_414_2 = slot_0_98_0[var_414_1] or var_414_1
			local var_414_3 = slot_0_35_0.package:save("antiaim", "defensive_states", var_414_1, var_414_0)
			local var_414_4 = {
				team = var_414_1,
				state = var_414_0,
				settings = var_414_3
			}

			slot_0_12_0.set(("evalate[Builder:%s:%s]>%s<"):format(var_414_2, var_414_0, slot_0_9_0.encode(json.stringify(var_414_4))))

			return var_414_0, var_414_2
		end)
		local var_413_3 = slot_0_8_0.string(var_413_0 and string.format("\v\f<check>    \r[\v%s\r] \v%s \rsuccessfully copied.", var_413_2, var_413_1) or "\v\f<xmark>   \rSomething went wrong...")

		var_408_0.log:name(var_413_3)
		var_408_0.log:visibility(true)
		utils.execute_after(2, function()
			var_408_0.log:visibility(false)
		end)
	end

	local function var_408_4()
		local var_416_0, var_416_1, var_416_2, var_416_3 = pcall(function()
			local var_417_0 = slot_0_88_0.defensive_team.value
			local var_417_1 = arg_408_1.value
			local var_417_2 = slot_0_35_0.package:save("antiaim", "defensive_states", var_417_0, var_417_1)
			local var_417_3 = slot_0_88_0.defensive_team.value == slot_0_97_0[1] and slot_0_97_0[2] or slot_0_97_0[1]
			local var_417_4 = {
				antiaim = {
					defensive_states = {
						[var_417_3] = {
							[var_417_1] = var_417_2.antiaim.defensive_states[var_417_0][var_417_1]
						}
					}
				}
			}

			slot_0_35_0.package:load(var_417_4, "antiaim", "defensive_states", var_417_3, var_417_1)

			return var_417_1, slot_0_98_0[var_417_0], slot_0_98_0[var_417_3]
		end)
		local var_416_4 = slot_0_8_0.string(var_416_0 and string.format("\v\f<check>    \v%s\r's \v%s \rapplied to \v%s\r.", var_416_2, var_416_1, var_416_3) or "\v\f<xmark>   \rSomething went wrong...")

		var_408_0.log:name(var_416_4)
		var_408_0.log:visibility(true)
		utils.execute_after(2, function()
			var_408_0.log:visibility(false)
		end)
	end

	var_408_0.reset_state:set_callback(var_408_1)
	var_408_0.import_state:set_callback(var_408_2)
	var_408_0.export_state:set_callback(var_408_3)
	var_408_0.apply_to_opposite_team:set_callback(var_408_4)

	return var_408_0
end)

slot_0_88_0.defensive_state:depend(slot_0_27_0.antiaim.defensive)

slot_0_88_0.defensive_team = slot_0_25_0.antiaim.defensive_state:combo(" \v\f<person-falling>    \rTeam", slot_0_97_0)

slot_0_88_0.defensive_team:depend(slot_0_88_0.defensive_state.use_teams, slot_0_27_0.antiaim.defensive)

function slot_0_101_1()
	local var_419_0

	if slot_0_38_0.is_warmup then
		var_419_0 = true
	end

	slot_0_24_0.fake_duck:override(var_419_0)
end

function slot_0_102_1()
	slot_0_24_0.fake_duck:override()
end

slot_0_103_1 = slot_0_88_0.unmatched_features.warmup_fake_duck

slot_0_103_1:set_event("createmove", slot_0_101_1)
slot_0_103_1:set_callback(function(arg_421_0)
	if not arg_421_0.value then
		slot_0_102_1()
	end
end)

function slot_0_101_0(arg_422_0, arg_422_1, arg_422_2)
	local var_422_0 = arg_422_0 - 1
	local var_422_1 = {}

	for iter_422_0 = 0, var_422_0 do
		var_422_1[#var_422_1 + 1] = slot_0_15_0(arg_422_1, arg_422_2, iter_422_0 / var_422_0)
	end

	return var_422_1
end

function slot_0_102_0(arg_423_0, arg_423_1, arg_423_2)
	local var_423_0 = slot_0_38_0.realtime % arg_423_0 / arg_423_0

	return slot_0_15_0(arg_423_1, arg_423_2, math.abs(var_423_0 * 2 - 1))
end

function slot_0_103_0(arg_424_0, arg_424_1, arg_424_2)
	local var_424_0 = slot_0_38_0.realtime % arg_424_0 / arg_424_0

	return slot_0_15_0(arg_424_1, arg_424_2, var_424_0)
end

function slot_0_104_0(arg_425_0, arg_425_1)
	slot_0_89_0[arg_425_1] = slot_0_89_0[arg_425_1] or {}
	slot_0_89_0[arg_425_1][arg_425_0] = slot_0_89_0[arg_425_1][arg_425_0] or {}
	slot_425_2_0 = {
		on = slot_0_8_0.create(slot_0_91_0, string.format("## Builder %s %s On", arg_425_0, arg_425_1), 1),
		offset = slot_0_8_0.create(slot_0_91_0, string.format("## Builder %s %s Offset", arg_425_0, arg_425_1), 2),
		modifier = slot_0_8_0.create(slot_0_91_0, string.format("## Builder %s %s Modifier", arg_425_0, arg_425_1), 2),
		desync = slot_0_8_0.create(slot_0_91_0, string.format("## Builder %s %s Desync", arg_425_0, arg_425_1), 2),
		extra = slot_0_8_0.create(slot_0_91_0, string.format("## Builder %s %s Extra", arg_425_0, arg_425_1), 2)
	}

	if arg_425_0 ~= slot_0_94_0 then
		slot_0_89_0[arg_425_1][arg_425_0].enable = slot_425_2_0.on:switch(" \v\f<check>    \rEnable")
	end

	slot_0_89_0[arg_425_1][arg_425_0].offset = slot_425_2_0.offset:slider("\v\f<rotate-right>    \rOffset", -180, 180, 0, 1, "°", nil, function(arg_426_0)
		return {
			add_sides = arg_426_0:switch("\v\f<arrow-right-arrow-left>    \rAdd sides"),
			add_random = arg_426_0:switch("\v\f<shuffle>    \rAdd random")
		}
	end)
	slot_0_89_0[arg_425_1][arg_425_0].offset_add_left = slot_425_2_0.offset:slider("\a[grey]\f<arrow-left>     \rAdd left", -90, 90, 0, 1, "°")
	slot_0_89_0[arg_425_1][arg_425_0].offset_add_right = slot_425_2_0.offset:slider("\a[grey]\f<arrow-right>     \rAdd right", -90, 90, 0, 1, "°")
	slot_0_89_0[arg_425_1][arg_425_0].offset_add_random = slot_425_2_0.offset:slider("\a[grey]\f<shuffle>    \rAdd random", 0, 50, 0, 1, "°")
	slot_0_89_0[arg_425_1][arg_425_0].modifier = slot_425_2_0.modifier:combo("\v\f<arrows-left-right-to-line>   \rModifier", {
		"None",
		"Center",
		"Offset",
		"Random",
		"Ways",
		"Spin",
		"Sway"
	}, nil, function(arg_427_0, arg_427_1)
		local var_427_0 = {
			min_max = arg_427_0:switch("\v\f<split>    \rMin / Max"),
			custom_ways = arg_427_0:switch("\v\f<layer-group>    \rCustom ways"):depend({
				arg_427_1,
				"Ways"
			}),
			apply_delay = arg_427_0:switch("\v\f<clock-rotate-left>    \rApply delay", true):depend({
				arg_427_1,
				"Center",
				"Offset"
			})
		}

		var_427_0.min_max:depend({
			arg_427_1,
			"None",
			true
		}, {
			var_427_0.custom_ways,
			false
		})

		return var_427_0
	end)
	slot_0_89_0[arg_425_1][arg_425_0].ways_count = slot_425_2_0.modifier:slider("\a[grey]\f<layer-plus>     \rWays", slot_0_92_0, slot_0_93_0, slot_0_92_0)
	slot_0_89_0[arg_425_1][arg_425_0].ways = slot_425_2_0.modifier:label("\a[grey]\f<layer-group>     \rDegrees", nil, function(arg_428_0)
		local var_428_0 = {}

		for iter_428_0 = 1, slot_0_93_0 do
			local function var_428_1(arg_429_0)
				return iter_428_0 <= arg_429_0.value
			end

			var_428_0[tostring(iter_428_0)] = arg_428_0:slider(string.format("\a[grey]\f<angle>    \rDegree   \a[grey]%s", iter_428_0), -180, 180, 0, 1, "°"):depend({
				slot_0_89_0[arg_425_1][arg_425_0].ways_count,
				var_428_1
			})
		end

		return var_428_0
	end)
	slot_0_89_0[arg_425_1][arg_425_0].speed = slot_425_2_0.modifier:slider("\a[grey]\f<timer>    \rSpeed", 1, 100, 50, 1, "%")
	slot_0_89_0[arg_425_1][arg_425_0].degree = slot_425_2_0.modifier:slider("\a[grey]\f<angle>     \rDegree", -180, 180, 0, 1, "°")
	slot_0_89_0[arg_425_1][arg_425_0].degree_min = slot_425_2_0.modifier:slider(" \a[grey]\f<arrow-down-right>     \rMin", -180, 180, 0, 1, "°")
	slot_0_89_0[arg_425_1][arg_425_0].degree_max = slot_425_2_0.modifier:slider(" \a[grey]\f<arrow-up-right>     \rMax", -180, 180, 0, 1, "°")
	slot_0_89_0[arg_425_1][arg_425_0].desync = slot_425_2_0.desync:switch("\v\f<wave-triangle>   \rDesync", false, nil, function(arg_430_0)
		local var_430_0 = {
			limits_value = arg_430_0:list("\v\f<arrow-down-left-and-arrow-up-right-to-center>    \rLimits", {
				"\f<circle>    Static",
				"\f<shuffle>    Random"
			})
		}

		slot_0_23_0.set_callback_list(var_430_0.limits_value)

		var_430_0.desync_state = arg_430_0:list("\v\f<power-off>    \rState", {
			"\f<power-off>    Always on",
			"\f<shuffle>    Random",
			"\f<clock-rotate-left>    Delay"
		})

		slot_0_23_0.set_callback_list(var_430_0.desync_state)

		var_430_0.delay = arg_430_0:slider("\a[grey]\f<clock-rotate-left>    \rDelay", 1, 20, 6, 1, "t"):depend({
			var_430_0.desync_state,
			3
		})

		return var_430_0, true
	end)
	slot_0_89_0[arg_425_1][arg_425_0].left_limit = slot_425_2_0.desync:slider("\a[grey]\f<arrow-left>     \rLeft limit", 0, 58, 58, 1, "°")
	slot_0_89_0[arg_425_1][arg_425_0].right_limit = slot_425_2_0.desync:slider("\a[grey]\f<arrow-right>     \rRight limit", 0, 58, 58, 1, "°")
	slot_0_89_0[arg_425_1][arg_425_0].limit_min = slot_425_2_0.desync:slider(" \a[grey]\f<arrow-down-right>     \rLimit min", 0, 58, 29, 1, "°")
	slot_0_89_0[arg_425_1][arg_425_0].limit_max = slot_425_2_0.desync:slider(" \a[grey]\f<arrow-up-right>     \rLimit max", 0, 58, 52, 1, "°")
	slot_0_89_0[arg_425_1][arg_425_0].options = slot_425_2_0.desync:label("\a[grey]\f<bars>     \rOptions", nil, function(arg_431_0)
		return {
			jitter = arg_431_0:switch("\v\f<right-left>     \rJitter"),
			inverter = arg_431_0:switch("\v\f<location-arrow>      \rInverter"),
			freestanding = arg_431_0:combo(" \v\f<arrow-left-to-line>      \rFreestanding", {
				"Off",
				"Peek Real",
				"Peek Fake"
			})
		}
	end)
	slot_0_89_0[arg_425_1][arg_425_0].delay = slot_425_2_0.extra:switch("\v\f<clock-rotate-left>    \rDelay", false, nil, function(arg_432_0, arg_432_1)
		slot_432_2_0 = {
			mode = arg_432_0:list("\v\f<hourglass>    \rMode", {
				"\f<angle>    Static",
				"\f<layer-group>    Staged",
				"\f<arrow-right-arrow-left>    \rBy sides",
				"\f<shuffle>    Random"
			})
		}

		slot_0_23_0.set_callback_list(slot_432_2_0.mode)

		slot_432_2_0.stages_count = arg_432_0:slider("\a[grey]\f<layer-plus>    \rStages", 2, 8, 3, 1, "x"):depend({
			slot_432_2_0.mode,
			2
		})

		for iter_432_0 = 1, 8 do
			function slot_432_7_0(arg_433_0)
				return iter_432_0 <= arg_433_0.value
			end

			slot_432_2_0[tostring(iter_432_0)] = arg_432_0:slider(string.format("\a[grey]\f<angle>     \rStage  \a[grey]%s", iter_432_0), 1, 16, 2, 1, "t"):depend({
				slot_432_2_0.mode,
				2
			}, {
				slot_432_2_0.stages_count,
				slot_432_7_0
			})
		end

		slot_432_2_0.min_max_sides = arg_432_0:switch("\v\f<split>    \rMin / Max"):depend({
			slot_432_2_0.mode,
			3
		})
		slot_432_2_0.min = arg_432_0:slider(" \a[grey]\f<arrow-down-right>     \rMin", 1, 16, 2, 1, "t"):depend({
			slot_432_2_0.mode,
			4
		})
		slot_432_2_0.max = arg_432_0:slider(" \a[grey]\f<arrow-up-right>     \rMax", 1, 16, 5, 1, "t"):depend({
			slot_432_2_0.mode,
			4
		})
		slot_432_2_0.static = arg_432_0:slider("\a[grey]\f<angle>    \rStatic", 1, 16, 2, 1, "t"):depend({
			slot_432_2_0.mode,
			1
		})
		slot_432_2_0.left = arg_432_0:slider("\a[grey]\f<arrow-left>     \rLeft", 1, 16, 1, 1, "t"):depend({
			slot_432_2_0.mode,
			3
		}, {
			slot_432_2_0.min_max_sides,
			false
		})
		slot_432_2_0.right = arg_432_0:slider("\a[grey]\f<arrow-right>     \rRight", 1, 16, 16, 1, "t"):depend({
			slot_432_2_0.mode,
			3
		}, {
			slot_432_2_0.min_max_sides,
			false
		})
		slot_432_2_0.left_min = arg_432_0:slider(" \a[grey]\f<arrow-down-right>     \rLeft min", 1, 16, 1, 1, "t"):depend({
			slot_432_2_0.mode,
			3
		}, slot_432_2_0.min_max_sides)
		slot_432_2_0.left_max = arg_432_0:slider(" \a[grey]\f<arrow-up-right>     \rLeft max", 1, 16, 4, 1, "t"):depend({
			slot_432_2_0.mode,
			3
		}, slot_432_2_0.min_max_sides)
		slot_432_2_0.right_min = arg_432_0:slider(" \a[grey]\f<arrow-down-right>     \rRight min", 1, 16, 10, 1, "t"):depend({
			slot_432_2_0.mode,
			3
		}, slot_432_2_0.min_max_sides)
		slot_432_2_0.right_max = arg_432_0:slider(" \a[grey]\f<arrow-up-right>     \rRight max", 1, 16, 16, 1, "t"):depend({
			slot_432_2_0.mode,
			3
		}, slot_432_2_0.min_max_sides)

		return slot_432_2_0, true
	end)
	slot_0_89_0[arg_425_1][arg_425_0].freeze_inverter = slot_425_2_0.extra:switch("\v\f<snowflake>    \rFreeze", false, nil, function(arg_434_0)
		return {
			chance = arg_434_0:slider("\v\f<angle>      \rChance", 0, 100, 50, 1, "%"),
			duration = arg_434_0:slider("\v\f<clock-rotate-left>      \rDuration", 1, 80, 10, 1, "t")
		}, true
	end)
	slot_0_89_0[arg_425_1][arg_425_0].force_disable = slot_425_2_0.extra:selectable(" \v\f<xmark>     \rForce disable", {
		"Manual",
		"Freestand"
	})

	function slot_425_3_0()
		if slot_0_88_0.state.use_teams.value then
			return slot_0_88_0.team.value == arg_425_1
		end

		return arg_425_1 == "Base"
	end

	slot_425_4_0 = {
		{
			slot_0_88_0.state,
			arg_425_0
		},
		{
			slot_0_88_0.team,
			slot_425_3_0
		},
		{
			slot_0_88_0.state.use_teams,
			slot_425_3_0
		},
		slot_0_27_0.antiaim.builder
	}

	if arg_425_0 ~= slot_0_94_0 then
		slot_0_89_0[arg_425_1][arg_425_0].enable:depend(unpack(slot_425_4_0))
	end

	slot_425_4_0[#slot_425_4_0 + 1] = slot_0_89_0[arg_425_1][arg_425_0].enable

	slot_0_89_0[arg_425_1][arg_425_0].offset:depend(unpack(slot_425_4_0))
	slot_0_89_0[arg_425_1][arg_425_0].offset_add_left:depend(slot_0_89_0[arg_425_1][arg_425_0].offset.add_sides, unpack(slot_425_4_0))
	slot_0_89_0[arg_425_1][arg_425_0].offset_add_right:depend(slot_0_89_0[arg_425_1][arg_425_0].offset.add_sides, unpack(slot_425_4_0))
	slot_0_89_0[arg_425_1][arg_425_0].offset_add_random:depend(slot_0_89_0[arg_425_1][arg_425_0].offset.add_random, unpack(slot_425_4_0))
	slot_0_89_0[arg_425_1][arg_425_0].modifier:depend(unpack(slot_425_4_0))
	slot_0_89_0[arg_425_1][arg_425_0].degree:depend({
		slot_0_89_0[arg_425_1][arg_425_0].modifier,
		"None",
		true
	}, {
		slot_0_89_0[arg_425_1][arg_425_0].modifier.min_max,
		false
	}, {
		slot_0_89_0[arg_425_1][arg_425_0].modifier.custom_ways,
		false
	}, unpack(slot_425_4_0))
	slot_0_89_0[arg_425_1][arg_425_0].degree_min:depend({
		slot_0_89_0[arg_425_1][arg_425_0].modifier,
		"None",
		true
	}, {
		slot_0_89_0[arg_425_1][arg_425_0].modifier.min_max,
		true
	}, {
		slot_0_89_0[arg_425_1][arg_425_0].modifier.custom_ways,
		false
	}, unpack(slot_425_4_0))
	slot_0_89_0[arg_425_1][arg_425_0].degree_max:depend({
		slot_0_89_0[arg_425_1][arg_425_0].modifier,
		"None",
		true
	}, {
		slot_0_89_0[arg_425_1][arg_425_0].modifier.min_max,
		true
	}, {
		slot_0_89_0[arg_425_1][arg_425_0].modifier.custom_ways,
		false
	}, unpack(slot_425_4_0))
	slot_0_89_0[arg_425_1][arg_425_0].speed:depend({
		slot_0_89_0[arg_425_1][arg_425_0].modifier,
		"Spin",
		"Sway"
	}, unpack(slot_425_4_0))
	slot_0_89_0[arg_425_1][arg_425_0].ways_count:depend({
		slot_0_89_0[arg_425_1][arg_425_0].modifier,
		"Ways"
	}, unpack(slot_425_4_0))
	slot_0_89_0[arg_425_1][arg_425_0].ways:depend({
		slot_0_89_0[arg_425_1][arg_425_0].modifier,
		"Ways"
	}, slot_0_89_0[arg_425_1][arg_425_0].modifier.custom_ways, unpack(slot_425_4_0))
	slot_0_89_0[arg_425_1][arg_425_0].desync:depend(unpack(slot_425_4_0))
	slot_0_89_0[arg_425_1][arg_425_0].left_limit:depend(slot_0_89_0[arg_425_1][arg_425_0].desync, {
		slot_0_89_0[arg_425_1][arg_425_0].desync.limits_value,
		1
	}, unpack(slot_425_4_0))
	slot_0_89_0[arg_425_1][arg_425_0].right_limit:depend(slot_0_89_0[arg_425_1][arg_425_0].desync, {
		slot_0_89_0[arg_425_1][arg_425_0].desync.limits_value,
		1
	}, unpack(slot_425_4_0))
	slot_0_89_0[arg_425_1][arg_425_0].limit_min:depend(slot_0_89_0[arg_425_1][arg_425_0].desync, {
		slot_0_89_0[arg_425_1][arg_425_0].desync.limits_value,
		2
	}, unpack(slot_425_4_0))
	slot_0_89_0[arg_425_1][arg_425_0].limit_max:depend(slot_0_89_0[arg_425_1][arg_425_0].desync, {
		slot_0_89_0[arg_425_1][arg_425_0].desync.limits_value,
		2
	}, unpack(slot_425_4_0))
	slot_0_89_0[arg_425_1][arg_425_0].options:depend(slot_0_89_0[arg_425_1][arg_425_0].desync, unpack(slot_425_4_0))
	slot_0_89_0[arg_425_1][arg_425_0].delay:depend(unpack(slot_425_4_0))
	slot_0_89_0[arg_425_1][arg_425_0].freeze_inverter:depend(unpack(slot_425_4_0))
	slot_0_89_0[arg_425_1][arg_425_0].force_disable:depend(unpack(slot_425_4_0))
end

for iter_0_0, iter_0_1 in ipairs(slot_0_95_0) do
	for iter_0_2, iter_0_3 in ipairs(slot_0_99_0) do
		slot_0_104_0(iter_0_1, iter_0_3)
	end
end

function slot_0_105_0(arg_436_0, arg_436_1)
	slot_0_90_0[arg_436_1] = slot_0_90_0[arg_436_1] or {}
	slot_0_90_0[arg_436_1][arg_436_0] = slot_0_90_0[arg_436_1][arg_436_0] or {}
	slot_436_2_0 = {
		on = slot_0_8_0.create(slot_0_91_0, string.format("## Defensive Builder %s %s On", arg_436_0, arg_436_1), 1),
		yaw = slot_0_8_0.create(slot_0_91_0, string.format("## Defensive Builder %s %s Yaw", arg_436_0, arg_436_1), 2),
		modifier = slot_0_8_0.create(slot_0_91_0, string.format("## Defensive Builder %s %s Modifier", arg_436_0, arg_436_1), 2),
		pitch = slot_0_8_0.create(slot_0_91_0, string.format("## Defensive Builder %s %s Pitch", arg_436_0, arg_436_1), 2),
		duration = slot_0_8_0.create(slot_0_91_0, string.format("## Defensive Builder %s %s Duration", arg_436_0, arg_436_1), 2)
	}
	slot_0_90_0[arg_436_1][arg_436_0].enable = slot_436_2_0.on:switch(" \v\f<check>     \rEnable", false, nil, function(arg_437_0)
		return {
			remove_modifier = arg_437_0:switch("\v\f<not-equal>    \rRemove modifier")
		}, true
	end)
	slot_0_90_0[arg_436_1][arg_436_0].force_break_lc = slot_436_2_0.on:switch("\v\f<signal-stream>     \rForce Break LC", false, nil, function(arg_438_0)
		return {
			allow_double_tap = arg_438_0:switch("\v\f<seedling>    \rAllow double tap", true),
			allow_hide_shots = arg_438_0:switch("\v\f<leaf>    \rAllow hide shots", true)
		}, true
	end)
	slot_0_90_0[arg_436_1][arg_436_0].custom_tickbase = slot_436_2_0.on:switch("\a[grey]\f<wave-sine>    \rCustom tickbase", false, nil, function(arg_439_0)
		return {
			static = arg_439_0:slider("\a[grey]\f<angle>    \rStatic", 1, 22, 16, 1, "t")
		}, true
	end)

	function slot_436_3_0(arg_440_0)
		if arg_440_0 == 1 then
			return "Off"
		end

		return string.format("%st", arg_440_0)
	end

	slot_0_90_0[arg_436_1][arg_436_0].yaw = slot_436_2_0.yaw:combo("\v\f<rotate-right>    \rYaw", {
		"None",
		"Swap",
		"Static",
		"Switch",
		"Random",
		"Ways",
		"Spin",
		"Sway",
		"Peek direction"
	}, nil, function(arg_441_0, arg_441_1)
		local var_441_0 = {
			min_max = arg_441_0:switch("\v\f<split>    \rMin / Max"),
			custom_ways = arg_441_0:switch("\v\f<layer-group>    \rCustom ways")
		}

		local function var_441_1()
			local var_442_0 = arg_441_1.value

			return (not var_441_0.custom_ways.value or var_442_0 ~= "Ways") and var_442_0 ~= "None" and var_442_0 ~= "Static" and var_442_0 ~= "Peek direction"
		end

		var_441_0.min_max:depend({
			arg_441_1,
			var_441_1
		}, {
			var_441_0.custom_ways,
			var_441_1
		})
		var_441_0.custom_ways:depend({
			arg_441_1,
			"Ways"
		})

		return var_441_0
	end)
	slot_0_90_0[arg_436_1][arg_436_0].yaw_ways_count = slot_436_2_0.yaw:slider("\a[grey]\f<layer-plus>     \rWays", slot_0_92_0, slot_0_93_0, slot_0_92_0)
	slot_0_90_0[arg_436_1][arg_436_0].yaw_ways = slot_436_2_0.yaw:label("\a[grey]\f<layer-group>     \rDegrees", nil, function(arg_443_0)
		local var_443_0 = {}

		for iter_443_0 = 1, slot_0_93_0 do
			local function var_443_1(arg_444_0)
				return iter_443_0 <= arg_444_0.value
			end

			var_443_0[tostring(iter_443_0)] = arg_443_0:slider(string.format("\a[grey]\f<angle>    \rDegree   \a[grey]%s", iter_443_0), -180, 180, 0, 1, "°"):depend({
				slot_0_90_0[arg_436_1][arg_436_0].yaw_ways_count,
				var_443_1
			})
		end

		return var_443_0
	end)
	slot_0_90_0[arg_436_1][arg_436_0].yaw_speed = slot_436_2_0.yaw:slider("\a[grey]\f<timer>    \rSpeed", 1, 200, 100, 0.01, "s")
	slot_0_90_0[arg_436_1][arg_436_0].yaw_delay = slot_436_2_0.yaw:slider("\a[grey]\f<timer>    \rDelay", 1, 20, 0, 1, slot_436_3_0)
	slot_0_90_0[arg_436_1][arg_436_0].yaw_degree = slot_436_2_0.yaw:slider("\a[grey]\f<angle>     \rDegree", -180, 180, 0, 1, "°")
	slot_0_90_0[arg_436_1][arg_436_0].yaw_degree_min = slot_436_2_0.yaw:slider(" \a[grey]\f<arrow-down-right>     \rMin", -180, 180, 0, 1, "°")
	slot_0_90_0[arg_436_1][arg_436_0].yaw_degree_max = slot_436_2_0.yaw:slider(" \a[grey]\f<arrow-up-right>     \rMax", -180, 180, 0, 1, "°")
	slot_0_90_0[arg_436_1][arg_436_0].modifier = slot_436_2_0.modifier:combo("\v\f<arrow-right-arrow-left>    \rModifier", {
		"None",
		"Static",
		"Swap",
		"Switch",
		"Random",
		"Ways",
		"Spin",
		"Sway",
		"Peek direction"
	}, nil, function(arg_445_0, arg_445_1)
		local var_445_0 = {
			min_max = arg_445_0:switch("\v\f<split>    \rMin / Max"),
			custom_ways = arg_445_0:switch("\v\f<layer-group>    \rCustom ways")
		}

		local function var_445_1()
			local var_446_0 = arg_445_1.value

			return (not var_445_0.custom_ways.value or var_446_0 ~= "Ways") and var_446_0 ~= "None" and var_446_0 ~= "Static" and var_446_0 ~= "Peek direction"
		end

		var_445_0.min_max:depend({
			arg_445_1,
			var_445_1
		}, {
			var_445_0.custom_ways,
			var_445_1
		})
		var_445_0.custom_ways:depend({
			arg_445_1,
			"Ways"
		})

		return var_445_0
	end)
	slot_0_90_0[arg_436_1][arg_436_0].modifier_ways_count = slot_436_2_0.modifier:slider("\a[grey]\f<layer-plus>     \rWays", slot_0_92_0, slot_0_93_0, slot_0_92_0)
	slot_0_90_0[arg_436_1][arg_436_0].modifier_ways = slot_436_2_0.modifier:label("\a[grey]\f<layer-group>     \rDegrees", nil, function(arg_447_0)
		local var_447_0 = {}

		for iter_447_0 = 1, slot_0_93_0 do
			local function var_447_1(arg_448_0)
				return iter_447_0 <= arg_448_0.value
			end

			var_447_0[tostring(iter_447_0)] = arg_447_0:slider(string.format("\a[grey]\f<angle>    \rDegree   \a[grey]%s", iter_447_0), -180, 180, 0, 1, "°"):depend({
				slot_0_90_0[arg_436_1][arg_436_0].modifier_ways_count,
				var_447_1
			})
		end

		return var_447_0
	end)
	slot_0_90_0[arg_436_1][arg_436_0].modifier_speed = slot_436_2_0.modifier:slider("\a[grey]\f<timer>    \rSpeed", 1, 200, 100, 0.01, "s")
	slot_0_90_0[arg_436_1][arg_436_0].modifier_delay = slot_436_2_0.modifier:slider("\a[grey]\f<timer>    \rDelay", 1, 20, 0, 1, slot_436_3_0)
	slot_0_90_0[arg_436_1][arg_436_0].modifier_degree = slot_436_2_0.modifier:slider("\a[grey]\f<angle>     \rDegree", -180, 180, 0, 1, "°")
	slot_0_90_0[arg_436_1][arg_436_0].modifier_degree_min = slot_436_2_0.modifier:slider(" \a[grey]\f<arrow-down-right>     \rMin", -180, 180, 0, 1, "°")
	slot_0_90_0[arg_436_1][arg_436_0].modifier_degree_max = slot_436_2_0.modifier:slider(" \a[grey]\f<arrow-up-right>     \rMax", -180, 180, 0, 1, "°")

	function slot_436_4_0(arg_449_0)
		if arg_449_0 == -89 then
			return "Up"
		end

		if arg_449_0 == 89 then
			return "Down"
		end

		if arg_449_0 == 0 then
			return "Zero"
		end

		return string.format("%s°", arg_449_0)
	end

	slot_0_90_0[arg_436_1][arg_436_0].pitch = slot_436_2_0.pitch:combo("\v\f<arrow-down-arrow-up>     \rPitch", {
		"None",
		"Static",
		"Swap",
		"Switch",
		"Random",
		"Ways",
		"Spin",
		"Sway"
	}, nil, function(arg_450_0, arg_450_1)
		local var_450_0 = {
			min_max = arg_450_0:switch("\v\f<split>    \rMin / Max"),
			custom_ways = arg_450_0:switch("\v\f<layer-group>    \rCustom ways")
		}

		local function var_450_1()
			local var_451_0 = arg_450_1.value

			return (not var_450_0.custom_ways.value or var_451_0 ~= "Ways") and var_451_0 ~= "None" and var_451_0 ~= "Static"
		end

		var_450_0.min_max:depend({
			arg_450_1,
			var_450_1
		}, {
			var_450_0.custom_ways,
			var_450_1
		})
		var_450_0.custom_ways:depend({
			arg_450_1,
			"Ways"
		})

		return var_450_0
	end)
	slot_0_90_0[arg_436_1][arg_436_0].pitch_ways_count = slot_436_2_0.pitch:slider("\a[grey]\f<layer-plus>     \rWays", slot_0_92_0, slot_0_93_0, slot_0_92_0)
	slot_0_90_0[arg_436_1][arg_436_0].pitch_ways = slot_436_2_0.pitch:label("\a[grey]\f<layer-group>     \rDegrees", nil, function(arg_452_0)
		local var_452_0 = {}

		for iter_452_0 = 1, slot_0_93_0 do
			local function var_452_1(arg_453_0)
				return iter_452_0 <= arg_453_0.value
			end

			var_452_0[tostring(iter_452_0)] = arg_452_0:slider(string.format("\a[grey]\f<angle>    \rDegree   \a[grey]%s", iter_452_0), -89, 89, 0, 1, slot_436_4_0):depend({
				slot_0_90_0[arg_436_1][arg_436_0].pitch_ways_count,
				var_452_1
			})
		end

		return var_452_0
	end)
	slot_0_90_0[arg_436_1][arg_436_0].pitch_speed = slot_436_2_0.pitch:slider("\a[grey]\f<timer>    \rSpeed", 1, 200, 100, 0.01, "s")
	slot_0_90_0[arg_436_1][arg_436_0].pitch_delay = slot_436_2_0.pitch:slider("\a[grey]\f<timer>    \rDelay", 1, 20, 0, 1, slot_436_3_0)
	slot_0_90_0[arg_436_1][arg_436_0].pitch_degree = slot_436_2_0.pitch:slider("\a[grey]\f<angle>     \rDegree", -89, 89, 0, 1, slot_436_4_0)
	slot_0_90_0[arg_436_1][arg_436_0].pitch_degree_min = slot_436_2_0.pitch:slider(" \a[grey]\f<arrow-down-right>     \rMin", -89, 89, 0, 1, slot_436_4_0)
	slot_0_90_0[arg_436_1][arg_436_0].pitch_degree_max = slot_436_2_0.pitch:slider(" \a[grey]\f<arrow-up-right>     \rMax", -89, 89, 0, 1, slot_436_4_0)

	function slot_436_5_0(arg_454_0)
		if arg_454_0 == 13 then
			return "Max"
		end

		if arg_454_0 == 1 then
			return "Min"
		end

		return string.format("%st", arg_454_0)
	end

	slot_0_90_0[arg_436_1][arg_436_0].duration = slot_436_2_0.duration:switch("\v\f<clock-rotate-left>     \rCustom duration", false, nil, function(arg_455_0)
		local var_455_0 = {
			mode = arg_455_0:list("\v\f<hourglass>    \rMode", {
				"\f<angle>    Static",
				"\f<layer-group>    Staged",
				"\f<shuffle>    Random"
			})
		}

		slot_0_23_0.set_callback_list(var_455_0.mode)

		var_455_0.stages_count = arg_455_0:slider("\a[grey]\f<layer-plus>    \rStages", 2, 8, 3, 1, "x"):depend({
			var_455_0.mode,
			2
		})

		for iter_455_0 = 1, 8 do
			local function var_455_1(arg_456_0)
				return iter_455_0 <= arg_456_0.value
			end

			var_455_0[tostring(iter_455_0)] = arg_455_0:slider(string.format("\a[grey]\f<angle>     \rStage  \a[grey]%s", iter_455_0), 1, 13, 13, 1, slot_436_5_0):depend({
				var_455_0.mode,
				2
			}, {
				var_455_0.stages_count,
				var_455_1
			})
		end

		var_455_0.min = arg_455_0:slider(" \a[grey]\f<arrow-down-right>     \rMin", 1, 13, 1, 1, slot_436_5_0):depend({
			var_455_0.mode,
			3
		})
		var_455_0.max = arg_455_0:slider(" \a[grey]\f<arrow-up-right>     \rMax", 1, 13, 13, 1, slot_436_5_0):depend({
			var_455_0.mode,
			3
		})
		var_455_0.static = arg_455_0:slider("\a[grey]\f<angle>    \rStatic", 1, 13, 13, 1, slot_436_5_0):depend({
			var_455_0.mode,
			1
		})

		return var_455_0, true
	end)

	function slot_436_6_0()
		if slot_0_88_0.defensive_state.use_teams.value then
			return slot_0_88_0.defensive_team.value == arg_436_1
		end

		return arg_436_1 == "Base"
	end

	slot_436_7_0 = {
		{
			slot_0_88_0.defensive_state,
			arg_436_0
		},
		{
			slot_0_88_0.defensive_team,
			slot_436_6_0
		},
		{
			slot_0_88_0.defensive_state.use_teams,
			slot_436_6_0
		},
		slot_0_27_0.antiaim.defensive
	}

	slot_0_90_0[arg_436_1][arg_436_0].enable:depend(unpack(slot_436_7_0))

	slot_436_7_0[#slot_436_7_0 + 1] = slot_0_90_0[arg_436_1][arg_436_0].enable

	slot_0_90_0[arg_436_1][arg_436_0].force_break_lc:depend(unpack(slot_436_7_0))

	function slot_436_8_0(arg_458_0, arg_458_1)
		local var_458_0 = slot_0_90_0[arg_436_1][arg_436_0][arg_458_0]

		return function()
			local var_459_0 = var_458_0.value

			if var_459_0 == "None" or var_459_0 == "Peek direction" then
				return false
			end

			if var_459_0 == "Static" then
				return arg_458_1 == nil
			end

			if var_459_0 == "Ways" and var_458_0.custom_ways.value then
				return false
			end

			if arg_458_1 then
				return var_458_0.min_max.value
			else
				return not var_458_0.min_max.value
			end
		end
	end

	slot_0_90_0[arg_436_1][arg_436_0].yaw:depend(unpack(slot_436_7_0))
	slot_0_90_0[arg_436_1][arg_436_0].yaw_degree:depend({
		slot_0_90_0[arg_436_1][arg_436_0].yaw,
		slot_436_8_0("yaw")
	}, {
		slot_0_90_0[arg_436_1][arg_436_0].yaw.min_max,
		slot_436_8_0("yaw")
	}, {
		slot_0_90_0[arg_436_1][arg_436_0].yaw.custom_ways,
		slot_436_8_0("yaw")
	}, unpack(slot_436_7_0))
	slot_0_90_0[arg_436_1][arg_436_0].yaw_degree_min:depend({
		slot_0_90_0[arg_436_1][arg_436_0].yaw,
		slot_436_8_0("yaw", true)
	}, {
		slot_0_90_0[arg_436_1][arg_436_0].yaw.min_max,
		slot_436_8_0("yaw", true)
	}, {
		slot_0_90_0[arg_436_1][arg_436_0].yaw.custom_ways,
		slot_436_8_0("yaw", true)
	}, unpack(slot_436_7_0))
	slot_0_90_0[arg_436_1][arg_436_0].yaw_degree_max:depend({
		slot_0_90_0[arg_436_1][arg_436_0].yaw,
		slot_436_8_0("yaw", true)
	}, {
		slot_0_90_0[arg_436_1][arg_436_0].yaw.min_max,
		slot_436_8_0("yaw", true)
	}, {
		slot_0_90_0[arg_436_1][arg_436_0].yaw.custom_ways,
		slot_436_8_0("yaw", true)
	}, unpack(slot_436_7_0))
	slot_0_90_0[arg_436_1][arg_436_0].yaw_delay:depend({
		slot_0_90_0[arg_436_1][arg_436_0].yaw,
		"Switch"
	}, unpack(slot_436_7_0))
	slot_0_90_0[arg_436_1][arg_436_0].yaw_speed:depend({
		slot_0_90_0[arg_436_1][arg_436_0].yaw,
		"Spin",
		"Sway"
	}, unpack(slot_436_7_0))
	slot_0_90_0[arg_436_1][arg_436_0].yaw_ways_count:depend({
		slot_0_90_0[arg_436_1][arg_436_0].yaw,
		"Ways"
	}, unpack(slot_436_7_0))
	slot_0_90_0[arg_436_1][arg_436_0].yaw_ways:depend({
		slot_0_90_0[arg_436_1][arg_436_0].yaw,
		"Ways"
	}, slot_0_90_0[arg_436_1][arg_436_0].yaw.custom_ways, unpack(slot_436_7_0))
	slot_0_90_0[arg_436_1][arg_436_0].modifier:depend(unpack(slot_436_7_0))
	slot_0_90_0[arg_436_1][arg_436_0].modifier_degree:depend({
		slot_0_90_0[arg_436_1][arg_436_0].modifier,
		slot_436_8_0("modifier")
	}, {
		slot_0_90_0[arg_436_1][arg_436_0].modifier.min_max,
		slot_436_8_0("modifier")
	}, {
		slot_0_90_0[arg_436_1][arg_436_0].modifier.custom_ways,
		slot_436_8_0("modifier")
	}, unpack(slot_436_7_0))
	slot_0_90_0[arg_436_1][arg_436_0].modifier_degree_min:depend({
		slot_0_90_0[arg_436_1][arg_436_0].modifier,
		slot_436_8_0("modifier", true)
	}, {
		slot_0_90_0[arg_436_1][arg_436_0].modifier.min_max,
		slot_436_8_0("modifier", true)
	}, {
		slot_0_90_0[arg_436_1][arg_436_0].modifier.custom_ways,
		slot_436_8_0("modifier", true)
	}, unpack(slot_436_7_0))
	slot_0_90_0[arg_436_1][arg_436_0].modifier_degree_max:depend({
		slot_0_90_0[arg_436_1][arg_436_0].modifier,
		slot_436_8_0("modifier", true)
	}, {
		slot_0_90_0[arg_436_1][arg_436_0].modifier.min_max,
		slot_436_8_0("modifier", true)
	}, {
		slot_0_90_0[arg_436_1][arg_436_0].modifier.custom_ways,
		slot_436_8_0("modifier", true)
	}, unpack(slot_436_7_0))
	slot_0_90_0[arg_436_1][arg_436_0].modifier_delay:depend({
		slot_0_90_0[arg_436_1][arg_436_0].modifier,
		"Switch"
	}, unpack(slot_436_7_0))
	slot_0_90_0[arg_436_1][arg_436_0].modifier_speed:depend({
		slot_0_90_0[arg_436_1][arg_436_0].modifier,
		"Spin",
		"Sway"
	}, unpack(slot_436_7_0))
	slot_0_90_0[arg_436_1][arg_436_0].modifier_ways_count:depend({
		slot_0_90_0[arg_436_1][arg_436_0].modifier,
		"Ways"
	}, unpack(slot_436_7_0))
	slot_0_90_0[arg_436_1][arg_436_0].modifier_ways:depend({
		slot_0_90_0[arg_436_1][arg_436_0].modifier,
		"Ways"
	}, slot_0_90_0[arg_436_1][arg_436_0].modifier.custom_ways, unpack(slot_436_7_0))
	slot_0_90_0[arg_436_1][arg_436_0].pitch:depend(unpack(slot_436_7_0))
	slot_0_90_0[arg_436_1][arg_436_0].pitch_degree:depend({
		slot_0_90_0[arg_436_1][arg_436_0].pitch,
		slot_436_8_0("pitch")
	}, {
		slot_0_90_0[arg_436_1][arg_436_0].pitch.min_max,
		slot_436_8_0("pitch")
	}, {
		slot_0_90_0[arg_436_1][arg_436_0].pitch.custom_ways,
		slot_436_8_0("pitch")
	}, unpack(slot_436_7_0))
	slot_0_90_0[arg_436_1][arg_436_0].pitch_degree_min:depend({
		slot_0_90_0[arg_436_1][arg_436_0].pitch,
		slot_436_8_0("pitch", true)
	}, {
		slot_0_90_0[arg_436_1][arg_436_0].pitch.min_max,
		slot_436_8_0("pitch", true)
	}, {
		slot_0_90_0[arg_436_1][arg_436_0].pitch.custom_ways,
		slot_436_8_0("pitch", true)
	}, unpack(slot_436_7_0))
	slot_0_90_0[arg_436_1][arg_436_0].pitch_degree_max:depend({
		slot_0_90_0[arg_436_1][arg_436_0].pitch,
		slot_436_8_0("pitch", true)
	}, {
		slot_0_90_0[arg_436_1][arg_436_0].pitch.min_max,
		slot_436_8_0("pitch", true)
	}, {
		slot_0_90_0[arg_436_1][arg_436_0].pitch.custom_ways,
		slot_436_8_0("pitch", true)
	}, unpack(slot_436_7_0))
	slot_0_90_0[arg_436_1][arg_436_0].pitch_delay:depend({
		slot_0_90_0[arg_436_1][arg_436_0].pitch,
		"Switch"
	}, unpack(slot_436_7_0))
	slot_0_90_0[arg_436_1][arg_436_0].pitch_speed:depend({
		slot_0_90_0[arg_436_1][arg_436_0].pitch,
		"Spin",
		"Sway"
	}, unpack(slot_436_7_0))
	slot_0_90_0[arg_436_1][arg_436_0].pitch_ways_count:depend({
		slot_0_90_0[arg_436_1][arg_436_0].pitch,
		"Ways"
	}, unpack(slot_436_7_0))
	slot_0_90_0[arg_436_1][arg_436_0].pitch_ways:depend({
		slot_0_90_0[arg_436_1][arg_436_0].pitch,
		"Ways"
	}, slot_0_90_0[arg_436_1][arg_436_0].pitch.custom_ways, unpack(slot_436_7_0))
	slot_0_90_0[arg_436_1][arg_436_0].custom_tickbase:depend(slot_0_90_0[arg_436_1][arg_436_0].force_break_lc, unpack(slot_436_7_0))
	slot_0_90_0[arg_436_1][arg_436_0].duration:depend(unpack(slot_436_7_0))

	for iter_436_0, iter_436_1 in pairs(slot_0_90_0[arg_436_1][arg_436_0]) do
		if iter_436_0 ~= "custom_tickbase" and iter_436_0 ~= "force_break_lc" and iter_436_0 ~= "enable" then
			iter_436_1:depend(true, {
				slot_0_88_0.unmatched_features.disable_defensive,
				false
			})
		end
	end
end

for iter_0_4, iter_0_5 in ipairs(slot_0_96_0) do
	for iter_0_6, iter_0_7 in ipairs(slot_0_99_0) do
		slot_0_105_0(iter_0_5, iter_0_7)
	end
end

slot_0_106_0 = {
	names = {},
	callbacks = {},
	create = function(arg_460_0, arg_460_1, arg_460_2)
		table.insert(arg_460_0.names, arg_460_1)

		arg_460_0.callbacks[arg_460_1] = arg_460_2
	end
}

slot_0_106_0:create(slot_0_94_0)
slot_0_106_0:create("On use", function(arg_461_0)
	return slot_0_87_1
end)
slot_0_106_0:create("Stand", function(arg_462_0, arg_462_1, arg_462_2, arg_462_3)
	return arg_462_3 < 2 and not arg_462_0 and not not arg_462_1 and arg_462_2 < 0.7
end)
slot_0_106_0:create("Air crouch", function(arg_463_0, arg_463_1, arg_463_2, arg_463_3)
	return arg_463_2 > 0.8 and (arg_463_0 or not arg_463_1)
end)
slot_0_106_0:create("Air", function(arg_464_0, arg_464_1, arg_464_2, arg_464_3)
	return arg_464_2 < 0.8 and (arg_464_0 or not arg_464_1)
end)
slot_0_106_0:create("Creeping", function(arg_465_0, arg_465_1, arg_465_2, arg_465_3)
	return arg_465_2 > 0.8 and not arg_465_0 and not not arg_465_1 and arg_465_3 > 2
end)
slot_0_106_0:create("Crouch", function(arg_466_0, arg_466_1, arg_466_2, arg_466_3)
	return arg_466_2 > 0.8 and not arg_466_0 and not not arg_466_1 and arg_466_3 < 2
end)
slot_0_106_0:create("Run", function(arg_467_0, arg_467_1, arg_467_2, arg_467_3)
	return arg_467_3 > 2 and not arg_467_0 and not not arg_467_1 and not slot_0_38_0.is_slow_walk and arg_467_2 < 0.7
end)
slot_0_106_0:create("Walk", function(arg_468_0, arg_468_1, arg_468_2, arg_468_3)
	return slot_0_38_0.is_slow_walk and not arg_468_0 and not not arg_468_1 and arg_468_2 < 0.7
end)

slot_0_107_0 = {
	names = {},
	callbacks = {},
	create = function(arg_469_0, arg_469_1, arg_469_2)
		table.insert(arg_469_0.names, arg_469_1)

		arg_469_0.callbacks[arg_469_1] = arg_469_2
	end
}

slot_0_107_0:create("On peek", function(arg_470_0, arg_470_1, arg_470_2, arg_470_3)
	return slot_0_38_0.on_peek
end)
slot_0_107_0:create("Stand", function(arg_471_0, arg_471_1, arg_471_2, arg_471_3)
	return arg_471_3 < 2 and not arg_471_0 and not not arg_471_1 and arg_471_2 < 0.7
end)
slot_0_107_0:create("Air crouch", function(arg_472_0, arg_472_1, arg_472_2, arg_472_3)
	return arg_472_2 > 0.8 and (arg_472_0 or not arg_472_1)
end)
slot_0_107_0:create("Air", function(arg_473_0, arg_473_1, arg_473_2, arg_473_3)
	return arg_473_2 < 0.8 and (arg_473_0 or not arg_473_1)
end)
slot_0_107_0:create("Creeping", function(arg_474_0, arg_474_1, arg_474_2, arg_474_3)
	return arg_474_2 > 0.8 and not arg_474_0 and not not arg_474_1 and arg_474_3 > 2
end)
slot_0_107_0:create("Crouch", function(arg_475_0, arg_475_1, arg_475_2, arg_475_3)
	return arg_475_2 > 0.8 and not arg_475_0 and not not arg_475_1 and arg_475_3 < 2
end)
slot_0_107_0:create("Run", function(arg_476_0, arg_476_1, arg_476_2, arg_476_3)
	return arg_476_3 > 2 and not arg_476_0 and not not arg_476_1 and not slot_0_38_0.is_slow_walk and arg_476_2 < 0.7
end)
slot_0_107_0:create("Walk", function(arg_477_0, arg_477_1, arg_477_2, arg_477_3)
	return slot_0_38_0.is_slow_walk and not arg_477_0 and not not arg_477_1 and arg_477_2 < 0.7
end)

function slot_0_108_0(arg_478_0, arg_478_1, arg_478_2)
	if arg_478_2 == 0 then
		return true
	end

	if not arg_478_0 or not arg_478_1 or arg_478_1:is_dormant() then
		return
	end

	local var_478_0 = arg_478_0:get_origin()
	local var_478_1 = arg_478_1:get_origin()

	return var_478_0.z ~= nil and var_478_1.z ~= nil and var_478_0.z - arg_478_2 > var_478_1.z
end

slot_0_109_0 = false

function slot_0_110_0(arg_479_0)
	slot_0_109_0 = false

	local var_479_0 = slot_0_38_0.me
	local var_479_1 = slot_0_38_0.weapon
	local var_479_2 = slot_0_38_0.threat
	local var_479_3 = slot_0_38_0.is_alive
	local var_479_4 = slot_0_38_0.anim_state
	local var_479_5 = slot_0_88_0.safe_head

	if not var_479_5.value or not var_479_0 or not var_479_3 or not var_479_1 or not var_479_4 or not var_479_2 then
		return
	end

	local var_479_6 = var_479_4.on_ground
	local var_479_7 = var_479_1:get_classname()
	local var_479_8 = var_479_7 == "CWeaponTaser" and var_479_5.options:get(1)
	local var_479_9 = var_479_7 == "CKnife" and var_479_5.options:get(2)
	local var_479_10 = var_479_5.options:get(3) and var_479_7 ~= nil
	local var_479_11 = slot_0_108_0(var_479_0, var_479_2, var_479_5.height_difference.value)

	if var_479_5.states:get(1) and (var_479_11 and var_479_10 or var_479_9 or var_479_8) and (arg_479_0.in_jump or not var_479_6) then
		slot_0_109_0 = true

		return
	end

	if var_479_5.states:get(2) and var_479_11 and var_479_6 and not arg_479_0.in_duck and slot_0_38_0.velocity < 2 then
		slot_0_109_0 = true

		return
	end

	if var_479_5.states:get(3) and var_479_11 and var_479_6 and arg_479_0.in_duck then
		slot_0_109_0 = true

		return
	end
end

function slot_0_111_0()
	local var_480_0 = slot_0_38_0.me
	local var_480_1 = slot_0_38_0.eye
	local var_480_2 = slot_0_38_0.weapon
	local var_480_3 = slot_0_38_0.camera_angles

	if not var_480_0 or not var_480_1 or not var_480_2 or not var_480_3 then
		return
	end

	if var_480_2:get_classname() == "CC4" then
		return true
	end

	local var_480_4 = vector():angles(var_480_3)
	local var_480_5 = utils.trace_line(var_480_1, var_480_1 + var_480_4 * 200, var_480_0, 1174421515)

	if var_480_5.entity ~= nil then
		local var_480_6 = string.lower(var_480_5.entity:get_classname())

		if var_480_6:match("weapon") or var_480_6:match("deagle") or var_480_6:match("door") or var_480_6:match("button") then
			return true
		end
	end

	if var_480_0.m_iTeamNum ~= 3 then
		return false
	end

	local var_480_7 = {
		1337
	}

	entity.get_entities("CHostage", false, function(arg_481_0)
		if arg_481_0.m_nHostageState ~= 3 then
			table.insert(var_480_7, arg_481_0.m_vecOrigin:dist(var_480_1))
		end
	end)
	entity.get_entities("CPlantedC4", false, function(arg_482_0)
		table.insert(var_480_7, arg_482_0.m_vecOrigin:dist(var_480_1))
	end)

	if math.min(unpack(var_480_7)) < 125 then
		return true
	end

	return false
end

function slot_0_112_0(arg_483_0)
	local var_483_0 = slot_0_23_0.find("drop_grenades")

	slot_0_87_1 = slot_0_88_0.allow_on_use.value and (not var_483_0 or not var_483_0.value) and not slot_0_111_0() and arg_483_0.in_use

	if slot_0_87_1 then
		arg_483_0.in_use = false
	end
end

function slot_0_113_0()
	slot_0_24_0.avoid_backstab:override(slot_0_88_0.avoid_backstab.value)
end

function slot_0_114_0(arg_485_0, arg_485_1)
	arg_485_0:override(arg_485_1())
end

slot_0_115_0 = 1
slot_0_116_0 = 1
slot_0_117_0 = false
slot_0_118_0 = 1
slot_0_119_0 = 0
slot_0_120_0 = 0
slot_0_121_0 = 1
slot_0_122_0 = false
slot_0_123_0 = false
slot_0_124_0 = false
slot_0_125_0 = false
slot_0_126_0 = 0
slot_0_127_0 = 0
slot_0_128_0 = 0
slot_0_129_0 = 0

function slot_0_130_0(arg_486_0, arg_486_1, arg_486_2)
	slot_486_3_0 = rage.antiaim:inverter()
	slot_486_4_0 = globals.choked_commands
	slot_486_5_0 = slot_0_89_0[arg_486_2][arg_486_1].ways_count.value

	if slot_486_4_0 == 0 then
		slot_486_6_1 = 0
		slot_486_7_1 = slot_0_89_0[arg_486_2][arg_486_1].delay

		if slot_486_7_1.value then
			slot_486_8_3 = slot_486_7_1.mode.value

			if slot_486_8_3 == 1 then
				slot_486_6_1 = slot_486_7_1.static.value
			end

			if slot_486_8_3 == 2 then
				if slot_0_116_0 == 1 then
					if slot_0_118_0 >= slot_486_7_1.stages_count.value then
						slot_0_118_0 = 0
					end

					slot_0_118_0 = slot_0_118_0 + 1
				end

				slot_486_6_1 = slot_486_7_1[tostring(slot_0_118_0)].value
			end

			if slot_486_8_3 == 3 then
				if slot_486_7_1.min_max_sides.value then
					if slot_0_116_0 == 1 then
						if slot_0_117_0 then
							slot_0_120_0 = math.random(slot_486_7_1.right_min.value, slot_486_7_1.right_max.value)
						else
							slot_0_120_0 = math.random(slot_486_7_1.left_min.value, slot_486_7_1.left_max.value)
						end
					end

					slot_486_6_1 = slot_0_120_0
				else
					slot_486_6_1 = slot_0_117_0 and slot_486_7_1.right.value or slot_486_7_1.left.value
				end
			end

			if slot_486_8_3 == 4 then
				if slot_0_116_0 == 1 then
					slot_0_119_0 = math.random(slot_486_7_1.min.value, slot_486_7_1.max.value)
				end

				slot_486_6_1 = slot_0_119_0
			end
		end

		slot_486_8_2 = slot_0_89_0[arg_486_2][arg_486_1].freeze_inverter

		if slot_486_8_2.value then
			if slot_0_128_0 == 0 then
				if math.random(0, 100) < slot_486_8_2.chance.value then
					slot_0_129_0 = slot_486_8_2.duration.value
				else
					slot_0_129_0 = 0
				end
			end

			if slot_0_128_0 >= slot_0_129_0 then
				slot_0_128_0 = 0
			else
				slot_0_128_0 = slot_0_128_0 + 1
			end
		else
			slot_0_128_0 = 0
			slot_0_129_0 = 0
		end

		if not (slot_0_128_0 > 0) then
			if slot_486_6_1 > 1 then
				if slot_486_6_1 <= slot_0_116_0 then
					slot_0_116_0 = 1
					slot_0_117_0 = not slot_0_117_0
				else
					slot_0_116_0 = slot_0_116_0 + 1
				end
			else
				slot_0_116_0 = 1
				slot_0_117_0 = not slot_0_117_0
			end
		end

		if slot_486_5_0 <= slot_0_115_0 then
			slot_0_115_0 = 0
		end

		slot_0_115_0 = slot_0_115_0 + 1
	end

	slot_486_6_0 = 0
	slot_486_7_0 = "Down"
	slot_0_125_0 = false
	slot_486_8_1 = slot_0_88_0.unsafe_yaw

	if slot_486_8_1.value and not slot_0_87_1 then
		if slot_486_8_1.events:get(2) then
			slot_486_9_2 = 0

			for iter_486_0, iter_486_1 in ipairs(slot_0_38_0.players) do
				if iter_486_1.is_enemy and iter_486_1.is_alive then
					slot_486_9_2 = slot_486_9_2 + 1
				end
			end

			slot_0_125_0 = slot_486_9_2 == 0
		end

		if slot_486_8_1.events:get(1) and slot_0_38_0.is_warmup then
			slot_0_125_0 = true
		end

		if slot_0_125_0 then
			slot_486_9_1 = slot_486_8_1.yaw.value

			if slot_486_9_1 == 1 then
				slot_486_6_0 = slot_0_103_0(1, -180, 180)
			end

			if slot_486_9_1 == 2 then
				slot_486_6_0 = math.random(-180, 180)
			end

			slot_486_10_1 = slot_486_8_1.pitch.value

			if slot_486_10_1 == 1 then
				slot_486_7_0 = "Disabled"
			end

			if slot_486_10_1 == 2 then
				slot_486_7_0 = "Down"
			end
		end
	end

	slot_486_8_0 = slot_0_89_0[arg_486_2][arg_486_1].force_disable
	slot_486_9_0 = slot_486_8_0:get(1)
	slot_486_10_0 = slot_486_8_0:get(2)
	slot_486_11_0 = slot_0_88_0.manual.value
	slot_0_126_0 = slot_0_100_0[slot_486_11_0] or 0
	slot_0_123_0 = slot_0_126_0 ~= 0
	slot_486_12_0 = slot_486_11_0 == "Left" or slot_486_11_0 == "Right"
	slot_486_13_0 = slot_0_88_0.manual.static.value

	if slot_486_9_0 then
		slot_0_126_0 = 0
		slot_0_123_0 = false
		slot_486_12_0 = false
	end

	slot_486_14_0 = slot_0_88_0.freestanding.value
	slot_486_15_0 = slot_0_88_0.freestanding.static.value

	if slot_486_14_0 and not slot_486_10_0 and not slot_0_123_0 and not slot_0_87_1 and not slot_0_24_0.freestanding:get() then
		slot_0_24_0.freestanding:override(true)
		slot_0_24_0.freestanding.yaw:override(slot_486_15_0)
		slot_0_24_0.freestanding.body:override(slot_486_15_0)
	else
		slot_0_24_0.freestanding:override()
	end

	slot_0_124_0 = slot_0_109_0 and not slot_0_123_0 and not slot_0_87_1
	slot_486_16_1 = slot_0_89_0[arg_486_2][arg_486_1].desync
	slot_486_17_0 = slot_486_16_1.desync_state.value
	slot_486_18_0 = slot_486_16_1.limits_value.value == 1

	if slot_486_16_1.value and slot_486_17_0 == 3 then
		if slot_486_16_1.delay.value <= slot_0_121_0 then
			slot_0_121_0 = 1
			slot_0_122_0 = not slot_0_122_0
		else
			slot_0_121_0 = slot_0_121_0 + 1
		end
	end

	slot_0_114_0(slot_0_24_0.antiaim.desync, function()
		if slot_0_125_0 then
			return false
		end

		if slot_0_124_0 then
			return true
		end

		if not slot_486_16_1.value then
			return false
		end

		if slot_486_17_0 == 2 then
			return math.random(0, 2) == 0
		end

		if slot_486_17_0 == 3 then
			return slot_0_122_0
		end

		return true
	end)

	slot_486_19_0 = 0

	if not slot_486_18_0 then
		slot_486_19_0 = math.random(slot_0_89_0[arg_486_2][arg_486_1].limit_min.value, slot_0_89_0[arg_486_2][arg_486_1].limit_max.value)
	end

	slot_0_114_0(slot_0_24_0.antiaim.left_limit, function()
		if slot_0_124_0 then
			return 5
		end

		return slot_486_18_0 and slot_0_89_0[arg_486_2][arg_486_1].left_limit.value or slot_486_19_0
	end)
	slot_0_114_0(slot_0_24_0.antiaim.right_limit, function()
		if slot_0_124_0 then
			return 5
		end

		return slot_486_18_0 and slot_0_89_0[arg_486_2][arg_486_1].right_limit.value or slot_486_19_0
	end)
	slot_0_114_0(slot_0_24_0.antiaim.enabled, function()
		return true
	end)
	slot_0_114_0(slot_0_24_0.antiaim.base, function()
		if slot_0_124_0 then
			return "at target"
		end

		if slot_0_87_1 or slot_0_123_0 then
			return "local view"
		end

		return slot_0_88_0.view.value
	end)
	slot_0_114_0(slot_0_24_0.antiaim.yaw, function()
		return "backward"
	end)
	slot_0_114_0(slot_0_24_0.antiaim.modifier, function()
		return "disabled"
	end)
	slot_0_114_0(slot_0_24_0.antiaim.pitch, function()
		if slot_0_125_0 then
			return slot_486_7_0
		end

		return slot_0_87_1 and "disabled" or "down"
	end)

	slot_486_16_0 = slot_0_89_0[arg_486_2][arg_486_1].options

	slot_0_114_0(slot_0_24_0.antiaim.inverter, function()
		if slot_0_124_0 then
			return true
		end

		if (not slot_486_14_0 or not slot_486_15_0) and (not slot_486_12_0 or not slot_486_13_0) and slot_486_16_0.jitter.value then
			return slot_0_117_0
		end

		return slot_486_16_0.inverter.value
	end)
	slot_0_114_0(slot_0_24_0.antiaim.freestanding, function()
		return slot_486_16_0.freestanding.value
	end)
	slot_0_114_0(slot_0_24_0.antiaim.options, function()
		return {}
	end)
	slot_0_114_0(slot_0_24_0.antiaim.offset, function()
		slot_0_127_0 = 0

		if slot_0_125_0 then
			return slot_486_6_0
		end

		if slot_0_124_0 then
			return 0
		end

		local var_498_0 = slot_0_89_0[arg_486_2][arg_486_1].offset
		local var_498_1 = var_498_0.value
		local var_498_2 = var_498_0.add_sides.value
		local var_498_3 = var_498_0.add_random.value
		local var_498_4 = slot_0_89_0[arg_486_2][arg_486_1].offset_add_left.value
		local var_498_5 = slot_0_89_0[arg_486_2][arg_486_1].offset_add_right.value
		local var_498_6 = slot_0_89_0[arg_486_2][arg_486_1].offset_add_random.value
		local var_498_7 = var_498_1

		if var_498_2 then
			var_498_7 = var_498_7 + (slot_486_3_0 and var_498_5 or var_498_4)
		end

		if var_498_3 then
			var_498_7 = var_498_7 + math.random(-var_498_6, var_498_6)
		end

		local var_498_8 = slot_0_89_0[arg_486_2][arg_486_1].modifier
		local var_498_9 = var_498_8.value
		local var_498_10 = var_498_8.min_max.value
		local var_498_11 = var_498_8.custom_ways.value
		local var_498_12 = var_498_8.apply_delay.value
		local var_498_13 = slot_0_89_0[arg_486_2][arg_486_1].speed.value
		local var_498_14 = slot_0_89_0[arg_486_2][arg_486_1].degree.value
		local var_498_15 = var_498_10 and slot_0_89_0[arg_486_2][arg_486_1].degree_min.value or var_498_14
		local var_498_16 = var_498_10 and slot_0_89_0[arg_486_2][arg_486_1].degree_max.value or -var_498_14
		local var_498_17 = slot_0_89_0[arg_486_2][arg_486_1].ways
		local var_498_18 = 0
		local var_498_19 = globals.tickcount % 4 >= 2

		if var_498_12 then
			var_498_19 = slot_0_117_0
		end

		if var_498_9 == "Center" then
			var_498_18 = var_498_19 and var_498_15 or var_498_16
		end

		if var_498_9 == "Offset" then
			if var_498_10 then
				var_498_18 = var_498_19 and var_498_15 or var_498_16
			else
				var_498_18 = var_498_19 and var_498_15 or 0
			end
		end

		if var_498_9 == "Random" then
			var_498_18 = math.random(var_498_15, var_498_16)
		end

		if var_498_9 == "Ways" then
			if var_498_11 then
				local var_498_20 = slot_0_16_0(slot_0_115_0, 1, slot_486_5_0)
				local var_498_21 = var_498_17[tostring(var_498_20)]

				if var_498_21 then
					var_498_18 = var_498_21.value
				end
			else
				local var_498_22 = slot_0_101_0(slot_486_5_0, var_498_15, var_498_16)[slot_0_16_0(slot_0_115_0, 1, slot_486_5_0)]

				if var_498_22 then
					var_498_18 = var_498_22
				end
			end
		end

		if var_498_9 == "Spin" then
			var_498_18 = slot_0_103_0(var_498_13 / 100, var_498_15, var_498_16)
		end

		if var_498_9 == "Sway" then
			var_498_18 = slot_0_102_0(var_498_13 / 100, var_498_15, var_498_16)
		end

		slot_0_127_0 = var_498_7 + var_498_18

		if slot_0_87_1 then
			return var_498_7 + var_498_18 + 180
		end

		if slot_486_12_0 and slot_486_13_0 then
			return var_498_7 + slot_0_126_0
		end

		return var_498_7 + var_498_18 + slot_0_126_0
	end)
end

slot_0_131_0 = 0

function slot_0_132_0(arg_499_0, arg_499_1, arg_499_2)
	return arg_499_0 % arg_499_1[arg_499_2 and math.random(1, #arg_499_1) or (arg_499_0 - 1) % #arg_499_1 + 1] == 0
end

slot_0_133_0 = false
slot_0_134_0 = 0
slot_0_135_0 = 1
slot_0_136_0 = 1
slot_0_137_0 = 1
slot_0_138_0 = 1
slot_0_139_0 = false
slot_0_140_0 = 1
slot_0_141_0 = false
slot_0_142_0 = 1
slot_0_143_0 = false
slot_0_144_0 = 1
slot_0_145_0 = 1

function slot_0_146_0(arg_500_0, arg_500_1, arg_500_2)
	slot_500_3_0 = globals.choked_commands
	slot_500_4_0 = arg_500_1 ~= nil and slot_0_90_0[arg_500_2][arg_500_1].force_break_lc
	slot_500_5_0 = arg_500_1 ~= nil and slot_500_4_0.value and not slot_0_125_0 and not slot_0_87_1 and not slot_0_124_0 and not slot_0_123_0

	slot_0_114_0(slot_0_24_0.double_tap.options, function()
		return slot_500_5_0 and slot_500_4_0.allow_double_tap.value and "always on" or nil
	end)
	slot_0_114_0(slot_0_24_0.hide_shots.options, function()
		return slot_500_5_0 and slot_500_4_0.allow_hide_shots.value and "break lc" or nil
	end)
	slot_0_114_0(slot_0_24_0.antiaim.hidden, function()
		return arg_500_1 ~= nil and not slot_0_88_0.unmatched_features.disable_defensive.value
	end)

	if not arg_500_1 then
		return
	end

	slot_500_6_0 = slot_0_90_0[arg_500_2][arg_500_1].custom_tickbase
	slot_500_7_0 = slot_500_6_0.value
	slot_500_8_0 = slot_500_6_0.static.value

	if slot_500_5_0 and slot_500_7_0 then
		arg_500_0.force_defensive = arg_500_0.command_number % slot_500_8_0 == 0
	end

	if slot_0_38_0.is_defensive then
		slot_0_131_0 = slot_0_131_0 + 1
	else
		slot_0_131_0 = 0
	end

	slot_500_9_0 = true
	slot_500_10_2 = slot_0_90_0[arg_500_2][arg_500_1].duration

	if slot_500_10_2.value then
		slot_500_12_3 = slot_500_10_2.mode.value
		slot_500_13_3 = nil

		if slot_500_12_3 == 1 then
			slot_500_13_3 = slot_500_10_2.static.value
		end

		if slot_500_12_3 == 2 then
			slot_500_14_3 = slot_500_10_2.stages_count.value

			if slot_0_131_0 == 1 then
				if slot_500_14_3 <= slot_0_144_0 then
					slot_0_144_0 = 0
				end

				slot_0_144_0 = slot_0_144_0 + 1
			end

			slot_500_13_3 = slot_500_10_2[tostring(slot_0_144_0)].value
		end

		if slot_500_12_3 == 3 then
			if slot_0_131_0 == 1 then
				slot_0_145_0 = math.random(slot_500_10_2.min.value, slot_500_10_2.max.value)
			end

			slot_500_13_3 = slot_0_145_0
		end

		if slot_500_13_3 ~= nil then
			slot_500_9_0 = slot_500_13_3 >= slot_0_131_0 and slot_0_131_0 ~= 0
		end
	end

	slot_500_10_1 = nil
	slot_500_11_2 = slot_0_90_0[arg_500_2][arg_500_1].pitch
	slot_500_12_2 = slot_500_11_2.value
	slot_500_13_2 = slot_500_11_2.min_max.value
	slot_500_14_2 = slot_500_11_2.custom_ways.value
	slot_500_15_2 = slot_0_90_0[arg_500_2][arg_500_1].pitch_degree.value
	slot_500_16_2 = slot_500_13_2 and slot_0_90_0[arg_500_2][arg_500_1].pitch_degree_min.value or -slot_500_15_2
	slot_500_17_2 = slot_500_13_2 and slot_0_90_0[arg_500_2][arg_500_1].pitch_degree_max.value or slot_500_15_2
	slot_500_18_2 = slot_0_90_0[arg_500_2][arg_500_1].pitch_ways_count.value
	slot_500_19_2 = slot_0_90_0[arg_500_2][arg_500_1].pitch_ways

	if slot_500_12_2 == "Static" then
		slot_500_10_1 = slot_500_15_2
	end

	if slot_500_12_2 == "Swap" then
		if slot_0_131_0 == 0 and slot_0_134_0 ~= 0 then
			slot_0_133_0 = not slot_0_133_0
		end

		slot_0_134_0 = slot_0_131_0
		slot_500_10_1 = slot_0_133_0 and slot_500_16_2 or slot_500_17_2
	end

	if slot_500_12_2 == "Switch" then
		slot_500_20_14 = slot_0_90_0[arg_500_2][arg_500_1].pitch_delay.value

		if slot_500_3_0 == 0 then
			if slot_500_20_14 > 1 then
				if slot_500_20_14 <= slot_0_140_0 then
					slot_0_140_0 = 1
					slot_0_141_0 = not slot_0_141_0
				else
					slot_0_140_0 = slot_0_140_0 + 1
				end
			else
				slot_0_140_0 = 1
				slot_0_141_0 = not slot_0_141_0
			end
		end

		slot_500_10_1 = slot_0_141_0 and slot_500_16_2 or slot_500_17_2
	end

	if slot_500_12_2 == "Random" then
		slot_500_10_1 = math.random(slot_500_16_2, slot_500_17_2)
	end

	if slot_500_12_2 == "Spin" then
		slot_500_20_13 = slot_0_90_0[arg_500_2][arg_500_1].pitch_speed.value
		slot_500_10_1 = slot_0_103_0(slot_500_20_13 / 100, slot_500_16_2, slot_500_17_2)
	end

	if slot_500_12_2 == "Sway" then
		slot_500_20_12 = slot_0_90_0[arg_500_2][arg_500_1].pitch_speed.value
		slot_500_10_1 = slot_0_102_0(slot_500_20_12 / 100, slot_500_16_2, slot_500_17_2)
	end

	if slot_500_12_2 == "Ways" then
		if slot_500_3_0 == 0 then
			if slot_500_18_2 <= slot_0_136_0 then
				slot_0_136_0 = 0
			end

			slot_0_136_0 = slot_0_136_0 + 1
		end

		if slot_500_14_2 then
			slot_500_20_11 = slot_0_16_0(slot_0_136_0, 1, slot_500_18_2)
			slot_500_21_5 = slot_500_19_2[tostring(slot_500_20_11)]

			if slot_500_21_5 then
				slot_500_10_1 = slot_500_21_5.value
			end
		else
			slot_500_20_10 = slot_0_101_0(slot_500_18_2, slot_500_16_2, slot_500_17_2)
			slot_500_21_4 = slot_0_16_0(slot_0_136_0, 1, slot_500_18_2)

			if slot_500_20_10[slot_500_21_4] then
				slot_500_10_1 = slot_500_20_10[slot_500_21_4]
			end
		end
	end

	if slot_500_9_0 and slot_500_10_1 then
		rage.antiaim:override_hidden_pitch(slot_500_10_1)
	end

	slot_500_10_0 = 0
	slot_500_11_1 = slot_0_90_0[arg_500_2][arg_500_1].yaw
	slot_500_12_1 = slot_500_11_1.value
	slot_500_13_1 = slot_500_11_1.min_max.value
	slot_500_14_1 = slot_500_11_1.custom_ways.value
	slot_500_15_1 = slot_0_90_0[arg_500_2][arg_500_1].yaw_degree.value
	slot_500_16_1 = slot_500_13_1 and slot_0_90_0[arg_500_2][arg_500_1].yaw_degree_min.value or -slot_500_15_1
	slot_500_17_1 = slot_500_13_1 and slot_0_90_0[arg_500_2][arg_500_1].yaw_degree_max.value or slot_500_15_1

	print()

	slot_500_18_1 = slot_0_90_0[arg_500_2][arg_500_1].yaw_ways_count.value
	slot_500_19_1 = slot_0_90_0[arg_500_2][arg_500_1].yaw_ways

	if slot_500_12_1 == "Static" then
		slot_500_10_0 = slot_500_15_1
	end

	if slot_500_12_1 == "Peek direction" and slot_0_38_0.peek_yaw then
		slot_500_10_0 = slot_0_38_0.peek_yaw - slot_0_126_0
	end

	if slot_500_12_1 == "Swap" then
		if slot_0_131_0 == 0 and slot_0_134_0 ~= 0 then
			slot_0_133_0 = not slot_0_133_0
		end

		slot_0_134_0 = slot_0_131_0
		slot_500_10_0 = slot_0_133_0 and slot_500_16_1 or slot_500_17_1
	end

	if slot_500_12_1 == "Switch" then
		slot_500_20_9 = slot_0_90_0[arg_500_2][arg_500_1].yaw_delay.value

		if slot_500_3_0 == 0 then
			if slot_500_20_9 > 1 then
				if slot_500_20_9 <= slot_0_138_0 then
					slot_0_138_0 = 1
					slot_0_139_0 = not slot_0_139_0
				else
					slot_0_138_0 = slot_0_138_0 + 1
				end
			else
				slot_0_138_0 = 1
				slot_0_139_0 = not slot_0_139_0
			end
		end

		slot_500_10_0 = slot_0_139_0 and slot_500_16_1 or slot_500_17_1
	end

	if slot_500_12_1 == "Random" then
		slot_500_10_0 = math.random(slot_500_16_1, slot_500_17_1)
	end

	if slot_500_12_1 == "Spin" then
		slot_500_20_8 = slot_0_90_0[arg_500_2][arg_500_1].yaw_speed.value
		slot_500_10_0 = slot_0_103_0(slot_500_20_8 / 100, slot_500_16_1, slot_500_17_1)
	end

	if slot_500_12_1 == "Sway" then
		slot_500_20_7 = slot_0_90_0[arg_500_2][arg_500_1].yaw_speed.value
		slot_500_10_0 = slot_0_102_0(slot_500_20_7 / 100, slot_500_16_1, slot_500_17_1)
	end

	if slot_500_12_1 == "Ways" then
		if slot_500_3_0 == 0 then
			if slot_500_18_1 <= slot_0_135_0 then
				slot_0_135_0 = 0
			end

			slot_0_135_0 = slot_0_135_0 + 1
		end

		if slot_500_14_1 then
			slot_500_20_6 = slot_0_16_0(slot_0_135_0, 1, slot_500_18_1)
			slot_500_21_3 = slot_500_19_1[tostring(slot_500_20_6)]

			if slot_500_21_3 then
				slot_500_10_0 = slot_500_21_3.value
			end
		else
			slot_500_20_5 = slot_0_101_0(slot_500_18_1, slot_500_16_1, slot_500_17_1)
			slot_500_21_2 = slot_0_16_0(slot_0_135_0, 1, slot_500_18_1)

			if slot_500_20_5[slot_500_21_2] then
				slot_500_10_0 = slot_500_20_5[slot_500_21_2]
			end
		end
	end

	slot_500_11_0 = slot_0_90_0[arg_500_2][arg_500_1].modifier
	slot_500_12_0 = slot_500_11_0.value
	slot_500_13_0 = slot_500_11_0.min_max.value
	slot_500_14_0 = slot_500_11_0.custom_ways.value
	slot_500_15_0 = slot_0_90_0[arg_500_2][arg_500_1].modifier_degree.value
	slot_500_16_0 = slot_500_13_0 and slot_0_90_0[arg_500_2][arg_500_1].modifier_degree_min.value or -slot_500_15_0
	slot_500_17_0 = slot_500_13_0 and slot_0_90_0[arg_500_2][arg_500_1].modifier_degree_max.value or slot_500_15_0
	slot_500_18_0 = slot_0_90_0[arg_500_2][arg_500_1].modifier_ways_count.value
	slot_500_19_0 = slot_0_90_0[arg_500_2][arg_500_1].modifier_ways

	if slot_500_12_0 == "Static" then
		slot_500_10_0 = slot_500_10_0 + slot_500_15_0
	end

	if yaw == "Peek direction" and slot_0_38_0.peek_yaw then
		slot_500_10_0 = slot_500_10_0 + slot_0_38_0.peek_yaw - slot_0_126_0
	end

	if slot_500_12_0 == "Swap" then
		if slot_0_131_0 == 0 and slot_0_134_0 ~= 0 then
			slot_0_133_0 = not slot_0_133_0
		end

		slot_0_134_0 = slot_0_131_0
		slot_500_10_0 = slot_500_10_0 + (slot_0_133_0 and slot_500_16_0 or slot_500_17_0)
	end

	if slot_500_12_0 == "Switch" then
		slot_500_20_4 = slot_0_90_0[arg_500_2][arg_500_1].modifier_delay.value

		if slot_500_3_0 == 0 then
			if slot_500_20_4 > 1 then
				if slot_500_20_4 <= slot_0_142_0 then
					slot_0_142_0 = 1
					slot_0_143_0 = not slot_0_143_0
				else
					slot_0_142_0 = slot_0_142_0 + 1
				end
			else
				slot_0_142_0 = 1
				slot_0_143_0 = not slot_0_143_0
			end
		end

		slot_500_10_0 = slot_500_10_0 + (slot_0_143_0 and slot_500_16_0 or slot_500_17_0)
	end

	if slot_500_12_0 == "Random" then
		slot_500_10_0 = slot_500_10_0 + math.random(slot_500_16_0, slot_500_17_0)
	end

	if slot_500_12_0 == "Spin" then
		slot_500_20_3 = slot_0_90_0[arg_500_2][arg_500_1].modifier_speed.value
		slot_500_10_0 = slot_500_10_0 + slot_0_103_0(slot_500_20_3 / 100, slot_500_16_0, slot_500_17_0)
	end

	if slot_500_12_0 == "Sway" then
		slot_500_20_2 = slot_0_90_0[arg_500_2][arg_500_1].modifier_speed.value
		slot_500_10_0 = slot_500_10_0 + slot_0_102_0(slot_500_20_2 / 100, slot_500_16_0, slot_500_17_0)
	end

	if slot_500_12_0 == "Ways" then
		if slot_500_3_0 == 0 then
			if slot_500_18_0 <= slot_0_137_0 then
				slot_0_137_0 = 0
			end

			slot_0_137_0 = slot_0_137_0 + 1
		end

		if slot_500_14_0 then
			slot_500_20_1 = slot_0_16_0(slot_0_137_0, 1, slot_500_18_0)
			slot_500_21_1 = slot_500_19_0[tostring(slot_500_20_1)]

			if slot_500_21_1 then
				slot_500_10_0 = slot_500_10_0 + slot_500_21_1.value
			end
		else
			slot_500_20_0 = slot_0_101_0(slot_500_18_0, slot_500_16_0, slot_500_17_0)
			slot_500_21_0 = slot_0_16_0(slot_0_137_0, 1, slot_500_18_0)

			if slot_500_20_0[slot_500_21_0] then
				slot_500_10_0 = slot_500_10_0 + slot_500_20_0[slot_500_21_0]
			end
		end
	end

	if slot_0_90_0[arg_500_2][arg_500_1].enable.remove_modifier.value then
		slot_500_10_0 = slot_500_10_0 - slot_0_127_0
	end

	rage.antiaim:override_hidden_yaw_offset(slot_500_9_0 and -slot_500_10_0 or 0)
end

function slot_0_147_0(arg_504_0)
	local var_504_0 = slot_0_38_0.me
	local var_504_1 = slot_0_38_0.velocity
	local var_504_2 = slot_0_38_0.anim_state

	if not var_504_0 or not var_504_1 or not var_504_2 then
		return
	end

	local var_504_3 = arg_504_0.in_jump
	local var_504_4 = var_504_0.m_iTeamNum
	local var_504_5 = var_504_2.on_ground
	local var_504_6 = var_504_2.anim_duck_amount
	local var_504_7 = slot_0_88_0.state.use_teams.value
	local var_504_8 = slot_0_88_0.defensive_state.use_teams.value
	local var_504_9 = var_504_4 == 1 and slot_0_99_0[2] or slot_0_99_0[3]
	local var_504_10 = var_504_7 and var_504_9 or slot_0_99_0[1]
	local var_504_11 = var_504_8 and var_504_9 or slot_0_99_0[1]
	local var_504_12 = slot_0_94_0

	for iter_504_0, iter_504_1 in ipairs(slot_0_106_0.names) do
		local var_504_13 = slot_0_106_0.callbacks[iter_504_1]
		local var_504_14 = slot_0_89_0[var_504_10][iter_504_1] and slot_0_89_0[var_504_10][iter_504_1].enable and slot_0_89_0[var_504_10][iter_504_1].enable.value

		if var_504_13 and var_504_13(var_504_3, var_504_5, var_504_6, var_504_1) and var_504_14 then
			var_504_12 = iter_504_1

			break
		end
	end

	slot_0_110_0(arg_504_0)
	slot_0_112_0(arg_504_0)
	slot_0_113_0()
	slot_0_130_0(arg_504_0, var_504_12, var_504_10)

	local var_504_15

	for iter_504_2, iter_504_3 in ipairs(slot_0_107_0.names) do
		local var_504_16 = slot_0_107_0.callbacks[iter_504_3]
		local var_504_17 = slot_0_90_0[var_504_11][iter_504_3] and slot_0_90_0[var_504_11][iter_504_3].enable and slot_0_90_0[var_504_11][iter_504_3].enable.value

		if var_504_16 and var_504_16(var_504_3, var_504_5, var_504_6, var_504_1) and var_504_17 then
			var_504_15 = iter_504_3

			break
		end
	end

	slot_0_146_0(arg_504_0, var_504_15, var_504_11)
end

events.createmove(slot_0_147_0)

slot_0_86_0 = {
	states = slot_0_89_0,
	elements = slot_0_88_0,
	defensive_states = slot_0_90_0
}
slot_0_35_0.package = slot_0_8_0.setup({
	antiaim = slot_0_86_0,
	features = slot_0_23_0.get_storage()
}, true)
slot_0_87_0 = nil

slot_0_8_0.sidebar("evalate 2", "signal-stream")
print(slot_0_7_0:stop(), "ms")
