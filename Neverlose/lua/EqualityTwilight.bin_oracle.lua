ui.sidebar("\aA4A4A4FFEquality", "transporter-3");
local l_clipboard_0 = require("neverlose/clipboard");
local l_smoothy_0 = require("neverlose/smoothy");
local _ = require("neverlose/base64");
local l_yaw_0 = require("neverlose/edge_yaw");
local l_base64_1 = require("neverlose/base64");
local function v8(v5, v6, v7)
    return v5 + (v6 - v5) * math.min(math.max(v7, 0), 1);
end;
local function _()
    if not entity.get_threat() then
        return "NO TARGET";
    else
        return entity.get_threat():get_name();
    end;
end;
ffi.cdef("    typedef struct {\n        char  pad_0000[20];\n        int m_nOrder;\n        int m_nSequence;\n        float m_flPrevCycle;\n        float m_flWeight;\n        float m_flWeightDeltaRate;\n        float m_flPlaybackRate;\n        float m_flCycle;\n        void *m_pOwner;\n        char  pad_0038[4];\n    } animstate_layer_t;\n");
local _ = ffi.typeof("uintptr_t**");
local v11 = utils.get_vfunc("client.dll", "VClientEntityList003", 3, "void*(__thiscall*)(void*, int)");
local function v13(v12)
    return tonumber(v12:string());
end;
local v14 = {};
local v15 = 0.095;
local function v20(v16, v17, v18, v19)
    -- upvalues: v15 (ref), v14 (ref), v8 (ref)
    if not v18 then
        v18 = v15;
    end;
    if v14[v16] == nil then
        v14[v16] = v19 or 0;
    end;
    v14[v16] = v8(v14[v16], v17, v18);
    return v14[v16];
end;
local v21 = {
    data = {}
};
vars = {
    screen = render.screen_size()
};
v21.draw = function()
    -- upvalues: v21 (ref), v8 (ref)
    local v22 = globals.frametime * 10;
    local v23 = 0;
    local v24 = color(105, 125, 165, 125);
    for v25 = #v21.data, 1, -1 do
        local v26 = v21.data[v25];
        local l_alpha_0 = v26.alpha;
        v26.alpha = math.clamp(v8(v26.alpha, v26.time > globals.realtime and 1.01 or -0.01, v22), 0, 1);
        if l_alpha_0 <= 0 then
            table.remove(v21.data, v25);
        end;
        if v25 > 5 then
            table.remove(v21.data, 1);
        end;
        local v28 = render.measure_text(1, "", v26.text);
        local v29 = vector(vars.screen.x / 2, vars.screen.y * 0.9 - v23 + 0.5);
        render.shadow(vector(vars.screen.x / 2 - v28.x / 2 - 5, vars.screen.y * 0.9 - v23 - 10), vector(vars.screen.x / 2 + v28.x / 2 + 5, vars.screen.y * 0.9 - v23 - 10 + v28.y + 10), color(v24.r, v24.g, v24.b, 255 * l_alpha_0), 40, 0, 5);
        render.rect_outline(vector(vars.screen.x / 2 - v28.x / 2 - 6, vars.screen.y * 0.9 - v23 - 11), vector(vars.screen.x / 2 + v28.x / 2 + 6, vars.screen.y * 0.9 - v23 - 10 + v28.y + 11), color(v24.r, v24.g, v24.b, 255 * l_alpha_0), 1, 5);
        render.rect(vector(vars.screen.x / 2 - v28.x / 2 - 5, vars.screen.y * 0.9 - v23 - 10), vector(vars.screen.x / 2 + v28.x / 2 + 5, vars.screen.y * 0.9 - v23 - 10 + v28.y + 10), color(38, 38, 38, 255 * l_alpha_0), 5);
        render.text(1, v29, v26.color:alpha_modulate(255 * l_alpha_0), "c", v26.text);
        v23 = v23 + 30 * l_alpha_0;
    end;
end;
events.render:set(v21.draw);
v21.add = function(v30, v31, v32)
    -- upvalues: v21 (ref)
    table.insert(v21.data, {
        alpha = 1.0E-4, 
        text = v30, 
        color = v31, 
        time = globals.realtime + v32
    });
end;
v21.add("Welcome back to Equality", color(), 3);
local v33 = {
    main_tab_selector = ui.create("Main", "\a{Link Active}" .. ui.get_icon("window") .. "\a{Text}  Tab"), 
    main_info = ui.create("Main", "\a{Link Active}" .. ui.get_icon("info") .. "\a{Text} Config"), 
    credits = ui.create("Main", "\a{Link Active}" .. ui.get_icon("badge-check") .. "\a{Text}  Credits"), 
    builder = ui.create("Main", "\a{Link Active}" .. ui.get_icon("shield") .. "\a{Text} Builder"), 
    builder_tweaks = ui.create("Main", "\a{Link Active}" .. ui.get_icon("screwdriver-wrench") .. "\a{Text} Tweaks"), 
    builder_defensive = ui.create("Main", "\a{Link Active}" .. ui.get_icon("transporter-3") .. "\a{Text} Defensive AA"), 
    visuals = ui.create("Main", "\a{Link Active}" .. ui.get_icon("palette") .. "\a{Text} Visuals"), 
    breaker = ui.create("Main", "\a{Link Active}" .. ui.get_icon("person-walking") .. "\a{Text} Anim breakers"), 
    misc = ui.create("Main", "\a{Link Active}" .. ui.get_icon("gear") .. "\a{Text} Miscs")
};
local v34 = v33.main_tab_selector:list("", {
    [1] = "\a{Link Active}" .. ui.get_icon("globe") .. " \a{Text}Main", 
    [2] = "\a{Link Active}" .. ui.get_icon("user-group-crown") .. " \a{Text}Anti-Aim", 
    [3] = "\a{Link Active}" .. ui.get_icon("sparkles") .. " \a{Text}Visuals", 
    [4] = "\a{Link Active}" .. ui.get_icon("user-gear") .. " \a{Text}Misc"
});
local l_OpenExternalBrowserURL_0 = panorama.SteamOverlayAPI.OpenExternalBrowserURL;
local v36 = {
    youtube = v33.credits:button(" " .. ui.get_icon("youtube") .. "  Youtube", function()
        -- upvalues: l_OpenExternalBrowserURL_0 (ref)
        l_OpenExternalBrowserURL_0("https://www.youtube.com/@astorze");
    end, true), 
    telegram = v33.credits:button(" " .. ui.get_icon("telegram") .. "  Telegram", function()
        -- upvalues: l_OpenExternalBrowserURL_0 (ref)
        l_OpenExternalBrowserURL_0("https://t.me/Xenomophor");
    end, true), 
    config = v33.credits:button(" " .. ui.get_icon("gift") .. "  Neverlose config", function()
        -- upvalues: l_OpenExternalBrowserURL_0 (ref)
        l_OpenExternalBrowserURL_0("https://neverlose.cc/market/item?id=LLaP8d");
    end, true), 
    discord = v33.credits:button(" " .. ui.get_icon("discord") .. "  Discord community", function()
        -- upvalues: l_OpenExternalBrowserURL_0 (ref)
        l_OpenExternalBrowserURL_0("https://discord.gg/X2uTwrexBJ");
    end, true)
};
local function v40()
    -- upvalues: v34 (ref), v36 (ref)
    local v37 = v34:get() == 1;
    for _, v39 in pairs(v36) do
        v39:visibility(v37);
    end;
end;
local _ = {};
local v42 = {
    [1] = "Global", 
    [2] = "Stand", 
    [3] = "Run", 
    [4] = "Slow Walking", 
    [5] = "Air", 
    [6] = "Air Duck", 
    [7] = "Duck", 
    [8] = "Duck-Run"
};
local v43 = {
    state_selector = v33.builder:combo("State", v42), 
    menu_elements = {}
};
for _, v45 in ipairs(v42) do
    if v45 ~= "Global" then
        v43.menu_elements[v45] = {
            allow = v33.builder:switch("\a{Link Active}" .. ui.get_icon("square-check") .. " \a{Text}Allow " .. v45), 
            yaw = v33.builder:combo("\a{Link Active}" .. ui.get_icon("angle") .. " \a{Text}Yaw ", "Static", "Switch", "Flick"), 
            yaw_slider = v33.builder:slider("\a{Link Active}" .. ui.get_icon("slider") .. " \a{Text}Value ", -180, 180, 0, true, "\194\176"), 
            yaw_l = v33.builder:slider("\a{Link Active}" .. ui.get_icon("angle-left") .. " \a{Text}Left ", -180, 180, 0, true, "\194\176"), 
            yaw_r = v33.builder:slider("\a{Link Active}" .. ui.get_icon("angle-right") .. " \a{Text}Right ", -180, 180, 0, true, "\194\176"), 
            delay = v33.builder:switch("\a{Link Active}" .. ui.get_icon("clock") .. " \a{Text}Delay "), 
            delay_type = v33.builder:combo("\a{Link Active}" .. ui.get_icon("clock") .. " \a{Text}Delay type ", "Ticks", "Chance"), 
            delay_value = v33.builder:slider("\a{Link Active}" .. ui.get_icon("hourglass-clock") .. " \a{Text}Delay ticks ", 1, 14, 1, true, "t"), 
            delay_random = v33.builder:slider("\a{Link Active}" .. ui.get_icon("shuffle") .. " \a{Text}Add random delay ticks ", 0, 14, 0, true, "t"), 
            delay_chance = v33.builder:slider("\a{Link Active}" .. ui.get_icon("shuffle") .. " \a{Text}Delay chance ", 1, 100, 1, true, "%"), 
            yaw_offset = v33.builder:combo("\a{Link Active}" .. ui.get_icon("arrows-left-right") .. " \a{Text}Yaw Jitter ", "Off", "Center", "Offset", "Random", "3-Way"), 
            yaw_offset_value = v33.builder:slider("\a{Link Active}" .. ui.get_icon("slider") .. " \a{Text}Value ", -180, 180, 0, true, "\194\176"), 
            body_yaw_1 = v33.builder:slider("\a{Link Active}" .. ui.get_icon("angle-left") .. " \a{Text}Body Left ", 0, 60, 0, true, "\194\176"), 
            body_yaw_2 = v33.builder:slider("\a{Link Active}" .. ui.get_icon("angle-right") .. " \a{Text}Body Right ", 0, 60, 0, true, "\194\176"), 
            break_lc = v33.builder_defensive:combo("\a{Link Active}" .. ui.get_icon("transporter-6") .. " \a{Text}Break LC", "On peek", "Always On", "Skeet"), 
            defensive_aa = v33.builder_defensive:switch("\a{Link Active}" .. ui.get_icon("crab") .. " \a{Text}Defensive aa "), 
            defensive_pitch = v33.builder_defensive:combo("\a{Link Active}" .. ui.get_icon("arrows-up-down") .. " \a{Text}Defensive Pitch ", "Static", "Switch", "Spin", "Random"), 
            defensive_pitch_1 = v33.builder_defensive:slider("\a{Link Active}" .. ui.get_icon("angle") .. " \a{Text}Pitch ", -89, 89, 0, true, "\194\176"), 
            defensive_pitch_2 = v33.builder_defensive:slider("\a{Link Active}" .. ui.get_icon("angle") .. " \a{Text}Second Pitch ", -89, 89, 0, true, "\194\176"), 
            defensive_yaw = v33.builder_defensive:combo("\a{Link Active}" .. ui.get_icon("arrows-left-right") .. " \a{Text}Yaw ", "Static", "Switch", "Spin", "Random"), 
            defensive_yaw_1 = v33.builder_defensive:slider("\a{Link Active}" .. ui.get_icon("angle") .. " \a{Text}Yaw ", -180, 180, 0, true, "\194\176"), 
            defensive_yaw_2 = v33.builder_defensive:slider("\a{Link Active}" .. ui.get_icon("angle") .. " \a{Text}Second Yaw ", -180, 180, 0, true, "\194\176"), 
            defensive_yaw_speed = v33.builder_defensive:slider("\a{Link Active}" .. ui.get_icon("rotate") .. " \a{Text}Speed ", 0, 100, 0, true, "\194\176/s")
        };
    else
        v43.menu_elements[v45] = {
            yaw = v33.builder:combo("\a{Link Active}" .. ui.get_icon("angle") .. " \a{Text}Yaw ", "Static", "Switch", "Flick"), 
            yaw_slider = v33.builder:slider("\a{Link Active}" .. ui.get_icon("slider") .. " \a{Text}Value ", -180, 180, 0, true, "\194\176"), 
            yaw_l = v33.builder:slider("\a{Link Active}" .. ui.get_icon("angle-left") .. " \a{Text}Left ", -180, 180, 0, true, "\194\176"), 
            yaw_r = v33.builder:slider("\a{Link Active}" .. ui.get_icon("angle-right") .. " \a{Text}Right ", -180, 180, 0, true, "\194\176"), 
            delay = v33.builder:switch("\a{Link Active}" .. ui.get_icon("clock") .. " \a{Text}Delay "), 
            delay_type = v33.builder:combo("\a{Link Active}" .. ui.get_icon("clock") .. " \a{Text}Delay type ", "Ticks", "Chance"), 
            delay_value = v33.builder:slider("\a{Link Active}" .. ui.get_icon("hourglass-clock") .. " \a{Text}Delay ticks ", 1, 14, 1, true, "t"), 
            delay_random = v33.builder:slider("\a{Link Active}" .. ui.get_icon("shuffle") .. " \a{Text}Add random delay ticks ", 0, 14, 0, true, "t"), 
            delay_chance = v33.builder:slider("\a{Link Active}" .. ui.get_icon("shuffle") .. " \a{Text}Delay chance ", 1, 100, 1, true, "%"), 
            yaw_offset = v33.builder:combo("\a{Link Active}" .. ui.get_icon("arrows-left-right") .. " \a{Text}Yaw Jitter ", "Off", "Center", "Offset", "Random", "3-Way"), 
            yaw_offset_value = v33.builder:slider("\a{Link Active}" .. ui.get_icon("slider") .. " \a{Text}Value ", -180, 180, 0, true, "\194\176"), 
            body_yaw_1 = v33.builder:slider("\a{Link Active}" .. ui.get_icon("angle-left") .. " \a{Text}Body Left ", 0, 60, 0, true, "\194\176"), 
            body_yaw_2 = v33.builder:slider("\a{Link Active}" .. ui.get_icon("angle-right") .. " \a{Text}Body Right ", 0, 60, 0, true, "\194\176"), 
            break_lc = v33.builder_defensive:combo("\a{Link Active}" .. ui.get_icon("transporter-6") .. " \a{Text}Break LC", "On peek", "Always On", "Skeet"), 
            defensive_aa = v33.builder_defensive:switch("\a{Link Active}" .. ui.get_icon("crab") .. " \a{Text}Defensive aa "), 
            defensive_pitch = v33.builder_defensive:combo("\a{Link Active}" .. ui.get_icon("arrows-up-down") .. " \a{Text}Defensive Pitch ", "Static", "Switch", "Spin", "Random"), 
            defensive_pitch_1 = v33.builder_defensive:slider("\a{Link Active}" .. ui.get_icon("angle") .. " \a{Text}Pitch ", -89, 89, 0, true, "\194\176"), 
            defensive_pitch_2 = v33.builder_defensive:slider("\a{Link Active}" .. ui.get_icon("angle") .. " \a{Text}Second Pitch ", -89, 89, 0, true, "\194\176"), 
            defensive_yaw = v33.builder_defensive:combo("\a{Link Active}" .. ui.get_icon("arrows-left-right") .. " \a{Text}Yaw ", "Static", "Switch", "Spin", "Random"), 
            defensive_yaw_1 = v33.builder_defensive:slider("\a{Link Active}" .. ui.get_icon("angle") .. " \a{Text}Yaw ", -180, 180, 0, true, "\194\176"), 
            defensive_yaw_2 = v33.builder_defensive:slider("\a{Link Active}" .. ui.get_icon("angle") .. " \a{Text}Second Yaw ", -180, 180, 0, true, "\194\176"), 
            defensive_yaw_speed = v33.builder_defensive:slider("\a{Link Active}" .. ui.get_icon("rotate") .. " \a{Text}Speed ", 0, 100, 0, true, "\194\176/s")
        };
    end;
end;
local function v52()
    -- upvalues: v43 (ref), v42 (ref), v34 (ref)
    local v46 = v43.state_selector:get();
    for _, v48 in ipairs(v42) do
        local v49 = v43.menu_elements[v48];
        local v50 = v48 == v46 and v34:get() == 2;
        local v51 = v48 == "Global" or v49.allow and v49.allow:get();
        if v49.allow then
            v49.allow:visibility(v50);
        end;
        if v49.yaw then
            v49.yaw:visibility(v50 and v51);
        end;
        if v49.yaw_slider then
            v49.yaw_slider:visibility(v50 and v51 and v49.yaw:get() == "Static");
        end;
        if v49.yaw_l then
            v49.yaw_l:visibility(v50 and v51 and (v49.yaw:get() == "Switch" or v49.yaw:get() == "Flick"));
        end;
        if v49.yaw_r then
            v49.yaw_r:visibility(v50 and v51 and (v49.yaw:get() == "Switch" or v49.yaw:get() == "Flick"));
        end;
        if v49.delay then
            v49.delay:visibility(v50 and v51 and v49.yaw:get() == "Switch");
        end;
        if v49.delay_type then
            v49.delay_type:visibility(v50 and v51 and v49.yaw:get() == "Switch" and v49.delay:get());
        end;
        if v49.delay_value then
            v49.delay_value:visibility(v50 and v51 and v49.yaw:get() == "Switch" and v49.delay:get() and v49.delay_type:get() == "Ticks");
        end;
        if v49.delay_random then
            v49.delay_random:visibility(v50 and v51 and v49.yaw:get() == "Switch" and v49.delay:get() and v49.delay_type:get() == "Ticks");
        end;
        if v49.delay_chance then
            v49.delay_chance:visibility(v50 and v51 and v49.yaw:get() == "Switch" and v49.delay:get() and v49.delay_type:get() == "Chance");
        end;
        if v49.yaw_offset then
            v49.yaw_offset:visibility(v50 and v51);
        end;
        if v49.yaw_offset_value then
            v49.yaw_offset_value:visibility(v50 and v51 and v49.yaw_offset:get() ~= "Off");
        end;
        if v49.body_yaw_1 then
            v49.body_yaw_1:visibility(v50 and v51);
        end;
        if v49.body_yaw_2 then
            v49.body_yaw_2:visibility(v50 and v51);
        end;
        if v49.break_lc then
            v49.break_lc:visibility(v50 and v51);
        end;
        if v49.defensive_aa then
            v49.defensive_aa:visibility(v50 and v51);
        end;
        if v49.defensive_pitch then
            v49.defensive_pitch:visibility(v50 and v51 and v49.defensive_aa:get());
        end;
        if v49.defensive_pitch_1 then
            v49.defensive_pitch_1:visibility(v50 and v51 and v49.defensive_aa:get());
        end;
        if v49.defensive_pitch_2 then
            v49.defensive_pitch_2:visibility(v50 and v51 and v49.defensive_aa:get() and v49.defensive_pitch:get() ~= "Static");
        end;
        if v49.defensive_yaw then
            v49.defensive_yaw:visibility(v50 and v51 and v49.defensive_aa:get());
        end;
        if v49.defensive_yaw_1 then
            v49.defensive_yaw_1:visibility(v50 and v51 and v49.defensive_aa:get() and v49.defensive_yaw:get() ~= "Spin");
        end;
        if v49.defensive_yaw_2 then
            v49.defensive_yaw_2:visibility(v50 and v51 and v49.defensive_aa:get() and (not (v49.defensive_yaw:get() ~= "Switch") or v49.defensive_yaw:get() == "Random") and v49.defensive_yaw:get() ~= "Spin");
        end;
        if v49.defensive_yaw_speed then
            v49.defensive_yaw_speed:visibility(v50 and v51 and v49.defensive_aa:get() and v49.defensive_yaw:get() == "Spin");
        end;
    end;
