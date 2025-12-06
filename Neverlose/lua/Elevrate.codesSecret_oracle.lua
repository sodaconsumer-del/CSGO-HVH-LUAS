ffi.cdef("    typedef int(__fastcall* clantag_t)(const char*, const char*);\n\n    typedef void*(__thiscall* get_client_entity_t)(void*, int);\n\n    typedef struct\n    {\n        float x;\n        float y;\n        float z;\n    } Vector_t;\n    \n    typedef struct {\n        char  pad_0000[20];\n        int m_nOrder; //0x0014\n        int m_nSequence; //0x0018\n        float m_flPrevCycle; //0x001C\n        float m_flWeight; //0x0020\n        float m_flWeightDeltaRate; //0x0024\n        float m_flPlaybackRate; //0x0028\n        float m_flCycle; //0x002C\n        void *m_pOwner; //0x0030\n        char  pad_0038[4]; //0x0034\n    } CAnimationLayer;\n\n    typedef struct\n    {\n        char    pad0[0x60]; // 0x00\n        void* pEntity; // 0x60\n        void* pActiveWeapon; // 0x64\n        void* pLastActiveWeapon; // 0x68\n        float        flLastUpdateTime; // 0x6C\n        int            iLastUpdateFrame; // 0x70\n        float        flLastUpdateIncrement; // 0x74\n        float        flEyeYaw; // 0x78\n        float        flEyePitch; // 0x7C\n        float        flGoalFeetYaw; // 0x80\n        float        flLastFeetYaw; // 0x84\n        float        flMoveYaw; // 0x88\n        float        flLastMoveYaw; // 0x8C // changes when moving/jumping/hitting ground\n        float        flLeanAmount; // 0x90\n        char         pad1[0x4]; // 0x94\n        float        flFeetCycle; // 0x98 0 to 1\n        float        flMoveWeight; // 0x9C 0 to 1\n        float        flMoveWeightSmoothed; // 0xA0\n        float        flDuckAmount; // 0xA4\n        float        flHitGroundCycle; // 0xA8\n        float        flRecrouchWeight; // 0xAC\n        Vector_t        vecOrigin; // 0xB0\n        Vector_t        vecLastOrigin;// 0xBC\n        Vector_t        vecVelocity; // 0xC8\n        Vector_t        vecVelocityNormalized; // 0xD4\n        Vector_t        vecVelocityNormalizedNonZero; // 0xE0\n        float        flVelocityLenght2D; // 0xEC\n        float        flJumpFallVelocity; // 0xF0\n        float        flSpeedNormalized; // 0xF4 // clamped velocity from 0 to 1\n        float        flRunningSpeed; // 0xF8\n        float        flDuckingSpeed; // 0xFC\n        float        flDurationMoving; // 0x100\n        float        flDurationStill; // 0x104\n        bool        bOnGround; // 0x108\n        bool        bHitGroundAnimation; // 0x109\n        char    pad2[0x2]; // 0x10A\n        float        flNextLowerBodyYawUpdateTime; // 0x10C\n        float        flDurationInAir; // 0x110\n        float        flLeftGroundHeight; // 0x114\n        float        flHitGroundWeight; // 0x118 // from 0 to 1, is 1 when standing\n        float        flWalkToRunTransition; // 0x11C // from 0 to 1, doesnt change when walking or crouching, only running\n        char    pad3[0x4]; // 0x120\n        float        flAffectedFraction; // 0x124 // affected while jumping and running, or when just jumping, 0 to 1\n        char    pad4[0x208]; // 0x128\n        float        flMinBodyYaw; // 0x330\n        float        flMaxBodyYaw; // 0x334\n        float        flMinPitch; //0x338\n        float        flMaxPitch; // 0x33C\n        int            iAnimsetVersion; // 0x340\n    } CCSGOPlayerAnimationState_534535_t;\n");
local function v1(v0)
    return math.floor(v0 * 100) / 100;
end;
local function v7(v2, v3, v4, v5)
    -- upvalues: v1 (ref)
    local v6 = 144 / (1 / globals.frametime);
    if v2 then
        if v3 ~= v4 then
            v3 = v3 + (v4 + 5 - v3) * v5 * v6;
        else
            v3 = v4;
        end;
    elseif v3 > 0 then
        v3 = v3 - v3 * v5 * v6;
    else
        v3 = 0;
    end;
    return v1(v3);
end;
local function v9(v8)
    return "" .. ("\a%02x%02x%02x"):format(v8.r, v8.g, v8.b);
end;
local l_base64_0 = require("neverlose/base64");
local l_clipboard_0 = require("neverlose/clipboard");
local l_hook_0 = require("neverlose/vmt_hook");
local l_system_0 = require("neverlose/drag_system");
local v14 = {};
local v15 = {};
local _ = {};
local v17 = {};
local v18 = {};
local v19 = {};
local v20 = {};
local v21 = {};
local v22 = {};
local v23 = {};
local function v40(v24, v25, v26, v27, v28, v29, v30, v31, v32)
    local v33 = "";
    local v34 = #v32 - 1;
    local v35 = (v28 - v24) / v34;
    local v36 = (v29 - v25) / v34;
    local v37 = (v30 - v26) / v34;
    local v38 = (v31 - v27) / v34;
    for v39 = 1, v34 + 1 do
        v33 = v33 .. ("\a%02x%02x%02x%02x%s"):format(v24, v25, v26, v27, v32:sub(v39, v39));
        v24 = v24 + v35;
        v25 = v25 + v36;
        v26 = v26 + v37;
        v27 = v27 + v38;
    end;
    return v33;
end;
v17.client_dll = "client.dll";
v17.bind_argument = function(v41, v42)
    return function(...)
        -- upvalues: v41 (ref), v42 (ref)
        return v41(v42, ...);
    end;
end;
v17.entity_list_003 = ffi.cast(ffi.typeof("uintptr_t**"), utils.create_interface(v17.client_dll, "VClientEntityList003"));
v17.get_entity_address = v17.bind_argument(ffi.cast("get_client_entity_t", v17.entity_list_003[0][3]), v17.entity_list_003);
local v43 = {
    disabled = "\a404750FF", 
    yellow = "\aFFED3AFF", 
    green = "\aA0FF7AFF", 
    default = "\aDEFAULT", 
    main = "\a2A80FEFF"
};
local v44 = {
    pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"), 
    yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"), 
    yaw_base = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"), 
    yaw_offset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"), 
    avoid_backstab = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab"), 
    hidden = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden"), 
    yaw_modifier = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"), 
    modifier_offset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"), 
    body_yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"), 
    inventer = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"), 
    left_limit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"), 
    right_limit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"), 
    options = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"), 
    body_yaw_freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding"), 
    freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"), 
    disable_yaw_modifiers = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Disable Yaw Modifiers"), 
    body_freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Body Freestanding"), 
    slow_walk = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"), 
    doubletap = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"), 
    hideshots = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"), 
    bodyaim = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim"), 
    safepoint = ui.find("Aimbot", "Ragebot", "Safety", "Safe Points"), 
    damage = ui.find("Aimbot", "Ragebot", "Selection", "SSG-08", "Min. Damage"), 
    dormant_aimbot = ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot"), 
    fake_latency = ui.find("Miscellaneous", "Main", "Other", "Fake Latency"), 
    airstrafe = ui.find("Miscellaneous", "Main", "Movement", "Air Strafe"), 
    fakelag = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Enabled"), 
    fakelag_limit = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Limit"), 
    fakelag_v = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Variability")
};
local v45 = {
    lua = {
        name = "Elevrate", 
        last_update = "09.08.2023", 
        build = "Secret", 
        version = "1.0"
    }, 
    cheat = {
        user = common.get_username()
    }
};
v19.watermark_size = function()
    -- upvalues: v45 (ref)
    local _ = entity.get_local_player();
    local v47 = globals.is_connected and math.floor(utils.net_channel().latency[1] * 1000) or 0;
    local _ = string.format(v47);
    return (render.measure_text(1, nil, "     Elevrate.Codes \226\136\153 " .. v45.lua.build .. " \226\136\153 " .. v45.cheat.user .. "  "));
end;
local _ = {
    disabled = v43.disabled .. ui.get_icon("lock-keyhole"), 
    secret = v43.main .. ui.get_icon("lock-keyhole-open") .. v43.default .. "   Available from " .. v43.main .. "Elevate Secret", 
    nightly = v43.main .. ui.get_icon("lock-keyhole-open") .. v43.default .. "   Available from " .. v43.main .. "Elevate Nightly"
};
local v50 = {
    main = ui.get_icon("feather-pointed"), 
    home = ui.get_icon("folder-minus"), 
    antihit = ui.get_icon("shield"), 
    share = ui.get_icon("file-circle-plus"), 
    import = ui.get_icon("file-circle-check"), 
    default = ui.get_icon("floppy-disk"), 
    neverlose = ui.get_icon("toggle-on"), 
    discord = ui.get_icon("users"), 
    telegram = ui.get_icon("telegram"), 
    youtube = ui.get_icon("youtube"), 
    preset_load = ui.get_icon("file-circle-plus"), 
    preset_save = ui.get_icon("file-circle-check"), 
    preset_import = ui.get_icon("file-import"), 
    preset_export = ui.get_icon("file-export"), 
    antihit_main = ui.get_icon("shield"), 
    anithit_constructor = ui.get_icon("user-shield"), 
    anithit_presets = ui.get_icon("pen-to-square"), 
    antihit_antibrute = ui.get_icon("rotate-right"), 
    other_ragebot = ui.get_icon("swords"), 
    other_visuals = ui.get_icon("sparkles"), 
    other_misc = ui.get_icon("gear")
};
ui.sidebar(v40(42, 128, 254, 255, 255, 255, 255, 255, "Elevrate [ Secret ]"), v43.main .. v50.main);
local v51 = {
    home = {
        main = ui.create(" Home", "Main"), 
        config = ui.create(" Home", "Config", 2), 
        also = ui.create(" Home", "Verify", 2)
    }, 
    antihit = {
        main = ui.create(v43.main .. v50.antihit, v43.main .. v50.antihit_main .. v43.default .. " Main"), 
        constructor = ui.create(v43.main .. v50.antihit, v43.main .. v50.anithit_constructor .. v43.default .. " Builder"), 
        preset_manager = ui.create(v43.main .. v50.antihit, v43.main .. v50.anithit_presets .. v43.default .. " Preset Manager"), 
        antibruteforce = ui.create(v43.main .. v50.antihit, v43.main .. v50.antihit_antibrute .. v43.default .. " Anti-Bruteforce")
    }, 
    other = {
        ragebot = ui.create("Other", v43.main .. ui.get_icon("bow-arrow") .. v43.default .. "  Ragebot"), 
        visuals = ui.create("Other", v43.main .. ui.get_icon("sparkles") .. v43.default .. "  Indication"), 
        misc = ui.create("Other", v43.main .. ui.get_icon("dice") .. v43.default .. "  Misc"), 
        helpers = ui.create("Other", v43.main .. ui.get_icon("user-gear") .. v43.default .. "  Helpers")
    }
};
v14.picture = v51.home.also:label(" " .. v43.main .. "How to verify in our discord" .. v43.default .. "\n 1. Join our discord\n 2. Open channel #tickets\n 3. Create ticket \n 4. Send a screenshot with the purchase");
v14.welcome = v51.home.main:label("Glad to see you, " .. v43.main .. v45.cheat.user .. v43.default .. "\nBuild: " .. v43.main .. v45.lua.build .. v43.default .. "\nVersion: " .. v43.main .. v45.lua.version .. v43.default .. "\nLast Update: " .. v43.main .. v45.lua.last_update);
v14.neverlose_config = v51.home.main:button("                " .. v43.main .. v50.neverlose .. v43.default .. " Author Neverlose Config" .. "             ", function()
    panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://neverlose.cc/market/item?id=g0nrLG&edit=1");
end, true);
v14.discord = v51.home.main:button(v43.main .. v50.discord .. v43.default .. " Our Discord Community", function()
    panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://discord.gg/elevrate");
end, true);
v14.youtube = v51.home.main:button(v43.main .. v50.youtube .. v43.default .. " Youtube ", function()
    panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://www.youtube.com/channel/UCvRqCiKGLO4Wn3QWUUodn-Q");
end, true);
v14.nade_throw_fix = v51.other.ragebot:switch("Nade Throw Fix");
v14.auto_teleport = v51.other.ragebot:switch(v43.main .. "Auto Teleport"):tooltip(v43.yellow .. ui.get_icon("circle-exclamation") .. v43.default .. "   This feature is under development");
v14.auto_teleport_tab = v14.auto_teleport:create();
v14.auto_teleport_delay = v14.auto_teleport_tab:slider("Delay", 0, 20, 0, 1, " Tick");
v14.auto_teleport_force_recharge = v14.auto_teleport_tab:switch("Force Recharge");
v14.round_start_notify = v51.other.helpers:switch("Round Start Notify");
v14.super_toss = v51.other.helpers:switch(v43.main .. "Accurate Nade Throw"):tooltip(v43.yellow .. ui.get_icon("circle-exclamation") .. v43.default .. "   If you use grenade helper, turn off this function");
v14.jump_scout = v51.other.helpers:switch("Jump Scout");
v14.local_player_angles = v51.other.helpers:switch("Player Angles");
v14.local_player_angles_tab = v14.local_player_angles:create();
v14.local_player_angles_fake = v14.local_player_angles_tab:color_picker("Fake");
v14.local_player_angles_real = v14.local_player_angles_tab:color_picker("Real");
v14.no_scope_mode = v51.other.ragebot:switch("No Scope Mode");
v14.no_scope_mode_tab = v14.no_scope_mode:create();
v14.no_scope_mode_scout = v14.no_scope_mode_tab:slider("Scout Hit Chance", 0, 100, 0);
v14.no_scope_mode_awp = v14.no_scope_mode_tab:slider("AWP Hit Chance", 0, 100, 0);
v14.no_scope_mode_auto = v14.no_scope_mode_tab:slider("Auto Hit Chance", 0, 100, 0);
v14.air_mode = v51.other.ragebot:switch("In-Air Mode");
v14.air_mode_tab = v14.air_mode:create();
v14.air_mode_scout = v14.air_mode_tab:slider("Scout Hit Chance", 0, 100, 0);
v14.air_mode_awp = v14.air_mode_tab:slider("AWP Hit Chance", 0, 100, 0);
v14.air_mode_auto = v14.air_mode_tab:slider("Auto Hit Chance", 0, 100, 0);
v14.air_mode_r8 = v14.air_mode_tab:slider("R8 Hit Chance", 0, 100, 0);
v14.air_mode_deagle = v14.air_mode_tab:slider("Deagle Hit Chance", 0, 100, 0);
v14.debug_panel = v51.other.visuals:switch("Watermark", true);
v14.debug_panel_tab = v14.debug_panel:create();
v14.debug_panel_glow_color = v14.debug_panel_tab:color_picker("Glow Color");
v14.debug_panel_x = v14.debug_panel_tab:slider("X", 1, render.screen_size().x, render.screen_size().x - v19.watermark_size().x);
v14.debug_panel_y = v14.debug_panel_tab:slider("Y", 1, render.screen_size().y, render.screen_size().y - render.screen_size().y);
v14.velocity_indication = v51.other.visuals:switch("Velocity Indication");
v14.velocity_indication_tab = v14.velocity_indication:create();
v14.velocity_indication_color = v14.velocity_indication_tab:color_picker("Color");
v14.velocity_x = v14.velocity_indication_tab:slider("X", 1, render.screen_size().x, render.screen_size().x / 2 - render.screen_size().x / 15 / 2);
v14.velocity_y = v14.velocity_indication_tab:slider("Y", 1, render.screen_size().y, render.screen_size().y / 3.2);
v14.crosshair_indication = v51.other.visuals:switch("Crosshair Indication");
v14.crosshair_indication_tab = v14.crosshair_indication:create();
v14.crosshair_indication_main_color = v14.crosshair_indication_tab:color_picker("Main Color");
v14.crosshair_indication_addative_color = v14.crosshair_indication_tab:color_picker("Addative Color");
v14.indication500 = v51.other.visuals:switch(v43.green .. "GameSense" .. v43.default .. " Indication");
v14.kibit_min_damage = v51.other.visuals:switch("Damage Indication");
v14.kibit_min_damage_tab = v14.kibit_min_damage:create();
v14.kibit_min_damage_color = v14.kibit_min_damage_tab:color_picker("Color");
v14.custom_scope = v51.other.visuals:switch("Custom Scope Overlay");
v14.custom_scope_tab = v14.custom_scope:create();
v14.custom_scope_color = v14.custom_scope_tab:color_picker("Color");
v14.custom_scope_gap = v14.custom_scope_tab:slider("Gap", 0, 500, 0);
v14.custom_scope_size = v14.custom_scope_tab:slider("Size", 0, 500, 0);
v14.hitmarker = v51.other.visuals:switch("Custom Hit Marker");
v14.hitmarker_tab = v14.hitmarker:create();
v14.hitmarker_font = v14.hitmarker_tab:slider("Font", 1, 4, 0);
v14.hitmarker_type = v14.hitmarker_tab:combo("Hit Marker Type", {
    [1] = "Text", 
    [2] = "Icon"
});
v14.hitmarker_text = v14.hitmarker_tab:input("Marker");
v14.hitmarker_color = v14.hitmarker_tab:color_picker("Color");
v14.greande_radius = v51.other.visuals:switch("Nade Radius");
v14.greande_radius_tab = v14.greande_radius:create();
v14.enemy_molotov_color = v14.greande_radius_tab:color_picker("Molotov Color");
v14.smoke_color = v14.greande_radius_tab:color_picker("Smoke Color");
v14.hitlable = v14.hitmarker_tab:label(v43.main .. "Example:" .. v43.default .. "\nFont: " .. v43.main .. "1" .. v43.default .. "\nType: " .. v43.main .. "Icon" .. v43.default .. "\nMarker: " .. v43.main .. "heart" .. v43.default .. "\nIcons: " .. v43.main .. "fontawesome.com/icons");
v14.logging = v51.other.misc:switch("Ragebot Logging");
v14.logging_tab = v14.logging:create();
v14.logging_types = v14.logging_tab:selectable("", {
    [1] = "Screen", 
    [2] = "Console"
});
v14.logging_color = v14.logging_tab:color_picker("Shot Color");
v14.logging_color_miss = v14.logging_tab:color_picker("Miss Color");
v14.logging_position = v14.logging_tab:slider("Position", 0, 20, 10);
v14.auto_mute = v51.other.misc:switch("Auto Mute & Unmute");
v14.auto_mute_tab = v14.auto_mute:create();
v14.auto_mute_type = v14.auto_mute_tab:combo("Type", "Mute", "Unmute");
v14.aspect_ratio = v51.other.misc:switch("Aspect Ratio", false);
v14.aspect_ratio_tab = v14.aspect_ratio:create();
v14.aspect_ratio_value = v14.aspect_ratio_tab:slider("Value", 0, 30, 0, 0.1);
v14.custom_viewmodel = v51.other.misc:switch("Custom Viewmodel", false);
v14.custom_viewmodel_tab = v14.custom_viewmodel:create();
v14.custom_viewmodel_fov = v14.custom_viewmodel_tab:slider("Fov", 0, 100, 68);
v14.custom_viewmodel_x = v14.custom_viewmodel_tab:slider("X", -10, 10, 1);
v14.custom_viewmodel_y = v14.custom_viewmodel_tab:slider("Y", -10, 10, 1);
v14.custom_viewmodel_z = v14.custom_viewmodel_tab:slider("Z", -10, 10, -1);
v14.trashtalk = v51.other.misc:switch("Trash Talk");
v14.trashtalk_tab = v14.trashtalk:create();
v14.trashtalk_states = v14.trashtalk_tab:selectable("", {
    [1] = "On Kill", 
    [2] = "On Death"
});
v14.clantag = v51.other.misc:switch("Clan Tag");
v14.config_list = v51.antihit.preset_manager:list("", {
    [1] = "Slot - 1", 
    [2] = "Slot - 2", 
    [3] = "Slot - 3"
});
v14.condition = v51.antihit.constructor:combo("", {
    [1] = "Standing", 
    [2] = "Running", 
    [3] = "Slow Walk", 
    [4] = "Duck", 
    [5] = "Air", 
    [6] = "Air & Duck"
});
v14.yaw_base = v51.antihit.main:combo("Player Yaw Base", {
    [1] = "Local View", 
    [2] = "At Target"
});
v14.freestanding = v51.antihit.main:switch("Freestanding");
v14.freestanding_tab = v14.freestanding:create();
v14.freestanding_dym = v14.freestanding_tab:switch("Disable Yaw Modifiers");
v14.freestanding_bf = v14.freestanding_tab:switch("Body Freestanding");
v14.antiaim_tweaks = v51.antihit.main:selectable("Utility & Exploits", {
    [1] = "Avoid Backstab", 
    [2] = "Force Break LC In-Air", 
    [3] = "Fast Ladder Move"
});
v14.desync_swither = v51.antihit.main:switch("Desync Switcher");
v14.animation_breakers = v51.antihit.main:switch(v43.main .. "Animation Correction");
v14.animation_breakerstab = v14.animation_breakers:create();
v14.air_legs = v14.animation_breakerstab:combo("Legs In-Air", "Default", "Static", "Walk");
v14.ground_legs = v14.animation_breakerstab:combo("Legs On Ground", "Default", "Static", "Walk");
v14.move_lean = v14.animation_breakerstab:switch("Move Lean");
v14.move_lean_effect = v14.animation_breakerstab:slider("Move Lean Effect", 0, 10, 0);
v14.pitch_null = v14.animation_breakerstab:switch("Pitch 0 On Land");
v14.sliding_slow_walk = v14.animation_breakerstab:switch("Sliding Slow Walk");
v14.antibruteforce = v51.antihit.antibruteforce:switch("Enable Anti-Bruteforce");
v14.antibruteforce_modifiers = v51.antihit.antibruteforce:selectable("Modifiers", {
    [1] = "Desync", 
    [2] = "Yaw"
});
v15.state = {
    stand = 0, 
    air_duck = 5, 
    air = 4, 
    duck = 3, 
    slowwalk = 2, 
    move = 1
};
v15.player_state = 0;
v15.game_state = 0;
v15.menu_state = 0;
for v52 = 0, 5 do
    v15[v52] = {};
    v15[v52].pitch = v51.antihit.constructor:combo("Pitch", {
        [1] = "Disabled", 
        [2] = "Down", 
        [3] = "Fake Down", 
        [4] = "Fake Up"
    });
    v15[v52].swap_delay = v51.antihit.constructor:switch("Side Swap Delay");
    v15[v52].swap_delay_tab = v15[v52].swap_delay:create();
    v15[v52].swap_delay_ticks = v15[v52].swap_delay_tab:slider("Delay", 1, 20, 0, 1, " Tick");
    v15[v52].player_side = v51.antihit.constructor:combo("Side", {
        [1] = "Left", 
        [2] = "Right"
    });
    v15[v52].yaw_left = v51.antihit.constructor:combo("Yaw", {
        [1] = "Disabled", 
        [2] = "Static", 
        [3] = "Backward"
    });
    v15[v52].yaw_left_tab = v15[v52].yaw_left:create();
    v15[v52].yaw_offset_left = v15[v52].yaw_left_tab:slider("Yaw Offset", -180, 180, 0, 1, "\194\176");
    v15[v52].yaw_modifier_left = v15[v52].yaw_left_tab:combo("Modifier", {
        [1] = "Disabled", 
        [2] = "Center", 
        [3] = "Offset", 
        [4] = "Random", 
        [5] = "Spin", 
        [6] = "3-Way", 
        [7] = "5-Way"
    });
    v15[v52].yaw_modifier_left_offset = v15[v52].yaw_left_tab:slider("Modifier Offset", -180, 180, 0, 1, "\194\176");
    v15[v52].body_yaw_left = v51.antihit.constructor:switch("Body Yaw");
    v15[v52].body_yaw_left_tab = v15[v52].body_yaw_left:create();
    v15[v52].fake_limit_left = v15[v52].body_yaw_left_tab:slider("Fake Limit", 0, 60, 0, 1, "\194\176");
    v15[v52].options_left = v15[v52].body_yaw_left_tab:selectable("Options", {
        [1] = "Avoid Overlap", 
        [2] = "Jitter", 
        [3] = "Randomize Jitter"
    });
    v15[v52].body_yaw_freestanding_left = v15[v52].body_yaw_left_tab:combo("Freestanding", {
        [1] = "Disabled", 
        [2] = "Peek Fake", 
        [3] = "Peek Real"
    });
    v15[v52].yaw_right = v51.antihit.constructor:combo("Yaw", {
        [1] = "Disabled", 
        [2] = "Static", 
        [3] = "Backward"
    });
    v15[v52].yaw_right_tab = v15[v52].yaw_right:create();
    v15[v52].yaw_offset_right = v15[v52].yaw_right_tab:slider("Yaw Offset", -180, 180, 0, 1, "\194\176");
    v15[v52].yaw_modifier_right = v15[v52].yaw_right_tab:combo("Modifier", {
        [1] = "Disabled", 
        [2] = "Center", 
        [3] = "Offset", 
        [4] = "Random", 
        [5] = "Spin", 
        [6] = "3-Way", 
        [7] = "5-Way"
    });
    v15[v52].yaw_modifier_right_offset = v15[v52].yaw_right_tab:slider("Modifier Offset", -180, 180, 0, 1, "\194\176");
    v15[v52].body_yaw_right = v51.antihit.constructor:switch("Body Yaw");
    v15[v52].body_yaw_right_tab = v15[v52].body_yaw_right:create();
    v15[v52].fake_limit_right = v15[v52].body_yaw_right_tab:slider("Fake Limit", 0, 60, 0, 1, "\194\176");
    v15[v52].options_right = v15[v52].body_yaw_right_tab:selectable("Options", {
        [1] = "Avoid Overlap", 
        [2] = "Jitter", 
        [3] = "Randomize Jitter"
    });
    v15[v52].body_yaw_freestanding_right = v15[v52].body_yaw_right_tab:combo("Freestanding", {
        [1] = "Disabled", 
        [2] = "Peek Fake", 
        [3] = "Peek Real"
    });
    v15[v52].defensive = v51.antihit.constructor:switch("Defensive AA");
    v15[v52].defensivetab = v15[v52].defensive:create();
    v15[v52].defensive_pitch_left = v15[v52].defensivetab:slider("Pitch", -89, 89, 0, 1, "\194\176");
    v15[v52].defensive_pitch_right = v15[v52].defensivetab:slider("Pitch", -89, 89, 0, 1, "\194\176");
    v15[v52].defensive_offset_left = v15[v52].defensivetab:slider("Yaw Offset", -180, 180, 0, 1, "\194\176");
    v15[v52].defensive_offset_right = v15[v52].defensivetab:slider("Yaw Offset", -180, 180, 0, 1, "\194\176");
    v15[v52].fakelags = v51.antihit.constructor:switch("Fake Lag");
    v15[v52].fakelags_tab = v15[v52].fakelags:create();
    v15[v52].fakelags_ticks = v15[v52].fakelags_tab:slider("Limit", 0, 14, 0);
    v15[v52].fakelags_v = v15[v52].fakelags_tab:slider("Veriability", 0, 100, 0, 1, "%");
