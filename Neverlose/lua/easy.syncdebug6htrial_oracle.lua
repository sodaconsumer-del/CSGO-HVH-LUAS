local v0 = "trial ~ public";
hexx = ui.get_style("Link Active"):to_hex();
local v1 = {};
last_update_ez = "05.08.2024";
local v2 = "\a" .. hexx .. ui.get_icon("house-chimney-crack") .. "\aDEFAULT" .. " Home";
local v3 = "\a" .. hexx .. ui.get_icon("cloud-moon-rain") .. "\aDEFAULT" .. " Misc";
local function v7()
    local v4 = common.get_active_scripts();
    local v5 = 0;
    for _ in pairs(v4) do
        v5 = v5 + 1;
    end;
    return v5;
end;
local v8 = v7();
local v9 = v7();
utils.execute_after(0.5, function()
    -- upvalues: v9 (ref), v7 (ref), v8 (ref)
    v9 = v7();
    if v8 ~= v9 then
        common.reload_script();
    end;
end);
local function v15(v10, v11)
    if not v11 then
        v11 = "%s";
    end;
    local v12 = {};
    for v13, v14 in string.gmatch(v10, "([^" .. v11 .. "]*)(" .. v11 .. "?)") do
        table.insert(v12, v13);
        if v14 == "" then
            return v12;
        end;
    end;
end;
local function v20(v16, v17, v18)
    local v19 = math.floor(math.abs(v16 - v17) * globals.frametime * 20 * v18);
    v18 = math.clamp(v19, 1, v19);
    if v16 == nil or v17 == nil or v18 == nil then
        return 0;
    elseif v16 == v17 then
        return v16;
    elseif v17 < v16 and v16 - v18 <= v17 or v16 < v17 and v17 <= v16 + v18 then
        return v17;
    else
        if v17 < v16 then
            v16 = v16 - v18;
        end;
        if v16 < v17 then
            v16 = v16 + v18;
        end;
        return v16;
    end;
end;
variables = {
    locked_ticks = 0
};
local function v23(v21)
    local v22 = v21:get_override();
    return v22 == nil and v21:get() or v22;
end;
ffi.cdef("    typedef uintptr_t (__thiscall* GetClientEntity_4242425_t)(void*, int);\n\ttypedef int(__fastcall* clantag_t)(const char*, const char*);\n\n    void* __stdcall ShellExecuteA(void* hwnd, const char* op, const char* file, const char* params, const char* dir, int show_cmd);\n\n    typedef struct {\n        unsigned short wYear;\n        unsigned short wMonth;\n        unsigned short wDayOfWeek;\n        unsigned short wDay;\n        unsigned short wHour;\n        unsigned short wMinute;\n        unsigned short wMilliseconds;\n    } SYSTEMTIME, *LPSYSTEMTIME;\n\n    void GetSystemTime(LPSYSTEMTIME lpSystemTime);\n    void GetLocalTime(LPSYSTEMTIME lpSystemTime);\n\n    bool CreateDirectoryA(const char* lpPathName, void* lpSecurityAttributes);\n    void* __stdcall URLDownloadToFileA(void* LPUNKNOWN, const char* LPCSTR, const char* LPCSTR2, int a, int LPBINDSTATUSCALLBACK);\n    void* __stdcall ShellExecuteA(void* hwnd, const char* op, const char* file, const char* params, const char* dir, int show_cmd);\n\n    bool DeleteUrlCacheEntryA(const char* lpszUrlName);\n");
local v24 = {
    js = panorama.loadstring("    return {\n        OpenExternalBrowserURL: function(url){\n            void SteamOverlayAPI.OpenExternalBrowserURL(url)\n        }\n    }\n")(), 
    wininet = ffi.load("WinInet"), 
    urlmon = ffi.load("UrlMon")
};
local function v27(v25, v26)
    -- upvalues: v24 (ref)
    v24.wininet.DeleteUrlCacheEntryA(v25);
    v24.urlmon.URLDownloadToFileA(nil, v25, v26, 0, 0);
end;
files.create_folder("nl\\easysyncdebug");
v27("https://cdn.discordapp.com/attachments/1211809149554262068/1211809247839387648/Kabel_Ultra_BT.ttf?ex=663cac0f&is=663b5a8f&hm=15f451da2bd91c2beb4a471bb86c82dc0eeec8be0415576b319c1ac08b8348b8&", "nl\\easysyncdebug\\Kabel_Ultra_BT.ttf");
v27("https://cdn.discordapp.com/attachments/1211809149554262068/1211809248208494652/pixel.ttf?ex=663cac0f&is=663b5a8f&hm=2659f949bd0e735ed8c7e8ea2b7804df4f13f6abdb01956130d6e67bdc0a7cdc&", "nl\\easysyncdebug\\pixel.ttf");
v27("https://cdn.discordapp.com/attachments/1211809149554262068/1211809247478681730/seguisb.ttf?ex=663cac0e&is=663b5a8e&hm=a4ce05d6ca2d607951d0ffc4c08030af0e4c7987ce600cbe464eea1f287c1db5&", "nl\\easysyncdebug\\seguisb.ttf");
local v28 = {
    aa_enabled = ui.find("Aimbot", "Anti Aim", "Angles", "Enabled"), 
    aa_pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"), 
    aa_yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"), 
    aa_yaw_base = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"), 
    aa_yaw_offset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"), 
    aa_yaw_avoidbackstab = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab"), 
    aa_yaw_hidden = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden"), 
    aa_yawmodifier = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"), 
    aa_yawmodifier_offset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"), 
    aa_bodyyaw = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"), 
    aa_bodyyaw_inverter = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"), 
    aa_bodyyaw_leftlimit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"), 
    aa_bodyyaw_rightlimit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"), 
    aa_bodyyaw_options = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"), 
    aa_bodyyaw_freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding"), 
    aa_freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"), 
    aa_freestanding_disableyawmodifier = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Disable Yaw Modifiers"), 
    aa_freestanding_bodyfreestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Body Freestanding"), 
    aa_extendedangles = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles"), 
    aa_extendedangles_extendedpitch = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles", "Extended Pitch"), 
    aa_extendedangles_extendedroll = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles", "Extended Roll"), 
    aa_slow_walk = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"), 
    rage_peek_assist = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist"), 
    rage_doubletap = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"), 
    rage_doubletap_lagoptions = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"), 
    rage_doubletap_fakelaglimit = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Fake Lag Limit"), 
    rage_hideshots = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"), 
    rage_hideshots_options = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options"), 
    air_strafe = ui.find("Miscellaneous", "Main", "Movement", "Air Strafe"), 
    leg_movement = ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"), 
    hc_scout = ui.find("Aimbot", "Ragebot", "Selection", "SSG-08", "Hit Chance"), 
    mndmg_scout = ui.find("Aimbot", "Ragebot", "Selection", "SSG-08", "Min. Damage"), 
    hc_awp = ui.find("Aimbot", "Ragebot", "Selection", "AWP", "Hit Chance"), 
    mndmg_awp = ui.find("Aimbot", "Ragebot", "Selection", "AWP", "Min. Damage"), 
    hc_autosnipers = ui.find("Aimbot", "Ragebot", "Selection", "AutoSnipers", "Hit Chance"), 
    mndmg_autosnipers = ui.find("Aimbot", "Ragebot", "Selection", "AutoSnipers", "Min. Damage"), 
    thirdperson = ui.find("Visuals", "World", "Main", "Force Thirdperson"), 
    thirdperson_distance = ui.find("Visuals", "World", "Main", "Force Thirdperson", "Distance"), 
    yaw_modifiers = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier")
};
local l_lower_0 = string.lower;
local l_gsub_0 = string.gsub;
local v31 = {
    get_defensive = require("neverlose/get_defensive"), 
    gradient = require("neverlose/gradient"), 
    discord_webhooks = require("neverlose/discord_webhooks")
};
local v32 = "https://i.imgur.com/wMqVXcU.png";
local v33 = vector(260, 260);
local v34 = render.load_image(network.get(v32));
local v35 = ui.get_style("Link Active");
local v36 = {
    v35, 
    v35, 
    color(30, 30, 30)
};
local v37 = v31.gradient.text_animate("e\226\128\139\226\128\139asy.sync" .. " ~ debug", 1, v36);
events.render:set(function(_)
    -- upvalues: v37 (ref)
    v37:animate();
    local v39 = v37:get_animated_text();
    ui.sidebar(v39, "tornado");
end);
local v40 = nil;
(function()
    -- upvalues: v8 (ref), v40 (ref)
    if v8 == 1 or v8 == 2 then
        v40 = "\a00FF00FF low";
    elseif v8 == 3 or v8 == 4 or v8 == 5 then
        v40 = "\aFFFF00FF mid";
    elseif v8 >= 6 then
        v40 = "\aFF0000FF high!";
    end;
    return v40;
end)();
local v41 = {};
local v42 = {};
local v43 = {};
local v44 = {
    [1] = "Terrorist", 
    [2] = "Counter Terrorist"
};
local v45 = {
    [1] = "Global", 
    [2] = "Standing", 
    [3] = "Slow Walk", 
    [4] = "Moving", 
    [5] = "Air", 
    [6] = "Crouch Stand", 
    [7] = "Crouch Move", 
    [8] = "Crouch Air", 
    [9] = "Fake Lag", 
    [10] = "Fake Duck"
};
local v46 = "\a" .. hexx .. ui.get_icon("sliders-up") .. "\aDEFAULT" .. " Builder";
v1.home_welcome = ui.create(v2, "\a" .. hexx .. ui.get_icon("hand-wave") .. "\aDEFAULT" .. " Welcome", 1);
v1.home_configs_sel = ui.create(v2, "\a" .. hexx .. ui.get_icon("hard-drive") .. "\aDEFAULT" .. " selection", 2);
v1.home_configs = ui.create(v2, "\a" .. hexx .. ui.get_icon("hard-drive") .. "\aDEFAULT" .. " Configs ", 2);
v1.home_configs1 = ui.create(v2, "\a" .. hexx .. ui.get_icon("hard-drive") .. "\aDEFAULT" .. " Configs", 2);
v1.selection = ui.create(v3, "\a" .. hexx .. ui.get_icon("object-ungroup") .. "\aDEFAULT" .. " Selection", 1);
v1.additional = ui.create(v2, "\a" .. hexx .. ui.get_icon("binoculars") .. "\aDEFAULT" .. " Additional", 2);
v1.experience = ui.create(v2, "\a" .. hexx .. ui.get_icon("waveform") .. "\aDEFAULT" .. " User Preferences", nil);
v1.home_social = ui.create(v2, "\a" .. hexx .. ui.get_icon("share-nodes") .. "\aDEFAULT" .. " Social media", 2);
local v47 = ui.create(v3, "\a" .. hexx .. ui.get_icon("cloud") .. "\aDEFAULT" .. " Misc", nil):visibility(false);
local v48 = ui.create(v3, "\a" .. hexx .. ui.get_icon("brush") .. "\aDEFAULT" .. " Misc Visual", nil):visibility(false);
local v49 = ui.create(v3, "\a" .. hexx .. ui.get_icon("robot") .. "\aDEFAULT" .. " Auto helpers", nil):visibility(false);
v1.auto_nades = ui.create(v3, "\a" .. hexx .. ui.get_icon("robot") .. "\aDEFAULT" .. " Grenade", nil):visibility(false);
v1.antiaim_general = ui.create(v3, "\a" .. hexx .. ui.get_icon("table-list") .. "\aDEFAULT" .. " AA", nil):visibility(false);
v1.builder_builder = ui.create(v46, "\a" .. hexx .. ui.get_icon("trowel-bricks") .. "\aDEFAULT" .. " Builder", 1);
v1.builder_angles = ui.create(v46, "\a" .. hexx .. ui.get_icon("angle") .. "\aDEFAULT" .. " Angles", 1);
v1.builder_defensive = ui.create(v46, "\a" .. hexx .. ui.get_icon("shield-quartered") .. "\aDEFAULT" .. " Defensive", 2);
v1.builder_hittable = ui.create(v46, "\a" .. hexx .. ui.get_icon("cloud-bolt-moon") .. "\aDEFAULT" .. " Hittable Tweaks", 2);
v1.builder_bodylean = ui.create(v46, "\a" .. hexx .. ui.get_icon("left-right") .. "\aDEFAULT" .. " Body Lean", 2);
v1.misc_settings = ui.create("Misc", "\a" .. hexx .. ui.get_icon("share-nodes") .. "\aDEFAULT" .. " Settings", 1);
v1.misc_visuals = ui.create("Misc", "\a" .. hexx .. ui.get_icon("share-nodes") .. "\aDEFAULT" .. " Visuals", 2);
local v50 = 21000;
local function v56(v51)
    if not v51 then
        return "00 : 00 : 00 : 00";
    else
        local v52 = v51 % 60;
        local v53 = math.floor(v51 / 60);
        local v54 = math.floor(v53 / 60);
        local v55 = math.floor(v54 / 24);
        v54 = v54 % 24;
        v53 = v53 % 60;
        return string.format("%02d : %02d : %02d : %02d", v55, v54, v53, v52);
    end;
end;
local v57 = tonumber(db.trial_nlnlnl312131V7) or v50;
local v58 = 0;
local l_v57_0 = v57;
local function v60()
    -- upvalues: l_v57_0 (ref)
    db.trial_nlnlnl312131V7 = l_v57_0;
end;
events.shutdown(v60);
events.render:set(function()
    -- upvalues: v58 (ref), l_v57_0 (ref)
    local v61 = math.floor(globals.realtime);
    if v61 ~= v58 then
        v58 = v61;
        l_v57_0 = l_v57_0 - 1;
        if l_v57_0 <= 0 then
            common.unload_script();
            error("Trial Expired. Hope you had some fun! ^^");
        end;
    end;
end);
v1.additional:label("\a" .. hexx .. ui.get_icon("calendar-clock") .. "\aDEFAULT" .. "    Last Update: " .. "\a" .. hexx .. last_update_ez):tooltip("The exact date when the update was requested, which can differ from the market approval date.");
v1.additional:label("\a" .. hexx .. ui.get_icon("crown") .. "\aDEFAULT" .. "    Author: " .. "\a" .. hexx .. "god.eater");
v1.additional:label("\a" .. hexx .. ui.get_icon("chart-radar") .. "\aDEFAULT" .. "     Active Scripts: " .. "\a" .. hexx .. v8);
v1.additional:label("\a" .. hexx .. ui.get_icon("chart-scatter-3d") .. "\aDEFAULT" .. "     Possible PA: " .. "\a" .. hexx .. v40):tooltip("\aDEFAULTPossible Performance Affection." .. "\a" .. hexx .. "Depends on loaded scripts.");
v42.gradient_text_easy_home = v31.gradient.text("e\226\128\139\226\128\139asy.sync ~ debug", false, v36);
v42.gradient_text_easy_home = v31.gradient.text("e\226\128\139\226\128\139asy.sync ~ debug", false, v36);
v1.home_welcome:label("\a" .. hexx .. "      " .. ui.get_icon("eye-low-vision") .. "\aDEFAULT Welcome to " .. v42.gradient_text_easy_home .. "\a" .. hexx .. " " .. ui.get_icon("eye-low-vision"));
v1.home_welcome:texture(v34, v33);
v1.home_welcome:label("\a" .. hexx .. ui.get_icon("address-card") .. "\aDEFAULT" .. "   User: " .. "\a" .. hexx .. common.get_username());
v1.home_welcome:label("\a" .. hexx .. ui.get_icon("tarp") .. "\aDEFAULT" .. "   Config: " .. "\a" .. hexx .. common.get_config_name());
v1.home_welcome:label("\a" .. hexx .. ui.get_icon("user-group-crown") .. "\aDEFAULT" .. "   Build: " .. "\a" .. hexx .. v0);
v1.home_welcome:label("\a" .. hexx .. ui.get_icon("sparkles") .. "\aDEFAULT" .. "    Special thanks to: " .. "\a" .. hexx .. " dev testers");
local v62 = v1.home_social:button("\a" .. hexx .. ui.get_icon("barcode-read") .. "\aDEFAULT" .. "                          Role Request                      " .. "\a" .. hexx .. ui.get_icon("barcode-read"), nil, true);
v1.home_welcome:label("\a" .. hexx .. ui.get_icon("clock") .. "\aDEFAULT" .. "    Trial time left: ");
local v63 = v1.home_welcome:button("\a" .. hexx .. v56(l_v57_0), nil, true):tooltip("\a" .. hexx .. "Please click this button to view the remaining time on your trial period.");
local v64 = v1.home_welcome:button("\a" .. hexx .. "\226\128\139\240\157\151\153\240\157\151\148\240\157\151\164\226\128\139", nil, true):set_callback(function()
    -- upvalues: v24 (ref)
    v24.js.OpenExternalBrowserURL("https://pastebin.com/raw/jaVWyeNU");
end);
v64:tooltip("\a" .. hexx .. "CLICK ME!\n");
local v65 = v1.experience:selectable("", "\a" .. hexx .. ui.get_icon("ear-listen") .. "\aFFFF00FF Taptic Feedback", "\a" .. hexx .. ui.get_icon("palette") .. "\a0090FFFF Dynamic Theme Matching");
v65:tooltip("\a" .. hexx .. ui.get_icon("ear-listen") .. "\aFFFF00FF Taptic Feedback" .. "\aDEFAULT                                 This feature will enable short and smooth audio feedback for interactions with the UI in Lua" .. "                           " .. "\a" .. hexx .. ui.get_icon("palette") .. "\a0090FFFF Dynamic Theme Matching                                  This feature will dynamically align your Lua theme with the Neverlose theme.");
local function v66()
    -- upvalues: v65 (ref)
    if v65:get(1) then
        utils.console_exec("play ui\\buttonrollover.wav");
    end;
end;
events.render:set(function()
    -- upvalues: v65 (ref)
    local v67 = ui.get_style("Link Active"):to_hex();
    if v65:get(2) then
        if hexx ~= v67 then
            hexx = v67;
            common.reload_script();
        else
            return;
        end;
    end;
end);
v63:set_callback(function()
    common.reload_script();
end);
local _ = v1.home_social:button("               " .. "\a" .. hexx .. ui.get_icon("discord") .. "                ", nil, true):set_callback(function()
    -- upvalues: v24 (ref)
    v24.js.OpenExternalBrowserURL("https://discord.com/invite/easyscripts");
end);
local _ = v1.home_social:button("              " .. "\a" .. hexx .. ui.get_icon("youtube") .. "                  ", nil, true):set_callback(function()
    -- upvalues: v24 (ref)
    v24.js.OpenExternalBrowserURL("https://www.youtube.com/channel/UCw1bnYyykYn8XIR8M-AbCxg");
end);
local v70 = {
    AA_pref = " \226\128\162 ", 
    a_pref = " \226\128\162 ", 
    r_pref = " \226\128\162 ", 
    m_pref = " \226\128\162 "
};
local v71 = {
    v35, 
    v35, 
    color(240, 240, 240)
};
local v72 = v31.gradient.text(" \194\187 Misc", false, v71);
events.render:set(function(_)
    -- upvalues: v72 (ref)
    render.text(font_test, vector_position, color(255, 255, 255), nil, v72);
end);
local v74 = v31.gradient.text(" \194\187 Auto", false, v71);
events.render:set(function(_)
    -- upvalues: v74 (ref)
    render.text(font_test, vector_position, color(255, 255, 255), nil, v74);
end);
local v76 = v31.gradient.text(" \194\187 AA", false, v71);
events.render:set(function(_)
    -- upvalues: v76 (ref)
    render.text(font_test, vector_position, color(255, 255, 255), nil, v76);
end);
local v78 = v31.gradient.text(" \194\187 Rage", false, v71);
events.render:set(function(_)
    -- upvalues: v78 (ref)
    render.text(font_test, vector_position, color(255, 255, 255), nil, v78);
end);
local v80 = v1.selection:list("", {
    [1] = v70.m_pref .. "Misc", 
    [2] = v70.a_pref .. "Auto", 
    [3] = v70.AA_pref .. "AA", 
    [4] = v70.r_pref .. "Rage"
});
v80:set_callback(function()
    -- upvalues: v66 (ref), v80 (ref), v72 (ref), v70 (ref), v74 (ref), v76 (ref), v78 (ref)
    v66();
    if v80:get() == 1 then
        v80:update(v72, v70.a_pref .. "Auto", v70.AA_pref .. "AA", v70.r_pref .. "Rage");
    elseif v80:get() == 2 then
        v80:update(v70.m_pref .. "Misc", v74, v70.AA_pref .. "AA", v70.r_pref .. "Rage");
    elseif v80:get() == 3 then
        v80:update(v70.m_pref .. "Misc", v70.a_pref .. "Auto", v76, v70.r_pref .. "Rage");
    elseif v80:get() == 4 then
        v80:update(v70.m_pref .. "Misc", v70.a_pref .. "Auto", v70.AA_pref .. "AA", v78);
    end;
end);
local v81 = v31.gradient.text(" \194\187 Builder", false, v71);
events.render:set(function(_)
    -- upvalues: v81 (ref)
    render.text(font_test, vector_position, color(255, 255, 255), nil, v81);
end);
local v83 = v31.gradient.text(" \194\187 Extra", false, v71);
events.render:set(function(_)
    -- upvalues: v83 (ref)
    render.text(font_test, vector_position, color(255, 255, 255), nil, v83);
end);
local v85 = v1.home_configs_sel:list("", {
    [1] = " \226\128\162 Builder", 
    [2] = " \226\128\162 Extra"
});
v85:set_callback(function()
    -- upvalues: v66 (ref), v85 (ref), v1 (ref), v64 (ref)
    v66();
    local v86 = v85:get();
    v1.home_configs:visibility(v86 == 1);
    v1.home_social:visibility(v86 == 2);
    v1.experience:visibility(v86 == 2);
    v64:visibility(v86 == 2);
    v1.additional:visibility(v86 == 2);
end);
v85:set_callback(function()
    -- upvalues: v85 (ref), v81 (ref), v83 (ref)
    local v87 = v85:get();
    if v87 == 1 then
        v85:update(v81, " \226\128\162 Extra");
    elseif v87 == 2 then
        v85:update(" \226\128\162 Builder", v83);
    end;
end);
local function v88()
    -- upvalues: v85 (ref), v80 (ref)
    v85:set(1);
    v80:set(1);
end;
utils.execute_after(3, v88);
v41.manual_direction = v1.antiaim_general:combo("\a" .. hexx .. ui.get_icon("arrows-maximize") .. "\aDEFAULT" .. "    Manual", {
    [1] = "Disabled", 
    [2] = "Left", 
    [3] = "Right", 
    [4] = "Forward"
}):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
v41.static_angles = v1.antiaim_general:selectable("\a" .. hexx .. ui.get_icon("street-view") .. "\aDEFAULT" .. "   Static Angles", {
    [1] = "Manual", 
    [2] = "Freestand"
}):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
v41.supress_defensive = v1.antiaim_general:switch("\a" .. hexx .. ui.get_icon("lightbulb-exclamation") .. "\aDEFAULT" .. "    Suppress Defensive", false):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
v41.defensive_disabler = v1.antiaim_general:selectable("\a" .. hexx .. ui.get_icon("location-exclamation") .. "\aDEFAULT" .. "    Defen. Disablers", {
    [1] = "Holding Knife", 
    [2] = "On Peek"
}):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
v41.selection_team = v1.builder_builder:combo("Team", v44):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
v41.selection_condition = v1.builder_builder:combo("Condition", v45):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
v41.builder_clone_team = v1.builder_builder:button("                      Send to other team                      ", function()
    -- upvalues: v66 (ref), l_lower_0 (ref), l_gsub_0 (ref), v41 (ref), v15 (ref)
    v66();
    local v89 = l_lower_0(l_gsub_0(v41.selection_condition:get(), " ", ""));
    local v90 = l_lower_0(l_gsub_0(v41.selection_team:get(), " ", ""));
    for v91, v92 in pairs(v41) do
        local v93 = v15(v91, "_");
        if v93[1] == "builder" and v93[2] == v90 and v93[3] == v89 then
            local v94 = v90 == "terrorist" and "counterterrorist" or "terrorist";
            v41[l_gsub_0(v91, v90, v94)]:set(v92:get());
        end;
    end;
end, true);
local function v112()
    -- upvalues: l_lower_0 (ref), l_gsub_0 (ref), v41 (ref), v15 (ref)
    local v95 = l_lower_0(l_gsub_0(v41.selection_condition:get(), " ", ""));
    local v96 = l_lower_0(l_gsub_0(v41.selection_team:get(), " ", ""));
    for v97, v98 in pairs(v41) do
        local v99 = v15(v97, "_");
        local v100 = nil;
        local v101 = nil;
        local v102 = nil;
        local v103 = nil;
        local v104 = nil;
        local v105 = nil;
        local v106 = nil;
        local v107 = nil;
        local _ = nil;
        local v109 = nil;
        local v110 = nil;
        local v111 = nil;
        if #v99 >= 4 and v99[1] == "builder" then
            v101 = true;
            if v99[2] ~= v96 or v99[3] ~= v95 then
                v101 = false;
            else
                v100 = l_gsub_0(v97, "builder_" .. v96 .. "_" .. v95 .. "_", "");
                if v99[3] ~= "global" and not v41["builder_" .. v96 .. "_" .. v95 .. "_enable"]:get() and v100 ~= "enable" then
                    v101 = false;
                else
                    v102 = v41["builder_" .. v96 .. "_" .. v95 .. "_yaw"]:get();
                    v109 = v41["builder_" .. v96 .. "_" .. v95 .. "_enable_dynamicyaw"]:get();
                    if v100 == "yaw_offset" and v102 ~= "Static" then
                        v101 = false;
                    elseif v100 == "enable_dynamicyaw" and v102 ~= "Random" and v102 ~= "Left & Right" and v102 ~= "Sway" then
                        v101 = false;
                    elseif v100 == "yaw_dynamicleft" and v102 ~= "Random" and v102 ~= "Left & Right" and v102 ~= "Sway" then
                        v101 = false;
                    elseif v100 == "yaw_dynamicright" and v102 ~= "Random" and v102 ~= "Left & Right" and v102 ~= "Sway" then
                        v101 = false;
                    elseif v100 == "yaw_dynamicleft" and not v109 then
                        v101 = false;
                    elseif v100 == "yaw_dynamicright" and not v109 then
                        v101 = false;
                    elseif (v100 == "yaw_left" or v100 == "yaw_right") and v102 ~= "Left & Right" and v102 ~= "Random" then
                        v101 = false;
                    elseif v100 == "yaw_chance" and v102 ~= "Left & Right" then
                        v101 = false;
                    elseif (v100 == "yaw_leftsway" or v100 == "yaw_rightsway" or v100 == "yaw_speedsway") and v102 ~= "Sway" then
                        v101 = false;
                    elseif v100 == "yaw_sineoffset" and v102 ~= "Sine Wave" then
                        v101 = false;
                    elseif v100 == "yaw_decayoffset" and v102 ~= "Decaying" then
                        v101 = false;
                    elseif v100 == "yaw_sinedecayoffset" and v102 ~= "Sine Decaying" then
                        v101 = false;
                    elseif v100 == "yaw_mirroredsineoffset" and v102 ~= "Mirrored Sine" then
                        v101 = false;
                    elseif (v100 == "yaw_pattern1" or v100 == "yaw_pattern2" or v100 == "yaw_pattern3" or v100 == "yaw_pattern4" or v100 == "yaw_patternchance" or v100 == "yaw_patternoffset") and v102 ~= "Pattern Breaker" then
                        v101 = false;
                    elseif (v100 == "yaw_freq1" or v100 == "yaw_freq2" or v100 == "yaw_freq3" or v100 == "yaw_freq4" or v100 == "yaw_freqoffset") and v102 ~= "Multi-Freq. Sine" then
                        v101 = false;
                    else
                        v103 = v41["builder_" .. v96 .. "_" .. v95 .. "_bodyyaw"]:get();
                        v110 = v41["builder_" .. v96 .. "_" .. v95 .. "_enable_dynamicbodyyaw"]:get();
                        if v100 == "bodyyaw_side" and v103 ~= "Static" then
                            v101 = false;
                        elseif v100 == "bodyyaw_type" and v103 ~= "Left & Right" then
                            v101 = false;
                        elseif v100 == "enable_dynamicbodyyaw" and v103 ~= "Left & Right" and v103 ~= "Avoid Overlap" and v103 ~= "Random" then
                            v101 = false;
                        elseif v100 == "bodyyaw_rightdynamic" and v103 ~= "Left & Right" and v103 ~= "Avoid Overlap" and v103 ~= "Random" then
                            v101 = false;
                        elseif v100 == "bodyyaw_leftdynamic" and v103 ~= "Left & Right" and v103 ~= "Avoid Overlap" and v103 ~= "Random" then
                            v101 = false;
                        elseif v100 == "bodyyaw_leftdynamic" and not v110 then
                            v101 = false;
                        elseif v100 == "bodyyaw_rightdynamic" and not v110 then
                            v101 = false;
                        elseif (v100 == "bodyyaw_sensitivity" or v100 == "bodyyaw_left" or v100 == "bodyyaw_right") and v103 == "Disabled" then
                            v101 = false;
                        elseif v100 == "bodyyaw_left" and v103 == "Static" and v41["builder_" .. v96 .. "_" .. v95 .. "_bodyyaw_side"]:get() ~= "Left" then
                            v101 = false;
                        elseif v100 == "bodyyaw_right" and v103 == "Static" and v41["builder_" .. v96 .. "_" .. v95 .. "_bodyyaw_side"]:get() ~= "Right" then
                            v101 = false;
                        else
                            v104 = v41["builder_" .. v96 .. "_" .. v95 .. "_defensive_enable"]:get();
                            v105 = v41["builder_" .. v96 .. "_" .. v95 .. "_defensive_pitch"]:get();
                            v106 = v41["builder_" .. v96 .. "_" .. v95 .. "_defensive_yaw"]:get();
                            v111 = v41["builder_" .. v96 .. "_" .. v95 .. "_defensive_dynamic_yaw_limit"]:get();
                            if v99[4] == "defensive" and v100 ~= "defensive_enable" and not v104 then
                                v101 = false;
                            elseif v99[4] == "defensive" and (v95 == "fakelag" or v95 == "Fake Duck") then
                                v101 = false;
                            elseif v99[4] == "defensive" and v95 == "fakeduck" then
                                v101 = false;
                            elseif v100 == "defensive_pitch_offset" and v105 ~= "Static" then
                                v101 = false;
                            elseif (v100 == "defensive_pitch_min" or v100 == "defensive_pitch_max") and v105 ~= "Random" and v105 ~= "Sway" and v105 ~= "Jitter" and v105 ~= "Sine Wave" and v105 ~= "Dynamic" and v105 ~= "Sine Random" then
                                v101 = false;
                            elseif v100 == "defensive_yaw_offset" and v106 ~= "Spin" and v106 ~= "Reversal Spin" and v106 ~= "Random" and v106 ~= "Jitter" and v106 ~= "Sine Wave" and v106 ~= "Dynamic Sway" and v106 ~= "Erratic Pulse" and v106 ~= "Static" then
                                v101 = false;
                            elseif v100 == "defensive_yaw_spin_speed" and v106 ~= "lol" and v106 ~= "lool" then
                                v101 = false;
                            elseif v100 == "defensive_dynamic_yaw_limit" and v106 ~= "lol" then
                                v101 = false;
                            elseif v100 == "defensive_dynamic_yaw_offset" and v106 ~= "lol" then
                                v101 = false;
                            elseif v100 == "defensive_dynamic_yaw_offset" and not v111 then
                                v101 = false;
                            else
                                v107 = v41["builder_" .. v96 .. "_" .. v95 .. "_bodylean_enable"]:get();
                                if (v100 == "bodylean_trigger" or v100 == "bodylean_amount") and not v107 then
                                    v101 = false;
                                elseif v100 == "bodylean_enable" and v95 == "fakelag" then
                                    v101 = false;
                                elseif v100 == "bodylean_enable" and v95 == "fakeduck" then
                                    v101 = false;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
            if v98:visibility() ~= v101 then
                v98:visibility(v101);
            end;
        end;
    end;
end;
v41.selection_team:set_callback(v112);
v41.selection_condition:set_callback(v112);
for v113 = 1, #v44 do
    local v114 = l_lower_0(l_gsub_0(v44[v113], " ", ""));
    for v115 = 1, #v45 do
        local v116 = l_lower_0(l_gsub_0(v45[v115], " ", ""));
        local v117 = "   " .. ui.get_icon("caret-right") .. "   ";
        if v116 == "global" then
            v41["builder_" .. v114 .. "_" .. v116 .. "_enable"] = v1.builder_builder:label("");
        else
            v41["builder_" .. v114 .. "_" .. v116 .. "_enable"] = v1.builder_builder:switch("Enable", false):set_callback(v112):set_callback(function()
                -- upvalues: v66 (ref)
                v66();
            end);
        end;
        v41["builder_" .. v114 .. "_" .. v116 .. "_direction"] = v1.builder_builder:combo("Direction", {
            [1] = "Local View", 
            [2] = "At Target"
        }):set_callback(function()
            -- upvalues: v66 (ref)
            v66();
        end);
        v41["builder_" .. v114 .. "_" .. v116 .. "_pitch"] = v1.builder_builder:combo("Pitch", {
            [1] = "Disabled", 
            [2] = "Down", 
            [3] = "Fake Down", 
            [4] = "Fake Up"
        }):set_callback(function()
            -- upvalues: v66 (ref)
            v66();
        end);
        v41["builder_" .. v114 .. "_" .. v116 .. "_yaw"] = v1.builder_angles:combo("Yaw", {
            [1] = "Static", 
            [2] = "Random", 
            [3] = "Left & Right", 
            [4] = "Sway", 
            [5] = "Sine Wave", 
            [6] = "Decaying", 
            [7] = "Sine Decaying", 
            [8] = "Mirrored Sine", 
            [9] = "Pattern Breaker", 
            [10] = "Multi-Freq. Sine"
        }):set_callback(v112):set_callback(function()
            -- upvalues: v66 (ref)
            v66();
        end);
        v41["builder_" .. v114 .. "_" .. v116 .. "_yaw_offset"] = v1.builder_angles:slider(v117 .. "Yaw Offset", -180, 180, 0, 1, "\194\176"):set_callback(function()
            -- upvalues: v66 (ref)
            v66();
        end);
        v41["builder_" .. v114 .. "_" .. v116 .. "_yaw_left"] = v1.builder_angles:slider(v117 .. "Left Offset", -180, 180, 0, 1, "\194\176"):set_callback(function()
            -- upvalues: v66 (ref)
            v66();
        end);
        v41["builder_" .. v114 .. "_" .. v116 .. "_yaw_right"] = v1.builder_angles:slider(v117 .. "Right Offset", -180, 180, 0, 1, "\194\176"):set_callback(function()
            -- upvalues: v66 (ref)
            v66();
        end);
        v41["builder_" .. v114 .. "_" .. v116 .. "_yaw_chance"] = v1.builder_angles:slider(v117 .. "Switch Chance", 0, 100, 100, 1, "%"):set_callback(function()
            -- upvalues: v66 (ref)
            v66();
        end);
        v41["builder_" .. v114 .. "_" .. v116 .. "_yaw_leftsway"] = v1.builder_angles:slider(v117 .. "Left Sway", -180, 180, 0, 1, "\194\176"):set_callback(function()
            -- upvalues: v66 (ref)
            v66();
        end);
        v41["builder_" .. v114 .. "_" .. v116 .. "_yaw_rightsway"] = v1.builder_angles:slider(v117 .. "Right Sway", -180, 180, 0, 1, "\194\176"):set_callback(function()
            -- upvalues: v66 (ref)
            v66();
        end);
        v41["builder_" .. v114 .. "_" .. v116 .. "_yaw_speedsway"] = v1.builder_angles:slider(v117 .. "Sway Speed", 0, 100, 100, 1, "%"):set_callback(function()
            -- upvalues: v66 (ref)
            v66();
        end);
        v41["builder_" .. v114 .. "_" .. v116 .. "_yaw_sineoffset"] = v1.builder_angles:slider(v117 .. "Offset", -180, 180, 0, 1, "\194\176"):set_callback(function()
            -- upvalues: v66 (ref)
            v66();
        end);
        v41["builder_" .. v114 .. "_" .. v116 .. "_yaw_decayoffset"] = v1.builder_angles:slider(v117 .. "Offset", -180, 180, 0, 1, "\194\176"):set_callback(function()
            -- upvalues: v66 (ref)
            v66();
        end);
        v41["builder_" .. v114 .. "_" .. v116 .. "_yaw_sinedecayoffset"] = v1.builder_angles:label(v117 .. "\aDEFAULTCombined Sine & Decay values."):set_callback(function()
            -- upvalues: v66 (ref)
            v66();
        end);
        v41["builder_" .. v114 .. "_" .. v116 .. "_yaw_mirroredsineoffset"] = v1.builder_angles:slider(v117 .. "Offset", -180, 180, 0, 1, "\194\176"):set_callback(function()
            -- upvalues: v66 (ref)
            v66();
        end);
        v41["builder_" .. v114 .. "_" .. v116 .. "_yaw_pattern1"] = v1.builder_angles:slider(v117 .. "Pattern\226\130\129 (Pos.)", 1, 180, 0, 1, "\194\176"):set_callback(function()
            -- upvalues: v66 (ref)
            v66();
        end);
        v41["builder_" .. v114 .. "_" .. v116 .. "_yaw_pattern2"] = v1.builder_angles:slider(v117 .. "Pattern\226\130\130 (Pos.)", 1, 180, 0, 1, "\194\176"):set_callback(function()
            -- upvalues: v66 (ref)
            v66();
        end);
        v41["builder_" .. v114 .. "_" .. v116 .. "_yaw_pattern3"] = v1.builder_angles:slider(v117 .. "Pattern\226\130\131 (Neg.)", -180, -1, 0, 1, "\194\176"):set_callback(function()
            -- upvalues: v66 (ref)
            v66();
        end);
        v41["builder_" .. v114 .. "_" .. v116 .. "_yaw_pattern4"] = v1.builder_angles:slider(v117 .. "Pattern\226\130\132 (Neg.)", -180, -1, 0, 1, "\194\176"):set_callback(function()
            -- upvalues: v66 (ref)
            v66();
        end);
        v41["builder_" .. v114 .. "_" .. v116 .. "_yaw_patternchance"] = v1.builder_angles:slider(v117 .. "Break Chance", 0, 100, 100, 1, "%"):set_callback(function()
            -- upvalues: v66 (ref)
            v66();
        end);
        v41["builder_" .. v114 .. "_" .. v116 .. "_yaw_patternoffset"] = v1.builder_angles:slider(v117 .. "Offset", -180, 180, 0, 1, "\194\176"):set_callback(function()
            -- upvalues: v66 (ref)
            v66();
        end);
        v41["builder_" .. v114 .. "_" .. v116 .. "_yaw_freq1"] = v1.builder_angles:slider(v117 .. "Freq. multiplier\226\130\129", 1, 5, 0, 1, "*"):set_callback(function()
            -- upvalues: v66 (ref)
            v66();
        end);
        v41["builder_" .. v114 .. "_" .. v116 .. "_yaw_freq2"] = v1.builder_angles:slider(v117 .. "Freq. multiplier\226\130\130", 1, 5, 0, 1, "*"):set_callback(function()
            -- upvalues: v66 (ref)
            v66();
        end);
        v41["builder_" .. v114 .. "_" .. v116 .. "_yaw_freq3"] = v1.builder_angles:slider(v117 .. "Freq. multiplier\226\130\131", 1, 5, 0, 1, "*"):set_callback(function()
            -- upvalues: v66 (ref)
            v66();
        end);
        v41["builder_" .. v114 .. "_" .. v116 .. "_yaw_freqoffset"] = v1.builder_angles:slider(v117 .. "Offset", -180, 180, 0, 1, "\194\176"):set_callback(function()
            -- upvalues: v66 (ref)
            v66();
        end);
        v41["builder_" .. v114 .. "_" .. v116 .. "_enable_dynamicyaw"] = v1.builder_angles:switch("Dynamic Yaw Limits", false):set_callback(v112):set_callback(function()
            -- upvalues: v66 (ref)
            v66();
        end);
        v41["builder_" .. v114 .. "_" .. v116 .. "_yaw_dynamicleft"] = v1.builder_angles:slider(v117 .. "\226\135\132 Left Offset", -30, 30, 0, 1, "\194\176"):set_callback(function()
            -- upvalues: v66 (ref)
            v66();
        end);
        v41["builder_" .. v114 .. "_" .. v116 .. "_yaw_dynamicright"] = v1.builder_angles:slider(v117 .. "\226\135\132 Right Offset", -30, 30, 0, 1, "\194\176"):set_callback(function()
            -- upvalues: v66 (ref)
            v66();
        end);
        v41["builder_" .. v114 .. "_" .. v116 .. "_bodyyaw"] = v1.builder_angles:combo("Body Yaw", {
            [1] = "Disabled", 
            [2] = "Static", 
            [3] = "Left & Right", 
            [4] = "Random", 
            [5] = "Avoid Overlap"
        }):set_callback(v112):set_callback(function()
            -- upvalues: v66 (ref)
            v66();
        end);
        v41["builder_" .. v114 .. "_" .. v116 .. "_bodyyaw_sensitivity"] = v1.builder_angles:slider(v117 .. "Sensitivity", 0, 100, 100, 1, "%"):set_callback(function()
            -- upvalues: v66 (ref)
            v66();
        end);
        v41["builder_" .. v114 .. "_" .. v116 .. "_bodyyaw_side"] = v1.builder_angles:combo(v117 .. "Side", {
            [1] = "Left", 
            [2] = "Right"
        }):set_callback(v112):set_callback(function()
            -- upvalues: v66 (ref)
            v66();
        end);
        v41["builder_" .. v114 .. "_" .. v116 .. "_bodyyaw_type"] = v1.builder_angles:combo(v117 .. "Type", {
            [1] = "Hide", 
            [2] = "Expose"
        }):set_callback(function()
            -- upvalues: v66 (ref)
            v66();
        end);
        v41["builder_" .. v114 .. "_" .. v116 .. "_bodyyaw_left"] = v1.builder_angles:slider(v117 .. "Left Limit", 0, 100, 100, 1, "%"):set_callback(function()
            -- upvalues: v66 (ref)
            v66();
        end);
        v41["builder_" .. v114 .. "_" .. v116 .. "_bodyyaw_right"] = v1.builder_angles:slider(v117 .. "Right Limit", 0, 100, 100, 1, "%"):set_callback(function()
            -- upvalues: v66 (ref)
            v66();
        end);
        v41["builder_" .. v114 .. "_" .. v116 .. "_enable_dynamicbodyyaw"] = v1.builder_angles:switch("Dynamic Body Yaw Limits", false):set_callback(v112):set_callback(function()
            -- upvalues: v66 (ref)
            v66();
        end);
        v41["builder_" .. v114 .. "_" .. v116 .. "_bodyyaw_rightdynamic"] = v1.builder_angles:slider(v117 .. "\226\135\132 Right Limit", 0, 30, 30, 1, "%"):set_callback(function()
            -- upvalues: v66 (ref)
            v66();
        end);
        v41["builder_" .. v114 .. "_" .. v116 .. "_bodyyaw_leftdynamic"] = v1.builder_angles:slider(v117 .. "\226\135\132 Left Limit", 0, 30, 30, 1, "%"):set_callback(function()
            -- upvalues: v66 (ref)
            v66();
        end);
        v41["builder_" .. v114 .. "_" .. v116 .. "_defensive_enable"] = v1.builder_defensive:switch("Enable", false):set_callback(v112):set_callback(function()
            -- upvalues: v66 (ref)
            v66();
        end);
        v41["builder_" .. v114 .. "_" .. v116 .. "_defensive_trigger"] = v1.builder_defensive:combo(v117 .. "Trigger", {
            [1] = "Always", 
            [2] = "Dormant", 
            [3] = "No Threat", 
            [4] = "Threatened", 
            [5] = "On Peek"
        }):set_callback(function()
            -- upvalues: v66 (ref)
            v66();
        end);
        v41["builder_" .. v114 .. "_" .. v116 .. "_defensive_sensitivity"] = v1.builder_defensive:slider(v117 .. "Sensitivity", 0, 100, 100, 1, "%"):set_callback(function()
            -- upvalues: v66 (ref)
            v66();
        end);
        v41["builder_" .. v114 .. "_" .. v116 .. "_defensive_safety"] = v1.builder_defensive:slider(v117 .. "Safety", 0, 4, 0, 1, "~"):set_callback(function()
            -- upvalues: v66 (ref)
            v66();
        end);
        v41["builder_" .. v114 .. "_" .. v116 .. "_defensive_bodyyaw"] = v1.builder_defensive:switch(v117 .. "Body Yaw", false):set_callback(function()
            -- upvalues: v66 (ref)
            v66();
        end);
        v41["builder_" .. v114 .. "_" .. v116 .. "_defensive_pitch"] = v1.builder_defensive:combo(v117 .. "Pitch", {
            [1] = "Off", 
            [2] = "Static", 
            [3] = "Random", 
            [4] = "Sway", 
            [5] = "Jitter", 
            [6] = "Sine Wave", 
            [7] = "Dynamic", 
            [8] = "Sine Random"
        }):set_callback(v112):set_callback(function()
            -- upvalues: v66 (ref)
            v66();
        end);
        v41["builder_" .. v114 .. "_" .. v116 .. "_defensive_pitch_offset"] = v1.builder_defensive:slider(v117 .. "Pitch Offset", -89, 89, 0, 1, "\194\176"):set_callback(function()
            -- upvalues: v66 (ref)
            v66();
        end);
        v41["builder_" .. v114 .. "_" .. v116 .. "_defensive_pitch_min"] = v1.builder_defensive:slider(v117 .. "Min. Pitch", -89, 89, 0, 1, "\194\176"):set_callback(function()
            -- upvalues: v66 (ref)
            v66();
        end);
        v41["builder_" .. v114 .. "_" .. v116 .. "_defensive_pitch_max"] = v1.builder_defensive:slider(v117 .. "Max. Pitch", -89, 89, 0, 1, "\194\176"):set_callback(function()
            -- upvalues: v66 (ref)
            v66();
        end);
        v41["builder_" .. v114 .. "_" .. v116 .. "_defensive_yaw"] = v1.builder_defensive:combo(v117 .. "Yaw", {
            [1] = "Off", 
            [2] = "Static", 
            [3] = "Spin", 
            [4] = "Reversal Spin", 
            [5] = "Random", 
            [6] = "180Z", 
            [7] = "Jitter", 
            [8] = "Sine Wave", 
            [9] = "Dynamic Sway", 
            [10] = "Erratic Pulse"
        }):set_callback(v112):set_callback(function()
            -- upvalues: v66 (ref)
            v66();
        end);
        v41["builder_" .. v114 .. "_" .. v116 .. "_defensive_yaw_offset"] = v1.builder_defensive:slider(v117 .. "Yaw Offset", 0, 360, 360, 1, "\194\176"):set_callback(function()
            -- upvalues: v66 (ref)
            v66();
        end);
        v41["builder_" .. v114 .. "_" .. v116 .. "_defensive_yaw_spin_speed"] = v1.builder_defensive:slider(v117 .. "Spin Speed", 1, 5, 1, 1, "*"):set_callback(function()
            -- upvalues: v66 (ref)
            v66();
        end);
        v41["builder_" .. v114 .. "_" .. v116 .. "_defensive_dynamic_yaw_limit"] = v1.builder_defensive:switch(v117 .. "Dynamic Def. Yaw Offset", false):set_callback(v112):set_callback(function()
            -- upvalues: v66 (ref)
            v66();
        end):visibility(false);
        v41["builder_" .. v114 .. "_" .. v116 .. "_defensive_dynamic_yaw_offset"] = v1.builder_defensive:slider(v117 .. "\226\135\132 Yaw Offset", -30, 30, 0, 1, "\194\176"):set_callback(function()
            -- upvalues: v66 (ref)
            v66();
        end);
        v41["builder_" .. v114 .. "_" .. v116 .. "_defensive_fluctuate"] = v1.builder_defensive:slider(v117 .. "FL Fluctuation", 1, 10, 1, 1, "\226\135\132"):set_callback(function()
            -- upvalues: v66 (ref)
            v66();
        end);
        v41["builder_" .. v114 .. "_" .. v116 .. "_bodylean_enable"] = v1.builder_bodylean:switch("Enable", false):set_callback(v112):set_callback(function()
            -- upvalues: v66 (ref)
            v66();
        end);
        v41["builder_" .. v114 .. "_" .. v116 .. "_bodylean_trigger"] = v1.builder_bodylean:combo(v117 .. "Trigger", {
            [1] = "Always", 
            [2] = "Defensive", 
            [3] = "Fake Lag"
        }):set_callback(function()
            -- upvalues: v66 (ref)
            v66();
        end);
        v41["builder_" .. v114 .. "_" .. v116 .. "_bodylean_amount"] = v1.builder_bodylean:slider(v117 .. "Amount", 0, 180, 0, 1, "\194\176"):set_callback(function()
            -- upvalues: v66 (ref)
            v66();
        end);
    end;
end;
v112();
local function v120(v118)
    -- upvalues: v42 (ref)
    v42.local_player = entity.get_local_player();
    local l_v42_0 = v42;
    if v42.local_player == nil then

    end;
    l_v42_0.local_weapon = v42.local_player:get_player_weapon();
    v42.tickcount = v118.tickcount;
    v42.choked_commands = v118.choked_commands;
    v42.threat = entity.get_threat(true);
    v42.players = entity.get_players(false, true);
end;
local v121 = {
    team = "Terrorist", 
    condition = "Global", 
    last_condition = "Global"
};
local v122 = {};
local function v125(_)
    -- upvalues: l_lower_0 (ref), l_gsub_0 (ref), v121 (ref), v122 (ref), v41 (ref)
    local v124 = "builder_" .. l_lower_0(l_gsub_0(v121.team, " ", "")) .. "_" .. l_lower_0(l_gsub_0(v121.condition, " ", "")) .. "_";
    v122.direction = v41[v124 .. "direction"]:get();
    v122.pitch = v41[v124 .. "pitch"]:get();
    v122.yaw = v41[v124 .. "yaw"]:get();
    v122.yaw_offset = v41[v124 .. "yaw_offset"]:get();
    v122.yaw_left = v41[v124 .. "yaw_left"]:get();
    v122.yaw_right = v41[v124 .. "yaw_right"]:get();
    v122.yaw_chance = v41[v124 .. "yaw_chance"]:get();
    v122.yaw_leftsway = v41[v124 .. "yaw_leftsway"]:get();
    v122.yaw_rightsway = v41[v124 .. "yaw_rightsway"]:get();
    v122.yaw_speedsway = v41[v124 .. "yaw_speedsway"]:get();
    v122.yaw_sine_offset = v41[v124 .. "yaw_sineoffset"]:get();
    v122.yaw_decay_offset = v41[v124 .. "yaw_decayoffset"]:get();
    v122.yaw_mirrored_sine_offset = v41[v124 .. "yaw_mirroredsineoffset"]:get();
    v122.yaw_pattern1 = v41[v124 .. "yaw_pattern1"]:get();
    v122.yaw_pattern2 = v41[v124 .. "yaw_pattern2"]:get();
    v122.yaw_pattern3 = v41[v124 .. "yaw_pattern3"]:get();
    v122.yaw_pattern4 = v41[v124 .. "yaw_pattern4"]:get();
    v122.yaw_pattern_chance = v41[v124 .. "yaw_patternchance"]:get();
    v122.yaw_pattern_offset = v41[v124 .. "yaw_patternoffset"]:get();
    v122.yaw_freq1 = v41[v124 .. "yaw_freq1"]:get();
    v122.yaw_freq2 = v41[v124 .. "yaw_freq2"]:get();
    v122.yaw_freq3 = v41[v124 .. "yaw_freq3"]:get();
    v122.yaw_freq_offset = v41[v124 .. "yaw_freqoffset"]:get();
    v122.bodyyaw = v41[v124 .. "bodyyaw"]:get();
    v122.bodyyaw_sensitivity = v41[v124 .. "bodyyaw_sensitivity"]:get();
    v122.bodyyaw_side = v41[v124 .. "bodyyaw_side"]:get();
    v122.bodyyaw_type = v41[v124 .. "bodyyaw_type"]:get();
    v122.bodyyaw_left = v41[v124 .. "bodyyaw_left"]:get();
    v122.bodyyaw_right = v41[v124 .. "bodyyaw_right"]:get();
    v122.defensive_enable = v41[v124 .. "defensive_enable"]:get();
    v122.defensive_trigger = v41[v124 .. "defensive_trigger"]:get();
    v122.defensive_sensitivity = v41[v124 .. "defensive_sensitivity"]:get();
    v122.defensive_safety = v41[v124 .. "defensive_safety"]:get();
    v122.defensive_bodyyaw = v41[v124 .. "defensive_bodyyaw"]:get();
    v122.defensive_pitch = v41[v124 .. "defensive_pitch"]:get();
    v122.defensive_pitch_offset = v41[v124 .. "defensive_pitch_offset"]:get();
    v122.defensive_pitch_min = v41[v124 .. "defensive_pitch_min"]:get();
    v122.defensive_pitch_max = v41[v124 .. "defensive_pitch_max"]:get();
    v122.defensive_yaw = v41[v124 .. "defensive_yaw"]:get();
    v122.defensive_yaw_offset = v41[v124 .. "defensive_yaw_offset"]:get();
    v122.defensive_fluctuate = v41[v124 .. "defensive_fluctuate"]:get();
    v122.bodylean_enable = v41[v124 .. "bodylean_enable"]:get();
    v122.bodylean_trigger = v41[v124 .. "bodylean_trigger"]:get();
    v122.bodylean_amount = v41[v124 .. "bodylean_amount"]:get();
    v122.enable_dynamicyaw = v41[v124 .. "enable_dynamicyaw"]:get();
    v122.yaw_dynamicleft = v41[v124 .. "yaw_dynamicleft"]:get();
    v122.yaw_dynamicright = v41[v124 .. "yaw_dynamicright"]:get();
    v122.bodyyaw_dynamic_enable = v41[v124 .. "enable_dynamicbodyyaw"]:get();
    v122.bodyyaw_dynamic_left = v41[v124 .. "bodyyaw_leftdynamic"]:get();
    v122.bodyyaw_dynamic_right = v41[v124 .. "bodyyaw_rightdynamic"]:get();
    v122.defensive_dynamic_yaw_enable = v41[v124 .. "defensive_dynamic_yaw_limit"]:get();
    v122.defensive_dynamic_yaw_offset = v41[v124 .. "defensive_dynamic_yaw_offset"]:get();
    v122.defensive_yaw_spin_speed = v41[v124 .. "defensive_yaw_spin_speed"]:get();
end;
local function v139(v126)
    -- upvalues: v42 (ref), v28 (ref), v121 (ref), v41 (ref), v125 (ref)
    local l_local_player_0 = v42.local_player;
    local v128 = "Global";
    if l_local_player_0 == nil then
        return v128;
    else
        local l_m_vecVelocity_0 = l_local_player_0.m_vecVelocity;
        local v130 = math.floor(math.sqrt(l_m_vecVelocity_0.x * l_m_vecVelocity_0.x + l_m_vecVelocity_0.y * l_m_vecVelocity_0.y)) < 3;
        local v131 = l_local_player_0.m_flDuckAmount ~= 0;
        local v132 = l_m_vecVelocity_0.z ~= 0;
        local v133 = v28.aa_slow_walk:get();
        local v134 = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"):get();
        local v135 = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"):get();
        local v136 = not v134 and not v135;
        local v137 = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"):get();
        v121.team = l_local_player_0.m_iTeamNum == 2 and "Terrorist" or l_local_player_0.m_iTeamNum == 3 and "Counter Terrorist" or "Spectator";
        local v138 = string.lower(string.gsub(v121.team, " ", ""));
        if v136 and v41["builder_" .. v138 .. "_fakelag_enable"]:get() then
            v128 = "Fake Lag";
        elseif v137 and v41["builder_" .. v138 .. "_fakeduck_enable"]:get() then
            v128 = "Fake Duck";
        else
            if v131 then
                v128 = v132 and "Crouch Air" or v130 and "Crouch Stand" or "Crouch Move";
            else
                v128 = v132 and "Air" or v133 and "Slow Walk" or v130 and "Standing" or "Moving";
            end;
            if not v41["builder_" .. v138 .. "_" .. string.lower(string.gsub(v128, " ", "")) .. "_enable"]:get() then
                v128 = "Global";
            end;
        end;
        if v121.condition ~= v128 then
            v121.condition = v128;
            v125(v126);
        end;
        v121.last_condition = v128;
        return;
    end;
end;
local v140 = 0;
local v141 = 0;
local function v142()
    -- upvalues: v122 (ref), v140 (ref), v141 (ref)
    if v122.enable_dynamicyaw then
        v140 = math.random(0, math.abs(v122.yaw_dynamicleft));
        v141 = math.random(0, math.abs(v122.yaw_dynamicright));
        if v122.yaw_dynamicleft < 0 then
            v140 = -v140;
        end;
        if v122.yaw_dynamicright < 0 then
            v141 = -v141;
        end;
    else
        v140 = 0;
        v141 = 0;
    end;
end;
events.createmove:set(function()
    -- upvalues: v142 (ref)
    v142();
end);
local v143 = 0;
local v144 = 0;
local function v145()
    -- upvalues: v122 (ref), v143 (ref), v144 (ref)
    if v122.bodyyaw_dynamic_enable then
        v143 = math.random(0, math.abs(v122.bodyyaw_dynamic_left));
        v144 = math.random(0, math.abs(v122.bodyyaw_dynamic_right));
        if v122.bodyyaw_dynamic_left < 0 then
            v143 = -v143;
        end;
        if v122.bodyyaw_dynamic_right < 0 then
            v144 = -v144;
        end;
    else
        v143 = 0;
        v144 = 0;
    end;
end;
local v146 = 0;
update_defensive_yaw_offset = function()
    -- upvalues: v122 (ref), v146 (ref)
    if v122.defensive_dynamic_yaw_enable then
        if v122.defensive_dynamic_yaw_offset > 0 then
            v146 = math.random(0, v122.defensive_dynamic_yaw_offset);
        else
            v146 = math.random(v122.defensive_dynamic_yaw_offset, 0);
        end;
    else
        v146 = 0;
    end;
end;
local function v147()
    -- upvalues: v122 (ref), v146 (ref)
    return v122.defensive_dynamic_yaw_enable and v146 or 0;
end;
events.createmove:set(function(_)
    -- upvalues: v145 (ref), v147 (ref)
    v145();
    v147();
end);
local function v201(v149)
    -- upvalues: v31 (ref), v41 (ref), v28 (ref), v121 (ref), v122 (ref), v42 (ref), v140 (ref), v141 (ref), v143 (ref), v144 (ref), v23 (ref)
    local v150 = v31.get_defensive();
    local v151 = v41.manual_direction:get();
    local v152 = v151 == "Disabled" and 0 or v151 == "Left" and -90 or v151 == "Right" and 90 or v151 == "Forward" and 180 or 0;
    if v152 ~= 0 and v41.static_angles:get("Manual") or v28.aa_freestanding:get() and rage.antiaim:get_target(true) ~= nil and v41.static_angles:get("Freestand") then
        v121.static_angles = true;
    else
        v121.static_angles = false;
    end;
    local function v155(v153, v154)
        return v153 ~= nil and v153 or v154;
    end;
    local function v161(v156, _)
        -- upvalues: v122 (ref)
        local l_yaw_sine_offset_0 = v122.yaw_sine_offset;
        local v159 = math.random() * 2 - 1;
        local v160 = math.random() * 2 * math.pi;
        return math.sin(v156 * v159 + v160) * l_yaw_sine_offset_0;
    end;
    local v162 = {
        decay_jitter_last_reset = globals.realtime, 
        decay_jitter_amplitude = v122.yaw_decay_offset, 
        decay_reset_interval = math.random(5, 10)
    };
    local function v166(v163, _)
        -- upvalues: v122 (ref), v162 (ref)
        local l_yaw_decay_offset_0 = v122.yaw_decay_offset;
        if v163 - v162.decay_jitter_last_reset > v162.decay_reset_interval then
            v162.decay_jitter_last_reset = v163;
            v162.decay_jitter_amplitude = l_yaw_decay_offset_0;
            v162.decay_reset_interval = math.random(5, 10);
        end;
        v162.decay_jitter_amplitude = v162.decay_jitter_amplitude * 0.95;
        return (math.random() * 2 - 1) * v162.decay_jitter_amplitude;
    end;
    local v167 = {
        mirrored_sine_last_flip = globals.realtime, 
        mirrored_sine_flip_interval = math.random(5, 10), 
        mirrored_sine_phase = math.random() * 2 * math.pi
    };
    local function v171(v168, _)
        -- upvalues: v122 (ref), v167 (ref)
        local l_yaw_mirrored_sine_offset_0 = v122.yaw_mirrored_sine_offset;
        if v168 - v167.mirrored_sine_last_flip > v167.mirrored_sine_flip_interval then
            v167.mirrored_sine_last_flip = v168;
            v167.mirrored_sine_flip_interval = math.random(5, 10);
            v167.mirrored_sine_phase = math.random() * 2 * math.pi;
        end;
        return math.sin(v168 * (math.random() * 2 - 1) + v167.mirrored_sine_phase) * l_yaw_mirrored_sine_offset_0;
    end;
    local v172 = {
        pattern_index = 1, 
        pattern = {
            [1] = nil, 
            [2] = nil, 
            [3] = nil, 
            [4] = nil, 
            [5] = 0, 
            [1] = v155(v122.yaw_pattern1, 0), 
            [2] = v155(v122.yaw_pattern2, 0), 
            [3] = v155(v122.yaw_pattern3, 0), 
            [4] = v155(v122.yaw_pattern4, 0)
        }, 
        pattern_break_chance = v155(v122.yaw_pattern_chance, 0) / 1000
    };
    local v173 = 0;
    local v174 = {
        [1] = v122.yaw_freq1 * 500, 
        [2] = v122.yaw_freq2 * 300, 
        [3] = v122.yaw_freq3 * 100
    };
    if v42.choked_commands == 0 and math.random(0, 99) < v122.yaw_chance then
        if v121.yaw_state == nil or v121.yaw_state == 0 then
            v121.yaw_state = 1;
        else
            v121.yaw_state = 0;
        end;
        v121.yaw_offset = v121.yaw_state == 0 and v122.yaw_left or v122.yaw_right;
    end;
    if v122.yaw == "Static" then
        v121.yaw_offset = v122.yaw_offset;
    elseif v122.yaw == "Random" then
        v121.yaw_offset = math.random(math.min(v122.yaw_left + v140, v122.yaw_right + v141), math.max(v122.yaw_left + v140, v122.yaw_right + v141));
    elseif v122.yaw == "Left & Right" then
        v121.yaw_offset = v121.yaw_state == 0 and v122.yaw_left + v140 or v122.yaw_right + v141;
    elseif v122.yaw == "Sway" then
        if v121.yaw_sway_progress == nil then
            v121.yaw_sway_progress = 0;
            v121.yaw_sway_direction = 1;
        end;
        local v175 = v122.yaw_speedsway / 100;
        v121.yaw_sway_progress = v121.yaw_sway_progress + v175 * v121.yaw_sway_direction;
        if v121.yaw_sway_progress > 1 or v121.yaw_sway_progress < 0 then
            v121.yaw_sway_direction = v121.yaw_sway_direction * -1;
            v121.yaw_sway_progress = math.max(0, math.min(1, v121.yaw_sway_progress));
        end;
        v121.yaw_offset = (1 - v121.yaw_sway_progress) * (v122.yaw_leftsway + v140) + v121.yaw_sway_progress * (v122.yaw_rightsway + v141);
    elseif v122.yaw == "Sine Wave" then
        v121.yaw_offset = v161(globals.realtime, v122.yaw_sine_offset);
    elseif v122.yaw == "Decaying" then
        v121.yaw_offset = v166(globals.realtime, v122.yaw_decay_offset);
    elseif v122.yaw == "Sine Decaying" then
        v121.yaw_offset = v161(globals.realtime, v122.yaw_sine_decay_offset) + v166(globals.realtime, v122.yaw_sine_decay_offset) * 0.5;
    elseif v122.yaw == "Mirrored Sine" then
        v121.yaw_offset = v171(globals.realtime, v122.yaw_mirrored_sine_offset);
    elseif v122.yaw == "Pattern Breaker" then
        if math.random() < v172.pattern_break_chance then
            v121.yaw_offset = math.random(-v122.yaw_pattern_offset, v122.yaw_pattern_offset);
        else
            v121.yaw_offset = v172.pattern[v172.pattern_index];
            v172.pattern_index = v172.pattern_index % #v172.pattern + 1;
        end;
    elseif v122.yaw == "Multi-Freq. Sine" then
        v173 = v173 + globals.absoluteframetime;
        v121.yaw_offset = 0;
        for _, v177 in ipairs(v174) do
            v121.yaw_offset = v121.yaw_offset + math.sin(v173 * v177 * 2 * math.pi);
        end;
        v121.yaw_offset = v121.yaw_offset * (v122.yaw_freq_offset / #v174);
    end;
    if v122.bodyyaw == "Disabled" then
        v121.bodyyaw = false;
    elseif v122.bodyyaw == "Static" then
        if v42.choked_commands == 0 then
            v121.bodyyaw = math.random(0, 99) < v122.bodyyaw_sensitivity;
        end;
        v121.bodyyaw_inverted = v122.bodyyaw_side == "Left";
        v121.bodyyaw_options = "";
    elseif v122.bodyyaw == "Left & Right" then
        if v42.choked_commands == 0 then
            v121.bodyyaw = math.random(0, 99) < v122.bodyyaw_sensitivity;
        end;
        v121.bodyyaw_inverted = v122.bodyyaw_type == "Hide" and not (v121.yaw_offset >= 0) or v122.bodyyaw_type == "Expose" and v121.yaw_offset > 0;
        v121.bodyyaw_options = "";
    elseif v122.bodyyaw == "Random" then
        if v42.choked_commands == 0 then
            v121.bodyyaw = math.random(0, 99) < v122.bodyyaw_sensitivity;
        end;
        v121.bodyyaw_inverted = math.random(0, 1) > 0.5;
        v121.bodyyaw_options = "";
    elseif v122.bodyyaw == "Avoid Overlap" then
        if v42.choked_commands == 0 then
            v121.bodyyaw = math.random(0, 99) < v122.bodyyaw_sensitivity;
        end;
        v121.bodyyaw_inverted = false;
        v121.bodyyaw_options = "Avoid Overlap";
    end;
    v121.bodyyaw_left = v122.bodyyaw_left + v143;
    v121.bodyyaw_right = v122.bodyyaw_right + v144;
    if v122.defensive_enable then
        if v150 then
            if v121.defensive_fluctuate_changed then
                v121.defensive_fluctuate_changed = false;
            end;
        elseif not v121.defensive_fluctuate_changed then
            if v121.defensive_fluctuate_amount == nil then
                v121.defensive_fluctuate_amount = 1;
            end;
            if v121.defensive_fluctuate_direction == nil then
                v121.defensive_fluctuate_direction = 1;
            end;
            if v122.defensive_fluctuate ~= 1 then
                if v121.defensive_fluctuate_amount <= 1 and v121.defensive_fluctuate_direction == -1 then
                    v121.defensive_fluctuate_direction = 1;
                elseif v121.defensive_fluctuate_amount >= v122.defensive_fluctuate and v121.defensive_fluctuate_direction == 1 then
                    v121.defensive_fluctuate_direction = -1;
                end;
                v121.defensive_fluctuate_amount = math.clamp(v121.defensive_fluctuate_amount + v121.defensive_fluctuate_direction, 1, 10);
            end;
            v121.defensive_fluctuate_changed = true;
        end;
        v121.defensive_length = 11 - v122.defensive_safety * 2;
        local v178 = v122.defensive_trigger == "Always";
        local v179 = true;
        for v180 = 1, #v42.players do
            local v181 = v42.players[v180];
            if v181:is_enemy() and v181:is_alive() and v181:get_network_state() < 2 then
                v179 = false;
            end;
        end;
        if v41.supress_defensive:get() then
            v178 = false;
        else
            if v122.defensive_trigger == "Dormant" then
                v178 = v179;
            elseif v122.defensive_trigger == "Threatened" then
                v178 = v42.threat ~= nil;
            elseif v122.defensive_trigger == "No Threat" then
                v178 = v42.threat == nil;
            elseif v122.defensive_trigger == "On Peek" then
                v178 = v28.rage_peek_assist:get();
            end;
            if v178 and v41.defensive_disabler:get("Holding Knife") and v42.local_weapon ~= nil and v42.local_weapon:get_weapon_info().weapon_type == 0 and v42.local_weapon:get_name() ~= "Zeus X27" then
                v178 = false;
            elseif v178 and v42.local_weapon ~= nil and v42.local_weapon:get_weapon_info().weapon_type == 9 then
                v178 = false;
            elseif v178 and v41.defensive_disabler:get("On Peek") and v28.rage_peek_assist:get() then
                v178 = false;
            elseif v178 and v121.static_angles then
                v178 = false;
            end;
        end;
        v121.defensive_triggered = v178;
        if not v150 then
            local l_v121_0 = v121;
            local v183;
            if v178 then
                v183 = math.random(0, 99) < v122.defensive_sensitivity;
            else
                v183 = v178;
            end;
            l_v121_0.defensive_allowed = v183;
        end;
        if v150 and v121.defensive_count ~= nil then
            v121.defensive_count = v121.defensive_count + 1;
        else
            v121.defensive_count = 0;
        end;
        v121.defensive_enabled = v121.defensive_allowed and v121.defensive_count > v122.defensive_safety and v121.defensive_count <= 11 - v122.defensive_safety;
        if v121.defensive_enabled and v121.defensive_state ~= nil then
            v121.defensive_state = v121.defensive_state + 1;
        else
            v121.defensive_state = 0;
        end;
        if v122.defensive_pitch == "Off" then
            v121.defensive_pitch = nil;
        elseif v122.defensive_pitch == "Dynamic" then
            if math.random() > 0.5 then
                v121.defensive_pitch = math.random(v122.defensive_pitch_min, v122.defensive_pitch_max);
            elseif v121.defensive_pitch ~= nil then
                v121.defensive_pitch = v121.defensive_pitch + math.random(-2, 2);
                v121.defensive_pitch = math.clamp(v121.defensive_pitch, v122.defensive_pitch_min, v122.defensive_pitch_max);
            end;
        elseif v122.defensive_pitch == "Sine Random" then
            local v184 = (v122.defensive_pitch_max - v122.defensive_pitch_min) / 2;
            local v185 = (v122.defensive_pitch_max + v122.defensive_pitch_min) / 2;
            local v186 = math.random() * math.pi * 2;
            v121.defensive_pitch = v185 + math.sin(v186 + v121.defensive_count) * v184;
        elseif v122.defensive_pitch == "Jitter" then
            v121.defensive_pitch = math.random(v122.defensive_pitch_min, v122.defensive_pitch_max);
        elseif v122.defensive_pitch == "Sine Wave" then
            local v187 = (v122.defensive_pitch_max - v122.defensive_pitch_min) / 2;
            local v188 = (v122.defensive_pitch_max + v122.defensive_pitch_min) / 2;
            local v189 = math.pi * 2 / v121.defensive_length;
            v121.defensive_pitch = v188 + math.sin(v189 * v121.defensive_count) * v187;
        elseif v122.defensive_pitch == "Static" then
            v121.defensive_pitch = v122.defensive_pitch_offset;
        elseif v122.defensive_pitch == "Random" then
            v121.defensive_pitch = math.floor(math.random(v122.defensive_pitch_min, v122.defensive_pitch_max));
        elseif v122.defensive_pitch == "Sway" then
            local v190 = math.abs(math.min(v122.defensive_pitch_min, v122.defensive_pitch_max) - math.max(v122.defensive_pitch_min, v122.defensive_pitch_max)) / v121.defensive_length * 2;
            v121.defensive_pitch = math.floor(math.min(v122.defensive_pitch_min, v122.defensive_pitch_max) + (v121.defensive_count > 6 and -v121.defensive_state or v121.defensive_state) * v190);
        end;
        if v122.defensive_yaw == "Off" then
            v121.defensive_yaw = v121.yaw_offset;
        elseif v122.defensive_yaw == "Static" then
            v121.defensive_yaw = v122.defensive_yaw_offset;
        elseif v122.defensive_yaw == "Dynamic Sway" then
            local v191 = v122.defensive_yaw_offset * 0.5;
            v121.dynamic_sway = v121.dynamic_sway or 0;
            v121.dynamic_sway_direction = v121.dynamic_sway_direction or 1;
            if math.random() > 0.95 then
                v121.dynamic_sway_direction = v121.dynamic_sway_direction * -1;
            end;
            v121.dynamic_sway = v121.dynamic_sway + v191 * v121.dynamic_sway_direction * 0.1;
            if v191 < v121.dynamic_sway or v121.dynamic_sway < -v191 then
                v121.dynamic_sway_direction = v121.dynamic_sway_direction * -1;
            end;
            v121.defensive_yaw = math.normalize_yaw(v121.yaw_offset + v121.dynamic_sway);
        elseif v122.defensive_yaw == "Erratic Pulse" then
            local l_defensive_yaw_offset_0 = v122.defensive_yaw_offset;
            if math.random() > 0.9 then
                v121.erratic_pulse = math.random(-l_defensive_yaw_offset_0, l_defensive_yaw_offset_0);
            else
                v121.erratic_pulse = 0;
            end;
            v121.defensive_yaw = math.normalize_yaw(v121.yaw_offset + v121.erratic_pulse);
        elseif v122.defensive_yaw == "Jitter" then
            local v193 = {
                [1] = -v122.defensive_yaw_offset, 
                [2] = v122.defensive_yaw_offset
            };
            v121.defensive_yaw = v193[math.random(1, #v193)];
        elseif v122.defensive_yaw == "Sine Wave" then
            local l_defensive_yaw_offset_1 = v122.defensive_yaw_offset;
            local v195 = math.pi * 2 / v121.defensive_length;
            v121.defensive_yaw = v121.yaw_offset + math.sin(v195 * v121.defensive_count) * l_defensive_yaw_offset_1;
        elseif v122.defensive_yaw == "Spin" then
            local v196 = v122.defensive_yaw_offset / v121.defensive_length;
            v121.defensive_yaw = math.normalize_yaw(v196 * 2 - (v121.defensive_state - 1) * v196);
        elseif v122.defensive_yaw == "Reversal Spin" then
            local l_defensive_yaw_offset_2 = v122.defensive_yaw_offset;
            v121.pendulum_spin = v121.pendulum_spin or 0;
            v121.pendulum_spin_direction = v121.pendulum_spin_direction or 1;
            local v198 = l_defensive_yaw_offset_2 / v121.defensive_length;
            v121.pendulum_spin = v121.pendulum_spin + v198 * v121.pendulum_spin_direction;
            if l_defensive_yaw_offset_2 <= math.abs(v121.pendulum_spin) then
                v121.pendulum_spin_direction = v121.pendulum_spin_direction * -1;
            end;
            v121.defensive_yaw = math.normalize_yaw(v121.yaw_offset + v121.pendulum_spin);
        elseif v122.defensive_yaw == "Random" then
            v121.defensive_yaw = math.random(-v122.defensive_yaw_offset / 2, v122.defensive_yaw_offset / 2);
        elseif v122.defensive_yaw == "180Z" then
            v121.defensive_yaw = math.normalize_yaw(v121.yaw_offset + 180);
        end;
        if v121.defensive_enabled and not v121.static_angles then
            v121.yaw_offset = v121.defensive_yaw;
            v121.bodyyaw = v122.defensive_bodyyaw;
            v121.bodyyaw_options = {
                [1] = "Anti Bruteforce", 
                [2] = "Avoid Overlap"
            };
            rage.antiaim:override_hidden_yaw_offset(0);
            if v121.defensive_pitch ~= nil then
                rage.antiaim:override_hidden_pitch(math.clamp(v121.defensive_pitch, -89, 89));
            end;
        end;
    else
        v121.defensive_triggered = false;
        v121.defensive_enabled = false;
        v121.defensive_allowed = false;
        v121.defensive_fluctuate_amount = nil;
    end;
    if v122.bodylean_enable then
        local v199 = v122.bodylean_trigger == "Always";
        if not v199 and v122.bodylean_trigger == "Defensive" then
            v199 = v121.defensive_allowed;
        elseif not v199 and v122.bodylean_trigger == "Fake Lag" then
            v199 = rage.exploit:get() == 0;
        end;
        if v199 then
            v149.view_angles.z = v122.bodylean_amount;
        end;
    end;
    if v121.static_angles then
        v121.yaw_offset = 0;
    end;
    v121.yaw_offset = v121.yaw_offset + v152;
    local l_v121_1 = v121;
    if v152 < 0 then

    end;
    l_v121_1.bodyyaw_inverted = v152 > 0 or v121.bodyyaw_inverted;
    if v23(v28.aa_pitch) ~= v122.pitch then
        v28.aa_pitch:override(v122.pitch);
    end;
    if v23(v28.aa_yaw) ~= "Backward" then
        v28.aa_yaw:override("Backward");
    end;
    if v23(v28.aa_yaw_base) ~= v122.direction then
        v28.aa_yaw_base:override(v122.direction);
    end;
    if v23(v28.aa_yaw_offset) ~= v121.yaw_offset then
        v28.aa_yaw_offset:override(v121.yaw_offset);
    end;
    if v23(v28.aa_yaw_hidden) ~= v121.defensive_allowed then
        v28.aa_yaw_hidden:override(v121.defensive_allowed);
    end;
    if v23(v28.aa_yawmodifier) ~= "Disabled" then
        v28.aa_yawmodifier:override("Disabled");
    end;
    if v23(v28.aa_bodyyaw) ~= v121.bodyyaw then
        v28.aa_bodyyaw:override(v121.bodyyaw);
    end;
    if v23(v28.aa_bodyyaw_inverter) ~= v121.bodyyaw_inverted then
        v28.aa_bodyyaw_inverter:override(v121.bodyyaw_inverted);
    end;
    l_v121_1 = rage.antiaim:get_max_desync();
    if v23(v28.aa_bodyyaw_leftlimit) ~= l_v121_1 / 100 * v121.bodyyaw_left then
        v28.aa_bodyyaw_leftlimit:override(l_v121_1 / 100 * v121.bodyyaw_left);
    end;
    if v23(v28.aa_bodyyaw_rightlimit) ~= l_v121_1 / 100 * v121.bodyyaw_right then
        v28.aa_bodyyaw_rightlimit:override(l_v121_1 / 100 * v121.bodyyaw_right);
    end;
    if v23(v28.aa_bodyyaw_options) ~= v121.bodyyaw_options then
        v28.aa_bodyyaw_options:override(v121.bodyyaw_options);
    end;
    if v23(v28.aa_bodyyaw_freestanding) ~= "Off" then
        v28.aa_bodyyaw_freestanding:override("Off");
    end;
    v28.rage_doubletap_fakelaglimit:override(v121.defensive_triggered and v121.defensive_fluctuate_amount or nil);
    v28.rage_doubletap_lagoptions:override(v121.defensive_allowed and "Always On" or nil);
    v28.rage_hideshots_options:override(v121.defensive_allowed and "Break LC" or nil);
end;
events.createmove:set(function(v202)
    -- upvalues: v120 (ref), v139 (ref), v201 (ref)
    v120(v202);
    v139(v202);
    v201(v202);
end);
local v225 = {
    split = function(v203, v204)
        if not v204 then
            v204 = "%s";
        end;
        local v205 = {};
        for v206, v207 in string.gmatch(v203, "([^" .. v204 .. "]*)(" .. v204 .. "?)") do
            table.insert(v205, v206);
            if v207 == "" then
                return v205;
            end;
        end;
    end, 
    import = function(v208, v209)
        local v210 = json.parse(v209);
        for v211 = 1, #v208 do
            v208[v211]:set(v210[v211]);
        end;
    end, 
    export = function(v212)
        local v213 = {};
        for v214 = 1, #v212 do
            local v215 = v212[v214];
            local v216 = v215:type();
            if v216 == "color_picker" then
                v213[#v213 + 1] = v215:get():to_hex();
            elseif v216 == "selectable" or v216 == "listable" then
                local v217 = v215:list();
                local v218 = {};
                for v219 = 1, #v217 do
                    if v215:get(v217[v219]) then
                        v218[#v218 + 1] = v217[v219];
                    end;
                end;
                v213[#v213 + 1] = v218;
            elseif v216 == "button" or v216 == "label" then
                v213[#v213 + 1] = "";
            elseif v216 == "switch" or v216 == "slider" or v216 == "combo" or v216 == "textbox" or v216 == "list" then
                v213[#v213 + 1] = v215:get();
            end;
        end;
        return json.stringify(v213);
    end, 
    get_selected_name = function(v220)
        return v220.menu.list:list()[v220.menu.list:get()];
    end, 
    get_config_by_name = function(v221, v222)
        for v223 = 1, #v221.config_list do
            local v224 = v221.config_list[v223];
            if v224[1] == v222 then
                return v224[2];
            end;
        end;
        return "";
    end
};
v225.generate_configs = function(v226)
    -- upvalues: v225 (ref)
    local v227 = {};
    for v228 = 1, #v226.presets do
        local v229 = v226.presets[v228];
        v227[#v227 + 1] = v229;
    end;
    local v230 = files.read(v226.path);
    if v230 == nil then
        files.write(v226.path, "");
    elseif v230 ~= "" then
        local v231 = v225.split(v230, "/");
        if v231 ~= nil then
            for v232 = 1, #v231 do
                local v233 = v231[v232];
                v227[#v227 + 1] = v225.split(v233, "#");
            end;
        end;
    end;
    v226.config_list = v227;
end;
v225.generate_names = function(v234)
    local v235 = {};
    for v236 = 1, #v234.config_list do
        local v237 = v234.config_list[v236];
        v235[#v235 + 1] = v237[1];
    end;
    v234.config_names = v235;
end;
v225.write = function(v238)
    local v239 = "";
    for v240 = 1, #v238.config_list do
        local v241 = v238.config_list[v240];
        local v242 = false;
        for v243 = 1, #v238.presets do
            local v244 = v238.presets[v243];
            if v241[1] == v244[1] then
                v242 = true;
                break;
            end;
        end;
        if not v242 then
            local v245;
            if v239 ~= "" or not v239 then
                v245 = v239 .. "/";
            else
                v245 = v239;
            end;
            v239 = v245 .. v241[1] .. "#" .. v241[2];
        end;
    end;
    files.write(v238.path, v239);
end;
v225.update = function(v246)
    -- upvalues: v225 (ref)
    v225.generate_configs(v246);
    v225.generate_names(v246);
    v246.menu.list:update(v246.config_names);
end;
v225.load = function(v247, v248)
    -- upvalues: v225 (ref)
    v225.import(v247.settings, v225.get_config_by_name(v247, v248));
end;
v225.save = function(v249, v250, v251)
    -- upvalues: v225 (ref)
    if v250 == "" or v251 == "" then
        return;
    else
        local v252 = false;
        for v253 = 1, #v249.config_list do
            if v249.config_list[v253][1] == v250 then
                v252 = true;
                v249.config_list[v253][2] = v251;
                break;
            end;
        end;
        if not v252 then
            v249.config_list[#v249.config_list + 1] = {
                [1] = v250, 
                [2] = v251
            };
        end;
        v225.write(v249);
        v225.update(v249);
        local v254 = 0;
        for v255 = 1, #v249.menu.list:list() do
            if v249.menu.list:list()[v255] == v249.menu.name:get() then
                v254 = v255;
                break;
            end;
        end;
        if v254 ~= 0 then
            v249.menu.list:set(v254);
        end;
        return;
    end;
end;
v225.delete = function(v256, v257)
    -- upvalues: v225 (ref)
    local v258 = {};
    for v259 = 1, #v256.config_list do
        local v260 = v256.config_list[v259];
        if v260[1] ~= v257 then
            v258[#v258 + 1] = v260;
        end;
    end;
    v256.config_list = v258;
    v225.write(v256);
    v225.update(v256);
end;
local v261 = {
    metav2 = {
        v35, 
        color(240, 240, 240)
    }, 
    classic = {
        v35, 
        color(255, 70, 70)
    }, 
    balance = {
        v35, 
        color(70, 70, 255)
    }, 
    safety = {
        v35, 
        color(70, 255, 70)
    }, 
    unmatched = {
        v35, 
        color(255, 255, 70)
    }, 
    sine = {
        v35, 
        color(70, 255, 255)
    }, 
    defensive = {
        v35, 
        color(0, 0, 0)
    }
};
local v262 = {
    metav2 = v31.gradient.text(ui.get_icon("fire-flame-curved") .. "    e\226\128\139\226\128\139asy.sync ~ meta V2", false, v261.classic), 
    classic = v31.gradient.text(ui.get_icon("bomb") .. "   e\226\128\139\226\128\139asy.sync ~ classic", false, v261.metav2), 
    balance = v31.gradient.text(ui.get_icon("scale-balanced") .. "  e\226\128\139\226\128\139asy.sync ~ balance", false, v261.balance), 
    safety = v31.gradient.text(ui.get_icon("shield-heart") .. "   e\226\128\139\226\128\139asy.sync ~ safety", false, v261.safety), 
    unmatched = v31.gradient.text(ui.get_icon("worm") .. "   e\226\128\139\226\128\139asy.sync ~ unmatched", false, v261.unmatched), 
    sine = v31.gradient.text(ui.get_icon("wave-sine") .. "   e\226\128\139\226\128\139asy.sync ~ sine", false, v261.sine), 
    defensive = v31.gradient.text(ui.get_icon("rectangles-mixed") .. "    e\226\128\139\226\128\139asy.sync ~ defensive", false, v261.defensive)
};
v225.create = function(v263, v264, v265, v266, v267, v268, v269)
    v264 = "\a" .. v264;
    files.create_folder(v265);
    v265 = v265 .. v266;
    local v270 = {};
    local v271 = {};
    for v272, _ in pairs(v267) do
        v271[#v271 + 1] = v272;
    end;
    table.sort(v271);
    for v274 = 1, #v271 do
        v270[#v270 + 1] = v267[v271[v274]];
    end;
    v267 = v270;
    local _ = v268:label("\a" .. hexx .. "\226\128\162 \aDEFAULT  Builder:");
    return {
        clipboard = v263, 
        accent = v264, 
        path = v265, 
        settings = v267, 
        group = v268, 
        presets = v269, 
        menu = {
            list = v268:list("", {
                [1] = "No configs found"
            }), 
            name = v268:input("", ""), 
            remove = v268:button("  " .. "\a" .. hexx .. ui.get_icon("trash") .. "  \aDEFAULT", nil, true):tooltip("Delete"), 
            save = v268:button("  " .. "\a" .. hexx .. ui.get_icon("floppy-disk") .. "  \aDEFAULT", nil, true):tooltip("Save"), 
            load = v268:button("\a" .. hexx .. "        Load        \aDEFAULT", nil, true), 
            import = v268:button("  " .. "\a" .. hexx .. ui.get_icon("file-import") .. "  \aDEFAULT", nil, true):tooltip("Import"), 
            export = v268:button("  " .. "\a" .. hexx .. ui.get_icon("file-export") .. "  \aDEFAULT", nil, true):tooltip("Export")
        }, 
        config_list = {}, 
        config_names = {}
    };
end;
v225.setup = function(v276)
    -- upvalues: v225 (ref)
    v225.update(v276);
    v276.menu.list:set_callback(function(_)
        -- upvalues: v276 (ref), v225 (ref)
        v276.menu.name:set(v276.menu.list:list()[v276.menu.list:get()]);
        v225.update(v276);
    end);
    v276.menu.load:set_callback(function()
        -- upvalues: v225 (ref), v276 (ref)
        v225.load(v276, v225.get_selected_name(v276));
        common.add_notify("\a" .. hexx .. "[CONFIG SYSTEM]", "Successfully loaded!");
    end);
    v276.menu.save:set_callback(function()
        -- upvalues: v225 (ref), v276 (ref)
        v225.save(v276, v276.menu.name:get(), v225.export(v276.settings));
        common.add_notify("\a" .. hexx .. "[CONFIG SYSTEM]", "Successfully saved!");
    end);
    v276.menu.remove:set_callback(function()
        -- upvalues: v225 (ref), v276 (ref)
        v225.delete(v276, v225.get_selected_name(v276));
        common.add_notify("\a" .. hexx .. "[CONFIG SYSTEM]", "Successfully removed!");
    end);
    v276.menu.import:set_callback(function()
        -- upvalues: v225 (ref), v276 (ref)
        local v278 = v225.split(v276.clipboard.get(), "#");
        v225.save(v276, v278[1], v278[2]);
        common.add_notify("\a" .. hexx .. "[CONFIG SYSTEM]", "Successfully imported!");
    end);
    v276.menu.export:set_callback(function()
        -- upvalues: v276 (ref), v225 (ref)
        v276.clipboard.set(v225.get_selected_name(v276) .. "#" .. v225.get_config_by_name(v276, v225.get_selected_name(v276)));
        common.add_notify("\a" .. hexx .. "[CONFIG SYSTEM]", "Successfully exported!");
    end);
end;
local v279 = v225.create(require("neverlose/clipboard"), "40516DFF", "nl\\easysync\\", "configs.txt", v41, v1.home_configs, {
    [1] = {
        [1] = nil, 
        [2] = "[\"\",0.0,false,\"Always\",\"Disabled\",100.0,30.0,100.0,30.0,100.0,\"Left\",\"Hide\",false,false,0.0,false,1.0,\"Off\",0.0,0.0,0.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"Local View\",false,false,false,\"Disabled\",\"Static\",100.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,0.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Disabled\",100.0,30.0,100.0,30.0,100.0,\"Left\",\"Hide\",false,false,0.0,false,1.0,\"Off\",0.0,0.0,0.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"Local View\",false,false,false,\"Disabled\",\"Static\",100.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,0.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Disabled\",100.0,30.0,100.0,30.0,100.0,\"Left\",\"Hide\",false,false,0.0,false,1.0,\"Off\",0.0,0.0,0.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"Local View\",false,false,false,\"Disabled\",\"Static\",100.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,0.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Disabled\",100.0,30.0,100.0,30.0,100.0,\"Left\",\"Hide\",false,false,0.0,false,1.0,\"Off\",0.0,0.0,0.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"Local View\",false,false,false,\"Disabled\",\"Static\",100.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,0.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Disabled\",100.0,30.0,100.0,30.0,100.0,\"Left\",\"Hide\",false,false,0.0,false,1.0,\"Off\",0.0,0.0,0.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"Local View\",false,false,false,\"Disabled\",\"Static\",100.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,0.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Disabled\",100.0,30.0,100.0,30.0,100.0,\"Left\",\"Hide\",false,false,0.0,false,1.0,\"Off\",0.0,0.0,0.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"Local View\",false,false,false,\"Disabled\",\"Static\",100.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,0.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Disabled\",100.0,30.0,100.0,30.0,100.0,\"Left\",\"Hide\",false,false,0.0,false,1.0,\"Off\",0.0,0.0,0.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"Local View\",\"\",false,false,\"Disabled\",\"Static\",100.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,0.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Disabled\",100.0,30.0,100.0,30.0,100.0,\"Left\",\"Hide\",false,false,0.0,false,1.0,\"Off\",0.0,0.0,0.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"Local View\",false,false,false,\"Disabled\",\"Static\",100.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,0.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Disabled\",100.0,30.0,100.0,30.0,100.0,\"Left\",\"Hide\",false,false,0.0,false,1.0,\"Off\",0.0,0.0,0.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"Local View\",false,false,false,\"Disabled\",\"Static\",100.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,0.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Disabled\",100.0,30.0,100.0,30.0,100.0,\"Left\",\"Hide\",false,false,0.0,false,1.0,\"Off\",0.0,0.0,0.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"Local View\",false,false,false,\"Disabled\",\"Static\",100.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,0.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Disabled\",100.0,30.0,100.0,30.0,100.0,\"Left\",\"Hide\",false,false,0.0,false,1.0,\"Off\",0.0,0.0,0.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"Local View\",false,false,false,\"Disabled\",\"Static\",100.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,0.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Disabled\",100.0,30.0,100.0,30.0,100.0,\"Left\",\"Hide\",false,false,0.0,false,1.0,\"Off\",0.0,0.0,0.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"Local View\",false,false,false,\"Disabled\",\"Static\",100.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,0.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Disabled\",100.0,30.0,100.0,30.0,100.0,\"Left\",\"Hide\",false,false,0.0,false,1.0,\"Off\",0.0,0.0,0.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"Local View\",false,false,false,\"Disabled\",\"Static\",100.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,0.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Disabled\",100.0,30.0,100.0,30.0,100.0,\"Left\",\"Hide\",false,false,0.0,false,1.0,\"Off\",0.0,0.0,0.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"Local View\",false,false,false,\"Disabled\",\"Static\",100.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,0.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Disabled\",100.0,30.0,100.0,30.0,100.0,\"Left\",\"Hide\",false,false,0.0,false,1.0,\"Off\",0.0,0.0,0.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"Local View\",false,false,false,\"Disabled\",\"Static\",100.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,0.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Disabled\",100.0,30.0,100.0,30.0,100.0,\"Left\",\"Hide\",false,false,0.0,false,1.0,\"Off\",0.0,0.0,0.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"Local View\",false,false,false,\"Disabled\",\"Static\",100.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,0.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Disabled\",100.0,30.0,100.0,30.0,100.0,\"Left\",\"Hide\",false,false,0.0,false,1.0,\"Off\",0.0,0.0,0.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"Local View\",\"\",false,false,\"Disabled\",\"Static\",100.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,0.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Disabled\",100.0,30.0,100.0,30.0,100.0,\"Left\",\"Hide\",false,false,0.0,false,1.0,\"Off\",0.0,0.0,0.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"Local View\",false,false,false,\"Disabled\",\"Static\",100.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,0.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Disabled\",100.0,30.0,100.0,30.0,100.0,\"Left\",\"Hide\",false,false,0.0,false,1.0,\"Off\",0.0,0.0,0.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"Local View\",false,false,false,\"Disabled\",\"Static\",100.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,0.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Disabled\",100.0,30.0,100.0,30.0,100.0,\"Left\",\"Hide\",false,false,0.0,false,1.0,\"Off\",0.0,0.0,0.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"Local View\",false,false,false,\"Disabled\",\"Static\",100.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,0.0,0.0,\"\",0.0,100.0,[],\"Disabled\",\"Global\",\"Terrorist\",[],false]", 
        [1] = ui.get_icon("page") .. "   Empty"
    }, 
    [2] = {
        [1] = nil, 
        [2] = "[\"\",0.0,false,\"Always\",\"Left & Right\",100.0,30.0,100.0,30.0,100.0,\"Left\",\"Hide\",false,false,0.0,false,1.0,\"Off\",0.0,0.0,0.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Left & Right\",100.0,58.0,0.0,0.0,1.0,1.0,1.0,0.0,-36.0,0.0,-12.0,0.0,13.0,31.0,-130.0,-139.0,100.0,180.0,36.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Left & Right\",100.0,30.0,100.0,30.0,100.0,\"Left\",\"Hide\",true,false,0.0,true,1.0,\"Static\",-46.0,-46.0,-46.0,0.0,100.0,\"Always\",\"Random\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Left & Right\",100.0,43.0,0.0,0.0,1.0,1.0,1.0,0.0,-43.0,-36.0,26.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,33.0,30.0,\"\",0.0,71.0,0.0,false,\"Always\",\"Left & Right\",100.0,30.0,100.0,30.0,100.0,\"Left\",\"Hide\",false,false,0.0,false,1.0,\"Off\",0.0,0.0,0.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Left & Right\",100.0,58.0,0.0,0.0,1.0,1.0,1.0,0.0,-36.0,0.0,-12.0,0.0,13.0,31.0,-130.0,-139.0,100.0,180.0,36.0,0.0,\"\",0.0,100.0,180.0,false,\"Always\",\"Left & Right\",100.0,30.0,100.0,30.0,100.0,\"Left\",\"Hide\",false,false,0.0,false,1.0,\"Off\",0.0,0.0,0.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Left & Right\",100.0,0.0,0.0,0.0,1.0,3.0,5.0,72.0,-36.0,0.0,21.0,0.0,39.0,92.0,-105.0,-91.0,100.0,43.0,36.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Left & Right\",100.0,30.0,100.0,30.0,100.0,\"Left\",\"Hide\",true,false,0.0,false,1.0,\"Sway\",-66.0,89.0,33.0,3.0,68.0,\"Always\",\"Random\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Left & Right\",100.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,-34.0,58.0,0.0,8.0,1.0,1.0,-1.0,-1.0,100.0,0.0,34.0,-43.0,\"\",0.0,55.0,0.0,false,\"Always\",\"Left & Right\",100.0,30.0,100.0,30.0,100.0,\"Left\",\"Hide\",false,false,0.0,false,1.0,\"Off\",0.0,0.0,0.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Random\",70.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,-30.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,40.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Left & Right\",100.0,30.0,100.0,30.0,100.0,\"Left\",\"Hide\",false,false,0.0,false,1.0,\"Off\",0.0,0.0,0.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"At Target\",\"\",false,false,\"Down\",\"Left & Right\",100.0,35.0,0.0,0.0,1.0,1.0,1.0,0.0,-34.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,34.0,0.0,\"\",0.0,100.0,180.0,false,\"Always\",\"Left & Right\",100.0,30.0,100.0,30.0,100.0,\"Left\",\"Hide\",false,false,0.0,false,1.0,\"Off\",0.0,0.0,0.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Left & Right\",100.0,0.0,0.0,0.0,1.0,3.0,5.0,72.0,-36.0,0.0,21.0,0.0,39.0,92.0,-105.0,-91.0,100.0,43.0,36.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Left & Right\",100.0,30.0,100.0,30.0,100.0,\"Left\",\"Hide\",false,false,0.0,true,1.0,\"Static\",-33.0,10.0,-46.0,2.0,100.0,\"Always\",\"Random\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Left & Right\",100.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,0.0,-34.0,49.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,0.0,0.0,\"\",23.0,100.0,0.0,false,\"Always\",\"Left & Right\",100.0,30.0,100.0,30.0,99.0,\"Left\",\"Hide\",true,false,0.0,false,1.0,\"Random\",-65.0,-89.0,0.0,3.0,70.0,\"Always\",\"Random\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Left & Right\",100.0,-16.0,0.0,0.0,1.0,1.0,1.0,0.0,-38.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,38.0,0.0,\"\",40.0,100.0,0.0,false,\"Always\",\"Left & Right\",100.0,30.0,100.0,30.0,100.0,\"Left\",\"Hide\",false,false,0.0,false,1.0,\"Off\",0.0,0.0,0.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Left & Right\",100.0,58.0,0.0,0.0,1.0,1.0,1.0,0.0,-36.0,0.0,-12.0,0.0,13.0,31.0,-130.0,-139.0,100.0,180.0,36.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Left & Right\",100.0,30.0,100.0,30.0,100.0,\"Left\",\"Hide\",true,false,0.0,true,1.0,\"Static\",-46.0,-46.0,-46.0,0.0,100.0,\"Always\",\"Random\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Left & Right\",100.0,43.0,0.0,0.0,1.0,1.0,1.0,0.0,-43.0,-36.0,26.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,33.0,30.0,\"\",0.0,71.0,0.0,false,\"Always\",\"Left & Right\",100.0,30.0,100.0,30.0,100.0,\"Left\",\"Hide\",false,false,0.0,false,1.0,\"Off\",0.0,0.0,0.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Left & Right\",100.0,58.0,0.0,0.0,1.0,1.0,1.0,0.0,-36.0,0.0,-12.0,0.0,13.0,31.0,-130.0,-139.0,100.0,180.0,36.0,0.0,\"\",0.0,100.0,180.0,false,\"Always\",\"Left & Right\",100.0,30.0,100.0,30.0,100.0,\"Left\",\"Hide\",false,false,0.0,false,1.0,\"Off\",0.0,0.0,0.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Left & Right\",100.0,0.0,0.0,0.0,1.0,3.0,5.0,72.0,-36.0,0.0,21.0,0.0,39.0,92.0,-105.0,-91.0,100.0,43.0,36.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Left & Right\",100.0,30.0,100.0,30.0,100.0,\"Left\",\"Hide\",true,false,0.0,false,1.0,\"Sway\",-66.0,89.0,33.0,3.0,68.0,\"Always\",\"Random\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Left & Right\",100.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,-34.0,58.0,0.0,8.0,1.0,1.0,-1.0,-1.0,100.0,0.0,34.0,-43.0,\"\",0.0,55.0,0.0,false,\"Always\",\"Left & Right\",100.0,30.0,100.0,30.0,100.0,\"Left\",\"Hide\",false,false,0.0,false,1.0,\"Off\",0.0,0.0,0.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Random\",70.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,-30.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,40.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Left & Right\",100.0,30.0,100.0,30.0,100.0,\"Left\",\"Hide\",false,false,0.0,false,1.0,\"Off\",0.0,0.0,0.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"At Target\",\"\",false,false,\"Down\",\"Random\",70.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,-30.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,40.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Left & Right\",100.0,30.0,100.0,30.0,99.0,\"Left\",\"Hide\",true,false,0.0,false,1.0,\"Random\",-65.0,-89.0,0.0,3.0,70.0,\"Always\",\"Random\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Left & Right\",100.0,-16.0,0.0,0.0,1.0,1.0,1.0,0.0,-38.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,38.0,0.0,\"\",40.0,100.0,0.0,false,\"Always\",\"Left & Right\",100.0,30.0,100.0,30.0,100.0,\"Left\",\"Hide\",false,false,0.0,false,1.0,\"Off\",0.0,0.0,0.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Left & Right\",100.0,35.0,0.0,0.0,1.0,1.0,1.0,0.0,-34.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,34.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Left & Right\",100.0,30.0,100.0,30.0,100.0,\"Left\",\"Hide\",true,false,0.0,false,1.0,\"Sway\",-66.0,89.0,33.0,3.0,68.0,\"Always\",\"Random\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Left & Right\",100.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,-34.0,58.0,0.0,8.0,1.0,1.0,-1.0,-1.0,100.0,0.0,34.0,-43.0,\"\",0.0,55.0,[],\"Disabled\",\"Fake Duck\",\"Terrorist\",[\"Manual\",\"Freestand\"],false]", 
        [1] = v262.balance
    }, 
    [3] = {
        [1] = nil, 
        [2] = "[\"\",0.0,false,\"Always\",\"Left & Right\",68.0,30.0,37.0,30.0,68.0,\"Left\",\"Hide\",false,false,0.0,false,1.0,\"Off\",0.0,0.0,0.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Left & Right\",100.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,-28.0,0.0,0.0,30.0,1.0,1.0,-1.0,-1.0,100.0,0.0,28.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Left & Right\",100.0,30.0,100.0,30.0,100.0,\"Left\",\"Hide\",false,false,0.0,false,1.0,\"Off\",0.0,0.0,0.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Random\",70.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,-30.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,40.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Left & Right\",100.0,30.0,100.0,30.0,100.0,\"Left\",\"Hide\",false,false,0.0,false,1.0,\"Off\",0.0,0.0,0.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Random\",70.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,-30.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,40.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Left & Right\",82.0,30.0,100.0,30.0,100.0,\"Left\",\"Hide\",true,false,0.0,false,5.0,\"Static\",0.0,0.0,25.0,0.0,100.0,\"Always\",\"180Z\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Left & Right\",84.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,-16.0,0.0,0.0,16.0,1.0,1.0,-1.0,-1.0,100.0,0.0,26.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Left & Right\",100.0,30.0,100.0,30.0,100.0,\"Left\",\"Hide\",false,false,0.0,false,1.0,\"Off\",0.0,0.0,0.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Random\",70.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,-30.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,40.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Disabled\",100.0,30.0,100.0,30.0,100.0,\"Left\",\"Hide\",false,false,0.0,false,1.0,\"Off\",0.0,0.0,0.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Sway\",100.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,-30.0,-30.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,40.0,49.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Disabled\",100.0,30.0,100.0,30.0,100.0,\"Left\",\"Hide\",false,false,0.0,false,1.0,\"Off\",0.0,0.0,0.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"Local View\",\"\",false,false,\"Disabled\",\"Static\",100.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,0.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Left & Right\",57.0,30.0,73.0,30.0,100.0,\"Left\",\"Hide\",false,false,0.0,false,1.0,\"Off\",0.0,0.0,0.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Left & Right\",67.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,-8.0,0.0,0.0,21.0,1.0,1.0,-1.0,-1.0,100.0,0.0,18.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Disabled\",100.0,30.0,100.0,30.0,100.0,\"Left\",\"Hide\",false,false,0.0,false,1.0,\"Off\",0.0,0.0,0.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Left & Right\",100.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,-30.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,7.0,0.0,\"\",0.0,100.0,0.0,false,\"Defensive\",\"Left & Right\",100.0,30.0,100.0,30.0,100.0,\"Left\",\"Expose\",false,false,0.0,false,1.0,\"Off\",0.0,0.0,0.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Left & Right\",100.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,-26.0,0.0,0.0,12.0,1.0,1.0,-1.0,-1.0,100.0,0.0,21.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Disabled\",100.0,30.0,100.0,30.0,100.0,\"Left\",\"Hide\",false,false,0.0,false,1.0,\"Off\",0.0,0.0,0.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Left & Right\",100.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,-30.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,7.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Left & Right\",82.0,30.0,100.0,30.0,100.0,\"Left\",\"Hide\",true,false,0.0,false,5.0,\"Static\",0.0,0.0,25.0,0.0,100.0,\"Always\",\"180Z\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Left & Right\",84.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,-16.0,0.0,0.0,16.0,1.0,1.0,-1.0,-1.0,100.0,0.0,26.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Left & Right\",68.0,30.0,37.0,30.0,68.0,\"Left\",\"Hide\",false,false,0.0,false,1.0,\"Off\",0.0,0.0,0.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Left & Right\",100.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,-28.0,0.0,0.0,30.0,1.0,1.0,-1.0,-1.0,100.0,0.0,28.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Left & Right\",57.0,30.0,73.0,30.0,100.0,\"Left\",\"Hide\",false,false,0.0,false,1.0,\"Off\",0.0,0.0,0.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Left & Right\",67.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,-8.0,0.0,0.0,21.0,1.0,1.0,-1.0,-1.0,100.0,0.0,18.0,0.0,\"\",0.0,100.0,0.0,false,\"Defensive\",\"Left & Right\",100.0,30.0,100.0,30.0,100.0,\"Left\",\"Expose\",false,false,0.0,false,1.0,\"Off\",0.0,0.0,0.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"At Target\",false,false,false,\"Down\",\"Left & Right\",100.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,-26.0,0.0,0.0,12.0,1.0,1.0,-1.0,-1.0,100.0,0.0,21.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Disabled\",100.0,30.0,100.0,30.0,100.0,\"Left\",\"Hide\",false,false,0.0,false,1.0,\"Off\",0.0,0.0,0.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Sway\",100.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,-30.0,-30.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,40.0,49.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Disabled\",100.0,30.0,100.0,30.0,100.0,\"Left\",\"Hide\",false,false,0.0,false,1.0,\"Off\",0.0,0.0,0.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"Local View\",\"\",false,false,\"Disabled\",\"Static\",100.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,0.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Left & Right\",40.0,30.0,39.0,30.0,70.0,\"Left\",\"Hide\",false,false,0.0,false,1.0,\"Off\",0.0,0.0,0.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Left & Right\",100.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,-23.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,26.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Disabled\",100.0,30.0,100.0,30.0,100.0,\"Left\",\"Hide\",false,false,0.0,false,1.0,\"Off\",0.0,0.0,0.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"Local View\",false,false,false,\"Disabled\",\"Static\",100.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,0.0,0.0,\"\",0.0,100.0,0.0,false,\"Defensive\",\"Left & Right\",100.0,30.0,100.0,30.0,100.0,\"Left\",\"Expose\",false,false,0.0,false,1.0,\"Off\",0.0,0.0,0.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Left & Right\",100.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,-26.0,0.0,0.0,12.0,1.0,1.0,-1.0,-1.0,100.0,0.0,21.0,0.0,\"\",0.0,100.0,[\"Holding Knife\",\"On Peek\"],\"Disabled\",\"Fake Lag\",\"Terrorist\",[\"Manual\",\"Freestand\"],true]", 
        [1] = v262.classic
    }, 
    [4] = {
        [1] = nil, 
        [2] = "[\"\",0.0,false,\"Always\",\"Left & Right\",25.0,30.0,75.0,30.0,58.0,\"Left\",\"Expose\",true,false,0.0,true,1.0,\"Static\",0.0,0.0,-89.0,0.0,75.0,\"Always\",\"180Z\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Multi-Freq. Sine\",100.0,0.0,0.0,0.0,3.0,2.0,5.0,-43.0,0.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,0.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Left & Right\",67.0,30.0,27.0,30.0,100.0,\"Left\",\"Hide\",false,false,0.0,true,1.0,\"Static\",0.0,0.0,-89.0,0.0,75.0,\"Always\",\"180Z\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Left & Right\",69.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,-28.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,38.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Left & Right\",25.0,30.0,75.0,30.0,58.0,\"Left\",\"Expose\",true,false,0.0,true,1.0,\"Static\",0.0,0.0,-89.0,0.0,75.0,\"Always\",\"180Z\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Multi-Freq. Sine\",100.0,0.0,0.0,0.0,3.0,2.0,5.0,-43.0,0.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,0.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Left & Right\",67.0,30.0,27.0,30.0,100.0,\"Left\",\"Hide\",false,false,0.0,true,1.0,\"Static\",0.0,0.0,-89.0,0.0,75.0,\"Always\",\"180Z\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Left & Right\",69.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,-28.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,38.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Left & Right\",66.0,30.0,30.0,30.0,27.0,\"Left\",\"Expose\",false,false,0.0,true,1.0,\"Static\",0.0,0.0,89.0,0.0,70.0,\"Always\",\"Spin\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Sine Decaying\",70.0,20.0,0.0,0.0,1.0,1.0,1.0,0.0,-26.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,16.0,0.0,\"\",-30.0,100.0,0.0,false,\"Always\",\"Left & Right\",26.0,30.0,58.0,30.0,78.0,\"Left\",\"Expose\",false,false,0.0,false,1.0,\"Off\",0.0,0.0,0.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Sine Wave\",100.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,0.0,0.0,\"\",20.0,100.0,0.0,false,\"Always\",\"Random\",34.0,30.0,66.0,30.0,48.0,\"Left\",\"Hide\",false,false,0.0,true,1.0,\"Static\",0.0,0.0,-89.0,0.0,100.0,\"Always\",\"Spin\",360.0,5.0,\"At Target\",\"\",false,false,\"Down\",\"Multi-Freq. Sine\",100.0,0.0,0.0,0.0,1.0,2.0,5.0,-28.0,0.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,0.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Left & Right\",67.0,30.0,30.0,30.0,69.0,\"Left\",\"Hide\",false,false,0.0,true,1.0,\"Static\",0.0,0.0,-89.0,0.0,77.0,\"Always\",\"Spin\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Multi-Freq. Sine\",100.0,0.0,0.0,0.0,1.0,2.0,5.0,-58.0,0.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,0.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Random\",34.0,30.0,66.0,30.0,48.0,\"Left\",\"Hide\",false,false,0.0,true,1.0,\"Static\",0.0,0.0,-89.0,0.0,100.0,\"Always\",\"Spin\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Multi-Freq. Sine\",100.0,0.0,0.0,0.0,1.0,2.0,5.0,-28.0,0.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,0.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Left & Right\",36.0,30.0,75.0,30.0,100.0,\"Left\",\"Expose\",true,false,0.0,true,1.0,\"Static\",0.0,0.0,-89.0,0.0,70.0,\"On Peek\",\"180Z\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Left & Right\",70.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,8.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,-10.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Left & Right\",25.0,30.0,75.0,30.0,58.0,\"Left\",\"Expose\",true,false,0.0,true,1.0,\"Static\",0.0,0.0,-89.0,0.0,75.0,\"Always\",\"180Z\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Multi-Freq. Sine\",100.0,0.0,0.0,0.0,3.0,2.0,5.0,-43.0,0.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,0.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Left & Right\",67.0,30.0,27.0,30.0,100.0,\"Left\",\"Hide\",false,false,0.0,true,1.0,\"Static\",0.0,0.0,-89.0,0.0,75.0,\"Always\",\"180Z\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Left & Right\",69.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,-28.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,38.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Left & Right\",25.0,30.0,75.0,30.0,58.0,\"Left\",\"Expose\",true,false,0.0,true,1.0,\"Static\",0.0,0.0,-89.0,0.0,75.0,\"Always\",\"180Z\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Multi-Freq. Sine\",100.0,0.0,0.0,0.0,3.0,2.0,5.0,-43.0,0.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,0.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Left & Right\",67.0,30.0,30.0,30.0,69.0,\"Left\",\"Hide\",false,false,0.0,true,1.0,\"Static\",0.0,0.0,-89.0,0.0,77.0,\"Always\",\"Spin\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Multi-Freq. Sine\",100.0,0.0,0.0,0.0,1.0,2.0,5.0,-58.0,0.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,0.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Left & Right\",66.0,30.0,30.0,30.0,27.0,\"Left\",\"Expose\",false,false,0.0,true,1.0,\"Static\",0.0,0.0,89.0,0.0,70.0,\"Always\",\"Spin\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Sine Decaying\",70.0,20.0,0.0,0.0,1.0,1.0,1.0,0.0,-26.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,16.0,0.0,\"\",-30.0,100.0,0.0,false,\"Always\",\"Left & Right\",26.0,30.0,58.0,30.0,78.0,\"Left\",\"Expose\",false,false,0.0,false,1.0,\"Off\",0.0,0.0,0.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Sine Wave\",100.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,0.0,0.0,\"\",20.0,100.0,0.0,false,\"Always\",\"Disabled\",100.0,30.0,100.0,30.0,100.0,\"Left\",\"Hide\",false,false,0.0,false,1.0,\"Off\",0.0,0.0,0.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"Local View\",\"\",false,false,\"Disabled\",\"Static\",100.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,0.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Left & Right\",36.0,30.0,75.0,30.0,100.0,\"Left\",\"Expose\",true,false,0.0,true,1.0,\"Static\",0.0,0.0,-89.0,0.0,70.0,\"On Peek\",\"180Z\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Left & Right\",70.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,8.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,-10.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Random\",34.0,30.0,66.0,30.0,48.0,\"Left\",\"Hide\",false,false,0.0,true,1.0,\"Static\",0.0,0.0,-89.0,0.0,100.0,\"Always\",\"Spin\",360.0,3.0,\"At Target\",true,false,false,\"Down\",\"Multi-Freq. Sine\",100.0,0.0,0.0,0.0,1.0,2.0,5.0,-28.0,0.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,0.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Left & Right\",40.0,30.0,75.0,30.0,100.0,\"Left\",\"Expose\",false,false,0.0,true,1.0,\"Static\",0.0,0.0,89.0,0.0,70.0,\"Always\",\"Spin\",360.0,1.0,\"At Target\",true,false,false,\"Down\",\"Left & Right\",70.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,18.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,-8.0,0.0,\"\",0.0,100.0,[\"Holding Knife\"],\"Disabled\",\"Standing\",\"Terrorist\",[\"Manual\"],false]", 
        [1] = v262.metav2
    }, 
    [5] = {
        [1] = nil, 
        [2] = "[\"\",0.0,false,\"Always\",\"Left & Right\",100.0,30.0,100.0,30.0,100.0,\"Left\",\"Hide\",true,false,0.0,true,1.0,\"Static\",0.0,0.0,0.0,0.0,100.0,\"Always\",\"Spin\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Left & Right\",100.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,-38.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,52.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Left & Right\",100.0,30.0,100.0,30.0,100.0,\"Left\",\"Hide\",false,false,0.0,false,1.0,\"Off\",0.0,0.0,0.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Left & Right\",100.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,-34.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,40.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Left & Right\",100.0,30.0,100.0,30.0,100.0,\"Left\",\"Hide\",false,false,0.0,false,1.0,\"Off\",0.0,0.0,0.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Left & Right\",100.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,-34.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,40.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Static\",100.0,30.0,65.0,30.0,100.0,\"Right\",\"Hide\",false,false,0.0,true,1.0,\"Static\",0.0,0.0,-70.0,0.0,100.0,\"Always\",\"Spin\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Left & Right\",100.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,8.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,24.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Left & Right\",100.0,30.0,100.0,30.0,100.0,\"Left\",\"Hide\",false,false,0.0,false,1.0,\"Off\",0.0,0.0,0.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Left & Right\",100.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,-34.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,40.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Left & Right\",100.0,30.0,100.0,30.0,100.0,\"Left\",\"Hide\",false,false,0.0,false,1.0,\"Off\",0.0,0.0,0.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Left & Right\",100.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,-34.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,40.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Left & Right\",100.0,30.0,100.0,30.0,100.0,\"Left\",\"Hide\",false,false,0.0,false,1.0,\"Off\",0.0,0.0,0.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"At Target\",\"\",false,false,\"Down\",\"Left & Right\",100.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,-34.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,40.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Left & Right\",100.0,30.0,100.0,30.0,100.0,\"Left\",\"Hide\",true,false,0.0,true,1.0,\"Static\",0.0,0.0,-70.0,1.0,50.0,\"Always\",\"Random\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Left & Right\",100.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,-34.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,40.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Left & Right\",100.0,30.0,100.0,30.0,100.0,\"Left\",\"Hide\",false,false,0.0,true,1.0,\"Static\",0.0,0.0,-70.0,0.0,100.0,\"Always\",\"Spin\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Random\",100.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,-26.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,32.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Left & Right\",100.0,30.0,100.0,30.0,100.0,\"Left\",\"Hide\",true,false,0.0,true,1.0,\"Static\",0.0,0.0,-70.0,1.0,50.0,\"Always\",\"Random\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Left & Right\",100.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,-34.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,40.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Left & Right\",100.0,30.0,100.0,30.0,100.0,\"Left\",\"Hide\",false,false,0.0,true,1.0,\"Static\",0.0,0.0,-70.0,0.0,100.0,\"Always\",\"Spin\",360.0,1.0,\"At Target\",true,false,false,\"Down\",\"Random\",100.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,-26.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,32.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Static\",100.0,30.0,65.0,30.0,100.0,\"Right\",\"Hide\",false,false,0.0,true,1.0,\"Static\",0.0,0.0,-70.0,0.0,100.0,\"Always\",\"Spin\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Left & Right\",100.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,8.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,24.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Left & Right\",100.0,30.0,100.0,30.0,100.0,\"Left\",\"Hide\",true,false,0.0,true,1.0,\"Static\",0.0,0.0,0.0,0.0,100.0,\"Always\",\"Spin\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Left & Right\",100.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,-38.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,52.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Left & Right\",100.0,30.0,100.0,30.0,100.0,\"Left\",\"Hide\",true,false,0.0,true,1.0,\"Static\",0.0,0.0,0.0,0.0,100.0,\"Always\",\"Spin\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Left & Right\",100.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,-38.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,52.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Left & Right\",100.0,30.0,100.0,30.0,100.0,\"Left\",\"Hide\",false,false,0.0,false,1.0,\"Off\",0.0,0.0,0.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"Local View\",true,false,false,\"Down\",\"Left & Right\",100.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,-34.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,40.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Left & Right\",100.0,30.0,100.0,30.0,100.0,\"Left\",\"Hide\",false,false,0.0,false,1.0,\"Off\",0.0,0.0,0.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Left & Right\",100.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,-34.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,40.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Left & Right\",100.0,30.0,100.0,30.0,100.0,\"Left\",\"Hide\",false,false,0.0,false,1.0,\"Off\",0.0,0.0,0.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"At Target\",\"\",false,false,\"Down\",\"Left & Right\",100.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,-34.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,40.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Left & Right\",100.0,30.0,100.0,30.0,100.0,\"Left\",\"Hide\",true,false,0.0,true,1.0,\"Static\",0.0,0.0,-70.0,1.0,50.0,\"Always\",\"Random\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Left & Right\",100.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,-34.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,40.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Left & Right\",100.0,30.0,100.0,30.0,100.0,\"Left\",\"Hide\",false,false,0.0,false,1.0,\"Off\",0.0,0.0,0.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Left & Right\",100.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,-34.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,40.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Left & Right\",100.0,30.0,100.0,30.0,100.0,\"Left\",\"Hide\",false,false,0.0,false,1.0,\"Off\",0.0,0.0,0.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"Local View\",true,false,false,\"Down\",\"Left & Right\",100.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,-34.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,40.0,0.0,\"\",0.0,100.0,[\"Holding Knife\",\"On Peek\"],\"Disabled\",\"Air\",\"Terrorist\",[\"Manual\",\"Freestand\"],false]", 
        [1] = v262.safety
    }, 
    [6] = {
        [1] = nil, 
        [2] = "[\"\",0.0,false,\"Always\",\"Left & Right\",94.0,30.0,76.0,30.0,67.0,\"Left\",\"Hide\",true,false,0.0,false,1.0,\"Static\",-20.0,30.0,89.0,0.0,100.0,\"Always\",\"Spin\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Left & Right\",89.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,12.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,-8.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Left & Right\",77.0,30.0,54.0,30.0,34.0,\"Left\",\"Hide\",true,false,0.0,false,1.0,\"Static\",15.0,-15.0,89.0,0.0,100.0,\"Always\",\"Spin\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Left & Right\",41.0,-34.0,0.0,0.0,1.0,1.0,1.0,0.0,34.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,-28.0,0.0,\"\",45.0,100.0,0.0,false,\"Always\",\"Left & Right\",23.0,30.0,69.0,30.0,48.0,\"Left\",\"Hide\",true,false,0.0,false,1.0,\"Static\",0.0,0.0,-89.0,0.0,100.0,\"Always\",\"Jitter\",160.0,5.0,\"At Target\",true,false,false,\"Down\",\"Left & Right\",77.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,34.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,-28.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Left & Right\",29.0,30.0,76.0,30.0,55.0,\"Left\",\"Hide\",true,false,0.0,false,1.0,\"Static\",0.0,0.0,89.0,0.0,100.0,\"Always\",\"Spin\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Left & Right\",55.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,34.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,-21.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Avoid Overlap\",76.0,30.0,67.0,30.0,56.0,\"Left\",\"Hide\",false,false,0.0,false,1.0,\"Off\",0.0,0.0,0.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Sine Decaying\",100.0,-28.0,0.0,0.0,1.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,0.0,0.0,\"\",30.0,100.0,0.0,false,\"Always\",\"Left & Right\",25.0,30.0,74.0,30.0,78.0,\"Left\",\"Hide\",false,false,0.0,false,1.0,\"Off\",0.0,0.0,0.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Sine Decaying\",100.0,41.0,0.0,0.0,1.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,27.0,59.0,-47.0,-31.0,74.0,63.0,0.0,0.0,\"\",-38.0,100.0,0.0,false,\"Always\",\"Disabled\",100.0,30.0,100.0,30.0,100.0,\"Left\",\"Hide\",false,false,0.0,false,1.0,\"Off\",0.0,0.0,0.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"Local View\",\"\",false,false,\"Disabled\",\"Static\",100.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,0.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Left & Right\",29.0,30.0,78.0,30.0,100.0,\"Left\",\"Hide\",true,false,0.0,false,1.0,\"Static\",0.0,0.0,-89.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Left & Right\",55.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,34.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,-21.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Left & Right\",34.0,30.0,88.0,30.0,59.0,\"Left\",\"Hide\",true,false,0.0,false,1.0,\"Static\",0.0,0.0,-89.0,0.0,89.0,\"Always\",\"Spin\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Sine Decaying\",100.0,33.0,0.0,0.0,1.0,2.0,4.0,63.0,0.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,0.0,0.0,\"\",-22.0,100.0,0.0,false,\"Always\",\"Left & Right\",34.0,30.0,78.0,30.0,55.0,\"Left\",\"Hide\",true,false,0.0,false,1.0,\"Static\",0.0,0.0,89.0,0.0,85.0,\"Always\",\"Spin\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Left & Right\",50.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,34.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,-21.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Left & Right\",94.0,30.0,76.0,30.0,67.0,\"Left\",\"Hide\",true,false,0.0,false,1.0,\"Static\",-20.0,30.0,89.0,0.0,100.0,\"Always\",\"Spin\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Left & Right\",89.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,12.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,-8.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Left & Right\",77.0,30.0,54.0,30.0,34.0,\"Left\",\"Hide\",true,false,0.0,false,1.0,\"Static\",15.0,-15.0,89.0,0.0,100.0,\"Always\",\"Spin\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Left & Right\",41.0,-34.0,0.0,0.0,1.0,1.0,1.0,0.0,34.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,-28.0,0.0,\"\",45.0,100.0,0.0,false,\"Always\",\"Left & Right\",23.0,30.0,69.0,30.0,48.0,\"Left\",\"Hide\",true,false,0.0,false,1.0,\"Static\",0.0,0.0,-89.0,0.0,100.0,\"Always\",\"Jitter\",160.0,5.0,\"At Target\",true,false,false,\"Down\",\"Left & Right\",77.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,34.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,-28.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Left & Right\",29.0,30.0,76.0,30.0,55.0,\"Left\",\"Hide\",true,false,0.0,false,1.0,\"Static\",0.0,0.0,89.0,0.0,100.0,\"Always\",\"Spin\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Left & Right\",55.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,34.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,-21.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Avoid Overlap\",76.0,30.0,67.0,30.0,56.0,\"Left\",\"Hide\",false,false,0.0,false,1.0,\"Off\",0.0,0.0,0.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Sine Decaying\",100.0,-28.0,0.0,0.0,1.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,0.0,0.0,\"\",30.0,100.0,0.0,false,\"Always\",\"Left & Right\",25.0,30.0,74.0,30.0,78.0,\"Left\",\"Hide\",false,false,0.0,false,1.0,\"Off\",0.0,0.0,0.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Sine Decaying\",100.0,41.0,0.0,0.0,1.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,27.0,59.0,-47.0,-31.0,74.0,63.0,0.0,0.0,\"\",-38.0,100.0,0.0,false,\"Always\",\"Disabled\",100.0,30.0,100.0,30.0,100.0,\"Left\",\"Hide\",false,false,0.0,false,1.0,\"Off\",0.0,0.0,0.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"Local View\",\"\",false,false,\"Disabled\",\"Static\",100.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,0.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Left & Right\",29.0,30.0,78.0,30.0,100.0,\"Left\",\"Hide\",true,false,0.0,false,1.0,\"Static\",0.0,0.0,-89.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Left & Right\",55.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,34.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,-21.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Left & Right\",34.0,30.0,88.0,30.0,59.0,\"Left\",\"Hide\",true,false,0.0,false,1.0,\"Static\",0.0,0.0,-89.0,0.0,89.0,\"Always\",\"Spin\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Sine Decaying\",100.0,33.0,0.0,0.0,1.0,2.0,4.0,63.0,0.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,0.0,0.0,\"\",-22.0,100.0,0.0,false,\"Always\",\"Left & Right\",34.0,30.0,78.0,30.0,55.0,\"Left\",\"Hide\",true,false,0.0,false,1.0,\"Static\",0.0,0.0,89.0,0.0,85.0,\"Always\",\"Spin\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Left & Right\",50.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,34.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,-21.0,0.0,\"\",0.0,100.0,[],\"Disabled\",\"Air\",\"Terrorist\",[],false]", 
        [1] = v262.unmatched
    }, 
    [7] = {
        [1] = nil, 
        [2] = "[\"\",0.0,false,\"Always\",\"Left & Right\",46.0,30.0,23.0,30.0,54.0,\"Left\",\"Expose\",true,false,0.0,false,1.0,\"Static\",-20.0,30.0,89.0,0.0,100.0,\"Always\",\"Spin\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Sine Decaying\",42.0,48.0,0.0,0.0,4.0,2.0,3.0,-56.0,36.0,-23.0,0.0,0.0,59.0,82.0,-21.0,-125.0,100.0,28.0,-29.0,28.0,\"\",-39.0,72.0,0.0,false,\"Always\",\"Left & Right\",91.0,30.0,78.0,30.0,69.0,\"Left\",\"Hide\",true,false,0.0,false,1.0,\"Static\",15.0,-15.0,89.0,0.0,100.0,\"Always\",\"Spin\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Mirrored Sine\",78.0,44.0,0.0,0.0,2.0,5.0,3.0,56.0,-33.0,0.0,56.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,41.0,0.0,\"\",-49.0,100.0,0.0,false,\"Always\",\"Left & Right\",23.0,30.0,69.0,30.0,48.0,\"Left\",\"Hide\",true,false,0.0,false,1.0,\"Static\",0.0,0.0,-89.0,0.0,100.0,\"Always\",\"Jitter\",160.0,5.0,\"At Target\",true,false,false,\"Down\",\"Sine Decaying\",77.0,38.0,0.0,0.0,4.0,2.0,3.0,-44.0,34.0,0.0,0.0,0.0,1.0,1.0,-73.0,-1.0,100.0,0.0,-28.0,0.0,\"\",-44.0,100.0,0.0,false,\"Always\",\"Left & Right\",29.0,30.0,76.0,30.0,55.0,\"Left\",\"Hide\",true,false,0.0,false,1.0,\"Static\",0.0,0.0,89.0,0.0,100.0,\"Always\",\"Spin\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Left & Right\",55.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,34.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,-21.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Avoid Overlap\",76.0,30.0,67.0,30.0,56.0,\"Left\",\"Hide\",false,false,0.0,false,1.0,\"Off\",0.0,0.0,0.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Sine Decaying\",100.0,-28.0,0.0,0.0,1.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,0.0,0.0,\"\",30.0,100.0,0.0,false,\"Always\",\"Left & Right\",25.0,30.0,74.0,30.0,78.0,\"Left\",\"Hide\",false,false,0.0,false,1.0,\"Off\",0.0,0.0,0.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Sine Decaying\",100.0,41.0,0.0,0.0,1.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,27.0,59.0,-47.0,-31.0,74.0,63.0,0.0,0.0,\"\",-38.0,100.0,0.0,false,\"Always\",\"Disabled\",100.0,30.0,100.0,30.0,100.0,\"Left\",\"Hide\",false,false,0.0,false,1.0,\"Off\",0.0,0.0,0.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"Local View\",\"\",false,false,\"Disabled\",\"Static\",100.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,0.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Left & Right\",29.0,30.0,78.0,30.0,77.0,\"Left\",\"Hide\",true,false,0.0,false,1.0,\"Static\",0.0,0.0,-89.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Sine Decaying\",55.0,-33.0,0.0,0.0,1.0,1.0,1.0,0.0,34.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,-21.0,0.0,\"\",-44.0,100.0,0.0,false,\"Always\",\"Left & Right\",34.0,30.0,88.0,30.0,59.0,\"Left\",\"Hide\",true,false,0.0,false,1.0,\"Static\",0.0,0.0,-89.0,0.0,89.0,\"Always\",\"Spin\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Multi-Freq. Sine\",100.0,0.0,0.0,0.0,1.0,2.0,4.0,63.0,0.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,0.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Left & Right\",34.0,30.0,78.0,30.0,61.0,\"Left\",\"Hide\",true,false,0.0,false,1.0,\"Static\",0.0,0.0,89.0,0.0,85.0,\"Always\",\"Spin\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Multi-Freq. Sine\",50.0,0.0,0.0,0.0,5.0,3.0,1.0,-55.0,34.0,0.0,0.0,0.0,14.0,36.0,-36.0,-21.0,100.0,44.0,-21.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Left & Right\",46.0,30.0,23.0,30.0,54.0,\"Left\",\"Expose\",true,false,0.0,false,1.0,\"Static\",-20.0,30.0,89.0,0.0,100.0,\"Always\",\"Spin\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Sine Decaying\",42.0,48.0,0.0,0.0,4.0,2.0,3.0,-56.0,36.0,-23.0,0.0,0.0,59.0,82.0,-21.0,-125.0,100.0,28.0,-29.0,28.0,\"\",-39.0,72.0,0.0,false,\"Always\",\"Left & Right\",91.0,30.0,78.0,30.0,69.0,\"Left\",\"Hide\",true,false,0.0,false,1.0,\"Static\",15.0,-15.0,89.0,0.0,100.0,\"Always\",\"Spin\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Mirrored Sine\",78.0,44.0,0.0,0.0,2.0,5.0,3.0,56.0,-33.0,0.0,56.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,41.0,0.0,\"\",-49.0,100.0,0.0,false,\"Always\",\"Left & Right\",23.0,30.0,69.0,30.0,48.0,\"Left\",\"Hide\",true,false,0.0,false,1.0,\"Static\",0.0,0.0,-89.0,0.0,100.0,\"Always\",\"Jitter\",160.0,5.0,\"At Target\",true,false,false,\"Down\",\"Sine Decaying\",77.0,38.0,0.0,0.0,4.0,2.0,3.0,-44.0,34.0,0.0,0.0,0.0,1.0,1.0,-73.0,-1.0,100.0,0.0,-28.0,0.0,\"\",-44.0,100.0,0.0,false,\"Always\",\"Left & Right\",29.0,30.0,76.0,30.0,55.0,\"Left\",\"Hide\",true,false,0.0,false,1.0,\"Static\",0.0,0.0,89.0,0.0,100.0,\"Always\",\"Spin\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Left & Right\",55.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,34.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,-21.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Avoid Overlap\",76.0,30.0,67.0,30.0,56.0,\"Left\",\"Hide\",false,false,0.0,false,1.0,\"Off\",0.0,0.0,0.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Sine Decaying\",100.0,-28.0,0.0,0.0,1.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,0.0,0.0,\"\",30.0,100.0,0.0,false,\"Always\",\"Left & Right\",25.0,30.0,74.0,30.0,78.0,\"Left\",\"Hide\",false,false,0.0,false,1.0,\"Off\",0.0,0.0,0.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Sine Decaying\",100.0,41.0,0.0,0.0,1.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,27.0,59.0,-47.0,-31.0,74.0,63.0,0.0,0.0,\"\",-38.0,100.0,0.0,false,\"Always\",\"Disabled\",100.0,30.0,100.0,30.0,100.0,\"Left\",\"Hide\",false,false,0.0,false,1.0,\"Off\",0.0,0.0,0.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"Local View\",\"\",false,false,\"Disabled\",\"Static\",100.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,0.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Left & Right\",29.0,30.0,78.0,30.0,77.0,\"Left\",\"Hide\",true,false,0.0,false,1.0,\"Static\",0.0,0.0,-89.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Sine Decaying\",55.0,-33.0,0.0,0.0,1.0,1.0,1.0,0.0,34.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,-21.0,0.0,\"\",-44.0,100.0,0.0,false,\"Always\",\"Left & Right\",34.0,30.0,88.0,30.0,59.0,\"Left\",\"Hide\",true,false,0.0,false,1.0,\"Static\",0.0,0.0,-89.0,0.0,89.0,\"Always\",\"Spin\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Multi-Freq. Sine\",100.0,0.0,0.0,0.0,1.0,2.0,4.0,63.0,0.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,0.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Left & Right\",34.0,30.0,78.0,30.0,61.0,\"Left\",\"Hide\",true,false,0.0,false,1.0,\"Static\",0.0,0.0,89.0,0.0,85.0,\"Always\",\"Spin\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Multi-Freq. Sine\",50.0,0.0,0.0,0.0,5.0,3.0,1.0,-55.0,34.0,0.0,0.0,0.0,14.0,36.0,-36.0,-21.0,100.0,44.0,-21.0,0.0,\"\",0.0,100.0,[],\"Disabled\",\"Crouch Move\",\"Counter Terrorist\",[],false]", 
        [1] = v262.sine
    }, 
    [8] = {
        [1] = nil, 
        [2] = "[\"\",0.0,false,\"Always\",\"Left & Right\",42.0,30.0,22.0,30.0,84.0,\"Left\",\"Hide\",true,false,0.0,true,1.0,\"Static\",-20.0,30.0,89.0,1.0,100.0,\"Always\",\"Reversal Spin\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Sine Decaying\",73.0,56.0,0.0,0.0,1.0,1.0,1.0,0.0,36.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,-29.0,0.0,\"\",-33.0,100.0,0.0,false,\"Always\",\"Left & Right\",27.0,30.0,46.0,30.0,69.0,\"Left\",\"Hide\",true,false,0.0,true,1.0,\"Static\",15.0,-15.0,89.0,1.0,100.0,\"Always\",\"Reversal Spin\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Multi-Freq. Sine\",78.0,0.0,0.0,0.0,2.0,4.0,1.0,-69.0,-33.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,41.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Left & Right\",23.0,30.0,69.0,30.0,48.0,\"Left\",\"Hide\",true,false,0.0,false,1.0,\"Static\",0.0,0.0,-89.0,1.0,100.0,\"Always\",\"Jitter\",160.0,5.0,\"At Target\",true,false,false,\"Down\",\"Multi-Freq. Sine\",77.0,0.0,0.0,0.0,4.0,2.0,3.0,-44.0,34.0,0.0,0.0,0.0,1.0,1.0,-73.0,-1.0,100.0,0.0,-28.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Left & Right\",29.0,30.0,76.0,30.0,55.0,\"Left\",\"Hide\",true,false,0.0,false,1.0,\"Static\",0.0,0.0,-89.0,1.0,100.0,\"Always\",\"Spin\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Left & Right\",55.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,34.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,-21.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Avoid Overlap\",76.0,30.0,67.0,30.0,56.0,\"Left\",\"Hide\",false,false,0.0,false,1.0,\"Off\",0.0,0.0,0.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"At Target\",false,false,false,\"Down\",\"Sine Decaying\",100.0,-28.0,0.0,0.0,1.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,0.0,0.0,\"\",30.0,100.0,0.0,false,\"Always\",\"Disabled\",25.0,30.0,74.0,30.0,78.0,\"Left\",\"Hide\",false,false,0.0,false,1.0,\"Off\",0.0,0.0,0.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"At Target\",true,false,true,\"Down\",\"Sway\",100.0,41.0,30.0,8.0,1.0,1.0,1.0,0.0,0.0,-30.0,0.0,0.0,27.0,59.0,-47.0,-31.0,74.0,63.0,0.0,35.0,\"\",-38.0,45.0,0.0,false,\"Always\",\"Disabled\",100.0,30.0,100.0,30.0,100.0,\"Left\",\"Hide\",false,false,0.0,false,1.0,\"Off\",0.0,0.0,0.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"Local View\",\"\",false,false,\"Disabled\",\"Static\",100.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,0.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Left & Right\",29.0,30.0,78.0,30.0,77.0,\"Left\",\"Hide\",true,false,0.0,false,1.0,\"Static\",0.0,0.0,-89.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Sine Decaying\",55.0,-33.0,0.0,0.0,1.0,1.0,1.0,0.0,34.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,-21.0,0.0,\"\",-44.0,100.0,0.0,false,\"Always\",\"Left & Right\",34.0,30.0,88.0,30.0,59.0,\"Left\",\"Hide\",true,false,0.0,true,1.0,\"Static\",0.0,0.0,-89.0,1.0,89.0,\"Always\",\"Spin\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Multi-Freq. Sine\",100.0,0.0,0.0,0.0,1.0,2.0,4.0,63.0,0.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,0.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Left & Right\",34.0,30.0,78.0,30.0,61.0,\"Left\",\"Hide\",true,false,0.0,false,1.0,\"Static\",0.0,0.0,89.0,0.0,85.0,\"Always\",\"Spin\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Multi-Freq. Sine\",50.0,0.0,0.0,0.0,5.0,3.0,1.0,-55.0,34.0,0.0,0.0,0.0,14.0,36.0,-36.0,-21.0,100.0,44.0,-21.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Left & Right\",42.0,30.0,22.0,30.0,84.0,\"Left\",\"Hide\",true,false,0.0,true,1.0,\"Static\",-20.0,30.0,89.0,1.0,100.0,\"Always\",\"Reversal Spin\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Sine Decaying\",73.0,56.0,0.0,0.0,1.0,1.0,1.0,0.0,36.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,-29.0,0.0,\"\",-33.0,100.0,0.0,false,\"Always\",\"Left & Right\",27.0,30.0,46.0,30.0,69.0,\"Left\",\"Hide\",true,false,0.0,true,1.0,\"Static\",15.0,-15.0,89.0,1.0,100.0,\"Always\",\"Reversal Spin\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Multi-Freq. Sine\",78.0,0.0,0.0,0.0,2.0,4.0,1.0,-69.0,-33.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,41.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Left & Right\",23.0,30.0,69.0,30.0,48.0,\"Left\",\"Hide\",true,false,0.0,false,1.0,\"Static\",0.0,0.0,-89.0,1.0,100.0,\"Always\",\"Jitter\",160.0,5.0,\"At Target\",true,false,false,\"Down\",\"Multi-Freq. Sine\",77.0,0.0,0.0,0.0,4.0,2.0,3.0,-44.0,34.0,0.0,0.0,0.0,1.0,1.0,-73.0,-1.0,100.0,0.0,-28.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Left & Right\",29.0,30.0,76.0,30.0,55.0,\"Left\",\"Hide\",true,false,0.0,false,1.0,\"Static\",0.0,0.0,-89.0,1.0,100.0,\"Always\",\"Spin\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Left & Right\",55.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,34.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,-21.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Avoid Overlap\",76.0,30.0,67.0,30.0,56.0,\"Left\",\"Hide\",false,false,0.0,false,1.0,\"Off\",0.0,0.0,0.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"At Target\",false,false,false,\"Down\",\"Sine Decaying\",100.0,-28.0,0.0,0.0,1.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,0.0,0.0,\"\",30.0,100.0,0.0,false,\"Always\",\"Disabled\",25.0,30.0,74.0,30.0,78.0,\"Left\",\"Hide\",false,false,0.0,false,1.0,\"Off\",0.0,0.0,0.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"At Target\",true,false,true,\"Down\",\"Sway\",100.0,41.0,30.0,8.0,1.0,1.0,1.0,0.0,0.0,-30.0,0.0,0.0,27.0,59.0,-47.0,-31.0,74.0,63.0,0.0,35.0,\"\",-38.0,45.0,0.0,false,\"Always\",\"Disabled\",100.0,30.0,100.0,30.0,100.0,\"Left\",\"Hide\",false,false,0.0,false,1.0,\"Off\",0.0,0.0,0.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"Local View\",\"\",false,false,\"Disabled\",\"Static\",100.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,0.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Left & Right\",29.0,12.0,78.0,11.0,77.0,\"Left\",\"Hide\",true,false,0.0,false,1.0,\"Static\",0.0,0.0,-89.0,0.0,100.0,\"Always\",\"Off\",360.0,5.0,\"At Target\",true,true,false,\"Down\",\"Sine Decaying\",55.0,-33.0,0.0,0.0,1.0,1.0,1.0,0.0,34.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,-21.0,0.0,\"\",-44.0,100.0,0.0,false,\"Always\",\"Left & Right\",34.0,30.0,88.0,30.0,59.0,\"Left\",\"Hide\",true,false,0.0,true,1.0,\"Static\",0.0,0.0,-89.0,1.0,89.0,\"Always\",\"Spin\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Multi-Freq. Sine\",100.0,0.0,0.0,0.0,1.0,2.0,4.0,63.0,0.0,0.0,0.0,0.0,1.0,1.0,-1.0,-1.0,100.0,0.0,0.0,0.0,\"\",0.0,100.0,0.0,false,\"Always\",\"Left & Right\",34.0,30.0,78.0,30.0,61.0,\"Left\",\"Hide\",true,false,0.0,false,1.0,\"Static\",0.0,0.0,89.0,0.0,85.0,\"Always\",\"Spin\",360.0,5.0,\"At Target\",true,false,false,\"Down\",\"Multi-Freq. Sine\",50.0,0.0,0.0,0.0,5.0,3.0,1.0,-55.0,34.0,0.0,0.0,0.0,14.0,36.0,-36.0,-21.0,100.0,44.0,-21.0,0.0,\"\",0.0,100.0,[\"Holding Knife\"],\"Disabled\",\"Air\",\"Counter Terrorist\",[],false]", 
        [1] = v262.defensive
    }
});
v225.setup(v279);
(function(v280, v281, v282)
    -- upvalues: v225 (ref)
    local v283 = db.config_loads or {};
    if not v283[v281] then
        local v284 = v280.menu.list:list();
        if v282 < 1 or #v284 < v282 then
            print(string.format("Invalid preset index: %d", v282));
            return;
        else
            v280.menu.list:set(v282);
            v280.menu.name:set(v284[v282]);
            v225.load(v280, v284[v282]);
            common.add_notify("\a" .. hexx .. "[CONFIG SYSTEM]", "Preset '~ balance' applied successfully!");
            v283[v281] = true;
        end;
    end;
    db.config_loads = v283;
end)(v279, common.get_config_name(), 2);
events.shutdown:set(function()
    db.config_loads = db.config_loads or {};
end);
local l_clipboard_0 = require("neverlose/clipboard");
local l_webhooks_0 = require("neverlose/discord_webhooks");
local v287 = files.read("nl\\easysyncdebug\\c.txt");
if not v287 then
    v287 = "Y";
    if not files.write("nl\\easysyncdebug\\c.txt", v287) then
        return;
    end;
elseif v287 == "N" then
    v62:visibility(false);
end;
v62:set_callback(function()
    -- upvalues: v287 (ref), v62 (ref), l_webhooks_0 (ref), v0 (ref), l_clipboard_0 (ref)
    if v287 == "Y" then
        v287 = "N";
        if not files.write("nl\\easysyncdebug\\c.txt", v287) then
            return;
        else
            v62:visibility(false);
            local v288 = common.get_username();
            local v289 = l_webhooks_0.new_data();
            v289:set_content(v288 .. " " .. v0);
            v289:set_username("easysync");
            l_clipboard_0.set("/role " .. v288 .. " " .. v0);
            local v290 = l_webhooks_0.new_embed();
            v290:set_description(v288 .. " has just requested the role:");
            v290:add_field("His current build:", v0);
            common.add_notify("[Get-Role]", "Verification message is coppied to your clipboard. Just send it to the #get-role channel");
            print_dev("[Get-Role]", "\a00FF00FF Verification message is coppied to your clipboard. Just send it to the #get-role channel");
            print("[Get-Role]", "\a00FF00FF Verification message is coppied to your clipboard. Just send it to the #get-role channel ");
            if not l_webhooks_0.new("https://discord.com/api/webhooks/1153735915869581373/DhkfLaAdotOxhyOIc8sLtZhtG_soDBWxz-gD91CBaG5FWPJRhPI6swSiEgZHmY4uhxRb"):send(v289, v290) then
                return;
            end;
        end;
    end;
end);
v62:set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
v43.aspectratio_enable = v48:switch("\a" .. hexx .. ui.get_icon("display") .. "\aDEFAULT" .. "     Aspect Ratio", false):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
v43.aspectratio_amount = v43.aspectratio_enable:create():slider("Amount", 0, 200, 0, 0.01):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
v43.aspectratio_4_3 = v43.aspectratio_enable:create():button("4:3"):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end):set_callback(function()
    -- upvalues: v43 (ref)
    v43.aspectratio_amount:set(133);
end);
v43.aspectratio_16_10 = v43.aspectratio_enable:create():button("16:10"):set_callback(function()
    -- upvalues: v43 (ref)
    v43.aspectratio_amount:set(160);
end);
variables.set_aspectratio = function()
    -- upvalues: v43 (ref)
    cvar.r_aspectratio:float(v43.aspectratio_enable:get() and v43.aspectratio_amount:get() / 100 or 0);
end;
v43.aspectratio_enable:set_callback(function(v291)
    -- upvalues: v43 (ref)
    local v292 = v291:get();
    v43.aspectratio_amount:visibility(v292);
    v43.aspectratio_4_3:visibility(v292);
    v43.aspectratio_16_10:visibility(v292);
    if v292 then
        variables.set_aspectratio();
    end;
end, true);
v43.aspectratio_enable:set_callback(function(_)
    variables.set_aspectratio();
end);
v43.aspectratio_amount:set_callback(function(_)
    variables.set_aspectratio();
end);
events.shutdown:set(function()
    -- upvalues: v43 (ref)
    if v43.aspectratio_enable:get() then
        cvar.r_aspectratio:float(0);
    end;
end);
green_white_colors_tp = {
    [1] = {
        [1] = nil, 
        [2] = 0, 
        [1] = color(0, 255, 0)
    }, 
    [2] = {
        [1] = nil, 
        [2] = 1, 
        [1] = color(255, 255, 255)
    }
};
local v295 = v31.gradient.text("Skeet", false, green_white_colors_tp);
local v296 = {
    [1] = {
        [1] = nil, 
        [2] = 0, 
        [1] = color(200, 0, 0)
    }, 
    [2] = {
        [1] = nil, 
        [2] = 1, 
        [1] = color(50, 50, 50)
    }
};
local v297 = v31.gradient.text("e\226\128\139\226\128\139asy.sync", false, v296);
events.render:set(function(_)
    -- upvalues: v295 (ref)
    render.text(font_test, vector_position, color(255, 255, 255), nil, v295);
end);
local v299 = {
    [1] = {
        [1] = nil, 
        [2] = 0, 
        [1] = color(0, 0, 255)
    }, 
    [2] = {
        [1] = nil, 
        [2] = 1, 
        [1] = color(255, 255, 255)
    }
};
local v300 = v31.gradient.text("      Predictive", false, v299);
events.render:set(function(_)
    -- upvalues: v300 (ref)
    render.text(font_test, vector_position, color(255, 255, 255), nil, v300);
end);
local v302 = {
    [1] = {
        [1] = nil, 
        [2] = 0, 
        [1] = color(255, 255, 0)
    }, 
    [2] = {
        [1] = nil, 
        [2] = 1, 
        [1] = color(255, 255, 255)
    }
};
local v303 = v31.gradient.text("      Enhanced Hide Shots", false, v302);
events.render:set(function(_)
    -- upvalues: v303 (ref)
    render.text(font_test, vector_position, color(255, 255, 255), nil, v303);
end);
v43.auto_uncharge = v47:switch("\a" .. hexx .. ui.get_icon("person-running") .. "\aDEFAULT" .. v300 .. " Uncharge", false):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
v43.auto_uncharge_setts = v43.auto_uncharge:create();
v43.delay = v43.auto_uncharge_setts:slider("\a" .. hexx .. ui.get_icon("timer") .. "\aDEFAULT Delay", 0, 10, 3, 1, "t"):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
v43.tp_type = v43.auto_uncharge_setts:combo("\a" .. hexx .. ui.get_icon("gear") .. "\aDEFAULT Mode", {
    [1] = v295, 
    [2] = v297
}):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
v43.tp_recharge = v43.auto_uncharge_setts:slider("\a" .. hexx .. ui.get_icon("wrench") .. "\aDEFAULT Recharge Delay", 1, 10, 3, 0.1, "s"):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
v43.active_on_ground = v43.auto_uncharge_setts:switch("\a" .. hexx .. ui.get_icon("road") .. "\aDEFAULT   Active On-Ground                      "):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
v43.conditional_delay = v43.auto_uncharge_setts:switch("\a" .. hexx .. ui.get_icon("dice") .. "\aDEFAULT  Conditional Delay                      "):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
v43.delay_ground = v43.auto_uncharge_setts:slider("\a" .. hexx .. ui.get_icon("timer") .. "\aDEFAULT Delay (Ground)", 0, 10, 3, 1):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
v43.delay_air = v43.auto_uncharge_setts:slider("\a" .. hexx .. ui.get_icon("timer") .. "\aDEFAULT Delay (Air)", 0, 10, 3, 1):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
v43.active_on_ground:tooltip("\aFFFF00FF" .. ui.get_icon("brake-warning") .. "\aDEFAULT Use at your own risk! Neverlose is most likely to miss after teleportation on the ground. Teleportation works best when paired with jumping or air-crouching.");
v43.auto_uncharge:tooltip("\aFFFF00FF" .. ui.get_icon("triangle-exclamation") .. "\aDEFAULT Will try to predict both: whether your victim will be hittable, and whether you will be too. Based on the prediction data, it will execute teleportation.");
v43.delay_air:visibility(v43.auto_uncharge:get());
v43.delay_ground:visibility(v43.auto_uncharge:get());
v43.delay:visibility(v43.auto_uncharge:get());
v43.tp_type:visibility(v43.auto_uncharge:get());
v43.tp_recharge:visibility(v43.auto_uncharge:get());
v43.auto_uncharge:set_callback(function()
    -- upvalues: v43 (ref)
    if not v43.conditional_delay:get() then
        v43.delay_ground:visibility(false);
        v43.delay_air:visibility(false);
    end;
end);
v43.tp_type:set_callback(function()
    -- upvalues: v43 (ref), v295 (ref)
    local v305 = v43.tp_type:get() ~= v295;
    v43.tp_recharge:disabled(v305);
end);
v43.conditional_delay:set_callback(function(v306)
    -- upvalues: v43 (ref)
    local v307 = v306:get();
    v43.delay_ground:visibility(v307);
    v43.delay_air:visibility(v307);
    if v43.conditional_delay:get() then
        v43.delay:disabled(true);
        v43.active_on_ground:set(true);
        v43.active_on_ground:disabled(true);
    else
        v43.delay:disabled(false);
        v43.active_on_ground:set(false);
        v43.active_on_ground:disabled(false);
    end;
end);
local v308 = false;
local v309 = false;
local _ = false;
local function v312(v311)
    -- upvalues: v308 (ref), v43 (ref), v295 (ref), v297 (ref)
    v308 = false;
    if variables.threatened(v311) then
        if v43.tp_type:get() == v295 then
            ui.find("Aimbot", "Ragebot", "Main", "Double Tap"):override(false);
            utils.execute_after(v43.tp_recharge:get() / 10, function()
                ui.find("Aimbot", "Ragebot", "Main", "Double Tap"):override(nil);
            end);
        elseif v43.tp_type:get() == v297 then
            rage.exploit:force_teleport();
        end;
    end;
end;
local v313 = v47:switch("\a" .. hexx .. ui.get_icon("code-pull-request-closed") .. v303):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end):tooltip("\aFFFF00FF\227\128\144!\227\128\145EXPERIMENTAL FEATURE\227\128\144!\227\128\145\aDEFAULTThis feature enables teleportation during Hide Shots, similar to Double Tap, and allows you to idealtick without getting backtracked.(Requires freestanding for idealticking) \aFF000099USE AT YOUR OWN RISK! THIS FEATURE IS STILL IN DEVELOPMENT AND MAY CAUSE UNEXPECTED DEATHS.");
local v314 = v313:create():switch(" Break LC In-Air"):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
local v315 = v313:create():slider(" Delay", 0, 10, 3, 1, "t"):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
v314:visibility(v313:get());
v315:visibility(v313:get());
v313:set_callback(function()
    -- upvalues: v314 (ref), v313 (ref), v315 (ref)
    v314:visibility(v313:get());
    v315:visibility(v313:get());
end);
events.aim_ack:set(function()
    -- upvalues: v313 (ref), v28 (ref)
    local v316 = entity:get_local_player();
    if v316 == nil then
        return;
    elseif v316:get_player_weapon() == nil then
        return;
    else
        if v313:get() and v28.rage_hideshots:get() and ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"):get() then
            utils.execute_after(0.1, function()
                ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"):override(false);
                utils.execute_after(0.2, function()
                    ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"):override(nil);
                end);
            end);
        end;
        return;
    end;
end);
events.createmove:set(function()
    -- upvalues: v313 (ref), v314 (ref), v315 (ref)
    local l_m_vecVelocity_1 = entity.get_local_player().m_vecVelocity;
    if v313:get() and entity.get_threat(true) and v314:get() and l_m_vecVelocity_1.z ~= 0 then
        utils.execute_after(v315:get() / 64, function()
            ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"):override(false);
            utils.execute_after(0.5, function()
                ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"):override(nil);
            end);
        end);
    end;
end);
local function v319()
    -- upvalues: v43 (ref)
    if v43.conditional_delay:get() and v43.auto_uncharge:get() then
        local l_m_vecVelocity_2 = entity.get_local_player().m_vecVelocity;
        if l_m_vecVelocity_2.z ~= 0 then
            v43.delay:override(v43.delay_air:get());
        elseif l_m_vecVelocity_2.z == 0 then
            v43.delay:override(v43.delay_ground:get());
        end;
    else
        v43.delay:override(nil);
    end;
end;
events.createmove:set(function()
    -- upvalues: v319 (ref)
    v319();
end);
v43.active_on_ground:set_callback(function()
    -- upvalues: v43 (ref), v309 (ref)
    if v43.active_on_ground:get() then
        v309 = true;
    else
        v309 = false;
    end;
end);
variables.get_state = function(v320)
    local v321 = v320:get_override();
    return v321 == nil and v320:get() or v321;
end;
variables.is_exploit_ready = function(_)
    -- upvalues: v31 (ref)
    if not (rage.exploit:get() == 1) then
        return false;
    else
        local v323 = variables.get_state(ui.find("Aimbot", "Ragebot", "Main", "Double Tap"));
        local v324 = variables.get_state(ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"));
        if v323 then
            return v324 ~= "Always On" or v31.get_defensive() or true;
        else
            return false;
        end;
    end;
end;
variables.threatened = function(_)
    local v326 = entity.get_local_player();
    if v326 == nil or not v326:is_alive() then
        return false;
    else
        v326:simulate_movement():think(15);
        for _, v328 in pairs(entity.get_players(true, false)) do
            local v329 = entity.get(v328);
            if v329 and v329:is_alive() then
                local v330 = v329:get_eye_position();
                local v331 = v326:get_hitbox_position(0);
                local v332, _ = utils.trace_bullet(v329, v330, v331);
                if v332 > 0 then
                    return true;
                end;
            end;
        end;
        return false;
    end;
end;
v43.auto_uncharge:set_callback(function(v334)
    -- upvalues: v43 (ref), v308 (ref), v23 (ref), v312 (ref)
    local v335 = v334:get();
    v43.delay:visibility(v335);
    v43.tp_type:visibility(v335);
    v43.active_on_ground:visibility(v335);
    v43.delay_ground:visibility(v335);
    v43.delay_air:visibility(v335);
    v43.conditional_delay:visibility(v335);
    v43.tp_recharge:visibility(v335);
    if not v335 or v308 then
        return;
    else
        if variables.threatened(v334) then
            v308 = true;
            local v336 = v23(v43.delay);
            utils.execute_after(v336 * 1 / 64, function()
                -- upvalues: v312 (ref), v334 (ref)
                v312(v334);
            end);
        end;
        return;
    end;
end, true);
events.createmove:set(function(v337)
    -- upvalues: v43 (ref), v309 (ref), v313 (ref), v295 (ref)
    if not v43.auto_uncharge:get() then
        return;
    else
        local v338 = entity.get_local_player();
        if v338 == nil then
            return;
        else
            local v339 = v338:get_player_weapon();
            if v338 == nil then
                return;
            elseif v339 == nil then
                return;
            else
                local v340 = v339:get_weapon_info();
                if v340 == nil then
                    return;
                else
                    local l_weapon_type_0 = v340.weapon_type;
                    if l_weapon_type_0 == nil or l_weapon_type_0 == 0 or l_weapon_type_0 == 9 then
                        return;
                    elseif not variables.threatened(v337) then
                        variables.locked_ticks = v337.tickcount;
                        return;
                    elseif v309 == false and v338.m_vecVelocity.z == 0 then
                        return;
                    else
                        if variables.threatened(v337) and v313:get() then
                            ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"):override(false);
                            utils.execute_after(0.2, function()
                                ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"):override(nil);
                            end);
                        end;
                        if not variables.is_exploit_ready(v337) then
                            return;
                        else
                            if v337.tickcount - v43.delay:get() >= variables.locked_ticks or variables.locked_ticks > v337.tickcount then
                                variables.locked_ticks = v337.tickcount;
                                if v43.tp_type:get() == v295 then
                                    ui.find("Aimbot", "Ragebot", "Main", "Double Tap"):override(false);
                                    utils.execute_after(v43.tp_recharge:get() / 10, function()
                                        ui.find("Aimbot", "Ragebot", "Main", "Double Tap"):override(nil);
                                    end);
                                else
                                    rage.exploit:force_teleport();
                                end;
                            end;
                            return;
                        end;
                    end;
                end;
            end;
        end;
    end;
end);
local v342 = v49:switch("\a" .. hexx .. ui.get_icon("bomb") .. "\aDEFAULT" .. "     Grenades"):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
v1.auto_nades:visibility(v342:get());
v342:set_callback(function(v343)
    -- upvalues: v1 (ref)
    local v344 = v343:get();
    v1.auto_nades:visibility(v344);
end);
local v345 = {
    groups_r = {
        settings_r = ui.create(v3, ui.get_icon("table-list") .. " Rage ", nil), 
        logic_override = ui.create(v3, ui.get_icon("face-angry-horns") .. " Ragebot Logic ", nil)
    }, 
    settings_r = {}, 
    variables = {
        values = {}
    }, 
    refs = {
        hitboxes = ui.find("Aimbot", "Ragebot", "Selection", "Hitboxes"), 
        multipoint = ui.find("Aimbot", "Ragebot", "Selection", "Multipoint"), 
        head_scale = ui.find("Aimbot", "Ragebot", "Selection", "Multipoint", "Head Scale"), 
        body_scale = ui.find("Aimbot", "Ragebot", "Selection", "Multipoint", "Body Scale"), 
        hit_chance = ui.find("Aimbot", "Ragebot", "Selection", "Hit Chance"), 
        hit_chance_double_tap = ui.find("Aimbot", "Ragebot", "Selection", "Hit Chance", "Double Tap"), 
        min_damage = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"), 
        min_damage_delay_shot = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage", "Delay Shot"), 
        penetrate_walls = ui.find("Aimbot", "Ragebot", "Selection", "Penetrate Walls"), 
        body_aim = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim"), 
        body_aim_disablers = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim", "Disablers"), 
        body_aim_force_on_peek = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim", "Force on Peek"), 
        safe_points = ui.find("Aimbot", "Ragebot", "Safety", "Safe Points"), 
        ensure_hitbox_safety = ui.find("Aimbot", "Ragebot", "Safety", "Ensure Hitbox Safety"), 
        auto_scope = ui.find("Aimbot", "Ragebot", "Accuracy", "Auto Scope"), 
        auto_stop = ui.find("Aimbot", "Ragebot", "Accuracy", "Auto Stop"), 
        auto_stop_options = ui.find("Aimbot", "Ragebot", "Accuracy", "Auto Stop", "Options"), 
        auto_stop_double_tap = ui.find("Aimbot", "Ragebot", "Accuracy", "Auto Stop", "Double Tap")
    }
};
v80:set_callback(function()
    -- upvalues: v80 (ref), v345 (ref)
    local v346 = v80:get();
    v345.groups_r.settings_r:visibility(v346 == 4);
    v345.groups_r.logic_override:visibility(v346 == 4);
end);
v345.settings_r.safety_enabled = v345.groups_r.settings_r:switch("\a" .. hexx .. ui.get_icon("user-shield") .. "\aDEFAULT" .. "   Configure Safety", false):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
v345.settings_r.safety_body_aim_selection = v345.settings_r.safety_enabled:create():listable("Force Body Aim", {
    [1] = "Target \194\187 Lethal", 
    [2] = "Target \194\187 Nade / Knife", 
    [3] = "Target \194\187 Crouching", 
    [4] = "Target \194\187 In Air", 
    [5] = "Target \194\187 High Velocity", 
    [6] = "Local \194\187 Crouching"
}):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
v345.settings_r.safety_safe_points_selection = v345.settings_r.safety_enabled:create():listable("Force Safe Points", {
    [1] = "Target \194\187 Lethal", 
    [2] = "Target \194\187 Nade / Knife", 
    [3] = "Target \194\187 Crouching", 
    [4] = "Target \194\187 In Air", 
    [5] = "Target \194\187 High Velocity", 
    [6] = "Local \194\187 Crouching"
}):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
v345.settings_r.safety_force_default = v345.settings_r.safety_enabled:create():listable("Force Default States", {
    [1] = "Target \194\187 Zeus"
}):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
v345.settings_r.safety_dynamic = v345.settings_r.safety_enabled:create():switch("Dynamic Default", false):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
v345.settings_r.hitgroups_enabled = v345.groups_r.settings_r:switch("\a" .. hexx .. ui.get_icon("shield-slash") .. "\aDEFAULT" .. "   Configure Hitgroups", false):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
v345.settings_r.hitgroups_limbs_disabler = v345.settings_r.hitgroups_enabled:create():listable("Disable Limbs", {
    [1] = "Local \194\187 Moving", 
    [2] = "Forcing Body Aim", 
    [3] = "Forcing Safe Points"
}):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
v345.settings_r.damage_clamping_enabled = v345.groups_r.settings_r:switch("\a" .. hexx .. ui.get_icon("shield-heart") .. "\aDEFAULT" .. "     Safety Damage Override", false):tooltip("\aFFCC50FF" .. ui.get_icon("circle-exclamation") .. "  EXPLANATION\n \n\aDEFAULT" .. "Set your Min. Damage to the maximum damage you can deal to the target's body when forcing safety or body states."):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
v345.settings_r.damage_clamping_states = v345.settings_r.damage_clamping_enabled:create():listable("States", {
    [1] = "Forcing Body Aim", 
    [2] = "Forcing Safe Points"
}):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
v345.settings_r.damage_clamping_ignore_min_damage = v345.settings_r.damage_clamping_enabled:create():switch("Ignore Min. Damage", false):tooltip("\aFFCC50FF" .. ui.get_icon("circle-exclamation") .. "  EXPLANATION\n \n\aDEFAULT" .. "Enable to completely ignore your set Min. Damage. When disabled, it only overrides if the predicted damage is lower than your Min. Damage."):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
v345.settings_r.dynamics = v345.groups_r.settings_r:listable("\a" .. hexx .. ui.get_icon("hourglass-start") .. "\aDEFAULT" .. "   Dynamics", {
    [1] = "Delay Shot", 
    [2] = "Point Scales", 
    [3] = "Hit Chance"
});
v345.settings_r.aggressive = v345.groups_r.logic_override:switch("\a" .. hexx .. ui.get_icon("face-tired") .. "\aDEFAULT" .. "     Aggressive", false):tooltip("\a" .. hexx .. ui.get_icon("circle-exclamation") .. "  EXPLANATION\n \nBind this setting to a key!\n \n\aDEFAULT" .. "Will apply a really aggressive config to your ragebot. Use it to jumpshot or as a panic button."):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
v345.settings_r.two_shot = v345.groups_r.logic_override:switch("\a" .. hexx .. ui.get_icon("circle-2") .. "\aDEFAULT" .. "     2-Shot", false):tooltip("\a" .. hexx .. ui.get_icon("circle-exclamation") .. "\aDEFAULT" .. " If you're using autosnipers, it will check your target's health, divide it by 2, and set the resulting figure as the minimum damage value"):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
v345.settings_r.hs_on_pistol = v345.groups_r.logic_override:switch("\a" .. hexx .. ui.get_icon("shield") .. "\aDEFAULT" .. "     HS On-Pistol", false):tooltip("\a" .. hexx .. ui.get_icon("circle-exclamation") .. "\aDEFAULT" .. " Will automatically enable Hide Shots when you're holding pistols. Switching back to another kind of weapon will disable Hide Shots and enable Double Tap. (If it was ON before)  \aFF0000FF MAY CAUSE UNEXPECTED DEATHS. USE AT YOUR OWN RISK!"):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
v345.settings_r.should_charge_on_fake_lag = v345.settings_r.hs_on_pistol:create():switch("Allow To Charge HS On Fake Lag"):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
v345.settings_r.auto_switch_enabled = v49:switch("\a" .. hexx .. ui.get_icon("arrows-repeat-1") .. "\aDEFAULT" .. "     Auto Pistol ", false):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
v345.settings_r.auto_switch_desc_label = v345.settings_r.auto_switch_enabled:create():label("\a" .. hexx .. ui.get_icon("bars-filter") .. "                                                                         " .. ui.get_icon("bars-filter")):visibility(false):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
v345.settings_r.auto_switch_desc_dist_knife = v345.settings_r.auto_switch_enabled:create():slider(" Knife Dist.", 100, 1000, 500):visibility(false):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
v345.settings_r.auto_switch_desc_dist_zeus = v345.settings_r.auto_switch_enabled:create():slider(" Zeus Dist.", 100, 1000, 500):visibility(false):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
v345.settings_r.auto_switch_desc_enable_to = v345.settings_r.auto_switch_enabled:create():switch("Switch to Zeus on Knife push"):visibility(false):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
v345.settings_r.auto_switch_force_baim = v345.settings_r.auto_switch_enabled:create():switch("Force Baim (On-Trigger)"):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
v345.settings_r.auto_switch_teleport = v345.settings_r.auto_switch_enabled:create():switch("Break Lc"):visibility(false):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
v345.settings_r.auto_switch_enabled:tooltip("Will automatically switch to a \a4682B480PISTOL \aDEFAULTif the enemy is pushing you with a \aFF0000FFKNIFE/ZEUS \aDEFAULTor close enough for posing a threat. (Will dynamically switch weapons based on the target's current weapon. \aFF0000FF MAY CAUSE UNEXPECTED DEATHS OR FALSE ACTIVATIONS. USE AT YOUR OWN RISK! (BETTER BIND IT)");
v345.settings_r.quick_switch_after_nade = v1.auto_nades:switch("\a" .. hexx .. ui.get_icon("bomb") .. "\aDEFAULT" .. "     Quick Switch After Nade ", false):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
v345.settings_r.quick_switch_slot = v345.settings_r.quick_switch_after_nade:create():combo("Switch to Slot", {
    [1] = "Disabled", 
    [2] = "Slot 1", 
    [3] = "Slot 2", 
    [4] = "Slot 3", 
    [5] = "Slot 4", 
    [6] = "Slot 5"
}):visibility(false):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
v345.settings_r.quick_switch_after_nade:tooltip("After Nade is being thrown, will switch your slot to the selected number:                                                         >> 1 = Primary Weapon                           >> 2 = Secondary Weapon (Pistol)                                       >> 3 = Knife                                                                >> 4 = Grenades                                                                >> 5 = Bomb (If T)   \aFF0000FF MAY CAUSE UNEXPECTED DEATHS OR FALSE ACTIVATIONS. USE AT YOUR OWN RISK! (BETTER BIND IT)");
v345.settings_r.safe_defuse_enabled = v49:switch("\a" .. hexx .. ui.get_icon("user-shield") .. "\aDEFAULT" .. "    Safe Defuse ", false):tooltip("Will stop the defuse process and switch to the " .. "\a" .. hexx .. "selected slot" .. " \aDEFAULTif you are hittable. \aFF0000FF MAY CAUSE UNEXPECTED DEATHS OR FALSE ACTIVATIONS. USE AT YOUR OWN RISK!"):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
v345.settings_r.safe_defuse_enabled_setts = v345.settings_r.safe_defuse_enabled:create();
v345.settings_r.safe_defuse_weapon_switch = v345.settings_r.safe_defuse_enabled_setts:list("Weapon Switch", {
    [1] = "Disabled", 
    [2] = "Slot 1", 
    [3] = "Slot 2", 
    [4] = "Slot 3"
}):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
local v347 = v49:switch("\a" .. hexx .. ui.get_icon("shield-check") .. "\aDEFAULT" .. "     Safe Plant ", false):tooltip("Will stop the planting process and switch to the " .. "\a" .. hexx .. "selected slot" .. " \aDEFAULTif you are hittable. \aFF0000FF MAY CAUSE UNEXPECTED DEATHS OR FALSE ACTIVATIONS. USE AT YOUR OWN RISK!"):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
local v348 = v347:create():list("Weapon Switch", {
    [1] = "Disabled", 
    [2] = "Slot 1", 
    [3] = "Slot 2", 
    [4] = "Slot 3"
}):visibility(false):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
v345.settings_r.should_charge_on_fake_lag:visibility(v345.settings_r.hs_on_pistol:get());
v345.settings_r.hs_on_pistol:set_callback(function()
    -- upvalues: v345 (ref)
    v345.settings_r.should_charge_on_fake_lag:visibility(v345.settings_r.hs_on_pistol:get());
end);
v313:set_callback(function()
    -- upvalues: v345 (ref), v313 (ref)
    local v349 = v345.settings_r.hs_on_pistol:get();
    if v313:get() then
        v345.settings_r.hs_on_pistol:override(false);
        v345.settings_r.hs_on_pistol:disabled(true);
    else
        v345.settings_r.hs_on_pistol:set(v349);
        v345.settings_r.hs_on_pistol:disabled(false);
    end;
end);
v345.settings_r.safe_defuse_enabled_setts:visibility(v345.settings_r.safe_defuse_enabled:get());
v345.settings_r.safe_defuse_enabled:set_callback(function(v350)
    -- upvalues: v345 (ref)
    local v351 = v350:get();
    v345.settings_r.safe_defuse_enabled_setts:visibility(v351);
end);
v345.settings_r.quick_switch_slot:visibility(v345.settings_r.quick_switch_after_nade:get());
v345.settings_r.quick_switch_after_nade:set_callback(function(v352)
    -- upvalues: v345 (ref)
    local v353 = v352:get();
    v345.settings_r.quick_switch_slot:visibility(v353);
end);
v345.settings_r.auto_switch_desc_dist_knife:visibility(v345.settings_r.auto_switch_enabled:get());
v345.settings_r.auto_switch_desc_dist_zeus:visibility(v345.settings_r.auto_switch_enabled:get());
v345.settings_r.auto_switch_desc_enable_to:visibility(v345.settings_r.auto_switch_enabled:get());
v345.settings_r.auto_switch_desc_label:visibility(v345.settings_r.auto_switch_enabled:get());
v345.settings_r.auto_switch_force_baim:visibility(v345.settings_r.auto_switch_enabled:get());
v345.settings_r.auto_switch_enabled:set_callback(function(v354)
    -- upvalues: v345 (ref)
    local v355 = v354:get();
    v345.settings_r.auto_switch_desc_dist_knife:visibility(v355);
    v345.settings_r.auto_switch_desc_dist_zeus:visibility(v355);
    v345.settings_r.auto_switch_desc_enable_to:visibility(v355);
    v345.settings_r.auto_switch_desc_label:visibility(v355);
    v345.settings_r.auto_switch_force_baim:visibility(v355);
end);
v348:visibility(v347:get());
v347:set_callback(function(v356)
    -- upvalues: v348 (ref)
    local v357 = v356:get();
    v348:visibility(v357);
end);
local v358 = false;
events.bomb_abortplant:set(function()
    -- upvalues: v358 (ref)
    local v359 = entity.get_local_player();
    if v359 == nil or not v359:is_alive() then
        return;
    else
        v358 = false;
        return;
    end;
end);
events.bomb_beginplant:set(function()
    -- upvalues: v358 (ref)
    local v360 = entity.get_local_player();
    if v360 == nil or not v360:is_alive() then
        return;
    else
        v358 = true;
        return;
    end;
end);
events.bomb_planted:set(function()
    -- upvalues: v358 (ref)
    local v361 = entity.get_local_player();
    if v361 == nil or not v361:is_alive() then
        return;
    else
        v358 = false;
        return;
    end;
end);
stop_planting = function()
    -- upvalues: v348 (ref)
    local v362 = entity.get_local_player();
    if v362 == nil or not v362:is_alive() then
        return;
    else
        local v363 = v348:get();
        local _ = entity.get_local_player();
        if v363 == 2 then
            utils.console_exec("slot1");
        elseif v363 == 3 then
            utils.console_exec("slot2");
        elseif v363 == 4 then
            utils.console_exec("slot3");
        end;
        return;
    end;
end;
check_safe_plant = function()
    -- upvalues: v347 (ref), v358 (ref)
    if not v347:get() then
        return;
    else
        local v365 = entity.get_local_player();
        if v365 == nil or not v365:is_alive() then
            return;
        else
            if v358 and entity.get_threat(true) then
                stop_planting();
            end;
            return;
        end;
    end;
end;
stop_defusing = function()
    -- upvalues: v345 (ref)
    local v366 = entity.get_local_player();
    if v366 == nil or not v366:is_alive() then
        return;
    else
        utils.console_exec("-use");
        local v367 = v345.settings_r.safe_defuse_weapon_switch:get();
        if v367 == 2 then
            utils.console_exec("slot1");
        elseif v367 == 3 then
            utils.console_exec("slot2");
        elseif v367 == 4 then
            utils.console_exec("slot3");
        end;
        return;
    end;
end;
check_safe_defuse = function()
    -- upvalues: v345 (ref)
    if not v345.settings_r.safe_defuse_enabled:get() then
        return;
    else
        local v368 = entity.get_local_player();
        if v368 == nil or not v368:is_alive() then
            return;
        elseif not v368.m_bIsDefusing then
            return;
        else
            if entity.get_threat(true) then
                stop_defusing();
            end;
            return;
        end;
    end;
end;
v345.variables.get_state = function(v369)
    local v370 = v369:get_override();
    return v370 == nil and v369:get() or v370;
end;
v345.variables.is_threat = function(v371)
    local v372 = entity.get_local_player();
    if v372 == nil or not v372:is_alive() or v371 == nil or not v371:is_alive() then
        return false;
    else
        for v373 = 1, 7 do
            local v374 = utils.trace_bullet(v372, v372:get_eye_position(), v371:get_hitbox_position(v373));
            local v375 = utils.trace_bullet(v371, v371:get_eye_position(), v372:get_hitbox_position(v373));
            if v374 ~= nil and v374 ~= 0 or v375 ~= nil and v375 ~= 0 then
                return true;
            end;
        end;
        return false;
    end;
end;
v345.variables.get_target = function()
    -- upvalues: v345 (ref)
    local v376 = entity.get_local_player();
    if v376 == nil or not v376:is_alive() then
        return nil;
    else
        local v377 = render.camera_position();
        local v378 = render.camera_angles();
        local v379 = vector():angles(v378);
        local l_huge_0 = math.huge;
        local v381 = nil;
        for _, v383 in pairs(entity.get_players(true, true)) do
            if v383:is_alive() and v383:get_network_state() <= 1 and v345.variables.is_threat(v383) then
                local v384 = v383:get_hitbox_position(1):dist_to_ray(v377, v379);
                if v384 < l_huge_0 then
                    l_huge_0 = v384;
                    v381 = v383;
                end;
            end;
        end;
        if v381 ~= nil then
            return v381;
        else
            for _, v386 in pairs(entity.get_players(true, true)) do
                if v386:is_alive() and v386:get_network_state() <= 1 then
                    local v387 = v386:get_hitbox_position(1):dist_to_ray(v377, v379);
                    if v387 < l_huge_0 then
                        l_huge_0 = v387;
                        v381 = v386;
                    end;
                end;
            end;
            return v381;
        end;
    end;
end;
v345.variables.reset = function()
    -- upvalues: v345 (ref)
    for _, v389 in pairs(v345.variables.values) do
        v389 = nil;
    end;
end;
v345.variables.lower_multiplier = function(v390, v391)
    if v390 > 1 then
        v390 = 1 + (v390 - 1) * v391;
    else
        v390 = 1 - (1 - v390) * v391;
    end;
    return v390;
end;
v345.variables.calculate = function(_)
    -- upvalues: v345 (ref)
    local v393 = entity.get_local_player();
    if v393 == nil or not v393:is_alive() then
        v345.variables.reset();
        return;
    else
        local v394 = v345.variables.get_target();
        v345.variables.target = v394;
        if v394 == nil or not v394:is_alive() then
            v345.variables.reset();
            return;
        else
            local l_m_vecVelocity_3 = v393.m_vecVelocity;
            local v396 = math.floor(math.sqrt(l_m_vecVelocity_3.x * l_m_vecVelocity_3.x + l_m_vecVelocity_3.y * l_m_vecVelocity_3.y));
            local v397 = v393:get_origin();
            local _ = v397.z;
            local v399 = v393.m_flDuckAmount ~= 0;
            local _ = l_m_vecVelocity_3.z ~= 0;
            local _ = v393.m_iHealth;
            local _ = v393.m_ArmorValue;
            local l_m_vecVelocity_4 = v394.m_vecVelocity;
            local v404 = math.floor(math.sqrt(l_m_vecVelocity_4.x * l_m_vecVelocity_4.x + l_m_vecVelocity_4.y * l_m_vecVelocity_4.y));
            local v405 = v394:get_origin();
            local _ = v405.z;
            local v407 = v394.m_flDuckAmount ~= 0;
            local v408 = l_m_vecVelocity_4.z ~= 0;
            local l_m_iHealth_1 = v394.m_iHealth;
            local l_m_ArmorValue_1 = v394.m_ArmorValue;
            local v411 = v394:get_eye_position():dist(v393:get_eye_position()) * 0.0254;
            local v412 = v397.z - v405.z;
            local v413 = utils.trace_bullet(v393, v393:get_eye_position(), v394:get_hitbox_position(3));
            local v414 = v393:get_player_weapon();
            if v414 == nil then
                return;
            else
                local v415 = v414:get_weapon_info();
                if v415 == nil then
                    return;
                else
                    local v416 = v394:get_player_weapon();
                    if v416 == nil then
                        return;
                    else
                        local v417 = v416:get_weapon_info();
                        if v417 == nil then
                            return;
                        else
                            local v418 = v415.damage * 1.25;
                            if l_m_ArmorValue_1 then
                                v418 = v418 * (v415.armor_ratio * 0.5);
                            end;
                            v418 = v418 * (1 - (v411 / 500 + 1) * 0.02);
                            local v419 = nil;
                            local v420 = nil;
                            local v421 = nil;
                            local v422 = nil;
                            local v423 = nil;
                            local v424 = nil;
                            local v425 = nil;
                            local v426 = nil;
                            local v427 = nil;
                            if v345.settings_r.safety_enabled:get() then
                                if v345.settings_r.safety_dynamic:get() then
                                    v419 = "Default";
                                    v420 = "Default";
                                    if v404 < 200 or v407 or v408 or l_m_iHealth_1 <= v418 then
                                        v419 = "Prefer";
                                    end;
                                    if v404 > 200 and not v407 or l_m_iHealth_1 <= v418 then
                                        v420 = "Prefer";
                                    end;
                                end;
                                if l_m_iHealth_1 <= v413 then
                                    if v345.settings_r.safety_body_aim_selection:get("Target \194\187 Lethal") then
                                        v419 = "Force";
                                    end;
                                    if v345.settings_r.safety_safe_points_selection:get("Target \194\187 Lethal") then
                                        v420 = "Force";
                                    end;
                                end;
                                if v417.weapon_type == 0 and v416:get_name() ~= "Zeus x27" or v417.weapon_type == 9 then
                                    if v345.settings_r.safety_body_aim_selection:get("Target \194\187 Nade / Knife") then
                                        v419 = "Force";
                                    end;
                                    if v345.settings_r.safety_safe_points_selection:get("Target \194\187 Nade / Knife") then
                                        v420 = "Force";
                                    end;
                                end;
                                if v407 then
                                    if v345.settings_r.safety_body_aim_selection:get("Target \194\187 Crouching") then
                                        v419 = "Force";
                                    end;
                                    if v345.settings_r.safety_safe_points_selection:get("Target \194\187 Crouching") then
                                        v420 = "Force";
                                    end;
                                end;
                                if v408 then
                                    if v345.settings_r.safety_body_aim_selection:get("Target \194\187 In Air") then
                                        v419 = "Force";
                                    end;
                                    if v345.settings_r.safety_safe_points_selection:get("Target \194\187 In Air") then
                                        v420 = "Force";
                                    end;
                                end;
                                if v404 > 320 then
                                    if v345.settings_r.safety_body_aim_selection:get("Target \194\187 High Velocity") then
                                        v419 = "Force";
                                    end;
                                    if v345.settings_r.safety_safe_points_selection:get("Target \194\187 High Velocity") then
                                        v420 = "Force";
                                    end;
                                end;
                                if v399 then
                                    if v345.settings_r.safety_body_aim_selection:get("Local \194\187 Crouching") then
                                        v419 = "Force";
                                    end;
                                    if v345.settings_r.safety_safe_points_selection:get("Local \194\187 Crouching") then
                                        v420 = "Force";
                                    end;
                                end;
                                if v416:get_name() == "Zeus x27" and v345.settings_r.safety_force_default:get("Target \194\187 Zeus") then
                                    v419 = "Default";
                                    v420 = "Default";
                                end;
                            end;
                            local v428 = v419 == "Force";
                            local v429 = false;
                            if v345.settings_r.hitgroups_enabled:get() then
                                if v396 > 3 and v345.settings_r.hitgroups_limbs_disabler:get("Local \194\187 Moving") then
                                    v429 = true;
                                end;
                                if v419 == "Force" and v345.settings_r.hitgroups_limbs_disabler:get("Forcing Body Aim") then
                                    v429 = true;
                                end;
                                if v420 == "Force" and v345.settings_r.hitgroups_limbs_disabler:get("Forcing Safe Points") then
                                    v429 = true;
                                end;
                            end;
                            local v430 = {};
                            local v431 = {};
                            for _, v433 in pairs(v345.refs.hitboxes:get()) do
                                if (v433 ~= "Head" or not v428) and (v433 ~= "Arms" and v433 ~= "Legs" and v433 ~= "Feet" or not v429) then
                                    table.insert(v430, v433);
                                end;
                            end;
                            for _, v435 in pairs(v345.refs.multipoint:get()) do
                                if (v435 ~= "Head" or not v428) and (v435 ~= "Arms" and v435 ~= "Legs" and v435 ~= "Feet" or not v429) then
                                    table.insert(v431, v435);
                                end;
                            end;
                            if v428 then
                                table.insert(v430, "Stomach");
                                table.insert(v431, "Stomach");
                            end;
                            v421 = v430;
                            v422 = v431;
                            if v345.settings_r.damage_clamping_enabled:get() then
                                if v419 == "Force" and v345.settings_r.damage_clamping_states:get("Forcing Body Aim") and (v345.settings_r.damage_clamping_ignore_min_damage:get() or v413 < v345.refs.min_damage:get()) then
                                    v423 = v413;
                                end;
                                if v420 == "Force" and v345.settings_r.damage_clamping_states:get("Forcing Safe Points") and (v345.settings_r.damage_clamping_ignore_min_damage:get() or v413 < v345.refs.min_damage:get()) then
                                    v423 = v413;
                                end;
                            end;
                            if v345.settings_r.dynamics:get("Delay Shot") then
                                v424 = false;
                                if v417.weapon_type == 1 then
                                    v424 = true;
                                end;
                                if v408 and v413 < l_m_iHealth_1 then
                                    v424 = true;
                                end;
                            end;
                            local v436 = 152.4 / (v414:get_inaccuracy() * 1000);
                            local _ = v411 < v436 and 0.8 or 0.4;
                            if v345.settings_r.dynamics:get("Point Scales") then
                                v425 = math.clamp(100 * (v436 / v411) - v412 * 0.1, 1, 90);
                                v426 = math.clamp(100 * (v436 * 2 / v411) - v412 * 0.1, 1, 90);
                            end;
                            if v345.settings_r.dynamics:get("Hit Chance") then
                                v427 = math.clamp(v436, 30, 80);
                            end;
                            if v345.settings_r.aggressive:get() then
                                v419 = "Default";
                                v420 = "Default";
                                v421 = {
                                    [1] = "Head", 
                                    [2] = "Chest", 
                                    [3] = "Stomach", 
                                    [4] = "Arms", 
                                    [5] = "Legs", 
                                    [6] = "Feet"
                                };
                                v422 = {
                                    [1] = "Head", 
                                    [2] = "Chest", 
                                    [3] = "Stomach", 
                                    [4] = "Arms", 
                                    [5] = "Legs", 
                                    [6] = "Feet"
                                };
                                v424 = false;
                                v425 = 90;
                                v426 = 90;
                                v427 = 30;
                            end;
                            v345.variables.values.body_aim = v419;
                            v345.variables.values.safe_points = v420;
                            v345.variables.values.hitboxes = v421;
                            v345.variables.values.multipoint = v422;
                            v345.variables.values.min_damage = v423;
                            v345.variables.values.min_damage_delay_shot = v424;
                            v345.variables.values.head_scale = v425;
                            v345.variables.values.body_scale = v426;
                            v345.variables.values.hit_chance = v427;
                            v345.variables.values.hit_chance_double_tap = v427;
                            return;
                        end;
                    end;
                end;
            end;
        end;
    end;
end;
v345.variables.handle_resolver = function(_)
    -- upvalues: v345 (ref)
    local v439 = entity.get_threat();
    if v439 == nil then
        return;
    else
        local l_m_vecVelocity_5 = v439.m_vecVelocity;
        local _ = math.floor(math.sqrt(l_m_vecVelocity_5.x * l_m_vecVelocity_5.x + l_m_vecVelocity_5.y * l_m_vecVelocity_5.y));
        local _ = v439:get_origin().z;
        local _ = v439.m_flDuckAmount ~= 0;
        local _ = l_m_vecVelocity_5.z ~= 0;
        local _ = v345.variables.get_state(v345.refs.body_aim) == "Force" or v345.variables.get_state(v345.refs.safe_points) == "Force";
        return;
    end;
end;
v345.variables.set_values = function(_)
    -- upvalues: v345 (ref)
    for v447, v448 in pairs(v345.refs) do
        v448:override(v345.variables.values[v447]);
    end;
end;
v345.variables.hitgroups = {
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
v345.variables.draw_debug = function(_)
    -- upvalues: v345 (ref)
    local l_target_0 = v345.variables.target;
    local v451 = "-";
    local v452 = "-";
    if l_target_0 ~= nil and l_target_0:is_player() and l_target_0:is_alive() then
        v451 = l_target_0:get_name();
        local v453 = l_target_0:get_player_weapon();
        if v453 ~= nil then
            v452 = v453:get_name();
        end;
    end;
end;
local v454 = false;
v345.variables.auto_switch_weapon = function()
    -- upvalues: v345 (ref), v454 (ref)
    local v455 = v345.settings_r.auto_switch_enabled:get();
    local v456 = entity.get_local_player();
    if v456 == nil or not v456:is_alive() then
        return;
    else
        local v457 = nil;
        local v458 = 999999;
        for _, v460 in pairs(entity.get_players(true, true)) do
            if v460:is_alive() then
                local v461 = v456:get_origin():dist((v460:get_origin()));
                if v461 < v458 then
                    v458 = v461;
                    v457 = v460;
                end;
            end;
        end;
        if v457 == nil then
            return;
        else
            local v462 = v457.get_player_weapon(v457);
            if v462 == nil then
                return;
            else
                local v463 = v345.settings_r.auto_switch_desc_dist_knife:get();
                local v464 = v345.settings_r.auto_switch_desc_dist_zeus:get();
                local v465 = v462:get_weapon_index();
                local l_v463_0 = v463;
                if v465 == 31 then
                    l_v463_0 = v464;
                end;
                if v455 and v458 < l_v463_0 then
                    if v465 == 42 or v465 == 59 or v465 == 31 then
                        if v345.settings_r.auto_switch_desc_enable_to:get() and v465 == 42 or v465 == 59 and not v465 == 31 then
                            utils.console_exec("slot11");
                        end;
                        if not v345.settings_r.auto_switch_desc_enable_to:get() then
                            utils.console_exec("slot2");
                            v454 = true;
                            if v345.settings_r.auto_switch_force_baim:get() then
                                v345.refs.body_aim:override("Force");
                            end;
                        elseif v454 then
                            utils.console_exec("slot1");
                            v345.refs.body_aim:override(nil);
                            v454 = false;
                        end;
                    elseif v454 then
                        utils.console_exec("slot1");
                        v345.refs.body_aim:override(nil);
                        v454 = false;
                    end;
                end;
                return;
            end;
        end;
    end;
end;
local v467 = false;
events.grenade_thrown:set(function(v468)
    -- upvalues: v345 (ref), v467 (ref)
    local v469 = entity.get_local_player();
    if v469:get_player_info().userid == v468.userid and v469:is_alive() and v345.settings_r.quick_switch_after_nade:get() then
        v467 = true;
    end;
end);
v345.variables.quick_switch_after_nade = function()
    -- upvalues: v467 (ref), v345 (ref)
    if not v467 then
        return;
    else
        local v470 = entity.get_local_player(true);
        if not v470 or not v470:is_alive() then
            return;
        else
            local v471 = v345.settings_r.quick_switch_slot:get("Switch to Slot");
            if v471 ~= "Disabled" and v470 and v470:is_alive() and v467 then
                utils.execute_after(0.01, function()
                    -- upvalues: v471 (ref)
                    local v472 = string.match(v471, "Slot (%d)");
                    utils.console_exec("slot" .. v472);
                end);
            end;
            v467 = false;
            return;
        end;
    end;
end;
local function v474()
    -- upvalues: v345 (ref)
    local v473 = {
        target = entity.get_threat(), 
        local_player = entity.get_local_player()
    };
    if v345.settings_r.two_shot:get() and v473.target and v473.local_player then
        v473.health = v473.target.m_iHealth;
        v473.my_weapon = v473.local_player:get_player_weapon();
        if v473.my_weapon == nil then
            return;
        else
            v473.my_weapon_index = v473.my_weapon:get_weapon_index();
            if (v473.my_weapon_index == 11 or v473.my_weapon_index == 38) and v473.local_player:is_alive() then
                v345.refs.min_damage:override(v473.health / 2);
                v345.refs.body_aim:override("Prefer");
            end;
        end;
    end;
end;
local v475 = {
    doubletap_was_enabled = false, 
    holding_pistols = false
};
local function v481()
    -- upvalues: v345 (ref), v475 (ref), v28 (ref)
    local v476 = entity.get_local_player();
    if v476 == nil or not v476:is_alive() then
        return;
    else
        local v477 = v476:get_player_weapon();
        if v477 == nil then
            return;
        else
            local v478 = v477:get_weapon_index();
            local v479 = ({
                [1] = true, 
                [2] = true, 
                [3] = true, 
                [4] = true, 
                [36] = true, 
                [30] = true, 
                [62] = true
            })[v478] ~= nil;
            local v480 = v345.settings_r.should_charge_on_fake_lag:get();
            if v345.settings_r.hs_on_pistol:get() then
                if v479 then
                    if not v475.holding_pistols then
                        v475.doubletap_was_enabled = v28.rage_doubletap:get();
                        v475.holding_pistols = true;
                        if v475.doubletap_was_enabled or v480 then
                            v28.rage_hideshots:override(true);
                        end;
                        v28.rage_doubletap:override(false);
                    end;
                elseif v475.holding_pistols then
                    v475.holding_pistols = false;
                    v28.rage_hideshots:override(false);
                    if v475.doubletap_was_enabled then
                        v28.rage_doubletap:override(true);
                    end;
                end;
            end;
            return;
        end;
    end;
end;
events.createmove:set(function(v482)
    -- upvalues: v345 (ref), v474 (ref), v481 (ref)
    v345.variables.calculate(v482);
    v345.variables.auto_switch_weapon();
    v345.variables.quick_switch_after_nade();
    check_safe_defuse();
    check_safe_plant();
    v345.variables.set_values(v482);
    v474();
    v481();
end);
events.render:set(function(_)

end);
events.player_death:set(function(v484)
    -- upvalues: v345 (ref)
    if entity.get_local_player() ~= nil and entity.get(v484.userid, true) == entity.get_local_player() then
        v345.variables.target = nil;
    end;
end);
static_clantag = "e a s y . sync";
static_clantag_active = false;
local v485 = v47:switch("\a" .. hexx .. ui.get_icon("tags") .. "\aDEFAULT" .. "     Clantag Spammer", false):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
local v486 = {
    reset = true, 
    timer = 0, 
    states = {
        [1] = "easy.sync", 
        [2] = "e asy.sync", 
        [3] = "e a sy.sync", 
        [4] = "e a s y.sync", 
        [5] = "e a s y . sync", 
        [6] = "e a s y . sync", 
        [7] = "e a s y . sync", 
        [8] = " a s y . sync", 
        [9] = " s y . sync", 
        [10] = " y . sync", 
        [11] = ". sync", 
        [12] = "sync", 
        [13] = "ync", 
        [14] = "nc", 
        [15] = "c", 
        [16] = "", 
        [17] = "e", 
        [18] = "ea", 
        [19] = "eas", 
        [20] = "easy", 
        [21] = "easy.", 
        [22] = "easy.s", 
        [23] = "easy.sy", 
        [24] = "easy.syn", 
        [25] = "easy.sync"
    }
};
v485:set_callback(function()
    -- upvalues: v485 (ref)
    if v485:get() == false then
        common.set_clan_tag("");
    end;
end);
local function v489(_)
    -- upvalues: v485 (ref), v486 (ref)
    if not v485:get() or static_clantag_active then
        if not v486.reset then
            common.set_clan_tag("");
            v486.reset = true;
        end;
        return;
    else
        v486.reset = false;
        local v488 = math.floor(globals.curtime * 4);
        if v486.timer ~= v488 then
            common.set_clan_tag(v486.states[v488 % #v486.states + 1]);
            v486.timer = v488;
        end;
        return;
    end;
end;
events.render:set(function(v490)
    -- upvalues: v489 (ref)
    v489(v490);
end);
events.createmove:set(function()
    -- upvalues: v485 (ref)
    local l_m_gamePhase_0 = entity.get_game_rules().m_gamePhase;
    if v485:get() and (l_m_gamePhase_0 == 4 or l_m_gamePhase_0 == 5 or l_m_gamePhase_0 == 11) then
        static_clantag_active = true;
        common.set_clan_tag(static_clantag);
    else
        static_clantag_active = false;
    end;
end);
local l_mtools_0 = require("neverlose/mtools");
local v493 = {
    font = render.load_font("nl\\easysyncdebug\\seguisb.ttf", 17, "ad"), 
    color_blue = color(200, 155, 255), 
    color_pink = ui.get_style("Switch Active"), 
    switch = v48:switch("\a" .. hexx .. ui.get_icon("tornado") .. "\aDEFAULT" .. "      Watermark", false):set_callback(function()
        -- upvalues: v66 (ref)
        v66();
    end), 
    MTools = require("neverlose/mtools"), 
    gradient = require("neverlose/gradient"), 
    ui_style_color = ui.get_style("Link Active"), 
    ui_style_color2 = ui.get_style("Switch Active"), 
    render_vars = {}, 
    ping = l_mtools_0.Client.GetPing(), 
    hexx = hexx
};
local v494 = {
    ping_value = "0", 
    box_height = 24, 
    gap = 5, 
    margin = 10, 
    ping_icon = "\a" .. hexx .. ui.get_icon("link-horizontal") .. "\aDEFAULT"
};
v493.gradient_animation = v493.gradient.text_animate("easy.sync", -1, {
    v35, 
    color(255, 255, 255)
});
local function v495()
    -- upvalues: v493 (ref), v495 (ref)
    if not v493.switch:get() then
        return;
    else
        v493.fps = v493.MTools.Client.GetFPS();
        local v496 = v493.MTools.Client.GetDAT();
        local v497 = tonumber(v496.hours);
        local v498 = v497 >= 12 and "pm" or "am";
        local v499 = v497 > 12 and v497 - 12 or v497 == 0 and 12 or v497;
        v493.time_text = string.format("%02d:%02d %s", v499, v496.minutes, v498);
        utils.execute_after(0.1, v495);
        return;
    end;
end;
v495();
local function v500()
    -- upvalues: v494 (ref), v493 (ref), v500 (ref)
    v494.ping_value = tostring(v493.MTools.Client.GetPing());
    utils.execute_after(0.1, v500);
end;
v500();
v493.switch:set_callback(function()
    -- upvalues: v495 (ref)
    v495();
end);
events.render:set(function()
    -- upvalues: v493 (ref), v494 (ref)
    if not v493.switch:get() then
        return;
    else
        local v501 = render.screen_size();
        local v502 = 10;
        local v503 = 5;
        local v504 = ("\a" .. hexx .. ui.get_icon("clock") .. "\aDEFAULT") .. " " .. v493.time_text;
        local v505 = render.measure_text(v493.font, "s", v504).x + v502 * 2;
        local v506 = 24;
        local v507 = vector(v501.x - v502, 10 + v506);
        local v508 = vector(v507.x - v505, 10);
        local v509 = common.get_username();
        local v510 = "\a" .. hexx .. ui.get_icon("tornado") .. "\aDEFAULT" .. " easy.sync" .. "  ~  trial  " .. "\a" .. hexx .. ui.get_icon("user") .. "\aDEFAULT" .. " " .. v509;
        local v511 = render.measure_text(v493.font, "s", v510).x + v502 * 2;
        local v512 = 24;
        local v513 = vector(v508.x - v511 - v503, 10);
        local v514 = vector(v513.x + v511, v513.y + v512);
        local v515 = ("\a" .. hexx .. ui.get_icon("chart-mixed") .. "\aDEFAULT") .. " fps: ";
        local v516 = render.measure_text(v493.font, "s", v515).x + v502 * 2;
        local l_x_0 = render.measure_text(v493.font, "s", "000").x;
        local v518 = 24;
        local v519 = vector(v513.x - v516 - l_x_0 - v503, 10);
        local v520 = vector(v519.x + v516 + l_x_0, v519.y + v518);
        local v521 = v494.ping_icon .. " ping: " .. v494.ping_value;
        local v522 = render.measure_text(v493.font, "s", v521).x + v494.margin * 2;
        local v523 = 24;
        local v524 = vector(v519.x - v522 - v494.gap, 10);
        local v525 = vector(v524.x + v522, v524.y + v523);
        render.shadow(v524, v525, color(0, 0, 0, 150), 40, 0, 4);
        render.gradient(v524, v525, v493.color_blue, v493.color_pink, v493.color_blue, v493.color_pink, 4);
        render.rect(vector(v524.x + 1, v524.y + 1), vector(v525.x - 1, v525.y - 1), color(32, 32, 32, 200), 4);
        render.text(v493.font, vector(v524.x + v494.margin, v524.y + (v523 - 17) / 2), color(255, 255, 255, 255), nil, v521);
        render.shadow(v508, v507, color(0, 0, 0, 150), 40, 0, 4);
        render.gradient(v508, v507, v493.color_blue, v493.color_pink, v493.color_blue, v493.color_pink, 4);
        render.rect(vector(v508.x + 1, v508.y + 1), vector(v507.x - 1, v507.y - 1), color(32, 32, 32, 200), 4);
        render.text(v493.font, vector(v508.x + v502, v508.y + (v506 - 17) / 2), color(255, 255, 255, 255), nil, v504);
        render.shadow(v513, v514, color(0, 0, 0, 150), 40, 0, 4);
        render.gradient(v513, v514, v493.color_blue, v493.color_pink, v493.color_blue, v493.color_pink, 4);
        render.rect(vector(v513.x + 1, v513.y + 1), vector(v514.x - 1, v514.y - 1), color(32, 32, 32, 200), 4);
        render.text(v493.font, vector(v513.x + v502, v513.y + (v512 - 17) / 2), color(255, 255, 255, 255), nil, v510);
        render.shadow(v519, v520, color(0, 0, 0, 150), 40, 0, 4);
        render.gradient(v519, v520, v493.color_blue, v493.color_pink, v493.color_blue, v493.color_pink, 4);
        render.rect(vector(v519.x + 1, v519.y + 1), vector(v520.x - 1, v520.y - 1), color(32, 32, 32, 200), 4);
        render.text(v493.font, vector(v519.x + v502, v519.y + (v518 - 17) / 2), color(255, 255, 255, 255), nil, v515);
        local v526 = tostring(v493.fps);
        local v527 = v520.x - v502 - render.measure_text(v493.font, "s", v526).x;
        render.text(v493.font, vector(v527, v519.y + (v518 - 17) / 2), color(255, 255, 255, 255), nil, v526);
        return;
    end;
end);
local v528 = v31.gradient.text("Model Breaker", false, green_white_colors_tp);
local v529 = v48:switch("\a" .. hexx .. ui.get_icon("wheelchair-move") .. "\aDEFAULT" .. "       Animation Breaker", false):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
local v530 = v529:create();
local v531 = v530:listable("Animations", {
    [1] = "Pitch 0 On-Land", 
    [2] = "Static Legs In-Air", 
    [3] = "Crouch Mini Model", 
    [4] = "Static Legs ~ Running", 
    [5] = "Static legs ~ Walking", 
    [6] = "Static legs ~ Crouching", 
    [7] = "Skating", 
    [8] = "Fast Ladder", 
    [9] = v528
}):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
v531:tooltip("All animations listed here are client-sided so don't worry!");
local v532 = 0;
events.render(function()
    -- upvalues: v530 (ref), v529 (ref)
    v530:visibility(v529:get());
end);
local function v535(v533)
    -- upvalues: v529 (ref), v531 (ref)
    local v534 = entity.get_local_player();
    if not v529:get() or not v531:get(8) or not v534 then
        return;
    else
        if v534.m_MoveType == 9 then
            if v533.sidemove == 0 then
                v533.view_angles.y = v533.view_angles.y + 45;
            end;
            if v533.sidemove < 0 and v533.in_forward then
                v533.view_angles.y = v533.view_angles.y + 90;
            end;
            if v533.sidemove > 0 and v533.in_back then
                v533.view_angles.y = v533.view_angles.y + 90;
            end;
            v533.in_moveleft = v533.in_back;
            v533.in_moveright = v533.in_forward;
            if v533.view_angles.x < 0 then
                v533.view_angles.x = -45;
            end;
        end;
        return;
    end;
end;
events.post_update_clientside_animation:set(function(v536)
    -- upvalues: v529 (ref), v532 (ref), v531 (ref)
    if not v529:get() then
        return;
    else
        if v536 == entity.get_local_player() then
            local v537 = v536:get_anim_state();
            if v537.on_ground == true then
                v532 = v532 + 1;
            else
                v532 = 0;
            end;
            if v537.landing and v532 >= 3 and v531:get(1) then
                v536.m_flPoseParameter[12] = 0.5;
            end;
            if v531:get(2) then
                v536.m_flPoseParameter[6] = 0.5;
            end;
            if v531:get(3) and v537.on_ground then
                v536.m_flPoseParameter[16] = 0;
                v536.m_flPoseParameter[17] = 0;
            end;
            if v531:get(4) then
                v536.m_flPoseParameter[10] = 0;
            end;
            if v531:get(5) then
                v536.m_flPoseParameter[9] = 0;
            end;
            if v531:get(6) then
                v536.m_flPoseParameter[8] = 0;
            end;
            if v531:get(7) then
                v536.m_flPoseParameter[7] = 0;
            end;
            if v531:get(9) then
                v536.m_flPoseParameter[3] = math.random(0, 10) / 10;
                v536.m_flPoseParameter[7] = math.random(0, 10) / 10;
                v536.m_flPoseParameter[6] = math.random(0, 10) / 10;
            end;
        end;
        return;
    end;
end);
events.createmove:set(function(v538)
    -- upvalues: v531 (ref), v535 (ref)
    if v531:get(8) then
        v535(v538);
    end;
end);
local v539 = {
    hc_handle_visibility = false, 
    auto_min_dmg = 30, 
    auto_hc = 50, 
    awp_min_dmg = 30, 
    awp_hc = 50, 
    scout_min_dmg = 30, 
    scout_hc = 50, 
    main_switch = v47:switch("\a" .. hexx .. ui.get_icon("bat") .. "\aDEFAULT" .. "    In-Air", false):set_callback(function()
        -- upvalues: v66 (ref)
        v66();
    end), 
    weapons = {
        [1] = "SSG-08", 
        [2] = "AWP", 
        [3] = "Auto Snipers"
    }
};
v539.insides = v539.main_switch:create():visibility(v539.main_switch:get());
v539.weapon_ui = v539.insides:combo("", v539.weapons):visibility(v539.main_switch:get()):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
v539.hc_slider_scout_ui = v539.insides:slider("Scout Hitchance", 0, 100, v539.scout_hc, 1, "%"):visibility(v539.main_switch:get()):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
v539.mndmg_slider_scout_ui = v539.insides:slider("Scout Min. Dmg", 0, 99, v539.scout_min_dmg):visibility(v539.main_switch:get()):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
v539.hc_slider_awp_ui = v539.insides:slider("AWP Hitchance", 0, 100, v539.awp_hc, 1, "%"):visibility(v539.main_switch:get()):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
v539.mndmg_slider_awp_ui = v539.insides:slider("AWP Min. Dmg", 0, 99, v539.awp_min_dmg):visibility(v539.main_switch:get()):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
v539.hc_slider_auto_ui = v539.insides:slider("Auto Hitchance", 0, 100, v539.auto_hc, 1, "%"):visibility(v539.main_switch:get()):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
v539.mndmg_slider_auto_ui = v539.insides:slider("Auto Min. Dmg", 0, 99, v539.auto_min_dmg):visibility(v539.main_switch:get()):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
v539.hc_handle_ui = v539.insides:switch(""):visibility(v539.hc_handle_visibility);
v539.main_switch:set_callback(function()
    -- upvalues: v539 (ref)
    v539.insides:visibility(v539.main_switch:get());
end);
local function v542()
    local v540 = entity.get_local_player();
    if not v540 then
        return nil;
    else
        local v541 = v540:get_player_weapon();
        if not v541 then
            return nil;
        else
            return v541:get_weapon_index();
        end;
    end;
end;
local function v544(v543)
    -- upvalues: v28 (ref), v539 (ref)
    if v543 == 40 then
        v28.hc_scout:override(v539.hc_slider_scout_ui:get());
        v28.mndmg_scout:override(v539.mndmg_slider_scout_ui:get());
    elseif v543 == 9 then
        v28.hc_awp:override(v539.hc_slider_awp_ui:get());
        v28.mndmg_awp:override(v539.mndmg_slider_awp_ui:get());
    elseif v543 == 38 or v543 == 11 then
        v28.hc_autosnipers:override(v539.hc_slider_auto_ui:get());
        v28.mndmg_autosnipers:override(v539.mndmg_slider_auto_ui:get());
    end;
end;
local function v546()
    -- upvalues: v539 (ref)
    local v545 = entity.get_local_player().m_vecVelocity.z ~= 0;
    if v545 then
        v539.hc_handle_ui:set(true);
    elseif not v545 then
        v539.hc_handle_ui:set(false);
    end;
end;
local function v549()
    -- upvalues: v539 (ref), v542 (ref), v544 (ref)
    local v547 = entity.get_local_player().m_vecVelocity.z ~= 0;
    if not v539.main_switch:get() then
        return;
    elseif not v539.hc_handle_ui:get() then
        return;
    else
        local v548 = v542();
        if not v548 then
            return;
        else
            if v547 then
                v544(v548);
            end;
            return;
        end;
    end;
end;
events.createmove:set(function()
    -- upvalues: v549 (ref), v546 (ref)
    v549();
    v546();
end);
v539.main_switch:set_callback(function(v550)
    -- upvalues: v539 (ref)
    local v551 = v550:get();
    v539.weapon_ui:visibility(v551);
    v539.hc_slider_scout_ui:visibility(v551 and v539.weapon_ui:get() == "SSG-08");
    v539.mndmg_slider_scout_ui:visibility(v551 and v539.weapon_ui:get() == "SSG-08");
    v539.hc_slider_awp_ui:visibility(v551 and v539.weapon_ui:get() == "AWP");
    v539.mndmg_slider_awp_ui:visibility(v551 and v539.weapon_ui:get() == "AWP");
    v539.hc_slider_auto_ui:visibility(v551 and v539.weapon_ui:get() == "Auto Snipers");
    v539.mndmg_slider_auto_ui:visibility(v551 and v539.weapon_ui:get() == "Auto Snipers");
end);
v539.weapon_ui:set_callback(function()
    -- upvalues: v539 (ref)
    local v552 = v539.weapon_ui:get();
    v539.hc_slider_scout_ui:visibility(v552 == "SSG-08");
    v539.mndmg_slider_scout_ui:visibility(v552 == "SSG-08");
    v539.hc_slider_awp_ui:visibility(v552 == "AWP");
    v539.mndmg_slider_awp_ui:visibility(v552 == "AWP");
    v539.hc_slider_auto_ui:visibility(v552 == "Auto Snipers");
    v539.mndmg_slider_auto_ui:visibility(v552 == "Auto Snipers");
end);
v539.main_switch:set_callback(function()
    -- upvalues: v539 (ref)
    if v539.main_switch:get() then
        v539.weapon_ui:set("SSG-08");
    end;
end);
local v553 = {
    hc_handle_visibility = false, 
    auto_min_dmg = 30, 
    auto_hc = 50, 
    awp_min_dmg = 30, 
    awp_hc = 50, 
    scout_min_dmg = 30, 
    scout_hc = 50, 
    main_switch = v47:switch("\a" .. hexx .. ui.get_icon("telescope") .. "\aDEFAULT" .. "    No-Scope", false):set_callback(function()
        -- upvalues: v66 (ref)
        v66();
    end), 
    sel_weapon = {
        [1] = "SSG-08", 
        [2] = "AWP", 
        [3] = "Auto Snipers"
    }
};
v553.insides = v553.main_switch:create():visibility(v553.main_switch:get());
v553.sel_weapon_ui = v553.insides:combo("", v553.sel_weapon):visibility(false):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
v553.hc_slider_scout_ui = v553.insides:slider("Scout No-Scope Hitchance", 0, 100, v553.scout_hc, 1, "%"):visibility(false):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
v553.mndmg_slider_scout_ui = v553.insides:slider("Scout No-Scope Min. Dmg", 0, 99, v553.scout_min_dmg):visibility(false):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
v553.hc_slider_awp_ui = v553.insides:slider("AWP No-Scope Hitchance", 0, 100, v553.awp_hc, 1, "%"):visibility(false):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
v553.mndmg_slider_awp_ui = v553.insides:slider("AWP No-Scope Min. Dmg", 0, 99, v553.awp_min_dmg):visibility(false):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
v553.hc_slider_auto_ui = v553.insides:slider("Auto No-Scope Hitchance", 0, 100, v553.auto_hc, 1, "%"):visibility(false):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
v553.mndmg_slider_auto_ui = v553.insides:slider("Auto No-Scope Min. Dmg", 0, 99, v553.auto_min_dmg):visibility(false):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
v553.hc_handle_ui = v553.insides:switch(""):visibility(v553.hc_handle_visibility);
v553.main_switch:set_callback(function()
    -- upvalues: v553 (ref)
    v553.insides:visibility(v553.main_switch:get());
end);
local function v556()
    local v554 = entity.get_local_player();
    if not v554 then
        return nil;
    else
        local v555 = v554:get_player_weapon();
        if not v555 then
            return nil;
        else
            return v555:get_weapon_index();
        end;
    end;
end;
local function v558()
    -- upvalues: v556 (ref), v28 (ref), v553 (ref)
    local v557 = v556();
    if not v557 then
        return;
    else
        if v557 == 40 then
            v28.hc_scout:override(v553.hc_slider_scout_ui:get());
            v28.mndmg_scout:override(v553.mndmg_slider_scout_ui:get());
        elseif v557 == 9 then
            v28.hc_awp:override(v553.hc_slider_awp_ui:get());
            v28.mndmg_awp:override(v553.mndmg_slider_awp_ui:get());
        elseif v557 == 38 or v557 == 11 then
            v28.hc_autosnipers:override(v553.hc_slider_auto_ui:get());
            v28.mndmg_autosnipers:override(v553.mndmg_slider_auto_ui:get());
        end;
        return;
    end;
end;
local function v560()
    -- upvalues: v553 (ref), v558 (ref)
    local v559 = entity.get_local_player();
    if not v559 or not v553.main_switch:get() then
        return;
    else
        if v559.m_bIsScoped == false then
            v558();
        end;
        return;
    end;
end;
v553.sel_weapon_ui:set_callback(function()
    -- upvalues: v553 (ref)
    local v561 = v553.sel_weapon_ui:get();
    v553.hc_slider_scout_ui:visibility(v561 == "SSG-08");
    v553.mndmg_slider_scout_ui:visibility(v561 == "SSG-08");
    v553.hc_slider_awp_ui:visibility(v561 == "AWP");
    v553.mndmg_slider_awp_ui:visibility(v561 == "AWP");
    v553.hc_slider_auto_ui:visibility(v561 == "Auto Snipers");
    v553.mndmg_slider_auto_ui:visibility(v561 == "Auto Snipers");
end);
v553.main_switch:set_callback(function(v562)
    -- upvalues: v553 (ref)
    local v563 = v562:get();
    v553.sel_weapon_ui:visibility(v563);
    v553.hc_slider_scout_ui:visibility(v563 and v553.sel_weapon_ui:get() == "SSG-08");
    v553.mndmg_slider_scout_ui:visibility(v563 and v553.sel_weapon_ui:get() == "SSG-08");
    v553.hc_slider_awp_ui:visibility(v563 and v553.sel_weapon_ui:get() == "AWP");
    v553.mndmg_slider_awp_ui:visibility(v563 and v553.sel_weapon_ui:get() == "AWP");
    v553.hc_slider_auto_ui:visibility(v563 and v553.sel_weapon_ui:get() == "Auto Snipers");
    v553.mndmg_slider_auto_ui:visibility(v563 and v553.sel_weapon_ui:get() == "Auto Snipers");
end);
events.createmove:set(function()
    -- upvalues: v560 (ref)
    v560();
end);
local v564 = {
    [1] = {
        [1] = nil, 
        [2] = 0, 
        [1] = color(0, 255, 0)
    }, 
    [2] = {
        [1] = nil, 
        [2] = 1, 
        [1] = color(255, 255, 255)
    }
};
local v565 = v31.gradient.text("Skeet", false, v564);
events.render:set(function(_)
    -- upvalues: v565 (ref)
    render.text(font_test, vector_position, color(255, 255, 255), nil, v565);
end);
local v567 = v47:switch("\a" .. hexx .. ui.get_icon("transporter-3") .. "\aDEFAULT" .. "     Force Teleport", false):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
local v568 = v567:create():combo("Style", {
    [1] = nil, 
    [2] = "Regular", 
    [1] = v565
}):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
local v569 = v567:create():slider("Delay", 1, 5, 3, 0.1, "s"):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
v567:set_callback(function()
    -- upvalues: v567 (ref), v568 (ref), v565 (ref), v569 (ref)
    if v567:get() then
        if v568:get() == v565 then
            ui.find("Aimbot", "Ragebot", "Main", "Double Tap"):override(false);
            utils.execute_after(v569:get() / 10, function()
                ui.find("Aimbot", "Ragebot", "Main", "Double Tap"):override(nil);
            end);
        else
            rage.exploit:force_teleport();
        end;
    end;
end);
local v570 = v47:switch("\a" .. hexx .. ui.get_icon("biohazard") .. "\aDEFAULT" .. "     Trash Talk", false):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
local v571 = v570:create();
local v572 = v571:combo("Language", {
    [1] = "Russian", 
    [2] = "English"
}):visibility(false):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
local v573 = v571:combo("Type", {
    [1] = "\a" .. hexx .. ui.get_icon("sword") .. "\aDEFAULT Lua War", 
    [2] = "\a" .. hexx .. ui.get_icon("face-swear") .. "\aDEFAULT Regular"
}):visibility(false):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
local v574 = v571:switch("\a" .. hexx .. ui.get_icon("shuffle") .. "\aDEFAULT" .. "   Shuffle Between", false):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
v570:set_callback(function(v575)
    -- upvalues: v572 (ref), v573 (ref)
    local v576 = v575:get();
    v572:visibility(v576);
    v573:visibility(v576);
end);
local v577 = {
    [1] = "\208\186\209\128\209\131\209\130\208\190\208\185, \208\189\208\176\208\178\208\181\209\128\208\189\208\190\208\181 \209\135\208\184\208\188\208\181\209\128\209\131 \208\179\208\181\209\130\208\189\209\131\208\187 \208\180\208\176?", 
    [2] = "\208\177\209\128\208\190 \209\129\208\190\209\128\209\128\208\184 \209\143 \208\186\208\184\209\129\208\187\208\190\209\130\209\131 \209\131\208\177\208\184\208\187 \208\176\209\129\208\184\208\180 \209\130\208\181\209\135 \208\177\208\190\208\187\209\140\209\136\208\181 \208\189\208\181 \208\190\208\177\208\189\208\190\208\178\208\184\209\130\209\140\209\129\209\143(((", 
    [3] = "$\209\143 \209\128\208\158\209\130 \208\181\208\145\208\176\208\187 \208\146\208\176\208\168\208\149\208\185 \208\156\208\181\208\155\208\144\208\157\209\133\208\190\208\155\208\184\208\184$", 
    [4] = "\208\144\208\165\208\144\208\165\208\144\208\165\208\144\208\165\208\144\208\165 \208\181\208\177\208\176\209\130\209\140 \209\130\209\139 \208\177\208\187\209\131\209\133\208\179\208\176\208\189\208\179", 
    [5] = "\208\184\208\180\208\184 \208\181\209\137\208\181 \208\189\208\176 \208\186\208\189\208\190\208\191\208\190\209\135\208\186\208\184 \208\178\208\189\209\131\209\130\209\128\208\184 \209\129\208\178\208\190\208\181\208\185 \208\191\208\176\209\129\209\130\209\139-\209\133\209\131\208\181\209\130\209\139 \208\191\208\190\209\130\209\139\208\186\208\176\208\185, \208\188\208\190\208\182\208\181\209\130 \208\176\208\189\209\130\208\184\208\176\208\184\208\188\209\139 \208\189\208\176\208\185\208\180\208\181\209\136\209\140", 
    [6] = "\208\149\208\145\208\144\208\162\208\172 \208\145\208\160\208\158\208\158\208\158 \208\162\208\171 \208\162\208\144\208\154 \208\167\208\149\208\162\208\154\208\158 \208\148\208\149\208\157\208\172\208\147\208\152 \208\159\208\160\208\158\208\149\208\145\208\144\208\155$$$", 
    [7] = "\208\178\209\139\208\186\208\187\209\142\209\135\208\184 \209\129\208\178\208\190\209\142 \209\133\209\131\208\181\209\130\209\131 \208\189\208\181 \208\191\208\190\208\183\208\190\209\128\209\140\209\129\209\143", 
    [8] = "\208\184\208\178\208\176\208\189 \208\183\208\190\208\187\208\190 \208\177\209\139 \208\187\209\131\209\135\209\136\208\181 \208\189\208\181\208\191\208\190\208\191\208\176\208\180\208\176\208\185\208\186\208\184 \208\189\208\176\208\191\208\184\209\129\208\176\208\187 \209\135\208\181\208\188 \209\130\208\178\208\190\208\185 \208\186\208\190\208\180\208\181\209\128)", 
    [9] = "\208\187\209\131\208\176\209\133\209\131 \208\178\209\139\208\186\208\187\209\142\209\135\208\184 \209\129\208\178\208\190\209\142 \208\176 \209\130\208\190 \209\133\209\131\208\185\208\189\208\181\208\185 \208\189\208\176 \208\178\208\181\209\129\209\140 \209\129\208\181\209\128\208\178\208\181\209\128 \208\191\208\176\209\133\208\189\208\181\209\130", 
    [10] = "\209\143 \208\189\208\176\208\180\208\181\209\142\209\129\209\140 \209\141\209\130\208\190 \209\129\209\130\208\176\208\189\208\181\209\130 \208\180\208\187\209\143 \209\130\208\181\208\177\209\143 \208\183\208\178\208\190\208\189\208\190\209\135\208\186\208\190\208\188 \208\179\208\181\209\130\208\189\209\131\209\130\209\140 easy.sync $", 
    [11] = "\209\143 \208\178\208\176\209\136\208\184\208\188 \208\176\208\189\208\179\208\181\208\187\208\178\208\184\208\189\208\179\209\129\208\176\208\188 \208\186\209\128\209\139\208\187\209\140\209\143 \209\128\208\181\208\183\208\176\208\187, \209\131\208\177\208\187\209\142\208\180\208\186\208\184 ", 
    [12] = "\208\165\208\144\208\165\208\144\208\165\208\144\208\165\208\144\208\165\208\144-\209\129\209\130\208\181\209\128\208\184\209\143", 
    [13] = "\208\178\208\176\208\182\208\189\208\190 \208\183\208\189\208\176\209\130\209\140 \208\189\208\181 \208\188\208\176\209\130\208\181\208\188\208\176\209\130\208\184\208\186\209\131, \208\176 \209\130\208\190 \209\135\209\130\208\190 easy.sync \209\128\208\178\208\181\209\130 \208\178\208\176\209\136\208\184 \208\182\208\190\208\191\209\139.", 
    [14] = "\208\186\209\128\209\143\208\186\208\189\209\131\208\187 \209\141\209\130\208\181\209\128\208\189\208\176\208\187.\208\186\208\190\208\180\209\129, \209\129\208\187\208\184\208\187 - \208\176 \208\178\209\129\208\181\208\188 \208\178\209\129\208\181 \209\128\208\176\208\178\208\189\208\190 \208\191\208\190\209\133\209\131\208\185, \208\190\208\189 \208\179\208\190\208\178\208\189\208\190(", 
    [15] = "\208\152 \208\178\208\190\209\130 \208\183\208\176 \209\141\209\130\209\131 \209\133\209\131\208\185\208\189\209\142 \209\128\208\176\208\177\208\190\209\130\208\176\208\187\208\176 \209\130\208\178\208\190\209\143 \208\188\208\176\209\130\209\131\209\133\208\176? \208\161\209\130\209\139\208\180\208\189\208\190", 
    [16] = "\208\161\208\188\208\190\209\130\209\128\208\184 \208\186\208\176\208\186\208\184\208\181 \208\180\208\190\208\187\208\182\208\189\209\139 \208\177\209\139\209\130\209\140 \208\176\208\189\209\130\208\184\208\176\208\184\208\188\209\139 ^^", 
    [17] = "\208\176\209\133\208\176\209\133\208\176\209\133\208\176\209\133\208\176 \208\176 \208\189\208\181\209\130 \208\191\208\190\208\180\208\190\208\182\208\180\208\184 \208\189\208\181 \209\129\208\188\208\181\209\136\208\189\208\190, \209\130\209\139 \208\182\208\181 \209\135\208\184\208\188\208\181\209\128\208\176 \209\142\208\183\208\181\209\128", 
    [18] = "\208\177\209\128\208\190 \209\130\209\139 \208\182\208\181 \208\188\208\190\208\182\208\181\209\136\209\140 \208\179\208\181\209\130\208\189\209\131\209\130\209\140 easy.sync \208\184 \208\177\209\139\209\130\209\140 \209\129\209\135\208\176\209\129\209\130\208\187\208\184\208\178\209\139\208\188", 
    [19] = "\209\143 \208\190\209\135\208\181\208\189\209\140 \208\180\208\190\208\187\208\179\208\190 \208\184\209\129\208\186\208\176\208\187, \208\189\208\190 \208\189\208\181 \209\129\208\188\208\190\208\179 \208\189\208\176\208\185\209\130\208\184 \208\176\208\189\209\130\208\184\208\176\208\184\208\188\209\139 \208\187\209\131\209\135\209\136\208\181 \209\135\208\181\208\188 \209\131 easy.sync$", 
    [20] = "\208\183\208\176\208\181\208\177\208\184\209\129\209\140 \209\130\209\139 \208\180\208\181\208\189\209\140\208\179\208\184 \208\191\209\128\208\190\208\181\208\177\208\176\208\187, \209\131\209\129\208\176\209\130\209\139\208\185", 
    [21] = "\209\130\208\181\208\177\208\181 \208\177\209\139 \209\129 \209\130\208\176\208\186\208\184\208\188\208\184 \208\187\209\131\208\176\209\136\208\186\208\176\208\188\208\184 \208\178 \208\180\208\190\209\130\209\131, \209\130\208\176\208\188 \208\184\208\189\208\178\208\176\208\187\208\184\208\180\208\190\208\178 \208\187\209\142\208\177\209\143\209\130", 
    [22] = "\208\188\208\190\209\143 \208\182\208\184\208\183\208\189\209\140 \209\129\209\130\208\176\208\187\208\176 \208\187\208\181\208\179\209\135\208\181 \208\191\208\190\209\129\208\187\208\181 \208\191\208\190\208\186\209\131\208\191\208\186\208\184 easy.sync", 
    [23] = "\208\188\208\181\208\189\209\143 \208\177\209\128\208\190\209\129\208\184\208\187\208\176 \208\182\208\181\208\189\208\176 \208\189\208\190 \208\188\208\189\208\181 \208\191\208\190\209\133\209\131\208\185, \209\143 \208\177\209\139\208\187 \208\183\208\176\208\189\209\143\209\130 \209\135\209\130\208\181\208\189\208\184\208\181\208\188 \209\135\208\181\208\189\208\180\208\182\208\187\208\190\208\179\208\176 easy.sync", 
    [24] = "$\209\133\208\190\208\180\209\143\209\130 \209\129\208\187\209\131\209\133\208\184, \209\135\209\130\208\190 \208\186\208\184\209\129\208\187\208\190\209\130\208\176 \208\187\209\131\209\135\209\136\208\176\209\143 \208\188\208\184\208\189\208\181\209\130\209\135\208\184\209\134\208\176 \209\128\208\190\209\129\209\129\208\184\208\184$", 
    [25] = "\209\131 \208\188\208\181\208\189\209\143 \208\177\208\176\208\177\209\131\209\136\208\186\208\176 \208\187\209\131\209\135\209\136\208\181 \208\176\208\189\209\130\208\184\208\176\208\184\208\188\209\139 \208\180\208\181\208\187\208\176\208\181\209\130, \208\190\208\187\209\131\209\133", 
    [26] = "\208\186\209\128\209\131\209\130\208\190, \209\130\208\181\208\177\209\143 \208\190\208\191\209\143\209\130\209\140 \208\191\208\190\209\129\209\130\208\176\208\178\208\184\208\187\208\184 \209\128\208\176\208\186\208\190\208\188. \208\144 \208\178\209\129\208\181 \208\191\208\190\209\130\208\190\208\188\209\131 \209\135\209\130\208\190 \209\130\209\139 \208\177\208\181\208\183 easy.sync", 
    [27] = "1111111", 
    [28] = "\208\186\209\130\208\190 \209\130\208\181\208\177\208\181 \208\180\208\181\209\132\208\181\208\189\209\129\208\184\208\178\209\139 \209\130\208\176\208\186\208\184\208\181 \208\189\208\176\208\191\208\184\209\129\208\176\208\187, \208\188\209\128\208\176\208\183\208\190\209\130\208\176?", 
    [29] = "\208\189\208\184\209\133\209\131\209\143\209\143\209\143 \209\129\208\181\208\177\208\181, \208\186\208\176\208\186 \209\130\209\139 \208\184\208\183 \208\183\208\190\208\190\208\191\208\176\209\128\208\186\208\176 \209\129\208\177\208\181\208\182\208\176\208\187 \209\129 \209\130\208\176\208\186\208\184\208\188 \208\188\209\131\208\178\208\188\208\181\208\189\209\130\208\190\208\188?", 
    [30] = "\209\131 \209\130\208\181\208\177\209\143 \208\181\209\137\208\181 \208\181\209\129\209\130\209\140 \209\136\208\176\208\189\209\129 \209\129\209\130\208\176\209\130\209\140 \208\188\209\131\208\182\208\184\208\186\208\190\208\188, \208\179\208\181\209\130\208\189\208\184 \208\184\208\183\208\184.\209\129\208\184\208\189\208\186 \208\184 \209\130\208\178\208\190\209\143 \208\182\208\184\208\183\208\189\209\140 \209\129\209\130\208\176\208\189\208\181\209\130 \208\187\208\181\208\179\209\135\208\181^^", 
    [31] = "\208\181\208\177\208\176\209\130\209\140 \208\190\209\130 \209\130\208\178\208\190\208\181\208\185 \208\187\209\131\208\176\209\133\208\184 \208\189\208\176\208\178\208\190\208\183\208\190\208\188 \208\178\208\190\208\189\209\143\208\181\209\130", 
    [32] = "\208\177\208\181\208\180\208\189\209\143\208\179\208\176, \209\141\209\130\208\190 \209\130\209\139 \208\183\208\176 \209\141\209\130\209\131 \209\133\209\131\208\185\208\189\209\142 \209\131 \208\180\208\181\208\180\208\176 \208\191\208\190\209\129\208\187\208\181\208\180\208\189\209\142\209\142 \208\191\208\181\208\189\209\129\208\184\209\142 \208\190\209\130\208\190\208\177\209\128\208\176\208\187?", 
    [33] = "\209\143 \208\180\208\181\208\177\208\176\208\179 \209\142\208\183\208\181\209\128 \208\188\208\189\208\181 \208\191\208\190\209\133\209\131\208\185 \208\189\208\176 \209\130\208\178\208\190\209\142 \209\133\209\131\208\185\208\189\209\142", 
    [34] = "\208\189\208\184\209\133\209\131\209\143?!! \208\178\208\190\209\130 \209\141\209\130\208\190 \209\130\208\181\208\177\209\143 \208\178\209\139\208\181\208\177\208\176\208\187 easy.sync) \208\189\208\181 \208\183\208\176 \209\135\209\130\208\190 :)", 
    [35] = "\209\131\208\179\208\176\208\180\208\176\208\185 \208\186\209\130\208\190 \208\190\208\191\209\143\209\130\209\140 \209\130\208\181\208\177\209\143 \208\183\208\176\208\190\208\178\208\189\208\184\208\187? \209\130\208\176\208\186 \209\141\209\130\208\190 \208\182\208\181 easy.sync debug \209\142\208\183\208\181\209\128 (\209\143)", 
    [36] = "\208\176\209\133\208\176\209\133\208\176\209\133\208\176\209\133\208\176\209\133-yaw", 
    [37] = "\209\130\208\176\208\186 \208\182\208\181\209\129\209\130\208\190\208\186\208\190 \209\130\208\181\208\177\209\143 \208\189\208\176\208\178\208\181\209\128\208\189\208\190\208\181 \208\181\209\137\208\181 \208\189\208\181 \208\181\208\177\208\176\208\187\208\184 \208\180\208\176? \208\162\208\176\208\186 \209\141\209\130\208\190 \208\191\208\190\209\130\208\190\208\188\209\131 \209\135\209\130\208\190 \209\130\209\139 \208\184\208\183\208\184.\209\129\208\184\208\189\208\186 \209\142\208\183\208\181\209\128\208\190\208\178 \208\189\208\181 \208\178\209\129\209\130\209\128\208\181\209\135\208\176\208\187, \208\181\208\177\208\187\208\190)", 
    [38] = "\208\186\209\128\209\131\209\130\208\190, \208\176 \209\130\208\181\208\191\208\181\209\128\209\140 \209\135\209\130\208\190 \208\181\209\137\208\181 \209\130\208\178\208\190\209\143 \209\133\209\131\208\185\208\189\209\143 \209\131\208\188\208\181\208\181\209\130?", 
    [39] = "\208\186\208\176\208\186 \209\130\208\176\208\188 \209\129\208\187\208\190\208\179\208\176\208\189.. \208\188\208\181\208\185\208\186 \208\185\208\190\209\131\209\128 \208\187\208\176\208\185\209\132 \208\184\208\183\208\184\208\181\209\128? \208\144 \209\133\208\190\209\130\209\143 \208\191\208\190\209\133\209\131\208\185, \209\143 \208\181\208\179\208\190 \208\189\208\181 \209\135\208\184\209\130\208\176\208\187, \209\143 \209\129\209\128\208\176\208\183\209\131 \208\191\208\190\209\136\208\181\208\187 \208\181\208\177\208\176\208\187\209\140\208\189\208\184\208\186\208\184 \208\187\209\131\208\176\209\129\208\181\208\189\209\129 \209\142\208\183\208\181\209\128\208\176\208\188 \209\128\208\176\208\183\208\189\208\190\209\129\208\184\209\130\209\140", 
    [40] = "\209\129\208\190\209\129\208\184 \209\141\209\130\208\184 \208\176\209\133\209\131\208\181\208\189\208\189\209\139\208\181 \208\180\208\181\209\132\208\181\208\189\209\129\208\184\208\178\209\139, \209\130\209\139 \209\130\208\176\208\186\208\184\209\133 \208\189\208\181 \209\131\208\178\208\184\208\180\208\184\209\136\209\140 \208\191\208\190\208\186\208\176 easy.sync \208\189\208\181 \208\179\208\181\209\130\208\189\208\181\209\136\209\140", 
    [41] = "\209\143 \208\177\209\139 \208\191\209\128\208\190\208\188\208\190\208\187\209\135\208\176\208\187, \208\189\208\190 \209\143 \208\184\208\188\208\181\209\142 \208\191\209\128\208\176\208\178\208\190 \209\129\208\186\208\176\208\183\208\176\209\130\209\140 \209\130\208\181\208\177\208\181 \209\135\209\130\208\190 \209\130\208\178\208\190\209\143 \208\187\209\131\208\176\209\133\208\176 \209\133\209\131\208\181\209\130\208\176) \209\143 \208\180\208\181\208\177\208\176\208\179 \209\142\208\183\208\181\209\128 \209\129\209\131\209\135\208\186\208\176", 
    [42] = "\208\180\208\181\208\189\209\140\208\179\208\184 \209\141\209\130\208\190 \209\129\208\176\208\188\208\190\208\181 \208\188\208\176\208\187\208\190\208\181 \209\135\209\130\208\190 \209\143 \208\188\208\190\208\179 \208\190\209\130\208\180\208\176\209\130\209\140 \208\183\208\176 \209\141\209\130\208\190\209\130 \209\136\208\181\208\180\208\181\208\178\209\128. \208\191\208\190\209\129\208\187\208\181\208\180\209\131\208\185 \208\188\208\190\208\181\208\188\209\131 \208\191\209\128\208\184\208\188\208\181\209\128\209\131 \208\184 \209\130\209\139 ^^ - easy.sync", 
    [43] = "\208\186\208\176\208\182\208\180\208\190\208\185 \209\130\208\178\208\176\209\128\208\181 - \208\191\208\190 \208\191\208\176\209\128\208\181. \208\176 \208\188\208\189\208\181 \209\129\208\176\208\188\209\139\208\185 \208\176\209\133\209\131\208\181\208\189\208\189\209\139\208\185 \208\177\208\184\208\187\208\180 easy.sync", 
    [44] = "\209\135\208\181 \208\183\208\176 \208\190\208\186\209\131\208\189\209\140 \209\130\208\178\208\190\209\142 \208\183\208\176\208\187\209\131\208\191\209\131 \208\191\208\184\209\129\208\176\208\187?"
};
local v578 = {
    [1] = "\225\180\135\225\180\160\225\180\135\202\128\202\143 \225\180\143\225\180\155\202\156\225\180\135\202\128 \202\159\225\180\156\225\180\128 < \225\180\135\225\180\128\234\156\177\202\143.\234\156\177\202\143\201\180\225\180\132", 
    [2] = "-M\204\182e\204\182l\204\182a\204\182n\204\182c\204\182h\204\182o\204\182l\204\182i\204\182a\204\182- Nah get easy.sync", 
    [3] = "\240\157\153\189\240\157\154\142\240\157\154\142\240\157\154\141 \240\157\154\138 \240\157\154\144\240\157\154\152\240\157\154\152\240\157\154\141 \240\157\154\149\240\157\154\158\240\157\154\138? \240\157\154\144\240\157\154\152 \240\157\154\143\240\157\154\152\240\157\154\155 \240\157\154\142\240\157\154\138\240\157\154\156\240\157\154\162.\240\157\154\156\240\157\154\162\240\157\154\151\240\157\154\140", 
    [4] = "\226\151\163_\226\151\162Easy.sync wins again\226\151\163_\226\151\162", 
    [5] = "\226\150\129 \226\150\130 \226\150\131 \226\150\133 \226\150\134 \226\150\135 \226\150\136 easy.sync works other luas dont \226\150\136 \226\150\135 \226\150\134 \226\150\133 \226\150\131 \226\150\130 \226\150\129", 
    [6] = "\240\157\147\182\240\157\147\170\240\157\147\180\240\157\147\174 \240\157\148\130\240\157\147\184\240\157\147\190\240\157\147\187 \240\157\147\181\240\157\147\178\240\157\147\175\240\157\147\174 \239\188\165\239\188\161\239\188\179\239\188\169\239\188\165\239\188\178", 
    [7] = "\240\157\147\172\240\157\147\170\240\157\147\183\240\157\147\189 \240\157\147\175\240\157\147\174\240\157\147\174\240\157\147\181 \240\157\148\130\240\157\147\184\240\157\147\190\240\157\147\187 \240\157\147\175\240\157\147\190\240\157\147\172\240\157\147\180\240\157\147\178\240\157\147\183\240\157\147\176 \225\180\132\202\156\201\170\225\180\141\225\180\135\202\128\225\180\128", 
    [8] = "\239\188\169\227\128\128\239\189\131\239\189\129\239\189\142\227\128\128\239\189\136\239\189\133\239\189\129\239\189\146\227\128\128\239\189\153\239\189\143\239\189\149\239\188\135\239\189\146\239\189\133\227\128\128\239\189\146\239\189\133\239\189\135\239\189\146\239\189\133\239\189\148\239\189\148\239\189\137\239\189\142\239\189\135  \239\189\130\239\189\149\239\189\153\239\189\137\239\189\142\239\189\135\227\128\128\239\189\148\239\189\136\239\189\137\239\189\147  \239\189\144\239\189\137\239\189\133\239\189\131\239\189\133\227\128\128\239\189\143\239\189\134\227\128\128\239\189\147\239\189\136\239\189\137\239\189\148", 
    [9] = "easy.sync - the easiest way to dominate", 
    [10] = "\240\157\147\155\240\157\147\158\240\157\147\162\240\157\147\162. \240\157\147\158\240\157\147\149. \240\157\147\156\240\157\147\158\240\157\147\157\240\157\147\148\240\157\147\168.", 
    [11] = "\225\180\141\202\143 \202\159\201\170\234\156\176\225\180\135 \225\180\161\225\180\128\234\156\177 \234\156\177\225\180\143 \202\156\225\180\128\202\128\225\180\133 \202\153\225\180\135\234\156\176\225\180\143\202\128\225\180\135 \201\170 \201\162\225\180\143\225\180\155 \225\180\135\225\180\128\234\156\177\202\143.\234\156\177\202\143\201\180\225\180\132", 
    [12] = "\226\177\164\201\134\226\130\180\226\130\177\201\134\226\130\181\226\130\174 \201\142\195\152\201\132\226\177\164\226\130\180\201\134\226\177\160\226\130\163. \196\144\201\134\226\177\160\201\134\226\130\174\201\134 \226\130\179\226\130\181\197\130\196\144.\226\130\174\201\134\226\130\181\226\177\167.", 
    [13] = "\240\157\149\152\240\157\149\160\240\157\149\165 \240\157\149\159\240\157\149\160 \240\157\149\165\240\157\149\154\240\157\149\158\240\157\149\150 \240\157\149\151\240\157\149\160\240\157\149\163 \240\157\149\170\240\157\149\160\240\157\149\166\240\157\149\163 \240\157\149\148\240\157\149\153\240\157\149\150\240\157\149\163\240\157\149\159\240\157\149\160\240\157\149\147\240\157\149\170\240\157\149\157 \240\157\149\157\240\157\149\160\240\157\149\157", 
    [14] = "\202\184\225\181\146\225\181\152\202\179 \225\181\136\225\181\137\225\181\155 \226\129\191\225\181\137\225\181\137\225\181\136\203\162 \203\162\225\181\146\225\181\144\225\181\137 \225\182\156\225\181\146\225\181\136\226\129\177\226\129\191\225\181\141 \203\161\225\181\137\203\162\203\162\225\181\146\226\129\191\203\162.", 
    [15] = "\201\170  \234\156\177\225\180\135\225\180\135.  \225\180\128\225\180\141\225\180\128\225\180\162\201\170\201\180\201\162  \225\180\161\225\180\128\202\143 \225\180\155\225\180\143  \202\159\225\180\143\234\156\177\225\180\135  \202\143\225\180\143\225\180\156\202\128  \225\180\141\225\180\143\201\180\225\180\135\202\143", 
    [16] = "\225\180\135\225\180\128\234\156\177\202\143.\234\156\177\202\143\201\180\225\180\132 \202\156\225\180\128\234\156\177 \225\180\128\202\159\225\180\161\225\180\128\202\143\234\156\177 \202\153\225\180\135\225\180\135\201\180 \225\180\128\201\180\225\180\133 \225\180\128\202\159\225\180\161\225\180\128\202\143\234\156\177 \225\180\161\201\170\202\159\202\159 \202\153\225\180\135 \225\180\155\202\156\225\180\135 \201\162\202\128\225\180\135\225\180\128\225\180\155\225\180\135\234\156\177\225\180\155 \234\156\177\225\180\132\202\128\201\170\225\180\152\225\180\155 \225\180\143\234\156\176 \225\180\128\202\159\202\159 \225\180\155\201\170\225\180\141\225\180\135.", 
    [17] = "(Easy.sync) \239\184\187\226\148\179\226\149\144\228\184\128- - - - luasense", 
    [18] = "\240\157\149\149\240\157\149\160\240\157\149\159\240\157\149\165 \240\157\149\150\240\157\149\167\240\157\149\150\240\157\149\159 \240\157\149\165\240\157\149\150\240\157\149\157\240\157\149\157 \240\157\149\158\240\157\149\150 \240\157\149\170\240\157\149\160\240\157\149\166\240\157\149\163 \240\157\149\157\240\157\149\166\240\157\149\146 \240\157\149\159\240\157\149\146\240\157\149\158\240\157\149\150. \240\157\149\128 \240\157\149\146\240\157\149\157\240\157\149\163\240\157\149\150\240\157\149\146\240\157\149\149\240\157\149\170 \240\157\149\156\240\157\149\159\240\157\149\160\240\157\149\168 \240\157\149\154\240\157\149\165\240\157\149\164 \240\157\149\168\240\157\149\160\240\157\149\163\240\157\149\164\240\157\149\150.", 
    [19] = "\226\130\174\226\177\167\201\134 \195\152\226\130\166\226\177\160\201\142 \195\152\226\130\177\226\130\174\197\130\195\152\226\130\166 \226\130\163\195\152\226\177\164 \201\142\195\152\201\132 \197\130\226\130\180 \226\130\174\195\152 \224\184\191\226\130\179\197\130\226\130\165 \226\130\165\201\134. \224\184\191\195\152\226\177\164\197\130\226\130\166\226\130\178.", 
    [20] = "\213\161\201\166\199\159\200\182 \200\182\201\166\201\155 \202\132\202\138\198\136\211\132 \201\168\214\134 \214\134\201\155\202\128\201\155\213\188\201\168\200\182\202\143?", 
    [21] = "\201\170'\225\180\160\225\180\135 \234\156\177\225\180\135\225\180\128\202\128\225\180\132\202\156\225\180\135\225\180\133 \225\180\155\202\156\202\128\225\180\143\225\180\156\201\162\202\156 \225\180\128\202\159\202\159 9999 \225\180\143\234\156\176 \225\180\141\225\180\135\202\159\225\180\128\201\180\225\180\132\202\156\225\180\143\202\159\201\170\225\180\128 \234\156\177' \225\180\156\234\156\177\225\180\135\202\159\225\180\135\234\156\177\234\156\177 \234\156\177\202\156\201\170\225\180\155\225\180\155\202\143 \234\156\176\225\180\135\225\180\128\225\180\155\225\180\156\202\128\225\180\135\234\156\177 \225\180\128\201\180\225\180\133 \234\156\177\225\180\155\201\170\202\159\202\159 \202\156\225\180\128\225\180\160\225\180\135\201\180'\225\180\155 \234\156\176\225\180\143\225\180\156\201\180\225\180\133 \225\180\128\225\180\128.", 
    [22] = "\202\143\225\180\143\225\180\156\202\128 \225\180\133\225\180\135\225\180\160 \201\162\225\180\143\225\180\155\225\180\155\225\180\128 \234\156\176\201\170x \225\180\155\202\156\201\170\234\156\177 \225\180\128\225\180\128 \201\170\201\162?", 
    [23] = "\202\143\225\180\143\225\180\156\202\128 x\225\180\128x\225\180\128-\202\143\225\180\128\225\180\161 \225\180\128\201\170\201\180\225\180\155 \225\180\133\225\180\143\201\170\201\180\201\162 \201\162\225\180\143\225\180\143\225\180\133 \225\180\128\201\180\202\143\225\180\141\225\180\143\202\128\225\180\135?", 
    [24] = "\240\157\153\184\240\157\154\150 \240\157\154\140\240\157\154\158\240\157\154\157\240\157\154\157\240\157\154\146\240\157\154\151\240\157\154\144 \240\157\154\157\240\157\154\145\240\157\154\142 \240\157\154\160\240\157\154\146\240\157\154\151\240\157\154\144\240\157\154\156 \240\157\154\152\240\157\154\143 \240\157\154\157\240\157\154\145\240\157\154\146\240\157\154\156 \240\157\154\145\240\157\154\162\240\157\154\156\240\157\154\157\240\157\154\142\240\157\154\155\240\157\154\146\240\157\154\138 \240\157\154\156' \240\157\154\139\240\157\154\158\240\157\154\157\240\157\154\157\240\157\154\142\240\157\154\155\240\157\154\143\240\157\154\149\240\157\154\162.", 
    [25] = "\240\157\151\166\240\157\151\178\240\157\151\178\240\157\151\186\240\157\152\128 \240\157\151\185\240\157\151\182\240\157\151\184\240\157\151\178 \240\157\152\134\240\157\151\188\240\157\152\130'\240\157\151\191\240\157\151\178 \240\157\151\188\240\157\151\187 $\240\157\151\175\240\157\151\191\240\157\152\130\240\157\151\181\240\157\151\180\240\157\151\174\240\157\151\187\240\157\151\180$ \240\157\151\188\240\157\151\191 \240\157\152\132\240\157\151\181\240\157\151\174\240\157\152\129 \240\157\151\182\240\157\152\128 \240\157\151\182\240\157\152\129 \240\157\151\176\240\157\151\174\240\157\151\185\240\157\151\185\240\157\151\178\240\157\151\177", 
    [26] = "\226\128\160h\195\175\194\167 \195\165\195\177g\195\170l g\195\176\226\128\160 \195\177\195\176 w\195\175\195\177g\194\167 \195\165\195\177\194\165m\195\176r\195\170?", 
    [27] = "\227\128\144\239\188\159\239\189\140\239\189\149\239\189\129\239\188\174\239\189\143\239\189\142\239\189\147\239\189\133\239\189\142\239\189\147\239\189\133\239\188\159\227\128\145", 
    [28] = "\239\188\136\239\188\165\239\189\129\239\189\147\239\189\153\239\188\142\239\189\147\239\189\153\239\189\142\239\189\131\239\188\137 \239\184\187\226\148\179\226\149\144\228\184\128\239\188\141 \239\188\141 \239\188\141 \239\188\141 \239\189\147\239\189\133\239\189\146\239\189\133\239\189\142\239\189\137\239\189\148\239\189\153", 
    [29] = "\234\156\177\225\180\135\225\180\135\225\180\141\234\156\177 \202\159\201\170\225\180\139\225\180\135 \201\170\225\180\133\225\180\135\225\180\128\202\159 \202\143\225\180\128\225\180\161 \201\170\234\156\177 \201\180\225\180\143\225\180\155 \225\180\155\202\156\225\180\128\225\180\155 \201\170\225\180\133\225\180\135\225\180\128\202\159 \201\180\225\180\143\225\180\161\225\180\128\225\180\133\225\180\128\202\143\234\156\177?", 
    [30] = "(\227\129\163\226\151\148\226\151\161\226\151\148)\227\129\163 \226\153\165 I hope you still can open a ticket to get your money back ^^ \226\153\165", 
    [31] = "\201\174\201\155\200\182\200\182\201\155\202\128 \201\150\201\168\214\134\199\159\201\174\202\159\201\155 \200\182\201\166\199\159\200\182 \214\134\201\166\201\168\200\182 \202\159\214\133\202\159", 
    [32] = "\210\159\210\189\210\189\214\132 \213\161\196\133\202\130\213\167\195\172\213\178\214\129 \213\190\214\133\213\180\201\190 \202\141\214\133\213\178\210\189\213\190.", 
    [33] = "\226\130\181\226\130\179\226\130\166\226\130\174 \196\144\195\152\196\144\226\130\178\201\134 \226\130\179 \224\184\191\201\132\226\177\160\226\177\160\201\134\226\130\174? \226\130\174\226\177\164\226\130\179\226\130\178\201\134\196\144\201\142..", 
    [34] = "\213\161\201\166\214\133 \213\188\201\155\201\155\201\150\214\134 \201\162\201\168\202\128\202\159\214\134 \213\161\201\166\201\155\213\188 \202\143\214\133\202\138'\202\139\201\155 \201\162\214\133\200\182 \225\180\135\225\180\128\234\156\177\202\143.\234\156\177\202\143\201\180\225\180\132", 
    [35] = "\240\157\144\136\240\157\144\147\240\157\144\146 \240\157\144\129\240\157\144\142\240\157\144\145\240\157\144\136\240\157\144\141\240\157\144\134 \240\157\144\147\240\157\144\142 \240\157\144\143\240\157\144\139\240\157\144\128\240\157\144\152 \240\157\144\150\240\157\144\135\240\157\144\132\240\157\144\141 \240\157\144\152\240\157\144\142\240\157\144\148'\240\157\144\145\240\157\144\132 \240\157\144\136\240\157\144\140\240\157\144\140\240\157\144\142\240\157\144\145\240\157\144\147\240\157\144\128\240\157\144\139.", 
    [36] = "\201\168 \201\166\199\159\202\139\201\155 \214\134\201\155\202\159\202\132-\202\128\201\155\214\134\214\132\201\155\198\136\200\182. \201\168 \201\166\199\159\202\139\201\155 \201\155\199\159\214\134\202\143.\214\134\202\143\213\188\198\136 \214\134\202\143\214\134\200\182\201\155\202\141\214\134.", 
    [37] = "\202\143\225\180\143 \225\180\161\202\156\225\180\128\225\180\155 \225\180\161\225\180\128\234\156\177 \225\180\155\202\156\225\180\128\225\180\155? \225\180\143\202\156 \201\170\225\180\155'\234\156\177 \225\180\138\225\180\156\234\156\177\225\180\155 \225\180\135\225\180\128\234\156\177\202\143.\234\156\177\202\143\201\180\225\180\132 \225\180\141\225\180\128\225\180\139\201\170\201\180\201\162 \202\143\225\180\143\225\180\156 \234\156\176\202\159\202\143 \202\156\201\170\201\162\202\156", 
    [38] = "\226\130\177\226\130\179\226\130\174\226\177\167\201\134\226\130\174\197\130\226\130\181 \226\177\160\201\132\226\130\179 \201\142\195\152\201\132 \226\130\178\195\152\226\130\174. \226\177\160\195\152\226\177\160", 
    [39] = "\240\157\147\166\240\157\147\177\240\157\147\170\240\157\147\189 \240\157\147\177\240\157\147\170\240\157\147\191\240\157\147\174 \240\157\147\152 \240\157\147\173\240\157\147\184\240\157\147\183\240\157\147\174? \240\157\147\153\240\157\147\190\240\157\147\188\240\157\147\189 \240\157\147\173\240\157\147\174\240\157\147\188\240\157\147\189\240\157\147\187\240\157\147\184\240\157\148\130\240\157\147\174\240\157\147\173 \240\157\147\188\240\157\147\184\240\157\147\182\240\157\147\174 \240\157\147\188\240\157\147\177\240\157\147\178\240\157\147\189\240\157\147\189\240\157\148\130 \240\157\147\170\240\157\147\177\240\157\147\177 \240\157\147\185\240\157\147\170\240\157\147\188\240\157\147\189\240\157\147\174 \240\157\147\181\240\157\147\190\240\157\147\170 \240\157\147\170\240\157\147\176\240\157\147\170\240\157\147\178\240\157\147\183? \240\157\147\184\240\157\147\177..", 
    [40] = "\202\159\225\180\143\225\180\143\225\180\139 \225\180\128\225\180\155 \225\180\141\202\143 \225\180\128\225\180\128 \202\153\202\128\225\180\143. \202\143\225\180\143\225\180\156 \225\180\133\225\180\143\201\180'\225\180\155 \202\156\225\180\128\225\180\160\225\180\135 \225\180\155\225\180\143 \225\180\155\202\128\202\143.", 
    [41] = "\201\155\199\159\214\134\202\143.\214\134\202\143\213\188\198\136 \201\150\201\155\201\174\202\138\201\162 \202\138\214\134\201\155\202\128\214\134 \198\136\199\159\213\188'\200\182 \201\150\201\168\201\155.", 
    [42] = "\201\170 \225\180\138\225\180\156\234\156\177\225\180\155 \202\159\225\180\135\225\180\128\225\180\139\225\180\135\225\180\133 \225\180\155\202\156\225\180\135 \225\180\128\202\159\202\143x-\202\143\225\180\128\225\180\161 \234\156\177\225\180\143\225\180\156\202\128\225\180\132\225\180\135 \225\180\132\225\180\143\225\180\133\225\180\135. \201\180\225\180\143\202\153\225\180\143\225\180\133\202\143 \201\180\225\180\143\225\180\155\201\170\225\180\132\225\180\135\225\180\133, \225\180\155\202\156\225\180\143\225\180\156\201\162\202\156; \201\170\225\180\155'\234\156\177 \234\156\177\202\156\201\170\225\180\155 \225\180\128\201\180\202\143\225\180\161\225\180\128\202\143.", 
    [43] = "\225\180\141\225\180\128\225\180\155\202\156.\202\128\225\180\128\201\180\225\180\133\225\180\143\225\180\141    \225\180\143\234\156\176\234\156\176\234\156\177\225\180\135\225\180\155    \225\180\161\225\180\143\201\180\225\180\155    \225\180\161\225\180\143\202\128\225\180\139    \225\180\128\201\162\225\180\128\201\170\201\180\234\156\177\225\180\155    \225\180\141\225\180\135.    \225\180\133\201\170\202\128\225\180\155\202\143    \225\180\141\225\180\143\225\180\155\202\156\225\180\135\202\128\234\156\176\225\180\156\225\180\132\225\180\139\225\180\135\202\128.", 
    [44] = "\202\143\214\133\202\138 \213\161\214\133\213\188\200\182 \200\182\214\133\202\138\198\136\201\166 \202\141\202\143 \201\166\201\155\199\159\201\150. \201\155\199\159\214\134\202\143.\214\134\202\143\213\188\198\136 \201\150\201\155\202\132\201\155\213\188\214\134\201\168\202\139\201\155 \199\159\213\188\201\162\202\159\201\155\214\134 \201\168\213\188 \199\159\198\136\200\182\201\168\214\133\213\188, \213\188\201\168\201\162\201\162\201\155\202\128", 
    [45] = "\240\157\151\156\240\157\151\187\240\157\152\129\240\157\151\178\240\157\151\191\240\157\151\178\240\157\152\128\240\157\152\129\240\157\151\182\240\157\151\187\240\157\151\180. \240\157\151\161\240\157\151\188\240\157\152\132 \240\157\152\128\240\157\151\181\240\157\151\188\240\157\152\132 \240\157\151\186\240\157\151\178 \240\157\151\174\240\157\152\129 \240\157\151\185\240\157\151\178\240\157\151\174\240\157\152\128\240\157\152\129 \240\157\152\128\240\157\151\188\240\157\151\186\240\157\151\178\240\157\151\181\240\157\151\188\240\157\152\132 \240\157\152\132\240\157\151\188\240\157\151\191\240\157\151\184\240\157\151\182\240\157\151\187\240\157\151\180 \240\157\151\148\240\157\151\148 \240\157\151\189\240\157\151\185\240\157\151\178\240\157\151\174\240\157\152\128\240\157\151\178?", 
    [46] = "\240\157\151\181\240\157\152\129\240\157\152\129\240\157\151\189\240\157\152\128://\240\157\151\178\240\157\151\187.\240\157\151\187\240\157\151\178\240\157\152\131\240\157\151\178\240\157\151\191\240\157\151\185\240\157\151\188\240\157\152\128\240\157\151\178.\240\157\151\176\240\157\151\176/\240\157\151\186\240\157\151\174\240\157\151\191\240\157\151\184\240\157\151\178\240\157\152\129/\240\157\151\182\240\157\152\129\240\157\151\178\240\157\151\186?\240\157\151\182\240\157\151\177=\240\157\151\174\240\157\151\152\240\157\151\174\240\157\151\158\240\157\159\177\240\157\151\190", 
    [47] = "\239\188\183\239\188\178\239\188\161\239\188\169\239\188\180\239\188\168   \239\188\183\239\188\175\239\188\174\239\188\180   \239\188\179\239\188\165\239\188\174\239\188\164   \239\188\161\239\188\174\239\188\185   \239\188\167\239\188\178\239\188\165\239\188\165\239\188\180\239\188\169\239\188\174\239\188\167\239\188\179   \239\188\161\239\188\174\239\188\185\239\188\173\239\188\175\239\188\178\239\188\165\239\188\142   \239\188\173\239\188\161\239\188\172\239\188\181\239\188\173   \239\188\161\239\188\174\239\188\180\239\188\169\239\188\177\239\188\181\239\188\181\239\188\173 \239\188\182\239\188\169\239\188\174\239\188\163\239\188\165\239\188\180\239\188\181\239\188\178\239\188\142"
};
local v579 = {
    [1] = "\209\143 \209\129\208\190\208\182\209\128\209\131 \209\130\208\178\208\190\209\142 \208\190\208\178\209\134\209\131 \209\131 \209\130\208\181\208\177\209\143 \208\189\208\176 \208\179\208\187\208\176\208\183\208\176\209\133", 
    [2] = "\208\186\209\130\208\190 \208\191\209\128\208\190\209\135\208\184\209\130\208\176\208\187 \209\130\208\190\209\130 \208\178 \208\176\209\133\208\188\208\176\209\130", 
    [3] = "\209\131 \209\130\209\143 \208\189\208\181\208\185\208\188 \208\186\208\176\208\186 \209\131 \209\130\208\184\208\191\208\184\209\135\208\189\208\190\208\179\208\190 \208\180\208\190\209\130\208\176 2 \208\191\208\187\208\181\208\181\209\128\208\176 \208\186\208\190\209\130\208\190\209\128\209\139\208\185 \208\189\208\181 \208\178\209\139\208\187\208\176\208\183\208\184\209\130 \208\184\208\183 \208\180\208\190\208\188\208\176", 
    [4] = "\208\178\209\129\208\181 \208\180\208\176\208\178\208\176\208\185 \209\136\208\178\209\139\209\128\209\140 \209\136\208\178\209\139\209\128\209\140 \208\188\208\181\209\132\208\181\208\180\209\128\208\190\208\189\208\190\208\178\209\139\208\185 \209\136\208\189\209\139\209\128\209\140", 
    [5] = "If delta \208\190\209\130 110 \208\180\208\190 119, \209\130\208\190 m_flWeight = 0 \208\176 m_flCycle \208\188\208\190\208\182\208\181\209\130 \208\177\209\139\209\130\209\140... \208\176 \209\133\208\190\209\130\209\143 \208\191\208\190\209\133\209\131\208\185 \209\143 \208\177\208\181\208\183 \209\128\208\181\209\129\208\190\208\187\209\140\208\178\208\181\209\128\208\176 \208\177\209\131\208\180\209\131 \208\184\208\179\209\128\208\176\209\130\209\140", 
    [6] = "\209\130\209\128\209\131\209\129\209\139 \208\188\208\176\208\188\208\181 \208\186\209\131\208\191\208\184 \208\190\208\189\208\176 \208\179\208\190\208\187\208\176\209\143 \208\177\208\181\208\179\208\176\208\181\209\130 \208\191\209\128\209\143\208\188 \209\137\208\176", 
    [7] = "\209\143 \208\177\209\139 \209\130\208\181\208\177\208\181 \208\178 \208\179\208\190\209\128\209\130\208\176\208\189\209\140 \209\128\208\176\208\183 60 \208\178\208\184\208\187\208\186\208\190\208\185 \209\131\208\180\208\176\209\128\208\184\208\187", 
    [8] = "\208\179\208\190 \208\178\209\129\208\181\208\185 \209\128\208\190\209\129\209\129\208\184\208\181\208\185 \208\178 \208\191\208\184\208\183\208\180\209\131 \209\130\208\178\208\190\208\181\208\185 \208\188\208\176\209\130\208\181\209\128\208\184 \208\188\208\190\208\177\208\184\208\187\208\184\208\183\208\184\209\128\209\131\208\181\208\188\209\129\209\143", 
    [9] = "\209\130\208\178\208\190\209\143 \208\188\208\176\209\130\209\140 \208\189\208\176\209\129\209\130\208\190\208\187\209\140\208\186\208\190 \209\129\209\130\209\128\208\181\208\188\208\189\208\176\209\143 \209\135\209\130\208\190 \208\180\208\176\208\182\208\181 \208\177\208\181\208\183\208\189\208\190\208\179\208\184\208\185 \209\135\208\181\208\187 \209\131\208\177\208\181\208\182\208\176\208\187", 
    [10] = "\209\129\208\187\209\139\209\133\208\176\208\187 \209\129\208\186\208\176\208\183\208\186\209\131 \208\191\209\128\208\190 \209\130\209\128\208\181\209\133 \208\188\208\181\208\180\208\178\208\181\208\180\208\181\208\185?) \208\189\209\131 \208\186\208\190\209\128\208\190\209\135\208\181 \208\190\208\189\208\184 \208\178\209\129\208\181 \209\130\208\178\208\190\209\142 \208\188\208\176\209\130\209\140 \208\181\208\177\208\176\208\187\208\184", 
    [11] = "\208\177\209\128\208\190 \209\130\208\181 \209\133\209\131\208\181\208\188 \208\191\208\190 \208\187\208\177\209\131 \208\191\208\190\209\129\209\130\209\131\209\135\208\184 \209\130\209\139 \208\184 \208\178 \208\189\208\181\208\179\208\190 \208\188\208\184\209\129\209\129\208\189\208\181\209\136\209\140", 
    [12] = "\208\165\208\144\208\165\208\144\208\165\208\144\208\165\208\144\208\165\208\144 \208\149\208\145\208\144\208\162\208\172 \208\162\208\171 \208\167\208\149 \208\158\208\159\208\158\208\155\208\167\208\149\208\157\208\149\208\166", 
    [13] = "\208\177\208\187\209\143 \208\177\209\128\208\190 \208\184\208\183\208\178\208\184\208\189\208\184 \209\135\209\130\208\190 \209\131\208\177\208\184\208\187 \208\191\208\190\208\180\209\131\208\188\208\176\208\187 \208\188\209\131\209\135\208\176\208\181\209\136\209\140\209\129\209\143 \208\176 \209\141\209\130\208\190 \209\130\209\139 \208\184\208\179\209\128\208\176\208\187", 
    [14] = "\208\191\208\190\209\136\208\181\208\187 \208\189\208\176\209\133\209\131\208\185 \209\129\209\139\208\189 \208\177\208\187\209\143\208\180\208\184 \208\190\208\179\208\190 \209\129\208\176\208\184\208\189\208\190\209\128\209\139\208\187\209\140\208\189\208\184\208\186\208\176 \209\135\208\181 \208\180\208\190\208\181\208\177\208\176\208\187\208\176\209\129\209\140 \208\176 \209\135\209\131\209\133\208\176\208\189\209\143 \208\181\208\177\208\176\208\189\208\176\209\143 \208\181\208\177\209\131 \208\188\208\176\209\130\209\140 \209\130\208\178\208\190\209\142 \208\191\209\128\208\190\209\129\209\130\208\184\209\130\209\131\209\130\208\186\208\176 \209\136\208\181\209\129\209\130\208\184\208\178\208\190\208\187\209\140\209\130\208\190\208\178\208\176\209\143 \208\184\208\180\208\184 \208\189\208\176\209\133\209\131\208\185 \208\190\209\130\209\129\209\142\208\180\208\190\208\178\208\176", 
    [15] = "\209\130\209\139 \208\178\209\139\208\181\208\177\208\176\208\189\208\189\208\190\208\181 \208\180\208\184\209\130\209\143 \208\180\208\181\208\188\208\181\208\189\209\134\208\184\208\184", 
    [16] = "\208\181\209\129\208\187\208\184 \208\177\209\139 \209\143 \208\177\209\139\208\187 \209\133\208\190\209\133\208\187\208\190\208\188 \209\143 \208\177\209\139 \209\129\208\181\208\177\208\181 \208\191\208\181\209\128\208\181\209\128\208\181\208\183\208\176\208\187 \208\179\208\187\208\190\209\130\208\186\209\131 \208\178\208\181\208\180\209\140 \209\131\208\186\209\128\208\176\208\184\208\189\209\134\209\139 \208\179\209\128\209\143\208\183\208\189\209\139\208\185 \208\189\208\176\209\128\208\190\208\180 \209\133\209\131\208\181\209\129\208\190\209\129\208\190\208\178", 
    [17] = "\209\130\209\139 \209\129\209\139\208\189 \208\177\208\187\209\143\208\180\208\184 \209\131\208\191\208\190\209\128\208\190\209\130\208\190\208\185", 
    [18] = "\208\176\208\187\208\187\208\190 \208\180\208\190\208\187\208\177\208\190\208\181\208\177 \208\186\208\190\208\179\208\180\208\176 \208\177\209\131\208\180\208\181\209\130 \208\178 \208\188\208\181\209\129\209\143\209\134 \209\130\209\128\208\176\209\130 \208\177\208\190\208\187\209\140\209\136\208\181 15 \209\130\209\139\209\137 \208\189\208\176\208\191\208\184\209\136\208\181\209\136\209\140 \209\129\209\142\208\180\208\176 \226\128\148 @RAZEHVH", 
    [19] = "\208\181\208\177\209\131 \208\188\208\176\209\130\209\140 \209\130\208\178\208\190\209\142 \208\191\208\184\208\180\208\190\209\128\208\176\209\129 \208\177\208\187\209\143\208\180\209\129\208\186\208\184\208\185 \208\191\208\181\209\128\208\181\208\177\208\181\208\185 \208\189\208\181\208\184\208\183\208\178\208\181\209\129\209\130\208\189\209\139\208\181 10 \209\129\208\187\208\190\208\178 \208\184 \208\180\208\176\208\187\209\140\209\136\208\181 \209\129\208\190\209\129\208\184 \209\133\209\131\208\185 \208\188\208\190\208\185 \208\191\208\184\208\180\208\190\209\128\208\176\209\129\208\186\208\176 \208\181\208\177\208\176\208\189\208\176\209\143", 
    [20] = "\208\178\208\184\208\180\208\184\209\136\209\140 \208\191\208\184\208\180\208\190\209\128\208\176\209\129 \208\178\209\129\208\181 \208\183\208\176 \208\188\208\181\208\189\209\143 \208\183\208\189\208\176\209\142\209\130 \208\176 \208\183\208\176 \209\130\208\181\208\177\209\143 \209\135\209\130\208\190 \209\130\209\139 \209\133\208\190\209\133\208\190\208\187 \209\131 \209\130\208\181\208\177\209\143 \208\188\208\176\209\130\209\140 \209\128\208\176\208\186\208\190\208\177\208\190\208\187\209\140\208\189\208\176\209\143 \208\184 \208\190\209\130\208\181\209\134 \208\191\208\190\208\180 \208\177\208\176\209\133\208\188\209\131\209\130\208\190\208\188 \209\129\208\180\208\190\209\133", 
    [21] = "\208\190\208\179\209\131\208\183\208\190\208\186 \208\177\208\187\209\143 \209\143 \209\130\208\178\208\190\209\142 \208\188\208\176\209\130\209\140 \208\181\208\177\208\176\208\187", 
    [22] = "", 
    [23] = "\208\181\208\177\208\176\209\130\209\140 \209\131 \209\130\208\181\208\177\209\143 \208\188\208\176\208\188\208\186\208\176 \208\177\208\181\208\179\208\181\208\188\208\190\209\130\208\184\209\133\208\176 \208\187\209\139\209\129\208\176\209\143??!!", 
    [24] = "*\208\191\208\187\208\190\209\130\208\189\208\190 \209\130\208\176\208\189\209\134\209\131\209\142 \208\189\208\176 \208\188\208\190\208\179\208\184\208\187\208\181 \209\130\208\178\208\190\208\181\208\179\208\190 \209\133\209\131\208\181\209\129\208\190\209\129\208\176 \208\190\209\130\209\135\208\184\208\188\208\176*", 
    [25] = "\208\144\208\165\208\144\208\165\208\144\208\165\208\144\208\165\208\144\208\165 \209\133\208\190\209\130\209\143 \208\189\208\181\209\130 \208\188\208\176\208\188\208\176 \209\131\209\135\208\184\208\187\208\176 \208\189\208\176\208\180 \208\184\208\189\208\178\208\176\208\187\208\184\208\180\208\176\208\188\208\184 \208\189\208\181\208\187\209\140\208\183\209\143 \209\129\208\188\208\181\209\143\209\130\209\129\209\143", 
    [26] = "\208\187\209\131\209\135\209\136\208\181 \208\177\209\139 \208\177\208\176\208\177\209\131\209\136\208\186\208\181 \208\177\208\190\208\187\209\140\208\189\208\190\208\185 \208\180\208\181\208\189\209\140\208\179\208\184 \208\189\208\176 \208\187\208\181\209\135\208\181\208\189\208\184\208\181 \208\180\208\176\208\187 \208\178\208\188\208\181\209\129\209\130\208\190 \209\129\208\176\208\177\208\186\208\184, \209\135\209\131\209\135\208\181\208\187\208\190", 
    [27] = "\208\188\208\189\208\181 \209\130\208\178\208\190\209\143 \208\188\208\176\208\188\208\176\209\136\208\176 \209\130\208\176\208\186\208\190\208\185 \208\188\208\184\208\189\208\181\209\130 \208\191\208\190\208\180 \209\129\209\130\208\190\208\187\208\190\208\188 \209\137\208\176 \209\129\208\184\208\180\208\184\209\130 \208\181\208\177\208\176\209\136\208\184\209\130, \208\183\208\176 \209\130\208\176\208\186\208\190\208\181 \208\188\208\190\208\182\208\189\208\190 \208\181\208\181 \208\184 \208\191\208\190\208\186\208\190\209\128\208\188\208\184\209\130\209\140 \208\189\208\176\208\186\208\190\208\189\208\181\209\134 \209\130\208\190", 
    [28] = "\208\179\208\180\208\181 \209\130\208\178\208\190\208\184 \208\176\208\189\209\130\208\184\208\176\208\184\208\188\209\139 \208\191\208\181\209\128\209\133\208\190\209\130\209\140 \208\187\208\190\208\177\208\186\208\190\208\178\208\176\209\143?", 
    [29] = "\208\181\208\177\208\176\209\130\209\140 \209\130\209\139 \208\191\209\128\209\139\209\137 \209\143 \208\178 \209\136\208\190\208\186\208\181", 
    [30] = "\208\186\208\176\208\186 \209\130\208\181\208\177\208\181 \208\188\208\190\208\184 \209\143\208\185\209\134\208\176 \208\189\208\176 \208\178\208\186\209\131\209\129, \208\178\209\139\208\177\208\187\209\143\208\180\208\190\208\186 \208\189\208\190\209\129\208\176\209\130\209\139\208\185?", 
    [31] = "\208\176\209\133\208\176\209\133\208\176\209\133\208\176\209\133 \208\177\208\187\209\143\209\130\209\140 \209\141\209\130\208\190 \209\135\209\130\208\190 \208\183\208\176 \208\184\208\179\209\128\208\190\208\186? \208\177\208\190\208\187\209\140\209\136\208\181 \208\191\208\190\209\133\208\190\208\182 \208\189\208\176 \209\129\208\179\209\131\209\129\209\130\208\190\208\186 \208\191\208\176\209\128\208\176\209\136\208\184.", 
    [32] = "\208\176\209\133\209\131\208\181\209\130\209\140 \208\184 \209\130\209\139 \208\178\209\129\208\181 \208\181\209\137\208\181 \208\191\208\190\208\186\209\131\208\191\208\176\208\181\209\136\209\140 \209\135\208\184\209\130\209\139 \208\191\208\190\209\129\208\187\208\181 \209\130\208\176\208\186\208\190\208\179\208\190? \208\186\208\176\208\186 \209\130\209\139 \208\178\208\190\208\190\208\177\209\137\208\181 \208\187\208\190\208\176\208\180\208\181\209\128 \208\183\208\176\208\191\209\131\209\129\209\130\208\184\208\187, \208\189\208\181\208\182\208\184\209\130\209\140", 
    [33] = "\208\181\209\129\208\187\208\184 \208\177\209\139 \209\143 \209\130\208\176\208\186 \208\188\209\131\208\178\208\176\208\187\209\129\209\143 \209\130\208\190 \208\180\208\176\208\178\208\189\209\139\208\188 \208\180\208\176\208\178\208\189\208\190 \208\177\209\139 \208\187\208\184\208\178\208\189\209\131\208\187 \209\129 \209\133\208\178\209\133, \209\133\208\176\209\135\208\184\208\189\208\176 \208\177\208\181\208\183\208\183\209\131\208\177\208\176\209\143", 
    [34] = "\208\188\209\139 \209\130\208\181\208\177\208\181 \208\178\209\129\208\181\208\188 \208\176\208\189\208\188\208\176\209\130\209\135\208\181\208\180\208\190\208\188 \208\191\208\190 \208\179\208\187\208\176\208\183\208\189\209\139\208\188 \209\143\208\177\208\187\208\190\208\186\208\176\208\188 \208\177\209\139 \208\176\209\128\208\188\208\176\209\130\209\131\209\128\208\190\208\185 \208\191\208\190\209\129\209\130\209\131\209\135\208\176\208\187\208\184 \208\191\208\190\209\129\208\187\208\181 \209\130\208\176\208\186\208\190\208\179\208\190", 
    [35] = "\208\188\208\190\208\187\208\190\208\180\208\181\209\134, \209\130\208\181\208\191\208\181\209\128\209\140 \208\190\209\130\208\180\208\190\209\133\208\189\208\184 \208\178 \209\129\208\191\208\181\208\186\209\130\208\176\209\130\208\190\209\128\208\176\209\133 \209\135\209\131\209\130\209\140 \209\135\209\131\209\130\209\140. \208\176 \208\191\208\190\209\130\208\190\208\188 \208\178\209\139\208\185\208\180\208\184 \208\184 \209\129\208\190\209\129\208\189\208\184 \209\129\208\189\208\190\208\178\208\176)))", 
    [36] = "\208\181\209\137\208\181 \208\190\208\180\208\189\208\190 \208\180\208\190\208\186\208\176\208\183\208\176\209\130\208\181\208\187\209\140\209\129\209\130\208\178\208\190 \209\130\208\190\208\179\208\190, \209\135\209\130\208\190 \209\130\209\139 \208\189\208\181 \208\180\208\190\208\187\208\182\208\181\208\189 \208\177\209\139\208\187 \208\178\209\139\208\187\208\181\208\183\209\130\208\184 \208\189\208\176 \209\141\209\130\208\190\209\130 \209\129\208\178\208\181\209\130, \209\136\208\178\208\176\208\187\209\140", 
    [37] = "\209\131\208\189\208\190", 
    [38] = "\208\184\208\180\208\184 \208\187\209\131\209\135\209\136\208\181 \208\189\208\176\209\129\209\130\209\128\208\190\208\185 \209\133\208\184\209\130\209\136\208\176\208\189\209\129 \208\191\208\190\208\187\209\131\209\135\209\136\208\181, \209\131 \209\130\208\181\208\177\209\143 \208\189\208\181 \208\191\208\190\208\187\209\131\209\135\208\176\208\181\209\130\209\129\209\143 \208\177\209\128\208\176\209\130((", 
    [39] = "\208\181\208\177\208\176\209\130\209\140 \209\143 \209\130\208\181\208\177\208\181 \208\183\209\131\208\177\209\139 \209\129\208\187\208\190\208\188\208\176\208\187 \208\180\208\176?", 
    [40] = "\208\186\208\176\208\186 \209\130\208\181\208\177\208\181 \208\188\208\190\209\143 \209\129\208\191\208\181\209\128\208\188\208\176 \208\189\208\176 \208\178\208\186\209\131\209\129? \209\133\208\190\209\130\209\143 \209\130\209\139 \208\178\209\128\209\143\208\180\208\187\208\181 \209\135\209\131\208\178\209\129\209\130\208\178\209\131\208\181\209\136\209\140 \208\178\208\186\209\131\209\129 \209\133\208\190\209\130\209\140 \209\135\208\181\208\179\208\190 \209\130\208\190.. \208\189\208\176\209\128\208\186\208\190\209\136\208\190\208\191\209\139 \208\183\208\176 \208\180\208\190\208\187\208\179\208\184 \209\143\208\183\209\139\208\186 \208\190\209\130\209\128\208\181\208\183\208\176\208\187\208\184 \208\180\208\176?", 
    [41] = "\209\130\208\176\208\186 \208\182\208\181 \208\180\208\190\208\187\208\182\208\189\208\176 \208\177\209\139\208\187\208\176 \208\191\208\190\209\129\209\130\209\131\208\191\208\184\209\130\209\140 \209\130\208\178\208\190\209\143 \208\177\208\181\209\128\208\181\208\188\208\181\208\189\208\189\208\176\209\143 \208\188\208\176\209\130\209\131\209\133\208\176, \209\133\209\131\208\185 \208\183\208\189\208\176\208\181\209\130 \209\135\208\181 \208\190\208\189\208\176 \209\130\208\181\208\177\209\143 \208\191\208\190\208\182\208\176\208\187\208\181\208\187\208\176?", 
    [42] = "\208\178\209\139\208\181\208\177\208\176\208\189.", 
    [43] = "\209\129\208\178\208\184\208\189, \209\130\209\139 \209\135\208\181 \209\130\208\176\208\186 \209\129\208\184\208\187\209\140\208\189\208\190 \208\178 \209\129\208\181\208\177\209\143 \208\191\208\190\208\178\208\181\209\128\208\184\208\187 \209\135\209\130\208\190 \208\187\208\184?", 
    [44] = "\208\176\209\133\209\131\208\181\209\130\209\140 \208\180\208\176 \209\141\209\130\208\190 \208\182\208\181 \208\181\209\137\208\181 \208\190\208\180\208\184\208\189 \208\186\208\176\209\128\208\187\208\184\208\186 \208\178\209\139\208\181\208\177\208\176\208\189 0.0", 
    [45] = "\208\177\208\176\208\177\208\186\208\181 \209\130\208\178\208\190\208\181\208\185 \208\178\208\190\208\187\208\190\209\129\209\139 \208\189\208\176 \208\188\208\176\209\136\208\190\208\189\208\186\208\181 \209\128\208\178\208\176\208\187, \208\180\208\190\209\135\209\140 \209\136\208\187\209\142\209\133\208\184 \208\177\208\181\208\183\208\188\208\190\208\183\208\179\208\187\208\190\208\185. \208\162\209\139 \208\182\208\181 \208\188\208\189\208\181 \209\131\208\182\208\181 \208\178\209\129\208\181 \208\191\209\128\208\190\208\181\208\177\208\176\208\187))", 
    [46] = "\208\190\209\135\208\181\209\128\208\181\208\180\208\189\208\176\209\143 \209\133\209\131\208\184\208\187\208\176 \209\131\208\191\208\176\208\187\208\176(", 
    [47] = "\209\131\208\191\208\176\208\187 \209\131\208\177\208\187\209\142\208\180\208\190\208\186"
};
local v580 = {
    [1] = "\210\156\227\132\154\228\184\130", 
    [2] = "\226\130\174\226\177\164\226\130\179\226\130\178\201\134\196\144\201\142", 
    [3] = "\239\189\147\239\189\129\239\189\132", 
    [4] = "\225\180\128\202\159\225\180\141\225\180\143\234\156\177\225\180\155", 
    [5] = "\202\153\225\180\135\225\180\155\225\180\155\225\180\135\202\128 \202\159\225\180\156\225\180\132\225\180\139 \201\180\225\180\135x\225\180\155 \225\180\155\201\170\225\180\141\225\180\135, \225\180\152\225\180\143\225\180\143\202\128\225\180\143\201\180", 
    [6] = "\225\180\128\202\153\225\180\156\234\156\177\225\180\135 \202\143\225\180\143\225\180\156\202\128 \201\180\225\180\135\201\162\225\180\128\225\180\155\201\170\225\180\160\225\180\135 \201\170Q \234\156\177\225\180\143\225\180\141\225\180\135\225\180\161\202\156\225\180\135\202\128\225\180\135 \225\180\135\202\159\234\156\177\225\180\135", 
    [7] = "\226\130\163\201\132\226\130\181\226\130\173\197\130\226\130\166\226\130\178 \197\130\226\130\165\226\130\165\197\130\226\130\178\226\177\164\226\130\179\226\130\166\226\130\174 \201\142\195\152\201\132'\226\177\160\226\177\160 \196\144\197\130\201\134", 
    [8] = "\194\183=\194\187\226\128\161\194\171=\194\183- \226\157\182 -\194\183=\194\187\226\128\161\194\171=\194\183-", 
    [9] = "\226\153\165 Your mom is under my table rn, shes working to renew your sub ^^ \226\153\165", 
    [10] = "\226\130\180\226\130\174\226\130\179\226\130\166\196\144 \201\132\226\130\177 \226\130\163\226\177\164\195\152\226\130\165 \201\142\195\152\201\132\226\177\164 \226\130\173\226\130\166\201\134\201\134\226\130\180 \226\130\163\197\130\226\130\166\226\130\179\226\177\160\226\177\160\201\142?", 
    [11] = "\225\180\132\202\159\201\170\225\180\152\225\180\152\225\180\135\225\180\133", 
    [12] = "\201\150\201\155\201\162\201\155\213\188\201\155\202\128\199\159\200\182\201\168\213\188\201\162 \199\159\214\132\201\155 \214\133.0", 
    [13] = "\240\157\151\177\240\157\151\178\240\157\151\179\240\157\151\178\240\157\151\187\240\157\152\128\240\157\151\182\240\157\152\131\240\157\151\178 \240\157\151\174\240\157\151\187\240\157\151\180\240\157\151\185\240\157\151\178\240\157\152\128 \240\157\151\179\240\157\151\185\240\157\151\178\240\157\152\132 \240\157\151\174\240\157\152\132\240\157\151\174\240\157\152\134 \240\157\151\181\240\157\152\130\240\157\151\181?", 
    [14] = "\226\130\180\201\134\201\134\226\130\165\226\130\180 \226\177\160\197\130\226\130\173\201\134 \201\142\195\152\201\132'\226\177\164\201\134 \226\177\160\201\134\226\130\178\197\130\226\130\174.", 
    [15] = "\240\157\153\153\240\157\153\164\240\157\153\163\240\157\153\169 \240\157\153\167\240\157\153\154\240\157\153\163\240\157\153\154\240\157\153\172 \240\157\153\174\240\157\153\164\240\157\153\170\240\157\153\167 \240\157\153\168\240\157\153\170\240\157\153\151 \240\157\153\151\240\157\153\167\240\157\153\164. \240\157\152\189\240\157\153\154\240\157\153\169\240\157\153\169\240\157\153\154\240\157\153\167 \240\157\153\155\240\157\153\154\240\157\153\154\240\157\153\153 \240\157\153\174\240\157\153\164\240\157\153\170\240\157\153\167 \240\157\153\168\240\157\153\169\240\157\153\150\240\157\153\167\240\157\153\171\240\157\153\158\240\157\153\163\240\157\153\156 \240\157\153\155\240\157\153\150\240\157\153\162\240\157\153\158\240\157\153\161\240\157\153\174.", 
    [16] = "\240\157\150\144\240\157\150\138\240\157\150\138\240\157\150\149 \240\157\150\136\240\157\150\148\240\157\150\145\240\157\150\145\240\157\150\138\240\157\150\136\240\157\150\153\240\157\150\142\240\157\150\147\240\157\150\140 \240\157\150\137\240\157\150\142\240\157\150\136\240\157\150\144\240\157\150\152 \240\157\150\142\240\157\150\147 \240\157\150\158\240\157\150\148 \240\157\150\146\240\157\150\148\240\157\150\154\240\157\150\153\240\157\150\141, \240\157\150\139\240\157\150\134\240\157\150\140\240\157\150\140\240\157\150\148\240\157\150\153", 
    [17] = "\240\157\144\160\240\157\144\168 \240\157\144\169\240\157\144\165\240\157\144\154\240\157\144\178 \240\157\144\172\240\157\144\168\240\157\144\166\240\157\144\158 \240\157\144\154\240\157\144\167\240\157\144\160\240\157\144\171\240\157\144\178 \240\157\144\155\240\157\144\162\240\157\144\171\240\157\144\157\240\157\144\172 \240\157\144\162\240\157\144\157\240\157\144\164 \240\157\144\178\240\157\144\168\240\157\144\174'\240\157\144\171\240\157\144\158 \240\157\144\167\240\157\144\168\240\157\144\173 \240\157\144\157\240\157\144\168\240\157\144\162\240\157\144\167\240\157\144\160 \240\157\144\176\240\157\144\158\240\157\144\165\240\157\144\165 \240\157\144\161\240\157\144\158\240\157\144\171\240\157\144\158", 
    [18] = "\239\189\131\239\189\149\239\189\141 \239\189\147\239\189\140\239\189\149\239\189\148", 
    [19] = "\225\180\133\201\170\234\156\177\225\180\128\225\180\152\225\180\152\225\180\143\201\170\201\180\225\180\155\225\180\141\225\180\135\201\180\225\180\155.", 
    [20] = "\226\130\177\201\132\226\130\180\226\177\167 & \226\130\177\226\177\164\226\130\179\201\142 \226\130\179\197\130\226\130\166\226\130\174 \226\130\169\195\152\226\177\164\226\130\173\197\130\226\130\166\226\130\178 \226\130\166\195\152 \226\130\165\195\152\226\177\164\201\134?", 
    [21] = "\240\157\144\146\240\157\144\154\240\157\144\157 \240\157\144\173\240\157\144\168 \240\157\144\176\240\157\144\154\240\157\144\173\240\157\144\156\240\157\144\161 \240\157\144\178\240\157\144\168\240\157\144\174'\240\157\144\171\240\157\144\158 \240\157\144\157\240\157\144\178\240\157\144\162\240\157\144\167\240\157\144\160 \240\157\144\154\240\157\144\160\240\157\144\154\240\157\144\162\240\157\144\167", 
    [22] = "J\201\132\226\130\165\226\130\177\197\130\226\130\166\226\130\178 \195\152\226\130\166 \201\142\195\152\201\132\226\177\164 \226\130\178\226\177\164\226\130\179V\201\134 \226\130\165\226\130\163", 
    [23] = "\239\188\169\227\128\128\239\189\131\239\189\129\239\189\142\239\189\148\227\128\128\239\189\131\239\189\143\239\189\149\239\189\142\239\189\148\227\128\128\239\189\148\239\189\143\227\128\128\239\188\146\227\128\128\239\189\147\239\189\143\227\128\128\239\188\132\239\188\145\239\188\132", 
    [24] = "\240\157\147\185\240\157\147\187\240\157\147\170\240\157\148\130\240\157\147\178\240\157\147\183\240\157\147\176 \240\157\147\175\240\157\147\184\240\157\147\187 \240\157\147\183\240\157\147\174\240\157\147\191\240\157\147\174\240\157\147\187\240\157\147\181\240\157\147\184\240\157\147\188\240\157\147\174 \240\157\147\187\240\157\147\174\240\157\147\188\240\157\147\184\240\157\147\181\240\157\147\191\240\157\147\174\240\157\147\187", 
    [25] = "\239\188\138\239\189\135\239\189\148\239\189\134\239\189\143\227\128\128\239\189\146\239\189\133\239\189\148\239\189\129\239\189\146\239\189\132\239\188\138", 
    [26] = "\239\189\151\239\189\153\239\189\132\239\188\159", 
    [27] = "\240\157\144\161\240\157\144\168\240\157\144\165\240\157\144\178 \240\157\144\172\240\157\144\161\240\157\144\162\240\157\144\173 \240\157\144\155\240\157\144\171\240\157\144\168 \240\157\144\174\240\157\144\171 \240\157\144\155\240\157\144\165\240\157\144\154\240\157\144\156\240\157\144\164", 
    [28] = "\240\157\150\141\240\157\150\141\240\157\150\141\240\157\150\141", 
    [29] = "\227\128\144\239\187\191\239\188\145\227\128\145", 
    [30] = "\202\183\225\181\146\226\129\191\225\181\151 \225\182\156\225\181\146\225\181\144\225\181\144\225\181\137\226\129\191\225\181\151 \225\181\151\202\176\226\129\177\203\162 \203\162\202\176\226\129\177\225\181\151", 
    [31] = "\240\157\149\164\240\157\149\157\240\157\149\146\240\157\149\167\240\157\149\150.", 
    [32] = "\239\189\151\239\189\143\239\189\151\227\128\128\239\189\137\239\189\142\239\189\147\239\189\129\239\189\142\239\189\133\227\128\128\239\189\137\239\189\145\239\188\159", 
    [33] = "\226\153\165 Keep Yourself Safe next time \226\153\165", 
    [34] = "\225\180\133\225\180\128\201\180\225\180\132\201\170\201\180\201\162 \225\180\143\201\180 \202\143\225\180\143\225\180\156\202\128 \201\162\202\128\225\180\128\225\180\160\225\180\135 \201\180\201\170\201\162\201\162\225\180\128", 
    [35] = "\234\156\176\225\180\135\225\180\135\225\180\133\201\170\201\180\201\162 \202\143\225\180\143\225\180\156\202\128 \225\180\141\225\180\143\225\180\141 \225\180\161\201\170\225\180\155\202\156 \225\180\141\202\143 \234\156\177\225\180\161\225\180\135\225\180\135\225\180\155 \234\156\177\225\180\152\225\180\135\202\128\225\180\141. \234\156\177\202\156\225\180\135 \202\156\225\180\128\234\156\177\201\180'\225\180\155 \225\180\135\225\180\128\225\180\155\225\180\135\201\180 \234\156\176\225\180\143\202\128 \225\180\155\202\156\202\128\225\180\135\225\180\135 \225\180\133\225\180\128\202\143\234\156\177 \225\180\155\202\156\225\180\143, \202\156\225\180\143\225\180\152\225\180\135 \234\156\177\202\156\225\180\135 \202\159\201\170\225\180\139\225\180\135\234\156\177 \201\170\225\180\155^^", 
    [36] = "\240\157\150\153\240\157\150\148\240\157\150\148 \240\157\150\149\240\157\150\134\240\157\150\153\240\157\150\141\240\157\150\138\240\157\150\153\240\157\150\142\240\157\150\136 \240\157\150\153\240\157\150\148 \240\157\150\138\240\157\150\155\240\157\150\138\240\157\150\147 \240\157\150\145\240\157\150\134\240\157\150\154\240\157\150\140\240\157\150\141 \240\157\150\134\240\157\150\135\240\157\150\148\240\157\150\154\240\157\150\153 \240\157\150\142\240\157\150\153, \240\157\150\147\240\157\150\142\240\157\150\140\240\157\150\140\240\157\150\134", 
    [37] = "\240\157\144\161\240\157\144\168\240\157\144\176 \240\157\144\157\240\157\144\162\240\157\144\157 \240\157\144\178\240\157\144\168\240\157\144\174 \240\157\144\158\240\157\144\172\240\157\144\156\240\157\144\154\240\157\144\169\240\157\144\158 \240\157\144\159\240\157\144\171\240\157\144\168\240\157\144\166 \240\157\144\173\240\157\144\161\240\157\144\158 \240\157\144\179\240\157\144\168\240\157\144\168 \240\157\144\176\240\157\144\162\240\157\144\173\240\157\144\161 \240\157\144\173\240\157\144\161\240\157\144\154\240\157\144\173 \240\157\144\164\240\157\144\162\240\157\144\167\240\157\144\157 \240\157\144\168\240\157\144\159 \240\157\144\154 \240\157\144\166\240\157\144\168\240\157\144\175\240\157\144\158\240\157\144\166\240\157\144\158\240\157\144\167\240\157\144\173?", 
    [38] = "\234\156\177\225\180\128\225\180\133 \201\180\225\180\135\225\180\161\234\156\177. \225\180\138\225\180\156\234\156\177\225\180\155 \225\180\138\225\180\156\225\180\141\225\180\152\201\170\201\180\201\162 \225\180\128\202\128\225\180\143\225\180\156\201\180\225\180\133 \225\180\161\225\180\143\201\180\225\180\155 \202\156\225\180\135\202\159\225\180\152 \202\143\225\180\143\225\180\156 \225\180\155\225\180\143 \234\156\176\201\170x \202\143\225\180\143\225\180\156\202\128 \234\156\177\202\156\201\170\225\180\155\225\180\155\202\143 \201\170\201\180\225\180\155\225\180\135\202\159\202\159\225\180\135\225\180\132\225\180\155.", 
    [39] = "$\240\157\144\172\240\157\144\162\240\157\144\160\240\157\144\166\240\157\144\154 \240\157\144\157\240\157\144\162\240\157\144\157\240\157\144\167'\240\157\144\173 \240\157\144\162\240\157\144\167\240\157\144\175\240\157\144\162\240\157\144\173\240\157\144\158 \240\157\144\166\240\157\144\158 \240\157\144\155\240\157\144\158\240\157\144\156\240\157\144\154\240\157\144\174\240\157\144\172\240\157\144\158 \240\157\144\161\240\157\144\158'\240\157\144\172 \240\157\144\154\240\157\144\159\240\157\144\171\240\157\144\154\240\157\144\162\240\157\144\157 \240\157\144\168\240\157\144\159 \240\157\144\166\240\157\144\158$", 
    [40] = "\194\181hh?", 
    [41] = "\240\157\144\176\240\157\144\158\240\157\144\165\240\157\144\165, \240\157\144\154\240\157\144\167\240\157\144\168\240\157\144\173\240\157\144\161\240\157\144\158\240\157\144\171 \240\157\144\166\240\157\144\168\240\157\144\167\240\157\144\164\240\157\144\158\240\157\144\178 \240\157\144\159\240\157\144\165\240\157\144\158\240\157\144\176 \240\157\144\172\240\157\144\173\240\157\144\171\240\157\144\154\240\157\144\162\240\157\144\160\240\157\144\161\240\157\144\173 \240\157\144\162\240\157\144\167\240\157\144\173\240\157\144\168 \240\157\144\173\240\157\144\161\240\157\144\158 \240\157\144\172\240\157\144\164\240\157\144\178.."
};
local function v586(v581)
    local l_random_0 = math.random;
    for v583 = #v581, 2, -1 do
        local v584 = l_random_0(v583);
        local v585 = v581[v584];
        v581[v584] = v581[v583];
        v581[v583] = v585;
    end;
end;
v586(v577);
v586(v578);
v586(v579);
v586(v580);
local function v589(v587)
    if v587 and #v587 > 0 then
        local v588 = v587[1];
        table.remove(v587, 1);
        return v588;
    else
        return nil;
    end;
end;
local function v594(v590, v591)
    -- upvalues: v577 (ref), v578 (ref), v579 (ref), v580 (ref), v589 (ref), v586 (ref)
    local v592 = nil;
    if v590 == "Russian" and v591 == "\a" .. hexx .. ui.get_icon("sword") .. "\aDEFAULT Lua War" then
        v592 = v577;
    elseif v590 == "English" and v591 == "\a" .. hexx .. ui.get_icon("sword") .. "\aDEFAULT Lua War" then
        v592 = v578;
    elseif v590 == "Russian" and v591 == "\a" .. hexx .. ui.get_icon("face-swear") .. "\aDEFAULT Regular" then
        v592 = v579;
    elseif v590 == "English" and v591 == "\a" .. hexx .. ui.get_icon("face-swear") .. "\aDEFAULT Regular" then
        v592 = v580;
    end;
    local v593 = v589(v592);
    if v592 and #v592 == 0 then
        if v592 == v577 then
            v577 = {
                [1] = "\208\186\209\128\209\131\209\130\208\190\208\185, \208\189\208\176\208\178\208\181\209\128\208\189\208\190\208\181 \209\135\208\184\208\188\208\181\209\128\209\131 \208\179\208\181\209\130\208\189\209\131\208\187 \208\180\208\176?", 
                [2] = "\208\177\209\128\208\190 \209\129\208\190\209\128\209\128\208\184 \209\143 \208\186\208\184\209\129\208\187\208\190\209\130\209\131 \209\131\208\177\208\184\208\187 \208\176\209\129\208\184\208\180 \209\130\208\181\209\135 \208\177\208\190\208\187\209\140\209\136\208\181 \208\189\208\181 \208\190\208\177\208\189\208\190\208\178\208\184\209\130\209\140\209\129\209\143(((", 
                [3] = "$\209\143 \209\128\208\158\209\130 \208\181\208\145\208\176\208\187 \208\146\208\176\208\168\208\149\208\185 \208\156\208\181\208\155\208\144\208\157\209\133\208\190\208\155\208\184\208\184$", 
                [4] = "\208\144\208\165\208\144\208\165\208\144\208\165\208\144\208\165\208\144\208\165 \208\181\208\177\208\176\209\130\209\140 \209\130\209\139 \208\177\208\187\209\131\209\133\208\179\208\176\208\189\208\179", 
                [5] = "\208\184\208\180\208\184 \208\181\209\137\208\181 \208\189\208\176 \208\186\208\189\208\190\208\191\208\190\209\135\208\186\208\184 \208\178\208\189\209\131\209\130\209\128\208\184 \209\129\208\178\208\190\208\181\208\185 \208\191\208\176\209\129\209\130\209\139-\209\133\209\131\208\181\209\130\209\139 \208\191\208\190\209\130\209\139\208\186\208\176\208\185, \208\188\208\190\208\182\208\181\209\130 \208\176\208\189\209\130\208\184\208\176\208\184\208\188\209\139 \208\189\208\176\208\185\208\180\208\181\209\136\209\140", 
                [6] = "\208\149\208\145\208\144\208\162\208\172 \208\145\208\160\208\158\208\158\208\158 \208\162\208\171 \208\162\208\144\208\154 \208\167\208\149\208\162\208\154\208\158 \208\148\208\149\208\157\208\172\208\147\208\152 \208\159\208\160\208\158\208\149\208\145\208\144\208\155$$$", 
                [7] = "\208\178\209\139\208\186\208\187\209\142\209\135\208\184 \209\129\208\178\208\190\209\142 \209\133\209\131\208\181\209\130\209\131 \208\189\208\181 \208\191\208\190\208\183\208\190\209\128\209\140\209\129\209\143", 
                [8] = "\208\184\208\178\208\176\208\189 \208\183\208\190\208\187\208\190 \208\177\209\139 \208\187\209\131\209\135\209\136\208\181 \208\189\208\181\208\191\208\190\208\191\208\176\208\180\208\176\208\185\208\186\208\184 \208\189\208\176\208\191\208\184\209\129\208\176\208\187 \209\135\208\181\208\188 \209\130\208\178\208\190\208\185 \208\186\208\190\208\180\208\181\209\128)", 
                [9] = "\208\187\209\131\208\176\209\133\209\131 \208\178\209\139\208\186\208\187\209\142\209\135\208\184 \209\129\208\178\208\190\209\142 \208\176 \209\130\208\190 \209\133\209\131\208\185\208\189\208\181\208\185 \208\189\208\176 \208\178\208\181\209\129\209\140 \209\129\208\181\209\128\208\178\208\181\209\128 \208\191\208\176\209\133\208\189\208\181\209\130", 
                [10] = "\209\143 \208\189\208\176\208\180\208\181\209\142\209\129\209\140 \209\141\209\130\208\190 \209\129\209\130\208\176\208\189\208\181\209\130 \208\180\208\187\209\143 \209\130\208\181\208\177\209\143 \208\183\208\178\208\190\208\189\208\190\209\135\208\186\208\190\208\188 \208\179\208\181\209\130\208\189\209\131\209\130\209\140 easy.sync $", 
                [11] = "\209\143 \208\178\208\176\209\136\208\184\208\188 \208\176\208\189\208\179\208\181\208\187\208\178\208\184\208\189\208\179\209\129\208\176\208\188 \208\186\209\128\209\139\208\187\209\140\209\143 \209\128\208\181\208\183\208\176\208\187, \209\131\208\177\208\187\209\142\208\180\208\186\208\184 ", 
                [12] = "\208\165\208\144\208\165\208\144\208\165\208\144\208\165\208\144\208\165\208\144-\209\129\209\130\208\181\209\128\208\184\209\143", 
                [13] = "\208\178\208\176\208\182\208\189\208\190 \208\183\208\189\208\176\209\130\209\140 \208\189\208\181 \208\188\208\176\209\130\208\181\208\188\208\176\209\130\208\184\208\186\209\131, \208\176 \209\130\208\190 \209\135\209\130\208\190 easy.sync \209\128\208\178\208\181\209\130 \208\178\208\176\209\136\208\184 \208\182\208\190\208\191\209\139.", 
                [14] = "\208\186\209\128\209\143\208\186\208\189\209\131\208\187 \209\141\209\130\208\181\209\128\208\189\208\176\208\187.\208\186\208\190\208\180\209\129, \209\129\208\187\208\184\208\187 - \208\176 \208\178\209\129\208\181\208\188 \208\178\209\129\208\181 \209\128\208\176\208\178\208\189\208\190 \208\191\208\190\209\133\209\131\208\185, \208\190\208\189 \208\179\208\190\208\178\208\189\208\190(", 
                [15] = "\208\152 \208\178\208\190\209\130 \208\183\208\176 \209\141\209\130\209\131 \209\133\209\131\208\185\208\189\209\142 \209\128\208\176\208\177\208\190\209\130\208\176\208\187\208\176 \209\130\208\178\208\190\209\143 \208\188\208\176\209\130\209\131\209\133\208\176? \208\161\209\130\209\139\208\180\208\189\208\190", 
                [16] = "\208\161\208\188\208\190\209\130\209\128\208\184 \208\186\208\176\208\186\208\184\208\181 \208\180\208\190\208\187\208\182\208\189\209\139 \208\177\209\139\209\130\209\140 \208\176\208\189\209\130\208\184\208\176\208\184\208\188\209\139 ^^", 
                [17] = "\208\176\209\133\208\176\209\133\208\176\209\133\208\176\209\133\208\176 \208\176 \208\189\208\181\209\130 \208\191\208\190\208\180\208\190\208\182\208\180\208\184 \208\189\208\181 \209\129\208\188\208\181\209\136\208\189\208\190, \209\130\209\139 \208\182\208\181 \209\135\208\184\208\188\208\181\209\128\208\176 \209\142\208\183\208\181\209\128", 
                [18] = "\208\177\209\128\208\190 \209\130\209\139 \208\182\208\181 \208\188\208\190\208\182\208\181\209\136\209\140 \208\179\208\181\209\130\208\189\209\131\209\130\209\140 easy.sync \208\184 \208\177\209\139\209\130\209\140 \209\129\209\135\208\176\209\129\209\130\208\187\208\184\208\178\209\139\208\188", 
                [19] = "\209\143 \208\190\209\135\208\181\208\189\209\140 \208\180\208\190\208\187\208\179\208\190 \208\184\209\129\208\186\208\176\208\187, \208\189\208\190 \208\189\208\181 \209\129\208\188\208\190\208\179 \208\189\208\176\208\185\209\130\208\184 \208\176\208\189\209\130\208\184\208\176\208\184\208\188\209\139 \208\187\209\131\209\135\209\136\208\181 \209\135\208\181\208\188 \209\131 easy.sync$", 
                [20] = "\208\183\208\176\208\181\208\177\208\184\209\129\209\140 \209\130\209\139 \208\180\208\181\208\189\209\140\208\179\208\184 \208\191\209\128\208\190\208\181\208\177\208\176\208\187, \209\131\209\129\208\176\209\130\209\139\208\185", 
                [21] = "\209\130\208\181\208\177\208\181 \208\177\209\139 \209\129 \209\130\208\176\208\186\208\184\208\188\208\184 \208\187\209\131\208\176\209\136\208\186\208\176\208\188\208\184 \208\178 \208\180\208\190\209\130\209\131, \209\130\208\176\208\188 \208\184\208\189\208\178\208\176\208\187\208\184\208\180\208\190\208\178 \208\187\209\142\208\177\209\143\209\130", 
                [22] = "\208\188\208\190\209\143 \208\182\208\184\208\183\208\189\209\140 \209\129\209\130\208\176\208\187\208\176 \208\187\208\181\208\179\209\135\208\181 \208\191\208\190\209\129\208\187\208\181 \208\191\208\190\208\186\209\131\208\191\208\186\208\184 easy.sync", 
                [23] = "\208\188\208\181\208\189\209\143 \208\177\209\128\208\190\209\129\208\184\208\187\208\176 \208\182\208\181\208\189\208\176 \208\189\208\190 \208\188\208\189\208\181 \208\191\208\190\209\133\209\131\208\185, \209\143 \208\177\209\139\208\187 \208\183\208\176\208\189\209\143\209\130 \209\135\209\130\208\181\208\189\208\184\208\181\208\188 \209\135\208\181\208\189\208\180\208\182\208\187\208\190\208\179\208\176 easy.sync", 
                [24] = "$\209\133\208\190\208\180\209\143\209\130 \209\129\208\187\209\131\209\133\208\184, \209\135\209\130\208\190 \208\186\208\184\209\129\208\187\208\190\209\130\208\176 \208\187\209\131\209\135\209\136\208\176\209\143 \208\188\208\184\208\189\208\181\209\130\209\135\208\184\209\134\208\176 \209\128\208\190\209\129\209\129\208\184\208\184$", 
                [25] = "\209\131 \208\188\208\181\208\189\209\143 \208\177\208\176\208\177\209\131\209\136\208\186\208\176 \208\187\209\131\209\135\209\136\208\181 \208\176\208\189\209\130\208\184\208\176\208\184\208\188\209\139 \208\180\208\181\208\187\208\176\208\181\209\130, \208\190\208\187\209\131\209\133", 
                [26] = "\208\186\209\128\209\131\209\130\208\190, \209\130\208\181\208\177\209\143 \208\190\208\191\209\143\209\130\209\140 \208\191\208\190\209\129\209\130\208\176\208\178\208\184\208\187\208\184 \209\128\208\176\208\186\208\190\208\188. \208\144 \208\178\209\129\208\181 \208\191\208\190\209\130\208\190\208\188\209\131 \209\135\209\130\208\190 \209\130\209\139 \208\177\208\181\208\183 easy.sync", 
                [27] = "1111111", 
                [28] = "\208\186\209\130\208\190 \209\130\208\181\208\177\208\181 \208\180\208\181\209\132\208\181\208\189\209\129\208\184\208\178\209\139 \209\130\208\176\208\186\208\184\208\181 \208\189\208\176\208\191\208\184\209\129\208\176\208\187, \208\188\209\128\208\176\208\183\208\190\209\130\208\176?", 
                [29] = "\208\189\208\184\209\133\209\131\209\143\209\143\209\143 \209\129\208\181\208\177\208\181, \208\186\208\176\208\186 \209\130\209\139 \208\184\208\183 \208\183\208\190\208\190\208\191\208\176\209\128\208\186\208\176 \209\129\208\177\208\181\208\182\208\176\208\187 \209\129 \209\130\208\176\208\186\208\184\208\188 \208\188\209\131\208\178\208\188\208\181\208\189\209\130\208\190\208\188?", 
                [30] = "\209\131 \209\130\208\181\208\177\209\143 \208\181\209\137\208\181 \208\181\209\129\209\130\209\140 \209\136\208\176\208\189\209\129 \209\129\209\130\208\176\209\130\209\140 \208\188\209\131\208\182\208\184\208\186\208\190\208\188, \208\179\208\181\209\130\208\189\208\184 \208\184\208\183\208\184.\209\129\208\184\208\189\208\186 \208\184 \209\130\208\178\208\190\209\143 \208\182\208\184\208\183\208\189\209\140 \209\129\209\130\208\176\208\189\208\181\209\130 \208\187\208\181\208\179\209\135\208\181^^", 
                [31] = "\208\181\208\177\208\176\209\130\209\140 \208\190\209\130 \209\130\208\178\208\190\208\181\208\185 \208\187\209\131\208\176\209\133\208\184 \208\189\208\176\208\178\208\190\208\183\208\190\208\188 \208\178\208\190\208\189\209\143\208\181\209\130", 
                [32] = "\208\177\208\181\208\180\208\189\209\143\208\179\208\176, \209\141\209\130\208\190 \209\130\209\139 \208\183\208\176 \209\141\209\130\209\131 \209\133\209\131\208\185\208\189\209\142 \209\131 \208\180\208\181\208\180\208\176 \208\191\208\190\209\129\208\187\208\181\208\180\208\189\209\142\209\142 \208\191\208\181\208\189\209\129\208\184\209\142 \208\190\209\130\208\190\208\177\209\128\208\176\208\187?", 
                [33] = "\209\143 \208\180\208\181\208\177\208\176\208\179 \209\142\208\183\208\181\209\128 \208\188\208\189\208\181 \208\191\208\190\209\133\209\131\208\185 \208\189\208\176 \209\130\208\178\208\190\209\142 \209\133\209\131\208\185\208\189\209\142", 
                [34] = "\208\189\208\184\209\133\209\131\209\143?!! \208\178\208\190\209\130 \209\141\209\130\208\190 \209\130\208\181\208\177\209\143 \208\178\209\139\208\181\208\177\208\176\208\187 easy.sync) \208\189\208\181 \208\183\208\176 \209\135\209\130\208\190 :)", 
                [35] = "\209\131\208\179\208\176\208\180\208\176\208\185 \208\186\209\130\208\190 \208\190\208\191\209\143\209\130\209\140 \209\130\208\181\208\177\209\143 \208\183\208\176\208\190\208\178\208\189\208\184\208\187? \209\130\208\176\208\186 \209\141\209\130\208\190 \208\182\208\181 easy.sync debug \209\142\208\183\208\181\209\128 (\209\143)", 
                [36] = "\208\176\209\133\208\176\209\133\208\176\209\133\208\176\209\133\208\176\209\133-yaw", 
                [37] = "\209\130\208\176\208\186 \208\182\208\181\209\129\209\130\208\190\208\186\208\190 \209\130\208\181\208\177\209\143 \208\189\208\176\208\178\208\181\209\128\208\189\208\190\208\181 \208\181\209\137\208\181 \208\189\208\181 \208\181\208\177\208\176\208\187\208\184 \208\180\208\176? \208\162\208\176\208\186 \209\141\209\130\208\190 \208\191\208\190\209\130\208\190\208\188\209\131 \209\135\209\130\208\190 \209\130\209\139 \208\184\208\183\208\184.\209\129\208\184\208\189\208\186 \209\142\208\183\208\181\209\128\208\190\208\178 \208\189\208\181 \208\178\209\129\209\130\209\128\208\181\209\135\208\176\208\187, \208\181\208\177\208\187\208\190)", 
                [38] = "\208\186\209\128\209\131\209\130\208\190, \208\176 \209\130\208\181\208\191\208\181\209\128\209\140 \209\135\209\130\208\190 \208\181\209\137\208\181 \209\130\208\178\208\190\209\143 \209\133\209\131\208\185\208\189\209\143 \209\131\208\188\208\181\208\181\209\130?", 
                [39] = "\208\186\208\176\208\186 \209\130\208\176\208\188 \209\129\208\187\208\190\208\179\208\176\208\189.. \208\188\208\181\208\185\208\186 \208\185\208\190\209\131\209\128 \208\187\208\176\208\185\209\132 \208\184\208\183\208\184\208\181\209\128? \208\144 \209\133\208\190\209\130\209\143 \208\191\208\190\209\133\209\131\208\185, \209\143 \208\181\208\179\208\190 \208\189\208\181 \209\135\208\184\209\130\208\176\208\187, \209\143 \209\129\209\128\208\176\208\183\209\131 \208\191\208\190\209\136\208\181\208\187 \208\181\208\177\208\176\208\187\209\140\208\189\208\184\208\186\208\184 \208\187\209\131\208\176\209\129\208\181\208\189\209\129 \209\142\208\183\208\181\209\128\208\176\208\188 \209\128\208\176\208\183\208\189\208\190\209\129\208\184\209\130\209\140", 
                [40] = "\209\129\208\190\209\129\208\184 \209\141\209\130\208\184 \208\176\209\133\209\131\208\181\208\189\208\189\209\139\208\181 \208\180\208\181\209\132\208\181\208\189\209\129\208\184\208\178\209\139, \209\130\209\139 \209\130\208\176\208\186\208\184\209\133 \208\189\208\181 \209\131\208\178\208\184\208\180\208\184\209\136\209\140 \208\191\208\190\208\186\208\176 easy.sync \208\189\208\181 \208\179\208\181\209\130\208\189\208\181\209\136\209\140", 
                [41] = "\209\143 \208\177\209\139 \208\191\209\128\208\190\208\188\208\190\208\187\209\135\208\176\208\187, \208\189\208\190 \209\143 \208\184\208\188\208\181\209\142 \208\191\209\128\208\176\208\178\208\190 \209\129\208\186\208\176\208\183\208\176\209\130\209\140 \209\130\208\181\208\177\208\181 \209\135\209\130\208\190 \209\130\208\178\208\190\209\143 \208\187\209\131\208\176\209\133\208\176 \209\133\209\131\208\181\209\130\208\176) \209\143 \208\180\208\181\208\177\208\176\208\179 \209\142\208\183\208\181\209\128 \209\129\209\131\209\135\208\186\208\176", 
                [42] = "\208\180\208\181\208\189\209\140\208\179\208\184 \209\141\209\130\208\190 \209\129\208\176\208\188\208\190\208\181 \208\188\208\176\208\187\208\190\208\181 \209\135\209\130\208\190 \209\143 \208\188\208\190\208\179 \208\190\209\130\208\180\208\176\209\130\209\140 \208\183\208\176 \209\141\209\130\208\190\209\130 \209\136\208\181\208\180\208\181\208\178\209\128. \208\191\208\190\209\129\208\187\208\181\208\180\209\131\208\185 \208\188\208\190\208\181\208\188\209\131 \208\191\209\128\208\184\208\188\208\181\209\128\209\131 \208\184 \209\130\209\139 ^^ - easy.sync", 
                [43] = "\208\177\208\187\209\143 \209\130\209\131\209\130 \209\129\209\130\208\190\208\187\209\140\208\186\208\190 \209\128\208\176\208\183\208\189\209\139\209\133 \208\180\208\182\208\184\209\130\209\130\208\181\209\128\208\190\208\178 \208\184 \208\178\209\129\208\181 \209\128\208\176\208\177\208\190\209\130\208\176\209\142\209\130, \209\135\209\130\208\190 \208\183\208\176 \209\133\209\131\208\185\208\189\209\143? \208\176, \209\141\209\130\208\190 \208\182\208\181 easy.sync", 
                [44] = "\208\186\208\176\208\182\208\180\208\190\208\185 \209\130\208\178\208\176\209\128\208\181 - \208\191\208\190 \208\191\208\176\209\128\208\181. \208\176 \208\188\208\189\208\181 \209\129\208\176\208\188\209\139\208\185 \208\176\209\133\209\131\208\181\208\189\208\189\209\139\208\185 \208\177\208\184\208\187\208\180 easy.sync"
            };
            v586(v577);
        elseif v592 == v578 then
            v578 = {
                [1] = "\225\180\135\225\180\160\225\180\135\202\128\202\143 \225\180\143\225\180\155\202\156\225\180\135\202\128 \202\159\225\180\156\225\180\128 < \225\180\135\225\180\128\234\156\177\202\143.\234\156\177\202\143\201\180\225\180\132", 
                [2] = "-M\204\182e\204\182l\204\182a\204\182n\204\182c\204\182h\204\182o\204\182l\204\182i\204\182a\204\182- Nah get easy.sync", 
                [3] = "\240\157\153\189\240\157\154\142\240\157\154\142\240\157\154\141 \240\157\154\138 \240\157\154\144\240\157\154\152\240\157\154\152\240\157\154\141 \240\157\154\149\240\157\154\158\240\157\154\138? \240\157\154\144\240\157\154\152 \240\157\154\143\240\157\154\152\240\157\154\155 \240\157\154\142\240\157\154\138\240\157\154\156\240\157\154\162.\240\157\154\156\240\157\154\162\240\157\154\151\240\157\154\140", 
                [4] = "\226\151\163_\226\151\162Easy.sync wins again\226\151\163_\226\151\162", 
                [5] = "\226\150\129 \226\150\130 \226\150\131 \226\150\133 \226\150\134 \226\150\135 \226\150\136 easy.sync works other luas dont \226\150\136 \226\150\135 \226\150\134 \226\150\133 \226\150\131 \226\150\130 \226\150\129", 
                [6] = "\240\157\147\182\240\157\147\170\240\157\147\180\240\157\147\174 \240\157\148\130\240\157\147\184\240\157\147\190\240\157\147\187 \240\157\147\181\240\157\147\178\240\157\147\175\240\157\147\174 \239\188\165\239\188\161\239\188\179\239\188\169\239\188\165\239\188\178", 
                [7] = "\240\157\147\172\240\157\147\170\240\157\147\183\240\157\147\189 \240\157\147\175\240\157\147\174\240\157\147\174\240\157\147\181 \240\157\148\130\240\157\147\184\240\157\147\190\240\157\147\187 \240\157\147\175\240\157\147\190\240\157\147\172\240\157\147\180\240\157\147\178\240\157\147\183\240\157\147\176 \225\180\132\202\156\201\170\225\180\141\225\180\135\202\128\225\180\128", 
                [8] = "\239\188\169\227\128\128\239\189\131\239\189\129\239\189\142\227\128\128\239\189\136\239\189\133\239\189\129\239\189\146\227\128\128\239\189\153\239\189\143\239\189\149\239\188\135\239\189\146\239\189\133\227\128\128\239\189\146\239\189\133\239\189\135\239\189\146\239\189\133\239\189\148\239\189\148\239\189\137\239\189\142\239\189\135  \239\189\130\239\189\149\239\189\153\239\189\137\239\189\142\239\189\135\227\128\128\239\189\148\239\189\136\239\189\137\239\189\147  \239\189\144\239\189\137\239\189\133\239\189\131\239\189\133\227\128\128\239\189\143\239\189\134\227\128\128\239\189\147\239\189\136\239\189\137\239\189\148", 
                [9] = "easy.sync - the easiest way to dominate", 
                [10] = "\240\157\147\155\240\157\147\158\240\157\147\162\240\157\147\162. \240\157\147\158\240\157\147\149. \240\157\147\156\240\157\147\158\240\157\147\157\240\157\147\148\240\157\147\168.", 
                [11] = "\225\180\141\202\143 \202\159\201\170\234\156\176\225\180\135 \225\180\161\225\180\128\234\156\177 \234\156\177\225\180\143 \202\156\225\180\128\202\128\225\180\133 \202\153\225\180\135\234\156\176\225\180\143\202\128\225\180\135 \201\170 \201\162\225\180\143\225\180\155 \225\180\135\225\180\128\234\156\177\202\143.\234\156\177\202\143\201\180\225\180\132", 
                [12] = "\226\177\164\201\134\226\130\180\226\130\177\201\134\226\130\181\226\130\174 \201\142\195\152\201\132\226\177\164\226\130\180\201\134\226\177\160\226\130\163. \196\144\201\134\226\177\160\201\134\226\130\174\201\134 \226\130\179\226\130\181\197\130\196\144.\226\130\174\201\134\226\130\181\226\177\167.", 
                [13] = "\240\157\149\152\240\157\149\160\240\157\149\165 \240\157\149\159\240\157\149\160 \240\157\149\165\240\157\149\154\240\157\149\158\240\157\149\150 \240\157\149\151\240\157\149\160\240\157\149\163 \240\157\149\170\240\157\149\160\240\157\149\166\240\157\149\163 \240\157\149\148\240\157\149\153\240\157\149\150\240\157\149\163\240\157\149\159\240\157\149\160\240\157\149\147\240\157\149\170\240\157\149\157 \240\157\149\157\240\157\149\160\240\157\149\157", 
                [14] = "\202\184\225\181\146\225\181\152\202\179 \225\181\136\225\181\137\225\181\155 \226\129\191\225\181\137\225\181\137\225\181\136\203\162 \203\162\225\181\146\225\181\144\225\181\137 \225\182\156\225\181\146\225\181\136\226\129\177\226\129\191\225\181\141 \203\161\225\181\137\203\162\203\162\225\181\146\226\129\191\203\162.", 
                [15] = "\201\170  \234\156\177\225\180\135\225\180\135.  \225\180\128\225\180\141\225\180\128\225\180\162\201\170\201\180\201\162  \225\180\161\225\180\128\202\143 \225\180\155\225\180\143  \202\159\225\180\143\234\156\177\225\180\135  \202\143\225\180\143\225\180\156\202\128  \225\180\141\225\180\143\201\180\225\180\135\202\143", 
                [16] = "\225\180\135\225\180\128\234\156\177\202\143.\234\156\177\202\143\201\180\225\180\132 \202\156\225\180\128\234\156\177 \225\180\128\202\159\225\180\161\225\180\128\202\143\234\156\177 \202\153\225\180\135\225\180\135\201\180 \225\180\128\201\180\225\180\133 \225\180\128\202\159\225\180\161\225\180\128\202\143\234\156\177 \225\180\161\201\170\202\159\202\159 \202\153\225\180\135 \225\180\155\202\156\225\180\135 \201\162\202\128\225\180\135\225\180\128\225\180\155\225\180\135\234\156\177\225\180\155 \234\156\177\225\180\132\202\128\201\170\225\180\152\225\180\155 \225\180\143\234\156\176 \225\180\128\202\159\202\159 \225\180\155\201\170\225\180\141\225\180\135.", 
                [17] = "(Easy.sync) \239\184\187\226\148\179\226\149\144\228\184\128- - - - luasense", 
                [18] = "\240\157\149\149\240\157\149\160\240\157\149\159\240\157\149\165 \240\157\149\150\240\157\149\167\240\157\149\150\240\157\149\159 \240\157\149\165\240\157\149\150\240\157\149\157\240\157\149\157 \240\157\149\158\240\157\149\150 \240\157\149\170\240\157\149\160\240\157\149\166\240\157\149\163 \240\157\149\157\240\157\149\166\240\157\149\146 \240\157\149\159\240\157\149\146\240\157\149\158\240\157\149\150. \240\157\149\128 \240\157\149\146\240\157\149\157\240\157\149\163\240\157\149\150\240\157\149\146\240\157\149\149\240\157\149\170 \240\157\149\156\240\157\149\159\240\157\149\160\240\157\149\168 \240\157\149\154\240\157\149\165\240\157\149\164 \240\157\149\168\240\157\149\160\240\157\149\163\240\157\149\164\240\157\149\150.", 
                [19] = "\226\130\174\226\177\167\201\134 \195\152\226\130\166\226\177\160\201\142 \195\152\226\130\177\226\130\174\197\130\195\152\226\130\166 \226\130\163\195\152\226\177\164 \201\142\195\152\201\132 \197\130\226\130\180 \226\130\174\195\152 \224\184\191\226\130\179\197\130\226\130\165 \226\130\165\201\134. \224\184\191\195\152\226\177\164\197\130\226\130\166\226\130\178.", 
                [20] = "\213\161\201\166\199\159\200\182 \200\182\201\166\201\155 \202\132\202\138\198\136\211\132 \201\168\214\134 \214\134\201\155\202\128\201\155\213\188\201\168\200\182\202\143?", 
                [21] = "\201\170'\225\180\160\225\180\135 \234\156\177\225\180\135\225\180\128\202\128\225\180\132\202\156\225\180\135\225\180\133 \225\180\155\202\156\202\128\225\180\143\225\180\156\201\162\202\156 \225\180\128\202\159\202\159 9999 \225\180\143\234\156\176 \225\180\141\225\180\135\202\159\225\180\128\201\180\225\180\132\202\156\225\180\143\202\159\201\170\225\180\128 \234\156\177' \225\180\156\234\156\177\225\180\135\202\159\225\180\135\234\156\177\234\156\177 \234\156\177\202\156\201\170\225\180\155\225\180\155\202\143 \234\156\176\225\180\135\225\180\128\225\180\155\225\180\156\202\128\225\180\135\234\156\177 \225\180\128\201\180\225\180\133 \234\156\177\225\180\155\201\170\202\159\202\159 \202\156\225\180\128\225\180\160\225\180\135\201\180'\225\180\155 \234\156\176\225\180\143\225\180\156\201\180\225\180\133 \225\180\128\225\180\128.", 
                [22] = "\202\143\225\180\143\225\180\156\202\128 \225\180\133\225\180\135\225\180\160 \201\162\225\180\143\225\180\155\225\180\155\225\180\128 \234\156\176\201\170x \225\180\155\202\156\201\170\234\156\177 \225\180\128\225\180\128 \201\170\201\162?", 
                [23] = "\202\143\225\180\143\225\180\156\202\128 x\225\180\128x\225\180\128-\202\143\225\180\128\225\180\161 \225\180\128\201\170\201\180\225\180\155 \225\180\133\225\180\143\201\170\201\180\201\162 \201\162\225\180\143\225\180\143\225\180\133 \225\180\128\201\180\202\143\225\180\141\225\180\143\202\128\225\180\135?", 
                [24] = "\240\157\153\184\240\157\154\150 \240\157\154\140\240\157\154\158\240\157\154\157\240\157\154\157\240\157\154\146\240\157\154\151\240\157\154\144 \240\157\154\157\240\157\154\145\240\157\154\142 \240\157\154\160\240\157\154\146\240\157\154\151\240\157\154\144\240\157\154\156 \240\157\154\152\240\157\154\143 \240\157\154\157\240\157\154\145\240\157\154\146\240\157\154\156 \240\157\154\145\240\157\154\162\240\157\154\156\240\157\154\157\240\157\154\142\240\157\154\155\240\157\154\146\240\157\154\138 \240\157\154\156' \240\157\154\139\240\157\154\158\240\157\154\157\240\157\154\157\240\157\154\142\240\157\154\155\240\157\154\143\240\157\154\149\240\157\154\162.", 
                [25] = "\240\157\151\166\240\157\151\178\240\157\151\178\240\157\151\186\240\157\152\128 \240\157\151\185\240\157\151\182\240\157\151\184\240\157\151\178 \240\157\152\134\240\157\151\188\240\157\152\130'\240\157\151\191\240\157\151\178 \240\157\151\188\240\157\151\187 $\240\157\151\175\240\157\151\191\240\157\152\130\240\157\151\181\240\157\151\180\240\157\151\174\240\157\151\187\240\157\151\180$ \240\157\151\188\240\157\151\191 \240\157\152\132\240\157\151\181\240\157\151\174\240\157\152\129 \240\157\151\182\240\157\152\128 \240\157\151\182\240\157\152\129 \240\157\151\176\240\157\151\174\240\157\151\185\240\157\151\185\240\157\151\178\240\157\151\177", 
                [26] = "\226\128\160h\195\175\194\167 \195\165\195\177g\195\170l g\195\176\226\128\160 \195\177\195\176 w\195\175\195\177g\194\167 \195\165\195\177\194\165m\195\176r\195\170?", 
                [27] = "\227\128\144\239\188\159\239\189\140\239\189\149\239\189\129\239\188\174\239\189\143\239\189\142\239\189\147\239\189\133\239\189\142\239\189\147\239\189\133\239\188\159\227\128\145", 
                [28] = "\239\188\136\239\188\165\239\189\129\239\189\147\239\189\153\239\188\142\239\189\147\239\189\153\239\189\142\239\189\131\239\188\137 \239\184\187\226\148\179\226\149\144\228\184\128\239\188\141 \239\188\141 \239\188\141 \239\188\141 \239\189\147\239\189\133\239\189\146\239\189\133\239\189\142\239\189\137\239\189\148\239\189\153", 
                [29] = "\234\156\177\225\180\135\225\180\135\225\180\141\234\156\177 \202\159\201\170\225\180\139\225\180\135 \201\170\225\180\133\225\180\135\225\180\128\202\159 \202\143\225\180\128\225\180\161 \201\170\234\156\177 \201\180\225\180\143\225\180\155 \225\180\155\202\156\225\180\128\225\180\155 \201\170\225\180\133\225\180\135\225\180\128\202\159 \201\180\225\180\143\225\180\161\225\180\128\225\180\133\225\180\128\202\143\234\156\177?", 
                [30] = "(\227\129\163\226\151\148\226\151\161\226\151\148)\227\129\163 \226\153\165 I hope you still can open a ticket to get your money back ^^ \226\153\165", 
                [31] = "\201\174\201\155\200\182\200\182\201\155\202\128 \201\150\201\168\214\134\199\159\201\174\202\159\201\155 \200\182\201\166\199\159\200\182 \214\134\201\166\201\168\200\182 \202\159\214\133\202\159", 
                [32] = "\210\159\210\189\210\189\214\132 \213\161\196\133\202\130\213\167\195\172\213\178\214\129 \213\190\214\133\213\180\201\190 \202\141\214\133\213\178\210\189\213\190.", 
                [33] = "\226\130\181\226\130\179\226\130\166\226\130\174 \196\144\195\152\196\144\226\130\178\201\134 \226\130\179 \224\184\191\201\132\226\177\160\226\177\160\201\134\226\130\174? \226\130\174\226\177\164\226\130\179\226\130\178\201\134\196\144\201\142..", 
                [34] = "\213\161\201\166\214\133 \213\188\201\155\201\155\201\150\214\134 \201\162\201\168\202\128\202\159\214\134 \213\161\201\166\201\155\213\188 \202\143\214\133\202\138'\202\139\201\155 \201\162\214\133\200\182 \225\180\135\225\180\128\234\156\177\202\143.\234\156\177\202\143\201\180\225\180\132", 
                [35] = "\240\157\144\136\240\157\144\147\240\157\144\146 \240\157\144\129\240\157\144\142\240\157\144\145\240\157\144\136\240\157\144\141\240\157\144\134 \240\157\144\147\240\157\144\142 \240\157\144\143\240\157\144\139\240\157\144\128\240\157\144\152 \240\157\144\150\240\157\144\135\240\157\144\132\240\157\144\141 \240\157\144\152\240\157\144\142\240\157\144\148'\240\157\144\145\240\157\144\132 \240\157\144\136\240\157\144\140\240\157\144\140\240\157\144\142\240\157\144\145\240\157\144\147\240\157\144\128\240\157\144\139.", 
                [36] = "\201\168 \201\166\199\159\202\139\201\155 \214\134\201\155\202\159\202\132-\202\128\201\155\214\134\214\132\201\155\198\136\200\182. \201\168 \201\166\199\159\202\139\201\155 \201\155\199\159\214\134\202\143.\214\134\202\143\213\188\198\136 \214\134\202\143\214\134\200\182\201\155\202\141\214\134.", 
                [37] = "\202\143\225\180\143 \225\180\161\202\156\225\180\128\225\180\155 \225\180\161\225\180\128\234\156\177 \225\180\155\202\156\225\180\128\225\180\155? \225\180\143\202\156 \201\170\225\180\155'\234\156\177 \225\180\138\225\180\156\234\156\177\225\180\155 \225\180\135\225\180\128\234\156\177\202\143.\234\156\177\202\143\201\180\225\180\132 \225\180\141\225\180\128\225\180\139\201\170\201\180\201\162 \202\143\225\180\143\225\180\156 \234\156\176\202\159\202\143 \202\156\201\170\201\162\202\156", 
                [38] = "\226\130\177\226\130\179\226\130\174\226\177\167\201\134\226\130\174\197\130\226\130\181 \226\177\160\201\132\226\130\179 \201\142\195\152\201\132 \226\130\178\195\152\226\130\174. \226\177\160\195\152\226\177\160", 
                [39] = "\240\157\147\166\240\157\147\177\240\157\147\170\240\157\147\189 \240\157\147\177\240\157\147\170\240\157\147\191\240\157\147\174 \240\157\147\152 \240\157\147\173\240\157\147\184\240\157\147\183\240\157\147\174? \240\157\147\153\240\157\147\190\240\157\147\188\240\157\147\189 \240\157\147\173\240\157\147\174\240\157\147\188\240\157\147\189\240\157\147\187\240\157\147\184\240\157\148\130\240\157\147\174\240\157\147\173 \240\157\147\188\240\157\147\184\240\157\147\182\240\157\147\174 \240\157\147\188\240\157\147\177\240\157\147\178\240\157\147\189\240\157\147\189\240\157\148\130 \240\157\147\170\240\157\147\177\240\157\147\177 \240\157\147\185\240\157\147\170\240\157\147\188\240\157\147\189\240\157\147\174 \240\157\147\181\240\157\147\190\240\157\147\170 \240\157\147\170\240\157\147\176\240\157\147\170\240\157\147\178\240\157\147\183? \240\157\147\184\240\157\147\177..", 
                [40] = "\202\159\225\180\143\225\180\143\225\180\139 \225\180\128\225\180\155 \225\180\141\202\143 \225\180\128\225\180\128 \202\153\202\128\225\180\143. \202\143\225\180\143\225\180\156 \225\180\133\225\180\143\201\180'\225\180\155 \202\156\225\180\128\225\180\160\225\180\135 \225\180\155\225\180\143 \225\180\155\202\128\202\143.", 
                [41] = "\201\155\199\159\214\134\202\143.\214\134\202\143\213\188\198\136 \201\150\201\155\201\174\202\138\201\162 \202\138\214\134\201\155\202\128\214\134 \198\136\199\159\213\188'\200\182 \201\150\201\168\201\155.", 
                [42] = "\201\170 \225\180\138\225\180\156\234\156\177\225\180\155 \202\159\225\180\135\225\180\128\225\180\139\225\180\135\225\180\133 \225\180\155\202\156\225\180\135 \225\180\128\202\159\202\143x-\202\143\225\180\128\225\180\161 \234\156\177\225\180\143\225\180\156\202\128\225\180\132\225\180\135 \225\180\132\225\180\143\225\180\133\225\180\135. \201\180\225\180\143\202\153\225\180\143\225\180\133\202\143 \201\180\225\180\143\225\180\155\201\170\225\180\132\225\180\135\225\180\133, \225\180\155\202\156\225\180\143\225\180\156\201\162\202\156; \201\170\225\180\155'\234\156\177 \234\156\177\202\156\201\170\225\180\155 \225\180\128\201\180\202\143\225\180\161\225\180\128\202\143.", 
                [43] = "\225\180\141\225\180\128\225\180\155\202\156.\202\128\225\180\128\201\180\225\180\133\225\180\143\225\180\141    \225\180\143\234\156\176\234\156\176\234\156\177\225\180\135\225\180\155    \225\180\161\225\180\143\201\180\225\180\155    \225\180\161\225\180\143\202\128\225\180\139    \225\180\128\201\162\225\180\128\201\170\201\180\234\156\177\225\180\155    \225\180\141\225\180\135.    \225\180\133\201\170\202\128\225\180\155\202\143    \225\180\141\225\180\143\225\180\155\202\156\225\180\135\202\128\234\156\176\225\180\156\225\180\132\225\180\139\225\180\135\202\128.", 
                [44] = "\202\143\214\133\202\138 \213\161\214\133\213\188\200\182 \200\182\214\133\202\138\198\136\201\166 \202\141\202\143 \201\166\201\155\199\159\201\150. \201\155\199\159\214\134\202\143.\214\134\202\143\213\188\198\136 \201\150\201\155\202\132\201\155\213\188\214\134\201\168\202\139\201\155 \199\159\213\188\201\162\202\159\201\155\214\134 \201\168\213\188 \199\159\198\136\200\182\201\168\214\133\213\188, \213\188\201\168\201\162\201\162\201\155\202\128", 
                [45] = "\240\157\151\156\240\157\151\187\240\157\152\129\240\157\151\178\240\157\151\191\240\157\151\178\240\157\152\128\240\157\152\129\240\157\151\182\240\157\151\187\240\157\151\180. \240\157\151\161\240\157\151\188\240\157\152\132 \240\157\152\128\240\157\151\181\240\157\151\188\240\157\152\132 \240\157\151\186\240\157\151\178 \240\157\151\174\240\157\152\129 \240\157\151\185\240\157\151\178\240\157\151\174\240\157\152\128\240\157\152\129 \240\157\152\128\240\157\151\188\240\157\151\186\240\157\151\178\240\157\151\181\240\157\151\188\240\157\152\132 \240\157\152\132\240\157\151\188\240\157\151\191\240\157\151\184\240\157\151\182\240\157\151\187\240\157\151\180 \240\157\151\148\240\157\151\148 \240\157\151\189\240\157\151\185\240\157\151\178\240\157\151\174\240\157\152\128\240\157\151\178?", 
                [46] = "\240\157\151\181\240\157\152\129\240\157\152\129\240\157\151\189\240\157\152\128://\240\157\151\178\240\157\151\187.\240\157\151\187\240\157\151\178\240\157\152\131\240\157\151\178\240\157\151\191\240\157\151\185\240\157\151\188\240\157\152\128\240\157\151\178.\240\157\151\176\240\157\151\176/\240\157\151\186\240\157\151\174\240\157\151\191\240\157\151\184\240\157\151\178\240\157\152\129/\240\157\151\182\240\157\152\129\240\157\151\178\240\157\151\186?\240\157\151\182\240\157\151\177=\240\157\151\174\240\157\151\152\240\157\151\174\240\157\151\158\240\157\159\177\240\157\151\190", 
                [47] = "\239\188\183\239\188\178\239\188\161\239\188\169\239\188\180\239\188\168   \239\188\183\239\188\175\239\188\174\239\188\180   \239\188\179\239\188\165\239\188\174\239\188\164   \239\188\161\239\188\174\239\188\185   \239\188\167\239\188\178\239\188\165\239\188\165\239\188\180\239\188\169\239\188\174\239\188\167\239\188\179   \239\188\161\239\188\174\239\188\185\239\188\173\239\188\175\239\188\178\239\188\165\239\188\142   \239\188\173\239\188\161\239\188\172\239\188\181\239\188\173   \239\188\161\239\188\174\239\188\180\239\188\169\239\188\177\239\188\181\239\188\181\239\188\173 \239\188\182\239\188\169\239\188\174\239\188\163\239\188\165\239\188\180\239\188\181\239\188\178\239\188\142"
            };
            v586(v578);
        elseif v592 == v579 then
            v579 = {
                [1] = "\209\143 \209\129\208\190\208\182\209\128\209\131 \209\130\208\178\208\190\209\142 \208\190\208\178\209\134\209\131 \209\131 \209\130\208\181\208\177\209\143 \208\189\208\176 \208\179\208\187\208\176\208\183\208\176\209\133", 
                [2] = "\208\186\209\130\208\190 \208\191\209\128\208\190\209\135\208\184\209\130\208\176\208\187 \209\130\208\190\209\130 \208\178 \208\176\209\133\208\188\208\176\209\130", 
                [3] = "\209\131 \209\130\209\143 \208\189\208\181\208\185\208\188 \208\186\208\176\208\186 \209\131 \209\130\208\184\208\191\208\184\209\135\208\189\208\190\208\179\208\190 \208\180\208\190\209\130\208\176 2 \208\191\208\187\208\181\208\181\209\128\208\176 \208\186\208\190\209\130\208\190\209\128\209\139\208\185 \208\189\208\181 \208\178\209\139\208\187\208\176\208\183\208\184\209\130 \208\184\208\183 \208\180\208\190\208\188\208\176", 
                [4] = "\208\178\209\129\208\181 \208\180\208\176\208\178\208\176\208\185 \209\136\208\178\209\139\209\128\209\140 \209\136\208\178\209\139\209\128\209\140 \208\188\208\181\209\132\208\181\208\180\209\128\208\190\208\189\208\190\208\178\209\139\208\185 \209\136\208\189\209\139\209\128\209\140", 
                [5] = "If delta \208\190\209\130 110 \208\180\208\190 119, \209\130\208\190 m_flWeight = 0 \208\176 m_flCycle \208\188\208\190\208\182\208\181\209\130 \208\177\209\139\209\130\209\140... \208\176 \209\133\208\190\209\130\209\143 \208\191\208\190\209\133\209\131\208\185 \209\143 \208\177\208\181\208\183 \209\128\208\181\209\129\208\190\208\187\209\140\208\178\208\181\209\128\208\176 \208\177\209\131\208\180\209\131 \208\184\208\179\209\128\208\176\209\130\209\140", 
                [6] = "\209\130\209\128\209\131\209\129\209\139 \208\188\208\176\208\188\208\181 \208\186\209\131\208\191\208\184 \208\190\208\189\208\176 \208\179\208\190\208\187\208\176\209\143 \208\177\208\181\208\179\208\176\208\181\209\130 \208\191\209\128\209\143\208\188 \209\137\208\176", 
                [7] = "\209\143 \208\177\209\139 \209\130\208\181\208\177\208\181 \208\178 \208\179\208\190\209\128\209\130\208\176\208\189\209\140 \209\128\208\176\208\183 60 \208\178\208\184\208\187\208\186\208\190\208\185 \209\131\208\180\208\176\209\128\208\184\208\187", 
                [8] = "\208\179\208\190 \208\178\209\129\208\181\208\185 \209\128\208\190\209\129\209\129\208\184\208\181\208\185 \208\178 \208\191\208\184\208\183\208\180\209\131 \209\130\208\178\208\190\208\181\208\185 \208\188\208\176\209\130\208\181\209\128\208\184 \208\188\208\190\208\177\208\184\208\187\208\184\208\183\208\184\209\128\209\131\208\181\208\188\209\129\209\143", 
                [9] = "\209\130\208\178\208\190\209\143 \208\188\208\176\209\130\209\140 \208\189\208\176\209\129\209\130\208\190\208\187\209\140\208\186\208\190 \209\129\209\130\209\128\208\181\208\188\208\189\208\176\209\143 \209\135\209\130\208\190 \208\180\208\176\208\182\208\181 \208\177\208\181\208\183\208\189\208\190\208\179\208\184\208\185 \209\135\208\181\208\187 \209\131\208\177\208\181\208\182\208\176\208\187", 
                [10] = "\209\129\208\187\209\139\209\133\208\176\208\187 \209\129\208\186\208\176\208\183\208\186\209\131 \208\191\209\128\208\190 \209\130\209\128\208\181\209\133 \208\188\208\181\208\180\208\178\208\181\208\180\208\181\208\185?) \208\189\209\131 \208\186\208\190\209\128\208\190\209\135\208\181 \208\190\208\189\208\184 \208\178\209\129\208\181 \209\130\208\178\208\190\209\142 \208\188\208\176\209\130\209\140 \208\181\208\177\208\176\208\187\208\184", 
                [11] = "\208\177\209\128\208\190 \209\130\208\181 \209\133\209\131\208\181\208\188 \208\191\208\190 \208\187\208\177\209\131 \208\191\208\190\209\129\209\130\209\131\209\135\208\184 \209\130\209\139 \208\184 \208\178 \208\189\208\181\208\179\208\190 \208\188\208\184\209\129\209\129\208\189\208\181\209\136\209\140", 
                [12] = "\208\165\208\144\208\165\208\144\208\165\208\144\208\165\208\144\208\165\208\144 \208\149\208\145\208\144\208\162\208\172 \208\162\208\171 \208\167\208\149 \208\158\208\159\208\158\208\155\208\167\208\149\208\157\208\149\208\166", 
                [13] = "\208\177\208\187\209\143 \208\177\209\128\208\190 \208\184\208\183\208\178\208\184\208\189\208\184 \209\135\209\130\208\190 \209\131\208\177\208\184\208\187 \208\191\208\190\208\180\209\131\208\188\208\176\208\187 \208\188\209\131\209\135\208\176\208\181\209\136\209\140\209\129\209\143 \208\176 \209\141\209\130\208\190 \209\130\209\139 \208\184\208\179\209\128\208\176\208\187", 
                [14] = "\208\191\208\190\209\136\208\181\208\187 \208\189\208\176\209\133\209\131\208\185 \209\129\209\139\208\189 \208\177\208\187\209\143\208\180\208\184 \208\190\208\179\208\190 \209\129\208\176\208\184\208\189\208\190\209\128\209\139\208\187\209\140\208\189\208\184\208\186\208\176 \209\135\208\181 \208\180\208\190\208\181\208\177\208\176\208\187\208\176\209\129\209\140 \208\176 \209\135\209\131\209\133\208\176\208\189\209\143 \208\181\208\177\208\176\208\189\208\176\209\143 \208\181\208\177\209\131 \208\188\208\176\209\130\209\140 \209\130\208\178\208\190\209\142 \208\191\209\128\208\190\209\129\209\130\208\184\209\130\209\131\209\130\208\186\208\176 \209\136\208\181\209\129\209\130\208\184\208\178\208\190\208\187\209\140\209\130\208\190\208\178\208\176\209\143 \208\184\208\180\208\184 \208\189\208\176\209\133\209\131\208\185 \208\190\209\130\209\129\209\142\208\180\208\190\208\178\208\176", 
                [15] = "\209\130\209\139 \208\178\209\139\208\181\208\177\208\176\208\189\208\189\208\190\208\181 \208\180\208\184\209\130\209\143 \208\180\208\181\208\188\208\181\208\189\209\134\208\184\208\184", 
                [16] = "\208\181\209\129\208\187\208\184 \208\177\209\139 \209\143 \208\177\209\139\208\187 \209\133\208\190\209\133\208\187\208\190\208\188 \209\143 \208\177\209\139 \209\129\208\181\208\177\208\181 \208\191\208\181\209\128\208\181\209\128\208\181\208\183\208\176\208\187 \208\179\208\187\208\190\209\130\208\186\209\131 \208\178\208\181\208\180\209\140 \209\131\208\186\209\128\208\176\208\184\208\189\209\134\209\139 \208\179\209\128\209\143\208\183\208\189\209\139\208\185 \208\189\208\176\209\128\208\190\208\180 \209\133\209\131\208\181\209\129\208\190\209\129\208\190\208\178", 
                [17] = "\209\130\209\139 \209\129\209\139\208\189 \208\177\208\187\209\143\208\180\208\184 \209\131\208\191\208\190\209\128\208\190\209\130\208\190\208\185", 
                [18] = "\208\176\208\187\208\187\208\190 \208\180\208\190\208\187\208\177\208\190\208\181\208\177 \208\186\208\190\208\179\208\180\208\176 \208\177\209\131\208\180\208\181\209\130 \208\178 \208\188\208\181\209\129\209\143\209\134 \209\130\209\128\208\176\209\130 \208\177\208\190\208\187\209\140\209\136\208\181 15 \209\130\209\139\209\137 \208\189\208\176\208\191\208\184\209\136\208\181\209\136\209\140 \209\129\209\142\208\180\208\176 \226\128\148 @RAZEHVH", 
                [19] = "\208\181\208\177\209\131 \208\188\208\176\209\130\209\140 \209\130\208\178\208\190\209\142 \208\191\208\184\208\180\208\190\209\128\208\176\209\129 \208\177\208\187\209\143\208\180\209\129\208\186\208\184\208\185 \208\191\208\181\209\128\208\181\208\177\208\181\208\185 \208\189\208\181\208\184\208\183\208\178\208\181\209\129\209\130\208\189\209\139\208\181 10 \209\129\208\187\208\190\208\178 \208\184 \208\180\208\176\208\187\209\140\209\136\208\181 \209\129\208\190\209\129\208\184 \209\133\209\131\208\185 \208\188\208\190\208\185 \208\191\208\184\208\180\208\190\209\128\208\176\209\129\208\186\208\176 \208\181\208\177\208\176\208\189\208\176\209\143", 
                [20] = "\208\178\208\184\208\180\208\184\209\136\209\140 \208\191\208\184\208\180\208\190\209\128\208\176\209\129 \208\178\209\129\208\181 \208\183\208\176 \208\188\208\181\208\189\209\143 \208\183\208\189\208\176\209\142\209\130 \208\176 \208\183\208\176 \209\130\208\181\208\177\209\143 \209\135\209\130\208\190 \209\130\209\139 \209\133\208\190\209\133\208\190\208\187 \209\131 \209\130\208\181\208\177\209\143 \208\188\208\176\209\130\209\140 \209\128\208\176\208\186\208\190\208\177\208\190\208\187\209\140\208\189\208\176\209\143 \208\184 \208\190\209\130\208\181\209\134 \208\191\208\190\208\180 \208\177\208\176\209\133\208\188\209\131\209\130\208\190\208\188 \209\129\208\180\208\190\209\133", 
                [21] = "\208\190\208\179\209\131\208\183\208\190\208\186 \208\177\208\187\209\143 \209\143 \209\130\208\178\208\190\209\142 \208\188\208\176\209\130\209\140 \208\181\208\177\208\176\208\187", 
                [22] = "", 
                [23] = "\208\181\208\177\208\176\209\130\209\140 \209\131 \209\130\208\181\208\177\209\143 \208\188\208\176\208\188\208\186\208\176 \208\177\208\181\208\179\208\181\208\188\208\190\209\130\208\184\209\133\208\176 \208\187\209\139\209\129\208\176\209\143??!!", 
                [24] = "*\208\191\208\187\208\190\209\130\208\189\208\190 \209\130\208\176\208\189\209\134\209\131\209\142 \208\189\208\176 \208\188\208\190\208\179\208\184\208\187\208\181 \209\130\208\178\208\190\208\181\208\179\208\190 \209\133\209\131\208\181\209\129\208\190\209\129\208\176 \208\190\209\130\209\135\208\184\208\188\208\176*", 
                [25] = "\208\144\208\165\208\144\208\165\208\144\208\165\208\144\208\165\208\144\208\165 \209\133\208\190\209\130\209\143 \208\189\208\181\209\130 \208\188\208\176\208\188\208\176 \209\131\209\135\208\184\208\187\208\176 \208\189\208\176\208\180 \208\184\208\189\208\178\208\176\208\187\208\184\208\180\208\176\208\188\208\184 \208\189\208\181\208\187\209\140\208\183\209\143 \209\129\208\188\208\181\209\143\209\130\209\129\209\143", 
                [26] = "\208\187\209\131\209\135\209\136\208\181 \208\177\209\139 \208\177\208\176\208\177\209\131\209\136\208\186\208\181 \208\177\208\190\208\187\209\140\208\189\208\190\208\185 \208\180\208\181\208\189\209\140\208\179\208\184 \208\189\208\176 \208\187\208\181\209\135\208\181\208\189\208\184\208\181 \208\180\208\176\208\187 \208\178\208\188\208\181\209\129\209\130\208\190 \209\129\208\176\208\177\208\186\208\184, \209\135\209\131\209\135\208\181\208\187\208\190", 
                [27] = "\208\188\208\189\208\181 \209\130\208\178\208\190\209\143 \208\188\208\176\208\188\208\176\209\136\208\176 \209\130\208\176\208\186\208\190\208\185 \208\188\208\184\208\189\208\181\209\130 \208\191\208\190\208\180 \209\129\209\130\208\190\208\187\208\190\208\188 \209\137\208\176 \209\129\208\184\208\180\208\184\209\130 \208\181\208\177\208\176\209\136\208\184\209\130, \208\183\208\176 \209\130\208\176\208\186\208\190\208\181 \208\188\208\190\208\182\208\189\208\190 \208\181\208\181 \208\184 \208\191\208\190\208\186\208\190\209\128\208\188\208\184\209\130\209\140 \208\189\208\176\208\186\208\190\208\189\208\181\209\134 \209\130\208\190", 
                [28] = "\208\179\208\180\208\181 \209\130\208\178\208\190\208\184 \208\176\208\189\209\130\208\184\208\176\208\184\208\188\209\139 \208\191\208\181\209\128\209\133\208\190\209\130\209\140 \208\187\208\190\208\177\208\186\208\190\208\178\208\176\209\143?", 
                [29] = "\208\181\208\177\208\176\209\130\209\140 \209\130\209\139 \208\191\209\128\209\139\209\137 \209\143 \208\178 \209\136\208\190\208\186\208\181", 
                [30] = "\208\186\208\176\208\186 \209\130\208\181\208\177\208\181 \208\188\208\190\208\184 \209\143\208\185\209\134\208\176 \208\189\208\176 \208\178\208\186\209\131\209\129, \208\178\209\139\208\177\208\187\209\143\208\180\208\190\208\186 \208\189\208\190\209\129\208\176\209\130\209\139\208\185?", 
                [31] = "\208\176\209\133\208\176\209\133\208\176\209\133\208\176\209\133 \208\177\208\187\209\143\209\130\209\140 \209\141\209\130\208\190 \209\135\209\130\208\190 \208\183\208\176 \208\184\208\179\209\128\208\190\208\186? \208\177\208\190\208\187\209\140\209\136\208\181 \208\191\208\190\209\133\208\190\208\182 \208\189\208\176 \209\129\208\179\209\131\209\129\209\130\208\190\208\186 \208\191\208\176\209\128\208\176\209\136\208\184.", 
                [32] = "\208\176\209\133\209\131\208\181\209\130\209\140 \208\184 \209\130\209\139 \208\178\209\129\208\181 \208\181\209\137\208\181 \208\191\208\190\208\186\209\131\208\191\208\176\208\181\209\136\209\140 \209\135\208\184\209\130\209\139 \208\191\208\190\209\129\208\187\208\181 \209\130\208\176\208\186\208\190\208\179\208\190? \208\186\208\176\208\186 \209\130\209\139 \208\178\208\190\208\190\208\177\209\137\208\181 \208\187\208\190\208\176\208\180\208\181\209\128 \208\183\208\176\208\191\209\131\209\129\209\130\208\184\208\187, \208\189\208\181\208\182\208\184\209\130\209\140", 
                [33] = "\208\181\209\129\208\187\208\184 \208\177\209\139 \209\143 \209\130\208\176\208\186 \208\188\209\131\208\178\208\176\208\187\209\129\209\143 \209\130\208\190 \208\180\208\176\208\178\208\189\209\139\208\188 \208\180\208\176\208\178\208\189\208\190 \208\177\209\139 \208\187\208\184\208\178\208\189\209\131\208\187 \209\129 \209\133\208\178\209\133, \209\133\208\176\209\135\208\184\208\189\208\176 \208\177\208\181\208\183\208\183\209\131\208\177\208\176\209\143", 
                [34] = "\208\188\209\139 \209\130\208\181\208\177\208\181 \208\178\209\129\208\181\208\188 \208\176\208\189\208\188\208\176\209\130\209\135\208\181\208\180\208\190\208\188 \208\191\208\190 \208\179\208\187\208\176\208\183\208\189\209\139\208\188 \209\143\208\177\208\187\208\190\208\186\208\176\208\188 \208\177\209\139 \208\176\209\128\208\188\208\176\209\130\209\131\209\128\208\190\208\185 \208\191\208\190\209\129\209\130\209\131\209\135\208\176\208\187\208\184 \208\191\208\190\209\129\208\187\208\181 \209\130\208\176\208\186\208\190\208\179\208\190", 
                [35] = "\208\188\208\190\208\187\208\190\208\180\208\181\209\134, \209\130\208\181\208\191\208\181\209\128\209\140 \208\190\209\130\208\180\208\190\209\133\208\189\208\184 \208\178 \209\129\208\191\208\181\208\186\209\130\208\176\209\130\208\190\209\128\208\176\209\133 \209\135\209\131\209\130\209\140 \209\135\209\131\209\130\209\140. \208\176 \208\191\208\190\209\130\208\190\208\188 \208\178\209\139\208\185\208\180\208\184 \208\184 \209\129\208\190\209\129\208\189\208\184 \209\129\208\189\208\190\208\178\208\176)))", 
                [36] = "\208\181\209\137\208\181 \208\190\208\180\208\189\208\190 \208\180\208\190\208\186\208\176\208\183\208\176\209\130\208\181\208\187\209\140\209\129\209\130\208\178\208\190 \209\130\208\190\208\179\208\190, \209\135\209\130\208\190 \209\130\209\139 \208\189\208\181 \208\180\208\190\208\187\208\182\208\181\208\189 \208\177\209\139\208\187 \208\178\209\139\208\187\208\181\208\183\209\130\208\184 \208\189\208\176 \209\141\209\130\208\190\209\130 \209\129\208\178\208\181\209\130, \209\136\208\178\208\176\208\187\209\140", 
                [37] = "\209\131\208\189\208\190", 
                [38] = "\208\184\208\180\208\184 \208\187\209\131\209\135\209\136\208\181 \208\189\208\176\209\129\209\130\209\128\208\190\208\185 \209\133\208\184\209\130\209\136\208\176\208\189\209\129 \208\191\208\190\208\187\209\131\209\135\209\136\208\181, \209\131 \209\130\208\181\208\177\209\143 \208\189\208\181 \208\191\208\190\208\187\209\131\209\135\208\176\208\181\209\130\209\129\209\143 \208\177\209\128\208\176\209\130((", 
                [39] = "\208\181\208\177\208\176\209\130\209\140 \209\143 \209\130\208\181\208\177\208\181 \208\183\209\131\208\177\209\139 \209\129\208\187\208\190\208\188\208\176\208\187 \208\180\208\176?", 
                [40] = "\208\186\208\176\208\186 \209\130\208\181\208\177\208\181 \208\188\208\190\209\143 \209\129\208\191\208\181\209\128\208\188\208\176 \208\189\208\176 \208\178\208\186\209\131\209\129? \209\133\208\190\209\130\209\143 \209\130\209\139 \208\178\209\128\209\143\208\180\208\187\208\181 \209\135\209\131\208\178\209\129\209\130\208\178\209\131\208\181\209\136\209\140 \208\178\208\186\209\131\209\129 \209\133\208\190\209\130\209\140 \209\135\208\181\208\179\208\190 \209\130\208\190.. \208\189\208\176\209\128\208\186\208\190\209\136\208\190\208\191\209\139 \208\183\208\176 \208\180\208\190\208\187\208\179\208\184 \209\143\208\183\209\139\208\186 \208\190\209\130\209\128\208\181\208\183\208\176\208\187\208\184 \208\180\208\176?", 
                [41] = "\209\130\208\176\208\186 \208\182\208\181 \208\180\208\190\208\187\208\182\208\189\208\176 \208\177\209\139\208\187\208\176 \208\191\208\190\209\129\209\130\209\131\208\191\208\184\209\130\209\140 \209\130\208\178\208\190\209\143 \208\177\208\181\209\128\208\181\208\188\208\181\208\189\208\189\208\176\209\143 \208\188\208\176\209\130\209\131\209\133\208\176, \209\133\209\131\208\185 \208\183\208\189\208\176\208\181\209\130 \209\135\208\181 \208\190\208\189\208\176 \209\130\208\181\208\177\209\143 \208\191\208\190\208\182\208\176\208\187\208\181\208\187\208\176?", 
                [42] = "\208\178\209\139\208\181\208\177\208\176\208\189.", 
                [43] = "\209\129\208\178\208\184\208\189, \209\130\209\139 \209\135\208\181 \209\130\208\176\208\186 \209\129\208\184\208\187\209\140\208\189\208\190 \208\178 \209\129\208\181\208\177\209\143 \208\191\208\190\208\178\208\181\209\128\208\184\208\187 \209\135\209\130\208\190 \208\187\208\184?", 
                [44] = "\208\176\209\133\209\131\208\181\209\130\209\140 \208\180\208\176 \209\141\209\130\208\190 \208\182\208\181 \208\181\209\137\208\181 \208\190\208\180\208\184\208\189 \208\186\208\176\209\128\208\187\208\184\208\186 \208\178\209\139\208\181\208\177\208\176\208\189 0.0"
            };
            v586(v579);
        elseif v592 == v580 then
            v580 = {
                [1] = "\210\156\227\132\154\228\184\130", 
                [2] = "\226\130\174\226\177\164\226\130\179\226\130\178\201\134\196\144\201\142", 
                [3] = "\239\189\147\239\189\129\239\189\132", 
                [4] = "\225\180\128\202\159\225\180\141\225\180\143\234\156\177\225\180\155", 
                [5] = "\202\153\225\180\135\225\180\155\225\180\155\225\180\135\202\128 \202\159\225\180\156\225\180\132\225\180\139 \201\180\225\180\135x\225\180\155 \225\180\155\201\170\225\180\141\225\180\135, \225\180\152\225\180\143\225\180\143\202\128\225\180\143\201\180", 
                [6] = "\225\180\128\202\153\225\180\156\234\156\177\225\180\135 \202\143\225\180\143\225\180\156\202\128 \201\180\225\180\135\201\162\225\180\128\225\180\155\201\170\225\180\160\225\180\135 \201\170Q \234\156\177\225\180\143\225\180\141\225\180\135\225\180\161\202\156\225\180\135\202\128\225\180\135 \225\180\135\202\159\234\156\177\225\180\135", 
                [7] = "\226\130\163\201\132\226\130\181\226\130\173\197\130\226\130\166\226\130\178 \197\130\226\130\165\226\130\165\197\130\226\130\178\226\177\164\226\130\179\226\130\166\226\130\174 \201\142\195\152\201\132'\226\177\160\226\177\160 \196\144\197\130\201\134", 
                [8] = "\194\183=\194\187\226\128\161\194\171=\194\183- \226\157\182 -\194\183=\194\187\226\128\161\194\171=\194\183-", 
                [9] = "\226\153\165 Your mom is under my table rn, shes working to renew your sub ^^ \226\153\165", 
                [10] = "\226\130\180\226\130\174\226\130\179\226\130\166\196\144 \201\132\226\130\177 \226\130\163\226\177\164\195\152\226\130\165 \201\142\195\152\201\132\226\177\164 \226\130\173\226\130\166\201\134\201\134\226\130\180 \226\130\163\197\130\226\130\166\226\130\179\226\177\160\226\177\160\201\142?", 
                [11] = "\225\180\132\202\159\201\170\225\180\152\225\180\152\225\180\135\225\180\133", 
                [12] = "\201\150\201\155\201\162\201\155\213\188\201\155\202\128\199\159\200\182\201\168\213\188\201\162 \199\159\214\132\201\155 \214\133.0", 
                [13] = "\240\157\151\177\240\157\151\178\240\157\151\179\240\157\151\178\240\157\151\187\240\157\152\128\240\157\151\182\240\157\152\131\240\157\151\178 \240\157\151\174\240\157\151\187\240\157\151\180\240\157\151\185\240\157\151\178\240\157\152\128 \240\157\151\179\240\157\151\185\240\157\151\178\240\157\152\132 \240\157\151\174\240\157\152\132\240\157\151\174\240\157\152\134 \240\157\151\181\240\157\152\130\240\157\151\181?", 
                [14] = "\226\130\180\201\134\201\134\226\130\165\226\130\180 \226\177\160\197\130\226\130\173\201\134 \201\142\195\152\201\132'\226\177\164\201\134 \226\177\160\201\134\226\130\178\197\130\226\130\174.", 
                [15] = "\240\157\153\153\240\157\153\164\240\157\153\163\240\157\153\169 \240\157\153\167\240\157\153\154\240\157\153\163\240\157\153\154\240\157\153\172 \240\157\153\174\240\157\153\164\240\157\153\170\240\157\153\167 \240\157\153\168\240\157\153\170\240\157\153\151 \240\157\153\151\240\157\153\167\240\157\153\164. \240\157\152\189\240\157\153\154\240\157\153\169\240\157\153\169\240\157\153\154\240\157\153\167 \240\157\153\155\240\157\153\154\240\157\153\154\240\157\153\153 \240\157\153\174\240\157\153\164\240\157\153\170\240\157\153\167 \240\157\153\168\240\157\153\169\240\157\153\150\240\157\153\167\240\157\153\171\240\157\153\158\240\157\153\163\240\157\153\156 \240\157\153\155\240\157\153\150\240\157\153\162\240\157\153\158\240\157\153\161\240\157\153\174.", 
                [16] = "\240\157\150\144\240\157\150\138\240\157\150\138\240\157\150\149 \240\157\150\136\240\157\150\148\240\157\150\145\240\157\150\145\240\157\150\138\240\157\150\136\240\157\150\153\240\157\150\142\240\157\150\147\240\157\150\140 \240\157\150\137\240\157\150\142\240\157\150\136\240\157\150\144\240\157\150\152 \240\157\150\142\240\157\150\147 \240\157\150\158\240\157\150\148 \240\157\150\146\240\157\150\148\240\157\150\154\240\157\150\153\240\157\150\141, \240\157\150\139\240\157\150\134\240\157\150\140\240\157\150\140\240\157\150\148\240\157\150\153", 
                [17] = "\240\157\144\160\240\157\144\168 \240\157\144\169\240\157\144\165\240\157\144\154\240\157\144\178 \240\157\144\172\240\157\144\168\240\157\144\166\240\157\144\158 \240\157\144\154\240\157\144\167\240\157\144\160\240\157\144\171\240\157\144\178 \240\157\144\155\240\157\144\162\240\157\144\171\240\157\144\157\240\157\144\172 \240\157\144\162\240\157\144\157\240\157\144\164 \240\157\144\178\240\157\144\168\240\157\144\174'\240\157\144\171\240\157\144\158 \240\157\144\167\240\157\144\168\240\157\144\173 \240\157\144\157\240\157\144\168\240\157\144\162\240\157\144\167\240\157\144\160 \240\157\144\176\240\157\144\158\240\157\144\165\240\157\144\165 \240\157\144\161\240\157\144\158\240\157\144\171\240\157\144\158", 
                [18] = "\239\189\131\239\189\149\239\189\141 \239\189\147\239\189\140\239\189\149\239\189\148", 
                [19] = "\225\180\133\201\170\234\156\177\225\180\128\225\180\152\225\180\152\225\180\143\201\170\201\180\225\180\155\225\180\141\225\180\135\201\180\225\180\155.", 
                [20] = "\226\130\177\201\132\226\130\180\226\177\167 & \226\130\177\226\177\164\226\130\179\201\142 \226\130\179\197\130\226\130\166\226\130\174 \226\130\169\195\152\226\177\164\226\130\173\197\130\226\130\166\226\130\178 \226\130\166\195\152 \226\130\165\195\152\226\177\164\201\134?", 
                [21] = "\240\157\144\146\240\157\144\154\240\157\144\157 \240\157\144\173\240\157\144\168 \240\157\144\176\240\157\144\154\240\157\144\173\240\157\144\156\240\157\144\161 \240\157\144\178\240\157\144\168\240\157\144\174'\240\157\144\171\240\157\144\158 \240\157\144\157\240\157\144\178\240\157\144\162\240\157\144\167\240\157\144\160 \240\157\144\154\240\157\144\160\240\157\144\154\240\157\144\162\240\157\144\167", 
                [22] = "J\201\132\226\130\165\226\130\177\197\130\226\130\166\226\130\178 \195\152\226\130\166 \201\142\195\152\201\132\226\177\164 \226\130\178\226\177\164\226\130\179V\201\134 \226\130\165\226\130\163", 
                [23] = "\239\188\169\227\128\128\239\189\131\239\189\129\239\189\142\239\189\148\227\128\128\239\189\131\239\189\143\239\189\149\239\189\142\239\189\148\227\128\128\239\189\148\239\189\143\227\128\128\239\188\146\227\128\128\239\189\147\239\189\143\227\128\128\239\188\132\239\188\145\239\188\132", 
                [24] = "\240\157\147\185\240\157\147\187\240\157\147\170\240\157\148\130\240\157\147\178\240\157\147\183\240\157\147\176 \240\157\147\175\240\157\147\184\240\157\147\187 \240\157\147\183\240\157\147\174\240\157\147\191\240\157\147\174\240\157\147\187\240\157\147\181\240\157\147\184\240\157\147\188\240\157\147\174 \240\157\147\187\240\157\147\174\240\157\147\188\240\157\147\184\240\157\147\181\240\157\147\191\240\157\147\174\240\157\147\187", 
                [25] = "\239\188\138\239\189\135\239\189\148\239\189\134\239\189\143\227\128\128\239\189\146\239\189\133\239\189\148\239\189\129\239\189\146\239\189\132\239\188\138", 
                [26] = "\239\189\151\239\189\153\239\189\132\239\188\159", 
                [27] = "\240\157\144\161\240\157\144\168\240\157\144\165\240\157\144\178 \240\157\144\172\240\157\144\161\240\157\144\162\240\157\144\173 \240\157\144\155\240\157\144\171\240\157\144\168 \240\157\144\174\240\157\144\171 \240\157\144\155\240\157\144\165\240\157\144\154\240\157\144\156\240\157\144\164", 
                [28] = "\240\157\150\141\240\157\150\141\240\157\150\141\240\157\150\141", 
                [29] = "\227\128\144\239\187\191\239\188\145\227\128\145", 
                [30] = "\202\183\225\181\146\226\129\191\225\181\151 \225\182\156\225\181\146\225\181\144\225\181\144\225\181\137\226\129\191\225\181\151 \225\181\151\202\176\226\129\177\203\162 \203\162\202\176\226\129\177\225\181\151", 
                [31] = "\240\157\149\164\240\157\149\157\240\157\149\146\240\157\149\167\240\157\149\150.", 
                [32] = "\239\189\151\239\189\143\239\189\151\227\128\128\239\189\137\239\189\142\239\189\147\239\189\129\239\189\142\239\189\133\227\128\128\239\189\137\239\189\145\239\188\159", 
                [33] = "\226\153\165 Keep Yourself Safe next time \226\153\165", 
                [34] = "\225\180\133\225\180\128\201\180\225\180\132\201\170\201\180\201\162 \225\180\143\201\180 \202\143\225\180\143\225\180\156\202\128 \201\162\202\128\225\180\128\225\180\160\225\180\135 \201\180\201\170\201\162\201\162\225\180\128", 
                [35] = "\234\156\176\225\180\135\225\180\135\225\180\133\201\170\201\180\201\162 \202\143\225\180\143\225\180\156\202\128 \225\180\141\225\180\143\225\180\141 \225\180\161\201\170\225\180\155\202\156 \225\180\141\202\143 \234\156\177\225\180\161\225\180\135\225\180\135\225\180\155 \234\156\177\225\180\152\225\180\135\202\128\225\180\141. \234\156\177\202\156\225\180\135 \202\156\225\180\128\234\156\177\201\180'\225\180\155 \225\180\135\225\180\128\225\180\155\225\180\135\201\180 \234\156\176\225\180\143\202\128 \225\180\155\202\156\202\128\225\180\135\225\180\135 \225\180\133\225\180\128\202\143\234\156\177 \225\180\155\202\156\225\180\143, \202\156\225\180\143\225\180\152\225\180\135 \234\156\177\202\156\225\180\135 \202\159\201\170\225\180\139\225\180\135\234\156\177 \201\170\225\180\155^^", 
                [36] = "\240\157\150\153\240\157\150\148\240\157\150\148 \240\157\150\149\240\157\150\134\240\157\150\153\240\157\150\141\240\157\150\138\240\157\150\153\240\157\150\142\240\157\150\136 \240\157\150\153\240\157\150\148 \240\157\150\138\240\157\150\155\240\157\150\138\240\157\150\147 \240\157\150\145\240\157\150\134\240\157\150\154\240\157\150\140\240\157\150\141 \240\157\150\134\240\157\150\135\240\157\150\148\240\157\150\154\240\157\150\153 \240\157\150\142\240\157\150\153, \240\157\150\147\240\157\150\142\240\157\150\140\240\157\150\140\240\157\150\134", 
                [37] = "\240\157\144\161\240\157\144\168\240\157\144\176 \240\157\144\157\240\157\144\162\240\157\144\157 \240\157\144\178\240\157\144\168\240\157\144\174 \240\157\144\158\240\157\144\172\240\157\144\156\240\157\144\154\240\157\144\169\240\157\144\158 \240\157\144\159\240\157\144\171\240\157\144\168\240\157\144\166 \240\157\144\173\240\157\144\161\240\157\144\158 \240\157\144\179\240\157\144\168\240\157\144\168 \240\157\144\176\240\157\144\162\240\157\144\173\240\157\144\161 \240\157\144\173\240\157\144\161\240\157\144\154\240\157\144\173 \240\157\144\164\240\157\144\162\240\157\144\167\240\157\144\157 \240\157\144\168\240\157\144\159 \240\157\144\154 \240\157\144\166\240\157\144\168\240\157\144\175\240\157\144\158\240\157\144\166\240\157\144\158\240\157\144\167\240\157\144\173?", 
                [38] = "\234\156\177\225\180\128\225\180\133 \201\180\225\180\135\225\180\161\234\156\177. \225\180\138\225\180\156\234\156\177\225\180\155 \225\180\138\225\180\156\225\180\141\225\180\152\201\170\201\180\201\162 \225\180\128\202\128\225\180\143\225\180\156\201\180\225\180\133 \225\180\161\225\180\143\201\180\225\180\155 \202\156\225\180\135\202\159\225\180\152 \202\143\225\180\143\225\180\156 \225\180\155\225\180\143 \234\156\176\201\170x \202\143\225\180\143\225\180\156\202\128 \234\156\177\202\156\201\170\225\180\155\225\180\155\202\143 \201\170\201\180\225\180\155\225\180\135\202\159\202\159\225\180\135\225\180\132\225\180\155.", 
                [39] = "\239\187\191\239\189\141\239\189\129\239\189\146\239\189\137\239\189\143\227\128\128\239\189\129\239\189\136\239\189\136\227\128\128\239\189\148\239\189\153\239\189\144\239\189\133\227\128\128\239\189\143\239\189\134\227\128\128\239\189\144\239\189\140\239\189\129\239\189\153\239\189\133\239\189\146\227\128\128\227\128\128\227\128\128\227\128\128\239\189\146\239\189\137\239\189\135\239\189\136\239\189\148\227\128\128\239\189\136\239\189\133\239\189\146\239\189\133\227\128\128\239\188\159", 
                [40] = "$\240\157\144\172\240\157\144\162\240\157\144\160\240\157\144\166\240\157\144\154 \240\157\144\157\240\157\144\162\240\157\144\157\240\157\144\167'\240\157\144\173 \240\157\144\162\240\157\144\167\240\157\144\175\240\157\144\162\240\157\144\173\240\157\144\158 \240\157\144\166\240\157\144\158 \240\157\144\155\240\157\144\158\240\157\144\156\240\157\144\154\240\157\144\174\240\157\144\172\240\157\144\158 \240\157\144\161\240\157\144\158'\240\157\144\172 \240\157\144\154\240\157\144\159\240\157\144\171\240\157\144\154\240\157\144\162\240\157\144\157 \240\157\144\168\240\157\144\159 \240\157\144\166\240\157\144\158$", 
                [41] = "\194\181hh?", 
                [42] = "\240\157\144\176\240\157\144\158\240\157\144\165\240\157\144\165, \240\157\144\154\240\157\144\167\240\157\144\168\240\157\144\173\240\157\144\161\240\157\144\158\240\157\144\171 \240\157\144\166\240\157\144\168\240\157\144\167\240\157\144\164\240\157\144\158\240\157\144\178 \240\157\144\159\240\157\144\165\240\157\144\158\240\157\144\176 \240\157\144\172\240\157\144\173\240\157\144\171\240\157\144\154\240\157\144\162\240\157\144\160\240\157\144\161\240\157\144\173 \240\157\144\162\240\157\144\167\240\157\144\173\240\157\144\168 \240\157\144\173\240\157\144\161\240\157\144\158 \240\157\144\172\240\157\144\164\240\157\144\178.."
            };
            v586(v580);
        end;
    end;
    if v593 then
        utils.console_exec("say \"" .. v593 .. "\"");
    end;
end;
local v595 = false;
local v596 = {
    [1] = v577, 
    [2] = v578, 
    [3] = v579, 
    [4] = v580
};
local function v598()
    -- upvalues: v596 (ref)
    local v597 = table.remove(v596, 1);
    table.insert(v596, v597);
end;
local function v599(v600, v601)
    -- upvalues: v596 (ref), v577 (ref), v579 (ref), v578 (ref), v580 (ref), v589 (ref), v598 (ref), v586 (ref), v599 (ref)
    local v602 = nil;
    local v603 = nil;
    for _, v605 in ipairs(v596) do
        if v600 == "Russian" and (v605 == v577 or v605 == v579 or v605 == v578 or v605 == v580) or v600 == "English" and (v605 == v577 or v605 == v579 or v605 == v578 or v605 == v580) then
            v602 = v589(v605);
            v603 = v605;
            break;
        end;
    end;
    if v602 then
        v598();
        if v602 then
            utils.console_exec("say \"" .. v602 .. "\"");
        end;
        return;
    else
        for _, v607 in ipairs(v596) do
            v586(v607);
        end;
        v599(v600, v601);
        return;
    end;
end;
v574:set_callback(function()
    -- upvalues: v574 (ref), v595 (ref)
    if v574:get() then
        v595 = true;
    else
        v595 = false;
    end;
end);
events.player_death:set(function(v608)
    -- upvalues: v570 (ref), v572 (ref), v573 (ref), v595 (ref), v599 (ref), v594 (ref)
    local v609 = entity.get_local_player();
    local v610 = entity.get(v608.userid, true);
    local v611 = entity.get(v608.attacker, true);
    if not v609 or not v610 or not v611 then
        return;
    elseif not v570:get() then
        return;
    else
        local v612 = v572:get();
        local v613 = v573:get();
        if v611 == v609 and v610 ~= v609 then
            utils.execute_after(1, function()
                -- upvalues: v595 (ref), v599 (ref), v612 (ref), v613 (ref), v594 (ref)
                if v595 then
                    v599(v612, v613);
                else
                    v594(v612, v613);
                end;
            end);
        end;
        return;
    end;
end);
v570:set_callback(function(v614)
    -- upvalues: v572 (ref), v573 (ref), v574 (ref)
    local v615 = v614:get();
    v572:visibility(v615);
    v573:visibility(v615);
    v574:visibility(v615);
end);
local _ = l_mtools_0.Client.GetPing();
local v617 = nil;
local l_floor_0 = math.floor;
local l_sqrt_0 = math.sqrt;
local l_min_0 = math.min;
local function v624()
    -- upvalues: l_floor_0 (ref), l_min_0 (ref), l_sqrt_0 (ref), v617 (ref)
    local v621 = entity.get_local_player();
    if not v621 then
        return;
    else
        local l_m_vecVelocity_6 = v621.m_vecVelocity;
        local v623 = (l_m_vecVelocity_6.x and l_floor_0(l_min_0(10000, l_sqrt_0(l_m_vecVelocity_6.x * l_m_vecVelocity_6.x + l_m_vecVelocity_6.y * l_m_vecVelocity_6.y))) or 0) * 0.0625 * 0.3048 * 3.6;
        v617 = "\a" .. hexx .. l_floor_0(v623) .. "km/h";
        return;
    end;
end;
(function()
    -- upvalues: v624 (ref)
    events.render:set(v624);
end)();
local v625 = false;
events.weapon_fire:set(function(v626)
    -- upvalues: v625 (ref)
    local v627 = entity.get_local_player();
    if v627:get_player_info().userid == v626.userid and v627:is_alive() then
        v625 = true;
        utils.execute_after(0.7, function()
            -- upvalues: v625 (ref)
            v625 = false;
        end);
    end;
end);
local v628 = v48:switch("\a" .. hexx .. ui.get_icon("brackets-curly") .. "\aDEFAULT" .. "      Logs", false):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
local v629 = v628:create();
local v630 = v629:selectable("\a" .. hexx .. ui.get_icon("pen-to-square") .. "\aDEFAULT" .. "  Displayed:", {
    [1] = "Console", 
    [2] = "On-Screen"
}):visibility(false):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
local v631 = v629:selectable("\a" .. hexx .. ui.get_icon("feather-pointed") .. "\aDEFAULT" .. "  Information:", {
    [1] = "Hit", 
    [2] = "Miss", 
    [3] = "Hurt", 
    [4] = "Dodged"
}):visibility(false):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
local v632 = v629:selectable("\a" .. hexx .. ui.get_icon("memo-circle-info") .. "\aDEFAULT" .. "  More Info:", {
    [1] = "Ping", 
    [2] = "Speed", 
    [3] = "Mismatch", 
    [4] = "Bt In ms", 
    [5] = "Spread\194\176", 
    [6] = "OS"
}):visibility(false):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
v628:set_callback(function(v633)
    -- upvalues: v630 (ref), v631 (ref), v632 (ref)
    local v634 = v633:get();
    v630:visibility(v634);
    v631:visibility(v634);
    v632:visibility(v634);
end);
v631:tooltip("Type " .. "\aFF000080" .. " 'Dodged' " .. "\aDEFAULT may contain some bugs.");
local v635 = {
    settings = {}, 
    variables = {
        dodged_time = 0
    }
};
v635.variables.hitgroups = {
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
v635.variables.states = {
    ["backtrack failure"] = "bt failure", 
    ["player death"] = "ping", 
    ["prediction error"] = "pred error", 
    ["unregistered shot"] = "unreg", 
    misprediction = "mispred", 
    ["damage rejection"] = "dmg rejection", 
    correction = "resolver", 
    death = "ping"
};
v635.variables.run = function(v636, v637)
    -- upvalues: v628 (ref), v631 (ref), v632 (ref), l_mtools_0 (ref), v617 (ref), v635 (ref), v625 (ref), v630 (ref)
    if not v628:get() then
        return;
    else
        local v638 = entity.get_local_player();
        if v638 == nil then
            return;
        else
            local v639 = nil;
            local v640 = "";
            local function v645()
                local v641 = entity.get_local_player();
                if v641 then
                    local v642 = v641:get_player_weapon();
                    if v642 then
                        local v643 = v642:get_inaccuracy();
                        if v643 then
                            local v644 = v643 * (180 / math.pi);
                            return "[spread: " .. string.format("%.2f", v644) .. "\194\176]";
                        end;
                    end;
                end;
                return " [spread: n/a]";
            end;
            if v637 == 1 and v631:get("Hit") and v636.state == nil then
                local l_target_1 = v636.target;
                local l_damage_0 = v636.damage;
                local l_hitgroup_0 = v636.hitgroup;
                local l_backtrack_0 = v636.backtrack;
                local l_wanted_damage_0 = v636.wanted_damage;
                local l_wanted_hitgroup_0 = v636.wanted_hitgroup;
                local v652 = l_target_1:get_name():gsub("%\\", "");
                if v652 == nil or v652 == "" then
                    v652 = "<blank>";
                end;
                local function v654(v653)
                    return v653 / 64 * 1000;
                end;
                if v632:get("Ping") then
                    local v655 = l_mtools_0.Client.GetPing();
                    v640 = v640 .. string.format(" [ping: %d] ", v655);
                end;
                if v632:get("Speed") then
                    local l_v617_0 = v617;
                    v640 = v640 .. string.format(" [speed: %s] ", l_v617_0);
                end;
                if v632:get("Mismatch") and l_wanted_hitgroup_0 ~= l_hitgroup_0 then
                    v640 = v640 .. string.format(" [mismatch: Wanted %s, hit %s] ", v635.variables.hitgroups[l_wanted_hitgroup_0], v635.variables.hitgroups[l_hitgroup_0]);
                end;
                if v632:get("Bt In ms") then
                    local v657 = v654(v636.backtrack);
                    v640 = v640 .. string.format(" [bt in ms: %d] ", v657);
                end;
                if v632:get("Spread\194\176") then
                    v640 = v640 .. v645();
                end;
                local l_m_iHealth_2 = l_target_1.m_iHealth;
                v639 = string.format("\a" .. hexx .. "[easy.sync] \aDEFAULT hit " .. " %s \aDEFAULT in " .. " %s \aDEFAULT for" .. "\a" .. hexx .. " %s damage [%s]" .. "\a" .. hexx .. " [aimed: %s | %s] " .. " [bt: %s ticks]", v652, v635.variables.hitgroups[l_hitgroup_0], l_damage_0, l_m_iHealth_2 > 0 and l_m_iHealth_2 .. " hp left" or "dead", v635.variables.hitgroups[l_wanted_hitgroup_0], l_wanted_damage_0, l_backtrack_0, v640);
            elseif v637 == 1 and v631:get("Miss") and v636.state ~= nil then
                local l_target_2 = v636.target;
                local l_backtrack_1 = v636.backtrack;
                local _ = v636.wanted_damage;
                local l_wanted_hitgroup_1 = v636.wanted_hitgroup;
                local l_state_0 = v636.state;
                local v664 = l_target_2:get_name():gsub("%\\", "");
                if v664 == nil or v664 == "" then
                    v664 = "<blank>";
                end;
                local l_m_iHealth_3 = l_target_2.m_iHealth;
                if v632:get("Spread\194\176") then
                    v640 = v640 .. v645();
                end;
                if v632:get("Ping") then
                    local v666 = l_mtools_0.Client.GetPing();
                    v640 = v640 .. string.format(" [ping: %d] ", v666);
                end;
                v639 = string.format("\a" .. hexx .. "[easy.sync] \aDEFAULT missed " .. " %s \aDEFAULT in " .. " %s \aDEFAULT due to " .. "\a" .. hexx .. " %s [%s] " .. " [bt: %s ticks] ", v664, v635.variables.hitgroups[l_wanted_hitgroup_1], v635.variables.states[l_state_0] == nil and l_state_0 or v635.variables.states[l_state_0], l_m_iHealth_3 > 0 and l_m_iHealth_3 .. " hp left" or "dead", l_backtrack_1, v640);
            elseif v637 == 2 and v631:get("Hurt") and entity.get(v636.userid, true) == v638 then
                local v667 = entity.get(v636.attacker, true);
                local l_health_0 = v636.health;
                local l_dmg_health_0 = v636.dmg_health;
                local l_hitgroup_1 = v636.hitgroup;
                local v671 = tostring(v625);
                if v632:get("OS") and v636.hitgroup == 1 then
                    v640 = v640 .. "\a" .. hexx .. " [OS: " .. v671 .. "]";
                end;
                local v672 = v667:get_name():gsub("%\\", "");
                if v672 == nil or v672 == "" then
                    v672 = "<blank>";
                end;
                v639 = string.format("\a" .. hexx .. "[easy.sync] \aDEFAULT hurt by " .. " %s \aDEFAULT in " .. " %s \aDEFAULT for " .. "\a" .. hexx .. " %s \aDEFAULT damage " .. " [%s]", v672, v635.variables.hitgroups[l_hitgroup_1], l_dmg_health_0, l_health_0 > 0 and l_health_0 .. " hp left" or "dead", v640);
            elseif v637 == 3 and v631:get("Dodged") then
                if globals.tickcount - 20 <= v635.variables.dodged_time and globals.tickcount >= v635.variables.dodged_time then
                    return;
                elseif v638 == nil or not v638:is_alive() then
                    return;
                else
                    local v673 = entity.get(v636.userid, true);
                    if v673 == nil or not v673:is_player() or not v673:is_enemy() then
                        return;
                    else
                        local v674 = v673:get_eye_position();
                        local v675 = vector(v636.x, v636.y, v636.z);
                        local v676 = nil;
                        local v677 = 3;
                        for v678 = 1, 7 do
                            local v679 = v638:get_hitbox_position(v678);
                            local v680 = v679:dist((v679:closest_ray_point(v674, v675)));
                            v680 = math.floor(v680 / 100 * 2.54 * 10) / 10;
                            if v680 < v677 then
                                v677 = v680;
                                v676 = v635.variables.hitgroups[v678];
                            end;
                        end;
                        if v676 == nil then
                            return;
                        else
                            local v681 = v673:get_name():gsub("%\\", "");
                            if v681 == nil or v681 == "" then
                                v681 = "<blank>";
                            end;
                            local l_m_iHealth_4 = v638.m_iHealth;
                            v639 = string.format("\a" .. hexx .. "[easy.sync] \aDEFAULT dodged " .. " %s \aDEFAULT in " .. " %s \aDEFAULT by " .. " %s [%s]", v681, v676, v677 .. "m", l_m_iHealth_4 > 0 and l_m_iHealth_4 .. " hp left" or "dead", v640);
                            v635.variables.dodged_time = globals.tickcount;
                        end;
                    end;
                end;
            end;
            if v639 == nil then
                return;
            else
                if v639 then
                    v639 = v639 .. v640;
                end;
                if v630:get("Console") then
                    print_raw(v639);
                end;
                if v630:get("On-Screen") then
                    print_dev(v639);
                end;
                return;
            end;
        end;
    end;
end;
events.round_start:set(function(_)
    -- upvalues: v628 (ref), v630 (ref)
    if not v628:get() or not v630:get("Console") then
        return;
    else
        print_raw("");
        print_raw("\a" .. hexx .. "\n\n    .-. .-..----..-. . .-.   .----.  .----. .-. .-..-. .-..----.\n    |  `| || {_  | |/ \\| |   | {}  }/  {}  \\| { } ||  `| || {}  \\\n    | |\\  || {__ |  .'.  |   | .-. \\\\      /| {_} || |\\  ||     /\n    `-' `-'`----'`-'   `-'   `-' `-' `----' `-----'`-' `-'`----'\n\n\n\n\n    ");
        return;
    end;
end);
events.aim_ack:set(function(v684)
    -- upvalues: v635 (ref)
    v635.variables.run(v684, 1);
end);
events.player_hurt:set(function(v685)
    -- upvalues: v635 (ref)
    v635.variables.run(v685, 2);
    if entity.get(v685.userid, true) == entity.get_local_player() then
        v635.variables.dodged_time = globals.tickcount;
    end;
end);
events.bullet_impact:set(function(v686)
    -- upvalues: v635 (ref)
    utils.execute_after(0.5, function()
        -- upvalues: v635 (ref), v686 (ref)
        v635.variables.run(v686, 3);
    end);
end);
local v687 = {
    [1] = {
        [1] = nil, 
        [2] = 0, 
        [1] = v35
    }, 
    [2] = {
        [1] = nil, 
        [2] = 1, 
        [1] = color(255, 255, 255)
    }
};
local _ = v31.gradient.text("Auto++", false, v687);
events.render:set(function(_)
    -- upvalues: v687 (ref)
    render.text(font_test, vector_position, color(255, 255, 255), nil, v687);
end);
print_raw("\a" .. hexx .. "\n\n_______  _______  _______           _______           _        _______\n(  ____ \\(  ___  )(  ____ \\|\\     /|(  ____ \\|\\     /|( (    /|(  ____ \\\n| (    \\/| (   ) || (    \\/( \\   / )| (    \\/( \\   / )|  \\  ( || (    \\/\n| (__    | (___) || (_____  \\ (_) / | (_____  \\ (_) / |   \\ | || |\n|  __)   |  ___  |(_____  )  \\   /  (_____  )  \\   /  | (\\ \\) || |\n| (      | (   ) |      ) |   ) (         ) |   ) (   | | \\   || |\n| (____/\\| )   ( |/\\____) |   | | _ /\\____) |   | |   | )  \\  || (____/\\\n(_______/|/     \\|\\_______)   \\_/(_)\\_______)   \\_/   |/    )_)(_______/\n\n\n\n");
local v690 = v345.groups_r.logic_override:switch("\a" .. hexx .. ui.get_icon("face-head-bandage") .. "\aDEFAULT" .. "     Force OS"):tooltip("\aFFFF00FF\227\128\144!\227\128\145EXPERIMENTAL FEATURE\227\128\144!\227\128\145                                                          \aDEFAULT  \227\128\144!\227\128\145This feature will activate your ragebot only for on-shots. You won't shoot players until they fire at you first. It can work well with the 'Hide Shots' exploit or Predictive break LC push.\aFFFF00FF \227\128\144!\227\128\145 FORCE OS feature will toggle off automatically if you're using freestanding, your enemy is holding knife, zeus or your/your opponent's health is lower than 94 and you're using SSG-08 (to prevent you from being baimed) \aFF000099\227\128\144!\227\128\145USE AT YOUR OWN RISK! THIS FEATURE IS STILL IN DEVELOPMENT AND MAY CAUSE UNEXPECTED DEATHS. "):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
local v691 = v690:create():label("                  Bind the button below.");
local v692 = v690:create():switch("OS"):tooltip("Bind this feature to ensure that it wont make you die by accident."):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
v690:set_callback(function(v693)
    -- upvalues: v692 (ref), v691 (ref)
    local v694 = v693:get();
    v692:visibility(v694);
    v691:visibility(v694);
end);
local v698 = {
    current_text_y = 0, 
    current_text_x = 0, 
    current_easy_sync_y = 0, 
    current_easy_sync_x = 0, 
    is_condition_changed = false, 
    fade_in_alpha = 0, 
    fade_out_alpha = 255, 
    current_condition_text = "", 
    indicators = v48:switch("\a" .. hexx .. ui.get_icon("money-check") .. "\aDEFAULT" .. "      Crosshair Indicators ", false):set_callback(function()
        -- upvalues: v66 (ref)
        v66();
    end), 
    ui_get_binds = ui.get_binds, 
    custom_font = render.load_font("nl\\easysyncdebug\\pixel.ttf", 10, "o"), 
    custom_font_s = render.load_font("nl\\easysyncdebug\\pixel.ttf", 10, "ad"), 
    active_binds = {}, 
    bind_alpha_values = {}, 
    current_bind_text_x = {}, 
    lerp = function(v695, v696, v697)
        return v695 + (v696 - v695) * v697;
    end
};
v698.animation = v698.indicators:create();
v698.y_setts = v698.animation:slider("Y Offset", -40, 40, 0):visibility(v698.indicators:get()):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
v698.easy_sync_gradient_animation = v31.gradient.text_animate("easy.sync", -1, {
    v35, 
    color(255, 255, 255)
});
v698.indicators:set_callback(function(v699)
    -- upvalues: v698 (ref)
    local v700 = v699:get();
    v698.y_setts:visibility(v700);
end);
events.createmove:set(function()
    -- upvalues: v698 (ref), v121 (ref)
    if not v698.indicators:get() then
        return;
    else
        local v701 = entity.get_local_player();
        if v701 and v701:is_alive() then
            local v702 = v698.ui_get_binds();
            local v703 = {};
            for _, v705 in ipairs(v702) do
                if not v698.bind_alpha_values[v705.name] then
                    v698.bind_alpha_values[v705.name] = {
                        fade_in_alpha = 0, 
                        fade_out_alpha = 255
                    };
                end;
                if v705.active and v705.name ~= "Double Tap" and v705.name ~= "Hide Shots" then
                    v703[v705.name] = true;
                end;
            end;
            local v706 = ui.find("Aimbot", "Ragebot", "Main", "Double Tap");
            local v707 = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots");
            local v708 = v706:get();
            local v709 = v707:get();
            if v708 then
                v703.DT = rage.exploit:get();
                if not v698.bind_alpha_values.DT then
                    v698.bind_alpha_values.DT = {
                        fade_in_alpha = 0, 
                        fade_out_alpha = 255
                    };
                end;
            end;
            if v709 then
                v703.HS = rage.exploit:get();
                if not v698.bind_alpha_values.HS then
                    v698.bind_alpha_values.HS = {
                        fade_in_alpha = 0, 
                        fade_out_alpha = 255
                    };
                end;
            end;
            local v710 = tostring(v121.last_condition);
            if v698.current_condition_text ~= v710 then
                v698.last_condition_text = v698.current_condition_text;
                v698.current_condition_text = v710;
                v698.fade_out_alpha = 255;
                v698.fade_in_alpha = 0;
                v698.is_condition_changed = true;
            end;
            v698.active_binds = v703;
        else
            v698.active_binds = {};
            v698.bind_alpha_values = {};
        end;
        return;
    end;
end);
events.render:set(function()
    -- upvalues: v698 (ref)
    local v711 = entity.get_local_player();
    if not v711 or not v711:is_alive() or not v698.indicators:get() then
        return;
    else
        local v712 = v711.m_bIsScoped and 25 or 0;
        local v713 = v698.y_setts:get();
        local v714 = render.screen_size();
        local v715 = v714.x / 2 + v712;
        local v716 = v714.y / 2 + v713;
        v698.easy_sync_gradient_animation:animate();
        local v717 = v698.easy_sync_gradient_animation:get_animated_text();
        local v718 = v715 - render.measure_text(v698.custom_font_s, "", v717).x / 2 + v712;
        local v719 = v716 + 5;
        v698.current_easy_sync_x = v698.lerp(v698.current_easy_sync_x, v718, 0.1);
        v698.current_easy_sync_y = v698.lerp(v698.current_easy_sync_y, v719, 0.1);
        render.text(v698.custom_font_s, vector(v698.current_easy_sync_x, v698.current_easy_sync_y), color(255, 255, 255, 255), nil, v717);
        local v720 = v716 + 17;
        if v698.is_condition_changed then
            if v698.fade_out_alpha > 0 then
                v698.fade_out_alpha = v698.fade_out_alpha - 15;
            end;
            if v698.fade_in_alpha < 255 then
                v698.fade_in_alpha = v698.fade_in_alpha + 15;
            end;
            if v698.fade_out_alpha <= 0 and v698.fade_in_alpha >= 255 then
                v698.is_condition_changed = false;
            end;
        end;
        local v721 = render.measure_text(v698.custom_font, "", v698.current_condition_text);
        local v722 = v715 - v721.x / 2 + v712;
        local v723 = v720 - v721.y / 2;
        v698.current_text_x = v698.lerp(v698.current_text_x, v722, 0.1);
        v698.current_text_y = v698.lerp(v698.current_text_y, v723, 0.1);
        render.text(v698.custom_font, vector(v698.current_text_x, v698.current_text_y), color(255, 255, 255, v698.fade_in_alpha), "", v698.current_condition_text);
        local v724 = 8;
        for v725, v726 in pairs(v698.active_binds) do
            local l_v725_0 = v725;
            local v728 = color(255, 255, 255, 255);
            if v725 == "DT" or v725 == "HS" then
                v728 = v726 == 0 and color(255, 0, 0, 255) or color(0, 255, 0, 255);
            end;
            local v729 = v715 - render.measure_text(v698.custom_font, "", l_v725_0).x / 2 + v712;
            if not v698.current_bind_text_x[v725] then
                v698.current_bind_text_x[v725] = v729;
            else
                v698.current_bind_text_x[v725] = v698.lerp(v698.current_bind_text_x[v725], v729, 0.1);
            end;
            local v730 = v698.bind_alpha_values[v725];
            if v730 then
                if v726 then
                    v730.fade_in_alpha = math.min(v730.fade_in_alpha + 15, 255);
                else
                    v730.fade_out_alpha = math.max(v730.fade_out_alpha - 15, 0);
                end;
                v728.a = v730.fade_in_alpha;
            end;
            if v698.current_text_y then
                local v731 = v698.current_text_y + v724;
                render.text(v698.custom_font, vector(v698.current_bind_text_x[v725], v731), v728, "", v725);
                v724 = v724 + 8;
            end;
        end;
        return;
    end;
end);
local v732 = {
    thirdperson_current_distance = 1, 
    thirdperson_enable = v47:switch("\a" .. hexx .. ui.get_icon("arrow-up-big-small") .. "\aDEFAULT" .. "      Thirdperson Animation ", false):set_callback(function()
        -- upvalues: v66 (ref)
        v66();
    end)
};
events.round_start:set(function()
    -- upvalues: v732 (ref)
    if v732.thirdperson_enable:get() then
        v732.thirdperson_enable:set(false);
        utils.execute_after(0.5, function()
            -- upvalues: v732 (ref)
            v732.thirdperson_enable:set(true);
        end);
        return;
    else
        return;
    end;
end);
v732.thirdperson_enable:tooltip("Animation of toggling thirdperson.");
v732.thirdperson_enable:set_callback(function()
    -- upvalues: v732 (ref), v28 (ref)
    if v732.thirdperson_enable:get() then
        v732.thirdperson_current_distance = v28.thirdperson:get() and v28.thirdperson_distance:get() or 0;
    else
        v28.thirdperson:override();
        v28.thirdperson_distance:override();
    end;
end);
local function v736()
    -- upvalues: v732 (ref), v28 (ref), v20 (ref)
    if not v732.thirdperson_enable:get() then
        return;
    else
        local v733 = entity.get_local_player();
        if not v733 then
            return;
        else
            local v734 = v28.thirdperson:get();
            local v735 = v28.thirdperson_distance:get();
            if v733:is_alive() then
                v732.thirdperson_current_distance = v20(v732.thirdperson_current_distance, v734 and v735 or 0, 1);
            end;
            v28.thirdperson:override(v732.thirdperson_current_distance > 10);
            v28.thirdperson_distance:override(v732.thirdperson_current_distance);
            return;
        end;
    end;
end;
events.render:set(function()
    -- upvalues: v736 (ref)
    local v737 = entity.get_local_player();
    if not v737 then
        return;
    else
        if v737:is_alive() then
            v736();
        end;
        return;
    end;
end);
local v738 = {
    animation = 0, 
    enable = v48:switch("\a" .. hexx .. ui.get_icon("crosshairs") .. "\aDEFAULT" .. "      Scope Lines"):set_callback(function()
        -- upvalues: v66 (ref)
        v66();
    end)
};
v738.color_inside = v738.enable:create():color_picker("Inside", color(255, 255, 255, 255)):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
v738.color_outside = v738.enable:create():color_picker("Outside", color(255, 255, 255, 0)):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
v738.gap = v738.enable:create():slider("Gap", 0, 100, 10, 1, "px"):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
v738.length = v738.enable:create():slider("Length", 0, 500, 100, 1, "px"):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
v738.animations = v738.enable:create():selectable("Animations", {
    [1] = "Alpha", 
    [2] = "Rotation", 
    [3] = "Size"
}):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
v738.enable:set_callback(function(v739)
    -- upvalues: v738 (ref)
    local v740 = v739:get();
    v738.color_inside:visibility(v740);
    v738.color_outside:visibility(v740);
    v738.gap:visibility(v740);
    v738.length:visibility(v740);
    v738.animations:visibility(v740);
    ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay"):override(v740 and "Remove All" or nil);
end, true);
events.render:set(function()
    -- upvalues: v738 (ref), v20 (ref)
    local v741 = entity.get_local_player();
    if not v738.enable:get() or not v741 then
        return;
    else
        local l_m_bIsScoped_0 = v741.m_bIsScoped;
        v738.animation = v20(v738.animation, l_m_bIsScoped_0 and 100 or 0, 0.75);
        local v743 = v738.animation / 100;
        local v744 = v738.animations:get("Rotation") and -180 * v743 or 0;
        local v745 = render.screen_size();
        local v746 = v745.x / 2;
        local v747 = v745.y / 2;
        local v748 = v738.gap:get();
        local v749 = v748 + v738.length:get();
        if v738.animations:get("Size") then
            v748 = math.floor(v748 * v743);
            v749 = math.floor(v749 * v743);
        end;
        local v750 = v738.color_inside:get();
        local v751 = v738.color_outside:get();
        local v752 = v738.animations:get("Alpha") and v750.a * v743 or l_m_bIsScoped_0 and v750.a or 0;
        local v753 = v738.animations:get("Alpha") and v751.a * v743 or l_m_bIsScoped_0 and v751.a or 0;
        v750 = v750:alpha_modulate(v752);
        v751 = v751:alpha_modulate(v753);
        render.push_rotation(v744);
        render.gradient(vector(v746, v747 - v749 + 1), vector(v746 + 1, v747 - v748 + 1), v751, v751, v750, v750);
        render.gradient(vector(v746, v747 + v748), vector(v746 + 1, v747 + v749), v750, v750, v751, v751);
        render.gradient(vector(v746 - v749 + 1, v747), vector(v746 - v748 + 1, v747 + 1), v751, v750, v751, v750);
        render.gradient(vector(v746 + v748, v747), vector(v746 + v749, v747 + 1), v750, v751, v750, v751);
        render.pop_rotation();
        return;
    end;
end);
local v754 = {
    should_lc = false, 
    os_active = false, 
    last_shot_time = 0, 
    nade_lc = v1.auto_nades:switch("\a" .. hexx .. ui.get_icon("bomb") .. "\aDEFAULT" .. "      Break LC On Nade-Throw"):tooltip("\aDEFAULTThe Option '" .. "\aFFCC50FF" .. ui.get_icon("circle-exclamation") .. "\aFF0000FF Instant" .. "\aDEFAULT' may result in instability when used in conjunction with any type of grenade helpers. For a more reliable experience, it is recommended to select the 'Low' option."):set_callback(function()
        -- upvalues: v66 (ref)
        v66();
    end), 
    nade_options = {}, 
    nade_delay = {}, 
    nade_ui = {
        nade_release_enable = v1.auto_nades:switch("\a" .. hexx .. ui.get_icon("hand-holding-heart") .. "\aDEFAULT" .. "      Grenade Release"):tooltip("\aDEFAULTReleases the grenade if the predicted damage is greater than or equal to the value selected on the sliders."):set_callback(function()
            -- upvalues: v66 (ref)
            v66();
        end), 
        release_if_fatal = {}, 
        damage_release_molly = {}, 
        damage_release_explosive = {}
    }
};
v754.nade_options = v754.nade_lc:create():combo("Option", {
    [1] = v565, 
    [2] = v297
}):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
v754.nade_delay = v754.nade_lc:create():combo("Delay", {
    [1] = nil, 
    [2] = "Low", 
    [3] = "Medium", 
    [4] = "High", 
    [1] = "\aFFCC50FF" .. ui.get_icon("circle-exclamation") .. "\aFF0000FF Instant"
}):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
v754.nade_lc:set_callback(function(v755)
    -- upvalues: v754 (ref)
    local v756 = v755:get();
    v754.nade_options:visibility(v756);
    v754.nade_delay:visibility(v756);
end);
events.grenade_thrown:set(function(v757)
    -- upvalues: v754 (ref)
    local v758 = entity.get_local_player();
    if v758:get_player_info().userid == v757.userid and v758:is_alive() then
        v754.should_lc = true;
    end;
end);
local function v760()
    -- upvalues: v754 (ref), v565 (ref), v297 (ref)
    if not v754.should_lc or not v754.nade_lc:get() then
        return;
    else
        local v759 = nil;
        v759 = ({
            Medium = 0.2, 
            Low = 0.1, 
            High = 0.4, 
            ["\aFFCC50FF" .. ui.get_icon("circle-exclamation") .. "\aFF0000FF Instant"] = 0.01
        })[v754.nade_delay:get()];
        if v754.nade_options:get() == v565 then
            ui.find("Aimbot", "Ragebot", "Main", "Double Tap"):override(false);
            utils.execute_after(0.2, function()
                ui.find("Aimbot", "Ragebot", "Main", "Double Tap"):override(nil);
            end);
        elseif v754.nade_options:get() == v297 then
            rage.exploit:force_teleport();
        end;
        v754.should_lc = false;
        return;
    end;
end;
events.createmove:set(function()
    -- upvalues: v754 (ref), v760 (ref)
    if v754.should_lc then
        local v761 = v754.nade_delay:get();
        local v762 = ({
            Medium = 0.2, 
            Low = 0.1, 
            Instant = 0.05, 
            High = 0.4
        })[v761] or 0.1;
        utils.execute_after(v762, v760);
    end;
end);
v754.nade_ui.release_if_fatal = v754.nade_ui.nade_release_enable:create():switch("\a" .. hexx .. ui.get_icon("tombstone") .. "\aDEFAULT" .. "   Release if lethal"):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
v754.nade_ui.damage_release_molly = v754.nade_ui.nade_release_enable:create():slider("\a" .. hexx .. ui.get_icon("martini-glass") .. "\aDEFAULT" .. " Molotov", 1, 49, 30, 1, "dmg"):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
v754.nade_ui.damage_release_explosive = v754.nade_ui.nade_release_enable:create():slider("\a" .. hexx .. ui.get_icon("explosion") .. "\aDEFAULT" .. " Frag", 1, 49, 30, 1, "dmg"):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
v754.nade_ui.nade_release_enable:set_callback(function(v763)
    -- upvalues: v754 (ref)
    local v764 = v763:get();
    v754.nade_ui.release_if_fatal:visibility(v764);
    v754.nade_ui.damage_release_explosive:visibility(v764);
    v754.nade_ui.damage_release_molly:visibility(v764);
end);
events.grenade_prediction:set(function(v765)
    -- upvalues: v754 (ref)
    if v754.nade_ui.nade_release_enable:get() then
        if v765.fatal and v754.nade_ui.release_if_fatal:get() then
            utils.console_exec("+attack");
            utils.execute_after(0.01, function()
                utils.console_exec("-attack");
            end);
        end;
        if v765.type == "Molly" and v765.damage >= v754.nade_ui.damage_release_molly:get() or v765.type == "Frag" and v765.damage >= v754.nade_ui.damage_release_explosive:get() then
            utils.console_exec("+attack");
            utils.execute_after(0.01, function()
                utils.console_exec("-attack");
            end);
        end;
    end;
    return v765.damage, v765.fatal;
end);
local function v767(v766)
    -- upvalues: v754 (ref)
    v754.current_threat = entity.get_threat(v766);
end;
events.weapon_fire:set(function(v768)
    -- upvalues: v754 (ref)
    local v769 = entity.get(v768.userid, true);
    if v754.current_threat and v769 and v754.current_threat == v769 then
        v754.os_active = true;
        v754.last_shot_time = globals.curtime;
    end;
end);
events.createmove:set(function()
    -- upvalues: v767 (ref), v692 (ref), v690 (ref), v754 (ref)
    v767(true);
    local v770 = entity.get_local_player();
    local l_m_iHealth_5 = v770.m_iHealth;
    if v692:get() and v690:get() then
        if v754.current_threat == nil then
            return;
        else
            local v772 = v754.current_threat:get_player_weapon();
            if not v772 then
                return;
            else
                local v773 = v772:get_weapon_index();
                local l_m_iHealth_6 = v754.current_threat.m_iHealth;
                if globals.curtime - v754.last_shot_time > 0.5 then
                    v754.os_active = false;
                    v754.last_shot_time = 0;
                end;
                if v754.os_active or v773 == 42 or v773 == 31 or v773 == 59 or l_m_iHealth_5 < 94 or l_m_iHealth_6 < 94 and v770:get_player_weapon():get_weapon_index() == 40 or ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"):get() then
                    ui.find("Aimbot", "Ragebot", "Main", "Enabled"):override(nil);
                else
                    ui.find("Aimbot", "Ragebot", "Main", "Enabled"):override(false);
                end;
            end;
        end;
    else
        ui.find("Aimbot", "Ragebot", "Main", "Enabled"):override(nil);
    end;
end);
events.player_death:set(function(v775)
    -- upvalues: v732 (ref)
    local v776 = entity.get_local_player();
    if v776:get_player_info().userid == v775.userid and not v776:is_alive() then
        if v732.thirdperson_enable:get() then
            v732.thirdperson_enable:set(false);
            utils.execute_after(0.5, function()
                -- upvalues: v732 (ref)
                v732.thirdperson_enable:set(true);
            end);
        else
            return;
        end;
    end;
end);
local v777 = {
    bind_cache = false, 
    drop_nades = v1.auto_nades:switch("\a" .. hexx .. ui.get_icon("droplet") .. "\aDEFAULT" .. "       Grenade Drop"):tooltip("Will drop Molotov and HE grenade on bind."):set_callback(function()
        -- upvalues: v66 (ref)
        v66();
    end), 
    tables_nade = {
        [1] = "weapon_hegrenade", 
        [2] = "weapon_molotov"
    }
};
v777.drop_nades_hotkey = v777.drop_nades:create():hotkey("Fast Drop Bind");
local function v783()
    -- upvalues: v777 (ref)
    if v777.drop_nades:get() == false then
        return;
    else
        local v778 = entity.get_local_player();
        if v778 == nil or not v778:is_alive() then
            return;
        else
            v777.tables_nade = v778.m_iTeamNum == 3 and {
                [1] = "weapon_hegrenade", 
                [2] = "weapon_incgrenade"
            } or {
                [1] = "weapon_hegrenade", 
                [2] = "weapon_molotov"
            };
            if v777.drop_nades_hotkey:get() and not v777.bind_cache then
                for v779, v780 in ipairs(v777.tables_nade) do
                    do
                        local l_v779_0, l_v780_0 = v779, v780;
                        utils.execute_after(0.1 * l_v779_0, function()
                            -- upvalues: l_v780_0 (ref), l_v779_0 (ref)
                            utils.console_exec(string.format("use %s", l_v780_0));
                            utils.execute_after(0.05 * l_v779_0, function()
                                utils.console_exec("drop");
                            end);
                        end);
                    end;
                end;
            end;
            v777.bind_cache = v777.drop_nades_hotkey:get();
            return;
        end;
    end;
end;
events.render:set(function()
    -- upvalues: v783 (ref)
    v783();
end);
local v784 = v48:switch("\a" .. hexx .. ui.get_icon("eye") .. "\aDEFAULT" .. "     Viewmodel"):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
local v785 = {
    viewmodel_fov = v784:create():slider("FOV", 60, 120, 68):set_callback(function()
        -- upvalues: v66 (ref)
        v66();
    end), 
    viewmodel_x = v784:create():slider("X", -200, 200, 25, 0.1):set_callback(function()
        -- upvalues: v66 (ref)
        v66();
    end), 
    viewmodel_y = v784:create():slider("Y", -200, 200, 25, 0.1):set_callback(function()
        -- upvalues: v66 (ref)
        v66();
    end), 
    viewmodel_z = v784:create():slider("Z", -200, 200, 25, 0.1):set_callback(function()
        -- upvalues: v66 (ref)
        v66();
    end), 
    reset_all = v784:create():button("\a" .. hexx .. ui.get_icon("moon") .. " Reset All", nil, true):set_callback(function()
        -- upvalues: v66 (ref)
        v66();
    end)
};
local function v790(v786, v787, v788, v789)
    cvar.viewmodel_fov:int(v786 == nil and 68 or v786, true);
    cvar.viewmodel_offset_x:float(v787 == nil and 2.5 or v787, true);
    cvar.viewmodel_offset_y:float(v788 == nil and 0 or v788, true);
    cvar.viewmodel_offset_z:float(v789 == nil and -1.5 or v789, true);
end;
v785.reset_all:set_callback(function()
    -- upvalues: v785 (ref)
    v785.viewmodel_fov:reset();
    v785.viewmodel_x:reset();
    v785.viewmodel_y:reset();
    v785.viewmodel_z:reset();
end);
v784:set_callback(function(v791)
    -- upvalues: v785 (ref), v790 (ref)
    local v792 = v791:get();
    v785.viewmodel_fov:visibility(v792);
    v785.viewmodel_x:visibility(v792);
    v785.viewmodel_y:visibility(v792);
    v785.viewmodel_z:visibility(v792);
    v785.reset_all:visibility(v792);
    if v792 then
        v790(v785.viewmodel_fov:get(), v785.viewmodel_x:get() / 10, v785.viewmodel_y:get() / 10, v785.viewmodel_z:get() / 10);
    end;
end, true);
v784:set_callback(function(v793)
    -- upvalues: v790 (ref)
    if not v793:get() then
        v790();
    end;
end);
v785.viewmodel_fov:set_callback(function()
    -- upvalues: v790 (ref), v785 (ref)
    v790(v785.viewmodel_fov:get(), v785.viewmodel_x:get() / 10, v785.viewmodel_y:get() / 10, v785.viewmodel_z:get() / 10);
end);
v785.viewmodel_x:set_callback(function()
    -- upvalues: v790 (ref), v785 (ref)
    v790(v785.viewmodel_fov:get(), v785.viewmodel_x:get() / 10, v785.viewmodel_y:get() / 10, v785.viewmodel_z:get() / 10);
end);
v785.viewmodel_y:set_callback(function()
    -- upvalues: v790 (ref), v785 (ref)
    v790(v785.viewmodel_fov:get(), v785.viewmodel_x:get() / 10, v785.viewmodel_y:get() / 10, v785.viewmodel_z:get() / 10);
end);
v785.viewmodel_z:set_callback(function()
    -- upvalues: v790 (ref), v785 (ref)
    v790(v785.viewmodel_fov:get(), v785.viewmodel_x:get() / 10, v785.viewmodel_y:get() / 10, v785.viewmodel_z:get() / 10);
end);
events.shutdown:set(function(_)
    -- upvalues: v784 (ref), v790 (ref)
    if v784:get() then
        v790();
    end;
end);
local v795 = v47:switch("\a" .. hexx .. ui.get_icon("person-ski-jumping") .. "\aDEFAULT" .. "      Jump On-Place"):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
local function v801()
    -- upvalues: v795 (ref), v28 (ref)
    if v795:get() then
        local v796 = entity.get_local_player();
        if v796 == nil or not v796:is_alive() then
            return;
        else
            local v797 = common.is_button_down(87);
            local v798 = common.is_button_down(65);
            local v799 = common.is_button_down(83);
            local v800 = common.is_button_down(68);
            if not v798 and not v797 and not v799 and not v800 then
                v28.air_strafe:override(false);
            else
                v28.air_strafe:override(nil);
            end;
        end;
    end;
end;
v795:set_callback(function()
    -- upvalues: v795 (ref), v28 (ref)
    if v795:get() == false then
        v28.air_strafe:set(false);
        utils.execute_after(1, function()
            -- upvalues: v28 (ref)
            v28.air_strafe:set(true);
        end);
    end;
end);
events.createmove:set(function()
    -- upvalues: v801 (ref)
    v801();
end);
local v802 = v1.auto_nades:switch("\a" .. hexx .. ui.get_icon("wrench") .. "\aDEFAULT" .. "      Nade Fix"):set_callback(function()
    -- upvalues: v66 (ref)
    v66();
end);
local function v805()
    -- upvalues: v802 (ref)
    if v802:get() then
        local v803 = entity.get_local_player():get_player_weapon();
        if v803 == nil then
            return;
        else
            local v804 = v803:get_weapon_index();
            if ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Quick-Switch"):get() then
                if v804 == 44 or v804 == 45 or v804 == 46 then
                    ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Quick-Switch"):override(false);
                else
                    ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Quick-Switch"):override(nil);
                end;
            end;
        end;
    end;
end;
events.createmove:set(function()
    -- upvalues: v805 (ref)
    v805();
end);
v80:set_callback(function()
    -- upvalues: v80 (ref), v47 (ref), v48 (ref), v49 (ref), v1 (ref), v342 (ref)
    local v806 = v80:get();
    v47:visibility(v806 == 1);
    v48:visibility(v806 == 1);
    v49:visibility(v806 == 2);
    v1.auto_nades:visibility(v806 == 2 and v342:get());
    v1.antiaim_general:visibility(v806 == 3);
end);
v342:set_callback(function()
    -- upvalues: v342 (ref), v345 (ref), v754 (ref), v777 (ref), v802 (ref)
    if v342:get() == false then
        v345.settings_r.quick_switch_after_nade:set(false);
        v754.nade_lc:set(false);
        v754.nade_ui.nade_release_enable:set(false);
        v777.drop_nades:set(false);
        v802:set(false);
    end;
end);
local v807 = {
    update_interval = 0.07, 
    last_update_time = 0, 
    leg_fucker = v47:switch("\a" .. hexx .. ui.get_icon("wheelchair") .. "\aDEFAULT" .. "      Leg Fucker"):set_callback(function()
        -- upvalues: v66 (ref)
        v66();
    end), 
    leg_movement_ref = ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement")
};
local function v810()
    -- upvalues: v807 (ref)
    local v808 = {
        [1] = "Sliding", 
        [2] = "Walking"
    };
    if v807.leg_fucker:get() then
        local v809 = v808[math.random(#v808)];
        v807.leg_movement_ref:override(v809);
    else
        v807.leg_movement_ref:override(nil);
    end;
end;
events.createmove:set(function(_)
    -- upvalues: v807 (ref), v810 (ref)
    if not v807.leg_fucker:get() then
        v807.leg_movement_ref:override(nil);
        return;
    else
        local l_realtime_0 = globals.realtime;
        if v807.last_update_time + v807.update_interval <= l_realtime_0 then
            v810();
            v807.last_update_time = l_realtime_0;
        end;
        return;
    end;
end);
local v813 = 0;
local v814 = 0;
local v815 = 0;
local v816 = 0;
local v817 = {
    blur_switch = v48:switch("\a" .. hexx .. ui.get_icon("moon-stars") .. "\aDEFAULT" .. "      Background Blur", false)
};
v817.blur_strength = v817.blur_switch:create():slider("Blur Strength", 1, 5, 3):set_callback(function()
    -- upvalues: v815 (ref), v817 (ref), v816 (ref)
    v815 = v817.blur_strength:get() / 2;
    v816 = v817.blur_strength:get() / 2;
end);
v817.blur_strength:visibility(false);
v817.blur_switch:set_callback(function(_)
    -- upvalues: v817 (ref)
    local v819 = v817.blur_switch:get();
    v817.blur_strength:visibility(v819);
end);
local function v823(v820, v821, v822)
    return v820 + (v821 - v820) * v822;
end;
local function v825()
    -- upvalues: v813 (ref), v823 (ref), v815 (ref), v814 (ref), v816 (ref)
    local v824 = 0.1;
    v813 = v823(v813, v815, v824);
    v814 = v823(v814, v816, v824);
end;
events.render:set(function()
    -- upvalues: v817 (ref), v815 (ref), v816 (ref), v825 (ref), v813 (ref), v814 (ref)
    local v826 = ui.get_alpha();
    if v817.blur_switch:get() and v826 > 0 then
        v815 = v817.blur_strength:get() / 2;
        v816 = v817.blur_strength:get() / 2;
    else
        v815 = 0;
        v816 = 0;
    end;
    v825();
    if v813 > 0 then
        local v827 = render.screen_size();
        render.blur(vector(-900, -800), v827, v813, v814);
    end;
end);
local v828 = {
    mute_unmute = v47:switch("\a" .. hexx .. ui.get_icon("volume") .. "\aDEFAULT" .. "      Mute/Unmute Players", false)
};
v828.mute_unmute_create = v828.mute_unmute:create();
v828.mute_set = v828.mute_unmute_create:combo("Action:", {
    [1] = "Mute", 
    [2] = "Unmute"
});
v828.mute_set:visibility(false);
local function v833()
    -- upvalues: v828 (ref)
    local v829 = v828.mute_set:get();
    entity.get_players(false, true, function(v830)
        -- upvalues: v829 (ref)
        local v831 = v830:get_player_info();
        local v832 = panorama.FriendsListAPI.IsSelectedPlayerMuted(v831.steamid64);
        if v829 == "Unmute" and v832 or v829 == "Mute" and not v832 then
            panorama.FriendsListAPI.ToggleMute(v831.steamid64);
        end;
    end);
end;
v828.mute_set:set_callback(v833);
v828.mute_unmute:set_callback(function()
    -- upvalues: v828 (ref)
    local v834 = v828.mute_unmute:get();
    v828.mute_set:visibility(v834);
    if v834 then
        v828.mute_set:set("Mute");
    end;
    if not v834 then
        entity.get_players(false, true, function(v835)
            local v836 = v835:get_player_info();
            if panorama.FriendsListAPI.IsSelectedPlayerMuted(v836.steamid64) then
                panorama.FriendsListAPI.ToggleMute(v836.steamid64);
            end;
        end);
    end;
end);