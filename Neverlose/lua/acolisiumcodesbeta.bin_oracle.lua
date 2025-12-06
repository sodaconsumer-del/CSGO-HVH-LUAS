local l_pui_0 = require("neverlose/pui");
local l_base64_0 = require("neverlose/base64");
local l_clipboard_0 = require("neverlose/clipboard");
local l_monylinear_0 = require("neverlose/monylinear");
local l_smoothy_0 = require("neverlose/smoothy");
local _ = require("neverlose/animations");
local _ = require("neverlose/get_defensive");
local l_ffi_0 = require("ffi");
local _ = require("neverlose/grenade_prediction");
local l_gradient_0 = require("neverlose/gradient");
local l_x_0 = render.screen_size().x;
local l_y_0 = render.screen_size().y;
local v12 = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage");
local _ = require("neverlose/bomb");
local l_system_0 = require("neverlose/drag_system");
local l_anim_0 = require("neverlose/moon_anim");
local _ = require("neverlose/mtools");
local _ = render.load_font("Calibri", 23, "bda");
local _ = {};
local _ = {};
local _ = render.screen_size();
local v21 = {
    on_plant_time = 0, 
    planting = false, 
    planting_site = "", 
    fill = 0
};
local v22 = {
    verdana_bold = render.load_font("Verdana Bold", 22, "ab"), 
    verdana_bold2 = render.load_font("Verdana Bold", 18, "ab"), 
    verdana_bold3 = render.load_font("Verdana Bold", 17, "ab"), 
    verdana = render.load_font("Verdana", 20, "ab"), 
    verdana_ind = render.load_font("Verdana", 11, "ab"), 
    verdana_arrows = render.load_font("Verdana", 25, "ab")
};
local v23 = {
    ping = ui.find("Miscellaneous", "Main", "Other", "Fake Latency"), 
    da = ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot"), 
    dt = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"), 
    body = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim"), 
    safe = ui.find("Aimbot", "Ragebot", "Safety", "Safe Points"), 
    hs = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"), 
    fd = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"), 
    fs = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding")
};
print("\v[ welcome to \226\128\149 ignite ]");
cvar.play:call("ui/csgo_ui_contract_type1");
l_ffi_0.cdef("    typedef void*(__thiscall* get_client_entity_t)(void*, int);\n    bool URLDownloadToFileA(void* LPUNKNOWN, const char* LPCSTR, const char* LPCSTR2, int a, int LPBINDSTATUSCALLBACK);\n    bool DeleteUrlCacheEntryA(const char* lpszUrlName);\n    \n    bool DeleteUrlCacheEntryA(const char* lpszUrlName);\n    void* __stdcall URLDownloadToFileA(void* LPUNKNOWN, const char* LPCSTR, const char* LPCSTR2, int a, int LPBINDSTATUSCALLBACK);\n    typedef int(__fastcall* clantag_t)(const char*, const char*);\n    void* CloseHandle(void *hFile);\n    typedef int(__fastcall* clantag_t)(const char*, const char*);    \n\n    typedef struct {\n        char  pad_0000[20];\n        int m_nOrder;\n        int m_nSequence;\n        float m_flPrevCycle;\n        float m_flWeight;\n        float m_flWeightDeltaRate;\n        float m_flPlaybackRate;\n        float m_flCycle;\n        void *m_pOwner;\n        char  pad_0038[4];\n    } CAnimationLayer_t;\n");
local v24 = {
    base_speed = 0.095, 
    _list = {}
};
v24.new = function(v25, v26, v27, v28)
    -- upvalues: v24 (ref)
    if not v27 then
        v27 = v24.base_speed;
    end;
    if v24._list[v25] == nil then
        v24._list[v25] = v28 and v28 or 0;
    end;
    v24._list[v25] = math.lerp(v24._list[v25], v26, v27);
    return v24._list[v25];
end;
local _ = {
    last_drop_tick = globals.tickcount
};
local v30 = false;
local v31 = render.screen_size();
local v32 = {};
local v33 = {};
local v34 = {};
local v35 = {};
local v36 = {};
local v37 = {};
local v38 = {};
local v39 = {};
local _ = {};
local v41 = {};
local v42 = {};
local _ = "";
local v44 = "\a{Link Active}";
v42 = {
    [1] = yaw, 
    [2] = invert, 
    [3] = add, 
    [4] = safe, 
    [5] = cond, 
    [6] = cond2
};
local v45 = 0;
local v46 = 0;
local v47 = 0;
local v48 = 0;
round = function(v49)
    return v49 >= 0 and math.floor(v49 + 0.5) or math.ceil(v49 - 0.5);
end;
local v50 = common.get_timestamp() / 1000;
local v51 = 2.5;
local v52 = 0.75;
local v53 = 0.75;
local v54 = v51 - v52 - v53;
local v55 = 200;
v31 = render.screen_size();
screenX = tonumber(v31.x);
screenY = tonumber(v31.y);
events.render:set(function(_)
    -- upvalues: v50 (ref), v52 (ref), v55 (ref), v54 (ref), v51 (ref), v53 (ref), v44 (ref)
    local v57 = common.get_timestamp() / 1000 - v50;
    local v58 = 0;
    if v57 < v52 then
        v58 = round(v57 / v52 * v55);
    elseif v57 < v52 + v54 then
        v58 = v55;
    elseif v57 < v51 then
        v58 = round(v55 - (v57 - v52 - v54) / v53 * 255);
    end;
    v58 = math.max(0, math.min(v55, v58));
    render.rect(vector(0, 0), vector(screenX, screenY), color(30, 30, 30, v58));
    render.blur(vector(0, 0), vector(screenX, screenY), 0.5, v58 / v55, 8);
    render.text(4, vector(screenX / 2, screenY / 2 - 49), color(0, 0, 0, v58 / v55), "ac", v44 .. ui.get_icon("wreath"), " WELCOME TO ");
    render.text(4, vector(screenX / 2, screenY / 2 - 51), color(0, 0, 0, v58 / v55), "ac", v44 .. ui.get_icon("wreath"), " WELCOME TO ");
    render.text(4, vector(screenX / 2, screenY / 2 - 50), color(230, 232, 230, v58), "ac", v44 .. ui.get_icon("wreath"), " WELCOME TO ");
    render.text(4, vector(screenX / 2, screenY / 2 - 39), color(0, 0, 0, v58 / v55), "ac", ui.get_icon("fire-flame-curved"), " IGNITE ");
    render.text(4, vector(screenX / 2, screenY / 2 - 41), color(0, 0, 0, v58 / v55), "ac", ui.get_icon("fire-flame-curved"), " IGNITE ");
    render.text(4, vector(screenX / 2, screenY / 2 - 40), color(230, 232, 230, v58), "ac", v44 .. ui.get_icon("fire-flame-curved"), " IGNITE ");
end);
v41.hitboxes = {
    [1] = "generic", 
    [2] = "head", 
    [3] = "chest", 
    [4] = "stomach", 
    [5] = "left arm", 
    [6] = "right arm", 
    [7] = "left leg", 
    [8] = "right leg", 
    [9] = "neck", 
    [10] = "generic", 
    [11] = "gear"
};
v41.data = {};
v41.datal = {};
local v59 = 0;
v41.hit = 0;
v41.reg = v59;
v59 = {
    urlmon = l_ffi_0.load("UrlMon"), 
    wininet = l_ffi_0.load("WinInet")
};
v59.download_file_from_url = function(v60, v61)
    -- upvalues: v59 (ref)
    v59.wininet.DeleteUrlCacheEntryA(v60);
    v59.urlmon.URLDownloadToFileA(nil, v60, v61, 0, 0);
end;
local v62 = {
    name = {
        [1] = v44 .. "default \rpreset"
    }, 
    file = {
        [1] = ""
    }
};
files.create_folder("nl/ignite");
if files.read("nl/ignite/configuration.txt") == nil then
    files.write("nl/ignite/configuration.txt", l_base64_0.encode(json.stringify(v62)));
end;
presets_data = json.parse(l_base64_0.decode(files.read("nl/ignite/configuration.txt")));
local l_rect_0 = render.rect;
local l_shadow_0 = render.shadow;
render.rect = function(v65, v66, ...)
    -- upvalues: l_rect_0 (ref)
    local l_v65_0 = v65;
    local v68 = v65 + v66;
    return l_rect_0(l_v65_0, v68, ...);
end;
render.shadow = function(v69, v70, ...)
    -- upvalues: l_shadow_0 (ref)
    local l_v69_0 = v69;
    local v72 = v69 + v70;
    return l_shadow_0(l_v69_0, v72, ...);
end;
lerp = function(v73, v74, v75)
    return v73 + (v74 - v73) * v75;
end;
math.max_lerp_low_fps = 2.2222222222222223;
math.lerp = function(v76, v77, v78)
    if v76 == v77 then
        return v77;
    else
        local v79 = globals.frametime * 170;
        v78 = v78 * math.min(v79, math.max_lerp_low_fps);
        local v80 = v76 + (v77 - v76) * globals.frametime * v78;
        if math.abs(v80 - v77) < 0.01 then
            return v77;
        else
            return v80;
        end;
    end;
end;
local function _(v81, v82)
    local v83 = nil;
    local v84 = nil;
    local v85 = nil;
    local v86 = nil;
    v83 = math.sin(math.rad(v81));
    v84 = math.sin(math.rad(v82));
    v85 = math.cos(math.rad(v81));
    v86 = math.cos(math.rad(v82));
    return vector(v85 * v86, v85 * v84, -v83);
end;
local function v91(v88, v89, v90)
    return v88 + (v89 - v88) * v90 * globals.frametime;
end;
local function v94(v92)
    local _ = v92:gsub("\a.{6}", "");
end;
if files.read("nl/ignite/CheltenhamBoldItalic.otf") == nil then
    v59.download_file_from_url("https://github.com/travmavdrame/fontgloriosa/raw/main/CheltenhamBoldItalic.otf", "nl/ignite/CheltenhamBoldItalic.otf");
end;
if files.read("nl/ignite/WixMadeforDisplayRegular.ttf") == nil then
    v59.download_file_from_url("https://github.com/travmavdrame/fontgloriosa/raw/main/WixMadeforDisplayRegular.ttf", "nl/ignite/WixMadeforDisplayRegular.ttf");
end;
local _ = render.load_font("nl/ignite/CheltenhamBoldItalic.otf", 18, "d, a");
local _ = render.load_font("nl/ignite/WixMadeforDisplayRegular.ttf", 10, "d, a");
local _ = render.load_font("nl/ignite/CheltenhamBoldItalic.otf", 12, "d, a");
local function v104(v98, v99, v100)
    -- upvalues: v48 (ref), v94 (ref)
    return function(...)
        -- upvalues: v100 (ref), v98 (ref), v48 (ref), v99 (ref), v94 (ref)
        local l_status_0, l_result_0 = pcall(v100, ...);
        if not l_status_0 then
            local v103 = v98 .. " : " .. l_result_0:gsub(".{6}", "");
            if v103 == "presets.import : [\"neverlose/base64\"]:98: attempt to perform arithmetic on local 'd' (a nil value)" then
                v48 = globals.realtime;
            end;
            if v99 then
                v94(v103);
            end;
            return false, v103;
        else
            return l_result_0, l_status_0;
        end;
    end;
end;
local function v108(v105, v106, v107)
    -- upvalues: v104 (ref)
    events[v105]:set(v104(v106, true, v107));
end;
local function v112(v109, v110)
    for v111 = 1, #v109 do
        if v109[v111] == v110 then
            return true;
        end;
    end;
    return false;
end;
local function _(v113)
    if v113:get_override() == nil then
        return v113:get();
    else
        return v113:get_override();
    end;
end;
v32 = {
    build = "crashing", 
    update = "17.10.2024", 
    screen = render.screen_size() * 0.5, 
    fullscreen = render.screen_size(), 
    cond = {
        [1] = "shared", 
        [2] = "standing", 
        [3] = "running", 
        [4] = "walking", 
        [5] = "crouch", 
        [6] = "crouch-move", 
        [7] = "air", 
        [8] = "air-crouch", 
        [9] = "freestanding"
    }, 
    cond2 = {
        [1] = "SHARED", 
        [2] = "STANDING", 
        [3] = "RUNNING", 
        [4] = "WALKING", 
        [5] = "CROUCH", 
        [6] = "CROUCH-MOVE", 
        [7] = "AIR", 
        [8] = "AIR-CROUCH", 
        [9] = "FREESTANDING"
    }, 
    calibri = render.load_font("Calibri Bold", vector(25, 22, -1), "a, d"), 
    username = common.get_username(), 
    usernamelen = string.len(common.get_username())
};
v33 = {
    enableaanl = ui.find("Aimbot", "Anti Aim", "Angles", "Enabled"):visibility(false), 
    disable = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"):visibility(false), 
    pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"):visibility(false), 
    yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"):visibility(false), 
    base = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"), 
    yawoffset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"):visibility(false), 
    backstab = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab"):visibility(false), 
    hidden = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden"):visibility(false), 
    modifier = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"):visibility(false), 
    modoffset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"):visibility(false), 
    bodyyaw = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"):visibility(false), 
    inverter = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"):visibility(false), 
    leftlimit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"):visibility(false), 
    rightlimit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"):visibility(false), 
    options = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"):visibility(false), 
    bodyyawfs = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding"), 
    extended = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles"):visibility(false), 
    extendedpitch = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles", "Extended Pitch"):visibility(false), 
    extendedroll = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles", "Extended Roll"):visibility(false), 
    fs = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"):visibility(false), 
    fss = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Disable Yaw Modifiers"), 
    fsb = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Body Freestanding"), 
    fakeduck = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"), 
    sw = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"), 
    leg = ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"), 
    pa = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist"), 
    dt = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"), 
    hs = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"), 
    hslag = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options"), 
    dtlag = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"), 
    scope = ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay"), 
    fov = ui.find("Visuals", "World", "Main", "Field of View"), 
    weaponact = ui.find("Miscellaneous", "Main", "Other", "Weapon Actions"), 
    spike = ui.find("Miscellaneous", "Main", "Other", "Fake Latency"), 
    bodyaim = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim"), 
    dormant = ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot"), 
    min_damage_ui = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"), 
    dmg = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"), 
    clantag = ui.find("Miscellaneous", "Main", "In-Game", "Clan Tag"), 
    ragebot_find = ui.find("Aimbot", "Ragebot", "Main"), 
    hc_find = ui.find("Aimbot", "Ragebot", "Selection", "Hit Chance"), 
    ssg_hitchance = ui.find("Aimbot", "Ragebot", "Selection", "SSG-08", "Hit Chance"), 
    awp_hitchance = ui.find("Aimbot", "Ragebot", "Selection", "AWP", "Hit Chance"), 
    autosnipers_hitchance = ui.find("Aimbot", "Ragebot", "Selection", "AutoSnipers", "Hit Chance")
};
local _ = ui.find("Aimbot", "Anti Aim", "Angles"):label("\a{Link Active}\t\t\t\t\t\t\t\t\t    ignite\n\v\t\t\t\t\t\t\t   ~ changelog ~\n" .. ui.get_icon("fire-flame-curved") .. "\n- added addons\n- added offset manuals arrows\n- fixed logic offset modifier\n- minor defensive aa fix\n- minor bug fix\n- optimization fix \n");
v34 = {
    menu = l_pui_0.create(v44 .. ui.get_icon("house"), "\n\n\n\n\n\n\n\n\n", 1), 
    information = l_pui_0.create(v44 .. ui.get_icon("house"), "info\n", 1), 
    personal = l_pui_0.create(v44 .. ui.get_icon("house"), "\n\n\n\n", 1), 
    personalthemes = l_pui_0.create(v44 .. ui.get_icon("house"), "\n\n\n\n", 1), 
    updateloginfo = l_pui_0.create(v44 .. ui.get_icon("house"), "changelog\n\n\n\n\n\n\n\n\n\n", 1), 
    configuration = l_pui_0.create(v44 .. ui.get_icon("house"), "configs\n\n", 2), 
    general = l_pui_0.create(v44 .. ui.get_icon("house"), "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n", 2), 
    enable = l_pui_0.create(v44 .. ui.get_icon("shield-check"), "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n", 1), 
    enable1 = l_pui_0.create(v44 .. ui.get_icon("list"), "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n", 1), 
    states = l_pui_0.create(v44 .. ui.get_icon("shield-check"), "builder\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n", 1), 
    maincolor = l_pui_0.create(v44 .. ui.get_icon("list"), "main\n\n\n\n\n", 2), 
    antiaim = l_pui_0.create(v44 .. ui.get_icon("list"), "\n\n\n\n", 1), 
    banner = l_pui_0.create(v44 .. ui.get_icon("shield-check"), "switcher\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n", 2), 
    defensivetab = l_pui_0.create(v44 .. ui.get_icon("shield-check"), "addons", 2), 
    builder_tab = l_pui_0.create(v44 .. ui.get_icon("shield-check"), "hotkeys\n\n\n\n\n", 2), 
    yaw = l_pui_0.create(v44 .. ui.get_icon("shield-check"), "\n", 1), 
    miscswitcher = l_pui_0.create(v44 .. ui.get_icon("list"), "switcher\n\n\n\n\n\n\n\n\n\n\n", 1), 
    settings_visuals = l_pui_0.create(v44 .. ui.get_icon("list"), "visuals\n\n", 2), 
    settings_ragebot = l_pui_0.create(v44 .. ui.get_icon("list"), "ragebot\n\n\n", 2), 
    settings_misc = l_pui_0.create(v44 .. ui.get_icon("list"), "misc\n", 2), 
    settings_addons = l_pui_0.create(v44 .. ui.get_icon("list"), "addons\n\n\n\n", 1)
};
v35 = {
    info = {
        user = v34.information:label(v44 .. "\f<circle-user>  \rwelcome ~ " .. string.rep("", 0 - v32.usernamelen) .. v44 .. v32.username), 
        version = v34.information:label(v44 .. "\f<code-compare>  \r1.1 version ~" .. v44 .. " nightly"), 
        infochangelog = v34.updateloginfo:label("\aB8A487C8\f<calendar-lines-pen>  about update visit antiaim tab [nl]"), 
        reportbugs = v34.personal:label(v44 .. "\f<bug-slash> \rreport bugs"), 
        bags = v34.personal:button(v44 .. "\f<discord> \rdiscord server ", function()
            panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://discord.gg/BSxgQ6FUPy");
        end, true), 
        themes = v34.personalthemes:label(v44 .. "\f<pen-swirl>  \rthemes"), 
        themeslink1 = v34.personalthemes:button("\a81A939FF\f<circle-notch>", function()
            panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://neverlose.cc/getitem?c=rAeEanSzyIPPCNNU-9nu0-takmq");
        end, true):tooltip("green"), 
        themeslink2 = v34.personalthemes:button("\aC59EB3FF\f<circle-notch>\n", function()
            panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://neverlose.cc/getitem?c=vAyG1YAODZ4LTnxx-4n2Spn2Q0Z");
        end, true):tooltip("rose"), 
        themeslink3 = v34.personalthemes:button("\a9EA2C5FF\f<circle-notch>\n\n", function()
            panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://neverlose.cc/getitem?c=mufrQoxi4KkAzeOo-jOYvQ5mT7H");
        end, true):tooltip("blue"), 
        themeslink4 = v34.personalthemes:button("\aC59E9EFF\f<circle-notch>\n\n\n", function()
            panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://neverlose.cc/getitem?c=hj8gDvsp6td8mYDk-eEC84OygnY");
        end, true):tooltip("red"), 
        themeslink5 = v34.personalthemes:button("\aB19EC5FF\f<circle-notch>\n\n\n\n", function()
            panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://neverlose.cc/getitem?c=2K0JIXocQUs9ybxV-zu-dfr9ogB");
        end, true):tooltip("purple"), 
        themeslink6 = v34.personalthemes:button("\a646464FF\f<circle-notch>\n\n\n\n\n", function()
            panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://neverlose.cc/getitem?c=pnhi5sECXx5IxRK9-GMxWt2ZW2E");
        end, true):tooltip("grey"), 
        presets_list = v34.configuration:list("", presets_data.name), 
        presets_label = v34.configuration:label(v44 .. "\f<file-signature> \rconfig name ~ "), 
        presets_name = v34.configuration:input(""), 
        presets_aa = v34.configuration:button("\f<shield-check>", function()
            aa();
        end):tooltip("loading anti-aim"), 
        presets_misc = v34.configuration:button("\f<list>", function()
            misc();
        end):tooltip("loading miscellaneous"), 
        presets_create = v34.configuration:button(v44 .. "\f<square-plus>", function()
            create();
        end, true):tooltip("create"), 
        presets_save = v34.configuration:button(v44 .. "\f<floppy-disk>", function()
            save();
        end, true):tooltip("save"), 
        presets_remove = v34.configuration:button(v44 .. "\f<trash>", function()
            remove();
        end, true):tooltip("delete"), 
        presets_export = v34.configuration:button(v44 .. "\f<files>", function()
            export();
        end, true):tooltip("export"), 
        presets_import = v34.configuration:button(v44 .. "\f<file>", function()
            import();
        end, true):tooltip("import"), 
        presets_success_export = v34.configuration:label("\a388539ff\f<file-export>  successfully exported: \r"), 
        presets_success_import = v34.configuration:label("\a388539ff\f<file-import>  successfully imported: \r"), 
        presets_success_exist = v34.configuration:label("\a853838ff\f<triangle-exclamation>  preset already exist: \r"), 
        presets_success_importfailed = v34.configuration:label("\a853838ff\f<triangle-exclamation>  invalid preset \r")
    }, 
    antiaim = {
        enable = v34.enable:list("", {
            [1] = nil, 
            [2] = "builder", 
            [1] = v44 .. "off"
        }), 
        forceinterpolation = v34.settings_misc:switch("\aFFFF32C8\f<code-pull-request-draft>   force interpolation", false, "makes the game feel snoother by disabling specific engine mechanics then make the game reset the interpolation\n\n \aA8A85EFFthis feature can cause unexpected crashes. use at your own risk."), 
        backstab = v34.defensivetab:switch(v44 .. "\f<knife-kitchen>  \ravoid backstab", false, "turns the local player model to face the opponent with a knife to avoid being backstabbed."), 
        nofalldamage = v34.settings_misc:switch(v44 .. "\f<person-falling-burst>  \rno fall damage", false, "allows to safely fall from heights without taking any damage providing a gameplay advendage\n\nbad movement can cause the function to fail, as the source game engine does not allow for accurate calculation of landing time."), 
        ladder_select = v34.settings_misc:switch(v44 .. "\f<water-ladder>  \rfast ladder", false, "abuses the ladder movement mechanic and makes you move a little faster."), 
        antibruteforce = v34.defensivetab:switch(v44 .. "\f<shield-exclamation>  \ranti bruteforce", false, "when hit, either miss changes degree"), 
        smartteleport = v34.defensivetab:switch(v44 .. "\f<person-from-portal>  \rairlag", false, "By default, the double tap feature waits until the lag exploit has finished before teleporting you. Enabling this feature bypasses the wait time, but may leave you vulnerable to attacks during the teleportation process.", function(v116)
            return {
                tikslag = v116:slider("ticks", 1, 30, 15, 1, "t")
            }, true;
        end), 
        flickexploit = v34.defensivetab:switch(v44 .. "\f<retweet>  \rfake flick", false, function(v117)
            return {
                flicksettings = v117:listable("", {
                    [1] = "standing", 
                    [2] = "walking", 
                    [3] = "crouch", 
                    [4] = "air"
                })
            }, true;
        end), 
        safe = v34.defensivetab:switch(v44 .. "\f<face-head-bandage>  \rsafe function", false, function(v118)
            return {
                weapons = v118:listable("", {
                    [1] = "standing", 
                    [2] = "crouch", 
                    [3] = "air-crouch", 
                    [4] = "distance", 
                    [5] = "above enemy", 
                    [6] = "knife", 
                    [7] = "taser"
                })
            }, true;
        end), 
        fs = v34.builder_tab:switch(v44 .. "\f<group-arrows-rotate>  \rfreestanding"), 
        manual = v34.builder_tab:combo(v44 .. "\f<arrows-rotate>  \rmanual yaw", {
            [1] = "disabled", 
            [2] = "front", 
            [3] = "left", 
            [4] = "right"
        }, function(v119)
            return {
                static = v119:switch("static on manual")
            }, true;
        end), 
        conditions = v34.states:combo(v44 .. "\f<heat>  \rcondition", v32.cond, function(v120)
            return {
                base = v120:combo("base", {
                    [1] = "local view", 
                    [2] = "at target"
                }), 
                pitch = v120:combo("pitch", {
                    [1] = "down", 
                    [2] = "disabled", 
                    [3] = "fake down", 
                    [4] = "fake up"
                })
            };
        end)
    }, 
    misc = {
        miscenable = v34.miscswitcher:list("", {
            [1] = v44 .. "\f<wave-pulse>  \raimbot", 
            [2] = v44 .. "\f<pen>  \rvisuals", 
            [3] = v44 .. "\f<bars-sort>  \rmisc"
        }), 
        accent1 = v34.maincolor:color_picker(v44 .. "\f<swatchbook>  \raccent", color(188, 188, 188, 255)), 
        watermark32 = v34.maincolor:label(v44 .. "\f<bookmark>  \rwatermark", function(v121)
            return {
                watermarkstyle = v121:combo("style", {
                    [1] = "default", 
                    [2] = "modern", 
                    [3] = "custom"
                }), 
                watermarkstylename = v121:input("\rcustom name"), 
                watermark2 = v121:combo("position", {
                    [1] = "bottom", 
                    [2] = "left", 
                    [3] = "right"
                }), 
                watermarkfonts = v121:combo("font", {
                    [1] = "default", 
                    [2] = "pixel", 
                    [3] = "bold"
                })
            };
        end), 
        bars = v34.settings_visuals:switch(v44 .. "\f<bars>  500$ \aDEFAULTindicators", false, function(v122)
            -- upvalues: v44 (ref)
            return {
                skeetinropolation = v122:switch(v44 .. "G\rS" .. v44 .. " \rintropolation"), 
                keep_model_transparency = v122:switch("keep model transparency"), 
                skeetindstyle = v122:combo("style", {
                    [1] = "old", 
                    [2] = "modern"
                }), 
                mode = v122:listable("mode", {
                    [1] = "double tap", 
                    [2] = "hide shots", 
                    [3] = "dormant aimbot", 
                    [4] = "damage override", 
                    [5] = "hit/miss", 
                    [6] = "hitchance override", 
                    [7] = "lag compensation", 
                    [8] = "hitbox override", 
                    [9] = "fake latency", 
                    [10] = "fake angles", 
                    [11] = "fake duck", 
                    [12] = "body aim", 
                    [13] = "safe points", 
                    [14] = "freestanding", 
                    [15] = "bomb info"
                })
            }, true;
        end), 
        aspect = v34.settings_visuals:switch(v44 .. "\f<expand-wide>  \raspect ratio", false, function(v123)
            return {
                val = v123:slider("value ratio", 0, 250, 100, 0.01, function(v124)
                    if v124 == 0 then
                        return "disabled";
                    else
                        return;
                    end;
                end), 
                pre1 = v123:button(" 16:10 ", nil, true), 
                pre2 = v123:button(" 16:9 ", nil, true), 
                pre3 = v123:button(" 5:4 ", nil, true), 
                pre4 = v123:button(" 4:3 ", nil, true), 
                pre5 = v123:button(" 3:2 ", nil, true)
            }, true;
        end), 
        viewmodel = v34.settings_visuals:switch(v44 .. "\f<hand>  \rviewmodel changer", false, function(v125)
            return {
                fov = v125:slider("fov", 0, 200, 68), 
                x_axis = v125:slider("x", -100, 100, 0, 0.1), 
                y_axis = v125:slider("y", -100, 100, 0, 0.1), 
                z_axis = v125:slider("z", -100, 100, 0, 0.1)
            }, true;
        end), 
        scope = v34.settings_visuals:switch(v44 .. "\f<crosshairs>  \rscope overlay", false, function(v126)
            return {
                color = v126:combo("color", {
                    [1] = "default", 
                    [2] = "reversed"
                }, color(255)), 
                length = v126:slider("length", 0, 200, 75), 
                gap = v126:slider("gap", 0, 100, 10), 
                addons_scope = v126:selectable("addons", {
                    [1] = "animate zoom"
                })
            }, true;
        end), 
        hitmarkers = v34.settings_visuals:switch(v44 .. "\f<claw-marks>  \rhitmarkers", false, function(v127)
            return {
                hitmarkerselect = v127:listable("", {
                    [1] = "crosshair", 
                    [2] = "kibit"
                }), 
                kibitcolor = v127:color_picker("kibit color", color(88, 255, 209, 255))
            }, true;
        end), 
        mindmg = v34.settings_visuals:switch(v44 .. "\f<hundred-points>  \rdamage indicator", false, function(v128)
            -- upvalues: l_x_0 (ref), l_y_0 (ref)
            return {
                damage_color = v128:color_picker("color", color(255)), 
                damage_font = v128:combo("fonts", {
                    [1] = "default", 
                    [2] = "pixel", 
                    [3] = "bold"
                }), 
                damage_position_x = v128:slider("First", 38, l_x_0, 970), 
                damage_position_y = v128:slider("Second", 14, l_y_0, 515)
            }, true;
        end), 
        dormantaim = v34.settings_ragebot:switch(v44 .. "\f<skull>  \rdormant aimbot", false, function(v129)
            return {
                hitboxesda = v129:selectable("hitboxes", {
                    [1] = "head", 
                    [2] = "chest", 
                    [3] = "stomach", 
                    [4] = "legs"
                }), 
                hitchanceda = v129:slider("accuracy", 30, 85, 60, 1, "%"), 
                autoscopeda = v129:switch("auto scope", true), 
                autostopda = v129:switch("auto stop", true), 
                logsda = v129:switch("logs", false)
            }, true;
        end), 
        grenades = v34.settings_misc:switch(v44 .. "\f<bomb>  \rgrenades features", false, function(v130)
            return {
                nades = v130:listable("", {
                    [1] = "nade throw fix", 
                    [2] = "drop nades", 
                    [3] = "grenade release", 
                    [4] = "super toss"
                }), 
                selectnades = v130:listable("select drop nades", "molotov", "smoke", "nade"), 
                nadehotkey = v130:hotkey("hotkey"), 
                realese32 = v130:slider("amount", 0, 50, 0)
            }, true;
        end), 
        pingunlocker = v34.settings_ragebot:switch(v44 .. "\f<chart-simple>  \rping unlocker", false, "fake your ping to the server to shift your backtrack window.\n\nmaximum value for fake latency in neverlose is 100ms this function increases it to 200ms.", function(v131)
            return {
                pingunlockerslide = v131:slider("ping spike", 0, 200, 0, 1, "ms")
            }, true;
        end), 
        no_scope_mode = v34.settings_ragebot:switch(v44 .. "\f<crosshairs-simple>  \rno-scope hitchance override", false, function(v132)
            return {
                current_weapon = v132:list("\n", {
                    [1] = "ssg-08", 
                    [2] = "awp", 
                    [3] = "auto-snipers"
                }), 
                ssg_amount = v132:slider("amount", 0, 100, 0, 1, "%"), 
                awp_amount = v132:slider("amount", 0, 100, 0, 1, "%"), 
                autosnipers_amount = v132:slider("amount", 0, 100, 0, 1, "%")
            }, true;
        end), 
        air_mode = v34.settings_ragebot:switch(v44 .. "\f<dove>  \rair hitchance override", false, function(v133)
            return {
                current_weapon = v133:list("\n", {
                    [1] = "ssg-08", 
                    [2] = "awp", 
                    [3] = "auto-snipers"
                }), 
                ssg_amount = v133:slider("amount", 0, 100, 0, 1, "%"), 
                awp_amount = v133:slider("amount", 0, 100, 0, 1, "%"), 
                autosnipers_amount = v133:slider("amount", 0, 100, 0, 1, "%")
            }, true;
        end), 
        aimbotlogs = v34.settings_ragebot:switch(v44 .. "\f<square-kanban>  \raimbot logs", false, "logs hits and misses and displays them on the screen", function(v134)
            return {
                pos = v134:listable("position", {
                    [1] = "event", 
                    [2] = "console", 
                    [3] = "screen"
                }), 
                color = v134:color_picker("console color"), 
                limit = v134:slider("limit", 1, 20, 6), 
                time = v134:slider("time", 1, 20, 6), 
                offset = v134:slider("offset", 300, 500, 300), 
                logsaddons = v134:selectable("addons", {
                    [1] = "background", 
                    [2] = "glow"
                }), 
                custom_color = v134:switch("custom color"), 
                hit_color = v134:color_picker("hit color", color("52D449FF")), 
                miss_color = v134:color_picker("miss color", color("D44949FF"))
            }, true;
        end), 
        jumpscoutfix = v34.settings_ragebot:switch(v44 .. "\f<wrench>  \rjump shot"), 
        animbreakers = v34.settings_misc:switch(v44 .. "\f<layer-group>  \ranimations", false, function(v135)
            return {
                labelbreakers = v135:label("\aFFCD73FF\f<triangle-exclamation>  \r only works on the client side"), 
                addonsanim = v135:selectable("addons", {
                    [1] = "earthquake", 
                    [2] = "smoothing", 
                    [3] = "leaning on standing"
                }), 
                ground = v135:combo("ground", {
                    [1] = "disabled", 
                    [2] = "backward", 
                    [3] = "moonwalk", 
                    [4] = "flex", 
                    [5] = "bsod", 
                    [6] = "jitter"
                }), 
                jitterspeed = v135:slider("jitter speed", 0, 100, 100, nil, "%"), 
                jittervalue = v135:slider("jitter value #1", 0, 100, 100, nil, "%"), 
                jittervalue1 = v135:slider("jitter value #2", 0, 100, 100, nil, "%"), 
                air = v135:combo("air", {
                    [1] = "disabled", 
                    [2] = "static", 
                    [3] = "kangaroo", 
                    [4] = "moonwalk"
                }), 
                airvalue = v135:slider("air value", 0, 100, 100, 0.01, function(v136)
                    if v136 == 50 then
                        return "force";
                    elseif v136 == 100 then
                        return "maximum";
                    elseif v136 == 0 then
                        return "disabled";
                    else
                        return;
                    end;
                end), 
                movelean = v135:slider("move lean", 0, 100, 0, 1, function(v137)
                    if v137 == 100 then
                        return "extreme";
                    elseif v137 == 75 then
                        return "high";
                    elseif v137 == 50 then
                        return "medium";
                    elseif v137 == 25 then
                        return "low";
                    elseif v137 == 0 then
                        return "disabled";
                    else
                        return;
                    end;
                end)
            }, true;
        end), 
        crosshair = v34.settings_visuals:switch(v44 .. "\f<screencast>  \rcentered indicator", false, function(v138)
            return {
                style = v138:combo("style", {
                    [1] = "default", 
                    [2] = "pixel", 
                    [3] = "modern"
                }), 
                offset = v138:slider("offset", 0, 100, 200), 
                glowcross = v138:switch("glow")
            }, true;
        end), 
        ts = v34.settings_visuals:switch(v44 .. "\f<arrows-to-eye>  \rmanual arrows", false, function(v139)
            return {
                ts_type = v139:combo("style", "default", "modern", "ambani", "custom"), 
                left_manual = v139:input("left"), 
                right_manual = v139:input("right"), 
                forward_manual = v139:input("forward"), 
                font_manual = v139:combo("font manual", {
                    [1] = "default", 
                    [2] = "pixel", 
                    [3] = "bold"
                }), 
                offset_manual = v139:slider("offset", 0, 100, 0), 
                accent_color = v139:color_picker("color", color(255, 255, 255, 255))
            }, true;
        end), 
        addons_list = v34.settings_addons:listable("", {
            [1] = v44 .. "\f<shoe-prints>  \rdisable foot shadows", 
            [2] = v44 .. "\f<user-group>  \rfix chams color"
        }), 
        revolver = v34.settings_ragebot:switch(v44 .. "\f<gun-squirt>  \rrevolver helper"), 
        clantag = v34.settings_misc:switch(v44 .. "\f<tags>  \rclantag"), 
        trashtalk = v34.settings_misc:switch(v44 .. "\f<trash>  \rtrashtalk", false, function(v140)
            return {
                trashtalkmode = v140:listable("", {
                    [1] = "kill", 
                    [2] = "death", 
                    [3] = "revenge"
                })
            }, true;
        end)
    }
};
v35.misc.aimbotlogs.limit:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v35.misc.aimbotlogs.pos
});
v35.misc.aimbotlogs.time:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v35.misc.aimbotlogs.pos
});
v35.misc.aimbotlogs.offset:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v35.misc.aimbotlogs.pos
});
v35.misc.aimbotlogs.logsaddons:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v35.misc.aimbotlogs.pos
});
v35.misc.aimbotlogs.custom_color:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v35.misc.aimbotlogs.pos
});
v35.misc.aimbotlogs.hit_color:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v35.misc.aimbotlogs.pos
});
v35.misc.aimbotlogs.miss_color:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v35.misc.aimbotlogs.pos
});
v35.misc.ts.left_manual:depend({
    [1] = nil, 
    [2] = "custom", 
    [1] = v35.misc.ts.ts_type
});
v35.misc.ts.right_manual:depend({
    [1] = nil, 
    [2] = "custom", 
    [1] = v35.misc.ts.ts_type
});
v35.misc.ts.forward_manual:depend({
    [1] = nil, 
    [2] = "custom", 
    [1] = v35.misc.ts.ts_type
});
v35.misc.ts.font_manual:depend({
    [1] = nil, 
    [2] = "custom", 
    [1] = v35.misc.ts.ts_type
});
v35.misc.watermark32.watermarkstylename:depend({
    [1] = nil, 
    [2] = "custom", 
    [1] = v35.misc.watermark32.watermarkstyle
});
v35.misc.aimbotlogs.hit_color:depend({
    [1] = nil, 
    [2] = true, 
    [1] = v35.misc.aimbotlogs.custom_color
});
v35.misc.aimbotlogs.miss_color:depend({
    [1] = nil, 
    [2] = true, 
    [1] = v35.misc.aimbotlogs.custom_color
});
v35.misc.crosshair.glowcross:depend({
    [1] = nil, 
    [2] = "modern", 
    [1] = v35.misc.crosshair.style
});
v35.misc.hitmarkers.kibitcolor:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v35.misc.hitmarkers.hitmarkerselect
});
v35.misc.no_scope_mode.ssg_amount:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v35.misc.no_scope_mode.current_weapon
});
v35.misc.no_scope_mode.awp_amount:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v35.misc.no_scope_mode.current_weapon
});
v35.misc.no_scope_mode.autosnipers_amount:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v35.misc.no_scope_mode.current_weapon
});
v35.misc.air_mode.ssg_amount:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v35.misc.air_mode.current_weapon
});
v35.misc.air_mode.awp_amount:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v35.misc.air_mode.current_weapon
});
v35.misc.air_mode.autosnipers_amount:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v35.misc.air_mode.current_weapon
});
v34.settings_misc:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v35.misc.miscenable
});
v34.settings_ragebot:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v35.misc.miscenable
});
v34.settings_visuals:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v35.misc.miscenable
});
v34.maincolor:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v35.misc.miscenable
});
v35.misc.animbreakers.jitterspeed:depend({
    [1] = nil, 
    [2] = "jitter", 
    [1] = v35.misc.animbreakers.ground
});
v35.misc.animbreakers.jittervalue:depend({
    [1] = nil, 
    [2] = "jitter", 
    [1] = v35.misc.animbreakers.ground
});
v35.misc.animbreakers.jittervalue1:depend({
    [1] = nil, 
    [2] = "jitter", 
    [1] = v35.misc.animbreakers.ground
});
v35.misc.animbreakers.airvalue:depend({
    [1] = nil, 
    [2] = "static", 
    [1] = v35.misc.animbreakers.air
});
v35.misc.aimbotlogs.color:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v35.misc.aimbotlogs.pos
});
yaw_base_degree = function()
    -- upvalues: v35 (ref), v33 (ref)
    if v35.antiaim.manual:get() == "left" then
        v33.base:override("Local View");
        yaw = -90;
        v35.antiaim.fs:set(false);
    elseif v35.antiaim.manual:get() == "right" then
        v33.base:override("Local View");
        yaw = 90;
        v35.antiaim.fs:set(false);
    elseif v35.antiaim.manual:get() == "front" then
        v33.base:override("Local View");
        yaw = 180;
        v35.antiaim.fs:set(false);
    elseif v35.antiaim.manual:get() == "disabled" then
        v33.base:override("At Target");
        yaw = 0;
    end;
    return yaw;
