local l_mtools_0 = require("neverlose/mtools");
local l_yaw_0 = require("neverlose/edge_yaw");
local l_system_0 = require("neverlose/drag_system");
local l_clipboard_0 = require("neverlose/clipboard");
local l_gradient_0 = require("neverlose/gradient");
local l_base64_0 = require("neverlose/base64");
ffi.cdef("    typedef struct {\n        char  pad_0000[20];\n        int m_nOrder;\n        int m_nSequence;\n        float m_flPrevCycle;\n        float m_flWeight;\n        float m_flWeightDeltaRate;\n        float m_flPlaybackRate;\n        float m_flCycle;\n        void *m_pOwner;\n        char  pad_0038[4];\n    } animstate_layer_t;\n");
local _ = ffi.typeof("uintptr_t**");
local v7 = utils.get_vfunc("client.dll", "VClientEntityList003", 3, "void*(__thiscall*)(void*, int)");
local v8 = l_gradient_0.text_animate("MeowStar", -0.7, {
    color(128, 128, 128), 
    color(255, 255, 255)
});
events.render:set(function(_)
    -- upvalues: v8 (ref)
    sidebar = ui.sidebar(v8:get_animated_text(), "shield-cat");
    v8:animate();
end);
ui.sidebar("\a{Link Active}" .. "\aA4A497C8MeowStar", "shield-cat");
local v10 = ui.create(ui.get_icon("file-circle-info"), " ");
local v11 = ui.create(ui.get_icon("file-circle-info"), "  ");
local v12 = ui.create(ui.get_icon("file-circle-info"), "");
local v13 = ui.create(ui.get_icon("user-shield"), "State");
local v14 = ui.create(ui.get_icon("user-shield"), "Builder");
local v15 = ui.create(ui.get_icon("user-shield"), "Tweaks");
local v16 = ui.create(ui.get_icon("user-shield"), "");
local v17 = ui.create(ui.get_icon("gear"), "  ");
local v18 = ui.create(ui.get_icon("gear"), " ");
local v19 = ui.create(ui.get_icon("gear"), "");
local v20 = ui.create(ui.get_icon("gear"), "   ");
local v21 = {
    [1] = "Static", 
    [2] = "Jitter", 
    [3] = "Walking"
};
local v23 = v19:slider("\a{Link Active}" .. ui.get_icon("person-walking") .. "\aFFFFFFFF Walking", 1, 3, 1, nil, function(v22)
    -- upvalues: v21 (ref)
    return v21[v22];
end);
local v25 = v19:slider("\a{Link Active}" .. ui.get_icon("plane") .. "\aFFFFFFFF Air", 1, 3, 1, nil, function(v24)
    -- upvalues: v21 (ref)
    return v21[v24];
end);
local v26 = v19:selectable("\a{Link Active}" .. ui.get_icon("puzzle-piece") .. "\aFFFFFFFF Addons", {
    [1] = "Pitch 0 On Land", 
    [2] = "Move Lean", 
    [3] = "Earth Quake", 
    [4] = "Kangaroo"
});
local function v30(v27, v28, v29)
    return v27 + (v28 - v27) * math.min(math.max(v29, 0), 1);
end;
local function v32(v31)
    return tonumber(v31:string());
