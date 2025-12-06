local l_pui_0 = require("neverlose/pui");
local l_clipboard_0 = require("neverlose/clipboard");
local l_base64_0 = require("neverlose/base64");
local _ = require("neverlose/gradient");
local l_hook_0 = require("neverlose/easy_hook");
local function _(v5, v6, v7)
    return v6 * (1 - v5) + v7 * v5;
end;
local l_x_0 = render.screen_size().x;
local l_y_0 = render.screen_size().y;
local v11 = entity.get_local_player();
local v12 = common.get_username();
local function v14(v13)
    return v13 * (globals.frametime * 100);
end;
local function _(v15, v16, v17)
    local v18 = (v16 - v15) * v17 * (globals.frametime * 5);
    if math.abs(v16 - v15) <= 1 then
        return v16 - v15;
    else
        return v18;
    end;
end;
local v20 = {
    max_lerp_low_fps = 2.2222222222222223
};
v20.color_lerp = function(v21, v22, v23)
    -- upvalues: v20 (ref)
    local v24 = globals.frametime * 100;
    return v21:lerp(v22, v23 * math.min(v24, v20.max_lerp_low_fps));
end;
v20.lerp = function(v25, v26, v27)
    -- upvalues: v20 (ref)
    if v25 == v26 then
        return v26;
    else
        local v28 = globals.frametime * 170;
        v27 = v27 * math.min(v28, v20.max_lerp_low_fps);
        local v29 = v25 + (v26 - v25) * math.clamp(v27, 0.01, 1);
        if math.abs(v29 - v26) < 0.01 then
            return v26;
        else
            return v29;
        end;
    end;
end;
v20.base_speed = 0.095;
v20._list = {};
v20.new = function(v30, v31, v32, v33)
    -- upvalues: v20 (ref)
    if not v32 then
        v32 = v20.base_speed;
    end;
    local v34 = type(v31) == "userdata";
    if v20._list[v30] == nil then
        v20._list[v30] = v33 and v33 or v34 and color(255) or 0;
    end;
    local v35 = nil;
    if v34 then
        v35 = v20.color_lerp;
    else
        v35 = v20.lerp;
    end;
    v20._list[v30] = v35(v20._list[v30], v31, v32);
    return v20._list[v30];
end;
ffi.cdef("    typedef struct {\n        char  pad_0000[20];\n        int m_nOrder;\n        int m_nSequence;\n        float m_flPrevCycle;\n        float m_flWeight;\n        float m_flWeightDeltaRate;\n        float m_flPlaybackRate;\n        float m_flCycle;\n        void *m_pOwner;\n        char  pad_0038[4];\n    } animstate_layer_t;\n");
local _ = ffi.typeof("uintptr_t**");
local v37 = utils.opcode_scan("client.dll", "55 8B EC 83 EC 58 56 57");
local v44 = {
    math_breathe = function(v38, v39)
        return math.abs(math.sin(globals.realtime * (v39 or 1) % math.pi + (v38 or 0)));
    end, 
    typing_text = function(v40, v41)
        local v42 = 0;
        length = #v40:gsub("[\128-\191]", "");
        num = v42;
        result = "";
        for v43 in v40:gmatch(".[\128-\191]*") do
            num = num + 1;
            factor = num / length;
            result = string.format("%s\a%s%s", result, v41(num, length, v43, factor):to_hex(), v43);
        end;
        return result;
    end
};
v44.gradient_text = function(v45, v46, v47)
    -- upvalues: v44 (ref)
    return v44.typing_text(v45, function(_, _, _, v51)
        -- upvalues: v46 (ref), v47 (ref)
        return v46:lerp(v47, v51);
    end);
end;
v44.gradient = function(v52, v53, v54, v55)
    -- upvalues: v44 (ref)
    return v44.typing_text(v52, function(_, _, _, v59)
        -- upvalues: v44 (ref), v55 (ref), v53 (ref), v54 (ref)
        interpolation = v44.math_breathe(v59, v55);
        return v53:lerp(v54, interpolation);
    end);
end;
v44.static_gradient = function(v60, v61, v62)
    -- upvalues: v44 (ref)
    return v44.gradient_text(v60, v61, v62);
end;
files.create_folder("nl\\essence");
if files.get_crc32("nl\\essence\\mainlogo.png") == nil then
    files.write("nl\\essence\\mainlogo.png", network.get("https://raw.githubusercontent.com/kwkotopai/essence/main/mainlogo1.png"), true);
elseif files.get_crc32("nl\\essence\\nlavatar.png") == nil then
    files.write("nl\\essence\\nlavatar.png", network.get("https://neverlose.cc/static/avatars/" .. v12 .. ".png?t=0"), true);
end;
local v63 = render.load_image_from_file("materials/panorama/images/icons/equipment/inferno.svg");
local function v64(v65)
    -- upvalues: v64 (ref)
    if type(v65) == "table" then
        local v66 = "{ ";
        for v67, v68 in pairs(v65) do
            if type(v67) ~= "number" then
                v67 = "\"" .. v67 .. "\"";
            end;
            v66 = v66 .. "[" .. v67 .. "] = " .. v64(v68) .. ",";
        end;
        return v66 .. "} ";
    else
        return tostring(v65);
    end;
end;
local function _(v69, v70, v71)
    local v72 = v71 - v70;
    v69 = (v69 - v70) % v72;
    if v69 < 0 then
        v69 = v69 + v72;
    end;
    return v69 + v70;
end;
local v84 = {
    dist_to_2d = function(v74, v75)
        return math.sqrt(math.pow(v74.x - v75.x, 2) + math.pow(v74.y - v75.y, 2));
    end, 
    lerp_position = function(v76, v77, v78)
        return vector((v77.x - v76.x) * v78 + v76.x, (v77.y - v76.y) * v78 + v76.y, (v77.z - v76.z) * v78 + v76.z);
    end, 
    is_bounded = function(v79, v80, v81, v82)
        local v83 = ui.get_mouse_position();
        return v79 <= v83.x and v83.x <= v81 and v80 <= v83.y and v83.y <= v82;
    end
};
local v85 = nil;
v85 = {};
local v86 = 0.083333336;
do
    local l_v86_0 = v86;
    v85.to_foot = function(v88)
        -- upvalues: l_v86_0 (ref)
        return v88 * l_v86_0;
    end;
    v85.to_keys = function(v89)
        local v90 = {};
        for v91, v92 in pairs(v89) do
            v90[v92] = v91;
        end;
        return v90;
    end;
    v85.copy_exclude = function(v93, v94)
        -- upvalues: v85 (ref)
        local v95 = v85.to_keys(v94);
        local v96 = {};
        local v97 = 0;
        for v98 = 1, #v93 do
            if v95[v93[v98]] == nil then
                v97 = v97 + 1;
                v96[v97] = v93[v98];
            end;
        end;
        return v96, v97;
    end;
end;
v86 = function(v99, v100, v101)
    return v101.x >= v99.x and v101.y >= v99.y and v101.x <= v100.x and v101.y <= v100.y;
end;
local v102 = vector(0, 0);
local v103 = {
    dt = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"), 
    dt_lag = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"), 
    os_aa_op = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options"), 
    os = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"), 
    min_dmg = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"), 
    auto_peek = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist"), 
    antiaim = ui.find("Aimbot", "Anti Aim", "Angles", "Enabled"), 
    pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"), 
    yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"), 
    yaw_base = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"), 
    yaw_offset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"), 
    yaw_hidden = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden"), 
    backstab = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab"), 
    yaw_mod = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"), 
    yaw_mod_offset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"), 
    byaw = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"), 
    byaw_inv = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"), 
    byaw_left = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"), 
    byaw_right = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"), 
    byaw_options = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"), 
    byaw_fs = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding"), 
    fs = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"), 
    fs_disable_yawmod = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Disable Yaw Modifiers"), 
    fs_bodyfs = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Body Freestanding"), 
    extended_angles = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles"), 
    extended_pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles", "Extended Pitch"), 
    extended_roll = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles", "Extended Roll"), 
    fl = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Enabled"), 
    fl_limit = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Limit"), 
    fd = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"), 
    slow_walk = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"), 
    scope_overlay = ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay"), 
    ping_spike = ui.find("Miscellaneous", "Main", "Other", "Fake Latency"), 
    da = ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot"), 
    body_aim = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim"), 
    safe_points = ui.find("Aimbot", "Ragebot", "Safety", "SSG-08", "Safe Points"), 
    speclist = ui.find("Miscellaneous", "Main", "Other", "Windows"), 
    legs_movement = ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"), 
    lp_chams = ui.find("Visuals", "Players", "Self", "Chams", "Model"), 
    lp_chamsclr = ui.find("Visuals", "Players", "Self", "Chams", "Model", "Color"), 
    path_color = ui.find("Visuals", "World", "Other", "Grenade Prediction", "Color"), 
    color_hit = {
        ui.find("Visuals", "World", "Other", "Grenade Prediction", "Color Hit")
    }, 
    dormantaimbot = ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot"), 
    override_zoom = ui.find("Visuals", "World", "Main", "Override Zoom"), 
    field_of_view = ui.find("Visuals", "World", "Main", "Field of View"), 
    clantag = ui.find("Miscellaneous", "Main", "In-Game", "Clan Tag"), 
    quick_stop = ui.find("Miscellaneous", "Main", "Movement", "Quick Stop")
};
v103.antiaim:set(true);
local v104 = render.load_image_from_file("nl\\essence\\mainlogo.png", vector(256, 256));
local _ = render.load_image_from_file("nl\\essence\\nlavatar.png", vector(38, 38));
local v106 = {
    value = 0, 
    clip = 0, 
    timer = 0, 
    done = false
};
local v107 = render.load_font("Arial", 64, "abd");
local v108 = render.load_font("Arial", 45, "abd");
local function v111()
    -- upvalues: v106 (ref), v14 (ref), l_pui_0 (ref), v104 (ref), v107 (ref), v108 (ref), v12 (ref)
    if v106.done == false then
        if v106.value < 255 and v106.timer == 0 then
            v106.value = v106.value + v14(3);
        end;
        if v106.value >= 255 and v106.timer < 150 then
            v106.value = 255;
            v106.timer = v106.timer + v14(1);
            v106.clip = v106.clip + v14(4);
        end;
        if v106.timer >= 150 then
            v106.value = v106.value - v14(3);
            if v106.value <= 0 then
                v106.done = true;
            end;
        end;
        local l_accent_0 = l_pui_0.accent;
        local v110 = render.screen_size();
        render.rect(vector(0, 0), v110, color(0, 0, 0, v106.value / 2));
        render.blur(vector(0, 0), v110, v106.value / 128, v106.value / 255);
        render.circle_gradient(v110 / 2, color(l_accent_0.r, l_accent_0.g, l_accent_0.b, v106.value / 255), color(l_accent_0.r, l_accent_0.g, l_accent_0.b, v106.value - 170), 170, 0, 1);
        render.texture(v104, v110 / 2 - vector(128, 128), color(l_accent_0.r, l_accent_0.g, l_accent_0.b, v106.value));
        render.push_clip_rect(v110 / 2 + vector(-v106.clip, 0), v110 / 2 + vector(v106.clip, 1000));
        render.text(v107, v110 / 2 + vector(0, 120), color(255, 255, 255, v106.value), "c", "ESS\a{Link Active}ENCE");
        render.text(v108, v110 / 2 + vector(0, 180), color(255, 255, 255, v106.value), "c", string.format("Welcome \a{Link Active}%s", v12));
    end;
end;
local v112 = {
    main_tab = l_pui_0.create("\v\239\128\135\r", "\v\239\162\144 Welcome to essence \239\162\144\t"), 
    main_tab2 = l_pui_0.create("\v\239\128\135\r", "Informations"), 
    main_tab3 = l_pui_0.create("\v\239\128\135\r", ""), 
    main_tab4 = l_pui_0.create("\v\239\128\135\r", "  "), 
    main_tab5 = l_pui_0.create("\v\239\128\135\r", "   "), 
    aa_tab = l_pui_0.create("\v\239\132\178\r", "Tabs", 1), 
    aa_tab2 = l_pui_0.create("\v\239\132\178\r", "Builder", 2), 
    aa_tab3 = l_pui_0.create("\v\239\132\178\r", "States", 1), 
    aa_tab4 = l_pui_0.create("\v\239\132\178\r", "Defensive Builder", 2), 
    misc_tab = l_pui_0.create("\v\239\139\155\r", "Tabs"), 
    misc_tab2 = l_pui_0.create("\v\239\139\155\r", "Miscellaneous"), 
    misc_tab3 = l_pui_0.create("\v\239\139\155\r", "Visuals"), 
    misc_tab4 = l_pui_0.create("\v\239\139\155\r", "Other"), 
    misc_tab5 = l_pui_0.create("\v\239\139\155\r", "")
};
local v113 = {
    [1] = "\v\239\134\131\t\rStanding", 
    [2] = "\v\239\156\140\r   Moving", 
    [3] = "\v\239\149\148\t\rSlowalking", 
    [4] = "\v\239\134\147\r  Crouching", 
    [5] = "\v\238\139\142\r   Sneaking", 
    [6] = "\v\238\149\134\r   Air", 
    [7] = "\v\239\159\135\r  Air Crouch", 
    [8] = "\v\238\147\129\r\tFreestanding", 
    [9] = "\v\238\130\162\r\tManuals"
};
local v114 = {
    [1] = "Standing", 
    [2] = "Moving", 
    [3] = "Slowalking", 
    [4] = "Crouching", 
    [5] = "Sneaking", 
    [6] = "Air", 
    [7] = "Air Crouch"
};
local v116 = {
    main = {
        configlist = v112.main_tab2:list(""), 
        configname = v112.main_tab2:input("\v\239\149\179\r\tConfig Name"), 
        antiaimcfg = v112.main_tab2:label("\v\239\131\142\r\tTab Selection"), 
        save_cfg = v112.main_tab2:button("\v\239\131\135\r\tSave", a, true), 
        del_cfg = v112.main_tab2:button("\t\v\239\135\184\r\tDelete\t", a, true), 
        loadsettings = v112.main_tab2:button("\t\v\239\128\153\r\tLoad\t", a, true), 
        export_cfg = v112.main_tab2:button("\t\t\v\239\133\141\r\tExport\t\t", a, true), 
        import_cfg = v112.main_tab2:button("\t\t\v\239\149\175\r\tImport\t\t", a, true), 
        about = v112.main_tab3:list("              [    \vessence.lua \194\174 2024-2025\r\t]     ", "\239\128\149  About", "\239\153\160  Configs"), 
        username = v112.main_tab2:label("\v\239\128\135\r\t User"), 
        butaouser = v112.main_tab2:button(v12, a, true), 
        buildinfo = v112.main_tab2:label("\v\238\147\162\r\tBuild"), 
        buildbotao = v112.main_tab2:button("Nightly", a, true), 
        socials = v112.main_tab2:label("\v\239\135\160\r\tSocials"), 
        youtube = v112.main_tab2:button("\aFF0000FF\239\133\167  \rYoutube", function()
            panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://www.youtube.com/@kwko");
        end, true), 
        marketconfig = v112.main_tab2:button("\v\239\130\133\r  Config", function()
            panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://en.neverlose.cc/market/item?id=xOj2si");
        end, true), 
        info = v112.main_tab4:label("\aFFE700FF\239\129\170\r  This script is a work in progress and some features may not work correctly."), 
        infobugs = v112.main_tab4:label("\aFD191DFF\238\146\144\r  Report bugs\t  \239\129\161"), 
        discordbutton = v112.main_tab4:button("\a7593FFFF\239\142\146  \rDiscord Server", function()
            panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://discord.gg/RdR74RMSHJ");
        end, true), 
        verifybutton = v112.main_tab4:button("\t\t\t\t\v\239\128\140\r\tGet Verification Code                ", function()
            -- upvalues: v12 (ref), l_clipboard_0 (ref)
            local v115 = network.get("http://217.71.204.99:5000/get_code?user=" .. v12);
            v115 = json.parse(v115).gencode;
            l_clipboard_0.set(v115);
            common.add_notify("\v\239\128\140\r\tCode Copied!", "The discord verification code has been copied to your clipboard.");
        end, true)
    }, 
    antiaim = {
        tabs = v112.aa_tab:list("", "\v\239\159\148   \rBuilder", "\v\238\149\181  \rDefensive", "\v\238\148\177  \rOther"), 
        states = v112.aa_tab3:list("", v113), 
        manual_aa = v112.aa_tab2:combo("\v\239\129\190\t \rManual AA", "Disabled", "Left", "Right", "Forward"), 
        fs = v112.aa_tab2:switch("\v\238\149\146\t\rFreestanding"), 
        safe_head = v112.aa_tab2:switch("\v\239\139\183\t \rSafe Head"), 
        backstab = v112.aa_tab2:switch("\v\239\155\181\t\rAvoid Backstab"), 
        disablersbomba = v112.aa_tab2:combo("\v\239\132\167\r   AA Disablers", "Off", "Disable", "Spin"), 
        builder = {}
    }, 
    visuals = {
        tabs = v112.misc_tab:list("", "\v\238\139\138\t\rVisuals", "\v\239\134\179\r\tOther", "\v\238\135\183\r\t Miscellaneous"), 
        indicators = v112.misc_tab3:switch("\v\238\139\138\t\rCrosshair Indicators"), 
        dmgovrind = v112.misc_tab3:switch("\v\238\134\189   \rDamage Override Indicator"), 
        watermark = v112.misc_tab3:switch("\v\239\135\185\t\rWatermark"), 
        manual_aarows = v112.misc_tab3:switch("\v\239\128\161\t\rManual Arrows"), 
        slowind = v112.misc_tab3:switch("\v\238\133\155   \rVelocity Indicator"), 
        defensiveind = v112.misc_tab3:switch("\v\238\132\186\t\rDefensive Indicator"), 
        customscope = v112.misc_tab3:switch("\v\238\150\159\t\rCustom Scope Overlay"), 
        infopanel = v112.misc_tab3:switch("\v\238\144\174\t\rInfo Panel")
    }, 
    other = {
        anims = v112.misc_tab2:switch("\v\239\136\155\t\rAnimation Breaker"), 
        customfd = v112.misc_tab2:switch("\v\239\155\152\t \rCustom Fake duck"), 
        nofalldamage = v112.misc_tab2:switch("\v\238\149\135\t\rNo Fall Damage"), 
        fastladder = v112.misc_tab2:switch("\v\238\148\185\t\rFast Ladder"), 
        edge_stop = v112.misc_tab2:switch("\v\239\149\133\t\r Edge Quick Stop"), 
        aspectr = v112.misc_tab2:switch("\v\239\129\165\t\rAspect Ratio", false), 
        viewchanger = v112.misc_tab2:switch("\v\238\131\154\t\rView Model Changer", false), 
        gsindicators = v112.misc_tab2:switch("\a96C83CFFG\aFFFFFFFFS\t\a96C83CFFGame\rsense Indicators"), 
        gsgrenadethings = v112.misc_tab2:switch("\v\239\135\162\r\tGrenade Visuals"), 
        animated_zoom = v112.misc_tab2:switch("\v\239\128\142\r\tAnimated Zoom"), 
        clantag = v112.misc_tab2:switch("\v\239\128\171\r\tClantag"), 
        unlockping = v112.misc_tab2:switch("\v\239\135\171\r\tUnlock Fake Latency Limit"), 
        dormantaimbot = v112.misc_tab2:switch("\v\238\134\155\r\tDormant Aimbot"), 
        addons = v112.misc_tab2:label("\v\239\130\133\r\tAddons"), 
        logs = v112.misc_tab2:label("\v\238\145\178\t\rLog Events"), 
        fpsboost = v112.misc_tab2:label("\v\238\131\167\t\rPerformance Improvements"), 
        namechanger = v112.misc_tab2:label("\v\239\150\183  \rName Changer")
    }
};
v116.main.youtube:tooltip("\aFFFFFFDEYoutube Channel");
v116.main.marketconfig:tooltip("\aFFFFFFDEMy CSGO Config");
v116.main.antiaimcfggrp = v116.main.antiaimcfg:create();
v116.main.antiaimcfgsep = v116.main.antiaimcfggrp:list("Select What You Want To Import/Export", "Everything", "Only Anti-Aim");
v116.other.nofalldamage:tooltip("\vAllows to safely fall from heights without taking any damage, providing a gameplay advantage;\n\nBad movement can cause the function to fail, as the source game engine does not allow for accurate calculation of landing time.");
v116.other.fastladder:tooltip("\vAbuses the ladder movement mechanic and makes you move a little faster.");
v116.other.unlockping:tooltip("\vFake your ping to the server to shift your backtracking window;\n\nMaximum value for fake latency in neverlose is 100ms, this function extends it to 200ms;\n\nFun fact: if value is 200ms you can still backtrack up to 400ms.");
v116.other.addons:tooltip("\aFFFFFFDEDisable Foot Shadows: \vDisables foot shadows when chams are activated in local player;\n\n\aFFFFFFDEKeep Model Transparency: \vKeeps the local player model transparent after shooting with bolt-action sniper rifles and adds an extra fade-in/out animation;\nThis is 1:1 replica from gamesense.\n\n\aFFFFFFDEFix Chams Color: \vFixes chams on old maps like (de_dust2_old and cs_office);\nThis will also make the world darker");
v116.other.customfd:tooltip("\vThis option will unlock the fakeduck speed limit and will allow you to use fakeduck in freezetime that is useful to some maps like (de_bank);\n\nThis is a custom fakeduck and will override the one from the cheat;\n\nYou dont need to bind this option just leave it always on if you want the custom fakeduck to work!");
v116.other.edge_stop:tooltip("\vPrevents you from walking or jumping off edges, similar to the Minecraft sneaking mechanic.\n- \r[ \vWorks better with Peek Assist\r ]");
v116.antiaim.manuel = v116.antiaim.manual_aa:create();
v116.antiaim.manueljitter = v116.antiaim.manuel:switch("\v\239\148\134\r\tDisable Jitter");
v116.antiaim.freestanding = v116.antiaim.fs:create();
v116.antiaim.fsjitter = v116.antiaim.freestanding:switch("\v\239\148\134\r\tDisable Jitter");
v116.antiaim.fsenablers = v116.antiaim.freestanding:selectable("\v\239\134\131\r\tActivate on", "Standing", "Moving", "Slowalking", "Crouching", "Sneaking", "Air", "Air Crouch");
v116.antiaim.safeknifegear = v116.antiaim.safe_head:create();
v116.antiaim.safeheight = v116.antiaim.safeknifegear:slider("\v\239\161\177\r\tHeight", 1, 20, 0, 1, "ft");
v116.antiaim.safeknife = v116.antiaim.safeknifegear:selectable("\v\239\159\128\r\tConditions", "Standing", "Crouching", "Air Crouch", "With Knife", "With Zeus");
v116.antiaim.disablersgrupo = v116.antiaim.disablersbomba:create();
v116.antiaim.disablerwhen = v116.antiaim.disablersgrupo:selectable("\v\239\158\138\r\tActivate on", "Warmup", "Round End");
v116.antiaim.disablerspinpitch = v116.antiaim.disablersgrupo:combo("\v\239\129\130\r\tPitch", "Disabled", "Up", "Down", "Random");
v116.antiaim.safe_head:tooltip("\vIf the local player is in air, above the enemy and hittable, function fired to make the head hitbox behind chest.");
v116.antiaim.safeheight:tooltip("\vHigher is safer");
v116.antiaim.backstab:tooltip("\vTurns the local player model to face the opponent with a knife to avoid being backstabbed;\n\nThis option will only override the default Neverlose function.");
v116.antiaim.disablersbomba:tooltip("\vThis will only disable Anti-Aim on Warmup/Round end");
v116.visuals.crosshair = v116.visuals.indicators:create();
v116.visuals.crosshairind = v116.visuals.crosshair:list("Type", "\v\239\162\144\t\rMinimalist", "\v\239\131\131\t\rExperimental");
v116.visuals.crosshaircolor = v116.visuals.crosshair:color_picker("\v\239\135\188\t\rAccent Color", color(255, 255, 255, 255));
v116.visuals.crosshairpulse = v116.visuals.crosshair:switch("\v\239\151\184\r   Pulse Effect");
v116.visuals.crosshairglow = v116.visuals.crosshair:switch("\v\238\135\128\r\tGlow");
v116.visuals.crosshairglowslider = v116.visuals.crosshair:slider(" \vL\r\tGlow Offset", 0, 100, 30, nil, function(v117)
    if v117 == 0 then
        return "Disabled";
    else
        return v117 .. "px";
    end;
end);
v116.visuals.crosshair_remove_stateicons = v116.visuals.crosshair:switch("\v\239\152\155\r\tRemove State Icons");
v116.visuals.crosshairindy = v116.visuals.crosshair:slider("posyxhair", 0, l_y_0, l_y_0 / 2 + 30);
v116.visuals.dmgovrbomba = v116.visuals.dmgovrind:create();
v116.visuals.dmgovranim = v116.visuals.dmgovrbomba:switch("\v\239\162\153\r   Animated");
v116.visuals.dmgovrstate = v116.visuals.dmgovrbomba:switch("\v\238\132\133\r\tState");
v116.visuals.dmgovrfont = v116.visuals.dmgovrbomba:list("\v\239\162\148\r   Font", "Default", "Pixel", "Bold");
v116.visuals.dmg_indx = v116.visuals.dmgovrbomba:slider("posxdmg", 0, l_x_0, l_x_0 / 2 + 5);
v116.visuals.dmg_indy = v116.visuals.dmgovrbomba:slider("posydmg", 0, l_y_0, l_y_0 / 2 - 15);
v116.visuals.markbomba = v116.visuals.watermark:create();
v116.visuals.marktype = v116.visuals.markbomba:list("Type", "Default", "Simple", "Upper-Right");
v116.visuals.markbombacolor = v116.visuals.markbomba:color_picker("\v\239\135\188\t\rAccent Color", color(255, 255, 255, 255));
v116.visuals.marksimplepos = v116.visuals.markbomba:combo("\v\239\152\129\t\rPosition", "Left", "Right", "Bottom");
v116.visuals.marksimplespaces = v116.visuals.markbomba:switch("Remove Spaces");
v116.visuals.markbombafont = v116.visuals.markbomba:slider("\v\239\128\177\t\rFont", 0, 3, 0, 1, function(v118)
    if v118 == 0 then
        return "Default";
    elseif v118 == 1 then
        return "Pixel";
    elseif v118 == 2 then
        return "Console";
    elseif v118 == 3 then
        return "Bold";
    else
        return;
    end;
end);
v116.visuals.markname = v116.visuals.markbomba:combo("\v\238\134\191\r\tName Type", "Steam", "Neverlose", "Custom");
v116.visuals.marknameinput = v116.visuals.markbomba:input("Custom Name");
v116.visuals.markimages = v116.visuals.markbomba:combo("\v\238\134\184\r\t Image Type", "Steam", "Neverlose");
v116.visuals.manualarrowsbomba = v116.visuals.manual_aarows:create();
v116.visuals.manualarrowstype = v116.visuals.manualarrowsbomba:list("\v\239\150\188\r\tArrows Type", "Simple", "Team-Skeet");
v116.visuals.manualarrowscolor = v116.visuals.manualarrowsbomba:color_picker("\v\239\135\188\t\rAccent Color", color(255, 255, 255, 255));
v116.visuals.manualarrowsalways = v116.visuals.manualarrowsbomba:combo("\v\239\148\176\t\rVisibility", "On Hotkey", "Always On");
v116.visuals.manualarrowsposx = v116.visuals.manualarrowsbomba:slider("X", 0, l_x_0, l_x_0 / 2 + 5);
v116.visuals.manualarrowstscolor1 = v116.visuals.manualarrowsbomba:color_picker("Accent Color", color(175, 255, 0, 255));
v116.visuals.manualarrowstscolor2 = v116.visuals.manualarrowsbomba:color_picker("Desync Color", color(0, 200, 255, 255));
v116.visuals.velocitygrp = v116.visuals.slowind:create();
v116.visuals.velocity_color = v116.visuals.velocitygrp:color_picker("\v\239\135\188\r\tAccent Color", color(255, 255, 255, 255));
v116.visuals.velocitypos_x = v116.visuals.velocitygrp:slider("vdrag_offset", 0, l_x_0, l_x_0 / 2 - l_x_0 / 15 / 2);
v116.visuals.velocitypos_y = v116.visuals.velocitygrp:slider("vdragging", 0, l_y_0, l_y_0 / 2 - 200);
v116.visuals.scopebomba = v116.visuals.customscope:create();
v116.visuals.scopecolor = v116.visuals.scopebomba:color_picker("\v\239\135\188\r\tAccent Color", color(255, 255, 255, 150));
v116.visuals.scopesize = v116.visuals.scopebomba:slider("\v\239\129\165\r\tSize", 0, 500, 100);
v116.visuals.scopegap = v116.visuals.scopebomba:slider("\v\239\158\164\r\tGap", 0, 500, 7);
v116.visuals.inverted = v116.visuals.scopebomba:switch("Inverted");
v116.visuals.scoperemovals = v116.visuals.scopebomba:selectable("\v\239\128\141\r\tRemovals", "Top", "Left", "Right", "Bottom");
v116.visuals.defensiveindgrp = v116.visuals.defensiveind:create();
v116.visuals.defensiveindclr = v116.visuals.defensiveindgrp:color_picker("\v\239\135\188\r\tAccent Color", color(255, 255, 255, 255));
v116.visuals.defensiveindx = v116.visuals.defensiveindgrp:slider("defensive_posx", 0, l_x_0, l_x_0 / 2 - l_x_0 / 15 / 2);
v116.visuals.defensiveindy = v116.visuals.defensiveindgrp:slider("defensive_poxy", 0, l_y_0, l_y_0 / 2 - 300);
v116.visuals.panelgrp = v116.visuals.infopanel:create();
v116.visuals.panel_clr = v116.visuals.panelgrp:color_picker("\v\239\135\188\r\tAccent Color", color(255, 255, 255, 255));
v116.visuals.panel_font = v116.visuals.panelgrp:combo("\v\239\128\177\r\tFont", "Default", "Small", "Bold");
v116.visuals.panel_x = v116.visuals.panelgrp:slider("panel x", 0, l_x_0, 0);
v116.visuals.panel_y = v116.visuals.panelgrp:slider("panel y", 0, l_y_0, l_y_0 / 2 - 21);
v116.other.aspectrbomba = v116.other.aspectr:create();
v116.other.aspectrslider = v116.other.aspectrbomba:slider("\v%\r\tValue", 0, 200, 0, 0.01, function(v119)
    if v119 == 0 then
        return "Disabled";
    elseif v119 == 150 then
        return "3:2";
    elseif v119 == 133 then
        return "4:3";
    elseif v119 == 125 then
        return "5:4";
    elseif v119 == 160 then
        return "16:10";
    else
        return v119 / 100 .. "%";
    end;
end);
v116.other.aspectr:set_callback(function()
    -- upvalues: v116 (ref)
    if not v116.other.aspectr.value then
        cvar.r_aspectratio:float(0);
    else
        cvar.r_aspectratio:float(v116.other.aspectrslider.value / 100);
    end;
end);
v116.other.aspectrslider:set_callback(function()
    -- upvalues: v116 (ref)
    if v116.other.aspectr.value then
        cvar.r_aspectratio:float(v116.other.aspectrslider.value / 100);
    end;
end, true);
v116.other.aspectrlabel = v116.other.aspectrbomba:label("\v\239\137\133\r\tClick");
v116.other.aspectrbuttons5 = v116.other.aspectrbomba:button("3:2", function()
    -- upvalues: v116 (ref)
    v116.other.aspectrslider:set(150);
end, true);
v116.other.aspectrbuttons4 = v116.other.aspectrbomba:button("4:3", function()
    -- upvalues: v116 (ref)
    v116.other.aspectrslider:set(133);
end, true);
v116.other.aspectrbuttons3 = v116.other.aspectrbomba:button("5:4", function()
    -- upvalues: v116 (ref)
    v116.other.aspectrslider:set(125);
end, true);
v116.other.aspectrbuttons2 = v116.other.aspectrbomba:button("16:10", function()
    -- upvalues: v116 (ref)
    v116.other.aspectrslider:set(160);
end, true);
v116.other.aspectrbuttons1 = v116.other.aspectrbomba:button("16:9", function()
    -- upvalues: v116 (ref)
    v116.other.aspectrslider:set(0);
end, true);
local function v120()
    -- upvalues: v116 (ref)
    if v116.other.viewchanger.value then
        cvar.viewmodel_fov:int(v116.other.viewfov.value, true);
        cvar.viewmodel_offset_x:float(v116.other.viewx.value, true);
        cvar.viewmodel_offset_y:float(v116.other.viewy.value, true);
        cvar.viewmodel_offset_z:float(v116.other.viewz.value, true);
    else
        cvar.viewmodel_fov:int(68);
        cvar.viewmodel_offset_x:float(2.5);
        cvar.viewmodel_offset_y:float(0);
        cvar.viewmodel_offset_z:float(-1.5);
    end;
end;
v116.other.viewbomba = v116.other.viewchanger:create();
v116.other.viewfov = v116.other.viewbomba:slider("\v\239\136\157\r\tFOV", -100, 100, 68);
v116.other.viewx = v116.other.viewbomba:slider("\v\239\129\190\r\tX", -15, 15, 2.5);
v116.other.viewy = v116.other.viewbomba:slider("\v\239\129\162\r\tY", -15, 15, 0);
v116.other.viewz = v116.other.viewbomba:slider("\v\239\129\189\r\tZ", -15, 15, -1.5);
v116.other.viewlefthand = v116.other.viewbomba:listable("\v\239\142\155\r   Other", "\v\239\139\164\r\tLeft hand Knife", "\v\238\130\183\r\tLeft hand Zeus");
v116.other.viewchanger:set_callback(function()
    -- upvalues: v120 (ref), v116 (ref)
    v120();
    if not v116.other.viewchanger.value then
        cvar.cl_righthand:int(1);
    end;
end, true);
local function v122()
    -- upvalues: v116 (ref), v11 (ref)
    if not v116.other.viewchanger.value then
        return;
    elseif not v11 and not v11:is_alive() then
        return;
    else
        local v121 = v11:get_player_weapon();
        if not v121 then
            return;
        else
            if v116.other.viewlefthand:get(1) and v121:get_classname() == "CKnife" then
                cvar.cl_righthand:int(0);
            elseif v116.other.viewlefthand:get(2) and v121:get_classname() == "CWeaponTaser" then
                cvar.cl_righthand:int(0);
            else
                cvar.cl_righthand:int(1);
            end;
            return;
        end;
    end;
