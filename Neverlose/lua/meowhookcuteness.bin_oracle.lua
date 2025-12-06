local l_pui_0 = require("neverlose/pui");
local l_base64_0 = require("neverlose/base64");
local l_clipboard_0 = require("neverlose/clipboard");
local l_monylinear_0 = require("neverlose/monylinear");
local l_smoothy_0 = require("neverlose/smoothy");
local _ = require("neverlose/csgo_weapons");
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
local l_x_0 = render.screen_size().x;
local l_y_0 = render.screen_size().y;
l_ffi_0.cdef("void* __stdcall URLDownloadToFileA(void* LPUNKNOWN, const char* LPCSTR, const char* LPCSTR2, int a, int LPBINDSTATUSCALLBACK);\nbool DeleteUrlCacheEntryA(const char* lpszUrlName);\n\ntypedef void*(__thiscall* get_client_entity_t)(void*, int);\ntypedef struct {\n    char pad_0000[20];\n    int m_nOrder, m_nSequence;\n    float m_flPrevCycle, m_flWeight, m_flWeightDeltaRate, m_flPlaybackRate, m_flCycle;\n    void *m_pOwner;\n    char pad_0038[4];\n} animstate_layer_t;\n\ntypedef int(__fastcall* clantag_t)(const char*, const char*);\ntypedef void*(__thiscall* get_client_entity_t)(void*, int);\ntypedef struct { float x, y, z; } vec3_struct;\n\ntypedef struct {\n    float x, y, z;\n} Vector_t;\n\ntypedef void*(__thiscall* get_client_entity_t)(void*, int);\ntypedef struct {\n    char  pad_0000[20];\n    int m_nOrder; //0x0014\n    int m_nSequence; //0x0018\n    float m_flPrevCycle; //0x001C\n    float m_flWeight; //0x0020\n    float m_flWeightDeltaRate; //0x0024\n    float m_flPlaybackRate; //0x0028\n    float m_flCycle; //0x002C\n    void *m_pOwner; //0x0030\n    char  pad_0038[4]; //0x0034\n} c_animlayers;\n\ntypedef struct {\n    char pad0[0x60];\n    void* pEntity, *pActiveWeapon, *pLastActiveWeapon;\n    float flLastUpdateTime;\n    int iLastUpdateFrame;\n    float flLastUpdateIncrement, flEyeYaw, flEyePitch, flGoalFeetYaw, flLastFeetYaw, flMoveYaw, flLastMoveYaw;\n    float flLeanAmount, flFeetCycle, flMoveWeight, flMoveWeightSmoothed, flDuckAmount, flHitGroundCycle, flRecrouchWeight;\n    Vector_t vecOrigin, vecLastOrigin, vecVelocity, vecVelocityNormalized, vecVelocityNormalizedNonZero;\n    float flVelocityLenght2D, flJumpFallVelocity, flSpeedNormalized, flRunningSpeed, flDuckingSpeed;\n    float flDurationMoving, flDurationStill, flNextLowerBodyYawUpdateTime, flDurationInAir, flLeftGroundHeight;\n    float flHitGroundWeight, flWalkToRunTransition, flAffectedFraction, flMinBodyYaw, flMaxBodyYaw, flMinPitch, flMaxPitch;\n    int iAnimsetVersion;\n} CCSGOPlayerAnimationState_534535_t;\n");
local _ = l_ffi_0.typeof("uintptr_t**");
local v21 = utils.get_vfunc("client.dll", "VClientEntityList003", 3, "void*(__thiscall*)(void*, int)");
local _ = nil;
lerp = function(v23, v24, v25)
    return v23 + (v24 - v23) * v25;
end;
math.max_lerp_low_fps = 2.2222222222222223;
math.lerp = function(v26, v27, v28)
    if v26 == v27 then
        return v27;
    else
        local v29 = globals.frametime * 170;
        v28 = v28 * math.min(v29, math.max_lerp_low_fps);
        local v30 = v26 + (v27 - v26) * globals.frametime * v28;
        return math.abs(v30 - v27) < 0.01 and v27 or v30;
    end;
end;
local v31 = {
    base_speed = 0.095, 
    _list = {}
};
v31.new = function(v32, v33, v34, v35)
    -- upvalues: v31 (ref)
    if not v34 then
        v34 = v31.base_speed;
    end;
    v31._list[v32] = v31._list[v32] or v35 or 0;
    v31._list[v32] = math.lerp(v31._list[v32], v33, v34);
    return v31._list[v32];
end;
condition = {
    [1] = "Shared", 
    [2] = "Standing", 
    [3] = "Running", 
    [4] = "Slow-Walking", 
    [5] = "Crouching", 
    [6] = "Crouch Moving", 
    [7] = "Air", 
    [8] = "Air-Crouching", 
    [9] = "Freestanding"
};
local _ = {
    last_drop_tick = globals.tickcount
};
local v37 = false;
local v38 = "";
local v39 = {};
local _ = {};
local _ = {};
local v42 = {};
local _ = {};
local _ = {};
local _ = {};
local _ = {};
local _ = {};
local v48 = {};
local _ = {
    [1] = yaw, 
    [2] = invert, 
    [3] = add, 
    [4] = safe, 
    [5] = cond, 
    [6] = cond2
};
local v50 = 0;
local v51 = 0;
local v52 = 0;
local v53 = 0;
v48.hitboxes = {
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
local v54 = {};
local v55 = {};
local v56 = 0;
v48.hit = 0;
v48.reg = v56;
v48.datal = v55;
v48.data = v54;
v54 = {
    urlmon = l_ffi_0.load("UrlMon"), 
    wininet = l_ffi_0.load("WinInet")
};
v54.download_file_from_url = function(v57, v58)
    -- upvalues: v54 (ref)
    v54.wininet.DeleteUrlCacheEntryA(v57);
    v54.urlmon.URLDownloadToFileA(nil, v57, v58, 0, 0);
end;
v55 = {
    name = {
        [1] = "Default"
    }, 
    file = {
        [1] = ""
    }
};
files.create_folder("nl/meowhook");
if files.read("nl/meowhook/meowing.txt") == nil then
    files.write("nl/meowhook/meowing.txt", l_base64_0.encode(json.stringify(v55)));
end;
presets_data = json.parse(l_base64_0.decode(files.read("nl/meowhook/meowing.txt")));
v56 = function(v59, v60)
    local v61 = math.sin(math.rad(v59));
    local v62 = math.sin(math.rad(v60));
    local v63 = math.cos(math.rad(v59));
    local v64 = math.cos(math.rad(v60));
    return vector(v63 * v64, v63 * v62, -v61);
end;
local function v66(v65)
    v65:gsub("\a.{6}", "");
end;
local v67 = render.load_font("Verdana", 14, "d, a");
local v68 = render.load_image("<svg width=\"8\" height=\"10\" viewBox=\"0 0 8 10\"><path fill=\"#fff\" d=\"m0.384 5.802c-0.24286-0.19453-0.3842-0.48884-0.3842-0.8s0.14134-0.60547 0.3842-0.8l6.08-4c0.29513-0.22371 0.69277-0.25727 1.0212-0.086202 0.32846 0.17107 0.52889 0.51613 0.51477 0.8862l-1.92 3.96 1.92 4.04c0.01412 0.37007-0.18631 0.71513-0.51477 0.8862-0.32846 0.1711-0.7261 0.1375-1.0212-0.0862z\"/></svg>", vector(9, 9));
local v69 = render.load_image("<svg width=\"8\" height=\"10\" viewBox=\"0 0 8 10\"><path fill=\"#fff\" transform=\"rotate(180, 4, 5)\" d=\"m0.384 5.802c-0.24286-0.19453-0.3842-0.48884-0.3842-0.8s0.14134-0.60547 0.3842-0.8l6.08-4c0.29513-0.22371 0.69277-0.25727 1.0212-0.086202 0.32846 0.17107 0.52889 0.51613 0.51477 0.8862l-1.92 3.96 1.92 4.04c0.01412 0.37007-0.18631 0.71513-0.51477 0.8862-0.32846 0.1711-0.7261 0.1375-1.0212-0.0862z\"/></svg>", vector(9, 9));
local function v76(v70, v71, v72)
    -- upvalues: v53 (ref), v66 (ref)
    return function(...)
        -- upvalues: v72 (ref), v70 (ref), v53 (ref), v71 (ref), v66 (ref)
        local l_status_0, l_result_0 = pcall(v72, ...);
        if not l_status_0 then
            local v75 = v70 .. " : " .. l_result_0:gsub(".{6}", "");
            if v75 == "presets.import : [\"neverlose/base64\"]:98: attempt to perform arithmetic on local 'd' (a nil value)" then
                v53 = globals.realtime;
            end;
            if v71 then
                v66(v75);
            end;
            return false, v75;
        else
            return l_result_0, l_status_0;
        end;
    end;
end;
local function _(v77, v78, v79)
    -- upvalues: v76 (ref)
    events[v77]:set(v76(v78, true, v79));
end;
local function v84(v81, v82)
    for v83 = 1, #v81 do
        if v81[v83] == v82 then
            return true;
        end;
    end;
    return false;
end;
local function _(v85)
    return v85:get_override() == nil and v85:get() or v85:get_override();
end;
local v87 = {
    enabled = ui.find("Aimbot", "Anti Aim", "Angles", "Enabled"), 
    pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"), 
    yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"), 
    actions = ui.find("Miscellaneous", "Main", "Other", "Weapon Actions"), 
    yaw_base = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"), 
    offset_y = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"), 
    avoid_backstab = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab"), 
    hidden_yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden"), 
    modifier = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"), 
    modifier_offset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"), 
    bodyyaw = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"), 
    bodyyaw_inverter = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"), 
    left_limit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"), 
    right_limit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"), 
    hslag = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options"), 
    options = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"), 
    bodyyaw_inverter = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"), 
    bodyyaw_freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding"), 
    freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"), 
    freestanding_disable_modifiers = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Disable Yaw Modifiers"), 
    freestanding_body_freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Body Freestanding"), 
    extended_angles = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles"), 
    extended_angles_pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles", "Extended Pitch"), 
    extended_angles_roll = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles", "Extended Roll"), 
    fake_duck = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"), 
    slow_walk = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"), 
    hitbox = ui.find("Aimbot", "Ragebot", "Selection", "Hitboxes"), 
    legs_movement = ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"), 
    leg = ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"), 
    baim = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim"), 
    fov = ui.find("Visuals", "World", "Main", "Field of View"), 
    ovrzoom = ui.find("Visuals", "World", "Main", "Override Zoom"), 
    scope = ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay"), 
    lag_options = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"), 
    hide_shots_options = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options"), 
    clantag = ui.find("Miscellaneous", "Main", "In-Game", "Clan Tag"), 
    doubletap = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"), 
    dormant = ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot"), 
    hide_shots = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"), 
    minimum_damage = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"), 
    scope_overlay = ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay"), 
    body_aim = ui.find("Aimbot", "Ragebot", "Safety", "SSG-08", "Body Aim"), 
    safe_points = ui.find("Aimbot", "Ragebot", "Safety", "SSG-08", "Safe Points"), 
    fake_latency = ui.find("Miscellaneous", "Main", "Other", "Fake Latency"), 
    dormant_aimbot = ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot"), 
    weapon_actions = ui.find("Miscellaneous", "Main", "Other", "Weapon Actions"), 
    field_of_view = ui.find("Visuals", "World", "Main", "Field of View"), 
    override_zoom = ui.find("Visuals", "World", "Main", "Override Zoom"), 
    headscale = ui.find("Aimbot", "Ragebot", "Selection", "Multipoint", "Head Scale"), 
    bodyscale = ui.find("Aimbot", "Ragebot", "Selection", "Multipoint", "Body Scale"), 
    rbody = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim"), 
    enabled = ui.find("Aimbot", "Anti Aim", "Angles", "Enabled"), 
    pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"), 
    yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"), 
    yaw_base = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"), 
    yaw_offset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"), 
    avoid_backstab = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab"), 
    hidden_yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden"), 
    yaw_modifier = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"), 
    yaw_modifier_offset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"), 
    bodyyaw = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"), 
    bodyyaw_inverter = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"), 
    bodyyaw_left_limit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"), 
    bodyyaw_right_limit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"), 
    options = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"), 
    bodyyaw_inverter = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"), 
    bodyyaw_freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding"), 
    freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"), 
    freestanding_disable_yaw_modifiers = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Disable Yaw Modifiers"), 
    freestanding_body_freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Body Freestanding"), 
    extended_angles = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles"), 
    extended_angles_pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles", "Extended Pitch"), 
    extended_angles_roll = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles", "Extended Roll"), 
    fake_duck = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"), 
    slow_walk = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"), 
    hitchance_scout = ui.find("Aimbot", "Ragebot", "Selection", "SSG-08", "Hit Chance"), 
    autostop_scout = ui.find("Aimbot", "Ragebot", "Accuracy", "SSG-08", "Auto Stop", "Options"), 
    legs_movement = ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"), 
    lag_options = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"), 
    hide_shots_options = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options"), 
    clantag = ui.find("Miscellaneous", "Main", "In-Game", "Clan Tag"), 
    doubletap = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"), 
    hide_shots = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"), 
    minimum_damage = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"), 
    scope_overlay = ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay"), 
    body_aim = ui.find("Aimbot", "Ragebot", "Safety", "SSG-08", "Body Aim"), 
    safe_points = ui.find("Aimbot", "Ragebot", "Safety", "SSG-08", "Safe Points"), 
    fake_latency = ui.find("Miscellaneous", "Main", "Other", "Fake Latency"), 
    dormant_aimbot = ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot"), 
    weapon_actions = ui.find("Miscellaneous", "Main", "Other", "Weapon Actions"), 
    field_of_view = ui.find("Visuals", "World", "Main", "Field of View"), 
    override_zoom = ui.find("Visuals", "World", "Main", "Override Zoom"), 
    filters = ui.find("Miscellaneous", "Main", "Other", "Filters"), 
    ht = ui.find("Aimbot", "Ragebot", "Selection", "Hit Chance"), 
    ht1 = ui.find("Aimbot", "Ragebot", "Selection", "SSG-08", "Hit Chance"), 
    ssg_hitchance = ui.find("Aimbot", "Ragebot", "Selection", "SSG-08", "Hit Chance"), 
    awp_hitchance = ui.find("Aimbot", "Ragebot", "Selection", "AWP", "Hit Chance"), 
    autosnipers_hitchance = ui.find("Aimbot", "Ragebot", "Selection", "AutoSnipers", "Hit Chance"), 
    hc_find = ui.find("Aimbot", "Ragebot", "Selection", "Hit Chance")
};
local v88 = {
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
v39 = {
    build = "\208\161uteness", 
    calibri = render.load_font("Calibri Bold", vector(25, 22, -1), "a, d"), 
    screen = render.screen_size() * 0.5, 
    fullscreen = render.screen_size(), 
    username = common.get_username(), 
    usernamelen = string.len(common.get_username())
};
info = {
    main = l_pui_0.create(ui.get_icon("house-night"), "\v It's good to see you, kitty   ", 1), 
    selectab = l_pui_0.create(ui.get_icon("house-night"), "", 1), 
    active = l_pui_0.create(ui.get_icon("house-night"), "Your activity - \v" .. v39.username, 1), 
    general = l_pui_0.create(ui.get_icon("house-night"), "PROFILE", 2), 
    config = l_pui_0.create(ui.get_icon("house-night"), "CONFIGURATION", 2)
};
antiaim = {
    enable = l_pui_0.create(ui.get_icon("house-night"), "\n\n\n\n", 1), 
    condition = l_pui_0.create(ui.get_icon("house-night"), "Current state", 2), 
    first_builder = l_pui_0.create(ui.get_icon("house-night"), "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n", 2), 
    two_builder = l_pui_0.create(ui.get_icon("house-night"), "\n\n\n", 2), 
    three_builder = l_pui_0.create(ui.get_icon("house-night"), "\n\n\n\n\n\n\n\n\n\n\n\n\n", 2), 
    essential_builder = l_pui_0.create(ui.get_icon("house-night"), "\n\n\n\n\\n\n\n\n\n\n\n\n\n\n\n\n", 1), 
    dp_builder = l_pui_0.create(ui.get_icon("house-night"), "    ", 2), 
    esn_builder = l_pui_0.create(ui.get_icon("house-night"), "\n\n\n\n\n\n\n", 2), 
    four_builder = l_pui_0.create(ui.get_icon("house-night"), "\n\n\n\n\n", 2), 
    preset_manager = l_pui_0.create(ui.get_icon("house-night"), "\n", 1)
};
other = {
    start = l_pui_0.create(ui.get_icon("house-night"), "\n\n\n\n\n\n\n\n\n\n\n\n", 1), 
    setup = l_pui_0.create(ui.get_icon("house-night"), "  ", 2), 
    helping = l_pui_0.create(ui.get_icon("house-night"), "\n\n\n\n\n\n\n\n\n\n\n\n\n\n", 2), 
    visuals = l_pui_0.create(ui.get_icon("house-night"), "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n", 2), 
    modifications = l_pui_0.create(ui.get_icon("house-night"), "   ", 2), 
    esnt = l_pui_0.create(ui.get_icon("house-night"), "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n", 2), 
    addons = l_pui_0.create(ui.get_icon("house-night"), "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n", 2)
};
local _ = render.screen_size();
local l_realtime_0 = globals.realtime;
local v91 = {
    base_speed = 0.095, 
    _list = {}
};
v91.new = function(v92, v93, v94, v95)
    -- upvalues: v91 (ref)
    if not v94 then
        v94 = v91.base_speed;
    end;
    v91._list[v92] = v91._list[v92] or v95 or 0;
    v91._list[v92] = math.lerp(v91._list[v92], v93, v94);
    return v91._list[v92];
end;
v42 = {
    information = {
        categories = info.main:list("", "\v\f<id-card>  \rMain", "\v\f<brackets-curly>  \rAnti-aim", "\v\f<gear>  \rMiscellaneous", "\v\f<folder>  \rConfiguration"), 
        one = info.general:label("\v\f<user>   \rUsername"), 
        one_button = info.general:button("\a{Link Active}" .. string.rep(" ", 0 - v39.usernamelen) .. v39.username, function()

        end, true), 
        two = info.general:label("\v\f<code-branch>   \rBuild"), 
        two_button = info.general:button("\a{Link Active}" .. string.rep(" ", 0) .. v39.build, function()

        end, true), 
        update = info.general:label("\v\f<image-user>   \rLast update"), 
        discord_button = info.general:button("\v06.01.2025", function()

        end, true), 
        session = info.general:label("\a{Link Active}" .. ui.get_icon("sensor-cloud") .. "\a{Text}" .. "  Session "), 
        session_button = info.general:button("", function()

        end, true)
    }, 
    builder = {
        type = antiaim.enable:list("", "\v\f<screwdriver-wrench>   \rGeneral", "\v\f<sliders>   \rAnti-aim builder"), 
        manual = antiaim.essential_builder:combo("Manual Yaw", {
            [1] = "Disabled", 
            [2] = "Left", 
            [3] = "Right", 
            [4] = "Backward"
        }, function(v96)
            return {
                static_manuals = v96:switch("Static Yaw", false)
            };
        end), 
        freestanding = antiaim.essential_builder:switch("\v\rFreestanding", false, function(v97)
            return {
                disablers = v97:selectable("Disablers", "Standing", "Running", "Slow-Walking", "Crouching", "Crouch Moving", "Air", "Air-Crouching"), 
                peek = v97:switch("Flick on peek"), 
                static_yaw = v97:switch("Static Yaw")
            };
        end), 
        safe = antiaim.dp_builder:switch("\v\rSafe Head", false, function(v98)
            return {
                select = v98:listable("\n", "Knife", "Taser", "Stand", "Crouch", "Air-Crouch")
            };
        end), 
        edgeyaw = antiaim.dp_builder:switch("Edge Yaw", false, function(v99)
            return {
                edge_on_fd = v99:switch("Only on fakeduck")
            }, true;
        end), 
        lagger = antiaim.esn_builder:switch("Air Exploit", false, function(v100)
            return {
                types = v100:list("\v\f<keyboard>  \rType", "On Enemy", "Tickount"), 
                guns = v100:listable("\v\f<gun>  \rGuns", "AWP", "SSG-08", "Zeus"), 
                enb = v100:switch("\v\f<toggle-on>  \rEnable \v[on cross]"):depend(true), 
                slider = v100:slider("Amount", 0, 40, 0, nil, "t")
            }, true;
        end), 
        auto_os = antiaim.esn_builder:switch("Auto OS", false, function(v101)
            return {
                state = v101:listable("\v\f<route-interstate>  \rState", "Stand", "Crouch"), 
                guns = v101:listable("\v\f<gun>  \rGuns", "Deagle", "Usp", "Glock", "P250", "Tec-9")
            }, true;
        end), 
        disablers = antiaim.dp_builder:switch("\v\rUseless Function", false, function(v102)
            return {
                typed = v102:listable("", "Spin on Warm-up", "Spin no Enemies")
            }, true;
        end), 
        avoidbk = antiaim.dp_builder:switch("\v\rAvoid Backstab", false), 
        conditions = antiaim.condition:combo("\rState", {
            [1] = "Shared", 
            [2] = "Standing", 
            [3] = "Running", 
            [4] = "Slow-Walking", 
            [5] = "Crouching", 
            [6] = "Crouch Moving", 
            [7] = "Air", 
            [8] = "Air-Crouching", 
            [9] = "Freestanding"
        })
    }, 
    visuals = {
        type = other.start:list("      Dear Kitty, \vbe stronger \rthan the others!", "\v\f<paintbrush>    \rVisual", "\v\f<brackets-curly>    \rMisc"), 
        aspect = other.helping:switch("\v\f<image>    \rAspect Ratio", false, function(v103)
            return {
                val = v103:slider("Value", 0, 250, 100, 0.01), 
                pre1 = v103:button(" 16:10 ", nil, true), 
                pre2 = v103:button(" 16:9 ", nil, true), 
                pre3 = v103:button(" 5:4 ", nil, true), 
                pre4 = v103:button(" 4:3 ", nil, true), 
                pre5 = v103:button(" 3:2 ", nil, true)
            }, true;
        end), 
        viewmodel = other.helping:switch("\v\f<hand>    \rViewmodel Changer", false, function(v104)
            return {
                fov = v104:slider("Fov", 0, 1000, 600, 0.1), 
                x_axis = v104:slider("X", -100, 150, 15, 0.1), 
                y_axis = v104:slider("Y", -100, 150, 15, 0.1), 
                z_axis = v104:slider("Z", -100, 150, 15, 0.1)
            }, true;
        end), 
        animbreakers = other.helping:switch("\v\f<cube>    \rAnimation", false, function(v105)
            return {
                ground = v105:combo("On ground", {
                    [1] = "Disabled", 
                    [2] = "Reversed", 
                    [3] = "Moonwalk"
                }), 
                air = v105:combo("In air", {
                    [1] = "Disabled", 
                    [2] = "Static", 
                    [3] = "Moonwalk"
                }), 
                addons = v105:selectable("Addons", {
                    [1] = "Move Lean", 
                    [2] = "Earthquake"
                }), 
                movelean = v105:slider("Move line", 0, 100, 100, nil, "%")
            }, true;
        end), 
        scope = other.visuals:switch("\v\f<heat>    \rScope Lines", false, function(v106)
            return {
                color = v106:color_picker("Color", color(255)), 
                length = v106:slider("Length", 0, 275, 210), 
                gap = v106:slider("Gap", 0, 100, 3), 
                select = v106:listable("", "Animation Zoom", "Keep Model Transparency"), 
                fov = v106:slider("Amount \v[FOV]", -30, 30, 0, 1, "%"), 
                types = v106:selectable("Type \v[#]", {
                    [1] = "On Scope", 
                    [2] = "On Nade"
                }), 
                scoped = v106:slider("Amount \v[scope]", 15, 255, 155, 1, "%"), 
                nade = v106:slider("Amount \v[nade]", 15, 255, 155, 1, "%")
            }, true;
        end), 
        mindmg = other.visuals:switch("\v\f<raindrops>    \rDamage", false, function(v107)
            -- upvalues: l_x_0 (ref), l_y_0 (ref)
            return {
                damage_selection = v107:list("", {
                    [1] = "Default", 
                    [2] = "Pixel"
                }), 
                damage_color = v107:color_picker("Color", color(255)), 
                damage_alpha = v107:slider("In Scope" .. " [Alpha]", 25, 70, 50, 1, "%"), 
                damage_position_x = v107:slider("First", 0, l_x_0, 968), 
                damage_position_y = v107:slider("Second", 0, l_y_0, 522)
            }, true;
        end), 
        manual_arrows = other.visuals:switch("\v\f<brackets-round>    \rArrows", false, function(v108)
            return {
                styled = v108:list("", {
                    [1] = "Default", 
                    [2] = "Modern"
                }), 
                color_arrows = v108:color_picker("Color", color(247, 175, 255, 255)), 
                slider_arrows_x = v108:slider("Offset X", 0, 70, 5)
            }, true;
        end), 
        addons = other.esnt:switch("\v\f<star>  \rEssential \v[tools]", false, function(v109)
            return {
                typed = v109:listable("\n", "Super Toss", "Automatic Grenade Release", "Grenade Throw \v[fixed]", "Revolver Misfires \v[fixed]"), 
                amount = v109:slider("Amount \v[release]", 0, 50, 0, nil, "HP")
            }, true;
        end), 
        silenced = other.esnt:label("\v\f<microphone-slash>  \rMute/Unmute silenced", false, function(v110)
            return {
                selection = v110:list("", {
                    [1] = "Disabled", 
                    [2] = "Enemies", 
                    [3] = "Teammates", 
                    [4] = "Everyone"
                })
            };
        end), 
        widgets = other.setup:switch("\v\f<paintbrush>   \rNotifications", false, function(v111)
            return {
                pos = v111:selectable("Type", {
                    [1] = "Console", 
                    [2] = "Screen", 
                    [3] = "Hurt"
                }):depend(true), 
                typed = v111:combo("Style", {
                    [1] = "meow", 
                    [2] = "paw"
                }), 
                offset = v111:slider("Offset", 0, 200, 0), 
                color = v111:color_picker("Color", color(208, 191, 232, 255))
            }, true;
        end)
    }, 
    misc = {
        bars = other.setup:switch("\v\f<disease>   \rGame\vsense", false, function(v112)
            return {
                mode = v112:listable("", {
                    [1] = "Double Tap", 
                    [2] = "Hide Shots", 
                    [3] = "Dormant Aimbot", 
                    [4] = "Damage Override", 
                    [5] = "Hit/Miss", 
                    [6] = "Target Enemy", 
                    [7] = "Hitchance Override", 
                    [8] = "Lag Compensation", 
                    [9] = "Hitbox Override", 
                    [10] = "Fake Latency", 
                    [11] = "Fake Angles", 
                    [12] = "Fake Duck", 
                    [13] = "Body Aim", 
                    [14] = "Safe Points", 
                    [15] = "Freestanding", 
                    [16] = "Bomb Info"
                })
            }, true;
        end), 
        clantag = other.modifications:switch("\v\f<wand-magic-sparkles>   \rClantag Spammer"), 
        trashtalk = other.modifications:switch("\v\f<comments>   \rChat Spammer", false, function(v113)
            return {
                trashtalkmode = v113:listable("", {
                    [1] = "Kill", 
                    [2] = "Death", 
                    [3] = "Revenge"
                })
            }, true;
        end), 
        marker = other.setup:switch("\v\f<sparkles>   \rKitty Marker", false, function(v114)
            return {
                type_kotik = v114:list("", "\240\159\144\190 \208\161\208\187\208\176\208\180\208\186\208\176\209\143 \208\187\208\176\208\191\208\186\208\176", "\240\159\152\187 \208\163\208\187\209\139\208\177\208\176\209\142\209\137\208\184\208\185\209\129\209\143 \208\186\208\190\209\130\208\184\208\186", "\240\159\152\189 \208\166\208\181\208\187\209\131\209\142\209\137\208\184\208\185 \208\186\208\190\209\130\208\184\208\186", "\240\159\153\128 \208\163\209\129\209\130\208\176\208\187\209\139\208\185 \208\186\208\190\209\130\208\184\208\186", "\240\159\152\188 \208\154\208\190\209\130\208\184\208\186 \209\129 \208\186\209\128\208\184\208\178\208\190\208\185 \209\131\209\133\208\188\209\139\208\187\208\186\208\190\208\185")
            }, true;
        end), 
        aimtools = other.addons:switch("\v\f<screwdriver-wrench>    \rAimtools", false, function(v115)
            return {
                typing = v115:list("", "Lower than you", "Higher than you", "Adaptive Backtrack"), 
                adaptive = v115:switch("Enable \v[adaptive]"), 
                lower_enable = v115:switch("Enable \v[hitchance]"), 
                lower_slider = v115:slider("Amount \v[hitchance]", 0, 100, 0, nil, "%"), 
                high_enable = v115:switch("Enable \v[hitchance]"), 
                high_slider = v115:slider("Amount \v[hitchance]", 0, 100, 0, nil, "%"), 
                lower_enable_mp = v115:switch("Enable \v[multipoint]"), 
                head_l_slider_mp = v115:slider("Amount \v[head]", 0, 100, 0, nil, "%"), 
                body_l_slider_mp = v115:slider("Amount \v[body]", 0, 100, 0, nil, "%"), 
                high_enable_mp = v115:switch("Enable \v[multipoint]"), 
                head_h_slider_mp = v115:slider("Amount \v[head]", 0, 100, 0, nil, "%"), 
                body_h_slider_mp = v115:slider("Amount \v[body]", 0, 100, 0, nil, "%")
            }, true;
        end), 
        hitchance = other.addons:switch("\v\f<chart-tree-map>    \rHitchance Override", false, function(v116)
            return {
                inair_hc = v116:list("", {
                    [1] = "SSG-08", 
                    [2] = "Awp", 
                    [3] = "Auto Snipers", 
                    [4] = "Revolver"
                }), 
                enable_ssg = v116:switch("Enable \v[SSG-08]"), 
                enable_awp = v116:switch("Enable \v[Awp]"), 
                enable_at = v116:switch("Enable \v[Auto Snipers]"), 
                enable_r8 = v116:switch("Enable \v[Revolver]"), 
                ssg08_chance = v116:slider("Amount \v[air]", 0, 100, 0, 1, "%"), 
                awp_chance = v116:slider("Amount \v[air]", 0, 100, 0, 1, "%"), 
                atsniper_chance = v116:slider("Amount \v[air]", 0, 100, 0, 1, "%"), 
                revolver_chance = v116:slider("Amount \v[air]", 0, 100, 0, 1, "%"), 
                ssg08_nzchance = v116:slider("Amount \v[no zoom]", 0, 100, 0, 1, "%"), 
                awp_nzchance = v116:slider("Amount \v[no zoom]", 0, 100, 0, 1, "%"), 
                atsniper_nzchance = v116:slider("Amount \v[no zoom]", 0, 100, 0, 1, "%")
            }, true;
        end), 
        pingunlocker = other.addons:slider("\v\f<ethernet>    \rFake Latency", 0, 200, 0, nil, "ms"), 
        fastladder = other.modifications:switch("\v\f<umbrella>    \rFast Ladder"), 
        scout = other.esnt:switch("\v\f<person-ski-jumping>    \rJump Essential", false, function(v117)
            return {
                typed = v117:selectable("Type", "Adaptive Hitchance", "Limit Distance"), 
                dis_slider = v117:slider("Amount \v[distance]", 60, 1300, 0, nil, "u")
            }, true;
        end)
    }, 
    configs = {
        presets_name = info.config:input("Configuration name:"):depend(true), 
        presets_create = info.config:button("                               \v\f<paintbrush>  \rCreate                                ", function()
            create();
        end, true):depend(true), 
        presets_list = info.config:list("", presets_data.name), 
        presets_select = info.config:selectable("Categories", "Anti-aim", "Visuals", "Misc"), 
        presets_aa = info.config:button("    \v\f<spinner>  \rLoad    ", function()
            aa();
        end, true):tooltip("Loading configuration"), 
        presets_save = info.config:button("   \v\f<floppy-disk>  \rSave   ", function()
            save();
        end, true):tooltip("Save"), 
        presets_remove = info.config:button(" \aff4f4fff\f<trash> ", function()
            remove();
        end, true):tooltip("Remove"), 
        presets_import = info.config:button(" \v\f<file-import> ", function()
            import();
        end, true):tooltip("Import"), 
        presets_export = info.config:button(" \v\f<copy> ", function()
            export();
        end, true):tooltip("Export"), 
        presets_success_import = info.config:label("\a388539ff\f<file-import>  Successfully imported: \r"), 
        presets_success_export = info.config:label("\a388539ff\f<file-export>  Successfully exported: \r"), 
        presets_success_exist = info.config:label("\a853838ff\f<triangle-exclamation>  This preset already exist: \r"), 
        presets_success_importfailed = info.config:label("\a853838ff\f<triangle-exclamation>  Invalid preset")
    }
};
v42.visuals.widgets.pos:depend({
    [1] = nil, 
    [2] = true, 
    [1] = v42.visuals.widgets
});
info.active:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v42.information.categories
});
info.general:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v42.information.categories
});
info.config:depend({
    [1] = nil, 
    [2] = 4, 
    [1] = v42.information.categories
});
info.selectab:depend({
    [1] = nil, 
    [2] = 4, 
    [1] = v42.information.categories
});
v42.visuals.addons.amount:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v42.visuals.addons.typed
});
v42.misc.aimtools.lower_slider:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v42.misc.aimtools.typing
}, {
    [1] = nil, 
    [2] = true, 
    [1] = v42.misc.aimtools.lower_enable
});
v42.misc.aimtools.high_slider:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v42.misc.aimtools.typing
}, {
    [1] = nil, 
    [2] = true, 
    [1] = v42.misc.aimtools.high_enable
});
v42.misc.aimtools.lower_enable:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v42.misc.aimtools.typing
});
v42.misc.aimtools.high_enable:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v42.misc.aimtools.typing
});
v42.misc.aimtools.head_l_slider_mp:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v42.misc.aimtools.typing
}, {
    [1] = nil, 
    [2] = true, 
    [1] = v42.misc.aimtools.lower_enable_mp
});
v42.misc.aimtools.body_l_slider_mp:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v42.misc.aimtools.typing
}, {
    [1] = nil, 
    [2] = true, 
    [1] = v42.misc.aimtools.lower_enable_mp
});
v42.misc.aimtools.lower_enable_mp:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v42.misc.aimtools.typing
});
v42.misc.aimtools.head_h_slider_mp:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v42.misc.aimtools.typing
}, {
    [1] = nil, 
    [2] = true, 
    [1] = v42.misc.aimtools.high_enable_mp
});
v42.misc.aimtools.body_h_slider_mp:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v42.misc.aimtools.typing
}, {
    [1] = nil, 
    [2] = true, 
    [1] = v42.misc.aimtools.high_enable_mp
});
v42.misc.aimtools.high_enable_mp:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v42.misc.aimtools.typing
});
v42.misc.aimtools.adaptive:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v42.misc.aimtools.typing
});
v42.misc.scout.dis_slider:depend({
    [1] = nil, 
    [2] = "Limit Distance", 
    [1] = v42.misc.scout.typed
});
v42.visuals.scope.types:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v42.visuals.scope.select
});
v42.visuals.scope.fov:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v42.visuals.scope.select
});
v42.visuals.scope.scoped:depend({
    [1] = nil, 
    [2] = "On Scope", 
    [1] = v42.visuals.scope.types
}, {
    [1] = nil, 
    [2] = 2, 
    [1] = v42.visuals.scope.select
});
v42.visuals.scope.nade:depend({
    [1] = nil, 
    [2] = "On Nade", 
    [1] = v42.visuals.scope.types
}, {
    [1] = nil, 
    [2] = 2, 
    [1] = v42.visuals.scope.select
});
v42.builder.lagger.enb:depend({
    [1] = nil, 
    [2] = nil, 
    [3] = true, 
    [1] = v42.builder.lagger.guns, 
    [2] = function()
        -- upvalues: v42 (ref)
        for _, v119 in ipairs(v42.builder.lagger.guns:get()) do
            if v119 == 1 or v119 == 2 or v119 == 3 then
                return true;
            end;
        end;
        return false;
    end
});
v42.builder.lagger.guns:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v42.builder.lagger.types
});
v42.builder.lagger.enb:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v42.builder.lagger.types
});
v42.builder.lagger.slider:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v42.builder.lagger.types
});
v42.builder.type:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v42.information.categories
});
v42.builder.manual:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v42.builder.type
}, {
    [1] = nil, 
    [2] = 2, 
    [1] = v42.information.categories
});
v42.builder.freestanding:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v42.builder.type
}, {
    [1] = nil, 
    [2] = 2, 
    [1] = v42.information.categories
});
v42.builder.avoidbk:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v42.builder.type
}, {
    [1] = nil, 
    [2] = 2, 
    [1] = v42.information.categories
});
v42.builder.safe:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v42.builder.type
}, {
    [1] = nil, 
    [2] = 2, 
    [1] = v42.information.categories
});
v42.builder.disablers:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v42.builder.type
}, {
    [1] = nil, 
    [2] = 2, 
    [1] = v42.information.categories
});
v42.builder.edgeyaw:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v42.builder.type
}, {
    [1] = nil, 
    [2] = 2, 
    [1] = v42.information.categories
});
v42.builder.conditions:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v42.builder.type
}, {
    [1] = nil, 
    [2] = 2, 
    [1] = v42.information.categories
});
v42.builder.lagger:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v42.builder.type
}, {
    [1] = nil, 
    [2] = 2, 
    [1] = v42.information.categories
});
v42.builder.auto_os:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v42.builder.type
}, {
    [1] = nil, 
    [2] = 2, 
    [1] = v42.information.categories
});
v42.visuals.aspect:tooltip("\v\194\187  \rThis tool allows you to stretch your game image without any loss of quality!");
v42.visuals.viewmodel:tooltip("\v\194\187  \rThis feature allows you to adjust the position of your hands!");
v42.misc.bars:tooltip("\v\194\187  \rThis feature displays the active binds you are using, and they appear on the left si de of your screen!");
v42.visuals.manual_arrows:tooltip("\v\194\187  \rThis feature shows your turning angle through Manual Yaw!");
v42.visuals.scope:tooltip("\v\194\187  \rThis feature allows you to customize the Scope Overlay exactly how you want!");
v42.misc.scout:tooltip("\v\194\187  \rThis feature allows you to easily shoot in the air while holding the SSG-08 and jumping!");
v42.misc.pingunlocker:tooltip("\v\194\187  \rThis feature removes the limit on a specific value for raising the fake ping!");
v42.visuals.silenced:tooltip("\v\194\187  \rThis feature allows you to block the voice chat for yourself on a specific side: Enemy / Teammate / Everyone!");
v42.misc.hitchance:tooltip("\v\194\187  \rThis feature allows you to set a specific value for the selected weapon from the list, as well as for the mode!");
v42.visuals.mindmg:tooltip("\v\194\187  \rThis feature displays the actual damage value used for your weapon type!");
v42.misc.marker:tooltip("\v\194\187  \rThis feature displays a cute kitten when you hit an opponent!");
v42.misc.clantag:tooltip("\v\194\187  \rThis feature displays the clan tag of our product in the Tab!");
v42.misc.trashtalk:tooltip("\v\194\187  \rThis feature sends messages in the chat upon killing, dying, or assisting in a kill!");
v42.visuals.animbreakers:tooltip("\v\194\187  \rThis feature changes the behavior of your local character's legs!");
v42.configs.presets_create:depend({
    [1] = v42.configs.presets_name, 
    [2] = function()
        -- upvalues: v42 (ref)
        return v42.configs.presets_name:get():len() > 0;
    end
});
antiaim.preset_manager:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v42.builder.type
});
v42.visuals.type:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v42.information.categories
});
other.visuals:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v42.visuals.type
}, {
    [1] = nil, 
    [2] = 3, 
    [1] = v42.information.categories
});
other.setup:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v42.visuals.type
}, {
    [1] = nil, 
    [2] = 3, 
    [1] = v42.information.categories
});
other.addons:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v42.visuals.type
}, {
    [1] = nil, 
    [2] = 3, 
    [1] = v42.information.categories
});
other.modifications:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v42.visuals.type
}, {
    [1] = nil, 
    [2] = 3, 
    [1] = v42.information.categories
});
other.esnt:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v42.visuals.type
}, {
    [1] = nil, 
    [2] = 3, 
    [1] = v42.information.categories
});
other.helping:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v42.visuals.type
}, {
    [1] = nil, 
    [2] = 3, 
    [1] = v42.information.categories
});
v42.visuals.animbreakers.movelean:depend({
    [1] = nil, 
    [2] = "Move Lean", 
    [1] = v42.visuals.animbreakers.addons
});
v42.visuals.widgets.color:depend({
    [1] = nil, 
    [2] = true, 
    [1] = v42.visuals.widgets
}, {
    [1] = nil, 
    [2] = "Screen", 
    [1] = v42.visuals.widgets.pos
});
v42.visuals.widgets.typed:depend({
    [1] = nil, 
    [2] = true, 
    [1] = v42.visuals.widgets
}, {
    [1] = nil, 
    [2] = "Screen", 
    [1] = v42.visuals.widgets.pos
});
v42.visuals.widgets.offset:depend({
    [1] = nil, 
    [2] = "Screen", 
    [1] = v42.visuals.widgets.pos
});
v42.visuals.widgets.offset:depend({
    [1] = nil, 
    [2] = "Screen", 
    [1] = v42.visuals.widgets.pos
});
v42.visuals.widgets.offset:depend({
    [1] = nil, 
    [2] = true, 
    [1] = v42.visuals.widgets
});
v42.misc.hitchance.enable_ssg:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v42.misc.hitchance.inair_hc
});
v42.misc.hitchance.enable_awp:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v42.misc.hitchance.inair_hc
});
v42.misc.hitchance.enable_at:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v42.misc.hitchance.inair_hc
});
v42.misc.hitchance.enable_r8:depend({
    [1] = nil, 
    [2] = 4, 
    [1] = v42.misc.hitchance.inair_hc
});
v42.misc.hitchance.ssg08_chance:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v42.misc.hitchance.inair_hc
}, {
    [1] = nil, 
    [2] = true, 
    [1] = v42.misc.hitchance.enable_ssg
});
v42.misc.hitchance.awp_chance:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v42.misc.hitchance.inair_hc
}, {
    [1] = nil, 
    [2] = true, 
    [1] = v42.misc.hitchance.enable_awp
});
v42.misc.hitchance.atsniper_chance:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v42.misc.hitchance.inair_hc
}, {
    [1] = nil, 
    [2] = true, 
    [1] = v42.misc.hitchance.enable_at
});
v42.misc.hitchance.revolver_chance:depend({
    [1] = nil, 
    [2] = 4, 
    [1] = v42.misc.hitchance.inair_hc
}, {
    [1] = nil, 
    [2] = true, 
    [1] = v42.misc.hitchance.enable_r8
});
v42.misc.hitchance.ssg08_nzchance:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v42.misc.hitchance.inair_hc
}, {
    [1] = nil, 
    [2] = true, 
    [1] = v42.misc.hitchance.enable_ssg
});
v42.misc.hitchance.awp_nzchance:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v42.misc.hitchance.inair_hc
}, {
    [1] = nil, 
    [2] = true, 
    [1] = v42.misc.hitchance.enable_awp
});
v42.misc.hitchance.atsniper_nzchance:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v42.misc.hitchance.inair_hc
}, {
    [1] = nil, 
    [2] = true, 
    [1] = v42.misc.hitchance.enable_at
});
v42.builder.safe.select:depend({
    [1] = nil, 
    [2] = true, 
    [1] = v42.builder.safe
});
local v120 = false;
local v121 = render.screen_size();
local v122 = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage");
local l_rect_0 = render.rect;
local l_shadow_0 = render.shadow;
render_rect = function(v125, v126, ...)
    -- upvalues: l_rect_0 (ref)
    return l_rect_0(v125, v125 + v126, ...);