end;
v52();
events.pre_render:set(function()
    -- upvalues: v52 (ref), v40 (ref)
    v52();
    v40();
end);
local v53 = {
    manual_yaw = v33.builder_tweaks:combo("\a{Link Active}" .. ui.get_icon("up-right-and-down-left-from-center") .. "\a{Text}  Manual Yaw", "Off", "Left", "Right", "Forward"), 
    fast_ladder = v33.builder_tweaks:switch("\a{Link Active}" .. ui.get_icon("water-ladder") .. "\a{Text} Fast Ladder"), 
    legit_aa = v33.builder_tweaks:switch("\a{Link Active}" .. ui.get_icon("user-plus") .. "\a{Text} Legit AA"), 
    super_toss = v33.builder_tweaks:switch("\a{Link Active}" .. ui.get_icon("bomb") .. "\a{Text} Super Toss"), 
    nade_fix = v33.builder_tweaks:switch("\a{Link Active}" .. ui.get_icon("land-mine-on") .. "\a{Text} Nade Fix"), 
    edge_yaw = v33.builder_tweaks:switch("\a{Link Active}" .. ui.get_icon("corner") .. "\a{Text} Edge Yaw"), 
    fake_lag_addon = v33.builder_tweaks:switch("\a{Link Active}" .. ui.get_icon("transporter-1") .. "\a{Text} Fake Lag addons"), 
    warmup_aa = v33.builder_tweaks:switch("\a{Link Active}" .. ui.get_icon("arrows-spin") .. "\a{Text} Warmup AA"), 
    safehead = v33.builder_tweaks:switch("\a{Link Active}" .. ui.get_icon("user-helmet-safety") .. "\a{Text} Safe Head"), 
    flick_exp = v33.builder_tweaks:switch("\a{Link Active}" .. ui.get_icon("user-helmet-safety") .. "\a{Text} Flick Exploit")
};
v53.safehead_ref = v53.safehead:create();
v53.espam = v53.safehead_ref:switch("E Spam");
v53.legit_aa_ref = v53.legit_aa:create();
v53.legit_type = v53.legit_aa_ref:list("", "Static", "2-Way", "3-Way", "Defensive Spin");
local v54 = nil;
v54 = {
    enabled = v33.builder_tweaks:switch("\a{Link Active}" .. ui.get_icon("person") .. "\a{Text} Ai Peek")
};
local v55 = v54.enabled:create();
v54.simulation = v55:slider("Simulation", 25, 35, 30, 0.01, "s");
v54.rate_limit = v55:slider("Rate Limit", 0, 30, 3, 0.01, "s");
v54.hitchance = v55:slider("Hit Chance", 0, 100, 35, nil, function(v56)
    if v56 == 0 then
        return "Default";
    else
        return v56 .. "%";
    end;
end);
v54.hitboxes = v55:selectable("Hitboxes", {
    [1] = "Head", 
    [2] = "Chest", 
    [3] = "Stomach", 
    [4] = "Arms", 
    [5] = "Legs"
});
v54.weapons = v55:selectable("Weapons", {
    [1] = "Snipers", 
    [2] = "Pistols"
});
v54.color = v55:color_picker("Color", color(255, 255, 255, 125));
v55 = {
    lc_ind = v33.visuals:switch("\a{Link Active}" .. ui.get_icon("transporter-3") .. "\a{Text} LC indicator"), 
    keep_model_transparency = v33.visuals:switch("\a{Link Active}" .. ui.get_icon("person") .. "\a{Text} Keep Model Transparency"), 
    custom_scope = v33.visuals:switch("\a{Link Active}" .. ui.get_icon("telescope") .. "\a{Text} Custom Scope"), 
    smooth_fov = v33.visuals:switch("\a{Link Active}" .. ui.get_icon("wind") .. "\a{Text} Smooth scope FOV"), 
    grenade_radius = v33.visuals:switch("\a{Link Active}" .. ui.get_icon("explosion") .. "\a{Text} Grenade Radius"), 
    left_side_indicator = v33.visuals:switch("\a{Link Active}" .. ui.get_icon("window") .. "\a{Text} 500$ indicators"), 
    crosshitmarker = v33.visuals:switch("\a{Link Active}" .. ui.get_icon("bullseye-arrow") .. "\a{Text} Hitmarker"), 
    viewmodel = v33.visuals:switch("\a{Link Active}" .. ui.get_icon("hand") .. "\a{Text} Viewmodel"), 
    snap_lines = v33.visuals:switch("\a{Link Active}" .. ui.get_icon("line") .. "\a{Text} Target Snaplines"), 
    watermark = v33.visuals:switch("\a{Link Active}" .. ui.get_icon("window") .. "\a{Text} 500$ watermark"), 
    logs = v33.visuals:switch("\a{Link Active}" .. ui.get_icon("message-text") .. "\a{Text} Aimbot Logs")
};
local v57 = {
    [1] = "Static", 
    [2] = "Jitter", 
    [3] = "Walking"
};
local v59 = v33.breaker:slider("\a{Link Active}" .. ui.get_icon("person-walking") .. "\aFFFFFFFF Walking", 1, 3, 1, nil, function(v58)
    -- upvalues: v57 (ref)
    return v57[v58];
end);
local v61 = v33.breaker:slider("\a{Link Active}" .. ui.get_icon("plane") .. "\aFFFFFFFF Air", 1, 3, 1, nil, function(v60)
    -- upvalues: v57 (ref)
    return v57[v60];
end);
v55.watermark_ref = v55.watermark:create();
v55.watermark_nick_selector = v55.watermark_ref:combo("Name", "NL", "Custom");
v55.watermark_nickname = v55.watermark_ref:input("Custom name", "Some Custom Name");
local function v62()
    -- upvalues: v55 (ref)
    v55.watermark_nickname:visibility(v55.watermark_nick_selector:get() == "Custom");
end;
v62();
v55.watermark_nick_selector:set_callback(v62);
v55.animate_indicators = v55.left_side_indicator:create():switch("Animate Indicators", true);
v55.hitmarker_color = v55.crosshitmarker:create():color_picker("Color", color(88, 255, 209, 255));
local v63 = v33.breaker:selectable("\a{Link Active}" .. ui.get_icon("puzzle-piece") .. "\aFFFFFFFF Addons", {
    [1] = "Pitch 0 On Land", 
    [2] = "Move Lean", 
    [3] = "Earth Quake", 
    [4] = "Kangaroo"
});
v55.custom_scope_ref = v55.custom_scope:create();
v55.custom_scope_color = v55.custom_scope_ref:color_picker("Color", color(255, 255, 255, 255));
v55.custom_scope_gap = v55.custom_scope_ref:slider("Gap", 0, 200, 10);
v55.custom_scope_size = v55.custom_scope_ref:slider("Size", 0, 320, 50);
v55.t_style = v55.custom_scope_ref:switch("T Style");
viewmodelref = v55.viewmodel:create();
fov = viewmodelref:slider("FOV", 0, 1000, 600, 0.1);
x_view = viewmodelref:slider("X", -100, 100, 10, 0.1);
y_view = viewmodelref:slider("Y", -100, 100, 10, 0.1);
z_view = viewmodelref:slider("Z", -100, 100, -10, 0.1);
local v64 = {
    [59] = "Off", 
    [160] = "16:10", 
    [177] = "16:9", 
    [125] = "5:4", 
    [150] = "3:2", 
    [133] = "4:3"
};
aspect = v33.visuals:slider("\a{Link Active}" .. ui.get_icon("window") .. "\a{Text} Aspect Ratio", 59, 200, 0, 0.01, function(v65)
    -- upvalues: v64 (ref)
    return v64[v65];
end);
v55.grenade_radius_ref = v55.grenade_radius:create();
v55.grenade_select = v55.grenade_radius_ref:listable("", "Molotov", "Smoke");
v55.grenade_enemy = v55.grenade_radius_ref:color_picker("Enemy Molotov Color", color(255, 25, 25, 255));
v55.grenade_friend = v55.grenade_radius_ref:color_picker("Friendly Molotov Color", color(114, 202, 125, 255));
v55.smoke = v55.grenade_radius_ref:color_picker("Smoke Color", color(255, 255, 255, 255));
local v66 = {
    edge_stop = v33.misc:switch("\a{Link Active}" .. ui.get_icon("hand") .. "\a{Text} Edge Stop"), 
    air_stop = v33.misc:switch("\a{Link Active}" .. ui.get_icon("wind") .. "\a{Text} Air Stop"), 
    console_modulation = v33.misc:switch("\a{Link Active}" .. ui.get_icon("window") .. "\a{Text} Modulate console"), 
    team_aimbot = v33.misc:switch("\a{Link Active}" .. ui.get_icon("gun") .. "\a{Text} Force Teammate Aim Bot"), 
    clantag = v33.misc:switch("\a{Link Active}" .. ui.get_icon("user-secret") .. "\a{Text} Clan Tag"), 
    ping = v33.misc:slider("\a{Link Active}" .. ui.get_icon("signal") .. "\a{Text} Ping Spike", 0, 200, 0, true, " ms"), 
    trashtalk = v33.misc:switch("\a{Link Active}" .. ui.get_icon("face-swear") .. "\a{Text} Trash Talk"), 
    ideal_peek = v33.misc:switch("\a{Link Active}" .. ui.get_icon("lightbulb-cfl") .. "\a{Text} Ideal Peek"), 
    spectator = v33.misc:switch("\a{Link Active}" .. ui.get_icon("tv") .. "\a{Text} Spectator list"), 
    optimize = v33.misc:switch("\a{Link Active}" .. ui.get_icon("chart-line-up") .. "\a{Text} Optimize CVars")
};
v66.console_modulation_ref = v66.console_modulation:create();
v66.console_color = v66.console_modulation_ref:color_picker("Color", color(126, 126, 126, 100));
local function v67()
    -- upvalues: v43 (ref), v34 (ref), v53 (ref), v55 (ref), v63 (ref), v59 (ref), v61 (ref), v54 (ref), v66 (ref)
    v43.state_selector:visibility(v34:get() == 2);
    v53.manual_yaw:visibility(v34:get() == 2);
    v53.fast_ladder:visibility(v34:get() == 2);
    v53.legit_aa:visibility(v34:get() == 2);
    v53.super_toss:visibility(v34:get() == 2);
    v53.nade_fix:visibility(v34:get() == 2);
    v53.fake_lag_addon:visibility(v34:get() == 2);
    v53.warmup_aa:visibility(v34:get() == 2);
    v53.safehead:visibility(v34:get() == 2);
    v53.edge_yaw:visibility(v34:get() == 2);
    v53.flick_exp:visibility(v34:get() == 2);
    v55.lc_ind:visibility(v34:get() == 3);
    v55.keep_model_transparency:visibility(v34:get() == 3);
    v55.custom_scope:visibility(v34:get() == 3);
    v55.smooth_fov:visibility(v34:get() == 3);
    v55.left_side_indicator:visibility(v34:get() == 3);
    v55.snap_lines:visibility(v34:get() == 3);
    v55.viewmodel:visibility(v34:get() == 3);
    v55.watermark:visibility(v34:get() == 3);
    v55.logs:visibility(v34:get() == 3);
    v55.grenade_radius:visibility(v34:get() == 3);
    v55.crosshitmarker:visibility(v34:get() == 3);
    aspect:visibility(v34:get() == 3);
    v63:visibility(v34:get() == 3);
    v59:visibility(v34:get() == 3);
    v61:visibility(v34:get() == 3);
    v54.enabled:visibility(v34:get() == 2);
    v66.edge_stop:visibility(v34:get() == 4);
    v66.air_stop:visibility(v34:get() == 4);
    v66.clantag:visibility(v34:get() == 4);
    v66.trashtalk:visibility(v34:get() == 4);
    v66.console_modulation:visibility(v34:get() == 4);
    v66.spectator:visibility(v34:get() == 4);
    v66.ideal_peek:visibility(v34:get() == 4);
    v66.ping:visibility(v34:get() == 4);
    v66.team_aimbot:visibility(v34:get() == 4);
    v66.optimize:visibility(v34:get() == 4);
end;
v67();
v34:set_callback(v67);
ui.find("Miscellaneous", "Main", "Other", "Fake Latency"):disabled(true);
ui.find("Miscellaneous", "Main", "Other"):label("Fake Latency is located in the misc tab of Equality");
local v68 = false;
local v69 = 0;
local function v71(v70)
    -- upvalues: v69 (ref), v68 (ref)
    if not entity.get_local_player() then
        return;
    else
        if globals.tickcount > v69 + v70 and globals.choked_commands == 0 then
            v68 = not v68;
            v69 = globals.tickcount;
        end;
        if globals.tickcount < v69 then
            v69 = globals.tickcount;
        end;
        return v68;
    end;
end;
local v72 = false;
local v73 = false;
local function v82(v74)
    -- upvalues: v72 (ref), v73 (ref)
    local v75 = entity.get_local_player();
    if not v75 or not v75:is_alive() then
        return "Unknown";
    else
        local v76 = v75.m_vecAbsVelocity:length2d();
        local l_m_fFlags_0 = v75.m_fFlags;
        local v78 = bit.band(l_m_fFlags_0, 1) == 1;
        local v79 = bit.band(l_m_fFlags_0, 1) == 0 or v74.in_jump;
        local v80 = v75.m_flDuckAmount > 0.7;
        local v81 = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"):get();
        v72 = v78;
        v73 = not v78;
        if v79 and v80 then
            return "Air Duck";
        elseif v79 then
            return "Air";
        elseif v80 and v76 > 10 then
            return "Duck-Run";
        elseif v80 and v76 < 10 then
            return "Duck";
        elseif v78 and v81 and v76 > 10 then
            return "Slow Walking";
        elseif v78 and v76 > 5 then
            return "Run";
        elseif v78 and v76 < 5 then
            return "Stand";
        else
            return "Unknown";
        end;
    end;
end;
local v83 = 0;
local v84 = 1;
local function v89(v85, v86, v87)
    -- upvalues: v84 (ref), v83 (ref)
    local v88 = 1 / (globals.frametime * v87 * 2) * v84;
    v83 = v83 + v88;
    if v86 <= v83 then
        v83 = v86;
        v84 = -1;
    elseif v83 <= v85 then
        v83 = v85;
        v84 = 1;
    end;
    return v83;
end;
local v90 = {
    max_tickbase = 0
};
local function v94()
    -- upvalues: v90 (ref)
    local v91 = entity.get_local_player();
    if not v91 then
        return;
    else
        local l_m_nTickBase_0 = v91.m_nTickBase;
        if math.abs(l_m_nTickBase_0 - v90.max_tickbase) > 64 then
            v90.max_tickbase = 0;
        end;
        local v93 = 0;
        if v90.max_tickbase < l_m_nTickBase_0 then
            v90.max_tickbase = l_m_nTickBase_0;
        elseif l_m_nTickBase_0 < v90.max_tickbase then
            v93 = math.min(14, math.max(0, v90.max_tickbase - l_m_nTickBase_0 - 1));
        end;
        return v93;
    end;
end;
v73 = false;
local v95 = 0;
local v96 = false;
local function v103(v97)
    -- upvalues: v82 (ref), v43 (ref), v71 (ref), v95 (ref), v96 (ref), v94 (ref), v89 (ref), v53 (ref), l_yaw_0 (ref)
    ui.find("Aimbot", "Anti Aim", "Angles", "Enabled"):override(true);
    ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"):override("Down");
    ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"):override("Backward");
    ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"):override("At Target");
    ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"):override("Disabled");
    ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"):override(true);
    ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"):override("");
    ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding"):override("Off");
    ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles"):override(false);
    ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"):override(false);
    local v98 = entity.get_local_player();
    if not v98 and not v98:is_alive() then
        return;
    elseif not globals.is_connected then
        return;
    else
        local v99 = v82(v97);
        local v100 = v43.menu_elements[v99];
        if not v100 or v99 ~= "Global" and not v100.allow:get() then
            v100 = v43.menu_elements.Global;
        end;
        total_delay = v100.delay_value:get() + math.random(0, v100.delay_random:get());
        if v100.yaw:get() == "Static" then
            ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"):override(v100.yaw_slider:get());
            ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"):override(false);
        elseif v100.yaw:get() == "Switch" and not v100.delay:get() then
            ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"):override(v71(1) and v100.yaw_l:get() or v100.yaw_r:get());
            ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"):override(v71(1));
        elseif v100.yaw:get() == "Switch" and v100.delay:get() and v100.delay_type:get() == "Ticks" then
            ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"):override(v71(total_delay) and v100.yaw_l:get() or v100.yaw_r:get());
            ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"):override(v71(total_delay));
        elseif v100.yaw:get() == "Switch" and v100.delay:get() and v100.delay_type:get() == "Chance" then
            if globals.choked_commands == 0 then
                local l_tickcount_0 = globals.tickcount;
                if l_tickcount_0 - v95 >= 2 and utils.random_int(1, 100) <= v100.delay_chance:get() then
                    v96 = not v96;
                    v95 = l_tickcount_0;
                end;
            end;
            ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"):override(v96 and v100.yaw_l:get() or v100.yaw_r:get());
            ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"):override(v96);
        elseif v100.yaw:get() == "Flick" then
            ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"):override(globals.commandack % math.random(2, 3) == 1 and v100.yaw_l:get() or v100.yaw_r:get());
            ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"):override(globals.commandack % math.random(2, 3) == 1);
        end;
        ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"):override(v100.body_yaw_1:get());
        ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"):override(v100.body_yaw_2:get());
        if v100.yaw_offset ~= "Off" then
            ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"):override(v100.yaw_offset:get());
            ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"):override(v100.yaw_offset_value:get());
        end;
        defensive_t = v94();
        if v100.break_lc:get() == "On peek" then
            ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"):override("On Peek");
        elseif v100.break_lc:get() == "Always On" then
            ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"):override("Always On");
        elseif v100.break_lc:get() == "Skeet" then
            ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"):override("On Peek");
            v97.force_defensive = v97.command_number % 21 == 1;
        end;
        ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden"):override(v100.defensive_aa:get() and defensive_t > 1 and defensive_t < 13);
        if defensive_t > 1 and defensive_t < 13 and v100.defensive_aa:get() then
            ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"):override(0);
            ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"):override(0);
        end;
        if v100.defensive_yaw:get() == "Static" and defensive_t > 1 and defensive_t < 13 then
            rage.antiaim:override_hidden_yaw_offset(-v100.defensive_yaw_1:get());
        elseif v100.defensive_yaw:get() == "Switch" and defensive_t > 1 and defensive_t < 13 then
            rage.antiaim:override_hidden_yaw_offset(v71(v100.yaw:get() == "Static" and 1 or total_delay) and -v100.defensive_yaw_1:get() or -v100.defensive_yaw_2:get());
        elseif v100.defensive_yaw:get() == "Spin" and defensive_t > 1 and defensive_t < 13 then
            rage.antiaim:override_hidden_yaw_offset(-math.normalize_yaw(globals.curtime * (v100.defensive_yaw_speed:get() * 10)));
        elseif v100.defensive_yaw:get() == "Random" and defensive_t > 1 and defensive_t < 13 then
            rage.antiaim:override_hidden_yaw_offset(math.random(-v100.defensive_yaw_1:get(), -v100.defensive_yaw_2:get()));
        end;
        if v100.defensive_pitch:get() == "Static" and defensive_t > 1 and defensive_t < 13 then
            rage.antiaim:override_hidden_pitch(v100.defensive_pitch_1:get());
        elseif v100.defensive_pitch:get() == "Switch" and defensive_t > 1 and defensive_t < 13 then
            rage.antiaim:override_hidden_pitch(v71(v100.yaw:get() == "Static" and 1 or total_delay) and v100.defensive_pitch_1:get() or v100.defensive_pitch_2:get());
        elseif v100.defensive_pitch:get() == "Spin" and defensive_t > 1 and defensive_t < 13 then
            rage.antiaim:override_hidden_pitch(v89(v100.defensive_pitch_1:get(), v100.defensive_pitch_2:get(), 4));
        elseif v100.defensive_pitch:get() == "Random" and defensive_t > 1 and defensive_t < 13 then
            rage.antiaim:override_hidden_pitch(math.random(v100.defensive_pitch_1:get(), v100.defensive_pitch_2:get()));
        end;
        if v53.edge_yaw:get() then
            local v102 = l_yaw_0.get();
            ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"):override(v102);
        end;
        if v53.manual_yaw:get() == "Left" then
            ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"):override("Local View");
            ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"):override(-90);
        elseif v53.manual_yaw:get() == "Right" then
            ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"):override("Local View");
            ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"):override(90);
        end;
        return;
    end;
