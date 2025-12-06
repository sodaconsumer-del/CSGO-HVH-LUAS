local l_pui_0 = require("neverlose/pui");
local l_base64_0 = require("neverlose/base64");
local l_clipboard_0 = require("neverlose/clipboard");
local l_monylinear_0 = require("neverlose/monylinear");
local l_smoothy_0 = require("neverlose/smoothy");
local l_weapons_0 = require("neverlose/csgo_weapons");
local _ = require("neverlose/animations");
local l_ffi_0 = require("ffi");
local _ = require("neverlose/grenade_prediction");
local _ = require("neverlose/gradient");
local l_system_0 = require("neverlose/drag_system");
local _ = require("neverlose/moon_anim");
local l_mtools_0 = require("neverlose/mtools");
local _ = render.load_font("Calibri", 23, "bda");
local _ = require("neverlose/mtools");
local _ = {};
local _ = {};
local _ = render.screen_size();
local v18 = {
    fill = 0, 
    on_plant_time = 0, 
    planting = false, 
    planting_site = ""
};
local v19 = {
    ping = ui.find("Miscellaneous", "Main", "Other", "Fake Latency"), 
    da = ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot"), 
    dt = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"), 
    body = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim"), 
    safe = ui.find("Aimbot", "Ragebot", "Safety", "Safe Points"), 
    hs = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"), 
    fd = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"), 
    fs = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"), 
    filter = ui.find("Miscellaneous", "Main", "Other", "Filters")
};
lerp = function(v20, v21, v22)
    return v20 + (v21 - v20) * v22;
end;
math.max_lerp_low_fps = 2.2222222222222223;
math.lerp = function(v23, v24, v25)
    if v23 == v24 then
        return v24;
    else
        local v26 = globals.frametime * 170;
        v25 = v25 * math.min(v26, math.max_lerp_low_fps);
        local v27 = v23 + (v24 - v23) * globals.frametime * v25;
        return math.abs(v27 - v24) < 0.01 and v24 or v27;
    end;
end;
local v28 = {
    base_speed = 0.095, 
    _list = {}
};
v28.new = function(v29, v30, v31, v32)
    -- upvalues: v28 (ref)
    if not v31 then
        v31 = v28.base_speed;
    end;
    v28._list[v29] = v28._list[v29] or v32 or 0;
    v28._list[v29] = math.lerp(v28._list[v29], v30, v31);
    return v28._list[v29];
end;
l_ffi_0.cdef("void* __stdcall URLDownloadToFileA(void* LPUNKNOWN, const char* LPCSTR, const char* LPCSTR2, int a, int LPBINDSTATUSCALLBACK);\nbool DeleteUrlCacheEntryA(const char* lpszUrlName);\n\ntypedef void*(__thiscall* get_client_entity_t)(void*, int);\ntypedef struct {\n    char pad_0000[20];\n    int m_nOrder, m_nSequence;\n    float m_flPrevCycle, m_flWeight, m_flWeightDeltaRate, m_flPlaybackRate, m_flCycle;\n    void *m_pOwner;\n    char pad_0038[4];\n} animstate_layer_t;\n\ntypedef int(__fastcall* clantag_t)(const char*, const char*);\ntypedef void*(__thiscall* get_client_entity_t)(void*, int);\ntypedef struct { float x, y, z; } vec3_struct;\n\ntypedef struct {\n    float x, y, z;\n} Vector_t;\n\ntypedef void*(__thiscall* get_client_entity_t)(void*, int);\ntypedef struct {\n    char  pad_0000[20];\n    int m_nOrder; //0x0014\n    int m_nSequence; //0x0018\n    float m_flPrevCycle; //0x001C\n    float m_flWeight; //0x0020\n    float m_flWeightDeltaRate; //0x0024\n    float m_flPlaybackRate; //0x0028\n    float m_flCycle; //0x002C\n    void *m_pOwner; //0x0030\n    char  pad_0038[4]; //0x0034\n} c_animlayers;\n\ntypedef struct {\n    char pad0[0x60];\n    void* pEntity, *pActiveWeapon, *pLastActiveWeapon;\n    float flLastUpdateTime;\n    int iLastUpdateFrame;\n    float flLastUpdateIncrement, flEyeYaw, flEyePitch, flGoalFeetYaw, flLastFeetYaw, flMoveYaw, flLastMoveYaw;\n    float flLeanAmount, flFeetCycle, flMoveWeight, flMoveWeightSmoothed, flDuckAmount, flHitGroundCycle, flRecrouchWeight;\n    Vector_t vecOrigin, vecLastOrigin, vecVelocity, vecVelocityNormalized, vecVelocityNormalizedNonZero;\n    float flVelocityLenght2D, flJumpFallVelocity, flSpeedNormalized, flRunningSpeed, flDuckingSpeed;\n    float flDurationMoving, flDurationStill, flNextLowerBodyYawUpdateTime, flDurationInAir, flLeftGroundHeight;\n    float flHitGroundWeight, flWalkToRunTransition, flAffectedFraction, flMinBodyYaw, flMaxBodyYaw, flMinPitch, flMaxPitch;\n    int iAnimsetVersion;\n} CCSGOPlayerAnimationState_534535_t;\n");
local _ = l_ffi_0.typeof("uintptr_t**");
local v34 = utils.get_vfunc("client.dll", "VClientEntityList003", 3, "void*(__thiscall*)(void*, int)");
local _ = nil;
local _ = {
    last_drop_tick = globals.tickcount
};
local v37 = false;
local _ = "";
local v39 = "\a{Link Active}";
local v40 = {};
local v41 = {};
local v42 = {};
local v43 = {};
local v44 = {};
local v45 = {};
local v46 = {};
local v47 = {};
local _ = {};
local v49 = {};
local v50 = {
    [1] = yaw, 
    [2] = invert, 
    [3] = add, 
    [4] = safe, 
    [5] = cond, 
    [6] = cond2
};
local v51 = 0;
local v52 = 0;
local v53 = 0;
local v54 = 0;
v49.hitboxes = {
    [1] = "generic", 
    [2] = "head", 
    [3] = "chest", 
    [4] = "stomach", 
    [5] = "left arm", 
    [6] = "right arm", 
    [7] = "left leg", 
    [8] = "right leg", 
    [9] = "neck", 
    [10] = "gear"
};
local v55 = {};
local v56 = {};
local v57 = 0;
v49.hit = 0;
v49.reg = v57;
v49.datal = v56;
v49.data = v55;
v55 = {
    urlmon = l_ffi_0.load("UrlMon"), 
    wininet = l_ffi_0.load("WinInet")
};
v55.download_file_from_url = function(v58, v59)
    -- upvalues: v55 (ref)
    v55.wininet.DeleteUrlCacheEntryA(v58);
    v55.urlmon.URLDownloadToFileA(nil, v58, v59, 0, 0);
end;
if files.read("nl/gloriosa/CheltenhamBoldItalic.otf") == nil then
    v55.download_file_from_url("https://github.com/travmavdrame/fontgloriosa/raw/main/CheltenhamBoldItalic.otf", "nl/gloriosa/CheltenhamBoldItalic.otf");
end;
v57 = {
    name = {
        [1] = v39 .. "Default" .. v39 .. "  \194\183" .. "  \a525252FF05.11.2024"
    }, 
    file = {
        [1] = ""
    }
};
files.create_folder("nl/gloriosa");
if files.read("nl/gloriosa/settings.txt") == nil then
    files.write("nl/gloriosa/settings.txt", l_base64_0.encode(json.stringify(v57)));
end;
presets_data = json.parse(l_base64_0.decode(files.read("nl/gloriosa/settings.txt")));
local l_x_0 = render.screen_size().x;
local l_y_0 = render.screen_size().y;
local _ = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage");
local function _(v63, v64)
    local v65 = math.sin(math.rad(v63));
    local v66 = math.sin(math.rad(v64));
    local v67 = math.cos(math.rad(v63));
    local v68 = math.cos(math.rad(v64));
    return vector(v67 * v68, v67 * v66, -v65);
end;
local function v71(v70)
    v70:gsub("\a.{6}", "");
end;
local v72 = render.load_font("Verdana", 14, "d, a");
local v73 = render.load_image("<svg width=\"8\" height=\"10\" viewBox=\"0 0 8 10\"><path fill=\"#fff\" d=\"m0.384 5.802c-0.24286-0.19453-0.3842-0.48884-0.3842-0.8s0.14134-0.60547 0.3842-0.8l6.08-4c0.29513-0.22371 0.69277-0.25727 1.0212-0.086202 0.32846 0.17107 0.52889 0.51613 0.51477 0.8862l-1.92 3.96 1.92 4.04c0.01412 0.37007-0.18631 0.71513-0.51477 0.8862-0.32846 0.1711-0.7261 0.1375-1.0212-0.0862z\"/></svg>", vector(9, 9));
local v74 = render.load_image("<svg width=\"8\" height=\"10\" viewBox=\"0 0 8 10\"><path fill=\"#fff\" transform=\"rotate(180, 4, 5)\" d=\"m0.384 5.802c-0.24286-0.19453-0.3842-0.48884-0.3842-0.8s0.14134-0.60547 0.3842-0.8l6.08-4c0.29513-0.22371 0.69277-0.25727 1.0212-0.086202 0.32846 0.17107 0.52889 0.51613 0.51477 0.8862l-1.92 3.96 1.92 4.04c0.01412 0.37007-0.18631 0.71513-0.51477 0.8862-0.32846 0.1711-0.7261 0.1375-1.0212-0.0862z\"/></svg>", vector(9, 9));
local function v81(v75, v76, v77)
    -- upvalues: v54 (ref), v71 (ref)
    return function(...)
        -- upvalues: v77 (ref), v75 (ref), v54 (ref), v76 (ref), v71 (ref)
        local l_status_0, l_result_0 = pcall(v77, ...);
        if not l_status_0 then
            local v80 = v75 .. " : " .. l_result_0:gsub(".{6}", "");
            if v80 == "presets.import : [\"neverlose/base64\"]:98: attempt to perform arithmetic on local 'd' (a nil value)" then
                v54 = globals.realtime;
            end;
            if v76 then
                v71(v80);
            end;
            return false, v80;
        else
            return l_result_0, l_status_0;
        end;
    end;
end;
local function v85(v82, v83, v84)
    -- upvalues: v81 (ref)
    events[v82]:set(v81(v83, true, v84));
end;
local function v89(v86, v87)
    for v88 = 1, #v86 do
        if v86[v88] == v87 then
            return true;
        end;
    end;
    return false;
end;
local function _(v90)
    return v90:get_override() == nil and v90:get() or v90:get_override();
end;
local v92 = render.load_font("nl/gloriosa/CheltenhamBoldItalic.otf", 17, "d, a");
v40 = {
    update = "24.05.2024", 
    build = " /" .. v39 .. " Superior", 
    version = "1.5 / " .. v39 .. "17.11.2024", 
    screen = render.screen_size() * 0.5, 
    fullscreen = render.screen_size(), 
    cond = {
        [1] = "Shared", 
        [2] = "Standing", 
        [3] = "Running", 
        [4] = "Slow-walking", 
        [5] = "Crouching", 
        [6] = "Crouch-moving", 
        [7] = "Air", 
        [8] = "Air-crouching", 
        [9] = "Freestanding"
    }, 
    condcrosshair = {
        [1] = "Shared", 
        [2] = "Standing", 
        [3] = "Running", 
        [4] = "Slow-walking", 
        [5] = "Crouching", 
        [6] = "Crouch-moving", 
        [7] = "Air", 
        [8] = "Air-crouching", 
        [9] = "Freestanding"
    }, 
    calibri = render.load_font("Calibri Bold", vector(25, 22, -1), "a, d"), 
    username = common.get_username(), 
    usernamelen = string.len(common.get_username()), 
    knifeside = cvar.cl_righthand:int()
};
v41 = {
    disable = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"), 
    pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"), 
    yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"), 
    base = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"), 
    basing = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"), 
    yawoffset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"), 
    backstab = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab"), 
    hidden = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden"), 
    modifier = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"), 
    modoffset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"), 
    bodyyaw = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"), 
    inverter = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"), 
    leftlimit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"), 
    rightlimit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"), 
    options = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"), 
    bodyyawfs = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding"), 
    extended = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles"), 
    extendedpitch = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles", "Extended Pitch"), 
    extendedroll = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles", "Extended Roll"), 
    fs = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"), 
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
    ovrzoom = ui.find("Visuals", "World", "Main", "Override Zoom"), 
    weaponact = ui.find("Miscellaneous", "Main", "Other", "Weapon Actions"), 
    spike = ui.find("Miscellaneous", "Main", "Other", "Fake Latency"), 
    bodyaim = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim"), 
    dormant = ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot"), 
    min_damage_ui = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"), 
    dmg = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"), 
    clantag = ui.find("Miscellaneous", "Main", "In-Game", "Clan Tag"), 
    ragebot_find = ui.find("Aimbot", "Ragebot", "Main"), 
    hc_find = ui.find("Aimbot", "Ragebot", "Selection", "Hit Chance")
};
local _ = {
    disable = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"), 
    pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"), 
    yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"), 
    base = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"), 
    yawoffset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"), 
    backstab = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab"), 
    hidden = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden"), 
    modifier = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"), 
    modoffset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"), 
    bodyyaw = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"), 
    inverter = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"), 
    leftlimit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"), 
    rightlimit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"), 
    options = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"), 
    bodyyawfs = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding"), 
    extended = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles"), 
    extendedpitch = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles", "Extended Pitch"), 
    extendedroll = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles", "Extended Roll"), 
    fs = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding")
};
v42 = {
    menu = l_pui_0.create(v39 .. ui.get_icon("house-night"), "\a525252FF Welcome back, our beloved user  ", 1), 
    general = l_pui_0.create(v39 .. ui.get_icon("house-night"), "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n", 1), 
    about = l_pui_0.create(v39 .. ui.get_icon("house-night"), "\n\n\n\n\n\n\n\n", 1), 
    information = l_pui_0.create(v39 .. ui.get_icon("house-night"), "\a525252FF information  ", 2), 
    statistic = l_pui_0.create(v39 .. ui.get_icon("house-night"), "\n\n", 1), 
    social = l_pui_0.create(v39 .. ui.get_icon("house-night"), "", 2), 
    personal = l_pui_0.create(v39 .. ui.get_icon("house-night"), "\n\n\n\n", 1), 
    configuration = l_pui_0.create(v39 .. ui.get_icon("house-night"), "\a525252FF configuration", 2), 
    report = l_pui_0.create(v39 .. ui.get_icon("house-night"), "\n\n\n\n\n\n\n\n\n\n\n", 1), 
    enable = l_pui_0.create(v39 .. ui.get_icon("house-night"), "\a525252FF set-up", 1), 
    states = l_pui_0.create(v39 .. ui.get_icon("house-night"), "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n", 1), 
    enabled = l_pui_0.create(v39 .. ui.get_icon("house-night"), "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n", 2), 
    antiaim = l_pui_0.create(v39 .. ui.get_icon("house-night"), "\n\n\n\n", 2), 
    builder_tab = l_pui_0.create(v39 .. ui.get_icon("house-night"), "\a525252FF Tweaks", 2), 
    settings_visuals = l_pui_0.create(v39 .. ui.get_icon("house-night"), v39 .. "\a525252FF Essential  ", 2), 
    misc = l_pui_0.create(v39 .. ui.get_icon("house-night"), v39 .. "\a525252FF CORE", 2), 
    antiaimtab = l_pui_0.create(v39 .. ui.get_icon("house-night"), v39 .. "\n'n", 2), 
    yaw = l_pui_0.create(v39 .. ui.get_icon("house-night"), "\n", 2), 
    misc_new = l_pui_0.create(v39 .. ui.get_icon("house-night"), v39 .. "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n", 1), 
    misc_new1 = l_pui_0.create(v39 .. ui.get_icon("house-night"), v39 .. "\n\n\n\\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n", 2), 
    settings_tabs = l_pui_0.create(v39 .. ui.get_icon("house-night"), v39 .. "", 1), 
    settings_additional = l_pui_0.create(v39 .. ui.get_icon("house-night"), v39 .. "\a525252FF Main", 2), 
    settings_misc = l_pui_0.create(v39 .. ui.get_icon("house-night"), v39 .. "\a525252FF ragebot", 2), 
    settings_tabber = l_pui_0.create(v39 .. ui.get_icon("house-night"), v39 .. "\a525252FF Personality ", 2), 
    settings_switcher = l_pui_0.create(v39 .. ui.get_icon("house-night"), v39 .. "\a525252FF other ", 2), 
    banner = l_pui_0.create(v39 .. ui.get_icon("house-night"), "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n", 1)
};
v43 = {
    info = {
        selection = v42.menu:list(v39 .. "", {
            [1] = "\v\f<user-pen>  \rInformations", 
            [2] = "\v\f<sliders>   \rAnti-aims", 
            [3] = "\v\f<gear>   \rMiscellaneous", 
            [4] = "\v\f<folder-gear>   \rConfigurations"
        }), 
        user = v42.information:label(v39 .. "\f<user>    \rUser"), 
        button_user = v42.information:button(v39 .. "" .. string.rep(" ", 0 - v40.usernamelen) .. v40.username, function()

        end, true), 
        build = v42.information:label(v39 .. "\f<code-branch>   \r Build"), 
        build = v42.information:button(v39 .. "" .. v40.version, function()

        end, true), 
        about_youtube = v42.information:label(v39 .. "\f<share-nodes>    \rSocial media"), 
        about_social_discord = v42.information:button("\a707effFF\f<discord>", function()
            panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://discord.gg/8CtMWweSGw");
        end, true):tooltip("Verification to communicate with other users of the script, as well as to use other presets"), 
        about_social_jaks = v42.information:button("\aff2631FF\f<youtube>", function()
            panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://www.youtube.com/@pussydestroying");
        end, true):tooltip("CEO Channel "), 
        sidebars = v42.information:label(v39 .. "\v\f<list-tree>\r   Themes"), 
        about_social_jaks = v42.information:button("\f<palette>", function()
            panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://neverlose.cc/getitem?c=dSvGrXZsBZ8DGtdn-jusMCOVBBO");
        end, true):tooltip("Theme on neverlose"), 
        presets_list = v42.configuration:list("", presets_data.name), 
        presets_name = v42.configuration:input(v39 .. " \f<input-text>  Config name:"), 
        presets_create = v42.configuration:button("                               \v\f<paintbrush>  \rCreate                                ", function()
            create();
        end, true):tooltip("Create"), 
        presets_save = v42.configuration:button("    \v\f<floppy-disk>    ", function()
            save();
        end, true):tooltip("Save"), 
        presets_remove = v42.configuration:button("    \v\f<trash>    ", function()
            remove();
        end, true):tooltip("Remove"), 
        presets_aa = v42.configuration:button("     \v\f<shredder>     ", function()
            aa();
        end, true):tooltip("Loading configuration"), 
        presets_import = v42.configuration:button("    \v\f<download>    ", function()
            import();
        end, true):tooltip("Import"), 
        presets_export = v42.configuration:button("    \v\f<upload>    ", function()
            export();
        end, true):tooltip("Export"), 
        presets_success_import = v42.configuration:label("\a388539ff\f<file-import>  Successfully imported: \r"), 
        presets_success_export = v42.configuration:label("\a388539ff\f<file-export>  Successfully exported: \r"), 
        presets_success_exist = v42.configuration:label("\a853838ff\f<triangle-exclamation>  This preset already exist: \r"), 
        presets_success_importfailed = v42.configuration:label("\a853838ff\f<triangle-exclamation>  Invalid preset")
    }, 
    antiaim = {
        enable = v42.enable:list("", {
            [1] = nil, 
            [2] = nil, 
            [3] = "\v\f<sparkles>    \rDefensive Anti-Aim", 
            [1] = v39 .. "\f<gear>    \rGeneral", 
            [2] = v39 .. "\f<sliders>    \rAnti-Aim builder"
        }), 
        safe = v42.antiaimtab:switch(v39 .. "\f<wand-sparkles>\r   Safe Function", false, function(v94)
            -- upvalues: v39 (ref)
            return {
                weapons = v94:listable("", {
                    [1] = v39 .. "Distant", 
                    [2] = v39 .. "Knife", 
                    [3] = v39 .. "Taser"
                })
            }, true;
        end), 
        flick = v42.antiaimtab:switch("\v\f<up-right-and-down-left-from-center>    \rFlick Exploit"):disabled(false), 
        disablers = v42.antiaimtab:switch(v39 .. "\f<person-dress-burst>   \rWarm-up hider"), 
        func_edge_test = v42.antiaimtab:switch(v39 .. "\f<light-emergency-on>   \rEdge Yaw", false, function(v95)
            -- upvalues: v39 (ref)
            return {
                edge_on_fd = v95:switch(v39 .. "Only on fakeduck")
            }, true;
        end), 
        backstab = v42.antiaimtab:switch(v39 .. "\f<knife-kitchen>\r    Avoid Backstab"), 
        ladder_select = v42.antiaimtab:switch(v39 .. "\f<water-ladder>    \rFast Ladder"), 
        fs = v42.builder_tab:switch(v39 .. "\f<star-and-crescent>\r   Freestanding", false, function(v96)
            return {
                fsb = v96:switch("Body Freestanding"), 
                fss = v96:switch("Disable Yaw Modifiers")
            };
        end), 
        manual = v42.builder_tab:combo(v39 .. "\f<brackets-round>\r   Manual Yaw", {
            [1] = "Disabled", 
            [2] = "Forward", 
            [3] = "Left", 
            [4] = "Right"
        }, false, function(v97)
            return {
                fsoff = v97:switch("Manual over freestanding")
            };
        end), 
        conditions = v42.states:combo(v39 .. "\f<code-fork>    \rState", v40.cond, function(v98)
            return {
                base = v98:combo("Base", {
                    [1] = "Local View", 
                    [2] = "At Target"
                }), 
                pitch = v98:combo("Pitch", {
                    [1] = "Down", 
                    [2] = "Disabled", 
                    [3] = "Fake Down", 
                    [4] = "Fake Up"
                })
            };
        end)
    }, 
    misc = {
        tab = v42.settings_tabs:list("", {
            [1] = "\v\f<wave-sine>  \rAimbot", 
            [2] = "\v\f<paintbrush>   \rVisuals", 
            [3] = "\v\f<bars-sort>    \rMisc"
        }), 
        grenades = v42.settings_misc:switch(v39 .. "\f<bomb>     \rGrenade's" .. v39 .. " [addons]", false, function(v99)
            return {
                nades = v99:listable("", {
                    [1] = "Grenade Release", 
                    [2] = "Nade throw fix", 
                    [3] = "Drop nades"
                }), 
                calc_grenade = v99:slider("Amount", 0, 50, 0, nil, "%"), 
                selectnades = v99:listable("  Select nades", "Molotov", "Smoke", "Nade"), 
                nadehotkey = v99:hotkey("Hotkey")
            }, true;
        end), 
        hitchance = v42.settings_misc:switch(v39 .. "\f<puzzle-piece>     \rHitchance" .. v39 .. " [override]", false, function(v100)
            -- upvalues: v39 (ref)
            return {
                inair_hc = v100:list(v39 .. "", {
                    [1] = "SSG-08", 
                    [2] = "Awp", 
                    [3] = "Auto Snipers", 
                    [4] = "Revolver"
                }), 
                enable_ssg = v100:switch("Enable \v[SSG-08]"), 
                enable_awp = v100:switch("Enable \v[Awp]"), 
                enable_at = v100:switch("Enable \v[Auto Snipers]"), 
                enable_r8 = v100:switch("Enable \v[Revolver]"), 
                ssg08_chance = v100:slider("Amount \v[air]", 0, 100, 0, 1, "%"), 
                awp_chance = v100:slider("Amount \v[air]", 0, 100, 0, 1, "%"), 
                atsniper_chance = v100:slider("Amount \v[air]", 0, 100, 0, 1, "%"), 
                revolver_chance = v100:slider("Amount \v[air]", 0, 100, 0, 1, "%"), 
                ssg08_nzchance = v100:slider("Amount \v[no zoom]", 0, 100, 0, 1, "%"), 
                awp_nzchance = v100:slider("Amount \v[no zoom]", 0, 100, 0, 1, "%"), 
                atsniper_nzchance = v100:slider("Amount \v[no zoom]", 0, 100, 0, 1, "%")
            }, true;
        end), 
        pingunlocker = v42.settings_misc:switch(v39 .. "\f<signal-bars-good>     \rFake Latency" .. v39 .. " [unlock]", false, function(v101)
            return {
                slider_ping = v101:slider("Amount", 0, 200, 0, nil, "ms")
            }, true;
        end), 
        crosshair = v42.misc:switch(v39 .. "\f<chart-simple-horizontal>     \rCrosshair indicator", false, function(v102)
            -- upvalues: v39 (ref)
            return {
                font = v102:list("", "Classic", "Pixeling"), 
                offset = v102:slider("Offset", 0, 70, 200), 
                classic_crosshair = v102:color_picker("Accent" .. v39 .. " [color]", color(255, 218, 248, 255)), 
                accent_crosshair = v102:color_picker("Accent" .. v39 .. " [color]", color(255, 255, 255, 255)), 
                second_crosshair = v102:color_picker("Second" .. v39 .. " [color]", color(188, 188, 188, 255))
            }, true;
        end), 
        hitmarker = v42.misc:switch(v39 .. "\f<layer-group>     \rHit marker", false, function(v103)
            -- upvalues: v39 (ref)
            return {
                style = v103:list("", "\v\f<circle>", "\v\f<star>"), 
                color_x = v103:color_picker("Color" .. v39 .. " [world]", color(255, 203, 247, 255))
            }, true;
        end), 
        aimbotlogs = v42.settings_additional:switch(v39 .. "\f<chart-simple-horizontal>\r      Ragebot \v[logs]", false, function(v104)
            -- upvalues: v39 (ref)
            return {
                pos = v104:listable("", {
                    [1] = nil, 
                    [2] = "Screen", 
                    [3] = "Hurt", 
                    [1] = "Console " .. v39 .. "[Event]"
                }), 
                theme = v104:list("", {
                    [1] = "Classic", 
                    [2] = "Modern"
                }), 
                dot_style = v104:list("", {
                    [1] = "\v\f<square>", 
                    [2] = "\v\f<circle>"
                }), 
                glow_modern = v104:color_picker("Glow" .. v39 .. " [color]", color(255, 218, 248, 255)), 
                rainbow_color = v104:switch("Rainbow color" .. "\v [dot]"), 
                offset = v104:slider("Offset", 0, 200, 0), 
                filter = v104:switch("Console filter")
            }, true;
        end), 
        manual_arrows = v42.settings_visuals:switch(v39 .. "\f<brackets-round>    \rManual Arrows", false, function(v105)
            -- upvalues: v39 (ref)
            return {
                styled = v105:list("", {
                    [1] = "Classic", 
                    [2] = "Modern"
                }), 
                always_on = v105:switch("Arrows" .. v39 .. " [always on]"), 
                color_arrows = v105:color_picker("Color", color(247, 175, 255, 255)), 
                dynamic = v105:switch("Dynamic \v[mode]"), 
                slider_dynamic = v105:slider("Dynamic \v[speed]", 100, 250, 5), 
                slider_arrows_x = v105:slider("Offset X", 0, 70, 5), 
                slider_arrows_y = v105:slider("Offset Y", -70, 70, 5)
            }, true;
        end), 
        watermark = v42.settings_switcher:switch(v39 .. "\f<claw-marks>\r     Watermark", false, function(v106)
            -- upvalues: v39 (ref)
            return {
                anim_style = v106:list("Stylistic", {
                    [1] = "Progressive", 
                    [2] = "Modern"
                }), 
                selecting = v106:selectable("Type:", {
                    [1] = "PING", 
                    [2] = "FPS", 
                    [3] = "USERNAME", 
                    [4] = "BOMB SITE"
                }), 
                anim_color = v106:color_picker("Color" .. v39 .. " [modern]", color(247, 175, 255, 255)), 
                progressive_color = v106:color_picker("Color" .. v39 .. " [progressive]", color(247, 175, 255, 255)), 
                anim_glow = v106:switch("Color")
            }, true;
        end), 
        clantag = v42.settings_tabber:switch(v39 .. "\f<tags>\r     Clantag \v[spammer]"), 
        trashtalk = v42.settings_tabber:switch(v39 .. "\f<stars>\r     Chat \v[spammer]", false, function(v107)
            return {
                selection = v107:listable("", {
                    [1] = "Kill", 
                    [2] = "Death"
                }), 
                delay_timer = v107:slider("Delay", 1, 3, 3, nil, "s")
            }, true;
        end), 
        animbreakers = v42.settings_tabber:switch(v39 .. "\f<layer-group>\r     Animation" .. v39 .. " [local]", false, function(v108)
            return {
                ground = v108:combo("On ground", {
                    [1] = "Disabled", 
                    [2] = "Reversed", 
                    [3] = "Moonwalk"
                }), 
                air = v108:combo("In air", {
                    [1] = "Disabled", 
                    [2] = "Static", 
                    [3] = "Moonwalk"
                }), 
                addons = v108:listable("Addons", {
                    [1] = "Move Lean", 
                    [2] = "Earthquake"
                }), 
                movelean = v108:slider("Move line", 0, 100, 100, nil, "%")
            }, true;
        end), 
        bars = v42.settings_additional:switch(v39 .. "\f<house-night>\r    Game\vsense" .. v39 .. " [indicators]", false, function(v109)
            -- upvalues: v39 (ref)
            return {
                select = v109:listable("", {
                    [1] = "\aADFF2FFFGamesense \r indicator", 
                    [2] = "\aADFF2FFFGamesense  \rdormant aimbot", 
                    [3] = "\aADFF2FFFGamesense \r proximity warning", 
                    [4] = "\aADFF2FFFGamesense \r nade prediction", 
                    [5] = "\aADFF2FFFSpectators"
                }), 
                reg = v109:selectable("Hitboxed", {
                    [1] = "Head", 
                    [2] = "Chest", 
                    [3] = "Stomach", 
                    [4] = "Legs"
                }), 
                minimum_damage = v109:slider("Minimum Damage", 0, 130, 0, 1), 
                adaptive = v109:switch("Adaptive settings"), 
                mode = v109:listable(v39 .. "\f<gears>  \rMode", {
                    [1] = "Double Tap", 
                    [2] = "Hide Shots", 
                    [3] = "Dormant Aimbot", 
                    [4] = "Damage Override", 
                    [5] = "Hit/Miss", 
                    [6] = "Hitchance Override", 
                    [7] = "Lag Compensation", 
                    [8] = "Hitbox Override", 
                    [9] = "Fake Latency", 
                    [10] = "Fake Angles", 
                    [11] = "Fake Duck", 
                    [12] = "Body Aim", 
                    [13] = "Safe Points", 
                    [14] = "Freestanding", 
                    [15] = "Bomb Info"
                })
            }, true;
        end), 
        scope = v42.settings_visuals:switch(v39 .. "\f<scribble>\r    Scope lines", false, function(v110)
            return {
                color = v110:color_picker("Color", color(255)), 
                length = v110:slider("Length", 0, 275, 45), 
                gap = v110:slider("Gap", 0, 100, 10), 
                anim_zoom = v110:switch("Animation Zoom"), 
                keeptransparency = v110:switch("Keep Model Transparency")
            }, true;
        end), 
        silenced = v42.settings_additional:label(v39 .. "\f<microphone-slash>\r     Mute/Unmute " .. v39 .. " [silenced]", false, function(v111)
            return {
                selection = v111:list("", {
                    [1] = "Disabled", 
                    [2] = "Enemies", 
                    [3] = "Teammates", 
                    [4] = "Everyone"
                })
            };
        end), 
        clientname = v42.misc:label(v39 .. "\f<signature>\r     Nickname generator", false, function(v112)
            return {
                input = v112:input(""), 
                button = v112:button("   Set   ", changeNickname), 
                generator = v112:button("   Generate   ", function()

                end, true)
            };
        end), 
        mindmg = v42.settings_visuals:switch(v39 .. "\f<raindrops>     \rDamage Indicator", false, function(v113)
            -- upvalues: v39 (ref), l_x_0 (ref), l_y_0 (ref)
            return {
                damage_selection = v113:list("", {
                    [1] = "Classic", 
                    [2] = "Pixel"
                }), 
                damage_color = v113:color_picker("Color", color(255)), 
                damage_alpha = v113:slider("In Scope" .. v39 .. " [Alpha]", 25, 70, 50, 1, "%"), 
                damage_position_x = v113:slider("First", 0, l_x_0, 968), 
                damage_position_y = v113:slider("Second", 0, l_y_0, 522)
            }, true;
        end), 
        aspect = v42.settings_switcher:switch(v39 .. "\f<tv-retro>\r      Aspect Ratio", false, function(v114)
            return {
                val = v114:slider("Value", 0, 250, 100, 0.01), 
                pre1 = v114:button(" 16:10 ", nil, true), 
                pre2 = v114:button(" 16:9 ", nil, true), 
                pre3 = v114:button(" 5:4 ", nil, true), 
                pre4 = v114:button(" 4:3 ", nil, true), 
                pre5 = v114:button(" 3:2 ", nil, true)
            }, true;
        end), 
        viewmodel = v42.settings_switcher:switch(v39 .. "\f<hands-clapping>\r      Viewmodel Changer", false, function(v115)
            return {
                fov = v115:slider("Fov", 0, 1000, 600, 0.1), 
                x_axis = v115:slider("X", -100, 100, 10, 0.1), 
                y_axis = v115:slider("Y", -100, 100, 10, 0.1), 
                z_axis = v115:slider("Z", -100, 100, 10, 0.1), 
                opposite_knife = v115:switch("Opposite Knife Hand")
            }, true;
        end), 
        grenade_radius = v42.settings_switcher:switch(v39 .. "\f<vector-circle>\r      Grenade Radius", false, function(v116)
            -- upvalues: v39 (ref)
            return {
                select = v116:listable("", {
                    [1] = "Molotov", 
                    [2] = "Smoke"
                }), 
                molotov_color = v116:color_picker("Color" .. v39 .. " [molotov]", color(175, 235, 255, 255)), 
                smoke_color = v116:color_picker("Color" .. v39 .. " [smoke]", color(175, 255, 200, 255))
            }, true;
        end)
    }
};
spectatoring = {};
spectatoring.spectator_check = function()
    local v117 = {};
    local v118 = entity.get_local_player();
    local v119 = nil;
    if v118 ~= nil then
        if v118.m_hObserverTarget then
            v119 = v118.m_hObserverTarget;
        else
            v119 = v118;
        end;
        local v120 = entity.get_players(false, false);
        if v120 ~= nil then
            for _, v122 in pairs(v120) do
                local l_m_hObserverTarget_0 = v122.m_hObserverTarget;
                if l_m_hObserverTarget_0 and l_m_hObserverTarget_0 == v119 and v122 ~= v118 then
                    table.insert(v117, v122);
                end;
            end;
        end;
    end;
    return v117;