end;
render_shadow = function(v127, v128, v129, v130, v131, v132)
    -- upvalues: l_shadow_0 (ref)
    return l_shadow_0(v127, v128, v129, v130, v131, v132);
end;
local v145 = l_system_0.register({
    [1] = v42.visuals.mindmg.damage_position_x, 
    [2] = v42.visuals.mindmg.damage_position_y
}, vector(21, 21), "damage_drag", function(v133)
    -- upvalues: v42 (ref), v120 (ref), v91 (ref), v121 (ref), v122 (ref)
    if not v42.visuals.mindmg:get() then
        return;
    else
        local v134 = v42.visuals.mindmg.damage_color:get();
        local v135 = v42.visuals.mindmg.damage_alpha:get();
        local v136 = entity.get_local_player();
        if not v136 or not v136:is_alive() then
            return;
        else
            v120 = v133.is_dragging;
            v133.last_position = v133.position;
            local v137 = v91.new("blur_animation", v120 and 1 or 0, 6, 0);
            local v138 = v91.new("font_alpha", 1, 6, 0);
            local v139 = ui.get_mouse_position();
            local v140 = 25 + v135 / 100 * 45;
            local v141 = nil;
            if v136.m_bIsScoped then
                if v140 <= 25 then
                    v141 = 255;
                    goto label0 --[[  true, true  ]];
                else
                    local v142 = 255 * (1 - (v140 - 25) / 45);
                    if v142 then
                        v141 = v142;
                        goto label0 --[[  true, true  ]];
                    end;
                end;
            end;
            v141 = 255;
            ::label0::;
            v133.position.x = math.clamp(v133.position.x, v121.x / 2 - 100, v121.x / 2 + 79);
            v133.position.y = math.clamp(v133.position.y, v121.y / 2 - 100, v121.y / 2 + 79);
            v134.a = v91.new("damage_scope_alpha_animation", v141, 6, 0);
            local v143 = v91.new("geton_animation", v133:is_in_area(v139) and 1 or 0, 6, 0);
            render_shadow(vector(0, 0), vector(v121.x, v121.y), color(0, 0, 0, 125 * v137), 10, 5, 5);
            render_rect(vector(0, 0), vector(v121.x, v121.y), color(0, 0, 0, 125 * v137));
            render_rect(vector(v121.x / 2 - 100, v121.y / 2 - 100), vector(200, 200), color(255, 255, 255, 20 * v137 * ui.get_alpha()), 6);
            render_rect(vector(v133.position.x, v133.position.y), vector(v133.size.x, v133.size.y), color(255, 255, 255, 40 * ui.get_alpha() * v143), 6);
            local v144 = v42.visuals.mindmg.damage_selection:get();
            render.text(v144, vector(v133.position.x + v133.size.x / 2, v133.position.y + v133.size.y / 2), color(v134.r, v134.g, v134.b, v134.a * v138), "c", v122:get());
            return;
        end;
    end;
end);
events.render:set(function()
    -- upvalues: v145 (ref)
    v145:update();
end);
v42.visuals.mindmg.damage_position_x:visibility(false);
v42.visuals.mindmg.damage_position_y:visibility(false);
local v146 = math.floor(globals.realtime);
local v147 = math.floor(globals.realtime / 3600);
local v148 = math.floor(globals.realtime / 60);
if v146 == 1 and v147 < 1 and v148 < 1 then
    v38 = v146 .. " second";
elseif v146 >= 2 and v147 < 1 and v148 < 1 then
    v38 = v146 .. " seconds";
elseif v148 >= 2 and v147 < 1 then
    v38 = v148 .. " minutes";
elseif v148 == 1 and v147 < 1 then
    v38 = v148 .. " minute";
elseif v147 < 2 then
    v38 = v147 .. " hour";
elseif v147 >= 2 then
    v38 = v147 .. " hours";
end;
v42.information.session_button:name("\v" .. v38);
fakelatency = function()
    -- upvalues: v42 (ref), v88 (ref)
    if v42.misc.pingunlocker:get() then
        cvar.sv_maxunlag:float(0.4);
        v88.ping:override(v42.misc.pingunlocker:get());
    else
        cvar.sv_maxunlag:float(0.2);
        v88.ping:override();
    end;
end;
events.render:set(function()
    fakelatency();
end);
building = {};
building.start = {};
for v149 = 1, #condition do
    building.start[v149] = {
        state_enable = antiaim.condition:switch("\v\rOverride \v" .. condition[v149], false), 
        yaw = antiaim.first_builder:combo("\v\rYaw", {
            [1] = "Default", 
            [2] = "Left / Right"
        }), 
        offset_y = antiaim.first_builder:slider("\v \226\128\186   \rOffset", -90, 90, 0), 
        left_offset = antiaim.first_builder:slider("\v \226\128\186   \rMin. Offset ", -90, 90, 0), 
        right_offset = antiaim.first_builder:slider("\v \226\128\186   \rMax. Offset ", -90, 90, 0), 
        lr_smooth = antiaim.first_builder:slider("\v \226\128\186   \rSwitch ", 0, 10, 0), 
        modifier = antiaim.two_builder:combo("\v\rModifier", {
            [1] = "Disabled", 
            [2] = "Center", 
            [3] = "Offset", 
            [4] = "Random", 
            [5] = "Spin"
        }), 
        modifier_offset = antiaim.two_builder:slider("\v \226\128\186   \rOffset", -180, 180, 0), 
        modifier_randomize = antiaim.two_builder:slider("\v \226\128\186   \rRandomize", 0, 100, 0, 1, "%"), 
        bodyyaw = antiaim.three_builder:switch("\v\rDesync", false, function(v150)
            return {
                options_switch = v150:switch("Jitter mode"), 
                left_limit = v150:slider("\v \226\128\186   \rLeft limit", 0, 60, 60, nil, "\194\176"), 
                right_limit = v150:slider("\v \226\128\186   \rRight limit", 0, 60, 60, nil, "\194\176"), 
                delay = v150:slider("\v \226\128\186   \rDelay Tickount", 1, 10, 1, 1, "t"), 
                randomize = v150:slider("\v \226\128\186   \rRandomization", 0, 100, 0, 1, "%")
            }, true;
        end), 
        defensive = antiaim.four_builder:switch("\v\rDefensive anti-aim", false, function(v151)
            return {
                active = v151:selectable("Active", {
                    [1] = "Double Tap", 
                    [2] = "Hideshots"
                }), 
                pitch = v151:combo("Pitch", {
                    [1] = "Disabled", 
                    [2] = "Down", 
                    [3] = "Up", 
                    [4] = "Random", 
                    [5] = "Ways", 
                    [6] = "Wings", 
                    [7] = "Fluculate", 
                    [8] = "Customize"
                }), 
                p_random1 = v151:slider("First Degree", -89, 89, 0, 1), 
                p_random2 = v151:slider("Second Degree", -89, 89, 0, 1), 
                p_custom1 = v151:slider("First Degree", -89, 89, 0, 1), 
                p_custom2 = v151:slider("Second Degree", -89, 89, 0, 1), 
                pitch_fluculate_speed = v151:slider("Degree", 1, 12, 0, 1), 
                pitch_Ways_speed = v151:slider("Speed", 1, 4, 1), 
                yaw = v151:combo("Yaw", {
                    [1] = "Disabled", 
                    [2] = "Customize", 
                    [3] = "Forward", 
                    [4] = "Spin", 
                    [5] = "Random", 
                    [6] = "Sideways", 
                    [7] = "Crawling"
                }), 
                side_slider = v151:slider("Degree", -180, 180, 0, 1), 
                yaw_random1 = v151:slider("First Degree", -180, 180, 0, 1), 
                yaw_random2 = v151:slider("Second Degree", -180, 180, 0, 1), 
                yaw_spin_speed = v151:slider("Speed", 1, 15, 0, 1), 
                yaw_custom1 = v151:slider("First Degree", -180, 180, 0, 1), 
                yaw_custom2 = v151:slider("Second Degree", -180, 180, 0, 1)
            };
        end), 
        force_lc = antiaim.four_builder:switch("\v\rForce LC", false)
    };
end;
visibility = function()
    -- upvalues: v42 (ref)
    for v152 = 1, #condition do
        do
            local l_v152_0 = v152;
            cnd = function()
                -- upvalues: l_v152_0 (ref)
                if l_v152_0 ~= 1 then
                    return building.start[l_v152_0].state_enable:get();
                else
                    return true;
                end;
            end;
            local v154 = v42.builder.type:get() == 2;
            local v155 = v42.information.categories:get() == 2;
            building.start[l_v152_0].state_enable:visibility(v155 and v154 and v42.builder.conditions:get() == condition[l_v152_0] and l_v152_0 ~= 1);
            building.start[l_v152_0].yaw:visibility(v155 and v154 and v42.builder.conditions:get() == condition[l_v152_0] and cnd());
            building.start[l_v152_0].offset_y:visibility(v155 and v154 and v42.builder.conditions:get() == condition[l_v152_0] and building.start[l_v152_0].yaw:get() == "Default" and cnd());
            building.start[l_v152_0].left_offset:visibility(v155 and v154 and v42.builder.conditions:get() == condition[l_v152_0] and building.start[l_v152_0].yaw:get() ~= "Default" and cnd());
            building.start[l_v152_0].right_offset:visibility(v155 and v154 and v42.builder.conditions:get() == condition[l_v152_0] and building.start[l_v152_0].yaw:get() ~= "Default" and cnd());
            building.start[l_v152_0].lr_smooth:visibility(v155 and v154 and v42.builder.conditions:get() == condition[l_v152_0] and building.start[l_v152_0].yaw:get() ~= "Default" and cnd());
            building.start[l_v152_0].modifier:visibility(v155 and v154 and v42.builder.conditions:get() == condition[l_v152_0] and cnd());
            building.start[l_v152_0].modifier_offset:visibility(v155 and v154 and v42.builder.conditions:get() == condition[l_v152_0] and building.start[l_v152_0].modifier:get() ~= "Disabled" and building.start[l_v152_0].modifier:get() ~= "Customize" and cnd());
            building.start[l_v152_0].modifier_randomize:visibility(v155 and v154 and v42.builder.conditions:get() == condition[l_v152_0] and building.start[l_v152_0].modifier:get() ~= "Disabled" and cnd());
            building.start[l_v152_0].bodyyaw:visibility(v155 and v154 and v42.builder.conditions:get() == condition[l_v152_0] and cnd());
            building.start[l_v152_0].bodyyaw.left_limit:visibility(v155 and v154 and v42.builder.conditions:get() == condition[l_v152_0] and building.start[l_v152_0].bodyyaw:get() and cnd());
            building.start[l_v152_0].bodyyaw.right_limit:visibility(v155 and v154 and v42.builder.conditions:get() == condition[l_v152_0] and building.start[l_v152_0].bodyyaw:get() and cnd());
            building.start[l_v152_0].bodyyaw.randomize:visibility(v155 and v154 and v42.builder.conditions:get() == condition[l_v152_0] and building.start[l_v152_0].bodyyaw:get() and cnd());
            building.start[l_v152_0].force_lc:visibility(v155 and v154 and v42.builder.conditions:get() == condition[l_v152_0] and cnd());
            building.start[l_v152_0].defensive:visibility(v155 and v154 and v42.builder.conditions:get() == condition[l_v152_0] and cnd());
            building.start[l_v152_0].defensive.active:visibility(v155 and v154 and v42.builder.conditions:get() == condition[l_v152_0] and building.start[l_v152_0].defensive:get() and cnd());
            local v156 = building.start[l_v152_0].defensive.active:get();
            local v157 = false;
            for _, v159 in ipairs(v156) do
                if v159 == "Double Tap" or v159 == "Hideshots" then
                    v157 = true;
                    break;
                end;
            end;
            local v160 = v42.builder.conditions:get() == condition[l_v152_0] and building.start[l_v152_0].defensive:get() and cnd();
            local l_pitch_0 = building.start[l_v152_0].defensive.pitch;
            local l_l_pitch_0_0 = l_pitch_0;
            l_pitch_0 = l_pitch_0.visibility;
            local v163;
            if v157 then
                v163 = v160;
            else
                v163 = v157;
            end;
            l_pitch_0(l_l_pitch_0_0, v163);
            l_pitch_0 = building.start[l_v152_0].defensive.p_random1;
            l_l_pitch_0_0 = l_pitch_0;
            l_pitch_0 = l_pitch_0.visibility;
            if v157 then
                v163 = v160 and building.start[l_v152_0].defensive.pitch:get() == "Random";
            else
                v163 = v157;
            end;
            l_pitch_0(l_l_pitch_0_0, v163);
            l_pitch_0 = building.start[l_v152_0].defensive.p_random2;
            l_l_pitch_0_0 = l_pitch_0;
            l_pitch_0 = l_pitch_0.visibility;
            if v157 then
                v163 = v160 and building.start[l_v152_0].defensive.pitch:get() == "Random";
            else
                v163 = v157;
            end;
            l_pitch_0(l_l_pitch_0_0, v163);
            l_pitch_0 = building.start[l_v152_0].defensive.p_custom1;
            l_l_pitch_0_0 = l_pitch_0;
            l_pitch_0 = l_pitch_0.visibility;
            if v157 then
                v163 = v160 and building.start[l_v152_0].defensive.pitch:get() == "Customize";
            else
                v163 = v157;
            end;
            l_pitch_0(l_l_pitch_0_0, v163);
            l_pitch_0 = building.start[l_v152_0].defensive.p_custom2;
            l_l_pitch_0_0 = l_pitch_0;
            l_pitch_0 = l_pitch_0.visibility;
            if v157 then
                v163 = v160 and building.start[l_v152_0].defensive.pitch:get() == "Customize";
            else
                v163 = v157;
            end;
            l_pitch_0(l_l_pitch_0_0, v163);
            l_pitch_0 = building.start[l_v152_0].defensive.pitch_fluculate_speed;
            l_l_pitch_0_0 = l_pitch_0;
            l_pitch_0 = l_pitch_0.visibility;
            if v157 then
                v163 = v160 and building.start[l_v152_0].defensive.pitch:get() == "Fluculate";
            else
                v163 = v157;
            end;
            l_pitch_0(l_l_pitch_0_0, v163);
            l_pitch_0 = building.start[l_v152_0].defensive.pitch_Ways_speed;
            l_l_pitch_0_0 = l_pitch_0;
            l_pitch_0 = l_pitch_0.visibility;
            if v157 then
                v163 = v160 and building.start[l_v152_0].defensive.pitch:get() == "Ways";
            else
                v163 = v157;
            end;
            l_pitch_0(l_l_pitch_0_0, v163);
            l_pitch_0 = building.start[l_v152_0].defensive.yaw;
            l_l_pitch_0_0 = l_pitch_0;
            l_pitch_0 = l_pitch_0.visibility;
            if v157 then
                v163 = v160;
            else
                v163 = v157;
            end;
            l_pitch_0(l_l_pitch_0_0, v163);
            l_pitch_0 = building.start[l_v152_0].defensive.yaw_random1;
            l_l_pitch_0_0 = l_pitch_0;
            l_pitch_0 = l_pitch_0.visibility;
            if v157 then
                v163 = v160 and building.start[l_v152_0].defensive.yaw:get() == "Random";
            else
                v163 = v157;
            end;
            l_pitch_0(l_l_pitch_0_0, v163);
            l_pitch_0 = building.start[l_v152_0].defensive.yaw_random2;
            l_l_pitch_0_0 = l_pitch_0;
            l_pitch_0 = l_pitch_0.visibility;
            if v157 then
                v163 = v160 and building.start[l_v152_0].defensive.yaw:get() == "Random";
            else
                v163 = v157;
            end;
            l_pitch_0(l_l_pitch_0_0, v163);
            l_pitch_0 = building.start[l_v152_0].defensive.yaw_spin_speed;
            l_l_pitch_0_0 = l_pitch_0;
            l_pitch_0 = l_pitch_0.visibility;
            if v157 then
                v163 = v160 and building.start[l_v152_0].defensive.yaw:get() == "Spin";
            else
                v163 = v157;
            end;
            l_pitch_0(l_l_pitch_0_0, v163);
            l_pitch_0 = building.start[l_v152_0].defensive.side_slider;
            l_l_pitch_0_0 = l_pitch_0;
            l_pitch_0 = l_pitch_0.visibility;
            if v157 then
                v163 = v160 and building.start[l_v152_0].defensive.yaw:get() == "Sideways";
            else
                v163 = v157;
            end;
            l_pitch_0(l_l_pitch_0_0, v163);
            l_pitch_0 = building.start[l_v152_0].defensive.yaw_custom1;
            l_l_pitch_0_0 = l_pitch_0;
            l_pitch_0 = l_pitch_0.visibility;
            if v157 then
                v163 = v160 and building.start[l_v152_0].defensive.yaw:get() == "Customize";
            else
                v163 = v157;
            end;
            l_pitch_0(l_l_pitch_0_0, v163);
            l_pitch_0 = building.start[l_v152_0].defensive.yaw_custom2;
            l_l_pitch_0_0 = l_pitch_0;
            l_pitch_0 = l_pitch_0.visibility;
            if v157 then
                v163 = v160 and building.start[l_v152_0].defensive.yaw:get() == "Customize";
            else
                v163 = v157;
            end;
            l_pitch_0(l_l_pitch_0_0, v163);
        end;
    end;