end;
local _ = v10:list("", "\a{Link Active}" .. ui.get_icon("user") .. " \aFFFFFFFFAbout");
v10:label(ui.get_icon("circle-info") .. " The script is a work in progress. If you find a bug, please create a ticket on the Discord server!");
v12:label("                                    MeowStar\194\174");
v10:label("                                                              Support");
v10:button(ui.get_icon("discord"), function()
    panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://discord.gg/e3Dhtuj98H");
end, true);
v10:label("                                      Other Scripts");
v10:button(ui.get_icon("star") .. " Lonely", function()
    panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://neverlose.cc/market/item?id=Z4bM1q");
end, true);
local v34 = v13:list("", {
    [1] = "\a{Link Active}" .. ui.get_icon("globe") .. " \aFFFFFFFFGlobal", 
    [2] = "\a{Link Active}" .. ui.get_icon("person") .. " \aFFFFFFFFStanding", 
    [3] = "\a{Link Active}" .. ui.get_icon("person-running") .. " \aFFFFFFFFRunning", 
    [4] = "\a{Link Active}" .. ui.get_icon("turtle") .. " \aFFFFFFFFSlowing", 
    [5] = "\a{Link Active}" .. ui.get_icon("wheelchair") .. " \aFFFFFFFFCrouching", 
    [6] = "\a{Link Active}" .. ui.get_icon("wheelchair-move") .. " \aFFFFFFFFSneaking", 
    [7] = "\a{Link Active}" .. ui.get_icon("plane-departure") .. " \aFFFFFFFFAir", 
    [8] = "\a{Link Active}" .. ui.get_icon("plane") .. " \aFFFFFFFFAir Crouching", 
    [9] = "\a{Link Active}" .. ui.get_icon("rotate") .. " \aFFFFFFFFFreestanding"
});
local v35 = {
    [1] = "Off", 
    [2] = "2t", 
    [3] = "3t", 
    [4] = "4t", 
    [5] = "5t", 
    [6] = "6t", 
    [7] = "7t", 
    [8] = "8t", 
    [9] = "9t", 
    [10] = "10t"
};
local v45 = {
    [1] = {
        yaw_combo = v14:combo("\a{Link Active}" .. ui.get_icon("layer-group") .. " \aFFFFFFFF Yaw", {
            [1] = "180", 
            [2] = "Delayed"
        }), 
        yaw_add = v14:slider("\a{Link Active}" .. ui.get_icon("layer-plus") .. " \aFFFFFFFF Yaw Add", -180, 180, 0, nil, "\194\176"), 
        yaw_add_gl = v14:slider("\a{Link Active}" .. ui.get_icon("layer-plus") .. " \aFFFFFFFF Yaw Add", -180, 180, 0, nil, "\194\176"), 
        yaw_left = v14:slider("\a{Link Active}" .. ui.get_icon("layer-plus") .. " \aFFFFFFFF Yaw Add Left", -180, 180, 0, nil, "\194\176"), 
        yaw_right = v14:slider("\a{Link Active}" .. ui.get_icon("layer-minus") .. " \aFFFFFFFF Yaw Add Right", -180, 180, 0, nil, "\194\176"), 
        delay_ticks = v14:slider("\a{Link Active}" .. ui.get_icon("clock") .. " \aFFFFFFFF Delay Ticks", 1, 10, 1, nil, function(v36)
            -- upvalues: v35 (ref)
            return v35[v36];
        end), 
        randomize_yaw = v14:slider("\a{Link Active}" .. ui.get_icon("shuffle") .. " \aFFFFFFFF Randomize yaw", 0, 180, 0, nil, "\194\176"), 
        yaw_modifier = v14:combo("\a{Link Active}" .. ui.get_icon("layer-group") .. " \aFFFFFFFF Yaw Modifier", {
            [1] = "Disabled", 
            [2] = "Center", 
            [3] = "Offset", 
            [4] = "Random", 
            [5] = "Spin", 
            [6] = "3-Way", 
            [7] = "5-Way"
        }), 
        yaw_offset = v14:slider("\a{Link Active}" .. ui.get_icon("layer-plus") .. " \aFFFFFFFF Yaw Offset", -180, 180, 0, nil, "\194\176"), 
        body_yaw_limit = v14:slider("\a{Link Active}" .. ui.get_icon("gauge-max") .. " \aFFFFFFFF Body Yaw Limit", 0, 60, 0, nil, "\194\176"), 
        body_yaw_options = v14:selectable("\a{Link Active}" .. ui.get_icon("option") .. " \aFFFFFFFF Body Yaw Options", {
            [1] = "Jitter"
        }), 
        break_lc = v16:combo("\a{Link Active}" .. ui.get_icon("bone-break") .. " \aFFFFFFFF Break LC", {
            [1] = "On Peek", 
            [2] = "Always On"
        }), 
        defensive_snap = v16:switch("\a{Link Active}" .. ui.get_icon("user-secret") .. " \aFFFFFFFF Defensive Snap"), 
        defensive_pitch_combo = v16:combo("\a{Link Active}" .. ui.get_icon("up-down") .. " \aFFFFFFFF Pitch", {
            [1] = "Custom", 
            [2] = "Sway", 
            [3] = "Jitter", 
            [4] = "Random"
        }), 
        defensive_pitch_custom = v16:slider("\a{Link Active}" .. ui.get_icon("layer-group") .. " \aFFFFFFFF Pitch value", -89, 89, 0, nil, "\194\176"), 
        defensive_pitch_1 = v16:slider("\a{Link Active}" .. ui.get_icon("layer-plus") .. " \aFFFFFFFF 1st Pitch", -89, 89, 0, nil, "\194\176"), 
        defensive_pitch_2 = v16:slider("\a{Link Active}" .. ui.get_icon("layer-minus") .. " \aFFFFFFFF 2nd Pitch", -89, 89, 0, nil, "\194\176"), 
        defensive_pitch_delay = v16:slider("\a{Link Active}" .. ui.get_icon("clock") .. " \aFFFFFFFF Delay", 1, 10, 1, nil, "t"), 
        defensive_group_yaw_combo = v16:combo("\a{Link Active}" .. ui.get_icon("left-right") .. " \aFFFFFFFF Yaw", {
            [1] = "Custom", 
            [2] = "Spin", 
            [3] = "Jitter", 
            [4] = "Smooth", 
            [5] = "Random"
        }), 
        defensive_yaw_custom = v16:slider("\a{Link Active}" .. ui.get_icon("layer-group") .. " \aFFFFFFFF Yaw value", -180, 180, 0, nil, "\194\176"), 
        defensive_yaw_1 = v16:slider("\a{Link Active}" .. ui.get_icon("layer-plus") .. " \aFFFFFFFF 1st Yaw", -180, 180, 0, nil, "\194\176"), 
        defensive_yaw_2 = v16:slider("\a{Link Active}" .. ui.get_icon("layer-minus") .. " \aFFFFFFFF 2nd Yaw", -180, 180, 0, nil, "\194\176"), 
        defensive_yaw_3 = v16:slider("\a{Link Active}" .. ui.get_icon("layer-minus") .. " \aFFFFFFFF Spin Speed", 1, 100, 1, nil, "%"), 
        defensive_yaw_delay = v16:slider("\a{Link Active}" .. ui.get_icon("clock") .. " \aFFFFFFFF Delay", 1, 10, 1, nil, "t")
    }, 
    [2] = {
        allow_switch = v14:switch("\a{Link Active}" .. "Allow \aFFFFFFFFStanding"), 
        yaw_combo = v14:combo("\a{Link Active}" .. ui.get_icon("layer-group") .. " \aFFFFFFFF Yaw", {
            [1] = "180", 
            [2] = "Delayed"
        }), 
        yaw_add = v14:slider("\a{Link Active}" .. ui.get_icon("layer-plus") .. " \aFFFFFFFF Yaw Add", -180, 180, 0, nil, "\194\176"), 
        yaw_add_gl = v14:slider("\a{Link Active}" .. ui.get_icon("layer-plus") .. " \aFFFFFFFF Yaw Add", -180, 180, 0, nil, "\194\176"), 
        yaw_left = v14:slider("\a{Link Active}" .. ui.get_icon("layer-plus") .. " \aFFFFFFFF Yaw Add Left", -180, 180, 0, nil, "\194\176"), 
        yaw_right = v14:slider("\a{Link Active}" .. ui.get_icon("layer-minus") .. " \aFFFFFFFF Yaw Add Right", -180, 180, 0, nil, "\194\176"), 
        delay_ticks = v14:slider("\a{Link Active}" .. ui.get_icon("clock") .. " \aFFFFFFFF Delay Ticks", 1, 10, 1, nil, function(v37)
            -- upvalues: v35 (ref)
            return v35[v37];
        end), 
        randomize_yaw = v14:slider("\a{Link Active}" .. ui.get_icon("shuffle") .. " \aFFFFFFFF Randomize yaw", 0, 180, 0, nil, "\194\176"), 
        yaw_modifier = v14:combo("\a{Link Active}" .. ui.get_icon("layer-group") .. " \aFFFFFFFF Yaw Modifier", {
            [1] = "Disabled", 
            [2] = "Center", 
            [3] = "Offset", 
            [4] = "Random", 
            [5] = "Spin", 
            [6] = "3-Way", 
            [7] = "5-Way"
        }), 
        yaw_offset = v14:slider("\a{Link Active}" .. ui.get_icon("layer-plus") .. " \aFFFFFFFF Yaw Offset", -180, 180, 0, nil, "\194\176"), 
        body_yaw_limit = v14:slider("\a{Link Active}" .. ui.get_icon("gauge-max") .. " \aFFFFFFFF Body Yaw Limit", 0, 60, 0, nil, "\194\176"), 
        body_yaw_options = v14:selectable("\a{Link Active}" .. ui.get_icon("option") .. " \aFFFFFFFF Body Yaw Options", {
            [1] = "Jitter"
        }), 
        break_lc = v16:combo("\a{Link Active}" .. ui.get_icon("bone-break") .. " \aFFFFFFFF Break LC", {
            [1] = "On Peek", 
            [2] = "Always On"
        }), 
        defensive_snap = v16:switch("\a{Link Active}" .. ui.get_icon("user-secret") .. " \aFFFFFFFF Defensive Snap"), 
        defensive_pitch_combo = v16:combo("\a{Link Active}" .. ui.get_icon("up-down") .. " \aFFFFFFFF Pitch", {
            [1] = "Custom", 
            [2] = "Sway", 
            [3] = "Jitter", 
            [4] = "Random"
        }), 
        defensive_pitch_custom = v16:slider("\a{Link Active}" .. ui.get_icon("layer-group") .. " \aFFFFFFFF Pitch value", -89, 89, 0, nil, "\194\176"), 
        defensive_pitch_1 = v16:slider("\a{Link Active}" .. ui.get_icon("layer-plus") .. " \aFFFFFFFF 1st Pitch", -89, 89, 0, nil, "\194\176"), 
        defensive_pitch_2 = v16:slider("\a{Link Active}" .. ui.get_icon("layer-minus") .. " \aFFFFFFFF 2nd Pitch", -89, 89, 0, nil, "\194\176"), 
        defensive_pitch_delay = v16:slider("\a{Link Active}" .. ui.get_icon("clock") .. " \aFFFFFFFF Delay", 1, 10, 1, nil, "t"), 
        defensive_group_yaw_combo = v16:combo("\a{Link Active}" .. ui.get_icon("left-right") .. " \aFFFFFFFF Yaw", {
            [1] = "Custom", 
            [2] = "Spin", 
            [3] = "Jitter", 
            [4] = "Smooth", 
            [5] = "Random"
        }), 
        defensive_yaw_custom = v16:slider("\a{Link Active}" .. ui.get_icon("layer-group") .. " \aFFFFFFFF Yaw value", -180, 180, 0, nil, "\194\176"), 
        defensive_yaw_1 = v16:slider("\a{Link Active}" .. ui.get_icon("layer-plus") .. " \aFFFFFFFF 1st Yaw", -180, 180, 0, nil, "\194\176"), 
        defensive_yaw_2 = v16:slider("\a{Link Active}" .. ui.get_icon("layer-minus") .. " \aFFFFFFFF 2nd Yaw", -180, 180, 0, nil, "\194\176"), 
        defensive_yaw_3 = v16:slider("\a{Link Active}" .. ui.get_icon("layer-minus") .. " \aFFFFFFFF Spin Speed", 1, 100, 1, nil, "%"), 
        defensive_yaw_delay = v16:slider("\a{Link Active}" .. ui.get_icon("clock") .. " \aFFFFFFFF Delay", 1, 10, 1, nil, "t")
    }, 
    [3] = {
        allow_switch = v14:switch("\a{Link Active}" .. "Allow \aFFFFFFFFRunning"), 
        yaw_combo = v14:combo("\a{Link Active}" .. ui.get_icon("layer-group") .. " \aFFFFFFFF Yaw", {
            [1] = "180", 
            [2] = "Delayed"
        }), 
        yaw_add = v14:slider("\a{Link Active}" .. ui.get_icon("layer-plus") .. " \aFFFFFFFF Yaw Add", -180, 180, 0, nil, "\194\176"), 
        yaw_add_gl = v14:slider("\a{Link Active}" .. ui.get_icon("layer-plus") .. " \aFFFFFFFF Yaw Add", -180, 180, 0, nil, "\194\176"), 
        yaw_left = v14:slider("\a{Link Active}" .. ui.get_icon("layer-plus") .. " \aFFFFFFFF Yaw Add Left", -180, 180, 0, nil, "\194\176"), 
        yaw_right = v14:slider("\a{Link Active}" .. ui.get_icon("layer-minus") .. " \aFFFFFFFF Yaw Add Right", -180, 180, 0, nil, "\194\176"), 
        delay_ticks = v14:slider("\a{Link Active}" .. ui.get_icon("clock") .. " \aFFFFFFFF Delay Ticks", 1, 10, 1, nil, function(v38)
            -- upvalues: v35 (ref)
            return v35[v38];
        end), 
        randomize_yaw = v14:slider("\a{Link Active}" .. ui.get_icon("shuffle") .. " \aFFFFFFFF Randomize yaw", 0, 180, 0, nil, "\194\176"), 
        yaw_modifier = v14:combo("\a{Link Active}" .. ui.get_icon("layer-group") .. " \aFFFFFFFF Yaw Modifier", {
            [1] = "Disabled", 
            [2] = "Center", 
            [3] = "Offset", 
            [4] = "Random", 
            [5] = "Spin", 
            [6] = "3-Way", 
            [7] = "5-Way"
        }), 
        yaw_offset = v14:slider("\a{Link Active}" .. ui.get_icon("layer-plus") .. " \aFFFFFFFF Yaw Offset", -180, 180, 0, nil, "\194\176"), 
        body_yaw_limit = v14:slider("\a{Link Active}" .. ui.get_icon("gauge-max") .. " \aFFFFFFFF Body Yaw Limit", 0, 60, 0, nil, "\194\176"), 
        body_yaw_options = v14:selectable("\a{Link Active}" .. ui.get_icon("option") .. " \aFFFFFFFF Body Yaw Options", {
            [1] = "Jitter"
        }), 
        break_lc = v16:combo("\a{Link Active}" .. ui.get_icon("bone-break") .. " \aFFFFFFFF Break LC", {
            [1] = "On Peek", 
            [2] = "Always On"
        }), 
        defensive_snap = v16:switch("\a{Link Active}" .. ui.get_icon("user-secret") .. " \aFFFFFFFF Defensive Snap"), 
        defensive_pitch_combo = v16:combo("\a{Link Active}" .. ui.get_icon("up-down") .. " \aFFFFFFFF Pitch", {
            [1] = "Custom", 
            [2] = "Sway", 
            [3] = "Jitter", 
            [4] = "Random"
        }), 
        defensive_pitch_custom = v16:slider("\a{Link Active}" .. ui.get_icon("layer-group") .. " \aFFFFFFFF Pitch value", -89, 89, 0, nil, "\194\176"), 
        defensive_pitch_1 = v16:slider("\a{Link Active}" .. ui.get_icon("layer-plus") .. " \aFFFFFFFF 1st Pitch", -89, 89, 0, nil, "\194\176"), 
        defensive_pitch_2 = v16:slider("\a{Link Active}" .. ui.get_icon("layer-minus") .. " \aFFFFFFFF 2nd Pitch", -89, 89, 0, nil, "\194\176"), 
        defensive_pitch_delay = v16:slider("\a{Link Active}" .. ui.get_icon("clock") .. " \aFFFFFFFF Delay", 1, 10, 1, nil, "t"), 
        defensive_group_yaw_combo = v16:combo("\a{Link Active}" .. ui.get_icon("left-right") .. " \aFFFFFFFF Yaw", {
            [1] = "Custom", 
            [2] = "Spin", 
            [3] = "Jitter", 
            [4] = "Smooth", 
            [5] = "Random"
        }), 
        defensive_yaw_custom = v16:slider("\a{Link Active}" .. ui.get_icon("layer-group") .. " \aFFFFFFFF Yaw value", -180, 180, 0, nil, "\194\176"), 
        defensive_yaw_1 = v16:slider("\a{Link Active}" .. ui.get_icon("layer-plus") .. " \aFFFFFFFF 1st Yaw", -180, 180, 0, nil, "\194\176"), 
        defensive_yaw_2 = v16:slider("\a{Link Active}" .. ui.get_icon("layer-minus") .. " \aFFFFFFFF 2nd Yaw", -180, 180, 0, nil, "\194\176"), 
        defensive_yaw_3 = v16:slider("\a{Link Active}" .. ui.get_icon("layer-minus") .. " \aFFFFFFFF Spin Speed", 1, 100, 1, nil, "%"), 
        defensive_yaw_delay = v16:slider("\a{Link Active}" .. ui.get_icon("clock") .. " \aFFFFFFFF Delay", 1, 10, 1, nil, "t")
    }, 
    [4] = {
        allow_switch = v14:switch("\a{Link Active}" .. "Allow \aFFFFFFFFSlowing"), 
        yaw_combo = v14:combo("\a{Link Active}" .. ui.get_icon("layer-group") .. " \aFFFFFFFF Yaw", {
            [1] = "180", 
            [2] = "Delayed"
        }), 
        yaw_add = v14:slider("\a{Link Active}" .. ui.get_icon("layer-plus") .. " \aFFFFFFFF Yaw Add", -180, 180, 0, nil, "\194\176"), 
        yaw_add_gl = v14:slider("\a{Link Active}" .. ui.get_icon("layer-plus") .. " \aFFFFFFFF Yaw Add", -180, 180, 0, nil, "\194\176"), 
        yaw_left = v14:slider("\a{Link Active}" .. ui.get_icon("layer-plus") .. " \aFFFFFFFF Yaw Add Left", -180, 180, 0, nil, "\194\176"), 
        yaw_right = v14:slider("\a{Link Active}" .. ui.get_icon("layer-minus") .. " \aFFFFFFFF Yaw Add Right", -180, 180, 0, nil, "\194\176"), 
        delay_ticks = v14:slider("\a{Link Active}" .. ui.get_icon("clock") .. " \aFFFFFFFF Delay Ticks", 1, 10, 1, nil, function(v39)
            -- upvalues: v35 (ref)
            return v35[v39];
        end), 
        randomize_yaw = v14:slider("\a{Link Active}" .. ui.get_icon("shuffle") .. " \aFFFFFFFF Randomize yaw", 0, 180, 0, nil, "\194\176"), 
        yaw_modifier = v14:combo("\a{Link Active}" .. ui.get_icon("layer-group") .. " \aFFFFFFFF Yaw Modifier", {
            [1] = "Disabled", 
            [2] = "Center", 
            [3] = "Offset", 
            [4] = "Random", 
            [5] = "Spin", 
            [6] = "3-Way", 
            [7] = "5-Way"
        }), 
        yaw_offset = v14:slider("\a{Link Active}" .. ui.get_icon("layer-plus") .. " \aFFFFFFFF Yaw Offset", -180, 180, 0, nil, "\194\176"), 
        body_yaw_limit = v14:slider("\a{Link Active}" .. ui.get_icon("gauge-max") .. " \aFFFFFFFF Body Yaw Limit", 0, 60, 0, nil, "\194\176"), 
        body_yaw_options = v14:selectable("\a{Link Active}" .. ui.get_icon("option") .. " \aFFFFFFFF Body Yaw Options", {
            [1] = "Jitter"
        }), 
        break_lc = v16:combo("\a{Link Active}" .. ui.get_icon("bone-break") .. " \aFFFFFFFF Break LC", {
            [1] = "On Peek", 
            [2] = "Always On"
        }), 
        defensive_snap = v16:switch("\a{Link Active}" .. ui.get_icon("user-secret") .. " \aFFFFFFFF Defensive Snap"), 
        defensive_pitch_combo = v16:combo("\a{Link Active}" .. ui.get_icon("up-down") .. " \aFFFFFFFF Pitch", {
            [1] = "Custom", 
            [2] = "Sway", 
            [3] = "Jitter", 
            [4] = "Random"
        }), 
        defensive_pitch_custom = v16:slider("\a{Link Active}" .. ui.get_icon("layer-group") .. " \aFFFFFFFF Pitch value", -89, 89, 0, nil, "\194\176"), 
        defensive_pitch_1 = v16:slider("\a{Link Active}" .. ui.get_icon("layer-plus") .. " \aFFFFFFFF 1st Pitch", -89, 89, 0, nil, "\194\176"), 
        defensive_pitch_2 = v16:slider("\a{Link Active}" .. ui.get_icon("layer-minus") .. " \aFFFFFFFF 2nd Pitch", -89, 89, 0, nil, "\194\176"), 
        defensive_pitch_delay = v16:slider("\a{Link Active}" .. ui.get_icon("clock") .. " \aFFFFFFFF Delay", 1, 10, 1, nil, "t"), 
        defensive_group_yaw_combo = v16:combo("\a{Link Active}" .. ui.get_icon("left-right") .. " \aFFFFFFFF Yaw", {
            [1] = "Custom", 
            [2] = "Spin", 
            [3] = "Jitter", 
            [4] = "Smooth", 
            [5] = "Random"
        }), 
        defensive_yaw_custom = v16:slider("\a{Link Active}" .. ui.get_icon("layer-group") .. " \aFFFFFFFF Yaw value", -180, 180, 0, nil, "\194\176"), 
        defensive_yaw_1 = v16:slider("\a{Link Active}" .. ui.get_icon("layer-plus") .. " \aFFFFFFFF 1st Yaw", -180, 180, 0, nil, "\194\176"), 
        defensive_yaw_2 = v16:slider("\a{Link Active}" .. ui.get_icon("layer-minus") .. " \aFFFFFFFF 2nd Yaw", -180, 180, 0, nil, "\194\176"), 
        defensive_yaw_3 = v16:slider("\a{Link Active}" .. ui.get_icon("layer-minus") .. " \aFFFFFFFF Spin Speed", 1, 100, 1, nil, "%"), 
        defensive_yaw_delay = v16:slider("\a{Link Active}" .. ui.get_icon("clock") .. " \aFFFFFFFF Delay", 1, 10, 1, nil, "t")
    }, 
    [5] = {
        allow_switch = v14:switch("\a{Link Active}" .. "Allow \aFFFFFFFFCrouching"), 
        yaw_combo = v14:combo("\a{Link Active}" .. ui.get_icon("layer-group") .. " \aFFFFFFFF Yaw", {
            [1] = "180", 
            [2] = "Delayed"
        }), 
        yaw_add = v14:slider("\a{Link Active}" .. ui.get_icon("layer-plus") .. " \aFFFFFFFF Yaw Add", -180, 180, 0, nil, "\194\176"), 
        yaw_add_gl = v14:slider("\a{Link Active}" .. ui.get_icon("layer-plus") .. " \aFFFFFFFF Yaw Add", -180, 180, 0, nil, "\194\176"), 
        yaw_left = v14:slider("\a{Link Active}" .. ui.get_icon("layer-plus") .. " \aFFFFFFFF Yaw Add Left", -180, 180, 0, nil, "\194\176"), 
        yaw_right = v14:slider("\a{Link Active}" .. ui.get_icon("layer-minus") .. " \aFFFFFFFF Yaw Add Right", -180, 180, 0, nil, "\194\176"), 
        delay_ticks = v14:slider("\a{Link Active}" .. ui.get_icon("clock") .. " \aFFFFFFFF Delay Ticks", 1, 10, 1, nil, function(v40)
            -- upvalues: v35 (ref)
            return v35[v40];
        end), 
        randomize_yaw = v14:slider("\a{Link Active}" .. ui.get_icon("shuffle") .. " \aFFFFFFFF Randomize yaw", 0, 180, 0, nil, "\194\176"), 
        yaw_modifier = v14:combo("\a{Link Active}" .. ui.get_icon("layer-group") .. " \aFFFFFFFF Yaw Modifier", {
            [1] = "Disabled", 
            [2] = "Center", 
            [3] = "Offset", 
            [4] = "Random", 
            [5] = "Spin", 
            [6] = "3-Way", 
            [7] = "5-Way"
        }), 
        yaw_offset = v14:slider("\a{Link Active}" .. ui.get_icon("layer-plus") .. " \aFFFFFFFF Yaw Offset", -180, 180, 0, nil, "\194\176"), 
        body_yaw_limit = v14:slider("\a{Link Active}" .. ui.get_icon("gauge-max") .. " \aFFFFFFFF Body Yaw Limit", 0, 60, 0, nil, "\194\176"), 
        body_yaw_options = v14:selectable("\a{Link Active}" .. ui.get_icon("option") .. " \aFFFFFFFF Body Yaw Options", {
            [1] = "Jitter"
        }), 
        break_lc = v16:combo("\a{Link Active}" .. ui.get_icon("bone-break") .. " \aFFFFFFFF Break LC", {
            [1] = "On Peek", 
            [2] = "Always On"
        }), 
        defensive_snap = v16:switch("\a{Link Active}" .. ui.get_icon("user-secret") .. " \aFFFFFFFF Defensive Snap"), 
        defensive_pitch_combo = v16:combo("\a{Link Active}" .. ui.get_icon("up-down") .. " \aFFFFFFFF Pitch", {
            [1] = "Custom", 
            [2] = "Sway", 
            [3] = "Jitter", 
            [4] = "Random"
        }), 
        defensive_pitch_custom = v16:slider("\a{Link Active}" .. ui.get_icon("layer-group") .. " \aFFFFFFFF Pitch value", -89, 89, 0, nil, "\194\176"), 
        defensive_pitch_1 = v16:slider("\a{Link Active}" .. ui.get_icon("layer-plus") .. " \aFFFFFFFF 1st Pitch", -89, 89, 0, nil, "\194\176"), 
        defensive_pitch_2 = v16:slider("\a{Link Active}" .. ui.get_icon("layer-minus") .. " \aFFFFFFFF 2nd Pitch", -89, 89, 0, nil, "\194\176"), 
        defensive_pitch_delay = v16:slider("\a{Link Active}" .. ui.get_icon("clock") .. " \aFFFFFFFF Delay", 1, 10, 1, nil, "t"), 
        defensive_group_yaw_combo = v16:combo("\a{Link Active}" .. ui.get_icon("left-right") .. " \aFFFFFFFF Yaw", {
            [1] = "Custom", 
            [2] = "Spin", 
            [3] = "Jitter", 
            [4] = "Smooth", 
            [5] = "Random"
        }), 
        defensive_yaw_custom = v16:slider("\a{Link Active}" .. ui.get_icon("layer-group") .. " \aFFFFFFFF Yaw value", -180, 180, 0, nil, "\194\176"), 
        defensive_yaw_1 = v16:slider("\a{Link Active}" .. ui.get_icon("layer-plus") .. " \aFFFFFFFF 1st Yaw", -180, 180, 0, nil, "\194\176"), 
        defensive_yaw_2 = v16:slider("\a{Link Active}" .. ui.get_icon("layer-minus") .. " \aFFFFFFFF 2nd Yaw", -180, 180, 0, nil, "\194\176"), 
        defensive_yaw_3 = v16:slider("\a{Link Active}" .. ui.get_icon("layer-minus") .. " \aFFFFFFFF Spin Speed", 1, 100, 1, nil, "%"), 
        defensive_yaw_delay = v16:slider("\a{Link Active}" .. ui.get_icon("clock") .. " \aFFFFFFFF Delay", 1, 10, 1, nil, "t")
    }, 
    [6] = {
        allow_switch = v14:switch("\a{Link Active}" .. "Allow \aFFFFFFFFSneaking"), 
        yaw_combo = v14:combo("\a{Link Active}" .. ui.get_icon("layer-group") .. " \aFFFFFFFF Yaw", {
            [1] = "180", 
            [2] = "Delayed"
        }), 
        yaw_add = v14:slider("\a{Link Active}" .. ui.get_icon("layer-plus") .. " \aFFFFFFFF Yaw Add", -180, 180, 0, nil, "\194\176"), 
        yaw_add_gl = v14:slider("\a{Link Active}" .. ui.get_icon("layer-plus") .. " \aFFFFFFFF Yaw Add", -180, 180, 0, nil, "\194\176"), 
        yaw_left = v14:slider("\a{Link Active}" .. ui.get_icon("layer-plus") .. " \aFFFFFFFF Yaw Add Left", -180, 180, 0, nil, "\194\176"), 
        yaw_right = v14:slider("\a{Link Active}" .. ui.get_icon("layer-minus") .. " \aFFFFFFFF Yaw Add Right", -180, 180, 0, nil, "\194\176"), 
        delay_ticks = v14:slider("\a{Link Active}" .. ui.get_icon("clock") .. " \aFFFFFFFF Delay Ticks", 1, 10, 1, nil, function(v41)
            -- upvalues: v35 (ref)
            return v35[v41];
        end), 
        randomize_yaw = v14:slider("\a{Link Active}" .. ui.get_icon("shuffle") .. " \aFFFFFFFF Randomize yaw", 0, 180, 0, nil, "\194\176"), 
        yaw_modifier = v14:combo("\a{Link Active}" .. ui.get_icon("layer-group") .. " \aFFFFFFFF Yaw Modifier", {
            [1] = "Disabled", 
            [2] = "Center", 
            [3] = "Offset", 
            [4] = "Random", 
            [5] = "Spin", 
            [6] = "3-Way", 
            [7] = "5-Way"
        }), 
        yaw_offset = v14:slider("\a{Link Active}" .. ui.get_icon("layer-plus") .. " \aFFFFFFFF Yaw Offset", -180, 180, 0, nil, "\194\176"), 
        body_yaw_limit = v14:slider("\a{Link Active}" .. ui.get_icon("gauge-max") .. " \aFFFFFFFF Body Yaw Limit", 0, 60, 0, nil, "\194\176"), 
        body_yaw_options = v14:selectable("\a{Link Active}" .. ui.get_icon("option") .. " \aFFFFFFFF Body Yaw Options", {
            [1] = "Jitter"
        }), 
        break_lc = v16:combo("\a{Link Active}" .. ui.get_icon("bone-break") .. " \aFFFFFFFF Break LC", {
            [1] = "On Peek", 
            [2] = "Always On"
        }), 
        defensive_snap = v16:switch("\a{Link Active}" .. ui.get_icon("user-secret") .. " \aFFFFFFFF Defensive Snap"), 
        defensive_pitch_combo = v16:combo("\a{Link Active}" .. ui.get_icon("up-down") .. " \aFFFFFFFF Pitch", {
            [1] = "Custom", 
            [2] = "Sway", 
            [3] = "Jitter", 
            [4] = "Random"
        }), 
        defensive_pitch_custom = v16:slider("\a{Link Active}" .. ui.get_icon("layer-group") .. " \aFFFFFFFF Pitch value", -89, 89, 0, nil, "\194\176"), 
        defensive_pitch_1 = v16:slider("\a{Link Active}" .. ui.get_icon("layer-plus") .. " \aFFFFFFFF 1st Pitch", -89, 89, 0, nil, "\194\176"), 
        defensive_pitch_2 = v16:slider("\a{Link Active}" .. ui.get_icon("layer-minus") .. " \aFFFFFFFF 2nd Pitch", -89, 89, 0, nil, "\194\176"), 
        defensive_pitch_delay = v16:slider("\a{Link Active}" .. ui.get_icon("clock") .. " \aFFFFFFFF Delay", 1, 10, 1, nil, "t"), 
        defensive_group_yaw_combo = v16:combo("\a{Link Active}" .. ui.get_icon("left-right") .. " \aFFFFFFFF Yaw", {
            [1] = "Custom", 
            [2] = "Spin", 
            [3] = "Jitter", 
            [4] = "Smooth", 
            [5] = "Random"
        }), 
        defensive_yaw_custom = v16:slider("\a{Link Active}" .. ui.get_icon("layer-group") .. " \aFFFFFFFF Yaw value", -180, 180, 0, nil, "\194\176"), 
        defensive_yaw_1 = v16:slider("\a{Link Active}" .. ui.get_icon("layer-plus") .. " \aFFFFFFFF 1st Yaw", -180, 180, 0, nil, "\194\176"), 
        defensive_yaw_2 = v16:slider("\a{Link Active}" .. ui.get_icon("layer-minus") .. " \aFFFFFFFF 2nd Yaw", -180, 180, 0, nil, "\194\176"), 
        defensive_yaw_3 = v16:slider("\a{Link Active}" .. ui.get_icon("layer-minus") .. " \aFFFFFFFF Spin Speed", 1, 100, 1, nil, "%"), 
        defensive_yaw_delay = v16:slider("\a{Link Active}" .. ui.get_icon("clock") .. " \aFFFFFFFF Delay", 1, 10, 1, nil, "t")
    }, 
    [7] = {
        allow_switch = v14:switch("\a{Link Active}" .. "Allow \aFFFFFFFFAir"), 
        yaw_combo = v14:combo("\a{Link Active}" .. ui.get_icon("layer-group") .. " \aFFFFFFFF Yaw", {
            [1] = "180", 
            [2] = "Delayed"
        }), 
        yaw_add = v14:slider("\a{Link Active}" .. ui.get_icon("layer-plus") .. " \aFFFFFFFF Yaw Add", -180, 180, 0, nil, "\194\176"), 
        yaw_add_gl = v14:slider("\a{Link Active}" .. ui.get_icon("layer-plus") .. " \aFFFFFFFF Yaw Add", -180, 180, 0, nil, "\194\176"), 
        yaw_left = v14:slider("\a{Link Active}" .. ui.get_icon("layer-plus") .. " \aFFFFFFFF Yaw Add Left", -180, 180, 0, nil, "\194\176"), 
        yaw_right = v14:slider("\a{Link Active}" .. ui.get_icon("layer-minus") .. " \aFFFFFFFF Yaw Add Right", -180, 180, 0, nil, "\194\176"), 
        delay_ticks = v14:slider("\a{Link Active}" .. ui.get_icon("clock") .. " \aFFFFFFFF Delay Ticks", 1, 10, 1, nil, function(v42)
            -- upvalues: v35 (ref)
            return v35[v42];
        end), 
        randomize_yaw = v14:slider("\a{Link Active}" .. ui.get_icon("shuffle") .. " \aFFFFFFFF Randomize yaw", 0, 180, 0, nil, "\194\176"), 
        yaw_modifier = v14:combo("\a{Link Active}" .. ui.get_icon("layer-group") .. " \aFFFFFFFF Yaw Modifier", {
            [1] = "Disabled", 
            [2] = "Center", 
            [3] = "Offset", 
            [4] = "Random", 
            [5] = "Spin", 
            [6] = "3-Way", 
            [7] = "5-Way"
        }), 
        yaw_offset = v14:slider("\a{Link Active}" .. ui.get_icon("layer-plus") .. " \aFFFFFFFF Yaw Offset", -180, 180, 0, nil, "\194\176"), 
        body_yaw_limit = v14:slider("\a{Link Active}" .. ui.get_icon("gauge-max") .. " \aFFFFFFFF Body Yaw Limit", 0, 60, 0, nil, "\194\176"), 
        body_yaw_options = v14:selectable("\a{Link Active}" .. ui.get_icon("option") .. " \aFFFFFFFF Body Yaw Options", {
            [1] = "Jitter"
        }), 
        break_lc = v16:combo("\a{Link Active}" .. ui.get_icon("bone-break") .. " \aFFFFFFFF Break LC", {
            [1] = "On Peek", 
            [2] = "Always On"
        }), 
        defensive_snap = v16:switch("\a{Link Active}" .. ui.get_icon("user-secret") .. " \aFFFFFFFF Defensive Snap"), 
        defensive_pitch_combo = v16:combo("\a{Link Active}" .. ui.get_icon("up-down") .. " \aFFFFFFFF Pitch", {
            [1] = "Custom", 
            [2] = "Sway", 
            [3] = "Jitter", 
            [4] = "Random"
        }), 
        defensive_pitch_custom = v16:slider("\a{Link Active}" .. ui.get_icon("layer-group") .. " \aFFFFFFFF Pitch value", -89, 89, 0, nil, "\194\176"), 
        defensive_pitch_1 = v16:slider("\a{Link Active}" .. ui.get_icon("layer-plus") .. " \aFFFFFFFF 1st Pitch", -89, 89, 0, nil, "\194\176"), 
        defensive_pitch_2 = v16:slider("\a{Link Active}" .. ui.get_icon("layer-minus") .. " \aFFFFFFFF 2nd Pitch", -89, 89, 0, nil, "\194\176"), 
        defensive_pitch_delay = v16:slider("\a{Link Active}" .. ui.get_icon("clock") .. " \aFFFFFFFF Delay", 1, 10, 1, nil, "t"), 
        defensive_group_yaw_combo = v16:combo("\a{Link Active}" .. ui.get_icon("left-right") .. " \aFFFFFFFF Yaw", {
            [1] = "Custom", 
            [2] = "Spin", 
            [3] = "Jitter", 
            [4] = "Smooth", 
            [5] = "Random"
        }), 
        defensive_yaw_custom = v16:slider("\a{Link Active}" .. ui.get_icon("layer-group") .. " \aFFFFFFFF Yaw value", -180, 180, 0, nil, "\194\176"), 
        defensive_yaw_1 = v16:slider("\a{Link Active}" .. ui.get_icon("layer-plus") .. " \aFFFFFFFF 1st Yaw", -180, 180, 0, nil, "\194\176"), 
        defensive_yaw_2 = v16:slider("\a{Link Active}" .. ui.get_icon("layer-minus") .. " \aFFFFFFFF 2nd Yaw", -180, 180, 0, nil, "\194\176"), 
        defensive_yaw_3 = v16:slider("\a{Link Active}" .. ui.get_icon("layer-minus") .. " \aFFFFFFFF Spin Speed", 1, 100, 1, nil, "%"), 
        defensive_yaw_delay = v16:slider("\a{Link Active}" .. ui.get_icon("clock") .. " \aFFFFFFFF Delay", 1, 10, 1, nil, "t")
    }, 
    [8] = {
        allow_switch = v14:switch("\a{Link Active}" .. "Allow \aFFFFFFFFAir Crouching"), 
        yaw_combo = v14:combo("\a{Link Active}" .. ui.get_icon("layer-group") .. " \aFFFFFFFF Yaw", {
            [1] = "180", 
            [2] = "Delayed"
        }), 
        yaw_add = v14:slider("\a{Link Active}" .. ui.get_icon("layer-plus") .. " \aFFFFFFFF Yaw Add", -180, 180, 0, nil, "\194\176"), 
        yaw_add_gl = v14:slider("\a{Link Active}" .. ui.get_icon("layer-plus") .. " \aFFFFFFFF Yaw Add", -180, 180, 0, nil, "\194\176"), 
        yaw_left = v14:slider("\a{Link Active}" .. ui.get_icon("layer-plus") .. " \aFFFFFFFF Yaw Add Left", -180, 180, 0, nil, "\194\176"), 
        yaw_right = v14:slider("\a{Link Active}" .. ui.get_icon("layer-minus") .. " \aFFFFFFFF Yaw Add Right", -180, 180, 0, nil, "\194\176"), 
        delay_ticks = v14:slider("\a{Link Active}" .. ui.get_icon("clock") .. " \aFFFFFFFF Delay Ticks", 1, 10, 1, nil, function(v43)
            -- upvalues: v35 (ref)
            return v35[v43];
        end), 
        randomize_yaw = v14:slider("\a{Link Active}" .. ui.get_icon("shuffle") .. " \aFFFFFFFF Randomize yaw", 0, 180, 0, nil, "\194\176"), 
        yaw_modifier = v14:combo("\a{Link Active}" .. ui.get_icon("layer-group") .. " \aFFFFFFFF Yaw Modifier", {
            [1] = "Disabled", 
            [2] = "Center", 
            [3] = "Offset", 
            [4] = "Random", 
            [5] = "Spin", 
            [6] = "3-Way", 
            [7] = "5-Way"
        }), 
        yaw_offset = v14:slider("\a{Link Active}" .. ui.get_icon("layer-plus") .. " \aFFFFFFFF Yaw Offset", -180, 180, 0, nil, "\194\176"), 
        body_yaw_limit = v14:slider("\a{Link Active}" .. ui.get_icon("gauge-max") .. " \aFFFFFFFF Body Yaw Limit", 0, 60, 0, nil, "\194\176"), 
        body_yaw_options = v14:selectable("\a{Link Active}" .. ui.get_icon("option") .. " \aFFFFFFFF Body Yaw Options", {
            [1] = "Jitter"
        }), 
        break_lc = v16:combo("\a{Link Active}" .. ui.get_icon("bone-break") .. " \aFFFFFFFF Break LC", {
            [1] = "On Peek", 
            [2] = "Always On"
        }), 
        defensive_snap = v16:switch("\a{Link Active}" .. ui.get_icon("user-secret") .. " \aFFFFFFFF Defensive Snap"), 
        defensive_pitch_combo = v16:combo("\a{Link Active}" .. ui.get_icon("up-down") .. " \aFFFFFFFF Pitch", {
            [1] = "Custom", 
            [2] = "Sway", 
            [3] = "Jitter", 
            [4] = "Random"
        }), 
        defensive_pitch_custom = v16:slider("\a{Link Active}" .. ui.get_icon("layer-group") .. " \aFFFFFFFF Pitch value", -89, 89, 0, nil, "\194\176"), 
        defensive_pitch_1 = v16:slider("\a{Link Active}" .. ui.get_icon("layer-plus") .. " \aFFFFFFFF 1st Pitch", -89, 89, 0, nil, "\194\176"), 
        defensive_pitch_2 = v16:slider("\a{Link Active}" .. ui.get_icon("layer-minus") .. " \aFFFFFFFF 2nd Pitch", -89, 89, 0, nil, "\194\176"), 
        defensive_pitch_delay = v16:slider("\a{Link Active}" .. ui.get_icon("clock") .. " \aFFFFFFFF Delay", 1, 10, 1, nil, "t"), 
        defensive_group_yaw_combo = v16:combo("\a{Link Active}" .. ui.get_icon("left-right") .. " \aFFFFFFFF Yaw", {
            [1] = "Custom", 
            [2] = "Spin", 
            [3] = "Jitter", 
            [4] = "Smooth", 
            [5] = "Random"
        }), 
        defensive_yaw_custom = v16:slider("\a{Link Active}" .. ui.get_icon("layer-group") .. " \aFFFFFFFF Yaw value", -180, 180, 0, nil, "\194\176"), 
        defensive_yaw_1 = v16:slider("\a{Link Active}" .. ui.get_icon("layer-plus") .. " \aFFFFFFFF 1st Yaw", -180, 180, 0, nil, "\194\176"), 
        defensive_yaw_2 = v16:slider("\a{Link Active}" .. ui.get_icon("layer-minus") .. " \aFFFFFFFF 2nd Yaw", -180, 180, 0, nil, "\194\176"), 
        defensive_yaw_3 = v16:slider("\a{Link Active}" .. ui.get_icon("layer-minus") .. " \aFFFFFFFF Spin Speed", 1, 100, 1, nil, "%"), 
        defensive_yaw_delay = v16:slider("\a{Link Active}" .. ui.get_icon("clock") .. " \aFFFFFFFF Delay", 1, 10, 1, nil, "t")
    }, 
    [9] = {
        allow_switch = v14:switch("\a{Link Active}" .. "Allow \aFFFFFFFFFreestanding"), 
        yaw_combo = v14:combo("\a{Link Active}" .. ui.get_icon("layer-group") .. " \aFFFFFFFF Yaw", {
            [1] = "180", 
            [2] = "Delayed"
        }), 
        yaw_add = v14:slider("\a{Link Active}" .. ui.get_icon("layer-plus") .. " \aFFFFFFFF Yaw Add", -180, 180, 0, nil, "\194\176"), 
        yaw_add_gl = v14:slider("\a{Link Active}" .. ui.get_icon("layer-plus") .. " \aFFFFFFFF Yaw Add", -180, 180, 0, nil, "\194\176"), 
        yaw_left = v14:slider("\a{Link Active}" .. ui.get_icon("layer-plus") .. " \aFFFFFFFF Yaw Add Left", -180, 180, 0, nil, "\194\176"), 
        yaw_right = v14:slider("\a{Link Active}" .. ui.get_icon("layer-minus") .. " \aFFFFFFFF Yaw Add Right", -180, 180, 0, nil, "\194\176"), 
        delay_ticks = v14:slider("\a{Link Active}" .. ui.get_icon("clock") .. " \aFFFFFFFF Delay Ticks", 1, 10, 1, nil, function(v44)
            -- upvalues: v35 (ref)
            return v35[v44];
        end), 
        randomize_yaw = v14:slider("\a{Link Active}" .. ui.get_icon("shuffle") .. " \aFFFFFFFF Randomize yaw", 0, 180, 0, nil, "\194\176"), 
        yaw_modifier = v14:combo("\a{Link Active}" .. ui.get_icon("layer-group") .. " \aFFFFFFFF Yaw Modifier", {
            [1] = "Disabled", 
            [2] = "Center", 
            [3] = "Offset", 
            [4] = "Random", 
            [5] = "Spin", 
            [6] = "3-Way", 
            [7] = "5-Way"
        }), 
        yaw_offset = v14:slider("\a{Link Active}" .. ui.get_icon("layer-plus") .. " \aFFFFFFFF Yaw Offset", -180, 180, 0, nil, "\194\176"), 
        body_yaw_limit = v14:slider("\a{Link Active}" .. ui.get_icon("gauge-max") .. " \aFFFFFFFF Body Yaw Limit", 0, 60, 0, nil, "\194\176"), 
        body_yaw_options = v14:selectable("\a{Link Active}" .. ui.get_icon("option") .. " \aFFFFFFFF Body Yaw Options", {
            [1] = "Jitter"
        }), 
        break_lc = v16:combo("\a{Link Active}" .. ui.get_icon("bone-break") .. " \aFFFFFFFF Break LC", {
            [1] = "On Peek", 
            [2] = "Always On"
        }), 
        defensive_snap = v16:switch("\a{Link Active}" .. ui.get_icon("user-secret") .. " \aFFFFFFFF Defensive Snap"), 
        defensive_pitch_combo = v16:combo("\a{Link Active}" .. ui.get_icon("up-down") .. " \aFFFFFFFF Pitch", {
            [1] = "Custom", 
            [2] = "Sway", 
            [3] = "Jitter", 
            [4] = "Random"
        }), 
        defensive_pitch_custom = v16:slider("\a{Link Active}" .. ui.get_icon("layer-group") .. " \aFFFFFFFF Pitch value", -89, 89, 0, nil, "\194\176"), 
        defensive_pitch_1 = v16:slider("\a{Link Active}" .. ui.get_icon("layer-plus") .. " \aFFFFFFFF 1st Pitch", -89, 89, 0, nil, "\194\176"), 
        defensive_pitch_2 = v16:slider("\a{Link Active}" .. ui.get_icon("layer-minus") .. " \aFFFFFFFF 2nd Pitch", -89, 89, 0, nil, "\194\176"), 
        defensive_pitch_delay = v16:slider("\a{Link Active}" .. ui.get_icon("clock") .. " \aFFFFFFFF Delay", 1, 10, 1, nil, "t"), 
        defensive_group_yaw_combo = v16:combo("\a{Link Active}" .. ui.get_icon("left-right") .. " \aFFFFFFFF Yaw", {
            [1] = "Custom", 
            [2] = "Spin", 
            [3] = "Jitter", 
            [4] = "Smooth", 
            [5] = "Random"
        }), 
        defensive_yaw_custom = v16:slider("\a{Link Active}" .. ui.get_icon("layer-group") .. " \aFFFFFFFF Yaw value", -180, 180, 0, nil, "\194\176"), 
        defensive_yaw_1 = v16:slider("\a{Link Active}" .. ui.get_icon("layer-plus") .. " \aFFFFFFFF 1st Yaw", -180, 180, 0, nil, "\194\176"), 
        defensive_yaw_2 = v16:slider("\a{Link Active}" .. ui.get_icon("layer-minus") .. " \aFFFFFFFF 2nd Yaw", -180, 180, 0, nil, "\194\176"), 
        defensive_yaw_3 = v16:slider("\a{Link Active}" .. ui.get_icon("layer-minus") .. " \aFFFFFFFF Spin Speed", 1, 100, 1, nil, "%"), 
        defensive_yaw_delay = v16:slider("\a{Link Active}" .. ui.get_icon("clock") .. " \aFFFFFFFF Delay", 1, 10, 1, nil, "t")
    }
};
local v46 = {
    [1] = "Neverlose", 
    [2] = "Custom"
};
local v47 = {};
local function v64()
    -- upvalues: v34 (ref), v45 (ref), v47 (ref)
    local v48 = v34:get();
    for v49, v50 in pairs(v45) do
        local v51 = v49 == v48;
        if v50.allow_switch then
            local v52 = v50.allow_switch:get();
            v50.allow_switch:visibility(v51);
            v50.yaw_combo:visibility(v51 and v52);
            local v53 = v50.yaw_combo:get();
            local v54 = v50.defensive_snap:get();
            local v55 = v50.defensive_pitch_combo:get();
            local v56 = v50.defensive_group_yaw_combo:get();
            v50.yaw_add:visibility(v51 and v52 and v53 == "180");
            v50.yaw_add_gl:visibility(v51 and v52 and v53 == "Delayed");
            v50.yaw_left:visibility(v51 and v52 and v53 == "Delayed");
            v50.yaw_right:visibility(v51 and v52 and v53 == "Delayed");
            v50.delay_ticks:visibility(v51 and v52 and v53 == "Delayed");
            v50.randomize_yaw:visibility(v51 and v52 and v53 == "Delayed");
            v50.body_yaw_limit:visibility(v51 and v52);
            v50.body_yaw_options:visibility(v51 and v52);
            local v57 = v50.yaw_modifier:get();
            v50.yaw_modifier:visibility(v51 and v52);
            v50.yaw_offset:visibility(v51 and v52 and v57 ~= "Disabled");
            v50.break_lc:visibility(v51 and v52);
            v50.defensive_snap:visibility(v51 and v52);
            v50.defensive_pitch_combo:visibility(v51 and v52 and v54);
            v50.defensive_pitch_custom:visibility(v51 and v52 and v54 and v55 == "Custom");
            v50.defensive_pitch_1:visibility(v51 and v52 and v54 and (v55 == "Jitter" or not (v55 ~= "Sway") or v55 == "Random"));
            v50.defensive_pitch_2:visibility(v51 and v52 and v54 and (v55 == "Jitter" or not (v55 ~= "Sway") or v55 == "Random"));
            v50.defensive_pitch_delay:visibility(v51 and v52 and v54 and (v55 == "Jitter" or v55 == "Sway"));
            v50.defensive_group_yaw_combo:visibility(v51 and v52 and v54);
            v50.defensive_yaw_1:visibility(v51 and v52 and v54 and (v56 == "Jitter" or not (v56 ~= "Random") or v56 == "Smooth"));
            v50.defensive_yaw_2:visibility(v51 and v52 and v54 and (v56 == "Jitter" or not (v56 ~= "Random") or v56 == "Smooth"));
            v50.defensive_yaw_delay:visibility(v51 and v52 and v54 and (v56 == "Jitter" or v56 == "Smooth"));
            v50.defensive_yaw_3:visibility(v51 and v52 and v54 and v56 == "Spin");
            v50.defensive_yaw_custom:visibility(v51 and v52 and v54 and v56 == "Custom");
        else
            v50.yaw_combo:visibility(v51);
            local v58 = v50.yaw_combo:get();
            local v59 = v50.defensive_snap:get();
            local v60 = v50.defensive_pitch_combo:get();
            local v61 = v50.defensive_group_yaw_combo:get();
            v50.yaw_add:visibility(v51 and v58 == "180");
            v50.yaw_add_gl:visibility(v51 and v58 == "Delayed");
            v50.yaw_left:visibility(v51 and v58 == "Delayed");
            v50.yaw_right:visibility(v51 and v58 == "Delayed");
            v50.delay_ticks:visibility(v51 and v58 == "Delayed");
            v50.randomize_yaw:visibility(v51 and v58 == "Delayed");
            v50.body_yaw_limit:visibility(v51);
            v50.body_yaw_options:visibility(v51);
            local v62 = v50.yaw_modifier:get();
            v50.yaw_modifier:visibility(v51);
            v50.yaw_offset:visibility(v51 and v62 ~= "Disabled");
            v50.break_lc:visibility(v51);
            v50.defensive_snap:visibility(v51);
            v50.defensive_pitch_combo:visibility(v51 and v59);
            v50.defensive_pitch_custom:visibility(v51 and v59 and v60 == "Custom");
            v50.defensive_pitch_1:visibility(v51 and v59 and (v60 == "Jitter" or not (v60 ~= "Sway") or not (v60 ~= "Random") or v61 == "Smooth"));
            v50.defensive_pitch_2:visibility(v51 and v59 and (v60 == "Jitter" or not (v60 ~= "Sway") or not (v60 ~= "Random") or v61 == "Smooth"));
            v50.defensive_pitch_delay:visibility(v51 and v59 and (v60 == "Jitter" or v60 == "Sway"));
            v50.defensive_group_yaw_combo:visibility(v51 and v59);
            v50.defensive_yaw_1:visibility(v51 and v59 and (v61 == "Jitter" or not (v61 ~= "Random") or v61 == "Smooth"));
            v50.defensive_yaw_2:visibility(v51 and v59 and (v61 == "Jitter" or not (v61 ~= "Random") or v61 == "Smooth"));
            v50.defensive_yaw_delay:visibility(v51 and v59 and (v61 == "Jitter" or v61 == "Smooth"));
            v50.defensive_yaw_3:visibility(v51 and v59 and v61 == "Spin");
            v50.defensive_yaw_custom:visibility(v51 and v59 and v61 == "Custom");
        end;
        if v47[v49] then
            local v63 = v47[v49].snap_slider:get();
            v47[v49].choke_slider:visibility(v63 ~= 1);
        end;
    end;