end;
v15.get_state = function(v53)
    -- upvalues: v15 (ref)
    local v54 = entity.get_local_player();
    if not v54 then
        return;
    else
        local l_m_fFlags_0 = v54.m_fFlags;
        local v56 = bit.band(l_m_fFlags_0, bit.lshift(1, 0)) ~= 0;
        local l_in_jump_0 = v53.in_jump;
        local v58 = bit.band(l_m_fFlags_0, bit.lshift(1, 1)) ~= 0 or ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"):get();
        local v59 = v54.m_vecVelocity:length() < 2;
        local v60 = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"):get();
        if v58 and (l_in_jump_0 or not v56) then
            v15.player_state = v15.state.air_duck;
            v15.game_state = 5;
            return;
        elseif (l_in_jump_0 or not v56) and not v58 then
            v15.player_state = v15.state.air;
            v15.game_state = 4;
            return;
        elseif v60 then
            v15.player_state = v15.state.slowwalk;
            v15.game_state = 2;
            return;
        elseif not v58 and v59 and not l_in_jump_0 then
            v15.player_state = v15.state.stand;
            v15.game_state = 0;
            return;
        elseif v58 and not l_in_jump_0 then
            v15.player_state = v15.state.duck;
            v15.game_state = 3;
            return;
        elseif not v58 and not v59 and not v60 and not l_in_jump_0 then
            v15.player_state = v15.state.move;
            v15.game_state = 1;
            return;
        else
            return;
        end;
    end;
end;
v15.side = false;
v15.swap = false;
v15.side_switcher = function()
    -- upvalues: v15 (ref)
    local v61 = entity.get_local_player();
    if not v61 then
        return;
    elseif globals.choked_commands ~= 0 then
        return;
    else
        if v15[v15.game_state].swap_delay:get() then
            if globals.tickcount % v15[v15.game_state].swap_delay_ticks:get() == v15[v15.game_state].swap_delay_ticks:get() - 1 then
                v15.swap = not v15.swap;
            end;
            rage.antiaim:inverter(v15.swap);
            v15.side = rage.antiaim:inverter();
        else
            v15.side = v61.m_flPoseParameter[11] * 120 - 60 < 0;
        end;
        return;
    end;
end;
v15.yaw = 0;
v15.yaw_offset = 0;
v15.yaw_system = function()
    -- upvalues: v15 (ref), v44 (ref), v14 (ref)
    local _ = entity.get_local_player();
    local v63 = {
        [1] = yaw_offset
    };
    v15.yaw = v15.side and v15[v15.game_state].yaw_left:get() or v15[v15.game_state].yaw_right:get();
    v15.yaw_offset = v15.side and v15[v15.game_state].yaw_offset_left:get() or v15[v15.game_state].yaw_offset_right:get();
    if v15[v15.game_state].defensive:get() then
        v44.hidden:override(true);
        rage.antiaim:override_hidden_yaw_offset(v15.side and v15[v15.game_state].defensive_offset_left:get() or v15[v15.game_state].defensive_offset_right:get());
        rage.antiaim:override_hidden_pitch(v15.side and v15[v15.game_state].defensive_pitch_left:get() or v15[v15.game_state].defensive_pitch_right:get());
    else
        v44.hidden:override(nil);
    end;
    v44.fakelag:override(v15[v15.game_state].fakelags:get());
    v44.fakelag_limit:override(v15[v15.game_state].fakelags_ticks:get());
    v44.fakelag_v:override(v15[v15.game_state].fakelags_v:get());
    v44.pitch:override(v15[v15.game_state].pitch:get());
    v44.yaw:override(v15.yaw);
    v44.yaw_base:override(v14.yaw_base:get());
    v44.avoid_backstab:override(v14.antiaim_tweaks:get("Avoid Backstab"));
    if v14.antibruteforce_modifiers:get("Yaw") then
        local v64 = math.random(0, 5);
        local v65 = math.random(1, 2);
        if v65 == 1 then
            v63.yaw_offset = v15.yaw_offset - v64;
        elseif v65 == 2 then
            v63.yaw_offset = v15.yaw_offset + v64;
        end;
        v44.yaw_offset:override(v63.yaw_offset);
    else
        v44.yaw_offset:override(v15.yaw_offset);
    end;
end;
v15.yaw_modifier = 0;
v15.yaw_modifier_offset = 0;
v15.yaw_modifier_system = function()
    -- upvalues: v15 (ref), v44 (ref)
    local _ = entity.get_local_player();
    v15.yaw_modifier = v15.side and v15[v15.game_state].yaw_modifier_left:get() or v15[v15.game_state].yaw_modifier_right:get();
    v15.yaw_modifier_offset = v15.side and v15[v15.game_state].yaw_modifier_left_offset:get() or v15[v15.game_state].yaw_modifier_right_offset:get();
    v44.yaw_modifier:override(v15.yaw_modifier);
    v44.modifier_offset:override(v15.yaw_modifier_offset);
end;
v15.body_yaw = 0;
v15.fake_limit = 0;
v15.options = 0;
v15.body_yaw_freestanding = 0;
v15.body_yaw_system = function()
    -- upvalues: v15 (ref), v44 (ref), v14 (ref)
    local _ = entity.get_local_player();
    local v68 = {
        [1] = fake_limit
    };
    v15.body_yaw = v15.side and v15[v15.game_state].body_yaw_left:get() or v15[v15.game_state].body_yaw_right:get();
    v15.fake_limit = v15.side and v15[v15.game_state].fake_limit_left:get() or v15[v15.game_state].fake_limit_right:get();
    v15.options = v15.side and v15[v15.game_state].options_left:get() or v15[v15.game_state].options_right:get();
    v15.body_yaw_freestanding = v15.side and v15[v15.game_state].body_yaw_freestanding_left:get() or v15[v15.game_state].body_yaw_freestanding_right:get();
    v44.body_yaw:override(v15.body_yaw);
    v44.options:override(v15.options);
    v44.body_yaw_freestanding:override(v15.body_yaw_freestanding);
    v44.freestanding:override(v14.freestanding:get());
    v44.disable_yaw_modifiers:override(v14.freestanding_dym:get());
    v44.body_freestanding:override(v14.freestanding_bf:get());
    if v14.antibruteforce_modifiers:get("Desync") then
        local v69 = math.random(0, 14);
        v68.fake_limit = v15.fake_limit - v69;
        v44.left_limit:override(v68.fake_limit);
        v44.right_limit:override(v68.fake_limit);
    else
        v44.left_limit:override(v15.fake_limit);
        v44.right_limit:override(v15.fake_limit);
    end;
end;
v15.break_lc_in_air = function()
    -- upvalues: v14 (ref)
    local v70 = entity.get_local_player();
    if bit.band(v70.m_fFlags, 1) == 0 and v14.antiaim_tweaks:get("Force Break LC In-Air") then
        if globals.tickcount % 2 == 0 then
            ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"):override("Always On");
        elseif globals.tickcount % 2 == 1 then
            ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"):override("On Peek");
        end;
    end;
end;
v15.fast_ladder = function(v71)
    -- upvalues: v14 (ref)
    if not v14.antiaim_tweaks:get("Fast Ladder Move") then
        return;
    else
        local v72 = entity.get_local_player();
        if not v72 then
            return;
        elseif v72.m_MoveType ~= 9 then
            return;
        else
            local v73 = {
                [1] = 43, 
                [2] = 44, 
                [3] = 45, 
                [4] = 46, 
                [5] = 47, 
                [6] = 48
            };
            for _, v75 in pairs(v73) do
                if v72:get_player_weapon():get_weapon_index() == v75 then
                    return;
                end;
            end;
            v71.in_moveleft = v71.in_back;
            if v71.sidemove == 0 then
                v71.view_angles.y = v71.view_angles.y + 45;
            end;
            if v71.in_forward and v71.sidemove < 0 then
                v71.view_angles.y = v71.view_angles.y + 90;
            end;
            if v71.in_back and v71.sidemove > 0 then
                v71.view_angles.y = v71.view_angles.y + 90;
            end;
            if v71.view_angles.x < 0 then
                v71.view_angles.x = -45;
            end;
            v71.in_moveright = v71.in_forward;
            return;
        end;
    end;
end;
v15.main = function(v76)
    -- upvalues: v15 (ref)
    if not entity.get_local_player() then
        return;
    else
        v15.side_switcher();
        v15.yaw_system();
        v15.yaw_modifier_system();
        v15.body_yaw_system();
        v15.break_lc_in_air();
        v15.fast_ladder(v76);
        v15.get_state(v76);
        return;
    end;
end;
v15.menu_manager = function()
    -- upvalues: v14 (ref), v15 (ref)
    if v14.condition:get() == "Standing" then
        v15.menu_state = 0;
    end;
    if v14.condition:get() == "Running" then
        v15.menu_state = 1;
    end;
    if v14.condition:get() == "Slow Walk" then
        v15.menu_state = 2;
    end;
    if v14.condition:get() == "Duck" then
        v15.menu_state = 3;
    end;
    if v14.condition:get() == "Air" then
        v15.menu_state = 4;
    end;
    if v14.condition:get() == "Air & Duck" then
        v15.menu_state = 5;
    end;