end;
local v141 = {};
local v142 = {};
v141.font = render.load_font("Calibri Bold", 24, "ad");
v141.shots = 0;
v141.percentage = 0;
v141.sm1_is_dormant = false;
v141.bomb_image = render.load_image_from_file("materials/panorama/images/icons/ui/bomb_c4.svg", vector(30, 30));
draw_500_ = function(v143, v144, v145, v146, v147, v148, v149, v150)
    -- upvalues: v141 (ref)
    if v150 == nil then
        v150 = 255;
    end;
    local _ = render.screen_size().x;
    local l_y_1 = render.screen_size().y;
    local v153 = render.measure_text(v141.font, nil, v144);
    if v145 == nil and v146 == nil then
        render.gradient(vector(0, l_y_1 - 351 - v143), vector(29 + v153.x / 2, l_y_1 - 317 - v143), color(0, 0, 0, 0), color(0, 0, 0, 60), color(0, 0, 0, 0), color(0, 0, 0, 60), 0);
        render.gradient(vector(58 + v153.x, l_y_1 - 351 - v143), vector(29 + v153.x / 2, l_y_1 - 317 - v143), color(0, 0, 0, 0), color(0, 0, 0, 60), color(0, 0, 0, 0), color(0, 0, 0, 60), 0);
        render.text(v141.font, vector(29, l_y_1 - 343 - v143), color(v147, v148, v149, v150), nil, v144);
    elseif v145 ~= nil and v146 ~= nil then
        render.gradient(vector(0, l_y_1 - 351 - v143), vector(29 + v153.x / 2, l_y_1 - 317 - v143), color(0, 0, 0, 0), color(0, 0, 0, 60), color(0, 0, 0, 0), color(0, 0, 0, 60), 0);
        render.gradient(vector(58 + v153.x, l_y_1 - 351 - v143), vector(29 + v153.x / 2, l_y_1 - 317 - v143), color(0, 0, 0, 0), color(0, 0, 0, 60), color(0, 0, 0, 0), color(0, 0, 0, 60), 0);
        render.text(v141.font, vector(67, l_y_1 - 343 - v143), color(v147, v148, v149, v150), nil, v144);
        render.texture(v145, vector(29, l_y_1 - 347 - v143), vector(32, 28), color(v147, v148, v149, 255), f, 0);
        render.circle_outline(vector(99, l_y_1 - 334 - v143), color(10, 10, 10, 255), 10, 0, 1, 5);
        render.circle_outline(vector(99, l_y_1 - 334 - v143), color(255, 255, 255, 200), 9, 0, v146, 3);
    elseif v145 ~= nil and v146 == nil then
        render.gradient(vector(0, l_y_1 - 351 - v143), vector(29 + v153.x / 2, l_y_1 - 317 - v143), color(0, 0, 0, 0), color(0, 0, 0, 60), color(0, 0, 0, 0), color(0, 0, 0, 60), 0);
        render.gradient(vector(58 + v153.x, l_y_1 - 351 - v143), vector(29 + v153.x / 2, l_y_1 - 317 - v143), color(0, 0, 0, 0), color(0, 0, 0, 60), color(0, 0, 0, 0), color(0, 0, 0, 60), 0);
        render.text(v141.font, vector(67, l_y_1 - 343 - v143), color(v147, v148, v149, v150), nil, v144);
        render.texture(v145, vector(29, l_y_1 - 347 - v143), vector(32, 28), color(v147, v148, v149, 255), f, 0);
    end;