end;
for v65, v66 in ipairs(v45) do
    local v67 = v66.break_lc:create();
    v47[v65] = {
        snap_slider = v67:slider("\a{Link Active}" .. ui.get_icon("clock-rotate-left") .. " \aFFFFFFFF Break Type", 1, 2, 1, nil, function(v68)
            -- upvalues: v46 (ref)
            return v46[v68];
        end), 
        choke_slider = v67:slider("\a{Link Active}" .. ui.get_icon("gauge") .. "\aFFFFFFFF  Choke", 1, 20, 1, nil, "t")
    };
    v47[v65].snap_slider:set_callback(function()
        -- upvalues: v64 (ref)
        v64();
    end);
end;
for _, v70 in pairs(v45) do
    if v70.yaw_combo then
        v70.yaw_combo:set_callback(function()
            -- upvalues: v64 (ref)
            v64();
        end);
    end;
    if v70.allow_switch then
        v70.allow_switch:set_callback(function()
            -- upvalues: v64 (ref)
            v64();
        end);
    end;
    if v70.yaw_modifier then
        v70.yaw_modifier:set_callback(function()
            -- upvalues: v64 (ref)
            v64();
        end);
    end;
    if v70.defensive_snap then
        v70.defensive_snap:set_callback(function()
            -- upvalues: v64 (ref)
            v64();
        end);
    end;
    if v70.defensive_pitch_combo then
        v70.defensive_pitch_combo:set_callback(function()
            -- upvalues: v64 (ref)
            v64();
        end);
    end;
    if v70.defensive_group_yaw_combo then
        v70.defensive_group_yaw_combo:set_callback(function()
            -- upvalues: v64 (ref)
            v64();
        end);
    end;
end;
v34:set_callback(function()
    -- upvalues: v64 (ref)
    v64();
end);
v64();
local v71 = v15:combo("\a{Link Active}" .. ui.get_icon("person-walking") .. "\aFFFFFFFF Manual Yaw", "Off", "Left", "Right", "Forward");
local v72 = v71:create():switch("\a{Link Active}" .. ui.get_icon("arrow-right-arrow-left") .. "\aFFFFFFFF Flick Opposite");
local v73 = v15:switch("\a{Link Active}" .. ui.get_icon("person") .. "\aFFFFFFFF Freestanding");
local v74 = v73:create():switch("Static Freestanding");
local v75 = v15:selectable("\a{Link Active}" .. ui.get_icon("user-helmet-safety") .. "\aFFFFFFFF Safe Head", "Knife", "Zeus");
local v76 = v75:create();
local v77 = v76:switch("\a{Link Active}" .. ui.get_icon("keyboard-brightness") .. "\aFFFFFFFF E-Spam");
local v78 = v76:selectable("\a{Link Active}" .. ui.get_icon("eye-slash") .. "\aFFFFFFFF Disablers", "On Lethal");
local v79 = v15:switch("\a{Link Active}" .. ui.get_icon("knife") .. "\aFFFFFFFF Avoid Backstab");
local v80 = v15:switch("\a{Link Active}" .. ui.get_icon("corner") .. "\aFFFFFFFF Edge Yaw");
local v81 = v15:switch("\a{Link Active}" .. ui.get_icon("arrows-rotate") .. "\aFFFFFFFF Flick Exploit"):tooltip("\aFFAF00FF" .. ui.get_icon("triangle-exclamation") .. " \aFFFFFFFFIf enemy HS u just ALT+TAB 2-3 times");
local v82 = v81:create();
local v83 = v82:combo("Break Type", "1", "2");
local v84 = v82:combo("Type", "Default", "Chimera", "Experemental", "Jitter");
local v85 = v82:switch("Inverter");
local v86 = v15:switch("\a{Link Active}" .. ui.get_icon("transporter") .. "\aFFFFFFFF Air Lag");
local v87 = v17:list("", "Visuals", "Misc");
local v88 = {
    [59] = "Off", 
    [160] = "16:10", 
    [177] = "16:9", 
    [125] = "5:4", 
    [150] = "3:2", 
    [133] = "4:3"
};
local _ = {
    [1] = "Static", 
    [2] = "Walking", 
    [3] = "Jitter"
};
local v91 = v18:slider("\a{Link Active}" .. ui.get_icon("window") .. "\aFFFFFFFF Aspect Ratio", 59, 200, 0, 0.01, function(v90)
    -- upvalues: v88 (ref)
    return v88[v90];
end);
local v92 = v18:button("Off", function()
    -- upvalues: v91 (ref)
    v91:set(59);
end, true);
local v93 = v18:button("16:9", function()
    -- upvalues: v91 (ref)
    v91:set(177);
end, true);
local v94 = v18:button("16:10", function()
    -- upvalues: v91 (ref)
    v91:set(160);
end, true);
local v95 = v18:button("3:2", function()
    -- upvalues: v91 (ref)
    v91:set(150);
end, true);
local v96 = v18:button("4:3", function()
    -- upvalues: v91 (ref)
    v91:set(133);
end, true);
local v97 = v18:button("5:4", function()
    -- upvalues: v91 (ref)
    v91:set(125);
end, true);
local v98 = v18:switch("\a{Link Active}" .. ui.get_icon("window-restore") .. "\aFFFFFFFF Blur in menu");
local v99 = v18:switch("\a{Link Active}" .. ui.get_icon("telescope") .. "\aFFFFFFFF Custom Scope");
local v100 = v99:create();
local v101 = v100:color_picker("Color", color(255, 255, 255, 255));
local v102 = v100:slider("Gap", 0, 200, 10);
local v103 = v100:slider("Size", 0, 320, 50);
local v104 = v100:switch("T Style");
local v105 = v18:switch("\a{Link Active}" .. ui.get_icon("tv") .. "\aFFFFFFFF Fatality Spectator List");
local v106 = v18:switch("\a{Link Active}" .. ui.get_icon("triangle-exclamation") .. "\aFFFFFFFF Velocity Warning");
local v107 = v18:switch("\a{Link Active}" .. ui.get_icon("message-text") .. "\aFFFFFFFF Aimbot Logs");
local v108 = v18:switch("\a{Link Active}" .. ui.get_icon("bullseye-arrow") .. "\aFFFFFFFF Cross Hitmarker", false);
local v109 = v108:create():color_picker("Cross Color", color(88, 255, 209, 255));
local v110 = v19:label(" ");
local v111 = v19:switch("\a{Link Active}" .. ui.get_icon("window") .. "\aA4E030FF  500$ \aFFFFFFFFAnimated Indicators");
local v112 = v19:switch("\a{Link Active}" .. ui.get_icon("window") .. "\aA4E030FF  500$ \aFFFFFFFFWatermark");
local v113 = v19:switch("\a{Link Active}" .. ui.get_icon("hand") .. "\aFFFFFFFF Viewmodel Changer");
local v114 = v18:switch("\a{Link Active}" .. ui.get_icon("person") .. "\aFFFFFFFF Keep Model Transparency");
viewmodelref = v113:create();
fov = viewmodelref:slider("FOV", 0, 1000, 600, 0.1);
x_view = viewmodelref:slider("X", -100, 100, 10, 0.1);
y_view = viewmodelref:slider("Y", -100, 100, 10, 0.1);
z_view = viewmodelref:slider("Z", -100, 100, -10, 0.1);
local v115 = v20:switch("\a{Link Active}" .. ui.get_icon("bomb") .. " \aFFFFFFFF Nade Fix");
local v116 = v20:switch("\a{Link Active}" .. ui.get_icon("face-swear") .. "\aFFFFFFFF Kill Say");
local v117 = v20:switch("\a{Link Active}" .. ui.get_icon("gun") .. "\aFFFFFFFF Force Teammate AimBot");
local v118 = v20:switch("\a{Link Active}" .. ui.get_icon("water-ladder") .. "\aFFFFFFFF Fast Ladder");
local v119 = v20:switch("\a{Link Active}" .. ui.get_icon("message-text") .. "\aFFFFFFFF Clan Tag");
local v120 = v20:slider("\a{Link Active}" .. ui.get_icon("signal-bars") .. "\aFFFFFFFF Ping Spike", 0, 375, 0);
ui.find("Miscellaneous", "Main", "Other", "Fake Latency"):disabled(true);
ui.find("Miscellaneous", "Main", "In-Game", "Clan Tag"):disabled(true);
local function v122()
    -- upvalues: v120 (ref)
    local v121 = v120:get();
    ui.find("Miscellaneous", "Main", "Other", "Fake Latency"):override(v121);