end;
v116.other.viewdefault = v116.other.viewbomba:button("\238\131\135  Click To Reset Values To Default", function(_)
    -- upvalues: v116 (ref)
    v116.other.viewfov:set(68);
    v116.other.viewx:set(2.5);
    v116.other.viewy:set(0);
    v116.other.viewz:set(-1.5);
end, true);
v116.other.viewfov:set_callback(v120);
v116.other.viewx:set_callback(v120);
v116.other.viewy:set_callback(v120);
v116.other.viewz:set_callback(v120);
v116.other.logsbomba = v116.other.logs:create();
v116.other.plogs = v116.other.logsbomba:switch("\v\239\129\186\r\tPurchase logs");
v116.other.plogsclr = v116.other.plogs:color_picker({
    Weapon = {
        color(255, 255, 255, 255)
    }, 
    Username = {
        color(255, 255, 255, 255)
    }
});
v116.other.logstype = v116.other.logsbomba:selectable("\v\239\137\141\r\tType", "Event", "Console", "Notify");
v116.other.logscolor = v116.other.logstype:color_picker({
    Prefix = {
        color(255, 255, 255, 255)
    }, 
    Username = {
        color(255, 255, 255, 255)
    }, 
    ["Miss Reason"] = {
        color(255, 255, 255, 255)
    }, 
    Damage = {
        color(255, 255, 255, 255)
    }
});
v116.other.notifyscolor = v116.other.logsbomba:color_picker("\v\239\135\188\r\tNotifys Colors", {
    ["Miss Color"] = {
        color(230, 150, 150, 255)
    }, 
    ["Hit Color"] = {
        color(186, 159, 221, 255)
    }
});
v116.other.eventbold = v116.other.logsbomba:switch("\v\239\128\178\r\t Bold Font");
v116.other.eventbold:tooltip("\vThis option will only change Event logs to Bold like Gamesense;\n\n\aFFDF00F4\239\129\177  \vIf you turn this option On the Event logs will stay all white for default unless you change it!");
v116.other.boldlogclr = v116.other.eventbold:color_picker("\v\239\135\188\r\tBold logs Color", color(245, 245, 245, 255));
v116.other.push_notify = v116.other.logsbomba:button("Preview Notify logs", nil, true);
v116.other.pinggrp = v116.other.unlockping:create();
v116.other.pingslider = v116.other.pinggrp:slider("Fake Latency", 0, 200, 0, 1);
v116.other.pingslider:tooltip("[ \vBIND THIS \r]");
v116.other.gs = v116.other.gsindicators:create();
v116.other.spectatorlist = v116.other.gs:switch("\v\239\129\174\r\tSpectator List");
v116.other.mindmgstyle = v116.other.gs:combo("\v\238\144\156\r\tDamage Style", "Default", "Number");
v116.other.zindicators = v116.other.gs:listable("Indicators", "Double Tap", "Hide Shots", "Freestanding", "Fake Duck", "Hitchance Override", "Minimum damage", "Ping Spike", "Force Body Aim", "Bomb", "Dormant Aimbot", "Fakelag", "Hit Percentage", "Force Safe Points");
v116.other.animsbomba = v116.other.anims:create();
v116.other.menuanims = v116.other.animsbomba:list("\aFFDF00F4\239\129\177\t\rWorks Only On Clientside", "\v\239\134\131\r  On Ground", "\v\238\149\134\r  In Air", "\v\238\148\184\r  On landing", "\v\238\149\141\r  Body");
v116.other.menuonground = v116.other.animsbomba:combo("\v\239\149\148\r\tWhen Moving", "Disabled", "Reversed", "Moonwalk", "Jitter Legs", "Gamesense");
v116.other.jitterl = v116.other.animsbomba:slider(" \vI-\r\tFirst Value", 0, 100, 0, 1, function(v124)
    if v124 > 0 then
        return "\aB6B665FF" .. v124 .. "%";
    elseif v124 == 0 then
        return v124 .. "%";
    else
        return;
    end;
end);
v116.other.jitterr = v116.other.animsbomba:slider(" \vL\r\tSecond Value", 0, 100, 0, 1, function(v125)
    if v125 > 0 then
        return "\aB6B665FF" .. v125 .. "%";
    elseif v125 == 0 then
        return v125 .. "%";
    else
        return;
    end;
end);
v116.other.ongroundslide = v116.other.animsbomba:switch("\v\238\137\146\r\tFake walk");
v116.other.onground = v116.other.animsbomba:switch("\v\239\159\139\r\tSliding Crouch");
v116.other.menuonair = v116.other.animsbomba:combo("\v\239\129\178\r\tIn Air", "Disabled", "Static", "Jitter", "Moonwalk");
v116.other.onair = v116.other.animsbomba:switch("\v\238\149\134\r\tFalling Legs");
v116.other.onland = v116.other.animsbomba:switch("\v\238\148\184\r\tPitch Zero");
v116.other.menubodylean = v116.other.animsbomba:slider("\v\238\149\145\r\tBody Lean", 0, 100, 0, 1, function(v126)
    if v126 == 0 then
        return "Off";
    else
        return "\aB6B665FF" .. v126 .. "%";
    end;
end);
v116.other.interpolation = v116.other.animsbomba:switch("\v\238\146\178\t\rInterpolation");
v116.other.menuextras = v116.other.animsbomba:listable("Extras\v\t\226\140\132", "Earth Quake", "Kangaroo", "Smoothing");
v116.other.adicoes = v116.other.addons:create();
v116.other.adicoeslist = v116.other.adicoes:listable("\v\239\132\174\r\tAddons", "\v\239\149\139\r\tDisable Foot Shadows", "\v\238\145\191\r\t Keep Model Transparency", "\v\238\150\148\r\tFix Chams Color", "\v\238\140\155\r\t Party Mode");
v116.other.fpsgrp = v116.other.fpsboost:create();
v116.other.improvementops = v116.other.fpsgrp:listable("\v\239\128\190\r\tImprovements", "\v\239\157\137\r\tDisable Shadows", "\v\239\151\135\r\tDisable Blood", "\v\239\149\181\r\t Disable Decals", "\v\239\157\134\r\tDisable 3D Sky", "\v\239\157\142\r\tDisable Fog", "\v\238\131\137\r\t Disable Bloom", "\v\239\129\181\r\t Other");
v116.other.namegrp = v116.other.namechanger:create();
v116.other.inputname = v116.other.namegrp:input("\v\238\134\191\r\tCustom Name");
v116.other.generatenamebutton = v116.other.namegrp:button("Generate Name", function()
    -- upvalues: v116 (ref)
    local v127 = network.get("https://randommer.io/api/Name?nameType=fullname&Quantity=1", {
        ["X-Api-Key"] = "febb662415de46da9cc77a1d9556ff92"
    });
    v127 = json.parse(v127);
    v116.other.inputname:set(v127[1]);
end, true);
v116.other.setnamebutton = v116.other.namegrp:button("Set", function()
    -- upvalues: v116 (ref)
    common.set_name(v116.other.inputname.value);
end, true);
v116.other.resetbuttonname = v116.other.namegrp:button("Reset", function()
    common.set_name(panorama.MyPersonaAPI.GetName());
end, true);
v116.other.clearinputname = v116.other.namegrp:button("Clear", function()
    -- upvalues: v116 (ref)
    v116.other.inputname:reset();
end, true);
v116.other.gsgrenadegrp = v116.other.gsgrenadethings:create();
v116.other.gsgrenadethingslist = v116.other.gsgrenadegrp:list("", "Grenade Radius", "Additions");
v116.other.molotov = v116.other.gsgrenadegrp:switch("\v\239\129\173\r\t  Molotov");
v116.other.molotovclr = v116.other.molotov:color_picker(color(255, 163, 163, 190));
v116.other.smoke = v116.other.gsgrenadegrp:switch("\v\239\157\160\r\tSmoke");
v116.other.smokeclr = v116.other.smoke:color_picker(color(108, 163, 255, 190));
v116.other.gsprediction = v116.other.gsgrenadegrp:switch("\v\239\162\153\r\tGrenade Prediciton");
v116.other.gsproxwarn = v116.other.gsgrenadegrp:switch("\v\239\129\170\r\t Grenade Proximity Warning");
v116.other.dormantgrp = v116.other.dormantaimbot:create();
v116.other.dormanthbox = v116.other.dormantgrp:selectable("Hitboxes", "Head", "Chest", "Stomach", "Legs");
v116.other.dormantaccuracy = v116.other.dormantgrp:slider("Accuracy", 50, 85, 60, nil, "%");
v116.other.dormantdmg = v116.other.dormantgrp:slider("Minimum damage", 0, 126, 10, nil, function(v128)
    if v128 == 0 then
        return "Inherited";
    elseif v128 > 100 then
        return "HP + " .. v128;
    else
        return v128;
    end;
end);
v116.other.dormantautoscope = v116.other.dormantgrp:switch("Auto Scope");
for v129 = 1, 9 do
    v116.antiaim.builder[v129] = {};
    v116.antiaim.builder[v129].pitch = v112.aa_tab2:combo("\v\238\130\141  \rPitch", "Disabled", "Down", "Up");
    v116.antiaim.builder[v129].yaw = v112.aa_tab2:combo("\v\239\149\168  \rYaw", "Disabled", "Backward", "Static");
    v116.antiaim.builder[v129].yawgrp = v116.antiaim.builder[v129].yaw:create();
    v116.antiaim.builder[v129].yawbase = v116.antiaim.builder[v129].yawgrp:combo("\vYaw Base\r", "Local View", "At Target");
    v116.antiaim.builder[v129].yawmode = v112.aa_tab2:combo("\v\238\146\158  \rYaw Mode", "Static", "L&R");
    v116.antiaim.builder[v129].yawmodebomba = v116.antiaim.builder[v129].yawmode:create();
    v116.antiaim.builder[v129].yawmode_offset = v116.antiaim.builder[v129].yawmodebomba:slider("\vOffset", -180, 180, 0, 1, "\194\176");
    v116.antiaim.builder[v129].yawmode_loffset = v116.antiaim.builder[v129].yawmodebomba:slider("\vLeft Offset", -180, 180, 0, 1, "\194\176");
    v116.antiaim.builder[v129].yawmode_roffset = v116.antiaim.builder[v129].yawmodebomba:slider("\vRight Offset", -180, 180, 0, 1, "\194\176");
    v116.antiaim.builder[v129].yawmode_delayoffset = v116.antiaim.builder[v129].yawmodebomba:slider("\vDelay \aDEFAULT~", 0, 14, 0, 1, function(v130)
        if v130 == 0 then
            return "Off";
        else
            return v130 .. "t";
        end;
    end);
    v116.antiaim.builder[v129].yawmode_delayrandom = v116.antiaim.builder[v129].yawmodebomba:slider("\v\239\129\148  Randomization", 0, 100, 0, 1, function(v131)
        if v131 == 0 then
            return "Off";
        else
            return v131 .. "%";
        end;
    end);
    v116.antiaim.builder[v129].yawmode_delaysync = v116.antiaim.builder[v129].yawmodebomba:switch("\v\239\129\148  Sync delay with Body Yaw", false);
    v116.antiaim.builder[v129].yawjitter = v112.aa_tab2:combo("\v\239\151\146  \rYaw Jitter", "Disabled", "Center", "Offset", "Random", "Spin", "3-Way", "5-Way");
    v116.antiaim.builder[v129].yawjitterbomba = v116.antiaim.builder[v129].yawjitter:create();
    v116.antiaim.builder[v129].yawjitterrandom = v116.antiaim.builder[v129].yawjitterbomba:switch("\v\239\129\180\tRandom Jitter Offset");
    v116.antiaim.builder[v129].yawjitteroffset = v116.antiaim.builder[v129].yawjitterbomba:slider("\v\226\128\162  Offset", -180, 180, 0, 1, "\194\176");
    v116.antiaim.builder[v129].yawjittermin = v116.antiaim.builder[v129].yawjitterbomba:slider("\v\239\129\148  Min", -180, 180, 0, 1, "\194\176");
    v116.antiaim.builder[v129].yawjittermax = v116.antiaim.builder[v129].yawjitterbomba:slider("\v\239\129\148  Max", -180, 180, 0, 1, "\194\176");
    v116.antiaim.builder[v129].body_yaw = v112.aa_tab2:switch("\v\238\146\157  \rBody Yaw");
    v116.antiaim.builder[v129].bodyyaw = v116.antiaim.builder[v129].body_yaw:create();
    v116.antiaim.builder[v129].bodyyawinv = v116.antiaim.builder[v129].bodyyaw:switch("Inverter");
    v116.antiaim.builder[v129].bodyyawmode = v116.antiaim.builder[v129].bodyyaw:combo("Mode", "Static");
    v116.antiaim.builder[v129].bodyyawfs = v112.aa_tab2:combo("\v\239\161\191  \rDesync FS", "Off", "Peek Fake", "Peek Real");
    v116.antiaim.builder[v129].bodyyawops = v116.antiaim.builder[v129].bodyyaw:selectable("\v\239\151\191  \rOptions", "Avoid Overlap", "Jitter", "Randomize Jitter", "Anti Bruteforce");
    v116.antiaim.builder[v129].bodyyawlimitmode = v116.antiaim.builder[v129].bodyyaw:combo("\v\239\151\191  \rLimit Mode", "Static", "Random", "From ~ To");
    v116.antiaim.builder[v129].bodyyawlimitl = v116.antiaim.builder[v129].bodyyaw:slider("\v\239\141\149  Left Limit", 0, 60, 0, "\194\176");
    v116.antiaim.builder[v129].bodyyawlimitr = v116.antiaim.builder[v129].bodyyaw:slider("\v\239\141\150  Right Limit", 0, 60, 0, "\194\176");
    v116.antiaim.builder[v129].bodyyawmin = v116.antiaim.builder[v129].bodyyaw:slider("\v\239\129\168  \vMin", 0, 60, 0, "\194\176");
    v116.antiaim.builder[v129].bodyyawmax = v116.antiaim.builder[v129].bodyyaw:slider("\v+  \vMax", 0, 60, 0, "\194\176");
    v116.antiaim.builder[v129].bodyyawfrom = v116.antiaim.builder[v129].bodyyaw:slider("\vFrom  \239\141\135", 0, 60, 0, "\194\176");
    v116.antiaim.builder[v129].bodyyawto = v116.antiaim.builder[v129].bodyyaw:slider("\vTo  \239\141\136", 0, 60, 0, "\194\176");
    v116.antiaim.builder[v129].defensive_aa = v112.aa_tab4:switch("\v\239\161\150\t\rDefensive Anti-Aim");
    v116.antiaim.builder[v129].defensivemenu = v116.antiaim.builder[v129].defensive_aa:create();
    v116.antiaim.builder[v129].hittable = v116.antiaim.builder[v129].defensivemenu:switch("\aF7FF00FF~ \vForce Defensive");
    v116.antiaim.builder[v129].disablers = v116.antiaim.builder[v129].defensivemenu:selectable("\aF7FF00FF~ \vDisablers", "Manual Yaw", "Freestanding");
    v116.antiaim.builder[v129].defensivepitch = v112.aa_tab4:combo("\v\238\129\130\t\rPitch", "Disabled", "Down", "Up", "Semi Down", "Semi Up", "Random", "Zero", "Custom");
    v116.antiaim.builder[v129].defensivepitch_custom = v112.aa_tab4:slider("\v\226\128\162  Offset", -89, 89, 0, 1, function(v132)
        if v132 == -89 then
            return "Up";
        elseif v132 == 89 then
            return "Down";
        else
            return v132 .. "\194\176";
        end;
    end);
    v116.antiaim.builder[v129].defensiveyaw = v112.aa_tab4:combo("\v\239\147\189\t\rYaw", "Disabled", "Sideways", "Spin", "Opposite", "Random", "Custom");
    v116.antiaim.builder[v129].defensiveyaw_spinspeed = v112.aa_tab4:slider("\v\239\129\148  Speed", 0, 10, 0, 1, function(v133)
        if v133 == 0 then
            return "Default";
        else
            return v133 .. "t";
        end;
    end);
    v116.antiaim.builder[v129].defensiveyaw_randomfrom = v112.aa_tab4:slider("\v\239\129\148  From", -180, 180, 0, 1, "\194\176");
    v116.antiaim.builder[v129].defensiveyaw_randomto = v112.aa_tab4:slider("\v\239\129\148  To", -180, 180, 0, 1, "\194\176");
    v116.antiaim.builder[v129].defensiveyaw_custom = v112.aa_tab4:slider("\v\239\129\148  Offset", -180, 180, 0, 1, "\194\176");
    v116.antiaim.builder[v129].pitch:tooltip("\vDefault Neverlose Function");
    v116.antiaim.builder[v129].yaw:tooltip("\vDefault Neverlose Function");
    v116.antiaim.builder[v129].yawjitter:tooltip("\vDefault Neverlose Function");
    v116.antiaim.builder[v129].yawmode:tooltip("\vDefault Neverlose Function");
    v116.antiaim.builder[v129].yawmode_delayoffset:tooltip("\vIf the value > 0 then this will override Body Yaw to Off");
    v116.antiaim.builder[v129].body_yaw:tooltip("\vDefault Neverlose Function");
    v116.antiaim.builder[v129].bodyyawmode:tooltip("\vIf the value is not static, then interacts with desync by toggling it on and off depending on the set ticks or multiplier;\n\nCan be used in combination with the force break lc function.");
    v116.antiaim.builder[v129].bodyyawops:tooltip("\vDefault Neverlose Function");
    v116.antiaim.builder[v129].hittable:tooltip("If not enabled, does not allow Defensive anti-aim to work only when the local player is hittable;\n\nConditional.");
    v116.antiaim.builder[v129].disablers:tooltip("\vConditional.");
end;
v116.other.interpolation:tooltip("Smooths out local player animations in order to make them look nicer. It replicates some of the \a95b606FFgamesense\r's animation fix logic.\n\nThis will also disable '\vFake Walk\r', '\vSliding Crouch\r' and '\vMoonwalk in Air\r'.");
local l_accent_1 = l_pui_0.accent;
local v135 = v112.main_tab:texture(v104, vector(280, 280), l_accent_1, "f");
local function v136()
    -- upvalues: l_pui_0 (ref), l_accent_1 (ref), v135 (ref)
    if l_pui_0.alpha > 0.5 and l_accent_1 ~= l_pui_0.accent then
        l_accent_1 = l_pui_0.accent;
        v135:set(l_accent_1);
    end;
end;
local function v140()
    -- upvalues: l_pui_0 (ref), v44 (ref), v116 (ref), v112 (ref)
    if l_pui_0.alpha == 0 then
        return;
    else
        local v137 = v44.gradient("\239\162\144", color(38, 38, 38), color(l_pui_0.accent.r, l_pui_0.accent.g, l_pui_0.accent.b), 1.1);
        local v138 = v44.gradient("[essence]", color(38, 38, 38), color(l_pui_0.accent.r, l_pui_0.accent.g, l_pui_0.accent.b), 1.05);
        ui.sidebar(v138, v137);
        v116.main.info:visibility(v116.main.about.value == 1);
        v116.main.save_cfg:visibility(v116.main.about.value == 2);
        v116.main.del_cfg:visibility(v116.main.about.value == 2);
        v116.main.loadsettings:visibility(v116.main.about.value == 2);
        v116.main.import_cfg:visibility(v116.main.about.value == 2);
        v116.main.export_cfg:visibility(v116.main.about.value == 2);
        v116.main.infobugs:visibility(v116.main.about.value == 1);
        v116.main.discordbutton:visibility(v116.main.about.value == 1);
        v116.main.antiaimcfg:visibility(v116.main.about.value == 2);
        v116.main.configlist:visibility(v116.main.about.value == 2);
        v116.main.configname:visibility(v116.main.about.value == 2);
        v116.main.username:visibility(v116.main.about.value == 1);
        v116.main.butaouser:visibility(v116.main.about.value == 1);
        v116.main.buildinfo:visibility(v116.main.about.value == 1);
        v116.main.buildbotao:visibility(v116.main.about.value == 1);
        v116.main.socials:visibility(v116.main.about.value == 1);
        v116.main.youtube:visibility(v116.main.about.value == 1);
        v116.main.marketconfig:visibility(v116.main.about.value == 1);
        v116.main.verifybutton:visibility(v116.main.about.value == 1);
        v116.antiaim.backstab:visibility(v116.antiaim.tabs.value == 3);
        v116.antiaim.fs:visibility(v116.antiaim.tabs.value == 3);
        v116.antiaim.manual_aa:visibility(v116.antiaim.tabs.value == 3);
        v116.antiaim.safe_head:visibility(v116.antiaim.tabs.value == 3);
        v116.antiaim.disablersbomba:visibility(v116.antiaim.tabs.value == 3);
        v116.antiaim.safeknifegear:visibility(v116.antiaim.safe_head.value);
        v116.antiaim.disablerwhen:visibility(v116.antiaim.disablersbomba.value ~= "Off");
        v116.antiaim.disablerspinpitch:visibility(v116.antiaim.disablersbomba.value == "Spin");
        for v139 = 1, 9 do
            v116.antiaim.states:visibility(v116.antiaim.tabs.value == 1 or v116.antiaim.tabs.value == 2);
            v116.antiaim.builder[v139].pitch:visibility(v116.antiaim.states.value == v139 and v116.antiaim.tabs.value == 1);
            v116.antiaim.builder[v139].yaw:visibility(v116.antiaim.states.value == v139 and v116.antiaim.tabs.value == 1);
            v116.antiaim.builder[v139].yawgrp:visibility(v116.antiaim.states.value == v139 and v116.antiaim.builder[v139].yaw.value ~= "Disabled" and v116.antiaim.tabs.value == 1);
            v116.antiaim.builder[v139].yawbase:visibility(v116.antiaim.states.value == v139 and v116.antiaim.tabs.value == 1);
            v116.antiaim.builder[v139].yawmode:visibility(v116.antiaim.states.value == v139 and v116.antiaim.builder[v139].yaw.value ~= "Disabled" and v116.antiaim.tabs.value == 1);
            v116.antiaim.builder[v139].yawmodebomba:visibility(v116.antiaim.states.value == v139 and v116.antiaim.tabs.value == 1);
            v116.antiaim.builder[v139].yawmode_offset:visibility(v116.antiaim.states.value == v139 and v116.antiaim.builder[v139].yawmode.value == "Static" and v116.antiaim.tabs.value == 1);
            v116.antiaim.builder[v139].yawmode_loffset:visibility(v116.antiaim.states.value == v139 and v116.antiaim.builder[v139].yawmode.value == "L&R" and v116.antiaim.tabs.value == 1);
            v116.antiaim.builder[v139].yawmode_roffset:visibility(v116.antiaim.states.value == v139 and v116.antiaim.builder[v139].yawmode.value == "L&R" and v116.antiaim.tabs.value == 1);
            v116.antiaim.builder[v139].yawmode_delayoffset:visibility(v116.antiaim.states.value == v139 and v116.antiaim.builder[v139].yawmode.value == "L&R" and v116.antiaim.tabs.value == 1);
            v116.antiaim.builder[v139].yawmode_delayrandom:visibility(v116.antiaim.states.value == v139 and v116.antiaim.builder[v139].yawmode.value == "L&R" and v116.antiaim.tabs.value == 1 and v116.antiaim.builder[v139].yawmode_delayoffset.value > 0);
            v116.antiaim.builder[v139].yawmode_delaysync:visibility(v116.antiaim.states.value == v139 and v116.antiaim.builder[v139].yawmode.value == "L&R" and v116.antiaim.builder[v139].yawmode_delayoffset.value ~= 0);
            v116.antiaim.builder[v139].yawjitter:visibility(v116.antiaim.states.value == v139 and v116.antiaim.tabs.value == 1);
            v116.antiaim.builder[v139].yawjitterbomba:visibility(v116.antiaim.states.value == v139 and v116.antiaim.builder[v139].yawjitter.value ~= "Disabled" and v116.antiaim.tabs.value == 1);
            v116.antiaim.builder[v139].yawjitterrandom:visibility(v116.antiaim.states.value == v139 and v116.antiaim.tabs.value == 1);
            v116.antiaim.builder[v139].yawjitteroffset:visibility(v116.antiaim.states.value == v139 and v116.antiaim.tabs.value == 1);
            v116.antiaim.builder[v139].yawjittermin:visibility(v116.antiaim.states.value == v139 and v116.antiaim.builder[v139].yawjitterrandom.value and v116.antiaim.tabs.value == 1);
            v116.antiaim.builder[v139].yawjittermax:visibility(v116.antiaim.states.value == v139 and v116.antiaim.builder[v139].yawjitterrandom.value and v116.antiaim.tabs.value == 1);
            v116.antiaim.builder[v139].body_yaw:visibility(v116.antiaim.states.value == v139 and v116.antiaim.tabs.value == 1);
            v116.antiaim.builder[v139].bodyyaw:visibility(v116.antiaim.states.value == v139 and v116.antiaim.builder[v139].body_yaw.value and v116.antiaim.tabs.value == 1);
            v116.antiaim.builder[v139].bodyyawinv:visibility(v116.antiaim.states.value == v139 and v116.antiaim.tabs.value == 1);
            v116.antiaim.builder[v139].bodyyawmode:visibility(v116.antiaim.states.value == v139 and v116.antiaim.tabs.value == 1);
            v116.antiaim.builder[v139].bodyyawops:visibility(v116.antiaim.states.value == v139);
            v116.antiaim.builder[v139].bodyyawlimitmode:visibility(v116.antiaim.states.value == v139 and v116.antiaim.tabs.value == 1);
            v116.antiaim.builder[v139].bodyyawlimitl:visibility(v116.antiaim.states.value == v139 and v116.antiaim.builder[v139].bodyyawlimitmode.value == "Static" and v116.antiaim.tabs.value == 1);
            v116.antiaim.builder[v139].bodyyawlimitr:visibility(v116.antiaim.states.value == v139 and v116.antiaim.builder[v139].bodyyawlimitmode.value == "Static" and v116.antiaim.tabs.value == 1);
            v116.antiaim.builder[v139].bodyyawmin:visibility(v116.antiaim.states.value == v139 and v116.antiaim.builder[v139].bodyyawlimitmode.value == "Random" and v116.antiaim.tabs.value == 1);
            v116.antiaim.builder[v139].bodyyawmax:visibility(v116.antiaim.states.value == v139 and v116.antiaim.builder[v139].bodyyawlimitmode.value == "Random" and v116.antiaim.tabs.value == 1);
            v116.antiaim.builder[v139].bodyyawfrom:visibility(v116.antiaim.states.value == v139 and v116.antiaim.builder[v139].bodyyawlimitmode.value == "From ~ To" and v116.antiaim.tabs.value == 1);
            v116.antiaim.builder[v139].bodyyawto:visibility(v116.antiaim.states.value == v139 and v116.antiaim.builder[v139].bodyyawlimitmode.value == "From ~ To" and v116.antiaim.tabs.value == 1);
            v116.antiaim.builder[v139].bodyyawfs:visibility(v116.antiaim.states.value == v139 and v116.antiaim.tabs.value == 1 and v116.antiaim.builder[v139].body_yaw.value);
            v116.antiaim.builder[v139].defensive_aa:visibility(v116.antiaim.states.value == v139 and v116.antiaim.tabs.value == 2);
            v116.antiaim.builder[v139].defensivemenu:visibility(v116.antiaim.states.value == v139 and v116.antiaim.builder[v139].defensive_aa.value);
            v116.antiaim.builder[v139].disablers:visibility(v116.antiaim.states.value == v139 and v116.antiaim.tabs.value == 2);
            v116.antiaim.builder[v139].hittable:visibility(v116.antiaim.states.value == v139 and v116.antiaim.tabs.value == 2);
            v116.antiaim.builder[v139].defensivepitch:disabled(true);
            v116.antiaim.builder[v139].defensivepitch:visibility(v116.antiaim.states.value == v139 and v116.antiaim.tabs.value == 2);
            v116.antiaim.builder[v139].defensivepitch_custom:visibility(v116.antiaim.states.value == v139 and v116.antiaim.builder[v139].defensive_aa.value and v116.antiaim.builder[v139].defensivepitch.value == "Custom" and v116.antiaim.tabs.value == 2);
            v116.antiaim.builder[v139].defensiveyaw:visibility(v116.antiaim.states.value == v139 and v116.antiaim.tabs.value == 2);
            v116.antiaim.builder[v139].defensiveyaw:disabled(true);
            v116.antiaim.builder[v139].defensiveyaw_spinspeed:visibility(v116.antiaim.states.value == v139 and v116.antiaim.builder[v139].defensive_aa.value and v116.antiaim.builder[v139].defensiveyaw.value == "Spin" and v116.antiaim.tabs.value == 2);
            v116.antiaim.builder[v139].defensiveyaw_randomfrom:visibility(v116.antiaim.states.value == v139 and v116.antiaim.builder[v139].defensive_aa.value and v116.antiaim.builder[v139].defensiveyaw.value == "Random" and v116.antiaim.tabs.value == 2);
            v116.antiaim.builder[v139].defensiveyaw_randomto:visibility(v116.antiaim.states.value == v139 and v116.antiaim.builder[v139].defensive_aa.value and v116.antiaim.builder[v139].defensiveyaw.value == "Random" and v116.antiaim.tabs.value == 2);
            v116.antiaim.builder[v139].defensiveyaw_custom:visibility(v116.antiaim.states.value == v139 and v116.antiaim.builder[v139].defensive_aa.value and v116.antiaim.builder[v139].defensiveyaw.value == "Custom" and v116.antiaim.tabs.value == 2);
            if v116.antiaim.builder[v139].defensive_aa.value then
                v116.antiaim.builder[v139].defensivepitch:disabled(false);
                v116.antiaim.builder[v139].defensiveyaw:disabled(false);
            end;
        end;
        v116.visuals.indicators:visibility(v116.visuals.tabs.value == 1);
        v116.visuals.dmgovrind:visibility(v116.visuals.tabs.value == 1);
        v116.visuals.watermark:visibility(v116.visuals.tabs.value == 1);
        v116.visuals.customscope:visibility(v116.visuals.tabs.value == 1);
        v116.visuals.defensiveind:visibility(v116.visuals.tabs.value == 1);
        v116.visuals.slowind:visibility(v116.visuals.tabs.value == 1);
        v116.visuals.manual_aarows:visibility(v116.visuals.tabs.value == 1);
        v116.visuals.marksimplespaces:visibility(v116.visuals.marktype.value == 2);
        v116.visuals.marksimplepos:visibility(v116.visuals.marktype.value == 2);
        v116.visuals.markbombafont:visibility(v116.visuals.marktype.value == 1);
        v116.visuals.markname:visibility(v116.visuals.marktype.value == 3);
        v116.visuals.markimages:visibility(v116.visuals.marktype.value == 3);
        v116.visuals.marknameinput:visibility(v116.visuals.markname.value == "Custom" and v116.visuals.marktype.value == 3);
        v116.visuals.velocitypos_x:visibility(false);
        v116.visuals.velocitypos_y:visibility(false);
        v116.visuals.crosshair:visibility(v116.visuals.indicators.value);
        v116.visuals.crosshairglow:visibility(v116.visuals.crosshairind.value == 2);
        v116.visuals.crosshairglowslider:visibility(v116.visuals.crosshairind.value == 2 and v116.visuals.crosshairglow.value);
        v116.visuals.crosshair_remove_stateicons:visibility(v116.visuals.crosshairind.value == 1);
        v116.visuals.crosshairindy:visibility(false);
        v116.visuals.dmgovrbomba:visibility(v116.visuals.dmgovrind.value);
        v116.visuals.dmg_indx:visibility(false);
        v116.visuals.dmg_indy:visibility(false);
        v116.visuals.markbomba:visibility(v116.visuals.watermark.value);
        v116.visuals.manualarrowsbomba:visibility(v116.visuals.manual_aarows.value);
        v116.visuals.manualarrowsalways:visibility(v116.visuals.manualarrowstype.value == 1);
        v116.visuals.manualarrowscolor:visibility(v116.visuals.manualarrowstype.value == 1);
        v116.visuals.manualarrowstscolor1:visibility(v116.visuals.manualarrowstype.value == 2);
        v116.visuals.manualarrowstscolor2:visibility(v116.visuals.manualarrowstype.value == 2);
        v116.visuals.manualarrowsposx:visibility(false);
        v116.visuals.velocitygrp:visibility(v116.visuals.slowind.value);
        v116.visuals.scopebomba:visibility(v116.visuals.customscope.value);
        v116.visuals.defensiveindclr:visibility(v116.visuals.defensiveind.value);
        v116.visuals.defensiveindx:visibility(false);
        v116.visuals.defensiveindy:visibility(false);
        v116.visuals.infopanel:visibility(v116.visuals.tabs.value == 1);
        v116.visuals.panelgrp:visibility(v116.visuals.infopanel.value);
        v116.visuals.panel_x:visibility(false);
        v116.visuals.panel_y:visibility(false);
        v116.other.anims:visibility(v116.visuals.tabs.value == 2);
        v116.other.animated_zoom:visibility(v116.visuals.tabs.value == 2);
        v116.other.aspectr:visibility(v116.visuals.tabs.value == 2);
        v116.other.edge_stop:visibility(v116.visuals.tabs.value == 3);
        v116.other.viewchanger:visibility(v116.visuals.tabs.value == 2);
        v116.other.gsindicators:visibility(v116.visuals.tabs.value == 2);
        v116.other.unlockping:visibility(v116.visuals.tabs.value == 3);
        v116.other.clantag:visibility(v116.visuals.tabs.value == 2);
        v116.other.addons:visibility(v116.visuals.tabs.value == 3);
        v116.other.logs:visibility(v116.visuals.tabs.value == 3);
        v116.other.namechanger:visibility(v116.visuals.tabs.value == 3);
        v116.other.fpsboost:visibility(v116.visuals.tabs.value == 3);
        v116.other.customfd:visibility(v116.visuals.tabs.value == 3);
        v116.other.fastladder:visibility(v116.visuals.tabs.value == 3);
        v116.other.nofalldamage:visibility(v116.visuals.tabs.value == 3);
        v116.other.gsgrenadegrp:visibility(v116.other.gsgrenadethings.value);
        v116.other.gsgrenadethings:visibility(v116.visuals.tabs.value == 2);
        v116.other.molotov:visibility(v116.other.gsgrenadethingslist.value == 1);
        v116.other.smoke:visibility(v116.other.gsgrenadethingslist.value == 1);
        v116.other.molotovclr:visibility(v116.other.molotov.value and v116.other.gsgrenadethingslist.value == 1);
        v116.other.smokeclr:visibility(v116.other.smoke.value and v116.other.gsgrenadethingslist.value == 1);
        v116.other.gsprediction:visibility(v116.other.gsgrenadethingslist.value == 2);
        v116.other.gsproxwarn:visibility(v116.other.gsgrenadethingslist.value == 2);
        v116.other.dormantgrp:visibility(v116.other.dormantaimbot.value);
        v116.other.dormantaimbot:visibility(v116.visuals.tabs.value == 3);
        v116.other.menuonground:visibility(v116.other.menuanims.value == 1);
        v116.other.menuonair:visibility(v116.other.menuanims.value == 2);
        v116.other.onland:visibility(v116.other.menuanims.value == 3);
        v116.other.menubodylean:visibility(v116.other.menuanims.value == 4);
        v116.other.onground:visibility(v116.other.menuanims.value == 1);
        v116.other.ongroundslide:visibility(v116.other.menuanims.value == 1);
        v116.other.interpolation:visibility(v116.other.menuanims.value == 4);
        v116.other.onair:visibility(v116.other.menuanims.value == 2);
        v116.other.jitterl:visibility(v116.other.menuanims.value == 1 and v116.other.menuonground.value == "Jitter Legs");
        v116.other.jitterr:visibility(v116.other.menuanims.value == 1 and v116.other.menuonground.value == "Jitter Legs");
        v116.other.menuextras:visibility(v116.other.menuanims.value == 4);
        v116.other.animsbomba:visibility(v116.other.anims.value);
        v116.other.aspectrbomba:visibility(v116.other.aspectr.value);
        v116.other.viewbomba:visibility(v116.other.viewchanger.value);
        v116.other.gs:visibility(v116.other.gsindicators.value);
        v116.other.mindmgstyle:visibility(v116.other.zindicators:get(6));
        v116.other.logscolor:visibility(v116.other.logstype:get("Event") or v116.other.logstype:get("Console"));
        v116.other.eventbold:visibility(v116.other.logstype:get("Event"));
        v116.other.plogsclr:visibility(v116.other.plogs.value);
        v116.other.boldlogclr:visibility(v116.other.eventbold.value);
        v116.other.notifyscolor:visibility(v116.other.logstype:get("Notify"));
        v116.other.push_notify:visibility(v116.other.logstype:get("Notify"));
        v116.other.pinggrp:visibility(v116.other.unlockping.value);
        if v116.antiaim.tabs.value == 1 then
            v112.aa_tab2:name("Builder");
        elseif v116.antiaim.tabs.value == 3 then
            v112.aa_tab2:name("Other");
        end;
        if v116.visuals.tabs.value == 2 then
            v112.misc_tab2:name("Other");
        elseif v116.visuals.tabs.value == 3 then
            v112.misc_tab2:name("Miscellaneous");
        end;
        if v116.main.about.value == 1 then
            v116.main.about:update("\239\131\154\t\a{Link Active}\239\128\149  About", "\226\128\162\t\239\153\160  Configs");
            v112.main_tab2:name("Informations");
        elseif v116.main.about.value == 2 then
            v116.main.about:update("\226\128\162\t\239\128\149  About", "\239\131\154\t\a{Link Active}\239\153\160  Configs");
            v112.main_tab2:name("Config List");
        end;
        if v116.main.antiaimcfgsep.value == 1 then
            v116.main.antiaimcfgsep:update("\239\131\154   \a{Link Active}Everything", "\226\128\162   Only Anti-Aim");
        else
            v116.main.antiaimcfgsep:update("\226\128\162   Everything", "\239\131\154   \a{Link Active}Only Anti-Aim");
        end;
        if v116.antiaim.tabs.value == 1 then
            v116.antiaim.tabs:update("\a{Link Active}\239\159\148   \aDEFAULTBuilder", "\238\149\181  Defensive", "\238\148\177  Other");
        elseif v116.antiaim.tabs.value == 2 then
            v116.antiaim.tabs:update("\239\159\148   Builder", "\a{Link Active}\238\149\181  \aDEFAULTDefensive", "\238\148\177  Other");
        elseif v116.antiaim.tabs.value == 3 then
            v116.antiaim.tabs:update("\239\159\148   Builder", "\238\149\181  Defensive", "\a{Link Active}\238\148\177  \aDEFAULTOther");
        end;
        if v116.antiaim.tabs.value == 1 then
            v116.antiaim.states:update("\239\134\131\t\aDEFAULTStanding", "\v\239\156\140\r   Moving", "\v\239\149\148\t\rSlowalking", "\v\239\134\147\r  Crouching", "\v\238\139\142\r   Sneaking", "\v\238\149\134\r   Air", "\v\239\159\135\r  Air Crouch");
            if v116.antiaim.states.value == 1 then
                v116.antiaim.states:update("\239\131\154\t\a{Link Active}\239\134\131\t\aDEFAULTStanding", "\v\239\156\140\r   Moving", "\v\239\149\148\t\rSlowalking", "\v\239\134\147\r  Crouching", "\v\238\139\142\r   Sneaking", "\v\238\149\134\r   Air", "\v\239\159\135\r  Air Crouch");
            elseif v116.antiaim.states.value == 2 then
                v116.antiaim.states:update("\239\134\131\t\aDEFAULTStanding", "\239\131\154\t\a{Link Active}\239\156\140\aDEFAULT   Moving", "\v\239\149\148\t\rSlowalking", "\v\239\134\147\r  Crouching", "\v\238\139\142\r   Sneaking", "\v\238\149\134\r   Air", "\v\239\159\135\r  Air Crouch");
            elseif v116.antiaim.states.value == 3 then
                v116.antiaim.states:update("\239\134\131\t\aDEFAULTStanding", "\239\156\140   Moving", "\239\131\154\t\a{Link Active}\239\149\148\t\aDEFAULTSlowalking", "\v\239\134\147\r  Crouching", "\v\238\139\142\r   Sneaking", "\v\238\149\134\r   Air", "\v\239\159\135\r  Air Crouch");
            elseif v116.antiaim.states.value == 4 then
                v116.antiaim.states:update("\239\134\131\t\aDEFAULTStanding", "\239\156\140   Moving", "\239\149\148\tSlowalking", "\239\131\154\t\a{Link Active}\239\134\147\aDEFAULT  Crouching", "\v\238\139\142\r   Sneaking", "\v\238\149\134\r   Air", "\v\239\159\135\r  Air Crouch");
            elseif v116.antiaim.states.value == 5 then
                v116.antiaim.states:update("\239\134\131\t\aDEFAULTStanding", "\239\156\140   Moving", "\239\149\148\tSlowalking", "\239\134\147  Crouching", "\239\131\154\t\a{Link Active}\238\139\142\aDEFAULT   Sneaking", "\v\238\149\134\r   Air", "\v\239\159\135\r  Air Crouch");
            elseif v116.antiaim.states.value == 6 then
                v116.antiaim.states:update("\239\134\131\t\aDEFAULTStanding", "\239\156\140   Moving", "\239\149\148\tSlowalking", "\239\134\147  Crouching", "\238\139\142   Sneaking", "\239\131\154\t\a{Link Active}\238\149\134\aDEFAULT   Air", "\v\239\159\135\r  Air Crouch");
            elseif v116.antiaim.states.value == 7 then
                v116.antiaim.states:update("\239\134\131\t\aDEFAULTStanding", "\239\156\140   Moving", "\239\149\148\tSlowalking", "\239\134\147  Crouching", "\238\139\142   Sneaking", "\238\149\134   Air", "\239\131\154\t\a{Link Active}\239\159\135\aDEFAULT  Air Crouch");
            end;
        elseif v116.antiaim.tabs.value == 2 then
            if v116.antiaim.states.value == 1 then
                v116.antiaim.states:update("\239\131\154\t\a{Link Active}\239\134\131\t\aDEFAULTStanding", "\v\239\156\140\r   Moving", "\v\239\149\148\t\rSlowalking", "\v\239\134\147\r  Crouching", "\v\238\139\142\r   Sneaking", "\v\238\149\134\r   Air", "\v\239\159\135\r  Air Crouch", "\238\147\129  Freestanding", "\238\130\162  Manuals");
            elseif v116.antiaim.states.value == 2 then
                v116.antiaim.states:update("\239\134\131\t\aDEFAULTStanding", "\239\131\154\t\a{Link Active}\239\156\140\aDEFAULT   Moving", "\v\239\149\148\t\rSlowalking", "\v\239\134\147\r  Crouching", "\v\238\139\142\r   Sneaking", "\v\238\149\134\r   Air", "\v\239\159\135\r  Air Crouch", "\238\147\129  Freestanding", "\238\130\162  Manuals");
            elseif v116.antiaim.states.value == 3 then
                v116.antiaim.states:update("\239\134\131\t\aDEFAULTStanding", "\239\156\140   Moving", "\239\131\154\t\a{Link Active}\239\149\148\t\aDEFAULTSlowalking", "\v\239\134\147\r  Crouching", "\v\238\139\142\r   Sneaking", "\v\238\149\134\r   Air", "\v\239\159\135\r  Air Crouch", "\238\147\129  Freestanding", "\238\130\162  Manuals");
            elseif v116.antiaim.states.value == 4 then
                v116.antiaim.states:update("\239\134\131\t\aDEFAULTStanding", "\239\156\140   Moving", "\239\149\148\tSlowalking", "\239\131\154\t\a{Link Active}\239\134\147\aDEFAULT  Crouching", "\v\238\139\142\r   Sneaking", "\v\238\149\134\r   Air", "\v\239\159\135\r  Air Crouch", "\238\147\129  Freestanding", "\238\130\162  Manuals");
            elseif v116.antiaim.states.value == 5 then
                v116.antiaim.states:update("\239\134\131\t\aDEFAULTStanding", "\239\156\140   Moving", "\239\149\148\tSlowalking", "\239\134\147  Crouching", "\239\131\154\t\a{Link Active}\238\139\142\aDEFAULT   Sneaking", "\v\238\149\134\r   Air", "\v\239\159\135\r  Air Crouch", "\238\147\129  Freestanding", "\238\130\162  Manuals");
            elseif v116.antiaim.states.value == 6 then
                v116.antiaim.states:update("\239\134\131\t\aDEFAULTStanding", "\239\156\140   Moving", "\239\149\148\tSlowalking", "\239\134\147  Crouching", "\238\139\142   Sneaking", "\239\131\154\t\a{Link Active}\238\149\134\aDEFAULT   Air", "\v\239\159\135\r  Air Crouch", "\238\147\129  Freestanding", "\238\130\162  Manuals");
            elseif v116.antiaim.states.value == 7 then
                v116.antiaim.states:update("\239\134\131\t\aDEFAULTStanding", "\239\156\140   Moving", "\239\149\148\tSlowalking", "\239\134\147  Crouching", "\238\139\142   Sneaking", "\238\149\134   Air", "\239\131\154\t\a{Link Active}\239\159\135\aDEFAULT  Air Crouch", "\238\147\129  Freestanding", "\238\130\162  Manuals");
            elseif v116.antiaim.states.value == 8 then
                v116.antiaim.states:update("\239\134\131\t\aDEFAULTStanding", "\239\156\140   Moving", "\239\149\148\tSlowalking", "\239\134\147  Crouching", "\238\139\142   Sneaking", "\238\149\134   Air", "\239\159\135  Air Crouch", "\239\131\154\t\a{Link Active}\238\147\129\aDEFAULT  Freestanding", "\238\130\162  Manuals");
            elseif v116.antiaim.states.value == 9 then
                v116.antiaim.states:update("\239\134\131\t\aDEFAULTStanding", "\239\156\140   Moving", "\239\149\148\tSlowalking", "\239\134\147  Crouching", "\238\139\142   Sneaking", "\238\149\134   Air", "\239\159\135  Air Crouch", "\238\147\129  Freestanding", "\239\131\154\t\a{Link Active}\238\130\162\aDEFAULT  Manuals");
            end;
        end;
        if v116.visuals.tabs.value == 1 then
            v116.visuals.tabs:update("\a{Link Active}\238\139\138\t\aDEFAULTVisuals", "\v\239\134\179\tOther", "\238\135\183\t Miscellaneous");
        elseif v116.visuals.tabs.value == 2 then
            v116.visuals.tabs:update("\238\139\138\tVisuals", "\a{Link Active}\239\134\179\t\aDEFAULTOther", "\238\135\183\t Miscellaneous");
        elseif v116.visuals.tabs.value == 3 then
            v116.visuals.tabs:update("\238\139\138\tVisuals", "\v\239\134\179\tOther", "\a{Link Active}\238\135\183\t \aDEFAULTMiscellaneous");
        end;
        if v116.other.menuanims.value == 1 then
            v116.other.menuanims:update("\239\131\154\t\a{Link Active}\239\134\131\aDEFAULT  On Ground", "\238\149\134  In Air", "\238\148\184  On landing", "\238\149\141  Body");
        elseif v116.other.menuanims.value == 2 then
            v116.other.menuanims:update("\239\134\131  On Ground", "\239\131\154\t\a{Link Active}\238\149\134\aDEFAULT  In Air", "\238\148\184  On landing", "\238\149\141  Body");
        elseif v116.other.menuanims.value == 3 then
            v116.other.menuanims:update("\239\134\131  On Ground", "\238\149\134  In Air", "\239\131\154\t\a{Link Active}\238\148\184\aDEFAULT  On landing", "\238\149\141  Body");
        elseif v116.other.menuanims.value == 4 then
            v116.other.menuanims:update("\239\134\131  On Ground", "\238\149\134  In Air", "\238\148\184  On landing", "\239\131\154\t\a{Link Active}\238\149\141\aDEFAULT  Body");
        elseif v116.other.menuanims.value == 5 then
            v116.other.menuanims:update("\239\134\131  On Ground", "\238\149\134  In Air", "\238\148\184  On landing", "\238\149\141\aDEFAULT  Move Lean");
        end;
        if v116.other.interpolation.value then
            v116.other.ongroundslide:disabled(true);
            v116.other.ongroundslide:set(false);
            v116.other.onground:disabled(true);
            v116.other.onground:set(false);
            v116.other.menuonair:update("Disabled", "Static", "Jitter");
            v116.other.menuextras:disabled(true);
        else
            v116.other.ongroundslide:disabled(false);
            v116.other.onground:disabled(false);
            v116.other.menuonair:update("Disabled", "Static", "Jitter", "Moonwalk");
            v116.other.menuextras:disabled(false);
        end;
        if v116.visuals.crosshairind.value == 1 then
            v116.visuals.crosshairind:update("\239\131\154\t\a{Link Active}\239\162\144\t\aDEFAULTMinimalist", "\239\131\131\tExperimental");
        else
            v116.visuals.crosshairind:update("\239\162\144\tMinimalist", "\239\131\154\t\a{Link Active}\239\131\131\t\aDEFAULTExperimental");
        end;
        if v116.visuals.crosshairglow.value then
            v116.visuals.crosshairglow:name(l_pui_0.string("\v\238\135\128\r\tGlow  \226\140\132"));
        else
            v116.visuals.crosshairglow:name("\238\135\128\tGlow");
        end;
        if v116.visuals.marktype.value == 1 then
            v116.visuals.marktype:update("\239\131\154  Default", "Simple", "Upper-Right");
        elseif v116.visuals.marktype.value == 2 then
            v116.visuals.marktype:update("Default", "\239\131\154  Simple", "Upper-Right");
        elseif v116.visuals.marktype.value == 3 then
            v116.visuals.marktype:update("Default", "Simple", "\239\131\154  Upper-Right");
        end;
        if v116.visuals.manualarrowstype.value == 1 then
            v116.visuals.manualarrowstype:update("\239\131\154  Simple", "Team-Skeet");
        else
            v116.visuals.manualarrowstype:update("  Simple", "\239\131\154  Team-Skeet");
        end;
        if v116.other.gsgrenadethingslist.value == 1 then
            v116.other.gsgrenadethingslist:update("\239\131\154  Grenade Radius", "Additions");
        elseif v116.other.gsgrenadethingslist.value == 2 then
            v116.other.gsgrenadethingslist:update("Grenade Radius", "\239\131\154  Additions");
        end;
        return;
    end;
