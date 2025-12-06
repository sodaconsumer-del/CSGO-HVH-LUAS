local v0 = require("neverlose/lagrecord") ^ require("neverlose/lagrecord").SIGNED;
local l_ffi_0 = require("ffi");
local l_pui_0 = require("neverlose/pui");
local l_smoothy_0 = require("neverlose/smoothy");
local v4 = ffi.load("UrlMon");
local v5 = ffi.load("WinInet");
local l_base64_0 = require("neverlose/base64");
local l_clipboard_0 = require("neverlose/clipboard");
local _ = require("neverlose/gradient");
files.create_folder("nl/juicy");
l_pui_0.sidebar("    \240\159\133\185\240\159\134\132\240\159\133\184\240\159\133\178\240\159\134\136", "user");
l_ffi_0.cdef("  \n    typedef int BOOL;\n    typedef long LONG;\n    bool DeleteUrlCacheEntryA(const char* lpszUrlName);\n    void* __stdcall URLDownloadToFileA(void* LPUNKNOWN, const char* LPCSTR, const char* LPCSTR2, int a, int LPBINDSTATUSCALLBACK);\n\n    typedef void*(__thiscall* get_client_entity_t)(void*, int);\n\n    typedef struct {\n        char pad_0000[20];\n        int m_nOrder;\n        int m_nSequence;\n        float m_flPrevCycle;\n        float m_flWeight;\n        float m_flWeightDeltaRate;\n        float m_flPlaybackRate;\n        float m_flCycle;\n        void *m_pOwner;\n        char pad_0038[4];\n    } CAnimationLayer, animstate_layer_t;\n");
local function v11(v9, v10)
    -- upvalues: v5 (ref), v4 (ref)
    files.create_folder("nl/juicy");
    v5.DeleteUrlCacheEntryA(v9);
    v4.URLDownloadToFileA(nil, v9, v10, 0, 0);
end;
if not files.read("nl/juicy/t.ttf") then
    v11("https://github.com/fil1gran/juicy/raw/refs/heads/main/t.ttf", "nl/juicy/t.ttf");
elseif not files.read("nl/juicy/j.png") then
    v11("https://raw.githubusercontent.com/fil1gran/juicy/refs/heads/main/j.png", "nl/juicy/j.png");
end;
local v12 = {};
v12 = {
    min_damage = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"), 
    rage_bot_enabled = l_pui_0.find("Aimbot", "Ragebot", "Main", "Enabled", {
        silent_aim = "Silent Aim", 
        override_resolver = "Override Resolver", 
        dormant_aimbot = "Dormant Aimbot", 
        extended_backtrack = "Extended Backtrack"
    }), 
    hide_shots = l_pui_0.find("Aimbot", "Ragebot", "Main", "Hide Shots", {
        options = "Options"
    }), 
    double_tap = l_pui_0.find("Aimbot", "Ragebot", "Main", "Double Tap", {
        fake_lag_limit = "Fake Lag Limit", 
        immediate_teleport = "Immediate Teleport", 
        lag_options = "Lag Options", 
        quick_switch = "Quick-Switch"
    }), 
    anti_aim_enabled = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Enabled"), 
    pitch = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Pitch"), 
    yaw = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Yaw", {
        avoid_backstab = "Avoid Backstab", 
        hidden = "Hidden", 
        offset = "Offset", 
        base = "Base"
    }), 
    yaw_modifier = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", {
        offset = "Offset"
    }), 
    body_yaw = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", {
        right_limit = "Right Limit", 
        left_limit = "Left Limit", 
        options = "Options", 
        inverter = "Inverter", 
        freestanding = "Freestanding"
    }), 
    freestanding = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Freestanding", {
        disable_yaw_modifiers = "Disable Yaw Modifiers", 
        body_freestanding = "Body Freestanding"
    }), 
    extended_angles = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Extended Angles", {
        extended_pitch = "Extended Pitch", 
        extended_roll = "Extended Roll"
    }), 
    fake_duck = l_pui_0.find("Aimbot", "Anti Aim", "Misc", "Fake duck"), 
    leg_movement = l_pui_0.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"), 
    slow_walk = l_pui_0.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"), 
    override_zoom = l_pui_0.find("Visuals", "World", "Main", "Override Zoom", {
        force_second_zoom = "Force Second Zoom", 
        force_viewmodel = "Force Viewmodel", 
        scope_overlay = "Scope Overlay", 
        instant_scope = "Instant Scope"
    }), 
    air_strafe = l_pui_0.find("Miscellaneous", "Main", "Movement", "Air Strafe", {
        circle_strafe = "Circle Strafe", 
        wasd_strafe = "WASD Strafe", 
        smoothing = "Smoothing"
    }), 
    fake_lag_enabled = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Enabled"), 
    fake_lag_limit = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Limit"), 
    fake_lag_variability = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Variability"), 
    fake_latency = l_pui_0.find("Miscellaneous", "Main", "Other", "Fake Latency")
};
local v13 = {
    presets = {}
};
v13.presets.saved = db.presets or {};
if not v13.presets.saved.list then
    v13.presets.saved.list = {};
    for v14, _ in pairs(v13.presets.saved) do
        if v14 ~= "list" then
            table.insert(v13.presets.saved.list, v14);
        end;
    end;
end;
v13.presets.list = v13.presets.saved.list;
v13.script = {};
v13.script.build = common.get_username() == "Hersty" and "Developer" or "Beta 1.0";
v13.script.last_update = "2024-09-27";
v13.tahoma_bold = render.load_font("Tahoma Bold", vector(11, 11, 0), "a, d");
v13.tahoma_bold_big = render.load_font("Tahoma Bold", 25, "a, d");
v13.user = {};
v13.user.name = common.get_username() == "Hersty" and "Author" or common.get_username();
v13.records = {};
v13.previous_records = {};
v13.bindings = {
    ["Slow Walk"] = "sm", 
    ["Lag switch"] = "ls", 
    ["Body Aim"] = "ba", 
    ["Hide Shots"] = "os", 
    ["Safe Points"] = "sp", 
    ["Min. Damage"] = "dmg", 
    ["Ensure Hitbox Safety"] = "ehs", 
    ["Hit Chance"] = "hc", 
    ["Ping spike"] = "ms", 
    ["Dormant Aimbot"] = "da", 
    ["Peek Assist"] = "qp", 
    ["Edge Jump"] = "je", 
    ["Yaw override"] = "yaw", 
    Freestand = "fs", 
    ["Double Tap"] = "dt", 
    ["Fake Duck"] = "fd"
};
v13.state = nil;
v13.hitgroups = {
    [0] = "generic", 
    [1] = "head", 
    [2] = "chest", 
    [3] = "stomach", 
    [4] = "left arm", 
    [5] = "right arm", 
    [6] = "left leg", 
    [7] = "right leg", 
    [8] = nil, 
    [9] = nil, 
    [10] = "gear"
};
v13.shot_info = {};
v13.tickcount_switch_data = {};
v13.ground_ticks = 0;
v13.yaw_override_side = 0;
v13.screen_size = render.screen_size();
v13.zalupka = render.load_image_from_file("nl/juicy/j.png", vector(1080, 1080));
v13.states = {};
v13.states.base = {
    [1] = "Shared", 
    [2] = "Stand", 
    [3] = "Run", 
    [4] = "Walk", 
    [5] = "Duck", 
    [6] = "Crawl", 
    [7] = "Air", 
    [8] = "Air duck", 
    [9] = "Fake lag", 
    [10] = "Fake duck"
};
v13.states.defensive = {
    [1] = "Shared", 
    [2] = "Stand", 
    [3] = "Run", 
    [4] = "Walk", 
    [5] = "Duck", 
    [6] = "Crawl", 
    [7] = "Air", 
    [8] = "Air duck"
};
v13.states.base_fonted = {
    [1] = "\240\157\151\166\240\157\151\181\240\157\151\174\240\157\151\191\240\157\151\178\240\157\151\177", 
    [2] = "\240\157\151\166\240\157\152\129\240\157\151\174\240\157\151\187\240\157\151\177\240\157\151\182\240\157\151\187\240\157\151\180", 
    [3] = "\240\157\151\165\240\157\152\130\240\157\151\187\240\157\151\187\240\157\151\182\240\157\151\187\240\157\151\180", 
    [4] = "\240\157\151\170\240\157\151\174\240\157\151\185\240\157\151\184\240\157\151\182\240\157\151\187\240\157\151\180", 
    [5] = "\240\157\151\151\240\157\152\130\240\157\151\176\240\157\151\184\240\157\151\182\240\157\151\187\240\157\151\180", 
    [6] = "\240\157\151\150\240\157\151\191\240\157\151\174\240\157\152\132\240\157\151\185\240\157\151\182\240\157\151\187\240\157\151\180", 
    [7] = "\240\157\151\148\240\157\151\178\240\157\151\191\240\157\151\188\240\157\151\175\240\157\151\182\240\157\151\176", 
    [8] = "\240\157\151\148\240\157\151\178\240\157\151\191\240\157\151\188\240\157\151\175\240\157\151\182\240\157\151\176+", 
    [9] = "\240\157\151\153\240\157\151\174\240\157\151\184\240\157\151\178 \240\157\151\185\240\157\151\174\240\157\151\180", 
    [10] = "\240\157\151\153\240\157\151\174\240\157\151\184\240\157\151\178 \240\157\151\177\240\157\152\130\240\157\151\176\240\157\151\184"
};
v13.anti_hit = {};
v13.anti_hit.yaw_modifier_await = 0;
v13.anti_hit.defensive_pitch_modifier_await = 0;
v13.anti_hit.defensive_yaw_modifier_await = 0;
v13.materials = {};
v13.materials.molotov = {
    [1] = "particle/particle_flares/particle_flare_gray", 
    [2] = "particle/smoke1/smoke1_nearcull2", 
    [3] = "particle/vistasmokev1/vistasmokev1_nearcull", 
    [4] = "particle/smoke1/smoke1_nearcull", 
    [5] = "particle/vistasmokev1/vistasmokev1_nearcull_nodepth", 
    [6] = "particle/vistasmokev1/vistasmokev1_nearcull_fog", 
    [7] = "particle/vistasmokev1/vistasmokev4_nearcull", 
    [8] = "particle/smoke1/smoke1_nearcull3", 
    [9] = "particle/fire_burning_character/fire_env_fire_depthblend_oriented", 
    [10] = "particle/fire_burning_character/fire_burning_character", 
    [11] = "particle/fire_explosion_1/fire_explosion_1_oriented", 
    [12] = "particle/fire_explosion_1/fire_explosion_1_bright", 
    [13] = "particle/fire_burning_character/fire_burning_character_depthblend", 
    [14] = "particle/fire_burning_character/fire_env_fire_depthblend"
};
local v16 = {};
v16 = {
    cl_use_opens_buy_menu = cvar.cl_use_opens_buy_menu, 
    sv_maxusrcmdprocessticks = cvar.sv_maxusrcmdprocessticks, 
    cl_lagcompensation = cvar.cl_lagcompensation, 
    sv_maxunlag = cvar.sv_maxunlag, 
    r_aspectratio = cvar.r_aspectratio, 
    viewmodel_fov = cvar.viewmodel_fov, 
    viewmodel_offset_x = cvar.viewmodel_offset_x, 
    viewmodel_offset_y = cvar.viewmodel_offset_y, 
    viewmodel_offset_z = cvar.viewmodel_offset_z, 
    sv_legacy_desync = cvar.sv_legacy_desync, 
    cl_ragdoll_gravity = cvar.cl_ragdoll_gravity, 
    cl_ragdoll_physics_enable = cvar.cl_ragdoll_physics_enable, 
    cl_disable_ragdolls = cvar.cl_disable_ragdolls, 
    dsp_slow_cpu = cvar.dsp_slow_cpu, 
    func_break_max_pieces = cvar.func_break_max_pieces, 
    mat_queue_mode = cvar.mat_queue_mode, 
    muzzleflash_light = cvar.muzzleflash_light, 
    r_eyemove = cvar.r_eyemove, 
    r_eyegloss = cvar.r_eyegloss, 
    r_eyeshift_x = cvar.r_eyeshift_x, 
    r_eyeshift_y = cvar.r_eyeshift_y, 
    r_eyeshift_z = cvar.r_eyeshift_z, 
    r_eyesize = cvar.r_eyesize, 
    cl_foot_contact_shadows = cvar.cl_foot_contact_shadows, 
    r_3dsky = cvar.r_3dsky, 
    mat_disable_bloom = cvar.mat_disable_bloom, 
    cl_disablehtmlmotd = cvar.cl_disablehtmlmotd, 
    cl_disablefreezecam = cvar.cl_disablefreezecam, 
    cl_autohelp = cvar.cl_autohelp, 
    cl_showhelp = cvar.cl_showhelp, 
    cl_hud_playercount_showcount = cvar.cl_hud_playercount_showcount, 
    cl_detail_avoid_force = cvar.cl_detail_avoid_force, 
    cl_detail_avoid_radius = cvar.cl_detail_avoid_radius, 
    cl_detail_avoid_recover_speed = cvar.cl_detail_avoid_recover_speed, 
    cl_detail_max_sway = cvar.cl_detail_max_sway, 
    cl_windspeed = cvar.cl_windspeed, 
    cl_wpn_sway_scale = cvar.cl_wpn_sway_scale, 
    gameinstructor_enable = cvar.gameinstructor_enable, 
    r_dynamic = cvar.r_dynamic, 
    sv_forcepreload = cvar.sv_forcepreload, 
    props_break_max_pieces = cvar.props_break_max_pieces, 
    mat_disable_fancy_blending = cvar.mat_disable_fancy_blending, 
    r_drawtracers_firstperson = cvar.r_drawtracers_firstperson, 
    r_drawsprites = cvar.r_drawsprites, 
    r_propsmaxdist = cvar.r_propsmaxdist, 
    r_drawbrushmodels = cvar.r_drawbrushmodels, 
    joystick = cvar.joystick, 
    cl_fullupdate = cvar.cl_fullupdate, 
    violence_agibs = cvar.violence_agibs, 
    violence_hblood = cvar.violence_hblood, 
    violence_hgibs = cvar.violence_hgibs
};
local v17 = {};
for v18, v19 in pairs(v16) do
    v17[v18] = v19:float();