end;
v120:set_callback(v122);
v122();
local function v124()
    -- upvalues: v87 (ref), v91 (ref), v99 (ref), v106 (ref), v107 (ref), v98 (ref), v92 (ref), v93 (ref), v94 (ref), v95 (ref), v96 (ref), v97 (ref), v105 (ref), v111 (ref), v112 (ref), v108 (ref), v113 (ref), v114 (ref), v25 (ref), v23 (ref), v26 (ref), v110 (ref), v115 (ref), v116 (ref), v118 (ref), v120 (ref), v117 (ref), v119 (ref)
    local v123 = v87:get();
    v91:visibility(v123 == 1);
    v99:visibility(v123 == 1);
    v106:visibility(v123 == 1);
    v107:visibility(v123 == 1);
    v98:visibility(v123 == 1);
    v92:visibility(v123 == 1);
    v93:visibility(v123 == 1);
    v94:visibility(v123 == 1);
    v95:visibility(v123 == 1);
    v96:visibility(v123 == 1);
    v97:visibility(v123 == 1);
    v105:visibility(v123 == 1);
    v111:visibility(v123 == 1);
    v112:visibility(v123 == 1);
    v108:visibility(v123 == 1);
    v113:visibility(v123 == 1);
    v114:visibility(v123 == 1);
    v25:visibility(v123 == 1);
    v23:visibility(v123 == 1);
    v26:visibility(v123 == 1);
    v110:visibility(v123 == 1);
    v115:visibility(v123 == 2);
    v116:visibility(v123 == 2);
    v118:visibility(v123 == 2);
    v120:visibility(v123 == 2);
    v117:visibility(v123 == 2);
    v119:visibility(v123 == 2);
end;
v124();
v87:set_callback(v124, true);
local v125 = 0;
local function v131(v126, v127, v128, v129, v130)
    -- upvalues: v125 (ref)
    v129 = v129 + 1;
    if v126.send_packet and v126.choked_commands < 1 then
        v125 = math.floor(globals.tickcount / v129 % 2) == 0 and 1 or 2;
        return v125 == 1 and v127 - math.random(0, v130) or v128 + math.random(0, v130);
    else
        return;
    end;
end;
local function v138(v132, v133, v134)
    -- upvalues: v125 (ref)
    local v135 = entity.get_local_player();
    if v135 == nil or not v135:is_alive() or not globals.is_connected then
        return;
    else
        if jitter_timer == nil then
            jitter_timer = 0;
        end;
        local v136 = math.max(1, v134);
        if globals.choked_commands == 0 then
            jitter_timer = jitter_timer + 1;
            if jitter_timer % v136 == 0 then
                jitter_state = not jitter_state;
            end;
        end;
        local v137 = 0;
        if jitter_state then
            v137 = v132;
            v125 = 1;
        else
            v137 = v133;
            v125 = 2;
        end;
        return v137;
    end;
end;
local function v145()
    -- upvalues: l_mtools_0 (ref), v73 (ref)
    l_mtools_0.AntiAims.Condition.Update();
    local v139 = entity.get_local_player();
    if not v139 or not v139:is_alive() then
        return;
    else
        local l_m_vecVelocity_0 = v139.m_vecVelocity;
        if not l_m_vecVelocity_0 then
            return;
        else
            local l_x_0 = l_m_vecVelocity_0.x;
            local l_y_0 = l_m_vecVelocity_0.y;
            local v143 = math.sqrt(l_x_0 ^ 2 + l_y_0 ^ 2);
            local v144 = l_mtools_0.AntiAims.Condition:Get();
            if v144 == "C" and v143 > 13 then
                return "CR";
            elseif v73:get() then
                return "FS";
            else
                return v144;
            end;
        end;
    end;
end;
defense_system = {
    current_command = 0, 
    max_tick_base = 0, 
    ticks_count = 0, 
    is_defensive = 0
};
update_defensive_ticks = function(v146)
    -- upvalues: v71 (ref)
    defense_system.current_command = v146.command_number;
    local v147 = entity.get_local_player();
    if not v147 or not v147:is_alive() then
        return 0;
    else
        local l_tickcount_0 = globals.tickcount;
        local v149 = v147.m_nTickBase or 0;
        local v150 = v149 < l_tickcount_0;
        if math.abs(v149 - defense_system.max_tick_base) > 64 and v150 then
            defense_system.max_tick_base = 0;
        end;
        if defense_system.max_tick_base < v149 then
            defense_system.max_tick_base = v149;
        elseif v149 < defense_system.max_tick_base then
            defense_system.ticks_count = v150 and math.min(14, math.max(0, defense_system.max_tick_base - v149 - 1)) or 0;
        end;
        defense_system.is_defensive = v71:get() == "Off" and defense_system.ticks_count > 1;
        return;
    end;
end;
events.createmove:set(function(v151)
    update_defensive_ticks(v151);
end);
local v152 = 0;
local v153 = 1;
local function v158(v154, v155, v156)
    -- upvalues: v153 (ref), v152 (ref)
    local v157 = 1 / (globals.frametime * v156 * 2) * v153;
    v152 = v152 + v157;
    if v155 <= v152 then
        v152 = v155;
        v153 = -1;
    elseif v152 <= v154 then
        v152 = v154;
        v153 = 1;
    end;
    return v152;
end;
local v159 = 0;
local v160 = true;
local function v166(v161, v162, v163)
    -- upvalues: v159 (ref), v160 (ref)
    local v164 = 10 / v163;
    local l_v159_0 = v159;
    if v160 then
        v159 = v159 + v164;
        if v162 <= v159 then
            v159 = v162;
            v160 = false;
        end;
    else
        v159 = v159 - v164;
        if v159 <= v161 then
            v159 = v161;
            v160 = true;
        end;
    end;
    return l_v159_0;
end;
local function v202(v167)
    -- upvalues: v79 (ref), v73 (ref), v74 (ref), v145 (ref), v45 (ref), v47 (ref), v81 (ref), v71 (ref), v131 (ref), v125 (ref), v158 (ref), v138 (ref), v166 (ref), l_yaw_0 (ref), v80 (ref), v72 (ref)
    ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"):override(false):disabled(true);
    ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"):override(""):disabled(true);
    ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"):override("Down"):disabled(true);
    ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"):override("Backward"):disabled(true);
    ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"):override("At Target"):disabled(true);
    ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden"):override(false):disabled(true);
    ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab"):override(v79:get()):disabled(true);
    ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles"):override(false):disabled(true);
    ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"):override(false):disabled(true);
    ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"):override(true):disabled(true);
    ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding"):override("Off"):disabled(true);
    ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"):override(v73:get()):disabled(true);
    ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Disable Yaw Modifiers"):override(v74:get()):disabled(true);
    ui.find("Aimbot", "Anti Aim", "Angles", "Enabled"):override(true):disabled(true);
    local v168 = entity.get_local_player();
    if not v168 and not v168:is_alive() then
        return;
    elseif not globals.is_connected then
        return;
    else
        local v169 = v145();
        local v170 = nil;
        local v171 = nil;
        if v169 == "S" then
            v170 = v45[2];
            v171 = 2;
        elseif v169 == "A" then
            v170 = v45[7];
            v171 = 7;
        elseif v169 == "AC" then
            v170 = v45[8];
            v171 = 8;
        elseif v169 == "W" then
            v170 = v45[3];
            v171 = 3;
        elseif v169 == "C" then
            v170 = v45[5];
            v171 = 5;
        elseif v169 == "SW" then
            v170 = v45[4];
            v171 = 4;
        elseif v169 == "CR" then
            v170 = v45[6];
            v171 = 6;
        elseif v169 == "NE" then
            v170 = v45[1];
            v171 = 1;
        elseif v169 == "FS" then
            v170 = v45[9];
            v171 = 9;
        end;
        if v170.allow_switch and not v170.allow_switch:get() then
            v170 = v45[1];
            v171 = 1;
        end;
        local v172 = v170.yaw_combo:get();
        local v173 = v170.yaw_add:get();
        local v174 = v170.yaw_add_gl:get();
        local v175 = v170.yaw_left:get() + v174;
        local v176 = v170.yaw_right:get() + v174;
        local v177 = v170.delay_ticks:get();
        local v178 = v170.randomize_yaw:get();
        local v179 = v170.body_yaw_options:get("Jitter");
        local v180 = v170.yaw_modifier:get();
        local v181 = v170.yaw_offset:get();
        local v182 = v170.body_yaw_limit:get();
        local _ = v170.break_lc:get();
        local v184 = v170.defensive_snap:get();
        local v185 = v170.defensive_pitch_combo:get();
        local v186 = v170.defensive_pitch_custom:get();
        local v187 = v170.defensive_pitch_1:get();
        local v188 = v170.defensive_pitch_2:get();
        local v189 = v170.defensive_pitch_delay:get();
        local v190 = v170.defensive_group_yaw_combo:get();
        local v191 = v170.defensive_yaw_custom:get();
        local v192 = v170.defensive_yaw_3:get();
        local v193 = v170.defensive_yaw_1:get();
        local v194 = v170.defensive_yaw_2:get();
        local v195 = v170.defensive_yaw_delay:get();
        if v170 then
            local v196 = v47[v171] and v47[v171].snap_slider:get();
            local v197 = v170.break_lc:get();
            local v198 = v47[v171] and v47[v171].choke_slider and v47[v171].choke_slider:get();
            if v197 == "Always On" and v196 == 2 then
                v167.force_defensive = v167.command_number % v198 + 1 == 1;
            elseif v197 == "On Peek" then
                ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"):override("On Peek");
            else
                ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"):override("Always On");
            end;
        end;
        ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"):override(v180):disabled(true);
        ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"):override(v181);
        ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"):override(v182);
        ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"):override(v182);
        if defense_system.is_defensive and v184 and not v81:get(true) and v71:get() == "Off" then
            ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden"):override(true);
        end;
        if defense_system.ticks_count > 0 and v184 and not v81:get(true) and v71:get() == "Off" then
            ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"):override(0);
            ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"):override(0);
        end;
        if v172 == "180" then
            ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"):override(v173);
        elseif v172 == "Delayed" then
            local v199 = v131(v167, v175, v176, v177, v178);
            if v199 then
                ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"):override(v199);
            end;
        end;
        if v179 == true and v172 == "Delayed" then
            ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"):override(v125 == 1);
        elseif v179 == true and v172 == "180" then
            ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"):override(false);
            ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"):override("Jitter");
        elseif defense_system.is_defensive then
            ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"):override(false);
        end;
        if v185 == "Custom" and defense_system.is_defensive then
            rage.antiaim:override_hidden_pitch(v186);
        elseif v185 == "Sway" and defense_system.is_defensive then
            rage.antiaim:override_hidden_pitch(v158(v187, v188, v189));
        elseif v185 == "Jitter" and defense_system.is_defensive then
            rage.antiaim:override_hidden_pitch(v138(v187, v188, v189));
        elseif v185 == "Random" and defense_system.is_defensive then
            rage.antiaim:override_hidden_pitch(math.random(v187, v188));
        end;
        if v190 == "Custom" and defense_system.is_defensive then
            rage.antiaim:override_hidden_yaw_offset(v191);
        elseif v190 == "Spin" and defense_system.is_defensive then
            spn = v192 * 10;
            rage.antiaim:override_hidden_yaw_offset(-math.normalize_yaw(globals.curtime * spn));
        elseif v190 == "Jitter" and defense_system.is_defensive then
            rage.antiaim:override_hidden_yaw_offset(-v138(v193, v194, v195));
        elseif v190 == "Random" and defense_system.is_defensive then
            rage.antiaim:override_hidden_yaw_offset(math.random(v193, v194));
        elseif v190 == "Smooth" and defense_system.is_defensive then
            rage.antiaim:override_hidden_yaw_offset(v166(v193, v194, v195));
        end;
        local v200 = l_yaw_0:get();
        local v201 = v80:get();
        if v200 and v201 and (v200 > 20 or v200 < -20) and v201 then
            ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"):override(v200);
            ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden"):override(false);
        end;
        if v71:get() == "Left" and v72:get() then
            ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"):override("Always On");
            ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden"):override(true);
            ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"):override(-90);
            rage.antiaim:override_hidden_yaw_offset(180);
            rage.antiaim:override_hidden_pitch(v158(-15, 15, 10));
            ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"):override(0);
            ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"):override(true);
            ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"):override("");
            ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"):override("Local View");
        elseif v71:get() == "Right" and v72:get() then
            ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"):override("Always On");
            ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden"):override(true);
            ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"):override(90);
            ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"):override(false);
            ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"):override(0);
            ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"):override("");
            rage.antiaim:override_hidden_yaw_offset(-180);
            rage.antiaim:override_hidden_pitch(v158(-15, 15, 7));
            ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"):override("Local View");
        elseif v71:get() == "Right" and not v72:get() then
            ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"):override(90);
            ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"):override("Local View");
            ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"):override(0);
            ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"):override(false);
            ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"):override("");
        elseif v71:get() == "Left" and not v72:get() then
            ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"):override(-90);
            ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"):override("Local View");
            ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"):override(0);
            ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"):override(true);
            ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"):override("");
        elseif v71:get() == "Forward" then
            ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"):override(-180);
            ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"):override("Local View");
            ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"):override(0);
            ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"):override(false);
            ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"):override("");
        end;
        return;
    end;
end;
events.createmove:set(v202);
cat = 1;
pch_exp = nil;
yaw_exp = nil;
local function v204()
    local v203 = math.random(1, 4);
    if v203 == 1 or v203 == 4 then
        return -80;
    elseif v203 == 2 or v203 == 3 then
        return 80;
    else
        return;
    end;
end;
local function _()
    local v205 = math.random(1, 7);
    if v205 == 1 or v205 == 4 then
        return true;
    elseif v205 == 2 or v205 == 3 or v205 == 5 or v205 == 6 or v205 == 7 then
        return false;
    else
        return;
    end;
end;
handle = function(v207)
    -- upvalues: v81 (ref), v84 (ref), v85 (ref), v204 (ref), v83 (ref)
    if not v81:get(true) then
        return;
    elseif rage.exploit:get() < 1 then
        return;
    else
        if v84:get() == "Default" then
            pch_exp = 89;
            yaw_exp = v85:get() and 78 or -78;
        elseif v84:get() == "Experemental" then
            yaw_exp = v85:get() and 80 or -80;
            pch_exp = math.random(-3, 1);
        elseif v84:get() == "Jitter" then
            yaw_exp = v204();
            pch_exp = math.random(-3, 4);
        elseif v84:get() == "Chimera" then
            yaw_exp = v85:get() and 80 or -80;
            pch_exp = math.random(-60, 68);
        end;
        if cat == 1 then
            ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"):override(0);
            ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"):override(0);
            rage.antiaim:inverter(false);
            rage.antiaim:override_hidden_pitch(pch_exp);
            rage.antiaim:override_hidden_yaw_offset(yaw_exp);
            ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden"):override(true);
            if v83:get() == "1" then
                v207.force_defensive = globals.commandack % math.random(2, 3) == 1;
            elseif v83:get() == "2" then
                v207.force_defensive = globals.tickcount % math.random(4, 7) == 0;
            end;
        end;
        return;
    end;
end;
events.createmove:set(handle);
local function v214()
    -- upvalues: l_mtools_0 (ref), v78 (ref), v75 (ref), v77 (ref)
    local v208 = entity.get_local_player();
    if not v208 or not v208:is_alive() then
        return;
    else
        local v209 = v208:get_player_weapon();
        if not v209 then
            return;
        else
            local v210 = v209:get_classname();
            local v211 = l_mtools_0.AntiAims.Condition:Get();
            local v212 = v210 == "CKnife" or v210:lower():find("knife");
            local v213 = v210 == "CWeaponTaser";
            if v78:get("On Lethal") and v208.m_iHealth <= 92 or v78:get("On Lethal") and v208.m_ArmorValue == 0 then
                return;
            else
                if (v212 and v75:get("knife") or v213 and v75:get("zeus")) and v211 == "AC" then
                    ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"):override("Down");
                    ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"):override("Backward");
                    ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"):override(0);
                    ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden"):override(false);
                    ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"):override("On Peek");
                    rage.antiaim:inverter(true);
                    if v77:get() then
                        ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden"):override(true);
                        ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"):override("Always On");
                        rage.antiaim:override_hidden_yaw_offset(-180);
                        rage.antiaim:override_hidden_pitch(0);
                    end;
                end;
                return;
            end;
        end;
    end;
end;
events.createmove:set(v214);
local function v217(v215)
    -- upvalues: v118 (ref)
    local v216 = entity.get_local_player();
    if v118:get() and v216.m_MoveType == 9 then
        if v215.forwardmove > 0 and render.camera_angles().x < 45 then
            v215.view_angles.x = 89;
            v215.in_moveright = 1;
            v215.in_moveleft = 0;
            v215.in_forward = 0;
            v215.in_back = 1;
            if v215.sidemove == 0 then
                v215.view_angles.y = v215.view_angles.y + 90;
            end;
            if v215.sidemove < 0 then
                v215.view_angles.y = v215.view_angles.y + 150;
            end;
            if v215.sidemove > 0 then
                v215.view_angles.y = v215.view_angles.y + 30;
            end;
        end;
        if v215.forwardmove < 0 then
            v215.view_angles.x = 89;
            v215.in_moveleft = 1;
            v215.in_moveright = 0;
            v215.in_forward = 1;
            v215.in_back = 0;
            if v215.sidemove == 0 then
                v215.view_angles.y = v215.view_angles.y + 90;
            end;
            if v215.sidemove > 0 then
                v215.view_angles.y = v215.view_angles.y + 150;
            end;
            if v215.sidemove < 0 then
                v215.view_angles.y = v215.view_angles.y + 30;
            end;
        end;
    end;
end;
events.createmove:set(v217);
local function v220(v218, v219)
    if not v218 or not v219 then
        return math.huge;
    else
        return math.ceil((v218 - v219):length());
    end;
end;
local function v222(v221)
    if v221 == nil then
        return false;
    else
        return v221.m_iItemDefinitionIndex == 64;
    end;
