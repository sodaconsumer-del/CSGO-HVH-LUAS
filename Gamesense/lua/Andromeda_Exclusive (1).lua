-- Andromeda Exclusive - reconstructed Lua source
-- Luraph VM dispatcher and bytecode loader removed.
-- Control flow was reconstructed function-by-function from the final VM state.
-- Original debug names were destroyed; semantic names and stable synthetic locals are used below.

local unpack = table.unpack or unpack

local math_helpers = {
	[1] = math.clamp,
	[5] = math.modf,
	[6] = math.pi,
	[7] = string.len,
	[8] = math.floor,
	[9] = math.ceil,
	[10] = string.byte,
}
local runtime, POW2, EMPTY = {}, {}, {}

for index = 0, 32 do
	POW2[index] = 2 ^ index
end

local function bind(fn, captured_upvalues)
	return function(...) 
		return fn(captured_upvalues, ...)
	end
end

local function make_locals()
	return setmetatable({__top = 0}, {
		__index = function(self, key)
			if type(key) == "number" then
				return rawget(self, "v" .. key)
			end
		end,
		__newindex = function(self, key, value)
			local slot = type(key) == "number" and key or tonumber(tostring(key):match("^v(%d+)$"))
			if slot ~= nil then
				rawset(self, "__top", math.max(rawget(self, "__top") or 0, slot))
				rawset(self, "v" .. slot, value)
			else
				rawset(self, key, value)
			end
		end,
	})
end

local function unpack_locals(locals, first, last)
	last = last == nil and locals.__top or last
	if first > last then return end
	return locals[first], unpack_locals(locals, first + 1, last)
end

local function locals_length(locals)
	local index = 1
	while locals[index] ~= nil do index = index + 1 end
	return index - 1
end

local visuals, antiaim, ragebot, defensive, wraith = {}, {}, {}, {}, {}
local andromeda = { name = "Andromeda Exclusive" }
local recovered = {}

local function build_builtin_references(ui_module)
	ui_module = ui_module or ui
	local function ref(...)
		local ok, a, b, c, d = pcall(ui_module.reference, ...)
		if not ok then
			ok, a, b, c, d = pcall(ui.reference, ...)
		end
		if not ok then
			return nil
		end
		-- prefer first return; keep multi-ref as table when needed
		if b ~= nil then
			return { a, b, c, d }
		end
		return a
	end
	return {
		ragebot = {
			enabled = ref("rage", "aimbot", "enabled"),
			weapon_type = ref("rage", "weapon type", "weapon type"),
			stop = ref("rage", "aimbot", "quick stop"),
			target_selection = ref("rage", "aimbot", "target selection"),
			target_hitbox = ref("rage", "aimbot", "target hitbox"),
			pointscale = ref("rage", "aimbot", "multi-point scale"),
			minimum_damage = ref("rage", "aimbot", "minimum damage"),
			minimum_damage_override = ref("rage", "aimbot", "minimum damage override"),
			minimum_hitchance = ref("rage", "aimbot", "minimum hit chance"),
			double_tap = ref("rage", "aimbot", "double tap"),
			body_aim = ref("rage", "aimbot", "force body aim"),
			body_aim_on_peek = ref("rage", "aimbot", "force body aim on peek"),
			prefer_body_aim_disablers = ref("rage", "aimbot", "prefer body aim disablers"),
			safe_point = ref("rage", "aimbot", "force safe point"),
			double_tap_fl = ref("rage", "aimbot", "double tap fake lag limit"),
			double_tap_stop = ref("rage", "aimbot", "double tap quick stop"),
			quickpeek = ref("rage", "other", "quick peek assist"),
			quickpeekm = ref("rage", "other", "quick peek assist mode"),
			fakeduck = ref("rage", "other", "duck peek assist"),
			log_spread = ref("rage", "other", "log misses due to spread"),
			delay_shot = ref("rage", "other", "delay shot"),
			avoid_unsafe_hitboxes = ref("rage", "aimbot", "avoid unsafe hitboxes"),
		},
		antiaim = {
			angles = {
				enabled = ref("aa", "anti-aimbot angles", "enabled"),
				pitch = ref("aa", "anti-aimbot angles", "pitch"),
				roll = ref("aa", "anti-aimbot angles", "roll"),
				yaw_base = ref("aa", "anti-aimbot angles", "yaw base"),
				yaw = ref("aa", "anti-aimbot angles", "yaw"),
				freestanding_body_yaw = ref("aa", "anti-aimbot angles", "freestanding body yaw"),
				edge_yaw = ref("aa", "anti-aimbot angles", "edge yaw"),
				yaw_jitter = ref("aa", "anti-aimbot angles", "yaw jitter"),
				body_yaw = ref("aa", "anti-aimbot angles", "body yaw"),
				freestanding = ref("aa", "anti-aimbot angles", "freestanding"),
			},
			fakelag = {
				on = ref("aa", "fake lag", "enabled"),
				amount = ref("aa", "fake lag", "amount"),
				variance = ref("aa", "fake lag", "variance"),
				limit = ref("aa", "fake lag", "limit"),
			},
			other = {
				on_shot_antiaim = ref("aa", "other", "on shot anti-aim"),
				slow_motion = ref("aa", "other", "slow motion"),
				fake_peek = ref("aa", "other", "fake peek"),
				leg_movement = ref("aa", "other", "leg movement"),
			},
		},
		visuals = {
			thirdperson = ref("visuals", "effects", "force third person (alive)"),
			local_chams = ref("visuals", "colored models", "local player"),
			scope = ref("visuals", "effects", "remove scope overlay"),
			clantag = ref("misc", "miscellaneous", "clan tag spammer"),
			dormantesp = ref("visuals", "player esp", "dormant"),
			zfov = ref("misc", "miscellaneous", "override zoom fov"),
			ping = ref("misc", "miscellaneous", "ping spike"),
			fov = ref("misc", "miscellaneous", "override fov"),
			dpi = ref("misc", "settings", "dpi scale"),
			clrmenu = ref("misc", "settings", "menu color"),
			name = ref("visuals", "player esp", "name"),
			edge_jump = ref("misc", "movement", "jump at edge"),
		},
		misc = {
			air_strafe = ref("misc", "movement", "air strafe"),
			anti_untrusted = ref("misc", "settings", "anti-untrusted"),
			usercmd = ref("misc", "settings", "sv_maxusrcmdprocessticks2"),
		},
	}
end

local function load_andromeda_dependencies(require_module)
	require_module = require_module or require
	return {
		pui = require_module("gamesense/pui"),
		vector = require_module("vector"),
		entity_bootstrap = require_module("gamesense/entity"),
		csgo_weapons = require_module("gamesense/csgo_weapons"),
		entity = require_module("gamesense/entity"),
		base64 = require_module("gamesense/base64"),
		clipboard = require_module("gamesense/clipboard"),
		msgpack = require_module("gamesense/msgpack"),
	}
end

local function build_andromeda_menu(pui, handlers, builtin_refs)
	handlers = handlers or {}
	local groups = {
		angles = pui.group("AA", "Anti-aimbot angles"),
		fake_lag = pui.group("AA", "Fake lag"),
		other = pui.group("AA", "Other"),
	}
	local menu = {
		antiaim = {}, builder = {}, config = {}, defensive = {}, esp = {}, ragebot = {}, visuals = {},
	}
	menu.antiaim.features = {}
	menu.antiaim.gamesense = {}
	menu.config.handlers = {}
	menu.ragebot.hitchance = {}
	menu.visuals.animations = {}
	menu.visuals.stubs = {}
	menu.visuals.widgets = {}
	menu.antiaim.features.hotkeys = {}
	menu.antiaim.features.safe_head = {}
	menu.ragebot.hitchance.AWP = {}
	menu.ragebot.hitchance.Pistols = {}
	menu.ragebot.hitchance.Scout = {}
	menu.ragebot.hitchance.option_list = {}
	menu.ragebot.hitchance.weapon_list = {}
	menu.ragebot.hitchance["Auto Snipers"] = {}
	menu.ragebot.hitchance["Desert Eagle"] = {}
	menu.ragebot.hitchance["Revolver R8"] = {}
	menu.ragebot.hitchance.AWP.Crouch = {}
	menu.ragebot.hitchance.AWP.Hotkey = {}
	menu.ragebot.hitchance.AWP["In Air"] = {}
	menu.ragebot.hitchance.AWP["No Scope"] = {}
	menu.ragebot.hitchance.AWP["Peek Assist"] = {}
	menu.ragebot.hitchance.Pistols.Crouch = {}
	menu.ragebot.hitchance.Pistols.Hotkey = {}
	menu.ragebot.hitchance.Pistols["In Air"] = {}
	menu.ragebot.hitchance.Pistols["Peek Assist"] = {}
	menu.ragebot.hitchance.Scout.Crouch = {}
	menu.ragebot.hitchance.Scout.Hotkey = {}
	menu.ragebot.hitchance.Scout["In Air"] = {}
	menu.ragebot.hitchance.Scout["No Scope"] = {}
	menu.ragebot.hitchance.Scout["Peek Assist"] = {}
	menu.ragebot.hitchance["Auto Snipers"].Crouch = {}
	menu.ragebot.hitchance["Auto Snipers"].Hotkey = {}
	menu.ragebot.hitchance["Auto Snipers"]["In Air"] = {}
	menu.ragebot.hitchance["Auto Snipers"]["No Scope"] = {}
	menu.ragebot.hitchance["Auto Snipers"]["Peek Assist"] = {}
	menu.ragebot.hitchance["Desert Eagle"].Crouch = {}
	menu.ragebot.hitchance["Desert Eagle"].Hotkey = {}
	menu.ragebot.hitchance["Desert Eagle"]["In Air"] = {}
	menu.ragebot.hitchance["Desert Eagle"]["Peek Assist"] = {}
	menu.ragebot.hitchance["Revolver R8"].Crouch = {}
	menu.ragebot.hitchance["Revolver R8"].Hotkey = {}
	menu.ragebot.hitchance["Revolver R8"]["In Air"] = {}
	menu.ragebot.hitchance["Revolver R8"]["Peek Assist"] = {}

	-- Static tabs: Configs, Ragebot, Anti-Aim and Other
	-- switch_title
	menu.switch_title = groups.angles:label("Andro\011meda\r Exclu\011sive")
	-- switch
	menu.switch = groups.angles:combobox("\nmenu_switch", {"Configs", "Ragebot", "Anti-Aim", "Other"})
	-- switch_type
	menu.switch_type = groups.angles:combobox("\aB6FF0FFF◆ \rMode\nswitch_type", {"Builder", "Defensive"})
	-- config
	menu.config.list = groups.angles:listbox("\aB6FF0FFF◆ \rConfigs\nandromeda_config_list", {"No configs"})
	menu.config.name = groups.angles:textbox("\aB6FF0FFF● \rConfig name\nandromeda_config_name")
	menu.config.warmup_config = groups.fake_lag:button("Warmup Config", handlers.p280)
	menu.config.load = groups.angles:button("Load", handlers.p323)
	menu.config.save = groups.angles:button("Save", handlers.p180)
	menu.config.delete = groups.angles:button("Delete", handlers.p382)
	menu.config.export = groups.angles:button("Export", handlers.p395)
	menu.config.import = groups.angles:button("Import", handlers.p229)
	-- ragebot
	menu.ragebot.hold_aim_ticks = groups.other:checkbox("\aB6FF0FFF◆ \rDisable Delay After Shot")
	menu.ragebot.extrapolation = groups.angles:slider("\aB6FF0FFF◆ \rExtrapolation\nragebot_extrapolation", 0, 5, 0, true, "t", 1, {[0] = "Default"})
	menu.ragebot.overpredict = groups.angles:slider("\aB6FF0FFF◆ \rOverpredict\nragebot_extrapolation_overpredict", 0, 200, 125, true, "%", 1, {[0] = "Off"})
	menu.ragebot.enemy_resolver = groups.other:checkbox("\aB6FF0FFF◆ \rResolver")
	menu.ragebot.enemy_resolver_mode = groups.other:combobox("\nenemy_resolver_mode", {"Custom", "Auto"})
	menu.ragebot.enemy_resolver_generate = groups.other:combobox("\nenemy_resolver_generate", {"Adaptive", "Freestanding"})
	menu.ragebot.enemy_resolver_output = groups.other:multiselect("\nenemy_resolver_output", {"Flags", "Logging"})
	menu.ragebot.hitchance.enabled = groups.fake_lag:checkbox("\aB6FF0FFF◆ \rHitchance Override")
	menu.ragebot.hitchance.weapon = groups.fake_lag:combobox("\nweapon_hitchance", {"Auto Snipers", "Desert Eagle", "Revolver R8", "Pistols", "Scout", "AWP"})
	menu.ragebot.hitchance.hotkey = groups.fake_lag:hotkey("\aB6FF0FFF● \rHotkey")
	menu.ragebot.hitchance["Auto Snipers"].options = groups.fake_lag:multiselect("\nhitchance_options_Auto Snipers", {"In Air", "No Scope", "Hotkey", "Crouch", "Peek Assist"})
	menu.ragebot.hitchance["Auto Snipers"]["In Air"].value = groups.fake_lag:slider("\aB6FF0FFF● \rIn Air\nhitchance_In Air_Auto Snipers", 0, 100, 0, true, "%", 1)
	menu.ragebot.hitchance["Auto Snipers"]["No Scope"].value = groups.fake_lag:slider("\aB6FF0FFF● \rNo Scope\nhitchance_No Scope_Auto Snipers", 0, 100, 0, true, "%", 1)
	menu.ragebot.hitchance["Auto Snipers"]["No Scope"].distance = groups.fake_lag:slider("\aB6FF0FFF● \rDistance\nhitchance_no_scope_distance_Auto Snipers", 5, 101, 35, true, "u", 1, {[101] = "Inf"})
	menu.ragebot.hitchance["Auto Snipers"].Hotkey.value = groups.fake_lag:slider("\aB6FF0FFF● \rHotkey\nhitchance_Hotkey_Auto Snipers", 0, 100, 0, true, "%", 1)
	menu.ragebot.hitchance["Auto Snipers"].Crouch.value = groups.fake_lag:slider("\aB6FF0FFF● \rCrouch\nhitchance_Crouch_Auto Snipers", 0, 100, 0, true, "%", 1)
	menu.ragebot.hitchance["Auto Snipers"]["Peek Assist"].value = groups.fake_lag:slider("\aB6FF0FFF● \rPeek Assist\nhitchance_Peek Assist_Auto Snipers", 0, 100, 0, true, "%", 1)
	menu.ragebot.hitchance["Desert Eagle"].options = groups.fake_lag:multiselect("\nhitchance_options_Desert Eagle", {"In Air", "Hotkey", "Crouch", "Peek Assist"})
	menu.ragebot.hitchance["Desert Eagle"]["In Air"].value = groups.fake_lag:slider("\aB6FF0FFF● \rIn Air\nhitchance_In Air_Desert Eagle", 0, 100, 0, true, "%", 1)
	menu.ragebot.hitchance["Desert Eagle"].Hotkey.value = groups.fake_lag:slider("\aB6FF0FFF● \rHotkey\nhitchance_Hotkey_Desert Eagle", 0, 100, 0, true, "%", 1)
	menu.ragebot.hitchance["Desert Eagle"].Crouch.value = groups.fake_lag:slider("\aB6FF0FFF● \rCrouch\nhitchance_Crouch_Desert Eagle", 0, 100, 0, true, "%", 1)
	menu.ragebot.hitchance["Desert Eagle"]["Peek Assist"].value = groups.fake_lag:slider("\aB6FF0FFF● \rPeek Assist\nhitchance_Peek Assist_Desert Eagle", 0, 100, 0, true, "%", 1)
	menu.ragebot.hitchance["Revolver R8"].options = groups.fake_lag:multiselect("\nhitchance_options_Revolver R8", {"In Air", "Hotkey", "Crouch", "Peek Assist"})
	menu.ragebot.hitchance["Revolver R8"]["In Air"].value = groups.fake_lag:slider("\aB6FF0FFF● \rIn Air\nhitchance_In Air_Revolver R8", 0, 100, 0, true, "%", 1)
	menu.ragebot.hitchance["Revolver R8"].Hotkey.value = groups.fake_lag:slider("\aB6FF0FFF● \rHotkey\nhitchance_Hotkey_Revolver R8", 0, 100, 0, true, "%", 1)
	menu.ragebot.hitchance["Revolver R8"].Crouch.value = groups.fake_lag:slider("\aB6FF0FFF● \rCrouch\nhitchance_Crouch_Revolver R8", 0, 100, 0, true, "%", 1)
	menu.ragebot.hitchance["Revolver R8"]["Peek Assist"].value = groups.fake_lag:slider("\aB6FF0FFF● \rPeek Assist\nhitchance_Peek Assist_Revolver R8", 0, 100, 0, true, "%", 1)
	menu.ragebot.hitchance.Pistols.options = groups.fake_lag:multiselect("\nhitchance_options_Pistols", {"In Air", "Hotkey", "Crouch", "Peek Assist"})
	menu.ragebot.hitchance.Pistols["In Air"].value = groups.fake_lag:slider("\aB6FF0FFF● \rIn Air\nhitchance_In Air_Pistols", 0, 100, 0, true, "%", 1)
	menu.ragebot.hitchance.Pistols.Hotkey.value = groups.fake_lag:slider("\aB6FF0FFF● \rHotkey\nhitchance_Hotkey_Pistols", 0, 100, 0, true, "%", 1)
	menu.ragebot.hitchance.Pistols.Crouch.value = groups.fake_lag:slider("\aB6FF0FFF● \rCrouch\nhitchance_Crouch_Pistols", 0, 100, 0, true, "%", 1)
	menu.ragebot.hitchance.Pistols["Peek Assist"].value = groups.fake_lag:slider("\aB6FF0FFF● \rPeek Assist\nhitchance_Peek Assist_Pistols", 0, 100, 0, true, "%", 1)
	menu.ragebot.hitchance.Scout.options = groups.fake_lag:multiselect("\nhitchance_options_Scout", {"In Air", "No Scope", "Hotkey", "Crouch", "Peek Assist"})
	menu.ragebot.hitchance.Scout["In Air"].value = groups.fake_lag:slider("\aB6FF0FFF● \rIn Air\nhitchance_In Air_Scout", 0, 100, 0, true, "%", 1)
	menu.ragebot.hitchance.Scout["No Scope"].value = groups.fake_lag:slider("\aB6FF0FFF● \rNo Scope\nhitchance_No Scope_Scout", 0, 100, 0, true, "%", 1)
	menu.ragebot.hitchance.Scout["No Scope"].distance = groups.fake_lag:slider("\aB6FF0FFF● \rDistance\nhitchance_no_scope_distance_Scout", 5, 101, 35, true, "u", 1, {[101] = "Inf"})
	menu.ragebot.hitchance.Scout.Hotkey.value = groups.fake_lag:slider("\aB6FF0FFF● \rHotkey\nhitchance_Hotkey_Scout", 0, 100, 0, true, "%", 1)
	menu.ragebot.hitchance.Scout.Crouch.value = groups.fake_lag:slider("\aB6FF0FFF● \rCrouch\nhitchance_Crouch_Scout", 0, 100, 0, true, "%", 1)
	menu.ragebot.hitchance.Scout["Peek Assist"].value = groups.fake_lag:slider("\aB6FF0FFF● \rPeek Assist\nhitchance_Peek Assist_Scout", 0, 100, 0, true, "%", 1)
	menu.ragebot.hitchance.AWP.options = groups.fake_lag:multiselect("\nhitchance_options_AWP", {"In Air", "No Scope", "Hotkey", "Crouch", "Peek Assist"})
	menu.ragebot.hitchance.AWP["In Air"].value = groups.fake_lag:slider("\aB6FF0FFF● \rIn Air\nhitchance_In Air_AWP", 0, 100, 0, true, "%", 1)
	menu.ragebot.hitchance.AWP["No Scope"].value = groups.fake_lag:slider("\aB6FF0FFF● \rNo Scope\nhitchance_No Scope_AWP", 0, 100, 0, true, "%", 1)
	menu.ragebot.hitchance.AWP["No Scope"].distance = groups.fake_lag:slider("\aB6FF0FFF● \rDistance\nhitchance_no_scope_distance_AWP", 5, 101, 35, true, "u", 1, {[101] = "Inf"})
	menu.ragebot.hitchance.AWP.Hotkey.value = groups.fake_lag:slider("\aB6FF0FFF● \rHotkey\nhitchance_Hotkey_AWP", 0, 100, 0, true, "%", 1)
	menu.ragebot.hitchance.AWP.Crouch.value = groups.fake_lag:slider("\aB6FF0FFF● \rCrouch\nhitchance_Crouch_AWP", 0, 100, 0, true, "%", 1)
	menu.ragebot.hitchance.AWP["Peek Assist"].value = groups.fake_lag:slider("\aB6FF0FFF● \rPeek Assist\nhitchance_Peek Assist_AWP", 0, 100, 0, true, "%", 1)
	-- antiaim
	menu.antiaim.features.anti_backstab = groups.fake_lag:checkbox("\aB6FF0FFF● \rAvoid Backstab")
	menu.antiaim.features.safe_head.enabled = groups.fake_lag:checkbox("\aB6FF0FFF● \rSafe Head")
	menu.antiaim.features.safe_head.states = groups.fake_lag:multiselect("\nsafe_head_states", {"Knife", "Zeus"})
	menu.antiaim.features.disable_fakelag = groups.fake_lag:multiselect("\aB6FF0FFF● \rDisable Fakelag\nantiaim_disable_fakelag", {"Double Tap", "Hide Shots", "Standing"})
	menu.antiaim.features.fakelag_exploit_enabled = groups.fake_lag:checkbox("\aB6FF0FFF● \rFakelag Exploit Tick")
	menu.antiaim.features.fakelag_exploit_tick = groups.fake_lag:slider("\nantiaim_fakelag_exploit_tick", 16, 30, (function()
			local r = builtin_refs and builtin_refs.misc and builtin_refs.misc.usercmd
			if type(r) == "number" then
				local ok, v = pcall(ui.get, r)
				if ok and type(v) == "number" then return v end
			elseif type(r) == "userdata" or type(r) == "table" then
				if type(r.get) == "function" then
					local ok, v = pcall(function() return r:get() end)
					if ok and type(v) == "number" then return v end
				end
			end
			return 16
		end)(), true, "", 1)
	menu.antiaim.features.fakelag_exploit_force = groups.fake_lag:button("Force fakelag to value", handlers.p475)
	menu.antiaim.features.hotkeys.left = groups.other:hotkey("\aB6FF0FFF◆ \rLeft")
	menu.antiaim.features.hotkeys.right = groups.other:hotkey("\aB6FF0FFF◆ \rRight")
	menu.antiaim.features.hotkeys.forward = groups.other:hotkey("\aB6FF0FFF◆ \rForward")
	menu.antiaim.features.hotkeys.reset = groups.other:hotkey("\aB6FF0FFF◆ \rReset")
	menu.antiaim.features.hotkeys.freestanding = groups.other:hotkey("\aB6FF0FFF◆ \rFreestanding")
	menu.antiaim.features.hotkeys.edgeyaw = groups.other:hotkey("\aB6FF0FFF◆ \rEdge yaw")
	-- visuals
	menu.visuals.stubs.manual_arrows = groups.other:checkbox("\aB6FF0FFF◆ \rManual Arrows")
	menu.visuals.stubs.manual_arrows_style = groups.other:combobox("\nmanual_arrows_style", {"First", "Second", "Third", "Fourth", "Fifth", "CS2"})
	menu.visuals.stubs.manual_arrows_offset = groups.other:slider("\nmanual_arrows_offset", 30, 140, 55, true, "px", 1)
	menu.visuals.stubs.manual_arrows_color = groups.other:color_picker("\aB6FF0FFF● \rColor\nmanual_arrows_color", 0, 200, 255, 255)
	menu.visuals.stubs.manual_arrows_cs2_color = groups.other:color_picker("\aB6FF0FFF● \rColor\nmanual_arrows_cs2_color", 235, 90, 170, 255)
	menu.visuals.stubs.manual_arrows_ts_cl1 = groups.other:color_picker("\aB6FF0FFF● \rAccent Color\nmanual_arrows_ts_cl1", 175, 255, 0, 255)
	menu.visuals.stubs.manual_arrows_ts_cl2 = groups.other:color_picker("\aB6FF0FFF● \rDesync Color\nmanual_arrows_ts_cl2", 0, 200, 255, 255)
	-- antiaim
	menu.antiaim.conditions = groups.angles:combobox("\aB6FF0FFF◆ \rState\nantiaim_preset_condition", {"Stand", "Move", "Slow-motion", "Air", "Air-crouch", "Crouch", "Crouch-move", "Manual", "Freestanding"}, nil, false)
	-- visuals
	menu.visuals.stubs.watermark = groups.fake_lag:checkbox("\aB6FF0FFF◆ \rWatermark")
	menu.visuals.stubs.watermark_style = groups.fake_lag:combobox("\nwatermark_style", {"CS2", "Supremacy"})
	menu.visuals.stubs.watermark_display = groups.fake_lag:multiselect("\nwatermark_display", {"FPS", "Ping", "K/D ratio", "Clock"})
	menu.visuals.stubs.watermark_accent_color = groups.fake_lag:color_picker("\aB6FF0FFF● \rAccent Color\nwatermark_accent_color", 186, 255, 15, 255)
	menu.visuals.stubs.watermark_position = groups.fake_lag:combobox("\nwatermark_position", {"Top Left", "Top Center", "Top Right", "Bottom Left", "Bottom Center", "Bottom Right"})
	menu.visuals.stubs.watermark_cs2_gradient = groups.fake_lag:slider("\nwatermark_cs2_gradient", 0, 255, 110, true, "", 1)
	menu.visuals.stubs.feature_indicators = groups.fake_lag:checkbox("\aB6FF0FFF◆ \rCrosshair Indicators")
	menu.visuals.stubs.feature_indicators_offset = groups.fake_lag:slider("\nfeature_indicators_offset", -120, 120, 25, true, "px", 1)
	menu.visuals.stubs.damage_indicator = groups.fake_lag:checkbox("\aB6FF0FFF◆ \rDamage Indicator", {255, 255, 255, 255})
	menu.visuals.stubs.native_indicators = groups.fake_lag:checkbox("\aB6FF0FFF◆ \rFeature Indicators")
	menu.visuals.stubs.native_indicators_gradient = groups.fake_lag:slider("\nnative_indicators_gradient", 0, 255, 110, true, "", 1)
	menu.visuals.stubs.aimbot_logs = groups.fake_lag:checkbox("\aB6FF0FFF◆ \rAimbot Logs")
	menu.visuals.stubs.aimbot_logs_hit_label = groups.fake_lag:label("\aB6FF0FFF● \rHit")
	menu.visuals.stubs.aimbot_logs_hit_color = groups.fake_lag:color_picker("\naimbot_logs_hit_color", 186, 255, 15, 255)
	menu.visuals.stubs.aimbot_logs_miss_label = groups.fake_lag:label("\aB6FF0FFF● \rMiss")
	menu.visuals.stubs.aimbot_logs_miss_color = groups.fake_lag:color_picker("\naimbot_logs_miss_color", 228, 83, 78, 255)
	menu.visuals.stubs.aimbot_logs_got_label = groups.fake_lag:label("\aB6FF0FFF● \rGot Hit")
	menu.visuals.stubs.aimbot_logs_got_color = groups.fake_lag:color_picker("\naimbot_logs_got_color", 201, 178, 88, 255)
	menu.visuals.stubs.aimbot_logs_gradient = groups.fake_lag:slider("\naimbot_logs_gradient", 0, 255, 95, true, "", 1)
	menu.visuals.animations.enabled = groups.angles:checkbox("\aB6FF0FFF◆ \rAnimations\n")
	menu.visuals.animations.enabled_spacer = groups.angles:label("\nanimations_enabled_spacer")
	menu.visuals.animations.air_legs = groups.angles:combobox("\aB6FF0FFF● \rAir legs\nanimations_air_legs", {"Off", "Static", "Moonwalk", "Kangaroo"})
	menu.visuals.animations.air_legs_weight = groups.angles:slider("\nanimations_air_legs_weight", 0, 100, 100, true, "%", 1)
	menu.visuals.animations.air_legs_spacer = groups.angles:label("\nanimations_air_legs_spacer")
	menu.visuals.animations.ground_legs = groups.angles:combobox("\aB6FF0FFF● \rGround legs\nanimations_ground_legs", {"Off", "Static", "Jitter", "Moonwalk", "Kangaroo", "Jitter[2]"})
	menu.visuals.animations.legs_offset_1 = groups.angles:slider("\nanimations_legs_offset_1", 0, 100, 100, true, "", 1)
	menu.visuals.animations.legs_offset_2 = groups.angles:slider("\nanimations_legs_offset_2", 0, 100, 100, true, "", 1)
	menu.visuals.animations.legs_jitter_time = groups.angles:slider("\nanimations_legs_jitter_time", 1, 8, 2, true, "t", 1)
	menu.visuals.animations.legs_jitter_time_spacer = groups.angles:label("\nanimations_legs_jitter_time_spacer")
	menu.visuals.animations.options = groups.angles:multiselect("\nanimations_options", {"Lean", "Smooth"})
	menu.visuals.animations.move_lean = groups.angles:slider("\nanimations_move_lean", -1, 100, -1, true, "%", 1, {["-1"] = "Off"})
	menu.visuals.fast_ladder = groups.other:checkbox("\aB6FF0FFF◆ \rFast Ladder")
	menu.visuals.fps_optimization = groups.other:checkbox("\aB6FF0FFF◆ \rFPS Optimization")
	menu.visuals.fps_optimization_options = groups.other:multiselect("\nfps_optimization_options", {"3D Sky", "Fog", "Shadows", "Blood", "Decals", "Bloom", "Other"})
	menu.visuals.widgets.aspect_ratio = groups.other:checkbox("\aB6FF0FFF◆ \rAspect Ratio")
	menu.visuals.widgets.aspect_ratio_value = groups.other:slider("\naspect_ratio_value", 49, 200, 49, true, "", 0.01, {[49] = "Off", [125] = "5:4", [133] = "4:3", [150] = "3:2", [160] = "16:10", [180] = "16:9", [200] = "21:9"})
	menu.visuals.widgets.thirdperson = groups.other:checkbox("\aB6FF0FFF◆ \rThirdperson")
	menu.visuals.widgets.thirdperson_distance = groups.other:slider("\nthirdperson_distance", 10, 200, 100, true, "ft", 1)
	menu.visuals.widgets.viewmodel = groups.other:checkbox("\aB6FF0FFF◆ \rViewmodel")
	menu.visuals.widgets.viewmodel_fov = groups.other:slider("\aB6FF0FFF● \rFov", 0, 1000, 680, true, "°", 0.1)
	menu.visuals.widgets.viewmodel_offset_x = groups.other:slider("\aB6FF0FFF● \rX", -100, 100, 0, true, "", 0.1)
	menu.visuals.widgets.viewmodel_offset_y = groups.other:slider("\aB6FF0FFF● \rY", -100, 100, 0, true, "", 0.1)
	menu.visuals.widgets.viewmodel_offset_z = groups.other:slider("\aB6FF0FFF● \rZ", -100, 100, 0, true, "", 0.1)
	menu.visuals.widgets.viewmodel_options = groups.other:multiselect("\nviewmodel_options", {"CSS Animation", "CS2 Viewmodel Scope", "Opposite Knife"})

	-- Original nine-state anti-aim builder and defensive editor
	local states = {"Stand", "Move", "Slow-motion", "Air", "Air-crouch", "Crouch", "Crouch-move", "Manual", "Freestanding"}
	for _, state in ipairs(states) do
		menu.builder[state] = {
			body_yaw = {}, spacers = {},
			yaw = {hidden = {}},
			yaw_modifiers = {custom = {slots = {}}, hidden = {custom = {slots = {}}}},
			delay = {double = {}, custom = {slots = {}}, hidden = {double = {}, custom = {slots = {}}}},
		}
		menu.defensive[state] = {}
		menu.builder[state].spacers.yaw = groups.angles:label("\nspacer_yaw_" .. state)
		menu.builder[state].yaw.builder_type = groups.angles:combobox("\aB6FF0FFF◆ \rYaw \nyaw_builder_type_" .. state, {"Default", "Hidden"})
		menu.builder[state].yaw.type = groups.angles:combobox("\nyaw_type_" .. state, {"Solo", "Double"})
		menu.builder[state].yaw.global = groups.angles:slider("\nyaw_global_" .. state, -180, 180, 0, true, "°", 1)
		menu.builder[state].yaw.left = groups.angles:slider("\nyaw_left_" .. state, -180, 180, 0, true, "°", 1)
		menu.builder[state].yaw.left_randomize = groups.angles:slider("\nyaw_left_randomize_" .. state, 0, 100, 0, true, "%", 1)
		menu.builder[state].yaw.right = groups.angles:slider("\nyaw_right_" .. state, -180, 180, 0, true, "°", 1)
		menu.builder[state].yaw.right_randomize = groups.angles:slider("\nyaw_right_randomize_" .. state, 0, 100, 0, true, "%", 1)
		menu.builder[state].yaw.hidden.type = groups.angles:combobox("\nhidden_yaw_mode_" .. state, {"Static", "Side", "Side Reworked"})
		menu.builder[state].yaw.hidden.static = groups.angles:slider("\nhidden_yaw_static_" .. state, -180, 180, 0, true, "°", 1)
		menu.builder[state].yaw.hidden.left = groups.angles:slider("\nhidden_yaw_left_" .. state, -180, 180, 0, true, "°", 1)
		menu.builder[state].yaw.hidden.right = groups.angles:slider("\nhidden_yaw_right_" .. state, -180, 180, 0, true, "°", 1)
		menu.builder[state].spacers.modifiers = groups.angles:label("\nspacer_modifiers_" .. state)
		menu.builder[state].yaw_modifiers.builder_type = groups.angles:combobox("\aB6FF0FFF◆ \rModifiers \nyaw_modifier_builder_type_" .. state, {"Default", "Hidden"})
		menu.builder[state].yaw_modifiers.type = groups.angles:combobox("\nyaw_modifier_type_" .. state, {"Off", "Center", "Random", "Spin", "Skitter"})
		menu.builder[state].yaw_modifiers.global = groups.angles:slider("\nyaw_modifier_skitter_" .. state, -180, 180, 0, true, "°", 1)
		menu.builder[state].yaw_modifiers.values = groups.angles:combobox("\nyaw_modifier_values_" .. state, {"Solo", "Double", "Custom"})
		menu.builder[state].yaw_modifiers.switch = menu.builder[state].yaw_modifiers.values
		menu.builder[state].yaw_modifiers.offset = groups.angles:slider("\nyaw_modifier_solo_value_" .. state, -180, 180, 0, true, "°", 1)
		menu.builder[state].yaw_modifiers.left = groups.angles:slider("\nyaw_modifier_left_" .. state, -180, 180, 0, true, "°", 1)
		menu.builder[state].yaw_modifiers.right = groups.angles:slider("\nyaw_modifier_right_" .. state, -180, 180, 0, true, "°", 1)
		menu.builder[state].yaw_modifiers.custom.count = groups.angles:slider("\nyaw_modifier_custom_sliders_" .. state, 2, 10, 3, true, "", 1)
		menu.builder[state].yaw_modifiers.randomize = groups.angles:slider("\nyaw_modifier_randomize_" .. state, 0, 100, 0, true, "%", 1)
		menu.builder[state].yaw_modifiers.hidden.type = groups.angles:combobox("\nhidden_yaw_modifier_type_" .. state, {"Center", "Random", "Spin", "Skitter", "Meta"})
		menu.builder[state].yaw_modifiers.hidden.global = groups.angles:slider("\nhidden_yaw_modifier_skitter_" .. state, -180, 180, 0, true, "°", 1)
		menu.builder[state].yaw_modifiers.hidden.values = groups.angles:combobox("\nhidden_yaw_modifier_values_" .. state, {"Solo", "Double", "Custom"})
		menu.builder[state].yaw_modifiers.hidden.offset = groups.angles:slider("\nhidden_yaw_modifier_solo_value_" .. state, -180, 180, 0, true, "°", 1)
		menu.builder[state].yaw_modifiers.hidden.left = groups.angles:slider("\nhidden_yaw_modifier_left_" .. state, -180, 180, 0, true, "°", 1)
		menu.builder[state].yaw_modifiers.hidden.right = groups.angles:slider("\nhidden_yaw_modifier_right_" .. state, -180, 180, 0, true, "°", 1)
		menu.builder[state].yaw_modifiers.hidden.custom.count = groups.angles:slider("\nhidden_yaw_modifier_custom_sliders_" .. state, 2, 10, 3, true, "", 1)
		menu.builder[state].yaw_modifiers.hidden.meta_mode = groups.angles:combobox("\nhidden_yaw_modifier_meta_mode_" .. state, {"2-Way", "3-Way", "5-Way"})
		menu.builder[state].yaw_modifiers.hidden.meta_offset = groups.angles:slider("\nhidden_yaw_modifier_meta_offset_" .. state, -180, 180, 0, true, "°", 1)
		menu.builder[state].yaw_modifiers.hidden.meta_delay_cycle = groups.angles:slider("\aB6FF0FFF● \rCycle \nhidden_yaw_modifier_meta_delay_cycle_" .. state, 0, 200, 12, true, "t", 1, {[0] = "Off"})
		menu.builder[state].yaw_modifiers.hidden.meta_delay_time = groups.angles:slider("\aB6FF0FFF● \rTime \nhidden_yaw_modifier_meta_delay_time_" .. state, 5, 30, 15, true, "t", 1)
		menu.builder[state].yaw_modifiers.hidden.meta_safe_yaw = groups.angles:checkbox("\aB6FF0FFF● \rSafe Yaw \nhidden_yaw_modifier_meta_safe_yaw_" .. state)
		menu.builder[state].yaw_modifiers.hidden.randomize = groups.angles:slider("\nhidden_yaw_modifier_randomize_" .. state, 0, 100, 0, true, "%", 1)
		menu.builder[state].spacers.body_yaw = groups.angles:label("\nspacer_body_yaw_" .. state)
		menu.builder[state].body_yaw.type = groups.angles:combobox("\aB6FF0FFF◆ \rBody Yaw \nbody_yaw_type_" .. state, {"Off", "Static", "Opposite", "Jitter"})
		menu.builder[state].body_yaw.value = groups.angles:slider("\nbody_yaw_value_" .. state, -180, 180, 0, true, "°", 1)
		menu.builder[state].delay.builder_type = groups.angles:combobox("\ndelay_builder_type_" .. state, {"Default", "Hidden"})
		menu.builder[state].delay.type = groups.angles:combobox("\ndelay_mode_" .. state, {"Off", "Default", "Smart", "Fluctuate", "Random", "Timing"})
		menu.builder[state].delay.values = groups.angles:combobox("\ndelay_values_" .. state, {"Solo", "Double", "Custom"})
		menu.builder[state].delay.solo = groups.angles:slider("\ndelay_solo_" .. state, 1, 16, 1, true, "", 1, {"Jitter", "2 t", "3 t", "4 t", "5 t", "6 t", "7 t", "8 t", "9 t", "10 t", "11 t", "12 t", "13 t", "14 t", "15 t", "16 t"})
		menu.builder[state].delay.double.left = groups.angles:slider("\ndelay_double_left_" .. state, 1, 16, 1, true, "", 1, {"Jitter", "2 t", "3 t", "4 t", "5 t", "6 t", "7 t", "8 t", "9 t", "10 t", "11 t", "12 t", "13 t", "14 t", "15 t", "16 t"})
		menu.builder[state].delay.double.right = groups.angles:slider("\ndelay_double_right_" .. state, 1, 16, 1, true, "", 1, {"Jitter", "2 t", "3 t", "4 t", "5 t", "6 t", "7 t", "8 t", "9 t", "10 t", "11 t", "12 t", "13 t", "14 t", "15 t", "16 t"})
		menu.builder[state].delay.double.randomize = groups.angles:slider("\ndelay_double_randomize_" .. state, 0, 100, 0, true, "%", 1)
		menu.builder[state].delay.custom.count = groups.angles:slider("\ndelay_custom_sliders_" .. state, 2, 10, 3, true, "", 1)
		menu.builder[state].delay.custom.randomize = groups.angles:slider("\aB6FF0FFF● \rRandomize \ndelay_custom_randomize_" .. state, 0, 100, 0, true, "%", 1)
		menu.builder[state].delay.hidden.type = groups.angles:combobox("\nhidden_delay_mode_" .. state, {"Off", "Default", "Smart", "Fluctuate", "Random", "Timing"})
		menu.builder[state].delay.hidden.values = groups.angles:combobox("\nhidden_delay_values_" .. state, {"Solo", "Double", "Custom"})
		menu.builder[state].delay.hidden.solo = groups.angles:slider("\nhidden_delay_solo_" .. state, 1, 16, 1, true, "", 1, {"Jitter", "2 t", "3 t", "4 t", "5 t", "6 t", "7 t", "8 t", "9 t", "10 t", "11 t", "12 t", "13 t", "14 t", "15 t", "16 t"})
		menu.builder[state].delay.hidden.double.left = groups.angles:slider("\nhidden_delay_double_left_" .. state, 1, 16, 1, true, "", 1, {"Jitter", "2 t", "3 t", "4 t", "5 t", "6 t", "7 t", "8 t", "9 t", "10 t", "11 t", "12 t", "13 t", "14 t", "15 t", "16 t"})
		menu.builder[state].delay.hidden.double.right = groups.angles:slider("\nhidden_delay_double_right_" .. state, 1, 16, 1, true, "", 1, {"Jitter", "2 t", "3 t", "4 t", "5 t", "6 t", "7 t", "8 t", "9 t", "10 t", "11 t", "12 t", "13 t", "14 t", "15 t", "16 t"})
		menu.builder[state].delay.hidden.double.randomize = groups.angles:slider("\nhidden_delay_double_randomize_" .. state, 0, 100, 0, true, "%", 1)
		menu.builder[state].delay.hidden.custom.count = groups.angles:slider("\nhidden_delay_custom_sliders_" .. state, 2, 10, 3, true, "", 1)
		menu.builder[state].delay.hidden.custom.randomize = groups.angles:slider("\aB6FF0FFF● \rRandomize \nhidden_delay_custom_randomize_" .. state, 0, 100, 0, true, "%", 1)
		menu.builder[state].spacers.force_defensive = groups.angles:label("\nspacer_force_defensive_" .. state)
		menu.builder[state].force_defensive = groups.angles:multiselect("\aB6FF0FFF◆ \r Force Defensive\nforce_defensive_" .. state, {"Double tap", "On shot anti-aim"})
		menu.builder[state].invalid_tick_cleaner = groups.angles:combobox("\ninvalid_tick_cleaner_" .. state, {"Skeet", "Remove Backtrack"})
		menu.defensive[state].toggle_builder = groups.angles:checkbox("\nToggle Builder \nD_" .. state)
		menu.defensive[state].duration = groups.angles:slider("\ndefensive_duration" .. state, 1, 15, 15, true, "t", 1, {[15] = "Maximum"})
		menu.defensive[state].def_pitch = groups.fake_lag:combobox("\011Pitch\ndefensive_pitch_mode" .. state, {"Disabled", "Custom", "Double", "Spin", "Sway", "Fluctuate", "Refraction", "Up Switch"})
		menu.defensive[state].def_pitch_static_value = groups.fake_lag:slider("\nPitch value\ndefensive_pitch_static_value" .. state, -89, 89, 0, true, "°")
		menu.defensive[state].def_pitch_left_value = groups.fake_lag:slider("\nPitch left\ndefensive_pitch_left_value" .. state, -89, 89, 0, true, "°")
		menu.defensive[state].def_pitch_right_value = groups.fake_lag:slider("\nPitch right\ndefensive_pitch_right_value" .. state, -89, 89, 0, true, "°")
		menu.defensive[state].def_pitch_left_delay_value = groups.fake_lag:slider("\nPitch left delay\ndefensive_pitch_left_delay_value" .. state, -89, 89, 0, true, "°")
		menu.defensive[state].def_pitch_right_delay_value = groups.fake_lag:slider("\nPitch right delay\ndefensive_pitch_right_delay_value" .. state, -89, 89, 0, true, "°")
		menu.defensive[state].def_pitch_delay = groups.fake_lag:slider("\nPitch double delay\ndefensive_pitch_delay" .. state, 1, 16, 1, true, "t")
		menu.defensive[state].def_pitch_spin_left_value = groups.fake_lag:slider("\nPitch spin left\ndefensive_pitch_spin_left_value" .. state, -89, 89, -89, true, "°")
		menu.defensive[state].def_pitch_spin_right_value = groups.fake_lag:slider("\nPitch spin right\ndefensive_pitch_spin_right_value" .. state, -89, 89, 89, true, "°")
		menu.defensive[state].def_pitch_spin_speed = groups.fake_lag:slider("\nPitch spin speed\ndefensive_pitch_spin_speed" .. state, 1, 15, 6, true, "t")
		menu.defensive[state].def_pitch_sway_left_value = groups.fake_lag:slider("\nPitch sway left\ndefensive_pitch_sway_left_value" .. state, -89, 89, -89, true, "°")
		menu.defensive[state].def_pitch_sway_right_value = groups.fake_lag:slider("\nPitch sway right\ndefensive_pitch_sway_right_value" .. state, -89, 89, 89, true, "°")
		menu.defensive[state].def_pitch_sway_speed = groups.fake_lag:slider("\nPitch sway speed\ndefensive_pitch_sway_speed" .. state, 1, 15, 6, true, "t")
		menu.defensive[state].def_pitch_fluctuate_value1 = groups.fake_lag:slider("\nFluctuate value 1\ndefensive_pitch_fluctuate_value1" .. state, -89, 89, 0, true, "°", 1, {[0] = "Off"})
		menu.defensive[state].def_pitch_fluctuate_value2 = groups.fake_lag:slider("\nFluctuate value 2\ndefensive_pitch_fluctuate_value2" .. state, -89, 89, 0, true, "°", 1, {[0] = "Off"})
		menu.defensive[state].def_pitch_fluctuate_speed = groups.fake_lag:slider("\nPer tick\ndefensive_pitch_fluctuate_speed" .. state, 0, 14, 0, true, "t", 1, {[0] = "Off"})
		menu.defensive[state].def_pitch_fluctuate_mode = groups.fake_lag:combobox("\nFluctuate mode\ndefensive_pitch_fluctuate_mode" .. state, {"Sinus", "Lerp"})
		menu.defensive[state].def_pitch_refraction_up = groups.fake_lag:slider("\nDEFENSIVE_PITCHUPREFRACTION" .. state, -89, 89, 0, true, "°")
		menu.defensive[state].def_pitch_refraction_down = groups.fake_lag:slider("\nDEFENSIVE_PITCHDOWNREFRACTION" .. state, -89, 89, 0, true, "°")
		menu.defensive[state].def_pitch_refraction_spin = groups.fake_lag:slider("\nDEFENSIVE_SPINREFRACTION" .. state, -89, 89, 0, true, "°")
		menu.defensive[state].def_pitch_refraction_timer = groups.fake_lag:slider("\nDEFENSIVE_PITCHTIMER" .. state, 1, 20, 0, true, "sec", 0.1)
		menu.defensive[state].def_pitch_separator = groups.angles:label("\n")
		menu.defensive[state].def_yaw = groups.other:combobox("\011Yaw\ndefensive_yaw_mode" .. state, {"Disabled", "Custom", "Double", "Spin", "Sway", "Zurab", "Distortion", "Refraction", "Delayed"})
		menu.defensive[state].def_yaw_static_value = groups.other:slider("\nYaw value\ndefensive_yaw_static_value" .. state, -180, 180, 0, true, "°")
		menu.defensive[state].def_yaw_left_value = groups.other:slider("\nYaw left\ndefensive_yaw_left_value" .. state, -180, 180, 0, true, "°")
		menu.defensive[state].def_yaw_right_value = groups.other:slider("\nYaw right\ndefensive_yaw_right_value" .. state, -180, 180, 0, true, "°")
		menu.defensive[state].def_yaw_delay = groups.other:slider("\nYaw double delay\ndefensive_yaw_delay" .. state, 1, 16, 1, true, "", 1, {"Jitter", "2 t", "3 t", "4 t", "5 t", "6 t", "7 t", "8 t", "9 t", "10 t", "11 t", "12 t", "13 t", "14 t", "15 t", "16 t"})
		menu.defensive[state].def_yaw_spin_speed = groups.other:slider("\nYaw speed\ndefensive_yaw_spin_speed" .. state, 1, 15, 6, true, "t")
		menu.defensive[state].def_yaw_spin_left_value = groups.other:slider("\nYaw spin left\ndefensive_yaw_spin_left_value" .. state, -180, 180, -180, true, "°")
		menu.defensive[state].def_yaw_spin_right_value = groups.other:slider("\nYaw spin right\ndefensive_yaw_spin_right_value" .. state, -180, 180, 180, true, "°")
		menu.defensive[state].def_yaw_sway_speed = groups.other:slider("\nYaw sway speed\ndefensive_yaw_sway_speed" .. state, 1, 15, 6, true, "t")
		menu.defensive[state].def_yaw_sway_left_value = groups.other:slider("\nYaw sway left\ndefensive_yaw_sway_left_value" .. state, -180, 180, -180, true, "°")
		menu.defensive[state].def_yaw_sway_right_value = groups.other:slider("\nYaw sway right\ndefensive_yaw_sway_right_value" .. state, -180, 180, 180, true, "°")
		menu.defensive[state].def_yaw_zurab_range = groups.other:slider("\nYaw zurab range\ndefensive_yaw_zurab_range" .. state, 0, 180, 60, true, "°")
		menu.defensive[state].def_yaw_zurab_speed = groups.other:slider("\nYaw zurab speed\ndefensive_yaw_zurab_speed" .. state, 1, 20, 8, true, "t")
		menu.defensive[state].def_yaw_distortion = groups.other:slider("\nDistortion yaw\ndefensive_yaw_distortion" .. state, -180, 180, 0, true, "°", 1, {[0] = "Off"})
		menu.defensive[state].def_yaw_distortion_randomize = groups.other:slider("\nDistortion randomize\ndefensive_yaw_distortion_randomize" .. state, 0, 100, 0, true, "%", 1, {[0] = "Off"})
		menu.defensive[state].def_yaw_distortion_plus = groups.other:slider("\nDistortion +\ndefensive_yaw_distortion_plus" .. state, 0, 90, 0, true, "+°", 1, {[0] = "Off"})
		menu.defensive[state].def_yaw_distortion_minus = groups.other:slider("\nDistortion -\ndefensive_yaw_distortion_minus" .. state, -90, 0, 0, true, "-°", 1, {[0] = "Off"})
		menu.defensive[state].def_yaw_refraction_left = groups.other:slider("\nDEFENSIVE_LEFTREFRACTION" .. state, -180, 180, 0, true, "°")
		menu.defensive[state].def_yaw_refraction_right = groups.other:slider("\nDEFENSIVE_RIGHTREFRACTION" .. state, -180, 180, 0, true, "°")
		menu.defensive[state].def_yaw_refraction_spin = groups.other:slider("\nDEFENSIVE_SPINREFRACTION" .. state, -180, 180, 0, true, "°")
		menu.defensive[state].def_yaw_refraction_timer = groups.other:slider("\nDEFENSIVE_YAWTIMER" .. state, 1, 20, 0, true, "sec", 0.1)
		menu.defensive[state].def_yaw_delayed_left = groups.other:slider("\nYaw delayed left\ndefensive_yaw_delayed_left" .. state, -180, 180, 0, true, "°", 1)
		menu.defensive[state].def_yaw_delayed_right = groups.other:slider("\nYaw delayed right\ndefensive_yaw_delayed_right" .. state, -180, 180, 0, true, "°", 1)
		menu.defensive[state].def_yaw_delayed_delay = groups.other:slider("\nYaw delayed delay\ndefensive_yaw_delayed_delay" .. state, 1, 8, 6, true, "t", 1)
		menu.defensive[state].def_yaw_delayed_randomize = groups.other:slider("\nYaw delayed randomize\ndefensive_yaw_delayed_randomize" .. state, 0, 180, 0, true, "°", 1, {[0] = "Off"})
		for slot = 1, 10 do
			menu.builder[state].yaw_modifiers.custom.slots[slot] = groups.angles:slider("\aB6FF0FFF● \r[" .. slot .. "] \nyaw_modifier_custom_" .. slot .. "_" .. state, -180, 180, 0, true, "°", 1)
			menu.builder[state].yaw_modifiers.hidden.custom.slots[slot] = groups.angles:slider("\aB6FF0FFF● \r[" .. slot .. "] \nhidden_yaw_modifier_custom_" .. slot .. "_" .. state, -180, 180, 0, true, "°", 1)
			menu.builder[state].delay.custom.slots[slot] = groups.angles:slider("\aB6FF0FFF● \r[" .. slot .. "] \ndelay_custom_" .. slot .. "_" .. state, 1, 16, 1, true, "", 1, {"Jitter", "2 t", "3 t", "4 t", "5 t", "6 t", "7 t", "8 t", "9 t", "10 t", "11 t", "12 t", "13 t", "14 t", "15 t", "16 t"})
			menu.builder[state].delay.hidden.custom.slots[slot] = groups.angles:slider("\aB6FF0FFF● \r[" .. slot .. "] \nhidden_delay_custom_" .. slot .. "_" .. state, 1, 16, 1, true, "", 1, {"Jitter", "2 t", "3 t", "4 t", "5 t", "6 t", "7 t", "8 t", "9 t", "10 t", "11 t", "12 t", "13 t", "14 t", "15 t", "16 t"})
		end
		-- State-specific visibility dependencies
		menu.builder[state].spacers.yaw:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Builder"}, {menu.antiaim.conditions, state})
		menu.builder[state].yaw.builder_type:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Builder"}, {menu.antiaim.conditions, state})
		menu.builder[state].yaw.type:depend({menu.builder[state].yaw.builder_type, "Default"}, {menu.switch, "Anti-Aim"}, {menu.switch_type, "Builder"}, {menu.antiaim.conditions, state})
		menu.builder[state].yaw.global:depend({menu.builder[state].yaw.builder_type, "Default"}, {menu.builder[state].yaw.type, "Solo"}, {menu.switch, "Anti-Aim"}, {menu.switch_type, "Builder"}, {menu.antiaim.conditions, state})
		menu.builder[state].yaw.left:depend({menu.builder[state].yaw.builder_type, "Default"}, {menu.builder[state].yaw.type, "Double"}, {menu.switch, "Anti-Aim"}, {menu.switch_type, "Builder"}, {menu.antiaim.conditions, state})
		menu.builder[state].yaw.left_randomize:depend({menu.builder[state].yaw.builder_type, "Default"}, {menu.builder[state].yaw.type, "Double"}, {menu.switch, "Anti-Aim"}, {menu.switch_type, "Builder"}, {menu.antiaim.conditions, state})
		menu.builder[state].yaw.right:depend({menu.builder[state].yaw.builder_type, "Default"}, {menu.builder[state].yaw.type, "Double"}, {menu.switch, "Anti-Aim"}, {menu.switch_type, "Builder"}, {menu.antiaim.conditions, state})
		menu.builder[state].yaw.right_randomize:depend({menu.builder[state].yaw.builder_type, "Default"}, {menu.builder[state].yaw.type, "Double"}, {menu.switch, "Anti-Aim"}, {menu.switch_type, "Builder"}, {menu.antiaim.conditions, state})
		menu.builder[state].yaw.hidden.type:depend({menu.builder[state].yaw.builder_type, "Hidden"}, {menu.switch, "Anti-Aim"}, {menu.switch_type, "Builder"}, {menu.antiaim.conditions, state})
		menu.builder[state].yaw.hidden.static:depend({menu.builder[state].yaw.builder_type, "Hidden"}, {menu.builder[state].yaw.hidden.type, "Static"}, {menu.switch, "Anti-Aim"}, {menu.switch_type, "Builder"}, {menu.antiaim.conditions, state})
		menu.builder[state].yaw.hidden.left:depend({menu.builder[state].yaw.builder_type, "Hidden"}, {menu.builder[state].yaw.hidden.type, "Side", "Side Reworked"}, {menu.switch, "Anti-Aim"}, {menu.switch_type, "Builder"}, {menu.antiaim.conditions, state})
		menu.builder[state].yaw.hidden.right:depend({menu.builder[state].yaw.builder_type, "Hidden"}, {menu.builder[state].yaw.hidden.type, "Side", "Side Reworked"}, {menu.switch, "Anti-Aim"}, {menu.switch_type, "Builder"}, {menu.antiaim.conditions, state})
		menu.builder[state].spacers.modifiers:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Builder"}, {menu.antiaim.conditions, state})
		menu.builder[state].yaw_modifiers.builder_type:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Builder"}, {menu.antiaim.conditions, state})
		menu.builder[state].yaw_modifiers.type:depend({menu.builder[state].yaw_modifiers.builder_type, "Default"}, {menu.switch, "Anti-Aim"}, {menu.switch_type, "Builder"}, {menu.antiaim.conditions, state})
		menu.builder[state].yaw_modifiers.global:depend({menu.builder[state].yaw_modifiers.builder_type, "Default"}, {menu.builder[state].yaw_modifiers.type, "Skitter"}, {menu.switch, "Anti-Aim"}, {menu.switch_type, "Builder"}, {menu.antiaim.conditions, state})
		menu.builder[state].yaw_modifiers.values:depend({menu.builder[state].yaw_modifiers.builder_type, "Default"}, {menu.builder[state].yaw_modifiers.type, "Center", "Random", "Spin"}, {menu.switch, "Anti-Aim"}, {menu.switch_type, "Builder"}, {menu.antiaim.conditions, state})
		menu.builder[state].yaw_modifiers.offset:depend({menu.builder[state].yaw_modifiers.builder_type, "Default"}, {menu.builder[state].yaw_modifiers.type, "Center", "Random", "Spin"}, {menu.builder[state].yaw_modifiers.values, "Solo"}, {menu.switch, "Anti-Aim"}, {menu.switch_type, "Builder"}, {menu.antiaim.conditions, state})
		menu.builder[state].yaw_modifiers.left:depend({menu.builder[state].yaw_modifiers.builder_type, "Default"}, {menu.builder[state].yaw_modifiers.type, "Center", "Random", "Spin"}, {menu.builder[state].yaw_modifiers.values, "Double"}, {menu.switch, "Anti-Aim"}, {menu.switch_type, "Builder"}, {menu.antiaim.conditions, state})
		menu.builder[state].yaw_modifiers.right:depend({menu.builder[state].yaw_modifiers.builder_type, "Default"}, {menu.builder[state].yaw_modifiers.type, "Center", "Random", "Spin"}, {menu.builder[state].yaw_modifiers.values, "Double"}, {menu.switch, "Anti-Aim"}, {menu.switch_type, "Builder"}, {menu.antiaim.conditions, state})
		menu.builder[state].yaw_modifiers.custom.count:depend({menu.builder[state].yaw_modifiers.builder_type, "Default"}, {menu.builder[state].yaw_modifiers.type, "Center", "Random", "Spin"}, {menu.builder[state].yaw_modifiers.values, "Custom"}, {menu.switch, "Anti-Aim"}, {menu.switch_type, "Builder"}, {menu.antiaim.conditions, state})
		menu.builder[state].yaw_modifiers.randomize:depend({menu.builder[state].yaw_modifiers.builder_type, "Default"}, {menu.builder[state].yaw_modifiers.type, "Center", "Random", "Spin"}, {menu.switch, "Anti-Aim"}, {menu.switch_type, "Builder"}, {menu.antiaim.conditions, state})
		menu.builder[state].yaw_modifiers.hidden.type:depend({menu.builder[state].yaw_modifiers.builder_type, "Hidden"}, {menu.switch, "Anti-Aim"}, {menu.switch_type, "Builder"}, {menu.antiaim.conditions, state})
		menu.builder[state].yaw_modifiers.hidden.global:depend({menu.builder[state].yaw_modifiers.builder_type, "Hidden"}, {menu.builder[state].yaw_modifiers.hidden.type, "Skitter"}, {menu.switch, "Anti-Aim"}, {menu.switch_type, "Builder"}, {menu.antiaim.conditions, state})
		menu.builder[state].yaw_modifiers.hidden.values:depend({menu.builder[state].yaw_modifiers.builder_type, "Hidden"}, {menu.builder[state].yaw_modifiers.hidden.type, "Center", "Random", "Spin"}, {menu.switch, "Anti-Aim"}, {menu.switch_type, "Builder"}, {menu.antiaim.conditions, state})
		menu.builder[state].yaw_modifiers.hidden.offset:depend({menu.builder[state].yaw_modifiers.builder_type, "Hidden"}, {menu.builder[state].yaw_modifiers.hidden.type, "Center", "Random", "Spin"}, {menu.builder[state].yaw_modifiers.hidden.values, "Solo"}, {menu.switch, "Anti-Aim"}, {menu.switch_type, "Builder"}, {menu.antiaim.conditions, state})
		menu.builder[state].yaw_modifiers.hidden.left:depend({menu.builder[state].yaw_modifiers.builder_type, "Hidden"}, {menu.builder[state].yaw_modifiers.hidden.type, "Center", "Random", "Spin"}, {menu.builder[state].yaw_modifiers.hidden.values, "Double"}, {menu.switch, "Anti-Aim"}, {menu.switch_type, "Builder"}, {menu.antiaim.conditions, state})
		menu.builder[state].yaw_modifiers.hidden.right:depend({menu.builder[state].yaw_modifiers.builder_type, "Hidden"}, {menu.builder[state].yaw_modifiers.hidden.type, "Center", "Random", "Spin"}, {menu.builder[state].yaw_modifiers.hidden.values, "Double"}, {menu.switch, "Anti-Aim"}, {menu.switch_type, "Builder"}, {menu.antiaim.conditions, state})
		menu.builder[state].yaw_modifiers.hidden.custom.count:depend({menu.builder[state].yaw_modifiers.builder_type, "Hidden"}, {menu.builder[state].yaw_modifiers.hidden.type, "Center", "Random", "Spin"}, {menu.builder[state].yaw_modifiers.hidden.values, "Custom"}, {menu.switch, "Anti-Aim"}, {menu.switch_type, "Builder"}, {menu.antiaim.conditions, state})
		menu.builder[state].yaw_modifiers.hidden.meta_mode:depend({menu.builder[state].yaw_modifiers.builder_type, "Hidden"}, {menu.builder[state].yaw_modifiers.hidden.type, "Meta"}, {menu.switch, "Anti-Aim"}, {menu.switch_type, "Builder"}, {menu.antiaim.conditions, state})
		menu.builder[state].yaw_modifiers.hidden.meta_offset:depend({menu.builder[state].yaw_modifiers.builder_type, "Hidden"}, {menu.builder[state].yaw_modifiers.hidden.type, "Meta"}, {menu.switch, "Anti-Aim"}, {menu.switch_type, "Builder"}, {menu.antiaim.conditions, state})
		menu.builder[state].yaw_modifiers.hidden.meta_delay_cycle:depend({menu.builder[state].yaw_modifiers.builder_type, "Hidden"}, {menu.builder[state].yaw_modifiers.hidden.type, "Meta"}, {menu.switch, "Anti-Aim"}, {menu.switch_type, "Builder"}, {menu.antiaim.conditions, state})
		menu.builder[state].yaw_modifiers.hidden.meta_delay_time:depend({menu.builder[state].yaw_modifiers.builder_type, "Hidden"}, {menu.builder[state].yaw_modifiers.hidden.type, "Meta"}, {menu.switch, "Anti-Aim"}, {menu.switch_type, "Builder"}, {menu.antiaim.conditions, state})
		menu.builder[state].yaw_modifiers.hidden.meta_safe_yaw:depend({menu.builder[state].yaw_modifiers.builder_type, "Hidden"}, {menu.builder[state].yaw_modifiers.hidden.type, "Meta"}, {menu.switch, "Anti-Aim"}, {menu.switch_type, "Builder"}, {menu.antiaim.conditions, state})
		menu.builder[state].yaw_modifiers.hidden.randomize:depend({menu.builder[state].yaw_modifiers.builder_type, "Hidden"}, {menu.builder[state].yaw_modifiers.hidden.type, "Center", "Random", "Spin"}, {menu.switch, "Anti-Aim"}, {menu.switch_type, "Builder"}, {menu.antiaim.conditions, state})
		menu.builder[state].spacers.body_yaw:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Builder"}, {menu.antiaim.conditions, state})
		menu.builder[state].body_yaw.type:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Builder"}, {menu.antiaim.conditions, state})
		menu.builder[state].body_yaw.value:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Builder"}, {menu.antiaim.conditions, state}, {menu.builder[state].body_yaw.type, "Static"})
		menu.builder[state].delay.builder_type:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Builder"}, {menu.antiaim.conditions, state}, {menu.builder[state].body_yaw.type, "Off", "Jitter"})
		menu.builder[state].delay.type:depend({menu.builder[state].delay.builder_type, "Default"}, {menu.switch, "Anti-Aim"}, {menu.switch_type, "Builder"}, {menu.antiaim.conditions, state}, {menu.builder[state].body_yaw.type, "Off", "Jitter"})
		menu.builder[state].delay.values:depend({menu.builder[state].delay.builder_type, "Default"}, {menu.builder[state].delay.type, "Default", "Smart", "Fluctuate", "Random", "Timing"}, {menu.switch, "Anti-Aim"}, {menu.switch_type, "Builder"}, {menu.antiaim.conditions, state}, {menu.builder[state].body_yaw.type, "Off", "Jitter"})
		menu.builder[state].delay.solo:depend({menu.builder[state].delay.builder_type, "Default"}, {menu.builder[state].delay.type, "Default", "Smart", "Fluctuate", "Random", "Timing"}, {menu.builder[state].delay.values, "Solo"}, {menu.switch, "Anti-Aim"}, {menu.switch_type, "Builder"}, {menu.antiaim.conditions, state}, {menu.builder[state].body_yaw.type, "Off", "Jitter"})
		menu.builder[state].delay.double.left:depend({menu.builder[state].delay.builder_type, "Default"}, {menu.builder[state].delay.type, "Default", "Smart", "Fluctuate", "Random", "Timing"}, {menu.builder[state].delay.values, "Double"}, {menu.switch, "Anti-Aim"}, {menu.switch_type, "Builder"}, {menu.antiaim.conditions, state}, {menu.builder[state].body_yaw.type, "Off", "Jitter"})
		menu.builder[state].delay.double.right:depend({menu.builder[state].delay.builder_type, "Default"}, {menu.builder[state].delay.type, "Default", "Smart", "Fluctuate", "Random", "Timing"}, {menu.builder[state].delay.values, "Double"}, {menu.switch, "Anti-Aim"}, {menu.switch_type, "Builder"}, {menu.antiaim.conditions, state}, {menu.builder[state].body_yaw.type, "Off", "Jitter"})
		menu.builder[state].delay.double.randomize:depend({menu.builder[state].delay.builder_type, "Default"}, {menu.builder[state].delay.type, "Default", "Smart", "Fluctuate", "Random"}, {menu.builder[state].delay.values, "Double"}, {menu.switch, "Anti-Aim"}, {menu.switch_type, "Builder"}, {menu.antiaim.conditions, state}, {menu.builder[state].body_yaw.type, "Off", "Jitter"})
		menu.builder[state].delay.custom.count:depend({menu.builder[state].delay.builder_type, "Default"}, {menu.builder[state].delay.type, "Default", "Smart", "Fluctuate", "Random", "Timing"}, {menu.builder[state].delay.values, "Custom"}, {menu.switch, "Anti-Aim"}, {menu.switch_type, "Builder"}, {menu.antiaim.conditions, state}, {menu.builder[state].body_yaw.type, "Off", "Jitter"})
		menu.builder[state].delay.custom.randomize:depend({menu.builder[state].delay.builder_type, "Default"}, {menu.builder[state].delay.type, "Default", "Smart", "Fluctuate", "Random"}, {menu.builder[state].delay.values, "Custom"}, {menu.switch, "Anti-Aim"}, {menu.switch_type, "Builder"}, {menu.antiaim.conditions, state}, {menu.builder[state].body_yaw.type, "Off", "Jitter"})
		menu.builder[state].delay.hidden.type:depend({menu.builder[state].delay.builder_type, "Hidden"}, {menu.switch, "Anti-Aim"}, {menu.switch_type, "Builder"}, {menu.antiaim.conditions, state}, {menu.builder[state].body_yaw.type, "Off", "Jitter"})
		menu.builder[state].delay.hidden.values:depend({menu.builder[state].delay.builder_type, "Hidden"}, {menu.builder[state].delay.hidden.type, "Default", "Smart", "Fluctuate", "Random", "Timing"}, {menu.switch, "Anti-Aim"}, {menu.switch_type, "Builder"}, {menu.antiaim.conditions, state}, {menu.builder[state].body_yaw.type, "Off", "Jitter"})
		menu.builder[state].delay.hidden.solo:depend({menu.builder[state].delay.builder_type, "Hidden"}, {menu.builder[state].delay.hidden.type, "Default", "Smart", "Fluctuate", "Random", "Timing"}, {menu.builder[state].delay.hidden.values, "Solo"}, {menu.switch, "Anti-Aim"}, {menu.switch_type, "Builder"}, {menu.antiaim.conditions, state}, {menu.builder[state].body_yaw.type, "Off", "Jitter"})
		menu.builder[state].delay.hidden.double.left:depend({menu.builder[state].delay.builder_type, "Hidden"}, {menu.builder[state].delay.hidden.type, "Default", "Smart", "Fluctuate", "Random", "Timing"}, {menu.builder[state].delay.hidden.values, "Double"}, {menu.switch, "Anti-Aim"}, {menu.switch_type, "Builder"}, {menu.antiaim.conditions, state}, {menu.builder[state].body_yaw.type, "Off", "Jitter"})
		menu.builder[state].delay.hidden.double.right:depend({menu.builder[state].delay.builder_type, "Hidden"}, {menu.builder[state].delay.hidden.type, "Default", "Smart", "Fluctuate", "Random", "Timing"}, {menu.builder[state].delay.hidden.values, "Double"}, {menu.switch, "Anti-Aim"}, {menu.switch_type, "Builder"}, {menu.antiaim.conditions, state}, {menu.builder[state].body_yaw.type, "Off", "Jitter"})
		menu.builder[state].delay.hidden.double.randomize:depend({menu.builder[state].delay.builder_type, "Hidden"}, {menu.builder[state].delay.hidden.type, "Default", "Smart", "Fluctuate", "Random"}, {menu.builder[state].delay.hidden.values, "Double"}, {menu.switch, "Anti-Aim"}, {menu.switch_type, "Builder"}, {menu.antiaim.conditions, state}, {menu.builder[state].body_yaw.type, "Off", "Jitter"})
		menu.builder[state].delay.hidden.custom.count:depend({menu.builder[state].delay.builder_type, "Hidden"}, {menu.builder[state].delay.hidden.type, "Default", "Smart", "Fluctuate", "Random", "Timing"}, {menu.builder[state].delay.hidden.values, "Custom"}, {menu.switch, "Anti-Aim"}, {menu.switch_type, "Builder"}, {menu.antiaim.conditions, state}, {menu.builder[state].body_yaw.type, "Off", "Jitter"})
		menu.builder[state].delay.hidden.custom.randomize:depend({menu.builder[state].delay.builder_type, "Hidden"}, {menu.builder[state].delay.hidden.type, "Default", "Smart", "Fluctuate", "Random"}, {menu.builder[state].delay.hidden.values, "Custom"}, {menu.switch, "Anti-Aim"}, {menu.switch_type, "Builder"}, {menu.antiaim.conditions, state}, {menu.builder[state].body_yaw.type, "Off", "Jitter"})
		menu.builder[state].spacers.force_defensive:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Builder"}, {menu.antiaim.conditions, state})
		menu.builder[state].force_defensive:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, handlers.p543}, {menu.antiaim.conditions, state})
		menu.builder[state].invalid_tick_cleaner:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, handlers.p543}, {menu.antiaim.conditions, state})
		menu.defensive[state].toggle_builder:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state})
		menu.defensive[state].toggle_builder:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state})
		menu.defensive[state].duration:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state})
		menu.defensive[state].duration:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state}, {menu.defensive[state].toggle_builder, true})
		menu.defensive[state].def_pitch:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state})
		menu.defensive[state].def_pitch:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state}, {menu.defensive[state].toggle_builder, true})
		menu.defensive[state].def_pitch_static_value:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state})
		menu.defensive[state].def_pitch_static_value:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state}, {menu.defensive[state].toggle_builder, true}, {menu.defensive[state].def_pitch, "Custom"})
		menu.defensive[state].def_pitch_left_value:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state})
		menu.defensive[state].def_pitch_left_value:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state}, {menu.defensive[state].toggle_builder, true}, {menu.defensive[state].def_pitch, "Double"})
		menu.defensive[state].def_pitch_right_value:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state})
		menu.defensive[state].def_pitch_right_value:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state}, {menu.defensive[state].toggle_builder, true}, {menu.defensive[state].def_pitch, "Double"})
		menu.defensive[state].def_pitch_left_delay_value:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state})
		menu.defensive[state].def_pitch_left_delay_value:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state}, {menu.defensive[state].toggle_builder, true}, {menu.defensive[state].def_pitch, "Delay"})
		menu.defensive[state].def_pitch_right_delay_value:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state})
		menu.defensive[state].def_pitch_right_delay_value:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state}, {menu.defensive[state].toggle_builder, true}, {menu.defensive[state].def_pitch, "Delay"})
		menu.defensive[state].def_pitch_delay:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state})
		menu.defensive[state].def_pitch_delay:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state}, {menu.defensive[state].toggle_builder, true}, {menu.defensive[state].def_pitch, "Delay"})
		menu.defensive[state].def_pitch_spin_left_value:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state})
		menu.defensive[state].def_pitch_spin_left_value:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state}, {menu.defensive[state].toggle_builder, true}, {menu.defensive[state].def_pitch, "Spin"})
		menu.defensive[state].def_pitch_spin_right_value:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state})
		menu.defensive[state].def_pitch_spin_right_value:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state}, {menu.defensive[state].toggle_builder, true}, {menu.defensive[state].def_pitch, "Spin"})
		menu.defensive[state].def_pitch_spin_speed:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state})
		menu.defensive[state].def_pitch_spin_speed:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state}, {menu.defensive[state].toggle_builder, true}, {menu.defensive[state].def_pitch, "Spin"})
		menu.defensive[state].def_pitch_sway_left_value:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state})
		menu.defensive[state].def_pitch_sway_left_value:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state}, {menu.defensive[state].toggle_builder, true}, {menu.defensive[state].def_pitch, "Sway"})
		menu.defensive[state].def_pitch_sway_right_value:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state})
		menu.defensive[state].def_pitch_sway_right_value:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state}, {menu.defensive[state].toggle_builder, true}, {menu.defensive[state].def_pitch, "Sway"})
		menu.defensive[state].def_pitch_sway_speed:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state})
		menu.defensive[state].def_pitch_sway_speed:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state}, {menu.defensive[state].toggle_builder, true}, {menu.defensive[state].def_pitch, "Sway"})
		menu.defensive[state].def_pitch_fluctuate_value1:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state})
		menu.defensive[state].def_pitch_fluctuate_value1:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state}, {menu.defensive[state].toggle_builder, true}, {menu.defensive[state].def_pitch, "Fluctuate"})
		menu.defensive[state].def_pitch_fluctuate_value2:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state})
		menu.defensive[state].def_pitch_fluctuate_value2:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state}, {menu.defensive[state].toggle_builder, true}, {menu.defensive[state].def_pitch, "Fluctuate"})
		menu.defensive[state].def_pitch_fluctuate_speed:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state})
		menu.defensive[state].def_pitch_fluctuate_speed:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state}, {menu.defensive[state].toggle_builder, true}, {menu.defensive[state].def_pitch, "Fluctuate"})
		menu.defensive[state].def_pitch_fluctuate_mode:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state})
		menu.defensive[state].def_pitch_fluctuate_mode:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state}, {menu.defensive[state].toggle_builder, true}, {menu.defensive[state].def_pitch, "Fluctuate"})
		menu.defensive[state].def_pitch_refraction_up:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state})
		menu.defensive[state].def_pitch_refraction_up:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state}, {menu.defensive[state].toggle_builder, true}, {menu.defensive[state].def_pitch, "Refraction"})
		menu.defensive[state].def_pitch_refraction_down:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state})
		menu.defensive[state].def_pitch_refraction_down:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state}, {menu.defensive[state].toggle_builder, true}, {menu.defensive[state].def_pitch, "Refraction"})
		menu.defensive[state].def_pitch_refraction_spin:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state})
		menu.defensive[state].def_pitch_refraction_spin:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state}, {menu.defensive[state].toggle_builder, true}, {menu.defensive[state].def_pitch, "Refraction"})
		menu.defensive[state].def_pitch_refraction_timer:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state})
		menu.defensive[state].def_pitch_refraction_timer:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state}, {menu.defensive[state].toggle_builder, true}, {menu.defensive[state].def_pitch, "Refraction"})
		menu.defensive[state].def_pitch_separator:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state}, {menu.defensive[state].toggle_builder, true})
		menu.defensive[state].def_yaw:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state})
		menu.defensive[state].def_yaw:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state}, {menu.defensive[state].toggle_builder, true})
		menu.defensive[state].def_yaw_static_value:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state})
		menu.defensive[state].def_yaw_static_value:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state}, {menu.defensive[state].toggle_builder, true}, {menu.defensive[state].def_yaw, "Custom"})
		menu.defensive[state].def_yaw_left_value:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state})
		menu.defensive[state].def_yaw_left_value:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state}, {menu.defensive[state].toggle_builder, true}, {menu.defensive[state].def_yaw, "Double"})
		menu.defensive[state].def_yaw_right_value:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state})
		menu.defensive[state].def_yaw_right_value:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state}, {menu.defensive[state].toggle_builder, true}, {menu.defensive[state].def_yaw, "Double"})
		menu.defensive[state].def_yaw_delay:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state})
		menu.defensive[state].def_yaw_delay:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state}, {menu.defensive[state].toggle_builder, true}, {menu.defensive[state].def_yaw, "Double"})
		menu.defensive[state].def_yaw_spin_speed:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state})
		menu.defensive[state].def_yaw_spin_speed:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state}, {menu.defensive[state].toggle_builder, true}, {menu.defensive[state].def_yaw, "Spin"})
		menu.defensive[state].def_yaw_spin_left_value:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state})
		menu.defensive[state].def_yaw_spin_left_value:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state}, {menu.defensive[state].toggle_builder, true}, {menu.defensive[state].def_yaw, "Spin"})
		menu.defensive[state].def_yaw_spin_right_value:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state})
		menu.defensive[state].def_yaw_spin_right_value:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state}, {menu.defensive[state].toggle_builder, true}, {menu.defensive[state].def_yaw, "Spin"})
		menu.defensive[state].def_yaw_sway_speed:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state})
		menu.defensive[state].def_yaw_sway_speed:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state}, {menu.defensive[state].toggle_builder, true}, {menu.defensive[state].def_yaw, "Sway"})
		menu.defensive[state].def_yaw_sway_left_value:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state})
		menu.defensive[state].def_yaw_sway_left_value:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state}, {menu.defensive[state].toggle_builder, true}, {menu.defensive[state].def_yaw, "Sway"})
		menu.defensive[state].def_yaw_sway_right_value:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state})
		menu.defensive[state].def_yaw_sway_right_value:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state}, {menu.defensive[state].toggle_builder, true}, {menu.defensive[state].def_yaw, "Sway"})
		menu.defensive[state].def_yaw_zurab_range:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state})
		menu.defensive[state].def_yaw_zurab_range:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state}, {menu.defensive[state].toggle_builder, true}, {menu.defensive[state].def_yaw, "Zurab"})
		menu.defensive[state].def_yaw_zurab_speed:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state})
		menu.defensive[state].def_yaw_zurab_speed:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state}, {menu.defensive[state].toggle_builder, true}, {menu.defensive[state].def_yaw, "Zurab"})
		menu.defensive[state].def_yaw_distortion:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state})
		menu.defensive[state].def_yaw_distortion:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state}, {menu.defensive[state].toggle_builder, true}, {menu.defensive[state].def_yaw, "Distortion"})
		menu.defensive[state].def_yaw_distortion_randomize:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state})
		menu.defensive[state].def_yaw_distortion_randomize:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state}, {menu.defensive[state].toggle_builder, true}, {menu.defensive[state].def_yaw, "Distortion"})
		menu.defensive[state].def_yaw_distortion_plus:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state})
		menu.defensive[state].def_yaw_distortion_plus:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state}, {menu.defensive[state].toggle_builder, true}, {menu.defensive[state].def_yaw, "Distortion"})
		menu.defensive[state].def_yaw_distortion_minus:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state})
		menu.defensive[state].def_yaw_distortion_minus:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state}, {menu.defensive[state].toggle_builder, true}, {menu.defensive[state].def_yaw, "Distortion"})
		menu.defensive[state].def_yaw_refraction_left:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state})
		menu.defensive[state].def_yaw_refraction_left:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state}, {menu.defensive[state].toggle_builder, true}, {menu.defensive[state].def_yaw, "Refraction"})
		menu.defensive[state].def_yaw_refraction_right:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state})
		menu.defensive[state].def_yaw_refraction_right:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state}, {menu.defensive[state].toggle_builder, true}, {menu.defensive[state].def_yaw, "Refraction"})
		menu.defensive[state].def_yaw_refraction_spin:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state})
		menu.defensive[state].def_yaw_refraction_spin:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state}, {menu.defensive[state].toggle_builder, true}, {menu.defensive[state].def_yaw, "Refraction"})
		menu.defensive[state].def_yaw_refraction_timer:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state})
		menu.defensive[state].def_yaw_refraction_timer:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state}, {menu.defensive[state].toggle_builder, true}, {menu.defensive[state].def_yaw, "Refraction"})
		menu.defensive[state].def_yaw_delayed_left:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state})
		menu.defensive[state].def_yaw_delayed_left:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state}, {menu.defensive[state].toggle_builder, true}, {menu.defensive[state].def_yaw, "Delayed"})
		menu.defensive[state].def_yaw_delayed_right:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state})
		menu.defensive[state].def_yaw_delayed_right:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state}, {menu.defensive[state].toggle_builder, true}, {menu.defensive[state].def_yaw, "Delayed"})
		menu.defensive[state].def_yaw_delayed_delay:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state})
		menu.defensive[state].def_yaw_delayed_delay:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state}, {menu.defensive[state].toggle_builder, true}, {menu.defensive[state].def_yaw, "Delayed"})
		menu.defensive[state].def_yaw_delayed_randomize:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state})
		menu.defensive[state].def_yaw_delayed_randomize:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Defensive"}, {menu.antiaim.conditions, state}, {menu.defensive[state].toggle_builder, true}, {menu.defensive[state].def_yaw, "Delayed"})
		for slot = 1, 10 do
			-- yaw modifiers custom slots (Default builder)
			menu.builder[state].yaw_modifiers.custom.slots[slot]:depend(
				{menu.builder[state].yaw_modifiers.builder_type, "Default"},
				{menu.builder[state].yaw_modifiers.type, "Center", "Random", "Spin"},
				{menu.builder[state].yaw_modifiers.values, "Custom"},
				{menu.builder[state].yaw_modifiers.custom.count, slot, 10},
				{menu.switch, "Anti-Aim"},
				{menu.switch_type, "Builder"},
				{menu.antiaim.conditions, state}
			)
			-- yaw modifiers custom slots (Hidden builder)
			menu.builder[state].yaw_modifiers.hidden.custom.slots[slot]:depend(
				{menu.builder[state].yaw_modifiers.builder_type, "Hidden"},
				{menu.builder[state].yaw_modifiers.hidden.type, "Center", "Random", "Spin"},
				{menu.builder[state].yaw_modifiers.hidden.values, "Custom"},
				{menu.builder[state].yaw_modifiers.hidden.custom.count, slot, 10},
				{menu.switch, "Anti-Aim"},
				{menu.switch_type, "Builder"},
				{menu.antiaim.conditions, state}
			)
			-- delay custom slots (Default builder)
			menu.builder[state].delay.custom.slots[slot]:depend(
				{menu.builder[state].delay.builder_type, "Default"},
				{menu.builder[state].delay.type, "Default", "Smart", "Fluctuate", "Random", "Timing"},
				{menu.builder[state].delay.values, "Custom"},
				{menu.builder[state].delay.custom.count, slot, 10},
				{menu.switch, "Anti-Aim"},
				{menu.switch_type, "Builder"},
				{menu.antiaim.conditions, state},
				{menu.builder[state].body_yaw.type, "Off", "Jitter"}
			)
			-- delay custom slots (Hidden builder)
			menu.builder[state].delay.hidden.custom.slots[slot]:depend(
				{menu.builder[state].delay.builder_type, "Hidden"},
				{menu.builder[state].delay.hidden.type, "Default", "Smart", "Fluctuate", "Random", "Timing"},
				{menu.builder[state].delay.hidden.values, "Custom"},
				{menu.builder[state].delay.hidden.custom.count, slot, 10},
				{menu.switch, "Anti-Aim"},
				{menu.switch_type, "Builder"},
				{menu.antiaim.conditions, state},
				{menu.builder[state].body_yaw.type, "Off", "Jitter"}
			)
		end
	end

	-- Static and weapon-specific visibility dependencies
	menu.switch_type:depend({menu.switch, "Anti-Aim"})
	menu.config.list:depend({menu.switch, "Configs"})
	menu.config.name:depend({menu.switch, "Configs"})
	menu.config.warmup_config:depend({menu.switch, "Configs"})
	menu.config.load:depend({menu.switch, "Configs"})
	menu.config.save:depend({menu.switch, "Configs"})
	menu.config.delete:depend({menu.switch, "Configs"})
	menu.config.export:depend({menu.switch, "Configs"})
	menu.config.import:depend({menu.switch, "Configs"})
	menu.ragebot.hold_aim_ticks:depend({menu.switch, "Ragebot"})
	menu.ragebot.extrapolation:depend({menu.switch, "Ragebot"})
	menu.ragebot.overpredict:depend({menu.switch, "Ragebot"})
	menu.ragebot.enemy_resolver:depend({menu.switch, "Ragebot"})
	menu.ragebot.enemy_resolver_mode:depend({menu.switch, "Ragebot"}, menu.ragebot.enemy_resolver)
	menu.ragebot.enemy_resolver_generate:depend({menu.switch, "Ragebot"}, menu.ragebot.enemy_resolver, {menu.ragebot.enemy_resolver_mode, "Custom"})
	menu.ragebot.enemy_resolver_output:depend({menu.switch, "Ragebot"}, menu.ragebot.enemy_resolver)
	menu.ragebot.hitchance.enabled:depend({menu.switch, "Ragebot"})
	menu.ragebot.hitchance.weapon:depend({menu.switch, "Ragebot"}, menu.ragebot.hitchance.enabled)
	menu.ragebot.hitchance.hotkey:depend({menu.switch, "Ragebot"}, menu.ragebot.hitchance.enabled)
	menu.ragebot.hitchance["Auto Snipers"].options:depend({menu.switch, "Ragebot"}, menu.ragebot.hitchance.enabled, {menu.ragebot.hitchance.weapon, "Auto Snipers"})
	menu.ragebot.hitchance["Auto Snipers"]["In Air"].value:depend({menu.switch, "Ragebot"}, menu.ragebot.hitchance.enabled, {menu.ragebot.hitchance.weapon, "Auto Snipers"}, {menu.ragebot.hitchance["Auto Snipers"].options, "In Air"})
	menu.ragebot.hitchance["Auto Snipers"]["No Scope"].value:depend({menu.switch, "Ragebot"}, menu.ragebot.hitchance.enabled, {menu.ragebot.hitchance.weapon, "Auto Snipers"}, {menu.ragebot.hitchance["Auto Snipers"].options, "No Scope"})
	menu.ragebot.hitchance["Auto Snipers"]["No Scope"].distance:depend({menu.switch, "Ragebot"}, menu.ragebot.hitchance.enabled, {menu.ragebot.hitchance.weapon, "Auto Snipers"}, {menu.ragebot.hitchance["Auto Snipers"].options, "No Scope"})
	menu.ragebot.hitchance["Auto Snipers"].Hotkey.value:depend({menu.switch, "Ragebot"}, menu.ragebot.hitchance.enabled, {menu.ragebot.hitchance.weapon, "Auto Snipers"}, {menu.ragebot.hitchance["Auto Snipers"].options, "Hotkey"})
	menu.ragebot.hitchance["Auto Snipers"].Crouch.value:depend({menu.switch, "Ragebot"}, menu.ragebot.hitchance.enabled, {menu.ragebot.hitchance.weapon, "Auto Snipers"}, {menu.ragebot.hitchance["Auto Snipers"].options, "Crouch"})
	menu.ragebot.hitchance["Auto Snipers"]["Peek Assist"].value:depend({menu.switch, "Ragebot"}, menu.ragebot.hitchance.enabled, {menu.ragebot.hitchance.weapon, "Auto Snipers"}, {menu.ragebot.hitchance["Auto Snipers"].options, "Peek Assist"})
	menu.ragebot.hitchance["Desert Eagle"].options:depend({menu.switch, "Ragebot"}, menu.ragebot.hitchance.enabled, {menu.ragebot.hitchance.weapon, "Desert Eagle"})
	menu.ragebot.hitchance["Desert Eagle"]["In Air"].value:depend({menu.switch, "Ragebot"}, menu.ragebot.hitchance.enabled, {menu.ragebot.hitchance.weapon, "Desert Eagle"}, {menu.ragebot.hitchance["Desert Eagle"].options, "In Air"})
	menu.ragebot.hitchance["Desert Eagle"].Hotkey.value:depend({menu.switch, "Ragebot"}, menu.ragebot.hitchance.enabled, {menu.ragebot.hitchance.weapon, "Desert Eagle"}, {menu.ragebot.hitchance["Desert Eagle"].options, "Hotkey"})
	menu.ragebot.hitchance["Desert Eagle"].Crouch.value:depend({menu.switch, "Ragebot"}, menu.ragebot.hitchance.enabled, {menu.ragebot.hitchance.weapon, "Desert Eagle"}, {menu.ragebot.hitchance["Desert Eagle"].options, "Crouch"})
	menu.ragebot.hitchance["Desert Eagle"]["Peek Assist"].value:depend({menu.switch, "Ragebot"}, menu.ragebot.hitchance.enabled, {menu.ragebot.hitchance.weapon, "Desert Eagle"}, {menu.ragebot.hitchance["Desert Eagle"].options, "Peek Assist"})
	menu.ragebot.hitchance["Revolver R8"].options:depend({menu.switch, "Ragebot"}, menu.ragebot.hitchance.enabled, {menu.ragebot.hitchance.weapon, "Revolver R8"})
	menu.ragebot.hitchance["Revolver R8"]["In Air"].value:depend({menu.switch, "Ragebot"}, menu.ragebot.hitchance.enabled, {menu.ragebot.hitchance.weapon, "Revolver R8"}, {menu.ragebot.hitchance["Revolver R8"].options, "In Air"})
	menu.ragebot.hitchance["Revolver R8"].Hotkey.value:depend({menu.switch, "Ragebot"}, menu.ragebot.hitchance.enabled, {menu.ragebot.hitchance.weapon, "Revolver R8"}, {menu.ragebot.hitchance["Revolver R8"].options, "Hotkey"})
	menu.ragebot.hitchance["Revolver R8"].Crouch.value:depend({menu.switch, "Ragebot"}, menu.ragebot.hitchance.enabled, {menu.ragebot.hitchance.weapon, "Revolver R8"}, {menu.ragebot.hitchance["Revolver R8"].options, "Crouch"})
	menu.ragebot.hitchance["Revolver R8"]["Peek Assist"].value:depend({menu.switch, "Ragebot"}, menu.ragebot.hitchance.enabled, {menu.ragebot.hitchance.weapon, "Revolver R8"}, {menu.ragebot.hitchance["Revolver R8"].options, "Peek Assist"})
	menu.ragebot.hitchance.Pistols.options:depend({menu.switch, "Ragebot"}, menu.ragebot.hitchance.enabled, {menu.ragebot.hitchance.weapon, "Pistols"})
	menu.ragebot.hitchance.Pistols["In Air"].value:depend({menu.switch, "Ragebot"}, menu.ragebot.hitchance.enabled, {menu.ragebot.hitchance.weapon, "Pistols"}, {menu.ragebot.hitchance.Pistols.options, "In Air"})
	menu.ragebot.hitchance.Pistols.Hotkey.value:depend({menu.switch, "Ragebot"}, menu.ragebot.hitchance.enabled, {menu.ragebot.hitchance.weapon, "Pistols"}, {menu.ragebot.hitchance.Pistols.options, "Hotkey"})
	menu.ragebot.hitchance.Pistols.Crouch.value:depend({menu.switch, "Ragebot"}, menu.ragebot.hitchance.enabled, {menu.ragebot.hitchance.weapon, "Pistols"}, {menu.ragebot.hitchance.Pistols.options, "Crouch"})
	menu.ragebot.hitchance.Pistols["Peek Assist"].value:depend({menu.switch, "Ragebot"}, menu.ragebot.hitchance.enabled, {menu.ragebot.hitchance.weapon, "Pistols"}, {menu.ragebot.hitchance.Pistols.options, "Peek Assist"})
	menu.ragebot.hitchance.Scout.options:depend({menu.switch, "Ragebot"}, menu.ragebot.hitchance.enabled, {menu.ragebot.hitchance.weapon, "Scout"})
	menu.ragebot.hitchance.Scout["In Air"].value:depend({menu.switch, "Ragebot"}, menu.ragebot.hitchance.enabled, {menu.ragebot.hitchance.weapon, "Scout"}, {menu.ragebot.hitchance.Scout.options, "In Air"})
	menu.ragebot.hitchance.Scout["No Scope"].value:depend({menu.switch, "Ragebot"}, menu.ragebot.hitchance.enabled, {menu.ragebot.hitchance.weapon, "Scout"}, {menu.ragebot.hitchance.Scout.options, "No Scope"})
	menu.ragebot.hitchance.Scout["No Scope"].distance:depend({menu.switch, "Ragebot"}, menu.ragebot.hitchance.enabled, {menu.ragebot.hitchance.weapon, "Scout"}, {menu.ragebot.hitchance.Scout.options, "No Scope"})
	menu.ragebot.hitchance.Scout.Hotkey.value:depend({menu.switch, "Ragebot"}, menu.ragebot.hitchance.enabled, {menu.ragebot.hitchance.weapon, "Scout"}, {menu.ragebot.hitchance.Scout.options, "Hotkey"})
	menu.ragebot.hitchance.Scout.Crouch.value:depend({menu.switch, "Ragebot"}, menu.ragebot.hitchance.enabled, {menu.ragebot.hitchance.weapon, "Scout"}, {menu.ragebot.hitchance.Scout.options, "Crouch"})
	menu.ragebot.hitchance.Scout["Peek Assist"].value:depend({menu.switch, "Ragebot"}, menu.ragebot.hitchance.enabled, {menu.ragebot.hitchance.weapon, "Scout"}, {menu.ragebot.hitchance.Scout.options, "Peek Assist"})
	menu.ragebot.hitchance.AWP.options:depend({menu.switch, "Ragebot"}, menu.ragebot.hitchance.enabled, {menu.ragebot.hitchance.weapon, "AWP"})
	menu.ragebot.hitchance.AWP["In Air"].value:depend({menu.switch, "Ragebot"}, menu.ragebot.hitchance.enabled, {menu.ragebot.hitchance.weapon, "AWP"}, {menu.ragebot.hitchance.AWP.options, "In Air"})
	menu.ragebot.hitchance.AWP["No Scope"].value:depend({menu.switch, "Ragebot"}, menu.ragebot.hitchance.enabled, {menu.ragebot.hitchance.weapon, "AWP"}, {menu.ragebot.hitchance.AWP.options, "No Scope"})
	menu.ragebot.hitchance.AWP["No Scope"].distance:depend({menu.switch, "Ragebot"}, menu.ragebot.hitchance.enabled, {menu.ragebot.hitchance.weapon, "AWP"}, {menu.ragebot.hitchance.AWP.options, "No Scope"})
	menu.ragebot.hitchance.AWP.Hotkey.value:depend({menu.switch, "Ragebot"}, menu.ragebot.hitchance.enabled, {menu.ragebot.hitchance.weapon, "AWP"}, {menu.ragebot.hitchance.AWP.options, "Hotkey"})
	menu.ragebot.hitchance.AWP.Crouch.value:depend({menu.switch, "Ragebot"}, menu.ragebot.hitchance.enabled, {menu.ragebot.hitchance.weapon, "AWP"}, {menu.ragebot.hitchance.AWP.options, "Crouch"})
	menu.ragebot.hitchance.AWP["Peek Assist"].value:depend({menu.switch, "Ragebot"}, menu.ragebot.hitchance.enabled, {menu.ragebot.hitchance.weapon, "AWP"}, {menu.ragebot.hitchance.AWP.options, "Peek Assist"})
	menu.antiaim.features.anti_backstab:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Builder"})
	menu.antiaim.features.safe_head.enabled:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Builder"})
	menu.antiaim.features.safe_head.states:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Builder"}, menu.antiaim.features.safe_head.enabled)
	menu.antiaim.features.disable_fakelag:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Builder"})
	menu.antiaim.features.fakelag_exploit_enabled:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Builder"})
	menu.antiaim.features.fakelag_exploit_tick:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Builder"}, menu.antiaim.features.fakelag_exploit_enabled)
	menu.antiaim.features.fakelag_exploit_force:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Builder"}, menu.antiaim.features.fakelag_exploit_enabled)
	menu.antiaim.features.hotkeys.left:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Builder"})
	menu.antiaim.features.hotkeys.right:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Builder"})
	menu.antiaim.features.hotkeys.forward:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Builder"})
	menu.antiaim.features.hotkeys.reset:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Builder"})
	menu.antiaim.features.hotkeys.freestanding:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Builder"})
	menu.antiaim.features.hotkeys.edgeyaw:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Builder"})
	menu.visuals.stubs.manual_arrows:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Builder"})
	menu.visuals.stubs.manual_arrows_style:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Builder"}, menu.visuals.stubs.manual_arrows)
	menu.visuals.stubs.manual_arrows_offset:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Builder"}, menu.visuals.stubs.manual_arrows)
	menu.visuals.stubs.manual_arrows_color:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Builder"}, menu.visuals.stubs.manual_arrows)
	menu.visuals.stubs.manual_arrows_cs2_color:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Builder"}, menu.visuals.stubs.manual_arrows)
	menu.visuals.stubs.manual_arrows_ts_cl1:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Builder"}, menu.visuals.stubs.manual_arrows)
	menu.visuals.stubs.manual_arrows_ts_cl2:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Builder"}, menu.visuals.stubs.manual_arrows)
	menu.antiaim.conditions:depend({menu.switch, "Anti-Aim"}, {menu.switch_type, "Builder", "Defensive"})
	menu.visuals.stubs.watermark:depend({menu.switch, "Other"})
	menu.visuals.stubs.watermark_style:depend({menu.switch, "Other"}, menu.visuals.stubs.watermark)
	menu.visuals.stubs.watermark_display:depend({menu.switch, "Other"}, menu.visuals.stubs.watermark, {menu.visuals.stubs.watermark_style, "CS2"})
	menu.visuals.stubs.watermark_accent_color:depend({menu.switch, "Other"}, menu.visuals.stubs.watermark, {menu.visuals.stubs.watermark_style, "CS2"})
	menu.visuals.stubs.watermark_position:depend({menu.switch, "Other"}, menu.visuals.stubs.watermark)
	menu.visuals.stubs.watermark_cs2_gradient:depend({menu.switch, "Other"}, menu.visuals.stubs.watermark, {menu.visuals.stubs.watermark_style, "CS2"})
	menu.visuals.stubs.feature_indicators:depend({menu.switch, "Other"})
	menu.visuals.stubs.feature_indicators_offset:depend({menu.switch, "Other"}, menu.visuals.stubs.feature_indicators)
	menu.visuals.stubs.damage_indicator:depend({menu.switch, "Other"})
	menu.visuals.stubs.native_indicators:depend({menu.switch, "Other"})
	menu.visuals.stubs.native_indicators_gradient:depend({menu.switch, "Other"}, menu.visuals.stubs.native_indicators)
	menu.visuals.stubs.aimbot_logs:depend({menu.switch, "Other"})
	menu.visuals.stubs.aimbot_logs_hit_label:depend({menu.switch, "Other"}, menu.visuals.stubs.aimbot_logs)
	menu.visuals.stubs.aimbot_logs_hit_color:depend({menu.switch, "Other"}, menu.visuals.stubs.aimbot_logs)
	menu.visuals.stubs.aimbot_logs_miss_label:depend({menu.switch, "Other"}, menu.visuals.stubs.aimbot_logs)
	menu.visuals.stubs.aimbot_logs_miss_color:depend({menu.switch, "Other"}, menu.visuals.stubs.aimbot_logs)
	menu.visuals.stubs.aimbot_logs_got_label:depend({menu.switch, "Other"}, menu.visuals.stubs.aimbot_logs)
	menu.visuals.stubs.aimbot_logs_got_color:depend({menu.switch, "Other"}, menu.visuals.stubs.aimbot_logs)
	menu.visuals.stubs.aimbot_logs_gradient:depend({menu.switch, "Other"}, menu.visuals.stubs.aimbot_logs)
	menu.visuals.animations.enabled:depend({menu.switch, "Other"})
	menu.visuals.animations.enabled_spacer:depend({menu.switch, "Other"}, menu.visuals.animations.enabled)
	menu.visuals.animations.air_legs:depend({menu.switch, "Other"}, menu.visuals.animations.enabled)
	menu.visuals.animations.air_legs_weight:depend({menu.switch, "Other"}, menu.visuals.animations.enabled, {menu.visuals.animations.air_legs, "Static"})
	menu.visuals.animations.air_legs_spacer:depend({menu.switch, "Other"}, menu.visuals.animations.enabled)
	menu.visuals.animations.ground_legs:depend({menu.switch, "Other"}, menu.visuals.animations.enabled)
	menu.visuals.animations.legs_offset_1:depend({menu.switch, "Other"}, menu.visuals.animations.enabled, {menu.visuals.animations.ground_legs, "Jitter", "Jitter[2]"})
	menu.visuals.animations.legs_offset_2:depend({menu.switch, "Other"}, menu.visuals.animations.enabled, {menu.visuals.animations.ground_legs, "Jitter", "Jitter[2]"})
	menu.visuals.animations.legs_jitter_time:depend({menu.switch, "Other"}, menu.visuals.animations.enabled, {menu.visuals.animations.ground_legs, "Jitter"})
	menu.visuals.animations.legs_jitter_time_spacer:depend({menu.switch, "Other"}, menu.visuals.animations.enabled, {menu.visuals.animations.ground_legs, "Jitter"})
	menu.visuals.animations.options:depend({menu.switch, "Other"}, menu.visuals.animations.enabled)
	menu.visuals.animations.move_lean:depend({menu.switch, "Other"}, menu.visuals.animations.enabled, {menu.visuals.animations.options, "Lean"})
	menu.visuals.fast_ladder:depend({menu.switch, "Other"})
	menu.visuals.fps_optimization:depend({menu.switch, "Other"})
	menu.visuals.fps_optimization_options:depend({menu.switch, "Other"}, menu.visuals.fps_optimization)
	menu.visuals.widgets.aspect_ratio:depend({menu.switch, "Other"})
	menu.visuals.widgets.aspect_ratio_value:depend({menu.switch, "Other"}, menu.visuals.widgets.aspect_ratio)
	menu.visuals.widgets.thirdperson:depend({menu.switch, "Other"})
	menu.visuals.widgets.thirdperson_distance:depend({menu.switch, "Other"}, menu.visuals.widgets.thirdperson)
	menu.visuals.widgets.viewmodel:depend({menu.switch, "Other"})
	menu.visuals.widgets.viewmodel_fov:depend({menu.switch, "Other"}, menu.visuals.widgets.viewmodel)
	menu.visuals.widgets.viewmodel_offset_x:depend({menu.switch, "Other"}, menu.visuals.widgets.viewmodel)
	menu.visuals.widgets.viewmodel_offset_y:depend({menu.switch, "Other"}, menu.visuals.widgets.viewmodel)
	menu.visuals.widgets.viewmodel_offset_z:depend({menu.switch, "Other"}, menu.visuals.widgets.viewmodel)
	menu.visuals.widgets.viewmodel_options:depend({menu.switch, "Other"}, menu.visuals.widgets.viewmodel)

	-- Exact closure bindings (prototype IDs map to recovered functions below)
	menu.switch:set_callback(handlers.p507)
	menu.switch_type:set_callback(handlers.p507)
	menu.visuals.widgets.aspect_ratio:set_callback(handlers.p317, false)
	menu.visuals.widgets.aspect_ratio_value:set_callback(handlers.p317)
	menu.visuals.widgets.thirdperson:set_callback(handlers.p318, false)
	menu.visuals.widgets.thirdperson_distance:set_callback(handlers.p318)
	menu.visuals.widgets.viewmodel:set_callback(handlers.p493, false)
	menu.visuals.widgets.viewmodel_fov:set_callback(handlers.p494)
	menu.visuals.widgets.viewmodel_offset_x:set_callback(handlers.p495)
	menu.visuals.widgets.viewmodel_offset_y:set_callback(handlers.p496)
	menu.visuals.widgets.viewmodel_offset_z:set_callback(handlers.p497)
	menu.visuals.widgets.viewmodel_options:set_callback(handlers.p493)
	menu.ragebot.extrapolation:set_callback(handlers.p445, false)
	menu.antiaim.features.fakelag_exploit_enabled:set_callback(handlers.p163, false)
	menu.antiaim.features.fakelag_exploit_tick:set_callback(handlers.p250)
	menu.ragebot.hold_aim_ticks:set_callback(handlers.p489, false)
	menu.visuals.stubs.aimbot_logs:set_callback(handlers.p232, false)
	menu.visuals.stubs.native_indicators:set_callback(handlers.p392, false)
	menu.visuals.animations.enabled:set_callback(handlers.p385, false)
	menu.visuals.animations.options:set_callback(handlers.p385, false)
	menu.visuals.fast_ladder:set_callback(handlers.p379, false)
	menu.ragebot.enemy_resolver:set_callback(handlers.p151, false)
	menu.visuals.fps_optimization:set_callback(handlers.p537, false)
	menu.visuals.fps_optimization_options:set_callback(handlers.p537)

	return menu, groups
end

local ANDROMEDA_EVENT_HANDLERS = {
	["game_initialized"] = "p115",
	["player_chat"] = "p122",
	["finish_command"] = "p423",
	["player_hint"] = "p432",
}

-- Extrapolation + Overpredict
-- Cohesive source reconstruction from VM prototypes p175/p185/p191/p254/
-- p271/p293/p337/p393/p394/p445/p446/p462/p464/p465/p466.
local function create_extrapolation_overpredict(menu, vector)
	local feature = {
		active = false,
		shifted_players = {},
		player_state = {},
		latency_cache = {tick = -1, time = 0},
	}

	local function clamp(value, minimum, maximum)
		return math.max(minimum, math.min(value, maximum))
	end

	local function get_number(control, fallback)
		if control == nil or control.get == nil then return nil end
		local value = control:get()
		return type(value) == "number" and value or fallback
	end

	local function get_vector_prop(entity_index, property)
		local x, y, z = entity.get_prop(entity_index, property)
		if x == nil then return nil end
		return vector(x, y, z)
	end

	function feature.get_ticks()
		return clamp(math.floor(get_number(menu.ragebot.extrapolation, 0)), 0, 5)
	end

	function feature.get_overpredict_multiplier()
		return clamp(get_number(menu.ragebot.overpredict, 125) * 0.01, 1, 2)
	end

	function feature.is_overpredict_enabled()
		return get_number(menu.ragebot.overpredict, 125) > 0
	end

	function feature.get_latency_time(maximum_time)
		local tick = globals.tickcount()
		local cache = feature.latency_cache
		if cache.tick == tick then return cache.time end

		local latency = math.max(client.latency() or 0, 0)
		if cvar.cl_updaterate ~= nil and cvar.cl_updaterate.get_float ~= nil then
			local updaterate = cvar.cl_updaterate:get_float()
			if type(updaterate) == "number" and updaterate > 0.001 then
				latency = latency - 0.5 / updaterate
			end
		end

		latency = clamp(latency, 0, maximum_time)
		cache.tick = tick
		cache.time = latency
		return latency
	end

	local function new_player_state()
		return {
			velocity = nil,
			simtime = nil,
			origin = nil,
			penalty_until = 0,
			boost_until = 0,
			stable_ticks = 0,
			hit_streak = 0,
			miss_streak = 0,
		}
	end

	function feature.get_player_multiplier(entity_index, velocity)
		local player = feature.player_state[entity_index]
		if player == nil or velocity == nil then return 0 end

		local speed_squared = velocity.x * velocity.x + velocity.y * velocity.y
		if speed_squared < 1225 then return 0 end
		if not feature.is_overpredict_enabled() then return 1 end

		local speed = math.sqrt(speed_squared)
		local multiplier = feature.get_overpredict_multiplier()
		if speed < 100 then
			multiplier = multiplier * 0.65
		elseif speed < 180 then
			multiplier = multiplier * 0.90
		elseif speed > 180 then
			multiplier = multiplier * 1.15
		end

		local previous_velocity = player.velocity
		if previous_velocity ~= nil then
			local previous_speed_squared =
				previous_velocity.x * previous_velocity.x +
				previous_velocity.y * previous_velocity.y
			if previous_speed_squared >= 1225 then
				local direction_dot =
					velocity.x * previous_velocity.x +
					velocity.y * previous_velocity.y
				if direction_dot < 0 then
					multiplier = multiplier * 0.55
				end

				local speed_delta = math.abs(speed - math.sqrt(previous_speed_squared))
				if speed_delta < 22 then
					player.stable_ticks = math.min((player.stable_ticks or 0) + 1, 12)
				else
					player.stable_ticks = 0
				end
			else
				player.stable_ticks = 0
			end
		end
		player.velocity = velocity

		local tick = globals.tickcount()
		if (player.penalty_until or 0) > tick then
			local misses = math.min(player.miss_streak or 0, 4)
			multiplier = multiplier * math.max(0.52, 0.82 - misses * 0.08)
		elseif (player.boost_until or 0) > tick then
			local hits = math.min(player.hit_streak or 0, 4)
			multiplier = multiplier * (1.06 + math.min(hits * 0.025, 0.08))
		end

		if (player.stable_ticks or 0) >= 4 then
			multiplier = multiplier * 1.05
		end
		return clamp(multiplier, 0.45, 2.25)
	end

	function feature.predict_vector(origin, velocity, requested_ticks, entity_index, acceleration)
		if velocity == nil then return nil end

		local ticks = requested_ticks or 0
		local configured_ticks = feature.get_ticks()
		if configured_ticks > 0 then
			ticks = math.max(configured_ticks, ticks)
		end

		local speed_squared =
			velocity.x * velocity.x +
			velocity.y * velocity.y +
			velocity.z * velocity.z
		local tickinterval = globals.tickinterval()
		local multiplier = 1
		if type(entity_index) == "number" and speed_squared > 0 then
			multiplier = feature.get_player_multiplier(entity_index, velocity)
		end

		local prediction_time = tickinterval * ticks * multiplier
		prediction_time = prediction_time + feature.get_latency_time(tickinterval)
		local predicted = origin + velocity * prediction_time

		if acceleration ~= nil then
			local acceleration_squared =
				acceleration.x * acceleration.x +
				acceleration.y * acceleration.y +
				acceleration.z * acceleration.z
			if acceleration_squared < 900000 then
				predicted = predicted + acceleration * (0.5 * prediction_time * prediction_time)
			end
		end
		return predicted
	end

	function feature.predict_player_position(entity_index, origin, requested_ticks)
		if origin == nil then return nil end
		local velocity = get_vector_prop(entity_index, "m_vecVelocity")
		if velocity == nil then return nil end

		local player = feature.player_state[entity_index]
		if player == nil then
			player = new_player_state()
			feature.player_state[entity_index] = player
		end

		local simtime = entity.get_simtime(entity_index)
		local acceleration
		if player.velocity ~= nil and type(player.simtime) == "number" and type(simtime) == "number" then
			local simulation_delta = simtime - player.simtime
			if simulation_delta > 0 and simulation_delta < 0.35 then
				acceleration = (velocity - player.velocity) / simulation_delta
			end
		end

		local flags = entity.get_prop(entity_index, "m_fFlags") or 0
		if bit.band(flags, 1) == 0 and requested_ticks > 0 and acceleration == nil then
			local gravity = 800
			if cvar.sv_gravity ~= nil and cvar.sv_gravity.get_float ~= nil then
				gravity = cvar.sv_gravity:get_float() or gravity
			end
			acceleration = vector(0, 0, -gravity * 0.45)
		end

		local predicted = feature.predict_vector(
			origin, velocity, requested_ticks, entity_index, acceleration
		)
		player.origin = origin
		player.simtime = simtime
		if predicted == nil then return nil end

		local fraction = client.trace_line(
			entity_index,
			origin.x, origin.y, origin.z,
			predicted.x, predicted.y, predicted.z
		)
		if type(fraction) ~= "number" or fraction >= 0.99 then return predicted end
		local collision_scale = clamp(fraction * 0.84, 0, 0.92)
		return origin + (predicted - origin) * collision_scale
	end

	function feature.restore_all()
		for entity_index, origin in pairs(feature.shifted_players) do
			if entity.is_alive(entity_index) then
				entity.set_prop(entity_index, "m_vecOrigin", origin.x, origin.y, origin.z)
			end
			feature.shifted_players[entity_index] = nil
		end
	end

	function feature.clear_state()
		feature.restore_all()
		for entity_index in pairs(feature.player_state) do
			feature.player_state[entity_index] = nil
		end
		feature.latency_cache.tick = -1
		feature.latency_cache.time = 0
	end

	function feature.setup_command()
		feature.restore_all()
		local ticks = feature.get_ticks()
		if ticks <= 0 then return end
		local local_player = entity.get_local_player()
		if local_player == nil or not entity.is_alive(local_player) then return end

		for _, entity_index in ipairs(entity.get_players(true)) do
			if entity.is_alive(entity_index) and not entity.is_dormant(entity_index) then
				local origin = get_vector_prop(entity_index, "m_vecOrigin")
				local predicted = origin and feature.predict_player_position(entity_index, origin, ticks)
				if predicted ~= nil then
					feature.shifted_players[entity_index] = origin
					entity.set_prop(entity_index, "m_vecOrigin", predicted.x, predicted.y, predicted.z)
				end
			end
		end
	end

	function feature.aim_miss(event)
		if event == nil or event.reason ~= "prediction error" then return end
		local target = tonumber(event.target) or event.target
		local player = feature.player_state[target]
		if player == nil then return end
		player.penalty_until = globals.tickcount() + 48
		player.boost_until = 0
		player.miss_streak = math.min((player.miss_streak or 0) + 1, 4)
		player.hit_streak = 0
	end

	function feature.aim_hit(event)
		if event == nil then return end
		local target = tonumber(event.target) or event.target
		local player = feature.player_state[target]
		if player == nil then return end
		player.penalty_until = 0
		player.boost_until = globals.tickcount() + 24
		player.hit_streak = math.min((player.hit_streak or 0) + 1, 4)
		player.miss_streak = 0
		player.stable_ticks = math.min((player.stable_ticks or 0) + 2, 12)
	end

	local function set_callback(event_name, callback, enabled)
		if enabled then
			client.set_event_callback(event_name, callback)
		else
			client.unset_event_callback(event_name, callback)
		end
	end

	function feature.update_callbacks()
		local active = feature.get_ticks() > 0
		if feature.active == active then return end
		feature.active = active
		set_callback("setup_command", feature.setup_command, active)
		set_callback("run_command", feature.restore_all, active)
		set_callback("level_init", feature.clear_state, active)
		set_callback("aim_miss", feature.aim_miss, active)
		set_callback("aim_hit", feature.aim_hit, active)
		if not active then feature.clear_state() end
	end

	menu.ragebot.extrapolation:set_callback(feature.update_callbacks, true)
	return feature
end

recovered.andromeda_main_p103 = function(upvalues, environment, ...)
	local dependencies = load_andromeda_dependencies()
	local builtin_refs = build_builtin_references(ui)
	local prototypes = andromeda.menu_handler_prototypes or {}
	local handlers = {}

	-- The protection removed lexical upvalue names. Each recovered prototype is
	-- still present below; bind it to the entry capture set for source analysis.
	for key, prototype in pairs(prototypes) do
		handlers[key] = bind(prototype, upvalues or {})
	end

	local menu, groups = build_andromeda_menu(dependencies.pui, handlers, builtin_refs)
	local context = {
		dependencies = dependencies,
		references = builtin_refs,
		menu = menu,
		groups = groups,
		handlers = handlers,
	}

	for event_name, handler_key in pairs(ANDROMEDA_EVENT_HANDLERS) do
		local callback = handlers[handler_key]
		if callback ~= nil and client ~= nil and client.set_event_callback ~= nil then
			client.set_event_callback(event_name, callback)
		end
	end

	return context
end

recovered.save_p104 = function(upvalues, ...)
	return
end

recovered.andromeda_b_p105 = function(upvalues, ...)
  local value_2, value_3, value_4, value_5, value_6, value_7
	value_3()
	value_4 = nil > 1
	value_5 = value_2[2]
	value_6 = value_2[3]
	value_7 = value_3
	return value_4, value_5, value_6, value_7
end

recovered.andromeda_lerp_p106 = function(upvalues, argument_1, argument_2, argument_3, ...)
	local locals = make_locals()
	local t5
	locals.v1 = argument_1
	locals.v2 = argument_2
	locals.v3 = argument_3
	locals.v4 = type
	locals.v5 = locals.v3
	locals.v4 = locals.v4(locals.v5)
	locals.v21 = locals.v21 + 71
	locals.v21 = locals.v21 - 4
	locals.v21 = locals.v21 + 23824
	locals.v21 = locals.v21 - 23735
	locals.v14[114] = locals.v21
	locals.v20[113] = 100
	locals.v4 = locals.v3
	locals.v4 = 1
	t5[t6] = t7
	locals.v4 = 0
	locals.v3 = locals.v4
	-- impossible unresolved-key write removed
	repeat
		locals.v5 = upvalues[0].round
		locals.v6 = upvalues[0].lerp
		locals.v7 = locals.v1.r
		locals.v11 = locals.v3
		locals.v8 = locals.v8(locals.v9, locals.v10, locals.v11)
		locals.v7 = locals.v7()
		locals.v8 = upvalues[0].round
		locals.v9 = upvalues[0].lerp
		locals.v10 = locals[t8].a
		locals.v11 = locals.v2.a
	until true
end

recovered.alpha_modulate_p107 = function(upvalues, argument_1, argument_2, ...)
  local value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_12, value_18, value_19
	local t4
	value_1 = argument_1
	value_2 = argument_2
	value_3 = upvalues[0].new
	value_4 = value_1.r
	value_19 = 59
	if not (value_19) then
		value_19 = 239
	end
	value_19 = value_19 + 29540
	value_19 = value_19 - 29567
	value_12[25] = value_19
	value_18[71] = 8
	value_5 = value_1.g
	value_6 = value_1.b
	value_7 = upvalues[1].clamp
end

recovered.andromeda_velocity_p108 = function(upvalues, argument_1, argument_2, argument_3, ...)
	local locals = make_locals()
	locals.v1 = argument_1
	locals.v2 = argument_2
	locals.v3 = argument_3
	locals.v4 = upvalues[0]
	locals.v5 = locals.v1
	locals.v6 = "Smooth"
	locals.v4 = locals.v4(locals.v5, locals.v6)
	locals.v4 = upvalues[1][23]()
	locals.v5 = upvalues[1][47]
	locals.v6 = locals.v2
	locals.v16 = "m_vecVelocity"
	locals.v5 = locals.v5(locals.v6, locals.v7)
	locals.v7 = type
	locals.v8 = locals.v5
	locals.v7 = locals.v7(locals.v8)
	locals.v7 = locals.v7 == "number"
	if locals.v7 then
		locals.v7 = locals.v5
	end
	locals.v7 = 0
	locals.v5 = locals.v7
	locals.v7 = type
	locals.v8 = locals.v6
	locals.v7 = locals.v7(locals.v8)
	locals.v7 = locals.v7 == "number"
	if locals.v7 then
		locals.v7 = locals.v6
	end
	if not (locals.v7) then
		locals.v7 = 0
	end
	locals.v6 = locals.v7
	locals.v7 = upvalues[1][155]
	locals.v8 = locals.v5 * locals.v5
	locals.v9 = locals.v6 * locals.v6
	locals.v8 = locals.v8 + locals.v9
	locals.v7 = locals.v7(unpack_locals(locals, 8, 185))
	if not (locals.v7 >= 0.1) then
		locals.v7 = 0
	end
	locals.v8 = {}
	locals.v9 = {}
	locals.v8.layers = locals.v9
	locals.v8.tick = locals.v4
	locals.v9 = upvalues[1][30]
	locals.v9 = locals.v9 == 1
	locals.v8.ducking = locals.v9
	locals.v9 = bit.band
	locals.v10 = upvalues[1][47]
	locals.v11 = locals.v2
	locals.v12 = "m_fFlags"
	locals.v10 = locals.v10(locals.v11, locals.v12)
	if not (locals.v10) then
		locals.v10 = 0
	end
	locals.v11 = 1
	locals.v9 = locals.v9(locals.v10, locals.v11)
	locals.v9 = locals.v9 == 1
	locals.v8.on_ground = locals.v9
	repeat
		locals.v9 = locals.v9(locals.v10, locals.v11)
	until locals.v9
	locals.v8.duck_amount = locals.v9
	locals.v9 = upvalues[1][37]
	locals.v10 = locals.v2
	locals.v9 = locals.v9(locals.v10)
	-- Luraph junk / invalid SSA expression removed
end

recovered.apply_smooth_animfix_p109 = function(upvalues, argument_1, argument_2, ...)
	local value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_8, value_9, value_10
	local value_11, value_12, value_13, value_14, value_25
	value_1 = argument_1
	value_2 = argument_2
	value_3 = upvalues[0]
	value_4 = value_1
	value_5 = "Smooth"
	value_3 = value_3(value_4, value_5)
	if value_3 then
		return
	end
	while value_5 == nil do
	end
	value_6 = value_5.time
	value_7 = value_4.time
	value_6 = value_6 - value_7
	value_7 = upvalues[2].clamp
	value_8 = upvalues[3][30]()
	value_9 = value_4.time
	value_8 = value_8 - value_9
	value_8 = value_8 / value_6
	value_9 = 0
	value_10 = 1
	local t13 = {parent = nil, index = nil, step = nil, limit = nil}
	repeat
		local t19 = value_8(nil, t18)
		value_10 = t24
		value_9 = t19
		local t18 = t19
		value_8 = upvalues[2].lerp
		value_9 = value_4.velocity
		value_10 = value_5.velocity
		value_25 = 41
		value_25 = 498
		value_11 = value_7
		value_8 = value_8(value_9, value_10, value_11)
		upvalues[1].last_velocity = value_8
		value_8 = value_8(value_9, value_10, value_11)
		upvalues[1].last_duck_amount = value_8
		value_8 = value_4.weapon
		upvalues[1].last_weapon = value_8
		do return end
		value_11 = value_2
		value_10 = value_2.get_anim_overlay
		value_12 = value_9
		value_10 = value_10(value_11, value_12)
		value_11 = value_4.layers
		value_11 = value_11[value_9]
		value_12 = value_5.layers
		value_12 = value_12[value_9]
	until true
	value_13 = value_4.weapon
	value_14 = value_5.weapon
	t5, t6, t7 = 13, upvalues, 4185
	value_10.cycle = value_13
	value_13 = value_12.weight
	value_10.weight = value_13
end

recovered.pre_render_p110 = function(upvalues, ...)
  local value_0, value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_8, value_18
  local value_19, value_20, value_21, value_22, value_23
	value_1 = upvalues[0]()
	value_2 = value_1.enabled
	value_3 = value_1.enabled
	-- Luraph junk / invalid SSA expression removed
	value_3 = value_3(value_4)
	if (not value_3) then
		return
	end
	value_2 = upvalues[2]()
	if value_2 == value_0 then
		return
	end
	local t4 = nil
	value_4 = value_2
	value_3 = value_3(value_4)
	value_4 = not value_3
	if not (value_4) then
		value_4 = value_4(value_5, value_6)
	end
	value_5 = value_4
	if value_5 then
		value_5 = upvalues[5]
		value_6 = value_2
		value_5 = value_5(value_6)
	end
	if not (value_5) then
	end
	if not (value_5 == value_0) then
		value_6 = upvalues[1].apply_smooth_animfix
		value_7 = value_1
		value_8 = value_5
		value_6(value_7, value_8)
	end
	value_19 = math_helpers[7]
	value_20 = "g\181"
	value_19 = value_19(value_20)
	if not (value_19) then
		value_19 = 192
	end
	value_20 = math_helpers[10]
	value_21 = "\185\157\157\127"
	value_22 = 3
	value_20 = value_20(value_21, value_22, value_23)
	value_19 = value_19 - value_20
	value_19 = value_19 + 13292
	value_19 = value_19 - 13326
	value_18[143] = value_19
	value_18[82] = 30
	if value_3 then
		value_6 = upvalues[1].apply_ground_legs
		value_7 = value_1
		value_8 = value_2
		value_6(value_7, value_8)
	end

	return
end

recovered.andromeda_capture_smooth_state_p111 = function(upvalues, ...)
	local value_1, value_2, value_3, value_4, value_5, value_17
	value_1 = upvalues[0]()
	value_2 = value_1.enabled
	value_3 = value_1.enabled
	value_4 = value_3
	value_3 = value_3.get(value_4)
	value_2 = upvalues[1]()
	value_3 = upvalues[2]
	value_4 = value_1
	value_5 = "Smooth"
	value_3 = value_3(value_4, value_5)
	if value_3 then
		if value_17 then
			value_17 = 157
		end
		if not (value_17) then
			value_17 = 135
		end
	end
	return
end

recovered.andromeda_gsub_p112 = function(upvalues, argument_1, ...)
	local value_1, value_2, value_3, value_4, value_5, value_6
	value_1 = argument_1
	value_2 = type
	value_3 = value_1
	value_2 = value_2(value_3)
	if value_2 ~= "string" then
		return value_2
	end
	value_5(value_6)
	value_2 = value_2(value_3, value_4, value_5)
	value_1 = value_2
	value_2 = value_1 ~= ""
	if value_2 then
		value_2 = value_1
	end
	if not (value_2) then
		value_2 = nil
	end
	return value_2
end

recovered.andromeda_writefile_p113 = function(upvalues, argument_1, ...)
  local value_0, value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_8, value_9
  local value_10, value_11, value_12, value_14, value_19, value_20, value_21
	local t12
	value_1 = argument_1
	value_21 = 236
	if not (value_21) then
		value_21 = 401
	end
	local t20 = {...}
		value_1 = t20[1]
	if value_1 == value_0 then
		return value_20
	end
	repeat
		repeat
			local t13 = t13 + nil
			value_5 = t13
			if (nil > 0 or t13 + nil < nil) and (nil <= 0 or t13 + nil > nil) then
				value_2 = upvalues[0].icon_assets
				value_2 = value_2[value_1]
				value_4 = value_2
				value_3 = value_3(value_4)
				if value_3 ~= "string" then
					return value_3
				elseif value_2 == "" then
					value_19 = upvalues[0].icon_path_prefixes
					value_6 = value_6[value_5]
					value_7 = readfile
					value_8 = value_6 .. value_1
					value_7 = value_7(value_8)
					value_8 = type
					value_9 = value_7
					value_8 = value_8(value_9)
					if value_7 ~= "" then
						value_8 = value_7
						return value_8
					end
					value_12 = "\\"
					value_9 = value_9(value_10, value_11, value_12)
				end
				break
			end
			value_6 = value_14 < nil
			value_8 = value_8(value_9)
			value_7 = value_8
			value_8 = type
			value_9 = value_7
			value_8 = value_8(value_9)
		until value_8 ~= "string"
	until value_7 == ""
	value_8 = value_7
	return value_8
end

recovered.andromeda_get_gradient_alpha_p114 = function(upvalues, argument_1, argument_2, argument_3, argument_4, argument_5, ...)
	local value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_8, value_9, value_10
	local value_11, value_12
	value_1 = argument_1
	value_2 = argument_2
	value_3 = argument_3
	value_4 = argument_4
	value_5 = argument_5
	value_6 = upvalues[0][154]
	value_7 = upvalues[1].get_gradient_alpha()
	value_8 = value_5
	if not (value_8) then
		value_8 = 1
	end
	value_7 = value_7 * value_8
	value_7 = value_7 + 0.5
	value_6 = value_6(value_7)
	value_7 = upvalues[2]
	value_8 = value_1
	value_9 = value_2
	value_10 = value_3
	value_11 = value_4
	value_12 = value_6
	value_7(value_8, value_9, value_10, value_11, value_12)
	return
end

recovered.andromeda_function_p115 = function(upvalues, ...)
	local value_10, value_11
	value_10 = math_helpers[8]
	value_11 = math_helpers[6]
	value_10 = value_10(value_11)
end

recovered.andromeda_rep_p116 = function(upvalues, ...)
	local value_1, value_2, value_4, value_5, value_6, value_7, value_8, value_9, value_10
	value_1 = string.byte
	value_2 = string.rep
	value_4 = value_2
	value_5 = " "
	value_6 = 8
	value_4 = value_4(value_5, value_6)
	value_5 = bind(recovered.andromeda_function_4_p119, {})
	value_6 = bind(recovered.andromeda_function_5_p120, {})
	value_7 = bind(recovered.andromeda_function_6_p121, {[0] = value_1, [1] = value_4, [2] = value_5})
	value_8 = bind(recovered.andromeda_function_2_p117, {[0] = value_7, [1] = value_6})
	value_9 = bind(recovered.andromeda_function_3_p118, {[0] = value_7, [1] = value_5, [2] = value_8, [3] = value_6})
	while true do
		value_10 = value_9()
		if not value_10 then break end
		value_10 = value_9
		value_10()
	end
	return
end

recovered.andromeda_function_2_p117 = function(upvalues, ...)
	local value_18, value_19
	repeat
		value_18 = math_helpers[7]
		value_19 = "\019\\"
		value_18 = value_18(value_19)
	until true
end

recovered.andromeda_function_3_p118 = function(upvalues, ...)
	local locals = make_locals()
	local t7 = 0
	local t9 = {}
	locals.v1 = 1
	locals.v2 = upvalues[0]()
	locals.v3 = 1
	local t21 = {}
	t21.parent = nil
	t21.index = nil
	t21.step = nil
	t21.limit = nil
	local t11 = t21
	local t13 = locals.v2
	local t14 = locals.v3
	local t12 = locals.v1 - t14 + t14
	locals.v4 = t12
	if (locals.v3 > 0 or locals.v1 - locals.v3 + locals.v3 < locals.v2) and (locals.v3 <= 0 or locals.v1 - locals.v3 + locals.v3 > locals.v2) then
		locals.v1 = upvalues[1]
		locals.v2 = upvalues[2]()
		locals.v3 = upvalues[0]()
		return locals.v1(unpack_locals(locals, 2, t7))
	end
	repeat
		t12 = t12 + t14
		locals.v9 = t12
	until true
	if t14 <= 0 or t12 > t13 then
		local t4 = t4[0]
		local t5
		locals.v6 = 1
		locals.v7 = upvalues[0]()
		locals.v8 = 1
		t11 = {parent = t11, index = t12, step = t14, limit = t13}
		t13 = locals.v7
		t12 = locals.v6 - locals.v8
		repeat
			t12 = t12 + t14
			locals.v9 = t12
			t11 = t11.parent
			t14 = t11.step
			t13 = t11.limit
			t12 = t11.index
			locals.v10 = 0
			locals.v11 = 255
			locals.v12 = 1
			t21 = {}
			t21.parent = t11
			t21.index = t12
			t21.step = t14
			t21.limit = t13
			t11 = t21
			t13 = locals.v11
			t12 = locals.v10 - locals.v12
			t12 = t12 + t14
			locals.v13 = t12
		until true
		locals.v14 = upvalues[2]()
		locals.v14 = upvalues[0]()
		locals.v15 = upvalues[2]()
		locals.v15 = locals.v5[locals.v15]
		locals.v17 = upvalues[2]()
		locals.v15 = locals.v15(unpack_locals(locals, 16, t7))
		locals.v26 = 200
		locals.v26 = 501
		locals.v26 = locals.v26 - 440
		locals.v26 = locals.v26 + 30061
		locals.v26 = locals.v26 - 29713
		locals.v19[83] = locals.v26
		locals.v25[38] = 77
		locals.v15 = upvalues[2]()
		locals.v15 = upvalues[2]
		locals.v16 = locals.v16()
		locals.v14 = locals.v14(unpack_locals(locals, 15, t7))
		locals.v15 = {}
	end
end

recovered.andromeda_function_4_p119 = function(upvalues, argument_1, argument_2, ...)
  local value_0, value_1, value_2, value_3, value_4, value_5, value_6, value_7
	value_1 = argument_1
	value_2 = argument_2
	value_3 = 1
	value_0 = value_4 <= 0
	while value_1 > 0 do
		if value_2 <= 0 then
			break
		end
		value_4 = value_4 + value_3
		value_7 = value_1 - value_5
		value_1 = value_7 / 2
		value_7 = value_2 - value_6
		value_2 = value_7 / 2
	end
	if not (value_1 >= value_2) then
		value_1 = value_2
	end
	while value_1 > 0 do
		value_4 = value_4 + value_3
		-- Luraph junk / invalid SSA expression removed
		value_1 = value_6 / 2
		value_3 = value_3 * 2
	end
	value_5 = value_4
	return value_5
end

recovered.andromeda_function_5_p120 = function(upvalues, argument_1, argument_2, argument_3, ...)
  local value_1, value_2, value_3, value_4, value_5, value_6, value_9, value_15, value_16
	value_1 = argument_1
	value_2 = argument_2
	value_3 = argument_3
	if not (value_16) then
		value_16 = 385
	end
	value_16 = value_16 + 17604
	value_16 = value_16 - 17595
	value_9[75] = value_16
	value_15[28] = 63
	value_4 = value_2 - 1
	value_4 = 2 ^ value_4
	value_4 = value_1 / value_4
	value_5 = value_3 - 1
	value_6 = value_2 - 1
	value_5 = value_5 - value_6
	value_5 = value_5 + 1
	value_4 = value_4 % value_5
	value_5 = value_4 % 1
	value_5 = value_4 - value_5
	return value_5
end

recovered.andromeda_function_6_p121 = function(upvalues, ...)
	local value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_8, value_17
	value_1 = upvalues[0]
	value_2 = upvalues[1]
	value_3 = 1
	value_4 = 4
	value_1 = value_1(value_2, value_3, value_4)
	value_5 = upvalues[2]
	value_17 = 397
	if not (value_17) then
		value_17 = 480
	end
	value_6 = value_4
	value_7 = 64
	value_5 = value_5(value_6, value_7)
	value_8 = 8
	value_6 = value_6(value_7, value_8)
	value_5 = value_5 + value_6
	return value_5
end

recovered.andromeda_name_p122 = function(upvalues, argument_1, ...)
	local value_1, value_2, value_3
	value_1 = argument_1
	value_2 = value_1.name
	value_3 = upvalues[0]
	return
end

recovered.andromeda_rep_2_p123 = function(upvalues, ...)
	local value_1, value_2, value_4, value_5, value_6, value_9, value_10
	value_1 = string.byte
	value_2 = string.rep
	value_4 = value_2
	value_5 = " "
	value_6 = 8
	value_4 = value_4(value_5, value_6)
	value_5 = bind(recovered.andromeda_function_7_p124, {})
	value_6 = bind(recovered.andromeda_function_8_p125, {})
	value_10 = value_9
	value_10()
end

recovered.andromeda_function_7_p124 = function(upvalues, argument_1, argument_2, ...)
  local value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_14, value_16, value_17
	local t4
	value_1 = argument_1
	value_2 = argument_2
	value_3 = 1
	value_4 = 0
	while value_1 > 0 do
		if value_2 <= 0 then
			break
		end
		value_5 = value_1 % 2
		value_6 = value_2 % 2
		if not (value_5 == value_6) then
			if not (value_17) then
				value_17 = 159
			end
			value_17 = value_17 + 13727
			value_17 = value_17 - 13882
			value_14[32] = value_17
			value_16[22] = 31
		end
		value_7 = value_1 - value_5
		value_7 = value_2 - value_6
		value_2 = value_7 / 2
		value_3 = value_3 * 2
	end
	if not (value_1 >= value_2) then
		value_1 = value_2
	end
	while value_1 > 0 do
		value_5 = value_1 % 2
	end
	value_5 = value_4
	return value_5
end

recovered.andromeda_function_8_p125 = function(upvalues, argument_1, argument_2, argument_3, ...)
  local value_1, value_2, value_3, value_4, value_5, value_6, value_14, value_15, value_16, value_17
  local value_18, value_19, value_25
	local t5
	value_1 = argument_1
	value_2 = argument_2
	value_3 = argument_3
	value_25 = 1
	value_16 = value_16(value_17, value_18, value_19)
	value_17 = math_helpers[7]
	value_18 = "\143S\2442"
	value_17 = value_17(value_18)
	value_16 = value_16 - value_17
	value_16 = value_16 + 273
	value_16 = value_16 + 14436
	value_16 = value_16 - 14850
	value_14[80] = value_16
	value_15[2] = 52
	value_6 = value_2 - 1
	value_5 = value_5 - value_6
	value_5 = value_5 + 1
	value_5 = value_1 % value_5
	value_5 = value_5 >= value_4
	if not (value_5) then
		value_5 = 0
	end
	return value_5
end

recovered.andromeda_function_9_p126 = function(upvalues, ...)
  local value_0, value_3, value_4, value_5, value_6, value_7, value_10, value_16, value_17, value_18
	value_17 = 91
	if not (value_17) then
		value_17 = math_helpers[7]
		value_17 = value_17(value_18)
	end
	value_17 = value_17 - 36
	value_17 = value_17 + 20127
	value_17 = value_17 - 19970
	value_10[30] = value_17
	value_16[12] = 57
	value_5 = upvalues[2]
	value_6 = value_4
	value_7 = value_0 >= 64
	value_5 = value_5(value_6, value_7)
	value_5 = value_5 * 16777216
	value_6 = upvalues[2]
	value_7 = value_3
end

recovered.andromeda_function_10_p127 = function(upvalues, ...)
  local value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_8, value_20
	value_2 = value_2()
	value_3 = 1
	value_4 = upvalues[1]
	value_5 = value_2
	value_6 = 1
	value_7 = 20
	value_4 = value_4 + value_1
	value_5 = upvalues[1](value_6, value_7, value_8)
	value_6 = upvalues[1]
	value_7 = value_2
	value_8 = 32
	value_6 = value_6(value_7, value_8)
	value_6 = 1 ^ value_6
	value_6 = -value_6
	value_5 = 1
	value_3 = 0
	repeat
		value_7 = value_5 - 1023
	do return value_7 end
	until value_5 ~= 2047
	value_20 = value_4 == 0
	if value_7 then
		value_7 = value_6 * 1
		value_7 = value_7 / 0
	end
	if not (value_7) then
		value_7 = value_7 / 0
	end
	return value_7
end

recovered.andromeda_function_11_p128 = function(upvalues, ...)
  local value_0, value_1, value_2, value_3
	t9 = {...}
	value_1 = 1
	value_2 = upvalues[0]
	value_2 = value_2()
	value_3 = 1
	return value_0()
end

recovered.andromeda_function_12_p129 = function(upvalues, argument_1, argument_2, argument_3, argument_4, argument_5, argument_6, argument_7, argument_8, argument_9, argument_10, ...)
  local value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_8, value_9, value_10
  local value_11, value_12
	t19 = {...}
	value_1 = argument_1
	value_2 = argument_2
	value_3 = argument_3
	value_4 = argument_4
	value_5 = argument_5
	value_6 = argument_6
	value_7 = argument_7
	value_8 = argument_8
	value_9 = argument_9
	value_10 = argument_10
		value_1 = ({...})[1]
		value_2 = ({...})[2]
		value_3 = ({...})[3]
		value_4 = ({...})[4]
		value_5 = ({...})[5]
	value_6 = value_4 + value_1
	value_6 = value_6 - value_4
	value_6 = value_6 + value_4
	value_6 = value_6 + value_5
	value_6 = value_6 - 4966425099
	value_7 = value_5 >= value_1
	if value_7 then
		value_7 = value_3
	end
	if not (value_7) then
		value_7 = value_1
	end
	value_7 = value_7 + value_3
	value_7 = value_7 + value_2
	value_7 = value_7 < value_5
	if value_7 then
		value_7 = value_4
	end
	if not (value_7) then
		value_7 = value_1
	end
	value_7 = value_7 - value_5
	value_7 = value_7 - value_5
	value_7 = value_7 ~= value_3
	if value_7 then
		value_7 = value_4
	end
	if not (value_7) then
		value_7 = value_2
	end
	value_8 = value_8 + value_3
	value_8 = value_8 + value_7
	value_8 = value_8 - value_4
	value_8 = value_8 == value_2
	if value_8 then
		value_8 = value_5
	end
	if not (value_8) then
		value_8 = value_6
	end
	value_8 = value_8 - value_6
	value_8 = value_8 + value_4
	value_8 = value_8 - value_4
	value_8 = value_8 + value_7
	value_8 = value_8 - 1107389522
	value_9 = value_6 + value_2
	value_9 = value_8
	if not (value_9) then
		value_9 = value_3
	end
	value_9 = value_9 - value_1
	value_9 = value_9 - value_7
	value_9 = value_9 - value_8
	value_10 = value_10 - value_7
	value_10 = value_10 - value_7
	value_10 = value_10 - value_5
	local t19 = {...}
	local t18 = select("#", ...)
		value_1 = t19[1]
		value_2 = t19[2]
		value_3 = t19[3]
		value_4 = t19[4]
		value_5 = t19[5]
		value_6 = t19[6]
		value_7 = t19[7]
		value_8 = t19[8]
		value_9 = t19[9]
		value_10 = t19[10]
	value_10 = value_10 + value_9
	value_10 = value_10 + value_7
	value_10 = value_10 + value_3
	value_10 = value_10 + value_7
	value_10 = value_10 + 3688927203
	value_11 = 0
	value_12 = value_6 + value_8
	value_12 = value_12 + value_5
	value_12 = value_12 > value_1
	if value_12 then
		value_12 = value_5
	end
	if not (value_12) then
		value_12 = value_1
	end
	value_12 = value_5
	if not (value_12) then
		value_12 = value_3
	end
	value_12 = value_12 + value_8
	value_12 = value_12 - value_6
	value_12 = value_12 - value_2
	value_12 = value_12 >= value_6
	if not (value_12) then
		value_12 = value_1
	end
	value_12 = value_12 - value_3
	value_12 = value_12 - value_6
	value_12 = value_12 > value_9
	if value_12 then
		value_12 = value_8
	end
	if not (value_12) then
		value_12 = value_1
	end
	value_12 = value_12 ~= value_2
	if value_12 then
		value_12 = value_5
	end
	if not (value_12) then
		value_12 = value_10
	end
	value_12 = value_12 - value_4
	value_12 = value_12 + value_5
	value_12 = value_12 + value_8
	value_12 = value_12 - value_9
	value_5 = nil == nil
	value_12 = value_12 - value_10
	value_12 = value_12 + value_8
	if value_12 then
		value_12 = value_2
	end
	if not (value_12) then
		value_12 = value_9
	end
end

recovered.build_maps_p130 = function(upvalues, ...)
	local locals = make_locals()
	t9 = {...}
	for t24 = 1, 90 do
		locals[t24] = ({...})[t24]
	end
	locals.v2 = locals.v1.maps
	locals.v3 = {}
	locals.v2.antiaim = locals.v3
	locals.v2 = locals.v1.maps
	locals.v3 = {}
	local t3 = 5
	locals.v6 = upvalues[0].builder
	locals.v5.builder = locals.v6
	locals.v6 = upvalues[0].defensive
	locals.v5.defensive = locals.v6
	locals.v6 = locals.v1.maps.antiaim
	locals.v2(locals.v3, locals.v4, locals.v5, locals.v6)
	locals.v3 = locals.v1
	locals.v2 = locals.v1.add_handles
	locals.v4 = "visuals"
	locals.v5 = {}
	locals.v0.animations = locals.v6
	locals.v6 = upvalues[0].visuals.fast_ladder
	locals.v5.fast_ladder = locals.v6
	locals.v6 = upvalues[0].visuals.fps_optimization
	locals.v5.fps_optimization = locals.v6
	locals.v6 = upvalues[0].visuals.fps_optimization_options
	locals.v5.fps_optimization_options = locals.v6
	locals.v6 = locals.v1.maps.visuals
	locals.v2(locals.v3, locals.v4, locals.v5, locals.v6)
	locals.v3 = locals.v1
	locals.v2 = locals.v1.add_handles
	locals.v4 = "visuals.native_indicators"
	locals.v5 = {}
	locals.v6 = upvalues[0].visuals.stubs
	if locals.v6 then
		locals.v6 = upvalues[0].visuals
		t3 = 6
		locals.v6 = locals.v6.native_indicators
	end
	if not (locals.v6) then
	end
	locals.v5.enabled = locals.v6
	local t9 = {...}
	local t8 = select("#", ...)
	for t24 = 1, 129 do
		locals[t24] = t9[t24]
	end
	locals.v6 = locals.v6.stubs
	if locals.v6 then
		locals.v6 = upvalues[0].visuals.stubs.native_indicators_gradient
	end
	if not (locals.v6) then
	end
	locals.v6 = upvalues[0].visuals.stubs.watermark_cs2_gradient
	if not (locals.v6) then
		locals.v0 = upvalues[0][2][upvalues[0][1]][locals.v6]
	end
	locals.v5.watermark_gradient = locals.v6
	locals.v6 = upvalues[0].visuals.stubs
	if locals.v6 then
		locals.v0 = nil < "visuals"
		locals.v6 = locals.v6.stubs.watermark_position
	end
	if not (locals.v6) then
	end
	locals.v5.watermark_position = locals.v6
	locals.v6 = upvalues[0].visuals.stubs
	if locals.v6 then
		locals.v6 = upvalues[0].visuals.stubs.watermark_accent_color
	end
	if not (locals.v6) then
	end
	locals.v2(locals.v3, locals.v4, locals.v5, locals.v6)
	return
end

recovered.andromeda_segments_p131 = function(upvalues, argument_1, argument_2, ...)
	local value_1, value_2, value_3, value_4, value_5, value_6, value_7
	value_1 = argument_1
	value_2 = argument_2
	value_3 = 0
	value_4 = 0
	value_5 = 1
	value_6 = value_1.segments
	value_6 = #value_6
	value_7 = 1
	local t13 = {parent = nil, index = nil, step = nil, limit = nil}
	value_5 = value_3
	value_6 = value_4
	return value_5, value_6
end

recovered.draw_background_p132 = function(upvalues, argument_1, argument_2, argument_3, argument_4, argument_5, ...)
	local locals = make_locals()
	locals.v1 = argument_1
	locals.v2 = argument_2
	locals.v3 = argument_3
	locals.v4 = argument_4
	locals.v5 = argument_5
	locals.v6 = upvalues[0][162]
	locals.v7 = upvalues[0][154]
	locals.v8 = locals.v3 * 0.28
	locals.v8 = locals.v8 + 0.5
	locals.v7 = locals.v7(locals.v8)
	locals.v8 = 42
	locals.v6 = locals.v6(locals.v7, locals.v8)
	locals.v7 = upvalues[0][151]
	locals.v8 = 0
	locals.v9 = locals.v6 * 2
	locals.v9 = locals.v3 - locals.v9
	locals.v7 = locals.v7(locals.v8, locals.v9)
	locals.v8 = upvalues[0][162]
	locals.v9 = 230
	locals.v10 = locals.v5 + 45
	locals.v8 = locals.v8(locals.v9, locals.v10)
	locals.v9 = upvalues[0][129]
	locals.v20 = 0
	locals.v21 = locals.v5
	locals.v22 = true
	locals.v9(locals.v10, locals.v11, locals.v12, locals.v13, locals.v14, locals.v15, locals.v16, locals.v17, locals.v18, locals.v19, locals.v20, locals.v21, locals.v22)
	if not (locals.v7 <= 0) then
		locals.v9 = upvalues[0][128]
		locals.v10 = locals.v1 + locals.v6
		locals.v11 = locals.v2
		locals.v12 = locals.v7
			locals.v13[1] = locals.v14
			locals.v13[2] = locals.v15
			locals.v13[3] = locals.v16
			locals.v13[4] = locals.v17
		locals.v14 = 0
		locals.v15 = 0
		locals.v16 = 0
		locals.v17 = locals.v5
		locals.v9(locals.v10, locals.v11, locals.v12, locals.v13, locals.v14, locals.v15, locals.v16, locals.v17)
	end
	locals.v9 = upvalues[0][129]
	locals.v10 = locals.v1 + locals.v6
	locals.v10 = locals.v10 + locals.v7
	locals.v11 = locals.v2
	locals.v12 = locals.v6
	locals.v13 = locals.v4
	locals.v14 = 0
	locals.v15 = 0
	locals.v16 = 0
	locals.v17 = locals.v5
	locals.v18 = 0
	locals.v19 = 0
	locals.v0 = 0 == nil
	locals.v21 = 0
	locals.v22 = true
	locals.v9(unpack_locals(locals, 10, 247))
	locals.v9 = upvalues[0][129]
	locals.v10 = locals.v1
	locals.v11 = locals.v2
	locals.v12 = locals.v6
	locals.v13 = 1
	locals.v14 = 0
	locals.v15 = 0
	locals.v16 = 0
	locals.v21 = 0
	locals.v18 = 0
	locals.v19 = 0
	locals.v20 = 0
	locals.v21 = locals.v8
	locals.v22 = true
	locals.v9(locals.v10, locals.v11, locals.v12, locals.v13, locals.v14, locals.v15, locals.v16, locals.v17, locals.v18, locals.v19, locals.v20, locals.v21, locals.v22)
	if not (locals.v7 <= 0) then
		locals.v9 = upvalues[0][128]
		locals.v10 = locals.v1 + locals.v6
		locals.v11 = locals.v2
		locals.v12 = locals.v7
		locals.v13 = 1
		locals.v14 = 0
		locals.v15 = 0
		locals.v16 = 0
		locals.v17 = locals.v8
		locals.v9(locals.v10, locals.v11, locals.v12, locals.v13, locals.v14, locals.v15, locals.v16, locals.v17)
		locals.v9 = upvalues[0][128]
		locals.v10 = locals.v1 + locals.v6
		locals.v11 = locals.v2 + locals.v4
		locals.v11 = locals.v11 - 1
		locals.v12 = locals.v7
		locals.v13 = 1
		locals.v14 = 0
		locals.v15 = 0
		locals.v16 = 0
		locals.v17 = locals.v8
		locals.v9(locals.v10, locals.v11, locals.v12, locals.v13, locals.v14, locals.v15, locals.v16, locals.v17)
	end
	locals.v9 = upvalues[0][129]
	locals.v10 = locals.v1 + locals.v6
	locals.v10 = locals.v10 + locals.v7
	locals.v11 = locals.v2
	locals.v12 = locals.v6
	locals.v13 = 1
	locals.v12 = locals.v6
	locals.v13 = 1
	locals.v14 = 0
	locals.v15 = 0
	locals.v16 = 0
	locals.v17 = 0
	locals.v18 = 0
	locals.v19 = 0
	locals.v20 = 0
	locals.v21 = locals.v8
	locals.v22 = true
	-- Luraph junk / invalid SSA expression removed
	locals.v9 = upvalues[0][129]
	locals.v10 = locals.v1 + locals.v6
	locals.v10 = locals.v10 + locals.v7
	locals.v11 = locals.v2 + locals.v4
	locals.v11 = locals.v11 - 1
	locals.v12 = locals.v6
	locals.v13 = 1
	locals.v14 = 0
	locals.v15 = 0
	locals.v16 = 0
	locals.v17 = locals.v8
	locals.v18 = 0
	locals.v19 = 0
	locals.v20 = 0
	locals.v21 = 0
	locals.v22 = true
	locals.v9(locals.v10, locals.v11, locals.v12, locals.v13, locals.v14, locals.v15, locals.v16, locals.v17, locals.v18, locals.v19, locals.v20, locals.v21, locals.v22)
	return
end

recovered.andromeda_defensive_yaw_delayed_state_p133 = function(upvalues, ...)
	local value_1
	value_1 = upvalues[0].defensive_yaw_delayed_state
	value_1.flicker = false
	value_1 = upvalues[0].defensive_yaw_delayed_state
	value_1.last_flick_at = 0
	return
end

recovered.andromeda_forward_p134 = function(upvalues, argument_1, ...)
  local value_1, value_2, value_13, value_14
	value_1 = argument_1
	if not (value_13) then
		value_13 = 177
	end
	value_13 = value_13 > 285
	if value_13 then
		value_13 = math_helpers[8]
		value_14 = math_helpers[6]
		value_13 = value_13(value_14)
	end
	value_13 = 435
	local t20 = {...}
		value_1 = t20[1]
	if not (value_1) then
		value_2 = upvalues[0][2][upvalues[0][1]].manual
	end
	value_2 = 0
	return value_2
end

recovered.andromeda_anti_backstab_p135 = function(upvalues, ...)
  local value_1, value_2, value_3, value_4, value_5, value_6, value_7
	value_1 = upvalues[0].antiaim.features.anti_backstab
	value_2 = value_1
	value_1 = value_1.get(value_2)
	if value_1 then
		value_2 = false
		return value_2
	else
		value_1 = false
		return value_1
	end
	value_2 = upvalues[2].closest_enemy()
	if (not value_2) then
		return value_4
	end
	value_4 = upvalues[1][37]
	value_5 = value_3
	value_4 = value_4(value_5)
	-- Luraph junk / invalid SSA expression removed
	value_6 = value_4
	value_5 = value_5(value_6)
	if value_5 ~= "CKnife" then
		return value_5
	end
	value_5 = entity.get_flag
	value_6 = value_3
	value_7 = "Hit"
	value_5 = value_5(value_6, value_7)
	if value_5 then
		value_7 = false
		return value_7
	else
		value_5 = false
		return value_5
	end
end

recovered.andromeda_k_d_p136 = function(upvalues, argument_1, argument_2, argument_3, argument_4, ...)
	local locals = make_locals()
	local t11 = 0
	locals.v1 = argument_1
	locals.v2 = argument_2
	locals.v3 = argument_3
	locals.v4 = argument_4
	locals.v9 = 0
	locals.v10 = upvalues[2][154]
	locals.v11 = upvalues[2][67]()
	locals.v11 = locals.v11 * 1000
	locals.v11 = locals.v11 + 0.5
	locals.v10 = locals.v10(locals.v11)
	locals.v8 = locals.v8(unpack_locals(locals, 9, t11))
	locals.v9 = upvalues[2][96]()
	locals.v12 = upvalues[4]
	locals.v13 = upvalues[2][32]()
	locals.v12 = locals.v12(unpack_locals(locals, 13, t11))
	locals.v13 = {}
	locals.v14 = 242
	locals.v15 = 242
	locals.v16 = 242
	locals.v17 = 248
		locals.v13[1] = locals.v14
		locals.v13[2] = locals.v15
		locals.v13[3] = locals.v16
		locals.v13[4] = locals.v17
	locals.v14 = {}
	locals.v15 = 217
	locals.v16 = 217
	locals.v17 = 217
	locals.v18 = 238
		locals.v14[1] = locals.v15
		locals.v14[2] = locals.v16
		locals.v14[3] = locals.v17
		locals.v14[4] = locals.v18
	locals.v15 = locals.v3
	if not (locals.v15) then
		locals.v15 = {}
		locals.v16 = 186
		locals.v17 = 255
		locals.v18 = 15
		locals.v19 = 255
			locals.v15[1] = locals.v16
			locals.v15[2] = locals.v17
			locals.v15[3] = locals.v18
			locals.v15[4] = locals.v19
	end
	locals.v3 = locals.v15
	locals.v15 = {}
	locals.v16 = {}
	locals.v16.text = "game"
	locals.v16.color = locals.v13
	locals.v16.gap = 0
	locals.v17 = {}
	locals.v17.text = "sense"
	locals.v17.color = locals.v3
	locals.v18 = locals.v6
	locals.v19 = 13
	locals.v18 = locals.v18(locals.v19)
	locals.v17.gap = locals.v18
		locals.v15[1] = locals.v16
		locals.v15[2] = locals.v17
	locals.v16 = bind(recovered.andromeda_gap_p139, {[0] = locals.v15, [1] = {[1] = 3, [2] = locals}, [2] = locals.v6, [3] = locals.v14})
	locals.v17 = upvalues[5]
	locals.v18 = locals.v1
	locals.v19 = "FPS"
	locals.v17 = locals.v17(locals.v18, locals.v19)
	locals.v17 = upvalues[5]
	locals.v18 = locals.v1
	locals.v19 = "Ping"
	locals.v17 = locals.v17(locals.v18, locals.v19)
	if locals.v17 then
		locals.v17 = locals.v16
		locals.v18 = locals.v8
		locals.v19 = "PING"
		locals.v17(locals.v18, locals.v19)
	end
	locals.v17 = upvalues[5]
	locals.v18 = locals.v1
	locals.v19 = "K/D ratio"
	locals.v17 = locals.v17(locals.v18, locals.v19)
	if not locals.v17 then
	elseif locals.v12 == locals.v0 then
	else
		locals.v17 = locals.v16
		locals.v18 = string.format
		locals.v19 = "%.1f"
		locals.v20 = locals.v12
		locals.v18 = locals.v18(locals.v19, locals.v20)
		locals.v19 = "K/D"
		locals.v17(locals.v18, locals.v19)
	end
	locals.v17 = upvalues[5]
	locals.v18 = locals.v1
	locals.v19 = "Clock"
	locals.v17 = locals.v17(locals.v18, locals.v19)
	if locals.v17 then
		locals.v58 = 108
		if not (locals.v58) then
			locals.v58 = 53
		end
		locals.v58 = locals.v58 + 39
		locals.v58 = locals.v58 + 14454
		locals.v58 = locals.v58 - 14586
		locals.v55[236] = locals.v58
		locals.v57[483] = 235
		if not (locals.v21) then
			locals.v21 = 0
		end
		locals.v22 = locals.v10
		if not (locals.v22) then
			locals.v22 = 0
		end
		locals.v23 = locals.v11
		if not (locals.v23) then
			locals.v23 = 0
		end
	end
	repeat
		locals.v17 = 0
		locals.v18 = 0
		locals.v19 = 1
		locals.v20 = locals_length(locals)[15]
		locals.v21 = 1
		local t15 = {parent = nil, index = nil, step = nil, limit = nil}
		local t17 = locals.v20
		local t18 = locals.v21
		local t16 = locals.v19 - t18
	until true
	repeat
		t16 = t16 + t18
		locals.v22 = t16
		t15 = t15.parent
		t18 = t15.step
		t17 = t15.limit
		t16 = t15.index
		locals.v19 = locals.v6
		locals.v20 = 34
		locals.v19 = locals.v19(locals.v20)
		locals.v19 = locals.v17 + locals.v19
		locals.v20 = locals.v6
		locals.v21 = 20
		locals.v20 = locals.v20(locals.v21)
		locals.v58 = math_helpers[7]
		locals.v59 = "\128\172"
		locals.v58 = locals.v58(locals.v59)
		locals.v58 = 304
		locals.v58 = locals.v58 + 111
		locals.v58 = locals.v58 + 26126
		locals.v58 = locals.v58 - 26535
		locals.v55[450] = locals.v58
		locals.v57[413] = 135
		local t26 = 61
		local t27 = 1
		locals.v24 = "Top Center"
		locals.v25 = locals.v5
		locals.v21 = locals.v21(locals.v22, locals.v23, locals.v24, locals.v25)
		locals.v23 = upvalues[2][151]
		locals.v24 = 1
		locals.v25 = locals.v12(locals.v26)
		locals.v23 = locals.v23(unpack_locals(locals, 24, t11))
		locals.v24 = upvalues[2][151]
		locals.v25 = locals.v6
		locals.v26 = 8
		locals.v25 = locals.v25(locals.v26)
		locals.v26 = upvalues[2][154]
		locals.v27 = locals.v19 * 0.08
		locals.v27 = locals.v27 + 0.5
		locals.v26 = locals.v26(locals.v27)
		locals.v24 = locals.v24(unpack_locals(locals, 25, t11))
		locals.v25 = upvalues[2][162]
		locals.v26 = locals.v24
		locals.v27 = upvalues[2][154]
		locals.v28 = locals.v19 * 0.5
		locals.v27 = locals.v27(locals.v28)
		locals.v25 = locals.v25(unpack_locals(locals, 26, t11))
		locals.v24 = locals.v25
		locals.v25 = upvalues[2][151]
		locals.v26 = 0
		locals.v27 = locals.v24 * 2
		locals.v27 = locals.v19 - locals.v27
		locals.v25 = locals.v25(locals.v26, locals.v27)
		locals.v26 = locals.v22 + locals.v23
		locals.v27 = upvalues[2][151]
		locals.v28 = upvalues[7].clamp
		locals.v29 = upvalues[2][154]
		locals.v30 = locals.v4
		locals.v30 = 110
		locals.v30 = locals.v30 + 0.5
		locals.v29 = locals.v29(locals.v30)
		locals.v30 = 0
		locals.v31 = 255
		locals.v28 = locals.v28(locals.v29, locals.v30, locals.v31)
		t27 = {}
		t27[0] = upvalues[2]
		t27[1] = locals.v21
		local t28 = {}
		t28[1] = 24
		t28[2] = locals
		t27[2] = t28
		t27[3] = locals.v23
		t27[4] = locals.v25
		locals.v29 = bind(recovered.andromeda_function_13_p137, t27)
		locals.v30 = locals.v29
		locals.v31 = locals.v22
		locals.v30(locals.v31)
		locals.v30 = upvalues[2][129]
		locals.v31 = locals.v21
		locals.v32 = locals.v26
		locals.v33 = locals.v24
		locals.v34 = locals.v27
		locals.v35 = 0
		locals.v36 = 0
		locals.v37 = 0
		locals.v38 = 0
		locals.v39 = 0
		locals.v40 = 0
		locals.v41 = 0
		locals.v42 = locals.v28
		locals.v43 = true
		locals.v30(locals.v31, locals.v32, locals.v33, locals.v34, locals.v35, locals.v36, locals.v37, locals.v38, locals.v39, locals.v40, locals.v41, locals.v42, locals.v43)
		locals.v34 = locals.v27
		locals.v35 = 0
		locals.v36 = 0
		locals.v37 = 0
		locals.v38 = locals.v28
		locals.v30(locals.v31, locals.v32, locals.v33, locals.v34, locals.v35, locals.v36, locals.v37, locals.v38)
		locals.v30 = upvalues[2][129]
		locals.v31 = locals.v21 + locals.v24
		locals.v31 = locals.v31 + locals.v25
		locals.v32 = locals.v26
		locals.v33 = locals.v24
		locals.v34 = locals.v27
		locals.v35 = 0
		locals.v36 = 0
		locals.v37 = 0
		locals.v38 = locals.v28
		locals.v39 = 0
		locals.v40 = 0
		locals.v41 = 0
		locals.v42 = 0
		locals.v43 = true
		locals.v30(locals.v31, locals.v32, locals.v33, locals.v34, locals.v35, locals.v36, locals.v37, locals.v38, locals.v39, locals.v40, locals.v41, locals.v42, locals.v43)
		locals.v30 = locals.v29
		locals.v31 = locals.v22 + locals.v20
		locals.v31 = locals.v31 - locals.v23
		locals.v30(locals.v31)
		do return end
		locals.v23 = locals.v15[locals.v22]
		locals.v24 = upvalues[2][136]
		locals.v25 = locals.v23.flags
		locals.v26 = locals.v23.text
		locals.v24 = locals.v24(locals.v25, locals.v26)
		locals.v26 = locals.v24
		locals.v26 = 0
		locals.v26 = locals.v17 + locals.v26
		locals.v27 = locals.v23.gap
		locals.v17 = locals.v26 + locals.v27
		locals.v26 = upvalues[2][151]
		locals.v27 = locals.v18
		locals.v28 = locals.v25
	until true
	locals.v28 = 0
	locals.v17 = locals_length(locals)[15]
end

recovered.andromeda_function_13_p137 = function(upvalues, argument_1, ...)
	local value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_8, value_9, value_10
	local value_11, value_12, value_13, value_14, value_15
	value_1 = argument_1
	value_2 = upvalues[0][129]
	value_3 = upvalues[1]
	value_4 = value_1
	value_5 = upvalues[2][2][upvalues[2][1]]
	repeat
		value_10 = 0
		value_11 = 0
		value_12 = 0
		value_2(value_3, value_4, value_5, value_6, value_7, value_8, value_9, value_10, value_11, value_12, value_13, value_14, value_15)
		value_2 = upvalues[4]
	until value_2 <= 0
	value_2 = upvalues[0][129]
	value_1 = not nil
	value_4 = upvalues[2][2][upvalues[2][1]]
	value_3 = value_3 + value_4
	value_4 = upvalues[4]
	value_3 = value_3 + value_4
	value_5 = upvalues[2][2][upvalues[2][1]]
	value_6 = upvalues[3]
	value_7 = 0
	value_2(value_3, value_4, value_5, value_6, value_7, value_8, value_9, value_10, value_11, value_12, value_13, value_14, value_15)
	return
end

recovered.andromeda_function_14_p138 = function(upvalues, argument_1, argument_2, argument_3, argument_4, argument_5, argument_6, argument_7, argument_8, argument_9, argument_10, argument_11, argument_12, argument_13, ...)
  local value_0, value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_8, value_9
  local value_10, value_11, value_12, value_13, value_14, value_15, value_16
	value_1 = argument_1
	value_2 = argument_2
	value_3 = argument_3
	value_4 = argument_4
	value_5 = argument_5
	value_6 = argument_6
	value_7 = argument_7
	value_8 = argument_8
	value_9 = argument_9
	value_10 = argument_10
	value_11 = argument_11
	value_12 = argument_12
	value_13 = argument_13
	value_13 = 308
	if not (value_13) then
		value_13 = math_helpers[10]
		value_0 = "\167"
		value_15 = 1
		value_16 = 1
		value_13 = value_13(value_14, value_15, value_16)
	end
	value_13 = value_13 + 89
	value_13 = value_13 + 12371
	value_13 = value_13 - 12765
	value_11[55] = value_13
	value_12[32] = 20
	value_2 = upvalues[0][154]
	value_3 = upvalues[1]
	value_4 = value_1 * value_3
	value_3 = value_3 + 0.5
	return value_2(value_3)
end

recovered.andromeda_gap_p139 = function(upvalues, argument_1, argument_2, ...)
	local value_1, value_2, value_5, value_6, value_15, value_16
	value_1 = argument_1
	value_2 = argument_2
	value_15 = math_helpers[5]
	value_16 = math_helpers[6]
	-- Luraph junk / invalid SSA expression removed
	if not (value_15) then
		value_15 = 227
	end
	value_5 = upvalues[2]
	value_6 = 11
	value_5 = value_5(value_6)
end

recovered.paint_ui_p140 = function(upvalues, ...)
  local value_0, value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_8, value_9
  local value_10, value_20, value_27, value_29
	value_20 = 40
	if not (value_20) then
		value_20 = 157
	end
	value_1 = upvalues[0].skip_native_cleanup()
	if not value_1 then
		return
	end
	value_1 = upvalues[2].visuals
	local t11 = {parent = nil, index = nil, step = nil, limit = nil}
	local t13 = value_2
	local t12 = value_1 - value_3
	if not (value_1 == value_0) then
		value_2 = value_1.watermark
		if not (value_2 == value_0) then
			value_27[114] = 3
			value_29[114] = 1
			value_29[127] = 113
		end
	end
	do return end
	value_2 = value_1.watermark_style
	value_2 = value_2 ~= value_0
	if value_2 then
		value_2 = value_1.watermark_style
		value_3 = value_2
		value_2 = value_2.get(value_3)
	end
	if not (value_2) then
		value_2 = "CS2"
	end
	value_3 = value_1.watermark_position
	value_3 = value_3 ~= value_0
	value_3 = value_1.watermark_position
	value_4 = value_3
	value_3 = value_3.get
	if value_0 > nil then
	end
	if not (value_3) then
		value_3 = "Top Right"
	end
	if value_2 == "Supremacy" then
		return
	end
	value_4 = upvalues[4]
	value_5 = value_1.watermark_accent_color
	value_6 = {}
	local t3 = 7
	value_8 = 255
	value_9 = 15
	value_10 = 255
		value_6[232] = value_7
		value_6[233] = value_8
		value_6[234] = value_9
		value_6[235] = value_10
	value_4 = value_4(value_5, value_6)
	value_5 = value_1.watermark_cs2_gradient
	value_5 = value_5 ~= value_0
	if value_5 then
		value_5 = value_1.watermark_cs2_gradient
		value_6 = value_5
		value_5 = value_5.get(value_6)
	end
	-- Luraph junk / invalid SSA expression removed
	value_7 = value_1.watermark_display
	value_8 = value_3
	value_9 = value_4
	value_10 = value_5
	value_6(value_7, value_8, value_9, value_10)
	return
end

recovered.andromeda_m_fflags_p141 = function(upvalues, ...)
	local value_1, value_2, value_3, value_4
	value_1 = upvalues[0][32]()
	if value_1 then
		value_2 = upvalues[0][47]
		value_3 = value_1
		value_4 = "m_fFlags"
		value_2 = value_2(value_3, value_4)
		upvalues[1][2][upvalues[1][1]] = value_2
		return
	end
end

recovered.andromeda_m_ntickbase_p142 = function(upvalues, argument_1, ...)
	local value_1, value_2, value_3
	value_1 = argument_1
	value_2 = upvalues[0][32]()
	if value_2 then
		return value_3()
	end
end

recovered.andromeda_value_p143 = function(upvalues, argument_1, argument_2, ...)
	local value_1, value_2, value_3, value_4, value_5
	value_1 = argument_1
	value_2 = argument_2
	value_3 = value_1 ~= nil
	if value_3 then
		value_3 = value_1.options
		value_3 = value_3 ~= nil
	end
	if value_3 then
		value_3 = value_1.options
		value_4 = value_3
		value_3 = value_3.get
		value_5 = value_2
		value_3 = value_3(value_4, value_5)
		value_3 = value_3 == true
	end
	repeat
		if value_3 then
			value_3 = value_1[value_2]
			value_3 = value_3 ~= nil
		end
		if not value_3 then
			break
		end
	until value_2 >= value_1
	value_3 = value_3 ~= nil
	return value_3
end

recovered.andromeda_button_p144 = function(upvalues, argument_1, argument_2, argument_3, ...)
	local locals = make_locals()
	local t10 = 0
	locals.v1 = argument_1
	locals.v2 = argument_2
	locals.v3 = argument_3
	locals.v4 = type
	locals.v5 = locals.v3
	locals.v4 = locals.v4(locals.v5)
	locals.v4 = pairs
	locals.v5 = locals.v3
	locals.v4 = locals.v4(locals.v5)
	local t14 = {parent = nil, index = nil, step = nil, limit = nil}
	local t17 = locals.v6
	local t16 = locals.v5
	local t15 = locals.v4
	repeat
		local t20 = locals.v4(nil, t19)
		locals.v6 = t25
		locals.v5 = t20
		local t19 = t20
		do return end
		locals.v7 = locals.v2[locals.v5]
		locals.v8 = locals.v7.type
		locals.v9 = locals.v7.type
		locals.v8 = locals.v7.type
		locals.v9 = type
		locals.v10 = locals.v6
		locals.v9 = locals.v9(locals.v10)
		locals.v8 = {}
		locals.v10 = locals.v7.get_list
		locals.v11 = locals.v7
		locals.v10 = locals.v7.get_list(locals.v11)
		locals.v11 = type
		locals.v12 = locals.v10
		locals.v11 = locals.v11(locals.v12)
		locals.v11 = {}
		locals.v9 = locals.v11
		locals.v11 = 1
		t15 = t15 + t17
		locals.v14 = t15
		t14 = t14.parent
		t17 = t14.step
		t16 = t14.limit
		t15 = t14.index
		local t26 = {}
		local t27 = {}
		t27[1] = 9
		t27[2] = locals
		t26[0] = t27
		t26[1] = locals.v8
		locals.v10 = bind(recovered.andromeda_function_15_p145, t26)
		locals.v11 = locals_length(locals)[6]
		locals.v11 = 1
		locals.v12 = locals_length(locals)[6]
		locals.v13 = 1
		local t24 = {}
		t24.parent = t14
		t24.index = t15
		t24.step = t17
		t24.limit = t16
		t14 = t24
		t16 = locals.v12
		t17 = locals.v13
		t15 = locals.v11 - t17
		t15 = t15 + t17
		locals.v14 = t15
		t14 = t14.parent
		t17 = t14.step
		t16 = t14.limit
		t15 = t14.index
		locals.v11 = locals_length(locals)[8]
		locals.v12 = locals.v7
		locals.v11 = locals.v7.set
		locals.v13 = upvalues[0]
		locals.v14 = locals.v8
		locals.v13 = locals.v13(locals.v14)
		locals.v11(unpack_locals(locals, 12, t10))
		locals.v15 = locals.v10
		locals.v16 = locals.v6[locals.v14]
		locals.v15(locals.v16)
		locals.v11 = pairs
		locals.v12 = locals.v6
		locals.v11 = locals.v11(locals.v12)
		t24 = {}
		t24.parent = t14
		t24.index = t15
		t24.step = t17
		t24.limit = t16
		t14 = t24
		t20 = locals.v11(nil, t19)
		locals.v13 = t25
		locals.v12 = t20
		t19 = t20
		t14 = t14.parent
		t17 = t14.step
		t16 = t14.limit
		t15 = t14.index
		locals.v14 = locals.v10
		locals.v15 = locals.v12
		locals.v14(locals.v15)
		locals.v15 = type
		locals.v16 = locals.v10[locals.v14]
		locals.v15 = locals.v15(locals.v16)
		locals.v15 = locals.v10[locals.v14]
		locals.v9[locals.v15] = true
		locals.v8 = locals.v7.type
		locals.v9 = type
		locals.v10 = locals.v6
		locals.v9 = locals.v9(locals.v10)
		locals.v8 = locals.v6
		locals.v9 = type
		locals.v10 = locals.v8[1]
		locals.v9 = locals.v9(locals.v10)
		locals.v8 = locals.v8[1]
		locals.v10 = locals.v7
		locals.v9 = locals.v7.set
		locals.v11 = upvalues[0]
		locals.v12 = locals.v8
		locals.v11 = locals.v11(locals.v12)
		locals.v9(unpack_locals(locals, 10, t10))
		locals.v25 = 474
		locals.v25 = math_helpers[8]
		locals.v26 = math_helpers[6]
		locals.v25 = locals.v25(locals.v26)
		locals.v9 = type
		locals.v10 = locals.v6
		locals.v9 = locals.v9(locals.v10)
		t24 = false
		t24 = true
		locals.v8 = locals.v6 == true
		locals.v8 = "Always on"
		locals.v9 = 0
		locals.v10 = type
		locals.v11 = locals.v6
		locals.v10 = locals.v10(locals.v11)
		locals.v10 = 0
		locals.v9 = locals.v10
		locals.v10 = type
		locals.v11 = locals.v9
		locals.v10 = locals.v10(locals.v11)
		locals.v10 = tonumber
		locals.v11 = locals.v9
		locals.v10 = locals.v10(locals.v11)
		locals.v10 = 0
		locals.v9 = locals.v10
		locals.v10 = type
		locals.v11 = locals.v8
		locals.v10 = locals.v10(locals.v11)
		locals.v10 = tonumber
		locals.v11 = locals.v8
		locals.v10 = locals.v10(locals.v11)
		locals.v8 = locals.v10
		locals.v10 = type
		locals.v11 = locals.v8
		locals.v10 = locals.v10(locals.v11)
		locals.v8 = upvalues[1][locals.v8]
		locals.v10 = type
		locals.v11 = locals.v8
		locals.v10 = locals.v10(locals.v11)
		locals.v11 = locals.v7
		locals.v10 = locals.v7.set
		locals.v12 = locals.v8
		locals.v13 = locals.v9
		locals.v10(locals.v11, locals.v12, locals.v13)
		locals.v9 = locals.v7.type
		locals.v8 = locals.v6
		locals.v9 = type
		do return unpack_locals(locals, 184, t10) end
		do return end
		locals.v8 = locals.v7.type
		locals.v8 = locals.v6
		locals.v9 = type
		locals.v10 = locals.v8
		locals.v9 = locals.v9(locals.v10)
		t24 = false
		t24 = true
		locals.v8 = locals.v8 ~= 0
		locals.v9 = type
		locals.v10 = locals.v8
		locals.v9 = locals.v9(locals.v10)
		locals.v10 = locals.v7
		locals.v9 = locals.v7.set
		locals.v11 = locals.v8
		locals.v9(locals.v10, locals.v11)
		locals.v9 = type
		locals.v10 = locals.v8
		locals.v9 = locals.v9(locals.v10)
		locals.v10 = locals.v8
		locals.v9 = locals.v8.lower(locals.v10)
		locals.v8 = true
		locals.v8 = false
		locals.v8 = locals.v0
		locals.v8 = locals.v7.type
		locals.v8 = upvalues[2]
		locals.v9 = locals.v7
		locals.v10 = locals.v6
		locals.v11 = locals.v5
		locals.v8 = locals.v8(locals.v9, locals.v10, locals.v11)
		locals.v10 = locals.v7
		locals.v9 = locals.v7.set
		locals.v11 = locals.v8
		locals.v9(locals.v10, locals.v11)
		locals.v8 = type
		-- Luraph junk / invalid SSA expression removed
		locals.v8 = locals.v8(locals.v9)
		locals.v9 = locals.v7
		locals.v8 = locals.v7.set
		locals.v10 = locals.v6
		locals.v8(locals.v9, locals.v10)
		locals.v8 = type
		locals.v9 = locals.v6
		locals.v8 = locals.v8(locals.v9)
	until true
	locals.v9 = type
	locals.v10 = locals.v6
	locals.v9 = locals.v9(locals.v10)
end

recovered.andromeda_function_15_p145 = function(upvalues, argument_1, ...)
	local value_1, value_2, value_3
	value_1 = argument_1
	value_2 = type
	value_3 = value_1
	value_2 = value_2(value_3)
	value_2 = upvalues[0][2][upvalues[0][1]]
	value_3 = upvalues[0][2][upvalues[0][1]][value_1]
	if value_3 then
		upvalues[1][value_2] = value_1
		return
	end
end

recovered.andromeda_find_p146 = function(upvalues, argument_1, argument_2, ...)
  local value_0, value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_8, value_9
  local value_10, value_11, value_25, value_26
	value_1 = argument_1
	value_2 = argument_2
	if value_3 == "" then
		return value_4
	end
	value_5 = value_4 <= 143
	if not (value_5) then
		value_5 = value_4 == 222
	end
	if not (value_5) then
		value_5 = {}
	end
	value_8 = "antiaim"
	value_9 = 1
	value_10 = true
	value_6 = value_6(value_7, value_8, value_9, value_10)
	value_26 = value_3
	value_25 = value_3.find
	value_9 = "visuals"
	value_10 = 1
	value_11 = true
	value_7 = value_7(value_8, value_9, value_10, value_11)
	if value_0 >= value_6 then
		return value_6
	end
	value_6 = upvalues[2].unpack
	value_7 = value_3
	value_6 = value_6(value_7)
	value_7 = type
	value_8 = value_6
	value_7 = value_7(value_8)
	value_0 = value_7 <= value_0
	return value_3
end

recovered.andromeda_function_16_p147 = function(upvalues, argument_1, ...)
	local value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_8, value_18
	value_1 = argument_1
	value_18 = 457
	if not (value_18) then
		value_18 = 240
	end
	if value_2 == nil then
		return
	end
	if value_2 == value_3 then
		return
	else
		upvalues[0][value_1] = value_3
		value_6 = value_3
		value_7 = value_4
		value_8 = value_5
		return value_6, value_7, value_8
	end
end

recovered.reset_disable_fakelag_p148 = function(upvalues, ...)
  local value_1, value_2, value_10, value_11, value_12, value_24
	value_12 = value_12 - 8853
	value_10[52] = value_12
	value_11[49] = 53
	value_1 = upvalues[0].antiaim.fakelag
	value_1 = value_1.on.fakelag.variance
	value_2 = value_1
	value_1 = value_1.override
	value_2 = value_24
	value_1 = value_24.override
	value_1(value_2)
	return
end

recovered.is_player_standing_p149 = function(upvalues, ...)
  local value_0, value_1, value_2, value_3, value_4, value_5, value_6
	value_1 = upvalues[0][32]()
	do
		value_2 = false
		return value_2
	end
	value_2 = upvalues[1]
	value_3 = upvalues[0][47]
	value_4 = value_1
	value_0 = "m_vecVelocity" == nil
	value_2 = value_2()
	value_3 = upvalues[0][47]
	value_4 = value_1
	value_5 = "m_fFlags"
	value_3 = value_3(value_4, value_5)
	if not (value_3) then
		value_3 = 0
	end
	value_4 = bit.band
	value_5 = value_3
	value_4 = value_4(value_5, value_6)
	value_4 = value_4 == 1
	value_6 = value_2
	value_5 = value_2.length2d(value_6)
	value_5 = value_5 < 2
	if value_5 then
		value_4 = value_5 .. value_0
	end
	return value_5
end

recovered.andromeda_is_fake_duck_p150 = function(upvalues, argument_1, ...)
	local value_1, value_2, value_3, value_4, value_5, value_6
	local t3
	value_1 = argument_1
	value_3 = upvalues[1].is_fake_duck()
	value_4 = value_4(value_5, value_6)
	if value_4 then
		value_4 = upvalues[1].is_double_tap()
		if value_4 then
			-- Luraph junk / invalid SSA expression removed
		end
	end
	repeat
		repeat
			repeat
				if not value_3 then
				end
			do break end
			until true
			repeat
				do return end
				value_5 = value_2
				value_4 = value_2.get
				value_6 = "Hide Shots"
				value_4 = value_4(value_5, value_6)
				value_4 = upvalues[1].is_on_shot_antiaim
				value_5 = "no dt"
				value_4 = value_4(value_5)
				value_5 = value_1
				value_4 = value_1.is_player_standing(value_5)
			until true
			value_5 = value_2
			value_4 = value_2.get
			value_6 = "Standing"
			value_4 = value_4(value_5, value_6)
		until not value_4
	until true
	value_4 = upvalues[1].antiaim.fakelag.on
	t3 = value_4
	value_6 = false
	value_4(value_5, value_6)
	value_4 = upvalues[1].antiaim.fakelag
	value_4(value_5, value_6)
	value_4 = upvalues[1].antiaim.fakelag
	value_4(value_5, value_6)
end

recovered.andromeda_update_callbacks_p151 = function(upvalues, ...)
	local value_1, value_2, value_3
	value_1 = upvalues[0].update_callbacks
	value_2 = upvalues[1].ragebot.enemy_resolver
	value_3 = value_2
	value_2 = value_2.get(value_3)
	value_2 = value_2 == true
	value_1(value_2)
	return
end

recovered.update_invalid_tick_cleaner_p152 = function(upvalues, argument_1, argument_2, argument_3, ...)
  local value_0, value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_8, value_9
  local value_20, value_21, value_22, value_23
	value_1 = argument_1
	value_2 = argument_2
	value_3 = argument_3
	value_5 = value_1
	value_4 = value_1.is_invalid_tick_cleaner_enabled
	value_6 = value_3
	value_4 = value_4(value_5, value_6)
	if (not value_4) then
		return
	end
	value_20 = math_helpers[10]
	value_0 = value_21 ~= "\207"
	value_22 = 1
	value_23 = 1
	value_20 = value_20(value_21, value_22, value_23)
	if not (value_20) then
		value_20 = 24
	end
	value_5 = upvalues[0][47]
	value_4 = nil < nil
	value_7 = "m_bFreezePeriod"
	value_5 = value_5(value_6, value_7)
	if value_5 == 1 then
		return
	end
	value_5 = upvalues[0][32]()
	value_6 = upvalues[0][52]()
	value_7 = upvalues[0][50]
	value_8 = value_5
	value_7 = value_7(value_8)
	if value_6 == value_0 then
		return
	end
	value_1.force_defensive_active = true
	value_7 = upvalues[1]
	value_7 = #value_7
	value_8 = upvalues[0][154]
	value_9 = value_1.backtrack_cleaner_timer
	value_9 = value_9 / 11
	value_8 = value_8(value_9)
	repeat
		repeat
			do return end
			value_8 = value_1.backtrack_cleaner_timer
			value_9 = value_7 + 32
		until true
	until true
end

recovered.break_lc_p153 = function(upvalues, argument_1, argument_2, argument_3, ...)
  local value_1, value_2, value_3, value_4, value_6, value_7, value_8, value_15, value_17, value_18
	value_1 = argument_1
	value_2 = argument_2
	value_3 = argument_3
	value_18 = 356
	if not (value_18) then
		value_18 = 262
	end
	value_18 = value_18 - 167
	value_18 = value_17 - 58
	value_18 = value_18 - 31
	value_15[127] = value_18
	value_17[42] = 56
	local t22 = {...}
		value_1 = t22[1]
		value_2 = t22[2]
		value_3 = t22[3]
	value_1.force_defensive_active = false
	value_2.force_defensive = false
	value_4 = value_3
	if value_4 then
		value_4 = value_3.force_defensive
	end
	if not (value_4) then
	end
	do return end
	do return end
	value_6 = upvalues[1].is_on_shot_antiaim()
	value_7 = value_4
	value_6 = value_4.get
	value_8 = "Double tap"
	value_6 = value_6(value_7, value_8)
	value_6 = upvalues[1].is_double_tap()
	if not value_6 then
		return
	else
		value_1.force_defensive_active = true
		value_2.force_defensive = true
		return
	end
end

recovered.andromeda_y_p154 = function(upvalues, argument_1, argument_2, argument_3, ...)
	local value_1, value_2, value_3, value_5, value_6, value_7, value_8, value_9, value_10, value_11
	local value_12, value_13
	value_1 = argument_1
	value_2 = argument_2
	value_3 = argument_3
	value_12 = value_5.y
	value_6 = value_6(value_7, value_8, value_9, value_10, value_11, value_12, value_13)
	value_7 = value_6 == 1
	return value_7
end

recovered.ensure_defaults_p155 = function(upvalues, argument_1, ...)
  local value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_8, value_9, value_10
  local value_11, value_12, value_13, value_14, value_15, value_16, value_17, value_18, value_20
	local t12
	value_1 = argument_1
	local t20 = {...}
		value_1 = t20[1]
	value_3 = value_1
	value_2 = value_1.read_db(value_3)
	value_4 = type
	value_5 = value_2
	value_4 = value_4(value_5)
	value_4 = value_4 == "table"
	if not value_4 then
	end
	if not (value_4) then
		value_4 = {}
	end
	value_1.configs_db = value_4
	value_4 = tonumber
	value_5 = value_1.configs_db.revision
	value_4 = value_4(value_5)
	if not (value_4) then
		value_4 = 0
	end
	value_1.write_revision = value_4
	value_4 = type
	value_5 = value_1.configs_db
	if value_4 then
		value_4 = value_1.configs_db.cfg_list
	end
	if not (value_4) then
		value_4 = {}
	end
	value_5 = type
	value_6 = value_1.configs_db.menu_list
	value_5 = value_1.configs_db.menu_list
	if not (value_5) then
		value_5 = {}
	end
	value_6 = {}
	value_7 = {}
	value_8 = 1
	repeat
		local t13 = t13 + nil
		value_11 = t13
		t12 = t12.parent
		value_8 = #value_6
		value_9 = #value_4
		local t22 = false
		t22 = true
		value_8 = value_8 ~= value_9
		t12 = t12.parent
		local t15 = t12.step
		local t14 = t12.limit
		t13 = t12.index
		value_15 = value_13[1]
		value_16 = value_6[value_12]
		value_16 = value_16[1]
		value_17 = value_13[2]
		value_18 = value_6[value_12]
		value_18 = value_18[2]
		local t5 = t5[nil]
		value_20 = value_7[value_12]
		value_8 = true
		t12 = t12.parent
		t15 = t12.step
		t14 = t12.limit
		t13 = t12.index
		value_10 = value_1.configs_db.cfg_list
		value_10 = #value_10
		value_11 = 1
		value_12 = -1
		t22 = {}
		t22.parent = t12
		t22.index = t13
		t22.step = t15
		t22.limit = t14
		t12 = t22
		t14 = value_11
		t15 = value_12
		t13 = value_10 - t15
		t13 = t13 + t15
		value_13 = t13
		value_11 = value_1
		value_10 = value_1.write_db
		value_10(value_11)
		do return end
		value_14 = value_1.configs_db.cfg_list
		value_14 = value_14[value_13]
		value_15 = type
		value_16 = value_14
		value_15 = value_15(value_16)
		value_16 = value_14[1]
		value_15(value_16, value_17)
		value_15 = table.remove
		value_16 = value_1.configs_db.menu_list
		value_17 = value_13
		value_15(value_16, value_17)
		value_9 = true
		t13 = t13 + t15
		value_12 = t13
		value_9 = 1
		value_10 = #value_6
		value_11 = 1
		t22 = {}
		t22.parent = t12
		t22.index = t12.index
		t22.step = t12.step
		t22.limit = t12.limit
		t12 = t22
		t14 = value_10
		t13 = value_9 - value_11
		value_12 = value_4[value_11]
		value_13 = type
		value_14 = value_12
		value_13 = value_13(value_14)
		value_14 = type
		value_15 = value_12[1]
		value_14 = value_14(value_15)
		value_15 = type
		value_16 = value_12[2]
		value_15 = value_15(value_16)
		value_16 = value_12[1]
	until true
end

recovered.get_entities_p156 = function(upvalues, ...)
	local value_19, value_20, value_21, value_22
	local t11
	repeat
		value_19 = 113
	until true
	value_19 = math_helpers[10]
	value_20 = "\156K\193\011"
	value_21 = 4
	value_22 = 4
	value_19 = value_19(value_20, value_21, value_22)
end

recovered.andromeda_safehead_active_p157 = function(upvalues, argument_1, argument_2, ...)
	local value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_8, value_9, value_10
	local value_11, value_12, value_13, value_14, value_15, value_16, value_17, value_18
	value_1 = argument_1
	value_2 = argument_2
	value_1.safehead_active = false
	value_3 = bind(recovered.andromeda_body_p158, {[0] = value_1})
	value_5 = upvalues[0][50]
	value_6 = value_4
	value_5 = value_5(value_6)
	value_5 = upvalues[1].antiaim.features
	value_5 = value_5.safe_head.enabled
	value_6 = value_5
	value_5 = value_5.get(value_6)
	if value_5 then
		value_6 = false
		return value_6
	else
		value_5 = false
		return value_5
	end
	value_6 = upvalues[0][45]
	value_7 = value_5
	value_6 = value_6(value_7)
	if not (value_6) then
		value_6 = ""
	end
	value_12 = "Knife"
	value_10 = value_10(value_11, value_12)
	value_12 = value_9
	value_11 = value_9.get
	value_13 = "Zeus"
	value_11 = value_11(value_12, value_13)
	repeat

		local t23 = false
		value_12 = value_2 == "Move"
		if value_12 then
			do
				value_13 = false
				return value_13
			end
			value_13 = value_2 == "Air-crouch"
			if value_7 then
				value_14 = value_3
				-- Luraph junk / invalid SSA expression removed
				value_16 = 0
				value_17 = "Static"
				value_18 = 0
				value_14(value_15, value_16, value_17, value_18)
				value_14 = true
				return value_14
			end
			break
		else
			value_13 = upvalues[2]()
			break
		end
	do break end
	until not value_8
end

recovered.andromeda_body_p158 = function(upvalues, argument_1, argument_2, argument_3, argument_4, ...)
	local value_1, value_2, value_3, value_4, value_5, value_6
	value_1 = argument_1
	value_2 = argument_2
	value_3 = argument_3
	value_4 = argument_4
	value_5 = upvalues[0].pitch
	value_5.type = "Custom"
	value_5 = upvalues[0].pitch
	value_5.value = 89
	value_5 = upvalues[0].body_yaw
	value_6 = value_3
	value_6 = "Opposite"
	if not (value_6) then
		value_6 = 0
	end
	value_5.value = value_6
	value_5 = upvalues[0].body_yaw
	value_5.freestanding = false
	value_5 = upvalues[0].yaw
	value_5.base = "At targets"
	value_5 = upvalues[0].yaw
	value_5 = upvalues[0].yaw
	value_6 = value_2
	if not (value_6) then
		value_6 = 0
	end
end

recovered.andromeda_is_quit_p159 = function(upvalues, ...)
  local value_1, value_8, value_9, value_10
	value_10 = 284
	if not (value_10) then
		value_10 = 181
	end
	value_10 = value_10 + 11272
	value_10 = value_10 - 11555
	value_8[3] = value_10
	value_9[43] = 2
	do return end
	value_1 = upvalues[1]
	value_1()
	return
end

recovered.andromeda_function_17_p160 = function(upvalues, ...)
	local locals = make_locals()
	for t24 = 1, 105 do
		locals[t24] = ({...})[t24]
	end
	locals.v4 = locals.v3[1]
	locals.v5 = locals.v3[2]
	locals.v6 = locals.v3[3]
	locals.v7 = locals.v3[4]
	locals.v8 = upvalues[0][130]
	locals.v9 = locals.v1
	locals.v10 = locals.v2
	locals.v11 = locals.v4
	locals.v12 = locals.v5
	locals.v13 = locals.v6
	locals.v14 = upvalues[0][154]
	locals.v15 = 16
	locals.v16 = 0
	locals.v17 = 1
	locals.v8(locals.v9, locals.v10, locals.v11, locals.v12, locals.v13, locals.v14, locals.v15, locals.v16, locals.v17)
	locals.v8 = upvalues[0][130]
	locals.v9 = locals.v1
	locals.v10 = locals.v2
	locals.v11 = locals.v4
	locals.v12 = locals.v5
	locals.v13 = locals.v6
	locals.v14 = upvalues[0][154]
	locals.v15 = locals.v7 * 0.04
	locals.v15 = locals.v15 + 0.5
	locals.v14 = locals.v14(locals.v15)
	locals.v15 = 13
	locals.v16 = 0
	locals.v17 = 1
	locals.v8(locals.v9, locals.v10, locals.v11, locals.v12, locals.v13, locals.v14, locals.v15, locals.v16, locals.v17)
	locals.v8 = upvalues[0][130]
	locals.v9 = locals.v1
	locals.v10 = locals.v2
	locals.v11 = locals.v4
	locals.v12 = locals.v5
	locals.v13 = locals.v6
	locals.v14 = upvalues[0][154]
	locals.v15 = locals.v7 * 0.065
	locals.v15 = locals.v15 + 0.5
	locals.v14 = locals.v14(locals.v15)
	locals.v15 = 10
	locals.v16 = 0
	locals.v17 = locals.v0 < 1
	locals.v8 = upvalues[0][130]
	locals.v9 = locals.v1
	locals.v10 = locals.v2
	locals.v11 = {}
	locals.v12 = locals.v5
	locals.v13 = locals.v6
	locals.v14 = upvalues[0][154]
	locals.v15 = locals.v7 * 0.105
	locals.v15 = locals.v15 + 0.5
	locals.v14 = locals.v14(locals.v15)
	locals.v15 = 7
	locals.v16 = 0
	locals.v17 = 1
	locals.v8(unpack_locals(locals, 9, 105))
	locals.v8 = upvalues[0][130]
	locals.v9 = locals.v1
	locals.v10 = locals.v2
	locals.v11 = locals.v4
	locals.v12 = locals.v5
	locals.v13 = locals.v6
	locals.v14 = upvalues[0][154]
	locals.v15 = locals.v7 * 0.175
	locals.v15 = locals.v15 + 0.5
	locals.v14 = locals.v14(locals.v15)
	locals.v15 = 5
	locals.v16 = 0
	locals.v17 = 1
	locals.v8(locals.v9, locals.v10, locals.v11, locals.v12, locals.v13, locals.v14, locals.v15, locals.v16, locals.v17)
	locals.v8 = upvalues[0][130]
end

recovered.andromeda_function_18_p161 = function(upvalues, argument_1, argument_2, ...)
	local value_1, value_2, value_4, value_5, value_6
	value_1 = argument_1
	value_2 = argument_2
	value_5 = value_4[1]
	return value_5, value_6
end

recovered.paint_p162 = function(upvalues, ...)
  local value_0, value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_8, value_9
  local value_10, value_11, value_12, value_13, value_14, value_15, value_16, value_17, value_38
	value_1 = upvalues[0].skip_native_cleanup()
	value_1 = upvalues[1]
	value_2 = "paint:manual_arrows"
	value_1 = value_1(value_2)
	value_1 = upvalues[2].visuals
	if value_1 then
		value_1 = upvalues[2].visuals.stubs
	end
	if not (value_1) then
	end
	value_2 = value_1.manual_arrows
	value_3 = value_1.manual_arrows
	value_4 = value_3
	value_3 = value_3.get(value_4)
	value_2 = upvalues[3][32]()
	value_3 = upvalues[3][50]
	value_38 = value_2
	value_3 = value_3(value_4)
	value_3 = upvalues[3][57]()
	value_5 = value_3 * 0.5
	value_6 = value_4 * 0.5
	value_7 = upvalues[4]()
	value_8 = upvalues[5]()
	value_9 = 55
	value_10 = value_1.manual_arrows_offset
	if not (value_10 == value_0) then
		value_11 = value_10.get
		if not (value_11 == value_0) then
			value_12 = value_10
			value_11 = value_10.get(value_12)
			value_12 = type
			value_13 = value_11
			value_12 = value_12(value_13)
			if not (value_12 ~= "number") then
				value_13, t3, t4, t5 = 30, 3, upvalues, 12
				value_14 = upvalues[3][162]
				value_15 = 140
				value_16 = value_11
				value_14 = value_14(value_15, value_16)
				value_12 = value_12()
				value_9 = value_12
			end
		end
	end
	value_11 = upvalues[6]
	value_12 = value_1.manual_arrows_cs2_color
	value_13 = {}
	value_14 = 235
	value_15 = 90
	value_16 = 170
	value_17 = 255
		value_13[1] = value_14
		value_13[2] = value_15
		value_13[3] = value_16
		value_13[4] = value_17
	value_11 = value_11(value_12, value_13)
	if not (value_7 ~= "Left") then
		value_12 = upvalues[7]
		value_13 = value_5 - value_9
		value_14 = value_6
		value_15 = value_11
		value_12(value_13, value_14, value_15)
	end
	repeat
		repeat
		do return end
		until true
	until true
end

recovered.andromeda_is_enabled_p163 = function(upvalues, ...)
	local value_1, value_2, value_3, value_4, value_5
	value_1 = upvalues[0].is_enabled()
	if value_1 then
		value_2 = upvalues[0].capture_original
		value_2()
		value_2 = upvalues[0].sync
		value_2()
	end
	repeat
		value_2 = upvalues[0].active
	until true
	upvalues[0].active = value_1
	value_2 = upvalues[1].set_callback
	value_3 = "setup_command"
	value_4 = upvalues[0].setup_command
	value_5 = value_1
	value_2(value_3, value_4, value_5)
	value_2 = upvalues[1].set_callback
	value_3 = "paint"
	value_4 = upvalues[0].paint
	value_5 = value_1
	value_2(value_3, value_4, value_5)
	if not (value_1) then
		value_2 = upvalues[0].restore_original
		value_2()
	end
	return
end

recovered.andromeda_planting_start_time_p164 = function(upvalues, argument_1, ...)
	local value_1, value_2
	value_1 = argument_1
	value_2 = upvalues[0].planting_start_time
	if not (value_2 ~= nil) then
		value_2 = upvalues[1][30]()
		upvalues[0].planting_start_time = value_2
	end
	return
end

recovered.andromeda_planting_duration_p165 = function(upvalues, ...)
	local value_1, value_14, value_15
	value_1 = upvalues[0].planting_start_time
	value_14 = math_helpers[7]
	value_15 = ""
	value_14 = value_14(value_15)
	value_14 = 330
end

recovered.andromeda_function_19_p166 = function(upvalues, ...)
end

recovered.apply_air_legs_p167 = function(upvalues, argument_1, argument_2, argument_3, ...)
  local value_0, value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_8, value_9
  local value_19, value_20
	value_1 = argument_1
	value_2 = argument_2
	value_3 = argument_3
	value_19 = math_helpers[7]
	value_20 = "B"
	value_19 = value_19(value_20)
	if not (value_19) then
		value_19 = 492
	end
	value_19 = value_19 ~= 146
	if value_19 then
		value_19 = 246
	end
	if not (value_19) then
		value_19 = math_helpers[8]
		value_20 = math_helpers[6]
		value_19 = value_19(value_20)
	end
	if value_4 == "Static" then
		return
	end
	if not (value_4 ~= "Moonwalk") then
		value_3.weight = 1
		value_0 = value_0(value_1, value_2, value_3, value_4)
		value_5 = value_5()
		value_5 = value_5 * 0.55
		value_5 = value_5 % 1
	end
	if not (value_4 ~= "Kangaroo") then
		value_5 = upvalues[0][36]
		value_6 = value_2
		value_7 = "m_flPoseParameter"
		value_8 = upvalues[0][150]()
		value_9 = 3
		value_5(value_6, value_7, value_8, value_9)
		value_5 = upvalues[0][36]
		value_6 = value_2
		value_9 = 7
		value_5(value_6, value_7, value_8, value_9)
		value_5 = upvalues[0][36]
	end
	return
end

recovered.andromeda_quickpeek_p168 = function(upvalues, ...)
	local value_1, value_2
	local t2
	repeat
		value_1 = value_1(value_2)
	until true
end

recovered.andromeda_traverse_p169 = function(upvalues, ...)
	local value_1, value_2, value_3
	value_1 = upvalues[0].traverse
	value_2 = upvalues[1].visuals
	value_3 = bind(recovered.andromeda_override_2_p172, {})
	value_1(value_2, value_3)
	return
end

recovered.andromeda_hotkey_p170 = function(upvalues, argument_1, ...)
  local value_1, value_2, value_3
	value_1 = argument_1
	value_2 = type
	value_3 = value_1
	value_2 = value_2(value_3)()
	repeat
		value_2 = value_1.hotkey
	until true
	local t5 = false
	value_2(value_3)
	return
end

recovered.andromeda_override_p171 = function(upvalues, argument_1, ...)
	local locals = make_locals()
	locals.v1 = argument_1
	while locals.v25 ~= nil do
	end
	locals.v13 = 342
	local t20 = {...}
		locals.v1 = t20[1]
	do return end
	locals.v3 = locals.v1
	locals.v2 = locals.v1.override
	locals.v2(locals.v3)
	locals.v2 = locals[nil].hotkey
	if not (locals.v2 == locals.v0) then
		locals.v2 = locals.v1.hotkey
		locals.v13 = locals.v2
		locals.v12 = locals.v2.override
		locals.v2(locals.v3)
	end
	return
end

recovered.andromeda_override_2_p172 = function(upvalues, argument_1, ...)
  local value_0, value_1, value_2, value_3, value_12, value_13
	value_1 = argument_1
	value_13 = 137
	value_13 = 471
	value_13 = value_13 + 26657
	value_13 = value_13 - 26793
	value_12[28] = value_13
	value_12[46] = 15
	local t20 = {...}
		value_1 = t20[1]
	value_2 = type
	value_3 = value_1
	value_2 = value_2(value_3)
	value_3 = value_1.override
	if value_3 ~= value_0 then
		return
	end
end

recovered.andromeda_hidden_p173 = function(upvalues, ...)
  local value_24
	value_24[54] = 88
end

recovered.is_left_side_p174 = function(upvalues, argument_1, ...)
	local locals = make_locals()
	locals.v1 = argument_1
	locals.v2 = upvalues[0][2][upvalues[0][1]].current
	locals.v15 = 477
	locals.v15 = math_helpers[7]
	locals.v16 = ""
	-- Luraph junk / invalid SSA expression removed
	locals.v16 = math_helpers[9]
	locals.v17 = math_helpers[6]
	locals.v16 = locals.v16(locals.v17)
	locals.v15 = locals.v15 + locals.v16
	locals.v15 = locals.v15 + 242
	locals.v15 = locals.v15 - 243
	locals.v14[17] = locals.v15
	locals.v14[44] = 101
	locals.v3, t3, t4 = nil, locals, 113
	if not (locals.v3 == locals.v0) then
		locals.v4 = locals.v3.type
		locals.v5 = locals.v4
		locals.v4 = locals.v4.get(locals.v5)
	end
	locals.v2 = locals.v1.body_yaw.inverter
	return locals.v2
end

-- Extrapolation: restore entity origins changed during setup_command.
recovered.restore_all_p175 = function(upvalues, ...)
	local state = upvalues[0]
	local api = upvalues[1]
	local entity_set_prop = api[36]
	local entity_is_alive = api[50]

	for entity_index, origin in pairs(state.shifted_players) do
		if entity_is_alive(entity_index) then
			entity_set_prop(entity_index, "m_vecOrigin", origin.x, origin.y, origin.z)
		end
		state.shifted_players[entity_index] = nil
	end
end

recovered.andromeda_clear_state_p176 = function(upvalues, ...)
end

recovered.andromeda_match_p177 = function(upvalues, ...)
	local value_1, value_2
	value_1 = upvalues[0].visuals
	value_1 = value_1 ~= nil
	if value_1 then
		value_1 = upvalues[0].visuals.dpi
	end
	if not (value_1) then
		value_1 = nil
	end
	if not (value_1 ~= nil) then
		value_2 = 1
		return value_2
	end
end

recovered.andromeda_xy_p178 = function(upvalues, argument_1, ...)
	local value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_9, value_11
	value_1 = argument_1
	value_2 = value_1
	if value_2 then
		value_2 = 1
	end
	if not (value_2) then
		value_2 = 0
	end
	value_3 = upvalues[0][2][upvalues[0][1]]
	if value_3 == value_2 then
		return value_3
	end
	value_3 = upvalues[0][2][upvalues[0][1]]
	value_4 = value_2 > value_3
	if value_4 then
		value_4 = 1
	end
	if not (value_4) then
		value_4 = -1
	end
	value_5 = value_5 * value_4
	value_5 = value_3 + value_5
	value_6 = upvalues[2].clamp
	value_7 = value_5
	value_9 = upvalues[1][151]
	value_11 = value_2
end

recovered.andromeda_minimum_damage_override_p179 = function(upvalues, ...)
  local value_0, value_1, value_2, value_3, value_4, value_5
	local t11
	value_1 = upvalues[0].ragebot.minimum_damage
	value_2 = value_1
	value_1 = value_1.get
	value_0 = value_0()
	value_2 = upvalues[0].ragebot.minimum_damage_override
	value_2 = value_2[2]
	value_3 = value_2 ~= value_0
	value_4 = value_2
	value_3 = value_2.get(value_4)
	value_3 = value_1
	value_4 = type
	value_5 = value_3
	value_4 = value_4(value_5)
	repeat
		value_3 = value_1
	until true
end

recovered.andromeda_handlers_p180 = function(upvalues, ...)
	local value_1
	value_1 = upvalues[0].handlers.save
	value_1()
	return
end

recovered.andromeda_exploits_p181 = function(upvalues, ...)
end

recovered.delete_p182 = function(upvalues, ...)
	return
end

recovered.andromeda_function_20_p183 = function(upvalues, ...)
	return
end

recovered.andromeda_sub_p184 = function(upvalues, argument_1, argument_2, argument_3, argument_4, ...)
  local value_0, value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_8, value_9
  local value_10
	local t6
	value_1 = argument_1
	value_2 = argument_2
	value_3 = argument_3
	value_4 = argument_4
	value_5 = type
	value_6 = value_1
	value_5 = value_5(value_6)
	value_6 = value_1
	value_5 = value_1.gsub
	value_7 = "#"
	value_8 = ""
	value_6 = #value_5
	if not (value_6 ~= 6) then
		value_6 = tonumber
		value_8 = value_5
		value_7 = value_5.sub
		value_9 = 1
		value_10 = 2
		value_7 = value_7(value_8, value_9, value_10)
		value_8 = 16
		value_6 = value_6(value_7, value_8)
		value_1 = value_6
		value_6 = tonumber
		value_8 = value_5
		value_7 = value_5.sub
		value_9 = 3
		value_10 = 4
		value_7 = value_7(value_8, value_9, value_10)
		value_8 = 16
		value_6 = value_6(value_7, value_8)
		value_2 = value_6
		value_6 = tonumber
		value_8 = value_5
		value_7 = value_5.sub
		value_9 = 5
		value_10 = 6
		value_7 = value_7(value_8, value_9, value_10)
		value_8 = 16
		value_6 = value_6(value_7, value_8)
		value_3 = value_6
		value_4 = 255
	end
	value_9 = value_4
		value_5[1] = value_6
		value_5[2] = value_7
		value_5[3] = value_8
		value_5[4] = value_9
	value_6 = upvalues[0].clamp
	value_7 = tonumber
	value_8 = value_1
	value_7 = value_7(value_8)
	if not (value_7) then
		value_7 = 255
	end
	value_8 = 0
	value_9 = 255
	value_6 = value_6(value_7, value_8, value_9)
	value_5.r = value_6
	value_6 = upvalues[0].clamp
	value_7 = value_3 == value_0
	if not (value_7) then
		value_7 = tonumber
		value_8 = value_2
		value_7 = value_7(value_8)
	end
	if not (value_7) then
		value_7 = value_2 ~= value_0
		if value_7 then
			value_7 = value_3 == value_0
		end
		if value_7 then
			value_7 = value_5.r
		end
	end
	if not (value_7) then
		value_7 = 255
	end
	value_8 = 0
	value_6 = value_6(value_7, value_8, value_9)
	value_5.g = value_6
	value_6 = upvalues[0].clamp
	value_7 = tonumber
	value_8 = value_3
	value_7 = value_7(value_8)
	if not (value_7) then
		value_7 = value_2 ~= value_0
		if value_7 then
			value_7 = value_5.r
		end
	end
	if not (value_7) then
		value_7 = 255
	end
	value_8 = 0
	value_9 = 255
	value_6 = value_6(value_7, value_8, value_9)
	value_5.b = value_6
	value_6 = upvalues[0].clamp
	value_7 = tonumber
	value_8 = value_4
	value_7 = value_3 == value_0
	if value_7 then
		value_7 = value_2
	end
	if not (value_7) then
		value_7 = 255
	end
	value_8 = 0
	value_9 = 255
	value_6 = value_6(value_7, value_8, value_9)
	value_5.a = value_6
	value_6(value_7, value_8)
	value_6 = value_5
	return value_6
end

-- Shared numeric clamp used by the prediction chain.
recovered.andromeda_function_21_p185 = function(upvalues, value, minimum, maximum, ...)
	return math.max(minimum, math.min(value, maximum))
end

recovered.andromeda_function_22_p186 = function(upvalues, argument_1, ...)
	local value_1, value_2, value_3
	value_1 = argument_1
	value_2 = value_1 >= 0
	if value_2 then
		value_2 = upvalues[0][154]
		value_3 = value_1 + 0.5
		value_2 = value_2(value_3)
	end
	if not (value_2) then
		value_2 = upvalues[0][144]
		value_3 = value_1 - 0.5
		value_2 = value_2(value_3)
	end
	return value_2
end

recovered.andromeda_last_exploit_charged_p187 = function(upvalues, ...)
  local value_1
	local t2
	local t3 = nil
	t2 = t2[t3]
	upvalues[0].defensive_yaw_double_states = value_1
	value_1 = {}
end

recovered.andromeda_r_p188 = function(upvalues, argument_1, argument_2, ...)
  local value_0, value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_8, value_9
  local value_28, value_29, value_30, value_31, value_32
	value_1 = argument_1
	value_2 = argument_2
	if value_1 == value_0 then
		return value_3
	end
	value_5 = {}
	value_6 = value_4.r
	if not (value_6) then
		value_6 = value_2[1]
	end
	value_7 = value_4.g
	if not (value_7) then
		value_7 = value_2[2]
	end
	value_8 = value_4.b
	value_9 = value_4.a
	if not (value_9) then
		value_9 = value_2[4]
	end
		value_28[1] = value_29
		value_28[2] = value_30
		value_28[3] = value_31
		value_28[4] = value_32
	do
		return value_5
	end
	value_4 = type
	value_5 = value_3[1]
	value_4 = value_4(value_5)
	value_4 = {}
	value_5 = value_3[1]
	if not (value_5) then
		value_5 = value_2[1]
	end
	-- Luraph junk / invalid SSA expression removed
	local t7
	if not (value_6) then
		value_6 = value_2[2]
	end
	value_7 = value_3[3]
	if not (value_7) then
		value_7 = value_2[3]
	end
	value_8 = value_3[4]
	if not (value_8) then
		value_8 = value_2[4]
	end
		value_4[1] = value_5
		value_4[2] = value_6
		value_4[3] = value_7
		value_4[4] = value_8
	return value_4
end

recovered.andromeda_forward_2_p189 = function(upvalues, ...)
	local value_1, value_11, value_12
	value_1 = upvalues[0][2][upvalues[0][1]].manual
	if value_1 == "Left" then
		return value_1
	end
	value_11 = math_helpers[8]
	value_12 = math_helpers[6]
	value_11 = value_11(value_12)
	if not (value_11) then
		value_11 = 262
	end
	value_1 = upvalues[0][2][upvalues[0][1]].manual
	if value_1 ~= "Right" then
		value_1 = "Forward"
		return value_1
	else
		value_1 = "Right"
		return value_1
	end
end

recovered.andromeda_onetap_p190 = function(upvalues, ...)
  local value_1, value_2, value_10, value_12, value_13
	value_1 = upvalues[0].visuals
	if value_1 then
		value_1 = upvalues[0].visuals.stubs
	end
	value_13 = value_13 - 1609
	value_10[79] = value_13
	value_12[95] = 32
	if value_1 then
		value_1 = upvalues[0].visuals.stubs.manual_arrows_style
	end
	value_2 = "First"
	return value_2
end

-- Extrapolation: build and collision-limit a predicted player origin.
recovered.andromeda_x_p191 = function(upvalues, entity_index, origin, requested_ticks, ...)
	if origin == nil then return nil end

	local get_vector_prop = upvalues[0]
	local state = upvalues[1]
	local api = upvalues[2]
	local vector = upvalues[3]
	local clamp = upvalues[4].clamp
	local velocity = get_vector_prop(entity_index, "m_vecVelocity")
	if velocity == nil then return nil end

	local player = state.player_state[entity_index]
	if player == nil then
		player = {
			velocity = nil,
			simtime = nil,
			origin = nil,
			penalty_until = 0,
			boost_until = 0,
			stable_ticks = 0,
			hit_streak = 0,
			miss_streak = 0,
		}
		state.player_state[entity_index] = player
	end

	local tickinterval = api[28]()
	local simtime = entity.get_simtime(entity_index)
	local acceleration

	if player.velocity ~= nil and type(player.simtime) == "number" and type(simtime) == "number" then
		local simulation_delta = simtime - player.simtime
		if simulation_delta > 0 and simulation_delta < 0.35 then
			acceleration = (velocity - player.velocity) / simulation_delta
		end
	end

	local flags = api[47](entity_index, "m_fFlags") or 0
	local on_ground = bit.band(flags, 1) == 1
	if not on_ground and requested_ticks > 0 and acceleration == nil then
		local gravity = 800
		if cvar.sv_gravity ~= nil and cvar.sv_gravity.get_float ~= nil then
			gravity = cvar.sv_gravity:get_float() or gravity
		end
		acceleration = vector(0, 0, -gravity * 0.45)
	end

	local predicted = state.predict_vector(origin, velocity, requested_ticks, entity_index, acceleration)
	player.origin = origin
	player.simtime = simtime
	if predicted == nil then return nil end

	local fraction = api[78](
		entity_index,
		origin.x, origin.y, origin.z,
		predicted.x, predicted.y, predicted.z
	)
	if type(fraction) ~= "number" or fraction >= 0.99 then
		return predicted
	end

	local collision_scale = clamp(fraction * 0.84, 0, 0.92)
	return origin + (predicted - origin) * collision_scale
end

recovered.unset_hitchance_p192 = function(upvalues, ...)
  local value_0, value_1, value_2, value_3, value_4, value_5
	value_1 = upvalues[0]
	value_2 = upvalues[1]
	value_1 = upvalues[0]
	value_1 = upvalues[2][value_1]
	value_2 = upvalues[3][120]
	value_3 = upvalues[1]
	value_2 = value_2(value_3)
	value_3 = pairs
	value_4 = value_1
	value_3 = value_3(value_4)
	local t11 = {parent = nil, index = nil, step = nil, limit = nil}
	local t14 = value_5
	local t13 = value_4
	local t12 = value_3
	repeat
		repeat
			local t17 = value_3(nil, t16)
		until true
		t16, value_4, value_5 = t17, t17, t22
	until t17 ~= nil
	value_0 = value_0 - value_0
	value_3 = upvalues[3][110]
	value_4 = upvalues[1]
	value_5 = value_2
	value_3(value_4, value_5)
	value_3 = upvalues[0]
	upvalues[2][value_3] = value_0
	return
end

recovered.andromeda_unset_hitchance_p193 = function(upvalues, ...)
	local value_1
	value_1 = upvalues[0].unset_hitchance
	value_1()
	upvalues[0].active = false
	upvalues[0].hotkey_active = false
	upvalues[0].updated_this_tick = false
	upvalues[0].indicator_value = nil
	return
end

recovered.andromeda_spin_p194 = function(upvalues, ...)
	local locals = make_locals()
	local t2
	local t7 = 0
	locals.v1 = upvalues[0].switch
	locals.v2 = locals.v1
	locals.v1 = locals.v1.get(locals.v2)
	locals.v1 = locals.v1 == "Anti-Aim"
	locals.v2 = upvalues[0].antiaim.conditions
	locals.v3 = locals.v2
	locals.v2 = locals.v2.get(locals.v3)
	locals.v3 = 1
	locals.v4 = upvalues[2]
	locals.v4 = locals_length(locals)[4]
	locals.v5 = 1
	local t11 = {parent = nil, index = nil, step = nil, limit = nil}
	local t13 = locals.v4
	local t12 = locals.v3 - locals.v5
	repeat
		t12 = t12 + t14
		locals.v6 = t12
		do return end
		locals.v7 = upvalues[2][locals.v6]
		local t5 = "modifiers"
		locals.v8 = locals[t5][t5]
		locals.v9 = locals.v8.custom
		locals.v10 = locals.v8.type
		locals.v11 = locals.v10
		locals.v10 = locals.v10.get(locals.v11)
		locals.v11 = locals.v1
		locals.v11 = locals.v7.state_name
		local t21 = false
		t21 = true
		locals.v11 = locals.v2 == locals.v11
		t21 = false
		t21 = true
		locals.v11 = locals.v11 == "Default"
		t21 = false
		t21 = true
		locals.v11 = locals.v10 == "Center"
		t21 = false
		t21 = true
		locals.v11 = locals.v10 == "Random"
		t21 = false
		t21 = true
		locals.v11 = locals.v10 == "Spin"
		locals.v12 = locals.v11
		locals.v12 = upvalues[3][154]
		locals.v13 = locals[t5].count
		locals.v14 = locals.v13
		locals.v13 = locals.v13.get(locals.v14)
		locals.v12 = locals.v12(unpack_locals(locals, 13, t7))
		t21 = false
		t21 = true
		locals.v23 = locals.v0 <= nil
		locals.v12 = 0
		locals.v13 = upvalues[3][151]
		locals.v14 = 0
		locals.v15 = upvalues[3][162]
		locals.v16 = 10
		locals.v17 = locals.v12
		locals.v15 = locals.v15(locals.v16, locals.v17)
		locals.v13 = locals.v13(unpack_locals(locals, 14, t7))
		locals.v12 = locals.v13
		locals.v13 = 1
		locals.v14 = 10
		locals.v15 = 1
		t21 = {}
		t21.parent = t11
		t21.index = t12
		t21.step = t14
		t21.limit = t13
		t11 = t21
		t13 = locals.v14
		local t14 = locals.v15
		t12 = locals.v13 - t14
		t12 = t12 + t14
		locals.v16 = t12
	until true
	locals.v19 = locals.v11
	if locals.v19 then
		locals.v19 = locals.v16 <= locals.v12
	end
	locals.v0 = locals.v17 == nil
end

recovered.andromeda_slots_p195 = function(upvalues, ...)
  local value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_8, value_9, value_10
  local value_11, value_12, value_13, value_14, value_15, value_16, value_17, value_18, value_19, value_28
  local value_30
	value_1 = value_1 == "Anti-Aim"
	if value_1 then
		value_1 = upvalues[1]()
	end
	value_2 = upvalues[0].antiaim
	value_3 = value_2
	value_2 = value_2.get(value_3)
	value_5 = 1
	local t11 = {parent = nil, index = nil, step = nil, limit = nil}
	local t13 = value_4
	local t12 = value_3 - value_5
	repeat
		t12 = t12 + t14
		value_6 = t12
		do return end
		value_7 = upvalues[2][value_6]
		value_8 = value_7.modifiers
		value_9 = value_8.custom
		value_10 = value_8.type
		value_11 = value_10
		value_10 = value_10.get(value_11)
		value_11 = value_1
		local t21 = false
		t21 = true
		value_11 = value_11 == "Hidden"
		t21 = false
		t21 = true
		value_11 = value_10 == "Center"
		t21 = false
		t21 = true
		value_11 = value_10 == "Random"
		t21 = false
		t21 = true
		value_11 = value_10 == "Spin"
		value_11 = value_30.values
		value_12 = value_11
		value_11 = value_11.get(value_12)
		t21 = false
		t21 = true
		value_11 = value_11 == "Custom"
		value_12 = value_11
		value_12 = 0
		value_16 = 10
		value_17 = value_12
		value_15 = value_15(value_16, value_17)
		value_13 = value_13()
		value_12 = value_13
		value_13 = 1
		value_14 = 10
		value_15 = 1
		t21 = {}
		t21.parent = t11
		t21.index = t12
		t21.step = t14
		t21.limit = t13
		t11 = t21
		t13 = value_14
		local t14 = value_15
		t12 = value_13 - t14
		t12 = t12 + t14
		value_16 = t12
	until true
	value_17 = value_9.slots
	local t4 = t4 + t5[17]
	value_18 = value_28
	value_17 = value_28.set_visible
	value_19 = value_11
	if value_19 then
		value_19 = value_16 <= value_12
	end
	value_17(value_18, value_19)
end

recovered.andromeda_handlers_2_p196 = function(upvalues, argument_1, ...)
	local value_1, value_2, value_3, value_4, value_13
	value_1 = argument_1
	value_13 = 319
	if not (value_13) then
		value_13 = 37
	end
	value_3 = "load"
	value_4 = bind(recovered.andromeda_update_list_p198, {[0] = value_1, [1] = upvalues[1]})
	value_4 = bit.bxor(value_3, value_2)
	value_2 = upvalues[0].config.handlers
	value_3 = "save"
	value_4 = bind(recovered.save_2_p197, {[0] = upvalues[2], [1] = upvalues[0], [2] = upvalues[1], [3] = value_1})
	value_2[value_3] = value_4
	value_2 = upvalues[0].config.handlers
	value_2[value_3] = value_4
	return
end

recovered.save_2_p197 = function(upvalues, ...)
	local locals = make_locals()
	local t7 = 0
	repeat
		repeat
			locals.v1 = upvalues[0]
			locals.v2 = upvalues[1].config.name
			locals.v3 = locals.v2
			locals.v2 = locals.v2.get(locals.v3)
			locals.v1 = locals.v1(unpack_locals(locals, 2, t7))
			locals.v2 = upvalues[2]()
			locals.v3 = upvalues[3].configs_db.cfg_list
			locals.v3 = locals.v3[locals.v2]
			locals.v4 = type
			locals.v5 = locals.v3
			locals.v4 = locals.v4(locals.v5)
		until true
		local t21 = false
		locals.v4 = locals.v4 == "table"
		if locals.v4 then
			locals.v4 = locals.v3[1]
		end
		if not (locals.v4) then
		end
		if locals.v1 == "" then
			break
		elseif locals.v1 == locals.v4 then
		else
				locals.v6 = ({...})[1 + 6 - 6]
				locals.v7 = ({...})[1 + 7 - 6]
				locals.v8 = ({...})[1 + 8 - 6]
				locals.v9 = ({...})[1 + 9 - 6]
				locals.v10 = ({...})[1 + 10 - 6]
				locals.v11 = ({...})[1 + 11 - 6]
			locals.v6(locals.v7)
			locals.v6 = type
			locals.v7 = locals.v5
			locals.v6 = locals.v6(locals.v7)
			if not (locals.v17) then
				locals.v17 = 370
			end
			do break end
		end
	until locals.v6 ~= "number"
	repeat
		locals.v5 = upvalues[3]
		locals.v6 = locals.v5
		locals.v5 = locals.v5.save_config
		locals.v7 = upvalues[2]()
		locals.v5(unpack_locals(locals, 6, t7))
		upvalues[3]:update_list()
	do return end
	until true
end

recovered.andromeda_update_list_p198 = function(upvalues, ...)
  local value_1, value_3, value_9, value_11, value_12
	value_12 = 325
	if not (value_12) then
		value_12 = 49
	end
	local t5
	local t4 = _G
	value_12 = value_12 - 20435
	value_9[51] = value_12
	value_11[54] = 49
	value_3 = value_3()
	value_1()
	upvalues[0]:update_list()
	return
end

recovered.andromeda_remove_config_p199 = function(upvalues, ...)
  local value_1, value_2, value_9, value_11, value_12, value_13
	value_12 = math_helpers[5]
	value_13 = math_helpers[6]
	value_12 = value_12(value_13)
	if not (value_12) then
		value_12 = math_helpers[9]
		value_13 = math_helpers[6]
		value_12 = value_12(value_13)
	end
	local t4 = _G
	local t3 = 221
	value_12 = value_12 - 247
	value_9[45] = value_12
	value_11[6] = 12
	value_2 = value_1
	value_1 = value_1.update_list
	value_1(value_2)
	return
end

recovered.andromeda_export_config_p200 = function(upvalues, ...)
	upvalues[0]:export_config()
	return
end

recovered.andromeda_import_config_p201 = function(upvalues, ...)
	upvalues[0]:import_config()
	return
end

recovered.get_distance_p202 = function(upvalues, argument_1, argument_2, ...)
	local value_1, value_2, value_3
	value_1 = argument_1
	value_2 = argument_2
	if not (value_2 ~= nil) then
		value_3 = nil
		return value_3
	end
end

recovered.paint_invalid_tick_cleaner_p203 = function(upvalues, argument_1, ...)
	local value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_8, value_9, value_10
	local value_11, value_12, value_13, value_14, value_15, value_23, value_24, value_25, value_26
	value_1 = argument_1
	value_2 = upvalues[0]
	value_3 = upvalues[1][2][upvalues[1][1]].current
	value_2 = value_2(value_3)
	value_4 = value_1
	value_3 = value_1.is_invalid_tick_cleaner_enabled
	value_5 = value_2
	value_3 = value_3(value_4, value_5)
	value_3 = upvalues[2][32]()
	value_4 = upvalues[2][50]
	value_5 = value_3
	value_4 = value_4(value_5)
	value_4 = upvalues[2][52]()
	value_23 = math_helpers[10]
	value_24 = "?\017\212,"
	value_15 = 1
	value_26 = 2
	value_23 = value_23(value_24, value_25, value_26)
	if not (value_23) then
		value_23 = 415
	end
	value_9 = value_5
	value_8 = value_5.dist
	value_10 = value_6
	value_8 = value_8(value_9, value_10)
	if not value_7 then
	elseif value_8 >= 1000 then
	else
		value_9 = value_1.backtrack_cleaner_timer
		if not (value_9 >= 66) then
			value_14 = "BT"
			value_9(value_10, value_11, value_12, value_13, value_14)
		end
	end
	repeat
	do return end
	until true
end

recovered.andromeda_angles_p204 = function(upvalues, argument_1, argument_2, ...)
  local value_1, value_2, value_3, value_4, value_5, value_6, value_9, value_15, value_16, value_17
  local value_18, value_19
	value_1 = argument_1
	value_2 = argument_2
	value_1.edge_yaw = false
	value_1.freestanding = false
	value_3 = upvalues[0].antiaim.angles.freestanding
	value_4 = value_3
	value_3 = value_3.override.hotkey
	value_4 = value_3
	value_3 = value_3.override
	value_5 = {}
	value_6 = "On hotkey"
		value_5[1] = value_6
	value_3(value_4, value_5)
	value_5 = false
	value_3(value_4, value_5)
	value_3 = upvalues[1]()
	do return end
	value_3 = upvalues[3].antiaim.features
	value_3 = value_3.hotkeys.freestanding
	value_4 = value_3
	value_3 = value_3.get(value_4)
	if value_3 then
		value_5 = true
		value_3(value_4, value_5)
		value_3 = upvalues[0].antiaim
		value_6 = "Always on"
			value_5[1] = value_6
		value_3(value_4, value_5)
		value_1.freestanding = true
		value_3 = value_2.chokedcommands
		if not (value_3 ~= 0) then
			value_3 = upvalues[4]()
			value_1.freestanding_side = value_3
		end
	end
	repeat
		value_16 = 249
	until true
	value_16 = value_16 + 504
	value_16 = value_16 + 2725
	value_16 = value_16 - 3150
	value_9[84] = value_16
	value_15[60] = 176
	value_3 = upvalues[3].antiaim.features
	value_3 = value_3.hotkeys.edgeyaw
	value_4 = value_3
	value_3 = value_3.get(value_4)
	value_16 = math_helpers[10]
	value_17 = "e\140\021c"
	value_18 = 2
	value_16 = value_16(value_17, value_18, value_19)
	return
end

recovered.andromeda_safe_point_p205 = function(upvalues, ...)
end

recovered.is_ping_spike_p206 = function(upvalues, ...)
	local value_12
	local t2
	repeat
		if not value_12 then
			break
		end
	until true
end

recovered.get_dpi_scale_p207 = function(upvalues, ...)
  local value_0, value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_20
	local t2
	repeat
		repeat
			value_1 = upvalues[0].visuals
		until true
		if value_1 == value_0 then
			value_2 = 1
			return value_2
		end
		value_3 = value_1
		value_2 = value_1.get(value_3)
		value_3 = type
		value_4 = value_2
		value_3 = value_3(value_4)
		if value_3 ~= "number" then
			break
		end
	until value_2 <= 10
	repeat
		repeat
			repeat
				value_3 = 1
				do return value_3 end
				value_3 = type(value_4)
			until value_3 ~= "string"
			value_3 = tonumber
			value_5 = value_2
			value_4 = value_2.match
			value_6 = "(%d+%.?%d*)"
			value_4 = value_4(value_5, value_6)
			value_3 = value_3()
		until value_3 == value_0
	until value_3 <= 0
	value_4 = #value_1
	value_20 = value_3 * 0.01
	value_6 = 0.5
	value_7 = 2
	return value_4(value_5, value_6, value_7)
end

recovered.andromeda_watermark_position_p208 = function(upvalues, ...)
	local locals = make_locals()
	local t8 = select("#", ...)
	locals.v1 = upvalues[0].skip_native_cleanup()
	locals.v1 = upvalues[1][108]()
	locals.v1 = upvalues[2]
	locals.v2 = true
	locals.v1(locals.v2)
	locals.v1 = upvalues[3]
	locals.v1()
	locals.v1 = upvalues[4]
	locals.v1()
	locals.v1 = upvalues[5]
	locals.v1()
	locals.v1 = upvalues[6]
	locals.v1()
	locals.v1 = upvalues[7]
	locals.v1()
	locals.v1 = upvalues[8].ragebot
	if locals.v1 then
		locals.v1 = upvalues[8].ragebot.log_spread
		if not (locals.v1 == locals.v0) then
			locals.v1 = upvalues[8].ragebot.log_spread
			locals.v2 = locals.v1
			locals.v1 = locals.v1.set_visible
			locals.v3 = false
			locals.v1(locals.v2, locals.v3)
		end
	end
	locals.v1 = upvalues[9].traverse
	locals.v2 = upvalues[8].antiaim.angles
	locals.v3 = bind(recovered.andromeda_set_visible_6_p215, {})
	locals.v1(locals.v2, locals.v3)
	locals.v1 = upvalues[10].switch
	locals.v2 = locals.v1
	locals.v1 = locals.v1.get(locals.v2)
	locals.v1 = locals.v1 == "Anti-Aim"
	if locals.v1 then
		locals.v1 = upvalues[10].switch_type
		locals.v1 = locals.v1 ~= locals.v0
	end
	if locals.v1 then
		local t9 = {...}
		t8 = select("#", ...)
		locals.v2 = locals.v1
		locals.v1 = locals.v1.get(locals.v2)
		locals.v1 = locals.v1 == "Gamesense"
	end
	locals.v2 = upvalues[9].traverse
	locals.v3 = upvalues[8].antiaim
	locals.v3 = locals[nil].fakelag
	locals.v4 = bind(recovered.andromeda_set_visible_4_p212, {[0] = locals.v1})
	locals.v2(locals.v3, locals.v4)
	locals.v2 = upvalues[9].traverse
	locals.v3 = upvalues[8].antiaim.other
	locals.v4 = bind(recovered.andromeda_set_visible_3_p211, {})
	locals.v2(locals.v3, locals.v4)
	locals.v2 = upvalues[10].switch
	locals.v3 = locals.v2
	locals.v2 = locals.v2.get(locals.v3)
	if not (locals.v2 ~= "Configs") then
		locals.v2 = upvalues[9].traverse
		locals.v3 = upvalues[8].antiaim.other
		locals.v4 = bind(recovered.andromeda_set_visible_2_p210, {})
		locals.v2(locals.v3, locals.v4)
	end
	repeat
		locals.v2 = bind(recovered.andromeda_function_23_p213, {})
		locals.v3 = upvalues[10].switch
		locals.v4 = locals.v3
		locals.v3 = locals.v3.get(locals.v4)
		local t21 = false
		t21 = true
		locals.v3 = locals.v3 == "Other"
		locals.v4 = upvalues[10].switch
		locals.v5 = locals.v4
		locals.v4 = locals.v4.get(locals.v5)
		t21 = false
		t21 = true
		locals.v4 = locals.v4 == "Anti-Aim"
		locals.v4 = upvalues[11]()
		locals.v5 = upvalues[10].visuals
		locals.v5 = upvalues[10].visuals.stubs
		locals.v5 = upvalues[10].visuals.stubs
		locals.v6 = locals.v2
		locals.v7 = locals.v5.watermark
		locals.v6 = locals.v6(locals.v7)
		locals.v7 = locals.v2
		locals.v8 = locals.v5.feature_indicators
		locals.v7 = locals.v7(locals.v8)
		locals.v8 = locals.v2
		locals.v9 = locals.v5.manual_arrows
		locals.v8 = locals.v8(locals.v9)
		locals.v9 = locals.v5.watermark
		locals.v9 = locals.v5.watermark
		locals.v10 = locals.v9
		locals.v9 = locals.v9.set_visible
		locals.v11 = locals.v3
		locals.v9(locals.v10, locals.v11)
		locals.v9 = locals.v5.watermark_style
		locals.v9 = locals.v5.watermark_style
		locals.v10 = locals.v9
		locals.v9 = locals.v9.set_visible
		do return locals.v11 end
		locals.v9 = locals.v5.watermark_display
		locals.v9 = locals.v5.watermark_style
		t21 = false
		t21 = true
		locals.v9 = locals.v9 ~= locals.v0
		locals.v9 = locals.v5.watermark_style
		locals.v10 = locals.v9
		locals.v9 = locals.v9.get(locals.v10)
		locals.v9 = "CS2"
		locals.v10 = locals.v5.watermark_display
		locals.v11 = locals.v10
		locals.v10 = locals.v10.set_visible
		locals.v12 = locals.v3
		locals.v12 = locals.v6
		t21 = false
		t21 = true
		locals.v12 = locals.v9 == "CS2"
		locals.v10(locals.v11, locals.v12)
		locals.v9 = locals.v5.watermark_accent_color
		locals.v9 = locals.v5.watermark_style
		t21 = false
		t21 = true
		locals.v9 = locals.v9 ~= locals.v0
		locals.v9 = locals.v5.watermark_style
		locals.v10 = locals.v9
		locals.v9 = locals.v9.get(locals.v10)
		locals.v9 = "CS2"
		locals.v10 = locals.v5.watermark_accent_color
		locals.v11 = locals.v10
		locals.v10 = locals.v10.set_visible
		locals.v12 = locals.v3
		locals.v12 = locals.v6
		t21 = false
		t21 = true
		locals.v12 = locals.v9 == "CS2"
		locals.v10(locals.v11, locals.v12)
		locals.v9 = locals.v5.watermark_style
		t21 = false
		t21 = true
		locals.v9 = locals.v9 ~= locals.v0
		locals.v9 = locals.v5.watermark_style
		locals.v10 = locals.v9
		locals.v9 = locals.v9.get(locals.v10)
		locals.v9 = "CS2"
		locals.v10 = locals.v5.watermark_cs2_gradient
		locals.v11 = locals.v10
		locals.v10 = locals.v10.set_visible
		local t4 = locals.v3
		locals.v12 = t4
		locals.v12 = locals.v6
		t21 = false
		t21 = true
		locals.v12 = locals.v9 == "CS2"
		locals.v10(locals.v11, locals.v12)
		locals.v9 = locals.v5.watermark_position
		locals.v9 = locals.v5.watermark_position
		locals.v10 = locals.v9
		locals.v9 = locals.v9.set_visible
		locals.v11 = locals.v3
		locals.v11 = locals.v6
		locals.v9(locals.v10, locals.v11)
		locals.v9 = locals.v5.feature_indicators
		locals.v9 = locals.v5.feature_indicators
		locals.v10 = locals.v9
		locals.v9 = locals.v9.set_visible
		locals.v11 = locals.v3
		locals.v9(locals.v10, locals.v11)
		locals.v9 = locals.v5.feature_indicators_offset
		locals.v9 = locals.v5.feature_indicators_offset
		locals.v10 = locals.v9
		locals.v9 = locals.v9.set_visible
		locals.v11 = locals.v3
		locals.v11 = locals.v7
		locals.v9(locals.v10, locals.v11)
		locals.v9 = locals.v5.damage_indicator
		locals.v9 = locals.v5.damage_indicator
		locals.v10 = locals.v9
		locals.v9 = locals.v9.set_visible
		locals.v11 = locals.v3
		locals.v9(locals.v10, locals.v11)
		locals.v9 = locals.v5.native_indicators
		locals.v9 = locals.v5.native_indicators_gradient
		locals.v9 = locals.v5.native_indicators_gradient
		locals.v10 = locals.v9
		locals.v9 = locals.v9.set_visible
		locals.v11 = locals.v3
		locals.v11 = locals.v2
		locals.v12 = locals.v5.native_indicators
		locals.v11 = locals.v11(locals.v12)
		locals.v9(locals.v10, locals.v11)
		locals.v24 = 399
		locals.v24 = 191
		locals.v9 = locals.v5.aimbot_logs
		locals.v9 = locals.v5.aimbot_logs
		t4 = t4[9]
		local t5
		locals.v11 = locals.v3
		locals.v9(locals.v10, locals.v11)
		locals.v9 = locals.v5.aimbot_logs_gradient
		locals.v9 = locals.v5.aimbot_logs_gradient
		locals.v10 = locals.v9
		locals.v9 = locals.v9.set_visible
		locals.v11 = locals.v3
		locals.v11 = locals.v2
		locals.v12 = locals.v5.aimbot_logs
		locals.v11 = locals.v11(locals.v12)
		locals.v9(locals.v10, locals.v11)
		locals.v9 = locals.v5.aimbot_logs_hit_label
		locals.v9 = locals.v5.aimbot_logs_hit_label
		locals.v10 = locals.v9
		locals.v9 = locals.v9.set_visible
		locals.v11 = locals.v3
		locals.v11 = locals.v2
		locals.v12 = locals.v5.aimbot_logs
		locals.v11 = locals.v11(locals.v12)
		locals.v9(locals.v10, locals.v11)
		locals.v9 = locals.v5.aimbot_logs_hit_color
		locals.v9 = locals.v5.aimbot_logs_hit_color
		locals.v10 = locals.v9
		locals.v9 = locals.v9.set_visible
		locals.v11 = locals.v3
		locals.v11 = locals.v2
		locals.v12 = locals.v5.aimbot_logs
		locals.v11 = locals.v11(locals.v12)
		locals.v9(locals.v10, locals.v11)
		locals.v9 = locals.v5.aimbot_logs_miss_label
		locals.v9 = locals.v5.aimbot_logs_miss_label
		locals.v10 = locals.v9
		locals.v9 = locals.v9.set_visible
		locals.v11 = locals.v3
		locals.v11 = locals.v2
		locals.v12 = locals.v5.aimbot_logs
		locals.v11 = locals.v11(locals.v12)
		locals.v9(locals.v10, locals.v11)
		locals.v9 = locals.v5.aimbot_logs_miss_color
		locals.v9 = locals.v5.aimbot_logs_miss_color
		locals.v10 = locals.v9
		locals.v9 = locals.v9.set_visible
		locals.v11 = locals.v3
		locals.v11 = locals.v2
		locals.v12 = locals.v5.aimbot_logs
		locals.v11 = locals.v11(locals.v12)
		locals.v9(locals.v10, locals.v11)
		locals.v9 = locals.v5.aimbot_logs_got_label
		locals.v9 = locals.v5.aimbot_logs_got_label
		locals.v10 = locals.v9
		locals.v9 = locals.v9.set_visible
		locals.v11 = locals.v3
		locals.v11 = locals.v2
		locals.v12 = locals.v5.aimbot_logs
		locals.v11 = locals.v11(locals.v12)
		locals.v9(locals.v10, locals.v11)
		locals.v9 = locals.v5.aimbot_logs_got_color
		locals.v9 = locals.v5.aimbot_logs_got_color
		locals.v10 = locals.v9
		locals.v9 = locals.v9.set_visible
		locals.v11 = locals.v3
		locals.v11 = locals.v2
		locals.v12 = locals.v5.aimbot_logs
		locals.v11 = locals.v11(locals.v12)
		locals.v9(locals.v10, locals.v11)
		locals.v9 = locals.v5.manual_arrows
		locals.v9 = locals.v5.manual_arrows
		locals.v10 = locals.v9
		locals.v9 = locals.v9.set_visible
		locals.v11 = locals.v4
		locals.v9(locals.v10, locals.v11)
		locals.v9 = locals.v5.manual_arrows_style
		locals.v9 = locals.v5.manual_arrows_style
		locals.v10 = locals.v9
		locals.v9 = locals.v9.set_visible
		locals.v11 = locals.v4
		locals.v11 = locals.v8
		locals.v9(locals.v10, locals.v11)
		locals.v9 = locals.v5.manual_arrows_offset
		locals.v11 = locals.v8
		locals.v9(locals.v10, locals.v11)
		locals.v9 = locals.v5.manual_arrows_style
		t21 = false
		t21 = true
		locals.v9 = locals.v9 ~= locals.v0
		locals.v9 = locals.v5.manual_arrows_style
		locals.v10 = locals.v9
		locals.v9 = locals.v9.get(locals.v10)
		t21 = false
		t21 = true
		locals.v10 = locals.v9 == 1
		t21 = false
		t21 = true
		locals.v10 = locals.v9 == 2
		t21 = false
		t21 = true
		locals.v10 = locals.v9 == 5
		t21 = false
		t21 = true
		locals.v10 = locals.v9 == "First"
		t21 = false
		t21 = true
		locals.v10 = locals.v9 == "Second"
		t21 = false
		t21 = true
		locals.v10 = locals.v9 == "Fifth"
		t21 = false
		t21 = true
		locals.v10 = locals.v9 == "Triangle"
		t4 = t4[10]
		t5 = nil
		t21 = false
		t21 = true
		locals.v10 = locals.v9 == "Invictus"
		t21 = false
		t21 = true
		locals.v10 = locals.v9 == "Onetap"
		t21 = false
		t21 = true
		locals.v11 = locals.v9 == 3
		t21 = false
		t21 = true
		locals.v11 = locals.v9 == 4
		t21 = false
		t21 = true
		locals.v11 = locals.v9 == "Third"
		t21 = false
		t21 = true
		locals.v11 = locals.v9 == "Fourth"
		t21 = false
		t21 = true
		locals.v11 = locals.v9 == "TeamSkeet Velocity"
		t21 = false
		t21 = true
		locals.v12 = locals.v9 == 6
		t21 = false
		t21 = true
		locals.v12 = locals.v9 == "CS2"
		locals.v13 = locals.v5.manual_arrows_color
		locals.v13 = locals.v5.manual_arrows_color
		locals.v14 = locals.v13
		locals.v13 = locals.v13.set_visible
		locals.v15 = locals.v4
		locals.v15 = locals.v8
		locals.v15 = locals.v10
		locals.v13(locals.v14, locals.v15)
		locals.v13 = locals.v5.manual_arrows_cs2_color
		locals.v13 = locals.v5.manual_arrows_cs2_color
		locals.v14 = locals.v13
		locals.v13 = locals.v13.set_visible
		locals.v15 = locals.v4
		locals.v15 = locals.v8
		locals.v15 = locals.v12
		locals.v13(locals.v14, locals.v15)
		locals.v13 = locals.v5.manual_arrows_ts_cl1
		locals.v13 = locals.v5.manual_arrows_ts_cl1
		locals.v14 = locals.v13
		locals.v13 = locals.v13.set_visible
		locals.v15 = locals.v4
		locals.v15 = locals.v8
		locals.v15 = locals.v11
		locals.v13(locals.v14, locals.v15)
		locals.v13 = locals.v5.manual_arrows_ts_cl2
		locals.v13 = locals.v5.manual_arrows_ts_cl2
		locals.v14 = locals.v13
		locals.v13 = locals.v13.set_visible
		locals.v15 = locals.v4
		locals.v15 = locals.v8
		locals.v13(locals.v14, locals.v15)
		locals.v5 = upvalues[10].visuals
		locals.v5 = upvalues[10].visuals.widgets
		locals.v5 = upvalues[10].visuals.widgets
		locals.v6 = locals.v2
		locals.v7 = locals.v5.aspect_ratio
		locals.v6 = locals.v6(locals.v7)
		locals.v7 = locals.v2
		locals.v8 = locals.v5.thirdperson
		locals.v7 = locals.v7(locals.v8)
		locals.v8 = locals.v2
		locals.v9 = locals.v5.viewmodel
		locals.v8 = locals.v8(locals.v9)
		locals.v9 = locals.v5.aspect_ratio
		locals.v9 = locals.v5.aspect_ratio
		locals.v10 = locals.v9
		locals.v9 = locals.v9.set_visible
		locals.v11 = locals.v3
		locals.v9(locals.v10, locals.v11)
		locals.v9 = locals.v5.aspect_ratio_value
		locals.v9 = locals.v5.aspect_ratio_value
		locals.v10 = locals.v9
		locals.v9 = locals.v9.set_visible
		locals.v11 = locals.v3
		locals.v11 = locals.v6
		locals.v9(locals.v10, locals.v11)
		locals.v9 = locals.v5.thirdperson
		locals.v9 = locals.v5.thirdperson
		locals.v10 = locals.v9
		locals.v9 = locals.v9.set_visible
		locals.v11 = locals.v3
		locals.v9(locals.v10, locals.v11)
		locals.v9 = locals.v5.thirdperson_distance
		locals.v9 = locals.v5.thirdperson_distance
		locals.v10 = locals.v9
		locals.v9 = locals.v9.set_visible
		locals.v11 = locals.v3
		locals.v24 = 460
		locals.v24 = 189
		t21 = false
		t21 = true
		locals.v24 = locals.v24 ~= 239
		locals.v24 = 337
		locals.v24 = 426
		locals.v24 = locals.v24 + 9545
		locals.v24 = locals.v24 - 9875
		locals.v21[612] = locals.v24
		locals.v24 = math_helpers[9]
		locals.v25 = math_helpers[6]
		locals.v24 = locals.v24(locals.v25)
		locals.v24 = locals.v24 + 47
		locals.v24 = locals.v24 - 353
		locals.v24 = locals.v24 + 18433
		locals.v24 = locals.v24 - 17916
		locals.v17[612] = locals.v24
		locals.v23[487] = 611
		local t22 = 27
		local t23 = 1
		locals.v0 = upvalues[11][2][upvalues[11][1]]
		locals.v9(locals.v10, locals.v11)
		locals.v9 = locals.v5.viewmodel
		locals.v9 = locals.v5.viewmodel
		locals.v10 = locals.v9
		locals.v9 = locals.v9.set_visible
		locals.v11 = locals.v3
		locals.v9(locals.v10, locals.v11)
		locals.v9 = locals.v5.viewmodel_fov
		locals.v9 = locals.v5.viewmodel_fov
		locals.v10 = locals.v9
		locals.v9 = locals.v9.set_visible
		locals.v11 = locals.v3
		locals.v11 = locals.v8
		locals.v9(locals.v10, locals.v11)
		locals.v9 = locals.v5.viewmodel_offset_x
		locals.v10 = locals.v9
		locals.v9 = locals.v9.set_visible
		locals.v11 = locals.v3
		locals.v11 = locals.v8
		locals.v9(locals.v10, locals.v11)
		locals.v9 = locals.v5.viewmodel_offset_y
		locals.v9 = locals.v5.viewmodel_offset_y
		locals.v10 = locals.v9
		locals.v9 = locals.v9.set_visible
		locals.v11 = locals.v3
		locals.v11 = locals.v8
		locals.v9(locals.v10, locals.v11)
		locals.v9 = locals.v5.viewmodel_offset_z
		locals.v9 = locals.v5.viewmodel_offset_z
		locals.v10 = locals.v9
		locals.v9 = locals.v9.set_visible
		locals.v11 = locals.v3
		locals.v11 = locals.v8
		locals.v9(locals.v10, locals.v11)
		locals.v9 = locals.v5.viewmodel_options
		locals.v9 = locals.v5.viewmodel_options
		locals.v10 = locals.v9
		locals.v9 = locals.v9.set_visible
		locals.v11 = locals.v3
		locals.v11 = locals.v8
		locals.v9(locals.v10, locals.v11)
		locals.v5 = upvalues[12].new
		locals.v6 = "00000078"
		locals.v5(locals.v6)
		locals.v5 = upvalues[12].new
		locals.v6 = "4E4E4EFF"
		locals.v5(locals.v6)
	do return end
	until true
end

recovered.andromeda_set_visible_p209 = function(upvalues, argument_1, ...)
	local value_1, value_2, value_3, value_4
	value_1 = argument_1
	value_3 = value_1
	value_2 = value_1.set_visible
	value_4 = true
	value_2(value_3, value_4)
	return
end

recovered.andromeda_set_visible_2_p210 = function(upvalues, argument_1, ...)
	local value_1, value_2, value_3, value_4
	value_1 = argument_1
	value_3 = value_1
	value_2 = value_1.set_visible
	value_4 = true
	value_2(value_3, value_4)
	return
end

recovered.andromeda_set_visible_3_p211 = function(upvalues, argument_1, ...)
	local value_1, value_2, value_3, value_4
	value_1 = argument_1
	value_3 = value_1
	value_2 = value_1.set_visible
	value_4 = false
	value_2(value_3, value_4)
	return
end

recovered.andromeda_set_visible_4_p212 = function(upvalues, argument_1, ...)
	local value_1, value_2, value_3, value_4
	value_1 = argument_1
	value_2(value_3, value_4)
	return
end

recovered.andromeda_function_23_p213 = function(upvalues, argument_1, ...)
  local value_0, value_1, value_2, value_13, value_14, value_15, value_16
	value_1 = argument_1
	value_13 = math_helpers[10]
	value_15 = 2
	value_16 = 2
	value_13 = value_13(value_14, value_15, value_16)
	if not (value_13) then
		value_13 = 6
	end
	local t20 = {...}
		value_1 = t20[1]
	value_1 = value_1 >= value_0
	value_2 = false
	return value_2
end

recovered.andromeda_set_visible_5_p214 = function(upvalues, ...)
	local value_13
	local t2
	repeat
		value_13 = 202
	until true
end

recovered.andromeda_set_visible_6_p215 = function(upvalues, argument_1, ...)
	local value_1, value_13
	value_1 = argument_1
	value_13 = 314
	value_13 = 445
end

recovered.andromeda_function_24_p216 = function(upvalues, ...)
  local value_1, value_2, value_3, value_4, value_5, value_6
	value_1 = upvalues[0][151]
	value_2 = 0
	value_3 = upvalues[0][154]
	value_4 = upvalues[0][67]
	value_2 = {}
	value_3 = 146
	value_4 = 183
	local t4
	value_2 = {}
	value_3 = 183
	value_4 = 121
	value_5 = 51
	value_6 = 255
		value_2[1] = value_3
		value_2[2] = value_4
		value_2[3] = value_5
		value_2[4] = value_6
	return value_2
end

recovered.andromeda_m_ntickbase_2_p217 = function(upvalues, argument_1, ...)
	local value_1, value_2, value_13
	value_1 = argument_1
	value_13 = 12
	value_13 = 247
	value_2 = false
	return value_2
end

recovered.andromeda_function_25_p218 = function(upvalues, argument_1, ...)
	local value_1, value_2, value_3
	value_1 = argument_1
	do
		value_2 = upvalues[0]
		value_3 = value_1
		return value_2
	end
	value_2 = upvalues[2][30]()
	value_3 = upvalues[1][2][upvalues[1][1]]
	value_2 = value_2 < value_3
	return value_2
end

recovered.andromeda_lower_p219 = function(upvalues, argument_1, argument_2, argument_3, argument_4, argument_5, ...)
	local value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_8, value_9
	value_1 = argument_1
	value_2 = argument_2
	value_3 = argument_3
	value_4 = argument_4
	value_5 = argument_5
	value_6 = #value_1
	value_6 = value_6 + 1
	value_7 = {}
	value_7.text = value_2
	value_7.color = value_3
	value_8 = value_4
	if not (value_8) then
		value_8 = 100
	end
	value_7.order = value_8
	value_8 = value_5
	if not (value_8) then
		value_8 = string.lower
		value_9 = value_2
		value_8 = value_8(value_9)
	end
	value_7.legacy = value_8
	value_1[value_6] = value_7
	return
end

recovered.andromeda_function_26_p220 = function(upvalues, argument_1, argument_2, ...)
  local value_0, value_1, value_2, value_3, value_4, value_14, value_15
	value_1 = argument_1
	value_2 = argument_2
	value_14 = math_helpers[5]
	value_15 = math_helpers[6]
	value_14 = value_14(value_15)
	value_14 = 47
	local t21 = {...}
		value_1 = t21[1]
		value_2 = t21[2]
	value_3 = upvalues[0][154]
	value_4 = value_2
	value_4 = 1
	value_4 = value_1 * value_4
	value_4 = value_4 + 0.5
	value_0 = value_3 == nil
end

recovered.andromeda_function_27_p221 = function(upvalues, argument_1, argument_2, ...)
	local value_1, value_2, value_3, value_4
	value_1 = argument_1
	value_2 = argument_2
	value_3 = upvalues[0][161]
	value_4 = value_2 - value_1
	value_3 = value_3(value_4)
	value_3 = value_3 <= 2
	return value_3
end

recovered.andromeda_angles_2_p222 = function(upvalues, ...)
	local locals = make_locals()
	locals.v18 = math_helpers[9]
	locals.v19 = math_helpers[6]
	locals.v18 = locals.v18(locals.v19)
	if not (locals.v18) then
		locals.v18 = 410
	end
	return unpack_locals(locals, 1, -1)
end

recovered.andromeda_function_28_p223 = function(upvalues, argument_1, ...)
	local value_1, value_2, value_3, value_4
	value_1 = argument_1
	value_2 = upvalues[0]
	value_3 = value_1
	value_4 = -90
	value_2 = value_2(value_3, value_4)
	if value_2 then
		return value_2
	end
	value_2 = upvalues[0]
	value_3 = value_1
	value_4 = 90
	value_2 = value_2(value_3, value_4)
	if not value_2 then
		value_2 = nil
		return value_2
	else
		value_2 = 90
		return value_2
	end
end

recovered.andromeda_normalize_p224 = function(upvalues, ...)
  local value_0, value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_8, value_9
  local value_18, value_19, value_20, value_21
	value_1 = upvalues[0][32]()
	if value_1 == value_0 then
		return value_2
	end
	value_18 = math_helpers[10]
	value_19 = "\181"
	value_18 = value_18(value_19, value_20, value_21)
	if not (value_18) then
		value_18 = math_helpers[8]
		value_19 = math_helpers[6]
		value_18 = value_18(value_19)
	end
	value_2 = upvalues[1]
	value_3 = value_1
	value_2 = value_2(value_3)
	if value_2 ~= value_0 then
		return value_4
	else
		return value_3
	end
	value_4 = upvalues[2]
	value_5 = value_1
	value_4 = value_4(value_5)
	if value_4 ~= value_0 then
		value_5 = upvalues[3]
		value_6 = upvalues[4].normalize
		value_7 = value_3.eye_angles_y
		value_7 = value_7 - value_4
		value_8 = -180
		value_9 = 180
		value_6 = value_6(value_7, value_8, value_9)
		return value_5()
	else
		return value_5
	end
end

recovered.andromeda_userid_p225 = function(upvalues, argument_1, ...)
  local value_0, value_1, value_2, value_3, value_11, value_12, value_13, value_14, value_15, value_16
  local value_17
	value_1 = argument_1
	if not (value_1 == value_0) then
		value_2 = upvalues[0][54]
		value_3 = value_1.userid
		value_2 = value_2(value_3)
		value_3 = upvalues[0][32]()
		if not (value_2 ~= value_3) then
			value_13 = 444
			if not (value_13) then
				value_13 = math_helpers[7]
				value_14 = "6"
			end
			value_14 = math_helpers[10]
			value_15 = "2\222"
			value_16 = 1
			value_14 = value_14(value_15, value_16, value_17)
			value_13 = value_13 == value_14
			if value_13 then
				value_13 = 424
			end
			if not (value_13) then
				value_13 = 465
			end
			value_13 = value_13 + 24368
			value_13 = value_13 - 24831
			value_11[90] = value_13
			value_12[8] = 64
		end
	end
	return
end

recovered.andromeda_fps_optimization_options_p226 = function(upvalues, argument_1, ...)
	local value_1, value_2, value_3, value_4
	value_1 = argument_1
	value_2 = upvalues[0].visuals
	value_3 = upvalues[0].visuals.fps_optimization_options
	if value_3 == nil then
		return value_2
	end
	value_2 = upvalues[0].visuals.fps_optimization_options
	value_3 = value_2
	value_2 = value_2.get
	value_4 = value_1
	value_2 = value_2(value_3, value_4)
	value_2 = value_2 == true
	return value_2
end

recovered.andromeda_cache_p227 = function(upvalues, argument_1, argument_2, ...)
	local value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_8, value_11, value_12
	local value_23, value_24, value_25, value_26
	value_1 = argument_1
	value_2 = argument_2
	value_3 = upvalues[0].cache
	value_3 = value_3[value_1]
	value_23 = math_helpers[8]
	value_24 = math_helpers[6]
	value_23 = value_23(value_24)
	if not (value_23) then
		value_23 = math_helpers[10]
		value_24 = "\129t\236Y\160"
		value_25 = 2 / value_25
		value_26 = 4
		value_23 = value_23(value_24, value_25, value_26)
	end
	repeat
		repeat
			repeat
				value_3 = upvalues[0].cache
				value_3 = value_3[value_1]
				do return value_8 end
				value_4 = {}
				value_5 = 1
				value_6 = #value_4
				value_7 = 1
				local t13 = {parent = nil, index = nil, step = nil, limit = nil}
				local t15 = value_6
				local t16 = value_7
				local t14 = value_5 - t16
				repeat
					t14 = t14 + t16
					value_8 = t14
					value_11 = value_11(value_12)
				until true
			until true
		until t16 > 0
	until t14 <= t15
end

recovered.andromeda_order_p228 = function(upvalues, argument_1, ...)
  local value_0, value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_8, value_9
  local value_18
	local t3
	value_1 = argument_1
	value_2 = upvalues[0].skip_native_cleanup()
	if not value_2 then
		return
	else
		value_2 = true
		return value_2
	end
	value_2 = value_1 ~= value_0
	if value_2 then
		value_2 = value_1.text
	end
	if not (value_2) then
	end
	if value_2 == value_0 then
		return value_3
	end
	value_3 = upvalues[2][29]()
	value_4 = upvalues[1].begin_capture_frame
	value_5 = type
	value_6 = value_3
	value_5 = value_5(value_6)
	value_5 = value_5 == "number"
	if value_5 then
		value_5 = value_3
	end
	if not (value_5) then
	end
	value_4(value_5)
	value_4 = upvalues[1].capture_count
	value_5 = upvalues[1].max_items
	if value_5 <= value_4 then
		return value_4
	end
	value_4 = upvalues[1].capture_count
	value_4 = value_4 + 1
	value_5 = upvalues[1].capture_items
	value_5 = value_5[value_4]
	value_6[value_4] = value_5
	value_6 = tostring
	value_7 = value_2
	value_6 = value_6(value_7)
	value_7 = value_1.r
	if not (value_7) then
		value_7 = 255
	end
	value_5.r = value_7
	value_7 = value_1.g
	if not (value_7) then
		value_7 = 255
	end
	value_5.g = value_7
	value_7 = value_1.b
	value_5.b = value_7
	value_7 = value_1.a
	if not (value_7) then
		value_7 = 255
	end
	value_5.a = value_7
	value_7 = upvalues[1].classify
	value_8 = value_6
	-- Luraph junk / invalid SSA expression removed
	if not (value_18) then
		value_18 = 367
	end
	value_5.order = value_7
	value_5.sequence = value_4
	value_7 = upvalues[1].get_animation_key
	value_9 = value_5.text
	value_7 = value_7(value_8, value_9)
	value_5.key = value_7
	upvalues[1].capture_count = value_4
	value_7 = upvalues[2][30]()
	upvalues[1].last_capture_time = value_7
	value_7 = true
	return value_7
end

recovered.andromeda_handlers_3_p229 = function(upvalues, ...)
	local value_1
	value_1 = upvalues[0].handlers.import
	value_1()
	return
end

recovered.andromeda_update_yaw_jitter_p230 = function(upvalues, argument_1, argument_2, argument_3, argument_4, argument_5, argument_6, argument_7, argument_8, argument_9, argument_10, argument_11, argument_12, argument_13, argument_14, argument_15, argument_16, argument_17, argument_18, argument_19, argument_20, argument_21, argument_22, argument_23, argument_24, argument_25, argument_26, argument_27, argument_28, argument_29, argument_30, argument_31, ...)
	local value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_8, value_9, value_10
	local value_11, value_12, value_13, value_14, value_15, value_16, value_17, value_18, value_19, value_20
	local value_21, value_22, value_23, value_24, value_25, value_26, value_27, value_28, value_29, value_30
	local value_31
	value_1 = argument_1
	value_2 = argument_2
	value_3 = argument_3
	value_4 = argument_4
	value_5 = argument_5
	value_6 = argument_6
	value_7 = argument_7
	value_8 = argument_8
	value_9 = argument_9
	value_10 = argument_10
	value_11 = argument_11
	value_12 = argument_12
	value_13 = argument_13
	value_14 = argument_14
	value_15 = argument_15
	value_16 = argument_16
	value_17 = argument_17
	value_18 = argument_18
	value_19 = argument_19
	value_20 = argument_20
	value_21 = argument_21
	value_22 = argument_22
	value_23 = argument_23
	value_24 = argument_24
	value_25 = argument_25
	value_26 = argument_26
	value_27 = argument_27
	value_28 = argument_28
	value_29 = argument_29
	value_30 = argument_30
	value_31 = argument_31
	upvalues[0]:unset_aa()
	value_2 = upvalues[1]
	value_3 = upvalues[2][2][upvalues[2][1]].current
	value_2 = value_2(value_3)
	value_3 = upvalues[0]
	value_4 = value_3
	value_3 = value_3.update_hotkeys
	value_5 = value_1
	value_3(value_4, value_5)
	upvalues[0]:update_disable_fakelag()
	value_3 = upvalues[0]
	value_4 = value_3
	value_3 = value_3.update_safehead
	value_5 = upvalues[2][2][upvalues[2][1]].current
	value_3 = value_3(value_4, value_5)
	if value_3 then
		repeat
			value_3 = upvalues[0]
			value_4 = value_3
			value_3 = value_3.update_defensive
			value_5 = value_1
			value_3 = value_3(value_4, value_5)
			upvalues[0]:set_aa()
			do return end
			value_3 = upvalues[0]
			value_4 = value_3
			value_3 = value_3.update_pitch
			value_5 = value_2
			value_3(value_4, value_5)
			value_3 = upvalues[0]
			value_4 = value_3
			value_3 = value_3.update_defensive_yaw_double_delay
			value_5 = value_1
			value_3 = value_3(value_4, value_5)
		until true
	end
	-- Luraph junk / invalid SSA expression removed
end

recovered.andromeda_get_gradient_alpha_2_p231 = function(upvalues, ...)
	local locals = make_locals()
	local t7 = 0
	locals.v1 = upvalues[0].skip_native_cleanup()
	locals.v1 = upvalues[1].active
	locals.v1 = upvalues[1].items
	locals.v1 = locals_length(locals)[1]
	locals.v2 = upvalues[2][30]()
	locals.v3 = upvalues[1].get_dpi_scale()
	locals.v4 = upvalues[2][154]
	locals.v5 = locals.v3 * 5
	locals.v8 = locals.v8(locals.v9)
	locals.v6 = locals.v6(unpack_locals(locals, 7, t7))
	locals.v7 = upvalues[2][151]
	locals.v8 = 4
	locals.v9 = upvalues[2][154]
	locals.v10 = locals.v3 * 6
	locals.v10 = locals.v10 + 0.5
	locals.v9 = 2
	locals.v10 = upvalues[2][154]
	locals.v11 = locals.v3 * 3
	locals.v11 = locals.v11 + 0.5
	locals.v10 = locals.v10(locals.v11)
	locals.v8 = locals.v8(unpack_locals(locals, 9, t7))
	locals.v9 = upvalues[1].get_gradient_alpha()
	locals.v10 = 0
	locals.v11 = locals.v1
	locals.v12 = 1
	locals.v13 = -1
	local t11 = {parent = nil, index = nil, step = nil, limit = nil}
	local t13 = locals.v12
	local t12 = locals.v11 - locals.v13
	repeat
		t12 = t12 + t14
		locals.v14 = t12
		do return end
		locals.v59 = upvalues[1].items
		locals.v15 = locals.v15[locals.v14]
		locals.v16 = locals.v15.time
		locals.v16 = locals.v2 - locals.v16
		locals.v17 = upvalues[1].hold_time
		locals.v17 = table
		local t4 = upvalues
		locals.v18 = upvalues[1].items
		locals.v19 = locals.v14
		locals.v17(locals.v18, locals.v19)
		locals.v17 = upvalues[3].clamp
		locals.v18 = upvalues[1].hold_time
		locals.v18 = locals.v18 - locals.v16
		locals.v18 = locals.v18 / 0.45
		locals.v19 = 0
		locals.v20 = 1
		locals.v17 = locals.v17(locals.v18, locals.v19, locals.v20)
		locals.v18 = upvalues[3].clamp
		locals.v19 = locals.v16 / 0.18
		locals.v20 = 0
		locals.v21 = 1
		locals.v18 = locals.v18(locals.v19, locals.v20, locals.v21)
		locals.v19 = upvalues[2][154]
		locals.v20 = upvalues[2][162]
		locals.v21 = locals.v17
		locals.v22 = locals.v18
		locals.v20 = locals.v20(locals.v21, locals.v22)
		locals.v20 = locals.v20 * 255
		locals.v20 = locals.v20 + 0.5
		locals.v22 = locals.v7 * 2
		locals.v22 = locals.v20 + locals.v56
		locals.v23 = locals.v8 * 2
		locals.v23 = locals.v21 + locals.v23
		locals.v24 = upvalues[2][154]
		locals.v25 = 1 - locals.v18
		locals.v25 = locals.v25 * 12
		locals.v25 = locals.v25 + 0.5
		locals.v28 = locals.v23 - locals.v21
		locals.v28 = locals.v28 * 0.5
		locals.v28 = locals.v28 + 0.5
		locals.v27 = locals.v27(locals.v28)
		locals.v27 = locals.v25 + locals.v27
		locals.v28 = upvalues[2][154]
		locals.v29 = locals.v9 * locals.v19
		locals.v56 = math_helpers[8]
		locals.v57 = math_helpers[6]
		locals.v56 = locals.v56(locals.v57)
		locals.v56 = math_helpers[7]
		locals.v57 = ""
		locals.v56 = locals.v56(locals.v57)
		locals.v31 = locals.v25
		locals.v32 = locals.v22
		locals.v33 = locals.v23
		locals.v34 = locals.v28
		locals.v29(locals.v30, locals.v31, locals.v32, locals.v33, locals.v34)
		locals.v29 = 1
		locals.v30 = locals.v15.segments
		locals.v30 = locals_length(locals)[30]
		locals.v31 = 1
		local t21 = {}
		t21.parent = t11
		t21.index = t12
		t21.step = t14
		t21.limit = t13
		t11 = t21
		t13 = locals.v30
		local t14 = locals.v31
		t12 = locals.v29 - t14
		t12 = t12 + t14
		locals.v32 = t12
	until true
	locals.v40 = locals.v27
	locals.v41 = locals.v34
	locals.v42 = locals.v35
	locals.v43 = locals.v36
	locals.v44 = locals.v37
	locals.v45 = "d"
	locals.v46 = 0
	locals.v47 = locals.v33[1]
	locals.v38(locals.v39, locals.v40, locals.v41, locals.v42, locals.v43, locals.v44, locals.v45, locals.v46, locals.v47)
	locals.v38 = upvalues[2][136]
	locals.v39 = "d"
	locals.v40 = locals.v33[1]
	locals.v38 = locals.v38(locals.v39, locals.v40)
	locals.v39 = locals.v38
	if not (locals.v39) then
		locals.v39 = 0
	end
	locals.v26 = locals.v26 + locals.v39
end

recovered.update_p232 = function(upvalues, ...)
	local locals = make_locals()
	locals.v1 = upvalues[0].skip_native_cleanup
	return unpack_locals(locals, 1, -1)
end

recovered.shutdown_p233 = function(upvalues, ...)
	local value_1, value_2, value_3, value_4, value_13
	value_1 = upvalues[0].set_callback
	value_2 = "aim_fire"
	value_3 = upvalues[1].aim_fire
	if not (value_13) then
		value_13 = 185
	end
	value_4 = false
	value_1(value_2, value_3, value_4)
	value_1 = upvalues[0].set_callback
	value_2 = "player_hurt"
	value_3 = upvalues[1].player_hurt
	value_4 = false
	value_1(value_2, value_3, value_4)
	value_2 = "paint"
	value_3 = upvalues[1].paint
	value_4 = false
	value_1(value_2, value_3, value_4)
	upvalues[1].active = false
	value_1 = upvalues[1].clear
	value_1()
	return
end

recovered.update_callbacks_p234 = function(upvalues, argument_1, ...)
  local value_0, value_1, value_2, value_14, value_15
	value_1 = argument_1
	value_14 = 489
	if not (value_14) then
		value_14 = math_helpers[8]
		value_15 = math_helpers[6]
		value_0 = value_0 + value_14
	end
	local t20 = {...}
		value_1 = t20[1]
	value_1 = value_1 == true
	value_2 = upvalues[0].active
	if not (value_1 == true) then
		value_2 = upvalues[0].reset
		value_2()
	end
	return
end

recovered.andromeda_initialized_p235 = function(upvalues, argument_1, argument_2, argument_3, argument_4, argument_5, ...)
  local value_0, value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_8, value_9
  local value_10, value_11, value_12, value_13, value_14, value_15, value_22, value_24, value_25, value_26
  local value_27, value_28
	value_1 = argument_1
	value_2 = argument_2
	value_3 = argument_3
	value_4 = argument_4
	value_5 = argument_5
	value_6 = upvalues[0][30]()
	value_7 = value_2
	if not (value_7) then
		value_7 = 0
	end
	value_8 = value_3
	if not (value_8) then
		value_8 = 0
	end
	value_9 = value_4
	if not (value_9) then
		value_9 = 0
	end
	if value_0 then
		value_1.spin_dir = value_12
		value_12 = value_1.base_yaw
		value_13 = value_1.spin_dir
		value_4 = value_9 * value_13
		value_12 = value_12 + value_13
		value_1.target_yaw = value_12
		value_1.start_time = value_6
		value_11 = 0
	else
		value_11 = value_5
		if not (value_11) then
			value_11 = 1
		end
		value_11 = value_11 / 10
		value_12 = 0.01
		value_10 = value_10(value_11, value_12)
		value_1.initialized = true
		value_11 = upvalues[1].random_int
		value_12 = value_7
		value_13 = value_8
		value_11 = value_11(value_12, value_13)
		value_1.base_yaw = value_11
		value_11 = upvalues[1].random_int
		value_12 = 0
		value_13 = 1
		value_11 = value_11(value_12, value_13)
		value_11 = value_11 == 0
		if value_11 then
			-- Luraph junk / invalid SSA expression removed
		end
		if not (value_11) then
			value_11 = 1
		end
		value_11 = value_11 + value_12
		value_1.target_yaw = value_11
		value_1.start_time = value_6
		value_11 = value_1.start_time
		value_11 = value_6 - value_11
		if not (value_10 > value_11) then
			if value_12 then
				value_12 = -1
			end
			if not (value_12) then
				value_12 = 1
			end
		end
	end
	value_12 = upvalues[0][162]
	value_13 = value_11 / value_10
	value_14 = 1
	-- Luraph junk / invalid SSA expression removed
	if not (value_25) then
		value_25 = math_helpers[10]
		value_26 = "\221nm"
		value_27 = 1
		value_25 = value_25(value_26, value_27, value_28)
	end
	value_25 = value_25 + 16352
	value_25 = value_25 - 16561
	value_22[7] = value_25
	value_24[49] = 207
	value_12 = value_12(value_13, value_14)
	value_13 = value_1.base_yaw
	value_14 = value_1.target_yaw
	value_15 = value_1.base_yaw
	return value_13
end

recovered.andromeda_packets_p236 = function(upvalues, ...)
	local value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_8, value_9, value_10
	local value_11, value_12, value_13, value_14, value_20, value_21
	value_21 = 169
	if not (value_21) then
		value_21 = 75
	end
	value_21 = value_21 + 27400
	value_21 = value_21 - 27347
	value_14[93] = value_21
	value_20[92] = 92
	value_13 = value_13()
	value_6 = value_4
	if not (value_6) then
		value_6 = 1
	end
	value_7 = value_5
	value_8 = upvalues[0][2][upvalues[0][1]].packets
	value_9 = value_1.last_flick_at
	value_8 = value_8 - value_9
	if not (value_6 > value_8) then
		local t4 = nil - nil
		value_8 = not value_8
		value_1.flicker = value_8
		value_8 = upvalues[0][2][upvalues[0][1]].packets
		value_1.last_flick_at = value_8
	end
	value_8 = value_1.flicker
	if value_8 then
		value_8 = value_2
	end
	if not (value_8) then
		value_8 = value_3
	end
	value_9 = value_8
	if not (value_9) then
		value_9 = 0
	end
	value_8 = value_9
	if not (value_7 == 0) then
		value_9 = 1
		if not (value_9) then
			value_9 = -1
		end
		value_10 = upvalues[1].random_int
		value_11 = 0
		value_12 = value_7
		value_10 = value_10(value_11, value_12)
	end
	value_9 = value_8
	value_10 = value_1.flicker
	return value_9, value_10
end

recovered.andromeda_defensive_refraction_pitch_state_p237 = function(upvalues, ...)
	local value_1
	value_1 = upvalues[0].defensive_refraction_pitch_state
	value_1.initialized = false
	value_1 = upvalues[0].defensive_refraction_yaw_state
	value_1.initialized = false
	return
end

recovered.andromeda_bayonet_p238 = function(upvalues, argument_1, ...)
	local locals = make_locals()
	local t8 = 0
	locals.v1 = argument_1
	locals.v2 = upvalues[0][32]()
	locals.v3 = upvalues[0][37]
	locals.v4 = locals.v2
	locals.v3 = locals.v3(locals.v4)
	if locals.v3 then
		return
	end
	locals.v5 = upvalues[2]
	locals.v6 = locals.v2
	locals.v5 = locals.v5(locals.v6)
	locals.v7 = locals.v5
	locals.v6 = locals.v5.get_anim_state(locals.v7)
	locals.v7 = upvalues[3]
	locals.v8 = upvalues[0][47]
	locals.v9 = locals.v2
	locals.v10 = "m_vecVelocity"
	locals.v8 = locals.v8(locals.v9, locals.v10)
	locals.v7 = locals.v7(unpack_locals(locals, 8, t8))
	locals.v9 = locals.v7
	locals.v8 = locals.v7.length2dsqr(locals.v9)
	locals.v8 = locals.v8 > 25
	upvalues[4][2][upvalues[4][1]].moving = locals.v8
	locals.v8 = bit
	locals.v8 = locals.v16.band
	locals.v9 = upvalues[5][2][upvalues[5][1]]
	locals.v10 = upvalues[6][2][upvalues[6][1]]
	locals.v11 = bit.lshift
	locals.v12 = 1
	locals.v13 = 0
	locals.v11 = locals.v11(locals.v12, locals.v13)
	locals.v8 = locals.v8(unpack_locals(locals, 9, t8))
	locals.v8 = locals.v8 == 0
	upvalues[4][2][upvalues[4][1]].on_land = locals.v8
	locals.v9 = locals.v2
	locals.v10 = "m_flDuckAmount"
	locals.v8 = locals.v8(locals.v9, locals.v10)
	locals.v9 = locals.v6.m_velocity
	upvalues[4][2][upvalues[4][1]].velocity = locals.v9
	locals.v9 = locals.v1.chokedcommands
	upvalues[7][2][upvalues[7][1]] = locals.v9
	locals.v9 = locals.v1.chokedcommands
	if not (locals.v9 ~= 0) then
		locals.v9 = locals.v1.allow_send_packet
		locals.v9 = locals.v8 > 0.5
		upvalues[4][2][upvalues[4][1]].duck_amount = locals.v8
		locals.v9 = upvalues[4][2][upvalues[4][1]].packets
		locals.v9 = locals.v9 + 1
		upvalues[4][2][upvalues[4][1]].packets = locals.v9
	end
	locals.v9 = upvalues[0][52]()
	locals.v10 = upvalues[9]
	locals.v11 = locals.v2
	locals.v12 = locals.v9
	locals.v10 = locals.v10(locals.v11, locals.v12)
	upvalues[4][2][upvalues[4][1]].peeking = locals.v10
	locals.v10 = locals.v4.weapon_type_int
	locals.v10 = upvalues[10][locals.v10]
	locals.v11 = locals.v4.console_name
	if locals.v10 == "knife" then
		locals.v11 = locals.v11
		locals.v10 = locals.v11.gsub
		locals.v14 = "weapon_"
		locals.v15 = ""
		locals.v12 = locals.v12(locals.v13, locals.v14, locals.v15)
		locals.v13 = locals.v12
		locals.v12 = locals.v12.gsub
		locals.v14 = "_.*"
		locals.v15 = ""
		locals.v12 = locals.v12(locals.v13, locals.v14, locals.v15)
		locals.v12 = locals.v12 == "gsub"
		locals.v14 = "bayonet"
		locals.v15 = "knife"
		locals.v12 = locals.v12(locals.v13, locals.v14, locals.v15)
		locals.v13 = locals.v12
		locals.v12 = locals.v12.gsub
		locals.v14 = "g3sg1"
		locals.v15 = "autosnipers"
		-- Luraph junk / invalid SSA expression removed
		locals.v13 = locals.v12
		locals.v12 = locals.v12.gsub
		locals.v14 = "scar20"
		locals.v15 = "autosnipers"
		locals.v12 = locals.v12(locals.v13, locals.v14, locals.v15)
		upvalues[4][2][upvalues[4][1]].weapon_group = locals.v12
	elseif locals.v10 == "sniper" then
	else
		locals.v13 = locals.v11
		locals.v12 = locals.v11.gsub
		locals.v14 = "weapon_"
		locals.v15 = ""
		locals.v12 = locals.v12(locals.v13, locals.v14, locals.v15)
		if not (locals.v12 == "deagle") then
			locals.v28 = locals.v4.is_revolver
		end
	end
	repeat
		locals.v12 = upvalues[0][47]
		locals.v13 = locals.v3
		locals.v14 = "m_flNextSecondaryAttack"
		locals.v12 = locals.v12(locals.v13, locals.v14)
		locals.v13 = upvalues[0][47]
		locals.v14 = locals.v3
		locals.v15 = "m_flNextPrimaryAttack"
		locals.v13 = locals.v13(locals.v14, locals.v15)
		locals.v14 = upvalues[0][47]
		locals.v15 = locals.v2
		locals.v16 = "m_flNextAttack"
		locals.v14 = locals.v14(locals.v15, locals.v16)
		locals.v15 = upvalues[0][26]()
	until true
	local t22 = false
	locals.v15 = locals.v14 < locals.v15
	if locals.v15 then
		locals.v15 = upvalues[0][26]()
		locals.v15 = locals.v12 < locals.v15
	end
	if locals.v15 then
		locals.v15 = upvalues[0][26]
		locals.v17 = locals.v17()
		locals.v15 = locals.v13 < locals.v15
	end
	upvalues[4][2][upvalues[4][1]].weapon_ready = locals.v15
	return
end

recovered.andromeda_function_29_p239 = function(upvalues, ...)
	return
end

recovered.andromeda_scout_p240 = function(upvalues, argument_1, ...)
	local value_1, value_2, value_3, value_4, value_5
	value_1 = argument_1
	value_2 = upvalues[0]
	value_3 = value_1
	value_2 = value_2(value_3)
	value_3 = nil
	-- Luraph junk / invalid SSA expression removed
	repeat
		repeat
			value_5 = "Scout"
			do return value_5 end
			value_3 = value_2.type
			value_4 = value_2.idx
			if value_3 ~= "pistol" then
			elseif value_4 ~= 1 then
				value_5 = "Revolver R8"
				repeat
					value_5 = "Auto Snipers"
				do return value_5 end
				until value_4 ~= 9
			else
				value_5 = "Desert Eagle"
				return value_5
			end
			value_5 = "AWP"
		do return value_5 end
		until true
	until value_4 ~= 40
end

recovered.andromeda_slow_motion_p241 = function(upvalues, ...)
	local locals = make_locals()
	locals.v1 = locals.v1 >= "get"
	return unpack_locals(locals, 0, -2)
end

recovered.is_double_tap_p242 = function(upvalues, argument_1, ...)
	local value_1, value_2, value_3
	value_1 = argument_1
	repeat

		do return value_2 end
		value_3 = value_2
		value_2 = value_2.get(value_3)
	until not value_2
end

recovered.andromeda_hitchance_p243 = function(upvalues, ...)
	local value_1, value_2
	if value_1 then
		value_1 = upvalues[0].ragebot.hitchance.enabled
	end
	if value_1 then
		value_1 = upvalues[0].ragebot.hitchance.enabled
		value_2 = value_1
		value_1 = value_1.get
	end
	return value_1
end

recovered.andromeda_get_raw_value_p244 = function(upvalues, argument_1, ...)
	local value_1, value_2, value_3, value_4, value_5, value_6
	value_1 = argument_1
	value_2 = upvalues[0]
	value_3 = upvalues[1]
	value_3 = upvalues[0]
	value_3 = upvalues[3][value_3]
	if not (value_3 ~= nil) then
		value_3 = upvalues[0]
		value_4 = {}
		upvalues[3][value_3] = value_4
	end
	value_4 = {}
	value_4.type = value_2
	value_5 = upvalues[4].get_raw_value(value_6)
	value_4.value = value_5
	value_3[value_2] = value_4
end

recovered.is_on_shot_antiaim_p245 = function(upvalues, argument_1, ...)
	local value_1, value_2, value_3
	value_1 = argument_1
	value_2 = upvalues[0].antiaim.other.on_shot_antiaim
	value_2 = value_2[1].hotkey
	value_3 = value_2
	value_2 = value_2.get(value_3)
	if value_2 then
		value_2 = upvalues[0].antiaim.other.on_shot_antiaim
		value_2 = value_2[1]
		value_3 = value_2
		value_2 = value_2.get(value_3)
	end
	if value_2 then
		value_2 = upvalues[0].is_fake_duck()
		value_2 = not value_2
	end
	return value_2
end

recovered.andromeda_minimum_damage_override_2_p246 = function(upvalues, ...)
  local value_1, value_2, value_9, value_11, value_12, value_13
	local t2
	value_12 = 343
	if not (value_12) then
		value_12 = 166
	end
	value_12 = math_helpers[7]
	value_13 = "\253\031\216"
	value_12 = value_12(value_13)
	if not (value_12) then
		value_12 = 391
	end
	value_12 = value_12 + 8084
	value_12 = value_12 - 8086
	value_9[49] = value_12
	value_11[71] = 46
	value_2 = value_1
	value_1 = value_1.get(value_2)
	return value_1
end

recovered.andromeda_configs_db_p247 = function(upvalues, argument_1, argument_2, ...)
	local value_1, value_2, value_4, value_5, value_6, value_7, value_8, value_9, value_10, value_11
	local value_20, value_157, value_158, value_159, value_160, value_161, value_162, value_163, value_164, value_165
	value_1 = argument_1
	value_2 = argument_2
	value_20 = 380
	if not (value_20) then
		value_20 = 12
	end
	do return end
	value_7 = -1
	local t13 = {parent = nil, index = nil, step = nil, limit = nil}
	local t15 = value_6
	local t16 = value_7
	local t14 = value_5 - t16
	repeat
		t14 = t14 + t16
		value_8 = t14
		if (t16 > 0 or t14 + t16 < t15) and (t16 <= 0 or t14 + t16 > t15) then
			value_6 = value_1
			value_5 = value_1.write_db(value_6)
			if not value_5 then
				value_5 = upvalues[0][86]
				value_6 = "play resource/warning.wav"
				value_5(value_6)
				return
			end
			break
		end
		value_9 = value_1.configs_db.cfg_list
		value_9 = value_9[value_8]
		value_9 = value_9[1]
	until value_9 ~= value_4
	value_9 = table.remove
	value_10 = value_1.configs_db.cfg_list
	value_11 = value_8
	return value_157, value_158, value_159, value_160, value_161, value_162, value_163, value_164, value_165
end

recovered.load_config_p248 = function(upvalues, argument_1, argument_2, ...)
	local locals = make_locals()
	locals.v1 = argument_1
	locals.v2 = argument_2
	locals.v4 = locals.v1
	locals.v3 = locals.v1.build_maps
	locals.v3(locals.v4)
	locals.v18 = 119
	if not (locals.v18) then
		locals.v18 = math_helpers[9]
		locals.v19 = math_helpers[6]
		locals.v18 = locals.v18(locals.v19)
	end
	locals.v4 = locals.v3[2]
	locals.v5 = locals.v3[2]
	if locals.v5 == "" then
		return
	end
	locals.v4 = locals.v1.configs_db.cfg_list
	locals.v4 = locals_length(locals)[4]
	if locals.v4 < locals.v2 then
		return
	end
	locals.v6 = locals.v4
	locals.v5 = locals.v5(locals.v6)
	if locals.v5 ~= "table" then
		return
	end
	if locals.v6 then
		locals.v9 = locals.v4.antiaim
		locals.v6(locals.v7, locals.v8, locals.v9)
	end
	locals.v6 = locals.v5.Visuals
	if locals.v6 then
		locals.v7 = locals.v1
		locals.v6 = locals.v1.apply_group
		locals.v8 = locals.v1.maps.visuals
		locals.v9 = locals.v4.visuals
		locals.v6(unpack_locals(locals, 7, 255))
	end
	locals.v6 = upvalues[0][86]
	locals.v7 = "play ui\\beepclear"
	locals.v6(locals.v7)
	return
end

recovered.andromeda_peeking_time_p249 = function(upvalues, argument_1, argument_2, argument_3, argument_4, ...)
	local locals = make_locals()
	locals.v1 = argument_1
	locals.v2 = argument_2
	locals.v3 = argument_3
	locals.v4 = argument_4
	locals.v17 = 399
	local t23 = {...}
		locals.v1 = t23[1]
		locals.v2 = t23[2]
		locals.v3 = t23[3]
		locals.v4 = t23[4]
	do
		locals.v5 = false
		return locals.v5
	end
	locals.v5 = entity
	locals.v5 = locals[nil].get_flag
	locals.v6 = locals.v2
	locals.v7 = "Occluded"
	locals.v5 = locals.v5(locals.v6, locals.v7)
	locals.v5 = entity.get_flag
	locals.v6 = locals.v2
	locals.v7 = "Hit"
	locals.v5 = locals.v5(locals.v6, locals.v7)
	locals.v5 = latest_time_peek
	locals.v7 = peeking_time
	locals.v6 = locals.v6 - locals.v7
	locals.v5 = locals.v5(locals.v6)
	if locals.v3 > locals.v5 then
		locals.v5 = true
		return locals.v5
	else
		locals.v5 = false
		return locals.v5
	end
	peeking_time = locals.v0
	latest_time_peek = locals.v0
	locals.v5 = false
	return locals.v5
end

recovered.andromeda_fakelag_exploit_tick_p250 = function(upvalues, ...)
  local value_0, value_1, value_2, value_3, value_4, value_5, value_6, value_8, value_14, value_15
  local value_16
	value_15 = 79
	if not (value_15) then
		value_15 = 511
	end
	value_15 = 252
	if not (value_15) then
		value_15 = math_helpers[7]
		value_16 = "\218"
		value_15 = value_15(value_16)
	end
	local t3 = 15
	local t2 = 1032
	value_15 = value_15 - 6995
	value_8[32] = value_15
	value_14[43] = 45
	value_1 = upvalues[0].is_enabled()
	value_1 = upvalues[1].antiaim
	value_1 = value_1 ~= value_0
	if not (value_1) then
	end
	value_2 = value_1 ~= value_0
	value_2 = value_1.fakelag_exploit_tick
	if not (value_2) then
	end
	value_4 = value_2
	value_3 = value_2.get(value_4)
	value_4 = type
	value_5 = value_3
	value_4 = value_4(value_5)
	if value_4 == "number" then
		-- Luraph junk / invalid SSA expression removed
		value_4 = value_4.usercmd
		value_5 = value_4
		value_4 = value_4.set
		value_6 = value_3
		value_4(value_5, value_6)
		return
	end
end

recovered.is_invalid_tick_cleaner_enabled_p251 = function(upvalues, argument_1, argument_2, ...)
	local value_1, value_2, value_3, value_4, value_5
	value_1 = argument_1
	value_2 = argument_2
	value_3 = value_2
	if value_3 then
		value_3 = value_2.invalid_tick_cleaner
	end
	if not (value_3) then
		value_3 = nil
	end
	value_4 = value_3 ~= nil
	if value_4 then
		value_5 = value_3
		value_4 = value_3.get(value_5)
		value_4 = value_4 == "Remove Backtrack"
	end
	if value_4 then
		value_4 = upvalues[0][2][upvalues[0][1]].air
		value_4 = value_4 == true
	end
	return value_4
end

recovered.read_db_p252 = function(upvalues, ...)
	local value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_8, value_9
	value_2 = upvalues[0][121]
	value_3 = value_1.db
	value_2 = value_2(value_3)
	value_3 = upvalues[0][121]
	value_4 = value_1.backup_db
	value_3 = value_3(value_4)
	value_4 = type
	value_5 = value_2
	value_4 = value_4(value_5)
	value_6 = tonumber
	value_7 = value_2.revision
	value_6 = value_6(value_7)
	if not (value_6) then
		value_6 = 0
	end
	value_7 = tonumber
	value_8 = value_3.revision
	value_7 = value_7(value_8)
	if value_6 < value_7 then
		return value_8, value_9
	end
	if value_4 then
		return value_6, value_7
	end
	if not value_5 then
		value_6 = {}
		value_7 = false
		return value_6, value_7
	else
		value_6 = value_3
		value_7 = true
		return value_6, value_7
	end
end

recovered.andromeda_update_callbacks_2_p253 = function(upvalues, ...)
end

-- Extrapolation: clear every cached and temporarily shifted player.
recovered.clear_state_p254 = function(upvalues, ...)
	local state = upvalues[0]
	state.restore_all()

	for entity_index in pairs(state.player_state) do
		state.player_state[entity_index] = nil
	end

	state.latency_cache.tick = -1
	state.latency_cache.time = 0
end

recovered.andromeda_function_30_p255 = function(upvalues, argument_1, argument_2, ...)
	local value_1, value_2, value_3
	value_1 = argument_1
	value_2 = argument_2
	value_3 = false
	return value_3
end

recovered.andromeda_g_p256 = function(upvalues, argument_1, argument_2, ...)
  local value_1, value_2, value_3
	value_1 = argument_1
	value_2 = argument_2
	local t21 = {...}
		value_1 = t21[1]
		value_2 = t21[2]
	-- Luraph junk / invalid SSA expression removed
	value_3 = value_2
end

recovered.andromeda_m_ikills_p257 = function(upvalues, argument_1, ...)
	local value_1, value_2, value_3, value_4, value_5
	value_1 = argument_1
	value_2 = value_2()
	if value_2 == nil then
		return value_3
	end
	value_3 = 0
	value_4 = 0
	if not (value_4 <= 0) then
		value_5 = value_3 / value_4
		return value_5
	end
end

recovered.andromeda_d_p258 = function(upvalues, argument_1, ...)
  local value_0, value_1, value_2, value_3, value_4, value_5, value_6, value_8, value_14, value_15
	value_1 = argument_1
	value_15 = 343
	if not (value_15) then
		value_15 = 308
	end
	value_15 = value_15 + 3063
	value_15 = value_15 - 3209
	value_8[53] = value_15
	value_14[40] = 51
	local t20 = {...}
		value_1 = t20[1]
	if value_1 == "" then
		return value_2
	end
	value_6 = true
	value_2 = value_2(value_3, value_4, value_5, value_6)
	if value_2 == value_0 then
		value_2 = value_1 .. "d"
		return value_2
	else
		value_2 = value_1
		return value_2
	end
end

recovered.andromeda_dpi_p259 = function(upvalues, ...)
  local value_0, value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_9, value_15
  local value_16
	value_1 = upvalues[0].visuals
	if value_1 then
		value_1 = upvalues[0].visuals.dpi
	end
	if value_1 == value_0 then
		return value_2
	end
	value_3 = value_1
	value_2 = value_1.get(value_3)
	value_3 = type
	value_4 = value_2
	value_3 = value_3(value_4)
	if not (value_3 ~= "number") then
		value_16 = 477
		if not (value_16) then
			value_16 = 265
		end
		value_16 = value_16 + 17322
		value_16 = value_16 - 17491
		value_9[103] = value_16
		value_15[102] = 52
	end
	value_3 = type
	value_4 = value_2
	value_3 = value_3(value_4)
	if value_3 <= 0 then
		value_3 = 1
		return value_3
	else
		value_4 = upvalues[1].clamp
		value_5 = value_3 * 0.01
		value_6 = 0.5
		value_7 = 2
		return value_4(value_5, value_6, value_7)
	end
end

recovered.andromeda_function_31_p260 = function(upvalues, argument_1, ...)
	local value_1, value_2, value_3, value_4, value_5
	value_1 = argument_1
	value_2 = upvalues[0].clamp
	value_3 = value_1
	if not (value_3) then
		value_3 = 1
	end
	value_4 = 0.5
	value_5 = 2
	return value_2(value_3, value_4, value_5)
end

recovered.andromeda_function_32_p261 = function(upvalues, ...)
	local value_1, value_2
	value_1 = upvalues[0][2][upvalues[0][1]]
	value_1 = value_1 + 1
	upvalues[0][2][upvalues[0][1]] = value_1
	value_1 = upvalues[1][30]()
	value_2 = upvalues[2][2][upvalues[2][1]]
	value_2 = value_1 - value_2
	if not (1.5 > value_2) then
		upvalues[3][2][upvalues[3][1]] = value_2
		upvalues[2][2][upvalues[2][1]] = value_1
	end
end

recovered.andromeda_bottom_left_p262 = function(upvalues, ...)
  local value_1, value_2, value_5, value_6, value_8, value_9, value_10, value_21
	value_21 = 475
	if not (value_21) then
		value_21 = 280
	end
	value_9 = upvalues[0][154]
	value_10 = value_5 - value_1
	value_10 = value_10 * 0.5
	value_10 = value_10 + 0.5
	value_9 = value_9(value_10)
	value_10 = value_6 - value_2
	value_10 = value_10 - value_8
	return value_9, value_10
end

recovered.andromeda_r_2_p263 = function(upvalues, argument_1, ...)
	local locals = make_locals()
	local t8 = 0
	locals.v1 = argument_1
	locals.v2 = upvalues[0][32]()
	locals.v3 = upvalues[1]()
	locals.v4 = upvalues[0][151]
	locals.v5 = 0
	locals.v6 = upvalues[0][154]
	locals.v7 = upvalues[0][67]()
	locals.v7 = locals.v7 * 1000
	locals.v7[locals.v7] = 0.5
	locals.v6 = locals.v6(locals.v7)
	locals.v4 = locals.v4(unpack_locals(locals, 5, t8))
	locals.v5 = upvalues[0][28]()
	locals.v6 = locals.v5 ~= locals.v0
	if locals.v6 then
		locals.v6 = upvalues[0][154]
		locals.v7 = 1 / locals.v5
		locals.v7 = locals.v7 + 0.5
		locals.v6 = locals.v6(locals.v7)
	end
	if not (locals.v6) then
		locals.v6 = 0
	end
	locals.v7 = upvalues[0][96]()
	locals.v10 = string.format
	locals.v11 = "Andromeda | rtt: %ims | rate: %i | %02d:%02d:%02d"
	locals.v12 = locals.v4
	locals.v14 = 0
	locals.v15 = locals.v8
	if not (locals.v15) then
		locals.v15 = 0
	end
	locals.v16 = locals.v9
	if not (locals.v16) then
		-- Luraph junk / invalid SSA expression removed
	end
	repeat
		locals.v18 = 14
		locals.v19 = upvalues[0][154]
		locals.v20 = locals.v3 * 20
		locals.v20 = locals.v20 + 0.5
		locals.v19 = locals.v19(locals.v20)
		locals.v17 = locals.v17(unpack_locals(locals, 18, t8))
		locals.v18 = locals.v15 * 2
		locals.v18 = locals.v13 + locals.v18
		locals.v19 = upvalues[0][151]
		locals.v20 = locals.v17
		locals.v21 = locals.v16 * 2
		locals.v21 = locals.v14 + locals.v21
		locals.v19 = locals.v19(locals.v20, locals.v21)
		locals.v20 = upvalues[3]
		locals.v21 = locals.v18
		locals.v22 = locals.v19
		locals.v23 = locals.v1
	until true
	locals.v24 = locals.v3
	locals.v20 = locals.v20(locals.v21, locals.v22, locals.v23, locals.v24)
	locals.v22 = locals.v20 + locals.v18
	locals.v22 = locals.v22 - locals.v15
	locals.v23 = upvalues[0][154]
	locals.v24 = locals.v19 - locals.v14
	locals.v24 = locals.v24 * 0.5
	locals.v24 = locals.v24 + 0.5
	locals.v23 = locals.v23(locals.v24)
	locals.v23 = locals.v21 + locals.v23
	locals.v24 = upvalues[0][128]
	locals.v25 = locals.v20
	locals.v26 = locals.v21
	locals.v27 = locals.v18
	locals.v28 = locals.v19
	locals.v29 = 240
	locals.v30 = 110
	locals.v31 = 140
	locals.v32 = 130
	locals.v24(locals.v25, locals.v26, locals.v27, locals.v28, locals.v29, locals.v30, locals.v31, locals.v32)
	locals.v24 = upvalues[0][131]
	locals.v25 = locals.v22
	locals.v26 = locals.v23
	locals.v27 = 240
	locals.v28 = 160
	locals.v29 = 180
	locals.v30 = 250
	locals.v31 = locals.v12
	locals.v33 = locals.v10
	locals.v24(locals.v25, locals.v26, locals.v27, locals.v28, locals.v29, locals.v30, locals.v31, locals.v32, locals.v33)
	return
end

recovered.andromeda_build_encoded_payload_p264 = function(upvalues, argument_1, argument_2, ...)
	local value_1, value_2, value_3, value_4, value_5, value_6
	value_1 = argument_1
	value_2 = argument_2
	value_3 = value_1.configs_db.cfg_list
	value_3 = value_3[value_2]
	value_4 = type
	value_5 = value_3
	value_4 = value_4(value_5)
	if value_4 == "table" then
		value_5 = upvalues[0][86]
		value_6 = "play resource/warning.wav"
		value_5(value_6)
		return
	else
		value_4 = upvalues[0][86]
		value_5 = "play resource/warning.wav"
		value_4(value_5)
		return
	end
	value_5 = value_1.configs_db.menu_list
	value_6 = value_3[1]
	value_5[value_2] = value_6
	value_6 = value_1
	value_5 = value_1.write_db(value_6)
	repeat
	do return end
	until true
end

recovered.andromeda_build_encoded_payload_2_p265 = function(upvalues, argument_1, argument_2, ...)
  local value_0, value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_8
	t11 = {...}
	value_1 = argument_1
	value_2 = argument_2
		value_1 = ({...})[1]
		value_2 = ({...})[2]
	value_3 = upvalues[0]
	value_4 = value_2
	value_3 = value_3(value_4)
	value_4 = value_1.configs_db
	value_4 = value_4.menu_list
	value_4 = #value_4
	value_5 = 1
	value_6 = -1
	local t13 = {parent = nil, index = nil, step = nil, limit = nil}
	local t15 = value_5
	local t16 = value_6
	local t14 = value_4 - t16
	repeat
		t14 = t14 + t16
		value_7 = t14
		if (t16 > 0 or t14 + t16 >= t15 or t16 > 0) and t14 + t16 <= t15 then
		else
			if value_5 > value_4 then
				value_5 = value_1
				value_4 = value_1.build_encoded_payload
				value_4 = value_4(value_5)
				if value_4 ~= value_0 then
					value_5 = "table" < value_0
					value_5 = value_5.insert
					value_6 = value_1.configs_db
					value_6 = value_6.cfg_list
					value_7 = {}
					value_5 = upvalues[1][86]
					value_6 = "play ui\\beepclear"
					value_5(value_6)
					repeat
						value_5 = value_1.configs_db
						value_5 = value_5.cfg_list
						value_5 = #value_5
					do return value_5 end
					until true
				else
					value_5 = upvalues[1][86]
					value_6 = "play resource/warning.wav"
					value_5(value_6)
					return
				end
				break
			else
				value_4 = upvalues[1][86]
				value_5 = "play resource/warning.wav"
				value_4(value_5)
				return
			end
			break
		end
		value_8 = value_1.configs_db
		value_8 = value_8.menu_list
		value_8 = value_8[value_7]
	until value_8 ~= value_3
end

recovered.andromeda_set_int_p266 = function(upvalues, argument_1, ...)
  local value_1, value_2, value_3, value_4, value_13, value_14
	local t12
	value_1 = argument_1
	value_13 = math_helpers[9]
	value_14 = math_helpers[6]
	value_13 = value_13(value_14)
	local t20 = {...}
		value_1 = t20[1]
	value_2 = upvalues[0]
	do return end
	value_3 = value_2
	value_2 = value_2.set_int
	value_4 = value_1
	if value_4 then
		value_4 = 0
	end
	if not (value_4) then
		value_4 = 1
	end
	value_2(value_3, value_4)
	return
end

recovered.andromeda_builder_p267 = function(upvalues, ...)
	local value_1, value_2, value_12
	value_12 = 117
	if not (value_12) then
		value_12 = 152
	end
	value_2 = value_1 == 0
	return value_2
end

recovered.andromeda_switch_type_p268 = function(upvalues, ...)
	local value_1, value_2, value_3
	value_1 = upvalues[0].switch_type
	value_2 = value_1
	value_1 = value_1.get(value_2)
	value_2 = type
	value_3 = value_1
	value_2 = value_2(value_3)
	value_2 = value_1 == "Defensive"
	return value_2
end

recovered.andromeda_conditions_p269 = function(upvalues, argument_1, ...)
	local value_1, value_4, value_8, value_9, value_10, value_11, value_12, value_13, value_14, value_26
	local t12
	value_1 = argument_1
	repeat
		repeat
			value_12 = value_12.builder_type
		until true
		value_11 = value_10.yaw_modifiers
		if not (value_11 == nil) then
			value_12 = value_10.yaw_modifiers
			value_26 = value_12.builder_type
			if not (value_12 == nil) then
				value_11 = value_4
				value_12 = value_9
				value_13 = "yaw_modifiers"
				value_14 = value_10.yaw_modifiers
				local t5 = value_12[82]
				value_11(value_12, value_13, value_14)
			end
		end
		repeat
			local t13 = t13 + nil
			value_8 = t13
			if (nil > 0 or t13 + nil < nil) and (nil <= 0 or t13 + nil > nil) then
				return
			end
			if value_10 then
				value_10 = upvalues[1].builder
				value_10 = value_10[value_9]
			end
			if not (value_10) then
				value_10 = nil
			end
		until value_10 == nil
	until value_10 == nil
end

recovered.andromeda_set_visible_7_p270 = function(upvalues, argument_1, argument_2, argument_3, ...)
  local value_0, value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_8
	local t5
	value_1 = argument_1
	value_2 = argument_2
	value_3 = argument_3
	value_4 = upvalues[1].switch
	value_5 = value_4
	value_4 = value_4.get(value_5)
	value_4 = value_4 == "Anti-Aim"
	if value_4 then
		value_4 = upvalues[2]()
		if not (value_4) then
			value_4 = upvalues[3]()
		end
	end
	value_5 = upvalues[5][value_1]
	if not (value_5) then
		value_5 = {}
	end
	upvalues[5][value_1] = value_5
	value_5 = upvalues[5][value_1]
	value_5 = value_5[value_2]
	value_0 = nil == nil
	repeat

		if value_6 ~= value_0 then
			repeat
				value_6 = upvalues[6]
				if not value_6 then
					return
				else
					if value_4 then
						value_7 = value_3
						value_6 = value_3.set_visible
						value_8 = true
						value_6(value_7, value_8)
						value_6 = value_3
						value_5 = value_3.get(value_6)
						if not (value_5 == "Default") then
							value_6 = value_3
							value_5 = value_3.set
							value_7 = "Default"
							value_5(value_6, value_7)
						end
						value_5 = upvalues[6]
						if not value_5 then
							return
						end
						if "set_visible" <= value_5 then
							value_6(value_7, value_8)
							upvalues[5][value_1] = value_0
							if not (value_5 == value_0) then
								local t7
								value_7 = false
								value_5(value_6, value_7)
							end
							break
						end
						break
					end
					break
				end
				do break end
				value_5 = upvalues[5][value_1]
			until value_5 == value_0
		end
		do break end
		value_5 = upvalues[5][value_1]
	until value_5 == value_0
end

-- Overpredict: calculate the adaptive multiplier for one player.
recovered.andromeda_player_state_p271 = function(upvalues, entity_index, velocity, ...)
	local state = upvalues[0]
	local api = upvalues[1]
	local clamp = upvalues[2].clamp
	local player = state.player_state[entity_index]
	if player == nil or velocity == nil then return 0 end

	local speed_squared = velocity.x * velocity.x + velocity.y * velocity.y
	if speed_squared < 1225 then return 0 end
	if not state.is_overpredict_enabled() then return 1 end

	local speed = math.sqrt(speed_squared)
	local multiplier = state.get_overpredict_multiplier()
	if speed < 100 then
		multiplier = multiplier * 0.65
	elseif speed < 180 then
		multiplier = multiplier * 0.90
	elseif speed > 180 then
		multiplier = multiplier * 1.15
	end

	local previous_velocity = player.velocity
	if previous_velocity ~= nil then
		local previous_speed_squared =
			previous_velocity.x * previous_velocity.x +
			previous_velocity.y * previous_velocity.y
		if previous_speed_squared >= 1225 then
			local direction_dot =
				velocity.x * previous_velocity.x +
				velocity.y * previous_velocity.y
			if direction_dot < 0 then
				multiplier = multiplier * 0.55
			end

			local speed_delta = math.abs(speed - math.sqrt(previous_speed_squared))
			if speed_delta < 22 then
				player.stable_ticks = math.min((player.stable_ticks or 0) + 1, 12)
			else
				player.stable_ticks = 0
			end
		else
			player.stable_ticks = 0
		end
	end
	player.velocity = velocity

	local tick = api[23]()
	if (player.penalty_until or 0) > tick then
		local misses = math.min(player.miss_streak or 0, 4)
		multiplier = multiplier * math.max(0.52, 0.82 - misses * 0.08)
	elseif (player.boost_until or 0) > tick then
		local hits = math.min(player.hit_streak or 0, 4)
		multiplier = multiplier * (1.06 + math.min(hits * 0.025, 0.08))
	end

	if (player.stable_ticks or 0) >= 4 then
		multiplier = multiplier * 1.05
	end
	return clamp(multiplier, 0.45, 2.25)
end

recovered.andromeda_fakelag_p272 = function(upvalues, ...)
  local value_0, value_1, value_2, value_3, value_4, value_13, value_14, value_15
	local t2
	value_1 = upvalues[0].saved_usercmd
	if not (value_1 == value_0) then
		value_1 = upvalues[0].saved_usercmd
		value_2 = type
		value_3 = value_1
		value_2 = value_2(value_3)
		if not (value_2 ~= "number") then
			value_2 = upvalues[1][162]
			value_3 = value_1
			value_4 = 16
			value_2 = value_2(value_3, value_4)
			value_1 = value_2
		end
		value_2 = upvalues[2].misc.usercmd
		value_3 = value_2
		value_2 = value_2.set
		value_4 = value_1
		value_2(value_3, value_4)
		upvalues[0].saved_usercmd = value_0
	end
	value_1 = upvalues[0].saved_limit
	if not (value_1 == value_0) then
		value_13 = math_helpers[10]
		value_14 = "Ku"
		value_15 = 1
		-- Luraph junk / invalid SSA expression removed
		t2[nil] = t4
		value_13 = 501
		value_14 = upvalues[0].saved_limit
		value_0 = type
		value_3 = value_1
		value_2 = value_2(value_3)
		if not (value_2 ~= "number") then
			t2[nil] = t4[nil]
			value_3 = value_1
			value_4 = 14
			value_2 = value_2(value_3, value_4)
			value_1 = value_2
		end
		t4 = t4[2]
		local t5
		value_2 = value_2.fakelag.limit
		value_3 = value_2
		value_2 = value_2.set
		value_4 = value_1
		value_2(value_3, value_4)
		upvalues[0].saved_limit = value_0
	end
	return
end

recovered.setup_command_p273 = function(upvalues, argument_1, ...)
	local value_1, value_2, value_15
	value_1 = argument_1
	if (not value_2) then
		return
	end
	value_15 = value_1.chokedcommands
	if not (value_2 <= 16) then
		value_2 = value_1.chokedcommands
		upvalues[0].choked_commands = value_2
	end
	repeat
	do return end
	until true
end

recovered.andromeda_misc_p274 = function(upvalues, ...)
  local value_0, value_1, value_2, value_3, value_4, value_7, value_8, value_9, value_10, value_11
  local value_12, value_13, value_14, value_15, value_16, value_17, value_18, value_20, value_26, value_27
	value_1 = upvalues[0].is_enabled()
	value_1 = upvalues[1].antiaim.fakelag.on
	value_2 = value_1
	value_1 = value_1.get
	value_1 = value_0[value_0]
	value_1 = upvalues[2][32]
	do return end
	value_7 = value_7(value_8, value_9, value_10, value_11, value_12)
	-- Luraph junk / invalid SSA expression removed
	value_9 = 90
	value_10 = value_7 + 19
	value_11 = 0
	value_12 = 0
	value_13 = 0
	value_14 = 150
	value_15 = 10
	value_16 = 0
	value_27 = 490
	if not (value_27) then
		value_27 = 223
	end
	value_27 = value_27 + 335
	value_27 = value_27 + 2069
	value_27 = value_27 - 2415
	value_20[41] = value_27
	value_26[125] = 141
	value_17 = 1
	value_18 = 5
	value_8(value_9, value_10, value_11, value_12, value_13, value_14, value_15, value_16, value_17, value_18)
	value_8 = upvalues[2][127]
	value_9 = 90
	value_10 = value_7 + 19
	value_11 = value_4
	value_16 = 0
	value_17 = value_3 / 100
	value_18 = 4
	value_8(value_9, value_10, value_11, value_12, value_13, value_14, value_15, value_16, value_17, value_18)
	return
end

recovered.andromeda_match_2_p275 = function(upvalues, argument_1, ...)
	local value_1, value_2, value_3, value_4
	value_1 = argument_1
	value_2 = type
	value_3 = value_1
	value_2 = value_1 ~= ""
	if value_2 then
		-- Luraph junk / invalid SSA expression removed
		value_2 = value_2 % 4
		value_2 = value_2 == 0
	end
	if value_2 then
		value_3 = value_1
		value_2 = value_1.match
		value_4 = "^[A-Za-z0-9+/=]+$"
		value_2 = value_2(value_3, value_4)
		value_2 = value_2 ~= nil
	end
	return value_2
end

recovered.add_handles_p276 = function(upvalues, argument_1, argument_2, argument_3, argument_4, ...)
	local value_1, value_2, value_3, value_4, value_5, value_6
	value_1 = argument_1
	value_2 = argument_2
	value_3 = argument_3
	value_4 = argument_4
	value_5 = upvalues[0]
	value_6 = value_3
	value_5 = value_5(value_6)
	if not value_5 then
		return
	end
end

recovered.is_quit_p277 = function(upvalues, ...)
	local value_1
	value_1 = upvalues[0].quit_requested
	value_1 = value_1 == true
	return value_1
end

recovered.andromeda_function_33_p278 = function(upvalues, ...)
	local value_9
	local t2
	repeat
		value_9 = 506
	until true
end

recovered.console_color_p279 = function(upvalues, argument_1, ...)
	local value_1, value_2, value_3, value_4, value_5, value_6, value_7
	value_1 = argument_1
	value_2 = upvalues[0].get_segment_color
	value_3 = value_1
	value_4 = 255
	value_2 = value_2(value_3, value_4)
	value_5 = value_2
	value_6 = value_3
	value_7 = value_4
	return value_5, value_6, value_7
end

recovered.andromeda_play_ui_armsrace_level_up_wav_p280 = function(upvalues, ...)
	local value_1, value_2
	value_1 = upvalues[0][86]
	value_2 = "sv_cheats 1;mp_roundtime_defuse 99999;mp_warmup_end;mp_buytime 99999999;mp_buy_anywhere 1;sv_infinite_ammo 1;impulse 101;sv_airaccelerate 100;sv_regeneration_force_on 1;mp_respawn_on_death_ct 1;mp_respawn_on_death_t 1;bot_stop 1;mp_roundtime_hostage 10000"
	value_1(value_2)
	return
end

recovered.swap_buffers_p281 = function(upvalues, ...)
	local value_1, value_2, value_3, value_4
	local t11
	value_1 = upvalues[0].published_frame
	value_2 = upvalues[0].capture_frame
	value_3 = upvalues[0].published_count
	value_4 = upvalues[0].capture_count
	upvalues[0].render_count = value_1
	value_1 = 1
	value_2 = upvalues[0].capture_count
	value_1 = table.sort
	value_2 = upvalues[0].render_items
	value_2 = upvalues[0].visible_keys
	value_1(value_2)
	value_1 = pairs
	value_2 = upvalues[0].current_keys
	value_1 = value_1(value_2)
	t11 = {parent = t11.parent, index = t11.index, step = t11.step, limit = t11.limit}
	repeat
		local t17 = value_1(nil, t16)
		value_3 = t22
		value_2 = t17
		local t16 = t17
	until true
	value_1 = upvalues[0].update_planting_state
	value_2 = upvalues[0].current_keys.bomb_planting
	value_2 = value_2 == true
	value_1(value_2)
	value_1 = upvalues[0].capture_frame
	upvalues[0].published_frame = value_1
	value_1 = upvalues[0].capture_count
	upvalues[0].published_count = value_1
	return
end

recovered.andromeda_swap_buffers_p282 = function(upvalues, argument_1, ...)
	local value_1, value_2
	value_1 = argument_1
	value_2 = upvalues[0].capture_frame
	if value_2 ~= value_1 then
		value_2 = upvalues[0].swap_buffers
		value_2()
		upvalues[0].capture_frame = value_1
		upvalues[0].capture_count = 0
		return
	end
end

recovered.andromeda_g_2_p283 = function(upvalues, ...)
	local locals = make_locals()
	local t2
	local t7 = 0
	local t11
	locals.v1 = ({...})[1]
	locals.v2 = string.len
	locals.v3 = "\224\199"
	locals.v2 = locals.v2(locals.v3)
	locals.v2 = 496 - locals.v2
	locals.v3 = string.byte
	locals.v4 = "\239\128\186"
	locals.v5 = 1
	locals.v3 = locals.v3(locals.v4, locals.v5, locals.v6)
	locals.v2 = locals.v2 == locals.v3
	if locals.v2 then
		locals.v2 = 163
	end
	if not (locals.v2) then
		locals.v2 = 156
	end
	locals.v49 = 88
	if not (locals.v49) then
		locals.v49 = 277
	end
	locals.v50 = math_helpers[5]
	locals.v51 = math_helpers[6]
	locals.v50 = locals.v50(locals.v51)
	locals.v49 = locals.v49 >= locals.v50
	if locals.v49 then
		locals.v49 = 242
	end
	local t5 = 369
	local t4 = upvalues
	local t3 = 49
	locals.v49 = math_helpers[5]
	locals.v50 = math_helpers[6]
	locals.v49 = locals.v49(locals.v50)
	locals.v49 = locals.v49 + 22383
	locals.v49 = locals.v49 - 22611
	locals.v48[477] = locals.v49
	locals.v48[421] = 620
	locals.v5 = string.byte
	locals.v6 = setmetatable
	locals.v7 = getmetatable
	locals.v8 = next
	locals.v9 = {}
	locals.v10 = {}
	locals.v10[0] = 0
	locals.v11 = 1
	locals.v12 = 2
	locals.v13 = 3
	locals.v8 = 4
	locals.v15 = 5
	locals.v16 = 6
	locals.v17 = 7
	locals.v18 = 8
	locals.v19 = 9
	locals.v20 = 10
	locals.v21 = 11
	locals.v22 = 12
	locals.v23 = 13
	locals.v24 = 14
	locals.v25 = 15
		locals.v10[1] = locals.v11
		locals.v10[2] = locals.v12
		locals.v10[3] = locals.v13
		locals.v10[4] = locals.v14
		locals.v10[5] = locals.v15
		locals.v10[6] = locals.v16
		locals.v10[7] = locals.v17
		locals.v10[8] = locals.v18
		locals.v10[9] = locals.v19
		locals.v10[10] = locals.v20
		locals.v10[11] = locals.v21
		locals.v10[12] = locals.v22
		locals.v10[13] = locals.v23
		locals.v10[14] = locals.v24
		locals.v10[15] = locals.v25
	locals.v9[0] = locals.v10
	locals.v10 = {}
	locals.v10[0] = 1
	locals.v11 = 0
	locals.v12 = 3
	locals.v13 = 2
	locals.v14 = 5
	locals.v15 = 4
	locals.v16 = 7
	locals.v17 = 6
	locals.v18 = 9
	locals.v19 = 8
	locals.v20 = 11
	locals.v21 = 10
	locals.v22 = 13
	locals.v23 = 12
	locals.v24 = 15
	locals.v25 = 14
		locals.v10[1] = locals.v11
		locals.v10[2] = locals.v12
		locals.v10[3] = locals.v13
		locals.v10[4] = locals.v14
		locals.v10[5] = locals.v15
		locals.v10[6] = locals.v16
		locals.v10[7] = locals.v17
		locals.v10[8] = locals.v18
		locals.v10[9] = locals.v19
		locals.v10[10] = locals.v20
		locals.v10[11] = locals.v21
		locals.v10[12] = locals.v22
		locals.v10[13] = locals.v23
		locals.v10[14] = locals.v24
		locals.v10[15] = locals.v25
	locals.v11 = {}
	locals.v11[0] = 2
	locals.v12 = 3
	locals.v13 = 0
	locals.v14 = 1
	locals.v15 = 6
	locals.v16 = 7
	locals.v17 = 4
	locals.v18 = 5
	locals.v19 = 10
	locals.v20 = 11
	locals.v21 = 8
	locals.v22 = 9
	locals.v23 = 14
	locals.v24 = 15
	locals.v25 = 12
	locals.v26 = 13
		locals.v11[1] = locals.v12
		locals.v11[2] = locals.v13
		locals.v11[3] = locals.v14
		locals.v11[4] = locals.v15
		locals.v11[5] = locals.v16
		locals.v11[6] = locals.v17
		locals.v11[7] = locals.v18
		locals.v11[8] = locals.v19
		locals.v11[9] = locals.v20
		locals.v11[10] = locals.v21
		locals.v11[11] = locals.v22
		locals.v11[12] = locals.v23
		locals.v11[13] = locals.v24
		locals.v11[14] = locals.v25
		locals.v11[15] = locals.v26
	locals.v12 = {}
	locals.v12[0] = 3
	locals.v13 = 2
	locals.v14 = 1
	locals.v15 = 0
	locals.v16 = 7
	locals.v17 = 6
	locals.v18 = 5
	locals.v19 = 4
	locals.v20 = 11
	locals.v21 = 10
	locals.v22 = 9
	locals.v23 = 8
	locals.v24 = 15
	locals.v25 = 14
	locals.v26 = 13
	locals.v27 = 12
		locals.v12[1] = locals.v13
		locals.v12[2] = locals.v14
		locals.v12[3] = locals.v15
		locals.v12[4] = locals.v16
		locals.v12[5] = locals.v17
		locals.v12[6] = locals.v18
		locals.v12[7] = locals.v19
		locals.v12[8] = locals.v20
		locals.v12[9] = locals.v21
		locals.v12[10] = locals.v22
		locals.v12[11] = locals.v23
		locals.v12[12] = locals.v24
		locals.v12[13] = locals.v25
		locals.v12[14] = locals.v26
		locals.v12[15] = locals.v27
	locals.v13 = {}
	locals.v13[0] = 4
	locals.v14 = 5
	locals.v15 = 6
	locals.v16 = 7
	locals.v17 = 0
	locals.v18 = 1
	locals.v19 = 2
	t11 = t11.parent
	local t14 = t11.step
	local t13 = t11.limit
	local t12 = t11.index
	locals.v21 = 12
	locals.v22 = 13
	locals.v23 = 14
	locals.v24 = 15
	locals.v25 = 8
	locals.v26 = 9
	locals.v27 = 10
	locals.v28 = 11
		locals.v13[1] = locals.v14
		locals.v13[2] = locals.v15
		locals.v13[3] = locals.v16
		locals.v13[4] = locals.v17
		locals.v13[5] = locals.v18
		locals.v13[6] = locals.v19
		locals.v13[7] = locals.v20
		locals.v13[8] = locals.v21
		locals.v13[9] = locals.v22
		locals.v13[10] = locals.v23
		locals.v13[11] = locals.v24
		locals.v13[12] = locals.v25
		locals.v13[13] = locals.v26
		locals.v13[14] = locals.v27
		locals.v13[15] = locals.v28
	locals.v14 = {}
	locals.v14[0] = 5
	locals.v15 = 4
	locals.v16 = 7
	locals.v17 = 6
	locals.v18 = 1
	locals.v19 = 0
	locals.v20 = 3
	locals.v21 = 2
	locals.v22 = 13
	locals.v23 = 12
	locals.v24 = 15
	locals.v25 = 14
	locals.v26 = 9
	locals.v27 = 8
	locals.v28 = 11
	locals.v29 = 10
		locals.v14[1] = locals.v15
		locals.v14[2] = locals.v16
		locals.v14[3] = locals.v17
		locals.v14[4] = locals.v18
		locals.v14[5] = locals.v19
		locals.v14[6] = locals.v20
		locals.v14[7] = locals.v21
		locals.v14[8] = locals.v22
		locals.v14[9] = locals.v23
		locals.v14[10] = locals.v24
		locals.v14[11] = locals.v25
		locals.v14[12] = locals.v26
		locals.v14[13] = locals.v27
		locals.v14[14] = locals.v28
		locals.v14[15] = locals.v29
	locals.v15 = {}
	locals.v15[0] = 6
	locals.v16 = 7
	locals.v17 = 4
	locals.v18 = 5
	locals.v19 = 2
	locals.v20 = 3
	locals.v21 = 0
	locals.v22 = 1
	locals.v23 = 14
	locals.v24 = 15
	locals.v25 = 12
	locals.v26 = 13
	locals.v27 = 10
	locals.v28 = 11
	locals.v29 = 8
	locals.v30 = 9
		locals.v15[1] = locals.v16
		locals.v15[2] = locals.v17
		locals.v15[3] = locals.v18
		locals.v15[4] = locals.v19
		locals.v15[5] = locals.v20
		locals.v15[6] = locals.v21
		locals.v15[7] = locals.v22
		locals.v15[8] = locals.v23
		locals.v15[9] = locals.v24
		locals.v15[10] = locals.v25
		locals.v15[11] = locals.v26
		locals.v15[12] = locals.v27
		locals.v15[13] = locals.v28
		locals.v15[14] = locals.v29
		locals.v15[15] = locals.v30
	locals.v16 = {}
	locals.v16[0] = 7
	locals.v17 = 6
	locals.v18 = 5
	locals.v19 = 4
	locals.v20 = 3
	locals.v21 = 2
	locals.v22 = 1
	locals.v23 = 0
	locals.v24 = 15
	locals.v25 = 14
	locals.v26 = 13
	locals.v27 = 12
	locals.v28 = 11
	locals.v29 = 10
	locals.v30 = 9
	locals.v31 = 8
		locals.v16[1] = locals.v17
		locals.v16[2] = locals.v18
		locals.v16[3] = locals.v19
		locals.v16[4] = locals.v20
		locals.v16[5] = locals.v21
		locals.v16[6] = locals.v22
		locals.v16[7] = locals.v23
		locals.v16[8] = locals.v24
		locals.v16[9] = locals.v25
		locals.v16[10] = locals.v26
		locals.v16[11] = locals.v27
		locals.v16[12] = locals.v28
		locals.v16[13] = locals.v29
		locals.v16[14] = locals.v30
		locals.v16[15] = locals.v31
	locals.v17 = {}
	locals.v17[0] = 8
	locals.v18 = 9
	locals.v19 = 10
	locals.v20 = 11
	locals.v21 = 12
	locals.v22 = 13
	locals.v23 = 14
	locals.v24 = 15
	locals.v25 = 0
	locals.v26 = 1
	locals.v27 = 2
	locals.v28 = 3
	locals.v29 = 4
	locals.v30 = 5
	locals.v31 = 6
	locals.v32 = 7
		locals.v17[1] = locals.v18
		locals.v17[2] = locals.v19
		locals.v17[3] = locals.v20
		locals.v17[4] = locals.v21
		locals.v17[5] = locals.v22
		locals.v17[6] = locals.v23
		locals.v17[7] = locals.v24
		locals.v17[8] = locals.v25
		locals.v17[9] = locals.v26
		locals.v17[10] = locals.v27
		locals.v17[11] = locals.v28
		locals.v17[12] = locals.v29
		locals.v17[13] = locals.v30
		locals.v17[14] = locals.v31
		locals.v17[15] = locals.v32
	locals.v18 = {}
	locals.v18[0] = 9
	locals.v19 = 8
	locals.v20 = 11
	locals.v21 = 10
	locals.v22 = 13
	locals.v23 = 12
	locals.v24 = 15
	locals.v25 = 14
	locals.v26 = 1
	locals.v27 = 0
	locals.v28 = 3
	locals.v29 = 2
	locals.v30 = 5
	locals.v31 = 4
	locals.v32 = 7
	locals.v33 = 6
		locals.v18[1] = locals.v19
		locals.v18[2] = locals.v20
		locals.v18[3] = locals.v21
		locals.v18[4] = locals.v22
		locals.v18[5] = locals.v23
		locals.v18[6] = locals.v24
		locals.v18[7] = locals.v25
		locals.v18[8] = locals.v26
		locals.v18[9] = locals.v27
		locals.v18[10] = locals.v28
		locals.v18[11] = locals.v29
		locals.v18[12] = locals.v30
		locals.v18[13] = locals.v31
		locals.v18[14] = locals.v32
		locals.v18[15] = locals.v33
	locals.v19 = {}
	locals.v19[0] = 10
	locals.v20 = 11
	locals.v21 = 8
	locals.v22 = 9
	locals.v23 = 14
	locals.v24 = 15
	locals.v25 = 12
	locals.v26 = 13
	locals.v27 = 2
	locals.v28 = 3
	locals.v29 = 0
	locals.v30 = 1
	locals.v31 = 6
	locals.v32 = 7
	locals.v33 = 4
	locals.v34 = 5
		locals.v19[1] = locals.v20
		locals.v19[2] = locals.v21
		locals.v19[3] = locals.v22
		locals.v19[4] = locals.v23
		locals.v19[5] = locals.v24
		locals.v19[6] = locals.v25
		locals.v19[7] = locals.v26
		locals.v19[8] = locals.v27
		locals.v19[9] = locals.v28
		locals.v19[10] = locals.v29
		locals.v19[11] = locals.v30
		locals.v19[12] = locals.v31
		locals.v19[13] = locals.v32
		locals.v19[14] = locals.v33
		locals.v19[15] = locals.v34
	locals.v20 = {}
	locals.v20[0] = 11
	locals.v21 = 10
	locals.v22 = 9
	locals.v23 = 8
	locals.v24 = 15
	locals.v25 = 14
	locals.v26 = 13
	locals.v27 = 12
	locals.v28 = 3
	locals.v29 = 2
	locals.v30 = 1
	locals.v31 = 0
	locals.v32 = 7
	locals.v33 = 6
	locals.v34 = 5
	locals.v35 = 4
		locals.v20[1] = locals.v21
		locals.v20[2] = locals.v22
		locals.v20[3] = locals.v23
		locals.v20[4] = locals.v24
		locals.v20[5] = locals.v25
		locals.v20[6] = locals.v26
		locals.v20[7] = locals.v27
		locals.v20[8] = locals.v28
		locals.v20[9] = locals.v29
		locals.v20[10] = locals.v30
		locals.v20[11] = locals.v31
		locals.v20[12] = locals.v32
		locals.v20[13] = locals.v33
		locals.v20[14] = locals.v34
		locals.v20[15] = locals.v35
	locals.v21 = {}
	locals.v21[0] = 12
	locals.v22 = 13
	locals.v23 = 14
	locals.v24 = 15
	locals.v25 = 8
	locals.v26 = 9
	locals.v27 = 10
	locals.v28 = 11
	locals.v29 = 4
	locals.v30 = 5
	locals.v31 = 6
	locals.v32 = 7
	locals.v33 = 0
	locals.v34 = 1
	locals.v35 = 2
	locals.v36 = 3
		locals.v21[1] = locals.v22
		locals.v21[2] = locals.v23
		locals.v21[3] = locals.v24
		locals.v21[4] = locals.v25
		locals.v21[5] = locals.v26
		locals.v21[6] = locals.v27
		locals.v21[7] = locals.v28
		locals.v21[8] = locals.v29
		locals.v21[9] = locals.v30
		locals.v21[10] = locals.v31
		locals.v21[11] = locals.v32
		locals.v21[12] = locals.v33
		locals.v21[13] = locals.v34
		locals.v21[14] = locals.v35
		locals.v21[15] = locals.v36
	locals.v22 = {}
	locals.v22[0] = 13
	locals.v23 = 12
	locals.v24 = 15
	locals.v25 = 14
	locals.v26 = 9
	locals.v27 = 8
	locals.v28 = 11
	locals.v29 = 10
	locals.v30 = 5
	locals.v31 = 4
	locals.v32 = 7
	locals.v33 = 6
	locals.v34 = 1
	locals.v35 = 0
	locals.v36 = 3
	locals.v37 = 2
		locals.v22[1] = locals.v23
		locals.v22[2] = locals.v24
		locals.v22[3] = locals.v25
		locals.v22[4] = locals.v26
		locals.v22[5] = locals.v27
		locals.v22[6] = locals.v28
		locals.v22[7] = locals.v29
		locals.v22[8] = locals.v30
		locals.v22[9] = locals.v31
		locals.v22[10] = locals.v32
		locals.v22[11] = locals.v33
		locals.v22[12] = locals.v34
		locals.v22[13] = locals.v35
		locals.v22[14] = locals.v36
		locals.v22[15] = locals.v37
	locals.v23 = {}
	locals.v23[0] = 14
	locals.v24 = 15
	locals.v25 = 12
	locals.v26 = 13
	locals.v27 = 10
	locals.v28 = 11
	locals.v29 = 8
	locals.v30 = 9
	locals.v31 = 6
	locals.v32 = 7
	t5 = 178
	t4 = locals
	locals.v34 = 5
	locals.v35 = 2
	locals.v36 = 3
	locals.v37 = 0
	locals.v38 = 1
		locals.v23[1] = locals.v24
		locals.v23[2] = locals.v25
		locals.v23[3] = locals.v26
		locals.v23[4] = locals.v27
		locals.v23[5] = locals.v28
		locals.v23[6] = locals.v29
		locals.v23[7] = locals.v30
		locals.v23[8] = locals.v31
		locals.v23[9] = locals.v32
		locals.v23[10] = locals.v33
		locals.v23[11] = locals.v34
		locals.v23[12] = locals.v35
		locals.v23[13] = locals.v36
		locals.v23[14] = locals.v37
		locals.v23[15] = locals.v38
	locals.v24 = {}
	locals.v24[0] = 15
	locals.v25 = 14
	locals.v26 = 13
	locals.v27 = 12
	locals.v28 = 11
	locals.v29 = 10
	locals.v30 = 9
	locals.v31 = 8
	locals.v32 = 7
	locals.v33 = 6
	locals.v34 = 5
	locals.v35 = 4
	locals.v36 = 3
	locals.v37 = 2
	locals.v38 = 1
	locals.v39 = 0
		locals.v24[1] = locals.v25
		locals.v24[2] = locals.v26
		locals.v24[3] = locals.v27
		locals.v24[4] = locals.v28
		locals.v24[5] = locals.v29
		locals.v24[6] = locals.v30
		locals.v24[7] = locals.v31
		locals.v24[8] = locals.v32
		locals.v24[9] = locals.v33
		locals.v24[10] = locals.v34
		locals.v24[11] = locals.v35
		locals.v24[12] = locals.v36
		locals.v24[13] = locals.v37
		locals.v24[14] = locals.v38
		locals.v24[15] = locals.v39
		locals.v9[1] = locals.v10
		locals.v9[2] = locals.v11
		locals.v9[3] = locals.v12
		locals.v9[4] = locals.v13
		locals.v9[5] = locals.v14
		locals.v9[6] = locals.v15
		locals.v9[7] = locals.v16
		locals.v9[8] = locals.v17
		locals.v9[9] = locals.v18
		locals.v9[10] = locals.v19
		locals.v9[11] = locals.v20
		locals.v9[12] = locals.v21
		locals.v9[13] = locals.v22
		locals.v9[14] = locals.v23
		locals.v9[15] = locals.v24
	locals.v10 = bind(recovered.andromeda_function_35_p285, {[0] = locals.v9})
	locals.v11 = bind(recovered.andromeda_function_36_p286, {[0] = {[1] = 10, [2] = locals}, [1] = {[1] = 2, [2] = locals}})
	locals.v12 = bind(recovered.call_3_p288, {})
	locals.v13 = {}
	locals.v13.__tostring = locals.v11
	locals.v13.__call = locals.v12
	locals.v13.__add = locals.v12
	locals.v13.__sub = locals.v12
	locals.v13.__mul = locals.v12
	locals.v13.__div = locals.v12
	locals.v13.__mod = locals.v12
	locals.v13.__pow = locals.v12
	locals.v13.__eq = locals.v12
	locals.v49 = 508
	if not (locals.v49) then
		locals.v49 = 272
	end
	locals.v49 = locals.v49 + 211
	locals.v49 = locals.v49 + 25227
	locals.v49 = locals.v49 - 25932
	locals.v47[357] = locals.v49
	locals.v48[555] = 810
	locals.v13.__index = locals.v12
	t2, t3 = locals, 12
	locals.v13.__metatable = false
	locals.v14 = locals.v6
	locals.v15 = {}
	locals.v16 = locals.v14
	if not (locals.v16) then
		locals.v16 = locals.v14
	end
	locals.v15 = locals.v16
	locals.v16 = locals.v14 + locals.v14
	locals.v17 = locals.v14 * locals.v14
	locals.v17 = locals.v17 / locals.v14
	locals.v18 = locals.v14 ^ locals.v14
	locals.v17 = locals.v17 % locals.v18
	locals.v15 = locals.v16 - locals.v17
	locals.v16 = locals.v14 == locals.v14
	if locals.v16 then
		locals.v16 = locals.v14 ~= locals.v14
	end
	locals.v15 = locals.v16
	locals.v16 = locals.v14 < locals.v14
	if locals.v16 then
		locals.v16 = locals.v14 > locals.v14
	end
	locals.v15 = locals.v16
	locals.v16 = locals.v14 <= locals.v14
	if locals.v16 then
		locals.v16 = locals.v14 >= locals.v14
	end
	locals.v15 = locals.v16
	locals.v16 = locals.v14
	locals.v17 = locals.v14
	locals.v18 = locals.v14
	locals.v19 = locals.v14
	locals.v20 = locals.v14
	locals.v19 = locals.v19(locals.v20)
	locals.v20 = locals.v14()
	locals.v16(unpack_locals(locals, 17, t7))
	locals.v16 = locals.v14
	locals.v17 = locals.v14 .. locals.v14
	locals.v18 = locals.v14 .. ""
	locals.v19 = "" .. locals.v14
	locals.v16(locals.v17, locals.v18, locals.v19)
	locals.v14[locals.v14] = locals.v14
	locals.v16 = locals.v14[locals.v14]
	locals.v14[locals.v14] = locals.v16
	locals.v12 = locals.v3
	locals.v13 = type
	locals.v14 = locals.v12
	locals.v13 = locals.v13(locals.v14)
	locals.v14 = locals.v7
	locals.v15 = locals.v12
	locals.v14 = locals.v14(locals.v15)
	if locals.v14 ~= locals.v0 then
		return locals.v13()
	end
	locals.v13 = locals.v6
	locals.v14 = locals.v12
	locals.v13(locals.v14, locals.v15)
	locals.v13 = {}
	locals.v14 = {}
	locals.v15 = false
	locals.v16 = locals.v8
	locals.v17 = locals.v12
	t11 = {parent = t11, index = t12, step = t14, limit = t13}
	t14 = locals.v18
	t13 = locals.v17
	t12 = locals.v16
	repeat
		repeat
			local t17 = locals.v16(nil, t16)
		until true
		t16, locals.v17, locals.v18 = t17, t17, t22
		if not (t17 ~= nil) then
			t11 = t11.parent
			t14 = t11.step
			t13 = t11.limit
			t12 = t11.index
			if not locals.v15 then
				locals.v16 = locals.v11
				return locals.v16()
			end
			locals.v12 = {}
			locals.v17 = locals.v5
			locals.v18 = locals.v1
			locals.v19 = 1
			locals.v20 = 4
			locals.v17 = locals.v17(locals.v18, locals.v19, locals.v20)
			for t24 = 1, t7 - 12 do
				locals.v12[t24 + 0] = locals[t24 + 12]
			end
			locals.v13 = 1
			locals.v14 = 4
			locals.v15 = 1
			t11 = {parent = t11, index = t12, step = t14, limit = t13}
			t13 = locals.v14
			t14 = locals.v15
			t12 = locals.v13 - t14
			repeat
				t12 = t12 + t14
				locals.v16 = t12
			until true
			if t14 <= 0 or t12 > t13 then
				locals.v13 = locals.v12[3]
				locals.v14 = locals.v12[1]
				locals.v14 = locals.v14 % 64
				locals.v14 = locals.v14 * 4
				locals.v14 = locals.v14 + 1
				locals.v15 = locals.v12[2]
				locals.v15 = locals.v15 % 128
				locals.v15 = locals.v15 * 2
				locals.v15 = locals.v15 - 1
				locals.v16 = {}
				locals.v17 = {}
				locals.v18 = 0
				locals.v19 = 255
				locals.v20 = 1
				t11 = {parent = t11.parent, index = t11.index, step = t11.step, limit = t11.limit}
				t13 = locals.v19
				t14 = locals.v20
				t12 = locals.v18 - t14
				repeat
					t12 = t12 + t14
					locals.v21 = t12
				until true
				if t14 <= 0 or t12 > t13 then
					repeat
						t12 = t12 + t14
						locals.v22 = t12
					until true
					if t14 <= 0 or t12 > t13 then
						locals.v19 = 0
						locals.v20 = 0
						locals.v21 = ""
						locals.v22 = 5
						locals.v23 = locals_length(locals)[1]
						locals.v24 = 1
						t11 = {parent = t11.parent, index = t11.index, step = t11.step, limit = t11.limit}
						t13 = locals.v23
						t14 = locals.v24
						t12 = locals.v22 - t14
						repeat
							t12 = t12 + t14
							locals.v25 = t12
						until true
						if t14 <= 0 or t12 > t13 then
							locals.v22 = locals.v21
							return locals.v22
						end
					end
				end
			end
		end
	until locals.v13 ~= locals.v18
end

recovered.andromeda_function_34_p284 = function(upvalues, ...)
  local value_9, value_11, value_12
	value_12 = 420
	value_12 = value_12 + 19712
	value_12 = value_12 - 20130
	value_9[22] = value_12
	value_11[11] = 9
	return 
end

recovered.andromeda_function_35_p285 = function(upvalues, argument_1, argument_2, ...)
	local value_1, value_2, value_3, value_4, value_5, value_6, value_7
	value_1 = argument_1
	value_2 = argument_2
	value_3 = 1
	value_4 = 0
	while value_1 > 0 do
		if value_2 <= 0 then
			break
		end
		value_7 = value_7[value_6]
		value_7 = value_7 * value_3
		value_4 = value_4 + value_7
		value_7 = value_1 - value_5
		value_1 = value_7 / 16
		value_7 = value_2 - value_6
		value_2 = value_7 / 16
		value_3 = value_3 * 16
	end
	value_3 = value_5 == nil
	value_6 = value_2 * value_3
	value_5 = value_5 + value_6
	return value_5
end

recovered.andromeda_function_36_p286 = function(upvalues, ...)
	local value_1
	value_1 = bind(recovered.andromeda_function_37_p287, {})
	upvalues[0][2][upvalues[0][1]] = value_1
	local t5 = t5[nil]
end

recovered.andromeda_function_37_p287 = function(upvalues, ...)
	local value_1
	value_1 = 0
	return value_1
end

recovered.call_3_p288 = function(upvalues, ...)
  local value_12, value_13, value_14, value_15
	value_12 = value_12 ~= 447
	if value_12 then
		value_12 = math_helpers[10]
		value_13 = "\167\026\023"
		value_14 = 1
		value_15 = 2
		value_12 = value_12(value_13, value_14, value_15)
	end
	if not (value_12) then
		value_12 = 45
	end
	return 
end

recovered.andromeda_bit_p289 = function(upvalues, ...)
  local value_0, value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_8, value_15
  local value_17, value_18
	value_0 = {}
	value_3 = value_1.command_number
	value_4 = value_3 * 4
	value_5 = bit.bxor
	local t4 = 62
	value_18 = t4
	if not (value_18) then
		t4 = t4[nil]
	end
	value_18 = value_18 + 17123
	value_18 = value_18 - 17414
	value_15[102] = value_18
	value_17[19] = 10
	value_6 = value_6(value_7, value_8)
	value_7 = value_2.hint
	if value_6 == value_7 then
		value_7 = false
		return value_7
	else
		value_7 = false
		return value_7
	end
	value_7 = true
	return value_7
end

recovered.draw_item_p290 = function(upvalues, argument_1, argument_2, argument_3, argument_4, argument_5, argument_6, argument_7, argument_8, argument_9, argument_10, ...)
	local value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_8, value_9, value_10
	local value_11, value_12, value_13, value_14, value_15, value_16, value_17, value_18, value_19, value_20
	local value_21, value_22, value_23, value_24, value_25, value_26, value_27, value_28, value_29, value_30
	local value_31, value_32, value_33, value_34, value_35, value_36, value_37, value_38, value_39, value_54
	value_1 = argument_1
	value_2 = argument_2
	value_3 = argument_3
	value_4 = argument_4
	value_5 = argument_5
	value_6 = argument_6
	value_7 = argument_7
	value_8 = argument_8
	value_9 = argument_9
	value_10 = argument_10
	value_11 = value_8
	if not (value_11) then
		value_11 = upvalues[0].get_animation_alpha
		value_12 = value_1.key
		value_11 = value_11(value_12)
	end
	value_12 = value_9
	if not (value_12) then
		value_12 = upvalues[0].get_animation_slide
		value_13 = value_1.key
		value_12 = value_12(value_13)
	end
	value_14 = value_14 * 0.5
	value_13 = value_13(value_14)
	value_13 = value_2 - value_13
	value_14 = value_1.kind
	value_15 = upvalues[0].get_icon_size
	value_16 = value_14
	value_17 = value_6
	value_15 = value_15(value_16, value_17)
	value_16 = upvalues[0].get_icon_offset
	value_17 = value_14
	value_18 = value_6
	value_16 = value_16(value_17, value_18)
	value_16 = value_13 + value_16
	value_17 = upvalues[1][154]
	value_18 = value_5 - value_15
	value_18 = value_18 * 0.5
	value_18 = value_18 + 0.5
	value_17 = value_17(value_18)
	value_17 = value_3 + value_17
	value_18 = value_1.text
	value_19 = upvalues[1][136]
	value_20 = value_7
	value_21 = value_18
	value_19 = value_19(value_20, value_21)
	value_21 = upvalues[1][154]
	value_22 = value_20
	value_22 = value_5 - value_22
	value_22 = value_22 * 0.5
	value_22 = value_22 + 0.5
	value_21 = value_21(value_22)
	value_21 = value_3 + value_21
	value_22 = upvalues[0].get_texture
	value_23 = value_14
	value_54 = value_15
	value_22 = value_22(value_23, value_24)
	value_23 = value_22 ~= nil
	repeat
		value_28 = upvalues[2].clamp
		value_29 = value_1.a
		value_29 = 255
		value_30 = 0
		value_31 = 255
		value_28 = value_28(value_29, value_30, value_31)
		value_29 = upvalues[0].draw_row_background
		value_30 = value_13
		value_31 = value_3
		value_32 = value_4
		value_34 = value_11
		value_29(value_30, value_31, value_32, value_33, value_34)
		value_29 = upvalues[1][139]
		value_30 = value_22
		value_31 = value_16
		value_32 = value_17
		value_33 = value_15
		value_34 = value_15
		value_35 = value_25
		value_36 = value_26
		value_37 = value_27
		value_38 = value_28
		value_39 = "f"
		value_29(value_30, value_31, value_32, value_33, value_34, value_35, value_36, value_37, value_38, value_39)
		value_29 = upvalues[1][131]
		value_30 = value_24
		value_31 = value_21
		value_32 = value_25
		value_33 = value_26
		value_34 = value_27
		value_35 = value_28
		value_37 = 0
		value_38 = value_18
		value_29(value_30, value_31, value_32, value_33, value_34, value_35, value_36, value_37, value_38)
		do return end
		value_27 = 115
		value_26 = 105
		value_25 = 225
		value_27 = 220
		value_26 = 220
		value_25 = 220
		-- Luraph junk / invalid SSA expression removed
		value_25 = value_14
		value_26 = value_23
		value_27 = value_6
		value_24 = value_24(value_25, value_26, value_27)
		value_24 = value_13 + value_24
		value_25 = value_1.r
		value_25 = 255
		value_26 = value_1.g
		value_26 = 255
		value_27 = value_1.b
	until true
end

recovered.andromeda_function_38_p291 = function(upvalues, ...)
	local value_1, value_2, value_3, value_4
	value_1 = 1
	value_2 = 64
	value_3 = 1
	local t13 = value_2
	local t14 = value_3
	local t12 = value_1 - t14
	repeat
		t12 = t12 + t14
		value_4 = t12
	until true
	if t14 <= 0 or t12 > t13 then
	end
end

recovered.andromeda_apply_p292 = function(upvalues, ...)
	local value_1, value_2
	value_1 = upvalues[0].is_quit()
	if not value_1 then
		value_1 = upvalues[1].apply
		value_2 = false
		value_1(value_2)
		return
	end
end

-- Extrapolation: integrate velocity, latency and optional acceleration.
recovered.andromeda_get_latency_time_p293 = function(
	upvalues, origin, velocity, requested_ticks, entity_index, acceleration, ...
)
	if velocity == nil then return nil end

	local state = upvalues[0]
	local api = upvalues[1]
	local ticks = requested_ticks or 0
	local configured_ticks = state.get_ticks()
	if configured_ticks > 0 then
		ticks = math.max(configured_ticks, ticks)
	end

	local speed_squared =
		velocity.x * velocity.x +
		velocity.y * velocity.y +
		velocity.z * velocity.z
	local tickinterval = api[28]()
	local multiplier = 1
	if type(entity_index) == "number" and speed_squared > 0 then
		multiplier = state.get_player_multiplier(entity_index, velocity)
	end

	local prediction_time = tickinterval * ticks * multiplier
	prediction_time = prediction_time + state.get_latency_time(tickinterval)
	local predicted = origin + velocity * prediction_time

	if acceleration ~= nil then
		local acceleration_squared =
			acceleration.x * acceleration.x +
			acceleration.y * acceleration.y +
			acceleration.z * acceleration.z
		if acceleration_squared < 900000 then
			predicted = predicted + acceleration * (0.5 * prediction_time * prediction_time)
		end
	end
	return predicted
end

recovered.andromeda_restore_original_p294 = function(upvalues, ...)
	({})[1]()
	return
end

recovered.get_option_value_p295 = function(upvalues, argument_1, argument_2, ...)
	local value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_8
	value_1 = argument_1
	value_2 = argument_2
	value_3 = value_1[value_2]
	value_4 = value_3.value
	if value_4 == nil then
		return value_4
	end
	value_4 = value_3.value
	value_5 = value_4
	value_4 = value_4.get(value_5)
	value_5 = value_5(value_6)
	if value_5 == "number" then
		value_7 = 0
		value_8 = 100
		return value_5(value_6, value_7, value_8)
	else
		value_5 = nil
		return value_5
	end
end

recovered.andromeda_y_2_p296 = function(upvalues, argument_1, argument_2, ...)
  local value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_17
	value_1 = argument_1
	value_2 = argument_2
	value_17 = 81
	if not (value_17) then
		value_17 = 437
	end
	local t21 = {...}
		value_1 = t21[1]
		value_2 = t21[2]
	value_4 = upvalues[0][157]
	value_5 = value_3.y
	value_6 = value_3.x
	value_5 = value_5 / value_6
	value_4 = value_4(value_5)
	value_5 = upvalues[1]
	value_6 = value_4 * 180
	value_5 = upvalues[1]
	value_7 = 180
	value_5 = value_5(value_6, value_7)
	value_4 = value_5
	value_5 = value_4
	return value_5
end

recovered.andromeda_function_39_p297 = function(upvalues, argument_1, argument_2, ...)
	local value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_8
	value_1 = argument_1
	value_2 = argument_2
	value_3 = nil
	value_3 = value_1[1]
	value_4 = upvalues[0][161]
	value_5 = value_1[1]
	value_5 = value_2 - value_5
	value_4 = value_4(value_5)
	value_5 = 2
	value_6 = #value_8
	value_7 = 1
	local t15 = value_6
	local t16 = value_7
	local t14 = value_5 - t16
	repeat
		t14 = t14 + t16
		value_8 = t14
		value_5 = value_3
	do return value_5 end
	until true
end

recovered.andromeda_stop_to_full_running_fraction_p298 = function(upvalues, argument_1, argument_2, ...)
  local value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_10, value_11, value_12
  local value_20, value_21, value_22, value_23, value_24
	value_1 = argument_1
	value_2 = argument_2
	value_21 = value_21(value_22, value_23, value_24)
	if not (value_21) then
		value_21 = math_helpers[9]
		value_22 = math_helpers[6]
		value_21 = value_21(value_22)
	end
	value_21 = value_21 + 4551
	value_21 = value_21 - 4552
	value_20[82] = value_21
	value_20[46] = 136
	local t21 = {...}
		value_1 = t21[1]
		value_2 = t21[2]
	if not (value_4) then
		value_4 = 0
	end
	value_6 = 1
	value_3 = value_3(value_4, value_5, value_6)
	value_4 = upvalues[1][151]
	value_5 = 1
	value_6 = value_2.feet_speed_unknown_forwards_or_sideways
	if not (value_6) then
		value_6 = 1
	end
	value_4(value_5, value_6)
	repeat
		value_4 = value_2.stop_to_full_running_fraction
		if not (value_4) then
			value_4 = 0
		end
		value_6 = 58
	until nil <= value_6
	value_10 = upvalues[1][162]
	value_11 = value_5
	value_12 = 58
	value_10 = value_10(value_11, value_12)
	return value_7()
end

recovered.andromeda_freestand_cache_p299 = function(upvalues, argument_1, ...)
	local value_1, value_2, value_3, value_4, value_5, value_6
	value_1 = argument_1
	value_2 = upvalues[0][23]()
	value_3 = upvalues[1].freestand_cache
	value_3 = value_3[value_1]
	value_4 = value_3.tick
	if value_4 == value_2 then
		return value_4
	end
	value_4 = upvalues[0][32]()
	value_5 = upvalues[0][50]
	value_6 = value_4
	value_5 = value_5(value_6)
	value_5 = value_3 ~= nil
	if value_5 then
		value_5 = value_3.side
	end
	if not (value_5) then
		value_5 = 1
	end
	return value_5
end

recovered.andromeda_override_prefer_body_aim_p300 = function(upvalues, argument_1, ...)
  local value_1, value_2, value_3, value_4, value_8, value_12, value_13, value_14
	value_1 = argument_1
	value_2 = upvalues[0].applied
	value_2 = value_2[value_1]
	if value_2 then
		value_14 = 363
		if not (value_14) then
			value_14 = 347
		end
		value_14 = value_14 + 88
		value_14 = value_14 + 27138
		value_14 = value_14 - 27571
		value_12[78] = value_14
		value_13[5] = 76
	end
	value_2 = upvalues[0].applied_body
	value_2 = value_2[value_1]
	if value_2 then
		value_8 = upvalues[1][141]
		value_3 = value_1
		value_4 = "Override prefer body aim"
	end
	return
end

recovered.andromeda_applied_body_p301 = function(upvalues, ...)
  local value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_8, value_10, value_16
  local value_17
	value_1 = 1
	value_2 = 64
	value_3 = 1
	local t11 = {parent = nil, index = nil, step = nil, limit = nil}
	local t13 = value_2
	local t14 = value_3
	local t12 = value_1 - t14
	repeat
		t12 = t12 + t14
		value_4 = t12
		if (t14 > 0 or t12 + t14 < t13) and (t14 <= 0 or t12 + t14 > t13) then
			value_1 = {}
			upvalues[1].applied = value_1
			value_1 = {}
			upvalues[1].applied_body = value_1
			value_1 = {}
			upvalues[1].correction_until = value_1
			value_1 = {}
			value_2 = {}
			value_1.cur = value_2
			value_1.pre_prev = value_2
			value_2 = {}
			value_1.pre_pre_prev = value_2
			value_2 = {}
			value_1.flags = value_2
			value_2 = {}
			value_1.last_value = value_2
			value_2 = {}
			value_1.miss_side = value_2
			value_2 = {}
			return
		end
		value_5 = upvalues[0][141]
		value_6 = value_4
		value_7 = "Force body yaw"
		value_8 = false
		value_5(value_6, value_7, value_8)
		value_17 = 96
		if not (value_17) then
			value_17 = 361
		end
		local t5 = 17
		local t4 = upvalues
		local t3 = 17
		value_17 = value_17 - 29139
		value_10[46] = value_17
		value_16[69] = 45
	until true
end

recovered.andromeda_sim_store_p302 = function(upvalues, argument_1, ...)
	local value_1, value_2, value_12
	value_1 = argument_1
	value_2[value_1] = nil
	value_2 = upvalues[0].resolved
	value_2[value_1] = nil
	value_2 = upvalues[0].records
	value_2[value_1] = value_12
	value_2 = upvalues[0].miss_counter
	-- Luraph junk / invalid SSA expression removed
	value_2 = upvalues[0].correction_until
	value_2[value_1] = nil
	value_2 = upvalues[0].wraith.cur
	value_2[value_1] = nil
	value_2 = upvalues[0].wraith.prev
	value_2[value_1] = nil
	value_2 = upvalues[0].wraith.pre_prev
	value_2[value_1] = nil
	value_2 = value_2.miss_side
	value_2[value_1] = nil
	value_2 = upvalues[0].wraith
	value_2[value_1] = nil
	value_2 = upvalues[0].wraith.misses
	value_2[value_1] = nil
	return
end

recovered.andromeda_color_picker_p303 = function(upvalues, argument_1, argument_2, ...)
	local locals = make_locals()
	local t13
	locals.v1 = argument_1
	locals.v2 = argument_2
	repeat
		local t19 = locals.v4(nil, t18)
		locals.v6 = t24
		locals.v5 = t19
		local t18 = t19
		locals.v4 = locals.v3
		do return locals.v4 end
		locals.v8 = locals.v6.type
		locals.v7 = locals.v6.type
		locals.v7 = locals.v6.type
		locals.v7 = {}
		locals.v9 = locals.v6
		locals.v8 = locals.v6.get(locals.v9)
		local t24 = 0 - 7
		local t25 = 1
		locals.v7[t26 + 0] = locals[t26 + 7]
		locals.v3[locals.v5] = locals.v7
		locals.v7 = locals.v6.type
	until true
	if not (locals.v12) then
		locals.v12 = 0
	end
		locals.v10[1] = locals.v11
		locals.v10[2] = locals.v12
	locals.v3[locals.v5] = locals.v10
end

recovered.andromeda_find_2_p304 = function(upvalues, argument_1, argument_2, argument_3, ...)
	local value_1, value_2, value_3, value_4
	value_1 = argument_1
	value_2 = argument_2
	value_3 = argument_3
	value_4 = value_1.get_list
	value_4 = value_4 == "string"
	if value_4 then
		value_4 = value_2
	end
	if not (value_4) then
		value_4 = nil
	end
	return value_4
end

recovered.andromeda_function_40_p305 = function(upvalues, argument_1, ...)
	local value_1, value_2, value_3, value_4
	value_1 = argument_1
	value_2 = upvalues[0][154](value_3)
	value_1 = value_2
	value_2 = value_1 + 1
	value_2 = upvalues[1][value_2]
	value_3 = type
	value_4 = value_2
	value_3 = value_3(value_4)
	value_3 = value_2
	if not (value_3) then
		value_3 = nil
	end
	return value_3
end

recovered.andromeda_function_41_p306 = function(upvalues, argument_1, ...)
	local value_1, value_2, value_3, value_4, value_5, value_6
	local t12
	value_1 = argument_1
	value_2 = type
	value_3 = value_1
	value_2 = value_2(value_3)
	if value_2 ~= "string" then
		return value_2
	end
	value_2 = 1
	value_3 = upvalues[0]
	value_3 = #value_3
	value_4 = 1
	repeat
		repeat
			value_6 = upvalues[0][value_5]
			if value_6 == value_1 then
				value_6 = true
				return value_6
			end
			local t13 = t13 + nil
			value_5 = t13
			if (nil > 0 or t13 + nil >= nil or nil > 0) and t13 + nil <= nil then
			end
		until t13 < nil
	until t13 <= nil
	value_2 = false
	return value_2
end

recovered.andromeda_miss_counter_p307 = function(upvalues, argument_1, ...)
	local value_1, value_2, value_3, value_4
	value_1 = argument_1
	value_2 = upvalues[0].resolved
	value_2 = value_2[value_1]
	if not (value_2 ~= nil) then
		value_2 = upvalues[0].resolved
		value_3 = {}
		value_3.angle = 0
		value_3.yaw = 0
		-- Luraph junk / invalid SSA expression removed
	end
	value_2 = upvalues[0].records
	value_2 = value_2[value_1]
	if not (value_2 ~= nil) then
		value_2 = upvalues[0].records
		value_3 = {}
		value_3.n_yaw = nil
		value_4 = upvalues[1][23]
		value_3.stable_side = 1
		value_3.last_yaw_delta = 0
		value_2[value_1] = value_3
	end
	value_2 = upvalues[0].miss_counter
	value_2 = value_2[value_1]
	value_2 = upvalues[0].ent_store
	value_2 = value_2[value_1]
	value_2 = upvalues[0].resolved
	value_2 = value_2[value_1]
	value_3 = upvalues[0].records
	value_3 = value_3[value_1]
	value_4 = upvalues[0].ent_store
	value_4 = value_4[value_1]
	return value_2, value_3, value_4
end

recovered.andromeda_simtime_p308 = function(upvalues, argument_1, argument_2, ...)
  local value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_8, value_18, value_24
  local value_25, value_28, value_34
	value_1 = argument_1
	value_2 = argument_2
	value_3 = upvalues[0][50]
	value_4 = value_2
	value_3 = value_3(value_4)
	do return end
	if not (value_4) then
		value_4 = 0
	end
	value_5 = upvalues[0][28]()
	value_4 = value_4 / value_5
	value_4 = value_4 + 0.5
	value_3 = value_3(value_4)
	value_4 = upvalues[2].wraith.cur
	value_4 = value_4[value_2]
	value_25 = 402
	if not (value_25) then
		value_25 = 434
	end
	value_25 = value_25 + 2289
	value_25 = value_25 - 2580
	value_18[247] = value_25
	value_24[171] = 16
	value_5 = value_4.simtime
	value_5 = value_3 - value_5
	value_5 = upvalues[3]
	value_6 = value_1
	value_5 = value_5(value_6)
	value_6 = upvalues[3]
	value_7 = value_2
	value_28[91] = 7
	value_34[70] = 90
	value_8 = value_2
	value_7(value_8)
	return
end

recovered.andromeda_force_body_yaw_p309 = function(upvalues, argument_1, ...)
  local value_0, value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_8, value_9
  local value_10, value_11, value_12, value_13, value_14, value_15, value_16, value_17, value_18, value_19
  local value_20, value_21, value_22, value_23, value_24, value_25, value_26, value_27, value_28
	value_1 = argument_1
	value_2 = upvalues[0].wraith.cur
	value_4 = upvalues[0].wraith.pre_prev
	value_4 = value_4[value_1]
	value_5 = upvalues[0].wraith.pre_pre_prev
	value_5 = value_5[value_1]
	if value_5 == value_0 then
		return
	end
	value_6 = upvalues[2][161]
	value_7 = upvalues[3]
	value_8 = value_2.yaw
	value_9 = value_3.yaw
	value_8 = value_8 - value_9
	value_9 = 180
	value_7 = value_7(value_8, value_9)
	value_6 = value_6()
	value_7 = upvalues[3]
	value_8 = value_2.yaw
	value_9 = value_3.yaw
	value_8 = value_8 - value_9
	value_9 = 180
	value_7 = value_7(value_8, value_9)
	value_8 = upvalues[3]
	value_9 = value_2.yaw
	value_8 = value_8(value_9, value_10)
	value_9 = upvalues[3]
	value_10 = value_3.yaw
	value_11 = value_5.yaw
	value_10 = value_10 - value_11
	value_11 = 180
	value_9 = value_9(value_10, value_11)
	value_10 = upvalues[3]
	value_11 = value_3.yaw
	value_12 = value_4.yaw
	value_11 = value_11 - value_12
	value_12 = 180
	value_10 = value_10(value_11, value_12)
	value_11 = upvalues[3]
	value_12 = value_4.yaw
	value_13 = value_5.yaw
	value_12 = value_12 - value_13
	value_13 = 180
	value_11 = value_11(value_12, value_13)
	value_12 = upvalues[3]
	value_13 = value_5.yaw
	value_14 = value_2.yaw
	value_13 = value_13 - value_14
	value_14 = 180
	value_14 = value_14 ~= value_0
	if not (value_14) then
	end
	value_15 = value_14 ~= value_0
	if value_15 then
		value_16 = upvalues[2][154]
		value_17 = upvalues[2][28]()
		value_17 = 0.2 / value_17
		value_16 = value_16(value_17)
		value_15 = value_15 <= value_16
	end
	value_16 = upvalues[2][161]
	value_17 = upvalues[2][2][upvalues[2][1]]
	value_18 = value_2.pitch
	value_17 = value_17(value_18)
	value_18 = upvalues[2][161]
	value_19 = value_3.pitch
	value_18 = value_18(value_19)
	value_17 = value_17 - value_18
	value_16 = value_16(value_17)
	value_17 = value_2.pitch
	value_18 = value_3.pitch
	value_13 = "ON SHOT"
	repeat
		value_16 = upvalues[0].wraith.flags
		value_16[value_1] = value_13
		value_16 = value_2.pitch
		value_17 = value_3.pitch
		value_16 = 0
		value_16 = 58
		value_17 = upvalues[0].wraith.miss_until
		value_17 = value_17[value_1]
		value_17 = 0
		value_18 = upvalues[2][23]()
		value_19 = upvalues[0].wraith.miss_side
		value_19 = value_19[value_1]
		value_17 = upvalues[0].wraith.miss_side
		value_16 = value_17[value_1]
		value_17 = upvalues[2][141]
		value_18 = value_1
		value_19 = "Force body yaw"
		value_20 = true
		value_17 = value_17.last_value
		value_17[value_1] = value_16
		value_17 = upvalues[0].applied
		value_17[value_1] = true
		do return end
		value_16 = -58
		value_17 = value_3.yaw
		value_18 = upvalues[3]
		value_19 = value_2.yaw
		value_19 = value_19 - value_6
		value_20 = 180
		value_18 = value_18(value_19, value_20)
		value_19 = value_3.yaw
		value_20 = upvalues[3]
		value_21 = value_2.yaw
		value_21 = value_4.yaw
		value_22 = upvalues[3]
		value_23 = value_2.yaw
		value_23 = value_23 + value_6
		value_24 = 180
		value_22 = value_22(value_23, value_24)
		value_23 = value_4.yaw
		value_24 = value_2.yaw
		value_25 = value_4.yaw
		value_26 = upvalues[3]
		value_27 = value_2.yaw
		value_27 = value_27 + value_6
		value_28 = 180
		value_26 = value_26(value_27, value_28)
		value_16 = 0
		value_16 = 58
		value_16 = -58
		value_16 = upvalues[1]
		value_17 = value_1
		value_16(value_17)
		do return end
		value_16 = upvalues[2][161]
		value_17 = value_8
		value_16 = value_16(value_17)
		value_17 = upvalues[2][161]
		value_18 = value_9
		value_17 = value_17(value_18)
		value_16 = upvalues[2][161]
		value_17 = value_7
		value_16 = value_16(value_17)
	until true
	value_17 = upvalues[2][161]
	value_18 = value_10
	value_17 = value_17(value_18)
	value_18 = upvalues[2][161]
	value_19 = value_11
	value_18 = value_18(value_19)
	value_19 = upvalues[2][161]
	value_20 = value_12
	value_19 = value_19(value_20)
end

recovered.andromeda_applied_p310 = function(upvalues, argument_1, ...)
  local value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_8, value_9, value_10
  local value_11, value_12, value_13, value_14, value_15, value_16, value_17, value_18, value_19, value_20
  local value_21, value_22
	local t9 = select("#", ...)
	value_1 = argument_1
	repeat
		value_16 = 21
		value_16 = 99
		local t20 = {...}
			value_1 = t20[1]
		value_2 = ipairs
		value_3 = upvalues[0]()
		value_2 = value_2()
		local t10 = {...}
		t9 = select("#", ...)
			value_1 = t10[1]
			value_2 = t10[2]
			value_3 = t10[3]
			value_4 = t10[4]
			value_5 = t10[5]
			value_6 = t10[6]
			value_7 = t10[7]
			value_8 = t10[8]
			value_9 = t10[9]
			value_10 = t10[10]
			value_11 = t10[11]
			value_12 = t10[12]
			value_13 = t10[13]
			value_14 = t10[14]
			value_15 = t10[15]
			value_16 = t10[16]
			value_17 = t10[17]
			value_18 = t10[18]
			value_19 = t10[19]
			value_20 = t10[20]
			value_21 = t10[21]
			value_22 = t10[22]
	until true
end

recovered.net_update_end_p311 = function(upvalues, ...)
	local locals = make_locals()
	t9 = {...}
	locals.v1 = upvalues[0]
	locals.v1 = locals.v1()
	locals.v1 = ipairs
	locals.v0 = locals.v1 ~= nil
	locals.v1 = locals.v2 == nil
	locals.v1 = locals.v1()
	local t11 = {parent = nil, index = nil, step = nil, limit = nil}
	local t14 = locals.v3
	local t13 = locals.v2
	local t12 = locals.v1
	repeat
		local t17 = locals.v1(nil, t16)
		if t17 ~= nil then
			t16, locals.v2, locals.v3 = t17, t17, t22
		end
		locals.v4 = entity
		locals.v4 = locals.v4.get_simtime
		locals.v5 = locals.v3
		locals.v4 = locals.v4(locals.v5)
		locals.v6 = upvalues[2].sim_store
		for t24 = 1, 125 do
			locals.v7[t24 + 0] = locals[t24 + 7]
		end
		locals.v8 = locals.v4
		locals.v9 = locals.v5
			locals.v7[1] = locals.v8
			locals.v7[2] = locals.v9
	until true
end

recovered.andromeda_function_42_p312 = function(upvalues, argument_1, ...)
  local value_1, value_2, value_3, value_4, value_11, value_12, value_13
	value_1 = argument_1
	value_13 = 377
	if not (value_13) then
		value_13 = 402
	end
	value_13 = value_13 + 16759
	value_13 = value_13 - 17136
	value_11[48] = value_13
	value_12[13] = 13
	local t20 = {...}
		value_1 = t20[1]
	value_2 = pairs
	value_3 = value_1
	value_2 = value_2(value_3)
	local t12 = {parent = nil, index = nil, step = nil, limit = nil}
	local t18 = value_2(nil, nil)
	if t18 ~= nil then
		t17, value_3, value_4 = t18, t18, t23
	end
	repeat
	do return end
	until true
end

recovered.andromeda_native_indicator_alpha_p313 = function(upvalues, argument_1, ...)
	local value_1, value_2
	value_1 = argument_1
	if value_1 ~= nil then
		value_2 = "native_indicator_alpha:" .. value_1
		upvalues[0][value_2] = 0
		value_2 = "native_indicator_slide:" .. value_1
		upvalues[0][value_2] = 1
		return
	end
end

recovered.andromeda_eye_angles_y_p314 = function(upvalues, argument_1, ...)
  local value_0, value_1, value_2, value_3, value_4, value_18
	value_1 = argument_1
	value_18 = 303
	repeat

		local t20 = {...}
			value_1 = t20[1]
		value_2 = upvalues[0]
		value_3 = value_1
		value_2 = value_2(value_3)
	until value_2 ~= value_0
	value_4 = value_2
	value_3 = value_2.get_anim_state(value_4)
end

recovered.andromeda_init_from_angles_p315 = function(upvalues, argument_1, argument_2, ...)
	local locals = make_locals()
	local t4
	local t9 = 0
	local t13
	locals.v1 = argument_1
	locals.v2 = argument_2
	local t21 = {...}
		locals.v1 = t21[1]
		locals.v2 = t21[2]
	if locals.v1 == locals.v0 then
		return locals.v3
	end
	if locals.v2 == locals.v0 then
		return locals.v3
	end
	locals.v3 = upvalues[0]
	locals.v4 = upvalues[1][46]
	locals.v5 = locals.v1
	locals.v4 = locals.v4(locals.v5)
	locals.v3 = locals.v3(unpack_locals(locals, 4, t9))
	locals.v4 = upvalues[0]
	locals.v6 = locals.v2
	locals.v5 = locals.v5(locals.v6)
	locals.v4 = locals.v4(unpack_locals(locals, 5, t9))
	locals.v5 = upvalues[0]
	locals.v6 = locals.v4 - locals.v3
	locals.v7 = locals.v6
	locals.v6 = locals.v6.angles(locals.v7)
	locals.v5 = locals.v5(unpack_locals(locals, 6, t9))
	locals.v6 = upvalues[0]
	locals.v7 = upvalues[1][91]()
	locals.v6 = locals.v6(unpack_locals(locals, 7, t9))
	locals.v7 = upvalues[0]
	locals.v8 = upvalues[1][39]
	locals.v9 = locals.v2
	locals.v10 = 3
	locals.v8 = locals.v8(locals.v9, locals.v10)
	locals.v7 = locals.v7(unpack_locals(locals, 8, t9))
	locals.v8 = upvalues[0]()
	locals.v9 = locals.v8
	locals.v8 = locals.v8.init_from_angles
	locals.v10 = 0
	local t5 = 4141
	t4 = 5
	locals.v11 = locals.v11 + 90
	locals.v8 = locals.v8(locals.v9, locals.v10, locals.v11)
	locals.v9 = upvalues[0]
	t13 = {parent = t13, index = t14, step = t16, limit = t15}
	local t16 = locals.v2
	local t15 = locals.v1
	local t14 = locals.v0
end

recovered.andromeda_entity_p316 = function(upvalues, argument_1, argument_2, ...)
  local value_0, value_1, value_2, value_3, value_4, value_5, value_14, value_15, value_16, value_17
  local value_18, value_19
	value_1 = argument_1
	value_2 = argument_2
	value_3 = upvalues[0][2][upvalues[0][1]].moving
	if (not value_2) then
		return value_3
	end
	value_3 = entity.get_flag
	value_4 = value_2
	value_5 = "Occluded"
	value_3 = value_3(value_4, value_5)
	if value_3 then
		return value_3
	end
	value_3 = entity.get_flag
	value_4 = value_2
	value_5 = "Hit"
	value_3 = value_3(value_4, value_5)
	value_16 = math_helpers[10]
	value_17 = "x\142\198m3"
	value_18 = 4
	-- Luraph junk / invalid SSA expression removed
	value_16 = value_16(value_17, value_18, value_19)
	value_15 = value_15 + value_16
	value_15 = value_15 + 676
	value_15 = value_15 - 696
	value_14[39] = value_15
	value_14[35] = 36
	value_3 = upvalues[2][2][upvalues[2][1]]
	if not (value_3 ~= value_0) then
		value_3 = upvalues[4][23]()
		if value_3 ~= nil then
		end
		value_3 = upvalues[4][23]()
		upvalues[2][2][upvalues[2][1]] = value_3
	end
	value_5 = upvalues[3][2][upvalues[3][1]]
	value_4 = value_4 - value_5
	value_3 = value_3(value_4)
	value_3 = true
	return value_3
end

recovered.andromeda_cvar_p317 = function(upvalues, ...)
	local value_1, value_2, value_3, value_4
	repeat
		do return end
		value_1 = upvalues[0].aspect_ratio_value
		value_2 = value_1
		value_1 = value_1.get(value_2)
		value_1 = cvar.r_aspectratio
		value_1 = nil
		value_3 = upvalues[1]
		value_1(value_2, value_3)
		value_3 = upvalues[0].aspect_ratio_value
		value_4 = value_3
		value_3 = value_3.get(value_4)
		value_3 = value_3 * 0.01
		value_1(value_2, value_3)
	until true
end

recovered.andromeda_cvar_2_p318 = function(upvalues, ...)
	local value_1, value_2, value_3
	value_1 = cvar.cam_idealdist
	-- Luraph junk / invalid SSA expression removed
	repeat
		repeat
			value_1 = cvar.c_mindistance
			value_2 = value_1
			value_1 = value_1.set_int
		until true
		repeat
			value_1 = cvar.c_maxdistance
			if value_1 == nil then
				return
			else
				value_1 = cvar.c_maxdistance
				value_2 = value_1
				value_1 = value_1.set_int
				value_3 = upvalues[3]
				value_1(value_2, value_3)
				if value_1 then
					return nil
				end
				break
			end
		do break end
		until value_1 == nil
	until value_1 == nil
end

recovered.andromeda_get_float_p319 = function(upvalues, argument_1, argument_2, ...)
  local value_0, value_1, value_2, value_3, value_4, value_14, value_15
	t11 = {...}
	value_1 = argument_1
	value_2 = argument_2
		value_1 = ({...})[1]
		value_2 = ({...})[2]
	if value_1 ~= value_0 then
	else
		value_14 = math_helpers[7]
		value_15 = ""
		value_0[value_0] = nil
		if value_14 then
		else
			value_14 = 71
		end
	end
	value_4 = value_1
	value_3 = value_1.get_float
	value_3 = value_3(value_4)
	if value_3 then
	else
		value_3 = value_2
	end
	return value_3
end

recovered.andromeda_round_p320 = function(upvalues, argument_1, ...)
	local value_1, value_2, value_3, value_4
	value_1 = argument_1
	value_3 = value_1
	value_2 = value_1.get(value_3)
	value_3 = type
	value_4 = value_2
	value_3 = value_3(value_4)
	if value_3 == "number" then
		value_3 = upvalues[0].round
		value_4 = value_2 / 10
		value_3 = value_3(value_4)
		value_3 = value_3 * 10
		return value_3
	else
		value_3 = 0
		return value_3
	end
end

recovered.andromeda_pcall_p321 = function(upvalues, ...)
	local value_1, value_2, value_3, value_4, value_5
	value_1 = pcall
	value_2 = bind(recovered.andromeda_c_p322, {[0] = upvalues[0]})
	value_1 = value_1(value_2)
	if value_1 then
		value_3 = value_2
		return value_3
	else
		value_3 = client.random_int
		value_4 = 1
		value_5 = upvalues[1]
		value_5 = #value_5
		return value_3(value_4, value_5)
	end
end

recovered.andromeda_c_p322 = function(upvalues, ...)
end

recovered.andromeda_handlers_4_p323 = function(upvalues, ...)
end

recovered.andromeda_shots_p324 = function(upvalues, ...)
	local value_1, value_2, value_3, value_4
	value_1 = upvalues[0].items
	value_1 = #value_1
	value_2 = 1
	value_3 = -1
	local t11 = {parent = nil, index = nil, step = nil, limit = nil}
	local t13 = value_2
	local t14 = value_3
	local t12 = value_1 - t14
	repeat
		t12 = t12 + t14
		value_4 = t12
	until true
	if t14 <= 0 or t12 > t13 then
		value_1 = pairs
		value_2 = upvalues[0].shots
		value_1 = value_1(value_2)
		t11 = {parent = t11.parent, index = t11.index, step = t11.step, limit = t11.limit}
		repeat
			local t17 = value_1(nil, t16)
			value_3 = t22
			value_2 = t17
			local t16 = t17
		until true
		return
	end
end

recovered.andromeda_get_planting_progress_p325 = function(upvalues, argument_1, argument_2, argument_3, argument_4, argument_5, argument_6, ...)
	local locals = make_locals()
	local t13 = 0
	locals.v1 = argument_1
	locals.v2 = argument_2
	locals.v3 = argument_3
	locals.v4 = argument_4
	locals.v5 = argument_5
	locals.v6 = argument_6
	locals.v7 = upvalues[0].px
	locals.v8 = 8
	locals.v9 = ({...})[1]
	locals.v7 = locals.v7(locals.v8, locals.v9)
	locals.v8 = upvalues[1][151]
	locals.v9 = 3
	locals.v10 = upvalues[0].px
	locals.v11 = 4
	locals.v12 = locals.v5
	locals.v10 = locals.v10(locals.v11, locals.v12)
	locals.v8 = locals.v8(unpack_locals(locals, 9, t13))
	locals.v9 = locals.v1 + locals.v3
	locals.v10 = upvalues[0].px
	locals.v11 = locals.v11 + 0.5
	locals.v10 = locals.v10(locals.v11)
	locals.v10 = locals.v2 + locals.v10
	locals.v11 = upvalues[0].get_planting_progress()
	locals.v12 = upvalues[2].clamp
	locals.v13 = upvalues[1][154]
	locals.v14 = locals.v6
	if not (locals.v14) then
		locals.v14 = 1
	end
	locals.v16 = 0
	locals.v17 = 0
	locals.v18 = 0
	locals.v20 = 1
	locals.v20 = locals.v20 * 120
	locals.v19 = locals.v19(locals.v20)
	locals.v20 = locals.v7
	locals.v21 = 0
	locals.v22 = 1
	locals.v23 = locals.v8
	locals.v13(locals.v14, locals.v15, locals.v16, locals.v17, locals.v18, locals.v19, locals.v20, locals.v21, locals.v22, locals.v23)
	if not (locals.v11 <= 0) then
		locals.v13 = upvalues[1][127]
		locals.v14 = locals.v9
		locals.v15 = locals.v10
		locals.v23 = locals.v23(locals.v24, locals.v25)
		locals.v13(unpack_locals(locals, 14, t13))
	end
	return
end

recovered.draw_planting_item_p326 = function(upvalues, argument_1, argument_2, argument_3, argument_4, argument_5, argument_6, argument_7, ...)
	local locals = make_locals()
	locals.v1 = argument_1
	locals.v2 = argument_2
	locals.v3 = argument_3
	locals.v4 = argument_4
	locals.v5 = argument_5
	locals.v6 = argument_6
	locals.v7 = argument_7
	if not (locals.v30) then
		locals.v30 = 185
	end
	locals.v30 = locals.v30 + 29135
	locals.v30 = locals.v30 - 29259
	locals.v27[11] = locals.v30
	locals.v29[104] = 5
	locals.v9 = locals.v9(locals.v10)
	locals.v10 = upvalues[1][154]
	locals.v11 = upvalues[0].px
	locals.v12 = 26
	locals.v13 = locals.v6
	locals.v11 = locals.v11(locals.v12, locals.v13)
	locals.v11 = locals.v11 * locals.v9
	locals.v11 = locals.v11 + 0.5
	locals.v10 = locals.v10(locals.v11)
	locals.v10 = locals.v2 - locals.v10
	locals.v11 = upvalues[0].draw_row_background
	locals.v12 = locals.v10
	locals.v13 = locals.v3
	locals.v14 = locals.v4
	locals.v15 = locals.v5
	locals.v16 = locals.v8
	locals.v11(locals.v12, locals.v13, locals.v14, locals.v15, locals.v16)
	locals.v11 = upvalues[0].draw_item
	locals.v12 = locals.v1
	locals.v13 = locals.v2
	locals.v14 = locals.v4
	locals.v15 = locals.v5
	locals.v16 = locals.v6
	locals.v17 = locals.v8
	locals.v11(unpack_locals(locals, 12, 121))
	return
end

recovered.draw_centered_text_p327 = function(upvalues, ...)
  local value_1, value_2, value_3, value_5, value_6, value_7, value_9, value_10, value_11, value_12
  local value_13, value_14, value_15, value_16, value_17, value_18, value_19, value_20, value_21, value_22
  local value_23, value_24, value_25, value_26, value_27, value_28, value_29
	value_10 = upvalues[0][154]
	value_11 = upvalues[1].px
	value_12 = 26
	value_13 = value_6
	value_11 = value_11(value_12, value_13)
	value_12 = value_9
	if not (value_12) then
		value_12 = 0
	end
	value_11 = value_11 * value_12
	value_11 = value_11 + 0.5
	value_10 = value_10(value_11)
	value_10 = value_2 - value_10
	value_11 = value_1.text
	if not (value_11) then
		value_11 = ""
	end
	value_13 = value_7
	value_14 = value_11
	value_12 = value_12(value_13, value_14)
	value_14 = upvalues[0][154]
	value_15 = value_12
	value_15 = 0
	value_14 = value_10 + value_14
	value_15 = upvalues[0][154]
	value_16 = value_13
	if not (value_16) then
		value_16 = 8
	end
	value_5 = value_16 .. nil
	value_16 = value_16 * 0.5
	value_16 = value_16 + 0.5
	value_15 = value_15(value_16)
	value_15 = value_3 + value_15
	value_16 = upvalues[2].clamp
	value_17 = value_1.a
	if not (value_17) then
		value_17 = 255
	end
	value_18 = 0
	value_19 = 255
	value_16 = value_16(value_17, value_18, value_19)
	value_17 = 230
	value_19 = 210
	value_20 = value_1.kind
	if not (value_20 ~= "fatal") then
		value_19 = 55
		value_18 = 45
		value_17 = 220
	end
	value_24 = value_18
	value_25 = value_19
	value_26 = value_16
	value_27 = value_7
	value_28 = 0
	value_29 = value_11
	value_20(value_21, value_22, value_23, value_24, value_25, value_26, value_27, value_28, value_29)
	return
end

recovered.get_icon_size_p328 = function(upvalues, argument_1, argument_2, ...)
  local value_1, value_2, value_3, value_4, value_5, value_12, value_13, value_14, value_15, value_16
	value_1 = argument_1
	value_2 = argument_2
	value_14 = 287
	if not (value_14) then
		value_14 = 204
	end
	value_15 = math_helpers[5]
	value_16 = math_helpers[6]
	value_15 = value_15(value_16)
	local t7 = 14
	value_14 = value_14 + 14987
	value_14 = value_14 - 15274
	value_12[60] = value_14
	value_13[22] = 86
	local t21 = {...}
		value_1 = t21[1]
		value_2 = t21[2]
	value_3 = upvalues[0].is_bomb_indicator_kind
	value_4 = value_1
	value_3 = upvalues[0].px
	value_4 = 21
	value_5 = value_2
	return value_3(value_4, value_5)
end

recovered.andromeda_ease_in_p329 = function(upvalues, argument_1, argument_2, argument_3, argument_4, argument_5, ...)
  local value_0, value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_8, value_9
  local value_10
	local t7
	value_1 = argument_1
	value_2 = argument_2
	value_3 = argument_3
	value_4 = argument_4
	value_5 = argument_5
	local t24 = {...}
		value_1 = t24[1]
		value_2 = t24[2]
		value_3 = t24[3]
		value_4 = t24[4]
		value_5 = t24[5]
	value_6 = upvalues[0][value_1]
	if not (value_6 ~= value_0) then
		upvalues[0][value_1] = value_2
	end
	value_6 = value_3
	if value_6 then
	end
	value_3 = value_6
	value_6 = value_4
	if not (value_6) then
		value_6 = 0.005
	end
	value_6 = "linear"
	value_5 = value_6
	local t10 = value_1
	local t9 = upvalues[0][t10]
	value_6 = t9
	value_7 = upvalues[1][19]()
	value_7 = value_7 * value_3
	repeat
		value_9 = upvalues[1][161]
		value_10 = value_2 - value_8
		value_9 = value_9(value_10)
		upvalues[0][value_1] = value_2
		value_9 = upvalues[0][value_1]
		do return value_9 end
		upvalues[0][value_1] = value_8
		value_10 = value_7 * 2
		value_10 = 3 - value_10
		value_9 = value_9 * value_10
		value_8 = value_6 + value_9
		t9 = t9 + t10[9]
		value_9 = value_9 * value_7
		value_9 = value_9 * value_7
		value_8 = value_6 + value_9
		value_9 = 1 - value_7
		value_10 = 1 - value_7
		value_9 = value_9 * value_10
		local t26 = false
		t26 = true
		value_9 = value_7 < 0.5
		value_4 = value_7 * 2
		value_9 = value_9 * value_7
	until true
	value_9 = value_9 / 2
	value_9 = 1 - value_9
end

recovered.get_weapon_reload_p330 = function(upvalues, argument_1, ...)
  local value_1, value_2, value_3, value_4, value_5, value_8, value_14, value_15
	local t3
	value_1 = argument_1
	value_2 = upvalues[0]
	value_3 = value_1
	value_2 = value_2(value_3)
	if (not value_2) then
		return value_3
	end
	value_4 = value_2
	value_3 = value_2.get_anim_overlay
	value_5 = 1
	value_3 = value_3(value_4, value_5)
	if (not value_3) then
		return value_4
	end
	if not (value_15) then
		value_15 = 155
	end
	value_15 = value_15 + 19571
	value_15 = value_15 - 19644
	value_8[10] = value_15
	value_14[70] = 8
	value_5 = value_3.weight
	if value_5 == 0 then
		return value_5
	else
		value_5 = value_3.cycle
		return value_5
	end
end

recovered.get_flag_p331 = function(upvalues, argument_1, argument_2, ...)
  local value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_8, value_13, value_19
  local value_20, value_21
	local t4
	value_1 = argument_1
	value_2 = argument_2
	value_3 = upvalues[0][50]
	value_4 = value_1
	value_3 = value_3(value_4)
	value_20 = math_helpers[8]
	value_21 = math_helpers[6]
	value_20 = value_20(value_21)
	if not (value_20) then
		value_20 = 275
	end
	value_20 = value_20 + 28824
	value_20 = value_20 - 28733
	value_13[81] = value_20
	value_19[142] = 79
	repeat
		repeat
			value_3 = false
			-- impossible unresolved-key write removed
		until true
		repeat
			local t19 = value_6(nil, t18)
		until true
		t18, value_7, value_8 = t19, t19, t24
	until t19 ~= nil
	value_5 = false
	return value_5
end

recovered.update_pitch_p332 = function(upvalues, argument_1, ...)
	local value_1, value_2
	value_1 = argument_1
	value_2 = value_1.pitch
	value_2.type = "Default"
	value_2 = value_1.pitch
	value_2.value = 0
	return
end

recovered.write_db_p333 = function(upvalues, argument_1, ...)
  local value_1, value_2, value_3, value_4, value_7, value_13, value_14
	value_1 = argument_1
	value_2 = type
	value_3 = value_1.configs_db
	value_2 = value_2(value_3)
	if value_2 ~= "table" then
		return value_2
	end
	value_14 = 229
	value_14 = value_14 - 2
	value_14 = value_14 + 25301
	value_14 = value_14 - 25446
	value_7[43] = value_14
	value_13[92] = 65
	value_2 = value_1.configs_db
	value_3 = value_1.version
	value_2.version = value_3
	value_2 = value_1.configs_db
	value_4 = value_1.configs_db
	value_2(value_3, value_4)
	value_2 = true
	return value_2
end

recovered.andromeda_build_maps_p334 = function(upvalues, ...)
	local value_15, value_16
	value_15 = math_helpers[5]
	value_16 = math_helpers[6]
	return value_15()
end

recovered.sort_items_p335 = function(upvalues, argument_1, argument_2, ...)
	local value_1, value_2, value_3, value_4, value_5, value_6
	value_1 = argument_1
	value_2 = argument_2
	if value_1 == nil then
		return value_3
	end
	if value_2 == nil then
		return value_3
	end
	value_3 = value_1.order
	if not (value_3) then
		local t8 = 2882
	end
	value_4 = value_2.order
	if not (value_4) then
		value_4 = 1000
	end
	value_5 = value_1.sequence
	if not (value_5) then
		value_5 = 0
	end
	value_6 = 0
end

recovered.andromeda_function_43_p336 = function(upvalues, argument_1, argument_2, ...)
	local value_1, value_2, value_3, value_4
	value_1 = argument_1
	value_2 = argument_2
	if value_1 == nil then
		value_4 = ""
		return value_3(value_4)
	else
		value_3 = tostring
		value_4 = value_1
		return value_3(value_4)
	end
end

-- Overpredict feedback: only prediction-error misses are penalized.
recovered.andromeda_target_p337 = function(upvalues, event, ...)
	if event == nil or event.reason ~= "prediction error" then return end

	local state = upvalues[0]
	local api = upvalues[1]
	local target = tonumber(event.target) or event.target
	local player = state.player_state[target]
	if player == nil then return end

	player.penalty_until = api[23]() + 48
	player.boost_until = 0
	player.miss_streak = math.min((player.miss_streak or 0) + 1, 4)
	player.hit_streak = 0
end

recovered.andromeda_update_callbacks_3_p338 = function(upvalues, ...)
  local value_1, value_2
	value_1 = upvalues[0].update_callbacks
	value_2 = upvalues[1]()
	value_1()
	value_1 = upvalues[1]()
	if not (value_1 == true) then
		value_1 = upvalues[0].reset
		value_1()
	end
	return
end

recovered.andromeda_exploits_2_p339 = function(upvalues, argument_1, ...)
  local value_0, value_1, value_2, value_3, value_4, value_5, value_6
	value_1 = argument_1
	local t20 = {...}
		value_1 = t20[1]
	value_2 = upvalues[0][32]()
	value_3 = false
	value_4 = upvalues[0][47]
	value_5 = value_2
	value_6 = "m_nTickBase"
	value_4 = value_4(value_5, value_6)
	value_5 = upvalues[1].is_double_tap
	if value_1 ~= value_0 then
	end
	return
end

recovered.get_simtime_p340 = function(upvalues, argument_1, ...)
  local value_0, value_1, value_2, value_3, value_4, value_5, value_8, value_14, value_15
	value_1 = argument_1
	value_15 = 349
	value_15 = value_15 + 5985
	value_15 = value_15 - 5956
	value_8[20] = value_15
	value_14[29] = 18
	local t20 = {...}
		value_1 = t20[1]
	-- Luraph junk / invalid SSA expression removed
	if value_1 ~= value_0 then
		value_1 = value_1(value_2)
		value_3 = 0
		value_4 = 0
		return value_3, value_4
	else
		value_2 = 0
		value_3 = 0
		return value_2, value_3
	end
	value_3 = value_2
	return value_4, value_5
end

recovered.andromeda_force_body_yaw_value_p341 = function(upvalues, ...)
	local value_1
	repeat
		repeat
			value_1 = upvalues[0]()
		until true
		value_1 = upvalues[2]()
	until value_1 ~= "Auto"
	return
end

recovered.andromeda_miss_counter_2_p342 = function(upvalues, argument_1, ...)
	local locals = make_locals()
	local t3
	local t8 = 0
	locals.v1 = argument_1
	locals.v2 = upvalues[0]()
	locals.v3 = locals.v1.target
	locals.v3 = "?"
	locals.v2 = locals.v2(locals.v3)
	locals.v3 = locals.v2
	locals.v2 = locals.v2.lower(locals.v3)
	locals.v3 = locals.v1.target
	locals.v4 = upvalues[1][33]
	locals.v5 = locals.v3
	locals.v4 = locals.v4(locals.v5)
	locals.v4 = upvalues[3].wraith.last_value
	locals.v4 = locals.v4[locals.v3]
	if not (locals.v4) then
		locals.v4 = 0
	end
	locals.v5 = upvalues[3].wraith.misses
	locals.v5 = locals.v5[locals.v3]
	locals.v5 = locals.v5 + 1
	if not (locals.v4 <= 0) then
		locals.v6 = -58
		repeat
			repeat
				locals.v7 = upvalues[3].wraith.misses
				locals.v7[locals.v3] = locals.v5
				locals.v7 = upvalues[3].wraith.miss_side
			until true
		until true
	end
	repeat
		locals.v8 = upvalues[1][23]()
		locals.v9 = upvalues[1][154]
		locals.v10 = upvalues[1][162]
		locals.v11 = locals.v5 * 0.12
		locals.v12 = 0.55
		locals.v10 = locals.v10(locals.v11, locals.v12)
		locals.v10 = locals.v10 + 0.9
		locals.v11 = upvalues[1][28]()
		locals.v10 = locals.v10 / locals.v11
		locals.v9 = locals.v9(locals.v10)
		locals.v8 = locals.v8 + locals.v9
		locals.v7[locals.v3] = locals.v8
		locals.v7 = upvalues[4]
		locals.v8 = "Logging"
		locals.v7 = locals.v7(locals.v8)
		locals.v21 = 93
		locals.v21 = 310
		locals.v21 = locals.v21 ^ 1251
		locals.v21 = locals.v21 - 1479
		locals.v14[252] = locals.v21
		locals.v20[307] = 249
		local t23 = 22
		local t24 = 1
		locals.v11 = locals.v3
		locals.v10 = locals.v10(locals.v11)
		locals.v10 = locals.v3
		locals.v11 = locals.v6
		locals.v8 = locals.v8(locals.v9, locals.v10, locals.v11)
		locals.v7(unpack_locals(locals, 8, t8))
		do return end
		locals.v7 = locals.v5 % 2
		locals.v6 = -58
		local t22 = false
		t22 = true
		locals.v12 = nil <= nil
		local t6 = 128
		local t4 = 4
		locals.v5 = upvalues[5]
		locals.v5 = locals_length(locals)[5]
		locals.v4 = locals.v4 % locals.v5
		locals.v4 = locals.v4 + 1
		locals.v5 = upvalues[3].miss_counter
		locals.v5[locals.v3] = locals.v4
		locals.v6 = locals.v5.stable_side
		locals.v6 = locals.v5.last_side
		locals.v6 = 1
		locals.v6 = -locals.v6
		locals.v5.stable_side = locals.v6
		locals.v6 = locals.v5.stable_side
		locals.v5.last_side = locals.v6
		locals.v6 = locals.v5.stable_side
		t22 = false
		t22 = true
		locals.v6 = locals.v6 > 0
		locals.v6 = 4
		locals.v6 = 0
		locals.v6 = 4
		locals.v6 = 0
		locals.v5.negative_votes = locals.v6
		locals.v6 = upvalues[1][162]
		locals.v7 = locals.v5.jitter_ticks
		locals.v7 = 0
		locals.v7 = locals.v7 + 4
		locals.v8 = 12
		locals.v6 = locals.v6(locals.v7, locals.v8)
		locals.v5.jitter_ticks = locals.v6
		locals.v7 = locals.v4 - 1
		locals.v7 = locals.v7 * 0.18
		locals.v8 = 0.75
		locals.v6 = locals.v6(locals.v7, locals.v8)
		locals.v6 = locals.v6 + 0.85
		locals.v7 = upvalues[3].correction_until
		locals.v8 = upvalues[1][23]()
		locals.v9 = upvalues[1][154]
		locals.v10 = upvalues[1][28]()
		locals.v7 = upvalues[4]
		locals.v8 = "Logging"
		locals.v7 = locals.v7(locals.v8)
		locals.v7 = upvalues[1][70]
		locals.v8 = string.format
		locals.v9 = "[Andromeda] Custom resolver miss adapt: %s -> phase %d"
		locals.v10 = upvalues[1][43]
		locals.v11 = locals.v3
		locals.v10 = locals.v10(locals.v11)
		locals.v10 = locals.v3
		locals.v11 = upvalues[3].miss_counter
		locals.v11 = locals.v11[locals.v3]
		locals.v8 = locals.v8(locals.v9, locals.v10, locals.v11)
		locals.v7(unpack_locals(locals, 8, t8))
	until true
	t22 = true
	locals.v4 = upvalues[3].miss_counter
	locals.v4 = locals.v4[locals.v3]
end

recovered.andromeda_is_quick_peek_p343 = function(upvalues, argument_1, argument_2, argument_3, ...)
  local value_0, value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_8, value_9
  local value_11, value_17, value_18
	value_1 = argument_1
	value_2 = argument_2
	value_3 = argument_3
	upvalues[0].hotkey_active = false
	value_4 = upvalues[0].option_enabled
	value_5 = value_3
	value_6 = "Hotkey"
	value_4 = value_4(value_5, value_6)
	value_4 = upvalues[1].ragebot.hitchance.hotkey
	if value_4 ~= value_0 then
		return value_4(value_5, value_6)
	end
	value_4 = upvalues[0].option_enabled
	value_5 = value_3
	value_6 = "Crouch"
	value_4 = value_4(value_5, value_6)
	if value_4 then
		if value_4 then
			value_4 = upvalues[0].is_crouched
			value_5 = value_1
			value_4 = value_4(value_5)
			if value_4 then
				value_4 = upvalues[2].is_fake_duck()
			end
		end
	end
	value_4 = upvalues[0].option_enabled
	value_5 = value_3
	value_6 = "Peek Assist"
	value_4 = value_4(value_5, value_6)
	if value_4 then
		return value_4(value_5, value_6)
	end
	value_4 = value_4(value_5, value_6)
	value_5 = value_4.distance
	value_6 = value_5
	value_5 = value_5.get(value_6)
	value_18 = 461
	if not (value_18) then
		value_18 = 68
	end
	value_18 = value_18 - 275
	value_18 = value_18 + 2471
	value_18 = value_18 - 2179
	value_11[108] = value_18
	value_17[194] = 122
	if not (value_5) then
		value_5 = 101
	end
	if value_5 == 101 then
		return value_6(value_7, value_8)
	end
	value_6 = upvalues[0].get_distance
	value_7 = value_1
	value_8 = upvalues[3][52]()
	value_0 = math_helpers[0]
	value_6 = value_6 * 0.083333336
	if value_7 <= value_5 then
		return value_7(value_8, value_9)
	end
	value_4 = upvalues[0].is_on_ground
	value_5 = value_1
	value_4 = value_4(value_5)
	if value_4 then
		return value_4
	else
		value_4 = upvalues[0].get_option_value
		value_5 = value_3
		value_6 = "In Air"
		return value_4(value_5, value_6)
	end
end

recovered.update_hitchance_p344 = function(upvalues, ...)
  local value_0, value_1, value_3, value_4, value_5, value_6, value_7, value_8, value_14, value_16
  local value_17, value_18
	upvalues[0].updated_this_tick = false
	upvalues[0].indicator_value = value_0
	value_1 = upvalues[0].is_enabled()
	if (not value_1) then
		return
	end
	if not (value_17) then
		value_17 = math_helpers[9]
		value_18 = math_helpers[6]
		value_17 = value_17(value_18)
	end
	value_17 = value_17 + 44
	value_17 = value_17 + 15315
	value_17 = value_17 - 15632
	value_14[24] = value_17
	value_16[122] = 99
	value_1 = upvalues[1][32]()
	if value_1 == value_0 then
	end
	do return end
	value_5 = upvalues[0].get_value
	value_6 = value_1
	value_7 = value_3
	value_8 = value_4
	value_5 = value_5(value_6, value_7, value_8)
	if value_5 ~= value_0 then
		value_0 = {}
		upvalues[0].updated_this_tick = true
		upvalues[0].indicator_value = value_5
		return
	end
end

recovered.run_command_p345 = function(upvalues, ...)
	local value_1
	upvalues[0].hotkey_active = false
	upvalues[0].updated_this_tick = false
	value_1 = upvalues[0].update_hitchance
	value_1()
	return
end

recovered.finish_command_p346 = function(upvalues, ...)
	local value_1
	value_1 = upvalues[0].unset_hitchance
	value_1()
	upvalues[0].active = false
	return
end

recovered.set_callback_p347 = function(upvalues, argument_1, argument_2, argument_3, ...)
  local value_0, value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_15, value_16
  local value_17, value_18, value_27
	value_1 = argument_1
	value_2 = argument_2
	value_3 = argument_3
	value_4 = value_3
	if not (value_4) then
		value_4 = value_3 == value_0
	end
	if value_4 then
		value_4 = upvalues[0][56]
	end
	value_16 = 279
	value_16 = 329
	value_17 = math_helpers[7]
	value_18 = ""
	value_17 = value_17(value_18)
	value_16 = value_16 >= value_17
	value_16 = math_helpers[16]
	value_16 = value_16 - 1582
	value_15[74] = value_16
	value_15[54] = 55
	if not (value_4) then
		value_4 = upvalues[0][95]
	end
	value_27 = value_4
	value_7 = value_1
	value_7 = value_2
	value_5(value_6, value_7)
	return
end

recovered.andromeda_flags_p348 = function(upvalues, argument_1, ...)
  local value_0, value_1, value_2, value_3, value_4, value_5, value_7, value_11, value_13, value_14
  local value_15, value_16, value_116, value_117
	value_1 = argument_1
	value_15 = 322
	if not (value_15) then
		value_15 = math_helpers[7]
		value_16 = "\235b\193"
		value_15 = value_15(value_16)
	end
	value_15 = value_15 + 21059
	value_15 = value_15 - 21379
	value_13[5] = value_15
	value_14[107] = 1
	value_3 = value_7 == nil
	value_4 = "Flags"
	value_3 = value_3(value_4)
	value_2 = upvalues[2].resolved
	value_2 = value_2[value_1]
	value_3 = upvalues[3][33]
	value_4 = value_1
	value_0(value_1)
	value_4 = value_4()
	if value_3 == value_0 then
		return
	else
		value_4 = true
		value_5 = value_3
		return value_116, value_117
	end
	value_3 = upvalues[4]()
	value_4 = value_11 ~= value_0
	value_5 = value_3
	return value_4, value_5
end

recovered.update_yaw_jitter_p349 = function(upvalues, argument_1, argument_2, ...)
  local value_0, value_1, value_2, value_3, value_4
	value_1 = argument_1
	value_2 = argument_2
	value_3 = value_2.yaw_modifiers
	value_4 = value_3.builder_type
	value_0 = nil <= nil
	return
end

recovered.update_hidden_p350 = function(upvalues, argument_1, argument_2, ...)
	local locals = make_locals()
	local t10 = select("#", ...)
	locals.v1 = argument_1
	locals.v2 = argument_2
	locals.v3 = upvalues[0].switch_type
	locals.v3 = upvalues[1][2][upvalues[1][1]].exploits.defensive
	locals.v4 = locals.v1.force_defensive_active
	if locals.v4 then
		locals.v4 = locals.v3.left
		locals.v4 = locals.v4 > 0
	end
	locals.v5 = 0
	locals.v6 = locals.v2.yaw
	locals.v7 = locals.v6
	if locals.v7 then
		locals.v7 = locals.v6.hidden
	end
	locals.v8 = locals.v6 ~= locals.v0
	if not locals.v8 then
	elseif locals.v7 == locals.v0 then
	else
		locals.v9 = locals.v7.type
		locals.v10 = locals.v9
		locals.v9 = locals.v9.get(locals.v10)
		if not (locals.v9 ~= "Static") then
			locals.v11 = locals.v10
			locals.v10 = locals.v10.get(locals.v11)
			locals.v5 = locals.v10
		end
	end
	repeat
		locals.v10 = locals.v9.builder_type
		locals.v11 = locals.v10
		locals.v10 = locals.v10.get(locals.v11)
		local t23 = false
		t23 = true
		locals.v10 = locals.v10 == "Hidden"
		locals.v12 = locals.v1
		locals.v11 = locals.v1.get_yaw_modifier_add
		locals.v13 = locals.v9.hidden
		locals.v11 = locals.v11(locals.v12, locals.v13)
		locals.v5 = locals.v5 + locals.v11
		do return end
		locals.v12 = locals.v12(locals.v13, locals.v14, locals.v15)
		locals.v11.add = locals.v12
		do return end
		locals.v11 = locals.v10
		locals.v10 = locals.v10.get(locals.v11)
		locals.v11 = locals.v7.right
		locals.v12 = locals.v11
		locals.v11 = locals.v11.get(locals.v12)
		locals.v13 = locals.v1
		locals.v12 = locals.v1.is_left_side
		local t24 = {}
		local t11 = t24
		t10 = select("#", ...)
		t24 = 0
		local t25 = 1
		locals[t26] = t11[t26]
		locals.v13 = locals.v12
		locals.v13 = locals.v10
		locals.v13 = locals.v11
		locals.v5 = locals.v13
	until true
end

recovered.andromeda_is_left_side_p351 = function(upvalues, ...)
	local value_4, value_5
	value_4 = value_4(value_5)
	if value_5 then
		value_5 = "Local view"
	end
	if not (value_5) then
		value_5 = "At targets"
	end
	value_4.base = value_5
	return
end

recovered.andromeda_cur_yaw_p352 = function(upvalues, ...)
  local value_0, value_1, value_2, value_3, value_4, value_5
	value_1 = upvalues[0]()
	value_1 = upvalues[1][32]()
	value_2 = upvalues[2]
	value_3 = value_1
	value_2 = value_2(value_3)
	value_3 = upvalues[1][50]
	value_4 = value_1
	value_3 = value_3(value_4)
	if value_2 == value_0 then
		return
	end
	value_3 = upvalues[4]()
	if value_3 == "Auto" then
		return
	end
	value_3 = upvalues[6].ragebot.enemy_resolver_generate
	-- impossible unresolved-key write removed
	if not (value_3) then
		value_3 = upvalues[6].ragebot.enemy_resolver_generate
		value_4 = value_3
		value_3 = value_3.get(value_4)
		value_3 = value_3 == "Adaptive"
	end
	value_4 = ipairs
	value_5 = upvalues[7]()
	value_4 = value_4()
	local t11 = {parent = nil, index = nil, step = nil, limit = nil}
	return
end

recovered.unset_aa_p353 = function(upvalues, ...)
	local value_1, value_22
	value_1 = value_1.angles.pitch
	value_1[1]:override()
	value_1 = upvalues[0].antiaim
	value_1 = value_22.angles.pitch
	value_1[2]:override()
	value_1 = upvalues[0].antiaim.angles
	value_1[1]:override()
	value_1 = upvalues[0].antiaim.angles
	value_1.yaw_base:override()
	value_1 = upvalues[0].antiaim.angles.yaw
	value_1 = upvalues[0].antiaim.angles.body_yaw
	value_1[1]:override()
	value_1 = upvalues[0].antiaim.angles
end

recovered.skip_native_cleanup_p354 = function(upvalues, ...)
end

recovered.andromeda_fast_ladder_p355 = function(upvalues, ...)
	local value_1
	value_1 = upvalues[0].visuals
	value_1 = value_1 ~= nil
	if value_1 then
		value_1 = upvalues[0].visuals.fast_ladder
		value_1 = value_1 ~= nil
	end
	return value_1
end

recovered.andromeda_paint_invalid_tick_cleaner_p356 = function(upvalues, ...)
	upvalues[0]:paint_invalid_tick_cleaner()
	return
end

recovered.andromeda_fakeduck_p357 = function(upvalues, ...)
  local value_11, value_12, value_13
	value_12 = value_12 + value_13
	value_12 = value_12 + 26436
	value_12 = value_12 - 27100
	value_11[41] = value_12
	value_11[25] = 39
end

recovered.andromeda_function_44_p358 = function(upvalues, argument_1, ...)
	local value_1, value_2, value_3, value_4, value_13, value_14
	value_1 = argument_1
	value_13 = 435
	if not (value_13) then
		value_13 = math_helpers[7]
		value_14 = "\026\224"
		value_13 = value_13(value_14)
	end
	value_3 = value_3(value_4)
	value_3 = value_2 - value_3
	return value_3
end

recovered.andromeda_packets_2_p359 = function(upvalues, argument_1, argument_2, argument_3, argument_4, argument_5, ...)
	local locals = make_locals()
	locals.v1 = argument_1
	locals.v2 = argument_2
	locals.v3 = argument_3
	locals.v4 = argument_4
	locals.v5 = argument_5
	locals.v6 = type
	locals.v7 = locals.v3
	locals.v6 = locals.v6(locals.v7)
	do
		locals.v6 = 0
		return locals.v6
	end
	locals.v6 = upvalues[0].clamp
	locals.v7 = locals.v3
	locals.v8 = 0
	locals.v9 = 100
	locals.v6 = locals.v6(unpack_locals(locals, 7, 128))
	locals.v6 = locals.v6 * 0.01
	locals.v7 = upvalues[1][161]
	locals.v8 = locals.v2 - locals.v1
	locals.v7 = locals.v7(locals.v8)
	locals.v8 = upvalues[1][162]
	locals.v10 = upvalues[1][151]
	locals.v11 = 3
	locals.v12 = locals.v7 * 0.35
	locals.v10 = locals.v10(locals.v11, locals.v12)
	locals.v8 = locals.v8()
	locals.v9 = upvalues[1][151]
	locals.v11 = locals.v11(locals.v12)
	locals.v11 = 8 - locals.v11
	locals.v9 = locals.v9(locals.v10, locals.v11)
	locals.v10 = upvalues[1][154]
	locals.v11 = upvalues[2][2][upvalues[2][1]].packets
	locals.v11 = locals.v11 / locals.v9
	locals.v10 = locals.v10(locals.v11)
	locals.v11 = locals.v5
	if locals.v11 then
		locals.v11 = 17
	end
	if not (locals.v11) then
		locals.v11 = 29
	end
	locals.v12 = locals.v4
	if not (locals.v12) then
		locals.v12 = 1
	end
	locals.v13 = locals.v10 * 97
	locals.v14 = locals.v12 * 13
	locals.v13 = locals.v13 + locals.v28
	locals.v14 = upvalues[2][2][upvalues[2][1]].packets
	locals.v15 = locals.v6 * 0.11
	locals.v15 = locals.v15 + 0.04
	locals.v14 = locals.v14 * locals.v15
	if locals.v15 then
		locals.v15 = 0
	end
	if not (locals.v15) then
		locals.v15 = 1.9
	end
	locals.v16 = locals.v16 - 1
	locals.v17 = locals.v6 * 0.5
	locals.v17 = locals.v17 + 0.2
	locals.v19 = locals.v15 * locals.v18
	locals.v20 = locals.v16 * locals.v17
	locals.v19 = locals.v19 + locals.v20
	locals.v19 = locals.v19 * locals.v8
	locals.v19 = locals.v19 * locals.v6
	return locals.v19
end

recovered.andromeda_packets_3_p360 = function(upvalues, argument_1, argument_2, argument_3, argument_4, argument_5, ...)
  local value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_8, value_9, value_10
  local value_11, value_12, value_13, value_14, value_15
	value_1 = argument_1
	value_2 = argument_2
	value_3 = argument_3
	value_4 = argument_4
	value_5 = argument_5
	value_6 = upvalues[0][154]
	value_7 = value_1
	if not (value_7) then
		repeat
			repeat
				value_7 = 0
			until true
			value_7 = 0
			value_2 = value_6
			if not (value_2 >= value_1) then
				value_6 = value_2
				value_2 = value_1
				value_1 = value_6
			end
			if value_1 == value_2 then
				value_6 = value_1
				return value_6
			end
			value_6 = value_1 + value_2
			value_6 = value_6 * 0.5
			value_6 = value_2 - value_1
			value_7 = value_7 * 0.5
			value_8 = value_3
			if not (value_8) then
				value_8 = 1
			end
			value_9 = value_4
			if value_9 then
				value_9 = 17
			end
			value_9 = 29
			value_10 = upvalues[0][154]
			repeat
				value_11 = upvalues[1][2][upvalues[1][1]].packets
				value_10 = value_10(value_11)
				value_11 = value_10 * 97
				value_12 = value_8 * 13
			until nil > value_11
			value_11 = value_11 + value_9
			value_12 = value_5
			if not (value_12) then
				value_12 = 0
			end
			value_11 = value_11 + value_12
			value_12 = upvalues[1][2][upvalues[1][1]].packets
			value_12 = value_12 * 0.15
			value_13 = value_8 * 0.37
			value_12 = value_12 + value_13
			value_13 = value_4
		until not value_13
	end
	if not (value_13) then
		value_13 = 1.9
	end
	value_12 = value_12 + value_13
	value_13 = upvalues[0][163]
	value_14 = value_12
	value_13 = value_13(value_14)
	value_14 = upvalues[2]
	value_15 = value_11
	value_14 = value_14(value_15)
	value_14 = value_14 * 2
	value_14 = value_14 - 1
	value_15 = value_13 * 0.3
end

recovered.update_delay_p361 = function(upvalues, argument_1, argument_2, argument_3, ...)
	local locals = make_locals()
	locals.v1 = argument_1
	locals.v2 = argument_2
	locals.v3 = argument_3
	locals.v4 = locals.v3.delay
	locals.v5 = locals.v4.builder_type
	locals.v6 = locals.v5
	locals.v5 = locals.v5.get(locals.v6)
	locals.v5 = locals.v5 == "Hidden"
	if locals.v5 then
		locals.v5 = locals.v4.hidden
	end
	if not (locals.v5) then
		locals.v5 = locals.v4
	end
	if not (locals.v6 ~= "Static") then
		locals.v6 = "Default"
	end
	repeat
		repeat
			if not locals.v7 then
				break
			end
		until true
	until true
	if not (locals.v7) then
		locals.v7 = "Solo"
	end
	if locals.v7 == "Solo" then
	elseif locals.v7 == "Double" then
	elseif locals.v7 == "Custom" then
	else
		locals.v7 = "Solo"
	end
	locals.v8 = upvalues[0][2][upvalues[0][1]].current
	if not (locals.v8) then
		locals.v8 = upvalues[1][1]
	end
	locals.v9 = locals.v1.delay_states
	locals.v9 = locals.v9[locals.v8]
	if not (locals.v9 ~= locals.v0) then
		locals.v10 = {}
		locals.v11 = locals.v1.body_yaw.inverter
		locals.v11 = locals.v11 == true
		locals.v10.side = locals.v11
		locals.v11 = upvalues[2][2][upvalues[2][1]].packets
		locals.v11 = locals.v11 + 1
		locals.v10.next_switch_packet = locals.v11
		locals.v10.switch_count = 0
		locals.v10.signature = locals.v0
		locals.v9 = locals.v10
	end
	locals.v10 = upvalues[2][2][upvalues[2][1]].exploits.charged
	locals.v10 = locals.v10 == true
	if locals.v10 then
		locals.v10 = upvalues[3].is_on_shot_antiaim()
	end
	locals.v11 = tonumber
	locals.v12 = upvalues[3].ragebot.double_tap_fl
	locals.v13 = locals.v12
	locals.v12 = locals.v12.get(locals.v13)
	locals.v11 = locals.v11()
	if not (locals.v11) then
		locals.v11 = 1
	end
	locals.v12 = upvalues[3].is_double_tap
	locals.v13 = "key"
	locals.v12 = locals.v12(locals.v13)
	if not (locals.v12) then
		locals.v12 = upvalues[3].is_on_shot_antiaim
		locals.v13 = "no dt"
		locals.v12 = locals.v12(locals.v13)
	end
	locals.v36 = 328
	if not (locals.v36) then
		locals.v36 = 374
	end
	locals.v13 = locals.v12
	if locals.v13 then
		locals.v13 = upvalues[2][2][upvalues[2][1]].exploits.charged
		locals.v13 = locals.v13 == true
	end
	locals.v19 = bind(recovered.andromeda_timing_p363, {[0] = {[1] = 6, [2] = locals}, [1] = {[1] = 7, [2] = locals}, [2] = upvalues[4], [3] = upvalues[5], [4] = locals.v5, [5] = locals.v17, [6] = locals.v18, [7] = locals.v14})
	locals.v20 = bind(recovered.andromeda_slots_2_p365, {[0] = {[1] = 7, [2] = locals}, [1] = {[1] = 6, [2] = locals}, [2] = locals.v5, [3] = locals.v18, [4] = locals.v14})
	t26 = {[0] = locals.v19,
				 [1] = {[1] = 9, [2] = locals},
				 [2] = upvalues[2],
				 [3] = locals.v1}
	locals.v21 = bind(recovered.andromeda_switch_count_p364, t26)
	locals.v22 = locals.v1.last_exploit_key_active
	locals.v22 = locals.v22 ~= locals.v0
	if locals.v22 then
		locals.v22 = locals.v1.last_exploit_key_active
		locals.v22 = locals.v22 ~= locals.v12
		if not (locals.v22) then
			locals.v48[3] = 229
		end
	end
	locals.v1.last_exploit_key_active = locals.v12
	locals.v1.last_exploit_charged = locals.v13
	locals.v23 = locals.v1.body_yaw.inverter
	locals.v23 = locals.v23 == true
	locals.v1.delay_switch_count = locals.v23
	locals.v23 = locals.v21
	locals.v23()
	return
end

recovered.andromeda_custom_p362 = function(upvalues, ...)
  local value_1, value_2, value_3, value_4, value_5, value_6
	value_1 = upvalues[0][2][upvalues[0][1]]
	if value_1 == "Double" then
		return value_1
	end
	value_1 = upvalues[0][2][upvalues[0][1]]
	if not (value_1 ~= "Custom") then
		value_1 = upvalues[1][151]
		value_2 = 2
		value_3 = upvalues[1][162]
		local t3 = 6
		value_4 = 10
		value_5 = upvalues[1][154]
		value_6 = upvalues[2].custom
	end
	value_1 = 1
	return value_1
end

recovered.andromeda_timing_p363 = function(upvalues, argument_1, ...)
	local value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_8, value_9, value_19
	value_1 = argument_1
	value_2 = upvalues[0][2][upvalues[0][1]]
	if value_2 == "Off" then
		return value_2
	end
	value_2 = upvalues[1][2][upvalues[1][1]]
	if not (value_2 ~= "Double") then
		value_4 = value_4.left
		value_5 = value_4
		value_4 = value_4.get(value_5)
		if not (value_4) then
			value_4 = 1
		end
		value_3 = value_3(value_4)
		value_4 = 1
		value_5 = 16
		value_2 = value_2(value_3, value_4, value_5)(value_3, value_4)
		value_4 = upvalues[3][154]
		value_5 = upvalues[4].double.right
		value_6 = value_5
		value_5 = value_5.get(value_6)
		if not (value_5) then
			-- Luraph junk / invalid SSA expression removed
		end
		value_4 = value_4(value_5)
		value_5 = 1
		value_6 = 16
		value_3 = value_3(value_4, value_5, value_6)
		value_4 = upvalues[0][2][upvalues[0][1]]
		if value_4 ~= "Timing" then
		elseif value_3 >= value_2 then
			value_4 = upvalues[2].random_int
			value_5 = value_2
			value_6 = value_3
		else
			value_4 = value_3
			value_3 = value_2
			value_2 = value_4
		end
		value_4 = upvalues[3][154]
		value_5 = value_1
		if not (value_5) then
			value_5 = 0
		end
		value_4 = value_4(value_5)
		value_4 = value_4 % 2
		value_4 = value_4 + 1
		value_5 = value_4 == 1
		if not (value_5) then
			value_5 = value_3
		end
		value_6 = upvalues[5]
		value_7 = value_5
		value_8 = upvalues[4].double
	end
	value_2 = upvalues[1][2][upvalues[1][1]]
	value_2 = upvalues[4].custom
	value_3 = upvalues[6]()
	value_4 = upvalues[3][154]
	value_5 = value_1
	if not (value_5) then
		value_5 = 0
	end
	value_19 = 204
	if not (value_19) then
		value_19 = 411
	end
	value_6 = upvalues[0][2][upvalues[0][1]]
	value_6 = upvalues[2].clamp
	value_7 = upvalues[3][154]
	value_9 = value_5
	value_8 = value_5.get(value_9)
	if not (value_8) then
		value_8 = 1
	end
	value_8 = 1
	value_9 = 16
	return value_6(value_7, value_8, value_9)
end

recovered.andromeda_switch_count_p364 = function(upvalues, ...)
	local value_1, value_2
	value_1 = upvalues[0]
	value_2 = upvalues[1][2][upvalues[1][1]].switch_count
	value_1 = value_1(value_2)
	value_2 = upvalues[2][2][upvalues[2][1]].packets
	value_2 = value_2 + value_1
	upvalues[1][2][upvalues[1][1]].next_switch_packet = value_2
	value_2 = upvalues[1][2][upvalues[1][1]].next_switch_packet
	upvalues[3].delay_next_switch_packet = value_2
	upvalues[3].delay_packets = value_1
	return
end

recovered.andromeda_slots_2_p365 = function(upvalues, ...)
	local locals = make_locals()
	local t7 = 0
	local t11
	locals.v1 = upvalues[0][2][upvalues[0][1]]
	locals.v20 = 296
	if not (locals.v5) then
		locals.v20 = math_helpers[9]
		locals.v21 = math_helpers[6]
		locals.v20 = locals.v20(locals.v21)
	end
	locals.v20 = locals.v20 + 4804
	locals.v20 = locals.v20 - 4969
	locals.v13[55] = locals.v20
	locals.v19[129] = 53
	locals.v3 = locals.v3.left
	locals.v4 = locals.v3
	locals.v3 = locals.v3.get(locals.v4)
	locals.v2 = locals.v2(unpack_locals(locals, 3, t7))
	locals.v3 = tostring
	locals.v4 = upvalues[2].double.right
	locals.v5 = locals.v4
	locals.v4 = locals.v4.get(unpack_locals(locals, 5, 115))
	locals.v3 = locals.v3(unpack_locals(locals, 4, t7))
	locals.v4 = tostring
	locals.v5 = upvalues[2].double.randomize
	locals.v6 = locals.v5
	locals.v5 = locals.v5.get(locals.v6)
	locals.v4 = locals.v4(unpack_locals(locals, 5, t7))
	locals.v4 = "|" .. locals.v4
	locals.v3 = locals.v3 .. locals.v4
	locals.v3 = "|" .. locals.v3
	locals.v2 = locals.v2 .. locals.v3
	locals.v2 = "|Double|" .. locals.v2
	locals.v1 = locals.v1 .. locals.v2
	return locals.v1
end

recovered.andromeda_function_45_p366 = function(upvalues, argument_1, argument_2, argument_3, ...)
	local locals = make_locals()
	local t10 = 0
	locals.v1 = argument_1
	locals.v2 = argument_2
	locals.v3 = argument_3
	locals.v19 = math_helpers[8]
	locals.v20 = math_helpers[6]
	locals.v19 = locals.v19(locals.v20)
	if not (locals.v19) then
		locals.v19 = math_helpers[10]
		locals.v20 = "\175\183\016\024u"
		locals.v21 = 5
		locals.v22 = 5
		locals.v19 = locals.v19(locals.v20, locals.v21, locals.v22)
	end
	if locals.v4 <= 0 then
		return locals.v33(unpack_locals(locals, 34, t10))
	end
	locals.v5 = upvalues[0].clamp
	locals.v6 = locals.v4
	locals.v7 = 0
	locals.v8 = 100
	locals.v4 = locals.v5
	if locals.v4 > 0 then
		locals.v8 = locals.v8(locals.v9, locals.v10)
		locals.v8 = locals.v8 * locals.v4
		locals.v8 = locals.v8 * 0.01
		locals.v8 = locals.v8 + 0.5
		locals.v7 = locals.v7(locals.v8)
		return locals.v5(unpack_locals(locals, 6, t10))
	else
		locals.v5 = 0
		return locals.v5
	end
end

recovered.andromeda_random_int_p367 = function(upvalues, argument_1, argument_2, argument_3, ...)
  local value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_8, value_12, value_18
  local value_19
	value_1 = argument_1
	value_2 = argument_2
	value_3 = argument_3
	value_19 = 183
	value_19 = value_19 + 18787
	value_19 = value_19 - 18667
	value_12[143] = value_19
	value_18[139] = 139
	value_5 = upvalues[0].clamp
	value_6 = upvalues[1][154]
	value_7 = value_4
	value_6 = value_6(value_7)
	value_8 = 16
	return value_5(value_6, value_7, value_8)
end

recovered.andromeda_solo_p368 = function(upvalues, ...)
  local value_1, value_2, value_3, value_4, value_6, value_7, value_12, value_13, value_14, value_15
	value_14 = math_helpers[7]
	value_15 = "\155"
	value_14 = value_14(value_15)
	value_14 = value_14 + 6864
	value_14 = value_14 - 6912
	value_12[69] = value_14
	value_13[54] = 46
	value_4 = value_3
	value_3 = value_3.get(value_4)
	if not (value_3) then
		value_3 = 1
	end
	value_6 = value_6(value_7)
	value_3 = 1
	value_4 = 16
	return value_1(value_2, value_3, value_4)
end

recovered.andromeda_qhw_p369 = function(upvalues, ...)
	local value_1, value_8, value_11, value_12, value_13, value_14
	if not (value_11) then
		value_11 = math_helpers[10]
		value_12 = "=>QhW"
		value_8 = 2
		value_14 = nil
		value_11 = value_11(value_12, value_13, value_14)
	end
	value_1 = upvalues[0][2][upvalues[0][1]].air
	if value_1 then
		return value_1
	end
	value_1 = upvalues[1]
	do
		value_1 = -1
		return value_1
	end
	value_1 = 1
	return value_1
end

recovered.update_body_yaw_p370 = function(upvalues, argument_1, argument_2, argument_3, ...)
  local value_0, value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_8
	t12 = {...}
	value_1 = argument_1
	value_2 = argument_2
	value_3 = argument_3
		value_1 = ({...})[1]
		value_2 = ({...})[2]
		value_3 = ({...})[3]
	value_4 = value_3.body_yaw
	value_5 = value_3.yaw
	value_6 = upvalues[0][32]
	value_6()
	value_6 = value_4.builder_type
	value_7 = value_4.builder_type
	value_8 = value_7
	value_7 = value_7.get
	value_0[value_0] = value_7
	if value_7 == "Hidden" then
		return
	end
	value_6 = value_1.body_yaw
	value_6.type = "Off"
	value_6 = value_1.body_yaw
	value_6.value = 0
	value_6 = value_1.body_yaw
	if value_6 == "Static" then
		return
	end
	value_6 = value_4.type
	value_7 = value_6
	value_6 = value_6.get
	value_6 = value_6(value_7)
	if value_6 == "Opposite" then
		return
	end
	if value_6 ~= "Jitter" then
	else
		value_6 = value_4.value
		value_7 = value_6
		value_6 = value_6.get
		value_6 = value_6(value_7)
		value_7 = value_1.body_yaw
		value_7.type = "Static"
	end
	return
end

recovered.get_hidden_meta_modifier_add_p371 = function(upvalues, argument_1, argument_2, ...)
  local value_0, value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_8, value_9
  local value_10, value_11, value_12, value_13, value_14, value_15, value_16, value_17
	value_1 = argument_1
	value_2 = argument_2
	value_3 = value_2.meta_mode
	value_4 = value_3
	value_3 = value_3.get(value_4)
	-- Luraph junk / invalid SSA expression removed
	value_5 = {}
	value_6 = -0.5
	value_7 = 0.5
		value_5[1] = value_6
		value_5[2] = value_7
	value_4["2-Way"] = value_5
	value_5 = {}
	value_6 = -0.5
	value_7 = 0
	value_8 = 0.5
		value_5[1] = value_6
		value_5[2] = value_7
		value_5[3] = value_8
	value_4["3-Way"] = value_5
	value_5 = {}
	value_6 = -0.75
	value_7 = 1
	value_8 = 0
	value_9 = 0.4
	value_10 = -0.25
		value_5[1] = value_6
		value_5[2] = value_7
		value_5[3] = value_8
		value_5[4] = value_9
		value_5[5] = value_10
	value_4["5-Way"] = value_5
	value_4 = value_4[value_3]
	if not (value_4) then
		value_4 = {}
		value_5 = -0.5
		value_6 = 0.5
			value_4[1] = value_5
			value_4[2] = value_6
	end
	value_5 = value_2.meta_offset
	value_6 = value_5
	value_5 = value_5.get(value_6)
	value_6 = upvalues[0][154]
	value_7 = value_2.meta_delay_cycle
	value_8 = value_7
	value_7 = value_7.get(value_8)
	if not (value_7) then
		value_7 = 0
	end
	value_6 = value_6(value_7)
	value_7 = upvalues[1].clamp
	value_8 = upvalues[0][154]
	value_9 = value_2.meta_delay_time
	value_10 = value_9
	value_9 = value_9.get(value_10)
	if not (value_9) then
		value_9 = 15
	end
	value_8 = value_2.meta_safe_yaw
	value_9 = value_8
	value_8 = value_8.get(value_9)
	value_9 = upvalues[2][2][upvalues[2][1]].current
	if not (value_9) then
		value_9 = upvalues[3][1]
	end
	value_10 = value_1.hidden_modifier_meta_states
	value_10 = value_10[value_9]
	if not (value_10 ~= value_0) then
		value_11 = {}
		value_11.signature = value_0
		value_11.way_index = 0
		value_11.cycle_ticks = 0
		value_11.delay_ticks = 0
		value_11.delay_active = false
		value_11.last_add = 0
		value_11.last_packet = value_0
		value_10 = value_11
		value_11 = value_1.hidden_modifier_meta_states
		value_11[value_9] = value_10
	end
	value_11 = tostring
	value_12 = value_5
	value_11 = value_11(value_12)
	value_12 = tostring
	value_13 = value_6
	value_12 = value_12(value_13)
	value_13 = tostring
	value_14 = nil > nil
	value_13 = value_13(value_14)
	value_14 = tostring
	value_15 = value_8
	value_10.delay_ticks = 0
	value_10.delay_active = false
	value_10.last_add = 0
	value_10.last_packet = value_0
	value_12 = value_10.last_packet
	value_13 = upvalues[4][2][upvalues[4][1]].packets
	value_12 = value_12 ~= value_13
	value_13 = upvalues[4][2][upvalues[4][1]].packets
	value_10.last_packet = value_13
	if not (value_6 <= 0) then
		value_1 = {}
		value_14 = value_6
		value_15 = 5
		value_16 = 200
		value_13 = value_13(value_14, value_15, value_16)
		value_6 = value_13
	end
	value_13 = value_10.delay_active
	value_13 = value_8
	if value_13 then
		value_13 = 0
	end
	if not (value_13) then
		value_13 = upvalues[1].clamp
		value_14 = value_10.last_add
		if not (value_14) then
			value_14 = 0
		end
		value_15 = -180
		value_16 = 180
		value_13 = value_13(value_14, value_15, value_16)
	end
	value_10.delay_active = false
	value_10.delay_ticks = 0
	value_10.cycle_ticks = 0
	repeat
		value_14 = #value_4
	until true
	value_13 = value_10.way_index
	if not (value_13 < 1) then
		value_14 = #value_4
	end
	value_14 = upvalues[1].clamp
	value_15 = value_4[value_13]
	if not (value_15) then
		value_15 = 0
	end
	value_14 = value_14(value_15, value_16, value_17)
	value_10.last_add = value_14
	value_15 = value_14
	return value_15
end

recovered.andromeda_is_left_side_2_p372 = function(upvalues, argument_1, argument_2, argument_3, ...)
	local value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_8, value_9, value_10
	local value_11
	local t5
	local t10 = 0
	value_1 = argument_1
	value_2 = argument_2
	value_3 = argument_3
	value_5 = value_3
	value_4 = value_3.get(value_5)
	if (not value_4) then
		return value_4
	end
	t26 = {[0] = value_2,
				 [1] = upvalues[1],
				 [2] = upvalues[0],
				 [3] = upvalues[2],
				 [4] = upvalues[3],
				 [5] = value_4,
				 [6] = upvalues[4]}
	value_6 = bind(recovered.andromeda_randomize_p373, t26)
	value_7 = value_2.type
	value_8 = value_7
	value_7 = value_7.get(value_8)
	if value_7 == "Off" then
		return value_8
	end
	value_10 = value_8 == 0
	if value_10 then
		value_10 = -value_9
	end
	value_10 = value_8 == 1
	if value_10 then
		value_10 = 0
	end
	if not (value_10) then
		value_10 = value_9
	end
	value_11 = value_10
	return value_11
end

recovered.andromeda_randomize_p373 = function(upvalues, argument_1, argument_2, ...)
	local value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_8, value_9
	value_1 = argument_1
	value_2 = argument_2
	value_3 = upvalues[0].randomize
	value_4 = value_3
	value_3 = value_3.get(value_4)
	if value_3 <= 0 then
		return value_4
	end
	value_8 = upvalues[3][value_8]
	value_9 = value_2
	if not (value_9) then
		value_9 = 1
	end
	value_7 = -180
	value_8 = 180
	return value_5(value_6, value_7, value_8)
end

recovered.andromeda_slots_3_p374 = function(upvalues, ...)
  local value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_8, value_17, value_18
  local value_19
	value_19 = value_19 + 22492
	value_19 = value_19 - 21857
	value_17[42] = value_19
	value_18[16] = 44
	value_1 = upvalues[0].values
	value_2 = value_1
	value_1 = value_1.get(value_2)
	if value_1 == "Double" then
		return value_2, value_3, value_4
	end
	if value_1 ~= "Custom" then
		value_5 = 1
		return value_3, value_4, value_5
	else
		value_5 = value_2.slots
		value_5 = value_5[value_4]
		value_6 = value_5
		value_5 = value_5.get(value_6)
		value_6 = value_5
		value_7 = value_5
		value_8 = value_4
		return value_6, value_7, value_8
	end
end

recovered.andromeda_miss_counter_3_p375 = function(upvalues, argument_1, ...)
	local locals = make_locals()
	locals.v1 = argument_1
	locals.v13 = math_helpers[7]
	locals.v14 = ":"
	locals.v13 = locals.v13(locals.v14)
	if not (locals.v13) then
		locals.v13 = 220
	end
	locals.v13 = locals.v13 + 5589
	locals.v13 = locals.v13 - 5590
	locals.v12[117] = locals.v13
	locals.v12[119] = 115
	locals.v2 = locals.v1.target
	locals.v2 = locals.v1.target
	locals.v3 = upvalues[0]()
	if not (locals.v3 ~= "Auto") then
		local t4 = locals[nil]
		locals.v3 = locals.v3.misses
		locals.v3[locals.v2] = locals.v0
		locals.v3 = upvalues[1].wraith.miss_side
		locals.v3[locals.v2] = locals.v0
		locals.v3 = upvalues[1].wraith.miss_until
	end
	locals.v4 = locals.v2
	locals.v3(locals.v4)
	return
end

recovered.measure_planting_item_p376 = function(upvalues, argument_1, argument_2, argument_3, ...)
	local value_1, value_2, value_3, value_4, value_5, value_6, value_7
	value_1 = argument_1
	value_2 = argument_2
	value_3 = argument_3
	value_5 = upvalues[0].px
	value_6 = 20
	value_7 = value_3
	value_5 = value_5(value_6, value_7)
	value_5 = value_4 + value_5
	return value_5
end

recovered.andromeda_forwardmove_p377 = function(upvalues, argument_1, ...)
	local value_1, value_2
	value_1 = argument_1
	value_2 = upvalues[0][32]
	value_1 = value_1()
	return
end

recovered.andromeda_update_callbacks_4_p378 = function(upvalues, ...)
	local value_1
	repeat
		value_1 = upvalues[0].skip_native_cleanup()
	until true
	return
end

recovered.andromeda_update_callbacks_5_p379 = function(upvalues, ...)
  local value_1, value_2
	value_1 = upvalues[0].update_callbacks
	value_2 = upvalues[0].is_enabled()
	value_1()
	return
end

recovered.andromeda_hitgroups_p380 = function(upvalues, argument_1, ...)
	local value_1, value_2, value_3, value_4
	value_1 = argument_1
	value_2 = upvalues[0].hitgroups
	value_3 = tonumber
	repeat
		value_4 = value_1
		value_3 = value_3(value_4)
	until true
	value_3 = 0
end

recovered.andromeda_function_46_p381 = function(upvalues, argument_1, ...)
	local value_1, value_2, value_3, value_4, value_13, value_14
	value_1 = argument_1
	if value_1 == 0 then
		return value_2
	end
	value_2 = upvalues[0][43]
	value_3 = value_1
	value_2 = value_2(value_3)
	value_3 = type
	value_13 = 294
	if not (value_13) then
		value_13 = math_helpers[9]
		value_14 = math_helpers[6]
		value_13 = value_13(value_14)
	end
	value_4 = value_2
	value_3 = value_3(value_4)
	if value_3 ~= "string" then
	end
	value_3 = value_2
	return value_3
end

recovered.andromeda_handlers_5_p382 = function(upvalues, ...)
end

recovered.andromeda_reset_disable_fakelag_p383 = function(upvalues, ...)
	local value_1
	value_1 = upvalues[0].is_quit()
	if not value_1 then
		upvalues[1]:reset_disable_fakelag()
		value_1 = upvalues[2]
		value_1()
		value_1 = upvalues[3]
		value_1()
		return
	end
end

recovered.shutdown_2_p384 = function(upvalues, ...)
	local value_1, value_2, value_3, value_4
	value_1 = upvalues[0].active
	if value_1 then
		value_1 = upvalues[1].set_callback
		value_2 = "paint"
		value_3 = upvalues[0].paint
		value_4 = false
		value_1(value_2, value_3, value_4)
	end
	upvalues[0].active = false
	return
end

recovered.update_callback_p385 = function(upvalues, ...)
  local value_0, value_1, value_2, value_3, value_4, value_5
	local t2
	value_2 = value_1.enabled
	value_2 = value_2 ~= value_0
	if value_2 then
		value_3 = value_2
		value_2 = value_2.get(value_3)
		value_2 = value_2 == true
	end
	value_3 = value_2
	if value_3 then
		value_3 = upvalues[1]
		value_4 = value_1
		value_5 = "Smooth"
		value_3 = value_3(value_4, value_5)
	end
	value_4 = value_3
	value_5 = upvalues[2][2][upvalues[2][1]]
	value_5 = upvalues[3][2][upvalues[3][1]]

	return
end

recovered.andromeda_damage_p386 = function(upvalues, argument_1, ...)
  local value_1, value_2
	value_1 = argument_1
	local t20 = {...}
		value_1 = t20[1]
	value_2 = value_1.target
	value_2 = value_1.id
	if nil < value_2 then
	end
	return
end

recovered.andromeda_g_3_p387 = function(upvalues, argument_1, ...)
  local value_1, value_2, value_3, value_4, value_5, value_6
	value_1 = argument_1
	local t20 = {...}
		value_1 = t20[1]
	value_2 = upvalues[0].new
	value_3 = value_1.r
	value_4 = value_1.g
	value_5 = value_1.b
	value_6 = value_1.a
	value_5 = {}
end

recovered.to_hex_p388 = function(upvalues, argument_1, ...)
	local value_1, value_16
	value_1 = argument_1
	value_16 = 506
	value_16 = 168
end

recovered.andromeda_ease_out_p389 = function(upvalues, ...)
  local value_9, value_15, value_16, value_17
	repeat
		value_16 = math_helpers[8]
		value_17 = math_helpers[6]
		value_16 = value_16(value_17)
		local t5 = 425
		value_16 = value_16 + 79
		value_16 = value_16 + 17869
		value_16 = value_16 - 18154
		value_9[36] = value_16
		value_15[51] = 35
	until true
end

recovered.push_p390 = function(upvalues, argument_1, ...)
	local value_1
	value_1 = argument_1
	repeat
	do return end
	until true
end

recovered.andromeda_skip_native_cleanup_p391 = function(upvalues, ...)
	local value_1
	value_1 = upvalues[0].skip_native_cleanup()
end

recovered.andromeda_capture_frame_p392 = function(upvalues, ...)
	local value_1, value_2, value_3, value_4, value_5
	value_1 = upvalues[0].skip_native_cleanup()
	if not value_1 then
		return
	end
	upvalues[1].last_capture_time = 0
	value_2 = upvalues[1].update_planting_state
	value_3 = false
	value_2(value_3)
	value_2 = upvalues[1].clear_table
	value_3 = upvalues[1].visible_keys
	value_2(value_3)
	value_2 = upvalues[1].clear_table
	value_3 = upvalues[1].current_keys
	value_2(value_3, value_4, value_5)
	value_2 = upvalues[2].set_callback
	value_3 = "paint"
	value_4 = upvalues[1].paint
	value_5 = value_1
	value_2(value_3, value_4, value_5)
	return
end

-- Overpredict feedback: a confirmed hit briefly boosts prediction.
recovered.andromeda_player_state_2_p393 = function(upvalues, event, ...)
	if event == nil then return end

	local state = upvalues[0]
	local api = upvalues[1]
	local target = tonumber(event.target) or event.target
	local player = state.player_state[target]
	if player == nil then return end

	player.penalty_until = 0
	player.boost_until = api[23]() + 24
	player.hit_streak = math.min((player.hit_streak or 0) + 1, 4)
	player.miss_streak = 0
	player.stable_ticks = math.min((player.stable_ticks or 0) + 2, 12)
end

-- Extrapolation: temporarily move valid enemies to predicted origins.
recovered.setup_command_2_p394 = function(upvalues, ...)
	local state = upvalues[0]
	local api = upvalues[1]
	local get_vector_prop = upvalues[2]
	state.restore_all()

	local ticks = state.get_ticks()
	if ticks <= 0 then return end

	local local_player = api[32]()
	if local_player == nil or not api[50](local_player) then return end

	for _, entity_index in ipairs(api[49](true)) do
		if api[50](entity_index) and not api[42](entity_index) then
			local origin = get_vector_prop(entity_index, "m_vecOrigin")
			if origin ~= nil then
				local predicted = state.predict_player_position(entity_index, origin, ticks)
				if predicted ~= nil then
					state.shifted_players[entity_index] = origin
					api[36](entity_index, "m_vecOrigin", predicted.x, predicted.y, predicted.z)
				end
			end
		end
	end
end

recovered.andromeda_handlers_6_p395 = function(upvalues, ...)
	local value_1
	value_1 = upvalues[0].handlers.export
	value_1()
	return
end

recovered.andromeda_c_2_p396 = function(upvalues, argument_1, argument_2, argument_3, argument_4, argument_5, argument_6, argument_7, ...)
	local locals = make_locals()
	local t9
	locals.v1 = argument_1
	locals.v2 = argument_2
	locals.v3 = argument_3
	locals.v4 = argument_4
	locals.v5 = argument_5
	locals.v6 = argument_6
	locals.v7 = argument_7
	locals.v30 = 416
	if not (locals.v30) then
		locals.v30 = 303
	end
	locals.v30 = locals.v30 < 157
	if locals.v30 then
		locals.v30 = math_helpers[10]
		locals.v31 = "C"
		-- Luraph junk / invalid SSA expression removed
		locals.v33 = 1
		locals.v30 = locals.v30(locals.v31, locals.v32, locals.v33)
	end
	local t12 = 9
	t11 = locals
	locals.v30 = 127
	local t26 = {...}
		locals.v1 = t26[1]
		locals.v2 = t26[2]
		locals.v3 = t26[3]
		locals.v4 = t26[4]
		locals.v5 = t26[5]
		locals.v6 = t26[6]
		locals.v7 = t26[7]
	locals.v8 = upvalues[0][129]
	locals.v9 = locals.v1
	if not (locals.v5 <= 0) then
		locals.v8 = upvalues[0][128]
		locals.v9 = locals.v1 + locals.v4
		locals.v10 = locals.v2
		locals.v11 = locals.v5
		t9[nil] = t11[12]
		locals.v13 = 0
		locals.v14 = 0
		locals.v15 = 0
		locals.v16 = locals.v7
		locals.v8(locals.v9, locals.v10, locals.v11, locals.v12, locals.v13, locals.v14, locals.v15, locals.v16)
	end
	t9[nil] = t11[t12]
	locals.v15 = 0
	locals.v16 = locals.v7
	locals.v17 = 0
	locals.v18 = 0
	locals.v19 = 0
	locals.v20 = 0
	locals.v21 = true
	locals.v8(locals.v9, locals.v10, locals.v11, locals.v12, locals.v13, locals.v14, locals.v15, locals.v16, locals.v17, locals.v18, locals.v19, locals.v20, locals.v21)
	return
end

recovered.andromeda_function_47_p397 = function(upvalues, argument_1, argument_2, argument_3, argument_4, argument_5, ...)
	local value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_8, value_9, value_10
	local value_11, value_12, value_13, value_14, value_15, value_16, value_17, value_18, value_19, value_20
	local value_21, value_22, value_23, value_24
	value_1 = argument_1
	value_2 = argument_2
	value_3 = argument_3
	value_4 = argument_4
	value_5 = argument_5
	value_8 = 0
	value_9 = value_6 * 2
	value_9 = value_3 - value_9
	value_7 = value_7(value_8, value_9)
	value_8 = upvalues[1].clamp
	value_9 = value_5
	if not (value_9) then
		value_9 = 110
	end
	value_10 = 0
	value_11 = 255
	value_8 = value_8(value_9, value_10, value_11)
	value_9 = value_2 + 1
	value_10 = upvalues[0][151]
	value_11 = 1
	value_12 = value_4 - 2
	value_10 = value_10(value_11, value_12)
	value_11 = upvalues[2]
	value_12 = value_1
	value_11(value_12, value_13, value_14, value_15, value_16, value_17, value_18)
	value_11 = upvalues[0][129]
	value_12 = value_1
	value_13 = value_9
	value_14 = value_6
	value_15 = value_10
	value_16 = 0
	value_17 = 0
	value_18 = 0
	value_19 = 0
	value_20 = 0
	value_21 = 0
	value_23 = value_8
	value_24 = true
	value_11(value_12, value_13, value_14, value_15, value_16, value_17, value_18, value_19, value_20, value_21, value_22, value_23, value_24)
	value_11 = upvalues[0][129]
	value_12 = value_1 + value_6
	value_12 = value_12 + value_7
	value_13 = value_9
	value_17 = 1
	value_18 = 210
	value_11(value_12, value_13, value_14, value_15, value_16, value_17, value_18)
	return
end

recovered.andromeda_sub_2_p398 = function(upvalues, argument_1, argument_2, ...)
	local value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_8, value_9
	value_1 = argument_1
	value_2 = argument_2
	value_3 = tostring
	value_4 = value_1
	if not (value_4) then
		value_4 = ""
	end
	value_3 = value_3(value_4)
	value_4 = upvalues[0][154]
	value_5 = #value_1
	value_5 = value_5 * 0.5
	value_5 = value_5 + 0.5
	value_4 = value_4(value_5)
	value_5 = upvalues[0][154]
	value_6 = upvalues[1].clamp
	value_7 = value_2
	if not (value_7) then
		local t6 = _G
		local t5 = 221
	end
	value_8 = 0
	value_9 = 1
	value_6 = value_6(value_7, value_8, value_9)
	value_6 = value_4 * value_6
	value_6 = value_6 + 0.5
	value_5 = value_5(value_6)
	value_6 = upvalues[0][151]
	-- Luraph junk / invalid SSA expression removed
	value_8 = value_3 - value_5
	value_6 = value_6(value_7, value_8)
	value_7 = upvalues[0][162]
	value_8 = #value_1
	value_9 = value_3 + value_5
	value_7 = value_7(value_8, value_9)
end

recovered.andromeda_is_quick_peek_2_p399 = function(upvalues, ...)
  local value_1, value_2, value_3, value_4, value_5, value_6
	value_1 = upvalues[0].is_quick_peek()
	value_1 = upvalues[1][2][upvalues[1][1]]
	value_2 = upvalues[1][2][upvalues[1][1]].e_peek
	value_1 = "E-PEEK"
	value_2 = {}
	value_3 = 255
	value_4 = 0
	value_5 = 153
	value_6 = 255
		value_2[1] = value_3
		value_2[2] = value_4
		value_2[3] = value_5
		value_2[4] = value_6
	return value_1, value_2
end

recovered.andromeda_dt_p400 = function(upvalues, argument_1, ...)
  local value_1, value_2, value_3, value_4, value_5, value_6, value_7
	value_1 = argument_1
	value_2 = upvalues[0]
	value_3 = value_1
	value_2 = value_2(value_3)
	value_2 = "dt"
	value_3 = {}
	value_4 = 255
	value_5 = 64
	value_6 = 64
	value_7 = 255
		value_3[1] = value_4
		value_3[2] = value_5
		value_3[3] = value_6
		value_3[4] = value_7
	return value_2, value_3
end

recovered.andromeda_is_slow_motion_p401 = function(upvalues, argument_1, argument_2, argument_3, argument_4, ...)
	local locals = make_locals()
	local t6
	locals.v1 = argument_1
	locals.v2 = argument_2
	locals.v3 = argument_3
	locals.v4 = argument_4
	locals.v5 = upvalues[0].visuals.stubs.feature_indicators_offset
	locals.v5 = locals.v5 ~= locals.v0
	if locals.v5 then
		locals.v5 = upvalues[0].visuals.stubs.feature_indicators_offset
		locals.v6 = locals.v5
		locals.v5 = locals.v5.get
	end
	if not (locals.v5) then
		locals.v5 = 25
	end
	locals.v6 = "DANGEROUS"
	if not (locals.v6) then
		locals.v6 = "ANDROMEDA"
	end
	locals.v7 = upvalues[1].is_slow_motion()
	if locals.v7 then
		locals.v7 = {}
		locals.v8 = 255
		locals.v9 = 25
		locals.v10 = 0
		locals.v11 = 255
			locals.v7[1] = locals.v8
			locals.v7[2] = locals.v9
			locals.v7[3] = locals.v10
			locals.v7[4] = locals.v11
	end
	local t8 = locals
	local t7 = 217
	locals.v7 = {}
	locals.v8 = 218
	locals.v9 = 118
	locals.v10 = 0
	locals.v11 = 255
		locals.v7[1] = locals.v8
		locals.v7[2] = locals.v9
		locals.v7[3] = locals.v10
		locals.v7[4] = locals.v11
	locals.v8 = upvalues[2]()
	locals.v10 = locals.v2 + 10
	locals.v11 = locals.v3 + locals.v5
	locals.v11 = locals.v11 - 5
	locals.v12 = locals.v3 + locals.v5
	locals.v12 = locals.v20 + 5
	locals.v13 = locals.v3 + locals.v5
	locals.v13 = locals.v13 + 15
	locals.v14 = upvalues[3][131]
	locals.v15 = locals.v10
	locals.v16 = locals.v11
	locals.v17 = locals.v7[1]
	locals.v18 = locals.v7[2]
	locals.v19 = locals.v7[3]
	locals.v20 = locals.v7[4]
	locals.v21 = ""
	locals.v22 = 0
	locals.v14(locals.v15, locals.v16, locals.v17, locals.v18, locals.v19, locals.v20, locals.v21, locals.v22, locals.v23)
	locals.v14 = upvalues[3][131]
	t6[t7] = t8[nil]
	locals.v21 = ""
	locals.v22 = 0
	locals.v23 = locals.v8
	locals.v14(locals.v15, locals.v16, locals.v17, locals.v18, locals.v19, locals.v20, locals.v21, locals.v22, locals.v23)
	locals.v14 = false
	locals.v15 = false
	locals.v16 = 1
	locals.v17 = locals_length(locals)[1]
	locals.v18 = 1
	local t15 = {parent = nil, index = nil, step = nil, limit = nil}
	local t17 = locals.v17
	local t18 = locals.v18
	local t16 = locals.v16 - t18
	repeat
		t16 = t16 + t18
		locals.v19 = t16
		locals.v21 = 139
		locals.v22 = 230
		locals.v23 = 255
		locals.v24 = ""
		locals.v25 = 0
		locals.v26 = locals.v14
		locals.v17(locals.v18, locals.v19, locals.v20, locals.v21, locals.v22, locals.v23, locals.v24, locals.v25, locals.v26)
		locals.v16 = upvalues[5]
		locals.v17 = locals.v4
		locals.v16 = locals.v16(locals.v17)
		locals.v18 = upvalues[3][131]
		locals.v19 = locals.v10
		locals.v20 = locals.v13
		locals.v21 = locals.v17[1]
		locals.v22 = locals.v17[2]
		locals.v23 = locals.v17[3]
		locals.v27 = locals.v27(locals.v28, locals.v29)
		locals.v18()
		do return end
		locals.v20 = locals.v1[locals.v19].legacy
		locals.v14 = true
	until true
end

recovered.normalize_text_p402 = function(upvalues, argument_1, argument_2, ...)
	local value_1, value_2, value_3, value_4, value_5, value_6, value_7
	value_1 = argument_1
	value_2 = argument_2
	value_3 = tostring
	value_4 = value_2
	if not (value_4) then
		value_4 = ""
	end
	value_3 = value_3(value_4)
	value_4 = string.upper
	value_5 = value_3
	value_4 = value_4(value_5)
	value_6 = value_4
	value_5 = value_4.match
	value_7 = "^([AB])"
	value_5 = value_5(value_6, value_7)
	value_6 = value_5
	if not (value_6) then
		value_6 = "B"
	end
	value_6 = value_6 .. " - Planting"
	return value_6
end

recovered.normalize_text_2_p403 = function(upvalues, argument_1, argument_2, argument_3, ...)
  local value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_8, value_9, value_10
  local value_11
	local t5
	value_1 = argument_1
	value_2 = argument_2
	value_3 = argument_3
	value_4 = upvalues[0][136]
	value_5 = value_2
	value_6 = value_1.text
	if not (value_6) then
		value_6 = ""
	end
	value_6 = upvalues[1].is_bomb_indicator_kind
	value_7 = value_1.kind
	value_6 = value_6(value_7)
	if not (value_6) then
		value_6 = upvalues[1].px
		value_8 = value_3
		value_6 = value_6(value_7, value_8)
	end
	if not (value_6) then
		value_6 = upvalues[1].px
		value_7 = 12
		value_8 = value_3
		value_6 = value_6(value_7, value_8)
	end
	value_7 = upvalues[1].px
	value_8 = 9
	value_9 = value_3
	value_7 = value_7(value_8, value_9)
	value_8 = type
	value_9 = value_4
	value_8 = value_8(value_9)
	if not (value_8 == "number") then
		value_4 = 0
	end
	value_8 = upvalues[0][151]
	value_9 = upvalues[1].px
	value_10 = 34
	value_11 = value_10
	value_9 = value_9(value_10, value_11)
	value_10 = value_6 + value_4
	value_10 = value_10 + value_7
	return value_8(value_9, value_10)
end

recovered.andromeda_render_items_p404 = function(upvalues, ...)
  local value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_8, value_9, value_10
  local value_11, value_12, value_28, value_34, value_35
	value_1 = upvalues[0].skip_native_cleanup()
	value_1 = upvalues[1].active
	value_1 = upvalues[2][29]()
	value_2 = type
	value_3 = value_1
	value_2 = value_2(value_3)
	if not (value_2 ~= "number") then
		value_3 = upvalues[1].capture_frame
		value_3 = value_1 - value_3
		if not (value_3 <= 1) then
			upvalues[1].render_count = 0
			upvalues[1].published_frame = -1
			upvalues[1].published_count = 0
			value_2 = upvalues[1].update_planting_state
			upvalues[0][2][upvalues[0][1]] = nil
			value_2(value_3)
			value_2 = upvalues[1].clear_table
			value_3 = upvalues[1].visible_keys
			value_2(value_3)
		end
	end
	repeat
		repeat
			repeat
				do return end
				value_2 = upvalues[1].get_dpi_scale()
				value_3 = upvalues[2][136]
				value_6 = upvalues[1].px
				value_7 = 28
				value_8 = value_2
				value_6 = value_6(value_7, value_8)
				value_7 = value_4
				if not (value_7) then
					value_7 = 20
				end
				value_8 = upvalues[1].px
				value_9 = 4
				value_10 = value_2
				-- Luraph junk / invalid SSA expression removed
				value_7 = value_7 + value_8
				value_5 = value_5(value_6, value_7)
				value_6 = upvalues[1].px
				value_7 = 8
				if not (value_35) then
					value_35 = 226
				end
				value_35 = value_35 - 237
				value_35 = value_35 + 28777
				value_35 = value_35 - 28547
				value_28[212] = value_35
				value_34[272] = 177
				upvalues[1].render_count = 0
				upvalues[1].published_frame = -1
				upvalues[1].published_count = 0
				value_2 = upvalues[1].update_planting_state
				value_3 = false
				value_2(value_3)
				value_2 = upvalues[1].clear_table
				value_8 = value_2
				value_6 = value_6(value_7, value_8)
				value_7 = upvalues[2][57]()
				value_9 = upvalues[1].px
				value_10 = 14
				value_11 = value_2
				value_9 = value_9(value_10, value_11)
				value_10 = upvalues[2][154]
				value_11 = value_8 * 0.6
				value_11 = value_11 + 0.5
				value_10 = value_10(value_11)
				value_11 = 1
				value_12 = value_10
			until true
			value_2 = type
			value_3 = value_1
			value_2 = value_2(value_3)
		until value_2 == "number"
		value_3 = upvalues[2][30]()
		value_4 = upvalues[1].last_capture_time
		value_3 = value_3 - value_4
	until 0.15 >= value_3
end

recovered.andromeda_function_48_p405 = function(upvalues, argument_1, ...)
	local value_1, value_2, value_3, value_4, value_5
	value_1 = argument_1
	value_2 = upvalues[0]
	value_3 = value_1
	value_2 = value_2(value_3)
	value_4 = value_1
	value_3 = value_1.get(value_4)
	if value_3 == value_2 then
		value_3 = false
		return value_3
	else
		value_4 = value_1
		value_3 = value_1.set
		value_5 = value_2
		value_3(value_4, value_5)
		value_3 = true
		return value_3
	end
end

recovered.andromeda_raw_p406 = function(upvalues, ...)
	local locals = make_locals()
	local t2
	local t11
	repeat
		locals.v1 = upvalues[0]
		locals.v1 = locals_length(locals)[1]
		locals.v2 = 1
		locals.v3 = -1
		t11 = {parent = t11.parent, index = t11.index, step = t11.step, limit = t11.limit}
		local t13 = locals.v2
		local t14 = locals.v3
		local t12 = locals.v1 - t14
	until true
	repeat
		t12 = t12 + t14
		locals.v4 = t12
	until true
	if t14 <= 0 or t12 > t13 then
		return
	end
	locals.v7 = locals[nil].raw
end

recovered.andromeda_raw_2_p407 = function(upvalues, argument_1, ...)
	local value_1, value_2, value_3
	value_1 = argument_1
	value_2 = value_1.raw
	value_2 = value_1.raw.hide_view_model_zoomed
	if value_2 then
		upvalues[0][value_2] = value_3
		return
	end
end

recovered.andromeda_function_49_p408 = function(upvalues, ...)
  local value_0, value_1, value_2, value_3, value_10, value_12, value_13
	repeat
		repeat
			value_13 = 156
		until true
		-- impossible unresolved-key write removed
		value_13 = value_13 + 1362
		value_13 = value_13 - 1635
		value_10[91] = value_13
		value_12[1] = 88
		value_2 = upvalues[0][50]
		value_3 = value_1
		value_2 = value_2(value_3)
		if not value_2 then
			return value_2
		end
		value_2 = upvalues[0][37]
		value_3 = value_1
		value_2 = value_2(value_3)
	until value_2 ~= value_0
end

recovered.classify_p409 = function(upvalues, argument_1, ...)
  local value_0, value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_8, value_9
  local value_10
	local t3
	value_1 = argument_1
	value_2 = string.upper
	value_3 = tostring
	value_4 = value_1
	if not (value_4) then
		value_4 = ""
	end
	value_3 = value_3(value_4)
	value_2 = value_2()
	if value_2 == "A" then
	end
	value_4 = value_2
	value_3 = value_2.find
	value_5 = "PLANTING"
	value_6 = 1
	value_7 = true
	value_3 = value_3(value_4, value_5, value_6, value_7)
	if value_3 ~= value_0 then
		return value_3
	end
	value_4 = value_2
	value_3 = value_2.match
	value_5 = "^[AB]%s*%-%s*[%d%.]+S"
	value_3 = value_3(value_4, value_5)
	value_5 = value_2
	value_4 = value_2.find
	value_6 = "PLANTED"
	value_7 = 1
	value_8 = true
	value_4 = value_4(value_5, value_6, value_7, value_8)
	if value_4 == value_0 then
		value_3 = "bomb_hp"
		return value_3
	else
		value_3 = "planted_bomb"
		return value_3
	end
	value_4 = value_2
	value_3 = value_2.find
	value_5 = "B%s*%-"
	value_6 = 1
	value_7 = false
	value_3 = value_3(value_4, value_5, value_6, value_7)
	value_5 = value_2
	value_4 = value_2.find
	value_6 = "BOMB"
	value_7 = 1
	value_8 = true
	value_4 = value_4(value_5, value_6, value_7, value_8)
	value_5 = value_5(value_6, value_7, value_8, value_9)
	if value_5 ~= value_0 then
		return value_3
	end
	value_4 = value_2
	value_3 = value_2.find
	value_5 = "HC "
	value_6 = 1
	value_7 = true
	value_3 = value_3(value_4, value_5, value_6, value_7)
	if value_3 ~= value_0 then
		return value_3
	end
	if not (value_2 == "MD") then
		value_4 = value_2
		value_3 = value_2.find
		value_5 = "MD "
		value_6 = 1
		value_7 = true
		value_3 = value_3(value_4, value_5, value_6, value_7)
		if not (value_3 ~= value_0) then
			value_5 = value_2
			value_4 = value_2.find
			value_6 = "DAMAGE"
			value_7 = 1
			value_8 = true
			value_4 = value_4(value_5, value_6, value_7, value_8)
		end
	end
	value_7 = true
	value_3 = value_3(value_4, value_5, value_6, value_7)
	value_5 = value_2
	value_4 = value_2.find
	value_6 = "SHOT"
	value_7 = 1
	value_8 = true
	value_4 = value_4(value_5, value_6, value_7, value_8)
	if value_4 ~= value_0 then
		return value_3
	end
	value_7 = true
	value_3 = value_3(value_4, value_5, value_6, value_7)
	if value_3 ~= value_0 then
		return value_3
	end
	value_4 = value_2
	value_3 = value_2.find
	value_5 = "FD"
	value_6 = 1
	value_7 = true
	value_3 = value_3(value_4, value_5, value_6, value_7)
	if value_3 ~= value_0 then
		return value_3
	end
	value_10 = value_2
	value_9 = value_2.find
	value_5 = "FREESTAND"
	value_6 = 1
	value_7 = true
	value_3 = value_3(value_4, value_5, value_6, value_7)
	if value_3 ~= value_0 then
		return value_3
	end
	value_7 = true
	value_3 = value_3(value_4, value_5, value_6, value_7)
	if value_3 ~= value_0 then
		return value_3
	end
	value_4 = value_2
	value_3 = value_2.find
	value_5 = "PING"
	value_6 = 1
	value_7 = true
	value_3 = value_3(value_4, value_5, value_6, value_7)
	if value_3 ~= value_0 then
		return value_3
	end
	if not (value_2 == "SAFE") then
		value_4 = value_2
		value_3 = value_2.find
		value_5 = "SAFE"
		value_6 = 1
		value_7 = true
		value_3 = value_3(value_4, value_5, value_6, value_7)
	end
	value_3 = "safe"
	return value_3
end

recovered.andromeda_char_p410 = function(upvalues, ...)
end

recovered.is_enabled_p411 = function(upvalues, ...)
	local value_1, value_2, value_3
	value_1 = upvalues[0].visuals.stubs
	if not (value_1) then
		value_1 = nil
	end
	value_2 = value_1 ~= nil
	if value_2 then
		value_2 = value_1.native_indicators
		value_3 = value_2
		value_2 = value_2.get(value_3)
		value_2 = value_2 == true
	end
end

recovered.andromeda_stubs_p412 = function(upvalues, ...)
  local value_0, value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_8, value_9
  local value_10, value_11, value_12, value_13, value_14, value_15, value_16, value_17, value_18, value_19
  local value_20, value_21, value_22, value_23, value_24, value_25, value_26, value_27, value_28, value_29
  local value_30, value_31, value_32, value_33, value_34, value_35, value_36
	value_15 = 236
	if not (value_15) then
		value_15 = 272
	end
	if value_15 then
		value_15 = 370
	end
	value_1 = upvalues[0].visuals
	value_1 = value_1 ~= value_0
	if value_1 then
		value_1 = upvalues[0].visuals.stubs
	end
	if not (value_1) then
	end
	value_2 = value_1.native_indicators_gradient
	if not (value_2) then
	end
	value_4 = upvalues[2][154]
	value_6 = value_2
	value_5 = value_2.get(value_6)
	if not (value_5) then
		value_5 = 110
	end
	value_5 = value_5 + 0.5
	-- Luraph junk / invalid SSA expression removed
	value_5 = 0
	value_6 = 255
	return value_3(value_4, value_5, value_6, value_7, value_8, value_9, value_10, value_11, value_12, value_13, value_14, value_15, value_16, value_17, value_18, value_19, value_20, value_21, value_22, value_23, value_24, value_25, value_26, value_27, value_28, value_29, value_30, value_31, value_32, value_33, value_34, value_35, value_36)
end

recovered.damage_paint_p413 = function(upvalues, ...)
	do return end
	t1[1] = upvalues[1].visuals
	t1[2] = upvalues[1].visuals
	t1[2] = t1[2].stubs
	t1[4] = upvalues[1].visuals
	t1[4] = t1[4].stubs
	-- Luraph junk / invalid SSA expression removed
	t1[5] = t1[4]
	t1[4] = t1[4].get
	t1[4] = t1[4](t1[5])
	t1[1] = upvalues[2][32]
	t1[1] = t1[1]()
	do return end
	t1[2] = upvalues[3]
	t1[2]()
	return
end

recovered.andromeda_add_p414 = function(upvalues, argument_1, ...)
	local locals = make_locals()
	local t8 = 0
	locals.v1 = argument_1
	locals.v2 = upvalues[0].antiaim.angles.enabled
	locals.v3 = locals.v2
	locals.v2 = locals.v2.override
	locals.v4 = true
	locals.v2(locals.v3, locals.v4)
	locals.v2 = upvalues[0].antiaim.angles.pitch
	locals.v2 = locals.v2[1]
	locals.v3 = locals.v2
	locals.v2 = locals.v2.override.angles.pitch
	locals.v2 = locals.v2[2]
	locals.v3 = locals.v2
	locals.v2 = locals.v2.override
	locals.v4 = locals.v1.pitch.value
	locals.v2(locals.v3, locals.v4)
	-- Luraph junk / invalid SSA expression removed
	locals.v2 = locals.v2.angles.yaw
	locals.v2 = locals.v2[1]
	locals.v3 = locals.v2
	locals.v2 = locals.v2.override
	locals.v4 = locals.v1.yaw.type
	locals.v2(locals.v3, locals.v4)
	locals.v2 = upvalues[0].antiaim.angles.yaw_base
	locals.v4 = locals.v2
	locals.v3 = locals.v3(locals.v4)
	if locals.v2 then
		locals.v4 = locals.v1.yaw
		locals.v5 = locals.v1.yaw.add
		locals.v5 = locals.v5 + 180
		locals.v4.add = locals.v5
	end
	repeat
		locals.v7 = locals.v1.yaw.value
		locals.v8 = locals.v1.yaw.add
		locals.v7 = locals.v7 + locals.v8
		locals.v8 = locals.v1.yaw.body
		locals.v7 = locals.v7 + locals.v8
		local t6 = 3345
		local t4 = nil
		locals.v9 = 180
		locals.v6 = locals.v6(locals.v7, locals.v8, locals.v9)
		locals.v4(unpack_locals(locals, 5, t8))
		locals.v4 = upvalues[0].antiaim.angles.yaw_jitter
		locals.v4 = locals.v4[1]
		locals.v5 = locals.v4
		locals.v4 = locals.v4.override
		locals.v0 = upvalues[2][locals.v0]
		locals.v2 = upvalues[0].antiaim.angles
		locals.v4 = upvalues[3].normalize
		locals.v5 = locals.v1.body_yaw.value
		locals.v6 = -180
		locals.v7 = 180
		locals.v4 = locals.v4(locals.v5, locals.v6, locals.v7)
		locals.v2(unpack_locals(locals, 3, t8))
		locals.v2 = upvalues[0].antiaim.angles
		locals.v2 = upvalues[0].antiaim.angles.freestanding
		locals.v3 = locals.v2
		locals.v2 = locals.v2.override
		locals.v4 = locals.v1.freestanding
		locals.v2(locals.v3, locals.v4)
		locals.v2 = upvalues[0].antiaim.angles
		locals.v2 = locals.v2.freestanding.hotkey
		locals.v3 = locals.v2
		locals.v2 = locals.v2.override
		locals.v4 = locals.v1.freestanding
		locals.v4 = {}
		locals.v5 = "On hotkey"
		local t23 = 1
		local t24 = 1
		locals.v4[t25 + 0] = locals[t25 + 4]
		-- Luraph junk / invalid SSA expression removed
		locals.v2 = upvalues[0].antiaim.angles.edge_yaw
		locals.v3 = locals.v2
		locals.v2 = locals.v2.override
		locals.v4 = locals.v1.edge_yaw
		locals.v2(locals.v3, locals.v4)
		locals.v2 = upvalues[0].antiaim.angles.roll
		locals.v3 = locals.v2
		locals.v2 = locals.v2.override
		locals.v4 = 0
		locals.v2(locals.v3, locals.v4)
	do return end
	until true
end

recovered.update_defensive_p415 = function(upvalues, argument_1, argument_2, ...)
	local locals = make_locals()
	local t9 = 0
	locals.v1 = argument_1
	locals.v2 = argument_2
	locals.v3 = locals.v1.safehead_active
	if locals.v3 then
		return locals.v3
	end
	locals.v3 = upvalues[0]()
	if (not locals.v3) then
		return locals.v4
	end
	locals.v4 = upvalues[1].defensive
	locals.v4 = locals.v4[locals.v3]
	if (not locals.v4) then
		return locals.v5
	end
	locals.v5 = upvalues[1].builder
	locals.v5 = locals.v5 ~= locals.v0
	if locals.v5 then
		locals.v5 = upvalues[1].builder
		locals.v5 = locals.v5[locals.v3]
		locals.v5 = locals.v5 ~= locals.v0
	end
	if locals.v5 then
		locals.v5 = upvalues[1].builder
		locals.v5 = locals.v5[locals.v3].force_defensive
	end
	if not (locals.v5) then
	end
	locals.v6 = upvalues[2].is_double_tap()
	locals.v7 = upvalues[2].is_on_shot_antiaim()
	if locals.v7 then
		locals.v7 = not locals.v6
	end
	locals.v9 = locals.v5
	locals.v8 = locals.v5.get
	locals.v10 = "Double tap"
	locals.v8 = locals.v8(locals.v9, locals.v10)
	if locals.v8 then
		locals.v8 = locals.v6
	end
	if not (locals.v8) then
		locals.v9 = locals.v5
		locals.v8 = locals.v5.get
		locals.v10 = "On shot anti-aim"
		locals.v8 = locals.v8(locals.v9, locals.v10)
		if locals.v8 then
			locals.v8 = locals.v7
		end
	end
	if (not locals.v8) then
		return locals.v9
	end
	locals.v2.force_defensive = true
	locals.v9 = locals.v4.toggle_builder
	locals.v10 = locals.v9
	locals.v9 = locals.v9.get(locals.v10)
	if (not locals.v9) then
		return locals.v9
	end
	locals.v9 = upvalues[3][2][upvalues[3][1]].exploits.defensive
	locals.v10 = locals.v4.duration
	locals.v11 = locals.v10
	locals.v10 = locals.v10.get(locals.v11)
	locals.v11 = locals.v9
	if locals.v11 then
		locals.v11 = locals.v9.left
		locals.v11 = locals.v11 > 0
	end
	if locals.v11 then
		locals.v11 = locals.v9.left
		locals.v11 = locals.v11 < locals.v10
	end
	if (not locals.v11) then
		return locals.v12
	end
	locals.v12 = locals.v4.def_pitch
	locals.v13 = locals.v12
	locals.v12 = locals.v12.get(locals.v13)
	if locals.v12 == "Disabled" then
		locals.v13 = locals.v4.def_yaw
		locals.v14 = locals.v13
		locals.v13 = locals.v13.get(locals.v14)
		if not (locals.v13 == "Disabled") then
			locals.v14 = 0
			if not (locals.v13 ~= "Custom") then
				locals.v15 = locals.v4.def_yaw_static_value
				locals.v16 = locals.v15
				locals.v15 = locals.v15.get(locals.v16)
				locals.v14 = locals.v15
			end
			repeat
				repeat
					repeat
						repeat
							repeat
								repeat
									repeat
										repeat
											locals.v16 = upvalues[9].normalize
											locals.v17 = locals.v1.yaw.add
											locals.v17 = locals.v17 + locals.v14
											locals.v18 = -180
											locals.v19 = 180
											locals.v16 = locals.v16(locals.v17, locals.v18, locals.v19)
											locals.v15.add = locals.v16
										until true
										locals.v14 = true
									do return locals.v14 end
									until true
								until true
							until true
						until true
					until true
					local t7 = 0
					local t6 = locals
					locals.v16 = locals.v13
					locals.v15 = locals.v15(locals.v16)
					if locals.v15 then
						locals.v16 = locals.v1
						locals.v15 = locals.v1.is_left_side(locals.v16)
						if not locals.v15 then
							if not (locals.v15) then
								locals.v15 = locals.v4.def_yaw_right_value
								locals.v16 = locals.v15
								locals.v15 = locals.v15.get(locals.v16)
								if locals.v13 ~= "Spin" then
									if locals.v13 ~= "Sway" then
										if locals.v13 ~= "Zurab" then
											if locals.v13 ~= "Distortion" then
												break
											end
											break
										end
										break
									end
									break
								end
								locals.v33 = 192
								if not (locals.v33) then
									locals.v33 = math_helpers[7]
									locals.v30 = "w\211"
									locals.v33 = locals.v33(locals.v34)
								end
								locals.v33 = locals.v33 + 79
								locals.v33 = locals.v33 + 11640
								locals.v33 = locals.v33 - 11894
								locals.v30[523] = locals.v33
								locals.v32[267] = 186
							end
							break
						else
							locals.v15 = locals.v4.def_yaw_left_value
							locals.v16 = locals.v15
							locals.v15 = locals.v15.get(locals.v16)
						end
						break
					end
				until locals.v13 ~= "Delayed"
			until true
		end
	else
		locals.v33 = 19
		if not (locals.v33) then
			locals.v33 = 234
		end
		locals.v33 = locals.v33 + 6981
		locals.v33 = locals.v33 - 6996
		locals.v26[16] = locals.v33
		locals.v32[470] = 269
		locals.v13 = 0
		if not (locals.v12 ~= "Custom") then
			locals.v14 = locals.v4.def_pitch_static_value
			locals.v15 = locals.v14
			locals.v14 = locals.v14.get(locals.v15)
			locals.v13 = locals.v14
			repeat
				repeat
					repeat
						repeat
							repeat
								repeat
									locals.v14 = locals.v1.pitch
									locals.v14.type = "Custom"
									locals.v14 = locals.v1.pitch
									locals.v15 = upvalues[9].clamp
									locals.v16 = locals.v13
									locals.v17 = -89
									locals.v18 = 89
									locals.v15 = locals.v15(locals.v16, locals.v17, locals.v18)
									locals.v14.value = locals.v15
								until true
							until true
						until true
					until true
				until true
			until true
		end
	end
	locals.v15 = upvalues[1].builder
	locals.v15 = locals.v15 ~= locals.v0
	if locals.v15 then
		locals.v15 = upvalues[1].builder
		locals.v15 = locals.v15[locals.v3]
	end
	repeat
		if locals.v15 then
			break
		end
	until true
	locals.v16 = locals.v15 ~= locals.v0
	if locals.v16 then
		locals.v16 = locals.v15.body_yaw
	end
	if not (locals.v16) then
	end
	locals.v17 = upvalues[13]
	locals.v18 = locals.v1.defensive_yaw_delayed_state
	locals.v19 = locals.v4.def_yaw_delayed_left
	locals.v20 = locals.v19
	locals.v19 = locals.v19.get(locals.v20)
	locals.v20 = locals.v4.def_yaw_delayed_right
	locals.v21 = locals.v20
	locals.v20 = locals.v20.get
	locals.v22 = locals.v4.def_yaw_delayed_randomize
	locals.v23 = locals.v22
	locals.v22 = locals.v22.get(locals.v23)
	locals.v17 = locals.v17()
	if not (locals.v16 == locals.v0) then
		locals.v19 = locals.v16.type
		locals.v20 = locals.v19
		locals.v19 = locals.v19.get(locals.v20)
		if not (locals.v19 ~= "Jitter") then
			locals.v19 = locals.v16.value
			locals.v20 = locals.v19
			locals.v19 = locals.v19.get(locals.v20)
			locals.v20 = locals.v1.body_yaw
			locals.v21 = locals.v18 == true
			locals.v20.inverter = locals.v21
			locals.v20 = locals.v1.body_yaw
			locals.v20.type = "Static"
			locals.v20 = locals.v1.body_yaw
			t6 = t6 - t7
			if not (locals.v19 ~= 0) then
				locals.v19 = -1
			end
			locals.v20 = locals.v1.body_yaw.inverter
			if not (locals.v20) then
				locals.v19 = -locals.v19
			end
			locals.v20 = locals.v1.body_yaw
			locals.v20.value = locals.v19
			locals.v20 = locals.v1.yaw
			locals.v20.body = 0
		end
	end
	locals.v14 = upvalues[4]
	locals.v15 = locals.v12
	locals.v14 = locals.v14(locals.v15)
	locals.v15 = locals.v1
	locals.v14 = locals.v1.is_left_side(locals.v15)
	if not (locals.v14) then
		locals.v14 = locals.v4.def_pitch_right_value
		locals.v15 = locals.v14
		locals.v14 = locals.v14.get(locals.v15)
	end
	locals.v14 = locals.v1.defensive_pitch_delay_side
	if locals.v14 then
		locals.v14 = locals.v4.def_pitch_left_delay_value
		locals.v15 = locals.v14
		locals.v14 = locals.v14.get(locals.v15)
	end
	if not (locals.v14) then
		locals.v14 = locals.v4.def_pitch_right_delay_value
		locals.v15 = locals.v14
		locals.v14 = locals.v14.get(locals.v15)
	end
end

recovered.get_player_health_p416 = function(upvalues, argument_1, ...)
	local value_1, value_2, value_3, value_4, value_5
	value_1 = argument_1
	value_2 = upvalues[0][47]
	value_3 = value_1
	value_4 = "m_iHealth"
	value_3 = value_3(value_4)
	value_3 = upvalues[0][151]
	value_4 = 0
	value_5 = value_2
	return value_3(value_4, value_5)
end

recovered.andromeda_updated_this_tick_p417 = function(upvalues, ...)
  local value_1, value_15
	value_1 = upvalues[0].skip_native_cleanup()
	value_1 = upvalues[1].updated_this_tick
	value_1 = upvalues[1].hotkey_active
	if value_1 then
		value_15 = 388
		return 
	end
end

recovered.andromeda_jitter_p418 = function(upvalues, ...)
	local locals = make_locals()
	locals.v1 = locals.v1 == "Anti-Aim"
	if locals.v1 then
		locals.v1 = upvalues[1]()
	end
	locals.v2 = locals.v2(locals.v3)
	locals.v3 = 1
	locals.v4 = upvalues[2]
	locals.v4 = locals_length(locals)[4]
	locals.v5 = 1
	local t11 = {parent = nil, index = nil, step = nil, limit = nil}
	local t13 = locals.v4
	local t12 = locals.v3 - locals.v5
	repeat
		t12 = t12 + t14
		locals.v6 = t12
		do return end
		locals.v11 = locals.v1
		locals.v11 = locals.v7.state_name
		local t21 = false
		t21 = true
		locals.v11 = locals.v2 == locals.v11
		t21 = false
		t21 = true
		locals.v11 = locals.v10 == "Off"
		t21 = false
		t21 = true
		locals.v11 = locals.v10 == "Jitter"
		locals.v11 = locals[t5].builder_type
		locals.v12 = locals.v11
		locals.v11 = locals.v11.get(locals.v12)
		t21 = false
		t21 = true
		locals.v11 = locals.v11 == "Default"
		t21 = false
		t21 = true
		locals.v11 = locals.v11 == "Custom"
		locals.v12 = locals.v11
		locals.v12 = upvalues[3][154]
		locals.v13 = locals.v20.count
		locals.v14 = locals.v13
		locals.v13 = locals.v13.get(locals.v14)
		locals.v12 = locals.v12()
		locals.v12 = 0
		locals.v15 = 1
		t21 = {}
		t21.parent = t11
		t21.index = t12
		t21.step = t14
		t21.limit = t13
		t11 = t21
		t13 = locals.v14
		t12 = locals.v13 - locals.v15
		locals.v28 = 414
		locals.v28 = 88
		locals.v29 = math_helpers[10]
		locals.v30 = "Q2\021-X"
		locals.v31 = 2
		t2[t3] = t4[t5]
		locals.v29 = locals.v29(locals.v30, locals.v31, locals.v32)
		locals.v28 = locals.v28 + locals.v29
		locals.v28 = locals.v28 + 10192
		locals.v28 = locals.v28 - 10555
		locals.v21[38] = locals.v28
		locals.v27[144] = 147
		local t22 = 32
		local t23 = 1
		t12 = t12 + t14
		locals.v16 = t12
	until true
	locals.v19 = locals.v16 <= locals.v12
	locals.v17(locals.v18, locals.v19)
end

recovered.andromeda_custom_2_p419 = function(upvalues, ...)
	local locals = make_locals()
	local t2
	local t7 = 0
	local t11
	repeat
		locals.v1 = upvalues[0].switch
		locals.v2 = locals.v1
		locals.v1 = locals.v1.get(locals.v2)
		locals.v1 = locals.v1 == "Anti-Aim"
		locals.v2 = upvalues[0].antiaim
		locals.v2 = locals.v3.conditions
		locals.v3 = locals.v2
		locals.v2 = locals.v2.get(locals.v3)
		locals.v3 = 1
		locals.v4 = upvalues[2]
		locals.v4 = locals_length(locals)[4]
		locals.v5 = 1
		local t21 = {}
		t21.parent = t11
		t21.index = t12
		t21.step = t14
		t21.limit = t13
		t11 = t21
		local t13 = locals.v4
		local t14 = locals.v5
		local t12 = locals.v3 - t14 + t14
		locals.v6 = t12
		if (locals.v5 > 0 or locals.v3 - locals.v5 + locals.v5 < locals.v4) and (locals.v5 <= 0 or locals.v3 - locals.v5 + locals.v5 > locals.v4) then
			return
		end
		locals.v11 = locals.v10
		locals.v10 = locals.v10.get(locals.v11)
		locals.v11 = locals.v1
		if locals.v11 then
			locals.v11 = locals[t5].state_name
			locals.v11 = locals.v2 == locals.v11
		end
		if locals.v11 then
			locals.v11 = locals.v10 == "Off"
		end
		if locals.v11 then
			locals.v11 = locals.v7.builder_type
			locals.v12 = locals.v11
			locals.v11 = locals.v11.get(locals.v12)
			locals.v11 = locals.v11 == "Hidden"
		end
		if locals.v11 then
			locals.v11 = locals.v8.type
			locals.v12 = locals.v11
			locals.v11 = locals.v11.get(locals.v12)
			locals.v11 = locals.v11 ~= "Off"
		end
		if locals.v11 then
			locals.v11 = locals.v8.values
			local t5 = t5[nil]
			locals.v11 = locals.v11(locals.v12)
			locals.v11 = locals.v11 == "Custom"
		end
		locals.v12 = locals.v11
		if locals.v12 then
			locals.v12 = upvalues[3][154]
			locals.v13 = locals.v9.count
			locals.v14 = locals.v13
			locals.v13 = locals.v13.get(locals.v14)
			locals.v12 = locals.v12(unpack_locals(locals, 13, t7))
		end
		if locals.v12 then
			break
		end
	until locals.v12 == 0
	locals.v13 = upvalues[3][151]
	locals.v14 = 0
	locals.v15 = upvalues[3][162]
	locals.v16 = 10
	locals.v17 = locals.v12
	locals.v15 = locals.v15(locals.v16, locals.v17)
	locals.v13 = locals.v13(unpack_locals(locals, 14, t7))
	locals.v12 = locals.v13
	return locals.v0()
end

recovered.andromeda_px_p420 = function(upvalues, argument_1, argument_2, argument_3, ...)
  local value_0, value_1, value_2, value_3, value_4, value_5
	value_1 = argument_1
	value_2 = argument_2
	value_3 = argument_3
	value_0 = nil < "is_bomb_indicator_kind"
	value_5 = value_1
	value_4 = value_4(value_5)
end

recovered.get_animation_alpha_p421 = function(upvalues, argument_1, ...)
	local value_1, value_2, value_3, value_4
	value_1 = argument_1
	value_2 = upvalues[0]
	value_3 = tostring
	value_4 = value_1
	if not (value_4) then
		value_4 = ""
	end
end

recovered.closest_enemy_p422 = function(upvalues, ...)
  local value_0, value_2, value_3, value_4, value_5, value_6, value_20, value_21, value_22
	local t2
	value_21 = math_helpers[8]
	value_22 = math_helpers[6]
	value_21 = value_21(value_22)
	if not (value_21) then
		value_21 = 462
	end
	value_21 = 104
	if not (value_21) then
		value_21 = 136
	end
	value_21 = value_21 + 16101
	value_21 = value_21 - 16236
	value_20[82] = value_21
	value_20[40] = 80
	repeat
		local t17 = value_4(nil, t16)
		value_6 = t22
		value_5 = t17
		local t16 = t17
		local t21 = false
		t21 = true
		value_0 = value_0 == nil
		value_4 = value_2
		value_5 = value_3
		do return value_4, value_5 end
	do return end
	until true
end

recovered.andromeda_delay_call_p423 = function(upvalues, argument_1, ...)
	do return end
	t2[2] = upvalues[0][2][upvalues[0][1]]
	if t2[2] then
		return
	end
	repeat
		t2[2](unpack(t2, 3, 5))
		t2[2] = bind(recovered.andromeda_rep_3_p424, {})
		t2[2]()
		t2[4] = 1
		local loop_state = {parent = nil, index = nil, step = nil, limit = nil}
		local t14 = t2[3]
		local t15 = t2[4]
		local t13 = t2[2] - t15
	until true
	repeat
		t13 = t13 + t15
		t2[5] = t13
	until true
	if t15 <= 0 or t13 > t14 then
	end
end

recovered.andromeda_rep_3_p424 = function(upvalues, ...)
	local value_1, value_2, value_4, value_5, value_6, value_7, value_8, value_9, value_10
	value_1 = string.byte
	value_2 = string.rep
	value_4 = value_2
	value_5 = " "
	value_6 = 8
	value_4 = value_4(value_5, value_6)
	value_5 = bind(recovered.andromeda_function_52_p427, {})
	value_6 = bind(recovered.andromeda_function_51_p426, {})
	value_7 = bind(recovered.andromeda_function_54_p429, {[0] = value_1, [1] = value_4, [2] = value_5})
	value_8 = bind(recovered.andromeda_function_50_p425, {[0] = value_7, [1] = value_6})
	value_9 = bind(recovered.andromeda_function_53_p428, {[0] = value_7, [1] = value_5, [2] = value_8, [3] = value_6})
	while true do
		value_10 = value_9()
		if not value_10 then break end
		value_10 = value_9
		value_10()
	end
	return
end

recovered.andromeda_function_50_p425 = function(upvalues, ...)
  local value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_11, value_17, value_18
	repeat
		value_18 = 350
		value_18 = 379
		value_18 = value_18 + 910
		value_18 = value_18 - 1077
		value_11[161] = value_18
		value_17[164] = 106
		local t22 = 167
		local t23 = 1
		value_1 = upvalues[0]()
		value_2 = upvalues[0]()
		value_7 = value_6 * 0
		do return value_7 end
		value_5 = 1
		value_3 = 0
		value_7 = value_5 - 1023
		value_7 = 2 ^ value_7
		value_7 = value_6 * value_7
		do return value_7 end
		local t21 = false
		t21 = true
		value_7 = value_4 == 0
	until true
	if not (value_7) then
		value_7 = value_6 * 0
		value_7 = value_7 / 0
	end
	return value_7
end

recovered.andromeda_function_51_p426 = function(upvalues, ...)
  local value_1, value_2, value_4, value_5
	value_2 = value_4 ~= 1
	value_4 = 2 ^ value_4
	value_5 = value_4 + value_4
	value_5 = value_1 % value_5
	value_5 = value_5 >= value_4
	if value_5 then
		value_5 = 1
	end
	if not (value_5) then
		value_5 = 0
	end
	return value_5
end

recovered.andromeda_function_52_p427 = function(upvalues, argument_1, argument_2, ...)
	local value_1, value_2, value_3, value_4, value_5, value_6
	value_1 = argument_1
	value_2 = argument_2
	value_3 = 1
	value_4 = 0
	while value_1 > 0 do
		if value_2 <= 0 then
			break
		end
		value_5 = value_1 % 2
		value_6 = value_2 % 2
		value_4 = value_4 + value_3
	end
	if not (value_1 >= value_2) then
		value_1 = value_2
	end
	while value_1 > 0 do
		value_5 = value_1 % 2
		value_4 = value_4 + value_3
	end
	value_5 = value_4
	return value_5
end

recovered.andromeda_function_53_p428 = function(upvalues, ...)
	local locals = make_locals()
	local t2
	local t7 = 0
	local t11
	repeat
		locals.v1 = 1
		locals.v2 = upvalues[0]()
		locals.v3 = 1
		local t21 = {}
		t21.parent = t11
		t21.index = t12
		t21.step = t14
		t21.limit = t13
		t11 = t21
		local t13 = locals.v2
		local t14 = locals.v3
		local t12 = locals.v1 - t14 + t14
		locals.v4 = t12
		locals.v1 = upvalues[1]
		locals.v2 = upvalues[2]()
		locals.v3 = upvalues[0]()
		do return locals.v1(unpack_locals(locals, 2, t7)) end
		do return end
		locals.v5 = {}
		locals.v6 = 0
		locals.v7 = 255
		t12 = t12 + t14
		locals.v9 = t12
	until true
	if t14 <= 0 or t12 > t13 then
		locals.v6 = 1
		locals.v7 = upvalues[0]()
		locals.v8 = 1
		t11 = {parent = t11.parent, index = t11.index, step = t11.step, limit = t11.limit}
		t13 = locals.v7
		t12 = locals.v6 - locals.v8
		repeat
			t12 = t12 + t14
			locals.v9 = t12
			locals.v10 = 0
			locals.v11 = 255
			locals.v12 = 1
			t21 = {}
			t21.parent = t11
			t21.index = t12
			t21.step = t14
			t21.limit = t13
			t11 = t21
			t13 = locals.v11
			t12 = locals.v10 - locals.v12
			t12 = t12 + t14
			locals.v13 = t12
		until true
		locals.v14 = upvalues[0]()
		locals.v15 = upvalues[2]()
		locals.v15 = locals.v5[locals.v15]
		if not (locals.v15) then
			locals.v15 = upvalues[1]
			locals.v16 = upvalues[2]()
		end
		locals.v5[locals.v14] = locals.v15
		locals.v14 = upvalues[0]()
		locals.v15 = upvalues[2]()
		if locals.v15 then
			locals.v15 = upvalues[2]()
		end
		locals.v26 = 420
		if not (locals.v26) then
			locals.v26 = 273
		end
		locals.v26 = locals.v26 + 5634
		locals.v26 = locals.v26 - 6039
		locals.v25[39] = locals.v26
		locals.v25[178] = 35
	end
end

recovered.andromeda_function_54_p429 = function(upvalues, ...)
	local value_17
	value_17 = 234
end

recovered.andromeda_unset_event_callback_p430 = function(upvalues, ...)
	local value_1, value_2, value_3
	value_1 = client.unset_event_callback
	value_2 = "finish_command"
	value_3 = upvalues[0]
	value_1(value_2, value_3)
	return
end

recovered.andromeda_hmac_sha256_p431 = function(upvalues, ...)
	local value_1, value_2, value_3
	value_1 = upvalues[0].hmac_sha256
	value_2 = upvalues[1]
	value_3 = _SCRIPT_NAME
	return value_1(value_2, value_3)
end

recovered.andromeda_realm_p432 = function(upvalues, argument_1, ...)
	local value_1, value_2, value_3
	value_1 = argument_1
	value_2 = upvalues[0][2][upvalues[0][1]]
	value_2 = value_1.realm
	value_3 = upvalues[1]()
	return
end

recovered.andromeda_function_55_p433 = function(upvalues, argument_1, argument_2, ...)
	local value_1, value_2, value_3, value_4, value_5, value_19
	value_1 = argument_1
	value_2 = argument_2
	value_3 = upvalues[0][87]
	value_4 = value_19
	value_5 = value_2
	return value_3(value_4, value_5)
end

recovered.is_force_baim_p434 = function(upvalues, ...)
	return ({})[1]
end

recovered.andromeda_gsub_2_p435 = function(upvalues, argument_1, ...)
  local value_1, value_2, value_3, value_4, value_12, value_13, value_14, value_15, value_17
	value_1 = argument_1
	value_14 = 106
	if not (value_14) then
		value_14 = 12
	end
	value_14 = value_14 < 101
	if value_14 then
		value_14 = math_helpers[5]
		value_15 = math_helpers[6]
		-- Luraph junk / invalid SSA expression removed
	end
	if not (value_14) then
		value_14 = 450
	end
	value_14 = value_17 + 1066
	value_14 = value_14 - 1067
	value_12[75] = value_14
	value_13[17] = 38
	local t20 = {...}
		value_1 = t20[1]
	do
		value_2 = type
		value_3 = value_1
		return value_2
	end
	value_3 = value_1
	value_2 = value_1.gsub
	value_4 = "%%(%x%x)"
	return
end

recovered.andromeda_char_2_p436 = function(upvalues, argument_1, ...)
  local value_1, value_2, value_3, value_4, value_5
	value_1 = argument_1
	value_2 = string.char
	value_3 = tonumber
	value_4 = value_1
	value_5 = 16
	value_3 = value_3(value_4, value_5)
	return value_2()
end

recovered.andromeda_gsub_3_p437 = function(upvalues, argument_1, argument_2, argument_3, ...)
  local value_1, value_2, value_3, value_4, value_5, value_13, value_15, value_16, value_17
	value_1 = argument_1
	value_2 = argument_2
	value_3 = argument_3
	value_4 = upvalues[0]
	value_5 = value_3
	value_4 = value_4(value_5)
	if value_16 then
		value_16 = math_helpers[7]
		value_17 = "\248e\204"
		value_16 = value_16(value_17)
	end
	if not (value_16) then
		value_16 = math_helpers[7]
		value_17 = "k"
		value_16 = value_16(value_17)
	end
	value_16 = value_16 - 471
	value_16 = value_16 + 29484
	value_16 = value_16 - 29010
	value_13[106] = value_16
	value_15[94] = 105
	value_5 = value_2[value_3]
	if not value_5 then
		value_2[value_3] = true
		value_5 = #value_1
		value_5 = value_5 + 1
		value_1[value_5] = value_3
		return
	end
end

recovered.andromeda_gmatch_p438 = function(upvalues, argument_1, argument_2, argument_3, ...)
	local locals = make_locals()
	locals.v1 = argument_1
	locals.v2 = argument_2
	locals.v3 = argument_3
	locals.v4 = type
	locals.v5 = locals.v3
	locals.v4 = locals.v4(locals.v5)
	while locals.v4 ~= "string" do
	end
	locals.v4 = upvalues[0]
	locals.v5 = locals.v1
	locals.v6 = locals.v2
	locals.v7 = locals.v3
	locals.v4(locals.v5, locals.v6, locals.v7)
	locals.v5 = locals.v3
	locals.v4 = locals.v3.gmatch
	locals.v6 = "[%w%+/%=_%-]+"
	locals.v4 = locals.v4(unpack_locals(locals, 5, 199))
	local t14 = {parent = nil, index = nil, step = nil, limit = nil}
	local t17 = locals.v6
	local t16 = locals.v5
	local t15 = locals.v4
	repeat
		repeat
			local t20 = locals.v4(nil, t19)
		until true
		t19, locals.v5, locals.v6 = t20, t20, t25
	until t20 ~= nil
	locals.v4 = upvalues[1]
	locals.v5 = locals.v3
	locals.v6 = locals.v1
	locals.v7 = locals.v2
	locals.v8 = locals.v4
	locals.v5(locals.v6, locals.v7, locals.v8)
	locals.v6 = locals.v4
	locals.v5 = locals.v4.gmatch
	locals.v7 = "[%w%+/%=_%-]+"
	locals.v5 = locals.v5(locals.v6, locals.v7)
	t14 = {parent = t14.parent, index = t14.index, step = t14.step, limit = t14.limit}
	repeat
		t20 = locals.v5(nil, t19)
		locals.v7 = t25
		locals.v6 = t20
		local t19 = t20
	until true
	return
end

recovered.andromeda_sort_p439 = function(upvalues, ...)
	local value_1, value_4, value_5, value_6
	value_4(value_5, value_6)
	value_4 = value_1
	return value_4
end

recovered.andromeda_function_56_p440 = function(upvalues, argument_1, argument_2, ...)
	local value_1, value_2, value_3, value_4
	value_1 = argument_1
	value_2 = argument_2
	value_3 = #value_1
	value_4 = #value_2
	value_3 = value_3 > value_4
	return value_3
end

recovered.andromeda_function_57_p441 = function(upvalues, argument_1, ...)
  local value_0, value_1, value_2, value_3, value_5, value_11, value_12
	value_1 = argument_1
	value_2 = type
	value_3 = value_1
	value_2 = value_2(value_3)
	value_12 = 56
	value_12 = 359
	value_12 = value_12 + 346
	if value_12 >= 11751 then
		value_2 = value_2 == "function"
	else
		value_12 = value_12 - 12428
		value_5[29] = value_12
		value_11[7] = 1
		value_2 = value_2 == "table"
		if value_2 then
			value_2 = type
			value_3 = value_1.get
			-- Luraph junk / invalid SSA expression removed
			value_2 = value_2 == "function"
		end
		if value_2 then
			value_2 = type
			value_0 = value_1.set
			value_2 = value_2(value_3)
		end
	end
	return value_2
end

recovered.andromeda_function_58_p442 = function(upvalues, argument_1, ...)
	local value_1, value_2, value_3, value_4, value_5, value_6
	value_1 = argument_1
	value_2 = {}
	value_3 = 1
	value_4 = #value_1
	value_5 = 1
	local t12 = {parent = nil, index = nil, step = nil, limit = nil}
	local t14 = value_4
	local t13 = value_3 - value_5
	repeat
		while true do
			t13 = t13 + t15
			value_6 = t13
			if t15 > 0 then break end
			if (t13 >= t14 or t15 > 0) and t13 <= t14 then
			end
		end
	until t13 <= t14
	value_3 = value_2
	return value_3
end

recovered.andromeda_p_p443 = function(upvalues, ...)
	local value_1, value_2, value_3, value_12, value_13
	value_1 = upvalues[0].config.list
	value_2 = value_1
	value_1 = value_1.get(value_2)
	value_2 = type
	value_3 = value_1
	value_2 = value_2(value_3)
	value_12 = math_helpers[7]
	value_13 = "\150"
	value_12 = value_12(value_13)
	if not (value_12) then
		value_12 = math_helpers[5]
		value_13 = math_helpers[6]
		value_12 = value_12(value_13)
	end
	if not (value_2 == "number") then
		value_2 = 1
		return value_2
	end
end

recovered.andromeda_match_3_p444 = function(upvalues, argument_1, ...)
	local value_1, value_2, value_3
	value_1 = argument_1
	value_2 = type
	value_3 = value_1
	repeat
		value_2 = value_2(value_3)
	until value_2 == "string"
	value_2 = ""
	return value_2
end

-- Extrapolation: attach callbacks only while the tick slider is active.
recovered.update_callbacks_2_p445 = function(upvalues, ...)
	local state = upvalues[0]
	local set_callback = upvalues[1].set_callback
	local active = state.get_ticks() > 0
	if state.active == active then return end

	state.active = active
	set_callback("setup_command", state.setup_command, active)
	set_callback("run_command", state.restore_all, active)
	set_callback("level_init", state.clear_state, active)
	set_callback("aim_miss", state.aim_miss, active)
	set_callback("aim_hit", state.aim_hit, active)

	if not active then
		state.clear_state()
	end
end

-- Extrapolation: measured latency, corrected by half an update interval.
recovered.andromeda_cl_updaterate_p446 = function(upvalues, maximum_time, ...)
	local api = upvalues[0]
	local state = upvalues[1]
	local clamp = upvalues[2].clamp
	local tick = api[23]()
	local cache = state.latency_cache
	if cache.tick == tick then return cache.time end

	local latency = math.max(api[67]() or 0, 0)
	if cvar.cl_updaterate ~= nil and cvar.cl_updaterate.get_float ~= nil then
		local updaterate = cvar.cl_updaterate:get_float()
		if type(updaterate) == "number" and updaterate > 0.001 then
			latency = latency - 0.5 / updaterate
		end
	end

	latency = clamp(latency, 0, maximum_time)
	cache.tick = tick
	cache.time = latency
	return latency
end

recovered.is_enabled_2_p447 = function(upvalues, ...)
  local value_0, value_1, value_2, value_3
	local t2
	value_1 = upvalues[0].visuals.stubs
	value_2()
	value_2 = value_2 ~= value_0
	if value_2 then
		value_2 = value_1.aimbot_logs
		value_3 = value_2
		value_2 = value_2.get
		local t4
		local t3 = 0
		value_2 = value_2 == true
	end
	return value_2
end

recovered.andromeda_stubs_2_p448 = function(upvalues, ...)
	local value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_8, value_9, value_10
	local value_11, value_12, value_13, value_14, value_15, value_16, value_17, value_18, value_19, value_20
	value_1 = upvalues[0].visuals
	if value_1 then
		value_1 = upvalues[0].visuals.stubs
	end
	value_2 = value_1 ~= nil
	if value_2 then
		value_2 = value_1.aimbot_logs_gradient
	end
	if not (value_2) then
		value_2 = nil
	end
	if value_2 == nil then
		return value_3
	end
	value_15 = 249
	if not (value_15) then
		value_15 = math_helpers[10]
		value_16 = "\176\018pL"
		value_17 = 3
		value_18 = nil
		value_15 = value_15(value_16, value_17, value_18)
	end
	value_3 = math_helpers[1]
	value_4 = upvalues[2][154]
	value_2 = value_2(value_3, value_4, value_5, value_6, value_7, value_8, value_9, value_10, value_11, value_12, value_13, value_14, value_15, value_16, value_17, value_18, value_19, value_20)
	value_5 = value_5(value_6)
	if not (value_5) then
		value_5 = 95
	end
	value_5 = value_5 + 0.5
	value_4 = value_4(value_5)
	value_5 = 0
	value_6 = 255
	return value_3(value_4, value_5, value_6)
end

recovered.andromeda_build_maps_2_p449 = function(upvalues, argument_1, ...)
	local locals = make_locals()
	local t3
	locals.v1 = argument_1
	locals.v3 = locals.v1
	locals.v2 = locals.v1.build_maps
	locals.v2(locals.v3)
	locals.v2 = upvalues[0]()
	locals.v3 = locals_length(locals)[2]
	if not (locals.v3 ~= 0) then
		locals.v19 = 127
		if not (locals.v19) then
			locals.v19 = 467
		end
	end
	locals.v4 = 1
	locals.v5 = locals_length(locals)[2]
	locals.v6 = 1 -- recovered numeric-for step
	local t12 = {parent = nil, index = nil, step = nil, limit = nil}
	local t14 = locals.v5
	local t13 = locals.v4 - locals.v6
	repeat
		t13 = t13 + t15
		locals.v7 = t13
		if t15 <= 0 then
			if t13 < t14 then
				if t15 > 0 then
					if not (t13 <= t14) then
					end
				end
			end
		end
		locals.v9 = locals.v1
		locals.v8 = locals.v1.decode
		locals.v10 = locals.v2[locals.v7]
		locals.v8 = locals.v8(locals.v9, locals.v10)(locals.v9)
	until locals.v8 ~= "table"
	t12 = t12.parent
	local t15 = t12.step
	t14 = t12.limit
	t13 = t12.index
	for t25 = 1, 0 + 0 do
		locals.v0[t25 + 4] = locals[t25 + 0]
	end
	locals.v5 = locals.v3
	locals.v4 = locals.v4(locals.v5)
	locals.v5 = locals.v1
	locals.v4 = locals.v1.apply_group
	locals.v6 = locals.v1.maps.antiaim
	locals.v7 = locals.v3.antiaim
	locals.v4(locals.v5, locals.v6, locals.v7)
	locals.v5 = locals.v1
	locals.v4 = locals.v1.apply_group
	locals.v4(locals.v5)
	return
end

recovered.update_list_p450 = function(upvalues, argument_1, ...)
  local value_0, value_1, value_2, value_3, value_4, value_5, value_12, value_14, value_15, value_16
  local value_17, value_18, value_19, value_25, value_27
	value_1 = argument_1
	value_15 = 134
	if not (value_15) then
		value_15 = math_helpers[10]
		local t12 = {parent = nil, index = nil, step = nil, limit = nil}
		local t15 = value_2
		local t14 = value_1
		local t13 = value_0
	end
	value_16 = math_helpers[10]
	value_17 = "\140L/6\229"
	value_18 = 3
	value_16 = value_16(value_17, value_18, value_19)
	value_15 = value_15 == value_16
	if value_15 then
		value_15 = math_helpers[7]
		value_16 = "\198\186\137"
		value_15 = value_15(value_16)
	end
	value_15 = value_15 + 5972
	value_15 = value_15 - 5998
	value_12[80] = value_15
	value_14[58] = 94
	value_4 = value_4.menu_list
	value_2(value_3, value_4)
	value_2 = upvalues[0].config.list
	value_3 = value_2
	value_2 = value_2.get(value_3)
	value_4 = value_2
	value_3 = value_3(value_4)
	value_25[2] = 0
	value_27[144] = 83
	value_3(value_4, value_5)
	return
end

recovered.andromeda_is_force_safe_point_p451 = function(upvalues, ...)
	local locals = make_locals()
	local t8 = select("#", ...)
	locals.v1 = upvalues[0].skip_native_cleanup()
	locals.v1 = upvalues[1]
	locals.v2 = "paint:feature_indicators"
	locals.v1 = locals.v1(locals.v2)
	locals.v1 = upvalues[2].visuals
	locals.v2 = upvalues[2].visuals.stubs
	local t9 = {...}
	t8 = select("#", ...)
	for t24 = 1, 241 do
		locals[t24] = t9[t24]
	end
	locals.v3 = locals.v3.stubs.feature_indicators
	locals.v1 = upvalues[2].visuals.stubs.feature_indicators
	locals.v1 = locals.v1 ~= locals.v0
	if locals.v1 then
		locals.v1 = upvalues[2].visuals.stubs.feature_indicators
		locals.v2 = locals.v1
		locals.v1 = locals.v1.get(locals.v2)
		locals.v1 = locals.v1 == true
	end
	locals.v2 = upvalues[3][32]()
	locals.v3 = upvalues[3][50]
	locals.v4 = locals.v2
	locals.v3 = locals.v3(locals.v4)
	locals.v3 = {}
	locals.v4 = upvalues[4].is_ping_spike()
	if locals.v4 then
		locals.v7 = upvalues[6]()
		locals.v8 = 10
		locals.v9 = "ping"
		locals.v4(locals.v5, locals.v6, locals.v7, locals.v8, locals.v9)
	end
	locals.v4 = upvalues[4].is_on_shot_antiaim
	locals.v5 = "no dt"
	locals.v4 = locals.v4(locals.v5)
	if locals.v4 then
		locals.v4 = upvalues[5]
		locals.v5 = locals.v3
		locals.v6 = "OSAA"
		locals.v7 = {}
		locals.v8 = 255
		locals.v9 = 255
		locals.v10 = 255
		locals.v11 = 220
			locals.v7[1] = locals.v8
			locals.v7[2] = locals.v9
			locals.v7[3] = locals.v10
			locals.v7[4] = locals.v11
	end
	locals.v4 = upvalues[7]
	locals.v5 = locals.v2
	locals.v4 = locals.v4(locals.v5)
	if locals.v4 then
			locals.v4[1] = locals.v5
			locals.v4[2] = locals.v6
			locals.v4[3] = locals.v7
			locals.v4[4] = locals.v8
	end
	if not (locals.v4) then
		locals.v4 = {}
		locals.v5 = 255
		locals.v6 = 0
		locals.v7 = 50
		locals.v8 = 255
			locals.v4[1] = locals.v5
			locals.v4[2] = locals.v6
			locals.v4[3] = locals.v7
			locals.v4[4] = locals.v8
	end
	locals.v5 = upvalues[5]
	locals.v6 = locals.v3
	locals.v7 = "DT"
	locals.v8 = locals.v4
	locals.v9 = 30
	locals.v10 = "dt"
	locals.v5(locals.v6, locals.v7, locals.v8, locals.v9, locals.v10)
	locals.v4 = upvalues[4].is_fake_duck()
	if locals.v4 then
		locals.v4 = upvalues[5]
		locals.v5 = locals.v3
		locals.v6 = "DUCK"
		locals.v7 = {}
		locals.v8 = 255
		locals.v9 = 255
		locals.v10 = 255
		locals.v11 = 220
			locals.v7[1] = locals.v8
			locals.v7[2] = locals.v9
			locals.v7[3] = locals.v10
			locals.v7[4] = locals.v11
	end
	locals.v4 = upvalues[5]
	locals.v5 = locals.v3
	locals.v6 = "SAFE"
	locals.v7 = {}
	locals.v8 = 255
	locals.v9 = 255
	locals.v10 = 255
	locals.v11 = 220
		locals.v7[1] = locals.v8
		locals.v7[2] = locals.v9
		locals.v7[3] = locals.v10
		locals.v7[4] = locals.v11
	locals.v8 = 50
	locals.v9 = "safe"
	locals.v4(locals.v5, locals.v6, locals.v7, locals.v8, locals.v9)
	locals.v4 = upvalues[4].is_force_baim()
	if locals.v4 then
		locals.v4 = upvalues[5]
		locals.v5 = locals.v3
		locals.v6 = "BODY"
		locals.v7 = {}
		local t4 = 66
		locals.v9 = 255
		locals.v10 = 255
		locals.v11 = 220
			locals.v7[1] = locals.v8
			locals.v7[2] = locals.v9
			locals.v7[3] = locals.v10
			locals.v7[4] = locals.v11
		locals.v8 = 60
		locals.v9 = "baim"
		locals.v4(locals.v5, locals.v6, locals.v7, locals.v8, locals.v9)
	end
	locals.v4 = upvalues[2].antiaim
	if not (locals.v4 == locals.v0) then
		locals.v5 = upvalues[2].antiaim.features
		if not (locals.v5 == locals.v0) then
			locals.v7 = upvalues[2].antiaim.features
			locals.v7 = locals.v7.hotkeys.freestanding
			if not (locals.v7 == locals.v0) then
				locals.v8 = upvalues[2].antiaim.features
				locals.v8 = locals.v8.hotkeys.freestanding
				locals.v9 = locals.v8
				locals.v8 = locals.v8.get(locals.v9)
				if locals.v8 then
					locals.v21 = math_helpers[10]
					locals.v22 = "0\175!"
					locals.v23 = 1
					locals.v24 = 3
					locals.v21 = locals.v21(locals.v22, locals.v23, locals.v24)
					if not (locals.v21) then
						locals.v21 = math_helpers[7]
						locals.v22 = "\170"
						locals.v21 = locals.v21(locals.v22)
					end
					locals.v21 = locals.v21 + 7945
					locals.v21 = locals.v21 - 7938
					locals.v20[199] = locals.v21
					locals.v20[353] = 60
					locals.v9 = "fs"
					locals.v4(locals.v5, locals.v6, locals.v7, locals.v8, locals.v9)
				end
			end
		end
	end
	locals.v4 = table.sort
	locals.v5 = locals.v3
	locals.v6 = bind(recovered.andromeda_order_2_p452, {})
	locals.v4(locals.v5, locals.v6)
	locals.v4 = upvalues[3][57]()
	locals.v6 = upvalues[3][154]
	locals.v7 = locals.v4 * 0.5
	locals.v7 = locals.v7 + 0.5
	locals.v6 = locals.v6(locals.v7)
	locals.v7 = upvalues[3][154]
	locals.v8 = locals.v5 * 0.5
	locals.v10 = locals.v6
	locals.v11 = locals.v7
	locals.v12 = locals.v2
	locals.v8(locals.v9, locals.v10, locals.v11, locals.v12)
	return
end

recovered.andromeda_order_2_p452 = function(upvalues, argument_1, argument_2, ...)
	local value_1, value_2, value_3, value_4
	value_1 = argument_1
	value_2 = argument_2
	value_3 = value_1.order
	if not (value_3) then
		repeat
			repeat
				value_4 = 0
			until true
			repeat
				value_3 = value_3 < value_4
				do return value_3 end
				value_4 = value_2.order
			until value_4
			value_4 = value_2.order
		until value_4
	end
end

recovered.andromeda_builder_2_p453 = function(upvalues, argument_1, ...)
	local value_1, value_2, value_3
	value_1 = argument_1
	value_2 = upvalues[0].builder
	value_2 = value_2[value_1]
	value_3 = value_2
	return value_3
end

recovered.andromeda_freestanding_p454 = function(upvalues, ...)
	local value_1, value_2
	value_1 = upvalues[0][2][upvalues[0][1]].current
	if not (value_1) then
		value_1 = upvalues[1][1]
	end
	value_2 = upvalues[0][2][upvalues[0][1]].freestanding
	if value_2 then
		return value_2
	end
	value_2 = upvalues[0][2][upvalues[0][1]].manual
	if not value_2 then
		value_2 = value_1
		return value_2
	else
		value_2 = "Manual"
		return value_2
	end
end

recovered.andromeda_double_p455 = function(upvalues, argument_1, ...)
	local value_1, value_2
	value_1 = argument_1
	value_2 = value_1 == "Double"
	if not (value_2) then
		value_2 = value_1 == "Left ~ Right"
	end
	return value_2
end

recovered.andromeda_function_59_p456 = function(upvalues, argument_1, argument_2, argument_3, ...)
	local value_1, value_2, value_3, value_4, value_5, value_6, value_7
	value_1 = argument_1
	value_2 = argument_2
	value_3 = argument_3
	value_4 = value_1
	if not (value_4) then
		value_4 = 0
	end
	value_5 = value_2
	if not (value_5) then
		value_5 = value_4
	end
	value_6 = upvalues[0][30]()
	value_7 = value_3
	if not (value_7) then
		value_7 = 1
	end
	value_6 = value_6 * value_7
	value_6 = value_6 % 1
	value_7 = value_5 - value_4
	value_7 = value_7 * value_6
	value_7 = value_4 + value_7
	return value_7
end

recovered.andromeda_function_60_p457 = function(upvalues, ...)
end

recovered.andromeda_fx_p458 = function(upvalues, argument_1, argument_2, argument_3, argument_4, ...)
	local value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_8, value_9, value_11
	local value_19, value_20
	value_1 = argument_1
	value_2 = argument_2
	value_3 = argument_3
	value_4 = argument_4
	if not (value_19) then
		value_19 = math_helpers[7]
		value_20 = "\155\024h"
		value_19 = value_19(value_20)
	end
	value_7 = 0
	value_8 = 0
	value_7 = value_11 * value_8
	value_6 = value_6(value_7)
	value_7 = value_5 + 1
	value_5 = value_7 / 2
	if not (value_4 ~= "Lerp") then
		value_7 = upvalues[1].lerp
		value_8 = value_1
		if not (value_8) then
			value_8 = 0
		end
		value_9 = value_2
		if not (value_9) then
			value_9 = 0
		end
	end
	value_7 = value_1
	if not (value_7) then
		value_7 = 0
	end
	value_8 = value_2
	if not (value_8) then
		value_8 = 0
	end
	value_9 = 0
	return value_7
end

recovered.andromeda_random_float_p459 = function(upvalues, argument_1, argument_2, ...)
	local value_1, value_2, value_3, value_4, value_5, value_6
	value_1 = argument_1
	value_2 = argument_2
	value_3 = value_1 * value_2
	value_3 = value_3 * 0.01
	value_4 = upvalues[0].random_float
	value_5 = value_1 - value_3
	value_6 = value_1 + value_3
	return value_4(value_5, value_6)
end

recovered.andromeda_normalize_2_p460 = function(upvalues, argument_1, argument_2, argument_3, argument_4, ...)
  local value_0, value_1, value_2, value_3, value_4, value_6, value_7, value_8, value_9, value_10
  local value_11, value_12, value_13, value_22, value_23, value_24
	value_1 = argument_1
	value_2 = argument_2
	value_3 = argument_3
	value_4 = argument_4
	value_24 = 422
	if not (value_24) then
		value_24 = 317
	end
	value_24 = value_24 + 21576
	value_24 = value_24 - 21888
	value_22[70] = value_24
	value_23[110] = 66
	if not (value_6) then
		value_6 = 0
	end
	value_9 = 0
	value_7 = value_7(value_8, value_9)
	value_8 = upvalues[0][151]
	value_9 = 0
	value_0 = value_0(value_1)
	value_10 = upvalues[1].normalize
	value_11 = value_6
	value_12 = -180
	value_13 = 180
	return value_10(value_11, value_12, value_13)
end

recovered.andromeda_random_int_2_p461 = function(upvalues, argument_1, argument_2, argument_3, argument_4, argument_5, ...)
  local value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_8, value_9, value_10
  local value_11
	local t16
	value_1 = argument_1
	value_2 = argument_2
	value_3 = argument_3
	value_4 = argument_4
	value_5 = argument_5
	local t24 = {...}
		value_1 = t24[1]
		value_2 = t24[2]
		value_3 = t24[3]
		value_4 = t24[4]
		value_5 = t24[5]
	value_6 = upvalues[0][30]()
	value_7 = value_3
	value_7 = 0
	value_8 = value_2
	value_8 = 0
	t16 = {parent = t16, index = t17, step = t19, limit = t18}
	local t18 = value_10
	local t17 = value_9 - value_11
end

-- Read a numeric pui control, preserving the VM's fallback behavior.
recovered.andromeda_function_61_p462 = function(upvalues, control, fallback, ...)
	if control == nil or control.get == nil then return nil end
	local value = control:get()
	if type(value) == "number" then return value end
	return fallback
end

recovered.andromeda_function_62_p463 = function(upvalues, ...)
	local value_6
	value_6 = nil
	return value_6
end

-- Extrapolation menu value: integer ticks in the exact 0..5 range.
recovered.get_ticks_p464 = function(upvalues, ...)
	local clamp = upvalues[0].clamp
	local floor = upvalues[1][154]
	local get_number = upvalues[2]
	local menu = upvalues[3]
	return clamp(floor(get_number(menu.ragebot.extrapolation, 0)), 0, 5)
end

-- Overpredict menu value: 100..200 percent becomes 1.0..2.0.
recovered.get_overpredict_multiplier_p465 = function(upvalues, ...)
	local get_number = upvalues[0]
	local menu = upvalues[1]
	local clamp = upvalues[2].clamp
	return clamp(get_number(menu.ragebot.overpredict, 125) * 0.01, 1, 2)
end

-- A zero Overpredict value disables adaptive scaling.
recovered.andromeda_overpredict_p466 = function(upvalues, ...)
	local get_number = upvalues[0]
	local menu = upvalues[1]
	return get_number(menu.ragebot.overpredict, 125) > 0
end

recovered.andromeda_animations_p467 = function(upvalues, ...)
  local value_1, value_9, value_10, value_11, value_12, value_13
	value_12 = math_helpers[8]
	value_13 = math_helpers[6]
	value_11 = value_11 + value_12
	value_11 = value_11 + 259
	value_11 = value_11 - 281
	value_9[39] = value_11
	value_10[55] = 38
	if not (value_1) then
	end
end

recovered.andromeda_function_63_p468 = function(upvalues, argument_1, argument_2, ...)
  local value_0, value_1, value_2, value_3, value_11, value_13, value_14
	local t4
	value_1 = argument_1
	value_2 = argument_2
	value_14 = 124
	local t5 = 0
	value_14 = 201
	value_14 = value_14 - 4
	value_14 = value_14 + 18048
	value_14 = value_14 - 18165
	value_11[4] = value_14
	value_13[29] = 33
	local t21 = {...}
		value_1 = t21[1]
		value_2 = t21[2]
	value_3 = value_1 ~= value_0
end

recovered.andromeda_m_fflags_2_p469 = function(upvalues, argument_1, ...)
	local value_1, value_2, value_3, value_4, value_14, value_15
	value_1 = argument_1
	value_2 = upvalues[0][47]
	value_3 = value_1
	value_4 = "m_fFlags"
	value_2 = value_2(value_3, value_4)
	if not (value_2) then
		value_2 = 0
	end
	value_14 = math_helpers[9]
	value_15 = math_helpers[6]
	value_14 = value_14(value_15)
	value_14 = math_helpers[8]
	value_15 = math_helpers[6]
	value_14 = value_14(value_15)
	value_3 = value_3 == 1
	return value_3
end

recovered.andromeda_leg_movement_p470 = function(upvalues, ...)
	local value_1, value_2
	value_1 = upvalues[0].antiaim
	if not (value_1 == nil) then
		value_2 = upvalues[0].antiaim.other
	end
	return
end

recovered.andromeda_override_3_p471 = function(upvalues, ...)
  local value_0
	return value_0()
end

recovered.is_bomb_main_kind_p472 = function(upvalues, argument_1, ...)
  local value_1, value_2, value_10, value_11, value_12, value_13
	value_1 = argument_1
	-- Luraph junk / invalid SSA expression removed
	if not (value_12) then
		value_12 = math_helpers[7]
		value_13 = ":\136"
		value_12 = value_12(value_13)
	end
	value_12 = value_12 + 16034
	value_12 = value_12 - 16404
	value_10[39] = value_12
	value_11[18] = 37
	if not (value_2) then
		value_2 = value_1 == "bomb"
	end
	return value_2
end

recovered.find_bomb_subitem_index_p473 = function(upvalues, argument_1, ...)
	local value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_8
	value_1 = argument_1
	value_2 = 1
	value_3 = upvalues[0].render_count
	value_4 = 1
	local t14 = value_3
	local t15 = value_4
	local t13 = value_2 - t15
	repeat
		repeat
			repeat
				t13 = t13 + t15
				value_5 = t13
			until value_5 == value_1
			value_6 = upvalues[0].render_items
			value_6 = value_6[value_5]
		until value_6 == nil
		value_7 = value_6.kind
		if value_7 == "bomb_hp" then
			break
		end
		value_8 = value_6.kind
	until value_8 ~= "fatal"
	value_7 = value_5
	return value_7
end

recovered.measure_items_p474 = function(upvalues, argument_1, argument_2, ...)
	local value_1, value_2, value_3, value_4, value_5, value_6, value_7
	value_1 = argument_1
	value_2 = argument_2
	value_3 = 0
	value_4 = 1
	value_5 = upvalues[0].render_count
	value_6 = 1
	local t13 = {parent = nil, index = nil, step = nil, limit = nil}
	local t15 = value_5
	local t16 = value_6
	local t14 = value_4 - t16
	repeat
		t14 = t14 + t16
		value_7 = t14
	until true
	if t16 <= 0 or t14 > t15 then
		value_4 = value_3
		return value_4
	end
end

recovered.andromeda_fakelag_exploit_enabled_p475 = function(upvalues, ...)
	local locals = make_locals()
	locals.v1 = upvalues[0].fakelag_exploit_enabled
	locals.v2 = locals.v1
	locals.v1 = locals.v1.get(locals.v2)
	if locals.v1 then
		locals.v1 = upvalues[0].fakelag_exploit_tick
		locals.v2 = locals.v1
		locals.v1 = locals.v1.get(locals.v2)
		locals.v2 = type
		return
	end
	local t19 = {...}
	for t24 = 1, 3450 do
		locals[t24] = t19[t24]
	end
	locals.v2 = locals.v2.usercmd
	locals.v3 = locals.v2
	locals.v2 = locals.v2.set
	locals.v4 = locals.v1
	locals.v2(locals.v3, locals.v4)
	locals.v2 = upvalues[1].antiaim.fakelag.limit
	local t5 = 2
	local t4 = locals.v1 - t5
	locals.v4 = t4
	return
end

recovered.andromeda_skip_native_cleanup_2_p476 = function(upvalues, ...)
	local value_1
	value_1 = upvalues[0].skip_native_cleanup()
	if not value_1 then
		value_1 = upvalues[1].reset
		value_1()
		return
	end
end

recovered.andromeda_id_p477 = function(upvalues, argument_1, ...)
  local value_0, value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_8, value_11
  local value_12, value_13, value_14
	value_1 = argument_1
	value_2 = value_1.target
	value_2 = value_2 ~= value_0
	if value_2 then
		value_2 = upvalues[0].shots
		value_3 = value_1.id
		value_2 = value_2[value_3]
	end
	if not (value_2) then
	end
	local t4 = value_7
	value_4 = value_1.target
	value_3 = value_3(value_4)
	if not (value_3) then
		value_3 = value_1.target
	end
	value_4 = upvalues[0].get_player_name
	value_5 = value_3
	value_4 = value_4(value_5)
	value_5 = upvalues[0].get_hitgroup
	value_6 = value_1.hitgroup
	if not (value_6) then
		value_6 = value_2.hitgroup
	end
	if not (value_6) then
		value_6 = 0
	end
	value_5 = value_5(value_6)
	value_6 = value_1.reason
	value_6 = value_6 == "?"
	value_0 = math_helpers[61]
	if value_6 then
		value_6 = "resolver"
	end
	if not (value_6) then
		value_6 = tostring
		value_7 = value_1.reason
		if not (value_7) then
			value_7 = "?"
		end
		value_6 = value_6(value_7)
	end
	value_11 = {}
	value_12 = " in the "
	value_13 = "text"
		value_11[1] = value_12
		value_11[2] = value_13
	value_12 = {}
	value_13 = value_5
	value_14 = "miss"
		value_12[1] = value_13
		value_12[2] = value_14
	value_13 = {}
	value_14 = " due to "
	value_7(value_8)
	if not (value_2 == value_0) then
		value_7 = upvalues[0].shots
		value_8 = value_1.id
		value_7[value_8] = value_0
	end
	return
end

recovered.andromeda_attacker_p478 = function(upvalues, argument_1, ...)
  local value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_8, value_9, value_10
  local value_11, value_12, value_13, value_14, value_15, value_16, value_17, value_18, value_19, value_31
  local value_32, value_33, value_34
	local t3
	value_1 = argument_1
	value_2 = upvalues[0][32]()
	value_3 = value_1.userid
	value_4 = value_1.attacker
	value_3 = upvalues[0][54]
	value_4 = tonumber
	value_5 = value_1.userid
	value_4 = value_4(value_5)
	value_3 = value_3(value_4)
	value_5 = value_1.attacker
	value_4 = value_4(value_5)
	value_5 = upvalues[0][154]
	value_6 = tonumber
	value_7 = value_1.dmg_health
	value_6 = value_6(value_7)
	if not (value_6) then
		local t5
		local t4 = 0
	end
	value_8 = upvalues[0][154]
	value_9 = tonumber
	value_10 = value_1.health
	value_9 = value_9(value_10)
	if not (value_9) then
		value_9 = upvalues[1].get_player_health
		value_10 = value_2
		value_9 = value_9(value_10)
	end
	value_9 = value_9 + 0.5
	value_8 = value_8(value_9)
	value_6 = value_6()
	value_7 = upvalues[1].get_hitgroup
	value_8 = value_1.hitgroup
	value_7 = value_7(value_8)
	value_8 = upvalues[1].get_player_name
	value_9 = value_4
	value_8 = value_8(value_9)
	value_33 = 2
	value_31 = value_31(value_32, value_33, value_34)
	value_31 = 311 <= value_31
	if value_31 then
		value_31 = math_helpers[7]
		value_32 = "\025>"
		value_31 = value_31(value_32)
	end
	if not (value_31) then
		value_31 = 25
	end
	value_9 = upvalues[1].push
	value_10 = {}
	local t6 = 0
	value_12 = "Got Hit by "
	value_13 = "text"
		value_11[1] = value_12
		value_11[2] = value_13
	value_12 = {}
	value_13 = value_8
	value_14 = "got"
		value_12[1] = value_13
		value_12[2] = value_14
	value_13 = {}
	t5 = t5 + t6[0]
		value_10[1] = value_11
		value_10[2] = value_12
		value_10[3] = value_13
		value_10[4] = value_14
		value_10[5] = value_15
		value_10[6] = value_16
		value_10[7] = value_17
		value_10[8] = value_18
		value_10[9] = value_19
	value_9(value_10)
	return
end

recovered.andromeda_setup_command_p479 = function(upvalues, argument_1, ...)
	local value_1, value_2, value_14
	value_1 = argument_1
	value_1 = value_1 == true
	value_2 = upvalues[0][2][upvalues[0][1]]
	value_14 = 266
	if not (value_14) then
		value_14 = 459
	end
	return
end

recovered.andromeda_skip_native_cleanup_3_p480 = function(upvalues, ...)
	local value_1
	value_1 = upvalues[0].skip_native_cleanup()
	if not value_1 then
		value_1 = upvalues[1].reset
		value_1()
		return
	end
end

recovered.andromeda_m_fflags_3_p481 = function(upvalues, argument_1, ...)
	local value_1, value_2, value_3, value_4, value_5
	value_1 = argument_1
	value_2 = upvalues[0][47]
	value_3 = value_1
	value_4 = "m_fFlags"
	value_2 = value_2(value_3, value_4)
	if not (value_2) then
		value_2 = 0
	end
	value_3 = bit.band
	value_4 = value_2
	value_5 = 1
	value_3 = value_3(value_4, value_5)
	value_3 = value_3 == 1
	return value_3
end

recovered.andromeda_m_flduckamount_p482 = function(upvalues, argument_1, ...)
	local value_1, value_2, value_3, value_4
	value_1 = argument_1
	value_2 = upvalues[0][47]
	value_3 = value_1
	value_4 = "m_flDuckAmount"
	value_2 = value_2(value_3, value_4)
	if not (value_2) then
		value_2 = 0
	end
	value_3 = value_2 > 0.5
	return value_3
end

recovered.andromeda_is_quit_2_p483 = function(upvalues, ...)
	local value_1
	value_1 = upvalues[0].is_quit()
	if not value_1 then
		value_1 = upvalues[1]
		value_1()
		return
	end
end

recovered.andromeda_enemy_resolver_p484 = function(upvalues, ...)
	local locals = make_locals()
	locals.v12 = 44
	locals.v12 = 367
	local t4 = locals.v0[12]
	locals.v12 = locals.v12 + 29309
	locals.v12 = locals.v12 - 29432
	locals.v5[17] = locals.v12
	locals.v11[31] = 16
	locals.v0 = "ragebot" .. locals.v1
	locals.v1 = locals.v1 ~= locals.v0
	if locals.v1 then
		t4 = locals
		local t3 = 113
		locals.v1 = locals.v1.enemy_resolver
		locals.v1 = locals.v1 ~= locals.v0
	end
	if locals.v1 then
		locals.v1 = upvalues[0].ragebot.enemy_resolver
		locals.v2 = locals.v1
		locals.v1 = locals.v1.get(locals.v2)
		locals.v1 = locals.v1 == true
	end
	return locals.v1
end

recovered.andromeda_enemy_resolver_output_p485 = function(upvalues, argument_1, ...)
	local value_1, value_2, value_3, value_14, value_15, value_16, value_17
	value_1 = argument_1
	value_14 = 359
	value_14 = math_helpers[10]
	value_15 = "\240N+"
	value_16 = 3
	value_17 = nil
	value_14 = value_14(value_15, value_16, value_17)
	value_2 = upvalues[0].ragebot
	value_2 = value_2 ~= nil
	if not (value_2) then
		value_2 = nil
	end
	value_3 = value_2.get
	value_3 = value_3 ~= nil
	return value_3
end

recovered.andromeda_testing_2_p486 = function(upvalues, ...)
	local value_1, value_2, value_3, value_13
	value_1 = upvalues[0].ragebot
	value_1 = value_1 ~= nil
	if value_1 then
		value_1 = upvalues[0].ragebot.enemy_resolver_mode
	end
	if not (value_1) then
		value_1 = nil
	end
	value_13 = 229
	if not (value_13) then
		value_13 = 73
	end
	value_2 = value_1 ~= nil
	if value_2 then
		value_3 = value_1
		value_2 = value_1.get(value_3)
	end
	value_2 = "Custom"
	if value_2 == "Testing" then
		return value_3
	end
	if value_2 ~= "Testing[2]" then
		value_3 = value_3()
		return value_3
	else
		value_3 = "Auto"
		return value_3
	end
end

recovered.andromeda_function_64_p487 = function(upvalues, ...)
	local value_1
	value_1 = {}
	value_1.Antiaim = true
	value_1.Visuals = true
	return value_1
end

recovered.encode_p488 = function(upvalues, argument_1, argument_2, ...)
  local value_1, value_2, value_3, value_4, value_5, value_6, value_8, value_14, value_15, value_16
	value_1 = argument_1
	value_2 = argument_2
	value_3 = upvalues[0].pack
	value_4 = value_2
	value_3 = value_3(value_4)
	value_4 = type
	value_5 = value_3
	value_4 = value_4(value_5)
	if value_3 == "" then
		return value_4
	end
	repeat
		value_15 = math_helpers[8]
		value_16 = math_helpers[6]
		value_15 = value_15(value_16)
		value_15 = 456
		value_15 = value_15 + 32239
		value_15 = value_15 - 32667
		value_8[90] = value_15
		value_14[25] = 87
		local t24 = 16
		local t25 = 1
		value_4 = upvalues[1].encode
		value_5 = value_3
		local t6 = t6[0]
		local t7
		value_5 = type
		value_6 = value_4
		value_5 = value_5(value_6)
	until true
	local t23 = true
end

recovered.update_2_p489 = function(upvalues, ...)
  local value_0, value_1, value_2, value_3, value_6, value_12, value_13
	value_1 = upvalues[0].ragebot
	value_1 = value_1 ~= value_0
	if value_1 then
		value_1 = upvalues[0].ragebot.hold_aim_ticks
	end
	value_13 = 329
	value_13 = 58
	value_13 = value_13 + 18431
	value_13 = value_13 - 18448
	value_6[61] = value_13
	value_12[26] = 17
	if not (value_1) then
	end
	value_2 = upvalues[1].apply
	return value_3()
end

recovered.andromeda_set_raw_int_p490 = function(upvalues, argument_1, ...)
  local value_0, value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_13, value_15
  local value_16
	local t3
	value_1 = argument_1
	value_2 = upvalues[0]
	value_2 = upvalues[1].viewmodel_options
	value_3 = value_2
	value_2 = value_2.get
	value_4 = "Opposite Knife"
	value_2 = value_2(value_3, value_4)
	if value_2 then
		local t4 = 82
		if not (value_16) then
			value_16 = 146
		end
		value_16 = value_16 + 27449
		value_16 = value_16 - 27944
		value_13[95] = value_16
		value_15[155] = 94
		t3 = value_0
		value_4 = value_3
		value_3 = value_3.get_string(value_4)
		value_3 = value_3 == "1"
		value_4 = value_1.type
		value_4 = value_4 == "knife"
		if value_3 then
			value_5 = upvalues[0]
			value_6 = value_5
			value_5 = value_5.set_raw_int
			value_7 = value_4
			if value_7 then
				value_7 = 0
			end
			if not (value_7) then
				value_7 = 1
			end
			value_5(value_6, value_7)
		end
	end
	repeat
		repeat
			repeat
			do return end
			until true
			value_2 = value_2()
		until not value_3
		value_3 = upvalues[0]
		value_4 = value_3
		value_3 = value_3.set_int
		value_5 = upvalues[0]
		value_6 = value_5
		value_5 = value_5.get_string(value_6)
		value_5 = value_5 == "1"
		if value_5 then
			value_5 = 1
		end
	until true
end

recovered.andromeda_viewmodel_offset_y_p491 = function(upvalues, argument_1, ...)
	local locals = make_locals()
	local t3
	local t8 = 0
	locals.v1 = argument_1
	locals.v2 = upvalues[0][32]()
	locals.v3 = upvalues[0][50]
	locals.v4 = locals.v2
	locals.v3 = locals.v3(locals.v4)
	if (not locals.v3) then
		return locals.v3, locals.v4, locals.v5
	end
	locals.v3 = upvalues[3]
	locals.v4 = upvalues[4].viewmodel_offset_x
	locals.v3 = locals.v3(locals.v4)
	locals.v3 = locals.v3 * 0.1
	t3 = locals
	local t4 = 4
	local t6 = 3
	local t5 = upvalues[t6]
	t3[t4] = t5
	locals.v5 = upvalues[4].viewmodel_offset_y
	locals.v4 = locals.v4(locals.v5)
	locals.v4 = locals.v4 * 0.1
	locals.v5 = upvalues[3]
	locals.v8 = locals.v7
	locals.v7 = locals.v7.get
	locals.v9 = "CS2 Viewmodel Scope"
	locals.v7 = locals.v7(locals.v8, locals.v9)
	locals.v8 = locals.v7
	if locals.v6 then
		t3[t4] = t5 + t6
		locals.v10 = upvalues[0][47]
		locals.v11 = locals.v2
		locals.v12 = "m_vecVelocity"
		locals.v10 = locals.v10(locals.v11, locals.v12)
		locals.v9 = locals.v9(unpack_locals(locals, 10, t8))
		locals.v10 = upvalues[0][162]
		locals.v11 = 1
		locals.v13 = locals.v9
		locals.v12 = locals.v9.length(locals.v13)
		locals.v12 = locals.v12 / 300
		locals.v10 = locals.v10(locals.v11, locals.v12)
		locals.v11 = upvalues[6]
		if not (locals.v11 == locals.v0) then
			locals.v11 = upvalues[6]
			locals.v12 = locals.v11
			locals.v11 = locals.v11.set_raw_int
			locals.v13 = 0
			locals.v11(locals.v12, locals.v13)
		end
		locals.v11 = upvalues[7]
		if not (locals.v11 == locals.v0) then
			locals.v11 = upvalues[7]
			locals.v12 = locals.v11
			locals.v11 = locals.v11.set_raw_float
			locals.v13 = 0
			locals.v11(locals.v12, locals.v13)
		end
		locals.v11 = upvalues[8]
		if not (locals.v11 == locals.v0) then
			locals.v11 = upvalues[8]
			locals.v12 = locals.v11
			locals.v11 = locals.v11.set_raw_float
			locals.v13 = 0
			locals.v11(locals.v12, locals.v13)
		end
		locals.v11 = cvar.viewmodel_offset_y
		if not (locals.v11 == locals.v0) then
			locals.v11 = cvar.viewmodel_offset_y
			locals.v12 = locals.v11
			locals.v11 = locals.v11.set_raw_float
			locals.v13 = locals.v4
			locals.v11(locals.v12, locals.v13)
		end
		locals.v11 = cvar.viewmodel_offset_z
		if not (locals.v11 == locals.v0) then
			locals.v11 = cvar.viewmodel_offset_z
			locals.v12 = locals.v11
			locals.v11 = locals.v11.set_raw_float
			-- impossible unresolved-key write removed
			locals.v11(locals.v12, locals.v13)
		end
		locals.v22 = 113
		if not (locals.v22) then
			locals.v22 = 178
		end
		locals.v11 = upvalues[0][163]
		locals.v12 = upvalues[0][30]()
		locals.v12 = locals.v12 * 6
		locals.v11 = locals.v11(locals.v12)
		locals.v11 = locals.v11 * locals.v10
		locals.v12 = locals.v12 * 3
	end
	repeat
		repeat
			if not locals.v7 then

				locals.v9 = upvalues[1]
				locals.v9()
				locals.v9 = locals.v3
				locals.v10 = locals.v4
				locals.v11 = locals.v5
				return locals.v9, locals.v10, locals.v11
			end
			locals.v9 = upvalues[0][47]
			locals.v10 = locals.v2
			locals.v11 = "m_bIsScoped"
			locals.v9 = locals.v9(locals.v10, locals.v11)
			locals.v9 = locals.v9 == 1
			locals.v10 = upvalues[11].lerp
			locals.v11 = upvalues[2][2][upvalues[2][1]]
			locals.v12 = locals.v9
			if not locals.v12 then
				if locals.v12 then
					locals.v13 = 0.05
					locals.v10 = locals.v10(locals.v11, locals.v12, locals.v13)
					upvalues[2][2][upvalues[2][1]] = locals.v10
					locals.v10 = upvalues[11].lerp
					locals.v11 = locals.v3
					locals.v12 = -4.75
					locals.v13 = upvalues[2][2][upvalues[2][1]]
					locals.v10 = locals.v10(locals.v11, locals.v12, locals.v13)
					locals.v3 = locals.v10
					locals.v10 = upvalues[11].lerp
					locals.v11 = locals.v4
					locals.v12 = -5
					locals.v13 = upvalues[2][2][upvalues[2][1]]
					locals.v10 = locals.v10(locals.v11, locals.v12, locals.v13)
					locals.v4 = locals.v10
					locals.v10 = upvalues[11].lerp
					locals.v11 = locals.v5
					locals.v12 = -2
					locals.v13 = upvalues[2][2][upvalues[2][1]]
					locals.v10 = locals.v10(locals.v11, locals.v12, locals.v13)
					if not (locals.v1 == locals.v0) then
						locals.v9 = upvalues[12]
						locals.v10 = locals.v1
						locals.v9(locals.v10)
					end
					break
				else
					locals.v12 = 0
				end
				break
			end
			do break end
			locals.v9 = upvalues[9][2][upvalues[9][1]]
		until not locals.v9
	until true
	locals.v9 = upvalues[6]
	if not (locals.v9 == locals.v0) then
		locals.v9 = upvalues[6]
		locals.v10 = locals.v9
		locals.v9 = locals.v9.set_float
		locals.v11 = upvalues[10]
		locals.v12 = upvalues[6]
		locals.v13 = 0
		locals.v11 = locals.v11(locals.v12, locals.v13)
		locals.v9(unpack_locals(locals, 10, t8))
	end
	locals.v9 = upvalues[7]
	locals.v10 = locals.v9
	locals.v9 = locals.v9.set_float
	locals.v11 = upvalues[10]
	locals.v12 = upvalues[7]
	locals.v13 = 0
	locals.v11 = locals.v11(locals.v12, locals.v13)
	locals.v9(unpack_locals(locals, 10, t8))
	locals.v9 = upvalues[8]
end

recovered.andromeda_cvar_3_p492 = function(upvalues, ...)
	local locals = make_locals()
	local t2
	local t7 = 0
	local t11
	while true do
		locals.v1 = upvalues[0]
		locals.v1()
		locals.v1 = upvalues[2][2][upvalues[2][1]]
		if not locals.v1 then break end
		locals.v1 = upvalues[3]
		if locals.v1 == locals.v0 then
			locals.v1 = upvalues[5]
			if locals.v1 == locals.v0 then
				locals.v1 = upvalues[6]
				if not (locals.v1 == locals.v0) then
					locals.v1 = upvalues[6]
					locals.v2 = locals.v1
					locals.v1 = locals.v1.set_float
					locals.v3 = upvalues[4]
					locals.v4 = upvalues[6]
					t3, t4, t5 = 91, upvalues, 224
					locals.v3 = locals.v3(locals.v4, locals.v5)
					locals.v1(unpack_locals(locals, 2, t7))
				end
				break
			else
				t2 = locals.v5
				locals.v2 = locals.v1
				locals.v1 = locals.v1.set_float
				locals.v3 = upvalues[4]
			end
			break
		end
		t11 = {parent = t11, index = t12, step = t14, limit = t13}
		local t13 = locals.v4
		local t12 = locals.v3 - locals.v5
	end
	locals.v1 = upvalues[7][2][upvalues[7][1]]
	if locals.v1 then
		locals.v1 = upvalues[8]
		if not (locals.v1 == locals.v0) then
			locals.v1 = upvalues[8]
			locals.v2 = locals.v1
			locals.v1 = locals.v1.set_int
			locals.v3 = upvalues[8]
			locals.v4 = locals.v3
			locals.v3 = locals.v3.get_string(locals.v4)
			locals.v3 = locals.v3 == "1"
			if locals.v3 then
				locals.v3 = 1
			end
			if not (locals.v3) then
				locals.v3 = 0
			end
			locals.v1(locals.v2, locals.v3)
		end
	end
	locals.v1 = cvar.viewmodel_fov
	if not (locals.v1 == locals.v0) then
		locals.v1 = cvar
		local t5 = "viewmodel_fov"
		local t4 = locals[t5][t5]
		locals.v1 = t4
		locals.v2 = locals.v1
		locals.v1 = locals.v1.set_float
		locals.v3 = tonumber
		locals.v4 = cvar.viewmodel_fov
		locals.v5 = locals.v4
		locals.v4 = locals.v4.get_string(locals.v5)
		locals.v3 = locals.v3(unpack_locals(locals, 4, t7))
		if not (locals.v3) then
			locals.v3 = cvar.viewmodel_fov
			locals.v4 = locals.v3
			locals.v3 = locals.v3.get_float(locals.v4)
		end
		if not (locals.v3) then
			t4 = t4 + t5[0]
		end
		locals.v1(locals.v2, locals.v3)
	end
	locals.v15 = math_helpers[10]
	locals.v16 = "\245\199\148:T"
	locals.v17 = 5
	locals.v15 = locals.v15(locals.v16, locals.v17, locals.v18)
	if not (locals.v15) then
		locals.v15 = 284
	end
	locals.v15 = locals.v15 + 22414
	locals.v15 = locals.v15 - 22694
	locals.v13[148] = locals.v15
	locals.v14[228] = 322
	locals.v1 = cvar.viewmodel_offset_x
	if not (locals.v1 == locals.v0) then
		locals.v3 = cvar.viewmodel_offset_x
		locals.v4 = locals.v3
		locals.v3 = locals.v3.get_float(locals.v4)
		if not (locals.v3) then
			locals.v3 = 0
		end
		locals.v1(locals.v2, locals.v3)
	end
	locals.v1 = cvar.viewmodel_offset_y
	if not (locals.v1 == locals.v0) then
		locals.v1 = cvar
		locals.v1 = locals.v1
		locals.v2 = locals.v1
		locals.v1 = locals.v1.set_float
		locals.v3 = tonumber
		locals.v4 = cvar.viewmodel_offset_y
		locals.v5 = locals.v4
		locals.v4 = locals.v4.get_string(locals.v5)
		locals.v3 = locals.v3(unpack_locals(locals, 4, t7))
		if not (locals.v3) then
			locals.v3 = 0
		end
		locals.v1(locals.v2, locals.v3)
	end
	locals.v1 = cvar.viewmodel_offset_z
	if not (locals.v1 == locals.v0) then
		locals.v3 = cvar.viewmodel_offset_z
		locals.v4 = locals.v3
		locals.v3 = locals.v3.get_float(locals.v4)
		if not (locals.v3) then
			locals.v3 = 0
		end
		locals.v1(locals.v2, locals.v3)
	end
	return
end

recovered.andromeda_viewmodel_offset_y_2_p493 = function(upvalues, ...)
	local locals = make_locals()
	local t2
	locals.v1 = cvar.viewmodel_fov
	locals.v2 = cvar.viewmodel_offset_x
	locals.v3 = cvar.viewmodel_offset_y
	locals.v4 = cvar.viewmodel_offset_z
	locals.v1 = upvalues[0].viewmodel
	locals.v2 = locals.v1
	locals.v1 = locals.v1.get
	local t4 = locals
	local t3 = 0
	if locals.v1 then
		locals.v15 = locals.v15(unpack_locals(locals, 16, 242))
		t3 = 5
		t4 = upvalues[3]
		locals[t3] = t4
		locals.v6 = locals.v1
		locals.v5(locals.v6)
		locals.v5 = cvar.viewmodel_fov
		locals.v6 = locals.v5
		locals.v5 = locals.v5.set_raw_float
		locals.v7 = upvalues[4]
		locals.v8 = upvalues[0].viewmodel_fov
		locals.v7 = locals.v7(locals.v8)
		locals.v7 = locals.v7 * 0.1
		locals.v5(locals.v6, locals.v7)
		if locals.v2 == locals.v0 then
		elseif locals.v3 == locals.v0 then
		elseif locals.v4 == locals.v0 then
		else
			locals.v6 = locals.v5
			locals.v5 = locals.v5.set_raw_float
			t4 = locals
			t3 = t3[t4]
			locals.v5(locals.v6, locals.v7)
		end
	end
	repeat
	do return end
	until true
end

recovered.andromeda_viewmodel_fov_p494 = function(upvalues, ...)
	local value_1, value_2
	value_1 = upvalues[0]
	value_2 = upvalues[1].viewmodel_fov
	value_1 = value_1(value_2)
	if not value_1 then
		value_1 = upvalues[2]
		value_1()
		return
	end
end

recovered.andromeda_viewmodel_offset_x_p495 = function(upvalues, ...)
	do return end
	t1[1] = upvalues[2]
	t1[1]()
	return
end

recovered.andromeda_viewmodel_offset_y_3_p496 = function(upvalues, argument_1, ...)
	local locals = make_locals()
	locals.v1 = argument_1
	locals.v1 = upvalues[0]
	locals.v2 = upvalues[1].viewmodel_offset_y
	locals.v1 = locals.v1(locals.v2)
	repeat
	do return end
	until true
	locals[t25] = t20[t25]
end

recovered.andromeda_viewmodel_offset_z_p497 = function(upvalues, ...)
	return
end

recovered.andromeda_reset_disable_fakelag_2_p498 = function(upvalues, ...)
	upvalues[0]:unset_aa()
end

recovered.export_config_p499 = function(upvalues, argument_1, ...)
	local value_1, value_2, value_3, value_4
	value_1 = argument_1
	value_3 = value_1
	value_2 = value_1.build_encoded_payload(value_3)
	if value_2 ~= nil then
		value_3 = upvalues[1].set
		value_4 = value_2
		value_3(value_4)
		value_3 = upvalues[0][86]
		value_4 = "play ui\\beepclear"
		value_3(value_4)
		return
	else
		value_3 = upvalues[0][86]
		value_4 = "play resource/warning.wav"
		value_3(value_4)
		return
	end
end

recovered.andromeda_last_exploit_charged_2_p500 = function(upvalues, argument_1, argument_2, argument_3, argument_4, ...)
  local value_0, value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_8, value_9
  local value_10, value_11, value_12, value_13, value_14, value_15, value_26, value_27
	local t6
	value_1 = argument_1
	value_2 = argument_2
	value_3 = argument_3
	value_4 = argument_4
	value_5 = value_3
	if not (value_5) then
		value_5 = upvalues[0][2][upvalues[0][1]].current
	end
	if not (value_5) then
		value_5 = upvalues[1][1]
	end
	value_6 = value_4.def_yaw_delay
	value_27 = value_6
	value_26 = value_6.get
	value_6 = value_6(value_7)
	value_7 = upvalues[2].clamp
	value_8 = upvalues[3][154]
	value_9 = value_6
	if not (value_9) then
		value_9 = 1
	end
	value_8 = value_8(value_9)
	value_9 = 1
	value_10 = 16
	value_7 = value_7(value_8, value_9, value_10)
	value_7 = value_1.defensive_yaw_double_states
	value_7 = value_7[value_5]
	if not (value_7 ~= value_0) then
		value_8 = {}
		value_9 = value_1.body_yaw.inverter
		value_9 = value_9 == true
		value_8.side = value_9
		value_9 = upvalues[4][2][upvalues[4][1]].packets
	end
	if not (value_9) then
		value_9 = upvalues[5].is_on_shot_antiaim
		value_10 = "no dt"
		value_9 = value_9(value_10)
	end
	value_10 = value_9
	if value_10 then
		value_10 = upvalues[4][2][upvalues[4][1]].exploits.charged
		value_10 = value_10 == true
	end
	value_11 = value_7.last_exploit_key_active
	value_11 = value_11 ~= value_0
	if value_11 then
		value_11 = value_7.last_exploit_key_active
		value_11 = value_11 ~= value_9
		if not (value_11) then
			value_11 = value_7.last_exploit_charged
			value_11 = value_11 ~= value_10
		end
	end
	local t8 = nil
	value_13 = value_6
	value_12 = value_12(value_13)
	value_7.last_exploit_key_active = value_9
	value_7.last_exploit_charged = value_10
	if value_11 then
		value_13 = value_1.body_yaw.inverter
		value_13 = value_13 == true
		value_7.side = value_13
		value_13 = value_1.body_yaw
		value_14 = value_7.side
		value_14 = value_14 == true
		value_13.inverter = value_14
		value_13 = value_7.switch_count
		if not (value_13) then
			value_13 = 0
		end
		value_7.switch_count = value_13
		value_13 = value_8
		value_13()
	end
	value_13 = upvalues[4][2][upvalues[4][1]].exploits.charged
	value_13 = value_13 == true
	if value_13 then
		value_13 = upvalues[5].is_double_tap()
		if not (value_13) then
			value_13 = upvalues[5].is_on_shot_antiaim()
		end
	end
	value_14 = upvalues[5].ragebot.double_tap_fl
	value_15 = value_14
	value_14 = value_14.get(value_15)
	value_15 = value_1.body_yaw.inverter
	value_15 = value_15 == true
	return value_7()
end

recovered.andromeda_packets_4_p501 = function(upvalues, ...)
	local value_1, value_2
	value_1 = upvalues[1][2][upvalues[1][1]].packets
	value_2 = upvalues[2][2][upvalues[2][1]]
	value_1 = value_1 + value_2
	upvalues[0][2][upvalues[0][1]].next_switch_packet = value_1
	return
end

recovered.andromeda_builder_3_p502 = function(upvalues, argument_1, argument_2, ...)
  local value_0, value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_8, value_9
  local value_10, value_11, value_12, value_13, value_14, value_15, value_16, value_24, value_25
	value_1 = argument_1
	value_2 = argument_2
	value_3 = upvalues[0]()
	if value_3 then
		value_5 = false
		return value_5
	else
		value_4 = false
		return value_4
	end
	value_5 = upvalues[1].builder
	value_5 = value_5 ~= value_0
	if value_5 then
		value_5 = upvalues[1].builder
		value_5 = value_5[value_3]
		value_5 = value_5 ~= value_0
	end
	if value_5 then
		value_5 = upvalues[1].builder
		value_5 = value_5[value_3].force_defensive
	end
	if value_5 == value_0 then
		return value_6
	end
	value_6 = upvalues[2].is_double_tap()
	value_7 = upvalues[2].is_on_shot_antiaim()
	if value_7 then
		value_7 = value_7()
	end
	value_9 = value_5
	value_8 = value_5.get
	value_10 = "Double tap"
	value_8 = value_8(value_9, value_10)
	if value_8 then
		value_8 = value_6
	end
	if not (value_8) then
		value_9 = value_5
		value_8 = value_5.get
		value_10 = "On shot anti-aim"
		value_8 = value_8(value_9, value_10)
	end
	if value_8 then
		value_9 = value_4.toggle_builder
		value_10 = value_9
		value_9 = value_9.get(value_10)
	end
	do
		value_9 = false
		return value_9
	end
	value_11 = value_10
	value_10 = value_10.get(value_11)
	value_11 = value_9
	if value_11 then
		value_11 = value_9.left
		value_11 = value_11 > 0
	end
	if value_11 then
		value_11 = value_9.left
		value_11 = value_11 < value_10
	end
	if (not value_11) then
		return value_12
	end
	value_25 = 138
	if not (value_25) then
		value_25 = 21
	end
	value_25 = value_25 - 379
	value_25 = value_25 + 5624
	value_25 = value_25 - 5252
	value_24[173] = value_25
	value_24[144] = 171
	value_16 = value_4
	value_12(value_13, value_14, value_15, value_16)
	value_12 = true
	return value_12
end

recovered.andromeda_hit_p503 = function(upvalues, argument_1, ...)
	local value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_8, value_9
	value_1 = argument_1
	value_2 = "hit"
	value_3 = 1
	value_4 = #value_1
	value_5 = 1
	local t12 = {parent = nil, index = nil, step = nil, limit = nil}
	local t14 = value_4
	local t13 = value_3 - value_5
	repeat
		t13 = t13 + t15
		value_6 = t13
		if t15 <= 0 then
		end
	until value_7 == "text"
	value_3 = upvalues[0].console_color
	value_4 = value_2
	value_3 = value_3(value_4)
	value_6 = upvalues[1][60]
	value_7 = value_3
	value_8 = value_4
	value_8 = 1
	t12 = {parent = t12.parent, index = t12.index, step = t12.step, limit = t12.limit}
	t14 = value_7
	t13 = value_6 - value_8
	repeat
		t13 = t13 + t15
		value_9 = t13
	until true
end

recovered.aim_fire_p504 = function(upvalues, argument_1, ...)
  local value_1, value_2, value_4, value_5, value_6, value_12, value_14, value_15, value_18, value_22
  local value_24
	local t3
	value_1 = argument_1
	value_18[62] = 28
	value_22[62] = 0
	value_24[78] = 124
	value_15 = value_15 + 0
	value_15 = value_15 + 295
	value_15 = value_15 + 10676
	value_15 = value_15 - 10973
	value_12[101] = value_15
	value_14[125] = 99
	value_2 = value_1.id
	value_5 = value_1.target
	local t4 = 4
	t3 = 3093
	value_5 = tonumber
	value_6 = value_1.damage
	value_5 = value_5(value_6)
	value_5 = {}
	value_5 = tonumber
	value_6 = value_1.hitgroup
	value_5 = value_5(value_6)
	if not (value_5) then
		value_5 = 0
	end
	value_4.hitgroup = value_5
	value_5 = tonumber
	value_6 = value_1.hit_chance
	value_5 = value_5(value_6)
	if not (value_5) then
		value_5 = 0
	end
	value_4.chance = value_5
	value_5 = tonumber
	value_6 = value_1.backtrack
	if value_22 then
	end
	return
end

recovered.andromeda_build_payload_p505 = function(upvalues, argument_1, ...)
	local value_1
	value_1 = argument_1
end

recovered.get_raw_value_p506 = function(upvalues, argument_1, ...)
	local locals = make_locals()
	locals.v1 = argument_1
	locals.v3 = {}
	locals.v4 = upvalues[0][120]
	locals.v5 = locals.v1
	locals.v4 = locals.v4(locals.v5)
	for t25 = 1, 0 - 3 do
		locals.v3[t25 + 0] = locals[t25 + 3]
	end
	locals.v4 = {}
	locals.v5 = locals.v3[2]
	locals.v5 = upvalues[1][locals.v5]
	locals.v6 = locals.v3[3]
	if not (locals.v6) then
		locals.v6 = 0
	end
		locals.v4[1] = locals.v5
		locals.v4[2] = locals.v6
	return locals.v4
end

recovered.andromeda_anti_aim_p507 = function(upvalues, ...)
	local value_1, value_2, value_3, value_4
	value_1 = upvalues[0][2][upvalues[0][1]]
	value_1 = upvalues[1].switch
	value_2 = value_1
	value_1 = value_1.get(value_2)
	if not (value_1 ~= "Visuals") then
		value_2 = upvalues[1].switch
		value_3 = value_2
		value_2 = value_2.set
		value_4 = "Other"
		value_2(value_3, value_4)
		value_1 = "Other"
	end
	if not (value_1 == "Anti-Aim") then
		value_2 = upvalues[2]()
		if not (value_2) then
			value_2 = upvalues[3]
			value_2()
		end
	end
	value_2 = upvalues[4]
	value_2()
	value_2 = upvalues[5]
	value_2()
	return
end

recovered.is_dt_indicator_kind_p508 = function(upvalues, argument_1, ...)
	local value_1, value_2
	value_1 = argument_1
	value_2 = value_1 == "dt"
	return value_2
end

recovered.rounded_rectangle_p509 = function(upvalues, argument_1, argument_2, argument_3, argument_4, argument_5, argument_6, argument_7, argument_8, argument_9, argument_10, ...)
	local locals = make_locals()
	local t12
	locals.v1 = argument_1
	locals.v2 = argument_2
	locals.v3 = argument_3
	locals.v4 = argument_4
	locals.v5 = argument_5
	locals.v6 = argument_6
	locals.v7 = argument_7
	locals.v8 = argument_8
	locals.v9 = argument_9
	locals.v10 = argument_10
	locals.v2 = locals.v2 + locals.v5
	locals.v11 = locals.v10
	if not (locals.v11) then
		locals.v11 = {}
		locals.v11.use_gradient = false
	end
	locals.v10 = locals.v11
	locals.v11 = {}
	locals.v12 = {}
	locals.v13 = locals.v1 + locals.v5
	locals.v14 = locals.v2
	locals.v15 = 180
		locals.v12[1] = locals.v13
		locals.v12[2] = locals.v14
		locals.v12[3] = locals.v15
	locals.v13 = {}
	locals.v14 = locals.v1 + locals.v3
	locals.v14 = locals.v14 - locals.v5
	locals.v17 = locals.v2 + locals.v4
	locals.v18 = locals.v5 * 2
	locals.v17 = locals.v17 - locals.v18
	locals.v18 = 0
		locals.v15[1] = locals.v16
		locals.v15[2] = locals.v17
		locals.v15[3] = locals.v18
		locals.v11[1] = locals.v12
		locals.v11[2] = locals.v13
		locals.v11[3] = locals.v14
		locals.v11[4] = locals.v15
	locals.v12 = {}
	locals.v13 = {}
	locals.v14 = locals.v1 + locals.v5
	locals.v15 = locals.v2
	locals.v16 = locals.v5 * 2
	locals.v16 = locals.v3 - locals.v16
	locals.v17 = locals.v5 * 2
	locals.v17 = locals.v4 - locals.v17
		locals.v13[1] = locals.v14
		locals.v13[2] = locals.v15
		locals.v13[3] = locals.v16
		locals.v13[4] = locals.v17
	locals.v14 = {}
	locals.v15 = locals.v1 + locals.v5
	locals.v16 = locals.v2 - locals.v5
	locals.v17 = locals.v5 * 2
	locals.v17 = locals.v3 - locals.v17
	locals.v18 = locals.v5
		locals.v14[1] = locals.v15
		locals.v14[2] = locals.v16
		locals.v14[3] = locals.v17
		locals.v14[4] = locals.v18
	locals.v15 = {}
	locals.v16 = locals.v1 + locals.v5
	locals.v17 = locals.v2 + locals.v4
	locals.v18 = locals.v5 * 2
	locals.v17 = locals.v17 - locals.v18
	locals.v18 = locals.v5 * 2
	local t15 = 18
	locals.v19 = locals.v5
		locals.v15[1] = locals.v16
		locals.v15[2] = locals.v17
		locals.v15[3] = locals.v18
		locals.v15[4] = locals.v19
	locals.v16 = {}
	if not (nil <= locals.v29) then
		locals.v18 = locals.v2
		locals.v19 = locals.v5
		locals.v20 = locals.v5 * 2
			locals.v16[1] = locals.v17
			locals.v16[2] = locals.v18
			locals.v16[3] = locals.v19
			locals.v16[4] = locals.v20
		locals.v17 = {}
		locals.v18 = locals.v1 + locals.v3
		locals.v18 = locals.v18 - locals.v5
		locals.v19 = locals.v2
		locals.v20 = locals.v5
		locals.v21 = locals.v5 * 2
		locals.v21 = locals.v4 - locals.v21
			locals.v17[1] = locals.v18
			locals.v17[2] = locals.v19
			locals.v17[3] = locals.v20
			locals.v17[4] = locals.v21
			locals.v12[1] = locals.v13
			locals.v12[2] = locals.v14
			locals.v12[3] = locals.v15
			locals.v12[4] = locals.v16
			locals.v12[5] = locals.v17
		locals.v13 = next
		locals.v14 = locals.v11
		local t21 = {parent = nil, index = nil, step = nil, limit = nil}
		local t24 = locals.v15
		local t23 = locals.v14
		local t22 = locals.v13
		repeat
			local t27 = locals.v13(nil, t26)
			locals.v15 = t32
			locals.v14 = t27
			local t26 = t27
			locals.v13 = next
			locals.v14 = locals.v12
			local t31 = {}
			t31.parent = t21.parent
			t31.index = t21.index
			t31.step = t21.step
			t31.limit = t21.limit
			t21 = t31
			t24 = locals.v15
			t23 = locals.v14
			t22 = locals.v13
			t27 = locals.v13(nil, t26)
			locals.v15 = t32
			locals.v14 = t27
			t26 = t27
			do return end
			t15 = t15[t16]
			locals.v16 = draw_animated_gradient
			locals.v17 = locals.v15[1]
			locals.v18 = locals.v15[2]
			locals.v19 = locals.v15[3]
			locals.v20 = locals.v15[4]
			locals.v21 = 25
			locals.v22 = locals.v10.col1_start
			locals.v23 = locals.v10.col1_end
			locals.v24 = locals.v10.col2_start
			locals.v25 = locals.v10.col2_end
			local t13 = 26
			t12 = locals
			t12[t13] = false
			locals.v16(locals.v17, locals.v18, locals.v19, locals.v20, locals.v21, locals.v22, locals.v23, locals.v24, locals.v25, locals.v26)
			locals.v16 = upvalues[0][128]
			locals.v17 = locals.v15[1]
			locals.v18 = locals.v15[2]
			locals.v19 = locals.v15[3]
			locals.v20 = locals.v15[4]
			locals.v21 = locals.v6
			locals.v22 = locals.v7
			locals.v16 = locals.v10.use_gradient
		until true
	end
	locals.v40 = math_helpers[7]
	locals.v41 = "3"
	locals.v40 = locals.v40(locals.v41)
	locals.v40 = 244
	locals.v40 = locals.v40 + 13454
	locals.v40 = locals.v40 - 13436
	locals.v37[109] = locals.v40
	locals.v39[106] = 255
	locals.v18 = locals.v18 * 0.5
	locals.v19 = locals.v15[3]
	locals.v20 = math.pi
	locals.v19 = locals.v19 * locals.v20
	locals.v19 = locals.v19 * 2
	locals.v18 = locals.v18 + locals.v19
	locals.v17 = locals.v17(locals.v18)
	locals.v17 = locals.v17 + 1
	locals.v17 = locals.v17 / 2
	locals.v18 = lerp_color
	locals.v19 = locals.v10.col1_start
	locals.v20 = locals.v10.col1_end
	locals.v21 = locals.v16
	locals.v18 = locals.v18(locals.v19, locals.v20, locals.v21)
	locals.v19 = lerp_color
end

recovered.andromeda_ccsplayer_p510 = function(upvalues, ...)
	local value_1, value_2, value_3, value_4, value_5, value_6, value_7
	local t13 = value_3
	local t14 = value_4
	local t12 = value_2 - t14
	repeat
		t12 = t12 + t14
		value_5 = t12
		value_2 = value_1
		do return value_2 end
		value_6 = upvalues[0][45]
		value_7 = value_5
		value_6 = value_6(value_7)
	until true
	local t21 = true
end

recovered.lerp_p511 = function(upvalues, argument_1, argument_2, argument_3, ...)
  local value_1, value_2, value_3, value_4, value_5
	local t5
	value_1 = argument_1
	value_2 = argument_2
	value_3 = argument_3
	value_4 = type
	value_5 = value_2
	value_4 = value_4(value_5)
	if not (value_4 ~= "boolean") then
		value_4 = value_2
		if value_4 then
			value_4 = 1
		end
		if not (value_4) then
			value_4 = 0
		end
		value_2 = value_4
	end
	if not (value_5) then
		value_5 = value_4
	end
	return value_5
end

recovered.andromeda_fakelag_2_p512 = function(upvalues, ...)
  local value_1, value_2
	upvalues[0].saved_usercmd = value_1
	value_1 = upvalues[1].antiaim.fakelag.limit
	value_1 = upvalues[1].antiaim.fakelag.limit
	value_2 = value_1
	value_1 = value_1.get_original(value_2)
	local t3 = 0
	if not (value_1) then
		value_1 = upvalues[1].antiaim.fakelag.limit
	end
	upvalues[0].saved_limit = value_1
	return
end

recovered.andromeda_function_65_p513 = function(upvalues, argument_1, ...)
	local value_1, value_2, value_3, value_5
	value_1 = argument_1
	value_2 = upvalues[0][46]
	value_3 = value_1
	value_2 = value_2(value_3)
	value_5 = nil
	return value_5
end

recovered.andromeda_jitter_2_p514 = function(upvalues, argument_1, argument_2, ...)
	local value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_8, value_9, value_10
	local value_11, value_12, value_13, value_14
	value_1 = argument_1
	value_2 = argument_2
	if value_3 == "Off" then
		return
	end
	value_4 = upvalues[0]
	value_4()
	if value_3 == "Static" then
		return
	end
	value_11 = value_11(value_12)
	value_6 = value_1.legs_offset_2
	value_7 = value_6
	value_6 = value_6.get(value_7)
	value_7 = value_1.legs_jitter_time
	value_8 = value_7
	value_7 = value_7.get(value_8)
	value_8 = value_7 * 4
	value_8 = value_4 % value_8
	value_9 = value_7 * 2
	value_8 = value_8 >= value_9
	if value_8 then
		value_8 = 200
	end
	repeat

		value_9 = value_7 * 2
		value_9 = value_4 % value_9
		value_9 = value_9 >= value_7
		if not value_9 then
			if value_9 then
				value_11 = value_2
				value_12 = "m_flPoseParameter"
				value_13 = value_9 * value_8
				value_14 = 0
				value_10(value_11, value_12, value_13, value_14)
				value_10 = upvalues[0]
				value_11 = "Always slide"
				value_10(value_11)
				return
			else
				value_9 = value_6
				if value_3 == "Moonwalk" then
					value_4 = upvalues[1][36]
					value_5 = value_2
					value_6 = "m_flPoseParameter"
					value_7 = 0
					value_8 = 7
					value_4(value_5, value_6, value_7, value_8)
					value_4 = upvalues[0]
					value_5 = "Never slide"
					value_4(value_5)
					return
				end
			end
			break
		else
			value_9 = value_5
		end
	do break end
	until value_3 ~= "Kangaroo"
	if not (value_3 ~= "Jitter[2]") then
		value_5 = value_5(value_6)
		value_5 = value_5 * 0.01
		value_6 = upvalues[2].random_int
		value_7 = 0
		value_8 = 1
		value_6 = value_6(value_7, value_8)
		value_6 = value_6 == 0
		if value_6 then
			value_6 = "Off"
		end
		if not (value_6) then
			value_6 = "Always slide"
		end
		value_7 = upvalues[1][36]
		value_8 = value_2
		value_9 = "m_flPoseParameter"
		value_10 = upvalues[2].random_float
		-- Luraph junk / invalid SSA expression removed
		value_12 = value_5
		value_10 = value_10(value_11, value_12)
		value_11 = 0
		value_7(value_8, value_9, value_10, value_11)
		value_7 = upvalues[0]
		value_8 = value_6
		value_7(value_8)
	end
	return
end

recovered.andromeda_x_2_p515 = function(upvalues, argument_1, argument_2, argument_3, argument_4, argument_5, argument_6, argument_7, argument_8, ...)
  local value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_8, value_9, value_15
  local value_17, value_18
	value_1 = argument_1
	value_2 = argument_2
	value_3 = argument_3
	value_4 = argument_4
	value_5 = argument_5
	value_6 = argument_6
	value_7 = argument_7
	value_8 = argument_8
	value_3 = value_1 - value_2
	value_4 = upvalues[0][155]
	value_8 = value_3.x
	value_6 = value_3.x
	value_5 = value_5 * value_6
	value_6 = value_3.y
	value_4 = value_4(value_5)
	value_5 = {}
	value_6 = upvalues[1]
	value_7 = upvalues[0][152]
	value_8 = value_3.z
	value_9 = value_4
	value_7 = value_7(value_8, value_9)
	value_7 = value_7 * 57.295779513082
	value_8 = 90
	value_6 = value_6(value_7, value_8)
	value_5.x = value_6
	-- Luraph junk / invalid SSA expression removed
	value_7 = upvalues[0][152]
	value_8 = value_3.y
	value_9 = value_3.x
	value_7 = value_7(value_8, value_9)
	value_7 = value_7 * 180
	value_18 = value_18 + 26215
	value_18 = value_18 - 26388
	value_15[79] = value_18
	value_17[42] = 77
end

recovered.andromeda_ref_p516 = function(upvalues, argument_1, argument_2, ...)
	local value_1, value_2, value_5, value_6, value_7, value_8, value_21, value_22
	value_1 = argument_1
	value_2 = argument_2
	value_21 = 31
	if not (value_21) then
		value_21 = math_helpers[7]
		value_22 = "*"
		value_21 = value_21(value_22)
	end
	value_7 = 1
	local t13 = {parent = nil, index = nil, step = nil, limit = nil}
	local t15 = value_6
	local t14 = value_5 - value_7
	repeat
		while true do
			t14 = t14 + t16
			value_8 = t14
			if t16 > 0 then break end
			if (t14 >= t15 or t16 > 0) and t14 <= t15 then
			end
		end
	until t14 <= t15
	value_5 = upvalues[1].active
	value_5[value_1] = true
	return
end

recovered.andromeda_shutdown_p517 = function(upvalues, ...)
	local value_1
	value_1 = upvalues[0].skip_native_cleanup()
end

recovered.andromeda_function_66_p518 = function(upvalues, ...)
	local value_1, value_2, value_3, value_5, value_6, value_12, value_13, value_14
	local t2
	if value_13 then
		value_13 = math_helpers[5]
		value_14 = math_helpers[6]
		value_13 = value_13(value_14)
	end
	value_13 = 381
	value_13 = value_13 == 282
	if value_5 then
		value_13 = 317
	end
	if not (value_13) then
		value_13 = 341
	end
	value_13 = value_13 + 4720
	value_13 = value_13 - 5012
	value_6[6] = value_13
	value_12[59] = 67
	value_1 = pairs
	value_2 = upvalues[0].active
	value_1 = value_1(value_2)
	local t11 = {parent = nil, index = nil, step = nil, limit = nil}
	repeat
		local t17 = value_1(nil, t16)
		value_3 = t22
		value_2 = t17
		local t16 = t17
	until true
	return
end

recovered.andromeda_cvar_4_p519 = function(upvalues, argument_1, argument_2, argument_3, ...)
	local locals = make_locals()
	local t11 = select("#", ...)
	locals.v1 = argument_1
	locals.v2 = argument_2
	locals.v3 = argument_3
	locals.v5 = locals.v4
	locals.v4 = locals.v4.get_float(locals.v5)
	locals.v5 = upvalues[0][28]()
	locals.v4 = locals.v4 * locals.v5
	locals.v5 = cvar.sv_jump_impulse
	locals.v6 = locals.v5
	locals.v5 = locals.v5.get_float(locals.v6)
	locals.v6 = upvalues[0][28]()
	locals.v5 = locals.v5 * locals.v6
	local t6 = 6
	local t7 = locals.v1
	locals[t6] = t7
	locals.v7 = locals.v1
	locals.v8 = upvalues[1]
	locals.v9 = upvalues[0][47]
	if locals.v9 then
		locals.v9 = -locals.v4
	end
	if not (locals.v9) then
		locals.v9 = locals.v5
	end
	locals.v10 = 1
	locals.v11 = locals.v2
	locals.v12 = 1
	local t14 = {parent = nil, index = nil, step = nil, limit = nil}
	local t16 = locals.v11
	local t15 = locals.v10 - locals.v12
	repeat
		t15 = t15 + t17
		locals.v13 = t15
		if (t17 > 0 or t15 + t17 < t16) and (t17 <= 0 or t15 + t17 > t16) then
			locals.v0 = locals.v0[locals.v0]
			locals.v10 = locals.v6
			return locals.v10
		end
		local t12 = {...}
		t11 = select("#", ...)
		locals.v16 = locals.v16()
		locals.v15 = locals.v15 * locals.v16
		locals.v16 = locals.v8.y
		locals.v17 = upvalues[0][28]()
		locals.v39[69] = 7
		locals.v39[23] = 8
	until locals.v14 > 0.99
	locals.v15 = locals.v7
	return locals.v15
end

recovered.andromeda_bomb_planting_p520 = function(upvalues, argument_1, ...)
	local value_1, value_2
	value_1 = argument_1
	value_2 = value_1 == "bomb"
	if not (value_2) then
		value_2 = value_1 == "planted_bomb"
	end
	if not (value_2) then
		value_2 = value_1 == "bomb_planting"
	end
	return value_2
end

recovered.andromeda_ccsplayer_2_p521 = function(upvalues, ...)
	local value_1, value_2, value_3
	value_1 = upvalues[0].is_quit()
	if not value_1 then
		return
	end
	value_1 = upvalues[1][32]()
	value_2 = upvalues[1][50]
	value_3 = value_1
	value_2 = value_2(value_3)
	if value_2 then
		return
	end
end

recovered.andromeda_px_2_p522 = function(upvalues, argument_1, argument_2, argument_3, argument_4, argument_5, argument_6, argument_7, argument_8, ...)
	local value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_8, value_9, value_10
	local value_12, value_13, value_14
	value_1 = argument_1
	value_2 = argument_2
	value_3 = argument_3
	value_4 = argument_4
	value_5 = argument_5
	value_6 = argument_6
	value_7 = argument_7
	value_8 = argument_8
	value_9 = upvalues[0].get_animation_alpha
	value_1 = value_10 .. "key"
	value_9 = value_9(value_10)
	value_10 = upvalues[0].get_animation_slide
	value_12 = upvalues[0].px
	value_13 = 26
	value_14 = value_7
	value_12 = value_12(value_13, value_14)
	value_12 = value_12 * value_10
	return
end

recovered.get_order_p523 = function(upvalues, argument_1, ...)
  local value_1, value_2, value_7, value_12, value_13
	value_1 = argument_1
	value_12 = 262
	if not (value_12) then
		value_12 = math_helpers[5]
		value_13 = math_helpers[6]
		value_12 = value_12(value_13)
	end
	local t20 = {...}
		value_1 = t20[1]
	if value_7 == "fs" then
		return value_2
	end
	if value_1 == "damage" then
		return value_2
	end
	if value_1 == "body" then
		return value_2
	end
	if value_1 == "safe" then
		return value_2
	end
	if value_1 ~= "force" then
		value_2 = 60
		return value_2
	else
		value_2 = 50
		return value_2
	end
end

recovered.andromeda_switch_type_2_p524 = function(upvalues, ...)
	local value_1, value_2, value_3, value_4
	value_1 = upvalues[0].switch_type
	value_2 = value_1
	value_1 = value_1.get(value_2)
	value_2 = type
	value_3 = value_1
	value_2 = value_2(value_3)
	if not (value_2 ~= "number") then
		value_2 = upvalues[0].switch_type
		value_3 = value_2
		value_2 = value_2.set
		value_4 = 0
		value_2(value_3, value_4)
	end
	repeat
	do return end
	until true
end

recovered.get_icon_offset_p525 = function(upvalues, argument_1, argument_2, ...)
	local value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_10
	value_1 = argument_1
	value_2 = argument_2
	value_3 = upvalues[0].is_bomb_indicator_kind
	value_4 = value_1
	value_3 = value_3(value_4)
	if value_3 then
		return value_3(value_4, value_5)
	end
	repeat
		while true do
			value_7 = value_4 - value_3
			value_7 = value_7 * 0.5
			local t14 = t14 + nil
			value_10 = t14
			if nil > 0 then break end
			if (t14 >= nil or nil > 0) and t14 <= nil then
			end
		end
	until t14 <= nil
	value_6 = value_6(value_7)
	value_6 = value_5 + value_6
	return value_6
end

recovered.andromeda_textures_p526 = function(upvalues, argument_1, argument_2, ...)
  local value_0, value_1, value_2, value_3, value_4, value_12, value_18, value_19
	value_1 = argument_1
	value_2 = argument_2
	if value_1 == value_0 then
		return value_3
	end
	value_19 = 270
	if not (value_19) then
		value_19 = 76
	end
	value_19 = value_19 + 378
	value_19 = value_19 + 29658
	value_19 = value_19 - 30021
	value_12[44] = value_19
	value_18[25] = 57
	value_3 = tostring
	value_4 = value_2
	value_3 = value_3(value_4)
	value_3 = ":" .. value_3
	value_3 = value_1 .. value_3
	value_4 = upvalues[0].textures
	value_4 = value_4[value_3]
	if not (value_4 == value_0) then
		value_4 = upvalues[0].textures
		value_4 = value_4[value_3]
		return value_4
	end
end

recovered.andromeda_is_quit_3_p527 = function(upvalues, ...)
	local value_1
	value_1 = upvalues[0].is_quit()
	if not (value_1) then
		value_1 = upvalues[1]
		value_1()
	end
	value_1 = {}
	upvalues[2].server_anim_states = value_1
	return
end

recovered.get_font_size_p528 = function(upvalues, ...)
  local value_8, value_14, value_15
	local t2
	repeat
		value_15 = 481
		value_15 = 394
		value_15 = value_15 + 1285
		value_15 = value_15 - 1460
		value_8[27] = value_15
		value_14[10] = 26
		local t22 = 16
		local t23 = 1
	until true
end

recovered.andromeda_function_67_p529 = function(upvalues, argument_1, argument_2, argument_3, argument_4, ...)
	local value_1, value_2, value_3, value_4
	value_1 = argument_1
	value_2 = argument_2
	value_3 = argument_3
	value_4 = argument_4
end

recovered.normalize_p530 = function(upvalues, argument_1, argument_2, argument_3, ...)
	local value_1, value_2, value_3, value_4, value_5
	value_1 = argument_1
	value_2 = argument_2
	value_3 = argument_3
	value_2 = -180
	value_3 = 180
	value_4 = value_3 - value_2
	while value_3 < value_1 do
		value_1 = value_1 - value_4
	end
	value_5 = value_1
	return value_5
end

recovered.andromeda_dist_p531 = function(upvalues, argument_1, argument_2, argument_3, ...)
  local value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_8, value_9, value_10
  local value_11, value_12, value_25
	value_1 = argument_1
	value_2 = argument_2
	value_3 = argument_3
	if (not value_2) then
		return value_4, value_5
	end
	value_4 = upvalues[0][37]
	value_5 = value_1
	value_4 = value_4(value_5)
	if (not value_4) then
		return value_5, value_6
	end
	value_5 = upvalues[1]
	value_6 = value_4
	value_5 = value_5(value_6)
	if (not value_5) then
		return value_6, value_7
	end
	value_6 = value_5.weapon_type_int
	value_7 = value_5.weapon_type_int
	if value_7 == 0 then
		return value_6, value_7
	end
	value_9 = value_5.damage
	value_10 = upvalues[0][160]
	value_11 = value_5.range_modifier
	value_12 = value_7 * 0.002
	value_12 = value_12 * 0.5
	value_12 = value_12 * 0.5
	value_12 = value_9 - value_12
	if not (value_10 >= value_12) then
		value_12 = value_10 / 0.5
		value_11 = value_9 - value_12
	end
	value_12 = not value_3
	if value_12 then
		value_12 = value_11 * 0.5
		value_12 = value_12 >= value_8
	end
	return value_25()
end

recovered.get_segment_color_p532 = function(upvalues, argument_1, argument_2, ...)
  local value_0, value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_8, value_9
	value_1 = argument_1
	value_2 = argument_2
	value_3 = upvalues[0].visuals
	if value_3 then
		value_3 = upvalues[0].visuals
		local t5 = 3
	end
	if not (value_5) then
	end
	value_9 = value_0 >= 88
		value_6[1] = value_7
		value_6[2] = value_8
		value_6[3] = value_9
	value_7 = value_2
	return value_4(value_5, value_6, value_7)
end

recovered.apply_move_lean_p533 = function(upvalues, ...)
  local value_0, value_2, value_3
	value_0 = nil < nil
	do return end
	value_3 = "weight" .. value_2
	return
end

recovered.andromeda_g_4_p534 = function(upvalues, argument_1, argument_2, ...)
	local value_1, value_2, value_5, value_6, value_7, value_8, value_9
	value_1 = argument_1
	value_2 = argument_2
	value_9 = value_5
	return value_6(value_7, value_8, value_9)
end

recovered.andromeda_ref_2_p535 = function(upvalues, argument_1, ...)
  local value_1, value_6, value_13, value_19, value_20, value_21, value_22, value_23, value_24
	local t12
	value_1 = argument_1
	value_20 = value_20(value_21, value_22, value_23)
	value_20 = 297 - value_20
	value_21 = math_helpers[10]
	value_22 = "3"
	value_23 = 1
	value_24 = 1
	value_21 = value_21(value_22, value_23, value_24)
	value_20 = value_20 + value_21
	value_20 = value_20 + 12660
	value_20 = value_20 - 12605
	value_13[98] = value_20
	value_19[62] = 94
	repeat
		local t13 = t13 + t15
		value_6 = t13
		t12 = t12.parent
		local t15 = t12.step
		local t14 = t12.limit
		t13 = t12.index
	until true
end

recovered.andromeda_function_68_p536 = function(upvalues, argument_1, ...)
	local value_1, value_2, value_3, value_4
	value_1 = argument_1
	value_2 = upvalues[0][29]()
	value_3 = type
	value_4 = value_2
	value_3 = value_3(value_4)
	do
		value_3 = false
		return value_3
	end
	upvalues[1][2][upvalues[1][1]][value_1] = value_2
	value_3 = true
	return value_3
end

recovered.andromeda_fps_optimization_p537 = function(upvalues, ...)
	local value_1, value_2
	local t2
	value_1 = upvalues[0].visuals
	if not (value_1 == nil) then
		value_2 = upvalues[0].visuals.fps_optimization
	end
	value_1 = upvalues[1]
	value_1()
	return
end

recovered.andromeda_features_p538 = function(upvalues, ...)
  local value_0, value_1, value_2, value_12, value_13, value_14, value_15, value_16
	local t5 = 1
	value_2 = upvalues[1].antiaim.features
	value_2 = value_2.hotkeys.left
	value_1 = upvalues[0]
	value_2 = upvalues[1].antiaim.features.hotkeys
	value_13 = 229
	if not (value_13) then
		value_13 = 4
	end
	value_13 = 233
	if not (value_13) then
		value_13 = math_helpers[10]
		value_14 = "-{\000#<"
		value_15 = 4
		-- Luraph junk / invalid SSA expression removed
		value_13 = value_13(value_14, value_15, value_16)
	end
	value_13 = value_13 + 21211
	value_13 = value_13 - 21443
	value_12[104] = value_13
	value_12[67] = 35
	do return end
	upvalues[3][2][upvalues[3][1]].manual = value_0
	return
end

recovered.andromeda_update_list_2_p539 = function(upvalues, argument_1, ...)
  local value_1, value_2, value_3, value_12, value_13, value_14, value_15, value_24, value_25
	value_1 = argument_1
	repeat
		repeat
			value_12 = 402
			if not (value_12) then
				value_12 = math_helpers[10]
				value_14 = 3
				value_12 = value_12(value_13, value_14, value_15)
			end
			local t20 = {...}
				value_1 = t20[1]
			value_3 = value_1
			value_2 = value_1.build_maps
			value_2(value_3)
			value_25 = value_1
			value_24 = value_1.ensure_defaults
			local t13 = t13 + nil
			value_3 = t13
			if (nil > 0 or t13 + nil >= nil or nil > 0) and t13 + nil <= nil then
			end
		until t13 < nil
	until t13 <= nil
	value_2 = nil ~= "update_list"
	value_2(value_3)
	value_3 = value_1
	value_2 = value_1.init_callbacks
	value_2(value_3)
	return
end

recovered.andromeda_function_69_p540 = function(upvalues, argument_1, ...)
	local value_1, value_2, value_3
	value_1 = argument_1
	value_2 = upvalues[0]
	value_2()
	value_2 = upvalues[2]
	value_3 = value_1
	value_2 = value_2(value_3)
	upvalues[1][2][upvalues[1][1]].current = value_2
	return
end

recovered.andromeda_is_fake_duck_2_p541 = function(upvalues, argument_1, ...)
  local value_0, value_1, value_2, value_3, value_4, value_10, value_12, value_13, value_14, value_23
  local value_24
	value_1 = argument_1
	value_13 = 296
	if not (value_13) then
		value_13 = 296
	end
	value_13 = value_13 + 25543
	value_13 = value_13 - 25838
	value_10[5] = value_13
	value_12[54] = 3
	local t20 = {...}
		value_1 = t20[1]
	value_2 = value_14 ~= value_0
	upvalues[0][2][upvalues[0][1]].e_peek = value_2
	value_2 = upvalues[0][2][upvalues[0][1]].manual
	if value_2 ~= value_0 then
		return value_2
	end
	value_2 = upvalues[1].antiaim.features.freestanding
	value_24 = value_2
	value_23 = value_2.get
	value_2 = value_2(value_3)
	repeat
		if value_2 then
			value_2 = "Freestanding"
			return value_2
		end
		value_2 = upvalues[2][2][upvalues[2][1]].air
		if value_2 then
			value_2 = "Air-crouch"
			if value_2 then
				return value_2
			else
				value_2 = "Air"
				local t18 = value_2(nil, t17)
				if t18 ~= nil then
					t17, value_3, value_4 = t18, t18, t23
				end
			end
			break
		end
	until t18 ~= nil
	value_2 = upvalues[2][2][upvalues[2][1]].ducked
	if not (value_2) then
		value_2 = upvalues[3].is_fake_duck()
	end
	if value_2 then
		value_2 = "Crouch-move"
	end
	if not (value_2) then
		value_2 = upvalues[3].is_slow_motion()
	end
	if not (value_2) then
		value_2 = "Move"
	end
	return value_2
end

recovered.andromeda_function_70_p542 = function(upvalues, ...)
  local value_0, value_1, value_3, value_4, value_5
	value_0 = value_0 / value_3
	value_4 = upvalues[0]
	value_5 = value_1
	value_4 = value_4(value_5)
	-- Luraph junk / invalid SSA expression removed
	if value_4 then
		upvalues[1][2][upvalues[1][1]].manual = value_0
		return
	end
end

recovered.andromeda_switch_type_3_p543 = function(upvalues, ...)
	local value_1, value_2
	value_1 = upvalues[0].switch_type
	value_2 = value_1
	value_1 = value_1.get(value_2)
	value_2 = value_1 == "Builder"
	if not (value_2) then
		value_2 = value_1 == "Defensive"
	end
	return value_2
end

recovered.measure_bomb_group_p544 = function(upvalues, argument_1, argument_2, argument_3, argument_4, ...)
  local value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_8, value_13, value_19
  local value_20, value_21
	value_1 = argument_1
	value_2 = argument_2
	value_3 = argument_3
	value_4 = argument_4
	value_5 = value_1.kind
	value_5 = value_5 == "bomb_planting"
	if value_5 then
		value_5 = upvalues[0].measure_planting_item
		value_6 = value_1
		value_7 = value_3
		value_8 = value_4
		value_5 = value_5(value_6, value_7, value_8)
	end
	value_20 = 71
	value_20 = math_helpers[7]
	value_21 = ""
	value_20 = value_20(value_21)
	value_20 = value_20 + 12084
	value_20 = value_20 - 11940
	value_13[32] = value_20
	value_19[92] = 56
	if not (value_5) then
		value_5 = upvalues[0].measure_item
		local t7 = value_6
		value_7 = nil < value_3
		value_8 = value_4
		value_5 = value_5(value_6, value_7, value_8)
	end
	value_8 = ""
	if not (value_7 == "number") then
		value_6 = 0
	end
	value_7 = upvalues[1][151]
	return 
end

recovered.andromeda_hidden_2_p545 = function(upvalues, ...)
  local value_0, value_4, value_6, value_7, value_15, value_21, value_22
	local t11
	value_22 = value_22 + 32951
	value_22 = value_22 - 32277
	value_15[99] = value_22
	value_21[115] = 95
	repeat
		if value_6 then
			break
		end
	until true
	value_7 = upvalues[1].defensive
	value_7 = value_7 ~= value_0
	if value_6 == value_0 then
	end
	local t12 = t12 + nil
	value_4 = t12
	if (nil > 0 or t12 + nil < nil) and (nil <= 0 or t12 + nil > nil) then
		return
	end
end

recovered.andromeda_function_71_p546 = function(upvalues, argument_1, argument_2, ...)
	local value_1, value_2, value_3
	value_1 = argument_1
	value_2 = argument_2
	value_3 = value_2
	value_3 = 180
	value_2 = value_3
	while true do
		-- Luraph junk / invalid SSA expression removed
		t23 = -t23
		-- Luraph junk / invalid SSA expression removed
		-- Luraph junk / invalid SSA expression removed
		-- Luraph junk / invalid SSA expression removed
		if t23 >= t24 then break end
		-- Luraph junk / invalid SSA expression removed
		t23 = t23 * 2
		-- Luraph junk / invalid SSA expression removed
		-- Luraph junk / invalid SSA expression removed
		-- Luraph junk / invalid SSA expression removed
		t23 = t23 + t24
		-- Luraph junk / invalid SSA expression removed
	end
	-- Luraph junk / invalid SSA expression removed
	-- Luraph junk / invalid SSA expression removed
	-- Luraph junk / invalid SSA expression removed
	return t23
end

recovered.is_enabled_3_p547 = function(upvalues, ...)
	local value_1, value_2, value_3, value_4
	if not (value_1) then
		value_1 = nil
	end
	value_2 = value_1.fakelag_exploit_enabled
	if not (value_2) then
		value_2 = nil
	end
	if value_3 then
		value_4 = value_2
		value_3 = value_2.get(value_4)
		value_3 = value_3 == true
	end
	return value_3
end

recovered.andromeda_function_72_p548 = function(upvalues, argument_1, ...)
  local value_1, value_10, value_12, value_13, value_22
	value_1 = argument_1
	value_13 = value_13 + 30377
	value_13 = value_13 - 30028
	value_10[36] = value_13
	value_12[12] = 34
	value_22[29] = 0
	value_22[51] = 34
	return
end

andromeda.recovered_functions = {
	["main"] = recovered.andromeda_main_p103,
	["save"] = recovered.save_p104,
	["b"] = recovered.andromeda_b_p105,
	["lerp"] = recovered.andromeda_lerp_p106,
	["alpha_modulate"] = recovered.alpha_modulate_p107,
	["velocity"] = recovered.andromeda_velocity_p108,
	["apply_smooth_animfix"] = recovered.apply_smooth_animfix_p109,
	["pre_render"] = recovered.pre_render_p110,
	["capture_smooth_state"] = recovered.andromeda_capture_smooth_state_p111,
	["gsub"] = recovered.andromeda_gsub_p112,
	["writefile"] = recovered.andromeda_writefile_p113,
	["get_gradient_alpha"] = recovered.andromeda_get_gradient_alpha_p114,
	["rep"] = recovered.andromeda_rep_p116,
	["name"] = recovered.andromeda_name_p122,
	["rep_2"] = recovered.andromeda_rep_2_p123,
	["build_maps"] = recovered.build_maps_p130,
	["segments"] = recovered.andromeda_segments_p131,
	["draw_background"] = recovered.draw_background_p132,
	["defensive_yaw_delayed_state"] = recovered.andromeda_defensive_yaw_delayed_state_p133,
	["forward"] = recovered.andromeda_forward_p134,
	["anti_backstab"] = recovered.andromeda_anti_backstab_p135,
	["k_d"] = recovered.andromeda_k_d_p136,
	["gap"] = recovered.andromeda_gap_p139,
	["paint_ui"] = recovered.paint_ui_p140,
	["m_fflags"] = recovered.andromeda_m_fflags_p141,
	["m_ntickbase"] = recovered.andromeda_m_ntickbase_p142,
	["value"] = recovered.andromeda_value_p143,
	["button"] = recovered.andromeda_button_p144,
	["find"] = recovered.andromeda_find_p146,
	["reset_disable_fakelag"] = recovered.reset_disable_fakelag_p148,
	["is_player_standing"] = recovered.is_player_standing_p149,
	["is_fake_duck"] = recovered.andromeda_is_fake_duck_p150,
	["update_callbacks"] = recovered.andromeda_update_callbacks_p151,
	["update_invalid_tick_cleaner"] = recovered.update_invalid_tick_cleaner_p152,
	["break_lc"] = recovered.break_lc_p153,
	["y"] = recovered.andromeda_y_p154,
	["ensure_defaults"] = recovered.ensure_defaults_p155,
	["get_entities"] = recovered.get_entities_p156,
	["safehead_active"] = recovered.andromeda_safehead_active_p157,
	["body"] = recovered.andromeda_body_p158,
	["is_quit"] = recovered.andromeda_is_quit_p159,
	["paint"] = recovered.paint_p162,
	["is_enabled"] = recovered.andromeda_is_enabled_p163,
	["planting_start_time"] = recovered.andromeda_planting_start_time_p164,
	["planting_duration"] = recovered.andromeda_planting_duration_p165,
	["apply_air_legs"] = recovered.apply_air_legs_p167,
	["quickpeek"] = recovered.andromeda_quickpeek_p168,
	["traverse"] = recovered.andromeda_traverse_p169,
	["hotkey"] = recovered.andromeda_hotkey_p170,
	["override"] = recovered.andromeda_override_p171,
	["override_2"] = recovered.andromeda_override_2_p172,
	["hidden"] = recovered.andromeda_hidden_p173,
	["is_left_side"] = recovered.is_left_side_p174,
	["restore_all"] = recovered.restore_all_p175,
	["clear_state"] = recovered.andromeda_clear_state_p176,
	["match"] = recovered.andromeda_match_p177,
	["xy"] = recovered.andromeda_xy_p178,
	["minimum_damage_override"] = recovered.andromeda_minimum_damage_override_p179,
	["handlers"] = recovered.andromeda_handlers_p180,
	["exploits"] = recovered.andromeda_exploits_p181,
	["delete"] = recovered.delete_p182,
	["sub"] = recovered.andromeda_sub_p184,
	["last_exploit_charged"] = recovered.andromeda_last_exploit_charged_p187,
	["r"] = recovered.andromeda_r_p188,
	["forward_2"] = recovered.andromeda_forward_2_p189,
	["onetap"] = recovered.andromeda_onetap_p190,
	["x"] = recovered.andromeda_x_p191,
	["unset_hitchance"] = recovered.unset_hitchance_p192,
	["spin"] = recovered.andromeda_spin_p194,
	["slots"] = recovered.andromeda_slots_p195,
	["handlers_2"] = recovered.andromeda_handlers_2_p196,
	["save_2"] = recovered.save_2_p197,
	["update_list"] = recovered.andromeda_update_list_p198,
	["remove_config"] = recovered.andromeda_remove_config_p199,
	["export_config"] = recovered.andromeda_export_config_p200,
	["import_config"] = recovered.andromeda_import_config_p201,
	["get_distance"] = recovered.get_distance_p202,
	["paint_invalid_tick_cleaner"] = recovered.paint_invalid_tick_cleaner_p203,
	["angles"] = recovered.andromeda_angles_p204,
	["safe_point"] = recovered.andromeda_safe_point_p205,
	["is_ping_spike"] = recovered.is_ping_spike_p206,
	["get_dpi_scale"] = recovered.get_dpi_scale_p207,
	["watermark_position"] = recovered.andromeda_watermark_position_p208,
	["set_visible"] = recovered.andromeda_set_visible_p209,
	["set_visible_2"] = recovered.andromeda_set_visible_2_p210,
	["set_visible_3"] = recovered.andromeda_set_visible_3_p211,
	["set_visible_4"] = recovered.andromeda_set_visible_4_p212,
	["set_visible_5"] = recovered.andromeda_set_visible_5_p214,
	["set_visible_6"] = recovered.andromeda_set_visible_6_p215,
	["m_ntickbase_2"] = recovered.andromeda_m_ntickbase_2_p217,
	["lower"] = recovered.andromeda_lower_p219,
	["angles_2"] = recovered.andromeda_angles_2_p222,
	["normalize"] = recovered.andromeda_normalize_p224,
	["userid"] = recovered.andromeda_userid_p225,
	["fps_optimization_options"] = recovered.andromeda_fps_optimization_options_p226,
	["cache"] = recovered.andromeda_cache_p227,
	["order"] = recovered.andromeda_order_p228,
	["handlers_3"] = recovered.andromeda_handlers_3_p229,
	["update_yaw_jitter"] = recovered.andromeda_update_yaw_jitter_p230,
	["get_gradient_alpha_2"] = recovered.andromeda_get_gradient_alpha_2_p231,
	["update"] = recovered.update_p232,
	["shutdown"] = recovered.shutdown_p233,
	["initialized"] = recovered.andromeda_initialized_p235,
	["packets"] = recovered.andromeda_packets_p236,
	["defensive_refraction_pitch_state"] = recovered.andromeda_defensive_refraction_pitch_state_p237,
	["bayonet"] = recovered.andromeda_bayonet_p238,
	["scout"] = recovered.andromeda_scout_p240,
	["slow_motion"] = recovered.andromeda_slow_motion_p241,
	["is_double_tap"] = recovered.is_double_tap_p242,
	["hitchance"] = recovered.andromeda_hitchance_p243,
	["get_raw_value"] = recovered.andromeda_get_raw_value_p244,
	["is_on_shot_antiaim"] = recovered.is_on_shot_antiaim_p245,
	["minimum_damage_override_2"] = recovered.andromeda_minimum_damage_override_2_p246,
	["configs_db"] = recovered.andromeda_configs_db_p247,
	["load_config"] = recovered.load_config_p248,
	["peeking_time"] = recovered.andromeda_peeking_time_p249,
	["fakelag_exploit_tick"] = recovered.andromeda_fakelag_exploit_tick_p250,
	["is_invalid_tick_cleaner_enabled"] = recovered.is_invalid_tick_cleaner_enabled_p251,
	["read_db"] = recovered.read_db_p252,
	["update_callbacks_2"] = recovered.andromeda_update_callbacks_2_p253,
	["g"] = recovered.andromeda_g_p256,
	["m_ikills"] = recovered.andromeda_m_ikills_p257,
	["d"] = recovered.andromeda_d_p258,
	["dpi"] = recovered.andromeda_dpi_p259,
	["bottom_left"] = recovered.andromeda_bottom_left_p262,
	["r_2"] = recovered.andromeda_r_2_p263,
	["build_encoded_payload"] = recovered.andromeda_build_encoded_payload_p264,
	["build_encoded_payload_2"] = recovered.andromeda_build_encoded_payload_2_p265,
	["set_int"] = recovered.andromeda_set_int_p266,
	["builder"] = recovered.andromeda_builder_p267,
	["switch_type"] = recovered.andromeda_switch_type_p268,
	["conditions"] = recovered.andromeda_conditions_p269,
	["set_visible_7"] = recovered.andromeda_set_visible_7_p270,
	["player_state"] = recovered.andromeda_player_state_p271,
	["fakelag"] = recovered.andromeda_fakelag_p272,
	["setup_command"] = recovered.setup_command_p273,
	["misc"] = recovered.andromeda_misc_p274,
	["match_2"] = recovered.andromeda_match_2_p275,
	["add_handles"] = recovered.add_handles_p276,
	["console_color"] = recovered.console_color_p279,
	["play_ui_armsrace_level_up_wav"] = recovered.andromeda_play_ui_armsrace_level_up_wav_p280,
	["swap_buffers"] = recovered.swap_buffers_p281,
	["g_2"] = recovered.andromeda_g_2_p283,
	["call_3"] = recovered.call_3_p288,
	["bit"] = recovered.andromeda_bit_p289,
	["draw_item"] = recovered.draw_item_p290,
	["apply"] = recovered.andromeda_apply_p292,
	["get_latency_time"] = recovered.andromeda_get_latency_time_p293,
	["restore_original"] = recovered.andromeda_restore_original_p294,
	["get_option_value"] = recovered.get_option_value_p295,
	["y_2"] = recovered.andromeda_y_2_p296,
	["stop_to_full_running_fraction"] = recovered.andromeda_stop_to_full_running_fraction_p298,
	["freestand_cache"] = recovered.andromeda_freestand_cache_p299,
	["override_prefer_body_aim"] = recovered.andromeda_override_prefer_body_aim_p300,
	["applied_body"] = recovered.andromeda_applied_body_p301,
	["sim_store"] = recovered.andromeda_sim_store_p302,
	["color_picker"] = recovered.andromeda_color_picker_p303,
	["find_2"] = recovered.andromeda_find_2_p304,
	["miss_counter"] = recovered.andromeda_miss_counter_p307,
	["simtime"] = recovered.andromeda_simtime_p308,
	["force_body_yaw"] = recovered.andromeda_force_body_yaw_p309,
	["applied"] = recovered.andromeda_applied_p310,
	["net_update_end"] = recovered.net_update_end_p311,
	["native_indicator_alpha"] = recovered.andromeda_native_indicator_alpha_p313,
	["eye_angles_y"] = recovered.andromeda_eye_angles_y_p314,
	["init_from_angles"] = recovered.andromeda_init_from_angles_p315,
	["entity"] = recovered.andromeda_entity_p316,
	["cvar"] = recovered.andromeda_cvar_p317,
	["cvar_2"] = recovered.andromeda_cvar_2_p318,
	["get_float"] = recovered.andromeda_get_float_p319,
	["round"] = recovered.andromeda_round_p320,
	["pcall"] = recovered.andromeda_pcall_p321,
	["c"] = recovered.andromeda_c_p322,
	["handlers_4"] = recovered.andromeda_handlers_4_p323,
	["shots"] = recovered.andromeda_shots_p324,
	["get_planting_progress"] = recovered.andromeda_get_planting_progress_p325,
	["draw_planting_item"] = recovered.draw_planting_item_p326,
	["draw_centered_text"] = recovered.draw_centered_text_p327,
	["get_icon_size"] = recovered.get_icon_size_p328,
	["ease_in"] = recovered.andromeda_ease_in_p329,
	["get_weapon_reload"] = recovered.get_weapon_reload_p330,
	["get_flag"] = recovered.get_flag_p331,
	["update_pitch"] = recovered.update_pitch_p332,
	["write_db"] = recovered.write_db_p333,
	["sort_items"] = recovered.sort_items_p335,
	["target"] = recovered.andromeda_target_p337,
	["update_callbacks_3"] = recovered.andromeda_update_callbacks_3_p338,
	["exploits_2"] = recovered.andromeda_exploits_2_p339,
	["get_simtime"] = recovered.get_simtime_p340,
	["force_body_yaw_value"] = recovered.andromeda_force_body_yaw_value_p341,
	["miss_counter_2"] = recovered.andromeda_miss_counter_2_p342,
	["is_quick_peek"] = recovered.andromeda_is_quick_peek_p343,
	["update_hitchance"] = recovered.update_hitchance_p344,
	["run_command"] = recovered.run_command_p345,
	["finish_command"] = recovered.finish_command_p346,
	["set_callback"] = recovered.set_callback_p347,
	["flags"] = recovered.andromeda_flags_p348,
	["update_hidden"] = recovered.update_hidden_p350,
	["cur_yaw"] = recovered.andromeda_cur_yaw_p352,
	["unset_aa"] = recovered.unset_aa_p353,
	["skip_native_cleanup"] = recovered.skip_native_cleanup_p354,
	["fast_ladder"] = recovered.andromeda_fast_ladder_p355,
	["fakeduck"] = recovered.andromeda_fakeduck_p357,
	["packets_2"] = recovered.andromeda_packets_2_p359,
	["packets_3"] = recovered.andromeda_packets_3_p360,
	["update_delay"] = recovered.update_delay_p361,
	["custom"] = recovered.andromeda_custom_p362,
	["timing"] = recovered.andromeda_timing_p363,
	["switch_count"] = recovered.andromeda_switch_count_p364,
	["slots_2"] = recovered.andromeda_slots_2_p365,
	["random_int"] = recovered.andromeda_random_int_p367,
	["solo"] = recovered.andromeda_solo_p368,
	["qhw"] = recovered.andromeda_qhw_p369,
	["update_body_yaw"] = recovered.update_body_yaw_p370,
	["get_hidden_meta_modifier_add"] = recovered.get_hidden_meta_modifier_add_p371,
	["is_left_side_2"] = recovered.andromeda_is_left_side_2_p372,
	["randomize"] = recovered.andromeda_randomize_p373,
	["slots_3"] = recovered.andromeda_slots_3_p374,
	["miss_counter_3"] = recovered.andromeda_miss_counter_3_p375,
	["measure_planting_item"] = recovered.measure_planting_item_p376,
	["forwardmove"] = recovered.andromeda_forwardmove_p377,
	["update_callbacks_4"] = recovered.andromeda_update_callbacks_4_p378,
	["update_callbacks_5"] = recovered.andromeda_update_callbacks_5_p379,
	["hitgroups"] = recovered.andromeda_hitgroups_p380,
	["handlers_5"] = recovered.andromeda_handlers_5_p382,
	["shutdown_2"] = recovered.shutdown_2_p384,
	["update_callback"] = recovered.update_callback_p385,
	["damage"] = recovered.andromeda_damage_p386,
	["g_3"] = recovered.andromeda_g_3_p387,
	["to_hex"] = recovered.to_hex_p388,
	["ease_out"] = recovered.andromeda_ease_out_p389,
	["push"] = recovered.push_p390,
	["capture_frame"] = recovered.andromeda_capture_frame_p392,
	["player_state_2"] = recovered.andromeda_player_state_2_p393,
	["setup_command_2"] = recovered.setup_command_2_p394,
	["handlers_6"] = recovered.andromeda_handlers_6_p395,
	["c_2"] = recovered.andromeda_c_2_p396,
	["sub_2"] = recovered.andromeda_sub_2_p398,
	["is_quick_peek_2"] = recovered.andromeda_is_quick_peek_2_p399,
	["dt"] = recovered.andromeda_dt_p400,
	["is_slow_motion"] = recovered.andromeda_is_slow_motion_p401,
	["normalize_text"] = recovered.normalize_text_p402,
	["normalize_text_2"] = recovered.normalize_text_2_p403,
	["render_items"] = recovered.andromeda_render_items_p404,
	["raw"] = recovered.andromeda_raw_p406,
	["raw_2"] = recovered.andromeda_raw_2_p407,
	["classify"] = recovered.classify_p409,
	["char"] = recovered.andromeda_char_p410,
	["stubs"] = recovered.andromeda_stubs_p412,
	["damage_paint"] = recovered.damage_paint_p413,
	["add"] = recovered.andromeda_add_p414,
	["update_defensive"] = recovered.update_defensive_p415,
	["get_player_health"] = recovered.get_player_health_p416,
	["updated_this_tick"] = recovered.andromeda_updated_this_tick_p417,
	["jitter"] = recovered.andromeda_jitter_p418,
	["custom_2"] = recovered.andromeda_custom_2_p419,
	["px"] = recovered.andromeda_px_p420,
	["get_animation_alpha"] = recovered.get_animation_alpha_p421,
	["closest_enemy"] = recovered.closest_enemy_p422,
	["delay_call"] = recovered.andromeda_delay_call_p423,
	["rep_3"] = recovered.andromeda_rep_3_p424,
	["unset_event_callback"] = recovered.andromeda_unset_event_callback_p430,
	["hmac_sha256"] = recovered.andromeda_hmac_sha256_p431,
	["realm"] = recovered.andromeda_realm_p432,
	["is_force_baim"] = recovered.is_force_baim_p434,
	["gsub_2"] = recovered.andromeda_gsub_2_p435,
	["char_2"] = recovered.andromeda_char_2_p436,
	["gsub_3"] = recovered.andromeda_gsub_3_p437,
	["gmatch"] = recovered.andromeda_gmatch_p438,
	["sort"] = recovered.andromeda_sort_p439,
	["p"] = recovered.andromeda_p_p443,
	["match_3"] = recovered.andromeda_match_3_p444,
	["cl_updaterate"] = recovered.andromeda_cl_updaterate_p446,
	["is_enabled_2"] = recovered.is_enabled_2_p447,
	["stubs_2"] = recovered.andromeda_stubs_2_p448,
	["build_maps_2"] = recovered.andromeda_build_maps_2_p449,
	["is_force_safe_point"] = recovered.andromeda_is_force_safe_point_p451,
	["order_2"] = recovered.andromeda_order_2_p452,
	["builder_2"] = recovered.andromeda_builder_2_p453,
	["freestanding"] = recovered.andromeda_freestanding_p454,
	["double"] = recovered.andromeda_double_p455,
	["fx"] = recovered.andromeda_fx_p458,
	["random_float"] = recovered.andromeda_random_float_p459,
	["normalize_2"] = recovered.andromeda_normalize_2_p460,
	["random_int_2"] = recovered.andromeda_random_int_2_p461,
	["get_ticks"] = recovered.get_ticks_p464,
	["get_overpredict_multiplier"] = recovered.get_overpredict_multiplier_p465,
	["overpredict"] = recovered.andromeda_overpredict_p466,
	["animations"] = recovered.andromeda_animations_p467,
	["m_fflags_2"] = recovered.andromeda_m_fflags_2_p469,
	["leg_movement"] = recovered.andromeda_leg_movement_p470,
	["override_3"] = recovered.andromeda_override_3_p471,
	["is_bomb_main_kind"] = recovered.is_bomb_main_kind_p472,
	["find_bomb_subitem_index"] = recovered.find_bomb_subitem_index_p473,
	["measure_items"] = recovered.measure_items_p474,
	["fakelag_exploit_enabled"] = recovered.andromeda_fakelag_exploit_enabled_p475,
	["skip_native_cleanup_2"] = recovered.andromeda_skip_native_cleanup_2_p476,
	["id"] = recovered.andromeda_id_p477,
	["attacker"] = recovered.andromeda_attacker_p478,
	["skip_native_cleanup_3"] = recovered.andromeda_skip_native_cleanup_3_p480,
	["m_fflags_3"] = recovered.andromeda_m_fflags_3_p481,
	["m_flduckamount"] = recovered.andromeda_m_flduckamount_p482,
	["is_quit_2"] = recovered.andromeda_is_quit_2_p483,
	["enemy_resolver"] = recovered.andromeda_enemy_resolver_p484,
	["enemy_resolver_output"] = recovered.andromeda_enemy_resolver_output_p485,
	["testing_2"] = recovered.andromeda_testing_2_p486,
	["encode"] = recovered.encode_p488,
	["update_2"] = recovered.update_2_p489,
	["set_raw_int"] = recovered.andromeda_set_raw_int_p490,
	["viewmodel_offset_y"] = recovered.andromeda_viewmodel_offset_y_p491,
	["cvar_3"] = recovered.andromeda_cvar_3_p492,
	["viewmodel_offset_y_2"] = recovered.andromeda_viewmodel_offset_y_2_p493,
	["viewmodel_fov"] = recovered.andromeda_viewmodel_fov_p494,
	["viewmodel_offset_x"] = recovered.andromeda_viewmodel_offset_x_p495,
	["viewmodel_offset_y_3"] = recovered.andromeda_viewmodel_offset_y_3_p496,
	["viewmodel_offset_z"] = recovered.andromeda_viewmodel_offset_z_p497,
	["reset_disable_fakelag_2"] = recovered.andromeda_reset_disable_fakelag_2_p498,
	["last_exploit_charged_2"] = recovered.andromeda_last_exploit_charged_2_p500,
	["packets_4"] = recovered.andromeda_packets_4_p501,
	["builder_3"] = recovered.andromeda_builder_3_p502,
	["hit"] = recovered.andromeda_hit_p503,
	["aim_fire"] = recovered.aim_fire_p504,
	["build_payload"] = recovered.andromeda_build_payload_p505,
	["anti_aim"] = recovered.andromeda_anti_aim_p507,
	["is_dt_indicator_kind"] = recovered.is_dt_indicator_kind_p508,
	["rounded_rectangle"] = recovered.rounded_rectangle_p509,
	["ccsplayer"] = recovered.andromeda_ccsplayer_p510,
	["fakelag_2"] = recovered.andromeda_fakelag_2_p512,
	["jitter_2"] = recovered.andromeda_jitter_2_p514,
	["x_2"] = recovered.andromeda_x_2_p515,
	["ref"] = recovered.andromeda_ref_p516,
	["cvar_4"] = recovered.andromeda_cvar_4_p519,
	["bomb_planting"] = recovered.andromeda_bomb_planting_p520,
	["ccsplayer_2"] = recovered.andromeda_ccsplayer_2_p521,
	["px_2"] = recovered.andromeda_px_2_p522,
	["get_order"] = recovered.get_order_p523,
	["switch_type_2"] = recovered.andromeda_switch_type_2_p524,
	["get_icon_offset"] = recovered.get_icon_offset_p525,
	["textures"] = recovered.andromeda_textures_p526,
	["is_quit_3"] = recovered.andromeda_is_quit_3_p527,
	["get_font_size"] = recovered.get_font_size_p528,
	["dist"] = recovered.andromeda_dist_p531,
	["get_segment_color"] = recovered.get_segment_color_p532,
	["apply_move_lean"] = recovered.apply_move_lean_p533,
	["g_4"] = recovered.andromeda_g_4_p534,
	["ref_2"] = recovered.andromeda_ref_2_p535,
	["fps_optimization"] = recovered.andromeda_fps_optimization_p537,
	["features"] = recovered.andromeda_features_p538,
	["update_list_2"] = recovered.andromeda_update_list_2_p539,
	["is_fake_duck_2"] = recovered.andromeda_is_fake_duck_2_p541,
	["switch_type_3"] = recovered.andromeda_switch_type_3_p543,
	["measure_bomb_group"] = recovered.measure_bomb_group_p544,
	["hidden_2"] = recovered.andromeda_hidden_2_p545,
	["is_enabled_3"] = recovered.is_enabled_3_p547,
}
andromeda.menu_handler_prototypes = {
	p115 = recovered.andromeda_function_p115,
	p122 = recovered.andromeda_name_p122,
	p151 = recovered.andromeda_update_callbacks_p151,
	p163 = recovered.andromeda_is_enabled_p163,
	p180 = recovered.andromeda_handlers_p180,
	p229 = recovered.andromeda_handlers_3_p229,
	p232 = recovered.update_p232,
	p250 = recovered.andromeda_fakelag_exploit_tick_p250,
	p280 = recovered.andromeda_play_ui_armsrace_level_up_wav_p280,
	p317 = recovered.andromeda_cvar_p317,
	p318 = recovered.andromeda_cvar_2_p318,
	p323 = recovered.andromeda_handlers_4_p323,
	p379 = recovered.andromeda_update_callbacks_5_p379,
	p382 = recovered.andromeda_handlers_5_p382,
	p385 = recovered.update_callback_p385,
	p392 = recovered.andromeda_capture_frame_p392,
	p395 = recovered.andromeda_handlers_6_p395,
	p423 = recovered.andromeda_delay_call_p423,
	p432 = recovered.andromeda_realm_p432,
	p445 = recovered.update_callbacks_2_p445,
	p475 = recovered.andromeda_fakelag_exploit_enabled_p475,
	p489 = recovered.update_2_p489,
	p493 = recovered.andromeda_viewmodel_offset_y_2_p493,
	p494 = recovered.andromeda_viewmodel_fov_p494,
	p495 = recovered.andromeda_viewmodel_offset_x_p495,
	p496 = recovered.andromeda_viewmodel_offset_y_3_p496,
	p497 = recovered.andromeda_viewmodel_offset_z_p497,
	p507 = recovered.andromeda_anti_aim_p507,
	p537 = recovered.andromeda_fps_optimization_p537,
	p543 = recovered.andromeda_switch_type_3_p543,
}
andromeda.create_extrapolation_overpredict = create_extrapolation_overpredict
andromeda.load_dependencies = load_andromeda_dependencies
andromeda.build_builtin_references = build_builtin_references
andromeda.build_menu = build_andromeda_menu
andromeda.event_handler_prototypes = ANDROMEDA_EVENT_HANDLERS
-- Shared upvalue bag (Luraph destroyed real captures; provide safe stubs)
local shared_state = {
	viewmodel = {
		get = function()
			return false
		end,
	},
	viewmodel_fov = 90,
	viewmodel_offset_x = 0,
	viewmodel_offset_y = 0,
	viewmodel_offset_z = 0,
	menu = nil,
	references = nil,
	dependencies = nil,
}

local upvalue_bag = { [0] = shared_state }

-- Safe wrapper: never crash the whole script on one dead recovered handler
local function safe_bind(fn, bag)
	return function(...)
		local ok, a, b, c, d, e = pcall(fn, bag, ...)
		if not ok then
			-- swallow recovered CF errors after menu is up
			return
		end
		return a, b, c, d, e
	end
end

andromeda.entry = function()
	return recovered.andromeda_main_p103(upvalue_bag)
end

-- Patch main's handler binding to use safe_bind + same bag
local _orig_main = recovered.andromeda_main_p103
recovered.andromeda_main_p103 = function(upvalues, environment, ...)
	upvalues = upvalues or upvalue_bag
	if upvalues[0] == nil then
		upvalues[0] = shared_state
	end

	local dependencies = load_andromeda_dependencies()
	local builtin_refs = build_builtin_references(ui)
	local prototypes = andromeda.menu_handler_prototypes or {}
	local handlers = {}

	for key, prototype in pairs(prototypes) do
		if type(prototype) == "function" then
			handlers[key] = safe_bind(prototype, upvalues)
		end
	end

	local menu, groups = build_andromeda_menu(dependencies.pui, handlers, builtin_refs)

	shared_state.menu = menu
	shared_state.references = builtin_refs
	shared_state.dependencies = dependencies
	upvalues[0] = shared_state

	local context = {
		dependencies = dependencies,
		references = builtin_refs,
		menu = menu,
		groups = groups,
		handlers = handlers,
		upvalues = upvalues,
	}

	-- Hide / show native Gamesense AA builder when Andromeda controls AA
	local function collect_refs(t, out)
		if t == nil then return end
		if type(t) == "number" or type(t) == "userdata" then
			out[#out + 1] = t
			return
		end
		if type(t) == "table" then
			-- pui / multi-ref
			if t[1] ~= nil and (type(t[1]) == "number" or type(t[1]) == "userdata") then
				for _, v in ipairs(t) do
					if type(v) == "number" or type(v) == "userdata" then
						out[#out + 1] = v
					end
				end
				return
			end
			for _, v in pairs(t) do
				collect_refs(v, out)
			end
		end
	end

	local native_aa_refs = {}
	if builtin_refs and builtin_refs.antiaim then
		collect_refs(builtin_refs.antiaim.angles, native_aa_refs)
		collect_refs(builtin_refs.antiaim.fakelag, native_aa_refs)
		collect_refs(builtin_refs.antiaim.other, native_aa_refs)
	end

	local function set_native_aa_visible(visible)
		for _, ref in ipairs(native_aa_refs) do
			pcall(ui.set_visible, ref, visible)
		end
	end

	local function update_native_aa_visibility()
		if not menu or not menu.switch then
			return
		end
		local tab = menu.switch:get()
		local stype = menu.switch_type and menu.switch_type:get() or "Builder"
		-- Show native AA only on Anti-Aim + Gamesense mode; otherwise Andromeda owns the builder
		-- Always hide native Skeet AA builder — Andromeda owns AA
		set_native_aa_visible(false)
	end

	-- initial hide
	set_native_aa_visible(false)

	if menu.switch and menu.switch.set_callback then
		menu.switch:set_callback(function()
			update_native_aa_visibility()
		end)
	end
	if menu.switch_type and menu.switch_type.set_callback then
		menu.switch_type:set_callback(function()
			update_native_aa_visibility()
		end)
	end

	if client and client.set_event_callback then
		client.set_event_callback("paint_ui", function()
			update_native_aa_visibility()
		end)
		client.set_event_callback("shutdown", function()
			set_native_aa_visible(true)
		end)
	end

	if type(ANDROMEDA_EVENT_HANDLERS) == "table" and client and client.set_event_callback then
		for event_name, handler_key in pairs(ANDROMEDA_EVENT_HANDLERS) do
			local callback = handlers[handler_key]
			if callback ~= nil then
				client.set_event_callback(event_name, callback)
			end
		end
	end

	return context
end

local ok, err = pcall(function()
	local ctx = andromeda.entry()
	_G.andromeda_ctx = ctx
	print("[Andromeda] menu started OK")
	if ctx and ctx.menu and ctx.menu.switch_title then
		print("[Andromeda] look in AA → Anti-aimbot angles")
	end
end)

if not ok then
	print("[Andromeda] START ERROR: " .. tostring(err))
	if client and client.error_log then
		client.error_log("[Andromeda] " .. tostring(err))
	end
end

return andromeda