end;
local v141 = l_pui_0.setup(v116, true);
v116.main.export_cfg:set_callback(function()
    -- upvalues: v141 (ref), l_base64_0 (ref), l_clipboard_0 (ref)
    local v142 = v141:save();
    local v143 = l_base64_0.encode(json.stringify(v142));
    l_clipboard_0.set(v143);
    common.add_notify("\v\239\128\140\t\rConfig Exported!", "Config exported to clipboard.");
    cvar.play:call("buttons\\button24");
end);
v116.main.import_cfg:set_callback(function()
    -- upvalues: v116 (ref), l_base64_0 (ref), l_clipboard_0 (ref), v141 (ref)
    if v116.main.antiaimcfgsep.value == 1 then
        local v144 = json.parse(l_base64_0.decode(l_clipboard_0.get()));
        v141:load(v144);
        cvar.play:call("buttons\\button24");
        common.add_notify("\v\239\128\140\t\rConfig Imported!", "Config imported from clipboard.");
    elseif v116.main.antiaimcfgsep.value == 2 then
        local v145 = json.parse(l_base64_0.decode(l_clipboard_0.get()));
        v141:load(v145, "antiaim");
        common.add_notify("\v\239\128\140\r\tAnti-Aim Imported!", "Anti Aim settings imported from clipboard.");
        cvar.play:call("buttons\\button24");
    end;
end);
local v146 = files.read("nl\\essence\\configs.json");
local v147 = v146 and json.parse(v146) or {};
v147["\239\162\144 Default"] = "eyJhbnRpYWltIjp7ImJhY2tzdGFiIjp0cnVlLCJidWlsZGVyIjpbeyJib2R5X3lhdyI6dHJ1ZSwiYm9keXlhd2Zyb20iOjAuMCwiYm9keXlhd2ZzIjoiT2ZmIiwiYm9keXlhd2ludiI6ZmFsc2UsImJvZHl5YXdsaW1pdGwiOjYwLjAsImJvZHl5YXdsaW1pdG1vZGUiOiJTdGF0aWMiLCJib2R5eWF3bGltaXRyIjo2MC4wLCJib2R5eWF3bWF4IjowLjAsImJvZHl5YXdtaW4iOjAuMCwiYm9keXlhd21vZGUiOiJTdGF0aWMiLCJib2R5eWF3b3BzIjpbIkppdHRlciIsIn4iXSwiYm9keXlhd3RvIjowLjAsImRlZmVuc2l2ZV9hYSI6ZmFsc2UsImRlZmVuc2l2ZXBpdGNoIjoiRGlzYWJsZWQiLCJkZWZlbnNpdmVwaXRjaF9jdXN0b20iOjAuMCwiZGVmZW5zaXZleWF3IjoiRGlzYWJsZWQiLCJkZWZlbnNpdmV5YXdfY3VzdG9tIjowLjAsImRlZmVuc2l2ZXlhd19yYW5kb21mcm9tIjowLjAsImRlZmVuc2l2ZXlhd19yYW5kb210byI6MC4wLCJkZWZlbnNpdmV5YXdfc3BpbnNwZWVkIjowLjAsImRpc2FibGVycyI6WyJ+Il0sImhpdHRhYmxlIjpmYWxzZSwicGl0Y2giOiJEb3duIiwieWF3IjoiQmFja3dhcmQiLCJ5YXdiYXNlIjoiQXQgVGFyZ2V0IiwieWF3aml0dGVyIjoiRGlzYWJsZWQiLCJ5YXdqaXR0ZXJtYXgiOjAuMCwieWF3aml0dGVybWluIjowLjAsInlhd2ppdHRlcm9mZnNldCI6MC4wLCJ5YXdqaXR0ZXJyYW5kb20iOmZhbHNlLCJ5YXdtb2RlIjoiTCZSIiwieWF3bW9kZV9kZWxheW9mZnNldCI6MC4wLCJ5YXdtb2RlX2RlbGF5c3luYyI6ZmFsc2UsInlhd21vZGVfbG9mZnNldCI6LTI0LjAsInlhd21vZGVfb2Zmc2V0IjowLjAsInlhd21vZGVfcm9mZnNldCI6NDEuMH0seyJib2R5X3lhdyI6dHJ1ZSwiYm9keXlhd2Zyb20iOjAuMCwiYm9keXlhd2ZzIjoiT2ZmIiwiYm9keXlhd2ludiI6ZmFsc2UsImJvZHl5YXdsaW1pdGwiOjYwLjAsImJvZHl5YXdsaW1pdG1vZGUiOiJTdGF0aWMiLCJib2R5eWF3bGltaXRyIjo2MC4wLCJib2R5eWF3bWF4IjowLjAsImJvZHl5YXdtaW4iOjAuMCwiYm9keXlhd21vZGUiOiJTdGF0aWMiLCJib2R5eWF3b3BzIjpbIkF2b2lkIE92ZXJsYXAiLCJKaXR0ZXIiLCJBbnRpIEJydXRlZm9yY2UiLCJ+Il0sImJvZHl5YXd0byI6MC4wLCJkZWZlbnNpdmVfYWEiOmZhbHNlLCJkZWZlbnNpdmVwaXRjaCI6IkRpc2FibGVkIiwiZGVmZW5zaXZlcGl0Y2hfY3VzdG9tIjowLjAsImRlZmVuc2l2ZXlhdyI6IkRpc2FibGVkIiwiZGVmZW5zaXZleWF3X2N1c3RvbSI6MC4wLCJkZWZlbnNpdmV5YXdfcmFuZG9tZnJvbSI6MC4wLCJkZWZlbnNpdmV5YXdfcmFuZG9tdG8iOjAuMCwiZGVmZW5zaXZleWF3X3NwaW5zcGVlZCI6MC4wLCJkaXNhYmxlcnMiOlsifiJdLCJoaXR0YWJsZSI6ZmFsc2UsInBpdGNoIjoiRG93biIsInlhdyI6IkJhY2t3YXJkIiwieWF3YmFzZSI6IkF0IFRhcmdldCIsInlhd2ppdHRlciI6IkNlbnRlciIsInlhd2ppdHRlcm1heCI6LTI3LjAsInlhd2ppdHRlcm1pbiI6LTUuMCwieWF3aml0dGVyb2Zmc2V0IjotMTYuMCwieWF3aml0dGVycmFuZG9tIjp0cnVlLCJ5YXdtb2RlIjoiTCZSIiwieWF3bW9kZV9kZWxheW9mZnNldCI6MC4wLCJ5YXdtb2RlX2RlbGF5c3luYyI6dHJ1ZSwieWF3bW9kZV9sb2Zmc2V0IjotMjQuMCwieWF3bW9kZV9vZmZzZXQiOjAuMCwieWF3bW9kZV9yb2Zmc2V0IjozNy4wfSx7ImJvZHlfeWF3Ijp0cnVlLCJib2R5eWF3ZnJvbSI6MC4wLCJib2R5eWF3ZnMiOiJPZmYiLCJib2R5eWF3aW52IjpmYWxzZSwiYm9keXlhd2xpbWl0bCI6NjAuMCwiYm9keXlhd2xpbWl0bW9kZSI6IlN0YXRpYyIsImJvZHl5YXdsaW1pdHIiOjYwLjAsImJvZHl5YXdtYXgiOjAuMCwiYm9keXlhd21pbiI6MC4wLCJib2R5eWF3bW9kZSI6IlN0YXRpYyIsImJvZHl5YXdvcHMiOlsiSml0dGVyIiwiQW50aSBCcnV0ZWZvcmNlIiwifiJdLCJib2R5eWF3dG8iOjAuMCwiZGVmZW5zaXZlX2FhIjpmYWxzZSwiZGVmZW5zaXZlcGl0Y2giOiJEaXNhYmxlZCIsImRlZmVuc2l2ZXBpdGNoX2N1c3RvbSI6MC4wLCJkZWZlbnNpdmV5YXciOiJEaXNhYmxlZCIsImRlZmVuc2l2ZXlhd19jdXN0b20iOjAuMCwiZGVmZW5zaXZleWF3X3JhbmRvbWZyb20iOjAuMCwiZGVmZW5zaXZleWF3X3JhbmRvbXRvIjowLjAsImRlZmVuc2l2ZXlhd19zcGluc3BlZWQiOjAuMCwiZGlzYWJsZXJzIjpbIn4iXSwiaGl0dGFibGUiOmZhbHNlLCJwaXRjaCI6IkRvd24iLCJ5YXciOiJCYWNrd2FyZCIsInlhd2Jhc2UiOiJBdCBUYXJnZXQiLCJ5YXdqaXR0ZXIiOiIzLVdheSIsInlhd2ppdHRlcm1heCI6LTQ0LjAsInlhd2ppdHRlcm1pbiI6LTExLjAsInlhd2ppdHRlcm9mZnNldCI6MTIuMCwieWF3aml0dGVycmFuZG9tIjpmYWxzZSwieWF3bW9kZSI6IkwmUiIsInlhd21vZGVfZGVsYXlvZmZzZXQiOjguMCwieWF3bW9kZV9kZWxheXN5bmMiOmZhbHNlLCJ5YXdtb2RlX2xvZmZzZXQiOi0yMy4wLCJ5YXdtb2RlX29mZnNldCI6LTUuMCwieWF3bW9kZV9yb2Zmc2V0Ijo0Ny4wfSx7ImJvZHlfeWF3Ijp0cnVlLCJib2R5eWF3ZnJvbSI6MC4wLCJib2R5eWF3ZnMiOiJPZmYiLCJib2R5eWF3aW52IjpmYWxzZSwiYm9keXlhd2xpbWl0bCI6NjAuMCwiYm9keXlhd2xpbWl0bW9kZSI6IlN0YXRpYyIsImJvZHl5YXdsaW1pdHIiOjYwLjAsImJvZHl5YXdtYXgiOjAuMCwiYm9keXlhd21pbiI6MC4wLCJib2R5eWF3bW9kZSI6IlN0YXRpYyIsImJvZHl5YXdvcHMiOlsiSml0dGVyIiwifiJdLCJib2R5eWF3dG8iOjAuMCwiZGVmZW5zaXZlX2FhIjpmYWxzZSwiZGVmZW5zaXZlcGl0Y2giOiJEaXNhYmxlZCIsImRlZmVuc2l2ZXBpdGNoX2N1c3RvbSI6MC4wLCJkZWZlbnNpdmV5YXciOiJEaXNhYmxlZCIsImRlZmVuc2l2ZXlhd19jdXN0b20iOjAuMCwiZGVmZW5zaXZleWF3X3JhbmRvbWZyb20iOjAuMCwiZGVmZW5zaXZleWF3X3JhbmRvbXRvIjowLjAsImRlZmVuc2l2ZXlhd19zcGluc3BlZWQiOjAuMCwiZGlzYWJsZXJzIjpbIn4iXSwiaGl0dGFibGUiOmZhbHNlLCJwaXRjaCI6IkRvd24iLCJ5YXciOiJCYWNrd2FyZCIsInlhd2Jhc2UiOiJBdCBUYXJnZXQiLCJ5YXdqaXR0ZXIiOiJEaXNhYmxlZCIsInlhd2ppdHRlcm1heCI6MC4wLCJ5YXdqaXR0ZXJtaW4iOjAuMCwieWF3aml0dGVyb2Zmc2V0IjowLjAsInlhd2ppdHRlcnJhbmRvbSI6ZmFsc2UsInlhd21vZGUiOiJMJlIiLCJ5YXdtb2RlX2RlbGF5b2Zmc2V0IjoyLjAsInlhd21vZGVfZGVsYXlzeW5jIjp0cnVlLCJ5YXdtb2RlX2xvZmZzZXQiOi0zMi4wLCJ5YXdtb2RlX29mZnNldCI6MC4wLCJ5YXdtb2RlX3JvZmZzZXQiOjQ2LjB9LHsiYm9keV95YXciOnRydWUsImJvZHl5YXdmcm9tIjowLjAsImJvZHl5YXdmcyI6Ik9mZiIsImJvZHl5YXdpbnYiOmZhbHNlLCJib2R5eWF3bGltaXRsIjo2MC4wLCJib2R5eWF3bGltaXRtb2RlIjoiU3RhdGljIiwiYm9keXlhd2xpbWl0ciI6NjAuMCwiYm9keXlhd21heCI6MC4wLCJib2R5eWF3bWluIjowLjAsImJvZHl5YXdtb2RlIjoiU3RhdGljIiwiYm9keXlhd29wcyI6WyJKaXR0ZXIiLCJ+Il0sImJvZHl5YXd0byI6MC4wLCJkZWZlbnNpdmVfYWEiOmZhbHNlLCJkZWZlbnNpdmVwaXRjaCI6IkRpc2FibGVkIiwiZGVmZW5zaXZlcGl0Y2hfY3VzdG9tIjowLjAsImRlZmVuc2l2ZXlhdyI6IkRpc2FibGVkIiwiZGVmZW5zaXZleWF3X2N1c3RvbSI6MC4wLCJkZWZlbnNpdmV5YXdfcmFuZG9tZnJvbSI6MC4wLCJkZWZlbnNpdmV5YXdfcmFuZG9tdG8iOjAuMCwiZGVmZW5zaXZleWF3X3NwaW5zcGVlZCI6MC4wLCJkaXNhYmxlcnMiOlsifiJdLCJoaXR0YWJsZSI6ZmFsc2UsInBpdGNoIjoiRG93biIsInlhdyI6IkJhY2t3YXJkIiwieWF3YmFzZSI6IkF0IFRhcmdldCIsInlhd2ppdHRlciI6IkRpc2FibGVkIiwieWF3aml0dGVybWF4IjowLjAsInlhd2ppdHRlcm1pbiI6MC4wLCJ5YXdqaXR0ZXJvZmZzZXQiOjAuMCwieWF3aml0dGVycmFuZG9tIjpmYWxzZSwieWF3bW9kZSI6IkwmUiIsInlhd21vZGVfZGVsYXlvZmZzZXQiOjAuMCwieWF3bW9kZV9kZWxheXN5bmMiOmZhbHNlLCJ5YXdtb2RlX2xvZmZzZXQiOi0yMi4wLCJ5YXdtb2RlX29mZnNldCI6MC4wLCJ5YXdtb2RlX3JvZmZzZXQiOjQ0LjB9LHsiYm9keV95YXciOnRydWUsImJvZHl5YXdmcm9tIjowLjAsImJvZHl5YXdmcyI6Ik9mZiIsImJvZHl5YXdpbnYiOmZhbHNlLCJib2R5eWF3bGltaXRsIjo2MC4wLCJib2R5eWF3bGltaXRtb2RlIjoiU3RhdGljIiwiYm9keXlhd2xpbWl0ciI6NjAuMCwiYm9keXlhd21heCI6MC4wLCJib2R5eWF3bWluIjowLjAsImJvZHl5YXdtb2RlIjoiU3RhdGljIiwiYm9keXlhd29wcyI6WyJKaXR0ZXIiLCJ+Il0sImJvZHl5YXd0byI6MC4wLCJkZWZlbnNpdmVfYWEiOmZhbHNlLCJkZWZlbnNpdmVwaXRjaCI6IkRpc2FibGVkIiwiZGVmZW5zaXZlcGl0Y2hfY3VzdG9tIjowLjAsImRlZmVuc2l2ZXlhdyI6IkRpc2FibGVkIiwiZGVmZW5zaXZleWF3X2N1c3RvbSI6MC4wLCJkZWZlbnNpdmV5YXdfcmFuZG9tZnJvbSI6MC4wLCJkZWZlbnNpdmV5YXdfcmFuZG9tdG8iOjAuMCwiZGVmZW5zaXZleWF3X3NwaW5zcGVlZCI6MC4wLCJkaXNhYmxlcnMiOlsifiJdLCJoaXR0YWJsZSI6ZmFsc2UsInBpdGNoIjoiRG93biIsInlhdyI6IkJhY2t3YXJkIiwieWF3YmFzZSI6IkF0IFRhcmdldCIsInlhd2ppdHRlciI6IkRpc2FibGVkIiwieWF3aml0dGVybWF4IjowLjAsInlhd2ppdHRlcm1pbiI6MC4wLCJ5YXdqaXR0ZXJvZmZzZXQiOjAuMCwieWF3aml0dGVycmFuZG9tIjpmYWxzZSwieWF3bW9kZSI6IkwmUiIsInlhd21vZGVfZGVsYXlvZmZzZXQiOjkuMCwieWF3bW9kZV9kZWxheXN5bmMiOnRydWUsInlhd21vZGVfbG9mZnNldCI6LTI5LjAsInlhd21vZGVfb2Zmc2V0IjowLjAsInlhd21vZGVfcm9mZnNldCI6MzUuMH0seyJib2R5X3lhdyI6dHJ1ZSwiYm9keXlhd2Zyb20iOjAuMCwiYm9keXlhd2ZzIjoiT2ZmIiwiYm9keXlhd2ludiI6ZmFsc2UsImJvZHl5YXdsaW1pdGwiOjYwLjAsImJvZHl5YXdsaW1pdG1vZGUiOiJTdGF0aWMiLCJib2R5eWF3bGltaXRyIjo2MC4wLCJib2R5eWF3bWF4IjowLjAsImJvZHl5YXdtaW4iOjAuMCwiYm9keXlhd21vZGUiOiJTdGF0aWMiLCJib2R5eWF3b3BzIjpbIkppdHRlciIsIn4iXSwiYm9keXlhd3RvIjowLjAsImRlZmVuc2l2ZV9hYSI6ZmFsc2UsImRlZmVuc2l2ZXBpdGNoIjoiVXAiLCJkZWZlbnNpdmVwaXRjaF9jdXN0b20iOjAuMCwiZGVmZW5zaXZleWF3IjoiU2lkZXdheXMiLCJkZWZlbnNpdmV5YXdfY3VzdG9tIjowLjAsImRlZmVuc2l2ZXlhd19yYW5kb21mcm9tIjowLjAsImRlZmVuc2l2ZXlhd19yYW5kb210byI6MC4wLCJkZWZlbnNpdmV5YXdfc3BpbnNwZWVkIjowLjAsImRpc2FibGVycyI6WyJ+Il0sImhpdHRhYmxlIjpmYWxzZSwicGl0Y2giOiJEb3duIiwieWF3IjoiQmFja3dhcmQiLCJ5YXdiYXNlIjoiQXQgVGFyZ2V0IiwieWF3aml0dGVyIjoiRGlzYWJsZWQiLCJ5YXdqaXR0ZXJtYXgiOjAuMCwieWF3aml0dGVybWluIjowLjAsInlhd2ppdHRlcm9mZnNldCI6MC4wLCJ5YXdqaXR0ZXJyYW5kb20iOmZhbHNlLCJ5YXdtb2RlIjoiTCZSIiwieWF3bW9kZV9kZWxheW9mZnNldCI6MC4wLCJ5YXdtb2RlX2RlbGF5c3luYyI6ZmFsc2UsInlhd21vZGVfbG9mZnNldCI6LTE4LjAsInlhd21vZGVfb2Zmc2V0IjowLjAsInlhd21vZGVfcm9mZnNldCI6NDQuMH0seyJib2R5X3lhdyI6ZmFsc2UsImJvZHl5YXdmcm9tIjowLjAsImJvZHl5YXdmcyI6Ik9mZiIsImJvZHl5YXdpbnYiOmZhbHNlLCJib2R5eWF3bGltaXRsIjowLjAsImJvZHl5YXdsaW1pdG1vZGUiOiJTdGF0aWMiLCJib2R5eWF3bGltaXRyIjowLjAsImJvZHl5YXdtYXgiOjAuMCwiYm9keXlhd21pbiI6MC4wLCJib2R5eWF3bW9kZSI6IlN0YXRpYyIsImJvZHl5YXdvcHMiOlsifiJdLCJib2R5eWF3dG8iOjAuMCwiZGVmZW5zaXZlX2FhIjpmYWxzZSwiZGVmZW5zaXZlcGl0Y2giOiJEaXNhYmxlZCIsImRlZmVuc2l2ZXBpdGNoX2N1c3RvbSI6MC4wLCJkZWZlbnNpdmV5YXciOiJEaXNhYmxlZCIsImRlZmVuc2l2ZXlhd19jdXN0b20iOjAuMCwiZGVmZW5zaXZleWF3X3JhbmRvbWZyb20iOjAuMCwiZGVmZW5zaXZleWF3X3JhbmRvbXRvIjowLjAsImRlZmVuc2l2ZXlhd19zcGluc3BlZWQiOjAuMCwiZGlzYWJsZXJzIjpbIn4iXSwiaGl0dGFibGUiOmZhbHNlLCJwaXRjaCI6IkRpc2FibGVkIiwieWF3IjoiRGlzYWJsZWQiLCJ5YXdiYXNlIjoiTG9jYWwgVmlldyIsInlhd2ppdHRlciI6IkRpc2FibGVkIiwieWF3aml0dGVybWF4IjowLjAsInlhd2ppdHRlcm1pbiI6MC4wLCJ5YXdqaXR0ZXJvZmZzZXQiOjAuMCwieWF3aml0dGVycmFuZG9tIjpmYWxzZSwieWF3bW9kZSI6IlN0YXRpYyIsInlhd21vZGVfZGVsYXlvZmZzZXQiOjAuMCwieWF3bW9kZV9kZWxheXN5bmMiOmZhbHNlLCJ5YXdtb2RlX2xvZmZzZXQiOjAuMCwieWF3bW9kZV9vZmZzZXQiOjAuMCwieWF3bW9kZV9yb2Zmc2V0IjowLjB9LHsiYm9keV95YXciOmZhbHNlLCJib2R5eWF3ZnJvbSI6MC4wLCJib2R5eWF3ZnMiOiJPZmYiLCJib2R5eWF3aW52IjpmYWxzZSwiYm9keXlhd2xpbWl0bCI6MC4wLCJib2R5eWF3bGltaXRtb2RlIjoiU3RhdGljIiwiYm9keXlhd2xpbWl0ciI6MC4wLCJib2R5eWF3bWF4IjowLjAsImJvZHl5YXdtaW4iOjAuMCwiYm9keXlhd21vZGUiOiJTdGF0aWMiLCJib2R5eWF3b3BzIjpbIn4iXSwiYm9keXlhd3RvIjowLjAsImRlZmVuc2l2ZV9hYSI6ZmFsc2UsImRlZmVuc2l2ZXBpdGNoIjoiRGlzYWJsZWQiLCJkZWZlbnNpdmVwaXRjaF9jdXN0b20iOjAuMCwiZGVmZW5zaXZleWF3IjoiRGlzYWJsZWQiLCJkZWZlbnNpdmV5YXdfY3VzdG9tIjowLjAsImRlZmVuc2l2ZXlhd19yYW5kb21mcm9tIjowLjAsImRlZmVuc2l2ZXlhd19yYW5kb210byI6MC4wLCJkZWZlbnNpdmV5YXdfc3BpbnNwZWVkIjowLjAsImRpc2FibGVycyI6WyJ+Il0sImhpdHRhYmxlIjpmYWxzZSwicGl0Y2giOiJEaXNhYmxlZCIsInlhdyI6IkRpc2FibGVkIiwieWF3YmFzZSI6IkxvY2FsIFZpZXciLCJ5YXdqaXR0ZXIiOiJEaXNhYmxlZCIsInlhd2ppdHRlcm1heCI6MC4wLCJ5YXdqaXR0ZXJtaW4iOjAuMCwieWF3aml0dGVyb2Zmc2V0IjowLjAsInlhd2ppdHRlcnJhbmRvbSI6ZmFsc2UsInlhd21vZGUiOiJTdGF0aWMiLCJ5YXdtb2RlX2RlbGF5b2Zmc2V0IjowLjAsInlhd21vZGVfZGVsYXlzeW5jIjpmYWxzZSwieWF3bW9kZV9sb2Zmc2V0IjowLjAsInlhd21vZGVfb2Zmc2V0IjowLjAsInlhd21vZGVfcm9mZnNldCI6MC4wfV0sImRpc2FibGVyc2JvbWJhIjoiT2ZmIiwiZGlzYWJsZXJzcGlucGl0Y2giOiJEaXNhYmxlZCIsImRpc2FibGVyd2hlbiI6WyJ+Il0sImZzIjpmYWxzZSwiZnNlbmFibGVycyI6WyJTdGFuZGluZyIsIk1vdmluZyIsIn4iXSwiZnNqaXR0ZXIiOnRydWUsIm1hbnVhbF9hYSI6IkRpc2FibGVkIiwibWFudWVsaml0dGVyIjp0cnVlLCJzYWZlX2hlYWQiOnRydWUsInNhZmVoZWlnaHQiOjIwLjAsInNhZmVrbmlmZSI6WyJDcm91Y2hpbmciLCJXaXRoIEtuaWZlIiwifiJdLCJzdGF0ZXMiOjYuMCwidGFicyI6MS4wfSwibWFpbiI6eyJhYm91dCI6Mi4wLCJhbnRpYWltY2Znc2VwIjoxLjAsImNvbmZpZ2xpc3QiOjEzLjAsImNvbmZpZ25hbWUiOiIifSwib3RoZXIiOnsiKmV2ZW50Ym9sZCI6IiNFQ0VDRUNCOSIsIiptb2xvdG92IjoiI0ZGNkQ2REM4IiwiKnBsb2dzIjpbIldlYXBvbiIsIiNGRkZGRkZGRiIsIn4iXSwiKnNtb2tlIjoiIzlEQjJGRkM4IiwiYWRpY29lc2xpc3QiOlsxLjAsMi4wLDMuMCwifiJdLCJhbmltcyI6ZmFsc2UsImFzcGVjdHIiOmZhbHNlLCJhc3BlY3Ryc2xpZGVyIjowLjAsImJvbGRsb2djbHIiOiIjRUNFQ0VDQjkiLCJjdXN0b21mZCI6ZmFsc2UsImRvcm1hbnRhY2N1cmFjeSI6ODQuMCwiZG9ybWFudGFpbWJvdCI6ZmFsc2UsImRvcm1hbnRhdXRvc2NvcGUiOnRydWUsImRvcm1hbnRkbWciOjAuMCwiZG9ybWFudGhib3giOlsiSGVhZCIsIkNoZXN0IiwiU3RvbWFjaCIsIkxlZ3MiLCJ+Il0sImV2ZW50Ym9sZCI6ZmFsc2UsImZhc3RsYWRkZXIiOmZhbHNlLCJnc2dyZW5hZGV0aGluZ3MiOmZhbHNlLCJnc2dyZW5hZGV0aGluZ3NsaXN0IjoyLjAsImdzaW5kaWNhdG9ycyI6ZmFsc2UsImdzcHJlZGljdGlvbiI6ZmFsc2UsImdzcHJveHdhcm4iOmZhbHNlLCJpbXByb3ZlbWVudG9wcyI6WyJ+Il0sImlucHV0bmFtZSI6IiAiLCJpbnRlcnBvbGF0aW9uIjpmYWxzZSwiaml0dGVybCI6MC4wLCJqaXR0ZXJyIjowLjAsImxvZ3Njb2xvciI6WyJNaXNzIFJlYXNvbiIsIiNGRkZGRkZDOSIsIn4iXSwibG9nc3R5cGUiOlsifiJdLCJtZW51YW5pbXMiOjEuMCwibWVudWJvZHlsZWFuIjowLjAsIm1lbnVleHRyYXMiOlsifiJdLCJtZW51b25haXIiOiJEaXNhYmxlZCIsIm1lbnVvbmdyb3VuZCI6IkRpc2FibGVkIiwibWluZG1nc3R5bGUiOiJOdW1iZXIiLCJtb2xvdG92IjpmYWxzZSwibW9sb3RvdmNsciI6IiNGRjZENkRDOCIsIm5vZmFsbGRhbWFnZSI6ZmFsc2UsIm9uYWlyIjpmYWxzZSwib25ncm91bmQiOmZhbHNlLCJvbmdyb3VuZHNsaWRlIjpmYWxzZSwib25sYW5kIjpmYWxzZSwicGluZ3NsaWRlciI6MC4wLCJwbG9ncyI6ZmFsc2UsInBsb2dzY2xyIjpbIldlYXBvbiIsIiNGRkZGRkZGRiIsIn4iXSwic21va2UiOmZhbHNlLCJzbW9rZWNsciI6IiM5REIyRkZDOCIsInNwZWN0YXRvcmxpc3QiOmZhbHNlLCJ1bmxvY2twaW5nIjpmYWxzZSwidmlld2NoYW5nZXIiOmZhbHNlLCJ2aWV3Zm92Ijo2OC4wLCJ2aWV3bGVmdGhhbmQiOlsifiJdLCJ2aWV3eCI6My4wLCJ2aWV3eSI6MC4wLCJ2aWV3eiI6LTIuMCwiemluZGljYXRvcnMiOlsifiJdfSwidmlzdWFscyI6eyJjcm9zc2hhaXJjb2xvciI6IiNGRkZGRkZGRiIsImNyb3NzaGFpcmdsb3ciOmZhbHNlLCJjcm9zc2hhaXJnbG93c2xpZGVyIjozMC4wLCJjcm9zc2hhaXJpbmQiOjEuMCwiY3Jvc3NoYWlyaW5keSI6NTcwLjAsImNyb3NzaGFpcnB1bHNlIjp0cnVlLCJjdXN0b21zY29wZSI6ZmFsc2UsImRlZmVuc2l2ZWluZCI6ZmFsc2UsImRlZmVuc2l2ZWluZGNsciI6IiNGRkZGRkZGRiIsImRlZmVuc2l2ZWluZHgiOjg5Ni4wLCJkZWZlbnNpdmVpbmR5IjoyNDAuMCwiZG1nX2luZHgiOjk2Ni4wLCJkbWdfaW5keSI6NTIzLjAsImRtZ292cmFuaW0iOmZhbHNlLCJkbWdvdnJmb250IjoxLjAsImRtZ292cmluZCI6ZmFsc2UsImRtZ292cnN0YXRlIjp0cnVlLCJpbmRpY2F0b3JzIjpmYWxzZSwiaW52ZXJ0ZWQiOmZhbHNlLCJtYW51YWxfYWFyb3dzIjpmYWxzZSwibWFudWFsYXJyb3dzYWx3YXlzIjoiT24gSG90a2V5IiwibWFudWFsYXJyb3dzY29sb3IiOiIjQUZBRkFGRkYiLCJtYW51YWxhcnJvd3Nwb3N4Ijo5NjUuMCwibWFudWFsYXJyb3dzdHNjb2xvcjEiOiIjQUZGRjAwRkYiLCJtYW51YWxhcnJvd3N0c2NvbG9yMiI6IiMwMEM4RkZGRiIsIm1hbnVhbGFycm93c3R5cGUiOjEuMCwibWFya2JvbWJhY29sb3IiOiIjRkZGRkZGQzgiLCJtYXJrYm9tYmFmb250IjozLjAsIm1hcmtpbWFnZXMiOiJOZXZlcmxvc2UiLCJtYXJrbmFtZSI6IlN0ZWFtIiwibWFya25hbWVpbnB1dCI6IiIsIm1hcmtzaW1wbGVwb3MiOiJCb3R0b20iLCJtYXJrc2ltcGxlc3BhY2VzIjpmYWxzZSwibWFya3R5cGUiOjEuMCwic2NvcGVjb2xvciI6IiNERkRGREZBMiIsInNjb3BlZ2FwIjo3LjAsInNjb3BlcmVtb3ZhbHMiOlsifiJdLCJzY29wZXNpemUiOjE2NC4wLCJzbG93aW5kIjpmYWxzZSwidGFicyI6MS4wLCJ2ZWxvY2l0eV9jb2xvciI6IiNGRkZGRkZDOCIsInZlbG9jaXR5cG9zX3giOjg5Ni4wLCJ2ZWxvY2l0eXBvc195IjozNjEuMCwid2F0ZXJtYXJrIjp0cnVlfX0=";
v147["\239\162\144 Agressive"] = "eyJhbnRpYWltIjp7ImFhdHdlYWtzbGlzdCI6WyJ+Il0sImJhY2tzdGFiIjpmYWxzZSwiYnVpbGRlciI6W3siYm9keV95YXciOnRydWUsImJvZHl5YXdmcm9tIjowLjAsImJvZHl5YXdmcyI6Ik9mZiIsImJvZHl5YXdpbnYiOmZhbHNlLCJib2R5eWF3bGltaXRsIjo2MC4wLCJib2R5eWF3bGltaXRtb2RlIjoiU3RhdGljIiwiYm9keXlhd2xpbWl0ciI6NjAuMCwiYm9keXlhd21heCI6MC4wLCJib2R5eWF3bWluIjowLjAsImJvZHl5YXdtb2RlIjoiU3RhdGljIiwiYm9keXlhd29wcyI6WyJKaXR0ZXIiLCJ+Il0sImJvZHl5YXd0byI6MC4wLCJkZWZlbnNpdmVfYWEiOmZhbHNlLCJkZWZlbnNpdmVwaXRjaCI6IkRpc2FibGVkIiwiZGVmZW5zaXZlcGl0Y2hfY3VzdG9tIjowLjAsImRlZmVuc2l2ZXlhdyI6IkRpc2FibGVkIiwiZGVmZW5zaXZleWF3X2N1c3RvbSI6MC4wLCJkZWZlbnNpdmV5YXdfcmFuZG9tZnJvbSI6MC4wLCJkZWZlbnNpdmV5YXdfcmFuZG9tdG8iOjAuMCwiZGVmZW5zaXZleWF3X3NwaW5zcGVlZCI6MC4wLCJkaXNhYmxlcnMiOlsifiJdLCJoaXR0YWJsZSI6ZmFsc2UsInBpdGNoIjoiRG93biIsInlhdyI6IkJhY2t3YXJkIiwieWF3YmFzZSI6IkF0IFRhcmdldCIsInlhd2ppdHRlciI6IkRpc2FibGVkIiwieWF3aml0dGVybWF4IjowLjAsInlhd2ppdHRlcm1pbiI6MC4wLCJ5YXdqaXR0ZXJvZmZzZXQiOjAuMCwieWF3aml0dGVycmFuZG9tIjpmYWxzZSwieWF3bW9kZSI6IkwmUiIsInlhd21vZGVfZGVsYXlvZmZzZXQiOjAuMCwieWF3bW9kZV9kZWxheXN5bmMiOmZhbHNlLCJ5YXdtb2RlX2xvZmZzZXQiOi0yNC4wLCJ5YXdtb2RlX29mZnNldCI6MC4wLCJ5YXdtb2RlX3JvZmZzZXQiOjQxLjB9LHsiYm9keV95YXciOnRydWUsImJvZHl5YXdmcm9tIjowLjAsImJvZHl5YXdmcyI6Ik9mZiIsImJvZHl5YXdpbnYiOmZhbHNlLCJib2R5eWF3bGltaXRsIjo2MC4wLCJib2R5eWF3bGltaXRtb2RlIjoiU3RhdGljIiwiYm9keXlhd2xpbWl0ciI6NjAuMCwiYm9keXlhd21heCI6MC4wLCJib2R5eWF3bWluIjowLjAsImJvZHl5YXdtb2RlIjoiU3RhdGljIiwiYm9keXlhd29wcyI6WyJKaXR0ZXIiLCJ+Il0sImJvZHl5YXd0byI6MC4wLCJkZWZlbnNpdmVfYWEiOmZhbHNlLCJkZWZlbnNpdmVwaXRjaCI6IkRpc2FibGVkIiwiZGVmZW5zaXZlcGl0Y2hfY3VzdG9tIjowLjAsImRlZmVuc2l2ZXlhdyI6IkRpc2FibGVkIiwiZGVmZW5zaXZleWF3X2N1c3RvbSI6MC4wLCJkZWZlbnNpdmV5YXdfcmFuZG9tZnJvbSI6MC4wLCJkZWZlbnNpdmV5YXdfcmFuZG9tdG8iOjAuMCwiZGVmZW5zaXZleWF3X3NwaW5zcGVlZCI6MC4wLCJkaXNhYmxlcnMiOlsifiJdLCJoaXR0YWJsZSI6ZmFsc2UsInBpdGNoIjoiRG93biIsInlhdyI6IkJhY2t3YXJkIiwieWF3YmFzZSI6IkF0IFRhcmdldCIsInlhd2ppdHRlciI6IkRpc2FibGVkIiwieWF3aml0dGVybWF4IjowLjAsInlhd2ppdHRlcm1pbiI6MC4wLCJ5YXdqaXR0ZXJvZmZzZXQiOjAuMCwieWF3aml0dGVycmFuZG9tIjpmYWxzZSwieWF3bW9kZSI6IkwmUiIsInlhd21vZGVfZGVsYXlvZmZzZXQiOjAuMCwieWF3bW9kZV9kZWxheXN5bmMiOmZhbHNlLCJ5YXdtb2RlX2xvZmZzZXQiOi0yNC4wLCJ5YXdtb2RlX29mZnNldCI6MC4wLCJ5YXdtb2RlX3JvZmZzZXQiOjM3LjB9LHsiYm9keV95YXciOnRydWUsImJvZHl5YXdmcm9tIjowLjAsImJvZHl5YXdmcyI6Ik9mZiIsImJvZHl5YXdpbnYiOmZhbHNlLCJib2R5eWF3bGltaXRsIjo2MC4wLCJib2R5eWF3bGltaXRtb2RlIjoiU3RhdGljIiwiYm9keXlhd2xpbWl0ciI6NjAuMCwiYm9keXlhd21heCI6MC4wLCJib2R5eWF3bWluIjowLjAsImJvZHl5YXdtb2RlIjoiU3RhdGljIiwiYm9keXlhd29wcyI6WyJKaXR0ZXIiLCJ+Il0sImJvZHl5YXd0byI6MC4wLCJkZWZlbnNpdmVfYWEiOmZhbHNlLCJkZWZlbnNpdmVwaXRjaCI6IkRpc2FibGVkIiwiZGVmZW5zaXZlcGl0Y2hfY3VzdG9tIjowLjAsImRlZmVuc2l2ZXlhdyI6IkRpc2FibGVkIiwiZGVmZW5zaXZleWF3X2N1c3RvbSI6MC4wLCJkZWZlbnNpdmV5YXdfcmFuZG9tZnJvbSI6MC4wLCJkZWZlbnNpdmV5YXdfcmFuZG9tdG8iOjAuMCwiZGVmZW5zaXZleWF3X3NwaW5zcGVlZCI6MC4wLCJkaXNhYmxlcnMiOlsifiJdLCJoaXR0YWJsZSI6ZmFsc2UsInBpdGNoIjoiRG93biIsInlhdyI6IkJhY2t3YXJkIiwieWF3YmFzZSI6IkF0IFRhcmdldCIsInlhd2ppdHRlciI6IkRpc2FibGVkIiwieWF3aml0dGVybWF4IjowLjAsInlhd2ppdHRlcm1pbiI6MC4wLCJ5YXdqaXR0ZXJvZmZzZXQiOjAuMCwieWF3aml0dGVycmFuZG9tIjpmYWxzZSwieWF3bW9kZSI6IkwmUiIsInlhd21vZGVfZGVsYXlvZmZzZXQiOjAuMCwieWF3bW9kZV9kZWxheXN5bmMiOmZhbHNlLCJ5YXdtb2RlX2xvZmZzZXQiOi0yMy4wLCJ5YXdtb2RlX29mZnNldCI6MC4wLCJ5YXdtb2RlX3JvZmZzZXQiOjQ3LjB9LHsiYm9keV95YXciOnRydWUsImJvZHl5YXdmcm9tIjowLjAsImJvZHl5YXdmcyI6Ik9mZiIsImJvZHl5YXdpbnYiOmZhbHNlLCJib2R5eWF3bGltaXRsIjo2MC4wLCJib2R5eWF3bGltaXRtb2RlIjoiU3RhdGljIiwiYm9keXlhd2xpbWl0ciI6NjAuMCwiYm9keXlhd21heCI6MC4wLCJib2R5eWF3bWluIjowLjAsImJvZHl5YXdtb2RlIjoiU3RhdGljIiwiYm9keXlhd29wcyI6WyJKaXR0ZXIiLCJ+Il0sImJvZHl5YXd0byI6MC4wLCJkZWZlbnNpdmVfYWEiOmZhbHNlLCJkZWZlbnNpdmVwaXRjaCI6IkRpc2FibGVkIiwiZGVmZW5zaXZlcGl0Y2hfY3VzdG9tIjowLjAsImRlZmVuc2l2ZXlhdyI6IkRpc2FibGVkIiwiZGVmZW5zaXZleWF3X2N1c3RvbSI6MC4wLCJkZWZlbnNpdmV5YXdfcmFuZG9tZnJvbSI6MC4wLCJkZWZlbnNpdmV5YXdfcmFuZG9tdG8iOjAuMCwiZGVmZW5zaXZleWF3X3NwaW5zcGVlZCI6MC4wLCJkaXNhYmxlcnMiOlsifiJdLCJoaXR0YWJsZSI6ZmFsc2UsInBpdGNoIjoiRG93biIsInlhdyI6IkJhY2t3YXJkIiwieWF3YmFzZSI6IkF0IFRhcmdldCIsInlhd2ppdHRlciI6IkRpc2FibGVkIiwieWF3aml0dGVybWF4IjowLjAsInlhd2ppdHRlcm1pbiI6MC4wLCJ5YXdqaXR0ZXJvZmZzZXQiOjAuMCwieWF3aml0dGVycmFuZG9tIjpmYWxzZSwieWF3bW9kZSI6IkwmUiIsInlhd21vZGVfZGVsYXlvZmZzZXQiOjIuMCwieWF3bW9kZV9kZWxheXN5bmMiOnRydWUsInlhd21vZGVfbG9mZnNldCI6LTMyLjAsInlhd21vZGVfb2Zmc2V0IjowLjAsInlhd21vZGVfcm9mZnNldCI6NDYuMH0seyJib2R5X3lhdyI6dHJ1ZSwiYm9keXlhd2Zyb20iOjAuMCwiYm9keXlhd2ZzIjoiT2ZmIiwiYm9keXlhd2ludiI6ZmFsc2UsImJvZHl5YXdsaW1pdGwiOjYwLjAsImJvZHl5YXdsaW1pdG1vZGUiOiJTdGF0aWMiLCJib2R5eWF3bGltaXRyIjo2MC4wLCJib2R5eWF3bWF4IjowLjAsImJvZHl5YXdtaW4iOjAuMCwiYm9keXlhd21vZGUiOiJTdGF0aWMiLCJib2R5eWF3b3BzIjpbIkppdHRlciIsIn4iXSwiYm9keXlhd3RvIjowLjAsImRlZmVuc2l2ZV9hYSI6ZmFsc2UsImRlZmVuc2l2ZXBpdGNoIjoiRGlzYWJsZWQiLCJkZWZlbnNpdmVwaXRjaF9jdXN0b20iOjAuMCwiZGVmZW5zaXZleWF3IjoiRGlzYWJsZWQiLCJkZWZlbnNpdmV5YXdfY3VzdG9tIjowLjAsImRlZmVuc2l2ZXlhd19yYW5kb21mcm9tIjowLjAsImRlZmVuc2l2ZXlhd19yYW5kb210byI6MC4wLCJkZWZlbnNpdmV5YXdfc3BpbnNwZWVkIjowLjAsImRpc2FibGVycyI6WyJ+Il0sImhpdHRhYmxlIjpmYWxzZSwicGl0Y2giOiJEb3duIiwieWF3IjoiQmFja3dhcmQiLCJ5YXdiYXNlIjoiQXQgVGFyZ2V0IiwieWF3aml0dGVyIjoiRGlzYWJsZWQiLCJ5YXdqaXR0ZXJtYXgiOjAuMCwieWF3aml0dGVybWluIjowLjAsInlhd2ppdHRlcm9mZnNldCI6MC4wLCJ5YXdqaXR0ZXJyYW5kb20iOmZhbHNlLCJ5YXdtb2RlIjoiTCZSIiwieWF3bW9kZV9kZWxheW9mZnNldCI6MC4wLCJ5YXdtb2RlX2RlbGF5c3luYyI6ZmFsc2UsInlhd21vZGVfbG9mZnNldCI6LTIyLjAsInlhd21vZGVfb2Zmc2V0IjowLjAsInlhd21vZGVfcm9mZnNldCI6NDQuMH0seyJib2R5X3lhdyI6dHJ1ZSwiYm9keXlhd2Zyb20iOjAuMCwiYm9keXlhd2ZzIjoiT2ZmIiwiYm9keXlhd2ludiI6ZmFsc2UsImJvZHl5YXdsaW1pdGwiOjYwLjAsImJvZHl5YXdsaW1pdG1vZGUiOiJTdGF0aWMiLCJib2R5eWF3bGltaXRyIjo2MC4wLCJib2R5eWF3bWF4IjowLjAsImJvZHl5YXdtaW4iOjAuMCwiYm9keXlhd21vZGUiOiJTdGF0aWMiLCJib2R5eWF3b3BzIjpbIkppdHRlciIsIn4iXSwiYm9keXlhd3RvIjowLjAsImRlZmVuc2l2ZV9hYSI6ZmFsc2UsImRlZmVuc2l2ZXBpdGNoIjoiRGlzYWJsZWQiLCJkZWZlbnNpdmVwaXRjaF9jdXN0b20iOjAuMCwiZGVmZW5zaXZleWF3IjoiRGlzYWJsZWQiLCJkZWZlbnNpdmV5YXdfY3VzdG9tIjowLjAsImRlZmVuc2l2ZXlhd19yYW5kb21mcm9tIjowLjAsImRlZmVuc2l2ZXlhd19yYW5kb210byI6MC4wLCJkZWZlbnNpdmV5YXdfc3BpbnNwZWVkIjowLjAsImRpc2FibGVycyI6WyJ+Il0sImhpdHRhYmxlIjpmYWxzZSwicGl0Y2giOiJEb3duIiwieWF3IjoiQmFja3dhcmQiLCJ5YXdiYXNlIjoiQXQgVGFyZ2V0IiwieWF3aml0dGVyIjoiRGlzYWJsZWQiLCJ5YXdqaXR0ZXJtYXgiOjAuMCwieWF3aml0dGVybWluIjowLjAsInlhd2ppdHRlcm9mZnNldCI6MC4wLCJ5YXdqaXR0ZXJyYW5kb20iOmZhbHNlLCJ5YXdtb2RlIjoiTCZSIiwieWF3bW9kZV9kZWxheW9mZnNldCI6MC4wLCJ5YXdtb2RlX2RlbGF5c3luYyI6ZmFsc2UsInlhd21vZGVfbG9mZnNldCI6LTI5LjAsInlhd21vZGVfb2Zmc2V0IjowLjAsInlhd21vZGVfcm9mZnNldCI6MzUuMH0seyJib2R5X3lhdyI6dHJ1ZSwiYm9keXlhd2Zyb20iOjAuMCwiYm9keXlhd2ZzIjoiT2ZmIiwiYm9keXlhd2ludiI6ZmFsc2UsImJvZHl5YXdsaW1pdGwiOjYwLjAsImJvZHl5YXdsaW1pdG1vZGUiOiJTdGF0aWMiLCJib2R5eWF3bGltaXRyIjo2MC4wLCJib2R5eWF3bWF4IjowLjAsImJvZHl5YXdtaW4iOjAuMCwiYm9keXlhd21vZGUiOiJTdGF0aWMiLCJib2R5eWF3b3BzIjpbIkppdHRlciIsIn4iXSwiYm9keXlhd3RvIjowLjAsImRlZmVuc2l2ZV9hYSI6ZmFsc2UsImRlZmVuc2l2ZXBpdGNoIjoiRGlzYWJsZWQiLCJkZWZlbnNpdmVwaXRjaF9jdXN0b20iOjAuMCwiZGVmZW5zaXZleWF3IjoiRGlzYWJsZWQiLCJkZWZlbnNpdmV5YXdfY3VzdG9tIjowLjAsImRlZmVuc2l2ZXlhd19yYW5kb21mcm9tIjowLjAsImRlZmVuc2l2ZXlhd19yYW5kb210byI6MC4wLCJkZWZlbnNpdmV5YXdfc3BpbnNwZWVkIjowLjAsImRpc2FibGVycyI6WyJ+Il0sImhpdHRhYmxlIjpmYWxzZSwicGl0Y2giOiJEb3duIiwieWF3IjoiQmFja3dhcmQiLCJ5YXdiYXNlIjoiQXQgVGFyZ2V0IiwieWF3aml0dGVyIjoiRGlzYWJsZWQiLCJ5YXdqaXR0ZXJtYXgiOjAuMCwieWF3aml0dGVybWluIjowLjAsInlhd2ppdHRlcm9mZnNldCI6MC4wLCJ5YXdqaXR0ZXJyYW5kb20iOmZhbHNlLCJ5YXdtb2RlIjoiTCZSIiwieWF3bW9kZV9kZWxheW9mZnNldCI6MC4wLCJ5YXdtb2RlX2RlbGF5c3luYyI6ZmFsc2UsInlhd21vZGVfbG9mZnNldCI6LTE4LjAsInlhd21vZGVfb2Zmc2V0IjowLjAsInlhd21vZGVfcm9mZnNldCI6NDQuMH1dLCJkaXNhYmxlcmN1c3RvbXBpdGNoIjoiRGlzYWJsZWQiLCJkaXNhYmxlcmN1c3RvbXlhdyI6IkRpc2FibGVkIiwiZGlzYWJsZXJzbGlzdCI6WyJ+Il0sImRpc2FibGVyc3BpbnBpdGNoIjoiRGlzYWJsZWQiLCJkaXNhYmxlcndoZW4iOlsifiJdLCJmcyI6ZmFsc2UsImZzZW5hYmxlcnMiOlsifiJdLCJmc2ppdHRlciI6dHJ1ZSwibWFudWFsX2FhIjoiRGlzYWJsZWQiLCJtYW51ZWxqaXR0ZXIiOnRydWUsInNhZmVfaGVhZCI6ZmFsc2UsInNhZmVoZWlnaHQiOjEuMCwic2FmZWtuaWZlIjpbIn4iXSwic3RhdGVzIjo3LjB9LCJtYWluIjp7ImFib3V0IjoyLjAsImFudGlhaW1jZmdzZXAiOjEuMCwiY29uZmlnbGlzdCI6Ny4wLCJjb25maWduYW1lIjoiZXhwb3J0IGFncmVzc2l2ZSJ9LCJvdGhlciI6eyJhZGljb2VzbGlzdCI6WyJ+Il0sImFuaW1zIjpmYWxzZSwiYXNwZWN0ciI6ZmFsc2UsImFzcGVjdHJzbGlkZXIiOjAuMCwiYm9sZGxvZ2NsciI6IiNGNUY1RjVGRiIsImN1c3RvbWZkIjpmYWxzZSwiZXZlbnRib2xkIjpmYWxzZSwiZmFzdGxhZGRlciI6ZmFsc2UsImdzaW5kaWNhdG9ycyI6ZmFsc2UsImltcHJvdmVtZW50b3BzIjpbIn4iXSwiaW5wdXRuYW1lIjoiIiwiaml0dGVybCI6MC4wLCJqaXR0ZXJyIjo1Mi4wLCJsb2dzY29sb3IiOlsiVXNlcm5hbWUiLCIjRkZGRkZGRkYiLCJ+Il0sImxvZ3N0eXBlIjpbIn4iXSwibWVudWFuaW1zIjo0LjAsIm1lbnVib2R5bGVhbiI6MC4wLCJtZW51ZXh0cmFzIjpbIn4iXSwibWVudW9uYWlyIjoiRGlzYWJsZWQiLCJtZW51b25ncm91bmQiOiJEaXNhYmxlZCIsIm1pbmRtZ3N0eWxlIjoiRGVmYXVsdCIsIm5vZmFsbGRhbWFnZSI6ZmFsc2UsIm9uYWlyIjpmYWxzZSwib25ncm91bmQiOmZhbHNlLCJvbmdyb3VuZHNsaWRlIjpmYWxzZSwib25sYW5kIjpmYWxzZSwicGluZ3NsaWRlciI6MC4wLCJwbG9ncyI6ZmFsc2UsInNwZWN0YXRvcmxpc3QiOmZhbHNlLCJ1bmxvY2twaW5nIjpmYWxzZSwidmlld2NoYW5nZXIiOmZhbHNlLCJ2aWV3Zm92Ijo2OC4wLCJ2aWV3bGVmdGhhbmQiOlsifiJdLCJ2aWV3eCI6My4wLCJ2aWV3eSI6MC4wLCJ2aWV3eiI6LTIuMCwiemluZGljYXRvcnMiOlsifiJdfSwidmlzdWFscyI6eyIqbW9sb3RvdiI6IiNGRkEzQTNCRSIsIipzbW9rZSI6IiM2Q0EzRkZGRiIsImNyb3NzaGFpcmNvbG9yIjoiI0ZGRkZGRkZGIiwiY3Jvc3NoYWlyZ2xvdyI6ZmFsc2UsImNyb3NzaGFpcmdsb3dzbGlkZXIiOjMwLjAsImNyb3NzaGFpcmluZCI6MS4wLCJjcm9zc2hhaXJpbmR5Ijo1NzAuMCwiY3Jvc3NoYWlycHVsc2UiOmZhbHNlLCJjdXN0b21zY29wZSI6ZmFsc2UsImRlZmVuc2l2ZWluZCI6ZmFsc2UsImRlZmVuc2l2ZWluZGNsciI6IiNGRkZGRkZGRiIsImRlZmVuc2l2ZWluZHgiOjg5Ni4wLCJkZWZlbnNpdmVpbmR5IjoyNDAuMCwiZG1nX2luZHgiOjk2NS4wLCJkbWdfaW5keSI6NTI1LjAsImRtZ292cmFuaW0iOmZhbHNlLCJkbWdvdnJmb250IjoxLjAsImRtZ292cmluZCI6ZmFsc2UsImRtZ292cnN0YXRlIjpmYWxzZSwiaW5kaWNhdG9ycyI6ZmFsc2UsImludmVydGVkIjpmYWxzZSwibWFudWFsX2Fhcm93cyI6ZmFsc2UsIm1hbnVhbGFycm93c2Fsd2F5cyI6Ik9uIEhvdGtleSIsIm1hbnVhbGFycm93c2NvbG9yIjoiI0ZGRkZGRkZGIiwibWFudWFsYXJyb3dzcG9zeCI6OTY1LjAsIm1hbnVhbGFycm93c3RzY29sb3IxIjoiI0FGRkYwMEZGIiwibWFudWFsYXJyb3dzdHNjb2xvcjIiOiIjMDBDOEZGRkYiLCJtYW51YWxhcnJvd3N0eXBlIjoxLjAsIm1hcmtib21iYWNvbG9yIjoiI0ZGRkZGRkZGIiwibWFya2JvbWJhZm9udCI6MC4wLCJtYXJraW1hZ2VzIjoiU3RlYW0iLCJtYXJrbmFtZSI6IlN0ZWFtIiwibWFya25hbWVpbnB1dCI6IiIsIm1hcmtzaW1wbGVwb3MiOiJMZWZ0IiwibWFya3NpbXBsZXNwYWNlcyI6ZmFsc2UsIm1hcmt0eXBlIjoxLjAsIm1vbG90b3YiOmZhbHNlLCJtb2xvdG92Y2xyIjoiI0ZGQTNBM0JFIiwic2NvcGVjb2xvciI6IiNGRkZGRkZBMiIsInNjb3BlZ2FwIjo3LjAsInNjb3BlcmVtb3ZhbHMiOlsifiJdLCJzY29wZXNpemUiOjE2NC4wLCJzbG93aW5kIjpmYWxzZSwic21va2UiOmZhbHNlLCJzbW9rZWNsciI6IiM2Q0EzRkZGRiIsInZlbG9jaXR5X2NvbG9yIjoiI0MwQzBDMEZGIiwidmVsb2NpdHlwb3NfeCI6ODk2LjAsInZlbG9jaXR5cG9zX3kiOjI2NS4wLCJ3YXRlcm1hcmsiOmZhbHNlfX0=";
v147["\239\162\144 Meta"] = "eyJhbnRpYWltIjp7ImFhdHdlYWtzbGlzdCI6WyJ+Il0sImJhY2tzdGFiIjpmYWxzZSwiYnVpbGRlciI6W3siYm9keV95YXciOnRydWUsImJvZHl5YXdmcm9tIjowLjAsImJvZHl5YXdmcyI6Ik9mZiIsImJvZHl5YXdpbnYiOmZhbHNlLCJib2R5eWF3bGltaXRsIjo2MC4wLCJib2R5eWF3bGltaXRtb2RlIjoiU3RhdGljIiwiYm9keXlhd2xpbWl0ciI6NjAuMCwiYm9keXlhd21heCI6MC4wLCJib2R5eWF3bWluIjowLjAsImJvZHl5YXdtb2RlIjoiU3RhdGljIiwiYm9keXlhd29wcyI6WyJKaXR0ZXIiLCJ+Il0sImJvZHl5YXd0byI6MC4wLCJkZWZlbnNpdmVfYWEiOmZhbHNlLCJkZWZlbnNpdmVwaXRjaCI6IkRpc2FibGVkIiwiZGVmZW5zaXZlcGl0Y2hfY3VzdG9tIjowLjAsImRlZmVuc2l2ZXlhdyI6IkRpc2FibGVkIiwiZGVmZW5zaXZleWF3X2N1c3RvbSI6MC4wLCJkZWZlbnNpdmV5YXdfcmFuZG9tZnJvbSI6MC4wLCJkZWZlbnNpdmV5YXdfcmFuZG9tdG8iOjAuMCwiZGVmZW5zaXZleWF3X3NwaW5zcGVlZCI6MC4wLCJkaXNhYmxlcnMiOlsifiJdLCJoaXR0YWJsZSI6ZmFsc2UsInBpdGNoIjoiRG93biIsInlhdyI6IkJhY2t3YXJkIiwieWF3YmFzZSI6IkF0IFRhcmdldCIsInlhd2ppdHRlciI6IkRpc2FibGVkIiwieWF3aml0dGVybWF4IjowLjAsInlhd2ppdHRlcm1pbiI6MC4wLCJ5YXdqaXR0ZXJvZmZzZXQiOjAuMCwieWF3aml0dGVycmFuZG9tIjpmYWxzZSwieWF3bW9kZSI6IkwmUiIsInlhd21vZGVfZGVsYXlvZmZzZXQiOjAuMCwieWF3bW9kZV9kZWxheXN5bmMiOmZhbHNlLCJ5YXdtb2RlX2xvZmZzZXQiOi0yNC4wLCJ5YXdtb2RlX29mZnNldCI6MC4wLCJ5YXdtb2RlX3JvZmZzZXQiOjQxLjB9LHsiYm9keV95YXciOnRydWUsImJvZHl5YXdmcm9tIjowLjAsImJvZHl5YXdmcyI6Ik9mZiIsImJvZHl5YXdpbnYiOmZhbHNlLCJib2R5eWF3bGltaXRsIjo2MC4wLCJib2R5eWF3bGltaXRtb2RlIjoiU3RhdGljIiwiYm9keXlhd2xpbWl0ciI6NjAuMCwiYm9keXlhd21heCI6MC4wLCJib2R5eWF3bWluIjowLjAsImJvZHl5YXdtb2RlIjoiU3RhdGljIiwiYm9keXlhd29wcyI6WyJKaXR0ZXIiLCJ+Il0sImJvZHl5YXd0byI6MC4wLCJkZWZlbnNpdmVfYWEiOmZhbHNlLCJkZWZlbnNpdmVwaXRjaCI6IkRpc2FibGVkIiwiZGVmZW5zaXZlcGl0Y2hfY3VzdG9tIjowLjAsImRlZmVuc2l2ZXlhdyI6IkRpc2FibGVkIiwiZGVmZW5zaXZleWF3X2N1c3RvbSI6MC4wLCJkZWZlbnNpdmV5YXdfcmFuZG9tZnJvbSI6MC4wLCJkZWZlbnNpdmV5YXdfcmFuZG9tdG8iOjAuMCwiZGVmZW5zaXZleWF3X3NwaW5zcGVlZCI6MC4wLCJkaXNhYmxlcnMiOlsifiJdLCJoaXR0YWJsZSI6ZmFsc2UsInBpdGNoIjoiRG93biIsInlhdyI6IkJhY2t3YXJkIiwieWF3YmFzZSI6IkF0IFRhcmdldCIsInlhd2ppdHRlciI6IkRpc2FibGVkIiwieWF3aml0dGVybWF4IjowLjAsInlhd2ppdHRlcm1pbiI6MC4wLCJ5YXdqaXR0ZXJvZmZzZXQiOjAuMCwieWF3aml0dGVycmFuZG9tIjpmYWxzZSwieWF3bW9kZSI6IkwmUiIsInlhd21vZGVfZGVsYXlvZmZzZXQiOjAuMCwieWF3bW9kZV9kZWxheXN5bmMiOmZhbHNlLCJ5YXdtb2RlX2xvZmZzZXQiOi0yNC4wLCJ5YXdtb2RlX29mZnNldCI6MC4wLCJ5YXdtb2RlX3JvZmZzZXQiOjM3LjB9LHsiYm9keV95YXciOnRydWUsImJvZHl5YXdmcm9tIjowLjAsImJvZHl5YXdmcyI6Ik9mZiIsImJvZHl5YXdpbnYiOmZhbHNlLCJib2R5eWF3bGltaXRsIjo2MC4wLCJib2R5eWF3bGltaXRtb2RlIjoiU3RhdGljIiwiYm9keXlhd2xpbWl0ciI6NjAuMCwiYm9keXlhd21heCI6MC4wLCJib2R5eWF3bWluIjowLjAsImJvZHl5YXdtb2RlIjoiU3RhdGljIiwiYm9keXlhd29wcyI6WyJKaXR0ZXIiLCJ+Il0sImJvZHl5YXd0byI6MC4wLCJkZWZlbnNpdmVfYWEiOmZhbHNlLCJkZWZlbnNpdmVwaXRjaCI6IkRpc2FibGVkIiwiZGVmZW5zaXZlcGl0Y2hfY3VzdG9tIjowLjAsImRlZmVuc2l2ZXlhdyI6IkRpc2FibGVkIiwiZGVmZW5zaXZleWF3X2N1c3RvbSI6MC4wLCJkZWZlbnNpdmV5YXdfcmFuZG9tZnJvbSI6MC4wLCJkZWZlbnNpdmV5YXdfcmFuZG9tdG8iOjAuMCwiZGVmZW5zaXZleWF3X3NwaW5zcGVlZCI6MC4wLCJkaXNhYmxlcnMiOlsifiJdLCJoaXR0YWJsZSI6ZmFsc2UsInBpdGNoIjoiRG93biIsInlhdyI6IkJhY2t3YXJkIiwieWF3YmFzZSI6IkF0IFRhcmdldCIsInlhd2ppdHRlciI6IkRpc2FibGVkIiwieWF3aml0dGVybWF4IjowLjAsInlhd2ppdHRlcm1pbiI6MC4wLCJ5YXdqaXR0ZXJvZmZzZXQiOjAuMCwieWF3aml0dGVycmFuZG9tIjpmYWxzZSwieWF3bW9kZSI6IkwmUiIsInlhd21vZGVfZGVsYXlvZmZzZXQiOjAuMCwieWF3bW9kZV9kZWxheXN5bmMiOmZhbHNlLCJ5YXdtb2RlX2xvZmZzZXQiOi0yMy4wLCJ5YXdtb2RlX29mZnNldCI6MC4wLCJ5YXdtb2RlX3JvZmZzZXQiOjQ3LjB9LHsiYm9keV95YXciOnRydWUsImJvZHl5YXdmcm9tIjowLjAsImJvZHl5YXdmcyI6Ik9mZiIsImJvZHl5YXdpbnYiOmZhbHNlLCJib2R5eWF3bGltaXRsIjo2MC4wLCJib2R5eWF3bGltaXRtb2RlIjoiU3RhdGljIiwiYm9keXlhd2xpbWl0ciI6NjAuMCwiYm9keXlhd21heCI6MC4wLCJib2R5eWF3bWluIjowLjAsImJvZHl5YXdtb2RlIjoiU3RhdGljIiwiYm9keXlhd29wcyI6WyJKaXR0ZXIiLCJ+Il0sImJvZHl5YXd0byI6MC4wLCJkZWZlbnNpdmVfYWEiOnRydWUsImRlZmVuc2l2ZXBpdGNoIjoiRG93biIsImRlZmVuc2l2ZXBpdGNoX2N1c3RvbSI6MC4wLCJkZWZlbnNpdmV5YXciOiJEaXNhYmxlZCIsImRlZmVuc2l2ZXlhd19jdXN0b20iOjAuMCwiZGVmZW5zaXZleWF3X3JhbmRvbWZyb20iOjAuMCwiZGVmZW5zaXZleWF3X3JhbmRvbXRvIjowLjAsImRlZmVuc2l2ZXlhd19zcGluc3BlZWQiOjEwLjAsImRpc2FibGVycyI6WyJNYW51YWwgWWF3IiwifiJdLCJoaXR0YWJsZSI6dHJ1ZSwicGl0Y2giOiJEb3duIiwieWF3IjoiQmFja3dhcmQiLCJ5YXdiYXNlIjoiQXQgVGFyZ2V0IiwieWF3aml0dGVyIjoiRGlzYWJsZWQiLCJ5YXdqaXR0ZXJtYXgiOjAuMCwieWF3aml0dGVybWluIjowLjAsInlhd2ppdHRlcm9mZnNldCI6MC4wLCJ5YXdqaXR0ZXJyYW5kb20iOmZhbHNlLCJ5YXdtb2RlIjoiTCZSIiwieWF3bW9kZV9kZWxheW9mZnNldCI6Mi4wLCJ5YXdtb2RlX2RlbGF5c3luYyI6dHJ1ZSwieWF3bW9kZV9sb2Zmc2V0IjotMzIuMCwieWF3bW9kZV9vZmZzZXQiOjAuMCwieWF3bW9kZV9yb2Zmc2V0Ijo0Ni4wfSx7ImJvZHlfeWF3Ijp0cnVlLCJib2R5eWF3ZnJvbSI6MC4wLCJib2R5eWF3ZnMiOiJPZmYiLCJib2R5eWF3aW52IjpmYWxzZSwiYm9keXlhd2xpbWl0bCI6NjAuMCwiYm9keXlhd2xpbWl0bW9kZSI6IlN0YXRpYyIsImJvZHl5YXdsaW1pdHIiOjYwLjAsImJvZHl5YXdtYXgiOjAuMCwiYm9keXlhd21pbiI6MC4wLCJib2R5eWF3bW9kZSI6IlN0YXRpYyIsImJvZHl5YXdvcHMiOlsiSml0dGVyIiwifiJdLCJib2R5eWF3dG8iOjAuMCwiZGVmZW5zaXZlX2FhIjp0cnVlLCJkZWZlbnNpdmVwaXRjaCI6IlVwIiwiZGVmZW5zaXZlcGl0Y2hfY3VzdG9tIjowLjAsImRlZmVuc2l2ZXlhdyI6IlNpZGV3YXlzIiwiZGVmZW5zaXZleWF3X2N1c3RvbSI6MC4wLCJkZWZlbnNpdmV5YXdfcmFuZG9tZnJvbSI6MC4wLCJkZWZlbnNpdmV5YXdfcmFuZG9tdG8iOjAuMCwiZGVmZW5zaXZleWF3X3NwaW5zcGVlZCI6MC4wLCJkaXNhYmxlcnMiOlsiTWFudWFsIFlhdyIsIn4iXSwiaGl0dGFibGUiOmZhbHNlLCJwaXRjaCI6IkRvd24iLCJ5YXciOiJCYWNrd2FyZCIsInlhd2Jhc2UiOiJBdCBUYXJnZXQiLCJ5YXdqaXR0ZXIiOiJEaXNhYmxlZCIsInlhd2ppdHRlcm1heCI6MC4wLCJ5YXdqaXR0ZXJtaW4iOjAuMCwieWF3aml0dGVyb2Zmc2V0IjowLjAsInlhd2ppdHRlcnJhbmRvbSI6ZmFsc2UsInlhd21vZGUiOiJMJlIiLCJ5YXdtb2RlX2RlbGF5b2Zmc2V0IjowLjAsInlhd21vZGVfZGVsYXlzeW5jIjpmYWxzZSwieWF3bW9kZV9sb2Zmc2V0IjotMjIuMCwieWF3bW9kZV9vZmZzZXQiOjAuMCwieWF3bW9kZV9yb2Zmc2V0Ijo0NC4wfSx7ImJvZHlfeWF3Ijp0cnVlLCJib2R5eWF3ZnJvbSI6MC4wLCJib2R5eWF3ZnMiOiJPZmYiLCJib2R5eWF3aW52IjpmYWxzZSwiYm9keXlhd2xpbWl0bCI6My4wLCJib2R5eWF3bGltaXRtb2RlIjoiU3RhdGljIiwiYm9keXlhd2xpbWl0ciI6NS4wLCJib2R5eWF3bWF4IjowLjAsImJvZHl5YXdtaW4iOjAuMCwiYm9keXlhd21vZGUiOiJTdGF0aWMiLCJib2R5eWF3b3BzIjpbIkppdHRlciIsIn4iXSwiYm9keXlhd3RvIjowLjAsImRlZmVuc2l2ZV9hYSI6dHJ1ZSwiZGVmZW5zaXZlcGl0Y2giOiJaZXJvIiwiZGVmZW5zaXZlcGl0Y2hfY3VzdG9tIjowLjAsImRlZmVuc2l2ZXlhdyI6IlNwaW4iLCJkZWZlbnNpdmV5YXdfY3VzdG9tIjowLjAsImRlZmVuc2l2ZXlhd19yYW5kb21mcm9tIjowLjAsImRlZmVuc2l2ZXlhd19yYW5kb210byI6MC4wLCJkZWZlbnNpdmV5YXdfc3BpbnNwZWVkIjoxMC4wLCJkaXNhYmxlcnMiOlsiTWFudWFsIFlhdyIsIn4iXSwiaGl0dGFibGUiOnRydWUsInBpdGNoIjoiRG93biIsInlhdyI6IkJhY2t3YXJkIiwieWF3YmFzZSI6IkF0IFRhcmdldCIsInlhd2ppdHRlciI6IkRpc2FibGVkIiwieWF3aml0dGVybWF4IjowLjAsInlhd2ppdHRlcm1pbiI6MC4wLCJ5YXdqaXR0ZXJvZmZzZXQiOjAuMCwieWF3aml0dGVycmFuZG9tIjpmYWxzZSwieWF3bW9kZSI6IkwmUiIsInlhd21vZGVfZGVsYXlvZmZzZXQiOjAuMCwieWF3bW9kZV9kZWxheXN5bmMiOmZhbHNlLCJ5YXdtb2RlX2xvZmZzZXQiOi0yOS4wLCJ5YXdtb2RlX29mZnNldCI6MC4wLCJ5YXdtb2RlX3JvZmZzZXQiOjM1LjB9LHsiYm9keV95YXciOnRydWUsImJvZHl5YXdmcm9tIjowLjAsImJvZHl5YXdmcyI6Ik9mZiIsImJvZHl5YXdpbnYiOmZhbHNlLCJib2R5eWF3bGltaXRsIjo2MC4wLCJib2R5eWF3bGltaXRtb2RlIjoiU3RhdGljIiwiYm9keXlhd2xpbWl0ciI6NjAuMCwiYm9keXlhd21heCI6MC4wLCJib2R5eWF3bWluIjowLjAsImJvZHl5YXdtb2RlIjoiU3RhdGljIiwiYm9keXlhd29wcyI6WyJKaXR0ZXIiLCJ+Il0sImJvZHl5YXd0byI6MC4wLCJkZWZlbnNpdmVfYWEiOnRydWUsImRlZmVuc2l2ZXBpdGNoIjoiVXAiLCJkZWZlbnNpdmVwaXRjaF9jdXN0b20iOjAuMCwiZGVmZW5zaXZleWF3IjoiU3BpbiIsImRlZmVuc2l2ZXlhd19jdXN0b20iOjAuMCwiZGVmZW5zaXZleWF3X3JhbmRvbWZyb20iOjAuMCwiZGVmZW5zaXZleWF3X3JhbmRvbXRvIjowLjAsImRlZmVuc2l2ZXlhd19zcGluc3BlZWQiOjQuMCwiZGlzYWJsZXJzIjpbIk1hbnVhbCBZYXciLCJ+Il0sImhpdHRhYmxlIjp0cnVlLCJwaXRjaCI6IkRvd24iLCJ5YXciOiJCYWNrd2FyZCIsInlhd2Jhc2UiOiJBdCBUYXJnZXQiLCJ5YXdqaXR0ZXIiOiJDZW50ZXIiLCJ5YXdqaXR0ZXJtYXgiOjAuMCwieWF3aml0dGVybWluIjowLjAsInlhd2ppdHRlcm9mZnNldCI6LTEuMCwieWF3aml0dGVycmFuZG9tIjpmYWxzZSwieWF3bW9kZSI6IkwmUiIsInlhd21vZGVfZGVsYXlvZmZzZXQiOjAuMCwieWF3bW9kZV9kZWxheXN5bmMiOmZhbHNlLCJ5YXdtb2RlX2xvZmZzZXQiOi0xOC4wLCJ5YXdtb2RlX29mZnNldCI6MC4wLCJ5YXdtb2RlX3JvZmZzZXQiOjQ0LjB9XSwiZGlzYWJsZXJjdXN0b21waXRjaCI6IkRpc2FibGVkIiwiZGlzYWJsZXJjdXN0b215YXciOiJEaXNhYmxlZCIsImRpc2FibGVyc2xpc3QiOlsifiJdLCJkaXNhYmxlcnNwaW5waXRjaCI6IkRpc2FibGVkIiwiZGlzYWJsZXJ3aGVuIjpbIn4iXSwiZnMiOmZhbHNlLCJmc2VuYWJsZXJzIjpbIn4iXSwiZnNqaXR0ZXIiOnRydWUsIm1hbnVhbF9hYSI6IkRpc2FibGVkIiwibWFudWVsaml0dGVyIjp0cnVlLCJzYWZlX2hlYWQiOmZhbHNlLCJzYWZlaGVpZ2h0IjoxLjAsInNhZmVrbmlmZSI6WyJ+Il0sInN0YXRlcyI6My4wfSwibWFpbiI6eyJhYm91dCI6Mi4wLCJhbnRpYWltY2Znc2VwIjoyLjAsImNvbmZpZ2xpc3QiOjQuMCwiY29uZmlnbmFtZSI6IjEifSwib3RoZXIiOnsiYWRpY29lc2xpc3QiOlsxLjAsMi4wLDMuMCw0LjAsIn4iXSwiYW5pbXMiOnRydWUsImFzcGVjdHIiOnRydWUsImFzcGVjdHJzbGlkZXIiOjEzMC4wLCJib2xkbG9nY2xyIjoiI0Y1RjVGNUZGIiwiY3VzdG9tZmQiOnRydWUsImV2ZW50Ym9sZCI6ZmFsc2UsImZhc3RsYWRkZXIiOnRydWUsImdzaW5kaWNhdG9ycyI6dHJ1ZSwiaW1wcm92ZW1lbnRvcHMiOlsxLjAsMi4wLDMuMCw0LjAsNS4wLDYuMCw3LjAsIn4iXSwiaW5wdXRuYW1lIjoiTHVjaWVubmUgQmlsbHkiLCJqaXR0ZXJsIjowLjAsImppdHRlcnIiOjUyLjAsImxvZ3Njb2xvciI6WyJQcmVmaXgiLCIjQzdEM0ZGRkYiLCJ+Il0sImxvZ3N0eXBlIjpbIkV2ZW50IiwiQ29uc29sZSIsIn4iXSwibWVudWFuaW1zIjoxLjAsIm1lbnVib2R5bGVhbiI6ODcuMCwibWVudWV4dHJhcyI6WzMuMCwifiJdLCJtZW51b25haXIiOiJTdGF0aWMiLCJtZW51b25ncm91bmQiOiJHYW1lc2Vuc2UiLCJtaW5kbWdzdHlsZSI6IkRlZmF1bHQiLCJub2ZhbGxkYW1hZ2UiOnRydWUsIm9uYWlyIjpmYWxzZSwib25ncm91bmQiOmZhbHNlLCJvbmdyb3VuZHNsaWRlIjpmYWxzZSwib25sYW5kIjpmYWxzZSwicGluZ3NsaWRlciI6MC4wLCJwbG9ncyI6ZmFsc2UsInNwZWN0YXRvcmxpc3QiOnRydWUsInVubG9ja3BpbmciOnRydWUsInZpZXdjaGFuZ2VyIjp0cnVlLCJ2aWV3Zm92Ijo2OC4wLCJ2aWV3bGVmdGhhbmQiOlsxLjAsIn4iXSwidmlld3giOjIuMCwidmlld3kiOjEuMCwidmlld3oiOjIuMCwiemluZGljYXRvcnMiOlsifiJdfSwidmlzdWFscyI6eyIqbW9sb3RvdiI6IiNGRkEzQTNCRSIsIipzbW9rZSI6IiM2Q0EzRkZGRiIsImNyb3NzaGFpcmNvbG9yIjoiI0ZGRkZGRkZGIiwiY3Jvc3NoYWlyZ2xvdyI6ZmFsc2UsImNyb3NzaGFpcmdsb3dzbGlkZXIiOjMwLjAsImNyb3NzaGFpcmluZCI6Mi4wLCJjcm9zc2hhaXJpbmR5Ijo1NzAuMCwiY3Jvc3NoYWlycHVsc2UiOmZhbHNlLCJjdXN0b21zY29wZSI6ZmFsc2UsImRlZmVuc2l2ZWluZCI6ZmFsc2UsImRlZmVuc2l2ZWluZGNsciI6IiNGRkZGRkZGRiIsImRlZmVuc2l2ZWluZHgiOjg5Ni4wLCJkZWZlbnNpdmVpbmR5IjoyNDAuMCwiZG1nX2luZHgiOjk2NS4wLCJkbWdfaW5keSI6NTI1LjAsImRtZ292cmFuaW0iOmZhbHNlLCJkbWdvdnJmb250IjoyLjAsImRtZ292cmluZCI6dHJ1ZSwiZG1nb3Zyc3RhdGUiOmZhbHNlLCJpbmRpY2F0b3JzIjpmYWxzZSwiaW52ZXJ0ZWQiOmZhbHNlLCJtYW51YWxfYWFyb3dzIjpmYWxzZSwibWFudWFsYXJyb3dzYWx3YXlzIjoiT24gSG90a2V5IiwibWFudWFsYXJyb3dzY29sb3IiOiIjRkZGRkZGRkYiLCJtYW51YWxhcnJvd3Nwb3N4Ijo5NjUuMCwibWFudWFsYXJyb3dzdHNjb2xvcjEiOiIjQUZGRjAwRkYiLCJtYW51YWxhcnJvd3N0c2NvbG9yMiI6IiMwMEM4RkZGRiIsIm1hbnVhbGFycm93c3R5cGUiOjEuMCwibWFya2JvbWJhY29sb3IiOiIjRkZGRkZGRkYiLCJtYXJrYm9tYmFmb250IjozLjAsIm1hcmtpbWFnZXMiOiJTdGVhbSIsIm1hcmtuYW1lIjoiU3RlYW0iLCJtYXJrbmFtZWlucHV0IjoiIiwibWFya3NpbXBsZXBvcyI6IkxlZnQiLCJtYXJrc2ltcGxlc3BhY2VzIjpmYWxzZSwibWFya3R5cGUiOjEuMCwibW9sb3RvdiI6ZmFsc2UsIm1vbG90b3ZjbHIiOiIjRkZBM0EzQkUiLCJzY29wZWNvbG9yIjoiI0ZGRkZGRkEyIiwic2NvcGVnYXAiOjcuMCwic2NvcGVyZW1vdmFscyI6WyJ+Il0sInNjb3Blc2l6ZSI6MTY0LjAsInNsb3dpbmQiOnRydWUsInNtb2tlIjpmYWxzZSwic21va2VjbHIiOiIjNkNBM0ZGRkYiLCJ2ZWxvY2l0eV9jb2xvciI6IiNDRUNFQ0VGRiIsInZlbG9jaXR5cG9zX3giOjg5Ni4wLCJ2ZWxvY2l0eXBvc195IjoyNjUuMCwid2F0ZXJtYXJrIjp0cnVlfX0=";
local v148 = json.stringify(v147);
files.write("nl\\essence\\configs.json", v148);
local v163 = {
    refresh = function()
        -- upvalues: v116 (ref)
        local v149 = files.read("nl\\essence\\configs.json");
        if v149 then
            local v150 = json.parse(v149);
            local v151 = {};
            table.insert(v151, "\239\162\144 Default");
            table.insert(v151, "\239\162\144 Agressive");
            table.insert(v151, "\239\162\144 Meta");
            for v152, _ in pairs(v150) do
                if v152 ~= "\239\162\144 Default" and v152 ~= "\239\162\144 Agressive" and v152 ~= "\239\162\144 Meta" then
                    table.insert(v151, v152);
                end;
            end;
            v116.main.configlist:update(v151);
        end;
    end, 
    save = function()
        -- upvalues: v116 (ref), l_base64_0 (ref), v141 (ref)
        if v116.main.configname.value == "\239\162\144 Default" or v116.main.configname.value == "\239\162\144 Agressive" or v116.main.configname.value == "\239\162\144 Meta" then
            common.add_notify("Config", "You can't override default configs");
            return;
        else
            local v154 = files.read("nl\\essence\\configs.json");
            if v154 then
                local v155 = json.parse(v154);
                v155[v116.main.configname.value] = l_base64_0.encode(json.stringify(v141:save()));
                local v156 = json.stringify(v155);
                files.write("nl\\essence\\configs.json", v156);
                cvar.play:call("buttons\\button24");
                common.add_notify("\v\239\128\140\r\tConfig Saved!", "The selected Config has been saved.");
            end;
            return;
        end;
    end, 
    load = function()
        -- upvalues: l_base64_0 (ref), v116 (ref), v141 (ref)
        local v157 = files.read("nl\\essence\\configs.json");
        if v157 then
            local v158 = json.parse(v157);
            local v159 = json.parse(l_base64_0.decode(v158[v116.main.configname.value]));
            if v116.main.antiaimcfgsep.value == 1 then
                v141:load(v159);
            else
                v141:load(v159, "antiaim");
            end;
            cvar.play:call("buttons\\button24");
            common.add_notify("\v\239\128\140\r\tConfig Loaded!", "The selected Config has been loaded.");
        end;
    end, 
    delete = function()
        -- upvalues: v116 (ref)
        if v116.main.configname.value == "\239\162\144 Default" or v116.main.configname.value == "\239\162\144 Agressive" or v116.main.configname.value == "\239\162\144 Meta" then
            common.add_notify("Config", "You can't delete default configs");
            return;
        else
            local v160 = files.read("nl\\essence\\configs.json");
            if v160 then
                local v161 = json.parse(v160);
                v161[v116.main.configname.value] = nil;
                local v162 = json.stringify(v161);
                files.write("nl\\essence\\configs.json", v162);
                cvar.play:call("buttons\\button24");
                common.add_notify("\v\239\128\140\r\tConfig Deleted!", "The selected Config has been deleted.");
            end;
            return;
        end;
    end
};
v163.refresh();
v116.main.configlist:set_callback(function(v164)
    -- upvalues: v116 (ref)
    v116.main.configname:set(v164.ref:list()[v164.value]);
end, true);
v116.main.save_cfg:set_callback(function()
    -- upvalues: v163 (ref)
    v163.save();
    v163.refresh();
end);
v116.main.del_cfg:set_callback(function()
    -- upvalues: v163 (ref)
    v163.delete();
    v163.refresh();
end);
v116.main.loadsettings:set_callback(v163.load);
local v165 = 0;
local v166 = 0;
local v167 = 1;
local v168 = 0;
local v169 = false;
local _ = false;
local v171 = false;
local function v179(v172)
    -- upvalues: v11 (ref), v103 (ref), v167 (ref)
    local l_m_fFlags_0 = v11.m_fFlags;
    local v174 = v11["m_vecVelocity[0]"];
    local v175 = v11["m_vecVelocity[1]"];
    local v176 = math.floor(math.sqrt(v174 * v174 + v175 * v175));
    local v177 = bit.band(l_m_fFlags_0, 1) == 1 and not v172.in_jump;
    local v178 = v103.slow_walk:get();
    if v177 and v172.in_duck and v176 >= 3 then
        v167 = 5;
    elseif v177 and v172.in_duck then
        v167 = 4;
    elseif not v177 and v172.in_duck then
        v167 = 7;
    elseif not v177 then
        v167 = 6;
    elseif v178 and v176 >= 3 then
        v167 = 3;
    elseif v177 and v176 < 3 then
        v167 = 1;
    elseif v177 and v176 >= 3 then
        v167 = 2;
    end;