end;
v15.visible = function()
    -- upvalues: v15 (ref), v14 (ref)
    for _, v78 in pairs(v15[0]) do
        v78:visibility(v14.condition:get() == "Standing");
    end;
    for _, v80 in pairs(v15[1]) do
        v80:visibility(v14.condition:get() == "Running");
    end;
    for _, v82 in pairs(v15[2]) do
        v82:visibility(v14.condition:get() == "Slow Walk");
    end;
    for _, v84 in pairs(v15[3]) do
        v84:visibility(v14.condition:get() == "Duck");
    end;
    for _, v86 in pairs(v15[4]) do
        v86:visibility(v14.condition:get() == "Air");
    end;
    for _, v88 in pairs(v15[5]) do
        v88:visibility(v14.condition:get() == "Air & Duck");
    end;
    v15[v15.menu_state].yaw_left:visibility(false);
    v15[v15.menu_state].yaw_offset_left:visibility(false);
    v15[v15.menu_state].yaw_modifier_left:visibility(false);
    v15[v15.menu_state].yaw_modifier_left_offset:visibility(false);
    v15[v15.menu_state].body_yaw_left:visibility(false);
    v15[v15.menu_state].fake_limit_left:visibility(false);
    v15[v15.menu_state].options_left:visibility(false);
    v15[v15.menu_state].body_yaw_freestanding_left:visibility(false);
    v15[v15.menu_state].yaw_right:visibility(false);
    v15[v15.menu_state].yaw_offset_right:visibility(false);
    v15[v15.menu_state].yaw_modifier_right:visibility(false);
    v15[v15.menu_state].yaw_modifier_right_offset:visibility(false);
    v15[v15.menu_state].body_yaw_right:visibility(false);
    v15[v15.menu_state].fake_limit_right:visibility(false);
    v15[v15.menu_state].options_right:visibility(false);
    v15[v15.menu_state].body_yaw_freestanding_right:visibility(false);
    v15[v15.menu_state].defensive_pitch_left:visibility(false);
    v15[v15.menu_state].defensive_pitch_right:visibility(false);
    v15[v15.menu_state].defensive_offset_left:visibility(false);
    v15[v15.menu_state].defensive_offset_right:visibility(false);
    if v15[v15.menu_state].player_side:get() == "Left" then
        v15[v15.menu_state].yaw_left:visibility(true);
        if v15[v15.menu_state].yaw_left:get() == "Backward" or v15[v15.menu_state].yaw_left:get() == "Static" then
            v15[v15.menu_state].yaw_offset_left:visibility(true);
            v15[v15.menu_state].yaw_modifier_left:visibility(true);
            v15[v15.menu_state].yaw_modifier_left_offset:visibility(true);
        end;
        v15[v15.menu_state].body_yaw_left:visibility(true);
        if v15[v15.menu_state].body_yaw_left:get() then
            v15[v15.menu_state].fake_limit_left:visibility(true);
            v15[v15.menu_state].options_left:visibility(true);
            v15[v15.menu_state].body_yaw_freestanding_left:visibility(true);
        end;
        if v15[v15.menu_state].defensive:get() then
            v15[v15.menu_state].defensive_pitch_left:visibility(true);
            v15[v15.menu_state].defensive_offset_left:visibility(true);
        end;
    elseif v15[v15.menu_state].player_side:get() == "Right" then
        v15[v15.menu_state].yaw_right:visibility(true);
        if v15[v15.menu_state].yaw_right:get() == "Backward" or v15[v15.menu_state].yaw_right:get() == "Static" then
            v15[v15.menu_state].yaw_offset_right:visibility(true);
            v15[v15.menu_state].yaw_modifier_right:visibility(true);
            v15[v15.menu_state].yaw_modifier_right_offset:visibility(true);
        end;
        v15[v15.menu_state].body_yaw_right:visibility(true);
        if v15[v15.menu_state].body_yaw_right:get() then
            v15[v15.menu_state].fake_limit_right:visibility(true);
            v15[v15.menu_state].options_right:visibility(true);
            v15[v15.menu_state].body_yaw_freestanding_right:visibility(true);
        end;
        if v15[v15.menu_state].defensive:get() then
            v15[v15.menu_state].defensive_pitch_right:visibility(true);
            v15[v15.menu_state].defensive_offset_right:visibility(true);
        end;
    end;
    v14.debug_panel_x:visibility(false);
    v14.debug_panel_y:visibility(false);
    v14.velocity_x:visibility(false);
    v14.velocity_y:visibility(false);
    v14.velocity_indication_color:visibility(false);
    if v14.velocity_indication:get() then
        v14.velocity_indication_color:visibility(true);
    end;
    v14.debug_panel_glow_color:visibility(false);
    if v14.debug_panel:get() then
        v14.debug_panel_glow_color:visibility(true);
    end;
    v14.auto_teleport_delay:visibility(false);
    v14.auto_teleport_force_recharge:visibility(false);
    if v14.auto_teleport:get() then
        v14.auto_teleport_delay:visibility(true);
        v14.auto_teleport_force_recharge:visibility(true);
    end;
    v14.local_player_angles_fake:visibility(false);
    v14.local_player_angles_real:visibility(false);
    if v14.local_player_angles:get() then
        v14.local_player_angles_fake:visibility(true);
        v14.local_player_angles_real:visibility(true);
    end;
    v14.no_scope_mode_scout:visibility(false);
    v14.no_scope_mode_awp:visibility(false);
    v14.no_scope_mode_auto:visibility(false);
    if v14.no_scope_mode:get() then
        v14.no_scope_mode_scout:visibility(true);
        v14.no_scope_mode_awp:visibility(true);
        v14.no_scope_mode_auto:visibility(true);
    end;
    v14.air_mode_scout:visibility(false);
    v14.air_mode_awp:visibility(false);
    v14.air_mode_auto:visibility(false);
    v14.air_mode_r8:visibility(false);
    v14.air_mode_deagle:visibility(false);
    if v14.air_mode:get() then
        v14.air_mode_scout:visibility(true);
        v14.air_mode_awp:visibility(true);
        v14.air_mode_auto:visibility(true);
        v14.air_mode_r8:visibility(true);
        v14.air_mode_deagle:visibility(true);
    end;
    v14.crosshair_indication_main_color:visibility(false);
    v14.crosshair_indication_addative_color:visibility(false);
    if v14.crosshair_indication:get() then
        v14.crosshair_indication_main_color:visibility(true);
        v14.crosshair_indication_addative_color:visibility(true);
    end;
    v14.kibit_min_damage_color:visibility(false);
    if v14.kibit_min_damage:get() then
        v14.kibit_min_damage_color:visibility(true);
    end;
    v14.custom_scope_color:visibility(false);
    v14.custom_scope_gap:visibility(false);
    v14.custom_scope_size:visibility(false);
    if v14.custom_scope:get() then
        v14.custom_scope_color:visibility(true);
        v14.custom_scope_gap:visibility(true);
        v14.custom_scope_size:visibility(true);
    end;
    v14.hitmarker_font:visibility(false);
    v14.hitmarker_type:visibility(false);
    v14.hitmarker_text:visibility(false);
    v14.hitmarker_color:visibility(false);
    v14.hitlable:visibility(false);
    if v14.hitmarker:get() then
        v14.hitmarker_font:visibility(true);
        v14.hitmarker_type:visibility(true);
        v14.hitmarker_text:visibility(true);
        v14.hitlable:visibility(true);
        v14.hitmarker_color:visibility(true);
    end;
    v14.logging_types:visibility(false);
    v14.logging_color:visibility(false);
    v14.logging_color_miss:visibility(false);
    v14.logging_position:visibility(false);
    if v14.logging:get() then
        v14.logging_types:visibility(true);
        v14.logging_color:visibility(true);
        v14.logging_color_miss:visibility(true);
        v14.logging_position:visibility(true);
    end;
    v14.aspect_ratio_value:visibility(false);
    if v14.aspect_ratio:get() then
        v14.aspect_ratio_value:visibility(true);
    end;
    v14.custom_viewmodel_fov:visibility(false);
    v14.custom_viewmodel_x:visibility(false);
    v14.custom_viewmodel_y:visibility(false);
    v14.custom_viewmodel_z:visibility(false);
    if v14.custom_viewmodel:get() then
        v14.custom_viewmodel_fov:visibility(true);
        v14.custom_viewmodel_x:visibility(true);
        v14.custom_viewmodel_y:visibility(true);
        v14.custom_viewmodel_z:visibility(true);
    end;
    v14.auto_mute_type:visibility(false);
    if v14.auto_mute:get() then
        v14.auto_mute_type:visibility(true);
    end;
    v14.trashtalk_states:visibility(false);
    if v14.trashtalk:get() then
        v14.trashtalk_states:visibility(true);
    end;
    v14.enemy_molotov_color:visibility(false);
    v14.smoke_color:visibility(false);
    if v14.greande_radius:get() then
        v14.enemy_molotov_color:visibility(true);
        v14.smoke_color:visibility(true);
    end;
end;
v15.animations = function(v89, v90)
    -- upvalues: v14 (ref), v15 (ref)
    hooked_function(v89, v90);
    if not v14.animation_breakers:get() then
        return;
    else
        local v91 = entity.get_local_player();
        if not v91 then
            return;
        elseif not v91:is_alive() then
            return;
        else
            local l_player_state_0 = v15.player_state;
            local v93 = ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement");
            if v14.air_legs:get() == "Default" then
                v93:override("Default");
            elseif v14.air_legs:get() == "Static" then
                v93:override("Sliding");
                v91.m_flPoseParameter[6] = 1;
            elseif l_player_state_0 == v15.state.air or l_player_state_0 == v15.state.air_duck and v14.air_legs:get() == v15.state.slow_walk then
                ffi.cast("CAnimationLayer**", ffi.cast("uintptr_t", v89) + 10640)[0][6].m_flWeight = 1;
            end;
            if v14.ground_legs:get() == "Default" then
                v93:override("Default");
            elseif v14.ground_legs:get() == "Static" then
                v93:override("Sliding");
                v91.m_flPoseParameter[0] = 1;
            elseif v14.ground_legs:get() == "Walk" then
                v93:override("Walking");
                v91.m_flPoseParameter[7] = 0;
            end;
            if v14.move_lean:get() and v91.m_vecVelocity:length() > 3 then
                ffi.cast("CAnimationLayer**", ffi.cast("uintptr_t", v89) + 10640)[0][12].m_flWeight = v14.move_lean_effect:get() / 10;
            end;
            if v14.pitch_null:get() and l_player_state_0 ~= v15.state.air and l_player_state_0 ~= v15.state.air_duck and ffi.cast("CCSGOPlayerAnimationState_534535_t**", ffi.cast("uintptr_t", v89) + 39264)[0].bHitGroundAnimation then
                v91.m_flPoseParameter[12] = 0.5;
            end;
            if v14.sliding_slow_walk:get() then
                v91.m_flPoseParameter[9] = 0;
            end;
            return;
        end;
    end;
end;
v15.anim_update = function()
    -- upvalues: v17 (ref), l_hook_0 (ref), v15 (ref)
    local v94 = entity.get_local_player();
    if v94 == nil then
        return;
    else
        local v95 = v17.get_entity_address(v94:get_index());
        if v95 == nil or hooked_function then
            return;
        else
            hooked_function = l_hook_0.new(v95).hook("void(__fastcall*)(void*, void*)", v15.animations, 224);
            return;
        end;
    end;
end;
animation = 0;
doubletap_alpha = 0;
doubletap_move = 0;
hideshots_alpha = 0;
hideshots_move = 0;
damage_alpha = 0;
damage_move = 0;
bodyaim_alpha = 0;
bodyaim_move = 0;
safepoint_alpha = 0;
safepoint_move = 0;
local function v99(v96, v97, v98)
    return v96 - (v96 - v97) * v98;
end;
v18.crosshair_indication = function()
    -- upvalues: v14 (ref), v99 (ref), v44 (ref), v15 (ref), v45 (ref)
    if not v14.crosshair_indication:get() then
        return;
    else
        local v100 = entity.get_local_player();
        if not v100 then
            return;
        elseif not v100:is_alive() then
            return;
        elseif common.is_button_down(9) then
            return;
        else
            local v101 = 0;
            local v102 = 40;
            local _ = 8;
            local v104 = v14.crosshair_indication_main_color:get();
            local v105 = v14.crosshair_indication_addative_color:get();
            local l_m_bIsScoped_0 = v100.m_bIsScoped;
            local l_frametime_0 = globals.frametime;
            local v108 = false;
            local v109 = ui.get_binds();
            for v110 = 1, #v109 do
                local v111 = v109[v110];
                if v111.name == "Min. Damage" and v111.active then
                    v108 = true;
                end;
            end;
            animation = v99(animation, l_m_bIsScoped_0 and 1 or 0, 20 * l_frametime_0);
            doubletap_alpha = v99(doubletap_alpha, v44.doubletap:get() and 1 or 0, 8 * l_frametime_0);
            doubletap_move = v99(doubletap_move, v44.doubletap:get() and 1 or 0, 8 * l_frametime_0);
            hideshots_alpha = v99(hideshots_alpha, v44.hideshots:get() and 1 or 0, 8 * l_frametime_0);
            hideshots_move = v99(hideshots_move, v44.hideshots:get() and 1 or 0, 8 * l_frametime_0);
            damage_alpha = v99(damage_alpha, v108 and 1 or 0, 8 * l_frametime_0);
            damage_move = v99(damage_move, v108 and 1 or 0, 8 * l_frametime_0);
            bodyaim_alpha = v99(bodyaim_alpha, v44.bodyaim:get() == "Force" and 1 or 0, 8 * l_frametime_0);
            bodyaim_move = v99(bodyaim_move, v44.bodyaim:get() == "Force" and 1 or 0, 8 * l_frametime_0);
            safepoint_alpha = v99(safepoint_alpha, v44.safepoint:get() == "Force" and 1 or 0, 8 * l_frametime_0);
            safepoint_move = v99(safepoint_move, v44.safepoint:get() == "Force" and 1 or 0, 8 * l_frametime_0);
            local v112 = {
                x = render.screen_size().x, 
                y = render.screen_size().y
            };
            if v15.player_state == v15.state.stand then
                pstate2 = "standing";
            elseif v15.player_state == v15.state.move then
                pstate2 = "running";
            elseif v15.player_state == v15.state.slowwalk then
                pstate2 = "slow motion";
            elseif v15.player_state == v15.state.duck then
                pstate2 = "crouching";
            elseif v15.player_state == v15.state.air then
                pstate2 = "jumping";
            elseif v15.player_state == v15.state.air_duck then
                pstate2 = "crouching air";
            end;
            local v113 = {
                lua_name = string.upper("elevrate"), 
                lua_build = string.upper(v45.lua.build), 
                pstate = string.upper(pstate2), 
                doubletap = string.upper("dt"), 
                hideshots = string.upper("os"), 
                damage = string.upper("dmg"), 
                bodyaim = string.upper("baim"), 
                safepoint = string.upper("safe")
            };
            local v114 = {
                lua_name = render.measure_text(2, nil, v113.lua_name), 
                lua_build = render.measure_text(2, nil, v113.lua_build), 
                pstate = render.measure_text(2, nil, v113.pstate), 
                doubletap = render.measure_text(2, nil, v113.doubletap), 
                hideshots = render.measure_text(2, nil, v113.hideshots), 
                damage = render.measure_text(2, nil, v113.damage), 
                bodyaim = render.measure_text(2, nil, v113.bodyaim), 
                safepoint = render.measure_text(2, nil, v113.safepoint)
            };
            local v115 = color(255, 76, 81, v105.a * doubletap_alpha);
            add_text = function(v116, v117, v118)
                render.text(2, v116, v117, nil, v118);
            end;
            render.shadow(vector(v112.x / 2 - v114.lua_name.x / 2 + v112.x / v102 * animation, v112.y / 2 + v112.y / 22 + v114.lua_name.y / 2), vector(v112.x / 2 + v114.lua_name.x / 2 + v112.x / v102 * animation, v112.y / 2 + v112.y / 22 + v101 + v114.lua_name.y / 2), v104, v114.lua_name.y * 2, 0);
            add_text(vector(v112.x / 2 - v114.lua_name.x / 2 - v114.lua_build.x / 2 + v112.x / v102 * animation, v112.y / 2 + v112.y / 22), v104, v113.lua_name);
            add_text(vector(v112.x / 2 + v114.lua_name.x / 2 - v114.lua_build.x / 2 + v112.x / v102 * animation, v112.y / 2 + v112.y / 22), v104, v113.lua_build);
            v101 = v101 + v114.lua_name.y / 1.3;
            add_text(vector(v112.x / 2 - v114.pstate.x / 2 + v112.x / v102 * animation, v112.y / 2 + v112.y / 22 + v101), v105, v113.pstate);
            v101 = v101 + v114.pstate.y / 1.3;
            add_text(vector(v112.x / 2 - v114.doubletap.x / 2 + v112.x / v102 * animation, v112.y / 2 + v112.y / 22 + v101), rage.exploit:get() == 1 and color(v105.r, v105.g, v105.b, v105.a * doubletap_alpha) or v115, v113.doubletap);
            v101 = v101 + v114.doubletap.y / 1.3 * doubletap_move;
            add_text(vector(v112.x / 2 - v114.hideshots.x / 2 + v112.x / v102 * animation, v112.y / 2 + v112.y / 22 + v101), color(v105.r, v105.g, v105.b, v105.a * hideshots_alpha), v113.hideshots);
            v101 = v101 + v114.hideshots.y / 1.3 * hideshots_move;
            add_text(vector(v112.x / 2 - v114.damage.x / 2 + v112.x / v102 * animation, v112.y / 2 + v112.y / 22 + v101), color(v105.r, v105.g, v105.b, v105.a * damage_alpha), v113.damage);
            v101 = v101 + v114.damage.y / 1.3 * damage_move;
            add_text(vector(v112.x / 2 - v114.bodyaim.x / 2 + v112.x / v102 * animation, v112.y / 2 + v112.y / 22 + v101), color(v105.r, v105.g, v105.b, v105.a * bodyaim_alpha), v113.bodyaim);
            v101 = v101 + v114.bodyaim.y / 1.3 * bodyaim_move;
            add_text(vector(v112.x / 2 - v114.safepoint.x / 2 + v112.x / v102 * animation, v112.y / 2 + v112.y / 22 + v101), color(v105.r, v105.g, v105.b, v105.a * safepoint_alpha), v113.safepoint);
            v101 = v101 + v114.safepoint.y / 1.3 * safepoint_move;
            return;
        end;
    end;
end;
v18.kibit_damage = function()
    -- upvalues: v14 (ref)
    if not v14.kibit_min_damage:get() then
        return;
    else
        local v119 = entity.get_local_player();
        if not v119 then
            return;
        elseif not v119:is_alive() then
            return;
        elseif common.is_button_down(9) then
            return;
        else
            local v120 = {
                x = render.screen_size().x, 
                y = render.screen_size().y
            };
            local v121 = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"):get();
            add_text = function(v122, v123, v124)
                render.text(1, v122, v123, nil, v124);
            end;
            add_text(vector(v120.x / 2 + 6, v120.y / 2.08), v14.kibit_min_damage_color:get(), v121);
            return;
        end;
    end;
end;
local v125 = 0;
v18.custom_scope = function()
    -- upvalues: v14 (ref), v125 (ref), v99 (ref)
    if not v14.custom_scope:get() then
        return;
    else
        local v126 = entity.get_local_player();
        if not v126 then
            return;
        elseif not v126:is_alive() then
            return;
        elseif common.is_button_down(9) then
            return;
        else
            local v127 = {
                x = render.screen_size().x, 
                y = render.screen_size().y
            };
            local l_m_bIsScoped_1 = v126.m_bIsScoped;
            local l_frametime_1 = globals.frametime;
            local v130 = v14.custom_scope_color:get();
            local v131 = v14.custom_scope_gap:get();
            local v132 = v14.custom_scope_size:get();
            ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay"):set("Remove All");
            v125 = v99(v125, l_m_bIsScoped_1 and 1 or 0, 12 * l_frametime_1);
            if not l_m_bIsScoped_1 and v125 < 0.05 then
                return;
            else
                render.gradient(vector(v127.x / 2 - v131 * v125, v127.y / 2), vector(v127.x / 2 - v131 * v125 - v132 * v125, v127.y / 2 + 1), v130, color(255, 255, 255, 0), v130, color(255, 255, 255, 0));
                render.gradient(vector(v127.x / 2 + v131 * v125 + 1, v127.y / 2), vector(v127.x / 2 + v131 * v125 + v132 * v125, v127.y / 2 + 1), v130, color(255, 255, 255, 0), v130, color(255, 255, 255, 0));
                render.gradient(vector(v127.x / 2, v127.y / 2 + v131 * v125), vector(v127.x / 2 + 1, v127.y / 2 + v131 * v125 + v132 * v125), v130, v130, color(255, 255, 255, 0), color(255, 255, 255, 0));
                render.gradient(vector(v127.x / 2, v127.y / 2 - v131 * v125), vector(v127.x / 2 + 1, v127.y / 2 - v131 * v125 - v132 * v125), v130, v130, color(255, 255, 255, 0), color(255, 255, 255, 0));
                return;
            end;
        end;
    end;
end;
local v139 = l_system_0.register({
    [1] = v14.debug_panel_x, 
    [2] = v14.debug_panel_y
}, vector(v19.watermark_size().x, v19.watermark_size().y * 2), "Watermark", function(v133)
    -- upvalues: v14 (ref), v45 (ref)
    if not v14.debug_panel:get() then
        return;
    else
        local v134 = entity.get_local_player();
        if not v134 then
            return;
        else
            local v135 = v134:get_steam_avatar();
            local v136 = globals.is_connected and math.floor(utils.net_channel().latency[1] * 1000) or 0;
            local _ = string.format(v136);
            local _ = render.measure_text(1, nil, "     Elevrate.Codes \226\136\153 " .. v45.lua.build .. " \226\136\153 " .. v45.cheat.user .. "  ");
            render.shadow(vector(v133.position.x, v133.position.y), vector(v133.position.x + v133.size.x, v133.position.y + v133.size.y - 3), v14.debug_panel_glow_color:get(), 30);
            render.rect(vector(v133.position.x, v133.position.y), vector(v133.position.x + v133.size.x, v133.position.y + v133.size.y - 3), color(24, 24, 24, 180));
            render.rect(vector(v133.position.x, v133.position.y), vector(v133.position.x + v133.size.x, v133.position.y - 2), v14.debug_panel_glow_color:get());
            render.text(1, vector(v133.position.x, v133.position.y + 5), color(255, 255, 255, 255), nil, "     Elevrate.Codes \226\136\153 " .. v45.lua.build .. " \226\136\153 " .. v45.cheat.user .. "  ");
            render.texture(v135, vector(v133.position.x + 5, v133.position.y + 6), vector(11, 11), color(), 6);
            return;
        end;
    end;
end);
local v140 = 0;
local v148 = l_system_0.register({
    [1] = v14.velocity_x, 
    [2] = v14.velocity_y
}, vector(render.screen_size().x / 15, render.screen_size().y / 20), "Velocity", function(v141)
    -- upvalues: v14 (ref), v140 (ref), v99 (ref)
    if not v14.velocity_indication:get() then
        return;
    else
        local v142 = entity.get_local_player();
        if not v142 then
            return;
        else
            local l_m_flVelocityModifier_0 = v142.m_flVelocityModifier;
            local v144 = math.floor(l_m_flVelocityModifier_0 * (render.screen_size().x / 15));
            local v145 = math.floor(l_m_flVelocityModifier_0 * 100);
            local v146 = render.measure_text(1, nil, "Velocity " .. v145 .. "%");
            local v147 = v14.velocity_indication_color:get();
            if ui.get_alpha() > 0.5 then
                v140 = v99(v140, ui.get_alpha() > 0.5 and 1 or 0, 10 * globals.frametime);
            elseif v145 ~= 100 and ui.get_alpha() < 0.5 then
                v140 = v99(v140, v145 ~= 100 and ui.get_alpha() < 0.5 and 1 or 0, 10 * globals.frametime);
            elseif v145 == 100 and ui.get_alpha() < 0.5 then
                v140 = v99(v140, v145 == 100 and 0 or 1, 10 * globals.frametime);
            elseif not v142:is_alive() and ui.get_alpha() < 0.5 then
                v140 = v99(v140, v142:is_alive() and 1 or 0, 10 * globals.frametime);
            end;
            position = {
                [1] = render.screen_size().x - render.screen_size().x / 15, 
                [2] = render.screen_size().y + render.screen_size().y
            };
            render.text(1, vector(v141.position.x + v141.size.x / 2 - v146.x / 2, v141.position.y - 16), color(255, 255, 255, 255 * v140), nil, "Velocity " .. v145 .. "%");
            render.shadow(vector(v141.position.x, v141.position.y - 2), vector(v141.position.x + v144, v141.position.y + 2), color(v147.r, v147.g, v147.b, v147.a * v140), render.screen_size().y / 20 / 2, 3);
            render.rect_outline(vector(v141.position.x, v141.position.y - 2), vector(v141.position.x + v141.size.x, v141.position.y + 2), color(24, 24, 24, 255 * v140), 3, 3);
            render.rect(vector(v141.position.x, v141.position.y - 2), vector(v141.position.x + v144, v141.position.y + 2), color(v147.r, v147.g, v147.b, v147.a * v140), 3);
            return;
        end;
    end;
end);
local v149 = render.load_font("Calibri", 23, "abd");
render.indicator = function(v150, v151, v152, v153, v154)
    -- upvalues: v149 (ref)
    local v155 = render.screen_size().x / 100 + 2;
    local v156 = render.screen_size().y / 1.47;
    ts = render.measure_text(v149, nil, v150);
    render.gradient(vector(v155 / 1.9, v156 + v151), vector(v155 / 1.9 + ts.x / 2, v156 + v151 + ts.y + 6), color(0, 0, 0, 0), color(0, 0, 0, 45), color(0, 0, 0, 0), color(0, 0, 0, 45));
    render.gradient(vector(v155 / 1.9 + ts.x / 2, v156 + v151), vector(v155 / 1.9 + ts.x, v156 + v151 + ts.y + 6), color(0, 0, 0, 45), color(0, 0, 0, 0), color(0, 0, 0, 45), color(0, 0, 0, 0));
    render.text(v149, vector(v155, v156 + 4 + v151), v152, nil, v150);
    if v153 and v154 then
        render.circle_outline(vector(v155 + ts.x + 18, v156 + v151 + ts.y / 2 + 2), color(0, 0, 0, 255), 10.5, 90, 1, 4);
        render.circle_outline(vector(v155 + ts.x + 18, v156 + v151 + ts.y / 2 + 2), v153, 10, 90, v154, 3);
    end;
