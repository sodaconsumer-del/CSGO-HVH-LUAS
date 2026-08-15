s_DEBUG = true;
local l_clipboard_0 = require("neverlose/clipboard");
local l_base64_0 = require("neverlose/base64");
local _ = require("neverlose/anti_aim");
local l_http_0 = require("neverlose/http");
local v4 = render.screen_size();
local v5 = "\020\020\020\255";
local v6 = "\f\f\f\255";
local v7 = table.concat({
    [1] = v5, 
    [2] = v5, 
    [3] = v6, 
    [4] = v5, 
    [5] = v6, 
    [6] = v5, 
    [7] = v6, 
    [8] = v5, 
    [9] = v6, 
    [10] = v5, 
    [11] = v5, 
    [12] = v5, 
    [13] = v6, 
    [14] = v5, 
    [15] = v6, 
    [16] = v5
});
local v8 = render.load_image_rgba(v7, vector(4, 4));
RGBAtoHEX = function(v9, v10, v11, v12)
    return string.format("%.2x%.2x%.2x%.2x", v9, v10, v11, v12);
end;
local v13 = {};
local v14 = 0;
local function v16(v15)
    return math.floor(0.5 + v15 / globals.tickinterval);
end;
local v17 = 0;
v13.sim_diff = function(_)
    -- upvalues: v16 (ref), v14 (ref), v17 (ref)
    local v19 = entity.get_local_player();
    if v19 == nil then
        return 0;
    elseif not v19:is_alive() then
        return 0;
    else
        local v20 = v16(v19.m_flSimulationTime);
        local v21 = v20 - v14;
        v14 = v20;
        v17 = v21;
        return v17;
    end;
end;
text_fade_animation = function(v22, v23, v24, v25, v26, v27)
    local v28 = "";
    local v29 = globals.curtime();
    for v30 = 0, #v27 do
        v28 = v28 .. "\a" .. RGBAtoHEX(v23, v24, v25, v26 * math.abs(1 * math.cos(2 * v22 * v29 / 4 + v30 * 5 / 30))) .. v27:sub(v30, v30);
    end;
    return v28;
end;
text_fade_animation_guwno = function(v31, v32, v33, v34, v35, v36)
    local v37 = "";
    local v38 = globals.curtime();
    for v39 = 0, #v36 do
        v37 = v37 .. "\a" .. RGBAtoHEX(v32, v33, v34, v35 * math.abs(1 * math.cos(2 * v31 * v38 / 4 - v39 * 5 / 30))) .. v36:sub(v39, v39);
    end;
    return v37;