end;
local function v180()
    -- upvalues: v116 (ref)
    return (v116.antiaim.manual_aa.value == "Right" and 90 or 0) + (v116.antiaim.manual_aa.value == "Left" and -90 or 0) + (v116.antiaim.manual_aa.value == "Forward" and 180 or 0);
end;
local function v182()
    -- upvalues: v11 (ref), v165 (ref), v166 (ref)
    local l_m_nTickBase_0 = v11.m_nTickBase;
    if math.abs(l_m_nTickBase_0 - v165) > 64 then
        v165 = 0;
    end;
    v166 = 0;
    if v165 < l_m_nTickBase_0 then
        v165 = l_m_nTickBase_0;
    elseif l_m_nTickBase_0 < v165 then
        v166 = math.min(14, math.max(0, v165 - l_m_nTickBase_0 - 1));
    end;
end;
local _ = 0;
local function v199(v184)
    -- upvalues: v11 (ref), v168 (ref), v116 (ref), v167 (ref), v169 (ref), v171 (ref), v103 (ref), v180 (ref), v166 (ref)
    local v185 = v11:get_player_weapon();
    if not v185 then
        return;
    else
        local v186 = v185:get_weapon_info();
        local v187 = entity.get_threat();
        if v184.choked_commands == 0 then
            v168 = v168 + 1;
            if v168 % v116.antiaim.builder[v167].yawmode_delayoffset.value == 0 then
                v169 = not v169;
            end;
            if v116.antiaim.builder[v167].yawmode_delayrandom.value > 0 then
                if v116.antiaim.builder[v167].yawmode_delayrandom.value < 10 then
                    if v168 > v116.antiaim.builder[v167].yawmode_delayoffset.value then
                        v168 = 0;
                        v169 = not v169;
                    end;
                elseif v168 > v116.antiaim.builder[v167].yawmode_delayoffset.value * math.random(0, v116.antiaim.builder[v167].yawmode_delayrandom.value / 10) then
                    v168 = 0;
                    v169 = not v169;
                end;
                v169 = v169;
            end;
        end;
        v171 = v186.weapon_type ~= 9 and v185:get_classname() ~= "CKnife";
        rage.exploit:allow_defensive(v171);
        local l_v167_0 = v167;
        if v116.antiaim.manual_aa.value ~= "Disabled" then
            l_v167_0 = 9;
        elseif v103.fs:get() then
            l_v167_0 = 8;
        end;
        v103.antiaim:override();
        if not v186.weapon_type == 9 then
            v103.quick_stop:override();
        end;
        v103.backstab:set(v116.antiaim.backstab.value);
        v103.fs_disable_yawmod:set(v116.antiaim.fsjitter.value);
        v103.fs_bodyfs:set(v116.antiaim.fsjitter.value);
        if v116.antiaim.manual_aa.value == "Disabled" and v116.antiaim.fsenablers:get(v167) and v116.antiaim.fs.value then
            v103.fs:set(true);
        else
            v103.fs:set(false);
        end;
        v103.yaw_base:set(v116.antiaim.builder[v167].yawbase.value);
        if v116.antiaim.builder[v167].pitch.value == "Up" then
            v103.pitch:set("Fake Up");
        else
            v103.pitch:set(v116.antiaim.builder[v167].pitch.value);
        end;
        v103.yaw:set(v116.antiaim.builder[v167].yaw.value);
        v103.yaw_mod:set(v116.antiaim.builder[v167].yawjitter.value);
        if v116.antiaim.builder[v167].yawmode.value == "L&R" then
            local l_value_0 = v116.antiaim.builder[v167].yawmode_loffset.value;
            local l_value_1 = v116.antiaim.builder[v167].yawmode_roffset.value;
            if v116.antiaim.builder[v167].yawmode_delayoffset.value > 0 then
                v116.antiaim.builder[v167].yawjitter:disabled(true);
                if v116.antiaim.builder[v167].yawmode_delaysync.value then
                    v116.antiaim.builder[v167].body_yaw:override();
                    rage.antiaim:inverter(v169);
                else
                    v116.antiaim.builder[v167].body_yaw:override(false);
                    v116.antiaim.builder[v167].bodyyawops:override({});
                end;
                v103.yaw_offset:override((v169 and l_value_0 or l_value_1) + v180());
                v103.yaw_mod:set("Disabled");
            else
                v116.antiaim.builder[v167].body_yaw:override();
                v116.antiaim.builder[v167].bodyyawops:override("Jitter");
                local v191 = l_value_0 + l_value_1;
                local v192 = l_value_0 - l_value_1;
                v103.yaw_offset:override(v191 + v180());
                v103.yaw_mod:set("Center");
                v103.yaw_mod_offset:override(v192);
            end;
        else
            v116.antiaim.builder[v167].bodyyawops:override();
            v103.yaw_offset:override(v116.antiaim.builder[v167].yawmode_offset.value + v180());
            v103.yaw_mod:set(v116.antiaim.builder[v167].yawjitter.value);
            v103.yaw_mod_offset:override(v116.antiaim.builder[v167].yawjitteroffset.value);
        end;
        if v116.antiaim.builder[v167].yawmode.value == "L&R" and v116.antiaim.builder[v167].yawmode_delayoffset.value > 0 then
            v116.antiaim.builder[v167].yawjitter:disabled(true);
        else
            v116.antiaim.builder[v167].yawjitter:disabled(false);
        end;
        if v116.antiaim.builder[v167].yawjitterrandom.value then
            v103.yaw_mod_offset:override(math.random(v116.antiaim.builder[v167].yawjittermin.value, v116.antiaim.builder[v167].yawjittermax.value));
        end;
        v103.byaw_options:set(v116.antiaim.builder[v167].bodyyawops:get_override() or v116.antiaim.builder[v167].bodyyawops.value);
        v103.byaw_fs:set(v116.antiaim.builder[v167].bodyyawfs.value);
        if v116.antiaim.builder[v167].body_yaw:get_override() == nil then
            v103.byaw:set(v116.antiaim.builder[v167].body_yaw.value);
        else
            v103.byaw:set(v116.antiaim.builder[v167].body_yaw:get_override());
        end;
        if v116.antiaim.builder[v167].bodyyawlimitmode.value == "Random" then
            v103.byaw_left:override(math.random(v116.antiaim.builder[v167].bodyyawmin.value, v116.antiaim.builder[v167].bodyyawmax.value));
            v103.byaw_right:override(math.random(v116.antiaim.builder[v167].bodyyawmin.value, v116.antiaim.builder[v167].bodyyawmax.value));
        elseif v116.antiaim.builder[v167].bodyyawlimitmode.value == "From ~ To" then
            local v193 = globals.curtime * 1000;
            local v194 = math.clamp(v193, v116.antiaim.builder[v167].bodyyawfrom.value, v116.antiaim.builder[v167].bodyyawto.value);
            v103.byaw_left:override(v194);
            v103.byaw_right:override(v194);
        else
            v103.byaw_left:override(v116.antiaim.builder[v167].bodyyawlimitl.value);
            v103.byaw_right:override(v116.antiaim.builder[v167].bodyyawlimitr.value);
        end;
        if v116.antiaim.builder[l_v167_0].defensive_aa.value then
            if not v116.antiaim.builder[l_v167_0].hittable.value then
                if entity.get_threat(true) and not v103.auto_peek:get() then
                    v103.yaw_hidden:set(true);
                    v103.dt_lag:override("Always On");
                    if v166 == 0 and not v103.byaw:get() then
                        v184.force_defensive = true;
                    end;
                else
                    v103.dt_lag:override();
                    v103.os_aa_op:override();
                end;
            else
                v103.yaw_hidden:set(true);
                v103.dt_lag:override("Always On");
                v103.os_aa_op:override("Break LC");
                if v166 == 0 and not v103.byaw:get() then
                    v184.force_defensive = true;
                end;
            end;
        else
            v103.dt_lag:override();
            v103.os_aa_op:override();
            v103.yaw_hidden:set(false);
        end;
        if v116.antiaim.builder[l_v167_0].defensivepitch.value == "Disabled" then
            rage.antiaim:override_hidden_pitch(89);
        elseif v116.antiaim.builder[l_v167_0].defensivepitch.value == "Up" then
            rage.antiaim:override_hidden_pitch(-89);
        elseif v116.antiaim.builder[l_v167_0].defensivepitch.value == "Down" then
            rage.antiaim:override_hidden_pitch(89);
        elseif v116.antiaim.builder[l_v167_0].defensivepitch.value == "Semi Up" then
            rage.antiaim:override_hidden_pitch(-45);
        elseif v116.antiaim.builder[l_v167_0].defensivepitch.value == "Semi Down" then
            rage.antiaim:override_hidden_pitch(45);
        elseif v116.antiaim.builder[l_v167_0].defensivepitch.value == "Random" then
            rage.antiaim:override_hidden_pitch(math.random(-89, 89));
        elseif v116.antiaim.builder[l_v167_0].defensivepitch.value == "Zero" then
            rage.antiaim:override_hidden_pitch(0);
        elseif v116.antiaim.builder[l_v167_0].defensivepitch.value == "Custom" then
            rage.antiaim:override_hidden_pitch(v116.antiaim.builder[l_v167_0].defensivepitch_custom.value);
        end;
        if v116.antiaim.builder[l_v167_0].defensiveyaw.value == "Disabled" then
            rage.antiaim:override_hidden_yaw_offset(0);
        elseif v116.antiaim.builder[l_v167_0].defensiveyaw.value == "Spin" and v116.antiaim.builder[l_v167_0].defensiveyaw_spinspeed.value > 0 then
            local l_value_2 = v116.antiaim.builder[l_v167_0].defensiveyaw_spinspeed.value;
            rage.antiaim:override_hidden_yaw_offset(-math.normalize_yaw(globals.curtime * (l_value_2 * 180)));
        elseif v116.antiaim.builder[l_v167_0].defensiveyaw.value == "Spin" and v116.antiaim.builder[l_v167_0].defensiveyaw_spinspeed.value == 0 then
            rage.antiaim:override_hidden_yaw_offset(-math.normalize_yaw(globals.curtime * 550));
        elseif v116.antiaim.builder[l_v167_0].defensiveyaw.value == "Sideways" then
            rage.antiaim:override_hidden_yaw_offset(globals.tickcount % 3 > 1 and 89 or -89);
        elseif v116.antiaim.builder[l_v167_0].defensiveyaw.value == "Random" then
            rage.antiaim:override_hidden_yaw_offset(math.random(v116.antiaim.builder[l_v167_0].defensiveyaw_randomfrom.value, v116.antiaim.builder[l_v167_0].defensiveyaw_randomto.value));
        elseif v116.antiaim.builder[l_v167_0].defensiveyaw.value == "Opposite" then
            rage.antiaim:override_hidden_yaw_offset(math.normalize_yaw(180));
        elseif v116.antiaim.builder[l_v167_0].defensiveyaw.value == "Custom" then
            rage.antiaim:override_hidden_yaw_offset(v116.antiaim.builder[l_v167_0].defensiveyaw_custom.value);
        end;
        if v116.antiaim.manual_aa.value ~= "Disabled" then
            v103.yaw_base:set("Local View");
            if v116.antiaim.manueljitter.value then
                v103.yaw:set("Backward");
                v103.yaw_offset:override(v180());
                v103.yaw_mod:set("Disabled");
                v103.yaw_mod_offset:override(0);
                v103.byaw:set(true);
                v103.byaw_left:override(60);
                v103.byaw_right:override(60);
                v103.byaw_options:set({});
                v103.byaw_fs:set("Peek Fake");
                v103.yaw_hidden:set(false);
            end;
            return;
        else
            if v116.antiaim.safe_head.value and v187 then
                local v196 = v11:get_hitbox_position(0);
                local v197 = v187:get_hitbox_position(1);
                if v196.z - v197.z > v116.antiaim.safeheight.value and (v116.antiaim.safeknife:get(1) and v167 == 1 or v116.antiaim.safeknife:get(2) and v167 == 4 or v116.antiaim.safeknife:get(3) and v167 == 7 or v116.antiaim.safeknife:get(4) and v185:get_classname() == "CKnife" and v167 == 7 or v116.antiaim.safeknife:get(5) and v185:get_classname() == "CWeaponTaser" and v167 == 7) then
                    v103.yaw:set("Backward");
                    v103.yaw_offset:override(rage.antiaim:inverter() and -27 or 27);
                    v103.yaw_mod:set("Disabled");
                    v103.yaw_mod_offset:override(0);
                    v103.byaw:set(true);
                    v103.byaw_left:override(60);
                    v103.byaw_right:override(60);
                    v103.byaw_options:set({});
                    v103.byaw_fs:set("Peek Fake");
                    v103.yaw_hidden:set(false);
                    return;
                end;
            end;
            local v198 = entity.get_game_rules();
            if v116.antiaim.disablerwhen:get("Warmup") and v198.m_bWarmupPeriod or v116.antiaim.disablerwhen:get("Round End") and (v198.m_eRoundWinReason == 8 or v198.m_eRoundWinReason == 9) then
                v103.dt_lag:override("On Peek");
                if v116.antiaim.disablersbomba.value == "Disable" then
                    v103.antiaim:override(false);
                elseif v116.antiaim.disablersbomba.value == "Spin" then
                    v103.yaw_offset:override(math.normalize_yaw(globals.curtime * 1100));
                    v103.yaw_mod:set("Disabled");
                    v103.byaw:override(false);
                    if v116.antiaim.disablerspinpitch.value == "Up" then
                        v103.pitch:set("Fake Up");
                    elseif v116.antiaim.disablerspinpitch.value == "Random" then
                        if utils.random_int(0, 1) == 0 then
                            v103.pitch:set("Down");
                        else
                            v103.pitch:set("Fake Up");
                        end;
                    else
                        v103.pitch:set(v116.antiaim.disablerspinpitch.value);
                    end;
                end;
            end;
            return;
        end;
    end;