end;
v141.real_yaw = 0;
v141.positions = {};
v141.lc = false;
events.createmove:set(function(v154)
    -- upvalues: v141 (ref)
    local v155 = entity.get_local_player();
    local v156 = v155:get_origin();
    local v157 = 1 / globals.tickinterval;
    if v154.choked_commands == 0 then
        v141.positions[#v141.positions + 1] = v156;
        if v157 <= #v141.positions then
            v141.lc = (v156 - v141.positions[v157]):lengthsqr() > 4096;
        end;
    end;
    if v157 < #v141.positions then
        table.remove(v141.positions, 1);
    end;
    v141.is_jumping = v154.in_jump;
    if v154.choked_commands > 0 then
        return;
    else
        v141.real_yaw = v155.m_flPoseParameter[11] * 120 - 60;
        return;
    end;
end);
v142.screen_size = render.screen_size();
v142.dpi_scale = v142.screen_size / vector(1920, 1080);
v141.handle = function()
    -- upvalues: v35 (ref), v142 (ref), v21 (ref), v141 (ref), v23 (ref), v33 (ref)
    if not v35.misc.bars:get() then
        return;
    else
        local l_mode_0 = v35.misc.bars.mode;
        local v159 = entity.get_local_player();
        if v159 == nil then
            return;
        else
            local v160 = entity.get_entities("CPlantedC4", true)[1];
            local v161 = "";
            local v162 = 0;
            local v163 = false;
            local v164 = 0;
            local v165 = 0;
            local v166 = false;
            if v160 ~= nil then
                v162 = v160.m_flC4Blow - globals.curtime;
                v163 = v160.m_bBombDefused;
                if v162 > 0 and not v163 then
                    local v167 = v160.m_hBombDefuser ~= 4294967295;
                    local l_m_flDefuseLength_0 = v160.m_flDefuseLength;
                    local v169 = v160.m_hBombDefuser and v160.m_hBombDefuser.m_bIsDefusing or false;
                    local v170 = v167 and v169 and v160.m_flDefuseCountDown - globals.curtime or -1;
                    if v170 > 0 then
                        local v171 = v170 < v162 and color(58, 191, 54, 160) or color(252, 18, 19, 125);
                        local v172 = (v142.screen_size.y - 50) / l_m_flDefuseLength_0 * v170;
                        render.rect(vector(0, 0), vector(16, v142.screen_size.y), color(25, 25, 25, 160));
                        render.rect_outline(vector(0, 0), vector(16, v142.screen_size.y), color(25, 25, 25, 160));
                        render.rect(vector(0, v142.screen_size.y - v172), vector(16, v142.screen_size.y), v171);
                    end;
                    v161 = v160.m_nBombSite == 0 and "A" or "B";
                    local l_m_iHealth_0 = v159.m_iHealth;
                    local l_m_ArmorValue_0 = v159.m_ArmorValue;
                    local v175 = v160.m_vecOrigin:dist(v159.m_vecOrigin);
                    local v176 = 450.7;
                    local v177 = (v175 - 75.68) / 789.2;
                    v164 = v176 * math.exp(-v177 * v177);
                    if l_m_ArmorValue_0 > 0 then
                        local v178 = v164 * 0.5;
                        local v179 = (v164 - v178) * 0.5;
                        if l_m_ArmorValue_0 < v179 then
                            l_m_ArmorValue_0 = l_m_ArmorValue_0 * 2;
                            v178 = v164 - v179;
                        end;
                        v164 = v178;
                    end;
                    v165 = math.ceil(v164);
                    v166 = l_m_iHealth_0 <= v165;
                end;
            end;
            if v21.planting then
                v21.fill = 3.125 - (3.125 + v21.on_plant_time - globals.curtime);
                if v21.fill > 3.125 then
                    v21.fill = 3.125;
                end;
            end;
            v141.sm1_is_dormant = false;
            local v180 = entity.get_players(true, true);
            if not v180 then
                return;
            else
                for _, v182 in ipairs(v180) do
                    if v182:is_dormant() then
                        v141.sm1_is_dormant = true;
                    end;
                end;
                if not v35.misc.bars:get() then
                    return;
                else
                    local v183 = entity.get_local_player();
                    if v183 == nil then
                        return;
                    else
                        v142.get_bind = function(v184)
                            local v185 = false;
                            local v186 = 0;
                            local v187 = ui.get_binds();
                            for v188 = 1, #v187 do
                                if v187[v188].name == v184 and v187[v188].active then
                                    v185 = true;
                                    v186 = v187[v188].value;
                                end;
                            end;
                            return {
                                [1] = v185, 
                                [2] = v186
                            };
                        end;
                        v141.sm1_is_dormant = false;
                        local v189 = entity.get_players(true, true);
                        if not v189 then
                            return;
                        else
                            for _, v191 in ipairs(v189) do
                                if v191:is_dormant() then
                                    v141.sm1_is_dormant = true;
                                end;
                            end;
                            local v192 = entity.get_local_player();
                            if globals.is_connected == false or v192 == nil or v192:is_alive() == false then
                                return;
                            else
                                local l_m_iPing_0 = v192:get_resource().m_iPing;
                                local v194 = math.abs(l_m_iPing_0 % 360);
                                if v194 > 1 then
                                    v194 = 1;
                                end;
                                local v195 = 132 * v194 + 255 * (1 - v194);
                                local v196 = 196 * v194 + 255 * (1 - v194);
                                local v197 = 20 * v194 + 255 * (1 - v194);
                                local v198 = math.min(60, math.abs(v141.real_yaw)) / 60;
                                local v199 = 132 * v198 + 250 * (1 - v198);
                                local v200 = 196 * v198 + 15 * (1 - v198);
                                local v201 = 20 * v198 + 15 * (1 - v198);
                                local v202 = 0;
                                local _ = render.screen_size().x;
                                local _ = render.screen_size().y;
                                if v35.misc.bars.skeetindstyle:get() == "old" and l_mode_0:get("Fake Latency") and v23.ping:get() and v35.misc.pingunlocker.pingunlockerslide:get() > 0 then
                                    draw_500_(v202, "PING", nil, nil, v195, v196, v197, 255);
                                    v202 = v202 + 42;
                                end;
                                if v35.misc.bars.skeetindstyle:get() == "old" and l_mode_0:get("Hide Shots") and v23.hs:get() and not v23.dt:get() then
                                    draw_500_(v202, "OSAA", nil, nil, 255, 255, 255, 200);
                                    v202 = v202 + 42;
                                end;
                                if v35.misc.bars.skeetindstyle:get() == "old" and l_mode_0:get("Double Tap") and v23.dt:get() and not v23.fd:get() then
                                    if rage.exploit:get() == 1 then
                                        draw_500_(v202, "DT", nil, nil, 255, 255, 255, 200);
                                        v202 = v202 + 42;
                                    else
                                        draw_500_(v202, "DT", nil, nil, 255, 0, 50, 255);
                                        v202 = v202 + 42;
                                    end;
                                end;
                                if v35.misc.bars.skeetindstyle:get() == "old" and l_mode_0:get("Dormant Aimbot") and v33.dormant:get() and v35.misc.dormantaim:get() then
                                    if v141.sm1_is_dormant then
                                        draw_500_(v202, "DA", nil, nil, 255, 255, 255, 200);
                                        v202 = v202 + 42;
                                    else
                                        draw_500_(v202, "DA", nil, nil, 255, 0, 50, 255);
                                        v202 = v202 + 42;
                                    end;
                                end;
                                if v35.misc.bars.skeetindstyle:get() == "old" and l_mode_0:get("Lag Compensation") then
                                    local l_v141_0 = v141;
                                    local l_v141_1 = v141;
                                    local l_v141_2 = v141;
                                    local l_v141_3 = v141;
                                    local v209 = 240;
                                    local v210 = 15;
                                    local v211 = 15;
                                    l_v141_3.a = 240;
                                    l_v141_2.b = v211;
                                    l_v141_1.g = v210;
                                    l_v141_0.r = v209;
                                    l_v141_0 = bit.band(v192.m_fFlags, bit.lshift(1, 0)) == 0 or v141.is_jumping;
                                    if v141.lc then
                                        l_v141_1 = v141;
                                        l_v141_2 = v141;
                                        l_v141_3 = v141;
                                        v209 = 132;
                                        v210 = 196;
                                        l_v141_3.b = 20;
                                        l_v141_2.g = v210;
                                        l_v141_1.r = v209;
                                    end;
                                    if l_v141_0 and math.sqrt(v192.m_vecVelocity.x ^ 2 + v192.m_vecVelocity.y ^ 2) > 230 then
                                        draw_500_(v202, "LC", nil, nil, v141.r, v141.g, v141.b, v141.a);
                                        v202 = v202 + 42;
                                    end;
                                end;
                                if v35.misc.bars.skeetindstyle:get() == "old" and l_mode_0:get("Fake Angles") then
                                    draw_500_(v202, "FAKE", nil, nil, v199, v200, v201, 255);
                                    v202 = v202 + 42;
                                end;
                                if v35.misc.bars.skeetindstyle:get() == "old" and l_mode_0:get("Safe Points") and v23.safe:get() == "Force" then
                                    draw_500_(v202, "SAFE", nil, nil, 255, 255, 255, 200);
                                    v202 = v202 + 42;
                                end;
                                if v35.misc.bars.skeetindstyle:get() == "old" and l_mode_0:get("Body Aim") and v23.body:get() == "Force" then
                                    draw_500_(v202, "BODY", nil, nil, 255, 255, 255, 200);
                                    v202 = v202 + 42;
                                end;
                                if v35.misc.bars.skeetindstyle:get() == "old" and l_mode_0:get("Fake Duck") and v23.fd:get() then
                                    draw_500_(v202, "DUCK", nil, nil, 255, 255, 255, 200);
                                    v202 = v202 + 42;
                                end;
                                if v35.misc.bars.skeetindstyle:get() == "old" and l_mode_0:get("Damage Override") and v142.get_bind("Min. Damage")[1] then
                                    draw_500_(v202, "MD", nil, nil, 255, 255, 255, 200);
                                    v202 = v202 + 42;
                                end;
                                if v35.misc.bars.skeetindstyle:get() == "old" and l_mode_0:get("Freestanding") and v23.fs:get_override() then
                                    draw_500_(v202, "FS", nil, nil, 255, 255, 255, 200);
                                    v202 = v202 + 42;
                                end;
                                if v35.misc.bars.skeetindstyle:get() == "old" and l_mode_0:get("Hit/Miss") then
                                    draw_500_(v202, tostring(v141.percentage) .. "%", nil, nil, 255, 255, 255, 200);
                                    v202 = v202 + 42;
                                end;
                                if v35.misc.bars.skeetindstyle:get() == "old" and l_mode_0:get("Bomb Info") and v162 > 0 and not v163 then
                                    draw_500_(v202, v161 .. " - " .. string.format("%.1f", v162) .. "s              ", v141.bomb_image, nil, 255, 255, 255, 200);
                                    v202 = v202 + 42;
                                end;
                                if v35.misc.bars.skeetindstyle:get() == "old" and l_mode_0:get("Bomb Info") and v21.planting then
                                    draw_500_(v202, v21.planting_site .. "              ", v141.bomb_image, v21.fill / 3.125, 252, 243, 105, 255);
                                    v202 = v202 + 42;
                                end;
                                if v35.misc.bars.skeetindstyle:get() == "old" and l_mode_0:get("Bomb Info") and v183:is_alive() and v166 then
                                    draw_500_(v202, "FATAL", nil, nil, 255, 0, 50, 255);
                                    v202 = v202 + 42;
                                end;
                                if v35.misc.bars.skeetindstyle:get() == "old" and l_mode_0:get("Bomb Info") and v183:is_alive() and not v166 and v164 > 0.5 then
                                    draw_500_(v202, "-" .. v165 .. " HP", nil, nil, 252, 243, 105, 255);
                                    v202 = v202 + 42;
                                end;
                                if v35.misc.bars.skeetindstyle:get() == "old" and l_mode_0:get("Hitchance Override") and v142.get_bind("Hit Chance")[1] then
                                    draw_500_(v202, "HITCHANCE OVR", nil, nil, 255, 255, 255, 200);
                                    v202 = v202 + 42;
                                end;
                                if v35.misc.bars.skeetindstyle:get() == "old" and l_mode_0:get("Hitbox Override") and v142.get_bind("Hitboxes")[1] then
                                    draw_500_(v202, "HITBOX OVR", nil, nil, 255, 255, 255, 200);
                                    v202 = v202 + 42;
                                end;
                                if v35.misc.bars.skeetindstyle:get() == "modern" then
                                    if v35.misc.bars.skeetindstyle:get() == "modern" and l_mode_0:get("Fake Latency") and v23.ping:get() and v35.misc.pingunlocker.pingunlockerslide:get() > 0 then
                                        draw_500_(v202, ui.get_icon("globe") .. " PING", nil, nil, v195, v196, v197, 255);
                                        v202 = v202 + 42;
                                    end;
                                    if v35.misc.bars.skeetindstyle:get() == "modern" and l_mode_0:get("Hide Shots") and v23.hs:get() and not v23.dt:get() then
                                        draw_500_(v202, ui.get_icon("shield") .. " OSAA", nil, nil, 255, 255, 255, 200);
                                        v202 = v202 + 42;
                                    end;
                                    if v35.misc.bars.skeetindstyle:get() == "modern" and l_mode_0:get("Double Tap") and v23.dt:get() and not v23.fd:get() then
                                        if rage.exploit:get() == 1 then
                                            draw_500_(v202, ui.get_icon("split") .. " DT", nil, nil, 255, 255, 255, 200);
                                            v202 = v202 + 42;
                                        else
                                            draw_500_(v202, ui.get_icon("split") .. " DT", nil, nil, 255, 0, 50, 255);
                                            v202 = v202 + 42;
                                        end;
                                    end;
                                    if v35.misc.bars.skeetindstyle:get() == "modern" and l_mode_0:get("Dormant Aimbot") and v33.dormant:get() or v35.misc.dormantaim:get() then
                                        if v141.sm1_is_dormant then
                                            draw_500_(v202, ui.get_icon("slider") .. " DA", nil, nil, 255, 255, 255, 200);
                                            v202 = v202 + 42;
                                        else
                                            draw_500_(v202, ui.get_icon("slider") .. " DA", nil, nil, 255, 0, 50, 255);
                                            v202 = v202 + 42;
                                        end;
                                    end;
                                    if v35.misc.bars.skeetindstyle:get() == "modern" and l_mode_0:get("Lag Compensation") then
                                        local l_v141_4 = v141;
                                        local l_v141_5 = v141;
                                        local l_v141_6 = v141;
                                        local l_v141_7 = v141;
                                        local v216 = 240;
                                        local v217 = 15;
                                        local v218 = 15;
                                        l_v141_7.a = 240;
                                        l_v141_6.b = v218;
                                        l_v141_5.g = v217;
                                        l_v141_4.r = v216;
                                        l_v141_4 = bit.band(v192.m_fFlags, bit.lshift(1, 0)) == 0 or v141.is_jumping;
                                        if v141.lc then
                                            l_v141_5 = v141;
                                            l_v141_6 = v141;
                                            l_v141_7 = v141;
                                            v216 = 132;
                                            v217 = 196;
                                            l_v141_7.b = 20;
                                            l_v141_6.g = v217;
                                            l_v141_5.r = v216;
                                        end;
                                        if l_v141_4 and math.sqrt(v192.m_vecVelocity.x ^ 2 + v192.m_vecVelocity.y ^ 2) > 230 then
                                            draw_500_(v202, ui.get_icon("hammer-crash") .. " LC", nil, nil, v141.r, v141.g, v141.b, v141.a);
                                            v202 = v202 + 42;
                                        end;
                                    end;
                                    if v35.misc.bars.skeetindstyle:get() == "modern" and l_mode_0:get("Fake Angles") then
                                        draw_500_(v202, ui.get_icon("face-viewfinder") .. " FAKE", nil, nil, v199, v200, v201, 255);
                                        v202 = v202 + 42;
                                    end;
                                    if v35.misc.bars.skeetindstyle:get() == "modern" and l_mode_0:get("Safe Points") and v23.safe:get() == "Force" then
                                        draw_500_(v202, ui.get_icon("shield") .. " SAFE", nil, nil, 255, 255, 255, 200);
                                        v202 = v202 + 42;
                                    end;
                                    if v35.misc.bars.skeetindstyle:get() == "modern" and l_mode_0:get("Body Aim") and v23.body:get() == "Force" then
                                        draw_500_(v202, ui.get_icon("user-lock") .. " BODY", nil, nil, 255, 255, 255, 200);
                                        v202 = v202 + 42;
                                    end;
                                    if v35.misc.bars.skeetindstyle:get() == "modern" and l_mode_0:get("Fake Duck") and v23.fd:get() then
                                        draw_500_(v202, ui.get_icon("arrow-down-short-wide") .. " DUCK", nil, nil, 255, 255, 255, 200);
                                        v202 = v202 + 42;
                                    end;
                                    if v35.misc.bars.skeetindstyle:get() == "modern" and l_mode_0:get("Damage Override") and v142.get_bind("Min. Damage")[1] then
                                        draw_500_(v202, ui.get_icon("sliders-simple") .. " MD", nil, nil, 255, 255, 255, 200);
                                        v202 = v202 + 42;
                                    end;
                                    if v35.misc.bars.skeetindstyle:get() == "modern" and l_mode_0:get("Freestanding") and v23.fs:get_override() then
                                        draw_500_(v202, ui.get_icon("user-group") .. " FS", nil, nil, 255, 255, 255, 200);
                                        v202 = v202 + 42;
                                    end;
                                    if v35.misc.bars.skeetindstyle:get() == "modern" and l_mode_0:get("Hit/Miss") then
                                        draw_500_(v202, tostring(v141.percentage) .. "%", nil, nil, 255, 255, 255, 200);
                                        v202 = v202 + 42;
                                    end;
                                    if v35.misc.bars.skeetindstyle:get() == "modern" and l_mode_0:get("Bomb Info") and v162 > 0 and not v163 then
                                        draw_500_(v202, v161 .. " - " .. string.format("%.1f", v162) .. "s              ", v141.bomb_image, nil, 255, 255, 255, 200);
                                        v202 = v202 + 42;
                                    end;
                                    if v35.misc.bars.skeetindstyle:get() == "modern" and l_mode_0:get("Bomb Info") and v21.planting then
                                        draw_500_(v202, v21.planting_site .. "              ", v141.bomb_image, v21.fill / 3.125, 252, 243, 105, 255);
                                        v202 = v202 + 42;
                                    end;
                                    if v35.misc.bars.skeetindstyle:get() == "modern" and l_mode_0:get("Bomb Info") and v183:is_alive() and v166 then
                                        draw_500_(v202, "FATAL", nil, nil, 255, 0, 50, 255);
                                        v202 = v202 + 42;
                                    end;
                                    if v35.misc.bars.skeetindstyle:get() == "modern" and l_mode_0:get("Bomb Info") and v183:is_alive() and not v166 and v164 > 0.5 then
                                        draw_500_(v202, "-" .. v165 .. " HP", nil, nil, 252, 243, 105, 255);
                                        v202 = v202 + 42;
                                    end;
                                    if v35.misc.bars.skeetindstyle:get() == "modern" and l_mode_0:get("Hitchance Override") and v142.get_bind("Hit Chance")[1] then
                                        draw_500_(v202, ui.get_icon("spider-black-widow") .. " HC", nil, nil, 255, 255, 255, 200);
                                        v202 = v202 + 42;
                                    end;
                                    if v35.misc.bars.skeetindstyle:get() == "modern" and l_mode_0:get("Hitbox Override") and v142.get_bind("Hitboxes")[1] then
                                        draw_500_(v202, ui.get_icon("person") .. " HITBOX OVR", nil, nil, 255, 255, 255, 200);
                                        v202 = v202 + 42;
                                    end;
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
v21 = {};
v21.reset = function()
    -- upvalues: v21 (ref)
    v21.planting = false;
    v21.fill = 0;
    v21.on_plant_time = 0;
    v21.planting_site = "";
end;
v21.bomb_beginplant = function(v219)
    -- upvalues: v21 (ref)
    local v220 = entity.get_player_resource();
    if v220 == nil then
        return;
    else
        v21.on_plant_time = globals.curtime;
        v21.planting = true;
        local l_m_bombsiteCenterA_0 = v220.m_bombsiteCenterA;
        local l_m_bombsiteCenterB_0 = v220.m_bombsiteCenterB;
        local v223 = entity.get(v219.userid, true):get_origin();
        v21.planting_site = v223:dist(l_m_bombsiteCenterA_0) < v223:dist(l_m_bombsiteCenterB_0) and "A" or "B";
        return;
    end;
end;
local l_mtools_1 = require("neverlose/mtools");
local l_aim_0 = require("neverlose/anti_aim");
local v226 = render.screen_size();
local v227 = {
    DT = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"), 
    DMG = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"), 
    PEEK = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist"), 
    OSAA = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"), 
    SAFE = ui.find("Aimbot", "Ragebot", "Safety", "Safe Points"), 
    BODY = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim"), 
    FS = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding")
};
DesyncGet = function()
    local v228 = rage.antiaim:get_rotation(true);
    local v229 = rage.antiaim:get_rotation();
    local v230 = math.min(math.abs(v229 - v228) / 2, 60);
    return string.format("%.1f", v230);
end;
DrawIndicators = function(v231)
    -- upvalues: l_aim_0 (ref), v35 (ref), l_mtools_1 (ref), v226 (ref), v227 (ref)
    local v232 = entity.get_local_player();
    if v232 == nil or not v232:is_alive() then
        return;
    else
        local _ = {
            Inverter = l_aim_0.get_inverter_state()
        };
        local v234 = v35.misc.accent1:get();
        local v235 = l_mtools_1.Animation:Lerp("Indicators", "Vector", v232.m_bIsScoped, vector(v226.x / 2, v226.y / 2 + 24 + v231), vector(v226.x / 2 + 39, v226.y / 2 + 24 + v231));
        render.text(2, v235, v234, "c", ui.get_icon("fire-flame-curved") .. "  IGNITE");
        local v236 = {
            IDEALTICK = l_mtools_1.Animation:Lerp("Indicators", "Anim.IDEALTICK", not v227.DT:get() or not v227.PEEK:get())
        };
        v236.DT = l_mtools_1.Animation:Lerp("Indicators", "Anim.DT", not v227.DT:get() or v236.IDEALTICK ~= 0);
        v236.PEEK = l_mtools_1.Animation:Lerp("Indicators", "Anim.PEEK", not v227.PEEK:get() or v236.IDEALTICK ~= 0);
        v236.OSAA = l_mtools_1.Animation:Lerp("Indicators", "Anim.HS", not v227.OSAA:get());
        render.text(2, v235 + vector(0, 5 + 4 * v236.IDEALTICK), color(255, 255, 255, 255 * v236.IDEALTICK), "c", "IDEALTICK");
        render.text(2, v235 + vector(0, 5 + 4 * v236.DT), color(255, 255, 255, 255 * v236.DT), "c", "DT");
        render.text(2, v235 + vector(0, 5 + 4 * v236.PEEK), color(255, 255, 255, 255 * v236.PEEK), "c", "PEEK");
        local v237 = l_mtools_1.Animation:Lerp("Indicators", "Anim.UP1", v236.IDEALTICK + v236.DT + v236.PEEK <= 0);
        render.text(2, v235 + vector(0, 5 + 9 * v237 + 4 * v236.OSAA), color(255, 255, 255, 255 * v236.OSAA), "c", "HIDE");
        local _ = v237 + v236.OSAA;
        return;
    end;
end;
events.render:set(function()
    -- upvalues: v35 (ref), l_mtools_1 (ref)
    local v239 = v35.misc.crosshair.style:get();
    local v240 = v35.misc.crosshair:get();
    local v241 = 0;
    if v240 then
        v241 = v35.misc.crosshair.offset:get() or 0;
    else
        v35.misc.crosshair.offset:set(0);
    end;
    if v240 and v239 == "pixel" then
        l_mtools_1.Animation:Register("Indicators");
        l_mtools_1.Animation:Update("Indicators", 7.5);
        DrawIndicators(v241);
    end;
end);
calculate_distance = function(v242, v243, v244, v245, v246, v247)
    return math.ceil(math.sqrt(math.pow(v242 - v245, 2) + math.pow(v243 - v246, 2) + math.pow(v244 - v247, 2)));
end;
helper_get_dist = function(v248, v249)
    if not globals.is_in_game then
        return;
    elseif v248 == nil then
        return;
    elseif v249 == nil then
        return;
    else
        local v250 = v248:get_player_weapon();
        if v250 == nil then
            return;
        else
            local v251 = v250:get_weapon_index();
            if v251 == nil then
                return;
            else
                local l_m_vecOrigin_0 = v248.m_vecOrigin;
                local l_m_vecOrigin_1 = v249.m_vecOrigin;
                local v254 = calculate_distance(l_m_vecOrigin_0.x, l_m_vecOrigin_0.y, l_m_vecOrigin_0.z, l_m_vecOrigin_1.x, l_m_vecOrigin_1.y, l_m_vecOrigin_1.z);
                local v255 = v249.m_ArmorValue == 0;
                if v251 ~= 64 or not v255 then
                    return 0;
                elseif v254 < 585 and v254 > 511 then
                    return 1;
                elseif v254 < 511 then
                    return 2;
                else
                    return 0;
                end;
            end;
        end;
    end;
end;
helper_create_flag = esp.enemy:new_text("R8 Helper", "DMG+", function(v256)
    local v257 = entity.get_local_player();
    if not v257:is_alive() then
        return;
    else
        if v256 ~= nil and v256 ~= v257 then
            local v258 = helper_get_dist(v257, v256);
            local _ = helper_get_dist(v256, v257);
            if v258 ~= 0 and v258 ~= nil then
                if v258 == 1 then
                    return "DMG";
                else
                    return "DMG+";
                end;
            end;
        end;
        return;
    end;
end);
helper_create_line = function()
    if not globals.is_in_game then
        return;
    else
        local v260 = entity.get_local_player();
        if not v260:is_alive() then
            return;
        else
            local v261 = entity.get_players(true, false);
            for v262 = 1, #v261 do
                local v263 = v261[v262];
                if v263 ~= v260 and v263:is_alive() and v263 ~= nil and v263 ~= v260 then
                    local v264 = helper_get_dist(v263, v260);
                    if v264 ~= 0 and v264 ~= nil then
                        local v265 = render.world_to_screen(v263:get_hitbox_position(4));
                        if v265 == nil then
                            return;
                        else
                            render.line(v265, vector(render.screen_size().x / 2, render.screen_size().y), color(255, 11, 11, 255));
                        end;
                    end;
                end;
            end;
            return;
        end;
    end;
end;
helper_setup = function()
    -- upvalues: v35 (ref)
    if v35.misc.revolver:get() then
        helper_create_flag:set(true);
        helper_create_line();
    end;
end;
events.render:set(helper_setup);
localplayer_transparency = function()
    -- upvalues: v35 (ref)
    local v266 = entity.get_local_player();
    if v266 == nil or not v266:is_alive() then
        return;
    elseif v35.misc.bars.keep_model_transparency:get() then
        return (not not v266.m_bIsScoped or v266.m_bResumeZoom) and 100 or 255;
    else
        return;
    end;
end;
events.localplayer_transparency:set(localplayer_transparency);
local _ = {
    head = 0, 
    neck = 1, 
    pelvis = 2, 
    stomach = 3, 
    lower_chest = 4, 
    chest = 5, 
    upper_chest = 6, 
    left_thigh = 7, 
    right_thigh = 8, 
    left_calf = 9, 
    right_calf = 10, 
    left_foot = 11, 
    right_foot = 12, 
    left_hand = 13, 
    right_hand = 14, 
    left_upper_arm = 15, 
    left_forearm = 16, 
    right_upper_arm = 17, 
    right_forearm = 18
};
local v360 = new_class():struct("consts")({
    WEAPONTYPE_MACHINEGUN = 6, 
    WEAPONTYPE_SNIPER_RIFLE = 5, 
    WEAPONTYPE_SHOTGUN = 4, 
    WEAPONTYPE_RIFLE = 3, 
    WEAPONTYPE_SUBMACHINEGUN = 2, 
    WEAPONTYPE_PISTOL = 1, 
    WEAPONTYPE_KNIFE = 0, 
    WEAPONTYPE_UNKNOWN = -1, 
    WEAPONTYPE_HEALTHSHOT = 11, 
    WEAPONTYPE_GRENADE = 9, 
    WEAPONTYPE_TASER = 8, 
    WEAPONTYPE_C4 = 7, 
    hbox_radius = {
        [1] = 4.2, 
        [2] = 3.5, 
        [3] = 6, 
        [4] = 6, 
        [5] = 6.5, 
        [6] = 6.2, 
        [7] = 5, 
        [8] = 5, 
        [9] = 5, 
        [10] = 4, 
        [11] = 4, 
        [12] = 3.6, 
        [13] = 3.7, 
        [14] = 4, 
        [15] = 4, 
        [16] = 3.3, 
        [17] = 3, 
        [18] = 3.3, 
        [19] = 3
    }, 
    hbox_factor = {
        [1] = 0.5, 
        [2] = 0.1, 
        [3] = 0.8, 
        [4] = 0.8, 
        [5] = 0.7, 
        [6] = 0.7, 
        [7] = 0.7, 
        [8] = 0.5, 
        [9] = 0.5, 
        [10] = 0.5, 
        [11] = 0.5, 
        [12] = 0.4, 
        [13] = 0.4, 
        [14] = 0.4, 
        [15] = 0.4, 
        [16] = 0.5, 
        [17] = 0.5, 
        [18] = 0.5, 
        [19] = 0.5
    }, 
    hitgroup_str = {
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
    }
}):struct("aimbot_shot")({}):struct("variables")({
    hbox_state = {
        [1] = false, 
        [2] = false, 
        [3] = false, 
        [4] = false, 
        [5] = false, 
        [6] = false, 
        [7] = false, 
        [8] = false, 
        [9] = false, 
        [10] = false, 
        [11] = false, 
        [12] = false, 
        [13] = false, 
        [14] = false, 
        [15] = false, 
        [16] = false, 
        [17] = false, 
        [18] = false, 
        [19] = false
    }, 
    is_reachable = {}, 
    initialize = function(v268, v269)
        -- upvalues: v33 (ref), v35 (ref)
        v268.cmd = v269;
        v268.lp = entity.get_local_player();
        v268.eyepos = v268.lp:get_eye_position();
        v268.weapon = v268.lp:get_player_weapon();
        v268.weapon_info = v268.weapon:get_weapon_info();
        v268.weapon_type = v268.weapon_info.weapon_type;
        v268.range_modifier = v268.weapon_info.range_modifier;
        v268.armor_resist = 1 - v268.weapon_info.armor_ratio * 0.5;
        v268.camera_position = render.camera_position();
        v268.camera_direction = vector():angles(render.camera_angles());
        v268.mindmg = v33.min_damage_ui:get();
        v268.minhc = v35.misc.dormantaim.hitchanceda:get();
        v268.dmg_is_wrong = false;
    end
}):struct("aimbot")({
    get_hitgroup_index = function(_, v271)
        if v271 == 1 then
            return 1;
        elseif v271 == 2 then
            return 8;
        elseif v271 >= 3 and v271 <= 4 then
            return 3;
        elseif v271 >= 5 and v271 <= 7 then
            return 2;
        elseif v271 >= 8 and v271 <= 13 then
            if v271 % 2 == 0 then
                return 6;
            else
                return 7;
            end;
        elseif v271 >= 14 and v271 <= 19 then
            if v271 % 2 == 1 then
                return 4;
            else
                return 5;
            end;
        else
            return 0;
        end;
    end, 
    get_hitgroup_name = function(v272, v273)
        return v272.consts.hitgroup_str[v272:get_hitgroup_index(v273)];
    end, 
    get_damage_multiplier = function(v274, v275)
        local v276 = v274:get_hitgroup_name(v275);
        if v276 == "head" then
            return 4;
        elseif v276 == "stomach" then
            return 1.25;
        elseif v276 == "left leg" or v276 == "right leg" then
            return 0.75;
        else
            return 1;
        end;
    end, 
    get_weighted_damage = function(v277, v278, v279)
        local v280 = v277:get_hitgroup_name(v278);
        if v280 == "head" or v280 == "neck" then
            return v279 * 0.125;
        elseif v280 == "legs" then
            return v279 * 0.25;
        elseif v280 == "chest" then
            return v279 * 0.67;
        elseif v280 == "stomach" then
            return v279;
        else
            return 0;
        end;
    end, 
    get_hbox_radius = function(v281, v282)
        if v282 == nil then
            return 0;
        else
            return v281.consts.hbox_radius[v282] * v281.consts.hbox_factor[v282];
        end;
    end, 
    calculate_hc = function(v283, v284, v285, v286)
        if v284 < 1.0E-6 then
            return 1;
        else
            local v287 = v283.variables.eyepos:dist(v285) * math.tan(v284 * 0.5);
            return math.min(v286 * v286 / (v287 * v287), 1);
        end;
    end, 
    max_hc = function(v288, v289, v290)
        -- upvalues: v35 (ref)
        if v288.variables.weapon_type == v288.consts.WEAPONTYPE_SNIPER_RIFLE and (v35.misc.dormantaim.autoscopeda:get() or v288.variables.lp.m_bIsScoped) then
            if v288.variables.cmd.in_duck == 1 then
                return v288:calculate_hc(v288.variables.weapon_info.inaccuracy_crouch_alt, v289, v290);
            else
                return v288:calculate_hc(v288.variables.weapon_info.inaccuracy_stand_alt, v289, v290);
            end;
        elseif v288.variables.cmd.in_duck == 1 then
            return v288:calculate_hc(v288.variables.weapon_info.inaccuracy_crouch, v289, v290);
        else
            return v288:calculate_hc(v288.variables.weapon_info.inaccuracy_stand, v289, v290);
        end;
    end, 
    sign = function(_, v292)
        return v292 >= 0 and 1 or -1;
    end, 
    vector_ratio = function(v293, v294, v295)
        local v296 = nil;
        if v293:sign(v294.x) == v293:sign(v295.x) and v293:sign(v294.y) == v293:sign(v295.y) and v293:sign(v294.z) == v293:sign(v295.z) then
            v296 = false;
        elseif v293:sign(v294.x) ~= v293:sign(v295.x) and v293:sign(v294.y) ~= v293:sign(v295.y) and v293:sign(v294.z) ~= v293:sign(v295.z) then
            v296 = true;
        else
            return nil;
        end;
        v294 = vector(math.abs(v294.x), math.abs(v294.y), math.abs(v294.z));
        v295 = vector(math.abs(v295.x), math.abs(v295.y), math.abs(v295.z));
        local v297 = (v294.x - 0.05) / (v295.x + 0.05);
        local v298 = (v294.x + 0.05) / (v295.x - 0.05);
        local v299 = (v294.y - 0.05) / (v295.y + 0.05);
        local v300 = (v294.y + 0.05) / (v295.y - 0.05);
        local v301 = (v294.z - 0.05) / (v295.z + 0.05);
        local v302 = (v294.z + 0.05) / (v295.z - 0.05);
        local v303 = math.max(v297, v299, v301);
        local v304 = math.min(v298, v300, v302);
        if v303 <= v304 then
            local v305 = v303 + (v304 - v303) * 0.5;
            local v306;
            if not -v305 or not v296 then
                v306 = v305;
            else
                v306 = v296;
            end;
            return v306;
        else
            return nil;
        end;
    end, 
    calc_true_damage = function(v307, v308, v309, v310, v311)
        local v312, v313 = utils.trace_bullet(v307.variables.lp, v307.variables.eyepos, v309);
        if v312 == 0 then
            local v314 = v307:vector_ratio(v309 - v307.variables.eyepos, v313.end_pos - v307.variables.eyepos);
            if v314 ~= nil and v314 < 1 then
                return -1;
            end;
        end;
        if v313.hitgroup == 0 and v312 > 0 then
            local v315 = v309:dist(v313.end_pos);
            v312 = v312 * v307:get_damage_multiplier(v308) / math.pow(v307.variables.range_modifier, v315 / 500);
            if v311 and v308 == 1 or v310 > 0 and (v308 <= 7 or v308 >= 14) then
                local v316 = v312 * v307.variables.armor_resist;
                v312 = v312 - math.min(v316, 2 * v310);
            end;
        end;
        return v312;
    end, 
    choose_hbox = function(v317, v318)
        local v319 = v318:get_index();
        v317.variables.is_reachable[v319] = false;
        local v320 = nil;
        local v321 = 0;
        for v322 = 1, #v317.variables.hbox_state do
            if v317.variables.hbox_state[v322] then
                local v323 = v318:get_hitbox_position(v322 - 1);
                dmg = v317:calc_true_damage(v322, v323, v318.m_ArmorValue, v318.m_bHasHelmet);
                local v324 = dmg == -1;
                if v324 then
                    dmg = v317.variables.weapon_info.damage;
                end;
                if dmg > 0 then
                    v317.variables.is_reachable[v319] = true;
                end;
                local v325 = v317:max_hc(v323, v317:get_hbox_radius(v322));
                if dmg >= v317.variables.mindmg and 100 * v325 >= v317.variables.minhc then
                    local v326 = v317:get_weighted_damage(v322, dmg);
                    if v321 < v326 then
                        v320 = v322;
                        v321 = v326;
                        v317.variables.dmg = dmg;
                        v317.variables.dmg_is_wrong = v324;
                    end;
                end;
            end;
        end;
        return v320;
    end, 
    lp_check = function(_)
        if not globals.is_connected then
            return false;
        elseif not globals.is_in_game then
            return false;
        else
            return true;
        end;
    end, 
    target_check = function(v328, v329)
        if v329 == nil then
            return false;
        elseif not v329.m_bConnected == 1 then
            return false;
        elseif not v329:is_alive() then
            return false;
        elseif v329:get_network_state() == 0 then
            return false;
        elseif v329:get_bbox().alpha < 0.4 then
            return false;
        elseif v328:choose_hbox(v329) == nil then
            return false;
        else
            return true;
        end;
    end, 
    weapon_check = function(v330, v331)
        if v330.variables.weapon == nil then
            return false;
        elseif v330.variables.weapon_type == nil or v330.variables.weapon_type == v330.consts.WEAPONTYPE_KNIFE or v330.variables.weapon_type >= v330.consts.WEAPONTYPE_C4 then
            return false;
        elseif v330.variables.weapon:get_weapon_reload() ~= -1 then
            return false;
        elseif v330.variables.lp:get_origin():dist(v331:get_origin()) > v330.variables.weapon_info.range then
            return false;
        elseif v330.variables.weapon.m_flNextPrimaryAttack > globals.curtime then
            return false;
        else
            return true;
        end;
    end, 
    choose_target = function(v332)
        local v333 = entity.get_players(true);
        local v334 = nil;
        local l_huge_0 = math.huge;
        for _, v337 in ipairs(v333) do
            if v332:lp_check() and v332:weapon_check(v337) and v332:target_check(v337) then
                local v338 = v337:get_origin():dist_to_ray(v332.variables.camera_position, v332.variables.camera_direction);
                if v338 < l_huge_0 then
                    l_huge_0 = v338;
                    v334 = v337;
                end;
            end;
        end;
        return v334;
    end, 
    autostop = function(v339)
        local v340 = math.sqrt(v339.variables.cmd.forwardmove * v339.variables.cmd.forwardmove + v339.variables.cmd.sidemove * v339.variables.cmd.sidemove);
        local v341 = v339.variables.lp.m_bIsScoped and v339.variables.weapon_info.max_player_speed_alt or v339.variables.weapon_info.max_player_speed;
        if v341 > 0 and v340 > 0 then
            if not v339.variables.cmd.in_duck then
                v341 = v341 * 0.33;
            end;
            if v341 < v340 then
                local v342 = v341 / v340;
                v339.variables.cmd.forwardmove = v339.variables.cmd.forwardmove * v342;
                v339.variables.cmd.sidemove = v339.variables.cmd.sidemove * v342;
            end;
        end;
    end, 
    autoscope = function(v343)
        if not v343.variables.lp.m_bIsScoped then
            v343.variables.cmd.in_attack2 = true;
        end;
    end, 
    run = function(v344, v345)
        -- upvalues: v35 (ref), v44 (ref)
        if not v35.misc.dormantaim:get() then
            return;
        elseif not v344:lp_check() then
            return;
        else
            if v344.aimbot_shot.tickcount ~= nil and globals.tickcount - v344.aimbot_shot.tickcount > 1 and not v344.aimbot_shot.handled then
                if v35.misc.dormantaim.logsda:get() then
                    print_raw((v44 .. "[ignite ~ dormant]" .. v44 .. " missed %s(%d%s) in %s for %d damage"):format(v344.aimbot_shot.victim:get_name(), v344.aimbot_shot.hitchance, "%", v344.aimbot_shot.hitgroup, v344.aimbot_shot.damage));
                    print_dev((v44 .. "[ignite ~ dormant]" .. v44 .. " missed %s(%d%s) in %s for %d damage"):format(v344.aimbot_shot.victim:get_name(), v344.aimbot_shot.hitchance, "%", v344.aimbot_shot.hitgroup, v344.aimbot_shot.damage));
                end;
                v344.aimbot_shot.handled = true;
            end;
            v344.variables:initialize(v345);
            local v346 = v344:choose_target();
            if v346 == nil then
                return;
            else
                local v347 = v344:choose_hbox(v346);
                local v348 = v346:get_hitbox_position(v347 - 1);
                local v349 = v344.variables.eyepos:to(v348):angles();
                if v35.misc.dormantaim.autostopda:get() then
                    v344:autostop();
                end;
                if v35.misc.dormantaim.autoscopeda:get() then
                    v344:autoscope();
                end;
                local v350 = nil;
                if v344.variables.weapon_info.is_revolver then
                    if v344.variables.cmd.in_duck == 1 then
                        v350 = v344:calculate_hc(v344.variables.weapon:get_inaccuracy() * 0.2, v348, v344:get_hbox_radius(v347));
                    else
                        v350 = v344:calculate_hc(v344.variables.weapon:get_inaccuracy() * 0.166, v348, v344:get_hbox_radius(v347));
                    end;
                else
                    v350 = v344:calculate_hc(v344.variables.weapon:get_inaccuracy(), v348, v344:get_hbox_radius(v347));
                end;
                if 100 * v350 >= v344.variables.minhc then
                    v344.variables.cmd.view_angles = v349;
                    v344.variables.cmd.in_attack = true;
                    v344.aimbot_shot.tickcount = globals.tickcount;
                    v344.aimbot_shot.victim = v346;
                    v344.aimbot_shot.hitchance = 100 * v350;
                    v344.aimbot_shot.hitgroup = v344:get_hitgroup_name(v347);
                    v344.aimbot_shot.damage = v344.variables.dmg_is_wrong and -1 or v344.variables.dmg;
                    v344.aimbot_shot.handled = false;
                end;
                return;
            end;
        end;
    end, 
    update_hboxes = function(v351)
        -- upvalues: v35 (ref)
        local v352 = v35.misc.dormantaim.hitboxesda:get();
        local v353 = {
            head = false, 
            chest = false, 
            stomach = false, 
            legs = false
        };
        for _, v355 in ipairs(v352) do
            v353[v355] = true;
        end;
        for _ = 1, 1 do
            v351.variables.hbox_state[1] = v353.head;
        end;
        for v357 = 5, 7 do
            v351.variables.hbox_state[v357] = v353.chest;
        end;
        for v358 = 3, 4 do
            v351.variables.hbox_state[v358] = v353.stomach;
        end;
        for v359 = 8, 11 do
            v351.variables.hbox_state[v359] = v353.legs;
        end;
    end
});
v360.aimbot:update_hboxes();
events.createmove:set(function(v361)
    -- upvalues: v360 (ref)
    v360.aimbot:run(v361);
end);
v35.misc.dormantaim.hitboxesda:set_callback(function()
    -- upvalues: v360 (ref)
    v360.aimbot:update_hboxes();
end);
local _ = esp.enemy:new_text("Dormant Aimbot", "DA", function(v362)
    -- upvalues: v35 (ref), v360 (ref)
    if v35.misc.dormantaim:get() and v360.variables.is_reachable[v362:get_index()] and v362:get_network_state() ~= 0 and v362:get_network_state() ~= 5 then
        return "DA";
    else
        return;
    end;
end);
events.player_hurt:set(function(v364)
    -- upvalues: v360 (ref), v35 (ref), v44 (ref)
    local l_tickcount_0 = v360.aimbot_shot.tickcount;
    if l_tickcount_0 == nil then
        return;
    else
        if globals.tickcount - l_tickcount_0 == 1 and entity.get(v364.attacker, true) == v360.variables.lp then
            local v366 = entity.get(v364.userid, true);
            local v367 = v360.consts.hitgroup_str[v364.hitgroup];
            if v35.misc.dormantaim.logsda:get() then
                print_raw((v44 .. "[ignite ~ dormant]" .. v44 .. " hit %s(%d%s) in %s(%s) for %d(%d) damage (%d health remaining)"):format(v366:get_name(), v360.aimbot_shot.hitchance, "%", v367, v360.aimbot_shot.hitgroup, v364.dmg_health, v360.aimbot_shot.damage, v364.health));
                print_dev((v44 .. "[ignite ~ dormant]" .. v44 .. " hit %s(%d%s) in %s(%s) for %d(%d) damage (%d health remaining)"):format(v366:get_name(), v360.aimbot_shot.hitchance, "%", v367, v360.aimbot_shot.hitgroup, v364.dmg_health, v360.aimbot_shot.damage, v364.health));
            end;
            v360.aimbot_shot.handled = true;
        end;
        return;
    end;
end);
local v371 = {
    handel = function(v368)
        -- upvalues: v35 (ref)
        local v369 = entity.get_local_player();
        if v369 == nil then
            return;
        elseif not v35.antiaim.ladder_select:get() then
            return;
        else
            local _ = render.camera_angles();
            if v369.m_MoveType == 9 and common.is_button_down(87) and v35.antiaim.ladder_select:get() then
                v368.view_angles.y = math.floor(v368.view_angles.y + 0.5);
                v368.roll = 0;
                if v368.view_angles.x < 45 then
                    v368.view_angles.x = 89;
                    v368.in_moveright = 1;
                    v368.in_moveleft = 0;
                    v368.in_forward = 0;
                    v368.in_back = 1;
                    if v368.sidemove == 0 then
                        v368.view_angles.y = v368.view_angles.y + 90;
                    end;
                    if v368.sidemove < 0 then
                        v368.view_angles.y = v368.view_angles.y + 150;
                    end;
                    if v368.sidemove > 0 then
                        v368.view_angles.y = v368.view_angles.y + 30;
                    end;
                end;
            end;
            if v369.m_MoveType == 9 and common.is_button_down(83) and v35.antiaim.ladder_select:get() then
                v368.view_angles.y = math.floor(v368.view_angles.y - 0.5);
                v368.roll = 0;
                if v368.view_angles.x < 45 then
                    v368.view_angles.x = 89;
                    v368.in_moveleft = 1;
                    v368.in_moveright = 0;
                    v368.in_forward = 1;
                    v368.in_back = 0;
                    if v368.sidemove == 0 then
                        v368.view_angles.y = v368.view_angles.y + 90;
                    end;
                    if v368.sidemove > 0 then
                        v368.view_angles.y = v368.view_angles.y + 150;
                    end;
                    if v368.sidemove < 0 then
                        v368.view_angles.y = v368.view_angles.y + 30;
                    end;
                end;
            end;
            return;
        end;
    end
};
events.createmove:set(function(v372)
    -- upvalues: v371 (ref)
    v371.handel(v372);
end);
nofalldamage = function(v373)
    -- upvalues: v35 (ref)
    if not v35.antiaim.nofalldamage:get() then
        return;
    else
        local v374 = entity.get_local_player();
        local v375 = v374:get_origin();
        if v374.m_vecVelocity.z <= -500 then
            if utils.trace_line(vector(v375.x, v375.y, v375.z), vector(v375.x, v375.y, v375.z - 15)).fraction ~= 1 then
                v373.in_duck = 0;
            elseif utils.trace_line(vector(v375.x, v375.y, v375.z), vector(v375.x, v375.y, v375.z - 50)).fraction ~= 1 then
                v373.in_duck = 1;
            end;
        end;
        return;
    end;
end;
events.createmove:set(function(v376)
    -- upvalues: v35 (ref)
    local v377 = entity.get_local_player();
    if not v377 then
        return;
    elseif not v377:is_alive() then
        return;
    else
        if v35.antiaim.nofalldamage:get() then
            nofalldamage(v376);
        end;
        return;
    end;
end);
local function v379(_)
    -- upvalues: v35 (ref)
    v35.misc.mindmg.damage_position_x:visibility(false);
    v35.misc.mindmg.damage_position_y:visibility(false);
    v35.misc.dormantaim.autoscopeda:visibility(false);
    v35.misc.dormantaim.autostopda:visibility(false);
end;
v379(true);
events.createmove:set(function(_)
    -- upvalues: v379 (ref)
    v379(some_logic_here);
end);
calculate_distance = function(v381, v382, v383, v384, v385, v386)
    return math.ceil(math.sqrt(math.pow(v381 - v384, 2) + math.pow(v382 - v385, 2) + math.pow(v383 - v386, 2)));
end;
local v387 = {
    pixel = 2, 
    default = 1, 
    bold = 4
};
local v391 = l_system_0.register({
    [1] = v35.misc.mindmg.damage_position_x, 
    [2] = v35.misc.mindmg.damage_position_y
}, vector(15, 15), "drag", function(v388)
    -- upvalues: v35 (ref), v12 (ref), v387 (ref)
    local v389 = entity.get_local_player();
    if not v389 or not v389:is_alive() then
        return;
    elseif not v35.misc.mindmg:get() then
        return;
    else
        local v390 = v12:get() == 0 and "AUTO" or v12:get();
        if ui.get_alpha() > 0.1 then
            render.text(v387[v35.misc.mindmg.damage_font:get()], vector(v388.position.x, v388.position.y), color(v35.misc.mindmg.damage_color:get().r, v35.misc.mindmg.damage_color:get().g, v35.misc.mindmg.damage_color:get().b, 255), "a", v390);
            render.rect_outline(vector(v388.position.x - 2, v388.position.y - 2), vector(v388.position.x + 20, v388.position.y + 16), color(255, 255, 255, 150), 1, 2, false);
        else
            render.text(v387[v35.misc.mindmg.damage_font:get()], vector(v388.position.x, v388.position.y), color(v35.misc.mindmg.damage_color:get().r, v35.misc.mindmg.damage_color:get().g, v35.misc.mindmg.damage_color:get().b, 255), "a", v390);
        end;
        return;
    end;
end);
events.render:set(function()
    -- upvalues: v391 (ref)
    v391:update();
end);
local function v397()
    -- upvalues: v35 (ref)
    local v392 = entity.get_local_player();
    if not v392 or not v392:is_alive() then
        return;
    else
        local v393 = v392:get_player_weapon(true);
        for _, v395 in ipairs(v393) do
            local v396 = v395:get_classname();
            if (v396 == "CMolotovGrenade" or v396 == "CIncendiaryGrenade") and v35.misc.grenades.selectnades:get(1) then
                utils.execute_after(0.23, function()
                    utils.console_exec("use weapon_molotov; use weapon_incgrenade;drop");
                end);
            end;
            if v396 == "CSmokeGrenade" and v35.misc.grenades.selectnades:get(2) then
                utils.execute_after(0.25, function()
                    utils.console_exec("use weapon_smokegrenade;drop");
                end);
            end;
            if v396 == "CHEGrenade" and v35.misc.grenades.selectnades:get(3) then
                utils.execute_after(0.27, function()
                    utils.console_exec("use weapon_hegrenade;drop");
                end);
            end;
        end;
        return;
    end;
end;
events.render:set(function()
    -- upvalues: v35 (ref), v397 (ref)
    if v35.misc.grenades.nadehotkey:get() and not key_click_cache then
        v397();
    end;
    key_click_cache = v35.misc.grenades.nadehotkey:get();
end);
local v398 = 9;
local v399 = 0.3;
local function v406(v400, v401, v402, v403)
    -- upvalues: v399 (ref)
    local v404 = math.clamp(v401, 15, 750);
    local v405 = math.clamp(v402, 0, 1);
    v404 = v404 * lerp(v399, 1, v405);
    return (vector():angles(v400) * v404 - v403):angles();
end;
local function v411(_)
    -- upvalues: v35 (ref), v398 (ref), v406 (ref)
    if v35.misc.grenades.nades:get(4) then
        if render.camera_angles() ~= cmd.view_angles:clone() then
            return;
        else
            local v408 = entity.get_local_player();
            if v408 == nil then
                return;
            else
                local v409 = v408:get_player_weapon();
                if v409 == nil then
                    return;
                else
                    local v410 = v409:get_weapon_info();
                    if v410 == nil then
                        return;
                    elseif v410.weapon_type == v398 and globals.curtime - to_time(globals.clock_offset) < v409.m_fThrowTime then
                        cmd.in_speed = true;
                        cmd.view_angles = v406(render.camera_angles(), v410.throw_velocity, v409.m_flThrowStrength, v408.m_vecVelocity);
                    end;
                end;
            end;
        end;
    end;
end;
local function v416(v412)
    -- upvalues: v35 (ref), v406 (ref)
    local v413 = entity.get_local_player();
    if v413 == nil then
        return;
    elseif not v35.misc.grenades.nades:get(4) then
        return;
    else
        local v414 = v413:get_player_weapon();
        if v414 == nil then
            return;
        else
            local v415 = v414:get_weapon_info();
            if v415 == nil then
                return;
            else
                v412.angles = v406(v412.angles, v415.throw_velocity, v414.m_flThrowStrength, v412.velocity);
                return;
            end;
        end;
    end;
end;
events.grenade_override_view:set(function(v417)
    -- upvalues: v416 (ref)
    v416(v417);
end);
events.super_toss:set(function(v418)
    -- upvalues: v411 (ref)
    v411(v418);
end);
local function v423(v419)
    -- upvalues: v35 (ref)
    local v420 = entity.get_local_player();
    if v420 == nil or not v420:is_alive() then
        return;
    else
        local v421 = v420:get_player_weapon();
        if v421 == nil then
            return;
        else
            local v422 = v421:get_weapon_index();
            if not v422 == 44 or not v422 == 46 then
                return;
            else
                if v35.misc.grenades.nades:get(3) and v421.m_bPinPulled and v419.damage > v35.misc.grenades.realese32:get() then
                    utils.console_exec("+attack");
                    utils.execute_after(0.1, function()
                        utils.console_exec("-attack");
                    end);
                end;
                return;
            end;
        end;
    end;
end;
events.grenade_prediction:set(function(v424)
    -- upvalues: v423 (ref)
    v423(v424);
end);
sosali_hui = function()
    -- upvalues: v35 (ref), v33 (ref)
    local v425, _ = v35.misc.pingunlocker:get();
    if v425 then
        cvar.sv_maxunlag:float(0.4);
        v33.spike:override(v35.misc.pingunlocker.pingunlockerslide:get());
    else
        cvar.sv_maxunlag:float(0.2);
        v33.spike:override();
    end;
end;
events.render:set(function()
    sosali_hui();
end);
footchamsfix = function()
    -- upvalues: v35 (ref)
    local v427, _ = v35.misc.addons_list:get(1);
    if v427 then
        cvar.cl_foot_contact_shadows:int(0);
    else
        cvar.cl_foot_contact_shadows:int(1);
    end;
end;
events.render:set(function()
    footchamsfix();
end);
interpolations = function()
    -- upvalues: v35 (ref)
    local v429, _ = v35.antiaim.forceinterpolation:get();
    if v429 then
        cvar.cl_interp:float(0.015625);
    else
        cvar.cl_interp:float(0);
    end;
end;
events.render:set(function()
    interpolations();
end);
aspectratio = function()
    -- upvalues: v35 (ref), l_anim_0 (ref)
    if v35.misc.aspect:get() then
        cvar.r_aspectratio:float(v35.misc.aspect:get() and l_anim_0 and v35.misc.aspect.val:get() / 100 or 0);
    else
        cvar.r_aspectratio:float(0);
    end;
end;
v35.misc.aspect:set_callback(aspectratio);
aspectratio();
v35.misc.aspect.val:set_callback(function(v431)
    -- upvalues: v35 (ref)
    if v35.misc.aspect:get() then
        cvar.r_aspectratio:float(v431:get(10) / 100);
    end;
end);
v35.misc.aspect.pre1:set_callback(function()
    -- upvalues: v35 (ref)
    v35.misc.aspect.val:set(160);
end);
v35.misc.aspect.pre2:set_callback(function()
    -- upvalues: v35 (ref)
    v35.misc.aspect.val:set(178);
end);
v35.misc.aspect.pre3:set_callback(function()
    -- upvalues: v35 (ref)
    v35.misc.aspect.val:set(125);
end);
v35.misc.aspect.pre4:set_callback(function()
    -- upvalues: v35 (ref)
    v35.misc.aspect.val:set(133);
end);
v35.misc.aspect.pre5:set_callback(function()
    -- upvalues: v35 (ref)
    v35.misc.aspect.val:set(150);
end);
viewmodelm = function()
    -- upvalues: v35 (ref)
    if v35.misc.viewmodel:get(11) then
        cvar.viewmodel_fov:float(v35.misc.viewmodel.fov:get(11) and v35.misc.viewmodel.fov:get(11) or 68, true);
        cvar.viewmodel_offset_x:float(v35.misc.viewmodel.x_axis:get() and v35.misc.viewmodel.x_axis:get(11) / 10 or 2.5, true);
        cvar.viewmodel_offset_y:float(v35.misc.viewmodel.y_axis:get() and v35.misc.viewmodel.y_axis:get(11) / 10 or 0, true);
        cvar.viewmodel_offset_z:float(v35.misc.viewmodel.z_axis:get() and v35.misc.viewmodel.z_axis:get(11) / 10 or -1.5, true);
    end;
end;
v35.misc.viewmodel:set_callback(viewmodelm);
viewmodelm();
v35.misc.viewmodel.fov:set_callback(function(v432)
    -- upvalues: v35 (ref)
    if v35.misc.viewmodel:get() then
        cvar.viewmodel_fov:float(v432:get(), true);
    end;
end);
v35.misc.viewmodel.x_axis:set_callback(function(v433)
    -- upvalues: v35 (ref)
    if v35.misc.viewmodel:get() then
        cvar.viewmodel_offset_x:float(v433:get() / 10, true);
    end;
end);
v35.misc.viewmodel.y_axis:set_callback(function(v434)
    -- upvalues: v35 (ref)
    if v35.misc.viewmodel:get() then
        cvar.viewmodel_offset_y:float(v434:get() / 10, true);
    end;
end);
v35.misc.viewmodel.z_axis:set_callback(function(v435)
    -- upvalues: v35 (ref)
    if v35.misc.viewmodel:get() then
        cvar.viewmodel_offset_z:float(v435:get() / 10, true);
    end;
end);
v35.misc.viewmodel:set_callback(function(v436)
    -- upvalues: v35 (ref)
    if not v436:get() then
        cvar.viewmodel_fov:float(68, true);
        cvar.viewmodel_offset_x:float(2.5, true);
        cvar.viewmodel_offset_y:float(0, true);
        cvar.viewmodel_offset_z:float(-1.5, true);
    else
        cvar.r_aspectratio:float(v35.misc.aspect:get() and v35.misc.aspect.val:get() / 100 or 0);
        cvar.viewmodel_fov:float(v35.misc.viewmodel:get() and v35.misc.viewmodel.fov:get() or 68, true);
        cvar.viewmodel_offset_x:float(v35.misc.viewmodel:get() and v35.misc.viewmodel.x_axis:get() / 10 or 2.5, true);
        cvar.viewmodel_offset_y:float(v35.misc.viewmodel:get() and v35.misc.viewmodel.y_axis:get() / 10 or 0, true);
        cvar.viewmodel_offset_z:float(v35.misc.viewmodel:get() and v35.misc.viewmodel.z_axis:get() / 10 or -1.5, true);
    end;
end);
builder = function(_)
    -- upvalues: v36 (ref), v35 (ref), v32 (ref), v37 (ref), l_pui_0 (ref), v44 (ref), v38 (ref), v34 (ref), v39 (ref)
    v36.enable = v35.antiaim.enable:depend({
        [1] = nil, 
        [2] = 3, 
        [1] = v35.antiaim.enable
    });
    v36.conditions = v35.antiaim.conditions;
    for v438 = 1, #v32.cond do
        v37[v438] = {
            yaw = l_pui_0.create(v44 .. ui.get_icon("shield-check"), "general / " .. v44 .. v32.cond[v438], 1), 
            sliders = l_pui_0.create(v44 .. ui.get_icon("shield-check"), "yaw / " .. v44 .. v32.cond[v438], 1), 
            bodyyaw = l_pui_0.create(v44 .. ui.get_icon("shield-check"), "body yaw / " .. v44 .. v32.cond[v438], 1), 
            defensivetab = l_pui_0.create(v44 .. ui.get_icon("shield-check"), "defensive builder / " .. v44 .. v32.cond[v438], 2)
        };
        v38[v438] = {
            enable = v34.states:switch(v44 .. "\f<circle-user>  \renable " .. v44 .. v32.cond[v438]), 
            yaw = v37[v438].yaw:combo(v44 .. "\f<arrow-right-arrow-left>  \ryaw", {
                [1] = "backward"
            }), 
            modifier = v37[v438].yaw:combo(v44 .. "\f<repeat>  \rmodifier", {
                [1] = "disabled", 
                [2] = "center", 
                [3] = "offset", 
                [4] = "random", 
                [5] = "3-way", 
                [6] = "5-way"
            }), 
            bodyyaw = v37[v438].bodyyaw:switch(v44 .. "\f<brackets-curly>  \rbody yaw"), 
            defensive = v37[v438].defensivetab:switch(v44 .. "\f<shield>  \rdefensive options"), 
            breaklc = v37[v438].defensivetab:switch(v44 .. "\f<wave-sine>  \rforce lc")
        };
        local v439 = {
            yaw = v38[v438].yaw:create(), 
            modifier = v38[v438].modifier:create(), 
            bodyyaw = v38[v438].bodyyaw:create(), 
            defensive = v38[v438].defensive:create()
        };
        v39[v438] = {
            mode = v439.yaw:combo("mode", {
                [1] = "static", 
                [2] = "left & right"
            }), 
            delay = v37[v438].sliders:slider("delay", 1, 12, 1, nil, "t"), 
            static = v37[v438].sliders:slider("static", -180, 180, 0, nil, "\194\176"), 
            left = v37[v438].sliders:slider("left", -180, 180, 0, nil, "\194\176"), 
            right = v37[v438].sliders:slider("right", -180, 180, 0, nil, "\194\176"), 
            modmode = v439.modifier:combo("mode", {
                [1] = "static", 
                [2] = "left & right"
            }), 
            modstatic = v37[v438].yaw:slider("static", -180, 180, 0, nil, "\194\176"), 
            modleft = v37[v438].yaw:slider("left", -180, 180, 0, nil, "\194\176"), 
            modright = v37[v438].yaw:slider("right", -180, 180, 0, nil, "\194\176"), 
            options = v439.bodyyaw:selectable("options", {
                [1] = "avoid overlap", 
                [2] = "jitter", 
                [3] = "anti bruteforce"
            }), 
            fs = v439.bodyyaw:combo("freestanding", {
                [1] = "off", 
                [2] = "peek fake", 
                [3] = "peek real"
            }), 
            leftlimit = v37[v438].bodyyaw:slider("left", 0, 60, 60, nil, "\194\176"), 
            rightlimit = v37[v438].bodyyaw:slider("right", 0, 60, 60, nil, "\194\176"), 
            bodyyawrandom = v439.bodyyaw:slider("randomization", 0, 100, 0, 1, "%"), 
            dselect = v439.defensive:listable("", {
                [1] = "pitch", 
                [2] = "yaw"
            }), 
            pitch = v439.defensive:combo("pitch", {
                [1] = "disabled", 
                [2] = "static", 
                [3] = "random", 
                [4] = "offset", 
                [5] = "spin"
            }), 
            pitchvalue1 = v439.defensive:slider("pitch first", -89, 89, 0, nil, "\194\176"), 
            pitchvalue2 = v439.defensive:slider("pitch second", -89, 89, 0, nil, "\194\176"), 
            pitchspeed = v439.defensive:slider("pitch speed", 1, 10, 1), 
            yaw = v439.defensive:combo("yaw", {
                [1] = "disabled", 
                [2] = "neverlose", 
                [3] = "static", 
                [4] = "random", 
                [5] = "offset", 
                [6] = "spin", 
                [7] = "distorion", 
                [8] = "meta", 
                [9] = "3-way", 
                [10] = "5-way", 
                [11] = "sideways"
            }), 
            yawvalue1 = v439.defensive:slider("yaw first", -180, 180, 0, nil, "\194\176"), 
            yawvalue2 = v439.defensive:slider("yaw second", -180, 180, 0, nil, "\194\176"), 
            yawspeed = v439.defensive:slider("spin speed", 1, 10, 1), 
            yawway1 = v439.defensive:slider("way first", -180, 180, 0, nil, "\194\176"), 
            yawway2 = v439.defensive:slider("way second", -180, 180, 0, nil, "\194\176"), 
            yawway3 = v439.defensive:slider("way three", -180, 180, 0, nil, "\194\176"), 
            yawway4 = v439.defensive:slider("way four", -180, 180, 0, nil, "\194\176"), 
            yawway5 = v439.defensive:slider("way five", -180, 180, 0, nil, "\194\176")
        };
    end;
    visibility = function()
        -- upvalues: v32 (ref), v35 (ref), v38 (ref), v37 (ref), v39 (ref)
        for v440 = 1, #v32.cond do
            local v441 = v35.antiaim.conditions:get() == v32.cond[v440] and v35.antiaim.enable:get() == 1;
            v38[v440].enable:visibility(v441 and v35.antiaim.conditions:get() ~= "shared");
            v37[v440].yaw:visibility(v441 and (v38[v440].enable:get() or v35.antiaim.conditions:get() == "shared"));
            v37[v440].bodyyaw:visibility(v441 and (v38[v440].enable:get() or v35.antiaim.conditions:get() == "shared"));
            v37[v440].defensivetab:visibility(v441 and (v38[v440].enable:get() or v35.antiaim.conditions:get() == "shared"));
            v37[v440].sliders:visibility(v441 and (v38[v440].enable:get() or v35.antiaim.conditions:get() == "shared"));
            v38[v440].modifier:visibility(v441 and v38[v440].yaw:get() ~= "disabled");
            if v38[v440].defensive:get() then
                v38[v440].breaklc:visibility(true);
            else
                v38[v440].breaklc:visibility(false);
            end;
            v39[v440].mode:visibility(v38[v440].yaw:get() ~= "disabled");
            v39[v440].delay:visibility(v38[v440].yaw:get() ~= "disabled");
            v39[v440].static:visibility(v38[v440].yaw:get() ~= "disabled" and v39[v440].mode:get() == "static");
            v39[v440].left:visibility(v38[v440].yaw:get() ~= "disabled" and v39[v440].mode:get() ~= "static");
            v39[v440].right:visibility(v38[v440].yaw:get() ~= "disabled" and v39[v440].mode:get() ~= "static");
            v39[v440].modmode:visibility(v38[v440].modifier:get() ~= "disabled");
            v39[v440].modstatic:visibility(v38[v440].modifier:get() ~= "disabled" and v39[v440].modmode:get() == "static");
            v39[v440].modleft:visibility(v38[v440].modifier:get() ~= "disabled" and v39[v440].modmode:get() ~= "static");
            v39[v440].modright:visibility(v38[v440].modifier:get() ~= "disabled" and v39[v440].modmode:get() ~= "static");
            v39[v440].options:visibility(v38[v440].bodyyaw:get());
            v39[v440].fs:visibility(v38[v440].bodyyaw:get());
            v39[v440].leftlimit:visibility(v38[v440].bodyyaw:get());
            v39[v440].rightlimit:visibility(v38[v440].bodyyaw:get());
            v39[v440].bodyyawrandom:visibility(v38[v440].bodyyaw:get());
            v39[v440].delay:visibility(v39[v440].options:get("Jitter"));
            v39[v440].dselect:visibility(v38[v440].defensive:get());
            v39[v440].pitch:visibility(v38[v440].defensive:get() and v39[v440].dselect:get(1));
            v39[v440].pitchvalue1:visibility(v38[v440].defensive:get() and v39[v440].dselect:get(1) and v39[v440].pitch:get() ~= "disabled");
            v39[v440].pitchvalue2:visibility(v38[v440].defensive:get() and v39[v440].dselect:get(1) and (v39[v440].pitch:get() == "offset" or not (v39[v440].pitch:get() ~= "random") or v39[v440].pitch:get() == "spin"));
            v39[v440].pitchspeed:visibility(v38[v440].defensive:get() and v39[v440].dselect:get(1) and v39[v440].pitch:get() == "spin");
            v39[v440].yaw:visibility(v38[v440].defensive:get() and v39[v440].dselect:get(2));
            v39[v440].yawvalue1:visibility(v38[v440].defensive:get() and v39[v440].dselect:get(2) and v39[v440].yaw:get() ~= "disabled" and v39[v440].yaw:get() ~= "neverlose" and v39[v440].yaw:get() ~= "3-way" and v39[v440].yaw:get() ~= "5-way");
            v39[v440].yawvalue2:visibility(v38[v440].defensive:get() and v39[v440].dselect:get(2) and v39[v440].yaw:get() ~= "3-way" and v39[v440].yaw:get() ~= "5-way" and (not (v39[v440].yaw:get() ~= "offset") or v39[v440].yaw:get() == "random"));
            v39[v440].yawspeed:visibility(v38[v440].defensive:get() and v39[v440].dselect:get(2) and (v39[v440].yaw:get() == "spin" or not (v39[v440].yaw:get() ~= "distorion") or v39[v440].yaw:get() == "meta"));
            v39[v440].yawway1:visibility(v38[v440].defensive:get() and v39[v440].dselect:get(2) and (v39[v440].yaw:get() == "3-way" or v39[v440].yaw:get() == "5-way"));
            v39[v440].yawway2:visibility(v38[v440].defensive:get() and v39[v440].dselect:get(2) and (v39[v440].yaw:get() == "3-way" or v39[v440].yaw:get() == "5-way"));
            v39[v440].yawway3:visibility(v38[v440].defensive:get() and v39[v440].dselect:get(2) and (v39[v440].yaw:get() == "3-way" or v39[v440].yaw:get() == "5-way"));
            v39[v440].yawway4:visibility(v38[v440].defensive:get() and v39[v440].dselect:get(2) and v39[v440].yaw:get() == "5-way");
            v39[v440].yawway5:visibility(v38[v440].defensive:get() and v39[v440].dselect:get(2) and v39[v440].yaw:get() == "5-way");
        end;
    end;
    set_callback = function()
        -- upvalues: v36 (ref), v38 (ref), v39 (ref)
        for _, v443 in pairs(v36) do
            v443:set_callback(visibility);
        end;
        for v444, _ in pairs(v38) do
            for _, v447 in pairs(v38[v444]) do
                v447:set_callback(visibility);
            end;
        end;
        for v448, _ in pairs(v39) do
            for _, v451 in pairs(v39[v448]) do
                v451:set_callback(visibility);
            end;
        end;
    end;
    visibility();
    set_callback();
end;
builder();
v35.misc.grenades.selectnades:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v35.misc.grenades.nades
});
v35.misc.grenades.nadehotkey:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v35.misc.grenades.nades
});
v35.misc.grenades.realese32:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v35.misc.grenades.nades
});
local function v465(v452)
    -- upvalues: v35 (ref), v38 (ref), v33 (ref)
    local v453 = entity.get_local_player();
    if v453 == nil or not v453:is_alive() then
        return;
    else
        local l_m_fFlags_0 = v453.m_fFlags;
        local v455 = bit.band(l_m_fFlags_0, bit.lshift(1, 0)) == 0;
        local v456 = bit.band(l_m_fFlags_0, bit.lshift(1, 1)) ~= 0;
        if v35.antiaim.fs:get() then
            local v457;
            if v452 then
                v457 = v38[9].enable:get() and 9 or 1;
            else
                v457 = 9;
            end;
            return v457;
        elseif v455 and v456 then
            local v458;
            if v452 then
                v458 = v38[8].enable:get() and 8 or 1;
            else
                v458 = 8;
            end;
            return v458;
        elseif v455 then
            local v459;
            if v452 then
                v459 = v38[7].enable:get() and 7 or 1;
            else
                v459 = 7;
            end;
            return v459;
        elseif v453.m_vecVelocity:length2d() > 5 and v456 then
            local v460;
            if v452 then
                v460 = v38[6].enable:get() and 6 or 1;
            else
                v460 = 6;
            end;
            return v460;
        elseif v453.m_vecVelocity:length2d() < 5 and v456 then
            local v461;
            if v452 then
                v461 = v38[5].enable:get() and 5 or 1;
            else
                v461 = 5;
            end;
            return v461;
        elseif v453.m_vecVelocity:length2d() > 5 and v33.sw:get() then
            local v462;
            if v452 then
                v462 = v38[4].enable:get() and 4 or 1;
            else
                v462 = 4;
            end;
            return v462;
        elseif v453.m_vecVelocity:length2d() > 5 then
            local v463;
            if v452 then
                v463 = v38[3].enable:get() and 3 or 1;
            else
                v463 = 3;
            end;
            return v463;
        else
            local v464;
            if v452 then
                v464 = v38[2].enable:get() and 2 or 1;
            else
                v464 = 2;
            end;
            return v464;
        end;
    end;