end;
local _ = render.load_font("Verdana", 11, "d, a");
local _ = vector(12, 12);
local _ = 4;
local _ = 4;
local _ = -1;
local _ = 6;
local _ = 1;
local l_rect_0 = render.rect;
local l_shadow_0 = render.shadow;
local l_rect_outline_0 = render.rect_outline;
local function _(v134, v135, ...)
    -- upvalues: l_rect_0 (ref)
    return l_rect_0(v134, v134 + v135, ...);
end;
local function _(v137, v138, v139, v140, v141, v142)
    -- upvalues: l_shadow_0 (ref)
    return l_shadow_0(v137, v138, v139, v140, v141, v142);
end;
local function _(v144, v145, v146, v147, v148)
    -- upvalues: l_rect_outline_0 (ref)
    return l_rect_outline_0(v144, v144 + v145, v146, v147, v148);
end;
local v150 = {
    base_speed = 0.095, 
    _list = {}
};
v150.new = function(v151, v152, v153, v154)
    -- upvalues: v150 (ref)
    if not v153 then
        v153 = v150.base_speed;
    end;
    v150._list[v151] = v150._list[v151] or v154 or 0;
    v150._list[v151] = math.lerp(v150._list[v151], v152, v153);
    return v150._list[v151];
end;
local v155 = render.load_font("Verdana", 11, "d, a");
local v156 = vector(16, 16);
local v157 = 4;
local v158 = 4;
local v159 = -1;
local v160 = 6;
local v161 = 1;
local l_rect_1 = render.rect;
local l_shadow_1 = render.shadow;
local l_rect_outline_1 = render.rect_outline;
local function v167(v165, v166, ...)
    -- upvalues: l_rect_1 (ref)
    return l_rect_1(v165, v165 + v166, ...);
end;
local function _(v168, v169, v170, v171, v172, v173)
    -- upvalues: l_shadow_1 (ref)
    return l_shadow_1(v168, v169, v170, v171, v172, v173);
end;
local function v180(v175, v176, v177, v178, v179)
    -- upvalues: l_rect_outline_1 (ref)
    return l_rect_outline_1(v175, v175 + v176, v177, v178, v179);
end;
local v181 = {
    base_speed = 0.095, 
    _list = {}
};
v181.new = function(v182, v183, v184, v185)
    -- upvalues: v181 (ref)
    if not v184 then
        v184 = v181.base_speed;
    end;
    v181._list[v182] = v181._list[v182] or v185 or 0;
    v181._list[v182] = math.lerp(v181._list[v182], v183, v184);
    return v181._list[v182];
end;
local function v205()
    -- upvalues: v40 (ref), v155 (ref), v156 (ref), v157 (ref), v159 (ref), v160 (ref), v181 (ref), v180 (ref), v158 (ref), v167 (ref), v161 (ref)
    local v186 = entity.get_local_player();
    if not v186 then
        return;
    else
        local v187 = v186:get_spectators();
        if #v187 == 0 then
            return;
        else
            local v188 = v40.fullscreen.y / 2;
            for _, v190 in ipairs(v187) do
                local v191 = v190:get_name();
                local v192 = v190:get_steam_avatar();
                local v193 = render.measure_text(v155, nil, v191).x + v156.x + v157 * 4 + v159 + v160;
                local v194 = vector(v40.fullscreen.x - v193 - 15, v188);
                local v195 = math.max(v156.y, 12) + v157 * 2;
                local _ = v181.new(v191 .. "_y", v188, 8, v40.fullscreen.y / 2);
                local v197 = v181.new(v191 .. "_alpha", 255, 8, 0);
                local _ = color(255, 255, 255, v197);
                local v199 = color(3, 3, 4, v197 * 0.5);
                local v200 = color(56, 56, 56, v197);
                v180(v194, vector(v193, v195), v200, 0.5, v158);
                v167(v194, vector(v193, v195), v199, v158);
                local v201 = vector(v194.x + v157 + v161, v194.y + (v195 - v156.y) / 2 + 0.2);
                if v192 then
                    render.texture(v192, v201, v156, 3);
                end;
                local v202 = vector(v194.x + v156.x + v157 + v160, v194.y + (v195 - 14) / 2);
                local v203 = vector(v194.x + v156.x + v157 + v160, v194.y + (v195 + 14) / 2);
                render.line(v202, v203, color(255, 255, 255, v197 * 0.5));
                local v204 = vector(v194.x + v156.x + v157 * 2 + 2 + v160, v194.y + (v195 - 14) / 2);
                render.text(v155, v204, color(255, 255, 255, v197), nil, v191);
                v188 = v188 + v195 + 4;
            end;
            return;
        end;
    end;
end;
events.render:set(function()
    -- upvalues: v205 (ref)
    v205();
end);
v43.misc.watermark.anim_glow:visibility(false);
v43.antiaim.conditions.base:visibility(false);
v43.antiaim.conditions.pitch:visibility(false);
v43.misc.manual_arrows.slider_arrows_x:visibility(false);
v43.misc.manual_arrows.slider_dynamic:depend({
    [1] = nil, 
    [2] = true, 
    [1] = v43.misc.manual_arrows.dynamic
});
v43.misc.bars.adaptive:tooltip("This function automatically adjusts to the appropriate damage/hitboxes to shoot and hit correctly.");
local v206 = false;
local v207 = render.screen_size();
local v208 = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage");
local l_rect_2 = render.rect;
local l_shadow_2 = render.shadow;
local function v213(v211, v212, ...)
    -- upvalues: l_rect_2 (ref)
    return l_rect_2(v211, v211 + v212, ...);
end;
local function v220(v214, v215, v216, v217, v218, v219)
    -- upvalues: l_shadow_2 (ref)
    return l_shadow_2(v214, v215, v216, v217, v218, v219);
end;
local v233 = l_system_0.register({
    [1] = v43.misc.mindmg.damage_position_x, 
    [2] = v43.misc.mindmg.damage_position_y
}, vector(21, 21), "damage_drag", function(v221)
    -- upvalues: v43 (ref), v206 (ref), v181 (ref), v207 (ref), v220 (ref), v213 (ref), v208 (ref)
    if not v43.misc.mindmg:get() then
        return;
    else
        local v222 = v43.misc.mindmg.damage_color:get();
        local v223 = v43.misc.mindmg.damage_alpha:get();
        local v224 = entity.get_local_player();
        if not v224 or not v224:is_alive() then
            return;
        else
            v206 = v221.is_dragging;
            v221.last_position = v221.position;
            local v225 = v181.new("blur_animation", v206 and 1 or 0, 6, 0);
            local v226 = v181.new("font_alpha", 1, 6, 0);
            local v227 = ui.get_mouse_position();
            local v228 = 25 + v223 / 100 * 45;
            local v229 = nil;
            if v224.m_bIsScoped then
                if v228 <= 25 then
                    v229 = 255;
                    goto label0 --[[  true, true  ]];
                else
                    local v230 = 255 * (1 - (v228 - 25) / 45);
                    if v230 then
                        v229 = v230;
                        goto label0 --[[  true, true  ]];
                    end;
                end;
            end;
            v229 = 255;
            ::label0::;
            v221.position.x = math.clamp(v221.position.x, v207.x / 2 - 100, v207.x / 2 + 79);
            v221.position.y = math.clamp(v221.position.y, v207.y / 2 - 100, v207.y / 2 + 79);
            v222.a = v181.new("damage_scope_alpha_animation", v229, 6, 0);
            local v231 = v181.new("geton_animation", v221:is_in_area(v227) and 1 or 0, 6, 0);
            v220(vector(0, 0), vector(v207.x, v207.y), color(0, 0, 0, 125 * v225), 10, 5, 5);
            v213(vector(0, 0), vector(v207.x, v207.y), color(0, 0, 0, 125 * v225));
            v213(vector(v207.x / 2 - 100, v207.y / 2 - 100), vector(200, 200), color(255, 255, 255, 20 * v225 * ui.get_alpha()), 6);
            v213(vector(v221.position.x, v221.position.y), vector(v221.size.x, v221.size.y), color(255, 255, 255, 40 * ui.get_alpha() * v231), 6);
            local v232 = v43.misc.mindmg.damage_selection:get();
            render.text(v232, vector(v221.position.x + v221.size.x / 2, v221.position.y + v221.size.y / 2), color(v222.r, v222.g, v222.b, v222.a * v226), "c", v208:get());
            return;
        end;
    end;
end);
events.render:set(function()
    -- upvalues: v233 (ref)
    v233:update();
end);
v43.misc.mindmg.damage_position_x:visibility(false);
v43.misc.mindmg.damage_position_y:visibility(false);
oppositeknifehand = function()
    -- upvalues: v43 (ref), l_weapons_0 (ref), v40 (ref)
    if globals.is_in_game == false or entity.get_local_player() == nil or not entity.get_local_player():is_alive() then
        return;
    else
        if v43.misc.viewmodel.opposite_knife:get() then
            local v234 = l_weapons_0(entity.get_local_player():get_player_weapon());
            if v234 == nil then
                return;
            elseif v234.type == "knife" and v40.knifeside == 0 then
                cvar.cl_righthand:int(1);
            elseif v234.type == "knife" and v40.knifeside == 1 then
                cvar.cl_righthand:int(0);
            else
                cvar.cl_righthand:int(v40.knifeside);
            end;
        end;
        return;
    end;
end;
v43.misc.viewmodel.opposite_knife:set_callback(function()
    -- upvalues: v43 (ref), l_weapons_0 (ref), v40 (ref)
    if globals.is_in_game == false or entity.get_local_player() == nil or not entity.get_local_player():is_alive() then
        return;
    else
        if v43.misc.viewmodel.opposite_knife:get() and l_weapons_0(entity.get_local_player():get_player_weapon()).type ~= "knife" then
            v40.knifeside = cvar.cl_righthand:int();
        end;
        if not v43.misc.viewmodel.opposite_knife:get() then
            cvar.cl_righthand:int(v40.knifeside);
        end;
        return;
    end;
end);
events.render:set(function()
    oppositeknifehand();
end);
yaw_base_degree = function()
    -- upvalues: v43 (ref), v41 (ref)
    local v235 = 0;
    if v43.antiaim.manual:get() == "Left" then
        v41.base:override("Local View");
        v235 = -90;
        if v43.antiaim.manual.fsoff:get() then
            v43.antiaim.fs:set(false);
        end;
    elseif v43.antiaim.manual:get() == "Right" then
        v41.base:override("Local View");
        v235 = 90;
        if v43.antiaim.manual.fsoff:get() then
            v43.antiaim.fs:set(false);
        end;
    elseif v43.antiaim.manual:get() == "Forward" then
        v41.base:override("Local View");
        v235 = 180;
        if v43.antiaim.manual.fsoff:get() then
            v43.antiaim.fs:set(false);
        end;
    elseif v43.antiaim.manual:get() == "Disabled" then
        if v43.antiaim.func_edge_test:get() then
            v41.base:override("Local View");
        else
            v41.base:override("At Target");
        end;
        v235 = 0;
        if v43.antiaim.manual.fsoff:get() then
            v43.antiaim.fs:set(false);
        end;
    end;
    return v235;
end;
local _ = {
    dist2d = function(v236, v237)
        return ((v237.x - v236.x) ^ 2 + (v237.y - v236.y) ^ 2) ^ 0.5;
    end, 
    lerp_position = function(v238, v239, v240)
        return vector(v238.x + (v239.x - v238.x) * v240, v238.y + (v239.y - v238.y) * v240, v238.z + (v239.z - v238.z) * v240);
    end
};
local v242 = 17.55;
local v243 = 125;
local function v262()
    -- upvalues: v43 (ref), v181 (ref), v242 (ref), v243 (ref)
    if not entity.get_local_player() then
        return;
    elseif not v43.misc.grenade_radius.select:get(1) and not v43.misc.grenade_radius.select:get(2) then
        return;
    else
        for _, v245 in ipairs(entity.get_entities()) do
            if v245:get_classname() == "CInferno" and v43.misc.grenade_radius.select:get(1) then
                local v246 = v245:get_origin();
                local v247 = 180;
                local v248 = 7;
                local v249 = (globals.tickcount - v245.m_nFireEffectTickBegin) * globals.tickinterval;
                local v250 = v248 - v249;
                local v251 = 2;
                local v252 = 1;
                local v253 = nil;
                if v249 < v251 then
                    v253 = v181.new("molotov_radius_" .. v245:get_index(), v247 * (v249 / v251), 6);
                elseif v249 < v248 - v252 then
                    v253 = v181.new("molotov_radius_" .. v245:get_index(), v247, 6);
                else
                    v253 = v181.new("molotov_radius_" .. v245:get_index(), v247 * (1 - (v249 - (v248 - v252)) / v252), 6);
                end;
                local v254 = 255 * (v250 < 2 and v250 / 2 or 1);
                render.circle_3d_outline(v246, color(v43.misc.grenade_radius.molotov_color:get().r, v43.misc.grenade_radius.molotov_color:get().g, v43.misc.grenade_radius.molotov_color:get().b, v254), v253, 0, 1, 1);
            elseif v245:get_classname() == "CSmokeGrenadeProjectile" and v43.misc.grenade_radius.select:get(2) and v245.m_bDidSmokeEffect then
                local v255 = (globals.tickcount - v245.m_nSmokeEffectTickBegin) * globals.tickinterval;
                local v256 = v242 - v255;
                if v256 < 6 then
                    local v257 = v256 / 6;
                    local v258 = v181.new("smoke_radius_" .. v245:get_index(), v243 * v257, 6);
                    render.circle_3d_outline(v245:get_origin(), color(v43.misc.grenade_radius.smoke_color:get().r, v43.misc.grenade_radius.smoke_color:get().g, v43.misc.grenade_radius.smoke_color:get().b, 255), v258, 0, 1, 1);
                else
                    local l_v243_0 = v243;
                    local v260 = v255 < 0.3 and v255 / 0.3 or v242 - v255 < 1 and (v242 - v255) / 1 or 1;
                    l_v243_0 = l_v243_0 * (v255 < 0.3 and 0.6 + v260 * 0.4 or v260 * 0.3 + 0.7);
                    local v261 = v181.new("smoke_radius_" .. v245:get_index(), l_v243_0, 6);
                    render.circle_3d_outline(v245:get_origin(), color(v43.misc.grenade_radius.smoke_color:get().r, v43.misc.grenade_radius.smoke_color:get().g, v43.misc.grenade_radius.smoke_color:get().b, 255), v261, 0, 1, 1);
                end;
            end;
        end;
        return;
    end;
end;
events.render:set(function()
    -- upvalues: v43 (ref), v262 (ref)
    if v43.misc.grenade_radius:get() then
        v262();
    end;
end);
local v263 = {};
local v264 = {};
v263.font = render.load_font("Calibri Bold", 24, "ad");
v263.shots = 0;
v263.percentage = 0;
v263.sm1_is_dormant = false;
v263.bomb_image = render.load_image_from_file("materials/panorama/images/icons/ui/bomb_c4.svg", vector(30, 30));
draw_500_ = function(v265, v266, v267, v268, v269, v270, v271, v272)
    -- upvalues: v263 (ref)
    if v272 == nil then
        v272 = 255;
    end;
    local _ = render.screen_size().x;
    local l_y_1 = render.screen_size().y;
    local v275 = render.measure_text(v263.font, nil, v266);
    if v267 == nil and v268 == nil then
        render.gradient(vector(0, l_y_1 - 351 - v265), vector(29 + v275.x / 2, l_y_1 - 317 - v265), color(0, 0, 0, 0), color(0, 0, 0, 60), color(0, 0, 0, 0), color(0, 0, 0, 60), 0);
        render.gradient(vector(58 + v275.x, l_y_1 - 351 - v265), vector(29 + v275.x / 2, l_y_1 - 317 - v265), color(0, 0, 0, 0), color(0, 0, 0, 60), color(0, 0, 0, 0), color(0, 0, 0, 60), 0);
        render.text(v263.font, vector(29, l_y_1 - 343 - v265), color(v269, v270, v271, v272), nil, v266);
    elseif v267 ~= nil and v268 ~= nil then
        render.gradient(vector(0, l_y_1 - 351 - v265), vector(29 + v275.x / 2, l_y_1 - 317 - v265), color(0, 0, 0, 0), color(0, 0, 0, 60), color(0, 0, 0, 0), color(0, 0, 0, 60), 0);
        render.gradient(vector(58 + v275.x, l_y_1 - 351 - v265), vector(29 + v275.x / 2, l_y_1 - 317 - v265), color(0, 0, 0, 0), color(0, 0, 0, 60), color(0, 0, 0, 0), color(0, 0, 0, 60), 0);
        render.text(v263.font, vector(67, l_y_1 - 343 - v265), color(v269, v270, v271, v272), nil, v266);
        render.texture(v267, vector(29, l_y_1 - 347 - v265), vector(32, 28), color(v269, v270, v271, 255), f, 0);
        render.circle_outline(vector(99, l_y_1 - 334 - v265), color(10, 10, 10, 255), 10, 0, 1, 5);
        render.circle_outline(vector(99, l_y_1 - 334 - v265), color(255, 255, 255, 200), 9, 0, v268, 3);
    elseif v267 ~= nil and v268 == nil then
        render.gradient(vector(0, l_y_1 - 351 - v265), vector(29 + v275.x / 2, l_y_1 - 317 - v265), color(0, 0, 0, 0), color(0, 0, 0, 60), color(0, 0, 0, 0), color(0, 0, 0, 60), 0);
        render.gradient(vector(58 + v275.x, l_y_1 - 351 - v265), vector(29 + v275.x / 2, l_y_1 - 317 - v265), color(0, 0, 0, 0), color(0, 0, 0, 60), color(0, 0, 0, 0), color(0, 0, 0, 60), 0);
        render.text(v263.font, vector(67, l_y_1 - 343 - v265), color(v269, v270, v271, v272), nil, v266);
        render.texture(v267, vector(29, l_y_1 - 347 - v265), vector(32, 28), color(v269, v270, v271, 255), f, 0);
    end;