end;
local v200 = false;
local v201 = v103.min_dmg:get();
local function v215()
    -- upvalues: l_pui_0 (ref), v11 (ref), v116 (ref), v103 (ref), v201 (ref), v86 (ref), v200 (ref), v102 (ref), l_x_0 (ref), l_y_0 (ref)
    if l_pui_0.alpha == 0 and not v11:is_alive() then
        return;
    else
        local v202 = "";
        local function v208(v203, v204, v205, v206)
            local v207 = v203 + (v204 - v203) * globals.absoluteframetime * (v205 or 8) * 1;
            return math.abs(v204 - v207) < (v206 or 0.005) and v204 or v207;
        end;
        if v116.visuals.dmgovrind.value then
            if v116.visuals.dmgovrstate.value and l_pui_0.alpha < 0.5 then
                local v209 = ui.get_binds();
                for _, v211 in pairs(v209) do
                    if v211.active and v211.name == "Min. Damage" then
                        v202 = v211.value;
                        break;
                    end;
                end;
                if v202 ~= v103.min_dmg:get() then
                    return;
                end;
            elseif v103.min_dmg:get() == 0 then
                v202 = l_pui_0.alpha > 0.5 and "DMG" or "";
                v201 = v103.min_dmg:get();
            elseif v103.min_dmg:get() > 100 then
                v202 = "HP+" .. v103.min_dmg:get() - 100;
                v201 = v103.min_dmg:get();
            elseif v103.min_dmg:get() <= 100 and v116.visuals.dmgovranim.value then
                v201 = v208(v201, v103.min_dmg:get(), 16);
                v202 = math.floor(v201 + 0.5);
            else
                v202 = v103.min_dmg:get();
                v201 = v103.min_dmg:get();
            end;
            local v212 = nil;
            if v116.visuals.dmgovrfont.value == 1 then
                v212 = render.measure_text(1, "o", v202);
                render.text(1, vector(v116.visuals.dmg_indx.value, v116.visuals.dmg_indy.value), color(255, 255, 255, 255), "o", v202);
            elseif v116.visuals.dmgovrfont.value == 2 then
                v212 = render.measure_text(2, "o", v202);
                render.text(2, vector(v116.visuals.dmg_indx.value, v116.visuals.dmg_indy.value), color(255, 255, 255, 255), "o", v202);
            elseif v116.visuals.dmgovrfont.value == 3 then
                v212 = render.measure_text(4, "o", v202);
                render.text(4, vector(v116.visuals.dmg_indx.value, v116.visuals.dmg_indy.value), color(255, 255, 255, 255), "o", v202);
            end;
            if l_pui_0.alpha == 1 then
                local v213 = ui.get_mouse_position();
                local v214 = v86(vector(v116.visuals.dmg_indx.value - 5, v116.visuals.dmg_indy.value - 5), vector(v116.visuals.dmg_indx.value + v212.x + 5, v116.visuals.dmg_indy.value + v212.y + 5), v213);
                if v214 and not v200 then
                    render.rect_outline(vector(v116.visuals.dmg_indx.value - 5, v116.visuals.dmg_indy.value - 5), vector(v116.visuals.dmg_indx.value + v212.x + 5, v116.visuals.dmg_indy.value + v212.y + 5), color(255, 255, 255, 100), 0, 4);
                end;
                if common.is_button_down(1) then
                    if v200 == false and v214 == true then
                        v102.x = v213.x - v116.visuals.dmg_indx.value;
                        v102.y = v213.y - v116.visuals.dmg_indy.value;
                        v200 = true;
                    end;
                    if v200 == true then
                        if v213.x - v102.x <= l_x_0 / 2 - 45 then
                            v116.visuals.dmg_indx:set(l_x_0 / 2 - 45);
                            render.rect_outline(vector(l_x_0 / 2 - 50, l_y_0 / 2 - 50), vector(l_x_0 / 2 + 50, l_y_0 / 2 + 50), color(255, 255, 255, 200), 1, 4);
                        elseif v213.x - v102.x >= l_x_0 / 2 + 45 - v212.x then
                            v116.visuals.dmg_indx:set(l_x_0 / 2 + 45 - v212.x);
                            render.rect_outline(vector(l_x_0 / 2 - 50, l_y_0 / 2 - 50), vector(l_x_0 / 2 + 50, l_y_0 / 2 + 50), color(255, 255, 255, 200), 1, 4);
                        else
                            v116.visuals.dmg_indx:set(v213.x - v102.x);
                        end;
                        if v213.y - v102.y <= l_y_0 / 2 - 45 then
                            v116.visuals.dmg_indy:set(l_y_0 / 2 - 45);
                            render.rect_outline(vector(l_x_0 / 2 - 50, l_y_0 / 2 - 50), vector(l_x_0 / 2 + 50, l_y_0 / 2 + 50), color(255, 255, 255, 210), 1, 4);
                        elseif v213.y - v102.y >= l_y_0 / 2 + 45 - v212.y then
                            v116.visuals.dmg_indy:set(l_y_0 / 2 + 45 - v212.y);
                            render.rect_outline(vector(l_x_0 / 2 - 50, l_y_0 / 2 - 50), vector(l_x_0 / 2 + 50, l_y_0 / 2 + 50), color(255, 255, 255, 210), 1, 4);
                        else
                            v116.visuals.dmg_indy:set(v213.y - v102.y);
                        end;
                        render.rect(vector(l_x_0 - 1920), vector(l_y_0 + 1920, l_x_0), color(0, 0, 0, 30));
                        render.rect_outline(vector(l_x_0 / 2 - 50, l_y_0 / 2 - 50), vector(l_x_0 / 2 + 50, l_y_0 / 2 + 50), color(255, 255, 255, 110), 1, 4);
                        render.rect_outline(vector(v116.visuals.dmg_indx.value - 5, v116.visuals.dmg_indy.value - 5), vector(v116.visuals.dmg_indx.value + v212.x + 5, v116.visuals.dmg_indy.value + v212.y + 5), color(255, 255, 255, 50), 0, 4);
                        render.rect(vector(v116.visuals.dmg_indx.value - 5, v116.visuals.dmg_indy.value - 5), vector(v116.visuals.dmg_indx.value + v212.x + 5, v116.visuals.dmg_indy.value + v212.y + 5), color(255, 255, 255, 20), 4);
                    end;
                else
                    v200 = false;
                end;
            else
                v200 = false;
            end;
        end;
        return;
    end;
end;
local v216 = render.load_image_from_file("nl\\essence\\nlavatar.png", vector(500, 500));
local function v225()
    -- upvalues: v116 (ref), v44 (ref), l_y_0 (ref), l_x_0 (ref), v11 (ref), v12 (ref), v216 (ref)
    if not v116.visuals.watermark.value then
        return;
    else
        if v116.visuals.marktype.value == 2 then
            local v217 = v116.visuals.marksimplespaces.value and "ESSENCE" or "E S S E N C E";
            local v218 = v116.visuals.marksimplespaces.value and "[NIGHTLY]" or " [NIGHTLY]";
            local v219 = v44.gradient(v217, color(255, 255, 255, 140), color(v116.visuals.markbombacolor.value.r, v116.visuals.markbombacolor.value.g, v116.visuals.markbombacolor.value.b, 255));
            local v220 = render.measure_text(1, nil, v217);
            local v221 = render.measure_text(1, nil, v218);
            if v116.visuals.marksimplepos.value == "Left" then
                render.text(1, vector(25, l_y_0 / 2 + 43), color(), nil, v219);
                if not v116.visuals.marksimplespaces.value then
                    render.text(1, vector(93, l_y_0 / 2 + 43), color(255, 53, 53, 225), nil, v218);
                else
                    render.text(1, vector(74, l_y_0 / 2 + 43), color(255, 53, 53, 225), nil, v218);
                end;
            elseif v116.visuals.marksimplepos.value == "Right" then
                render.text(1, vector(l_x_0 - v221.x - 25, l_y_0 / 2 + 43), color(255, 53, 53, 225), nil, v218);
                if not v116.visuals.marksimplespaces.value then
                    render.text(1, vector(l_x_0 - v220.x - v221.x - 25, l_y_0 / 2 + 43), color(), nil, v219);
                else
                    render.text(1, vector(l_x_0 - v220.x - v221.x - 29, l_y_0 / 2 + 43), color(), nil, v219);
                end;
            elseif v116.visuals.marksimplepos.value == "Bottom" then
                local v222 = (v220.x + v221.x) / 2;
                render.text(1, vector(l_x_0 / 2 - v222 + v220.x, l_y_0 - 15), color(255, 53, 53, 225), nil, v218);
                if not v116.visuals.marksimplespaces.value then
                    render.text(1, vector(l_x_0 / 2 - v222, l_y_0 - 15), color(), nil, v219);
                else
                    render.text(1, vector(l_x_0 / 2 - v222, l_y_0 - 15), color(), nil, v219);
                end;
            end;
        elseif v116.visuals.marktype.value == 1 then
            if v116.visuals.markbombafont.value == 0 then
                render.text(1, vector(l_x_0 / 2, l_y_0 - 25), color(v116.visuals.markbombacolor.value.r, v116.visuals.markbombacolor.value.g, v116.visuals.markbombacolor.value.b, 255), "c", "essence.club");
            elseif v116.visuals.markbombafont.value == 1 then
                render.text(2, vector(l_x_0 / 2, l_y_0 - 25), color(v116.visuals.markbombacolor.value.r, v116.visuals.markbombacolor.value.g, v116.visuals.markbombacolor.value.b, 255), "c", "ESSENCE.CLUB");
            elseif v116.visuals.markbombafont.value == 2 then
                render.text(3, vector(l_x_0 / 2, l_y_0 - 25), color(v116.visuals.markbombacolor.value.r, v116.visuals.markbombacolor.value.g, v116.visuals.markbombacolor.value.b, 255), "c", "essence.club");
            elseif v116.visuals.markbombafont.value == 3 then
                render.text(4, vector(l_x_0 / 2, l_y_0 - 25), color(v116.visuals.markbombacolor.value.r, v116.visuals.markbombacolor.value.g, v116.visuals.markbombacolor.value.b, 255), "c", "essence.club");
            end;
        elseif v116.visuals.marktype.value == 3 then
            local _ = v11:get_steam_avatar();
            local l_value_3 = v116.visuals.markbombacolor.value;
            render.gradient(vector(l_x_0, 0), vector(l_x_0 - 140, 40), color(l_value_3.r, l_value_3.g, l_value_3.b, 255), color(l_value_3.r, l_value_3.g, l_value_3.b, 0), color(l_value_3.r, l_value_3.g, l_value_3.b, 255), color(l_value_3.r, l_value_3.g, l_value_3.b, 0));
            render.text(4, vector(l_x_0 - 130, 0), color(255, 255, 255, 230), "nil", "E S S");
            render.text(4, vector(l_x_0 - 104, 0), color(l_value_3.r, l_value_3.g, l_value_3.b, l_value_3.a), "nil", "E N C E");
            render.text(1, vector(l_x_0 - 130, l_y_0 / 80), color(255, 255, 255, 230), "nil", "user:");
            if v116.visuals.markname.value == "Steam" then
                render.text(1, vector(l_x_0 - 100, l_y_0 / 80), color(l_value_3.r, l_value_3.g, l_value_3.b, l_value_3.a), "nil", panorama.MyPersonaAPI.GetName());
            elseif v116.visuals.markname.value == "Neverlose" then
                render.text(1, vector(l_x_0 - 100, l_y_0 / 80), color(l_value_3.r, l_value_3.g, l_value_3.b, l_value_3.a), "nil", v12);
            elseif v116.visuals.markname.value == "Custom" then
                render.text(1, vector(l_x_0 - 100, l_y_0 / 80), color(l_value_3.r, l_value_3.g, l_value_3.b, l_value_3.a), "nil", v116.visuals.marknameinput.value);
            end;
            render.text(1, vector(l_x_0 - 130, l_y_0 / 45), color(255, 255, 255, 230), "nil", "build:");
            render.text(1, vector(l_x_0 - 100, l_y_0 / 45), color(l_value_3.r, l_value_3.g, l_value_3.b, l_value_3.a), "nil", "Nightly");
            if v116.visuals.markimages.value == "Neverlose" then
                render.texture(v216, vector(l_x_0 - 38, 3), vector(35, 35), color(255, 255, 255, 255), "f", 1);
            elseif v116.visuals.markimages.value == "Steam" then
                render.texture(v11:get_steam_avatar(), vector(l_x_0 - 38, 3), vector(35, 35), color(255, 255, 255, 255), "f", 1);
            end;
        end;
        return;
    end;