end;
events.createmove:set(function(v104)
    -- upvalues: v103 (ref)
    v103(v104);
end);
local function v107(v105)
    -- upvalues: v53 (ref)
    local v106 = entity.get_local_player();
    if v53.fast_ladder:get() and v106.m_MoveType == 9 then
        if v105.forwardmove > 0 and render.camera_angles().x < 45 then
            v105.view_angles.x = 89;
            v105.in_moveright = 1;
            v105.in_moveleft = 0;
            v105.in_forward = 0;
            v105.in_back = 1;
            if v105.sidemove == 0 then
                v105.view_angles.y = v105.view_angles.y + 90;
            end;
            if v105.sidemove < 0 then
                v105.view_angles.y = v105.view_angles.y + 150;
            end;
            if v105.sidemove > 0 then
                v105.view_angles.y = v105.view_angles.y + 30;
            end;
        end;
        if v105.forwardmove < 0 then
            v105.view_angles.x = 89;
            v105.in_moveleft = 1;
            v105.in_moveright = 0;
            v105.in_forward = 1;
            v105.in_back = 0;
            if v105.sidemove == 0 then
                v105.view_angles.y = v105.view_angles.y + 90;
            end;
            if v105.sidemove > 0 then
                v105.view_angles.y = v105.view_angles.y + 150;
            end;
            if v105.sidemove < 0 then
                v105.view_angles.y = v105.view_angles.y + 30;
            end;
        end;
    end;
end;
events.createmove:set(v107);
local _ = bit.lshift(1, 0);
local v109 = 9;
local function v113(v110, v111, v112)
    if v110 < v111 then
        return v111;
    elseif v112 < v110 then
        return v112;
    else
        return v110;
    end;
end;
local _ = ui.find("Miscellaneous", "Main", "Movement", "Air Strafe");
local v115 = ui.find("Miscellaneous", "Main", "Movement", "Air Strafe");
local v116 = ui.find("Miscellaneous", "Main", "Movement", "Strafe Assist");
local _ = vector();
local v118 = vector();
local v119 = vector();
local function v121(v120)
    -- upvalues: v109 (ref)
    return v120.weapon_type == v109;
end;
local function v149(v122, v123, v124)
    if math.abs(v122.x) > math.abs(v122.y) then
        local v125 = v122.y / v122.x;
        local v126 = 1 + v125 * v125;
        local v127 = -2 * v123.x - 2 * v125 * v123.y;
        local v128 = v123:length2dsqr() - v124 * v124;
        local v129 = v127 * v127 - 4 * v126 * v128;
        if v129 < 0 then
            return v123 + (v122 * v123:dot(v122) - v123):normalized() * v124;
        elseif v129 < 0.001 then
            local v130 = -v127 / (2 * v126);
            local v131 = v125 * v130;
            return vector(v130, v131);
        else
            local v132 = math.sqrt(v129);
            local v133 = (-v127 + v132) / (2 * v126);
            local v134 = v125 * v133;
            local v135 = vector(v133, v134);
            v133 = (-v127 - v132) / (2 * v126);
            v134 = v125 * v133;
            local v136 = vector(v133, v134);
            if v122:dot(v135) > v122:dot(v136) then
                return v135;
            else
                return v136;
            end;
        end;
    else
        local v137 = v122.x / v122.y;
        local v138 = 1 + v137 * v137;
        local v139 = -2 * v123.y - 2 * v137 * v123.x;
        local v140 = v123:length2dsqr() - v124 * v124;
        local v141 = v139 * v139 - 4 * v138 * v140;
        if v141 < 0 then
            return v123 + (v122 * v123:dot(v122) - v123):normalized() * v124;
        elseif v141 < 0.001 then
            local v142 = -v139 / (2 * v138);
            local v143 = v137 * v142;
            return vector(v143, v142);
        else
            local v144 = math.sqrt(v141);
            local v145 = (-v139 + v144) / (2 * v138);
            local v146 = v137 * v145;
            local v147 = vector(v146, v145);
            v145 = (-v139 - v144) / (2 * v138);
            v146 = v137 * v145;
            local v148 = vector(v146, v145);
            if v122:dot(v147) > v122:dot(v148) then
                return v147;
            else
                return v148;
            end;
        end;
    end;
end;
local function v157(v150, v151, v152, v153)
    -- upvalues: v113 (ref), v149 (ref)
    local v154 = v150:clone();
    v154.z = 0;
    v154:normalize();
    local v155 = v154:dot(v150) / v150:length();
    local v156 = v113(v152 * 0.9, 15, 750) * (v113(v153, 0, 1) * 0.7 + 0.3) * v155;
    return (v149(v154, v151 * 1.25, v156) - v151 * 1.25):angles().y;
end;
local function v168(v158, v159, v160, v161, v162)
    -- upvalues: v113 (ref)
    local v163 = v113(v161 * 0.9, 15, 750) * (v113(v162, 0, 1) * 0.7 + 0.3);
    local v164 = v160 * 1.25 + v158 * v163;
    local _ = vector(v160.x, v160.y, v159) * 1.25 + v158 * v163;
    local v166 = v164:angles();
    local v167 = v158:angles().x - v166.x;
    return v167 * (math.cos(math.rad(v167)) + 1) * 0.5;
end;
local function v178(v169)
    -- upvalues: v113 (ref), v168 (ref), v157 (ref)
    local v170 = entity.get_local_player();
    if v170 == nil then
        return;
    else
        local v171 = v170:get_player_weapon();
        if v171 == nil then
            return;
        else
            local v172 = v171:get_weapon_info();
            if v172 == nil then
                return;
            else
                local l_velocity_0 = v169.velocity;
                local v174 = v169.angles:clone();
                local v175 = v113(v171.m_flThrowStrength, 0, 1);
                v174.x = v174.x + v168(vector():angles(v174), v113(-l_velocity_0.z, -120, 120), l_velocity_0, v172.throw_velocity, v175);
                local v176 = vector():angles(v174);
                local v177 = v176 * (v113(v172.throw_velocity * 0.9, 15, 750) * (v175 * 0.7 + 0.3));
                if (l_velocity_0 * 1.25 + v177):dot(v176) > 0 then
                    v174.y = v157(v176, l_velocity_0, v172.throw_velocity, v175);
                end;
                v169.angles = v174;
                return;
            end;
        end;
    end;
end;
local function v189(v179, v180)
    -- upvalues: v121 (ref), v118 (ref), v119 (ref), v113 (ref), v168 (ref), v157 (ref)
    if render.camera_angles() ~= v179.view_angles:clone() then
        return;
    else
        local v181 = v180:get_player_weapon();
        if v181 == nil then
            return;
        else
            local v182 = v181:get_weapon_info();
            if v182 == nil or not v121(v182) then
                return;
            elseif v181.m_fThrowTime < globals.curtime - to_time(globals.clock_offset) then
                return;
            else
                local v183 = v179.view_angles:clone();
                local v184 = vector():angles(v183);
                local v185 = (v118 + v119) * 0.5;
                local v186 = v184 * (v113(v182.throw_velocity * 0.9, 15, 750) * (v181.m_flThrowStrength * 0.7 + 0.3));
                local v187 = v118 * 1.25 + v186;
                local v188 = (v186 + v185 * 1.25):normalized();
                if v187:dot(v184) > 0 then
                    v188 = v184;
                end;
                v179.view_angles.x = v179.view_angles.x + v168(vector():angles(v179.view_angles), 0, v185, v182.throw_velocity, v181.m_flThrowStrength);
                v179.view_angles.y = v157(v188, v119, v182.throw_velocity, v181.m_flThrowStrength);
                return;
            end;
        end;
    end;
end;
local function v190()
    -- upvalues: v115 (ref), v116 (ref)
    v115:override();
    v116:override();
end;
local function v198(v191)
    -- upvalues: v115 (ref), v116 (ref)
    local v192 = entity.get_local_player();
    if v192 == nil then
        return;
    else
        local v193 = v192:get_player_weapon();
        if v193 == nil then
            return;
        else
            local v194 = v193:get_weapon_info();
            if v194 == nil or v194.weapon_type ~= 9 then
                return;
            elseif v193.m_fThrowTime < globals.curtime - to_time(globals.clock_offset) then
                return;
            else
                local l_m_vecVelocity_0 = v192.m_vecVelocity;
                local v196 = math.rad(math.atan2(l_m_vecVelocity_0.y, l_m_vecVelocity_0.x));
                if v196 < 0 then
                    v196 = v196 + 360;
                end;
                v196 = v196 - math.floor(v196 / 360 + 0.5) * 360;
                local _ = math.normalize_yaw(v191.view_angles.y - v196);
                v115:override(false);
                v116:override(false);
                return;
            end;
        end;
    end;
end;
local function v202(v199)
    -- upvalues: v53 (ref), v118 (ref), v119 (ref), v189 (ref), v190 (ref), v198 (ref)
    if not v53.super_toss:get() then
        return;
    else
        local v200 = entity.get_local_player();
        if v200 == nil then
            return;
        else
            local v201 = v200:simulate_movement();
            v201:think(1);
            v118 = v201.velocity;
            v119 = v118;
            v189(v199, v200);
            v190();
            v198(v199);
            return;
        end;
    end;
end;
local function v204(v203)
    -- upvalues: v53 (ref), v178 (ref)
    if not v53.super_toss:get() then
        return;
    else
        v178(v203);
        return;
    end;
end;
events.createmove(v202);
events.grenade_override_view(v204);
local v205 = render.screen_size();
local v206 = render.load_font("Verdana", 12, "ad");
local v207 = false;
local v208 = 0;
local v209 = 0;
local v210 = 0;
local v211 = 0;
local v212 = 10;
local function v213()
    return entity.get_local_player() and globals.tickcount % 16 or 0;
end;
local function v218(v214)
    local v215 = {
        [1] = {
            0, 
            "failed", 
            color(105, 225, 222)
        }, 
        [2] = {
            4, 
            "bad", 
            color(255, 104, 104)
        }, 
        [3] = {
            6, 
            "ok", 
            color(255, 255, 255)
        }, 
        [4] = {
            9, 
            "good", 
            color(75, 255, 125)
        }, 
        [5] = {
            12, 
            "best", 
            color(121, 240, 194)
        }, 
        [6] = {
            16, 
            "ideal", 
            color(255, 255, 255, 255)
        }
    };
    for _, v217 in ipairs(v215) do
        if v214 <= v217[1] then
            return v217[2], v217[3];
        end;
    end;
end;
local function v221()
    -- upvalues: v208 (ref), v211 (ref), v212 (ref), v218 (ref), v209 (ref), v206 (ref), v205 (ref)
    if v208 < globals.realtime then
        v211 = math.max(0, v211 - v212);
    else
        v211 = math.min(255, v211 + v212);
    end;
    if v211 <= 0 then
        return;
    else
        local v219, v220 = v218(v209);
        render.text(v206, vector(v205.x / 2, 135), color(v220.r, v220.g, v220.b, v211), "c", v219);
        render.text(v206, vector(v205.x / 2, 147), color(255, 255, 255, math.floor(v211 * 0.5)), "c", string.format("%dt", v209));
        return;
    end;
end;
local function v226()
    -- upvalues: v55 (ref), v208 (ref), v207 (ref), v209 (ref), v210 (ref), v213 (ref)
    local v222 = entity.get_local_player();
    if not v222 or not v222:is_alive() then
        return;
    else
        local v223 = v222.m_vecAbsVelocity:length2d();
        if v223 < 25 or not v55.lc_ind:get() then
            v208 = 0;
            return;
        else
            local v224 = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"):get();
            if v207 and not v224 then
                local v225 = v213();
                v210 = math.floor(v223);
                v209 = v225;
                v208 = globals.realtime + 1;
            end;
            v207 = v224;
            return;
        end;
    end;
end;
events.render:set(function()
    -- upvalues: v226 (ref), v221 (ref)
    v226();
    v221();
end);
local function v228()
    -- upvalues: v55 (ref)
    local v227 = entity.get_local_player();
    if v227 == nil or not v227:is_alive() then
        return;
    elseif v55.keep_model_transparency:get() then
        return (not not v227.m_bIsScoped or v227.m_bResumeZoom) and 100 or 255;
    else
        return;
    end;
end;
events.localplayer_transparency:set(v228);
local function v232()
    -- upvalues: v53 (ref)
    if not v53.nade_fix:get() then
        return;
    else
        local v229 = entity.get_local_player();
        if v229 == nil or not v229:is_alive() then
            return;
        else
            rage.exploit:allow_defensive(true);
            local v230 = v229:get_player_weapon();
            if v230 == nil then
                return;
            else
                local v231 = v230:get_classname();
                if v231 and string.find(v231, "Grenade") then
                    rage.exploit:allow_defensive(false);
                end;
                return;
            end;
        end;
    end;
end;
events.createmove:set(v232);
local v233 = nil;
v233 = {};
local v234 = ffi.typeof("        struct {\n            float x, y, z;\n        }\n    ");
local v235 = ffi.typeof("        struct {\n            uint8_t r, g, b, a;\n        }\n    ");
local v236 = utils.get_vfunc("engine.dll", "VDebugOverlay004", 1, ffi.typeof("void(__thiscall*)(void *thisptr, const $ &origin, const $ &mins, const $ &maxs, const $ &angles, int r, int g, int b, int a, float duration)", v234, v234, v234, v234));
local v237 = utils.get_vfunc("engine.dll", "VDebugOverlay004", 20, ffi.typeof("void(__thiscall*)(void *thisptr, const $ &origin, const $ &dest, int r, int g, int b, int a, bool noDepthTest, float duration)", v234, v234));
local v238 = utils.get_vfunc("engine.dll", "VDebugOverlay004", 21, "void(__thiscall*)(void *thisptr, const $ &origin, const $ &mins, const $ &maxs, const $ &angles, $ *face_color, $ *edge_color, float duration)", v234, v234, v234, v234, v235, v235);
do
    local l_v234_0, l_v235_0, l_v236_0, l_v237_0, l_v238_0 = v234, v235, v236, v237, v238;
    v233.box = function(v244, v245, v246, v247, v248, v249, v250, v251, v252)
        -- upvalues: l_v234_0 (ref), l_v236_0 (ref)
        v244 = l_v234_0(v244:unpack());
        v245 = l_v234_0(v245:unpack());
        v246 = l_v234_0(v246:unpack());
        v247 = l_v234_0(v247:unpack());
        l_v236_0(v244, v245, v246, v247, v248, v249, v250, v251, v252);
    end;
    v233.line = function(v253, v254, v255, v256, v257)
        -- upvalues: l_v234_0 (ref), l_v237_0 (ref)
        v253 = l_v234_0(v253:unpack());
        v254 = l_v234_0(v254:unpack());
        l_v237_0(v253, v254, v255.r, v255.g, v255.b, v255.a, v256, v257);
    end;
    v233.box_new = function(v258, v259, v260, v261, v262, v263, v264)
        -- upvalues: l_v234_0 (ref), l_v235_0 (ref), l_v238_0 (ref)
        v258 = l_v234_0(v258:unpack());
        v259 = l_v234_0(v259:unpack());
        v260 = l_v234_0(v260:unpack());
        v261 = l_v234_0(v261:unpack());
        v262 = l_v235_0(v262:unpack());
        v263 = l_v235_0(v263:unpack());
        l_v238_0(v258, v259, v260, v261, v262, v263, v264);
    end;