end;
v18.get_bind = function(v157)
    local v158 = false;
    local v159 = 0;
    local v160 = ui.get_binds();
    for v161 = 1, #v160 do
        if v160[v161].name == v157 and v160[v161].active then
            v158 = true;
            v159 = v160[v161].value;
        end;
    end;
    return {
        [1] = v158, 
        [2] = v159
    };
end;
v18.spectators_get = function()
    local v162 = {};
    local v163, v164 = entity.get_local_player();
    if v163 ~= nil then
        if v163.m_hObserverTarget then
            v164 = v163.m_hObserverTarget;
        else
            v164 = v163;
        end;
        local v165 = entity.get_players(false, false);
        if v165 ~= nil then
            for _, v167 in pairs(v165) do
                local l_m_hObserverTarget_0 = v167.m_hObserverTarget;
                if l_m_hObserverTarget_0 and l_m_hObserverTarget_0 == v164 then
                    table.insert(v162, v167);
                end;
            end;
        end;
    end;
    return v162;
end;
v18.skeet_indication = function()
    -- upvalues: v14 (ref), v18 (ref), v20 (ref), v44 (ref)
    if not v14.indication500:get() then
        return;
    else
        local v169 = entity.get_local_player();
        if not v169 then
            return;
        elseif not v169:is_alive() then
            return;
        else
            local v170 = {
                x = render.screen_size().x, 
                y = render.screen_size().y
            };
            local v171 = 5;
            local v172 = v18.spectators_get();
            for _, v174 in pairs(v172) do
                local v175 = v174:get_name();
                local l_x_0 = render.measure_text(1, nil, v175).x;
                render.text(1, vector(v170.x - l_x_0 - 2, 2 + v171), color(255, 255, 255, 255), nil, v175);
                v171 = v171 + 17;
            end;
            local v177 = entity.get_entities("CPlantedC4", true)[1];
            local v178 = "";
            local v179 = 0;
            local v180 = false;
            local v181 = 0;
            local v182 = 0;
            local v183 = false;
            if v177 ~= nil then
                v179 = v177.m_flC4Blow - globals.curtime;
                v180 = v177.m_bBombDefused;
                if v179 > 0 and not v180 then
                    local v184 = v177.m_hBombDefuser ~= 4294967295;
                    local l_m_flDefuseLength_0 = v177.m_flDefuseLength;
                    local v186 = v184 and v177.m_flDefuseCountDown - globals.curtime or -1;
                    if v186 > 0 then
                        local v187 = v186 < v179 and color(58, 191, 54, 160) or color(252, 18, 19, 125);
                        local v188 = (v170.y - 50) / l_m_flDefuseLength_0 * v186;
                        render.rect(vector(0, 0), vector(16, v170.y), color(25, 25, 25, 160));
                        render.rect_outline(vector(0, 0), vector(16, v170.y), color(25, 25, 25, 160));
                        render.rect(vector(0, v170.y - v188), vector(16, v170.y), v187);
                    end;
                    v178 = v177.m_nBombSite == 0 and "A" or "B";
                    local l_m_iHealth_0 = v169.m_iHealth;
                    local l_m_ArmorValue_0 = v169.m_ArmorValue;
                    local v191 = v177.m_vecOrigin:dist(v169.m_vecOrigin);
                    local v192 = 450.7;
                    local v193 = (v191 - 75.68) / 789.2;
                    v181 = v192 * math.exp(-v193 * v193);
                    if l_m_ArmorValue_0 > 0 then
                        local v194 = v181 * 0.5;
                        local v195 = (v181 - v194) * 0.5;
                        if l_m_ArmorValue_0 < v195 then
                            l_m_ArmorValue_0 = l_m_ArmorValue_0 * 2;
                            v194 = v181 - v195;
                        end;
                        v181 = v194;
                    end;
                    v182 = math.ceil(v181);
                    v183 = l_m_iHealth_0 <= v182;
                end;
            end;
            if v20.planting then
                v20.fill = 3.125 - (3.125 + v20.on_plant_time - globals.curtime);
                if v20.fill > 3.125 then
                    v20.fill = 3.125;
                end;
            end;
            local v196 = 37;
            local v197 = 0;
            local l_get_bind_0 = v18.get_bind;
            local l_m_iPing_0 = v169:get_resource().m_iPing;
            local v200 = math.abs(l_m_iPing_0 % 360) / (v44.fake_latency:get() / 2);
            if v200 > 1 then
                v200 = 1;
            end;
            local v201 = color(255 - 125 * v200, 200 * v200, 0);
            local v202 = {
                [1] = {
                    "DA", 
                    v44.dormant_aimbot:get(), 
                    color(255, 200)
                }, 
                [2] = {
                    [1] = "PING", 
                    [2] = v44.fake_latency:get() > 0 and v169:is_alive(), 
                    [3] = v201
                }, 
                [3] = {
                    "BODY", 
                    v44.bodyaim:get() == "Force", 
                    color(255, 200)
                }, 
                [4] = {
                    "SAFE", 
                    v44.safepoint:get() == "Force", 
                    color(255, 200)
                }, 
                [5] = {
                    [1] = "DT", 
                    [2] = v44.doubletap:get(), 
                    [3] = rage.exploit:get() == 1 and color(255, 200) or color(255, 0, 0, 255)
                }, 
                [6] = {
                    "OSAA", 
                    v44.hideshots:get(), 
                    color(255, 200)
                }, 
                [7] = {
                    "DUCK", 
                    ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"):get(), 
                    color(255, 200)
                }, 
                [8] = {
                    "FS", 
                    v14.freestanding:get(), 
                    color(255, 200)
                }, 
                [9] = {
                    "HITCHANCE OVR", 
                    l_get_bind_0("Hit Chance")[1], 
                    color(255, 200)
                }, 
                [10] = {
                    "HITBOX OVR", 
                    l_get_bind_0("Hitboxes")[1], 
                    color(255, 200)
                }, 
                [11] = {
                    "MD", 
                    l_get_bind_0("Min. Damage")[1], 
                    color(255, 200)
                }, 
                [12] = {
                    v178 .. " - " .. string.format("%.1f", v179) .. "s", 
                    v179 > 0 and not v180, 
                    color(255, 200)
                }, 
                [13] = {
                    "FATAL", 
                    v169:is_alive() and v183, 
                    color(255, 0, 0, 255)
                }, 
                [14] = {
                    "-" .. v182 .. " HP", 
                    v169:is_alive() and not v183 and v181 > 0.5, 
                    color(210, 216, 112, 255)
                }, 
                [15] = {
                    [1] = v20.planting_site, 
                    [2] = v20.planting, 
                    [3] = color(210, 216, 112, 255), 
                    [4] = color(255, 255), 
                    [5] = skeet_indication_style == "New" and v20.fill / 3.3 or nil
                }
            };
            for _, v204 in pairs(v202) do
                if v204[2] then
                    render.indicator(v204[1], v197, v204[3], v204[4], v204[5]);
                    v197 = v197 - v196;
                end;
            end;
            return;
        end;
    end;
end;
local function v207(v205, v206)
    return tonumber(string.format("%." .. (v206 or 0) .. "f", v205));