end;
local v466 = nil;
v466 = {
    sides = {}, 
    delay = {}
};
v466.calculate = function(v467, v468, v469)
    -- upvalues: v466 (ref)
    if not v466.sides[v467] then
        v466.sides[v467] = 0;
    end;
    if not v466.delay[v467] then
        v466.delay[v467] = 0;
    end;
    if globals.choked_commands == 0 then
        v466.delay[v467] = v466.delay[v467] + 1;
        if v466.delay[v467] > v469 - 1 then
            v466.delay[v467] = 0;
            v466.sides[v467] = v466.sides[v467] + 1;
            if v466.sides[v467] > #v468 then
                v466.sides[v467] = 1;
            end;
        end;
    end;
    return v468[v466.sides[v467]];
end;
local _ = {
    front = 180, 
    disabled = 0, 
    right = 90, 
    left = -90
};
local function v484(v471)
    -- upvalues: v35 (ref), v33 (ref), v42 (ref), v465 (ref), v38 (ref), v466 (ref), v39 (ref)
    local v472 = entity.get_local_player();
    if v472 == nil or not v472:is_alive() or not v35.antiaim.enable:get() then
        return;
    else
        v33.fs:override(v35.antiaim.fs:get());
        local v473 = false;
        v42.cond = v465(true);
        v42.cond2 = v465(true);
        v33.base:override(v35.antiaim.conditions.base:get());
        v33.pitch:override(v35.antiaim.conditions.pitch:get());
        v33.backstab:override(v35.antiaim.backstab:get(3));
        v33.modifier:override("disabled");
        if v35.antiaim.manual:get() ~= "disabled" and v35.antiaim.manual.static:get() then
            v473 = true;
            v35.antiaim.fs:set(false);
        end;
        local v474 = 0;
        local v475 = false;
        local v476 = v472:get_player_weapon();
        if entity.get_threat() ~= nil then
            local v477 = (entity.get_threat():get_origin() - v472:get_origin()):length2dsqr();
            if v35.antiaim.safe:get() and v35.antiaim.safe.weapons:get() and v476 ~= nil and v42.cond2 == 8 then
                v474 = v35.antiaim.safe.weapons:get(string.sub(v476:get_weapon_info(1).weapon_name, 8)) and 15 or 0;
                if v474 == 15 then
                    v475 = true;
                end;
            end;
            if v35.antiaim.safe:get(1) and v35.antiaim.safe.weapons:get() and v42.cond2 == 2 then
                v474 = v35.antiaim.safe.weapons:get(1) and 15 or 0;
                if v474 == 15 then
                    v475 = true;
                end;
            end;
            if v35.antiaim.safe:get(2) and v35.antiaim.safe.weapons:get() and v42.cond2 == 5 then
                v474 = v35.antiaim.safe.weapons:get(2) and 15 or 0;
                if v474 == 15 then
                    v475 = true;
                end;
            end;
            if v35.antiaim.safe:get(3) and v35.antiaim.safe.weapons:get() and v42.cond2 == 8 then
                v474 = v35.antiaim.safe.weapons:get(3) and 15 or 0;
                if v474 == 15 then
                    v475 = true;
                end;
            end;
            if v35.antiaim.safe:get(4) and v35.antiaim.safe.weapons:get() then
                v474 = v35.antiaim.safe.weapons:get(4) and v477 > 1000000 and 15 or 0;
                if v474 == 15 then
                    v475 = true;
                end;
            end;
            if v35.antiaim.safe:get(5) and v35.antiaim.safe.weapons:get() then
                v474 = v35.antiaim.safe.weapons:get(5) and v472:get_origin().z - entity.get_threat():get_origin().z > 55 and 15 or 0;
                if v474 == 15 then
                    v475 = true;
                end;
            end;
        end;
        if v35.antiaim.smartteleport:get() and (v42.cond2 == 7 or v42.cond2 == 8) then
            if globals.tickcount % v35.antiaim.smartteleport.tikslag:get() == 0 then
                rage.exploit:force_teleport();
            else
                rage.exploit:force_charge();
            end;
        end;
        if v38[v42.cond].modifier:get() == "disabled" then
            v42.invert = v466.calculate("invert_disabled_" .. v42.cond, {
                [1] = true, 
                [2] = false
            }, v39[v42.cond].delay:get());
            v42.yaw = 0;
        elseif v38[v42.cond].modifier:get() == "center" then
            v42.invert = v466.calculate("invert_center_" .. v42.cond, {
                [1] = true, 
                [2] = false
            }, v39[v42.cond].delay:get());
            v42.yaw = v39[v42.cond].modmode:get() == "static" and (not v42.invert and -v39[v42.cond].modstatic:get() or v39[v42.cond].modstatic:get()) or v42.invert and v39[v42.cond].modright:get() or -v39[v42.cond].modleft:get();
        elseif v38[v42.cond].modifier:get() == "offset" then
            v42.invert = v466.calculate("invert_offset_" .. v42.cond, {
                [1] = true, 
                [2] = false
            }, v39[v42.cond].delay:get());
            local l_v42_0 = v42;
            local v479;
            if v39[v42.cond].modmode:get() == "static" then
                if not v42.invert then
                    v479 = 0;
                    goto label0 --[[  true, true  ]];
                else
                    v479 = -v39[v42.cond].modstatic:get();
                    if not v479 then
                        v479 = v39[v42.cond].modstatic:get();
                        if v479 then
                            goto label0;
                        end;
                    else
                        goto label0;
                    end;
                end;
            end;
            v479 = v42.invert and 0 or v39[v42.cond].modright:get() and -v39[v42.cond].modleft:get();
            ::label0::;
            l_v42_0.yaw = v479;
        elseif v38[v42.cond].modifier:get() == "random" then
            v42.invert = v466.calculate("invert_random_" .. v42.cond, {
                [1] = true, 
                [2] = false
            }, v39[v42.cond].delay:get());
            v42.yaw = v39[v42.cond].modmode:get() == "static" and math.random(-v39[v42.cond].modstatic:get(), v39[v42.cond].modstatic:get()) or math.random(-v39[v42.cond].modright:get(), v39[v42.cond].modleft:get());
        elseif v38[v42.cond].modifier:get() == "3-way" then
            v42.invert = v466.calculate("invert_3-way_" .. v42.cond, {
                [1] = true, 
                [2] = false, 
                [3] = true
            }, v39[v42.cond].delay:get());
            v42.yaw = v466.calculate("3way_" .. v42.cond, v39[v42.cond].modmode:get() == "static" and {
                nil, 
                0, 
                [1] = -v39[v42.cond].modstatic:get(), 
                v39[v42.cond].modstatic:get()
            } or {
                nil, 
                0, 
                [1] = v39[v42.cond].modleft:get(), 
                v39[v42.cond].modright:get()
            }, v39[v42.cond].delay:get());
        elseif v38[v42.cond].modifier:get() == "5-way" then
            v42.invert = v466.calculate("invert_5-way_" .. v42.cond, {
                [1] = true, 
                [2] = false, 
                [3] = true
            }, v39[v42.cond].delay:get());
            v42.yaw = v466.calculate("5way_" .. v42.cond, v39[v42.cond].modmode:get() == "static" and {
                nil, 
                nil, 
                0, 
                [1] = -v39[v42.cond].modstatic:get(), 
                [2] = -v39[v42.cond].modstatic:get() * 0.5, 
                v39[v42.cond].modstatic:get() * 0.5, 
                v39[v42.cond].modstatic:get()
            } or {
                nil, 
                nil, 
                0, 
                [1] = v39[v42.cond].modleft:get(), 
                [2] = v39[v42.cond].modleft:get() * 0.5, 
                v39[v42.cond].modright:get() * 0.5, 
                v39[v42.cond].modright:get()
            }, v39[v42.cond].delay:get());
        end;
        v42.add = v39[v42.cond].mode:get() == "static" and v39[v42.cond].static:get() or v42.invert and v39[v42.cond].right:get() or v39[v42.cond].left:get();
        v33.yaw:override(v38[v42.cond].yaw:get());
        v33.yawoffset:override((v475 and 0 or v42.yaw / 2 + v42.add) + v474 + yaw_base_degree());
        v33.bodyyaw:override(v38[v42.cond].bodyyaw:get());
        local l_inverter_0 = v33.inverter;
        local l_l_inverter_0_0 = l_inverter_0;
        l_inverter_0 = l_inverter_0.override;
        local v482;
        if v39[v42.cond].options:get("jitter") and not v475 and not v42.invert then
            v482 = true;
        else
            v482 = false;
        end;
        l_inverter_0(l_l_inverter_0_0, v482);
        v33.leftlimit:override(v39[v42.cond].leftlimit:get());
        v33.rightlimit:override(v39[v42.cond].rightlimit:get());
        v33.options:override({
            [1] = v39[v42.cond].options:get("avoid overlap") and "avoid overlap" or "", 
            [2] = v39[v42.cond].options:get("randomize jitter") and "randomize jitter" or "", 
            [3] = v39[v42.cond].options:get("anti bruteforce") and "anti bruteforce" or ""
        });
        v33.bodyyawfs:override(v39[v42.cond].fs:get());
        v33.leftlimit:override(v39[v42.cond].bodyyawrandom:get() > 0 and utils.random_int(v39[v42.cond].leftlimit:get() - v39[v42.cond].bodyyawrandom:get() / 100 * v39[v42.cond].leftlimit:get(), v39[v42.cond].leftlimit:get()) or v39[v42.cond].leftlimit:get());
        v33.rightlimit:override(v39[v42.cond].bodyyawrandom:get() > 0 and utils.random_int(v39[v42.cond].rightlimit:get() - v39[v42.cond].bodyyawrandom:get() / 100 * v39[v42.cond].rightlimit:get(), v39[v42.cond].rightlimit:get()) or v39[v42.cond].rightlimit:get());
        v33.dtlag:override(v38[v42.cond].breaklc:get() and "Always on" or nil);
        v33.hslag:override(v38[v42.cond].breaklc:get() and "Break lc" or nil);
        if v38[v42.cond].defensive:get() and not v475 then
            l_inverter_0 = globals.curtime;
            v33.hidden:override(true);
            v33.dtlag:override(v38[v42.cond].breaklc:get() and "Always on" or nil);
            v33.hslag:override(v38[v42.cond].breaklc:get() and "Break lc" or nil);
            if rage.exploit:get() < 1 then
                return;
            else
                if v39[v42.cond].dselect:get(1) then
                    if v39[v42.cond].pitch:get() == "static" then
                        rage.antiaim:override_hidden_pitch(v39[v42.cond].pitchvalue1:get());
                    elseif v39[v42.cond].pitch:get() == "random" then
                        rage.antiaim:override_hidden_pitch(math.random(v39[v42.cond].pitchvalue1:get(), v39[v42.cond].pitchvalue2:get()));
                    elseif v39[v42.cond].pitch:get() == "offset" then
                        rage.antiaim:override_hidden_pitch(v466.calculate("defensivepitch_" .. v42.cond, {
                            v39[v42.cond].pitchvalue1:get(), 
                            v39[v42.cond].pitchvalue2:get()
                        }, 1) or 89);
                    elseif v39[v42.cond].pitch:get() == "spin" then
                        l_l_inverter_0_0 = v39[v42.cond].pitchvalue1:get();
                        v482 = v39[v42.cond].pitchvalue2:get();
                        local v483 = v39[v42.cond].pitchspeed:get();
                        rage.antiaim:override_hidden_pitch(math.fmod(l_inverter_0 * (v483 * 360), l_l_inverter_0_0 * 2 or v482 * 2) + l_l_inverter_0_0 or v482);
                    end;
                end;
                if v39[v42.cond].dselect:get(2) then
                    if v39[v42.cond].yaw:get(1) == "disabled" then
                        rage.antiaim:override_hidden_yaw_offset(0);
                    elseif v39[v42.cond].yaw:get(2) == "neverlose" then
                        rage.antiaim:override_hidden_yaw_offset();
                    elseif v39[v42.cond].yaw:get(3) == "static" then
                        rage.antiaim:override_hidden_yaw_offset(v39[v42.cond].yawvalue1:get());
                    elseif v39[v42.cond].yaw:get(4) == "random" then
                        rage.antiaim:override_hidden_yaw_offset(math.random(v39[v42.cond].yawvalue1:get(), v39[v42.cond].yawvalue2:get()));
                    elseif v39[v42.cond].yaw:get(5) == "offset" then
                        rage.antiaim:override_hidden_yaw_offset(v466.calculate("defensiveyaw_" .. v42.cond, {
                            v39[v42.cond].yawvalue1:get(), 
                            v39[v42.cond].yawvalue2:get()
                        }, 1) or 0);
                    elseif v39[v42.cond].yaw:get(6) == "spin" then
                        l_l_inverter_0_0 = v39[v42.cond].yawspeed:get();
                        v482 = v39[v42.cond].yawvalue1:get();
                        rage.antiaim:override_hidden_yaw_offset(-math.fmod(l_inverter_0 * (l_l_inverter_0_0 * 360), v482 * 2) + v482);
                    elseif v39[v42.cond].yaw:get(7) == "distorion" then
                        l_l_inverter_0_0 = v39[v42.cond].yawspeed:get();
                        v482 = v39[v42.cond].yawvalue1:get();
                        rage.antiaim:override_hidden_yaw_offset(math.sin(l_inverter_0 * l_l_inverter_0_0) * v482);
                    elseif v39[v42.cond].yaw:get(8) == "meta" then
                        l_l_inverter_0_0 = v39[v42.cond].yawspeed:get();
                        v482 = v39[v42.cond].yawvalue1:get();
                        rage.antiaim:override_hidden_yaw_offset(-math.sin(l_inverter_0 * l_l_inverter_0_0) * v482 * 4);
                    elseif v39[v42.cond].yaw:get(9) == "3-way" then
                        rage.antiaim:override_hidden_yaw_offset(v466.calculate("defensiveyaw_" .. v42.cond, {
                            v39[v42.cond].yawway1:get(), 
                            v39[v42.cond].yawway2:get(), 
                            v39[v42.cond].yawway3:get()
                        }, 1) or 0);
                    elseif v39[v42.cond].yaw:get(10) == "5-way" then
                        rage.antiaim:override_hidden_yaw_offset(v466.calculate("defensiveyaw_" .. v42.cond, {
                            v39[v42.cond].yawway1:get(), 
                            v39[v42.cond].yawway2:get(), 
                            v39[v42.cond].yawway3:get(), 
                            v39[v42.cond].yawway4:get(), 
                            v39[v42.cond].yawway5:get()
                        }, 1) or 0);
                    elseif v39[v42.cond].yaw:get(11) == "sideways" then
                        rage.antiaim:override_hidden_yaw_offset(v466.calculate("defensiveyaw_" .. v42.cond, {
                            nil, 
                            nil, 
                            nil, 
                            nil, 
                            0, 
                            [1] = -v39[v42.cond].yawvalue1:get(), 
                            [2] = -v39[v42.cond].yawvalue1:get() * 0.75, 
                            [3] = -v39[v42.cond].yawvalue1:get() * 0.5, 
                            [4] = -v39[v42.cond].yawvalue1:get() * 0.25, 
                            v39[v42.cond].yawvalue1:get() * 0.25, 
                            v39[v42.cond].yawvalue1:get() * 0.5, 
                            v39[v42.cond].yawvalue1:get() * 0.75, 
                            v39[v42.cond].yawvalue1:get()
                        }, 1) or 0);
                    end;
                end;
            end;
        else
            v33.hidden:override(nil);
        end;
        l_inverter_0 = v35.antiaim.flickexploit:get();
        l_l_inverter_0_0 = v35.antiaim.flickexploit.flicksettings:get();
        if not l_inverter_0 or l_l_inverter_0_0.len == 0 then
            return;
        elseif rage.exploit:get() < 1 then
            return;
        else
            if v35.antiaim.flickexploit:get() and v35.antiaim.flickexploit.flicksettings:get(1) and v42.cond2 == 2 then
                rage.antiaim:inverter(false);
                v33.yawoffset:override(5);
                v33.modifier:override("Disabled");
                v33.bodyyaw:override(true);
                v33.options:override("");
                v33.leftlimit:override(42);
                v33.rightlimit:override(42);
                v33.fs:override(false);
                v33.hidden:override(true);
                rage.antiaim:override_hidden_pitch(89);
                rage.antiaim:override_hidden_yaw_offset(-70);
                rage.antiaim:override_hidden_yaw_offset(-90);
                v33.hslag:override("Break LC");
                v33.dtlag:override("Always On");
                v471.force_defensive = v471.command_number % 7 == 0;
            elseif v35.antiaim.flickexploit:get() and v35.antiaim.flickexploit.flicksettings:get(2) and v42.cond2 == 4 then
                rage.antiaim:inverter(false);
                v33.yawoffset:override(5);
                v33.modifier:override("Offset");
                v33.modoffset:override(1);
                v33.bodyyaw:override(true);
                v33.options:override("");
                v33.leftlimit:override(48);
                v33.rightlimit:override(48);
                v33.fs:override(false);
                v33.hidden:override(true);
                rage.antiaim:override_hidden_pitch(89);
                rage.antiaim:override_hidden_yaw_offset(-70);
                rage.antiaim:override_hidden_yaw_offset(-90);
                v33.hslag:override("Break LC");
                v33.dtlag:override("Always On");
                v471.force_defensive = v471.command_number % 7 == 0;
            elseif v35.antiaim.flickexploit:get() and v35.antiaim.flickexploit.flicksettings:get(3) and v42.cond2 == 5 then
                rage.antiaim:inverter(false);
                v33.yawoffset:override(5);
                v33.modifier:override("Disabled");
                v33.bodyyaw:override(true);
                v33.options:override("");
                v33.leftlimit:override(42);
                v33.rightlimit:override(42);
                v33.fs:override(false);
                v33.hidden:override(true);
                rage.antiaim:override_hidden_pitch(89);
                rage.antiaim:override_hidden_yaw_offset(-70);
                rage.antiaim:override_hidden_yaw_offset(-90);
                v33.hslag:override("Break LC");
                v33.dtlag:override("Always On");
                v471.force_defensive = v471.command_number % 7 == 0;
            elseif v35.antiaim.flickexploit:get() and v35.antiaim.flickexploit.flicksettings:get(4) and v42.cond2 == 7 then
                rage.antiaim:inverter(false);
                v33.yawoffset:override(5);
                v33.modifier:override("Disabled");
                v33.bodyyaw:override(true);
                v33.options:override("");
                v33.leftlimit:override(42);
                v33.rightlimit:override(42);
                v33.fs:override(false);
                v33.hidden:override(true);
                rage.antiaim:override_hidden_pitch(89);
                rage.antiaim:override_hidden_yaw_offset(-70);
                rage.antiaim:override_hidden_yaw_offset(-90);
                v33.hslag:override("Break LC");
                v33.dtlag:override("Always On");
                v471.force_defensive = v471.command_number % 7 == 0;
            end;
            return;
        end;
    end;