end;
v263.real_yaw = 0;
v263.positions = {};
v263.lc = false;
events.createmove:set(function(v276)
    -- upvalues: v263 (ref)
    local v277 = entity.get_local_player();
    local v278 = v277:get_origin();
    local v279 = 1 / globals.tickinterval;
    if v276.choked_commands == 0 then
        v263.positions[#v263.positions + 1] = v278;
        if v279 <= #v263.positions then
            v263.lc = (v278 - v263.positions[v279]):lengthsqr() > 4096;
        end;
    end;
    if v279 < #v263.positions then
        table.remove(v263.positions, 1);
    end;
    v263.is_jumping = v276.in_jump;
    if v276.choked_commands > 0 then
        return;
    else
        v263.real_yaw = v277.m_flPoseParameter[11] * 120 - 60;
        return;
    end;
end);
v264.screen_size = render.screen_size();
v264.dpi_scale = v264.screen_size / vector(1920, 1080);
v263.handle = function()
    -- upvalues: v43 (ref), v264 (ref), v18 (ref), v263 (ref), v181 (ref), v19 (ref), v41 (ref)
    if not v43.misc.bars:get() then
        return;
    else
        local l_mode_0 = v43.misc.bars.mode;
        local v281 = entity.get_local_player();
        if v281 == nil then
            return;
        else
            local v282 = entity.get_entities("CPlantedC4", true)[1];
            local v283 = "";
            local v284 = 0;
            local v285 = false;
            local v286 = 0;
            local _ = 0;
            local v288 = false;
            if v282 ~= nil then
                v284 = v282.m_flC4Blow - globals.curtime;
                v285 = v282.m_bBombDefused;
                if v284 > 0 and not v285 then
                    local v289 = v282.m_hBombDefuser ~= 4294967295;
                    local l_m_flDefuseLength_0 = v282.m_flDefuseLength;
                    local v291 = v282.m_hBombDefuser and v282.m_hBombDefuser.m_bIsDefusing or false;
                    local v292 = v289 and v291 and v282.m_flDefuseCountDown - globals.curtime or -1;
                    if v292 > 0 then
                        local v293 = v292 < v284 and color(58, 191, 54, 160) or color(252, 18, 19, 125);
                        local v294 = (v264.screen_size.y - 50) / l_m_flDefuseLength_0 * v292;
                        render.rect(vector(0, 0), vector(16, v264.screen_size.y), color(25, 25, 25, 160));
                        render.rect_outline(vector(0, 0), vector(16, v264.screen_size.y), color(25, 25, 25, 160));
                        render.rect(vector(0, v264.screen_size.y - v294), vector(16, v264.screen_size.y), v293);
                    end;
                    v283 = v282.m_nBombSite == 0 and "A" or "B";
                    local l_m_iHealth_0 = v281.m_iHealth;
                    local l_m_ArmorValue_0 = v281.m_ArmorValue;
                    local v297 = v282.m_vecOrigin:dist(v281.m_vecOrigin);
                    local v298 = 450.7;
                    local v299 = (v297 - 75.68) / 789.2;
                    v286 = v298 * math.exp(-v299 * v299);
                    if l_m_ArmorValue_0 > 0 then
                        local v300 = v286 * 0.5;
                        local v301 = (v286 - v300) * 0.5;
                        if l_m_ArmorValue_0 < v301 then
                            l_m_ArmorValue_0 = l_m_ArmorValue_0 * 2;
                            v300 = v286 - v301;
                        end;
                        v286 = v300;
                    end;
                    v288 = l_m_iHealth_0 <= math.ceil(v286);
                end;
            end;
            if v18.planting then
                v18.fill = 3.125 - (3.125 + v18.on_plant_time - globals.curtime);
                if v18.fill > 3.125 then
                    v18.fill = 3.125;
                end;
            end;
            v263.sm1_is_dormant = false;
            local v302 = entity.get_players(true, true);
            if not v302 then
                return;
            else
                for _, v304 in ipairs(v302) do
                    if v304:is_dormant() then
                        v263.sm1_is_dormant = true;
                    end;
                end;
                if not v43.misc.bars:get() then
                    return;
                else
                    local v305 = entity.get_local_player();
                    if v305 == nil then
                        return;
                    else
                        v264.get_bind = function(v306)
                            local v307 = false;
                            local v308 = 0;
                            local v309 = ui.get_binds();
                            for v310 = 1, #v309 do
                                if v309[v310].name == v306 and v309[v310].active then
                                    v307 = true;
                                    v308 = v309[v310].value;
                                end;
                            end;
                            return {
                                [1] = v307, 
                                [2] = v308
                            };
                        end;
                        v263.sm1_is_dormant = false;
                        local v311 = entity.get_players(true, true);
                        if not v311 then
                            return;
                        else
                            for _, v313 in ipairs(v311) do
                                if v313:is_dormant() then
                                    v263.sm1_is_dormant = true;
                                end;
                            end;
                            local v314 = entity.get_local_player();
                            if globals.is_connected == false or v314 == nil or v314:is_alive() == false then
                                return;
                            else
                                local l_m_iPing_0 = v314:get_resource().m_iPing;
                                local v316 = math.abs(l_m_iPing_0 % 360);
                                if v316 > 1 then
                                    v316 = 1;
                                end;
                                local _ = 132 * v316 + 255 * (1 - v316);
                                local _ = 196 * v316 + 255 * (1 - v316);
                                local _ = 20 * v316 + 255 * (1 - v316);
                                local v320 = math.min(60, math.abs(v263.real_yaw)) / 60;
                                local v321 = 132 * v320 + 250 * (1 - v320);
                                local v322 = 196 * v320 + 15 * (1 - v320);
                                local v323 = 20 * v320 + 15 * (1 - v320);
                                local v324 = 0;
                                local _ = render.screen_size().x;
                                local _ = render.screen_size().y;
                                lerp = function(v327, v328, v329)
                                    return v327 + (v328 - v327) * v329;
                                end;
                                animate_color_multi = function(v330)
                                    -- upvalues: v181 (ref)
                                    local v331 = 201;
                                    local v332 = 0;
                                    local v333 = (math.min(math.max(v330, v332), v331) - v332) / (v331 - v332);
                                    local v334 = {
                                        [1] = {
                                            r = 255, 
                                            g = 0, 
                                            b = 0
                                        }, 
                                        [2] = {
                                            r = 255, 
                                            g = 69, 
                                            b = 0
                                        }, 
                                        [3] = {
                                            r = 255, 
                                            g = 165, 
                                            b = 0
                                        }, 
                                        [4] = {
                                            r = 204, 
                                            g = 204, 
                                            b = 0
                                        }, 
                                        [5] = {
                                            r = 255, 
                                            g = 255, 
                                            b = 0
                                        }, 
                                        [6] = {
                                            r = 0, 
                                            g = 128, 
                                            b = 0
                                        }, 
                                        [7] = {
                                            r = 127, 
                                            g = 255, 
                                            b = 0
                                        }
                                    };
                                    local v335 = #v334;
                                    local v336 = 1 / (v335 - 1);
                                    local v337 = math.floor(v333 / v336) + 1;
                                    local v338 = v333 % v336 / v336;
                                    if v337 < v335 then
                                        local v339 = v334[v337];
                                        local v340 = v334[v337 + 1];
                                        return v181.new("ping_color_r", lerp(v339.r, v340.r, v338), 1), v181.new("ping_color_g", lerp(v339.g, v340.g, v338), 1), (v181.new("ping_color_b", lerp(v339.b, v340.b, v338), 1));
                                    else
                                        return v334[v335].r, v334[v335].g, v334[v335].b;
                                    end;
                                end;
                                local function v346(v341, v342, v343, v344, v345)
                                    -- upvalues: v324 (ref)
                                    draw_500_(v324, v341, nil, nil, v342, v343, v344, v345);
                                    v324 = v324 + 42;
                                end;
                                if l_mode_0:get("Fake Latency") and v43.misc.bars.select:get(1) and v19.ping:get() >= 0 then
                                    local v347, v348, v349 = animate_color_multi(v19.ping:get());
                                    v346("PING", v347, v348, v349, 255);
                                end;
                                if l_mode_0:get("Hide Shots") and v43.misc.bars.select:get(1) and v19.hs:get() and not v19.dt:get() then
                                    v346("OSAA", 255, 255, 255, 200);
                                end;
                                if l_mode_0:get("Double Tap") and v43.misc.bars.select:get(1) and v43.misc.bars.select:get(1) and v19.dt:get() and not v19.fd:get() then
                                    local v350 = rage.exploit:get();
                                    v346("DT", v350 == 1 and 255 or 255, v350 == 1 and 255 or 0, v350 == 1 and 255 or 50, v350 == 1 and 200 or 255);
                                end;
                                if l_mode_0:get("Dormant Aimbot") and v43.misc.bars.select:get(1) and v41.dormant:get() then
                                    v346("DA", v263.sm1_is_dormant and 255 or 255, v263.sm1_is_dormant and 255 or 0, v263.sm1_is_dormant and 255 or 50, v263.sm1_is_dormant and 200 or 255);
                                end;
                                if l_mode_0:get("Lag Compensation") then
                                    local v351 = v181.new("lc_color_r", v263.lc and 0 or 255, 2);
                                    local v352 = v181.new("lc_color_g", v263.lc and 160 or 0, 2);
                                    local v353 = v181.new("lc_color_b", v263.lc and 50 or 0, 2);
                                    if (bit.band(v314.m_fFlags, 1) == 0 or v263.is_jumping) and math.sqrt(v314.m_vecVelocity.x ^ 2 + v314.m_vecVelocity.y ^ 2) > 230 then
                                        v346("LC", v351, v352, v353, 240);
                                    end;
                                end;
                                if l_mode_0:get("Fake Angles") then
                                    v346("FAKE", v321, v322, v323, 255);
                                end;
                                if l_mode_0:get("Safe Points") and v43.misc.bars.select:get(1) and v19.safe:get() == "Force" then
                                    v346("SAFE", 255, 255, 255, 200);
                                end;
                                if l_mode_0:get("Body Aim") and v43.misc.bars.select:get(1) and v19.body:get() == "Force" then
                                    v346("BODY", 255, 255, 255, 200);
                                end;
                                if l_mode_0:get("Fake Duck") and v43.misc.bars.select:get(1) and v19.fd:get() then
                                    v346("DUCK", 255, 255, 255, 200);
                                end;
                                if l_mode_0:get("Damage Override") and v43.misc.bars.select:get(1) and v264.get_bind("Min. Damage")[1] then
                                    v346("MD", 255, 255, 255, 200);
                                end;
                                if l_mode_0:get("Freestanding") and v43.misc.bars.select:get(1) and v43.antiaim.fs:get() then
                                    v346("FS", 255, 255, 255, 200);
                                end;
                                if l_mode_0:get("Hit/Miss") then
                                    v346(tostring(v263.percentage) .. "%", 255, 255, 255, 200);
                                end;
                                if l_mode_0:get("Bomb Info") and v43.misc.bars.select:get(1) and v284 > 0 and not v285 then
                                    draw_500_(v324, v283 .. " - " .. string.format("%.1f", v284) .. "s              ", v263.bomb_image, nil, 255, 255, 255, 200);
                                    v324 = v324 + 42;
                                end;
                                if l_mode_0:get("Bomb Info") and v43.misc.bars.select:get(1) and v18.planting then
                                    draw_500_(v324, v18.planting_site .. "              ", v263.bomb_image, v18.fill / 3.125, 252, 243, 105, 255);
                                    v324 = v324 + 42;
                                end;
                                if l_mode_0:get("Bomb Info") and v43.misc.bars.select:get(1) and v305:is_alive() and v288 then
                                    draw_500_(v324, "FATAL", nil, nil, 255, 0, 50, 255);
                                    v324 = v324 + 42;
                                end;
                                if l_mode_0:get("Hitchance Override") and v43.misc.bars.select:get(1) and v43.misc.bars.select:get(1) and v264.get_bind("Hit Chance")[1] then
                                    v346("HITCHANCE OVR", 255, 255, 255, 200);
                                end;
                                if l_mode_0:get("Hitbox Override") and v43.misc.bars.select:get(1) and v264.get_bind("Hitboxes")[1] then
                                    v346("HITBOX OVR", 255, 255, 255, 200);
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
local _ = v43.misc.bars.select:get();
local v355 = {
    img = render.load_image_from_file("materials/panorama/images/icons/equipment/inferno.svg", vector(30, 28)), 
    img2 = render.load_image_from_file("materials/panorama/images/icons/equipment/hegrenade.svg", vector(19, 32)), 
    font = render.load_font("calibri", 11, "ab"), 
    warning_data = {}
};
events.pre_render(function()
    -- upvalues: v355 (ref)
    for v356, v357 in pairs(v355.warning_data) do
        if not v357.entity or not entity.get(v357.entity) then
            v355.warning_data[v356] = nil;
        end;
    end;
end);
events.grenade_warning(function(v358)
    -- upvalues: v43 (ref), v355 (ref)
    if not v43.misc.bars:get() or not v43.misc.bars.select:get(3) then
        return;
    else
        local v359 = v358.expire_time - globals.curtime;
        local v360 = ("%s%s%s"):format(v358.expire_time, v358.origin, v358.type);
        if not v355.warning_data[v360] then
            v355.warning_data[v360] = {
                entity = v358.entity, 
                start_time = v359, 
                realtime = globals.realtime
            };
        end;
        if v359 < 0.015 then
            v355.warning_data[v360] = nil;
        end;
        if not v355.warning_data[v360] then
            return;
        else
            local v361 = entity.get_local_player();
            if not v361 then
                return;
            else
                local v362 = v361:is_alive() and v361 or v361.m_hObserverTarget;
                if not v362 then
                    return;
                else
                    local v363 = v358.origin:to_screen() and v358.origin:to_screen() or render.get_offscreen(v358.origin, 0.92, true);
                    local _ = v355.warning_data[v360].start_time;
                    if v358.type == "Molly" and v355.warning_data[v360] then
                        local v365 = v358.closest_point:dist(v362:get_origin());
                        local _ = math.clamp(180 - v365, 0, 100) * 0.01;
                        render.texture(v355.img, v363 - vector(15, 25), color(255, 220));
                        render.text(v355.font, v363 + vector(0, 12), color(255, 220), "c", ("%.0f"):format(v358.origin:dist(v362:get_origin()) * 0.08128));
                    else
                        local v367 = v358.origin:dist(v362:get_origin());
                        if v358.damage < 1 or not (math.clamp(346 - v367, 0, 100) * 0.01) then
                            local _ = 0;
                        end;
                        if v358.damage < 1 or not (math.clamp(250 - v367, 0, 100) * 0.01) then
                            local _ = 0;
                        end;
                        render.texture(v355.img2, v363 - vector(10, 27), color(255, 220));
                        render.text(v355.font, v363 + vector(0, 12), color(255, 220), "c", v358.damage);
                    end;
                    return false;
                end;
            end;
        end;
    end;
end);
events.grenade_warning(function(v370)
    -- upvalues: v43 (ref), v355 (ref)
    if not v43.misc.bars:get() or not v43.misc.bars.select:get(3) then
        return;
    else
        local v371 = v370.expire_time - globals.curtime;
        local v372 = ("%s%s%s"):format(v370.expire_time, v370.origin, v370.type);
        if not v355.warning_data[v372] then
            v355.warning_data[v372] = {
                entity = v370.entity, 
                start_time = v371, 
                realtime = globals.realtime
            };
        end;
        if v371 < 0.015 then
            v355.warning_data[v372] = nil;
        end;
        if not v355.warning_data[v372] then
            return;
        else
            local v373 = entity.get_local_player();
            if not v373 then
                return;
            else
                local v374 = v373:is_alive() and v373 or v373.m_hObserverTarget;
                if not v374 then
                    return;
                else
                    local v375 = v370.origin:to_screen() and v370.origin:to_screen() or render.get_offscreen(v370.origin, 0.92, true);
                    local l_start_time_1 = v355.warning_data[v372].start_time;
                    if v370.type == "Molly" and v355.warning_data[v372] then
                        local v377 = v370.closest_point:dist(v374:get_origin());
                        local v378 = math.clamp(180 - v377, 0, 100) * 0.01;
                        render.circle_gradient(v375, color(0, 220), color(255 * v378, 0, 0, 220), 30 + 20 * v378, 360, 1);
                        render.circle_outline(v375, color(255, 220), 29.5 + 20 * v378, 360, v370.entity:get_classname() == "CMolotovProjectile" and v371 / l_start_time_1 or v371 / 7, 2);
                        render.texture(v355.img, v375 - vector(15, 25), color(255, 220));
                        render.text(v355.font, v375 + vector(0, 12), color(255, 220), "c", ("%.0f"):format(v370.origin:dist(v374:get_origin()) * 0.08128));
                    else
                        local v379 = v370.origin:dist(v374:get_origin());
                        local v380 = v370.damage >= 1 and math.clamp(346 - v379, 0, 100) * 0.01 or 0;
                        local v381 = v370.damage >= 1 and math.clamp(250 - v379, 0, 100) * 0.01 or 0;
                        render.circle_gradient(v375, color(0, 220), v370.damage >= 1 and color(100, 220):lerp(color(255, 10, 10, 220), v380) or color(0, 220), 30 + 20 * v381, 360, 1);
                        render.circle_outline(v375, color(255, 220), 29.5 + 20 * v381, 360, v371 * 0.63, 2);
                        render.texture(v355.img2, v375 - vector(10, 27), color(255, 220));
                        render.text(v355.font, v375 + vector(0, 12), color(255, 220), "c", v370.damage);
                    end;
                    return false;
                end;
            end;
        end;
    end;
end);
v355.prediction_info = {};
events.grenade_prediction(function(v382)
    -- upvalues: v43 (ref), v355 (ref)
    if not v43.misc.bars:get() or not v43.misc.bars.select:get(4) then
        return;
    else
        v355.prediction_info = v382;
        return false;
    end;
end);
local v383 = ui.find("Visuals", "World", "Other", "Grenade Prediction", "Color");
local v384, v385 = ui.find("Visuals", "World", "Other", "Grenade Prediction", "Color Hit");
do
    local l_v383_0, l_v385_0 = v383, v385;
    events.render(function()
        -- upvalues: v43 (ref), v355 (ref), l_v385_0 (ref), l_v383_0 (ref)
        if not v43.misc.bars:get() or not v43.misc.bars.select:get(4) then
            return;
        elseif not v355.prediction_info.type then
            return;
        else
            for v388 = 1, #v355.prediction_info.path do
                local v389 = render.world_to_screen(v355.prediction_info.path[math.max(1, v388 - 1)]);
                local v390 = render.world_to_screen(v355.prediction_info.path[v388]);
                render.line(v389, v390, v355.prediction_info.damage >= 1 and l_v385_0:get() or l_v383_0:get());
            end;
            if #v355.prediction_info.path > 1 then
                for v391 = 1, #v355.prediction_info.collisions - 1 do
                    local v392 = render.world_to_screen(v355.prediction_info.collisions[v391]);
                    render.circle(v392, color(0, 150), 3, 360, 1);
                    render.circle(v392, color(), 2, 360, 1);
                end;
                local v393 = render.world_to_screen(v355.prediction_info.path[#v355.prediction_info.path]);
                render.circle(v393, color(0, 150), 3, 360, 1);
                local v394 = v355.prediction_info.damage >= 1 and color(0, 255, 0, 255) or color(255, 0, 0, 255);
                render.circle(v393, v394, 2.4, 360, 1);
                if v355.prediction_info.damage >= 1 and v393 then
                    local v395 = v355.prediction_info.type == "Molly" and ("%.1f ft"):format(v355.prediction_info.damage * 0.083529) or v355.prediction_info.type == "Flash" and v355.prediction_info.damage .. "%" or v355.prediction_info.damage .. " dmg";
                    render.text(1, v393 - vector(0, 9), color(), "c", v395);
                end;
            end;
            v355.prediction_info = {};
            return;
        end;
    end);
end;
v18 = {};
v18.reset = function()
    -- upvalues: v18 (ref)
    v18.planting = false;
    v18.fill = 0;
    v18.on_plant_time = 0;
    v18.planting_site = "";
end;
v18.bomb_beginplant = function(v396)
    -- upvalues: v18 (ref)
    local v397 = entity.get_player_resource();
    if v397 == nil then
        return;
    else
        v18.on_plant_time = globals.curtime;
        v18.planting = true;
        local l_m_bombsiteCenterA_0 = v397.m_bombsiteCenterA;
        local l_m_bombsiteCenterB_0 = v397.m_bombsiteCenterB;
        local v400 = entity.get(v396.userid, true):get_origin();
        v18.planting_site = v400:dist(l_m_bombsiteCenterA_0) < v400:dist(l_m_bombsiteCenterB_0) and "A" or "B";
        return;
    end;
end;
shot = function(v401)
    if not v401.state then

    end;
end;
enemy_miss = function(v402)
    local v403 = entity.get_local_player();
    if v403 == nil or not v403:is_alive() then
        return;
    else
        local v404 = entity.get(v402.userid, true);
        if v404 == nil or not v404:is_alive() or v404:is_dormant() or not v404:is_enemy() then
            return;
        else
            local v405 = vector(v402.x, v402.y, v402.z);
            local v406 = v403:get_eye_position();
            local v407 = v406:closest_ray_point(v404:get_eye_position(), v405):dist(v406);
            if v407 > 50 and v407 > 2 then
                return;
            elseif not v403:is_alive() then
                return;
            else
                return;
            end;
        end;
    end;
end;
events.aim_ack:set(function(v408)
    shot(v408);
end);
events.bullet_impact:set(function(v409)
    enemy_miss(v409);
end);
v383 = {
    handle = function(v410)
        -- upvalues: v43 (ref)
        local v411 = entity.get_local_player();
        if v411 == nil then
            return;
        else
            if v43.antiaim.ladder_select:get() and v411.m_MoveType == 9 then
                if v410.forwardmove > 0 and render.camera_angles().x < 45 then
                    v410.view_angles.x = 89;
                    v410.in_moveright = 1;
                    v410.in_moveleft = 0;
                    v410.in_forward = 0;
                    v410.in_back = 1;
                    if v410.sidemove == 0 then
                        v410.view_angles.y = v410.view_angles.y + 90;
                    end;
                    if v410.sidemove < 0 then
                        v410.view_angles.y = v410.view_angles.y + 150;
                    end;
                    if v410.sidemove > 0 then
                        v410.view_angles.y = v410.view_angles.y + 30;
                    end;
                end;
                if v410.forwardmove < 0 then
                    v410.view_angles.x = 89;
                    v410.in_moveleft = 1;
                    v410.in_moveright = 0;
                    v410.in_forward = 1;
                    v410.in_back = 0;
                    if v410.sidemove == 0 then
                        v410.view_angles.y = v410.view_angles.y + 90;
                    end;
                    if v410.sidemove > 0 then
                        v410.view_angles.y = v410.view_angles.y + 150;
                    end;
                    if v410.sidemove < 0 then
                        v410.view_angles.y = v410.view_angles.y + 30;
                    end;
                end;
            end;
            return;
        end;
    end
};
events.createmove:set(function(v412)
    -- upvalues: v383 (ref)
    v383.handle(v412);
end);
grenade_release = function(v413)
    -- upvalues: v43 (ref)
    local v414 = entity.get_local_player();
    if not v414 or not v414:is_alive() then
        return;
    else
        local v415 = v414:get_player_weapon();
        if not v415 then
            return;
        else
            local v416 = v415:get_weapon_index();
            if v416 ~= 44 and v416 ~= 46 then
                return;
            else
                local l_grenades_0 = v43.misc.grenades;
                if l_grenades_0.nades:get(1) and v415.m_bPinPulled and l_grenades_0.calc_grenade:get() < v413.damage then
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
events.grenade_prediction:set(function(v418)
    grenade_release(v418);
end);
v384 = function()
    -- upvalues: v43 (ref)
    local v419 = entity.get_local_player();
    if not v419 or not v419:is_alive() then
        return;
    else
        local v420 = v419:get_player_weapon(true);
        for _, v422 in ipairs(v420) do
            local v423 = v422:get_classname();
            if (v423 == "CMolotovGrenade" or v423 == "CIncendiaryGrenade") and v43.misc.grenades.selectnades:get("Molotov") then
                utils.execute_after(0.23, function()
                    utils.console_exec("use weapon_molotov; use weapon_incgrenade;drop");
                end);
            end;
            if v423 == "CSmokeGrenade" and v43.misc.grenades.selectnades:get("Smoke") then
                utils.execute_after(0.25, function()
                    utils.console_exec("use weapon_smokegrenade;drop");
                end);
            end;
            if v423 == "CHEGrenade" and v43.misc.grenades.selectnades:get("Nade") then
                utils.execute_after(0.27, function()
                    utils.console_exec("use weapon_hegrenade;drop");
                end);
            end;
        end;
        return;
    end;
end;
events.render:set(function()
    -- upvalues: v43 (ref), v384 (ref)
    if v43.misc.grenades.nadehotkey:get() and not key_click_cache then
        v384();
    end;
    key_click_cache = v43.misc.grenades.nadehotkey:get();
end);
fakelatency = function()
    -- upvalues: v43 (ref), v19 (ref)
    local v424, _ = v43.misc.pingunlocker:get();
    if v424 then
        cvar.sv_maxunlag:float(0.4);
        v19.ping:override(v43.misc.pingunlocker.slider_ping:get());
    else
        cvar.sv_maxunlag:float(0.2);
        v19.ping:override();
    end;
end;
manage_filters = function()
    -- upvalues: v43 (ref), v19 (ref)
    if v43.misc.aimbotlogs.filter:get() then
        v19.filter:override("Console");
    else
        v19.filter:override("");
    end;
end;
clear_console = function()
    -- upvalues: v43 (ref)
    if v43.misc.aimbotlogs.filter:get() then
        utils.console_exec("clear");
    end;
end;
events.render:set(function()
    fakelatency();
    manage_filters();
end);
aspectratio = function()
    -- upvalues: v43 (ref), v181 (ref)
    if v43.misc.aspect:get() then
        cvar.r_aspectratio:float(v181.new("aspect_ratio_value", v43.misc.aspect.val:get() / 100, 5));
    else
        cvar.r_aspectratio:float(0);
    end;
end;
v43.misc.aspect:set_callback(aspectratio);
aspectratio();
events.render:set(function()
    aspectratio();
end);
v43.misc.aspect.val:set_callback(function(v426)
    -- upvalues: v43 (ref)
    if v43.misc.aspect:get() then
        cvar.r_aspectratio:float(v426:get(10) / 100);
    end;
end);
v43.misc.aspect.pre1:set_callback(function()
    -- upvalues: v43 (ref)
    v43.misc.aspect.val:set(160);
end);
v43.misc.aspect.pre2:set_callback(function()
    -- upvalues: v43 (ref)
    v43.misc.aspect.val:set(178);
end);
v43.misc.aspect.pre3:set_callback(function()
    -- upvalues: v43 (ref)
    v43.misc.aspect.val:set(125);
end);
v43.misc.aspect.pre4:set_callback(function()
    -- upvalues: v43 (ref)
    v43.misc.aspect.val:set(133);
end);
v43.misc.aspect.pre5:set_callback(function()
    -- upvalues: v43 (ref)
    v43.misc.aspect.val:set(150);
end);
viewmodelm = function()
    -- upvalues: v43 (ref), v181 (ref)
    if v43.misc.viewmodel:get(11) then
        local v427 = v181.new("viewmodel_fov_value", v43.misc.viewmodel:get() and v43.misc.viewmodel.fov:get() / 10 or get_original(cvar.viewmodel_fov), 5);
        local v428 = v181.new("viewmodel_x_value", v43.misc.viewmodel:get() and v43.misc.viewmodel.x_axis:get() / 10 or get_original(cvar.viewmodel_offset_x), 5);
        local v429 = v181.new("viewmodel_y_value", v43.misc.viewmodel:get() and v43.misc.viewmodel.y_axis:get() / 10 or get_original(cvar.viewmodel_offset_y), 5);
        local v430 = v181.new("viewmodel_z_value", v43.misc.viewmodel:get() and v43.misc.viewmodel.z_axis:get() / 10 or get_original(cvar.viewmodel_offset_z), 5);
        cvar.viewmodel_fov:float(v427, true);
        cvar.viewmodel_offset_x:float(v428, true);
        cvar.viewmodel_offset_y:float(v429, true);
        cvar.viewmodel_offset_z:float(v430, true);
    end;
end;
v43.misc.viewmodel:set_callback(viewmodelm);
viewmodelm();
events.render:set(function()
    viewmodelm();
end);
builder = function(_)
    -- upvalues: v44 (ref), v43 (ref), v40 (ref), v45 (ref), l_pui_0 (ref), v39 (ref), v46 (ref), v47 (ref)
    v44.enable = v43.antiaim.enable;
    v44.conditions = v43.antiaim.conditions;
    v44.mode = v43.info.selection;
    for v432 = 1, #v40.cond do
        v45[v432] = {
            yaw_backward = l_pui_0.create(v39 .. ui.get_icon("house-night"), "\n\n" .. v39 .. v40.cond[v432], 2), 
            yaw = l_pui_0.create(v39 .. ui.get_icon("house-night"), "\a525252FFBUILDER \194\187 \r" .. v40.cond[v432], 2), 
            sliders = l_pui_0.create(v39 .. ui.get_icon("house-night"), "\n\n\n" .. v39 .. v40.cond[v432], 2), 
            modifier = l_pui_0.create(v39 .. ui.get_icon("house-night"), "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" .. v39 .. v40.cond[v432], 2), 
            randomization = l_pui_0.create(v39 .. ui.get_icon("house-night"), "\n\n\n\n" .. v39 .. v40.cond[v432], 2), 
            bodyyaw = l_pui_0.create(v39 .. ui.get_icon("house-night"), "\n\n\n\n\n" .. v39 .. v40.cond[v432], 2), 
            defensivetab = l_pui_0.create(v39 .. ui.get_icon("house-night"), "\a525252FFdefensive \194\187 \r" .. v39 .. v40.cond[v432], 2), 
            defensivetype = l_pui_0.create(v39 .. ui.get_icon("house-night"), "\n\n\n\n\n\n\n" .. v39 .. v40.cond[v432], 2), 
            defensivesection = l_pui_0.create(v39 .. ui.get_icon("house-night"), "\n\n\n\n\n\n\n\n" .. v39 .. v40.cond[v432], 2)
        };
        v46[v432] = {
            yaw = v45[v432].yaw_backward:combo(v39 .. "\f<chart-bar>   \rYaw", {
                [1] = "Backward"
            }), 
            yaw_mode = v45[v432].yaw:combo(v39 .. "\f<code-merge>   \rMethod", {
                [1] = "Classic", 
                [2] = "Switch"
            }), 
            delay = v45[v432].sliders:slider(v39 .. "\f<angle-right>    \rDelay Tick", 0, 12, 0, nil, "t"), 
            modifier = v45[v432].modifier:combo(v39 .. "\f<code-compare>   \rModifier", {
                [1] = "Disabled", 
                [2] = "Center", 
                [3] = "Offset", 
                [4] = "Random", 
                [5] = "3-Way"
            }), 
            bodyyaw = v45[v432].bodyyaw:switch(v39 .. "\f<angle-90>    \rBody yaw"), 
            defensive = v45[v432].defensivetab:switch(v39 .. "\f<sparkles>   \rDefensive anti-aim")
        };
        local v433 = {
            yaw = v46[v432].yaw:create(), 
            yaw_gear = v46[v432].yaw_mode:create(), 
            modifier = v46[v432].modifier:create(), 
            bodyyaw = v46[v432].bodyyaw:create(), 
            delay_g = v46[v432].delay:create()
        };
        v47[v432] = {
            mode = v433.yaw:combo(v39 .. "[/]", {
                [1] = "Backward"
            }), 
            static = v45[v432].sliders:slider(v39 .. "\f<angle-right>    \rOffset", -90, 90, 0, nil, "\194\176"), 
            left = v45[v432].sliders:slider(v39 .. "\f<angle-right>    \rMin. Offset", -90, 90, 0, nil, "\194\176"), 
            right = v45[v432].sliders:slider(v39 .. "\f<angle-right>    \rMax. Offset", -90, 90, 0, nil, "\194\176"), 
            delayticks = v433.delay_g:slider(v39 .. "\f<angle-right>     \rRandomize ticks", 1, 14, 0, 1, "t"), 
            modmode = v433.modifier:combo(v39 .. "Method", {
                [1] = "Classic", 
                [2] = "Switch"
            }), 
            modstatic = v45[v432].modifier:slider(v39 .. "\f<angle-right>    \rOffset", -90, 90, 0, nil, "\194\176"), 
            modleft = v45[v432].modifier:slider(v39 .. "\f<angle-right>    \rMin. Offset", -90, 90, 0, nil, "\194\176"), 
            modright = v45[v432].modifier:slider(v39 .. "\f<angle-right>    \rMax. Offset", -90, 90, 0, nil, "\194\176"), 
            options = v433.bodyyaw:selectable("Options", {
                [1] = "Avoid Overlap", 
                [2] = "Jitter", 
                [3] = "Randomize Jitter", 
                [4] = "Anti Bruteforce"
            }), 
            fs = v433.bodyyaw:combo("Freestanding", {
                [1] = "Disabled", 
                [2] = "Peek Fake", 
                [3] = "Peek Real"
            }), 
            leftlimit = v45[v432].bodyyaw:slider(v39 .. "\f<angle-right>     \rLeft limit", 0, 60, 60, nil, "\194\176"), 
            rightlimit = v45[v432].bodyyaw:slider(v39 .. "\f<angle-right>     \rRight limit", 0, 60, 60, nil, "\194\176"), 
            randomization = v45[v432].bodyyaw:slider(v39 .. "\f<angle-right>     \rRandomize", 0, 100, 0, 1, "\194\176"), 
            dselect = v45[v432].defensivetype:selectable("Select type", {
                [1] = "Pitch", 
                [2] = "Yaw"
            }), 
            breaklc = v45[v432].defensivetype:switch("\rForce LC"), 
            pitch = v45[v432].defensivesection:combo("Pitch", {
                [1] = "Disabled", 
                [2] = "Down", 
                [3] = "Up", 
                [4] = "Random", 
                [5] = "Custom"
            }), 
            pitch_random1 = v45[v432].defensivesection:slider("First Degree", -89, 89, 0, 1), 
            pitch_random2 = v45[v432].defensivesection:slider("Second Degree", -89, 89, 0, 1), 
            pitch_custom1 = v45[v432].defensivesection:slider("First Degree", -89, 89, 0, 1), 
            pitch_custom2 = v45[v432].defensivesection:slider("Second Degree", -89, 89, 0, 1), 
            yaw = v45[v432].defensivesection:combo("Yaw", {
                [1] = "Custom", 
                [2] = "Forward", 
                [3] = "Spin", 
                [4] = "Random", 
                [5] = "Sideways"
            }), 
            yaw_random1 = v45[v432].defensivesection:slider("First Degree", -90, 90, 0, 1), 
            yaw_random2 = v45[v432].defensivesection:slider("Second Degree", -90, 90, 0, 1), 
            yaw_spin_speed = v45[v432].defensivesection:slider("Speed", 1, 20, 0, 1), 
            yaw_custom1 = v45[v432].defensivesection:slider("First Degree", -90, 90, 0, 1), 
            yaw_custom2 = v45[v432].defensivesection:slider("Second Degree", -90, 90, 0, 1)
        };
    end;
    visibility = function()
        -- upvalues: v40 (ref), v43 (ref), v45 (ref), v46 (ref), v47 (ref)
        for v434 = 1, #v40.cond do
            local v435 = v43.antiaim.conditions:get() == v40.cond[v434] and v43.antiaim.enable:get() == 2 and v43.info.selection:get() == 2;
            v45[v434].yaw:visibility(v435 and v43.antiaim.conditions:get() == v40.cond[v434]);
            v45[v434].yaw_backward:visibility(false);
            v45[v434].bodyyaw:visibility(v435 and v43.antiaim.conditions:get() == v40.cond[v434]);
            v45[v434].defensivetab:visibility(v43.antiaim.enable:get() == 3 and v43.antiaim.conditions:get() == v40.cond[v434] and v43.info.selection:get() == 2);
            v45[v434].defensivetype:visibility(v43.antiaim.enable:get() == 3 and v43.antiaim.conditions:get() == v40.cond[v434] and v43.info.selection:get() == 2);
            v45[v434].defensivesection:visibility(v43.antiaim.enable:get() == 3 and v43.antiaim.conditions:get() == v40.cond[v434] and v43.info.selection:get() == 2);
            v45[v434].sliders:visibility(v435 and v43.antiaim.conditions:get() == v40.cond[v434]);
            v45[v434].randomization:visibility(v435 and v43.antiaim.conditions:get() == v40.cond[v434]);
            v45[v434].modifier:visibility(v435 and v43.antiaim.conditions:get() == v40.cond[v434]);
            v46[v434].modifier:visibility(v435 and v46[v434].yaw:get() ~= "Disabled");
            if v46[v434].defensive:get() then
                v47[v434].breaklc:visibility(true);
            else
                v47[v434].breaklc:visibility(false);
            end;
            v47[v434].randomization:visibility(v46[v434].yaw:get() ~= "Disabled" and v46[v434].bodyyaw:get());
            v47[v434].mode:visibility(v46[v434].yaw:get() ~= "Disabled");
            v46[v434].delay:visibility(v46[v434].yaw:get() ~= "Disabled");
            v47[v434].delayticks:visibility(v46[v434].delay:get() >= 1);
            v47[v434].static:visibility(v46[v434].yaw:get() ~= "Disabled" and v46[v434].yaw_mode:get() == "Classic");
            v47[v434].left:visibility(v46[v434].yaw:get() ~= "Disabled" and v46[v434].yaw_mode:get() ~= "Classic");
            v47[v434].right:visibility(v46[v434].yaw:get() ~= "Disabled" and v46[v434].yaw_mode:get() ~= "Classic");
            v47[v434].modmode:visibility(v46[v434].modifier:get() ~= "Disabled");
            v47[v434].modstatic:visibility(v46[v434].modifier:get() ~= "Disabled" and v47[v434].modmode:get() == "Classic");
            v47[v434].modleft:visibility(v46[v434].modifier:get() ~= "Disabled" and v47[v434].modmode:get() ~= "Classic");
            v47[v434].modright:visibility(v46[v434].modifier:get() ~= "Disabled" and v47[v434].modmode:get() ~= "Classic");
            v47[v434].options:visibility(v46[v434].bodyyaw:get());
            v47[v434].fs:visibility(false);
            v47[v434].leftlimit:visibility(v46[v434].bodyyaw:get());
            v47[v434].rightlimit:visibility(v46[v434].bodyyaw:get());
            v47[v434].dselect:visibility(v46[v434].defensive:get());
            v47[v434].pitch:visibility(v46[v434].defensive:get() and v47[v434].dselect:get("Pitch"));
            v47[v434].pitch_random1:visibility(v46[v434].defensive:get() and v47[v434].dselect:get("Pitch") and v47[v434].pitch:get() == "Random");
            v47[v434].pitch_random2:visibility(v46[v434].defensive:get() and v47[v434].dselect:get("Pitch") and v47[v434].pitch:get() == "Random");
            v47[v434].pitch_custom1:visibility(v46[v434].defensive:get() and v47[v434].dselect:get("Pitch") and v47[v434].pitch:get() == "Custom");
            v47[v434].pitch_custom2:visibility(v46[v434].defensive:get() and v47[v434].dselect:get("Pitch") and v47[v434].pitch:get() == "Custom");
            v47[v434].yaw:visibility(v46[v434].defensive:get() and v47[v434].dselect:get("Yaw"));
            v47[v434].yaw_random1:visibility(v46[v434].defensive:get() and v47[v434].dselect:get("Yaw") and v47[v434].yaw:get() == "Random");
            v47[v434].yaw_random2:visibility(v46[v434].defensive:get() and v47[v434].dselect:get("Yaw") and v47[v434].yaw:get() == "Random");
            v47[v434].yaw_spin_speed:visibility(v46[v434].defensive:get() and v47[v434].dselect:get("Yaw") and v47[v434].yaw:get() == "Spin");
            v47[v434].yaw_custom1:visibility(v46[v434].defensive:get() and v47[v434].dselect:get("Yaw") and v47[v434].yaw:get() == "Custom");
            v47[v434].yaw_custom2:visibility(v46[v434].defensive:get() and v47[v434].dselect:get("Yaw") and v47[v434].yaw:get() == "Custom");
        end;
    end;
    set_callback = function()
        -- upvalues: v44 (ref), v46 (ref), v47 (ref)
        for _, v437 in pairs(v44) do
            v437:set_callback(visibility);
        end;
        for v438, _ in pairs(v46) do
            for _, v441 in pairs(v46[v438]) do
                v441:set_callback(visibility);
            end;
        end;
        for v442, _ in pairs(v47) do
            for _, v445 in pairs(v47[v442]) do
                v445:set_callback(visibility);
            end;
        end;
    end;
    visibility();
    set_callback();
end;
builder();
v385 = l_ffi_0.typeof(" \n        struct { \n            int64_t unknownField, steamID; \n            char playerName[128], steamIDString[20], friendsName[128], padding[0x10]; \n            unsigned long steamIDLong; \n            bool isFakePlayer, isHLTV; \n            unsigned int customFiles[4]; \n            unsigned char filesDownloaded; \n        } \n    ");
local v446 = l_ffi_0.cast("uintptr_t**", utils.opcode_scan("engine.dll", "A1 ? ? ? ? 0F 28 C1 F3 0F 5C 80 ? ? ? ? F3 0F 11 45 ? A1 ? ? ? ? 56 85 C0 75 04 33 F6 EB 26 80 78 14 00 74 F6 8B 4D 08 33 D2 E8 ? ? ? ? 8B F0 85 F6", 1));
local v447 = utils.get_vfunc(11, l_ffi_0.typeof("$*(__thiscall*)(void*, int, int*)", v385));
local v448 = {
    [1] = "^^Stell^^::.[Pro_Game_Xom9k]", 
    [2] = "\208\161\209\130\208\190\209\143\208\186 \208\191\209\139\209\133\209\130\209\131\208\189", 
    [3] = "\208\151\208\178\208\190\208\189\208\190\208\186 \208\189\208\176 \209\131\209\128\208\190\208\186", 
    [4] = "\209\129\209\130\209\131\208\180\208\181\208\189\209\130", 
    [5] = "\208\163\209\130\209\128\208\181\208\189\208\189\208\184\208\185 \208\189\208\176\208\188\208\176\208\183 \208\191\208\190\208\180 \208\186\208\176\208\189\209\131\208\189 \208\189\208\190\208\178\208\190\208\179\208\190 \208\179\208\190\208\180\208\176", 
    [6] = "\208\169\208\181\208\186\208\190\209\130\208\189\208\190\208\181 \209\130\208\181\209\128\208\181\208\177\208\190\208\189\209\140\208\186\208\176\208\189\209\140\208\181", 
    [7] = "\208\160\208\176\208\188\208\190\208\189\209\139 \208\190\209\130 \209\129\208\181\209\128\208\181\208\179\208\184", 
    [8] = "BalinShprot", 
    [9] = "SAILOR MOON \208\160\208\158\208\145\208\149\208\160\208\162 \208\161 \208\144\208\160\208\145\208\163\208\151\208\158\208\156", 
    [10] = "soldier (\209\129\208\190\208\187\208\180\208\176\209\130)", 
    [11] = "\209\134\209\131\209\132\208\176\208\189\208\183\209\142 \209\132\208\176\208\188\208\181\209\128\208\179\208\181 (\209\133\208\178\209\133)", 
    [12] = "\208\166\208\184\209\130\209\128\209\131\209\129 \208\190\209\130 \208\183\209\131\208\180\208\176", 
    [13] = "\209\133\209\129\208\176\209\142 \208\178\208\178 \209\129 \208\191\208\181\209\128\208\178\208\190\208\185 \208\191\209\131", 
    [14] = "\209\130\209\131\208\191\208\190\208\185 \209\131\209\128\208\190\208\180", 
    [15] = "\209\143 \208\178\209\139\208\181\208\183\208\182\208\176\209\142 \208\189\208\190\209\129\208\190\208\191\209\139\209\128\208\186\208\184", 
    [16] = "\208\154\208\176\208\188\208\177\208\176\208\187\208\176 \208\178 \208\178\208\176\208\189\208\189\208\181", 
    [17] = "cocki \209\143\208\186\208\184", 
    [18] = "\240\159\133\188*\240\159\133\176\239\184\143*\240\159\134\133*\240\159\133\180*\240\159\134\129*\240\159\133\184*\240\159\133\178*\240\159\133\186", 
    [19] = "\208\162\208\181\208\187\208\181\209\132\208\190\208\189\208\189\209\139\208\185 \209\136\208\189\209\131\209\128", 
    [20] = "\196\153\206\178\195\163\197\130 \200\155\195\189\195\164 \226\136\154 \197\153\195\184\197\163", 
    [21] = "\240\157\144\141\240\157\144\154\240\157\144\128\240\157\144\162\240\157\144\171\240\157\144\140\240\157\144\154\240\157\144\177", 
    [22] = "3Jlou_\208\151AdrOT", 
    [23] = "\208\176\208\188\209\129\209\130\208\181\209\128\208\180\208\176\208\188 \208\179\208\184\208\187\209\140\208\179\208\190\208\189\208\176", 
    [24] = "\209\136\208\184\208\187\208\190 \208\189\208\176 \208\188\209\139\208\187\208\190", 
    [25] = "GoGiMan777", 
    [26] = "\208\177\209\131\208\187\209\140\209\130\208\176\208\183\208\176\209\128", 
    [27] = "VLAD_\208\159\208\163\208\161\208\162\208\158\208\153", 
    [28] = "4\208\181 \208\178 Xy\209\1437y", 
    [29] = "SANCHEZJ X FIPP", 
    [30] = "\208\157\208\158\208\146\208\171\208\153 \208\160\208\149\208\159\208\152\208\160"
};
do
    local l_v446_0, l_v447_0, l_v448_0 = v446, v447, v448;
    local function _()
        -- upvalues: l_v446_0 (ref), l_ffi_0 (ref), l_v447_0 (ref)
        local v452 = entity.get_local_player();
        if not v452 then
            return nil;
        else
            local v453 = l_v446_0[0][0];
            local v454 = l_ffi_0.cast("void***", v453 + 21184)[0];
            local v455 = l_v447_0(v454, v452:get_index() - 1, nil);
            if v455 then
                return l_ffi_0.string(v455[0].playerName);
            else
                return nil;
            end;
        end;
    end;
    local function v462(v457)
        -- upvalues: l_v446_0 (ref), l_ffi_0 (ref), l_v447_0 (ref)
        if not v457 or #v457 == 0 then
            return;
        else
            local v458 = entity.get_local_player();
            if not v458 then
                return;
            else
                local v459 = l_v446_0[0][0];
                local v460 = l_ffi_0.cast("void***", v459 + 21184)[0];
                local v461 = l_v447_0(v460, v458:get_index() - 1, nil);
                if v461 then
                    l_ffi_0.copy(v461[0].playerName, v457, #v457 + 1);
                end;
                return;
            end;
        end;
    end;
    local function v463()
        -- upvalues: l_v448_0 (ref)
        return l_v448_0[math.random(#l_v448_0)];
    end;
    local function v465()
        -- upvalues: v43 (ref), v462 (ref)
        local v464 = v43.misc.clientname.input:get():sub(0, 32);
        v43.misc.clientname.input:set(v464);
        if not v43.misc.clientname.button:get() or #v464 == 0 then
            return;
        else
            v462(v464);
            return;
        end;
    end;
    local function v467()
        -- upvalues: v43 (ref), v463 (ref), v462 (ref)
        if v43.misc.clientname.generator:get() then
            local v466 = v463();
            v43.misc.clientname.input:set(v466);
            v462(v466);
        end;
    end;
    v43.misc.clientname.button:set_callback(v465);
    v43.misc.clientname.generator:set_callback(v467);
    v81("net_update_start", function()
        -- upvalues: v465 (ref), v467 (ref)
        v465();
        v467();
    end);
    v81("net_update_end", function()
        -- upvalues: v465 (ref), v467 (ref)
        v465();
        v467();
    end);
end;
v385 = function(v468)
    -- upvalues: v43 (ref), v46 (ref), v41 (ref)
    local v469 = entity.get_local_player();
    if v469 == nil or not v469:is_alive() then
        return;
    else
        local l_m_fFlags_0 = v469.m_fFlags;
        local v471 = bit.band(l_m_fFlags_0, bit.lshift(1, 0)) == 0;
        local v472 = bit.band(l_m_fFlags_0, bit.lshift(1, 1)) ~= 0;
        if v43.antiaim.fs:get() then
            local v473;
            if v468 then
                v473 = v46[9].enable:get() and 9 or 1;
            else
                v473 = 9;
            end;
            return v473;
        elseif v471 and v472 then
            local v474;
            if v468 then
                v474 = v46[8].enable:get() and 8 or 1;
            else
                v474 = 8;
            end;
            return v474;
        elseif v471 then
            local v475;
            if v468 then
                v475 = v46[7].enable:get() and 7 or 1;
            else
                v475 = 7;
            end;
            return v475;
        elseif v469.m_vecVelocity:length2d() > 5 and v472 then
            local v476;
            if v468 then
                v476 = v46[6].enable:get() and 6 or 1;
            else
                v476 = 6;
            end;
            return v476;
        elseif v469.m_vecVelocity:length2d() < 5 and v472 then
            local v477;
            if v468 then
                v477 = v46[5].enable:get() and 5 or 1;
            else
                v477 = 5;
            end;
            return v477;
        elseif v469.m_vecVelocity:length2d() > 5 and v41.sw:get() then
            local v478;
            if v468 then
                v478 = v46[4].enable:get() and 4 or 1;
            else
                v478 = 4;
            end;
            return v478;
        elseif v469.m_vecVelocity:length2d() > 5 then
            local v479;
            if v468 then
                v479 = v46[3].enable:get() and 3 or 1;
            else
                v479 = 3;
            end;
            return v479;
        else
            local v480;
            if v468 then
                v480 = v46[2].enable:get() and 2 or 1;
            else
                v480 = 2;
            end;
            return v480;
        end;
    end;
end;
v446 = nil;
v446 = {
    sides = {}, 
    delay = {}
};
v446.calculate = function(v481, v482, v483)
    -- upvalues: v446 (ref)
    if not v446.sides[v481] then
        v446.sides[v481] = 0;
    end;
    if not v446.delay[v481] then
        v446.delay[v481] = 0;
    end;
    if globals.choked_commands == 0 then
        v446.delay[v481] = v446.delay[v481] + 1;
        if v446.delay[v481] > v483 - 1 then
            v446.delay[v481] = 0;
            v446.sides[v481] = v446.sides[v481] + 1;
            if v446.sides[v481] > #v482 then
                v446.sides[v481] = 1;
            end;
        end;
    end;
    return v482[v446.sides[v481]];
end;
v447 = {
    Forward = 180, 
    Disabled = 0, 
    Right = 90, 
    Left = -90
};
v448 = function()
    -- upvalues: v41 (ref), v43 (ref), v50 (ref), v385 (ref), v46 (ref), v446 (ref), v47 (ref)
    local v484 = entity.get_local_player();
    if v484 == nil or not v484:is_alive() then
        return;
    else
        v41.fs:override(v43.antiaim.fs:get());
        v41.fss:override(v43.antiaim.fs.fss:get());
        v41.fsb:override(v43.antiaim.fs.fsb:get());
        local _ = false;
        v50.cond = v385(false);
        v50.cond2 = v385(false);
        v41.base:override(v43.antiaim.conditions.base:get());
        v41.pitch:override(v43.antiaim.conditions.pitch:get());
        v41.backstab:override(v43.antiaim.backstab:get(3));
        v41.modifier:override("Disabled");
        local v486 = 0;
        local v487 = false;
        local v488 = v484:get_player_weapon();
        local v489 = v488:get_classname();
        if v43.antiaim.disablers:get() and v43.antiaim.disablers:get() and entity.get_game_rules().m_bWarmupPeriod then
            v41.pitch:override("Disabled");
            v41.modifier:override("Spin");
            v41.modoffset:override(360);
            v41.options:override("");
            v41.leftlimit:override(60);
            v41.rightlimit:override(60);
            v41.bodyyawfs:override("Off");
            rage.antiaim:inverter(false);
        end;
        if v43.antiaim.safe:get() and v43.antiaim.safe.weapons:get() and v488 ~= nil and v50.cond2 == 8 then
            if entity.get_threat() ~= nil and (entity.get_threat():get_origin() - v484:get_origin()):length2dsqr() > 1000000 then
                v486 = v43.antiaim.safe.weapons:get(1) and 15 or 0;
            end;
            if v489 == "CKnife" then
                v486 = v43.antiaim.safe.weapons:get(2) and 15 or 0;
            elseif v489 == "CWeaponTaser" then
                v486 = v43.antiaim.safe.weapons:get(3) and 15 or 0;
            end;
            if v486 == 15 then
                v487 = true;
            end;
        end;
        if v46[v50.cond].modifier:get() == "Disabled" then
            v50.invert = v446.calculate("invert_disabled_" .. v50.cond, {
                [1] = true, 
                [2] = false
            }, v46[v50.cond].delay:get());
            v50.yaw = 0;
        elseif v46[v50.cond].modifier:get() == "Center" then
            v50.invert = v446.calculate("invert_center_" .. v50.cond, {
                [1] = true, 
                [2] = false
            }, v46[v50.cond].delay:get());
            v50.yaw = v47[v50.cond].modmode:get() == "Classic" and (not v50.invert and -v47[v50.cond].modstatic:get() or v47[v50.cond].modstatic:get()) or v50.invert and -v47[v50.cond].modright:get() or v47[v50.cond].modleft:get();
        elseif v46[v50.cond].modifier:get() == "Offset" then
            v50.invert = v446.calculate("invert_offset_" .. v50.cond, {
                [1] = true, 
                [2] = false
            }, v46[v50.cond].delay:get());
            local l_v50_0 = v50;
            local v491;
            if v47[v50.cond].modmode:get() == "Classic" then
                if not v50.invert then
                    v491 = 0;
                    goto label1 --[[  true, true  ]];
                else
                    v491 = v47[v50.cond].modstatic:get();
                    if v491 then
                        goto label1;
                    end;
                end;
            end;
            v491 = not v50.invert and 0 or v47[v50.cond].modleft:get();
            ::label1::;
            l_v50_0.yaw = v491;
        elseif v46[v50.cond].modifier:get() == "Random" then
            v50.invert = v446.calculate("invert_random_" .. v50.cond, {
                [1] = true, 
                [2] = false
            }, v46[v50.cond].delay:get());
            v50.yaw = v47[v50.cond].modmode:get() == "Classic" and math.random(-v47[v50.cond].modstatic:get(), v47[v50.cond].modstatic:get()) or math.random(-v47[v50.cond].modright:get(), v47[v50.cond].modleft:get());
        elseif v46[v50.cond].modifier:get() == "3-Way" then
            v50.invert = v446.calculate("invert_3-way_" .. v50.cond, {
                [1] = true, 
                [2] = false, 
                [3] = true
            }, v46[v50.cond].delay:get());
            v50.yaw = v446.calculate("3way_" .. v50.cond, v47[v50.cond].modmode:get() == "Classic" and {
                nil, 
                0, 
                [1] = -v47[v50.cond].modstatic:get(), 
                v47[v50.cond].modstatic:get()
            } or {
                nil, 
                0, 
                [1] = v47[v50.cond].modleft:get(), 
                v47[v50.cond].modright:get()
            }, v46[v50.cond].delay:get());
        elseif v46[v50.cond].modifier:get() == "5-Way" then
            v50.invert = v446.calculate("invert_5-way_" .. v50.cond, {
                [1] = true, 
                [2] = false, 
                [3] = true
            }, v46[v50.cond].delay:get());
            v50.yaw = v446.calculate("5way_" .. v50.cond, v47[v50.cond].modmode:get() == "Classic" and {
                nil, 
                nil, 
                0, 
                [1] = -v47[v50.cond].modstatic:get(), 
                [2] = -v47[v50.cond].modstatic:get() * 0.5, 
                v47[v50.cond].modstatic:get() * 0.5, 
                v47[v50.cond].modstatic:get()
            } or {
                nil, 
                nil, 
                0, 
                [1] = v47[v50.cond].modleft:get(), 
                [2] = v47[v50.cond].modleft:get() * 0.5, 
                v47[v50.cond].modright:get() * 0.5, 
                v47[v50.cond].modright:get()
            }, v46[v50.cond].delay:get());
        end;
        v50.add = v46[v50.cond].yaw_mode:get() == "Classic" and v47[v50.cond].static:get() or v50.invert and v47[v50.cond].right:get() or v47[v50.cond].left:get();
        v41.yaw:override(v46[v50.cond].yaw:get());
        v41.yawoffset:override((v487 and 0 or v50.yaw / 2 + v50.add) + v486 + yaw_base_degree());
        v41.bodyyaw:override(v46[v50.cond].bodyyaw:get());
        local l_inverter_0 = v41.inverter;
        local l_l_inverter_0_0 = l_inverter_0;
        l_inverter_0 = l_inverter_0.override;
        local v494;
        if v47[v50.cond].options:get("Jitter") and not v487 and not v50.invert then
            v494 = true;
        else
            v494 = false;
        end;
        l_inverter_0(l_l_inverter_0_0, v494);
        v41.leftlimit:override(v47[v50.cond].leftlimit:get());
        v41.rightlimit:override(v47[v50.cond].rightlimit:get());
        v446.delay[name]:override(v446.delay[name] > 0 and utils.random_int(v446.delay[name] - v446.delay[name] / 14 * v446.delay[name], v446.delay[name]) or v446.delay[name]);
        v41.leftlimit:override(v47[v50.cond].randomization:get() > 0 and utils.random_int(v47[v50.cond].leftlimit:get() - v47[v50.cond].randomization:get() / 100 * v47[v50.cond].leftlimit:get(), v47[v50.cond].leftlimit:get()) or v47[v50.cond].leftlimit:get());
        v41.rightlimit:override(v47[v50.cond].randomization:get() > 0 and utils.random_int(v47[v50.cond].rightlimit:get() - v47[v50.cond].randomization:get() / 100 * v47[v50.cond].rightlimit:get(), v47[v50.cond].rightlimit:get()) or v47[v50.cond].rightlimit:get());
        v41.options:override({
            [1] = v47[v50.cond].options:get("Avoid Overlap") and "Avoid Overlap" or "", 
            [2] = v47[v50.cond].options:get("Randomize Jitter") and "Randomize Jitter" or "", 
            [3] = v47[v50.cond].options:get("Anti Bruteforce") and "Anti Bruteforce" or ""
        });
        v41.bodyyawfs:override(v47[v50.cond].fs:get());
        v41.dtlag:override(v47[v50.cond].breaklc:get() and "Always on" or nil);
        v41.hslag:override(v47[v50.cond].breaklc:get() and "Break lc" or nil);
        if v46[v50.cond].defensive:get() and not v487 then
            v41.hidden:set(true);
            if v47[v50.cond].dselect:get(1) then
                l_inverter_0 = v47[v50.cond].pitch:get();
                if l_inverter_0 == "Disabled" then
                    rage.antiaim:override_hidden_pitch(0);
                elseif l_inverter_0 == "Down" then
                    rage.antiaim:override_hidden_pitch(89);
                elseif l_inverter_0 == "Up" then
                    rage.antiaim:override_hidden_pitch(-89);
                elseif l_inverter_0 == "Random" then
                    rage.antiaim:override_hidden_pitch(math.random(v47[v50.cond].pitch_random1:get(), v47[v50.cond].pitch_random2:get()));
                elseif l_inverter_0 == "Custom" then
                    rage.antiaim:override_hidden_pitch(not rage.antiaim:inverter() and v47[v50.cond].pitch_custom1:get() or v47[v50.cond].pitch_custom2:get());
                end;
            end;
            if v47[v50.cond].dselect:get(2) then
                l_inverter_0 = v47[v50.cond].yaw:get();
                if l_inverter_0 == "Sideways" then
                    rage.antiaim:override_hidden_yaw_offset(not rage.antiaim:inverter() and -120 or 120);
                elseif l_inverter_0 == "Forward" then
                    rage.antiaim:override_hidden_yaw_offset(-90);
                elseif l_inverter_0 == "Spin" then
                    yawadd = yawadd >= 180 and -90 or yawadd + v47[v50.cond].yaw_spin_speed:get();
                    rage.antiaim:override_hidden_yaw_offset(yawadd);
                elseif l_inverter_0 == "Random" then
                    rage.antiaim:override_hidden_yaw_offset(math.random(v47[v50.cond].yaw_random1:get(), v47[v50.cond].yaw_random2:get()));
                elseif l_inverter_0 == "Custom" then
                    rage.antiaim:override_hidden_yaw_offset(not rage.antiaim:inverter() and v47[v50.cond].yaw_custom1:get() or v47[v50.cond].yaw_custom2:get());
                end;
            end;
        else
            v41.hidden:set(false);
        end;
        return;
    end;
end;
local function _(v495)
    if not (foreground_window ~= nil or hovered_window ~= nil) then
        return;
    else
        v495.in_attack = false;
        v495.in_attack2 = false;
        return;
    end;
end;
local v497 = "superior";
local v498 = {};
functions = {};
anim_tbl = v498;
easing_table = l_smoothy_0.new(anim_tbl);
functions.animated_text = function(v499, v500, v501, v502, v503, v504, v505, v506)
    -- upvalues: l_smoothy_0 (ref)
    anim_tbl[v499] = anim_tbl[v499] or 0;
    easing_table = l_smoothy_0.new(anim_tbl);
    local v507 = render.measure_text(v503, nil, v506);
    local v508 = easing_table(0.08, {
        [v499] = v500 and vector(0, 8, 0) or v507
    })[v499];
    local v509 = v501 and vector(v502.x - v507.x + v508.x * 2, v502.y - v508.y) or vector(v502.x, v502.y - v508.y);
    render.push_clip_rect(v509, vector(v502.x + v507.x - v508.x / 1.95, v502.y + v508.y * 2), true);
    render.text(v503, vector(v502.x + (v501 and 0 or v508.x), v502.y), v504, v505, v506);
    render.pop_clip_rect();
end;
v498 = {
    handle = function()
        -- upvalues: l_mtools_0 (ref), v41 (ref), v43 (ref)
        local v510 = entity.get_local_player();
        if not v510 then
            return;
        else
            local v511 = v510:get_player_weapon();
            if v511 == nil then
                return;
            else
                local l_weapon_name_0 = v511:get_weapon_info().weapon_name;
                local _ = v511:get_weapon_info().weapon_type;
                local l_console_name_0 = v511:get_weapon_info().console_name;
                l_mtools_0.AntiAims.Condition:Update();
                is_scout = l_weapon_name_0 == "weapon_ssg08";
                is_awp = l_weapon_name_0 == "weapon_awp";
                is_scar = l_weapon_name_0 == "weapon_scar20";
                is_g3sg1 = l_weapon_name_0 == "weapon_g3sg1";
                is_revolver = l_console_name_0 == "weapon_revolver";
                if v510.m_bIsScoped or not l_mtools_0.AntiAims.Condition:GetDev("Air") then
                    v41.hc_find:override();
                end;
                if v43.misc.hitchance:get() and v43.misc.hitchance.inair_hc:get() ~= 0 then
                    for v515, _ in pairs({
                        [1] = is_scout, 
                        [2] = is_awp, 
                        [3] = is_scar, 
                        [4] = is_g3sg1, 
                        [5] = is_revolver, 
                        [6] = not is_scout and not is_awp and not is_scar and not is_g3sg1 and not is_revolver
                    }) do
                        if v43.misc.hitchance.enable_ssg:get() and v43.misc.hitchance.inair_hc:get(v515) and is_scout and l_mtools_0.AntiAims.Condition:GetDev("Air") then
                            v41.hc_find:override(v43.misc.hitchance.ssg08_chance:get());
                        end;
                        if v43.misc.hitchance.enable_awp:get() and v43.misc.hitchance.inair_hc:get(v515) and is_awp and l_mtools_0.AntiAims.Condition:GetDev("Air") then
                            v41.hc_find:override(v43.misc.hitchance.awp_chance:get());
                        end;
                        if v43.misc.hitchance.enable_at:get() and v43.misc.hitchance.inair_hc:get(v515) and (is_scar or is_g3sg1) and l_mtools_0.AntiAims.Condition:GetDev("Air") then
                            v41.hc_find:override(v43.misc.hitchance.atsniper_chance:get());
                        end;
                        if v43.misc.hitchance.enable_r8:get() and v43.misc.hitchance.inair_hc:get(v515) and is_revolver and l_mtools_0.AntiAims.Condition:GetDev("Air") then
                            v41.hc_find:override(v43.misc.hitchance.revolver_chance:get());
                        end;
                    end;
                end;
                if v43.misc.hitchance:get() and v43.misc.hitchance.inair_hc:get() ~= 0 then
                    for v517, _ in pairs({
                        [1] = is_scout, 
                        [2] = is_awp, 
                        [3] = is_scar, 
                        [4] = is_g3sg1, 
                        [5] = not is_scout and not is_awp and not is_scar and not is_g3sg1
                    }) do
                        if v43.misc.hitchance.enable_ssg:get() and v43.misc.hitchance.inair_hc:get(v517) and is_scout and not v510.m_bIsScoped then
                            v41.hc_find:override(v43.misc.hitchance.ssg08_nzchance:get());
                        end;
                        if v43.misc.hitchance.enable_awp:get() and v43.misc.hitchance.inair_hc:get(v517) and is_awp and not v510.m_bIsScoped then
                            v41.hc_find:override(v43.misc.hitchance.awp_nzchance:get());
                        end;
                        if v43.misc.hitchance.enable_at:get() and v43.misc.hitchance.inair_hc:get(v517) and (is_scar or is_g3sg1) and not v510.m_bIsScoped then
                            v41.hc_find:override(v43.misc.hitchance.atsniper_nzchance:get());
                        end;
                    end;
                end;
                return;
            end;
        end;
    end
};
events.createmove:set(function()
    -- upvalues: v498 (ref)
    v498.handle();
end);
events.shutdown:set(function()
    -- upvalues: v41 (ref)
    v41.hc_find:override();
end);
local function v520(v519)
    -- upvalues: v43 (ref), v41 (ref)
    if v43.antiaim.flick:get() == 0 then
        return;
    elseif rage.exploit:get() < 1 then
        return;
    else
        if v43.antiaim.flick:get() then
            rage.antiaim:inverter(false);
            v41.yawoffset:override(5);
            v41.modifier:override("Random");
            v41.modoffset:override(5);
            v41.bodyyaw:override(true);
            v41.options:override("");
            v41.leftlimit:override(42);
            v41.rightlimit:override(42);
            v41.fs:override(false);
            v41.hidden:override(true);
            rage.antiaim:override_hidden_pitch(89);
            rage.antiaim:override_hidden_yaw_offset(-70);
            rage.antiaim:override_hidden_yaw_offset(-90);
            v41.hslag:override("Break LC");
            v41.dtlag:override("Always On");
            v519.force_defensive = v519.command_number % 7 == 0;
        else
            v41.hidden:override(false);
            rage.antiaim:override_hidden_pitch(0);
            rage.antiaim:override_hidden_yaw_offset(0);
            v41.hslag:override(nil);
            v41.dtlag:override(nil);
        end;
        return;
    end;
end;
events.createmove:set(function(v521)
    -- upvalues: v520 (ref)
    v520(v521);
end);
get_hitboxed = function()
    local v522 = {};
    local v523 = entity.get_player_resource();
    for v524 = 1, globals.max_players do
        local v525 = entity.get(v524);
        if v525 and v523.m_bConnected[v524] and v525:is_enemy() and v525:is_dormant() then
            table.insert(v522, v525);
        end;
    end;
    return v522;
end;
handle_dormant_aimbot = function(v526)
    -- upvalues: v43 (ref), v41 (ref)
    if v43.misc.bars.select:get() ~= 2 then
        return;
    else
        v41.dormant:override(false);
        local v527 = lp:get_player_weapon();
        if not v527 then
            return;
        else
            local v528 = v527:get_weapon_info();
            local v529 = v527:get_inaccuracy();
            if not v528 or not v529 then
                return;
            else
                local l_tickcount_0 = globals.tickcount;
                local v531 = lp:get_eye_position();
                local l_current_0 = lp:get_simulation_time().current;
                local v533 = bit.band(lp.m_fFlags, bit.lshift(1, 0)) ~= 0;
                if l_tickcount_0 < round_started or v526.in_jump and not v533 then
                    return;
                elseif not is_weapon_gun(v528.weapon_type) or v527.m_iClip1 <= 0 then
                    return false;
                else
                    local v534 = get_hitboxed();
                    local v535 = v43.misc.bars.reg:get();
                    local v536 = nil;
                    target_index = l_tickcount_0 % #v534 ~= 0 and target_index + 1 or 1;
                    v536 = v534[target_index];
                    if not v536 then
                        return;
                    else
                        local v537 = v536:get_bbox();
                        local v538 = v536:get_origin();
                        local l_m_flDuckAmount_0 = v536.m_flDuckAmount;
                        local v540 = v43.misc.bars.minimum_damage:get() == -1 and v41.minimum_damage:get() or v43.misc.bars.minimum_damage:get();
                        if v540 > 100 then
                            v540 = v540 - 100 + v536.m_iHealth;
                        end;
                        local v541 = {};
                        for _, v543 in ipairs(hitbox_points) do
                            local l_vec_0 = v543.vec;
                            local l_hitbox_0 = v543.hitbox;
                            if l_hitbox_0 == "Head" then
                                l_vec_0 = l_vec_0 - vector(0, 0, 10 * l_m_flDuckAmount_0);
                            elseif l_hitbox_0 == "Chest" then
                                l_vec_0 = l_vec_0 - vector(0, 0, 4 * l_m_flDuckAmount_0);
                            end;
                            if #v535 == 0 or contains(v535, l_hitbox_0) then
                                table.insert(v541, {
                                    vec = l_vec_0, 
                                    scale = v543.scale, 
                                    hitbox = l_hitbox_0
                                });
                            end;
                        end;
                        if not (v528.is_revolver and not (v527.m_flNextPrimaryAttack >= l_current_0) or math.max(lp.m_flNextAttack, v527.m_flNextPrimaryAttack, v527.m_flNextSecondaryAttack) < l_current_0) then
                            return;
                        else
                            local v546 = nil;
                            local v547 = nil;
                            for _, v549 in ipairs(v541) do
                                local v550 = create_multipoints(v531, v538 + v549.vec, v549.scale);
                                for _, v552 in ipairs(v550) do
                                    local l_vec_1 = v552.vec;
                                    local v555, v556 = trace_bullet(lp, v531, l_vec_1, function(v554)
                                        -- upvalues: v536 (ref)
                                        return v554 == v536;
                                    end);
                                    if (not v556 or not v556:is_visible()) and v540 < v555 then
                                        local l_l_vec_1_0 = l_vec_1;
                                        v547 = v555;
                                        v546 = l_l_vec_1_0;
                                        l_l_vec_1_0 = v536;
                                        local l_hitbox_1 = v549.hitbox;
                                        local l_v555_0 = v555;
                                        local l_text_0 = v552.text;
                                        aim_accuracy = v537.alpha;
                                        aim_point = l_text_0;
                                        aim_damage = l_v555_0;
                                        aim_hitbox = l_hitbox_1;
                                        aim_target = l_l_vec_1_0;
                                        break;
                                    end;
                                end;
                                if v546 then
                                    break;
                                end;
                            end;
                            if v546 and v529 < 0.01 then
                                v526.view_angles = v531:to(v546):angles();
                                v526.in_attack = true;
                                is_shot = true;
                            end;
                            v41.dormant:override();
                            return;
                        end;
                    end;
                end;
            end;
        end;
    end;
end;
events.createmove:set(handle_dormant_aimbot);
events.render:set(function()
    -- upvalues: v43 (ref)
    if v43.misc.bars.adaptive:get() then
        v43.misc.bars.reg:override("Head", "Chest", "Stomach", "Legs");
        v43.misc.bars.minimum_damage:override(12);
    else
        v43.misc.bars.reg:override(nil);
        v43.misc.bars.minimum_damage:override(nil);
    end;
end);
arrows = function()
    -- upvalues: v43 (ref), v181 (ref), v73 (ref), v74 (ref), v72 (ref)
    if not v43.misc.manual_arrows:get() then
        return;
    else
        local v561 = entity.get_local_player();
        local v562 = v43.antiaim.manual:get();
        local v563 = v43.misc.manual_arrows.always_on:get();
        if not v561 or not v561:is_alive() then
            return;
        elseif not v43.misc.manual_arrows.dynamic:get() then
            local v564 = v181.new("x_offset_manuals", v43.misc.manual_arrows.slider_arrows_x:get(), 6);
            local v565 = v181.new("y_offset_manuals", math.clamp(v43.misc.manual_arrows.slider_arrows_y:get() or 0, -70, 70), 6);
            local v566 = v181.new("arrows_visibility", (not (not v563 and v562 ~= "Left") or v562 == "Right") and 255 or 0, 12);
            if v566 == 0 then
                return;
            else
                local v567 = v43.misc.manual_arrows.styled:get();
                local v568 = v43.misc.manual_arrows.color_arrows:get();
                local v569 = v181.new("left_arrow_alpha", v562 == "Left" and 255 or 0, 3);
                local v570 = v181.new("right_arrow_alpha", v562 == "Right" and 255 or 0, 3);
                local v571 = color(v568.r, v568.g, v568.b, v569);
                local v572 = color(v568.r, v568.g, v568.b, v570);
                local v573 = color(128, 128, 128, v566);
                if v562 ~= "Left" or not v571 then
                    v571 = v573;
                end;
                if v562 ~= "Right" or not v572 then
                    v572 = v573;
                end;
                local l_x_3 = render.screen_size().x;
                local l_y_3 = render.screen_size().y;
                local v576 = vector(l_x_3 / 2 - 47 - v564, l_y_3 / 2 + v565);
                local v577 = vector(l_x_3 / 2 + 47 + v564, l_y_3 / 2 + v565);
                if v567 == 1 then
                    render.texture(v73, v576, v571);
                    render.texture(v74, v577, v572);
                elseif v567 == 2 then
                    render.text(v72, v576, v571, "c", "\226\157\176");
                    render.text(v72, v577, v572, "c", "\226\157\177");
                end;
                return;
            end;
        else
            local v578 = v561:get_anim_state();
            local v579 = v578 and v578.velocity_length_xy or 0;
            local v580 = v43.misc.manual_arrows.slider_dynamic:get();
            local v581 = 35;
            local v582 = 0;
            if v580 <= v579 then
                v582 = math.min(v581, v579 * (v581 / 300));
            end;
            local v583 = v181.new("x_offset_manuals", v43.misc.manual_arrows.slider_arrows_x:get() + v582, 24);
            local v584 = v181.new("y_offset_manuals", math.clamp(v43.misc.manual_arrows.slider_arrows_y:get() or 0, -70, 70), 6);
            local v585 = v181.new("arrows_visibility", (not (not v563 and v562 ~= "Left") or v562 == "Right") and 255 or 0, 12);
            if v585 == 0 then
                return;
            else
                local v586 = v43.misc.manual_arrows.styled:get();
                local v587 = v43.misc.manual_arrows.color_arrows:get();
                local v588 = v181.new("left_arrow_alpha", v562 == "Left" and 255 or 0, 3);
                local v589 = v181.new("right_arrow_alpha", v562 == "Right" and 255 or 0, 3);
                local v590 = color(v587.r, v587.g, v587.b, v588);
                local v591 = color(v587.r, v587.g, v587.b, v589);
                local v592 = color(128, 128, 128, v585);
                if v562 ~= "Left" or not v590 then
                    v590 = v592;
                end;
                if v562 ~= "Right" or not v591 then
                    v591 = v592;
                end;
                local l_x_4 = render.screen_size().x;
                local l_y_4 = render.screen_size().y;
                local v595 = vector(l_x_4 / 2 - 47 - v583, l_y_4 / 2 + v584);
                local v596 = vector(l_x_4 / 2 + 47 + v583, l_y_4 / 2 + v584);
                if v586 == 1 then
                    render.texture(v73, v595, v590);
                    render.texture(v74, v596, v591);
                elseif v586 == 2 then
                    render.text(v72, v595, v590, "c", "\226\157\176");
                    render.text(v72, v596, v591, "c", "\226\157\177");
                end;
                return;
            end;
        end;
    end;
end;
events.render:set(function()
    arrows();
end);
local function _()
    local v597 = entity.get_local_player();
    if not v597 then
        return false, nil;
    elseif not globals.is_in_game and not globals.is_connected then
        return false, nil;
    elseif not v597:is_alive() then
        return false, nil;
    else
        return true, v597;
    end;
end;
local _ = {
    CSmokeGrenade = true, 
    CIncendiaryGrenade = true, 
    CWeaponTaser = true, 
    CKnife = true, 
    CHEGrenade = true, 
    CDecoyGrenade = true, 
    CFlashbang = true, 
    CSensorGrenade = true, 
    CC4 = true, 
    CMolotovGrenade = true
};
local v600 = {
    toggle = panorama.FriendsListAPI.ToggleMute, 
    is_muted = panorama.FriendsListAPI.IsSelectedPlayerMuted
};
local v601 = {};
local function v609()
    -- upvalues: v43 (ref), v600 (ref), v601 (ref)
    if not v43.misc.silenced:get() then
        return;
    else
        local v602 = v43.misc.silenced.selection:get();
        local v603 = entity.get_players(false, true);
        local v604 = entity.get_local_player();
        for _, v606 in ipairs(v603) do
            if v606 ~= v604 then
                local l_steamid64_0 = v606:get_player_info().steamid64;
                local v608 = v600.is_muted(l_steamid64_0);
                if v602 == 1 then
                    if v608 then
                        v600.toggle(l_steamid64_0);
                    end;
                    v601 = {};
                elseif v602 == 2 then
                    if v606:is_enemy() and not v608 then
                        v600.toggle(l_steamid64_0);
                        v601[l_steamid64_0] = true;
                    elseif not v606:is_enemy() and v608 then
                        v600.toggle(l_steamid64_0);
                        v601[l_steamid64_0] = nil;
                    end;
                elseif v602 == 3 then
                    if not v606:is_enemy() and not v608 then
                        v600.toggle(l_steamid64_0);
                        v601[l_steamid64_0] = true;
                    elseif v606:is_enemy() and v608 then
                        v600.toggle(l_steamid64_0);
                        v601[l_steamid64_0] = nil;
                    end;
                elseif v602 == 4 and not v608 then
                    v600.toggle(l_steamid64_0);
                    v601[l_steamid64_0] = true;
                end;
            end;
        end;
        return;
    end;
end;
events.render:set(function()
    -- upvalues: v609 (ref)
    v609();
end);
render_bar = function(v610, v611, v612)
    -- upvalues: v40 (ref)
    if v611 == nil or v611 == "" or v611 == " " then
        return;
    else
        render.gradient(vector(13, v40.fullscreen.y - 350 - v612 * 37), vector(13 + render.measure_text(v40.calibri, nil, v611).x / 2, v40.fullscreen.y - 345 - v612 * 37 + 28), color(0, 0, 0, 0), color(0, 0, 0, 60), color(0, 0, 0, 0), color(0, 0, 0, 60), 0);
        render.gradient(vector(13 + render.measure_text(v40.calibri, nil, v611).x, v40.fullscreen.y - 350 - v612 * 37), vector(13 + render.measure_text(v40.calibri, nil, v611).x / 2, v40.fullscreen.y - 345 - v612 * 37 + 28), color(0, 0, 0, 0), color(0, 0, 0, 60), color(0, 0, 0, 0), color(0, 0, 0, 60), 0);
        render.text(v40.calibri, vector(20, v40.fullscreen.y - 343 - v612 * 37), color(0, 0, 0, 150), nil, v611);
        render.text(v40.calibri, vector(19, v40.fullscreen.y - 345 - v612 * 37), v610, nil, v611);
        return;
    end;
end;
if v43.misc.grenades.nades:get(2) and lp ~= nil and lp:is_alive() then
    local v613 = lp:get_player_weapon();
    if v613 ~= nil then
        local v614 = v613:get_weapon_index();
        if v614 ~= nil and (v614 == 43 or v614 == 44 or v614 == 45 or v614 == 46 or v614 == 47 or v614 == 48) then
            v41.weaponact:override({
                [1] = "", 
                [2] = v41.weaponact:get("Auto Pistols") and "Auto Pistols" or ""
            });
        end;
    end;
end;
local v615 = {
    scopebool = l_smoothy_0.new(1), 
    dt = l_smoothy_0.new(1), 
    hs = l_smoothy_0.new(1), 
    pa = l_smoothy_0.new(1), 
    fs = l_smoothy_0.new(1), 
    ready = l_smoothy_0.new(1)
};
hasbit = function(v616, v617)
    return v617 <= v616 % (v617 + v617);
end;
local v618 = vector();
events.createmove:set(function(v619)
    -- upvalues: v43 (ref), v19 (ref), v618 (ref)
    local v620 = entity.get_local_player();
    if not v43.antiaim.func_edge_test:get() or v43.antiaim.func_edge_test.edge_on_fd:get() and not v19.fd:get() then
        return;
    elseif hasbit(v619.buttons, 1) then
        return;
    else
        if v619.choked_commands == 0 then
            v618 = v620:get_eye_position();
        end;
        local v621 = {};
        local v622 = {};
        local v623 = {};
        for v624 = 0, 355, 5 do
            local v625 = math.normalize_yaw(v624);
            local v626 = v618 + vector():angles(0, v625) * 96;
            local v627 = utils.trace_line(v618, v626, v620, 33570827, 1);
            if v627 and v627.fraction < 0.3 then
                table.insert(v621, v625);
                table.insert(v622, v618:dist(v627.end_pos));
                table.insert(v623, {
                    vecTraceEnd = v626, 
                    flYaw = v625
                });
            end;
        end;
        if #v622 == 0 or v622[1] > 30 then
            return;
        else
            table.sort(v623, function(v628, v629)
                return v628.flYaw < v629.flYaw;
            end);
            table.remove(v623, #v623);
            if #v623 >= 3 then
                local v630 = v623[1].vecTraceEnd:lerp(v623[#v623].vecTraceEnd, 0.5);
                local v631 = (v618 - v630):angles();
                if v631 then
                    local l_y_5 = render.camera_angles().y;
                    local l_y_6 = v631.y;
                    local v634 = math.normalize_yaw(l_y_6 - l_y_5);
                    if math.abs(v634) < 90 then
                        l_y_5 = math.normalize_yaw(l_y_6 + 180);
                    end;
                    v619.view_angles.y = math.normalize_yaw(l_y_6 + v634 + 180);
                    v619.send_packet = true;
                end;
            end;
            return;
        end;
    end;
end);
transparency = function()
    -- upvalues: v43 (ref)
    local v635 = entity.get_local_player();
    if not v635 or not v635:is_alive() then
        return;
    else
        return v43.misc.scope.keeptransparency:get() and (v635.m_bIsScoped or v635.m_bResumeZoom) and 100 or 255;
    end;
end;
local v636 = {
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
events.aim_ack:set(function(v637)
    -- upvalues: v43 (ref), v636 (ref)
    if v43.misc.aimbotlogs.pos:get(1) then
        local _ = entity.get_local_player();
        local v639 = entity.get(v637.target);
        local _ = v637.damage;
        local l_wanted_damage_0 = v637.wanted_damage;
        local v642 = v636[v637.wanted_hitgroup];
        local l_hitchance_0 = v637.hitchance;
        local l_state_0 = v637.state;
        local l_state_1 = v637.state;
        local l_backtrack_0 = v637.backtrack;
        if not v639 then
            return;
        elseif v639 == nil then
            return;
        else
            local l_m_iHealth_1 = v639.m_iHealth;
            if l_state_1 == "spread" then
                l_state_1 = "\aFEEA7DFFspread";
            end;
            if l_state_1 == "prediction error" then
                l_state_1 = "\aFEEA7DFFprediction error";
            end;
            if l_state_1 == "correction" then
                l_state_1 = "\aFF5959FFresolver";
            end;
            if l_state_1 == "misprediction" then
                l_state_1 = "\aFEEA7DFFmisprediction";
            end;
            if l_state_1 == "lagcomp failure" then
                l_state_1 = "\aFF5959FFlagcomp failure";
            end;
            if l_state_0 == "correction" then
                l_state_0 = "resolver";
            end;
            local v648 = v636[v637.hitgroup];
            if l_state_0 == nil then
                print_dev(("Registered \a85a6ffFF%s \aDEFAULThb: \a85a6ffFF%s/\aDEFAULT%s \aDEFAULTdmg: \a85a6ffFF%d\aDEFAULT/%d \aDEFAULTbt: \a85a6ffFF%s\aDEFAULT hc: \a85a6ffFF%s\aDEFAULT rhp: \a85a6ffFF%s \aDEFAULT"):format(v639:get_name(), v648, v642, v637.damage, l_wanted_damage_0, l_backtrack_0, l_hitchance_0, l_m_iHealth_1));
                print_raw(("\a85baffffgloriosa \aDEFAULT\239\189\158 \aD5D5D5FFRegistered \a85a6ffFF%s \aDEFAULThb: \a85a6ffFF%s/\aDEFAULT%s \aDEFAULTdmg: \a85a6ffFF%d\aDEFAULT/%d \aDEFAULTbt: \a85a6ffFF%s\aDEFAULT hc: \a85a6ffFF%s\aDEFAULT rhp: \a85a6ffFF%s \aDEFAULT"):format(v639:get_name(), v648, v642, v637.damage, l_wanted_damage_0, l_backtrack_0, l_hitchance_0, l_m_iHealth_1));
            else
                print_dev(("Missed shot in \a\aFF3434C8%s \aDEFAULThb: \a\aFF3434C8%s \aDEFAULThb: \a\aFF3434C8" .. l_state_0 .. ""):format(v639:get_name(), v642));
                print_raw(("\a85baffffgloriosa \aDEFAULT\239\189\158 \aD5D5D5FFMissed shot in \a\aFF3434C8%s \aDEFAULThb: \a\aFF3434C8%s \aDEFAULThb: \a\aFF3434C8" .. l_state_0 .. ""):format(v639:get_name(), v642));
            end;
        end;
    end;
end);
events.player_hurt:set(function(v649)
    -- upvalues: v43 (ref)
    if v43.misc.aimbotlogs.pos:get("Hurt") then
        local v650 = entity.get_local_player();
        local v651 = entity.get(v649.attacker, true);
        local l_weapon_0 = v649.weapon;
        local v653 = "Hit";
        if l_weapon_0 == "hegrenade" then
            v653 = "Naded";
        end;
        if l_weapon_0 == "inferno" then
            v653 = "Burned";
        end;
        if l_weapon_0 == "knife" then
            v653 = "Knifed";
        end;
        if (l_weapon_0 == "hegrenade" or l_weapon_0 == "inferno" or l_weapon_0 == "knife") and v650 == v651 then
            local v654 = entity.get(v649.userid, true);
            print_raw(("\a85baffffgloriosa \aDEFAULT\239\189\158 \aD5D5D5FF" .. v653 .. " \a85a6ffFF%s \aDEFAULTfor \a85a6ffFF%d \aDEFAULTdamage (\a85a6ffFF%d \aDEFAULThp remaining)"):format(v654:get_name(), v649.dmg_health, v649.health));
            print_dev(("" .. v653 .. " \a85a6ffFF%s \aDEFAULTfor \a85a6ffFF%d \aDEFAULTdamage (\a85a6ffFF%d \aDEFAULThp remaining)"):format(v654:get_name(), v649.dmg_health, v649.health));
        end;
    end;
end);
local v655 = render.screen_size();
local v656 = {
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
local v657 = {};
local _ = 1;
local _ = {
    hegrenade = "Naded", 
    inferno = "Burned", 
    knife = "Knifed"
};
events.player_hurt:set(function(v660)
    -- upvalues: v43 (ref), v657 (ref)
    if v43.misc.aimbotlogs.pos:get("Hurt") then
        local v661 = entity.get_local_player();
        local v662 = entity.get(v660.attacker, true);
        local l_weapon_1 = v660.weapon;
        local v664 = "Hit";
        if l_weapon_1 == "hegrenade" then
            v664 = "Naded";
        end;
        if l_weapon_1 == "inferno" then
            v664 = "Burned";
        end;
        if l_weapon_1 == "knife" then
            v664 = "Knifed";
        end;
        if (l_weapon_1 == "hegrenade" or l_weapon_1 == "inferno" or l_weapon_1 == "knife") and v661 == v662 then
            local v665 = entity.get(v660.userid, true);
            v657[#v657 + 1] = {
                [1] = nil, 
                [2] = nil, 
                [3] = 0, 
                [1] = ("\aFFFFFFC8" .. v664 .. " \aFFFFFFFF%s \aFFFFFFC8for \aFFFFFFFF%s \aFFFFFFC8damage (\aFFFFFFFF%s \aFFFFFFC8health remaining)"):format(v665:get_name(), v660.dmg_health, v660.health), 
                [2] = globals.tickcount + 250
            };
        end;
    end;
end);
local function _(v666, v667)
    -- upvalues: v657 (ref)
    local v668 = v667 and color(0, 255, 0, 255) or color(255, 0, 0, 255);
    local v669 = {
        [1] = nil, 
        [2] = nil, 
        [3] = 0, 
        [1] = v666, 
        [2] = globals.tickcount + 250, 
        [4] = v668
    };
    table.insert(v657, v669);
end;
local v671 = {};
local v672 = false;
local function v675(v673, v674)
    -- upvalues: v43 (ref), v671 (ref), v181 (ref)
    if not v43.misc.aimbotlogs:get() then
        return;
    else
        if #v671 >= 3 then
            table.remove(v671, 1);
        end;
        table.insert(v671, {
            y_offset = 0, 
            message = v673, 
            type = v674, 
            time = globals.tickcount + 80, 
            alpha = v181.new("alpha_" .. #v671, 0, 12)
        });
        return;
    end;
end;
local v676 = {
    hegrenade = "Naded", 
    inferno = "Burned", 
    knife = "Knifed"
};
events.player_hurt:set(function(v677)
    -- upvalues: v675 (ref), v676 (ref), v672 (ref)
    if entity.get_local_player() == entity.get(v677.attacker, true) then
        local v678 = entity.get(v677.userid, true);
        v675(string.format("\a808080FF%s \aFFFFFFFF%s \a808080FFfor \aFFFFFFFF%d \a808080FFdamage", v676[v677.weapon] or "Hit", v678:get_name(), v677.dmg_health), "Hit");
        v672 = true;
    end;
end);
events.aim_ack:set(function(v679)
    -- upvalues: v672 (ref), v43 (ref), v675 (ref), v656 (ref)
    if v672 then
        v672 = false;
    elseif v43.misc.aimbotlogs.pos:get("Screen") then
        v675(string.format("\a808080FFMissed \aFFFFFFFF%s \a808080FFin the \aFFFFFFFF%s \a808080FFdue to \aFFFFFFFF%s", v679.target:get_name(), v656[v679.wanted_hitgroup], v679.state), "Miss");
    end;
end);
events.render:set(function()
    -- upvalues: v43 (ref), v655 (ref), v671 (ref), v181 (ref)
    local v680 = entity.get_local_player();
    if not v680 or not v680:is_alive() or not v43.misc.aimbotlogs:get() then
        return;
    else
        local v681 = v655.y / 1.3 + math.min(math.max(v43.misc.aimbotlogs.offset:get() or 0, 0), 200);
        local v682 = v43.misc.aimbotlogs.theme:get();
        local v683 = v43.misc.aimbotlogs.dot_style:get();
        local v684 = v43.misc.aimbotlogs.rainbow_color:get();
        local function v688(v685, v686)
            local v687 = globals.realtime * v685;
            return color(math.floor(127 * math.sin(v687) + 128), math.floor(127 * math.sin(v687 + 2) + 128), math.floor(127 * math.sin(v687 + 4) + 128), v686);
        end;
        for v689 = #v671, 1, -1 do
            local v690 = v671[v689];
            v690.y_offset = v681 - (v689 - 1) * 35;
            v690.alpha = v181.new("alpha_" .. v689, v690.time - globals.tickcount <= 0 and 0 or 255, 12);
            if v690.alpha <= 0.01 then
                table.remove(v671, v689);
            end;
            local l_x_5 = render.measure_text(1, nil, v690.message).x;
            local v692 = vector(v655.x / 2 + 1 - l_x_5 / 2 - 22, v690.y_offset - 14);
            local v693 = vector(v655.x / 2 + l_x_5 / 2 + 15, v690.y_offset + 14);
            local v694 = v684 and v688(3, v690.alpha) or (not (v690.type ~= "Hit" and v690.type ~= "Naded" and v690.type ~= "Burned") or v690.type == "Knifed") and color(0, 255, 0, v690.alpha) or color(255, 0, 0, v690.alpha);
            if v682 == 1 then
                render.shadow(v692, v693, color(0, 0, 0, v690.alpha * 0.3), 10, 5, 5);
                render.rect(v692, v693, color(0, 0, 0, v690.alpha * 0.6), 5);
                render.text(1, vector(v655.x / 2 + 1 - l_x_5 / 2, v690.y_offset - 7), color(255, 255, 255, v690.alpha), nil, v690.message);
                local v695 = vector(v692.x + 9, v690.y_offset - 2);
                if v683 == 1 then
                    render.shadow(v695, vector(v692.x + 12, v690.y_offset + 1), v694, 12, 1, 1);
                    render.rect(v695, vector(v692.x + 13, v690.y_offset + 2), v694);
                elseif v683 == 2 then
                    render.shadow(v695, vector(v692.x + 13, v690.y_offset + 2), v694, 0, 0, 0);
                    render.circle(vector(v692.x + 13, v690.y_offset), v694, 2.5, 0, 1);
                end;
            else
                local v696 = v43.misc.aimbotlogs.glow_modern:get();
                render.shadow(v692, v693, color(v696.r, v696.g, v696.b, v690.alpha * 0.4), 60, 0, 10);
                render.rect(v692, v693, color(20, 20, 20, v690.alpha * 0.9), 5);
                local _ = v693.x - v692.x;
                local v698 = ui.get_icon("sparkles") .. " ";
                local v699 = "| ";
                local l_message_0 = v690.message;
                local v701 = color(255, 255, 255, v690.alpha);
                local v702 = color(255, 255, 255, v690.alpha * 0.5);
                local v703 = color(255, 255, 255, v690.alpha);
                local _ = render.measure_text(1, nil, v698 .. v699 .. l_message_0).x;
                render.text(1, vector(v692.x + 6.6, v690.y_offset - 7), v701, nil, v698);
                render.text(1, vector(v692.x + 6.6 + render.measure_text(1, nil, v698).x, v690.y_offset - 7), v702, nil, v699);
                render.text(1, vector(v692.x + 6.6 + render.measure_text(1, nil, v698).x + render.measure_text(1, nil, v699).x, v690.y_offset - 7), v703, nil, l_message_0);
            end;
        end;
        return;
    end;
end);
events.round_start(function()
    -- upvalues: v671 (ref)
    v671 = {};
end);
events.player_spawned(function()
    -- upvalues: v671 (ref)
    v671 = {};
end);
local l_bomb_0 = require("neverlose/bomb");
lerpx = function(v706, v707, v708)
    return v707 * (1 - v706) + v708 * v706;
end;
local function _(v709, v710, v711, v712, v713, v714, v715)
    -- upvalues: v43 (ref)
    if not entity.get_local_player() then
        return;
    else
        local v716 = v43.misc.watermark.anim_color:get();
        local l_r_0 = v716.r;
        local l_g_0 = v716.g;
        local l_b_0 = v716.b;
        local v720 = v43.misc.watermark.anim_style:get();
        local v721 = v43.misc.watermark.anim_glow:get();
        local v722 = v720 == 1 and color(l_r_0, l_g_0, l_b_0, v715) or color(0, 0, 0, v715 / 2);
        local v723 = v720 == 1 and 2 or 20;
        render.rect(vector(v709, v710), vector(v709 + v711 + 3, v710 + v723), v722, 4);
        if v721 then
            render.shadow(vector(v709, v710), vector(v709 + v711 + 3, v710 + v723), v722, 20, 0, 0);
        end;
        if v720 == 1 then
            render.rect(vector(v709, v710 + 2), vector(v709 + v711 + 3, v710 + 19), color(0, 0, 0, v715 / 4), 0);
        end;
        local v724 = 3;
        local v725 = v709 + (v711 - render.measure_text(1, "", v713).x + 9) / 2 - 5;
        local v726 = v710 + v712 / 2 - v724 / 2 + 3;
        render.shadow(vector(v725, v726), vector(v725 + v724, v726 + v724), color(0, 255, 0, 150), 15, 0, 0);
        render.rect(vector(v725, v726), vector(v725 + v724, v726 + v724), v714);
        local v727 = v725 + 7;
        local v728 = v710 + v712 / 2 - render.measure_text(1, "", v713).y / 2 + 1;
        render.text(1, vector(v727, v728), color(255, 255, 255, v715), "", v713);
        return;
    end;
end;
display_watermark = function()
    -- upvalues: v43 (ref), l_mtools_0 (ref), l_bomb_0 (ref), v181 (ref), v92 (ref), v72 (ref), l_pui_0 (ref)
    if not v43.misc.watermark:get() or v43.misc.watermark.anim_style:get() ~= 2 then
        return;
    else
        local _ = entity.get_local_player();
        local l_x_7 = render.screen_size().x;
        local _ = render.screen_size().y;
        local v733 = v43.misc.watermark.anim_color:get();
        local v734 = string.format("%s MS", l_mtools_0.Client.GetPing());
        local v735 = string.format("%s FPS", l_mtools_0.Client.GetFPS());
        local v736 = common.get_username();
        local v737 = "gloriosa";
        local v738 = l_bomb_0.site or "?";
        local v739 = 0;
        local v740 = "Site: " .. v738 .. "";
        if l_bomb_0.state == true then
            v739 = l_bomb_0.c4time;
            v740 = string.format("Site: %s / %.1fs", v738, v739);
        elseif l_bomb_0.state == false and l_bomb_0.plant_percentage == 0 then
            v740 = string.format("Site: %s", v738);
        elseif l_bomb_0.state == false and l_bomb_0.plant_percentage > 0 then
            v739 = (1 - l_bomb_0.plant_percentage) * 3;
            v740 = string.format("Site: %s / %.1fs", v738, v739);
        elseif l_bomb_0.defusing then
            v739 = l_bomb_0.defuse_time_left;
            v740 = string.format("Site: %s / %.1fs", v738, v739);
        end;
        local v741 = v43.misc.watermark.selecting:get("PING");
        local v742 = v43.misc.watermark.selecting:get("FPS");
        local v743 = v43.misc.watermark.selecting:get("USERNAME");
        local v744 = v43.misc.watermark.selecting:get("BOMB SITE");
        local v745 = 0;
        local v746 = 45;
        if v741 then
            v745 = v745 + v181.new("ping_width", render.measure_text(1, nil, v734).x + v746, 12, 0);
        else
            v745 = v745 + v181.new("ping_width", 0, 12);
        end;
        if v742 then
            v745 = v745 + v181.new("fps_width", render.measure_text(1, nil, v735).x + v746, 12, 0);
        else
            v745 = v745 + v181.new("fps_width", 0, 12);
        end;
        if v743 then
            v745 = v745 + v181.new("username_width", render.measure_text(1, nil, v736).x + v746, 12, 0);
        else
            v745 = v745 + v181.new("username_width", 0, 12);
        end;
        if v744 then
            v745 = v745 + v181.new("bombsite_width", render.measure_text(1, nil, v740).x + v746, 12, 0);
        else
            v745 = v745 + v181.new("bombsite_width", 0, 12);
        end;
        local l_x_8 = render.measure_text(v92, nil, v737).x;
        local v748 = l_x_7 - v745 - l_x_8 - 25;
        render.rect(vector(v748, 5), vector(v748 + v745 + l_x_8 + 20, 30), color(0, 0, 0, 150), 5);
        local v749 = v748 + 10;
        if v741 then
            render.text(1, vector(v749 + 21, 11), color(), nil, v734);
            render.text(v72, vector(v749, 9), color(v733.r, v733.g, v733.b, 255), nil, l_pui_0.string("\f<wifi>"));
            v749 = v749 + v181._list.ping_width;
            render.text(1, vector(v749 - v746 / 2 + 8, 10), color(50, 50, 50, 255), nil, "|");
        end;
        if v742 then
            render.text(v72, vector(v749, 10), color(v733.r, v733.g, v733.b, 255), nil, l_pui_0.string("\f<frame>"));
            render.text(1, vector(v749 + 21, 11), color(), nil, v735);
            v749 = v749 + v181._list.fps_width;
            render.text(1, vector(v749 - v746 / 2 + 8, 10), color(50, 50, 50, 255), nil, "|");
        end;
        if v743 then
            render.text(v72, vector(v749, 9), color(v733.r, v733.g, v733.b, 255), nil, l_pui_0.string("\f<user>"));
            render.text(1, vector(v749 + 21, 11), color(), nil, v736);
            v749 = v749 + v181._list.username_width;
            render.text(1, vector(v749 - v746 / 2 + 8, 10), color(50, 50, 50, 255), nil, "|");
        end;
        if v744 then
            render.text(v72, vector(v749, 9), color(v733.r, v733.g, v733.b, 255), nil, l_pui_0.string("\f<bomb>"));
            render.text(1, vector(v749 + 21, 11), color(), nil, v740);
            v749 = v749 + v181._list.bombsite_width;
            render.text(1, vector(v749 - v746 / 2 + 8, 10), color(50, 50, 50, 255), nil, "|");
        end;
        render.text(v92, vector(v748 + v745 + 10, 7), color(v733.r, v733.g, v733.b, 255), nil, v737);
        return;
    end;
end;
events.render:set(display_watermark);
hurt = function(v750)
    -- upvalues: v43 (ref)
    local v751 = entity.get_local_player();
    local v752 = entity.get(v750.attacker, true);
    local v753 = entity.get(v750.userid, true);
    local l_weapon_2 = v750.weapon;
    local l_health_0 = v750.health;
    local v756 = v43.misc.aimbotlogs.color:get():to_hex();
    local v757 = "DEFAULT";
    local v758 = ({
        hegrenade = l_health_0 > 0 and "Explode" or "Exploded", 
        inferno = l_health_0 > 0 and "Burn" or "Burned", 
        knife = l_health_0 > 0 and "Hit" or "Knifed"
    })[l_weapon_2];
    if v753 == v751 or v752 ~= v751 then
        return;
    elseif v758 == nil then
        return;
    else
        print_raw(("\a%sgloriosa\a%s ~ " .. v758 .. " \a%s%s\a%s for \a%s%s\a%s (\a%s%s\a%s remaining)"):format(v756, v757, v756, v753:get_name(), v757, v756, v750.dmg_health, v757, v756, v750.health, v757));
        return;
    end;
end;
local v759 = {
    [1] = "\208\144\209\133\208\144\209\133\208\144\209\133\208\144\209\133\208\144\209\133\208\144 \209\130\208\181 \208\178 \209\128\208\190\209\130\209\143\208\186\209\131 \208\189\208\176\208\191\208\184\209\133\208\176\208\187\208\184 \209\133\209\131\209\143\208\186\209\131", 
    [2] = "\208\181\208\177\208\176\209\130\209\140 \209\130\209\143 \208\190\209\130\208\191\209\128\208\176\208\178\208\184\208\187 \208\189\208\176 \208\184\208\189\208\178\208\176\208\187\208\184\208\180\208\189\209\131\209\142 \208\186\208\190\208\187\209\143\209\129\208\186\209\131", 
    [3] = "\208\177\208\187\209\143 \208\177\208\190\208\188\208\182 \208\189\208\176 \208\186\208\190\208\187\208\181\208\189\208\186\208\176\209\133 \208\191\209\128\208\190\209\129\208\184 \208\191\209\128\208\190\209\137\208\181\208\189\208\184\209\143", 
    [4] = "\209\130\209\139 \208\180\208\190\208\187\208\177\208\176\208\181\208\177 \208\177\208\181\208\183 \208\189\208\184\208\182\208\189\208\181\208\179\208\190 \209\128\209\143\208\180\208\176 \208\183\209\131\208\177\208\190\208\178 \209\128\208\190\208\180\208\184\208\187\209\129\209\143", 
    [5] = "\209\133\208\187\208\190\208\191\209\135\208\184\208\186 \209\130\208\184 \208\178\208\188\209\150\209\148\209\136 \209\130\209\150\208\187\209\140\208\186\208\184 \209\129\208\188\208\190\208\186\209\130\208\176\209\130\208\184 \209\133\209\131\209\151 \208\191\209\150\208\180 \209\129\209\130\208\190\208\187\208\190\208\188", 
    [6] = "\208\182\208\181\209\129\209\130\209\140 \208\191\208\176\209\128\208\189\208\184 \208\186\208\176\208\186 \208\190\208\189 \209\129\208\190\209\129\209\145\209\130 \208\176\209\133\208\176\209\133\208\176\209\133", 
    [7] = "\209\135\208\181 \208\191\208\184\208\180\208\190\209\128\208\190\208\186 \208\184\208\179\209\128\208\176\208\181\209\136\209\140 \208\177\208\181\208\183 gloriosa \208\178 2024? ", 
    [8] = "\209\129\208\188\208\176\208\186\209\131\208\185 \208\188\208\190\208\184 \209\143\208\185\208\186\208\184 \208\191\208\190\208\186\208\176 \209\143 \208\181\208\177\209\131 \209\130\208\178\208\190\209\142 \208\188\208\176\209\130\209\131\209\133\209\131 \208\189\208\176 \208\179\209\128\208\190\208\177\208\181 \208\188\208\190\208\179\208\184\208\187\208\181 \209\130\208\178\208\190\208\181\208\179\208\190 \208\177\208\176\209\130\209\140\208\186\208\176", 
    [9] = "\208\157\209\131 \208\178\209\129\208\190 \208\187\208\190\208\177\209\141\208\185\209\136\208\181\208\189 \208\191\209\128\208\190\209\129\209\130\209\128\208\181\208\187\208\181\208\185\209\136\208\181\208\189 \209\143  \209\130\209\141\208\177\209\141 \209\129\208\180\208\181\208\187\208\181\208\185\209\136\208\189", 
    [10] = "\194\183\217\160\226\151\143\226\128\162\219\169\219\158\219\169\208\158\209\130\208\148\209\139\208\165\208\176\208\153\208\157\209\131\208\145\209\143\208\160\208\176\219\169\219\158\219\169\226\128\162\226\151\143\217\160\194\183", 
    [11] = "\226\149\173\226\136\169\226\149\174( \226\154\134 \202\150 \226\154\134)\226\149\173\226\136\169\226\149\174 \208\148\208\190\208\159\209\128\209\139\208\147\208\176\208\187\209\129\209\143\208\148\209\128\208\163\208\182\208\190\208\167\208\181\208\154", 
    [12] = "\208\189\208\190\209\131\208\189\208\181\208\185\208\188 \208\181\208\177\208\187\208\184\208\178\209\139\208\185 \209\129\209\138\208\181\208\177\208\184 \209\129 \209\129\208\181\209\128\208\178\208\176\208\186\208\176 \208\191\208\190\208\186\208\176 \209\143 \209\130\208\178\208\190\209\142 \208\188\208\176\209\130\209\131\209\133\209\131 \208\178 \208\179\209\128\208\190\208\177 \208\189\208\181 \208\183\208\176\208\187\208\190\208\182\208\184\208\187", 
    [13] = "\208\180\208\181\209\128\208\181\208\178\208\181\208\189\209\129\208\186\208\184\208\185 \208\190\208\177\209\129\208\190\209\129", 
    [14] = "\208\161\208\156\208\144\208\154\208\163\208\153 \208\156\208\158\208\153 \208\165\208\163\208\153 \208\159\208\152\208\148\208\158\208\160\208\156\208\158\208\162\208\152\208\157\208\144", 
    [15] = "\208\188\208\176\209\128\208\184\208\189\209\131\208\185\209\129\209\143 \208\178 \208\188\208\190\208\181\208\185 \209\129\208\191\208\181\209\128\208\188\208\181", 
    [16] = "\208\180\208\181\208\185\209\129\209\130\208\178\208\184\209\130\208\181\208\187\209\140\208\189\208\190 \208\190\209\132\208\186 \208\189\208\181 \208\189\208\176\209\129\208\176\209\129\209\139\208\178\208\176\208\185 \209\135\208\188\208\190\209\136\208\189\208\184\208\186", 
    [17] = "\209\143 \209\129\208\178\208\190\208\181\208\185 \209\133\208\176\209\128\208\183\208\184\208\188\208\190\208\185 \208\191\209\128\208\184\208\180\209\131\209\136\209\139\208\187 \209\130\208\178\208\190\209\142 \208\188\208\176\209\130\209\131\209\133\209\131 \208\191\208\184\208\180\209\128"
};
local v760 = {
    [1] = "\209\135\208\181 \208\183\208\176 \208\177\208\190\208\188\208\182\208\176\209\130\209\129\208\186\208\184\208\185 \208\186\208\190\208\189\208\189\208\181\208\186\209\130 \208\188\208\181\208\189\209\143 \209\129\209\130\208\190\208\191\208\184\209\130", 
    [2] = "\208\163 \208\156\208\149\208\157\208\175 \208\151\208\144\208\155\208\144\208\147\208\144\208\155\208\158 \208\163\208\149\208\145\208\152\208\169\208\149", 
    [3] = "\208\189\209\131 \208\188\209\128\208\176\208\183\209\140 \208\191\208\190\208\178\208\181\208\183\208\187\208\190 \209\130\208\190 \209\135\209\130\208\190 \209\133\209\129\208\189\209\131\208\187\208\176 \208\188\208\181\208\189\209\143", 
    [4] = "\208\144\209\133\208\144\208\165\208\165\208\165\208\144\208\165\208\144\209\133\208\176\209\133\208\165\208\144\208\165\208\165\208\144\208\146\208\165\208\165\209\133 \208\162\208\171 \208\167\208\149 \208\161\208\148\208\149\208\155\208\144\208\155\208\158 \208\161\208\155\208\158\208\163\208\156\208\158\208\168\208\157\208\158\208\149 \208\163\208\145\208\149\208\150\208\152\208\169\208\149", 
    [5] = "\208\186\208\186 \208\187\208\176\209\129\209\130 \209\136\208\176\208\189\209\129 \209\130\208\181\208\177\208\181 \208\180\208\176\208\187", 
    [6] = "\208\178 \208\186\208\190\208\188\208\176\208\189\208\180\208\181 \208\191\208\184\208\180\208\190\209\128\208\176\209\129 \208\189\208\181\208\188\208\190\209\137\208\189\209\139\208\185 \208\189\208\181 \208\188\208\190\208\182\208\181\209\130 \208\183\208\176\208\186\208\181\209\128\208\184\209\130\209\140", 
    [7] = "\209\130\208\184\208\188\208\188\208\181\208\185\209\130 \209\131\208\177\208\187\209\142\208\180\208\190\208\186 \209\128\209\131\208\184\208\189\208\184\209\130 \208\188\208\176\208\191\209\131", 
    [8] = "\208\159\208\158\208\159\208\160\208\171\208\147\208\157\208\163\208\167\208\152\208\154 \208\149\208\145\208\155\208\152\208\146\208\171\208\153 \208\162\208\149\208\145\208\149 \208\159\208\152\208\151\208\148\208\149\208\166 \208\146\208\149\208\151\208\149\208\162"
};
local v761 = nil;
local function v764(v762, v763)
    if v763 and v763 > 0 then
        utils.execute_after(v763, function()
            -- upvalues: v762 (ref)
            utils.console_exec("say \"" .. v762 .. "\"");
        end);
    else
        utils.console_exec("say \"" .. v762 .. "\"");
    end;
end;
local function v766()
    -- upvalues: v759 (ref), v761 (ref)
    local v765 = nil;
    repeat
        v765 = v759[utils.random_int(1, #v759)];
    until v765 ~= v761;
    v761 = v765;
    return v765;
end;
local function v772(v767)
    -- upvalues: v43 (ref), v764 (ref), v766 (ref), v760 (ref)
    if not v43.misc.trashtalk:get() then
        return;
    else
        local v768 = entity.get_local_player();
        local v769 = entity.get(v767.userid, true);
        if entity.get(v767.attacker, true) == v768 and v769 ~= v768 and v43.misc.trashtalk.selection:get(1) then
            v764("1", 0);
            local v770 = v43.misc.trashtalk.delay_timer:get();
            local v771 = v770 == 0 and 1 or v770 + 1;
            v764(v766(), v771);
        elseif v769 == v768 and v43.misc.trashtalk.selection:get(2) then
            v764(v760[utils.random_int(1, #v760)], v43.misc.trashtalk.delay_timer:get());
        end;
        return;
    end;
end;
local _ = {
    Left = 90, 
    bottom = v40.screen.x + 15, 
    Right = v40.fullscreen.x - 90
};
local _ = {
    bottom = v40.fullscreen.y - 29, 
    Left = v40.screen.y + 18, 
    Right = v40.screen.y + 18
};
local _ = {
    bottom = v40.fullscreen.y - 3.5, 
    Left = v40.screen.y + 18, 
    Right = v40.screen.y + 18
};
local _ = {
    Left = 90, 
    bottom = v40.screen.x + 2, 
    Right = v40.fullscreen.x - 90
};
local _ = {
    [1] = v40.screen.x + 2
};
local function v829()
    -- upvalues: v43 (ref), v181 (ref), l_monylinear_0 (ref), v615 (ref), v41 (ref), l_mtools_0 (ref), v19 (ref), v497 (ref), v40 (ref)
    local v778 = entity.get_local_player();
    local v779 = v43.misc.crosshair:get();
    local v780 = v43.misc.crosshair.accent_crosshair:get();
    local v781 = v43.misc.crosshair.second_crosshair:get();
    if v779 then
        if v778 == nil or not v778:is_alive() then
            return;
        else
            local v782 = v43.misc.crosshair.offset:get();
            local v783 = v181.new("y_offset_animation", v782, 6);
            local v784 = v43.misc.crosshair.font:get();
            local _ = v181.new("style_switch", v784, 0.1);
            local _ = l_monylinear_0:Animate("gloriosa", {
                color(v780.r * 1.2, v780.g * 1.2, v780.b * 1.2, 255), 
                color(v781.r * 0.8, v781.g * 0.8, v781.b * 0.8, 200)
            }, 4, 2);
            local v787 = l_monylinear_0:Animate("GLORIOSA", {
                color(v780.r * 1.2, v780.g * 1.2, v780.b * 1.2, 255), 
                color(v781.r * 0.8, v781.g * 0.8, v781.b * 0.8, 200)
            }, 4, 2);
            scopebool = v181.new("scopebool1", v778.m_bIsScoped and 1 or 0, 12);
            v615.dt(0.1, v41.dt:get() and 1 or 0);
            v615.hs(0.1, v41.hs:get() and 1 or 0);
            v615.pa(0.1, v41.pa:get() and 1 or 0);
            v615.fs(0.1, (not not v41.fs:get_override() or v41.fs:get()) and 1 or 0);
            v615.ready(0.1, rage.exploit:get() == 1 and 1 or 0);
            if v784 == "Classic" then
                return;
            elseif v784 == 1 then
                local v788 = {
                    hitchance = false, 
                    latency = false, 
                    damage = false, 
                    bodyaim = false, 
                    safepoints = false
                };
                for _, v790 in pairs(ui.get_binds()) do
                    v788[v790.name:lower():gsub(" ", "")] = v790.active;
                end;
                local v791 = render.screen_size().x / 2;
                local v792 = render.screen_size().y / 2;
                local v793 = 39;
                local v794 = 0;
                local v795 = -1;
                l_mtools_0.Animation:Register("MTools_indicators");
                local l_m_bIsScoped_0 = v778.m_bIsScoped;
                local l_x_9 = l_mtools_0.Animation:Lerp("MTools_indicators", "scoped_shift", l_m_bIsScoped_0, vector(0, 0), vector(60, 0)).x;
                do
                    local l_v794_0 = v794;
                    local function v801(v799, v800)
                        -- upvalues: l_v794_0 (ref), l_mtools_0 (ref)
                        l_v794_0 = l_v794_0 + (v800 and 13 or 0);
                        return l_mtools_0.Animation:Lerp("MTools_indicators", v799, v800, vector(0, l_v794_0), vector(0, l_v794_0));
                    end;
                    local v802 = {
                        dt = v801("doubletap_y", v19.dt:get()), 
                        hs = v801("hideshots_y", v19.hs:get()), 
                        fs = v801("freestand_y", v19.fs:get()), 
                        damage = v801("damage_y", v788.damage), 
                        fd = v801("fakeduck_y", v19.fd:get()), 
                        latency = v801("latency_y", v788.latency), 
                        hitchance = v801("hitchance_y", v788.hitchance), 
                        bodyaim = v801("bodyaim_y", v788.bodyaim), 
                        safepoints = v801("safepoints_y", v788.safepoints)
                    };
                    local v803 = math.min(math.floor(math.sin(globals.curtime % 3 * 5) * 200 + 255), 255);
                    render.text(1, vector(v791 - v793 + l_x_9, v792 + 21 + v783), color(255, 255, 255, 255), c, "gloriosa");
                    render.text(1, vector(v791 + 3 + l_x_9, v792 + 21 + v783), color(v43.misc.crosshair.classic_crosshair:get().r, v43.misc.crosshair.classic_crosshair:get().g, v43.misc.crosshair.classic_crosshair:get().b, v803), c, string.lower(v497));
                    local v804 = v792 + 22;
                    for v805, v806 in pairs(v802) do
                        local v807 = v804 + math.floor(v806.y);
                        local v808 = (l_m_bIsScoped_0 and v793 or 0) - v795;
                        functions.animated_text(v805 .. "_animation", v19[v805] and v19[v805]:get(), l_m_bIsScoped_0, vector(v791 - v808 + l_x_9, v807 + v783), 1, color(255, 255, 255, 255), nil, v805);
                    end;
                    l_mtools_0.Animation:Update("MTools_indicators", 10);
                end;
            elseif v784 == 2 then
                local v809 = 6;
                local v810 = v615.dt.value * v809;
                local v811 = math.floor(v810);
                local v812 = v41.dt:get() and rage.exploit:get() ~= 1;
                local v813 = v181.new("progress_animation", v811, 15);
                local v814 = v181.new("color_animation_r", v812 and 255 or 255, 6);
                local v815 = v181.new("color_animation_g", v812 and 0 or 255, 6);
                local v816 = v181.new("color_animation_b", v812 and 0 or 255, 6);
                local v817 = v181.new("alpha_animation", v812 and 150 or 255, 6);
                local v818 = color(v814, v815, v816, v817);
                local v819 = (v812 and string.rep("|", math.floor(v813)) or string.rep("l", math.floor(v813))) .. string.rep(" ", v809 - math.floor(v813));
                local _ = math.lerp(96, 255, v615.dt.value);
                render.text(2, vector(v40.screen.x + 38 * scopebool, v40.screen.y + 16 + v783), color(255, 255, 255, 255), "c", v787);
                render.text(2, vector(v40.screen.x + 33 * scopebool - 6, v40.screen.y + 26 + v783), color(255, 255, 255, 255 * v615.dt.value), "c", "DT+");
                render.text(2, vector(v40.screen.x + 33 * scopebool + 8, v40.screen.y + 26 + v783), v818, "c", v819);
                render.text(2, vector(v40.screen.x + 32 * scopebool, v40.screen.y + 26 + 10 * v615.dt.value + v783), color(255, 255, 255, 255 * v615.hs.value), "c", "OS-AA");
                render.text(2, vector(v40.screen.x + 26 * scopebool, v40.screen.y + 26 + 10 * v615.dt.value + 10 * v615.hs.value + v783), color(255, 255, 255, 255 * v615.pa.value), "c", "PA");
                render.text(2, vector(v40.screen.x + 26 * scopebool, v40.screen.y + 26 + 10 * v615.dt.value + 11 * v615.hs.value + 11 * v615.pa.value + v783), color(255, 255, 255, 255 * v615.fs.value), "c", "FS");
            end;
        end;
    end;
    local v821 = entity.get_local_player();
    v41.weaponact:override();
    v41.scope:override();
    local _ = render.screen_size();
    if not v43.misc.watermark:get() and not v43.misc.crosshair:get() then
        render.text(2, vector(v40.fullscreen.x / 2, v40.fullscreen.y - 10), color(255, 255, 255), "c", "GLORIOSA");
    end;
    if ui.get_alpha() > 0.1 then
        local v823 = l_monylinear_0:Animate("gloriosa.superior", {
            ui.get_style("Link Active"), 
            color(50)
        }, -2.5, 2);
        ui.sidebar(v823, ui.get_icon("sparkles"));
    end;
    if v43.misc.scope:get() and v821 ~= nil and v821:is_alive() then
        v41.scope:override("Remove All");
        v615.scopebool(0.1, v821.m_bIsScoped and 1 or 0);
        local v824 = v43.misc.scope.color:get();
        local v825 = color(v824.r, v824.g, v824.b, 255 * v615.scopebool.value);
        local v826 = color(v824.r, v824.g, v824.b, 0 * v615.scopebool.value);
        local v827 = v43.misc.scope.length:get() * v615.scopebool.value;
        local v828 = v43.misc.scope.gap:get();
        render.gradient(vector(v40.screen.x, v40.screen.y - v828 + 1), vector(v40.screen.x + 1, v40.screen.y - v828 - v827 + 1), v825, v825, v826, v826);
        render.gradient(vector(v40.screen.x, v40.screen.y + v828), vector(v40.screen.x + 1, v40.screen.y + v828 + v827), v825, v825, v826, v826);
        render.gradient(vector(v40.screen.x - v828 + 1, v40.screen.y), vector(v40.screen.x - v828 - v827 + 1, v40.screen.y + 1), v825, v826, v825, v826);
        render.gradient(vector(v40.screen.x + v828, v40.screen.y), vector(v40.screen.x + v828 + v827, v40.screen.y + 1), v825, v826, v825, v826);
    end;
end;
watermark_modern = function()
    -- upvalues: v43 (ref), v41 (ref), v40 (ref)
    local _ = entity.get_local_player();
    local v831 = v43.misc.watermark.progressive_color:get();
    v41.weaponact:override();
    v41.scope:override();
    local _ = render.screen_size();
    local v833 = v43.misc.watermark.anim_style:get();
    local v834 = v43.misc.watermark:get();
    local v835 = v43.misc.crosshair:get();
    local function v840(v836)
        local v837 = "";
        for v838 = 1, #v836 do
            local v839 = v836:sub(v838, v838);
            if math.floor(globals.realtime * 5) % #v836 == v838 - 1 then
                v837 = v837 .. v839:upper();
            else
                v837 = v837 .. v839:lower();
            end;
        end;
        return v837;
    end;
    if v834 and not v835 and v833 == 1 then
        local v841 = v840("gloriosa " .. "\aAA4A44FF[superior]");
        render.text(1, vector(v40.screen.x + 2, v40.fullscreen.y - 15), color(v831.r, v831.g, v831.b), "c", v841 .. "\n");
    end;
end;
events.render:set(function()
    watermark_modern();
end);
local l_world_to_screen_0 = render.world_to_screen;
local _ = render.rect;
local _ = render.screen_size;
local _ = nil;
local _ = entity.get_local_player;
local _ = entity.get;
local _ = table.insert;
local _ = table.remove;
local _ = render.screen_size;
local _ = math.floor;
local _ = render.line;
local v853 = false;
local v854 = 1;
local v855 = 0.25;
local v856 = 0.25;
local v857 = {};
local function v871(v858, v859, v860, v861, v862)
    local v863 = math.pi / v861;
    local v864 = {};
    for v865 = 0, v861 * 2 - 1 do
        local v866 = v865 % 2 == 0 and v860 or v860 / 2;
        local v867 = v863 * v865;
        local v868 = vector(v858 + v866 * math.cos(v867), v859 + v866 * math.sin(v867));
        table.insert(v864, v868);
    end;
    for v869 = 1, #v864 do
        local v870 = v869 % #v864 + 1;
        render.line(v864[v869], v864[v870], v862);
    end;
end;
local function v885()
    -- upvalues: v43 (ref), v857 (ref), v855 (ref), l_world_to_screen_0 (ref), v871 (ref)
    local v872 = v43.misc.hitmarker.style:get();
    if not v43.misc.hitmarker:get() or v872 ~= 1 and v872 ~= 2 then
        return;
    else
        for v873, v874 in pairs(v857) do
            if v874.FadeTime <= 0 then
                v857[v873] = nil;
            else
                v874.FadeTime = v874.FadeTime - 0.5 / v855 * globals.frametime;
                local l_Position_0 = v874.Position;
                if l_Position_0 and not v874.Reason then
                    local v876 = l_world_to_screen_0(vector(l_Position_0.x, l_Position_0.y, l_Position_0.z));
                    if v876 then
                        local l_x_10 = v876.x;
                        local l_y_8 = v876.y;
                        local v879 = 1 - v874.FadeTime;
                        local v880, v881, v882 = v43.misc.hitmarker.color_x:get():unpack();
                        if v872 == 1 then
                            render.circle(vector(l_x_10, l_y_8), color(v880, v881, v882, 255 * (1 - v879)), 5 + v879 * 10, 0, 1);
                            render.circle(vector(l_x_10, l_y_8), color(v880, v881, v882, 150 * (1 - v879)), 7 + v879 * 15, 0, 1);
                            render.circle(vector(l_x_10, l_y_8), color(v880, v881, v882, 80 * (1 - v879)), 10 + v879 * 20, 0, 1);
                        elseif v872 == 2 then
                            local v883 = 7 + v879 * 10;
                            local v884 = color(v880, v881, v882, 255 * (1 - v879));
                            v871(l_x_10, l_y_8, v883, 5, v884);
                        end;
                    end;
                end;
            end;
        end;
        return;
    end;
end;
local function v887(v886)
    -- upvalues: v857 (ref), v856 (ref)
    v857[v886.id] = {
        FadeTime = 1, 
        Position = v886.aim, 
        WaitTime = v856, 
        Reason = v886.state
    };
end;
events.render:set(function(_)
    -- upvalues: v885 (ref)
    v885();
end);
events.aim_ack:set(function(v889)
    -- upvalues: v887 (ref)
    v887(v889);
end);
events.round_start:set(function()
    -- upvalues: v857 (ref)
    v857 = {};
end);
events.player_spawned:set(function(_)
    -- upvalues: v857 (ref)
    v857 = {};
end);
events.round_start:set(function()
    -- upvalues: v853 (ref), v854 (ref), v855 (ref), v856 (ref)
    v853 = false;
    v854 = 1;
    v855 = 0.25;
    v856 = 0.25;
end);
entity.get_anim_layer = function(v891, v892)
    -- upvalues: l_ffi_0 (ref)
    return l_ffi_0.cast("c_animlayers**", l_ffi_0.cast("char*", l_ffi_0.cast("void***", v891)) + 10640)[0][v892 or 1];
end;
events.post_update_clientside_animation:set(function()
    -- upvalues: v43 (ref), v34 (ref), v41 (ref)
    if not v43.misc.animbreakers:get() then
        return;
    else
        local v893 = entity.get_local_player();
        local v894 = v893.m_vecVelocity:length();
        local l_tickcount_1 = globals.tickcount;
        local l_m_flPoseParameter_0 = v893.m_flPoseParameter;
        local l_animbreakers_0 = v43.misc.animbreakers;
        if v43.misc.animbreakers.addons:get(2) and l_tickcount_1 % 4 > 1 then
            l_animbreakers_0.air:get("Disabled");
        elseif l_animbreakers_0.air:get() == "Static" then
            l_m_flPoseParameter_0[6] = 1;
        elseif l_animbreakers_0.air:get() == "Moonwalk" and v894 > 5 then
            entity.get_anim_layer(v34(v893:get_index()), 6).m_flWeight = 1;
        end;
        if l_animbreakers_0.ground:get() == "Reversed" then
            l_m_flPoseParameter_0[0] = 1;
            v41.leg:override("Sliding");
        elseif l_animbreakers_0.ground:get() == "Moonwalk" then
            l_m_flPoseParameter_0[7] = 1;
            v41.leg:override("Walking");
        end;
        if v894 >= 3 then
            entity.get_anim_layer(v34(v893:get_index()), 12).m_flWeight = l_animbreakers_0.movelean:get() / 100;
        end;
        return;
    end;
end);
local v902 = {
    step = 1, 
    speed = 3, 
    list = {
        [1] = "", 
        [2] = "g3", 
        [3] = "gl7", 
        [4] = "glo2", 
        [5] = "glor4", 
        [6] = "glori6", 
        [7] = "glorio1", 
        [8] = "glorios9", 
        [9] = "gloriosa", 
        [10] = "g#o3iosa ", 
        [11] = "glo8io1a ", 
        [12] = "g@oriosa ", 
        [13] = "gloriosa", 
        [14] = "glorios5", 
        [15] = "glorio8", 
        [16] = "glori6", 
        [17] = "glor2", 
        [18] = "glo4", 
        [19] = "gl1", 
        [20] = "g9", 
        [21] = ""
    }, 
    run = function(v898)
        -- upvalues: v41 (ref), v43 (ref)
        local function v900()
            -- upvalues: v898 (ref), v41 (ref)
            local v899 = math.floor(globals.curtime * v898.speed + 0.5) % #v898.list + 1;
            if v899 == v898.step then
                return;
            else
                v898.step = v899;
                v41.clantag:override(false);
                common.set_clan_tag(v898.list[v899]);
                return;
            end;
        end;
        v43.misc.clantag:set_callback(function(v901)
            -- upvalues: v900 (ref)
            if v901:get(3) then
                events.net_update_end:set(v900);
            else
                events.net_update_end:unset(v900);
                common.set_clan_tag("");
            end;
        end, true);
    end
};
local function v903()
    -- upvalues: v41 (ref)
    cvar.r_aspectratio:float(0);
    cvar.viewmodel_fov:float(get_original(cvar.viewmodel_fov), true);
    cvar.viewmodel_offset_x:float(get_original(cvar.viewmodel_offset_x), true);
    cvar.viewmodel_offset_y:float(get_original(cvar.viewmodel_offset_y), true);
    cvar.viewmodel_offset_z:float(get_original(cvar.viewmodel_offset_z), true);
    common.set_clan_tag("");
    v41.clantag:override();
end;
local v904 = 0;
local function v908(v905, v906, v907)
    return v905 + (v906 - v905) * v907;
end;
events.override_view:set(function(v909)
    -- upvalues: v43 (ref), v904 (ref), v41 (ref), v908 (ref)
    if not v43.misc.scope:get() or not v43.misc.scope.anim_zoom:get() then
        v904 = v41.fov:get();
        v909.fov = v904;
        return;
    else
        local v910 = entity.get_local_player();
        if not v910 or not v910:is_alive() then
            return;
        else
            local v911 = v910:get_player_weapon();
            if not v911 then
                return;
            else
                local v912 = v41.fov:get();
                local v913;
                if v910.m_bIsScoped then
                    v913 = v911.m_zoomLevel == 2 and 45 or 30;
                else
                    v913 = 0;
                end;
                v912 = v912 - v913;
                v904 = v908(v904, v912, 0.05);
                v909.fov = v904;
                return;
            end;
        end;
    end;
end);
l_pui_0.setup({
    [1] = v43.antiaim, 
    [2] = v46, 
    [3] = v47, 
    [4] = v43.misc
});
export = v81("presets.export", v37, function()
    -- upvalues: v43 (ref), l_pui_0 (ref), l_base64_0 (ref), l_clipboard_0 (ref), v52 (ref), v39 (ref)
    if v43.info.presets_list:get() ~= 1 then
        local v914 = l_pui_0.save();
        local v915 = presets_data.name[v43.info.presets_list:get()];
        local v916 = "superior - " .. l_base64_0.encode(json.stringify({
            name = v915, 
            file = v914
        }));
        l_clipboard_0.set(v916);
        v52 = globals.realtime;
        v43.info.presets_success_export:name(v39 .. "Successfully exported: \r" .. v915);
    end;
end);
import = v81("presets.import", v37, function()
    -- upvalues: l_clipboard_0 (ref), l_base64_0 (ref), v89 (ref), v53 (ref), v43 (ref), v51 (ref), v39 (ref)
    local v917 = l_clipboard_0.get();
    if v917:sub(1, 10) == "superior -" then
        local v918 = v917:sub(11);
        local _, l_result_1 = pcall(function()
            -- upvalues: l_base64_0 (ref), v918 (ref)
            return json.parse(l_base64_0.decode(v918));
        end);
        if v89(presets_data.name, l_result_1.name) then
            v53 = globals.realtime;
            v43.info.presets_success_exist:name("\affdbe3ff\f<triangle-exclamation>  This preset already exists: \r" .. l_result_1.name);
            return;
        else
            table.insert(presets_data.name, l_result_1.name);
            table.insert(presets_data.file, l_result_1.file);
            v43.info.presets_list:update(presets_data.name);
            files.write("nl/gloriosa/settings.txt", l_base64_0.encode(json.stringify(presets_data)));
            v51 = globals.realtime;
            v43.info.presets_success_import:name(v39 .. "Successfully imported: \r" .. l_result_1.name);
            --[[ close >= 1 ]]
        end;
    end;
end);
create = v81("presets.save", v37, function()
    -- upvalues: v43 (ref), l_pui_0 (ref), v89 (ref), l_base64_0 (ref), v53 (ref)
    local v921 = v43.info.presets_name:get();
    local v922 = l_pui_0.save();
    if not v89(presets_data.name, v921) and v43.info.presets_name:get() ~= "" then
        table.insert(presets_data.name, v921);
        table.insert(presets_data.file, v922);
        files.write("nl/gloriosa/settings.txt", l_base64_0.encode(json.stringify(presets_data)));
        v43.info.presets_list:update(presets_data.name);
    elseif v89(presets_data.name, v921) then
        v53 = globals.realtime;
        v43.info.presets_success_exist:name("\a853838ff\f<triangle-exclamation>  This preset already exist: \r" .. v921);
    end;
end);
save = v81("presets.save", v37, function()
    -- upvalues: v43 (ref), l_pui_0 (ref), l_base64_0 (ref)
    if v43.info.presets_list:get() ~= 1 then
        presets_data.file[v43.info.presets_list:get()] = l_pui_0.save();
        files.write("nl/gloriosa/settings.txt", l_base64_0.encode(json.stringify(presets_data)));
    end;
end);
remove = v81("presets.remove", v37, function()
    -- upvalues: v43 (ref), l_base64_0 (ref)
    if v43.info.presets_list:get() ~= 1 then
        table.remove(presets_data.name, v43.info.presets_list:get());
        table.remove(presets_data.file, v43.info.presets_list:get());
        files.write("nl/gloriosa/settings.txt", l_base64_0.encode(json.stringify(presets_data)));
        v43.info.presets_list:update(presets_data.name);
    end;
end);
aa = v81("presets.aa", v37, function()
    -- upvalues: v43 (ref), l_pui_0 (ref), l_base64_0 (ref)
    if v43.info.presets_list:get() ~= 1 then
        l_pui_0.load(presets_data.file[v43.info.presets_list:get()], 1);
        l_pui_0.load(presets_data.file[v43.info.presets_list:get()], 2);
        l_pui_0.load(presets_data.file[v43.info.presets_list:get()], 3);
        l_pui_0.load(presets_data.file[v43.info.presets_list:get()], 4);
    else
        local v923 = json.parse(l_base64_0.decode("eyJmaWxlIjpbeyJiYWNrc3RhYiI6dHJ1ZSwiY29uZGl0aW9ucyI6IkFpci1jcm91Y2hpbmciLCJkaXNhYmxlcnMiOmZhbHNlLCJlbmFibGUiOjIuMCwiZnMiOnsiaG90a2V5IjpmYWxzZX0sImZ1bmNfZWRnZV90ZXN0IjpmYWxzZSwibGFkZGVyX3NlbGVjdCI6dHJ1ZSwibWFudWFsIjp7ImhvdGtleSI6IkRpc2FibGVkIn0sInNhZmUiOmZhbHNlLCJ+Y29uZGl0aW9ucyI6eyJiYXNlIjoiTG9jYWwgVmlldyIsInBpdGNoIjoiRG93biJ9LCJ+ZnVuY19lZGdlX3Rlc3QiOnsiZWRnZV9vbl9mZCI6ZmFsc2V9LCJ+bGFkZGVyX3NlbGVjdCI6eyJzZWxlY3Rpb24iOlsiQXNjZW5kaW5nIiwiRGVzY2VuZGluZyIsIn4iXX0sIn5zYWZlIjp7IndlYXBvbnMiOlsifiJdfX0sW3siYm9keXlhdyI6ZmFsc2UsImRlZmVuc2l2ZSI6ZmFsc2UsIm1vZGlmaWVyIjoiRGlzYWJsZWQiLCJ5YXciOiJCYWNrd2FyZCIsInlhd19tb2RlIjoiQ2xhc3NpYyJ9LHsiYm9keXlhdyI6dHJ1ZSwiZGVmZW5zaXZlIjpmYWxzZSwibW9kaWZpZXIiOiJDZW50ZXIiLCJ5YXciOiJCYWNrd2FyZCIsInlhd19tb2RlIjoiU3dpdGNoIn0seyJib2R5eWF3Ijp0cnVlLCJkZWZlbnNpdmUiOmZhbHNlLCJtb2RpZmllciI6IkNlbnRlciIsInlhdyI6IkJhY2t3YXJkIiwieWF3X21vZGUiOiJTd2l0Y2gifSx7ImJvZHl5YXciOnRydWUsImRlZmVuc2l2ZSI6ZmFsc2UsIm1vZGlmaWVyIjoiQ2VudGVyIiwieWF3IjoiQmFja3dhcmQiLCJ5YXdfbW9kZSI6IlN3aXRjaCJ9LHsiYm9keXlhdyI6dHJ1ZSwiZGVmZW5zaXZlIjpmYWxzZSwibW9kaWZpZXIiOiJDZW50ZXIiLCJ5YXciOiJCYWNrd2FyZCIsInlhd19tb2RlIjoiU3dpdGNoIn0seyJib2R5eWF3Ijp0cnVlLCJkZWZlbnNpdmUiOmZhbHNlLCJtb2RpZmllciI6IkNlbnRlciIsInlhdyI6IkJhY2t3YXJkIiwieWF3X21vZGUiOiJTd2l0Y2gifSx7ImJvZHl5YXciOnRydWUsImRlZmVuc2l2ZSI6ZmFsc2UsIm1vZGlmaWVyIjoiQ2VudGVyIiwieWF3IjoiQmFja3dhcmQiLCJ5YXdfbW9kZSI6IlN3aXRjaCJ9LHsiYm9keXlhdyI6dHJ1ZSwiZGVmZW5zaXZlIjpmYWxzZSwibW9kaWZpZXIiOiJDZW50ZXIiLCJ5YXciOiJCYWNrd2FyZCIsInlhd19tb2RlIjoiU3dpdGNoIn0seyJib2R5eWF3Ijp0cnVlLCJkZWZlbnNpdmUiOnRydWUsIm1vZGlmaWVyIjoiRGlzYWJsZWQiLCJ5YXciOiJCYWNrd2FyZCIsInlhd19tb2RlIjoiQ2xhc3NpYyJ9XSxbeyJicmVha2xjIjpmYWxzZSwiZGVsYXkiOjEuMCwiZHNlbGVjdCI6WyJ+Il0sImZzIjoiRGlzYWJsZWQiLCJsZWZ0IjowLjAsImxlZnRsaW1pdCI6NjAuMCwibW9kZSI6IkJhY2t3YXJkIiwibW9kbGVmdCI6MC4wLCJtb2Rtb2RlIjoiQ2xhc3NpYyIsIm1vZHJpZ2h0IjowLjAsIm1vZHN0YXRpYyI6MC4wLCJvcHRpb25zIjpbIn4iXSwicGl0Y2giOiJEaXNhYmxlZCIsInBpdGNoX2N1c3RvbTEiOjAuMCwicGl0Y2hfY3VzdG9tMiI6MC4wLCJwaXRjaF9yYW5kb20xIjowLjAsInBpdGNoX3JhbmRvbTIiOjAuMCwicmFuZG9taXphdGlvbiI6MC4wLCJyaWdodCI6MC4wLCJyaWdodGxpbWl0Ijo2MC4wLCJzdGF0aWMiOjAuMCwieWF3IjoiQ3VzdG9tIiwieWF3X2N1c3RvbTEiOjAuMCwieWF3X2N1c3RvbTIiOjAuMCwieWF3X3JhbmRvbTEiOjAuMCwieWF3X3JhbmRvbTIiOjAuMCwieWF3X3NwaW5fc3BlZWQiOjEuMH0seyJicmVha2xjIjpmYWxzZSwiZGVsYXkiOjIuMCwiZHNlbGVjdCI6WyJ+Il0sImZzIjoiRGlzYWJsZWQiLCJsZWZ0IjotMjMuMCwibGVmdGxpbWl0Ijo2MC4wLCJtb2RlIjoiQmFja3dhcmQiLCJtb2RsZWZ0IjowLjAsIm1vZG1vZGUiOiJDbGFzc2ljIiwibW9kcmlnaHQiOjAuMCwibW9kc3RhdGljIjoyMS4wLCJvcHRpb25zIjpbIkppdHRlciIsIn4iXSwicGl0Y2giOiJEaXNhYmxlZCIsInBpdGNoX2N1c3RvbTEiOjAuMCwicGl0Y2hfY3VzdG9tMiI6MC4wLCJwaXRjaF9yYW5kb20xIjowLjAsInBpdGNoX3JhbmRvbTIiOjAuMCwicmFuZG9taXphdGlvbiI6MS4wLCJyaWdodCI6MjcuMCwicmlnaHRsaW1pdCI6NjAuMCwic3RhdGljIjowLjAsInlhdyI6IkN1c3RvbSIsInlhd19jdXN0b20xIjowLjAsInlhd19jdXN0b20yIjowLjAsInlhd19yYW5kb20xIjowLjAsInlhd19yYW5kb20yIjowLjAsInlhd19zcGluX3NwZWVkIjoxLjB9LHsiYnJlYWtsYyI6ZmFsc2UsImRlbGF5IjoxLjAsImRzZWxlY3QiOlsifiJdLCJmcyI6IkRpc2FibGVkIiwibGVmdCI6LTIyLjAsImxlZnRsaW1pdCI6NjAuMCwibW9kZSI6IkJhY2t3YXJkIiwibW9kbGVmdCI6MC4wLCJtb2Rtb2RlIjoiQ2xhc3NpYyIsIm1vZHJpZ2h0IjowLjAsIm1vZHN0YXRpYyI6MTcuMCwib3B0aW9ucyI6WyJKaXR0ZXIiLCJ+Il0sInBpdGNoIjoiRGlzYWJsZWQiLCJwaXRjaF9jdXN0b20xIjowLjAsInBpdGNoX2N1c3RvbTIiOjAuMCwicGl0Y2hfcmFuZG9tMSI6MC4wLCJwaXRjaF9yYW5kb20yIjowLjAsInJhbmRvbWl6YXRpb24iOjAuMCwicmlnaHQiOjI1LjAsInJpZ2h0bGltaXQiOjYwLjAsInN0YXRpYyI6MC4wLCJ5YXciOiJDdXN0b20iLCJ5YXdfY3VzdG9tMSI6MC4wLCJ5YXdfY3VzdG9tMiI6MC4wLCJ5YXdfcmFuZG9tMSI6MC4wLCJ5YXdfcmFuZG9tMiI6MC4wLCJ5YXdfc3Bpbl9zcGVlZCI6MS4wfSx7ImJyZWFrbGMiOmZhbHNlLCJkZWxheSI6MS4wLCJkc2VsZWN0IjpbIn4iXSwiZnMiOiJEaXNhYmxlZCIsImxlZnQiOi0yMC4wLCJsZWZ0bGltaXQiOjYwLjAsIm1vZGUiOiJCYWNrd2FyZCIsIm1vZGxlZnQiOjAuMCwibW9kbW9kZSI6IkNsYXNzaWMiLCJtb2RyaWdodCI6MC4wLCJtb2RzdGF0aWMiOjI3LjAsIm9wdGlvbnMiOlsiSml0dGVyIiwifiJdLCJwaXRjaCI6IkRpc2FibGVkIiwicGl0Y2hfY3VzdG9tMSI6MC4wLCJwaXRjaF9jdXN0b20yIjowLjAsInBpdGNoX3JhbmRvbTEiOjAuMCwicGl0Y2hfcmFuZG9tMiI6MC4wLCJyYW5kb21pemF0aW9uIjowLjAsInJpZ2h0IjoyNy4wLCJyaWdodGxpbWl0Ijo2MC4wLCJzdGF0aWMiOjAuMCwieWF3IjoiQ3VzdG9tIiwieWF3X2N1c3RvbTEiOjAuMCwieWF3X2N1c3RvbTIiOjAuMCwieWF3X3JhbmRvbTEiOjAuMCwieWF3X3JhbmRvbTIiOjAuMCwieWF3X3NwaW5fc3BlZWQiOjEuMH0seyJicmVha2xjIjpmYWxzZSwiZGVsYXkiOjEuMCwiZHNlbGVjdCI6WyJ+Il0sImZzIjoiRGlzYWJsZWQiLCJsZWZ0IjotMjMuMCwibGVmdGxpbWl0Ijo2MC4wLCJtb2RlIjoiQmFja3dhcmQiLCJtb2RsZWZ0IjowLjAsIm1vZG1vZGUiOiJDbGFzc2ljIiwibW9kcmlnaHQiOjAuMCwibW9kc3RhdGljIjozOS4wLCJvcHRpb25zIjpbIkppdHRlciIsIn4iXSwicGl0Y2giOiJEaXNhYmxlZCIsInBpdGNoX2N1c3RvbTEiOjAuMCwicGl0Y2hfY3VzdG9tMiI6MC4wLCJwaXRjaF9yYW5kb20xIjowLjAsInBpdGNoX3JhbmRvbTIiOjAuMCwicmFuZG9taXphdGlvbiI6MTMuMCwicmlnaHQiOjI0LjAsInJpZ2h0bGltaXQiOjYwLjAsInN0YXRpYyI6MC4wLCJ5YXciOiJDdXN0b20iLCJ5YXdfY3VzdG9tMSI6MC4wLCJ5YXdfY3VzdG9tMiI6MC4wLCJ5YXdfcmFuZG9tMSI6MC4wLCJ5YXdfcmFuZG9tMiI6MC4wLCJ5YXdfc3Bpbl9zcGVlZCI6MS4wfSx7ImJyZWFrbGMiOmZhbHNlLCJkZWxheSI6MS4wLCJkc2VsZWN0IjpbIn4iXSwiZnMiOiJEaXNhYmxlZCIsImxlZnQiOi0yMS4wLCJsZWZ0bGltaXQiOjYwLjAsIm1vZGUiOiJCYWNrd2FyZCIsIm1vZGxlZnQiOjAuMCwibW9kbW9kZSI6IkNsYXNzaWMiLCJtb2RyaWdodCI6MC4wLCJtb2RzdGF0aWMiOjM4LjAsIm9wdGlvbnMiOlsiSml0dGVyIiwifiJdLCJwaXRjaCI6IkRpc2FibGVkIiwicGl0Y2hfY3VzdG9tMSI6MC4wLCJwaXRjaF9jdXN0b20yIjowLjAsInBpdGNoX3JhbmRvbTEiOjAuMCwicGl0Y2hfcmFuZG9tMiI6MC4wLCJyYW5kb21pemF0aW9uIjowLjAsInJpZ2h0IjoyMy4wLCJyaWdodGxpbWl0Ijo2MC4wLCJzdGF0aWMiOjAuMCwieWF3IjoiQ3VzdG9tIiwieWF3X2N1c3RvbTEiOjAuMCwieWF3X2N1c3RvbTIiOjAuMCwieWF3X3JhbmRvbTEiOjAuMCwieWF3X3JhbmRvbTIiOjAuMCwieWF3X3NwaW5fc3BlZWQiOjEuMH0seyJicmVha2xjIjpmYWxzZSwiZGVsYXkiOjEuMCwiZHNlbGVjdCI6WyJ+Il0sImZzIjoiRGlzYWJsZWQiLCJsZWZ0IjotMjIuMCwibGVmdGxpbWl0Ijo2MC4wLCJtb2RlIjoiQmFja3dhcmQiLCJtb2RsZWZ0IjowLjAsIm1vZG1vZGUiOiJDbGFzc2ljIiwibW9kcmlnaHQiOjAuMCwibW9kc3RhdGljIjotNDAuMCwib3B0aW9ucyI6WyJKaXR0ZXIiLCJ+Il0sInBpdGNoIjoiRGlzYWJsZWQiLCJwaXRjaF9jdXN0b20xIjowLjAsInBpdGNoX2N1c3RvbTIiOjAuMCwicGl0Y2hfcmFuZG9tMSI6MC4wLCJwaXRjaF9yYW5kb20yIjowLjAsInJhbmRvbWl6YXRpb24iOjAuMCwicmlnaHQiOjI2LjAsInJpZ2h0bGltaXQiOjYwLjAsInN0YXRpYyI6MC4wLCJ5YXciOiJDdXN0b20iLCJ5YXdfY3VzdG9tMSI6MC4wLCJ5YXdfY3VzdG9tMiI6MC4wLCJ5YXdfcmFuZG9tMSI6MC4wLCJ5YXdfcmFuZG9tMiI6MC4wLCJ5YXdfc3Bpbl9zcGVlZCI6MS4wfSx7ImJyZWFrbGMiOmZhbHNlLCJkZWxheSI6Mi4wLCJkc2VsZWN0IjpbIlBpdGNoIiwiWWF3IiwifiJdLCJmcyI6IkRpc2FibGVkIiwibGVmdCI6LTIzLjAsImxlZnRsaW1pdCI6NTkuMCwibW9kZSI6IkJhY2t3YXJkIiwibW9kbGVmdCI6MC4wLCJtb2Rtb2RlIjoiQ2xhc3NpYyIsIm1vZHJpZ2h0IjowLjAsIm1vZHN0YXRpYyI6MTQuMCwib3B0aW9ucyI6WyJKaXR0ZXIiLCJ+Il0sInBpdGNoIjoiRGlzYWJsZWQiLCJwaXRjaF9jdXN0b20xIjowLjAsInBpdGNoX2N1c3RvbTIiOjAuMCwicGl0Y2hfcmFuZG9tMSI6MC4wLCJwaXRjaF9yYW5kb20yIjowLjAsInJhbmRvbWl6YXRpb24iOjAuMCwicmlnaHQiOjMyLjAsInJpZ2h0bGltaXQiOjU2LjAsInN0YXRpYyI6MC4wLCJ5YXciOiJGb3J3YXJkIiwieWF3X2N1c3RvbTEiOjAuMCwieWF3X2N1c3RvbTIiOjAuMCwieWF3X3JhbmRvbTEiOjAuMCwieWF3X3JhbmRvbTIiOjAuMCwieWF3X3NwaW5fc3BlZWQiOjEuMH0seyJicmVha2xjIjp0cnVlLCJkZWxheSI6MS4wLCJkc2VsZWN0IjpbIlBpdGNoIiwiWWF3IiwifiJdLCJmcyI6IkRpc2FibGVkIiwibGVmdCI6MC4wLCJsZWZ0bGltaXQiOjYwLjAsIm1vZGUiOiJCYWNrd2FyZCIsIm1vZGxlZnQiOjAuMCwibW9kbW9kZSI6IkNsYXNzaWMiLCJtb2RyaWdodCI6MC4wLCJtb2RzdGF0aWMiOjAuMCwib3B0aW9ucyI6WyJKaXR0ZXIiLCJ+Il0sInBpdGNoIjoiVXAiLCJwaXRjaF9jdXN0b20xIjowLjAsInBpdGNoX2N1c3RvbTIiOjAuMCwicGl0Y2hfcmFuZG9tMSI6MC4wLCJwaXRjaF9yYW5kb20yIjowLjAsInJhbmRvbWl6YXRpb24iOjAuMCwicmlnaHQiOjAuMCwicmlnaHRsaW1pdCI6NjAuMCwic3RhdGljIjowLjAsInlhdyI6IkZvcndhcmQiLCJ5YXdfY3VzdG9tMSI6MC4wLCJ5YXdfY3VzdG9tMiI6LTE4MC4wLCJ5YXdfcmFuZG9tMSI6MC4wLCJ5YXdfcmFuZG9tMiI6MC4wLCJ5YXdfc3Bpbl9zcGVlZCI6MS4wfV0seyJhaW1ib3Rsb2dzIjp0cnVlLCJhbmltYnJlYWtlcnMiOnRydWUsImFzcGVjdCI6dHJ1ZSwiYmFycyI6ZmFsc2UsImJvbWJpbmZvIjpmYWxzZSwiY2xhbnRhZyI6ZmFsc2UsImNsaWVudG5hbWUiOnsiaW5wdXQiOiLQoNCw0LzQvtC90Ysg0L7RgiDRgdC10YDQtdCz0LgifSwiY3Jvc3NoYWlyIjpmYWxzZSwiZ3JlbmFkZV9yYWRpdXMiOmZhbHNlLCJncmVuYWRlcyI6ZmFsc2UsImhpdGNoYW5jZSI6ZmFsc2UsImhpdG1hcmtlciI6dHJ1ZSwibWFudWFsX2Fycm93cyI6dHJ1ZSwibWluZG1nIjp0cnVlLCJwaW5ndW5sb2NrZXIiOnRydWUsInNjb3BlIjp0cnVlLCJzaWxlbmNlZCI6eyJzZWxlY3Rpb24iOjEuMH0sInRhYiI6Mi4wLCJ0cmFzaHRhbGsiOnRydWUsInZpZXdtb2RlbCI6dHJ1ZSwid2F0ZXJtYXJrIjp0cnVlLCJ+YWltYm90bG9ncyI6eyJjb2xvcl9tb2Rlcm4iOiIjRkZDQkY3RkYiLCJkb3Rfc3R5bGUiOjEuMCwiZmlsdGVyIjp0cnVlLCJvZmZzZXQiOjAuMCwicG9zIjpbMS4wLDIuMCwzLjAsIn4iXSwicmFpbmJvd19jb2xvciI6ZmFsc2UsInRoZW1lIjoxLjB9LCJ+YW5pbWJyZWFrZXJzIjp7ImFkZG9ucyI6WyJNb3ZlIExlYW4iLCJ+Il0sImFpciI6IlN0YXRpYyIsImdyb3VuZCI6IlJldmVyc2VkIiwiaml0dGVyc3BlZWQiOjEwMC4wLCJqaXR0ZXJ2YWx1ZSI6MTAwLjAsIm1vdmVsZWFuIjoxMDAuMH0sIn5hc3BlY3QiOnsidmFsIjoxMzEuMH0sIn5iYXJzIjp7ImFkYXB0aXZlIjpmYWxzZSwibWluaW11bV9kYW1hZ2UiOjAuMCwibW9kZSI6WyJ+Il0sInJlZyI6WyJ+Il0sInNlbGVjdCI6WyJ+Il19LCJ+Ym9tYmluZm8iOnsiY29sb3IiOiIjRkZEQUY4RkYiLCJkYW1hZ2VfcG9zaXRpb25feCI6ODc2LjAsImRhbWFnZV9wb3NpdGlvbl95IjozMjIuMH0sIn5jcm9zc2hhaXIiOnsiYWNjZW50X2Nyb3NzaGFpciI6IiNGRkRBRjhGRiIsImNsYXNzaWNfY3Jvc3NoYWlyIjoiI0ZGREFGOEZGIiwiZm9udCI6MS4wLCJvZmZzZXQiOjcwLjAsInNlY29uZF9jcm9zc2hhaXIiOiIjQkNCQ0JDRkYifSwifmdyZW5hZGVfcmFkaXVzIjp7Im1vbG90b3ZfY29sb3IiOiIjQUZFQkZGRkYiLCJzZWxlY3QiOlsifiJdLCJzbW9rZV9jb2xvciI6IiNBRkZGQzhGRiJ9LCJ+Z3JlbmFkZXMiOnsiY2FsY19ncmVuYWRlIjowLjAsIm5hZGVob3RrZXkiOjAuMCwibmFkZXMiOlsifiJdLCJzZWxlY3RuYWRlcyI6WyJ+Il19LCJ+aGl0Y2hhbmNlIjp7ImF0c25pcGVyX2NoYW5jZSI6MC4wLCJhdHNuaXBlcl9uemNoYW5jZSI6MC4wLCJhd3BfY2hhbmNlIjowLjAsImF3cF9uemNoYW5jZSI6MC4wLCJpbmFpcl9oYyI6MS4wLCJyZXZvbHZlcl9jaGFuY2UiOjAuMCwic3NnMDhfY2hhbmNlIjowLjAsInNzZzA4X256Y2hhbmNlIjowLjB9LCJ+aGl0bWFya2VyIjp7ImNvbG9yX3giOiIjRkZDQkY3RkYiLCJzdHlsZSI6Mi4wfSwifm1hbnVhbF9hcnJvd3MiOnsiYWx3YXlzX29uIjpmYWxzZSwiY29sb3JfYXJyb3dzIjoiI0Y3QUZGRkZGIiwic2xpZGVyX2Fycm93c194Ijo1LjAsInNsaWRlcl9hcnJvd3NfeSI6NS4wLCJzdHlsZWQiOjEuMH0sIn5taW5kbWciOnsiZGFtYWdlX2FscGhhIjo1MC4wLCJkYW1hZ2VfY29sb3IiOiIjRkZGRkZGRkYiLCJkYW1hZ2VfcG9zaXRpb25feCI6OTY4LjAsImRhbWFnZV9wb3NpdGlvbl95Ijo1MjIuMCwiZGFtYWdlX3NlbGVjdGlvbiI6MS4wfSwifnBpbmd1bmxvY2tlciI6eyJzbGlkZXJfcGluZyI6OTAuMH0sIn5zY29wZSI6eyJhbmltX3pvb20iOmZhbHNlLCJjb2xvciI6IiNGRkZGRkZGRiIsImdhcCI6Ni4wLCJrZWVwdHJhbnNwYXJlbmN5Ijp0cnVlLCJsZW5ndGgiOjIzMC4wfSwifnRyYXNodGFsayI6eyJkZWxheV90aW1lciI6MS4wLCJzZWxlY3Rpb24iOlsyLjAsIn4iXX0sIn52aWV3bW9kZWwiOnsiZm92IjozMjguMCwib3Bwb3NpdGVfa25pZmUiOmZhbHNlLCJ4X2F4aXMiOjIyLjAsInlfYXhpcyI6NDMuMCwiel9heGlzIjoxMC4wfSwifndhdGVybWFyayI6eyJhbmltX2NvbG9yIjoiI0Y3QUZGRkZGIiwiYW5pbV9nbG93IjpmYWxzZSwiYW5pbV9zdHlsZSI6MS4wLCJjbGFzc2ljX2NvbG9yIjoiIzhEODJCMkZGIiwicHJvZ3Jlc3NpdmVfY29sb3IiOiIjRjdBRkZGRkYiLCJzZWxlY3RpbmciOlsiUElORyIsIkZQUyIsIlVTRVJOQU1FIiwifiJdfX1dLCJuYW1lIjoiaGVsbG8ifQ=="));
        l_pui_0.load(v923.file, 1);
        l_pui_0.load(v923.file, 2);
        l_pui_0.load(v923.file, 3);
        l_pui_0.load(v923.file, 4);
    end;
end);
v43.info.presets_name:set(presets_data.name[v43.info.presets_list:get()]);
v43.info.presets_success_export:visibility(false);
v43.info.presets_success_import:visibility(false);
v43.info.presets_success_exist:visibility(false);
v43.info.presets_success_importfailed:visibility(false);
updatevisdata = function()
    -- upvalues: v43 (ref), v52 (ref), v51 (ref), v53 (ref), v54 (ref)
    if ui.get_alpha() ~= 0 then
        v43.info.presets_success_export:visibility(globals.realtime - v52 <= 2);
        v43.info.presets_success_import:visibility(globals.realtime - v51 <= 2);
        v43.info.presets_success_exist:visibility(globals.realtime - v53 <= 2);
        v43.info.presets_success_importfailed:visibility(globals.realtime - v54 <= 2);
    end;
end;
events.render(v263.handle);
events.localplayer_transparency:set(transparency);
v85("shutdown", "shutdown", v903);
v85("render", "render", render);
v85("render", "updatevisdata", updatevisdata);
v85("createmove", "antiaim", v448);
v85("createmove", "onmove", onmove);
v85("post_update_clientside_animation", "animbreaker", animbreaker);
v85("aim_ack", "shot", shot);
v85("player_death", "death", v772);
v902:run();
events.render:set(function()
    -- upvalues: v829 (ref)
    fakelatency();
    v829();
end);
v42.enable:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v43.info.selection
});
v42.states:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v43.info.selection
});
v42.antiaimtab:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v43.info.selection
}, {
    [1] = nil, 
    [2] = 1, 
    [1] = v43.antiaim.enable
});
v43.misc.aimbotlogs.dot_style:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v43.misc.aimbotlogs.theme
});
v42.statistic:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v43.info.selection
});
v42.personal:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v43.info.selection
});
v42.information:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v43.info.selection
});
v42.configuration:depend({
    [1] = nil, 
    [2] = 4, 
    [1] = v43.info.selection
});
v42.social:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v43.info.selection
});
v42.settings_tabs:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v43.info.selection
});
v42.settings_misc:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v43.info.selection
}, {
    [1] = nil, 
    [2] = 1, 
    [1] = v43.misc.tab
});
v42.settings_additional:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v43.info.selection
}, {
    [1] = nil, 
    [2] = 1, 
    [1] = v43.misc.tab
});
v42.settings_tabber:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v43.info.selection
}, {
    [1] = nil, 
    [2] = 3, 
    [1] = v43.misc.tab
});
v42.settings_switcher:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v43.info.selection
}, {
    [1] = nil, 
    [2] = 3, 
    [1] = v43.misc.tab
});
v42.settings_visuals:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v43.info.selection
}, {
    [1] = nil, 
    [2] = 2, 
    [1] = v43.misc.tab
});
v42.misc:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v43.info.selection
}, {
    [1] = nil, 
    [2] = 2, 
    [1] = v43.misc.tab
});
v42.builder_tab:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v43.antiaim.enable
}, {
    [1] = nil, 
    [2] = 2, 
    [1] = v43.info.selection
});
v42.states:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v43.antiaim.enable
});
v43.misc.bars.mode:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v43.misc.bars.select
});
v43.misc.watermark.anim_color:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v43.misc.watermark.anim_style
});
v43.misc.watermark.progressive_color:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v43.misc.watermark.anim_style
});
v43.misc.watermark.selecting:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v43.misc.watermark.anim_style
});
v43.misc.bars.reg:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v43.misc.bars.select
});
v43.misc.bars.minimum_damage:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v43.misc.bars.select
});
v43.misc.bars.reg:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v43.misc.bars.select
});
v43.misc.bars.adaptive:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v43.misc.bars.select
});
v43.misc.crosshair.accent_crosshair:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v43.misc.crosshair.font
});
v43.misc.crosshair.second_crosshair:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v43.misc.crosshair.font
});
v43.misc.crosshair.classic_crosshair:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v43.misc.crosshair.font
});
v43.misc.grenade_radius.molotov_color:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v43.misc.grenade_radius.select
});
v43.misc.grenade_radius.smoke_color:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v43.misc.grenade_radius.select
});
v43.info.sidebars:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v43.info.selection
});
v43.misc.aimbotlogs.theme:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v43.misc.aimbotlogs.pos
});
v43.misc.aimbotlogs.glow_modern:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v43.misc.aimbotlogs.theme
});
v43.misc.aimbotlogs.offset:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v43.misc.aimbotlogs.pos
});
v43.misc.aimbotlogs.rainbow_color:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v43.misc.aimbotlogs.pos
});
v43.misc.aimbotlogs.rainbow_color:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v43.misc.aimbotlogs.theme
});
v43.misc.aimbotlogs.dot_style:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v43.misc.aimbotlogs.pos
});
v43.misc.aimbotlogs.filter:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v43.misc.aimbotlogs.pos
});
v42.statistic:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v43.info.selection
});
v42.personal:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v43.info.selection
});
v42.information:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v43.info.selection
});
v42.configuration:depend({
    [1] = nil, 
    [2] = 4, 
    [1] = v43.info.selection
});
v42.social:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v43.info.selection
});
v42.antiaimtab:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v43.antiaim.enable
});
v42.builder_tab:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v43.antiaim.enable
});
v42.states:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v43.antiaim.enable
});
v43.misc.grenades.selectnades:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v43.misc.grenades.nades
});
v43.misc.grenades.nadehotkey:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v43.misc.grenades.nades
});
v43.misc.grenades.calc_grenade:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v43.misc.grenades.nades
});
v43.misc.bars.reg:depend({
    [1] = nil, 
    [2] = false, 
    [1] = v43.misc.bars.adaptive
});
v43.misc.hitchance.enable_ssg:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v43.misc.hitchance.inair_hc
});
v43.misc.hitchance.enable_awp:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v43.misc.hitchance.inair_hc
});
v43.misc.hitchance.enable_at:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v43.misc.hitchance.inair_hc
});
v43.misc.hitchance.enable_r8:depend({
    [1] = nil, 
    [2] = 4, 
    [1] = v43.misc.hitchance.inair_hc
});
v43.misc.bars.minimum_damage:depend({
    [1] = nil, 
    [2] = false, 
    [1] = v43.misc.bars.adaptive
});
v43.misc.hitchance.ssg08_chance:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v43.misc.hitchance.inair_hc
}, {
    [1] = nil, 
    [2] = true, 
    [1] = v43.misc.hitchance.enable_ssg
});
v43.misc.hitchance.awp_chance:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v43.misc.hitchance.inair_hc
}, {
    [1] = nil, 
    [2] = true, 
    [1] = v43.misc.hitchance.enable_awp
});
v43.misc.hitchance.atsniper_chance:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v43.misc.hitchance.inair_hc
}, {
    [1] = nil, 
    [2] = true, 
    [1] = v43.misc.hitchance.enable_at
});
v43.misc.hitchance.revolver_chance:depend({
    [1] = nil, 
    [2] = 4, 
    [1] = v43.misc.hitchance.inair_hc
}, {
    [1] = nil, 
    [2] = true, 
    [1] = v43.misc.hitchance.enable_r8
});
v43.misc.hitchance.ssg08_nzchance:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v43.misc.hitchance.inair_hc
}, {
    [1] = nil, 
    [2] = true, 
    [1] = v43.misc.hitchance.enable_ssg
});
v43.misc.hitchance.awp_nzchance:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v43.misc.hitchance.inair_hc
}, {
    [1] = nil, 
    [2] = true, 
    [1] = v43.misc.hitchance.enable_awp
});
v43.misc.hitchance.atsniper_nzchance:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v43.misc.hitchance.inair_hc
}, {
    [1] = nil, 
    [2] = true, 
    [1] = v43.misc.hitchance.enable_at
});
v43.misc.animbreakers.movelean:depend({
    [1] = nil, 
    [2] = "Move Lean", 
    [1] = v43.misc.animbreakers.addons
});