end;
local v208 = {
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
events.aim_ack:set(function(v209)
    -- upvalues: v14 (ref), v22 (ref), v208 (ref), v9 (ref), v207 (ref)
    if not v14.logging:get() then
        return;
    else
        local v210 = {
            name = v209.target:get_name(), 
            damage = v209.damage, 
            hitbox = v209.hitgroup, 
            wanted_damage = v209.wanted_damage, 
            backtrack = v209.backtrack
        };
        if not v209.state then
            table.insert(v22, {
                anim = 0, 
                state = "shot", 
                name = string.lower(v210.name), 
                hitbox = v208[v209.hitgroup], 
                damage = v210.damage, 
                wanted_dmg = v210.wanted_damage, 
                bt = v210.backtrack, 
                time = globals.realtime, 
                clr_r = v14.logging_color:get().r, 
                clr_g = v14.logging_color:get().g, 
                clr_b = v14.logging_color:get().b, 
                clr_a = v14.logging_color:get().a
            });
        elseif v209.state then
            table.insert(v22, {
                anim = 0, 
                state = "miss", 
                name = string.lower(v210.name), 
                reason = v209.state, 
                wanted_hitbox = v208[v209.wanted_hitgroup], 
                time = globals.realtime, 
                clr_r = v14.logging_color_miss:get().r, 
                clr_g = v14.logging_color_miss:get().g, 
                clr_b = v14.logging_color_miss:get().b, 
                clr_a = v14.logging_color_miss:get().a
            });
        end;
        if v14.logging_types:get("Console") then
            if not v209.state then
                print_raw(" [" .. v9(v14.logging_color:get()) .. "Elevrate.Codes\aFFFFFF] " .. "hit " .. v9(v14.logging_color:get()) .. string.lower(v210.name .. " " .. v208[v209.hitgroup] .. " \aFFFFFFfor " .. v9(v14.logging_color:get()) .. v210.damage .. "\aFFFFFF (" .. v9(v14.logging_color:get()) .. v209.wanted_damage .. "\aFFFFFF) [remained " .. v9(v14.logging_color:get()) .. v209.target.m_iHealth .. "\aFFFFFF hp | bt: " .. v9(v14.logging_color:get()) .. v210.backtrack .. "\aFFFFFF | ang: " .. v9(v14.logging_color:get()) .. v207(v209.target.m_flPoseParameter[11] * 120 - 60, 2) .. "\aFFFFFF | hc " .. v9(v14.logging_color:get()) .. v209.hitchance .. "\aFFFFFF%] "));
            else
                print_raw(" [" .. v9(v14.logging_color_miss:get()) .. "Elevrate.Codes\aFFFFFF] " .. "missed " .. string.lower(v9(v14.logging_color_miss:get()) .. v210.name .. " " .. v208[v209.wanted_hitgroup] .. "\aFFFFFF due to " .. v9(v14.logging_color_miss:get()) .. v209.state .. "\aFFFFFF (" .. v9(v14.logging_color_miss:get()) .. v209.wanted_damage .. "\aFFFFFF) [bt: " .. v9(v14.logging_color_miss:get()) .. v210.backtrack .. "\aFFFFFF | ang: " .. v9(v14.logging_color_miss:get()) .. v207(v209.target.m_flPoseParameter[11] * 120 - 60, 2) .. "\aFFFFFF | hc " .. v9(v14.logging_color_miss:get()) .. v209.hitchance .. "\aFFFFFF%]"));
            end;
        end;
        return;
    end;
end);
v18.hitlogs = function()
    -- upvalues: v14 (ref), v22 (ref), v99 (ref)
    if not v14.logging:get() then
        return;
    else
        local v211 = {
            x = render.screen_size().x / 2, 
            y = render.screen_size().y / (v14.logging_position:get() / 10)
        };
        add_y = 0;
        for v212, v213 in ipairs(v22) do
            local v214 = {
                hit = render.measure_text(1, nil, " Hit "), 
                name = render.measure_text(1, nil, v213.name), 
                inthe = render.measure_text(1, nil, " "), 
                hitbox = render.measure_text(1, nil, v213.hitbox), 
                forr = render.measure_text(1, nil, " for "), 
                damage = render.measure_text(1, nil, v213.damage), 
                fs = render.measure_text(1, nil, " ("), 
                wanted_dmg = render.measure_text(1, nil, v213.wanted_dmg), 
                ss = render.measure_text(1, nil, ") bt: "), 
                bt = render.measure_text(1, nil, v213.bt), 
                missed_in = render.measure_text(1, nil, " Missed "), 
                space = render.measure_text(1, nil, " "), 
                wanted_hitbox = render.measure_text(1, nil, v213.wanted_hitbox), 
                reason_t = render.measure_text(1, nil, " due to "), 
                reason = render.measure_text(1, nil, v213.reason)
            };
            if v213.state == "shot" then
                v214.log_size = render.measure_text(1, nil, " Hit " .. v213.name .. " " .. v213.hitbox .. " for " .. v213.damage .. " (" .. v213.wanted_dmg .. ") bt: " .. v213.bt .. " ");
            elseif v213.state == "miss" then
                v214.log_size = render.measure_text(1, nil, " Missed " .. v213.name .. " " .. v213.wanted_hitbox .. " due to " .. v213.reason .. " ");
            end;
            if v14.logging_types:get("Screen") then
                if v213.time + 2 > globals.realtime then
                    v213.anim = v99(v213.anim, 1, 12 * globals.frametime);
                end;
                add_x = 0;
                add_x2 = 0;
                add_y = add_y + render.screen_size().y / 40 * v213.anim;
                if v213.state == "shot" then
                    render.shadow(vector(v211.x - v214.log_size.x / 2 - 4, v211.y - 3 - add_y), vector(v211.x + v214.log_size.x / 2 + 4, v211.y + v214.log_size.y + 3 - add_y), color(v213.clr_r, v213.clr_g, v213.clr_b, v213.clr_a * v213.anim), 30);
                    render.rect(vector(v211.x - v214.log_size.x / 2 - 4, v211.y - 3 - add_y), vector(v211.x + v214.log_size.x / 2 + 4, v211.y + v214.log_size.y + 3 - add_y), color(24, 24, 24, 180 * v213.anim));
                    render.rect(vector(v211.x - v214.log_size.x / 2 - 4, v211.y - 3 - add_y), vector(v211.x + v214.log_size.x / 2 + 4, v211.y - 3 - add_y), color(v213.clr_r, v213.clr_g, v213.clr_b, v213.clr_a * v213.anim));
                    render.text(1, vector(v211.x - v214.log_size.x / 2 + add_x, v211.y - add_y), color(255, 255, 255, 255 * v213.anim), nil, " Hit ");
                    add_x = add_x + v214.hit.x;
                    render.text(1, vector(v211.x - v214.log_size.x / 2 + add_x, v211.y - add_y), color(v14.logging_color:get().r, v14.logging_color:get().g, v14.logging_color:get().b, 255 * v213.anim), nil, v213.name);
                    add_x = add_x + v214.name.x;
                    render.text(1, vector(v211.x - v214.log_size.x / 2 + add_x, v211.y - add_y), color(255, 255, 255, 255 * v213.anim), nil, " ");
                    add_x = add_x + v214.inthe.x;
                    render.text(1, vector(v211.x - v214.log_size.x / 2 + add_x, v211.y - add_y), color(v14.logging_color:get().r, v14.logging_color:get().g, v14.logging_color:get().b, 255 * v213.anim), nil, v213.hitbox);
                    add_x = add_x + v214.hitbox.x;
                    render.text(1, vector(v211.x - v214.log_size.x / 2 + add_x, v211.y - add_y), color(255, 255, 255, 255 * v213.anim), nil, " for ");
                    add_x = add_x + v214.forr.x;
                    render.text(1, vector(v211.x - v214.log_size.x / 2 + add_x, v211.y - add_y), color(v14.logging_color:get().r, v14.logging_color:get().g, v14.logging_color:get().b, 255 * v213.anim), nil, v213.damage);
                    add_x = add_x + v214.damage.x;
                    render.text(1, vector(v211.x - v214.log_size.x / 2 + add_x, v211.y - add_y), color(255, 255, 255, 255 * v213.anim), nil, " (");
                    add_x = add_x + v214.fs.x;
                    render.text(1, vector(v211.x - v214.log_size.x / 2 + add_x, v211.y - add_y), color(v14.logging_color:get().r, v14.logging_color:get().g, v14.logging_color:get().b, 255 * v213.anim), nil, v213.wanted_dmg);
                    add_x = add_x + v214.wanted_dmg.x;
                    render.text(1, vector(v211.x - v214.log_size.x / 2 + add_x, v211.y - add_y), color(255, 255, 255, 255 * v213.anim), nil, ") bt: ");
                    add_x = add_x + v214.ss.x;
                    render.text(1, vector(v211.x - v214.log_size.x / 2 + add_x, v211.y - add_y), color(v14.logging_color:get().r, v14.logging_color:get().g, v14.logging_color:get().b, 255 * v213.anim), nil, v213.bt .. " ");
                elseif v213.state == "miss" then
                    render.shadow(vector(v211.x - v214.log_size.x / 2 - 4, v211.y - 3 - add_y), vector(v211.x + v214.log_size.x / 2 + 4, v211.y + v214.log_size.y + 3 - add_y), color(v213.clr_r, v213.clr_g, v213.clr_b, v213.clr_a * v213.anim), 30);
                    render.rect(vector(v211.x - v214.log_size.x / 2 - 4, v211.y - 3 - add_y), vector(v211.x + v214.log_size.x / 2 + 4, v211.y + v214.log_size.y + 3 - add_y), color(24, 24, 24, 180 * v213.anim));
                    render.rect(vector(v211.x - v214.log_size.x / 2 - 4, v211.y - 3 - add_y), vector(v211.x + v214.log_size.x / 2 + 4, v211.y - 3 - add_y), color(v213.clr_r, v213.clr_g, v213.clr_b, v213.clr_a * v213.anim));
                    render.text(1, vector(v211.x - v214.log_size.x / 2 + add_x2, v211.y - add_y), color(255, 255, 255, 255 * v213.anim), nil, " Missed ");
                    add_x2 = add_x2 + v214.missed_in.x;
                    render.text(1, vector(v211.x - v214.log_size.x / 2 + add_x2, v211.y - add_y), color(v14.logging_color_miss:get().r, v14.logging_color_miss:get().g, v14.logging_color_miss:get().b, 255 * v213.anim), nil, v213.name);
                    add_x2 = add_x2 + v214.name.x;
                    render.text(1, vector(v211.x - v214.log_size.x / 2 + add_x2, v211.y - add_y), color(255, 255, 255, 255 * v213.anim), nil, " ");
                    add_x2 = add_x2 + v214.space.x;
                    render.text(1, vector(v211.x - v214.log_size.x / 2 + add_x2, v211.y - add_y), color(v14.logging_color_miss:get().r, v14.logging_color_miss:get().g, v14.logging_color_miss:get().b, 255 * v213.anim), nil, v213.wanted_hitbox);
                    add_x2 = add_x2 + v214.wanted_hitbox.x;
                    render.text(1, vector(v211.x - v214.log_size.x / 2 + add_x2, v211.y - add_y), color(255, 255, 255, 255 * v213.anim), nil, " due to ");
                    add_x2 = add_x2 + v214.reason_t.x;
                    render.text(1, vector(v211.x - v214.log_size.x / 2 + add_x2, v211.y - add_y), color(v14.logging_color_miss:get().r, v14.logging_color_miss:get().g, v14.logging_color_miss:get().b, 255 * v213.anim), nil, v213.reason .. " ");
                end;
                if v213.time + 4 < globals.realtime then
                    v213.anim = v99(v213.anim, 0, 6 * globals.frametime);
                end;
                if v213.time + 4 < globals.realtime then
                    v213.anim_2 = v99(v213.anim, 0, 6 * globals.frametime);
                end;
                if v213.anim < 0.01 and v213.time + 3 < globals.realtime or #v22 > 5 then
                    table.remove(v22, v212);
                end;
            end;
        end;
        return;
    end;
end;
v20.reset = function()
    -- upvalues: v20 (ref)
    v20.planting = false;
    v20.fill = 0;
    v20.on_plant_time = 0;
    v20.planting_site = "";
end;
v20.bomb_beginplant = function(v215)
    -- upvalues: v20 (ref)
    local v216 = entity.get_player_resource();
    if v216 == nil then
        return;
    else
        v20.on_plant_time = globals.curtime;
        v20.planting = true;
        local l_m_bombsiteCenterA_0 = v216.m_bombsiteCenterA;
        local l_m_bombsiteCenterB_0 = v216.m_bombsiteCenterB;
        local v219 = entity.get(v215.userid, true):get_origin();
        v20.planting_site = v219:dist(l_m_bombsiteCenterA_0) < v219:dist(l_m_bombsiteCenterB_0) and "Bombsite A" or "Bombsite B";
        return;
    end;
end;
aim_ack_no_chole = function(v220)
    -- upvalues: v23 (ref)
    table.insert(v23, {
        alpha = 0, 
        vector = v220.aim, 
        time = globals.realtime
    });
end;
local v221 = {};
v221.color_lerp = function(v222, v223, v224)
    -- upvalues: v221 (ref)
    local v225 = globals.frametime * 100;
    return v222:lerp(v223, v224 * math.min(v225, v221.max_lerp_low_fps));
end;
v221.max_lerp_low_fps = 2.2222222222222223;
v221.lerp = function(v226, v227, v228)
    if v226 == v227 then
        return v227;
    else
        v228 = v228 * (globals.frametime * 170);
        local v229 = v226 + (v227 - v226) * v228;
        if math.abs(v229 - v227) < 0.01 then
            return v227;
        else
            return v229;
        end;
    end;
end;
v221.base_speed = 0.095;
v221._list = {};
v221.new = function(v230, v231, v232, v233)
    -- upvalues: v221 (ref), v43 (ref)
    if not v232 then
        v232 = v221.base_speed;
    end;
    local v234 = type(v231) == "userdata";
    if v221._list[v230] == nil then
        v221._list[v230] = v233 and v233 or v234 and v43.white or 0;
    end;
    local v235 = nil;
    if v234 then
        v235 = v221.color_lerp;
    else
        v235 = v221.lerp;
    end;
    v221._list[v230] = v235(v221._list[v230], v231, v232);
    return v221._list[v230];
end;
v18.get_grenade = function()
    local v236 = entity.get_local_player();
    if v236 == nil then
        return;
    else
        local v237 = entity.get_entities("CSmokeGrenadeProjectile");
        local v238 = entity.get_entities("CInferno");
        local v239 = cvar.mp_friendlyfire:int() == 0;
        local v240 = {};
        local v241 = {};
        local l_tickcount_0 = globals.tickcount;
        local l_tickinterval_0 = globals.tickinterval;
        if v237 ~= nil then
            for v244, v245 in pairs(v237) do
                if v240[v244] == nil then
                    v240[v244] = {};
                    v240[v244].position = vector(0, 0, 0);
                    v240[v244].alpha = 0;
                    v240[v244].draw = false;
                end;
                v240[v244].position = v245:get_origin();
                v240[v244].alpha = v245:get_bbox().alpha * 255;
                if v245.m_bDidSmokeEffect and v245:get_bbox().alpha > 0 then
                    v240[v244].draw = true;
                end;
            end;
        end;
        if v238 ~= nil then
            for v246, v247 in pairs(v238) do
                if v241[v246] == nil then
                    v241[v246] = {};
                    v241[v246].position = vector(0, 0, 0);
                    v241[v246].alpha = 0;
                    v241[v246].draw = false;
                    v241[v246].teammate = false;
                end;
                local v248 = (7.125 - l_tickinterval_0 * (l_tickcount_0 - v247.m_nFireEffectTickBegin)) / 7.125;
                v241[v246].position = v247:get_origin();
                v241[v246].alpha = v248 * 255;
                local l_m_hOwnerEntity_0 = v247.m_hOwnerEntity;
                if l_m_hOwnerEntity_0 ~= nil and v239 and l_m_hOwnerEntity_0 ~= v236 and not l_m_hOwnerEntity_0:is_enemy() then
                    v241[v246].teammate = true;
                end;
                local v250 = {};
                local v251 = 100;
                for v252 = 1, 64 do
                    if v247.m_bFireIsBurning[v252] then
                        table.insert(v250, {
                            [1] = v247.m_fireXDelta[v252], 
                            [2] = v247.m_fireYDelta[v252], 
                            [3] = v247.m_fireZDelta[v252]
                        });
                    end;
                end;
                for v253 = 1, #v250 do
                    local v254 = v250[v253];
                    local v255, v256, _ = unpack(v254);
                    for v258 = 1, #v250 do
                        local v259 = v250[v258];
                        local v260 = vector(v255, v256):dist(vector(v259[1], v259[2]));
                        if v251 < v260 then
                            v251 = v260;
                        end;
                    end;
                end;
                if v248 > 0 then
                    v241[v246].draw = true;
                    v241[v246].radius = v251 / 2 + 40;
                end;
            end;
        end;
        return {
            smoke = v240, 
            molotov = v241
        };
    end;
end;
v18.grenade_radius = function()
    -- upvalues: v14 (ref), v18 (ref), v221 (ref)
    if not v14.greande_radius:get() then
        return;
    else
        local v261 = v18.get_grenade();
        if v261 == nil then
            return;
        else
            local l_enemy_molotov_color_0 = v14.enemy_molotov_color;
            local l_smoke_color_0 = v14.smoke_color;
            local v264 = {};
            local _ = l_enemy_molotov_color_0:get().a / 255;
            v264.molotov_radius = {};
            for v266 = 1, #v261.molotov do
                local v267 = v261.molotov[v266];
                v264.molotov_radius[v266] = v221.new("molotov_radius_" .. v266, v267.draw and v267.radius or 0, 0.095);
                if v267.draw then
                    render.circle_3d(v267.position, l_enemy_molotov_color_0:get(), v264.molotov_radius[v266], 0, 1, 1.5);
                    render.circle_3d_outline(v267.position, l_enemy_molotov_color_0:get(), v264.molotov_radius[v266], 0, 1, 1.5);
                    render.text(2, render.world_to_screen(v267.position), v267.teammate and color(149, 184, 6, 255) or l_enemy_molotov_color_0:get(), nil, v267.teammate and "TEAM" or "DANGER");
                end;
            end;
            v264.smoke_radius = {};
            for v268 = 1, #v261.smoke do
                local v269 = v261.smoke[v268];
                v264.smoke_radius[v268] = v221.new("smoke_radius_" .. v268, v269.draw and 125 or 0, 0.095);
                if v269.draw then
                    render.circle_3d(v269.position, l_smoke_color_0:get(), v264.smoke_radius[v268], 0, 1, 1.5);
                    render.circle_3d_outline(v269.position, l_smoke_color_0:get(), v264.smoke_radius[v268], 0, 1, 1.5);
                end;
            end;
            return;
        end;
    end;
end;
v18.custom_hitmarker = function()
    -- upvalues: v14 (ref), v23 (ref), v7 (ref)
    if not v14.hitmarker:get() then
        return;
    else
        local v270 = entity.get_local_player();
        if not v270 then
            return;
        elseif not v270:is_alive() then
            return;
        else
            ui.find("Visuals", "World", "Other", "Hit Marker", "3D Marker"):override(false);
            local v271 = {
                font = v14.hitmarker_font:get(), 
                type = v14.hitmarker_type:get(), 
                text = v14.hitmarker_text:get()
            };
            for v272, v273 in ipairs(v23) do
                if globals.realtime - v273.time < 1 then
                    v273.alpha = v7(true, v273.alpha, 255, 0.05);
                elseif globals.realtime - v273.time > 3 then
                    v273.alpha = v7(false, v273.alpha, 255, 0.05);
                    if v273.alpha == 0 then
                        table.remove(v23, v272);
                    end;
                end;
                render.text(v271.font, render.world_to_screen(v273.vector), color(v14.hitmarker_color:get().r, v14.hitmarker_color:get().g, v14.hitmarker_color:get().b, v273.alpha), "c", v271.type == "Icon" and ui.get_icon("" .. v271.text .. "") or v271.text);
            end;
            return;
        end;
    end;
end;
v21.teleport_inair = function(v274)
    -- upvalues: v14 (ref), v15 (ref)
    if not v14.auto_teleport:get() then
        return;
    else
        local v275 = entity.get_local_player();
        if not v275 then
            return;
        elseif not v275:is_alive() then
            return;
        else
            local v276 = {
                need_tp = false
            };
            local v277 = v275:get_player_weapon():get_classname();
            if string.match(v277, "Grenade") then
                return;
            else
                local function v281(v278)
                    -- upvalues: v275 (ref)
                    local v279, v280 = utils.trace_bullet(v278, v278:get_hitbox_position(3), v275:get_hitbox_position(3));
                    if v279 == 0 or v279 <= 0 or not v280.entity or v280.entity ~= v275 then
                        return false;
                    else
                        return true;
                    end;
                end;
                for _, v283 in pairs(entity.get_players(true)) do
                    if v283 ~= v275 and v281(v283) then
                        v276.need_tp = true;
                    end;
                end;
                if v276.need_tp and (v15.player_state == v15.state.air_duck or v15.player_state == v15.state.air) then
                    v274.force_defensive = true;
                    ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Fake Lag Limit"):override(math.random(10));
                    if rage.exploit:get() == 1 then
                        rage.exploit:force_teleport();
                    end;
                    ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Fake Lag Limit"):override(math.random(5));
                    if globals.tickcount % v14.auto_teleport_delay:get() == v14.auto_teleport_delay:get() - 1 and v14.auto_teleport_force_recharge:get() then
                        rage.exploit:force_charge();
                    end;
                else
                    ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Fake Lag Limit"):override(nil);
                end;
                return;
            end;
        end;
    end;
end;
v21.air_mode = function()
    -- upvalues: v14 (ref), v15 (ref)
    if not v14.air_mode:get() then
        return;
    else
        local v284 = entity.get_local_player();
        if not v284 then
            return;
        elseif not v284:is_alive() then
            return;
        else
            local v285 = {
                scout = v14.air_mode_scout:get(), 
                awp = v14.air_mode_awp:get(), 
                auto = v14.air_mode_auto:get(), 
                r8 = v14.air_mode_r8:get(), 
                deagle = v14.air_mode_deagle:get()
            };
            local l_player_state_1 = v15.player_state;
            if l_player_state_1 == v15.state.air or l_player_state_1 == v15.state.air_duck then
                ui.find("Aimbot", "Ragebot", "Selection", "SSG-08", "Hit Chance"):override(v285.scout);
                ui.find("Aimbot", "Ragebot", "Selection", "AWP", "Hit Chance"):override(v285.awp);
                ui.find("Aimbot", "Ragebot", "Selection", "AutoSnipers", "Hit Chance"):override(v285.auto);
                ui.find("Aimbot", "Ragebot", "Selection", "R8 Revolver", "Hit Chance"):override(v285.r8);
                ui.find("Aimbot", "Ragebot", "Selection", "Desert Eagle", "Hit Chance"):override(v285.deagle);
            else
                ui.find("Aimbot", "Ragebot", "Selection", "SSG-08", "Hit Chance"):override(nil);
                ui.find("Aimbot", "Ragebot", "Selection", "AWP", "Hit Chance"):override(nil);
                ui.find("Aimbot", "Ragebot", "Selection", "AutoSnipers", "Hit Chance"):override(nil);
                ui.find("Aimbot", "Ragebot", "Selection", "R8 Revolver", "Hit Chance"):override(nil);
                ui.find("Aimbot", "Ragebot", "Selection", "Desert Eagle", "Hit Chance"):override(nil);
            end;
            return;
        end;
    end;
end;
v21.no_scope_mode = function()
    -- upvalues: v14 (ref)
    if not v14.no_scope_mode:get() then
        return;
    else
        local v287 = entity.get_local_player();
        if not v287 then
            return;
        elseif not v287:is_alive() then
            return;
        else
            local v288 = {
                scout = v14.no_scope_mode_scout:get(), 
                awp = v14.no_scope_mode_awp:get(), 
                auto = v14.no_scope_mode_auto:get()
            };
            if not v287.m_bIsScoped then
                ui.find("Aimbot", "Ragebot", "Selection", "SSG-08", "Hit Chance"):override(v288.scout);
                ui.find("Aimbot", "Ragebot", "Selection", "AWP", "Hit Chance"):override(v288.awp);
                ui.find("Aimbot", "Ragebot", "Selection", "AutoSnipers", "Hit Chance"):override(v288.auto);
            else
                ui.find("Aimbot", "Ragebot", "Selection", "SSG-08", "Hit Chance"):override(nil);
                ui.find("Aimbot", "Ragebot", "Selection", "AWP", "Hit Chance"):override(nil);
                ui.find("Aimbot", "Ragebot", "Selection", "AutoSnipers", "Hit Chance"):override(nil);
            end;
            return;
        end;
    end;
end;
v21.off_stafe = false;
v21.super_toss = function(v289)
    -- upvalues: v14 (ref), v21 (ref), v44 (ref)
    local v290 = entity.get_local_player();
    if not v290 then
        return;
    elseif not v290:is_alive() then
        return;
    else
        local v291 = v290:get_player_weapon():get_classname();
        if v291 == nil then
            return;
        else
            math_velocity = math.sqrt(v290.m_vecVelocity.x ^ 2 + v290.m_vecVelocity.y ^ 2);
            if string.match(v291, "Grenade") then
                if not v14.super_toss:get() then
                    return;
                else
                    v21.off_stafe = false;
                    v44.airstrafe:set(math_velocity >= 5);
                    if v289.in_attack then
                        v289.forwardmove = 0;
                        v289.sidemove = 0;
                    end;
                end;
            elseif string.match(v291, "SSG-08") then
                if not v14.jump_scout:get() then
                    return;
                else
                    v21.off_stafe = false;
                    v44.airstrafe:set(math_velocity >= 5);
                    if v289.in_attack then
                        v289.forwardmove = 0;
                        v289.sidemove = 0;
                    end;
                end;
            else
                v21.off_stafe = true;
            end;
            if v21.off_stafe == true then
                v44.airstrafe:set(true);
            end;
            return;
        end;
    end;
end;
events.shutdown:set(function()
    -- upvalues: v14 (ref), v44 (ref)
    if v14.super_toss:get() then
        v44.airstrafe:set(true);
    end;
    if v14.jump_scout:get() then
        v44.airstrafe:set(true);
    end;
end);
v21.nade_throw_fix = function(v292)
    -- upvalues: v14 (ref)
    if not v14.nade_throw_fix:get() then
        return;
    else
        local v293 = entity.get_local_player();
        if not v293 then
            return;
        elseif not v293:is_alive() then
            return;
        else
            local v294 = v293:get_player_weapon();
            if v294 == nil then
                return;
            else
                local v295 = v294:get_classname();
                local l_m_fThrowTime_0 = v294.m_fThrowTime;
                if l_m_fThrowTime_0 ~= nil and l_m_fThrowTime_0 ~= 0 then
                    rage.exploit:allow_defensive(false);
                elseif v292.in_attack and string.match(v295, "Grenade") then
                    rage.exploit:allow_defensive(false);
                end;
                return;
            end;
        end;
    end;
end;
v19.auto_mute = function()
    -- upvalues: v14 (ref)
    if not v14.auto_mute:get() then
        return;
    else
        local v297 = v14.auto_mute_type:get();
        local _ = entity.get_players(nil, true, function(v298)
            -- upvalues: v297 (ref)
            local v299 = v298:get_player_info();
            local v300 = panorama.FriendsListAPI.IsSelectedPlayerMuted(v299.steamid64);
            if v297 == "Unmute" and v300 then
                panorama.FriendsListAPI.ToggleMute(v299.steamid64);
            elseif v297 == "Mute" and not v300 then
                panorama.FriendsListAPI.ToggleMute(v299.steamid64);
            end;
        end);
        return;
    end;
end;
local v302 = {
    handle = ffi.cast("uintptr_t***", ffi.cast("uintptr_t", utils.opcode_scan("engine.dll", "8B 0D ?? ?? ?? ?? 85 C9 74 16 8B 01 8B")) + 2)[0][0] + 2, 
    find_window = ffi.cast("int(__stdcall*)(uintptr_t, int)", utils.opcode_scan("gameoverlayrenderer.dll", "55 8B EC 83 EC 14 8B 45 0C F7")), 
    get_window = ffi.cast("uintptr_t**", ffi.cast("uintptr_t", utils.opcode_scan("gameoverlayrenderer.dll", "FF 15 ?? ?? ?? ?? 3B C6 74")) + 2)[0][0], 
    gameoverlayrenderer = ffi.cast("int(__thiscall*)(uintptr_t)", utils.opcode_scan("gameoverlayrenderer.dll", "FF E1"))
};
v19.get_procces_handle = function()
    -- upvalues: v302 (ref)
    return v302.handle[0];
end;
v19.game_overlay = function()
    -- upvalues: v302 (ref)
    return v302.gameoverlayrenderer(v302.get_window);
end;
v19.taskbar_notify = function()
    -- upvalues: v19 (ref), v14 (ref), v302 (ref)
    local v303 = v19.get_procces_handle();
    if v14.round_start_notify:get() and v19.game_overlay() ~= v303 then
        v302.find_window(v303, 1);
    end;
end;
v19.viewmodel = function()
    -- upvalues: v14 (ref)
    if v14.custom_viewmodel:get() then
        cvar.viewmodel_fov:float(v14.custom_viewmodel_fov:get(), true);
        cvar.viewmodel_offset_x:float(v14.custom_viewmodel_x:get() / 1, true);
        cvar.viewmodel_offset_y:float(v14.custom_viewmodel_y:get() / 1, true);
        cvar.viewmodel_offset_z:float(v14.custom_viewmodel_z:get() / 1, true);
    else
        cvar.viewmodel_fov:float(68);
        cvar.viewmodel_offset_x:float(2.5);
        cvar.viewmodel_offset_y:float(0);
        cvar.viewmodel_offset_z:float(-5);
    end;
end;
v19.aspect_ratio = function()
    -- upvalues: v14 (ref)
    local v304 = v14.aspect_ratio_value:get() / 10;
    if not v14.aspect_ratio:get() then
        v304 = 0;
    end;
    if v304 ~= cvar.r_aspectratio.float(cvar.r_aspectratio) then
        cvar.r_aspectratio.float(cvar.r_aspectratio, v304);
    end;
end;
local v305 = {
    [1] = {
        [1] = "\209\130\209\139 \209\135\208\190 \208\182\208\184\209\128\208\180\209\143\208\185 \208\189\208\176 \208\186\208\190\208\179\208\190 \208\187\208\181\208\183\208\181\209\136\209\140 \208\189\208\184\209\137\208\184\209\130\208\176 \208\181\208\177\208\176\208\189\208\189\208\176\209\143"
    }, 
    [2] = {
        [1] = "\208\175 \208\182\208\181 \209\130\208\178\208\190\208\181\208\185 \208\188\208\176\209\130\208\181\209\128\208\184 \209\136\208\187\209\142\209\133\208\181 \208\179\208\190\208\178\208\190\209\128\208\184\208\187, \209\135\209\130\208\190 \209\129\209\139\208\189 \208\191\208\184\208\180\208\176\209\128\208\176\209\129, \208\183\208\176\208\188\209\131\208\178\208\176\209\130\209\140\209\129\209\143 \208\189\208\181 \208\188\208\190\208\182\208\181\209\130"
    }, 
    [3] = {
        [1] = "\209\130\209\139 \209\129\208\189\208\190\208\178\208\176 \208\186\209\129\209\130\208\176 \208\177\208\176\208\177\208\186\208\184 \208\189\208\176 \208\191\208\176\209\129\209\130\209\131 \208\191\209\128\208\190\208\181\208\177\208\176\208\187 \208\184 \209\130\209\131\209\130 \208\182\208\181 \209\131\208\191\208\176\208\187"
    }, 
    [4] = {
        [1] = "\209\130\209\139 \208\191\208\181\209\128\208\178\208\181\208\181 \208\188\208\176\208\188\208\186\208\184 \208\189\208\176 \208\186\208\190\208\187\208\181\208\189\208\184 \209\131\208\191\208\176\208\187, 1"
    }, 
    [5] = {
        [1] = "\208\189\208\176\209\131\209\135\208\184 \208\188\208\181\208\189\209\143 \209\130\208\176\208\186 \208\182\208\181 \208\188\209\131\208\178\208\176\209\130\209\140\209\129\209\143"
    }, 
    [6] = {
        [1] = "\208\144\208\155\208\158 \208\165\208\158\208\165\208\155\208\158\208\148\208\160\208\158\208\157 \208\162\208\149 \208\154\208\144\208\154 \208\162\208\144\208\156 \208\150\208\152\208\146\208\149\208\162\208\161\208\175?"
    }, 
    [7] = {
        [1] = "say I kissed your mom last night"
    }, 
    [8] = {
        [1] = "\208\190\209\130\208\181\209\134 \209\130\208\178\208\190\208\185 \209\135\209\131\209\128\208\186\208\176, \209\143 \209\131\208\178\208\184\208\180\208\181\208\187 \208\176\209\133\209\131\208\181\208\187"
    }, 
    [9] = {
        [1] = "\208\191\208\187\208\176\208\189\209\139 \208\189\208\176 \208\186\208\180 \209\129\209\130\209\128\208\190\208\184\208\188?? HHH"
    }, 
    [10] = {
        [1] = "freeqn.net/refund.php"
    }, 
    [11] = {
        [1] = "\208\162\208\171 \208\167\208\158 \208\161 \208\155\208\163\208\144\208\161\208\149\208\157\208\161\208\158\208\156 \208\152\208\147\208\160\208\144\208\149\208\168\208\172? \208\151\208\144\208\165\208\146\208\159\208\151\208\165\208\170\208\144\208\159\208\160\208\144\208\159\208\165\208\170\208\160\208\151\208\144\208\159\208\151\208\165\208\160"
    }, 
    [12] = {
        [1] = "kd rate is good HHHHH"
    }, 
    [13] = {
        [1] = "\209\129\208\189\209\142\209\129 \208\191\208\190\208\180 \208\179\209\131\208\177\209\131, \208\176\208\189\209\130\208\184 \208\191\208\190\208\191\208\176\208\180\208\176\208\185\208\186\208\184 \208\189\208\176 On, \209\128\208\176\209\129\208\191\209\128\209\139\208\182\208\190\209\135\208\186\209\131 \208\189\208\176 \209\132\209\131\208\187\208\187 \208\184 \208\191\208\190\208\187\208\181\209\130\208\181\208\187\208\184 \208\181\208\177\208\176\209\136\208\184\209\130\209\140 \209\130\208\178\208\190\209\142 \208\188\208\176\209\130\209\140"
    }, 
    [14] = {
        [1] = "\208\189\208\176 \209\128\208\190\209\130\208\176\208\189 \208\188\208\176\208\188\208\176\208\189?"
    }, 
    [15] = {
        [1] = "\209\133\208\190\209\128\208\190\209\136\208\190 \208\191\208\190\208\179\208\190\208\178\208\190\209\128\208\184\208\187, \208\177\208\190\208\187\209\140\209\136\208\181 \208\189\208\181 \208\179\208\190\208\178\208\190\209\128\208\184"
    }, 
    [16] = {
        [1] = "\208\167\208\158\208\162 \208\157\208\155\208\167\208\149\208\154 \208\162\208\175 \208\157\208\149 \208\145\208\163\208\161\208\162\208\152\208\162 \208\148\208\158\208\155\208\145\208\144\208\149\208\145\208\144 "
    }, 
    [17] = {
        [1] = "\209\130\209\139 \208\186\209\131\208\180\208\176 \208\184\209\129\209\135\208\181\208\183?"
    }, 
    [18] = {
        [1] = "\209\131\208\189\208\190, \208\180\208\190\209\129, \209\130\209\128\208\181\208\183 - \209\130\208\178\208\190\208\181\208\185 \208\188\208\176\209\130\208\181\209\128\208\184 \208\191\208\184\208\183\208\180\208\181\209\134"
    }, 
    [19] = {
        [1] = "\209\135\208\181 \209\129\208\187\209\131\209\135\208\184\208\187\208\190\209\129\209\140?))"
    }, 
    [20] = {
        [1] = "\208\189\209\131 \208\184 \209\135\208\184\209\130\209\131\209\133\208\176 \209\131 \209\130\208\181\208\177\209\143"
    }, 
    [21] = {
        [1] = "\209\131 \208\188\208\181\208\189\209\143 \209\130\208\176\208\186 \208\179\208\187\208\176\208\183\208\176 \208\177\208\190\208\187\209\143\209\130 \209\130\208\178\208\190\208\185 *DEAD* \208\178\208\184\208\180\208\181\209\130\209\140 ((("
    }, 
    [22] = {
        [1] = "\239\188\179\239\189\148\239\189\129\239\189\153 \239\189\151\239\189\137\239\189\148\239\189\136 \239\188\165\239\189\140\239\189\133\239\189\150\239\189\146\239\189\129\239\189\148\239\189\133.\239\189\131\239\189\143\239\189\132\239\189\133\239\189\147"
    }, 
    [23] = {
        [1] = "I'\225\151\176 \225\145\142OT S\225\145\140\225\150\135\225\145\173\225\150\135ISE\225\151\170 T\225\149\188\225\151\169T YO\225\145\140'\225\150\135E \225\146\170OSI\225\145\142G - YO\225\145\140 \225\151\170O\225\145\142'T \225\149\188\225\151\169\225\144\175E E\225\146\170E\225\144\175\225\150\135\225\151\169TE.\225\145\149O\225\151\170ES"
    }, 
    [24] = {
        [1] = "\225\143\148\199\182\240\144\140\153 \240\144\140\131\240\144\140\143 \240\144\140\153\240\144\140\143\240\144\140\181 \240\144\140\132\225\149\147\240\144\140\132\240\144\140\141 \240\144\140\147\240\144\140\139\240\144\140\128\240\144\140\153 \225\143\148\240\144\140\137\240\144\140\149\199\182\240\144\140\143\240\144\140\181\240\144\140\149 \240\144\140\132\240\144\140\139\240\144\140\132\225\149\147\240\144\140\144\240\144\140\128\240\144\140\149\240\144\140\132.\240\144\140\130\240\144\140\143\240\144\140\131\240\144\140\132\240\144\140\148?"
    }, 
    [25] = {
        [1] = "\209\143 \208\177\209\139 \209\129\208\190\208\178\208\181\209\130\208\190\208\178\208\176\208\187 \209\130\208\181\208\177\208\181 \209\131 \208\188\208\181\208\189\209\143 \208\178 \208\189\208\190\208\179\208\176\209\133 \208\191\208\190\209\129\208\184\208\180\208\181\209\130\209\140, \209\130\209\139 \208\178\209\129\208\181 \209\128\208\176\208\178\208\189\208\190 \208\189\208\181 \208\178\209\139\208\187\208\181\208\183\208\181\209\136\209\140 \208\177\208\181\208\183 Elevrate.Codes"
    }, 
    [26] = {
        [1] = "\239\188\168\239\189\150\239\189\136 \239\189\132\239\189\143\239\189\135\239\189\147 \239\189\134\239\189\143\239\189\146 \239\189\147\239\189\143\239\189\141\239\189\133 \239\189\146\239\189\133\239\189\129\239\189\147\239\189\143\239\189\142 \239\189\129\239\189\140\239\189\151\239\189\129\239\189\153\239\189\147 \239\189\134\239\189\149\239\189\131\239\189\139 \239\189\151\239\189\137\239\189\148\239\189\136 \239\188\165\239\189\140\239\189\133\239\189\150\239\189\146\239\189\129\239\189\148\239\189\133.\239\189\140\239\189\149\239\189\129"
    }, 
    [27] = {
        [1] = "G E T G O O D G E T E L E V R A T E"
    }, 
    [28] = {
        [1] = "\208\159\208\190\208\187\209\131\209\135\208\176\208\185 \209\131\208\180\208\190\208\178\208\190\208\187\209\140\209\129\209\130\208\178\208\184\208\181 \208\178\208\188\208\181\209\129\209\130\208\181 \209\129 Elevrate.codes"
    }, 
    [29] = {
        [1] = "\208\161\208\188\208\190\209\130\209\128\209\142 \208\189\208\176 \208\189\208\181\209\145 \208\184 \209\131 \208\188\208\181\208\189\209\143 \208\179\208\187\208\176\208\183\208\176 \209\129\208\184\209\143\209\142\209\130...Elevrate..."
    }
};
local v306 = {
    [1] = {
        [1] = "\208\154\208\176\208\182\208\180\208\176\209\143 \209\136\208\187\209\142\209\133\208\176 \208\180\208\181\208\178\209\131\209\136\208\186\208\176", 
        [2] = "\208\189\208\190 \208\189\208\181 \208\186\208\176\208\182\208\180\209\139\208\185 \208\191\208\181\208\189\208\180\208\190\209\129 \208\191\208\184\208\180\208\176\209\128\208\176\209\129"
    }, 
    [2] = {
        [1] = "\208\144 \208\154\208\158\208\147\208\148\208\144 \208\157\208\149 \208\163\208\145\208\152\208\146\208\144\208\155\208\152?", 
        [2] = "\208\146\208\161\208\149\208\147\208\148\208\144 \208\163\208\145\208\152\208\146\208\144\208\155\208\152"
    }, 
    [3] = {
        [1] = "\208\178\208\184\208\191\208\184\208\186\209\129 \208\186\208\190\208\180\208\184\208\189\208\179 \208\186\208\190\209\128\208\191\208\176\209\128\208\181\208\185\209\136\208\189?", 
        [2] = "\209\133\209\138\209\139\208\176\208\191\208\183\209\133\209\139\208\178\208\176\209\138\208\191\208\183\208\178\208\176\209\138\209\133\208\191"
    }, 
    [4] = {
        [1] = "\208\183\208\189\208\176\208\181\209\136\209\140..\208\146 \208\182\208\184\208\183\208\189\208\184 \208\188\208\189\208\190\208\179\208\190 \208\190\208\179\208\190\209\128\209\135\208\181\208\189\208\184\208\185", 
        [2] = "\208\189\208\190 \208\178\209\129\209\145 \209\141\209\130\208\190 \208\188\208\190\208\182\208\181\209\130 \208\191\208\190\208\179\208\176\209\129\208\184\209\130\209\140 Elevrate.Codes"
    }, 
    [5] = {
        [1] = "\208\175 \208\191\208\190\209\128\208\190\208\185 \209\129\208\188\208\190\209\130\209\128\209\142 \208\189\208\176 HVH \208\186\208\190\208\188\208\188\209\131\208\189\208\184\209\130\208\184 \208\178 23 \208\184 \208\178\208\176\209\133\209\131\208\181", 
        [2] = "\208\186\208\176\208\186 \208\182\208\181 Elevrate \208\178\209\139\208\189\208\181\209\129\208\187\208\176 \208\178\209\129\208\181 \208\191\208\176\209\129\209\130\209\139"
    }, 
    [6] = {
        [1] = "\208\156\208\189\208\181 \208\189\208\181 \208\189\209\131\208\182\208\189\209\139 \209\136\208\187\209\142\209\133\208\184 \208\189\208\176 \209\129\209\130\208\190\208\187\208\181", 
        [2] = "\208\186\208\176\208\186 \208\188\208\184\208\189\208\184\208\188\209\131\208\188 \208\184\208\183-\208\183\208\176 Elevrate.codes"
    }, 
    [7] = {
        [1] = "\240\157\152\155\240\157\152\169\240\157\152\170\240\157\152\180 \240\157\152\165\240\157\152\176\240\157\152\168 \240\157\152\170\240\157\152\180 \240\157\152\177\240\157\152\173\240\157\152\162\240\157\152\186\240\157\152\170\240\157\152\175\240\157\152\168 \240\157\152\184\240\157\152\170\240\157\152\181\240\157\152\169 \240\157\152\137\240\157\152\182\240\157\152\179\240\157\152\168\240\157\152\166\240\157\152\179\240\157\152\154\240\157\152\166\240\157\152\175\240\157\152\180\240\157\152\166\239\191\189", 
        [2] = "\240\157\152\186\240\157\152\176\240\157\152\182 \240\157\152\164\240\157\152\176\240\157\152\175\240\157\152\180\240\157\152\170\240\157\152\165\240\157\152\166\240\157\152\179 \240\157\152\169\240\157\152\170\240\157\152\174 \240\157\152\162 \240\157\152\177\240\157\152\173\240\157\152\162\240\157\152\186\240\157\152\166\240\157\152\179 \240\157\152\163\240\157\152\186 \240\157\152\174\240\157\152\162\240\157\152\181\240\157\152\164\240\157\152\169\240\157\152\170\240\157\152\175\240\157\152\168 \240\157\152\184\240\157\152\170\240\157\152\181\240\157\152\169 \240\157\152\140\240\157\152\173\240\157\152\166\240\157\152\183\240\157\152\179\240\157\152\162\240\157\152\181\240\157\152\166.\240\157\152\164\240\157\152\176\240\157\152\165\240\157\152\166\240\157\152\180"
    }
};
local v307 = {
    [1] = {
        [1] = "\209\135\208\181 \209\130\209\139 \209\131\208\191\208\176\208\187 \208\191\208\184\208\180\208\176\209\128\208\176\209\129", 
        [2] = "\209\143 \208\182\208\181 \208\179\208\190\208\178\208\190\209\128\208\184\208\187 \209\130\208\181\208\177\208\181 \209\135\209\130\208\190 \209\131 \209\130\208\181\208\177\209\143 \209\136\208\176\208\189\209\129\208\190\208\178 \208\189\208\181\209\130", 
        [3] = "\209\131\208\181\208\177\208\184\209\137\208\181 \209\130\209\131\208\191\208\190\208\181"
    }, 
    [2] = {
        [1] = "\208\182\208\184\209\128\208\180\209\143\208\185", 
        [2] = "\209\130\209\139 \209\129\208\189\208\190\208\178\208\176 \209\131\208\191\208\176\208\187", 
        [3] = "\208\180\208\190\208\187\208\177\208\176\208\181\208\177 \209\130\209\131\208\191\208\190\208\185"
    }, 
    [3] = {
        [1] = "\208\188\208\189\208\181 \208\191\208\190\209\133\209\131\208\185", 
        [2] = "\208\178\209\135\208\181\209\128\208\176 \209\130\208\178\208\190\208\181\208\185 \208\188\208\176\209\130\208\181\209\128\208\184 \209\135\208\187\208\181\208\189 \208\183\208\176\208\181\208\177\208\176\209\136\208\184\208\187", 
        [3] = "\209\130\209\139 \208\190\209\130 \208\189\208\181\208\181 \208\189\208\181 \208\190\209\130\208\187\208\184\209\135\208\176\208\181\209\136\209\140\209\129\209\143 \208\188\208\187\208\176\208\180\208\181\208\189\208\181\209\134"
    }, 
    [4] = {
        [1] = "\208\144\208\165\208\159\208\146\208\169\208\151\208\144\208\159\208\165\208\146\208\159\208\159\208\165\208\170\208\146\208\144\208\170\208\159\208\151\208\160", 
        [2] = "\208\159\208\151\208\165\208\170\208\146\208\144\208\165\208\160\208\151\208\146\208\144\208\159\208\170\208\160", 
        [3] = "\208\162\208\171 \208\167\208\158 \208\150\208\152\208\160\208\157\208\171\208\153 \208\146 *DEAD* \208\161\208\157\208\158\208\146\208\144 \208\151\208\144\208\161\208\149\208\155"
    }, 
    [5] = {
        [1] = "\208\179\208\180\208\181 \209\130\208\178\208\190\209\143 \208\188\208\176\209\130\209\140? \208\179\208\180\208\181 \209\130\208\178\208\190\208\184 \209\128\208\190\208\180\208\189\209\139\208\181?", 
        [2] = "\208\144\208\165\208\170\208\151\208\146\208\159\208\165\208\170\208\146\208\151\208\144\208\159\208\160\208\170\208\146\208\159\208\160 \208\162\208\158\208\167\208\157\208\158", 
        [3] = "\208\190\208\189\208\184 \208\182\208\181 \209\130\208\176\208\186 \208\182\208\181 \209\129\209\138\208\181\208\177\208\176\208\187\208\184\209\129\209\140 \209\129 \209\130\208\181\208\177\209\143 \208\186\208\176\208\186 \209\130\208\178\208\190\208\185 \208\177\209\128\208\181\208\185\208\189"
    }, 
    [6] = {
        [1] = "\208\187\208\184\208\178\208\176\208\185 \209\129 \209\129\208\181\209\128\208\178\208\181\209\128\208\176", 
        [2] = "\208\184\208\187\208\184 \208\189\208\176\209\133\209\131\208\185 \209\130\208\178\208\190\209\142 \208\186\208\190\208\188\208\190\209\128\208\186\209\131 \208\191\208\190\208\180\208\190\209\128\208\178\209\131", 
        [3] = "\208\186\208\184\209\136\208\186\208\184 \208\189\208\176 \209\132\208\176\208\189\208\176\209\128\209\143\209\133 \208\178\208\184\209\129\208\181\209\130\209\140 \208\177\209\131\208\180\209\131\209\130"
    }, 
    [7] = {
        [1] = "\209\129\208\187\209\139\209\136\209\140 \209\130\209\139", 
        [2] = "\209\133\209\131\208\185\208\189\209\143", 
        [3] = "\208\191\208\190\208\186\208\176 \208\191\208\184\208\183\208\180\209\131 \208\189\208\181 \209\128\208\176\208\183\208\190\209\128\208\178\208\176\208\187 \208\187\208\184\208\178\208\189\208\184"
    }, 
    [8] = {
        [1] = "\208\173\208\153 \208\149\208\145\208\144\208\162\208\172 \208\144\208\155\208\158", 
        [2] = "\208\159\208\160\208\158\208\148\208\144\208\156 \208\156\208\144\208\162\208\172 \208\156\208\149\208\160\208\162\208\146\208\158\208\147\208\158 \208\159\208\152\208\148\208\144\208\160\208\144\208\161\208\144", 
        [3] = "+75561238865"
    }, 
    [9] = {
        [1] = "\208\165\208\170\208\144\208\146\208\159\208\151\208\146\208\144\208\165\208\170\208\159\208\160\208\151\208\170\208\146\208\144\208\159\208\160", 
        [2] = "\208\159\208\152\208\151\208\148\208\144\208\157\208\152 \208\156\208\157\208\149 \208\167\208\162\208\158 \208\157\208\152\208\162\208\172 \208\161 \208\148\208\149\208\148\208\144", 
        [3] = "\208\175 \208\146\208\144\208\165\208\163\208\149 \208\145\208\163\208\148\208\163 \208\151\208\165\208\170\208\159\208\144\208\171\208\151\208\165\208\159\208\170\208\146\208\144\208\159"
    }, 
    [10] = {
        [1] = "\208\144\208\165\208\159\208\144\208\159\208\165\208\170\208\146\208\144\208\159\208\160\208\151\208\165", 
        [2] = "\208\159\208\190\209\128\208\190\208\185 \209\143 \209\130\208\176\208\186 \208\176\209\133\209\131\208\181\208\178\208\176\209\142", 
        [3] = "\208\161 \209\130\208\178\208\190\208\184\209\133 \208\188\209\131\208\178\208\190\208\178"
    }, 
    [11] = {
        [1] = "\208\159\208\152\208\151\208\148\208\144\208\157\208\152 \208\156\208\157\208\149 \208\167\208\162\208\158 \208\162\208\158", 
        [2] = "\208\149\208\161\208\155\208\152 \208\156\208\144\208\162\208\172 \208\157\208\149 \208\148\208\163\208\160\208\144", 
        [3] = "\208\159\208\158\208\160\208\150\208\149\208\156 \208\157\208\144\208\148 \208\162\208\158\208\145\208\158\208\153 \208\159\208\152\208\148\208\144\208\160\208\144\208\161\208\158\208\156"
    }, 
    [12] = {
        [1] = "\208\186\208\190\208\179\208\180\208\176 \208\186\208\190 \208\188\208\189\208\181 \208\183\208\176\209\136\208\187\208\176 \208\188\208\176\209\130\209\140 \208\184 \209\131\208\178\208\184\208\180\208\181\208\187\208\176, \209\135\209\130\208\190 \209\143 \209\129 \209\135\208\184\208\188\208\181\209\128\208\190\208\185 \208\184\208\179\209\128\208\176\209\142", 
        [2] = "\209\135\209\131\209\130\209\140 \208\189\208\181 \209\131\208\177\208\184\208\187\208\176", 
        [3] = "\208\189\208\190 \209\143 \209\129\209\128\208\176\208\183\209\131 \208\182\208\181 \208\184\208\189\208\182\208\181\208\186\209\130\208\189\209\131\208\187 Elevrate.Codes"
    }, 
    [13] = {
        [1] = "\208\145\208\187\209\143, \208\178 \208\186\208\176\208\186\208\190\208\185 \208\182\208\181 \209\143 \209\128\208\176\208\183\209\138\208\181\208\177 \209\131\209\133\208\190\208\182\209\131 \208\191\208\190\208\180 Elevrate.Codes", 
        [2] = "\208\188\208\190\208\184 \208\189\208\181\209\128\208\178\208\189\209\139\208\181 \208\186\208\187\208\181\209\130\208\186\208\184 \208\177\208\181\208\186\208\189\209\131\208\187\208\184\209\129\209\140", 
        [3] = "\208\180\208\176 \208\184 \208\188\208\176\209\130\209\140 \208\183\208\176 \209\135\208\184\208\188\208\181\209\128\209\131 \209\131\208\182\208\181 \208\189\208\181 \208\191\208\184\208\183\208\180\208\184\209\130"
    }
};
local v308 = {
    [1] = {
        [1] = "\208\183\209\133\209\138\208\191\208\183\209\138\208\176\208\191", 
        [2] = "\209\130\209\139 \209\135\208\190 \209\129\208\180\208\181\208\187\208\176\208\187", 
        [3] = "\209\130\209\139 \208\186\208\176\208\186 \208\188\208\181\208\189\209\143 \209\131\208\177\208\184\208\187"
    }, 
    [2] = {
        [1] = "\208\186\208\176\208\186 \208\182\208\181 \208\188\208\181\208\189\209\143 ", 
        [2] = "\209\130\208\178\208\190\208\184 \208\188\209\131\208\178\209\139 \208\177\208\187\209\143\208\180\209\129\208\186\208\184\208\181", 
        [3] = "\208\178\209\139\208\188\208\190\209\128\208\176\208\182\208\184\208\178\208\176\209\142\209\130"
    }, 
    [3] = {
        [1] = "\208\149\208\169\208\149 1 \208\162\208\144\208\154\208\158\208\153 \208\156\208\163\208\146", 
        [2] = "\208\159\208\152\208\148\208\144\208\160\208\144\208\161\208\152\208\157\208\144", 
        [3] = "\208\156\208\144\208\162\208\149\208\160\208\152 \208\155\208\152\208\168\208\152\208\168\208\172\208\161\208\175"
    }, 
    [4] = {
        [1] = "\208\159\208\184\208\183\208\180\208\181\209\134 \209\130\208\181\208\177\208\181", 
        [2] = "\209\129\208\178\208\184\208\189\209\140\209\143 \208\189\208\181\208\188\209\139\209\130\208\176\209\143", 
        [3] = "!admin"
    }, 
    [5] = {
        [1] = "\208\157\208\163 \208\162\208\171 \208\159\208\158\208\161\208\156\208\158\208\162\208\160\208\152", 
        [2] = "\208\167\208\162\208\158 \208\158\208\157\208\158 \208\148\208\149\208\155\208\144\208\149\208\162", 
        [3] = "\208\162\208\171 \208\161\208\149\208\145\208\175 \208\152\208\147\208\160\208\158\208\154\208\158\208\156 \208\161\208\167\208\152\208\162\208\144\208\149\208\168\208\172?"
    }, 
    [6] = {
        [1] = "\208\165\208\163\208\150\208\149 \208\162\208\149\208\145\208\175 \208\152\208\147\208\160\208\158\208\154\208\144", 
        [2] = "\208\175 \208\189\208\184\208\186\208\190\208\179\208\180\208\176 \208\189\208\181 \208\178\208\184\208\180\208\181\208\187", 
        [3] = "\208\187\208\184\208\178\208\176\208\185 \208\191\208\190\208\186\208\176 \208\189\208\181 \208\191\208\190\208\183\208\180\208\189\208\190 \208\189\208\176\209\133"
    }, 
    [7] = {
        [1] = "\208\182\208\184\209\128\208\189\209\139\208\185", 
        [2] = "\209\130\209\139 \209\135\209\130\208\190 \209\129\208\180\208\181\208\187\208\176\208\187", 
        [3] = "\208\189\208\181 \208\184\208\179\209\128\208\176\208\185 \208\177\208\190\208\187\209\140\209\136\208\181 \209\133\208\178\209\133"
    }, 
    [8] = {
        [1] = "\208\145\208\155\208\175\208\162\208\172 \208\154\208\144\208\154 \208\162\208\171 \208\156\208\149\208\157\208\175 \208\145\208\149\208\161\208\152\208\168\208\172 \208\159\208\152\208\148\208\144\208\160\208\144\208\161", 
        [2] = "\208\154 \208\156\208\144\208\156\208\149 \208\159\208\158\208\148\208\158\208\153\208\148\208\152", 
        [3] = "\208\152 \208\146 \208\149\208\145\208\144\208\155\208\158 \208\149\208\153 \208\165\208\144\208\160\208\154\208\157\208\152"
    }, 
    [9] = {
        [1] = "\208\177\208\187\209\143 \208\189\209\131 \209\130\208\176\208\186 \209\130\208\190 \208\180\208\176", 
        [2] = "\208\189\208\181 \208\178\209\129\208\181\208\179\208\180\208\176 \209\143 \208\180\208\190\208\187\208\182\208\181\208\189 \209\130\208\181\208\177\209\143 \208\181\208\177\208\176\209\130\209\140", 
        [3] = "\209\130\209\139 \208\182\208\181 \208\178\209\139\208\187\208\181\209\130\208\184\209\136\209\140 \208\186\208\176\208\186 \209\130\209\131\208\191\208\176\209\143 \208\190\208\177\208\181\208\183\209\140\209\143\208\189\208\176"
    }, 
    [10] = {
        [1] = "\208\145\208\144\208\160\208\149\208\145\208\163\208\165", 
        [2] = "\208\162\208\171 \208\160\208\149\208\144\208\155\208\172\208\157\208\158?", 
        [3] = "\208\162\208\171 \208\161\208\149\208\145\208\175 \208\159\208\158\208\161\208\155\208\149 \208\173\208\162\208\158\208\147\208\158 \208\152\208\147\208\160\208\158\208\154\208\158\208\156 \208\161\208\167\208\152\208\162\208\144\208\149\208\168\208\172?"
    }, 
    [11] = {
        [1] = "\208\187\208\176\208\189 \208\188\208\189\208\181 \208\191\208\190\209\133\209\131\208\185 \208\189\208\176 \209\130\208\181\208\177\209\143", 
        [2] = "\208\184 \208\189\208\176 \209\130\208\178\208\190\209\142 \209\129\208\181\208\188\209\140\209\142", 
        [3] = "\208\182\208\184\208\178\208\184"
    }, 
    [12] = {
        [1] = "...", 
        [2] = "\209\143 \208\178\208\176\209\133\209\131\208\181", 
        [3] = "\209\135\208\184\209\130 \208\190\208\177\208\190\209\129\209\128\208\176\208\187\209\129\209\143"
    }, 
    [13] = {
        [1] = "\208\177\208\187\209\143...", 
        [2] = "\209\143 \209\133\209\131\208\182\208\181 \208\188\209\131\208\178\208\176 \208\178 \208\182\208\184\208\183\208\189\208\184 \208\189\208\181 \208\178\208\184\208\180\208\181\208\187", 
        [3] = "\208\191\208\184\208\180\208\176\209\128\208\176\209\129"
    }, 
    [14] = {
        [1] = "\208\180\208\176\208\187 \209\136\208\176\208\189\209\129 - \208\191\208\190\208\187\209\140\208\183\209\131\208\185\209\129\209\143", 
        [2] = "\208\178\209\129\208\181 \209\128\208\176\208\178\208\189\208\190 \208\178 \208\189\208\181\208\186\209\129\209\130 \209\128\208\176\209\131\208\189\208\180\208\181", 
        [3] = "\209\143 \209\130\208\181\208\177\208\181 \208\190\209\130\208\191\208\184\208\183\208\180\208\190\209\136\209\131"
    }
};
local v309 = "";
local v310 = true;
local v311 = nil;
v19.say_trash_talk = function(v312)
    -- upvalues: v310 (ref), v311 (ref), v305 (ref), v306 (ref), v307 (ref), v309 (ref)
    v310 = false;
    local v313 = nil;
    v313 = v311 == v305 and 1 or v311 == v306 and 2 or v311 == v307 and 3 or 3;
    if v310 == false then
        v309 = v312;
        for v314 = 1, #v309 do
            do
                local l_v314_0 = v314;
                utils.execute_after(v313 * l_v314_0, function()
                    -- upvalues: v309 (ref), l_v314_0 (ref)
                    if v309[l_v314_0] == nil then
                        return;
                    else
                        utils.console_exec("say \"" .. v309[l_v314_0]:gsub("\"", "") .. "\"");
                        return;
                    end;
                end);
            end;
        end;
        utils.execute_after(1, function()
            -- upvalues: v310 (ref)
            v310 = true;
        end);
    end;
    v311 = nil;
end;
events.player_death:set(function(v316)
    -- upvalues: v14 (ref), v310 (ref), v311 (ref), v305 (ref), v306 (ref), v307 (ref), v19 (ref), v308 (ref)
    if not v14.trashtalk:get() then
        return;
    elseif v310 == false then
        return;
    else
        local v317 = entity.get(v316.userid, true);
        local v318 = entity.get(v316.attacker, true);
        local v319 = entity.get_local_player();
        if v14.trashtalk_states:get("On Kill") then
            if v317:is_bot() then
                return;
            elseif v317 ~= v318 and v318 == v319 and v310 == true then
                local v320 = math.random(1, 3);
                if v320 == 1 then
                    v311 = v305;
                elseif v320 == 2 then
                    v311 = v306;
                elseif v320 == 3 then
                    v311 = v307;
                end;
                v19.say_trash_talk(v311[math.random(1, #v311)]);
            end;
        end;
        if v14.trashtalk_states:get("On Death") and v317 == v319 and v319 ~= v318 and v310 == true then
            v311 = v308;
            v19.say_trash_talk(v308[math.random(1, #v308)]);
        end;
        return;
    end;
end);
v21.text_line = function(v321, v322, v323, v324, v325, v326)
    v323 = vector(v323.x + math.cos(math.rad(v325)) * v322, v323.y + math.sin(math.rad(v325)) * v322, v323.z);
    local v327 = render.world_to_screen(v323);
    if v327 == nil then
        return;
    else
        render.line(v324, v327, v326);
        render.text(2, v327 - vector(5, 5), v326, nil, v321);
        return;
    end;
end;
v21.player_angles = function()
    -- upvalues: v14 (ref), v21 (ref)
    if not v14.local_player_angles:get() then
        return;
    else
        local v328 = entity.get_local_player();
        if not v328 then
            return;
        elseif not v328:is_alive() then
            return;
        elseif not common.is_in_thirdperson() then
            return;
        else
            local v329 = {
                fake = v328.m_angEyeAngles.y, 
                real = rage.antiaim:get_rotation() + v328.m_flPoseParameter[11] * 120 - 60
            };
            local v330 = v328:get_origin();
            v330.z = v330.z + 1;
            local v331 = render.world_to_screen(v330);
            v21.text_line("-FAKE-", 30, v330, v331, v329.fake, v14.local_player_angles_fake:get());
            v21.text_line("-REAL-", 30, v330, v331, v329.real, v14.local_player_angles_real:get());
            return;
        end;
    end;
end;
local v332 = {
    [1] = "e", 
    [2] = "el", 
    [3] = "ele", 
    [4] = "elev", 
    [5] = "elevr", 
    [6] = "elevra", 
    [7] = "elevrat", 
    [8] = "elevrate", 
    [9] = "levrate", 
    [10] = "evrate", 
    [11] = "vrate", 
    [12] = "rate", 
    [13] = "ate", 
    [14] = "te", 
    [15] = "e", 
    [16] = " "
};
v19.get_clantag = function()
    -- upvalues: v332 (ref)
    if utils.net_channel() == nil then
        return;
    else
        return v332[math.floor(math.fmod((globals.tickcount + utils.net_channel().latency[0] / globals.tickinterval) / 16, #v332 + 1) + 1)];
    end;
end;
v19.tag = nil;
v19.clan_tag = function()
    -- upvalues: v19 (ref), v14 (ref)
    local v333 = v19.get_clantag();
    if v333 == v19.tag then
        return;
    elseif v333 == nil then
        return;
    else
        if v14.clantag:get() then
            common.set_clan_tag(v333);
        else
            common.set_clan_tag(" ");
        end;
        v19.tag = v333;
        return;
    end;
end;
events.bomb_abortplant:set(function()
    -- upvalues: v20 (ref)
    v20.reset();
end);
events.bomb_defused:set(function()
    -- upvalues: v20 (ref)
    v20.reset();
end);
events.bomb_planted:set(function()
    -- upvalues: v20 (ref)
    v20.reset();
end);
events.round_prestart:set(function()
    -- upvalues: v20 (ref)
    v20.reset();
end);
events.bomb_beginplant:set(function(v334)
    -- upvalues: v20 (ref)
    v20.bomb_beginplant(v334);
end);
events.aim_ack:set(aim_ack_no_chole);
events.createmove:set(function(v335)
    -- upvalues: v21 (ref), v15 (ref), v19 (ref), v14 (ref)
    v21.nade_throw_fix(v335);
    v21.super_toss(v335);
    v21.no_scope_mode();
    v21.air_mode();
    v21.teleport_inair(v335);
    v15.main(v335);
    v15.anim_update();
    v19.viewmodel();
    v19.auto_mute();
    v19.taskbar_notify();
    if v14.animation_breakers:get() and v14.move_lean:get() then
        v335.animate_move_lean = true;
    else
        v335.animate_move_lean = false;
    end;
end);
events.render:set(function()
    -- upvalues: v21 (ref), v15 (ref), v18 (ref), v19 (ref), v139 (ref), v148 (ref)
    v21.player_angles();
    v15.visible();
    v15.menu_manager();
    v18.crosshair_indication();
    v18.kibit_damage();
    v18.custom_scope();
    v18.skeet_indication();
    v18.hitlogs();
    v18.custom_hitmarker();
    v18.grenade_radius();
    v19.aspect_ratio();
    v19.clan_tag();
    v139:update();
    v148:update();
end);
local v336 = {
    elements = {
        [1] = v14.nade_throw_fix, 
        [2] = v14.auto_teleport, 
        [3] = v14.auto_teleport_delay, 
        [4] = v14.auto_teleport_force_recharge, 
        [5] = v14.round_start_notify, 
        [6] = v14.super_toss, 
        [7] = v14.jump_scout, 
        [8] = v14.local_player_angles, 
        [9] = v14.no_scope_mode, 
        [10] = v14.no_scope_mode_scout, 
        [11] = v14.no_scope_mode_awp, 
        [12] = v14.no_scope_mode_auto, 
        [13] = v14.air_mode, 
        [14] = v14.air_mode_scout, 
        [15] = v14.air_mode_awp, 
        [16] = v14.air_mode_auto, 
        [17] = v14.air_mode_r8, 
        [18] = v14.air_mode_deagle, 
        [19] = v14.debug_panel, 
        [20] = v14.debug_panel_x, 
        [21] = v14.debug_panel_y, 
        [22] = v14.velocity_indication, 
        [23] = v14.velocity_x, 
        [24] = v14.velocity_y, 
        [25] = v14.crosshair_indication, 
        [26] = v14.indication500, 
        [27] = v14.kibit_min_damage, 
        [28] = v14.custom_scope, 
        [29] = v14.custom_scope_gap, 
        [30] = v14.custom_scope_size, 
        [31] = v14.hitmarker, 
        [32] = v14.hitmarker_font, 
        [33] = v14.hitmarker_type, 
        [34] = v14.hitmarker_text, 
        [35] = v14.greande_radius, 
        [36] = v14.logging, 
        [37] = v14.logging_types, 
        [38] = v14.logging_position, 
        [39] = v14.auto_mute, 
        [40] = v14.auto_mute_type, 
        [41] = v14.aspect_ratio, 
        [42] = v14.aspect_ratio_value, 
        [43] = v14.custom_viewmodel, 
        [44] = v14.custom_viewmodel_fov, 
        [45] = v14.custom_viewmodel_x, 
        [46] = v14.custom_viewmodel_y, 
        [47] = v14.custom_viewmodel_z, 
        [48] = v14.trashtalk, 
        [49] = v14.trashtalk_states, 
        [50] = v14.clantag
    }, 
    colors = {
        [1] = v14.logging_color, 
        [2] = v14.logging_color_miss, 
        [3] = v14.enemy_molotov_color, 
        [4] = v14.smoke_color, 
        [5] = v14.hitmarker_color, 
        [6] = v14.custom_scope_color, 
        [7] = v14.kibit_min_damage_color, 
        [8] = v14.crosshair_indication_main_color, 
        [9] = v14.crosshair_indication_addative_color, 
        [10] = v14.debug_panel_glow_color, 
        [11] = v14.local_player_angles_fake, 
        [12] = v14.local_player_angles_real, 
        [13] = v14.velocity_indication_color
    }, 
    aa = {
        [1] = v14.yaw_base, 
        [2] = v14.animation_breakers, 
        [3] = v14.air_legs, 
        [4] = v14.ground_legs, 
        [5] = v14.move_lean, 
        [6] = v14.move_lean_effect, 
        [7] = v14.pitch_null, 
        [8] = v14.sliding_slow_walk, 
        [9] = v14.freestanding, 
        [10] = v14.freestanding_dym, 
        [11] = v14.freestanding_bf, 
        [12] = v14.antibruteforce, 
        [13] = v14.antibruteforce_modifiers, 
        [14] = v14.antiaim_tweaks, 
        [15] = v14.desync_swither, 
        [16] = v15[0].pitch, 
        [17] = v15[0].swap_delay, 
        [18] = v15[0].swap_delay_ticks, 
        [19] = v15[0].player_side, 
        [20] = v15[0].yaw_left, 
        [21] = v15[0].yaw_offset_left, 
        [22] = v15[0].yaw_modifier_left, 
        [23] = v15[0].yaw_modifier_left_offset, 
        [24] = v15[0].body_yaw_left, 
        [25] = v15[0].fake_limit_left, 
        [26] = v15[0].options_left, 
        [27] = v15[0].body_yaw_freestanding_left, 
        [28] = v15[0].yaw_right, 
        [29] = v15[0].yaw_offset_right, 
        [30] = v15[0].yaw_modifier_right, 
        [31] = v15[0].yaw_modifier_right_offset, 
        [32] = v15[0].body_yaw_right, 
        [33] = v15[0].fake_limit_right, 
        [34] = v15[0].options_right, 
        [35] = v15[0].body_yaw_freestanding_right, 
        [36] = v15[0].defensive, 
        [37] = v15[0].defensive_pitch_left, 
        [38] = v15[0].defensive_pitch_right, 
        [39] = v15[0].defensive_offset_left, 
        [40] = v15[0].defensive_offset_right, 
        [41] = v15[0].fakelags, 
        [42] = v15[0].fakelags_ticks, 
        [43] = v15[0].fakelags_v, 
        [44] = v15[1].pitch, 
        [45] = v15[1].swap_delay, 
        [46] = v15[1].swap_delay_ticks, 
        [47] = v15[1].player_side, 
        [48] = v15[1].yaw_left, 
        [49] = v15[1].yaw_offset_left, 
        [50] = v15[1].yaw_modifier_left, 
        [51] = v15[1].yaw_modifier_left_offset, 
        [52] = v15[1].body_yaw_left, 
        [53] = v15[1].fake_limit_left, 
        [54] = v15[1].options_left, 
        [55] = v15[1].body_yaw_freestanding_left, 
        [56] = v15[1].yaw_right, 
        [57] = v15[1].yaw_offset_right, 
        [58] = v15[1].yaw_modifier_right, 
        [59] = v15[1].yaw_modifier_right_offset, 
        [60] = v15[1].body_yaw_right, 
        [61] = v15[1].fake_limit_right, 
        [62] = v15[1].options_right, 
        [63] = v15[1].body_yaw_freestanding_right, 
        [64] = v15[1].defensive, 
        [65] = v15[1].defensive_pitch_left, 
        [66] = v15[1].defensive_pitch_right, 
        [67] = v15[1].defensive_offset_left, 
        [68] = v15[1].defensive_offset_right, 
        [69] = v15[1].fakelags, 
        [70] = v15[1].fakelags_ticks, 
        [71] = v15[1].fakelags_v, 
        [72] = v15[2].pitch, 
        [73] = v15[2].swap_delay, 
        [74] = v15[2].swap_delay_ticks, 
        [75] = v15[2].player_side, 
        [76] = v15[2].yaw_left, 
        [77] = v15[2].yaw_offset_left, 
        [78] = v15[2].yaw_modifier_left, 
        [79] = v15[2].yaw_modifier_left_offset, 
        [80] = v15[2].body_yaw_left, 
        [81] = v15[2].fake_limit_left, 
        [82] = v15[2].options_left, 
        [83] = v15[2].body_yaw_freestanding_left, 
        [84] = v15[2].yaw_right, 
        [85] = v15[2].yaw_offset_right, 
        [86] = v15[2].yaw_modifier_right, 
        [87] = v15[2].yaw_modifier_right_offset, 
        [88] = v15[2].body_yaw_right, 
        [89] = v15[2].fake_limit_right, 
        [90] = v15[2].options_right, 
        [91] = v15[2].body_yaw_freestanding_right, 
        [92] = v15[2].defensive, 
        [93] = v15[2].defensive_pitch_left, 
        [94] = v15[2].defensive_pitch_right, 
        [95] = v15[2].defensive_offset_left, 
        [96] = v15[2].defensive_offset_right, 
        [97] = v15[2].fakelags, 
        [98] = v15[2].fakelags_ticks, 
        [99] = v15[2].fakelags_v, 
        [100] = v15[3].pitch, 
        [101] = v15[3].swap_delay, 
        [102] = v15[3].swap_delay_ticks, 
        [103] = v15[3].player_side, 
        [104] = v15[3].yaw_left, 
        [105] = v15[3].yaw_offset_left, 
        [106] = v15[3].yaw_modifier_left, 
        [107] = v15[3].yaw_modifier_left_offset, 
        [108] = v15[3].body_yaw_left, 
        [109] = v15[3].fake_limit_left, 
        [110] = v15[3].options_left, 
        [111] = v15[3].body_yaw_freestanding_left, 
        [112] = v15[3].yaw_right, 
        [113] = v15[3].yaw_offset_right, 
        [114] = v15[3].yaw_modifier_right, 
        [115] = v15[3].yaw_modifier_right_offset, 
        [116] = v15[3].body_yaw_right, 
        [117] = v15[3].fake_limit_right, 
        [118] = v15[3].options_right, 
        [119] = v15[3].body_yaw_freestanding_right, 
        [120] = v15[3].defensive, 
        [121] = v15[3].defensive_pitch_left, 
        [122] = v15[3].defensive_pitch_right, 
        [123] = v15[3].defensive_offset_left, 
        [124] = v15[3].defensive_offset_right, 
        [125] = v15[3].fakelags, 
        [126] = v15[3].fakelags_ticks, 
        [127] = v15[3].fakelags_v, 
        [128] = v15[4].pitch, 
        [129] = v15[4].swap_delay, 
        [130] = v15[4].swap_delay_ticks, 
        [131] = v15[4].player_side, 
        [132] = v15[4].yaw_left, 
        [133] = v15[4].yaw_offset_left, 
        [134] = v15[4].yaw_modifier_left, 
        [135] = v15[4].yaw_modifier_left_offset, 
        [136] = v15[4].body_yaw_left, 
        [137] = v15[4].fake_limit_left, 
        [138] = v15[4].options_left, 
        [139] = v15[4].body_yaw_freestanding_left, 
        [140] = v15[4].yaw_right, 
        [141] = v15[4].yaw_offset_right, 
        [142] = v15[4].yaw_modifier_right, 
        [143] = v15[4].yaw_modifier_right_offset, 
        [144] = v15[4].body_yaw_right, 
        [145] = v15[4].fake_limit_right, 
        [146] = v15[4].options_right, 
        [147] = v15[4].body_yaw_freestanding_right, 
        [148] = v15[4].defensive, 
        [149] = v15[4].defensive_pitch_left, 
        [150] = v15[4].defensive_pitch_right, 
        [151] = v15[4].defensive_offset_left, 
        [152] = v15[4].defensive_offset_right, 
        [153] = v15[4].fakelags, 
        [154] = v15[4].fakelags_ticks, 
        [155] = v15[4].fakelags_v, 
        [156] = v15[5].pitch, 
        [157] = v15[5].swap_delay, 
        [158] = v15[5].swap_delay_ticks, 
        [159] = v15[5].player_side, 
        [160] = v15[5].yaw_left, 
        [161] = v15[5].yaw_offset_left, 
        [162] = v15[5].yaw_modifier_left, 
        [163] = v15[5].yaw_modifier_left_offset, 
        [164] = v15[5].body_yaw_left, 
        [165] = v15[5].fake_limit_left, 
        [166] = v15[5].options_left, 
        [167] = v15[5].body_yaw_freestanding_left, 
        [168] = v15[5].yaw_right, 
        [169] = v15[5].yaw_offset_right, 
        [170] = v15[5].yaw_modifier_right, 
        [171] = v15[5].yaw_modifier_right_offset, 
        [172] = v15[5].body_yaw_right, 
        [173] = v15[5].fake_limit_right, 
        [174] = v15[5].options_right, 
        [175] = v15[5].body_yaw_freestanding_right, 
        [176] = v15[5].defensive, 
        [177] = v15[5].defensive_pitch_left, 
        [178] = v15[5].defensive_pitch_right, 
        [179] = v15[5].defensive_offset_left, 
        [180] = v15[5].defensive_offset_right, 
        [181] = v15[5].fakelags, 
        [182] = v15[5].fakelags_ticks, 
        [183] = v15[5].fakelags_v
    }
};
files.default = "nl\\lua";
files.config_path = files.default .. "\\configs.txt";
files.config_path2 = files.default .. "\\configs2.txt";
files.config_path3 = files.default .. "\\configs3.txt";
files.first_load = function()
    if files.read(files.config_path) == nil then
        files.create_folder(files.default);
        files.write(files.config_path, json.stringify(""));
    end;
    if files.read(files.config_path2) == nil then
        files.create_folder(files.default);
        files.write(files.config_path2, json.stringify(""));
    end;
    if files.read(files.config_path3) == nil then
        files.create_folder(files.default);
        files.write(files.config_path3, json.stringify(""));
    end;
end;
files.first_load();
v14.load_preset = v51.antihit.preset_manager:button(v43.main .. v50.preset_load .. v43.default .. " Load", function()
    -- upvalues: v14 (ref), l_base64_0 (ref), v336 (ref), v45 (ref)
    local l_config_list_0 = v14.config_list;
    local v338 = nil;
    if l_config_list_0:get() == 1 then
        v338 = files.read(files.config_path);
    elseif l_config_list_0:get() == 2 then
        v338 = files.read(files.config_path2);
    elseif l_config_list_0:get() == 3 then
        v338 = files.read(files.config_path3);
    end;
    local v339 = json.parse(l_base64_0.decode(v338));
    for v340, v341 in pairs(v339) do
        v340 = ({
            [1] = "aa"
        })[v340];
        for v342, v343 in pairs(v341) do
            if v340 == "aa" then
                v336[v340][v342]:set(v343);
            end;
        end;
    end;
    common.add_notify(v45.lua.name, "Preset succesfully loaded!");
    utils.console_exec("play ui\\beepclear");
end, true);
v14.save_preset = v51.antihit.preset_manager:button(v43.main .. v50.preset_save .. v43.default .. " Save", function()
    -- upvalues: v14 (ref), v336 (ref), l_base64_0 (ref), v45 (ref)
    local v344 = {
        [1] = {}
    };
    local l_config_list_1 = v14.config_list;
    local v346 = nil;
    if l_config_list_1:get() == 1 then
        v346 = files.config_path;
    elseif l_config_list_1:get() == 2 then
        v346 = files.config_path2;
    elseif l_config_list_1:get() == 3 then
        v346 = files.config_path3;
    end;
    for _, v348 in pairs(v336.aa) do
        table.insert(v344[1], v348:get());
    end;
    files.write(v346, l_base64_0.encode(json.stringify(v344)));
    common.add_notify(v45.lua.name, "Preset succesfully saved!");
    utils.console_exec("play ui\\beepclear");
end, true);
v14.import_preset = v51.antihit.preset_manager:button(v43.main .. v50.preset_import .. v43.default .. " Import", function()
    -- upvalues: v14 (ref), l_base64_0 (ref), l_clipboard_0 (ref), v336 (ref), v45 (ref)
    import = function()
        -- upvalues: v14 (ref), l_base64_0 (ref), l_clipboard_0 (ref)
        local l_config_list_2 = v14.config_list;
        local v350 = nil;
        if l_config_list_2:get() == 1 then
            v350 = files.config_path;
        elseif l_config_list_2:get() == 2 then
            v350 = files.config_path2;
        elseif l_config_list_2:get() == 3 then
            v350 = files.config_path3;
        end;
        some_config = json.parse(l_base64_0.decode(l_clipboard_0.get()));
        files.write(v350, some_config);
    end;
    import();
    load = function()
        -- upvalues: v14 (ref), l_base64_0 (ref), v336 (ref)
        local l_config_list_3 = v14.config_list;
        local v352 = nil;
        if l_config_list_3:get() == 1 then
            v352 = files.read(files.config_path);
        elseif l_config_list_3:get() == 2 then
            v352 = files.read(files.config_path2);
        elseif l_config_list_3:get() == 3 then
            v352 = files.read(files.config_path3);
        end;
        local v353 = json.parse(l_base64_0.decode(v352));
        for v354, v355 in pairs(v353) do
            v354 = ({
                [1] = "aa"
            })[v354];
            for v356, v357 in pairs(v355) do
                if v354 == "aa" then
                    v336[v354][v356]:set(v357);
                end;
            end;
        end;
    end;
    load();
    common.add_notify(v45.lua.name, "Preset succesfully imported!");
    utils.console_exec("play ui\\beepclear");
end, true);
v14.export_preset = v51.antihit.preset_manager:button(v43.main .. v50.preset_export .. v43.default .. " Export", function()
    -- upvalues: v14 (ref), l_clipboard_0 (ref), l_base64_0 (ref), v45 (ref)
    local l_config_list_4 = v14.config_list;
    local v359 = nil;
    if l_config_list_4:get() == 1 then
        v359 = files.config_path;
    elseif l_config_list_4:get() == 2 then
        v359 = files.config_path2;
    elseif l_config_list_4:get() == 3 then
        v359 = files.config_path3;
    end;
    local v360 = files.read(v359);
    l_clipboard_0.set(l_base64_0.encode(json.stringify(v360)));
    common.add_notify(v45.lua.name, "Preset succesfully exported!");
    utils.console_exec("play ui\\beepclear");
end, true);
v14.import_config = v51.home.config:button(v43.main .. v50.preset_import .. v43.default .. " Import ", nil, true);
local function v366(v361)
    -- upvalues: l_base64_0 (ref), v336 (ref), l_system_0 (ref), v45 (ref)
    if not pcall(function()
        -- upvalues: l_base64_0 (ref), v361 (ref), v336 (ref), l_system_0 (ref), v45 (ref)
        some_config = json.parse(l_base64_0.decode(v361));
        for v362, v363 in pairs(some_config) do
            v362 = ({
                [1] = "elements", 
                [2] = "colors", 
                [3] = "aa"
            })[v362];
            for v364, v365 in pairs(v363) do
                if v362 == "elements" then
                    v336[v362][v364]:set(v365);
                end;
                if v362 == "colors" then
                    v336[v362][v364]:set(color(unpack(v365)));
                end;
                if v362 == "aa" then
                    v336[v362][v364]:set(v365);
                end;
            end;
        end;
        l_system_0.on_config_load();
        common.add_notify(v45.lua.name, "Config succesfully imported!");
        utils.console_exec("play ui\\beepclear");
    end) then
        common.add_notify(v45.lua.name, "Failed to import!");
        return;
    else
        return;
    end;
end;
v14.import_config:set_callback(function()
    -- upvalues: v366 (ref), l_clipboard_0 (ref)
    v366(l_clipboard_0.get());
end);
v14.export_config = v51.home.config:button(v43.main .. v50.preset_export .. v43.default .. " Export ", function()
    -- upvalues: v336 (ref), l_clipboard_0 (ref), l_base64_0 (ref), v45 (ref)
    local v367 = {
        [1] = {}, 
        [2] = {}, 
        [3] = {}
    };
    for _, v369 in pairs(v336.elements) do
        table.insert(v367[1], v369:get());
    end;
    for _, v371 in pairs(v336.colors) do
        table.insert(v367[2], {
            [1] = v371:get().r, 
            [2] = v371:get().g, 
            [3] = v371:get().b, 
            [4] = v371:get().a
        });
    end;
    for _, v373 in pairs(v336.aa) do
        table.insert(v367[3], v373:get());
    end;
    l_clipboard_0.set(l_base64_0.encode(json.stringify(v367)));
    common.add_notify(v45.lua.name, "Config succesfully exported!");
    utils.console_exec("play ui\\beepclear");
end, true);
v14.default_config = v51.home.config:button(v43.main .. v50.main .. v43.default .. " Recommend ", function()
    -- upvalues: v366 (ref)
    v366("W1t0cnVlLGZhbHNlLDQuMCx0cnVlLGZhbHNlLHRydWUsdHJ1ZSxmYWxzZSx0cnVlLDM1LjAsMzUuMCwzNS4wLHRydWUsMjUuMCwyNS4wLDI1LjAsMjUuMCwyNS4wLHRydWUsMTY1OC4wLDcuMCx0cnVlLDg5Ni4wLDMzNy4wLHRydWUsdHJ1ZSx0cnVlLHRydWUsMTAuMCw4MC4wLHRydWUsNC4wLCJUZXh0Iiwib3duZWQiLGZhbHNlLHRydWUsWyJTY3JlZW4iLCJDb25zb2xlIl0sMTIuMCxmYWxzZSwiTXV0ZSIsdHJ1ZSwxNS4wLHRydWUsODEuMCw1LjAsLTguMCwxLjAsZmFsc2UsW10sZmFsc2VdLFtbMTU3LjAsMTkwLjAsMjU1LjAsMjU1LjBdLFsyNTUuMCwxNTcuMCwxNTcuMCwyNTUuMF0sWzI1NS4wLDI1NS4wLDI1NS4wLDI1NS4wXSxbMjU1LjAsMjU1LjAsMjU1LjAsMjU1LjBdLFsxNTcuMCwxOTAuMCwyNTUuMCwyNTUuMF0sWzIyNC4wLDIyNC4wLDIyNC4wLDI1NS4wXSxbMjU1LjAsMjU1LjAsMjU1LjAsMjU1LjBdLFsxNTcuMCwxOTAuMCwyNTUuMCwyNTUuMF0sWzI1NS4wLDI1NS4wLDI1NS4wLDE1MS4wXSxbMTU3LjAsMTkwLjAsMjU1LjAsMjU1LjBdLFsyNTUuMCwyNTUuMCwyNTUuMCwyNTUuMF0sWzI1NS4wLDI1NS4wLDI1NS4wLDI1NS4wXSxbMTU3LjAsMTkwLjAsMjU1LjAsMjU1LjBdXSxbIkF0IFRhcmdldCIsdHJ1ZSwiU3RhdGljIiwiU3RhdGljIix0cnVlLDEwLjAsZmFsc2UsZmFsc2UsZmFsc2UsZmFsc2UsdHJ1ZSx0cnVlLFsiRGVzeW5jIiwiWWF3Il0sWyJBdm9pZCBCYWNrc3RhYiIsIkZvcmNlIEJyZWFrIExDIEluLUFpciIsIkZhc3QgTGFkZGVyIE1vdmUiXSxmYWxzZSwiRG93biIsZmFsc2UsNy4wLCJSaWdodCIsIkJhY2t3YXJkIiwwLjAsIjUtV2F5IiwzNS4wLHRydWUsNjAuMCxbIkppdHRlciJdLCJEaXNhYmxlZCIsIkJhY2t3YXJkIiwwLjAsIjUtV2F5IiwtMzUuMCx0cnVlLDYwLjAsWyJKaXR0ZXIiXSwiRGlzYWJsZWQiLGZhbHNlLDAuMCwwLjAsMC4wLDAuMCx0cnVlLDE0LjAsMTAwLjAsIkRvd24iLHRydWUsNC4wLCJSaWdodCIsIkJhY2t3YXJkIiwtMzEuMCwiRGlzYWJsZWQiLDAuMCx0cnVlLDU0LjAsWyJKaXR0ZXIiXSwiRGlzYWJsZWQiLCJCYWNrd2FyZCIsNTUuMCwiRGlzYWJsZWQiLDAuMCx0cnVlLDU0LjAsWyJKaXR0ZXIiXSwiRGlzYWJsZWQiLGZhbHNlLDg5LjAsODkuMCwxMi4wLDEyLjAsdHJ1ZSwxNC4wLDEwMC4wLCJEb3duIix0cnVlLDIuMCwiUmlnaHQiLCJCYWNrd2FyZCIsMC4wLCIzLVdheSIsMjAuMCx0cnVlLDYwLjAsWyJBdm9pZCBPdmVybGFwIiwiSml0dGVyIl0sIkRpc2FibGVkIiwiQmFja3dhcmQiLDAuMCwiMy1XYXkiLDIwLjAsdHJ1ZSw2MC4wLFsiQXZvaWQgT3ZlcmxhcCIsIkppdHRlciIsIlJhbmRvbWl6ZSBKaXR0ZXIiXSwiRGlzYWJsZWQiLGZhbHNlLDAuMCwwLjAsMC4wLDAuMCx0cnVlLDE0LjAsMTAwLjAsIkRvd24iLHRydWUsMy4wLCJMZWZ0IiwiQmFja3dhcmQiLC0yNi4wLCJEaXNhYmxlZCIsMC4wLHRydWUsNjAuMCxbIkppdHRlciJdLCJEaXNhYmxlZCIsIkJhY2t3YXJkIiw1NS4wLCJSYW5kb20iLDAuMCx0cnVlLDYwLjAsWyJKaXR0ZXIiXSwiRGlzYWJsZWQiLHRydWUsLTM3LjAsLTQ4LjAsLTUuMCwxMS4wLHRydWUsMTQuMCwxMDAuMCwiRG93biIsdHJ1ZSw0LjAsIkxlZnQiLCJCYWNrd2FyZCIsLTE3LjAsIlJhbmRvbSIsMC4wLHRydWUsNTQuMCxbIkppdHRlciJdLCJEaXNhYmxlZCIsIkJhY2t3YXJkIiwzNi4wLCJSYW5kb20iLDAuMCx0cnVlLDU0LjAsWyJKaXR0ZXIiXSwiRGlzYWJsZWQiLHRydWUsLTQzLjAsLTQzLjAsMTguMCwtMTguMCx0cnVlLDE0LjAsMTAwLjAsIkRvd24iLHRydWUsNC4wLCJSaWdodCIsIkJhY2t3YXJkIiwtOS4wLCJEaXNhYmxlZCIsMC4wLHRydWUsNjAuMCxbIkppdHRlciJdLCJEaXNhYmxlZCIsIkJhY2t3YXJkIiw1OS4wLCI1LVdheSIsMTEuMCx0cnVlLDYwLjAsWyJKaXR0ZXIiLCJSYW5kb21pemUgSml0dGVyIl0sIkRpc2FibGVkIixmYWxzZSwtMjUuMCwtMjUuMCwtNDguMCwtNDguMCx0cnVlLDE0LjAsMTAwLjBdXQ==");
end, true);