end;
local function v489(_)
    -- upvalues: v35 (ref), v33 (ref)
    if v35.misc.no_scope_mode:get() or v35.misc.air_mode:get() then
        local v486 = entity.get_local_player();
        local v487 = v486:get_player_weapon();
        if v487 == nil then
            return;
        else
            local v488 = v487:get_weapon_index();
            if v488 == nil then
                return;
            else
                if bit.band(entity.get_local_player().m_fFlags, bit.lshift(1, 0)) == 0 then
                    if v488 == 40 then
                        v33.ssg_hitchance:override(v35.misc.air_mode.ssg_amount:get());
                    end;
                    if v488 == 9 then
                        v33.awp_hitchance:override(v35.misc.air_mode.awp_amount:get());
                    end;
                    if v488 == 38 or v488 == 11 then
                        v33.autosnipers_hitchance:override(v35.misc.air_mode.autosnipers_amount:get());
                    end;
                else
                    v33.ssg_hitchance:override();
                    v33.awp_hitchance:override();
                    v33.autosnipers_hitchance:override();
                end;
                if not v486.m_bIsScoped or bit.band(entity.get_local_player().m_fFlags, bit.lshift(1, 0)) == 0 then
                    if bit.band(entity.get_local_player().m_fFlags, bit.lshift(1, 0)) == 0 and v35.misc.air_mode:get() then
                        if v488 == 40 then
                            v33.ssg_hitchance:override(v35.misc.air_mode.ssg_amount:get());
                        end;
                        if v488 == 9 then
                            v33.awp_hitchance:override(v35.misc.air_mode.awp_amount:get());
                        end;
                        if v488 == 38 or v488 == 11 then
                            v33.autosnipers_hitchance:override(v35.misc.air_mode.autosnipers_amount:get());
                        end;
                    elseif v35.misc.no_scope_mode:get() then
                        if v488 == 40 then
                            v33.ssg_hitchance:override(v35.misc.no_scope_mode.ssg_amount:get());
                        end;
                        if v488 == 9 then
                            v33.awp_hitchance:override(v35.misc.no_scope_mode.awp_amount:get());
                        end;
                        if v488 == 38 or v488 == 11 then
                            v33.autosnipers_hitchance:override(v35.misc.no_scope_mode.autosnipers_amount:get());
                        end;
                    else
                        v33.ssg_hitchance:override();
                        v33.awp_hitchance:override();
                        v33.autosnipers_hitchance:override();
                    end;
                else
                    v33.ssg_hitchance:override();
                    v33.awp_hitchance:override();
                    v33.autosnipers_hitchance:override();
                end;
            end;
        end;
    end;
end;
events.createmove:set(function(v490)
    -- upvalues: v489 (ref)
    v489(v490);
end);
local function v493(_)
    -- upvalues: v35 (ref), v33 (ref), v466 (ref), l_ffi_0 (ref)
    local v492 = entity.get_local_player();
    if v492 == nil or not v492:is_alive() or not v35.misc.animbreakers:get() then
        return;
    else
        v33.leg:override();
        move = math.sqrt(v492.m_vecVelocity.x ^ 2 + v492.m_vecVelocity.y ^ 2) > 5;
        jump = bit.band(v492.m_fFlags, 1) == 0;
        if v35.misc.animbreakers.ground:get() ~= "disabled" then
            if v35.misc.animbreakers.ground:get() == "backward" then
                v492.m_flPoseParameter[0] = 1;
                v33.leg:override("sliding");
            elseif v35.misc.animbreakers.ground:get() == "moonwalk" then
                v492.m_flPoseParameter[7] = 0;
                v33.leg:override("walking");
            elseif v35.misc.animbreakers.ground:get() == "flex" then
                v33.leg:override("walking");
                v492.m_flPoseParameter[7] = utils.random_float(0.5, 1);
            elseif v35.misc.animbreakers.ground:get() == "bsod" then
                v492.m_flPoseParameter[0] = utils.random_float(0, 1);
            else
                v492.m_flPoseParameter[0] = v466.calculate("ground_jitter", {
                    [1] = -v35.misc.animbreakers.jittervalue:get() / 200 + 1, 
                    [2] = v35.misc.animbreakers.jittervalue1:get() / 200 + 1
                }, -(v35.misc.animbreakers.jitterspeed:get() - 100)) or 0;
                v33.leg:override("sliding");
            end;
        end;
        if v35.misc.animbreakers.movelean:get() and jump and move ~= 0 then
            l_ffi_0.cast("CAnimationLayer_t**", l_ffi_0.cast("uintptr_t", v492[0]) + 10640)[0][12].m_flWeight = v35.misc.animbreakers.movelean:get() / 100;
        elseif v35.misc.animbreakers.addonsanim:get(3) and move ~= 0 then
            l_ffi_0.cast("CAnimationLayer_t**", l_ffi_0.cast("uintptr_t", v492[0]) + 10640)[0][12].m_flWeight = v35.misc.animbreakers.movelean:get() / 100;
        end;
        if v35.misc.animbreakers.addonsanim:get(1) and jump and move then
            l_ffi_0.cast("CAnimationLayer_t**", l_ffi_0.cast("uintptr_t", v492[0]) + 10640)[0][12].m_flWeight = utils.random_float(0, 1, 2);
        elseif v35.misc.animbreakers.addonsanim:get(2) and jump and move then
            l_ffi_0.cast("CAnimationLayer_t**", l_ffi_0.cast("uintptr_t", v492[0]) + 10640)[0][12].m_flWeight = utils.random_float(10, 0);
        end;
        if v35.misc.animbreakers.air:get() ~= "disabled" then
            if v35.misc.animbreakers.air:get() == "static" then
                v492.m_flPoseParameter[6] = v35.misc.animbreakers.airvalue:get() / 100;
            elseif v35.misc.animbreakers.air:get() == "kangaroo" then
                v492.m_flPoseParameter[6] = utils.random_float(0, 1) and utils.random_float(1, 0);
                v492.m_flPoseParameter[6] = utils.random_float(1, 0) and utils.random_float(0, 1);
            elseif v35.misc.animbreakers.air:get() == "moonwalk" and jump and move then
                l_ffi_0.cast("CAnimationLayer_t**", l_ffi_0.cast("uintptr_t", v492[0]) + 10640)[0][6].m_flWeight = 1;
            else
                v492.m_flPoseParameter[6] = 0;
            end;
        end;
        return;
    end;
end;
local function _()
    local v494 = entity.get_local_player();
    if not v494 then
        return false, nil;
    elseif not globals.is_in_game and not globals.is_connected then
        return false, nil;
    elseif not v494:is_alive() then
        return false, nil;
    else
        return true, v494;
    end;
end;
local _ = {
    CSensorGrenade = true, 
    CC4 = true, 
    CWeaponTaser = true, 
    CHEGrenade = true, 
    CKnife = true, 
    CSmokeGrenade = true, 
    CIncendiaryGrenade = true, 
    CMolotovGrenade = true, 
    CDecoyGrenade = true, 
    CFlashbang = true
};
render_bar = function(v497, v498, v499)
    -- upvalues: v32 (ref)
    if v498 == nil or v498 == "" or v498 == " " then
        return;
    else
        render.gradient(vector(13, v32.fullscreen.y - 350 - v499 * 37), vector(13 + render.measure_text(v32.calibri, nil, v498).x / 2, v32.fullscreen.y - 345 - v499 * 37 + 28), color(0, 0, 0, 0), color(0, 0, 0, 60), color(0, 0, 0, 0), color(0, 0, 0, 60), 0);
        render.gradient(vector(13 + render.measure_text(v32.calibri, nil, v498).x, v32.fullscreen.y - 350 - v499 * 37), vector(13 + render.measure_text(v32.calibri, nil, v498).x / 2, v32.fullscreen.y - 345 - v499 * 37 + 28), color(0, 0, 0, 0), color(0, 0, 0, 60), color(0, 0, 0, 0), color(0, 0, 0, 60), 0);
        render.text(v32.calibri, vector(20, v32.fullscreen.y - 343 - v499 * 37), color(0, 0, 0, 150), nil, v498);
        render.text(v32.calibri, vector(19, v32.fullscreen.y - 345 - v499 * 37), v497, nil, v498);
        return;
    end;
end;
AirStrafeFix = function(v500)
    -- upvalues: v35 (ref)
    if not v35.misc.jumpscoutfix:get() then
        return;
    elseif v500.in_moveleft or v500.in_moveright or v500.in_back or v500.in_forward then
        return;
    else
        if (entity.get_local_player().m_vecVelocity * vector(1, 1, 0)):length() <= 3 then
            v500.in_speed = true;
        end;
        return;
    end;
end;
events.createmove:set(function(v501)
    AirStrafeFix(v501);
end);
SkeetCamera = function(v502)
    -- upvalues: v35 (ref), l_mtools_1 (ref)
    local v503 = entity.get_local_player();
    if v503 == nil or not v35.misc.bars.skeetinropolation:get() or not common.is_in_thirdperson() then
        return;
    else
        if v503.m_flDuckAmount > 0 and l_mtools_1.AntiAims.Condition:GetDev("Air") then
            v502.camera.z = v503:get_origin().z + 44.5;
        end;
        return;
    end;
end;
events.override_view:set(function(v504)
    SkeetCamera(v504);
end);
if v35.misc.grenades.nades:get(1) and lp ~= nil and lp:is_alive() then
    local v505 = lp:get_player_weapon();
    if v505 ~= nil then
        local v506 = v505:get_weapon_index();
        if v506 ~= nil and (v506 == 43 or v506 == 44 or v506 == 45 or v506 == 46 or v506 == 47 or v506 == 48) then
            v33.weaponact:override({
                [1] = "", 
                [2] = v33.weaponact:get("Auto Pistols") and "Auto Pistols" or ""
            });
        end;
    end;
end;
local v507 = {
    pixel = 2, 
    default = 1, 
    bold = 4
};
local v508 = 255;
events.render:set(function()
    -- upvalues: v35 (ref), v24 (ref), v508 (ref), v22 (ref), v31 (ref), v507 (ref)
    if not globals.is_in_game then
        return;
    else
        local v509 = entity.get_local_player();
        if not v509:is_alive() then
            return;
        else
            local _ = vector(v509["m_vecVelocity[0]"], v509["m_vecVelocity[1]"], v509["m_vecVelocity[2]"]):length2d();
            if v35.misc.ts:get() then
                if v35.misc.ts.ts_type:get() == "modern" then
                    local v511 = v24.new("manual_offset_anim", v35.misc.ts.offset_manual:get() or 0, 10);
                    local l_r_0 = v35.misc.ts.accent_color:get().r;
                    local l_g_0 = v35.misc.ts.accent_color:get().g;
                    local l_b_0 = v35.misc.ts.accent_color:get().b;
                    act = {
                        [1] = l_r_0, 
                        [2] = l_g_0, 
                        [3] = l_b_0, 
                        [4] = v508
                    };
                    off = {
                        [1] = 0, 
                        [2] = 0, 
                        [3] = 0, 
                        [4] = 0
                    };
                    local v515 = v35.antiaim.manual:get() == "front" and act or off;
                    local v516 = v35.antiaim.manual:get() == "left" and act or off;
                    local v517 = v35.antiaim.manual:get() == "right" and act or off;
                    if v35.antiaim.manual:get() ~= "disabled" or not act then
                        local _ = off;
                    end;
                    render.text(v22.verdana_bold, vector(v31.x / 2, v31.y / 2 - 55), color(v515[1], v515[2], v515[3], v515[4]), "c", "\226\174\153");
                    render.text(v22.verdana_bold, vector(v31.x / 2 - 55 - v511, v31.y / 2), color(v516[1], v516[2], v516[3], v516[4]), "c", "\226\174\152");
                    render.text(v22.verdana_bold, vector(v31.x / 2 + 55 + v511, v31.y / 2), color(v517[1], v517[2], v517[3], v517[4]), "c", "\226\174\154");
                elseif v35.misc.ts.ts_type:get() == "default" then
                    local v519 = v24.new("manual_offset_anim", v35.misc.ts.offset_manual:get() or 0, 10);
                    local l_r_1 = v35.misc.ts.accent_color:get().r;
                    local l_g_1 = v35.misc.ts.accent_color:get().g;
                    local l_b_1 = v35.misc.ts.accent_color:get().b;
                    local l_b_2 = v35.misc.ts.accent_color:get().b;
                    act = {
                        [1] = l_r_1, 
                        [2] = l_g_1, 
                        [3] = l_b_1, 
                        [4] = v508
                    };
                    off = {
                        [1] = 0, 
                        [2] = 0, 
                        [3] = 0, 
                        [4] = 0
                    };
                    l_b_2 = v35.antiaim.manual:get() == "front" and act or off;
                    local v524 = v35.antiaim.manual:get() == "left" and act or off;
                    local v525 = v35.antiaim.manual:get() == "right" and act or off;
                    if v35.antiaim.manual:get() ~= "disabled" or not act then
                        local _ = off;
                    end;
                    render.text(v22.verdana_bold, vector(v31.x / 2 + 1, v31.y / 2 - 55), color(l_b_2[1], l_b_2[2], l_b_2[3], l_b_2[4]), "c", "\226\174\157");
                    render.text(v22.verdana_bold, vector(v31.x / 2 - 55 - v519, v31.y / 2), color(v524[1], v524[2], v524[3], v524[4]), "c", "\226\174\156");
                    render.text(v22.verdana_bold, vector(v31.x / 2 + 55 + v519, v31.y / 2), color(v525[1], v525[2], v525[3], v525[4]), "c", "\226\174\158");
                elseif v35.misc.ts.ts_type:get() == "ambani" then
                    local v527 = v24.new("manual_offset_anim", v35.misc.ts.offset_manual:get() or 0, 10);
                    local l_r_2 = v35.misc.ts.accent_color:get().r;
                    local l_g_2 = v35.misc.ts.accent_color:get().g;
                    local l_b_3 = v35.misc.ts.accent_color:get().b;
                    local l_b_4 = v35.misc.ts.accent_color:get().b;
                    act = {
                        [1] = l_r_2, 
                        [2] = l_g_2, 
                        [3] = l_b_3, 
                        [4] = v508
                    };
                    off = {
                        [1] = 0, 
                        [2] = 0, 
                        [3] = 0, 
                        [4] = 0
                    };
                    l_b_4 = v35.antiaim.manual:get() == "front" and act or off;
                    local v532 = v35.antiaim.manual:get() == "left" and act or off;
                    local v533 = v35.antiaim.manual:get() == "right" and act or off;
                    if v35.antiaim.manual:get() ~= "disabled" or not act then
                        local _ = off;
                    end;
                    render.text(v22.verdana_bold, vector(v31.x / 2 + 1, v31.y / 2 - 55), color(l_b_4[1], l_b_4[2], l_b_4[3], l_b_4[4]), "c", "^");
                    render.text(v22.verdana_bold, vector(v31.x / 2 - 55 - v527, v31.y / 2), color(v532[1], v532[2], v532[3], v532[4]), "c", "\226\157\176");
                    render.text(v22.verdana_bold, vector(v31.x / 2 + 55 + v527, v31.y / 2), color(v533[1], v533[2], v533[3], v533[4]), "c", "\226\157\177");
                elseif v35.misc.ts.ts_type:get() == "custom" then
                    local v535 = v24.new("manual_offset_anim", v35.misc.ts.offset_manual:get() or 0, 10);
                    local l_r_3 = v35.misc.ts.accent_color:get().r;
                    local l_g_3 = v35.misc.ts.accent_color:get().g;
                    local l_b_5 = v35.misc.ts.accent_color:get().b;
                    local l_b_6 = v35.misc.ts.accent_color:get().b;
                    act = {
                        [1] = l_r_3, 
                        [2] = l_g_3, 
                        [3] = l_b_5, 
                        [4] = v508
                    };
                    off = {
                        [1] = 0, 
                        [2] = 0, 
                        [3] = 0, 
                        [4] = 0
                    };
                    l_b_6 = v35.antiaim.manual:get() == "front" and act or off;
                    local v540 = v35.antiaim.manual:get() == "left" and act or off;
                    local v541 = v35.antiaim.manual:get() == "right" and act or off;
                    if v35.antiaim.manual:get() ~= "disabled" or not act then
                        local _ = off;
                    end;
                    render.text(v507[v35.misc.ts.font_manual:get()], vector(v31.x / 2 + 1, v31.y / 2 - 55), color(l_b_6[1], l_b_6[2], l_b_6[3], l_b_6[4]), "c", v35.misc.ts.forward_manual:get());
                    render.text(v507[v35.misc.ts.font_manual:get()], vector(v31.x / 2 - 55 - v535, v31.y / 2), color(v540[1], v540[2], v540[3], v540[4]), "c", v35.misc.ts.left_manual:get());
                    render.text(v507[v35.misc.ts.font_manual:get()], vector(v31.x / 2 + 55 + v535, v31.y / 2), color(v541[1], v541[2], v541[3], v541[4]), "c", v35.misc.ts.right_manual:get());
                end;
            end;
            return;
        end;
    end;
end);
local v543 = {
    scopebool = l_smoothy_0.new(1), 
    dt = l_smoothy_0.new(1), 
    hs = l_smoothy_0.new(1), 
    pa = l_smoothy_0.new(1), 
    fs = l_smoothy_0.new(1), 
    minmd = l_smoothy_0.new(1), 
    daind = l_smoothy_0.new(1), 
    ready = l_smoothy_0.new(1)
};
local function v582(v544)
    -- upvalues: v35 (ref), v41 (ref), v141 (ref)
    if not v35.misc.aimbotlogs:get() then
        return;
    else
        v41.reg = v41.reg + 1;
        if v544.state == nil then
            v41.hit = v41.hit + 1;
        end;
        v141.shots = math.max(v141.shots, 1);
        v141.percentage = math.floor(100 - v141.shots / v41.hit * 100);
        if v35.misc.aimbotlogs:get() then
            local v545 = "\aFFFFFFFF";
            local v546 = "\a" .. v35.misc.aimbotlogs.color:get():to_hex();
            if v544.state == nil then
                local v547 = v41.hitboxes[v544.hitgroup + 1];
                local l_damage_0 = v544.damage;
                local l_hitchance_0 = v544.hitchance;
                local l_wanted_damage_0 = v544.wanted_damage;
                local l_m_iHealth_1 = v544.target.m_iHealth;
                local l_backtrack_0 = v544.backtrack;
                local v553 = v544.target:get_name();
                local v554 = v546 .. "[ignite]" .. v545 .. " ~ hit " .. v546 .. v553 .. v545 .. " in " .. v547 .. " for " .. v546 .. l_damage_0 .. v545 .. " (" .. l_wanted_damage_0 .. ") " .. "[" .. "history: " .. v546 .. l_backtrack_0 .. v545 .. " - " .. "hp: " .. v546 .. l_m_iHealth_1 .. v545 .. "]";
                local v555 = v546 .. "[ignite]" .. v545 .. " ~ hit " .. v546 .. v553 .. v545 .. " in the " .. v546 .. v547 .. v545 .. " for " .. v546 .. l_damage_0 .. v545 .. " (" .. v546 .. l_m_iHealth_1 .. v545 .. " health remaining" .. ") " .. "[" .. "history: " .. v546 .. l_backtrack_0 .. v545 .. " | " .. "hc: " .. v546 .. l_hitchance_0 .. v545 .. "%" .. "]";
                if v35.misc.aimbotlogs.pos:get(1) then
                    print_dev(v555);
                end;
                if v35.misc.aimbotlogs.pos:get(2) then
                    print_raw(v554);
                end;
            end;
            if v544.state ~= nil then
                local v556 = v41.hitboxes[v544.wanted_hitgroup + 1];
                local l_state_0 = v544.state;
                local l_hitchance_1 = v544.hitchance;
                local v559 = v544.spread == nil and "max" or math.ceil(v544.spread * 10) / 10;
                local l_wanted_damage_1 = v544.wanted_damage;
                local l_m_iHealth_2 = v544.target.m_iHealth;
                local l_backtrack_1 = v544.backtrack;
                local v563 = v544.target:get_name();
                local v564 = v546 .. "[ignite]" .. v545 .. " ~ " .. v546 .. "missed " .. v545 .. "shot at " .. v546 .. v563 .. v545 .. " in " .. v556 .. " due to " .. v546 .. l_state_0 .. v545 .. " (" .. l_hitchance_1 .. "%" .. ") " .. "[" .. "damage: " .. v546 .. l_wanted_damage_1 .. v545 .. " - " .. "history: " .. v546 .. l_backtrack_1 .. v545 .. " - " .. "spread: " .. v546 .. v559 .. v545 .. "]";
                local v565 = v546 .. "[ignite]" .. v545 .. " ~ missed " .. v546 .. v563 .. v545 .. " in the " .. v546 .. v556 .. v545 .. " due to " .. v546 .. l_state_0 .. v545 .. " (" .. v546 .. l_m_iHealth_2 .. v545 .. " health remaining" .. ") " .. "[" .. "history: " .. v546 .. l_backtrack_1 .. v545 .. " | " .. "hc: " .. v546 .. l_hitchance_1 .. v545 .. "%" .. "]";
                if v35.misc.aimbotlogs.pos:get(1) then
                    print_dev(v565);
                end;
                if v35.misc.aimbotlogs.pos:get(2) then
                    print_raw(v564);
                end;
            end;
        end;
        if v35.misc.aimbotlogs:get() then
            local v566 = "\aFFFFFFFF";
            local v567 = "\a" .. string.sub(v35.misc.aimbotlogs.color1:get():to_hex(), 1, 6) .. "FF";
            if v544.state == nil then
                local v568 = v41.hitboxes[v544.hitgroup + 1];
                local l_damage_1 = v544.damage;
                local l_hitchance_2 = v544.hitchance;
                local _ = v544.wanted_damage;
                local l_m_iHealth_3 = v544.target.m_iHealth;
                local l_backtrack_2 = v544.backtrack;
                local v574 = v544.target:get_name();
                table.insert(v41.data, 1, {
                    alpha = 0, 
                    text = "" .. v567 .. "" .. v566 .. "hit " .. v567 .. v574 .. v566 .. " in " .. v568 .. " for " .. v567 .. l_damage_1 .. v566 .. " (" .. l_hitchance_2 .. "%" .. ") " .. "[" .. "history: " .. v567 .. l_backtrack_2 .. v566 .. " - " .. "hp: " .. v567 .. l_m_iHealth_3 .. v566 .. "]", 
                    time = globals.realtime
                });
            end;
            if v544.state ~= nil then
                local v575 = v41.hitboxes[v544.wanted_hitgroup + 1];
                local l_state_1 = v544.state;
                local l_hitchance_3 = v544.hitchance;
                local v578 = v544.spread == nil and "max" or math.ceil(v544.spread * 10) / 10;
                local l_wanted_damage_3 = v544.wanted_damage;
                local l_backtrack_3 = v544.backtrack;
                local v581 = v544.target:get_name();
                table.insert(v41.data, 1, {
                    alpha = 0, 
                    text = "" .. v567 .. "" .. "missed " .. v566 .. "shot at " .. v567 .. v581 .. v566 .. " in " .. v575 .. " due to " .. v567 .. l_state_1 .. v566 .. " (" .. l_hitchance_3 .. "%" .. ") " .. "[" .. "damage: " .. v567 .. l_wanted_damage_3 .. v566 .. " - " .. "history: " .. v567 .. l_backtrack_3 .. v566 .. " - " .. "spread: " .. v567 .. v578 .. v566 .. "]", 
                    time = globals.realtime
                });
            end;
        end;
        return;
    end;