end;
local v226 = 0;
local v227 = false;
local function v245()
    -- upvalues: v116 (ref), l_pui_0 (ref), v11 (ref), v226 (ref), v113 (ref), v167 (ref), v114 (ref), l_x_0 (ref), v103 (ref), v86 (ref), v227 (ref), v102 (ref), l_y_0 (ref)
    if not v116.visuals.indicators.value then
        return;
    elseif l_pui_0.alpha == 0 and not v11:is_alive() then
        return;
    else
        local function v231(v228, v229, v230)
            return v228 - (v228 - v229) * v230;
        end;
        local v232 = l_pui_0.alpha == 0 and (v11.m_bIsScoped or false);
        v226 = v231(v226, v232 and 1 or 0, 20 * globals.frametime);
        local v233 = 0;
        local _ = false;
        local _ = ui.get_binds();
        local v236 = {
            active = "ACTIVE", 
            version = "NIGHTLY", 
            hideshots = "HIDE ", 
            doubletap = "DT ", 
            lua_name = "ESSENCE ", 
            ready = rage.exploit:get() == 1 and "READY" or "CHARGING", 
            state = "- " .. string.upper(v113[v167]) .. " -", 
            noicon_state = "- " .. string.upper(v114[v167]) .. " -"
        };
        local v237 = {
            hideshots = "os", 
            fakeduck = "fd", 
            version = "nightly", 
            doubletap = "dt", 
            freestanding = "fs", 
            lua_name = "essence "
        };
        local v238 = v116.visuals.crosshairind.value == 1 and v236 or v237;
        local v239 = 0;
        if v116.visuals.crosshairind.value == 1 then
            v239 = 2;
        elseif v116.visuals.crosshairind.value == 2 then
            v239 = 1;
        end;
        local v240 = {
            lua_name = render.measure_text(v239, nil, v238.lua_name), 
            version = render.measure_text(v239, nil, v238.version), 
            doubletap = render.measure_text(v239, nil, v238.doubletap), 
            ready = render.measure_text(v239, nil, v238.ready), 
            hideshots = render.measure_text(v239, nil, v238.hideshots), 
            active = render.measure_text(v239, nil, v238.active), 
            state = render.measure_text(v239, nil, v238.state), 
            noicon_state = render.measure_text(v239, nil, v238.noicon_state), 
            freestanding = render.measure_text(v239, nil, v238.freestanding), 
            fakeduck = render.measure_text(v239, nil, v238.fakeduck)
        };
        local v241 = {
            lua_name = l_x_0 / 2 - v240.lua_name.x / 2, 
            version = l_x_0 / 2 - v240.version.x / 2, 
            doubletap = l_x_0 / 2 - v240.doubletap.x / 2, 
            ready = l_x_0 / 2 - v240.ready.x / 2, 
            hideshots = l_x_0 / 2 - v240.hideshots.x / 2, 
            active = l_x_0 / 2 - v240.active.x / 2, 
            state = l_x_0 / 2 - v240.state.x / 2, 
            noicon_state = l_x_0 / 2 - v240.noicon_state.x / 2, 
            freestanding = l_x_0 / 2 - v240.freestanding.x / 2, 
            fakeduck = l_x_0 / 2 - v240.fakeduck.x / 2
        };
        local v242 = l_x_0 / 2 + 10;
        if v116.visuals.crosshairind.value == 1 then
            render.text(v239, vector(v241.lua_name - v240.version.x / 2 + (v242 - (v241.lua_name - v240.version.x / 2)) * v226, v116.visuals.crosshairindy.value), color(255, 255, 255, 255), nil, v238.lua_name);
            render.text(v239, vector(v241.version + v240.lua_name.x / 2 + (v242 - (v241.version - v240.lua_name.x / 2)) * v226, v116.visuals.crosshairindy.value), color(v116.visuals.crosshaircolor.value.r, v116.visuals.crosshaircolor.value.g, v116.visuals.crosshaircolor.value.b, v116.visuals.crosshairpulse.value and 255 * math.abs(math.cos(globals.curtime * 2)) or 255), nil, v238.version);
            v233 = v233 + 10;
            if v103.dt:get() then
                render.text(v239, vector(v241.doubletap - v240.ready.x / 2 + (v242 - (v241.doubletap - v240.ready.x / 2)) * v226, v116.visuals.crosshairindy.value + v233), color(255, 255, 255, 255), nil, v238.doubletap);
            end;
            if v103.dt:get() then
                render.text(v239, vector(v241.ready + v240.doubletap.x / 2 + (v242 - (v241.ready - v240.doubletap.x / 2)) * v226, v116.visuals.crosshairindy.value + v233), rage.exploit:get() == 1 and color(155, 255, 155, 255) or color(255, 100, 100, 255), nil, v238.ready);
                v233 = v233 + 10;
            end;
            if v103.os:get() and not v103.dt:get() then
                render.text(v239, vector(v241.hideshots - v240.active.x / 2 + (v242 - (v241.hideshots - v240.active.x / 2)) * v226, v116.visuals.crosshairindy.value + v233), color(255, 255, 255, 255), nil, v238.hideshots);
            end;
            if v103.os:get() and not v103.dt:get() then
                render.text(v239, vector(v241.active + v240.hideshots.x / 2 + (v242 - (v241.active - v240.hideshots.x / 2)) * v226, v116.visuals.crosshairindy.value + v233), color(v116.visuals.crosshaircolor.value.r, v116.visuals.crosshaircolor.value.g, v116.visuals.crosshaircolor.value.b, 255), nil, v238.active);
                v233 = v233 + 10;
            end;
            if v116.visuals.crosshair_remove_stateicons.value then
                render.text(v239, vector(v241.noicon_state + (v242 - v241.noicon_state) * v226, v116.visuals.crosshairindy.value + v233), color(255, 255, 255, 255), nil, v238.noicon_state);
            else
                render.text(v239, vector(v241.state + (v242 - v241.state) * v226, v116.visuals.crosshairindy.value + v233), color(255, 255, 255, 255), nil, v238.state);
            end;
        elseif v116.visuals.crosshairind.value == 2 then
            render.text(v239, vector(v241.lua_name - v240.version.x / 2 + (v242 - (v241.lua_name - v240.version.x / 2)) * v226, v116.visuals.crosshairindy.value), color(255, 255, 255, 255), nil, v238.lua_name);
            render.text(v239, vector(v241.version + v240.lua_name.x / 2 + (v242 - (v241.version - v240.lua_name.x / 2)) * v226, v116.visuals.crosshairindy.value), color(v116.visuals.crosshaircolor.value.r, v116.visuals.crosshaircolor.value.g, v116.visuals.crosshaircolor.value.b, v116.visuals.crosshairpulse.value and 255 * math.abs(math.cos(globals.curtime * 2)) or 255), nil, v238.version);
            v233 = v233 + 10;
            if v103.dt:get() and not v103.fd:get() then
                render.text(v239, vector(v241.doubletap + (v242 - v241.doubletap) * v226, v116.visuals.crosshairindy.value + v233), color(255, 255, 255, 255), nil, v238.doubletap);
                v233 = v233 + 10;
            end;
            if v103.os:get() and not v103.dt:get() and not v103.fd:get() then
                render.text(v239, vector(v241.hideshots + (v242 - v241.hideshots) * v226, v116.visuals.crosshairindy.value + v233), color(255, 255, 255, 255), nil, v238.hideshots);
                v233 = v233 + 10;
            end;
            if v103.fd:get() then
                render.text(v239, vector(v241.fakeduck + (v242 - v241.fakeduck) * v226, v116.visuals.crosshairindy.value + v233), color(255, 255, 255, 255), nil, v238.fakeduck);
                v233 = v233 + 10;
            end;
            if v103.fs:get() then
                render.text(v239, vector(v241.freestanding + (v242 - v241.freestanding) * v226, v116.visuals.crosshairindy.value + v233), color(255, 255, 255, 255), nil, v238.freestanding);
                v233 = v233 + 10;
            end;
        end;
        if v116.visuals.crosshairglow.value and v116.visuals.crosshairind.value == 2 then
            render.shadow(vector(v241.lua_name - v240.version.x / 2 + (v242 - (v241.lua_name - v240.version.x / 2)) * v226, v116.visuals.crosshairindy.value + v240.lua_name.y / 2), vector(v241.version + v240.lua_name.x / 2 + (v242 - (v241.version - v240.lua_name.x / 2)) * v226 + v240.version.x, v116.visuals.crosshairindy.value + v240.lua_name.y / 2), v116.visuals.crosshaircolor.value, v116.visuals.crosshairglowslider.value, 0, 0);
        elseif v116.visuals.crosshairglow.value and v116.visuals.crosshairind.value == 2 and v116.visuals.crosshairpulse.value then
            render.shadow(vector(v241.lua_name - v240.version.x / 2 + (v242 - (v241.lua_name - v240.version.x / 2)) * v226, v116.visuals.crosshairindy.value + v240.lua_name.y / 2), vector(v241.version + v240.lua_name.x / 2 + (v242 - (v241.version - v240.lua_name.x / 2)) * v226 + v240.version.x, v116.visuals.crosshairindy.value + v240.lua_name.y / 2), color(v116.visuals.crosshaircolor.r, v116.visuals.crosshaircolor.g, v116.visuals.crosshaircolor.b and 255 * math.abs(math.cos(globals.curtime * 2)) or 255), v116.visuals.crosshairglowslider.value, 0, 0);
        end;
        if l_pui_0.alpha == 1 then
            local v243 = ui.get_mouse_position();
            local v244 = v86(vector(v241.lua_name - v240.version.x / 2 + (v242 - (v241.lua_name - v240.version.x / 2)) * v226 - 5, v116.visuals.crosshairindy.value - 5), vector(v241.version + v240.lua_name.x / 2 + (v242 - (v241.version - v240.lua_name.x / 2)) * v226 + v240.version.x + 5, v116.visuals.crosshairindy.value + v233 + 15), v243);
            if v244 or v227 then
                if v116.visuals.crosshairind.value == 1 then
                    render.rect_outline(vector(v241.lua_name - v240.version.x / 2 + (v242 - (v241.lua_name - v240.version.x / 2)) * v226 - 5, v116.visuals.crosshairindy.value - 5), vector(v241.version + v240.lua_name.x / 2 + (v242 - (v241.version - v240.lua_name.x / 2)) * v226 + v240.version.x + 5, v116.visuals.crosshairindy.value + v233 + 15), color(255, 255, 255, 100), 0, 4);
                else
                    render.rect_outline(vector(v241.lua_name - v240.version.x / 2 + (v242 - (v241.lua_name - v240.version.x / 2)) * v226 - 5, v116.visuals.crosshairindy.value - 5), vector(v241.version + v240.lua_name.x / 2 + (v242 - (v241.version - v240.lua_name.x / 2)) * v226 + v240.version.x + 5, v116.visuals.crosshairindy.value + v233 + 6), color(255, 255, 255, 100), 0, 4);
                end;
            end;
            if common.is_button_down(1) then
                if v227 == false and v244 == true then
                    v102.y = v243.y - v116.visuals.crosshairindy.value;
                    v227 = true;
                end;
                if v227 == true then
                    if v243.y - v102.y >= l_y_0 / 2 + 340 then
                        v116.visuals.crosshairindy:set(l_y_0 / 2 + 340);
                    elseif v243.y - v102.y <= l_y_0 / 2 + 30 then
                        v116.visuals.crosshairindy:set(l_y_0 / 2 + 30);
                    else
                        v116.visuals.crosshairindy:set(v243.y - v102.y);
                    end;
                    if v116.visuals.crosshairind.value == 1 and v227 == true then
                        render.rect(vector(v241.lua_name - v240.version.x / 2 + (v242 - (v241.lua_name - v240.version.x / 2)) * v226 - 5, v116.visuals.crosshairindy.value - 5), vector(v241.version + v240.lua_name.x / 2 + (v242 - (v241.version - v240.lua_name.x / 2)) * v226 + v240.version.x + 5, v116.visuals.crosshairindy.value + v233 + 15), color(255, 255, 255, 30), 4);
                    else
                        render.rect(vector(v241.lua_name - v240.version.x / 2 + (v242 - (v241.lua_name - v240.version.x / 2)) * v226 - 5, v116.visuals.crosshairindy.value - 5), vector(v241.version + v240.lua_name.x / 2 + (v242 - (v241.version - v240.lua_name.x / 2)) * v226 + v240.version.x + 5, v116.visuals.crosshairindy.value + v233 + 6), color(255, 255, 255, 30), 4);
                    end;
                    render.rect(vector(l_x_0 - 1920), vector(l_y_0 + 1920, l_x_0), color(0, 0, 0, 50));
                    render.line(vector(l_x_0 / 2, l_y_0 / 2 + 30), vector(l_x_0 / 2, l_y_0 / 2 + 340), color(255, 255, 255, 120));
                end;
            else
                v227 = false;
            end;
        else
            v227 = false;
        end;
        return;
    end;
end;
local v246 = render.load_font("Verdana Bold", 22, "ab");
local _ = false;
local function v254()
    -- upvalues: v116 (ref), v11 (ref), v246 (ref), l_x_0 (ref), l_y_0 (ref)
    if not v116.visuals.manual_aarows.value then
        return;
    else
        local v248 = v11.m_flPoseParameter[11] * 120 - 60 > 0 and 1 or -1;
        local v249 = v116.visuals.manualarrowscolor.value:alpha_modulate(255);
        local v250 = color(100, 100, 100, 255);
        local v251 = v116.antiaim.manual_aa.value == "Left" and v249 or v250;
        local v252 = v116.antiaim.manual_aa.value == "Right" and v249 or v250;
        local v253 = v116.antiaim.manual_aa.value == "Forward" and v249 or v250;
        if v116.visuals.manualarrowstype.value == 1 then
            if v116.visuals.manualarrowsalways.value == "Always On" then
                render.text(v246, vector(l_x_0 / 2 - 55, l_y_0 / 2), v251, "c", "\226\174\156");
                render.text(v246, vector(l_x_0 / 2 + 55, l_y_0 / 2), v252, "c", "\226\174\158");
                render.text(v246, vector(l_x_0 / 2, l_y_0 / 2 - 50), v253, "c", "\226\174\157");
            elseif v116.visuals.manualarrowsalways.value == "On Hotkey" then
                if v116.antiaim.manual_aa.value == "Left" then
                    render.text(v246, vector(l_x_0 / 2 - 55, l_y_0 / 2), v249, "c", "\226\174\156");
                elseif v116.antiaim.manual_aa.value == "Right" then
                    render.text(v246, vector(l_x_0 / 2 + 55, l_y_0 / 2), v249, "c", "\226\174\158");
                elseif v116.antiaim.manual_aa.value == "Forward" then
                    render.text(v246, vector(l_x_0 / 2, l_y_0 / 2 - 50), v249, "c", "\226\174\157");
                end;
            end;
        elseif v116.visuals.manualarrowstype.value == 2 then
            render.poly(v116.antiaim.manual_aa.value == "Right" and v116.visuals.manualarrowstscolor1.value or color(35, 35, 35, 150), vector(l_x_0 / 2 + 55, l_y_0 / 2 - 2 + 2), vector(l_x_0 / 2 + 42, l_y_0 / 2 - 2 - 7), vector(l_x_0 / 2 + 42, l_y_0 / 2 - 2 + 11));
            render.poly(v116.antiaim.manual_aa.value == "Left" and v116.visuals.manualarrowstscolor1.value or color(35, 35, 35, 150), vector(l_x_0 / 2 - 55, l_y_0 / 2 - 2 + 2), vector(l_x_0 / 2 - 42, l_y_0 / 2 - 2 - 7), vector(l_x_0 / 2 - 42, l_y_0 / 2 - 2 + 11));
            render.rect(vector(l_x_0 / 2 + 40, l_y_0 / 2 - 2 - 7), vector(l_x_0 / 2 + 38 + 2, l_y_0 / 2 - 2 - 7 + 18), v248 == 1 and v116.visuals.manualarrowstscolor2.value or color(35, 35, 35, 150));
            render.rect(vector(l_x_0 / 2 - 40, l_y_0 / 2 - 2 - 7), vector(l_x_0 / 2 - 38, l_y_0 / 2 - 2 - 7 + 18), v248 == -1 and v116.visuals.manualarrowstscolor2.value or color(35, 35, 35, 150));
        end;
        return;
    end;
end;
local function v258(v255, v256, v257)
    return v255 - (v255 - v256) * v257;
end;
local v259 = false;
local v260 = 0;
local function v267()
    -- upvalues: v116 (ref), v11 (ref), l_x_0 (ref), l_pui_0 (ref), v260 (ref), v258 (ref), l_y_0 (ref), v259 (ref), v86 (ref), v102 (ref)
    if not v116.visuals.slowind.value then
        return;
    else
        local l_m_flVelocityModifier_0 = v11.m_flVelocityModifier;
        local v262 = math.floor(l_m_flVelocityModifier_0 * (l_x_0 / 15));
        local v263 = math.floor(l_m_flVelocityModifier_0 * 100);
        local v264 = render.measure_text(1, nil, "Velocity " .. v263 .. "%");
        local l_value_4 = v116.visuals.velocity_color.value;
        local v266 = ui.get_mouse_position();
        if l_pui_0.alpha == 0 then
            if v263 ~= 100 then
                v260 = v258(v260, 1, 10 * globals.frametime);
            elseif v263 == 100 then
                v260 = v258(v260, 0, 10 * globals.frametime);
            end;
        else
            v260 = l_pui_0.alpha;
        end;
        if v11:is_alive() then
            render.text(1, vector(v116.visuals.velocitypos_x.value + l_x_0 / 15 / 2 - v264.x / 2, v116.visuals.velocitypos_y.value - 16), color(255, 255, 255, 255 * v260), nil, "Velocity " .. v263 .. "%");
            render.shadow(vector(v116.visuals.velocitypos_x.value, v116.visuals.velocitypos_y.value - 2), vector(v116.visuals.velocitypos_x.value + v262, v116.visuals.velocitypos_y.value + 2), color(l_value_4.r, l_value_4.g, l_value_4.b, l_value_4.a * v260), l_y_0 / 20 / 2, 3);
            render.rect_outline(vector(v116.visuals.velocitypos_x.value, v116.visuals.velocitypos_y.value - 2), vector(v116.visuals.velocitypos_x.value + l_x_0 / 15, v116.visuals.velocitypos_y.value + 2), color(24, 24, 24, 255 * v260), 3, 3);
            render.rect(vector(v116.visuals.velocitypos_x.value, v116.visuals.velocitypos_y.value - 2), vector(v116.visuals.velocitypos_x.value + v262, v116.visuals.velocitypos_y.value + 2), color(l_value_4.r, l_value_4.g, l_value_4.b, l_value_4.a * v260), 3);
        elseif not v11:is_alive() and l_pui_0.alpha > 0 then
            render.text(1, vector(v116.visuals.velocitypos_x.value + l_x_0 / 15 / 2 - v264.x / 2, v116.visuals.velocitypos_y.value - 16), color(255, 255, 255, 255 * v260), nil, "Velocity " .. 100 .. "%");
            render.shadow(vector(v116.visuals.velocitypos_x.value, v116.visuals.velocitypos_y.value - 2), vector(v116.visuals.velocitypos_x.value + l_x_0 / 15, v116.visuals.velocitypos_y.value + 2), color(l_value_4.r, l_value_4.g, l_value_4.b, l_value_4.a * v260), l_y_0 / 20 / 2, 3);
            render.rect(vector(v116.visuals.velocitypos_x.value, v116.visuals.velocitypos_y.value - 2), vector(v116.visuals.velocitypos_x.value + l_x_0 / 15, v116.visuals.velocitypos_y.value + 2), color(l_value_4.r, l_value_4.g, l_value_4.b, l_value_4.a), 3);
        end;
        if l_pui_0.alpha > 0.5 and v259 == false and v86(vector(v116.visuals.velocitypos_x.value - 8, v116.visuals.velocitypos_y.value - 20), vector(v116.visuals.velocitypos_x.value + l_x_0 / 14, v116.visuals.velocitypos_y.value + 12), v266) == true then
            render.rect_outline(vector(v116.visuals.velocitypos_x.value - 8, v116.visuals.velocitypos_y.value - 20), vector(v116.visuals.velocitypos_x.value + l_x_0 / 14, v116.visuals.velocitypos_y.value + 12), color(255, 255, 255, 100), 0, 5);
            render.text(1, vector(v116.visuals.velocitypos_x.value + 65, v116.visuals.velocitypos_y.value - 35), color(255, 255, 255, 170), "c", "Press M2 to reset\nPress M3 to center");
        end;
        if common.is_button_down(1) and l_pui_0.alpha > 0.5 then
            if v259 == false and v86(vector(v116.visuals.velocitypos_x.value - 8, v116.visuals.velocitypos_y.value - 20), vector(v116.visuals.velocitypos_x.value + l_x_0 / 14, v116.visuals.velocitypos_y.value + 12), v266) == true then
                v102.x = v266.x - v116.visuals.velocitypos_x.value;
                v102.y = v266.y - v116.visuals.velocitypos_y.value;
                v259 = true;
            end;
            if v259 == true then
                v116.visuals.velocitypos_x:set(v266.x - v102.x);
                v116.visuals.velocitypos_y:set(v266.y - v102.y);
                render.rect_outline(vector(v116.visuals.velocitypos_x.value - 8, v116.visuals.velocitypos_y.value - 20), vector(v116.visuals.velocitypos_x.value + l_x_0 / 14, v116.visuals.velocitypos_y.value + 12), color(255, 255, 255, 100), 0, 5);
                render.rect(vector(v116.visuals.velocitypos_x.value - 8, v116.visuals.velocitypos_y.value - 20), vector(v116.visuals.velocitypos_x.value + l_x_0 / 14, v116.visuals.velocitypos_y.value + 12), color(255, 255, 255, 30), 4.5);
                render.rect(vector(l_x_0 - 1920), vector(l_y_0 + 1920, l_x_0), color(0, 0, 0, 50));
            end;
        else
            v259 = false;
        end;
        if common.is_button_down(4) and l_pui_0.alpha > 0.5 and v259 == false and v86(vector(v116.visuals.velocitypos_x.value - 8, v116.visuals.velocitypos_y.value - 20), vector(v116.visuals.velocitypos_x.value + l_x_0 / 14, v116.visuals.velocitypos_y.value + 12), v266) == true then
            v116.visuals.velocitypos_x:set(l_x_0 / 2 - l_x_0 / 15 / 2);
        end;
        if common.is_button_down(2) and l_pui_0.alpha > 0.5 and v259 == false and v86(vector(v116.visuals.velocitypos_x.value - 8, v116.visuals.velocitypos_y.value - 20), vector(v116.visuals.velocitypos_x.value + l_x_0 / 14, v116.visuals.velocitypos_y.value + 12), v266) == true then
            v116.visuals.velocitypos_x:set(l_x_0 / 2 - l_x_0 / 15 / 2);
            v116.visuals.velocitypos_y:set(l_y_0 / 2 - 200);
        end;
        return;
    end;
end;
local function v271(v268, v269, v270)
    return v268 - (v268 - v269) * v270;
end;
local l_alpha_0 = l_pui_0.alpha;
local v273 = false;
local function v277()
    -- upvalues: v116 (ref), l_pui_0 (ref), v11 (ref), v103 (ref), l_alpha_0 (ref), v271 (ref), v171 (ref), l_x_0 (ref), l_y_0 (ref), v166 (ref), v273 (ref), v86 (ref), v102 (ref)
    if not v116.visuals.defensiveind.value then
        return;
    else
        local v274 = render.measure_text(1, nil, "- Defensive -");
        local l_value_5 = v116.visuals.defensiveindclr.value;
        local v276 = ui.get_mouse_position();
        if l_pui_0.alpha == 0 and v11:is_alive() and rage.exploit:get() == 1 and (v103.dt_lag:get_override() == "Always On" or v103.os_aa_op:get_override() == "Break LC") then
            l_alpha_0 = v271(l_alpha_0, 1, 10 * globals.frametime);
        else
            l_alpha_0 = l_pui_0.alpha;
        end;
        if v171 and l_pui_0.alpha == 0 then
            render.text(1, vector(v116.visuals.defensiveindx.value + l_x_0 / 15 / 2 - v274.x / 2, v116.visuals.defensiveindy.value - 16), color(255, 255, 255, 255 * l_alpha_0), nil, "- Defensive -");
            render.rect_outline(vector(v116.visuals.defensiveindx.value, v116.visuals.defensiveindy.value - 2), vector(v116.visuals.defensiveindx.value + l_x_0 / 15, v116.visuals.defensiveindy.value + 2), color(24, 24, 24, 255 * l_alpha_0), 3, 3);
        end;
        if l_pui_0.alpha > 0.5 then
            render.rect_outline(vector(v116.visuals.defensiveindx.value, v116.visuals.defensiveindy.value - 2), vector(v116.visuals.defensiveindx.value + l_x_0 / 15, v116.visuals.defensiveindy.value + 2), color(24, 24, 24, 255 * l_alpha_0), 3, 3);
            render.shadow(vector(v116.visuals.defensiveindx.value, v116.visuals.defensiveindy.value - 2), vector(v116.visuals.defensiveindx.value + l_x_0 / 15, v116.visuals.defensiveindy.value + 2), color(l_value_5.r, l_value_5.g, l_value_5.b, l_value_5.a), l_y_0 / 20 / 2, 3);
            render.rect(vector(v116.visuals.defensiveindx.value, v116.visuals.defensiveindy.value - 2), vector(v116.visuals.defensiveindx.value + l_x_0 / 15, v116.visuals.defensiveindy.value + 2), color(l_value_5.r, l_value_5.g, l_value_5.b, l_value_5.a), 3);
            render.text(1, vector(v116.visuals.defensiveindx.value + l_x_0 / 15 / 2 - v274.x / 2, v116.visuals.defensiveindy.value - 16), color(255, 255, 255, 255 * l_alpha_0), nil, "- Defensive -");
        end;
        if v166 > 0 and l_pui_0.alpha == 0 then
            render.shadow(vector(v116.visuals.defensiveindx.value, v116.visuals.defensiveindy.value - 2), vector(v116.visuals.defensiveindx.value + l_x_0 / 15 / v166, v116.visuals.defensiveindy.value + 2), color(l_value_5.r, l_value_5.g, l_value_5.b, l_value_5.a * l_alpha_0), l_y_0 / 20 / 2, 3);
            render.rect(vector(v116.visuals.defensiveindx.value, v116.visuals.defensiveindy.value - 2), vector(v116.visuals.defensiveindx.value + l_x_0 / 15 / v166, v116.visuals.defensiveindy.value + 2), color(l_value_5.r, l_value_5.g, l_value_5.b, l_value_5.a * l_alpha_0), 3);
        end;
        if l_pui_0.alpha > 0.5 and v273 == false and v86(vector(v116.visuals.defensiveindx.value - 8, v116.visuals.defensiveindy.value - 20), vector(v116.visuals.defensiveindx.value + l_x_0 / 14, v116.visuals.defensiveindy.value + 12), v276) == true then
            render.rect_outline(vector(v116.visuals.defensiveindx.value - 8, v116.visuals.defensiveindy.value - 20), vector(v116.visuals.defensiveindx.value + l_x_0 / 14, v116.visuals.defensiveindy.value + 12), color(255, 255, 255, 100), 0, 5);
            render.text(1, vector(v116.visuals.defensiveindx.value + 65, v116.visuals.defensiveindy.value - 35), color(255, 255, 255, 170), "c", "Press M2 to reset\nPress M3 to center");
        end;
        if common.is_button_down(1) and l_pui_0.alpha > 0.5 then
            if v273 == false and v86(vector(v116.visuals.defensiveindx.value - 8, v116.visuals.defensiveindy.value - 20), vector(v116.visuals.defensiveindx.value + l_x_0 / 14, v116.visuals.defensiveindy.value + 12), v276) == true then
                v102.x = v276.x - v116.visuals.defensiveindx.value;
                v102.y = v276.y - v116.visuals.defensiveindy.value;
                v273 = true;
            end;
            if v273 == true then
                v116.visuals.defensiveindx:set(v276.x - v102.x);
                v116.visuals.defensiveindy:set(v276.y - v102.y);
                render.rect_outline(vector(v116.visuals.defensiveindx.value - 8, v116.visuals.defensiveindy.value - 20), vector(v116.visuals.defensiveindx.value + l_x_0 / 14, v116.visuals.defensiveindy.value + 12), color(255, 255, 255, 100), 0, 5);
                render.rect(vector(v116.visuals.defensiveindx.value - 8, v116.visuals.defensiveindy.value - 20), vector(v116.visuals.defensiveindx.value + l_x_0 / 14, v116.visuals.defensiveindy.value + 12), color(255, 255, 255, 30), 4.5);
                render.rect(vector(l_x_0 - 1920), vector(l_y_0 + 1920, l_x_0), color(0, 0, 0, 50));
            end;
        else
            v273 = false;
        end;
        if common.is_button_down(4) and l_pui_0.alpha > 0.5 and v273 == false and v86(vector(v116.visuals.defensiveindx.value - 8, v116.visuals.defensiveindy.value - 20), vector(v116.visuals.defensiveindx.value + l_x_0 / 14, v116.visuals.defensiveindy.value + 12), v276) == true then
            v116.visuals.defensiveindx:set(l_x_0 / 2 - l_x_0 / 15 / 2);
        end;
        if common.is_button_down(2) and l_pui_0.alpha > 0.5 and v273 == false and v86(vector(v116.visuals.defensiveindx.value - 8, v116.visuals.defensiveindy.value - 20), vector(v116.visuals.defensiveindx.value + l_x_0 / 14, v116.visuals.defensiveindy.value + 12), v276) == true then
            v116.visuals.defensiveindx:set(l_x_0 / 2 - l_x_0 / 15 / 2);
            v116.visuals.defensiveindy:set(l_y_0 / 2 - 300);
        end;
        return;
    end;
end;
local v278 = render.load_font("Calibri Bold", vector(25, 22, -1), "a, d");
local v279 = 0;
local v280 = 0;
local function v282(v281)
    -- upvalues: v116 (ref), v279 (ref), v280 (ref)
    if v116.other.zindicators:get(12) then
        if v281.state == nil then
            v279 = v279 + 1;
        else
            v280 = v280 + 1;
        end;
    end;
end;
local v283 = {
    fill = 0, 
    on_plant_time = 0, 
    planting = false, 
    planting_site = ""
};
local v284 = render.load_image_from_file("materials/panorama/images/icons/ui/bomb_c4.svg", vector(100, 100));
local v285 = 0;
local v286 = 0;
local v287 = 0;
local v288 = 0;
local v289 = 0;
local v290 = 0;
local function v292(v291)
    -- upvalues: v285 (ref), v290 (ref), v289 (ref), v288 (ref), v287 (ref), v286 (ref)
    if v291.choked_commands < v285 then
        v290 = v289;
        v289 = v288;
        v288 = v287;
        v287 = v286;
        v286 = v285;
    end;
    v285 = v291.choked_commands;
end;
local function v301(v293, v294, v295, v296, v297, v298)
    -- upvalues: l_x_0 (ref), l_y_0 (ref), v278 (ref), v284 (ref)
    local v299 = l_x_0 / 100 + 9;
    local v300 = l_y_0 / 1.47;
    ts = render.measure_text(v278, nil, v293);
    render.gradient(vector(v299 / 1.9, v300 + v294), vector(v299 / 1.9 + ts.x / 2 + 5, v300 + v294 + ts.y + 11), color(0, 0, 0, 0), color(0, 0, 0, 50), color(0, 0, 0, 0), color(0, 0, 0, 50));
    render.gradient(vector(v299 / 1.9 + ts.x / 2 + 5, v300 + v294), vector(v299 / 1.9 + ts.x + 40, v300 + v294 + ts.y + 11), color(0, 0, 0, 50), color(0, 0, 0, 0), color(0, 0, 0, 50), color(0, 0, 0, 0));
    render.text(v278, vector(v299, v300 + 8 + v294), v295, nil, v293);
    if v298 == true then
        render.texture(v284, vector(v299, v300 + v294 + 2), vector(32, 30), v295, "f", 1);
    end;
    if v296 and v297 then
        render.circle_outline(vector(v299 + ts.x + 18, v300 + v294 + ts.y / 2 + 8), color(0, 0, 0, 255), 10, 1, 10, 5);
        render.circle_outline(vector(v299 + ts.x + 18, v300 + v294 + ts.y / 2 + 8), v296, 9, 1, v297, 3);
    end;
end;
local function v335()
    -- upvalues: v116 (ref), l_y_0 (ref), v11 (ref), v283 (ref), v279 (ref), v280 (ref), v103 (ref), v286 (ref), v287 (ref), v288 (ref), v289 (ref), v290 (ref), v301 (ref)
    if not v116.other.gsindicators.value then
        return;
    else
        local v302 = entity.get_entities("CPlantedC4", true)[1];
        local v303 = "";
        local v304 = 0;
        local v305 = false;
        local v306 = 0;
        local v307 = 0;
        local v308 = false;
        if v302 ~= nil then
            v304 = v302.m_flC4Blow - globals.curtime;
            v305 = v302.m_bBombDefused;
            if v304 > 0 and not v305 then
                local v309 = v302.m_hBombDefuser ~= 4294967295;
                local l_m_flDefuseLength_0 = v302.m_flDefuseLength;
                local v311 = v309 and v302.m_flDefuseCountDown - globals.curtime or -1;
                if v311 > 0 then
                    local v312 = v311 < v304 and color(58, 191, 54, 160) or color(252, 18, 19, 125);
                    local v313 = (l_y_0 - 50) / l_m_flDefuseLength_0 * v311;
                    render.rect(vector(0, 0), vector(16, l_y_0), color(25, 25, 25, 160));
                    render.rect_outline(vector(0, 0), vector(16, l_y_0), color(25, 25, 25, 160));
                    render.rect(vector(0, l_y_0 - v313), vector(16, l_y_0), v312);
                end;
                v303 = v302.m_nBombSite == 0 and "A" or "B";
                local l_m_vecOrigin_0 = v302.m_vecOrigin;
                if v11.m_hObserverTarget and (v11.m_iObserverMode == 4 or v11.m_iObserverMode == 5) then
                    lLoc = v11.m_hObserverTarget.m_vecOrigin;
                    health = v11.m_hObserverTarget.m_iHealth;
                    armor = v11.m_hObserverTarget.m_ArmorValue;
                else
                    lLoc = v11.m_vecOrigin;
                    health = v11.m_iHealth;
                    armor = v11.m_ArmorValue;
                end;
                if armor == nil then
                    return;
                elseif health == nil then
                    return;
                elseif lLoc == nil then
                    return;
                else
                    local v315 = l_m_vecOrigin_0:dist(lLoc);
                    local v316 = 450.7;
                    local v317 = (v315 - 75.68) / 789.2;
                    v306 = v316 * math.exp(-v317 * v317);
                    if armor > 0 then
                        local v318 = v306 * 0.5;
                        local v319 = (v306 - v318) * 0.5;
                        if armor < v319 then
                            armor = armor * 2;
                            v318 = v306 - v319;
                        end;
                        v306 = v318;
                    end;
                    v307 = math.ceil(v306);
                    v308 = health <= v307;
                end;
            end;
        end;
        if v283.planting then
            v283.fill = 3.125 - (3.125 + v283.on_plant_time - globals.curtime);
            if v283.fill > 3.125 then
                v283.fill = 3.125;
            end;
        end;
        local v320 = 40;
        local v321 = 0;
        fnayf = false;
        local v322 = entity.get_players(true, true);
        for v323 = 1, #v322 do
            if v322[v323]:is_dormant() and v322[v323]:get_network_state() < 5 then
                fnayf = true;
                break;
            end;
        end;
        local v324 = false;
        local v325 = 0;
        local v326 = false;
        chance = v279 / (v280 + v279) * 100;
        v325 = v279 == 0 and v280 == 0 and 0 or chance;
        local v327 = ui.get_binds();
        for _, v329 in pairs(v327) do
            if v329.active and v329.name == "Min. Damage" then
                v324 = true;
            elseif v329.active and v329.name == "Hit Chance" then
                v326 = true;
            end;
        end;
        local v330 = utils.net_channel();
        local v331 = math.clamp(math.floor(v330.avg_latency[0] * 1000 + 0.5) / (v103.ping_spike:get_override() or v103.ping_spike:get()), 0, 1);
        local v332 = {
            [1] = {
                [1] = nil, 
                [2] = nil, 
                [3] = nil, 
                [4] = nil, 
                [5] = nil, 
                [6] = true, 
                [1] = "        " .. v283.planting_site, 
                [2] = v116.other.zindicators:get(9) and v283.planting, 
                [3] = color(210, 216, 112, 255), 
                [4] = color(255, 255), 
                [5] = v283.fill / 3.2
            }, 
            [2] = {
                [1] = nil, 
                [2] = nil, 
                [3] = nil, 
                [4] = nil, 
                [5] = nil, 
                [6] = true, 
                [1] = "        " .. v303 .. " - " .. string.format("%.1f", v304) .. "s", 
                [2] = v116.other.zindicators:get(9) and v304 > 0 and not v305, 
                [3] = color(200, 199, 197)
            }, 
            [3] = {
                "-" .. v307 .. " HP", 
                v116.other.zindicators:get(9) and not v308 and v306 > 0.5, 
                color(210, 216, 112, 255)
            }, 
            [4] = {
                "FATAL", 
                v116.other.zindicators:get(9) and v308, 
                color(255, 0, 50, 255)
            }, 
            [5] = {
                "PING", 
                v116.other.zindicators:get(7) and v11:is_alive() and (v103.ping_spike:get_override() or v103.ping_spike:get()) > 0 and v11:is_alive(), 
                color(200, 200, 200):lerp(color(161, 200, 54), v331)
            }, 
            [6] = {
                "OSAA", 
                v116.other.zindicators:get(2) and v11:is_alive() and v103.os:get() and not v103.dt:get() and not v103.fd:get(), 
                color(200, 199, 197)
            }, 
            [7] = {
                [1] = "DT", 
                [2] = v116.other.zindicators:get(1) and v11:is_alive() and v103.dt:get() and not v103.fd:get(), 
                [3] = rage.exploit:get() == 1 and color(200, 199, 197) or color(255, 0, 50)
            }, 
            [8] = {
                [1] = "DA", 
                [2] = v116.other.zindicators:get(10) and v11:is_alive() and v103.da:get() or v116.other.dormantaimbot.value, 
                [3] = fnayf == true and color(200, 199, 197) or color(255, 0, 50)
            }, 
            [9] = {
                "HITCHANCE OVR", 
                v116.other.zindicators:get(5) and v11:is_alive() and v326 == true, 
                color(200, 199, 197)
            }, 
            [10] = {
                "DUCK", 
                v116.other.zindicators:get(4) and v11:is_alive() and v103.fd:get(), 
                color(200, 199, 197)
            }, 
            [11] = {
                "SAFE", 
                v116.other.zindicators:get(13) and v11:is_alive() and v103.safe_points:get() == "Force", 
                color(200, 199, 197)
            }, 
            [12] = {
                "BODY", 
                v116.other.zindicators:get(8) and v11:is_alive() and v103.body_aim:get() == "Force", 
                color(200, 199, 197)
            }, 
            [13] = {
                "MD", 
                v116.other.zindicators:get(6) and v116.other.mindmgstyle.value == "Default" and v11:is_alive() and v324 == true, 
                color(200, 199, 197)
            }, 
            [14] = {
                v103.min_dmg:get(), 
                v116.other.zindicators:get(6) and v116.other.mindmgstyle.value == "Number" and v11:is_alive() and v103.min_dmg:get() > 0 and v103.min_dmg:get() < 101, 
                color(200, 199, 197)
            }, 
            [15] = {
                "HP+" .. v103.min_dmg:get() - 100, 
                v116.other.zindicators:get(6) and v116.other.mindmgstyle.value == "Number" and v11:is_alive() and v103.min_dmg:get() > 100, 
                color(200, 199, 197)
            }, 
            [16] = {
                "FS", 
                v116.other.zindicators:get(3) and v11:is_alive() and v103.fs:get(), 
                color(200, 199, 197)
            }, 
            [17] = {
                string.format("%s", math.floor(v325)) .. "%", 
                v116.other.zindicators:get(12) and v11:is_alive(), 
                color(200, 199, 197)
            }, 
            [18] = {
                string.format("%i-%i-%i-%i-%i", v286, v287, v288, v289, v290), 
                v116.other.zindicators:get(11) and v11:is_alive(), 
                color(200, 199, 197)
            }
        };
        for _, v334 in pairs(v332) do
            if v334[2] then
                v301(v334[1], v321, v334[3], v334[4], v334[5], v334[6]);
                v321 = v321 - v320;
            end;
        end;
        return;
    end;