end;
local _ = {};
stateid = 0;
local v165 = 1;
end_time = 0;
ground_ticks = v165;
yaw_modifier_offset = 0;
e_spam_trigger = false;
should_disable = false;
yawadd = 0;
yawadd2 = 0;
yaw_add = 0;
is_inverted = false;
inverter = false;
ticks = 0;
switch = false;
l_realtime_0 = globals.realtime;
settings_aa = function(v166)
    -- upvalues: v87 (ref), v42 (ref)
    local v167 = entity.get_local_player();
    if v167 == nil or not v167:is_alive() then
        return;
    else
        in_air = function()
            if not entity.get_local_player() == nil then
                return;
            else
                if bit.band(entity.get_local_player().m_fFlags, 1) == 1 then
                    ground_ticks = ground_ticks + 1;
                else
                    ground_ticks = 0;
                    end_time = globals.curtime + 1;
                end;
                return ground_ticks > 1 and end_time > globals.curtime;
            end;
        end;
        get_player_state = function(_)
            -- upvalues: v87 (ref)
            in_air();
            local v169 = entity.get_local_player();
            local v170 = bit.band(v169.m_fFlags, bit.lshift(1, 0)) ~= 0;
            local v171 = end_time > globals.curtime + 0.9;
            local v172 = v87.slow_walk:get();
            local v173 = bit.band(v169.m_fFlags, bit.lshift(1, 1)) ~= 0 or v87.fake_duck:get();
            local l_x_1 = v169.m_vecVelocity.x;
            local l_y_1 = v169.m_vecVelocity.y;
            local _ = v169.m_vecVelocity.z;
            local v177 = math.sqrt(l_x_1 ^ 2 + l_y_1 ^ 2);
            local v178 = v177 > 20;
            if v87.freestanding:get_override() then
                return "FREESTANDING";
            elseif v172 and v170 and v177 > 0 and v177 < 100 then
                return "SLOW-WALK";
            else
                if v170 then
                    if not v178 and not v173 then
                        return "STANDING";
                    elseif v178 and not v173 then
                        return "MOVING";
                    elseif v173 and not v178 then
                        return "CROUCH";
                    elseif v173 and v178 then
                        return "CROUCH-MOVING";
                    end;
                end;
                if not v170 then
                    if v171 and not v173 then
                        return "AIR";
                    elseif v173 and (v171 or not v170) then
                        return "AIR-C";
                    end;
                end;
                return;
            end;
        end;
        local v179 = {
            ["AIR-C"] = 8, 
            AIR = 7, 
            ["CROUCH-MOVING"] = 6, 
            CROUCH = 5, 
            MOVING = 3, 
            STANDING = 2, 
            ["SLOW-WALK"] = 4, 
            FREESTANDING = 9
        };
        local v180 = get_player_state(v166);
        stateid = 1;
        if building.start[v179[v180]] and building.start[v179[v180]].state_enable:get() then
            stateid = v179[v180];
        end;
        local v181 = v167:get_player_weapon();
        if v181 == nil then
            return;
        else
            local v182 = v181:get_classname();
            if v182 == nil then
                return;
            else
                if v166.choked_commands == 0 then
                    v87.pitch:override("Down");
                    v87.yaw:override("Backward");
                    v87.yaw_base:override("At Target");
                    v87.avoid_backstab:override(v42.builder.avoidbk:get());
                    is_inverted = not rage.antiaim:inverter();
                    if building.start[stateid].bodyyaw.delay:get() > 1 then
                        ticks = ticks + 1;
                        if ticks > building.start[stateid].bodyyaw.delay:get() then
                            ticks = 0;
                            switch = not switch;
                        end;
                        is_inverted = switch;
                    end;
                    v87.bodyyaw:override(building.start[stateid].bodyyaw:get());
                    if building.start[stateid].bodyyaw:get() then
                        if building.start[stateid].bodyyaw.options_switch:get("Jitter") then
                            if building.start[stateid].bodyyaw.delay:get() > 1 then
                                v87.bodyyaw_inverter:override(is_inverted);
                                v87.options:override("");
                            else
                                v87.bodyyaw_inverter:override();
                                v87.options:override("Jitter");
                            end;
                        else
                            v87.options:override("");
                        end;
                        v87.bodyyaw_left_limit:override(building.start[stateid].bodyyaw.randomize:get() > 0 and utils.random_int(building.start[stateid].bodyyaw.left_limit:get() - building.start[stateid].bodyyaw.randomize:get() / 100 * building.start[stateid].bodyyaw.left_limit:get(), building.start[stateid].bodyyaw.left_limit:get()) or building.start[stateid].bodyyaw.left_limit:get());
                        v87.bodyyaw_right_limit:override(building.start[stateid].bodyyaw.randomize:get() > 0 and utils.random_int(building.start[stateid].bodyyaw.right_limit:get() - building.start[stateid].bodyyaw.randomize:get() / 100 * building.start[stateid].bodyyaw.right_limit:get(), building.start[stateid].bodyyaw.right_limit:get()) or building.start[stateid].bodyyaw.right_limit:get());
                        v87.bodyyaw_freestanding:override("Off");
                    end;
                    v87.yaw_modifier:override(building.start[stateid].modifier:get());
                    v87.yaw_modifier_offset:override(building.start[stateid].modifier_offset:get());
                    v87.bodyyaw_left_limit:override(building.start[stateid].bodyyaw.randomize:get() > 0 and utils.random_int(building.start[stateid].bodyyaw.left_limit:get() - building.start[stateid].bodyyaw.randomize:get() / 100 * building.start[stateid].bodyyaw.left_limit:get(), building.start[stateid].bodyyaw.left_limit:get()) or building.start[stateid].bodyyaw.left_limit:get());
                    v87.bodyyaw_right_limit:override(building.start[stateid].bodyyaw.randomize:get() > 0 and utils.random_int(building.start[stateid].bodyyaw.right_limit:get() - building.start[stateid].bodyyaw.randomize:get() / 100 * building.start[stateid].bodyyaw.right_limit:get(), building.start[stateid].bodyyaw.right_limit:get()) or building.start[stateid].bodyyaw.right_limit:get());
                    local function v187(v183, v184)
                        local v185 = 0;
                        for _ = 1, 3 do
                            v185 = v185 + utils.random_int(-v184, v184);
                        end;
                        return v183 + v185 / 3;
                    end;
                    do
                        local l_v187_0 = v187;
                        local function v194(v189, v190, v191)
                            -- upvalues: l_v187_0 (ref)
                            if v190 <= 0 then
                                return v189;
                            else
                                local v192 = v190 / 100 * v189;
                                local v193 = math.sin(v191 * math.pi / 4) * 0.5 + 1;
                                return l_v187_0(v189, v192) * v193;
                            end;
                        end;
                        local v195 = building.start[stateid].yaw:get();
                        local v196 = nil;
                        local v197 = tonumber(stateid) or 1;
                        if v197 == nil then
                            v197 = 1;
                        end;
                        if v195 == "Left / Right" then
                            local v198 = building.start[stateid].left_offset:get();
                            local v199 = building.start[stateid].right_offset:get();
                            local v200 = building.start[stateid].lr_smooth:get() or 5;
                            v198 = v194(v198, yaw_randomize or 10, v197);
                            v199 = v194(v199, yaw_randomize or 10, v197 + 1);
                            local v201 = math.abs(v198 - v199);
                            local v202 = v201 * 0.1 * (v200 / 5) ^ 1.5;
                            local v203 = v201 * 0.5;
                            v202 = math.min(math.max(v202, -v203), v203) * (1 + 0.1 * math.sin(v197 * math.pi / 4));
                            v198 = v198 + (is_inverted and v202 or -v202);
                            v199 = v199 + (is_inverted and -v202 or v202);
                            local v204 = math.max(math.abs(v198), math.abs(v199)) * 2;
                            v198 = math.min(math.max(v198, -v204), v204);
                            v199 = math.min(math.max(v199, -v204), v204);
                            v196 = is_inverted and v198 or v199;
                        else
                            v196 = v194(building.start[stateid].offset_y:get(), yaw_randomize or 10, v197);
                        end;
                        if building.start[stateid].modifier:get() ~= "Disabled" then
                            local v205 = building.start[stateid].modifier_offset:get();
                            local v206 = building.start[stateid].modifier_randomize:get();
                            local l_v205_0 = v205;
                            if v206 > 0 then
                                local v208 = v206 / 100 * math.abs(v205);
                                l_v205_0 = v205 + utils.random_int(-v208, v208);
                            end;
                            v196 = v196 + (is_inverted and 0.5 or -0.5) * l_v205_0;
                            v87.yaw_modifier:override("Disabled");
                            v87.yaw_modifier_offset:override(0);
                            v87.yaw_offset:override(v196);
                        end;
                    end;
                end;
                if building.start[stateid].bodyyaw.options_switch:get() then
                    v87.left_limit:override(building.start[stateid].bodyyaw.left_limit:get());
                    v87.right_limit:override(building.start[stateid].bodyyaw.right_limit:get());
                    v87.left_limit:override(building.start[stateid].bodyyaw.randomize:get() > 0 and utils.random_int(building.start[stateid].bodyyaw.left_limit:get() - building.start[stateid].bodyyaw.randomize:get() / 100 * building.start[stateid].bodyyaw.left_limit:get(), building.start[stateid].bodyyaw.left_limit:get()) or building.start[stateid].bodyyaw.left_limit:get());
                    v87.right_limit:override(building.start[stateid].bodyyaw.randomize:get() > 0 and utils.random_int(building.start[stateid].bodyyaw.right_limit:get() - building.start[stateid].bodyyaw.randomize:get() / 100 * building.start[stateid].bodyyaw.right_limit:get(), building.start[stateid].bodyyaw.right_limit:get()) or building.start[stateid].bodyyaw.right_limit:get());
                end;
                if v42.builder.safe:get() then
                    local _ = v167:get_origin():length2dsqr();
                    local _ = v42.builder.safe.select:get();
                    if v42.builder.safe:get() then
                        e_spam_trigger = false;
                        safe_function = function()
                            -- upvalues: v87 (ref)
                            v87.pitch:override("Down");
                            v87.offset_y:override(0);
                            v87.modifier:override("Disabled");
                            v87.modifier_offset:override(0);
                            v87.bodyyaw:override(true);
                            v87.options:override("");
                            v87.left_limit:override(0);
                            v87.right_limit:override(0);
                            v87.bodyyaw_freestanding:override("Off");
                        end;
                        if (v42.builder.safe.select:get(1) and v182 == "CKnife" or v42.builder.safe.select:get(2) and v182 == "CWeaponTaser") and get_player_state(v166) == "AIR-C" or v42.builder.safe.select:get(3) and get_player_state(v166) == "STANDING" or v42.builder.safe.select:get(4) and get_player_state(v166) == "CROUCH" or v42.builder.safe.select:get(5) and get_player_state(v166) == "AIR-C" then
                            safe_function();
                            e_t = v42.builder.safe.select:get(1) or v42.builder.safe.select:get(2) or v42.builder.safe.select:get(3) or v42.builder.safe.select:get(4) or v42.builder.safe.select:get(5);
                            e_spam_trigger = true;
                        end;
                    end;
                    if building.start[stateid].force_lc:get() then
                        v87.lag_options:override("Always On");
                        v87.hide_shots_options:override("Break LC");
                    else
                        v87.lag_options:override("On Peek");
                        v87.hide_shots_options:override("Favor Fire Rate");
                    end;
                    local v211 = 0;
                    v211 = v211 + 6 * (v211 < 89 and 1 or -1);
                    if v211 >= 89 or v211 <= -89 then
                        v211 = -89;
                    end;
                    if v181:get_weapon_info() == nil then
                        return;
                    else
                        if building.start[stateid].defensive:get() then
                            v87.hidden_yaw:set(true);
                            local l_defensive_0 = building.start[stateid].defensive;
                            local v213 = l_defensive_0.pitch:get();
                            local v214 = l_defensive_0.yaw:get();
                            if v213 == "Disabled" then
                                rage.antiaim:override_hidden_pitch(0);
                            elseif v213 == "Down" then
                                rage.antiaim:override_hidden_pitch(89);
                            elseif v213 == "Up" then
                                rage.antiaim:override_hidden_pitch(-89);
                            elseif v213 == "Random" then
                                rage.antiaim:override_hidden_pitch(math.random(l_defensive_0.p_random1:get(), l_defensive_0.p_random2:get()));
                            elseif v213 == "Wings" then
                                rage.antiaim:override_hidden_pitch(v211);
                            elseif v213 == "Fluculate" then
                                local v215 = l_defensive_0.pitch_fluculate_speed:get();
                                rage.antiaim:override_hidden_pitch(-1 + -math.sin(globals.curtime * v215) * 40);
                            elseif v213 == "Ways" then
                                local v216 = math.sin(building.start[stateid].defensive.pitch_Ways_speed:get() * 0.5 * globals.curtime) * 89;
                                rage.antiaim:override_hidden_pitch(v216);
                            elseif v213 == "Customize" then
                                rage.antiaim:override_hidden_pitch(not rage.antiaim:inverter() and l_defensive_0.p_custom1:get() or l_defensive_0.p_custom2:get());
                            end;
                            if v214 == "Sideways" then
                                local v217 = l_defensive_0.side_slider:get();
                                rage.antiaim:override_hidden_yaw_offset(not rage.antiaim:inverter() and -v217 or v217);
                            elseif v214 == "Forward" then
                                rage.antiaim:override_hidden_yaw_offset(-180);
                            elseif v214 == "Crawling" then
                                rage.antiaim:override_hidden_yaw_offset(not rage.antiaim:inverter() and globals.tickcount % 20 < 10 and 120 or -120);
                            elseif v214 == "Spin" then
                                yawadd = yawadd >= 180 and -180 or yawadd + l_defensive_0.yaw_spin_speed:get();
                                rage.antiaim:override_hidden_yaw_offset(yawadd);
                            elseif v214 == "Random" then
                                rage.antiaim:override_hidden_yaw_offset(math.random(l_defensive_0.yaw_random1:get(), l_defensive_0.yaw_random2:get()));
                            elseif v214 == "Customize" then
                                rage.antiaim:override_hidden_yaw_offset(not rage.antiaim:inverter() and l_defensive_0.yaw_custom1:get() or l_defensive_0.yaw_custom2:get());
                            end;
                        else
                            v87.hidden_yaw:set(false);
                        end;
                        if v42.builder.freestanding.peek:get() and (v87.freestanding:get() or v42.builder.freestanding:get()) then
                            v87.lag_options:override("Always On");
                            v87.hidden_yaw:set(true);
                            v87.yaw_offset:set(0);
                            v87.yaw_modifier:override("Disabled");
                            v87.bodyyaw:override(v42.builder.freestanding.peek:get());
                            rage.antiaim:override_hidden_yaw_offset(-180);
                            rage.antiaim:override_hidden_pitch(math.random(-10, 10));
                        end;
                    end;
                end;
                if stateid == 9 then
                    if v42.builder.freestanding:get() then
                        v87.freestanding:override(true);
                        if v42.builder.freestanding.static_yaw:get() then
                            v87.yaw:override("Backward");
                            v87.yaw_base:override("Local View");
                            v87.bodyyaw:override(true);
                            v87.options:override("");
                            v87.left_limit:override(60);
                            v87.right_limit:override(60);
                            v87.bodyyaw_freestanding:override("Off");
                            rage.antiaim:inverter(false);
                            v87.modifier:override("Disabled");
                            v87.modifier_offset:override(0);
                            v87.offset_y:override(0);
                        end;
                    else
                        v87.freestanding:override(false);
                    end;
                    v87.pitch:override("Down");
                    v87.yaw:override("Backward");
                    v87.yaw_base:override("At Target");
                    is_inverted = not rage.antiaim:inverter();
                    if building.start[stateid].bodyyaw.delay:get() > 1 then
                        ticks = ticks + 1;
                        if ticks > building.start[stateid].bodyyaw.delay:get() then
                            ticks = 0;
                            switch = not switch;
                        end;
                        is_inverted = switch;
                    end;
                    v87.bodyyaw:override(building.start[stateid].bodyyaw:get());
                    if building.start[stateid].bodyyaw.options_switch:get("Jitter") then
                        if building.start[stateid].bodyyaw.delay:get() > 1 then
                            v87.bodyyaw_inverter:override(is_inverted);
                            v87.options:override("");
                        else
                            v87.bodyyaw_inverter:override(is_inverted);
                            v87.options:override("Jitter");
                        end;
                    end;
                    v87.bodyyaw_left_limit:override(building.start[stateid].bodyyaw.randomize:get() > 0 and utils.random_int(building.start[stateid].bodyyaw.left_limit:get() - building.start[stateid].bodyyaw.randomize:get() / 100 * building.start[stateid].bodyyaw.left_limit:get(), building.start[stateid].bodyyaw.left_limit:get()) or building.start[stateid].bodyyaw.left_limit:get());
                    v87.bodyyaw_right_limit:override(building.start[stateid].bodyyaw.randomize:get() > 0 and utils.random_int(building.start[stateid].bodyyaw.right_limit:get() - building.start[stateid].bodyyaw.randomize:get() / 100 * building.start[stateid].bodyyaw.right_limit:get(), building.start[stateid].bodyyaw.right_limit:get()) or building.start[stateid].bodyyaw.right_limit:get());
                    v87.bodyyaw_freestanding:override("Off");
                    if building.start[stateid].yaw:get() == "Left / Right" then
                        yaw_add = is_inverted and building.start[stateid].left_offset:get() or building.start[stateid].right_offset:get();
                    else
                        yaw_add = building.start[stateid].offset_y:get();
                    end;
                    v87.yaw_offset:override(yaw_add);
                    v87.yaw_modifier:override(building.start[stateid].modifier:get());
                    v87.yaw_modifier_offset:override(building.start[stateid].modifier_offset:get());
                elseif v42.builder.freestanding:get() then
                    v87.freestanding:override(true);
                    if v42.builder.freestanding.static_yaw:get() then
                        v87.yaw:override("Backward");
                        v87.yaw_base:override("Local View");
                        v87.bodyyaw:override(true);
                        v87.options:override("");
                        v87.left_limit:override(60);
                        v87.right_limit:override(60);
                        v87.bodyyaw_freestanding:override("Off");
                        rage.antiaim:inverter(false);
                        v87.modifier:override("Disabled");
                        v87.modifier_offset:override(0);
                        v87.offset_y:override(0);
                    end;
                else
                    v87.freestanding:override(false);
                end;
                if v42.builder.manual:get() == "Backward" then
                    v87.offset_y:override(180);
                    v87.yaw_base:override("Local View");
                elseif v42.builder.manual:get() == "Left" then
                    v87.offset_y:override(-90);
                    v87.yaw_base:override("Local View");
                elseif v42.builder.manual:get() == "Right" then
                    v87.offset_y:override(90);
                    v87.yaw_base:override("Local View");
                end;
                if v42.builder.manual.static_manuals:get() and v42.builder.manual:get() ~= "Disabled" then
                    v87.modifier:override("Disabled");
                    v87.modifier_offset:override(0);
                    v87.options:override("");
                    v87.left_limit:override(60);
                    v87.right_limit:override(60);
                    v87.bodyyaw_freestanding:override("Off");
                    rage.antiaim:inverter(false);
                end;
                if v42.builder.disablers:get() then
                    local v218 = building.start[stateid].force_lc:get();
                    if v42.builder.disablers.typed:get(1) and entity.get_game_rules().m_bWarmupPeriod then
                        v87.yaw:override("Static");
                        v87.pitch:override("Disabled");
                        v87.offset_y:override();
                        v87.modifier:override("Spin");
                        v87.modifier_offset:override(360);
                        v87.bodyyaw:override(false);
                        v87.left_limit:override(60);
                        v87.bodyyaw_freestanding:override("Off");
                        v166.spin = 1;
                        if v218 then
                            building.start[stateid].force_lc:override(false);
                        end;
                    elseif v42.builder.disablers.typed:get(2) and not entity.get_threat() then
                        v87.yaw:override("Static");
                        v87.pitch:override("Disabled");
                        v87.offset_y:override();
                        v87.modifier:override("Spin");
                        v87.modifier_offset:override(360);
                        v87.bodyyaw:override(false);
                        v87.left_limit:override(60);
                        v87.bodyyaw_freestanding:override("Off");
                        v166.spin = 1;
                        if v218 then
                            building.start[stateid].force_lc:override(false);
                        end;
                    elseif v218 then
                        building.start[stateid].force_lc:override();
                    end;
                elseif force_lc_active then
                    building.start[stateid].force_lc:override();
                end;
                return;
            end;
        end;
    end;