end;
v234 = nil;
v235 = bit.lshift(1, 0);
v236 = 0;
v237 = 1;
v238 = 2;
local v265 = 3;
local v266 = 4;
local v267 = 5;
local v268 = 6;
local v269 = 7;
local v270 = 10;
local v271 = 0;
local v272 = 1;
local v273 = 2;
local v274 = 3;
local v275 = 4;
local v276 = 5;
local v277 = 6;
local v278 = 7;
local v279 = 8;
local v280 = 9;
local v281 = 10;
local v282 = 11;
local v283 = 12;
local v284 = 13;
local v285 = 14;
local v286 = 15;
local v287 = 16;
local v288 = 17;
local v289 = 18;
local v290 = {
    [v271] = v237, 
    [v276] = v238, 
    [v274] = v265, 
    [v279] = v268, 
    [v278] = v269, 
    [v283] = v268, 
    [v282] = v269, 
    [v288] = v266, 
    [v286] = v267
};
local v291 = nil;
local v292 = 0;
local v293 = nil;
do
    local l_v235_1, l_v236_1, l_v237_1, l_v265_0, l_v268_0, l_v269_0, l_v271_0, l_v274_0, l_v276_0, l_v278_0, l_v279_0, l_v280_0, l_v281_0, l_v286_0, l_v288_0, l_v290_0, l_v291_0, l_v292_0, l_v293_0 = v235, v236, v237, v265, v268, v269, v271, v274, v276, v278, v279, v280, v281, v286, v288, v290, v291, v292, v293;
    local function v313()
        -- upvalues: l_v291_0 (ref), l_v292_0 (ref)
        l_v291_0 = nil;
        l_v292_0 = 0;
    end;
    local function v314()
        ui.find("Aimbot", "Ragebot", "Main", "Double Tap"):override();
        ui.find("Aimbot", "Ragebot", "Main", "Peek Assist", "Retreat Mode"):override();
    end;
    local function v316()
        -- upvalues: v54 (ref)
        local _ = v54.hitchance:get();
        ui.find("Aimbot", "Ragebot", "Main", "Peek Assist", "Retreat Mode"):override("On Shot");
    end;
    local function v318(v317)
        -- upvalues: l_v237_1 (ref), l_v265_0 (ref), l_v268_0 (ref), l_v269_0 (ref)
        if v317 == l_v237_1 then
            return 4;
        elseif v317 == l_v265_0 then
            return 1.25;
        elseif v317 == l_v268_0 then
            return 0.75;
        elseif v317 == l_v269_0 then
            return 0.75;
        else
            return 1;
        end;
    end;
    local function v323(v319, v320, v321, v322)
        -- upvalues: v318 (ref), l_v237_1 (ref)
        v320 = v320 * v318(v321);
        if v319.m_ArmorValue > 0 then
            if v321 == l_v237_1 then
                if v319.m_bHasHelmet then
                    v320 = v320 * (v322 * 0.5);
                end;
            else
                v320 = v320 * (v322 * 0.5);
            end;
        end;
        return v320;
    end;
    local function v335(v324, v325, v326, v327, v328)
        -- upvalues: v323 (ref)
        local v329 = v325 - v324;
        local l_damage_0 = v328.damage;
        local l_armor_ratio_0 = v328.armor_ratio;
        local l_range_0 = v328.range;
        local l_range_modifier_0 = v328.range_modifier;
        local v334 = math.min(l_range_0, v329:length());
        l_damage_0 = l_damage_0 * math.pow(l_range_modifier_0, v334 * 0.002);
        return (v323(v326, l_damage_0, v327, l_armor_ratio_0));
    end;
    local function v336()
        -- upvalues: v54 (ref)
        return v54.simulation:get() * 0.01;
    end;
    local function v337()
        -- upvalues: v54 (ref)
        return v54.rate_limit:get() * 0.01;
    end;
    local function v338()
        return ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"):get();
    end;
    local function v341(v339)
        -- upvalues: l_v235_1 (ref)
        if v339 == nil then
            return;
        else
            local v340 = v339:get_origin();
            if bit.band(v339.m_fFlags, l_v235_1) == 0 then
                return utils.trace_line(v340, v340 - vector(0, 0, 8192), v339, 33636363).end_pos;
            else
                return v340;
            end;
        end;
    end;
    local function v343()
        -- upvalues: v54 (ref), l_v271_0 (ref), l_v276_0 (ref), l_v274_0 (ref), l_v288_0 (ref), l_v286_0 (ref), l_v279_0 (ref), l_v278_0 (ref), l_v281_0 (ref), l_v280_0 (ref)
        local v342 = {};
        if v54.hitboxes:get("Head") then
            table.insert(v342, l_v271_0);
        end;
        if v54.hitboxes:get("Chest") then
            table.insert(v342, l_v276_0);
        end;
        if v54.hitboxes:get("Stomach") then
            table.insert(v342, l_v274_0);
        end;
        if v54.hitboxes:get("Arms") then
            table.insert(v342, l_v288_0);
            table.insert(v342, l_v286_0);
        end;
        if v54.hitboxes:get("Legs") then
            table.insert(v342, l_v279_0);
            table.insert(v342, l_v278_0);
            table.insert(v342, l_v281_0);
            table.insert(v342, l_v280_0);
        end;
        return v342;
    end;
    local function v345(v344)
        -- upvalues: l_v290_0 (ref), l_v236_1 (ref)
        return l_v290_0[v344] or l_v236_1;
    end;
    local function v347(v346)
        return v346[0];
    end;
    local function v352(v348, v349)
        local _ = v348:get_weapon_index();
        local l_weapon_type_0 = v349.weapon_type;
        if l_weapon_type_0 == 1 then
            return "Pistols";
        elseif l_weapon_type_0 == 5 then
            return "Snipers";
        else
            return nil;
        end;
    end;
    local function v369(v353, v354, v355, v356, v357)
        -- upvalues: v345 (ref), v335 (ref)
        local v358 = {};
        local v359 = v354:get_eye_position();
        local v360 = v355:get_weapon_info();
        local l_m_iHealth_0 = v356.m_iHealth;
        for v362 = 1, #v353 do
            local v363 = v353[v362];
            local v364 = v345(v363);
            local v365 = v356:get_hitbox_position(v363);
            local v366 = v335(v359, v365, v356, v364, v360);
            local v367 = v366 < v357;
            local v368 = v366 < l_m_iHealth_0;
            if not v367 or not v368 then
                table.insert(v358, {
                    index = v362, 
                    pos = v365
                });
            end;
        end;
        return v358;
    end;
    local function v373(v370)
        -- upvalues: v347 (ref)
        if v370 == nil then
            return false;
        else
            local l_status_0, l_result_0 = pcall(v347, v370);
            if not l_status_0 or l_result_0 == nil then
                return false;
            else
                return true;
            end;
        end;
    end;
    local function v375(v374)
        -- upvalues: v373 (ref)
        return v373(v374.target);
    end;
    local function v377(v376)
        return not v376.in_forward and not v376.in_back and not v376.in_moveleft and not v376.in_moveright;
    end;
    local function v379(v378)
        -- upvalues: v54 (ref)
        return v54.weapons:get(v378);
    end;
    local function v383(v380, v381, v382)
        if v380 == nil or v381 == nil then
            return false;
        elseif v382.max_clip1 == 0 or v381.m_iClip1 == 0 then
            return false;
        elseif globals.curtime < v380.m_flNextAttack then
            return false;
        elseif globals.curtime < v381.m_flNextPrimaryAttack then
            return false;
        else
            return true;
        end;
    end;
    local function v384()
        if not ui.find("Aimbot", "Ragebot", "Main", "Double Tap"):get() then
            return false;
        else
            return true;
        end;
    end;
    local function v387(v385, v386)
        return {
            ctx = v385, 
            target = v386, 
            simtime = 0, 
            retreat = -1
        };
    end;
    local function v389(v388)
        return v388:simulate_movement(nil, vector(), 1);
    end;
    local function v396(v390, v391, v392)
        local v394, v395 = utils.trace_bullet(v390, v391, v392, function(v393)
            -- upvalues: v390 (ref)
            return v393 ~= v390 and v393:is_enemy();
        end);
        return v394, v395;
    end;
    local function v410(v397, v398, v399, v400, v401)
        -- upvalues: v396 (ref)
        local l_m_iHealth_1 = v399.m_iHealth;
        local v403 = v397.origin + vector(0, 0, v397.view_offset);
        for v404 = 1, #v400 do
            local v405 = v400[v404];
            local v406, _ = v396(v398, v403, v405.pos);
            local v408 = v401 <= v406;
            local v409 = l_m_iHealth_1 <= v406;
            if v408 or v409 then
                return v397, true;
            end;
        end;
        return v397, false;
    end;
    local function v413(v411)
        -- upvalues: l_v293_0 (ref), v341 (ref)
        local v412 = entity.get_local_player();
        if not v412 or v412 == nil then
            return;
        else
            if not v411 or v411 == nil then
                v411 = v412;
            end;
            if l_v293_0 == nil then
                l_v293_0 = v341(v411);
            end;
            return;
        end;
    end;
    local function v423(v414, v415, v416, v417, v418, v419, v420)
        -- upvalues: l_v235_1 (ref), v410 (ref)
        v414.view_angles.y = v418;
        v417:think(1);
        if bit.band(v417.flags, l_v235_1) == 0 then
            return nil, false;
        else
            local _, v422 = v410(v417, v415, v416, v419, v420);
            if v422 then
                v417:think(1);
            end;
            return v417, v422;
        end;
    end;
    local function v458(v424, v425, v426)
        -- upvalues: v384 (ref), v337 (ref), v338 (ref), v343 (ref), l_v291_0 (ref), v375 (ref), v369 (ref), v410 (ref), l_v292_0 (ref), v377 (ref), l_v235_1 (ref), v389 (ref), v423 (ref), v387 (ref)
        if not v384() then
            return false;
        else
            local l_frametime_0 = globals.frametime;
            local v428 = v337();
            local v429 = v338();
            local v430 = v343();
            if l_v291_0 ~= nil and v375(l_v291_0) then
                local l_ctx_0 = l_v291_0.ctx;
                local l_target_0 = l_v291_0.target;
                local l_m_iHealth_2 = l_target_0.m_iHealth;
                if v429 >= 100 then
                    v429 = v429 + l_m_iHealth_2 - 100;
                end;
                local v434 = v369(v430, v425, v426, l_target_0, v429);
                local _, v436 = v410(l_ctx_0, v425, l_target_0, v434, v429);
                if v436 then
                    l_v291_0.simtime = 0;
                end;
                l_v291_0.simtime = l_v291_0.simtime + l_frametime_0;
                return true;
            else
                if v428 > 0 then
                    if l_v292_0 > 0 then
                        l_v292_0 = l_v292_0 - l_frametime_0;
                        return false;
                    else
                        l_v292_0 = v428;
                    end;
                end;
                if not v377(v424) then
                    return false;
                else
                    local l_m_fFlags_1 = v425.m_fFlags;
                    if bit.band(l_m_fFlags_1, l_v235_1) == 0 then
                        return false;
                    elseif v425.m_vecVelocity:length2dsqr() > 6400 then
                        return false;
                    else
                        local v438 = entity.get_threat();
                        if v438 == nil or v438:is_dormant() then
                            return false;
                        else
                            local l_m_iHealth_3 = v438.m_iHealth;
                            if v429 >= 100 then
                                v429 = v429 + l_m_iHealth_3 - 100;
                            end;
                            local v440 = v369(v430, v425, v426, v438, v429);
                            local v441 = nil;
                            local v442 = nil;
                            local v443 = v425:get_origin();
                            local v444 = (v438:get_origin() - v443):angles().y + 180;
                            v441 = v444 - 90;
                            v442 = v444 + 90;
                            v443 = v424.view_angles:clone();
                            local l_forwardmove_0 = v424.forwardmove;
                            local l_sidemove_0 = v424.sidemove;
                            local l_in_duck_0 = v424.in_duck;
                            v444 = v424.in_jump;
                            local l_in_speed_0 = v424.in_speed;
                            v424.forwardmove = 450;
                            v424.sidemove = 0;
                            v424.in_duck = false;
                            v424.in_jump = false;
                            v424.in_speed = false;
                            local v449 = v389(v425);
                            local v450 = v389(v425);
                            local v451 = 0;
                            local v452 = 0;
                            for v453 = 1, 20 do
                                if v451 ~= -1 then
                                    v451 = v453;
                                    local v454, v455 = v423(v424, v425, v438, v449, v441, v440, v429);
                                    if v454 == nil then
                                        v451 = -1;
                                    end;
                                    if v455 then
                                        l_v291_0 = v387(v454, v438);
                                        break;
                                    end;
                                end;
                                if v452 ~= -1 then
                                    v452 = v453;
                                    local v456, v457 = v423(v424, v425, v438, v450, v442, v440, v429);
                                    if v456 == nil then
                                        v452 = -1;
                                    end;
                                    if v457 then
                                        l_v291_0 = v387(v456, v438);
                                        break;
                                    end;
                                end;
                            end;
                            v424.view_angles.y = v443.y;
                            v424.forwardmove = l_forwardmove_0;
                            v424.sidemove = l_sidemove_0;
                            v424.in_duck = l_in_duck_0;
                            v424.in_jump = v444;
                            v424.in_speed = l_in_speed_0;
                            return l_v291_0 ~= nil;
                        end;
                    end;
                end;
            end;
        end;
    end;
    local function v466(v459, v460, v461)
        local v462 = v461 - v460:get_origin();
        local v463 = v462:length2dsqr();
        if v463 < 25 then
            local l_m_vecVelocity_1 = v460.m_vecVelocity;
            local v465 = l_m_vecVelocity_1:length();
            v459.move_yaw = l_m_vecVelocity_1:angles().y;
            v459.forwardmove = -v465;
            v459.sidemove = 0;
            return true, v463;
        else
            v459.move_yaw = v462:angles().y;
            v459.forwardmove = 450;
            v459.sidemove = 0;
            return false, v463;
        end;
    end;
    local function v468(v467)
        v467.in_duck = false;
        v467.in_jump = false;
        v467.in_speed = false;
        v467.in_forward = true;
        v467.in_back = false;
        v467.in_moveleft = false;
        v467.in_moveright = false;
    end;
    local function v480(v469, v470, v471, v472)
        -- upvalues: v413 (ref), v383 (ref), v458 (ref), l_v291_0 (ref), v336 (ref), v466 (ref), v468 (ref), v316 (ref), v233 (ref), v54 (ref), l_v293_0 (ref), v313 (ref), v314 (ref)
        v413(v470);
        local v473 = v383(v470, v471, v472);
        local v474 = v458(v469, v470, v471);
        if l_v291_0 == nil then
            return;
        else
            if v336() < l_v291_0.simtime then
                v474 = false;
            end;
            if v472.weapon_type == 5 and not v470.m_bIsScoped then
                v474 = false;
            end;
            if l_v291_0.retreat <= 0 and v473 and v474 then
                local l_ctx_1 = l_v291_0.ctx;
                local v476, _ = v466(v469, v470, l_ctx_1.origin);
                v468(v469);
                v316();
                l_v291_0.retreat = 0;
                if v476 then
                    l_v291_0.retreat = 1;
                end;
                v233.box_new(l_ctx_1.origin, l_ctx_1.obb_mins, l_ctx_1.obb_maxs, vector(), color(0, 0, 0, 0), v54.color:get(), globals.tickinterval * 2);
                return;
            elseif l_v291_0.retreat == -1 then
                return;
            else
                local v478, _ = v466(v469, v470, l_v293_0);
                v468(v469);
                l_v291_0.retreat = l_v291_0.retreat + 1;
                if l_v291_0.retreat >= 3 then
                    ui.find("Aimbot", "Ragebot", "Main", "Double Tap"):override(false);
                end;
                if v473 and v478 then
                    v313();
                    v314();
                end;
                return;
            end;
        end;
    end;
    local function v486(v481)
        -- upvalues: v352 (ref), v379 (ref), v480 (ref)
        local v482 = entity.get_local_player();
        if v482 == nil then
            return;
        else
            local v483 = v482:get_player_weapon();
            if v483 == nil then
                return;
            else
                local v484 = v483:get_weapon_info();
                if v484 == nil then
                    return;
                else
                    local v485 = v352(v483, v484);
                    if not v379(v485) then
                        return;
                    else
                        v480(v481, v482, v483, v484);
                        return;
                    end;
                end;
            end;
        end;
    end;
    local function v487()
        -- upvalues: l_v291_0 (ref)
        if l_v291_0 == nil then
            return nil;
        else
            l_v291_0.retreat = 1;
            return;
        end;
    end;
    v54.enabled:set_callback(function()
        -- upvalues: v54 (ref), v313 (ref), v314 (ref), l_v293_0 (ref), v413 (ref), v487 (ref), v486 (ref)
        local v488 = v54.enabled:get();
        if not v488 then
            v313();
            v314();
            l_v293_0 = nil;
        end;
        if v488 then
            l_v293_0 = v413();
        end;
        events.aim_fire(v487, v488);
        events.createmove(v486, v488);
    end, true);
end;
v235 = function()
    -- upvalues: v53 (ref)
    if not v53.fake_lag_addon:get() then
        ui.find("Aimbot", "Anti Aim", "Fake Lag", "Variability"):override();
        return;
    else
        local v489 = 10 + 2 * math.random(0, 12.5);
        ui.find("Aimbot", "Anti Aim", "Fake Lag", "Variability"):override(v489);
        return;
    end;
end;
events.createmove:set(v235);
v236 = function()
    -- upvalues: v53 (ref)
    if not v53.warmup_aa:get() then
        return;
    else
        if entity.get_game_rules().m_bWarmupPeriod == true then
            ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"):override(math.normalize_yaw(globals.curtime * -250));
            ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"):override(math.random(1, 2) == 1 and "Fake Up" or "Fake Down");
        end;
        return;
    end;
end;
events.createmove:set(v236);
v237 = 0;
v238 = function()
    -- upvalues: v55 (ref), v237 (ref), v8 (ref)
    local v490 = ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay");
    if not v55.custom_scope:get() then
        v490:set("Remove overlay");
        return;
    else
        local v491 = entity.get_local_player();
        if not v491 or not v491:is_alive() or common.is_button_down(9) then
            return;
        else
            local v492 = render.screen_size();
            local l_m_bIsScoped_0 = v491.m_bIsScoped;
            local l_frametime_1 = globals.frametime;
            local v495 = v55.custom_scope_color:get();
            local v496 = v55.custom_scope_gap:get();
            local v497 = v55.custom_scope_size:get();
            v490:set("Remove All");
            v237 = v8(v237, l_m_bIsScoped_0 and 1 or 0, 12 * l_frametime_1);
            if not l_m_bIsScoped_0 and v237 < 0.05 then
                return;
            else
                local v498 = v492.x / 2;
                local v499 = v492.y / 2;
                local v500 = v496 * v237;
                local v501 = v497 * v237;
                if not v55.t_style:get() then
                    render.gradient(vector(v498 - v500, v499), vector(v498 - v500 - v501, v499 + 1), v495, color(255, 255, 255, 0), v495, color(255, 255, 255, 0));
                    render.gradient(vector(v498 + v500 + 1, v499), vector(v498 + v500 + v501, v499 + 1), v495, color(255, 255, 255, 0), v495, color(255, 255, 255, 0));
                    render.gradient(vector(v498, v499 + v500), vector(v498 + 1, v499 + v500 + v501), v495, v495, color(255, 255, 255, 0), color(255, 255, 255, 0));
                    render.gradient(vector(v498, v499 - v500), vector(v498 + 1, v499 - v500 - v501), v495, v495, color(255, 255, 255, 0), color(255, 255, 255, 0));
                end;
                if v55.t_style:get() then
                    render.gradient(vector(v498 - v500, v499), vector(v498 - v500 - v501, v499 + 1), v495, color(255, 255, 255, 0), v495, color(255, 255, 255, 0));
                    render.gradient(vector(v498 + v500 + 1, v499), vector(v498 + v500 + v501, v499 + 1), v495, color(255, 255, 255, 0), v495, color(255, 255, 255, 0));
                    render.gradient(vector(v498, v499 + v500), vector(v498 + 1, v499 + v500 + v501), v495, v495, color(255, 255, 255, 0), color(255, 255, 255, 0));
                end;
                return;
            end;
        end;
    end;
end;
events.render:set(v238);
events.post_update_clientside_animation:set(function()
    -- upvalues: v61 (ref), v59 (ref), v63 (ref), v73 (ref), v11 (ref)
    local v502 = entity.get_local_player();
    if not v502 or not v502:is_alive() then
        return;
    else
        local v503 = v502:get_anim_state();
        if not v503 then
            return;
        else
            local v504 = math.sqrt(v502.m_vecVelocity.x ^ 2 + v502.m_vecVelocity.y ^ 2) > 5;
            local v505 = bit.band(v502.m_fFlags, 1) == 0;
            local v506 = v61:get();
            if v506 == 1 then
                v502.m_flPoseParameter[6] = 1;
                ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"):override("Sliding");
            elseif v506 == 2 then
                v502.m_flPoseParameter[6] = globals.tickcount % 2 == 0 and utils.random_float(0.1, 1) or utils.random_float(0.1, 1);
            end;
            local v507 = v59:get();
            if v507 == 1 then
                v502.m_flPoseParameter[0] = 1;
                ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"):override("Sliding");
            elseif v507 == 2 then
                v502.m_flPoseParameter[0] = globals.tickcount % 2 == 0 and utils.random_float(0.1, 1) or utils.random_float(0.1, 1);
            elseif v507 == 3 and v504 and not v505 then
                v502.m_flPoseParameter[7] = 1;
                ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"):override("Walking");
            end;
            if v63:get("Pitch 0 On Land") and v503.landing and not v73 then
                v502.m_flPoseParameter[12] = 0.5;
            elseif v63:get("Move Lean") and v504 then
                ffi.cast("animstate_layer_t**", ffi.cast("uintptr_t", v11(v502:get_index())) + 10640)[0][12].m_flWeight = 1;
            elseif v63:get("Earth Quake") then
                ffi.cast("animstate_layer_t**", ffi.cast("uintptr_t", v11(v502:get_index())) + 10640)[0][12].m_flWeight = utils.random_float(0.1, 1);
            elseif v63:get("Kangaroo") then
                v502.m_flPoseParameter[3] = math.random(0, 10) / 10;
                v502.m_flPoseParameter[6] = math.random(0, 10) / 10;
                v502.m_flPoseParameter[7] = math.random(0, 10) / 10;
            end;
            return;
        end;
    end;
end);
v265 = function(v508)
    -- upvalues: v53 (ref), v82 (ref)
    local v509 = entity.get_local_player();
    if not v509 or not v509:is_alive() then
        return;
    else
        local v510 = v509:get_player_weapon();
        if not v510 then
            return;
        else
            local v511 = v510:get_classname();
            local v512 = v511 == "CKnife" or v511:lower():find("knife");
            local v513 = v511 == "CWeaponTaser";
            if (v512 and v53.safehead:get() or v513 and v53.safehead:get()) and v82(v508) == "Air Duck" then
                ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"):override("Down");
                ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"):override("Backward");
                ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"):override(0);
                ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden"):override(false);
                ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"):override("On Peek");
                ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"):override(false);
                ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"):override(0);
                if v53.espam:get() then
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
events.createmove:set(v265);
_fov = nil;
v266 = function(v514)
    -- upvalues: v55 (ref), l_smoothy_0 (ref)
    if not v55.smooth_fov:get() then
        return;
    else
        if _fov == nil then
            _fov = l_smoothy_0.new(v514.fov);
        end;
        v514.fov = _fov:update(0.13, v514.fov);
        return;
    end;