end;
local function v336()
    -- upvalues: v283 (ref)
    v283.planting = false;
    v283.fill = 0;
    v283.on_plant_time = 0;
    v283.planting_site = "";
end;
local function v343(v337)
    -- upvalues: v283 (ref)
    local v338 = entity.get_player_resource();
    if v338 == nil then
        return;
    else
        v283.on_plant_time = globals.curtime;
        v283.planting = true;
        if v283.on_plant_time == nil then
            return;
        else
            local l_m_bombsiteCenterA_0 = v338.m_bombsiteCenterA;
            local l_m_bombsiteCenterB_0 = v338.m_bombsiteCenterB;
            local v341 = entity.get(v337.userid, true);
            if v341 == nil then
                return;
            else
                local v342 = v341:get_origin();
                if v342 == nil then
                    return;
                elseif l_m_bombsiteCenterA_0 == nil or l_m_bombsiteCenterB_0 == nil then
                    return;
                else
                    v283.planting_site = v342:dist(l_m_bombsiteCenterA_0) < v342:dist(l_m_bombsiteCenterB_0) and "A" or "B";
                    return;
                end;
            end;
        end;
    end;
end;
events.bomb_beginplant:set(v343);
events.bomb_abortplant:set(v336);
events.bomb_planted:set(v336);
events.bomb_defused:set(v336);
events.bomb_pickup:set(v336);
events.round_start:set(v336);
local function v349()
    -- upvalues: v11 (ref)
    local v344 = {};
    if v11.m_hObserverTarget then
        target = v11.m_hObserverTarget;
    else
        target = v11;
    end;
    local v345 = entity.get_players(false, false);
    if v345 ~= nil then
        for _, v347 in pairs(v345) do
            local l_m_hObserverTarget_0 = v347.m_hObserverTarget;
            if l_m_hObserverTarget_0 and l_m_hObserverTarget_0 == target then
                table.insert(v344, v347);
            end;
        end;
    end;
    return v344;
end;
local function v356()
    -- upvalues: v116 (ref), v349 (ref), l_x_0 (ref)
    if not v116.other.spectatorlist.value then
        return;
    else
        local v350 = 5;
        local v351 = v349();
        for _, v353 in pairs(v351) do
            local v354 = v353:get_name();
            local l_x_1 = render.measure_text(1, nil, v354).x;
            render.text(1, vector(l_x_0 - l_x_1 - 2, 2 + v350), color(255, 255, 255, 239), nil, v354);
            v350 = v350 + 17;
        end;
        return;
    end;
end;
local function v386()
    -- upvalues: v116 (ref), v84 (ref)
    if v116.other.molotov.value then
        local v357 = entity.get_entities("CInferno");
        for v358 = 1, #v357 do
            local v359 = v357[v358];
            local v360 = v359:get_origin();
            local v361 = 40;
            local v362 = {};
            local v363 = 0;
            local v364 = nil;
            local v365 = nil;
            local v366 = v357[v358];
            for v367 = 1, 64 do
                if v366.m_bFireIsBurning[v367] == true then
                    table.insert(v362, vector(v359.m_fireXDelta[v367], v359.m_fireYDelta[v367], v359.m_fireZDelta[v367]));
                end;
            end;
            for v368 = 1, #v362 do
                for v369 = 1, #v362 do
                    local v370 = v84.dist_to_2d(v362[v368], v362[v369]);
                    if v363 < v370 then
                        v363 = v370;
                        v364 = v362[v368];
                        v365 = v362[v369];
                    end;
                end;
            end;
            if v364 ~= nil and v365 ~= nil then
                local v371 = v360 + v84.lerp_position(v364, v365, 0.5);
                render.circle_3d_outline(v371, color(v116.other.molotovclr.value.r, v116.other.molotovclr.value.g, v116.other.molotovclr.value.b, 180), v363 / 2 + v361, 0, 1, 1);
            end;
        end;
    end;
    if v116.other.smoke.value then
        local l_tickcount_0 = globals.tickcount;
        local l_tickinterval_0 = globals.tickinterval;
        local v374 = entity.get_entities("CSmokeGrenadeProjectile");
        for v375 = 1, #v374 do
            local v376 = v374[v375];
            local v377 = v376:get_classname();
            local v378 = 1;
            if v377 == "CSmokeGrenadeProjectile" and v376.m_bDidSmokeEffect == true then
                local l_m_nSmokeEffectTickBegin_0 = v376.m_nSmokeEffectTickBegin;
                if l_m_nSmokeEffectTickBegin_0 ~= nil then
                    local v380 = l_tickinterval_0 * (l_tickcount_0 - l_m_nSmokeEffectTickBegin_0);
                    if v380 > 0 and 17.55 - v380 > 0 then
                        if grenade_timer then
                            v378 = 1 - v380 / 17.55;
                        end;
                        local l_r_0 = v116.other.smokeclr.value.r;
                        local l_g_0 = v116.other.smokeclr.value.g;
                        local l_b_0 = v116.other.smokeclr.value.b;
                        local l_a_0 = v116.other.smokeclr.value.a;
                        local v385 = 125;
                        if v380 < 0.3 then
                            v385 = v385 * 0.6 + v385 * (v380 / 0.3) * 0.4;
                            l_a_0 = l_a_0 * (v380 / 0.3);
                        end;
                        if 17.55 - v380 < 1 then
                            v385 = v385 * ((17.55 - v380) / 1 * 0.3 + 0.7);
                        end;
                        render.circle_3d_outline(v376:get_origin(), color(l_r_0, l_g_0, l_b_0, l_a_0 * math.min(1, v378 * 1.3)), v385, 0, 1);
                    end;
                end;
            end;
        end;
    end;
end;
local v387 = false;
local function v395()
    -- upvalues: v116 (ref), v11 (ref), v166 (ref), v12 (ref), v114 (ref), v167 (ref), l_pui_0 (ref), v387 (ref), v86 (ref), l_x_0 (ref), v102 (ref), l_y_0 (ref)
    if not v116.visuals.infopanel.value then
        return;
    else
        local l_value_6 = v116.visuals.panel_x.value;
        local l_value_7 = v116.visuals.panel_y.value;
        local v390 = 0;
        local v391 = nil;
        local v392 = nil;
        local v393 = math.abs(v11.m_flPoseParameter[11] * 120 - 60);
        local v394 = ui.get_mouse_position();
        v391 = rage.exploit:get() == 1 and "true" or "false";
        v392 = v166 == 0 and "Off" or v166;
        if v116.visuals.panel_font.value == "Default" then
            v390 = 1;
        elseif v116.visuals.panel_font.value == "Small" then
            v390 = 2;
        elseif v116.visuals.panel_font.value == "Bold" then
            v390 = 4;
        end;
        if v390 == 2 then
            render.text(v390, vector(l_value_6 + 5, l_value_7 - 10), color(255, 255, 255, 255), "", string.upper("E s s e n c e ~ \a" .. v116.visuals.panel_clr:get():to_hex() .. "Nigthly"));
            render.text(v390, vector(l_value_6 + 5, l_value_7), color(255, 255, 255, 255), "", string.upper("User : \a" .. v116.visuals.panel_clr:get():to_hex() .. v12));
            render.text(v390, vector(l_value_6 + 5, l_value_7 + 10), color(255, 255, 255, 255), "", string.upper("Condition : \a" .. v116.visuals.panel_clr:get():to_hex() .. v114[v167]));
            render.text(v390, vector(l_value_6 + 5, l_value_7 + 20), color(255, 255, 255, 255), "", string.upper("Desync: \a" .. v116.visuals.panel_clr:get():to_hex() .. math.floor(v393) .. "\194\176"));
            render.text(v390, vector(l_value_6 + 5, l_value_7 + 30), color(255, 255, 255, 255), "", string.upper("Exploit charge : \a" .. v116.visuals.panel_clr:get():to_hex() .. v391));
            render.text(v390, vector(l_value_6 + 5, l_value_7 + 40), color(255, 255, 255, 255), "", string.upper("Defensive : \a" .. v116.visuals.panel_clr:get():to_hex() .. v392));
        else
            render.text(v390, vector(l_value_6 + 5, l_value_7 - 10), color(255, 255, 255, 255), "", string.upper("E s s e n c e ~ \a" .. v116.visuals.panel_clr:get():to_hex() .. "Nigthly"));
            render.text(v390, vector(l_value_6 + 5, l_value_7), color(255, 255, 255, 255), "", string.upper("User: \a" .. v116.visuals.panel_clr:get():to_hex() .. v12));
            render.text(v390, vector(l_value_6 + 5, l_value_7 + 10), color(255, 255, 255, 255), "", string.upper("Condition: \a" .. v116.visuals.panel_clr:get():to_hex() .. v114[v167]));
            render.text(v390, vector(l_value_6 + 5, l_value_7 + 20), color(255, 255, 255, 255), "", string.upper("Desync: \a" .. v116.visuals.panel_clr:get():to_hex() .. math.floor(v393) .. "\194\176"));
            render.text(v390, vector(l_value_6 + 5, l_value_7 + 30), color(255, 255, 255, 255), "", string.upper("Exploit charge: \a" .. v116.visuals.panel_clr:get():to_hex() .. v391));
            render.text(v390, vector(l_value_6 + 5, l_value_7 + 40), color(255, 255, 255, 255), "", string.upper("Defensive: \a" .. v116.visuals.panel_clr:get():to_hex() .. v392));
        end;
        if l_pui_0.alpha > 0.5 and v387 == false and v86(vector(v116.visuals.panel_x.value - 2, v116.visuals.panel_y.value - 12), vector(v116.visuals.panel_x.value + l_x_0 / 13 + 5, v116.visuals.panel_y.value + 55), v394) == true then
            if v390 == 2 then
                render.rect_outline(vector(l_value_6 - 1, l_value_7 - 11), vector(l_value_6 + l_x_0 / 20, l_value_7 + 55), color(255, 255, 255, 100), 0, 5);
                render.text(1, vector(l_value_6 + 49, l_value_7 - 25), color(255, 255, 255, 170), "c", "Press M2 to reset\nPress M3 to center");
            else
                render.rect_outline(vector(l_value_6 - 2, l_value_7 - 12), vector(l_value_6 + l_x_0 / 13 + 4, l_value_7 + 55), color(255, 255, 255, 100), 0, 5);
                render.text(1, vector(l_value_6 + 68, l_value_7 - 25), color(255, 255, 255, 170), "c", "Press M2 to reset\nPress M3 to center");
            end;
        end;
        if common.is_button_down(1) and l_pui_0.alpha > 0.5 then
            if v387 == false and v86(vector(v116.visuals.panel_x.value - 2, v116.visuals.panel_y.value - 12), vector(v116.visuals.panel_x.value + l_x_0 / 13 + 5, v116.visuals.panel_y.value + 55), v394) == true then
                v102.x = v394.x - l_value_6;
                v102.y = v394.y - l_value_7;
                v387 = true;
            end;
            if v387 == true then
                v116.visuals.panel_x:set(v394.x - v102.x);
                v116.visuals.panel_y:set(v394.y - v102.y);
                if v390 == 2 then
                    render.rect_outline(vector(l_value_6 - 1, l_value_7 - 11), vector(l_value_6 + l_x_0 / 20, l_value_7 + 55), color(255, 255, 255, 100), 0, 5);
                    render.rect(vector(l_value_6 - 1, l_value_7 - 11), vector(l_value_6 + l_x_0 / 20, l_value_7 + 55), color(255, 255, 255, 30), 4.5);
                else
                    render.rect_outline(vector(l_value_6 - 2, l_value_7 - 12), vector(l_value_6 + l_x_0 / 13 + 4, l_value_7 + 55), color(255, 255, 255, 100), 0, 5);
                    render.rect(vector(l_value_6 - 2, l_value_7 - 12), vector(l_value_6 + l_x_0 / 13 + 5, l_value_7 + 55), color(255, 255, 255, 30), 4.5);
                end;
                render.rect(vector(l_x_0 - 1920), vector(l_y_0 + 1920, l_x_0), color(0, 0, 0, 50));
            end;
        else
            v387 = false;
        end;
        if common.is_button_down(4) and l_pui_0.alpha > 0.5 and v387 == false and v86(vector(v116.visuals.panel_x.value - 2, v116.visuals.panel_y.value - 12), vector(v116.visuals.panel_x.value + l_x_0 / 13 + 5, v116.visuals.panel_y.value + 55), v394) == true then
            v116.visuals.panel_x:set(0);
        end;
        if common.is_button_down(2) and l_pui_0.alpha > 0.5 and v387 == false and v86(vector(v116.visuals.panel_x.value - 2, v116.visuals.panel_y.value - 12), vector(v116.visuals.panel_x.value + l_x_0 / 13 + 5, v116.visuals.panel_y.value + 55), v394) == true then
            v116.visuals.panel_x:set(0);
            v116.visuals.panel_y:set(l_y_0 / 2 - 21);
        end;
        return;
    end;
end;
local _ = nil;
local v397 = false;
local v398 = nil;
v398 = {};
local l_path_color_0 = v103.path_color;
local l_color_hit_0 = v103.color_hit;
local v401 = false;
local v402 = nil;
local function v405(v403, v404)
    render.circle(v403, v404, 2.4, 0, 1);
    render.circle_outline(v403, color(0, 0, 0, 128), 3.5, 0, 1, 1);
end;
do
    local l_v397_0, l_v398_0, l_l_path_color_0_0 = v397, v398, l_path_color_0;
    do
        local l_l_l_path_color_0_0_0, l_l_color_hit_0_0, l_v401_0, l_v402_0, l_v405_0 = l_l_path_color_0_0, l_color_hit_0, v401, v402, v405;
        local function v435(v414)
            -- upvalues: l_l_color_hit_0_0 (ref), l_l_l_path_color_0_0_0 (ref), l_v405_0 (ref), v85 (ref)
            local v415 = #v414.path;
            local v416 = #v414.collisions;
            if v415 == 1 then
                return;
            else
                local l_damage_0 = v414.damage;
                local v418 = l_damage_0 > 0;
                local v419 = nil;
                local v420 = v418 and l_l_color_hit_0_0[1]:get() and l_l_color_hit_0_0[2]:get() or l_l_l_path_color_0_0_0:get();
                for v421 = 1, v415 do
                    local v422 = render.world_to_screen(v414.path[v421]);
                    if v419 ~= nil and v422 ~= nil then
                        render.poly_line(v420, v422 + 1, v419 + 1);
                    end;
                    v419 = v422;
                end;
                for v423 = 1, v416 - 1 do
                    local v424 = render.world_to_screen(v414.collisions[v423]);
                    if v424 ~= nil then
                        l_v405_0(v424, color(255, 255, 255, 200));
                    end;
                end;
                local v425 = v414.path[v415];
                local v426 = render.world_to_screen(v425);
                if v426 ~= nil then
                    local l_target_0 = v414.target;
                    local v428 = v418 and color(0, 255, 40, 255) or color(255, 0, 40, 255);
                    l_v405_0(v426, v428);
                    if l_target_0 ~= nil then
                        local v429 = l_target_0:get_origin():dist(v425);
                        local v430 = v85.to_foot(v429);
                        local l_m_iHealth_0 = l_target_0.m_iHealth;
                        local v432 = vector(v426.x, v426.y - 10);
                        if v414.type == "Molly" and v430 <= 14.5 then
                            local v433 = v430 < 12.5 and color(129, 171, 52, 255) or color(255, 255, 255, 200);
                            render.text(1, v432, v433, "c", string.format("%.1f ft", v430));
                        end;
                        if v414.type == "Frag" and v418 then
                            local v434 = (l_damage_0 > 50 or l_m_iHealth_0 <= l_damage_0) and color(129, 171, 52, 255) or color(255, 255, 255, 200);
                            render.text(1, v432, v434, "c", string.format("%d dmg", l_damage_0));
                        end;
                    end;
                end;
                return;
            end;
        end;
        local function v436()
            -- upvalues: l_v402_0 (ref), v435 (ref)
            if l_v402_0 ~= nil then
                v435(l_v402_0);
            end;
            l_v402_0 = nil;
        end;
        local function v438(v437)
            -- upvalues: l_v402_0 (ref)
            l_v402_0 = v437;
            return false;
        end;
        l_v398_0.bind = function()
            -- upvalues: l_v397_0 (ref), l_v401_0 (ref), v436 (ref), v438 (ref)
            local v439 = l_v397_0 and l_v401_0;
            events.render(v436, v439);
            events.grenade_prediction(v438, v439);
        end;
        v116.other.gsprediction:set_callback(function(v440)
            -- upvalues: l_v401_0 (ref), l_v398_0 (ref)
            l_v401_0 = v440:get();
            l_v398_0.bind();
        end, true);
    end;
    l_l_path_color_0_0 = nil;
    l_l_path_color_0_0 = {};
    l_color_hit_0 = utils.get_netvar_offset("DT_BaseCSGrenadeProjectile", "m_nExplodeEffectTickBegin") + 16;
    v401 = 30;
    v402 = 48;
    v405 = 204;
    local v441 = v405 - v402;
    local v442 = false;
    do
        local l_l_color_hit_0_1, l_v401_1, l_v402_1, l_v405_1, l_v441_0, l_v442_0 = l_color_hit_0, v401, v402, v405, v441, v442;
        local function v450(v449)
            -- upvalues: l_l_color_hit_0_1 (ref)
            return ffi.cast("float*", ffi.cast("unsigned long", v449[0]) + l_l_color_hit_0_1)[0];
        end;
        local function v453(v451)
            -- upvalues: l_v402_1 (ref), l_v405_1 (ref), l_v441_0 (ref)
            local v452 = 1 - (math.clamp(v451, l_v402_1, l_v405_1) - l_v402_1) / l_v441_0;
            return v452 * v452;
        end;
        local function v456(v454)
            -- upvalues: v453 (ref), l_v401_1 (ref)
            local v455 = v453(v454) * 20;
            return l_v401_1 + v455;
        end;
        local function v459(v457)
            -- upvalues: v450 (ref)
            local v458 = v457.entity.m_nExplodeEffectTickBegin ~= nil;
            return (v457.expire_time - globals.curtime) / (not v458 and 7 or v457.expire_time - v450(v457.entity));
        end;
        local function v462(v460, v461)
            if v460.type == "Molly" then
                return math.ceil(v461 * 0.0798);
            else
                return v460.damage;
            end;
        end;
        local function v466(v463, v464)
            -- upvalues: l_x_0 (ref), l_y_0 (ref)
            local v465 = render.get_offscreen(v463.origin, 0.9, true);
            v465.x = math.clamp(v465.x, v464, l_x_0 - v464);
            v465.y = math.clamp(v465.y, v464, l_y_0 - v464);
            return v465;
        end;
        local function v471(v467, v468)
            local v469 = v468:get_origin();
            local v470 = v467.type == "Frag" and 350 or 408;
            return v469:distsqr(v467.origin) <= v470 * v470;
        end;
        local function v479(v472, v473, v474, v475)
            if v472.type == "Frag" then
                if v472.damage == 0 then
                    return nil;
                else
                    local v476 = math.clamp(v472.damage, 0, 55) / 55;
                    v476 = math.sqrt(v476);
                    local v477 = color():as_hsl(0, 0.8 * v476, 0.2 * v476 + 0.3, 0.785);
                    outer = v477:clone();
                    outer.a = 10;
                    render.circle_gradient(v473, outer, v477, v474, 0, 1);
                    return nil;
                end;
            elseif v472.type == "Molly" then
                if v475 > 155 then
                    return nil;
                else
                    local v478 = color(255, 0, 0, 210);
                    outer = v478:clone();
                    outer.a = 0;
                    render.circle_gradient(v473, outer, v478, v474, 0, 1);
                    return nil;
                end;
            else
                return;
            end;
        end;
        local function v492(v480, v481)
            -- upvalues: v456 (ref), v466 (ref), v459 (ref), v479 (ref), v63 (ref), v462 (ref)
            local v482 = v481:dist(v480.closest_point);
            local v483 = v456(v482);
            local v484 = v466(v480, v483);
            if v484 == nil then
                return false;
            elseif v480.type ~= "Molly" and v480.damage == 0 then
                return;
            else
                local v485 = v459(v480);
                render.circle(v484, color(0, 0, 0, 230), v483, 0, 1);
                v479(v480, v484, v483, v482);
                render.circle_outline(v484, color(255, 255, 255, 240), v483 - 1, 0, v485, 1.5);
                local l_icon_0 = v480.icon;
                local v487 = color(255, 255, 255, 220);
                local v488 = vector(l_icon_0.width, l_icon_0.height) * 1;
                local v489 = vector(v63.width, v63.height) * 1;
                local v490 = v484 - v488 / 2 - vector(0, 10);
                local v491 = v484 - v489 / 2 - vector(0, 10);
                if v480.type == "Molly" then
                    render.texture(v63, v491, v489, v487);
                else
                    render.texture(l_icon_0, v490, v488, v487);
                end;
                v487 = v462(v480, v482);
                v488 = v484 + vector(0, 12);
                v489 = color(255, 255, 255, 250);
                render.text(4, v488, v489, "c", v487);
                return;
            end;
        end;
        local function v495(v493)
            -- upvalues: v11 (ref), v471 (ref), v492 (ref)
            if v11 == nil then
                return false;
            elseif not v471(v493, v11) then
                return false;
            else
                local v494 = v11:get_origin();
                if v494 == nil then
                    return false;
                else
                    v492(v493, v494);
                    return false;
                end;
            end;
        end;
        l_l_path_color_0_0.bind = function()
            -- upvalues: v495 (ref), l_v397_0 (ref), l_v442_0 (ref)
            events.grenade_warning(v495, l_v397_0 and l_v442_0);
        end;
        v116.other.gsproxwarn:set_callback(function(v496)
            -- upvalues: l_v442_0 (ref), l_l_path_color_0_0 (ref)
            l_v442_0 = v496:get();
            l_l_path_color_0_0.bind();
        end, true);
    end;
    v116.other.gsgrenadethings:set_callback(function(v497)
        -- upvalues: l_v397_0 (ref), l_v398_0 (ref), l_l_path_color_0_0 (ref)
        l_v397_0 = v497:get();
        l_v398_0.bind();
        l_l_path_color_0_0.bind();
    end, true);
end;
v397 = nil;
v398 = 5;
l_path_color_0 = nil;
l_color_hit_0 = nil;
v401 = nil;
v402 = nil;
v405 = nil;
local v498 = false;
local v499 = false;
local v500 = 1;
local v501 = 0;
local v502 = {
    [0] = "Generic", 
    [1] = "Head", 
    [2] = "Chest", 
    [3] = "Stomach", 
    [4] = "Chest", 
    [5] = "Chest", 
    [6] = "Legs", 
    [7] = "Legs", 
    [8] = "Head", 
    [9] = nil, 
    [10] = "Gear"
};
local v503 = {
    [1] = {
        scale = 5, 
        hitbox = "Stomach", 
        vec = vector(0, 0, 40)
    }, 
    [2] = {
        scale = 6, 
        hitbox = "Chest", 
        vec = vector(0, 0, 50)
    }, 
    [3] = {
        scale = 3, 
        hitbox = "Head", 
        vec = vector(0, 0, 58)
    }, 
    [4] = {
        scale = 4, 
        hitbox = "Legs", 
        vec = vector(0, 0, 20)
    }
};
local function v507(v504, v505)
    for v506 = 1, #v504 do
        if v504[v506] == v505 then
            return true;
        end;
    end;
    return false;
end;
local function v509(v508)
    return v508 >= 1 and v508 <= 6;
end;
local function v514()
    local v510 = {};
    local v511 = entity.get_player_resource();
    for v512 = 1, globals.max_players do
        local v513 = entity.get(v512);
        if v513 ~= nil and v511.m_bConnected[v512] and v513:is_enemy() and v513:is_dormant() then
            table.insert(v510, v513);
        end;
    end;
    return v510;
end;
local function v521(v515, v516, v517)
    local v518 = v515:to(v516):angles();
    local v519 = math.rad(v518.y + 90);
    local v520 = vector(math.cos(v519), math.sin(v519), 0) * v517;
    return {
        [1] = {
            text = "Middle", 
            vec = v516
        }, 
        [2] = {
            text = "Left", 
            vec = v516 + v520
        }, 
        [3] = {
            text = "Right", 
            vec = v516 - v520
        }
    };
end;
local function v529(v522, v523, v524, v525)
    local v526, v527 = utils.trace_bullet(v522, v523, v524, v525);
    if v527 ~= nil then
        local l_entity_0 = v527.entity;
        if l_entity_0 == nil then
            return 0, v527;
        elseif l_entity_0:is_player() and not l_entity_0:is_enemy() then
            return 0, v527;
        end;
    end;
    return v526, v527;
end;
do
    local l_v398_1, l_l_path_color_0_1, l_l_color_hit_0_2, l_v401_2, l_v402_2, l_v405_2, l_v498_0, l_v499_0, l_v500_0, l_v501_0, l_v502_0, l_v503_0, l_v507_0, l_v509_0, l_v514_0, l_v521_0, l_v529_0 = v398, l_path_color_0, l_color_hit_0, v401, v402, v405, v498, v499, v500, v501, v502, v503, v507, v509, v514, v521, v529;
    local function v585(v547)
        -- upvalues: v103 (ref), v11 (ref), l_v501_0 (ref), l_v509_0 (ref), l_v514_0 (ref), v116 (ref), l_v500_0 (ref), l_v503_0 (ref), l_v507_0 (ref), l_v521_0 (ref), l_v529_0 (ref), l_l_path_color_0_1 (ref), l_v401_2 (ref), l_v402_2 (ref), l_l_color_hit_0_2 (ref), l_v405_2 (ref), l_v398_1 (ref), l_v499_0 (ref)
        v103.dormantaimbot:override(false);
        if v11 == nil then
            return;
        else
            local v548 = v11:get_player_weapon();
            if v548 == nil then
                return;
            else
                local v549 = v548:get_weapon_info();
                if v549 == nil then
                    return;
                else
                    local v550 = v548:get_inaccuracy();
                    if v550 == nil then
                        return;
                    else
                        local l_tickcount_1 = globals.tickcount;
                        local v552 = v11:get_eye_position();
                        local l_current_0 = v11:get_simulation_time().current;
                        local v554 = bit.band(v11.m_fFlags, bit.lshift(1, 0)) ~= 0;
                        if l_tickcount_1 < l_v501_0 then
                            return;
                        elseif v547.in_jump and not v554 then
                            return;
                        else
                            local l_weapon_type_0 = v549.weapon_type;
                            if not l_v509_0(l_weapon_type_0) or v548.m_iClip1 <= 0 then
                                return false;
                            else
                                local v556 = l_v514_0();
                                local l_value_8 = v116.other.dormanthbox.value;
                                if l_tickcount_1 % #v556 ~= 0 then
                                    l_v500_0 = l_v500_0 + 1;
                                else
                                    l_v500_0 = 1;
                                end;
                                local v558 = v556[l_v500_0];
                                if v558 == nil then
                                    return;
                                else
                                    local v559 = v558:get_bbox();
                                    local v560 = v558:get_origin();
                                    local l_m_flDuckAmount_0 = v558.m_flDuckAmount;
                                    local l_value_9 = v116.other.dormantaccuracy.value;
                                    local l_value_10 = v116.other.dormantdmg.value;
                                    if l_value_10 == 0 then
                                        l_value_10 = v103.min_dmg:get();
                                    end;
                                    if l_value_10 > 100 then
                                        l_value_10 = l_value_10 - 100 + v558.m_iHealth;
                                    end;
                                    local v564 = {};
                                    for v565 = 1, #l_v503_0 do
                                        local v566 = l_v503_0[v565];
                                        local l_vec_0 = v566.vec;
                                        local l_scale_0 = v566.scale;
                                        local l_hitbox_0 = v566.hitbox;
                                        if l_hitbox_0 == "Head" then
                                            l_vec_0 = l_vec_0 - vector(0, 0, 10 * l_m_flDuckAmount_0);
                                        end;
                                        if l_hitbox_0 == "Chest" then
                                            l_vec_0 = l_vec_0 - vector(0, 0, 4 * l_m_flDuckAmount_0);
                                        end;
                                        if #l_value_8 ~= 0 then
                                            if l_v507_0(l_value_8, l_hitbox_0) then
                                                table.insert(v564, {
                                                    vec = l_vec_0, 
                                                    scale = l_scale_0, 
                                                    hitbox = l_hitbox_0
                                                });
                                            end;
                                        else
                                            table.insert(v564, 1, {
                                                vec = l_vec_0, 
                                                scale = l_scale_0, 
                                                hitbox = l_hitbox_0
                                            });
                                        end;
                                    end;
                                    if not (v549.is_revolver and not (v548.m_flNextPrimaryAttack >= l_current_0) or math.max(v11.m_flNextAttack, v548.m_flNextPrimaryAttack, v548.m_flNextSecondaryAttack) < l_current_0) then
                                        return;
                                    else
                                        local v570 = nil;
                                        local v571 = nil;
                                        if math.floor(v559.alpha * 100) + 5 <= l_value_9 then
                                            return;
                                        else
                                            for v572 = 1, #v564 do
                                                local v573 = v564[v572];
                                                local v574 = l_v521_0(v552, v560 + v573.vec, v573.scale);
                                                for v575 = 1, #v574 do
                                                    local v576 = v574[v575];
                                                    local l_vec_1 = v576.vec;
                                                    local v579, v580 = l_v529_0(v11, v552, l_vec_1, function(v578)
                                                        -- upvalues: v558 (ref)
                                                        return v578 == v558;
                                                    end);
                                                    if (v580 == nil or not v580:is_visible()) and v579 ~= 0 and l_value_10 < v579 then
                                                        v570 = l_vec_1;
                                                        v571 = v579;
                                                        l_l_path_color_0_1 = v558;
                                                        l_v401_2 = v573.hitbox;
                                                        l_v402_2 = v579;
                                                        l_l_color_hit_0_2 = v576.text;
                                                        l_v405_2 = v559.alpha;
                                                        break;
                                                    end;
                                                end;
                                                if v570 and v571 then
                                                    break;
                                                end;
                                            end;
                                            if not v570 or not v571 then
                                                return;
                                            else
                                                local v581 = v552:to(v570):angles();
                                                v547.block_movement = 1;
                                                if v116.other.dormantautoscope.value then
                                                    local v582 = not v547.in_jump and v554;
                                                    local v583 = v11.m_bIsScoped or v11.m_bResumeZoom;
                                                    local v584 = v549.weapon_type == l_v398_1;
                                                    if not v583 and v584 and v582 then
                                                        v547.in_attack2 = true;
                                                    end;
                                                end;
                                                if v550 < 0.01 then
                                                    v547.view_angles = v581;
                                                    v547.in_attack = true;
                                                    l_v499_0 = true;
                                                end;
                                                return;
                                            end;
                                        end;
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;
    local function v587(v586)
        -- upvalues: v11 (ref), l_v499_0 (ref), l_v498_0 (ref), l_l_path_color_0_1 (ref), l_v401_2 (ref), l_v402_2 (ref), l_l_color_hit_0_2 (ref), l_v405_2 (ref)
        utils.execute_after(0.03, function()
            -- upvalues: v586 (ref), v11 (ref), l_v499_0 (ref), l_v498_0 (ref), l_l_path_color_0_1 (ref), l_v401_2 (ref), l_v402_2 (ref), l_l_color_hit_0_2 (ref), l_v405_2 (ref)
            if entity.get(v586.userid, true) == v11 then
                if l_v499_0 and not l_v498_0 then
                    events.dormant_miss:call({
                        userid = l_l_path_color_0_1, 
                        aim_hitbox = l_v401_2, 
                        aim_damage = l_v402_2, 
                        aim_point = l_l_color_hit_0_2, 
                        accuracy = l_v405_2
                    });
                end;
                l_v498_0 = false;
                l_v499_0 = false;
                l_l_path_color_0_1 = nil;
                l_v401_2 = nil;
                l_v402_2 = nil;
                l_l_color_hit_0_2 = nil;
                l_v405_2 = nil;
            end;
        end);
    end;
    local function v592(v588)
        -- upvalues: v11 (ref), l_v499_0 (ref), l_v498_0 (ref), l_v502_0 (ref), l_l_color_hit_0_2 (ref), l_v401_2 (ref), l_v402_2 (ref)
        local v589 = entity.get(v588.userid, true);
        local v590 = entity.get(v588.attacker, true);
        if v589 == nil or v590 ~= v11 then
            return;
        else
            local v591 = v589:get_bbox();
            if v591 == nil then
                return;
            else
                if v589:is_dormant() and l_v499_0 == true then
                    l_v498_0 = true;
                    events.dormant_hit:call({
                        userid = v589, 
                        attacker = v590, 
                        health = v588.health, 
                        armor = v588.armor, 
                        weapon = v588.weapon, 
                        dmg_health = v588.dmg_health, 
                        dmg_armor = v588.dmg_armor, 
                        hitgroup = v588.hitgroup, 
                        accuracy = v591.alpha, 
                        hitbox = l_v502_0[v588.hitgroup], 
                        aim_point = l_l_color_hit_0_2, 
                        aim_hitbox = l_v401_2, 
                        aim_damage = l_v402_2
                    });
                end;
                return;
            end;
        end;
    end;
    local function v593()
        -- upvalues: v103 (ref)
        v103.dormantaimbot:override();
    end;
    v116.other.dormantaimbot:set_callback(function(v594)
        -- upvalues: v103 (ref), v593 (ref), v585 (ref), v587 (ref), v592 (ref)
        local v595 = v594:get();
        if not v595 then
            v103.dormantaimbot:override();
        end;
        events.shutdown(v593, v595);
        events.createmove(v585, v595);
        events.weapon_fire(v587, v595);
        events.player_hurt(v592, v595);
    end, true);
end;
v398 = function(v596)
    -- upvalues: v116 (ref), v11 (ref)
    if not v116.other.fastladder.value then
        return;
    else
        local v597 = v11:get_player_weapon();
        if not v597 then
            return;
        elseif v597:get_weapon_info().weapon_type == 9 and (not v597.m_bPinPulled or v596.in_attack or v596.in_attack2) and v597.m_fThrowTime > 0 then
            return;
        else
            local v598 = render.camera_angles();
            if v11.m_MoveType == 9 then
                v596.view_angles.y = math.floor(v596.view_angles.y + 0.5);
                v596.view_angles.z = 0;
                if v596.forwardmove > 0 and v598.x < 45 then
                    v596.view_angles.x = 89;
                    v596.in_moveright = 1;
                    v596.in_moveleft = 0;
                    v596.in_forward = 0;
                    v596.in_back = 1;
                    if v596.sidemove == 0 then
                        v596.view_angles.y = v596.view_angles.y + 90;
                    end;
                    if v596.sidemove < 0 then
                        v596.view_angles.y = v596.view_angles.y + 150;
                    end;
                    if v596.sidemove > 0 then
                        v596.view_angles.y = v596.view_angles.y + 30;
                    end;
                end;
                if v596.forwardmove < 0 then
                    v596.view_angles.x = 89;
                    v596.in_moveleft = 1;
                    v596.in_moveright = 0;
                    v596.in_forward = 1;
                    v596.in_back = 0;
                    if v596.sidemove == 0 then
                        v596.view_angles.y = v596.view_angles.y + 90;
                    end;
                    if v596.sidemove > 0 then
                        v596.view_angles.y = v596.view_angles.y + 150;
                    end;
                    if v596.sidemove < 0 then
                        v596.view_angles.y = v596.view_angles.y + 30;
                    end;
                end;
            end;
            return;
        end;
    end;
end;
l_path_color_0 = function(v599)
    -- upvalues: l_x_0 (ref), l_y_0 (ref), v11 (ref)
    local l_x_2 = v11:get_origin().x;
    local l_y_1 = v11:get_origin().y;
    z = v11:get_origin().z;
    l_y_0 = l_y_1;
    l_x_0 = l_x_2;
    for v602 = 0, math.pi * 2, math.pi * 2 / 8 do
        if utils.trace_line(vector(10 * math.cos(v602) + l_x_0, 10 * math.sin(v602) + l_y_0, z), vector(10 * math.cos(v602) + l_x_0, 10 * math.sin(v602) + l_y_0, z - v599), self).fraction ~= 1 then
            return true;
        end;
    end;
end;
l_color_hit_0 = false;
v401 = function()
    -- upvalues: v116 (ref), v11 (ref), l_color_hit_0 (ref), l_path_color_0 (ref)
    if not v116.other.nofalldamage.value then
        return;
    else
        if v11.m_vecVelocity.z >= -500 then
            l_color_hit_0 = false;
        elseif l_path_color_0(15) then
            l_color_hit_0 = false;
        elseif l_path_color_0(75) then
            l_color_hit_0 = true;
        end;
        return;
    end;
end;
v402 = function(v603)
    -- upvalues: v116 (ref), v11 (ref), l_color_hit_0 (ref)
    if not v116.other.nofalldamage.value then
        return;
    else
        if v11.m_vecVelocity.z < -500 then
            if l_color_hit_0 then
                v603.in_duck = 1;
            else
                v603.in_duck = 0;
            end;
        end;
        return;
    end;
end;
v405 = function(v604)
    -- upvalues: v11 (ref), v116 (ref)
    if not v11 and not v11:is_alive() then
        return;
    elseif not v116.other.edge_stop.value then
        return;
    else
        local v605 = v11:get_origin();
        sim = v11:simulate_movement(v605);
        sim:think(5);
        if sim.velocity.z < 0 then
            v604.block_movement = 2;
        end;
        return;
    end;
