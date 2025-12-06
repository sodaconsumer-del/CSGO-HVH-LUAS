ffi.cdef("    typedef void*(__thiscall* get_client_entity_t)(void*, int);\n\n    typedef struct {\n        char pad_0000[20];\n        int m_nOrder;\n        int m_nSequence;\n        float m_flPrevCycle;\n        float m_flWeight;\n        float m_flWeightDeltaRate;\n        float m_flPlaybackRate;\n        float m_flCycle;\n        void *m_pOwner;\n        char pad_0038[4];\n    } c_animlayers;\n");
local v0 = {
    clipboard = require("neverlose/clipboard"), 
    base64 = require("neverlose/base64"), 
    animations = require("neverlose/animations"), 
    drag_system = require("neverlose/drag_system"), 
    smoothy = require("neverlose/smoothy")
};
local v1 = panorama.loadstring("    return {\n        stringify: JSON.stringify,\n        parse: JSON.parse\n    };\n")();
local v2 = {
    calibri_custom = render.load_font("Calibri Bold", vector(25, 22, -1), "a, d"), 
    calibri_custom_t = render.load_font("Calibri Bold", vector(23, 22, -1), "a, d"), 
    verdana_22 = render.load_font("Verdana", 22, "a, b, d")
};
local v3 = {
    dormant_aimbot = ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot"), 
    peek_assist = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist"), 
    hide_shots = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"), 
    options = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options"), 
    double_tap = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"), 
    lag_options = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"), 
    hit_chance = ui.find("Aimbot", "Ragebot", "Selection", "Hit Chance"), 
    minimum_damage = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"), 
    auto_scope = ui.find("Aimbot", "Ragebot", "Accuracy", "Auto Scope"), 
    auto_stop = ui.find("Aimbot", "Ragebot", "Accuracy", "Auto Stop"), 
    body_aim = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim"), 
    safe_points = ui.find("Aimbot", "Ragebot", "Safety", "Safe Points"), 
    fake_duck = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"), 
    slow_walk = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"), 
    leg_movement = ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"), 
    enabled_anti_aim = ui.find("Aimbot", "Anti Aim", "Angles", "Enabled"), 
    pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"), 
    yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"), 
    yaw_base = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"), 
    yaw_offset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"), 
    yaw_avoid_backstab = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab"), 
    yaw_hidden = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden"), 
    yaw_modifier = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"), 
    yaw_modifier_offset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"), 
    body_yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"), 
    body_yaw_inverter = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"), 
    body_yaw_left_limit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"), 
    body_yaw_right_limit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"), 
    body_yaw_options = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"), 
    body_yaw_freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding"), 
    freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"), 
    freestanding_disable_yaw_modifiers = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Disable Yaw Modifiers"), 
    freestanding_body = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Body Freestanding"), 
    extended_angles = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles"), 
    extended_pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles", "Extended Pitch"), 
    extended_roll = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles", "Extended Roll"), 
    transparency = ui.find("Visuals", "Players", "Self", "Chams", "Model", "Transparency"), 
    scope_overlay = ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay"), 
    illumination = ui.find("Visuals", "World", "Ambient", "Illumination"), 
    log_events = ui.find("Miscellaneous", "Main", "Other", "Log Events"), 
    clan_tag = ui.find("Miscellaneous", "Main", "In-Game", "Clan Tag"), 
    fake_latency = ui.find("Miscellaneous", "Main", "Other", "Fake Latency")
};
local v4 = {
    selection = ui.create("Selection"), 
    information = ui.create("Information"), 
    configs = ui.create("Configs", 2), 
    recommendations = ui.create("Recommendations", 2), 
    anti_aim_settings = ui.create("Settings"), 
    main = ui.create("Main"), 
    anti_aim_automatic_mode = ui.create("Automatic Mode", 2), 
    modifications = ui.create("Modifications"), 
    movement = ui.create("Movement")
};
local v5 = {};
local v6 = {};
local v7 = {};
local v8 = {};
local v9 = {};
local v10 = {};
local v11 = {};
local v12 = {
    [1] = "Standing", 
    [2] = "Moving", 
    [3] = "Slow Walking", 
    [4] = "Crouching", 
    [5] = "In Air", 
    [6] = "In Air & Crouching", 
    [7] = "On Use"
};
local v13 = {
    [1] = "Default", 
    [2] = "Standing", 
    [3] = "Moving", 
    [4] = "Slow Walking", 
    [5] = "Crouching", 
    [6] = "In Air", 
    [7] = "In Air & Crouching", 
    [8] = "No Exploits", 
    [9] = "On Use"
};
local v14 = {
    [1] = "\194\160", 
    [2] = "\194\160\194\160", 
    [3] = "\194\160\194\160\194\160", 
    [4] = "\194\160\194\160\194\160\194\160", 
    [5] = "\194\160\194\160\194\160\194\160\194\160", 
    [6] = "\194\160\194\160\194\160\194\160\194\160\194\160", 
    [7] = "\194\160\194\160\194\160\194\160\194\160\194\160\194\160", 
    [8] = "\194\160\194\160\194\160\194\160\194\160\194\160\194\160\194\160", 
    [9] = "\194\160\194\160\194\160\194\160\194\160\194\160\194\160\194\160\194\160"
};
local v15 = {
    [1] = "AutoSnipers", 
    [2] = "AWP", 
    [3] = "SSG-08", 
    [4] = "R8 Revolver", 
    [5] = "Taser"
};
local v16 = {};
v5.welcome = v4.information:label("");
v5.update = v4.information:label("");
v5.export_config = v4.configs:button("", nil, true);
v5.import_config = v4.configs:button("", nil, true);
v5.default_config = v4.configs:button("", nil, true);
v5.youtube = v4.recommendations:button("", function()
    panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://www.youtube.com/@Karlox1337");
end, true);
v5.discord = v4.recommendations:button("", function()
    panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://discord.gg/Smu6trvfJ5");
end, true);
v5.selection = v4.selection:list("", "General", "Ragebot", "Anti Aim", "Visuals", "Misc");
v5.aimbot_logs = v4.main:switch("\239\149\160  Aimbot Logs");
v5.aimbot_logs_events = v5.aimbot_logs:create():selectable("Events", "Aimbot Shots", "Purchases", "Receives");
v5.aimbot_logs_output = v5.aimbot_logs:create():selectable("Output", "Default", "Console");
v5.aimbot_logs_color = v5.aimbot_logs:create():color_picker("Accent Color", color(145, 175, 255, 255));
v5.hit_chance_modifications = v4.main:switch("\239\153\136  Hit Chance Mode");
v5.hit_chance_modifications_disable_air_strafe = v5.hit_chance_modifications:create():switch("Disable Air Strafe"):tooltip("Turns off air strafe when you don't move.");
v5.hit_chance_modifications_weapons = v5.hit_chance_modifications:create():list("", v15);
for v17 = 1, #v15 do
    v16[v17] = {
        enabled = v5.hit_chance_modifications:create():switch("Enabled" .. v14[v17]), 
        states = v5.hit_chance_modifications:create():selectable("States" .. v14[v17], "In Air", "No Scope"), 
        in_air_hit_chance = v5.hit_chance_modifications:create():slider("In Air" .. v14[v17], 0, 100, 50, 1, "%"), 
        no_scope_hit_chance = v5.hit_chance_modifications:create():slider("No Scope" .. v14[v17], 0, 100, 50, 1, "%"), 
        no_scope_distance = v5.hit_chance_modifications:create():slider("Distance" .. v14[v17], 40, 201, 40, 0.1, function(v18)
            return v18 >= 40 and v18 < 201 and v18 * 0.1 .. "m" or "Inf.";
        end)
    };
end;
v5.discharge_exploit = v4.main:switch("\239\131\167  Discharge Exploit");
v5.discharge_exploit_weapons = v5.discharge_exploit:create():listable("", "Pistols", "AutoSnipers", "AWP", "SSG-08", "Desert Eagle", "Knife", "Taser");
v5.dormant_aimbot = v4.main:switch("\239\155\162  Dormant Aimbot");
v5.dormant_aimbot_min_damage = v5.dormant_aimbot:create():slider("Min. Damage", 0, 130, 0, 1, function(v19)
    if v19 == 0 then
        return "Auto";
    elseif v19 > 100 then
        return "+" .. v19 - 100;
    else
        return;
    end;
end);
v5.air_lag_exploit = v4.main:switch("\238\147\162  Air Lag Exploit");
v5.better_scope_overlay = v4.main:switch("\239\129\155  Better Scope Overlay");
v5.better_scope_overlay_line = v5.better_scope_overlay:create():slider("Line", 1, 100, 12, 1, "px");
v5.better_scope_overlay_gap = v5.better_scope_overlay:create():slider("Gap", 1, 50, 4, 1, "px");
v5.better_scope_overlay_exclude_lines = v5.better_scope_overlay:create():selectable("Exclude Lines", "Left\194\160", "Top\194\160", "Right\194\160", "Bottom\194\160");
v5.better_scope_overlay_spread_based = v5.better_scope_overlay:create():switch("Inaccuracy");
v5.better_scope_overlay_accent_color = v5.better_scope_overlay:create():color_picker("Accent Color", color(255, 255, 255, 200));
v5.better_scope_overlay_additional_color = v5.better_scope_overlay:create():color_picker("Additional Color", color(255, 255, 255, 0));
v5.crosshair_indicators = v4.main:switch("\239\153\129  Crosshair Indicators");
v5.crosshair_indicators_accent_color = v5.crosshair_indicators:create():color_picker("Accent Color", color(255, 255, 255, 255));
v5.crosshair_indicators_additional_color = v5.crosshair_indicators:create():color_picker("Additional Color", color(145, 175, 255, 255));
v5.damage_indicator = v4.main:switch("\238\144\156  Damage Indicator");
v5.damage_indicator_animation = v5.damage_indicator:create():switch("Disable Animation");
v5.skeet_indicators = v4.main:switch("\239\151\189  \aEAEAEAFFGame\a95B806FFSense \aDEFAULTIndicators");
v5.skeet_indicators_selection = v5.skeet_indicators:create():listable("", "Force Body Aim", "Force Safe Points", "Hit Chance", "Spectators", "Fake Latency", "Aimbot Stats", "Hide Shots", "Double Tap", "Fake Duck", "Freestanding", "Minimum Damage", "Bomb Information");
v5.skeet_indicators_break_lc_indicator = v5.skeet_indicators:create():switch("Break LC Indicator");
v5.skeet_indicators_break_lc_indicator_color = v5.skeet_indicators_break_lc_indicator:color_picker(color(130, 195, 20, 250));
v5.manual_arrows = v4.main:switch("\239\130\142  Manual Arrows");
v5.manual_arrows_alternative = v5.manual_arrows:create():switch("Alternative Arrows");
v5.manual_arrows_color = v5.manual_arrows:create():color_picker("Accent Color", color(145, 175, 255, 255));
v5.manual_desync_color = v5.manual_arrows:create():color_picker("Additional Color", color(145, 175, 255, 255));
v5.velocity_warning = v4.main:switch("\238\149\135  Velocity Warning");
v5.velocity_warning_accent_color = v5.velocity_warning:color_picker(color(145, 175, 255, 255));
v5.velocity_warning_x = v4.main:slider("Velocity X", 0, render.screen_size().x, render.screen_size().x / 2 - 100);
v5.velocity_warning_y = v4.main:slider("Velocity Y", 0, render.screen_size().y, render.screen_size().y / 9);
v5.keep_model_transparency = v4.main:switch("\239\131\129  Keep Model Transparency");
v5.set_aspect_ratio = function(v20)
    local v21 = render.screen_size();
    local v22 = v21.x * v20 / v21.y;
    if v20 == 1 then
        v22 = 0;
    end;
    cvar.r_aspectratio:float(tonumber(v22));
end;
v5.gcd = function(v23, v24)
    while v23 ~= 0 do
        local v25 = math.fmod(v24, v23);
        v24 = v23;
        v23 = v25;
    end;
    return v24;
end;
v5.on_aspect_ratio_changed = function()
    -- upvalues: v5 (ref)
    local v26 = 2 - v5.aspect_ratio:get() * 0.01;
    v5.set_aspect_ratio(v26);
end;
v5.setup = function(v27)
    -- upvalues: v5 (ref), v4 (ref)
    screen_size = v27;
    local v28 = {};
    for v29 = 1, 200 do
        local v30 = (200 - v29) * 0.01;
        local v31 = v5.gcd(screen_size.x * v30, screen_size.y);
        if screen_size.x * v30 / v31 < 100 or v30 == 1 then
            table.insert(v28, v29, screen_size.x * v30 / v31 .. ":" .. screen_size.y / v31);
        end;
    end;
    if v5.aspect_ratio ~= nil then
        v5.aspect_ratio:visibility(false);
    end;
    v5.aspect_ratio = v4.main:slider("\239\148\176  Aspect Ratio", 0, 180, 100, 1, function(v32)
        -- upvalues: v28 (ref)
        if v28[v32] ~= nil then
            return v28[v32];
        else
            return v32 .. "%";
        end;
    end);
    v5.aspect_ratio:set_callback(v5.on_aspect_ratio_changed, true);
end;
v5.setup(render.screen_size());
v5.animation_breakers = v4.modifications:switch("\238\149\145  Animation Breakers"):tooltip("Forces specific animations on the player. Client-side only.");
v5.legs_breaker = v5.animation_breakers:create():combo("Legs Breaker", "Disabled", "Static", "Walking"):tooltip("Enables the playback of the animation of legs.");
v5.legs_in_air = v5.animation_breakers:create():combo("Legs in Air", "Disabled", "Static", "Walking"):tooltip("Enables the playback of the animation of legs in air.");
v5.sliding_elements = v5.animation_breakers:create():selectable("Sliding Elements", "Walking", "Moving", "Crouching"):tooltip("Enables the playback of the sliding animation in different states.");
v5.move_lean_force = v5.animation_breakers:create():slider("Move Lean Force", -1, 100, -1, nil, function(v33)
    return v33 == -1 and "Def." or v33 .. "%";
end):tooltip("Enables the playback of the moving lean animation from the 12th animation layer.");
v5.landing_pitch = v5.animation_breakers:create():switch("Landing Pitch"):tooltip("Makes the pitch angle appear to be zero degrees during playback of the landing animation.");
v5.viewmodel = v4.modifications:switch("\238\134\168  Viewmodel");
v5.viewmodel_fov = v5.viewmodel:create():slider("Field of View", 300, 1350, 600, 0.1);
v5.viewmodel_x = v5.viewmodel:create():slider("Offset X", -100, 100, 10, 0.1);
v5.viewmodel_y = v5.viewmodel:create():slider("Offset Y", -100, 100, 10, 0.1);
v5.viewmodel_z = v5.viewmodel:create():slider("Offset Z", -100, 100, -10, 0.1);
v5.viewmodel_opposite_knife_hand = v5.viewmodel:create():switch("Opposite Knife Hand");
v5.viewmodel_reset = v5.viewmodel:create():button("", function()
    -- upvalues: v5 (ref)
    if v5.viewmodel:get() == false then
        return;
    else
        v5.viewmodel_fov:set(600);
        v5.viewmodel_x:set(10);
        v5.viewmodel_y:set(10);
        v5.viewmodel_z:set(-10);
        return;
    end;
end, true);
v5.console_modulation = v4.main:switch("\239\132\161  VGUI Modulation");
v5.console_modulation_color = v5.console_modulation:color_picker(color(81, 81, 81, 210));
v5.unmute_silenced_players = v4.main:switch("\239\139\162  Unmute Silenced Players");
v5.icon_notification = v4.main:switch("\238\138\158  Taskbar Notification"):tooltip("If you're tabbed out, the game icon will flash if the new round started so that you don't miss it.");
v5.clan_tag = v4.main:switch("\239\128\172  Clan Tag");
v5.unlock_fake_latency = v4.main:switch("\239\130\156  Unlock Fake Latency");
v5.fast_ladder_move = v4.movement:switch("\239\151\133  Fast Ladder Move"):tooltip("Allows you to climb ladders faster.");
v5.no_fall_damage = v4.movement:switch("\238\149\134  No Fall Damage"):tooltip("Attempts to perform a jumpbug when possible.");
v5.avoid_backstab = v4.main:switch("\239\155\181  Avoid Backstab");
v5.edge_yaw = v4.main:switch("\238\146\187  Edge Yaw");
v5.edge_yaw_disablers = v5.edge_yaw:create():selectable("Disablers", "Standing", "Moving", "Slow Walking", "Crouching", "In Air");
v5.freestanding = v4.main:switch("\239\139\177  Freestanding");
v5.freestanding_disable_yaw_modifiers = v5.freestanding:create():switch("Disable Yaw Modifiers");
v5.freestanding_body = v5.freestanding:create():switch("Body Freestanding");
v5.freestanding_safe_anti_aim = v5.freestanding:create():switch("Disable Hidden Anti Aim");
v5.freestanding_disablers = v5.freestanding:create():selectable("Disablers", "Standing", "Moving", "Slow Walking", "Crouching", "In Air");
v5.manual_yaw = v4.main:combo("\239\130\178  Manual Yaw", "Disabled", "Forward", "Backward", "Right", "Left");
v5.manual_yaw_disable_yaw_modifiers = v5.manual_yaw:create():switch("Disable Yaw Modifiers");
v5.manual_yaw_disable_body_yaw = v5.manual_yaw:create():switch("Disable Body Yaw");
v5.manual_yaw_edge = v5.manual_yaw:create():switch("Edge Hidden Yaw");
v5.safe_head = v4.main:switch("\239\148\133  Safe Head");
v5.safe_head_hidden_anti_aim = v5.safe_head:create():switch("Hidden Anti Aim");
v5.safe_head_hidden_pitch = v5.safe_head:create():combo("Pitch", "Disabled", "Automatic", "Random", "Switch", "Custom");
v5.safe_head_hidden_pitch_offset1 = v5.safe_head:create():slider("Offset #1", -89, 89, 0, 1, "\194\176");
v5.safe_head_hidden_pitch_offset2 = v5.safe_head:create():slider("Offset #2", -89, 89, 0, 1, "\194\176");
v5.safe_head_hidden_pitch_delay = v5.safe_head:create():slider("Delay", 2, 10, 2, 1, "t");
v5.safe_head_hidden_yaw = v5.safe_head:create():combo("Yaw", "Default", "Sideways", "Random", "Custom");
v5.safe_head_hidden_yaw_offset = v5.safe_head:create():slider("Offset", -180, 180, 0, 1, "\194\176");
v5.mode = v4.anti_aim_settings:list("", "\240\159\152\142  Automatic Mode", "\240\159\155\160\239\184\143  Conditional");
v5.automatic_mode_force_break_lc = v4.anti_aim_settings:switch("\239\129\144  Force Break LC");
v5.automatic_mode_force_break_lc_choice = v5.automatic_mode_force_break_lc:create():listable("", v12);
v5.automatic_mode_hidden_anti_aim = v4.anti_aim_settings:switch("\239\130\132  Hidden Anti Aim");
v5.automatic_mode_hidden_anti_aim_states = v5.automatic_mode_hidden_anti_aim:create():combo("Current State", v12);
v5.mode_text = v4.anti_aim_automatic_mode:label("You are using automatic mode.\nEverything basic is already set up. Enjoy!");
for v34 = 1, #v12 do
    v9[v34] = {
        hidden_pitch = v5.automatic_mode_hidden_anti_aim:create():combo("Pitch" .. v14[v34], "Disabled", "Automatic", "Random", "Switch", "Custom"), 
        hidden_pitch_offset1 = v5.automatic_mode_hidden_anti_aim:create():slider("Offset #1" .. v14[v34], -89, 89, 0, 1, "\194\176"), 
        hidden_pitch_offset2 = v5.automatic_mode_hidden_anti_aim:create():slider("Offset #2" .. v14[v34], -89, 89, 0, 1, "\194\176"), 
        hidden_pitch_delay = v5.automatic_mode_hidden_anti_aim:create():slider("Delay" .. v14[v34], 2, 10, 2, 1, "t"), 
        hidden_yaw = v5.automatic_mode_hidden_anti_aim:create():combo("Yaw" .. v14[v34], "Default", "Sideways", "Random", "Custom"), 
        hidden_yaw_offset = v5.automatic_mode_hidden_anti_aim:create():slider("Offset" .. v14[v34], -180, 180, 0, 1, "\194\176")
    };
end;
v5.current_state = v4.anti_aim_settings:combo("\239\159\128  Current State", v13);
for v35 = 1, #v13 do
    v8[v35] = {
        override = v4.anti_aim_settings:switch("\238\144\166  Override " .. v13[v35]), 
        force_break_lc = v4.anti_aim_settings:switch("\239\129\144  Force Break LC" .. v14[v35])
    };
end;
v5.bombsite_fix = v4.anti_aim_settings:switch("\239\147\188  Bombsite Fix");
for v36 = 1, #v13 do
    v7[v36] = {
        group = ui.create(v13[v36] .. " Angles", 2)
    };
end;
for v37 = 1, #v13 do
    v10[v37] = {
        pitch = v7[v37].group:combo("\238\130\153  Pitch", "Disabled", "Down", "Fake Down", "Fake Up"), 
        yaw = v7[v37].group:combo("\239\136\157  Yaw", "Disabled", "Backward", "Static"), 
        yaw_modifier = v7[v37].group:combo("\238\146\188  Yaw Modifier", "Disabled", "Center", "Offset", "Random", "Spin", "3-Way", "5-Way", "Delay"), 
        body_yaw = v7[v37].group:switch("\238\130\133  Body Yaw"), 
        extended_angles = v7[v37].group:switch("\238\130\140  Extended Angles"), 
        hidden_anti_aim = v7[v37].group:switch("\239\130\132  Hidden Anti Aim")
    };
end;
for v38 = 1, #v13 do
    v11[v38] = {
        yaw_base = v10[v38].yaw:create():combo("Base", "Local View", "At Target"), 
        yaw_left_offset = v10[v38].yaw:create():slider("Left Offset", -180, 180, 0, 1, "\194\176"), 
        yaw_right_offset = v10[v38].yaw:create():slider("Right Offset", -180, 180, 0, 1, "\194\176"), 
        yaw_randomize = v10[v38].yaw:create():slider("Randomize", 0, 180, 0, 1, "\194\176"), 
        yaw_modifier_way_type = v10[v38].yaw_modifier:create():combo("Type", "Default", "Custom"), 
        yaw_modifier_left_offset = v10[v38].yaw_modifier:create():slider("Left Offset", -180, 180, 0, 1, "\194\176"), 
        yaw_modifier_right_offset = v10[v38].yaw_modifier:create():slider("Right Offset", -180, 180, 0, 1, "\194\176"), 
        yaw_modifier_offset1 = v10[v38].yaw_modifier:create():slider("Offset #1", -180, 180, 0, 1, "\194\176"), 
        yaw_modifier_offset2 = v10[v38].yaw_modifier:create():slider("Offset #2", -180, 180, 0, 1, "\194\176"), 
        yaw_modifier_offset3 = v10[v38].yaw_modifier:create():slider("Offset #3", -180, 180, 0, 1, "\194\176"), 
        yaw_modifier_offset4 = v10[v38].yaw_modifier:create():slider("Offset #4", -180, 180, 0, 1, "\194\176"), 
        yaw_modifier_offset5 = v10[v38].yaw_modifier:create():slider("Offset #5", -180, 180, 0, 1, "\194\176"), 
        yaw_modifier_randomize = v10[v38].yaw_modifier:create():slider("Randomize", 0, 180, 0, 1, "\194\176"), 
        yaw_modifier_delay_ticks = v10[v38].yaw_modifier:create():slider("Delay", 2, 10, 2, 1, "t"), 
        body_yaw_inverter = v10[v38].body_yaw:create():switch("Inverter"), 
        body_yaw_left_limit = v10[v38].body_yaw:create():slider("Left Limit", 0, 60, 60, 1, "\194\176"), 
        body_yaw_right_limit = v10[v38].body_yaw:create():slider("Right Limit", 0, 60, 60, 1, "\194\176"), 
        body_yaw_options = v10[v38].body_yaw:create():selectable("Options", "Avoid Overlap", "Jitter", "Randomize Jitter", "Anti Bruteforce"), 
        body_yaw_freestanding = v10[v38].body_yaw:create():combo("Freestanding", "Off", "Peek Fake", "Peek Real"), 
        extended_pitch = v10[v38].extended_angles:create():slider("Extended Pitch", -180, 180, 89, 1, "\194\176"), 
        extended_roll = v10[v38].extended_angles:create():slider("Extended Roll", 0, 90, 45, 1, "\194\176"), 
        hidden_pitch = v10[v38].hidden_anti_aim:create():combo("Pitch", "Disabled", "Automatic", "Random", "Switch", "Custom"), 
        hidden_pitch_offset1 = v10[v38].hidden_anti_aim:create():slider("Offset #1", -89, 89, 0, 1, "\194\176"), 
        hidden_pitch_offset2 = v10[v38].hidden_anti_aim:create():slider("Offset #2", -89, 89, 0, 1, "\194\176"), 
        hidden_pitch_delay = v10[v38].hidden_anti_aim:create():slider("Delay", 2, 10, 2, 1, "t"), 
        hidden_yaw = v10[v38].hidden_anti_aim:create():combo("Yaw", "Default", "Sideways", "Random", "Custom"), 
        hidden_yaw_offset = v10[v38].hidden_anti_aim:create():slider("Offset", -180, 180, 0, 1, "\194\176")
    };
end;
local v46 = {
    math_breathe = function(v39, v40)
        return math.abs(math.sin(globals.realtime * (v40 or 1) % math.pi + (v39 or 0)));
    end, 
    typing_text = function(v41, v42)
        local v43 = 0;
        local v44 = #v41:gsub("[\128-\191]", "");
        result = "";
        length = v44;
        num = v43;
        for v45 in v41:gmatch(".[\128-\191]*") do
            num = num + 1;
            factor = num / length;
            result = string.format("%s\a%s%s", result, v42(num, length, v45, factor):to_hex(), v45);
        end;
        return result;
    end
};
v46.gradient_text = function(v47, v48, v49)
    -- upvalues: v46 (ref)
    return v46.typing_text(v47, function(_, _, _, v53)
        -- upvalues: v48 (ref), v49 (ref)
        return v48:lerp(v49, v53);
    end);
end;
v46.gradient = function(v54, v55, v56, v57)
    -- upvalues: v46 (ref)
    return v46.typing_text(v54, function(_, _, _, v61)
        -- upvalues: v46 (ref), v57 (ref), v55 (ref), v56 (ref)
        interpolation = v46.math_breathe(v61, v57);
        return v55:lerp(v56, interpolation);
    end);
end;
v46.trace = function(v62)
    local l_x_0 = entity.get_local_player():get_origin().x;
    local l_y_0 = entity.get_local_player():get_origin().y;
    local l_z_0 = entity.get_local_player():get_origin().z;
    for v66 = 0, math.pi * 2, math.pi * 2 / 8 do
        if utils.trace_line(vector(10 * math.cos(v66) + l_x_0, 10 * math.sin(v66) + l_y_0, l_z_0), vector(10 * math.cos(v66) + l_x_0, 10 * math.sin(v66) + l_y_0, l_z_0 - v62), self).fraction ~= 1 then
            return true;
        end;
    end;
    return false;
end;
v46.call = function(v67, v68)
    return function(...)
        -- upvalues: v67 (ref), v68 (ref)
        return v67(v68, ...);
    end;
end;
v46.lerp = function(v69, v70, v71)
    if v69 == nil then
        v69 = 0;
    end;
    return v69 + (v70 - v69) * v71;
end;
v46.velocity = function(v72)
    return math.sqrt(v72.m_vecVelocity.x * v72.m_vecVelocity.x + v72.m_vecVelocity.y * v72.m_vecVelocity.y);
end;
v46.damage_apply_armor = function(v73, v74)
    local v75 = 0.5;
    local v76 = 0.5;
    if v74 > 0 then
        float_new = v73 * v75;
        float_armor = (v73 - float_new) * v76;
        if v74 < float_armor then
            float_armor = v74 * (1 / v76);
            float_new = v73 - float_armor;
        end;
        v73 = float_new;
    end;
    return v73;
end;
v46.bind_argument = function(v77, v78)
    return function(...)
        -- upvalues: v77 (ref), v78 (ref)
        return v77(v78, ...);
    end;
end;
v46.modify_velocity = function(v79, v80)
    local v81 = math.sqrt(v79.forwardmove * v79.forwardmove + v79.sidemove * v79.sidemove);
    if v80 <= 0 or v81 <= 0 then
        return;
    else
        if v79.in_duck == true then
            v80 = v80 * 2.94117647;
        end;
        if v81 <= v80 then
            return;
        else
            v79.forwardmove = v79.forwardmove * v80 / v81;
            v79.sidemove = v79.sidemove * v80 / v81;
            return;
        end;
    end;
end;
v46.defensive_active = function()
    local l_m_nTickBase_0 = entity.get_local_player().m_nTickBase;
    if max_tickbase == nil then
        max_tickbase = 0;
    end;
    if math.abs(l_m_nTickBase_0 - max_tickbase) > 64 then
        max_tickbase = 0;
    end;
    local v83 = 0;
    if max_tickbase < l_m_nTickBase_0 then
        max_tickbase = l_m_nTickBase_0;
    elseif l_m_nTickBase_0 < max_tickbase then
        v83 = math.min(14, math.max(0, max_tickbase - l_m_nTickBase_0 - 1));
    end;
    defensive_active = v83 > 0;
end;
v46.automatic_pitch = function(v84, v85)
    if entity.get_threat() ~= nil and (v84.in_jump == true or bit.band(v85.m_fFlags, 1) == 0) then
        if math.floor(v85:get_eye_position().z - entity.get_threat():get_eye_position().z) >= 120 then
            rage.antiaim:override_hidden_pitch(65);
        elseif math.floor(v85:get_eye_position().z - entity.get_threat():get_eye_position().z) < 10 then
            rage.antiaim:override_hidden_pitch(-70);
        else
            if v85.m_flDuckAmount ~= 0 then
                if v84.command_number % 60 > 40 then
                    automatic_pitch = not automatic_pitch;
                end;
            elseif v84.command_number % 50 > 30 then
                automatic_pitch = not automatic_pitch;
            end;
            rage.antiaim:override_hidden_pitch(automatic_pitch and -5 or -75);
        end;
    elseif entity.get_threat() ~= nil and v85.m_flDuckAmount ~= 0 and bit.band(v85.m_fFlags, 1) ~= 0 then
        rage.antiaim:override_hidden_pitch(-75);
    elseif entity.get_threat() ~= nil and v85.m_vecVelocity:length() < 2 and v85.m_flDuckAmount ~= 1 and bit.band(v85.m_fFlags, 1) ~= 0 then
        if math.floor(v85:get_eye_position().z - entity.get_threat():get_eye_position().z) >= 110 then
            rage.antiaim:override_hidden_pitch(60);
        elseif math.floor(v85:get_eye_position().z - entity.get_threat():get_eye_position().z) >= 30 and v85:get_origin():dist(entity.get_threat():get_origin()) > 1000 or math.floor(v85:get_eye_position().z - entity.get_threat():get_eye_position().z) >= 40 and v85:get_origin():dist(entity.get_threat():get_origin()) <= 1000 then
            rage.antiaim:override_hidden_pitch(-5);
        else
            rage.antiaim:override_hidden_pitch(-70);
        end;
    else
        rage.antiaim:override_hidden_pitch(-65);
    end;
end;
local v86 = {
    integers = {
        [1] = v5.aimbot_logs, 
        [2] = v5.aimbot_logs_events, 
        [3] = v5.aimbot_logs_output, 
        [4] = v5.hit_chance_modifications, 
        [5] = v5.hit_chance_modifications_disable_air_strafe, 
        [6] = v5.hit_chance_modifications_weapons, 
        [7] = v16[1].enabled, 
        [8] = v16[2].enabled, 
        [9] = v16[3].enabled, 
        [10] = v16[4].enabled, 
        [11] = v16[5].enabled, 
        [12] = v16[1].states, 
        [13] = v16[2].states, 
        [14] = v16[3].states, 
        [15] = v16[4].states, 
        [16] = v16[5].states, 
        [17] = v16[1].in_air_hit_chance, 
        [18] = v16[2].in_air_hit_chance, 
        [19] = v16[3].in_air_hit_chance, 
        [20] = v16[4].in_air_hit_chance, 
        [21] = v16[5].in_air_hit_chance, 
        [22] = v16[1].no_scope_hit_chance, 
        [23] = v16[2].no_scope_hit_chance, 
        [24] = v16[3].no_scope_hit_chance, 
        [25] = v16[4].no_scope_hit_chance, 
        [26] = v16[5].no_scope_hit_chance, 
        [27] = v16[1].no_scope_distance, 
        [28] = v16[2].no_scope_distance, 
        [29] = v16[3].no_scope_distance, 
        [30] = v16[4].no_scope_distance, 
        [31] = v16[5].no_scope_distance, 
        [32] = v5.discharge_exploit, 
        [33] = v5.discharge_exploit_weapons, 
        [34] = v5.dormant_aimbot, 
        [35] = v5.dormant_aimbot_min_damage, 
        [36] = v5.air_lag_exploit, 
        [37] = v5.avoid_backstab, 
        [38] = v5.edge_yaw, 
        [39] = v5.edge_yaw_disablers, 
        [40] = v5.freestanding, 
        [41] = v5.freestanding_disable_yaw_modifiers, 
        [42] = v5.freestanding_body, 
        [43] = v5.freestanding_safe_anti_aim, 
        [44] = v5.freestanding_disablers, 
        [45] = v5.manual_yaw, 
        [46] = v5.manual_yaw_disable_yaw_modifiers, 
        [47] = v5.manual_yaw_disable_body_yaw, 
        [48] = v5.manual_yaw_edge, 
        [49] = v5.safe_head, 
        [50] = v5.safe_head_hidden_anti_aim, 
        [51] = v5.safe_head_hidden_pitch, 
        [52] = v5.safe_head_hidden_pitch_offset1, 
        [53] = v5.safe_head_hidden_pitch_offset2, 
        [54] = v5.safe_head_hidden_pitch_delay, 
        [55] = v5.safe_head_hidden_yaw, 
        [56] = v5.safe_head_hidden_yaw_offset, 
        [57] = v5.mode, 
        [58] = v5.automatic_mode_force_break_lc, 
        [59] = v5.automatic_mode_force_break_lc_choice, 
        [60] = v5.automatic_mode_hidden_anti_aim, 
        [61] = v5.automatic_mode_hidden_anti_aim_states, 
        [62] = v9[1].hidden_pitch, 
        [63] = v9[2].hidden_pitch, 
        [64] = v9[3].hidden_pitch, 
        [65] = v9[4].hidden_pitch, 
        [66] = v9[5].hidden_pitch, 
        [67] = v9[6].hidden_pitch, 
        [68] = v9[7].hidden_pitch, 
        [69] = v9[1].hidden_pitch_offset1, 
        [70] = v9[2].hidden_pitch_offset1, 
        [71] = v9[3].hidden_pitch_offset1, 
        [72] = v9[4].hidden_pitch_offset1, 
        [73] = v9[5].hidden_pitch_offset1, 
        [74] = v9[6].hidden_pitch_offset1, 
        [75] = v9[7].hidden_pitch_offset1, 
        [76] = v9[1].hidden_pitch_offset2, 
        [77] = v9[2].hidden_pitch_offset2, 
        [78] = v9[3].hidden_pitch_offset2, 
        [79] = v9[4].hidden_pitch_offset2, 
        [80] = v9[5].hidden_pitch_offset2, 
        [81] = v9[6].hidden_pitch_offset2, 
        [82] = v9[7].hidden_pitch_offset2, 
        [83] = v9[1].hidden_pitch_delay, 
        [84] = v9[2].hidden_pitch_delay, 
        [85] = v9[3].hidden_pitch_delay, 
        [86] = v9[4].hidden_pitch_delay, 
        [87] = v9[5].hidden_pitch_delay, 
        [88] = v9[6].hidden_pitch_delay, 
        [89] = v9[7].hidden_pitch_delay, 
        [90] = v9[1].hidden_yaw, 
        [91] = v9[2].hidden_yaw, 
        [92] = v9[3].hidden_yaw, 
        [93] = v9[4].hidden_yaw, 
        [94] = v9[5].hidden_yaw, 
        [95] = v9[6].hidden_yaw, 
        [96] = v9[7].hidden_yaw, 
        [97] = v9[1].hidden_yaw_offset, 
        [98] = v9[2].hidden_yaw_offset, 
        [99] = v9[3].hidden_yaw_offset, 
        [100] = v9[4].hidden_yaw_offset, 
        [101] = v9[5].hidden_yaw_offset, 
        [102] = v9[6].hidden_yaw_offset, 
        [103] = v9[7].hidden_yaw_offset, 
        [104] = v5.current_state, 
        [105] = v8[1].override, 
        [106] = v8[2].override, 
        [107] = v8[3].override, 
        [108] = v8[4].override, 
        [109] = v8[5].override, 
        [110] = v8[6].override, 
        [111] = v8[7].override, 
        [112] = v8[8].override, 
        [113] = v8[9].override, 
        [114] = v8[1].force_break_lc, 
        [115] = v8[2].force_break_lc, 
        [116] = v8[3].force_break_lc, 
        [117] = v8[4].force_break_lc, 
        [118] = v8[5].force_break_lc, 
        [119] = v8[6].force_break_lc, 
        [120] = v8[7].force_break_lc, 
        [121] = v8[8].force_break_lc, 
        [122] = v8[9].force_break_lc, 
        [123] = v5.bombsite_fix, 
        [124] = v10[1].pitch, 
        [125] = v10[2].pitch, 
        [126] = v10[3].pitch, 
        [127] = v10[4].pitch, 
        [128] = v10[5].pitch, 
        [129] = v10[6].pitch, 
        [130] = v10[7].pitch, 
        [131] = v10[8].pitch, 
        [132] = v10[9].pitch, 
        [133] = v10[1].yaw, 
        [134] = v10[2].yaw, 
        [135] = v10[3].yaw, 
        [136] = v10[4].yaw, 
        [137] = v10[5].yaw, 
        [138] = v10[6].yaw, 
        [139] = v10[7].yaw, 
        [140] = v10[8].yaw, 
        [141] = v10[9].yaw, 
        [142] = v10[1].yaw_modifier, 
        [143] = v10[2].yaw_modifier, 
        [144] = v10[3].yaw_modifier, 
        [145] = v10[4].yaw_modifier, 
        [146] = v10[5].yaw_modifier, 
        [147] = v10[6].yaw_modifier, 
        [148] = v10[7].yaw_modifier, 
        [149] = v10[8].yaw_modifier, 
        [150] = v10[9].yaw_modifier, 
        [151] = v10[1].body_yaw, 
        [152] = v10[2].body_yaw, 
        [153] = v10[3].body_yaw, 
        [154] = v10[4].body_yaw, 
        [155] = v10[5].body_yaw, 
        [156] = v10[6].body_yaw, 
        [157] = v10[7].body_yaw, 
        [158] = v10[8].body_yaw, 
        [159] = v10[9].body_yaw, 
        [160] = v10[1].extended_angles, 
        [161] = v10[2].extended_angles, 
        [162] = v10[3].extended_angles, 
        [163] = v10[4].extended_angles, 
        [164] = v10[5].extended_angles, 
        [165] = v10[6].extended_angles, 
        [166] = v10[7].extended_angles, 
        [167] = v10[8].extended_angles, 
        [168] = v10[9].extended_angles, 
        [169] = v10[1].hidden_anti_aim, 
        [170] = v10[2].hidden_anti_aim, 
        [171] = v10[3].hidden_anti_aim, 
        [172] = v10[4].hidden_anti_aim, 
        [173] = v10[5].hidden_anti_aim, 
        [174] = v10[6].hidden_anti_aim, 
        [175] = v10[7].hidden_anti_aim, 
        [176] = v10[8].hidden_anti_aim, 
        [177] = v10[9].hidden_anti_aim, 
        [178] = v11[1].yaw_base, 
        [179] = v11[2].yaw_base, 
        [180] = v11[3].yaw_base, 
        [181] = v11[4].yaw_base, 
        [182] = v11[5].yaw_base, 
        [183] = v11[6].yaw_base, 
        [184] = v11[7].yaw_base, 
        [185] = v11[8].yaw_base, 
        [186] = v11[9].yaw_base, 
        [187] = v11[1].yaw_left_offset, 
        [188] = v11[2].yaw_left_offset, 
        [189] = v11[3].yaw_left_offset, 
        [190] = v11[4].yaw_left_offset, 
        [191] = v11[5].yaw_left_offset, 
        [192] = v11[6].yaw_left_offset, 
        [193] = v11[7].yaw_left_offset, 
        [194] = v11[8].yaw_left_offset, 
        [195] = v11[9].yaw_left_offset, 
        [196] = v11[1].yaw_right_offset, 
        [197] = v11[2].yaw_right_offset, 
        [198] = v11[3].yaw_right_offset, 
        [199] = v11[4].yaw_right_offset, 
        [200] = v11[5].yaw_right_offset, 
        [201] = v11[6].yaw_right_offset, 
        [202] = v11[7].yaw_right_offset, 
        [203] = v11[8].yaw_right_offset, 
        [204] = v11[9].yaw_right_offset, 
        [205] = v11[1].yaw_randomize, 
        [206] = v11[2].yaw_randomize, 
        [207] = v11[3].yaw_randomize, 
        [208] = v11[4].yaw_randomize, 
        [209] = v11[5].yaw_randomize, 
        [210] = v11[6].yaw_randomize, 
        [211] = v11[7].yaw_randomize, 
        [212] = v11[8].yaw_randomize, 
        [213] = v11[9].yaw_randomize, 
        [214] = v11[1].yaw_modifier_way_type, 
        [215] = v11[2].yaw_modifier_way_type, 
        [216] = v11[3].yaw_modifier_way_type, 
        [217] = v11[4].yaw_modifier_way_type, 
        [218] = v11[5].yaw_modifier_way_type, 
        [219] = v11[6].yaw_modifier_way_type, 
        [220] = v11[7].yaw_modifier_way_type, 
        [221] = v11[8].yaw_modifier_way_type, 
        [222] = v11[9].yaw_modifier_way_type, 
        [223] = v11[1].yaw_modifier_left_offset, 
        [224] = v11[2].yaw_modifier_left_offset, 
        [225] = v11[3].yaw_modifier_left_offset, 
        [226] = v11[4].yaw_modifier_left_offset, 
        [227] = v11[5].yaw_modifier_left_offset, 
        [228] = v11[6].yaw_modifier_left_offset, 
        [229] = v11[7].yaw_modifier_left_offset, 
        [230] = v11[8].yaw_modifier_left_offset, 
        [231] = v11[9].yaw_modifier_left_offset, 
        [232] = v11[1].yaw_modifier_right_offset, 
        [233] = v11[2].yaw_modifier_right_offset, 
        [234] = v11[3].yaw_modifier_right_offset, 
        [235] = v11[4].yaw_modifier_right_offset, 
        [236] = v11[5].yaw_modifier_right_offset, 
        [237] = v11[6].yaw_modifier_right_offset, 
        [238] = v11[7].yaw_modifier_right_offset, 
        [239] = v11[8].yaw_modifier_right_offset, 
        [240] = v11[9].yaw_modifier_right_offset, 
        [241] = v11[1].yaw_modifier_offset1, 
        [242] = v11[2].yaw_modifier_offset1, 
        [243] = v11[3].yaw_modifier_offset1, 
        [244] = v11[4].yaw_modifier_offset1, 
        [245] = v11[5].yaw_modifier_offset1, 
        [246] = v11[6].yaw_modifier_offset1, 
        [247] = v11[7].yaw_modifier_offset1, 
        [248] = v11[8].yaw_modifier_offset1, 
        [249] = v11[9].yaw_modifier_offset1, 
        [250] = v11[1].yaw_modifier_offset2, 
        [251] = v11[2].yaw_modifier_offset2, 
        [252] = v11[3].yaw_modifier_offset2, 
        [253] = v11[4].yaw_modifier_offset2, 
        [254] = v11[5].yaw_modifier_offset2, 
        [255] = v11[6].yaw_modifier_offset2, 
        [256] = v11[7].yaw_modifier_offset2, 
        [257] = v11[8].yaw_modifier_offset2, 
        [258] = v11[9].yaw_modifier_offset2, 
        [259] = v11[1].yaw_modifier_offset3, 
        [260] = v11[2].yaw_modifier_offset3, 
        [261] = v11[3].yaw_modifier_offset3, 
        [262] = v11[4].yaw_modifier_offset3, 
        [263] = v11[5].yaw_modifier_offset3, 
        [264] = v11[6].yaw_modifier_offset3, 
        [265] = v11[7].yaw_modifier_offset3, 
        [266] = v11[8].yaw_modifier_offset3, 
        [267] = v11[9].yaw_modifier_offset3, 
        [268] = v11[1].yaw_modifier_offset4, 
        [269] = v11[2].yaw_modifier_offset4, 
        [270] = v11[3].yaw_modifier_offset4, 
        [271] = v11[4].yaw_modifier_offset4, 
        [272] = v11[5].yaw_modifier_offset4, 
        [273] = v11[6].yaw_modifier_offset4, 
        [274] = v11[7].yaw_modifier_offset4, 
        [275] = v11[8].yaw_modifier_offset4, 
        [276] = v11[9].yaw_modifier_offset4, 
        [277] = v11[1].yaw_modifier_offset5, 
        [278] = v11[2].yaw_modifier_offset5, 
        [279] = v11[3].yaw_modifier_offset5, 
        [280] = v11[4].yaw_modifier_offset5, 
        [281] = v11[5].yaw_modifier_offset5, 
        [282] = v11[6].yaw_modifier_offset5, 
        [283] = v11[7].yaw_modifier_offset5, 
        [284] = v11[8].yaw_modifier_offset5, 
        [285] = v11[9].yaw_modifier_offset5, 
        [286] = v11[1].yaw_modifier_randomize, 
        [287] = v11[2].yaw_modifier_randomize, 
        [288] = v11[3].yaw_modifier_randomize, 
        [289] = v11[4].yaw_modifier_randomize, 
        [290] = v11[5].yaw_modifier_randomize, 
        [291] = v11[6].yaw_modifier_randomize, 
        [292] = v11[7].yaw_modifier_randomize, 
        [293] = v11[8].yaw_modifier_randomize, 
        [294] = v11[9].yaw_modifier_randomize, 
        [295] = v11[1].yaw_modifier_delay_ticks, 
        [296] = v11[2].yaw_modifier_delay_ticks, 
        [297] = v11[3].yaw_modifier_delay_ticks, 
        [298] = v11[4].yaw_modifier_delay_ticks, 
        [299] = v11[5].yaw_modifier_delay_ticks, 
        [300] = v11[6].yaw_modifier_delay_ticks, 
        [301] = v11[7].yaw_modifier_delay_ticks, 
        [302] = v11[8].yaw_modifier_delay_ticks, 
        [303] = v11[9].yaw_modifier_delay_ticks, 
        [304] = v11[1].body_yaw_inverter, 
        [305] = v11[2].body_yaw_inverter, 
        [306] = v11[3].body_yaw_inverter, 
        [307] = v11[4].body_yaw_inverter, 
        [308] = v11[5].body_yaw_inverter, 
        [309] = v11[6].body_yaw_inverter, 
        [310] = v11[7].body_yaw_inverter, 
        [311] = v11[8].body_yaw_inverter, 
        [312] = v11[9].body_yaw_inverter, 
        [313] = v11[1].body_yaw_left_limit, 
        [314] = v11[2].body_yaw_left_limit, 
        [315] = v11[3].body_yaw_left_limit, 
        [316] = v11[4].body_yaw_left_limit, 
        [317] = v11[5].body_yaw_left_limit, 
        [318] = v11[6].body_yaw_left_limit, 
        [319] = v11[7].body_yaw_left_limit, 
        [320] = v11[8].body_yaw_left_limit, 
        [321] = v11[9].body_yaw_left_limit, 
        [322] = v11[1].body_yaw_right_limit, 
        [323] = v11[2].body_yaw_right_limit, 
        [324] = v11[3].body_yaw_right_limit, 
        [325] = v11[4].body_yaw_right_limit, 
        [326] = v11[5].body_yaw_right_limit, 
        [327] = v11[6].body_yaw_right_limit, 
        [328] = v11[7].body_yaw_right_limit, 
        [329] = v11[8].body_yaw_right_limit, 
        [330] = v11[9].body_yaw_right_limit, 
        [331] = v11[1].body_yaw_options, 
        [332] = v11[2].body_yaw_options, 
        [333] = v11[3].body_yaw_options, 
        [334] = v11[4].body_yaw_options, 
        [335] = v11[5].body_yaw_options, 
        [336] = v11[6].body_yaw_options, 
        [337] = v11[7].body_yaw_options, 
        [338] = v11[8].body_yaw_options, 
        [339] = v11[9].body_yaw_options, 
        [340] = v11[1].body_yaw_freestanding, 
        [341] = v11[2].body_yaw_freestanding, 
        [342] = v11[3].body_yaw_freestanding, 
        [343] = v11[4].body_yaw_freestanding, 
        [344] = v11[5].body_yaw_freestanding, 
        [345] = v11[6].body_yaw_freestanding, 
        [346] = v11[7].body_yaw_freestanding, 
        [347] = v11[8].body_yaw_freestanding, 
        [348] = v11[9].body_yaw_freestanding, 
        [349] = v11[1].extended_pitch, 
        [350] = v11[2].extended_pitch, 
        [351] = v11[3].extended_pitch, 
        [352] = v11[4].extended_pitch, 
        [353] = v11[5].extended_pitch, 
        [354] = v11[6].extended_pitch, 
        [355] = v11[7].extended_pitch, 
        [356] = v11[8].extended_pitch, 
        [357] = v11[9].extended_pitch, 
        [358] = v11[1].extended_roll, 
        [359] = v11[2].extended_roll, 
        [360] = v11[3].extended_roll, 
        [361] = v11[4].extended_roll, 
        [362] = v11[5].extended_roll, 
        [363] = v11[6].extended_roll, 
        [364] = v11[7].extended_roll, 
        [365] = v11[8].extended_roll, 
        [366] = v11[9].extended_roll, 
        [367] = v11[1].hidden_pitch, 
        [368] = v11[2].hidden_pitch, 
        [369] = v11[3].hidden_pitch, 
        [370] = v11[4].hidden_pitch, 
        [371] = v11[5].hidden_pitch, 
        [372] = v11[6].hidden_pitch, 
        [373] = v11[7].hidden_pitch, 
        [374] = v11[8].hidden_pitch, 
        [375] = v11[9].hidden_pitch, 
        [376] = v11[1].hidden_pitch_offset1, 
        [377] = v11[2].hidden_pitch_offset1, 
        [378] = v11[3].hidden_pitch_offset1, 
        [379] = v11[4].hidden_pitch_offset1, 
        [380] = v11[5].hidden_pitch_offset1, 
        [381] = v11[6].hidden_pitch_offset1, 
        [382] = v11[7].hidden_pitch_offset1, 
        [383] = v11[8].hidden_pitch_offset1, 
        [384] = v11[9].hidden_pitch_offset1, 
        [385] = v11[1].hidden_pitch_offset2, 
        [386] = v11[2].hidden_pitch_offset2, 
        [387] = v11[3].hidden_pitch_offset2, 
        [388] = v11[4].hidden_pitch_offset2, 
        [389] = v11[5].hidden_pitch_offset2, 
        [390] = v11[6].hidden_pitch_offset2, 
        [391] = v11[7].hidden_pitch_offset2, 
        [392] = v11[8].hidden_pitch_offset2, 
        [393] = v11[9].hidden_pitch_offset2, 
        [394] = v11[1].hidden_pitch_delay, 
        [395] = v11[2].hidden_pitch_delay, 
        [396] = v11[3].hidden_pitch_delay, 
        [397] = v11[4].hidden_pitch_delay, 
        [398] = v11[5].hidden_pitch_delay, 
        [399] = v11[6].hidden_pitch_delay, 
        [400] = v11[7].hidden_pitch_delay, 
        [401] = v11[8].hidden_pitch_delay, 
        [402] = v11[9].hidden_pitch_delay, 
        [403] = v11[1].hidden_yaw, 
        [404] = v11[2].hidden_yaw, 
        [405] = v11[3].hidden_yaw, 
        [406] = v11[4].hidden_yaw, 
        [407] = v11[5].hidden_yaw, 
        [408] = v11[6].hidden_yaw, 
        [409] = v11[7].hidden_yaw, 
        [410] = v11[8].hidden_yaw, 
        [411] = v11[9].hidden_yaw, 
        [412] = v11[1].hidden_yaw_offset, 
        [413] = v11[2].hidden_yaw_offset, 
        [414] = v11[3].hidden_yaw_offset, 
        [415] = v11[4].hidden_yaw_offset, 
        [416] = v11[5].hidden_yaw_offset, 
        [417] = v11[6].hidden_yaw_offset, 
        [418] = v11[7].hidden_yaw_offset, 
        [419] = v11[8].hidden_yaw_offset, 
        [420] = v11[9].hidden_yaw_offset, 
        [421] = v5.better_scope_overlay, 
        [422] = v5.better_scope_overlay_line, 
        [423] = v5.better_scope_overlay_gap, 
        [424] = v5.better_scope_overlay_exclude_lines, 
        [425] = v5.better_scope_overlay_spread_based, 
        [426] = v5.crosshair_indicators, 
        [427] = v5.damage_indicator, 
        [428] = v5.damage_indicator_animation, 
        [429] = v5.skeet_indicators, 
        [430] = v5.skeet_indicators_selection, 
        [431] = v5.skeet_indicators_break_lc_indicator, 
        [432] = v5.manual_arrows, 
        [433] = v5.manual_arrows_alternative, 
        [434] = v5.velocity_warning, 
        [435] = v5.keep_model_transparency, 
        [436] = v5.aspect_ratio, 
        [437] = v5.animation_breakers, 
        [438] = v5.legs_breaker, 
        [439] = v5.legs_in_air, 
        [440] = v5.sliding_elements, 
        [441] = v5.move_lean_force, 
        [442] = v5.landing_pitch, 
        [443] = v5.viewmodel, 
        [444] = v5.viewmodel_fov, 
        [445] = v5.viewmodel_x, 
        [446] = v5.viewmodel_y, 
        [447] = v5.viewmodel_z, 
        [448] = v5.viewmodel_opposite_knife_hand, 
        [449] = v5.console_modulation, 
        [450] = v5.unmute_silenced_players, 
        [451] = v5.icon_notification, 
        [452] = v5.clan_tag, 
        [453] = v5.unlock_fake_latency, 
        [454] = v5.fast_ladder_move, 
        [455] = v5.no_fall_damage
    }, 
    colors = {
        [1] = v5.aimbot_logs_color, 
        [2] = v5.better_scope_overlay_accent_color, 
        [3] = v5.better_scope_overlay_additional_color, 
        [4] = v5.crosshair_indicators_accent_color, 
        [5] = v5.crosshair_indicators_additional_color, 
        [6] = v5.skeet_indicators_break_lc_indicator_color, 
        [7] = v5.manual_arrows_color, 
        [8] = v5.manual_desync_color, 
        [9] = v5.velocity_warning_accent_color, 
        [10] = v5.console_modulation_color
    }
};
v5.import = function(v87)
    -- upvalues: v1 (ref), v0 (ref), v86 (ref)
    local v88 = v1.parse(v0.base64.decode(v87));
    if v88 ~= nil then
        for v89, v90 in pairs(v88) do
            v89 = ({
                [1] = "integers", 
                [2] = "colors"
            })[v89];
            for v91, v92 in pairs(v90) do
                if v89 == "integers" then
                    v86[v89][v91]:set(v92);
                end;
                if v89 == "colors" then
                    v86[v89][v91]:set(color(tonumber("0x" .. v92:sub(1, 2)), tonumber("0x" .. v92:sub(3, 4)), tonumber("0x" .. v92:sub(5, 6)), tonumber("0x" .. v92:sub(7, 8))));
                end;
            end;
        end;
    end;
end;
v5.export_config:set_callback(function()
    -- upvalues: v86 (ref), v0 (ref), v1 (ref)
    local v93 = {
        [1] = {}, 
        [2] = {}
    };
    for _, v95 in pairs(v86.integers) do
        table.insert(v93[1], v95:get());
    end;
    for _, v97 in pairs(v86.colors) do
        table.insert(v93[2], string.format("%02X%02X%02X%02X", math.floor(v97:get().r), math.floor(v97:get().g), math.floor(v97:get().b), math.floor(v97:get().a)));
    end;
    v0.clipboard.set("zov:yaw::" .. v0.base64.encode(v1.stringify(v93)));
    print_dev("Exported successfully");
end);
v5.import_config:set_callback(function()
    -- upvalues: v5 (ref), v0 (ref)
    v5.import(v0.clipboard.get():gsub("zov:yaw::", ""));
    print_dev("Imported successfully");
end);
v5.default_config:set_callback(function()
    -- upvalues: v5 (ref)
    v5.import(("zov:yaw::eyIxIjp7IjEiOnRydWUsIjIiOnsiMSI6IkFpbWJvdCBTaG90cyJ9LCIzIjp7IjEiOiJEZWZhdWx0IiwiMiI6IkNvbnNvbGUifSwiNCI6dHJ1ZSwiNSI6ZmFsc2UsIjYiOjEsIjciOmZhbHNlLCI4IjpmYWxzZSwiOSI6dHJ1ZSwiMTAiOnRydWUsIjExIjpmYWxzZSwiMTIiOnt9LCIxMyI6e30sIjE0Ijp7IjEiOiJJbiBBaXIifSwiMTUiOnt9LCIxNiI6e30sIjE3Ijo1MCwiMTgiOjUwLCIxOSI6NTAsIjIwIjo0MCwiMjEiOjUwLCIyMiI6NTAsIjIzIjo1MCwiMjQiOjUwLCIyNSI6NTAsIjI2Ijo1MCwiMjciOjQwLCIyOCI6NDAsIjI5Ijo0MCwiMzAiOjQwLCIzMSI6NDAsIjMyIjpmYWxzZSwiMzMiOnt9LCIzNCI6ZmFsc2UsIjM1IjowLCIzNiI6ZmFsc2UsIjM3Ijp0cnVlLCIzOCI6ZmFsc2UsIjM5Ijp7IjEiOiJTbG93IFdhbGtpbmciLCIyIjoiSW4gQWlyIn0sIjQwIjpmYWxzZSwiNDEiOnRydWUsIjQyIjp0cnVlLCI0MyI6ZmFsc2UsIjQ0Ijp7IjEiOiJTbG93IFdhbGtpbmciLCIyIjoiSW4gQWlyIn0sIjQ1IjoiRGlzYWJsZWQiLCI0NiI6dHJ1ZSwiNDciOnRydWUsIjQ4Ijp0cnVlLCI0OSI6dHJ1ZSwiNTAiOnRydWUsIjUxIjoiUmFuZG9tIiwiNTIiOi01LCI1MyI6NSwiNTQiOjIsIjU1IjoiQ3VzdG9tIiwiNTYiOjE4MCwiNTciOjEsIjU4Ijp0cnVlLCI1OSI6eyIxIjoxLCIyIjo0LCIzIjo1LCI0Ijo2fSwiNjAiOnRydWUsIjYxIjoiU3RhbmRpbmciLCI2MiI6IkF1dG9tYXRpYyIsIjYzIjoiRGlzYWJsZWQiLCI2NCI6IkRpc2FibGVkIiwiNjUiOiJBdXRvbWF0aWMiLCI2NiI6IkF1dG9tYXRpYyIsIjY3IjoiQXV0b21hdGljIiwiNjgiOiJEaXNhYmxlZCIsIjY5IjowLCI3MCI6MCwiNzEiOjAsIjcyIjowLCI3MyI6MCwiNzQiOjAsIjc1IjowLCI3NiI6MCwiNzciOjAsIjc4IjowLCI3OSI6MCwiODAiOjAsIjgxIjowLCI4MiI6MCwiODMiOjIsIjg0IjoyLCI4NSI6MiwiODYiOjIsIjg3IjoyLCI4OCI6MiwiODkiOjIsIjkwIjoiRGVmYXVsdCIsIjkxIjoiRGVmYXVsdCIsIjkyIjoiRGVmYXVsdCIsIjkzIjoiRGVmYXVsdCIsIjk0IjoiRGVmYXVsdCIsIjk1IjoiRGVmYXVsdCIsIjk2IjoiRGVmYXVsdCIsIjk3IjowLCI5OCI6MCwiOTkiOjAsIjEwMCI6MCwiMTAxIjowLCIxMDIiOjAsIjEwMyI6MCwiMTA0IjoiRGVmYXVsdCIsIjEwNSI6dHJ1ZSwiMTA2IjpmYWxzZSwiMTA3IjpmYWxzZSwiMTA4IjpmYWxzZSwiMTA5IjpmYWxzZSwiMTEwIjpmYWxzZSwiMTExIjpmYWxzZSwiMTEyIjpmYWxzZSwiMTEzIjpmYWxzZSwiMTE0IjpmYWxzZSwiMTE1IjpmYWxzZSwiMTE2IjpmYWxzZSwiMTE3IjpmYWxzZSwiMTE4IjpmYWxzZSwiMTE5IjpmYWxzZSwiMTIwIjpmYWxzZSwiMTIxIjpmYWxzZSwiMTIyIjpmYWxzZSwiMTIzIjpmYWxzZSwiMTI0IjoiRGlzYWJsZWQiLCIxMjUiOiJEaXNhYmxlZCIsIjEyNiI6IkRpc2FibGVkIiwiMTI3IjoiRGlzYWJsZWQiLCIxMjgiOiJEaXNhYmxlZCIsIjEyOSI6IkRpc2FibGVkIiwiMTMwIjoiRGlzYWJsZWQiLCIxMzEiOiJEaXNhYmxlZCIsIjEzMiI6IkRpc2FibGVkIiwiMTMzIjoiRGlzYWJsZWQiLCIxMzQiOiJEaXNhYmxlZCIsIjEzNSI6IkRpc2FibGVkIiwiMTM2IjoiRGlzYWJsZWQiLCIxMzciOiJEaXNhYmxlZCIsIjEzOCI6IkRpc2FibGVkIiwiMTM5IjoiRGlzYWJsZWQiLCIxNDAiOiJEaXNhYmxlZCIsIjE0MSI6IkRpc2FibGVkIiwiMTQyIjoiRGlzYWJsZWQiLCIxNDMiOiJEaXNhYmxlZCIsIjE0NCI6IkRpc2FibGVkIiwiMTQ1IjoiRGlzYWJsZWQiLCIxNDYiOiJEaXNhYmxlZCIsIjE0NyI6IkRpc2FibGVkIiwiMTQ4IjoiRGlzYWJsZWQiLCIxNDkiOiJEaXNhYmxlZCIsIjE1MCI6IkRpc2FibGVkIiwiMTUxIjpmYWxzZSwiMTUyIjpmYWxzZSwiMTUzIjpmYWxzZSwiMTU0IjpmYWxzZSwiMTU1IjpmYWxzZSwiMTU2IjpmYWxzZSwiMTU3IjpmYWxzZSwiMTU4IjpmYWxzZSwiMTU5IjpmYWxzZSwiMTYwIjpmYWxzZSwiMTYxIjpmYWxzZSwiMTYyIjpmYWxzZSwiMTYzIjpmYWxzZSwiMTY0IjpmYWxzZSwiMTY1IjpmYWxzZSwiMTY2IjpmYWxzZSwiMTY3IjpmYWxzZSwiMTY4IjpmYWxzZSwiMTY5IjpmYWxzZSwiMTcwIjpmYWxzZSwiMTcxIjpmYWxzZSwiMTcyIjpmYWxzZSwiMTczIjpmYWxzZSwiMTc0IjpmYWxzZSwiMTc1IjpmYWxzZSwiMTc2IjpmYWxzZSwiMTc3IjpmYWxzZSwiMTc4IjoiTG9jYWwgVmlldyIsIjE3OSI6IkxvY2FsIFZpZXciLCIxODAiOiJMb2NhbCBWaWV3IiwiMTgxIjoiTG9jYWwgVmlldyIsIjE4MiI6IkxvY2FsIFZpZXciLCIxODMiOiJMb2NhbCBWaWV3IiwiMTg0IjoiTG9jYWwgVmlldyIsIjE4NSI6IkxvY2FsIFZpZXciLCIxODYiOiJMb2NhbCBWaWV3IiwiMTg3IjowLCIxODgiOjAsIjE4OSI6MCwiMTkwIjowLCIxOTEiOjAsIjE5MiI6MCwiMTkzIjowLCIxOTQiOjAsIjE5NSI6MCwiMTk2IjowLCIxOTciOjAsIjE5OCI6MCwiMTk5IjowLCIyMDAiOjAsIjIwMSI6MCwiMjAyIjowLCIyMDMiOjAsIjIwNCI6MCwiMjA1IjowLCIyMDYiOjAsIjIwNyI6MCwiMjA4IjowLCIyMDkiOjAsIjIxMCI6MCwiMjExIjowLCIyMTIiOjAsIjIxMyI6MCwiMjE0IjoiRGVmYXVsdCIsIjIxNSI6IkRlZmF1bHQiLCIyMTYiOiJEZWZhdWx0IiwiMjE3IjoiRGVmYXVsdCIsIjIxOCI6IkRlZmF1bHQiLCIyMTkiOiJEZWZhdWx0IiwiMjIwIjoiRGVmYXVsdCIsIjIyMSI6IkRlZmF1bHQiLCIyMjIiOiJEZWZhdWx0IiwiMjIzIjowLCIyMjQiOjAsIjIyNSI6MCwiMjI2IjowLCIyMjciOjAsIjIyOCI6MCwiMjI5IjowLCIyMzAiOjAsIjIzMSI6MCwiMjMyIjowLCIyMzMiOjAsIjIzNCI6MCwiMjM1IjowLCIyMzYiOjAsIjIzNyI6MCwiMjM4IjowLCIyMzkiOjAsIjI0MCI6MCwiMjQxIjowLCIyNDIiOjAsIjI0MyI6MCwiMjQ0IjowLCIyNDUiOjAsIjI0NiI6MCwiMjQ3IjowLCIyNDgiOjAsIjI0OSI6MCwiMjUwIjowLCIyNTEiOjAsIjI1MiI6MCwiMjUzIjowLCIyNTQiOjAsIjI1NSI6MCwiMjU2IjowLCIyNTciOjAsIjI1OCI6MCwiMjU5IjowLCIyNjAiOjAsIjI2MSI6MCwiMjYyIjowLCIyNjMiOjAsIjI2NCI6MCwiMjY1IjowLCIyNjYiOjAsIjI2NyI6MCwiMjY4IjowLCIyNjkiOjAsIjI3MCI6MCwiMjcxIjowLCIyNzIiOjAsIjI3MyI6MCwiMjc0IjowLCIyNzUiOjAsIjI3NiI6MCwiMjc3IjowLCIyNzgiOjAsIjI3OSI6MCwiMjgwIjowLCIyODEiOjAsIjI4MiI6MCwiMjgzIjowLCIyODQiOjAsIjI4NSI6MCwiMjg2IjowLCIyODciOjAsIjI4OCI6MCwiMjg5IjowLCIyOTAiOjAsIjI5MSI6MCwiMjkyIjowLCIyOTMiOjAsIjI5NCI6MCwiMjk1IjoyLCIyOTYiOjIsIjI5NyI6MiwiMjk4IjoyLCIyOTkiOjIsIjMwMCI6MiwiMzAxIjoyLCIzMDIiOjIsIjMwMyI6MiwiMzA0IjpmYWxzZSwiMzA1IjpmYWxzZSwiMzA2IjpmYWxzZSwiMzA3IjpmYWxzZSwiMzA4IjpmYWxzZSwiMzA5IjpmYWxzZSwiMzEwIjpmYWxzZSwiMzExIjpmYWxzZSwiMzEyIjpmYWxzZSwiMzEzIjo2MCwiMzE0Ijo2MCwiMzE1Ijo2MCwiMzE2Ijo2MCwiMzE3Ijo2MCwiMzE4Ijo2MCwiMzE5Ijo2MCwiMzIwIjo2MCwiMzIxIjo2MCwiMzIyIjo2MCwiMzIzIjo2MCwiMzI0Ijo2MCwiMzI1Ijo2MCwiMzI2Ijo2MCwiMzI3Ijo2MCwiMzI4Ijo2MCwiMzI5Ijo2MCwiMzMwIjo2MCwiMzMxIjp7fSwiMzMyIjp7fSwiMzMzIjp7fSwiMzM0Ijp7fSwiMzM1Ijp7fSwiMzM2Ijp7fSwiMzM3Ijp7fSwiMzM4Ijp7fSwiMzM5Ijp7fSwiMzQwIjoiT2ZmIiwiMzQxIjoiT2ZmIiwiMzQyIjoiT2ZmIiwiMzQzIjoiT2ZmIiwiMzQ0IjoiT2ZmIiwiMzQ1IjoiT2ZmIiwiMzQ2IjoiT2ZmIiwiMzQ3IjoiT2ZmIiwiMzQ4IjoiT2ZmIiwiMzQ5Ijo4OSwiMzUwIjo4OSwiMzUxIjo4OSwiMzUyIjo4OSwiMzUzIjo4OSwiMzU0Ijo4OSwiMzU1Ijo4OSwiMzU2Ijo4OSwiMzU3Ijo4OSwiMzU4Ijo0NSwiMzU5Ijo0NSwiMzYwIjo0NSwiMzYxIjo0NSwiMzYyIjo0NSwiMzYzIjo0NSwiMzY0Ijo0NSwiMzY1Ijo0NSwiMzY2Ijo0NSwiMzY3IjoiRGlzYWJsZWQiLCIzNjgiOiJEaXNhYmxlZCIsIjM2OSI6IkRpc2FibGVkIiwiMzcwIjoiRGlzYWJsZWQiLCIzNzEiOiJEaXNhYmxlZCIsIjM3MiI6IkRpc2FibGVkIiwiMzczIjoiRGlzYWJsZWQiLCIzNzQiOiJEaXNhYmxlZCIsIjM3NSI6IkRpc2FibGVkIiwiMzc2IjowLCIzNzciOjAsIjM3OCI6MCwiMzc5IjowLCIzODAiOjAsIjM4MSI6MCwiMzgyIjowLCIzODMiOjAsIjM4NCI6MCwiMzg1IjowLCIzODYiOjAsIjM4NyI6MCwiMzg4IjowLCIzODkiOjAsIjM5MCI6MCwiMzkxIjowLCIzOTIiOjAsIjM5MyI6MCwiMzk0IjoyLCIzOTUiOjIsIjM5NiI6MiwiMzk3IjoyLCIzOTgiOjIsIjM5OSI6MiwiNDAwIjoyLCI0MDEiOjIsIjQwMiI6MiwiNDAzIjoiRGVmYXVsdCIsIjQwNCI6IkRlZmF1bHQiLCI0MDUiOiJEZWZhdWx0IiwiNDA2IjoiRGVmYXVsdCIsIjQwNyI6IkRlZmF1bHQiLCI0MDgiOiJEZWZhdWx0IiwiNDA5IjoiRGVmYXVsdCIsIjQxMCI6IkRlZmF1bHQiLCI0MTEiOiJEZWZhdWx0IiwiNDEyIjowLCI0MTMiOjAsIjQxNCI6MCwiNDE1IjowLCI0MTYiOjAsIjQxNyI6MCwiNDE4IjowLCI0MTkiOjAsIjQyMCI6MCwiNDIxIjp0cnVlLCI0MjIiOjEyLCI0MjMiOjQsIjQyNCI6e30sIjQyNSI6ZmFsc2UsIjQyNiI6dHJ1ZSwiNDI3Ijp0cnVlLCI0MjgiOmZhbHNlLCI0MjkiOnRydWUsIjQzMCI6eyIxIjoxLCIyIjoyLCIzIjo0LCI0Ijo1LCI1Ijo3LCI2Ijo4LCI3Ijo5LCI4IjoxMCwiOSI6MTEsIjEwIjoxMn0sIjQzMSI6ZmFsc2UsIjQzMiI6ZmFsc2UsIjQzMyI6ZmFsc2UsIjQzNCI6ZmFsc2UsIjQzNSI6ZmFsc2UsIjQzNiI6MTAwLCI0MzciOmZhbHNlLCI0MzgiOiJEaXNhYmxlZCIsIjQzOSI6IkRpc2FibGVkIiwiNDQwIjp7fSwiNDQxIjotMSwiNDQyIjpmYWxzZSwiNDQzIjpmYWxzZSwiNDQ0Ijo2MDAsIjQ0NSI6MTAsIjQ0NiI6MTAsIjQ0NyI6LTEwLCI0NDgiOmZhbHNlLCI0NDkiOnRydWUsIjQ1MCI6ZmFsc2UsIjQ1MSI6ZmFsc2UsIjQ1MiI6ZmFsc2UsIjQ1MyI6ZmFsc2UsIjQ1NCI6ZmFsc2UsIjQ1NSI6dHJ1ZX0sIjIiOnsiMSI6IjkxQUZGRkZGIiwiMiI6IkZGRkZGRkM4IiwiMyI6IkZGRkZGRjAwIiwiNCI6IkZGRkZGRkZGIiwiNSI6IjkxQUZGRkZGIiwiNiI6IjgyQzMxNEZBIiwiNyI6IjkxQUZGRkZGIiwiOCI6IjkxQUZGRkZGIiwiOSI6IjkxQUZGRkZGIiwiMTAiOiI1MTUxNTFEMiJ9fQ=="):gsub("zov:yaw::", ""));
    print_dev("Loaded successfully");
end);
v5.get_entity_address = v46.call(ffi.cast("get_client_entity_t", ffi.cast(ffi.typeof("uintptr_t**"), utils.create_interface("client.dll", "VClientEntityList003"))[0][3]), ffi.cast(ffi.typeof("uintptr_t**"), utils.create_interface("client.dll", "VClientEntityList003")));
v5.get_anim_layer = function(v98, v99)
    if not v99 then
        v99 = 1;
    end;
    v98 = ffi.cast(ffi.typeof("void***"), v98);
    return ffi.cast("c_animlayers**", ffi.cast("char*", v98) + 10640)[0][v99];
end;
v5.no_fall_damage_main = function()
    -- upvalues: v5 (ref), v46 (ref)
    if v5.no_fall_damage:get() == false then
        return;
    else
        local v100 = entity.get_local_player();
        if v100 == nil then
            return;
        else
            if v100.m_vecVelocity.z >= -580 then
                v5.no_fall_damage_value = false;
            elseif v46.trace(15) then
                v5.no_fall_damage_value = false;
            elseif v46.trace(75) then
                v5.no_fall_damage_value = true;
            end;
            return;
        end;
    end;
end;
v5.anti_aim_main = function(v101)
    -- upvalues: v5 (ref), v8 (ref), v3 (ref), v10 (ref), v11 (ref), v46 (ref), v9 (ref)
    local v102 = entity.get_local_player();
    if v102:get_player_weapon() == nil then
        return;
    else
        anti_aim_on_use = false;
        if v5.mode:get() ~= 2 then
            is_planting = v102.m_bInBombZone and v102:get_player_weapon():get_classname() == "CC4" and v102.m_iTeamNum == 2;
        elseif v5.bombsite_fix:get() then
            is_planting = v102.m_bInBombZone and v102:get_player_weapon():get_classname() == "CC4" and v102.m_iTeamNum == 2;
        else
            is_planting = v102.m_bInBombZone and v102.m_iTeamNum == 2;
        end;
        entity.get_entities("CPlantedC4", true, function(v103)
            -- upvalues: v102 (ref)
            local v104 = v102:get_origin():dist(v103:get_origin());
            if v103.m_bBombDefused then
                v104 = 56;
            end;
            is_defusing = v104 < 56 and v102.m_iTeamNum == 3;
        end);
        local v105 = utils.trace_line(v102:get_eye_position(), v102:get_eye_position() + vector():angles(render.camera_angles()) * 8192, v102, 1174421515);
        if v105 and v105.fraction < 1 and v105.entity then
            if v102:get_origin():dist(v105.entity:get_origin()) < 146 then
                if v102.m_iTeamNum == 2 then
                    if v105.entity:is_enemy() == false and v105.entity:is_bot() then
                        using = v105.entity:get_classname() ~= "CWorld" and v105.entity:get_classname() ~= "CFuncBrush";
                    else
                        using = v105.entity:get_classname() ~= "CWorld" and v105.entity:get_classname() ~= "CFuncBrush" and v105.entity:get_classname() ~= "CCSPlayer";
                    end;
                else
                    using = v105.entity:get_classname() ~= "CWorld" and v105.entity:get_classname() ~= "CFuncBrush" and v105.entity:get_classname() ~= "CCSPlayer";
                end;
            else
                using = nil;
            end;
        end;
        if v101.in_use == true and not using and not is_planting and not is_defusing and v8[9].override:get() then
            v101.buttons = bit.band(v101.buttons, bit.bnot(bit.lshift(1, 5)));
            anti_aim_on_use = true;
            state_id = 9;
        elseif (v3.hide_shots:get() == false and v3.double_tap:get() == false or v3.fake_duck:get()) and v8[8].override:get() then
            anti_aim_on_use = false;
            state_id = 8;
        elseif (v101.in_jump == true or bit.band(v102.m_fFlags, 1) == 0) and v102.m_flDuckAmount ~= 0 and v8[7].override:get() then
            anti_aim_on_use = false;
            state_id = 7;
        elseif (v101.in_jump == true or bit.band(v102.m_fFlags, 1) == 0) and v102.m_flDuckAmount ~= 1 and v8[6].override:get() then
            anti_aim_on_use = false;
            state_id = 6;
        elseif (v102.m_flDuckAmount ~= 0 or v3.fake_duck:get()) and bit.band(v102.m_fFlags, 1) ~= 0 and v8[5].override:get() then
            anti_aim_on_use = false;
            state_id = 5;
        elseif v102.m_vecVelocity:length() > 2 and bit.band(v102.m_fFlags, 1) ~= 0 and v102.m_flDuckAmount ~= 1 and v3.slow_walk:get() and v8[4].override:get() then
            anti_aim_on_use = false;
            state_id = 4;
        elseif v102.m_vecVelocity:length() > 2 and bit.band(v102.m_fFlags, 1) ~= 0 and v102.m_flDuckAmount ~= 1 and not v3.slow_walk:get() and v8[3].override:get() then
            anti_aim_on_use = false;
            state_id = 3;
        elseif v102.m_vecVelocity:length() < 2 and v102.m_flDuckAmount ~= 1 and bit.band(v102.m_fFlags, 1) ~= 0 and v8[2].override:get() then
            anti_aim_on_use = false;
            state_id = 2;
        else
            anti_aim_on_use = false;
            state_id = 1;
        end;
        if v102.m_MoveType == 9 then
            print_state_id = 10;
            print_state = "CLIMBING";
        elseif v5.planting_state == true and v5.planting then
            print_state_id = 9;
            print_state = "PLANTING";
        elseif v102.m_bIsDefusing then
            print_state_id = 8;
            print_state = "DEFUSING";
        elseif v101.in_use == true and entity.get_game_rules().m_bFreezePeriod == false then
            print_state_id = 7;
            print_state = "USING";
        elseif (v101.in_jump == true or bit.band(v102.m_fFlags, 1) == 0) and entity.get_game_rules().m_bFreezePeriod == false then
            print_state_id = 6;
            print_state = "JUMPING";
        elseif v102.m_flDuckAmount ~= 0 then
            print_state_id = 5;
            print_state = "CROUCHING";
        elseif v3.fake_duck:get() and entity.get_game_rules().m_bFreezePeriod == false then
            print_state_id = 4;
            print_state = "CROUCHING";
        elseif v102.m_vecVelocity:length() > 2 and bit.band(v102.m_fFlags, 1) ~= 0 and v3.slow_walk:get() then
            print_state_id = 3;
            print_state = "WALKING";
        elseif v102.m_vecVelocity:length() > 2 and bit.band(v102.m_fFlags, 1) ~= 0 and not v3.slow_walk:get() then
            print_state_id = 2;
            print_state = "MOVING";
        elseif v102.m_vecVelocity:length() < 2 and bit.band(v102.m_fFlags, 1) ~= 0 then
            print_state_id = 1;
            print_state = "STANDING";
        end;
        if v5.mode:get() == 2 then
            if v8[state_id].force_break_lc:get() then
                if v3.double_tap:get() and v101.command_number % 3 ~= 1 and v102:get_player_weapon().m_bPinPulled ~= true then
                    v3.lag_options:override("Always On");
                else
                    v3.lag_options:override();
                end;
                if v3.hide_shots:get() and v102:get_player_weapon().m_bPinPulled ~= true then
                    v3.options:override("Break LC");
                else
                    v3.options:override();
                end;
            else
                v3.lag_options:override();
                v3.options:override();
            end;
            v3.pitch:override(v10[state_id].pitch:get());
            v3.yaw:override(v10[state_id].yaw:get());
            v3.yaw_base:override(v11[state_id].yaw_base:get());
            if rage.antiaim:inverter() == false then
                if math.random(0, 1) ~= 0 then
                    v3.yaw_offset:override(v11[state_id].yaw_left_offset:get() - math.random(0, v11[state_id].yaw_randomize:get()));
                else
                    v3.yaw_offset:override(v11[state_id].yaw_left_offset:get() + math.random(0, v11[state_id].yaw_randomize:get()));
                end;
            elseif math.random(0, 1) ~= 0 then
                v3.yaw_offset:override(v11[state_id].yaw_right_offset:get() - math.random(0, v11[state_id].yaw_randomize:get()));
            else
                v3.yaw_offset:override(v11[state_id].yaw_right_offset:get() + math.random(0, v11[state_id].yaw_randomize:get()));
            end;
            v3.body_yaw:override(v10[state_id].body_yaw:get());
            v3.body_yaw_inverter:override(v11[state_id].body_yaw_inverter:get());
            v3.body_yaw_left_limit:override(v11[state_id].body_yaw_left_limit:get());
            v3.body_yaw_right_limit:override(v11[state_id].body_yaw_right_limit:get());
            if v3.hide_shots:get() or v3.double_tap:get() then
                v3.body_yaw_options:override(v10[state_id].yaw_modifier:get() == "Delay" and "" or v11[state_id].body_yaw_options:get());
            else
                v3.body_yaw_options:override(v10[state_id].yaw_modifier:get() == "Delay" and "Jitter" or v11[state_id].body_yaw_options:get());
            end;
            v3.body_yaw_freestanding:override(v10[state_id].yaw_modifier:get() == "Delay" and "Off" or v11[state_id].body_yaw_freestanding:get());
            if v10[state_id].yaw_modifier:get() == "3-Way" and v11[state_id].yaw_modifier_way_type:get() == "Custom" then
                if v3.hide_shots:get() or v3.double_tap:get() then
                    if v101.command_number % 6 >= 4 then
                        if math.random(0, 1) ~= 0 then
                            v3.yaw_offset:override(v11[state_id].yaw_modifier_offset1:get() - math.random(0, v11[state_id].yaw_modifier_randomize:get()));
                        else
                            v3.yaw_offset:override(v11[state_id].yaw_modifier_offset1:get() + math.random(0, v11[state_id].yaw_modifier_randomize:get()));
                        end;
                    elseif v101.command_number % 6 >= 2 then
                        if math.random(0, 1) ~= 0 then
                            v3.yaw_offset:override(v11[state_id].yaw_modifier_offset2:get() - math.random(0, v11[state_id].yaw_modifier_randomize:get()));
                        else
                            v3.yaw_offset:override(v11[state_id].yaw_modifier_offset2:get() + math.random(0, v11[state_id].yaw_modifier_randomize:get()));
                        end;
                    elseif math.random(0, 1) ~= 0 then
                        v3.yaw_offset:override(v11[state_id].yaw_modifier_offset3:get() - math.random(0, v11[state_id].yaw_modifier_randomize:get()));
                    else
                        v3.yaw_offset:override(v11[state_id].yaw_modifier_offset3:get() + math.random(0, v11[state_id].yaw_modifier_randomize:get()));
                    end;
                elseif v101.command_number % 48 >= 32 then
                    if math.random(0, 1) ~= 0 then
                        v3.yaw_offset:override(v11[state_id].yaw_modifier_offset1:get() - math.random(0, v11[state_id].yaw_modifier_randomize:get()));
                    else
                        v3.yaw_offset:override(v11[state_id].yaw_modifier_offset1:get() + math.random(0, v11[state_id].yaw_modifier_randomize:get()));
                    end;
                elseif v101.command_number % 48 >= 16 then
                    if math.random(0, 1) ~= 0 then
                        v3.yaw_offset:override(v11[state_id].yaw_modifier_offset2:get() - math.random(0, v11[state_id].yaw_modifier_randomize:get()));
                    else
                        v3.yaw_offset:override(v11[state_id].yaw_modifier_offset2:get() + math.random(0, v11[state_id].yaw_modifier_randomize:get()));
                    end;
                elseif math.random(0, 1) ~= 0 then
                    v3.yaw_offset:override(v11[state_id].yaw_modifier_offset3:get() - math.random(0, v11[state_id].yaw_modifier_randomize:get()));
                else
                    v3.yaw_offset:override(v11[state_id].yaw_modifier_offset3:get() + math.random(0, v11[state_id].yaw_modifier_randomize:get()));
                end;
            elseif v10[state_id].yaw_modifier:get() == "5-Way" and v11[state_id].yaw_modifier_way_type:get() == "Custom" then
                if v3.hide_shots:get() or v3.double_tap:get() then
                    if v101.command_number % 10 >= 8 then
                        if math.random(0, 1) ~= 0 then
                            v3.yaw_offset:override(v11[state_id].yaw_modifier_offset1:get() - math.random(0, v11[state_id].yaw_modifier_randomize:get()));
                        else
                            v3.yaw_offset:override(v11[state_id].yaw_modifier_offset1:get() + math.random(0, v11[state_id].yaw_modifier_randomize:get()));
                        end;
                    elseif v101.command_number % 10 >= 6 then
                        if math.random(0, 1) ~= 0 then
                            v3.yaw_offset:override(v11[state_id].yaw_modifier_offset2:get() - math.random(0, v11[state_id].yaw_modifier_randomize:get()));
                        else
                            v3.yaw_offset:override(v11[state_id].yaw_modifier_offset2:get() + math.random(0, v11[state_id].yaw_modifier_randomize:get()));
                        end;
                    elseif v101.command_number % 10 >= 4 then
                        if math.random(0, 1) ~= 0 then
                            v3.yaw_offset:override(v11[state_id].yaw_modifier_offset3:get() - math.random(0, v11[state_id].yaw_modifier_randomize:get()));
                        else
                            v3.yaw_offset:override(v11[state_id].yaw_modifier_offset3:get() + math.random(0, v11[state_id].yaw_modifier_randomize:get()));
                        end;
                    elseif v101.command_number % 10 >= 2 then
                        if math.random(0, 1) ~= 0 then
                            v3.yaw_offset:override(v11[state_id].yaw_modifier_offset4:get() - math.random(0, v11[state_id].yaw_modifier_randomize:get()));
                        else
                            v3.yaw_offset:override(v11[state_id].yaw_modifier_offset4:get() + math.random(0, v11[state_id].yaw_modifier_randomize:get()));
                        end;
                    elseif math.random(0, 1) ~= 0 then
                        v3.yaw_offset:override(v11[state_id].yaw_modifier_offset5:get() - math.random(0, v11[state_id].yaw_modifier_randomize:get()));
                    else
                        v3.yaw_offset:override(v11[state_id].yaw_modifier_offset5:get() + math.random(0, v11[state_id].yaw_modifier_randomize:get()));
                    end;
                elseif v101.command_number % 80 >= 64 then
                    if math.random(0, 1) ~= 0 then
                        v3.yaw_offset:override(v11[state_id].yaw_modifier_offset1:get() - math.random(0, v11[state_id].yaw_modifier_randomize:get()));
                    else
                        v3.yaw_offset:override(v11[state_id].yaw_modifier_offset1:get() + math.random(0, v11[state_id].yaw_modifier_randomize:get()));
                    end;
                elseif v101.command_number % 80 >= 48 then
                    if math.random(0, 1) ~= 0 then
                        v3.yaw_offset:override(v11[state_id].yaw_modifier_offset2:get() - math.random(0, v11[state_id].yaw_modifier_randomize:get()));
                    else
                        v3.yaw_offset:override(v11[state_id].yaw_modifier_offset2:get() + math.random(0, v11[state_id].yaw_modifier_randomize:get()));
                    end;
                elseif v101.command_number % 80 >= 32 then
                    if math.random(0, 1) ~= 0 then
                        v3.yaw_offset:override(v11[state_id].yaw_modifier_offset3:get() - math.random(0, v11[state_id].yaw_modifier_randomize:get()));
                    else
                        v3.yaw_offset:override(v11[state_id].yaw_modifier_offset3:get() + math.random(0, v11[state_id].yaw_modifier_randomize:get()));
                    end;
                elseif v101.command_number % 80 >= 16 then
                    if math.random(0, 1) ~= 0 then
                        v3.yaw_offset:override(v11[state_id].yaw_modifier_offset4:get() - math.random(0, v11[state_id].yaw_modifier_randomize:get()));
                    else
                        v3.yaw_offset:override(v11[state_id].yaw_modifier_offset4:get() + math.random(0, v11[state_id].yaw_modifier_randomize:get()));
                    end;
                elseif math.random(0, 1) ~= 0 then
                    v3.yaw_offset:override(v11[state_id].yaw_modifier_offset5:get() - math.random(0, v11[state_id].yaw_modifier_randomize:get()));
                else
                    v3.yaw_offset:override(v11[state_id].yaw_modifier_offset5:get() + math.random(0, v11[state_id].yaw_modifier_randomize:get()));
                end;
            elseif v10[state_id].yaw_modifier:get() == "Delay" then
                v3.yaw_modifier:override("Disabled");
                v3.yaw_modifier_offset:override(0);
                if v101.command_number % v11[state_id].yaw_modifier_delay_ticks:get() + 1 > v11[state_id].yaw_modifier_delay_ticks:get() - 1 then
                    delayed_jitter = not delayed_jitter;
                end;
                if v3.hide_shots:get() or v3.double_tap:get() then
                    if rage.antiaim:inverter() == false then
                        if math.random(0, 1) ~= 0 then
                            v3.yaw_offset:override(v11[state_id].yaw_modifier_left_offset:get() - math.random(0, v11[state_id].yaw_modifier_randomize:get()));
                        else
                            v3.yaw_offset:override(v11[state_id].yaw_modifier_left_offset:get() + math.random(0, v11[state_id].yaw_modifier_randomize:get()));
                        end;
                    elseif math.random(0, 1) ~= 0 then
                        v3.yaw_offset:override(v11[state_id].yaw_modifier_right_offset:get() - math.random(0, v11[state_id].yaw_modifier_randomize:get()));
                    else
                        v3.yaw_offset:override(v11[state_id].yaw_modifier_right_offset:get() + math.random(0, v11[state_id].yaw_modifier_randomize:get()));
                    end;
                elseif rage.antiaim:inverter() == false then
                    if math.random(0, 1) ~= 0 then
                        v3.yaw_offset:override(v11[state_id].yaw_modifier_left_offset:get() - math.random(0, v11[state_id].yaw_modifier_randomize:get()));
                    else
                        v3.yaw_offset:override(v11[state_id].yaw_modifier_left_offset:get() + math.random(0, v11[state_id].yaw_modifier_randomize:get()));
                    end;
                elseif math.random(0, 1) ~= 0 then
                    v3.yaw_offset:override(v11[state_id].yaw_modifier_right_offset:get() - math.random(0, v11[state_id].yaw_modifier_randomize:get()));
                else
                    v3.yaw_offset:override(v11[state_id].yaw_modifier_right_offset:get() + math.random(0, v11[state_id].yaw_modifier_randomize:get()));
                end;
                if v3.hide_shots:get() or v3.double_tap:get() then
                    v3.body_yaw_inverter:override(delayed_jitter);
                else
                    v3.body_yaw_inverter:override(false);
                end;
            else
                v3.yaw_modifier:override(v10[state_id].yaw_modifier:get());
                if rage.antiaim:inverter() == false then
                    if math.random(0, 1) ~= 0 then
                        v3.yaw_modifier_offset:override(v11[state_id].yaw_modifier_left_offset:get() - math.random(0, v11[state_id].yaw_modifier_randomize:get()));
                    else
                        v3.yaw_modifier_offset:override(v11[state_id].yaw_modifier_left_offset:get() + math.random(0, v11[state_id].yaw_modifier_randomize:get()));
                    end;
                elseif math.random(0, 1) ~= 0 then
                    v3.yaw_modifier_offset:override(v11[state_id].yaw_modifier_right_offset:get() - math.random(0, v11[state_id].yaw_modifier_randomize:get()));
                else
                    v3.yaw_modifier_offset:override(v11[state_id].yaw_modifier_right_offset:get() + math.random(0, v11[state_id].yaw_modifier_randomize:get()));
                end;
            end;
            v3.extended_angles:override(v10[state_id].extended_angles:get());
            v3.extended_pitch:override(v11[state_id].extended_pitch:get());
            v3.extended_roll:override(v11[state_id].extended_roll:get());
            if v10[state_id].hidden_anti_aim:get() then
                v3.yaw_hidden:override(true);
                if v11[state_id].hidden_pitch:get() == "Automatic" then
                    v46.automatic_pitch(v101, v102);
                elseif v11[state_id].hidden_pitch:get() == "Random" then
                    rage.antiaim:override_hidden_pitch(math.random(v11[state_id].hidden_pitch_offset1:get(), v11[state_id].hidden_pitch_offset2:get()));
                elseif v11[state_id].hidden_pitch:get() == "Switch" then
                    if v101.command_number % ((v11[state_id].hidden_pitch_delay:get() + 1) * 10) > (v11[state_id].hidden_pitch_delay:get() - 1) * 10 then
                        pitch_switch = not pitch_switch;
                    end;
                    rage.antiaim:override_hidden_pitch(pitch_switch and v11[state_id].hidden_pitch_offset1:get() or v11[state_id].hidden_pitch_offset2:get());
                elseif v11[state_id].hidden_pitch:get() == "Custom" then
                    rage.antiaim:override_hidden_pitch(v11[state_id].hidden_pitch_offset1:get());
                end;
                if v5.safe_head:get() and v5.safe_head_hidden_anti_aim:get() and safe_head_allowed == true and entity.get_threat() ~= nil then
                    if v5.safe_head_hidden_pitch:get() == "Automatic" then
                        v46.automatic_pitch(v101, v102);
                    elseif v5.safe_head_hidden_pitch:get() == "Random" then
                        rage.antiaim:override_hidden_pitch(math.random(v5.safe_head_hidden_pitch_offset1:get(), v5.safe_head_hidden_pitch_offset2:get()));
                    elseif v5.safe_head_hidden_pitch:get() == "Switch" then
                        if v101.command_number % ((v5.safe_head_hidden_pitch_delay:get() + 1) * 10) > (v5.safe_head_hidden_pitch_delay:get() - 1) * 10 then
                            safe_pitch_switch = not safe_pitch_switch;
                        end;
                        rage.antiaim:override_hidden_pitch(safe_pitch_switch and v5.safe_head_hidden_pitch_offset1:get() or v5.safe_head_hidden_pitch_offset2:get());
                    elseif v5.safe_head_hidden_pitch:get() == "Custom" then
                        rage.antiaim:override_hidden_pitch(v5.safe_head_hidden_pitch_offset1:get());
                    end;
                end;
                if (v5.manual_yaw:get() == "Forward" or v5.manual_yaw:get() == "Backward" or v5.manual_yaw:get() == "Right" or v5.manual_yaw:get() == "Left") and v5.manual_yaw_edge:get() then
                    rage.antiaim:override_hidden_pitch(math.random(-5, 5));
                end;
                if v11[state_id].hidden_yaw:get() == "Sideways" and (v5.manual_yaw_edge:get() == false or v5.manual_yaw:get() == "Disabled") then
                    rage.antiaim:override_hidden_yaw_offset(v101.command_number % 4 >= 2 and 110 or -110);
                elseif v11[state_id].hidden_yaw:get() == "Random" and (v5.manual_yaw_edge:get() == false or v5.manual_yaw:get() == "Disabled") then
                    rage.antiaim:override_hidden_yaw_offset(math.random(-180, 180));
                elseif v11[state_id].hidden_yaw:get() == "Custom" and (v5.manual_yaw_edge:get() == false or v5.manual_yaw:get() == "Disabled") then
                    rage.antiaim:override_hidden_yaw_offset(v11[state_id].hidden_yaw_offset:get());
                end;
                if v5.safe_head:get() and v5.safe_head_hidden_anti_aim:get() and safe_head_allowed == true and entity.get_threat() ~= nil then
                    if v5.safe_head_hidden_yaw:get() == "Sideways" then
                        rage.antiaim:override_hidden_yaw_offset(v101.command_number % 4 >= 2 and 110 or -110);
                    elseif v5.safe_head_hidden_yaw:get() == "Random" then
                        rage.antiaim:override_hidden_yaw_offset(math.random(-180, 180));
                    elseif v5.safe_head_hidden_yaw:get() == "Custom" then
                        rage.antiaim:override_hidden_yaw_offset(v5.safe_head_hidden_yaw_offset:get());
                    end;
                end;
                if (v5.manual_yaw:get() == "Forward" or v5.manual_yaw:get() == "Backward" or v5.manual_yaw:get() == "Right" or v5.manual_yaw:get() == "Left") and v5.manual_yaw_edge:get() then
                    rage.antiaim:override_hidden_yaw_offset(180);
                end;
                if defensive_active then
                    v3.yaw_modifier:override("Disabled");
                    v3.body_yaw_options:override("Avoid Overlap");
                end;
            else
                v3.yaw_hidden:override(false);
            end;
        elseif v101.in_use == true and not using and not is_planting and not is_defusing then
            v101.buttons = bit.band(v101.buttons, bit.bnot(bit.lshift(1, 5)));
            anti_aim_on_use = true;
            if v5.automatic_mode_force_break_lc:get() and v5.automatic_mode_force_break_lc_choice:get("On Use") then
                if v3.double_tap:get() and v101.command_number % 3 ~= 1 and v102:get_player_weapon().m_bPinPulled ~= true then
                    v3.lag_options:override("Always On");
                else
                    v3.lag_options:override();
                end;
                if v3.hide_shots:get() and v102:get_player_weapon().m_bPinPulled ~= true then
                    v3.options:override("Break LC");
                else
                    v3.options:override();
                end;
            else
                v3.lag_options:override();
                v3.options:override();
            end;
            v3.pitch:override("Disabled");
            v3.yaw:override("Backward");
            v3.yaw_base:override("Local View");
            v3.yaw_offset:override(180);
            v3.yaw_modifier:override("Disabled");
            v3.yaw_modifier_offset:override(0);
            v3.body_yaw:override(true);
            v3.body_yaw_inverter:override(false);
            v3.body_yaw_left_limit:override(60);
            v3.body_yaw_right_limit:override(60);
            v3.body_yaw_options:override("");
            v3.body_yaw_freestanding:override("Peek Fake");
            v3.extended_angles:override(false);
            v3.extended_pitch:override(89);
            v3.extended_roll:override(45);
            if v5.automatic_mode_hidden_anti_aim:get() and v5.automatic_mode_force_break_lc:get() and v5.automatic_mode_force_break_lc_choice:get("On Use") then
                v3.yaw_hidden:override(true);
                if v9[7].hidden_pitch:get() == "Automatic" then
                    v46.automatic_pitch(v101, v102);
                elseif v9[7].hidden_pitch:get() == "Random" then
                    rage.antiaim:override_hidden_pitch(math.random(v9[7].hidden_pitch_offset1:get(), v9[7].hidden_pitch_offset2:get()));
                elseif v9[7].hidden_pitch:get() == "Switch" then
                    if v101.command_number % ((v9[7].hidden_pitch_delay:get() + 1) * 10) > (v9[7].hidden_pitch_delay:get() - 1) * 10 then
                        pitch_switch = not pitch_switch;
                    end;
                    rage.antiaim:override_hidden_pitch(pitch_switch and v9[7].hidden_pitch_offset1:get() or v9[7].hidden_pitch_offset2:get());
                elseif v9[7].hidden_pitch:get() == "Custom" then
                    rage.antiaim:override_hidden_pitch(v9[7].hidden_pitch_offset1:get());
                end;
                if v5.safe_head:get() and v5.safe_head_hidden_anti_aim:get() and safe_head_allowed == true and entity.get_threat() ~= nil then
                    if v5.safe_head_hidden_pitch:get() == "Automatic" then
                        v46.automatic_pitch(v101, v102);
                    elseif v5.safe_head_hidden_pitch:get() == "Random" then
                        rage.antiaim:override_hidden_pitch(math.random(v5.safe_head_hidden_pitch_offset1:get(), v5.safe_head_hidden_pitch_offset2:get()));
                    elseif v5.safe_head_hidden_pitch:get() == "Switch" then
                        if v101.command_number % ((v5.safe_head_hidden_pitch_delay:get() + 1) * 10) > (v5.safe_head_hidden_pitch_delay:get() - 1) * 10 then
                            safe_pitch_switch = not safe_pitch_switch;
                        end;
                        rage.antiaim:override_hidden_pitch(safe_pitch_switch and v5.safe_head_hidden_pitch_offset1:get() or v5.safe_head_hidden_pitch_offset2:get());
                    elseif v5.safe_head_hidden_pitch:get() == "Custom" then
                        rage.antiaim:override_hidden_pitch(v5.safe_head_hidden_pitch_offset1:get());
                    end;
                end;
                if (v5.manual_yaw:get() == "Forward" or v5.manual_yaw:get() == "Backward" or v5.manual_yaw:get() == "Right" or v5.manual_yaw:get() == "Left") and v5.manual_yaw_edge:get() then
                    rage.antiaim:override_hidden_pitch(math.random(-5, 5));
                end;
                if v9[7].hidden_yaw:get() == "Sideways" and (v5.manual_yaw_edge:get() == false or v5.manual_yaw:get() == "Disabled") then
                    rage.antiaim:override_hidden_yaw_offset(v101.command_number % 4 >= 2 and 110 or -110);
                elseif v9[7].hidden_yaw:get() == "Random" and (v5.manual_yaw_edge:get() == false or v5.manual_yaw:get() == "Disabled") then
                    rage.antiaim:override_hidden_yaw_offset(math.random(-180, 180));
                elseif v9[7].hidden_yaw:get() == "Custom" and (v5.manual_yaw_edge:get() == false or v5.manual_yaw:get() == "Disabled") then
                    rage.antiaim:override_hidden_yaw_offset(v9[7].hidden_yaw_offset:get());
                end;
                if v5.safe_head:get() and v5.safe_head_hidden_anti_aim:get() and safe_head_allowed == true and entity.get_threat() ~= nil then
                    if v5.safe_head_hidden_yaw:get() == "Sideways" then
                        rage.antiaim:override_hidden_yaw_offset(v101.command_number % 4 >= 2 and 110 or -110);
                    elseif v5.safe_head_hidden_yaw:get() == "Random" then
                        rage.antiaim:override_hidden_yaw_offset(math.random(-180, 180));
                    elseif v5.safe_head_hidden_yaw:get() == "Custom" then
                        rage.antiaim:override_hidden_yaw_offset(v5.safe_head_hidden_yaw_offset:get());
                    end;
                end;
                if (v5.manual_yaw:get() == "Forward" or v5.manual_yaw:get() == "Backward" or v5.manual_yaw:get() == "Right" or v5.manual_yaw:get() == "Left") and v5.manual_yaw_edge:get() then
                    rage.antiaim:override_hidden_yaw_offset(180);
                end;
                if defensive_active then
                    v3.yaw_modifier:override("Disabled");
                    v3.body_yaw_options:override("Avoid Overlap");
                end;
            else
                v3.yaw_hidden:override(false);
            end;
        elseif v3.hide_shots:get() == false and v3.double_tap:get() == false or v3.fake_duck:get() then
            anti_aim_on_use = false;
            v3.lag_options:override();
            v3.options:override();
            v3.pitch:override("Down");
            v3.yaw:override("Backward");
            v3.yaw_base:override("At Target");
            v3.yaw_offset:override(7);
            v3.yaw_hidden:override(false);
            v3.yaw_modifier:override("Center");
            v3.yaw_modifier_offset:override(-52);
            v3.body_yaw:override(true);
            v3.body_yaw_inverter:override(false);
            v3.body_yaw_left_limit:override(60);
            v3.body_yaw_right_limit:override(60);
            v3.body_yaw_options:override("Jitter");
            v3.body_yaw_freestanding:override("Off");
            v3.extended_angles:override(false);
            v3.extended_pitch:override(89);
            v3.extended_roll:override(45);
        elseif (v101.in_jump == true or bit.band(v102.m_fFlags, 1) == 0) and v102.m_flDuckAmount ~= 0 then
            anti_aim_on_use = false;
            if v5.automatic_mode_force_break_lc:get() and v5.automatic_mode_force_break_lc_choice:get("In Air & Crouching") then
                if v3.double_tap:get() and v101.command_number % 3 ~= 1 and v102:get_player_weapon().m_bPinPulled ~= true then
                    v3.lag_options:override("Always On");
                else
                    v3.lag_options:override();
                end;
                if v3.hide_shots:get() and v102:get_player_weapon().m_bPinPulled ~= true then
                    v3.options:override("Break LC");
                else
                    v3.options:override();
                end;
            else
                v3.lag_options:override();
                v3.options:override();
            end;
            v3.pitch:override("Down");
            v3.yaw:override("Backward");
            v3.yaw_base:override("At Target");
            if v101.command_number % 7 > 5 then
                delayed_jitter = not delayed_jitter;
            end;
            v3.yaw_offset:override(rage.antiaim:inverter() == true and -25 or 40);
            v3.yaw_modifier:override("Disabled");
            v3.yaw_modifier_offset:override(0);
            v3.body_yaw:override(true);
            v3.body_yaw_inverter:override(delayed_jitter);
            v3.body_yaw_left_limit:override(60);
            v3.body_yaw_right_limit:override(60);
            v3.body_yaw_options:override("");
            v3.body_yaw_freestanding:override("Off");
            v3.extended_angles:override(false);
            v3.extended_pitch:override(89);
            v3.extended_roll:override(45);
            if v5.automatic_mode_hidden_anti_aim:get() and v5.automatic_mode_force_break_lc:get() and v5.automatic_mode_force_break_lc_choice:get("In Air & Crouching") then
                v3.yaw_hidden:override(true);
                if v9[6].hidden_pitch:get() == "Automatic" then
                    v46.automatic_pitch(v101, v102);
                elseif v9[6].hidden_pitch:get() == "Random" then
                    rage.antiaim:override_hidden_pitch(math.random(v9[6].hidden_pitch_offset1:get(), v9[6].hidden_pitch_offset2:get()));
                elseif v9[6].hidden_pitch:get() == "Switch" then
                    if v101.command_number % ((v9[6].hidden_pitch_delay:get() + 1) * 10) > (v9[6].hidden_pitch_delay:get() - 1) * 10 then
                        pitch_switch = not pitch_switch;
                    end;
                    rage.antiaim:override_hidden_pitch(pitch_switch and v9[6].hidden_pitch_offset1:get() or v9[6].hidden_pitch_offset2:get());
                elseif v9[6].hidden_pitch:get() == "Custom" then
                    rage.antiaim:override_hidden_pitch(v9[6].hidden_pitch_offset1:get());
                end;
                if v5.safe_head:get() and v5.safe_head_hidden_anti_aim:get() and safe_head_allowed == true and entity.get_threat() ~= nil then
                    if v5.safe_head_hidden_pitch:get() == "Automatic" then
                        v46.automatic_pitch(v101, v102);
                    elseif v5.safe_head_hidden_pitch:get() == "Random" then
                        rage.antiaim:override_hidden_pitch(math.random(v5.safe_head_hidden_pitch_offset1:get(), v5.safe_head_hidden_pitch_offset2:get()));
                    elseif v5.safe_head_hidden_pitch:get() == "Switch" then
                        if v101.command_number % ((v5.safe_head_hidden_pitch_delay:get() + 1) * 10) > (v5.safe_head_hidden_pitch_delay:get() - 1) * 10 then
                            safe_pitch_switch = not safe_pitch_switch;
                        end;
                        rage.antiaim:override_hidden_pitch(safe_pitch_switch and v5.safe_head_hidden_pitch_offset1:get() or v5.safe_head_hidden_pitch_offset2:get());
                    elseif v5.safe_head_hidden_pitch:get() == "Custom" then
                        rage.antiaim:override_hidden_pitch(v5.safe_head_hidden_pitch_offset1:get());
                    end;
                end;
                if (v5.manual_yaw:get() == "Forward" or v5.manual_yaw:get() == "Backward" or v5.manual_yaw:get() == "Right" or v5.manual_yaw:get() == "Left") and v5.manual_yaw_edge:get() then
                    rage.antiaim:override_hidden_pitch(math.random(-5, 5));
                end;
                if v9[6].hidden_yaw:get() == "Sideways" and (v5.manual_yaw_edge:get() == false or v5.manual_yaw:get() == "Disabled") then
                    rage.antiaim:override_hidden_yaw_offset(v101.command_number % 4 >= 2 and 110 or -110);
                elseif v9[6].hidden_yaw:get() == "Random" and (v5.manual_yaw_edge:get() == false or v5.manual_yaw:get() == "Disabled") then
                    rage.antiaim:override_hidden_yaw_offset(math.random(-180, 180));
                elseif v9[6].hidden_yaw:get() == "Custom" and (v5.manual_yaw_edge:get() == false or v5.manual_yaw:get() == "Disabled") then
                    rage.antiaim:override_hidden_yaw_offset(v9[6].hidden_yaw_offset:get());
                end;
                if v5.safe_head:get() and v5.safe_head_hidden_anti_aim:get() and safe_head_allowed == true and entity.get_threat() ~= nil then
                    if v5.safe_head_hidden_yaw:get() == "Sideways" then
                        rage.antiaim:override_hidden_yaw_offset(v101.command_number % 4 >= 2 and 110 or -110);
                    elseif v5.safe_head_hidden_yaw:get() == "Random" then
                        rage.antiaim:override_hidden_yaw_offset(math.random(-180, 180));
                    elseif v5.safe_head_hidden_yaw:get() == "Custom" then
                        rage.antiaim:override_hidden_yaw_offset(v5.safe_head_hidden_yaw_offset:get());
                    end;
                end;
                if (v5.manual_yaw:get() == "Forward" or v5.manual_yaw:get() == "Backward" or v5.manual_yaw:get() == "Right" or v5.manual_yaw:get() == "Left") and v5.manual_yaw_edge:get() then
                    rage.antiaim:override_hidden_yaw_offset(180);
                end;
                if defensive_active then
                    v3.yaw_modifier:override("Disabled");
                    v3.body_yaw_options:override("Avoid Overlap");
                end;
            else
                v3.yaw_hidden:override(false);
            end;
        elseif (v101.in_jump == true or bit.band(v102.m_fFlags, 1) == 0) and v102.m_flDuckAmount ~= 1 then
            anti_aim_on_use = false;
            if v5.automatic_mode_force_break_lc:get() and v5.automatic_mode_force_break_lc_choice:get("In Air") then
                if v3.double_tap:get() and v101.command_number % 3 ~= 1 and v102:get_player_weapon().m_bPinPulled ~= true then
                    v3.lag_options:override("Always On");
                else
                    v3.lag_options:override();
                end;
                if v3.hide_shots:get() and v102:get_player_weapon().m_bPinPulled ~= true then
                    v3.options:override("Break LC");
                else
                    v3.options:override();
                end;
            else
                v3.lag_options:override();
                v3.options:override();
            end;
            v3.pitch:override("Down");
            v3.yaw:override("Backward");
            v3.yaw_base:override("At Target");
            v3.yaw_offset:override(0);
            v3.yaw_modifier:override("Disabled");
            v3.yaw_modifier_offset:override(0);
            v3.body_yaw:override(true);
            v3.body_yaw_inverter:override(false);
            v3.body_yaw_left_limit:override(60);
            v3.body_yaw_right_limit:override(60);
            v3.body_yaw_options:override("Avoid Overlap", "Jitter");
            v3.body_yaw_freestanding:override("Peek Real");
            v3.extended_angles:override(false);
            v3.extended_pitch:override(89);
            v3.extended_roll:override(45);
            if v5.automatic_mode_hidden_anti_aim:get() and v5.automatic_mode_force_break_lc:get() and v5.automatic_mode_force_break_lc_choice:get("In Air") then
                v3.yaw_hidden:override(true);
                if v9[5].hidden_pitch:get() == "Automatic" then
                    v46.automatic_pitch(v101, v102);
                elseif v9[5].hidden_pitch:get() == "Random" then
                    rage.antiaim:override_hidden_pitch(math.random(v9[5].hidden_pitch_offset1:get(), v9[5].hidden_pitch_offset2:get()));
                elseif v9[5].hidden_pitch:get() == "Switch" then
                    if v101.command_number % ((v9[5].hidden_pitch_delay:get() + 1) * 10) > (v9[5].hidden_pitch_delay:get() - 1) * 10 then
                        pitch_switch = not pitch_switch;
                    end;
                    rage.antiaim:override_hidden_pitch(pitch_switch and v9[5].hidden_pitch_offset1:get() or v9[5].hidden_pitch_offset2:get());
                elseif v9[5].hidden_pitch:get() == "Custom" then
                    rage.antiaim:override_hidden_pitch(v9[5].hidden_pitch_offset1:get());
                end;
                if v5.safe_head:get() and v5.safe_head_hidden_anti_aim:get() and safe_head_allowed == true and entity.get_threat() ~= nil then
                    if v5.safe_head_hidden_pitch:get() == "Automatic" then
                        v46.automatic_pitch(v101, v102);
                    elseif v5.safe_head_hidden_pitch:get() == "Random" then
                        rage.antiaim:override_hidden_pitch(math.random(v5.safe_head_hidden_pitch_offset1:get(), v5.safe_head_hidden_pitch_offset2:get()));
                    elseif v5.safe_head_hidden_pitch:get() == "Switch" then
                        if v101.command_number % ((v5.safe_head_hidden_pitch_delay:get() + 1) * 10) > (v5.safe_head_hidden_pitch_delay:get() - 1) * 10 then
                            safe_pitch_switch = not safe_pitch_switch;
                        end;
                        rage.antiaim:override_hidden_pitch(safe_pitch_switch and v5.safe_head_hidden_pitch_offset1:get() or v5.safe_head_hidden_pitch_offset2:get());
                    elseif v5.safe_head_hidden_pitch:get() == "Custom" then
                        rage.antiaim:override_hidden_pitch(v5.safe_head_hidden_pitch_offset1:get());
                    end;
                end;
                if (v5.manual_yaw:get() == "Forward" or v5.manual_yaw:get() == "Backward" or v5.manual_yaw:get() == "Right" or v5.manual_yaw:get() == "Left") and v5.manual_yaw_edge:get() then
                    rage.antiaim:override_hidden_pitch(math.random(-5, 5));
                end;
                if v9[5].hidden_yaw:get() == "Sideways" and (v5.manual_yaw_edge:get() == false or v5.manual_yaw:get() == "Disabled") then
                    rage.antiaim:override_hidden_yaw_offset(v101.command_number % 4 >= 2 and 110 or -110);
                elseif v9[5].hidden_yaw:get() == "Random" and (v5.manual_yaw_edge:get() == false or v5.manual_yaw:get() == "Disabled") then
                    rage.antiaim:override_hidden_yaw_offset(math.random(-180, 180));
                elseif v9[5].hidden_yaw:get() == "Custom" and (v5.manual_yaw_edge:get() == false or v5.manual_yaw:get() == "Disabled") then
                    rage.antiaim:override_hidden_yaw_offset(v9[5].hidden_yaw_offset:get());
                end;
                if v5.safe_head:get() and v5.safe_head_hidden_anti_aim:get() and safe_head_allowed == true and entity.get_threat() ~= nil then
                    if v5.safe_head_hidden_yaw:get() == "Sideways" then
                        rage.antiaim:override_hidden_yaw_offset(v101.command_number % 4 >= 2 and 110 or -110);
                    elseif v5.safe_head_hidden_yaw:get() == "Random" then
                        rage.antiaim:override_hidden_yaw_offset(math.random(-180, 180));
                    elseif v5.safe_head_hidden_yaw:get() == "Custom" then
                        rage.antiaim:override_hidden_yaw_offset(v5.safe_head_hidden_yaw_offset:get());
                    end;
                end;
                if (v5.manual_yaw:get() == "Forward" or v5.manual_yaw:get() == "Backward" or v5.manual_yaw:get() == "Right" or v5.manual_yaw:get() == "Left") and v5.manual_yaw_edge:get() then
                    rage.antiaim:override_hidden_yaw_offset(180);
                end;
                if defensive_active then
                    v3.yaw_modifier:override("Disabled");
                    v3.body_yaw_options:override("Avoid Overlap");
                end;
            else
                v3.yaw_hidden:override(false);
            end;
        elseif v102.m_flDuckAmount ~= 0 and bit.band(v102.m_fFlags, 1) ~= 0 then
            anti_aim_on_use = false;
            if v5.automatic_mode_force_break_lc:get() and v5.automatic_mode_force_break_lc_choice:get("Crouching") then
                if v3.double_tap:get() and v101.command_number % 3 ~= 1 and v102:get_player_weapon().m_bPinPulled ~= true then
                    v3.lag_options:override("Always On");
                else
                    v3.lag_options:override();
                end;
                if v3.hide_shots:get() and v102:get_player_weapon().m_bPinPulled ~= true then
                    v3.options:override("Break LC");
                else
                    v3.options:override();
                end;
            else
                v3.lag_options:override();
                v3.options:override();
            end;
            v3.pitch:override("Down");
            v3.yaw:override("Backward");
            v3.yaw_base:override("At Target");
            if v101.command_number % 4 > 2 then
                delayed_jitter = not delayed_jitter;
            end;
            v3.yaw_offset:override(rage.antiaim:inverter() == true and -23 or 37);
            v3.yaw_modifier:override("Disabled");
            v3.yaw_modifier_offset:override(0);
            v3.body_yaw:override(true);
            v3.body_yaw_inverter:override(delayed_jitter);
            v3.body_yaw_left_limit:override(60);
            v3.body_yaw_right_limit:override(60);
            v3.body_yaw_options:override("");
            v3.body_yaw_freestanding:override("Off");
            v3.extended_angles:override(false);
            v3.extended_pitch:override(89);
            v3.extended_roll:override(45);
            if v5.automatic_mode_hidden_anti_aim:get() and v5.automatic_mode_force_break_lc:get() and v5.automatic_mode_force_break_lc_choice:get("Crouching") then
                v3.yaw_hidden:override(true);
                if v9[4].hidden_pitch:get() == "Automatic" then
                    v46.automatic_pitch(v101, v102);
                elseif v9[4].hidden_pitch:get() == "Random" then
                    rage.antiaim:override_hidden_pitch(math.random(v9[4].hidden_pitch_offset1:get(), v9[4].hidden_pitch_offset2:get()));
                elseif v9[4].hidden_pitch:get() == "Switch" then
                    if v101.command_number % ((v9[4].hidden_pitch_delay:get() + 1) * 10) > (v9[4].hidden_pitch_delay:get() - 1) * 10 then
                        pitch_switch = not pitch_switch;
                    end;
                    rage.antiaim:override_hidden_pitch(pitch_switch and v9[4].hidden_pitch_offset1:get() or v9[4].hidden_pitch_offset2:get());
                elseif v9[4].hidden_pitch:get() == "Custom" then
                    rage.antiaim:override_hidden_pitch(v9[4].hidden_pitch_offset1:get());
                end;
                if v5.safe_head:get() and v5.safe_head_hidden_anti_aim:get() and safe_head_allowed == true and entity.get_threat() ~= nil then
                    if v5.safe_head_hidden_pitch:get() == "Automatic" then
                        v46.automatic_pitch(v101, v102);
                    elseif v5.safe_head_hidden_pitch:get() == "Random" then
                        rage.antiaim:override_hidden_pitch(math.random(v5.safe_head_hidden_pitch_offset1:get(), v5.safe_head_hidden_pitch_offset2:get()));
                    elseif v5.safe_head_hidden_pitch:get() == "Switch" then
                        if v101.command_number % ((v5.safe_head_hidden_pitch_delay:get() + 1) * 10) > (v5.safe_head_hidden_pitch_delay:get() - 1) * 10 then
                            safe_pitch_switch = not safe_pitch_switch;
                        end;
                        rage.antiaim:override_hidden_pitch(safe_pitch_switch and v5.safe_head_hidden_pitch_offset1:get() or v5.safe_head_hidden_pitch_offset2:get());
                    elseif v5.safe_head_hidden_pitch:get() == "Custom" then
                        rage.antiaim:override_hidden_pitch(v5.safe_head_hidden_pitch_offset1:get());
                    end;
                end;
                if (v5.manual_yaw:get() == "Forward" or v5.manual_yaw:get() == "Backward" or v5.manual_yaw:get() == "Right" or v5.manual_yaw:get() == "Left") and v5.manual_yaw_edge:get() then
                    rage.antiaim:override_hidden_pitch(math.random(-5, 5));
                end;
                if v9[4].hidden_yaw:get() == "Sideways" and (v5.manual_yaw_edge:get() == false or v5.manual_yaw:get() == "Disabled") then
                    rage.antiaim:override_hidden_yaw_offset(v101.command_number % 4 >= 2 and 110 or -110);
                elseif v9[4].hidden_yaw:get() == "Random" and (v5.manual_yaw_edge:get() == false or v5.manual_yaw:get() == "Disabled") then
                    rage.antiaim:override_hidden_yaw_offset(math.random(-180, 180));
                elseif v9[4].hidden_yaw:get() == "Custom" and (v5.manual_yaw_edge:get() == false or v5.manual_yaw:get() == "Disabled") then
                    rage.antiaim:override_hidden_yaw_offset(v9[4].hidden_yaw_offset:get());
                end;
                if v5.safe_head:get() and v5.safe_head_hidden_anti_aim:get() and safe_head_allowed == true and entity.get_threat() ~= nil then
                    if v5.safe_head_hidden_yaw:get() == "Sideways" then
                        rage.antiaim:override_hidden_yaw_offset(v101.command_number % 4 >= 2 and 110 or -110);
                    elseif v5.safe_head_hidden_yaw:get() == "Random" then
                        rage.antiaim:override_hidden_yaw_offset(math.random(-180, 180));
                    elseif v5.safe_head_hidden_yaw:get() == "Custom" then
                        rage.antiaim:override_hidden_yaw_offset(v5.safe_head_hidden_yaw_offset:get());
                    end;
                end;
                if (v5.manual_yaw:get() == "Forward" or v5.manual_yaw:get() == "Backward" or v5.manual_yaw:get() == "Right" or v5.manual_yaw:get() == "Left") and v5.manual_yaw_edge:get() then
                    rage.antiaim:override_hidden_yaw_offset(180);
                end;
                if defensive_active then
                    v3.yaw_modifier:override("Disabled");
                    v3.body_yaw_options:override("Avoid Overlap");
                end;
            else
                v3.yaw_hidden:override(false);
            end;
        elseif v102.m_vecVelocity:length() > 2 and bit.band(v102.m_fFlags, 1) ~= 0 and v102.m_flDuckAmount ~= 1 and v3.slow_walk:get() then
            anti_aim_on_use = false;
            if v5.automatic_mode_force_break_lc:get() and v5.automatic_mode_force_break_lc_choice:get("Slow Walking") then
                if v3.double_tap:get() and v101.command_number % 3 ~= 1 and v102:get_player_weapon().m_bPinPulled ~= true then
                    v3.lag_options:override("Always On");
                else
                    v3.lag_options:override();
                end;
                if v3.hide_shots:get() and v102:get_player_weapon().m_bPinPulled ~= true then
                    v3.options:override("Break LC");
                else
                    v3.options:override();
                end;
            else
                v3.lag_options:override();
                v3.options:override();
            end;
            v3.pitch:override("Down");
            v3.yaw:override("Backward");
            v3.yaw_base:override("At Target");
            if v101.command_number % 9 > 7 then
                delayed_jitter = not delayed_jitter;
            end;
            if v102:get_player_weapon():get_classname() == "CKnife" then
                v3.yaw_offset:override(rage.antiaim:inverter() == true and -35 or 55);
            else
                v3.yaw_offset:override(rage.antiaim:inverter() == true and -25 or 45);
            end;
            v3.yaw_modifier:override("Disabled");
            v3.yaw_modifier_offset:override(0);
            v3.body_yaw:override(true);
            v3.body_yaw_inverter:override(delayed_jitter);
            v3.body_yaw_left_limit:override(60);
            v3.body_yaw_right_limit:override(60);
            v3.body_yaw_options:override("");
            v3.body_yaw_freestanding:override("Off");
            v3.extended_angles:override(false);
            v3.extended_pitch:override(89);
            v3.extended_roll:override(45);
            if v5.automatic_mode_hidden_anti_aim:get() and v5.automatic_mode_force_break_lc:get() and v5.automatic_mode_force_break_lc_choice:get("Slow Walking") then
                v3.yaw_hidden:override(true);
                if v9[3].hidden_pitch:get() == "Automatic" then
                    v46.automatic_pitch(v101, v102);
                elseif v9[3].hidden_pitch:get() == "Random" then
                    rage.antiaim:override_hidden_pitch(math.random(v9[3].hidden_pitch_offset1:get(), v9[3].hidden_pitch_offset2:get()));
                elseif v9[3].hidden_pitch:get() == "Switch" then
                    if v101.command_number % ((v9[3].hidden_pitch_delay:get() + 1) * 10) > (v9[3].hidden_pitch_delay:get() - 1) * 10 then
                        pitch_switch = not pitch_switch;
                    end;
                    rage.antiaim:override_hidden_pitch(pitch_switch and v9[3].hidden_pitch_offset1:get() or v9[3].hidden_pitch_offset2:get());
                elseif v9[3].hidden_pitch:get() == "Custom" then
                    rage.antiaim:override_hidden_pitch(v9[3].hidden_pitch_offset1:get());
                end;
                if v5.safe_head:get() and v5.safe_head_hidden_anti_aim:get() and safe_head_allowed == true and entity.get_threat() ~= nil then
                    if v5.safe_head_hidden_pitch:get() == "Automatic" then
                        v46.automatic_pitch(v101, v102);
                    elseif v5.safe_head_hidden_pitch:get() == "Random" then
                        rage.antiaim:override_hidden_pitch(math.random(v5.safe_head_hidden_pitch_offset1:get(), v5.safe_head_hidden_pitch_offset2:get()));
                    elseif v5.safe_head_hidden_pitch:get() == "Switch" then
                        if v101.command_number % ((v5.safe_head_hidden_pitch_delay:get() + 1) * 10) > (v5.safe_head_hidden_pitch_delay:get() - 1) * 10 then
                            safe_pitch_switch = not safe_pitch_switch;
                        end;
                        rage.antiaim:override_hidden_pitch(safe_pitch_switch and v5.safe_head_hidden_pitch_offset1:get() or v5.safe_head_hidden_pitch_offset2:get());
                    elseif v5.safe_head_hidden_pitch:get() == "Custom" then
                        rage.antiaim:override_hidden_pitch(v5.safe_head_hidden_pitch_offset1:get());
                    end;
                end;
                if (v5.manual_yaw:get() == "Forward" or v5.manual_yaw:get() == "Backward" or v5.manual_yaw:get() == "Right" or v5.manual_yaw:get() == "Left") and v5.manual_yaw_edge:get() then
                    rage.antiaim:override_hidden_pitch(math.random(-5, 5));
                end;
                if v9[3].hidden_yaw:get() == "Sideways" and (v5.manual_yaw_edge:get() == false or v5.manual_yaw:get() == "Disabled") then
                    rage.antiaim:override_hidden_yaw_offset(v101.command_number % 4 >= 2 and 110 or -110);
                elseif v9[3].hidden_yaw:get() == "Random" and (v5.manual_yaw_edge:get() == false or v5.manual_yaw:get() == "Disabled") then
                    rage.antiaim:override_hidden_yaw_offset(math.random(-180, 180));
                elseif v9[3].hidden_yaw:get() == "Custom" and (v5.manual_yaw_edge:get() == false or v5.manual_yaw:get() == "Disabled") then
                    rage.antiaim:override_hidden_yaw_offset(v9[3].hidden_yaw_offset:get());
                end;
                if v5.safe_head:get() and v5.safe_head_hidden_anti_aim:get() and safe_head_allowed == true and entity.get_threat() ~= nil then
                    if v5.safe_head_hidden_yaw:get() == "Sideways" then
                        rage.antiaim:override_hidden_yaw_offset(v101.command_number % 4 >= 2 and 110 or -110);
                    elseif v5.safe_head_hidden_yaw:get() == "Random" then
                        rage.antiaim:override_hidden_yaw_offset(math.random(-180, 180));
                    elseif v5.safe_head_hidden_yaw:get() == "Custom" then
                        rage.antiaim:override_hidden_yaw_offset(v5.safe_head_hidden_yaw_offset:get());
                    end;
                end;
                if (v5.manual_yaw:get() == "Forward" or v5.manual_yaw:get() == "Backward" or v5.manual_yaw:get() == "Right" or v5.manual_yaw:get() == "Left") and v5.manual_yaw_edge:get() then
                    rage.antiaim:override_hidden_yaw_offset(180);
                end;
                if defensive_active then
                    v3.yaw_modifier:override("Disabled");
                    v3.body_yaw_options:override("Avoid Overlap");
                end;
            else
                v3.yaw_hidden:override(false);
            end;
        elseif v102.m_vecVelocity:length() > 2 and bit.band(v102.m_fFlags, 1) ~= 0 and v102.m_flDuckAmount ~= 1 and not v3.slow_walk:get() then
            anti_aim_on_use = false;
            if v5.automatic_mode_force_break_lc:get() and v5.automatic_mode_force_break_lc_choice:get("Moving") then
                if v3.double_tap:get() and v101.command_number % 3 ~= 1 and v102:get_player_weapon().m_bPinPulled ~= true then
                    v3.lag_options:override("Always On");
                else
                    v3.lag_options:override();
                end;
                if v3.hide_shots:get() and v102:get_player_weapon().m_bPinPulled ~= true then
                    v3.options:override("Break LC");
                else
                    v3.options:override();
                end;
            else
                v3.lag_options:override();
                v3.options:override();
            end;
            v3.pitch:override("Down");
            v3.yaw:override("Backward");
            v3.yaw_base:override("At Target");
            if v101.command_number % 8 > 6 then
                delayed_jitter = not delayed_jitter;
            end;
            if v102:get_player_weapon():get_classname() == "CKnife" then
                v3.yaw_offset:override(rage.antiaim:inverter() == true and -35 or 55);
            else
                v3.yaw_offset:override(rage.antiaim:inverter() == true and -25 or 45);
            end;
            v3.yaw_modifier:override("Disabled");
            v3.yaw_modifier_offset:override(0);
            v3.body_yaw:override(true);
            v3.body_yaw_inverter:override(delayed_jitter);
            v3.body_yaw_left_limit:override(60);
            v3.body_yaw_right_limit:override(60);
            v3.body_yaw_options:override("");
            v3.body_yaw_freestanding:override("Off");
            v3.extended_angles:override(false);
            v3.extended_pitch:override(89);
            v3.extended_roll:override(45);
            if v5.automatic_mode_hidden_anti_aim:get() and v5.automatic_mode_force_break_lc:get() and v5.automatic_mode_force_break_lc_choice:get("Moving") then
                v3.yaw_hidden:override(true);
                if v9[2].hidden_pitch:get() == "Automatic" then
                    v46.automatic_pitch(v101, v102);
                elseif v9[2].hidden_pitch:get() == "Random" then
                    rage.antiaim:override_hidden_pitch(math.random(v9[2].hidden_pitch_offset1:get(), v9[2].hidden_pitch_offset2:get()));
                elseif v9[2].hidden_pitch:get() == "Switch" then
                    if v101.command_number % ((v9[2].hidden_pitch_delay:get() + 1) * 10) > (v9[2].hidden_pitch_delay:get() - 1) * 10 then
                        pitch_switch = not pitch_switch;
                    end;
                    rage.antiaim:override_hidden_pitch(pitch_switch and v9[2].hidden_pitch_offset1:get() or v9[2].hidden_pitch_offset2:get());
                elseif v9[2].hidden_pitch:get() == "Custom" then
                    rage.antiaim:override_hidden_pitch(v9[2].hidden_pitch_offset1:get());
                end;
                if v5.safe_head:get() and v5.safe_head_hidden_anti_aim:get() and safe_head_allowed == true and entity.get_threat() ~= nil then
                    if v5.safe_head_hidden_pitch:get() == "Automatic" then
                        v46.automatic_pitch(v101, v102);
                    elseif v5.safe_head_hidden_pitch:get() == "Random" then
                        rage.antiaim:override_hidden_pitch(math.random(v5.safe_head_hidden_pitch_offset1:get(), v5.safe_head_hidden_pitch_offset2:get()));
                    elseif v5.safe_head_hidden_pitch:get() == "Switch" then
                        if v101.command_number % ((v5.safe_head_hidden_pitch_delay:get() + 1) * 10) > (v5.safe_head_hidden_pitch_delay:get() - 1) * 10 then
                            safe_pitch_switch = not safe_pitch_switch;
                        end;
                        rage.antiaim:override_hidden_pitch(safe_pitch_switch and v5.safe_head_hidden_pitch_offset1:get() or v5.safe_head_hidden_pitch_offset2:get());
                    elseif v5.safe_head_hidden_pitch:get() == "Custom" then
                        rage.antiaim:override_hidden_pitch(v5.safe_head_hidden_pitch_offset1:get());
                    end;
                end;
                if (v5.manual_yaw:get() == "Forward" or v5.manual_yaw:get() == "Backward" or v5.manual_yaw:get() == "Right" or v5.manual_yaw:get() == "Left") and v5.manual_yaw_edge:get() then
                    rage.antiaim:override_hidden_pitch(math.random(-5, 5));
                end;
                if v9[2].hidden_yaw:get() == "Sideways" and (v5.manual_yaw_edge:get() == false or v5.manual_yaw:get() == "Disabled") then
                    rage.antiaim:override_hidden_yaw_offset(v101.command_number % 4 >= 2 and 110 or -110);
                elseif v9[2].hidden_yaw:get() == "Random" and (v5.manual_yaw_edge:get() == false or v5.manual_yaw:get() == "Disabled") then
                    rage.antiaim:override_hidden_yaw_offset(math.random(-180, 180));
                elseif v9[2].hidden_yaw:get() == "Custom" and (v5.manual_yaw_edge:get() == false or v5.manual_yaw:get() == "Disabled") then
                    rage.antiaim:override_hidden_yaw_offset(v9[2].hidden_yaw_offset:get());
                end;
                if v5.safe_head:get() and v5.safe_head_hidden_anti_aim:get() and safe_head_allowed == true and entity.get_threat() ~= nil then
                    if v5.safe_head_hidden_yaw:get() == "Sideways" then
                        rage.antiaim:override_hidden_yaw_offset(v101.command_number % 4 >= 2 and 110 or -110);
                    elseif v5.safe_head_hidden_yaw:get() == "Random" then
                        rage.antiaim:override_hidden_yaw_offset(math.random(-180, 180));
                    elseif v5.safe_head_hidden_yaw:get() == "Custom" then
                        rage.antiaim:override_hidden_yaw_offset(v5.safe_head_hidden_yaw_offset:get());
                    end;
                end;
                if (v5.manual_yaw:get() == "Forward" or v5.manual_yaw:get() == "Backward" or v5.manual_yaw:get() == "Right" or v5.manual_yaw:get() == "Left") and v5.manual_yaw_edge:get() then
                    rage.antiaim:override_hidden_yaw_offset(180);
                end;
                if defensive_active then
                    v3.yaw_modifier:override("Disabled");
                    v3.body_yaw_options:override("Avoid Overlap");
                end;
            else
                v3.yaw_hidden:override(false);
            end;
        elseif v102.m_vecVelocity:length() < 2 and v102.m_flDuckAmount ~= 1 and bit.band(v102.m_fFlags, 1) ~= 0 then
            anti_aim_on_use = false;
            if v5.automatic_mode_force_break_lc:get() and v5.automatic_mode_force_break_lc_choice:get("Standing") then
                if v3.double_tap:get() and v101.command_number % 3 ~= 1 and v102:get_player_weapon().m_bPinPulled ~= true then
                    v3.lag_options:override("Always On");
                else
                    v3.lag_options:override();
                end;
                if v3.hide_shots:get() and v102:get_player_weapon().m_bPinPulled ~= true then
                    v3.options:override("Break LC");
                else
                    v3.options:override();
                end;
            else
                v3.lag_options:override();
                v3.options:override();
            end;
            v3.pitch:override("Down");
            v3.yaw:override("Backward");
            v3.yaw_base:override("At Target");
            if v101.command_number % 7 > 5 then
                delayed_jitter = not delayed_jitter;
            end;
            v3.yaw_offset:override(rage.antiaim:inverter() == true and -26 or 36);
            v3.yaw_modifier:override("Disabled");
            v3.yaw_modifier_offset:override(0);
            v3.body_yaw:override(true);
            v3.body_yaw_inverter:override(delayed_jitter);
            v3.body_yaw_left_limit:override(60);
            v3.body_yaw_right_limit:override(60);
            v3.body_yaw_options:override("");
            v3.body_yaw_freestanding:override("Off");
            v3.extended_angles:override(false);
            v3.extended_pitch:override(89);
            v3.extended_roll:override(45);
            if v5.automatic_mode_hidden_anti_aim:get() and v5.automatic_mode_force_break_lc:get() and v5.automatic_mode_force_break_lc_choice:get("Standing") then
                v3.yaw_hidden:override(true);
                if v9[1].hidden_pitch:get() == "Automatic" then
                    v46.automatic_pitch(v101, v102);
                elseif v9[1].hidden_pitch:get() == "Random" then
                    rage.antiaim:override_hidden_pitch(math.random(v9[1].hidden_pitch_offset1:get(), v9[1].hidden_pitch_offset2:get()));
                elseif v9[1].hidden_pitch:get() == "Switch" then
                    if v101.command_number % ((v9[1].hidden_pitch_delay:get() + 1) * 10) > (v9[1].hidden_pitch_delay:get() - 1) * 10 then
                        pitch_switch = not pitch_switch;
                    end;
                    rage.antiaim:override_hidden_pitch(pitch_switch and v9[1].hidden_pitch_offset1:get() or v9[1].hidden_pitch_offset2:get());
                elseif v9[1].hidden_pitch:get() == "Custom" then
                    rage.antiaim:override_hidden_pitch(v9[1].hidden_pitch_offset1:get());
                end;
                if v5.safe_head:get() and v5.safe_head_hidden_anti_aim:get() and safe_head_allowed == true and entity.get_threat() ~= nil then
                    if v5.safe_head_hidden_pitch:get() == "Automatic" then
                        v46.automatic_pitch(v101, v102);
                    elseif v5.safe_head_hidden_pitch:get() == "Random" then
                        rage.antiaim:override_hidden_pitch(math.random(v5.safe_head_hidden_pitch_offset1:get(), v5.safe_head_hidden_pitch_offset2:get()));
                    elseif v5.safe_head_hidden_pitch:get() == "Switch" then
                        if v101.command_number % ((v5.safe_head_hidden_pitch_delay:get() + 1) * 10) > (v5.safe_head_hidden_pitch_delay:get() - 1) * 10 then
                            safe_pitch_switch = not safe_pitch_switch;
                        end;
                        rage.antiaim:override_hidden_pitch(safe_pitch_switch and v5.safe_head_hidden_pitch_offset1:get() or v5.safe_head_hidden_pitch_offset2:get());
                    elseif v5.safe_head_hidden_pitch:get() == "Custom" then
                        rage.antiaim:override_hidden_pitch(v5.safe_head_hidden_pitch_offset1:get());
                    end;
                end;
                if (v5.manual_yaw:get() == "Forward" or v5.manual_yaw:get() == "Backward" or v5.manual_yaw:get() == "Right" or v5.manual_yaw:get() == "Left") and v5.manual_yaw_edge:get() then
                    rage.antiaim:override_hidden_pitch(math.random(-5, 5));
                end;
                if v9[1].hidden_yaw:get() == "Sideways" and (v5.manual_yaw_edge:get() == false or v5.manual_yaw:get() == "Disabled") then
                    rage.antiaim:override_hidden_yaw_offset(v101.command_number % 4 >= 2 and 110 or -110);
                elseif v9[1].hidden_yaw:get() == "Random" and (v5.manual_yaw_edge:get() == false or v5.manual_yaw:get() == "Disabled") then
                    rage.antiaim:override_hidden_yaw_offset(math.random(-180, 180));
                elseif v9[1].hidden_yaw:get() == "Custom" and (v5.manual_yaw_edge:get() == false or v5.manual_yaw:get() == "Disabled") then
                    rage.antiaim:override_hidden_yaw_offset(v9[1].hidden_yaw_offset:get());
                end;
                if v5.safe_head:get() and v5.safe_head_hidden_anti_aim:get() and safe_head_allowed == true and entity.get_threat() ~= nil then
                    if v5.safe_head_hidden_yaw:get() == "Sideways" then
                        rage.antiaim:override_hidden_yaw_offset(v101.command_number % 4 >= 2 and 110 or -110);
                    elseif v5.safe_head_hidden_yaw:get() == "Random" then
                        rage.antiaim:override_hidden_yaw_offset(math.random(-180, 180));
                    elseif v5.safe_head_hidden_yaw:get() == "Custom" then
                        rage.antiaim:override_hidden_yaw_offset(v5.safe_head_hidden_yaw_offset:get());
                    end;
                end;
                if (v5.manual_yaw:get() == "Forward" or v5.manual_yaw:get() == "Backward" or v5.manual_yaw:get() == "Right" or v5.manual_yaw:get() == "Left") and v5.manual_yaw_edge:get() then
                    rage.antiaim:override_hidden_yaw_offset(180);
                end;
                if defensive_active then
                    v3.yaw_modifier:override("Disabled");
                    v3.body_yaw_options:override("Avoid Overlap");
                end;
            else
                v3.yaw_hidden:override(false);
            end;
        end;
        v3.yaw_avoid_backstab:override(v5.avoid_backstab:get() and v5.manual_yaw:get() == "Disabled");
        if v5.safe_head:get() and entity.get_threat() ~= nil and anti_aim_on_use == false and v5.manual_yaw:get() == "Disabled" then
            if v102:get_origin():dist(entity.get_threat():get_origin()) > 1000 and math.floor(v102:get_eye_position().z - entity.get_threat():get_eye_position().z) >= 0 and (v101.in_jump == true or bit.band(v102.m_fFlags, 1) == 0) == false and v102.m_vecVelocity:length() < 2 and v102.m_flDuckAmount ~= 1 and v3.fake_duck:get() == false then
                safe_head_allowed = true;
            elseif v102:get_origin():dist(entity.get_threat():get_origin()) > 1000 and math.floor(v102:get_eye_position().z - entity.get_threat():get_eye_position().z) >= -18 and (v101.in_jump == true or bit.band(v102.m_fFlags, 1) == 0) == false and v102.m_flDuckAmount ~= 0 and v3.fake_duck:get() == false then
                safe_head_allowed = true;
            elseif (v101.in_jump == true or bit.band(v102.m_fFlags, 1) == 0) and v102.m_flDuckAmount ~= 0 and math.floor(v102:get_eye_position().z - entity.get_threat():get_eye_position().z) >= -18 and v102:get_player_weapon():get_classname() == "CKnife" and v102.m_vecVelocity:length2d() > 2 then
                safe_head_allowed = true;
            elseif (v101.in_jump == true or bit.band(v102.m_fFlags, 1) == 0) and math.floor(v102:get_eye_position().z - entity.get_threat():get_eye_position().z) > -25 and v102.m_flDuckAmount ~= 0 and v102:get_player_weapon():get_weapon_index() == 31 and v102.m_vecVelocity:length2d() > 2 then
                safe_head_allowed = true;
            elseif math.floor(v102:get_eye_position().z - entity.get_threat():get_eye_position().z) >= 22 and (v102.m_vecVelocity:length() < 2 and v102.m_flDuckAmount ~= 1 or v102.m_flDuckAmount ~= 0) and (v101.in_jump == true or bit.band(v102.m_fFlags, 1) == 0) == false and v3.fake_duck:get() == false then
                safe_head_allowed = true;
            elseif math.floor(v102:get_eye_position().z - entity.get_threat():get_eye_position().z) > 60 and (v101.in_jump == true or bit.band(v102.m_fFlags, 1) == 0) and v102.m_flDuckAmount ~= 0 then
                safe_head_allowed = true;
            else
                safe_head_allowed = false;
            end;
            if safe_head_allowed == true and entity.get_threat():get_player_weapon() ~= nil and entity.get_threat():get_player_weapon():get_classname() ~= "CKnife" and entity.get_threat():get_player_weapon():get_weapon_index() ~= 31 then
                v3.pitch:override("Down");
                v3.yaw:override("Backward");
                v3.yaw_base:override("At Target");
                v3.yaw_offset:override(0);
                if (v101.in_jump == true or bit.band(v102.m_fFlags, 1) == 0) and v102.m_flDuckAmount ~= 0 and math.floor(v102:get_eye_position().z - entity.get_threat():get_eye_position().z) >= -18 and v102:get_player_weapon():get_classname() == "CKnife" and v102.m_vecVelocity:length2d() > 2 or v5.safe_head_hidden_anti_aim:get() == false then
                    v3.yaw_hidden:override(false);
                end;
                v3.yaw_modifier:override("Disabled");
                v3.body_yaw:override(true);
                v3.body_yaw_left_limit:override(0);
                v3.body_yaw_right_limit:override(0);
                v3.freestanding:override(false);
                v3.extended_angles:override(false);
            end;
        else
            safe_head_allowed = false;
        end;
        if v5.manual_yaw:get() == "Forward" and anti_aim_on_use == false then
            v3.freestanding:override(false);
            if v5.mode:get() == 2 then
                v3.pitch:override(v10[state_id].pitch:get());
            else
                v3.pitch:override("Down");
            end;
            v3.yaw_base:override("Local View");
            v3.yaw_offset:override(180);
            if v5.mode:get() == 2 then
                if v5.manual_yaw_edge:get() and v10[state_id].hidden_anti_aim:get() and v8[state_id].force_break_lc:get() then
                    v3.yaw_hidden:override(true);
                else
                    v3.yaw_hidden:override(false);
                end;
            elseif v5.manual_yaw_edge:get() and v5.automatic_mode_hidden_anti_aim:get() and v5.automatic_mode_force_break_lc:get() then
                v3.yaw_hidden:override(true);
            else
                v3.yaw_hidden:override(false);
            end;
            if v5.manual_yaw_disable_yaw_modifiers:get() then
                v3.yaw_modifier:override("Disabled");
                v3.body_yaw_options:override("");
            end;
            if v5.manual_yaw_disable_body_yaw:get() then
                v3.body_yaw:override(true);
                v3.body_yaw_left_limit:override(0);
                v3.body_yaw_right_limit:override(0);
            end;
            v3.body_yaw_inverter:override(false);
        elseif v5.manual_yaw:get() == "Backward" and anti_aim_on_use == false then
            v3.freestanding:override(false);
            if v5.mode:get() == 2 then
                v3.pitch:override(v10[state_id].pitch:get());
            else
                v3.pitch:override("Down");
            end;
            v3.yaw_base:override("Local View");
            v3.yaw_offset:override(0);
            if v5.mode:get() == 2 then
                if v5.manual_yaw_edge:get() and v10[state_id].hidden_anti_aim:get() and v8[state_id].force_break_lc:get() then
                    v3.yaw_hidden:override(true);
                else
                    v3.yaw_hidden:override(false);
                end;
            elseif v5.manual_yaw_edge:get() and v5.automatic_mode_hidden_anti_aim:get() and v5.automatic_mode_force_break_lc:get() then
                v3.yaw_hidden:override(true);
            else
                v3.yaw_hidden:override(false);
            end;
            if v5.manual_yaw_disable_yaw_modifiers:get() then
                v3.yaw_modifier:override("Disabled");
                v3.body_yaw_options:override("");
            end;
            if v5.manual_yaw_disable_body_yaw:get() then
                v3.body_yaw:override(true);
                v3.body_yaw_left_limit:override(0);
                v3.body_yaw_right_limit:override(0);
            end;
            v3.body_yaw_inverter:override(true);
        elseif v5.manual_yaw:get() == "Right" and anti_aim_on_use == false then
            v3.freestanding:override(false);
            if v5.mode:get() == 2 then
                v3.pitch:override(v10[state_id].pitch:get());
            else
                v3.pitch:override("Down");
            end;
            v3.yaw_base:override("Local View");
            v3.yaw_offset:override(90);
            if v5.mode:get() == 2 then
                if v5.manual_yaw_edge:get() and v10[state_id].hidden_anti_aim:get() and v8[state_id].force_break_lc:get() then
                    v3.yaw_hidden:override(true);
                else
                    v3.yaw_hidden:override(false);
                end;
            elseif v5.manual_yaw_edge:get() and v5.automatic_mode_hidden_anti_aim:get() and v5.automatic_mode_force_break_lc:get() then
                v3.yaw_hidden:override(true);
            else
                v3.yaw_hidden:override(false);
            end;
            if v5.manual_yaw_disable_yaw_modifiers:get() then
                v3.yaw_modifier:override("Disabled");
                v3.body_yaw_options:override("");
            end;
            if v5.manual_yaw_disable_body_yaw:get() then
                v3.body_yaw:override(true);
                v3.body_yaw_left_limit:override(0);
                v3.body_yaw_right_limit:override(0);
            end;
            v3.body_yaw_inverter:override(true);
        elseif v5.manual_yaw:get() == "Left" and anti_aim_on_use == false then
            v3.freestanding:override(false);
            if v5.manual_yaw_edge:get() and (v10[state_id].hidden_anti_aim:get() and v8[state_id].force_break_lc:get() or v5.automatic_mode_hidden_anti_aim:get() and v5.automatic_mode_force_break_lc:get()) then
                v3.yaw_hidden:override(true);
            else
                v3.yaw_hidden:override(false);
            end;
            v3.yaw_base:override("Local View");
            v3.yaw_offset:override(-90);
            if v5.mode:get() == 2 then
                if v5.manual_yaw_edge:get() and v10[state_id].hidden_anti_aim:get() and v8[state_id].force_break_lc:get() then
                    v3.yaw_hidden:override(true);
                else
                    v3.yaw_hidden:override(false);
                end;
            elseif v5.manual_yaw_edge:get() and v5.automatic_mode_hidden_anti_aim:get() and v5.automatic_mode_force_break_lc:get() then
                v3.yaw_hidden:override(true);
            else
                v3.yaw_hidden:override(false);
            end;
            if v5.manual_yaw_disable_yaw_modifiers:get() then
                v3.yaw_modifier:override("Disabled");
                v3.body_yaw_options:override("");
            end;
            if v5.manual_yaw_disable_body_yaw:get() then
                v3.body_yaw:override(true);
                v3.body_yaw_left_limit:override(0);
                v3.body_yaw_right_limit:override(0);
            end;
            v3.body_yaw_inverter:override(false);
        end;
        if (not v5.freestanding_disablers:get("Standing") and print_state_id == 1 or not v5.freestanding_disablers:get("Moving") and print_state_id == 2 or not v5.freestanding_disablers:get("Slow Walking") and print_state_id == 3 or not v5.freestanding_disablers:get("Crouching") and print_state_id == 5 or not v5.freestanding_disablers:get("In Air") and print_state_id == 6) and v5.manual_yaw:get() == "Disabled" and v5.edge_yaw:get() == false and v3.fake_duck:get() == false and anti_aim_on_use == false then
            v3.freestanding:override(v5.freestanding:get());
            v3.freestanding_disable_yaw_modifiers:override(v5.freestanding_disable_yaw_modifiers:get());
            v3.freestanding_body:override(v5.freestanding_body:get());
            if v3.freestanding:get_override() and v5.freestanding_safe_anti_aim:get() then
                if v5.mode:get() == 2 then
                    v3.pitch:override(v10[state_id].pitch:get());
                else
                    v3.pitch:override("Down");
                end;
                v3.yaw_hidden:override(false);
            end;
        else
            v3.freestanding:override(false);
            v3.freestanding_disable_yaw_modifiers:override();
            v3.freestanding_body:override();
        end;
        if v5.no_fall_damage:get() and v102.m_vecVelocity.z < -580 then
            if v5.no_fall_damage_value == true then
                v101.in_duck = 1;
            else
                v101.in_duck = 0;
            end;
        end;
        if v5.fast_ladder_move:get() and v102.m_MoveType == 9 and (v101.in_forward or v101.in_back) then
            v101.in_moveleft = v101.in_back;
            v101.in_moveright = v101.in_back and 0 or 1;
            if v101.sidemove == 0 then
                v101.view_angles.y = v101.view_angles.y + 45;
            end;
            if v101.sidemove > 0 then
                v101.view_angles.y = v101.view_angles.y - 1;
            end;
            if v101.sidemove < 0 then
                v101.view_angles.y = v101.view_angles.y + 90;
            end;
        end;
        v5.jumping = v101.in_jump == true;
        v5.using = v101.in_use == true;
        if v5.jumping then
            v5.reset = false;
        end;
        return;
    end;
end;
v5.animation_breakers_main = function()
    -- upvalues: v5 (ref), v3 (ref), v46 (ref)
    local v106 = entity.get_local_player();
    if v106 == nil then
        return;
    else
        if v5.animation_breakers:get() then
            if v5.legs_breaker:get() == "Static" then
                v106.m_flPoseParameter[0] = 0;
                v3.leg_movement:override("Sliding");
            elseif v5.legs_breaker:get() == "Walking" then
                v106.m_flPoseParameter[7] = 0;
                if v3.peek_assist:get() then
                    v3.leg_movement:override("Sliding");
                else
                    v3.leg_movement:override("Walking");
                end;
            else
                v3.leg_movement:override();
            end;
        else
            v3.leg_movement:override();
        end;
        if v5.animation_breakers:get() then
            if v5.legs_in_air:get() == "Static" then
                v106.m_flPoseParameter[6] = 1;
            elseif v5.legs_in_air:get() == "Walking" and v46.velocity(v106) > 2 and v106.m_MoveType ~= 9 and v106.m_MoveType ~= 8 then
                v5.get_anim_layer(v5.get_entity_address(v106:get_index()), 6).m_flWeight = 0.5;
            end;
        end;
        if v5.animation_breakers:get() then
            if v5.sliding_elements:get("Walking") then
                v106.m_flPoseParameter[9] = 0;
            end;
            if v5.sliding_elements:get("Moving") then
                v106.m_flPoseParameter[10] = 0;
            end;
            if v5.sliding_elements:get("Crouching") then
                v106.m_flPoseParameter[8] = 0;
            end;
        end;
        if v5.animation_breakers:get() and v5.move_lean_force:get() > -1 and v46.velocity(v106) > 2 then
            v5.get_anim_layer(v5.get_entity_address(v106:get_index()), 12).m_flWeight = v5.move_lean_force:get() / 100;
        end;
        if v5.animation_breakers:get() and v5.landing_pitch:get() and v106:get_anim_state().landing == true and v5.jumping == false and v5.reset == false then
            v106.m_flPoseParameter[12] = 0.5;
        end;
        return;
    end;
end;
v5.angle = 0;
v5.is_edging = false;
v5.trace_start = vector(0, 0, 0);
v5.edge_yaw_main = function(v107)
    -- upvalues: v5 (ref), v3 (ref)
    if v5.edge_yaw:get() == false or v5.manual_yaw:get() ~= "Disabled" or v107.in_use == true or (v5.edge_yaw_disablers:get("Standing") or print_state_id ~= 1) and (v5.edge_yaw_disablers:get("Moving") or print_state_id ~= 2) and (v5.edge_yaw_disablers:get("Slow Walking") or print_state_id ~= 3) and (v5.edge_yaw_disablers:get("Crouching") or print_state_id ~= 5) and (v5.edge_yaw_disablers:get("In Air") or print_state_id ~= 6) then
        return;
    else
        v5.is_edging = false;
        if v107.send_packet then
            v5.trace_start = entity.get_local_player():get_eye_position();
        end;
        local v108 = {};
        local v109 = {};
        for v110 = 18, 360, 18 do
            v110 = math.normalize_yaw(v110);
            local v111 = v5.trace_start + vector():angles(0, v110) * 198;
            local v112 = utils.trace_line(v5.trace_start, v111, entity.get_local_player());
            table.insert(v109, v5.trace_start:dist(v112.end_pos));
            if v112.entity and v112.entity:get_classname() == "CWorld" and v112.fraction < 0.3 then
                v108[#v108 + 1] = {
                    vector_trace_end = v111, 
                    edge_yaw = v110
                };
            end;
        end;
        table.sort(v109);
        if v109[1] > 30 then
            return;
        else
            table.sort(v108, function(v113, v114)
                return v113.edge_yaw < v114.edge_yaw;
            end);
            table.remove(v108, #v108);
            local v115 = nil;
            if #v108 >= 3 then
                local v116 = v108[1].vector_trace_end:lerp(v108[#v108].vector_trace_end, 0.5);
                v115 = (v5.trace_start - v116):angles();
            end;
            if v115 then
                local l_y_1 = render.camera_angles().y;
                local l_y_2 = v115.y;
                local v119 = math.normalize_yaw(l_y_2 - l_y_1);
                if math.abs(v119) < 90 then
                    v119 = 0;
                    l_y_1 = math.normalize_yaw(l_y_2 + 180);
                end;
                local v120 = -l_y_1;
                v5.angle = math.normalize_yaw(v120 + l_y_2 + v119 + 180);
                v5.is_edging = true;
            end;
            if v5.is_edging then
                v3.yaw_base:override("Local View");
                v3.yaw_offset:override(v5.angle);
            end;
            return;
        end;
    end;
end;
v5.count = 0;
v5.hit = 0;
v5.hitgroups = {
    [0] = "generic", 
    [1] = "head", 
    [2] = "chest", 
    [3] = "stomach", 
    [4] = "left arm", 
    [5] = "right arm", 
    [6] = "left leg", 
    [7] = "right leg", 
    [8] = "neck", 
    [9] = "generic", 
    [10] = "gear"
};
v5.logs_on_aim_ack_main = function(v121)
    -- upvalues: v5 (ref)
    if v5.aimbot_logs:get() == false or entity.get_local_player():get_player_weapon() == nil or v121.target:get_classname() ~= "CCSPlayer" then
        return;
    else
        local v122 = color(v5.aimbot_logs_color:get().r, v5.aimbot_logs_color:get().g, v5.aimbot_logs_color:get().b, 255);
        local v123 = color(255, 225, 115, 255);
        local v124 = color(100, 100, 255, 255);
        local v125 = color(255, 100, 100, 255);
        if v5.aimbot_logs_events:get("Aimbot Shots") then
            if v121.state == nil then
                if v5.aimbot_logs_output:get("Default") then
                    print_dev(string.format("Hit %s's %s for %d(%d) aimed=%s(%s%%) (%s ticks)", v121.target:get_name(), v5.hitgroups[v121.hitgroup], v121.damage, v121.wanted_damage, v5.hitgroups[v121.wanted_hitgroup], v121.hitchance, v121.backtrack));
                end;
                if v5.aimbot_logs_output:get("Console") then
                    print_raw(string.format("Hit \a" .. v122:to_hex() .. "%s\aDEFAULT's \a" .. v122:to_hex() .. "%s \aDEFAULTfor \a" .. v122:to_hex() .. "%d\aDEFAULT(\a" .. v122:to_hex() .. "%d\aDEFAULT) aimed=%s(\a" .. v122:to_hex() .. "%s%%\aDEFAULT) (\a" .. v122:to_hex() .. "%s \aDEFAULTticks)", v121.target:get_name(), v5.hitgroups[v121.hitgroup], v121.damage, v121.wanted_damage, v5.hitgroups[v121.wanted_hitgroup], v121.hitchance, v121.backtrack));
                end;
            else
                if v5.aimbot_logs_output:get("Default") then
                    print_dev(string.format("Missed shot at %s's %s(%s%%) for %d damage due to %s (%s ticks)", v121.target:get_name(), v5.hitgroups[v121.wanted_hitgroup], v121.hitchance, v121.wanted_damage, v121.state, v121.backtrack));
                end;
                if v5.aimbot_logs_output:get("Console") then
                    if v121.state == "spread" then
                        print_raw(string.format("Missed shot at \a" .. v123:to_hex() .. "%s\aDEFAULT's \a" .. v123:to_hex() .. "%s\aDEFAULT(\a" .. v123:to_hex() .. "%s%%\aDEFAULT) for \a" .. v123:to_hex() .. "%d \aDEFAULTdamage due to \a" .. v123:to_hex() .. "spread \aDEFAULT(\a" .. v123:to_hex() .. "%s \aDEFAULTticks)", v121.target:get_name(), v5.hitgroups[v121.wanted_hitgroup], v121.hitchance, v121.wanted_damage, v121.backtrack));
                    elseif v121.state == "unregistered shot" then
                        print_raw(string.format("Missed shot at \a" .. v124:to_hex() .. "%s\aDEFAULT's \a" .. v124:to_hex() .. "%s\aDEFAULT(\a" .. v124:to_hex() .. "%s%%\aDEFAULT) for \a" .. v124:to_hex() .. "%d \aDEFAULTdamage due to \a" .. v124:to_hex() .. "unregistered shot \aDEFAULT(\a" .. v124:to_hex() .. "%s \aDEFAULTticks)", v121.target:get_name(), v5.hitgroups[v121.wanted_hitgroup], v121.hitchance, v121.wanted_damage, v121.backtrack));
                    elseif v121.state == "player death" then
                        print_raw(string.format("Missed shot at \a" .. v124:to_hex() .. "%s\aDEFAULT's \a" .. v124:to_hex() .. "%s\aDEFAULT(\a" .. v124:to_hex() .. "%s%%\aDEFAULT) for \a" .. v124:to_hex() .. "%d \aDEFAULTdamage due to \a" .. v124:to_hex() .. "player death \aDEFAULT(\a" .. v124:to_hex() .. "%s \aDEFAULTticks)", v121.target:get_name(), v5.hitgroups[v121.wanted_hitgroup], v121.hitchance, v121.wanted_damage, v121.backtrack));
                    elseif v121.state == "death" then
                        print_raw(string.format("Missed shot at \a" .. v124:to_hex() .. "%s\aDEFAULT's \a" .. v124:to_hex() .. "%s\aDEFAULT(\a" .. v124:to_hex() .. "%s%%\aDEFAULT) for \a" .. v124:to_hex() .. "%d \aDEFAULTdamage due to \a" .. v124:to_hex() .. "death \aDEFAULT(\a" .. v124:to_hex() .. "%s \aDEFAULTticks)", v121.target:get_name(), v5.hitgroups[v121.wanted_hitgroup], v121.hitchance, v121.wanted_damage, v121.backtrack));
                    else
                        print_raw(string.format("Missed shot at \a" .. v125:to_hex() .. "%s\aDEFAULT's \a" .. v125:to_hex() .. "%s\aDEFAULT(\a" .. v125:to_hex() .. "%s%%\aDEFAULT) for \a" .. v125:to_hex() .. "%d \aDEFAULTdamage due to \a" .. v125:to_hex() .. "%s \aDEFAULT(\a" .. v125:to_hex() .. "%s \aDEFAULTticks)", v121.target:get_name(), v5.hitgroups[v121.wanted_hitgroup], v121.hitchance, v121.wanted_damage, v121.state, v121.backtrack));
                    end;
                end;
            end;
        end;
        return;
    end;
end;
v5.logs_on_item_purchase_main = function(v126)
    -- upvalues: v5 (ref)
    if v5.aimbot_logs:get() == false then
        return;
    else
        local v127 = color(v5.aimbot_logs_color:get().r, v5.aimbot_logs_color:get().g, v5.aimbot_logs_color:get().b, 255);
        local v128 = entity.get(v126.userid, true);
        if v128 == nil or v128:get_classname() ~= "CCSPlayer" then
            return;
        else
            if v5.aimbot_logs_events:get("Purchases") and v128 ~= entity.get_local_player() and v126.weapon ~= "weapon_unknown" and v128:is_enemy() == true then
                if v5.aimbot_logs_output:get("Default") then
                    print_dev(string.format("%s bought %s", v128:get_name(), v126.weapon));
                end;
                if v5.aimbot_logs_output:get("Console") then
                    print_raw(string.format("\a" .. v127:to_hex() .. "%s \aDEFAULTbought \a" .. v127:to_hex() .. "%s", v128:get_name(), v126.weapon));
                end;
            end;
            return;
        end;
    end;
end;
v5.logs_on_player_hurt_main = function(v129)
    -- upvalues: v5 (ref)
    if v5.aimbot_logs:get() == false then
        return;
    else
        local v130 = color(v5.aimbot_logs_color:get().r, v5.aimbot_logs_color:get().g, v5.aimbot_logs_color:get().b, 255);
        local v131 = color(255, 150, 80, 255);
        local v132 = entity.get(v129.attacker, true);
        if v132 == nil then
            return;
        else
            local v133 = entity.get(v129.userid, true);
            if v133 == nil then
                return;
            else
                if v129.weapon == "hegrenade" then
                    hit_type = "Naded";
                elseif v129.weapon == "inferno" then
                    hit_type = "Burned";
                elseif v129.weapon == "knife" then
                    hit_type = "Knifed";
                end;
                if v5.aimbot_logs_events:get("Aimbot Shots") and entity.get_local_player() == v132 and v133:get_classname() == "CCSPlayer" and (v129.weapon == "hegrenade" or v129.weapon == "inferno" or v129.weapon == "knife") then
                    if v5.aimbot_logs_output:get("Default") then
                        print_dev(string.format("%s %s for %d damage (%d health remaining)", hit_type, v133:get_name(), v129.dmg_health, v129.health));
                    end;
                    if v5.aimbot_logs_output:get("Console") then
                        print_raw(string.format("%s \a" .. v130:to_hex() .. "%s \aDEFAULTfor \a" .. v130:to_hex() .. "%d \aDEFAULTdamage (\a" .. v130:to_hex() .. "%d \aDEFAULThealth remaining)", hit_type, v133:get_name(), v129.dmg_health, v129.health));
                    end;
                end;
                if v5.aimbot_logs_events:get("Receives") and entity.get_local_player() == v133 and v132:get_classname() == "CCSPlayer" then
                    if v5.aimbot_logs_output:get("Default") then
                        print_dev(string.format("Received %d damage by %s in the %s (%d health remaining)", v129.dmg_health, v132:get_name(), v5.hitgroups[v129.hitgroup], v129.health));
                    end;
                    if v5.aimbot_logs_output:get("Console") then
                        print_raw(string.format("Received \a" .. v131:to_hex() .. "%d\aDEFAULT damage by \a" .. v131:to_hex() .. "%s\aDEFAULT in the \a" .. v131:to_hex() .. "%s\aDEFAULT (\a" .. v131:to_hex() .. "%d\aDEFAULT health remaining)", v129.dmg_health, v132:get_name(), v5.hitgroups[v129.hitgroup], v129.health));
                    end;
                end;
                return;
            end;
        end;
    end;
end;
v5.hit_chance_main = function()
    -- upvalues: v5 (ref), v16 (ref), v3 (ref)
    if entity.get_local_player():get_player_weapon() == nil then
        return;
    else
        local v134 = entity.get_local_player():get_player_weapon():get_weapon_index();
        local v135 = v134 == 11 or v134 == 38;
        local v136 = v134 == 9;
        local v137 = v134 == 40;
        local v138 = v134 == 64;
        local v139 = v134 == 31;
        if v5.hit_chance_modifications:get() then
            if entity.get_threat() ~= nil and entity.get_threat():is_alive() then
                local v140 = entity.get_local_player():get_origin():dist(entity.get_threat():get_origin()) / 40;
                local v141 = entity.get_local_player():get_origin():dist(entity.get_threat():get_origin()) / 40;
                local v142 = entity.get_local_player():get_origin():dist(entity.get_threat():get_origin()) / 40;
                if v16[1].no_scope_distance:get() * 0.1 > 20 then
                    v140 = 20;
                end;
                if v16[2].no_scope_distance:get() * 0.1 > 20 then
                    v141 = 20;
                end;
                if v16[3].no_scope_distance:get() * 0.1 > 20 then
                    v142 = 20;
                end;
                if v16[1].enabled:get() and v16[1].states:get("No Scope") and entity.get_local_player().m_bIsScoped == false and v135 then
                    if v140 < v16[1].no_scope_distance:get() * 0.1 then
                        v3.hit_chance:override(v16[1].no_scope_hit_chance:get());
                        v3.auto_scope:override(false);
                    else
                        v3.hit_chance:override();
                        v3.auto_scope:override(true);
                    end;
                end;
                if v16[2].enabled:get() and v16[2].states:get("No Scope") and entity.get_local_player().m_bIsScoped == false and v136 then
                    if v141 < v16[2].no_scope_distance:get() * 0.1 then
                        v3.hit_chance:override(v16[2].no_scope_hit_chance:get());
                        v3.auto_scope:override(false);
                    else
                        v3.hit_chance:override();
                        v3.auto_scope:override(true);
                    end;
                end;
                if v16[3].enabled:get() and v16[3].states:get("No Scope") and entity.get_local_player().m_bIsScoped == false and v137 then
                    if v142 < v16[3].no_scope_distance:get() * 0.1 then
                        v3.hit_chance:override(v16[3].no_scope_hit_chance:get());
                        v3.auto_scope:override(false);
                    else
                        v3.hit_chance:override();
                        v3.auto_scope:override(true);
                    end;
                end;
            end;
            if v16[1].enabled:get() and v16[1].states:get("In Air") and bit.band(entity.get_local_player().m_fFlags, 1) == 0 and v135 then
                v3.hit_chance:override(v16[1].in_air_hit_chance:get());
            end;
            if v16[2].enabled:get() and v16[2].states:get("In Air") and bit.band(entity.get_local_player().m_fFlags, 1) == 0 and v136 then
                v3.hit_chance:override(v16[2].in_air_hit_chance:get());
            end;
            if v16[3].enabled:get() and v16[3].states:get("In Air") and bit.band(entity.get_local_player().m_fFlags, 1) == 0 and v137 then
                v3.hit_chance:override(v16[3].in_air_hit_chance:get());
            end;
            if v16[4].enabled:get() and bit.band(entity.get_local_player().m_fFlags, 1) == 0 and v138 then
                v3.hit_chance:override(v16[4].in_air_hit_chance:get());
            end;
            if v16[5].enabled:get() and bit.band(entity.get_local_player().m_fFlags, 1) == 0 and v139 then
                v3.hit_chance:override(v16[5].in_air_hit_chance:get());
            end;
        end;
        if not v5.hit_chance_modifications:get() or entity.get_threat() == nil or not entity.get_threat():is_alive() or (not v16[1].enabled:get() or not v16[1].states:get("No Scope") or not v135) and (not v16[2].enabled:get() or not v16[2].states:get("No Scope") or not v136) and (not v16[3].enabled:get() or not v16[3].states:get("No Scope") or not v137) then
            v3.auto_scope:override();
        end;
        if (not v5.hit_chance_modifications:get() or entity.get_local_player().m_bIsScoped or entity.get_threat() == nil or not entity.get_threat():is_alive() or (not v16[1].enabled:get() or not v16[1].states:get("No Scope") or not v135) and (not v16[2].enabled:get() or not v16[2].states:get("No Scope") or not v136) and (not v16[3].enabled:get() or not v16[3].states:get("No Scope") or not v137)) and (not v5.hit_chance_modifications:get() or bit.band(entity.get_local_player().m_fFlags, 1) ~= 0 or (not v16[1].enabled:get() or not v16[1].states:get("In Air") or not v135) and (not v16[2].enabled:get() or not v16[2].states:get("In Air") or not v136) and (not v16[3].enabled:get() or not v16[3].states:get("In Air") or not v137) and (not v16[4].enabled:get() or not v138) and (not v16[5].enabled:get() or not v139)) then
            v3.hit_chance:override();
        end;
        return;
    end;
end;
v5.discharge_exploit_main = function()
    -- upvalues: v5 (ref)
    if entity.get_local_player():get_player_weapon() == nil then
        return;
    else
        local v143 = entity.get_local_player():get_player_weapon():get_weapon_index();
        local v144 = v143 == 1 or not (v143 ~= 2) or not (v143 ~= 3) or not (v143 ~= 4) or not (v143 ~= 30) or not (v143 ~= 32) or not (v143 ~= 36) or not (v143 ~= 61) or not (v143 ~= 63) or v143 == 64;
        local v145 = v143 == 11 or v143 == 38;
        local v146 = v143 == 9;
        local v147 = v143 == 40;
        local v148 = v143 == 1;
        local v149 = v143 == 31;
        local v150 = entity.get_local_player():get_player_weapon():get_classname() == "CKnife";
        local v151 = entity.get_players(true, false);
        for v152, v153 in pairs({
            [1] = v144, 
            [2] = v145, 
            [3] = v146, 
            [4] = v147, 
            [5] = v148, 
            [6] = v150, 
            [7] = v149, 
            [8] = not v144 and not v145 and not v146 and not v147 and not v148 and not v150 and not v149
        }) do
            if v5.discharge_exploit:get() and v5.discharge_exploit_weapons:get(v152) and v153 and bit.band(entity.get_local_player().m_fFlags, 1) == 0 then
                for v154 = 1, #v151 do
                    if v151[v154]:is_alive() and v151[v154]:is_visible() then
                        rage.exploit:force_teleport();
                    end;
                end;
            end;
        end;
        return;
    end;
end;
v5.dormant_aimbot_main = function(v155)
    -- upvalues: v5 (ref), v3 (ref), v46 (ref)
    if v5.dormant_aimbot:get() then
        v3.dormant_aimbot:override(false);
        local v156 = entity.get_local_player();
        local v157 = v156:get_player_weapon();
        if not v157 then
            return;
        else
            if v5.round_started == nil then
                v5.round_started = 0;
            end;
            if globals.tickcount < v5.round_started then
                return;
            else
                if v157:get_weapon_info().is_revolver then
                    v5.can_shoot = v156.m_flSimulationTime > v157.m_flNextPrimaryAttack;
                elseif v157:get_weapon_info().is_melee_weapon then
                    v5.can_shoot = false;
                else
                    v5.can_shoot = v156.m_flSimulationTime > math.max(v156.m_flNextAttack, v157.m_flNextPrimaryAttack, v157.m_flNextSecondaryAttack);
                end;
                for _, v159 in ipairs(entity.get_players(true)) do
                    if globals.is_connected == true and v159:is_dormant() and v159:get_origin().x ~= 0 and v159:is_visible() == false and v159:get_bbox().alpha > 0 then
                        local v160 = v159:get_origin() + vector(0, 0, 40);
                        local v161 = v156:get_eye_position():to(v160):angles();
                        local v162, v163 = utils.trace_bullet(v156, v156:get_eye_position(), v160);
                        if v5.dormant_aimbot_min_damage:get() < v162 and v5.can_shoot and v163.entity ~= nil and v163.entity:is_enemy() and v156.m_MoveType ~= 8 and v157:get_weapon_info().weapon_type ~= 0 and v157:get_weapon_info().weapon_type ~= 9 then
                            if (v155.in_jump == true or bit.band(v156.m_fFlags, 1) == 0) == false and (v3.auto_stop:get() or v3.auto_stop:get_override()) then
                                v46.modify_velocity(v155, (v156.m_bIsScoped == true and v157:get_weapon_info().max_player_speed_alt or v157:get_weapon_info().max_player_speed) * 0.33);
                            end;
                            if v156.m_bIsScoped == false and v157:get_weapon_info().weapon_type == 5 and (v155.in_jump == true or bit.band(v156.m_fFlags, 1) == 0) == false and (v3.auto_scope:get() or v3.auto_scope:get_override()) then
                                v155.in_attack2 = 1;
                            end;
                            if v157:get_inaccuracy() ~= nil and v157:get_inaccuracy() < 0.009 then
                                v155.view_angles = v161;
                                v155.in_attack = true;
                                v5.can_shoot = false;
                                v5.dormant_aimbot_shot = true;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    else
        v3.dormant_aimbot:override();
    end;
end;
v5.air_lag_exploit_main = function(v164)
    -- upvalues: v5 (ref), v3 (ref)
    if v5.air_lag_exploit:get() == false then
        return;
    else
        local v165 = entity.get_local_player();
        if (v3.hide_shots:get() or v3.double_tap:get()) and (v164.in_jump == true or bit.band(v165.m_fFlags, 1) == 0) and v164.command_number % 10 == 0 then
            rage.exploit:force_teleport();
        else
            rage.exploit:allow_charge(true);
            rage.exploit:force_charge();
        end;
        return;
    end;
end;
v5.better_scope_overlay_main = function()
    -- upvalues: v5 (ref), v3 (ref), v46 (ref), v0 (ref)
    local v166 = entity.get_local_player();
    if v166 == nil or v166:get_player_weapon() == nil or not v166:is_alive() then
        return;
    else
        local v167 = v166:get_player_weapon():get_weapon_index();
        local v168 = v167 == 8 or v167 == 39;
        local v169 = render.screen_size().x / 2;
        local v170 = render.screen_size().y / 2;
        if v5.better_scope_overlay:get() and v168 == false then
            v3.scope_overlay:override("Remove All");
            v5.better_scope_transparency = v46.lerp(v5.better_scope_transparency, v166.m_bIsScoped and 1 or 0, 40 * globals.frametime);
            local v171 = v0.animations.new("Scope Inaccuracy", scope_inaccuracy):update(v0.animations.types.LERP, v5.better_scope_overlay_spread_based:get() and v166:get_player_weapon():get_inaccuracy() * 250 or 0);
            local v172 = color(v5.better_scope_overlay_accent_color:get().r, v5.better_scope_overlay_accent_color:get().g, v5.better_scope_overlay_accent_color:get().b, v5.better_scope_overlay_accent_color:get().a * v5.better_scope_transparency);
            local v173 = color(v5.better_scope_overlay_additional_color:get().r, v5.better_scope_overlay_additional_color:get().g, v5.better_scope_overlay_additional_color:get().b, v5.better_scope_overlay_additional_color:get().a * v5.better_scope_transparency);
            if not v5.better_scope_overlay_exclude_lines:get("Left\194\160") then
                render.gradient(vector(v169 - v5.better_scope_overlay_gap:get() * 2.5 - v171, v170), vector(v169 - v5.better_scope_overlay_gap:get() * 2.5 - v5.better_scope_overlay_line:get() * 5 - v171, v170 + 1), v172, v173, v172, v173);
            end;
            if not v5.better_scope_overlay_exclude_lines:get("Top\194\160") then
                render.gradient(vector(v169, v170 - v5.better_scope_overlay_gap:get() * 2.5 - v171), vector(v169 + 1, v170 - v5.better_scope_overlay_gap:get() * 2.5 - v5.better_scope_overlay_line:get() * 5 - v171), v172, v172, v173, v173);
            end;
            if not v5.better_scope_overlay_exclude_lines:get("Right\194\160") then
                render.gradient(vector(v169 + v5.better_scope_overlay_gap:get() * 2.5 + 1.5 + v171, v170), vector(v169 + v5.better_scope_overlay_gap:get() * 2.5 + v5.better_scope_overlay_line:get() * 5 + 1.5 + v171, v170 + 1), v172, v173, v172, v173);
            end;
            if not v5.better_scope_overlay_exclude_lines:get("Bottom\194\160") then
                render.gradient(vector(v169, v170 + v5.better_scope_overlay_gap:get() * 2.5 + 2 + v171), vector(v169 + 1, v170 + v5.better_scope_overlay_gap:get() * 2.5 + v5.better_scope_overlay_line:get() * 5 + 2 + v171), v172, v172, v173, v173);
            end;
        else
            v3.scope_overlay:override();
        end;
        return;
    end;
end;
v5.unmute_silenced_players_main = function()
    -- upvalues: v5 (ref)
    if v5.unmute_silenced_players:get() then
        entity.get_players(false, true, function(v174)
            local v175 = panorama.MatchStatsAPI.GetPlayerXuid(v174:get_index());
            if panorama.GameStateAPI.HasCommunicationAbuseMute(v175) and panorama.GameStateAPI.IsSelectedPlayerMuted(v175) then
                panorama.GameStateAPI.ToggleMute(v175);
            end;
        end);
    end;
end;
v5.unmute_silenced_players:set_callback(v5.unmute_silenced_players_main, true);
v5.hwnd_ptr = ffi.cast("uintptr_t***", ffi.cast("uintptr_t", utils.opcode_scan("engine.dll", "8B 0D ?? ?? ?? ?? 85 C9 74 16 8B 01 8B")) + 2)[0][0] + 2;
v5.flash_window = ffi.cast("int(__stdcall*)(uintptr_t, int)", utils.opcode_scan("gameoverlayrenderer.dll", "55 8B EC 83 EC 14 8B 45 0C F7"));
v5.insn_jmp_ecx = ffi.cast("int(__thiscall*)(uintptr_t)", utils.opcode_scan("gameoverlayrenderer.dll", "FF E1"));
v5.get_foreground_window = ffi.cast("uintptr_t**", ffi.cast("uintptr_t", utils.opcode_scan("gameoverlayrenderer.dll", "FF 15 ?? ?? ?? ?? 3B C6 74")) + 2)[0][0];
v5.icon_notification_main = function()
    -- upvalues: v5 (ref)
    if v5.icon_notification:get() then
        local v176 = v5.hwnd_ptr[0];
        if v5.insn_jmp_ecx(v5.get_foreground_window) ~= v176 then
            v5.flash_window(v176, 1);
            return true;
        else
            return false;
        end;
    else
        return;
    end;
end;
esp.enemy:new_text("Revolver Helper", "DMG", function(v177)
    if entity.get_local_player() == nil or entity.get_local_player():get_player_weapon() == nil then
        return;
    elseif v177:is_alive() and entity.get_local_player():get_origin():dist(v177:get_origin()) < 585 and v177.m_ArmorValue == 0 and entity.get_local_player():get_player_weapon():get_weapon_index() == 64 then
        return "DMG";
    else
        return;
    end;
end);
v5.disable_air_strafe_main = function(v178)
    -- upvalues: v5 (ref), v46 (ref)
    local v179 = entity.get_local_player();
    if v179 == nil or v179:get_player_weapon() == nil then
        return;
    else
        local v180 = v179:get_player_weapon():get_weapon_index();
        if v5.hit_chance_modifications:get() and v5.hit_chance_modifications_disable_air_strafe:get() and (v5.jumping or bit.band(v179.m_fFlags, 1) == 0) then
            if v180 == 43 or v180 == 44 or v180 == 45 or v180 == 46 or v180 == 47 or v180 == 48 then
                v178.in_speed = false;
            elseif v46.velocity(v179) < 2 then
                v178.in_speed = true;
            else
                v178.in_speed = false;
            end;
        end;
        return;
    end;
end;
v5.clan_tag_preview = "";
v5.animation = function(v181, v182)
    local v183 = "               " .. v181 .. "                      ";
    i = (globals.tickcount + math.floor(utils.net_channel().latency[1] + 0.22 / globals.tickinterval + 0.5)) / math.floor(0.3 / globals.tickinterval + 0.5);
    i = math.floor(i % #v182);
    i = v182[i + 1] + 1;
    return string.sub(v183, i, i + 15);
end;
v5.run_clan_tag_animation = function()
    -- upvalues: v5 (ref)
    local v184 = v5.animation("#ZOV-YAW", {
        [1] = 0, 
        [2] = 1, 
        [3] = 2, 
        [4] = 3, 
        [5] = 4, 
        [6] = 5, 
        [7] = 6, 
        [8] = 7, 
        [9] = 8, 
        [10] = 9, 
        [11] = 9, 
        [12] = 9, 
        [13] = 9, 
        [14] = 9, 
        [15] = 9, 
        [16] = 10, 
        [17] = 11, 
        [18] = 12, 
        [19] = 13, 
        [20] = 14, 
        [21] = 15, 
        [22] = 16, 
        [23] = 17, 
        [24] = 18, 
        [25] = 19, 
        [26] = 20, 
        [27] = 21, 
        [28] = 22, 
        [29] = 23, 
        [30] = 24
    });
    if v184 ~= v5.clan_tag_preview then
        common.set_clan_tag(v184);
    end;
    v5.clan_tag_preview = v184;
end;
v5.clan_tag_main = function()
    -- upvalues: v5 (ref), v3 (ref)
    if entity.get_local_player() == nil then
        return;
    else
        if v5.clan_tag:get() then
            v3.clan_tag:override(false);
            if globals.tickcount % 2 == 0 then
                v5.run_clan_tag_animation();
            elseif entity.get_game_rules().m_gamePhase == 5 then
                common.set_clan_tag("#ZOV-YAW ");
            end;
        else
            v3.clan_tag:override();
        end;
        return;
    end;
end;
v5.clan_tag:set_callback(function(v185)
    local v186 = entity.get_local_player();
    if v185:get() and v186 ~= nil then
        clan_tag_cache = panorama.GameStateAPI.GetPlayerClanTag(panorama.MatchStatsAPI.GetPlayerXuid(v186:get_index()));
    elseif clan_tag_cache ~= nil then
        common.set_clan_tag(clan_tag_cache);
    else
        common.set_clan_tag("\000");
    end;
end, true);
v5.unlock_fake_latency:set_callback(function(v187)
    if v187:get() then
        cvar.sv_maxunlag:float(0.4);
    else
        cvar.sv_maxunlag:float(0.2);
    end;
end, true);
v5.velocity_warning_main = v0.drag_system.register({
    [1] = v5.velocity_warning_x, 
    [2] = v5.velocity_warning_y
}, vector(200, 20), "Velocity", function(v188)
    -- upvalues: v5 (ref), v46 (ref), v0 (ref)
    if v5.velocity_warning:get() == false then
        return;
    else
        local v189 = entity.get_local_player();
        if v189 == nil then
            return;
        else
            local _ = v5.velocity_warning_x:get();
            local _ = v5.velocity_warning_y:get();
            local l_m_flVelocityModifier_0 = v189.m_flVelocityModifier;
            if v189:is_alive() == false then
                l_m_flVelocityModifier_0 = 0.5;
            end;
            v5.velocity_warning_transparency = v46.lerp(v5.velocity_warning_transparency, (l_m_flVelocityModifier_0 ~= 1 and v189:is_alive() or ui.get_alpha() > 0) and 1 or 0, 25 * globals.frametime);
            v5.velocity_warning_color = v46.lerp(v5.velocity_warning_color, (not not v5.jumping or bit.band(v189.m_fFlags, 1) == 0) and l_m_flVelocityModifier_0 ~= 1 and color(255, 100, 100, 240 * v5.velocity_warning_transparency) or color(v5.velocity_warning_accent_color:get().r, v5.velocity_warning_accent_color:get().g, v5.velocity_warning_accent_color:get().b, 240 * v5.velocity_warning_transparency), 25 * globals.frametime);
            local v193 = v0.animations.new("Line Animation", line_animation):update(v0.animations.types.LERP, math.floor(199 * l_m_flVelocityModifier_0));
            render.shadow(vector(v188.position.x, v188.position.y + 15), vector(v188.position.x + 200, v188.position.y + 20), v5.velocity_warning_color, 20, 0, 4);
            render.rect_outline(vector(v188.position.x, v188.position.y + 15), vector(v188.position.x + 200, v188.position.y + 20), color(15, 15, 15, 200 * v5.velocity_warning_transparency), 0, 4);
            render.rect(vector(v188.position.x, v188.position.y + 15), vector(v188.position.x + 200, v188.position.y + 20), color(15, 15, 15, 150 * v5.velocity_warning_transparency), 2);
            render.rect(vector(v188.position.x + 1, v188.position.y + 16), vector(v188.position.x + v193, v188.position.y + 19), v5.velocity_warning_color, 2);
            render.text(1, vector(v188.position.x + 27, v188.position.y - 3), color(255, 255, 255, 230 * v5.velocity_warning_transparency), nil, string.format("Max velocity reduced by %s%%", math.floor(100 - l_m_flVelocityModifier_0 * 100)));
            return;
        end;
    end;
end);
v5.engine_client = ffi.cast(ffi.typeof("void***"), utils.create_interface("engine.dll", "VEngineClient014"));
v5.console_is_visible = v46.bind_argument(ffi.cast("bool(__thiscall*)(void*)", v5.engine_client[0][11]), v5.engine_client);
v5.console_materials = {
    [1] = "vgui_white", 
    [2] = "vgui/hud/800corner1", 
    [3] = "vgui/hud/800corner2", 
    [4] = "vgui/hud/800corner3", 
    [5] = "vgui/hud/800corner4"
};
v5.console_color_last = color(255, 255, 255, 255);
v5.console_color_change = function(v194)
    -- upvalues: v5 (ref)
    if v5.console_color_last ~= v194 then
        for _, v196 in pairs(v5.console_materials) do
            materials.get_materials(v196)[1]:color_modulate(color(v194.r, v194.g, v194.b));
            materials.get_materials(v196)[1]:alpha_modulate(v194.a / 255);
        end;
        v5.console_color_last = v194;
    end;
end;
v5.console_color_modulation_main = function()
    -- upvalues: v5 (ref)
    if v5.console_modulation:get() then
        v5.console_color_change(v5.console_is_visible() and v5.console_modulation_color:get() or color(255, 255, 255, 255));
    end;
end;
v5.console_modulation:set_callback(function(v197)
    -- upvalues: v5 (ref)
    if not v197:get() then
        v5.console_color_change(color(255, 255, 255, 255));
    end;
end, true);
v5.planting_state = nil;
v5.planting = false;
v5.planting_site = nil;
v5.planting_time = nil;
v5.bomb_exploded = false;
v5.bomb_c4_icon = render.load_image_from_file("materials/panorama/images/icons/ui/bomb_c4.svg", vector(100, 100));
v5.skeet_indicators_main = function()
    -- upvalues: v5 (ref), v46 (ref), v2 (ref), v3 (ref)
    if v5.skeet_indicators:get() == false then
        return;
    else
        local v198 = entity.get_local_player();
        if v198 == nil then
            return;
        else
            local v199 = false;
            local v200 = false;
            for _, v202 in pairs(ui.get_binds()) do
                if v202.active and v202.name == "Hit Chance" then
                    v199 = true;
                end;
                if v202.active and v202.name == "Min. Damage" then
                    v200 = true;
                end;
            end;
            local v203 = 0;
            local v204 = render.screen_size().x / 80;
            local v205 = render.screen_size().y / 1.47 - 1;
            local function v212(v206, v207, v208)
                -- upvalues: v46 (ref)
                if v206 == nil or v208 == nil then
                    return;
                else
                    local v209 = v206:get_eye_position():dist(v207:get_origin());
                    local v210 = 500;
                    local v211 = v210 * 3.5;
                    v210 = v210 * math.exp(-(v209 * v209 / (v211 * 2 / 3 * (v211 / 3))));
                    return (math.floor(v46.damage_apply_armor(math.max(v210, 0), v208)));
                end;
            end;
            local function v218(v213, v214, v215, v216, v217)
                -- upvalues: v205 (ref), v204 (ref)
                render.gradient(vector(13, v205 + v214 - 3), vector(render.measure_text(v213.calibri_custom, nil, v217).x + 10, v205 + v214 + 30), color(15, 15, 15, 0), color(15, 15, 15, 55), color(15, 15, 15, 0), color(15, 15, 15, 55));
                render.gradient(vector(render.measure_text(v213.calibri_custom, nil, v217).x + 10, v205 + v214 - 3), vector(45 + render.measure_text(v213.calibri_custom, nil, v217).x, v205 + v214 + 30), color(15, 15, 15, 55), color(15, 15, 15, 0), color(15, 15, 15, 55), color(15, 15, 15, 0));
                render.text(v213.calibri_custom, vector(v204 + 4, v205 + 4 + v214), v215, v216, v217);
            end;
            if v5.skeet_indicators_selection:get("Aimbot Stats") and v198:is_alive() then
                v218(v2, v203, color(255, 255, 255, 200), nil, math.floor(v5.count > 0 and v5.hit > 0 and v5.hit / v5.count * 100 or 0) .. "%");
                v203 = v203 - 41;
            end;
            if v5.skeet_indicators_selection:get("Fake Latency") and v3.fake_latency:get() > 0 then
                if math.floor(utils.net_channel().latency[1] * 1000) == 0 then
                    latency = math.floor(utils.net_channel().latency[0] * 1000);
                else
                    latency = math.floor(utils.net_channel().latency[0] * 1500);
                end;
                if latency <= 7 then
                    colors = color(250, 235, 235, 250);
                elseif latency > 8 and latency <= 18 then
                    colors = color(245, 225, 215, 250);
                elseif latency > 18 and latency <= 37 then
                    colors = color(240, 200, 180, 250);
                elseif latency > 37 and latency <= 49 then
                    colors = color(230, 190, 145, 250);
                elseif latency > 49 and latency <= 65 then
                    colors = color(225, 190, 115, 250);
                elseif latency > 65 and latency <= 77 then
                    colors = color(215, 200, 90, 250);
                elseif latency > 77 and latency <= 92 then
                    colors = color(200, 205, 60, 250);
                elseif latency > 92 and latency <= 102 then
                    colors = color(165, 195, 35, 250);
                elseif latency > 102 then
                    colors = color(145, 195, 20, 250);
                end;
                v5.ping_spike_color = v46.lerp(v5.ping_spike_color, colors, 25 * globals.frametime);
                if v198:is_alive() then
                    v218(v2, v203, v5.ping_spike_color, nil, "PING");
                    v203 = v203 - 41;
                end;
            end;
            if v5.skeet_indicators_selection:get("Double Tap") and v3.double_tap:get() and v198:is_alive() then
                if rage.exploit:get() == 1 then
                    dt_color = v5.skeet_indicators_break_lc_indicator:get() and defensive_active and v5.skeet_indicators_break_lc_indicator_color:get() or color(255, 255, 255, 200);
                else
                    dt_color = color(255, 0, 50, 250);
                end;
                if v5.skeet_indicators_selection:get("Fake Duck") then
                    if v3.fake_duck:get() == false then
                        render.gradient(vector(13, v205 + v203 - 3), vector(render.measure_text(v2.calibri_custom, nil, "DT").x + 10, v205 + v203 + 30), color(15, 15, 15, 0), color(15, 15, 15, 55), color(15, 15, 15, 0), color(15, 15, 15, 55));
                        render.gradient(vector(render.measure_text(v2.calibri_custom, nil, "DT").x + 10, v205 + v203 - 3), vector(45 + render.measure_text(v2.calibri_custom, nil, "DT").x, v205 + v203 + 30), color(15, 15, 15, 55), color(15, 15, 15, 0), color(15, 15, 15, 55), color(15, 15, 15, 0));
                        render.text(v2.calibri_custom, vector(v204 + 4, v205 + 4 + v203), dt_color, nil, "D");
                        render.text(v2.calibri_custom_t, vector(v204 + 4 + render.measure_text(v2.calibri_custom, nil, "D").x, v205 + 4 + v203), dt_color, nil, "T");
                        v203 = v203 - 41;
                    end;
                else
                    render.gradient(vector(13, v205 + v203 - 3), vector(render.measure_text(v2.calibri_custom, nil, "DT").x + 10, v205 + v203 + 30), color(15, 15, 15, 0), color(15, 15, 15, 55), color(15, 15, 15, 0), color(15, 15, 15, 55));
                    render.gradient(vector(render.measure_text(v2.calibri_custom, nil, "DT").x + 10, v205 + v203 - 3), vector(45 + render.measure_text(v2.calibri_custom, nil, "DT").x, v205 + v203 + 30), color(15, 15, 15, 55), color(15, 15, 15, 0), color(15, 15, 15, 55), color(15, 15, 15, 0));
                    render.text(v2.calibri_custom, vector(v204 + 4, v205 + 4 + v203), dt_color, nil, "D");
                    render.text(v2.calibri_custom_t, vector(v204 + 4 + render.measure_text(v2.calibri_custom, nil, "D").x, v205 + 4 + v203), dt_color, nil, "T");
                    v203 = v203 - 41;
                end;
            end;
            if v5.skeet_indicators_selection:get("Hide Shots") and v3.hide_shots:get() and v198:is_alive() and v3.double_tap:get() == false and v3.fake_duck:get() == false then
                v218(v2, v203, color(255, 255, 255, 200), nil, "OSAA");
                v203 = v203 - 41;
            end;
            if v5.skeet_indicators_selection:get("Hit Chance") and v199 == true and v198:is_alive() then
                v218(v2, v203, color(255, 255, 255, 200), nil, "HC");
                v203 = v203 - 41;
            end;
            if v5.skeet_indicators_selection:get("Fake Duck") and v3.fake_duck:get() and v198:is_alive() then
                v218(v2, v203, color(255, 255, 255, 200), nil, "DUCK");
                v203 = v203 - 41;
            end;
            if v5.skeet_indicators_selection:get("Force Safe Points") and v3.safe_points:get() == "Force" and v198:is_alive() then
                v218(v2, v203, color(255, 255, 255, 200), nil, "SAFE");
                v203 = v203 - 41;
            end;
            if v5.skeet_indicators_selection:get("Force Body Aim") and v3.body_aim:get() == "Force" and v198:is_alive() then
                v218(v2, v203, color(255, 255, 255, 200), nil, "BODY");
                v203 = v203 - 41;
            end;
            if v5.skeet_indicators_selection:get("Minimum Damage") and v200 == true and v198:is_alive() then
                v218(v2, v203, color(255, 255, 255, 200), nil, "MD");
                v203 = v203 - 41;
            end;
            if v5.skeet_indicators_selection:get("Freestanding") and v3.freestanding:get_override() and v198:is_alive() then
                v218(v2, v203, color(255, 255, 255, 200), nil, "FS");
                v203 = v203 - 41;
            end;
            if v5.skeet_indicators_selection:get("Bomb Information") then
                if v5.planting == false then
                    entity.get_entities("CPlantedC4", true, function(v219)
                        -- upvalues: v204 (ref), v198 (ref), v212 (ref), v205 (ref), v203 (ref), v2 (ref), v5 (ref), v218 (ref)
                        if v219.m_bBombDefused then
                            return;
                        else
                            if v219.m_hBombDefuser then
                                local v220 = v219.m_hBombDefuser and v219.m_flDefuseCountDown - globals.curtime or -1;
                                render.rect(vector(), vector(v204 - 4, render.screen_size().y), color(15, 15, 15, 150));
                                render.rect(v219.m_flDefuseLength == 5 and vector(1, render.screen_size().y - v220 * render.screen_size().y / v219.m_flDefuseLength / 2) or vector(0, render.screen_size().y - v220 * render.screen_size().y / v219.m_flDefuseLength), vector(v204 - 5, render.screen_size().y), v220 < v219.m_flC4Blow - globals.curtime and color(50, 230, 35, 120) or color(230, 35, 50, 120));
                            end;
                            local v221 = v219.m_nBombSite == 0 and "A" or "B";
                            if v198.m_hObserverTarget and (v198.m_iObserverMode == 4 or v198.m_iObserverMode == 5) then
                                m_iHealth = v198.m_hObserverTarget.m_iHealth;
                                m_ArmorValue = v198.m_hObserverTarget.m_ArmorValue;
                                bomb_damage = v212(v198.m_hObserverTarget, v219, m_ArmorValue);
                            elseif v198.m_iObserverMode ~= 6 then
                                m_iHealth = v198.m_iHealth;
                                m_ArmorValue = v198.m_ArmorValue;
                                bomb_damage = v212(v198, v219, m_ArmorValue);
                            else
                                m_iHealth = v198.m_iHealth;
                                m_ArmorValue = v198.m_ArmorValue;
                                bomb_damage = 0;
                            end;
                            if v219.m_flC4Blow - globals.curtime >= 0 then
                                render.gradient(vector(13, v205 + v203 - 3), vector(12 + render.measure_text(v2.calibri_custom, nil, string.format("       %s - %.1fs", v221, v219.m_flC4Blow - globals.curtime)).x / 2, v205 + v203 + 30), color(15, 15, 15, 0), color(15, 15, 15, 55), color(15, 15, 15, 0), color(15, 15, 15, 55));
                                render.gradient(vector(12 + render.measure_text(v2.calibri_custom, nil, string.format("       %s - %.1fs", v221, v219.m_flC4Blow - globals.curtime)).x / 2, v205 + v203 - 3), vector(55 + render.measure_text(v2.calibri_custom, nil, string.format("       %s - %.1fs", v221, v219.m_flC4Blow - globals.curtime)).x, v205 + v203 + 30), color(15, 15, 15, 55), color(15, 15, 15, 0), color(15, 15, 15, 55), color(15, 15, 15, 0));
                                render.text(v2.calibri_custom, vector(v204 + 6, v205 + 4 + v203), color(255, 255, 255, 200), nil, string.format("       %s - %.1fs", v221, v219.m_flC4Blow - globals.curtime));
                                render.texture(v5.bomb_c4_icon, vector(v204 + 4, v205 + v203 - 2), vector(33, 31), color(255, 255, 255, 200));
                                v203 = v203 - 41;
                            end;
                            if v5.bomb_exploded == false then
                                if m_iHealth == nil or m_ArmorValue == nil then
                                    return;
                                elseif bomb_damage >= 1 then
                                    if m_iHealth <= bomb_damage then
                                        render.gradient(vector(13, v205 + v203 - 3), vector(render.measure_text(v2.calibri_custom, nil, "FATAL").x + 10, v205 + v203 + 30), color(15, 15, 15, 0), color(15, 15, 15, 55), color(15, 15, 15, 0), color(15, 15, 15, 55));
                                        render.gradient(vector(render.measure_text(v2.calibri_custom, nil, "FATAL").x + 10, v205 + v203 - 3), vector(45 + render.measure_text(v2.calibri_custom, nil, "FATAL").x, v205 + v203 + 30), color(15, 15, 15, 55), color(15, 15, 15, 0), color(15, 15, 15, 55), color(15, 15, 15, 0));
                                        render.text(v2.calibri_custom, vector(v204 + 4, v205 + 4 + v203), color(250, 0, 45, 250), nil, "FA");
                                        render.text(v2.calibri_custom_t, vector(v204 + 4 + render.measure_text(v2.calibri_custom, nil, "FA").x, v205 + 4 + v203), color(250, 0, 45, 250), nil, "T");
                                        render.text(v2.calibri_custom, vector(v204 + 4 + render.measure_text(v2.calibri_custom, nil, "FAT").x, v205 + 4 + v203), color(250, 0, 45, 250), nil, "AL");
                                        v203 = v203 - 41;
                                    else
                                        v218(v2, v203, color(250, 240, 105, 250), nil, string.format("-%d HP", bomb_damage));
                                        v203 = v203 - 41;
                                    end;
                                end;
                            end;
                            return;
                        end;
                    end);
                else
                    render.gradient(vector(13, v205 + v203 - 3), vector(12 + render.measure_text(v2.calibri_custom, nil, v5.planting_site).x / 2, v205 + v203 + 30), color(15, 15, 15, 0), color(15, 15, 15, 55), color(15, 15, 15, 0), color(15, 15, 15, 55));
                    render.gradient(vector(12 + render.measure_text(v2.calibri_custom, nil, v5.planting_site).x / 2, v205 + v203 - 3), vector(55 + render.measure_text(v2.calibri_custom, nil, v5.planting_site).x, v205 + v203 + 30), color(15, 15, 15, 55), color(15, 15, 15, 0), color(15, 15, 15, 55), color(15, 15, 15, 0));
                    render.text(v2.calibri_custom, vector(v204 + 6, v205 + 4 + v203), color(250, 240, 105, 250), nil, v5.planting_site);
                    render.texture(v5.bomb_c4_icon, vector(v204 + 4, v205 + v203 - 2), vector(33, 31), color(250, 240, 105, 250));
                    local v222 = 3.125 - (3.125 + v5.planting_time - globals.curtime);
                    if v222 > 3.125 then
                        v222 = 3.125;
                    end;
                    render.circle_outline(vector(v204 + render.measure_text(v2.calibri_custom, nil, v5.planting_site).x + 25, v205 + v203 + render.measure_text(v2.calibri_custom, nil, v5.planting_site).y / 2 + 1), color(15, 15, 15, 200), 10.3, 0, 1, 4.5);
                    render.circle_outline(vector(v204 + render.measure_text(v2.calibri_custom, nil, v5.planting_site).x + 25, v205 + v203 + render.measure_text(v2.calibri_custom, nil, v5.planting_site).y / 2 + 1), color(255, 255, 255, 200), 9.9, 0, v222 / 3.125, 3.5);
                    v203 = v203 - 41;
                end;
            end;
            if v5.skeet_indicators_selection:get("Spectators") then
                if v198.m_hObserverTarget and (v198.m_iObserverMode == 4 or v198.m_iObserverMode == 5) then
                    v198 = v198.m_hObserverTarget;
                end;
                local l_v198_0 = v198;
                if v198.get_spectators(l_v198_0) == nil then
                    return;
                else
                    local l_pairs_0 = pairs;
                    local l_v198_1 = v198;
                    for v226, v227 in l_pairs_0(v198.get_spectators(l_v198_1)) do
                        if not v227:is_bot() or v227:is_player() then
                            render.text(1, vector(render.screen_size().x - render.measure_text(1, nil, v227:get_name()).x - 6, -13 + v226 * 19), color(255, 255, 255, 200), nil, v227:get_name());
                        end;
                    end;
                end;
            end;
            return;
        end;
    end;
end;
v5.easing_table = v0.smoothy.new(v6);
v5.smoothy_value = v0.smoothy.new(0);
v5.crosshair_indicators_main = function()
    -- upvalues: v5 (ref), v46 (ref), v3 (ref), v6 (ref), v0 (ref)
    local v228 = entity.get_local_player();
    if v228 == nil or v228:is_alive() == false or v228:get_player_weapon() == nil then
        return;
    else
        local v229 = v228:get_player_weapon():get_weapon_index();
        local v230 = v229 == 43 or not (v229 ~= 44) or not (v229 ~= 45) or not (v229 ~= 46) or not (v229 ~= 47) or v229 == 48;
        local v231 = render.screen_size().x / 2;
        local v232 = render.screen_size().y / 2;
        local v233 = false;
        local v234 = 0;
        local v235 = false;
        for _, v237 in pairs(ui.get_binds()) do
            if v237.active and v237.name == "Hit Chance" then
                v233 = true;
                v234 = v237.value;
            end;
            if v237.active and v237.name == "Min. Damage" then
                v235 = true;
            end;
        end;
        v5.crosshair_indicators_grenades_transparency = v46.lerp(v5.crosshair_indicators_grenades_transparency, v230 and 0.15 or 1, 15 * globals.frametime);
        v5.crosshair_indicators_grenades_transparency_waiting = v46.lerp(v5.crosshair_indicators_grenades_transparency_waiting, v230 and 0.24 or 1, 15 * globals.frametime);
        v5.crosshair_indicators_grenades_dormant_transparency = v46.lerp(v5.crosshair_indicators_grenades_dormant_transparency, v230 and 0.31 or 1, 15 * globals.frametime);
        if v5.damage_indicator:get() then
            if v5.damage_indicator_animation:get() then
                render.text(1, vector(v231 + 4, v232 - 16), color(255, 255, 255, 255 * v5.crosshair_indicators_grenades_transparency), nil, string.format("%.f", v3.minimum_damage:get()));
            else
                render.text(1, vector(v231 + 4, v232 - 16), color(255, 255, 255, 255 * v5.crosshair_indicators_grenades_transparency), nil, string.format("%.f", v5.smoothy_value(0.02, v3.minimum_damage:get())));
            end;
        end;
        if v5.crosshair_indicators:get() then
            local function v244(v238, v239, v240, v241, v242, ...)
                -- upvalues: v6 (ref), v5 (ref), v0 (ref)
                if v6[v238] == nil then
                    v6[v238] = 0;
                    v5.easing_table = v0.smoothy.new(v6);
                end;
                local v243 = v5.easing_table(0.1, {
                    [v238] = render.measure_text(v240, nil, ...)
                })[v238];
                render.push_clip_rect(vector(v239.x - render.measure_text(v240, nil, ...).x, v239.y - v243.y / 2), vector(v239.x + v243.x / 2, v239.y + v243.y / 2), true);
                render.text(v240, vector(v239.x - v243.x / 2, v239.y - v243.y / 2), v241, v242, ...);
                render.pop_clip_rect();
            end;
            v5.crosshair_indicators_hide_shots_transparency = v46.lerp(v5.crosshair_indicators_hide_shots_transparency, (not v3.hide_shots:get() or v3.double_tap:get()) and 0 or 1, 25 * globals.frametime);
            v5.crosshair_indicators_double_tap_transparency = v46.lerp(v5.crosshair_indicators_double_tap_transparency, v3.double_tap:get() and 1 or 0, 25 * globals.frametime);
            v5.double_tap_ready = v46.lerp(v5.double_tap_ready, v3.double_tap:get() and rage.exploit:get() == 1 and 1 or 0, 25 * globals.frametime);
            v5.double_tap_charging = v46.lerp(v5.double_tap_charging, v3.double_tap:get() and rage.exploit:get() < 1 and rage.exploit:get() > 0 and 1 or 0, 25 * globals.frametime);
            v5.double_tap_active = v46.lerp(v5.double_tap_active, v3.double_tap:get() and rage.exploit:get() == 1 and defensive_active and 1 or 0, 25 * globals.frametime);
            v5.double_tap_waiting = v46.lerp(v5.double_tap_waiting, v3.double_tap:get() and rage.exploit:get() == 0 and 1 or 0, 25 * globals.frametime);
            v5.hide_shots_ready = v46.lerp(v5.hide_shots_ready, not (not v3.hide_shots:get() or v3.double_tap:get()) and rage.exploit:get() == 1 and 1 or 0, 25 * globals.frametime);
            v5.hide_shots_charging = v46.lerp(v5.hide_shots_charging, not (not v3.hide_shots:get() or v3.double_tap:get()) and rage.exploit:get() < 1 and rage.exploit:get() > 0 and 1 or 0, 25 * globals.frametime);
            v5.hide_shots_active = v46.lerp(v5.hide_shots_active, not (not v3.hide_shots:get() or v3.double_tap:get()) and rage.exploit:get() == 1 and defensive_active and 1 or 0, 25 * globals.frametime);
            v5.hide_shots_waiting = v46.lerp(v5.hide_shots_waiting, not (not v3.hide_shots:get() or v3.double_tap:get()) and rage.exploit:get() == 0 and 1 or 0, 25 * globals.frametime);
            v5.crosshair_indicators_hit_chance_transparency = v46.lerp(v5.crosshair_indicators_hit_chance_transparency, v233 == true and 1 or 0, 25 * globals.frametime);
            v5.crosshair_indicators_damage_transparency = v46.lerp(v5.crosshair_indicators_damage_transparency, v235 == true and 1 or 0, 25 * globals.frametime);
            v5.crosshair_indicators_dormant_transparency = v46.lerp(v5.crosshair_indicators_dormant_transparency, (not not v3.dormant_aimbot:get() or v5.dormant_aimbot:get() and v3.dormant_aimbot:get_override() == false) and 0.49 or 0, 25 * globals.frametime);
            local v245 = v0.animations.new("Crosshair Hit Chance Add Y", crosshair_hit_chance_add_y):update(v0.animations.types.LERP, v233 == true and (v3.hide_shots:get() or v3.double_tap:get()) and 9 or 0);
            local v246 = v0.animations.new("Crosshair Damage Add Y", crosshair_damage_add_y):update(v0.animations.types.LERP, v235 == true and (v3.hide_shots:get() or v3.double_tap:get() or v233 == true) and 9 or 0);
            local v247 = v0.animations.new("Crosshair Dormant Add Y", crosshair_dormant_add_y):update(v0.animations.types.LERP, (not not v3.dormant_aimbot:get() or v5.dormant_aimbot:get() and v3.dormant_aimbot:get_override() == false) and (not (not (v3.hide_shots:get() or v3.double_tap:get()) and v233 ~= true) or v235 == true) and 9 or 0);
            local v248 = v0.animations.new("Crosshair Indicators Add X", crosshair_indicators_add_x):update(v0.animations.types.LERP, v228.m_bIsScoped and 17 or 0);
            local v249 = v0.animations.new("Crosshair Hit Chance Add X", crosshair_hit_chance_add_x):update(v0.animations.types.LERP, v228.m_bIsScoped and 13 or 0);
            local v250 = v0.animations.new("Crosshair Damage Add X", crosshair_damage_add_x):update(v0.animations.types.LERP, v228.m_bIsScoped and 10 or 0);
            local v251 = v0.animations.new("Crosshair Dormant Add X", crosshair_dormant_add_x):update(v0.animations.types.LERP, v228.m_bIsScoped and 20 or 0);
            local v252 = v0.animations.new("Crosshair DT Ready Add X", crosshair_double_tap_ready_add_x):update(v0.animations.types.LERP, v228.m_bIsScoped and 19 or 0);
            local v253 = v0.animations.new("Crosshair DT Charging Add X", crosshair_double_tap_charging_add_x):update(v0.animations.types.LERP, v228.m_bIsScoped and 26 or 0);
            local v254 = v0.animations.new("Crosshair DT Active Add X", crosshair_double_tap_active_add_x):update(v0.animations.types.LERP, v228.m_bIsScoped and 19 or 0);
            local v255 = v0.animations.new("Crosshair DT Waiting Add X", crosshair_double_tap_waiting_add_x):update(v0.animations.types.LERP, v228.m_bIsScoped and 22 or 0);
            local v256 = v0.animations.new("Crosshair HS Ready Add X", crosshair_hide_shots_ready_add_x):update(v0.animations.types.LERP, v228.m_bIsScoped and 22 or 0);
            local v257 = v0.animations.new("Crosshair HS Charging Add X", crosshair_hide_shots_charging_add_x):update(v0.animations.types.LERP, v228.m_bIsScoped and 29 or 0);
            local v258 = v0.animations.new("Crosshair HS Active Add X", crosshair_hide_shots_active_add_x):update(v0.animations.types.LERP, v228.m_bIsScoped and 23 or 0);
            local v259 = v0.animations.new("Crosshair HS Waiting Add X", crosshair_hide_shots_waiting_add_x):update(v0.animations.types.LERP, v228.m_bIsScoped and 25 or 0);
            render.text(2, vector(v231 - 16 + v248, v232 + 18), color(v5.crosshair_indicators_accent_color:get().r, v5.crosshair_indicators_accent_color:get().g, v5.crosshair_indicators_accent_color:get().b, 255 * v5.crosshair_indicators_grenades_transparency), nil, "ZOV");
            render.text(2, vector(v231 - 1 + v248, v232 + 18), color(v5.crosshair_indicators_additional_color:get().r, v5.crosshair_indicators_additional_color:get().g, v5.crosshair_indicators_additional_color:get().b, math.abs(globals.curtime * 2 % 2 - 1) * 255 * v5.crosshair_indicators_grenades_transparency + 70 * v5.crosshair_indicators_grenades_transparency), nil, "YAW");
            if print_state_id == 10 then
                add_x_value = 19;
            elseif print_state_id == 9 then
                add_x_value = 20;
            elseif print_state_id == 8 then
                add_x_value = 20;
            elseif print_state_id == 7 then
                add_x_value = 13;
            elseif print_state_id == 6 then
                add_x_value = 18;
            elseif print_state_id == 5 then
                add_x_value = 23;
            elseif print_state_id == 4 then
                add_x_value = 23;
            elseif print_state_id == 3 then
                add_x_value = 18;
            elseif print_state_id == 2 then
                add_x_value = 16;
            elseif print_state_id == 1 then
                add_x_value = 20;
            end;
            local v260 = v0.animations.new("Crosshair States Add X", crosshair_states_add_x):update(v0.animations.types.LERP, v228.m_bIsScoped and add_x_value or 0);
            if not v228.m_bIsScoped then
                v244("Crosshair Indicators", vector(v231 + v260, v232 + 33), 2, color(v5.crosshair_indicators_accent_color:get().r, v5.crosshair_indicators_accent_color:get().g, v5.crosshair_indicators_accent_color:get().b, 255 * v5.crosshair_indicators_grenades_transparency), nil, print_state);
            else
                render.text(2, vector(v231 + v260 - render.measure_text(2, nil, print_state).x / 2, v232 + 33 - render.measure_text(2, nil, print_state).y / 2), color(v5.crosshair_indicators_accent_color:get().r, v5.crosshair_indicators_accent_color:get().g, v5.crosshair_indicators_accent_color:get().b, 255 * v5.crosshair_indicators_grenades_transparency), nil, print_state);
            end;
            if rage.exploit:get() == 1 then
                dt_vector1 = vector(v231 - 12 + v252, v232 + 42);
                dt_vector2 = vector(v231 + 5 + v252, v232 + 42);
                hs_vector1 = vector(v231 - 12 + v256, v232 + 42);
                hs_vector2 = vector(v231 + 9 + v256, v232 + 42);
                text = "READY";
                dt_color = color(160, 235, 135, 255 * v5.double_tap_ready * v5.crosshair_indicators_grenades_transparency);
                hs_color = color(160, 235, 135, 255 * v5.hide_shots_ready * v5.crosshair_indicators_grenades_transparency);
            elseif rage.exploit:get() < 1 and rage.exploit:get() > 0 then
                dt_vector1 = vector(v231 - 19 + v253, v232 + 42);
                dt_vector2 = vector(v231 + 5 + v253, v232 + 42);
                hs_vector1 = vector(v231 - 18 + v257, v232 + 42);
                hs_vector2 = vector(v231 + 9 + v257, v232 + 42);
                text = "CHARGING";
                dt_color = color(v5.crosshair_indicators_additional_color:get().r, v5.crosshair_indicators_additional_color:get().g, v5.crosshair_indicators_additional_color:get().b, 255 * v5.double_tap_charging * v5.crosshair_indicators_grenades_transparency);
                hs_color = color(v5.crosshair_indicators_additional_color:get().r, v5.crosshair_indicators_additional_color:get().g, v5.crosshair_indicators_additional_color:get().b, 255 * v5.hide_shots_charging * v5.crosshair_indicators_grenades_transparency);
            else
                dt_vector1 = vector(v231 - 15 + v255, v232 + 42);
                dt_vector2 = vector(v231 + 5 + v255, v232 + 42);
                hs_vector1 = vector(v231 - 15 + v259, v232 + 42);
                hs_vector2 = vector(v231 + 9 + v259, v232 + 42);
                text = "WAITING";
                dt_color = color(250, 45, 45, 155 * v5.double_tap_waiting * v5.crosshair_indicators_grenades_transparency_waiting);
                hs_color = color(250, 45, 45, 155 * v5.hide_shots_waiting * v5.crosshair_indicators_grenades_transparency_waiting);
            end;
            v5.hide_shots_animation1 = v46.lerp(v5.hide_shots_animation1, defensive_active and rage.exploit:get() == 1 and v231 - 13 + v258 or hs_vector1.x, 35 * globals.frametime);
            v5.double_tap_animation1 = v46.lerp(v5.double_tap_animation1, defensive_active and rage.exploit:get() == 1 and v231 - 12 + v254 or dt_vector1.x, 35 * globals.frametime);
            if not v228.m_bIsScoped then
                v244("HS Charge Text1", vector(v5.hide_shots_animation1, v232 + 42), 2, color(v5.crosshair_indicators_accent_color:get().r, v5.crosshair_indicators_accent_color:get().g, v5.crosshair_indicators_accent_color:get().b, 155 * v5.crosshair_indicators_hide_shots_transparency * v5.crosshair_indicators_grenades_transparency_waiting):lerp(color(v5.crosshair_indicators_accent_color:get().r, v5.crosshair_indicators_accent_color:get().g, v5.crosshair_indicators_accent_color:get().b, 255 * v5.crosshair_indicators_hide_shots_transparency * v5.crosshair_indicators_grenades_transparency), rage.exploit:get()), nil, "HIDE");
                v244("DT Charge Text1", vector(v5.double_tap_animation1, v232 + 42), 2, color(v5.crosshair_indicators_accent_color:get().r, v5.crosshair_indicators_accent_color:get().g, v5.crosshair_indicators_accent_color:get().b, 155 * v5.crosshair_indicators_double_tap_transparency * v5.crosshair_indicators_grenades_transparency_waiting):lerp(color(v5.crosshair_indicators_accent_color:get().r, v5.crosshair_indicators_accent_color:get().g, v5.crosshair_indicators_accent_color:get().b, 255 * v5.crosshair_indicators_double_tap_transparency * v5.crosshair_indicators_grenades_transparency), rage.exploit:get()), nil, "DT");
            else
                v244("HS Charge Text1", vector(v5.hide_shots_animation1, v232 + 42), 2, color(v5.crosshair_indicators_accent_color:get().r, v5.crosshair_indicators_accent_color:get().g, v5.crosshair_indicators_accent_color:get().b, 155 * v5.crosshair_indicators_hide_shots_transparency * v5.crosshair_indicators_grenades_transparency):lerp(color(v5.crosshair_indicators_accent_color:get().r, v5.crosshair_indicators_accent_color:get().g, v5.crosshair_indicators_accent_color:get().b, 255 * v5.crosshair_indicators_hide_shots_transparency * v5.crosshair_indicators_grenades_transparency), rage.exploit:get()), nil, "HIDE");
                v244("DT Charge Text1", vector(v5.double_tap_animation1, v232 + 42), 2, color(v5.crosshair_indicators_accent_color:get().r, v5.crosshair_indicators_accent_color:get().g, v5.crosshair_indicators_accent_color:get().b, 155 * v5.crosshair_indicators_double_tap_transparency * v5.crosshair_indicators_grenades_transparency):lerp(color(v5.crosshair_indicators_accent_color:get().r, v5.crosshair_indicators_accent_color:get().g, v5.crosshair_indicators_accent_color:get().b, 255 * v5.crosshair_indicators_double_tap_transparency * v5.crosshair_indicators_grenades_transparency), rage.exploit:get()), nil, "DT");
            end;
            v244("HS Charge Text2", defensive_active and rage.exploit:get() == 1 and vector(v231 + 8 + v258, v232 + 42) or hs_vector2, 2, defensive_active and color(v5.crosshair_indicators_additional_color:get().r, v5.crosshair_indicators_additional_color:get().g, v5.crosshair_indicators_additional_color:get().b, 255 * v5.hide_shots_active * v5.crosshair_indicators_grenades_transparency) or hs_color, nil, defensive_active and rage.exploit:get() == 1 and "ACTIVE" or text);
            v244("DT Charge Text2", defensive_active and rage.exploit:get() == 1 and vector(math.abs(v231 + 5 + v254), v232 + 42) or dt_vector2, 2, defensive_active and color(v5.crosshair_indicators_additional_color:get().r, v5.crosshair_indicators_additional_color:get().g, v5.crosshair_indicators_additional_color:get().b, 255 * v5.double_tap_active * v5.crosshair_indicators_grenades_transparency) or dt_color, nil, defensive_active and rage.exploit:get() == 1 and "ACTIVE" or text);
            render.text(2, vector(v231 + v249, v232 + 42 + v245), color(v5.crosshair_indicators_accent_color:get().r, v5.crosshair_indicators_accent_color:get().g, v5.crosshair_indicators_accent_color:get().b, 255 * v5.crosshair_indicators_hit_chance_transparency * v5.crosshair_indicators_grenades_transparency), "c", "HC:  " .. v234);
            render.text(2, vector(v231 + v250, v232 + 42 + v245 + v246), color(v5.crosshair_indicators_accent_color:get().r, v5.crosshair_indicators_accent_color:get().g, v5.crosshair_indicators_accent_color:get().b, 255 * v5.crosshair_indicators_damage_transparency * v5.crosshair_indicators_grenades_transparency), "c", "DMG");
            render.text(2, vector(v231 + v251, v232 + 42 + v245 + v246 + v247), color(v5.crosshair_indicators_accent_color:get().r, v5.crosshair_indicators_accent_color:get().g, v5.crosshair_indicators_accent_color:get().b, 255 * v5.crosshair_indicators_dormant_transparency * v5.crosshair_indicators_grenades_dormant_transparency), "c", "DORMANT");
        end;
        return;
    end;
end;
v5.manual_arrows_main = function()
    -- upvalues: v5 (ref), v3 (ref), v46 (ref), v2 (ref)
    if v5.manual_arrows:get() == false or v3.yaw:get_override() == "Disabled" then
        return;
    else
        local v261 = entity.get_local_player();
        if v261 == nil or not v261:is_alive() or v261:get_player_weapon() == nil then
            return;
        else
            local v262 = v261:get_player_weapon():get_weapon_index();
            local v263 = v262 == 43 or not (v262 ~= 44) or not (v262 ~= 45) or not (v262 ~= 46) or not (v262 ~= 47) or v262 == 48;
            local v264 = render.screen_size().x / 2;
            local v265 = render.screen_size().y / 2;
            v5.manual_transparency = v46.lerp(v5.manual_transparency, v261.m_bIsScoped and 0.5 or 1, 15 * globals.frametime);
            v5.manual_transparency_grenade = v46.lerp(v5.manual_transparency_grenade, v263 and 0.15 or 1, 15 * globals.frametime);
            if v5.manual_yaw:get() == "Forward" or anti_aim_on_use == true and v5.using == false then
                v5.manual_inverter_false = v46.lerp(v5.manual_inverter_false, rage.antiaim:inverter() == true and v3.body_yaw:get_override() and entity.get_game_rules().m_bFreezePeriod == false and v261.m_MoveType ~= 8 and color(v5.manual_desync_color:get().r, v5.manual_desync_color:get().g, v5.manual_desync_color:get().b, 255 * v5.manual_transparency * v5.manual_transparency_grenade) or color(15, 15, 15, 150 * v5.manual_transparency * v5.manual_transparency_grenade), 20 * globals.frametime);
                v5.manual_inverter_true = v46.lerp(v5.manual_inverter_true, rage.antiaim:inverter() == false and v3.body_yaw:get_override() and entity.get_game_rules().m_bFreezePeriod == false and v261.m_MoveType ~= 8 and color(v5.manual_desync_color:get().r, v5.manual_desync_color:get().g, v5.manual_desync_color:get().b, 255 * v5.manual_transparency * v5.manual_transparency_grenade) or color(15, 15, 15, 150 * v5.manual_transparency * v5.manual_transparency_grenade), 20 * globals.frametime);
            else
                v5.manual_inverter_false = v46.lerp(v5.manual_inverter_false, rage.antiaim:inverter() == false and v3.body_yaw:get_override() and entity.get_game_rules().m_bFreezePeriod == false and v261.m_MoveType ~= 8 and color(v5.manual_desync_color:get().r, v5.manual_desync_color:get().g, v5.manual_desync_color:get().b, 255 * v5.manual_transparency * v5.manual_transparency_grenade) or color(15, 15, 15, 150 * v5.manual_transparency * v5.manual_transparency_grenade), 20 * globals.frametime);
                v5.manual_inverter_true = v46.lerp(v5.manual_inverter_true, rage.antiaim:inverter() == true and v3.body_yaw:get_override() and entity.get_game_rules().m_bFreezePeriod == false and v261.m_MoveType ~= 8 and color(v5.manual_desync_color:get().r, v5.manual_desync_color:get().g, v5.manual_desync_color:get().b, 255 * v5.manual_transparency * v5.manual_transparency_grenade) or color(15, 15, 15, 150 * v5.manual_transparency * v5.manual_transparency_grenade), 20 * globals.frametime);
            end;
            if v5.manual_arrows_alternative:get() == false then
                render.poly(v5.manual_yaw:get() == "Left" and color(v5.manual_arrows_color:get().r, v5.manual_arrows_color:get().g, v5.manual_arrows_color:get().b, 255 * v5.manual_transparency * v5.manual_transparency_grenade) or color(15, 15, 15, 150 * v5.manual_transparency * v5.manual_transparency_grenade), vector(v264 - 44, v265 + 9), vector(v264 - 57, v265), vector(v264 - 44, v265 - 9));
                render.poly(v5.manual_yaw:get() == "Right" and color(v5.manual_arrows_color:get().r, v5.manual_arrows_color:get().g, v5.manual_arrows_color:get().b, 255 * v5.manual_transparency * v5.manual_transparency_grenade) or color(15, 15, 15, 150 * v5.manual_transparency * v5.manual_transparency_grenade), vector(v264 + 44, v265 + 9), vector(v264 + 57, v265), vector(v264 + 44, v265 - 9));
                render.rect(vector(v264 - 40, v265 - 9), vector(v264 - 42, v265 + 9), v5.manual_inverter_false, 0, true);
                render.rect(vector(v264 + 40, v265 - 9), vector(v264 + 42, v265 + 9), v5.manual_inverter_true, 0, true);
            else
                render.text(v2.verdana_22, vector(v264 - 65, v265 - 2), v5.manual_yaw:get() == "Left" and color(v5.manual_arrows_color:get().r, v5.manual_arrows_color:get().g, v5.manual_arrows_color:get().b, 255 * v5.manual_transparency * v5.manual_transparency_grenade * math.abs(globals.curtime * 1.1 % 2 - 1)) or color(255, 255, 255, 0), "c", "\226\128\185");
                render.text(v2.verdana_22, vector(v264 + 65, v265 - 2), v5.manual_yaw:get() == "Right" and color(v5.manual_arrows_color:get().r, v5.manual_arrows_color:get().g, v5.manual_arrows_color:get().b, 255 * v5.manual_transparency * v5.manual_transparency_grenade * math.abs(globals.curtime * 1.1 % 2 - 1)) or color(255, 255, 255, 0), "c", "\226\128\186");
            end;
            return;
        end;
    end;
end;
v5.viewmodel_fov_cache = cvar.viewmodel_fov:float();
v5.viewmodel_offset_x_cache = cvar.viewmodel_offset_x:float();
v5.viewmodel_offset_y_cache = cvar.viewmodel_offset_y:float();
v5.viewmodel_offset_z_cache = cvar.viewmodel_offset_z:float();
v5.viewmodel:set_callback(function(v266)
    -- upvalues: v5 (ref)
    cvar.viewmodel_fov:float(v266:get() and v5.viewmodel_fov:get() * 0.1 or v5.viewmodel_fov_cache, true);
    cvar.viewmodel_offset_x:float(v266:get() and v5.viewmodel_x:get() * 0.1 or v5.viewmodel_offset_x_cache, true);
    cvar.viewmodel_offset_y:float(v266:get() and v5.viewmodel_y:get() * 0.1 or v5.viewmodel_offset_y_cache, true);
    cvar.viewmodel_offset_z:float(v266:get() and v5.viewmodel_z:get() * 0.1 or v5.viewmodel_offset_z_cache, true);
end, true);
v5.viewmodel_fov:set_callback(function(v267)
    -- upvalues: v5 (ref)
    cvar.viewmodel_fov:float(v5.viewmodel:get() and v267:get() * 0.1 or v5.viewmodel_fov_cache, true);
end, true);
v5.viewmodel_x:set_callback(function(v268)
    -- upvalues: v5 (ref)
    cvar.viewmodel_offset_x:float(v5.viewmodel:get() and v268:get() * 0.1 or v5.viewmodel_offset_x_cache, true);
end, true);
v5.viewmodel_y:set_callback(function(v269)
    -- upvalues: v5 (ref)
    cvar.viewmodel_offset_y:float(v5.viewmodel:get() and v269:get() * 0.1 or v5.viewmodel_offset_y_cache, true);
end, true);
v5.viewmodel_z:set_callback(function(v270)
    -- upvalues: v5 (ref)
    cvar.viewmodel_offset_z:float(v5.viewmodel:get() and v270:get() * 0.1 or v5.viewmodel_offset_z_cache, true);
end, true);
v5.opposite_knife_hand_main = function()
    -- upvalues: v5 (ref)
    if entity.get_local_player() == nil or entity.get_local_player():get_player_weapon() == nil then
        return;
    else
        if v5.viewmodel:get() and v5.viewmodel_opposite_knife_hand:get() then
            if viewmodel_value == nil then
                viewmodel_value = 0;
            end;
            if viewmodel_value == 0 then
                viewmodel_value = 1;
                viewmodel_cache = cvar.cl_righthand:int();
            end;
            if viewmodel_cache == 1 then
                cvar.cl_righthand:int(entity.get_local_player():get_player_weapon():get_classname() == "CKnife" and 0 or 1);
            else
                cvar.cl_righthand:int(entity.get_local_player():get_player_weapon():get_classname() == "CKnife" and 1 or 0);
            end;
        elseif viewmodel_value == 1 then
            viewmodel_value = 0;
            cvar.cl_righthand:int(viewmodel_cache);
        end;
        return;
    end;
end;
events.pre_render:set(function()
    -- upvalues: v5 (ref), v46 (ref), v15 (ref), v16 (ref), v12 (ref), v9 (ref), v13 (ref), v8 (ref), v14 (ref), v10 (ref), v11 (ref)
    v5.console_color_modulation_main();
    if ui.get_alpha() > 0 then
        ui.sidebar(v46.gradient("ZOV Stable", color(ui.get_style("Link Active").r * 1.5, ui.get_style("Link Active").g * 2, ui.get_style("Link Active").b * 1.5), color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b), -1), "\226\152\129\239\184\143");
        v5.welcome:name("\a" .. color(ui.get_style("Active Text").r, ui.get_style("Active Text").g, ui.get_style("Active Text").b, 255):to_hex() .. "Welcome, " .. v46.gradient_text(common.get_username(), color(ui.get_style("Sidebar Text").r, ui.get_style("Sidebar Text").g, ui.get_style("Sidebar Text").b), color(ui.get_style("Link Active").r * 1.5, ui.get_style("Link Active").g * 1.5, ui.get_style("Link Active").b * 1.5)));
        v5.update:name("\a" .. color(ui.get_style("Active Text").r, ui.get_style("Active Text").g, ui.get_style("Active Text").b, 255):to_hex() .. "Latest update: " .. v46.gradient_text("Nov 4 2023", color(ui.get_style("Sidebar Text").r, ui.get_style("Sidebar Text").g, ui.get_style("Sidebar Text").b), color(ui.get_style("Link Active").r * 1.5, ui.get_style("Link Active").g * 1.5, ui.get_style("Link Active").b * 1.5)));
        v5.export_config:name("\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\239\149\174\a" .. color(ui.get_style("Active Text").r, ui.get_style("Active Text").g, ui.get_style("Active Text").b, 255):to_hex() .. "  Export");
        v5.import_config:name("\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\239\149\175\a" .. color(ui.get_style("Active Text").r, ui.get_style("Active Text").g, ui.get_style("Active Text").b, 255):to_hex() .. "  Import");
        v5.default_config:name("\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\239\129\152\a" .. color(ui.get_style("Active Text").r, ui.get_style("Active Text").g, ui.get_style("Active Text").b, 255):to_hex() .. "  Default");
        v5.youtube:name("\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\239\133\167\a" .. color(ui.get_style("Active Text").r, ui.get_style("Active Text").g, ui.get_style("Active Text").b, 255):to_hex() .. "  YouTube");
        v5.discord:name("\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\239\142\146\a" .. color(ui.get_style("Active Text").r, ui.get_style("Active Text").g, ui.get_style("Active Text").b, 255):to_hex() .. "  Discord");
        if v5.selection:get() == 1 then
            v5.selection:update("\194\187  \a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b):to_hex() .. "\239\129\154  \aDEFAULTGeneral", "\239\129\155  Ragebot", "\239\139\170  Anti Aim", "\239\135\188  Visuals", "\238\139\138  Misc");
        elseif v5.selection:get() == 2 then
            v5.selection:update("\239\129\154  General", "\194\187  \a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b):to_hex() .. "\239\129\155  \aDEFAULTRagebot", "\239\139\170  Anti Aim", "\239\135\188  Visuals", "\238\139\138  Misc");
        elseif v5.selection:get() == 3 then
            v5.selection:update("\239\129\154  General", "\239\129\155  Ragebot", "\194\187  \a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b):to_hex() .. "\239\139\170  \aDEFAULTAnti Aim", "\239\135\188  Visuals", "\238\139\138  Misc");
        elseif v5.selection:get() == 4 then
            v5.selection:update("\239\129\154  General", "\239\129\155  Ragebot", "\239\139\170  Anti Aim", "\194\187  \a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b):to_hex() .. "\239\135\188  \aDEFAULTVisuals", "\238\139\138  Misc");
        elseif v5.selection:get() == 5 then
            v5.selection:update("\239\129\154  General", "\239\129\155  Ragebot", "\239\139\170  Anti Aim", "\239\135\188  Visuals", "\194\187  \a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b):to_hex() .. "\238\139\138  \aDEFAULTMisc");
        end;
        v5.welcome:visibility(v5.selection:get() == 1);
        v5.update:visibility(v5.selection:get() == 1);
        v5.export_config:visibility(v5.selection:get() == 1);
        v5.import_config:visibility(v5.selection:get() == 1);
        v5.default_config:visibility(v5.selection:get() == 1);
        v5.youtube:visibility(v5.selection:get() == 1);
        v5.discord:visibility(v5.selection:get() == 1);
        v5.aimbot_logs:visibility(v5.selection:get() == 2);
        v5.aimbot_logs:name("\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\239\149\160  \aDEFAULTAimbot Logs");
        v5.aimbot_logs_output:visibility(v5.aimbot_logs_events:get("Aimbot Shots") or v5.aimbot_logs_events:get("Purchases") or v5.aimbot_logs_events:get("Receives"));
        v5.aimbot_logs_color:visibility((not not v5.aimbot_logs_events:get("Aimbot Shots") or v5.aimbot_logs_events:get("Purchases") or v5.aimbot_logs_events:get("Receives")) and v5.aimbot_logs_output:get("Console"));
        v5.hit_chance_modifications:visibility(v5.selection:get() == 2);
        v5.hit_chance_modifications:name("\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\239\153\136  \aDEFAULTHit Chance Mode");
        for v271 = 1, #v15 do
            v16[v271].enabled:visibility(v5.hit_chance_modifications_weapons:get() == v271);
            v16[v271].states:visibility(v5.hit_chance_modifications_weapons:get() == v271 and v16[v271].enabled:get());
            v16[4].states:visibility(false);
            v16[5].states:visibility(false);
            v16[v271].in_air_hit_chance:visibility(v5.hit_chance_modifications_weapons:get() == v271 and v16[v271].enabled:get() and v16[v271].states:get("In Air"));
            v16[4].in_air_hit_chance:visibility(v5.hit_chance_modifications_weapons:get() == 4 and v16[4].enabled:get());
            v16[5].in_air_hit_chance:visibility(v5.hit_chance_modifications_weapons:get() == 5 and v16[5].enabled:get());
            v16[v271].no_scope_hit_chance:visibility(v5.hit_chance_modifications_weapons:get() == v271 and v16[v271].enabled:get() and v16[v271].states:get("No Scope"));
            v16[4].no_scope_hit_chance:visibility(false);
            v16[5].no_scope_hit_chance:visibility(false);
            v16[v271].no_scope_distance:visibility(v5.hit_chance_modifications_weapons:get() == v271 and v16[v271].enabled:get() and v16[v271].states:get("No Scope"));
            v16[4].no_scope_distance:visibility(false);
            v16[5].no_scope_distance:visibility(false);
        end;
        v5.discharge_exploit:visibility(v5.selection:get() == 2);
        v5.discharge_exploit:name("\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\239\131\167  \aDEFAULTDischarge Exploit");
        v5.dormant_aimbot:visibility(v5.selection:get() == 2);
        v5.dormant_aimbot:name("\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\239\155\162  \aDEFAULTDormant Aimbot");
        v5.air_lag_exploit:visibility(v5.selection:get() == 2);
        v5.air_lag_exploit:name("\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\238\147\162  \aDEFAULTAir Lag Exploit");
        v5.mode:visibility(v5.selection:get() == 3);
        v5.mode_text:visibility(v5.selection:get() == 3 and v5.mode:get() ~= 2);
        v5.automatic_mode_force_break_lc:visibility(v5.selection:get() == 3 and v5.mode:get() == 1);
        v5.automatic_mode_force_break_lc:name("\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\239\129\144  \aDEFAULTForce Break LC");
        v5.automatic_mode_hidden_anti_aim:visibility(v5.selection:get() == 3 and v5.mode:get() == 1);
        v5.automatic_mode_hidden_anti_aim:name("\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\239\130\132  \aDEFAULTHidden Anti Aim");
        if v5.mode:get() == 1 then
            v5.mode:update("\194\187  \240\159\152\142  Automatic Mode", "\240\159\155\160\239\184\143  Conditional");
        elseif v5.mode:get() == 2 then
            v5.mode:update("\240\159\152\142  Automatic Mode", "\194\187  \240\159\155\160\239\184\143  Conditional");
        end;
        for v272 = 1, #v12 do
            v9[v272].hidden_pitch:visibility(v5.automatic_mode_hidden_anti_aim_states:get() == v12[v272]);
            v9[v272].hidden_pitch_offset1:visibility(v5.automatic_mode_hidden_anti_aim_states:get() == v12[v272] and v9[v272].hidden_pitch:get() ~= "Disabled" and v9[v272].hidden_pitch:get() ~= "Automatic");
            v9[v272].hidden_pitch_offset1:name(v9[v272].hidden_pitch:get() == "Custom" and "Offset" or "Offset #1");
            v9[v272].hidden_pitch_offset2:visibility(v5.automatic_mode_hidden_anti_aim_states:get() == v12[v272] and v9[v272].hidden_pitch:get() ~= "Disabled" and v9[v272].hidden_pitch:get() ~= "Custom" and v9[v272].hidden_pitch:get() ~= "Automatic");
            v9[v272].hidden_pitch_delay:visibility(v5.automatic_mode_hidden_anti_aim_states:get() == v12[v272] and v9[v272].hidden_pitch:get() == "Switch");
            v9[v272].hidden_yaw:visibility(v5.automatic_mode_hidden_anti_aim_states:get() == v12[v272]);
            v9[v272].hidden_yaw_offset:visibility(v5.automatic_mode_hidden_anti_aim_states:get() == v12[v272] and v9[v272].hidden_yaw:get() == "Custom");
        end;
        v5.current_state:visibility(v5.selection:get() == 3 and v5.mode:get() == 2);
        v5.current_state:name("\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\239\159\128  \aDEFAULTCurrent State");
        v5.bombsite_fix:visibility(v5.selection:get() == 3 and v5.current_state:get() == v13[9] and v8[9].override:get() and v5.mode:get() == 2);
        v5.bombsite_fix:name("\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\239\147\188  \aDEFAULTBombsite Fix");
        for v273 = 1, #v13 do
            v8[v273].override:visibility(v5.selection:get() == 3 and v5.current_state:get() == v13[v273] and v5.mode:get() == 2);
            v8[1].override:visibility(false);
            v8[1].override:set(true);
            v8[v273].override:name("\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\238\144\166  \aDEFAULTOverride " .. v13[v273]);
            v8[v273].force_break_lc:visibility(v5.selection:get() == 3 and v5.current_state:get() == v13[v273] and v5.mode:get() == 2 and v8[v273].override:get());
            v8[8].force_break_lc:visibility(false);
            v8[v273].force_break_lc:name("\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\239\129\144  \aDEFAULTForce Break LC" .. v14[v273]);
            v10[v273].pitch:visibility(v5.selection:get() == 3 and v5.current_state:get() == v13[v273] and v5.mode:get() == 2);
            v10[v273].pitch:name("\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\238\130\153  \aDEFAULTPitch");
            v10[v273].yaw:visibility(v5.selection:get() == 3 and v5.current_state:get() == v13[v273] and v5.mode:get() == 2);
            v10[v273].yaw:name("\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\239\136\157  \aDEFAULTYaw");
            v10[v273].yaw_modifier:visibility(v5.selection:get() == 3 and v5.current_state:get() == v13[v273] and v10[v273].yaw:get() ~= "Disabled" and v5.mode:get() == 2);
            v10[v273].yaw_modifier:name("\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\238\146\188  \aDEFAULTYaw Modifier");
            v10[v273].body_yaw:visibility(v5.selection:get() == 3 and v5.current_state:get() == v13[v273] and v5.mode:get() == 2);
            v10[v273].body_yaw:name("\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\238\130\133  \aDEFAULTBody Yaw");
            v10[v273].extended_angles:visibility(v5.selection:get() == 3 and v5.current_state:get() == v13[v273] and v5.mode:get() == 2);
            v10[v273].extended_angles:name("\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\238\130\140  \aDEFAULTExtended Angles");
            v10[v273].hidden_anti_aim:visibility(v5.selection:get() == 3 and v5.current_state:get() == v13[v273] and v5.mode:get() == 2);
            v10[8].hidden_anti_aim:visibility(false);
            v10[v273].hidden_anti_aim:name("\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\239\130\132  \aDEFAULTHidden Anti Aim");
            v11[v273].yaw_modifier_way_type:visibility(v5.current_state:get() == v13[v273] and v5.mode:get() == 2 and (not (v10[v273].yaw_modifier:get() ~= "3-Way") or v10[v273].yaw_modifier:get() == "5-Way"));
            v11[v273].yaw_left_offset:visibility(v5.current_state:get() == v13[v273] and v5.mode:get() == 2 and v10[v273].yaw_modifier:get() ~= "Delay");
            v11[v273].yaw_right_offset:visibility(v5.current_state:get() == v13[v273] and v5.mode:get() == 2 and v10[v273].yaw_modifier:get() ~= "Delay");
            v11[v273].yaw_randomize:visibility(v5.current_state:get() == v13[v273] and v5.mode:get() == 2 and v10[v273].yaw_modifier:get() ~= "Delay");
            v11[v273].body_yaw_inverter:visibility(v5.current_state:get() == v13[v273] and v5.mode:get() == 2 and v10[v273].yaw_modifier:get() ~= "Delay");
            v11[v273].body_yaw_options:visibility(v5.current_state:get() == v13[v273] and v5.mode:get() == 2 and v10[v273].yaw_modifier:get() ~= "Delay");
            v11[v273].body_yaw_freestanding:visibility(v5.current_state:get() == v13[v273] and v5.mode:get() == 2 and v10[v273].yaw_modifier:get() ~= "Delay");
            if v10[v273].yaw_modifier:get() == "3-Way" or v10[v273].yaw_modifier:get() == "5-Way" then
                v11[v273].yaw_modifier_left_offset:visibility(v5.current_state:get() == v13[v273] and v5.mode:get() == 2 and v11[v273].yaw_modifier_way_type:get() == "Default");
                v11[v273].yaw_modifier_right_offset:visibility(v5.current_state:get() == v13[v273] and v5.mode:get() == 2 and v11[v273].yaw_modifier_way_type:get() == "Default");
            else
                v11[v273].yaw_modifier_left_offset:visibility(true);
                v11[v273].yaw_modifier_right_offset:visibility(true);
            end;
            v11[v273].yaw_modifier_delay_ticks:visibility(v5.current_state:get() == v13[v273] and v5.mode:get() == 2 and v10[v273].yaw_modifier:get() == "Delay");
            v11[v273].yaw_modifier_offset1:visibility(v5.current_state:get() == v13[v273] and v5.mode:get() == 2 and (not (v10[v273].yaw_modifier:get() ~= "3-Way") or v10[v273].yaw_modifier:get() == "5-Way") and v11[v273].yaw_modifier_way_type:get() == "Custom");
            v11[v273].yaw_modifier_offset2:visibility(v5.current_state:get() == v13[v273] and v5.mode:get() == 2 and (not (v10[v273].yaw_modifier:get() ~= "3-Way") or v10[v273].yaw_modifier:get() == "5-Way") and v11[v273].yaw_modifier_way_type:get() == "Custom");
            v11[v273].yaw_modifier_offset3:visibility(v5.current_state:get() == v13[v273] and v5.mode:get() == 2 and (not (v10[v273].yaw_modifier:get() ~= "3-Way") or v10[v273].yaw_modifier:get() == "5-Way") and v11[v273].yaw_modifier_way_type:get() == "Custom");
            v11[v273].yaw_modifier_offset4:visibility(v5.current_state:get() == v13[v273] and v5.mode:get() == 2 and v10[v273].yaw_modifier:get() == "5-Way" and v11[v273].yaw_modifier_way_type:get() == "Custom");
            v11[v273].yaw_modifier_offset5:visibility(v5.current_state:get() == v13[v273] and v5.mode:get() == 2 and v10[v273].yaw_modifier:get() == "5-Way" and v11[v273].yaw_modifier_way_type:get() == "Custom");
            v11[v273].hidden_pitch_offset1:visibility(v11[v273].hidden_pitch:get() ~= "Disabled" and v11[v273].hidden_pitch:get() ~= "Automatic");
            v11[v273].hidden_pitch_offset1:name(v11[v273].hidden_pitch:get() == "Custom" and "Offset\194\160" or "Offset #1");
            v11[v273].hidden_pitch_offset2:visibility(v11[v273].hidden_pitch:get() ~= "Disabled" and v11[v273].hidden_pitch:get() ~= "Custom" and v11[v273].hidden_pitch:get() ~= "Automatic");
            v11[v273].hidden_pitch_delay:visibility(v11[v273].hidden_pitch:get() == "Switch");
            v11[v273].hidden_yaw_offset:visibility(v11[v273].hidden_yaw:get() == "Custom");
        end;
        v5.avoid_backstab:visibility(v5.selection:get() == 3);
        v5.avoid_backstab:name("\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\239\155\181  \aDEFAULTAvoid Backstab");
        v5.edge_yaw:visibility(v5.selection:get() == 3);
        v5.edge_yaw:name("\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\238\146\187  \aDEFAULTEdge Yaw");
        v5.freestanding:visibility(v5.selection:get() == 3);
        v5.freestanding:name("\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\239\139\177  \aDEFAULTFreestanding");
        v5.manual_yaw:visibility(v5.selection:get() == 3);
        v5.manual_yaw:name("\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\239\130\178  \aDEFAULTManual Yaw");
        v5.safe_head:visibility(v5.selection:get() == 3);
        v5.safe_head:name("\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\239\148\133  \aDEFAULTSafe Head");
        v5.safe_head_hidden_pitch:visibility(v5.safe_head_hidden_anti_aim:get());
        v5.safe_head_hidden_pitch_offset1:visibility(v5.safe_head_hidden_anti_aim:get() and v5.safe_head_hidden_pitch:get() ~= "Disabled" and v5.safe_head_hidden_pitch:get() ~= "Automatic");
        v5.safe_head_hidden_pitch_offset1:name(v5.safe_head_hidden_pitch:get() == "Custom" and "Offset\194\160" or "Offset #1");
        v5.safe_head_hidden_pitch_offset2:visibility(v5.safe_head_hidden_anti_aim:get() and v5.safe_head_hidden_pitch:get() ~= "Disabled" and v5.safe_head_hidden_pitch:get() ~= "Custom" and v5.safe_head_hidden_pitch:get() ~= "Automatic");
        v5.safe_head_hidden_pitch_delay:visibility(v5.safe_head_hidden_anti_aim:get() and v5.safe_head_hidden_pitch:get() ~= "Disabled" and v5.safe_head_hidden_pitch:get() == "Switch");
        v5.safe_head_hidden_yaw:visibility(v5.safe_head_hidden_anti_aim:get());
        v5.safe_head_hidden_yaw_offset:visibility(v5.safe_head_hidden_anti_aim:get() and v5.safe_head_hidden_yaw:get() == "Custom");
        v5.better_scope_overlay:visibility(v5.selection:get() == 4);
        v5.better_scope_overlay:name("\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\239\129\155  \aDEFAULTBetter Scope Overlay");
        v5.crosshair_indicators:visibility(v5.selection:get() == 4);
        v5.crosshair_indicators:name("\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\239\153\129  \aDEFAULTCrosshair Indicators");
        v5.damage_indicator:visibility(v5.selection:get() == 4);
        v5.damage_indicator:name("\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\238\144\156  \aDEFAULTDamage Indicator");
        v5.skeet_indicators:visibility(v5.selection:get() == 4);
        v5.skeet_indicators:name("\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\239\151\189  \aEAEAEAFFGame\a95B806FFSense \aDEFAULTIndicators");
        v5.skeet_indicators_break_lc_indicator:visibility(v5.skeet_indicators_selection:get("Double Tap"));
        v5.manual_arrows:visibility(v5.selection:get() == 4);
        v5.manual_arrows:name("\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\239\130\142  \aDEFAULTManual Arrows");
        v5.manual_desync_color:visibility(v5.manual_arrows_alternative:get() == false);
        v5.velocity_warning:visibility(v5.selection:get() == 4);
        v5.velocity_warning:name("\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\238\149\135  \aDEFAULTVelocity Warning");
        v5.velocity_warning_x:visibility(false);
        v5.velocity_warning_y:visibility(false);
        v5.keep_model_transparency:visibility(v5.selection:get() == 4);
        v5.keep_model_transparency:name("\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\239\131\129  \aDEFAULTKeep Model Transparency");
        v5.aspect_ratio:visibility(v5.selection:get() == 4);
        v5.aspect_ratio:name("\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\239\148\176  \aDEFAULTAspect Ratio");
        v5.animation_breakers:visibility(v5.selection:get() == 4);
        v5.animation_breakers:name("\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\238\149\145  \aDEFAULTAnimation Breakers");
        v5.viewmodel:visibility(v5.selection:get() == 4);
        v5.viewmodel:name("\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\238\134\168  \aDEFAULTViewmodel");
        v5.viewmodel_reset:name("\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\239\139\170\a" .. color(ui.get_style("Active Text").r, ui.get_style("Active Text").g, ui.get_style("Active Text").b, 255):to_hex() .. "  Reset");
        v5.console_modulation:visibility(v5.selection:get() == 5);
        v5.console_modulation:name("\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\239\132\161  \aDEFAULTVGUI Modulation");
        v5.unmute_silenced_players:visibility(v5.selection:get() == 5);
        v5.unmute_silenced_players:name("\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\239\139\162  \aDEFAULTUnmute Silenced Players");
        v5.icon_notification:visibility(v5.selection:get() == 5);
        v5.icon_notification:name("\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\238\138\158  \aDEFAULTTaskbar Notification");
        v5.clan_tag:visibility(v5.selection:get() == 5);
        v5.clan_tag:name("\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\239\128\172  \aDEFAULTClan Tag");
        v5.unlock_fake_latency:visibility(v5.selection:get() == 5);
        v5.unlock_fake_latency:name("\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\239\130\156  \aDEFAULTUnlock Fake Latency");
        v5.fast_ladder_move:visibility(v5.selection:get() == 5);
        v5.fast_ladder_move:name("\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\239\151\133  \aDEFAULTFast Ladder Move");
        v5.no_fall_damage:visibility(v5.selection:get() == 5);
        v5.no_fall_damage:name("\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\238\149\134  \aDEFAULTNo Fall Damage");
        ui.localize("ru", "Selection", "\208\146\209\139\208\177\208\190\209\128 \208\178\208\186\208\187\208\176\208\180\208\186\208\184");
        ui.localize("ru", "Information", "\208\152\208\189\209\132\208\190\209\128\208\188\208\176\209\134\208\184\209\143");
        ui.localize("ru", "Configs", "\208\154\208\190\208\189\209\132\208\184\208\179\209\131\209\128\208\176\209\134\208\184\208\184");
        ui.localize("ru", "Recommendations", "\208\160\208\181\208\186\208\190\208\188\208\181\208\189\208\180\208\176\209\134\208\184\208\184");
        ui.localize("ru", "Settings", "\208\157\208\176\209\129\209\130\209\128\208\190\208\185\208\186\208\184");
        ui.localize("ru", "Main", "\208\158\209\129\208\189\208\190\208\178\208\189\208\190\208\181");
        ui.localize("ru", "Automatic Mode", "\208\144\208\178\209\130\208\190\208\188\208\176\209\130\208\184\209\135\208\181\209\129\208\186\208\184\208\185 \209\128\208\181\208\182\208\184\208\188");
        ui.localize("ru", "Modifications", "\208\156\208\190\208\180\208\184\209\132\208\184\208\186\208\176\209\134\208\184\208\184");
        ui.localize("ru", "Movement", "\208\159\208\181\209\128\208\181\208\188\208\181\209\137\208\181\208\189\208\184\208\181");
        ui.localize("ru", "Default Angles", "\208\163\208\179\208\187\209\139 \208\189\208\176\208\186\208\187\208\190\208\189\208\176 \208\191\208\190 \209\131\208\188\208\190\208\187\209\135\208\176\208\189\208\184\209\142");
        ui.localize("ru", "Standing Angles", "\208\163\208\179\208\187\209\139 \208\191\209\128\208\184 \209\129\209\130\208\190\208\185\208\186\208\181");
        ui.localize("ru", "Moving Angles", "\208\163\208\179\208\187\209\139 \208\191\209\128\208\184 \208\191\208\181\209\128\208\181\208\188\208\181\209\137\208\181\208\189\208\184\208\184");
        ui.localize("ru", "Slow Walking Angles", "\208\163\208\179\208\187\209\139 \208\191\209\128\208\184 \208\188\208\181\208\180\208\187\208\181\208\189\208\189\208\190\208\185 \209\133\208\190\208\180\209\140\208\177\208\181");
        ui.localize("ru", "Crouching Angles", "\208\163\208\179\208\187\209\139 \208\191\209\128\208\184 \209\129\208\186\209\128\209\131\209\135\208\184\208\178\208\176\208\189\208\184\208\184");
        ui.localize("ru", "In Air Angles", "\208\163\208\179\208\187\209\139 \208\178 \208\178\208\190\208\183\208\180\209\131\209\133\208\181");
        ui.localize("ru", "In Air & Crouching Angles", "\208\163\208\179\208\187\209\139 \208\178 \208\178\208\190\208\183\208\180\209\131\209\133\208\181 \208\191\209\128\208\184 \209\129\208\186\209\128\209\131\209\135\208\184\208\178\208\176\208\189\208\184\208\184");
        ui.localize("ru", "No Exploits Angles", "\208\163\208\179\208\187\209\139 \208\191\209\128\208\184 \208\190\209\130\209\129\209\131\209\130\209\129\209\130\208\178\208\184\208\184 \209\141\208\186\209\129\208\191\208\187\208\190\208\184\209\130\208\190\208\178");
        ui.localize("ru", "On Use Angles", "\208\163\208\179\208\187\209\139 \208\191\209\128\208\184 \208\191\209\128\208\184\208\188\208\181\208\189\208\181\208\189\208\184\208\184");
        ui.localize("ru", "\194\187  \239\129\154  General", "\194\187  \a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b):to_hex() .. "\239\129\154  \aDEFAULT\208\158\208\177\209\137\208\181\208\181");
        ui.localize("ru", "\194\187  \239\129\155  Ragebot", "\194\187  \a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b):to_hex() .. "\239\129\155  \aDEFAULT\208\160\208\181\208\185\208\180\208\182\208\177\208\190\209\130");
        ui.localize("ru", "\194\187  \239\139\170  Anti Aim", "\194\187  \a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b):to_hex() .. "\239\139\170  \aDEFAULT\208\144\208\189\209\130\208\184 \208\144\208\184\208\188");
        ui.localize("ru", "\194\187  \239\135\188  Visuals", "\194\187  \a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b):to_hex() .. "\239\135\188  \aDEFAULT\208\146\208\184\208\183\209\131\208\176\208\187\209\139");
        ui.localize("ru", "\194\187  \238\139\138  Misc", "\194\187  \a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b):to_hex() .. "\238\139\138  \aDEFAULT\208\158\209\129\209\130\208\176\208\187\209\140\208\189\208\190\208\181");
        ui.localize("ru", "\239\129\154  General", "\239\129\154  \208\158\208\177\209\137\208\181\208\181");
        ui.localize("ru", "\239\129\155  Ragebot", "\239\129\155  \208\160\208\181\208\185\208\180\208\182\208\177\208\190\209\130");
        ui.localize("ru", "\239\139\170  Anti Aim", "\239\139\170  \208\144\208\189\209\130\208\184 \208\144\208\184\208\188");
        ui.localize("ru", "\239\135\188  Visuals", "\239\135\188  \208\146\208\184\208\183\209\131\208\176\208\187\209\139");
        ui.localize("ru", "\238\139\138  Misc", "\238\139\138  \208\158\209\129\209\130\208\176\208\187\209\140\208\189\208\190\208\181");
        ui.localize("ru", "Welcome, " .. common.get_username(), "\a" .. color(ui.get_style("Active Text").r, ui.get_style("Active Text").g, ui.get_style("Active Text").b, 255):to_hex() .. "\208\148\208\190\208\177\209\128\208\190 \208\191\208\190\208\182\208\176\208\187\208\190\208\178\208\176\209\130\209\140, " .. v46.gradient_text(common.get_username(), color(ui.get_style("Sidebar Text").r, ui.get_style("Sidebar Text").g, ui.get_style("Sidebar Text").b), color(ui.get_style("Link Active").r * 1.5, ui.get_style("Link Active").g * 1.5, ui.get_style("Link Active").b * 1.5)));
        ui.localize("ru", "Latest update: Oct 27 2023", "\a" .. color(ui.get_style("Active Text").r, ui.get_style("Active Text").g, ui.get_style("Active Text").b, 255):to_hex() .. "\208\159\208\190\209\129\208\187\208\181\208\180\208\189\208\181\208\181 \208\190\208\177\208\189\208\190\208\178\208\187\208\181\208\189\208\184\208\181: " .. v46.gradient_text("Oct 27 2023", color(ui.get_style("Sidebar Text").r, ui.get_style("Sidebar Text").g, ui.get_style("Sidebar Text").b), color(ui.get_style("Link Active").r * 1.5, ui.get_style("Link Active").g * 1.5, ui.get_style("Link Active").b * 1.5)));
        ui.localize("ru", "\239\149\174  Export", "\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\239\149\174\a" .. color(ui.get_style("Active Text").r, ui.get_style("Active Text").g, ui.get_style("Active Text").b, 255):to_hex() .. "  \208\173\208\186\209\129\208\191\208\190\209\128\209\130");
        ui.localize("ru", "\239\149\175  Import", "\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\239\149\175\a" .. color(ui.get_style("Active Text").r, ui.get_style("Active Text").g, ui.get_style("Active Text").b, 255):to_hex() .. "  \208\152\208\188\208\191\208\190\209\128\209\130");
        ui.localize("ru", "\239\129\152  Default", "\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\239\129\152\a" .. color(ui.get_style("Active Text").r, ui.get_style("Active Text").g, ui.get_style("Active Text").b, 255):to_hex() .. "  \208\173\209\130\208\176\208\187\208\190\208\189");
        ui.localize("ru", "\239\149\160  Aimbot Logs", "\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\239\149\160  \aDEFAULT\208\155\208\190\208\179\208\184\209\128\208\190\208\178\208\176\208\189\208\184\208\181 \208\176\208\184\208\188\208\177\208\190\209\130\208\176");
        ui.localize("ru", "Events", "\208\152\208\178\208\181\208\189\209\130\209\139");
        ui.localize("ru", "Aimbot Shots", "\208\144\208\184\208\188\208\177\208\190\209\130 \208\178\209\139\209\129\209\130\209\128\208\181\208\187\209\139");
        ui.localize("ru", "Purchases", "\208\159\208\190\208\186\209\131\208\191\208\186\208\184 \208\191\209\128\208\181\208\180\208\188\208\181\209\130\208\190\208\178");
        ui.localize("ru", "Receives", "\208\159\208\190\208\187\209\131\209\135\208\176\208\181\208\188\209\139\208\185 \209\131\209\128\208\190\208\189");
        ui.localize("ru", "Output", "\208\146\209\139\208\178\208\190\208\180");
        ui.localize("ru", "Default", "\208\159\208\190 \209\131\208\188\208\190\208\187\209\135\208\176\208\189\208\184\209\142");
        ui.localize("ru", "Console", "\208\154\208\190\208\189\209\129\208\190\208\187\209\140");
        ui.localize("ru", "Accent Color", "\208\144\208\186\209\134\208\181\208\189\209\130\208\189\209\139\208\185 \209\134\208\178\208\181\209\130");
        ui.localize("ru", "Additional Color", "\208\148\208\190\208\191\208\190\208\187\208\189\208\184\209\130\208\181\208\187\209\140\208\189\209\139\208\185 \209\134\208\178\208\181\209\130");
        ui.localize("ru", "\239\153\136  Hit Chance Mode", "\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\239\153\136  \aDEFAULT\208\160\208\181\208\182\208\184\208\188\209\139 \209\136\208\176\208\189\209\129\208\176 \208\191\208\190\208\191\208\176\208\180\208\176\208\189\208\184\209\143");
        ui.localize("ru", "Disable Air Strafe", "\208\146\209\139\208\186\208\187\209\142\209\135\208\184\209\130\209\140 \209\129\209\130\209\128\208\181\208\185\209\132\208\181\209\128 \208\178 \208\178\208\190\208\183\208\180\209\131\209\133\208\181");
        ui.localize("ru", "Enabled\194\160", "\208\146\208\186\208\187\209\142\209\135\208\181\208\189\208\190\194\160");
        ui.localize("ru", "Enabled\194\160\194\160", "\208\146\208\186\208\187\209\142\209\135\208\181\208\189\208\190\194\160\194\160");
        ui.localize("ru", "Enabled\194\160\194\160\194\160", "\208\146\208\186\208\187\209\142\209\135\208\181\208\189\208\190\194\160\194\160\194\160");
        ui.localize("ru", "Enabled\194\160\194\160\194\160\194\160", "\208\146\208\186\208\187\209\142\209\135\208\181\208\189\208\190\194\160\194\160\194\160\194\160");
        ui.localize("ru", "Enabled\194\160\194\160\194\160\194\160\194\160", "\208\146\208\186\208\187\209\142\209\135\208\181\208\189\208\190\194\160\194\160\194\160\194\160\194\160");
        ui.localize("ru", "States\194\160", "\208\161\208\190\209\129\209\130\208\190\209\143\208\189\208\184\209\143\194\160");
        ui.localize("ru", "States\194\160\194\160", "\208\161\208\190\209\129\209\130\208\190\209\143\208\189\208\184\209\143\194\160\194\160");
        ui.localize("ru", "States\194\160\194\160\194\160", "\208\161\208\190\209\129\209\130\208\190\209\143\208\189\208\184\209\143\194\160\194\160\194\160");
        ui.localize("ru", "In Air\194\160", "\208\146 \208\178\208\190\208\183\208\180\209\131\209\133\208\181\194\160");
        ui.localize("ru", "In Air\194\160\194\160", "\208\146 \208\178\208\190\208\183\208\180\209\131\209\133\208\181\194\160\194\160");
        ui.localize("ru", "In Air\194\160\194\160\194\160", "\208\146 \208\178\208\190\208\183\208\180\209\131\209\133\208\181\194\160\194\160\194\160");
        ui.localize("ru", "In Air\194\160\194\160\194\160\194\160", "\208\146 \208\178\208\190\208\183\208\180\209\131\209\133\208\181\194\160\194\160\194\160\194\160");
        ui.localize("ru", "In Air\194\160\194\160\194\160\194\160\194\160", "\208\146 \208\178\208\190\208\183\208\180\209\131\209\133\208\181\194\160\194\160\194\160\194\160\194\160");
        ui.localize("ru", "No Scope\194\160", "\208\145\208\181\208\183 \208\191\209\128\208\184\209\134\208\181\208\187\208\176\194\160");
        ui.localize("ru", "No Scope\194\160\194\160", "\208\145\208\181\208\183 \208\191\209\128\208\184\209\134\208\181\208\187\208\176\194\160\194\160");
        ui.localize("ru", "No Scope\194\160\194\160\194\160", "\208\145\208\181\208\183 \208\191\209\128\208\184\209\134\208\181\208\187\208\176\194\160\194\160\194\160");
        ui.localize("ru", "Distance\194\160", "\208\148\208\184\209\129\209\130\208\176\208\189\209\134\208\184\209\143\194\160");
        ui.localize("ru", "Distance\194\160\194\160", "\208\148\208\184\209\129\209\130\208\176\208\189\209\134\208\184\209\143\194\160\194\160");
        ui.localize("ru", "Distance\194\160\194\160\194\160", "\208\148\208\184\209\129\209\130\208\176\208\189\209\134\208\184\209\143\194\160\194\160\194\160");
        ui.localize("ru", "In Air", "\208\146 \208\178\208\190\208\183\208\180\209\131\209\133\208\181");
        ui.localize("ru", "No Scope", "\208\145\208\181\208\183 \208\191\209\128\208\184\209\134\208\181\208\187\208\176");
        ui.localize("ru", "\239\131\167  Discharge Exploit", "\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\239\131\167  \aDEFAULT\208\160\208\176\208\183\209\128\209\143\208\180 \209\141\208\186\209\129\208\191\208\187\208\190\208\184\209\130\208\176");
        ui.localize("ru", "Pistols", "\208\159\208\184\209\129\209\130\208\190\208\187\208\181\209\130\209\139");
        ui.localize("ru", "AutoSnipers", "\208\144\208\178\209\130\208\190\209\129\208\189\208\176\208\185\208\191\208\181\209\128\208\186\208\184");
        ui.localize("ru", "Knife", "\208\157\208\190\208\182");
        ui.localize("ru", "\239\155\162  Dormant Aimbot", "\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\239\155\162  \aDEFAULT\208\148\208\190\209\128\208\188\208\176\208\189\209\130 \208\176\208\184\208\188\208\177\208\190\209\130");
        ui.localize("ru", "Min. Damage", "\208\156\208\184\208\189. \209\131\209\128\208\190\208\189");
        ui.localize("ru", "\238\147\162  Air Lag Exploit", "\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\238\147\162  \aDEFAULT\208\155\208\176\208\179 \209\141\208\186\209\129\208\191\208\187\208\190\208\184\209\130");
        ui.localize("ru", "\239\155\181  Avoid Backstab", "\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\239\155\181  \aDEFAULT\208\152\208\183\208\177\208\181\208\179\208\176\209\130\209\140 \209\131\208\180\208\176\209\128\209\139 \208\178 \209\129\208\191\208\184\208\189\209\131");
        ui.localize("ru", "\238\146\187  Edge Yaw", "\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\238\146\187  \aDEFAULT\208\154\209\128\208\176\208\185\208\189\208\184\208\185 \209\131\208\179\208\190\208\187");
        ui.localize("ru", "\239\139\177  Freestanding", "\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\239\139\177  \aDEFAULT\208\144\208\178\209\130\208\190 \209\128\208\176\208\183\208\178\208\190\209\128\208\190\209\130");
        ui.localize("ru", "Body Freestanding", "\208\160\208\176\208\183\208\178\208\190\209\128\208\190\209\130 \209\130\208\181\208\187\208\176");
        ui.localize("ru", "Disable Hidden Anti Aim", "\208\158\209\130\208\186\208\187\209\142\209\135\208\184\209\130\209\140 \209\129\208\186\209\128\209\139\209\130\209\139\208\181 \209\131\208\179\208\187\209\139");
        ui.localize("ru", "Disablers", "\208\148\208\181\208\183\208\176\208\186\209\130\208\184\208\178\208\176\209\130\208\190\209\128\209\139");
        ui.localize("ru", "\239\130\178  Manual Yaw", "\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\239\130\178  \aDEFAULT\208\160\209\131\209\135\208\189\208\190\208\185 \209\131\208\179\208\190\208\187");
        ui.localize("ru", "Forward", "\208\146\208\191\208\181\209\128\208\181\208\180");
        ui.localize("ru", "Backward", "\208\157\208\176\208\183\208\176\208\180");
        ui.localize("ru", "Right", "\208\146\208\191\209\128\208\176\208\178\208\190");
        ui.localize("ru", "Left", "\208\146\208\187\208\181\208\178\208\190");
        ui.localize("ru", "Disable Yaw Modifiers", "\208\158\209\130\208\186\208\187\209\142\209\135\208\184\209\130\209\140 \208\188\208\190\208\180\208\184\209\132\208\184\208\186\208\176\209\130\208\190\209\128\209\139");
        ui.localize("ru", "Disable Body Yaw", "\208\158\209\130\208\186\208\187\209\142\209\135\208\184\209\130\209\140 \208\180\208\181\209\129\208\184\208\189\208\186");
        ui.localize("ru", "Edge Hidden Yaw", "\208\154\209\128\208\176\208\185\208\189\208\184\208\185 \209\129\208\186\209\128\209\139\209\130\209\139\208\185 \209\131\208\179\208\190\208\187");
        ui.localize("ru", "\239\148\133  Safe Head", "\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\239\148\133  \aDEFAULT\208\147\208\190\208\187\208\190\208\178\208\176 \208\178 \208\177\208\181\208\183\208\190\208\191\208\176\209\129\208\189\208\190\209\129\209\130\208\184");
        ui.localize("ru", "Hidden Anti Aim", "\208\161\208\186\209\128\209\139\209\130\209\139\208\181 \209\131\208\179\208\187\209\139");
        ui.localize("ru", "Pitch", "\208\146\208\181\209\128\209\130\208\184\208\186\208\176\208\187\209\140\208\189\209\139\208\185");
        ui.localize("ru", "Offset\194\160", "\208\161\208\188\208\181\209\137\208\181\208\189\208\184\208\181\194\160");
        ui.localize("ru", "Yaw", "\208\147\208\190\209\128\208\184\208\183\208\190\208\189\209\130\208\176\208\187\209\140\208\189\209\139\208\185");
        ui.localize("ru", "Offset", "\208\161\208\188\208\181\209\137\208\181\208\189\208\184\208\181");
        ui.localize("ru", "Sideways", "\208\145\208\190\208\186\208\190\208\178\208\190\208\185");
        ui.localize("ru", "Random", "\208\160\208\176\208\189\208\180\208\190\208\188\208\184\208\183\208\176\209\134\208\184\209\143");
        ui.localize("ru", "Custom", "\208\159\208\190\208\187\209\140\208\183\208\190\208\178\208\176\209\130\208\181\208\187\209\140\209\129\208\186\208\184\208\185");
        ui.localize("ru", "Automatic", "\208\144\208\178\209\130\208\190\208\188\208\176\209\130\208\184\209\135\208\181\209\129\208\186\208\184\208\185");
        ui.localize("ru", "Switch", "\208\159\208\181\209\128\208\181\208\186\208\187\209\142\209\135\208\176\209\142\209\137\208\184\208\185\209\129\209\143");
        ui.localize("ru", "Delay", "\208\151\208\176\208\180\208\181\209\128\208\182\208\186\208\176");
        ui.localize("ru", "Offset #1", "\208\161\208\188\208\181\209\137\208\181\208\189\208\184\208\181 #1");
        ui.localize("ru", "Offset #2", "\208\161\208\188\208\181\209\137\208\181\208\189\208\184\208\181 #2");
        ui.localize("ru", "\194\187  \240\159\152\142  Automatic Mode", "\194\187  \240\159\152\142  \208\144\208\178\209\130\208\190\208\188\208\176\209\130\208\184\209\135\208\181\209\129\208\186\208\184\208\185 \209\128\208\181\208\182\208\184\208\188");
        ui.localize("ru", "\194\187  \240\159\155\160\239\184\143  Conditional", "\194\187  \240\159\155\160\239\184\143  \208\163\209\129\208\187\208\190\208\178\208\189\209\139\208\185 \209\128\208\181\208\182\208\184\208\188");
        ui.localize("ru", "\240\159\152\142  Automatic Mode", "\240\159\152\142  \208\144\208\178\209\130\208\190\208\188\208\176\209\130\208\184\209\135\208\181\209\129\208\186\208\184\208\185 \209\128\208\181\208\182\208\184\208\188");
        ui.localize("ru", "\240\159\155\160\239\184\143  Conditional", "\240\159\155\160\239\184\143  \208\163\209\129\208\187\208\190\208\178\208\189\209\139\208\185 \209\128\208\181\208\182\208\184\208\188");
        ui.localize("ru", "\239\129\144  Force Break LC", "\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\239\129\144  \aDEFAULT\208\159\209\128\208\184\208\189\209\131\208\180\208\184\209\130\208\181\208\187\209\140\208\189\208\176\209\143 \209\128\208\176\208\177\208\190\209\130\208\176 \208\187\208\176\208\179 \209\141\208\186\209\129\208\191\208\187\208\190\208\184\209\130\208\176");
        ui.localize("ru", "Standing", "\208\161\209\130\208\190\208\185\208\186\208\176");
        ui.localize("ru", "Slow Walking", "\208\156\208\181\208\180\208\187\208\181\208\189\208\189\208\176\209\143 \209\133\208\190\208\180\209\140\208\177\208\176");
        ui.localize("ru", "In Air & Crouching", "\208\146 \208\178\208\190\208\183\208\180\209\131\209\133\208\181 \208\191\209\128\208\184 \209\129\208\186\209\128\209\131\209\135\208\184\208\178\208\176\208\189\208\184\208\184");
        ui.localize("ru", "No Exploits", "\208\145\208\181\208\183 \209\141\208\186\209\129\208\191\208\187\208\190\208\184\209\130\208\190\208\178");
        ui.localize("ru", "On Use", "\208\157\208\176 \208\191\209\128\208\184\208\188\208\181\208\189\208\181\208\189\208\184\208\181");
        ui.localize("ru", "\239\130\132  Hidden Anti Aim", "\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\239\130\132  \aDEFAULT\208\161\208\186\209\128\209\139\209\130\209\139\208\181 \209\131\208\179\208\187\209\139");
        ui.localize("ru", "Current State", "\208\162\208\181\208\186\209\131\209\137\208\181\208\181 \209\131\209\129\208\187\208\190\208\178\208\184\208\181");
        ui.localize("ru", "Pitch\194\160", "\208\146\208\181\209\128\209\130\208\184\208\186\208\176\208\187\209\140\208\189\209\139\208\185\194\160");
        ui.localize("ru", "Yaw\194\160", "\208\147\208\190\209\128\208\184\208\183\208\190\208\189\209\130\208\176\208\187\209\140\208\189\209\139\208\185\194\160");
        ui.localize("ru", "Offset #2\194\160", "\208\161\208\188\208\181\209\137\208\181\208\189\208\184\208\181 #2\194\160");
        ui.localize("ru", "Delay\194\160", "\208\151\208\176\208\180\208\181\209\128\208\182\208\186\208\176\194\160");
        ui.localize("ru", "Pitch\194\160\194\160", "\208\146\208\181\209\128\209\130\208\184\208\186\208\176\208\187\209\140\208\189\209\139\208\185\194\160\194\160");
        ui.localize("ru", "Yaw\194\160\194\160", "\208\147\208\190\209\128\208\184\208\183\208\190\208\189\209\130\208\176\208\187\209\140\208\189\209\139\208\185\194\160\194\160");
        ui.localize("ru", "Offset #2\194\160\194\160", "\208\161\208\188\208\181\209\137\208\181\208\189\208\184\208\181 #2\194\160\194\160");
        ui.localize("ru", "Delay\194\160\194\160", "\208\151\208\176\208\180\208\181\209\128\208\182\208\186\208\176\194\160\194\160");
        ui.localize("ru", "Offset\194\160\194\160", "\208\161\208\188\208\181\209\137\208\181\208\189\208\184\208\181\194\160\194\160");
        ui.localize("ru", "Pitch\194\160\194\160\194\160", "\208\146\208\181\209\128\209\130\208\184\208\186\208\176\208\187\209\140\208\189\209\139\208\185\194\160\194\160\194\160");
        ui.localize("ru", "Yaw\194\160\194\160\194\160", "\208\147\208\190\209\128\208\184\208\183\208\190\208\189\209\130\208\176\208\187\209\140\208\189\209\139\208\185\194\160\194\160\194\160");
        ui.localize("ru", "Offset #2\194\160\194\160\194\160", "\208\161\208\188\208\181\209\137\208\181\208\189\208\184\208\181 #2\194\160\194\160\194\160");
        ui.localize("ru", "Delay\194\160\194\160\194\160", "\208\151\208\176\208\180\208\181\209\128\208\182\208\186\208\176\194\160\194\160\194\160");
        ui.localize("ru", "Offset\194\160\194\160\194\160", "\208\161\208\188\208\181\209\137\208\181\208\189\208\184\208\181\194\160\194\160\194\160");
        ui.localize("ru", "Pitch\194\160\194\160\194\160\194\160", "\208\146\208\181\209\128\209\130\208\184\208\186\208\176\208\187\209\140\208\189\209\139\208\185\194\160\194\160\194\160\194\160");
        ui.localize("ru", "Yaw\194\160\194\160\194\160\194\160", "\208\147\208\190\209\128\208\184\208\183\208\190\208\189\209\130\208\176\208\187\209\140\208\189\209\139\208\185\194\160\194\160\194\160\194\160");
        ui.localize("ru", "Offset #2\194\160\194\160\194\160\194\160", "\208\161\208\188\208\181\209\137\208\181\208\189\208\184\208\181 #2\194\160\194\160\194\160\194\160");
        ui.localize("ru", "Delay\194\160\194\160\194\160\194\160", "\208\151\208\176\208\180\208\181\209\128\208\182\208\186\208\176\194\160\194\160\194\160\194\160");
        ui.localize("ru", "Offset\194\160\194\160\194\160\194\160", "\208\161\208\188\208\181\209\137\208\181\208\189\208\184\208\181\194\160\194\160\194\160\194\160");
        ui.localize("ru", "Pitch\194\160\194\160\194\160\194\160\194\160", "\208\146\208\181\209\128\209\130\208\184\208\186\208\176\208\187\209\140\208\189\209\139\208\185\194\160\194\160\194\160\194\160\194\160");
        ui.localize("ru", "Yaw\194\160\194\160\194\160\194\160\194\160", "\208\147\208\190\209\128\208\184\208\183\208\190\208\189\209\130\208\176\208\187\209\140\208\189\209\139\208\185\194\160\194\160\194\160\194\160\194\160");
        ui.localize("ru", "Offset #2\194\160\194\160\194\160\194\160\194\160", "\208\161\208\188\208\181\209\137\208\181\208\189\208\184\208\181 #2\194\160\194\160\194\160\194\160\194\160");
        ui.localize("ru", "Delay\194\160\194\160\194\160\194\160\194\160", "\208\151\208\176\208\180\208\181\209\128\208\182\208\186\208\176\194\160\194\160\194\160\194\160\194\160");
        ui.localize("ru", "Offset\194\160\194\160\194\160\194\160\194\160", "\208\161\208\188\208\181\209\137\208\181\208\189\208\184\208\181\194\160\194\160\194\160\194\160\194\160");
        ui.localize("ru", "Pitch\194\160\194\160\194\160\194\160\194\160\194\160", "\208\146\208\181\209\128\209\130\208\184\208\186\208\176\208\187\209\140\208\189\209\139\208\185\194\160\194\160\194\160\194\160\194\160\194\160");
        ui.localize("ru", "Yaw\194\160\194\160\194\160\194\160\194\160\194\160", "\208\147\208\190\209\128\208\184\208\183\208\190\208\189\209\130\208\176\208\187\209\140\208\189\209\139\208\185\194\160\194\160\194\160\194\160\194\160\194\160");
        ui.localize("ru", "Offset #2\194\160\194\160\194\160\194\160\194\160\194\160", "\208\161\208\188\208\181\209\137\208\181\208\189\208\184\208\181 #2\aFFFFFF00)");
        ui.localize("ru", "Delay\194\160\194\160\194\160\194\160\194\160\194\160", "\208\151\208\176\208\180\208\181\209\128\208\182\208\186\208\176\194\160\194\160\194\160\194\160\194\160\194\160");
        ui.localize("ru", "Offset\194\160\194\160\194\160\194\160\194\160\194\160", "\208\161\208\188\208\181\209\137\208\181\208\189\208\184\208\181\194\160\194\160\194\160\194\160\194\160\194\160");
        ui.localize("ru", "Pitch\194\160\194\160\194\160\194\160\194\160\194\160\194\160", "\208\146\208\181\209\128\209\130\208\184\208\186\208\176\208\187\209\140\208\189\209\139\208\185\194\160\194\160\194\160\194\160\194\160\194\160\194\160");
        ui.localize("ru", "Yaw\194\160\194\160\194\160\194\160\194\160\194\160\194\160", "\208\147\208\190\209\128\208\184\208\183\208\190\208\189\209\130\208\176\208\187\209\140\208\189\209\139\208\185\194\160\194\160\194\160\194\160\194\160\194\160\194\160");
        ui.localize("ru", "Offset #2\194\160\194\160\194\160\194\160\194\160\194\160\194\160", "\208\161\208\188\208\181\209\137\208\181\208\189\208\184\208\181 #2\aFFFFFF00))");
        ui.localize("ru", "Delay\194\160\194\160\194\160\194\160\194\160\194\160\194\160", "\208\151\208\176\208\180\208\181\209\128\208\182\208\186\208\176\194\160\194\160\194\160\194\160\194\160\194\160\194\160");
        ui.localize("ru", "Offset\194\160\194\160\194\160\194\160\194\160\194\160\194\160", "\208\161\208\188\208\181\209\137\208\181\208\189\208\184\208\181\194\160\194\160\194\160\194\160\194\160\194\160\194\160");
        ui.localize("ru", "You are using automatic mode.\nEverything basic is already set up. Enjoy!", "\208\146\209\139 \208\184\209\129\208\191\208\190\208\187\209\140\208\183\209\131\208\181\209\130\208\181 \208\176\208\178\209\130\208\190\208\188\208\176\209\130\208\184\209\135\208\181\209\129\208\186\208\184\208\185 \209\128\208\181\208\182\208\184\208\188.\n\208\146\209\129\208\181 \208\190\209\129\208\189\208\190\208\178\208\189\208\190\208\181 \209\131\208\182\208\181 \208\189\208\176\209\129\209\130\209\128\208\190\208\181\208\189\208\190.");
        ui.localize("ru", "\239\159\128  Current State", "\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\239\159\128  \aDEFAULT\208\162\208\181\208\186\209\131\209\137\208\181\208\181 \209\131\209\129\208\187\208\190\208\178\208\184\208\181");
        ui.localize("ru", "\239\147\188  Bombsite Fix", "\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\239\147\188  \aDEFAULT\208\152\209\129\208\191\209\128\208\176\208\178\208\187\208\181\208\189\208\184\209\143 \209\129 \208\177\208\190\208\188\208\177\208\190\208\185");
        ui.localize("ru", "\238\144\166  Override Standing", "\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\238\144\166  \aDEFAULT\208\159\208\181\209\128\208\181\208\190\208\191\209\128\208\181\208\180\208\181\208\187\208\184\209\130\209\140 \209\129\209\130\208\190\208\185\208\186\209\131");
        ui.localize("ru", "\238\144\166  Override Moving", "\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\238\144\166  \aDEFAULT\208\159\208\181\209\128\208\181\208\190\208\191\209\128\208\181\208\180\208\181\208\187\208\184\209\130\209\140 \208\191\208\181\209\128\208\181\208\188\208\181\209\137\208\181\208\189\208\184\208\181");
        ui.localize("ru", "\238\144\166  Override Slow Walking", "\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\238\144\166  \aDEFAULT\208\159\208\181\209\128\208\181\208\190\208\191\209\128\208\181\208\180\208\181\208\187\208\184\209\130\209\140 \208\188\208\181\208\180\208\187\208\181\208\189\208\189\209\131\209\142 \209\133\208\190\208\180\209\140\208\177\209\131");
        ui.localize("ru", "\238\144\166  Override Crouching", "\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\238\144\166  \aDEFAULT\208\159\208\181\209\128\208\181\208\190\208\191\209\128\208\181\208\180\208\181\208\187\208\184\209\130\209\140 \209\129\208\186\209\128\209\131\209\135\208\184\208\178\208\176\208\189\208\184\208\181");
        ui.localize("ru", "\238\144\166  Override In Air", "\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\238\144\166  \aDEFAULT\208\159\208\181\209\128\208\181\208\190\208\191\209\128\208\181\208\180\208\181\208\187\208\184\209\130\209\140 \208\178 \208\178\208\190\208\183\208\180\209\131\209\133\208\181");
        ui.localize("ru", "\238\144\166  Override In Air & Crouching", "\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\238\144\166  \aDEFAULT\208\159\208\181\209\128\208\181\208\190\208\191\209\128\208\181\208\180\208\181\208\187\208\184\209\130\209\140 \208\178 \208\178\208\190\208\183\208\180\209\131\209\133\208\181 \208\191\209\128\208\184 \209\129\208\186\209\128\209\131\209\135\208\184\208\178\208\176\208\189\208\184\208\184");
        ui.localize("ru", "\238\144\166  Override No Exploits", "\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\238\144\166  \aDEFAULT\208\159\208\181\209\128\208\181\208\190\208\191\209\128\208\181\208\180\208\181\208\187\208\184\209\130\209\140 \208\177\208\181\208\183 \209\141\208\186\209\129\208\191\208\187\208\190\208\184\209\130\208\190\208\178");
        ui.localize("ru", "\238\144\166  Override On Use", "\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\238\144\166  \aDEFAULT\208\159\208\181\209\128\208\181\208\190\208\191\209\128\208\181\208\180\208\181\208\187\208\184\209\130\209\140 \208\191\209\128\208\184 \208\191\209\128\208\184\208\188\208\181\208\189\208\181\208\189\208\184\208\184");
        ui.localize("ru", "\239\129\144  Force Break LC\194\160", "\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\239\129\144  \aDEFAULT\208\159\209\128\208\184\208\189\209\131\208\180\208\184\209\130\208\181\208\187\209\140\208\189\208\176\209\143 \209\128\208\176\208\177\208\190\209\130\208\176 \208\187\208\176\208\179 \209\141\208\186\209\129\208\191\208\187\208\190\208\184\209\130\208\176\194\160");
        ui.localize("ru", "\239\129\144  Force Break LC\194\160\194\160", "\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\239\129\144  \aDEFAULT\208\159\209\128\208\184\208\189\209\131\208\180\208\184\209\130\208\181\208\187\209\140\208\189\208\176\209\143 \209\128\208\176\208\177\208\190\209\130\208\176 \208\187\208\176\208\179 \209\141\208\186\209\129\208\191\208\187\208\190\208\184\209\130\208\176\194\160\194\160");
        ui.localize("ru", "\239\129\144  Force Break LC\194\160\194\160\194\160", "\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\239\129\144  \aDEFAULT\208\159\209\128\208\184\208\189\209\131\208\180\208\184\209\130\208\181\208\187\209\140\208\189\208\176\209\143 \209\128\208\176\208\177\208\190\209\130\208\176 \208\187\208\176\208\179 \209\141\208\186\209\129\208\191\208\187\208\190\208\184\209\130\208\176\194\160\194\160\194\160");
        ui.localize("ru", "\239\129\144  Force Break LC\194\160\194\160\194\160\194\160", "\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\239\129\144  \aDEFAULT\208\159\209\128\208\184\208\189\209\131\208\180\208\184\209\130\208\181\208\187\209\140\208\189\208\176\209\143 \209\128\208\176\208\177\208\190\209\130\208\176 \208\187\208\176\208\179 \209\141\208\186\209\129\208\191\208\187\208\190\208\184\209\130\208\176\194\160\194\160\194\160\194\160");
        ui.localize("ru", "\239\129\144  Force Break LC\194\160\194\160\194\160\194\160\194\160", "\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\239\129\144  \aDEFAULT\208\159\209\128\208\184\208\189\209\131\208\180\208\184\209\130\208\181\208\187\209\140\208\189\208\176\209\143 \209\128\208\176\208\177\208\190\209\130\208\176 \208\187\208\176\208\179 \209\141\208\186\209\129\208\191\208\187\208\190\208\184\209\130\208\176\194\160\194\160\194\160\194\160\194\160");
        ui.localize("ru", "\239\129\144  Force Break LC\194\160\194\160\194\160\194\160\194\160\194\160", "\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\239\129\144  \aDEFAULT\208\159\209\128\208\184\208\189\209\131\208\180\208\184\209\130\208\181\208\187\209\140\208\189\208\176\209\143 \209\128\208\176\208\177\208\190\209\130\208\176 \208\187\208\176\208\179 \209\141\208\186\209\129\208\191\208\187\208\190\208\184\209\130\208\176\194\160\194\160\194\160\194\160\194\160\194\160");
        ui.localize("ru", "\239\129\144  Force Break LC\194\160\194\160\194\160\194\160\194\160\194\160\194\160", "\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\239\129\144  \aDEFAULT\208\159\209\128\208\184\208\189\209\131\208\180\208\184\209\130\208\181\208\187\209\140\208\189\208\176\209\143 \209\128\208\176\208\177\208\190\209\130\208\176 \208\187\208\176\208\179 \209\141\208\186\209\129\208\191\208\187\208\190\208\184\209\130\208\176\194\160\194\160\194\160\194\160\194\160\194\160\194\160");
        ui.localize("ru", "\239\129\144  Force Break LC\194\160\194\160\194\160\194\160\194\160\194\160\194\160\194\160\194\160", "\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\239\129\144  \aDEFAULT\208\159\209\128\208\184\208\189\209\131\208\180\208\184\209\130\208\181\208\187\209\140\208\189\208\176\209\143 \209\128\208\176\208\177\208\190\209\130\208\176 \208\187\208\176\208\179 \209\141\208\186\209\129\208\191\208\187\208\190\208\184\209\130\208\176\194\160\194\160\194\160\194\160\194\160\194\160\194\160\194\160\194\160");
        ui.localize("ru", "\238\130\153  Pitch", "\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\238\130\153  \aDEFAULT\208\146\208\181\209\128\209\130\208\184\208\186\208\176\208\187\209\140\208\189\209\139\208\185");
        ui.localize("ru", "Down", "\208\146\208\189\208\184\208\183");
        ui.localize("ru", "Fake Down", "\208\164\208\181\208\185\208\186 \208\146\208\189\208\184\208\183");
        ui.localize("ru", "Fake Up", "\208\164\208\181\208\185\208\186 \208\146\208\178\208\181\209\128\209\133");
        ui.localize("ru", "\239\136\157  Yaw", "\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\239\136\157  \aDEFAULT\208\147\208\190\209\128\208\184\208\183\208\190\208\189\209\130\208\176\208\187\209\140\208\189\209\139\208\185");
        ui.localize("ru", "Base", "\208\158\209\129\208\189\208\190\208\178\208\176");
        ui.localize("ru", "Local View", "\208\158\208\177\208\183\208\190\209\128");
        ui.localize("ru", "At Target", "\208\157\208\176 \209\134\208\181\208\187\209\140");
        ui.localize("ru", "Left Offset", "\208\155\208\181\208\178\208\190\208\181 \209\129\208\188\208\181\209\137\208\181\208\189\208\184\208\181");
        ui.localize("ru", "Right Offset", "\208\159\209\128\208\176\208\178\208\190\208\181 \209\129\208\188\208\181\209\137\208\181\208\189\208\184\208\181");
        ui.localize("ru", "Randomize", "\208\160\208\176\208\189\208\180\208\190\208\188\208\184\208\183\208\176\209\134\208\184\209\143");
        ui.localize("ru", "\238\146\188  Yaw Modifier", "\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\238\146\188  \aDEFAULT\208\154\208\190\208\187\208\181\208\177\208\176\208\189\208\184\208\181 \208\179\208\190\209\128\208\184\208\183\208\190\208\189\209\130\208\176\208\187\209\140\208\189\208\190\208\179\208\190 \209\131\208\179\208\187\208\176");
        ui.localize("ru", "Center", "\208\166\208\181\208\189\209\130\209\128");
        ui.localize("ru", "Spin", "\208\154\209\128\209\131\209\135\208\181\208\189\208\184\208\181");
        ui.localize("ru", "3-Way", "3-\208\163\208\179\208\187\208\176");
        ui.localize("ru", "5-Way", "5-\208\163\208\179\208\187\208\190\208\178");
        ui.localize("ru", "\238\130\133  Body Yaw", "\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\238\130\133  \aDEFAULT\208\148\208\181\209\129\208\184\208\189\208\186");
        ui.localize("ru", "Inverter", "\208\152\208\189\208\178\208\181\209\128\209\130\208\181\209\128");
        ui.localize("ru", "Left Limit", "\208\155\208\181\208\178\209\139\208\185 \208\187\208\184\208\188\208\184\209\130");
        ui.localize("ru", "Right Limit", "\208\159\209\128\208\176\208\178\209\139\208\185 \208\187\208\184\208\188\208\184\209\130");
        ui.localize("ru", "Options", "\208\158\208\191\209\134\208\184\208\184");
        ui.localize("ru", "Off", "\208\158\209\130\208\186\208\187.");
        ui.localize("ru", "Peek Fake", "\208\159\208\184\208\186 \209\132\208\181\208\185\208\186\208\190\208\188");
        ui.localize("ru", "Peek Real", "\208\159\208\184\208\186 \209\128\208\181\208\176\208\187\208\190\208\188");
        ui.localize("ru", "Avoid Overlap", "\208\152\208\183\208\177\208\181\208\179\208\176\208\189\208\184\208\181 \208\189\208\176\208\187\208\190\208\182\208\181\208\189\208\184\209\143");
        ui.localize("ru", "Jitter", "\208\154\208\190\208\187\208\181\208\177\208\176\208\189\208\184\208\181");
        ui.localize("ru", "Randomize Jitter", "\208\160\208\176\208\189\208\180\208\190\208\188\208\184\208\183\208\176\209\134\208\184\209\143 \208\186\208\190\208\187\208\181\208\177\208\176\208\189\208\184\208\185");
        ui.localize("ru", "Anti Bruteforce", "\208\144\208\189\209\130\208\184-\208\177\209\128\209\131\209\130\209\132\208\190\209\128\209\129");
        ui.localize("ru", "\238\130\140  Extended Angles", "\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\238\130\140  \aDEFAULT\208\160\208\176\209\129\209\136\208\184\209\128\208\181\208\189\208\184\208\181 \209\131\208\179\208\187\208\190\208\178");
        ui.localize("ru", "Extended Pitch", "\208\146\208\181\209\128\209\130\208\184\208\186\208\176\208\187\209\140\208\189\209\139\208\185");
        ui.localize("ru", "Extended Roll", "\208\145\208\190\208\186\208\190\208\178\208\190\208\185");
        ui.localize("ru", "\239\129\155  Better Scope Overlay", "\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\239\129\155  \aDEFAULT\208\163\208\187\209\131\209\135\209\136\208\181\208\189\208\189\209\139\208\185 \208\190\208\178\208\181\209\128\208\187\208\181\208\185 \208\191\209\128\208\184\209\134\208\181\208\187\208\176");
        ui.localize("ru", "Line", "\208\155\208\184\208\189\208\184\209\143");
        ui.localize("ru", "Gap", "\208\159\209\128\208\190\208\177\208\181\208\187");
        ui.localize("ru", "Exclude Lines", "\208\152\209\129\208\186\208\187\209\142\209\135\208\184\209\130\209\140 \208\187\208\184\208\189\208\184\208\184");
        ui.localize("ru", "Left\194\160", "\208\161\208\187\208\181\208\178\208\176");
        ui.localize("ru", "Top\194\160", "\208\161\208\178\208\181\209\128\209\133\209\131");
        ui.localize("ru", "Right\194\160", "\208\161\208\191\209\128\208\176\208\178\208\176");
        ui.localize("ru", "Bottom\194\160", "\208\161\208\189\208\184\208\183\209\131");
        ui.localize("ru", "Inaccuracy", "\208\157\208\181\209\130\208\190\209\135\208\189\208\190\209\129\209\130\209\140");
        ui.localize("ru", "\239\153\129  Crosshair Indicators", "\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\239\153\129  \aDEFAULT\208\152\208\189\208\180\208\184\208\186\208\176\209\130\208\190\209\128\209\139 \208\191\208\190\208\180 \208\191\209\128\208\184\209\134\208\181\208\187\208\190\208\188");
        ui.localize("ru", "\238\144\156  Damage Indicator", "\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\238\144\156  \aDEFAULT\208\152\208\189\208\180\208\184\208\186\208\176\209\130\208\190\209\128 \209\131\209\128\208\190\208\189\208\176");
        ui.localize("ru", "Disable Animation", "\208\146\209\139\208\186\208\187\209\142\209\135\208\184\209\130\209\140 \208\176\208\189\208\184\208\188\208\176\209\134\208\184\209\142");
        ui.localize("ru", "\239\151\189  GameSense Indicators", "\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\239\151\189  \aDEFAULT\208\152\208\189\208\180\208\184\208\186\208\176\209\130\208\190\209\128\209\139 \208\184\208\183 \aEAEAEAFFGame\a95B806FFSense");
        ui.localize("ru", "Force Body Aim", "\208\159\209\128\208\184\208\189\209\131\208\182\208\180. \208\177\208\190\208\180\208\184 \208\176\208\184\208\188");
        ui.localize("ru", "Force Safe Points", "\208\159\209\128\208\184\208\189\209\131\208\182\208\180. \208\177\208\181\208\183\208\190\208\191\208\176\209\129\208\189\209\139\208\181 \209\130\208\190\209\135\208\186\208\184");
        ui.localize("ru", "Hit Chance", "\208\168\208\176\208\189\209\129 \208\191\208\190\208\191\208\176\208\180\208\176\208\189\208\184\209\143");
        ui.localize("ru", "Spectators", "\208\151\209\128\208\184\209\130\208\181\208\187\208\184");
        ui.localize("ru", "Fake Latency", "\208\164\208\181\208\185\208\186 \208\191\208\184\208\189\208\179");
        ui.localize("ru", "Aimbot Stats", "\208\161\209\130\208\176\209\130\208\184\209\129\209\130\208\184\208\186\208\176 \208\176\208\184\208\188\208\177\208\190\209\130\208\176");
        ui.localize("ru", "Hide Shots", "\208\165\208\176\208\185\208\180\209\136\208\190\209\130\209\129");
        ui.localize("ru", "Double Tap", "\208\148\208\176\208\177\208\187\209\130\208\176\208\191");
        ui.localize("ru", "Fake Duck", "\208\164\208\181\208\185\208\186\208\190\208\178\208\190\208\181 \208\191\209\128\208\184\209\129\208\181\208\180\208\176\208\189\208\184\208\181");
        ui.localize("ru", "Freestanding", "\208\144\208\178\209\130\208\190 \209\128\208\176\208\183\208\178\208\190\209\128\208\190\209\130");
        ui.localize("ru", "Minimum Damage", "\208\156\208\184\208\189\208\184\208\188\208\176\208\187\209\140\208\189\209\139\208\185 \209\131\209\128\208\190\208\189");
        ui.localize("ru", "Bomb Information", "\208\152\208\189\209\132\208\190\209\128\208\188\208\176\209\134\208\184\209\143 \208\190 \208\177\208\190\208\188\208\177\208\181");
        ui.localize("ru", "\239\130\142  Manual Arrows", "\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\239\130\142  \aDEFAULT\208\152\208\189\208\180\208\184\208\186\208\176\209\130\208\190\209\128\209\139 \208\188\208\176\208\189\209\131\208\176\208\187\208\190\208\178");
        ui.localize("ru", "Alternative Arrows", "\208\144\208\187\209\140\209\130\208\181\209\128\208\189\208\176\209\130\208\184\208\178\208\189\209\139\208\181 \208\184\208\189\208\180\208\184\208\186\208\176\209\130\208\190\209\128\209\139");
        ui.localize("ru", "\238\149\135  Velocity Warning", "\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\238\149\135  \aDEFAULT\208\159\209\128\208\181\208\180\209\131\208\191\209\128\208\181\208\182\208\180\208\181\208\189\208\184\208\181 \208\190 \209\129\208\189\208\184\208\182\208\181\208\189\208\184\208\184 \209\129\208\186\208\190\209\128\208\190\209\129\209\130\208\184");
        ui.localize("ru", "\239\131\129  Keep Model Transparency", "\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\239\131\129  \aDEFAULT\208\159\208\190\208\180\208\180\208\181\209\128\208\182\208\184\208\178\208\176\209\130\209\140 \208\191\209\128\208\190\208\183\209\128\208\176\209\135\208\189\208\190\209\129\209\130\209\140 \208\188\208\190\208\180\208\181\208\187\208\184");
        ui.localize("ru", "\239\148\176  Aspect Ratio", "\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\239\148\176  \aDEFAULT\208\161\208\190\208\190\209\130\208\189\208\190\209\136\208\181\208\189\208\184\208\181 \209\129\209\130\208\190\209\128\208\190\208\189");
        ui.localize("ru", "\238\149\145  Animation Breakers", "\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\238\149\145  \aDEFAULT\208\146\208\184\208\183\209\131\208\176\208\187\209\140\208\189\209\139\208\181 \208\176\208\189\208\184\208\188\208\176\209\134\208\184\208\184");
        ui.localize("ru", "Legs Breaker", "\208\144\208\189\208\184\208\188\208\176\209\134\208\184\209\143 \208\189\208\190\208\179");
        ui.localize("ru", "Legs in Air", "\208\144\208\189\208\184\208\188\208\176\209\134\208\184\209\143 \208\189\208\190\208\179 \208\178 \208\178\208\190\208\183\208\180\209\131\209\133\208\181");
        ui.localize("ru", "Disabled", "\208\158\209\130\208\186\208\187\209\142\209\135\208\181\208\189\208\190");
        ui.localize("ru", "Static", "\208\161\209\130\208\176\209\130\208\184\208\186");
        ui.localize("ru", "Walking", "\208\165\208\190\208\180\209\140\208\177\208\176");
        ui.localize("ru", "Sliding Elements", "\208\173\208\187\208\181\208\188\208\181\208\189\209\130\209\139 \209\129\208\186\208\190\208\187\209\140\208\182\208\181\208\189\208\184\209\143");
        ui.localize("ru", "Moving", "\208\159\208\181\209\128\208\181\208\188\208\181\209\137\208\181\208\189\208\184\208\181");
        ui.localize("ru", "Crouching", "\208\161\208\186\209\128\209\131\209\135\208\184\208\178\208\176\208\189\208\184\208\181");
        ui.localize("ru", "Move Lean Force", "\208\161\209\130\208\181\208\191\208\181\208\189\209\140 \208\189\208\176\208\186\208\187\208\190\208\189\208\176 \208\188\208\190\208\180\208\181\208\187\208\184");
        ui.localize("ru", "Landing Pitch", "\208\157\208\176\208\186\208\187\208\190\208\189 \208\179\208\190\208\187\208\190\208\178\209\139 \208\191\209\128\208\184 \208\191\209\128\208\184\208\183\208\181\208\188\208\187\208\181\208\189\208\184\208\184");
        ui.localize("ru", "\238\134\168  Viewmodel", "\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\238\134\168  \aDEFAULT\208\160\208\176\209\129\208\191\208\190\208\187\208\190\208\182\208\181\208\189\208\184\208\181 \209\128\209\131\208\186");
        ui.localize("ru", "Field of View", "\208\163\208\179\208\190\208\187 \208\190\208\177\208\183\208\190\209\128\208\176");
        ui.localize("ru", "Offset X", "\208\161\208\188\208\181\209\137\208\181\208\189\208\184\208\181 X");
        ui.localize("ru", "Offset Y", "\208\161\208\188\208\181\209\137\208\181\208\189\208\184\208\181 Y");
        ui.localize("ru", "Offset Z", "\208\161\208\188\208\181\209\137\208\181\208\189\208\184\208\181 Z");
        ui.localize("ru", "Opposite Knife Hand", "\208\159\209\128\208\190\209\130\208\184\208\178\208\190\208\191\208\190\208\187\208\190\208\182\208\189\208\176\209\143 \209\128\209\131\208\186\208\176 \209\129 \208\189\208\190\208\182\208\190\208\188");
        ui.localize("ru", "\239\139\170  Reset", "\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\239\139\170\a" .. color(ui.get_style("Active Text").r, ui.get_style("Active Text").g, ui.get_style("Active Text").b, 255):to_hex() .. "  \208\161\208\177\209\128\208\190\209\129");
        ui.localize("ru", "\239\132\161  VGUI Modulation", "\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\239\132\161  \aDEFAULT\208\156\208\190\208\180\209\131\208\187\209\143\209\134\208\184\209\143 \208\184\208\189\209\130\208\181\209\128\209\132\208\181\208\185\209\129\208\176");
        ui.localize("ru", "\239\139\162  Unmute Silenced Players", "\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\239\139\162  \aDEFAULT\208\160\208\176\208\183\208\177\208\187\208\190\208\186\208\184\209\128\208\190\208\178\208\176\209\130\209\140 \208\188\208\190\208\187\209\135\208\176\209\137\208\184\209\133 \208\184\208\179\209\128\208\190\208\186\208\190\208\178");
        ui.localize("ru", "\238\138\158  Taskbar Notification", "\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\238\138\158  \aDEFAULT\208\163\208\178\208\181\208\180\208\190\208\188\208\187\208\181\208\189\208\184\208\181 \208\189\208\176 \208\191\208\176\208\189\208\181\208\187\208\184 \208\183\208\176\208\180\208\176\209\135");
        ui.localize("ru", "\239\128\172  Clan Tag", "\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\239\128\172  \aDEFAULT\208\154\208\187\208\176\208\189\209\130\208\181\208\179");
        ui.localize("ru", "\239\130\156  Unlock Fake Latency", "\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\239\130\156  \aDEFAULT\208\160\208\176\208\183\208\177\208\187\208\190\208\186\208\184\209\128\208\190\208\178\208\176\209\130\209\140 \209\132\208\181\208\185\208\186 \208\191\208\184\208\189\208\179");
        ui.localize("ru", "\239\151\133  Fast Ladder Move", "\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\239\151\133  \aDEFAULT\208\145\209\139\209\129\209\130\209\128\208\190\208\181 \208\191\208\181\209\128\208\181\208\188\208\181\209\137\208\181\208\189\208\184\208\181 \208\191\208\190 \208\187\208\181\209\129\209\130\208\189\208\184\209\134\208\181");
        ui.localize("ru", "\238\149\134  No Fall Damage", "\a" .. color(ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255):to_hex() .. "\238\149\134  \aDEFAULT\208\158\209\130\209\129\209\131\209\130\209\129\209\130\208\178\208\184\208\181 \209\131\209\128\208\190\208\189\208\176 \208\191\209\128\208\184 \208\191\208\176\208\180\208\181\208\189\208\184\208\184");
        ui.localize("ru", "Turns off air strafe when you don't move.", "\208\158\209\130\208\186\208\187\209\142\209\135\208\176\208\181\209\130 \209\129\209\130\209\128\208\181\208\185\209\132\208\181\209\128, \208\186\208\190\208\179\208\180\208\176 \208\178\209\139 \208\189\208\181 \208\180\208\178\208\184\208\179\208\176\208\181\209\130\208\181\209\129\209\140.");
        ui.localize("ru", "Forces specific animations on the player. Client-side only.", "\208\159\209\128\208\184\208\189\209\131\208\182\208\180\208\181\208\189\208\184\208\181 \208\184\208\179\209\128\208\190\208\186\208\176 \208\186 \208\190\208\191\209\128\208\181\208\180\208\181\208\187\208\181\208\189\208\189\209\139\208\188 \208\176\208\189\208\184\208\188\208\176\209\134\208\184\209\143\208\188.");
        ui.localize("ru", "Enables the playback of the animation of legs.", "\208\146\208\186\208\187\209\142\209\135\208\176\208\181\209\130 \208\178\208\190\209\129\208\191\209\128\208\190\208\184\208\183\208\178\208\181\208\180\208\181\208\189\208\184\208\181 \208\176\208\189\208\184\208\188\208\176\209\134\208\184\208\184 \208\189\208\190\208\179.");
        ui.localize("ru", "Enables the playback of the animation of legs in air.", "\208\146\208\186\208\187\209\142\209\135\208\176\208\181\209\130 \208\178\208\190\209\129\208\191\209\128\208\190\208\184\208\183\208\178\208\181\208\180\208\181\208\189\208\184\208\181 \208\176\208\189\208\184\208\188\208\176\209\134\208\184\208\184 \208\189\208\190\208\179 \208\178 \208\178\208\190\208\183\208\180\209\131\209\133\208\181.");
        ui.localize("ru", "Enables the playback of the sliding animation in different states.", "\208\146\208\186\208\187\209\142\209\135\208\176\208\181\209\130 \208\178\208\190\209\129\208\191\209\128\208\190\208\184\208\183\208\178\208\181\208\180\208\181\208\189\208\184\208\181 \208\176\208\189\208\184\208\188\208\176\209\134\208\184\208\184 \209\129\208\186\208\190\208\187\209\140\208\182\208\181\208\189\208\184\209\143 \208\178 \209\128\208\176\208\183\208\187\208\184\209\135\208\189\209\139\209\133 \209\129\208\190\209\129\209\130\208\190\209\143\208\189\208\184\209\143\209\133.");
        ui.localize("ru", "Enables the playback of the moving lean animation from the 12th animation layer.", "\208\146\208\186\208\187\209\142\209\135\208\176\208\181\209\130 \208\178\208\190\209\129\208\191\209\128\208\190\208\184\208\183\208\178\208\181\208\180\208\181\208\189\208\184\208\181 \208\176\208\189\208\184\208\188\208\176\209\134\208\184\208\184 \208\189\208\176\208\186\208\187\208\190\208\189\208\176 \208\188\208\190\208\180\208\181\208\187\208\184 \208\184\208\183 12-\208\179\208\190 \209\129\208\187\208\190\209\143 \208\176\208\189\208\184\208\188\208\176\209\134\208\184\208\184.");
        ui.localize("ru", "Makes the pitch angle appear to be zero degrees during playback of the landing animation.", "\208\159\209\128\208\184 \208\178\208\190\209\129\208\191\209\128\208\190\208\184\208\183\208\178\208\181\208\180\208\181\208\189\208\184\208\184 \208\176\208\189\208\184\208\188\208\176\209\134\208\184\208\184 \208\191\209\128\208\184\208\183\208\181\208\188\208\187\208\181\208\189\208\184\209\143 \208\178\208\181\209\128\209\130\208\184\208\186\208\176\208\187\209\140\208\189\209\139\208\185 \209\131\208\179\208\190\208\187 \209\129\209\130\208\176\208\189\208\190\208\178\208\184\209\130\209\129\209\143 \209\128\208\176\208\178\208\189\209\139\208\188 \208\189\209\131\208\187\209\142 \208\179\209\128\208\176\208\180\209\131\209\129\208\190\208\178.");
        ui.localize("ru", "If you're tabbed out, the game icon will flash if the new round started so that you don't miss it.", "\208\149\209\129\208\187\208\184 \208\178\209\139 \208\190\209\130\208\186\208\187\209\142\209\135\208\184\208\187\208\184\209\129\209\140 \208\190\209\130 \209\141\208\186\209\128\208\176\208\189\208\176, \208\183\208\189\208\176\209\135\208\190\208\186 \208\184\208\179\209\128\209\139 \208\177\209\131\208\180\208\181\209\130 \208\188\208\184\208\179\208\176\209\130\209\140, \208\181\209\129\208\187\208\184 \208\189\208\176\209\135\208\176\208\187\209\129\209\143 \208\189\208\190\208\178\209\139\208\185 \209\128\208\176\209\131\208\189\208\180, \209\135\209\130\208\190\208\177\209\139 \208\178\209\139 \208\189\208\181 \208\191\209\128\208\190\208\191\209\131\209\129\209\130\208\184\208\187\208\184 \208\181\208\179\208\190.");
        ui.localize("ru", "Allows you to climb ladders faster.", "\208\159\208\190\208\183\208\178\208\190\208\187\209\143\208\181\209\130 \208\177\209\139\209\129\209\130\209\128\208\181\208\181 \208\191\208\190\208\180\208\189\208\184\208\188\208\176\209\130\209\140\209\129\209\143 \208\191\208\190 \208\187\208\181\209\129\209\130\208\189\208\184\209\134\208\176\208\188.");
        ui.localize("ru", "Attempts to perform a jumpbug when possible.", "\208\159\209\139\209\130\208\176\208\181\209\130\209\129\209\143 \208\178\209\139\208\191\208\190\208\187\208\189\208\184\209\130\209\140 \208\191\209\128\209\139\208\182\208\190\208\186 \209\129 \208\177\208\176\208\179\208\190\208\188, \208\186\208\190\208\179\208\180\208\176 \209\141\209\130\208\190 \208\178\208\190\208\183\208\188\208\190\208\182\208\189\208\190.");
    end;
end);
events.render:set(function()
    -- upvalues: v5 (ref)
    local v274 = render.screen_size();
    if v274 ~= screen_size then
        v5.setup(v274);
    end;
    v5.better_scope_overlay_main();
    v5.clan_tag_main();
    v5.velocity_warning_main:update();
    v5.skeet_indicators_main();
    v5.crosshair_indicators_main();
    v5.manual_arrows_main();
    v5.opposite_knife_hand_main();
end);
events.post_render:set(function()
    -- upvalues: v3 (ref), v5 (ref)
    v3.enabled_anti_aim:override(true);
    v3.enabled_anti_aim:disabled(true);
    v3.pitch:disabled(true);
    v3.yaw:disabled(true);
    v3.yaw_modifier:disabled(true);
    v3.body_yaw:disabled(true);
    v3.freestanding:disabled(true);
    v3.extended_angles:disabled(true);
    if v3.illumination:get() == "Bright" then
        cvar.cl_foot_contact_shadows:int(0);
    else
        cvar.cl_foot_contact_shadows:int(1);
    end;
    if v5.aimbot_logs:get() then
        v3.log_events:override("");
    else
        v3.log_events:override();
    end;
    if globals.is_connected == false then
        v5.count = 0;
        v5.hit = 0;
    end;
    if entity.get_local_player() ~= nil and entity.get_local_player():get_player_weapon() ~= nil then
        if entity.get_local_player():get_player_weapon():get_weapon_index() == 64 then
            v5.reset_delay = 0.3;
        elseif entity.get_local_player():get_player_weapon():get_weapon_index() == 9 or entity.get_local_player():get_player_weapon():get_weapon_index() == 40 then
            v5.reset_delay = 0.2;
        else
            v5.reset_delay = 0.1;
        end;
    end;
    if v5.dormant_aimbot:get() then
        v5.dormant_aimbot_shot = false;
    end;
end);
events.post_update_clientside_animation:set(function()
    -- upvalues: v5 (ref)
    v5.animation_breakers_main();
end);
events.createmove:set(function(v275)
    -- upvalues: v46 (ref), v5 (ref)
    v46.defensive_active();
    v5.hit_chance_main();
    v5.discharge_exploit_main();
    v5.dormant_aimbot_main(v275);
    v5.air_lag_exploit_main(v275);
    v5.anti_aim_main(v275);
    v5.edge_yaw_main(v275);
    v5.disable_air_strafe_main(v275);
    if (v275.in_use == true or v275.in_attack == true) and entity.get_local_player():get_player_weapon() ~= nil and entity.get_local_player():get_player_weapon():get_classname() == "CC4" then
        if entity.get_local_player().m_bInBombZone and (v275.in_jump == true or bit.band(entity.get_local_player().m_fFlags, 1) == 0) then
            v275.in_use = false;
            v275.in_attack = false;
        else
            v275.in_attack = true;
        end;
    end;
end);
events.createmove_run:set(function()
    -- upvalues: v5 (ref)
    v5.no_fall_damage_main();
end);
events.localplayer_transparency:set(function(v276)
    -- upvalues: v5 (ref), v3 (ref)
    if v5.keep_model_transparency:get() == false or v3.transparency:get("In Scope") == false then
        return;
    else
        if entity.get_local_player().m_bIsScoped then
            keep_model_transparency = v276;
        end;
        if entity.get_local_player().m_bResumeZoom then
            return keep_model_transparency;
        else
            return;
        end;
    end;
end);
events.aim_ack:set(function(v277)
    -- upvalues: v5 (ref)
    v5.logs_on_aim_ack_main(v277);
    if v5.skeet_indicators:get() and v5.skeet_indicators_selection:get("Aimbot Stats") then
        v5.count = v5.count + 1;
        if v277.state == nil then
            v5.hit = v5.hit + 1;
        end;
    end;
end);
events.item_purchase:set(function(v278)
    -- upvalues: v5 (ref)
    v5.logs_on_item_purchase_main(v278);
end);
events.player_hurt:set(function(v279)
    -- upvalues: v5 (ref)
    v5.logs_on_player_hurt_main(v279);
end);
events.level_init:set(function()
    -- upvalues: v5 (ref)
    utils.execute_after(5, v5.unmute_silenced_players_main);
end);
events.player_connect_full:set(function()
    -- upvalues: v5 (ref)
    v5.unmute_silenced_players_main();
end);
events.player_spawned:set(function(v280)
    -- upvalues: v5 (ref)
    local v281 = entity.get(v280.userid, true);
    if v281 == nil then
        return;
    else
        if entity.get_game_rules().m_bWarmupPeriod == true and v281 == entity.get_local_player() then
            v5.count = 0;
            v5.hit = 0;
        end;
        return;
    end;
end);
events.round_freeze_end:set(function()
    -- upvalues: v5 (ref)
    v5.reset = true;
end);
events.round_start:set(function()
    -- upvalues: v5 (ref)
    v5.icon_notification_main();
    v5.planting = false;
    v5.planting_site = nil;
    v5.bomb_exploded = false;
    if entity.get_game_rules().m_totalRoundsPlayed == 0 or entity.get_game_rules().m_bWarmupPeriod == true then
        v5.count = 0;
        v5.hit = 0;
    end;
    if v5.dormant_aimbot:get() then
        v5.round_started = globals.tickcount + (cvar.mp_freezetime:float() + 1) / globals.tickinterval;
    end;
end);
events.bomb_abortplant:set(function()
    -- upvalues: v5 (ref)
    v5.planting = false;
    v5.planting_site = nil;
end);
events.bomb_planted:set(function()
    -- upvalues: v5 (ref)
    v5.planting = false;
    v5.planting_site = nil;
end);
events.bomb_beginplant:set(function(v282)
    -- upvalues: v5 (ref)
    local v283 = entity.get(v282.userid, true);
    if v283 == nil then
        return;
    else
        v5.planting_state = v283 == entity.get_local_player();
        v5.planting = true;
        v5.planting_time = globals.curtime;
        v5.planting_site = v283:get_origin():dist(entity.get_local_player():get_resource().m_bombsiteCenterA) < v283:get_origin():dist(entity.get_local_player():get_resource().m_bombsiteCenterB) and "       A" or "       B";
        return;
    end;
end);
events.bomb_exploded:set(function()
    -- upvalues: v5 (ref)
    v5.bomb_exploded = true;
end);
events.shutdown:set(function()
    -- upvalues: v3 (ref), v5 (ref)
    v3.enabled_anti_aim:override();
    v3.pitch:override();
    v3.yaw:override();
    v3.yaw_base:override();
    v3.yaw_offset:override();
    v3.yaw_avoid_backstab:override();
    v3.yaw_hidden:override();
    v3.yaw_modifier:override();
    v3.yaw_modifier_offset:override();
    v3.body_yaw:override();
    v3.body_yaw_inverter:override();
    v3.body_yaw_left_limit:override();
    v3.body_yaw_right_limit:override();
    v3.body_yaw_options:override();
    v3.body_yaw_freestanding:override();
    v3.extended_angles:override();
    v3.extended_pitch:override();
    v3.extended_roll:override();
    v3.freestanding:override();
    v3.freestanding_disable_yaw_modifiers:override();
    v3.freestanding_body:override();
    v3.dormant_aimbot:override();
    v3.options:override();
    v3.lag_options:override();
    v3.leg_movement:override();
    v3.log_events:override();
    v3.auto_scope:override();
    v3.hit_chance:override();
    v3.scope_overlay:override();
    v3.clan_tag:override();
    if v5.console_modulation:get() then
        v5.console_color_change(color(255, 255, 255, 255));
    end;
    if v5.viewmodel:get() then
        cvar.viewmodel_fov:float(v5.viewmodel_fov_cache);
        cvar.viewmodel_offset_x:float(v5.viewmodel_offset_x_cache);
        cvar.viewmodel_offset_y:float(v5.viewmodel_offset_y_cache);
        cvar.viewmodel_offset_z:float(v5.viewmodel_offset_z_cache);
        if v5.viewmodel_cache ~= nil then
            cvar.cl_righthand:float(v5.viewmodel_cache);
        else
            cvar.cl_righthand:float(1);
        end;
    end;
    if v5.aspect_ratio:get() ~= 100 then
        cvar.r_aspectratio:float(0);
    end;
    if v5.clan_tag:get() then
        if clan_tag_cache ~= nil then
            common.set_clan_tag(clan_tag_cache);
        else
            common.set_clan_tag("\000");
        end;
    end;
    if v5.unlock_fake_latency then
        cvar.sv_maxunlag:float(0.2);
    end;
    cvar.cl_foot_contact_shadows:int(1);
end);