end;
trashtalk = {
    phrases = {
        kill = {
            [1] = {
                text = {
                    [1] = {
                        [1] = 1, 
                        [2] = "\209\130\208\181\209\128\208\191\208\184 \209\129\208\178\208\190\208\181 \208\181\208\177\208\187\208\184\209\137\208\181 \208\188\208\176\208\189\209\143\208\188\208\184\209\128\208\190\209\135\208\189\209\139\208\185 \209\129\208\187\208\176\208\177\209\139\208\185 \209\128\208\176\208\177\208\190\208\177\208\187\209\143\208\180\209\140 \208\186\208\190\209\130\208\190\209\128\208\176\209\143 \208\191\208\190\208\187\209\131\209\135\208\176\208\181\209\130 \208\183\208\176\208\187\208\191 \208\188\208\190\208\181\208\185 \208\183\208\176\208\187\209\131\208\191\209\139"
                    }, 
                    [2] = {
                        [1] = 3, 
                        [2] = "\208\191\208\184\208\180\208\190\209\128\208\176\209\129 \209\133\209\131\209\145\208\178\209\139\208\185"
                    }
                }
            }, 
            [2] = {
                text = {
                    [1] = {
                        [1] = 1, 
                        [2] = "\209\143 \208\182\208\181 \209\130\209\131\209\130 \209\130\208\178\208\190\209\142 \208\188\208\176\209\130\209\140 \209\129\208\181\208\185\209\135\208\176\209\129 \208\178\208\190\208\183\209\140\208\188\209\131 \208\189\208\176\209\133\209\131\208\185 \208\178\209\139\209\128\209\131\208\177\208\187\209\142 \209\135\208\184\209\129\209\130\208\190 \208\177\208\181\208\183 \208\178\209\129\209\143\208\186\208\184\209\133 \208\189\208\176 \209\130\208\190 \208\191\209\128\208\190\208\177\208\187\208\181\208\188"
                    }, 
                    [2] = {
                        [1] = 2, 
                        [2] = "\208\191\209\128\208\190\209\130\208\184\208\178\208\190\209\129\209\130\208\190\209\143\209\130\209\140 \209\130\209\139 \208\189\208\181 \208\178 \209\129\208\190\209\129\209\130\208\190\209\143\208\189\208\184\208\184 \208\190\209\129\208\184\208\187\208\184\209\130\209\140 \208\188\208\190\208\185 \209\135\208\187\208\181\208\189 \209\131 \209\129\208\181\208\177\209\143 \208\189\208\176 \208\187\208\184\209\134\208\181 \208\188\208\181\208\180\208\187\208\181\208\189\208\189\209\139\208\185 \209\131\208\181\208\177\208\190\208\186 \208\178 \208\186\208\190\209\130\208\190\209\128\208\190\208\179\208\190 \208\187\208\181\209\130\208\184\209\130 \208\188\208\190\208\185 \209\133\208\176\209\128\209\135\208\190\208\186"
                    }
                }
            }, 
            [3] = {
                text = {
                    [1] = {
                        [1] = 1, 
                        [2] = "1"
                    }, 
                    [2] = {
                        [1] = 3, 
                        [2] = "\208\191\209\139\209\130\208\176\208\185\209\129\209\143 \208\191\208\190\208\186\208\176 \209\135\209\130\208\190 \208\186\208\176\208\186 \209\130\208\190 \208\178\208\183\209\143\209\130\209\140 \208\184 \209\135\208\181\209\130 \208\188\208\189\208\181 \208\178 \209\133\209\131\208\181\209\134 \209\129\208\186\208\176\208\183\208\176\209\130\209\140 \208\180\208\176 \208\184 \208\178\209\129\209\145 \208\189\208\176\209\133\209\131\208\185 \209\130\209\139 \209\130\209\131\209\130 \208\180\208\176\208\178\208\176\208\185 \208\191\208\190\208\186\208\176 \209\135\209\130\208\190 "
                    }
                }
            }, 
            [4] = {
                text = {
                    [1] = {
                        [1] = 1, 
                        [2] = "\208\176 \208\189\209\131 \208\186\208\176 \209\130\209\139 \209\130\208\176\208\188 \209\129\208\190\209\129\208\184\209\128\209\131\208\185 \208\188\208\190\208\185 \209\133\209\131\208\185 \209\130\209\139 \208\182\208\181 \208\178\208\189\208\176\209\130\209\131\209\128\208\181 \208\181\208\177\208\176\208\189\208\189\209\139\208\185 \208\176\209\131\209\130\208\184\209\129\209\130 \208\186\208\190\209\130\208\190\209\128\209\139\208\185 \208\189\208\176 \208\188\208\190\208\185 \209\133\209\131\208\185 \209\128\208\181\209\136\208\184\208\187 \209\129\209\131\208\186\208\176 \208\178\209\139\208\181\208\177\209\139\208\178\208\176\209\130\209\140\209\129\209\143"
                    }, 
                    [2] = {
                        [1] = 4, 
                        [2] = "\209\130\209\139 \208\182\208\181 \209\129\208\176\208\188\209\139\208\185 \209\129\208\187\208\176\208\177\209\139\209\134 \209\128\208\181\208\177\208\181\208\189\208\190\209\135\208\181\208\186 \209\130\208\178\208\176\209\128\208\184 \208\186\208\190\209\130\208\190\209\128\208\190\208\185 \209\143 \208\178\208\184\208\180\208\181\208\187 \208\183\208\176 \208\178\209\129\208\181 \208\178\209\128\208\181\208\188\209\143"
                    }
                }
            }, 
            [5] = {
                text = {
                    [1] = {
                        [1] = 1, 
                        [2] = "\209\129\208\187\208\176\208\177\208\190\209\133\208\176\209\128\208\176\208\186\209\130\208\181\209\128\208\189\208\176\209\143 \209\130\209\139 \209\136\208\176\208\187\208\176\208\178\208\181\208\189\209\134\208\184\209\143 \208\188\208\176\208\186\209\129\208\184\208\188\208\176\208\187\209\140\208\189\208\190 \209\131\208\177\208\190\208\179\208\176\209\143 \208\184 \209\130\209\131\208\191\208\176\209\143"
                    }, 
                    [2] = {
                        [1] = 4, 
                        [2] = "\208\187\208\184\208\178\208\189\208\184 \209\131\208\182\208\181 \208\176 \209\130\208\190 \208\189\208\176\208\188 \209\129 \208\186\208\190\209\130\208\184\208\186\208\176\208\188\208\184 \209\129\209\130\209\139\208\180\208\189\208\190 \208\189\208\176 \209\130\208\181\208\177\209\143 \208\177\208\181\208\180\208\189\208\190\208\179\208\190 \209\129\208\188\208\190\209\130\209\128\208\181\209\130\209\140"
                    }
                }
            }, 
            [6] = {
                text = {
                    [1] = {
                        [1] = 2, 
                        [2] = "\208\181\208\177\208\176\208\189\208\189\209\139\208\185 \208\176\208\189\208\176\209\128\208\181\208\186\209\129\208\184\209\135\208\189\209\139\208\185 \209\128\208\181\208\177\208\181\208\189\208\190\208\186 \208\181\208\177\208\176\208\189\208\189\208\190\208\179\208\190 \209\129\208\181\208\187\209\140\209\135\208\176\208\189\208\184\208\189\208\176"
                    }, 
                    [2] = {
                        [1] = 4, 
                        [2] = "\208\191\209\128\208\190\208\177\208\184\208\187 \209\130\208\181\208\177\208\181 \209\135\208\181\209\128\208\181\208\191\209\131\209\136\208\186\209\131"
                    }
                }
            }, 
            [7] = {
                text = {
                    [1] = {
                        [1] = 1, 
                        [2] = "\209\143 \209\130\208\181\208\177\209\143 \208\191\209\128\208\184\208\186\208\189\209\135\209\131 \208\189\208\176\208\182\209\131\208\185 \208\184 \209\130\209\139 \208\177\209\131\208\180\208\181\209\136\209\140 \208\187\208\181\208\182\208\176\209\130\209\140 \208\178 \208\188\208\190\208\179\208\184\208\187\208\181 \208\179\208\189\208\188\209\130\209\140 \208\189\208\184\208\186\208\190\208\188\209\131 \208\189\208\181\208\189\209\131\208\182\208\189\209\139\208\185"
                    }, 
                    [2] = {
                        [1] = 3, 
                        [2] = "\209\143 \208\188\208\176\209\130\209\140 \209\130\208\178\208\190\209\142 \208\181\208\177\208\176\208\187"
                    }
                }
            }, 
            [8] = {
                text = {
                    [1] = {
                        [1] = 1, 
                        [2] = "\209\130\208\181\208\177\209\143 \209\130\208\176\208\186 \208\182\208\181 \209\133\209\131\208\181\208\188 \208\177\208\187\209\143 \208\190\208\177\209\131\209\133\208\176\208\182\208\184\208\178\208\176\209\142 \208\178 \209\128\208\190\209\130\208\184\208\186\208\181 \208\189\208\176\209\133\209\131\208\185 \208\184 \208\190\209\130\208\191\208\184\208\189\208\176\209\142 \208\191\208\190\209\129\208\187\208\181 \209\130\208\190\208\179\208\190 \209\129\209\131\208\186\208\176 \208\190\208\177\208\190\209\129\209\129\209\131 \208\184 \208\178\209\139\208\186\208\184\208\189\209\131 \208\191\208\190\209\129\208\187\208\181 \209\129\209\131\208\186\208\176 \208\186\208\176\208\186 \209\130\208\178\208\190\209\143 \208\186\208\190\208\182\208\176 \209\128\208\176\209\129\208\191\208\176\208\180\208\181\209\130\209\129\209\143 \208\178 \208\191\208\190\209\130\209\128\208\176\209\133\208\176 \209\143 \208\191\209\128\208\184\208\180\209\131 \208\186 \209\130\208\178\208\190\208\181\208\188\209\131 \209\129\208\186\208\181\208\187\208\181\209\130\209\131 \208\184 \208\189\208\176\209\135\208\189\209\131 \208\178 \208\191\208\181\209\128\208\178\209\131\209\142 \208\190\209\135\208\181\209\128\208\181\208\180\209\140 \208\181\208\177\208\176\209\136\208\184\209\130\209\140"
                    }, 
                    [2] = {
                        [1] = 2, 
                        [2] = "\240\157\153\182\240\157\153\180\240\157\153\189\240\157\153\184\240\157\154\132\240\157\154\130 \240\157\153\190\240\157\153\189\240\157\153\187\240\157\154\136 \240\157\154\134\240\157\153\184\240\157\154\131\240\157\153\183 \240\157\153\188\240\157\153\180\240\157\153\190\240\157\154\134\240\157\153\183\240\157\153\190\240\157\153\190\240\157\153\186"
                    }
                }
            }, 
            [9] = {
                text = {
                    [1] = {
                        [1] = 1, 
                        [2] = "\209\135\208\181 \208\183\208\176\209\133\208\190\209\130\208\181\208\187 \208\188\208\181\208\189\209\143 \208\186\208\190\209\128\208\190\208\187\209\143 \209\131\208\177\208\184\209\130\209\140 \209\133\208\176\209\135 \208\181\208\177\208\176\208\189\209\139\208\185"
                    }, 
                    [2] = {
                        [1] = 2, 
                        [2] = "\240\157\153\182\240\157\153\180\240\157\153\189\240\157\153\184\240\157\154\132\240\157\154\130 \240\157\153\190\240\157\153\189\240\157\153\187\240\157\154\136 \240\157\154\134\240\157\153\184\240\157\154\131\240\157\153\183 \240\157\153\188\240\157\153\180\240\157\153\190\240\157\154\134\240\157\153\183\240\157\153\190\240\157\153\190\240\157\153\186"
                    }
                }
            }, 
            [10] = {
                text = {
                    [1] = {
                        [1] = 1, 
                        [2] = "\208\177\209\131\208\180\209\140 \208\178\208\186\209\131\209\128\209\129\208\181 \209\130\208\190 \209\135\209\130\208\190 \208\188\208\176\209\130\209\131\209\133\208\181 \209\130\208\178\208\190\208\181\208\185 \209\130\208\176\208\186 \208\182\208\181 \208\178\209\138\208\181\208\177\208\176\208\187 \208\186\208\176\208\186 \208\184 \209\130\208\181\208\177\208\181 \208\177\208\187\209\143\208\180\208\184 \209\129\209\129\208\176\208\189\208\190\208\185"
                    }, 
                    [2] = {
                        [1] = 2, 
                        [2] = "\240\157\154\157.\240\157\154\150\240\157\154\142/\240\157\154\158\240\157\154\160\240\157\154\158\240\157\154\145\240\157\154\152\240\157\154\152\240\157\154\148"
                    }
                }
            }, 
            [11] = {
                text = {
                    [1] = {
                        [1] = 1, 
                        [2] = "\208\191\208\190\208\178\208\181\208\189\209\131\208\185\209\129\209\143 \209\129\208\178\208\190\208\181\208\188\209\131 \208\191\208\190\208\178\208\181\208\187\208\184\209\130\208\181\208\187\209\142 \209\133\209\131\208\184\208\187\208\176"
                    }, 
                    [2] = {
                        [1] = 2, 
                        [2] = "\208\181\208\177\208\176\209\130\209\140 \209\130\208\181\208\177\209\143 \208\177\209\131\208\180\209\131 \208\191\208\190\208\186\208\176 \209\131 \208\188\208\181\208\189\209\143 \208\181\209\129\209\130\209\140 \240\157\153\188\240\157\153\180\240\157\153\190\240\157\154\134\240\157\153\183\240\157\153\190\240\157\153\190\240\157\153\186"
                    }
                }
            }, 
            [12] = {
                text = {
                    [1] = {
                        [1] = 1, 
                        [2] = "1"
                    }, 
                    [2] = {
                        [1] = 2, 
                        [2] = "\209\133\208\176\209\135\208\184\208\187\208\176 \208\181\208\177\208\176\208\189\208\176\209\143 \208\188\209\128\208\184 \208\178\208\190 \209\129\208\189\208\181"
                    }
                }
            }, 
            [13] = {
                text = {
                    [1] = {
                        [1] = 1, 
                        [2] = "\208\190\208\177\208\181\208\183\209\138\209\143\208\189\208\176 \208\188\209\131\209\129\208\190\209\128\208\189\208\176\209\143"
                    }, 
                    [2] = {
                        [1] = 2, 
                        [2] = "\208\189\208\176 \208\186\208\190\208\187\208\181\208\189\208\184 \208\191\208\176\208\180\208\176\208\185"
                    }
                }
            }, 
            [14] = {
                text = {
                    [1] = {
                        [1] = 1, 
                        [2] = "\208\191\208\184\208\183\208\180\208\176 \209\130\209\139 \208\178\209\128\208\176\208\189\208\176\209\143"
                    }, 
                    [2] = {
                        [1] = 2, 
                        [2] = "\208\188\208\176\209\130\209\131\209\133\208\181 \209\130\208\176\208\186 \208\182\208\181 \209\130\208\178\208\190\208\181\208\185 \208\191\208\184\208\183\208\180\209\131 \209\128\208\176\208\183\208\190\209\128\208\178\208\176\208\187"
                    }
                }
            }, 
            [15] = {
                text = {
                    [1] = {
                        [1] = 1, 
                        [2] = "\209\135\208\181 \208\183\208\176 \209\133\209\131\208\181\209\130\208\176"
                    }, 
                    [2] = {
                        [1] = 2, 
                        [2] = "\208\191\208\190\208\180\208\179\209\128\209\131\208\182\208\176\208\185 meowhook \209\133\209\131\208\181\209\129\208\190\209\129"
                    }
                }
            }, 
            [16] = {
                text = {
                    [1] = {
                        [1] = 1, 
                        [2] = "\209\133\209\131\208\181\209\129\208\190\209\129 \208\191\209\131\208\177\208\181\209\128\209\130\208\176\209\130\208\189\209\139\208\185 \209\130\209\139 \209\135\208\181 \208\190 \209\129\208\181\208\177\208\181 \208\178\208\190\208\183\208\176\208\188\208\189\208\184\208\187?"
                    }, 
                    [2] = {
                        [1] = 2, 
                        [2] = "\209\130\208\181\208\177\209\143 \208\181\208\177\208\176\209\130\209\140 \208\177\209\131\208\180\209\131\209\130 \208\178\209\129\209\142 \208\182\208\184\208\183\208\189\209\140"
                    }
                }
            }
        }, 
        death = {
            [1] = {
                text = {
                    [1] = {
                        [1] = 1, 
                        [2] = "\208\188\208\190\209\135\208\176 \208\181\208\177\208\176\208\189\208\176\209\143 \209\130\208\181\208\177\208\181 \208\191\208\190\208\178\208\181\208\183\208\187\208\190 \209\130\208\190 \209\135\209\130\208\190 \209\130\208\181\208\177\209\143 \208\189\208\181 \209\131\208\177\208\184\208\187\208\184"
                    }, 
                    [2] = {
                        [1] = 4, 
                        [2] = "\208\184\208\189\208\176\209\135\208\181 \208\177 \209\130\208\178\208\190\208\185 \208\181\208\177\208\187\208\181\209\130 \208\177\209\139\208\187 \208\177\209\139 \208\191\208\190\208\180 \208\188\208\190\208\184\208\188\208\184 \208\189\208\190\208\179\208\176\208\188\208\184"
                    }
                }
            }, 
            [2] = {
                text = {
                    [1] = {
                        [1] = 1, 
                        [2] = "\209\131\208\182\208\176\209\129 \208\181\208\177\208\176\208\189\209\139\208\185"
                    }, 
                    [2] = {
                        [1] = 4, 
                        [2] = "\208\178\208\190\209\130 \208\177\209\139\208\178\208\176\208\181\209\130 \209\130\208\176\208\186\208\190\208\181 \208\182\208\181 \208\186\208\190\208\179\208\180\208\176 \209\130\208\176\208\186\208\190\208\185 \208\191\208\184\208\180\208\190\209\128\208\176\209\129 \208\178 \208\188\208\181\208\189\209\143 \208\191\208\190\208\191\208\176\208\180\208\176\208\181\209\130"
                    }
                }
            }, 
            [3] = {
                text = {
                    [1] = {
                        [1] = 1, 
                        [2] = "\208\177\208\187\209\143\209\130\209\140"
                    }, 
                    [2] = {
                        [1] = 3, 
                        [2] = "\208\187\208\176\208\180\208\189\208\190 \208\191\208\190\209\137\208\176\208\180\208\184\208\187 \209\130\208\181\208\177\209\143"
                    }
                }
            }, 
            [4] = {
                text = {
                    [1] = {
                        [1] = 1, 
                        [2] = "\209\135\209\131\209\128\208\186\208\176 \208\190\208\177\208\190\209\129\209\129\208\176\208\189\208\176\209\143"
                    }, 
                    [2] = {
                        [1] = 4, 
                        [2] = "\208\190\208\177\208\181\208\183\209\138\209\143\208\189\208\176 \208\181\208\177\208\187\208\184\208\178\208\176\209\143 \208\178\209\129\208\181 \208\182\208\181 \209\129\208\188\208\190\208\179\208\187\208\176 \209\131\208\177\208\184\209\130\209\140 \209\129\208\178\208\190\208\181\208\179\208\190 \208\191\208\190\208\178\208\181\208\187\208\184\209\130\208\181\208\187\209\143 []"
                    }
                }
            }
        }, 
        revenge = {
            [1] = {
                text = {
                    [1] = {
                        [1] = 1.5, 
                        [2] = "1"
                    }, 
                    [2] = {
                        [1] = 2.5, 
                        [2] = "\208\186\208\176\209\128\208\188\208\176"
                    }
                }
            }, 
            [2] = {
                text = {
                    [1] = {
                        [1] = 1.5, 
                        [2] = "1"
                    }, 
                    [2] = {
                        [1] = 2.5, 
                        [2] = "\208\177\208\187\209\143\208\180\208\184 \209\130\208\176\208\186\208\176\209\143 \208\182\208\181 \209\129\208\188\208\190\208\179\208\187\208\176 \209\131\208\177\208\184\209\130\209\140 \208\188\208\181\208\189\209\143"
                    }
                }
            }
        }
    }
};
used_kill_messages = {};
used_death_messages = {};
used_revenge_messages = {};
trash_say = function(v219)
    local v220 = trashtalk.phrases[v219];
    if not v220 then
        return;
    else
        local v221 = nil;
        if v219 == "kill" then
            v221 = used_kill_messages;
        elseif v219 == "death" then
            v221 = used_death_messages;
        elseif v219 == "revenge" then
            v221 = used_revenge_messages;
        end;
        if #v221 >= #v220 then
            for v222 in pairs(v221) do
                v221[v222] = nil;
            end;
        end;
        local v223 = {};
        for v224 = 1, #v220 do
            if not v221[v224] then
                table.insert(v223, v224);
            end;
        end;
        local v225 = v223[math.random(#v223)];
        v221[v225] = true;
        for v226 = 1, #v220[v225].text do
            do
                local l_v226_0 = v226;
                utils.execute_after(v220[v225].text[l_v226_0][1], function()
                    -- upvalues: v220 (ref), v225 (ref), l_v226_0 (ref)
                    utils.console_exec("say \"" .. v220[v225].text[l_v226_0][2] .. "\"");
                end);
            end;
        end;
        return;
    end;
end;
revenge_guy = nil;
events.player_death:set(function(v228)
    -- upvalues: v42 (ref)
    if not v42.misc.trashtalk:get() then
        return;
    else
        local v229 = entity.get_local_player();
        local v230 = entity.get(v228.userid, true);
        local v231 = entity.get(v228.attacker, true);
        if v42.misc.trashtalk.trashtalkmode:get(1) and v230 ~= v231 and v231 == v229 then
            trash_say("kill");
        elseif v42.misc.trashtalk.trashtalkmode:get(2) and v230 == v229 and v229 ~= v231 then
            trash_say("death");
            revenge_guy = v231;
        elseif v42.misc.trashtalk.trashtalkmode:get(3) and v230 == revenge_guy then
            trash_say("revenge");
        end;
        return;
    end;
end);
events.round_start:set(function()
    revenge_guy = nil;
end);
aspectratio = function()
    -- upvalues: v42 (ref), v91 (ref)
    if v42.visuals.aspect:get() then
        cvar.r_aspectratio:float(v91.new("aspect_ratio_value", v42.visuals.aspect.val:get() / 100, 5));
    else
        cvar.r_aspectratio:float(0);
    end;
end;
v42.visuals.aspect:set_callback(aspectratio);
aspectratio();
events.render:set(function()
    aspectratio();
end);
v42.visuals.aspect.val:set_callback(function(v232)
    -- upvalues: v42 (ref)
    if v42.visuals.aspect:get() then
        cvar.r_aspectratio:float(v232:get(10) / 100);
    end;
end);
v42.visuals.aspect.pre1:set_callback(function()
    -- upvalues: v42 (ref)
    v42.visuals.aspect.val:set(160);
end);
v42.visuals.aspect.pre2:set_callback(function()
    -- upvalues: v42 (ref)
    v42.visuals.aspect.val:set(178);
end);
v42.visuals.aspect.pre3:set_callback(function()
    -- upvalues: v42 (ref)
    v42.visuals.aspect.val:set(125);
end);
v42.visuals.aspect.pre4:set_callback(function()
    -- upvalues: v42 (ref)
    v42.visuals.aspect.val:set(133);
end);
v42.visuals.aspect.pre5:set_callback(function()
    -- upvalues: v42 (ref)
    v42.visuals.aspect.val:set(150);
end);
viewmodelm = function()
    -- upvalues: v42 (ref), v91 (ref)
    if v42.visuals.viewmodel:get() then
        local v233 = v91.new("viewmodel_fov_value", v42.visuals.viewmodel.fov:get() / 10, 5);
        local v234 = v91.new("viewmodel_x_value", v42.visuals.viewmodel.x_axis:get() / 10, 5);
        local v235 = v91.new("viewmodel_y_value", v42.visuals.viewmodel.y_axis:get() / 10, 5);
        local v236 = v91.new("viewmodel_z_value", v42.visuals.viewmodel.z_axis:get() / 10, 5);
        cvar.viewmodel_fov:float(v233, true);
        cvar.viewmodel_offset_x:float(v234, true);
        cvar.viewmodel_offset_y:float(v235, true);
        cvar.viewmodel_offset_z:float(v236, true);
    else
        cvar.viewmodel_fov:float(60, true);
        cvar.viewmodel_offset_x:float(1, true);
        cvar.viewmodel_offset_y:float(1, true);
        cvar.viewmodel_offset_z:float(-1, true);
    end;
end;
events.render:set(function()
    viewmodelm();
end);
v165 = function()
    -- upvalues: v87 (ref)
    cvar.r_aspectratio:float(0);
    common.set_clan_tag("");
    v87.clantag:override();
end;
local v237 = {};
local v238 = {};
local v239 = {
    on_plant_time = 0, 
    planting = false, 
    planting_site = "", 
    fill = 0
};
v237.font = render.load_font("Calibri Bold", 24, "ad");
v237.shots = 0;
v237.kd = 0;
v237.hit_count = 0;
v237.miss_count = 0;
v237.sm1_is_dormant = false;
v237.bomb_image = render.load_image_from_file("materials/panorama/images/icons/ui/bomb_c4.svg", vector(30, 30));
draw_500_ = function(v240, v241, v242, v243, v244, v245, v246, v247)
    -- upvalues: v237 (ref)
    if v247 == nil then
        v247 = 255;
    end;
    local _ = render.screen_size().x;
    local l_y_2 = render.screen_size().y;
    local v250 = render.measure_text(v237.font, nil, v241);
    if v242 == nil and v243 == nil then
        render.gradient(vector(0, l_y_2 - 351 - v240), vector(29 + v250.x / 2, l_y_2 - 317 - v240), color(0, 0, 0, 0), color(0, 0, 0, 60), color(0, 0, 0, 0), color(0, 0, 0, 60), 0);
        render.gradient(vector(58 + v250.x, l_y_2 - 351 - v240), vector(29 + v250.x / 2, l_y_2 - 317 - v240), color(0, 0, 0, 0), color(0, 0, 0, 60), color(0, 0, 0, 0), color(0, 0, 0, 60), 0);
        render.text(v237.font, vector(29, l_y_2 - 343 - v240), color(v244, v245, v246, v247), nil, v241);
    elseif v242 ~= nil and v243 ~= nil then
        render.gradient(vector(0, l_y_2 - 351 - v240), vector(29 + v250.x / 2, l_y_2 - 317 - v240), color(0, 0, 0, 0), color(0, 0, 0, 60), color(0, 0, 0, 0), color(0, 0, 0, 60), 0);
        render.gradient(vector(58 + v250.x, l_y_2 - 351 - v240), vector(29 + v250.x / 2, l_y_2 - 317 - v240), color(0, 0, 0, 0), color(0, 0, 0, 60), color(0, 0, 0, 0), color(0, 0, 0, 60), 0);
        render.text(v237.font, vector(67, l_y_2 - 343 - v240), color(v244, v245, v246, v247), nil, v241);
        render.texture(v242, vector(29, l_y_2 - 347 - v240), vector(32, 28), color(v244, v245, v246, 255), f, 0);
        render.circle_outline(vector(99, l_y_2 - 334 - v240), color(10, 10, 10, 255), 10, 0, 1, 5);
        render.circle_outline(vector(99, l_y_2 - 334 - v240), color(255, 255, 255, 200), 9, 0, v243, 3);
    elseif v242 ~= nil and v243 == nil then
        render.gradient(vector(0, l_y_2 - 351 - v240), vector(29 + v250.x / 2, l_y_2 - 317 - v240), color(0, 0, 0, 0), color(0, 0, 0, 60), color(0, 0, 0, 0), color(0, 0, 0, 60), 0);
        render.gradient(vector(58 + v250.x, l_y_2 - 351 - v240), vector(29 + v250.x / 2, l_y_2 - 317 - v240), color(0, 0, 0, 0), color(0, 0, 0, 60), color(0, 0, 0, 0), color(0, 0, 0, 60), 0);
        render.text(v237.font, vector(67, l_y_2 - 343 - v240), color(v244, v245, v246, v247), nil, v241);
        render.texture(v242, vector(29, l_y_2 - 347 - v240), vector(32, 28), color(v244, v245, v246, 255), f, 0);
    end;
end;
v237.real_yaw = 0;
v237.positions = {};
v237.lc = false;
events.createmove:set(function(v251)
    -- upvalues: v237 (ref)
    local v252 = entity.get_local_player();
    local v253 = v252:get_origin();
    local v254 = 1 / globals.tickinterval;
    if v251.choked_commands == 0 then
        v237.positions[#v237.positions + 1] = v253;
        if v254 <= #v237.positions then
            v237.lc = (v253 - v237.positions[v254]):lengthsqr() > 4096;
        end;
    end;
    if v254 < #v237.positions then
        table.remove(v237.positions, 1);
    end;
    v237.is_jumping = v251.in_jump;
    if v251.choked_commands > 0 then
        return;
    else
        v237.real_yaw = v252.m_flPoseParameter[11] * 120 - 60;
        return;
    end;
end);
v238.screen_size = render.screen_size();
v238.dpi_scale = v238.screen_size / vector(1920, 1080);
v237.handle = function()
    -- upvalues: v42 (ref), v238 (ref), v239 (ref), v237 (ref), v91 (ref), v88 (ref), v87 (ref)
    if not v42.misc.bars:get() then
        return;
    else
        local _ = v42.misc.bars.mode;
        local v256 = entity.get_local_player();
        if v256 == nil then
            return;
        else
            local v257 = entity.get_entities("CPlantedC4", true)[1];
            local v258 = "";
            local v259 = 0;
            local v260 = false;
            local v261 = 0;
            local _ = 0;
            local v263 = false;
            if v257 ~= nil then
                v259 = v257.m_flC4Blow - globals.curtime;
                v260 = v257.m_bBombDefused;
                if v259 > 0 and not v260 then
                    local v264 = v257.m_hBombDefuser ~= 4294967295;
                    local l_m_flDefuseLength_0 = v257.m_flDefuseLength;
                    local v266 = v257.m_hBombDefuser and v257.m_hBombDefuser.m_bIsDefusing or false;
                    local v267 = v264 and v266 and v257.m_flDefuseCountDown - globals.curtime or -1;
                    if v267 > 0 then
                        local v268 = v267 < v259 and color(58, 191, 54, 160) or color(252, 18, 19, 125);
                        local v269 = (v238.screen_size.y - 50) / l_m_flDefuseLength_0 * v267;
                        render.rect(vector(0, 0), vector(16, v238.screen_size.y), color(25, 25, 25, 160));
                        render.rect_outline(vector(0, 0), vector(16, v238.screen_size.y), color(25, 25, 25, 160));
                        render.rect(vector(0, v238.screen_size.y - v269), vector(16, v238.screen_size.y), v268);
                    end;
                    v258 = v257.m_nBombSite == 0 and "A" or "B";
                    local l_m_iHealth_0 = v256.m_iHealth;
                    local l_m_ArmorValue_0 = v256.m_ArmorValue;
                    local v272 = v257.m_vecOrigin:dist(v256.m_vecOrigin);
                    local v273 = 450.7;
                    local v274 = (v272 - 75.68) / 789.2;
                    v261 = v273 * math.exp(-v274 * v274);
                    if l_m_ArmorValue_0 > 0 then
                        local v275 = v261 * 0.5;
                        local v276 = (v261 - v275) * 0.5;
                        if l_m_ArmorValue_0 < v276 then
                            l_m_ArmorValue_0 = l_m_ArmorValue_0 * 2;
                            v275 = v261 - v276;
                        end;
                        v261 = v275;
                    end;
                    v263 = l_m_iHealth_0 <= math.ceil(v261);
                end;
            end;
            if v239.planting then
                v239.fill = 3.125 - (3.125 + v239.on_plant_time - globals.curtime);
                if v239.fill > 3.125 then
                    v239.fill = 3.125;
                end;
            end;
            v237.sm1_is_dormant = false;
            local v277 = entity.get_players(true, true);
            if not v277 then
                return;
            else
                for _, v279 in ipairs(v277) do
                    if v279:is_dormant() then
                        v237.sm1_is_dormant = true;
                    end;
                end;
                if not v42.misc.bars:get() then
                    return;
                else
                    local v280 = entity.get_local_player();
                    if v280 == nil then
                        return;
                    else
                        v238.get_bind = function(v281)
                            local v282 = false;
                            local v283 = 0;
                            local v284 = ui.get_binds();
                            for v285 = 1, #v284 do
                                if v284[v285].name == v281 and v284[v285].active then
                                    v282 = true;
                                    v283 = v284[v285].value;
                                end;
                            end;
                            return {
                                [1] = v282, 
                                [2] = v283
                            };
                        end;
                        v237.sm1_is_dormant = false;
                        local v286 = entity.get_players(true, true);
                        if not v286 then
                            return;
                        else
                            for _, v288 in ipairs(v286) do
                                if v288:is_dormant() then
                                    v237.sm1_is_dormant = true;
                                end;
                            end;
                            local v289 = entity.get_local_player();
                            if globals.is_connected == false or v289 == nil or v289:is_alive() == false then
                                return;
                            else
                                local l_m_iPing_0 = v289:get_resource().m_iPing;
                                local v291 = math.abs(l_m_iPing_0 % 360);
                                if v291 > 1 then
                                    v291 = 1;
                                end;
                                local _ = 132 * v291 + 255 * (1 - v291);
                                local _ = 196 * v291 + 255 * (1 - v291);
                                local _ = 20 * v291 + 255 * (1 - v291);
                                local v295 = math.min(60, math.abs(v237.real_yaw)) / 60;
                                local v296 = 132 * v295 + 250 * (1 - v295);
                                local v297 = 196 * v295 + 15 * (1 - v295);
                                local v298 = 20 * v295 + 15 * (1 - v295);
                                local _ = {};
                                local v300 = 12;
                                lerp = function(v301, v302, v303)
                                    return v301 + (v302 - v301) * v303;
                                end;
                                local v304 = 0;
                                draw_status = function(v305, v306, v307, v308, v309)
                                    -- upvalues: v304 (ref)
                                    draw_500_(v304, v305, nil, nil, v306, v307, v308, v309);
                                    v304 = v304 + 42;
                                end;
                                animate_color_multi = function(v310)
                                    -- upvalues: v91 (ref), v300 (ref)
                                    local v311 = 201;
                                    local v312 = 0;
                                    local v313 = (math.min(math.max(v310, v312), v311) - v312) / (v311 - v312);
                                    local v314 = {
                                        [1] = {
                                            g = 0, 
                                            b = 0, 
                                            r = 255
                                        }, 
                                        [2] = {
                                            g = 69, 
                                            b = 0, 
                                            r = 255
                                        }, 
                                        [3] = {
                                            g = 165, 
                                            b = 0, 
                                            r = 255
                                        }, 
                                        [4] = {
                                            g = 204, 
                                            b = 0, 
                                            r = 204
                                        }, 
                                        [5] = {
                                            g = 255, 
                                            b = 0, 
                                            r = 255
                                        }, 
                                        [6] = {
                                            g = 128, 
                                            b = 0, 
                                            r = 0
                                        }, 
                                        [7] = {
                                            g = 255, 
                                            b = 0, 
                                            r = 127
                                        }
                                    };
                                    local v315 = #v314;
                                    local v316 = 1 / (v315 - 1);
                                    local v317 = math.floor(v313 / v316) + 1;
                                    local v318 = v313 % v316 / v316;
                                    if v317 < v315 then
                                        local v319 = v314[v317];
                                        local v320 = v314[v317 + 1];
                                        return v91.new("ping_color_r", lerp(v319.r, v320.r, v318), v300), v91.new("ping_color_g", lerp(v319.g, v320.g, v318), v300), (v91.new("ping_color_b", lerp(v319.b, v320.b, v318), v300));
                                    else
                                        return v314[v315].r, v314[v315].g, v314[v315].b;
                                    end;
                                end;
                                if not v42.misc.bars:get() then
                                    return;
                                else
                                    local l_mode_1 = v42.misc.bars.mode;
                                    v304 = 0;
                                    if l_mode_1:get("Fake Latency") and v88.ping:get() >= 1 then
                                        local v322, v323, v324 = animate_color_multi(v88.ping:get());
                                        draw_status("PING", v322, v323, v324, 255);
                                    end;
                                    if l_mode_1:get("Hide Shots") and v88.hs:get() and not v88.dt:get() then
                                        draw_status("OSAA", 255, 255, 255, 200);
                                    end;
                                    if l_mode_1:get("Double Tap") and v88.dt:get() and not v88.fd:get() then
                                        local v325 = rage.exploit:get();
                                        draw_status("DT", v325 == 1 and 255 or 255, v325 == 1 and 255 or 0, v325 == 1 and 255 or 50, v325 == 1 and 200 or 255);
                                    end;
                                    if l_mode_1:get("Dormant Aimbot") and v87.dormant:get() then
                                        draw_status("DA", v237.sm1_is_dormant and 255 or 255, v237.sm1_is_dormant and 255 or 0, v237.sm1_is_dormant and 255 or 50, v237.sm1_is_dormant and 200 or 255);
                                    end;
                                    if l_mode_1:get("Lag Compensation") then
                                        local l_v237_0 = v237;
                                        local l_v237_1 = v237;
                                        local l_v237_2 = v237;
                                        local l_v237_3 = v237;
                                        local v330 = 240;
                                        local v331 = 15;
                                        local v332 = 15;
                                        l_v237_3.a = 240;
                                        l_v237_2.b = v332;
                                        l_v237_1.g = v331;
                                        l_v237_0.r = v330;
                                        l_v237_0 = bit.band(v289.m_fFlags, bit.lshift(1, 0)) == 0 or v237.is_jumping;
                                        if v237.lc then
                                            l_v237_1 = v237;
                                            l_v237_2 = v237;
                                            l_v237_3 = v237;
                                            v330 = 132;
                                            v331 = 196;
                                            l_v237_3.b = 20;
                                            l_v237_2.g = v331;
                                            l_v237_1.r = v330;
                                        end;
                                        if l_v237_0 and math.sqrt(v289.m_vecVelocity.x ^ 2 + v289.m_vecVelocity.y ^ 2) > 230 then
                                            draw_500_(v304, "LC", nil, nil, v237.r, v237.g, v237.b, v237.a);
                                            v304 = v304 + 42;
                                        end;
                                    end;
                                    if l_mode_1:get("Fake Angles") then
                                        draw_status("FAKE", v296, v297, v298, 255);
                                    end;
                                    if l_mode_1:get("Safe Points") and v88.safe:get() == "Force" then
                                        draw_status("SAFE", 255, 255, 255, 200);
                                    end;
                                    if l_mode_1:get("Body Aim") and v88.body:get() == "Force" then
                                        draw_status("BODY", 255, 255, 255, 200);
                                    end;
                                    if l_mode_1:get("Fake Duck") and v88.fd:get() then
                                        draw_status("DUCK", 255, 255, 255, 200);
                                    end;
                                    if l_mode_1:get("Damage Override") and v238.get_bind("Min. Damage")[1] then
                                        draw_status("MD", 255, 255, 255, 200);
                                    end;
                                    if l_mode_1:get("Freestanding") and v42.builder.freestanding:get() then
                                        draw_status("FS", 255, 255, 255, 200);
                                    end;
                                    if l_mode_1:get("Hit/Miss") then
                                        draw_status("" .. tostring(v237.hit_count) .. " / " .. tostring(v237.miss_count) .. " (" .. string.format("%.2f", v237.kd) .. ")", 255, 255, 255, 200);
                                    end;
                                    if l_mode_1:get("Bomb Info") and v259 > 0 and not v260 then
                                        draw_500_(v304, v258 .. " - " .. string.format("%.1f", v259) .. "s              ", v237.bomb_image, nil, 255, 255, 255, 200);
                                        v304 = v304 + 42;
                                    end;
                                    if l_mode_1:get("Bomb Info") and v239.planting then
                                        draw_500_(v304, v239.planting_site .. "              ", v237.bomb_image, v239.fill / 3.125, 252, 243, 105, 255);
                                        v304 = v304 + 42;
                                    end;
                                    if l_mode_1:get("Bomb Info") and v280:is_alive() and v263 then
                                        draw_500_(v304, "FATAL", nil, nil, 255, 0, 50, 255);
                                        v304 = v304 + 42;
                                    end;
                                    if l_mode_1:get("Hitchance Override") and v238.get_bind("Hit Chance")[1] then
                                        draw_status("HITCHANCE OVR", 255, 255, 255, 200);
                                    end;
                                    if l_mode_1:get("Hitbox Override") and v238.get_bind("Hitboxes")[1] then
                                        draw_status("HITBOX OVR", 255, 255, 255, 200);
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
events.render(v237.handle);
a_exp = function()
    -- upvalues: v42 (ref)
    if v42.builder.lagger:get() then
        local v333 = v42.builder.lagger.types:get();
        if (get_player_state(cmd) == "AIR" or get_player_state(cmd) == "AIR-C" and (get_player_state(cmd) == "AIR" or not on_ground)) and v333 == 2 then
            if globals.tickcount % (v42.builder.lagger.slider:get() * 0.5) == 0 then
                rage.exploit:force_teleport();
            elseif entity.get_threat(false) ~= nil then
                rage.exploit:force_charge();
            end;
        end;
    end;
end;
local v334 = false;
dt_exp = function()
    -- upvalues: v42 (ref), v334 (ref)
    if not v42.builder.lagger:get() then
        return;
    else
        local v335 = entity.get_local_player();
        if not v335 or not v335:is_alive() then
            return;
        else
            local v336 = v335:get_player_weapon();
            if not v336 then
                return;
            else
                local l_weapon_name_0 = v336:get_weapon_info().weapon_name;
                local l_console_name_0 = v336:get_weapon_info().console_name;
                local v339 = v42.builder.lagger.guns:get(1) and l_weapon_name_0 == "weapon_awp";
                local v340 = v42.builder.lagger.guns:get(2) and l_weapon_name_0 == "weapon_ssg08";
                local v341 = v42.builder.lagger.guns:get(3) and l_console_name_0 == "weapon_taser";
                if not v339 and not v340 and not v341 then
                    return;
                else
                    local v342 = false;
                    local v343 = false;
                    for _, v345 in pairs(entity.get_players(true, false)) do
                        if v345 ~= v335 and not v345:is_dormant() then
                            local v346, v347 = utils.trace_bullet(v345, v345:get_eye_position(), v335:get_eye_position());
                            if v347 and v347:did_hit_non_world() and v346 > 0 then
                                v343 = true;
                                if v42.builder.lagger.enb:get() then
                                    v342 = true;
                                    break;
                                end;
                            end;
                        end;
                    end;
                    if v42.builder.lagger.enb:get() then
                        if v342 and not bit.band(v335.m_fFlags, bit.lshift(1, 0)) ~= 0 then
                            if not v334 then
                                rage.exploit:force_teleport();
                                v334 = true;
                            end;
                        else
                            v334 = false;
                        end;
                    elseif v343 and common.is_button_released(32) then
                        if not v334 then
                            rage.exploit:force_teleport();
                            v334 = true;
                        end;
                    else
                        v334 = false;
                    end;
                    return;
                end;
            end;
        end;
    end;
end;
events.createmove:set(dt_exp);
handle_hitchance = function()
    -- upvalues: v42 (ref), v87 (ref)
    if not v42.misc.aimtools:get() then
        v87.ht:override();
        return;
    else
        local v348 = entity.get_local_player();
        if not v348 or not v348:is_alive() then
            return;
        else
            local v349 = v348:get_origin();
            local v350 = entity.get_threat();
            if not v350 then
                return;
            else
                local v351 = v42.misc.aimtools.lower_slider:get();
                local v352 = v42.misc.aimtools.high_slider:get();
                local v353 = v350:get_origin();
                local v354 = v353.z > v349.z;
                local v355 = v353.z < v349.z;
                local v356 = v42.misc.aimtools.lower_enable:get();
                local v357 = v42.misc.aimtools.high_enable:get();
                if v355 then
                    if v42.misc.aimtools.typing:get(1) and v356 then
                        v87.ht:override(v351);
                    else
                        v87.ht:override();
                    end;
                elseif v354 then
                    if v42.misc.aimtools.typing:get(2) and v357 then
                        v87.ht:override(v352);
                    else
                        v87.ht:override();
                    end;
                else
                    v87.ht:override();
                end;
                return;
            end;
        end;
    end;
end;
on_createmove = function()
    handle_enemy_height();
end;
handle_multipoint = function()
    -- upvalues: v42 (ref), v87 (ref)
    if not v42.misc.aimtools:get() then
        v87.headscale:override();
        v87.bodyscale:override();
        return;
    else
        local v358 = entity.get_local_player();
        if not v358 or not v358:is_alive() then
            return;
        else
            local v359 = entity.get_threat();
            if not v359 then
                return;
            else
                local v360 = v358:get_origin();
                local v361 = v359:get_origin();
                local v362 = v361.z > v360.z;
                local v363 = v361.z < v360.z;
                local v364 = v42.misc.aimtools.lower_enable_mp:get();
                local v365 = v42.misc.aimtools.high_enable_mp:get();
                if v363 and v42.misc.aimtools.typing:get(1) and v364 then
                    v87.headscale:override(v42.misc.aimtools.head_l_slider_mp:get());
                    v87.bodyscale:override(v42.misc.aimtools.body_l_slider_mp:get());
                elseif v362 and v42.misc.aimtools.typing:get(2) and v365 then
                    v87.headscale:override(v42.misc.aimtools.head_h_slider_mp:get());
                    v87.bodyscale:override(v42.misc.aimtools.body_h_slider_mp:get());
                else
                    v87.headscale:override();
                    v87.bodyscale:override();
                end;
                return;
            end;
        end;
    end;
end;
on_createmove = function()
    handle_hitchance();
    handle_multipoint();
end;
events.createmove(on_createmove);
hasbit = function(v366, v367)
    return v367 <= v366 % (v367 + v367);
end;
local v368 = vector();
events.createmove:set(function(v369)
    -- upvalues: v42 (ref), v88 (ref), v368 (ref), v87 (ref)
    local v370 = entity.get_local_player();
    if not v42.builder.edgeyaw:get() or v370.m_vecVelocity.z ~= 0 or v369.in_jump then
        return;
    elseif v42.builder.edgeyaw.edge_on_fd:get() and not v88.fd:get() then
        return;
    elseif hasbit(v369.buttons, 1) then
        return;
    else
        if v369.choked_commands == 0 then
            v368 = v370:get_eye_position();
        end;
        if v42.builder.edgeyaw:get() then
            v87.yaw_base:override("Local View");
        else
            v87.yaw_base:override("At targets");
        end;
        local v371 = {};
        local v372 = {};
        local v373 = {};
        for v374 = 18, 360, 18 do
            local v375 = math.normalize_yaw(v374);
            local v376 = v368 + vector():angles(0, v375) * 96;
            local v377 = utils.trace_line(v368, v376, v370, 33570827, 1);
            if v377 and v377.fraction < 0.3 then
                table.insert(v371, v375);
                table.insert(v372, v368:dist(v377.end_pos));
                table.insert(v373, {
                    vecTraceEnd = v376, 
                    flYaw = v375
                });
            end;
        end;
        if #v372 == 0 or v372[1] > 30 then
            return;
        else
            table.sort(v373, function(v378, v379)
                return v378.flYaw < v379.flYaw;
            end);
            table.remove(v373, #v373);
            if #v373 >= 3 then
                local v380 = v373[1].vecTraceEnd:lerp(v373[#v373].vecTraceEnd, 0.5);
                local v381 = (v368 - v380):angles();
                if v381 then
                    local l_y_3 = render.camera_angles().y;
                    local l_y_4 = v381.y;
                    local v384 = math.normalize_yaw(l_y_4 - l_y_3);
                    if math.abs(v384) < 90 then
                        l_y_3 = math.normalize_yaw(l_y_4 + 180);
                    end;
                    v369.view_angles.y = math.normalize_yaw(l_y_4 + v384 + 180);
                    v369.send_packet = true;
                end;
            end;
            return;
        end;
    end;
end);
backtrack_adpv = function(_)
    -- upvalues: v42 (ref), v87 (ref)
    if not v42.misc.aimtools:get() or not v42.misc.aimtools.adaptive:get() or not v42.misc.aimtools.typing:get(3) then
        if v87.fake_latency then
            v87.fake_latency:override();
        end;
        return;
    else
        local v386 = entity.get_local_player();
        if not v386 or not v386:is_alive() then
            return;
        else
            local v387 = v386:get_player_weapon();
            if not v387 then
                return;
            else
                local l_weapon_name_1 = v387:get_weapon_info().weapon_name;
                local l_console_name_1 = v387:get_weapon_info().console_name;
                local v390 = {
                    scout = l_weapon_name_1 == "weapon_ssg08", 
                    awp = l_weapon_name_1 == "weapon_awp", 
                    auto = l_weapon_name_1 == "weapon_scar20" or l_weapon_name_1 == "weapon_g3sg1", 
                    pistol = l_weapon_name_1 == "weapon_deagle" or not (l_weapon_name_1 ~= "weapon_elite") or not (l_weapon_name_1 ~= "weapon_fiveseven") or not (l_weapon_name_1 ~= "weapon_glock") or not (l_weapon_name_1 ~= "weapon_hkp2000") or not (l_weapon_name_1 ~= "weapon_p250") or not (l_weapon_name_1 ~= "weapon_tec9") or not (l_weapon_name_1 ~= "weapon_usp_silencer") or not (l_weapon_name_1 ~= "weapon_cz75a") or l_console_name_1 == "weapon_revolver"
                };
                local v391 = 37;
                if v390.auto then
                    v391 = 50;
                elseif v390.awp then
                    v391 = 45;
                elseif v390.scout then
                    v391 = 40;
                elseif v390.pistol then
                    v391 = 35;
                end;
                local v392 = v386.m_vecVelocity[0] or 0;
                local v393 = v386.m_vecVelocity[1] or 0;
                local v394 = math.sqrt(v392 ^ 2 + v393 ^ 2);
                local v395 = v386.m_bIsScoped == 1;
                local v396 = v386.m_fFlags or 0;
                local v397 = bit.band(v396, 1) == 0;
                local v398 = bit.band(v396, 4) ~= 0;
                local l_v391_0 = v391;
                if v397 then
                    l_v391_0 = l_v391_0 + 10;
                elseif v394 > 150 then
                    l_v391_0 = l_v391_0 + 5;
                elseif v398 then
                    l_v391_0 = l_v391_0 - 5;
                end;
                if (v390.scout or v390.awp) and v395 then
                    l_v391_0 = l_v391_0 + 8;
                end;
                local v400 = nil;
                local l_huge_0 = math.huge;
                for _, v403 in ipairs(entity.get_players(true)) do
                    if v403 and v403:is_alive() and not v403:is_dormant() then
                        local v404 = v403:get_origin();
                        local v405 = v386:get_origin();
                        local v406 = vector(v404.x - v405.x, v404.y - v405.y, v404.z - v405.z):length();
                        if v406 < l_huge_0 then
                            l_huge_0 = v406;
                            v400 = v403;
                        end;
                    end;
                end;
                if v400 then
                    local v407 = v400.m_vecVelocity[0] or 0;
                    local v408 = v400.m_vecVelocity[1] or 0;
                    local v409 = math.sqrt(v407 ^ 2 + v408 ^ 2);
                    if v409 > 180 then
                        l_v391_0 = l_v391_0 + 12;
                    elseif v409 > 100 then
                        l_v391_0 = l_v391_0 + 6;
                    end;
                    l_v391_0 = l_v391_0 + math.min(10, math.max(0, (l_huge_0 - 300) / 200));
                end;
                l_v391_0 = math.min(math.max(l_v391_0, 20), 190);
                if v87.fake_latency then
                    v87.fake_latency:override(l_v391_0);
                end;
                return;
            end;
        end;
    end;
end;
tools = function()
    -- upvalues: l_mtools_0 (ref)
    l_mtools_0.AntiAims.Condition.Update();
    local v410 = entity.get_local_player();
    if not v410 or not v410:is_alive() then
        return;
    else
        local v411 = v410.m_vecVelocity and v410.m_vecVelocity:length2d() or 0;
        return l_mtools_0.AntiAims.Condition:Get() == "C" and v411 > 13 and "CR" or l_mtools_0.AntiAims.Condition:Get();
    end;
end;
peekexploit = function()
    -- upvalues: v42 (ref)
    local l_freestanding_0 = v42.builder.freestanding;
    if not l_freestanding_0:get() then
        ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"):override(false);
        ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Disable Yaw Modifiers"):override(false);
        return;
    else
        local v413 = ({
            W = 2, 
            C = 3, 
            S = 1, 
            A = 6, 
            CR = 4, 
            AC = 7, 
            SW = 5
        })[tools()];
        local v414 = not l_freestanding_0.disablers:get(v413);
        ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"):override(v414);
        ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Disable Yaw Modifiers"):override(v414);
        return;
    end;
end;
auto_os = function()
    -- upvalues: v42 (ref), v87 (ref)
    if not v42.builder.auto_os:get() then
        if v87.hide_shots then
            v87.hide_shots:override();
        end;
        return;
    else
        local v415 = entity.get_local_player();
        local v416 = entity.get_local_player():get_player_weapon();
        if not v415 or not v415:is_alive() or not v416 or not v416:get_weapon_info() then
            return;
        else
            local v417 = v416:get_weapon_info();
            local l_console_name_2 = v417.console_name;
            local l_guns_0 = v42.builder.auto_os.guns;
            local _ = v42.builder.auto_os.state:get();
            local v421 = false;
            if v42.builder.auto_os.state:get(1) and get_player_state(cmd) == "STANDING" then
                v421 = true;
            elseif v42.builder.auto_os.state:get(2) and get_player_state(cmd) == "CROUCH" then
                v421 = true;
            end;
            local v422 = (v417.weapon_name == "weapon_hkp2000" and l_guns_0:get("Usp") or v417.weapon_name == "weapon_deagle" and l_guns_0:get("Deagle") or v417.weapon_name == "weapon_glock" and l_guns_0:get("Glock") or v417.weapon_name == "weapon_p250" and l_guns_0:get("P250") or l_console_name_2 == "weapon_tec9" and l_guns_0:get("Tec-9")) and v421;
            if v87.hide_shots then
                v87.hide_shots:override(v422);
            end;
            return;
        end;
    end;
end;
arrows = function()
    -- upvalues: v42 (ref), v91 (ref), v68 (ref), v69 (ref), v67 (ref)
    if not v42.visuals.manual_arrows:get() then
        return;
    else
        local v423 = entity.get_local_player();
        local v424 = v42.builder.manual:get();
        if not v423 or not v423:is_alive() then
            return;
        else
            local l_x_3 = render.screen_size().x;
            local l_y_5 = render.screen_size().y;
            local v427 = v91.new("vis", (not (v424 ~= "Left") or v424 == "Right") and 255 or 0, 12);
            if v427 == 0 then
                return;
            else
                local v428 = v42.visuals.manual_arrows.styled:get();
                local v429 = v42.visuals.manual_arrows.color_arrows:get();
                local v430 = v91.new("x_off", v42.visuals.manual_arrows.slider_arrows_x:get(), 6);
                local v431 = v91.new("l_a", v424 == "Left" and 255 or 0, 3);
                local v432 = v91.new("r_a", v424 == "Right" and 255 or 0, 3);
                local v433 = color(v429.r, v429.g, v429.b, v431);
                local v434 = color(v429.r, v429.g, v429.b, v432);
                local v435 = color(128, 128, 128, v427);
                local v436 = v424 == "Left" and v433 or v435;
                if v424 ~= "Right" or not v434 then
                    v434 = v435;
                end;
                v433 = v436;
                v436 = vector(l_x_3 / 2 - 47 - v430, l_y_5 / 2);
                local v437 = vector(l_x_3 / 2 + 41 + v430, l_y_5 / 2);
                if v428 == 1 then
                    render.texture(v68, v436, v433);
                    render.texture(v69, v437, v434);
                else
                    render.text(v67, v436, v433, "c", "\226\157\176");
                    render.text(v67, v437, v434, "c", "\226\157\177");
                end;
                return;
            end;
        end;
    end;
end;
events.render:set(arrows);
local v438 = {
    scopebool = l_smoothy_0.new(1), 
    dt = l_smoothy_0.new(1), 
    hs = l_smoothy_0.new(1), 
    pa = l_smoothy_0.new(1), 
    fs = l_smoothy_0.new(1), 
    ready = l_smoothy_0.new(1)
};
scope = function()
    -- upvalues: v42 (ref), v87 (ref), v438 (ref), v39 (ref)
    if v42.visuals.scope:get() then
        local v439 = entity.get_local_player();
        if v439 ~= nil and v439:is_alive() then
            v87.scope:override("Remove All");
            v438.scopebool(0.1, v439.m_bIsScoped and 1 or 0);
            local v440 = v42.visuals.scope.color:get();
            local v441 = color(v440.r, v440.g, v440.b, 255 * v438.scopebool.value);
            local v442 = color(v440.r, v440.g, v440.b, 0 * v438.scopebool.value);
            local v443 = v42.visuals.scope.length:get() * v438.scopebool.value;
            local v444 = v42.visuals.scope.gap:get();
            render.gradient(vector(v39.screen.x, v39.screen.y - v444 + 1), vector(v39.screen.x + 1, v39.screen.y - v444 - v443 + 1), v441, v441, v442, v442);
            render.gradient(vector(v39.screen.x, v39.screen.y + v444), vector(v39.screen.x + 1, v39.screen.y + v444 + v443), v441, v441, v442, v442);
            render.gradient(vector(v39.screen.x - v444 + 1, v39.screen.y), vector(v39.screen.x - v444 - v443 + 1, v39.screen.y + 1), v441, v442, v441, v442);
            render.gradient(vector(v39.screen.x + v444, v39.screen.y), vector(v39.screen.x + v444 + v443, v39.screen.y + 1), v441, v442, v441, v442);
        end;
    else
        v87.scope:override("Remove Overlay");
    end;
end;
local v454 = {
    nadestable = {
        [1] = "hegrenade", 
        [2] = "smokegrenade", 
        [3] = "incgrenade", 
        [4] = "molotov"
    }, 
    model = function(v445, _)
        -- upvalues: v42 (ref), v91 (ref)
        local v447 = entity.get_local_player();
        if not v447 or not v42.visuals.scope.select:get(2) or not v42.visuals.scope:get() then
            return;
        else
            local v448 = v447:get_player_weapon();
            if not v448 then
                return;
            else
                local v449 = v448:get_weapon_info();
                if not v449 then
                    return;
                else
                    local v450 = nil;
                    if v42.visuals.scope.types:get("On Scope") and v447.m_bIsScoped then
                        v450 = v42.visuals.scope.scoped:get();
                    elseif v42.visuals.scope.types:get("On Nade") then
                        for _, v452 in ipairs(v445.nadestable) do
                            if v449.weapon_name == "weapon_" .. v452 then
                                v450 = v42.visuals.scope.nade:get();
                                break;
                            end;
                        end;
                    end;
                    local v453;
                    if v450 then
                        v453 = v91.new("scope_transparency", v450, 3);
                    else
                        v453 = v450;
                    end;
                    return v453;
                end;
            end;
        end;
    end
};
events.localplayer_transparency:set(function(v455)
    -- upvalues: v454 (ref)
    return v454:model(v455);
end);
local v456 = 0;
smooth = function(v457, v458, v459)
    return v457 + (v458 - v457) * v459;
end;
events.override_view:set(function(v460)
    -- upvalues: v42 (ref), v456 (ref), v87 (ref)
    if not v42.visuals.scope:get() or not v42.visuals.scope.select:get(1) then
        v456 = v87.fov:get();
        v460.fov = v456;
        return;
    else
        local v461 = entity.get_local_player();
        if not v461 or not v461:is_alive() then
            return;
        else
            local v462 = v461:get_player_weapon();
            if not v462 then
                return;
            else
                local v463 = v42.visuals.scope.fov:get();
                local v464 = v87.fov:get() - (v461.m_bIsScoped and (v462.m_zoomLevel == 2 and 45 + v463 or 30 + v463) or 0);
                v456 = smooth(v456, v464, 0.05);
                v460.fov = v456;
                return;
            end;
        end;
    end;
end);
sidebar = function()
    -- upvalues: l_monylinear_0 (ref)
    if ui.get_alpha() > 0.1 then
        local v465 = l_monylinear_0:Animate("meowhook", {
            ui.get_style("Link Active"), 
            color(50)
        }, -2.5, 2);
        ui.sidebar(v465, ui.get_icon("paw"));
    end;
end;
events.render:set(function()
    sidebar();
end);
local v467 = {
    handel = function(v466)
        if entity.get_local_player().m_MoveType == 9 then
            if v466.forwardmove > 0 and render.camera_angles().x < 45 then
                v466.view_angles.x = 89;
                v466.in_moveright = 1;
                v466.in_moveleft = 0;
                v466.in_forward = 0;
                v466.in_back = 1;
                if v466.sidemove == 0 then
                    v466.view_angles.y = v466.view_angles.y + 90;
                end;
                if v466.sidemove < 0 then
                    v466.view_angles.y = v466.view_angles.y + 150;
                end;
                if v466.sidemove > 0 then
                    v466.view_angles.y = v466.view_angles.y + 30;
                end;
            end;
            if v466.forwardmove < 0 then
                v466.view_angles.x = 89;
                v466.in_moveleft = 1;
                v466.in_moveright = 0;
                v466.in_forward = 1;
                v466.in_back = 0;
                if v466.sidemove == 0 then
                    v466.view_angles.y = v466.view_angles.y + 90;
                end;
                if v466.sidemove > 0 then
                    v466.view_angles.y = v466.view_angles.y + 150;
                end;
                if v466.sidemove < 0 then
                    v466.view_angles.y = v466.view_angles.y + 30;
                end;
            end;
        end;
    end
};
jumpscout = function(_)
    -- upvalues: v87 (ref), v42 (ref)
    v87.autostop_scout:override();
    v87.hitchance_scout:override();
    local v469 = entity.get_local_player();
    local v470 = entity.get_threat(true) or entity.get_threat();
    if not v42.misc.scout:get() or not v469 or not v469:is_alive() or not v470 or v470:is_dormant() then
        return;
    else
        local v471 = v87.autostop_scout:get();
        for v472 = 1, #v471 do
            if v471[v472] == "In Air" then
                table.remove(v471, v472);
                break;
            end;
        end;
        table.insert(v471, "In Air");
        v87.autostop_scout:override(v471);
        local l_m_fFlags_0 = v469.m_fFlags;
        local v474 = (v469:get_origin() - v470:get_origin()):length2d();
        local _ = v469.m_vecVelocity:length2d();
        local v476 = bit.band(l_m_fFlags_0, 1) == 0;
        local v477 = math.max(40, 100 - v474 / 100 * 5);
        if v42.misc.scout.typed:get(2) and v42.misc.scout.dis_slider:get() < v474 then
            v87.autostop_scout:override(v471);
            tp = 1;
        elseif v42.misc.scout.typed:get(1) and v476 then
            v87.hitchance_scout:override(v477);
            local v478 = 2;
            hcs = v477;
            tp = v478;
        end;
        return;
    end;
end;
local v492 = {
    handle = function()
        -- upvalues: l_mtools_0 (ref), v87 (ref), v42 (ref)
        local v479 = entity.get_local_player();
        if not v479 then
            return;
        else
            local v480 = v479:get_player_weapon();
            if not v480 then
                return;
            else
                local l_weapon_name_2 = v480:get_weapon_info().weapon_name;
                local l_console_name_3 = v480:get_weapon_info().console_name;
                local v483 = l_weapon_name_2 == "weapon_ssg08";
                local v484 = l_weapon_name_2 == "weapon_awp";
                local v485 = l_weapon_name_2 == "weapon_scar20";
                local v486 = l_weapon_name_2 == "weapon_g3sg1";
                local v487 = l_console_name_3 == "weapon_revolver";
                l_mtools_0.AntiAims.Condition:Update();
                if not l_mtools_0.AntiAims.Condition:GetDev("Air") then
                    v87.hc_find:override();
                end;
                if v42.misc.hitchance:get() and v42.misc.hitchance.inair_hc:get() ~= 0 then
                    for _, v489 in pairs({
                        [1] = {
                            v483, 
                            v42.misc.hitchance.enable_ssg:get(), 
                            v42.misc.hitchance.ssg08_chance:get()
                        }, 
                        [2] = {
                            v484, 
                            v42.misc.hitchance.enable_awp:get(), 
                            v42.misc.hitchance.awp_chance:get()
                        }, 
                        [3] = {
                            v485 or v486, 
                            v42.misc.hitchance.enable_at:get(), 
                            v42.misc.hitchance.atsniper_chance:get()
                        }, 
                        [4] = {
                            v487, 
                            v42.misc.hitchance.enable_r8:get(), 
                            v42.misc.hitchance.revolver_chance:get()
                        }
                    }) do
                        if v489[1] and v489[2] and l_mtools_0.AntiAims.Condition:GetDev("Air") then
                            v87.hc_find:override(v489[3]);
                        end;
                    end;
                end;
                if v42.misc.hitchance:get() and v42.misc.hitchance.inair_hc:get() ~= 0 then
                    for _, v491 in pairs({
                        [1] = {
                            v483, 
                            v42.misc.hitchance.enable_ssg:get(), 
                            v42.misc.hitchance.ssg08_nzchance:get()
                        }, 
                        [2] = {
                            v484, 
                            v42.misc.hitchance.enable_awp:get(), 
                            v42.misc.hitchance.awp_nzchance:get()
                        }, 
                        [3] = {
                            v485 or v486, 
                            v42.misc.hitchance.enable_at:get(), 
                            v42.misc.hitchance.atsniper_nzchance:get()
                        }
                    }) do
                        if v491[1] and v491[2] and not v479.m_bIsScoped then
                            v87.hc_find:override(v491[3]);
                        end;
                    end;
                end;
                return;
            end;
        end;
    end
};
local v493 = {
    toggle = panorama.FriendsListAPI.ToggleMute, 
    is_muted = panorama.FriendsListAPI.IsSelectedPlayerMuted
};
local v494 = {};
manage_player_mute = function()
    -- upvalues: v42 (ref), v493 (ref), v494 (ref)
    if not v42.visuals.silenced:get() then
        return;
    else
        local v495 = v42.visuals.silenced.selection:get();
        for _, v497 in ipairs(entity.get_players(false, true)) do
            if v497 ~= entity.get_local_player() then
                local l_steamid64_0 = v497:get_player_info().steamid64;
                local v499 = v493.is_muted(l_steamid64_0);
                if v495 == 1 then
                    if v499 then
                        v493.toggle(l_steamid64_0);
                    end;
                    v494 = {};
                elseif v495 == 2 then
                    if v497:is_enemy() ~= v499 then
                        v493.toggle(l_steamid64_0);
                    end;
                    v494[l_steamid64_0] = v497:is_enemy() and true or nil;
                elseif v495 == 3 then
                    if v497:is_enemy() == v499 then
                        v493.toggle(l_steamid64_0);
                    end;
                    local l_v494_0 = v494;
                    if v497:is_enemy() then

                    end;
                    l_v494_0[l_steamid64_0] = true;
                elseif v495 == 4 and not v499 then
                    v493.toggle(l_steamid64_0);
                    v494[l_steamid64_0] = true;
                end;
            end;
        end;
        return;
    end;
end;
events.render:set(manage_player_mute);
local v505 = {
    step = 1, 
    speed = 4, 
    list = {
        [1] = "", 
        [2] = "m", 
        [3] = "me", 
        [4] = "meo", 
        [5] = "meow", 
        [6] = "meowh", 
        [7] = "meowho", 
        [8] = "meowhoo", 
        [9] = "meowhook.", 
        [10] = "meowhook.n", 
        [11] = "meowhook.nl", 
        [12] = "meowhook.nl", 
        [13] = "meowhook.n", 
        [14] = "meowhook.", 
        [15] = "meowhoo", 
        [16] = "meowho", 
        [17] = "meowh", 
        [18] = "meow", 
        [19] = "meo", 
        [20] = "me", 
        [21] = "m", 
        [22] = ""
    }, 
    run = function(v501)
        -- upvalues: v87 (ref), v42 (ref)
        local function v503()
            -- upvalues: v501 (ref), v87 (ref)
            local v502 = math.floor(globals.curtime * v501.speed + 0.5) % #v501.list + 1;
            if v502 == v501.step then
                return;
            else
                v501.step = v502;
                v87.clantag:override(false);
                common.set_clan_tag(v501.list[v502]);
                return;
            end;
        end;
        v42.misc.clantag:set_callback(function(v504)
            -- upvalues: v503 (ref)
            if v504:get(3) then
                events.net_update_end:set(v503);
            else
                events.net_update_end:unset(v503);
                common.set_clan_tag("");
            end;
        end, true);
    end
};
local function _()
    -- upvalues: v87 (ref)
    common.set_clan_tag("");
    v87.clantag:override();
end;
v505:run();
local _ = nil;
local v508 = 0.3;
lerp = function(v509, v510, v511)
    return v509 + v511 * (v510 - v509);
end;
do
    local l_v508_0 = v508;
    resolve_grenade_throw = function(v513, v514, v515, v516)
        -- upvalues: l_v508_0 (ref)
        v513.x = v513.x - 10 + math.abs(v513.x) / 9;
        local v517 = vector():angles(v513);
        local v518 = v516 * 1.25;
        if v515 <= 0.1 then
            return v513;
        else
            local v519 = math.clamp(v514 * 0.9, 15, 750) * math.clamp(v515, 0, 1) * lerp(l_v508_0, 1, math.clamp(v515, 0, 1));
            local l_v517_0 = v517;
            for _ = 1, 4 do
                l_v517_0 = (v517 * (l_v517_0 * v519 + v518):length() - v518) / v519;
                l_v517_0:normalize();
            end;
            local v522 = l_v517_0.angles(l_v517_0);
            v522.x = v522.x > -10 and 0.9 * v522.x + 9 or 1.125 * v522.x + 11.25;
            return v522;
        end;
    end;
    on_grenade_override_view = function(v523)
        -- upvalues: v42 (ref)
        if not v42.visuals.addons:get() or not v42.visuals.addons.typed:get("Super Toss") then
            return;
        else
            local v524 = entity.get_local_player();
            local v525 = entity.get_local_player():get_player_weapon();
            if not v524 or not v525 then
                return;
            else
                local v526 = v525:get_weapon_info();
                if not v526 then
                    return;
                else
                    v523.angles = resolve_grenade_throw(v523.angles, v526.throw_velocity, v525.m_flThrowStrength, v523.velocity);
                    return;
                end;
            end;
        end;
    end;
    on_createmove_1 = function(v527)
        -- upvalues: v42 (ref)
        if not v42.visuals.addons:get() or not v42.visuals.addons.typed:get("Super Toss") then
            return;
        elseif not v527.jitter_move then
            return;
        else
            local v528 = entity.get_local_player();
            local v529 = entity.get_local_player():get_player_weapon();
            if not v528 or not v529 then
                return;
            else
                local v530 = v529:get_weapon_info();
                if not v530 or v530.weapon_type ~= 9 or v529.m_fThrowTime < globals.curtime - to_time(globals.clock_offset) then
                    return;
                else
                    v527.in_speed = true;
                    local v531 = v528:simulate_movement();
                    v531:think();
                    v527.view_angles = resolve_grenade_throw(v527.view_angles, v530.throw_velocity, v529.m_flThrowStrength, v531.velocity);
                    return;
                end;
            end;
        end;
    end;
end;
grenade_release = function(v532)
    -- upvalues: v42 (ref)
    local v533 = entity.get_local_player();
    if not v533 or not v533:is_alive() then
        return;
    else
        local v534 = v533:get_player_weapon();
        if not v534 then
            return;
        else
            local v535 = v534:get_weapon_index();
            if v535 ~= 44 and v535 ~= 46 then
                return;
            else
                local l_addons_0 = v42.visuals.addons;
                if l_addons_0.typed:get(2) and v534.m_bPinPulled and l_addons_0.amount:get() < v532.damage then
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
v508 = {
    toggle = function()
        -- upvalues: v87 (ref), v42 (ref)
        v87.actions:override(v42.visuals.addons.typed:get(3) and "Auto Pistols" or "");
    end, 
    handle_throw = function(v537)
        if entity.get_local_player() == entity.get(v537.userid, true) then
            utils.console_exec("slot2");
            utils.console_exec("slot1");
        end;
    end
};
events.grenade_prediction:set(function(v538)
    grenade_release(v538);
end);
revo_fix = function()
    -- upvalues: v87 (ref), v42 (ref)
    v87.hslag:override();
    local v539 = false;
    local v540 = entity.get_local_player();
    if not v540 then
        return;
    else
        local v541 = v540:get_player_weapon();
        if not v541 then
            return;
        else
            if v541:get_weapon_info().is_revolver and v42.visuals.addons.typed:get(4) then
                v87.hslag:override("Favor Fake Lag");
                v539 = true;
            end;
            return;
        end;
    end;
end;
entity.get_anim_layer = function(v542, v543)
    -- upvalues: l_ffi_0 (ref)
    return l_ffi_0.cast("c_animlayers**", l_ffi_0.cast("char*", l_ffi_0.cast("void***", v542)) + 10640)[0][v543 or 1];
end;
events.post_update_clientside_animation:set(function()
    -- upvalues: v42 (ref), v21 (ref), v87 (ref)
    if not v42.visuals.animbreakers:get() then
        return;
    else
        local v544 = entity.get_local_player();
        if not v544 then
            return;
        else
            local v545 = v544.m_vecVelocity:length();
            local l_tickcount_0 = globals.tickcount;
            local l_m_flPoseParameter_0 = v544.m_flPoseParameter;
            local l_animbreakers_0 = v42.visuals.animbreakers;
            if not v42.visuals.animbreakers.addons:get("Earthquake") or l_tickcount_0 % 4 <= 1 then
                local v549 = l_animbreakers_0.air:get();
                if v549 == "Disabled" then
                    return;
                elseif v549 == "Static" then
                    l_m_flPoseParameter_0[6] = 1;
                elseif v549 == "Moonwalk" and v545 > 5 then
                    entity.get_anim_layer(v21(v544:get_index()), 6).m_flWeight = 1;
                end;
            end;
            local v550 = l_animbreakers_0.ground:get();
            if v550 == "Disabled" then
                return;
            else
                if v550 == "Reversed" then
                    l_m_flPoseParameter_0[0] = 1;
                    v87.leg:override("Sliding");
                elseif v550 == "Moonwalk" then
                    l_m_flPoseParameter_0[7] = 1;
                    v87.leg:override("Walking");
                end;
                if v42.visuals.animbreakers.addons:get("Move Lean") and v545 >= 3 then
                    entity.get_anim_layer(v21(v544:get_index()), 12).m_flWeight = l_animbreakers_0.movelean:get() / 100;
                end;
                return;
            end;
        end;
    end;
end);
local v551 = {
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
events.aim_ack:set(function(v552)
    -- upvalues: v42 (ref), v551 (ref)
    if v42.visuals.widgets:get() and v42.visuals.widgets.pos:get(1) then
        local _ = entity.get_local_player();
        local v554 = entity.get(v552.target);
        local _ = v552.damage;
        local l_wanted_damage_0 = v552.wanted_damage;
        local v557 = v551[v552.wanted_hitgroup];
        local l_hitchance_0 = v552.hitchance;
        local l_state_0 = v552.state;
        local l_state_1 = v552.state;
        local l_backtrack_0 = v552.backtrack;
        if not v554 then
            return;
        elseif v554 == nil then
            return;
        else
            local l_m_iHealth_1 = v554.m_iHealth;
            if l_state_1 == "config issue" then
                l_state_1 = "\aFEEA7DFFconfig issue";
            end;
            if l_state_1 == "prediction error" then
                l_state_1 = "\aFEEA7DFFprediction error";
            end;
            if l_state_1 == "resolver" then
                l_state_1 = "\aFF5959FFresolver";
            end;
            if l_state_1 == "misprediction" then
                l_state_1 = "\aFEEA7DFFmisprediction";
            end;
            if l_state_1 == "lagcomp failure" then
                l_state_1 = "\aFF5959FFlagcomp failure";
            end;
            if l_state_0 == "correction" then
                l_state_0 = "correction";
            end;
            local v563 = v551[v552.hitgroup];
            local v564 = l_m_iHealth_1 <= 0 and "Killed" or "Damage";
            if l_state_0 == nil then
                print_dev(("\a85baffffmeowhook \aDEFAULT\226\128\186 \aD5D5D5FF%s \a85a6ffFF%s \aDEFAULThb: \a85a6ffFF%s/\aDEFAULT%s \aDEFAULTdmg: \a85a6ffFF%d\aDEFAULT/%d \aDEFAULTbt: \a85a6ffFF%s\aDEFAULT hc: \a85a6ffFF%s\aDEFAULT rhp: \a85a6ffFF%s \aDEFAULT"):format(v564, v554:get_name(), v563, v557, v552.damage, l_wanted_damage_0, l_backtrack_0, l_hitchance_0, l_m_iHealth_1));
                print_raw(("\a85baffffmeowhook \aDEFAULT\226\128\186 \aD5D5D5FF%s \a85a6ffFF%s \aDEFAULThb: \a85a6ffFF%s/\aDEFAULT%s \aDEFAULTdmg: \a85a6ffFF%d\aDEFAULT/%d \aDEFAULTbt: \a85a6ffFF%s\aDEFAULT hc: \a85a6ffFF%s\aDEFAULT rhp: \a85a6ffFF%s \aDEFAULT"):format(v564, v554:get_name(), v563, v557, v552.damage, l_wanted_damage_0, l_backtrack_0, l_hitchance_0, l_m_iHealth_1));
            else
                print_dev(("\a85baffffmeowhook \aDEFAULT\226\128\186 \aD5D5D5FFMissed shot in \a\aFF3434C8%s \aDEFAULThb: \a\aFF3434C8%s \aDEFAULTdue: \a\aFF3434C8" .. l_state_0 .. "\aDEFAULT"):format(v554:get_name(), v557));
                print_raw(("\a85baffffmeowhook \aDEFAULT\226\128\186 \aD5D5D5FFMissed shot in \a\aFF3434C8%s \aDEFAULThb: \a\aFF3434C8%s \aDEFAULTdue: \a\aFF3434C8" .. l_state_0 .. ""):format(v554:get_name(), v557));
            end;
        end;
    end;
end);
events.player_hurt:set(function(v565)
    -- upvalues: v42 (ref)
    if v42.visuals.widgets:get() and v42.visuals.widgets.pos:get("Hurt") then
        local v566 = entity.get_local_player();
        local v567 = entity.get(v565.attacker, true);
        local l_weapon_0 = v565.weapon;
        local v569 = nil;
        local v570 = v565.health <= 0;
        v569 = l_weapon_0 == "hegrenade" and "Naded" or l_weapon_0 == "inferno" and "Burned" or l_weapon_0 == "knife" and "Knifed" or "Hit";
        if v570 and (l_weapon_0 == "hegrenade" or l_weapon_0 == "inferno" or l_weapon_0 == "knife") then
            v569 = "Killed";
        end;
        if v566 == v567 and (l_weapon_0 == "hegrenade" or l_weapon_0 == "inferno" or l_weapon_0 == "knife") then
            local v571 = entity.get(v565.userid, true);
            local v572 = ("\a85baffffmeowhook \aDEFAULT\226\128\186 \aD5D5D5FF" .. v569 .. " \a85a6ffFF%s \aDEFAULTfor \a85a6ffFF%d \aDEFAULTdamage (\a85a6ffFF%d \aDEFAULThp remaining)"):format(v571:get_name(), v565.dmg_health, v565.health);
            print_raw(v572);
            print_dev(v572);
        end;
    end;
end);
local v573 = {
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
local v574 = {
    inferno = "Burned", 
    hegrenade = "Naded", 
    knife = "Knifed"
};
local v575 = {};
events.player_hurt:set(function(v576)
    -- upvalues: v42 (ref), v574 (ref), v575 (ref)
    if v42.visuals.widgets:get() and v42.visuals.widgets.pos:get("Hurt") then
        local v577 = entity.get_local_player();
        local v578 = entity.get(v576.attacker, true);
        local v579 = v574[v576.weapon] or "Hit";
        if v577 == v578 then
            local v580 = entity.get(v576.userid, true);
            local v581 = ("\a85baffffmeowhook \aDEFAULT\226\128\186 \aD5D5D5FF" .. v579 .. " \a85a6ffFF%s \aDEFAULTfor \a85a6ffFF%d \aDEFAULTdamage (\a85a6ffFF%d \aDEFAULThp remaining)"):format(v580:get_name(), v576.dmg_health, v576.health);
            v575[#v575 + 1] = {
                [1] = nil, 
                [2] = nil, 
                [3] = 0, 
                [1] = v581, 
                [2] = globals.tickcount + 250
            };
        end;
    end;
end);
add_hit_log = function(v582, v583)
    -- upvalues: v575 (ref)
    local v584 = v583 and color(0, 255, 0, 255) or color(255, 0, 0, 255);
    table.insert(v575, {
        [1] = nil, 
        [2] = nil, 
        [3] = 0, 
        [1] = v582, 
        [2] = globals.tickcount + 250, 
        [4] = v584
    });
end;
local v585 = {};
local v586 = false;
local v587 = {
    inferno = "Burned", 
    hegrenade = "Naded", 
    knife = "Knifed"
};
add_log = function(v588, v589)
    -- upvalues: v42 (ref), v585 (ref), v91 (ref)
    if not v42.visuals.widgets:get() then
        return;
    else
        if #v585 >= 3 then
            table.remove(v585, 1);
        end;
        table.insert(v585, {
            y_offset = 0, 
            message = v588, 
            type = v589, 
            time = globals.tickcount + 80, 
            alpha = v91.new("alpha_" .. #v585 + 1, 0, 12)
        });
        return;
    end;
end;
events.player_hurt:set(function(v590)
    -- upvalues: v587 (ref), v586 (ref), v237 (ref)
    if entity.get_local_player() == entity.get(v590.attacker, true) then
        local v591 = entity.get(v590.userid, true);
        if not v591 then
            return;
        else
            local v592 = v590.dmg_health >= v591.m_iHealth;
            local v593 = v587[v590.weapon] or "Damage";
            local v594 = v592 and string.format("\a808080FFKilled \aFFFFFFFF%s \a808080FFfor \aFFFFFFFF%d \a808080FFdamage", v591:get_name(), v590.dmg_health) or string.format("\a808080FF%s \aFFFFFFFF%s \a808080FFfor \aFFFFFFFF%d \a808080FFdamage", v593, v591:get_name(), v590.dmg_health);
            add_log(v594, "Damage");
            v586 = true;
            v237.hit_count = v237.hit_count + 1;
            v237.kd = v237.hit_count / math.max(v237.miss_count, 1);
        end;
    end;
end);
events.aim_ack:set(function(v595)
    -- upvalues: v586 (ref), v573 (ref), v237 (ref)
    if not v586 then
        add_log(string.format("\a808080FFMissed \aFFFFFFFF%s \a808080FFin the \aFFFFFFFF%s \a808080FFdue to \aFFFFFFFF%s", v595.target:get_name(), v573[v595.wanted_hitgroup], v595.state), "Miss");
        v237.miss_count = v237.miss_count + 1;
        v237.kd = v237.hit_count / math.max(v237.miss_count, 1);
    end;
    v586 = false;
end);
events.render:set(function()
    -- upvalues: v42 (ref), v121 (ref), v585 (ref)
    local v596 = v42.visuals.widgets:get();
    local v597 = v42.visuals.widgets.pos:get("Screen");
    if not v596 and not v597 then
        return;
    else
        local v598 = entity.get_local_player();
        if not v598 or not v598:is_alive() then
            return;
        else
            local v599 = v121.y / 1.3 + math.min(math.max(v42.visuals.widgets.offset:get() or 0, 0), 200);
            local v600 = v42.visuals.widgets.color:get();
            local v601 = {};
            local v602 = 4;
            while v602 < #v585 do
                table.remove(v585, 1);
            end;
            for v603 = #v585, 1, -1 do
                local v604 = v585[v603];
                local v605 = globals.tickcount - v604.time;
                local v606 = 90;
                local v607 = 15;
                local v608 = 20;
                if v604.alpha == nil then
                    v604.alpha = 0;
                end;
                v604.target_y = v599 - (v603 - 1) * 35;
                if v604.current_y == nil then
                    v604.current_y = v599 + 20;
                end;
                if v605 < v607 then
                    v604.alpha = math.min(v604.alpha + 255 / v607, 255);
                elseif v606 - v608 <= v605 then
                    local v609 = (v605 - (v606 - v608)) / v608;
                    v604.alpha = math.max(255 * (1 - v609), 0);
                else
                    v604.alpha = 255;
                end;
                if v606 < v605 and v604.alpha <= 0.01 then
                    table.insert(v601, v603);
                end;
                if v604.current_y ~= v604.target_y then
                    local v610 = v604.target_y - v604.current_y;
                    v604.current_y = v604.current_y + v610 * 0.2;
                    if math.abs(v610) < 0.1 then
                        v604.current_y = v604.target_y;
                    end;
                end;
                if v604.alpha > 0 then
                    local v611 = "meowhook \226\128\186";
                    if v42.visuals.widgets.typed:get() == "meow" then
                        v611 = "meowhook \226\128\186";
                    elseif v42.visuals.widgets.typed:get() == "paw" then
                        v611 = ui.get_icon("paw") .. " \226\128\186";
                    end;
                    local l_x_4 = render.measure_text(1, nil, v611).x;
                    local l_x_5 = render.measure_text(1, nil, v604.message).x;
                    local v614 = l_x_4 + 5 + l_x_5;
                    local v615 = vector(v121.x / 2 - v614 / 2 - 11, v604.current_y - 13 + 0.75);
                    local v616 = vector(v121.x / 2 + v614 / 2 + 11, v604.current_y + 13 - 0.75);
                    render.shadow(v615, v616, color(0, 0, 0, v604.alpha * 0.15), 120, 0, 3);
                    local v617 = v604.alpha * 0.3;
                    local v618 = color(0, 0, 0, v617);
                    local v619 = color(0, 0, 0, v617 * 0.7);
                    render.gradient(v615, v616, v618, v618, v619, v619, 3);
                    render.rect(v615, v616, color(0, 0, 0, v604.alpha * 0.3), 3);
                    local l_y_6 = render.measure_text(1, nil, v611).y;
                    local v621 = v616.y - v615.y;
                    local v622 = v615.y + (v621 - l_y_6) / 2;
                    local v623 = vector(v615.x + 10, v622);
                    local v624 = vector(v623.x + l_x_4 + 5, v622);
                    render.text(1, v623, color(v600.r, v600.g, v600.b, v604.alpha), nil, v611);
                    render.text(1, v624, color(255, 255, 255, v604.alpha), nil, v604.message);
                end;
            end;
            for v625 = #v601, 1, -1 do
                table.remove(v585, v601[v625]);
            end;
            return;
        end;
    end;
end);
events.round_start(function()
    -- upvalues: v585 (ref)
    v585 = {};
end);
events.player_spawned(function()
    -- upvalues: v585 (ref)
    v585 = {};
end);
local l_world_to_screen_0 = render.world_to_screen;
local _ = render.text;
local _ = render.screen_size;
local _ = ui.find;
local v630 = 0.5;
local v631 = 1;
local v632 = {};
render_markers = function()
    -- upvalues: v42 (ref), v632 (ref), v630 (ref), v91 (ref), l_world_to_screen_0 (ref)
    if not v42.misc.marker:get() then
        return;
    else
        for v633, v634 in pairs(v632) do
            if v634.fade_time <= 0 then
                v632[v633] = nil;
            else
                v634.wait_time = v634.wait_time - globals.frametime;
                if v634.wait_time <= 0 then
                    v634.fade_time = v634.fade_time - 1 / v630 * globals.frametime;
                end;
                local v635 = v91.new("fade_alpha_" .. v633, v634.wait_time > 0 and 255 or 0, 5, 0);
                if v634.position.x ~= nil and v634.position.y ~= nil and v634.position.z ~= nil and v634.reason == nil then
                    local v636 = l_world_to_screen_0(vector(v634.position.x, v634.position.y, v634.position.z));
                    if v636 ~= nil then
                        local l_x_6 = v636.x;
                        local l_y_7 = v636.y;
                        local v639 = v42.misc.marker.type_kotik:get();
                        local v640 = ({
                            [1] = "\240\159\144\190", 
                            [2] = "\240\159\152\187", 
                            [3] = "\240\159\152\189", 
                            [4] = "\240\159\153\128", 
                            [5] = "\240\159\152\188"
                        })[v639] or "";
                        render.text(15, vector(l_x_6, l_y_7), color(255, 255, 255, v635), nil, v640);
                    end;
                end;
            end;
        end;
        return;
    end;
end;
record_shot = function(v641)
    -- upvalues: v632 (ref), v631 (ref)
    v632[v641.id] = {
        fade_time = 1, 
        position = v641.aim, 
        wait_time = v631, 
        reason = v641.state
    };
end;
events.render:set(render_markers);
events.aim_ack:set(record_shot);
events.round_start:set(function()
    -- upvalues: v632 (ref)
    v632 = {};
end);
events.player_spawned:set(function()
    -- upvalues: v632 (ref)
    v632 = {};
end);
local v642 = false;
manage_filters = function()
    -- upvalues: v42 (ref), v642 (ref), v88 (ref)
    if v42.visuals.widgets.pos:get("Console") then
        if not v642 then
            utils.console_exec("clear");
            v642 = true;
        end;
        v88.filter:set("Console");
    else
        v642 = false;
        v88.filter:set("");
    end;
end;
local v643 = {
    [1] = v42.builder, 
    [2] = building.start
};
local l_visuals_0 = v42.visuals;
local l_misc_0 = v42.misc;
l_pui_0.setup({
    [1] = v643, 
    [2] = l_visuals_0, 
    [3] = l_misc_0
});
local v646 = "buttons/bell1";
local v647 = "buttons/button9";
export = v76("presets.export", v37, function()
    -- upvalues: v42 (ref), l_pui_0 (ref), l_base64_0 (ref), l_clipboard_0 (ref), v51 (ref), v646 (ref)
    if v42.configs.presets_list:get() ~= 1 then
        local v648 = l_pui_0.save();
        local v649 = presets_data.name[v42.configs.presets_list:get()];
        local v650 = l_base64_0.encode(json.stringify({
            name = v649, 
            file = v648
        }));
        l_clipboard_0.set(v650);
        v51 = globals.realtime;
        print_dev("Configuration\aFFC0CBFF " .. v649 .. " \aDEFAULThas been successfully exported.");
        cvar.play:call(v646);
    end;
end);
import = v76("presets.import", v37, function()
    -- upvalues: l_clipboard_0 (ref), l_base64_0 (ref), v84 (ref), v42 (ref), v50 (ref), v646 (ref)
    local v651 = l_clipboard_0.get();
    if v651 and v651 ~= "" then
        local l_status_1, l_result_1 = pcall(function()
            -- upvalues: l_base64_0 (ref), v651 (ref)
            return json.parse(l_base64_0.decode(v651));
        end);
        if not l_status_1 or not l_result_1 or not l_result_1.name or not l_result_1.file then
            print_dev("Invalid configuration data in clipboard.");
            return;
        else
            if v84(presets_data.name, l_result_1.name) then
                local v654 = locate_index(presets_data.name, l_result_1.name);
                presets_data.file[v654] = l_result_1.file;
                print_dev("Configuration\aFFC0CBFF " .. l_result_1.name .. " \aDEFAULThas been successfully updated.");
            else
                table.insert(presets_data.name, l_result_1.name);
                table.insert(presets_data.file, l_result_1.file);
                print_dev("Configuration\aFFC0CBFF " .. l_result_1.name .. " \aDEFAULThas been successfully imported.");
            end;
            v42.configs.presets_list:update(presets_data.name);
            files.write("nl/meowhook/meow.txt", l_base64_0.encode(json.stringify(presets_data)));
            v50 = globals.realtime;
            cvar.play:call(v646);
        end;
    end;
end);
create = v76("presets.save", v37, function()
    -- upvalues: v42 (ref), l_pui_0 (ref), v84 (ref), l_base64_0 (ref), v646 (ref), v52 (ref), v647 (ref)
    local v655 = v42.configs.presets_name:get();
    local v656 = l_pui_0.save();
    if not v84(presets_data.name, v655) and v42.configs.presets_name:get() ~= "" then
        table.insert(presets_data.name, v655);
        table.insert(presets_data.file, v656);
        files.write("nl/meowhook/meowing.txt", l_base64_0.encode(json.stringify(presets_data)));
        v42.configs.presets_list:update(presets_data.name);
        print_dev("Configuration \aFFC0CBFF" .. v655 .. "\aDEFAULT has been successfully create.");
        cvar.play:call(v646);
    elseif v84(presets_data.name, v655) then
        v52 = globals.realtime;
        print_dev("This configuration\aFFC0CBFF " .. v655 .. " \aDEFAULTalready exist.");
        cvar.play:call(v647);
    end;
end);
save = v76("presets.save", v37, function()
    -- upvalues: v42 (ref), l_pui_0 (ref), l_base64_0 (ref), v646 (ref)
    if v42.configs.presets_list:get() ~= 1 then
        local v657 = presets_data.name[v42.configs.presets_list:get()];
        presets_data.file[v42.configs.presets_list:get()] = l_pui_0.save();
        files.write("nl/meowhook/meowing.txt", l_base64_0.encode(json.stringify(presets_data)));
        print_dev("Configuration \aFFC0CBFF" .. v657 .. "\aDEFAULT has been successfully saved.");
        cvar.play:call(v646);
    end;
end);
remove = v76("presets.remove", v37, function()
    -- upvalues: v42 (ref), l_base64_0 (ref), v646 (ref)
    if v42.configs.presets_list:get() ~= 1 then
        local v658 = presets_data.name[v42.configs.presets_list:get()];
        table.remove(presets_data.name, v42.configs.presets_list:get());
        table.remove(presets_data.file, v42.configs.presets_list:get());
        files.write("nl/meowhook/meowing.txt", l_base64_0.encode(json.stringify(presets_data)));
        v42.configs.presets_list:update(presets_data.name);
        print_dev("Configuration \aFFC0CBFF" .. v658 .. "\aDEFAULT has been successfully remove.");
        cvar.play:call(v646);
    end;
end);
aa = v76("presets.aa", print_dev, function()
    -- upvalues: v42 (ref), l_pui_0 (ref), v646 (ref), l_base64_0 (ref)
    if v42.configs.presets_list:get() ~= 1 then
        local v659 = v42.configs.presets_list:get();
        local v660 = presets_data.file[v659];
        if not v660 then
            print_dev("Preset file not found for index: " .. tostring(v659));
            return;
        else
            if not v42.configs.presets_select:get(1) or not l_pui_0.load(v660, 1) then

            end;
            if not v42.configs.presets_select:get(2) or not l_pui_0.load(v660, 2) then

            end;
            if not v42.configs.presets_select:get(3) or not l_pui_0.load(v660, 3) then

            end;
            cvar.play:call(v646);
            print_dev("Configuration \aFFC0CBFF" .. presets_data.name[v659] .. " \aDEFAULThas been loaded.");
        end;
    else
        local v661 = json.parse(l_base64_0.decode("eyJmaWxlIjpbW3siYXV0b19vcyI6ZmFsc2UsImF2b2lkYmsiOnRydWUsImNvbmRpdGlvbnMiOiJBaXItQ3JvdWNoaW5nIiwiZGlzYWJsZXJzIjpmYWxzZSwiZWRnZXlhdyI6dHJ1ZSwiZnJlZXN0YW5kaW5nIjpmYWxzZSwibGFnZ2VyIjpmYWxzZSwibWFuYWdlciI6MS4wLCJtYW51YWwiOiJEaXNhYmxlZCIsInJvbGxpbmciOmZhbHNlLCJzYWZlIjp0cnVlLCJ0eXBlIjoxLjAsIn5hdXRvX29zIjp7InR5cGVzIjpbIn4iXX0sIn5lZGdleWF3Ijp7ImVkZ2Vfb25fZmQiOmZhbHNlfSwifmZyZWVzdGFuZGluZyI6eyJkaXNhYmxlcnMiOlsifiJdLCJzdGF0aWNfeWF3IjpmYWxzZX0sIn5sYWdnZXIiOnsic2xpZGVyIjowLjB9LCJ+bWFudWFsIjp7Imlnbm9yZV9mcmVlc3RhbmRpbmciOmZhbHNlLCJzdGF0aWNfbWFudWFscyI6ZmFsc2V9LCJ+cm9sbGluZyI6eyJyb2xsIjowLjAsInR5cGVzIjoiT2ZmIn0sIn5zYWZlIjp7InNlbGVjdCI6WzEuMCwyLjAsIn4iXX19LFt7ImJvZHl5YXciOnRydWUsImRlZmVuc2l2ZSI6ZmFsc2UsImZvcmNlX2xjIjpmYWxzZSwibGVmdF9vZmZzZXQiOjAuMCwibW9kaWZpZXIiOiJEaXNhYmxlZCIsIm1vZGlmaWVyX29mZnNldCI6MC4wLCJvZmZzZXRfeSI6MC4wLCJyaWdodF9vZmZzZXQiOjAuMCwic3RhdGVfZW5hYmxlIjpmYWxzZSwieWF3IjoiRGVmYXVsdCIsIn5ib2R5eWF3Ijp7ImRlbGF5IjoxLjAsImxlZnRfbGltaXQiOjYwLjAsImxlZnRfbGltaXRfcHJvZ3Jlc3NpdmUiOjYwLjAsImxlZnRfbGltaXRfcmFuZG9tIjo2MC4wLCJsaW1pdG1vZGUiOiJTdGF0aWMiLCJvcHRpb25zX3N3aXRjaCI6ZmFsc2UsInJhbmRvbWl6ZSI6MC4wLCJyaWdodF9saW1pdCI6NjAuMCwicmlnaHRfbGltaXRfcHJvZ3Jlc3NpdmUiOjYwLjAsInJpZ2h0X2xpbWl0X3JhbmRvbSI6NjAuMH0sIn5kZWZlbnNpdmUiOnsicF9jdXN0b20xIjowLjAsInBfY3VzdG9tMiI6MC4wLCJwX3JhbmRvbTEiOjAuMCwicF9yYW5kb20yIjowLjAsInBpdGNoIjoiRGlzYWJsZWQiLCJwaXRjaF9XYXlzX3NwZWVkIjoxLjAsInlhdyI6IkN1c3RvbSIsInlhd19jdXN0b20xIjowLjAsInlhd19jdXN0b20yIjowLjAsInlhd19yYW5kb20xIjowLjAsInlhd19yYW5kb20yIjowLjAsInlhd19zcGluX3NwZWVkIjoxLjB9fSx7ImJvZHl5YXciOnRydWUsImRlZmVuc2l2ZSI6ZmFsc2UsImZvcmNlX2xjIjpmYWxzZSwibGVmdF9vZmZzZXQiOi0yNC4wLCJtb2RpZmllciI6IkNlbnRlciIsIm1vZGlmaWVyX29mZnNldCI6LTExLjAsIm9mZnNldF95IjowLjAsInJpZ2h0X29mZnNldCI6MjYuMCwic3RhdGVfZW5hYmxlIjp0cnVlLCJ5YXciOiJNb2Rlcm4iLCJ+Ym9keXlhdyI6eyJkZWxheSI6MS4wLCJsZWZ0X2xpbWl0Ijo0OC4wLCJsZWZ0X2xpbWl0X3Byb2dyZXNzaXZlIjo2MC4wLCJsZWZ0X2xpbWl0X3JhbmRvbSI6NjAuMCwibGltaXRtb2RlIjoiU3RhdGljIiwib3B0aW9uc19zd2l0Y2giOnRydWUsInJhbmRvbWl6ZSI6Ni4wLCJyaWdodF9saW1pdCI6NTEuMCwicmlnaHRfbGltaXRfcHJvZ3Jlc3NpdmUiOjYwLjAsInJpZ2h0X2xpbWl0X3JhbmRvbSI6NjAuMH0sIn5kZWZlbnNpdmUiOnsicF9jdXN0b20xIjowLjAsInBfY3VzdG9tMiI6MC4wLCJwX3JhbmRvbTEiOjAuMCwicF9yYW5kb20yIjowLjAsInBpdGNoIjoiRGlzYWJsZWQiLCJwaXRjaF9XYXlzX3NwZWVkIjoxLjAsInlhdyI6IkN1c3RvbSIsInlhd19jdXN0b20xIjowLjAsInlhd19jdXN0b20yIjowLjAsInlhd19yYW5kb20xIjowLjAsInlhd19yYW5kb20yIjowLjAsInlhd19zcGluX3NwZWVkIjoxLjB9fSx7ImJvZHl5YXciOnRydWUsImRlZmVuc2l2ZSI6ZmFsc2UsImZvcmNlX2xjIjpmYWxzZSwibGVmdF9vZmZzZXQiOi0xOC4wLCJtb2RpZmllciI6IkNlbnRlciIsIm1vZGlmaWVyX29mZnNldCI6LTEyLjAsIm9mZnNldF95IjowLjAsInJpZ2h0X29mZnNldCI6MzYuMCwic3RhdGVfZW5hYmxlIjp0cnVlLCJ5YXciOiJNb2Rlcm4iLCJ+Ym9keXlhdyI6eyJkZWxheSI6MS4wLCJsZWZ0X2xpbWl0Ijo1MC4wLCJsZWZ0X2xpbWl0X3Byb2dyZXNzaXZlIjo2MC4wLCJsZWZ0X2xpbWl0X3JhbmRvbSI6NjAuMCwibGltaXRtb2RlIjoiU3RhdGljIiwib3B0aW9uc19zd2l0Y2giOnRydWUsInJhbmRvbWl6ZSI6NS4wLCJyaWdodF9saW1pdCI6NDkuMCwicmlnaHRfbGltaXRfcHJvZ3Jlc3NpdmUiOjYwLjAsInJpZ2h0X2xpbWl0X3JhbmRvbSI6NjAuMH0sIn5kZWZlbnNpdmUiOnsicF9jdXN0b20xIjowLjAsInBfY3VzdG9tMiI6MC4wLCJwX3JhbmRvbTEiOjAuMCwicF9yYW5kb20yIjowLjAsInBpdGNoIjoiRGlzYWJsZWQiLCJwaXRjaF9XYXlzX3NwZWVkIjoxLjAsInlhdyI6IkN1c3RvbSIsInlhd19jdXN0b20xIjowLjAsInlhd19jdXN0b20yIjowLjAsInlhd19yYW5kb20xIjowLjAsInlhd19yYW5kb20yIjowLjAsInlhd19zcGluX3NwZWVkIjoxLjB9fSx7ImJvZHl5YXciOnRydWUsImRlZmVuc2l2ZSI6ZmFsc2UsImZvcmNlX2xjIjpmYWxzZSwibGVmdF9vZmZzZXQiOjAuMCwibW9kaWZpZXIiOiJDZW50ZXIiLCJtb2RpZmllcl9vZmZzZXQiOjM2LjAsIm9mZnNldF95IjotMjguMCwicmlnaHRfb2Zmc2V0IjowLjAsInN0YXRlX2VuYWJsZSI6dHJ1ZSwieWF3IjoiRGVmYXVsdCIsIn5ib2R5eWF3Ijp7ImRlbGF5IjoxLjAsImxlZnRfbGltaXQiOjYwLjAsImxlZnRfbGltaXRfcHJvZ3Jlc3NpdmUiOjYwLjAsImxlZnRfbGltaXRfcmFuZG9tIjo2MC4wLCJsaW1pdG1vZGUiOiJTdGF0aWMiLCJvcHRpb25zX3N3aXRjaCI6dHJ1ZSwicmFuZG9taXplIjoxMDAuMCwicmlnaHRfbGltaXQiOjYwLjAsInJpZ2h0X2xpbWl0X3Byb2dyZXNzaXZlIjo2MC4wLCJyaWdodF9saW1pdF9yYW5kb20iOjYwLjB9LCJ+ZGVmZW5zaXZlIjp7InBfY3VzdG9tMSI6MC4wLCJwX2N1c3RvbTIiOjAuMCwicF9yYW5kb20xIjowLjAsInBfcmFuZG9tMiI6MC4wLCJwaXRjaCI6IkRpc2FibGVkIiwicGl0Y2hfV2F5c19zcGVlZCI6MS4wLCJ5YXciOiJDdXN0b20iLCJ5YXdfY3VzdG9tMSI6MC4wLCJ5YXdfY3VzdG9tMiI6MC4wLCJ5YXdfcmFuZG9tMSI6MC4wLCJ5YXdfcmFuZG9tMiI6MC4wLCJ5YXdfc3Bpbl9zcGVlZCI6MS4wfX0seyJib2R5eWF3Ijp0cnVlLCJkZWZlbnNpdmUiOnRydWUsImZvcmNlX2xjIjp0cnVlLCJsZWZ0X29mZnNldCI6LTI3LjAsIm1vZGlmaWVyIjoiQ2VudGVyIiwibW9kaWZpZXJfb2Zmc2V0IjotMTcuMCwib2Zmc2V0X3kiOjAuMCwicmlnaHRfb2Zmc2V0IjozMS4wLCJzdGF0ZV9lbmFibGUiOnRydWUsInlhdyI6Ik1vZGVybiIsIn5ib2R5eWF3Ijp7ImRlbGF5IjoyLjAsImxlZnRfbGltaXQiOjYwLjAsImxlZnRfbGltaXRfcHJvZ3Jlc3NpdmUiOjYwLjAsImxlZnRfbGltaXRfcmFuZG9tIjo2MC4wLCJsaW1pdG1vZGUiOiJTdGF0aWMiLCJvcHRpb25zX3N3aXRjaCI6dHJ1ZSwicmFuZG9taXplIjowLjAsInJpZ2h0X2xpbWl0Ijo2MC4wLCJyaWdodF9saW1pdF9wcm9ncmVzc2l2ZSI6NjAuMCwicmlnaHRfbGltaXRfcmFuZG9tIjo2MC4wfSwifmRlZmVuc2l2ZSI6eyJwX2N1c3RvbTEiOi03Ny4wLCJwX2N1c3RvbTIiOjEyMy4wLCJwX3JhbmRvbTEiOi0xMTYuMCwicF9yYW5kb20yIjoxMjEuMCwicGl0Y2giOiJDdXN0b20iLCJwaXRjaF9XYXlzX3NwZWVkIjoxLjAsInlhdyI6IlNwaW4iLCJ5YXdfY3VzdG9tMSI6MC4wLCJ5YXdfY3VzdG9tMiI6MC4wLCJ5YXdfcmFuZG9tMSI6MC4wLCJ5YXdfcmFuZG9tMiI6MC4wLCJ5YXdfc3Bpbl9zcGVlZCI6NS4wfX0seyJib2R5eWF3Ijp0cnVlLCJkZWZlbnNpdmUiOmZhbHNlLCJmb3JjZV9sYyI6ZmFsc2UsImxlZnRfb2Zmc2V0IjotMjAuMCwibW9kaWZpZXIiOiJDZW50ZXIiLCJtb2RpZmllcl9vZmZzZXQiOi0yNi4wLCJvZmZzZXRfeSI6MTguMCwicmlnaHRfb2Zmc2V0IjoyMC4wLCJzdGF0ZV9lbmFibGUiOnRydWUsInlhdyI6Ik1vZGVybiIsIn5ib2R5eWF3Ijp7ImRlbGF5IjoyLjAsImxlZnRfbGltaXQiOjYwLjAsImxlZnRfbGltaXRfcHJvZ3Jlc3NpdmUiOjYwLjAsImxlZnRfbGltaXRfcmFuZG9tIjo2MC4wLCJsaW1pdG1vZGUiOiJTdGF0aWMiLCJvcHRpb25zX3N3aXRjaCI6dHJ1ZSwicmFuZG9taXplIjowLjAsInJpZ2h0X2xpbWl0Ijo2MC4wLCJyaWdodF9saW1pdF9wcm9ncmVzc2l2ZSI6NjAuMCwicmlnaHRfbGltaXRfcmFuZG9tIjo2MC4wfSwifmRlZmVuc2l2ZSI6eyJwX2N1c3RvbTEiOjAuMCwicF9jdXN0b20yIjowLjAsInBfcmFuZG9tMSI6MC4wLCJwX3JhbmRvbTIiOjAuMCwicGl0Y2giOiJEaXNhYmxlZCIsInBpdGNoX1dheXNfc3BlZWQiOjEuMCwieWF3IjoiQ3VzdG9tIiwieWF3X2N1c3RvbTEiOjAuMCwieWF3X2N1c3RvbTIiOjAuMCwieWF3X3JhbmRvbTEiOjAuMCwieWF3X3JhbmRvbTIiOjAuMCwieWF3X3NwaW5fc3BlZWQiOjEuMH19LHsiYm9keXlhdyI6dHJ1ZSwiZGVmZW5zaXZlIjpmYWxzZSwiZm9yY2VfbGMiOmZhbHNlLCJsZWZ0X29mZnNldCI6LTE0LjAsIm1vZGlmaWVyIjoiT2Zmc2V0IiwibW9kaWZpZXJfb2Zmc2V0IjotMjMuMCwib2Zmc2V0X3kiOjAuMCwicmlnaHRfb2Zmc2V0IjoxNi4wLCJzdGF0ZV9lbmFibGUiOnRydWUsInlhdyI6Ik1vZGVybiIsIn5ib2R5eWF3Ijp7ImRlbGF5IjoxLjAsImxlZnRfbGltaXQiOjQ4LjAsImxlZnRfbGltaXRfcHJvZ3Jlc3NpdmUiOjYwLjAsImxlZnRfbGltaXRfcmFuZG9tIjo2MC4wLCJsaW1pdG1vZGUiOiJTdGF0aWMiLCJvcHRpb25zX3N3aXRjaCI6dHJ1ZSwicmFuZG9taXplIjo3LjAsInJpZ2h0X2xpbWl0Ijo1My4wLCJyaWdodF9saW1pdF9wcm9ncmVzc2l2ZSI6NjAuMCwicmlnaHRfbGltaXRfcmFuZG9tIjo2MC4wfSwifmRlZmVuc2l2ZSI6eyJwX2N1c3RvbTEiOjAuMCwicF9jdXN0b20yIjowLjAsInBfcmFuZG9tMSI6MC4wLCJwX3JhbmRvbTIiOjAuMCwicGl0Y2giOiJEaXNhYmxlZCIsInBpdGNoX1dheXNfc3BlZWQiOjEuMCwieWF3IjoiQ3VzdG9tIiwieWF3X2N1c3RvbTEiOjAuMCwieWF3X2N1c3RvbTIiOjAuMCwieWF3X3JhbmRvbTEiOjAuMCwieWF3X3JhbmRvbTIiOjAuMCwieWF3X3NwaW5fc3BlZWQiOjEuMH19LHsiYm9keXlhdyI6dHJ1ZSwiZGVmZW5zaXZlIjpmYWxzZSwiZm9yY2VfbGMiOmZhbHNlLCJsZWZ0X29mZnNldCI6LTI0LjAsIm1vZGlmaWVyIjoiQ2VudGVyIiwibW9kaWZpZXJfb2Zmc2V0IjotMTQuMCwib2Zmc2V0X3kiOjAuMCwicmlnaHRfb2Zmc2V0IjoyOC4wLCJzdGF0ZV9lbmFibGUiOnRydWUsInlhdyI6Ik1vZGVybiIsIn5ib2R5eWF3Ijp7ImRlbGF5IjoyLjAsImxlZnRfbGltaXQiOjU2LjAsImxlZnRfbGltaXRfcHJvZ3Jlc3NpdmUiOjYwLjAsImxlZnRfbGltaXRfcmFuZG9tIjo2MC4wLCJsaW1pdG1vZGUiOiJTdGF0aWMiLCJvcHRpb25zX3N3aXRjaCI6dHJ1ZSwicmFuZG9taXplIjowLjAsInJpZ2h0X2xpbWl0Ijo0NS4wLCJyaWdodF9saW1pdF9wcm9ncmVzc2l2ZSI6NjAuMCwicmlnaHRfbGltaXRfcmFuZG9tIjo2MC4wfSwifmRlZmVuc2l2ZSI6eyJwX2N1c3RvbTEiOjAuMCwicF9jdXN0b20yIjowLjAsInBfcmFuZG9tMSI6MC4wLCJwX3JhbmRvbTIiOjAuMCwicGl0Y2giOiJEaXNhYmxlZCIsInBpdGNoX1dheXNfc3BlZWQiOjEuMCwieWF3IjoiQ3VzdG9tIiwieWF3X2N1c3RvbTEiOjAuMCwieWF3X2N1c3RvbTIiOjAuMCwieWF3X3JhbmRvbTEiOjAuMCwieWF3X3JhbmRvbTIiOjAuMCwieWF3X3NwaW5fc3BlZWQiOjEuMH19LHsiYm9keXlhdyI6ZmFsc2UsImRlZmVuc2l2ZSI6ZmFsc2UsImZvcmNlX2xjIjpmYWxzZSwibGVmdF9vZmZzZXQiOjAuMCwibW9kaWZpZXIiOiJEaXNhYmxlZCIsIm1vZGlmaWVyX29mZnNldCI6MC4wLCJvZmZzZXRfeSI6MC4wLCJyaWdodF9vZmZzZXQiOjAuMCwic3RhdGVfZW5hYmxlIjpmYWxzZSwieWF3IjoiRGVmYXVsdCIsIn5ib2R5eWF3Ijp7ImRlbGF5IjoxLjAsImxlZnRfbGltaXQiOjYwLjAsImxlZnRfbGltaXRfcHJvZ3Jlc3NpdmUiOjYwLjAsImxlZnRfbGltaXRfcmFuZG9tIjo2MC4wLCJsaW1pdG1vZGUiOiJTdGF0aWMiLCJvcHRpb25zX3N3aXRjaCI6ZmFsc2UsInJhbmRvbWl6ZSI6MC4wLCJyaWdodF9saW1pdCI6NjAuMCwicmlnaHRfbGltaXRfcHJvZ3Jlc3NpdmUiOjYwLjAsInJpZ2h0X2xpbWl0X3JhbmRvbSI6NjAuMH0sIn5kZWZlbnNpdmUiOnsicF9jdXN0b20xIjowLjAsInBfY3VzdG9tMiI6MC4wLCJwX3JhbmRvbTEiOjAuMCwicF9yYW5kb20yIjowLjAsInBpdGNoIjoiRGlzYWJsZWQiLCJwaXRjaF9XYXlzX3NwZWVkIjoxLjAsInlhdyI6IkN1c3RvbSIsInlhd19jdXN0b20xIjowLjAsInlhd19jdXN0b20yIjowLjAsInlhd19yYW5kb20xIjowLjAsInlhd19yYW5kb20yIjowLjAsInlhd19zcGluX3NwZWVkIjoxLjB9fV1dLHsiYW5pbWJyZWFrZXJzIjp0cnVlLCJhc3BlY3QiOnRydWUsIm1hbnVhbF9hcnJvd3MiOmZhbHNlLCJtaW5kbWciOnRydWUsInBlcmZvbWFuY2UiOnRydWUsInNjb3BlIjp0cnVlLCJzaWxlbmNlZCI6eyJzZWxlY3Rpb24iOjEuMH0sInR5cGUiOjEuMCwidmlld21vZGVsIjp0cnVlLCJ+YW5pbWJyZWFrZXJzIjp7ImFkZG9ucyI6WzEuMCwifiJdLCJhaXIiOjIuMCwiZ3JvdW5kIjoyLjAsIm1vdmVsZWFuIjoxMDAuMH0sIn5hc3BlY3QiOnsidmFsIjoxNDEuMH0sIn5tYW51YWxfYXJyb3dzIjp7ImNvbG9yX2Fycm93cyI6IiNGN0FGRkZGRiIsInNsaWRlcl9hcnJvd3NfeCI6NS4wLCJzdHlsZWQiOjEuMH0sIn5taW5kbWciOnsiZGFtYWdlX2FscGhhIjo1MC4wLCJkYW1hZ2VfY29sb3IiOiIjRkZGRkZGRkYiLCJkYW1hZ2VfcG9zaXRpb25feCI6OTY4LjAsImRhbWFnZV9wb3NpdGlvbl95Ijo1MjIuMCwiZGFtYWdlX3NlbGVjdGlvbiI6MS4wfSwifnNjb3BlIjp7ImNvbG9yIjoiI0ZGRkZGRkZGIiwiZ2FwIjozLjAsImxlbmd0aCI6MjEwLjAsInNlbGVjdCI6WyJ+Il19LCJ+dmlld21vZGVsIjp7ImZvdiI6Mjg0LjAsInhfYXhpcyI6MjEuMCwieV9heGlzIjo0OS4wLCJ6X2F4aXMiOjEwLjB9fSx7ImFpbWJvdGxvZ3MiOnRydWUsImFpbXRvb2xzIjp0cnVlLCJiYXJzIjpmYWxzZSwiY2xhbnRhZyI6dHJ1ZSwiZmFzdGxhZGRlciI6dHJ1ZSwiaGl0Y2hhbmNlIjpmYWxzZSwibWFya2VyIjp0cnVlLCJwaW5ndW5sb2NrZXIiOjAuMCwic2NvdXQiOmZhbHNlLCJ0cmFzaHRhbGsiOmZhbHNlLCJ+YWltYm90bG9ncyI6eyJmaWx0ZXIiOmZhbHNlLCJnbG93X21vZGVybiI6IiNGRkRBRjhGRiIsIm9mZnNldCI6MjAwLjAsInBvcyI6WzEuMCwyLjAsMy4wLCJ+Il19LCJ+YWltdG9vbHMiOnsiYWRhcHRpdmUiOnRydWUsImJvZHlfaF9zbGlkZXJfbXAiOjAuMCwiYm9keV9sX3NsaWRlcl9tcCI6MC4wLCJoZWFkX2hfc2xpZGVyX21wIjowLjAsImhlYWRfbF9zbGlkZXJfbXAiOjAuMCwiaGlnaF9lbmFibGUiOmZhbHNlLCJoaWdoX2VuYWJsZV9tcCI6ZmFsc2UsImhpZ2hfc2xpZGVyIjowLjAsImxvd2VyX2VuYWJsZSI6ZmFsc2UsImxvd2VyX2VuYWJsZV9tcCI6ZmFsc2UsImxvd2VyX3NsaWRlciI6MC4wLCJzZWxlY3QiOjEuMCwidHlwZV9sZXRoYWwiOlsiQmFpbSBvbiBsZXRoYWwiLCJTYWZlIFBvaW50cyBvbiBsZXRoYWwiLCJ+Il19LCJ+YmFycyI6eyJhY3RpdmUiOmZhbHNlLCJtb2RlIjpbIn4iXX0sIn5oaXRjaGFuY2UiOnsiYXRzbmlwZXJfY2hhbmNlIjowLjAsImF0c25pcGVyX256Y2hhbmNlIjowLjAsImF3cF9jaGFuY2UiOjAuMCwiYXdwX256Y2hhbmNlIjowLjAsImVuYWJsZV9hdCI6ZmFsc2UsImVuYWJsZV9hd3AiOmZhbHNlLCJlbmFibGVfcjgiOmZhbHNlLCJlbmFibGVfc3NnIjpmYWxzZSwiaW5haXJfaGMiOjEuMCwicmV2b2x2ZXJfY2hhbmNlIjowLjAsInNzZzA4X2NoYW5jZSI6MC4wLCJzc2cwOF9uemNoYW5jZSI6MC4wfSwifm1hcmtlciI6eyJ0eXBlX2tvdGlrIjoxLjB9LCJ+dHJhc2h0YWxrIjp7InRyYXNodGFsa21vZGUiOlsifiJdfX1dLCJuYW1lIjoiMTIzIn0="));
        l_pui_0.load(v661.file, 1);
        l_pui_0.load(v661.file, 2);
        l_pui_0.load(v661.file, 3);
    end;
end);
exp = v76("presets.exp", v37, function()
    -- upvalues: l_base64_0 (ref), l_pui_0 (ref), v646 (ref)
    local v662 = json.parse(l_base64_0.decode("eyJmaWxlIjpbW3siYXV0b19vcyI6ZmFsc2UsImF2b2lkYmsiOnRydWUsImNvbmRpdGlvbnMiOiJBaXItQ3JvdWNoaW5nIiwiZGlzYWJsZXJzIjpmYWxzZSwiZWRnZXlhdyI6dHJ1ZSwiZnJlZXN0YW5kaW5nIjpmYWxzZSwibGFnZ2VyIjpmYWxzZSwibWFuYWdlciI6MS4wLCJtYW51YWwiOiJEaXNhYmxlZCIsInJvbGxpbmciOmZhbHNlLCJzYWZlIjp0cnVlLCJ0eXBlIjoyLjAsIn5hdXRvX29zIjp7InR5cGVzIjpbIn4iXX0sIn5lZGdleWF3Ijp7ImVkZ2Vfb25fZmQiOmZhbHNlfSwifmZyZWVzdGFuZGluZyI6eyJkaXNhYmxlcnMiOlsifiJdLCJzdGF0aWNfeWF3IjpmYWxzZX0sIn5sYWdnZXIiOnsic2xpZGVyIjowLjB9LCJ+bWFudWFsIjp7Imlnbm9yZV9mcmVlc3RhbmRpbmciOmZhbHNlLCJzdGF0aWNfbWFudWFscyI6ZmFsc2V9LCJ+cm9sbGluZyI6eyJyb2xsIjowLjAsInR5cGVzIjoiT2ZmIn0sIn5zYWZlIjp7InNlbGVjdCI6WzEuMCwyLjAsIn4iXX19LFt7ImJvZHl5YXciOnRydWUsImRlZmVuc2l2ZSI6ZmFsc2UsImZvcmNlX2xjIjpmYWxzZSwibGVmdF9vZmZzZXQiOjAuMCwibW9kaWZpZXIiOiJEaXNhYmxlZCIsIm1vZGlmaWVyX29mZnNldCI6MC4wLCJvZmZzZXRfeSI6MC4wLCJyaWdodF9vZmZzZXQiOjAuMCwic3RhdGVfZW5hYmxlIjpmYWxzZSwieWF3IjoiRGVmYXVsdCIsIn5ib2R5eWF3Ijp7ImRlbGF5IjoxLjAsImxlZnRfbGltaXQiOjYwLjAsImxlZnRfbGltaXRfcHJvZ3Jlc3NpdmUiOjYwLjAsImxlZnRfbGltaXRfcmFuZG9tIjo2MC4wLCJsaW1pdG1vZGUiOiJTdGF0aWMiLCJvcHRpb25zX3N3aXRjaCI6ZmFsc2UsInJhbmRvbWl6ZSI6MC4wLCJyaWdodF9saW1pdCI6NjAuMCwicmlnaHRfbGltaXRfcHJvZ3Jlc3NpdmUiOjYwLjAsInJpZ2h0X2xpbWl0X3JhbmRvbSI6NjAuMH0sIn5kZWZlbnNpdmUiOnsicF9jdXN0b20xIjowLjAsInBfY3VzdG9tMiI6MC4wLCJwX3JhbmRvbTEiOjAuMCwicF9yYW5kb20yIjowLjAsInBpdGNoIjoiRGlzYWJsZWQiLCJwaXRjaF9XYXlzX3NwZWVkIjoxLjAsInlhdyI6IkN1c3RvbSIsInlhd19jdXN0b20xIjowLjAsInlhd19jdXN0b20yIjowLjAsInlhd19yYW5kb20xIjowLjAsInlhd19yYW5kb20yIjowLjAsInlhd19zcGluX3NwZWVkIjoxLjB9fSx7ImJvZHl5YXciOnRydWUsImRlZmVuc2l2ZSI6ZmFsc2UsImZvcmNlX2xjIjpmYWxzZSwibGVmdF9vZmZzZXQiOi0yNC4wLCJtb2RpZmllciI6IkNlbnRlciIsIm1vZGlmaWVyX29mZnNldCI6LTExLjAsIm9mZnNldF95IjowLjAsInJpZ2h0X29mZnNldCI6MjYuMCwic3RhdGVfZW5hYmxlIjp0cnVlLCJ5YXciOiJNb2Rlcm4iLCJ+Ym9keXlhdyI6eyJkZWxheSI6MS4wLCJsZWZ0X2xpbWl0Ijo0OC4wLCJsZWZ0X2xpbWl0X3Byb2dyZXNzaXZlIjo2MC4wLCJsZWZ0X2xpbWl0X3JhbmRvbSI6NjAuMCwibGltaXRtb2RlIjoiU3RhdGljIiwib3B0aW9uc19zd2l0Y2giOnRydWUsInJhbmRvbWl6ZSI6Ni4wLCJyaWdodF9saW1pdCI6NTEuMCwicmlnaHRfbGltaXRfcHJvZ3Jlc3NpdmUiOjYwLjAsInJpZ2h0X2xpbWl0X3JhbmRvbSI6NjAuMH0sIn5kZWZlbnNpdmUiOnsicF9jdXN0b20xIjowLjAsInBfY3VzdG9tMiI6MC4wLCJwX3JhbmRvbTEiOjAuMCwicF9yYW5kb20yIjowLjAsInBpdGNoIjoiRGlzYWJsZWQiLCJwaXRjaF9XYXlzX3NwZWVkIjoxLjAsInlhdyI6IkN1c3RvbSIsInlhd19jdXN0b20xIjowLjAsInlhd19jdXN0b20yIjowLjAsInlhd19yYW5kb20xIjowLjAsInlhd19yYW5kb20yIjowLjAsInlhd19zcGluX3NwZWVkIjoxLjB9fSx7ImJvZHl5YXciOnRydWUsImRlZmVuc2l2ZSI6ZmFsc2UsImZvcmNlX2xjIjpmYWxzZSwibGVmdF9vZmZzZXQiOi0xOC4wLCJtb2RpZmllciI6IkNlbnRlciIsIm1vZGlmaWVyX29mZnNldCI6LTEyLjAsIm9mZnNldF95IjowLjAsInJpZ2h0X29mZnNldCI6MzYuMCwic3RhdGVfZW5hYmxlIjp0cnVlLCJ5YXciOiJNb2Rlcm4iLCJ+Ym9keXlhdyI6eyJkZWxheSI6MS4wLCJsZWZ0X2xpbWl0Ijo1MC4wLCJsZWZ0X2xpbWl0X3Byb2dyZXNzaXZlIjo2MC4wLCJsZWZ0X2xpbWl0X3JhbmRvbSI6NjAuMCwibGltaXRtb2RlIjoiU3RhdGljIiwib3B0aW9uc19zd2l0Y2giOnRydWUsInJhbmRvbWl6ZSI6NS4wLCJyaWdodF9saW1pdCI6NDkuMCwicmlnaHRfbGltaXRfcHJvZ3Jlc3NpdmUiOjYwLjAsInJpZ2h0X2xpbWl0X3JhbmRvbSI6NjAuMH0sIn5kZWZlbnNpdmUiOnsicF9jdXN0b20xIjowLjAsInBfY3VzdG9tMiI6MC4wLCJwX3JhbmRvbTEiOjAuMCwicF9yYW5kb20yIjowLjAsInBpdGNoIjoiRGlzYWJsZWQiLCJwaXRjaF9XYXlzX3NwZWVkIjoxLjAsInlhdyI6IkN1c3RvbSIsInlhd19jdXN0b20xIjowLjAsInlhd19jdXN0b20yIjowLjAsInlhd19yYW5kb20xIjowLjAsInlhd19yYW5kb20yIjowLjAsInlhd19zcGluX3NwZWVkIjoxLjB9fSx7ImJvZHl5YXciOnRydWUsImRlZmVuc2l2ZSI6ZmFsc2UsImZvcmNlX2xjIjpmYWxzZSwibGVmdF9vZmZzZXQiOjAuMCwibW9kaWZpZXIiOiJDZW50ZXIiLCJtb2RpZmllcl9vZmZzZXQiOjM2LjAsIm9mZnNldF95IjotMjguMCwicmlnaHRfb2Zmc2V0IjowLjAsInN0YXRlX2VuYWJsZSI6dHJ1ZSwieWF3IjoiRGVmYXVsdCIsIn5ib2R5eWF3Ijp7ImRlbGF5IjoxLjAsImxlZnRfbGltaXQiOjYwLjAsImxlZnRfbGltaXRfcHJvZ3Jlc3NpdmUiOjYwLjAsImxlZnRfbGltaXRfcmFuZG9tIjo2MC4wLCJsaW1pdG1vZGUiOiJTdGF0aWMiLCJvcHRpb25zX3N3aXRjaCI6dHJ1ZSwicmFuZG9taXplIjoxMDAuMCwicmlnaHRfbGltaXQiOjYwLjAsInJpZ2h0X2xpbWl0X3Byb2dyZXNzaXZlIjo2MC4wLCJyaWdodF9saW1pdF9yYW5kb20iOjYwLjB9LCJ+ZGVmZW5zaXZlIjp7InBfY3VzdG9tMSI6MC4wLCJwX2N1c3RvbTIiOjAuMCwicF9yYW5kb20xIjowLjAsInBfcmFuZG9tMiI6MC4wLCJwaXRjaCI6IkRpc2FibGVkIiwicGl0Y2hfV2F5c19zcGVlZCI6MS4wLCJ5YXciOiJDdXN0b20iLCJ5YXdfY3VzdG9tMSI6MC4wLCJ5YXdfY3VzdG9tMiI6MC4wLCJ5YXdfcmFuZG9tMSI6MC4wLCJ5YXdfcmFuZG9tMiI6MC4wLCJ5YXdfc3Bpbl9zcGVlZCI6MS4wfX0seyJib2R5eWF3Ijp0cnVlLCJkZWZlbnNpdmUiOnRydWUsImZvcmNlX2xjIjp0cnVlLCJsZWZ0X29mZnNldCI6LTI3LjAsIm1vZGlmaWVyIjoiQ2VudGVyIiwibW9kaWZpZXJfb2Zmc2V0IjotMTcuMCwib2Zmc2V0X3kiOjAuMCwicmlnaHRfb2Zmc2V0IjozMS4wLCJzdGF0ZV9lbmFibGUiOnRydWUsInlhdyI6Ik1vZGVybiIsIn5ib2R5eWF3Ijp7ImRlbGF5IjoyLjAsImxlZnRfbGltaXQiOjYwLjAsImxlZnRfbGltaXRfcHJvZ3Jlc3NpdmUiOjYwLjAsImxlZnRfbGltaXRfcmFuZG9tIjo2MC4wLCJsaW1pdG1vZGUiOiJTdGF0aWMiLCJvcHRpb25zX3N3aXRjaCI6dHJ1ZSwicmFuZG9taXplIjowLjAsInJpZ2h0X2xpbWl0Ijo2MC4wLCJyaWdodF9saW1pdF9wcm9ncmVzc2l2ZSI6NjAuMCwicmlnaHRfbGltaXRfcmFuZG9tIjo2MC4wfSwifmRlZmVuc2l2ZSI6eyJwX2N1c3RvbTEiOi03Ny4wLCJwX2N1c3RvbTIiOjEyMy4wLCJwX3JhbmRvbTEiOi0xMTYuMCwicF9yYW5kb20yIjoxMjEuMCwicGl0Y2giOiJDdXN0b20iLCJwaXRjaF9XYXlzX3NwZWVkIjoxLjAsInlhdyI6IlNwaW4iLCJ5YXdfY3VzdG9tMSI6MC4wLCJ5YXdfY3VzdG9tMiI6MC4wLCJ5YXdfcmFuZG9tMSI6MC4wLCJ5YXdfcmFuZG9tMiI6MC4wLCJ5YXdfc3Bpbl9zcGVlZCI6NS4wfX0seyJib2R5eWF3Ijp0cnVlLCJkZWZlbnNpdmUiOmZhbHNlLCJmb3JjZV9sYyI6ZmFsc2UsImxlZnRfb2Zmc2V0IjotMjAuMCwibW9kaWZpZXIiOiJDZW50ZXIiLCJtb2RpZmllcl9vZmZzZXQiOi0yNi4wLCJvZmZzZXRfeSI6MTguMCwicmlnaHRfb2Zmc2V0IjoyMC4wLCJzdGF0ZV9lbmFibGUiOnRydWUsInlhdyI6Ik1vZGVybiIsIn5ib2R5eWF3Ijp7ImRlbGF5IjoyLjAsImxlZnRfbGltaXQiOjYwLjAsImxlZnRfbGltaXRfcHJvZ3Jlc3NpdmUiOjYwLjAsImxlZnRfbGltaXRfcmFuZG9tIjo2MC4wLCJsaW1pdG1vZGUiOiJTdGF0aWMiLCJvcHRpb25zX3N3aXRjaCI6dHJ1ZSwicmFuZG9taXplIjowLjAsInJpZ2h0X2xpbWl0Ijo2MC4wLCJyaWdodF9saW1pdF9wcm9ncmVzc2l2ZSI6NjAuMCwicmlnaHRfbGltaXRfcmFuZG9tIjo2MC4wfSwifmRlZmVuc2l2ZSI6eyJwX2N1c3RvbTEiOjAuMCwicF9jdXN0b20yIjowLjAsInBfcmFuZG9tMSI6MC4wLCJwX3JhbmRvbTIiOjAuMCwicGl0Y2giOiJEaXNhYmxlZCIsInBpdGNoX1dheXNfc3BlZWQiOjEuMCwieWF3IjoiQ3VzdG9tIiwieWF3X2N1c3RvbTEiOjAuMCwieWF3X2N1c3RvbTIiOjAuMCwieWF3X3JhbmRvbTEiOjAuMCwieWF3X3JhbmRvbTIiOjAuMCwieWF3X3NwaW5fc3BlZWQiOjEuMH19LHsiYm9keXlhdyI6dHJ1ZSwiZGVmZW5zaXZlIjpmYWxzZSwiZm9yY2VfbGMiOmZhbHNlLCJsZWZ0X29mZnNldCI6LTE0LjAsIm1vZGlmaWVyIjoiT2Zmc2V0IiwibW9kaWZpZXJfb2Zmc2V0IjotMjMuMCwib2Zmc2V0X3kiOjAuMCwicmlnaHRfb2Zmc2V0IjoxNi4wLCJzdGF0ZV9lbmFibGUiOnRydWUsInlhdyI6Ik1vZGVybiIsIn5ib2R5eWF3Ijp7ImRlbGF5IjoxLjAsImxlZnRfbGltaXQiOjQ4LjAsImxlZnRfbGltaXRfcHJvZ3Jlc3NpdmUiOjYwLjAsImxlZnRfbGltaXRfcmFuZG9tIjo2MC4wLCJsaW1pdG1vZGUiOiJTdGF0aWMiLCJvcHRpb25zX3N3aXRjaCI6dHJ1ZSwicmFuZG9taXplIjo3LjAsInJpZ2h0X2xpbWl0Ijo1My4wLCJyaWdodF9saW1pdF9wcm9ncmVzc2l2ZSI6NjAuMCwicmlnaHRfbGltaXRfcmFuZG9tIjo2MC4wfSwifmRlZmVuc2l2ZSI6eyJwX2N1c3RvbTEiOjAuMCwicF9jdXN0b20yIjowLjAsInBfcmFuZG9tMSI6MC4wLCJwX3JhbmRvbTIiOjAuMCwicGl0Y2giOiJEaXNhYmxlZCIsInBpdGNoX1dheXNfc3BlZWQiOjEuMCwieWF3IjoiQ3VzdG9tIiwieWF3X2N1c3RvbTEiOjAuMCwieWF3X2N1c3RvbTIiOjAuMCwieWF3X3JhbmRvbTEiOjAuMCwieWF3X3JhbmRvbTIiOjAuMCwieWF3X3NwaW5fc3BlZWQiOjEuMH19LHsiYm9keXlhdyI6dHJ1ZSwiZGVmZW5zaXZlIjpmYWxzZSwiZm9yY2VfbGMiOmZhbHNlLCJsZWZ0X29mZnNldCI6LTI0LjAsIm1vZGlmaWVyIjoiQ2VudGVyIiwibW9kaWZpZXJfb2Zmc2V0IjotMTQuMCwib2Zmc2V0X3kiOjAuMCwicmlnaHRfb2Zmc2V0IjoyOC4wLCJzdGF0ZV9lbmFibGUiOnRydWUsInlhdyI6Ik1vZGVybiIsIn5ib2R5eWF3Ijp7ImRlbGF5IjoyLjAsImxlZnRfbGltaXQiOjU2LjAsImxlZnRfbGltaXRfcHJvZ3Jlc3NpdmUiOjYwLjAsImxlZnRfbGltaXRfcmFuZG9tIjo2MC4wLCJsaW1pdG1vZGUiOiJTdGF0aWMiLCJvcHRpb25zX3N3aXRjaCI6dHJ1ZSwicmFuZG9taXplIjowLjAsInJpZ2h0X2xpbWl0Ijo0NS4wLCJyaWdodF9saW1pdF9wcm9ncmVzc2l2ZSI6NjAuMCwicmlnaHRfbGltaXRfcmFuZG9tIjo2MC4wfSwifmRlZmVuc2l2ZSI6eyJwX2N1c3RvbTEiOjAuMCwicF9jdXN0b20yIjowLjAsInBfcmFuZG9tMSI6MC4wLCJwX3JhbmRvbTIiOjAuMCwicGl0Y2giOiJEaXNhYmxlZCIsInBpdGNoX1dheXNfc3BlZWQiOjEuMCwieWF3IjoiQ3VzdG9tIiwieWF3X2N1c3RvbTEiOjAuMCwieWF3X2N1c3RvbTIiOjAuMCwieWF3X3JhbmRvbTEiOjAuMCwieWF3X3JhbmRvbTIiOjAuMCwieWF3X3NwaW5fc3BlZWQiOjEuMH19LHsiYm9keXlhdyI6ZmFsc2UsImRlZmVuc2l2ZSI6ZmFsc2UsImZvcmNlX2xjIjpmYWxzZSwibGVmdF9vZmZzZXQiOjAuMCwibW9kaWZpZXIiOiJEaXNhYmxlZCIsIm1vZGlmaWVyX29mZnNldCI6MC4wLCJvZmZzZXRfeSI6MC4wLCJyaWdodF9vZmZzZXQiOjAuMCwic3RhdGVfZW5hYmxlIjpmYWxzZSwieWF3IjoiRGVmYXVsdCIsIn5ib2R5eWF3Ijp7ImRlbGF5IjoxLjAsImxlZnRfbGltaXQiOjYwLjAsImxlZnRfbGltaXRfcHJvZ3Jlc3NpdmUiOjYwLjAsImxlZnRfbGltaXRfcmFuZG9tIjo2MC4wLCJsaW1pdG1vZGUiOiJTdGF0aWMiLCJvcHRpb25zX3N3aXRjaCI6ZmFsc2UsInJhbmRvbWl6ZSI6MC4wLCJyaWdodF9saW1pdCI6NjAuMCwicmlnaHRfbGltaXRfcHJvZ3Jlc3NpdmUiOjYwLjAsInJpZ2h0X2xpbWl0X3JhbmRvbSI6NjAuMH0sIn5kZWZlbnNpdmUiOnsicF9jdXN0b20xIjowLjAsInBfY3VzdG9tMiI6MC4wLCJwX3JhbmRvbTEiOjAuMCwicF9yYW5kb20yIjowLjAsInBpdGNoIjoiRGlzYWJsZWQiLCJwaXRjaF9XYXlzX3NwZWVkIjoxLjAsInlhdyI6IkN1c3RvbSIsInlhd19jdXN0b20xIjowLjAsInlhd19jdXN0b20yIjowLjAsInlhd19yYW5kb20xIjowLjAsInlhd19yYW5kb20yIjowLjAsInlhd19zcGluX3NwZWVkIjoxLjB9fV1dLHsiYW5pbWJyZWFrZXJzIjp0cnVlLCJhc3BlY3QiOnRydWUsIm1hbnVhbF9hcnJvd3MiOmZhbHNlLCJtaW5kbWciOnRydWUsInBlcmZvbWFuY2UiOnRydWUsInNjb3BlIjp0cnVlLCJzaWxlbmNlZCI6eyJzZWxlY3Rpb24iOjEuMH0sInR5cGUiOjEuMCwidmlld21vZGVsIjp0cnVlLCJ+YW5pbWJyZWFrZXJzIjp7ImFkZG9ucyI6WzEuMCwifiJdLCJhaXIiOjIuMCwiZ3JvdW5kIjoyLjAsIm1vdmVsZWFuIjoxMDAuMH0sIn5hc3BlY3QiOnsidmFsIjoxNDEuMH0sIn5tYW51YWxfYXJyb3dzIjp7ImNvbG9yX2Fycm93cyI6IiNGN0FGRkZGRiIsInNsaWRlcl9hcnJvd3NfeCI6NS4wLCJzdHlsZWQiOjEuMH0sIn5taW5kbWciOnsiZGFtYWdlX2FscGhhIjo1MC4wLCJkYW1hZ2VfY29sb3IiOiIjRkZGRkZGRkYiLCJkYW1hZ2VfcG9zaXRpb25feCI6OTY4LjAsImRhbWFnZV9wb3NpdGlvbl95Ijo1MjIuMCwiZGFtYWdlX3NlbGVjdGlvbiI6MS4wfSwifnNjb3BlIjp7ImNvbG9yIjoiI0ZGRkZGRkZGIiwiZ2FwIjozLjAsImxlbmd0aCI6MjEwLjAsInNlbGVjdCI6WyJ+Il19LCJ+dmlld21vZGVsIjp7ImZvdiI6Mjg0LjAsInhfYXhpcyI6MjEuMCwieV9heGlzIjo0OS4wLCJ6X2F4aXMiOjEwLjB9fSx7ImFpbWJvdGxvZ3MiOnRydWUsImFpbXRvb2xzIjp0cnVlLCJiYXJzIjpmYWxzZSwiY2xhbnRhZyI6dHJ1ZSwiZmFzdGxhZGRlciI6dHJ1ZSwiaGl0Y2hhbmNlIjpmYWxzZSwibWFya2VyIjp0cnVlLCJwaW5ndW5sb2NrZXIiOjAuMCwic2NvdXQiOmZhbHNlLCJ0cmFzaHRhbGsiOmZhbHNlLCJ+YWltYm90bG9ncyI6eyJmaWx0ZXIiOmZhbHNlLCJnbG93X21vZGVybiI6IiNGRkRBRjhGRiIsIm9mZnNldCI6MjAwLjAsInBvcyI6WzEuMCwyLjAsMy4wLCJ+Il19LCJ+YWltdG9vbHMiOnsiYWRhcHRpdmUiOnRydWUsImJvZHlfaF9zbGlkZXJfbXAiOjAuMCwiYm9keV9sX3NsaWRlcl9tcCI6MC4wLCJoZWFkX2hfc2xpZGVyX21wIjowLjAsImhlYWRfbF9zbGlkZXJfbXAiOjAuMCwiaGlnaF9lbmFibGUiOmZhbHNlLCJoaWdoX2VuYWJsZV9tcCI6ZmFsc2UsImhpZ2hfc2xpZGVyIjowLjAsImxvd2VyX2VuYWJsZSI6ZmFsc2UsImxvd2VyX2VuYWJsZV9tcCI6ZmFsc2UsImxvd2VyX3NsaWRlciI6MC4wLCJzZWxlY3QiOjEuMCwidHlwZV9sZXRoYWwiOlsiQmFpbSBvbiBsZXRoYWwiLCJTYWZlIFBvaW50cyBvbiBsZXRoYWwiLCJ+Il19LCJ+YmFycyI6eyJhY3RpdmUiOmZhbHNlLCJtb2RlIjpbIn4iXX0sIn5oaXRjaGFuY2UiOnsiYXRzbmlwZXJfY2hhbmNlIjowLjAsImF0c25pcGVyX256Y2hhbmNlIjowLjAsImF3cF9jaGFuY2UiOjAuMCwiYXdwX256Y2hhbmNlIjowLjAsImVuYWJsZV9hdCI6ZmFsc2UsImVuYWJsZV9hd3AiOmZhbHNlLCJlbmFibGVfcjgiOmZhbHNlLCJlbmFibGVfc3NnIjpmYWxzZSwiaW5haXJfaGMiOjEuMCwicmV2b2x2ZXJfY2hhbmNlIjowLjAsInNzZzA4X2NoYW5jZSI6MC4wLCJzc2cwOF9uemNoYW5jZSI6MC4wfSwifm1hcmtlciI6eyJ0eXBlX2tvdGlrIjoxLjB9LCJ+dHJhc2h0YWxrIjp7InRyYXNodGFsa21vZGUiOlsifiJdfX1dLCJuYW1lIjoiMjIzIn0="));
    l_pui_0.load(v662.file, 1);
    print_dev("Configuration \aFFC0CBFFMeta \aDEFAULThas been loaded.");
    cvar.play:call(v646);
end);
v42.configs.presets_success_export:visibility(false);
v42.configs.presets_success_import:visibility(false);
v42.configs.presets_success_exist:visibility(false);
v42.configs.presets_success_importfailed:visibility(false);
events.render:set(function()
    -- upvalues: v508 (ref)
    visibility();
    v508.toggle();
end);
events.createmove:set(function(v663)
    -- upvalues: v467 (ref)
    settings_aa(v663);
    v467.handel(v663);
    peekexploit();
    jumpscout();
    on_createmove_1(v663);
end);
events.grenade_override_view:set(function(v664)
    on_grenade_override_view(v664);
end);
events.render:set(function()
    scope();
    backtrack_adpv(cmd);
    manage_filters();
    local v665 = render.screen_size();
    render.text(2, vector(v665.x / 2, v665.y - 10), color(255, 255, 255), "c", "MEOWHOOK");
end);
events.round_start(function()
    -- upvalues: v585 (ref)
    v585 = {};
end);
events.player_spawned(function()
    -- upvalues: v585 (ref)
    v585 = {};
end);
events.round_start(function()
    logsed = {};
end);
events.player_spawned(function()
    logsed = {};
end);
events.createmove:set(function()
    -- upvalues: v492 (ref)
    v492.handle();
    a_exp();
    auto_os();
    dt_exp();
    revo_fix();
end);
events.shutdown:set(function()
    -- upvalues: v87 (ref)
    v87.hc_find:override();
end);