end;
hurt = function(v583)
    -- upvalues: v35 (ref)
    local v584 = entity.get_local_player();
    local v585 = entity.get(v583.attacker, true);
    local v586 = entity.get(v583.userid, true);
    local l_weapon_0 = v583.weapon;
    local l_health_0 = v583.health;
    local v589 = v35.misc.aimbotlogs.color:get():to_hex();
    local v590 = "DEFAULT";
    local v591 = ({
        hegrenade = l_health_0 > 0 and "Explode" or "Exploded", 
        inferno = l_health_0 > 0 and "Burn" or "Burned", 
        knife = l_health_0 > 0 and "Hit" or "Knifed"
    })[l_weapon_0];
    if v586 == v584 or v585 ~= v584 then
        return;
    elseif v591 == nil then
        return;
    else
        print_raw(("\a%signite\a%s ~ " .. v591 .. " \a%s%s\a%s for \a%s%s\a%s (\a%s%s\a%s remaining)"):format(v589, v590, v589, v586:get_name(), v590, v589, v583.dmg_health, v590, v589, v583.health, v590));
        return;
    end;
end;
local v592 = {
    pixel = 2, 
    default = 1, 
    bold = 4
};
local v593 = {
    left = 60, 
    bottom = v32.screen.x + 15, 
    right = v32.fullscreen.x - 60
};
local v594 = {
    bottom = v32.fullscreen.y - 10, 
    left = v32.screen.y + 18, 
    right = v32.screen.y + 18
};
local _ = {
    bottom = v32.fullscreen.y - 3.5, 
    left = v32.screen.y + 18, 
    right = v32.screen.y + 18
};
local _ = {
    left = 90, 
    bottom = v32.screen.x + 2, 
    right = v32.fullscreen.x - 90
};
local _ = {
    [1] = v32.screen.x + 2
};
local function v626()
    -- upvalues: v35 (ref), v142 (ref), v24 (ref), l_monylinear_0 (ref), v543 (ref), v33 (ref), v32 (ref), v465 (ref), v592 (ref), v593 (ref), v594 (ref)
    local v598 = entity.get_local_player();
    local v599 = v35.misc.crosshair.style:get();
    local v600 = v35.misc.crosshair:get();
    local v601 = v35.misc.accent1:get();
    v142.get_bind = function(v602)
        local v603 = false;
        local v604 = 0;
        local v605 = ui.get_binds();
        for v606 = 1, #v605 do
            if v605[v606].name == v602 and v605[v606].active then
                v603 = true;
                v604 = v605[v606].value;
            end;
        end;
        return {
            [1] = v603, 
            [2] = v604
        };
    end;
    local v607 = 0;
    if v600 then
        v607 = v24.new("offset_crosshair", v35.misc.crosshair.offset:get() or 0, 10);
    else
        v35.misc.crosshair.offset:set(0);
    end;
    if v600 and v599 == "default" then
        if v598 == nil or not v598:is_alive() then
            return;
        else
            local v608 = l_monylinear_0:Animate("ignite", {
                color(v601.r * 1.2, v601.g * 1.2, v601.b * 1.2, 255), 
                color(v601.r * 0.8, v601.g * 0.8, v601.b * 0.8, 200)
            }, 4, 2);
            v543.scopebool(0.1, v598.m_bIsScoped and 1 or 0);
            v543.dt(0.1, v33.dt:get() and 1 or 0);
            v543.hs(0.1, v33.hs:get() and 1 or 0);
            v543.daind(0.1, v35.misc.dormantaim:get() and 1 or 0);
            v543.minmd(0.1, v142.get_bind("Min. Damage")[1] and 1 or 0);
            v543.fs(0.1, (not not v33.fs:get_override() or v33.fs:get()) and 1 or 0);
            v543.ready(0.1, rage.exploit:get());
            render.text(1, vector(v32.screen.x + 30 * v543.scopebool.value, v32.screen.y + 20 + v607), color(255), "c", v608);
            render.text(1, vector(v32.screen.x + 40 * v543.scopebool.value, v32.screen.y + 31 + v607), color(255, 255 * v543.ready.value + 100 * -(v543.ready.value - 1), 255 * v543.ready.value + 100 * -(v543.ready.value - 1), 255 * v543.dt.value), "c", "doubletap");
            render.text(1, vector(v32.screen.x + 27 * v543.scopebool.value, v32.screen.y + 31 + 10 * v543.dt.value + v607), color(255, 255, 255, 255 * v543.hs.value), "c", "hide");
            render.text(1, vector(v32.screen.x + 27 * v543.scopebool.value, v32.screen.y + 31 + 10 * v543.dt.value + 10 * v543.hs.value + v607), color(255, 255, 255, 255 * v543.minmd.value), "c", "dmg");
            render.text(1, vector(v32.screen.x + 37 * v543.scopebool.value, v32.screen.y + 31 + 10 * v543.dt.value + 10 * v543.hs.value + 10 * v543.minmd.value + v607), color(255, 255, 255, 255 * v543.daind.value), "c", "dormant");
        end;
    elseif v600 and v599 == "modern" then
        if v598 == nil or not v598:is_alive() then
            return;
        else
            local v609 = l_monylinear_0:Animate("ignite", {
                color(v601.r * 1.2, v601.g * 1.2, v601.b * 1.2, 255), 
                color(v601.r * 0.8, v601.g * 0.8, v601.b * 0.8, 200)
            }, 4, 2);
            v543.scopebool(0.1, v598.m_bIsScoped and 1 or 0);
            v543.dt(0.1, v33.dt:get() and 1 or 0);
            v543.hs(0.1, v33.hs:get() and 1 or 0);
            v543.daind(0.1, v35.misc.dormantaim:get() and 1 or 0);
            v543.minmd(0.1, v142.get_bind("Min. Damage")[1] and 1 or 0);
            v543.fs(0.1, (not not v33.fs:get_override() or v33.fs:get()) and 1 or 0);
            v543.ready(0.1, rage.exploit:get());
            render.text(4, vector(v32.screen.x + 30 * v543.scopebool.value, v32.screen.y + 20 + v607), color(255), "c", v609);
            render.text(2, vector(v32.screen.x + 30 * v543.scopebool.value, v32.screen.y + 31 + v607), color(255), "c", v32.cond2[v465(false)]);
            render.text(2, vector(v32.screen.x + 30 * v543.scopebool.value, v32.screen.y + 41 + v607), color(255, 255 * v543.ready.value + 100 * -(v543.ready.value - 1), 255 * v543.ready.value + 100 * -(v543.ready.value - 1), 255 * v543.dt.value), "c", "DT");
            render.circle_outline(vector(v32.screen.x + 30 * v543.scopebool.value + 8, v32.screen.y + 41 + v607), color(255, 255 * v543.ready.value + 100 * -(v543.ready.value - 1), 255 * v543.ready.value + 100 * -(v543.ready.value - 1), 255 * v543.dt.value), 4, 0, rage.exploit:get(), 2);
            render.text(2, vector(v32.screen.x + 30 * v543.scopebool.value, v32.screen.y + 41 + 10 * v543.dt.value + v607), color(v601.r, v601.g, v601.b, 255 * v543.hs.value), "c", "OSAA");
            render.text(2, vector(v32.screen.x + 30 * v543.scopebool.value, v32.screen.y + 41 + 10 * v543.dt.value + 10 * v543.hs.value + v607), color(v601.r, v601.g, v601.b, 255 * v543.minmd.value), "c", "DMG");
            render.text(2, vector(v32.screen.x + 30 * v543.scopebool.value, v32.screen.y + 41 + 10 * v543.dt.value + 10 * v543.hs.value + 10 * v543.minmd.value + v607), color(v601.r, v601.g, v601.b, 255 * v543.daind.value), "c", "DA");
            if v35.misc.crosshair.glowcross:get() then
                render.shadow(vector(v32.screen.x + 30 * v543.scopebool.value - 50, v32.screen.y + v607 - 14), vector(30), color(v601.r, v601.g, v601.b, 255), 20, 50, 5);
            end;
        end;
    end;
    local v610 = entity.get_local_player();
    local v611 = v35.misc.accent1:get();
    v33.weaponact:override();
    v33.scope:override();
    local _ = render.screen_size();
    if not v35.misc.crosshair:get() and not tab_enabled then
        local v613 = l_monylinear_0:Animate("I G N I T E ", {
            color(v611.r * 1.2, v611.g * 1.2, v611.b * 1.2, 255), 
            color(v611.r * 0.8, v611.g * 0.8, v611.b * 0.8, 155)
        }, 4, 3);
        local v614 = l_monylinear_0:Animate("[NIGHTLY]", {
            color(306, 120, 120, 255), 
            color(204, 80, 80, 155)
        }, 4, 3);
        local v615 = l_monylinear_0:Animate(" ~ ignite ~ ", {
            color(v611.r * 1.2, v611.g * 1.2, v611.b * 1.2, 255), 
            color(v611.r * 0.8, v611.g * 0.8, v611.b * 0.8, 155)
        }, 4, 3);
        if v35.misc.watermark32.watermarkstyle:get() == "default" then
            render.text(v592[v35.misc.watermark32.watermarkfonts:get()], vector(v593[v35.misc.watermark32.watermark2:get()], v594[v35.misc.watermark32.watermark2:get()]), color(v611.r, v611.g, v611.b), "ac", v613 .. v614 .. "\n");
        elseif v35.misc.watermark32.watermarkstyle:get() == "modern" then
            render.text(v592[v35.misc.watermark32.watermarkfonts:get()], vector(v593[v35.misc.watermark32.watermark2:get()], v594[v35.misc.watermark32.watermark2:get()]), color(v611.r, v611.g, v611.b), "ac", v615 .. "\n");
        elseif v35.misc.watermark32.watermarkstyle:get() == "custom" then
            render.text(v592[v35.misc.watermark32.watermarkfonts:get()], vector(v593[v35.misc.watermark32.watermark2:get()], v594[v35.misc.watermark32.watermark2:get()]), color(v611.r, v611.g, v611.b), "ac", v35.misc.watermark32.watermarkstylename:get());
        end;
    end;
    if ui.get_alpha() > 0.1 then
        local v616 = l_monylinear_0:Animate("ignite [nightly] ", {
            color(200), 
            color(100)
        }, 4, 3);
        ui.sidebar(v616, ui.get_icon("fire-flame-curved"));
    end;
    if v35.misc.scope:get() and v610 ~= nil and v610:is_alive() then
        v33.scope:override("Remove All");
        v543.scopebool(0, v610.m_bIsScoped and 1 or 0);
        local l_x_3 = render.screen_size().x;
        local l_y_3 = render.screen_size().y;
        local v619 = v35.misc.scope.color.color:get();
        local v620 = v35.misc.scope.color:get() == "Default" and color(v619.r, v619.g, v619.b, 0 * v543.scopebool.value) or color(v619.r, v619.g, v619.b, v619.a);
        local v621 = v35.misc.scope.color:get() == "Default" and color(v619.r, v619.g, v619.b, v619.a) or color(v619.r, v619.g, v619.b, 0 * v543.scopebool.value);
        local v622 = v24.new("position", v610.m_bIsScoped and v35.misc.scope.length:get() * v543.scopebool.value or 0, 10);
        local v623 = v24.new("offset", v610.m_bIsScoped and v35.misc.scope.gap:get() * v543.scopebool.value or 0, 10);
        local v624 = color(v35.misc.scope.color.color:get().r, v35.misc.scope.color.color:get().g, v35.misc.scope.color.color:get().b, v35.misc.scope.color.color:get().a);
        local v625 = color(v35.misc.scope.color.color:get().r, v35.misc.scope.color.color:get().g, v35.misc.scope.color.color:get().b, 0);
        if v35.misc.scope.color:get() == "default" then
            render.gradient(vector(v32.screen.x, v32.screen.y - v623 + 1), vector(v32.screen.x + 1, v32.screen.y - v623 - v622 + 1), v620, v620, v621, v621);
            render.gradient(vector(v32.screen.x, v32.screen.y + v623), vector(v32.screen.x + 1, v32.screen.y + v623 + v622), v620, v620, v621, v621);
            render.gradient(vector(v32.screen.x - v623 + 1, v32.screen.y), vector(v32.screen.x - v623 - v622 + 1, v32.screen.y + 1), v620, v621, v620, v621);
            render.gradient(vector(v32.screen.x + v623, v32.screen.y), vector(v32.screen.x + v623 + v622, v32.screen.y + 1), v620, v621, v620, v621);
        elseif v35.misc.scope.color:get() == "reversed" then
            render.gradient(vector(l_x_3 / 2 - v623 - v622, l_y_3 / 2 + 1), vector(l_x_3 / 2 - v623, l_y_3 / 2), v624, v625, v624, v625);
            render.gradient(vector(l_x_3 / 2 + v623 + v622, l_y_3 / 2 + 1), vector(l_x_3 / 2 + v623, l_y_3 / 2), v624, v625, v624, v625);
            render.gradient(vector(l_x_3 / 2 + 1, l_y_3 / 2 + v623 + v622), vector(l_x_3 / 2, l_y_3 / 2 + v623), v624, v625, v624, v625);
            render.gradient(vector(l_x_3 / 2 + 1, l_y_3 / 2 - v623 - v622), vector(l_x_3 / 2, l_y_3 / 2 - v623), v624, v625, v624, v625);
        end;
    end;
end;
local v627 = 0;
events.override_view:set(function(v628)
    -- upvalues: v35 (ref), v627 (ref), v91 (ref), v33 (ref)
    if v35.misc.scope.addons_scope:get(1) then
        local v629 = entity.get_local_player();
        if v629 == nil then
            return;
        else
            local v630 = v629:get_player_weapon();
            if v630 == nil then
                return;
            else
                local v631 = 0;
                if v629.m_bIsScoped then
                    if v630.m_zoomLevel == 1 then
                        v631 = 10;
                    elseif v630.m_zoomLevel == 2 then
                        v631 = 20;
                    end;
                end;
                if v629.m_bIsScoped then
                    v627 = v91(v627, v33.fov:get() - v631, 12);
                else
                    v627 = v91(v627, v33.fov:get(), 12);
                end;
                v628.fov = v627;
            end;
        end;
    end;
end);
local v636 = {
    speed = 3, 
    step = 1, 
    list = {
        [1] = " ", 
        [2] = "i ", 
        [3] = "ig ", 
        [4] = "ign ", 
        [5] = "igni ", 
        [6] = "ignit ", 
        [7] = "ignite ", 
        [8] = "ignite. ", 
        [9] = "ignite.l ", 
        [10] = "ignite.lu ", 
        [11] = "ignite.lua ", 
        [12] = "ignite.lua ", 
        [13] = "ignite.lua ", 
        [14] = "ignite.lua ", 
        [15] = "ignite.lua ", 
        [16] = "ignite.lu ", 
        [17] = "ignite.l ", 
        [18] = "ignite. ", 
        [19] = "ignite ", 
        [20] = "ignit ", 
        [21] = "igni ", 
        [22] = "ign ", 
        [23] = "ig ", 
        [24] = "i ", 
        [25] = " "
    }, 
    run = function(v632)
        -- upvalues: v33 (ref), v35 (ref)
        local function v634()
            -- upvalues: v632 (ref), v33 (ref)
            local v633 = math.floor(globals.curtime * v632.speed + 0.5) % #v632.list + 1;
            if v633 == v632.step then
                return;
            else
                v632.step = v633;
                v33.clantag:override(false);
                common.set_clan_tag(v632.list[v633]);
                return;
            end;
        end;
        v35.misc.clantag:set_callback(function(v635)
            -- upvalues: v634 (ref)
            if v635:get(3) then
                events.net_update_end:set(v634);
            else
                events.net_update_end:unset(v634);
                common.set_clan_tag("");
            end;
        end, true);
    end
};
local function v637()
    -- upvalues: v33 (ref)
    cvar.r_aspectratio:float(0);
    cvar.viewmodel_fov:float(68, true);
    cvar.viewmodel_offset_x:float(2.5, true);
    cvar.viewmodel_offset_y:float(0, true);
    cvar.viewmodel_offset_z:float(-1.5, true);
    common.set_clan_tag("");
    v33.clantag:override();