end;
local function v232(v223, v224)
    -- upvalues: v222 (ref), v220 (ref)
    if not v223 or not v224 then
        return "N/A";
    else
        local v225 = v223:get_player_weapon();
        if not v222(v225) then
            return "N/A";
        else
            local v226 = v223:get_origin();
            local v227 = v224:get_origin();
            if not v226 or not v227 then
                return "N/A";
            else
                local v228 = v220(v226, v227);
                local v229 = v224.m_ArmorValue == 0;
                local v230 = v226.z - v227.z;
                local _ = nil;
                return v230 > 100 and v228 < 300 and "DMG+" or v228 > 585 and "N/A" or v228 < 585 and v228 > 511 and "DMG" or v228 <= 511 and v229 and "DMG+" or v228 <= 190 and "DMG+" or "DMG";
            end;
        end;
    end;
end;
esp.enemy:new_text("Revolver Helper", "DMG", function(v233)
    -- upvalues: v222 (ref), v232 (ref)
    local v234 = entity.get_local_player();
    if not v234 or not v234:is_alive() then
        return "";
    else
        local v235 = v234:get_player_weapon();
        if not v222(v235) then
            return "";
        else
            local v236 = v232(v234, v233);
            return v236 ~= "N/A" and v236 or "";
        end;
    end;
end);
local v237 = 0;
local function v245(v238, v239, v240)
    -- upvalues: v98 (ref), v237 (ref)
    if not v98:get() then
        return;
    else
        local v241 = ui.get_alpha() == 1;
        local v242 = render.screen_size();
        local v243 = vector(0, 0);
        local v244 = vector(v242.x, v242.y);
        if v241 then
            v237 = v237 + (v239 - v237) * globals.frametime * 10;
        else
            v237 = v237 + (0 - v237) * globals.frametime * 10;
        end;
        render.blur(v243 - 100, v244 + 200, v238, v237, v240 or 0);
        return;
    end;
end;
events.render:set(function()
    -- upvalues: v245 (ref)
    v245(0.3, 1, 1);
end);
local v246 = render.screen_size();
local v247 = 200;
local v248 = 10;
local v249 = render.load_font("Tahoma", 14, "ab");
local v250 = 0;
local v251 = 0;
local v252 = ui.create("Main"):slider("Velocity Indicator X", 0, v246.x, (v246.x - v247) / 2):visibility(false);
local v253 = ui.create("Main"):slider("Velocity Indicator Y", 0, v246.y, (v246.y - v248) / 2 - 200):visibility(false);
local v255 = l_system_0.register({
    [1] = v252, 
    [2] = v253
}, vector(v247, v248), "Velocity Indicator", function(_)

end);
local function v271(v256)
    -- upvalues: v106 (ref), v250 (ref), v30 (ref), v247 (ref), v251 (ref), v246 (ref), v249 (ref)
    if not v106:get() then
        return;
    else
        local v257 = entity.get_local_player();
        local v258 = ui.get_alpha() == 1;
        local v259 = 1;
        if v257 and v257:is_alive() then
            v259 = v257.m_flVelocityModifier or 1;
        end;
        local v260 = (not not v258 or v259 < 1) and 255 or 0;
        v250 = v30(v250, v260, globals.frametime * 8);
        local v261 = v259 * v247;
        v251 = v30(v251, v261, globals.frametime * 8);
        if v250 > 0 then
            local v262 = string.format("Slowed: %d%%", math.floor(v259 * 100));
            local v263 = ui.get_mouse_position();
            local v264 = v263.x >= v256.position.x and v263.x <= v256.position.x + v256.size.x and v263.y >= v256.position.y and v263.y <= v256.position.y + v256.size.y;
            if v258 and common.is_button_down(2) and v264 then
                v256.position.x = (v246.x - v247) / 2;
            end;
            if v258 and v264 then
                render.text(v249, vector(v263.x + 10, v263.y + 35), color(255, 255, 255, v250), "c", "RMB TO CENTER");
            end;
            local v265 = render.measure_text(v249, v262);
            local v266 = v256.position.x + (v256.size.x - v265.x) / 2;
            local v267 = v256.position.y + v256.size.y + 11;
            local v268 = color(255 * (1 - v259), 255 * v259, 0, math.floor(v250 * 0.6));
            local v269 = v258 and 0 or 0;
            local v270 = -6;
            render.shadow(vector(v256.position.x + 2, v256.position.y + v256.size.y + v270), vector(v256.position.x + v247 - 2, v256.position.y + v256.size.y + v270 + 4), v268, 43, 0, 5);
            if v258 then
                render.rect_outline(vector(v256.position.x - 5, v256.position.y - 5 + v269), vector(v256.position.x + v247 + 5, v256.position.y + v256.size.y + 30 + v269), color(255, 255, 255, math.floor(v250)), 1, 5);
            end;
            render.rect(vector(v256.position.x + 2, v256.position.y + 2 + v269), vector(v256.position.x + v251 - 2, v256.position.y + v256.size.y - 2 + v269), v268, 5);
            render.text(v249, vector(v266, v267), color(255, 255, 255, math.floor(v250)), "cb", v262);
        end;
        return;
    end;
end;
events.render:set(function()
    -- upvalues: v255 (ref), v271 (ref)
    v255:update();
    v271(v255);
end);
local function v273(v272)
    -- upvalues: v106 (ref)
    if ui.get_alpha() == 1 and v106:get() then
        v272.in_attack = 0;
        v272.in_attack2 = 0;
    else
        v272.in_attack = v272.in_attack;
        v272.in_attack2 = v272.in_attack2;
    end;
end;
events.createmove:set(v273);
local v274 = {};
local v275 = 0.095;
local function v280(v276, v277, v278, v279)
    -- upvalues: v275 (ref), v274 (ref), v30 (ref)
    if not v278 then
        v278 = v275;
    end;
    if v274[v276] == nil then
        v274[v276] = v279 or 0;
    end;
    v274[v276] = v30(v274[v276], v277, v278);
    return v274[v276];
end;
local function v283()
    -- upvalues: v91 (ref), v280 (ref)
    if entity.get_local_player() == nil then
        return;
    else
        if v91:get() == 59 then
            cvar.r_aspectratio:float(0);
        else
            local v281 = v91:get() / 100;
            local v282 = v280("aspect_ratio", v281, 0.095);
            cvar.r_aspectratio:float(v282);
        end;
        return;
    end;
end;
events.render:set(v283);
local function v284()
    -- upvalues: v117 (ref)
    cvar.mp_teammates_are_enemies:float(v117:get() and 1 or 0);