end;
events.override_view:set(v266);
jump_stop = function(v515)
    -- upvalues: v66 (ref)
    local v516 = entity.get_local_player();
    if not v66.air_stop:get() then
        return;
    elseif not v516 then
        return;
    else
        if v516.m_vecAbsVelocity:length2d() < 2 then
            v515.in_speed = 1;
        end;
        return;
    end;
end;
events.createmove(jump_stop);
edge_stop = function(v517)
    -- upvalues: v66 (ref)
    if v66.edge_stop:get() then
        local v518 = entity.get_local_player();
        if v518 then
            if v518.m_MoveType == 9 or v518.m_MoveType == 8 or v517.in_jump then
                return;
            else
                local v519 = v518:simulate_movement();
                v519:think(5);
                if v519.velocity.z ~= 0 then
                    v517.block_movement = 2;
                end;
            end;
        end;
    end;
end;
events.createmove(edge_stop);
v267 = render.load_font("Tahoma", 21, "a");
v268 = render.load_font("Calibri", 24, "bad");
v269 = function(v520, v521)
    return math.sqrt((v520.x - v521.x) ^ 2 + (v520.y - v521.y) ^ 2 + (v520.z - v521.z) ^ 2);
end;
v270 = {
    [1] = {
        position_offset = 0, 
        bind_name = "Dormant Aimbot", 
        text_offset = 1, 
        text = "DA", 
        height = 0, 
        active = false, 
        icon = ui.get_icon("eye"), 
        color = color(255, 255, 255)
    }, 
    [2] = {
        position_offset = 0, 
        bind_name = "Hit Chance", 
        text = "HC", 
        height = 0, 
        active = false, 
        icon = ui.get_icon("crosshairs"), 
        color = color(116, 225, 100)
    }, 
    [3] = {
        position_offset = 0, 
        bind_name = "OSAA", 
        text_offset = 14, 
        text = "OSAA", 
        height = 0, 
        active = false, 
        icon = ui.get_icon("sliders-simple"), 
        color = color(255, 255, 255)
    }, 
    [4] = {
        position_offset = 0, 
        bind_name = "Double Tap", 
        text = "DT", 
        height = 0, 
        active = false, 
        icon = ui.get_icon("face-angry-horns"), 
        color = color(255, 255, 255)
    }, 
    [5] = {
        position_offset = 0, 
        bind_name = "Min. Damage", 
        text = "MD", 
        height = 0, 
        active = false, 
        icon = ui.get_icon("location-crosshairs"), 
        color = color(255, 255, 255)
    }, 
    [6] = {
        position_offset = 0, 
        bind_name = "Ping", 
        text_offset = 34, 
        text = "LATENCY", 
        height = 0, 
        active = false, 
        icon = ui.get_icon("signal"), 
        color = color(125, 205, 125)
    }, 
    [7] = {
        position_offset = 0, 
        bind_name = "FS", 
        text_offset = -1, 
        text = "FS", 
        height = 0, 
        active = false, 
        icon = ui.get_icon("person"), 
        color = color(255, 255, 255)
    }, 
    [8] = {
        position_offset = 0, 
        bind_name = "Body Aim", 
        text_offset = 9, 
        text = "BODY", 
        height = 0, 
        active = false, 
        icon = ui.get_icon("user-shield"), 
        color = color(255, 255, 255)
    }, 
    [9] = {
        bind_name = "Bomb", 
        tick_timer = 0, 
        text = "", 
        active = false, 
        position_offset = 0, 
        text_offset = 73, 
        height = 0, 
        icon = ui.get_icon("bomb"), 
        color = color(255, 255, 255)
    }, 
    [10] = {
        position_offset = 0, 
        bind_name = "DUCK", 
        text_offset = 15, 
        text = "DUCK", 
        height = 0, 
        active = false, 
        icon = ui.get_icon("wheelchair-move"), 
        color = color(255, 255, 255)
    }
};
v271 = function(v522, v523, v524)
    return color(math.floor(v522.r + (v523.r - v522.r) * v524), math.floor(v522.g + (v523.g - v522.g) * v524), math.floor(v522.b + (v523.b - v522.b) * v524), math.floor(v522.a + (v523.a - v522.a) * v524));
end;
v272 = function(v525)
    local v526 = 450.7;
    local v527 = (v525 - 75.68) / 789.2;
    return v526 * math.exp(-v527 * v527);
end;
v273 = function(v528, v529, v530, v531, v532, v533, v534, v535)
    -- upvalues: v267 (ref), v268 (ref)
    local v536 = v528 and render.measure_text(v267, nil, v528) or vector(0, 0);
    local v537 = render.measure_text(v268, nil, v529);
    local v538 = 8;
    local v539 = v536.x + v537.x + v538 * 4;
    local v540 = math.max(v536.y, v537.y) + v538 * 2;
    local v541 = vector(v532, v533);
    local v542 = vector(v532 + v539, v533 + v540);
    render.push_clip_rect(v541, vector(v542.x, v541.y + v534));
    render.gradient(vector(v541.x, v541.y), vector(v541.x + (v542.x - v541.x) / 2, v542.y), color(0, 0, 0, 0), color(0, 0, 0, 90), color(0, 0, 0, 0), color(0, 0, 0, 90));
    render.gradient(vector(v541.x + (v542.x - v541.x) / 2, v541.y), vector(v542.x, v542.y), color(0, 0, 0, 90), color(0, 0, 0, 0), color(0, 0, 0, 90), color(0, 0, 0, 0));
    local v543 = v541.x + v538 + 13;
    local v544 = v541.y + (v540 - v536.y) / 2 + 8.78;
    local v545 = v543 + v536.x + v538 + 3 + (v535 or 0);
    local v546 = v541.y + (v540 - v537.y) / 2 + 12.3;
    if v528 then
        render.text(v267, vector(v543, v544), v531 and v530 or color(255, 255, 255), "c", v528);
    end;
    render.text(v268, vector(v545, v546), v530, "c", v529);
    render.pop_clip_rect();
end;
v274 = function()
    -- upvalues: v55 (ref), v270 (ref), v66 (ref), v271 (ref), v269 (ref), v272 (ref), v8 (ref), v273 (ref)
    if not globals.is_connected or not entity.get_local_player() or not entity.get_local_player():is_alive() or not v55.left_side_indicator:get() then
        return;
    else
        local v547 = v55.animate_indicators:get();
        local v548 = ui.get_binds();
        local v549 = render.screen_size();
        local v550 = 10;
        local v551 = v549.y - 450;
        local v552 = 1;
        local v553 = {};
        local v554 = 0;
        local v555 = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"):get();
        local v556 = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"):get();
        local v557 = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"):get();
        local v558 = rage.exploit:get();
        for _, v560 in ipairs(v270) do
            local v561 = false;
            if v560.bind_name == "OSAA" then
                v561 = v555 and not v556 and not v557;
            elseif v560.bind_name == "FS" then
                v561 = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"):get();
            elseif v560.bind_name == "Ping" then
                v561 = v66.ping:get() > 0;
            elseif v560.bind_name == "Dormant Aimbot" then
                v561 = ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot"):get();
            elseif v560.bind_name == "DUCK" then
                v561 = v557;
            elseif v560.bind_name == "Double Tap" then
                v561 = v556 and not v557;
                v560.color = v271(color(255, 0, 0), color(255, 255, 255), v558);
            elseif v560.bind_name == "Bomb" then
                local v562 = entity.get_entities("CPlantedC4")[1];
                if v562 then
                    local v563 = math.max(v562.m_flC4Blow - globals.curtime, 0);
                    if v563 <= 0 then
                        v561 = false;
                    else
                        local v564 = v562.m_nBombSite == 0 and "A" or "B";
                        local v565 = entity.get_local_player();
                        local l_m_vecOrigin_0 = v562.m_vecOrigin;
                        local l_m_vecOrigin_1 = v565.m_vecOrigin;
                        local v568 = v269(l_m_vecOrigin_0, l_m_vecOrigin_1);
                        local v569 = v272(v568);
                        if v565.m_ArmorValue > 0 then
                            local v570 = v569 * 0.5;
                            if (v569 - v570) * 0.5 > v565.m_ArmorValue then
                                v570 = v569 - v565.m_ArmorValue * 2;
                            end;
                            v569 = v570;
                        end;
                        v569 = math.floor(v569);
                        if v565.m_iHealth < v569 then
                            damageo = "FATAL";
                        else
                            damageo = tostring(v569) .. " HP";
                        end;
                        if v569 and damageo and v564 and l_m_vecOrigin_0 then
                            v560.text = v564 .. " - " .. string.format("%.1f", v563) .. "s (" .. damageo .. ")";
                            v560.tick_timer = (v560.tick_timer + globals.frametime) % 3;
                            v560.color = v271(color(255, 255, 255), color(255, 0, 0), math.sin(v560.tick_timer * math.pi / 3));
                            v561 = true;
                        end;
                    end;
                end;
            else
                for _, v572 in ipairs(v548) do
                    if v572.name == v560.bind_name and v572.active then
                        v561 = true;
                        break;
                    end;
                end;
            end;
            if v561 then
                v560.active = true;
                if v547 then
                    v560.height = v8(v560.height, 45, globals.frametime * 8);
                    v560.position_offset = v8(v560.position_offset, v554, globals.frametime * 8);
                else
                    v560.height = 45;
                    v560.position_offset = v554;
                end;
                v554 = v554 + v560.height + v552;
            else
                if v547 then
                    v560.height = v8(v560.height, 0, globals.frametime * 8);
                else
                    v560.height = 0;
                end;
                if v560.height < 1 then
                    v560.active = false;
                end;
            end;
            if v560.active or v560.height > 1 then
                table.insert(v553, v560);
            end;
        end;
        for _, v574 in ipairs(v553) do
            v273(v574.icon, v574.text, v574.color, true, v550, v551 + v574.position_offset, v574.height, v574.text_offset);
        end;
        return;
    end;
end;
events.render:set(v274);
v275 = function()
    -- upvalues: v55 (ref), v13 (ref), v20 (ref)
    if not v55.viewmodel:get() then
        cvar.viewmodel_fov:float(v13(cvar.viewmodel_fov), true);
        cvar.viewmodel_offset_x:float(v13(cvar.viewmodel_offset_x), true);
        cvar.viewmodel_offset_y:float(v13(cvar.viewmodel_offset_y), true);
        cvar.viewmodel_offset_z:float(v13(cvar.viewmodel_offset_z), true);
        return;
    else
        local v575 = v20("viewmodel_fov", fov:get() / 10, nil, v13(cvar.viewmodel_fov));
        local v576 = v20("viewmodel_x", x_view:get() / 10, nil, v13(cvar.viewmodel_offset_x));
        local v577 = v20("viewmodel_y", y_view:get() / 10, nil, v13(cvar.viewmodel_offset_y));
        local v578 = v20("viewmodel_z", z_view:get() / 10, nil, v13(cvar.viewmodel_offset_z));
        cvar.viewmodel_fov:float(v575, true);
        cvar.viewmodel_offset_x:float(v576, true);
        cvar.viewmodel_offset_y:float(v577, true);
        cvar.viewmodel_offset_z:float(v578, true);
        return;
    end;
end;
events.render:set(v275);
v276 = function()
    -- upvalues: v13 (ref)
    cvar.viewmodel_fov:float(v13(cvar.viewmodel_fov), true);
    cvar.viewmodel_offset_x:float(v13(cvar.viewmodel_offset_x), true);
    cvar.viewmodel_offset_y:float(v13(cvar.viewmodel_offset_y), true);
    cvar.viewmodel_offset_z:float(v13(cvar.viewmodel_offset_z), true);
    cvar.r_aspectratio:float(0);
end;
events.shutdown(v276);
v277 = function()
    -- upvalues: v20 (ref)
    if entity.get_local_player() == nil then
        return;
    else
        if aspect:get() == 59 then
            cvar.r_aspectratio:float(0);
        else
            local v579 = aspect:get() / 100;
            local v580 = v20("aspect_ratio", v579, 0.095);
            cvar.r_aspectratio:float(v580);
        end;
        return;
    end;
end;
events.render:set(v277);
v278 = render.load_font("Verdana", 12, "a");
v279 = "Equa";
v280 = "\a{Link Active}lity";
v281 = 0;
v282 = 0;
v283 = 0;
v284 = 0;
v285 = function(v581)
    if v581 >= 60 then
        return "\a{Link Active}";
    elseif v581 >= 30 then
        return color(255, 255, 0, 255);
    else
        return color(255, 0, 0, 255);
    end;
end;
v286 = function()
    -- upvalues: v55 (ref), v282 (ref), v281 (ref), v285 (ref), v278 (ref), v279 (ref), v280 (ref), v283 (ref), v284 (ref), v8 (ref)
    local v582 = v55.watermark_nick_selector:get() == "NL" and common.get_username() or v55.watermark_nickname:get();
    local _ = entity.get_local_player();
    if not globals.is_connected or not v55.watermark:get() then
        return;
    else
        local l_realtime_0 = globals.realtime;
        if l_realtime_0 - v282 >= 0.5 then
            v281 = math.floor(1 / globals.frametime);
            v282 = l_realtime_0;
        end;
        local v585 = " FPS";
        local v586 = tostring(v281);
        local v587 = v285(v281);
        local l_v582_0 = v582;
        local v589 = render.screen_size();
        local v590 = 22;
        local v591 = render.measure_text(v278, nil, v279);
        local v592 = render.measure_text(v278, nil, v280);
        local v593 = render.measure_text(v278, nil, l_v582_0);
        local v594 = render.measure_text(v278, nil, v586);
        local v595 = render.measure_text(v278, nil, v585);
        v283 = v591.x + v592.x + v593.x + v594.x + v595.x + 20;
        v284 = v8(v284, v283, 0.1);
        local v596 = vector(v589.x - v284 - 10, 10);
        local v597 = vector(v589.x - 10, 10 + v590);
        render.gradient(vector(v596.x, v596.y), vector(v596.x + (v597.x - v596.x) / 2, v597.y), color(0, 0, 0, 10), color(0, 0, 0, 90), color(0, 0, 0, 10), color(0, 0, 0, 90));
        render.gradient(vector(v596.x + (v597.x - v596.x) / 2, v596.y), v597, color(0, 0, 0, 90), color(0, 0, 0, 10), color(0, 0, 0, 90), color(0, 0, 0, 10));
        local v598 = v596.x + 6;
        local v599 = v596.y + (v590 - v591.y) / 2;
        render.text(v278, vector(v598, v599), color(255, 255, 255, 255), nil, v279 .. v280);
        local v600 = v598 + v591.x + v592.x + 5;
        render.text(v278, vector(v600, v599), color(255, 255, 255, 255), nil, l_v582_0);
        local v601 = v600 + v593.x + 5;
        if type(v587) == "string" then
            render.text(v278, vector(v601, v599), color(255, 255, 255, 255), nil, v587 .. v586);
        else
            render.text(v278, vector(v601, v599), v587, nil, v586);
        end;
        render.text(v278, vector(v601 + v594.x - 2, v599), color(255, 255, 255, 255), nil, v585);
        return;
    end;