end;
v498 = function()
    -- upvalues: v116 (ref), v103 (ref), v11 (ref), l_x_0 (ref), l_y_0 (ref)
    if v116.visuals.customscope.value then
        local l_r_1 = v116.visuals.scopecolor.value.r;
        local l_g_1 = v116.visuals.scopecolor.value.g;
        local l_b_1 = v116.visuals.scopecolor.value.b;
        local l_a_1 = v116.visuals.scopecolor.value.a;
        local l_value_11 = v116.visuals.inverted.value;
        v103.scope_overlay:override("Remove All");
        if v11.m_bIsScoped then
            if not v116.visuals.scoperemovals:get(3) then
                render.gradient(vector(l_x_0 / 2 + v116.visuals.scopegap.value + 1, l_y_0 / 2), vector(l_x_0 / 2 + v116.visuals.scopegap.value + v116.visuals.scopesize.value + 1, l_y_0 / 2 + 1), color(l_r_1, l_g_1, l_b_1, not l_value_11 and l_a_1 or 0), color(l_r_1, l_g_1, l_b_1, l_value_11 and l_a_1 or 0), color(l_r_1, l_g_1, l_b_1, not l_value_11 and l_a_1 or 0), color(l_r_1, l_g_1, l_b_1, l_value_11 and l_a_1 or 0));
            end;
            if not v116.visuals.scoperemovals:get(2) then
                render.gradient(vector(l_x_0 / 2 - v116.visuals.scopegap.value, l_y_0 / 2), vector(l_x_0 / 2 - v116.visuals.scopegap.value - v116.visuals.scopesize.value, l_y_0 / 2 + 1), color(l_r_1, l_g_1, l_b_1, not l_value_11 and l_a_1 or 0), color(l_r_1, l_g_1, l_b_1, l_value_11 and l_a_1 or 0), color(l_r_1, l_g_1, l_b_1, not l_value_11 and l_a_1 or 0), color(l_r_1, l_g_1, l_b_1, l_value_11 and l_a_1 or 0));
            end;
            if not v116.visuals.scoperemovals:get(1) then
                render.gradient(vector(l_x_0 / 2, l_y_0 / 2 - v116.visuals.scopegap.value), vector(l_x_0 / 2 + 1, l_y_0 / 2 - v116.visuals.scopegap.value - v116.visuals.scopesize.value), color(l_r_1, l_g_1, l_b_1, not l_value_11 and l_a_1 or 0), color(l_r_1, l_g_1, l_b_1, not l_value_11 and l_a_1 or 0), color(l_r_1, l_g_1, l_b_1, l_value_11 and l_a_1 or 0), color(l_r_1, l_g_1, l_b_1, l_value_11 and l_a_1 or 0));
            end;
            if not v116.visuals.scoperemovals:get(4) then
                render.gradient(vector(l_x_0 / 2, l_y_0 / 2 + v116.visuals.scopegap.value + 1), vector(l_x_0 / 2 + 1, l_y_0 / 2 + v116.visuals.scopegap.value + v116.visuals.scopesize.value + 1), color(l_r_1, l_g_1, l_b_1, not l_value_11 and l_a_1 or 0), color(l_r_1, l_g_1, l_b_1, not l_value_11 and l_a_1 or 0), color(l_r_1, l_g_1, l_b_1, l_value_11 and l_a_1 or 0), color(l_r_1, l_g_1, l_b_1, l_value_11 and l_a_1 or 0));
            end;
        end;
    else
        v103.scope_overlay:override();
    end;
end;
v116.other.pingslider:set_callback(function()
    -- upvalues: v103 (ref), v116 (ref)
    v103.ping_spike:override(v116.other.pingslider.value);
end, true);
v116.other.adicoeslist:set_callback(function()
    -- upvalues: v116 (ref)
    if v116.other.adicoeslist:get(1) then
        cvar.cl_foot_contact_shadows:int(0);
    elseif v116.other.adicoeslist:get(4) then
        cvar.sv_party_mode:int(1);
    end;
end, true);
v499 = function(_)
    -- upvalues: v116 (ref), v11 (ref), v103 (ref)
    if not v116.other.adicoeslist:get(2) then
        return;
    elseif v11 or v11:is_alive() then
        local v612 = v11:get_player_weapon();
        if not v612 then
            return;
        else
            local v613 = v612:get_weapon_info();
            if v103.lp_chams:get() then
                local v614 = v103.lp_chamsclr:get();
                if not v11.m_bGunGameImmunity then
                    v103.lp_chamsclr:override(v614:alpha_modulate(255));
                end;
                return (not not v11.m_bIsScoped or v11.m_bResumeZoom or v613.weapon_type == 9) and math.min(v614.a, 100) or v614.a;
            else
                return (not not v11.m_bIsScoped or v11.m_bResumeZoom or v613.weapon_type == 9) and 100 or 255;
            end;
        end;
    else
        return;
    end;
end;
v500 = function()
    -- upvalues: v116 (ref)
    if not v116.other.adicoeslist:get(3) then
        return;
    else
        local v615 = entity.get_entities("CEnvTonemapController");
        for v616 = 1, #v615 do
            local v617 = v615[v616];
            v617.m_bUseCustomAutoExposureMin = true;
            v617.m_bUseCustomAutoExposureMax = true;
            v617.m_flCustomAutoExposureMin = 0.8;
            v617.m_flCustomAutoExposureMax = 1.3;
        end;
        return;
    end;
end;
v501 = {
    speed = 2, 
    padding = "           ", 
    text = " essence ", 
    step = 1
};
v502 = function()
    -- upvalues: v501 (ref)
    local v618 = v501.padding .. v501.text .. v501.padding;
    local v619 = #v501.text;
    local v620 = math.floor(globals.curtime * v501.speed + 0.5) % (v619 + #v501.padding) + 1;
    if v620 == v501.step then
        return;
    else
        v501.step = v620;
        common.set_clan_tag(v618:sub(v620, v620 + v619));
        return;
    end;
end;
v116.other.clantag:set_callback(function(v621)
    -- upvalues: v11 (ref), v103 (ref), v502 (ref)
    if not v11 then
        return;
    else
        if v621.value then
            if v103.clantag:get() then
                v103.clantag:set(false);
                common.set_clan_tag("");
            end;
            events.net_update_end:set(v502);
            v103.clantag:disabled(true);
        else
            v103.clantag:set();
            events.net_update_end:unset(v502);
            v103.clantag:disabled(false);
            common.set_clan_tag("");
        end;
        return;
    end;
end, true);
v503 = function(v622)
    -- upvalues: v116 (ref), v11 (ref), v103 (ref), v20 (ref)
    if not v116.other.animated_zoom.value then
        return;
    elseif not v11 and not v11:is_alive() then
        return;
    else
        local v623 = v11:get_player_weapon();
        if not v623 then
            return;
        else
            local l_m_zoomLevel_0 = v623.m_zoomLevel;
            local l_m_bIsScoped_0 = v11.m_bIsScoped;
            local v626 = 0;
            if l_m_bIsScoped_0 then
                if l_m_zoomLevel_0 == 1 then
                    v626 = v103.override_zoom:get();
                elseif l_m_zoomLevel_0 == 2 then
                    v626 = v103.override_zoom:get() * 2;
                end;
            end;
            v622.fov = v20.new("animated_fov", v103.field_of_view:get() - v626);
            return;
        end;
    end;
end;
v116.other.improvementops:set_callback(function()
    -- upvalues: v116 (ref)
    if v116.other.improvementops:get(1) then
        cvar.r_shadows:int(0);
        cvar.cl_csm_static_prop_shadows:int(0);
        cvar.cl_foot_contact_shadows:int(0);
        cvar.cl_csm_shadows:int(0);
        cvar.cl_csm_world_shadows:int(0);
        cvar.cl_csm_viewmodel_shadows:int(0);
        cvar.cl_csm_rope_shadows:int(0);
        cvar.cl_csm_sprite_shadows:int(0);
        cvar.cl_csm_translucent_shadows:int(0);
        cvar.cl_csm_entity_shadows:int(0);
        cvar.cl_csm_world_shadows_in_viewmodelcascade:int(0);
    else
        cvar.r_shadows:int(1);
        cvar.cl_csm_static_prop_shadows:int(1);
        cvar.cl_foot_contact_shadows:int(1);
        cvar.cl_csm_shadows:int(1);
        cvar.cl_csm_world_shadows:int(1);
        cvar.cl_csm_viewmodel_shadows:int(1);
        cvar.cl_csm_rope_shadows:int(1);
        cvar.cl_csm_sprite_shadows:int(1);
        cvar.cl_csm_translucent_shadows:int(1);
        cvar.cl_csm_entity_shadows:int(1);
        cvar.cl_csm_world_shadows_in_viewmodelcascade:int(1);
    end;
    if v116.other.improvementops:get(2) then
        cvar.violence_hblood:int(0);
    else
        cvar.violence_hblood:int(1);
    end;
    if v116.other.improvementops:get(3) then
        cvar.r_drawdecals:int(0);
        cvar.r_drawropes:int(0);
        cvar.r_drawsprites:int(0);
    else
        cvar.r_drawdecals:int(1);
        cvar.r_drawropes:int(1);
        cvar.r_drawsprites:int(1);
    end;
    if v116.other.improvementops:get(4) then
        cvar.r_3dsky:int(0);
        cvar.r_3dskyinreflection:int(0);
    else
        cvar.r_3dsky:int(1);
        cvar.r_3dskyinreflection:int(1);
    end;
    if v116.other.improvementops:get(5) then
        cvar.fog_enable:int(0);
        cvar.fog_enable_water_fog:int(0);
    else
        cvar.fog_enable:int(1);
        cvar.fog_enable_water_fog:int(1);
    end;
    if v116.other.improvementops:get(6) then
        cvar.mat_disable_bloom:int(1);
    else
        cvar.mat_disable_bloom:int(0);
    end;
    if v116.other.improvementops:get(7) then
        cvar.r_dynamic:int(0);
        cvar.r_eyegloss:int(0);
        cvar.r_eyes:int(0);
        cvar.r_drawtracers_firstperson:int(0);
        cvar.r_dynamiclighting:int(0);
        cvar.cl_drawmonitors:int(0);
        cvar.mat_disable_fancy_blending:int(1);
        cvar.muzzleflash_light:int(0);
        cvar.func_break_max_pieces:int(0);
    else
        cvar.r_dynamic:int(1);
        cvar.r_eyegloss:int(1);
        cvar.r_eyes:int(1);
        cvar.r_drawtracers_firstperson:int(1);
        cvar.r_dynamiclighting:int(1);
        cvar.cl_drawmonitors:int(1);
        cvar.mat_disable_fancy_blending:int(0);
        cvar.muzzleflash_light:int(1);
        cvar.func_break_max_pieces:int(1);
    end;
end, true);
v507 = false;
v509 = function(v627)
    -- upvalues: v116 (ref), v11 (ref), v103 (ref), v507 (ref)
    if not v116.other.customfd.value or v11:is_alive() == nil then
        return;
    else
        v103.fd:override(false);
        if v103.fd:get() then
            v507 = false;
            v103.os:override(false);
            v103.dt:override(false);
            local l_m_fFlags_1 = v11.m_fFlags;
            if bit.band(l_m_fFlags_1, 1) == 1 and not v627.in_jump and v627.in_duck == false then
                v507 = true;
                local v629 = v103.fl_limit:get();
                v103.fl:override(false);
                if v627.choked_commands < v629 then
                    v627.send_packet = false;
                end;
                if v627.choked_commands <= v629 / 2 then
                    v627.in_duck = false;
                else
                    v627.in_duck = true;
                end;
            end;
        else
            v507 = false;
            v103.fl:override();
            v103.os:override();
            v103.dt:override();
        end;
        return;
    end;
end;
events.override_view:set(function(v630)
    -- upvalues: v103 (ref), v507 (ref), v11 (ref), v503 (ref)
    if v103.fd:get() and v507 and v11:is_alive() then
        v630.camera.z = v11:get_origin().z + 64;
    end;
    if v11 then
        v503(v630);
    end;
end);
original = l_hook_0.TrampolineHook(v37, "void(__fastcall*)(void*, void*, void*, float*, float*)", function(v631, v632, v633, v634, v635)
    -- upvalues: v11 (ref), v103 (ref), v507 (ref)
    if tonumber(v633) == tonumber(v11[0]) and v103.fd:get() and v507 then
        v634[2] = v11:get_origin().z + 64;
    end;
    original(v631, v632, v633, v634, v635);
end);
v514 = function()
    -- upvalues: v116 (ref), v11 (ref), v103 (ref), v167 (ref)
    if not v116.other.anims.value then
        return;
    elseif v11 == nil or not v11:is_alive() then
        return;
    else
        local v636 = v11[0];
        local v637 = v11:get_anim_state();
        if v637 == nil then
            return;
        else
            local v638 = ffi.cast("animstate_layer_t**", ffi.cast("uintptr_t", v636) + 10640)[0];
            move = math.sqrt(v11.m_vecVelocity.x ^ 2 + v11.m_vecVelocity.y ^ 2) > 5;
            jump = bit.band(v11.m_fFlags, 1) == 0;
            if v116.other.menuonair.value == "Static" then
                v11.m_flPoseParameter[6] = 1;
            elseif v116.other.menuonair.value == "Jitter" then
                v11.m_flPoseParameter[6] = globals.tickcount % 4 > 1 and 0 or 1;
            elseif v116.other.menuonair.value == "Moonwalk" and jump and move then
                v638[6].m_flWeight = 1;
            end;
            if v116.other.menuonground.value == "Reversed" then
                v11.m_flPoseParameter[0] = 1;
                v103.legs_movement:set("Sliding");
            elseif v116.other.menuonground.value == "Jitter Legs" then
                v103.legs_movement:set("Sliding");
                v11.m_flPoseParameter[0] = globals.tickcount % 3 and math.random(utils.random_float(v116.other.jitterl.value / 100, v116.other.jitterr.value / 100), 1) or utils.random_float(0.1, 1);
            elseif v116.other.menuonground.value == "Moonwalk" then
                v11.m_flPoseParameter[7] = 1;
                v103.legs_movement:set("Walking");
            elseif v116.other.menuonground.value == "Gamesense" then
                v11.m_flPoseParameter[0] = globals.client_tick % 3 > 1 and 1 or 0.7;
                v103.legs_movement:set("Sliding");
            else
                v103.legs_movement:set();
            end;
            if v116.other.ongroundslide.value and v103.slow_walk:get() then
                v638[12].m_flWeight = 0;
                v638[6].m_flWeight = 0;
            elseif v116.other.onground.value and (v167 == 4 or v167 == 5) then
                v638[12].m_flWeight = 0;
                v638[6].m_flWeight = 0;
            end;
            if v116.other.onland.value and v637.landing and v167 <= 5 then
                v11.m_flPoseParameter[12] = 0.5;
            end;
            if v116.other.menubodylean.value > 0 and move then
                v638[12].m_flWeight = v116.other.menubodylean.value / 100;
            end;
            if v116.other.menuextras:get(1) then
                v638[12].m_flWeight = utils.random_float(0, 1);
            end;
            if v116.other.menuextras:get(2) then
                v11.m_flPoseParameter[3] = math.random(0, 10) / 10;
                v11.m_flPoseParameter[6] = math.random(0, 10) / 10;
                v11.m_flPoseParameter[7] = math.random(0, 10) / 10;
            end;
            if v116.other.menuextras:get(3) then
                v11.m_flPoseParameter[2] = 0;
            end;
            return;
        end;
    end;
end;
v521 = nil;
v521 = {};
v529 = {
    layers = {}
};
for v639 = 1, 15 do
    v529.layers[v639] = {
        cycle = 0, 
        weight = 0
    };
end;
v529.server = {};
v529.sim_time = 0;
v529.velocity = 0;
v529.duck_amount = 0;
v529.weapon = 0;
local function v643(v640, v641, v642)
    return v640 + (v641 - v640) * v642;
end;
do
    local l_v529_1, l_v643_0 = v529, v643;
    v521.createmove = function(_)
        -- upvalues: v116 (ref), v11 (ref), l_v529_1 (ref)
        if not v116.other.interpolation.value then
            return;
        elseif v11 == nil or not v11:is_alive() then
            return;
        elseif v11:get_anim_state() == nil then
            return;
        else
            local v647 = v11[0];
            local l_tickcount_2 = globals.tickcount;
            local v649 = v11.m_vecVelocity:length2d();
            if v649 < 0.1 then
                v649 = 0;
            end;
            local l_m_flDuckAmount_1 = v11.m_flDuckAmount;
            local v651 = v11.m_bDucking == 1;
            local v652 = bit.band(v11.m_fFlags, 1) == 1;
            local v653 = v11:get_player_weapon();
            local v654 = {
                time = l_tickcount_2, 
                layers = {}, 
                velocity = v649, 
                duck_amount = l_m_flDuckAmount_1, 
                ducking = v651, 
                on_ground = v652, 
                weapon = v653
            };
            for v655, _ in ipairs(l_v529_1.layers) do
                local v657 = ffi.cast("animstate_layer_t**", ffi.cast("uintptr_t", v647) + 10640)[0][v655];
                if v657 ~= nil then
                    v654.layers[v655] = {
                        cycle = v657.m_flCycle, 
                        weight = v657.m_flWeight
                    };
                end;
                table.insert(l_v529_1.server, v654);
                if #l_v529_1.server >= 60 then
                    table.remove(l_v529_1.server, 1);
                end;
            end;
            return;
        end;
    end;
    v521.render_anim = function()
        -- upvalues: v116 (ref), v11 (ref), l_v529_1 (ref), l_v643_0 (ref)
        if not v116.other.interpolation.value then
            return;
        elseif v11 == nil or not v11:is_alive() then
            return;
        elseif v11:get_anim_state() == nil then
            return;
        else
            local v658 = v11[0];
            local l_realtime_0 = globals.realtime;
            local l_server_0 = l_v529_1.server;
            if #l_server_0 < 2 then
                return;
            else
                local v661 = nil;
                local v662 = nil;
                for v663 = #l_server_0 - 1, 1, -1 do
                    local v664 = l_server_0[v663];
                    if v664 ~= nil then
                        if v664.time <= l_realtime_0 and l_realtime_0 <= l_server_0[v663 + 1].time then
                            v661 = v664;
                            v662 = l_server_0[v663 + 1];
                            break;
                        elseif not v661 or not v662 then
                            v661 = l_server_0[#l_server_0 - 1];
                            v662 = v664;
                        end;
                    end;
                end;
                local v665 = (l_realtime_0 - v661.time) / (v662.time - v661.time);
                v665 = math.min(1, math.max(0, v665));
                for v666, _ in ipairs(l_v529_1.layers) do
                    local v668 = ffi.cast("animstate_layer_t**", ffi.cast("uintptr_t", v658) + 10640)[0][v666];
                    if v668 ~= nil and v661.layers[v666] ~= nil and v662.layers[v666] ~= nil then
                        local v669 = {
                            cycle = {
                                [1] = v661.layers[v666].cycle, 
                                [2] = v662.layers[v666].cycle
                            }, 
                            weight = {
                                [1] = v661.layers[v666].weight, 
                                [2] = v662.layers[v666].weight
                            }
                        };
                        if v666 == 1 or v666 == 2 and v661.weapon ~= v662.weapon then
                            v668.m_flCycle = v669.cycle[2];
                            v668.m_flWeight = v669.weight[2];
                        else
                            v668.m_flCycle = l_v643_0(v669.cycle[1], v669.cycle[2], v665);
                            v668.m_flWeight = l_v643_0(v669.weight[1], v669.weight[2], v665);
                        end;
                    end;
                end;
                local _ = l_v643_0(v661.velocity, v662.velocity, v665);
                local v671 = l_v643_0(v661.duck_amount, v662.duck_amount, v665);
                local _ = v661.ducking;
                local _ = v661.on_ground;
                local l_weapon_0 = v661.weapon;
                l_v529_1.velocity = velocity;
                l_v529_1.duck_amount = v671;
                l_v529_1.weapon = l_weapon_0;
                return;
            end;
        end;
    end;
end;
v529 = {};
v643 = function(v675)
    -- upvalues: v529 (ref)
    table.insert(v529, {
        alpha = 0, 
        message = v675, 
        creation_time = globals.realtime
    });
end;
local v676 = render.load_font("Verdana Bold", 11, "ad");
local function v685()
    -- upvalues: v116 (ref), v529 (ref), v676 (ref)
    if not v116.other.logstype:get(1) then
        return;
    else
        local l_realtime_1 = globals.realtime;
        local v678 = 0;
        local v679 = 0;
        for v680 = 1, #v529 do
            if v529[v680] ~= nil then
                if l_realtime_1 < v529[v680].creation_time or v529[v680].alpha <= 0 and l_realtime_1 - v529[v680].creation_time > 2 then
                    table.remove(v529, v680);
                else
                    if v680 >= 55 then
                        v529[v680].creation_time = l_realtime_1;
                    end;
                    if v529[v680].alpha < 255 and l_realtime_1 - v529[v680].creation_time < 5 and v680 < 55 then
                        v529[v680].alpha = v529[v680].alpha + 5;
                    end;
                    if l_realtime_1 - v529[v680].creation_time > 5 and v529[v680].alpha > 0 then
                        v529[v680].alpha = v529[v680].alpha - 5;
                    end;
                    if v529[v680].alpha > 0 then
                        local v681, v682, v683 = v116.other.boldlogclr.value:unpack();
                        local v684 = v529[v680].alpha / 255;
                        render.text(v676, vector(5, v679 + v678), color(v681, v682, v683, v529[v680].alpha), "s", v529[v680].message);
                        v679 = v679 + v678;
                        v678 = 15 * v684;
                    end;
                end;
            end;
        end;
        return;
    end;
end;
local v686 = {
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
local v687 = {};
v687.logs = {
    notify_data = {}, 
    notifications = function()
        -- upvalues: v687 (ref), v20 (ref), l_x_0 (ref), l_y_0 (ref)
        for v688, v689 in ipairs(v687.logs.notify_data) do
            if v689.time + 1 > globals.realtime and v688 <= 5 then
                v689.alpha = v20.lerp(v689.alpha, 255, 0.05);
                v689.alpha_text = v20.lerp(v689.alpha_text, 255, 0.05);
                v689.add_x = v20.lerp(v689.add_x, 1, 0.05);
            end;
            local l_color_0 = v689.color;
            local v691 = "\a" .. l_color_0:to_hex() .. "\239\162\144 \aDEFAULT" .. tostring(v689.text);
            local v692 = render.measure_text(1, "", tostring(v691)).x / 2;
            if v689.alpha <= 0 then
                v689[v688] = nil;
            else
                v689.add_y = v20.lerp(v689.add_y, v688 * 40, 0.05);
                render.shadow(vector(l_x_0 / 2 - v692 - 12, l_y_0 - 80 - v689.add_y - 6), vector(l_x_0 / 2 + v692 + 12, l_y_0 - 80 - v689.add_y + 20), color(l_color_0.r, l_color_0.g, l_color_0.b, v689.alpha - 60), 50, 0, 5);
                render.rect(vector(l_x_0 / 2 - v692 - 12, l_y_0 - 80 - v689.add_y - 6), vector(l_x_0 / 2 + v692 + 12, l_y_0 - 80 - v689.add_y + 20), color(15, 15, 15, v689.alpha), 5);
                local _ = v692 + 40;
                render.text(1, vector(l_x_0 / 2 - v692, l_y_0 - 80 - v689.add_y), color(255, 255, 255, v689.alpha_text), nil, v691);
                if v689.time + 3 < globals.realtime or v688 > 5 then
                    v689.alpha = v20.lerp(v689.alpha, 0, 0.05);
                    v689.alpha_text = v20.lerp(v689.alpha_text, 0, 0.05);
                    v689.add_x = v20.lerp(v689.add_x, 0, 0.05);
                    v689.add_y = v20.lerp(v689.add_y, v688 * 60, 0.05);
                end;
            end;
            if v689.alpha < 1 then
                table.remove(v687.logs.notify_data, v688);
            end;
        end;
    end, 
    aimbob = function(v694)
        -- upvalues: v116 (ref), v687 (ref), v686 (ref)
        if v116.other.logstype:get(3) then
            if v694.state then
                table.insert(v687.logs.notify_data, 1, {
                    add_y = 0, 
                    alpha = 0, 
                    add_x = 0, 
                    alpha_text = 0, 
                    text = string.format("\v Missed shot at \a" .. v116.other.notifyscolor:get("Miss Color")[1]:to_hex() .. "%s \aDEFAULTdue to %s in the %s", v694.target:get_name(), v694.state, v686[v694.wanted_hitgroup]), 
                    time = globals.realtime, 
                    color = v116.other.notifyscolor:get("Miss Color")[1]
                });
            else
                table.insert(v687.logs.notify_data, 1, {
                    add_y = 0, 
                    alpha = 0, 
                    add_x = 0, 
                    alpha_text = 0, 
                    text = string.format("\v Hit \a" .. v116.other.notifyscolor:get("Hit Color")[1]:to_hex() .. "%s \aDEFAULTin the %s for %s damage", v694.target:get_name(), v686[v694.hitgroup], v694.damage), 
                    time = globals.realtime, 
                    color = v116.other.notifyscolor:get("Hit Color")[1]
                });
            end;
        else
            v687.logs.notify_data = {};
        end;
    end
};
v116.other.push_notify:set_callback(function()
    -- upvalues: v687 (ref), v116 (ref), v12 (ref)
    table.insert(v687.logs.notify_data, 1, {
        add_y = 0, 
        alpha = 0, 
        add_x = 0, 
        alpha_text = 0, 
        text = string.format("\v Hit \a" .. v116.other.notifyscolor:get("Hit Color")[1]:to_hex() .. "%s \aDEFAULTin the head for 192 damage (0 health remaining)", v12), 
        time = globals.realtime, 
        color = v116.other.notifyscolor:get("Hit Color")[1]
    });
    table.insert(v687.logs.notify_data, 1, {
        add_y = 0, 
        alpha = 0, 
        add_x = 0, 
        alpha_text = 0, 
        text = string.format("\v Missed shot at \a" .. v116.other.notifyscolor:get("Miss Color")[1]:to_hex() .. "%s \aDEFAULTdue to correction in the head for 192 damage", v12), 
        time = globals.realtime, 
        color = v116.other.notifyscolor:get("Miss Color")[1]
    });
end);
events.aim_ack:set(function(v695)
    -- upvalues: v282 (ref), v687 (ref), v686 (ref), v116 (ref), v643 (ref)
    v282(v695);
    v687.logs.aimbob(v695);
    local v696 = v686[v695.wanted_hitgroup];
    local l_m_iHealth_1 = v695.target.m_iHealth;
    local v698 = math.floor(to_time(v695.backtrack) * 1000);
    if v116.other.logstype:get(2) then
        if v695.state then
            print_raw("\a" .. v116.other.logscolor:get("Prefix")[1]:to_hex() .. "[essence] ~ \aFFFFFFF " .. "missed \a" .. v116.other.logscolor:get("Username")[1]:to_hex() .. v695.target:get_name() .. "\aFFFFFFF  in \aFFFFFFF " .. v696 .. "(" .. v695.wanted_damage .. ") due to \a" .. v116.other.logscolor:get("Miss Reason")[1]:to_hex() .. v695.state .. "\aFFFFFFF  (hitchance: \aFFFFFFF " .. v695.hitchance .. "% ", "\aFFFFFFF | history: " .. v695.backtrack .. "t\a" .. v116.other.logscolor:get("Prefix")[1]:to_hex() .. " (" .. v698 .. "ms)\aFFFFFFFF)");
        elseif v695.damage == v695.wanted_damage then
            print_raw("\a" .. v116.other.logscolor:get("Prefix")[1]:to_hex() .. "[essence] ~ \aFFFFFFF " .. "hit \a" .. v116.other.logscolor:get("Username")[1]:to_hex() .. v695.target:get_name() .. "\aFFFFFFF  in \aFFFFFFF " .. v686[v695.hitgroup] .. " for \a" .. v116.other.logscolor:get("Damage")[1]:to_hex() .. v695.damage .. "\aFFFFFFF  (hitchance: \aFFFFFFF " .. v695.hitchance .. "% ", "\aFFFFFFF | history: " .. v695.backtrack .. "t\a" .. v116.other.logscolor:get("Prefix")[1]:to_hex() .. " (" .. v698 .. "ms) \aFFFFFFFF| health remaining: " .. l_m_iHealth_1 .. "hp)");
        elseif v695.hitgroup == v695.wanted_hitgroup then
            print_raw("\a" .. v116.other.logscolor:get("Prefix")[1]:to_hex() .. "[essence] ~ \aFFFFFFF " .. "hit \a" .. v116.other.logscolor:get("Username")[1]:to_hex() .. v695.target:get_name() .. "\aFFFFFFF  in \aFFFFFFF " .. v686[v695.hitgroup] .. " for \a" .. v116.other.logscolor:get("Damage")[1]:to_hex() .. v695.damage .. "(" .. v695.wanted_damage .. ")" .. "\aFFFFFFF  (hitchance: \aFFFFFFF " .. v695.hitchance .. "% ", "\aFFFFFFF | history: " .. v695.backtrack .. "t\a" .. v116.other.logscolor:get("Prefix")[1]:to_hex() .. " (" .. v698 .. "ms) \aFFFFFFFF| health remaining: " .. l_m_iHealth_1 .. "hp)");
        elseif v695.hitgroup ~= v695.wanted_hitgroup then
            print_raw("\a" .. v116.other.logscolor:get("Prefix")[1]:to_hex() .. "[essence] ~ \aFFFFFFF " .. "hit \a" .. v116.other.logscolor:get("Username")[1]:to_hex() .. v695.target:get_name() .. "\aFFFFFFF  in \aFFFFFFF " .. v686[v695.hitgroup] .. "(\aFFFFFFF " .. v696 .. ")" .. " for \a" .. v116.other.logscolor:get("Damage")[1]:to_hex() .. v695.damage .. "(" .. v695.wanted_damage .. ")" .. "\aFFFFFFF  (hitchance: \aFFFFFFF " .. v695.hitchance .. "% ", "\aFFFFFFF | history: " .. v695.backtrack .. "t\a" .. v116.other.logscolor:get("Prefix")[1]:to_hex() .. " (" .. v698 .. "ms) \aFFFFFFFF| health remaining: " .. l_m_iHealth_1 .. "hp)");
        end;
    end;
    if v116.other.logstype:get(1) and v116.other.eventbold.value then
        if v695.state then
            v643("missed " .. v695.target:get_name() .. " in " .. v696 .. " due to " .. v695.state);
        elseif v695.damage == v695.wanted_damage then
            v643("hit " .. v695.target:get_name() .. " in " .. v686[v695.hitgroup] .. " for " .. v695.damage .. " (hc: " .. v695.hitchance .. "% | " .. "history: " .. v695.backtrack .. "t)");
        elseif v695.hitgroup == v695.wanted_hitgroup then
            v643("hit " .. v695.target:get_name() .. " in " .. v686[v695.hitgroup] .. " for " .. v695.damage .. "(" .. v695.wanted_damage .. ")" .. " (hc: " .. v695.hitchance .. "% | " .. "history: " .. v695.backtrack .. "t)");
        elseif v695.hitgroup ~= v695.wanted_hitgroup then
            v643("hit " .. v695.target:get_name() .. " in " .. v686[v695.hitgroup] .. "(" .. v696 .. ")" .. " for " .. v695.damage .. "(" .. v695.wanted_damage .. ")" .. " (hc: " .. v695.hitchance .. "% | " .. "history: " .. v695.backtrack .. "t)");
        end;
    end;
    if v116.other.logstype:get(1) and not v116.other.eventbold.value then
        if v695.state then
            print_dev("\amissed \a" .. v116.other.logscolor:get("Username")[1]:to_hex() .. v695.target:get_name() .. "\a in \aFFFFFFF " .. v696 .. " due to \a" .. v116.other.logscolor:get("Miss Reason")[1]:to_hex() .. v695.state);
        elseif v695.damage == v695.wanted_damage then
            print_dev("\ahit \a" .. v116.other.logscolor:get("Username")[1]:to_hex() .. v695.target:get_name() .. "\a in \aFFFFFFF " .. v686[v695.hitgroup] .. " \aDEFAULTfor \a" .. v116.other.logscolor:get("Damage")[1]:to_hex() .. v695.damage .. " \aFFFFFFF (hitchance: \aFFFFFFF " .. v695.hitchance .. "%" .. "\r| history: " .. v695.backtrack .. "t", " | health remaining: " .. l_m_iHealth_1 .. ")");
        elseif v695.hitgroup == v695.wanted_hitgroup then
            print_dev("\ahit \a" .. v116.other.logscolor:get("Username")[1]:to_hex() .. v695.target:get_name() .. "\a in \aFFFFFFF " .. v686[v695.hitgroup] .. " \aDEFAULTfor \a" .. v116.other.logscolor:get("Damage")[1]:to_hex() .. v695.damage .. "(" .. v695.wanted_damage .. ")" .. " \aFFFFFFF (hitchance: \aFFFFFFF " .. v695.hitchance .. "%" .. "\r| history: " .. v695.backtrack .. "t", " | health remaining: " .. l_m_iHealth_1 .. ")");
        elseif v695.hitgroup ~= v695.wanted_hitgroup then
            print_dev("\ahit \a" .. v116.other.logscolor:get("Username")[1]:to_hex() .. v695.target:get_name() .. "\a in \aFFFFFFF " .. v686[v695.hitgroup] .. "(\aFFFFFFF " .. v696 .. ")" .. " \aDEFAULTfor \a" .. v116.other.logscolor:get("Damage")[1]:to_hex() .. v695.damage .. "(" .. v695.wanted_damage .. ")" .. " \aFFFFFFF (hitchance: " .. v695.hitchance .. "%" .. " | history: " .. v695.backtrack .. "t", " | health remaining: " .. l_m_iHealth_1 .. ")");
        end;
    end;
end);
events.player_hurt:set(function(v699)
    -- upvalues: v116 (ref), v11 (ref), v643 (ref)
    local v700 = entity.get(v699.attacker, true);
    local v701 = entity.get(v699.userid, true);
    local v702 = v116.other.logstype:get(1);
    local v703 = v116.other.logstype:get(2);
    if v11 == v700 then
        if v699.weapon == "knife" then
            if v702 and not v116.other.eventbold.value then
                print_dev("\aKnifed \a" .. v116.other.logscolor:get("Username")[1]:to_hex() .. v701:get_name() .. " \aFFFFFFF for \a" .. v116.other.logscolor:get("Damage")[1]:to_hex() .. v699.dmg_health .. "\a damage");
            end;
            if v702 and v116.other.eventbold.value then
                v643("Knifed " .. v701:get_name() .. "  for " .. v699.dmg_health .. " damage");
            end;
            if v703 then
                print_raw("\a" .. v116.other.logscolor:get("Prefix")[1]:to_hex() .. "[essence] ~ \aFFFFFFF " .. "Knifed \a" .. v116.other.logscolor:get("Username")[1]:to_hex() .. v701:get_name() .. " \aFFFFFFF for \a" .. v116.other.logscolor:get("Damage")[1]:to_hex() .. v699.dmg_health .. " damage");
            end;
        elseif v699.weapon == "hegrenade" then
            if v702 and not v116.other.eventbold.value then
                print_dev("\aNaded \a" .. v116.other.logscolor:get("Username")[1]:to_hex() .. v701:get_name() .. " \aFFFFFFF for \a" .. v116.other.logscolor:get("Damage")[1]:to_hex() .. v699.dmg_health .. "\a damage");
            end;
            if v702 and v116.other.eventbold.value then
                v643("Naded " .. v701:get_name() .. "  for " .. v699.dmg_health .. " damage");
            end;
            if v703 then
                print_raw("\a" .. v116.other.logscolor:get("Prefix")[1]:to_hex() .. "[essence] ~ \aFFFFFFF " .. "Naded \a" .. v116.other.logscolor:get("Username")[1]:to_hex() .. v701:get_name() .. " \aFFFFFFF for \a" .. v116.other.logscolor:get("Damage")[1]:to_hex() .. v699.dmg_health .. " damage");
            end;
        elseif v699.weapon == "inferno" then
            if v702 and not v116.other.eventbold.value then
                print_dev("\aBurn \a" .. v116.other.logscolor:get("Username")[1]:to_hex() .. v701:get_name() .. " \aFFFFFFF for \a" .. v116.other.logscolor:get("Damage")[1]:to_hex() .. v699.dmg_health .. "\a damage");
            end;
            if v702 and v116.other.eventbold.value then
                v643("Burn " .. v701:get_name() .. "  for " .. v699.dmg_health .. " damage");
            end;
            if v703 then
                print_raw("\a" .. v116.other.logscolor:get("Prefix")[1]:to_hex() .. "[essence] ~ \aFFFFFFF " .. "Burn \a" .. v116.other.logscolor:get("Username")[1]:to_hex() .. v701:get_name() .. " \aFFFFFFF for \a" .. v116.other.logscolor:get("Damage")[1]:to_hex() .. v699.dmg_health .. " damage");
            end;
        end;
    end;
end);
events.item_purchase:set(function(v704)
    -- upvalues: v116 (ref), v643 (ref)
    local v705 = entity.get(v704.userid, true);
    if v116.other.plogs.value then
        print_raw("\a" .. v116.other.logscolor:get("Prefix")[1]:to_hex() .. "[essence] ~ \a" .. v116.other.plogsclr:get("Username")[1]:to_hex() .. v705:get_name() .. "\a Bought \a" .. v116.other.plogsclr:get("Weapon")[1]:to_hex() .. v704.weapon);
        if v116.other.eventbold.value then
            v643(v705:get_name() .. " Bought " .. v704.weapon);
        else
            print_dev(v705:get_name() .. " Bought " .. v704.weapon);
        end;
    end;
end);
events.post_update_clientside_animation:set(function()
    -- upvalues: v514 (ref), v521 (ref)
    v514();
    v521.render_anim();
end);
events.localplayer_transparency:set(v499);
events.createmove:set(function(v706)
    -- upvalues: v122 (ref), v398 (ref), v292 (ref), v401 (ref), v402 (ref), v179 (ref), v182 (ref), v199 (ref), v509 (ref), v405 (ref), l_pui_0 (ref), v259 (ref), v200 (ref), v227 (ref), v273 (ref), v387 (ref), v521 (ref), v116 (ref)
    v122();
    v398(v706);
    v292(v706);
    v401();
    v402(v706);
    v179(v706);
    v182();
    v199(v706);
    v509(v706);
    v405(v706);
    if l_pui_0.alpha > 0.5 and (v259 or v200 or v227 or v273 or v387) then
        v706.in_attack = false;
    end;
    v521.createmove(v706);
    if v116.other.menubodylean.value > 0 then
        v706.animate_move_lean = true;
    else
        v706.animate_move_lean = false;
    end;
end);
events.render:set(function()
    -- upvalues: v11 (ref), l_x_0 (ref), l_y_0 (ref), v140 (ref), v685 (ref), v136 (ref), v687 (ref), v111 (ref), v356 (ref), v225 (ref), v500 (ref), v386 (ref), v277 (ref), v267 (ref), v215 (ref), v245 (ref), v498 (ref), v335 (ref), v254 (ref), v395 (ref)
    v11 = entity.get_local_player();
    local l_x_3 = render.screen_size().x;
    l_y_0 = render.screen_size().y;
    l_x_0 = l_x_3;
    v140();
    v685();
    v136();
    v687.logs.notifications();
    v111();
    if v11 then
        v356();
        v225();
        v500();
        v386();
        v277();
        v267();
        v215();
        v245();
        if v11:is_alive() then
            v498();
            v335();
            v254();
            v395();
        end;
    end;
end);
events.shutdown:set(function()
    cvar.r_aspectratio:float(0);
    cvar.cl_righthand:int(1);
end);