end;
v117:set_callback(v284);
events.createmove:set(v284);
local v285 = {
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
local _ = {};
local _ = 1;
local v288 = {};
local v289 = 1;
events.aim_ack:set(function(v290)
    -- upvalues: v107 (ref), v285 (ref), v288 (ref), v289 (ref)
    if not v107:get() then
        return;
    else
        local _ = entity.get_local_player();
        local l_state_0 = v290.state;
        local v293 = entity.get(v290.target);
        if not v293 then
            return;
        else
            local l_m_iHealth_0 = v293.m_iHealth;
            local v295 = "";
            local v296 = v290.hitchance or "N/A";
            local v297 = v290.backtrack or "N/A";
            local v298 = v290.wanted_damage or "N/A";
            local v299 = v285[v290.wanted_hitgroup] or "unknown";
            if l_state_0 ~= nil then
                v295 = l_state_0;
            end;
            if l_state_0 == nil then
                local v300 = string.format("\a{Link Active}" .. "MeowStar \194\183 \aFFFFFFFFRegistered shot in %s's %s (hc: %s%%, dmg: %d, aimed: %s, health remaining: %d, bt: %dt)", v293:get_name(), v299, v296, v290.damage, v298, l_m_iHealth_0, v297);
                table.insert(v288, {
                    [1] = nil, 
                    [2] = nil, 
                    [3] = 0, 
                    [1] = v300, 
                    [2] = globals.tickcount + 255
                });
                print_raw(v300);
                print_dev(v300);
            else
                local v301 = string.format("\a{Link Active}" .. "MeowStar \194\183 \aFFFFFFFFMissed shot in %s's %s due to %s (dmg: %s, hc: %s%%, bt: %dt)", v293:get_name(), v299, v295, v298, v296, v297);
                table.insert(v288, {
                    [1] = nil, 
                    [2] = nil, 
                    [3] = 0, 
                    [1] = v301, 
                    [2] = globals.tickcount + 255
                });
                print_raw(v301);
                print_dev(v301);
            end;
            v289 = v289 >= 999 and 1 or v289 + 1;
            return;
        end;
    end;
end);
hit_event = function(v302)
    -- upvalues: v107 (ref), v288 (ref), v289 (ref)
    if not v107:get() then
        return;
    else
        local v303 = entity.get_local_player();
        local v304 = entity.get(v302.attacker, true);
        local l_weapon_0 = v302.weapon;
        local v306 = "";
        if l_weapon_0 == "hegrenade" then
            v306 = "Exploded";
        elseif l_weapon_0 == "inferno" then
            v306 = "Fired";
        elseif l_weapon_0 == "knife" then
            v306 = "Knifed";
        end;
        if v306 ~= "" and v303 == v304 then
            local v307 = entity.get(v302.userid, true);
            local v308 = string.format("\a{Link Active}" .. "MeowStar \194\183 \aFFFFFFFF%s %s for %d damage (%d health remaining)", v306, v307:get_name(), v302.dmg_health, v302.health);
            table.insert(v288, {
                [1] = nil, 
                [2] = nil, 
                [3] = 0, 
                [1] = v308, 
                [2] = globals.tickcount + 250
            });
            print_raw(v308);
            print_dev(v308);
            v289 = v289 >= 999 and 1 or v289 + 1;
        end;
        return;
    end;
end;
events.player_hurt:set(function(v309)
    hit_event(v309);
end);
local v310 = 0;
local function v323()
    -- upvalues: v99 (ref), v101 (ref), v102 (ref), v103 (ref), v310 (ref), v30 (ref), v104 (ref)
    local v311 = ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay");
    if not v99:get() then
        v311:set("Remove overlay");
        return;
    else
        local v312 = entity.get_local_player();
        if not v312 or not v312:is_alive() or common.is_button_down(9) then
            return;
        else
            local v313 = render.screen_size();
            local l_m_bIsScoped_0 = v312.m_bIsScoped;
            local l_frametime_0 = globals.frametime;
            local v316 = v101:get();
            local v317 = v102:get();
            local v318 = v103:get();
            v311:set("Remove All");
            v310 = v30(v310, l_m_bIsScoped_0 and 1 or 0, 12 * l_frametime_0);
            if not l_m_bIsScoped_0 and v310 < 0.05 then
                return;
            else
                local v319 = v313.x / 2;
                local v320 = v313.y / 2;
                local v321 = v317 * v310;
                local v322 = v318 * v310;
                if not v104:get() then
                    render.gradient(vector(v319 - v321, v320), vector(v319 - v321 - v322, v320 + 1), v316, color(255, 255, 255, 0), v316, color(255, 255, 255, 0));
                    render.gradient(vector(v319 + v321 + 1, v320), vector(v319 + v321 + v322, v320 + 1), v316, color(255, 255, 255, 0), v316, color(255, 255, 255, 0));
                    render.gradient(vector(v319, v320 + v321), vector(v319 + 1, v320 + v321 + v322), v316, v316, color(255, 255, 255, 0), color(255, 255, 255, 0));
                    render.gradient(vector(v319, v320 - v321), vector(v319 + 1, v320 - v321 - v322), v316, v316, color(255, 255, 255, 0), color(255, 255, 255, 0));
                end;
                if v104:get() then
                    render.gradient(vector(v319 - v321, v320), vector(v319 - v321 - v322, v320 + 1), v316, color(255, 255, 255, 0), v316, color(255, 255, 255, 0));
                    render.gradient(vector(v319 + v321 + 1, v320), vector(v319 + v321 + v322, v320 + 1), v316, color(255, 255, 255, 0), v316, color(255, 255, 255, 0));
                    render.gradient(vector(v319, v320 + v321), vector(v319 + 1, v320 + v321 + v322), v316, v316, color(255, 255, 255, 0), color(255, 255, 255, 0));
                end;
                return;
            end;
        end;
    end;
end;
events.render:set(v323);
local function v328(v324)
    -- upvalues: v115 (ref)
    if not v115:get() then
        return;
    else
        local v325 = entity.get_local_player();
        if v325 == nil or not v325:is_alive() then
            return;
        else
            rage.exploit:allow_defensive(true);
            local v326 = v325:get_player_weapon();
            if v326 == nil then
                return;
            else
                local v327 = v326:get_classname();
                if v327 and string.find(v327, "Grenade") then
                    rage.exploit:allow_defensive(false);
                    v324.force_defensive = false;
                end;
                return;
            end;
        end;
    end;
end;
events.createmove:set(v328);
local function v333()
    -- upvalues: v118 (ref), v79 (ref), v80 (ref), v81 (ref), v86 (ref), v83 (ref), v84 (ref), v73 (ref), v74 (ref), v72 (ref), v75 (ref), v71 (ref), v91 (ref), v99 (ref), v101 (ref), v102 (ref), v103 (ref), v104 (ref), v106 (ref), v107 (ref), v108 (ref), v109 (ref), v111 (ref), v112 (ref), v98 (ref), v105 (ref), v113 (ref), v26 (ref), v23 (ref), v25 (ref), v115 (ref), v116 (ref), v77 (ref), v78 (ref), v120 (ref), v117 (ref), v119 (ref), v45 (ref), v47 (ref), l_base64_0 (ref)
    local v329 = {
        tweaks = {
            fast_ladder = v118:get(), 
            backstab = v79:get(), 
            edge_yaw_sw = v80:get(), 
            flick_exp = v81:get(), 
            airlag = v86:get(), 
            break_type_exp = v83:get(), 
            exp_type = v84:get(), 
            freestand = v73:get(), 
            static_fs = v74:get(), 
            peek_opposite = v72:get(), 
            safehead = v75:get(), 
            manual_yaw = v71:get()
        }, 
        visuals = {
            aspect_ratio = v91:get(), 
            custom_scope = v99:get(), 
            custom_scope_color = v101:get(), 
            custom_scope_gap = v102:get(), 
            custom_scope_size = v103:get(), 
            t_style = v104:get(), 
            velocity_warning = v106:get(), 
            logs = v107:get(), 
            crosshitmarker = v108:get(), 
            clr = v109:get(), 
            skeet_2 = v111:get(), 
            watermark = v112:get(), 
            blur_sw = v98:get(), 
            spectators = v105:get(), 
            fov = fov:get(), 
            viewmodel = v113:get(), 
            x_view = x_view:get(), 
            y_view = y_view:get(), 
            z_view = z_view:get(), 
            addons = v26:get(), 
            walk_break = v23:get(), 
            air_break = v25:get()
        }, 
        misc = {
            nade_fix = v115:get(), 
            kill_say = v116:get(), 
            espam = v77:get(), 
            disabler_sh = v78:get(), 
            ping_spike = v120:get(), 
            team_aimbot = v117:get(), 
            tag = v119:get()
        }, 
        states = {}
    };
    for v330, v331 in pairs(v45) do
        v329.states[v330] = {
            allow_switch = v331.allow_switch and v331.allow_switch:get() or false, 
            yaw_combo = v331.yaw_combo:get(), 
            yaw_add = v331.yaw_add:get(), 
            yaw_add_gl = v331.yaw_add_gl:get(), 
            yaw_left = v331.yaw_left:get(), 
            yaw_right = v331.yaw_right:get(), 
            delay_ticks = v331.delay_ticks:get(), 
            randomize_yaw = v331.randomize_yaw:get(), 
            yaw_modifier = v331.yaw_modifier:get(), 
            yaw_offset = v331.yaw_offset:get(), 
            body_yaw_limit = v331.body_yaw_limit:get(), 
            body_yaw_options = v331.body_yaw_options and v331.body_yaw_options:get() or {}, 
            break_lc = v331.break_lc:get(), 
            defensive_snap = v331.defensive_snap:get(), 
            defensive_pitch_combo = v331.defensive_pitch_combo:get(), 
            defensive_pitch_custom = v331.defensive_pitch_custom:get(), 
            defensive_pitch_1 = v331.defensive_pitch_1:get(), 
            defensive_pitch_2 = v331.defensive_pitch_2:get(), 
            defensive_pitch_delay = v331.defensive_pitch_delay:get(), 
            defensive_group_yaw_combo = v331.defensive_group_yaw_combo:get(), 
            defensive_yaw_custom = v331.defensive_yaw_custom:get(), 
            defensive_yaw_1 = v331.defensive_yaw_1:get(), 
            defensive_yaw_2 = v331.defensive_yaw_2:get(), 
            defensive_yaw_3 = v331.defensive_yaw_3:get(), 
            defensive_yaw_delay = v331.defensive_yaw_delay:get(), 
            break_type = v47[v330] and v47[v330].snap_slider:get() or nil, 
            choke_value = v47[v330] and v47[v330].choke_slider:get() or nil
        };
    end;
    local v332 = json.stringify(v329);
    return (l_base64_0.encode(v332));
end;
local function v341(v334)
    -- upvalues: l_base64_0 (ref), v118 (ref), v79 (ref), v80 (ref), v81 (ref), v86 (ref), v83 (ref), v84 (ref), v73 (ref), v74 (ref), v72 (ref), v71 (ref), v91 (ref), v99 (ref), v101 (ref), v102 (ref), v103 (ref), v104 (ref), v106 (ref), v107 (ref), v108 (ref), v109 (ref), v111 (ref), v112 (ref), v98 (ref), v115 (ref), v116 (ref), v75 (ref), v77 (ref), v78 (ref), v26 (ref), v25 (ref), v23 (ref), v120 (ref), v105 (ref), v117 (ref), v119 (ref), v113 (ref), v45 (ref), v47 (ref)
    if not v334 or v334 == "" then
        return;
    else
        local v335 = l_base64_0.decode(v334);
        local l_status_0, l_result_0 = pcall(json.parse, v335);
        if not l_status_0 then
            return;
        else
            v118:set(l_result_0.tweaks.fast_ladder);
            v79:set(l_result_0.tweaks.backstab);
            v80:set(l_result_0.tweaks.edge_yaw_sw);
            v81:set(l_result_0.tweaks.flick_exp);
            v86:set(l_result_0.tweaks.airlag);
            v83:set(l_result_0.tweaks.break_type_exp);
            v84:set(l_result_0.tweaks.exp_type);
            v73:set(l_result_0.tweaks.freestand);
            v74:set(l_result_0.tweaks.static_fs);
            v72:set(l_result_0.tweaks.peek_opposite);
            v71:set(l_result_0.tweaks.manual_yaw);
            v91:set(l_result_0.visuals.aspect_ratio);
            v99:set(l_result_0.visuals.custom_scope);
            v101:set(l_result_0.visuals.custom_scope_color);
            v102:set(l_result_0.visuals.custom_scope_gap);
            v103:set(l_result_0.visuals.custom_scope_size);
            v104:set(l_result_0.visuals.t_style);
            v106:set(l_result_0.visuals.velocity_warning);
            v107:set(l_result_0.visuals.logs);
            v108:set(l_result_0.visuals.crosshitmarker);
            v109:set(l_result_0.visuals.clr);
            v111:set(l_result_0.visuals.skeet_2);
            v112:set(l_result_0.visuals.watermark);
            v98:set(l_result_0.visuals.blur_sw);
            v115:set(l_result_0.misc.nade_fix);
            v116:set(l_result_0.misc.kill_say);
            v75:set(l_result_0.tweaks.safehead);
            v77:set(l_result_0.misc.espam);
            v78:set(l_result_0.misc.disabler_sh);
            v26:set(l_result_0.visuals.addons);
            v25:set(l_result_0.visuals.air_break);
            v23:set(l_result_0.visuals.walk_break);
            v120:set(l_result_0.misc.ping_spike);
            v105:set(l_result_0.visuals.spectators);
            v117:set(l_result_0.misc.team_aimbot);
            v119:set(l_result_0.misc.tag);
            fov:set(l_result_0.visuals.fov);
            v113:set(l_result_0.visuals.viewmodel);
            x_view:set(l_result_0.visuals.x_view);
            y_view:set(l_result_0.visuals.y_view);
            z_view:set(l_result_0.visuals.z_view);
            for v338, v339 in pairs(l_result_0.states) do
                local v340 = v45[v338];
                if v340 then
                    if v339.allow_switch ~= nil and v340.allow_switch then
                        v340.allow_switch:set(v339.allow_switch);
                    end;
                    v340.yaw_combo:set(v339.yaw_combo);
                    v340.yaw_add:set(v339.yaw_add);
                    v340.yaw_add_gl:set(v339.yaw_add_gl);
                    v340.yaw_left:set(v339.yaw_left);
                    v340.yaw_right:set(v339.yaw_right);
                    v340.delay_ticks:set(v339.delay_ticks);
                    v340.randomize_yaw:set(v339.randomize_yaw);
                    v340.yaw_modifier:set(v339.yaw_modifier);
                    v340.yaw_offset:set(v339.yaw_offset);
                    v340.body_yaw_limit:set(v339.body_yaw_limit);
                    v340.body_yaw_options:set(v339.body_yaw_options);
                    v340.break_lc:set(v339.break_lc);
                    v340.defensive_snap:set(v339.defensive_snap);
                    v340.defensive_pitch_combo:set(v339.defensive_pitch_combo);
                    v340.defensive_pitch_custom:set(v339.defensive_pitch_custom);
                    v340.defensive_pitch_1:set(v339.defensive_pitch_1);
                    v340.defensive_pitch_2:set(v339.defensive_pitch_2);
                    v340.defensive_pitch_delay:set(v339.defensive_pitch_delay);
                    v340.defensive_group_yaw_combo:set(v339.defensive_group_yaw_combo);
                    v340.defensive_yaw_custom:set(v339.defensive_yaw_custom);
                    v340.defensive_yaw_1:set(v339.defensive_yaw_1);
                    v340.defensive_yaw_2:set(v339.defensive_yaw_2);
                    v340.defensive_yaw_3:set(v339.defensive_yaw_3);
                    v340.defensive_yaw_delay:set(v339.defensive_yaw_delay);
                    if v47[v338] then
                        v47[v338].snap_slider:set(v339.break_type);
                        v47[v338].choke_slider:set(v339.choke_value);
                    end;
                end;
            end;
            return;
        end;
    end;
end;
local function v345()
    -- upvalues: v47 (ref)
    for _, v343 in pairs(v47) do
        local v344 = v343.snap_slider:get();
        v343.choke_slider:visibility(v344 ~= 1);
    end;
end;
for _, v347 in pairs(v45) do
    if v347.snap_slider then
        v347.snap_slider:set_callback(v345);
    end;
end;
v345();
local v348 = db.config_systema14881337 or {};
v348.cfg_list = v348.cfg_list or {
    [1] = {
        [1] = "Default", 
        [2] = "eyJtaXNjIjp7ImRpc2FibGVyX3NoIjpbXSwiZXNwYW0iOnRydWUsImtpbGxfc2F5IjpmYWxzZSwibmFkZV9maXgiOnRydWUsInBpbmdfc3Bpa2UiOjAuMCwidGFnIjp0cnVlLCJ0ZWFtX2FpbWJvdCI6ZmFsc2V9LCJzdGF0ZXMiOlt7ImFsbG93X3N3aXRjaCI6ZmFsc2UsImJvZHlfeWF3X2xpbWl0Ijo2MC4wLCJib2R5X3lhd19vcHRpb25zIjpbIkppdHRlciJdLCJicmVha19sYyI6IkFsd2F5cyBPbiIsImJyZWFrX3R5cGUiOjEuMCwiY2hva2VfdmFsdWUiOjEuMCwiZGVmZW5zaXZlX2dyb3VwX3lhd19jb21ibyI6IlNtb290aCIsImRlZmVuc2l2ZV9waXRjaF8xIjotODkuMCwiZGVmZW5zaXZlX3BpdGNoXzIiOjg5LjAsImRlZmVuc2l2ZV9waXRjaF9jb21ibyI6IlN3YXkiLCJkZWZlbnNpdmVfcGl0Y2hfY3VzdG9tIjowLjAsImRlZmVuc2l2ZV9waXRjaF9kZWxheSI6MTAuMCwiZGVmZW5zaXZlX3NuYXAiOmZhbHNlLCJkZWZlbnNpdmVfeWF3XzEiOi05MC4wLCJkZWZlbnNpdmVfeWF3XzIiOjkwLjAsImRlZmVuc2l2ZV95YXdfMyI6MS4wLCJkZWZlbnNpdmVfeWF3X2N1c3RvbSI6MC4wLCJkZWZlbnNpdmVfeWF3X2RlbGF5IjoyLjAsImRlbGF5X3RpY2tzIjozLjAsInJhbmRvbWl6ZV95YXciOjAuMCwieWF3X2FkZCI6MC4wLCJ5YXdfYWRkX2dsIjowLjAsInlhd19jb21ibyI6IkRlbGF5ZWQiLCJ5YXdfbGVmdCI6LTM1LjAsInlhd19tb2RpZmllciI6IkRpc2FibGVkIiwieWF3X29mZnNldCI6MC4wLCJ5YXdfcmlnaHQiOjM2LjB9LHsiYWxsb3dfc3dpdGNoIjp0cnVlLCJib2R5X3lhd19saW1pdCI6NjAuMCwiYm9keV95YXdfb3B0aW9ucyI6WyJKaXR0ZXIiXSwiYnJlYWtfbGMiOiJPbiBQZWVrIiwiYnJlYWtfdHlwZSI6MS4wLCJjaG9rZV92YWx1ZSI6MS4wLCJkZWZlbnNpdmVfZ3JvdXBfeWF3X2NvbWJvIjoiQ3VzdG9tIiwiZGVmZW5zaXZlX3BpdGNoXzEiOi0xNS4wLCJkZWZlbnNpdmVfcGl0Y2hfMiI6MTUuMCwiZGVmZW5zaXZlX3BpdGNoX2NvbWJvIjoiU3dheSIsImRlZmVuc2l2ZV9waXRjaF9jdXN0b20iOjAuMCwiZGVmZW5zaXZlX3BpdGNoX2RlbGF5Ijo3LjAsImRlZmVuc2l2ZV9zbmFwIjp0cnVlLCJkZWZlbnNpdmVfeWF3XzEiOi05MS4wLCJkZWZlbnNpdmVfeWF3XzIiOjg2LjAsImRlZmVuc2l2ZV95YXdfMyI6MS4wLCJkZWZlbnNpdmVfeWF3X2N1c3RvbSI6LTE4MC4wLCJkZWZlbnNpdmVfeWF3X2RlbGF5IjoxLjAsImRlbGF5X3RpY2tzIjo0LjAsInJhbmRvbWl6ZV95YXciOjUuMCwieWF3X2FkZCI6MC4wLCJ5YXdfYWRkX2dsIjowLjAsInlhd19jb21ibyI6IkRlbGF5ZWQiLCJ5YXdfbGVmdCI6LTM1LjAsInlhd19tb2RpZmllciI6IkRpc2FibGVkIiwieWF3X29mZnNldCI6MC4wLCJ5YXdfcmlnaHQiOjM2LjB9LHsiYWxsb3dfc3dpdGNoIjp0cnVlLCJib2R5X3lhd19saW1pdCI6NjAuMCwiYm9keV95YXdfb3B0aW9ucyI6WyJKaXR0ZXIiXSwiYnJlYWtfbGMiOiJPbiBQZWVrIiwiYnJlYWtfdHlwZSI6MS4wLCJjaG9rZV92YWx1ZSI6MS4wLCJkZWZlbnNpdmVfZ3JvdXBfeWF3X2NvbWJvIjoiQ3VzdG9tIiwiZGVmZW5zaXZlX3BpdGNoXzEiOi0xNS4wLCJkZWZlbnNpdmVfcGl0Y2hfMiI6MTUuMCwiZGVmZW5zaXZlX3BpdGNoX2NvbWJvIjoiU3dheSIsImRlZmVuc2l2ZV9waXRjaF9jdXN0b20iOjAuMCwiZGVmZW5zaXZlX3BpdGNoX2RlbGF5Ijo3LjAsImRlZmVuc2l2ZV9zbmFwIjp0cnVlLCJkZWZlbnNpdmVfeWF3XzEiOjAuMCwiZGVmZW5zaXZlX3lhd18yIjowLjAsImRlZmVuc2l2ZV95YXdfMyI6MS4wLCJkZWZlbnNpdmVfeWF3X2N1c3RvbSI6LTE4MC4wLCJkZWZlbnNpdmVfeWF3X2RlbGF5IjoxLjAsImRlbGF5X3RpY2tzIjo0LjAsInJhbmRvbWl6ZV95YXciOjUuMCwieWF3X2FkZCI6MC4wLCJ5YXdfYWRkX2dsIjowLjAsInlhd19jb21ibyI6IkRlbGF5ZWQiLCJ5YXdfbGVmdCI6LTMzLjAsInlhd19tb2RpZmllciI6IlJhbmRvbSIsInlhd19vZmZzZXQiOjIuMCwieWF3X3JpZ2h0IjozMi4wfSx7ImFsbG93X3N3aXRjaCI6ZmFsc2UsImJvZHlfeWF3X2xpbWl0IjowLjAsImJvZHlfeWF3X29wdGlvbnMiOltdLCJicmVha19sYyI6Ik9uIFBlZWsiLCJicmVha190eXBlIjoxLjAsImNob2tlX3ZhbHVlIjoxLjAsImRlZmVuc2l2ZV9ncm91cF95YXdfY29tYm8iOiJDdXN0b20iLCJkZWZlbnNpdmVfcGl0Y2hfMSI6MC4wLCJkZWZlbnNpdmVfcGl0Y2hfMiI6MC4wLCJkZWZlbnNpdmVfcGl0Y2hfY29tYm8iOiJDdXN0b20iLCJkZWZlbnNpdmVfcGl0Y2hfY3VzdG9tIjowLjAsImRlZmVuc2l2ZV9waXRjaF9kZWxheSI6MS4wLCJkZWZlbnNpdmVfc25hcCI6ZmFsc2UsImRlZmVuc2l2ZV95YXdfMSI6MC4wLCJkZWZlbnNpdmVfeWF3XzIiOjAuMCwiZGVmZW5zaXZlX3lhd18zIjoxLjAsImRlZmVuc2l2ZV95YXdfY3VzdG9tIjowLjAsImRlZmVuc2l2ZV95YXdfZGVsYXkiOjEuMCwiZGVsYXlfdGlja3MiOjEuMCwicmFuZG9taXplX3lhdyI6MC4wLCJ5YXdfYWRkIjowLjAsInlhd19hZGRfZ2wiOjAuMCwieWF3X2NvbWJvIjoiMTgwIiwieWF3X2xlZnQiOjAuMCwieWF3X21vZGlmaWVyIjoiRGlzYWJsZWQiLCJ5YXdfb2Zmc2V0IjowLjAsInlhd19yaWdodCI6MC4wfSx7ImFsbG93X3N3aXRjaCI6dHJ1ZSwiYm9keV95YXdfbGltaXQiOjYwLjAsImJvZHlfeWF3X29wdGlvbnMiOlsiSml0dGVyIl0sImJyZWFrX2xjIjoiQWx3YXlzIE9uIiwiYnJlYWtfdHlwZSI6MS4wLCJjaG9rZV92YWx1ZSI6MTUuMCwiZGVmZW5zaXZlX2dyb3VwX3lhd19jb21ibyI6IlNtb290aCIsImRlZmVuc2l2ZV9waXRjaF8xIjotODkuMCwiZGVmZW5zaXZlX3BpdGNoXzIiOi01My4wLCJkZWZlbnNpdmVfcGl0Y2hfY29tYm8iOiJDdXN0b20iLCJkZWZlbnNpdmVfcGl0Y2hfY3VzdG9tIjo4OS4wLCJkZWZlbnNpdmVfcGl0Y2hfZGVsYXkiOjcuMCwiZGVmZW5zaXZlX3NuYXAiOnRydWUsImRlZmVuc2l2ZV95YXdfMSI6LTE4MC4wLCJkZWZlbnNpdmVfeWF3XzIiOi03Ni4wLCJkZWZlbnNpdmVfeWF3XzMiOjUzLjAsImRlZmVuc2l2ZV95YXdfY3VzdG9tIjowLjAsImRlZmVuc2l2ZV95YXdfZGVsYXkiOjEuMCwiZGVsYXlfdGlja3MiOjIuMCwicmFuZG9taXplX3lhdyI6MC4wLCJ5YXdfYWRkIjowLjAsInlhd19hZGRfZ2wiOjAuMCwieWF3X2NvbWJvIjoiRGVsYXllZCIsInlhd19sZWZ0IjotMzQuMCwieWF3X21vZGlmaWVyIjoiU3BpbiIsInlhd19vZmZzZXQiOjMuMCwieWF3X3JpZ2h0IjozMS4wfSx7ImFsbG93X3N3aXRjaCI6dHJ1ZSwiYm9keV95YXdfbGltaXQiOjYwLjAsImJvZHlfeWF3X29wdGlvbnMiOlsiSml0dGVyIl0sImJyZWFrX2xjIjoiQWx3YXlzIE9uIiwiYnJlYWtfdHlwZSI6MS4wLCJjaG9rZV92YWx1ZSI6MTUuMCwiZGVmZW5zaXZlX2dyb3VwX3lhd19jb21ibyI6IlNtb290aCIsImRlZmVuc2l2ZV9waXRjaF8xIjotODkuMCwiZGVmZW5zaXZlX3BpdGNoXzIiOi01My4wLCJkZWZlbnNpdmVfcGl0Y2hfY29tYm8iOiJDdXN0b20iLCJkZWZlbnNpdmVfcGl0Y2hfY3VzdG9tIjo4OS4wLCJkZWZlbnNpdmVfcGl0Y2hfZGVsYXkiOjcuMCwiZGVmZW5zaXZlX3NuYXAiOnRydWUsImRlZmVuc2l2ZV95YXdfMSI6LTE4MC4wLCJkZWZlbnNpdmVfeWF3XzIiOi03Ni4wLCJkZWZlbnNpdmVfeWF3XzMiOjUzLjAsImRlZmVuc2l2ZV95YXdfY3VzdG9tIjowLjAsImRlZmVuc2l2ZV95YXdfZGVsYXkiOjEuMCwiZGVsYXlfdGlja3MiOjIuMCwicmFuZG9taXplX3lhdyI6MC4wLCJ5YXdfYWRkIjowLjAsInlhd19hZGRfZ2wiOjAuMCwieWF3X2NvbWJvIjoiRGVsYXllZCIsInlhd19sZWZ0IjotMzQuMCwieWF3X21vZGlmaWVyIjoiU3BpbiIsInlhd19vZmZzZXQiOjMuMCwieWF3X3JpZ2h0IjozMS4wfSx7ImFsbG93X3N3aXRjaCI6dHJ1ZSwiYm9keV95YXdfbGltaXQiOjYwLjAsImJvZHlfeWF3X29wdGlvbnMiOlsiSml0dGVyIl0sImJyZWFrX2xjIjoiQWx3YXlzIE9uIiwiYnJlYWtfdHlwZSI6MS4wLCJjaG9rZV92YWx1ZSI6MTUuMCwiZGVmZW5zaXZlX2dyb3VwX3lhd19jb21ibyI6IlNwaW4iLCJkZWZlbnNpdmVfcGl0Y2hfMSI6LTg5LjAsImRlZmVuc2l2ZV9waXRjaF8yIjotNTMuMCwiZGVmZW5zaXZlX3BpdGNoX2NvbWJvIjoiQ3VzdG9tIiwiZGVmZW5zaXZlX3BpdGNoX2N1c3RvbSI6ODkuMCwiZGVmZW5zaXZlX3BpdGNoX2RlbGF5Ijo3LjAsImRlZmVuc2l2ZV9zbmFwIjp0cnVlLCJkZWZlbnNpdmVfeWF3XzEiOi0xODAuMCwiZGVmZW5zaXZlX3lhd18yIjoxODAuMCwiZGVmZW5zaXZlX3lhd18zIjo1My4wLCJkZWZlbnNpdmVfeWF3X2N1c3RvbSI6MC4wLCJkZWZlbnNpdmVfeWF3X2RlbGF5IjoxLjAsImRlbGF5X3RpY2tzIjoyLjAsInJhbmRvbWl6ZV95YXciOjAuMCwieWF3X2FkZCI6MC4wLCJ5YXdfYWRkX2dsIjowLjAsInlhd19jb21ibyI6IkRlbGF5ZWQiLCJ5YXdfbGVmdCI6LTM0LjAsInlhd19tb2RpZmllciI6IlNwaW4iLCJ5YXdfb2Zmc2V0IjozLjAsInlhd19yaWdodCI6MzEuMH0seyJhbGxvd19zd2l0Y2giOnRydWUsImJvZHlfeWF3X2xpbWl0Ijo2MC4wLCJib2R5X3lhd19vcHRpb25zIjpbIkppdHRlciJdLCJicmVha19sYyI6IkFsd2F5cyBPbiIsImJyZWFrX3R5cGUiOjEuMCwiY2hva2VfdmFsdWUiOjE1LjAsImRlZmVuc2l2ZV9ncm91cF95YXdfY29tYm8iOiJTcGluIiwiZGVmZW5zaXZlX3BpdGNoXzEiOi04OS4wLCJkZWZlbnNpdmVfcGl0Y2hfMiI6LTUzLjAsImRlZmVuc2l2ZV9waXRjaF9jb21ibyI6IkN1c3RvbSIsImRlZmVuc2l2ZV9waXRjaF9jdXN0b20iOjg5LjAsImRlZmVuc2l2ZV9waXRjaF9kZWxheSI6Ny4wLCJkZWZlbnNpdmVfc25hcCI6dHJ1ZSwiZGVmZW5zaXZlX3lhd18xIjotMTgwLjAsImRlZmVuc2l2ZV95YXdfMiI6MTgwLjAsImRlZmVuc2l2ZV95YXdfMyI6NTMuMCwiZGVmZW5zaXZlX3lhd19jdXN0b20iOjAuMCwiZGVmZW5zaXZlX3lhd19kZWxheSI6MS4wLCJkZWxheV90aWNrcyI6Mi4wLCJyYW5kb21pemVfeWF3IjowLjAsInlhd19hZGQiOjAuMCwieWF3X2FkZF9nbCI6MC4wLCJ5YXdfY29tYm8iOiJEZWxheWVkIiwieWF3X2xlZnQiOi0zNC4wLCJ5YXdfbW9kaWZpZXIiOiJTcGluIiwieWF3X29mZnNldCI6My4wLCJ5YXdfcmlnaHQiOjMxLjB9LHsiYWxsb3dfc3dpdGNoIjpmYWxzZSwiYm9keV95YXdfbGltaXQiOjYwLjAsImJvZHlfeWF3X29wdGlvbnMiOlsiSml0dGVyIl0sImJyZWFrX2xjIjoiT24gUGVlayIsImJyZWFrX3R5cGUiOjEuMCwiY2hva2VfdmFsdWUiOjEuMCwiZGVmZW5zaXZlX2dyb3VwX3lhd19jb21ibyI6IkN1c3RvbSIsImRlZmVuc2l2ZV9waXRjaF8xIjowLjAsImRlZmVuc2l2ZV9waXRjaF8yIjowLjAsImRlZmVuc2l2ZV9waXRjaF9jb21ibyI6IkN1c3RvbSIsImRlZmVuc2l2ZV9waXRjaF9jdXN0b20iOi04OS4wLCJkZWZlbnNpdmVfcGl0Y2hfZGVsYXkiOjEuMCwiZGVmZW5zaXZlX3NuYXAiOnRydWUsImRlZmVuc2l2ZV95YXdfMSI6MC4wLCJkZWZlbnNpdmVfeWF3XzIiOjAuMCwiZGVmZW5zaXZlX3lhd18zIjoxLjAsImRlZmVuc2l2ZV95YXdfY3VzdG9tIjoxODAuMCwiZGVmZW5zaXZlX3lhd19kZWxheSI6MS4wLCJkZWxheV90aWNrcyI6MS4wLCJyYW5kb21pemVfeWF3IjowLjAsInlhd19hZGQiOjAuMCwieWF3X2FkZF9nbCI6MC4wLCJ5YXdfY29tYm8iOiIxODAiLCJ5YXdfbGVmdCI6MC4wLCJ5YXdfbW9kaWZpZXIiOiJEaXNhYmxlZCIsInlhd19vZmZzZXQiOjAuMCwieWF3X3JpZ2h0IjowLjB9XSwidHdlYWtzIjp7ImFpcmxhZyI6ZmFsc2UsImJhY2tzdGFiIjp0cnVlLCJicmVha190eXBlX2V4cCI6IjEiLCJlZGdlX3lhd19zdyI6ZmFsc2UsImV4cF90eXBlIjoiQ2hpbWVyYSIsImZhc3RfbGFkZGVyIjp0cnVlLCJmbGlja19leHAiOmZhbHNlLCJmcmVlc3RhbmQiOmZhbHNlLCJtYW51YWxfeWF3IjoiT2ZmIiwicGVla19vcHBvc2l0ZSI6dHJ1ZSwic2FmZWhlYWQiOlsiS25pZmUiXSwic3RhdGljX2ZzIjp0cnVlfSwidmlzdWFscyI6eyJhZGRvbnMiOlsiTW92ZSBMZWFuIl0sImFpcl9icmVhayI6MS4wLCJhc3BlY3RfcmF0aW8iOjU5LjAsImJsdXJfc3ciOmZhbHNlLCJjbHIiOm51bGwsImNyb3NzaGl0bWFya2VyIjp0cnVlLCJjdXN0b21fc2NvcGUiOnRydWUsImN1c3RvbV9zY29wZV9jb2xvciI6bnVsbCwiY3VzdG9tX3Njb3BlX2dhcCI6MTUuMCwiY3VzdG9tX3Njb3BlX3NpemUiOjMzLjAsImZvdiI6NjU3LjAsImxvZ3MiOnRydWUsInNrZWV0XzIiOnRydWUsInNwZWN0YXRvcnMiOnRydWUsInRfc3R5bGUiOnRydWUsInZlbG9jaXR5X3dhcm5pbmciOmZhbHNlLCJ2aWV3bW9kZWwiOnRydWUsIndhbGtfYnJlYWsiOjIuMCwid2F0ZXJtYXJrIjp0cnVlLCJ4X3ZpZXciOjIyLjAsInlfdmlldyI6LTMxLjAsInpfdmlldyI6LTI1LjB9fQ=="
    }
};
v348.menu_list = v348.menu_list or {
    [1] = "Default"
};
local function v351()
    -- upvalues: v348 (ref)
    v348.menu_list = {};
    for _, v350 in ipairs(v348.cfg_list) do
        table.insert(v348.menu_list, v350[1]);
    end;
end;
local function v352()
    -- upvalues: v348 (ref)
    db.config_systema14881337 = v348;
end;
local function v356(v353)
    -- upvalues: v348 (ref), v351 (ref), v352 (ref)
    if not v353 or v353 == "" then
        common.add_notify("Error", "Please provide a valid name for the config.");
        return;
    else
        for _, v355 in ipairs(v348.cfg_list) do
            if v355[1] == v353 then
                common.add_notify("Error", "A config with this name already exists.");
                return;
            end;
        end;
        table.insert(v348.cfg_list, {
            [1] = nil, 
            [2] = "", 
            [1] = v353
        });
        v351();
        v352();
        common.add_notify("Success", "Config created: " .. v353);
        return;
    end;
end;
local function v360(v357)
    -- upvalues: v348 (ref), v333 (ref), v352 (ref)
    if v357 <= 0 or #v348.cfg_list < v357 then
        common.add_notify("Error", "Invalid config selection.");
        return;
    else
        local l_status_1, l_result_1 = pcall(v333);
        if not l_status_1 or not l_result_1 or l_result_1 == "" then
            common.add_notify("Error", "Failed to save config: export returned no data.");
            return;
        else
            v348.cfg_list[v357][2] = l_result_1;
            v352();
            common.add_notify("Success", "Config saved: " .. v348.cfg_list[v357][1]);
            return;
        end;
    end;
end;
local function v365(v361)
    -- upvalues: v348 (ref), v341 (ref)
    if v361 <= 0 or #v348.cfg_list < v361 then
        common.add_notify("Error", "Invalid config selection.");
        return;
    else
        local v362 = v348.cfg_list[v361][2];
        if not v362 or v362 == "" then
            common.add_notify("Error", "This config has no saved data.");
            return;
        else
            local l_status_2, l_result_2 = pcall(function()
                -- upvalues: v341 (ref), v362 (ref)
                v341(v362);
            end);
            if l_status_2 then
                common.add_notify("Success", "Config loaded: " .. v348.cfg_list[v361][1]);
            else
                common.add_notify("Error", "Failed to load config: " .. tostring(l_result_2));
            end;
            return;
        end;
    end;
end;
local function v367(v366)
    -- upvalues: v348 (ref), v351 (ref), v352 (ref)
    if v366 <= 0 or #v348.cfg_list < v366 then
        common.add_notify("Error", "Invalid config selection.");
        return;
    elseif v348.cfg_list[v366][1] == "Default" then
        common.add_notify("Error", "Default config cannot be deleted.");
        return;
    else
        table.remove(v348.cfg_list, v366);
        v351();
        v352();
        common.add_notify("Success", "Config removed.");
        return;
    end;
end;
local function v370(v368)
    -- upvalues: v348 (ref), l_clipboard_0 (ref)
    if v368 <= 0 or #v348.cfg_list < v368 then
        common.add_notify("Error", "Invalid config selection.");
        return;
    else
        local v369 = v348.cfg_list[v368][2];
        if not v369 or v369 == "" then
            common.add_notify("Error", "This config has no saved data.");
            return;
        else
            l_clipboard_0.set(v369);
            common.add_notify("Success", "Config exported to clipboard.");
            return;
        end;
    end;
end;
local function v373(v371)
    -- upvalues: l_clipboard_0 (ref), v348 (ref), v351 (ref), v352 (ref)
    if not v371 or v371 == "" then
        common.add_notify("Error", "Please provide a valid name for the imported config.");
        return;
    else
        local v372 = l_clipboard_0.get();
        if not v372 or v372 == "" then
            common.add_notify("Error", "Clipboard is empty.");
            return;
        else
            table.insert(v348.cfg_list, {
                [1] = v371, 
                [2] = v372
            });
            v351();
            v352();
            common.add_notify("Success", "Config imported: " .. v371);
            return;
        end;
    end;
end;
local v374 = v11:list("", v348.menu_list);
local v375 = v11:input("Config Name", "");
v11:button(ui.get_icon("plus"), function()
    -- upvalues: v356 (ref), v375 (ref), v374 (ref), v348 (ref)
    v356(v375:get());
    v374:update(v348.menu_list);
end, true):tooltip("Create Config");
v11:button(ui.get_icon("floppy-disk"), function()
    -- upvalues: v360 (ref), v374 (ref)
    v360(v374:get());
end, true):tooltip("Save Config");
v11:button(ui.get_icon("loader"), function()
    -- upvalues: v365 (ref), v374 (ref)
    v365(v374:get());
end, true):tooltip("Load Config");
v11:button(ui.get_icon("trash"), function()
    -- upvalues: v367 (ref), v374 (ref), v348 (ref)
    v367(v374:get());
    v374:update(v348.menu_list);
end, true):tooltip("Delete Config");
v11:button(ui.get_icon("file-export"), function()
    -- upvalues: v370 (ref), v374 (ref)
    v370(v374:get());
end, true):tooltip("Export Config");
v11:button(ui.get_icon("file-import"), function()
    -- upvalues: v373 (ref), v375 (ref), v374 (ref), v348 (ref)
    v373(v375:get());
    v374:update(v348.menu_list);
end, true):tooltip("Import Config");
v351();
v352();
events.shutdown:set(v352);
local v376 = {
    [1] = "\202\141\208\184\225\180\132\225\180\132\208\189\209\131\225\180\167? \225\180\138\225\180\156s\225\180\155 \201\162\225\180\135\225\180\155 \225\180\141\225\180\135\225\180\143\225\180\161s\225\180\155\225\180\128\202\128\240\159\142\151", 
    [2] = "\209\129\208\176\209\129\208\181\209\136 \208\186\208\176\208\186 \208\186\208\190\209\130\208\181\208\186", 
    [3] = "ambani? Nah. MeowStar", 
    [4] = "1 >_< meowww", 
    [5] = "\209\129\208\188\208\181\209\136\208\189\209\139\208\181 \209\132\209\128\208\176\208\183\209\139 \209\129 \208\186\208\190\209\130\208\176\208\188\208\184.mp3.. \208\144 \208\191\208\190\208\186\209\131\208\191\208\176\208\185\209\130\208\181 MoewStar!", 
    [6] = "\208\146 \209\130\208\178\208\190\208\181\208\188 \209\129\209\131\209\137\208\181\209\129\209\130\208\178\208\190\208\178\208\176\208\189\208\184\208\184 \208\189\208\181\209\130\209\131 \209\129\208\188\209\139\209\129\208\187\208\176, \208\181\209\129\208\187\208\184 \209\130\209\139 \208\189\208\181 \208\188\209\143\209\131\208\186\208\176\208\187 \208\186\208\190\209\130\209\131 \208\178 \208\190\209\130\208\178\208\181\209\130//", 
    [7] = "\208\154\209\131\208\191\208\184\208\187 \208\188\209\143\209\131\209\129\209\130\208\176\209\128 \208\184\208\183 \208\183\208\176 \209\130\209\128\208\181\209\136\209\130\208\190\208\187\208\186\208\176", 
    [8] = "Meowstar, \209\130\209\139 \208\177\209\139\208\187 \208\188\209\143\209\131\208\186\208\176\209\142\209\137\208\181 \209\129\208\187\208\176\208\177 \209\129\208\181\208\179\208\190\208\180\208\189\209\143.", 
    [9] = "\208\157\208\176\208\180\208\181\209\142\209\129\209\140, \208\183\208\176\208\178\209\130\209\128\208\176 \209\130\208\181\208\177\208\181 \208\191\208\190\208\178\208\181\208\183\208\181\209\130 \208\177\208\190\208\187\209\140\209\136\208\181. \208\152\208\187\208\184 \208\189\208\181\209\130?", 
    [10] = "\208\180\225\180\128\208\182\225\180\135 \202\141\208\190\208\185 \225\180\139\208\190\225\180\155 \208\184\225\180\166\225\180\169\225\180\128\225\180\135\225\180\155 \225\180\167\209\131\209\135\201\175\225\180\135.", 
    [11] = "\209\130\208\186 \208\184\208\179\209\128\208\176\209\142 \209\129 Meowstar, \208\180\209\131\208\188\208\176\208\187 \209\130\208\181\208\177\208\181 \208\189\209\131\208\182\208\189\208\176 \208\177\209\131\208\180\208\181\209\130 \208\191\208\190\208\188\208\190\209\137\209\140. \208\175 \208\180\208\176\208\182\208\181 \208\191\209\128\208\184\208\179\208\190\209\130\208\190\208\178\208\184\208\187 \209\130\208\181\208\177\208\181 \208\188\208\190\208\187\208\190\208\186\208\190..", 
    [12] = "Meowwwwstar>.< \209\130\209\139 \209\129\208\181\208\179\208\190\208\180\208\189\209\143 \208\180\208\178\208\184\208\179\208\176\208\187\209\129\209\143 \208\186\208\176\208\186 \208\177\208\190\208\187\209\140\208\189\208\190\208\185 \209\133\208\190\208\188\209\143\208\186", 
    [13] = "\208\188\208\190\208\181 \208\187\208\184\209\134\208\190 \208\186\208\190\208\179\208\180\208\176 \208\190\208\177\208\190\209\129\209\129\208\176\208\187 \209\130\208\181\208\177\209\143 (\239\188\158\227\128\130\226\152\134)", 
    [14] = "(\226\148\128\226\128\191\226\128\191\226\148\128) \208\186\208\190\208\179\208\180\208\176 meow say meow \208\176 \209\130\209\139 \209\130\208\176\208\186\208\190\208\185 meow", 
    [15] = "Kaomoji (\224\183\134\203\153\225\181\149\203\153\224\183\134): 5000+ Kaomojis Copy And Paste \240\159\145\140", 
    [16] = "1 >//", 
    [17] = "\203\154 \224\188\152\226\153\161 \226\139\134\239\189\161\203\154\208\177\208\181\208\183 \208\188\209\143\209\131\209\129\209\130\208\176\209\128\208\176 \209\129\208\176\209\129\208\181\209\136\203\154 \224\188\152\226\153\161 \226\139\134\239\189\161\203\154", 
    [18] = "\209\133\208\190\209\135\208\181\209\136\209\140 \209\131\208\177\208\184\208\178\208\176\209\130\209\140? \208\148\208\181\209\128\208\182\208\184: https://ru.neverlose.cc/market/item?id=KFlOw5 (\226\128\162\226\169\138\226\128\162)", 
    [19] = "meow! >.< \208\159\208\190\209\133\208\190\208\182\208\181, \209\131 \209\130\208\181\208\177\209\143 \209\129\208\181\208\179\208\190\208\180\208\189\209\143 \208\189\208\181 \208\183\208\176\208\180\208\176\208\187\208\190\209\129\209\140.", 
    [20] = "\208\158\208\185, \209\130\208\181\208\177\208\181 \208\189\208\181 \208\191\208\190\208\178\208\181\208\183\208\187\208\190. \208\159\208\190\209\133\208\190\208\182\208\181, \209\130\208\178\208\190\208\185 \209\129\208\186\208\184\208\187\208\187 \209\129\208\181\208\179\208\190\208\180\208\189\209\143 \208\189\208\176 \209\131\209\128\208\190\208\178\208\189\208\181 \208\186\208\190\209\130\208\176, \208\186\208\190\209\130\208\190\209\128\209\139\208\185 \208\191\209\139\209\130\208\176\208\181\209\130\209\129\209\143 \208\191\208\190\208\185\208\188\208\176\209\130\209\140 \208\187\208\176\208\183\208\181\209\128\208\189\209\131\209\142 \209\131\208\186\208\176\208\183\208\186\209\131.(\225\151\146\226\169\138\225\151\149)", 
    [21] = "\208\155\208\190\208\178\208\184\209\130\209\140 \208\188\209\139\209\136\208\181\208\185 \209\130\209\139, \208\186\208\190\208\189\208\181\209\135\208\189\208\190, \209\131\208\188\208\181\208\181\209\136\209\140, \208\189\208\190 \208\178\208\190\209\130 \208\178 \209\141\209\130\208\190\208\185 \208\184\208\179\209\128\208\181... \208\156\209\143\209\131! \208\161\208\187\208\184\209\136\208\186\208\190\208\188 \208\191\209\128\208\190\209\129\209\130\208\190 \208\177\209\139\208\187\208\190.(^\228\186\186^)", 
    [22] = "\208\190\225\180\166\208\190 \225\180\141\225\180\135\225\180\143\225\180\161-\201\162\201\170\225\180\132 \234\156\176\225\180\128\201\170\202\159!", 
    [23] = "meow! \208\159\208\190\209\128\208\176 \208\189\208\176 \208\186\208\190\209\136\208\176\209\135\209\140\209\142 \208\180\208\184\208\181\209\130\209\131. \208\162\209\139 \209\129\208\187\208\184\209\136\208\186\208\190\208\188 \240\157\144\172\240\157\144\165\240\157\144\168\240\157\144\176 ( \227\128\131\226\150\189\227\128\131)"
};
events.player_death:set(function(v377)
    -- upvalues: v116 (ref), v376 (ref)
    if not v116:get() then
        return;
    else
        local v378 = entity.get_local_player();
        if v378 == nil then
            return;
        else
            if entity.get(v377.attacker, true) == v378 then
                local v379 = v376[math.random(#v376)];
                utils.console_exec("say " .. v379);
            end;
            return;
        end;
    end;
end);
local function v384()
    -- upvalues: v34 (ref), v45 (ref), v47 (ref), l_base64_0 (ref), l_clipboard_0 (ref)
    local v380 = v34:get();
    if not v45[v380] then
        common.add_notify("Config", "Error: SFxs87, report in ticket!");
        return;
    else
        local v381 = {
            allow_switch = v380 == 1 or v45[v380].allow_switch and v45[v380].allow_switch:get() or false, 
            yaw_combo = v45[v380].yaw_combo:get(), 
            yaw_add = v45[v380].yaw_add:get(), 
            yaw_add_gl = v45[v380].yaw_add_gl:get(), 
            yaw_left = v45[v380].yaw_left:get(), 
            yaw_right = v45[v380].yaw_right:get(), 
            delay_ticks = v45[v380].delay_ticks:get(), 
            randomize_yaw = v45[v380].randomize_yaw:get(), 
            yaw_modifier = v45[v380].yaw_modifier:get(), 
            yaw_offset = v45[v380].yaw_offset:get(), 
            body_yaw_limit = v45[v380].body_yaw_limit:get(), 
            body_yaw_options = v45[v380].body_yaw_options and v45[v380].body_yaw_options:get() or {}, 
            break_lc = v45[v380].break_lc:get(), 
            defensive_snap = v45[v380].defensive_snap:get(), 
            defensive_pitch_combo = v45[v380].defensive_pitch_combo:get(), 
            defensive_pitch_custom = v45[v380].defensive_pitch_custom:get(), 
            defensive_pitch_1 = v45[v380].defensive_pitch_1:get(), 
            defensive_pitch_2 = v45[v380].defensive_pitch_2:get(), 
            defensive_pitch_delay = v45[v380].defensive_pitch_delay:get(), 
            defensive_group_yaw_combo = v45[v380].defensive_group_yaw_combo:get(), 
            defensive_yaw_custom = v45[v380].defensive_yaw_custom:get(), 
            defensive_yaw_1 = v45[v380].defensive_yaw_1:get(), 
            defensive_yaw_2 = v45[v380].defensive_yaw_2:get(), 
            defensive_yaw_3 = v45[v380].defensive_yaw_3:get(), 
            defensive_yaw_delay = v45[v380].defensive_yaw_delay:get(), 
            break_type = v47[v380] and v47[v380].snap_slider:get() or nil, 
            choke_value = v47[v380] and v47[v380].choke_slider:get() or nil
        };
        local v382 = json.stringify(v381);
        local v383 = l_base64_0.encode(v382);
        l_clipboard_0.set(v383);
        common.add_notify("Config", "State configuration exported");
        return;
    end;
end;
local function v390()
    -- upvalues: v34 (ref), v45 (ref), l_base64_0 (ref), l_clipboard_0 (ref), v47 (ref)
    local v385 = v34:get();
    if not v45[v385] then
        common.add_notify("Config", "Selected state does not exist.");
        return;
    else
        local v386 = l_base64_0.decode(l_clipboard_0.get());
        if not v386 or v386 == "" then
            common.add_notify("Config", "No data in clipboard! Check your configuration.");
            return;
        else
            local l_status_3, l_result_3 = pcall(json.parse, v386);
            if not l_status_3 then
                common.add_notify("Config", "Invalid JSON data in clipboard.");
                return;
            else
                local v389 = v45[v385];
                if v389 then
                    if l_result_3.allow_switch ~= nil and v389.allow_switch then
                        v389.allow_switch:set(l_result_3.allow_switch);
                    end;
                    v389.yaw_combo:set(l_result_3.yaw_combo);
                    v389.yaw_add:set(l_result_3.yaw_add);
                    v389.yaw_add_gl:set(l_result_3.yaw_add);
                    v389.yaw_left:set(l_result_3.yaw_left);
                    v389.yaw_right:set(l_result_3.yaw_right);
                    v389.delay_ticks:set(l_result_3.delay_ticks);
                    v389.randomize_yaw:set(l_result_3.randomize_yaw);
                    v389.yaw_modifier:set(l_result_3.yaw_modifier);
                    v389.yaw_offset:set(l_result_3.yaw_offset);
                    v389.body_yaw_limit:set(l_result_3.body_yaw_limit);
                    v389.body_yaw_options:set(l_result_3.body_yaw_options);
                    v389.break_lc:set(l_result_3.break_lc);
                    v389.defensive_snap:set(l_result_3.defensive_snap);
                    v389.defensive_pitch_combo:set(l_result_3.defensive_pitch_combo);
                    v389.defensive_pitch_custom:set(l_result_3.defensive_pitch_custom);
                    v389.defensive_pitch_1:set(l_result_3.defensive_pitch_1);
                    v389.defensive_pitch_2:set(l_result_3.defensive_pitch_2);
                    v389.defensive_pitch_delay:set(l_result_3.defensive_pitch_delay);
                    v389.defensive_group_yaw_combo:set(l_result_3.defensive_group_yaw_combo);
                    v389.defensive_yaw_custom:set(l_result_3.defensive_yaw_custom);
                    v389.defensive_yaw_1:set(l_result_3.defensive_yaw_1);
                    v389.defensive_yaw_2:set(l_result_3.defensive_yaw_2);
                    v389.defensive_yaw_3:set(l_result_3.defensive_yaw_3);
                    v389.defensive_yaw_delay:set(l_result_3.defensive_yaw_delay);
                    if v47[v385] then
                        v47[v385].snap_slider:set(l_result_3.break_type);
                        v47[v385].choke_slider:set(l_result_3.choke_value);
                    end;
                end;
                common.add_notify("Config", "State configuration imported");
                return;
            end;
        end;
    end;
end;
local _ = v13:button(ui.get_icon("file-import") .. "        Import current state settings              ", function()
    -- upvalues: v390 (ref)
    v390();
end);
local _ = v13:button(ui.get_icon("file-export") .. "        Export current state settings              ", function()
    -- upvalues: v384 (ref)
    v384();
end);
local v393 = render.load_font("Tahoma", 12, "a");
local l_x_1 = render.screen_size().x;
local l_y_1 = render.screen_size().y;
local v421 = (function()
    -- upvalues: v393 (ref), l_x_1 (ref), l_y_1 (ref)
    local v396 = {};
    v396.fatality_spect = {
        rec = function(v397, v398, v399, v400, v401)
            local v402 = vector(v397, v398);
            local v403 = vector(v397 + v399, v398 + v400);
            render.rect(v402, v403, color(v401[1], v401[2], v401[3], v401[4]));
        end, 
        get_spects = function()
            local v404 = {};
            local v405 = entity.get_local_player();
            local l_v405_0 = v405;
            if v405 ~= nil then
                local l_m_iObserverMode_0 = v405.m_iObserverMode;
                local l_m_hObserverTarget_0 = v405.m_hObserverTarget;
                if l_m_hObserverTarget_0 and (l_m_iObserverMode_0 == 4 or l_m_iObserverMode_0 == 5) then
                    l_v405_0 = l_m_hObserverTarget_0;
                end;
            end;
            for v409 = 1, globals.max_players do
                local v410 = entity.get(v409);
                if v410 and v410:is_player() and not v410:is_alive() then
                    local l_m_hObserverTarget_1 = v410.m_hObserverTarget;
                    local l_m_iObserverMode_1 = v410.m_iObserverMode;
                    if l_m_hObserverTarget_1 and l_m_hObserverTarget_1 == l_v405_0 and v409 ~= v405:get_index() and (l_m_iObserverMode_1 == 4 or l_m_iObserverMode_1 == 5) then
                        v404[#v404 + 1] = v409;
                    end;
                end;
            end;
            return v404;
        end, 
        render = function()
            -- upvalues: v396 (ref), v393 (ref), l_x_1 (ref), l_y_1 (ref)
            local v413 = v396.fatality_spect:get_spects();
            for v414 = 1, #v413 do
                if v414 > 10 then
                    return;
                else
                    local v415 = entity.get(v413[v414]):get_name();
                    local v416 = render.measure_text(v393, "A", v415);
                    local v417 = 5;
                    local v418 = 8;
                    local v419 = 6;
                    v396.fatality_spect.rec(l_x_1 - v416.x - v417 - v418 - 40 - v419, l_y_1 / 2 - 15 + (v414 - 1) * 37, v416.x + v417 + v418, 30, {
                        [1] = 0, 
                        [2] = 0, 
                        [3] = 0, 
                        [4] = 70
                    });
                    render.text(v393, vector(l_x_1 - v416.x - v418 - 38 - v419, l_y_1 / 2 - 8 + (v414 - 1) * 37), color(255, 255, 255, 255), nil, v415);
                    local v420 = entity.get(v413[v414]):get_steam_avatar();
                    if v420 then
                        render.texture(v420, vector(l_x_1 - 35, l_y_1 / 2 - 15 + (v414 - 1) * 37), vector(29, 29), nil, nil, 4);
                    end;
                end;
            end;
        end
    };
    return v396;
end)();
events.render:set(function()
    -- upvalues: v105 (ref), v421 (ref)
    if v105:get() and globals.is_connected then
        v421.fatality_spect:render();
    end;
end);
local v422 = render.load_font("Tahoma", 21, "a");
local v423 = render.load_font("Calibri", 24, "bad");
local function v426(v424, v425)
    return math.sqrt((v424.x - v425.x) ^ 2 + (v424.y - v425.y) ^ 2 + (v424.z - v425.z) ^ 2);
end;
local v427 = {
    [1] = {
        active = false, 
        text = "HC", 
        position_offset = 0, 
        bind_name = "Hit Chance", 
        height = 0, 
        icon = ui.get_icon("crosshairs"), 
        color = color(255, 255, 255)
    }, 
    [2] = {
        active = false, 
        text = "OSAA", 
        position_offset = 0, 
        text_offset = 14, 
        bind_name = "OSAA", 
        height = 0, 
        icon = ui.get_icon("user-helmet-safety"), 
        color = color(255, 255, 255)
    }, 
    [3] = {
        active = false, 
        text = "DT", 
        position_offset = 0, 
        bind_name = "Double Tap", 
        height = 0, 
        icon = ui.get_icon("arrow-down-left-and-arrow-up-right-to-center"), 
        color = color(255, 255, 255)
    }, 
    [4] = {
        active = false, 
        text = "MD", 
        position_offset = 0, 
        bind_name = "Min. Damage", 
        height = 0, 
        icon = ui.get_icon("slider"), 
        color = color(255, 255, 255)
    }, 
    [5] = {
        active = false, 
        text = "BODY", 
        position_offset = 0, 
        text_offset = 11, 
        bind_name = "Body Aim", 
        height = 0, 
        icon = ui.get_icon("user-shield"), 
        color = color(255, 255, 255)
    }, 
    [6] = {
        text = "", 
        text_offset = 73, 
        height = 0, 
        active = false, 
        position_offset = 0, 
        tick_timer = 0, 
        bind_name = "Bomb", 
        icon = ui.get_icon("bomb"), 
        color = color(255, 255, 255)
    }
};
local function v431(v428, v429, v430)
    return color(math.floor(v428.r + (v429.r - v428.r) * v430), math.floor(v428.g + (v429.g - v428.g) * v430), math.floor(v428.b + (v429.b - v428.b) * v430), math.floor(v428.a + (v429.a - v428.a) * v430));
end;
local function v435(v432)
    local v433 = 450.7;
    local v434 = (v432 - 75.68) / 789.2;
    return v433 * math.exp(-v434 * v434);
end;
local function v455(v436, v437, v438, v439, v440, v441, v442, v443)
    -- upvalues: v422 (ref), v423 (ref)
    local v444 = v436 and render.measure_text(v422, nil, v436) or vector(0, 0);
    local v445 = render.measure_text(v423, nil, v437);
    local v446 = 8;
    local v447 = v444.x + v445.x + v446 * 4;
    local v448 = math.max(v444.y, v445.y) + v446 * 2;
    local v449 = vector(v440, v441);
    local v450 = vector(v440 + v447, v441 + v448);
    render.push_clip_rect(v449, vector(v450.x, v449.y + v442));
    render.gradient(vector(v449.x, v449.y), vector(v449.x + (v450.x - v449.x) / 2, v450.y), color(0, 0, 0, 0), color(0, 0, 0, 90), color(0, 0, 0, 0), color(0, 0, 0, 90));
    render.gradient(vector(v449.x + (v450.x - v449.x) / 2, v449.y), vector(v450.x, v450.y), color(0, 0, 0, 90), color(0, 0, 0, 0), color(0, 0, 0, 90), color(0, 0, 0, 0));
    local v451 = v449.x + v446 + 13;
    local v452 = v449.y + (v448 - v444.y) / 2 + 8.78;
    local v453 = v451 + v444.x + v446 + 3 + (v443 or 0);
    local v454 = v449.y + (v448 - v445.y) / 2 + 12.3;
    if v436 then
        render.text(v422, vector(v451, v452), v439 and v438 or color(255, 255, 255), "c", v436);
    end;
    render.text(v423, vector(v453, v454), v438, "c", v437);
    render.pop_clip_rect();
end;
local function v482()
    -- upvalues: v111 (ref), v427 (ref), v431 (ref), v426 (ref), v435 (ref), v30 (ref), v455 (ref)
    if not globals.is_connected or not entity.get_local_player() or not entity.get_local_player():is_alive() or not v111:get() then
        return;
    else
        local v456 = ui.get_binds();
        local v457 = render.screen_size();
        local v458 = 10;
        local v459 = v457.y - 350;
        local v460 = 1;
        local v461 = {};
        local v462 = 0;
        local v463 = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"):get();
        local v464 = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"):get();
        local v465 = rage.exploit:get();
        for _, v467 in ipairs(v427) do
            local v468 = false;
            if v467.bind_name == "OSAA" then
                v468 = v463 and not v464;
            elseif v467.bind_name == "Double Tap" then
                v468 = v464;
                v467.color = v431(color(255, 0, 0), color(255, 255, 255), v465);
            elseif v467.bind_name == "Bomb" then
                local v469 = entity.get_entities("CPlantedC4")[1];
                if v469 then
                    local v470 = math.max(v469.m_flC4Blow - globals.curtime, 0);
                    if v470 <= 0 then
                        v468 = false;
                    else
                        local v471 = v469.m_nBombSite == 0 and "A" or "B";
                        local v472 = entity.get_local_player();
                        local l_m_vecOrigin_0 = v469.m_vecOrigin;
                        local l_m_vecOrigin_1 = v472.m_vecOrigin;
                        local v475 = v426(l_m_vecOrigin_0, l_m_vecOrigin_1);
                        local v476 = v435(v475);
                        if v472.m_ArmorValue > 0 then
                            local v477 = v476 * 0.5;
                            if (v476 - v477) * 0.5 > v472.m_ArmorValue then
                                v477 = v476 - v472.m_ArmorValue * 2;
                            end;
                            v476 = v477;
                        end;
                        v476 = math.floor(v476);
                        if v472.m_iHealth < v476 then
                            damageo = "FATAL";
                        else
                            damageo = tostring(v476) .. " HP";
                        end;
                        if v476 and damageo and v471 and l_m_vecOrigin_0 then
                            v467.text = v471 .. " - " .. string.format("%.1f", v470) .. "s (" .. damageo .. ")";
                            v467.tick_timer = (v467.tick_timer + globals.frametime) % 3;
                            v467.color = v431(color(255, 255, 255), color(255, 0, 0), math.sin(v467.tick_timer * math.pi / 3));
                            v468 = true;
                        end;
                    end;
                end;
            else
                for _, v479 in ipairs(v456) do
                    if v479.name == v467.bind_name and v479.active then
                        v468 = true;
                        break;
                    end;
                end;
            end;
            if v468 then
                v467.active = true;
                v467.height = v30(v467.height, 45, globals.frametime * 8);
                v467.position_offset = v30(v467.position_offset, v462, globals.frametime * 8);
                v462 = v462 + v467.height + v460;
            else
                v467.height = v30(v467.height, 0, globals.frametime * 8);
                if v467.height < 1 then
                    v467.active = false;
                end;
            end;
            if v467.active or v467.height > 1 then
                table.insert(v461, v467);
            end;
        end;
        for _, v481 in ipairs(v461) do
            v455(v481.icon, v481.text, v481.color, true, v458, v459 + v481.position_offset, v481.height, v481.text_offset);
        end;
        return;
    end;
end;
events.render:set(v482);
local l_world_to_screen_0 = render.world_to_screen;
local l_line_0 = render.line;
local l_screen_size_0 = render.screen_size;
local _ = ui.find;
local v487 = 0.1;
local v488 = 1;
local v489 = {};
local function v501()
    -- upvalues: v108 (ref), v489 (ref), v487 (ref), l_world_to_screen_0 (ref), l_screen_size_0 (ref), v109 (ref), l_line_0 (ref)
    if not v108:get() then
        return;
    else
        for v490, v491 in pairs(v489) do
            if v491.FadeTime <= 0 then
                v489[v490] = nil;
            else
                v491.WaitTime = v491.WaitTime - globals.frametime;
                if v491.WaitTime <= 0 then
                    v491.FadeTime = v491.FadeTime - 1 / v487 * globals.frametime;
                end;
                if v491.Position.x ~= nil and v491.Position.y ~= nil and v491.Position.z ~= nil and v491.Reason == nil then
                    local v492 = l_world_to_screen_0(vector(v491.Position.x, v491.Position.y, v491.Position.z));
                    if v492 ~= nil then
                        local l_x_2 = v492.x;
                        local l_y_2 = v492.y;
                        local _ = l_screen_size_0();
                        local v496, v497, v498, v499 = v109:get():unpack();
                        local v500 = v499 * v491.FadeTime;
                        l_line_0(vector(l_x_2 - 5, l_y_2 - 5), vector(l_x_2 + 5, l_y_2 + 5), color(v496, v497, v498, v500));
                        l_line_0(vector(l_x_2 - 5, l_y_2 + 5), vector(l_x_2 + 5, l_y_2 - 5), color(v496, v497, v498, v500));
                    end;
                end;
            end;
        end;
        return;
    end;
end;
local function v503(v502)
    -- upvalues: v489 (ref), v488 (ref)
    v489[v502.id] = {
        FadeTime = 1, 
        Position = v502.aim, 
        WaitTime = v488, 
        Reason = v502.state
    };
end;
events.render:set(function(_)
    -- upvalues: v501 (ref)
    v501();
end);
events.aim_ack:set(function(v505)
    -- upvalues: v503 (ref)
    v503(v505);
end);
events.round_start:set(function()
    -- upvalues: v489 (ref)
    v489 = {};
end);
events.player_spawned:set(function(_)
    -- upvalues: v489 (ref)
    v489 = {};
end);
local v507 = {
    enabled = false, 
    prev_tag = ""
};
local function v509(v508)
    -- upvalues: v507 (ref)
    if v508 ~= v507.prev_tag then
        common.set_clan_tag(v508);
        v507.prev_tag = v508;
    end;
end;
local function v516(v510, v511)
    local v512 = "               " .. v510 .. "                      ";
    local v513 = utils.net_channel();
    if not v513 then
        return "";
    else
        local v514 = globals.tickcount + math.floor((v513.latency[0] + 0.3) / globals.tickinterval + 0.5);
        local v515 = v511[math.floor(v514 / math.floor(0.3 / globals.tickinterval + 0.5) % #v511) + 1] + 1;
        return v512:sub(v515, v515 + 15);
    end;
end;
local function v518()
    -- upvalues: v507 (ref), v516 (ref), v509 (ref)
    if not v507.enabled then
        return;
    elseif not entity.get_local_player() then
        return;
    else
        local v517 = v516("#MeowStar", {
            [1] = 0, 
            [2] = 2, 
            [3] = 3, 
            [4] = 4, 
            [5] = 5, 
            [6] = 6, 
            [7] = 7, 
            [8] = 8, 
            [9] = 9, 
            [10] = 10, 
            [11] = 11, 
            [12] = 11, 
            [13] = 12, 
            [14] = 13, 
            [15] = 14, 
            [16] = 15, 
            [17] = 16, 
            [18] = 17, 
            [19] = 18, 
            [20] = 19, 
            [21] = 20, 
            [22] = 21, 
            [23] = 22, 
            [24] = 23
        });
        v509(v517);
        return;
    end;
end;
v119:set_callback(function(v519)
    -- upvalues: v507 (ref)
    v507.enabled = v519:get();
    if not v507.enabled then
        common.set_clan_tag("\000");
        v507.prev_tag = "";
    end;
end);
events.pre_render:set(v518);
local function v524()
    -- upvalues: v113 (ref), v32 (ref), v280 (ref)
    if not v113:get() then
        cvar.viewmodel_fov:float(v32(cvar.viewmodel_fov), true);
        cvar.viewmodel_offset_x:float(v32(cvar.viewmodel_offset_x), true);
        cvar.viewmodel_offset_y:float(v32(cvar.viewmodel_offset_y), true);
        cvar.viewmodel_offset_z:float(v32(cvar.viewmodel_offset_z), true);
        return;
    else
        local v520 = v280("viewmodel_fov", fov:get() / 10, nil, v32(cvar.viewmodel_fov));
        local v521 = v280("viewmodel_x", x_view:get() / 10, nil, v32(cvar.viewmodel_offset_x));
        local v522 = v280("viewmodel_y", y_view:get() / 10, nil, v32(cvar.viewmodel_offset_y));
        local v523 = v280("viewmodel_z", z_view:get() / 10, nil, v32(cvar.viewmodel_offset_z));
        cvar.viewmodel_fov:float(v520, true);
        cvar.viewmodel_offset_x:float(v521, true);
        cvar.viewmodel_offset_y:float(v522, true);
        cvar.viewmodel_offset_z:float(v523, true);
        return;
    end;
end;
events.render:set(v524);
local function v525()
    -- upvalues: v32 (ref)
    cvar.r_aspectratio:float(0);
    cvar.mp_teammates_are_enemies:float(0);
    cvar.viewmodel_fov:float(v32(cvar.viewmodel_fov), true);
    cvar.viewmodel_offset_x:float(v32(cvar.viewmodel_offset_x), true);
    cvar.viewmodel_offset_y:float(v32(cvar.viewmodel_offset_y), true);
    cvar.viewmodel_offset_z:float(v32(cvar.viewmodel_offset_z), true);
    common.set_clan_tag("");
end;
events.shutdown(v525);
local v526 = render.load_font("Verdana", 12, "a");
local v527 = "meow";
local v528 = "\a{Link Active}star";
local v529 = 0;
local v530 = 0;
local v531 = 0;
local v532 = 0;
local v533 = common.get_username();
local function v535(v534)
    if v534 >= 60 then
        return "\a{Link Active}";
    elseif v534 >= 30 then
        return color(255, 255, 0, 255);
    else
        return color(255, 0, 0, 255);
    end;
end;
local function v555()
    -- upvalues: v112 (ref), v530 (ref), v529 (ref), v535 (ref), v533 (ref), v526 (ref), v527 (ref), v528 (ref), v531 (ref), v532 (ref), v30 (ref)
    local _ = entity.get_local_player();
    if not globals.is_connected or not v112:get() then
        return;
    else
        local l_realtime_0 = globals.realtime;
        if l_realtime_0 - v530 >= 0.5 then
            v529 = math.floor(1 / globals.frametime);
            v530 = l_realtime_0;
        end;
        local v538 = " FPS";
        local v539 = tostring(v529);
        local v540 = v535(v529);
        local l_v533_0 = v533;
        local v542 = render.screen_size();
        local v543 = 22;
        local v544 = render.measure_text(v526, nil, v527);
        local v545 = render.measure_text(v526, nil, v528);
        local v546 = render.measure_text(v526, nil, l_v533_0);
        local v547 = render.measure_text(v526, nil, v539);
        local v548 = render.measure_text(v526, nil, v538);
        v531 = v544.x + v545.x + v546.x + v547.x + v548.x + 20;
        v532 = v30(v532, v531, 0.1);
        local v549 = vector(v542.x - v532 - 10, 10);
        local v550 = vector(v542.x - 10, 10 + v543);
        render.gradient(vector(v549.x, v549.y), vector(v549.x + (v550.x - v549.x) / 2, v550.y), color(0, 0, 0, 10), color(0, 0, 0, 90), color(0, 0, 0, 10), color(0, 0, 0, 90));
        render.gradient(vector(v549.x + (v550.x - v549.x) / 2, v549.y), v550, color(0, 0, 0, 90), color(0, 0, 0, 10), color(0, 0, 0, 90), color(0, 0, 0, 10));
        local v551 = v549.x + 6;
        local v552 = v549.y + (v543 - v544.y) / 2;
        render.text(v526, vector(v551, v552), color(255, 255, 255, 255), nil, v527 .. v528);
        local v553 = v551 + v544.x + v545.x + 5;
        render.text(v526, vector(v553, v552), color(255, 255, 255, 255), nil, l_v533_0);
        local v554 = v553 + v546.x + 5;
        if type(v540) == "string" then
            render.text(v526, vector(v554, v552), color(255, 255, 255, 255), nil, v540 .. v539);
        else
            render.text(v526, vector(v554, v552), v540, nil, v539);
        end;
        render.text(v526, vector(v554 + v547.x - 2, v552), color(255, 255, 255, 255), nil, v538);
        return;
    end;
end;
events.render:set(v555);
events.post_update_clientside_animation:set(function()
    -- upvalues: v25 (ref), v23 (ref), v26 (ref), v7 (ref)
    local v556 = entity.get_local_player();
    if not v556 or not v556:is_alive() then
        return;
    else
        local v557 = v556:get_anim_state();
        if not v557 then
            return;
        else
            local v558 = math.sqrt(v556.m_vecVelocity.x ^ 2 + v556.m_vecVelocity.y ^ 2) > 5;
            local v559 = bit.band(v556.m_fFlags, 1) == 0;
            local v560 = v25:get();
            if v560 == 1 then
                v556.m_flPoseParameter[6] = 0;
                ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"):override("Sliding");
            elseif v560 == 2 then
                v556.m_flPoseParameter[6] = globals.tickcount % 2 == 0 and utils.random_float(0.1, 1) or utils.random_float(0.1, 1);
            end;
            local v561 = v23:get();
            if v561 == 1 then
                v556.m_flPoseParameter[0] = 0;
                ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"):override("Sliding");
            elseif v561 == 2 then
                v556.m_flPoseParameter[0] = globals.tickcount % 2 == 0 and utils.random_float(0.1, 1) or utils.random_float(0.1, 1);
            elseif v561 == 3 and v558 and not v559 then
                v556.m_flPoseParameter[7] = 1;
                ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"):override("Walking");
            end;
            if v26:get("Pitch 0 On Land") and v557.landing then
                v556.m_flPoseParameter[12] = 0.5;
            elseif v26:get("Move Lean") and v558 then
                ffi.cast("animstate_layer_t**", ffi.cast("uintptr_t", v7(v556:get_index())) + 10640)[0][12].m_flWeight = 1;
            elseif v26:get("Earth Quake") then
                ffi.cast("animstate_layer_t**", ffi.cast("uintptr_t", v7(v556:get_index())) + 10640)[0][12].m_flWeight = utils.random_float(0.1, 1);
            elseif v26:get("Kangaroo") then
                v556.m_flPoseParameter[3] = math.random(0, 10) / 10;
                v556.m_flPoseParameter[6] = math.random(0, 10) / 10;
                v556.m_flPoseParameter[7] = math.random(0, 10) / 10;
            end;
            return;
        end;
    end;
end);
local function v563()
    -- upvalues: v114 (ref)
    local v562 = entity.get_local_player();
    if v562 == nil or not v562:is_alive() then
        return;
    elseif v114:get() then
        return (not not v562.m_bIsScoped or v562.m_bResumeZoom) and 100 or 255;
    else
        return;
    end;
end;
events.localplayer_transparency:set(v563);
local function v565()
    -- upvalues: v86 (ref), v145 (ref)
    if not v86:get() then
        return;
    elseif not rage.exploit:get() == 1 then
        return;
    else
        local v564 = v145();
        if v564 == "AC" or v564 == "A" then
            if globals.tickcount % 15 == 0 then
                rage.exploit:force_teleport();
            else
                rage.exploit:force_charge();
            end;
        end;
        return;
    end;
end;
events.createmove:set(v565);