end;
gradient_text = function(v40, v41, v42, v43, v44, v45)
    local v46 = "";
    local l_curtime_0 = globals.curtime;
    local v48 = math.floor(#v40 / 2) + 1;
    for v49 = 1, #v40 do
        local v50 = math.abs(v49 - v48);
        v45 = 255 - math.abs(255 * math.sin(v41 * l_curtime_0 / 4 - v50 * 4 / 20));
        v46 = v46 .. "\a" .. RGBAtoHEX(v42, v43, v44, v45) .. v40:sub(v49, v49);
    end;
    return v46;
end;
local v51 = ui.create("\adec3c3ff" .. ui.get_icon("house-user"), "LUA", nil);
local v52 = ui.create("\adec3c3ff" .. ui.get_icon("house-user"), "information", nil);
local v53 = ui.create("\adec3c3ff" .. ui.get_icon("house-user"), "links", 2);
local v54 = ui.create("\adec3c3ff" .. ui.get_icon("house-user"), "configuration", 2);
local v55 = ui.create("\adec3c3ff" .. ui.get_icon("shield-quartered"), "Settings", nil);
local v56 = ui.create("\adec3c3ff" .. ui.get_icon("shield-quartered"), "Builder", nil);
local v57 = ui.create("\adec3c3ff" .. ui.get_icon("shield-quartered"), "Defensive", nil);
local v58 = ui.create("\adec3c3ff" .. ui.get_icon("sparkles"), "Visuals", nil);
local v59 = ui.create("\adec3c3ff" .. ui.get_icon("sparkles"), "Misc", nil);
v51:texture(render.load_image(network.get("https://i.imgur.com/EG1BhCn.png"), vector(270, 280)), vector(270, 280), color(255, 255, 255, 255), "f");
label_anim = v52:label(".");
v52:label("\adec3c3ff" .. ui.get_icon("user") .. "\aFFFFFFFF Username: \adec3c3ff" .. common.get_username());
v52:label("\adec3c3ff" .. ui.get_icon("wand-magic-sparkles") .. "\aFFFFFFFF Build: \adec3c3ffRecode");
v53:button("\adec3c3ff         " .. ui.get_icon("star") .. " \aFFFFFFFFMain cfg        ", function()
    panorama.Open.SteamOverlayAPI.OpenExternalBrowserURL("https://en.neverlose.cc/market/item?id=Mmx615");
end, true);
local v60 = {
    [1] = "General", 
    [2] = "Stand", 
    [3] = "Slow walk", 
    [4] = "Move", 
    [5] = "Duck", 
    [6] = "Aerobic", 
    [7] = "Aerobic+"
};
local v61 = {
    antiaim = {
        delayek = false, 
        freestanding = v55:switch("Freestanding"), 
        avoidback = v55:switch("Anti backstab"), 
        yaw_base = v55:combo("Yaw base", {
            [1] = "Local view", 
            [2] = "At target"
        }), 
        antiaimy = v56:combo("", v60), 
        manuals = v55:switch("Manual Anti-Aim")
    }, 
    visuals = {
        ind = v58:switch("Crosshair indicators"), 
        watermark = v58:switch("Watermark"), 
        defensive_panel = v58:switch("Defensive indicator"), 
        slowed_down_panel = v58:switch("Slowed-down indicator"), 
        hitlogs = v58:switch("Hitlogs"), 
        aspect_ratio = v58:switch("Aspect ratio"), 
        viewmodel_custom = v58:switch("Custom Viewmodel"), 
        antiaim_arrows = v58:switch("Anti-aim Arrows"), 
        menu_border = v58:switch("500$ Menu border")
    }, 
    misc = {
        nade_throw = v59:switch("Nade throw fix"), 
        clantag = v59:switch("Clan-tag"), 
        lagswitch = v59:switch("Lag-switch"), 
        pingspike_limit = v59:switch("Unlock Fake Latency"), 
        hc_override = v59:switch("Hitchance override"), 
        trashtalk = v59:switch("Trashtalk")
    }
};
manual_left = v61.antiaim.manuals:create():switch("Left (BIND)");
manual_right = v61.antiaim.manuals:create():switch("Right (BIND)");
ind_set_style = v61.visuals.ind:create():combo("Style", {
    [1] = "#1", 
    [2] = "#2"
});
ind_set_mod = v61.visuals.ind:create():selectable("Modification", {
    [1] = "In scope", 
    [2] = "Animated"
});
ind_set_color = v61.visuals.ind:create():color_picker("Color", color(222, 195, 195, 255));
watermark_style = v61.visuals.watermark:create():combo("Style", {
    [1] = "Normal", 
    [2] = "Modern", 
    [3] = "500$", 
    [4] = "Shoppy.gg"
});
watermark_options = v61.visuals.watermark:create():selectable("Options", {
    [1] = "fps", 
    [2] = "ping", 
    [3] = "time"
});
watermark_options_2 = v61.visuals.watermark:create():combo("Options", {
    [1] = "Avatar", 
    [2] = "Flag"
});
watermark_color = v61.visuals.watermark:create():color_picker("Color", color(222, 195, 195, 255));
defensive_color = v61.visuals.defensive_panel:create():color_picker("Color", color(222, 195, 195, 255));
slowed_down_color = v61.visuals.slowed_down_panel:create():color_picker("Color", color(222, 195, 195, 255));
hitlogs_type = v61.visuals.hitlogs:create():selectable("Type", {
    [1] = "On screen", 
    [2] = "Under crosshair"
});
hitlogs_style = v61.visuals.hitlogs:create():combo("Style", {
    [1] = "Default", 
    [2] = "Skeet"
});
hitlogs_color = v61.visuals.hitlogs:create():color_picker("Color", color(222, 195, 195, 255));
aspect_ratio_value = v61.visuals.aspect_ratio:create():slider("value", 0, 200, 150, 0.01);
viewmodel_fov = v61.visuals.viewmodel_custom:create():slider("Fov", 0, 100);
viewmodel_x = v61.visuals.viewmodel_custom:create():slider("X", -10, 10, 0);
viewmodel_y = v61.visuals.viewmodel_custom:create():slider("Y", -10, 10, 0);
viewmodel_z = v61.visuals.viewmodel_custom:create():slider("Z", -10, 10, 0);
lag_switch_value = v61.misc.lagswitch:create():slider("Delay", 1, 15, 9);
hc_override_type = v61.misc.hc_override:create():selectable("Condition", {
    [1] = "No scope", 
    [2] = "In air"
});
hc_override_value = v61.misc.hc_override:create():slider("Hitchance", 1, 100, 40);
arrows_antiaim_color = v61.visuals.antiaim_arrows:create():color_picker("Color", color(222, 195, 195, 255));
for v62, _ in pairs(v60) do
    v61.antiaim[v62] = {
        enable = v56:switch("Enable \adec3c3ff" .. v60[v62], false), 
        pitch_x = v56:combo("Pitch", {
            [1] = "Disabled", 
            [2] = "Down", 
            [3] = "Fake Up", 
            [4] = "Fake Down"
        }), 
        yaw = v56:combo("Yaw", {
            [1] = "Disabled", 
            [2] = "Backward", 
            [3] = "Static"
        }), 
        yaw_add_left = v56:slider("Yaw add left", -180, 180, 0), 
        yaw_add_right = v56:slider("Yaw add right", -180, 180, 0), 
        jitter_type = v56:combo("Yaw jitter", {
            [1] = "Disabled", 
            [2] = "Center", 
            [3] = "Offset", 
            [4] = "Random", 
            [5] = "Spin", 
            [6] = "3-Way", 
            [7] = "5-Way"
        }), 
        jitter_add = v56:slider("Yaw jitter value", -180, 180, 0), 
        fake_yaw_limit = v56:slider("Fake-yaw limit", 0, 60, 0), 
        delay = v56:slider("Delay", 0, 10, 0, 1), 
        def_enable = v57:switch("Enable \adec3c3ff" .. v60[v62], false), 
        def_pitch = v57:combo("Pitch", {
            [1] = "Disabled", 
            [2] = "Down", 
            [3] = "Fake Up", 
            [4] = "Fake Down"
        }), 
        def_yaw = v57:combo("Yaw", {
            [1] = "Disabled", 
            [2] = "Backward", 
            [3] = "Static"
        }), 
        def_preset = v57:combo("Preset", {
            [1] = "Disabled", 
            [2] = "Force Defensive"
        }), 
        def_yaw_add = v57:slider("Yaw Add", -180, 180, 0), 
        def_jitter_type = v57:combo("Yaw jitter", {
            [1] = "Disabled", 
            [2] = "Center", 
            [3] = "Offset", 
            [4] = "Random", 
            [5] = "Spin", 
            [6] = "3-Way", 
            [7] = "5-Way"
        }), 
        def_jitter_add = v57:slider("Yaw jitter value", -180, 180, 0)
    };
end;
lol = 0;
haha = 0;
lolp = math.random(1, 5);
v54:button("\adec3c3ff  " .. ui.get_icon("file-export") .. " \aFFFFFFFFExport  ", function()
    -- upvalues: v60 (ref), v61 (ref), l_clipboard_0 (ref), l_base64_0 (ref)
    local v64 = {};
    for v65, _ in pairs(v60) do
        v64[v65] = {};
        for v67, v68 in pairs(v61.antiaim[v65]) do
            v64[v65][v67] = v68:get();
        end;
    end;
    l_clipboard_0.set(l_base64_0.encode(json.stringify(v64)));
end, true);
v54:button("\adec3c3ff  " .. ui.get_icon("file-import") .. " \aFFFFFFFFImport", function()
    import_cfg();
end, true);
import_cfg = function(v69)
    -- upvalues: l_base64_0 (ref), l_clipboard_0 (ref), v60 (ref), v61 (ref)
    local v70 = l_base64_0.decode(v69 ~= nil and v69 or l_clipboard_0.get());
    v70 = json.parse(v70);
    for v71, _ in pairs(v60) do
        for v73, v74 in pairs(v61.antiaim[v71]) do
            v74:set(v70[v71][v73]);
        end;
    end;
end;
v54:button("\adec3c3ff  " .. ui.get_icon("file-pen") .. " \aFFFFFFFFDefault  ", function()
    import_cfg("W3siZGVmX2VuYWJsZSI6ZmFsc2UsImRlZl9qaXR0ZXJfYWRkIjowLjAsImRlZl9qaXR0ZXJfdHlwZSI6IkRpc2FibGVkIiwiZGVmX3BpdGNoIjoiRGlzYWJsZWQiLCJkZWZfcHJlc2V0IjoiRGlzYWJsZWQiLCJkZWZfeWF3IjoiRGlzYWJsZWQiLCJkZWZfeWF3X2FkZCI6MC4wLCJkZWxheSI6MC4wLCJlbmFibGUiOmZhbHNlLCJmYWtlX3lhd19saW1pdCI6MC4wLCJqaXR0ZXJfYWRkIjowLjAsImppdHRlcl90eXBlIjoiRGlzYWJsZWQiLCJwaXRjaF94IjoiRGlzYWJsZWQiLCJ5YXciOiJEaXNhYmxlZCIsInlhd19hZGRfbGVmdCI6MC4wLCJ5YXdfYWRkX3JpZ2h0IjowLjB9LHsiZGVmX2VuYWJsZSI6ZmFsc2UsImRlZl9qaXR0ZXJfYWRkIjowLjAsImRlZl9qaXR0ZXJfdHlwZSI6IkRpc2FibGVkIiwiZGVmX3BpdGNoIjoiRGlzYWJsZWQiLCJkZWZfcHJlc2V0IjoiRGlzYWJsZWQiLCJkZWZfeWF3IjoiRGlzYWJsZWQiLCJkZWZfeWF3X2FkZCI6MC4wLCJkZWxheSI6MC4wLCJlbmFibGUiOnRydWUsImZha2VfeWF3X2xpbWl0Ijo2MC4wLCJqaXR0ZXJfYWRkIjotODQuMCwiaml0dGVyX3R5cGUiOiJDZW50ZXIiLCJwaXRjaF94IjoiRG93biIsInlhdyI6IkJhY2t3YXJkIiwieWF3X2FkZF9sZWZ0IjowLjAsInlhd19hZGRfcmlnaHQiOjAuMH0seyJkZWZfZW5hYmxlIjpmYWxzZSwiZGVmX2ppdHRlcl9hZGQiOjAuMCwiZGVmX2ppdHRlcl90eXBlIjoiRGlzYWJsZWQiLCJkZWZfcGl0Y2giOiJEaXNhYmxlZCIsImRlZl9wcmVzZXQiOiJEaXNhYmxlZCIsImRlZl95YXciOiJEaXNhYmxlZCIsImRlZl95YXdfYWRkIjowLjAsImRlbGF5Ijo2LjAsImVuYWJsZSI6dHJ1ZSwiZmFrZV95YXdfbGltaXQiOjAuMCwiaml0dGVyX2FkZCI6MTA4LjAsImppdHRlcl90eXBlIjoiRGlzYWJsZWQiLCJwaXRjaF94IjoiRG93biIsInlhdyI6IkJhY2t3YXJkIiwieWF3X2FkZF9sZWZ0IjozMS4wLCJ5YXdfYWRkX3JpZ2h0IjotMjIuMH0seyJkZWZfZW5hYmxlIjpmYWxzZSwiZGVmX2ppdHRlcl9hZGQiOjAuMCwiZGVmX2ppdHRlcl90eXBlIjoiRGlzYWJsZWQiLCJkZWZfcGl0Y2giOiJEaXNhYmxlZCIsImRlZl9wcmVzZXQiOiJEaXNhYmxlZCIsImRlZl95YXciOiJEaXNhYmxlZCIsImRlZl95YXdfYWRkIjowLjAsImRlbGF5Ijo3LjAsImVuYWJsZSI6dHJ1ZSwiZmFrZV95YXdfbGltaXQiOjAuMCwiaml0dGVyX2FkZCI6MC4wLCJqaXR0ZXJfdHlwZSI6IkRpc2FibGVkIiwicGl0Y2hfeCI6IkRvd24iLCJ5YXciOiJCYWNrd2FyZCIsInlhd19hZGRfbGVmdCI6LTExLjAsInlhd19hZGRfcmlnaHQiOjIzLjB9LHsiZGVmX2VuYWJsZSI6ZmFsc2UsImRlZl9qaXR0ZXJfYWRkIjowLjAsImRlZl9qaXR0ZXJfdHlwZSI6IkRpc2FibGVkIiwiZGVmX3BpdGNoIjoiRGlzYWJsZWQiLCJkZWZfcHJlc2V0IjoiRGlzYWJsZWQiLCJkZWZfeWF3IjoiRGlzYWJsZWQiLCJkZWZfeWF3X2FkZCI6MC4wLCJkZWxheSI6Ni4wLCJlbmFibGUiOnRydWUsImZha2VfeWF3X2xpbWl0IjoxMC4wLCJqaXR0ZXJfYWRkIjowLjAsImppdHRlcl90eXBlIjoiRGlzYWJsZWQiLCJwaXRjaF94IjoiRG93biIsInlhdyI6IkJhY2t3YXJkIiwieWF3X2FkZF9sZWZ0IjotNy4wLCJ5YXdfYWRkX3JpZ2h0IjoxMi4wfSx7ImRlZl9lbmFibGUiOmZhbHNlLCJkZWZfaml0dGVyX2FkZCI6MC4wLCJkZWZfaml0dGVyX3R5cGUiOiJEaXNhYmxlZCIsImRlZl9waXRjaCI6IkRpc2FibGVkIiwiZGVmX3ByZXNldCI6IkRpc2FibGVkIiwiZGVmX3lhdyI6IkRpc2FibGVkIiwiZGVmX3lhd19hZGQiOjAuMCwiZGVsYXkiOjcuMCwiZW5hYmxlIjp0cnVlLCJmYWtlX3lhd19saW1pdCI6MC4wLCJqaXR0ZXJfYWRkIjowLjAsImppdHRlcl90eXBlIjoiRGlzYWJsZWQiLCJwaXRjaF94IjoiRG93biIsInlhdyI6IkJhY2t3YXJkIiwieWF3X2FkZF9sZWZ0IjotMjMuMCwieWF3X2FkZF9yaWdodCI6MzEuMH0seyJkZWZfZW5hYmxlIjpmYWxzZSwiZGVmX2ppdHRlcl9hZGQiOjAuMCwiZGVmX2ppdHRlcl90eXBlIjoiRGlzYWJsZWQiLCJkZWZfcGl0Y2giOiJEaXNhYmxlZCIsImRlZl9wcmVzZXQiOiJEaXNhYmxlZCIsImRlZl95YXciOiJEaXNhYmxlZCIsImRlZl95YXdfYWRkIjowLjAsImRlbGF5Ijo4LjAsImVuYWJsZSI6dHJ1ZSwiZmFrZV95YXdfbGltaXQiOjAuMCwiaml0dGVyX2FkZCI6MC4wLCJqaXR0ZXJfdHlwZSI6IkRpc2FibGVkIiwicGl0Y2hfeCI6IkRvd24iLCJ5YXciOiJCYWNrd2FyZCIsInlhd19hZGRfbGVmdCI6LTE1LjAsInlhd19hZGRfcmlnaHQiOjIyLjB9XQ==");
end, true);
local v75 = nil;
local function v78()
    -- upvalues: l_http_0 (ref), v75 (ref)
    l_http_0.get(string.format("https://flagcdn.com/w160/%s.png", panorama.MyPersonaAPI.GetMyCountryCode():lower()), function(v76, v77)
        -- upvalues: v75 (ref)
        if not v76 or v77.status ~= 200 then
            print("couldnt fetch the flag image");
            return;
        else
            v75 = render.load_image(v77.body, vector(25, 16.8));
            return;
        end;
    end);
end;
v78();
desync_delta = function()
    local v79 = rage.antiaim:get_rotation(true);
    local v80 = rage.antiaim:get_rotation();
    local v81 = math.min(math.abs(v80 - v79) / 2, 60);
    return string.format("%.1f", v81);
end;
local v82 = desync_delta();
local l_curtime_1 = globals.curtime;
local function v91()
    local v84 = entity.get_local_player();
    if not v84:is_alive() then
        return;
    else
        local l_m_vecVelocity_0 = v84.m_vecVelocity;
        local v86 = math.sqrt(l_m_vecVelocity_0.x ^ 2 + l_m_vecVelocity_0.y ^ 2);
        local v87 = bit.band(v84.m_fFlags, 1) == 1;
        local v88 = v86 < 2;
        local v89 = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"):get();
        local _ = v84.m_iTeamNum;
        if not v87 then
            return v84.m_flDuckAmount > 0.7 and 7 or 6;
        elseif v84.m_flDuckAmount > 0.7 then
            return 5;
        elseif v88 then
            return 2;
        elseif not v88 then
            if v89 then
                return 3;
            else
                return 4;
            end;
        else
            return;
        end;
    end;
end;
local _ = 0;
contains = function(v93, v94)
    for v95 = 1, #v93 do
        if v93[v95] == v94 then
            return true;
        end;
    end;
    return false;
end;
local v96 = 0;
local v97 = 0;
local v98 = 0;
local v99 = 0;
local v100 = 0;
local v101 = 0;
local v102 = "no";
lerp = function(v103, v104, v105)
    return v103 + (v104 - v103) * v105;
end;
calculatePercentage = function(v106, v107)
    return v106 / v107 * 100;
end;
local v108 = 0;
local v109 = 0;
local v110 = {};
render_ogskeet_border = function(v111, v112, v113, v114, v115, v116)
    -- upvalues: v8 (ref)
    render.rect(vector(v111 - 10, v112 - 48), vector(v111 - 10 + v113 + 20, v112 - 48 + v114 + 16), color(12, 12, 12, v115), 0, false);
    render.rect(vector(v111 - 9, v112 - 47), vector(v111 - 9 + v113 + 18, v112 - 47 + v114 + 14), color(60, 60, 60, v115), 0, false);
    render.rect(vector(v111 - 8, v112 - 46), vector(v111 - 8 + v113 + 16, v112 - 46 + v114 + 12), color(40, 40, 40, v115), 0, false);
    render.rect(vector(v111 - 5, v112 - 43), vector(v111 - 5 + v113 + 10, v112 - 43 + v114 + 6), color(60, 60, 60, v115), 0, false);
    render.rect(vector(v111 - 4, v112 - 42), vector(v111 - 4 + v113 + 8, v112 - 42 + v114 + 4), color(12, 12, 12, v115), 0, false);
    render.texture(v8, vector(v111 - 4, v112 - 42), vector(v113 + 8, v114 + 4), color(255, 255, 255, v115), "r");
    render.gradient(vector(v111 - 4, v112 - 42), vector(v111 - 4 + v113 / 2, v112 - 42 + 1), color(59, 175, 222, 255), color(202, 70, 205, 255), color(59, 175, 222, 255), color(202, 70, 205, 255), 0);
    render.gradient(vector(v111 - 4 + v113 / 2, v112 - 42), vector(v111 - 4 + v113 / 2 + v113 / 2 + 8, v112 - 42 + 1), color(202, 70, 205, 255), color(204, 227, 53), color(202, 70, 205, 255), color(204, 227, 53), 0);
    render.text(1, vector(v111, v112 - 40), color(255, 255, 255, 230), "", v116);
end;
local v117 = {
    [1] = "B", 
    [2] = "Bl", 
    [3] = "Blo", 
    [4] = "Bloo", 
    [5] = "Blood", 
    [6] = "BloodW", 
    [7] = "BloodWi", 
    [8] = "BloodWin", 
    [9] = "BloodWing", 
    [10] = "BloodWings", 
    [11] = "\240\147\134\169\240\147\134\170BloodWings\240\147\134\169\240\147\134\170", 
    [12] = "\240\147\134\169\240\147\134\170BloodWings\240\147\134\169\240\147\134\170", 
    [13] = "\226\136\142", 
    [14] = "\226\136\142\226\136\142", 
    [15] = "\226\136\142\226\136\142\226\136\142", 
    [16] = "\226\136\142\226\136\142", 
    [17] = "\226\136\142", 
    [18] = "BloodWings", 
    [19] = "BloodWing", 
    [20] = "BloodWin", 
    [21] = "BloodWi", 
    [22] = "BloodW", 
    [23] = "Blood", 
    [24] = "Bloo", 
    [25] = "Blo", 
    [26] = "Bl", 
    [27] = "B", 
    [28] = ""
};
local v118 = nil;
local v119 = ui.find("Miscellaneous", "Main", "Other", "Weapon Actions"):get();
local v120 = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"):get();
local v190 = (function()
    -- upvalues: v60 (ref), v61 (ref), v108 (ref), v109 (ref), v120 (ref), l_curtime_1 (ref), v82 (ref), v96 (ref), v98 (ref), v97 (ref), v99 (ref), v100 (ref), v91 (ref), v4 (ref), v75 (ref), v78 (ref), v13 (ref), v102 (ref), v101 (ref), v110 (ref), v117 (ref), v118 (ref), v119 (ref)
    local v138 = {
        renders = {
            glow_module = function(v121, v122, v123, v124, v125, v126, v127, v128, v129, v130, v131, v132, v133, v134)
                render.shadow(vector(v121, v122), vector(v123, v124), color(v132, v133, v134, v129), v125, 0, 0);
                if v131 then
                    render.rect(vector(v121 - 1, v122 - 1), vector(v123 + 2, v124 + 1), color(v126, v127, v128, v129), v130, true);
                end;
            end
        }, 
        ogmenu = {
            set = function()
                -- upvalues: v60 (ref), v61 (ref)
                for v135, v136 in pairs(v60) do
                    v61.antiaim[v135].enable:visibility(v61.antiaim.antiaimy:get() == v136);
                    v61.antiaim[v135].pitch_x:visibility(v61.antiaim[v135].enable:get() and v61.antiaim.antiaimy:get() == v136);
                    v61.antiaim[v135].yaw:visibility(v61.antiaim[v135].enable:get() and v61.antiaim.antiaimy:get() == v136);
                    v61.antiaim[v135].yaw_add_left:visibility(v61.antiaim[v135].enable:get() and v61.antiaim.antiaimy:get() == v136 and v61.antiaim[v135].yaw:get() ~= "Disabled");
                    v61.antiaim[v135].yaw_add_right:visibility(v61.antiaim[v135].enable:get() and v61.antiaim.antiaimy:get() == v136 and v61.antiaim[v135].yaw:get() ~= "Disabled");
                    v61.antiaim[v135].jitter_type:visibility(v61.antiaim[v135].enable:get() and v61.antiaim.antiaimy:get() == v136);
                    v61.antiaim[v135].jitter_add:visibility(v61.antiaim[v135].enable:get() and v61.antiaim.antiaimy:get() == v136 and v61.antiaim[v135].jitter_type:get() ~= "Disabled");
                    v61.antiaim[v135].fake_yaw_limit:visibility(v61.antiaim[v135].enable:get() and v61.antiaim.antiaimy:get() == v136);
                    v61.antiaim[v135].delay:visibility(v61.antiaim[v135].enable:get() and v61.antiaim.antiaimy:get() == v136);
                    local v137 = v61.antiaim[v135].def_preset:get() ~= "Disabled";
                    v61.antiaim[v135].def_enable:visibility(v61.antiaim[v135].enable:get() and v61.antiaim.antiaimy:get() == v136 and not v137);
                    v61.antiaim[v135].def_preset:visibility(v61.antiaim[v135].enable:get() and v61.antiaim.antiaimy:get() == v136 and v61.antiaim[v135].def_enable:get());
                    v61.antiaim[v135].def_pitch:visibility(v61.antiaim[v135].enable:get() and v61.antiaim.antiaimy:get() == v136 and v61.antiaim[v135].def_enable:get() and not v137);
                    v61.antiaim[v135].def_yaw_add:visibility(v61.antiaim[v135].enable:get() and v61.antiaim.antiaimy:get() == v136 and v61.antiaim[v135].def_enable:get() and not v137);
                    v61.antiaim[v135].def_yaw:visibility(v61.antiaim[v135].enable:get() and v61.antiaim.antiaimy:get() == v136 and v61.antiaim[v135].def_enable:get() and not v137);
                    v61.antiaim[v135].def_jitter_type:visibility(v61.antiaim[v135].enable:get() and v61.antiaim.antiaimy:get() == v136 and v61.antiaim[v135].def_enable:get() and not v137);
                    v61.antiaim[v135].def_jitter_add:visibility(v61.antiaim[v135].enable:get() and v61.antiaim.antiaimy:get() == v136 and v61.antiaim[v135].def_enable:get() and v61.antiaim[v135].def_jitter_type:get() ~= "Disabled" and not v137);
                end;
                ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"):disabled(true);
            end
        }
    };
    v138.is_defensive_active = {
        time_to_ticks = function(v139)
            return math.floor(0.5 + v139 / globals.tickinterval);
        end, 
        check = function()
            -- upvalues: v138 (ref), v108 (ref), v109 (ref)
            local l_tickcount_0 = globals.tickcount;
            local v141 = v138.is_defensive_active.time_to_ticks(entity.get_local_player().m_flSimulationTime);
            local v142 = v141 - v108;
            if v142 < 0 then
                v109 = l_tickcount_0 + math.abs(v142) - v138.is_defensive_active.time_to_ticks(utils.net_channel().latency[1]);
            end;
            v108 = v141;
            return l_tickcount_0 < v109;
        end
    };
    v138.pingspike = {
        limit_remove = function()
            -- upvalues: v61 (ref)
            if v61.misc.pingspike_limit:get() then
                cvar.sv_maxunlag:float(0.4);
            else
                cvar.sv_maxunlag:float(0.2);
            end;
        end
    };
    v138.hitchance_override = {
        run = function(v143)
            -- upvalues: v61 (ref)
            local v144 = entity.get_local_player();
            if not v144 then
                return;
            else
                local v145 = v144:get_player_weapon();
                if v145 == nil then
                    return;
                else
                    local v146 = v145:get_weapon_index() == 38 or not (v145:get_weapon_index() ~= 11) or not (v145:get_weapon_index() ~= 9) or v145:get_weapon_index() == 40;
                    if v61.misc.hc_override:get() then
                        if contains(hc_override_type:get(), "No scope") and v146 and not v144.m_bIsScoped then
                            ui.find("Aimbot", "Ragebot", "Selection", "Hit Chance"):override(hc_override_value:get());
                        end;
                        if contains(hc_override_type:get(), "In air") and v146 and v143.in_jump then
                            ui.find("Aimbot", "Ragebot", "Selection", "Hit Chance"):override(hc_override_value:get());
                        end;
                        if (not contains(hc_override_type:get(), "No scope") or not v146 or v143.in_jump or not not v144.m_bIsScoped) and (not contains(hc_override_type:get(), "In air") or not v146 or not v143.in_jump) then
                            ui.find("Aimbot", "Ragebot", "Selection", "Hit Chance"):override();
                        end;
                    end;
                    return;
                end;
            end;
        end
    };
    v138.antiaim = {
        createmove = function(_, v148)
            -- upvalues: v61 (ref), v138 (ref), v120 (ref)
            if v61.antiaim[v148].delay:get() ~= 0 then
                if globals.tickcount % v61.antiaim[v148].delay:get() + 3 == 3 then
                    v61.antiaim.delayek = not v61.antiaim.delayek;
                end;
            else
                bodyyaw = entity.get_local_player().m_flPoseParameter[11] * 120 - 60;
                side = bodyyaw > 0 and 1 or -1;
            end;
            if v138.is_defensive_active.check() and v61.antiaim[v148].def_enable:get() then
                if v61.antiaim[v148].def_pitch:get() ~= "Custom" then
                    ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"):override(v61.antiaim[v148].def_pitch:get());
                else
                    rage.antiaim:override_hidden_pitch(v61.antiaim[v148].def_custom_pitch:get());
                end;
                ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"):override(v61.antiaim[v148].def_yaw:get());
                ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"):override(v61.antiaim[v148].def_yaw_add:get());
                ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"):override(v61.antiaim[v148].def_jitter_type:get());
                ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"):override(v61.antiaim[v148].def_jitter_add:get());
                if v61.antiaim[v148].def_preset:get() ~= "Disabled" then
                    if lol <= 175 then
                        lol = lol + math.random(0, 4);
                    else
                        lol = -(lol + 175) + 25;
                    end;
                    ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"):override(lol);
                end;
            else
                ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"):override(v61.antiaim[v148].pitch_x:get());
                ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"):override(v61.antiaim[v148].yaw:get());
                if v61.antiaim[v148].delay:get() ~= 0 then
                    ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"):reset();
                    ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"):override(v61.antiaim.delayek and v61.antiaim[v148].yaw_add_left:get() or v61.antiaim[v148].yaw_add_right:get());
                else
                    ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"):override(v120);
                    ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"):override(side == 1 and v61.antiaim[v148].yaw_add_left:get() or v61.antiaim[v148].yaw_add_right:get());
                end;
                ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"):override(v61.antiaim[v148].jitter_type:get());
                ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"):override(v61.antiaim[v148].jitter_add:get());
                ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"):override(v61.antiaim[v148].fake_yaw_limit:get());
                ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"):override(v61.antiaim[v148].fake_yaw_limit:get());
            end;
            if v61.antiaim.manuals:get() then
                if manual_left:get() then
                    ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"):override(-90);
                elseif manual_right:get() then
                    ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"):override(90);
                end;
            end;
            if v61.misc.lagswitch:get() then
                local v149 = entity.get_local_player();
                if v149 == nil then
                    return;
                else
                    local v150 = v149.m_nTickBase % lag_switch_value:get() == 0;
                    if bit.band(v149.m_fFlags, 1) == 0 then
                        ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"):override(v150);
                    else
                        ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"):override(false);
                    end;
                end;
            end;
        end
    };
    v138.visuals = {
        render = function()
            -- upvalues: l_curtime_1 (ref), v82 (ref), v96 (ref), v98 (ref), v97 (ref), v99 (ref), v100 (ref), v91 (ref), v60 (ref), v61 (ref), v4 (ref)
            if l_curtime_1 + 0.38 < globals.curtime then
                l_curtime_1 = globals.curtime;
                v82 = desync_delta();
            end;
            lp = entity.get_local_player();
            if not lp then
                return;
            else
                local v151 = {
                    [1] = {
                        [1] = ind_set_color:get().r, 
                        [2] = ind_set_color:get().g, 
                        [3] = ind_set_color:get().b, 
                        [4] = 255 * math.abs(1 * math.cos(2 * math.pi * globals.curtime / 4 + 2.6666666666666665))
                    }, 
                    [2] = {
                        [1] = ind_set_color:get().r, 
                        [2] = ind_set_color:get().g, 
                        [3] = ind_set_color:get().b, 
                        [4] = 255 * math.abs(1 * math.cos(2 * math.pi * globals.curtime / 4 + 2.5))
                    }, 
                    [3] = {
                        [1] = ind_set_color:get().r, 
                        [2] = ind_set_color:get().g, 
                        [3] = ind_set_color:get().b, 
                        [4] = 255 * math.abs(1 * math.cos(2 * math.pi * globals.curtime / 4 + 2.3333333333333335))
                    }, 
                    [4] = {
                        [1] = ind_set_color:get().r, 
                        [2] = ind_set_color:get().g, 
                        [3] = ind_set_color:get().b, 
                        [4] = 255 * math.abs(1 * math.cos(2 * math.pi * globals.curtime / 4 + 2.1666666666666665))
                    }, 
                    [5] = {
                        [1] = ind_set_color:get().r, 
                        [2] = ind_set_color:get().g, 
                        [3] = ind_set_color:get().b, 
                        [4] = 255 * math.abs(1 * math.cos(2 * math.pi * globals.curtime / 4 + 2))
                    }, 
                    [6] = {
                        [1] = ind_set_color:get().r, 
                        [2] = ind_set_color:get().g, 
                        [3] = ind_set_color:get().b, 
                        [4] = 255 * math.abs(1 * math.cos(2 * math.pi * globals.curtime / 4 + 1.8333333333333333))
                    }, 
                    [7] = {
                        [1] = ind_set_color:get().r, 
                        [2] = ind_set_color:get().g, 
                        [3] = ind_set_color:get().b, 
                        [4] = 255 * math.abs(1 * math.cos(2 * math.pi * globals.curtime / 4 + 1.6666666666666667))
                    }, 
                    [8] = {
                        [1] = ind_set_color:get().r, 
                        [2] = ind_set_color:get().g, 
                        [3] = ind_set_color:get().b, 
                        [4] = 255 * math.abs(1 * math.cos(2 * math.pi * globals.curtime / 4 + 1.5))
                    }, 
                    [9] = {
                        [1] = ind_set_color:get().r, 
                        [2] = ind_set_color:get().g, 
                        [3] = ind_set_color:get().b, 
                        [4] = 255 * math.abs(1 * math.cos(2 * math.pi * globals.curtime / 4 + 1.3333333333333333))
                    }
                };
                if contains(ind_set_mod:get(), "In scope") then
                    v96 = lerp(v96, lp.m_bIsScoped == true and 27 or 0, 10 * globals.frametime);
                    v98 = lerp(v98, lp.m_bIsScoped == true and 1 or 0, 10 * globals.frametime);
                    v97 = lp.m_bIsScoped == true and 4 or 0;
                    v99 = lp.m_bIsScoped == true and 2000 or 0;
                    v100 = lerp(v100, lp.m_bIsScoped == true and 9 or 0, 17 * globals.frametime);
                end;
                if v91() == nil then
                    return;
                else
                    local _ = render.measure_text(1, "c", "" .. v60[v91()]:upper() .. "");
                    local v153 = {
                        [1] = {
                            text = "DT", 
                            color = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"):get() == true and ind_set_color:get() or color(92, 92, 92)
                        }, 
                        [2] = {
                            text = "OS", 
                            color = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"):get() == true and ind_set_color:get() or color(92, 92, 92)
                        }, 
                        [3] = {
                            text = "QP", 
                            color = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist"):get() == true and ind_set_color:get() or color(92, 92, 92)
                        }, 
                        [4] = {
                            text = "FS", 
                            color = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"):get_override() == true and ind_set_color:get() or color(92, 92, 92)
                        }
                    };
                    local v154 = {
                        [1] = {
                            text = "DT", 
                            color = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"):get() and ind_set_color:get() or {
                                g = 92, 
                                b = 92, 
                                r = 92
                            }
                        }, 
                        [2] = {
                            text = "OS", 
                            color = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"):get() and ind_set_color:get() or {
                                g = 92, 
                                b = 92, 
                                r = 92
                            }
                        }
                    };
                    if v61.visuals.ind:get() and lp:is_alive() then
                        if ind_set_style:get() == "#1" then
                            if not contains(ind_set_mod:get(), "Animated") then
                                render.text(2, vector(lp.m_bIsScoped == true and v4.x / 2 + (v96 - v97) or v4.x / 2 + v96, v4.y / 2 + 17), color(ind_set_color:get().r, ind_set_color:get().g, ind_set_color:get().b, ind_set_color:get().a), "c", string.upper("Bloodwings"));
                            else
                                render.text(2, vector(lp.m_bIsScoped == true and v4.x / 2 + (v96 - v97) or v4.x / 2 + v96, v4.y / 2 + 17), color(ind_set_color:get().r, ind_set_color:get().g, ind_set_color:get().b, ind_set_color:get().a), "c", string.upper(string.format("\a%sb\a%sl\a%so\a%so\a%sd\a%sw\a%si\a%sn\a%sg\a%ss", RGBAtoHEX(unpack(v151[1])), RGBAtoHEX(unpack(v151[2])), RGBAtoHEX(unpack(v151[3])), RGBAtoHEX(unpack(v151[4])), RGBAtoHEX(unpack(v151[5])), RGBAtoHEX(unpack(v151[6])), RGBAtoHEX(unpack(v151[7])), RGBAtoHEX(unpack(v151[8])), RGBAtoHEX(unpack(v151[9])), RGBAtoHEX(unpack(v151[9])))));
                            end;
                            render.text(2, vector(lp.m_bIsScoped == true and v4.x / 2 + (v96 + v99) or v4.x / 2 + v96, v4.y / 2 + 26), color(92, 92, 92, 255), "c", v60[v91()]:upper());
                            for v155, v156 in pairs(v153) do
                                render.text(2, vector(v4.x / 2 + v96 - 29 + v155 * 12, v4.y / 2 + 35 - v100), color(v156.color.r, v156.color.g, v156.color.b), "c", v156.text);
                            end;
                        end;
                        if ind_set_style:get() == "#2" then
                            render.text(2, vector(v4.x / 2 + 20 * v98, v4.y / 2 + 17), color(ind_set_color:get().r, ind_set_color:get().g, ind_set_color:get().b, ind_set_color:get().a), "c", string.upper("Bloodwings"));
                            render.text(2, vector(v4.x / 2 + 10 * v98, v4.y / 2 + 27), color(255, 255, 255, 255), "c", math.floor(v82) .. "%");
                            for v157, v158 in pairs(v154) do
                                render.text(2, vector(v4.x / 2 + 13 * v98 - 18 + v157 * 12, v4.y / 2 + 37), color(v158.color.r, v158.color.g, v158.color.b), "c", v158.text);
                            end;
                        end;
                    end;
                    return;
                end;
            end;
        end
    };
    v138.arrows_antiaim = {
        render = function()
            -- upvalues: v61 (ref), v4 (ref)
            local v159 = entity.get_local_player();
            if not v159 then
                return;
            else
                bodyyaw = v159.m_flPoseParameter[11] * 120 - 60;
                side = bodyyaw > 0 and 1 or -1;
                if v61.visuals.antiaim_arrows:get() then
                    render.poly(manual_right:get() and color(75, 75, 75, 190) or color(25, 25, 25, 160), vector(v4.x / 2 + 44, v4.y / 2 + 9), vector(v4.x / 2 + 57, v4.y / 2), vector(v4.x / 2 + 44, v4.y / 2 - 9));
                    render.poly(manual_left:get() and color(75, 75, 75, 190) or color(25, 25, 25, 160), vector(v4.x / 2 - 44, v4.y / 2 + 9), vector(v4.x / 2 - 57, v4.y / 2), vector(v4.x / 2 - 44, v4.y / 2 - 9));
                    render.rect(vector(v4.x / 2 - 41, v4.y / 2 - 9), vector(v4.x / 2 - 43, v4.y / 2 + 9), side == 1 and color(arrows_antiaim_color:get().r, arrows_antiaim_color:get().g, arrows_antiaim_color:get().b, 255) or color(25, 25, 25, 160));
                    render.rect(vector(v4.x / 2 + 41, v4.y / 2 - 9), vector(v4.x / 2 - 43, v4.y / 2 + 9), side == 1 and color(25, 25, 25, 160) or color(arrows_antiaim_color:get().r, arrows_antiaim_color:get().g, arrows_antiaim_color:get().b, 255));
                end;
                return;
            end;
        end
    };
    v138.watermark = {
        render = function()
            -- upvalues: v61 (ref), v4 (ref), v75 (ref), v78 (ref)
            if v61.visuals.watermark:get() then
                if watermark_style:get() == "Normal" then
                    local v160 = "\aFFFFFFFFBloodwings [recode]\a5C5C5CFF/\aFFFFFFFF " .. common.get_username() .. " \a5C5C5CFF/\aFFFFFFFF " .. common.get_date("%H:%M:%S");
                    local v161 = render.measure_text(1, nil, v160);
                    render.gradient(vector(v4.x - 25 - v161.x, 13), vector(v4.x, 34), color(watermark_color:get().r, watermark_color:get().g, watermark_color:get().b, 0), watermark_color:get(), color(watermark_color:get().r, watermark_color:get().g, watermark_color:get().b, 0), watermark_color:get());
                    render.text(1, vector(v4.x - 5 - v161.x / 2, 23), color(255, 255, 255, 255), "c", v160);
                end;
                if watermark_style:get() == "Modern" then
                    local v162 = entity.get_local_player();
                    if not v162 then
                        return;
                    else
                        local v163 = v162:get_steam_avatar();
                        if v75 ~= nil then
                            local v164 = render.measure_text(2, nil, "BLOODWINGS RECODE");
                            render.gradient(vector(2.5, v4.y / 2 + 35 - 2), vector(2.5 + v164.x * 2, v4.y / 2 + 35 - 2 + v164.y * 2), watermark_color:get(), color(watermark_color:get().r, watermark_color:get().g, watermark_color:get().b, 0), watermark_color:get(), color(watermark_color:get().r, watermark_color:get().g, watermark_color:get().b, 0));
                            if watermark_options_2:get() == "Flag" then
                                render.texture(v75, vector(5, v4.y / 2 + 35 - 2 + 4));
                            else
                                render.texture(v163, vector(5, v4.y / 2 + 35 - 2 + 4), vector(25, 16.8), color(255, 255, 255, 255));
                            end;
                            render.text(2, vector(35, v4.y / 2 + 35 - 2 + 2), color(255, 255, 255, 255), nil, gradient_text(string.upper("bloodwings RECODE"), 5, 255, 255, 255, 255));
                            render.text(2, vector(35, v4.y / 2 + 35 - 2 + 10), color(255, 255, 255, 255), nil, string.upper("\a" .. RGBAtoHEX(watermark_color:get().r, watermark_color:get().g, watermark_color:get().b, 255) .. common.get_username()));
                        else
                            v78();
                        end;
                    end;
                end;
                if watermark_style:get() == "Shoppy.gg" then
                    render.text(1, vector(v4.x - 200, 45), color(255), nil, "shoppy.gg/@bloodwings\t");
                    render.shadow(vector(v4.x - 200, 61), vector(v4.x - 32, 45), color(255, 255, 255, 255), 20, 0, 0);
                end;
                if watermark_style:get() == "500$" then
                    local l_r_0 = watermark_color:get().r;
                    local l_g_0 = watermark_color:get().g;
                    local l_b_0 = watermark_color:get().b;
                    local v168 = "\affffffe5bloodwings\a" .. RGBAtoHEX(l_r_0, l_g_0, l_b_0, 230) .. " RECODE\affffffe5 | " .. common.get_username() .. "";
                    if contains(watermark_options:get(), "fps") then
                        local v169 = globals.is_connected and 1 / globals.frametime or 0;
                        v168 = v168 .. " | " .. math.floor(v169) .. "fps";
                    end;
                    if contains(watermark_options:get(), "ping") then
                        local v170 = globals.is_connected and utils.net_channel().latency[1] * 1000 or 0;
                        v168 = v168 .. " | " .. math.floor(v170) .. "ms\affffffe5";
                    end;
                    if contains(watermark_options:get(), "time") then
                        local v171 = common.get_system_time();
                        local v172 = string.format("%02d", v171.hours);
                        minutes = string.format("%02d", v171.minutes);
                        hours = v172;
                        v168 = v168 .. " | " .. hours .. ":" .. minutes .. "";
                    end;
                    local v173 = render.measure_text(1, nil, v168);
                    render_ogskeet_border(v4.x - v173.x - 20, 55, v173.x + 2, 12, 255, v168);
                end;
            else
                local v174 = math.sin(globals.realtime * 2.3) * 15;
                render.text(1, vector(v4.x / 2, v4.y - 30 - v174), color(255, 255, 255, 255), "c", gradient_text("bloodwings", 6, watermark_color:get().r, watermark_color:get().g, watermark_color:get().b, 255));
            end;
        end
    };
    v138.custom_viewmodel = {
        run = function()
            -- upvalues: v61 (ref)
            if v61.visuals.viewmodel_custom:get() then
                cvar.viewmodel_fov:int(viewmodel_fov:get());
                cvar.viewmodel_offset_x:float(viewmodel_x:get());
                cvar.viewmodel_offset_y:float(viewmodel_y:get());
                cvar.viewmodel_offset_z:float(viewmodel_z:get());
            end;
        end
    };
    v138.defensive_panel = {
        render = function()
            -- upvalues: v61 (ref), v13 (ref), v102 (ref), v101 (ref), v4 (ref), v138 (ref)
            if v61.visuals.defensive_panel:get() then
                if v13.sim_diff() <= -1 then
                    v102 = "yes";
                end;
                if v102 == "yes" and ui.find("Aimbot", "Ragebot", "Main", "Double Tap"):get() then
                    draw_per = v101 * 100 / 40;
                    render.text(1, vector(v4.x / 2, v4.y / 2 * 0.4 - 10), color(255, 255, 255, 255), "c", string.format("\aFFFFFFFFdefensive \a%schoking", RGBAtoHEX(defensive_color:get().r, defensive_color:get().g, defensive_color:get().b, 255)));
                    v138.renders.glow_module(v4.x / 2 - 43, v4.y / 2 * 0.4, v4.x / 2 + 43, v4.y / 2 * 0.4 + 2, 50, 30, 30, 30, 255, 4, true, defensive_color:get().r, defensive_color:get().g, defensive_color:get().b);
                    render.rect(vector(v4.x / 2 - 3, v4.y / 2 * 0.4), vector(v4.x / 2 - 3 + draw_per / 2, v4.y / 2 * 0.4 + 2), color(defensive_color:get().r, defensive_color:get().g, defensive_color:get().b, 255), 4, true);
                    render.rect(vector(v4.x / 2 + 5 - draw_per / 2, v4.y / 2 * 0.4), vector(v4.x / 2 + 3, v4.y / 2 * 0.4 + 2), color(defensive_color:get().r, defensive_color:get().g, defensive_color:get().b, 255), 4, true);
                    v101 = v101 + 1;
                    if v101 == 40 then
                        v101 = 0;
                        v102 = "no";
                    end;
                end;
            end;
        end
    };
    v138.aspect = {
        run = function()
            -- upvalues: v61 (ref)
            if v61.visuals.aspect_ratio:get() then
                cvar.r_aspectratio:float(aspect_ratio_value:get() / 100);
            else
                cvar.r_aspectratio:float(0);
            end;
        end
    };
    v138.border_menu = {
        run = function()
            -- upvalues: v61 (ref)
            if v61.visuals.menu_border:get() and ui.get_alpha() > 0.5 then
                render_ogskeet_border(ui.get_position().x + 3, ui.get_position().y + 40, ui.get_size().x - 6, ui.get_size().y - 1, 255, "");
            end;
        end
    };
    v138.sloweddown = {
        render = function()
            -- upvalues: v61 (ref), v102 (ref), v4 (ref), v138 (ref)
            if v61.visuals.slowed_down_panel:get() then
                local v175 = v102 == "yes" and ui.find("Aimbot", "Ragebot", "Main", "Double Tap"):get();
                if entity.get_local_player() == nil then
                    return;
                else
                    local v176 = entity.get_local_player().m_flVelocityModifier * 100;
                    local v177 = v176 * 98 / 100;
                    if v176 < 100 then
                        render.text(1, vector(v4.x / 2, v175 and v4.y / 2 * 0.45 - 10 or v4.y / 2 * 0.4 - 10), color(255, 255, 255, 255), "c", string.format("\aFFFFFFFFslowed down \aFFFFFFFF(\a%s%s%%\aFFFFFFFF)", RGBAtoHEX(slowed_down_color:get().r, slowed_down_color:get().g, slowed_down_color:get().b, 255), math.floor(calculatePercentage(v177, 100))));
                        v138.renders.glow_module(v4.x / 2 - 43, v175 and v4.y / 2 * 0.45 or v4.y / 2 * 0.4, v4.x / 2 + 43, v175 and v4.y / 2 * 0.45 + 2 or v4.y / 2 * 0.4 + 2, 50, 30, 30, 30, 255, 4, true, slowed_down_color:get().r, slowed_down_color:get().g, slowed_down_color:get().b);
                        render.rect(vector(v4.x / 2 - 3, v175 and v4.y / 2 * 0.45 or v4.y / 2 * 0.4), vector(v4.x / 2 - 3 + v177 / 2, v175 and v4.y / 2 * 0.45 + 2 or v4.y / 2 * 0.4 + 2), color(slowed_down_color:get().r, slowed_down_color:get().g, slowed_down_color:get().b, 255), 4, true);
                        render.rect(vector(v4.x / 2 + 5 - v177 / 2, v175 and v4.y / 2 * 0.45 or v4.y / 2 * 0.4), vector(v4.x / 2 + 3, v175 and v4.y / 2 * 0.45 + 2 or v4.y / 2 * 0.4 + 2), color(slowed_down_color:get().r, slowed_down_color:get().g, slowed_down_color:get().b, 255), 4, true);
                    end;
                end;
            end;
        end
    };
    v138.hitlogs = {
        anim = function(v178)
            return v178 > 0.5 and 4 * (v178 - 1) ^ 3 + 1 or 4 * v178 ^ 3;
        end, 
        render = function()
            -- upvalues: v110 (ref), v4 (ref)
            for v179, v180 in ipairs(v110) do
                if v179 > 7 then
                    table.remove(v110, v179);
                end;
                if v180.text ~= nil and v180.text ~= "" then
                    if v180.timer + 3.7 < globals.realtime then
                        v180.y = lerp(v180.y, v4.y - 100, globals.frametime * 1.5);
                        v180.alpha = lerp(v180.alpha, 0, globals.frametime * 4.5);
                    else
                        v180.y = lerp(v180.y, v4.y - 100, globals.frametime * 1.5);
                        v180.alpha = lerp(v180.alpha, 255, globals.frametime * 4.5);
                    end;
                end;
                local v181 = render.measure_text(1, "c", v180.text);
                local v182 = 255;
                local v183 = 255;
                local v184 = 255;
                a = 255;
                b = v184;
                g = v183;
                r = v182;
                if contains(hitlogs_type:get(), "Under crosshair") then
                    if hitlogs_style:get() == "500$" then
                        render_ogskeet_border(v4.x / 2 - v181.x / 2, v180.y - v179 * 35, v181.x, 12, 255, v180.text);
                    elseif hitlogs_style:get() == "Default" then
                        render.text(1, vector(v4.x / 2, v180.y - v179 * 18), color(255, 255, 255, 255), "c", v180.text);
                    end;
                end;
                if v180.timer + 4.3 < globals.realtime then
                    table.remove(v110, v179);
                end;
            end;
        end
    };
    v138.hitlogs_preview = {
        render = function()
            -- upvalues: v4 (ref)
            local l_r_1 = hitlogs_color:get().r;
            local l_g_1 = hitlogs_color:get().g;
            local l_b_1 = hitlogs_color:get().b;
            a = hitlogs_color:get().a;
            b = l_b_1;
            g = l_g_1;
            r = l_r_1;
            l_r_1 = "Hit \a" .. RGBAtoHEX(r, g, b, a) .. "admin\aFFFFFFFF in the \a" .. RGBAtoHEX(r, g, b, a) .. "head\aFFFFFFFF for \a" .. RGBAtoHEX(r, g, b, a) .. "999\aFFFFFFFF damage";
            l_g_1 = render.measure_text(1, "c", l_r_1);
            if contains(hitlogs_type:get(), "Under crosshair") and ui.get_alpha() > 0.5 then
                if hitlogs_style:get() == "500$" then
                    render_ogskeet_border(v4.x / 2 - l_g_1.x / 2, v4.y - 200, l_g_1.x, 12, 255, l_r_1);
                elseif hitlogs_style:get() == "Default" then
                    render.text(1, vector(v4.x / 2, v4.y - 200), color(255, 255, 255, 255), "c", l_r_1);
                end;
            end;
        end
    };
    v138.clantag = {
        run = function()
            -- upvalues: v117 (ref), v118 (ref), v61 (ref)
            local v188 = v117[math.floor(globals.tickcount / 30) % #v117 + 1];
            if v188 ~= v118 then
                v118 = v188;
                if v61.misc.clantag:get() then
                    common.set_clan_tag(v188);
                end;
            end;
        end
    };
    v138.nade_throw = {
        fix = function()
            -- upvalues: v61 (ref), v119 (ref)
            if v61.misc.nade_throw:get() then
                local l_weapon_name_0 = entity.get_local_player():get_player_weapon():get_weapon_info().weapon_name;
                if l_weapon_name_0 == "weapon_molotov" or l_weapon_name_0 == "weapon_hegrenade" or l_weapon_name_0 == "weapon_smokegrenade" then
                    ui.find("Miscellaneous", "Main", "Other", "Weapon Actions"):reset();
                else
                    ui.find("Miscellaneous", "Main", "Other", "Weapon Actions"):set(v119);
                end;
            end;
        end
    };
    return v138;
end)();
local v191 = {
    [1] = "\240\157\152\189\240\157\153\161\240\157\153\164\240\157\153\164\240\157\153\153\240\157\153\146\240\157\153\158\240\157\153\163\240\157\153\156\240\157\153\168.\240\157\153\163\240\157\153\161 \240\157\153\164\240\157\153\163 \240\157\153\169\240\157\153\164\240\157\153\165 \240\157\153\164\240\157\153\155 \240\157\153\169\240\157\153\157\240\157\153\154 \240\157\153\172\240\157\153\164\240\157\153\167\240\157\153\161\240\157\153\153", 
    [2] = "\240\157\148\184\240\157\149\159\240\157\149\165\240\157\149\154-\240\157\148\184\240\157\149\154\240\157\149\158\240\157\149\147\240\157\149\160\240\157\149\165 \240\157\149\154\240\157\149\164 \240\157\149\146 \240\157\149\165\240\157\149\160\240\157\149\160\240\157\149\157 \240\157\149\146\240\157\149\159\240\157\149\149 \240\157\149\170\240\157\149\160\240\157\149\166\240\157\149\163\240\157\149\164 \240\157\149\154\240\157\149\164 \240\157\149\147\240\157\149\163\240\157\149\160\240\157\149\156\240\157\149\150\240\157\149\159", 
    [3] = "\240\157\144\143\240\157\144\171\240\157\144\158\240\157\144\173\240\157\144\168 \240\157\144\157\240\157\144\158 \240\157\144\166\240\157\144\158\240\157\144\171\240\157\144\157\240\157\144\154 \240\157\144\175\240\157\144\168\240\157\144\165\240\157\144\173\240\157\144\154 \240\157\144\169\240\157\144\171\240\157\144\154 \240\157\144\173\240\157\144\174\240\157\144\154 \240\157\144\173\240\157\144\158\240\157\144\171\240\157\144\171\240\157\144\154", 
    [4] = "\240\157\153\136\240\157\153\158\240\157\153\160\240\157\153\150 \240\157\153\150\240\157\153\153\240\157\153\153\240\157\153\154\240\157\153\153 \240\157\153\169\240\157\153\157\240\157\153\158\240\157\153\168 \240\157\153\169\240\157\153\164 \240\157\152\189\240\157\153\161\240\157\153\164\240\157\153\164\240\157\153\153\240\157\153\146\240\157\153\158\240\157\153\163\240\157\153\156\240\157\153\168 \240\157\153\150\240\157\153\163\240\157\153\153 \240\157\153\162\240\157\153\150\240\157\153\153\240\157\153\154 \240\157\153\158\240\157\153\169 \240\157\153\168\240\157\153\164 \240\157\153\162\240\157\153\170\240\157\153\152\240\157\153\157 \240\157\153\151\240\157\153\154\240\157\153\169\240\157\153\169\240\157\153\154\240\157\153\167", 
    [5] = "\240\157\153\128\240\157\153\171\240\157\153\154\240\157\153\167\240\157\153\174\240\157\153\164\240\157\153\163\240\157\153\154 \240\157\153\157\240\157\153\150\240\157\153\171\240\157\153\154 \240\157\153\163\240\157\153\158\240\157\153\156\240\157\153\157\240\157\153\169\240\157\153\162\240\157\153\150\240\157\153\167\240\157\153\154\240\157\153\168 , \240\157\153\151\240\157\153\161\240\157\153\164\240\157\153\164\240\157\153\153\240\157\153\172\240\157\153\158\240\157\153\163\240\157\153\156\240\157\153\168 \240\157\152\188\240\157\152\188 \240\157\153\168\240\157\153\174\240\157\153\168\240\157\153\169\240\157\153\154\240\157\153\162 \240\157\153\158\240\157\153\168 \240\157\153\174\240\157\153\164\240\157\153\170\240\157\153\167 \240\157\153\151\240\157\153\158\240\157\153\156\240\157\153\156\240\157\153\154\240\157\153\168\240\157\153\169 \240\157\153\164\240\157\153\163\240\157\153\154", 
    [6] = "\240\157\159\144.\240\157\159\147\240\157\159\142 \240\157\144\167\240\157\144\165\240\157\144\158 \240\157\144\165\240\157\144\174\240\157\144\154 \240\157\144\164\240\157\144\162\240\157\144\165\240\157\144\165\240\157\144\162\240\157\144\167\240\157\144\160 \240\157\144\178\240\157\144\168\240\157\144\174\240\157\144\171 \240\157\144\158\240\157\144\167\240\157\144\173\240\157\144\162\240\157\144\171\240\157\144\158 \240\157\144\173\240\157\144\158\240\157\144\154\240\157\144\166? \240\157\144\129\240\157\144\165\240\157\144\168\240\157\144\168\240\157\144\157\240\157\144\150\240\157\144\162\240\157\144\167\240\157\144\160\240\157\144\172 \240\157\144\168\240\157\144\167 \240\157\144\173\240\157\144\168\240\157\144\169", 
    [7] = "\240\159\135\190 \240\159\135\180 \240\159\135\186  \240\159\135\188 \240\159\135\166 \240\159\135\179 \240\159\135\185  \240\159\135\185 \240\159\135\180  \240\159\135\167 \240\159\135\170  \240\159\135\177 \240\159\135\174 \240\159\135\176 \240\159\135\170  \240\159\135\178 \240\159\135\170 ? \225\181\135\225\181\152\202\184 \225\181\135\203\161\225\181\146\225\181\146\225\181\136\202\183\226\129\177\226\129\191\225\181\141\203\162", 
    [8] = "\240\157\152\189\240\157\153\161\240\157\153\164\240\157\153\164\240\157\153\153\240\157\153\146\240\157\153\158\240\157\153\163\240\157\153\156\240\157\153\168 \240\157\153\156\240\157\153\164\240\157\153\169 \202\179\225\181\137\225\182\156\225\181\146\225\181\136\225\181\137\225\181\136 \240\157\153\150\240\157\153\156\240\157\153\150\240\157\153\158\240\157\153\163 \240\157\153\150\240\157\153\163\240\157\153\153 \240\157\153\158\240\157\153\169\240\157\153\168 \240\157\153\151\240\157\153\154\240\157\153\169\240\157\153\169\240\157\153\154\240\157\153\167 \240\157\153\169\240\157\153\157\240\157\153\154\240\157\153\163 \240\157\153\154\240\157\153\171\240\157\153\154\240\157\153\167!", 
    [9] = "\240\157\152\188 \240\157\153\153\240\157\153\164\240\157\153\162\240\157\153\158\240\157\153\163\240\157\153\150\240\157\153\167 \240\157\153\164 \240\157\153\157\240\157\153\171\240\157\153\157 \240\157\153\153\240\157\153\154\240\157\153\168\240\157\153\153\240\157\153\154 2022", 
    [10] = "\226\156\176\240\157\148\190\240\157\149\160\240\157\149\149 \240\157\149\154 \240\157\149\168\240\157\149\154\240\157\149\164\240\157\149\153 \240\157\149\154 \240\157\149\153\240\157\149\146\240\157\149\149 \240\157\149\147\240\157\149\157\240\157\149\160\240\157\149\160\240\157\149\149\240\157\149\168\240\157\149\154\240\157\149\159\240\157\149\152\240\157\149\164\226\156\176", 
    [11] = "World cup is every 4 year , next chance to kill me is in 10", 
    [12] = "\226\132\149\240\157\149\150\240\157\149\167\240\157\149\150\240\157\149\163\240\157\149\157\240\157\149\160\240\157\149\164\240\157\149\150 \240\157\149\148\240\157\149\151\240\157\149\152 \240\157\149\146\240\157\149\159\240\157\149\149 \240\157\149\157\240\157\149\166\240\157\149\146 --> \240\157\149\132\240\157\149\154\240\157\149\156\240\157\149\146\240\157\149\153\240\157\149\167\240\157\149\153", 
    [13] = " I just love the smell of death", 
    [14] = "Bloodwings are not for kings\240\159\145\145 , \240\157\148\185\240\157\149\157\240\157\149\160\240\157\149\160\240\157\149\149\240\157\149\142\240\157\149\154\240\157\149\159\240\157\149\152\240\157\149\164 \240\157\149\154\240\157\149\165\240\157\149\164 \240\157\149\151\240\157\149\160\240\157\149\163 \240\157\149\157\240\157\149\150\240\157\149\152\240\157\149\150\240\157\149\159\240\157\149\149\240\157\149\164", 
    [15] = "\240\159\135\190 \240\159\135\180 \240\159\135\186  \240\159\135\173 \240\159\135\166 \240\159\135\187 \240\159\135\170  \240\159\135\179 \240\159\135\180  \240\159\135\168 \240\159\135\173 \240\159\135\166 \240\159\135\179 \240\159\135\168 \240\159\135\170  >:(", 
    [16] = "\240\157\153\137\240\157\153\154\240\157\153\171\240\157\153\154\240\157\153\167\240\157\153\161\240\157\153\164\240\157\153\168\240\157\153\154 & \240\157\152\189\240\157\153\161\240\157\153\164\240\157\153\164\240\157\153\153\240\157\153\172\240\157\153\158\240\157\153\163\240\157\153\156\240\157\153\168 = \240\157\153\1300\240\157\153\153 \240\157\152\188\240\157\152\188", 
    [17] = "\240\157\149\144\240\157\149\160\240\157\149\166\240\157\149\163 \240\157\148\184\240\157\148\184 \240\157\149\164\240\157\149\170\240\157\149\164\240\157\149\165\240\157\149\150\240\157\149\158 \240\157\149\165\240\157\149\146\240\157\149\161\240\157\149\161\240\157\149\150\240\157\149\149 \240\157\149\157\240\157\149\154\240\157\149\156\240\157\149\150 \240\157\149\151\240\157\149\166\240\157\149\148\240\157\149\156\240\157\149\154\240\157\149\159\240\157\149\152 \240\157\149\166\240\157\149\156\240\157\149\163\240\157\149\146\240\157\149\154\240\157\149\159 \240\157\149\166\240\157\149\164\240\157\149\154\240\157\149\159\240\157\149\152 \240\157\149\163\240\157\149\166\240\157\149\164\240\157\149\164\240\157\149\154\240\157\149\146 \240\157\149\147\240\157\149\160\240\157\149\158\240\157\149\147\240\157\149\164 \240\157\149\146\240\157\149\169\240\157\149\146\240\157\149\169\240\157\149\146\240\157\149\169\240\157\149\146\240\157\149\169\240\157\149\146", 
    [18] = "[ \240\157\153\180\240\157\154\137 \240\157\153\188\240\157\153\176\240\157\153\191\240\157\153\176 \240\157\159\191-\240\157\159\182 ]", 
    [19] = "(\226\151\163_\226\151\162)BloodWings RECODE (\226\151\163_\226\151\162)", 
    [20] = " Im pdiddy you are tupac , you just got shot", 
    [21] = "BloodWings users > All shit luas users", 
    [22] = "Godbless NEVERLOSE.CC", 
    [23] = "\240\157\152\191\240\157\153\164 \240\157\153\174\240\157\153\164\240\157\153\170 \240\157\153\172\240\157\153\150\240\157\153\163\240\157\153\169 \240\157\152\189\240\157\153\161\240\157\153\164\240\157\153\164\240\157\153\153\240\157\153\146\240\157\153\158\240\157\153\163\240\157\153\156\240\157\153\168?? NO BLOODWINGS FOR YOU HAHAHAHA", 
    [24] = "It looks like you lost 9-0"
};
local _ = {};
get_phrase = function()
    -- upvalues: v191 (ref)
    return v191[utils.random_int(1, #v191)]:gsub("\"", "");
end;
events.player_death:set(function(v193)
    -- upvalues: v61 (ref), v191 (ref)
    if not v61.misc.trashtalk:get() then
        return;
    else
        if v61.misc.trashtalk:get() then
            local v194 = entity.get_local_player();
            local v195 = entity.get(v193.attacker, true);
            if entity.get(v193.userid, true) ~= v194 and v195 == v194 then
                utils.console_exec("say \"" .. get_phrase(v191) .. "\"");
            end;
        end;
        return;
    end;
end);
new_notify = function(v196)
    -- upvalues: v110 (ref), v4 (ref)
    local v197 = {
        alpha = 0, 
        text = v196, 
        timer = globals.realtime
    };
    if #v110 == 0 then
        v197.y = v4.y - 40;
    else
        v197.y = v110[#v110].y + 20;
    end;
    table.insert(v110, v197);
end;
local v198 = {
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
events.aim_ack:set(function(v199)
    -- upvalues: v198 (ref)
    local v200 = v198[v199.hitgroup];
    local l_r_2 = hitlogs_color:get().r;
    local l_g_2 = hitlogs_color:get().g;
    local l_b_2 = hitlogs_color:get().b;
    a = hitlogs_color:get().a;
    b = l_b_2;
    g = l_g_2;
    r = l_r_2;
    if v199.state == nil then
        new_notify("Hit \a" .. RGBAtoHEX(r, g, b, a) .. v199.target:get_name() .. "\aFFFFFFFF in the \a" .. RGBAtoHEX(r, g, b, a) .. v200 .. "\aFFFFFFFF for \a" .. RGBAtoHEX(r, g, b, a) .. v199.damage .. " damage");
        if contains(hitlogs_type:get(), "On screen") then
            common.add_event("Hit \a" .. RGBAtoHEX(r, g, b, a) .. v199.target:get_name() .. "\aFFFFFFFF in the \a" .. RGBAtoHEX(r, g, b, a) .. v200 .. "\aFFFFFFFF for \a" .. RGBAtoHEX(r, g, b, a) .. v199.damage .. " damage");
        end;
    else
        new_notify("Missed \a" .. RGBAtoHEX(255, 40, 40, 255) .. v199.target:get_name() .. "\aFFFFFFFF in the \a" .. RGBAtoHEX(255, 40, 40, 255) .. v198[v199.wanted_hitgroup] .. "\aFFFFFFFF due \a" .. RGBAtoHEX(255, 40, 40, 255) .. v199.state);
        if contains(hitlogs_type:get(), "On screen") then
            common.add_event("Missed \a" .. RGBAtoHEX(255, 40, 40, 255) .. v199.target:get_name() .. "\aFFFFFFFF in the \a" .. RGBAtoHEX(255, 40, 40, 255) .. v198[v199.wanted_hitgroup] .. "\aFFFFFFFF due \a" .. RGBAtoHEX(255, 40, 40, 255) .. v199.state);
        end;
    end;
end);
events.render:set(function()
    -- upvalues: v190 (ref)
    local v204 = {
        [1] = {
            [1] = 222, 
            [2] = 195, 
            [3] = 195, 
            [4] = 255 * math.abs(1 * math.cos(2 * math.pi * globals.curtime / 4 + 2.6666666666666665))
        }, 
        [2] = {
            [1] = 222, 
            [2] = 195, 
            [3] = 195, 
            [4] = 255 * math.abs(1 * math.cos(2 * math.pi * globals.curtime / 4 + 2.5))
        }, 
        [3] = {
            [1] = 222, 
            [2] = 195, 
            [3] = 195, 
            [4] = 255 * math.abs(1 * math.cos(2 * math.pi * globals.curtime / 4 + 2.3333333333333335))
        }, 
        [4] = {
            [1] = 222, 
            [2] = 195, 
            [3] = 195, 
            [4] = 255 * math.abs(1 * math.cos(2 * math.pi * globals.curtime / 4 + 2.1666666666666665))
        }, 
        [5] = {
            [1] = 222, 
            [2] = 195, 
            [3] = 195, 
            [4] = 255 * math.abs(1 * math.cos(2 * math.pi * globals.curtime / 4 + 2))
        }, 
        [6] = {
            [1] = 222, 
            [2] = 195, 
            [3] = 195, 
            [4] = 255 * math.abs(1 * math.cos(2 * math.pi * globals.curtime / 4 + 1.8333333333333333))
        }, 
        [7] = {
            [1] = 222, 
            [2] = 195, 
            [3] = 195, 
            [4] = 255 * math.abs(1 * math.cos(2 * math.pi * globals.curtime / 4 + 1.6666666666666667))
        }, 
        [8] = {
            [1] = 222, 
            [2] = 195, 
            [3] = 195, 
            [4] = 255 * math.abs(1 * math.cos(2 * math.pi * globals.curtime / 4 + 1.5))
        }, 
        [9] = {
            [1] = 222, 
            [2] = 195, 
            [3] = 195, 
            [4] = 255 * math.abs(1 * math.cos(2 * math.pi * globals.curtime / 4 + 1.3333333333333333))
        }, 
        [10] = {
            [1] = 222, 
            [2] = 195, 
            [3] = 195, 
            [4] = 255 * math.abs(1 * math.cos(2 * math.pi * globals.curtime / 4 + 1.3333333333333333))
        }, 
        [11] = {
            [1] = 222, 
            [2] = 195, 
            [3] = 195, 
            [4] = 255 * math.abs(1 * math.cos(2 * math.pi * globals.curtime / 4 + 1.3333333333333333))
        }
    };
    label_text = string.format("                 \aFFFFFFFF\224\163\170 \214\180\214\182\214\184\226\152\190.     \a%sb\a%sl\a%so\a%so\a%sd\a%sw\a%si\a%sn\a%sg\a%ss    \aFFFFFFFF\224\163\170 \214\180\214\182\214\184\226\152\190.", RGBAtoHEX(unpack(v204[1])), RGBAtoHEX(unpack(v204[2])), RGBAtoHEX(unpack(v204[3])), RGBAtoHEX(unpack(v204[4])), RGBAtoHEX(unpack(v204[5])), RGBAtoHEX(unpack(v204[6])), RGBAtoHEX(unpack(v204[7])), RGBAtoHEX(unpack(v204[8])), RGBAtoHEX(unpack(v204[9])), RGBAtoHEX(unpack(v204[10])));
    lua_name_text = string.format("\a%sb\a%sl\a%so\a%so\a%sd\a%sw\a%si\a%sn\a%sg\a%ss", RGBAtoHEX(unpack(v204[1])), RGBAtoHEX(unpack(v204[2])), RGBAtoHEX(unpack(v204[3])), RGBAtoHEX(unpack(v204[4])), RGBAtoHEX(unpack(v204[5])), RGBAtoHEX(unpack(v204[6])), RGBAtoHEX(unpack(v204[7])), RGBAtoHEX(unpack(v204[8])), RGBAtoHEX(unpack(v204[9])), RGBAtoHEX(unpack(v204[10])));
    ui.sidebar(lua_name_text, "\adec3c3ff" .. ui.get_icon("galaxy"));
    label_anim:name(label_text);
    watermark_options:visibility(watermark_style:get() == "500$");
    watermark_options_2:visibility(watermark_style:get() == "Modern");
    v190.ogmenu.set();
    v190.visuals.render();
    v190.hitlogs.render();
    v190.watermark.render();
    v190.defensive_panel.render();
    v190.sloweddown.render();
    v190.arrows_antiaim.render();
    v190.aspect.run();
    v190.custom_viewmodel.run();
    v190.border_menu.run();
    v190.hitlogs_preview.render();
end);
local v205 = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"):get();
events.createmove:set(function(v206)
    -- upvalues: v61 (ref), v91 (ref), v205 (ref), v190 (ref)
    local v207 = entity.get_local_player();
    if v207 == nil then
        return;
    else
        local _ = v207.m_fFlags;
        if v61.antiaim[v91()].def_enable:get() then
            if lolp == 1 then
                ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"):override("Disabled");
            else
                ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"):override("Always On");
            end;
        else
            ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"):override(v205);
        end;
        if v61.antiaim.avoidback:get() then
            ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab"):override(true);
        else
            ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab"):override(false);
        end;
        ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"):override(v61.antiaim.yaw_base:get());
        ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"):override(v61.antiaim.freestanding:get());
        if v91() ~= nil then
            if v61.antiaim[v91()].enable:get() then
                v190.antiaim.createmove(v206, v91());
            elseif v61.antiaim[1].enable:get() then
                v190.antiaim.createmove(v206, 1);
            end;
        end;
        v190.nade_throw.fix();
        v190.pingspike.limit_remove();
        v190.hitchance_override.run(v206);
        return;
    end;
end);
events.net_update_end:set(function()
    -- upvalues: v190 (ref)
    v190.clantag.run();
end);