end;
trashtalk = {
    phrases = {
        kill = {
            [1] = {
                text = {
                    [1] = {
                        text = "\209\135\209\145 \208\190\209\130\209\129\208\190\209\129\208\176\208\187", 
                        delay = 1
                    }, 
                    [2] = {
                        text = "\208\191\208\184\208\180\208\190\209\128\208\176\209\129 \209\133\209\131\209\145\208\178\209\139\208\185", 
                        delay = 3
                    }
                }
            }, 
            [2] = {
                text = {
                    [1] = {
                        text = "\208\186\208\176\208\191\208\181\209\134 \209\130\209\139 \208\180\208\176\208\187\208\177\208\176\209\145\208\177 \208\177\208\187\209\143", 
                        delay = 1
                    }, 
                    [2] = {
                        text = "\208\189\208\176 \209\136\208\176\208\188\208\191\209\131\209\128 \209\130\208\181\208\177\209\143 \209\129\208\176\208\180\208\184\208\187", 
                        delay = 2
                    }
                }
            }, 
            [3] = {
                text = {
                    [1] = {
                        text = "1", 
                        delay = 1
                    }, 
                    [2] = {
                        text = "\208\191\208\184\208\180\208\190\209\128\208\176\209\129", 
                        delay = 3
                    }
                }
            }, 
            [4] = {
                text = {
                    [1] = {
                        text = "\209\129 \208\188\208\176\208\188\208\190\208\185 \209\130\208\178\208\190\208\181\208\185", 
                        delay = 1
                    }, 
                    [2] = {
                        text = "\208\180\208\182\208\176\208\179\208\176 \208\180\208\182\208\176\208\179\208\176 \208\178\209\129\209\142 \208\189\208\190\209\135\209\140 \208\180\208\181\208\187\208\176\208\187\208\184", 
                        delay = 4
                    }
                }
            }, 
            [5] = {
                text = {
                    [1] = {
                        text = "\208\177\208\187\209\143 \209\129\208\187\208\190\209\131\208\191\208\190\208\186 \208\181\208\177\208\176\208\189\209\139\208\185", 
                        delay = 1
                    }, 
                    [2] = {
                        text = "\208\187\208\184\208\178\208\189\208\184 \209\131\208\182\208\181", 
                        delay = 4
                    }
                }
            }, 
            [6] = {
                text = {
                    [1] = {
                        text = "\208\177\208\187\209\143\209\130\209\140 \208\189\209\131 \208\186\208\176\208\186\208\190\208\185 \208\182\208\181 \209\130\209\139", 
                        delay = 2
                    }, 
                    [2] = {
                        text = "\209\129\208\187\208\176\208\177\209\139\208\185 \208\180\208\176\209\131\208\189 \208\177\208\187\209\143", 
                        delay = 4
                    }
                }
            }, 
            [7] = {
                text = {
                    [1] = {
                        text = "\208\181\209\137\209\145 \208\190\208\180\208\184\208\189 \208\191\208\184\208\180\208\190\209\128\208\176\209\129 \208\191\208\190\208\180\209\131\208\188\208\176\208\187 \209\135\209\130\208\190 \209\131\208\177\209\140\209\145\209\130 \209\133\208\176\209\133", 
                        delay = 1
                    }, 
                    [2] = {
                        text = "\209\143 \208\188\208\176\209\130\209\140 \209\130\208\178\208\190\209\142 \208\181\208\177\208\176\208\187", 
                        delay = 3
                    }
                }
            }, 
            [8] = {
                text = {
                    [1] = {
                        text = "\208\157 \208\149 \208\159 \208\158 \208\145 \208\149 \208\148 \208\152 \208\156 \208\171 \208\153  \208\161", 
                        delay = 1
                    }, 
                    [2] = {
                        text = "I G N I T E", 
                        delay = 2
                    }
                }
            }, 
            [9] = {
                text = {
                    [1] = {
                        text = "\208\165\208\144\208\165\208\144\208\165\208\144\208\165\208\144\208\165\208\144\208\165 \208\189\208\176 \208\184\208\188\208\179\209\131\209\128 \209\130\208\181\208\177\209\143 \208\183\208\176\208\187\209\140\209\142 \208\180\208\176\208\187\208\177\208\176\209\145\208\177\208\176", 
                        delay = 1
                    }, 
                    [2] = {
                        text = "\209\135\209\130\208\190\208\177\209\139 \208\188\208\176\209\130\209\140 \209\131\208\183\208\189\208\176\208\187\208\176 \208\186\208\176\208\186\208\190\208\185 \209\133\209\131\209\145\208\178\209\139\208\185 \209\129\209\139\208\189 \209\131 \208\189\208\181\209\145", 
                        delay = 3
                    }
                }
            }, 
            [10] = {
                text = {
                    [1] = {
                        text = "\208\158 \208\161 \208\162 \208\144 \208\146 \208\144 \208\162 \208\161 \208\175  \208\157 \208\149  \208\159 \208\158 \208\145 \208\149 \208\148 \208\152 \208\156 \208\171 \208\156", 
                        delay = 1
                    }, 
                    [2] = {
                        text = "", 
                        delay = 1
                    }
                }
            }
        }, 
        death = {
            [1] = {
                text = {
                    [1] = {
                        text = "\208\189\209\131 \208\178\208\190\209\130 \208\181\209\137\208\181 \208\190\208\180\208\184\208\189 \208\191\208\184\208\180\208\190\209\128\208\176\209\129 \208\190\208\189\208\187\208\184 \208\189\208\176 \209\131\208\180\208\176\209\135\209\131 \208\189\208\176\208\180\208\181\208\181\209\130\209\129\209\143", 
                        delay = 1
                    }, 
                    [2] = {
                        text = "\209\143 \208\188\208\176\209\130\209\140 \209\130\208\178\208\190\209\142 \208\181\208\177\208\176\208\187 \209\133\208\176\209\135 \209\130\209\131\208\191\208\190\208\185", 
                        delay = 4
                    }
                }
            }, 
            [2] = {
                text = {
                    [1] = {
                        text = "\209\131\208\182\208\176\209\129 \208\181\208\177\208\176\208\189\209\139\208\185", 
                        delay = 1
                    }, 
                    [2] = {
                        text = "\208\178\208\190\209\130 \208\186\208\176\208\186 \208\188\208\181\208\189\209\143 \209\130\208\176\208\186\208\184\208\181 \209\129\209\139\208\189\208\190\208\178\209\140\209\143 \209\136\208\187\209\142\209\133 \209\131\208\177\208\184\208\178\208\176\209\142\209\130", 
                        delay = 4
                    }
                }
            }, 
            [3] = {
                text = {
                    [1] = {
                        text = "\208\177\208\187\209\143\209\130\209\140", 
                        delay = 1
                    }, 
                    [2] = {
                        text = "\208\180\208\176\208\187\208\177\208\176\209\145\208\177 \209\130\209\131\208\191\208\190\208\185 \209\131\208\177\208\184\208\187", 
                        delay = 3
                    }
                }
            }, 
            [4] = {
                text = {
                    [1] = {
                        text = "\208\144\208\165\208\144\208\165\208\144\208\165\208\144\208\165\208\165\208\144\208\165\208\144\208\165\208\144", 
                        delay = 1
                    }, 
                    [2] = {
                        text = "\208\152 \208\162\208\171 \208\147\208\158\208\146\208\158\208\160\208\152\208\168\208\172 \208\167\208\162\208\158 \208\162\208\149\208\145\208\149 \208\157\208\149 \208\146\208\149\208\151\208\129\208\162 \208\161\208\171\208\157 \208\168\208\155\208\174\208\165\208\152", 
                        delay = 4
                    }
                }
            }, 
            [5] = {
                text = {
                    [1] = {
                        text = "\208\149\208\169\208\129 \208\160\208\144\208\151 \208\156\208\149\208\157\208\175 \208\163\208\145\208\172\208\129\208\168\208\172", 
                        delay = 3
                    }, 
                    [2] = {
                        text = "\208\175 \208\162\208\149\208\145\208\149 \208\151\208\163\208\145\208\171 \208\146\208\171\208\160\208\146\208\163", 
                        delay = 4
                    }, 
                    [3] = {
                        text = "\208\156\208\144\208\162\208\172 \208\162\208\146\208\158\208\174 \208\146\208\171\208\159\208\158\208\162\208\160\208\158\208\168\208\163", 
                        delay = 5
                    }, 
                    [4] = {
                        text = "\208\152 \208\145\208\144\208\162\208\174 \208\151\208\144\208\160\208\149\208\150\208\163 \208\157\208\144\208\165\208\163\208\153", 
                        delay = 6
                    }
                }
            }, 
            [6] = {
                text = {
                    [1] = {
                        text = "\208\177\208\187\209\143\209\130\209\140 \208\186\208\176\208\186\208\190\208\185 \208\182\208\181 \209\130\209\139 \209\133\209\131\209\145\208\178\209\139\208\185", 
                        delay = 1
                    }, 
                    [2] = {
                        text = "\208\191\209\128\208\190\209\129\209\130\208\190 \208\189\208\176 \209\135\208\184\209\130 \208\189\208\176\208\180\208\181\208\181\209\136\209\129\209\143", 
                        delay = 4
                    }, 
                    [3] = {
                        text = "\208\177\208\181\208\183\208\188\208\176\208\188\208\189\208\190\208\181 \209\135\209\131\209\135\208\181\208\187\208\190", 
                        delay = 6
                    }, 
                    [4] = {
                        text = "\209\131\209\145\208\177\208\184\209\137\208\181 \208\187\208\176\208\186\208\181\209\128\208\189\208\190\208\181", 
                        delay = 8
                    }
                }
            }
        }, 
        revenge = {
            [1] = {
                text = {
                    [1] = {
                        text = "1", 
                        delay = 1.5
                    }, 
                    [2] = {
                        text = "\208\186\208\176\209\128\208\188\208\176", 
                        delay = 2.5
                    }
                }
            }, 
            [2] = {
                text = {
                    [1] = {
                        text = "1", 
                        delay = 1.5
                    }, 
                    [2] = {
                        text = "\208\186\208\176\208\186 \208\189\208\176\209\133\209\131\208\185 \209\130\208\176\208\186\208\190\208\181 \209\131\208\177\208\184\208\187\208\190 \208\188\208\181\208\189\209\143", 
                        delay = 2.5
                    }
                }
            }
        }
    }
};
previous_number = nil;
local function v643(v638)
    local v639 = nil;
    if v638 == "kill" then
        v639 = trashtalk.phrases.kill;
    elseif v638 == "death" then
        v639 = trashtalk.phrases.death;
    elseif v638 == "revenge" then
        v639 = trashtalk.phrases.revenge;
    else
        return;
    end;
    if #v639 ~= 1 then
        repeat
            number = math.random(#v639);
        until number ~= previous_number;
    else
        number = math.random(#v639);
    end;
    previous_number = number;
    local v640 = v639[number];
    for v641 = 1, #v640.text do
        do
            local l_v641_0 = v641;
            utils.execute_after(v640.text[l_v641_0].delay, function()
                -- upvalues: v640 (ref), l_v641_0 (ref)
                utils.console_exec("say \"" .. v640.text[l_v641_0].text .. "\"");
            end);
        end;
    end;
end;
revenge_guy = nil;
events.player_death:set(function(v644)
    -- upvalues: v35 (ref), v643 (ref)
    if not v35.misc.trashtalk:get() then
        return;
    else
        local v645 = entity.get_local_player();
        local v646 = entity.get(v644.userid, true);
        local v647 = entity.get(v644.attacker, true);
        if v35.misc.trashtalk.trashtalkmode:get(1) and v646 ~= v647 and v647 == v645 then
            v643("kill");
        elseif v35.misc.trashtalk.trashtalkmode:get(2) and v646 == v645 and v645 ~= v647 then
            v643("death");
            revenge_guy = v647;
        elseif v35.misc.trashtalk.trashtalkmode:get(3) and v646 == revenge_guy then
            v643("revenge");
        end;
        return;
    end;
end);
events.round_start:set(function()
    revenge_guy = nil;
end);
local v648 = {
    SCREEN = render.screen_size()
};
local v649 = {
    groups = {
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
    }, 
    list = {}
};
v649.push = function(v650, v651, v652, ...)
    -- upvalues: v649 (ref), l_smoothy_0 (ref)
    table.insert(v649.list, 1, {
        alpha = l_smoothy_0.new(0), 
        type = v652 or "none", 
        time = v651, 
        animation = l_smoothy_0.new(-90), 
        text = v650, 
        args = {
            ...
        }
    });
end;
v649.shot_event = function(v653)
    -- upvalues: v35 (ref), l_gradient_0 (ref), v649 (ref)
    if not v35.misc.aimbotlogs:get() then
        return;
    else
        local v654 = v35.misc.aimbotlogs.time:get();
        local v655 = "";
        local v656 = string.format("\f%s", v655);
        if prefix_style == "Gradient" then
            v656 = l_gradient_0.text(v655, false, {
                first_color:alpha_modulate(255), 
                second_color:alpha_modulate(255)
            });
        end;
        local v657 = prefix_custom and string.format("[%s\aDEFAULT] ", v656) or "";
        if v653.state == nil then
            local v658 = string.format("%shit \f%s\aDEFAULT in the \f%s\aDEFAULT for \f%s\aDEFAULT damage", v657, v653.target:get_name(), v649.groups[v653.hitgroup], v653.damage);
            v649.push(v658, v654, "hit", v653.target:get_steam_avatar());
            return;
        else
            local v659 = string.format("%smissed \f%s\aDEFAULT in the \f%s\aDEFAULT due to \f%s", v657, v653.target:get_name(), v649.groups[v653.wanted_hitgroup], v653.state);
            v649.push(v659, v654, "miss", v653.target:get_steam_avatar());
            return;
        end;
    end;
end;
v649.handle = function()
    -- upvalues: v35 (ref), v24 (ref), v648 (ref), v649 (ref)
    if not v35.misc.aimbotlogs.pos:get(3) then
        return;
    else
        local v660 = v35.misc.aimbotlogs.custom_color:get();
        local v661 = v35.misc.aimbotlogs.logsaddons:get(1);
        local v662 = v35.misc.aimbotlogs.logsaddons:get(2);
        local v663 = v35.misc.aimbotlogs.limit:get();
        local v664 = v24.new("offset_logs", v35.misc.aimbotlogs.offset:get() or 0, 10);
        local v665 = v648.SCREEN / 2 + vector(0, v664);
        local v666 = 0;
        for v667, v668 in ipairs(v649.list) do
            local v669 = ({
                hit = v660 and v35.misc.aimbotlogs.hit_color:get() or color("52D449FF"), 
                miss = v660 and v35.misc.aimbotlogs.miss_color:get() or color("D44949FF")
            })[v668.type];
            if string.find(v668.text, "\f") then
                v668.text = string.gsub(v668.text, "\f", string.format("\a%s", v669:to_hex()));
            end;
            v668.time = v668.time - globals.frametime;
            local v670 = v668.alpha(0.08, v668.time <= 0 and 0 or 1);
            local v671 = v668.animation(0.08, v668.time <= 0.1 and 90 or 0);
            local v672 = 25;
            local v673 = render.measure_text(1, "", v668.text);
            local v674 = v661 and v665.y + v672 / 2 - v673.y / 2 + v666 or v665.y + v666;
            if v661 then
                local v675 = 15;
                local v676 = vector(13, 13);
                local v677 = v665 + vector(-(v673.x / 2) + v671 - v675 / 2, v666);
                local v678 = v673.x + v676.x + v675 + 42;
                render.rect(v677 - vector(v676.x, 0), vector(v678, v672), color(15, 255 * v670), 5);
                render.shadow(v677 - vector(v676.x, 0), vector(v678, v672), v669:alpha_modulate(150 * v670), 30, nil, 5);
            end;
            if v662 then
                local v679 = v673 - vector(0, 10);
                local v680 = vector(v665.x - v673.x / 2 + v671 - 1, v674 + (v661 and 7 or 7));
                render.shadow(v680, vector(v679.x, 1), v669:alpha_modulate(200 * v670), v661 and 80 or nil, nil, 5);
                render.rect(v680, vector(v679.x, 1), v669:alpha_modulate(50 * v670), 0);
            end;
            local v681 = " ignite ~ ";
            render.text(1, vector(v665.x - (v673.x / 2 - 39) + v671 + (v661 and 3 or 0), v674), color(255, 255 * v670), "", v668.text);
            render.text(1, vector(v665.x - (v673.x / 2 + 15) + v671 + (v661 and 3 or 0), v674), v669:alpha_modulate(200 * v670), "", ui.get_icon("fire-flame-curved") .. v681);
            if v663 < v667 or v670 < 0.01 then
                table.remove(v649.list, v667);
            end;
            v666 = v666 + (v661 and v672 + 5 or 13) * v670;
        end;
        return;
    end;
end;
events.render(v649.handle);
events.aim_ack(v649.shot_event);
local l_get_local_player_0 = entity.get_local_player;
local l_get_0 = entity.get;
local _ = table.insert;
local _ = table.remove;
local l_screen_size_0 = render.screen_size;
local _ = math.floor;
local l_line_0 = render.line;
local v689 = false;
local v690 = 1;
local v691 = 0.25;
local v692 = 0.25;
local function v694(v693)
    -- upvalues: l_get_local_player_0 (ref), l_get_0 (ref), v689 (ref), v691 (ref), v692 (ref), v690 (ref)
    if l_get_local_player_0() == l_get_0(v693.attacker, true) then
        v689 = true;
        v691 = 0.25;
        v692 = 0.25;
        v690 = 1;
    end;
end;
local function v696(v695)
    -- upvalues: l_get_local_player_0 (ref), l_get_0 (ref), v691 (ref), v692 (ref), v690 (ref), v689 (ref)
    if l_get_local_player_0() == l_get_0(v695.userid, true) then
        v691 = 0.25;
        v692 = 0.5;
        v690 = 1;
        v689 = false;
    end;
end;
local function v698()
    -- upvalues: v35 (ref), v689 (ref), l_screen_size_0 (ref), v692 (ref), v690 (ref), v691 (ref), l_line_0 (ref)
    if v35.misc.hitmarkers.hitmarkerselect:get(1) then
        if globals.is_in_game == false then
            return;
        elseif v689 then
            local v697 = l_screen_size_0();
            v692 = v692 - globals.frametime;
            if v692 <= 0 then
                v690 = v690 - 1 / v691 * globals.frametime;
            end;
            l_line_0(vector(v697.x / 2 + 5, v697.y / 2 + 5), vector(v697.x / 2 + 10 / v697.x * v697.x, v697.y / 2 + 10 / v697.y * v697.y), color(255, 255, 255, 255 * v690));
            l_line_0(vector(v697.x / 2 - 5, v697.y / 2 + 5), vector(v697.x / 2 - 10 / v697.x * v697.x, v697.y / 2 + 10 / v697.y * v697.y), color(255, 255, 255, 255 * v690));
            l_line_0(vector(v697.x / 2 - 5, v697.y / 2 - 5), vector(v697.x / 2 - 10 / v697.x * v697.x, v697.y / 2 - 10 / v697.y * v697.y), color(255, 255, 255, 255 * v690));
            l_line_0(vector(v697.x / 2 + 5, v697.y / 2 - 5), vector(v697.x / 2 + 10 / v697.x * v697.x, v697.y / 2 - 10 / v697.y * v697.y), color(255, 255, 255, 255 * v690));
        end;
    end;
end;
events.round_start:set(function()
    -- upvalues: v689 (ref), v690 (ref), v691 (ref), v692 (ref)
    v689 = false;
    v690 = 1;
    v691 = 0.25;
    v692 = 0.25;
end);
events.render:set(function(_)
    -- upvalues: v698 (ref)
    v698();
end);
events.player_spawned:set(function(v700)
    -- upvalues: v696 (ref)
    v696(v700);
end);
events.player_hurt:set(function(v701)
    -- upvalues: v694 (ref)
    v694(v701);
end);
local l_world_to_screen_0 = render.world_to_screen;
local _ = render.rect;
local l_screen_size_1 = render.screen_size;
local _ = ui.find;
local v706 = 0.5;
local v707 = 1;
local v708 = {};
local function v716()
    -- upvalues: v35 (ref), v708 (ref), v706 (ref), l_world_to_screen_0 (ref), l_screen_size_1 (ref)
    if not v35.misc.hitmarkers.hitmarkerselect:get(2) then
        return;
    else
        for v709, v710 in pairs(v708) do
            if v710.FadeTime <= 0 then
                v708[v709] = nil;
            else
                v710.WaitTime = v710.WaitTime - globals.frametime;
                if v710.WaitTime <= 0 then
                    v710.FadeTime = v710.FadeTime - 1 / v706 * globals.frametime;
                end;
                local v711 = v35.misc.hitmarkers.kibitcolor:get();
                if v710.Position.x ~= nil and v710.Position.y ~= nil and v710.Position.z ~= nil and v710.Reason == nil then
                    local v712 = l_world_to_screen_0(vector(v710.Position.x, v710.Position.y, v710.Position.z));
                    if v712 ~= nil then
                        local l_x_4 = v712.x;
                        local l_y_4 = v712.y;
                        local v715 = l_screen_size_1();
                        render.rect_outline(vector(l_x_4 - 1 / v715.x * v715.x, l_y_4 - 5 / v715.y * v715.y), vector(l_x_4 + 1 / v715.x * v715.x, l_y_4 + 5 / v715.y * v715.y), color(v711.r, v711.g, v711.b, 255 * v710.FadeTime), 0, true);
                        render.rect_outline(vector(l_x_4 - 5 / v715.x * v715.x, l_y_4 - 1 / v715.y * v715.y), vector(l_x_4 + 5 / v715.x * v715.x, l_y_4 + 1 / v715.y * v715.y), color(v711.r, v711.g, v711.b, 255 * v710.FadeTime), 0, true);
                    end;
                end;
            end;
        end;
        return;
    end;
end;
local function v718(v717)
    -- upvalues: v708 (ref), v707 (ref)
    v708[v717.id] = {
        FadeTime = 1, 
        Position = v717.aim, 
        WaitTime = v707, 
        Reason = v717.state
    };
end;
events.render:set(function(_)
    -- upvalues: v716 (ref)
    v716();
end);
events.aim_ack:set(function(v720)
    -- upvalues: v718 (ref)
    v718(v720);
end);
events.round_start:set(function()
    -- upvalues: v708 (ref)
    v708 = {};
end);
events.player_spawned:set(function(_)
    -- upvalues: v708 (ref)
    v708 = {};
end);
l_pui_0.setup({
    [1] = v35.antiaim, 
    [2] = v38, 
    [3] = v39, 
    [4] = v35.misc
});
export = v104("presets.export", v30, function()
    -- upvalues: v35 (ref), l_pui_0 (ref), l_clipboard_0 (ref), l_base64_0 (ref), v46 (ref)
    if v35.info.presets_list:get() ~= 1 then
        local v722 = l_pui_0.save();
        local v723 = presets_data.name[v35.info.presets_list:get()];
        local v724 = {
            name = v723, 
            file = v722
        };
        l_clipboard_0.set(l_base64_0.encode(json.stringify(v724)));
        v46 = globals.realtime;
        v35.info.presets_success_export:name("\affe8dbff\f<file-import>  successfully exported: \r" .. v723);
    end;
end);
import = v104("presets.import", v30, function()
    -- upvalues: l_base64_0 (ref), l_clipboard_0 (ref), v112 (ref), v47 (ref), v35 (ref), v45 (ref)
    local v725 = json.parse(l_base64_0.decode(l_clipboard_0.get()));
    if v112(presets_data.name, v725.name) then
        v47 = globals.realtime;
        v35.info.presets_success_exist:name("\affdbe3ff\f<triangle-exclamation>  this preset already exist: \r" .. v725.name);
        return;
    else
        table.insert(presets_data.name, v725.name);
        table.insert(presets_data.file, v725.file);
        v35.info.presets_list:update(presets_data.name);
        files.write("nl/ignite/configuration.txt", l_base64_0.encode(json.stringify(presets_data)));
        v45 = globals.realtime;
        v35.info.presets_success_import:name("\affe8dbff\f<file-import>  successfully imported: \r" .. v725.name);
        return;
    end;
end);
create = v104("presets.save", v30, function()
    -- upvalues: v35 (ref), l_pui_0 (ref), v112 (ref), l_base64_0 (ref), v47 (ref)
    local v726 = v35.info.presets_name:get();
    local v727 = l_pui_0.save();
    if not v112(presets_data.name, v726) and v35.info.presets_name:get() ~= "" then
        table.insert(presets_data.name, v726);
        table.insert(presets_data.file, v727);
        files.write("nl/ignite/configuration.txt", l_base64_0.encode(json.stringify(presets_data)));
        v35.info.presets_list:update(presets_data.name);
    elseif v112(presets_data.name, v726) then
        v47 = globals.realtime;
        v35.info.presets_success_exist:name("\affdbe3ff\f<triangle-exclamation>  this preset already exist: \r" .. v726);
    end;
end);
save = v104("presets.save", v30, function()
    -- upvalues: v35 (ref), l_pui_0 (ref), l_base64_0 (ref)
    if v35.info.presets_list:get() ~= 1 then
        presets_data.file[v35.info.presets_list:get()] = l_pui_0.save();
        files.write("nl/ignite/configuration.txt", l_base64_0.encode(json.stringify(presets_data)));
    end;
end);
remove = v104("presets.remove", v30, function()
    -- upvalues: v35 (ref), l_base64_0 (ref)
    if v35.info.presets_list:get() ~= 1 then
        table.remove(presets_data.name, v35.info.presets_list:get());
        table.remove(presets_data.file, v35.info.presets_list:get());
        files.write("nl/ignite/configuration.txt", l_base64_0.encode(json.stringify(presets_data)));
        v35.info.presets_list:update(presets_data.name);
    end;
end);
aa = v104("presets.aa", v30, function()
    -- upvalues: v35 (ref), l_pui_0 (ref), l_base64_0 (ref)
    if v35.info.presets_list:get() ~= 1 then
        l_pui_0.load(presets_data.file[v35.info.presets_list:get()], 1);
        l_pui_0.load(presets_data.file[v35.info.presets_list:get()], 2);
        l_pui_0.load(presets_data.file[v35.info.presets_list:get()], 3);
    else
        local v728 = json.parse(l_base64_0.decode("eyJmaWxlIjpbeyJiYWNrc3RhYiI6dHJ1ZSwiY29uZGl0aW9ucyI6InNoYXJlZCIsImVuYWJsZSI6MS4wLCJmbGlja2V4cGxvaXQiOnRydWUsImZvcmNlaW50ZXJwb2xhdGlvbiI6ZmFsc2UsImZzIjpmYWxzZSwibGFkZGVyX3NlbGVjdCI6dHJ1ZSwibWFudWFsIjoiZGlzYWJsZWQiLCJub2ZhbGxkYW1hZ2UiOnRydWUsInNhZmUiOnRydWUsIn5jb25kaXRpb25zIjp7ImJhc2UiOiJhdCB0YXJnZXQiLCJwaXRjaCI6ImRvd24ifSwifmZsaWNrZXhwbG9pdCI6eyJmbGlja3NldHRpbmdzIjpbMS4wLDIuMCwzLjAsIn4iXX0sIn5tYW51YWwiOnsic3RhdGljIjpmYWxzZX0sIn5zYWZlIjp7IndlYXBvbnMiOls0LjAsNS4wLDYuMCw3LjAsIn4iXX19LFt7ImJvZHl5YXciOnRydWUsImJyZWFrbGMiOnRydWUsImRlZmVuc2l2ZSI6dHJ1ZSwiZW5hYmxlIjpmYWxzZSwibW9kaWZpZXIiOiJkaXNhYmxlZCIsInlhdyI6ImJhY2t3YXJkIn0seyJib2R5eWF3Ijp0cnVlLCJicmVha2xjIjp0cnVlLCJkZWZlbnNpdmUiOnRydWUsImVuYWJsZSI6dHJ1ZSwibW9kaWZpZXIiOiJvZmZzZXQiLCJ5YXciOiJiYWNrd2FyZCJ9LHsiYm9keXlhdyI6dHJ1ZSwiYnJlYWtsYyI6dHJ1ZSwiZGVmZW5zaXZlIjp0cnVlLCJlbmFibGUiOnRydWUsIm1vZGlmaWVyIjoib2Zmc2V0IiwieWF3IjoiYmFja3dhcmQifSx7ImJvZHl5YXciOnRydWUsImJyZWFrbGMiOnRydWUsImRlZmVuc2l2ZSI6dHJ1ZSwiZW5hYmxlIjp0cnVlLCJtb2RpZmllciI6Im9mZnNldCIsInlhdyI6ImJhY2t3YXJkIn0seyJib2R5eWF3Ijp0cnVlLCJicmVha2xjIjp0cnVlLCJkZWZlbnNpdmUiOnRydWUsImVuYWJsZSI6dHJ1ZSwibW9kaWZpZXIiOiIzLXdheSIsInlhdyI6ImJhY2t3YXJkIn0seyJib2R5eWF3Ijp0cnVlLCJicmVha2xjIjp0cnVlLCJkZWZlbnNpdmUiOnRydWUsImVuYWJsZSI6dHJ1ZSwibW9kaWZpZXIiOiJvZmZzZXQiLCJ5YXciOiJiYWNrd2FyZCJ9LHsiYm9keXlhdyI6dHJ1ZSwiYnJlYWtsYyI6dHJ1ZSwiZGVmZW5zaXZlIjp0cnVlLCJlbmFibGUiOnRydWUsIm1vZGlmaWVyIjoib2Zmc2V0IiwieWF3IjoiYmFja3dhcmQifSx7ImJvZHl5YXciOnRydWUsImJyZWFrbGMiOnRydWUsImRlZmVuc2l2ZSI6dHJ1ZSwiZW5hYmxlIjp0cnVlLCJtb2RpZmllciI6Im9mZnNldCIsInlhdyI6ImJhY2t3YXJkIn0seyJib2R5eWF3Ijp0cnVlLCJicmVha2xjIjpmYWxzZSwiZGVmZW5zaXZlIjp0cnVlLCJlbmFibGUiOnRydWUsIm1vZGlmaWVyIjoiMy13YXkiLCJ5YXciOiJiYWNrd2FyZCJ9XSxbeyJib2R5eWF3cmFuZG9tIjoyLjAsImRlbGF5IjoxLjAsImRzZWxlY3QiOlsxLjAsMi4wLCJ+Il0sImZsdWN0dWF0ZXlhdyI6ZmFsc2UsImZzIjoib2ZmIiwibGVmdCI6MC4wLCJsZWZ0bGltaXQiOjYwLjAsIm1vZGUiOiJzdGF0aWMiLCJtb2RsZWZ0IjowLjAsIm1vZG1vZGUiOiJzdGF0aWMiLCJtb2RyaWdodCI6MC4wLCJtb2RzdGF0aWMiOjAuMCwib3B0aW9ucyI6WyJqaXR0ZXIiLCJ+Il0sInBpdGNoIjoic3RhdGljIiwicGl0Y2h2YWx1ZTEiOi04OS4wLCJwaXRjaHZhbHVlMiI6MC4wLCJyYW5kb21tb2RpZmVyIjpmYWxzZSwicmlnaHQiOjAuMCwicmlnaHRsaW1pdCI6NjAuMCwic3RhdGljIjowLjAsInlhdyI6Im5ldmVybG9zZSIsInlhd3NwZWVkIjoxMC4wLCJ5YXd2YWx1ZTEiOjAuMCwieWF3dmFsdWUyIjowLjAsInlhd3dheTEiOjAuMCwieWF3d2F5MiI6MC4wLCJ5YXd3YXkzIjowLjAsInlhd3dheTQiOjAuMCwieWF3d2F5NSI6MC4wfSx7ImJvZHl5YXdyYW5kb20iOjEyLjAsImRlbGF5IjoxLjAsImRzZWxlY3QiOlsxLjAsMi4wLCJ+Il0sImZsdWN0dWF0ZXlhdyI6dHJ1ZSwiZnMiOiJvZmYiLCJsZWZ0IjotMTguMCwibGVmdGxpbWl0Ijo2MC4wLCJtb2RlIjoibGVmdCAmIHJpZ2h0IiwibW9kbGVmdCI6LTQuMCwibW9kbW9kZSI6ImxlZnQgJiByaWdodCIsIm1vZHJpZ2h0Ijo0LjAsIm1vZHN0YXRpYyI6MC4wLCJvcHRpb25zIjpbImppdHRlciIsIn4iXSwicGl0Y2giOiJzdGF0aWMiLCJwaXRjaHZhbHVlMSI6ODkuMCwicGl0Y2h2YWx1ZTIiOjAuMCwicmFuZG9tbW9kaWZlciI6dHJ1ZSwicmlnaHQiOjM4LjAsInJpZ2h0bGltaXQiOjYwLjAsInN0YXRpYyI6MC4wLCJ5YXciOiJzdGF0aWMiLCJ5YXdzcGVlZCI6MTAuMCwieWF3dmFsdWUxIjotNC4wLCJ5YXd2YWx1ZTIiOjAuMCwieWF3d2F5MSI6MC4wLCJ5YXd3YXkyIjowLjAsInlhd3dheTMiOjAuMCwieWF3d2F5NCI6MC4wLCJ5YXd3YXk1IjowLjB9LHsiYm9keXlhd3JhbmRvbSI6Mi4wLCJkZWxheSI6Mi4wLCJkc2VsZWN0IjpbMS4wLDIuMCwifiJdLCJmbHVjdHVhdGV5YXciOnRydWUsImZzIjoib2ZmIiwibGVmdCI6LTI2LjAsImxlZnRsaW1pdCI6NjAuMCwibW9kZSI6ImxlZnQgJiByaWdodCIsIm1vZGxlZnQiOi00LjAsIm1vZG1vZGUiOiJsZWZ0ICYgcmlnaHQiLCJtb2RyaWdodCI6NC4wLCJtb2RzdGF0aWMiOjAuMCwib3B0aW9ucyI6WyJqaXR0ZXIiLCJ+Il0sInBpdGNoIjoic3RhdGljIiwicGl0Y2h2YWx1ZTEiOjg5LjAsInBpdGNodmFsdWUyIjowLjAsInJhbmRvbW1vZGlmZXIiOnRydWUsInJpZ2h0IjozNi4wLCJyaWdodGxpbWl0Ijo2MC4wLCJzdGF0aWMiOjAuMCwieWF3Ijoic3RhdGljIiwieWF3c3BlZWQiOjEwLjAsInlhd3ZhbHVlMSI6LTQuMCwieWF3dmFsdWUyIjowLjAsInlhd3dheTEiOjAuMCwieWF3d2F5MiI6MC4wLCJ5YXd3YXkzIjowLjAsInlhd3dheTQiOjAuMCwieWF3d2F5NSI6MC4wfSx7ImJvZHl5YXdyYW5kb20iOjIuMCwiZGVsYXkiOjEuMCwiZHNlbGVjdCI6WzEuMCwyLjAsIn4iXSwiZmx1Y3R1YXRleWF3Ijp0cnVlLCJmcyI6Im9mZiIsImxlZnQiOi0zOS4wLCJsZWZ0bGltaXQiOjYwLjAsIm1vZGUiOiJsZWZ0ICYgcmlnaHQiLCJtb2RsZWZ0IjotNC4wLCJtb2Rtb2RlIjoibGVmdCAmIHJpZ2h0IiwibW9kcmlnaHQiOjQuMCwibW9kc3RhdGljIjowLjAsIm9wdGlvbnMiOlsiaml0dGVyIiwifiJdLCJwaXRjaCI6InN0YXRpYyIsInBpdGNodmFsdWUxIjo4OS4wLCJwaXRjaHZhbHVlMiI6MC4wLCJyYW5kb21tb2RpZmVyIjp0cnVlLCJyaWdodCI6NDQuMCwicmlnaHRsaW1pdCI6NjAuMCwic3RhdGljIjowLjAsInlhdyI6InN0YXRpYyIsInlhd3NwZWVkIjoxMC4wLCJ5YXd2YWx1ZTEiOi00LjAsInlhd3ZhbHVlMiI6MC4wLCJ5YXd3YXkxIjowLjAsInlhd3dheTIiOjAuMCwieWF3d2F5MyI6MC4wLCJ5YXd3YXk0IjowLjAsInlhd3dheTUiOjAuMH0seyJib2R5eWF3cmFuZG9tIjoxMi4wLCJkZWxheSI6MS4wLCJkc2VsZWN0IjpbMS4wLDIuMCwifiJdLCJmbHVjdHVhdGV5YXciOnRydWUsImZzIjoib2ZmIiwibGVmdCI6LTEuMCwibGVmdGxpbWl0Ijo2MC4wLCJtb2RlIjoibGVmdCAmIHJpZ2h0IiwibW9kbGVmdCI6LTUuMCwibW9kbW9kZSI6ImxlZnQgJiByaWdodCIsIm1vZHJpZ2h0Ijo1LjAsIm1vZHN0YXRpYyI6MC4wLCJvcHRpb25zIjpbImppdHRlciIsIn4iXSwicGl0Y2giOiJzdGF0aWMiLCJwaXRjaHZhbHVlMSI6ODkuMCwicGl0Y2h2YWx1ZTIiOjAuMCwicmFuZG9tbW9kaWZlciI6dHJ1ZSwicmlnaHQiOi0xLjAsInJpZ2h0bGltaXQiOjYwLjAsInN0YXRpYyI6MC4wLCJ5YXciOiJzdGF0aWMiLCJ5YXdzcGVlZCI6MTAuMCwieWF3dmFsdWUxIjotNS4wLCJ5YXd2YWx1ZTIiOjAuMCwieWF3d2F5MSI6MC4wLCJ5YXd3YXkyIjowLjAsInlhd3dheTMiOjAuMCwieWF3d2F5NCI6MC4wLCJ5YXd3YXk1IjowLjB9LHsiYm9keXlhd3JhbmRvbSI6Mi4wLCJkZWxheSI6Mi4wLCJkc2VsZWN0IjpbMS4wLDIuMCwifiJdLCJmbHVjdHVhdGV5YXciOnRydWUsImZzIjoib2ZmIiwibGVmdCI6LTIzLjAsImxlZnRsaW1pdCI6NjAuMCwibW9kZSI6ImxlZnQgJiByaWdodCIsIm1vZGxlZnQiOi00LjAsIm1vZG1vZGUiOiJsZWZ0ICYgcmlnaHQiLCJtb2RyaWdodCI6NC4wLCJtb2RzdGF0aWMiOjAuMCwib3B0aW9ucyI6WyJqaXR0ZXIiLCJ+Il0sInBpdGNoIjoic3RhdGljIiwicGl0Y2h2YWx1ZTEiOjg5LjAsInBpdGNodmFsdWUyIjowLjAsInJhbmRvbW1vZGlmZXIiOnRydWUsInJpZ2h0IjozNy4wLCJyaWdodGxpbWl0Ijo2MC4wLCJzdGF0aWMiOjAuMCwieWF3Ijoic3RhdGljIiwieWF3c3BlZWQiOjEwLjAsInlhd3ZhbHVlMSI6LTQuMCwieWF3dmFsdWUyIjowLjAsInlhd3dheTEiOjAuMCwieWF3d2F5MiI6MC4wLCJ5YXd3YXkzIjowLjAsInlhd3dheTQiOjAuMCwieWF3d2F5NSI6MC4wfSx7ImJvZHl5YXdyYW5kb20iOjIuMCwiZGVsYXkiOjEuMCwiZHNlbGVjdCI6WzEuMCwyLjAsIn4iXSwiZmx1Y3R1YXRleWF3Ijp0cnVlLCJmcyI6Im9mZiIsImxlZnQiOi0xNC4wLCJsZWZ0bGltaXQiOjYwLjAsIm1vZGUiOiJsZWZ0ICYgcmlnaHQiLCJtb2RsZWZ0IjotNC4wLCJtb2Rtb2RlIjoibGVmdCAmIHJpZ2h0IiwibW9kcmlnaHQiOjQuMCwibW9kc3RhdGljIjowLjAsIm9wdGlvbnMiOlsiaml0dGVyIiwifiJdLCJwaXRjaCI6InN0YXRpYyIsInBpdGNodmFsdWUxIjo4OS4wLCJwaXRjaHZhbHVlMiI6MC4wLCJyYW5kb21tb2RpZmVyIjp0cnVlLCJyaWdodCI6MzIuMCwicmlnaHRsaW1pdCI6NjAuMCwic3RhdGljIjowLjAsInlhdyI6InN0YXRpYyIsInlhd3NwZWVkIjoxMC4wLCJ5YXd2YWx1ZTEiOi00LjAsInlhd3ZhbHVlMiI6MC4wLCJ5YXd3YXkxIjowLjAsInlhd3dheTIiOjAuMCwieWF3d2F5MyI6MC4wLCJ5YXd3YXk0IjowLjAsInlhd3dheTUiOjAuMH0seyJib2R5eWF3cmFuZG9tIjoyLjAsImRlbGF5IjoyLjAsImRzZWxlY3QiOlsxLjAsMi4wLCJ+Il0sImZsdWN0dWF0ZXlhdyI6dHJ1ZSwiZnMiOiJvZmYiLCJsZWZ0IjotMjAuMCwibGVmdGxpbWl0Ijo2MC4wLCJtb2RlIjoibGVmdCAmIHJpZ2h0IiwibW9kbGVmdCI6LTQuMCwibW9kbW9kZSI6ImxlZnQgJiByaWdodCIsIm1vZHJpZ2h0Ijo0LjAsIm1vZHN0YXRpYyI6MC4wLCJvcHRpb25zIjpbImppdHRlciIsIn4iXSwicGl0Y2giOiJzdGF0aWMiLCJwaXRjaHZhbHVlMSI6ODkuMCwicGl0Y2h2YWx1ZTIiOjAuMCwicmFuZG9tbW9kaWZlciI6dHJ1ZSwicmlnaHQiOjQwLjAsInJpZ2h0bGltaXQiOjYwLjAsInN0YXRpYyI6MC4wLCJ5YXciOiJzdGF0aWMiLCJ5YXdzcGVlZCI6MTAuMCwieWF3dmFsdWUxIjotNC4wLCJ5YXd2YWx1ZTIiOjAuMCwieWF3d2F5MSI6MC4wLCJ5YXd3YXkyIjowLjAsInlhd3dheTMiOjAuMCwieWF3d2F5NCI6MC4wLCJ5YXd3YXk1IjowLjB9LHsiYm9keXlhd3JhbmRvbSI6Mi4wLCJkZWxheSI6MS4wLCJkc2VsZWN0IjpbMS4wLDIuMCwifiJdLCJmbHVjdHVhdGV5YXciOnRydWUsImZzIjoib2ZmIiwibGVmdCI6LTEuMCwibGVmdGxpbWl0Ijo2MC4wLCJtb2RlIjoibGVmdCAmIHJpZ2h0IiwibW9kbGVmdCI6LTUuMCwibW9kbW9kZSI6ImxlZnQgJiByaWdodCIsIm1vZHJpZ2h0Ijo1LjAsIm1vZHN0YXRpYyI6MC4wLCJvcHRpb25zIjpbImppdHRlciIsIn4iXSwicGl0Y2giOiJzdGF0aWMiLCJwaXRjaHZhbHVlMSI6ODkuMCwicGl0Y2h2YWx1ZTIiOjAuMCwicmFuZG9tbW9kaWZlciI6dHJ1ZSwicmlnaHQiOjEuMCwicmlnaHRsaW1pdCI6NjAuMCwic3RhdGljIjowLjAsInlhdyI6InN0YXRpYyIsInlhd3NwZWVkIjoxMC4wLCJ5YXd2YWx1ZTEiOi01LjAsInlhd3ZhbHVlMiI6MC4wLCJ5YXd3YXkxIjowLjAsInlhd3dheTIiOjAuMCwieWF3d2F5MyI6MC4wLCJ5YXd3YXk0IjowLjAsInlhd3dheTUiOjAuMH1dLHsiYWNjZW50MSI6IiM5QTlBQjJGRiIsImFpbWJvdGxvZ3MiOnRydWUsImFuaW1icmVha2VycyI6dHJ1ZSwiYXNwZWN0Ijp0cnVlLCJiYXJzIjp0cnVlLCJjbGFudGFnIjp0cnVlLCJjcm9zc2hhaXIiOmZhbHNlLCJkb3JtYW50YWltIjpmYWxzZSwiZ3JlbmFkZXMiOnRydWUsImhpdGNoYW5jZSI6ZmFsc2UsImp1bXBzY291dGZpeCI6dHJ1ZSwibWluZG1nIjp0cnVlLCJwaW5ndW5sb2NrZXIiOnRydWUsInJldm9sdmVyIjp0cnVlLCJzY29wZSI6ZmFsc2UsInRyYXNodGFsayI6ZmFsc2UsInRzIjp0cnVlLCJ2aWV3bW9kZWwiOnRydWUsIndhdGVybWFyazMyIjp7IndhdGVybWFyazIiOiJib3R0b20iLCJ3YXRlcm1hcmtmb250cyI6ImRlZmF1bHQiLCJ3YXRlcm1hcmtzdHlsZSI6ImRlZmF1bHQiLCJ3YXRlcm1hcmtzdHlsZW5hbWUiOiIifSwifmFpbWJvdGxvZ3MiOnsiY29sb3IiOiIjOUE5QUIyRkYiLCJjdXN0b21fY29sb3IiOnRydWUsImhpdF9jb2xvciI6IiM5QTlBQjJGRiIsImxpbWl0IjozLjAsImxvZ3NhZGRvbnMiOlsiQmFja2dyb3VuZCIsIn4iXSwibWlzc19jb2xvciI6IiM2NDY0NjRGRiIsIm9mZnNldCI6NDAwLjAsInBvcyI6WzEuMCwyLjAsMy4wLCJ+Il0sInRpbWUiOjMuMH0sIn5hbmltYnJlYWtlcnMiOnsiYWlyIjoiZGlzYWJsZWQiLCJhaXJ2YWx1ZSI6MTAwLjAsImdyb3VuZCI6ImJzb2QiLCJqaXR0ZXJzcGVlZCI6MTAwLjAsImppdHRlcnZhbHVlIjoxMDAuMCwiaml0dGVydmFsdWUxIjoxMDAuMCwibW92ZWxlYW4iOjEwMC4wfSwifmFzcGVjdCI6eyJ2YWwiOjEyNS4wfSwifmJhcnMiOnsiKmhpdG1hcmtlcmNyb3NzaGFpciI6IiM5QTlBQjJGRiIsImhpdG1hcmtlcmNyb3NzaGFpciI6dHJ1ZSwia2VlcF9tb2RlbF90cmFuc3BhcmVuY3kiOnRydWUsIm1vZGUiOlsxLjAsMi4wLDMuMCw0LjAsNi4wLDguMCw5LjAsMTEuMCwxMi4wLDEzLjAsMTQuMCwxNS4wLCJ+Il0sInNrZWV0aW5yb3BvbGF0aW9uIjp0cnVlfSwifmNyb3NzaGFpciI6eyJvZmZzZXQiOjAuMCwic3R5bGUiOiJkZWZhdWx0In0sIn5kb3JtYW50YWltIjp7ImF1dG9zY29wZWRhIjp0cnVlLCJhdXRvc3RvcGRhIjp0cnVlLCJoaXRib3hlc2RhIjpbIn4iXSwiaGl0Y2hhbmNlZGEiOjYwLjAsImxvZ3NkYSI6ZmFsc2V9LCJ+Z3JlbmFkZXMiOnsibmFkZWhvdGtleSI6MTEzLjAsIm5hZGVzIjpbMS4wLDIuMCwzLjAsIn4iXSwicmVhbGVzZTMyIjoyNS4wLCJzZWxlY3RuYWRlcyI6WzEuMCwzLjAsIn4iXX0sIn5oaXRjaGFuY2UiOnsiaW5haXJfaGMiOjEuMCwiaW5haXJfaGNfc2xkZWlyIjozNS4wLCJub3Njb3BlX2hjX3NsZGVpciI6MzUuMH0sIn5taW5kbWciOnsiZGFtYWdlX2NvbG9yIjoiI0ZGRkZGRkZGIiwiZGFtYWdlX2ZvbnQiOiJwaXhlbCIsImRhbWFnZV9wb3NpdGlvbl94Ijo5NjMuMCwiZGFtYWdlX3Bvc2l0aW9uX3kiOjUyOC4wfSwifnNjb3BlIjp7Iipjb2xvciI6IiNGRkZGRkZGRiIsImFuaW1hdGV6b29tIjpmYWxzZSwiY29sb3IiOiJkZWZhdWx0IiwiZ2FwIjoxMC4wLCJsZW5ndGgiOjc1LjB9LCJ+dHJhc2h0YWxrIjp7InRyYXNodGFsa21vZGUiOlsifiJdfSwifnRzIjp7ImFjY2VudF9jb2xvciI6IiM5QTlBQjJGRiIsImZvbnRfbWFudWFsIjoiYm9sZCIsImZvcndhcmRfbWFudWFsIjoiXiIsImxlZnRfbWFudWFsIjoiPCIsInJpZ2h0X21hbnVhbCI6Ij4iLCJ0c190eXBlIjoiY3VzdG9tIn0sIn52aWV3bW9kZWwiOnsiZm92Ijo0OC4wLCJ4X2F4aXMiOjEwLjAsInlfYXhpcyI6LTYwLjAsInpfYXhpcyI6MTAuMH19XSwibmFtZSI6IjEyMyJ9"));
        l_pui_0.load(v728.file, 1);
        l_pui_0.load(v728.file, 2);
        l_pui_0.load(v728.file, 3);
    end;
end);
misc = v104("presets.misc", v30, function()
    -- upvalues: v35 (ref), l_pui_0 (ref), l_base64_0 (ref)
    if v35.info.presets_list:get() ~= 1 then
        l_pui_0.load(presets_data.file[v35.info.presets_list:get()], 4);
    else
        local v729 = json.parse(l_base64_0.decode("eyJmaWxlIjpbeyJiYWNrc3RhYiI6dHJ1ZSwiY29uZGl0aW9ucyI6InNoYXJlZCIsImVuYWJsZSI6MS4wLCJmbGlja2V4cGxvaXQiOnRydWUsImZvcmNlaW50ZXJwb2xhdGlvbiI6ZmFsc2UsImZzIjpmYWxzZSwibGFkZGVyX3NlbGVjdCI6dHJ1ZSwibWFudWFsIjoiZGlzYWJsZWQiLCJub2ZhbGxkYW1hZ2UiOnRydWUsInNhZmUiOnRydWUsIn5jb25kaXRpb25zIjp7ImJhc2UiOiJhdCB0YXJnZXQiLCJwaXRjaCI6ImRvd24ifSwifmZsaWNrZXhwbG9pdCI6eyJmbGlja3NldHRpbmdzIjpbMS4wLDIuMCwzLjAsIn4iXX0sIn5tYW51YWwiOnsic3RhdGljIjpmYWxzZX0sIn5zYWZlIjp7IndlYXBvbnMiOls0LjAsNS4wLDYuMCw3LjAsIn4iXX19LFt7ImJvZHl5YXciOnRydWUsImJyZWFrbGMiOnRydWUsImRlZmVuc2l2ZSI6dHJ1ZSwiZW5hYmxlIjpmYWxzZSwibW9kaWZpZXIiOiJkaXNhYmxlZCIsInlhdyI6ImJhY2t3YXJkIn0seyJib2R5eWF3Ijp0cnVlLCJicmVha2xjIjp0cnVlLCJkZWZlbnNpdmUiOnRydWUsImVuYWJsZSI6dHJ1ZSwibW9kaWZpZXIiOiJvZmZzZXQiLCJ5YXciOiJiYWNrd2FyZCJ9LHsiYm9keXlhdyI6dHJ1ZSwiYnJlYWtsYyI6dHJ1ZSwiZGVmZW5zaXZlIjp0cnVlLCJlbmFibGUiOnRydWUsIm1vZGlmaWVyIjoib2Zmc2V0IiwieWF3IjoiYmFja3dhcmQifSx7ImJvZHl5YXciOnRydWUsImJyZWFrbGMiOnRydWUsImRlZmVuc2l2ZSI6dHJ1ZSwiZW5hYmxlIjp0cnVlLCJtb2RpZmllciI6Im9mZnNldCIsInlhdyI6ImJhY2t3YXJkIn0seyJib2R5eWF3Ijp0cnVlLCJicmVha2xjIjp0cnVlLCJkZWZlbnNpdmUiOnRydWUsImVuYWJsZSI6dHJ1ZSwibW9kaWZpZXIiOiIzLXdheSIsInlhdyI6ImJhY2t3YXJkIn0seyJib2R5eWF3Ijp0cnVlLCJicmVha2xjIjp0cnVlLCJkZWZlbnNpdmUiOnRydWUsImVuYWJsZSI6dHJ1ZSwibW9kaWZpZXIiOiJvZmZzZXQiLCJ5YXciOiJiYWNrd2FyZCJ9LHsiYm9keXlhdyI6dHJ1ZSwiYnJlYWtsYyI6dHJ1ZSwiZGVmZW5zaXZlIjp0cnVlLCJlbmFibGUiOnRydWUsIm1vZGlmaWVyIjoib2Zmc2V0IiwieWF3IjoiYmFja3dhcmQifSx7ImJvZHl5YXciOnRydWUsImJyZWFrbGMiOnRydWUsImRlZmVuc2l2ZSI6dHJ1ZSwiZW5hYmxlIjp0cnVlLCJtb2RpZmllciI6Im9mZnNldCIsInlhdyI6ImJhY2t3YXJkIn0seyJib2R5eWF3Ijp0cnVlLCJicmVha2xjIjpmYWxzZSwiZGVmZW5zaXZlIjp0cnVlLCJlbmFibGUiOnRydWUsIm1vZGlmaWVyIjoiMy13YXkiLCJ5YXciOiJiYWNrd2FyZCJ9XSxbeyJib2R5eWF3cmFuZG9tIjoyLjAsImRlbGF5IjoxLjAsImRzZWxlY3QiOlsxLjAsMi4wLCJ+Il0sImZsdWN0dWF0ZXlhdyI6ZmFsc2UsImZzIjoib2ZmIiwibGVmdCI6MC4wLCJsZWZ0bGltaXQiOjYwLjAsIm1vZGUiOiJzdGF0aWMiLCJtb2RsZWZ0IjowLjAsIm1vZG1vZGUiOiJzdGF0aWMiLCJtb2RyaWdodCI6MC4wLCJtb2RzdGF0aWMiOjAuMCwib3B0aW9ucyI6WyJqaXR0ZXIiLCJ+Il0sInBpdGNoIjoic3RhdGljIiwicGl0Y2h2YWx1ZTEiOi04OS4wLCJwaXRjaHZhbHVlMiI6MC4wLCJyYW5kb21tb2RpZmVyIjpmYWxzZSwicmlnaHQiOjAuMCwicmlnaHRsaW1pdCI6NjAuMCwic3RhdGljIjowLjAsInlhdyI6Im5ldmVybG9zZSIsInlhd3NwZWVkIjoxMC4wLCJ5YXd2YWx1ZTEiOjAuMCwieWF3dmFsdWUyIjowLjAsInlhd3dheTEiOjAuMCwieWF3d2F5MiI6MC4wLCJ5YXd3YXkzIjowLjAsInlhd3dheTQiOjAuMCwieWF3d2F5NSI6MC4wfSx7ImJvZHl5YXdyYW5kb20iOjEyLjAsImRlbGF5IjoxLjAsImRzZWxlY3QiOlsxLjAsMi4wLCJ+Il0sImZsdWN0dWF0ZXlhdyI6dHJ1ZSwiZnMiOiJvZmYiLCJsZWZ0IjotMTguMCwibGVmdGxpbWl0Ijo2MC4wLCJtb2RlIjoibGVmdCAmIHJpZ2h0IiwibW9kbGVmdCI6LTQuMCwibW9kbW9kZSI6ImxlZnQgJiByaWdodCIsIm1vZHJpZ2h0Ijo0LjAsIm1vZHN0YXRpYyI6MC4wLCJvcHRpb25zIjpbImppdHRlciIsIn4iXSwicGl0Y2giOiJzdGF0aWMiLCJwaXRjaHZhbHVlMSI6ODkuMCwicGl0Y2h2YWx1ZTIiOjAuMCwicmFuZG9tbW9kaWZlciI6dHJ1ZSwicmlnaHQiOjM4LjAsInJpZ2h0bGltaXQiOjYwLjAsInN0YXRpYyI6MC4wLCJ5YXciOiJzdGF0aWMiLCJ5YXdzcGVlZCI6MTAuMCwieWF3dmFsdWUxIjotNC4wLCJ5YXd2YWx1ZTIiOjAuMCwieWF3d2F5MSI6MC4wLCJ5YXd3YXkyIjowLjAsInlhd3dheTMiOjAuMCwieWF3d2F5NCI6MC4wLCJ5YXd3YXk1IjowLjB9LHsiYm9keXlhd3JhbmRvbSI6Mi4wLCJkZWxheSI6Mi4wLCJkc2VsZWN0IjpbMS4wLDIuMCwifiJdLCJmbHVjdHVhdGV5YXciOnRydWUsImZzIjoib2ZmIiwibGVmdCI6LTI2LjAsImxlZnRsaW1pdCI6NjAuMCwibW9kZSI6ImxlZnQgJiByaWdodCIsIm1vZGxlZnQiOi00LjAsIm1vZG1vZGUiOiJsZWZ0ICYgcmlnaHQiLCJtb2RyaWdodCI6NC4wLCJtb2RzdGF0aWMiOjAuMCwib3B0aW9ucyI6WyJqaXR0ZXIiLCJ+Il0sInBpdGNoIjoic3RhdGljIiwicGl0Y2h2YWx1ZTEiOjg5LjAsInBpdGNodmFsdWUyIjowLjAsInJhbmRvbW1vZGlmZXIiOnRydWUsInJpZ2h0IjozNi4wLCJyaWdodGxpbWl0Ijo2MC4wLCJzdGF0aWMiOjAuMCwieWF3Ijoic3RhdGljIiwieWF3c3BlZWQiOjEwLjAsInlhd3ZhbHVlMSI6LTQuMCwieWF3dmFsdWUyIjowLjAsInlhd3dheTEiOjAuMCwieWF3d2F5MiI6MC4wLCJ5YXd3YXkzIjowLjAsInlhd3dheTQiOjAuMCwieWF3d2F5NSI6MC4wfSx7ImJvZHl5YXdyYW5kb20iOjIuMCwiZGVsYXkiOjEuMCwiZHNlbGVjdCI6WzEuMCwyLjAsIn4iXSwiZmx1Y3R1YXRleWF3Ijp0cnVlLCJmcyI6Im9mZiIsImxlZnQiOi0zOS4wLCJsZWZ0bGltaXQiOjYwLjAsIm1vZGUiOiJsZWZ0ICYgcmlnaHQiLCJtb2RsZWZ0IjotNC4wLCJtb2Rtb2RlIjoibGVmdCAmIHJpZ2h0IiwibW9kcmlnaHQiOjQuMCwibW9kc3RhdGljIjowLjAsIm9wdGlvbnMiOlsiaml0dGVyIiwifiJdLCJwaXRjaCI6InN0YXRpYyIsInBpdGNodmFsdWUxIjo4OS4wLCJwaXRjaHZhbHVlMiI6MC4wLCJyYW5kb21tb2RpZmVyIjp0cnVlLCJyaWdodCI6NDQuMCwicmlnaHRsaW1pdCI6NjAuMCwic3RhdGljIjowLjAsInlhdyI6InN0YXRpYyIsInlhd3NwZWVkIjoxMC4wLCJ5YXd2YWx1ZTEiOi00LjAsInlhd3ZhbHVlMiI6MC4wLCJ5YXd3YXkxIjowLjAsInlhd3dheTIiOjAuMCwieWF3d2F5MyI6MC4wLCJ5YXd3YXk0IjowLjAsInlhd3dheTUiOjAuMH0seyJib2R5eWF3cmFuZG9tIjoxMi4wLCJkZWxheSI6MS4wLCJkc2VsZWN0IjpbMS4wLDIuMCwifiJdLCJmbHVjdHVhdGV5YXciOnRydWUsImZzIjoib2ZmIiwibGVmdCI6LTEuMCwibGVmdGxpbWl0Ijo2MC4wLCJtb2RlIjoibGVmdCAmIHJpZ2h0IiwibW9kbGVmdCI6LTUuMCwibW9kbW9kZSI6ImxlZnQgJiByaWdodCIsIm1vZHJpZ2h0Ijo1LjAsIm1vZHN0YXRpYyI6MC4wLCJvcHRpb25zIjpbImppdHRlciIsIn4iXSwicGl0Y2giOiJzdGF0aWMiLCJwaXRjaHZhbHVlMSI6ODkuMCwicGl0Y2h2YWx1ZTIiOjAuMCwicmFuZG9tbW9kaWZlciI6dHJ1ZSwicmlnaHQiOi0xLjAsInJpZ2h0bGltaXQiOjYwLjAsInN0YXRpYyI6MC4wLCJ5YXciOiJzdGF0aWMiLCJ5YXdzcGVlZCI6MTAuMCwieWF3dmFsdWUxIjotNS4wLCJ5YXd2YWx1ZTIiOjAuMCwieWF3d2F5MSI6MC4wLCJ5YXd3YXkyIjowLjAsInlhd3dheTMiOjAuMCwieWF3d2F5NCI6MC4wLCJ5YXd3YXk1IjowLjB9LHsiYm9keXlhd3JhbmRvbSI6Mi4wLCJkZWxheSI6Mi4wLCJkc2VsZWN0IjpbMS4wLDIuMCwifiJdLCJmbHVjdHVhdGV5YXciOnRydWUsImZzIjoib2ZmIiwibGVmdCI6LTIzLjAsImxlZnRsaW1pdCI6NjAuMCwibW9kZSI6ImxlZnQgJiByaWdodCIsIm1vZGxlZnQiOi00LjAsIm1vZG1vZGUiOiJsZWZ0ICYgcmlnaHQiLCJtb2RyaWdodCI6NC4wLCJtb2RzdGF0aWMiOjAuMCwib3B0aW9ucyI6WyJqaXR0ZXIiLCJ+Il0sInBpdGNoIjoic3RhdGljIiwicGl0Y2h2YWx1ZTEiOjg5LjAsInBpdGNodmFsdWUyIjowLjAsInJhbmRvbW1vZGlmZXIiOnRydWUsInJpZ2h0IjozNy4wLCJyaWdodGxpbWl0Ijo2MC4wLCJzdGF0aWMiOjAuMCwieWF3Ijoic3RhdGljIiwieWF3c3BlZWQiOjEwLjAsInlhd3ZhbHVlMSI6LTQuMCwieWF3dmFsdWUyIjowLjAsInlhd3dheTEiOjAuMCwieWF3d2F5MiI6MC4wLCJ5YXd3YXkzIjowLjAsInlhd3dheTQiOjAuMCwieWF3d2F5NSI6MC4wfSx7ImJvZHl5YXdyYW5kb20iOjIuMCwiZGVsYXkiOjEuMCwiZHNlbGVjdCI6WzEuMCwyLjAsIn4iXSwiZmx1Y3R1YXRleWF3Ijp0cnVlLCJmcyI6Im9mZiIsImxlZnQiOi0xNC4wLCJsZWZ0bGltaXQiOjYwLjAsIm1vZGUiOiJsZWZ0ICYgcmlnaHQiLCJtb2RsZWZ0IjotNC4wLCJtb2Rtb2RlIjoibGVmdCAmIHJpZ2h0IiwibW9kcmlnaHQiOjQuMCwibW9kc3RhdGljIjowLjAsIm9wdGlvbnMiOlsiaml0dGVyIiwifiJdLCJwaXRjaCI6InN0YXRpYyIsInBpdGNodmFsdWUxIjo4OS4wLCJwaXRjaHZhbHVlMiI6MC4wLCJyYW5kb21tb2RpZmVyIjp0cnVlLCJyaWdodCI6MzIuMCwicmlnaHRsaW1pdCI6NjAuMCwic3RhdGljIjowLjAsInlhdyI6InN0YXRpYyIsInlhd3NwZWVkIjoxMC4wLCJ5YXd2YWx1ZTEiOi00LjAsInlhd3ZhbHVlMiI6MC4wLCJ5YXd3YXkxIjowLjAsInlhd3dheTIiOjAuMCwieWF3d2F5MyI6MC4wLCJ5YXd3YXk0IjowLjAsInlhd3dheTUiOjAuMH0seyJib2R5eWF3cmFuZG9tIjoyLjAsImRlbGF5IjoyLjAsImRzZWxlY3QiOlsxLjAsMi4wLCJ+Il0sImZsdWN0dWF0ZXlhdyI6dHJ1ZSwiZnMiOiJvZmYiLCJsZWZ0IjotMjAuMCwibGVmdGxpbWl0Ijo2MC4wLCJtb2RlIjoibGVmdCAmIHJpZ2h0IiwibW9kbGVmdCI6LTQuMCwibW9kbW9kZSI6ImxlZnQgJiByaWdodCIsIm1vZHJpZ2h0Ijo0LjAsIm1vZHN0YXRpYyI6MC4wLCJvcHRpb25zIjpbImppdHRlciIsIn4iXSwicGl0Y2giOiJzdGF0aWMiLCJwaXRjaHZhbHVlMSI6ODkuMCwicGl0Y2h2YWx1ZTIiOjAuMCwicmFuZG9tbW9kaWZlciI6dHJ1ZSwicmlnaHQiOjQwLjAsInJpZ2h0bGltaXQiOjYwLjAsInN0YXRpYyI6MC4wLCJ5YXciOiJzdGF0aWMiLCJ5YXdzcGVlZCI6MTAuMCwieWF3dmFsdWUxIjotNC4wLCJ5YXd2YWx1ZTIiOjAuMCwieWF3d2F5MSI6MC4wLCJ5YXd3YXkyIjowLjAsInlhd3dheTMiOjAuMCwieWF3d2F5NCI6MC4wLCJ5YXd3YXk1IjowLjB9LHsiYm9keXlhd3JhbmRvbSI6Mi4wLCJkZWxheSI6MS4wLCJkc2VsZWN0IjpbMS4wLDIuMCwifiJdLCJmbHVjdHVhdGV5YXciOnRydWUsImZzIjoib2ZmIiwibGVmdCI6LTEuMCwibGVmdGxpbWl0Ijo2MC4wLCJtb2RlIjoibGVmdCAmIHJpZ2h0IiwibW9kbGVmdCI6LTUuMCwibW9kbW9kZSI6ImxlZnQgJiByaWdodCIsIm1vZHJpZ2h0Ijo1LjAsIm1vZHN0YXRpYyI6MC4wLCJvcHRpb25zIjpbImppdHRlciIsIn4iXSwicGl0Y2giOiJzdGF0aWMiLCJwaXRjaHZhbHVlMSI6ODkuMCwicGl0Y2h2YWx1ZTIiOjAuMCwicmFuZG9tbW9kaWZlciI6dHJ1ZSwicmlnaHQiOjEuMCwicmlnaHRsaW1pdCI6NjAuMCwic3RhdGljIjowLjAsInlhdyI6InN0YXRpYyIsInlhd3NwZWVkIjoxMC4wLCJ5YXd2YWx1ZTEiOi01LjAsInlhd3ZhbHVlMiI6MC4wLCJ5YXd3YXkxIjowLjAsInlhd3dheTIiOjAuMCwieWF3d2F5MyI6MC4wLCJ5YXd3YXk0IjowLjAsInlhd3dheTUiOjAuMH1dLHsiYWNjZW50MSI6IiM5QTlBQjJGRiIsImFpbWJvdGxvZ3MiOnRydWUsImFuaW1icmVha2VycyI6dHJ1ZSwiYXNwZWN0Ijp0cnVlLCJiYXJzIjp0cnVlLCJjbGFudGFnIjp0cnVlLCJjcm9zc2hhaXIiOmZhbHNlLCJkb3JtYW50YWltIjpmYWxzZSwiZ3JlbmFkZXMiOnRydWUsImhpdGNoYW5jZSI6ZmFsc2UsImp1bXBzY291dGZpeCI6dHJ1ZSwibWluZG1nIjp0cnVlLCJwaW5ndW5sb2NrZXIiOnRydWUsInJldm9sdmVyIjp0cnVlLCJzY29wZSI6ZmFsc2UsInRyYXNodGFsayI6ZmFsc2UsInRzIjp0cnVlLCJ2aWV3bW9kZWwiOnRydWUsIndhdGVybWFyazMyIjp7IndhdGVybWFyazIiOiJib3R0b20iLCJ3YXRlcm1hcmtmb250cyI6ImRlZmF1bHQiLCJ3YXRlcm1hcmtzdHlsZSI6ImRlZmF1bHQiLCJ3YXRlcm1hcmtzdHlsZW5hbWUiOiIifSwifmFpbWJvdGxvZ3MiOnsiY29sb3IiOiIjOUE5QUIyRkYiLCJjdXN0b21fY29sb3IiOnRydWUsImhpdF9jb2xvciI6IiM5QTlBQjJGRiIsImxpbWl0IjozLjAsImxvZ3NhZGRvbnMiOlsiQmFja2dyb3VuZCIsIn4iXSwibWlzc19jb2xvciI6IiM2NDY0NjRGRiIsIm9mZnNldCI6NDAwLjAsInBvcyI6WzEuMCwyLjAsMy4wLCJ+Il0sInRpbWUiOjMuMH0sIn5hbmltYnJlYWtlcnMiOnsiYWlyIjoiZGlzYWJsZWQiLCJhaXJ2YWx1ZSI6MTAwLjAsImdyb3VuZCI6ImJzb2QiLCJqaXR0ZXJzcGVlZCI6MTAwLjAsImppdHRlcnZhbHVlIjoxMDAuMCwiaml0dGVydmFsdWUxIjoxMDAuMCwibW92ZWxlYW4iOjEwMC4wfSwifmFzcGVjdCI6eyJ2YWwiOjEyNS4wfSwifmJhcnMiOnsiKmhpdG1hcmtlcmNyb3NzaGFpciI6IiM5QTlBQjJGRiIsImhpdG1hcmtlcmNyb3NzaGFpciI6dHJ1ZSwia2VlcF9tb2RlbF90cmFuc3BhcmVuY3kiOnRydWUsIm1vZGUiOlsxLjAsMi4wLDMuMCw0LjAsNi4wLDguMCw5LjAsMTEuMCwxMi4wLDEzLjAsMTQuMCwxNS4wLCJ+Il0sInNrZWV0aW5yb3BvbGF0aW9uIjp0cnVlfSwifmNyb3NzaGFpciI6eyJvZmZzZXQiOjAuMCwic3R5bGUiOiJkZWZhdWx0In0sIn5kb3JtYW50YWltIjp7ImF1dG9zY29wZWRhIjp0cnVlLCJhdXRvc3RvcGRhIjp0cnVlLCJoaXRib3hlc2RhIjpbIn4iXSwiaGl0Y2hhbmNlZGEiOjYwLjAsImxvZ3NkYSI6ZmFsc2V9LCJ+Z3JlbmFkZXMiOnsibmFkZWhvdGtleSI6MTEzLjAsIm5hZGVzIjpbMS4wLDIuMCwzLjAsIn4iXSwicmVhbGVzZTMyIjoyNS4wLCJzZWxlY3RuYWRlcyI6WzEuMCwzLjAsIn4iXX0sIn5oaXRjaGFuY2UiOnsiaW5haXJfaGMiOjEuMCwiaW5haXJfaGNfc2xkZWlyIjozNS4wLCJub3Njb3BlX2hjX3NsZGVpciI6MzUuMH0sIn5taW5kbWciOnsiZGFtYWdlX2NvbG9yIjoiI0ZGRkZGRkZGIiwiZGFtYWdlX2ZvbnQiOiJwaXhlbCIsImRhbWFnZV9wb3NpdGlvbl94Ijo5NjMuMCwiZGFtYWdlX3Bvc2l0aW9uX3kiOjUyOC4wfSwifnNjb3BlIjp7Iipjb2xvciI6IiNGRkZGRkZGRiIsImFuaW1hdGV6b29tIjpmYWxzZSwiY29sb3IiOiJkZWZhdWx0IiwiZ2FwIjoxMC4wLCJsZW5ndGgiOjc1LjB9LCJ+dHJhc2h0YWxrIjp7InRyYXNodGFsa21vZGUiOlsifiJdfSwifnRzIjp7ImFjY2VudF9jb2xvciI6IiM5QTlBQjJGRiIsImZvbnRfbWFudWFsIjoiYm9sZCIsImZvcndhcmRfbWFudWFsIjoiXiIsImxlZnRfbWFudWFsIjoiPCIsInJpZ2h0X21hbnVhbCI6Ij4iLCJ0c190eXBlIjoiY3VzdG9tIn0sIn52aWV3bW9kZWwiOnsiZm92Ijo0OC4wLCJ4X2F4aXMiOjEwLjAsInlfYXhpcyI6LTYwLjAsInpfYXhpcyI6MTAuMH19XSwibmFtZSI6IjEyMyJ9"));
        l_pui_0.load(v729.file, 4);
    end;
end);
v35.info.presets_success_export:visibility(false);
v35.info.presets_success_import:visibility(false);
v35.info.presets_success_exist:visibility(false);
v35.info.presets_success_importfailed:visibility(false);
updatevisdata = function()
    -- upvalues: v35 (ref), v46 (ref), v45 (ref), v47 (ref), v48 (ref)
    if ui.get_alpha() ~= 0 then
        v35.info.presets_success_export:visibility(globals.realtime - v46 <= 2);
        v35.info.presets_success_import:visibility(globals.realtime - v45 <= 2);
        v35.info.presets_success_exist:visibility(globals.realtime - v47 <= 2);
        v35.info.presets_success_importfailed:visibility(globals.realtime - v48 <= 2);
    end;
end;
events.render(v141.handle);
v108("shutdown", "shutdown", v637);
v108("render", "render", render);
v108("render", "updatevisdata", updatevisdata);
v108("createmove", "antiaim", v484);
v108("createmove", "onmove", onmove);
v108("post_update_clientside_animation", "animbreaker", v493);
v108("aim_ack", "shot", v582);
v108("player_death", "death", death);
v636:run();
events.render:set(function()
    -- upvalues: v626 (ref)
    sosali_hui();
    v626();
end);
events.mouse_input:set(function()
    return ui.get_alpha() <= 0;
end);