end;
events.render:set(v286);
v287 = {
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
v288 = {};
v289 = 1;
events.aim_ack:set(function(v602)
    -- upvalues: v55 (ref), v287 (ref), v288 (ref), v21 (ref), v289 (ref)
    if not v55.logs:get() then
        return;
    else
        local _ = entity.get_local_player();
        local l_state_0 = v602.state;
        local v605 = entity.get(v602.target);
        if not v605 then
            return;
        else
            local l_m_iHealth_4 = v605.m_iHealth;
            local v607 = "";
            local v608 = v602.hitchance or "N/A";
            local v609 = v602.backtrack or "N/A";
            local v610 = v602.wanted_damage or "N/A";
            local v611 = v287[v602.wanted_hitgroup] or "unknown";
            if l_state_0 ~= nil then
                v607 = l_state_0;
            end;
            if l_state_0 == nil then
                local v612 = string.format("Equality \194\183 \aFFFFFFFFRegistered shot in %s's %s (hc: %s%%, dmg: %d, aimed: %s, health remaining: %d, bt: %dt)", v605:get_name(), v611, v608, v602.damage, v610, l_m_iHealth_4, v609);
                table.insert(v288, {
                    [1] = nil, 
                    [2] = nil, 
                    [3] = 0, 
                    [1] = v612, 
                    [2] = globals.tickcount + 255
                });
                print_raw(v612);
                v21.add(v612, color(), 4);
            else
                local v613 = string.format("Equality \194\183 \aFFFFFFFFMissed shot in %s's %s due to %s (dmg: %s, hc: %s%%, bt: %dt)", v605:get_name(), v611, v607, v610, v608, v609);
                table.insert(v288, {
                    [1] = nil, 
                    [2] = nil, 
                    [3] = 0, 
                    [1] = v613, 
                    [2] = globals.tickcount + 255
                });
                print_raw(v613);
                v21.add(v613, color(), 4);
            end;
            v289 = v289 >= 999 and 1 or v289 + 1;
            return;
        end;
    end;
end);
hit_event = function(v614)
    -- upvalues: v55 (ref), v288 (ref), v21 (ref), v289 (ref)
    if not v55.logs:get() then
        return;
    else
        local v615 = entity.get_local_player();
        local v616 = entity.get(v614.attacker, true);
        local l_weapon_0 = v614.weapon;
        local v618 = "";
        if l_weapon_0 == "hegrenade" then
            v618 = "Exploded";
        elseif l_weapon_0 == "inferno" then
            v618 = "Fired";
        elseif l_weapon_0 == "knife" then
            v618 = "Knifed";
        end;
        if v618 ~= "" and v615 == v616 then
            local v619 = entity.get(v614.userid, true);
            local v620 = string.format("Equality \194\183 \aFFFFFFFF%s %s for %d damage (%d health remaining)", v618, v619:get_name(), v614.dmg_health, v614.health);
            table.insert(v288, {
                [1] = nil, 
                [2] = nil, 
                [3] = 0, 
                [1] = v620, 
                [2] = globals.tickcount + 250
            });
            print_raw(v620);
            v21.add(v620, color(), 4);
            v289 = v289 >= 999 and 1 or v289 + 1;
        end;
        return;
    end;
end;
events.player_hurt:set(function(v621)
    hit_event(v621);
end);
v290 = function()
    -- upvalues: v55 (ref), v66 (ref), v53 (ref), v54 (ref), v43 (ref), v59 (ref), v61 (ref), v63 (ref), l_clipboard_0 (ref), l_base64_1 (ref)
    local v622 = {
        visuals = {}
    };
    for v623, v624 in pairs(v55) do
        if v624.get and type(v624.get) == "function" then
            v622.visuals[v623] = v624:get();
        end;
    end;
    v622.misc = {};
    for v625, v626 in pairs(v66) do
        if v626.get and type(v626.get) == "function" then
            v622.misc[v625] = v626:get();
        end;
    end;
    v622.tweaks = {};
    for v627, v628 in pairs(v53) do
        if v628.get and type(v628.get) == "function" then
            v622.tweaks[v627] = v628:get();
        end;
    end;
    v622.ui_ai_peek = {};
    for v629, v630 in pairs(v54) do
        if v630.get and type(v630.get) == "function" then
            v622.ui_ai_peek[v629] = v630:get();
        end;
    end;
    v622.aa = {};
    for v631, v632 in pairs(v43.menu_elements) do
        v622.aa[v631] = {};
        for v633, v634 in pairs(v632) do
            if v634.get and type(v634.get) == "function" then
                v622.aa[v631][v633] = v634:get();
            end;
        end;
    end;
    v622.walk_break = v59:get();
    v622.air_break = v61:get();
    v622.addons = v63:get();
    local v635 = json.stringify(v622);
    l_clipboard_0.set(v635);
    return l_base64_1.encode(v635);
end;
v291 = function(v636)
    -- upvalues: l_base64_1 (ref), v55 (ref), v66 (ref), v53 (ref), v54 (ref), v43 (ref), v59 (ref), v61 (ref), v63 (ref)
    local v637 = l_base64_1.decode(v636);
    local v638 = json.parse(v637);
    if not v638 then
        return;
    else
        if v638.visuals then
            for v639, v640 in pairs(v638.visuals) do
                if v55[v639] and v55[v639].set and type(v55[v639].set) == "function" then
                    v55[v639]:set(v640);
                end;
            end;
        end;
        if v638.misc then
            for v641, v642 in pairs(v638.misc) do
                if v66[v641] and v66[v641].set and type(v66[v641].set) == "function" then
                    v66[v641]:set(v642);
                end;
            end;
        end;
        if v638.tweaks then
            for v643, v644 in pairs(v638.tweaks) do
                if v53[v643] and v53[v643].set and type(v53[v643].set) == "function" then
                    v53[v643]:set(v644);
                end;
            end;
        end;
        if v638.ui_ai_peek then
            for v645, v646 in pairs(v638.ui_ai_peek) do
                if v54[v645] and v54[v645].set and type(v54[v645].set) == "function" then
                    v54[v645]:set(v646);
                end;
            end;
        end;
        if v638.aa then
            for v647, v648 in pairs(v638.aa) do
                if v43.menu_elements[v647] then
                    for v649, v650 in pairs(v648) do
                        if v43.menu_elements[v647][v649] and v43.menu_elements[v647][v649].set and type(v43.menu_elements[v647][v649].set) == "function" then
                            v43.menu_elements[v647][v649]:set(v650);
                        end;
                    end;
                end;
            end;
        end;
        if v638.walk_break ~= nil then
            v59:set(v638.walk_break);
        end;
        if v638.air_break ~= nil then
            v61:set(v638.air_break);
        end;
        if v638.addons then
            v63:set(v638.addons);
        end;
        return;
    end;
end;
v292 = db.config_148833 or {};
v292.cfg_list = v292.cfg_list or {
    [1] = {
        [1] = nil, 
        [2] = "eyJhYSI6eyJBaXIiOnsiYWxsb3ciOnRydWUsImJvZHlfeWF3XzEiOjYwLjAsImJvZHlfeWF3XzIiOjYwLjAsImJyZWFrX2xjIjoiQWx3YXlzIE9uIiwiZGVmZW5zaXZlX2FhIjp0cnVlLCJkZWZlbnNpdmVfcGl0Y2giOiJTdGF0aWMiLCJkZWZlbnNpdmVfcGl0Y2hfMSI6ODQuMCwiZGVmZW5zaXZlX3BpdGNoXzIiOjAuMCwiZGVmZW5zaXZlX3lhdyI6IlN3aXRjaCIsImRlZmVuc2l2ZV95YXdfMSI6LTI0LjAsImRlZmVuc2l2ZV95YXdfMiI6MTEuMCwiZGVmZW5zaXZlX3lhd19zcGVlZCI6MC4wLCJkZWxheSI6ZmFsc2UsImRlbGF5X3JhbmRvbSI6MC4wLCJkZWxheV92YWx1ZSI6MS4wLCJ5YXciOiJTd2l0Y2giLCJ5YXdfbCI6LTI0LjAsInlhd19vZmZzZXQiOiJPZmZzZXQiLCJ5YXdfb2Zmc2V0X3ZhbHVlIjozOS4wLCJ5YXdfciI6MTAuMCwieWF3X3NsaWRlciI6MC4wfSwiQWlyIER1Y2siOnsiYWxsb3ciOnRydWUsImJvZHlfeWF3XzEiOjYwLjAsImJvZHlfeWF3XzIiOjYwLjAsImJyZWFrX2xjIjoiQWx3YXlzIE9uIiwiZGVmZW5zaXZlX2FhIjp0cnVlLCJkZWZlbnNpdmVfcGl0Y2giOiJTdGF0aWMiLCJkZWZlbnNpdmVfcGl0Y2hfMSI6ODkuMCwiZGVmZW5zaXZlX3BpdGNoXzIiOjAuMCwiZGVmZW5zaXZlX3lhdyI6IlN3aXRjaCIsImRlZmVuc2l2ZV95YXdfMSI6LTIxLjAsImRlZmVuc2l2ZV95YXdfMiI6MjcuMCwiZGVmZW5zaXZlX3lhd19zcGVlZCI6MC4wLCJkZWxheSI6dHJ1ZSwiZGVsYXlfcmFuZG9tIjowLjAsImRlbGF5X3ZhbHVlIjozLjAsInlhdyI6IlN3aXRjaCIsInlhd19sIjotMjQuMCwieWF3X29mZnNldCI6IkNlbnRlciIsInlhd19vZmZzZXRfdmFsdWUiOi0xNy4wLCJ5YXdfciI6MzMuMCwieWF3X3NsaWRlciI6MC4wfSwiRHVjayI6eyJhbGxvdyI6dHJ1ZSwiYm9keV95YXdfMSI6NjAuMCwiYm9keV95YXdfMiI6NjAuMCwiYnJlYWtfbGMiOiJPbiBwZWVrIiwiZGVmZW5zaXZlX2FhIjpmYWxzZSwiZGVmZW5zaXZlX3BpdGNoIjoiU3RhdGljIiwiZGVmZW5zaXZlX3BpdGNoXzEiOjAuMCwiZGVmZW5zaXZlX3BpdGNoXzIiOjAuMCwiZGVmZW5zaXZlX3lhdyI6IlN0YXRpYyIsImRlZmVuc2l2ZV95YXdfMSI6MC4wLCJkZWZlbnNpdmVfeWF3XzIiOjAuMCwiZGVmZW5zaXZlX3lhd19zcGVlZCI6MC4wLCJkZWxheSI6ZmFsc2UsImRlbGF5X3JhbmRvbSI6MC4wLCJkZWxheV92YWx1ZSI6MS4wLCJ5YXciOiJTd2l0Y2giLCJ5YXdfbCI6LTE5LjAsInlhd19vZmZzZXQiOiJDZW50ZXIiLCJ5YXdfb2Zmc2V0X3ZhbHVlIjoyNC4wLCJ5YXdfciI6MjQuMCwieWF3X3NsaWRlciI6MC4wfSwiRHVjay1SdW4iOnsiYWxsb3ciOnRydWUsImJvZHlfeWF3XzEiOjYwLjAsImJvZHlfeWF3XzIiOjYwLjAsImJyZWFrX2xjIjoiT24gcGVlayIsImRlZmVuc2l2ZV9hYSI6ZmFsc2UsImRlZmVuc2l2ZV9waXRjaCI6IlN0YXRpYyIsImRlZmVuc2l2ZV9waXRjaF8xIjowLjAsImRlZmVuc2l2ZV9waXRjaF8yIjowLjAsImRlZmVuc2l2ZV95YXciOiJTdGF0aWMiLCJkZWZlbnNpdmVfeWF3XzEiOjAuMCwiZGVmZW5zaXZlX3lhd18yIjowLjAsImRlZmVuc2l2ZV95YXdfc3BlZWQiOjAuMCwiZGVsYXkiOnRydWUsImRlbGF5X3JhbmRvbSI6My4wLCJkZWxheV92YWx1ZSI6NS4wLCJ5YXciOiJTd2l0Y2giLCJ5YXdfbCI6LTE5LjAsInlhd19vZmZzZXQiOiJDZW50ZXIiLCJ5YXdfb2Zmc2V0X3ZhbHVlIjoyMC4wLCJ5YXdfciI6MzMuMCwieWF3X3NsaWRlciI6MC4wfSwiR2xvYmFsIjp7ImJvZHlfeWF3XzEiOjAuMCwiYm9keV95YXdfMiI6MC4wLCJicmVha19sYyI6Ik9uIHBlZWsiLCJkZWZlbnNpdmVfYWEiOmZhbHNlLCJkZWZlbnNpdmVfcGl0Y2giOiJTdGF0aWMiLCJkZWZlbnNpdmVfcGl0Y2hfMSI6MC4wLCJkZWZlbnNpdmVfcGl0Y2hfMiI6MC4wLCJkZWZlbnNpdmVfeWF3IjoiU3RhdGljIiwiZGVmZW5zaXZlX3lhd18xIjowLjAsImRlZmVuc2l2ZV95YXdfMiI6MC4wLCJkZWZlbnNpdmVfeWF3X3NwZWVkIjowLjAsImRlbGF5IjpmYWxzZSwiZGVsYXlfcmFuZG9tIjowLjAsImRlbGF5X3ZhbHVlIjoxLjAsInlhdyI6IlN0YXRpYyIsInlhd19sIjowLjAsInlhd19vZmZzZXQiOiJPZmYiLCJ5YXdfb2Zmc2V0X3ZhbHVlIjowLjAsInlhd19yIjowLjAsInlhd19zbGlkZXIiOjAuMH0sIlJ1biI6eyJhbGxvdyI6dHJ1ZSwiYm9keV95YXdfMSI6NjAuMCwiYm9keV95YXdfMiI6NjAuMCwiYnJlYWtfbGMiOiJPbiBwZWVrIiwiZGVmZW5zaXZlX2FhIjpmYWxzZSwiZGVmZW5zaXZlX3BpdGNoIjoiU3RhdGljIiwiZGVmZW5zaXZlX3BpdGNoXzEiOjAuMCwiZGVmZW5zaXZlX3BpdGNoXzIiOjAuMCwiZGVmZW5zaXZlX3lhdyI6IlN0YXRpYyIsImRlZmVuc2l2ZV95YXdfMSI6MC4wLCJkZWZlbnNpdmVfeWF3XzIiOjAuMCwiZGVmZW5zaXZlX3lhd19zcGVlZCI6MC4wLCJkZWxheSI6dHJ1ZSwiZGVsYXlfcmFuZG9tIjowLjAsImRlbGF5X3ZhbHVlIjozLjAsInlhdyI6IlN3aXRjaCIsInlhd19sIjotMjEuMCwieWF3X29mZnNldCI6IkNlbnRlciIsInlhd19vZmZzZXRfdmFsdWUiOjEwLjAsInlhd19yIjoyNC4wLCJ5YXdfc2xpZGVyIjowLjB9LCJTbG93IFdhbGtpbmciOnsiYWxsb3ciOnRydWUsImJvZHlfeWF3XzEiOjYwLjAsImJvZHlfeWF3XzIiOjYwLjAsImJyZWFrX2xjIjoiQWx3YXlzIE9uIiwiZGVmZW5zaXZlX2FhIjpmYWxzZSwiZGVmZW5zaXZlX3BpdGNoIjoiU3BpbiIsImRlZmVuc2l2ZV9waXRjaF8xIjotODkuMCwiZGVmZW5zaXZlX3BpdGNoXzIiOjI5LjAsImRlZmVuc2l2ZV95YXciOiJTd2l0Y2giLCJkZWZlbnNpdmVfeWF3XzEiOi05Ny4wLCJkZWZlbnNpdmVfeWF3XzIiOjExMi4wLCJkZWZlbnNpdmVfeWF3X3NwZWVkIjowLjAsImRlbGF5Ijp0cnVlLCJkZWxheV9yYW5kb20iOjAuMCwiZGVsYXlfdmFsdWUiOjMuMCwieWF3IjoiU3dpdGNoIiwieWF3X2wiOi0yNC4wLCJ5YXdfb2Zmc2V0IjoiQ2VudGVyIiwieWF3X29mZnNldF92YWx1ZSI6MzkuMCwieWF3X3IiOjI5LjAsInlhd19zbGlkZXIiOjAuMH0sIlN0YW5kIjp7ImFsbG93Ijp0cnVlLCJib2R5X3lhd18xIjo2MC4wLCJib2R5X3lhd18yIjo2MC4wLCJicmVha19sYyI6IkFsd2F5cyBPbiIsImRlZmVuc2l2ZV9hYSI6dHJ1ZSwiZGVmZW5zaXZlX3BpdGNoIjoiU3dpdGNoIiwiZGVmZW5zaXZlX3BpdGNoXzEiOjg5LjAsImRlZmVuc2l2ZV9waXRjaF8yIjo4OS4wLCJkZWZlbnNpdmVfeWF3IjoiU3dpdGNoIiwiZGVmZW5zaXZlX3lhd18xIjoxMi4wLCJkZWZlbnNpdmVfeWF3XzIiOi0xNS4wLCJkZWZlbnNpdmVfeWF3X3NwZWVkIjowLjAsImRlbGF5Ijp0cnVlLCJkZWxheV9yYW5kb20iOjMuMCwiZGVsYXlfdmFsdWUiOjMuMCwieWF3IjoiU3dpdGNoIiwieWF3X2wiOi0yMC4wLCJ5YXdfb2Zmc2V0IjoiT2ZmIiwieWF3X29mZnNldF92YWx1ZSI6MC4wLCJ5YXdfciI6MzMuMCwieWF3X3NsaWRlciI6MC4wfX0sImFkZG9ucyI6WyJFYXJ0aCBRdWFrZSIsIkthbmdhcm9vIl0sImFpcl9icmVhayI6Mi4wLCJtaXNjIjp7ImFpcl9zdG9wIjpmYWxzZSwiY2xhbnRhZyI6ZmFsc2UsImVkZ2Vfc3RvcCI6ZmFsc2UsInRyYXNodGFsayI6ZmFsc2V9LCJ0d2Vha3MiOnsiZWRnZV95YXciOmZhbHNlLCJlc3BhbSI6ZmFsc2UsImZha2VfbGFnX2FkZG9uIjp0cnVlLCJmYXN0X2xhZGRlciI6dHJ1ZSwibWFudWFsX3lhdyI6Ik9mZiIsIm5hZGVfZml4Ijp0cnVlLCJzYWZlaGVhZCI6ZmFsc2UsInN1cGVyX3Rvc3MiOmZhbHNlLCJ3YXJtdXBfYWEiOmZhbHNlfSwidWlfYWlfcGVlayI6eyJjb2xvciI6bnVsbCwiZW5hYmxlZCI6ZmFsc2UsImhpdGJveGVzIjpbIkhlYWQiLCJDaGVzdCIsIlN0b21hY2giXSwiaGl0Y2hhbmNlIjozNS4wLCJyYXRlX2xpbWl0IjozLjAsInNpbXVsYXRpb24iOjMwLjAsIndlYXBvbnMiOlsiU25pcGVycyJdfSwidmlzdWFscyI6eyJjdXN0b21fc2NvcGUiOnRydWUsImN1c3RvbV9zY29wZV9jb2xvciI6bnVsbCwiY3VzdG9tX3Njb3BlX2dhcCI6MTAuMCwiY3VzdG9tX3Njb3BlX3NpemUiOjIwLjAsImdyZW5hZGVfZW5lbXkiOm51bGwsImdyZW5hZGVfZnJpZW5kIjpudWxsLCJncmVuYWRlX3JhZGl1cyI6ZmFsc2UsImdyZW5hZGVfc2VsZWN0IjpbXSwia2VlcF9tb2RlbF90cmFuc3BhcmVuY3kiOnRydWUsImxjX2luZCI6dHJ1ZSwibGVmdF9zaWRlX2luZGljYXRvciI6ZmFsc2UsImxvZ3MiOnRydWUsInNtb2tlIjpudWxsLCJzbW9vdGhfZm92Ijp0cnVlLCJ0X3N0eWxlIjpmYWxzZSwidmlld21vZGVsIjpmYWxzZSwid2F0ZXJtYXJrIjp0cnVlLCJ3YXRlcm1hcmtfbmlja19zZWxlY3RvciI6Ik5MIiwid2F0ZXJtYXJrX25pY2tuYW1lIjoiRnJvemVuIHBpZG9yYXMifSwid2Fsa19icmVhayI6Mi4wfQ==", 
        [1] = ui.get_icon("jedi") .. " Hidden Defensive"
    }
};
v292.menu_list = v292.menu_list or {
    [1] = ui.get_icon("jedi") .. " Hidden Defensive"
};
v293 = function()
    -- upvalues: v292 (ref)
    v292.menu_list = {};
    for _, v652 in ipairs(v292.cfg_list) do
        table.insert(v292.menu_list, v652[1]);
    end;
end;
local function v653()
    -- upvalues: v292 (ref)
    db.config_148833 = v292;
end;
local function v657(v654)
    -- upvalues: v292 (ref), v293 (ref), v653 (ref)
    if not v654 or v654 == "" then
        common.add_notify("Error", "Please enter a valid config name");
        return;
    else
        for _, v656 in ipairs(v292.cfg_list) do
            if v656[1] == v654 then
                common.add_notify("Error", "A config with that name already exists");
                return;
            end;
        end;
        table.insert(v292.cfg_list, {
            [1] = nil, 
            [2] = "", 
            [1] = v654
        });
        v293();
        v653();
        common.add_notify("Success", "Config created: " .. v654);
        return;
    end;
end;
local function v661(v658)
    -- upvalues: v292 (ref), v290 (ref), v653 (ref)
    if v658 <= 0 or #v292.cfg_list < v658 then
        common.add_notify("Error", "Invalid config selection");
        return;
    else
        local l_status_1, l_result_1 = pcall(v290);
        if not l_status_1 or not l_result_1 or l_result_1 == "" then
            common.add_notify("Error", "Error exporting config");
            return;
        else
            v292.cfg_list[v658][2] = l_result_1;
            v653();
            common.add_notify("Success", "Config saved: " .. v292.cfg_list[v658][1]);
            return;
        end;
    end;
end;
local function v666(v662)
    -- upvalues: v292 (ref), v291 (ref)
    if v662 <= 0 or #v292.cfg_list < v662 then
        common.add_notify("Error", "Invalid config selection");
        return;
    else
        local v663 = v292.cfg_list[v662][2];
        if not v663 or v663 == "" then
            common.add_notify("Error", "Config is empty");
            return;
        else
            local l_status_2, l_result_2 = pcall(function()
                -- upvalues: v291 (ref), v663 (ref)
                v291(v663);
            end);
            if l_status_2 then
                common.add_notify("Success", "Config loaded: " .. v292.cfg_list[v662][1]);
            else
                common.add_notify("Error", "Error loading config: " .. tostring(l_result_2));
            end;
            return;
        end;
    end;
end;
local function v668(v667)
    -- upvalues: v292 (ref), v293 (ref), v653 (ref)
    if v667 <= 0 or #v292.cfg_list < v667 then
        common.add_notify("Error", "Invalid config selection");
        return;
    elseif v292.cfg_list[v667][1] == "\aDefault" then
        common.add_notify("Error", "Default config cannot be removed");
        return;
    else
        table.remove(v292.cfg_list, v667);
        v293();
        v653();
        common.add_notify("Success", "Config removed");
        return;
    end;
end;
local function v671(v669)
    -- upvalues: v292 (ref), l_clipboard_0 (ref)
    if v669 <= 0 or #v292.cfg_list < v669 then
        common.add_notify("Error", "Invalid config selection");
        return;
    else
        local v670 = v292.cfg_list[v669][2];
        if not v670 or v670 == "" then
            common.add_notify("Error", "Config is empty");
            return;
        else
            l_clipboard_0.set(v670);
            common.add_notify("Success", "Config exported to clipboard");
            return;
        end;
    end;
end;
local function v674(v672)
    -- upvalues: l_clipboard_0 (ref), v292 (ref), v293 (ref), v653 (ref)
    if not v672 or v672 == "" then
        common.add_notify("Error", "Please enter a valid name for the config");
        return;
    else
        local v673 = l_clipboard_0.get();
        if not v673 or v673 == "" then
            common.add_notify("Error", "Clipboard is empty");
            return;
        else
            table.insert(v292.cfg_list, {
                [1] = v672, 
                [2] = v673
            });
            v293();
            v653();
            common.add_notify("Success", "Config imported: " .. v672);
            return;
        end;
    end;
end;
local v675 = v33.main_info:list("", v292.menu_list);
local v676 = v33.main_info:input("Config Name", "");
local v677 = v33.main_info:button(ui.get_icon("plus"), function()
    -- upvalues: v657 (ref), v676 (ref), v675 (ref), v292 (ref)
    v657(v676:get());
    v675:update(v292.menu_list);
end, true):tooltip("Create Config");
local v678 = v33.main_info:button(ui.get_icon("floppy-disk"), function()
    -- upvalues: v661 (ref), v675 (ref)
    v661(v675:get());
end, true):tooltip("Save Config");
local v679 = v33.main_info:button(ui.get_icon("loader"), function()
    -- upvalues: v666 (ref), v675 (ref)
    v666(v675:get());
end, true):tooltip("Load Config");
local v680 = v33.main_info:button(ui.get_icon("trash"), function()
    -- upvalues: v668 (ref), v675 (ref), v292 (ref)
    v668(v675:get());
    v675:update(v292.menu_list);
end, true):tooltip("Delete Config");
local v681 = v33.main_info:button(ui.get_icon("file-export"), function()
    -- upvalues: v671 (ref), v675 (ref)
    v671(v675:get());
end, true):tooltip("Export Config");
local v682 = v33.main_info:button(ui.get_icon("file-import"), function()
    -- upvalues: v674 (ref), v676 (ref), v675 (ref), v292 (ref)
    v674(v676:get());
    v675:update(v292.menu_list);
end, true):tooltip("Import Config");
v293();
v653();
events.shutdown:set(v653);
local function v683()
    -- upvalues: v677 (ref), v34 (ref), v678 (ref), v679 (ref), v680 (ref), v681 (ref), v682 (ref), v675 (ref), v676 (ref)
    v677:visibility(v34:get() == 1);
    v678:visibility(v34:get() == 1);
    v679:visibility(v34:get() == 1);
    v680:visibility(v34:get() == 1);
    v681:visibility(v34:get() == 1);
    v682:visibility(v34:get() == 1);
    v675:visibility(v34:get() == 1);
    v676:visibility(v34:get() == 1);
end;
v683();
v34:set_callback(v683);
local function v686(v684, v685)
    if not v684 or not v685 then
        return math.huge;
    else
        return math.ceil((v684 - v685):length());
    end;
end;
local function v688(v687)
    if v687 == nil then
        return false;
    else
        return v687.m_iItemDefinitionIndex == 64;
    end;
end;
local function v698(v689, v690)
    -- upvalues: v688 (ref), v686 (ref)
    if not v689 or not v690 then
        return "N/A";
    else
        local v691 = v689:get_player_weapon();
        if not v688(v691) then
            return "N/A";
        else
            local v692 = v689:get_origin();
            local v693 = v690:get_origin();
            if not v692 or not v693 then
                return "N/A";
            else
                local v694 = v686(v692, v693);
                local v695 = v690.m_ArmorValue == 0;
                local v696 = v692.z - v693.z;
                local _ = nil;
                return v696 > 100 and v694 < 300 and "DMG+" or v694 > 585 and "N/A" or v694 < 585 and v694 > 511 and "DMG" or v694 <= 511 and v695 and "DMG+" or v694 <= 190 and "DMG+" or "DMG";
            end;
        end;
    end;
end;
esp.enemy:new_text("Revolver Helper", "DMG", function(v699)
    -- upvalues: v688 (ref), v698 (ref)
    local v700 = entity.get_local_player();
    if not v700 or not v700:is_alive() then
        return "";
    else
        local v701 = v700:get_player_weapon();
        if not v688(v701) then
            return "";
        else
            local v702 = v698(v700, v699);
            return v702 ~= "N/A" and v702 or "";
        end;
    end;
end);
local v703 = {
    enabled = false, 
    prev_tag = ""
};
local function v705(v704)
    -- upvalues: v703 (ref)
    if v704 ~= v703.prev_tag then
        common.set_clan_tag(v704);
        v703.prev_tag = v704;
    end;
end;
local function v712(v706, v707)
    local v708 = "               " .. v706 .. "                      ";
    local v709 = utils.net_channel();
    if not v709 then
        return "";
    else
        local v710 = globals.tickcount + math.floor((v709.latency[0] + 0.3) / globals.tickinterval + 0.5);
        local v711 = v707[math.floor(v710 / math.floor(0.3 / globals.tickinterval + 0.5) % #v707) + 1] + 1;
        return v708:sub(v711, v711 + 15);
    end;
end;
local function v714()
    -- upvalues: v703 (ref), v712 (ref), v705 (ref)
    if not v703.enabled then
        ui.find("Miscellaneous", "Main", "In-Game", "Clan Tag"):override();
        return;
    else
        ui.find("Miscellaneous", "Main", "In-Game", "Clan Tag"):override(false);
        if not entity.get_local_player() then
            return;
        else
            local v713 = v712("Equality ~ Twilight", {
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
                [24] = 23, 
                [25] = 24, 
                [26] = 25, 
                [27] = 26, 
                [28] = 27, 
                [29] = 28, 
                [30] = 29, 
                [31] = 30, 
                [32] = 31, 
                [33] = 32, 
                [34] = 33
            });
            v705(v713);
            return;
        end;
    end;
end;
v66.clantag:set_callback(function(v715)
    -- upvalues: v703 (ref)
    v703.enabled = v715:get();
    if not v703.enabled then
        common.set_clan_tag("\000");
        v703.prev_tag = "";
    end;
end);
events.pre_render:set(v714);
local v716 = {
    [1] = "\208\148\208\190\208\188\208\184\208\189\208\176\209\134\208\184\209\143 \208\189\208\176\208\180 \208\177\208\190\208\188\208\182\208\176\208\188\208\184 by {Equality ~ Twilight} ", 
    [2] = "\208\162\209\143 \208\181\208\177\209\145\209\130 \209\130\209\143 i\208\177\208\181\209\130 \208\156iSH\208\176 \206\181(\194\180\239\189\161\226\128\162\225\142\145\226\128\162`)\227\129\163", 
    [3] = "owned by  \208\161\208\186\209\150\208\177\209\150\208\180\209\150\209\129\209\150\208\179\208\188\208\176", 
    [4] = "Sniped head bomj ( -_\226\128\162)\226\150\132\239\184\187\227\131\134\216\173\217\131\217\128\226\148\129\228\184\128", 
    [5] = "Allah \208\180\208\176\209\145\209\130 \208\178\208\181\208\183\208\181\208\189\208\184\208\181 \208\178 \208\186\209\128\208\190\208\178\209\140 (\224\184\135'\204\128-'\204\129)\224\184\135  ", 
    [6] = "\240\157\145\180\240\157\146\134\240\157\146\144\240\157\146\152. \226\130\141\226\145\133\225\144\162..\225\144\162\226\130\142", 
    [7] = "\209\131 \208\188\208\181\208\189\209\143 \209\132\208\184\208\188\208\190\208\183i\208\186", 
    [8] = "\240\157\154\133\240\157\154\142\240\157\154\151\240\157\154\152\240\157\154\150 ", 
    [9] = "^\226\142\154-\226\142\154^", 
    [10] = "Imposter", 
    [11] = "\240\157\151\150\240\157\151\152\240\157\151\162 \240\157\151\162\240\157\151\153 \240\157\151\162\240\157\151\155\240\157\151\156\240\157\151\162", 
    [12] = "\234\167\129\240\157\149\181\240\157\150\138\240\157\150\152\240\157\150\154\240\157\150\152 \240\157\150\142\240\157\150\152 \240\157\149\183\240\157\150\148\240\157\150\151\240\157\150\137\234\167\130", 
    [13] = "\226\142\155\226\142\157 \226\137\189  >  \226\169\138   < \226\137\188 \226\142\160\226\142\158", 
    [14] = "\226\142\155\226\142\157( ` \225\162\141 \194\180 )\226\142\160\226\142\158\225\181\144\225\181\152\202\176\225\181\131\202\176\225\181\131", 
    [15] = "\225\147\154\226\130\141\226\145\133^..^\226\130\142\226\153\161", 
    [16] = "( \227\129\163'-')\226\149\174 =\205\159\205\159\205\158\240\159\143\128", 
    [17] = "( ,,\226\169\140'\239\184\191'\226\169\140,,)", 
    [18] = "(\227\129\165\239\191\163 \194\179\239\191\163)\227\129\165 \240\159\146\158", 
    [19] = "(\226\184\157\226\184\157\224\185\145\239\185\143\224\185\145\226\184\157\226\184\157)", 
    [20] = "\226\139\134\239\189\161\203\154 \226\152\129\239\184\142 \203\154Equality ~ Twilight \239\189\161 \226\139\134 \239\189\161\203\154\226\152\189\203\154\239\189\161\226\139\134", 
    [21] = "(\227\129\163- \226\128\184 - \207\130)", 
    [22] = "\226\137\189^-\203\149-^\226\137\188", 
    [23] = "\226\130\141^. \204\171.^\226\130\142 \239\184\187\232\138\171\226\149\144\226\148\128\226\148\128\226\148\128 \240\159\146\128 ", 
    [24] = "(\226\138\153\226\129\160\226\128\191\226\151\142)\240\159\148\170\240\159\146\137\240\159\169\184", 
    [25] = "(\203\182\203\131\226\164\153\203\130\203\182)", 
    [26] = "\224\180\166\224\181\141\224\180\166\224\180\191(\203\181 \226\128\162\204\128 \225\180\151 - \203\181 ) \226\156\167", 
    [27] = "Ni\224\188\188 \227\129\164 \226\151\149_\226\151\149 \224\188\189\227\129\164gga", 
    [28] = "\227\131\190(\224\185\145\226\149\185\226\151\161\226\149\185)\239\190\137\240\159\148\170", 
    [29] = "(\194\172`\226\128\184\194\180\194\172)", 
    [30] = "(\227\129\165\224\185\145\226\128\162\225\180\151\226\128\162\224\185\145)\227\129\165\226\153\161", 
    [31] = "\227\128\140 \226\156\166 Equality ~ Twilight \226\156\166 \227\128\141", 
    [32] = "\240\157\144\146\240\157\144\173\226\156\176\240\157\144\171\240\157\144\160\240\157\144\162\240\157\144\171\240\157\144\165", 
    [33] = "\224\171\174\226\130\141\194\180\203\182\226\128\162 . \226\128\162 \226\145\133 \226\130\142\225\131\144", 
    [34] = "<( \226\184\157\226\184\157\226\128\162\204\128 - \226\128\162\204\129\226\184\157\226\184\157)>", 
    [35] = "(\227\129\163\203\152\218\161\203\152\207\130)", 
    [36] = "\208\161\208\184\208\187\209\140\208\189\208\176\209\143 \208\186\208\190\208\188\208\176\208\189\208\180\208\176 - \208\187\208\181\208\179\208\186\208\176\209\143 \208\188\208\176\208\191\208\176 ( \226\151\186\203\176\226\151\191 ) ", 
    [37] = "\208\159\208\190\208\189\208\184\208\188\208\176\208\189\208\184\208\181 \208\184\208\179\209\128\209\139 \208\180\208\176\209\145\209\130\209\129\209\143 \209\129 \208\178\209\128\208\181\208\188\208\181\208\189\208\181\208\188 (\203\182\203\134\234\146\179\203\134\203\181)", 
    [38] = "\208\155\208\181\208\179\208\186\208\184\208\185 \208\191\208\190\208\177\208\181\208\180\208\176 \209\129 \208\187\209\131\209\135\209\136\208\181\208\185 \208\187\209\131\208\176 Equality ~ Twilight ", 
    [39] = "Predict system Enabled (\226\151\163 _ \226\151\162) ", 
    [40] = "Godmode Enabled \225\147\154\226\130\141 ^. \204\171 .^\226\130\142", 
    [41] = "WE BANDITO VNE PREDICTO \226\151\149\226\169\138\226\151\149", 
    [42] = "Awp & predict - win game (\203\182\225\181\148 \225\181\149 \225\181\148\203\182) ", 
    [43] = "\226\149\190\226\148\129\226\149\164\227\131\135\226\149\166\239\184\187 (\226\128\162_- )", 
    [44] = "\226\128\148\224\184\133/\225\144\160. \204\171 .\225\144\159/\224\184\133 \226\128\148 \208\154\208\158\208\162 \208\148\208\163\208\160\208\144\208\154 \226\157\164\239\184\142"
};
events.player_death:set(function(v717)
    -- upvalues: v66 (ref), v716 (ref)
    if not v66.trashtalk:get() then
        return;
    else
        local v718 = entity.get_local_player();
        if v718 == nil then
            return;
        else
            if entity.get(v717.attacker, true) == v718 then
                utils.execute_after(1, function()
                    -- upvalues: v716 (ref)
                    local v719 = v716[math.random(#v716)];
                    utils.console_exec("say " .. v719);
                end);
            end;
            return;
        end;
    end;
end);
local v725 = {
    distance_2d = function(v720, v721)
        return math.sqrt((v721.x - v720.x) ^ 2 + (v721.y - v720.y) ^ 2);
    end, 
    lerp_position = function(v722, v723, v724)
        return vector((v723.x - v722.x) * v724 + v722.x, (v723.y - v722.y) * v724 + v722.y, (v723.z - v722.z) * v724 + v722.z);
    end
};
local v726 = 17.55;
local v727 = 125;
local function v758()
    -- upvalues: v55 (ref), v725 (ref), v726 (ref), v727 (ref)
    local v728 = entity.get_local_player();
    if not v728 then
        return;
    elseif not v55.grenade_radius:get() then
        return;
    else
        if v55.grenade_select:get(2) then
            local v729 = entity.get_entities("CInferno");
            for v730 = 1, #v729 do
                local v731 = v729[v730];
                local v732 = v731:get_origin();
                if v731.m_hOwnerEntity.m_iTeamNum == v728.m_iTeamNum then
                    color_mol = v55.grenade_friend:get();
                else
                    color_mol = v55.grenade_enemy:get();
                end;
                local v733 = 40;
                local v734 = {};
                local v735 = 0;
                local v736 = nil;
                local v737 = nil;
                local v738 = v729[v730];
                for v739 = 1, 64 do
                    if v738.m_bFireIsBurning[v739] == true then
                        table.insert(v734, vector(v731.m_fireXDelta[v739], v731.m_fireYDelta[v739], v731.m_fireZDelta[v739]));
                    end;
                end;
                for v740 = 1, #v734 do
                    for v741 = 1, #v734 do
                        local v742 = v725.distance_2d(v734[v740], v734[v741]);
                        if v735 < v742 then
                            v735 = v742;
                            v736 = v734[v740];
                            v737 = v734[v741];
                        end;
                    end;
                end;
                if v736 ~= nil and v737 ~= nil then
                    local v743 = v732 + v725.lerp_position(v736, v737, 0.5);
                    render.circle_3d_outline(v743, color(color_mol.r, color_mol.g, color_mol.b, 255), v735 / 2 + v733, 0, 1, 1);
                end;
            end;
        end;
        if v55.grenade_select:get(1) then
            local l_tickcount_1 = globals.tickcount;
            local l_tickinterval_0 = globals.tickinterval;
            local v746 = entity.get_entities("CSmokeGrenadeProjectile");
            for v747 = 1, #v746 do
                local v748 = v746[v747];
                local v749 = v748:get_classname();
                local v750 = 1;
                if v749 == "CSmokeGrenadeProjectile" and v748.m_bDidSmokeEffect == true then
                    local l_m_nSmokeEffectTickBegin_0 = v748.m_nSmokeEffectTickBegin;
                    if l_m_nSmokeEffectTickBegin_0 ~= nil then
                        local v752 = l_tickinterval_0 * (l_tickcount_1 - l_m_nSmokeEffectTickBegin_0);
                        if v752 > 0 and v726 - v752 > 0 then
                            if grenade_timer then
                                v750 = 1 - v752 / v726;
                            end;
                            local l_r_0 = v55.smoke:get().r;
                            local l_g_0 = v55.smoke:get().g;
                            local l_b_0 = v55.smoke:get().b;
                            local l_a_0 = v55.smoke:get().a;
                            local l_v727_0 = v727;
                            if v752 < 0.3 then
                                l_v727_0 = l_v727_0 * 0.6 + l_v727_0 * (v752 / 0.3) * 0.4;
                                l_a_0 = l_a_0 * (v752 / 0.3);
                            end;
                            if v726 - v752 < 1 then
                                l_v727_0 = l_v727_0 * ((v726 - v752) / 1 * 0.3 + 0.7);
                            end;
                            render.circle_3d_outline(v748:get_origin(), color(l_r_0, l_g_0, l_b_0, l_a_0 * math.min(1, v750 * 1.3)), l_v727_0, 0, 1);
                        end;
                    end;
                end;
            end;
        end;
        return;
    end;
end;
events.render:set(v758);
local function v774(v759, v760, v761, v762)
    local v763 = globals.realtime * v762;
    local v764 = "";
    local v765 = #v761;
    local _ = -0.5 * (1 - math.cos(v763));
    for v767 = 1, v765 do
        local l_v767_0 = v767;
        local v769 = v761:sub(v767, v767);
        local v770 = (math.sin(v763 + l_v767_0 / v765 * math.pi) + 1) / 2;
        local v771 = math.floor(v759[1] * v770 + v760[1] * (1 - v770));
        local v772 = math.floor(v759[2] * v770 + v760[2] * (1 - v770));
        local v773 = math.floor(v759[3] * v770 + v760[3] * (1 - v770));
        v764 = v764 .. string.format("\a%02X%02X%02XFF%s", v771, v772, v773, v769);
    end;
    return v764;
end;
events.render:set(function()
    -- upvalues: v774 (ref)
    sidebar = ui.sidebar(v774({
        [1] = 255, 
        [2] = 255, 
        [3] = 255
    }, {
        [1] = 128, 
        [2] = 128, 
        [3] = 128
    }, "Equality", 2), "transporter-3");
end);
handle = function(v775)
    -- upvalues: v53 (ref)
    if not v53.flick_exp:get() then
        return;
    elseif rage.exploit:get() < 1 then
        return;
    else
        yaw_exp = 80;
        pch_exp = math.random(-7, 7);
        ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"):override(0);
        ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"):override(0);
        rage.antiaim:inverter(math.random(1, 3) == 2);
        rage.antiaim:override_hidden_pitch(pch_exp);
        rage.antiaim:override_hidden_yaw_offset(yaw_exp);
        ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden"):override(true);
        v775.force_defensive = globals.commandack % math.random(2, 3) == 1;
        return;
    end;
end;
events.createmove:set(handle);
local v776 = {
    [1] = "vgui_white", 
    [2] = "vgui/hud/800corner1", 
    [3] = "vgui/hud/800corner2", 
    [4] = "vgui/hud/800corner3", 
    [5] = "vgui/hud/800corner4"
};
arg_fnction = function(v777, v778)
    return function(...)
        -- upvalues: v777 (ref), v778 (ref)
        return v777(v778, ...);
    end;
end;
dll_engine = ffi.cast(ffi.typeof("void***"), utils.create_interface("engine.dll", "VEngineClient014"));
viibility_console = arg_fnction(ffi.cast("bool(__thiscall*)(void*)", dll_engine[0][11]), dll_engine);
check_color = 0;
local function v782(v779)
    -- upvalues: v776 (ref)
    if check_color ~= v779 then
        for _, v781 in pairs(v776) do
            materials.get_materials(v781)[1]:color_modulate(color(v779.r, v779.g, v779.b));
            materials.get_materials(v781)[1]:alpha_modulate(v779.a / 255);
        end;
        check_color = v779;
    end;
end;
local function v784()
    -- upvalues: v66 (ref), v782 (ref)
    local v783 = viibility_console() and v66.console_modulation:get() and v66.console_color:get() or color(255);
    v782(v783);
end;
events.render:set(v784);
local v785 = render.load_font("Tahoma", 12, "a");
local l_x_0 = render.screen_size().x;
local l_y_0 = render.screen_size().y;
local v813 = (function()
    -- upvalues: v785 (ref), l_x_0 (ref), l_y_0 (ref)
    local v788 = {};
    v788.fatality_spect = {
        rec = function(v789, v790, v791, v792, v793)
            local v794 = vector(v789, v790);
            local v795 = vector(v789 + v791, v790 + v792);
            render.rect(v794, v795, color(v793[1], v793[2], v793[3], v793[4]));
        end, 
        get_spects = function()
            local v796 = {};
            local v797 = entity.get_local_player();
            local l_v797_0 = v797;
            if v797 ~= nil then
                local l_m_iObserverMode_0 = v797.m_iObserverMode;
                local l_m_hObserverTarget_0 = v797.m_hObserverTarget;
                if l_m_hObserverTarget_0 and (l_m_iObserverMode_0 == 4 or l_m_iObserverMode_0 == 5) then
                    l_v797_0 = l_m_hObserverTarget_0;
                end;
            end;
            for v801 = 1, globals.max_players do
                local v802 = entity.get(v801);
                if v802 and v802:is_player() and not v802:is_alive() then
                    local l_m_hObserverTarget_1 = v802.m_hObserverTarget;
                    local l_m_iObserverMode_1 = v802.m_iObserverMode;
                    if l_m_hObserverTarget_1 and l_m_hObserverTarget_1 == l_v797_0 and v801 ~= v797:get_index() and (l_m_iObserverMode_1 == 4 or l_m_iObserverMode_1 == 5) then
                        v796[#v796 + 1] = v801;
                    end;
                end;
            end;
            return v796;
        end, 
        render = function()
            -- upvalues: v788 (ref), v785 (ref), l_x_0 (ref), l_y_0 (ref)
            local v805 = v788.fatality_spect:get_spects();
            for v806 = 1, #v805 do
                if v806 > 10 then
                    return;
                else
                    local v807 = entity.get(v805[v806]):get_name();
                    local v808 = render.measure_text(v785, "A", v807);
                    local v809 = 5;
                    local v810 = 8;
                    local v811 = 6;
                    v788.fatality_spect.rec(l_x_0 - v808.x - v809 - v810 - 40 - v811, l_y_0 / 2 - 15 + (v806 - 1) * 37, v808.x + v809 + v810, 30, {
                        [1] = 0, 
                        [2] = 0, 
                        [3] = 0, 
                        [4] = 70
                    });
                    render.text(v785, vector(l_x_0 - v808.x - v810 - 38 - v811, l_y_0 / 2 - 8 + (v806 - 1) * 37), color(255, 255, 255, 255), nil, v807);
                    local v812 = entity.get(v805[v806]):get_steam_avatar();
                    if v812 then
                        render.texture(v812, vector(l_x_0 - 35, l_y_0 / 2 - 15 + (v806 - 1) * 37), vector(29, 29), nil, nil, 4);
                    end;
                end;
            end;
        end
    };
    return v788;
end)();
events.render:set(function()
    -- upvalues: v66 (ref), v813 (ref)
    if v66.spectator:get() and globals.is_connected then
        v813.fatality_spect:render();
    end;
end);
entity_has_c4 = function(v814)
    local v815 = entity.get_entities("CC4")[1];
    return v815 ~= nil and v815.m_hOwnerEntity == v814;
end;
classnames = {
    [1] = "CWorld", 
    [2] = "CCSPlayer", 
    [3] = "CFuncBrush"
};
legit_aa = function(v816)
    -- upvalues: v53 (ref)
    if v53.legit_aa:get() then
        local v817 = entity.get_local_player();
        local v818 = 100;
        local v819 = entity.get_entities("CPlantedC4")[1];
        local v820 = v819 ~= nil and v819.m_vecOrigin or {};
        if v820.x ~= nil then
            v818 = v820:dist(v817.m_vecOrigin);
        end;
        local v821 = v817.m_iTeamNum == 3 and v818 < 66;
        local _ = v817.m_bInBombZone;
        local _ = entity_has_c4(v817);
        local v824 = v817:get_eye_position();
        local v825 = render.camera_angles();
        local v826 = math.sin(math.rad(v825.x));
        local v827 = math.cos(math.rad(v825.x));
        local v828 = math.sin(math.rad(v825.y));
        local v829 = {
            [1] = v827 * math.cos(math.rad(v825.y)), 
            [2] = v827 * v828, 
            [3] = -v826
        };
        local v830 = utils.trace_line(v824, vector(v824.x + v829[1] * 8192, v824.y + v829[2] * 8192, v824.z + v829[3] * 8192));
        local v831 = true;
        if v830.entity ~= nil then
            for v832 = 0, #classnames do
                if v830.entity:get_classname() == classnames[v832] then
                    v831 = false;
                end;
            end;
        end;
        if not v831 and not v821 then
            v816.in_use = 0;
            if common.is_button_down(69) then
                if v53.legit_type:get() == 1 then
                    ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"):override("Local View");
                    ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"):override("Disabled");
                    ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"):override(-180);
                    ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"):override(60);
                    ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"):override(60);
                    ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"):override(true);
                    ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"):override("Disabled");
                elseif v53.legit_type:get() == 2 then
                    ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"):override("Local View");
                    ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"):override("Disabled");
                    ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"):override(-180);
                    ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"):override(60);
                    ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"):override(60);
                    ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"):override(true);
                    ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"):override("Center");
                    ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"):override(75);
                elseif v53.legit_type:get() == 3 then
                    ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"):override("Local View");
                    ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"):override("Disabled");
                    ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"):override(-180);
                    ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"):override(60);
                    ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"):override(60);
                    ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"):override(true);
                    ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"):override("3-Way");
                    ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"):override(75);
                elseif v53.legit_type:get() == 4 then
                    ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"):override("Local View");
                    ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"):override("Disabled");
                    ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"):override(-180);
                    ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"):override(60);
                    ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"):override(60);
                    ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"):override(true);
                    ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"):override("Disabled");
                    ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden"):override(true);
                    ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"):override("Always On");
                    rage.antiaim:override_hidden_yaw_offset(-math.normalize_yaw(globals.curtime * 650));
                end;
            end;
        end;
    end;
end;
events.createmove:set(legit_aa);
local v838 = {
    draw = function()
        -- upvalues: v55 (ref)
        if not v55.snap_lines:get() then
            return;
        else
            local v833 = entity.get_local_player();
            if v833 == nil then
                return;
            else
                local v834 = entity.get_threat();
                if v834 == nil then
                    return;
                elseif v834:is_dormant() then
                    return;
                else
                    local v835 = color(255, 255, 255, 255);
                    local v836 = v833:get_origin() + vector(0, 0, 40);
                    local v837 = v834:get_origin() + vector(0, 0, 40);
                    render.line(render.world_to_screen(v836), render.world_to_screen(v837), v835);
                    return;
                end;
            end;
        end;
    end
};
events.render:set(v838.draw);
local v839 = {
    teleport_tick = 0, 
    gjioer = false
};
local function v842()
    -- upvalues: v839 (ref), v66 (ref)
    if not ui.find("Aimbot", "Ragebot", "Main", "Double Tap"):get() then
        v839.gjioer = false;
        ui.find("Aimbot", "Anti Aim", "Fake Lag", "Limit"):override(14);
        cvar.sv_maxusrcmdprocessticks:int(16);
    end;
    if ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"):get() then
        v839.gjioer = false;
        ui.find("Aimbot", "Anti Aim", "Fake Lag", "Limit"):override(14);
        cvar.sv_maxusrcmdprocessticks:int(16);
    end;
    local v840 = utils.net_channel().avg_latency[0] * 1000;
    local v841 = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"):get() and ui.find("Aimbot", "Ragebot", "Main", "Peek Assist"):get() and not ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"):get();
    if v66.ideal_peek:get() then
        if v841 then
            ui.find("Aimbot", "Anti Aim", "Fake Lag", "Limit"):override(v840 >= 60 and 8 or v840 <= 30 and 0 or 4);
        else
            ui.find("Aimbot", "Anti Aim", "Fake Lag", "Limit"):override();
        end;
        if v841 then
            if v839.gjioer then
                v839.teleport_tick = v839.teleport_tick + 1;
                if v839.teleport_tick > 1 then
                    v839.gjioer = false;
                    v839.teleport_tick = 0;
                end;
                cvar.sv_maxusrcmdprocessticks:int(23);
            end;
        else
            cvar.sv_maxusrcmdprocessticks:int(13);
        end;
    else
        ui.find("Aimbot", "Anti Aim", "Fake Lag", "Limit"):override(14);
        cvar.sv_maxusrcmdprocessticks:int(16);
    end;
end;
events.aim_ack:set(function(_)
    -- upvalues: v839 (ref)
    v839.gjioer = true;
    v839.teleport_tick = 0;
end);
events.createmove:set(v842);
local v844 = render.load_font("Verdana", 13);
local v845 = {
    alpha = 0
};
local function v852()
    -- upvalues: v66 (ref), v839 (ref), v845 (ref), v8 (ref), v844 (ref), v774 (ref)
    if not v66.ideal_peek:get() then
        return;
    else
        local v846 = entity.get_local_player();
        if not v846 or not v846:is_alive() then
            return;
        else
            local v847 = render.screen_size();
            local v848 = 300;
            local v849 = 0;
            local v850 = v847.x / 2 - v848 / 2;
            local v851 = v847.y / 4 - v849;
            if v839.teleport_tick ~= 0 then
                v845.alpha = 1;
            else
                v845.alpha = v8(v845.alpha, 0, 0.028);
            end;
            if not v66.ideal_peek:get() then
                v845.alpha = 0;
            end;
            if v845.alpha > 0.01 then
                render.text(v844, vector(v850 + v848 / 2, v851 + v849 / 2), color(255, 255, 255, 255 * v845.alpha), "c", v774({
                    [1] = 255, 
                    [2] = 255, 
                    [3] = 255
                }, {
                    [1] = 128, 
                    [2] = 128, 
                    [3] = 128
                }, "TELEPORTING", 5));
            end;
            return;
        end;
    end;
end;
events.render:set(v852);
local function v853()
    -- upvalues: v66 (ref)
    ui.find("Miscellaneous", "Main", "Other", "Fake Latency"):override(v66.ping:get());
end;
events.pre_render:set(v853);
local function v854()
    -- upvalues: v66 (ref)
    cvar.mp_teammates_are_enemies:float(v66.team_aimbot:get() and 1 or 0);
end;
v66.team_aimbot:set_callback(v854);
events.createmove:set(v854);
v854();
local l_world_to_screen_0 = render.world_to_screen;
local l_line_0 = render.line;
local l_screen_size_0 = render.screen_size;
local _ = ui.find;
local v859 = 0.1;
local v860 = 1;
local v861 = {};
local function v873()
    -- upvalues: v55 (ref), v861 (ref), v859 (ref), l_world_to_screen_0 (ref), l_screen_size_0 (ref), l_line_0 (ref)
    if not v55.crosshitmarker:get() then
        return;
    else
        for v862, v863 in pairs(v861) do
            if v863.FadeTime <= 0 then
                v861[v862] = nil;
            else
                v863.WaitTime = v863.WaitTime - globals.frametime;
                if v863.WaitTime <= 0 then
                    v863.FadeTime = v863.FadeTime - 1 / v859 * globals.frametime;
                end;
                if v863.Position.x ~= nil and v863.Position.y ~= nil and v863.Position.z ~= nil and v863.Reason == nil then
                    local v864 = l_world_to_screen_0(vector(v863.Position.x, v863.Position.y, v863.Position.z));
                    if v864 ~= nil then
                        local l_x_1 = v864.x;
                        local l_y_1 = v864.y;
                        local _ = l_screen_size_0();
                        local v868, v869, v870, v871 = v55.hitmarker_color:get():unpack();
                        local v872 = v871 * v863.FadeTime;
                        l_line_0(vector(l_x_1 - 5, l_y_1 - 5), vector(l_x_1 + 5, l_y_1 + 5), color(v868, v869, v870, v872));
                        l_line_0(vector(l_x_1 - 5, l_y_1 + 5), vector(l_x_1 + 5, l_y_1 - 5), color(v868, v869, v870, v872));
                    end;
                end;
            end;
        end;
        return;
    end;
end;
local function v875(v874)
    -- upvalues: v861 (ref), v860 (ref)
    v861[v874.id] = {
        FadeTime = 1, 
        Position = v874.aim, 
        WaitTime = v860, 
        Reason = v874.state
    };
end;
events.render:set(function(_)
    -- upvalues: v873 (ref)
    v873();
end);
events.aim_ack:set(function(v877)
    -- upvalues: v875 (ref)
    v875(v877);
end);
events.round_start:set(function()
    -- upvalues: v861 (ref)
    v861 = {};
end);
events.player_spawned:set(function(_)
    -- upvalues: v861 (ref)
    v861 = {};
end);
local v879 = {
    cl_detail_avoid_radius = cvar.cl_detail_avoid_radius:int(), 
    cl_detail_max_sway = cvar.cl_detail_max_sway:int(), 
    mat_disable_bloom = cvar.mat_disable_bloom:int(), 
    dsp_slow_cpu = cvar.dsp_slow_cpu:int(), 
    func_break_max_pieces = cvar.func_break_max_pieces:int(), 
    fog_end = cvar.fog_end:int(), 
    fog_start = cvar.fog_start:int(), 
    fog_endskybox = cvar.fog_endskybox:int(), 
    fog_enable_water_fog = cvar.fog_enable_water_fog:int(), 
    mat_postprocess_enable = cvar.mat_postprocess_enable:int(), 
    mat_bloomamount_rate = cvar.mat_bloomamount_rate:int(), 
    r_drawtracers = cvar.r_drawtracers:int(), 
    r_drawtracers_firstperson = cvar.r_drawtracers_firstperson:int(), 
    r_dynamic = cvar.r_dynamic:int(), 
    r_eyegloss = cvar.r_eyegloss:int(), 
    r_eyemove = cvar.r_eyemove:int(), 
    mat_queue_mode = cvar.mat_queue_mode:int(), 
    cl_threaded_bone_setup = cvar.cl_threaded_bone_setup:int(), 
    cl_disablehtmlmotd = cvar.cl_disablehtmlmotd:int(), 
    r_drawparticles = cvar.r_drawparticles:int(), 
    muzzleflash_light = cvar.muzzleflash_light:int(), 
    sv_forcepreload = cvar.sv_forcepreload:int(), 
    r_eyeshift_x = cvar.r_eyeshift_x:int(), 
    r_eyeshift_y = cvar.r_eyeshift_y:int(), 
    r_eyeshift_z = cvar.r_eyeshift_z:int(), 
    r_eyesize = cvar.r_eyesize:int()
};
local function v881(v880)
    -- upvalues: v879 (ref)
    cvar.cl_detail_avoid_radius:int(v880 and 0 or v879.cl_detail_avoid_radius);
    cvar.cl_detail_max_sway:int(v880 and 0 or v879.cl_detail_max_sway);
    cvar.mat_disable_bloom:int(v880 and 1 or v879.mat_disable_bloom);
    cvar.dsp_slow_cpu:int(v880 and 1 or v879.dsp_slow_cpu);
    cvar.func_break_max_pieces:int(v880 and 0 or v879.func_break_max_pieces);
    cvar.fog_end:int(v880 and 0 or v879.fog_end);
    cvar.fog_start:int(v880 and 0 or v879.fog_start);
    cvar.fog_endskybox:int(v880 and 0 or v879.fog_endskybox);
    cvar.fog_enable_water_fog:int(v880 and 0 or v879.fog_enable_water_fog);
    cvar.mat_postprocess_enable:int(v880 and 0 or v879.mat_postprocess_enable);
    cvar.mat_bloomamount_rate:int(v880 and 0 or v879.mat_bloomamount_rate);
    cvar.r_drawtracers:int(v880 and 0 or v879.r_drawtracers);
    cvar.r_drawtracers_firstperson:int(v880 and 0 or v879.r_drawtracers_firstperson);
    cvar.r_dynamic:int(v880 and 0 or v879.r_dynamic);
    cvar.r_eyegloss:int(v880 and 0 or v879.r_eyegloss);
    cvar.r_eyemove:int(v880 and 0 or v879.r_eyemove);
    cvar.mat_queue_mode:int(v880 and 2 or v879.mat_queue_mode);
    cvar.cl_threaded_bone_setup:int(v880 and 1 or v879.cl_threaded_bone_setup);
    cvar.cl_disablehtmlmotd:int(v880 and 1 or v879.cl_disablehtmlmotd);
    cvar.r_drawparticles:int(v880 and 0 or v879.r_drawparticles);
    cvar.muzzleflash_light:int(v880 and 0 or v879.muzzleflash_light);
    cvar.sv_forcepreload:int(v880 and 1 or v879.sv_forcepreload);
    cvar.r_eyeshift_x:int(v880 and 0 or v879.r_eyeshift_x);
    cvar.r_eyeshift_y:int(v880 and 0 or v879.r_eyeshift_y);
    cvar.r_eyeshift_z:int(v880 and 0 or v879.r_eyeshift_z);
    cvar.r_eyesize:int(v880 and 0 or v879.r_eyesize);
end;
v66.optimize:set_callback(function()
    -- upvalues: v881 (ref), v66 (ref)
    v881(v66.optimize:get());
end);
events.shutdown:set(function()
    -- upvalues: v881 (ref)
    v881(false);
end);