end;
local function v33(v20, v21, v22, v23)
    if not v20 or v20 == "" then
        return "";
    else
        local v24 = {};
        local v25 = string.len(v20) > 1 and 1 / (string.len(v20) - 1) or 1;
        for v26 in v20:gmatch(".[\128-\191]*") do
            local v27 = v21 % 2;
            if v27 > 1 then
                local v28 = 2 - v27;
                if v28 then
                    v27 = v28;
                end;
            end;
            local v29 = v22.r + (v23.r - v22.r) * v27;
            local v30 = v22.g + (v23.g - v22.g) * v27;
            local v31 = v22.b + (v23.b - v22.b) * v27;
            local v32 = v22.a + (v23.a - v22.a) * v27;
            v24[#v24 + 1] = "\a" .. color(v29, v30, v31, v32):to_hex() .. v26;
            v21 = v21 + v25;
        end;
        return table.concat(v24);
    end;
end;
local function v48(v34, v35, v36)
    -- upvalues: v16 (ref)
    local v37 = vector(v34.x, v34.y, v34.z);
    local v38 = vector(v35.x, v35.y, v35.z);
    local l_tickinterval_0 = globals.tickinterval;
    local v40 = v16.sv_gravity:float() or 800;
    local v41 = v16.sv_friction:float() or 5;
    local v42 = v16.sv_stopspeed:float() or 75;
    for _ = 1, v36 do
        v38.z = v38.z - v40 * l_tickinterval_0;
        local v44 = v38:length2d();
        if v44 > 0 then
            local v45 = (v44 < v42 and v42 or v44) * v41 * l_tickinterval_0;
            local v46 = math.max(v44 - v45, 0) / v44;
            local v47 = v38.x * v46;
            v38.y = v38.y * v46;
            v38.x = v47;
        end;
        v37 = v37 + v38 * l_tickinterval_0;
    end;
    return v37;
end;
local function v51(v49, v50)
    -- upvalues: l_ffi_0 (ref)
    set_abs_origin_fn(v49, l_ffi_0.new("vec3_t", v50.x, v50.y, v50.z));
end;
local function _(v52, v53, v54)
    return v52 + (v53 - v52) * v54;
end;
local function v63(v56, v57, v58, v59, v60, v61, v62)
    return (v59 - v56) * v62 + v56, (v60 - v57) * v62 + v57, (v61 - v58) * v62 + v58;
end;
local function v72(v64, v65, v66)
    local v67 = math.floor(v64 * 6);
    local v68 = v64 * 6 % 1;
    local v69 = v66 * (1 - v65);
    local v70 = v66 * (1 - v68 * v65);
    local v71 = v66 * (1 - (1 - v68) * v65);
    v67 = v67 % 6;
    return math.floor((v67 < 1 and v66 or v67 < 2 and v70 or v67 < 3 and v69 or v67 < 4 and v69 or v67 < 5 and v71 or v66) * 255), math.floor((v67 < 1 and v71 or v67 < 2 and v66 or v67 < 3 and v66 or v67 < 4 and v70 or v67 < 5 and v69 or v69) * 255), math.floor((v67 < 1 and v69 or v67 < 2 and v69 or v67 < 3 and v71 or v67 < 4 and v66 or v67 < 5 and v66 or v70) * 255);
end;
local function v77(v73, v74, v75)
    local v76 = v75 - v74;
    if v73 < v74 then
        v73 = v73 + v76;
    elseif v75 < v73 then
        v73 = v73 - v76;
    end;
    return v73;
end;
local function v79(v78)
    panorama.SteamOverlayAPI.OpenExternalBrowserURL(v78);
end;
local function v81()
    -- upvalues: v13 (ref)
    local l_m_fFlags_0 = entity.get_local_player().m_fFlags;
    v13.ground_ticks = bit.band(l_m_fFlags_0, 1) == 1 and v13.ground_ticks + 1 or 0;
    return v13.ground_ticks;
end;
local function v84(v82)
    local l_m_vecVelocity_0 = v82.m_vecVelocity;
    return math.sqrt(l_m_vecVelocity_0.x ^ 2 + l_m_vecVelocity_0.y ^ 2);
end;
local function v92(v85, v86, v87)
    -- upvalues: v13 (ref)
    local v88 = v85:id();
    v86 = v86:get() or "Static";
    if not v13.tickcount_switch_data[v88] then
        v13.tickcount_switch_data[v88] = {
            tickcount_switch = false, 
            tickcount_last = globals.tickcount, 
            start_delay = v85:get(), 
            decrease_delay = v85:get()
        };
    end;
    if v13.tickcount_switch_data[v88] then
        local l_tickcount_0 = globals.tickcount;
        local v90 = v13.tickcount_switch_data[v88].tickcount_last or l_tickcount_0;
        local l_start_delay_0 = v13.tickcount_switch_data[v88].start_delay;
        if v86 == "Static" then
            v13.tickcount_switch_data[v88].start_delay = v85:get();
        elseif v86 == "Decreasing" then
            if globals.choked_commands == 0 then
                if v13.tickcount_switch_data[v88].decrease_delay <= 0 then
                    v13.tickcount_switch_data[v88].decrease_delay = v85:get();
                else
                    v13.tickcount_switch_data[v88].decrease_delay = v13.tickcount_switch_data[v88].decrease_delay - v87;
                end;
            end;
            v13.tickcount_switch_data[v88].start_delay = math.floor(v13.tickcount_switch_data[v88].decrease_delay);
        elseif v86 == "Random" then
            v13.tickcount_switch_data[v88].start_delay = globals.tickcount % 50 > 45 and 1 or utils.random_int(1, v85:get());
        end;
        l_start_delay_0 = v13.tickcount_switch_data[v88].start_delay;
        if l_tickcount_0 < v90 then
            v13.tickcount_switch_data[v88].tickcount_last = l_tickcount_0;
        elseif v90 + l_start_delay_0 < l_tickcount_0 and globals.choked_commands == 0 then
            v13.tickcount_switch_data[v88].tickcount_switch = not v13.tickcount_switch_data[v88].tickcount_switch;
            v13.tickcount_switch_data[v88].tickcount_last = l_tickcount_0;
        end;
        return v13.tickcount_switch_data[v88].tickcount_switch;
    else
        return;
    end;
end;
local function v102()
    -- upvalues: v84 (ref), v81 (ref), v12 (ref)
    local v93 = entity.get_local_player();
    local l_m_fFlags_1 = v93.m_fFlags;
    local v95 = bit.band(l_m_fFlags_1, bit.lshift(1, 1)) == bit.lshift(1, 1);
    local v96 = v84(v93);
    local v97 = v81();
    local v98 = v12.slow_walk:get();
    local v99 = v12.fake_duck:get();
    local v100 = v12.double_tap:get();
    local v101 = v12.hide_shots:get();
    if not v99 and not v100 and not v101 then
        return "Fake lag";
    elseif v97 > 5 then
        if v99 and not v95 then
            return "Fake duck";
        elseif v96 > 5 then
            return v98 and "Walk" or v95 and "Crawl" or "Run";
        else
            return v95 and "Duck" or "Stand";
        end;
    else
        return v95 and "Air duck" or "Air";
    end;
end;
local function v107()
    -- upvalues: v13 (ref)
    local l_state_0 = v13.state;
    local v104 = {
        [1] = "Stand", 
        [2] = "Run", 
        [3] = "Walk", 
        [4] = "Duck", 
        [5] = "Crawl", 
        [6] = "Air", 
        [7] = "Air duck"
    };
    for v105, v106 in ipairs(v104) do
        if v106 == l_state_0 then
            return v105;
        end;
    end;
    return nil;
end;
local function v108()
    if globals.is_in_game then
        utils.console_exec("jointeam 2");
        utils.console_exec("sv_cheats 1;sv_infinite_ammo 1;sv_airaccelerate 100;sv_regeneration_force_on 1;mp_teamname_1 Weak dogs;mp_teamname_2 Juicy");
        utils.console_exec("mp_maxmoney 60000; mp_afterroundmoney 60000; mp_startmoney 60000; cash_player_bomb_defused 60000; cash_player_bomb_planted 60000; cash_player_damage_hostage 60000; cash_player_get_killed 60000; cash_player_interact_with_hostage 60000; cash_player_killed_enemy_default 60000; cash_player_killed_enemy_factor 60000");
        utils.console_exec("cash_player_killed_hostage 60000; cash_player_killed_teammate 60000; cash_player_rescued_hostage 60000; cash_player_respawn_amount 60000; cash_team_bonus_shorthanded 60000; cash_team_elimination_bomb_map 60000; cash_team_elimination_hostage_map_ct 60000; cash_team_elimination_hostage_map_t 60000; cash_team_hostage_alive 60000; cash_team_hostage_interaction 60000; cash_team_loser_bonus 60000");
        utils.console_exec("cash_team_loser_bonus_consecutive_rounds 60000; cash_team_planted_bomb_but_defused 60000; cash_team_rescued_hostage 60000; cash_team_survive_guardian_wave 60000; cash_team_terrorist_win_bomb 60000; cash_team_win_by_defusing_bomb 60000; cash_team_win_by_hostage_rescue 60000; cash_team_win_by_time_running_out_bomb 60000; cash_team_win_by_time_running_out_hostage 60000; cash_team_winner_bonus_consecutive_rounds 60000");
        utils.console_exec("mp_warmup_end; mp_warmup_pausetimer 1;bot_stop 1;bot_kick;bot_add;bot_add");
        utils.console_exec("mp_humanteam any;mp_roundtime_defuse 60;mp_freezetime 0;mp_maxrounds 999;mp_buy_anywhere 1;mp_buytime 999999;mp_ignore_round_win_conditions 1;mp_freezetime 0;mp_roundrestartdelay 0;");
        utils.console_exec("mp_respawn_on_death_ct 1;mp_respawn_on_death_t 1;mp_anyone_can_pickup_c4 1;mp_death_drop_c4 1;mp_halftime 0;mp_timelimit 0;mp_restartgame 5;give item_defuserclear");
        return true;
    else
        return false;
    end;
end;
local function v109(v110)
    -- upvalues: v109 (ref)
    for _, v112 in pairs(v110) do
        if type(v112) == "table" then
            v109(v112);
        elseif type(v112) == "userdata" and v112.override ~= nil then
            v112:override(nil);
        end;
    end;
end;
local function _(v113, v114)
    v113:set_callback(function(v115)
        -- upvalues: v114 (ref)
        local v116 = v115:get();
        local v117 = {};
        for v118, v119 in ipairs(v114) do
            v117[v118] = (v116 == v118 and "\a{Link Active}" or "") .. v119;
        end;
        v115:update(v117);
    end, true);
end;
local function v133(v121)
    if not v121 or v121.m_lifeState ~= 0 then
        return;
    else
        local v122 = {
            hit_side = 0, 
            last_hit = 0, 
            last_side = 0, 
            side = 1
        };
        if v122.hit_side ~= 0 and globals.curtime - v122.last_hit > 5 then
            v122.last_side = 0;
            v122.last_hit = 0;
            v122.hit_side = 0;
        end;
        local v123 = v121:get_eye_position();
        local v124 = render.camera_angles();
        local v125 = {
            right = 0, 
            left = 0
        };
        for v126 = v124.y - 120, v124.y + 120, 30 do
            if v126 ~= v124.y then
                local v127 = math.rad(v126);
                local v128 = v123.x + 256 * math.cos(v127);
                local v129 = v123.y + 256 * math.sin(v127);
                local l_z_0 = v123.z;
                local l_fraction_0 = utils.trace_line(v123, vector(v128, v129, l_z_0)).fraction;
                local v132 = v126 < v124.y and "left" or "right";
                v125[v132] = v125[v132] + l_fraction_0;
            end;
        end;
        v122.side = v125.left < v125.right and -1 or 1;
        if v122.side == v122.last_side then
            return;
        else
            v122.last_side = v122.side;
            if v122.hit_side ~= 0 then
                v122.side = v122.hit_side;
            end;
            return v122.side;
        end;
    end;
end;
local function v135(v134)
    -- upvalues: v133 (ref)
    if not (rage.antiaim:get_target(true) ~= nil) then
        return;
    else
        return v133(v134);
    end;
end;
local function v136()
    -- upvalues: v13 (ref)
    v13.presets.saved.list = v13.presets.list;
    db.presets = v13.presets.saved;
end;
local function v152(v137, v138)
    -- upvalues: v13 (ref), l_pui_0 (ref), v136 (ref)
    local v139 = v137:get();
    local _ = v138:get();
    local _ = v13.presets.list[v138:get()];
    local function v144(v142)
        for v143 = 1, #v142 do
            if v142:sub(v143, v143):match("%w") then
                return true;
            end;
        end;
        return false;
    end;
    if not v139 or not v144(v139) then
        return;
    else
        local v145 = false;
        for _, v147 in pairs(v13.presets.list) do
            if v147 == v139 then
                v145 = true;
                break;
            end;
        end;
        local v148 = l_pui_0.save();
        if v145 then
            v13.presets.saved[v139] = v148;
        else
            table.insert(v13.presets.list, v139);
            v13.presets.saved[v139] = v148;
        end;
        local v149 = {};
        for _, v151 in ipairs(v13.presets.list) do
            table.insert(v149, v151 == v139 and "\a{Link Active}" .. v151 or v151);
        end;
        v138:update(v149);
        v136();
        common.add_notify("Presets", "Preset successfully saved.");
        return;
    end;
end;
local function v159(v153)
    -- upvalues: v13 (ref), l_pui_0 (ref)
    local v154 = v153:get();
    local v155 = v13.presets.list[v153:get()];
    if not v155 then
        common.add_notify("Juicy", "Select preset.");
        return;
    else
        local v156 = {};
        loaded_preset_index = v154;
        for v157, v158 in ipairs(v13.presets.list) do
            table.insert(v156, v157 == v154 and "\a{Link Active}" .. v158 or v158);
        end;
        l_pui_0.load(v13.presets.saved[v155]);
        v153:update(v156);
        common.add_notify("Presets", "Preset successfully loaded.");
        return;
    end;
end;
local function v168(v160)
    -- upvalues: v13 (ref), v136 (ref)
    local v161 = v160:get();
    local v162 = v13.presets.list[v160:get()];
    if not v162 then
        common.add_notify("Juicy", "Select preset.");
        return;
    else
        v13.presets.saved[v162] = nil;
        for v163, v164 in ipairs(v13.presets.list) do
            if v164 == v162 then
                table.remove(v13.presets.list, v163);
                break;
            end;
        end;
        local v165 = {};
        for v166, v167 in ipairs(v13.presets.list) do
            table.insert(v165, v166 == loaded_preset_index and "\a{Link Active}" .. v167 or v167);
        end;
        v160:update(v165);
        if v161 == loaded_preset_index then
            loaded_preset_index = nil;
        end;
        v136();
        common.add_notify("Presets", "Removed permanently.");
        return;
    end;
end;
local function v173(v169)
    -- upvalues: v13 (ref), l_clipboard_0 (ref), l_base64_0 (ref)
    local _ = v169:get();
    local v171 = v13.presets.list[v169:get()];
    local v172 = v13.presets.saved[v13.presets.list[v169:get()]];
    if not v172 then
        common.add_notify("Presets", "\208\189\209\131 \208\191\208\184\208\183\208\180\208\181\209\134 \209\130\208\190\208\179\208\180\208\176 \209\135\208\190 \209\143 \209\133\208\183 \209\135\208\190 \208\180\208\181\208\187\208\176\209\130\209\140");
        return;
    else
        v172.preset_name = v171;
        l_clipboard_0.set("her-yaw4ik :: " .. l_base64_0.encode(json.stringify(v172)));
        common.add_notify("Presets", "Exported preset to the clipboard.");
        return;
    end;
end;
local function v189(v174)
    -- upvalues: l_clipboard_0 (ref), l_base64_0 (ref), v13 (ref), v136 (ref)
    local v175 = l_clipboard_0.get();
    if not v175 or v175 == "" then
        return;
    else
        local v176 = nil;
        local v177 = nil;
        local l_status_0, _ = pcall(function()
            -- upvalues: v175 (ref), v176 (ref), l_base64_0 (ref), v177 (ref)
            local v178 = "her-yaw4ik :: ";
            if v175:sub(1, #v178) == v178 then
                local v179 = v175:sub(#v178 + 1);
                v176 = l_base64_0.decode(v179);
            else
                v176 = v175;
            end;
            v177 = json.parse(v176);
        end);
        if not l_status_0 then
            return;
        else
            local l_preset_name_0 = v177.preset_name;
            if not l_preset_name_0 then
                return;
            else
                local v183 = false;
                for _, v185 in pairs(v13.presets.list) do
                    if v185 == l_preset_name_0 then
                        v183 = true;
                        break;
                    end;
                end;
                v13.presets.saved[l_preset_name_0] = v177;
                if not v183 then
                    table.insert(v13.presets.list, l_preset_name_0);
                    local v186 = {};
                    for _, v188 in ipairs(v13.presets.list) do
                        if v188 == l_preset_name_0 then
                            table.insert(v186, "\a{Link Active}" .. v188);
                        else
                            table.insert(v186, v188);
                        end;
                    end;
                    v174:update(v186);
                    v136();
                    common.add_notify("Presets", "Imported preset from the clipboard.");
                    return;
                else
                    common.add_notify("Presets", "Already imported to database.");
                    return;
                end;
            end;
        end;
    end;
end;
local function v191()
    local v190 = entity.get_local_player();
    return v190 and v190:is_alive();
end;
local function v194()
    local v192 = false;
    entity.get_players(false, true, function(v193)
        -- upvalues: v192 (ref)
        if v193:is_alive() and v193:is_enemy() then
            v192 = true;
        end;
    end);
    return v192;
end;
local v195 = {};
v195 = {
    general = l_pui_0.create(" \v\f<house-night>  \rHome ", {
        [1] = {
            [1] = "zalupa", 
            [2] = "##zalupa", 
            [3] = 1
        }, 
        [2] = {
            [1] = "presets", 
            [2] = "##presets", 
            [3] = 2
        }
    }), 
    anti_hit = l_pui_0.create(" \v\f<arrows-spin>  \rAnti aim ", {
        [1] = {
            [1] = "position", 
            [2] = "##position", 
            [3] = 2
        }, 
        [2] = {
            [1] = "tweaks", 
            [2] = "##tweaks", 
            [3] = 1
        }, 
        [3] = {
            [1] = "keybindings", 
            [2] = "##keybindings", 
            [3] = 1
        }, 
        [4] = {
            [1] = "defensive_setup", 
            [2] = "##defensive_setup", 
            [3] = 1
        }, 
        [5] = {
            [1] = "yaw", 
            [2] = "##hotizontal tilt", 
            [3] = 2
        }, 
        [6] = {
            [1] = "body_yaw", 
            [2] = "##torso twist", 
            [3] = 2
        }
    }), 
    addition = l_pui_0.create(" \v\f<gear>  \rAddition ", {
        [1] = {
            [1] = "accent", 
            [2] = "##accent", 
            [3] = 1
        }, 
        [2] = {
            [1] = "rage", 
            [2] = "##rage", 
            [3] = 1
        }, 
        [3] = {
            [1] = "misc", 
            [2] = "##misc", 
            [3] = 1
        }, 
        [4] = {
            [1] = "visuals", 
            [2] = "##visuals", 
            [3] = 2
        }
    })
};
local v196 = {
    general = {}, 
    zalupen = v195.general.zalupa:texture(v13.zalupka, vector(269, 265), color(255), "f", 0)
};
v196.general.discord_text = v195.general.zalupa:label("Discord");
v196.general.discord = v195.general.zalupa:button("\a6879B8FF\f<discord>", function()
    -- upvalues: v79 (ref)
    v79("https://discord.gg/gzEurYMb56");
end, true);
v196.wellcome = v195.general.zalupa:label("\v\f<hand-wave>  \240\157\151\170\240\157\151\178\240\157\151\185\240\157\151\185\240\157\151\176\240\157\151\188\240\157\151\186\240\157\151\178");
v196.general.presets = {};
v196.general.presets.list = v195.general.presets:list("##presets", v13.presets.list);
v196.general.presets.name = v195.general.presets:input("##Name", "Preset name example");
v196.general.presets.ico = v195.general.presets:label("\v\f<files>  \240\157\151\163\240\157\151\191\240\157\151\178\240\157\152\128\240\157\151\178\240\157\152\129\240\157\152\128");
v196.general.presets.save_button = v195.general.presets:button("\aFFFFFFFF\f<upload>", function()
    -- upvalues: v152 (ref), v196 (ref)
    v152(v196.general.presets.name, v196.general.presets.list);
end, true, "Create | Save");
v196.general.presets.load_button = v195.general.presets:button("\a9FCA2BFF\f<check>", function(v197)
    -- upvalues: l_pui_0 (ref), v159 (ref), v196 (ref)
    utils.execute_after(0.25, function()
        -- upvalues: v197 (ref), l_pui_0 (ref)
        v197:name(l_pui_0.string("\aFFFFFFFF\f<spinner-third>"));
    end);
    utils.execute_after(1.5, function()
        -- upvalues: v197 (ref), l_pui_0 (ref)
        v197:name(l_pui_0.string("\aFFFFFFFF\f<circle-notch>"));
    end);
    utils.execute_after(3.5, function()
        -- upvalues: v159 (ref), v196 (ref), v197 (ref), l_pui_0 (ref)
        v159(v196.general.presets.list);
        v197:name(l_pui_0.string("\a9FCA2BFF\f<check>"));
    end);
end, true, "Load");
v196.general.presets.delete_button = v195.general.presets:button("\aDB6361FF\f<trash-can>", function()
    -- upvalues: v168 (ref), v196 (ref)
    v168(v196.general.presets.list);
end, true, "Delete");
v196.general.presets.import_button = v195.general.presets:button("\v\f<file-magnifying-glass>", function()
    -- upvalues: v189 (ref), v196 (ref)
    v189(v196.general.presets.list);
end, true, "Import");
v196.general.presets.export_button = v195.general.presets:button("\v\f<file-code>", function()
    -- upvalues: v173 (ref), v196 (ref)
    v173(v196.general.presets.list);
end, true, "Export");
v196.anti_hit = {};
v196.anti_hit.base_statement = v195.anti_hit.position:combo("\v\f<person-walking>   \240\157\151\163\240\157\151\188\240\157\152\128\240\157\151\182\240\157\152\129\240\157\151\182\240\157\151\188\240\157\151\187", v13.states.base);
v196.anti_hit.tweaks = {};
v196.anti_hit.tweaks.geroin = v195.anti_hit.tweaks:label("\v\f<hammer>  \240\157\151\167\240\157\152\132\240\157\151\178\240\157\151\174\240\157\151\184\240\157\152\128", function(v198)
    return {
        legit_aa = v198:switch("Legit anti aims on use"), 
        anti_backstab = v198:switch("Anti backstab"), 
        safe_head = v198:switch("Safe head"), 
        adaptive_fakelags = v198:switch("Adaptive fake lags"), 
        hide_angles = v198:selectable("Hide angles", {
            [1] = "On warmup", 
            [2] = "No enemies"
        })
    };
end);
v196.anti_hit.keybindings = {};
v196.anti_hit.keybindings.geroin = v195.anti_hit.keybindings:label("\v\f<keyboard>  \240\157\151\158\240\157\151\178\240\157\152\134\240\157\151\175\240\157\151\182\240\157\151\187\240\157\151\177\240\157\151\182\240\157\151\187\240\157\151\180\240\157\152\128", function(v199)
    return {
        defensive_flick = v199:switch("Fake flick", false, true, "New meta exploit. Better using with\nslow Walk."), 
        lag_switch = v199:switch("Lag switch", false, true, "Working only in air duck."), 
        lag_switch_ticks = v199:slider("##Ticks", 1, 20, 5, 1, " t", "Lag switch ticks.\n "), 
        inverter = v199:switch("Inverter", false, true, "Inverting your body yaw side, if you use static body yaw method."), 
        freestanding = v199:switch("Freestand", false, true), 
        yaw_direction = v199:combo("Yaw override", {
            [1] = "At targets", 
            [2] = "Forward", 
            [3] = "Left", 
            [4] = "Right"
        })
    };
end);
v196.anti_hit.defensive_setup = {};
v196.anti_hit.defensive_setup.geroin = v195.anti_hit.defensive_setup:label("\v\f<lock>   \240\157\151\151\240\157\151\178\240\157\151\179\240\157\151\178\240\157\151\187\240\157\152\128\240\157\151\182\240\157\152\131\240\157\151\178 \240\157\152\128\240\157\151\178\240\157\152\129\240\157\152\130\240\157\151\189", function(v200)
    return {
        force_lag = v200:selectable("Force lag", {
            [1] = "Stand", 
            [2] = "Run", 
            [3] = "Walk", 
            [4] = "Duck", 
            [5] = "Crawl", 
            [6] = "Air", 
            [7] = "Air duck"
        }), 
        lag_aa = v200:selectable("Lag anti aim", {
            [1] = "Stand", 
            [2] = "Run", 
            [3] = "Walk", 
            [4] = "Duck", 
            [5] = "Crawl", 
            [6] = "Air", 
            [7] = "Air duck"
        }), 
        lag_pitch = v200:combo("Pitch", {
            [1] = "Static", 
            [2] = "Jitter", 
            [3] = "Random"
        }), 
        lag_pitch_offset = v200:slider("Offset\aFFFFFF00defpitch ", -89, 89, 89, 1, " \194\176"), 
        lag_pitch_primary = v200:slider("Primary\aFFFFFF00defpitch", -89, 89, 89, 1, " \194\176"), 
        lag_pitch_secondary = v200:slider("Secondary\aFFFFFF00defpitch", -89, 89, 89, 1, " \194\176"), 
        lag_yaw = v200:combo("Yaw", {
            [1] = "Static", 
            [2] = "Jitter", 
            [3] = "Random"
        }), 
        lag_yaw_offset = v200:slider("Offset\aFFFFFF00defyaw ", -180, 180, 0, 1, " \194\176"), 
        lag_yaw_primary = v200:slider("Primary\aFFFFFF00defyaw", -180, 180, 0, 1, " \194\176"), 
        lag_yaw_secondary = v200:slider("Secondary\aFFFFFF00defyaw", -180, 180, 0, 1, " \194\176"), 
        lag_yaw_freestand = v200:switch("Anti freestand"), 
        lag_body_yaw = v200:combo("Body yaw", {
            [1] = "Static", 
            [2] = "Jitter"
        }), 
        lag_body_yaw_offset = v200:slider("Offset\aFFFFFF00defbody_yaw", -60, 60, 0, 1, " \194\176"), 
        lag_body_yaw_primary = v200:slider("Primary\aFFFFFF00defbody_yaw", -60, 0, 0, 1, " \194\176"), 
        lag_body_yaw_secondary = v200:slider("Secondary\aFFFFFF00defbody_yaw", 0, 60, 0, 1, " \194\176"), 
        lag_aa_ticks = v200:slider("##Ticks ", 1, 11, 4, 1, " t", "Lag aa trigger ticks.\n ")
    };
end);
v196.anti_hit.defensive_setup.geroin.lag_pitch_offset:depend({
    [1] = nil, 
    [2] = "Static", 
    [1] = v196.anti_hit.defensive_setup.geroin.lag_pitch
});
v196.anti_hit.defensive_setup.geroin.lag_pitch_primary:depend({
    [1] = nil, 
    [2] = "Jitter", 
    [3] = "Random", 
    [1] = v196.anti_hit.defensive_setup.geroin.lag_pitch
});
v196.anti_hit.defensive_setup.geroin.lag_pitch_secondary:depend({
    [1] = nil, 
    [2] = "Jitter", 
    [3] = "Random", 
    [1] = v196.anti_hit.defensive_setup.geroin.lag_pitch
});
v196.anti_hit.defensive_setup.geroin.lag_yaw_offset:depend({
    [1] = nil, 
    [2] = "Static", 
    [1] = v196.anti_hit.defensive_setup.geroin.lag_yaw
});
v196.anti_hit.defensive_setup.geroin.lag_yaw_primary:depend({
    [1] = nil, 
    [2] = "Jitter", 
    [3] = "Random", 
    [1] = v196.anti_hit.defensive_setup.geroin.lag_yaw
});
v196.anti_hit.defensive_setup.geroin.lag_yaw_secondary:depend({
    [1] = nil, 
    [2] = "Jitter", 
    [3] = "Random", 
    [1] = v196.anti_hit.defensive_setup.geroin.lag_yaw
});
v196.anti_hit.defensive_setup.geroin.lag_body_yaw_offset:depend({
    [1] = nil, 
    [2] = "Static", 
    [1] = v196.anti_hit.defensive_setup.geroin.lag_body_yaw
});
v196.anti_hit.defensive_setup.geroin.lag_body_yaw_primary:depend({
    [1] = nil, 
    [2] = "Jitter", 
    [1] = v196.anti_hit.defensive_setup.geroin.lag_body_yaw
});
v196.anti_hit.defensive_setup.geroin.lag_body_yaw_secondary:depend({
    [1] = nil, 
    [2] = "Jitter", 
    [1] = v196.anti_hit.defensive_setup.geroin.lag_body_yaw
});
v196.anti_hit.builders = {};
v196.anti_hit.builders.base = {};
for v201, v202 in ipairs(v13.states.base) do
    v196.anti_hit.builders.base[v202] = {};
    local v203 = v196.anti_hit.builders.base[v202];
    do
        local l_v202_0 = v202;
        v203.override_ = v195.anti_hit.position:switch("Override \v" .. l_v202_0):depend({
            [1] = v196.anti_hit.base_statement, 
            [2] = function()
                -- upvalues: v196 (ref), l_v202_0 (ref)
                return v196.anti_hit.base_statement:get() == l_v202_0 and v196.anti_hit.base_statement:get() ~= "Shared";
            end
        });
        local v205 = {
            [1] = v196.anti_hit.base_statement, 
            [2] = l_v202_0
        };
        do
            local l_v203_0 = v203;
            local v207 = {
                [1] = l_v203_0.override_, 
                [2] = function()
                    -- upvalues: l_v202_0 (ref), l_v203_0 (ref)
                    return l_v202_0 == "Shared" or l_v203_0.override_:get();
                end
            };
            local v208 = v13.states.base_fonted[v201];
            l_v203_0.yaw_modifier = v195.anti_hit.yaw:combo("##Method\aFFFFFF00" .. l_v202_0, {
                [1] = "Off", 
                [2] = "Static", 
                [3] = "Jitter"
            }):depend(v205, v207);
            l_v203_0.yaw_modifier_offset = v195.anti_hit.yaw:slider("Offset\aFFFFFF00" .. l_v202_0, -180, 180, 0, 1, " \194\176"):depend(v205, v207, {
                [1] = l_v203_0.yaw_modifier, 
                [2] = function(v209)
                    return v209:get() ~= "Off" and v209:get() ~= "Jitter";
                end
            });
            l_v203_0.yaw_modifier_primary = v195.anti_hit.yaw:slider("Primary\aFFFFFF00" .. l_v202_0, -180, 180, 0, 1, " \194\176"):depend(v205, v207, {
                [1] = nil, 
                [2] = "Jitter", 
                [1] = l_v203_0.yaw_modifier
            });
            l_v203_0.yaw_modifier_secondary = v195.anti_hit.yaw:slider("Secondary\aFFFFFF00" .. l_v202_0, -180, 180, 0, 1, " \194\176"):depend(v205, v207, {
                [1] = nil, 
                [2] = "Jitter", 
                [1] = l_v203_0.yaw_modifier
            });
            l_v203_0.yaw_modifier_anomaly = v195.anti_hit.yaw:label("Anomaly\aFFFFFF00" .. l_v202_0, function(v210)
                -- upvalues: l_v202_0 (ref)
                return {
                    amount = v210:slider("Amount \aFFFFFF00" .. l_v202_0, 0, 100, 0, 1, function(v211)
                        return v211 == 0 and "Off" or v211 .. " %";
                    end)
                };
            end):depend(v205, v207, {
                [1] = nil, 
                [2] = "Jitter", 
                [1] = l_v203_0.yaw_modifier
            });
            l_v203_0.yaw_modifier_await = v195.anti_hit.yaw:label("Await", 0, 64, 0, 1, function(v212)
                -- upvalues: l_v202_0 (ref)
                return {
                    method = v212:combo("Method \aFFFFFF00" .. l_v202_0, {
                        [1] = "Static", 
                        [2] = "Decreasing", 
                        [3] = "Random"
                    }), 
                    amount = v212:slider("Ticks \aFFFFFF00" .. l_v202_0, 0, 64, 0, 1, function(v213)
                        return v213 == 0 and "Off" or v213 .. " t";
                    end), 
                    transition = v212:slider("Transition \aFFFFFF00" .. l_v202_0, 1, 100, 0, 1, " %")
                };
            end):depend(v205, v207, {
                [1] = nil, 
                [2] = "Jitter", 
                [3] = "Spin", 
                [1] = l_v203_0.yaw_modifier
            });
            l_v203_0.yaw_modifier_await.transition:depend({
                [1] = nil, 
                [2] = "Decreasing", 
                [1] = l_v203_0.yaw_modifier_await.method
            });
            l_v203_0.yaw_ico = v195.anti_hit.yaw:label("\v\f<child>  \240\157\151\172\240\157\151\174\240\157\152\132 - " .. v208):depend(v205, v207);
            l_v203_0.body_yaw_modifier = v195.anti_hit.body_yaw:combo("##Method  \aFFFFFF00" .. l_v202_0, {
                [1] = "Off", 
                [2] = "Static", 
                [3] = "Jitter"
            }):depend(v205, v207);
            l_v203_0.body_yaw_modifier_primary = v195.anti_hit.body_yaw:slider("Primary  \aFFFFFF00" .. l_v202_0, -60, 0, 0, 1, " \194\176"):depend(v205, v207, {
                [1] = nil, 
                [2] = "Off", 
                [3] = true, 
                [1] = l_v203_0.body_yaw_modifier
            });
            l_v203_0.body_yaw_modifier_secondary = v195.anti_hit.body_yaw:slider("Secondary  \aFFFFFF00" .. l_v202_0, 0, 60, 0, 1, " \194\176"):depend(v205, v207, {
                [1] = nil, 
                [2] = "Off", 
                [3] = true, 
                [1] = l_v203_0.body_yaw_modifier
            });
            v196.anti_hit.builders.body_yaw_ico = v195.anti_hit.body_yaw:label("\v\f<children>  \240\157\151\149\240\157\151\188\240\157\151\177\240\157\152\134 \240\157\152\134\240\157\151\174\240\157\152\132 - " .. v208):depend(v205, v207);
        end;
    end;
end;
v196.features = {};
v196.features.ping_spike = v195.addition.rage:switch("Ping spike", false, function(v214)
    -- upvalues: v63 (ref), v72 (ref)
    return {
        amount = v214:slider("##Amount", 0, 200, 0, 1, function(v215)
            -- upvalues: v63 (ref), v72 (ref)
            local v216 = color(255, 255, 255);
            local v217 = color(151, 175, 54);
            local v218, v219, v220 = v216:to_hsv();
            local v221, v222, v223 = v217:to_hsv();
            local v224, v225, v226 = v63(v218, v219, v220, v221, v222, v223, v215 / 200);
            local v227, v228, v229 = v72(v224, v225, v226);
            return string.format("\a%02X%02X%02XFF", v227, v228, v229) .. v215 .. "ms";
        end)
    }, true;
end);
v196.features.jump_shot = v195.addition.rage:switch("Jump shot");
v196.features.prediction = v195.addition.rage:combo("Prediction", {
    [1] = "Off", 
    [2] = "cl_lagcompensation 0", 
    [3] = "Exploit uncharge"
}, "cl_lagcompensation 0 - Default method of defensive predict in Neverlose. Disabling backtrack.\n\nExploit uncharge - Non-default method of break LC {NO DEFENSIVE} prediction to help you counter enemies who are uncharging doubletap while peeking.");
v196.features.rage_ico = v195.addition.rage:label("\v\f<slot-machine>  \240\157\151\165\240\157\151\174\240\157\151\180\240\157\151\178");
v196.features.aspectratio = v195.addition.visuals:switch("Aspectratio", false, function(v230)
    local v231 = {
        amount = v230:slider("##Aspect ratio amount", 1, 2330, 1778, 0.001, nil, "\240\157\151\150\240\157\152\130\240\157\151\191\240\157\151\191\240\157\151\178\240\157\151\187\240\157\152\129 \240\157\152\128\240\157\151\176\240\157\151\191\240\157\151\178\240\157\151\178\240\157\151\187 \240\157\151\191\240\157\151\178\240\157\152\128\240\157\151\188\240\157\151\185\240\157\152\130\240\157\152\129\240\157\151\182\240\157\151\188\240\157\151\187.\n ")
    };
    v231.v21_9 = v230:button("21:9", function()
        -- upvalues: v231 (ref)
        v231.amount:set(2333.3333333333335);
    end);
    v231.v16_9 = v230:button("16:9", function()
        -- upvalues: v231 (ref)
        v231.amount:set(1777.7777777777776);
    end);
    v231.v16_10 = v230:button("16:10", function()
        -- upvalues: v231 (ref)
        v231.amount:set(1600);
    end);
    v231.v3_2 = v230:button(" 3:2 ", function()
        -- upvalues: v231 (ref)
        v231.amount:set(1500);
    end);
    v231.v4_3 = v230:button(" 4:3 ", function()
        -- upvalues: v231 (ref)
        v231.amount:set(1333.3333333333333);
    end);
    v231.v5_4 = v230:button(" 5:4 ", function()
        -- upvalues: v231 (ref)
        v231.amount:set(1250);
    end);
    v231.vreset = v230:button("                                  Reset                                 ", function()
        -- upvalues: v231 (ref)
        v231.amount:set(1777.7777777777776);
    end);
    return v231, true;
end);
v196.features.viewmodel = v195.addition.visuals:switch("Viewmodel", false, function(v232)
    local v237 = {
        fov = v232:slider("##FOV", 0, 136, 68, 1, function(v233)
            return "fov: " .. v233;
        end), 
        x = v232:slider("##x", -500, 500, 25, 1, function(v234)
            return "x: " .. v234 / 10;
        end), 
        y = v232:slider("##y", -500, 500, 0, 1, function(v235)
            return "y: " .. v235 / 10;
        end), 
        z = v232:slider("##z", -500, 500, -10, 1, function(v236)
            return "z: " .. v236 / 10;
        end)
    };
    v237.vreset = v232:button("                                  Reset                                 ", function()
        -- upvalues: v237 (ref)
        v237.fov:set(68);
        v237.x:set(25);
        v237.y:set(0);
        v237.z:set(-10);
    end);
    return v237, true;
end);
v196.features.molotov_modulation = v195.addition.visuals:switch("Molotov modulation", false, function(v238)
    return {
        options = v238:listable("##Options", {
            [1] = "Wireframe", 
            [2] = "Visible through walls", 
            [3] = "Remove smog"
        })
    }, true;
end);
v196.features.local_animations = v195.addition.visuals:switch("Local animations", false, function(v239)
    return {
        legs_while_moving = v239:combo("Legs while moving", {
            [1] = "Default", 
            [2] = "Static", 
            [3] = "Jitter", 
            [4] = "Smooth jitter"
        }), 
        legs_while_flying = v239:combo("Legs while flying", {
            [1] = "Default", 
            [2] = "Static", 
            [3] = "Jitter", 
            [4] = "Smooth jitter", 
            [5] = "Walking"
        }), 
        body_lean = v239:combo("Body lean", {
            [1] = "Default", 
            [2] = "Static", 
            [3] = "Jitter", 
            [4] = "Smooth jitter"
        })
    }, true;
end);
v196.features.damage_indicator = v195.addition.visuals:switch("Damage indicator", false, function(v240)
    return {
        options = v240:listable("##Options", {
            [1] = "Indicate if overriden", 
            [2] = "Animated"
        })
    }, true;
end);
v196.features.crosshair_indicators = v195.addition.visuals:switch("Crosshair indicators");
v196.features.manual_arrows = v195.addition.visuals:switch("Manual arrows");
v196.features.fps_boost = v195.addition.visuals:selectable("Perfomance boost", {
    [1] = "Degradation of sound quality", 
    [2] = "Off foots shadows", 
    [3] = "On multithreaded mode", 
    [4] = "Off useless ragdolls physics", 
    [5] = "Off eyes animation", 
    [6] = "Off props textures", 
    [7] = "Off 3D skyboxes", 
    [8] = "Off garbage", 
    [9] = "Off joystick", 
    [10] = "Off dynamic lighting", 
    [11] = "Off blood"
});
v196.features.ragdolls_physics = v195.addition.visuals:combo("Ragdolls physics", {
    [1] = "Off", 
    [2] = "Cosmonaut", 
    [3] = "Helium", 
    [4] = "Thanos snap", 
    [5] = "Moon"
});
v196.features.visuals_ico = v195.addition.visuals:label("\v\f<sun-haze>  \240\157\151\169\240\157\151\182\240\157\152\128\240\157\152\130\240\157\151\174\240\157\151\185\240\157\152\128");
v196.features.warmup_setup_helper = v195.addition.misc:label("Warmup helper");
v196.features.warmup_setup_button = v195.addition.misc:button("Join \v&\r Setup", function()
    -- upvalues: v108 (ref)
    if not globals.is_connected then
        utils.console_exec("map de_mirage");
    end;
    local function v241()
        -- upvalues: v108 (ref), v241 (ref)
        if not v108() then
            utils.execute_after(1, v241);
        end;
    end;
    v241();
end, true);
v196.features.no_fall_damage = v195.addition.misc:switch("No fall damage", false, "It doesnt always work due to the mechanics of the game.");
v196.features.fast_ladder = v195.addition.misc:switch("Fast ladder", false, function(v242)
    return {
        disablers = v242:listable("##Disablers", {
            [1] = "Off with grenade"
        })
    }, true;
end);
v196.features.misc_ico = v195.addition.misc:label("\v\f<gears>  \240\157\151\160\240\157\151\182\240\157\152\128\240\157\151\176\240\157\151\178\240\157\151\185\240\157\151\185\240\157\151\174\240\157\151\187\240\157\151\178\240\157\151\188\240\157\152\130\240\157\152\128");
l_pui_0.setup(v196);
local v243 = {};
if not pcall(l_ffi_0.typeof, "struct vec3_t") then
    l_ffi_0.cdef("            typedef struct {\n                float x;\n                float y;\n                float z;\n            } vec3_t;\n        ");
end;
local v244 = utils.opcode_scan("client.dll", "55 8B EC 83 E4 F8 51 53 56 57 8B F1 E8") or error("Invalid signature for set_abs_origin");
local _ = l_ffi_0.cast("void(__thiscall*)(void*, const vec3_t*)", v244);
local v246 = utils.create_interface("client.dll", "VClientEntityList003") or error("VClientEntityList003 not found");
local v247 = l_ffi_0.cast("void***", v246);
local v248 = l_ffi_0.cast("void*(__thiscall*)(void*, int)", v247[0][3]);
local v249 = utils.get_vfunc("client.dll", "VClientEntityList003", 3, "void*(__thiscall*)(void*, int)");
local v250 = 0;
local _ = {};
local v252 = v13.screen_size / 2;
local v253 = {
    wa = l_smoothy_0.new(255), 
    wpx = l_smoothy_0.new(v252.x), 
    ia = l_smoothy_0.new(255), 
    ipx = l_smoothy_0.new(v252.x), 
    inds = {}, 
    ar = l_smoothy_0.new(v196.features.aspectratio.amount:get()), 
    vf = l_smoothy_0.new(v196.features.viewmodel.fov:get()), 
    vx = l_smoothy_0.new(v196.features.viewmodel.x:get()), 
    vy = l_smoothy_0.new(v196.features.viewmodel.y:get()), 
    vz = l_smoothy_0.new(v196.features.viewmodel.z:get()), 
    dd = l_smoothy_0.new(v12.min_damage:get()), 
    dda = l_smoothy_0.new(255)
};
do
    local l_v246_0, l_v248_0, l_v249_0, l_v250_0, l_v252_0, l_v253_0 = v246, v248, v249, v250, v252, v253;
    v243 = {
        prediction = function(v260)
            -- upvalues: v16 (ref)
            local v261 = entity.get_local_player();
            local v262 = v261 and v261.m_iTeamNum or 2;
            local v263 = v260:get();
            local v264 = v263 == "cl_lagcompensation 0" and 0 or 1;
            if v264 == v16.cl_lagcompensation:int() then
                return;
            else
                if v263 == "cl_lagcompensation 0" then
                    if v261 then
                        utils.console_exec("jointeam 1");
                        utils.execute_after(0.5, function()
                            -- upvalues: v264 (ref)
                            utils.console_exec("cl_lagcompensation " .. v264);
                        end);
                        utils.execute_after(1, function()
                            -- upvalues: v262 (ref)
                            utils.console_exec("jointeam " .. v262);
                        end);
                    else
                        utils.console_exec("cl_lagcompensation " .. v264);
                    end;
                elseif v261 then
                    utils.console_exec("jointeam 1");
                    utils.execute_after(0.5, function()
                        -- upvalues: v264 (ref)
                        utils.console_exec("cl_lagcompensation " .. v264);
                    end);
                    utils.execute_after(1, function()
                        -- upvalues: v262 (ref)
                        utils.console_exec("jointeam " .. v262);
                    end);
                else
                    utils.console_exec("cl_lagcompensation " .. v264);
                end;
                return;
            end;
        end, 
        predict_uncharge_update = function()
            -- upvalues: v196 (ref), v0 (ref), v13 (ref)
            if v196.features.prediction:get() ~= "Predict uncharge" then
                return;
            else
                local v265 = entity.get_players(true);
                for _, v267 in pairs(v265) do
                    local v268 = v0.get_snapshot(v267);
                    if v268 then
                        local v269 = v267:get_index();
                        v13.previous_records[v269] = v13.records[v269];
                        v13.records[v269] = v268;
                        if v13.records[v269].simulation_time.current ~= v13.records[v269].simulation_time.previous then
                            local v270 = globals.tickcount - to_ticks(v13.records[v269].simulation_time.current) - 1;
                            v13.records[v269].command.shifting = math.clamp(v270, 0, 16);
                        end;
                    end;
                end;
                return;
            end;
        end, 
        predict_uncharge = function()
            -- upvalues: v196 (ref), v16 (ref), v12 (ref), v13 (ref), v48 (ref), l_v248_0 (ref), l_v246_0 (ref), v51 (ref)
            if v196.features.prediction:get() ~= "Predict uncharge" then
                return;
            else
                if v16.cl_clock_correction:int() ~= 0 then
                    v16.cl_clock_correction:int(0);
                end;
                v12.min_damage.delay_shot:override(nil);
                local v271 = entity.get_threat();
                if v271 and v271:is_dormant() then
                    local v272 = v271:get_index();
                    local v273 = v13.records[v272];
                    local v274 = v13.previous_records[v272];
                    if v273 and v274 then
                        local v275 = globals.tickcount - to_ticks(v273.simulation_time.current);
                        if v275 < 0 then
                            local v276 = math.abs(v275);
                            cmd.tickcount = globals.tickcount + v276;
                            if v273.command.shifting == 0 and v273.command.no_entry.y == 0 and (v274.command.shifting ~= 0 or v274.command.no_entry.y ~= 0) then
                                local l_current_0 = v273.origin.current;
                                local l_m_vecVelocity_1 = v271.m_vecVelocity;
                                local v279 = v48(l_current_0, l_m_vecVelocity_1, v276);
                                local l_end_pos_0 = utils.trace_line(l_current_0, v279, 1, 0).end_pos;
                                local v281 = l_v248_0(l_v246_0, v272);
                                v51(v281, l_end_pos_0);
                                v12.min_damage.delay_shot:override(false);
                            end;
                        end;
                    end;
                end;
                return;
            end;
        end, 
        damage_indicator = function()
            -- upvalues: v196 (ref), v191 (ref), v12 (ref), l_v253_0 (ref), v13 (ref), l_v252_0 (ref)
            if not v196.features.damage_indicator:get() then
                return;
            else
                local v282 = false;
                for _, v284 in pairs(ui.get_binds()) do
                    if v284.active and v284.name == "Min. Damage" then
                        v282 = true;
                    end;
                end;
                if not v191() and ui.get_alpha() == 1 or v191() then
                    if v196.features.damage_indicator.options:get(1) and not v282 then
                        return;
                    else
                        local v285 = v12.min_damage:get();
                        local v286 = l_v253_0.dd:update(0.1, v285);
                        local v287 = entity.get_local_player();
                        local v288 = v287 and v287:get_player_weapon();
                        local v289 = v287 and v288 and v288:get_classname();
                        local v290 = v288 and v288.m_zoomLevel and v288.m_zoomLevel > 0;
                        local v291 = globals.is_connected and v287 and v289 and (v289:find("Grenade") and ui.get_alpha() == 0 or v290);
                        local v292 = l_v253_0.dda:update(0.1, v291 and 75 or 255);
                        local v293 = v196.features.damage_indicator.options:get("Animated") and math.floor(v286 + 0.5) or "hp";
                        render.text(v13.tahoma_bold, vector(l_v252_0.x + 21, l_v252_0.y - 15), color(255, v292), "c", v293 == 0 and "a" or v293);
                    end;
                end;
                return;
            end;
        end, 
        fast_ladder = function(v294)
            -- upvalues: v196 (ref)
            if not v196.features.fast_ladder:get() then
                return;
            else
                local v295 = entity.get_local_player();
                local v296 = v295 and v295:get_player_weapon();
                local v297 = v295 and v296 and v296:get_classname();
                if v196.features.fast_ladder.disablers:get(1) and v297 and v297:find("Grenade") then
                    return;
                elseif v295.m_MoveType ~= 9 then
                    return;
                else
                    local l_x_0 = render.camera_angles().x;
                    if v294.forwardmove > 0 and l_x_0 < 45 then
                        v294.view_angles.x = 89;
                        v294.in_moveright = 1;
                        v294.in_moveleft = 0;
                        v294.in_forward = 0;
                        v294.in_back = 1;
                        if v294.sidemove == 0 then
                            v294.view_angles.y = v294.view_angles.y + 90;
                        end;
                        if v294.sidemove < 0 then
                            v294.view_angles.y = v294.view_angles.y + 150;
                        end;
                        if v294.sidemove > 0 then
                            v294.view_angles.y = v294.view_angles.y + 30;
                        end;
                    end;
                    if v294.forwardmove < 0 then
                        v294.view_angles.x = 89;
                        v294.in_moveleft = 1;
                        v294.in_moveright = 0;
                        v294.in_forward = 1;
                        v294.in_back = 0;
                        if v294.sidemove == 0 then
                            v294.view_angles.y = v294.view_angles.y + 90;
                        end;
                        if v294.sidemove > 0 then
                            v294.view_angles.y = v294.view_angles.y + 150;
                        end;
                        if v294.sidemove < 0 then
                            v294.view_angles.y = v294.view_angles.y + 30;
                        end;
                    end;
                    return;
                end;
            end;
        end, 
        local_animations = function()
            -- upvalues: v196 (ref), l_v249_0 (ref), v84 (ref), v12 (ref), l_ffi_0 (ref)
            if not v196.features.local_animations:get() then
                return;
            else
                local v299 = entity.get_local_player();
                local v300 = l_v249_0(v299:get_index());
                if v196.features.local_animations.legs_while_moving:get() == "Static" and v84(v299) > 2 then
                    v299.m_flPoseParameter[0] = 1;
                    v12.leg_movement:override("Sliding");
                elseif v196.features.local_animations.legs_while_moving:get() == "Jitter" and v84(v299) > 2 then
                    v299.m_flPoseParameter[0] = globals.tickcount % 3 > 1.5 and 0.5 or 1;
                    v12.leg_movement:override("Sliding");
                elseif v196.features.local_animations.legs_while_moving:get() == "Smooth jitter" and v84(v299) > 2 then
                    v299.m_flPoseParameter[0] = utils.random_float(0.1, 10) / 10;
                    v12.leg_movement:override("Sliding");
                else
                    v12.leg_movement:override(nil);
                end;
                if v196.features.local_animations.legs_while_flying:get() == "Walking" and v84(v299) > 2 then
                    l_ffi_0.cast("CAnimationLayer**", l_ffi_0.cast("uintptr_t", v300) + 10640)[0][6].m_flWeight = 1;
                elseif v196.features.local_animations.legs_while_flying:get() == "Static" then
                    v299.m_flPoseParameter[6] = 1;
                elseif v196.features.local_animations.legs_while_flying:get() == "Jitter" then
                    v299.m_flPoseParameter[6] = globals.tickcount % 3 > 1.5 and 0.5 or 1;
                elseif v196.features.local_animations.legs_while_flying:get() == "Smooth jitter" then
                    v299.m_flPoseParameter[6] = utils.random_float(0.1, 10) / 10;
                end;
                if v196.features.local_animations.body_lean:get() == "Static" then
                    l_ffi_0.cast("CAnimationLayer**", l_ffi_0.cast("uintptr_t", v300) + 10640)[0][12].m_flWeight = 1;
                elseif v196.features.local_animations.body_lean:get() == "Jitter" then
                    l_ffi_0.cast("CAnimationLayer**", l_ffi_0.cast("uintptr_t", v300) + 10640)[0][12].m_flWeight = utils.random_int(0, 1);
                elseif v196.features.local_animations.body_lean:get() == "Smooth jitter" then
                    l_ffi_0.cast("CAnimationLayer**", l_ffi_0.cast("uintptr_t", v300) + 10640)[0][12].m_flWeight = utils.random_float(0, 1);
                end;
                return;
            end;
        end, 
        indication = function()
            -- upvalues: v196 (ref), l_v252_0 (ref), v13 (ref), l_v253_0 (ref), v191 (ref), l_smoothy_0 (ref)
            if not v196.features.crosshair_indicators:get() then
                render.text(4, vector(l_v252_0.x, v13.screen_size.y - 15), color(255, math.sin(math.abs(-3.14 + globals.curtime * 1.2727272727272725 % 6.28)) * 170), "c", "juicy");
                return;
            else
                local v301 = entity.get_local_player();
                local v302 = v301 and v301:get_player_weapon();
                local v303 = v301 and v302 and v302:get_classname();
                local v304 = v302 and v302.m_zoomLevel and v302.m_zoomLevel > 0;
                local v305 = globals.is_connected and v301 and v303 and (v303:find("Grenade") and ui.get_alpha() == 0 or v304);
                local v306 = v305 and 75 or math.sin(math.abs(-3.14 + globals.curtime * 1.2727272727272725 % 6.28)) * 170;
                local v307 = v305 and 75 or 255;
                local v308 = l_v253_0.wa:update(0.15, v306);
                local v309 = l_v253_0.ia:update(0.15, v307);
                local v310 = "juicy";
                local v311 = render.measure_text(4, "c", v310);
                local v312 = v304 and v311.x or 0;
                local v313 = l_v252_0.x + v312;
                local v314 = l_v253_0.wpx:update(0.15, math.floor(v313) + 0.5);
                render.text(4, vector(v314, v191() and l_v252_0.y + 15 or ui.get_alpha() == 0 and v13.screen_size.y - 15 or l_v252_0.y + 15), color(255, v308), "c", v310);
                if not v191() then
                    return;
                else
                    local v315 = ui.get_binds();
                    for _, v317 in pairs(v315) do
                        if not l_v253_0.inds[v317.name] then
                            l_v253_0.inds[v317.name] = {
                                x = l_smoothy_0.new(l_v252_0.x), 
                                y = l_smoothy_0.new(l_v252_0.y), 
                                col = l_smoothy_0.new(color(255, v309))
                            };
                        end;
                    end;
                    local v318 = 20;
                    local l_y_0 = l_v252_0.y;
                    for _, v321 in pairs(v315) do
                        local v322 = v13.bindings[v321.name] or v321.name;
                        if v321.active and (v322 ~= "dmg" or not v196.features.damage_indicator:get()) then
                            local v323 = render.measure_text(4, nil, v322);
                            local v324 = l_v252_0.x - v323.x * 0.5 + (v304 and 10 + v323.x * 0.5 or 0);
                            local v325 = l_y_0 + v318;
                            local v326 = l_v253_0.inds[v321.name].x:update(0.15, math.floor(v324) + 0.5);
                            local v327 = l_v253_0.inds[v321.name].y:update(0.15, math.floor(v325) + 0.5);
                            local v328 = nil;
                            if v322 == "dt" or v322 == "hs" then
                                v328 = rage.exploit:get() == 1 and color(255, v309) or color(255, 0, 0, v309);
                            else
                                v328 = color(255, v309);
                            end;
                            local v329 = l_v253_0.inds[v321.name].col:update(0.15, v328);
                            v318 = v318 + v323.y;
                            render.text(4, vector(v326, v327), v329, "s", v322);
                        end;
                    end;
                    return;
                end;
            end;
        end, 
        manual_arrows = function()
            -- upvalues: v196 (ref), v191 (ref), v13 (ref), l_v252_0 (ref)
            if not v196.features.manual_arrows:get() then
                return;
            elseif not v191() then
                if ui.get_alpha() == 0 then
                    return;
                else
                    render.text(v13.tahoma_bold_big, vector(l_v252_0.x - 50, l_v252_0.y), color(0, 55), "c, s", "\226\174\156");
                    render.text(v13.tahoma_bold_big, vector(l_v252_0.x + 50, l_v252_0.y), color(0, 55), "c, s", "\226\174\158");
                    return;
                end;
            else
                if not entity.get_local_player().m_bIsScoped then
                    if v13.yaw_override_side == 2 then
                        render.text(v13.tahoma_bold_big, vector(l_v252_0.x - 50, l_v252_0.y), color(255), "c, s", "\226\174\156");
                        render.text(v13.tahoma_bold_big, vector(l_v252_0.x + 50, l_v252_0.y), color(0, 55), "c, s", "\226\174\158");
                    elseif v13.yaw_override_side == 3 then
                        render.text(v13.tahoma_bold_big, vector(l_v252_0.x - 50, l_v252_0.y), color(0, 55), "c, s", "\226\174\156");
                        render.text(v13.tahoma_bold_big, vector(l_v252_0.x + 50, l_v252_0.y), color(255), "c, s", "\226\174\158");
                    end;
                end;
                return;
            end;
        end, 
        aspectratio = function()
            -- upvalues: v196 (ref), l_v253_0 (ref), v16 (ref)
            local v330 = v196.features.aspectratio.amount:get();
            local v331 = l_v253_0.ar:update(0.15, v196.features.aspectratio:get() and v330 or 1778);
            if v331 ~= v330 then
                v16.r_aspectratio:float(v331 / 1000);
            end;
        end, 
        viewmodel = function()
            -- upvalues: v196 (ref), l_v253_0 (ref), v16 (ref)
            local v332 = v196.features.viewmodel:get();
            local v333 = v196.features.viewmodel.fov:get();
            local v334 = v196.features.viewmodel.x:get();
            local v335 = v196.features.viewmodel.y:get();
            local v336 = v196.features.viewmodel.z:get();
            local v337 = l_v253_0.vf:update(0.15, v332 and v333 or 68);
            local v338 = l_v253_0.vx:update(0.15, v332 and v334 or 25);
            local v339 = l_v253_0.vy:update(0.15, v332 and v335 or 0);
            local v340 = l_v253_0.vz:update(0.15, v332 and v336 or -10);
            if v337 ~= v333 or v338 ~= v334 or v339 ~= v335 or v340 ~= v336 then
                v16.viewmodel_fov:float(v337, true);
                v16.viewmodel_offset_x:float(v338 / 10, true);
                v16.viewmodel_offset_y:float(v339 / 10, true);
                v16.viewmodel_offset_z:float(v340 / 10, true);
            end;
        end, 
        ping_spike = function()
            -- upvalues: v196 (ref), v16 (ref), v12 (ref)
            local l_ping_spike_0 = v196.features.ping_spike;
            if not l_ping_spike_0:get() then
                v16.sv_maxunlag:float(0.2);
                v12.fake_latency:override(nil);
                return;
            else
                local v342 = l_ping_spike_0.amount:get();
                v16.sv_maxunlag:float(math.max(0.2, v342 * 0.002), true);
                v12.fake_latency:override(v342);
                return;
            end;
        end, 
        anti_hit = function(v343)
            -- upvalues: v13 (ref), v102 (ref), v107 (ref), v196 (ref), v12 (ref), v194 (ref), l_v250_0 (ref), v135 (ref), v84 (ref), v81 (ref), v77 (ref), v16 (ref), v92 (ref)
            v13.state = v102();
            local v344 = v107();
            local v345 = entity.get_local_player();
            local v346 = v345:get_player_weapon();
            if not v346 then
                return;
            else
                local v347 = v346:get_classname();
                if v196.anti_hit.tweaks.geroin.legit_aa:get() and v343.in_use then
                    local v348 = v345:get_origin();
                    local v349 = nil;
                    local l_huge_0 = math.huge;
                    entity.get_entities("CPropDoorRotating", false, function(v351)
                        -- upvalues: v348 (ref), l_huge_0 (ref), v349 (ref)
                        local v352 = v351:get_origin();
                        local v353 = v348:dist2dsqr(v352);
                        if v353 < l_huge_0 then
                            l_huge_0 = v353;
                            v349 = v351;
                        end;
                    end);
                    local _ = v349 and v349:get_origin();
                    local v355 = math.sqrt(l_huge_0);
                    if not v349 or v355 <= 150 then

                    end;
                    if v347:find("C4") then
                        v343.in_use = true;
                        return;
                    else
                        v343.in_use = v343.choked_commands == 1;
                        v12.anti_aim_enabled:override(true);
                        v12.pitch:override("Disabled");
                        v12.yaw:override("Backward");
                        v12.yaw.base:override("Local View");
                        v12.yaw.offset:override(-180);
                        v12.yaw.avoid_backstab:override(false);
                        v12.yaw.hidden:override(false);
                        v12.body_yaw:override(true);
                        v12.body_yaw.inverter:override(false);
                        v12.body_yaw.right_limit:override(60);
                        v12.body_yaw.left_limit:override(60);
                        v12.body_yaw.options:override({
                            [1] = "Avoid Overlap", 
                            [2] = "Jitter", 
                            [3] = "Randomize Jitter", 
                            [4] = "Anti Bruteforce"
                        });
                        v12.body_yaw.freestanding:override("Peek Fake");
                        return;
                    end;
                else
                    local l_m_bWarmupPeriod_0 = entity.get_game_rules().m_bWarmupPeriod;
                    local v357 = v194();
                    local v358 = rage.antiaim:get_target(true) ~= nil or entity.get_threat(true);
                    local v359 = v196.anti_hit.defensive_setup.geroin.force_lag:get(v344) or v358;
                    local l_m_nTickBase_0 = v345.m_nTickBase;
                    local v361 = 0;
                    if math.abs(l_m_nTickBase_0 - l_v250_0) > 64 then
                        l_v250_0 = 0;
                    end;
                    if l_v250_0 < l_m_nTickBase_0 then
                        l_v250_0 = l_m_nTickBase_0;
                    elseif l_m_nTickBase_0 < l_v250_0 then
                        v361 = math.min(14, math.max(0, l_v250_0 - l_m_nTickBase_0 - 1));
                    end;
                    local v362 = v135(v345);
                    local function v373()
                        -- upvalues: v345 (ref), v347 (ref), v84 (ref), v81 (ref)
                        local v363 = entity.get_threat();
                        local v364 = v345:get_eye_position();
                        local v365 = v363 and v363:get_eye_position() or vector();
                        local v366 = v363 and v364 - v365 or vector();
                        local v367 = v347 == "CKnife" or v347 == "CWeaponTaser";
                        local v368 = math.sqrt(v366.x * v366.x + v366.y * v366.y);
                        local l_m_fFlags_2 = v345.m_fFlags;
                        local v370 = bit.band(l_m_fFlags_2, 2) == 2;
                        local v371 = v84(v345);
                        local v372 = v81();
                        if entity.get_threat() then
                            if v372 > 95 and v366.z > 25 and v370 and v371 < 5 and v368 > 130 then
                                return true;
                            elseif v372 < 5 and (v366.z > 275 or v366.z > 250 and v370) and v368 > 500 then
                                return true;
                            elseif v367 and v370 and v366.z > -30 then
                                return true;
                            else
                                return;
                            end;
                        else
                            return false;
                        end;
                    end;
                    local function v376(v374)
                        local v375 = utils.random_int(0, 1) == 0 and -1 or 1;
                        return utils.random_int(utils.random_int(-v374, v374), utils.random_int(-v374, v374)) * v375;
                    end;
                    v12.double_tap.lag_options:override(v359 and "Always On" or "On Peek");
                    v12.hide_shots.options:override(v359 and "Break LC" or "Favor Fire rate");
                    v12.fake_lag_enabled:override(not (not v196.anti_hit.tweaks.geroin.adaptive_fakelags:get() or v12.double_tap:get()) and not v12.hide_shots:get() or nil);
                    local l_fake_lag_variability_0 = v12.fake_lag_variability;
                    local l_l_fake_lag_variability_0_0 = l_fake_lag_variability_0;
                    l_fake_lag_variability_0 = l_fake_lag_variability_0.override;
                    local v379;
                    if v196.anti_hit.tweaks.geroin.adaptive_fakelags:get() then
                        v379 = (not (v13.state ~= "Air duck") or v13.state == "Air") and 15 or 0;
                    else
                        v379 = nil;
                    end;
                    l_fake_lag_variability_0(l_l_fake_lag_variability_0_0, v379);
                    l_fake_lag_variability_0 = v12.fake_lag_limit;
                    l_l_fake_lag_variability_0_0 = l_fake_lag_variability_0;
                    l_fake_lag_variability_0 = l_fake_lag_variability_0.override;
                    if v196.anti_hit.tweaks.geroin.adaptive_fakelags:get() then
                        v379 = not (not not v12.fake_duck:get() or v358) and math.random(0, 14) or 14;
                    else
                        v379 = nil;
                    end;
                    l_fake_lag_variability_0(l_l_fake_lag_variability_0_0, v379);
                    v12.pitch:override("Down");
                    v12.anti_aim_enabled:override(true);
                    v12.yaw_modifier:override("Disabled");
                    v12.body_yaw.freestanding:override("Off");
                    v12.body_yaw.options:override({});
                    v12.yaw.hidden:override(false);
                    v12.freestanding.body_freestanding:override(false);
                    if v196.anti_hit.tweaks.geroin.hide_angles:get(1) and l_m_bWarmupPeriod_0 or v196.anti_hit.tweaks.geroin.hide_angles:get(2) and not v357 then
                        v12.pitch:override("Disabled");
                        v12.yaw.offset:override(v77(globals.tickcount / 16 * 360 % 360, -180, 180));
                        v12.yaw:override("Backward");
                        v12.yaw.avoid_backstab:override(false);
                        v12.freestanding:override(false);
                        v12.body_yaw:override(true);
                        v12.body_yaw.inverter:override(true);
                        v12.body_yaw.left_limit:override(60);
                        v12.body_yaw.right_limit:override(60);
                        v12.body_yaw.options:override({
                            [1] = "Avoid Overlap", 
                            [2] = "Anti Bruteforce"
                        });
                        v12.body_yaw.freestanding:override("Peek Fake");
                        return;
                    elseif v196.anti_hit.keybindings.geroin.lag_switch:get() and v13.state == "Air duck" and globals.tickcount % 64 >= v196.anti_hit.keybindings.geroin.lag_switch_ticks:get() and not v345:get_anim_state().landing then
                        v12.body_yaw:override(false);
                        if v361 > 3 then
                            v12.fake_lag_enabled:override(true);
                            v16.sv_maxusrcmdprocessticks:int(19, true);
                            v12.fake_lag_limit:override(17);
                            v12.fake_lag_variability:override(0);
                            rage.exploit:force_teleport();
                        else
                            rage.exploit:force_charge();
                            v12.double_tap.lag_options:override("Always On");
                            v343.force_defensive = true;
                        end;
                        return;
                    elseif v196.anti_hit.keybindings.geroin.defensive_flick:get() and (v13.state == "Stand" or v13.state == "Walk") then
                        v12.double_tap.lag_options:override("Always On");
                        v12.hide_shots.options:override("Break LC");
                        v12.yaw:override("Backward");
                        v12.yaw.base:override("At Target");
                        v12.yaw.offset:override(0);
                        v12.yaw.hidden:override(true);
                        v12.yaw.avoid_backstab:override(false);
                        v12.freestanding:override(false);
                        v12.body_yaw:override(true);
                        l_fake_lag_variability_0 = v12.body_yaw.inverter;
                        l_l_fake_lag_variability_0_0 = l_fake_lag_variability_0;
                        l_fake_lag_variability_0 = l_fake_lag_variability_0.override;
                        if not v362 or v362 ~= 1 then
                            v379 = false;
                        else
                            v379 = true;
                        end;
                        l_fake_lag_variability_0(l_l_fake_lag_variability_0_0, v379);
                        v12.body_yaw.right_limit:override(60);
                        v12.body_yaw.left_limit:override(60);
                        v12.body_yaw.options:override({
                            [1] = "Avoid overlap"
                        });
                        v12.body_yaw.freestanding:override("Off");
                        l_fake_lag_variability_0 = globals.tickcount % 11 == 0;
                        rage.antiaim:override_hidden_yaw_offset(v362 and -90 * v362 or -90);
                        v343.force_defensive = l_fake_lag_variability_0;
                        return;
                    elseif v196.anti_hit.keybindings.geroin.yaw_direction:get() == "At targets" and v196.anti_hit.tweaks.geroin.hide_angles:get() and v373() then
                        v12.yaw:override("Backward");
                        v12.yaw.base:override("At Target");
                        v12.yaw.offset:override(5);
                        v12.yaw.avoid_backstab:override(false);
                        v12.freestanding:override(false);
                        v12.body_yaw:override(true);
                        v12.body_yaw.inverter:override(false);
                        v12.body_yaw.right_limit:override(1);
                        v12.body_yaw.left_limit:override(1);
                        v12.body_yaw.options:override({});
                        v12.body_yaw.freestanding:override("Off");
                        return;
                    else
                        l_fake_lag_variability_0 = v196.anti_hit.builders.base[v13.state].override_:get() and v13.state or "Shared";
                        l_l_fake_lag_variability_0_0 = v196.anti_hit.builders.base[l_fake_lag_variability_0];
                        v12.yaw.avoid_backstab:override(v196.anti_hit.tweaks.geroin.anti_backstab:get());
                        v12.freestanding:override(v196.anti_hit.keybindings.geroin.freestanding:get() and rage.antiaim:get_target(true) ~= nil);
                        if v196.anti_hit.defensive_setup.geroin.lag_aa_ticks:get() < v361 and v196.anti_hit.defensive_setup.geroin.lag_aa:get(v344) then
                            v12.yaw.hidden:override(true);
                            v12.yaw.offset:override(0);
                            if v196.anti_hit.defensive_setup.geroin.lag_pitch:get() == "Static" then
                                rage.antiaim:override_hidden_pitch(v196.anti_hit.defensive_setup.geroin.lag_pitch_offset:get());
                            elseif v196.anti_hit.defensive_setup.geroin.lag_pitch:get() == "Jitter" then
                                rage.antiaim:override_hidden_pitch(globals.tickcount % 3 == 0 and v196.anti_hit.defensive_setup.geroin.lag_pitch_primary:get() or v196.anti_hit.defensive_setup.geroin.lag_pitch_secondary:get());
                            elseif v196.anti_hit.defensive_setup.geroin.lag_pitch:get() == "Random" then
                                rage.antiaim:override_hidden_pitch(math.random(v196.anti_hit.defensive_setup.geroin.lag_pitch_primary:get(), v196.anti_hit.defensive_setup.geroin.lag_pitch_secondary:get()));
                            end;
                            if v196.anti_hit.defensive_setup.geroin.lag_yaw:get() == "Static" then
                                rage.antiaim:override_hidden_yaw_offset(v196.anti_hit.defensive_setup.geroin.lag_yaw_offset:get());
                            elseif v196.anti_hit.defensive_setup.geroin.lag_yaw:get() == "Jitter" then
                                rage.antiaim:override_hidden_yaw_offset(globals.tickcount % 3 == 0 and v196.anti_hit.defensive_setup.geroin.lag_yaw_primary:get() or v196.anti_hit.defensive_setup.geroin.lag_yaw_secondary:get());
                            elseif v196.anti_hit.defensive_setup.geroin.lag_yaw:get() == "Random" then
                                rage.antiaim:override_hidden_yaw_offset(math.random(v196.anti_hit.defensive_setup.geroin.lag_yaw_primary:get(), v196.anti_hit.defensive_setup.geroin.lag_yaw_secondary:get()));
                            end;
                            if v196.anti_hit.defensive_setup.geroin.lag_body_yaw:get() == "Static" then
                                v12.body_yaw.inverter:override(v196.anti_hit.defensive_setup.geroin.lag_body_yaw_offset:get() > 0);
                                v12.body_yaw.right_limit:override(v196.anti_hit.defensive_setup.geroin.lag_body_yaw_offset:get() > 0 and v196.anti_hit.defensive_setup.geroin.lag_body_yaw_offset:get() or v196.anti_hit.defensive_setup.geroin.lag_body_yaw_offset:get() * -1);
                                v12.body_yaw.left_limit:override(v196.anti_hit.defensive_setup.geroin.lag_body_yaw_offset:get() > 0 and v196.anti_hit.defensive_setup.geroin.lag_body_yaw_offset:get() or v196.anti_hit.defensive_setup.geroin.lag_body_yaw_offset:get() * -1);
                            elseif v196.anti_hit.defensive_setup.geroin.lag_body_yaw:get() == "Jitter" then
                                v12.body_yaw.inverter:override(globals.tickcount % 3 == 0);
                                v12.body_yaw.right_limit:override(v196.anti_hit.defensive_setup.geroin.lag_body_yaw_primary:get() * -1);
                                v12.body_yaw.left_limit:override(v196.anti_hit.defensive_setup.geroin.lag_body_yaw_secondary:get());
                            end;
                            if v196.anti_hit.defensive_setup.geroin.lag_yaw_freestand:get() and v358 then
                                rage.antiaim:override_hidden_yaw_offset(v362 and 90 * -v362 or -180);
                            end;
                            return;
                        elseif v196.anti_hit.keybindings.geroin.yaw_direction:get() == "Forward" then
                            v13.yaw_override_side = 1;
                            v12.yaw.offset:override(180);
                            v12.body_yaw.left_limit:override(60);
                            v12.body_yaw.right_limit:override(60);
                            return;
                        elseif v196.anti_hit.keybindings.geroin.yaw_direction:get() == "Left" then
                            v13.yaw_override_side = 2;
                            v12.yaw.offset:override(-90);
                            v12.body_yaw.inverter:override(false);
                            v12.body_yaw.left_limit:override(60);
                            v12.body_yaw.right_limit:override(60);
                            return;
                        elseif v196.anti_hit.keybindings.geroin.yaw_direction:get() == "Right" then
                            v13.yaw_override_side = 3;
                            v12.yaw.offset:override(90);
                            v12.body_yaw.inverter:override(false);
                            v12.body_yaw.left_limit:override(60);
                            v12.body_yaw.right_limit:override(60);
                            return;
                        else
                            v13.yaw_override_side = 0;
                            v12.yaw.base:override("At Target");
                            v13.anti_hit.yaw_modifier_await = v92(l_l_fake_lag_variability_0_0.yaw_modifier_await.amount, l_l_fake_lag_variability_0_0.yaw_modifier_await.method, l_l_fake_lag_variability_0_0.yaw_modifier_await.transition:get() / 75);
                            v379 = v12.freestanding:get() and rage.antiaim:get_target(true) ~= nil;
                            local v380 = v376(l_l_fake_lag_variability_0_0.yaw_modifier_anomaly.amount:get());
                            local l_yaw_modifier_await_0 = v13.anti_hit.yaw_modifier_await;
                            v12.body_yaw:override(true);
                            v12.yaw:override("Backward");
                            v12.yaw.offset:override(0);
                            if not v379 then
                                if l_l_fake_lag_variability_0_0.yaw_modifier:get() == "Static" then
                                    v12.yaw.offset:override(l_l_fake_lag_variability_0_0.yaw_modifier_offset:get());
                                elseif l_l_fake_lag_variability_0_0.yaw_modifier:get() == "Jitter" then
                                    v12.yaw.offset:override(v77(v380 + (l_yaw_modifier_await_0 and l_l_fake_lag_variability_0_0.yaw_modifier_primary:get() or l_l_fake_lag_variability_0_0.yaw_modifier_secondary:get()), -180, 180));
                                end;
                            end;
                            v12.body_yaw.left_limit:override(l_l_fake_lag_variability_0_0.body_yaw_modifier_primary:get() * -1);
                            v12.body_yaw.right_limit:override(l_l_fake_lag_variability_0_0.body_yaw_modifier_secondary:get());
                            if l_l_fake_lag_variability_0_0.body_yaw_modifier:get() == "Static" then
                                v12.body_yaw.inverter:override(v196.anti_hit.keybindings.geroin.inverter:get());
                            elseif l_l_fake_lag_variability_0_0.body_yaw_modifier:get() == "Jitter" then
                                if l_l_fake_lag_variability_0_0.yaw_modifier:get() ~= "Off" then
                                    v12.body_yaw.inverter:override(v13.anti_hit.yaw_modifier_await);
                                end;
                            else
                                v12.body_yaw:override(false);
                            end;
                            return;
                        end;
                    end;
                end;
            end;
        end, 
        fps_boost = function()
            -- upvalues: v196 (ref), v16 (ref), v17 (ref)
            if v196.features.fps_boost:get(1) then
                v16.dsp_slow_cpu:int(1, true);
            else
                v16.dsp_slow_cpu:int(v17.dsp_slow_cpu, true);
            end;
            if v196.features.fps_boost:get(2) then
                v16.cl_foot_contact_shadows:int(0, true);
            else
                v16.cl_foot_contact_shadows:int(1, true);
            end;
            if v196.features.fps_boost:get(3) then
                v16.mat_queue_mode:int(2, true);
            else
                v16.mat_queue_mode:int(v17.mat_queue_mode, true);
            end;
            if v196.features.fps_boost:get(4) then
                v16.cl_disable_ragdolls:int(1, true);
            else
                v16.cl_disable_ragdolls:int(0, true);
            end;
            if v196.features.fps_boost:get(5) then
                v16.r_eyemove:int(0, true);
                v16.r_eyegloss:int(0, true);
                v16.r_eyeshift_x:int(0, true);
                v16.r_eyeshift_y:int(0, true);
                v16.r_eyeshift_z:int(0, true);
                v16.r_eyesize:int(0, true);
            else
                v16.r_eyemove:int(1, true);
                v16.r_eyegloss:int(1, true);
                v16.r_eyeshift_x:int(1, true);
                v16.r_eyeshift_y:int(1, true);
                v16.r_eyeshift_z:int(1, true);
                v16.r_eyesize:int(1, true);
            end;
            if v196.features.fps_boost:get(6) then
                v16.r_drawbrushmodels:int(0, true);
            else
                v16.r_drawbrushmodels:int(1, true);
            end;
            if v196.features.fps_boost:get(7) then
                v16.r_3dsky:int(0, true);
            else
                v16.r_3dsky:int(1, true);
            end;
            if v196.features.fps_boost:get(8) then
                v16.func_break_max_pieces:int(0, true);
                v16.cl_detail_max_sway:int(0, true);
            else
                v16.func_break_max_pieces:int(15, true);
                v16.cl_detail_max_sway:int(5, true);
            end;
            if v196.features.fps_boost:get(9) then
                v16.joystick:int(0, true);
            else
                v16.joystick:int(1, true);
            end;
            if v196.features.fps_boost:get(10) then
                v16.muzzleflash_light:int(0, true);
            else
                v16.muzzleflash_light:int(1, true);
            end;
            if v196.features.fps_boost:get(11) then
                v16.violence_agibs:int(0, true);
                v16.violence_hblood:int(0, true);
                v16.violence_hgibs:int(0, true);
            else
                v16.violence_agibs:int(1, true);
                v16.violence_hblood:int(1, true);
                v16.violence_hgibs:int(1, true);
            end;
        end, 
        molotov_modulation = function()
            -- upvalues: v13 (ref), v196 (ref)
            for _, v383 in pairs(v13.materials.molotov) do
                local v384 = materials.get(v383);
                v384:var_flag(28, v196.features.molotov_modulation:get() and v196.features.molotov_modulation.options:get("Wireframe"));
                v384:var_flag(15, v196.features.molotov_modulation:get() and v196.features.molotov_modulation.options:get("Visible through walls"));
                v384:var_flag(7, v196.features.molotov_modulation:get() and v196.features.molotov_modulation.options:get("Remove smog"));
            end;
        end, 
        ragdolls = function()
            -- upvalues: v196 (ref), v16 (ref)
            local v385 = v196.features.ragdolls_physics:get();
            local v386 = nil;
            local v387 = nil;
            if v385 == "Cosmonaut" then
                local v388 = -250;
                v387 = 1;
                v386 = v388;
            elseif v385 == "Helium" then
                local v389 = -10000;
                v387 = 1;
                v386 = v389;
            elseif v385 == "Thanos snap" then
                local v390 = 10000;
                v387 = 0;
                v386 = v390;
            elseif v385 == "Moon" then
                local v391 = 20;
                v387 = 1;
                v386 = v391;
            else
                local v392 = 600;
                v387 = 1;
                v386 = v392;
            end;
            v16.cl_ragdoll_gravity:int(v386);
            v16.cl_ragdoll_physics_enable:int(v387);
        end, 
        movement_stabilizier = function(v393)
            -- upvalues: v196 (ref), v12 (ref), v84 (ref)
            local v394 = entity.get_local_player();
            if v394.m_vecVelocity.z < -500 then
                local v395 = v394:get_origin();
                local v396 = utils.trace_line(v395, v395 - vector(0, 0, 50));
                v393.in_duck = utils.trace_line(v395, v395 - vector(0, 0, 15)).fraction ~= 1 and 0 or v396.fraction ~= 1 and 1 or v393.in_duck;
            end;
            if v196.features.jump_shot:get() then
                v12.air_strafe:override(true);
                if v84(v394) < 5 then
                    v12.air_strafe:override(false);
                end;
            else
                v12.air_strafe:override();
            end;
        end, 
        update_names = function()
            -- upvalues: v33 (ref), l_pui_0 (ref), v196 (ref), v13 (ref)
            local v397 = ui.get_style("Link Active");
            local v398 = globals.realtime * 0.75;
            local v399 = v33("Juicy.club", v398, v397:alpha_modulate(255), v397:alpha_modulate(50));
            local v400 = v33(l_pui_0.string("\f<citrus-slice>"), v398, v397:alpha_modulate(255), v397:alpha_modulate(50));
            l_pui_0.sidebar(v399, v400);
            local function v403(v401)
                for _ in pairs(v401) do
                    return false;
                end;
                return true;
            end;
            v196.general.presets.list:visibility(not v403(v13.presets.list));
            v196.general.presets.save_button:visibility(v196.general.presets.name:get() ~= "");
            v196.general.presets.export_button:visibility(v196.general.presets.name:get() ~= "" and not v403(v13.presets.list));
            v196.general.presets.load_button:visibility(not v403(v13.presets.list));
            v196.general.presets.delete_button:visibility(not v403(v13.presets.list));
            local v404 = utils.net_channel();
            local l_is_connected_0 = globals.is_connected;
            if v404 == nil or not l_is_connected_0 then
                v196.features.warmup_setup_button:name(" Join \v&\r Setup ");
                v196.features.warmup_setup_button:tooltip("Press the button for join and apply commands.\n\vFor the settings to apply correctly, keep the menu open until the map is fully loaded.");
                return;
            else
                if v404:get_server_info().address ~= "loopback" then
                    v196.features.warmup_setup_button:name(" Cant setup ");
                    v196.features.warmup_setup_button:tooltip("Cantt setup, because its dont local server.\nBut you can press the button for join and apply commands.\n\vFor the settings to apply correctly, keep the menu open until the map is fully loaded.");
                else
                    v196.features.warmup_setup_button:name(" Setup ");
                    v196.features.warmup_setup_button:tooltip("Press the button for apply commands.");
                end;
                return;
            end;
        end, 
        reset_all_vars = function()
            -- upvalues: v13 (ref), v16 (ref), v17 (ref)
            for _, v407 in pairs(v13.materials.molotov) do
                local v408 = materials.get(v407);
                v408:var_flag(28, false);
                v408:var_flag(15, false);
                v408:var_flag(7, false);
            end;
            v16.cl_ragdoll_gravity:int(600);
            v16.cl_ragdoll_physics_enable:int(1);
            v16.dsp_slow_cpu:int(v17.dsp_slow_cpu, true);
            v16.cl_foot_contact_shadows:int(1, true);
            v16.mat_queue_mode:int(v17.mat_queue_mode, true);
            v16.cl_disable_ragdolls:int(v17.mat_queue_mode, true);
            v16.r_eyemove:int(v17.r_eyemove, true);
            v16.r_eyegloss:int(v17.r_eyegloss, true);
            v16.r_eyeshift_x:int(v17.r_eyeshift_x, true);
            v16.r_eyeshift_y:int(v17.r_eyeshift_y, true);
            v16.r_eyeshift_z:int(v17.r_eyeshift_z, true);
            v16.r_eyesize:int(v17.r_eyesize, true);
            v16.r_drawbrushmodels:int(1, true);
            v16.r_3dsky:int(1, true);
            v16.func_break_max_pieces:int(15, true);
            v16.cl_detail_max_sway:int(v17.cl_detail_max_sway, true);
            v16.joystick:int(v17.joystick, true);
            v16.muzzleflash_light:int(v17.muzzleflash_light, true);
            v16.sv_maxunlag:float(0.2);
            v16.violence_agibs:int(v17.violence_agibs, true);
            v16.violence_hblood:int(v17.violence_hblood, true);
            v16.violence_hgibs:int(v17.violence_hgibs, true);
            v16.cl_fullupdate:call();
        end
    };
end;
v244 = {};
v196.general.presets.list:set_callback(function()
    -- upvalues: v196 (ref), v13 (ref)
    local v409 = v196.general.presets.list:get();
    if v409 then
        local v410 = v13.presets.list[v409];
        if v410 then
            v196.general.presets.name:set(v410);
        else
            v196.general.presets.name:set("");
        end;
    end;
end);
v196.anti_hit.tweaks.geroin.legit_aa:set_callback(function(v411)
    -- upvalues: v17 (ref)
    utils.console_exec("cl_use_opens_buy_menu " .. tonumber(v411:get() and 0 or v17.cl_use_opens_buy_menu));
end);
v196.features.ping_spike:set_callback(v243.ping_spike, true);
v196.features.fps_boost:set_callback(v243.fps_boost, true);
v196.features.ragdolls_physics:set_callback(v243.ragdolls, true);
v196.features.molotov_modulation:set_callback(v243.molotov_modulation, true);
v196.features.molotov_modulation.options:set_callback(v243.molotov_modulation, true);
v196.features.prediction:set_callback(v243.prediction, true);
events.net_update_end:set(v243.predict_uncharge_update);
events.post_update_clientside_animation:set(v243.local_animations);
events.render:set(function()
    -- upvalues: v243 (ref)
    v243.indication();
    v243.aspectratio();
    v243.viewmodel();
    v243.damage_indicator();
    v243.manual_arrows();
    if ui.get_alpha() ~= 1 then
        return;
    else
        v243.update_names();
        return;
    end;
end);
events.createmove:set(function(v412)
    -- upvalues: v243 (ref)
    v243.predict_uncharge();
    v243.anti_hit(v412);
    v243.movement_stabilizier(v412);
    v243.fast_ladder(v412);
end);
events.shutdown:set(function()
    -- upvalues: v243 (ref), v109 (ref), v12 (ref), v136 (ref)
    v243.reset_all_vars();
    v109(v12);
    v136();
end);