local l_pui_0 = require("neverlose/pui");
local l_smoothy_0 = require("neverlose/smoothy");
local l_base64_0 = require("neverlose/base64");
local l_clipboard_0 = require("neverlose/clipboard");
local _ = require("neverlose/inspect");
local _ = require("neverlose/exploits");
local l_mtools_0 = require("neverlose/mtools");
local l_monylinear_0 = require("neverlose/monylinear");
local _ = 15;
local _ = ui.get_alpha() > 0;
lerp = function(v10, v11, v12)
    return v10 + (v11 - v10) * v12;
end;
math.clamp = function(v13, v14, v15)
    if v13 < v14 then
        return v14;
    elseif v15 < v13 then
        return v15;
    else
        return v13;
    end;
end;
smooth = function(v16, v17, v18, v19)
    if not v19 then
        v19 = globals.frametime() or 0.016;
    end;
    v18 = math.clamp(v18 * v19 * 60, 0, 1);
    return v16 + (v17 - v16) * v18;
end;
ffi.cdef("void* __stdcall URLDownloadToFileA(void*, const char*, const char*, int, int);\nbool DeleteUrlCacheEntryA(const char*);\n\ntypedef void*(__thiscall* get_client_entity_t)(void*, int);\ntypedef struct { char pad[20]; int m_nOrder, m_nSequence; float m_flPrevCycle, m_flWeight, m_flWeightDeltaRate, m_flPlaybackRate, m_flCycle; void* m_pOwner; char pad2[4]; } animstate_layer_t;\n\ntypedef int(__fastcall* clantag_t)(const char*, const char*);\ntypedef struct { float x, y, z; } Vector_t;\n\ntypedef struct { char pad[20]; int m_nOrder, m_nSequence; float m_flPrevCycle, m_flWeight, m_flWeightDeltaRate, m_flPlaybackRate, m_flCycle; void* m_pOwner; char pad2[4]; } c_animlayers;\n\ntypedef struct {\n    char pad[0x60]; void* pEntity, *pActiveWeapon, *pLastActiveWeapon; float flLastUpdateTime; int iLastUpdateFrame;\n    float flLastUpdateIncrement, flEyeYaw, flEyePitch, flGoalFeetYaw, flLastFeetYaw, flMoveYaw, flLastMoveYaw;\n    float flLeanAmount, flFeetCycle, flMoveWeight, flMoveWeightSmoothed, flDuckAmount, flHitGroundCycle, flRecrouchWeight;\n    Vector_t vecOrigin, vecLastOrigin, vecVelocity, vecVelocityNormalized, vecVelocityNormalizedNonZero;\n    float flVelocityLenght2D, flJumpFallVelocity, flSpeedNormalized, flRunningSpeed, flDuckingSpeed;\n    float flDurationMoving, flDurationStill, flNextLowerBodyYawUpdateTime, flDurationInAir, flLeftGroundHeight;\n    float flHitGroundWeight, flWalkToRunTransition, flAffectedFraction, flMinBodyYaw, flMaxBodyYaw, flMinPitch, flMaxPitch;\n    int iAnimsetVersion;\n} CCSGOPlayerAnimationState_t;\n");
local _ = ffi.typeof("uintptr_t**");
local v21 = utils.get_vfunc("client.dll", "VClientEntityList003", 3, "void*(__thiscall*)(void*, int)");
local _ = nil;
files.create_folder("nl/stellar");
local v23 = {
    urlmon = ffi.load("UrlMon"), 
    wininet = ffi.load("WinInet")
};
v23.download_file_from_url = function(v24, v25)
    -- upvalues: v23 (ref)
    v23.wininet.DeleteUrlCacheEntryA(v24);
    v23.urlmon.URLDownloadToFileA(nil, v24, v25, 0, 0);
end;
if files.read("nl/stellar/PublicaSans-Regular.ttf") == nil then
    v23.download_file_from_url("https://github.com/ohooma21-collab/stellaring/raw/refs/heads/main/PublicaSans-Regular.ttf", "nl/stellar/PublicaSans-Regular.ttf");
end;
local _ = nil;
local v27 = render.screen_size();
({}).main_panel = {
    x = 0, 
    w = 100, 
    h = 100, 
    y = 0
};
local v28 = 0;
local v29 = nil;
local v30 = state or {};
v30.velocity_pos = v30.velocity_pos or {
    x = 10, 
    w = 220, 
    h = 35, 
    y = 500
};
local v31 = 0;
draggable = function(v32, v33, v34, v35)
    -- upvalues: v31 (ref), v29 (ref)
    if not v33 then
        v33 = {};
    end;
    local v36 = v33.lock_x or false;
    local v37 = v33.lock_y or false;
    local v38 = ui.get_mouse_position();
    local l_x_0 = v38.x;
    local l_y_0 = v38.y;
    local v41 = common.is_button_down(1);
    local v42 = render.screen_size();
    local l_x_1 = v42.x;
    local l_y_1 = v42.y;
    if v33.use_backdrop then
        local v45 = v34 and v41 and 100 or 0;
        v31 = lerp(v31, v45, 0.02);
        if v31 > 1 then
            render.rect(vector(0, 0), vector(l_x_1, l_y_1), color(0, 0, 0, math.floor(v31)));
        end;
    end;
    if not v41 then
        if v34 and v29 == v35 then
            if v35 == "velocity_indicator" then
                for _, v47 in pairs(v32) do
                    db.velocity_pos_y = v47.y;
                end;
            elseif v35 == "damage_indicator" then
                for _, v49 in pairs(v32) do
                    db.damage_pos_x = v49.x;
                    db.damage_pos_y = v49.y;
                end;
            elseif v35 == "crosshair_indicator" then
                for _, v51 in pairs(v32) do
                    db.crosshair_pos_y = v51.y;
                end;
            elseif v35 == "logs_indicator" then
                for _, v53 in pairs(v32) do
                    db.logs_pos_y = v53.y;
                end;
            end;
            v29 = nil;
        end;
        v34 = nil;
        return nil;
    elseif v34 then
        v29 = v35;
        local l_item_0 = v34.item;
        if not v36 then
            l_item_0.x = l_x_0 - v34.offset_x;
        end;
        if not v37 then
            l_item_0.y = l_y_0 - v34.offset_y;
        end;
        if v33.min_x and l_item_0.x < v33.min_x then
            l_item_0.x = v33.min_x;
        end;
        if v33.max_x and l_item_0.x > v33.max_x then
            l_item_0.x = v33.max_x;
        end;
        if v33.min_y and l_item_0.y < v33.min_y then
            l_item_0.y = v33.min_y;
        end;
        if v33.max_y and l_item_0.y > v33.max_y then
            l_item_0.y = v33.max_y;
        end;
        return v34;
    elseif v29 and v29 ~= v35 then
        return nil;
    else
        for _, v56 in pairs(v32) do
            if v56.x <= l_x_0 and l_x_0 <= v56.x + v56.w and v56.y <= l_y_0 and l_y_0 <= v56.y + v56.h then
                v34 = {
                    item = v56, 
                    offset_x = l_x_0 - v56.x, 
                    offset_y = l_y_0 - v56.y
                };
                v29 = v35;
                break;
            end;
        end;
        return v34;
    end;
end;
local v57 = {
    enabled = ui.find("Aimbot", "Anti Aim", "Angles", "Enabled"), 
    pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"), 
    yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"), 
    actions = ui.find("Miscellaneous", "Main", "Other", "Weapon Actions"), 
    yaw_base = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"), 
    offset_y = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"), 
    avoid_backstab = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab"), 
    yaw_modifier = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"), 
    yaw_modifier_offset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"), 
    bodyyaw = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"), 
    bodyyaw_inverter = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"), 
    bodyyaw_left_limit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"), 
    bodyyaw_right_limit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"), 
    hslag = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options"), 
    bodyyaw_options = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"), 
    bodyyaw_freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding"), 
    freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"), 
    freestanding_disable_yaw_modifiers = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Disable Yaw Modifiers"), 
    freestanding_body_freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Body Freestanding"), 
    extended_angles = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles"), 
    extended_angles_pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles", "Extended Pitch"), 
    extended_angles_roll = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles", "Extended Roll"), 
    fake_duck = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"), 
    lag_options = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"), 
    slow_walk = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"), 
    hitbox = ui.find("Aimbot", "Ragebot", "Selection", "Hitboxes"), 
    legs_movement = ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"), 
    leg = ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"), 
    baim = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim"), 
    fov = ui.find("Visuals", "World", "Main", "Field of View"), 
    ovrzoom = ui.find("Visuals", "World", "Main", "Override Zoom"), 
    scope_overlay = ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay"), 
    lag_options = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"), 
    hide_shots_options = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options"), 
    clantag = ui.find("Miscellaneous", "Main", "In-Game", "Clan Tag"), 
    doubletap = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"), 
    dormant_aimbot = ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot"), 
    hide_shots = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"), 
    minimum_damage = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"), 
    body_aim = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim"), 
    safe_points = ui.find("Aimbot", "Ragebot", "Safety", "Safe Points"), 
    fake_latency = ui.find("Miscellaneous", "Main", "Other", "Fake Latency"), 
    weapon_actions = ui.find("Miscellaneous", "Main", "Other", "Weapon Actions"), 
    field_of_view = ui.find("Visuals", "World", "Main", "Field of View"), 
    override_zoom = ui.find("Visuals", "World", "Main", "Override Zoom"), 
    headscale = ui.find("Aimbot", "Ragebot", "Selection", "Multipoint", "Head Scale"), 
    bodyscale = ui.find("Aimbot", "Ragebot", "Selection", "Multipoint", "Body Scale"), 
    rbody = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim"), 
    air_strafe = l_pui_0.find("Miscellaneous", "Main", "Movement", "Air Strafe"), 
    fakelag = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Limit"), 
    yaw_offset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"), 
    hidden_yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden"), 
    hitchance_scout = ui.find("Aimbot", "Ragebot", "Selection", "SSG-08", "Hit Chance"), 
    autostop_scout = ui.find("Aimbot", "Ragebot", "Accuracy", "SSG-08", "Auto Stop", "Options"), 
    filters = ui.find("Miscellaneous", "Main", "Other", "Filters"), 
    hit_chance = ui.find("Aimbot", "Ragebot", "Selection", "Hit Chance"), 
    ssg_hitchance = ui.find("Aimbot", "Ragebot", "Selection", "SSG-08", "Hit Chance"), 
    awp_hitchance = ui.find("Aimbot", "Ragebot", "Selection", "AWP", "Hit Chance"), 
    autosnipers_hitchance = ui.find("Aimbot", "Ragebot", "Selection", "AutoSnipers", "Hit Chance"), 
    revolver_hitchance = ui.find("Aimbot", "Ragebot", "Selection", "R8 Revolver", "Hit Chance"), 
    pistols_hitchance = ui.find("Aimbot", "Ragebot", "Selection", "Pistols", "Hit Chance")
};
local v58 = {
    hitboxes = ui.find("Aimbot", "Ragebot", "Selection", "Hitboxes"), 
    multipoint = {
        head_scale = ui.find("Aimbot", "Ragebot", "Selection", "Multipoint", "Head Scale")
    }, 
    mindamage = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"), 
    autoscope = ui.find("Aimbot", "Ragebot", "Accuracy", "Auto Scope"), 
    doubletap = {
        switch = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"), 
        lag_options = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"), 
        fakelag_limit = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Fake Lag Limit"), 
        immediate_teleport = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Immediate Teleport")
    }, 
    peek_assist = {
        switch = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist"), 
        autostop = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist", "Auto Stop"), 
        retreat_mode = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist", "Retreat Mode"), 
        max_distance = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist", "Max Distance")
    }, 
    body_aim_mode = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim"), 
    thirdperson_switch = ui.find("Visuals", "World", "Main", "Force Thirdperson")
};
local v59 = {
    build = "nightly", 
    online = "soon", 
    username = common.get_username(), 
    state = {
        [1] = "Default", 
        [2] = "Standing", 
        [3] = "Running", 
        [4] = "Walking", 
        [5] = "Crouching", 
        [6] = "Crouching Moving", 
        [7] = "Aerobic", 
        [8] = "Aerobic+"
    }
};
local v60 = {
    first = l_pui_0.create(ui.get_icon("house-chimney"), "   ", 1), 
    two = l_pui_0.create(ui.get_icon("house-chimney"), "  ", 2), 
    three = l_pui_0.create(ui.get_icon("house-chimney"), "\n\n", 1), 
    four = l_pui_0.create(ui.get_icon("house-chimney"), "\n\n\n", 2), 
    mode = l_pui_0.create(ui.get_icon("house-chimney"), " ", 1), 
    five = l_pui_0.create(ui.get_icon("house-chimney"), "\n\n\n\n\n\n\n\n\n", 1), 
    yaw = l_pui_0.create(ui.get_icon("house-chimney"), "\n", 1), 
    modifier = l_pui_0.create(ui.get_icon("house-chimney"), "\n\n\n\n\n", 1), 
    body_yaw = l_pui_0.create(ui.get_icon("house-chimney"), "\n\n\n\n\n\n\n", 1), 
    defensive = l_pui_0.create(ui.get_icon("house-chimney"), "\n\n\n\n\n\n\n\n\n\n\n\n", 1), 
    antiaim_tweaks = l_pui_0.create(ui.get_icon("house-chimney"), "\n\n\n\n\n\n\n\n\n\n", 2), 
    tweaks = l_pui_0.create(ui.get_icon("house-chimney"), "\n\n\n\n\n\n\n\n\n\n\n", 2), 
    render = l_pui_0.create(ui.get_icon("house-chimney"), "Visuals", 1), 
    ragebot = l_pui_0.create(ui.get_icon("house-chimney"), "Ragebot", 1), 
    branded = l_pui_0.create(ui.get_icon("house-chimney"), "Branded", 1), 
    other = l_pui_0.create(ui.get_icon("house-chimney"), "Other", 2)
};
local _ = {
    [1] = "SSG-08", 
    [2] = "AWP", 
    [3] = "Auto snipers", 
    [4] = "Revolver"
};
local v80 = {
    main = {
        categories = v60.two:list("\n", {
            [1] = "\v\f<layer-group>   \rMain", 
            [2] = "\v\f<brackets-curly>   \rAnti-aim angles", 
            [3] = "\v\f<wand-magic-sparkles>   \rMiscellaneous", 
            [4] = "\v\f<folder>    \rConfigs"
        }), 
        username = v60.first:label("Welcome back, \v"), 
        username_button = v60.first:button(" " .. v59.username .. " \v[" .. v59.build .. "] ", function()

        end, true), 
        online = v60.first:label("They're playing now \v"), 
        online_button = v60.first:button(" " .. v59.online .. " ", function()

        end, true), 
        main_text = v60.three:label("  \v\f<gift>   \rStay up to date on all the happenings!"), 
        discord = v60.three:button("         \v\f<discord>  Discord         ", function()
            panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://discord.gg/q4GNGe5g8s");
            cvar.play:call("ui/beepclear");
        end, true), 
        verify = v60.three:button("          \v\f<key>  Verify           ", function()

        end, true)
    }, 
    antiaim = {
        manual = v60.antiaim_tweaks:combo("\a363636FF\226\128\162   \rManual Yaw", {
            [1] = "Disabled", 
            [2] = "Left", 
            [3] = "Right", 
            [4] = "Forward"
        }, false, function(v62)
            return {
                static = v62:switch("Static yaw", false)
            };
        end), 
        freestanding = v60.antiaim_tweaks:switch("\a363636FF\226\128\162   \rFreestanding", false, function(v63)
            return {
                disablers = v63:selectable("Disablers", {
                    [1] = "Standing", 
                    [2] = "Running", 
                    [3] = "Walking", 
                    [4] = "Crouching", 
                    [5] = "Crouching Moving", 
                    [6] = "Aerobic", 
                    [7] = "Aerobic+"
                }), 
                disable_yaw_modifiers = v63:switch("Disable Yaw Modifiers", false), 
                body_freestanding = v63:switch("Body Freestanding", false)
            };
        end), 
        safe_head = v60.tweaks:switch("\a363636FF\226\128\162   \rSafe Head", false, function(v64)
            return {
                state = v64:listable("Current state", {
                    [1] = "Standing", 
                    [2] = "Crouching", 
                    [3] = "Aerobic+", 
                    [4] = "Knife", 
                    [5] = "Zeus"
                })
            }, true;
        end), 
        avoid_backstab = v60.tweaks:switch("\a363636FF\226\128\162   \rAvoid Backstab", false), 
        mode = v60.mode:combo("\a363636FF\226\128\162   \rAnti-aim type", {
            [1] = "Single", 
            [2] = "Teams"
        }), 
        teams = v60.mode:combo("\a363636FF\226\128\162   \rTeams", {
            [1] = "CT", 
            [2] = "T"
        }, function(v65)
            return {
                send_to_another_team = v65:button("     Send to another team      ", function()
                    local v66 = menu.antiaim.teams:get() == "CT" and builder[i].ct or builder[i].t;
                    local v67 = menu.antiaim.teams:get() == "CT" and builder[i].t or builder[i].ct;
                    paste_settings(v67, copy_settings(v66));
                end, true), 
                copy = v65:button("       Copy       ", function()
                    antiaim_vars.copied_settings = copy_settings(builder[i]);
                end, true), 
                paste = v65:button("       Paste       ", function()
                    paste_settings(builder[i], antiaim_vars.copied_settings);
                end, true)
            };
        end), 
        conditions = v60.five:combo("\a363636FF\226\128\162   \rConditions", v59.state)
    }, 
    misc = {
        indicators = v60.render:switch("\a363636FF\226\128\162   \rIndicators", false, function(v68)
            return {
                indicator_type = v68:list("\n", {
                    [1] = "Crosshair", 
                    [2] = "Gamesense", 
                    [3] = "Damage", 
                    [4] = "Velocity"
                }), 
                crosshair_enable = v68:switch("Enable \vCrosshair", false), 
                crosshair_style = v68:list("\n\n", {
                    [1] = "Style:\v Default", 
                    [2] = "Style:\v Modern"
                }), 
                crosshair_color = v68:color_picker("Color", 255, 255, 255), 
                gamesense_enable = v68:switch("Enable \vGamesense", false), 
                gamesense_type = v68:list("\n\n", {
                    [1] = "Default", 
                    [2] = "Modern"
                }), 
                gamesense_binds = v68:selectable("Binds", {
                    [1] = "Dormant", 
                    [2] = "Double tap", 
                    [3] = "Ping spike", 
                    [4] = "On shot anti-aim", 
                    [5] = "Freestanding", 
                    [6] = "Duck peek assist", 
                    [7] = "Minimum damage override", 
                    [8] = "Bomb info", 
                    [9] = "Force safe points", 
                    [10] = "Force body aim", 
                    [11] = "Aimbot stats", 
                    [12] = "Spectators"
                }), 
                damage_enable = v68:switch("Enable \vDamage", false), 
                damage_mode = v68:list("\n\n", {
                    [1] = "Always on", 
                    [2] = "On Hotkey"
                }), 
                damage_font = v68:combo("Font", {
                    [1] = "Default", 
                    [2] = "Pixel"
                }), 
                velocity_enable = v68:switch("Enable \vVelocity", false), 
                velocity_color = v68:color_picker("Color", 255, 255, 255)
            }, true;
        end), 
        animation = v60.render:switch("\a363636FF\226\128\162   \rAnimation", false, function(v69)
            return {
                ground = v69:combo("On ground", {
                    [1] = "Disabled", 
                    [2] = "Reversed", 
                    [3] = "Moonwalk"
                }), 
                air = v69:combo("In air", {
                    [1] = "Disabled", 
                    [2] = "Static", 
                    [3] = "Moonwalk"
                }), 
                addons = v69:selectable("Addons", {
                    [1] = "Move Lean", 
                    [2] = "Smooth"
                }), 
                movelean = v69:slider("Move line", 0, 100, 100, nil, "%")
            }, true;
        end), 
        scope_overlay = v60.render:switch("\a363636FF\226\128\162   \rScope", false, function(v70)
            return {
                scope_position = v70:slider("Position", 0, 500, 160, 1, "%"), 
                scope_offset = v70:slider("Offset", 0, 500, 5), 
                scope_color = v70:color_picker("Color", 255, 255, 255)
            }, true;
        end), 
        aimbot_logs = v60.ragebot:switch("\a363636FF\226\128\162   \rNotifications", false, function(v71)
            return {
                aimbot_type = v71:listable("\n", {
                    [1] = "Console", 
                    [2] = "Screen", 
                    [3] = "Event"
                }), 
                aimbot_event = v71:selectable("\n", {
                    [1] = "Hit", 
                    [2] = "Miss", 
                    [3] = "Hurt"
                }), 
                aimbot_hit = v71:color_picker("Hit color", 255, 255, 255), 
                aimbot_miss = v71:color_picker("Miss color", 255, 255, 255), 
                aimbot_hurt = v71:color_picker("Hurt color", 255, 255, 255)
            }, true;
        end), 
        automatic_peek = v60.ragebot:switch("\a363636FF\226\128\162   \rAutomatic peek", false, function(v72)
            return {
                hitboxes = v72:selectable("Hitboxes", {
                    [1] = "Head", 
                    [2] = "Chest", 
                    [3] = "Stomach", 
                    [4] = "Arms", 
                    [5] = "Legs"
                }), 
                distance = v72:slider("Distance", 0, 50, 20, 1), 
                visualize = v72:switch("Visualize lines"), 
                visualize_type = v72:combo("Type", {
                    [1] = "Lines", 
                    [2] = "Boxes"
                }), 
                visualize_color = v72:color_picker("Visualize color", color(255, 255, 255, 255))
            }, true;
        end), 
        dormant_aimbot = v60.ragebot:switch("\a363636FF\226\128\162   \rDormant aimbot", false, function(v73)
            return {
                hitboxes = v73:selectable("Hitboxes", {
                    [1] = "Head", 
                    [2] = "Chest", 
                    [3] = "Stomach", 
                    [4] = "Arms", 
                    [5] = "Legs"
                }), 
                hitchance = v73:slider("Hitchance", 0, 100, 0, 1), 
                damage = v73:slider("Damage", 0, 100, 0, 1)
            }, true;
        end), 
        hitchance_override = v60.ragebot:switch("\a363636FF\226\128\162   \rHitchance override", false, function(v74)
            return {
                hitchance_type = v74:list("\n", {
                    [1] = "SSG-08", 
                    [2] = "AWP", 
                    [3] = "Auto Snipers", 
                    [4] = "Revolver"
                }), 
                hitchance_enable_scout = v74:switch("Override \v SSG-08", false), 
                hitchance_enable_awp = v74:switch("Override \v AWP", false), 
                hitchance_enable_at = v74:switch("Override \v Auto Snipers", false), 
                hitchance_enable_revolver = v74:switch("Override \v Revolver", false), 
                scout_hitchance_air = v74:slider("Air", 0, 100, 35, 1), 
                scout_hitchance_no_scope = v74:slider("No scope", 0, 100, 35, 1), 
                awp_hitchance_air = v74:slider("Air", 0, 100, 35, 1), 
                awp_hitchance_no_scope = v74:slider("No scope", 0, 100, 35, 1), 
                at_hitchance_air = v74:slider("Air", 0, 100, 35, 1), 
                at_hitchance_no_scope = v74:slider("No scope", 0, 100, 35, 1), 
                revolver_hitchance_air = v74:slider("Air", 0, 100, 35, 1)
            }, true;
        end), 
        grenades = v60.other:switch("\a363636FF\226\128\162   \rGrenades", false, function(v75)
            return {
                grenade_type = v75:list("\n", {
                    [1] = "Super toss", 
                    [2] = "Grenade release"
                }), 
                grenade_super_toss = v75:switch("Enable \vSuper toss", false), 
                grenade_release = v75:switch("Enable \vGrenade release", false), 
                grenade_release_amount = v75:slider("HP Trigger", 0, 50, 25, 1), 
                grenade_release_type_nades = v75:selectable("Disablers", {
                    [1] = "HE Grenade", 
                    [2] = "Smoke", 
                    [3] = "Molotov"
                })
            }, true;
        end), 
        movement = v60.other:switch("\a363636FF\226\128\162   \rMovement", false, function(v76)
            return {
                select = v76:list("\n", {
                    [1] = "Fast Ladder", 
                    [2] = "No Fall Damage", 
                    [3] = "Jump Scout", 
                    [4] = "Edge Stop"
                }), 
                fast_ladder = v76:switch("Enable \vFast Ladder", false), 
                no_fall_damage = v76:switch("Enable \vNo Fall Damage", false), 
                jump_scout = v76:switch("Enable \vJump Scout", false), 
                edge_stop = v76:switch("Enable \vEdge Stop", false)
            }, true;
        end), 
        branded = v60.render:label("\a363636FF\226\128\162   \rBranding", true, function(v77)
            return {
                typing = v77:list("\n", {
                    [1] = "Watermark", 
                    [2] = "Clantag", 
                    [3] = "Shit talking"
                }), 
                clantag = v77:switch("Enable \vClantag", false), 
                shit_talking = v77:switch("Enable \vShit talking", false), 
                shit_talking_type = v77:selectable("Trigger", {
                    [1] = "Kill", 
                    [2] = "Death", 
                    [3] = "Revenge"
                }), 
                watermark_style = v77:list("\n", {
                    [1] = "Style:\v Default", 
                    [2] = "Style:\v Modern"
                }), 
                watermark_default_color = v77:color_picker("Color", 255, 116, 116), 
                watermark_modern_color = v77:color_picker("Color", 160, 196, 255)
            };
        end), 
        aspect_ratio = v60.other:switch("\a363636FF\226\128\162   \rAspect ratio", false, function(v78)
            return {
                aspect_ratio = v78:slider("Value", 50, 200, 133), 
                aspect_ratio_pre = v78:button("16:10", function()

                end, true), 
                aspect_ratio_pre2 = v78:button("16:9", function()

                end, true), 
                aspect_ratio_pre3 = v78:button("5:4", function()

                end, true), 
                aspect_ratio_pre4 = v78:button("4:3", function()

                end, true), 
                aspect_ratio_pre5 = v78:button("3:2", function()

                end, true)
            }, true;
        end), 
        viewmodel = v60.other:switch("\a363636FF\226\128\162   \rViewmodel", false, function(v79)
            return {
                fov = v79:slider("Fov", -1000, 1000, 600, 0.1), 
                x = v79:slider("X", -150, 150, 15, 0.1), 
                y = v79:slider("Y", -150, 150, 15, 0.1), 
                z = v79:slider("Z", -150, 150, -15, 0.1), 
                left_knife = v79:switch("Left knife", false), 
                default = v79:button("        Default        ", function()

                end, true)
            }, true;
        end)
    }, 
    configs = {
        list = v60.three:list("\n", {
            [1] = ""
        }), 
        text = v60.first:input("Enter name", ""), 
        save = v60.three:button("   \f<floppy-disk>   ", function()

        end, true), 
        delete = v60.three:button("   \aff2121FF\f<trash>   ", function()

        end, true), 
        load = v60.three:button("        Load        ", function()

        end, true), 
        export = v60.three:button("   \f<copy>   ", function()

        end, true), 
        import = v60.three:button("   \f<clipboard>   ", function()

        end, true)
    }
};
v80.main.verify:disabled(true);
v80.main.username:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v80.main.categories
});
v80.main.username_button:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v80.main.categories
});
v80.main.online:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v80.main.categories
});
v80.main.online_button:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v80.main.categories
});
v80.main.verify:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v80.main.categories
});
v80.main.discord:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v80.main.categories
});
v80.main.main_text:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v80.main.categories
});
v80.antiaim.conditions:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v80.main.categories
});
v80.antiaim.safe_head:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v80.main.categories
});
v80.antiaim.manual:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v80.main.categories
});
v80.antiaim.freestanding:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v80.main.categories
});
v80.antiaim.avoid_backstab:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v80.main.categories
});
v80.misc.automatic_peek.visualize_type:depend({
    [1] = nil, 
    [2] = true, 
    [1] = v80.misc.automatic_peek.visualize
});
v80.misc.automatic_peek.visualize_color:depend({
    [1] = nil, 
    [2] = true, 
    [1] = v80.misc.automatic_peek.visualize
});
v80.misc.animation.movelean:depend({
    [1] = nil, 
    [2] = "Move Lean", 
    [1] = v80.misc.animation.addons
});
v80.misc.indicators:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v80.main.categories
});
v80.misc.branded:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v80.main.categories
});
v80.misc.aspect_ratio:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v80.main.categories
});
v80.misc.viewmodel:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v80.main.categories
});
v80.misc.dormant_aimbot:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v80.main.categories
});
v80.misc.automatic_peek:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v80.main.categories
});
v80.misc.hitchance_override:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v80.main.categories
});
v80.misc.aimbot_logs:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v80.main.categories
});
v80.misc.animation:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v80.main.categories
});
v80.misc.scope_overlay:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v80.main.categories
});
v80.misc.grenades:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v80.main.categories
});
v80.misc.indicators:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v80.main.categories
});
v80.misc.movement:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v80.main.categories
});
v80.misc.movement.fast_ladder:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v80.misc.movement.select
});
v80.misc.movement.no_fall_damage:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v80.misc.movement.select
});
v80.misc.movement.jump_scout:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v80.misc.movement.select
});
v80.misc.movement.edge_stop:depend({
    [1] = nil, 
    [2] = 4, 
    [1] = v80.misc.movement.select
});
v80.misc.branded.watermark_style:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v80.misc.branded.typing
});
v80.misc.branded.watermark_modern_color:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v80.misc.branded.typing
}, {
    [1] = nil, 
    [2] = 3, 
    [1] = v80.misc.branded.watermark_style
});
v80.misc.branded.watermark_default_color:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v80.misc.branded.typing
});
v80.misc.aimbot_logs.aimbot_event:depend({
    [1] = nil, 
    [2] = nil, 
    [3] = true, 
    [1] = v80.misc.aimbot_logs.aimbot_type, 
    [2] = function()
        -- upvalues: v80 (ref)
        for _, v82 in ipairs(v80.misc.aimbot_logs.aimbot_type:get()) do
            if v82 == 1 or v82 == 2 or v82 == 3 then
                return true;
            end;
        end;
        return false;
    end
});
v80.misc.aimbot_logs.aimbot_hit:depend({
    [1] = nil, 
    [2] = "Hit", 
    [1] = v80.misc.aimbot_logs.aimbot_event
});
v80.misc.aimbot_logs.aimbot_miss:depend({
    [1] = nil, 
    [2] = "Miss", 
    [1] = v80.misc.aimbot_logs.aimbot_event
});
v80.misc.aimbot_logs.aimbot_hurt:depend({
    [1] = nil, 
    [2] = "Hurt", 
    [1] = v80.misc.aimbot_logs.aimbot_event
});
v80.misc.grenades.grenade_super_toss:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v80.misc.grenades.grenade_type
});
v80.misc.grenades.grenade_release:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v80.misc.grenades.grenade_type
});
v80.misc.grenades.grenade_release_amount:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v80.misc.grenades.grenade_type
}, {
    [1] = nil, 
    [2] = true, 
    [1] = v80.misc.grenades.grenade_release
});
v80.misc.grenades.grenade_release_type_nades:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v80.misc.grenades.grenade_type
}, {
    [1] = nil, 
    [2] = true, 
    [1] = v80.misc.grenades.grenade_release
});
v80.misc.indicators.gamesense_enable:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v80.misc.indicators.indicator_type
});
v80.misc.indicators.gamesense_type:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v80.misc.indicators.indicator_type
}, {
    [1] = nil, 
    [2] = true, 
    [1] = v80.misc.indicators.gamesense_enable
});
v80.misc.indicators.gamesense_binds:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v80.misc.indicators.indicator_type
}, {
    [1] = nil, 
    [2] = true, 
    [1] = v80.misc.indicators.gamesense_enable
});
v80.misc.hitchance_override.hitchance_enable_scout:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v80.misc.hitchance_override.hitchance_type
});
v80.misc.hitchance_override.hitchance_enable_awp:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v80.misc.hitchance_override.hitchance_type
});
v80.misc.hitchance_override.hitchance_enable_at:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v80.misc.hitchance_override.hitchance_type
});
v80.misc.hitchance_override.hitchance_enable_revolver:depend({
    [1] = nil, 
    [2] = 4, 
    [1] = v80.misc.hitchance_override.hitchance_type
});
v80.misc.hitchance_override.scout_hitchance_air:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v80.misc.hitchance_override.hitchance_type
}, {
    [1] = nil, 
    [2] = true, 
    [1] = v80.misc.hitchance_override.hitchance_enable_scout
});
v80.misc.hitchance_override.scout_hitchance_no_scope:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v80.misc.hitchance_override.hitchance_type
}, {
    [1] = nil, 
    [2] = true, 
    [1] = v80.misc.hitchance_override.hitchance_enable_scout
});
v80.misc.hitchance_override.awp_hitchance_air:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v80.misc.hitchance_override.hitchance_type
}, {
    [1] = nil, 
    [2] = true, 
    [1] = v80.misc.hitchance_override.hitchance_enable_awp
});
v80.misc.hitchance_override.awp_hitchance_no_scope:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v80.misc.hitchance_override.hitchance_type
}, {
    [1] = nil, 
    [2] = true, 
    [1] = v80.misc.hitchance_override.hitchance_enable_awp
});
v80.misc.hitchance_override.at_hitchance_air:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v80.misc.hitchance_override.hitchance_type
}, {
    [1] = nil, 
    [2] = true, 
    [1] = v80.misc.hitchance_override.hitchance_enable_at
});
v80.misc.hitchance_override.at_hitchance_no_scope:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v80.misc.hitchance_override.hitchance_type
}, {
    [1] = nil, 
    [2] = true, 
    [1] = v80.misc.hitchance_override.hitchance_enable_at
});
v80.misc.hitchance_override.revolver_hitchance_air:depend({
    [1] = nil, 
    [2] = 4, 
    [1] = v80.misc.hitchance_override.hitchance_type
}, {
    [1] = nil, 
    [2] = true, 
    [1] = v80.misc.hitchance_override.hitchance_enable_revolver
});
v80.misc.indicators.crosshair_enable:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v80.misc.indicators.indicator_type
});
v80.misc.indicators.crosshair_color:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v80.misc.indicators.indicator_type
}, {
    [1] = nil, 
    [2] = true, 
    [1] = v80.misc.indicators.crosshair_enable
});
v80.misc.indicators.crosshair_style:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v80.misc.indicators.indicator_type
}, {
    [1] = nil, 
    [2] = true, 
    [1] = v80.misc.indicators.crosshair_enable
});
v80.misc.indicators.damage_enable:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v80.misc.indicators.indicator_type
});
v80.misc.indicators.damage_mode:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v80.misc.indicators.indicator_type
}, {
    [1] = nil, 
    [2] = true, 
    [1] = v80.misc.indicators.damage_enable
});
v80.misc.indicators.damage_font:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v80.misc.indicators.indicator_type
}, {
    [1] = nil, 
    [2] = true, 
    [1] = v80.misc.indicators.damage_enable
});
v80.misc.indicators.velocity_enable:depend({
    [1] = nil, 
    [2] = 4, 
    [1] = v80.misc.indicators.indicator_type
});
v80.misc.indicators.velocity_color:depend({
    [1] = nil, 
    [2] = 4, 
    [1] = v80.misc.indicators.indicator_type
}, {
    [1] = nil, 
    [2] = true, 
    [1] = v80.misc.indicators.velocity_enable
});
v80.misc.branded.clantag:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v80.misc.branded.typing
});
v80.misc.branded.shit_talking:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v80.misc.branded.typing
});
v80.misc.branded.shit_talking_type:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v80.misc.branded.typing
}, {
    [1] = nil, 
    [2] = true, 
    [1] = v80.misc.branded.shit_talking
});
v80.configs.list:depend({
    [1] = nil, 
    [2] = 4, 
    [1] = v80.main.categories
});
v80.configs.text:depend({
    [1] = nil, 
    [2] = 4, 
    [1] = v80.main.categories
});
v80.configs.load:depend({
    [1] = nil, 
    [2] = 4, 
    [1] = v80.main.categories
});
v80.configs.save:depend({
    [1] = nil, 
    [2] = 4, 
    [1] = v80.main.categories
});
v80.configs.delete:depend({
    [1] = nil, 
    [2] = 4, 
    [1] = v80.main.categories
});
v80.configs.export:depend({
    [1] = nil, 
    [2] = 4, 
    [1] = v80.main.categories
});
v80.configs.import:depend({
    [1] = nil, 
    [2] = 4, 
    [1] = v80.main.categories
});
denync_format = function(v83)
    if v83 == 1 then
        return "Jitter";
    elseif v83 == 0 then
        return "Disabled";
    else
        return "";
    end;
end;
defensive_format = function(v84)
    if v84 == 1 then
        return "Setup";
    elseif v84 == 0 then
        return "Disabled";
    else
        return "";
    end;
end;
local v85 = {
    ground_ticks = 1, 
    stateid = 0, 
    end_time = 0, 
    single = {
        body_switch = false, 
        yaw_modifier_offset = 0, 
        yaw_switch = false, 
        yaw_ticks = 0, 
        is_inverted = false, 
        yaw_add = 0, 
        body_ticks = 0
    }, 
    t = {
        body_switch = false, 
        yaw_modifier_offset = 0, 
        yaw_switch = false, 
        yaw_ticks = 0, 
        is_inverted = false, 
        yaw_add = 0, 
        body_ticks = 0
    }, 
    ct = {
        body_switch = false, 
        yaw_modifier_offset = 0, 
        yaw_switch = false, 
        yaw_ticks = 0, 
        is_inverted = false, 
        yaw_add = 0, 
        body_ticks = 0
    }
};
copy_settings = function(v86)
    -- upvalues: l_clipboard_0 (ref), l_base64_0 (ref)
    local v87 = {};
    for v88, v89 in pairs(v86) do
        if type(v89) == "table" and v89.get then
            v87[v88] = v89:get();
        elseif type(v89) == "table" then
            v87[v88] = copy_settings(v89);
        end;
    end;
    l_clipboard_0.set(l_base64_0.encode(json.stringify(v87)));
    cvar.play:call("ui/beepclear");
    return v87;
end;
paste_settings = function(v90, v91)
    if not v91 then
        cvar.play:call("resource/warning.wav");
        return;
    else
        for v92, v93 in pairs(v91) do
            if type(v93) ~= "table" and v90[v92] and v90[v92].set then
                v90[v92]:set(v93);
            elseif type(v93) == "table" and type(v90[v92]) == "table" then
                paste_settings(v90[v92], v93);
            end;
        end;
        cvar.play:call("ui/beepclear");
        return;
    end;
end;
builder = {};
for v94 = 1, #v59.state do
    builder[v94] = {
        enabled = v60.five:switch("\a363636FF\226\128\162   \rOverride \v" .. v59.state[v94], false), 
        single = {
            type = v60.yaw:slider("Yaw", 0, 2, 0, 1, function(v95)
                if v95 == 1 then
                    return "Offset";
                elseif v95 == 2 then
                    return "Left / Right";
                elseif v95 == 0 then
                    return "Disabled";
                else
                    return "";
                end;
            end), 
            offset = v60.yaw:slider("Offset", -90, 90, 0, 1), 
            left = v60.yaw:slider("Left", -90, 90, 0, 1, "\194\176", false, function(v96)
                return {
                    left_randomize_value = v96:slider("Randomize", 0, 100, 0, 1, true, "By adjusting the \v'Randomize'\r slider, you increase randomization.")
                };
            end), 
            right = v60.yaw:slider("Right", -90, 90, 0, 1, "\194\176", false, function(v97)
                return {
                    right_randomize_value = v97:slider("Randomize", 0, 100, 0, 1, true, "By adjusting the \v'Randomize'\r slider, you increase randomization.")
                };
            end), 
            modifier = v60.modifier:slider("Modifier", 0, 3, 0, 1, function(v98)
                if v98 == 1 then
                    return "Offset";
                elseif v98 == 2 then
                    return "Center";
                elseif v98 == 3 then
                    return "Random";
                elseif v98 == 0 then
                    return "Disabled";
                else
                    return "";
                end;
            end), 
            modifier_offset = v60.modifier:slider("Offset", -90, 90, 0, 1, false, function(v99)
                return {
                    modifier_randomize_value = v99:slider("Randomize", 0, 100, 0, 1, true, "By adjusting the \v'Randomize'\r slider, you increase randomization.")
                };
            end), 
            modifier_center = v60.modifier:slider("Center", -90, 90, 0, 1, false, function(v100)
                return {
                    modifier_randomize_value = v100:slider("Randomize", 0, 100, 0, 1, true, "By adjusting the \v'Randomize'\r slider, you increase randomization.")
                };
            end), 
            modifier_random = v60.modifier:slider("Random", -90, 90, 0, 1, false, function(v101)
                return {
                    modifier_randomize_value = v101:slider("Randomize", 0, 100, 0, 1, true, "By adjusting the \v'Randomize'\r slider, you increase randomization.")
                };
            end), 
            body_yaw = v60.body_yaw:slider("Desync", 0, 1, 0, 1, denync_format, function(v102, _)
                local v104 = {
                    body_yaw_left = v102:slider("Left limit", 0, 60, 60, 1, "\194\176"), 
                    body_yaw_right = v102:slider("Right limit", 0, 60, 60, 1, "\194\176"), 
                    body_yaw_delay_type = v102:list("\n", {
                        [1] = "Delay: \vDefault", 
                        [2] = "Delay: \vModern", 
                        [3] = "Delay: \vPhase"
                    }), 
                    body_yaw_delay = v102:slider("Amount", 1, 10, 0, 1, "t"), 
                    body_yaw_delay_random_value = v102:slider("Randomize", 0, 10, 0, 1, "t"), 
                    body_yaw_delay_min = v102:slider("Min", 1, 10, 0, 1, "t"), 
                    body_yaw_delay_max = v102:slider("Max", 1, 10, 0, 1, "t"), 
                    body_yaw_delay_choke = v102:slider("Choke", 0, 14, 0, 1, "t"), 
                    body_yaw_delay_phase = v102:slider("Phase", 0, 8, 0, 1, "")
                };
                local v105 = {};
                for v106 = 1, 8 do
                    local v107 = v102:slider("Phase \v#" .. v106, 1, 10, 0, 1, "t");
                    do
                        local l_v106_0 = v106;
                        v107:depend({
                            [1] = v104.body_yaw_delay_phase, 
                            [2] = function(_)
                                -- upvalues: v104 (ref), l_v106_0 (ref)
                                return v104.body_yaw_delay_phase:get() >= l_v106_0;
                            end
                        }, {
                            [1] = nil, 
                            [2] = 3, 
                            [1] = v104.body_yaw_delay_type
                        });
                        v105[l_v106_0] = v107;
                    end;
                end;
                v104.phase_sliders = v105;
                v104.phase_sliders[0] = {
                    skipsave = true
                };
                return v104;
            end), 
            defensive = v60.defensive:slider("Defensive setup", 0, 1, 0, 1, defensive_format, function(v110)
                return {
                    options = v110:selectable("Options", {
                        [1] = "Double Tap", 
                        [2] = "Hide shots"
                    }), 
                    pitch = v110:combo("Pitch", "Up", "Down", "Zero", "Random", "Customize"), 
                    pitch_value = v110:slider("Pitch Value", -89, 89, 0, 1, "\194\176"), 
                    yaw = v110:combo("Yaw", "Spin", "Random", "Sideways", "Crawling", "Customize"), 
                    yaw_value = v110:slider("Degree", -180, 180, 0, 1, "\194\176"), 
                    yaw_spin = v110:slider("Speed", 0, 10, 0, 1, "\194\176"), 
                    choke_enable = v110:switch("Custom \vChoke"), 
                    choke_random = v110:switch("Randomize Choke"), 
                    choke_amount = v110:slider("From", 0, 22, 0, 1, "t"), 
                    choke_random_value = v110:slider("To", 0, 22, 0, 1, "t")
                };
            end)
        }, 
        t = {
            type = v60.yaw:slider("Yaw", 0, 2, 0, 1, function(v111)
                if v111 == 1 then
                    return "Offset";
                elseif v111 == 2 then
                    return "Left / Right";
                elseif v111 == 0 then
                    return "Disabled";
                else
                    return "";
                end;
            end), 
            offset = v60.yaw:slider("Offset", -90, 90, 0, 1, "\194\176"), 
            left = v60.yaw:slider("Left", -90, 90, 0, 1, "\194\176", false, function(v112)
                return {
                    left_randomize_value = v112:slider("Randomize", 0, 100, 0, 1, true, "By adjusting the \v'Randomize'\r slider, you increase randomization.")
                };
            end), 
            right = v60.yaw:slider("Right", -90, 90, 0, 1, "\194\176", false, function(v113)
                return {
                    right_randomize_value = v113:slider("Randomize", 0, 100, 0, 1, true, "By adjusting the \v'Randomize'\r slider, you increase randomization.")
                };
            end), 
            modifier = v60.modifier:slider("Modifier", 0, 3, 0, 1, function(v114)
                if v114 == 1 then
                    return "Offset";
                elseif v114 == 2 then
                    return "Center";
                elseif v114 == 3 then
                    return "Random";
                elseif v114 == 0 then
                    return "Disabled";
                else
                    return "";
                end;
            end), 
            modifier_offset = v60.modifier:slider("Offset", -90, 90, 0, 1, false, function(v115)
                return {
                    modifier_randomize_value = v115:slider("Randomize", 0, 100, 0, 1, true, "By adjusting the \v'Randomize'\r slider, you increase randomization.")
                };
            end), 
            modifier_center = v60.modifier:slider("Center", -90, 90, 0, 1, false, function(v116)
                return {
                    modifier_randomize_value = v116:slider("Randomize", 0, 100, 0, 1, true, "By adjusting the \v'Randomize'\r slider, you increase randomization.")
                };
            end), 
            modifier_random = v60.modifier:slider("Random", -90, 90, 0, 1, false, function(v117)
                return {
                    modifier_randomize_value = v117:slider("Randomize", 0, 100, 0, 1, true, "By adjusting the \v'Randomize'\r slider, you increase randomization.")
                };
            end), 
            body_yaw = v60.body_yaw:slider("Desync", 0, 3, 0, 1, denync_format, function(v118, _)
                local v120 = {
                    body_yaw_left = v118:slider("Left limit", 0, 60, 60, 1, "\194\176"), 
                    body_yaw_right = v118:slider("Right limit", 0, 60, 60, 1, "\194\176"), 
                    body_yaw_delay_type = v118:list("\n", {
                        [1] = "Delay: \vDefault", 
                        [2] = "Delay: \vModern", 
                        [3] = "Delay: \vPhase"
                    }), 
                    body_yaw_delay = v118:slider("Amount", 1, 10, 0, 1, "t"), 
                    body_yaw_delay_random_value = v118:slider("Randomize", 0, 10, 0, 1, "t"), 
                    body_yaw_delay_min = v118:slider("Min", 1, 10, 0, 1, "t"), 
                    body_yaw_delay_max = v118:slider("Max", 1, 10, 0, 1, "t"), 
                    body_yaw_delay_choke = v118:slider("Choke", 0, 14, 0, 1, "t"), 
                    body_yaw_delay_phase = v118:slider("Phase", 0, 8, 0, 1, "")
                };
                local v121 = {};
                for v122 = 1, 8 do
                    local v123 = v118:slider("Phase \v#" .. v122, 1, 10, 0, 1, "t");
                    do
                        local l_v122_0 = v122;
                        v123:depend({
                            [1] = v120.body_yaw_delay_phase, 
                            [2] = function(_)
                                -- upvalues: v120 (ref), l_v122_0 (ref)
                                return v120.body_yaw_delay_phase:get() >= l_v122_0;
                            end
                        }, {
                            [1] = nil, 
                            [2] = 3, 
                            [1] = v120.body_yaw_delay_type
                        });
                        v121[l_v122_0] = v123;
                    end;
                end;
                v120.phase_sliders = v121;
                v120.phase_sliders[0] = {
                    skipsave = true
                };
                return v120;
            end), 
            defensive = v60.defensive:slider("Defensive setup", 0, 1, 0, 1, defensive_format, function(v126)
                return {
                    options = v126:selectable("Options", {
                        [1] = "Double Tap", 
                        [2] = "Hide shots"
                    }), 
                    pitch = v126:combo("Pitch", "Up", "Down", "Zero", "Random", "Customize"), 
                    pitch_value = v126:slider("Pitch Value", -89, 89, 0, 1, "\194\176"), 
                    yaw = v126:combo("Yaw", "Spin", "Random", "Sideways", "Crawling", "Customize"), 
                    yaw_value = v126:slider("Degree", -180, 180, 0, 1, "\194\176"), 
                    yaw_spin = v126:slider("Speed", 0, 10, 0, 1, "\194\176"), 
                    choke_enable = v126:switch("Custom \vChoke"), 
                    choke_random = v126:switch("Randomize Choke"), 
                    choke_amount = v126:slider("From", 0, 22, 0, 1, "t"), 
                    choke_random_value = v126:slider("To", 0, 22, 0, 1, "t")
                };
            end)
        }, 
        ct = {
            type = v60.yaw:slider("Yaw", 0, 2, 0, 1, function(v127)
                if v127 == 1 then
                    return "Offset";
                elseif v127 == 2 then
                    return "Left / Right";
                elseif v127 == 0 then
                    return "Disabled";
                else
                    return "";
                end;
            end), 
            offset = v60.yaw:slider("Offset", -90, 90, 0, 1), 
            left = v60.yaw:slider("Left", -90, 90, 0, 1, "\194\176", false, function(v128)
                return {
                    left_randomize_value = v128:slider("Randomize", 0, 100, 0, 1, true, "By adjusting the \v'Randomize'\r slider, you increase randomization.")
                };
            end), 
            right = v60.yaw:slider("Right", -90, 90, 0, 1, "\194\176", false, function(v129)
                return {
                    right_randomize_value = v129:slider("Randomize", 0, 100, 0, 1, true, "By adjusting the \v'Randomize'\r slider, you increase randomization.")
                };
            end), 
            modifier = v60.modifier:slider("Modifier", 0, 3, 0, 1, function(v130)
                if v130 == 1 then
                    return "Offset";
                elseif v130 == 2 then
                    return "Center";
                elseif v130 == 3 then
                    return "Random";
                elseif v130 == 0 then
                    return "Disabled";
                else
                    return "";
                end;
            end), 
            modifier_offset = v60.modifier:slider("Offset", -90, 90, 0, 1, false, function(v131)
                return {
                    modifier_randomize_value = v131:slider("Randomize", 0, 100, 0, 1, true, "By adjusting the \v'Randomize'\r slider, you increase randomization.")
                };
            end), 
            modifier_center = v60.modifier:slider("Center", -90, 90, 0, 1, false, function(v132)
                return {
                    modifier_randomize_value = v132:slider("Randomize", 0, 100, 0, 1, true, "By adjusting the \v'Randomize'\r slider, you increase randomization.")
                };
            end), 
            modifier_random = v60.modifier:slider("Random", -90, 90, 0, 1, false, function(v133)
                return {
                    modifier_randomize_value = v133:slider("Randomize", 0, 100, 0, 1, true, "By adjusting the \v'Randomize'\r slider, you increase randomization.")
                };
            end), 
            body_yaw = v60.body_yaw:slider("Desync", 0, 3, 0, 1, denync_format, function(v134, _)
                local v136 = {
                    body_yaw_left = v134:slider("Left limit", 0, 60, 60, 1, "\194\176"), 
                    body_yaw_right = v134:slider("Right limit", 0, 60, 60, 1, "\194\176"), 
                    body_yaw_delay_type = v134:list("\n", {
                        [1] = "Delay: \vDefault", 
                        [2] = "Delay: \vModern", 
                        [3] = "Delay: \vPhase"
                    }), 
                    body_yaw_delay = v134:slider("Amount", 1, 10, 0, 1, "t"), 
                    body_yaw_delay_random_value = v134:slider("Randomize", 0, 10, 0, 1, "t"), 
                    body_yaw_delay_min = v134:slider("Min", 1, 10, 0, 1, "t"), 
                    body_yaw_delay_max = v134:slider("Max", 1, 10, 0, 1, "t"), 
                    body_yaw_delay_choke = v134:slider("Choke", 0, 14, 0, 1, "t"), 
                    body_yaw_delay_phase = v134:slider("Phase", 0, 8, 0, 1, "")
                };
                local v137 = {};
                for v138 = 1, 8 do
                    local v139 = v134:slider("Phase \v#" .. v138, 1, 10, 0, 1, "t");
                    do
                        local l_v138_0 = v138;
                        v139:depend({
                            [1] = v136.body_yaw_delay_phase, 
                            [2] = function(_)
                                -- upvalues: v136 (ref), l_v138_0 (ref)
                                return v136.body_yaw_delay_phase:get() >= l_v138_0;
                            end
                        }, {
                            [1] = nil, 
                            [2] = 3, 
                            [1] = v136.body_yaw_delay_type
                        });
                        v137[l_v138_0] = v139;
                    end;
                end;
                v136.phase_sliders = v137;
                v136.phase_sliders[0] = {
                    skipsave = true
                };
                return v136;
            end), 
            defensive = v60.defensive:slider("Defensive setup", 0, 1, 0, 1, defensive_format, function(v142)
                return {
                    options = v142:selectable("Options", {
                        [1] = "Double Tap", 
                        [2] = "Hide shots"
                    }), 
                    pitch = v142:combo("Pitch", "Up", "Down", "Zero", "Random", "Customize"), 
                    pitch_value = v142:slider("Pitch Value", -89, 89, 0, 1, "\194\176"), 
                    yaw = v142:combo("Yaw", "Spin", "Random", "Sideways", "Crawling", "Customize"), 
                    yaw_value = v142:slider("Degree", -180, 180, 0, 1, "\194\176"), 
                    yaw_spin = v142:slider("Speed", 0, 10, 0, 1, "\194\176"), 
                    choke_enable = v142:switch("Custom \vChoke"), 
                    choke_random = v142:switch("Randomize Choke"), 
                    choke_amount = v142:slider("From", 0, 22, 0, 1, "t"), 
                    choke_random_value = v142:slider("To", 0, 22, 0, 1, "t")
                };
            end)
        }
    };
    local function v146(v143)
        local v144 = v143:get();
        for v145 = 1, #v144 do
            if v144[v145] == "Double Tap" or v144[v145] == "Hide shots" then
                return true;
            end;
        end;
        return false;
    end;
    builder[v94].single.type:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Single", 
        [1] = v80.antiaim.mode
    });
    builder[v94].single.offset:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Single", 
        [1] = v80.antiaim.mode
    }, {
        [1] = nil, 
        [2] = 1, 
        [1] = builder[v94].single.type
    });
    builder[v94].single.left:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Single", 
        [1] = v80.antiaim.mode
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = builder[v94].single.type
    });
    builder[v94].single.right:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Single", 
        [1] = v80.antiaim.mode
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = builder[v94].single.type
    });
    builder[v94].single.modifier:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Single", 
        [1] = v80.antiaim.mode
    });
    builder[v94].single.modifier_offset:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Single", 
        [1] = v80.antiaim.mode
    }, {
        [1] = nil, 
        [2] = 1, 
        [1] = builder[v94].single.modifier
    });
    builder[v94].single.modifier_center:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Single", 
        [1] = v80.antiaim.mode
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = builder[v94].single.modifier
    });
    builder[v94].single.modifier_random:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Single", 
        [1] = v80.antiaim.mode
    }, {
        [1] = nil, 
        [2] = 3, 
        [1] = builder[v94].single.modifier
    });
    builder[v94].single.body_yaw:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Single", 
        [1] = v80.antiaim.mode
    });
    builder[v94].single.body_yaw.body_yaw_left:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Single", 
        [1] = v80.antiaim.mode
    }, {
        [1] = nil, 
        [2] = 1, 
        [1] = builder[v94].single.body_yaw
    });
    builder[v94].single.body_yaw.body_yaw_right:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Single", 
        [1] = v80.antiaim.mode
    }, {
        [1] = nil, 
        [2] = 1, 
        [1] = builder[v94].single.body_yaw
    });
    builder[v94].single.body_yaw.body_yaw_delay_type:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Single", 
        [1] = v80.antiaim.mode
    }, {
        [1] = nil, 
        [2] = 1, 
        [1] = builder[v94].single.body_yaw
    });
    builder[v94].single.body_yaw.body_yaw_delay:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Single", 
        [1] = v80.antiaim.mode
    }, {
        [1] = nil, 
        [2] = 1, 
        [1] = builder[v94].single.body_yaw
    }, {
        [1] = nil, 
        [2] = 1, 
        [1] = builder[v94].single.body_yaw.body_yaw_delay_type
    });
    builder[v94].single.body_yaw.body_yaw_delay_random_value:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Single", 
        [1] = v80.antiaim.mode
    }, {
        [1] = nil, 
        [2] = 1, 
        [1] = builder[v94].single.body_yaw
    }, {
        [1] = nil, 
        [2] = 1, 
        [1] = builder[v94].single.body_yaw.body_yaw_delay_type
    }, {
        [1] = builder[v94].single.body_yaw.body_yaw_delay, 
        [2] = function(v147)
            return v147:get() > 1;
        end
    });
    builder[v94].single.body_yaw.body_yaw_delay_min:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Single", 
        [1] = v80.antiaim.mode
    }, {
        [1] = nil, 
        [2] = 1, 
        [1] = builder[v94].single.body_yaw
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = builder[v94].single.body_yaw.body_yaw_delay_type
    });
    builder[v94].single.body_yaw.body_yaw_delay_max:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Single", 
        [1] = v80.antiaim.mode
    }, {
        [1] = nil, 
        [2] = 1, 
        [1] = builder[v94].single.body_yaw
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = builder[v94].single.body_yaw.body_yaw_delay_type
    });
    builder[v94].single.body_yaw.body_yaw_delay_choke:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Single", 
        [1] = v80.antiaim.mode
    }, {
        [1] = nil, 
        [2] = 1, 
        [1] = builder[v94].single.body_yaw
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = builder[v94].single.body_yaw.body_yaw_delay_type
    });
    builder[v94].single.body_yaw.body_yaw_delay_phase:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Single", 
        [1] = v80.antiaim.mode
    }, {
        [1] = nil, 
        [2] = 1, 
        [1] = builder[v94].single.body_yaw
    }, {
        [1] = nil, 
        [2] = 3, 
        [1] = builder[v94].single.body_yaw.body_yaw_delay_type
    });
    builder[v94].single.defensive:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Single", 
        [1] = v80.antiaim.mode
    });
    builder[v94].single.defensive.pitch:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Single", 
        [1] = v80.antiaim.mode
    }, {
        [1] = nil, 
        [2] = 1, 
        [1] = builder[v94].single.defensive
    }, {
        [1] = builder[v94].single.defensive.options, 
        [2] = v146
    });
    builder[v94].single.defensive.pitch_value:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Single", 
        [1] = v80.antiaim.mode
    }, {
        [1] = nil, 
        [2] = 1, 
        [1] = builder[v94].single.defensive
    }, {
        [1] = nil, 
        [2] = "Customize", 
        [1] = builder[v94].single.defensive.pitch
    }, {
        [1] = builder[v94].single.defensive.options, 
        [2] = v146
    });
    builder[v94].single.defensive.yaw:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Single", 
        [1] = v80.antiaim.mode
    }, {
        [1] = nil, 
        [2] = 1, 
        [1] = builder[v94].single.defensive
    }, {
        [1] = builder[v94].single.defensive.options, 
        [2] = v146
    });
    builder[v94].single.defensive.yaw_value:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Single", 
        [1] = v80.antiaim.mode
    }, {
        [1] = nil, 
        [2] = 1, 
        [1] = builder[v94].single.defensive
    }, {
        [1] = nil, 
        [2] = "Customize", 
        [1] = builder[v94].single.defensive.yaw
    }, {
        [1] = builder[v94].single.defensive.options, 
        [2] = v146
    });
    builder[v94].single.defensive.yaw_spin:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Single", 
        [1] = v80.antiaim.mode
    }, {
        [1] = nil, 
        [2] = 1, 
        [1] = builder[v94].single.defensive
    }, {
        [1] = nil, 
        [2] = "Spin", 
        [1] = builder[v94].single.defensive.yaw
    }, {
        [1] = builder[v94].single.defensive.options, 
        [2] = v146
    });
    builder[v94].single.defensive.options:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Single", 
        [1] = v80.antiaim.mode
    }, {
        [1] = nil, 
        [2] = 1, 
        [1] = builder[v94].single.defensive
    });
    builder[v94].single.defensive.choke_enable:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Single", 
        [1] = v80.antiaim.mode
    }, {
        [1] = nil, 
        [2] = 1, 
        [1] = builder[v94].single.defensive
    }, {
        [1] = builder[v94].single.defensive.options, 
        [2] = v146
    });
    builder[v94].single.defensive.choke_amount:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Single", 
        [1] = v80.antiaim.mode
    }, {
        [1] = nil, 
        [2] = 1, 
        [1] = builder[v94].single.defensive
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].single.defensive.choke_enable
    }, {
        [1] = builder[v94].single.defensive.options, 
        [2] = v146
    });
    builder[v94].single.defensive.choke_random:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Single", 
        [1] = v80.antiaim.mode
    }, {
        [1] = nil, 
        [2] = 1, 
        [1] = builder[v94].single.defensive
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].single.defensive.choke_enable
    }, {
        [1] = builder[v94].single.defensive.options, 
        [2] = v146
    });
    builder[v94].single.defensive.choke_random_value:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Single", 
        [1] = v80.antiaim.mode
    }, {
        [1] = nil, 
        [2] = 1, 
        [1] = builder[v94].single.defensive
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].single.defensive.choke_enable
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].single.defensive.choke_random
    }, {
        [1] = builder[v94].single.defensive.options, 
        [2] = v146
    });
    builder[v94].t.type:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Teams", 
        [1] = v80.antiaim.mode
    }, {
        [1] = nil, 
        [2] = "T", 
        [1] = v80.antiaim.teams
    });
    builder[v94].t.offset:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Teams", 
        [1] = v80.antiaim.mode
    }, {
        [1] = nil, 
        [2] = "T", 
        [1] = v80.antiaim.teams
    }, {
        [1] = nil, 
        [2] = 1, 
        [1] = builder[v94].t.type
    });
    builder[v94].t.left:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Teams", 
        [1] = v80.antiaim.mode
    }, {
        [1] = nil, 
        [2] = "T", 
        [1] = v80.antiaim.teams
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = builder[v94].t.type
    });
    builder[v94].t.right:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Teams", 
        [1] = v80.antiaim.mode
    }, {
        [1] = nil, 
        [2] = "T", 
        [1] = v80.antiaim.teams
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = builder[v94].t.type
    });
    builder[v94].t.modifier:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Teams", 
        [1] = v80.antiaim.mode
    }, {
        [1] = nil, 
        [2] = "T", 
        [1] = v80.antiaim.teams
    });
    builder[v94].t.modifier_offset:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Teams", 
        [1] = v80.antiaim.mode
    }, {
        [1] = nil, 
        [2] = "T", 
        [1] = v80.antiaim.teams
    }, {
        [1] = nil, 
        [2] = 1, 
        [1] = builder[v94].t.modifier
    });
    builder[v94].t.modifier_center:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Teams", 
        [1] = v80.antiaim.mode
    }, {
        [1] = nil, 
        [2] = "T", 
        [1] = v80.antiaim.teams
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = builder[v94].t.modifier
    });
    builder[v94].t.modifier_random:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Teams", 
        [1] = v80.antiaim.mode
    }, {
        [1] = nil, 
        [2] = "T", 
        [1] = v80.antiaim.teams
    }, {
        [1] = nil, 
        [2] = 3, 
        [1] = builder[v94].t.modifier
    });
    builder[v94].t.body_yaw:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Teams", 
        [1] = v80.antiaim.mode
    }, {
        [1] = nil, 
        [2] = "T", 
        [1] = v80.antiaim.teams
    });
    builder[v94].t.body_yaw.body_yaw_left:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Teams", 
        [1] = v80.antiaim.mode
    }, {
        [1] = nil, 
        [2] = "T", 
        [1] = v80.antiaim.teams
    }, {
        [1] = nil, 
        [2] = 1, 
        [1] = builder[v94].t.body_yaw
    });
    builder[v94].t.body_yaw.body_yaw_right:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Teams", 
        [1] = v80.antiaim.mode
    }, {
        [1] = nil, 
        [2] = "T", 
        [1] = v80.antiaim.teams
    }, {
        [1] = nil, 
        [2] = 1, 
        [1] = builder[v94].t.body_yaw
    });
    builder[v94].t.body_yaw.body_yaw_delay_type:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Teams", 
        [1] = v80.antiaim.mode
    }, {
        [1] = nil, 
        [2] = "T", 
        [1] = v80.antiaim.teams
    }, {
        [1] = nil, 
        [2] = 1, 
        [1] = builder[v94].t.body_yaw
    });
    builder[v94].t.body_yaw.body_yaw_delay:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Teams", 
        [1] = v80.antiaim.mode
    }, {
        [1] = nil, 
        [2] = "T", 
        [1] = v80.antiaim.teams
    }, {
        [1] = nil, 
        [2] = 1, 
        [1] = builder[v94].t.body_yaw
    }, {
        [1] = nil, 
        [2] = 1, 
        [1] = builder[v94].t.body_yaw.body_yaw_delay_type
    });
    builder[v94].t.body_yaw.body_yaw_delay_random_value:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Teams", 
        [1] = v80.antiaim.mode
    }, {
        [1] = nil, 
        [2] = "T", 
        [1] = v80.antiaim.teams
    }, {
        [1] = nil, 
        [2] = 1, 
        [1] = builder[v94].t.body_yaw
    }, {
        [1] = nil, 
        [2] = 1, 
        [1] = builder[v94].t.body_yaw.body_yaw_delay_type
    }, {
        [1] = builder[v94].t.body_yaw.body_yaw_delay, 
        [2] = function(v148)
            return v148:get() > 1;
        end
    });
    builder[v94].t.body_yaw.body_yaw_delay_min:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Teams", 
        [1] = v80.antiaim.mode
    }, {
        [1] = nil, 
        [2] = "T", 
        [1] = v80.antiaim.teams
    }, {
        [1] = nil, 
        [2] = 1, 
        [1] = builder[v94].t.body_yaw
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = builder[v94].t.body_yaw.body_yaw_delay_type
    });
    builder[v94].t.body_yaw.body_yaw_delay_max:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Teams", 
        [1] = v80.antiaim.mode
    }, {
        [1] = nil, 
        [2] = "T", 
        [1] = v80.antiaim.teams
    }, {
        [1] = nil, 
        [2] = 1, 
        [1] = builder[v94].t.body_yaw
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = builder[v94].t.body_yaw.body_yaw_delay_type
    });
    builder[v94].t.body_yaw.body_yaw_delay_choke:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Teams", 
        [1] = v80.antiaim.mode
    }, {
        [1] = nil, 
        [2] = "T", 
        [1] = v80.antiaim.teams
    }, {
        [1] = nil, 
        [2] = 1, 
        [1] = builder[v94].t.body_yaw
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = builder[v94].t.body_yaw.body_yaw_delay_type
    });
    builder[v94].t.body_yaw.body_yaw_delay_phase:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Teams", 
        [1] = v80.antiaim.mode
    }, {
        [1] = nil, 
        [2] = "T", 
        [1] = v80.antiaim.teams
    }, {
        [1] = nil, 
        [2] = 1, 
        [1] = builder[v94].t.body_yaw
    }, {
        [1] = nil, 
        [2] = 3, 
        [1] = builder[v94].t.body_yaw.body_yaw_delay_type
    });
    builder[v94].t.defensive:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Teams", 
        [1] = v80.antiaim.mode
    }, {
        [1] = nil, 
        [2] = "T", 
        [1] = v80.antiaim.teams
    });
    builder[v94].t.defensive.pitch:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Teams", 
        [1] = v80.antiaim.mode
    }, {
        [1] = nil, 
        [2] = "T", 
        [1] = v80.antiaim.teams
    }, {
        [1] = nil, 
        [2] = 1, 
        [1] = builder[v94].t.defensive
    }, {
        [1] = builder[v94].t.defensive.options, 
        [2] = v146
    });
    builder[v94].t.defensive.pitch_value:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Teams", 
        [1] = v80.antiaim.mode
    }, {
        [1] = nil, 
        [2] = "T", 
        [1] = v80.antiaim.teams
    }, {
        [1] = nil, 
        [2] = 1, 
        [1] = builder[v94].t.defensive
    }, {
        [1] = nil, 
        [2] = "Customize", 
        [1] = builder[v94].t.defensive.pitch
    }, {
        [1] = builder[v94].t.defensive.options, 
        [2] = v146
    });
    builder[v94].t.defensive.yaw:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Teams", 
        [1] = v80.antiaim.mode
    }, {
        [1] = nil, 
        [2] = "T", 
        [1] = v80.antiaim.teams
    }, {
        [1] = nil, 
        [2] = 1, 
        [1] = builder[v94].t.defensive
    }, {
        [1] = builder[v94].t.defensive.options, 
        [2] = v146
    });
    builder[v94].t.defensive.yaw_value:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Teams", 
        [1] = v80.antiaim.mode
    }, {
        [1] = nil, 
        [2] = "T", 
        [1] = v80.antiaim.teams
    }, {
        [1] = nil, 
        [2] = 1, 
        [1] = builder[v94].t.defensive
    }, {
        [1] = nil, 
        [2] = "Customize", 
        [1] = builder[v94].t.defensive.yaw
    }, {
        [1] = builder[v94].t.defensive.options, 
        [2] = v146
    });
    builder[v94].t.defensive.yaw_spin:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Teams", 
        [1] = v80.antiaim.mode
    }, {
        [1] = nil, 
        [2] = "T", 
        [1] = v80.antiaim.teams
    }, {
        [1] = nil, 
        [2] = 1, 
        [1] = builder[v94].t.defensive
    }, {
        [1] = nil, 
        [2] = "Spin", 
        [1] = builder[v94].t.defensive.yaw
    }, {
        [1] = builder[v94].t.defensive.options, 
        [2] = v146
    });
    builder[v94].t.defensive.options:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Teams", 
        [1] = v80.antiaim.mode
    }, {
        [1] = nil, 
        [2] = "T", 
        [1] = v80.antiaim.teams
    }, {
        [1] = nil, 
        [2] = 1, 
        [1] = builder[v94].t.defensive
    });
    builder[v94].t.defensive.choke_enable:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Teams", 
        [1] = v80.antiaim.mode
    }, {
        [1] = nil, 
        [2] = "T", 
        [1] = v80.antiaim.teams
    }, {
        [1] = nil, 
        [2] = 1, 
        [1] = builder[v94].t.defensive
    }, {
        [1] = builder[v94].t.defensive.options, 
        [2] = v146
    });
    builder[v94].t.defensive.choke_amount:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Teams", 
        [1] = v80.antiaim.mode
    }, {
        [1] = nil, 
        [2] = "T", 
        [1] = v80.antiaim.teams
    }, {
        [1] = nil, 
        [2] = 1, 
        [1] = builder[v94].t.defensive
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].t.defensive.choke_enable
    }, {
        [1] = builder[v94].t.defensive.options, 
        [2] = v146
    });
    builder[v94].t.defensive.choke_random:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Teams", 
        [1] = v80.antiaim.mode
    }, {
        [1] = nil, 
        [2] = "T", 
        [1] = v80.antiaim.teams
    }, {
        [1] = nil, 
        [2] = 1, 
        [1] = builder[v94].t.defensive
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].t.defensive.choke_enable
    }, {
        [1] = builder[v94].t.defensive.options, 
        [2] = v146
    });
    builder[v94].t.defensive.choke_random_value:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Teams", 
        [1] = v80.antiaim.mode
    }, {
        [1] = nil, 
        [2] = "T", 
        [1] = v80.antiaim.teams
    }, {
        [1] = nil, 
        [2] = 1, 
        [1] = builder[v94].t.defensive
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].t.defensive.choke_enable
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].t.defensive.choke_random
    }, {
        [1] = builder[v94].t.defensive.options, 
        [2] = v146
    });
    builder[v94].ct.type:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Teams", 
        [1] = v80.antiaim.mode
    }, {
        [1] = nil, 
        [2] = "CT", 
        [1] = v80.antiaim.teams
    });
    builder[v94].ct.offset:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Teams", 
        [1] = v80.antiaim.mode
    }, {
        [1] = nil, 
        [2] = "CT", 
        [1] = v80.antiaim.teams
    }, {
        [1] = nil, 
        [2] = 1, 
        [1] = builder[v94].ct.type
    });
    builder[v94].ct.left:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Teams", 
        [1] = v80.antiaim.mode
    }, {
        [1] = nil, 
        [2] = "CT", 
        [1] = v80.antiaim.teams
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = builder[v94].ct.type
    });
    builder[v94].ct.right:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Teams", 
        [1] = v80.antiaim.mode
    }, {
        [1] = nil, 
        [2] = "CT", 
        [1] = v80.antiaim.teams
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = builder[v94].ct.type
    });
    builder[v94].ct.modifier:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Teams", 
        [1] = v80.antiaim.mode
    }, {
        [1] = nil, 
        [2] = "CT", 
        [1] = v80.antiaim.teams
    });
    builder[v94].ct.modifier_offset:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Teams", 
        [1] = v80.antiaim.mode
    }, {
        [1] = nil, 
        [2] = "CT", 
        [1] = v80.antiaim.teams
    }, {
        [1] = nil, 
        [2] = 1, 
        [1] = builder[v94].ct.modifier
    });
    builder[v94].ct.modifier_center:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Teams", 
        [1] = v80.antiaim.mode
    }, {
        [1] = nil, 
        [2] = "CT", 
        [1] = v80.antiaim.teams
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = builder[v94].ct.modifier
    });
    builder[v94].ct.modifier_random:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Teams", 
        [1] = v80.antiaim.mode
    }, {
        [1] = nil, 
        [2] = "CT", 
        [1] = v80.antiaim.teams
    }, {
        [1] = nil, 
        [2] = 3, 
        [1] = builder[v94].ct.modifier
    });
    builder[v94].ct.body_yaw:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Teams", 
        [1] = v80.antiaim.mode
    }, {
        [1] = nil, 
        [2] = "CT", 
        [1] = v80.antiaim.teams
    });
    builder[v94].ct.body_yaw.body_yaw_left:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Teams", 
        [1] = v80.antiaim.mode
    }, {
        [1] = nil, 
        [2] = "CT", 
        [1] = v80.antiaim.teams
    }, {
        [1] = nil, 
        [2] = 1, 
        [1] = builder[v94].ct.body_yaw
    });
    builder[v94].ct.body_yaw.body_yaw_right:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Teams", 
        [1] = v80.antiaim.mode
    }, {
        [1] = nil, 
        [2] = "CT", 
        [1] = v80.antiaim.teams
    }, {
        [1] = nil, 
        [2] = 1, 
        [1] = builder[v94].ct.body_yaw
    });
    builder[v94].ct.body_yaw.body_yaw_delay_type:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Teams", 
        [1] = v80.antiaim.mode
    }, {
        [1] = nil, 
        [2] = "CT", 
        [1] = v80.antiaim.teams
    }, {
        [1] = nil, 
        [2] = 1, 
        [1] = builder[v94].ct.body_yaw
    });
    builder[v94].ct.body_yaw.body_yaw_delay:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Teams", 
        [1] = v80.antiaim.mode
    }, {
        [1] = nil, 
        [2] = "CT", 
        [1] = v80.antiaim.teams
    }, {
        [1] = nil, 
        [2] = 1, 
        [1] = builder[v94].ct.body_yaw
    }, {
        [1] = nil, 
        [2] = 1, 
        [1] = builder[v94].ct.body_yaw.body_yaw_delay_type
    });
    builder[v94].ct.body_yaw.body_yaw_delay_random_value:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Teams", 
        [1] = v80.antiaim.mode
    }, {
        [1] = nil, 
        [2] = "CT", 
        [1] = v80.antiaim.teams
    }, {
        [1] = nil, 
        [2] = 1, 
        [1] = builder[v94].ct.body_yaw
    }, {
        [1] = nil, 
        [2] = 1, 
        [1] = builder[v94].ct.body_yaw.body_yaw_delay_type
    }, {
        [1] = builder[v94].ct.body_yaw.body_yaw_delay, 
        [2] = function(v149)
            return v149:get() > 1;
        end
    });
    builder[v94].ct.body_yaw.body_yaw_delay_min:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Teams", 
        [1] = v80.antiaim.mode
    }, {
        [1] = nil, 
        [2] = "CT", 
        [1] = v80.antiaim.teams
    }, {
        [1] = nil, 
        [2] = 1, 
        [1] = builder[v94].ct.body_yaw
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = builder[v94].ct.body_yaw.body_yaw_delay_type
    });
    builder[v94].ct.body_yaw.body_yaw_delay_max:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Teams", 
        [1] = v80.antiaim.mode
    }, {
        [1] = nil, 
        [2] = "CT", 
        [1] = v80.antiaim.teams
    }, {
        [1] = nil, 
        [2] = 1, 
        [1] = builder[v94].ct.body_yaw
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = builder[v94].ct.body_yaw.body_yaw_delay_type
    });
    builder[v94].ct.body_yaw.body_yaw_delay_choke:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Teams", 
        [1] = v80.antiaim.mode
    }, {
        [1] = nil, 
        [2] = "CT", 
        [1] = v80.antiaim.teams
    }, {
        [1] = nil, 
        [2] = 1, 
        [1] = builder[v94].ct.body_yaw
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = builder[v94].ct.body_yaw.body_yaw_delay_type
    });
    builder[v94].ct.body_yaw.body_yaw_delay_phase:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Teams", 
        [1] = v80.antiaim.mode
    }, {
        [1] = nil, 
        [2] = "CT", 
        [1] = v80.antiaim.teams
    }, {
        [1] = nil, 
        [2] = 1, 
        [1] = builder[v94].ct.body_yaw
    }, {
        [1] = nil, 
        [2] = 3, 
        [1] = builder[v94].ct.body_yaw.body_yaw_delay_type
    });
    builder[v94].ct.defensive:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Teams", 
        [1] = v80.antiaim.mode
    }, {
        [1] = nil, 
        [2] = "CT", 
        [1] = v80.antiaim.teams
    });
    builder[v94].ct.defensive.pitch:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Teams", 
        [1] = v80.antiaim.mode
    }, {
        [1] = nil, 
        [2] = "CT", 
        [1] = v80.antiaim.teams
    }, {
        [1] = nil, 
        [2] = 1, 
        [1] = builder[v94].ct.defensive
    }, {
        [1] = builder[v94].ct.defensive.options, 
        [2] = v146
    });
    builder[v94].ct.defensive.pitch_value:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Teams", 
        [1] = v80.antiaim.mode
    }, {
        [1] = nil, 
        [2] = "CT", 
        [1] = v80.antiaim.teams
    }, {
        [1] = nil, 
        [2] = 1, 
        [1] = builder[v94].ct.defensive
    }, {
        [1] = nil, 
        [2] = "Customize", 
        [1] = builder[v94].ct.defensive.pitch
    }, {
        [1] = builder[v94].ct.defensive.options, 
        [2] = v146
    });
    builder[v94].ct.defensive.yaw:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Teams", 
        [1] = v80.antiaim.mode
    }, {
        [1] = nil, 
        [2] = "CT", 
        [1] = v80.antiaim.teams
    }, {
        [1] = nil, 
        [2] = 1, 
        [1] = builder[v94].ct.defensive
    }, {
        [1] = builder[v94].ct.defensive.options, 
        [2] = v146
    });
    builder[v94].ct.defensive.yaw_value:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Teams", 
        [1] = v80.antiaim.mode
    }, {
        [1] = nil, 
        [2] = "CT", 
        [1] = v80.antiaim.teams
    }, {
        [1] = nil, 
        [2] = 1, 
        [1] = builder[v94].ct.defensive
    }, {
        [1] = nil, 
        [2] = "Customize", 
        [1] = builder[v94].ct.defensive.yaw
    }, {
        [1] = builder[v94].ct.defensive.options, 
        [2] = v146
    });
    builder[v94].ct.defensive.yaw_spin:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Teams", 
        [1] = v80.antiaim.mode
    }, {
        [1] = nil, 
        [2] = "CT", 
        [1] = v80.antiaim.teams
    }, {
        [1] = nil, 
        [2] = 1, 
        [1] = builder[v94].ct.defensive
    }, {
        [1] = nil, 
        [2] = "Spin", 
        [1] = builder[v94].ct.defensive.yaw
    }, {
        [1] = builder[v94].ct.defensive.options, 
        [2] = v146
    });
    builder[v94].ct.defensive.options:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Teams", 
        [1] = v80.antiaim.mode
    }, {
        [1] = nil, 
        [2] = "CT", 
        [1] = v80.antiaim.teams
    }, {
        [1] = nil, 
        [2] = 1, 
        [1] = builder[v94].ct.defensive
    });
    builder[v94].ct.defensive.choke_enable:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Teams", 
        [1] = v80.antiaim.mode
    }, {
        [1] = nil, 
        [2] = "CT", 
        [1] = v80.antiaim.teams
    }, {
        [1] = nil, 
        [2] = 1, 
        [1] = builder[v94].ct.defensive
    }, {
        [1] = builder[v94].ct.defensive.options, 
        [2] = v146
    });
    builder[v94].ct.defensive.choke_amount:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Teams", 
        [1] = v80.antiaim.mode
    }, {
        [1] = nil, 
        [2] = "CT", 
        [1] = v80.antiaim.teams
    }, {
        [1] = nil, 
        [2] = 1, 
        [1] = builder[v94].ct.defensive
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].ct.defensive.choke_enable
    }, {
        [1] = builder[v94].ct.defensive.options, 
        [2] = v146
    });
    builder[v94].ct.defensive.choke_random:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Teams", 
        [1] = v80.antiaim.mode
    }, {
        [1] = nil, 
        [2] = "CT", 
        [1] = v80.antiaim.teams
    }, {
        [1] = nil, 
        [2] = 1, 
        [1] = builder[v94].ct.defensive
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].ct.defensive.choke_enable
    }, {
        [1] = builder[v94].ct.defensive.options, 
        [2] = v146
    });
    builder[v94].ct.defensive.choke_random_value:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].enabled
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Teams", 
        [1] = v80.antiaim.mode
    }, {
        [1] = nil, 
        [2] = "CT", 
        [1] = v80.antiaim.teams
    }, {
        [1] = nil, 
        [2] = 1, 
        [1] = builder[v94].ct.defensive
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].ct.defensive.choke_enable
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = builder[v94].ct.defensive.choke_random
    }, {
        [1] = builder[v94].ct.defensive.options, 
        [2] = v146
    });
    builder[v94].enabled:depend({
        [1] = v80.antiaim.conditions, 
        [2] = v59.state[v94]
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    });
    v80.antiaim.mode:depend({
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    });
    v80.antiaim.teams:depend({
        [1] = nil, 
        [2] = 2, 
        [1] = v80.main.categories
    }, {
        [1] = nil, 
        [2] = "Teams", 
        [1] = v80.antiaim.mode
    });
end;
antiaim = function(v150)
    -- upvalues: v85 (ref), v57 (ref), v59 (ref), v80 (ref)
    local v151 = entity.get_local_player();
    if v151 == nil or not v151:is_alive() then
        return;
    else
        in_air = function()
            -- upvalues: v85 (ref)
            if entity.get_local_player() == nil then
                return;
            else
                if bit.band(entity.get_local_player().m_fFlags, 1) == 1 then
                    v85.ground_ticks = v85.ground_ticks + 1;
                else
                    v85.ground_ticks = 0;
                    v85.end_time = globals.curtime + 1;
                end;
                return v85.ground_ticks > 1 and v85.end_time > globals.curtime;
            end;
        end;
        get_player_state = function(_)
            -- upvalues: v85 (ref), v57 (ref)
            in_air();
            local v153 = bit.band(entity.get_local_player().m_fFlags, bit.lshift(1, 0)) ~= 0;
            local v154 = v85.end_time > globals.curtime + 0.9;
            local v155 = v57.slow_walk:get();
            local v156 = bit.band(entity.get_local_player().m_fFlags, bit.lshift(1, 1)) ~= 0 or v57.fake_duck:get();
            local l_x_2 = entity.get_local_player().m_vecVelocity.x;
            local l_y_2 = entity.get_local_player().m_vecVelocity.y;
            local v159 = math.sqrt(l_x_2 ^ 2 + l_y_2 ^ 2) > 5;
            if v153 and not v159 and not v156 then
                return "Standing";
            elseif not v154 and not v156 and not v155 then
                return "Running";
            elseif v155 and v153 then
                return "Walking";
            elseif v156 and not v159 and not v154 and v153 then
                return "Crouching";
            elseif v156 and v159 and not v154 and v153 then
                return "Crouching Moving";
            elseif v154 and not v156 then
                return "Aerobic";
            elseif v156 and (v154 or not v153) then
                return "Aerobic+";
            else
                return "Default";
            end;
        end;
        local v160 = get_player_state(v150);
        v85.stateid = 1;
        for v161 = 1, #v59.state do
            if builder[v161].enabled:get() and v59.state[v161] == v160 then
                v85.stateid = v161;
                break;
            end;
        end;
        local l_m_iTeamNum_0 = v151.m_iTeamNum;
        local v163 = v80.antiaim.mode:get();
        local v164 = nil;
        if v163 == "Single" then
            v164 = builder[v85.stateid].single;
        elseif v163 == "Teams" then
            if l_m_iTeamNum_0 == 2 then
                v164 = builder[v85.stateid].t;
            elseif l_m_iTeamNum_0 == 3 then
                v164 = builder[v85.stateid].ct;
            else
                v164 = builder[v85.stateid].single;
            end;
        end;
        if v80.antiaim.manual:get() == "Forward" then
            v57.yaw_base:override("Local View");
            v57.offset_y:override(180);
        elseif v80.antiaim.manual:get() == "Left" then
            v57.yaw_base:override("Local View");
            v57.offset_y:override(-90);
        elseif v80.antiaim.manual:get() == "Right" then
            v57.yaw_base:override("Local View");
            v57.offset_y:override(90);
        end;
        if v150.choked_commands == 0 then
            v57.pitch:override("Down");
            v57.yaw:override("Backward");
            v57.yaw_base:override("At Target");
            v57.freestanding:override(v80.antiaim.freestanding:get());
            v57.freestanding_body_freestanding:override(v80.antiaim.freestanding.body_freestanding:get());
            v57.freestanding_disable_yaw_modifiers:override(v80.antiaim.freestanding.disable_yaw_modifiers:get());
            v57.avoid_backstab:override(v80.antiaim.avoid_backstab:get());
            local v165 = v163 == "Single" and v85.single or l_m_iTeamNum_0 == 2 and v85.t or v85.ct;
            v165.is_inverted = not rage.antiaim:inverter();
            local v166 = 1;
            if v164.body_yaw:get() > 0 then
                local v167 = v164.body_yaw.body_yaw_delay_type:get();
                if v167 == 1 then
                    local v168 = v164.body_yaw.body_yaw_delay:get();
                    local v169 = v164.body_yaw.body_yaw_delay_random_value:get();
                    if v169 > 0 and v168 > 1 then
                        local v170 = v168 - v169 / 100 * v168;
                        local v171 = v168 + v169 / 100 * v168;
                        v166 = math.floor(math.random(v170, v171) + 0.5);
                    else
                        v166 = v168;
                    end;
                    if v166 <= v165.body_ticks then
                        v165.body_ticks = 0;
                    else
                        v165.body_ticks = v165.body_ticks + 1;
                    end;
                elseif v167 == 2 then
                    local v172 = v164.body_yaw.body_yaw_delay_min:get();
                    local v173 = v164.body_yaw.body_yaw_delay_max:get();
                    if v173 < v172 then
                        local l_v173_0 = v173;
                        v173 = v172;
                        v172 = l_v173_0;
                    end;
                    local v175 = v172 < v173;
                    v166 = not v175 and v172 == 0 and 1 or v175 and math.random(v172, v173) or v172;
                    if v164.body_yaw.body_yaw_delay_choke:get() > 0 then
                        choke_value = v175 and math.random(v172, v173) or v172;
                    end;
                elseif v167 == 3 then
                    local v176 = v164.body_yaw.body_yaw_delay_phase:get();
                    if v176 > 0 then
                        local v177 = globals.tickcount % v176 + 1;
                        if v177 <= 8 and v164.body_yaw.phase_sliders[v177] then
                            v166 = v164.body_yaw.phase_sliders[v177]:get();
                        else
                            v166 = 1;
                        end;
                    else
                        v166 = 1;
                    end;
                end;
            end;
            if v164.body_yaw:get() == 1 and v166 > 1 then
                v165.yaw_ticks = v165.yaw_ticks + 1;
                if v166 <= v165.yaw_ticks then
                    v165.yaw_ticks = 0;
                    v165.yaw_switch = not v165.yaw_switch;
                end;
                v165.is_inverted = v165.yaw_switch;
            end;
            if v164.body_yaw:get() > 0 then
                v57.bodyyaw:override(true);
                if v164.body_yaw:get() == 1 then
                    if v166 > 1 then
                        v57.bodyyaw_inverter:override(v165.is_inverted);
                        v57.bodyyaw_options:override("");
                    else
                        v57.bodyyaw_inverter:override();
                        v57.bodyyaw_options:override("Jitter");
                    end;
                end;
                v57.bodyyaw_freestanding:override("Off");
                v57.bodyyaw_left_limit:override();
                v57.bodyyaw_right_limit:override();
            else
                v57.bodyyaw:override(false);
                v57.bodyyaw_options:override();
                v57.bodyyaw_inverter:override();
                v57.bodyyaw_freestanding:override();
                v57.bodyyaw_left_limit:override();
                v57.bodyyaw_right_limit:override();
            end;
            if v164.type:get() == 1 then
                v165.yaw_add = v164.offset:get();
            elseif v164.type:get() == 2 then
                local v178 = v164.left:get();
                local v179 = v164.right:get();
                local l_left_randomize_value_0 = v164.left.left_randomize_value;
                local l_right_randomize_value_0 = v164.right.right_randomize_value;
                if l_left_randomize_value_0 then
                    local v182 = l_left_randomize_value_0:get();
                    if v182 > 0 then
                        local v183 = v182 / 100 * v178;
                        v178 = math.random(v178 - v183, v178);
                    end;
                end;
                if l_right_randomize_value_0 then
                    local v184 = l_right_randomize_value_0:get();
                    if v184 > 0 then
                        local v185 = v184 / 100 * v179;
                        v179 = math.random(v179 - v185, v179);
                    end;
                end;
                local v186;
                if not v165.is_inverted or not v178 then
                    v186 = v179;
                else
                    v186 = v178;
                end;
                v165.yaw_add = v186;
            else
                v165.yaw_add = 0;
            end;
            if v164.modifier:get() ~= 0 then
                local v187 = 0;
                local v188 = v164.modifier:get();
                if v188 == 1 then
                    v187 = v164.modifier_offset:get();
                    local l_modifier_randomize_value_0 = v164.modifier_offset.modifier_randomize_value;
                    if l_modifier_randomize_value_0 then
                        l_modifier_randomize_value_0 = l_modifier_randomize_value_0:get();
                        if l_modifier_randomize_value_0 > 0 then
                            v187 = v187 + math.random(-l_modifier_randomize_value_0 / 100 * v187, l_modifier_randomize_value_0 / 100 * v187);
                        end;
                    end;
                elseif v188 == 2 then
                    v187 = v164.modifier_center:get();
                    local l_modifier_randomize_value_1 = v164.modifier_center.modifier_randomize_value;
                    if l_modifier_randomize_value_1 then
                        l_modifier_randomize_value_1 = l_modifier_randomize_value_1:get();
                        if l_modifier_randomize_value_1 > 0 then
                            v187 = v187 + math.random(-l_modifier_randomize_value_1 / 100 * v187, l_modifier_randomize_value_1 / 100 * v187);
                        end;
                    end;
                elseif v188 == 3 then
                    v187 = v164.modifier_random:get();
                    local l_modifier_randomize_value_2 = v164.modifier_random.modifier_randomize_value;
                    if l_modifier_randomize_value_2 then
                        l_modifier_randomize_value_2 = l_modifier_randomize_value_2:get();
                        if l_modifier_randomize_value_2 > 0 then
                            v187 = v187 + math.random(-l_modifier_randomize_value_2 / 100 * v187, l_modifier_randomize_value_2 / 100 * v187);
                        end;
                    end;
                end;
                if v165.is_inverted then
                    v165.yaw_add = v165.yaw_add + v187 * 0.5;
                else
                    v165.yaw_add = v165.yaw_add - v187 * 0.5;
                end;
                v57.yaw_modifier:override("Disabled");
                v57.yaw_modifier_offset:override(0);
            else
                v57.yaw_modifier:override();
                v57.yaw_modifier_offset:override();
            end;
            v57.yaw_offset:override(v165.yaw_add);
        end;
        local v192 = v151:get_player_weapon();
        if v192 == nil then
            return;
        else
            local v193 = v192:get_classname();
            if v193 == nil then
                return;
            else
                local v194 = false;
                if v80.antiaim.safe_head:get() then
                    local function v195()
                        -- upvalues: v57 (ref)
                        v57.pitch:override("Down");
                        v57.offset_y:override(0);
                        v57.yaw_modifier:override("Disabled");
                        v57.yaw_modifier_offset:override(0);
                        v57.bodyyaw:override(true);
                        v57.bodyyaw_options:override("");
                        v57.bodyyaw_left_limit:override(0);
                        v57.bodyyaw_right_limit:override(0);
                        v57.bodyyaw_freestanding:override("Off");
                        v57.hidden_yaw:override(false);
                    end;
                    local v196 = {
                        [1] = v80.antiaim.safe_head.state:get(4) and v193 == "CKnife" and v160 == "Aerobic+", 
                        [2] = v80.antiaim.safe_head.state:get(5) and v193 == "CWeaponTaser" and v160 == "Aerobic+", 
                        [3] = v80.antiaim.safe_head.state:get(1) and v160 == "Standing", 
                        [4] = v80.antiaim.safe_head.state:get(2) and v160 == "Crouching", 
                        [5] = v80.antiaim.safe_head.state:get(3) and v160 == "Aerobic+"
                    };
                    if v196[1] or v196[2] or v196[3] or v196[4] or v196[5] then
                        v195();
                        v57.hidden_yaw:set(false);
                        v194 = true;
                    end;
                end;
                local v197 = nil;
                if v163 == "Single" then
                    v197 = builder[v85.stateid].single;
                elseif v163 == "Teams" then
                    if l_m_iTeamNum_0 == 2 then
                        v197 = builder[v85.stateid].t;
                    elseif l_m_iTeamNum_0 == 3 then
                        v197 = builder[v85.stateid].ct;
                    else
                        v197 = builder[v85.stateid].single;
                    end;
                end;
                local l_defensive_0 = v197.defensive;
                local v199 = l_defensive_0.options:get("Hide shots");
                local v200 = l_defensive_0.options:get("Double tap");
                if l_defensive_0:get() == 1 and (v199 or v200) or v199 or v200 then
                    v57.hidden_yaw:override(true);
                    if l_defensive_0:get() == 1 and l_defensive_0.choke_enable:get() and (v199 or v200) then
                        local v201 = l_defensive_0.choke_amount:get();
                        if l_defensive_0.choke_random:get() then
                            local v202 = math.min(v201, l_defensive_0.choke_random_value:get());
                            local v203 = math.max(v201, l_defensive_0.choke_random_value:get());
                            v201 = utils.random_int(v202, v203);
                        end;
                        v150.force_defensive = v150.command_number % v201 == 0;
                    else
                        v150.force_defensive = false;
                    end;
                else
                    v57.hidden_yaw:override(false);
                    v150.force_defensive = false;
                end;
                if v199 then
                    v57.hide_shots_options:override("Break LC");
                    v57.hidden_yaw:override(true);
                else
                    v57.hide_shots_options:override();
                end;
                if v200 then
                    v57.lag_options:override("Always On");
                    v57.hidden_yaw:override(true);
                else
                    v57.lag_options:override();
                end;
                local v204 = l_defensive_0.pitch:get();
                local v205 = nil;
                if v204 == "Up" then
                    v205 = -89;
                elseif v204 == "Down" then
                    v205 = 89;
                elseif v204 == "Zero" then
                    v205 = 0;
                elseif v204 == "Random" then
                    v205 = utils.random_int(-89, 89);
                else
                    v205 = l_defensive_0.pitch_value:get();
                end;
                rage.antiaim:override_hidden_pitch(v205);
                local v206 = l_defensive_0.yaw:get();
                local v207 = nil;
                if v206 == "Sideways" then
                    v207 = rage.antiaim:inverter() and -90 or 90;
                elseif v206 == "Spin" then
                    v207 = globals.curtime * l_defensive_0.yaw_spin:get() * 2 % 360;
                elseif v206 == "Random" then
                    v207 = utils.random_int(-180, 180);
                elseif v206 == "Crawling" then
                    v207 = not rage.antiaim:inverter() and globals.tickcount % 20 < 10 and 120 or -120;
                else
                    v207 = l_defensive_0.yaw_value:get();
                end;
                rage.antiaim:override_hidden_yaw_offset(v207);
                return;
            end;
        end;
    end;
end;
watermark = function()
    -- upvalues: v80 (ref), v27 (ref), v59 (ref)
    if v80.misc.branded.watermark_style:get() == 1 then
        local v208 = "stellar.nightly";
        local v209 = 1;
        local v210 = render.measure_text(v209, nil, v208);
        local v211 = vector(v27.x / 2 - v210.x / 2, v27.y - v210.y - 10);
        render.text(v209, v211, v80.misc.branded.watermark_default_color:get(), nil, v208);
    elseif v80.misc.branded.watermark_style:get() == 2 then
        local v212 = "stellar nightly / ";
        local v213 = v59.username or "";
        local v214 = 4;
        local v215 = render.measure_text(v214, nil, v212);
        local v216 = vector(10, v27.y / 2 - v215.y / 2);
        render.text(v214, v216, v80.misc.branded.watermark_modern_color:get(), nil, v212);
        local v217 = vector(v216.x + v215.x, v216.y);
        render.text(v214, v217, color(255, 255, 255, 255), nil, v213);
    end;
end;
get_bind = function(v218)
    local v219 = false;
    local v220 = 0;
    local v221 = ui.get_binds();
    for v222 = 1, #v221 do
        if v221[v222].name == v218 and v221[v222].active then
            v219 = true;
            v220 = v221[v222].value;
        end;
    end;
    return {
        [1] = v219, 
        [2] = v220
    };
end;
local v223 = {
    last_frame_time = 0, 
    lerp_speed = 0.2, 
    fade_speed = 0.1, 
    limit_lines_alpha = 0, 
    limit_lines_alpha_velocity = 0, 
    crosshair_pos_initialized = false, 
    was_active = false, 
    max_cache_size = 50, 
    texture_update_cooldown = 0.15, 
    last_texture_update_time = 0, 
    current_exploit_charge = 0, 
    current_slowdown = 0, 
    indicators_state = {
        DT = {
            x = 0, 
            e = false, 
            a = 0, 
            y = 0
        }, 
        HS = {
            x = 0, 
            e = false, 
            a = 0, 
            y = 0
        }, 
        FA = {
            x = 0, 
            e = false, 
            a = 0, 
            y = 0
        }, 
        BODY = {
            x = 0, 
            e = false, 
            a = 0, 
            y = 0
        }, 
        SAFE = {
            x = 0, 
            e = false, 
            a = 0, 
            y = 0
        }, 
        FS = {
            x = 0, 
            e = false, 
            a = 0, 
            y = 0
        }
    }, 
    title_state = {
        x = 0, 
        animated_h = 0
    }, 
    indicator_panel = {
        x = 0, 
        w = 0, 
        h = 0, 
        y = 0
    }, 
    velocity_pos = {
        h = 30, 
        w = 150
    }, 
    mi = {
        lerp_speed = 0.05, 
        fade_speed = 0.1, 
        lerped_dmg_value = 0, 
        lerped_alpha = 0, 
        damage_pos_initialized = false, 
        damage_pos = {
            x = 0, 
            w = 30, 
            h = 15, 
            y = 0
        }, 
        boundary_box = {
            x = 0, 
            w = 130, 
            h = 130, 
            y = 0
        }
    }, 
    texture_cache = {}, 
    cache_keys = {}
};
local v224 = "<svg width=\"800px\" height=\"800px\" viewBox=\"0 0 24 24\" fill=\"none\" xmlns=\"http://www.w3.org/2000/svg\">\n  <path fill-rule=\"evenodd\" clip-rule=\"evenodd\" d=\"M13.0618 4.4295C12.6211 3.54786 11.3635 3.54786 10.9228 4.4295L3.88996 18.5006C3.49244 19.2959 4.07057 20.2317 4.95945 20.2317H19.0252C19.914 20.2317 20.4922 19.2959 20.0947 18.5006L13.0618 4.4295ZM9.34184 3.6387C10.4339 1.45376 13.5507 1.45377 14.6428 3.63871L21.6756 17.7098C22.6608 19.6809 21.228 22 19.0252 22H4.95945C2.75657 22 1.32382 19.6809 2.30898 17.7098L9.34184 3.6387Z\" fill=\"%s\"/>\n  <path d=\"M12 8V13\" stroke=\"%s\" stroke-width=\"1.7\" stroke-linecap=\"round\"/>\n  <path d=\"M12 16L12 16.5\" stroke=\"%s\" stroke-width=\"1.7\" stroke-linecap=\"round\"/>\n</svg>\n";
local v225 = nil;
local v226 = velocity_pos or {
    h = 37, 
    w = 133
};
local v227 = limit_lines_alpha_velocity or 0;
local v228 = {};
local v229 = {};
local v230 = 10;
local v231 = 0.15;
local v232 = 3;
if not v226 then
    v226 = {};
end;
local v233 = render.screen_size();
v226.w = 150;
v226.h = 30;
v226.x = v233.x / 2 - v226.w / 2;
v226.y = db.velocity_pos_y or v233.y / 2 - 100;
rgb_to_hex = function(v234)
    if not v234 then
        return "#FFFFFF";
    else
        local v235 = math.floor(math.max(0, math.min(255, v234.r or 0)));
        local v236 = math.floor(math.max(0, math.min(255, v234.g or 0)));
        local v237 = math.floor(math.max(0, math.min(255, v234.b or 0)));
        return string.format("#%02X%02X%02X", v235, v236, v237);
    end;
end;
manage_cache = function(v238)
    -- upvalues: v229 (ref), v230 (ref), v223 (ref)
    table.insert(v229, v238);
    if #v229 > v230 then
        local v239 = table.remove(v229, 1);
        v223.texture_cache[v239] = nil;
    end;
end;
velocity = function()
    -- upvalues: v80 (ref), v225 (ref), v226 (ref), v227 (ref), v233 (ref), v31 (ref), v228 (ref), v231 (ref), v224 (ref)
    local v240 = entity.get_local_player();
    if not v240 or not v240:is_alive() then
        return;
    else
        local v241 = v240.m_flVelocityModifier or 1;
        local v242 = v241 < 1 or math.abs(v241 - (last_slowdown or 1)) > 0.01;
        last_slowdown = v241;
        local v243 = v80.misc.indicators:get();
        local v244 = v80.misc.indicators.velocity_enable:get();
        local v245 = ui.get_alpha() > 0;
        if not v243 or not v244 then
            target_alpha = 0;
        elseif v245 then
            target_alpha = 255;
        else
            target_alpha = v242 and 255 or 0;
        end;
        current_alpha = lerp(current_alpha or 0, target_alpha, math.min(1, (globals.curtime - (last_frame_time or 0)) * 10));
        if current_alpha < 1 then
            return;
        else
            current_slowdown = current_slowdown or v241;
            local v246 = string.format("%d%%", math.floor(current_slowdown * 100 + 0.5));
            local l_curtime_0 = globals.curtime;
            current_slowdown = lerp(current_slowdown, v241, math.min(1, (l_curtime_0 - (last_frame_time or 0)) * 10));
            last_frame_time = l_curtime_0;
            if not v240:is_alive() then
                target_alpha = 0;
            end;
            v225 = draggable({
                [1] = v226
            }, {
                lock_x = true, 
                use_backdrop = true
            }, v225, "velocity_indicator");
            if v225 then
                v226.y = v225.item.y;
            end;
            local l_x_3 = v226.x;
            local l_y_3 = v226.y;
            local l_w_0 = v226.w;
            local l_h_0 = v226.h;
            local v252 = common.is_button_down(1);
            local v253 = v225 and v252;
            local v254 = v253 and 255 or 0;
            v227 = lerp(v227, v254, 0.02);
            if v227 > 1 and (v245 or v253) then
                local v255 = color(128, 128, 128, math.floor(v227));
                local v256 = l_x_3 + l_w_0 / 2;
                render.line(vector(v256, 0), vector(v256, v233.y), v255);
            end;
            if v31 and v31 > 1 then
                render.rect(vector(0, 0), vector(v233.x, v233.y), color(0, 0, 0, math.floor(v31)));
            end;
            local v257 = v80.misc.indicators.velocity_color:get();
            local v258 = (not (last_bar_color_obj and last_bar_color_obj.r == v257.r and last_bar_color_obj.g == v257.g) or last_bar_color_obj.b ~= v257.b) and rgb_to_hex(v257) or last_color;
            last_bar_color_obj = v257;
            last_color = v258;
            if not v228[v258] and l_curtime_0 - (last_texture_update_time or 0) >= v231 then
                local v259 = string.format(v224, v258, v258, v258);
                local v260 = render.load_image(v259, vector(19, 19));
                if v260 then
                    v228[v258] = v260;
                    manage_cache(v258);
                    last_texture_update_time = l_curtime_0;
                end;
            end;
            icon = v228[v258] or icon;
            render.rect(vector(l_x_3, l_y_3), vector(l_x_3 + l_w_0, l_y_3 + l_h_0), color(25, 25, 25, 200 * current_alpha / 255), 8);
            local v261 = 19;
            local v262 = l_x_3 + 6;
            local v263 = l_y_3 + l_h_0 / 2 - v261 / 2;
            if icon then
                render.texture(icon, vector(v262 + 1.5, v263), vector(v261, v261), color(255, 255, 255, current_alpha));
            end;
            local v264 = v262 + v261 + 8;
            local v265 = l_y_3 + 9;
            render.text(1, vector(v264 + 77, v265 - 4.5), color(255, 255, 255, 220 * current_alpha / 255), nil, v246);
            local v266 = "slowed";
            local v267 = render.measure_text(1, nil, v266);
            render.text(1, vector(l_x_3 + l_w_0 - v267.x - 68, v265 - 4.5), color(255, 255, 255, 220 * current_alpha / 255), nil, v266);
            render.rect(vector(v264, l_y_3 + 6), vector(v264 + 1, l_y_3 + l_h_0 - 6), color(100, 100, 100, 180 * current_alpha / 255), 1);
            local v268 = (l_w_0 - 18) * 0.66;
            local v269 = 4;
            local v270 = 1;
            local v271 = l_x_3 + (l_w_0 - v268) / 2 + 17.5;
            local v272 = l_y_3 + l_h_0 / 2 + 2;
            render.rect(vector(v271, v272), vector(v271 + v268, v272 + v269), color(60, 60, 60, 255 * current_alpha / 255), v270);
            render.rect(vector(v271, v272), vector(v271 + v268 * current_slowdown, v272 + v269), color(v257.r, v257.g, v257.b, current_alpha), v270);
            return;
        end;
    end;
end;
crosshair = function()
    -- upvalues: v80 (ref), v57 (ref), v223 (ref), v29 (ref)
    local v273 = entity.get_local_player();
    if not v273 or not v273:is_alive() then
        return;
    else
        local v274 = render.screen_size();
        local v275 = v274.x / 2;
        local v276 = v274.y / 2;
        local v277 = 0.1;
        local v278 = 0.04;
        local v279 = 8;
        local v280 = 4;
        local v281 = ui.get_alpha() > 0;
        local v282 = v80.misc.indicators:get();
        local v283 = v80.misc.indicators.crosshair_enable:get();
        local v284 = v282 and v283;
        local v285 = nil;
        local v286 = nil;
        local v287 = nil;
        if v284 then
            local v288 = v80.misc.indicators.crosshair_style:get();
            if v288 == 1 then
                v285 = 4;
                v286 = 2;
                v287 = "stellar";
            elseif v288 == 2 then
                v285 = 2;
                v286 = 2;
                v287 = "STELLAR";
            else
                v285 = 4;
                v286 = 2;
                v287 = "stellar";
            end;
        else
            v285 = 4;
            v286 = 2;
            v287 = "";
        end;
        local v289 = {
            DT = v57.doubletap:get(), 
            HS = v57.hide_shots:get(), 
            FA = v57.fake_duck:get(), 
            BODY = v57.body_aim:get() == "Force", 
            SAFE = v57.safe_points:get() == "Force", 
            FS = v57.freestanding:get()
        };
        local v290 = entity.get_local_player();
        local v291 = v290 and v290.m_bIsScoped or false;
        local v292 = v276 - 100;
        local v293 = v276 + 100;
        if not v223.crosshair_pos_initialized then
            v223.indicator_panel.y = db.crosshair_pos_y or v276;
            v223.crosshair_pos_initialized = true;
        end;
        if v281 then
            v223.dragging_context_crosshair = draggable({
                [1] = v223.indicator_panel
            }, {
                lock_x = true, 
                use_backdrop = true, 
                min_y = v292, 
                max_y = v293
            }, v223.dragging_context_crosshair, "crosshair_indicator");
        else
            v223.dragging_context_crosshair = nil;
        end;
        local v294 = v223.dragging_context_crosshair and common.is_button_down(1);
        local v295 = v294 and 255 or 0;
        v223.limit_lines_alpha = lerp(v223.limit_lines_alpha, v295, 0.02);
        local v296 = render.measure_text(v285, nil, v287);
        local v297 = v291 and v275 + 35 or v275 - v296.x / 2;
        v223.indicator_panel.x = v223.title_state.x - 10;
        v223.indicator_panel.w = v296.x + 20;
        local l_y_4 = v296.y;
        local v299 = 0;
        for v300, v301 in pairs(v289) do
            local v302 = v223.indicators_state[v300];
            v302.a = lerp(v302.a, v301 and 1 or 0, v277);
            if v302.a > 0.01 then
                v299 = v299 + 1;
            end;
        end;
        if v299 > 0 then
            l_y_4 = l_y_4 + v299 * v279 - (v279 - v296.y / 2);
        end;
        local v303 = v280 + 3;
        local v304 = l_y_4 + v280 + v303;
        v223.title_state.animated_h = lerp(v223.title_state.animated_h, v304, v278);
        if math.abs(v304 - v223.title_state.animated_h) < 0.1 then
            v223.title_state.animated_h = v304;
        end;
        local v305 = vector(v223.indicator_panel.x, v223.indicator_panel.y);
        local v306 = vector(v223.indicator_panel.x + v223.indicator_panel.w, v223.indicator_panel.y + v223.title_state.animated_h);
        if v281 then
            render.rect(v305, v306, color(255, 255, 255, 10), 5);
        end;
        if v284 and (not v29 or v29 == "crosshair_indicator") then
            if not v223.was_active then
                v223.title_state.x = v297;
            else
                v223.title_state.x = lerp(v223.title_state.x, v297, v278);
            end;
            if math.abs(v297 - v223.title_state.x) < 0.1 then
                v223.title_state.x = v297;
            end;
            if v223.limit_lines_alpha > 1 and (v281 or v294) then
                local v307 = color(128, 128, 128, math.floor(v223.limit_lines_alpha));
                render.line(vector(v275, v292), vector(v275, v305.y), v307);
                render.line(vector(v275, v306.y), vector(v275, v293), v307);
            end;
            local v308 = v80.misc.indicators.crosshair_color:get();
            render.text(v285, vector(v223.title_state.x, v223.indicator_panel.y + v280), v308, nil, v287);
            local v309 = v296.y + v280 - (v279 - v296.y / 2);
            for v310, v311 in pairs(v289) do
                local v312 = v223.indicators_state[v310];
                if v312.a > 0.01 then
                    local l_v309_0 = v309;
                    local v314 = render.measure_text(v286, nil, v310);
                    local v315 = v291 and v275 + 35 or v275 - v314.x / 2;
                    if v311 and not v312.e then
                        local l_l_v309_0_0 = l_v309_0;
                        v312.x = v315;
                        v312.y = l_l_v309_0_0;
                    end;
                    v312.y = lerp(v312.y, l_v309_0, v278);
                    v312.x = lerp(v312.x, v315, v278);
                    if math.abs(l_v309_0 - v312.y) < 0.1 then
                        v312.y = l_v309_0;
                    end;
                    if math.abs(v315 - v312.x) < 0.1 then
                        v312.x = v315;
                    end;
                    v312.e = v311;
                    render.text(v286, vector(v312.x, v223.indicator_panel.y + v312.y), color(255, 255, 255, math.floor(v312.a * 255)), nil, v310);
                    v309 = v309 + v279;
                else
                    v312.e = false;
                end;
            end;
            v223.indicator_panel.h = v223.title_state.animated_h;
        else
            for _, v318 in pairs(v223.indicators_state) do
                local v319 = 0;
                local v320 = 0;
                v318.e = false;
                v318.y = v320;
                v318.a = v319;
            end;
            v223.title_state.animated_h = 0;
        end;
        v223.was_active = v284;
        return;
    end;
end;
damage = function()
    -- upvalues: v80 (ref), v223 (ref), v57 (ref)
    local v321 = entity.get_local_player();
    if not v321 or not v321:is_alive() or not v80.misc.indicators:get() or not v80.misc.indicators.damage_enable:get() then
        v223.lerped_alpha = v223.lerped_alpha or 0;
        v223.lerped_alpha = lerp(v223.lerped_alpha, 0, v223.fade_speed);
        return;
    else
        local v322 = ui.get_alpha() > 0;
        local v323 = render.screen_size();
        v223.mi.boundary_box.x = v323.x / 2 - v223.mi.boundary_box.w / 2;
        v223.mi.boundary_box.y = v323.y / 2 - v223.mi.boundary_box.h / 2;
        local v324 = v80.misc.indicators.damage_mode:get();
        local v325 = 0;
        local v326 = false;
        v223.lerped_dmg_value = v223.lerped_dmg_value or 0;
        if v324 == 1 then
            v325 = v57.minimum_damage:get();
            v326 = v325 > 0;
            v223.lerped_dmg_value = v325;
        elseif v324 == 2 then
            local v327, v328 = unpack(get_bind("Min. Damage"));
            if v327 and v328 > 0 then
                v325 = v328;
                v326 = true;
                v223.lerped_dmg_value = lerp(v223.lerped_dmg_value, v325, v223.lerp_speed);
            end;
        end;
        v223.lerped_alpha = v223.lerped_alpha or 0;
        v223.lerped_alpha = lerp(v223.lerped_alpha, v326 and 1 or 0, v223.fade_speed);
        if v223.lerped_alpha < 0.01 or not v326 then
            return;
        else
            local v329 = 1;
            if v80.misc.indicators.damage_font:get() == "Pixel" then
                v329 = 2;
            elseif v80.misc.indicators.damage_font:get() == "Default" then
                v329 = 1;
            end;
            local v330 = tostring(math.floor(v223.lerped_dmg_value + 0.5));
            local v331 = render.measure_text(v329, nil, v330);
            v223.mi.damage_pos.w = v331.x;
            if not v223.mi.damage_pos_initialized then
                v223.mi.damage_pos.x = db.damage_pos_x or v323.x / 2 - v331.x / 2 + 10;
                v223.mi.damage_pos.y = db.damage_pos_y or v323.y / 2 - v331.y / 2 - 9;
                v223.mi.damage_pos_initialized = true;
            end;
            local v332 = 5;
            if v322 then
                v223.dragging_context_damage = draggable({
                    indicator = v223.mi.damage_pos
                }, {
                    use_backdrop = true, 
                    min_x = v223.mi.boundary_box.x + v332, 
                    max_x = v223.mi.boundary_box.x + v223.mi.boundary_box.w - v332 - v223.mi.damage_pos.w, 
                    min_y = v223.mi.boundary_box.y + v332, 
                    max_y = v223.mi.boundary_box.y + v223.mi.boundary_box.h - v332 - v223.mi.damage_pos.h
                }, v223.dragging_context_damage, "damage_indicator");
            end;
            if v223.dragging_context_damage then
                render.rect(vector(v223.mi.boundary_box.x, v223.mi.boundary_box.y), vector(v223.mi.boundary_box.x + v223.mi.boundary_box.w, v223.mi.boundary_box.y + v223.mi.boundary_box.h), color(255, 255, 255, 10), 5);
            end;
            local v333 = math.floor(v223.lerped_alpha * 255);
            render.text(v329, vector(v223.mi.damage_pos.x, v223.mi.damage_pos.y), color(255, 255, 255, v333), nil, v330);
            return;
        end;
    end;
end;
local v334 = {
    scope = 0, 
    alpha = 0, 
    radius = 0
};
scope = function()
    -- upvalues: v80 (ref), v57 (ref), v334 (ref)
    local v335 = entity.get_local_player();
    local v336 = v80.misc.scope_overlay:get();
    if not v80.misc.indicators:get() or not v336 or not v335 or not v335:is_alive() then
        v57.scope_overlay:override();
        v334.scope = lerp(v334.scope, 0, 0.1);
        return;
    else
        v57.scope_overlay:override("Remove All");
        v334.scope = lerp(v334.scope, v335.m_bIsScoped and 1 or 0, 0.1);
        if v334.scope <= 0.01 then
            return;
        else
            local v337 = v80.misc.scope_overlay.scope_color:get();
            local v338 = math.floor(v337.a * v334.scope);
            local v339 = color(v337.r, v337.g, v337.b, v338);
            local v340 = color(v337.r, v337.g, v337.b, 0);
            local v341 = v80.misc.scope_overlay.scope_position:get() * v334.scope;
            local v342 = v80.misc.scope_overlay.scope_offset:get();
            local l_x_4 = render.screen_size().x;
            local l_y_5 = render.screen_size().y;
            local v345 = l_x_4 / 2;
            local v346 = l_y_5 / 2;
            local v347 = 0.5;
            render.gradient(vector(v345 - v347, v346 - v342), vector(v345 + v347, v346 - v342 - v341), v339, v339, v340, v340);
            render.gradient(vector(v345 - v347, v346 + v342), vector(v345 + v347, v346 + v342 + v341), v339, v339, v340, v340);
            render.gradient(vector(v345 - v342, v346 - v347), vector(v345 - v342 - v341, v346 + v347), v339, v340, v339, v340);
            render.gradient(vector(v345 + v342, v346 - v347), vector(v345 + v342 + v341, v346 + v347), v339, v340, v339, v340);
            return;
        end;
    end;
end;
local v348 = {
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
local v349 = {};
local v350 = 5;
local v351 = 5;
local _ = render.load_font("Verdana", 12, "b");
local function v358(v353, v354, v355, v356, v357)
    -- upvalues: v349 (ref), v351 (ref), v350 (ref)
    if #v349 >= v351 then
        table.remove(v349, 1);
    end;
    table.insert(v349, {
        alpha = 0, 
        anim_y = 0, 
        type = v353, 
        name = v354, 
        group = v355, 
        damage_or_reason = v356, 
        colors = v357, 
        time = globals.realtime + v350, 
        created = globals.realtime
    });
end;
local function v363(v359, v360)
    if type(v359) ~= "table" then
        v359 = {
            [1] = v359
        };
    end;
    for _, v362 in ipairs(v359) do
        if v362 == v360 then
            return true;
        end;
    end;
    return false;
end;
events.aim_ack:set(function(v364)
    -- upvalues: v80 (ref), v363 (ref), v348 (ref), v358 (ref)
    if not v80.misc.aimbot_logs:get() then
        return;
    else
        local v365 = v80.misc.aimbot_logs.aimbot_type:get();
        if not v363(v365, 2) and not v363(v365, 1) and not v363(v365, 3) then
            return;
        else
            local v366 = entity.get_local_player();
            if not v366 or not v364.target or not v366:is_alive() then
                return;
            else
                local v367 = v366:get_player_weapon();
                if v367 then
                    local v368 = v367:get_weapon_info();
                    if v368 and v368.console_name == "weapon_taser" then
                        return;
                    end;
                end;
                local v369 = entity.get(v364.target);
                if not v369 then
                    return;
                else
                    local v370 = v369:get_name() or "unknown";
                    local v371 = v348[v364.wanted_hitgroup] or "no hitbox";
                    local v372 = v364.backtrack or 0;
                    local v373 = v364.hitchance or 0;
                    local v374 = v364.damage or 0;
                    local v375 = v364.spread or 0;
                    local v376 = v80.misc.aimbot_logs.aimbot_hit:get() or {
                        r = 255, 
                        b = 255, 
                        a = 255, 
                        g = 255
                    };
                    local v377 = v80.misc.aimbot_logs.aimbot_miss:get() or {
                        r = 255, 
                        b = 255, 
                        a = 255, 
                        g = 255
                    };
                    local v378 = v374 > 0 and v376 or v377;
                    local v379 = v374 > 0 and "Hit" or "Miss";
                    local v380 = "";
                    if v379 == "Miss" then
                        v380 = v364.state == "spread" and "spread" or v364.state == "prediction error" and "prediction error" or v364.state == "jitter correction" and "jitter correction" or v364.state == "correction" and "resolver" or v364.state == "lagcomp failure" and "fake lag correction" or "unregistered shot";
                    end;
                    local v381 = nil;
                    if v379 == "Hit" then
                        v381 = string.format("\a%sstellar \aDEFAULT\226\128\162 \aDEFAULTHit \a%s%s \aDEFAULT\239\189\158 \aDEFAULTgroup: \a%s%s \aDEFAULT\239\189\158 \aDEFAULTdamage: \a%s%d \aDEFAULT\239\189\158 \aDEFAULTbt: \a%s%dt \aDEFAULT\239\189\158 \aDEFAULThc: \a%s%d", v378:to_hex(), v378:to_hex(), v370, v378:to_hex(), v371, v378:to_hex(), v374, v378:to_hex(), v372, v378:to_hex(), v373);
                    else
                        v381 = string.format("\a%sstellar \aDEFAULT\226\128\162 \aDEFAULTMiss \a%s%s \aDEFAULT\239\189\158 \aDEFAULTgroup: \a%s%s \aDEFAULT\239\189\158 \aDEFAULTreason: \a%s%s \aDEFAULT\239\189\158 \aDEFAULTbt: \a%s%dt \aDEFAULT\239\189\158 \aDEFAULThc: \a%s%d \aDEFAULT\239\189\158 \aDEFAULTspread: \a%s%.1f\194\176", v378:to_hex(), v378:to_hex(), v370, v378:to_hex(), v371, v378:to_hex(), v380, v378:to_hex(), v372, v378:to_hex(), v373, v378:to_hex(), v375);
                    end;
                    if v363(v365, 1) then
                        print_raw(v381);
                    end;
                    if v363(v365, 3) then
                        print_dev(v381);
                    end;
                    if v363(v365, 2) then
                        if v379 == "Hit" then
                            v358("Hit", v370, v371, v374, {
                                [1] = v376, 
                                [2] = v376, 
                                [3] = v376
                            });
                        else
                            v358("Miss", v370, v371, v380, {
                                [1] = v377, 
                                [2] = v377, 
                                [3] = v377
                            });
                        end;
                    end;
                    return;
                end;
            end;
        end;
    end;
end);
events.player_hurt:set(function(v382)
    -- upvalues: v80 (ref), v363 (ref), v358 (ref)
    if not v80.misc.aimbot_logs:get() then
        return;
    else
        local v383 = v80.misc.aimbot_logs.aimbot_type:get();
        if not v363(v383, 2) and not v363(v383, 1) and not v363(v383, 3) then
            return;
        else
            local v384 = entity.get_local_player();
            local v385 = entity.get(v382.attacker, true);
            local v386 = entity.get(v382.userid, true);
            if not v385 or not v386 or v385 ~= v384 then
                return;
            else
                local l_weapon_0 = v382.weapon;
                local v388 = nil;
                if l_weapon_0 == "hegrenade" then
                    v388 = "Naded";
                elseif l_weapon_0 == "inferno" then
                    v388 = "Burned";
                elseif l_weapon_0 == "knife" then
                    v388 = v382.health == 0 and "Knifed" or "Knife";
                elseif l_weapon_0 == "taser" or l_weapon_0 == "zeus" or l_weapon_0 == "weapon_taser" then
                    v388 = "Zeused";
                else
                    return;
                end;
                local v389 = v80.misc.aimbot_logs.aimbot_hurt:get() or {
                    r = 255, 
                    b = 255, 
                    a = 255, 
                    g = 255
                };
                local v390 = v382.dmg_health or 0;
                local v391 = nil;
                if v388 == "Knifed" or v388 == "Zeused" then
                    v391 = string.format("\a%sstellar \aDEFAULT\226\128\162 %s \a%s%s", v389:to_hex(), v388, v389:to_hex(), v386:get_name());
                else
                    v391 = string.format("\a%sstellar \aDEFAULT\226\128\162 %s \a%s%s \aDEFAULT\239\189\158 \aDEFAULTdamage: \a%s%d", v389:to_hex(), v388, v389:to_hex(), v386:get_name(), v389:to_hex(), v390);
                end;
                if v363(v383, 1) then
                    print_raw(v391);
                end;
                if v363(v383, 3) then
                    print_dev(v391);
                end;
                if v363(v383, 2) then
                    v358(v388, v386:get_name(), "", v390, {
                        [1] = v389, 
                        [2] = v389, 
                        [3] = v389
                    });
                end;
                return;
            end;
        end;
    end;
end);
local v392 = {
    [1] = {
        damage_or_reason = 100, 
        type = "Hit", 
        name = "player", 
        group = "head"
    }, 
    [2] = {
        damage_or_reason = "spread", 
        type = "Miss", 
        name = "player", 
        group = "head"
    }, 
    [3] = {
        damage_or_reason = 10, 
        type = "Burned", 
        name = "player", 
        group = ""
    }
};
local v393 = false;
for v394 = 1, #v392 do
    v392[v394].alpha = 0;
    v392[v394].anim_y = 0;
end;
local v395 = {
    x = 0, 
    w = 0, 
    h = 0, 
    y = db.logs_pos_y or 500
};
local v396 = nil;
local v397 = 0;
events.render:set(function()
    -- upvalues: v80 (ref), v363 (ref), v395 (ref), v392 (ref), v349 (ref), v396 (ref), v28 (ref), v397 (ref), v393 (ref)
    local v398 = ui.get_alpha() > 0;
    if not v80.misc.aimbot_logs:get() then
        return;
    else
        local v399 = v80.misc.aimbot_logs.aimbot_type:get();
        if not v363(v399, 2) then
            return;
        else
            local v400 = 1;
            local v401 = render.screen_size();
            if not v401 then
                return;
            else
                local l_x_5 = v401.x;
                local l_y_6 = v401.y;
                if db.logs_pos_y == nil then
                    db.logs_pos_y = l_y_6 / 2 + 150;
                end;
                v395.y = db.logs_pos_y;
                local v404 = l_x_5 / 2;
                local l_y_7 = v395.y;
                local v406 = 24;
                local v407 = 6;
                local v408 = color(255, 255, 255);
                local v409 = #(v398 and v392 or v349) * v406;
                if v409 == 0 then
                    v409 = v406 * 3;
                end;
                v395.x = v404 - 150;
                v395.w = 300;
                v395.h = v409;
                v396 = draggable({
                    main = v395
                }, {
                    lock_x = true, 
                    min_y = 20, 
                    max_y = l_y_6 - v409 - 20
                }, v396, "logs_indicator");
                if v396 then
                    v395.y = v396.item.y;
                    db.logs_pos_y = v396.item.y;
                end;
                local v410 = v396 and 100 or 0;
                v28 = lerp(v28, v410, globals.frametime * 10);
                if v28 > 1 then
                    render.line(vector(v404, 0), vector(v404, l_y_6), color(180, 180, 180, v28));
                end;
                local v411 = v396 and 100 or 0;
                v397 = lerp(v397, v411, 0.02);
                if v397 > 1 then
                    render.rect(vector(0, 0), vector(l_x_5, l_y_6), color(0, 0, 0, math.floor(v397)));
                end;
                local v412 = globals.frametime * 8;
                local v413 = v398 and 1 or 0;
                if v398 and not v393 then
                    for v414 = 1, #v392 do
                        v392[v414].anim_y = 0;
                    end;
                end;
                for v415 = 1, #v392 do
                    local v416 = v392[v415];
                    v416.alpha = lerp(v416.alpha, v413, v412);
                    local v417 = (v415 - 1) * v406;
                    v416.anim_y = lerp(v416.anim_y, v417, v412);
                    do
                        if v416.alpha >= 0.01 then
                            local v418 = l_y_7 + v416.anim_y;
                            local v419 = {};
                            local v420 = 0;
                            local v421 = 0;
                            local function v425(v422, v423)
                                -- upvalues: v400 (ref), v419 (ref), v420 (ref), v421 (ref)
                                local v424 = render.measure_text(v400, "s", v422);
                                table.insert(v419, {
                                    text = v422, 
                                    color = v423, 
                                    width = v424.x
                                });
                                v420 = v420 + v424.x;
                                v421 = math.max(v421, v424.y);
                            end;
                            local v426 = nil;
                            if v416.type == "Hit" then
                                v426 = v80.misc.aimbot_logs.aimbot_hit:get() or {
                                    r = 255, 
                                    b = 255, 
                                    a = 255, 
                                    g = 255
                                };
                            elseif v416.type == "Miss" then
                                v426 = v80.misc.aimbot_logs.aimbot_miss:get() or {
                                    r = 255, 
                                    b = 255, 
                                    a = 255, 
                                    g = 255
                                };
                            else
                                v426 = v80.misc.aimbot_logs.aimbot_hurt:get() or {
                                    r = 255, 
                                    b = 255, 
                                    a = 255, 
                                    g = 255
                                };
                            end;
                            v426 = color(v426.r, v426.g, v426.b, v426.a);
                            local v427 = " \239\189\158 ";
                            if v416.type == "Hit" then
                                v425("Hit ", v408);
                                v425(v416.name, v426);
                                v425(v427 .. "group: ", v408);
                                v425(v416.group, v426);
                                v425(v427 .. "damage: ", v408);
                                v425(tostring(v416.damage_or_reason), v426);
                            elseif v416.type == "Miss" then
                                v425("Miss ", v408);
                                v425(v416.name, v426);
                                v425(v427 .. "group: ", v408);
                                v425(v416.group, v426);
                                v425(v427 .. "reason: ", v408);
                                v425(v416.damage_or_reason, v426);
                            else
                                v425(v416.type .. " ", v408);
                                v425(v416.name, v426);
                                if v416.damage_or_reason and v416.type ~= "Knifed" and v416.type ~= "Zeused" then
                                    v425(v427 .. "damage: ", v408);
                                    v425(tostring(v416.damage_or_reason), v426);
                                end;
                            end;
                            local v428 = v420 + v407 * 2;
                            local v429 = color(0, 0, 0, math.floor(150 * v416.alpha));
                            local v430 = v404 - v428 / 2;
                            local v431 = v404 + v428 / 2;
                            render.rect(vector(v430, v418), vector(v431, v418 + 20), v429, 3);
                            local v432 = v404 - v420 / 2;
                            local v433 = v418 + (20 - v421) / 2;
                            for _, v435 in ipairs(v419) do
                                local v436 = color(v435.color.r, v435.color.g, v435.color.b, 255 * v416.alpha);
                                render.text(v400, vector(v432, v433), v436, nil, v435.text);
                                v432 = v432 + v435.width;
                            end;
                        end;
                    end;
                end;
                if not v398 then
                    v412 = 3;
                    if #v349 ~= 0 then
                        for v437 = #v349, 1, -1 do
                            local v438 = v349[v437];
                            do
                                if v438 then
                                    if v438.time then
                                        local v439 = v438.time - globals.realtime;
                                        if v439 <= 0 then
                                            table.remove(v349, v437);
                                            goto label0 --[[  true, true  ]];
                                        else
                                            local v440 = 0.5;
                                            if v439 < v440 then
                                                v438.alpha = v439 / v440;
                                            elseif v438.alpha < 1 then
                                                v438.alpha = v438.alpha + (1 - v438.alpha) / v412;
                                            end;
                                        end;
                                    else
                                        v438.alpha = v438.alpha - 1 / v412;
                                        if v438.alpha <= 0 then
                                            table.remove(v349, v437);
                                            goto label0 --[[  true, true  ]];
                                        end;
                                    end;
                                    local v441 = (v437 - 1) * v406;
                                    v438.anim_y = v438.anim_y + (v441 - v438.anim_y) / v412;
                                    local v442 = l_y_7 + v438.anim_y;
                                    local v443 = {};
                                    local v444 = 0;
                                    local v445 = 0;
                                    local function v449(v446, v447)
                                        -- upvalues: v400 (ref), v443 (ref), v444 (ref), v445 (ref)
                                        local v448 = render.measure_text(v400, "s", v446);
                                        table.insert(v443, {
                                            text = v446, 
                                            color = v447, 
                                            width = v448.x
                                        });
                                        v444 = v444 + v448.x;
                                        v445 = math.max(v445, v448.y);
                                    end;
                                    local v450 = color(v438.colors[1].r, v438.colors[1].g, v438.colors[1].b);
                                    local v451 = " \239\189\158 ";
                                    if v438.type == "Hit" then
                                        v449("Hit ", v408);
                                        v449(v438.name, v450);
                                        v449(v451 .. "group: ", v408);
                                        v449(v438.group, v450);
                                        v449(v451 .. "damage: ", v408);
                                        v449(tostring(v438.damage_or_reason), v450);
                                    elseif v438.type == "Miss" then
                                        v449("Miss ", v408);
                                        v449(v438.name, v450);
                                        v449(v451 .. "group: ", v408);
                                        v449(v438.group, v450);
                                        v449(v451 .. "reason: ", v408);
                                        v449(v438.damage_or_reason, v450);
                                    else
                                        v449(v438.type .. " ", v408);
                                        v449(v438.name, v450);
                                        if v438.damage_or_reason and v438.type ~= "Knifed" and v438.type ~= "Zeused" then
                                            v449(v451 .. "damage: ", v408);
                                            v449(tostring(v438.damage_or_reason), v450);
                                        end;
                                    end;
                                    local v452 = v444 + v407 * 2;
                                    local v453 = color(0, 0, 0, math.floor(150 * v438.alpha));
                                    local v454 = v404 - v452 / 2;
                                    local v455 = v404 + v452 / 2;
                                    render.rect(vector(v454, v442), vector(v455, v442 + 20), v453, 3);
                                    local v456 = v404 - v444 / 2;
                                    local v457 = v442 + (20 - v445) / 2;
                                    for _, v459 in ipairs(v443) do
                                        local v460 = color(v459.color.r, v459.color.g, v459.color.b, 255 * v438.alpha);
                                        render.text(v400, vector(v456, v457), v460, nil, v459.text);
                                        v456 = v456 + v459.width;
                                    end;
                                end;
                                ::label0::;
                            end;
                        end;
                    end;
                end;
                v393 = v398;
                return;
            end;
        end;
    end;
end);
local v461 = {
    [1] = "SSG-08", 
    [2] = "AWP", 
    [3] = "Auto snipers", 
    [4] = "Revolver"
};
local v462 = {};
for _, v464 in ipairs(v461) do
    v462[v464] = {
        air = 35, 
        enabled = false, 
        no_scope = 35
    };
end;
hitchance = function()
    -- upvalues: v80 (ref), v57 (ref), l_mtools_0 (ref), v462 (ref)
    local v465 = entity.get_local_player();
    if not v465 or not v465:is_alive() or not v80.misc.hitchance_override:get() then
        v57.hit_chance:override();
        return;
    else
        local v466 = v465:get_player_weapon();
        if not v466 then
            v57.hit_chance:override();
            return;
        else
            local v467 = v466:get_weapon_info();
            if not v467 then
                v57.hit_chance:override();
                return;
            else
                local v468 = nil;
                if v467.console_name == "weapon_ssg08" then
                    v468 = "SSG-08";
                elseif v467.console_name == "weapon_awp" then
                    v468 = "AWP";
                elseif v467.console_name == "weapon_scar20" or v467.console_name == "weapon_g3sg1" then
                    v468 = "Auto snipers";
                elseif v467.console_name == "weapon_revolver" then
                    v468 = "Revolver";
                else
                    v57.hit_chance:override();
                    return;
                end;
                l_mtools_0.AntiAims.Condition:Update();
                v462["SSG-08"].enabled = v80.misc.hitchance_override.hitchance_enable_scout:get();
                v462.AWP.enabled = v80.misc.hitchance_override.hitchance_enable_awp:get();
                v462["Auto snipers"].enabled = v80.misc.hitchance_override.hitchance_enable_at:get();
                v462.Revolver.enabled = v80.misc.hitchance_override.hitchance_enable_revolver:get();
                if v468 == "SSG-08" then
                    v462[v468].air = v80.misc.hitchance_override.scout_hitchance_air:get();
                    v462[v468].no_scope = v80.misc.hitchance_override.scout_hitchance_no_scope:get();
                elseif v468 == "AWP" then
                    v462[v468].air = v80.misc.hitchance_override.awp_hitchance_air:get();
                    v462[v468].no_scope = v80.misc.hitchance_override.awp_hitchance_no_scope:get();
                elseif v468 == "Auto snipers" then
                    v462[v468].air = v80.misc.hitchance_override.at_hitchance_air:get();
                    v462[v468].no_scope = v80.misc.hitchance_override.at_hitchance_no_scope:get();
                elseif v468 == "Revolver" then
                    v462[v468].air = v80.misc.hitchance_override.revolver_hitchance_air:get();
                end;
                if not v462[v468] or not v462[v468].enabled then
                    v57.hit_chance:override();
                    return;
                else
                    local v469 = v465 and v465.m_bIsScoped or false;
                    local l_Dev_0 = l_mtools_0.AntiAims.Condition:GetDev("Air");
                    local v471 = nil;
                    if not v469 then
                        v471 = v462[v468].no_scope;
                        if v471 > 0 then
                            v57.hit_chance:override(v471);
                            return;
                        end;
                    end;
                    if l_Dev_0 then
                        v471 = v462[v468].air;
                        if v471 > 0 then
                            v57.hit_chance:override(v471);
                            return;
                        end;
                    end;
                    v57.hit_chance:override();
                    return;
                end;
            end;
        end;
    end;
end;
local v485 = {
    config = {
        dmg_max = 100, 
        dmg_min = 1, 
        trace_h = 18, 
        max_steps = 4, 
        snipers = {
            CWeaponAWP = true, 
            CWeaponSSG08 = true, 
            CWeaponSCAR20 = true, 
            CWeaponG3SG1 = true
        }, 
        hitboxes_groups = {
            Head = {
                [1] = 0
            }, 
            Chest = {
                [1] = 4, 
                [2] = 5, 
                [3] = 6
            }, 
            Stomach = {
                [1] = 2, 
                [2] = 3
            }, 
            Arms = {
                [1] = 13, 
                [2] = 14, 
                [3] = 15, 
                [4] = 16, 
                [5] = 17, 
                [6] = 18
            }, 
            Legs = {
                [1] = 7, 
                [2] = 8, 
                [3] = 9, 
                [4] = 10
            }
        }
    }, 
    state = {
        exploit = false, 
        shooting = false, 
        peeking = false, 
        target_locked = false, 
        moving = false, 
        enabled = false, 
        debug_alpha_value = 0, 
        last_tick = 0, 
        active_idx = 0, 
        retreat = false, 
        center = vector(), 
        points = {}, 
        visuals = {}, 
        debug_lines = {}, 
        tween_pos = {}, 
        tween_alpha = {}, 
        alpha_global = l_smoothy_0.new(), 
        alpha_debug = l_smoothy_0.new()
    }, 
    contains = function(v472, v473)
        if type(v472) ~= "table" then
            return false;
        else
            for _, v475 in pairs(v472) do
                if v475 == v473 then
                    return true;
                end;
            end;
            return false;
        end;
    end, 
    is_enemy = function(v476)
        return v476 and v476:get_classname() == "CCSPlayer" and v476:is_enemy();
    end, 
    angle_to_vec = function(v477, v478, v479)
        local v480 = math.rad(v479);
        return vector(v477.x + math.cos(v480) * v478, v477.y + math.sin(v480) * v478, v477.z);
    end, 
    move_cmd = function(v481, v482, v483)
        local l_y_8 = v483:get_origin():to(v482):angles().y;
        v481.in_forward = true;
        v481.in_back = false;
        v481.in_moveleft = false;
        v481.in_moveright = false;
        v481.in_speed = false;
        v481.forwardmove = 800;
        v481.sidemove = 0;
        v481.move_yaw = l_y_8;
    end
};
v485.get_hitbox_ids = function()
    -- upvalues: v80 (ref), v485 (ref)
    local v486 = v80.misc.automatic_peek.hitboxes:get();
    local v487 = {};
    for _, v489 in pairs(v486) do
        local v490 = v485.config.hitboxes_groups[v489];
        if v490 then
            for _, v492 in pairs(v490) do
                table.insert(v487, v492);
            end;
        end;
    end;
    return v487;
end;
v485.calc_point = function(v493, v494, v495, v496, v497, v498, v499, v500)
    -- upvalues: v485 (ref)
    local v501 = v498 and vector(v493.x, v493.y, v498.z) - v494 or v493;
    local v502 = v485.angle_to_vec(v501, v496 * v497, v495);
    if v497 > 1 then
        v501 = v485.angle_to_vec(v502, -v496, v495);
    end;
    local l_end_pos_0 = utils.trace_hull(v502, v502 + vector(0, 0, v485.config.trace_h), v499, v500, v485.is_enemy, 33636363).end_pos;
    local v504 = vector(0, 0, math.min(v485.config.trace_h, math.abs(v493.z - l_end_pos_0.z)));
    local l_end_pos_1 = utils.trace_hull(v501 + v504, v502 + v504, v499, v500, v485.is_enemy, 33636363).end_pos;
    if v502:dist2d(l_end_pos_1) > v496 * 0.95 then
        return false;
    elseif v498 and v502:dist2d(v498) > v496 + 0.001 then
        return false;
    else
        return utils.trace_hull(l_end_pos_1, vector(l_end_pos_1.x, l_end_pos_1.y, v493.z - 240), v499, v500, v485.is_enemy, 33636363).end_pos + v494;
    end;
end;
v485.calc_points = function(v506, v507, v508, v509, v510)
    -- upvalues: v485 (ref)
    local l_m_vecViewOffset_0 = v506.m_vecViewOffset;
    local l_m_vecMins_0 = v506.m_vecMins;
    local l_m_vecMaxs_0 = v506.m_vecMaxs;
    local v514 = {
        [0] = v485.calc_point(v507, l_m_vecViewOffset_0, v508, v510, 0, nil, l_m_vecMins_0, l_m_vecMaxs_0)
    };
    v485.state.visuals[0] = v514[0];
    for v515 = 1, 2 do
        for v516 = 1, v509 / 2 do
            local v517 = v515 == 1 and v516 or v516 + v509 / 2;
            local v518 = v515 == 1 and v508 - 90 or v508 + 90;
            local v519 = v514[v517 == v509 / 2 + 1 and 0 or v517 - 1];
            local v520 = v485.calc_point(v507, l_m_vecViewOffset_0, v518, v510, v516, v519, l_m_vecMins_0, l_m_vecMaxs_0);
            if v517 >= 1 and (not v520 or v519 and v520 and v485.config.trace_h < math.abs(v519.z - v520.z)) then
                local l_v517_0 = v517;
                local v522 = v515 == 1 and v509 / 2 or v509;
                for v523 = l_v517_0, v522 do
                    v514[v523] = false;
                    v485.state.visuals[v523] = false;
                end;
                break;
            else
                v514[v517] = v520;
                v485.state.visuals[v517] = v520;
            end;
        end;
    end;
    return v514;
end;
v485.find_best = function(v524, v525, v526, v527)
    -- upvalues: v58 (ref), v485 (ref)
    local l_m_iHealth_0 = v526.m_iHealth;
    local v529 = math.clamp(v58.mindamage:get(), v485.config.dmg_min, v485.config.dmg_max);
    for v530, v531 in pairs(v524) do
        v485.state.debug_lines[v530] = {};
        if v531 then
            for _, v533 in pairs(v527) do
                local v534 = v526:get_hitbox_position(v533);
                if v534 then
                    local v535, _ = utils.trace_bullet(v525, v531, v534);
                    table.insert(v485.state.debug_lines[v530], {
                        [1] = v531, 
                        [2] = v534
                    });
                    if math.min(v529, l_m_iHealth_0) <= v535 and v535 > 0 then
                        return v531, v530;
                    end;
                end;
            end;
        end;
    end;
    return nil, 0;
end;
v485.can_shoot = function(v537, v538)
    if not v538 then
        return false;
    else
        local v539 = v537.m_flNextAttack or 0;
        local v540 = v538.m_flNextPrimaryAttack or 0;
        return math.max(0, v539, v540) <= globals.curtime and v538.m_iClip1 > 0;
    end;
end;
v485.should_engage = function(v541, v542)
    -- upvalues: v485 (ref), v58 (ref)
    if not v542 then
        return false;
    else
        local v543 = v541:get_player_weapon();
        if not v485.can_shoot(v541, v543) or v543.m_fLastShotTime - globals.curtime > 0 then
            return false;
        elseif not v58.autoscope:get() and v485.config.snipers[v543:get_classname()] and not v541.m_bIsScoped then
            return false;
        elseif v58.doubletap.switch:get() and rage.exploit:get() ~= 1 then
            return false;
        elseif v541.m_flVelocityModifier ~= 1 or v542:get_bbox().alpha < 0.45 then
            return false;
        else
            return true;
        end;
    end;
end;
v485.handle = function(v544)
    -- upvalues: v80 (ref), v58 (ref), v485 (ref)
    if not v80.misc.automatic_peek:get() then
        v58.peek_assist.switch:override();
        v58.peek_assist.autostop:override();
        v58.peek_assist.retreat_mode:override();
        v58.peek_assist.max_distance:override();
        v58.doubletap.fakelag_limit:override();
        v58.doubletap.immediate_teleport:override();
        v58.doubletap.switch:override();
        v58.doubletap.lag_options:override();
        v58.multipoint.head_scale:override();
        v485.state.enabled = false;
        return;
    else
        v58.doubletap.fakelag_limit:override(1);
        v58.doubletap.immediate_teleport:override(false);
        v58.peek_assist.switch:override(true);
        v58.peek_assist.autostop:override("Early");
        local v545 = entity.get_local_player();
        local v546 = v545.m_vecVelocity:length2d();
        local v547 = bit.band(v545.m_fFlags, 1) ~= 1 or v544.in_forward or v544.in_moveleft or v544.in_moveright or v544.in_back or v544.in_jump;
        local l_center_0 = v485.state.center;
        local v549 = v545:get_origin();
        local v550 = l_center_0:dist2d(v549);
        if not v485.state.target_locked and not v485.state.moving or v550 > 0.05 and v546 < 1.11 and v546 ~= 0 then
            v485.state.center = v549;
        end;
        local v551 = entity.get_threat();
        v485.state.target = v551;
        if not v551 then
            v485.state.center = v549;
            for v552 = 0, v485.config.max_steps do
                v485.state.visuals[v552] = false;
                v485.state.debug_lines[v552] = {};
            end;
            v485.state.enabled = false;
            v485.state.active_idx = 0;
            v485.state.target_locked = false;
            v485.state.tracing = false;
            return;
        else
            local v553 = v551 and l_center_0:to(v551:get_origin()):angles().y or render.camera_angles().y;
            local v554 = v80.misc.automatic_peek.distance:get() or 20;
            local v555 = v485.calc_points(v545, l_center_0, v553, v485.config.max_steps, v554);
            v485.state.enabled = true;
            local v556 = nil;
            local v557 = 0;
            if not v547 and v485.should_engage(v545, v551) then
                local v558, v559 = v485.find_best(v555, v545, v551, v485.get_hitbox_ids());
                v557 = v559;
                v556 = v558;
                v485.state.tracing = true;
            else
                v485.state.tracing = false;
            end;
            v485.state.target_locked = v556 ~= nil;
            v485.state.active_idx = v557;
            if v485.state.target_locked then
                v485.move_cmd(v544, v556, v545);
                v485.state.moving = false;
                v485.state.peeking = true;
                v485.state.shooting = false;
                v485.state.exploit = false;
                v485.state.retreat = false;
            elseif v547 then
                v485.state.moving = false;
                v485.state.peeking = false;
                v485.state.shooting = false;
                v485.state.exploit = false;
                v485.state.retreat = false;
            elseif v485.state.peeking then
                v485.state.moving = true;
                v485.state.shooting = true;
                v485.state.peeking = false;
            end;
            if not v485.state.moving then
                v485.state.last_tick = globals.tickcount;
            end;
            if v485.state.moving then
                if v550 < 0.05 then
                    v485.state.moving = false;
                    v485.state.shooting = false;
                    v485.state.exploit = false;
                    v485.state.retreat = false;
                elseif v485.state.shooting and rage.exploit:get() == 1 and v485.state.last_tick - globals.tickcount <= -7 then
                    rage.exploit:force_teleport();
                    v485.state.shooting = false;
                    v485.state.exploit = true;
                elseif v485.state.last_tick == globals.tickcount - 1 then
                    v485.state.retreat = true;
                end;
            end;
            v58.multipoint.head_scale:override(v485.state.target_locked and 100 or nil);
            v58.peek_assist.retreat_mode:override(v485.state.target_locked and "On Shot" or v485.state.moving and {
                [1] = "On Shot", 
                [2] = "On Key Release"
            } or nil);
            local l_switch_0 = v58.doubletap.switch;
            local l_l_switch_0_0 = l_switch_0;
            l_switch_0 = l_switch_0.override;
            if not v485.state.exploit or rage.exploit:get() ~= 1 then

            end;
            l_switch_0(l_l_switch_0_0, nil);
            v58.doubletap.lag_options:override(v485.state.retreat and "Always On" or "On Peek");
            return;
        end;
    end;
end;
v485.render = function()
    -- upvalues: v58 (ref), v80 (ref), v485 (ref)
    local v562 = entity.get_local_player();
    if not v562 or not v562:is_alive() or not v58.thirdperson_switch:get() or not v80.misc.automatic_peek:get() or not v80.misc.automatic_peek.visualize:get() then
        return;
    else
        local l_visuals_0 = v485.state.visuals;
        local v564 = v80.misc.automatic_peek.visualize_color:get();
        local l_enabled_0 = v485.state.enabled;
        local l_state_0 = v485.state;
        local l_active_idx_0 = v485.state.active_idx;
        if l_state_0.alpha_global(0.04, l_enabled_0) <= 0 then
            return;
        else
            local v568 = v80.misc.automatic_peek.visualize_type:get() or "Lines";
            for v569 = 0, #l_visuals_0 do
                local v570 = l_visuals_0[v569];
                local v571 = l_state_0.tween_alpha[v569](0.04, v570 and l_enabled_0);
                if v571 > 0 and v570 then
                    l_state_0.tween_pos[v569](v571 > 0.2 and 0.015 or 0, (l_active_idx_0 == v569 and v570 + vector(0, 0, 1.5) or v570) + vector(0, 0, -26 + 4 * v571));
                    local v572 = render.world_to_screen(l_state_0.tween_pos[v569].value);
                    if v572 and v572.x ~= 0 then
                        local v573 = l_active_idx_0 == v569 and v564 or v564:alpha_modulate(100 + 155 * (l_active_idx_0 == v569 and 1 or 0) * v571);
                        if v568 == "Lines" then
                            render.circle(v572, v573, 2.5, 0, 1);
                        elseif v568 == "Boxes" then
                            local v574 = 10;
                            local v575 = v572 - vector(v574 / 2, v574 / 2, 0);
                            local v576 = v572 + vector(v574 / 2, v574 / 2, 0);
                            render.rect(v575, v576, v573, 2);
                        end;
                    end;
                    if v568 == "Lines" then
                        local v577 = v569 == v485.config.max_steps / 2 and 0 or v569;
                        local v578 = v569 + 1;
                        if v578 <= #l_visuals_0 then
                            local l_value_0 = l_state_0.tween_alpha[v578].value;
                            if l_value_0 > 0 then
                                local v580 = render.world_to_screen(l_state_0.tween_pos[v577].value);
                                local v581 = render.world_to_screen(l_state_0.tween_pos[v578].value);
                                if v580 and v581 and v580.x ~= 0 and v581.x ~= 0 then
                                    render.line(v580, v581, v564:alpha_modulate(255 * l_value_0));
                                end;
                            end;
                        end;
                    end;
                end;
            end;
            v485.state.debug_alpha_value = v485.state.debug_alpha_value or 0;
            v485.state.debug_alpha_value = lerp(v485.state.debug_alpha_value, v485.state.tracing and 1 or 0, 0.04);
            local l_debug_alpha_value_0 = v485.state.debug_alpha_value;
            if l_debug_alpha_value_0 > 0 then
                for _, v584 in pairs(v485.state.debug_lines) do
                    for _, v586 in pairs(v584) do
                        local v587 = render.world_to_screen(v586[1]);
                        local v588 = render.world_to_screen(v586[2]);
                        if v587 and v588 then
                            render.line(v587, v588, v564:alpha_modulate(25 * l_debug_alpha_value_0));
                        end;
                    end;
                end;
            end;
            return;
        end;
    end;
end;
v485.init = function()
    -- upvalues: v485 (ref), l_smoothy_0 (ref)
    for v589 = 0, v485.config.max_steps do
        v485.state.debug_lines[v589] = {};
        v485.state.visuals[v589] = false;
        v485.state.tween_pos[v589] = l_smoothy_0.new(vector());
        v485.state.tween_alpha[v589] = l_smoothy_0.new();
    end;
end;
v485.init();
events.createmove:set(function(v590)
    -- upvalues: v485 (ref)
    v485.handle(v590);
end);
events.render:set(function()
    -- upvalues: v485 (ref)
    v485.render();
end);
events.shutdown:set(function()
    -- upvalues: v58 (ref)
    for _, v592 in pairs(v58) do
        if type(v592) == "table" then
            for _, v594 in pairs(v592) do
                v594:override();
            end;
        else
            v592:override();
        end;
    end;
end);
local v595 = 5;
local v596 = nil;
local v597 = nil;
local v598 = nil;
local v599 = nil;
local v600 = nil;
local v601 = false;
local v602 = false;
local v603 = 1;
local v604 = 0;
local v605 = {
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
local v606 = {
    Stomach = 3, 
    Chest = 2, 
    Head = 1, 
    Legs = 4
};
local v607 = {
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
in_list = function(v608, v609)
    for v610 = 1, #v608 do
        if v608[v610] == v609 then
            return true;
        end;
    end;
    return false;
end;
is_valid_weapon = function(v611)
    return v611 >= 1 and v611 <= 6;
end;
fetch_targets = function()
    local v612 = {};
    local v613 = entity.get_player_resource();
    for v614 = 1, globals.max_players do
        local v615 = entity.get(v614);
        if v615 and v613.m_bConnected[v614] and v615:is_enemy() and v615:is_dormant() then
            table.insert(v612, v615);
        end;
    end;
    return v612;
end;
create_aim_points = function(v616, v617, v618)
    local v619 = v616:to(v617):angles();
    local v620 = math.rad(v619.y + 90);
    local v621 = vector(math.cos(v620), math.sin(v620), 0) * v618;
    return {
        [1] = {
            text = "Middle", 
            vec = v617
        }, 
        [2] = {
            text = "Left", 
            vec = v617 + v621
        }, 
        [3] = {
            text = "Right", 
            vec = v617 - v621
        }
    };
end;
bullet_trace = function(v622, v623, v624, v625)
    local v626, v627 = utils.trace_bullet(v622, v623, v624, v625);
    if v627 and v627.entity and v627.entity:is_player() and not v627.entity:is_enemy() then
        return 0, v627;
    else
        return v626 or 0, v627;
    end;
end;
do
    local l_v595_0, l_v596_0, l_v597_0, l_v598_0, l_v599_0, l_v600_0, l_v601_0, l_v602_0, l_v603_0, l_v604_0, l_v605_0, l_v606_0, l_v607_0 = v595, v596, v597, v598, v599, v600, v601, v602, v603, v604, v605, v606, v607;
    process_move = function(v641)
        -- upvalues: v57 (ref), l_v604_0 (ref), v80 (ref), l_v603_0 (ref), l_v607_0 (ref), l_v606_0 (ref), l_v596_0 (ref), l_v598_0 (ref), l_v599_0 (ref), l_v597_0 (ref), l_v600_0 (ref), l_v595_0 (ref), l_v602_0 (ref)
        v57.dormant_aimbot:override(false);
        local v642 = entity.get_local_player();
        if not v642 then
            return;
        else
            local v643 = v642:get_player_weapon();
            if not v643 then
                return;
            else
                local v644 = v643:get_weapon_info();
                if not v644 then
                    return;
                else
                    local v645 = v643:get_inaccuracy();
                    if not v645 then
                        return;
                    else
                        local l_tickcount_0 = globals.tickcount;
                        local v647 = v642:get_eye_position();
                        local l_current_0 = v642:get_simulation_time().current;
                        local v649 = bit.band(v642.m_fFlags, bit.lshift(1, 0)) ~= 0;
                        if l_tickcount_0 < l_v604_0 then
                            return;
                        elseif v641.in_jump and not v649 then
                            return;
                        elseif not is_valid_weapon(v644.weapon_type) or v643.m_iClip1 <= 0 then
                            return;
                        else
                            local v650 = fetch_targets();
                            local v651 = v80.misc.dormant_aimbot.hitboxes:get();
                            if l_tickcount_0 % #v650 ~= 0 then
                                l_v603_0 = l_v603_0 + 1;
                            else
                                l_v603_0 = 1;
                            end;
                            local v652 = v650[l_v603_0];
                            if not v652 then
                                return;
                            else
                                local v653 = v652:get_bbox();
                                local v654 = v652:get_origin();
                                local l_m_flDuckAmount_0 = v652.m_flDuckAmount;
                                local v656 = v80.misc.dormant_aimbot.hitchance:get();
                                local v657 = v80.misc.dormant_aimbot.damage:get();
                                if v657 == 0 then
                                    v657 = v80.misc.dormant_aimbot.damage:get();
                                end;
                                if v657 >= 100 then
                                    v657 = v657 - 100 + v652.m_iHealth;
                                end;
                                local v658 = {};
                                for v659 = 1, #l_v607_0 do
                                    local v660 = l_v607_0[v659];
                                    local l_vec_0 = v660.vec;
                                    local l_scale_0 = v660.scale;
                                    local l_hitbox_0 = v660.hitbox;
                                    if l_hitbox_0 == "Head" then
                                        l_vec_0 = l_vec_0 - vector(0, 0, 10 * l_m_flDuckAmount_0);
                                    elseif l_hitbox_0 == "Chest" then
                                        l_vec_0 = l_vec_0 - vector(0, 0, 4 * l_m_flDuckAmount_0);
                                    end;
                                    if #v651 ~= 0 then
                                        local v664 = l_v606_0[l_hitbox_0];
                                        if in_list(v651, v664) then
                                            table.insert(v658, {
                                                vec = l_vec_0, 
                                                scale = l_scale_0, 
                                                hitbox = l_hitbox_0
                                            });
                                        end;
                                    else
                                        table.insert(v658, 1, {
                                            vec = l_vec_0, 
                                            scale = l_scale_0, 
                                            hitbox = l_hitbox_0
                                        });
                                    end;
                                end;
                                if not (v644.is_revolver and not (v643.m_flNextPrimaryAttack >= l_current_0) or math.max(v642.m_flNextAttack, v643.m_flNextPrimaryAttack, v643.m_flNextSecondaryAttack) < l_current_0) then
                                    return;
                                elseif math.floor(v653.alpha * 100) + 5 <= v656 then
                                    return;
                                else
                                    local v665 = nil;
                                    local v666 = nil;
                                    for v667 = 1, #v658 do
                                        local v668 = v658[v667];
                                        local v669 = create_aim_points(v647, v654 + v668.vec, v668.scale);
                                        for v670 = 1, #v669 do
                                            local v671 = v669[v670];
                                            local l_vec_1 = v671.vec;
                                            local v674, v675 = bullet_trace(v642, v647, l_vec_1, function(v673)
                                                -- upvalues: v652 (ref)
                                                return v673 == v652;
                                            end);
                                            if (not v675 or not v675:is_visible()) and v674 ~= 0 and v657 < v674 then
                                                v665 = l_vec_1;
                                                v666 = v674;
                                                l_v596_0 = v652;
                                                l_v598_0 = v668.hitbox;
                                                l_v599_0 = v674;
                                                l_v597_0 = v671.text;
                                                l_v600_0 = v653.alpha;
                                                break;
                                            end;
                                        end;
                                        if v665 and v666 then
                                            break;
                                        end;
                                    end;
                                    if not v665 or not v666 then
                                        return;
                                    else
                                        local v676 = v647:to(v665):angles();
                                        v641.block_movement = 1;
                                        local v677 = not v641.in_jump and v649;
                                        local v678 = v642.m_bIsScoped or v642.m_bResumeZoom;
                                        local v679 = v644.weapon_type == l_v595_0;
                                        if not v678 and v679 and v677 then
                                            v641.in_attack2 = true;
                                        end;
                                        if v645 < 0.01 then
                                            v641.view_angles = v676;
                                            v641.in_attack = true;
                                            l_v602_0 = true;
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
    handle_shot = function(v680)
        -- upvalues: l_v602_0 (ref), l_v601_0 (ref), l_v596_0 (ref), l_v598_0 (ref), l_v599_0 (ref), l_v597_0 (ref), l_v600_0 (ref)
        utils.execute_after(0.03, function()
            -- upvalues: v680 (ref), l_v602_0 (ref), l_v601_0 (ref), l_v596_0 (ref), l_v598_0 (ref), l_v599_0 (ref), l_v597_0 (ref), l_v600_0 (ref)
            if entity.get(v680.userid, true) == entity.get_local_player() then
                if l_v602_0 and not l_v601_0 then
                    events.dormant_miss:call({
                        userid = l_v596_0, 
                        aim_hitbox = l_v598_0, 
                        aim_damage = l_v599_0, 
                        aim_point = l_v597_0, 
                        accuracy = l_v600_0
                    });
                end;
                local v681 = false;
                l_v602_0 = false;
                l_v601_0 = v681;
                v681 = nil;
                local v682 = nil;
                local v683 = nil;
                local v684 = nil;
                l_v600_0 = nil;
                l_v597_0 = v684;
                l_v599_0 = v683;
                l_v598_0 = v682;
                l_v596_0 = v681;
            end;
        end);
    end;
    handle_hit = function(v685)
        -- upvalues: l_v602_0 (ref), l_v601_0 (ref), l_v605_0 (ref), l_v597_0 (ref), l_v598_0 (ref), l_v599_0 (ref)
        local v686 = entity.get_local_player();
        local v687 = entity.get(v685.userid, true);
        local v688 = entity.get(v685.attacker, true);
        if not v687 or v688 ~= v686 then
            return;
        else
            local v689 = v687:get_bbox();
            if not v689 then
                return;
            else
                if v687:is_dormant() and l_v602_0 then
                    l_v601_0 = true;
                    events.dormant_hit:call({
                        userid = v687, 
                        attacker = v688, 
                        health = v685.health, 
                        armor = v685.armor, 
                        weapon = v685.weapon, 
                        dmg_health = v685.dmg_health, 
                        dmg_armor = v685.dmg_armor, 
                        hitgroup = v685.hitgroup, 
                        accuracy = v689.alpha, 
                        hitbox = l_v605_0[v685.hitgroup], 
                        aim_point = l_v597_0, 
                        aim_hitbox = l_v598_0, 
                        aim_damage = l_v599_0
                    });
                end;
                return;
            end;
        end;
    end;
    handle_shutdown = function()
        -- upvalues: v57 (ref)
        v57.dormant_aimbot:override();
    end;
    v80.misc.dormant_aimbot:set_callback(function(v690)
        -- upvalues: v57 (ref)
        local v691 = v690:get();
        if not v691 then
            v57.dormant_aimbot:override();
        end;
        events.shutdown(handle_shutdown, v691);
        events.createmove(process_move, v691);
        events.weapon_fire(handle_shot, v691);
        events.player_hurt(handle_hit, v691);
    end, true);
end;
v595 = {};
v596 = 0.3;
v595.resolve_grenade_throw = function(v692, v693, v694, v695)
    -- upvalues: v596 (ref)
    v692.x = v692.x - 10 + math.abs(v692.x) / 9;
    local v696 = vector():angles(v692);
    local v697 = v695 * 1.25;
    if v694 <= 0.1 then
        return v692;
    else
        local v698 = math.clamp(v693 * 0.9, 15, 750) * math.clamp(v694, 0, 1) * lerp(v596, 1, math.clamp(v694, 0, 1));
        local l_v696_0 = v696;
        for _ = 1, 4 do
            l_v696_0 = (v696 * (l_v696_0 * v698 + v697):length() - v697) / v698;
            l_v696_0:normalize();
        end;
        local v701 = l_v696_0.angles(l_v696_0);
        v701.x = v701.x > -10 and 0.9 * v701.x + 9 or 1.125 * v701.x + 11.25;
        return v701;
    end;
end;
v595.on_grenade_override_view = function(v702)
    -- upvalues: v80 (ref), v595 (ref)
    if not v80.misc.grenades:get() or not v80.misc.grenades.grenade_super_toss:get() then
        return;
    else
        local v703 = entity.get_local_player();
        local v704 = entity.get_local_player():get_player_weapon();
        if not v703 or not v704 then
            return;
        else
            local v705 = v704:get_weapon_info();
            if not v705 then
                return;
            else
                v702.angles = v595.resolve_grenade_throw(v702.angles, v705.throw_velocity, v704.m_flThrowStrength, v702.velocity);
                return;
            end;
        end;
    end;
end;
v595.on_createmove_1 = function(v706)
    -- upvalues: v80 (ref), v595 (ref)
    if not v80.misc.grenades:get() or not v80.misc.grenades.grenade_super_toss:get() then
        return;
    elseif not v706.jitter_move then
        return;
    else
        local v707 = entity.get_local_player();
        local v708 = entity.get_local_player():get_player_weapon();
        if not v707 or not v708 then
            return;
        else
            local v709 = v708:get_weapon_info();
            if not v709 or v709.weapon_type ~= 9 or v708.m_fThrowTime < globals.curtime - to_time(globals.clock_offset) then
                return;
            else
                v706.in_speed = true;
                local v710 = v707:simulate_movement();
                v710:think();
                v706.view_angles = v595.resolve_grenade_throw(v706.view_angles, v709.throw_velocity, v708.m_flThrowStrength, v710.velocity);
                return;
            end;
        end;
    end;
end;
v595.grenade_release = function(v711)
    -- upvalues: v80 (ref)
    if not v80.misc.grenades:get() or not v80.misc.grenades.grenade_release:get() then
        return;
    else
        local v712 = entity.get_local_player();
        if not v712 or not v712:is_alive() then
            return;
        else
            local v713 = v712:get_player_weapon();
            if not v713 then
                return;
            else
                local v714 = v713:get_classname();
                if not v714 then
                    return;
                else
                    local v715 = ({
                        CHEGrenade = "HE Grenade", 
                        CMolotovGrenade = "Molotov", 
                        CSmokeGrenade = "Smoke"
                    })[v714];
                    if v715 and v80.misc.grenades.grenade_release_type_nades:get(v715) then
                        return;
                    else
                        if v714 == "CMolotovGrenade" and v713.m_bPinPulled then
                            local v716 = entity.get_entities("CInferno");
                            if #v716 > 0 then
                                local v717 = v712:get_origin();
                                local v718 = v712:get_eye_position();
                                local v719 = render.camera_angles();
                                local v720 = nil;
                                local v721 = 999999;
                                local v722 = 15;
                                for _, v724 in ipairs(v716) do
                                    local v725 = v724:get_origin();
                                    local v726 = v717:dist(v725);
                                    local v727 = (v725 - v718):angles();
                                    local v728 = math.abs((v727.y - v719.y + 180) % 360 - 180);
                                    local v729 = math.abs((v727.x - v719.x + 180) % 360 - 180);
                                    local v730 = utils.trace_line(v718, v725, v712);
                                    if v726 < 500 and v726 < v721 and v730.fraction > 0.97 and v728 < v722 and v729 < v722 then
                                        v720 = v724;
                                        v721 = v726;
                                    end;
                                end;
                                if v720 then
                                    utils.console_exec("+attack");
                                    utils.console_exec("+attack2");
                                    utils.execute_after(0.05, function()
                                        utils.console_exec("-attack");
                                        utils.console_exec("-attack2");
                                    end);
                                    return;
                                end;
                            end;
                        elseif v714 == "CHEGrenade" or v714 == "CSmokeGrenade" then
                            local l_grenades_0 = v80.misc.grenades;
                            if l_grenades_0.grenade_type:get("Grenade Release") and v713.m_bPinPulled and l_grenades_0.grenade_release_amount:get() < v711.damage then
                                utils.console_exec("+attack");
                                utils.execute_after(0.1, function()
                                    utils.console_exec("-attack");
                                end);
                            end;
                        end;
                        return;
                    end;
                end;
            end;
        end;
    end;
end;
v597 = {
    no_fall_damage = function(v732)
        -- upvalues: v80 (ref)
        local v733 = entity.get_local_player();
        if not v733 or not v80.misc.movement.no_fall_damage:get() then
            return;
        else
            local v734 = v733:get_origin();
            if v733.m_vecVelocity.z <= -500 then
                if utils.trace_line(vector(v734.x, v734.y, v734.z), vector(v734.x, v734.y, v734.z - 15)).fraction ~= 1 then
                    v732.in_duck = 0;
                elseif utils.trace_line(vector(v734.x, v734.y, v734.z), vector(v734.x, v734.y, v734.z - 55)).fraction ~= 1 then
                    v732.in_duck = 1;
                end;
            end;
            return;
        end;
    end, 
    jumping = function(_)
        -- upvalues: v80 (ref), v57 (ref)
        local v736 = entity.get_local_player();
        if not v736 or not v80.misc.movement.jump_scout:get() then
            v57.air_strafe:override();
            return;
        else
            local v737 = v736:get_player_weapon();
            local v738 = v737 and v737:get_classname() == "CWeaponSSG08";
            if bit.band(v736.m_fFlags, 1) == 0 and v738 then
                if math.sqrt(v736.m_vecVelocity.x * v736.m_vecVelocity.x + v736.m_vecVelocity.y * v736.m_vecVelocity.y) < 250 then
                    v57.air_strafe:override(false);
                else
                    v57.air_strafe:override();
                end;
            else
                v57.air_strafe:override();
            end;
            return;
        end;
    end, 
    fast_ladder = function(v739)
        -- upvalues: v80 (ref)
        local v740 = entity.get_local_player();
        if not v740 or not v80.misc.movement.fast_ladder:get() then
            return;
        else
            if v740.m_MoveType == 9 then
                v739.view_angles.y = math.floor(v739.view_angles.y + 0.5);
                if v739.forwardmove > 0 then
                    if v739.view_angles.x < 45 then
                        v739.view_angles.x = 89;
                        v739.in_moveright = 1;
                        v739.in_moveleft = 0;
                        v739.in_forward = 0;
                        v739.in_back = 1;
                        if v739.sidemove == 0 then
                            v739.view_angles.y = v739.view_angles.y + 90;
                        elseif v739.sidemove < 0 then
                            v739.view_angles.y = v739.view_angles.y + 150;
                        elseif v739.sidemove > 0 then
                            v739.view_angles.y = v739.view_angles.y + 30;
                        end;
                    end;
                elseif v739.forwardmove < 0 then
                    v739.view_angles.x = 89;
                    v739.in_moveleft = 1;
                    v739.in_moveright = 0;
                    v739.in_forward = 1;
                    v739.in_back = 0;
                    if v739.sidemove == 0 then
                        v739.view_angles.y = v739.view_angles.y + 90;
                    elseif v739.sidemove > 0 then
                        v739.view_angles.y = v739.view_angles.y + 150;
                    elseif v739.sidemove < 0 then
                        v739.view_angles.y = v739.view_angles.y + 30;
                    end;
                end;
            end;
            return;
        end;
    end, 
    edge_stop = function(v741)
        -- upvalues: v80 (ref)
        local v742 = entity.get_local_player();
        if not v742 or not v80.misc.movement.edge_stop:get() then
            return;
        else
            local v743 = v742:simulate_movement((v742:get_origin()));
            v743:think(5);
            if v743.velocity.z < 0 then
                v741.block_movement = 2;
            end;
            return;
        end;
    end
};
v598 = render.load_font("Calibri Bold", vector(24, 24), "ad");
v599 = 0;
v600 = 0;
black_box = function(v744, v745, v746, v747, v748, v749, v750, v751)
    -- upvalues: v598 (ref)
    local l_x_6 = render.screen_size().x;
    local v753 = render.screen_size().y + 50;
    if v751 == "100%" then
        local v754 = render.measure_text(v598, "c", v745);
        if v746 == nil and v747 == nil then
            render.gradient(vector(l_x_6 / 40, v753 / 1.43 - 4 - v744), vector(l_x_6 / 40 + v754.x + 5, v753 / 1.43 + 27 - v744), color(0, 0, 0, 50), color(0, 0, 0, 0), color(0, 0, 0, 50), color(0, 0, 0, 0), 0);
            render.gradient(vector(l_x_6 / 40 - 45, v753 / 1.43 - 4 - v744), vector(l_x_6 / 40, v753 / 1.43 + 27 - v744), color(0, 0, 0, 0), color(0, 0, 0, 50), color(0, 0, 0, 0), color(0, 0, 0, 50), 0);
            render.text(v598, vector(l_x_6 / 62, v753 / 1.43 + 3 - v744), color(v748, v749, v750, 255), nil, v745);
        elseif v746 ~= nil and v747 ~= nil then
            render.gradient(vector(l_x_6 / 40, v753 / 1.43 - 4 - v744), vector(l_x_6 / 40 + v754.x, v753 / 1.43 + 27 - v744), color(0, 0, 0, 50), color(0, 0, 0, 0), color(0, 0, 0, 50), color(0, 0, 0, 0), 0);
            render.gradient(vector(l_x_6 / 40 - 45, v753 / 1.43 - 4 - v744), vector(l_x_6 / 40, v753 / 1.43 + 27 - v744), color(0, 0, 0, 0), color(0, 0, 0, 50), color(0, 0, 0, 0), color(0, 0, 0, 50), 0);
            render.text(v598, vector(l_x_6 / 62 + 38, v753 / 1.43 + 3 - v744), color(v748, v749, v750, 255), nil, v745);
            render.texture(v746, vector(l_x_6 / 62, v753 / 1.43 - v744), vector(32, 28), color(v748, v749, v750, 255), f, 0);
            render.circle_outline(vector(l_x_6 / 62 + 70, v753 / 1.43 + 12 - v744), color(10, 10, 10, 255), 10, 0, 1, 5);
            render.circle_outline(vector(l_x_6 / 62 + 70, v753 / 1.43 + 12 - v744), color(200, 200, 200), 9, 0, v747, 3);
        elseif v746 ~= nil and v747 == nil then
            render.gradient(vector(l_x_6 / 40, v753 / 1.43 - 4 - v744), vector(l_x_6 / 40 + v754.x, v753 / 1.43 + 27 - v744), color(0, 0, 0, 50), color(0, 0, 0, 0), color(0, 0, 0, 50), color(0, 0, 0, 0), 0);
            render.gradient(vector(l_x_6 / 40 - 45, v753 / 1.43 - 4 - v744), vector(l_x_6 / 40, v753 / 1.43 + 27 - v744), color(0, 0, 0, 0), color(0, 0, 0, 50), color(0, 0, 0, 0), color(0, 0, 0, 50), 0);
            render.text(v598, vector(l_x_6 / 62 + 38, v753 / 1.43 + 3 - v744), color(v748, v749, v750, 255), nil, v745);
            render.texture(v746, vector(l_x_6 / 62, v753 / 1.43 - v744), vector(32, 28), color(v748, v749, v750, 255), f, 0);
        end;
    end;
end;
events.aim_ack:set(function(v755)
    -- upvalues: v600 (ref), v599 (ref)
    if v755.state then
        v600 = v600 + 1;
    else
        v599 = v599 + 1;
    end;
end);
v601 = {};
events.render:set(function()
    -- upvalues: v80 (ref), v601 (ref), v57 (ref), v599 (ref), v600 (ref)
    local v756 = entity.get_local_player();
    if not v756 or not v756:is_alive() then
        return;
    elseif not v80.misc.indicators or not v80.misc.indicators:get() then
        return;
    elseif not v80.misc.indicators.gamesense_enable:get() then
        return;
    else
        local v757 = v80.misc.indicators.gamesense_type:get();
        local l_gamesense_binds_0 = v80.misc.indicators.gamesense_binds;
        local l_y_9 = render.screen_size().y;
        local _ = 50;
        local _ = l_y_9 - 100;
        local v762 = 36;
        local v763 = "100%";
        local v764 = {};
        local v765 = 0;
        local function v774(v766, v767, v768, v769, v770, v771, v772, v773)
            -- upvalues: v601 (ref), v765 (ref), v762 (ref), v763 (ref)
            if not v767 then
                v601[v773] = nil;
                return false;
            else
                if not v601[v773] then
                    v601[v773] = {
                        current = v765 + v762, 
                        target = v765
                    };
                else
                    v601[v773].target = v765;
                end;
                v601[v773].current = lerp(v601[v773].current, v601[v773].target, 0.1);
                black_box(v601[v773].current, v766, v771, v772, v768, v769, v770, v763);
                v765 = v765 + v762;
                return true;
            end;
        end;
        if v757 == 1 then
            local _ = 0;
            if l_gamesense_binds_0 and l_gamesense_binds_0:get("Double tap") and v57.doubletap and v57.doubletap:get() then
                local v776 = rage.exploit:get() == 1;
                local v777 = "DT";
                if not v764[v777] then
                    if v776 then
                        v774("DT", true, 200, 200, 200, nil, nil, v777);
                    else
                        v774("DT", true, 229, 26, 55, nil, nil, v777);
                    end;
                    v764[v777] = true;
                end;
            end;
            if l_gamesense_binds_0 and l_gamesense_binds_0:get("Dormant") and v57.dormant_aimbot and v57.dormant_aimbot:get() then
                local v778 = "DA";
                if not v764[v778] then
                    v774("DA", true, 200, 200, 200, nil, nil, v778);
                    v764[v778] = true;
                end;
            end;
            if l_gamesense_binds_0 and l_gamesense_binds_0:get("Ping spike") and v57.fake_latency and v57.fake_latency:get() > 0 then
                local v779 = "PING";
                if not v764[v779] then
                    v774("PING", true, 150, 190, 50, nil, nil, v779);
                    v764[v779] = true;
                end;
            end;
            if l_gamesense_binds_0 and l_gamesense_binds_0:get("On shot anti-aim") and v57.hide_shots and v57.hide_shots:get() then
                local v780 = "OSAA";
                if not v764[v780] then
                    v774("OSAA", true, 200, 200, 200, nil, nil, v780);
                    v764[v780] = true;
                end;
            end;
            if l_gamesense_binds_0 and l_gamesense_binds_0:get("Freestanding") and v57.freestanding and v57.freestanding:get_override() then
                local v781 = "FS";
                if not v764[v781] then
                    v774("FS", true, 200, 200, 200, nil, nil, v781);
                    v764[v781] = true;
                end;
            end;
            if l_gamesense_binds_0 and l_gamesense_binds_0:get("Duck peek assist") and v57.fake_duck and v57.fake_duck:get() then
                local v782 = "DUCK";
                if not v764[v782] then
                    v774("DUCK", true, 200, 200, 200, nil, nil, v782);
                    v764[v782] = true;
                end;
            end;
            if l_gamesense_binds_0 and l_gamesense_binds_0:get("Minimum damage override") then
                local v783 = get_bind("Min. Damage");
                local v784 = "MD";
                if v783 and v783[1] and not v764[v784] then
                    v774("MD", true, 200, 200, 200, nil, nil, v784);
                    v764[v784] = true;
                end;
            end;
            if l_gamesense_binds_0 and l_gamesense_binds_0:get("Force safe points") and v57.safe_points and v57.safe_points:get() == "Force" then
                local v785 = "SAFE";
                if not v764[v785] then
                    v774("SAFE", true, 200, 200, 200, nil, nil, v785);
                    v764[v785] = true;
                end;
            end;
            if l_gamesense_binds_0 and l_gamesense_binds_0:get("Force body aim") and v57.body_aim and v57.body_aim:get() == "Force" then
                local v786 = "BODY";
                if not v764[v786] then
                    v774("BODY", true, 200, 200, 200, nil, nil, v786);
                    v764[v786] = true;
                end;
            end;
            if l_gamesense_binds_0 and l_gamesense_binds_0:get("Aimbot stats") then
                local v787 = v599 + v600 > 0 and math.floor(v599 / (v599 + v600) * 100) or 0;
                local v788 = "STATS";
                if not v764[v788] then
                    v774(v599 .. "/" .. v600 .. " (" .. v787 .. "%)", true, 200, 200, 200, nil, nil, v788);
                    v764[v788] = true;
                end;
            end;
            if l_gamesense_binds_0 and l_gamesense_binds_0:get("Spectators") then
                local v789 = entity.get_local_player();
                if v789 then
                    local v790 = v789:get_spectators() or {};
                    local v791 = render.screen_size().x - 5;
                    local v792 = 20;
                    for v793 = 1, #v790 do
                        local v794 = v790[v793]:get_name() or "";
                        render.text(fonts.calibri_bold, vector(v791, v792 + 16 * v793), color(255, 255, 255, 225), "r", v794);
                    end;
                end;
            end;
        elseif v757 == 2 then
            if l_gamesense_binds_0 and l_gamesense_binds_0:get("Double tap") and v57.doubletap and v57.doubletap:get() then
                local v795 = rage.exploit:get() == 1;
                local v796 = "DT";
                if not v764[v796] then
                    if v795 then
                        v774(ui.get_icon("battery-bolt") .. "  DT", true, 200, 200, 200, nil, nil, v796);
                    else
                        v774(ui.get_icon("battery-exclamation") .. "  DT", true, 229, 26, 55, nil, nil, v796);
                    end;
                    v764[v796] = true;
                end;
            end;
            if l_gamesense_binds_0 and l_gamesense_binds_0:get("Dormant") and v57.dormant_aimbot and v57.dormant_aimbot:get() then
                local v797 = "DA";
                if not v764[v797] then
                    v774(ui.get_icon("eye") .. "  DA", true, 200, 200, 200, nil, nil, v797);
                    v764[v797] = true;
                end;
            end;
            if l_gamesense_binds_0 and l_gamesense_binds_0:get("Ping spike") and v57.fake_latency and v57.fake_latency:get() > 0 then
                local v798 = "PING";
                if not v764[v798] then
                    v774(ui.get_icon("signal") .. "  PING", true, 150, 190, 50, nil, nil, v798);
                    v764[v798] = true;
                end;
            end;
            if l_gamesense_binds_0 and l_gamesense_binds_0:get("On shot anti-aim") and v57.hide_shots and v57.hide_shots:get() then
                local v799 = "OSAA";
                if not v764[v799] then
                    v774(ui.get_icon("crosshairs") .. "  OSAA", true, 200, 200, 200, nil, nil, v799);
                    v764[v799] = true;
                end;
            end;
            if l_gamesense_binds_0 and l_gamesense_binds_0:get("Freestanding") and v57.freestanding and v57.freestanding:get_override() then
                local v800 = "FS";
                if not v764[v800] then
                    v774(ui.get_icon("street-view") .. "  FS", true, 200, 200, 200, nil, nil, v800);
                    v764[v800] = true;
                end;
            end;
            if l_gamesense_binds_0 and l_gamesense_binds_0:get("Duck peek assist") and v57.fake_duck and v57.fake_duck:get() then
                local v801 = "DUCK";
                if not v764[v801] then
                    v774(ui.get_icon("person-seat-reclined") .. "   DUCK", true, 200, 200, 200, nil, nil, v801);
                    v764[v801] = true;
                end;
            end;
            if l_gamesense_binds_0 and l_gamesense_binds_0:get("Minimum damage override") then
                local v802 = get_bind("Min. Damage");
                local v803 = "MD";
                if v802 and v802[1] and not v764[v803] then
                    v774(ui.get_icon("claw-marks") .. "  MD", true, 200, 200, 200, nil, nil, v803);
                    v764[v803] = true;
                end;
            end;
            if l_gamesense_binds_0 and l_gamesense_binds_0:get("Force safe points") and v57.safe_points and v57.safe_points:get() == "Force" then
                local v804 = "SAFE";
                if not v764[v804] then
                    v774(ui.get_icon("helmet-safety") .. "  SAFE", true, 200, 200, 200, nil, nil, v804);
                    v764[v804] = true;
                end;
            end;
            if l_gamesense_binds_0 and l_gamesense_binds_0:get("Force body aim") and v57.body_aim and v57.body_aim:get() == "Force" then
                local v805 = "BODY";
                if not v764[v805] then
                    v774(ui.get_icon("kidneys") .. " BODY", true, 200, 200, 200, nil, nil, v805);
                    v764[v805] = true;
                end;
            end;
            if l_gamesense_binds_0 and l_gamesense_binds_0:get("Aimbot stats") then
                local v806 = v599 + v600 > 0 and math.floor(v599 / (v599 + v600) * 100) or 0;
                local v807 = "STATS";
                if not v764[v807] then
                    v774(ui.get_icon("chart-line") .. "  " .. v599 .. "/" .. v600 .. " (" .. v806 .. "%)", true, 200, 200, 200, nil, nil, v807);
                    v764[v807] = true;
                end;
            end;
            if l_gamesense_binds_0 and l_gamesense_binds_0:get("Spectators") then
                local v808 = entity.get_local_player();
                if v808 then
                    local v809 = v808:get_spectators() or {};
                    local v810 = render.screen_size().x - 5;
                    local v811 = 20;
                    for v812 = 1, #v809 do
                        local v813 = v809[v812]:get_name() or "";
                        render.text(fonts.calibri_bold, vector(v810, v811 + 16 * v812), color(255, 255, 255, 225), "r", v813);
                    end;
                end;
            end;
        end;
        return;
    end;
end);
events.round_start:set(function()
    -- upvalues: v599 (ref), v600 (ref)
    v599 = 0;
    v600 = 0;
end);
entity.get_anim_layer = function(v814, v815)
    return ffi.cast("c_animlayers**", ffi.cast("char*", ffi.cast("void***", v814)) + 10640)[0][v815 or 1];
end;
events.post_update_clientside_animation:set(function()
    -- upvalues: v80 (ref), v21 (ref), v57 (ref)
    if not v80.misc.animation:get() then
        return;
    else
        local v816 = entity.get_local_player();
        if not v816 then
            return;
        else
            local v817 = v816.m_vecVelocity:length();
            local l_m_flPoseParameter_0 = v816.m_flPoseParameter;
            local l_animation_0 = v80.misc.animation;
            local v820 = l_animation_0.air:get();
            if v820 == "Static" then
                l_m_flPoseParameter_0[6] = 1;
            elseif v820 == "Moonwalk" and v817 > 5 then
                local v821 = entity.get_anim_layer(v21(v816:get_index()), 6);
                if v821 then
                    v821.m_flWeight = 1;
                end;
            end;
            local v822 = l_animation_0.ground:get();
            if v822 == "Reversed" then
                l_m_flPoseParameter_0[0] = 1;
                v57.leg:override("Sliding");
            elseif v822 == "Moonwalk" then
                l_m_flPoseParameter_0[7] = 1;
                v57.leg:override("Walking");
            end;
            if l_animation_0.addons:get("Move Lean") and v817 >= 3 then
                local v823 = entity.get_anim_layer(v21(v816:get_index()), 12);
                if v823 then
                    v823.m_flWeight = l_animation_0.movelean:get() / 100;
                end;
            end;
            return;
        end;
    end;
end);
aspect_ratio = function()
    -- upvalues: v80 (ref), v232 (ref)
    local v824 = v80.misc.aspect_ratio:get() and v80.misc.aspect_ratio.aspect_ratio:get() / 100 or 3;
    v232 = lerp(v232, v824, 0.05);
    cvar.r_aspectratio:float(v232);
end;
v602 = {
    aspect_ratio_pre5 = 150, 
    aspect_ratio_pre = 160, 
    aspect_ratio_pre4 = 125, 
    aspect_ratio_pre3 = 133, 
    aspect_ratio_pre2 = 177
};
for v825, v826 in pairs(v602) do
    do
        local l_v826_0 = v826;
        v80.misc.aspect_ratio[v825]:set_callback(function()
            -- upvalues: v80 (ref), l_v826_0 (ref)
            v80.misc.aspect_ratio.aspect_ratio:set(l_v826_0);
        end);
    end;
end;
v603 = {
    x = 1, 
    fov = 60, 
    z = -1, 
    y = 1
};
viewmodel = function()
    -- upvalues: v80 (ref), v603 (ref)
    local v828 = v80.misc.viewmodel:get();
    local v829 = v80.misc.viewmodel.default:get();
    local v830 = {
        fov = v829 and 60 or v828 and v80.misc.viewmodel.fov:get() / 10 or 60, 
        x = v829 and 1 or v828 and v80.misc.viewmodel.x:get() / 10 or 1, 
        y = v829 and 1 or v828 and v80.misc.viewmodel.y:get() / 10 or 1, 
        z = v829 and -1 or v828 and v80.misc.viewmodel.z:get() / 10 or -1
    };
    v603.fov = lerp(v603.fov, v830.fov, 0.05);
    v603.x = lerp(v603.x, v830.x, 0.05);
    v603.y = lerp(v603.y, v830.y, 0.05);
    v603.z = lerp(v603.z, v830.z, 0.05);
    cvar.viewmodel_fov:float(v603.fov, true);
    cvar.viewmodel_offset_x:float(v603.x, true);
    cvar.viewmodel_offset_y:float(v603.y, true);
    cvar.viewmodel_offset_z:float(v603.z, true);
    local v831 = entity.get_local_player();
    if not v831 then
        return;
    else
        local v832 = v831:get_player_weapon();
        if not v832 then
            return;
        else
            local v833 = v832:get_classname();
            local v834 = v80.misc.viewmodel.left_knife:get();
            cvar.cl_righthand:int(v833 == "CKnife" and v834 and 0 or 1);
            return;
        end;
    end;
end;
v604 = (function()
    -- upvalues: v80 (ref), v57 (ref)
    local v835 = "stellar";
    local v836 = 1;
    local v837 = 0.2;
    local v838 = 1.3;
    local v839 = 0;
    local v840 = "typing";
    local v841 = "";
    return function()
        -- upvalues: v80 (ref), v57 (ref), v841 (ref), v839 (ref), v837 (ref), v840 (ref), v836 (ref), v835 (ref), v838 (ref)
        if not v80.misc.branded.clantag:get() then
            v57.clantag:override();
            if v841 ~= "" then
                common.set_clan_tag("");
                v841 = "";
            end;
            return;
        else
            v57.clantag:override(false);
            local l_curtime_1 = globals.curtime;
            if l_curtime_1 - v839 < v837 then
                return;
            else
                if v840 == "typing" then
                    v836 = v836 + 1;
                    if v836 > #v835 then
                        v836 = #v835;
                        v840 = "pause_typing";
                        v839 = l_curtime_1;
                        return;
                    end;
                elseif v840 == "pause_typing" then
                    if l_curtime_1 - v839 >= v838 then
                        v840 = "deleting";
                        v836 = 1;
                    else
                        return;
                    end;
                elseif v840 == "deleting" then
                    v836 = v836 + 1;
                    if v836 > #v835 + 1 then
                        v840 = "pause_deleting";
                        v839 = l_curtime_1;
                        return;
                    end;
                elseif v840 == "pause_deleting" then
                    if l_curtime_1 - v839 >= v838 then
                        v840 = "typing";
                        v836 = 1;
                    else
                        return;
                    end;
                end;
                local v843 = "";
                if v840 == "typing" or v840 == "pause_typing" then
                    v843 = v835:sub(1, v836);
                elseif v840 == "deleting" and v836 <= #v835 then
                    v843 = v835:sub(v836);
                end;
                if v843 ~= v841 then
                    common.set_clan_tag(v843);
                    v841 = v843;
                end;
                v839 = l_curtime_1;
                return;
            end;
        end;
    end;
end)();
v605 = {
    [1] = {
        [1] = "fuck", 
        [2] = "bot", 
        [3] = "1", 
        [4] = "\208\188\208\176\209\130\209\140 \208\181\208\177\208\176\208\187 \209\130\208\178\208\190\209\142 \208\182\208\184\209\128\208\189\209\139\208\185", 
        [5] = "\208\190\209\130\209\129\208\190\209\129\208\184 \209\131 stellar.lua"
    }, 
    [2] = {
        [1] = "ez", 
        [2] = "game", 
        [3] = "by stellar"
    }, 
    [3] = {
        [1] = "1 \209\128\208\190\209\130\208\190\208\178\209\139\208\181\208\177\208\176\208\189\208\189\209\139\208\185 \208\191\208\184\208\180\208\176\209\128\208\176\209\129", 
        [2] = "\208\191\208\190\208\187\208\184\209\128\209\131\208\185 \209\143\208\185\208\186\208\184 \208\188\208\190\208\184 \208\188\209\128\208\176\208\183\209\140"
    }, 
    [4] = {
        [1] = "1 \209\130\208\176\209\128\208\176\208\186\208\176\208\189\208\184\209\137\208\181", 
        [2] = "\209\137\208\181\208\189\208\190\208\186 \208\191\208\190\209\136\208\181\208\187 \208\189\208\176\209\133\209\131\208\185", 
        [3] = "\208\190\209\130\208\191\208\190\208\187\208\184\209\128\209\131\208\185 \209\133\209\131\209\143\208\186\209\131 \208\188\208\189\208\181 \209\128\209\130\208\190\208\188 \208\188\208\176\209\130\208\181\209\128\208\184 \209\129\208\178\208\190\208\181\208\185"
    }, 
    [5] = {
        [1] = "\208\182\208\184\209\128\208\190\208\181\208\177\208\187\209\139\208\185 \209\130\208\190\208\187\209\129\209\130\208\190\208\191\209\131\208\183 \208\191\208\190\208\180\208\189\208\184\208\188\208\184\209\129\209\140 \209\129 \208\186\208\190\208\187\208\181\208\189", 
        [2] = "\209\129\208\176\208\186\208\176\208\185 \209\133\209\131\208\185 \208\188\208\189\208\181 \209\131\209\129\208\176\209\130\209\139\208\185 \208\191\208\184\208\180\208\190\209\128\208\176\209\129"
    }, 
    [6] = {
        [1] = "\208\178\209\139\208\181\208\177\208\176\208\189", 
        [2] = "1"
    }, 
    [7] = {
        [1] = "\208\182\208\184\209\128\208\190\208\178\208\190\208\183 \208\191\208\176\208\191\208\189\208\184 \208\188\208\176\208\187\208\184", 
        [2] = "\208\178\209\129\208\190\209\129\208\184 \208\188\208\189\208\181 \209\131\208\177\208\187\209\142\208\180\208\190\208\186 \208\182\208\184\209\128\208\189\209\139\208\185"
    }, 
    [8] = {
        [1] = "$$$$$$$$$$$$$$$$$$$$$$$$$$", 
        [2] = "\208\188\208\176\209\130\209\140 \208\181\208\177\208\176\208\187"
    }
};
v606 = {
    [1] = {
        [1] = "no way", 
        [2] = "i die", 
        [3] = "wtf", 
        [4] = "\208\148\208\144 \208\154\208\144\208\154 \208\162\208\171 \208\156\208\149\208\157\208\175 \208\163\208\145\208\152\208\155 \208\161\208\171\208\157 \208\168\208\155\208\174\208\165\208\152"
    }, 
    [2] = {
        [1] = "gg", 
        [2] = "i was lagging", 
        [3] = ":(", 
        [4] = "\208\178\208\181\208\183\209\131\209\135\208\184\208\185 \208\191\208\184\208\180\208\190\209\128\208\176\209\129"
    }, 
    [3] = {
        [1] = "\208\191\208\190\208\178\208\181\208\183\208\187\208\190 \209\130\208\181\208\177\208\181 \209\133\209\131\208\185\208\189\209\143 \209\130\208\190\208\187\209\129\209\130\208\176\209\143", 
        [2] = "\208\183\208\176\208\191\209\131\209\130\208\176\208\187\209\129\209\143 \208\178 \208\186\208\189\208\190\208\191\208\186\208\176\209\133 \208\184 \208\186\208\176\208\186 \209\130\208\190 \209\131\208\177\208\184\208\187 \208\182\208\184\209\128\208\189\209\139\208\185 \209\133\209\131\208\185\208\187\208\176\208\189"
    }, 
    [4] = {
        [1] = "\208\182\208\180\208\184 \208\191\208\184\208\180\208\176\209\128\208\176\209\129 \208\178 \209\129\208\187\208\181\208\180\209\131\209\142\209\137\208\181\208\188 \209\128\208\176\209\131\208\189\208\180\208\181 \209\143 \208\181\208\177\208\189\209\131 \209\130\208\181\208\177\209\143 \208\184 \208\188\208\176\208\188\208\176\209\136\209\131 \209\130\208\178\208\190\209\142 \209\130\208\190\208\191\208\190\209\128\208\190\208\188", 
        [2] = ")"
    }, 
    [5] = {
        [1] = "\208\178\208\181\208\183\209\131\209\135\208\184\208\185 \209\133\209\131\208\181\209\129\208\190\209\129", 
        [2] = "\208\191\208\184\208\183\208\180\208\181\209\134", 
        [3] = "\208\179\208\176\208\189\208\180\208\190\208\189"
    }, 
    [6] = {
        [1] = "\208\159\208\158\208\146\208\149\208\151\208\155\208\158 \208\161\208\158\208\155\208\149\208\146\208\158\208\156\208\163 \208\159\208\144\208\160\208\144\208\157\208\158\208\152\208\154\208\163", 
        [2] = "\209\135\208\181 \209\130\209\139 \209\129\208\180\208\181\208\187\208\176\208\187 \209\131\208\177\208\187\209\142\208\180\208\190\208\186"
    }
};
v607 = {
    [1] = {
        [1] = "avenged", 
        [2] = "you", 
        [3] = "idiot"
    }, 
    [2] = {
        [1] = "lol", 
        [2] = "deserved", 
        [3] = "noob"
    }
};
local v844 = {};
trashtalk = function(v845)
    -- upvalues: v80 (ref), v605 (ref), v606 (ref), v844 (ref), v607 (ref)
    local v846 = entity.get_local_player();
    if not v846 or not v846:is_alive() then
        return;
    elseif not v80.misc.branded.shit_talking:get() then
        return;
    else
        local v847 = v846:get_player_info();
        if not v847 then
            return;
        else
            local l_userid_0 = v847.userid;
            local v849 = entity.get(v845.userid, true);
            local v850 = entity.get(v845.attacker, true);
            local v851 = v849 and v849:get_player_info();
            local v852 = v850 and v850:get_player_info();
            local v853 = v851 and v851.userid or -1;
            local v854 = v852 and v852.userid or -1;
            local v855 = nil;
            if v80.misc.branded.shit_talking_type:get("Kill") and l_userid_0 == v854 and v853 ~= l_userid_0 then
                v855 = v605[math.random(#v605)];
            elseif v80.misc.branded.shit_talking_type:get("Death") and l_userid_0 == v853 and v854 ~= l_userid_0 then
                v855 = v606[math.random(#v606)];
                v844[l_userid_0] = v854;
            elseif v80.misc.branded.shit_talking_type:get("Revenge") and v844[l_userid_0] == v853 then
                v855 = v607[math.random(#v607)];
                v844[l_userid_0] = nil;
            end;
            if v855 then
                for v856, v857 in ipairs(v855) do
                    do
                        local l_v857_0 = v857;
                        utils.execute_after(v856 - 1.5, function()
                            -- upvalues: l_v857_0 (ref)
                            utils.console_exec("say " .. l_v857_0);
                        end);
                    end;
                end;
            end;
            return;
        end;
    end;
end;
events.player_death:set(trashtalk);
local v859 = {};
events.render:set(function(_)
    -- upvalues: v80 (ref), v59 (ref), v859 (ref)
    local v861 = {
        [1] = {
            [1] = nil, 
            [2] = "Manual Yaw", 
            [1] = v80.antiaim.manual
        }, 
        [2] = {
            [1] = nil, 
            [2] = "Freestanding", 
            [1] = v80.antiaim.freestanding
        }, 
        [3] = {
            [1] = nil, 
            [2] = "Safe Head", 
            [1] = v80.antiaim.safe_head
        }, 
        [4] = {
            [1] = nil, 
            [2] = "Avoid Backstab", 
            [1] = v80.antiaim.avoid_backstab
        }, 
        [5] = {
            [1] = nil, 
            [2] = "Indicators", 
            [1] = v80.misc.indicators
        }, 
        [6] = {
            [1] = nil, 
            [2] = "Animation", 
            [1] = v80.misc.animation
        }, 
        [7] = {
            [1] = nil, 
            [2] = "Scope Overlay", 
            [1] = v80.misc.scope_overlay
        }, 
        [8] = {
            [1] = nil, 
            [2] = "Aimbot Logs", 
            [1] = v80.misc.aimbot_logs
        }, 
        [9] = {
            [1] = nil, 
            [2] = "Automatic Peek", 
            [1] = v80.misc.automatic_peek
        }, 
        [10] = {
            [1] = nil, 
            [2] = "Dormant Aimbot", 
            [1] = v80.misc.dormant_aimbot
        }, 
        [11] = {
            [1] = nil, 
            [2] = "Hitchance Override", 
            [1] = v80.misc.hitchance_override
        }, 
        [12] = {
            [1] = nil, 
            [2] = "Grenades", 
            [1] = v80.misc.grenades
        }, 
        [13] = {
            [1] = nil, 
            [2] = "Branding", 
            [1] = v80.misc.branded
        }, 
        [14] = {
            [1] = nil, 
            [2] = "Movement", 
            [1] = v80.misc.movement
        }, 
        [15] = {
            [1] = nil, 
            [2] = "Aspect Ratio", 
            [1] = v80.misc.aspect_ratio
        }, 
        [16] = {
            [1] = nil, 
            [2] = "Viewmodel", 
            [1] = v80.misc.viewmodel
        }
    };
    for v862 = 1, #builder do
        if builder[v862] and builder[v862].enabled then
            table.insert(v861, {
                [1] = builder[v862].enabled, 
                [2] = "Override \v" .. (v59.state and v59.state[v862] or "State " .. v862)
            });
        end;
    end;
    for _, v864 in ipairs(v861) do
        local v865 = v864[1];
        local v866 = v864[2];
        if v865 then
            local v867 = v865:get();
            if v859[v865] ~= v867 then
                v859[v865] = v867;
                v865:name((v867 and "\v\226\128\162" or "\a363636FF\226\128\162") .. "   \r" .. v866);
            end;
        end;
    end;
end);
config_system = function()
    -- upvalues: l_pui_0 (ref), v80 (ref), l_base64_0 (ref), l_clipboard_0 (ref)
    local v868 = common.get_username();
    local v869 = l_pui_0.setup({
        [1] = v80, 
        [2] = builder
    }, true);
    local v870 = "eyJkYXRhIjpbeyJhbnRpYWltIjp7ImF2b2lkX2JhY2tzdGFiIjpmYWxzZSwiY29uZGl0aW9ucyI6IkFlcm9iaWMiLCJmcmVlc3RhbmRpbmciOmZhbHNlLCJtYW51YWwiOiJEaXNhYmxlZCIsIm1vZGUiOiJTaW5nbGUiLCJzYWZlX2hlYWQiOmZhbHNlLCJ0ZWFtcyI6IkNUIiwifmZyZWVzdGFuZGluZyI6eyJib2R5X2ZyZWVzdGFuZGluZyI6ZmFsc2UsImRpc2FibGVfeWF3X21vZGlmaWVycyI6ZmFsc2UsImRpc2FibGVycyI6WyJ+Il19LCJ+bWFudWFsIjp7InN0YXRpYyI6ZmFsc2V9LCJ+c2FmZV9oZWFkIjp7InN0YXRlIjpbIn4iXX19LCJjb25maWdzIjp7Imxpc3QiOjIuMCwidGV4dCI6Im1pcmEifSwibWFpbiI6eyJjYXRlZ29yaWVzIjo0LjB9fSxbeyJjdCI6eyJib2R5X3lhdyI6Mi4wLCJsZWZ0IjowLjAsIm1vZGlmaWVyIjoyLjAsIm1vZGlmaWVyX2NlbnRlciI6MC4wLCJtb2RpZmllcl9vZmZzZXQiOjAuMCwibW9kaWZpZXJfcmFuZG9tIjowLjAsIm9mZnNldCI6MC4wLCJyaWdodCI6MC4wLCJ0eXBlIjoyLjAsIn5ib2R5X3lhdyI6eyJib2R5X3lhd19kZWxheSI6MS4wLCJib2R5X3lhd19kZWxheV9jaG9rZSI6MC4wLCJib2R5X3lhd19kZWxheV9tYXgiOjEuMCwiYm9keV95YXdfZGVsYXlfbWluIjoxLjAsImJvZHlfeWF3X2RlbGF5X3BoYXNlIjowLjAsImJvZHlfeWF3X2RlbGF5X3JhbmRvbV92YWx1ZSI6MC4wLCJib2R5X3lhd19kZWxheV90eXBlIjoxLjAsImJvZHlfeWF3X2xlZnQiOjYwLjAsImJvZHlfeWF3X21vZGVybl9saW1pdCI6NjAuMCwiYm9keV95YXdfcmFuZG9taXplX3ZhbHVlIjowLjAsImJvZHlfeWF3X3JpZ2h0Ijo2MC4wfSwifmxlZnQiOnsibGVmdF9yYW5kb21pemVfdmFsdWUiOjAuMH0sIn5tb2RpZmllcl9jZW50ZXIiOnsibW9kaWZpZXJfbWF4IjowLjAsIm1vZGlmaWVyX21pbiI6MC4wLCJtb2RpZmllcl9yYW5kb21pemVfdmFsdWUiOjAuMCwibW9kaWZpZXJfdHlwZSI6MS4wfSwifm1vZGlmaWVyX29mZnNldCI6eyJtb2RpZmllcl9tYXgiOjAuMCwibW9kaWZpZXJfbWluIjowLjAsIm1vZGlmaWVyX3JhbmRvbWl6ZV92YWx1ZSI6MC4wLCJtb2RpZmllcl90eXBlIjoxLjB9LCJ+bW9kaWZpZXJfcmFuZG9tIjp7Im1vZGlmaWVyX21heCI6MC4wLCJtb2RpZmllcl9taW4iOjAuMCwibW9kaWZpZXJfcmFuZG9taXplX3ZhbHVlIjowLjAsIm1vZGlmaWVyX3R5cGUiOjEuMH0sIn5yaWdodCI6eyJyaWdodF9yYW5kb21pemVfdmFsdWUiOjAuMH19LCJlbmFibGVkIjpmYWxzZSwic2luZ2xlIjp7ImJvZHlfeWF3IjowLjAsImxlZnQiOjAuMCwibW9kaWZpZXIiOjAuMCwibW9kaWZpZXJfY2VudGVyIjowLjAsIm1vZGlmaWVyX29mZnNldCI6MC4wLCJtb2RpZmllcl9yYW5kb20iOjAuMCwib2Zmc2V0IjowLjAsInJpZ2h0IjowLjAsInR5cGUiOjAuMCwifmJvZHlfeWF3Ijp7ImJvZHlfeWF3X2RlbGF5IjoxLjAsImJvZHlfeWF3X2RlbGF5X2Nob2tlIjowLjAsImJvZHlfeWF3X2RlbGF5X21heCI6MS4wLCJib2R5X3lhd19kZWxheV9taW4iOjEuMCwiYm9keV95YXdfZGVsYXlfcGhhc2UiOjAuMCwiYm9keV95YXdfZGVsYXlfcmFuZG9tX3ZhbHVlIjowLjAsImJvZHlfeWF3X2RlbGF5X3R5cGUiOjEuMCwiYm9keV95YXdfbGVmdCI6NjAuMCwiYm9keV95YXdfbW9kZXJuX2xpbWl0Ijo2MC4wLCJib2R5X3lhd19yYW5kb21pemVfdmFsdWUiOjAuMCwiYm9keV95YXdfcmlnaHQiOjYwLjB9LCJ+bGVmdCI6eyJsZWZ0X3JhbmRvbWl6ZV92YWx1ZSI6MC4wfSwifm1vZGlmaWVyX2NlbnRlciI6eyJtb2RpZmllcl9tYXgiOjAuMCwibW9kaWZpZXJfbWluIjowLjAsIm1vZGlmaWVyX3JhbmRvbWl6ZV92YWx1ZSI6MC4wLCJtb2RpZmllcl90eXBlIjoxLjB9LCJ+bW9kaWZpZXJfb2Zmc2V0Ijp7Im1vZGlmaWVyX21heCI6MC4wLCJtb2RpZmllcl9taW4iOjAuMCwibW9kaWZpZXJfcmFuZG9taXplX3ZhbHVlIjowLjAsIm1vZGlmaWVyX3R5cGUiOjEuMH0sIn5tb2RpZmllcl9yYW5kb20iOnsibW9kaWZpZXJfbWF4IjowLjAsIm1vZGlmaWVyX21pbiI6MC4wLCJtb2RpZmllcl9yYW5kb21pemVfdmFsdWUiOjAuMCwibW9kaWZpZXJfdHlwZSI6MS4wfSwifnJpZ2h0Ijp7InJpZ2h0X3JhbmRvbWl6ZV92YWx1ZSI6MC4wfX0sInQiOnsiYm9keV95YXciOjAuMCwibGVmdCI6MC4wLCJtb2RpZmllciI6MC4wLCJtb2RpZmllcl9jZW50ZXIiOjAuMCwibW9kaWZpZXJfb2Zmc2V0IjowLjAsIm1vZGlmaWVyX3JhbmRvbSI6MC4wLCJvZmZzZXQiOjAuMCwicmlnaHQiOjAuMCwidHlwZSI6MC4wLCJ+Ym9keV95YXciOnsiYm9keV95YXdfZGVsYXkiOjEuMCwiYm9keV95YXdfZGVsYXlfY2hva2UiOjAuMCwiYm9keV95YXdfZGVsYXlfbWF4IjoxLjAsImJvZHlfeWF3X2RlbGF5X21pbiI6MS4wLCJib2R5X3lhd19kZWxheV9waGFzZSI6MC4wLCJib2R5X3lhd19kZWxheV9yYW5kb21fdmFsdWUiOjAuMCwiYm9keV95YXdfZGVsYXlfdHlwZSI6MS4wLCJib2R5X3lhd19sZWZ0Ijo2MC4wLCJib2R5X3lhd19tb2Rlcm5fbGltaXQiOjYwLjAsImJvZHlfeWF3X3JhbmRvbWl6ZV92YWx1ZSI6MC4wLCJib2R5X3lhd19yaWdodCI6NjAuMH0sIn5sZWZ0Ijp7ImxlZnRfcmFuZG9taXplX3ZhbHVlIjowLjB9LCJ+bW9kaWZpZXJfY2VudGVyIjp7Im1vZGlmaWVyX21heCI6MC4wLCJtb2RpZmllcl9taW4iOjAuMCwibW9kaWZpZXJfcmFuZG9taXplX3ZhbHVlIjowLjAsIm1vZGlmaWVyX3R5cGUiOjEuMH0sIn5tb2RpZmllcl9vZmZzZXQiOnsibW9kaWZpZXJfbWF4IjowLjAsIm1vZGlmaWVyX21pbiI6MC4wLCJtb2RpZmllcl9yYW5kb21pemVfdmFsdWUiOjAuMCwibW9kaWZpZXJfdHlwZSI6MS4wfSwifm1vZGlmaWVyX3JhbmRvbSI6eyJtb2RpZmllcl9tYXgiOjAuMCwibW9kaWZpZXJfbWluIjowLjAsIm1vZGlmaWVyX3JhbmRvbWl6ZV92YWx1ZSI6MC4wLCJtb2RpZmllcl90eXBlIjoxLjB9LCJ+cmlnaHQiOnsicmlnaHRfcmFuZG9taXplX3ZhbHVlIjowLjB9fX0seyJjdCI6eyJib2R5X3lhdyI6MC4wLCJsZWZ0IjowLjAsIm1vZGlmaWVyIjowLjAsIm1vZGlmaWVyX2NlbnRlciI6MC4wLCJtb2RpZmllcl9vZmZzZXQiOjAuMCwibW9kaWZpZXJfcmFuZG9tIjowLjAsIm9mZnNldCI6MC4wLCJyaWdodCI6MC4wLCJ0eXBlIjowLjAsIn5ib2R5X3lhdyI6eyJib2R5X3lhd19kZWxheSI6MS4wLCJib2R5X3lhd19kZWxheV9jaG9rZSI6MC4wLCJib2R5X3lhd19kZWxheV9tYXgiOjEuMCwiYm9keV95YXdfZGVsYXlfbWluIjoxLjAsImJvZHlfeWF3X2RlbGF5X3BoYXNlIjowLjAsImJvZHlfeWF3X2RlbGF5X3JhbmRvbV92YWx1ZSI6MC4wLCJib2R5X3lhd19kZWxheV90eXBlIjoxLjAsImJvZHlfeWF3X2xlZnQiOjYwLjAsImJvZHlfeWF3X21vZGVybl9saW1pdCI6NjAuMCwiYm9keV95YXdfcmFuZG9taXplX3ZhbHVlIjowLjAsImJvZHlfeWF3X3JpZ2h0Ijo2MC4wfSwifmxlZnQiOnsibGVmdF9yYW5kb21pemVfdmFsdWUiOjAuMH0sIn5tb2RpZmllcl9jZW50ZXIiOnsibW9kaWZpZXJfbWF4IjowLjAsIm1vZGlmaWVyX21pbiI6MC4wLCJtb2RpZmllcl9yYW5kb21pemVfdmFsdWUiOjAuMCwibW9kaWZpZXJfdHlwZSI6MS4wfSwifm1vZGlmaWVyX29mZnNldCI6eyJtb2RpZmllcl9tYXgiOjAuMCwibW9kaWZpZXJfbWluIjowLjAsIm1vZGlmaWVyX3JhbmRvbWl6ZV92YWx1ZSI6MC4wLCJtb2RpZmllcl90eXBlIjoxLjB9LCJ+bW9kaWZpZXJfcmFuZG9tIjp7Im1vZGlmaWVyX21heCI6MC4wLCJtb2RpZmllcl9taW4iOjAuMCwibW9kaWZpZXJfcmFuZG9taXplX3ZhbHVlIjowLjAsIm1vZGlmaWVyX3R5cGUiOjEuMH0sIn5yaWdodCI6eyJyaWdodF9yYW5kb21pemVfdmFsdWUiOjAuMH19LCJlbmFibGVkIjp0cnVlLCJzaW5nbGUiOnsiYm9keV95YXciOjIuMCwibGVmdCI6LTIxLjAsIm1vZGlmaWVyIjoyLjAsIm1vZGlmaWVyX2NlbnRlciI6LTkuMCwibW9kaWZpZXJfb2Zmc2V0IjowLjAsIm1vZGlmaWVyX3JhbmRvbSI6MC4wLCJvZmZzZXQiOjAuMCwicmlnaHQiOjE5LjAsInR5cGUiOjIuMCwifmJvZHlfeWF3Ijp7ImJvZHlfeWF3X2RlbGF5IjoxLjAsImJvZHlfeWF3X2RlbGF5X2Nob2tlIjowLjAsImJvZHlfeWF3X2RlbGF5X21heCI6MS4wLCJib2R5X3lhd19kZWxheV9taW4iOjEuMCwiYm9keV95YXdfZGVsYXlfcGhhc2UiOjAuMCwiYm9keV95YXdfZGVsYXlfcmFuZG9tX3ZhbHVlIjowLjAsImJvZHlfeWF3X2RlbGF5X3R5cGUiOjIuMCwiYm9keV95YXdfbGVmdCI6NjAuMCwiYm9keV95YXdfbW9kZXJuX2xpbWl0Ijo2MC4wLCJib2R5X3lhd19yYW5kb21pemVfdmFsdWUiOjAuMCwiYm9keV95YXdfcmlnaHQiOjYwLjB9LCJ+bGVmdCI6eyJsZWZ0X3JhbmRvbWl6ZV92YWx1ZSI6MC4wfSwifm1vZGlmaWVyX2NlbnRlciI6eyJtb2RpZmllcl9tYXgiOjAuMCwibW9kaWZpZXJfbWluIjowLjAsIm1vZGlmaWVyX3JhbmRvbWl6ZV92YWx1ZSI6MTIuMCwibW9kaWZpZXJfdHlwZSI6MS4wfSwifm1vZGlmaWVyX29mZnNldCI6eyJtb2RpZmllcl9tYXgiOjAuMCwibW9kaWZpZXJfbWluIjowLjAsIm1vZGlmaWVyX3JhbmRvbWl6ZV92YWx1ZSI6MC4wLCJtb2RpZmllcl90eXBlIjoxLjB9LCJ+bW9kaWZpZXJfcmFuZG9tIjp7Im1vZGlmaWVyX21heCI6MC4wLCJtb2RpZmllcl9taW4iOjAuMCwibW9kaWZpZXJfcmFuZG9taXplX3ZhbHVlIjowLjAsIm1vZGlmaWVyX3R5cGUiOjEuMH0sIn5yaWdodCI6eyJyaWdodF9yYW5kb21pemVfdmFsdWUiOjAuMH19LCJ0Ijp7ImJvZHlfeWF3IjowLjAsImxlZnQiOjAuMCwibW9kaWZpZXIiOjAuMCwibW9kaWZpZXJfY2VudGVyIjowLjAsIm1vZGlmaWVyX29mZnNldCI6MC4wLCJtb2RpZmllcl9yYW5kb20iOjAuMCwib2Zmc2V0IjowLjAsInJpZ2h0IjowLjAsInR5cGUiOjAuMCwifmJvZHlfeWF3Ijp7ImJvZHlfeWF3X2RlbGF5IjoxLjAsImJvZHlfeWF3X2RlbGF5X2Nob2tlIjowLjAsImJvZHlfeWF3X2RlbGF5X21heCI6MS4wLCJib2R5X3lhd19kZWxheV9taW4iOjEuMCwiYm9keV95YXdfZGVsYXlfcGhhc2UiOjAuMCwiYm9keV95YXdfZGVsYXlfcmFuZG9tX3ZhbHVlIjowLjAsImJvZHlfeWF3X2RlbGF5X3R5cGUiOjEuMCwiYm9keV95YXdfbGVmdCI6NjAuMCwiYm9keV95YXdfbW9kZXJuX2xpbWl0Ijo2MC4wLCJib2R5X3lhd19yYW5kb21pemVfdmFsdWUiOjAuMCwiYm9keV95YXdfcmlnaHQiOjYwLjB9LCJ+bGVmdCI6eyJsZWZ0X3JhbmRvbWl6ZV92YWx1ZSI6MC4wfSwifm1vZGlmaWVyX2NlbnRlciI6eyJtb2RpZmllcl9tYXgiOjAuMCwibW9kaWZpZXJfbWluIjowLjAsIm1vZGlmaWVyX3JhbmRvbWl6ZV92YWx1ZSI6MC4wLCJtb2RpZmllcl90eXBlIjoxLjB9LCJ+bW9kaWZpZXJfb2Zmc2V0Ijp7Im1vZGlmaWVyX21heCI6MC4wLCJtb2RpZmllcl9taW4iOjAuMCwibW9kaWZpZXJfcmFuZG9taXplX3ZhbHVlIjowLjAsIm1vZGlmaWVyX3R5cGUiOjEuMH0sIn5tb2RpZmllcl9yYW5kb20iOnsibW9kaWZpZXJfbWF4IjowLjAsIm1vZGlmaWVyX21pbiI6MC4wLCJtb2RpZmllcl9yYW5kb21pemVfdmFsdWUiOjAuMCwibW9kaWZpZXJfdHlwZSI6MS4wfSwifnJpZ2h0Ijp7InJpZ2h0X3JhbmRvbWl6ZV92YWx1ZSI6MC4wfX19LHsiY3QiOnsiYm9keV95YXciOjAuMCwibGVmdCI6MC4wLCJtb2RpZmllciI6MC4wLCJtb2RpZmllcl9jZW50ZXIiOjAuMCwibW9kaWZpZXJfb2Zmc2V0IjowLjAsIm1vZGlmaWVyX3JhbmRvbSI6MC4wLCJvZmZzZXQiOjAuMCwicmlnaHQiOjAuMCwidHlwZSI6MC4wLCJ+Ym9keV95YXciOnsiYm9keV95YXdfZGVsYXkiOjEuMCwiYm9keV95YXdfZGVsYXlfY2hva2UiOjAuMCwiYm9keV95YXdfZGVsYXlfbWF4IjoxLjAsImJvZHlfeWF3X2RlbGF5X21pbiI6MS4wLCJib2R5X3lhd19kZWxheV9waGFzZSI6MC4wLCJib2R5X3lhd19kZWxheV9yYW5kb21fdmFsdWUiOjAuMCwiYm9keV95YXdfZGVsYXlfdHlwZSI6MS4wLCJib2R5X3lhd19sZWZ0Ijo2MC4wLCJib2R5X3lhd19tb2Rlcm5fbGltaXQiOjYwLjAsImJvZHlfeWF3X3JhbmRvbWl6ZV92YWx1ZSI6MC4wLCJib2R5X3lhd19yaWdodCI6NjAuMH0sIn5sZWZ0Ijp7ImxlZnRfcmFuZG9taXplX3ZhbHVlIjowLjB9LCJ+bW9kaWZpZXJfY2VudGVyIjp7Im1vZGlmaWVyX21heCI6MC4wLCJtb2RpZmllcl9taW4iOjAuMCwibW9kaWZpZXJfcmFuZG9taXplX3ZhbHVlIjowLjAsIm1vZGlmaWVyX3R5cGUiOjEuMH0sIn5tb2RpZmllcl9vZmZzZXQiOnsibW9kaWZpZXJfbWF4IjowLjAsIm1vZGlmaWVyX21pbiI6MC4wLCJtb2RpZmllcl9yYW5kb21pemVfdmFsdWUiOjAuMCwibW9kaWZpZXJfdHlwZSI6MS4wfSwifm1vZGlmaWVyX3JhbmRvbSI6eyJtb2RpZmllcl9tYXgiOjAuMCwibW9kaWZpZXJfbWluIjowLjAsIm1vZGlmaWVyX3JhbmRvbWl6ZV92YWx1ZSI6MC4wLCJtb2RpZmllcl90eXBlIjoxLjB9LCJ+cmlnaHQiOnsicmlnaHRfcmFuZG9taXplX3ZhbHVlIjowLjB9fSwiZW5hYmxlZCI6dHJ1ZSwic2luZ2xlIjp7ImJvZHlfeWF3IjoxLjAsImxlZnQiOi0xOS4wLCJtb2RpZmllciI6MS4wLCJtb2RpZmllcl9jZW50ZXIiOjAuMCwibW9kaWZpZXJfb2Zmc2V0IjotNy4wLCJtb2RpZmllcl9yYW5kb20iOjAuMCwib2Zmc2V0IjowLjAsInJpZ2h0IjoyNy4wLCJ0eXBlIjoyLjAsIn5ib2R5X3lhdyI6eyJib2R5X3lhd19kZWxheSI6Mi4wLCJib2R5X3lhd19kZWxheV9jaG9rZSI6MC4wLCJib2R5X3lhd19kZWxheV9tYXgiOjQuMCwiYm9keV95YXdfZGVsYXlfbWluIjoyLjAsImJvZHlfeWF3X2RlbGF5X3BoYXNlIjowLjAsImJvZHlfeWF3X2RlbGF5X3JhbmRvbV92YWx1ZSI6MC4wLCJib2R5X3lhd19kZWxheV90eXBlIjoyLjAsImJvZHlfeWF3X2xlZnQiOjYwLjAsImJvZHlfeWF3X21vZGVybl9saW1pdCI6NjAuMCwiYm9keV95YXdfcmFuZG9taXplX3ZhbHVlIjowLjAsImJvZHlfeWF3X3JpZ2h0Ijo2MC4wfSwifmxlZnQiOnsibGVmdF9yYW5kb21pemVfdmFsdWUiOjEyLjB9LCJ+bW9kaWZpZXJfY2VudGVyIjp7Im1vZGlmaWVyX21heCI6MC4wLCJtb2RpZmllcl9taW4iOjAuMCwibW9kaWZpZXJfcmFuZG9taXplX3ZhbHVlIjowLjAsIm1vZGlmaWVyX3R5cGUiOjEuMH0sIn5tb2RpZmllcl9vZmZzZXQiOnsibW9kaWZpZXJfbWF4IjowLjAsIm1vZGlmaWVyX21pbiI6MC4wLCJtb2RpZmllcl9yYW5kb21pemVfdmFsdWUiOjYuMCwibW9kaWZpZXJfdHlwZSI6MS4wfSwifm1vZGlmaWVyX3JhbmRvbSI6eyJtb2RpZmllcl9tYXgiOjAuMCwibW9kaWZpZXJfbWluIjowLjAsIm1vZGlmaWVyX3JhbmRvbWl6ZV92YWx1ZSI6MC4wLCJtb2RpZmllcl90eXBlIjoxLjB9LCJ+cmlnaHQiOnsicmlnaHRfcmFuZG9taXplX3ZhbHVlIjoxMS4wfX0sInQiOnsiYm9keV95YXciOjAuMCwibGVmdCI6MC4wLCJtb2RpZmllciI6MC4wLCJtb2RpZmllcl9jZW50ZXIiOjAuMCwibW9kaWZpZXJfb2Zmc2V0IjowLjAsIm1vZGlmaWVyX3JhbmRvbSI6MC4wLCJvZmZzZXQiOjAuMCwicmlnaHQiOjAuMCwidHlwZSI6MC4wLCJ+Ym9keV95YXciOnsiYm9keV95YXdfZGVsYXkiOjEuMCwiYm9keV95YXdfZGVsYXlfY2hva2UiOjAuMCwiYm9keV95YXdfZGVsYXlfbWF4IjoxLjAsImJvZHlfeWF3X2RlbGF5X21pbiI6MS4wLCJib2R5X3lhd19kZWxheV9waGFzZSI6MC4wLCJib2R5X3lhd19kZWxheV9yYW5kb21fdmFsdWUiOjAuMCwiYm9keV95YXdfZGVsYXlfdHlwZSI6MS4wLCJib2R5X3lhd19sZWZ0Ijo2MC4wLCJib2R5X3lhd19tb2Rlcm5fbGltaXQiOjYwLjAsImJvZHlfeWF3X3JhbmRvbWl6ZV92YWx1ZSI6MC4wLCJib2R5X3lhd19yaWdodCI6NjAuMH0sIn5sZWZ0Ijp7ImxlZnRfcmFuZG9taXplX3ZhbHVlIjowLjB9LCJ+bW9kaWZpZXJfY2VudGVyIjp7Im1vZGlmaWVyX21heCI6MC4wLCJtb2RpZmllcl9taW4iOjAuMCwibW9kaWZpZXJfcmFuZG9taXplX3ZhbHVlIjowLjAsIm1vZGlmaWVyX3R5cGUiOjEuMH0sIn5tb2RpZmllcl9vZmZzZXQiOnsibW9kaWZpZXJfbWF4IjowLjAsIm1vZGlmaWVyX21pbiI6MC4wLCJtb2RpZmllcl9yYW5kb21pemVfdmFsdWUiOjAuMCwibW9kaWZpZXJfdHlwZSI6MS4wfSwifm1vZGlmaWVyX3JhbmRvbSI6eyJtb2RpZmllcl9tYXgiOjAuMCwibW9kaWZpZXJfbWluIjowLjAsIm1vZGlmaWVyX3JhbmRvbWl6ZV92YWx1ZSI6MC4wLCJtb2RpZmllcl90eXBlIjoxLjB9LCJ+cmlnaHQiOnsicmlnaHRfcmFuZG9taXplX3ZhbHVlIjowLjB9fX0seyJjdCI6eyJib2R5X3lhdyI6MC4wLCJsZWZ0IjowLjAsIm1vZGlmaWVyIjowLjAsIm1vZGlmaWVyX2NlbnRlciI6MC4wLCJtb2RpZmllcl9vZmZzZXQiOjAuMCwibW9kaWZpZXJfcmFuZG9tIjowLjAsIm9mZnNldCI6MC4wLCJyaWdodCI6MC4wLCJ0eXBlIjowLjAsIn5ib2R5X3lhdyI6eyJib2R5X3lhd19kZWxheSI6MS4wLCJib2R5X3lhd19kZWxheV9jaG9rZSI6MC4wLCJib2R5X3lhd19kZWxheV9tYXgiOjEuMCwiYm9keV95YXdfZGVsYXlfbWluIjoxLjAsImJvZHlfeWF3X2RlbGF5X3BoYXNlIjowLjAsImJvZHlfeWF3X2RlbGF5X3JhbmRvbV92YWx1ZSI6MC4wLCJib2R5X3lhd19kZWxheV90eXBlIjoxLjAsImJvZHlfeWF3X2xlZnQiOjYwLjAsImJvZHlfeWF3X21vZGVybl9saW1pdCI6NjAuMCwiYm9keV95YXdfcmFuZG9taXplX3ZhbHVlIjowLjAsImJvZHlfeWF3X3JpZ2h0Ijo2MC4wfSwifmxlZnQiOnsibGVmdF9yYW5kb21pemVfdmFsdWUiOjAuMH0sIn5tb2RpZmllcl9jZW50ZXIiOnsibW9kaWZpZXJfbWF4IjowLjAsIm1vZGlmaWVyX21pbiI6MC4wLCJtb2RpZmllcl9yYW5kb21pemVfdmFsdWUiOjAuMCwibW9kaWZpZXJfdHlwZSI6MS4wfSwifm1vZGlmaWVyX29mZnNldCI6eyJtb2RpZmllcl9tYXgiOjAuMCwibW9kaWZpZXJfbWluIjowLjAsIm1vZGlmaWVyX3JhbmRvbWl6ZV92YWx1ZSI6MC4wLCJtb2RpZmllcl90eXBlIjoxLjB9LCJ+bW9kaWZpZXJfcmFuZG9tIjp7Im1vZGlmaWVyX21heCI6MC4wLCJtb2RpZmllcl9taW4iOjAuMCwibW9kaWZpZXJfcmFuZG9taXplX3ZhbHVlIjowLjAsIm1vZGlmaWVyX3R5cGUiOjEuMH0sIn5yaWdodCI6eyJyaWdodF9yYW5kb21pemVfdmFsdWUiOjAuMH19LCJlbmFibGVkIjp0cnVlLCJzaW5nbGUiOnsiYm9keV95YXciOjIuMCwibGVmdCI6LTE2LjAsIm1vZGlmaWVyIjoyLjAsIm1vZGlmaWVyX2NlbnRlciI6LTE2LjAsIm1vZGlmaWVyX29mZnNldCI6MC4wLCJtb2RpZmllcl9yYW5kb20iOjAuMCwib2Zmc2V0IjowLjAsInJpZ2h0IjoyMC4wLCJ0eXBlIjoyLjAsIn5ib2R5X3lhdyI6eyJib2R5X3lhd19kZWxheSI6MS4wLCJib2R5X3lhd19kZWxheV9jaG9rZSI6MC4wLCJib2R5X3lhd19kZWxheV9tYXgiOjEuMCwiYm9keV95YXdfZGVsYXlfbWluIjoxLjAsImJvZHlfeWF3X2RlbGF5X3BoYXNlIjozLjAsImJvZHlfeWF3X2RlbGF5X3JhbmRvbV92YWx1ZSI6MC4wLCJib2R5X3lhd19kZWxheV90eXBlIjozLjAsImJvZHlfeWF3X2xlZnQiOjYwLjAsImJvZHlfeWF3X21vZGVybl9saW1pdCI6NjAuMCwiYm9keV95YXdfcmFuZG9taXplX3ZhbHVlIjowLjAsImJvZHlfeWF3X3JpZ2h0Ijo2MC4wfSwifmxlZnQiOnsibGVmdF9yYW5kb21pemVfdmFsdWUiOjAuMH0sIn5tb2RpZmllcl9jZW50ZXIiOnsibW9kaWZpZXJfbWF4IjowLjAsIm1vZGlmaWVyX21pbiI6MC4wLCJtb2RpZmllcl9yYW5kb21pemVfdmFsdWUiOjI3LjAsIm1vZGlmaWVyX3R5cGUiOjEuMH0sIn5tb2RpZmllcl9vZmZzZXQiOnsibW9kaWZpZXJfbWF4IjowLjAsIm1vZGlmaWVyX21pbiI6MC4wLCJtb2RpZmllcl9yYW5kb21pemVfdmFsdWUiOjAuMCwibW9kaWZpZXJfdHlwZSI6MS4wfSwifm1vZGlmaWVyX3JhbmRvbSI6eyJtb2RpZmllcl9tYXgiOjAuMCwibW9kaWZpZXJfbWluIjowLjAsIm1vZGlmaWVyX3JhbmRvbWl6ZV92YWx1ZSI6MC4wLCJtb2RpZmllcl90eXBlIjoxLjB9LCJ+cmlnaHQiOnsicmlnaHRfcmFuZG9taXplX3ZhbHVlIjowLjB9fSwidCI6eyJib2R5X3lhdyI6MC4wLCJsZWZ0IjowLjAsIm1vZGlmaWVyIjowLjAsIm1vZGlmaWVyX2NlbnRlciI6MC4wLCJtb2RpZmllcl9vZmZzZXQiOjAuMCwibW9kaWZpZXJfcmFuZG9tIjowLjAsIm9mZnNldCI6MC4wLCJyaWdodCI6MC4wLCJ0eXBlIjowLjAsIn5ib2R5X3lhdyI6eyJib2R5X3lhd19kZWxheSI6MS4wLCJib2R5X3lhd19kZWxheV9jaG9rZSI6MC4wLCJib2R5X3lhd19kZWxheV9tYXgiOjEuMCwiYm9keV95YXdfZGVsYXlfbWluIjoxLjAsImJvZHlfeWF3X2RlbGF5X3BoYXNlIjowLjAsImJvZHlfeWF3X2RlbGF5X3JhbmRvbV92YWx1ZSI6MC4wLCJib2R5X3lhd19kZWxheV90eXBlIjoxLjAsImJvZHlfeWF3X2xlZnQiOjYwLjAsImJvZHlfeWF3X21vZGVybl9saW1pdCI6NjAuMCwiYm9keV95YXdfcmFuZG9taXplX3ZhbHVlIjowLjAsImJvZHlfeWF3X3JpZ2h0Ijo2MC4wfSwifmxlZnQiOnsibGVmdF9yYW5kb21pemVfdmFsdWUiOjAuMH0sIn5tb2RpZmllcl9jZW50ZXIiOnsibW9kaWZpZXJfbWF4IjowLjAsIm1vZGlmaWVyX21pbiI6MC4wLCJtb2RpZmllcl9yYW5kb21pemVfdmFsdWUiOjAuMCwibW9kaWZpZXJfdHlwZSI6MS4wfSwifm1vZGlmaWVyX29mZnNldCI6eyJtb2RpZmllcl9tYXgiOjAuMCwibW9kaWZpZXJfbWluIjowLjAsIm1vZGlmaWVyX3JhbmRvbWl6ZV92YWx1ZSI6MC4wLCJtb2RpZmllcl90eXBlIjoxLjB9LCJ+bW9kaWZpZXJfcmFuZG9tIjp7Im1vZGlmaWVyX21heCI6MC4wLCJtb2RpZmllcl9taW4iOjAuMCwibW9kaWZpZXJfcmFuZG9taXplX3ZhbHVlIjowLjAsIm1vZGlmaWVyX3R5cGUiOjEuMH0sIn5yaWdodCI6eyJyaWdodF9yYW5kb21pemVfdmFsdWUiOjAuMH19fSx7ImN0Ijp7ImJvZHlfeWF3IjowLjAsImxlZnQiOjAuMCwibW9kaWZpZXIiOjAuMCwibW9kaWZpZXJfY2VudGVyIjowLjAsIm1vZGlmaWVyX29mZnNldCI6MC4wLCJtb2RpZmllcl9yYW5kb20iOjAuMCwib2Zmc2V0IjowLjAsInJpZ2h0IjowLjAsInR5cGUiOjAuMCwifmJvZHlfeWF3Ijp7ImJvZHlfeWF3X2RlbGF5IjoxLjAsImJvZHlfeWF3X2RlbGF5X2Nob2tlIjowLjAsImJvZHlfeWF3X2RlbGF5X21heCI6MS4wLCJib2R5X3lhd19kZWxheV9taW4iOjEuMCwiYm9keV95YXdfZGVsYXlfcGhhc2UiOjAuMCwiYm9keV95YXdfZGVsYXlfcmFuZG9tX3ZhbHVlIjowLjAsImJvZHlfeWF3X2RlbGF5X3R5cGUiOjEuMCwiYm9keV95YXdfbGVmdCI6NjAuMCwiYm9keV95YXdfbW9kZXJuX2xpbWl0Ijo2MC4wLCJib2R5X3lhd19yYW5kb21pemVfdmFsdWUiOjAuMCwiYm9keV95YXdfcmlnaHQiOjYwLjB9LCJ+bGVmdCI6eyJsZWZ0X3JhbmRvbWl6ZV92YWx1ZSI6MC4wfSwifm1vZGlmaWVyX2NlbnRlciI6eyJtb2RpZmllcl9tYXgiOjAuMCwibW9kaWZpZXJfbWluIjowLjAsIm1vZGlmaWVyX3JhbmRvbWl6ZV92YWx1ZSI6MC4wLCJtb2RpZmllcl90eXBlIjoxLjB9LCJ+bW9kaWZpZXJfb2Zmc2V0Ijp7Im1vZGlmaWVyX21heCI6MC4wLCJtb2RpZmllcl9taW4iOjAuMCwibW9kaWZpZXJfcmFuZG9taXplX3ZhbHVlIjowLjAsIm1vZGlmaWVyX3R5cGUiOjEuMH0sIn5tb2RpZmllcl9yYW5kb20iOnsibW9kaWZpZXJfbWF4IjowLjAsIm1vZGlmaWVyX21pbiI6MC4wLCJtb2RpZmllcl9yYW5kb21pemVfdmFsdWUiOjAuMCwibW9kaWZpZXJfdHlwZSI6MS4wfSwifnJpZ2h0Ijp7InJpZ2h0X3JhbmRvbWl6ZV92YWx1ZSI6MC4wfX0sImVuYWJsZWQiOnRydWUsInNpbmdsZSI6eyJib2R5X3lhdyI6Mi4wLCJsZWZ0IjotMTQuMCwibW9kaWZpZXIiOjIuMCwibW9kaWZpZXJfY2VudGVyIjotMzUuMCwibW9kaWZpZXJfb2Zmc2V0IjowLjAsIm1vZGlmaWVyX3JhbmRvbSI6MC4wLCJvZmZzZXQiOjAuMCwicmlnaHQiOjE2LjAsInR5cGUiOjIuMCwifmJvZHlfeWF3Ijp7ImJvZHlfeWF3X2RlbGF5IjoxLjAsImJvZHlfeWF3X2RlbGF5X2Nob2tlIjowLjAsImJvZHlfeWF3X2RlbGF5X21heCI6MS4wLCJib2R5X3lhd19kZWxheV9taW4iOjEuMCwiYm9keV95YXdfZGVsYXlfcGhhc2UiOjAuMCwiYm9keV95YXdfZGVsYXlfcmFuZG9tX3ZhbHVlIjowLjAsImJvZHlfeWF3X2RlbGF5X3R5cGUiOjEuMCwiYm9keV95YXdfbGVmdCI6NjAuMCwiYm9keV95YXdfbW9kZXJuX2xpbWl0Ijo2MC4wLCJib2R5X3lhd19yYW5kb21pemVfdmFsdWUiOjAuMCwiYm9keV95YXdfcmlnaHQiOjYwLjB9LCJ+bGVmdCI6eyJsZWZ0X3JhbmRvbWl6ZV92YWx1ZSI6MC4wfSwifm1vZGlmaWVyX2NlbnRlciI6eyJtb2RpZmllcl9tYXgiOjAuMCwibW9kaWZpZXJfbWluIjowLjAsIm1vZGlmaWVyX3JhbmRvbWl6ZV92YWx1ZSI6MTkuMCwibW9kaWZpZXJfdHlwZSI6MS4wfSwifm1vZGlmaWVyX29mZnNldCI6eyJtb2RpZmllcl9tYXgiOjAuMCwibW9kaWZpZXJfbWluIjowLjAsIm1vZGlmaWVyX3JhbmRvbWl6ZV92YWx1ZSI6MC4wLCJtb2RpZmllcl90eXBlIjoxLjB9LCJ+bW9kaWZpZXJfcmFuZG9tIjp7Im1vZGlmaWVyX21heCI6MC4wLCJtb2RpZmllcl9taW4iOjAuMCwibW9kaWZpZXJfcmFuZG9taXplX3ZhbHVlIjowLjAsIm1vZGlmaWVyX3R5cGUiOjEuMH0sIn5yaWdodCI6eyJyaWdodF9yYW5kb21pemVfdmFsdWUiOjAuMH19LCJ0Ijp7ImJvZHlfeWF3IjowLjAsImxlZnQiOjAuMCwibW9kaWZpZXIiOjAuMCwibW9kaWZpZXJfY2VudGVyIjowLjAsIm1vZGlmaWVyX29mZnNldCI6MC4wLCJtb2RpZmllcl9yYW5kb20iOjAuMCwib2Zmc2V0IjowLjAsInJpZ2h0IjowLjAsInR5cGUiOjAuMCwifmJvZHlfeWF3Ijp7ImJvZHlfeWF3X2RlbGF5IjoxLjAsImJvZHlfeWF3X2RlbGF5X2Nob2tlIjowLjAsImJvZHlfeWF3X2RlbGF5X21heCI6MS4wLCJib2R5X3lhd19kZWxheV9taW4iOjEuMCwiYm9keV95YXdfZGVsYXlfcGhhc2UiOjAuMCwiYm9keV95YXdfZGVsYXlfcmFuZG9tX3ZhbHVlIjowLjAsImJvZHlfeWF3X2RlbGF5X3R5cGUiOjEuMCwiYm9keV95YXdfbGVmdCI6NjAuMCwiYm9keV95YXdfbW9kZXJuX2xpbWl0Ijo2MC4wLCJib2R5X3lhd19yYW5kb21pemVfdmFsdWUiOjAuMCwiYm9keV95YXdfcmlnaHQiOjYwLjB9LCJ+bGVmdCI6eyJsZWZ0X3JhbmRvbWl6ZV92YWx1ZSI6MC4wfSwifm1vZGlmaWVyX2NlbnRlciI6eyJtb2RpZmllcl9tYXgiOjAuMCwibW9kaWZpZXJfbWluIjowLjAsIm1vZGlmaWVyX3JhbmRvbWl6ZV92YWx1ZSI6MC4wLCJtb2RpZmllcl90eXBlIjoxLjB9LCJ+bW9kaWZpZXJfb2Zmc2V0Ijp7Im1vZGlmaWVyX21heCI6MC4wLCJtb2RpZmllcl9taW4iOjAuMCwibW9kaWZpZXJfcmFuZG9taXplX3ZhbHVlIjowLjAsIm1vZGlmaWVyX3R5cGUiOjEuMH0sIn5tb2RpZmllcl9yYW5kb20iOnsibW9kaWZpZXJfbWF4IjowLjAsIm1vZGlmaWVyX21pbiI6MC4wLCJtb2RpZmllcl9yYW5kb21pemVfdmFsdWUiOjAuMCwibW9kaWZpZXJfdHlwZSI6MS4wfSwifnJpZ2h0Ijp7InJpZ2h0X3JhbmRvbWl6ZV92YWx1ZSI6MC4wfX19LHsiY3QiOnsiYm9keV95YXciOjAuMCwibGVmdCI6MC4wLCJtb2RpZmllciI6MC4wLCJtb2RpZmllcl9jZW50ZXIiOjAuMCwibW9kaWZpZXJfb2Zmc2V0IjowLjAsIm1vZGlmaWVyX3JhbmRvbSI6MC4wLCJvZmZzZXQiOjAuMCwicmlnaHQiOjAuMCwidHlwZSI6MC4wLCJ+Ym9keV95YXciOnsiYm9keV95YXdfZGVsYXkiOjEuMCwiYm9keV95YXdfZGVsYXlfY2hva2UiOjAuMCwiYm9keV95YXdfZGVsYXlfbWF4IjoxLjAsImJvZHlfeWF3X2RlbGF5X21pbiI6MS4wLCJib2R5X3lhd19kZWxheV9waGFzZSI6MC4wLCJib2R5X3lhd19kZWxheV9yYW5kb21fdmFsdWUiOjAuMCwiYm9keV95YXdfZGVsYXlfdHlwZSI6MS4wLCJib2R5X3lhd19sZWZ0Ijo2MC4wLCJib2R5X3lhd19tb2Rlcm5fbGltaXQiOjYwLjAsImJvZHlfeWF3X3JhbmRvbWl6ZV92YWx1ZSI6MC4wLCJib2R5X3lhd19yaWdodCI6NjAuMH0sIn5sZWZ0Ijp7ImxlZnRfcmFuZG9taXplX3ZhbHVlIjowLjB9LCJ+bW9kaWZpZXJfY2VudGVyIjp7Im1vZGlmaWVyX21heCI6MC4wLCJtb2RpZmllcl9taW4iOjAuMCwibW9kaWZpZXJfcmFuZG9taXplX3ZhbHVlIjowLjAsIm1vZGlmaWVyX3R5cGUiOjEuMH0sIn5tb2RpZmllcl9vZmZzZXQiOnsibW9kaWZpZXJfbWF4IjowLjAsIm1vZGlmaWVyX21pbiI6MC4wLCJtb2RpZmllcl9yYW5kb21pemVfdmFsdWUiOjAuMCwibW9kaWZpZXJfdHlwZSI6MS4wfSwifm1vZGlmaWVyX3JhbmRvbSI6eyJtb2RpZmllcl9tYXgiOjAuMCwibW9kaWZpZXJfbWluIjowLjAsIm1vZGlmaWVyX3JhbmRvbWl6ZV92YWx1ZSI6MC4wLCJtb2RpZmllcl90eXBlIjoxLjB9LCJ+cmlnaHQiOnsicmlnaHRfcmFuZG9taXplX3ZhbHVlIjowLjB9fSwiZW5hYmxlZCI6dHJ1ZSwic2luZ2xlIjp7ImJvZHlfeWF3IjoyLjAsImxlZnQiOi0yNC4wLCJtb2RpZmllciI6Mi4wLCJtb2RpZmllcl9jZW50ZXIiOi0yMS4wLCJtb2RpZmllcl9vZmZzZXQiOjAuMCwibW9kaWZpZXJfcmFuZG9tIjowLjAsIm9mZnNldCI6MC4wLCJyaWdodCI6MjIuMCwidHlwZSI6Mi4wLCJ+Ym9keV95YXciOnsiYm9keV95YXdfZGVsYXkiOjEuMCwiYm9keV95YXdfZGVsYXlfY2hva2UiOjAuMCwiYm9keV95YXdfZGVsYXlfbWF4IjoxLjAsImJvZHlfeWF3X2RlbGF5X21pbiI6MS4wLCJib2R5X3lhd19kZWxheV9waGFzZSI6MC4wLCJib2R5X3lhd19kZWxheV9yYW5kb21fdmFsdWUiOjAuMCwiYm9keV95YXdfZGVsYXlfdHlwZSI6MS4wLCJib2R5X3lhd19sZWZ0Ijo2MC4wLCJib2R5X3lhd19tb2Rlcm5fbGltaXQiOjYwLjAsImJvZHlfeWF3X3JhbmRvbWl6ZV92YWx1ZSI6MjIuMCwiYm9keV95YXdfcmlnaHQiOjYwLjB9LCJ+bGVmdCI6eyJsZWZ0X3JhbmRvbWl6ZV92YWx1ZSI6MC4wfSwifm1vZGlmaWVyX2NlbnRlciI6eyJtb2RpZmllcl9tYXgiOjAuMCwibW9kaWZpZXJfbWluIjowLjAsIm1vZGlmaWVyX3JhbmRvbWl6ZV92YWx1ZSI6MC4wLCJtb2RpZmllcl90eXBlIjoxLjB9LCJ+bW9kaWZpZXJfb2Zmc2V0Ijp7Im1vZGlmaWVyX21heCI6MC4wLCJtb2RpZmllcl9taW4iOjAuMCwibW9kaWZpZXJfcmFuZG9taXplX3ZhbHVlIjowLjAsIm1vZGlmaWVyX3R5cGUiOjEuMH0sIn5tb2RpZmllcl9yYW5kb20iOnsibW9kaWZpZXJfbWF4IjowLjAsIm1vZGlmaWVyX21pbiI6MC4wLCJtb2RpZmllcl9yYW5kb21pemVfdmFsdWUiOjAuMCwibW9kaWZpZXJfdHlwZSI6MS4wfSwifnJpZ2h0Ijp7InJpZ2h0X3JhbmRvbWl6ZV92YWx1ZSI6MC4wfX0sInQiOnsiYm9keV95YXciOjAuMCwibGVmdCI6MC4wLCJtb2RpZmllciI6MC4wLCJtb2RpZmllcl9jZW50ZXIiOjAuMCwibW9kaWZpZXJfb2Zmc2V0IjowLjAsIm1vZGlmaWVyX3JhbmRvbSI6MC4wLCJvZmZzZXQiOjAuMCwicmlnaHQiOjAuMCwidHlwZSI6MC4wLCJ+Ym9keV95YXciOnsiYm9keV95YXdfZGVsYXkiOjEuMCwiYm9keV95YXdfZGVsYXlfY2hva2UiOjAuMCwiYm9keV95YXdfZGVsYXlfbWF4IjoxLjAsImJvZHlfeWF3X2RlbGF5X21pbiI6MS4wLCJib2R5X3lhd19kZWxheV9waGFzZSI6MC4wLCJib2R5X3lhd19kZWxheV9yYW5kb21fdmFsdWUiOjAuMCwiYm9keV95YXdfZGVsYXlfdHlwZSI6MS4wLCJib2R5X3lhd19sZWZ0Ijo2MC4wLCJib2R5X3lhd19tb2Rlcm5fbGltaXQiOjYwLjAsImJvZHlfeWF3X3JhbmRvbWl6ZV92YWx1ZSI6MC4wLCJib2R5X3lhd19yaWdodCI6NjAuMH0sIn5sZWZ0Ijp7ImxlZnRfcmFuZG9taXplX3ZhbHVlIjowLjB9LCJ+bW9kaWZpZXJfY2VudGVyIjp7Im1vZGlmaWVyX21heCI6MC4wLCJtb2RpZmllcl9taW4iOjAuMCwibW9kaWZpZXJfcmFuZG9taXplX3ZhbHVlIjowLjAsIm1vZGlmaWVyX3R5cGUiOjEuMH0sIn5tb2RpZmllcl9vZmZzZXQiOnsibW9kaWZpZXJfbWF4IjowLjAsIm1vZGlmaWVyX21pbiI6MC4wLCJtb2RpZmllcl9yYW5kb21pemVfdmFsdWUiOjAuMCwibW9kaWZpZXJfdHlwZSI6MS4wfSwifm1vZGlmaWVyX3JhbmRvbSI6eyJtb2RpZmllcl9tYXgiOjAuMCwibW9kaWZpZXJfbWluIjowLjAsIm1vZGlmaWVyX3JhbmRvbWl6ZV92YWx1ZSI6MC4wLCJtb2RpZmllcl90eXBlIjoxLjB9LCJ+cmlnaHQiOnsicmlnaHRfcmFuZG9taXplX3ZhbHVlIjowLjB9fX0seyJjdCI6eyJib2R5X3lhdyI6MC4wLCJsZWZ0IjowLjAsIm1vZGlmaWVyIjowLjAsIm1vZGlmaWVyX2NlbnRlciI6MC4wLCJtb2RpZmllcl9vZmZzZXQiOjAuMCwibW9kaWZpZXJfcmFuZG9tIjowLjAsIm9mZnNldCI6MC4wLCJyaWdodCI6MC4wLCJ0eXBlIjowLjAsIn5ib2R5X3lhdyI6eyJib2R5X3lhd19kZWxheSI6MS4wLCJib2R5X3lhd19kZWxheV9jaG9rZSI6MC4wLCJib2R5X3lhd19kZWxheV9tYXgiOjEuMCwiYm9keV95YXdfZGVsYXlfbWluIjoxLjAsImJvZHlfeWF3X2RlbGF5X3BoYXNlIjowLjAsImJvZHlfeWF3X2RlbGF5X3JhbmRvbV92YWx1ZSI6MC4wLCJib2R5X3lhd19kZWxheV90eXBlIjoxLjAsImJvZHlfeWF3X2xlZnQiOjYwLjAsImJvZHlfeWF3X21vZGVybl9saW1pdCI6NjAuMCwiYm9keV95YXdfcmFuZG9taXplX3ZhbHVlIjowLjAsImJvZHlfeWF3X3JpZ2h0Ijo2MC4wfSwifmxlZnQiOnsibGVmdF9yYW5kb21pemVfdmFsdWUiOjAuMH0sIn5tb2RpZmllcl9jZW50ZXIiOnsibW9kaWZpZXJfbWF4IjowLjAsIm1vZGlmaWVyX21pbiI6MC4wLCJtb2RpZmllcl9yYW5kb21pemVfdmFsdWUiOjAuMCwibW9kaWZpZXJfdHlwZSI6MS4wfSwifm1vZGlmaWVyX29mZnNldCI6eyJtb2RpZmllcl9tYXgiOjAuMCwibW9kaWZpZXJfbWluIjowLjAsIm1vZGlmaWVyX3JhbmRvbWl6ZV92YWx1ZSI6MC4wLCJtb2RpZmllcl90eXBlIjoxLjB9LCJ+bW9kaWZpZXJfcmFuZG9tIjp7Im1vZGlmaWVyX21heCI6MC4wLCJtb2RpZmllcl9taW4iOjAuMCwibW9kaWZpZXJfcmFuZG9taXplX3ZhbHVlIjowLjAsIm1vZGlmaWVyX3R5cGUiOjEuMH0sIn5yaWdodCI6eyJyaWdodF9yYW5kb21pemVfdmFsdWUiOjAuMH19LCJlbmFibGVkIjp0cnVlLCJzaW5nbGUiOnsiYm9keV95YXciOjEuMCwibGVmdCI6LTIyLjAsIm1vZGlmaWVyIjoyLjAsIm1vZGlmaWVyX2NlbnRlciI6NDQuMCwibW9kaWZpZXJfb2Zmc2V0IjowLjAsIm1vZGlmaWVyX3JhbmRvbSI6MC4wLCJvZmZzZXQiOjAuMCwicmlnaHQiOjIxLjAsInR5cGUiOjIuMCwifmJvZHlfeWF3Ijp7ImJvZHlfeWF3X2RlbGF5IjoxLjAsImJvZHlfeWF3X2RlbGF5X2Nob2tlIjowLjAsImJvZHlfeWF3X2RlbGF5X21heCI6NC4wLCJib2R5X3lhd19kZWxheV9taW4iOjIuMCwiYm9keV95YXdfZGVsYXlfcGhhc2UiOjAuMCwiYm9keV95YXdfZGVsYXlfcmFuZG9tX3ZhbHVlIjowLjAsImJvZHlfeWF3X2RlbGF5X3R5cGUiOjEuMCwiYm9keV95YXdfbGVmdCI6NjAuMCwiYm9keV95YXdfbW9kZXJuX2xpbWl0Ijo2MC4wLCJib2R5X3lhd19yYW5kb21pemVfdmFsdWUiOjAuMCwiYm9keV95YXdfcmlnaHQiOjYwLjB9LCJ+bGVmdCI6eyJsZWZ0X3JhbmRvbWl6ZV92YWx1ZSI6MTIuMH0sIn5tb2RpZmllcl9jZW50ZXIiOnsibW9kaWZpZXJfbWF4IjowLjAsIm1vZGlmaWVyX21pbiI6MC4wLCJtb2RpZmllcl9yYW5kb21pemVfdmFsdWUiOjE0LjAsIm1vZGlmaWVyX3R5cGUiOjEuMH0sIn5tb2RpZmllcl9vZmZzZXQiOnsibW9kaWZpZXJfbWF4IjowLjAsIm1vZGlmaWVyX21pbiI6MC4wLCJtb2RpZmllcl9yYW5kb21pemVfdmFsdWUiOjAuMCwibW9kaWZpZXJfdHlwZSI6MS4wfSwifm1vZGlmaWVyX3JhbmRvbSI6eyJtb2RpZmllcl9tYXgiOjAuMCwibW9kaWZpZXJfbWluIjowLjAsIm1vZGlmaWVyX3JhbmRvbWl6ZV92YWx1ZSI6MC4wLCJtb2RpZmllcl90eXBlIjoxLjB9LCJ+cmlnaHQiOnsicmlnaHRfcmFuZG9taXplX3ZhbHVlIjoxNi4wfX0sInQiOnsiYm9keV95YXciOjAuMCwibGVmdCI6MC4wLCJtb2RpZmllciI6MC4wLCJtb2RpZmllcl9jZW50ZXIiOjAuMCwibW9kaWZpZXJfb2Zmc2V0IjowLjAsIm1vZGlmaWVyX3JhbmRvbSI6MC4wLCJvZmZzZXQiOjAuMCwicmlnaHQiOjAuMCwidHlwZSI6MC4wLCJ+Ym9keV95YXciOnsiYm9keV95YXdfZGVsYXkiOjEuMCwiYm9keV95YXdfZGVsYXlfY2hva2UiOjAuMCwiYm9keV95YXdfZGVsYXlfbWF4IjoxLjAsImJvZHlfeWF3X2RlbGF5X21pbiI6MS4wLCJib2R5X3lhd19kZWxheV9waGFzZSI6MC4wLCJib2R5X3lhd19kZWxheV9yYW5kb21fdmFsdWUiOjAuMCwiYm9keV95YXdfZGVsYXlfdHlwZSI6MS4wLCJib2R5X3lhd19sZWZ0Ijo2MC4wLCJib2R5X3lhd19tb2Rlcm5fbGltaXQiOjYwLjAsImJvZHlfeWF3X3JhbmRvbWl6ZV92YWx1ZSI6MC4wLCJib2R5X3lhd19yaWdodCI6NjAuMH0sIn5sZWZ0Ijp7ImxlZnRfcmFuZG9taXplX3ZhbHVlIjowLjB9LCJ+bW9kaWZpZXJfY2VudGVyIjp7Im1vZGlmaWVyX21heCI6MC4wLCJtb2RpZmllcl9taW4iOjAuMCwibW9kaWZpZXJfcmFuZG9taXplX3ZhbHVlIjowLjAsIm1vZGlmaWVyX3R5cGUiOjEuMH0sIn5tb2RpZmllcl9vZmZzZXQiOnsibW9kaWZpZXJfbWF4IjowLjAsIm1vZGlmaWVyX21pbiI6MC4wLCJtb2RpZmllcl9yYW5kb21pemVfdmFsdWUiOjAuMCwibW9kaWZpZXJfdHlwZSI6MS4wfSwifm1vZGlmaWVyX3JhbmRvbSI6eyJtb2RpZmllcl9tYXgiOjAuMCwibW9kaWZpZXJfbWluIjowLjAsIm1vZGlmaWVyX3JhbmRvbWl6ZV92YWx1ZSI6MC4wLCJtb2RpZmllcl90eXBlIjoxLjB9LCJ+cmlnaHQiOnsicmlnaHRfcmFuZG9taXplX3ZhbHVlIjowLjB9fX0seyJjdCI6eyJib2R5X3lhdyI6MC4wLCJsZWZ0IjowLjAsIm1vZGlmaWVyIjowLjAsIm1vZGlmaWVyX2NlbnRlciI6MC4wLCJtb2RpZmllcl9vZmZzZXQiOjAuMCwibW9kaWZpZXJfcmFuZG9tIjowLjAsIm9mZnNldCI6MC4wLCJyaWdodCI6MC4wLCJ0eXBlIjowLjAsIn5ib2R5X3lhdyI6eyJib2R5X3lhd19kZWxheSI6MS4wLCJib2R5X3lhd19kZWxheV9jaG9rZSI6MC4wLCJib2R5X3lhd19kZWxheV9tYXgiOjEuMCwiYm9keV95YXdfZGVsYXlfbWluIjoxLjAsImJvZHlfeWF3X2RlbGF5X3BoYXNlIjowLjAsImJvZHlfeWF3X2RlbGF5X3JhbmRvbV92YWx1ZSI6MC4wLCJib2R5X3lhd19kZWxheV90eXBlIjoxLjAsImJvZHlfeWF3X2xlZnQiOjYwLjAsImJvZHlfeWF3X21vZGVybl9saW1pdCI6NjAuMCwiYm9keV95YXdfcmFuZG9taXplX3ZhbHVlIjowLjAsImJvZHlfeWF3X3JpZ2h0Ijo2MC4wfSwifmxlZnQiOnsibGVmdF9yYW5kb21pemVfdmFsdWUiOjAuMH0sIn5tb2RpZmllcl9jZW50ZXIiOnsibW9kaWZpZXJfbWF4IjowLjAsIm1vZGlmaWVyX21pbiI6MC4wLCJtb2RpZmllcl9yYW5kb21pemVfdmFsdWUiOjAuMCwibW9kaWZpZXJfdHlwZSI6MS4wfSwifm1vZGlmaWVyX29mZnNldCI6eyJtb2RpZmllcl9tYXgiOjAuMCwibW9kaWZpZXJfbWluIjowLjAsIm1vZGlmaWVyX3JhbmRvbWl6ZV92YWx1ZSI6MC4wLCJtb2RpZmllcl90eXBlIjoxLjB9LCJ+bW9kaWZpZXJfcmFuZG9tIjp7Im1vZGlmaWVyX21heCI6MC4wLCJtb2RpZmllcl9taW4iOjAuMCwibW9kaWZpZXJfcmFuZG9taXplX3ZhbHVlIjowLjAsIm1vZGlmaWVyX3R5cGUiOjEuMH0sIn5yaWdodCI6eyJyaWdodF9yYW5kb21pemVfdmFsdWUiOjAuMH19LCJlbmFibGVkIjp0cnVlLCJzaW5nbGUiOnsiYm9keV95YXciOjIuMCwibGVmdCI6LTMxLjAsIm1vZGlmaWVyIjoyLjAsIm1vZGlmaWVyX2NlbnRlciI6NS4wLCJtb2RpZmllcl9vZmZzZXQiOjAuMCwibW9kaWZpZXJfcmFuZG9tIjowLjAsIm9mZnNldCI6MC4wLCJyaWdodCI6MjkuMCwidHlwZSI6Mi4wLCJ+Ym9keV95YXciOnsiYm9keV95YXdfZGVsYXkiOjEuMCwiYm9keV95YXdfZGVsYXlfY2hva2UiOjAuMCwiYm9keV95YXdfZGVsYXlfbWF4IjoxLjAsImJvZHlfeWF3X2RlbGF5X21pbiI6MS4wLCJib2R5X3lhd19kZWxheV9waGFzZSI6MC4wLCJib2R5X3lhd19kZWxheV9yYW5kb21fdmFsdWUiOjAuMCwiYm9keV95YXdfZGVsYXlfdHlwZSI6MS4wLCJib2R5X3lhd19sZWZ0Ijo2MC4wLCJib2R5X3lhd19tb2Rlcm5fbGltaXQiOjYwLjAsImJvZHlfeWF3X3JhbmRvbWl6ZV92YWx1ZSI6NzMuMCwiYm9keV95YXdfcmlnaHQiOjYwLjB9LCJ+bGVmdCI6eyJsZWZ0X3JhbmRvbWl6ZV92YWx1ZSI6MC4wfSwifm1vZGlmaWVyX2NlbnRlciI6eyJtb2RpZmllcl9tYXgiOjAuMCwibW9kaWZpZXJfbWluIjowLjAsIm1vZGlmaWVyX3JhbmRvbWl6ZV92YWx1ZSI6OS4wLCJtb2RpZmllcl90eXBlIjoxLjB9LCJ+bW9kaWZpZXJfb2Zmc2V0Ijp7Im1vZGlmaWVyX21heCI6MC4wLCJtb2RpZmllcl9taW4iOjAuMCwibW9kaWZpZXJfcmFuZG9taXplX3ZhbHVlIjowLjAsIm1vZGlmaWVyX3R5cGUiOjEuMH0sIn5tb2RpZmllcl9yYW5kb20iOnsibW9kaWZpZXJfbWF4IjowLjAsIm1vZGlmaWVyX21pbiI6MC4wLCJtb2RpZmllcl9yYW5kb21pemVfdmFsdWUiOjAuMCwibW9kaWZpZXJfdHlwZSI6MS4wfSwifnJpZ2h0Ijp7InJpZ2h0X3JhbmRvbWl6ZV92YWx1ZSI6MC4wfX0sInQiOnsiYm9keV95YXciOjAuMCwibGVmdCI6MC4wLCJtb2RpZmllciI6MC4wLCJtb2RpZmllcl9jZW50ZXIiOjAuMCwibW9kaWZpZXJfb2Zmc2V0IjowLjAsIm1vZGlmaWVyX3JhbmRvbSI6MC4wLCJvZmZzZXQiOjAuMCwicmlnaHQiOjAuMCwidHlwZSI6MC4wLCJ+Ym9keV95YXciOnsiYm9keV95YXdfZGVsYXkiOjEuMCwiYm9keV95YXdfZGVsYXlfY2hva2UiOjAuMCwiYm9keV95YXdfZGVsYXlfbWF4IjoxLjAsImJvZHlfeWF3X2RlbGF5X21pbiI6MS4wLCJib2R5X3lhd19kZWxheV9waGFzZSI6MC4wLCJib2R5X3lhd19kZWxheV9yYW5kb21fdmFsdWUiOjAuMCwiYm9keV95YXdfZGVsYXlfdHlwZSI6MS4wLCJib2R5X3lhd19sZWZ0Ijo2MC4wLCJib2R5X3lhd19tb2Rlcm5fbGltaXQiOjYwLjAsImJvZHlfeWF3X3JhbmRvbWl6ZV92YWx1ZSI6MC4wLCJib2R5X3lhd19yaWdodCI6NjAuMH0sIn5sZWZ0Ijp7ImxlZnRfcmFuZG9taXplX3ZhbHVlIjowLjB9LCJ+bW9kaWZpZXJfY2VudGVyIjp7Im1vZGlmaWVyX21heCI6MC4wLCJtb2RpZmllcl9taW4iOjAuMCwibW9kaWZpZXJfcmFuZG9taXplX3ZhbHVlIjowLjAsIm1vZGlmaWVyX3R5cGUiOjEuMH0sIn5tb2RpZmllcl9vZmZzZXQiOnsibW9kaWZpZXJfbWF4IjowLjAsIm1vZGlmaWVyX21pbiI6MC4wLCJtb2RpZmllcl9yYW5kb21pemVfdmFsdWUiOjAuMCwibW9kaWZpZXJfdHlwZSI6MS4wfSwifm1vZGlmaWVyX3JhbmRvbSI6eyJtb2RpZmllcl9tYXgiOjAuMCwibW9kaWZpZXJfbWluIjowLjAsIm1vZGlmaWVyX3JhbmRvbWl6ZV92YWx1ZSI6MC4wLCJtb2RpZmllcl90eXBlIjoxLjB9LCJ+cmlnaHQiOnsicmlnaHRfcmFuZG9taXplX3ZhbHVlIjowLjB9fX1dXSwibmFtZSI6Im1pcmEiLCJ1c2VyIjoicHVua3VpIn0=";
    local v871 = db.stellar_configs or {};
    if type(v871.Default) ~= "table" or next(v871.Default) == nil then
        local l_status_0, l_result_0 = pcall(function()
            -- upvalues: l_base64_0 (ref), v870 (ref)
            return json.parse(l_base64_0.decode(v870));
        end);
        if l_status_0 and type(l_result_0) == "table" and l_result_0.data then
            v871.Default = l_result_0.data;
            db.stellar_configs = v871;
        end;
    end;
    local v874 = "Default";
    update_config_list = function()
        -- upvalues: v871 (ref), v868 (ref), v80 (ref), v874 (ref)
        local v875 = {
            [1] = "Default  \a525252FF\239\189\158  stellar"
        };
        for v876, _ in pairs(v871) do
            if v876 ~= "Default" then
                table.insert(v875, v876 .. "  \a525252FF\239\189\158  " .. v868);
            end;
        end;
        v80.configs.list:update(v875);
        local v878 = 1;
        local l_v874_0 = v874;
        if v874 ~= "Default" then
            for v880 = 2, #v875 do
                if v875[v880]:find(l_v874_0, 1, true) then
                    v878 = v880;
                    break;
                end;
            end;
        end;
        v80.configs.list:set(v878);
        v80.configs.text:set(v874);
    end;
    load_config = function(v881)
        -- upvalues: l_base64_0 (ref), v870 (ref), v869 (ref), v874 (ref), v871 (ref)
        if v881 == "Default" then
            local l_status_1, l_result_1 = pcall(function()
                -- upvalues: l_base64_0 (ref), v870 (ref)
                return json.parse(l_base64_0.decode(v870));
            end);
            if l_status_1 and l_result_1 and l_result_1.data then
                v869:load(l_result_1.data);
                v874 = "Default";
                update_config_list();
                print_raw("\ad6f1ffFFstellar\aFFFFFFFF \226\128\162 Default config successfully loaded");
                cvar.play:call("ui/beepclear");
            else
                print_raw("\ad6f1ffFFstellar\aFFFFFFFF \226\128\162 Failed to load Default config");
                cvar.play:call("resource/warning.wav");
            end;
        else
            local v884 = v871[v881];
            if v884 then
                v869:load(v884);
                v874 = v881;
                update_config_list();
                print_raw("\ad6f1ffFFstellar\aFFFFFFFF \226\128\162 Config \ad6f1ffFF" .. v881 .. "\aFFFFFFFF successfully loaded");
                cvar.play:call("ui/beepclear");
            else
                print_raw("\ad6f1ffFFstellar\aFFFFFFFF \226\128\162 Config \ad6f1ffFF" .. v881 .. "\aFFFFFFFF not found");
                cvar.play:call("resource/warning.wav");
            end;
        end;
    end;
    save_config = function(v885)
        -- upvalues: v871 (ref), v869 (ref), v874 (ref)
        if not v885 or v885 == "" then
            print_raw("\ad6f1ffFFstellar\aFFFFFFFF \226\128\162 Please enter a config name");
            cvar.play:call("resource/warning.wav");
            return;
        elseif v885 == "Default" then
            print_raw("\ad6f1ffFFstellar\aFFFFFFFF \226\128\162 Cannot overwrite Default config");
            cvar.play:call("resource/warning.wav");
            return;
        else
            v871[v885] = v869:save();
            v874 = v885;
            update_config_list();
            db.stellar_configs = v871;
            print_raw("\ad6f1ffFFstellar\aFFFFFFFF \226\128\162 Config \ad6f1ffFF" .. v885 .. "\aFFFFFFFF successfully saved");
            cvar.play:call("ui/beepclear");
            return;
        end;
    end;
    delete_config = function(v886)
        -- upvalues: v871 (ref), v874 (ref), v80 (ref)
        if v886 == "Default" then
            print_raw("\ad6f1ffFFstellar\aFFFFFFFF \226\128\162 Cannot delete Default config");
            cvar.play:call("resource/warning.wav");
            return;
        else
            if v871[v886] then
                v871[v886] = nil;
                if v874 == v886 then
                    v874 = "Default";
                    v80.configs.text:set("Default");
                end;
                update_config_list();
                db.stellar_configs = v871;
                print_raw("\ad6f1ffFFstellar\aFFFFFFFF \226\128\162 Config \ad6f1ffFF" .. v886 .. "\aFFFFFFFF successfully deleted");
                cvar.play:call("ui/beepclear");
            else
                print_raw("\ad6f1ffFFstellar\aFFFFFFFF \226\128\162 Config \ad6f1ffFF" .. v886 .. "\aFFFFFFFF not found");
                cvar.play:call("resource/warning.wav");
            end;
            return;
        end;
    end;
    export_config = function(v887)
        -- upvalues: v871 (ref), l_clipboard_0 (ref), l_base64_0 (ref), v868 (ref)
        local v888 = v871[v887];
        if v888 then
            l_clipboard_0.set(l_base64_0.encode(json.stringify({
                name = v887, 
                user = v868, 
                data = v888
            })));
            print_raw("\ad6f1ffFFstellar\aFFFFFFFF \226\128\162 Config \ad6f1ffFF" .. v887 .. "\aFFFFFFFF exported to clipboard");
            cvar.play:call("ui/beepclear");
        else
            print_raw("\ad6f1ffFFstellar\aFFFFFFFF \226\128\162 Config \ad6f1ffFF" .. v887 .. "\aFFFFFFFF not found");
            cvar.play:call("resource/warning.wav");
        end;
    end;
    import_config = function()
        -- upvalues: l_clipboard_0 (ref), l_base64_0 (ref), v80 (ref), v871 (ref), v874 (ref), v869 (ref)
        local v889 = l_clipboard_0.get();
        if not v889 or v889 == "" then
            print_raw("\ad6f1ffFFstellar\aFFFFFFFF \226\128\162 No data in clipboard");
            cvar.play:call("resource/warning.wav");
            return;
        else
            local l_status_2, l_result_2 = pcall(function()
                -- upvalues: l_base64_0 (ref), v889 (ref)
                return json.parse(l_base64_0.decode(v889));
            end);
            if not l_status_2 or type(l_result_2) ~= "table" or type(l_result_2.data) ~= "table" then
                print_raw("\ad6f1ffFFstellar\aFFFFFFFF \226\128\162 Invalid config data in clipboard");
                cvar.play:call("resource/warning.wav");
                return;
            else
                local v892 = l_result_2.name or v80.configs.text:get();
                if not v892 or v892 == "" then
                    print_raw("\ad6f1ffFFstellar\aFFFFFFFF \226\128\162 Please enter a config name");
                    cvar.play:call("resource/warning.wav");
                    return;
                else
                    v871[v892] = l_result_2.data;
                    v874 = v892;
                    v869:load(l_result_2.data);
                    update_config_list();
                    local v893 = {
                        [1] = "Default"
                    };
                    for v894, _ in pairs(v871) do
                        if v894 ~= "Default" then
                            table.insert(v893, v894);
                        end;
                    end;
                    for v896, v897 in ipairs(v893) do
                        if v897 == v892 then
                            v80.configs.list:set(v896);
                            break;
                        end;
                    end;
                    db.stellar_configs = v871;
                    print_raw("\ad6f1ffFFstellar\aFFFFFFFF \226\128\162 Config \ad6f1ffFF" .. v892 .. "\aFFFFFFFF successfully imported");
                    cvar.play:call("ui/beepclear");
                    return;
                end;
            end;
        end;
    end;
    v80.configs.list:set_callback(function()
        -- upvalues: v80 (ref), v871 (ref)
        local v898 = v80.configs.list:get();
        local v899 = {
            [1] = "Default"
        };
        for v900, _ in pairs(v871) do
            if v900 ~= "Default" then
                table.insert(v899, v900);
            end;
        end;
        local v902 = v899[v898];
        if v902 then
            v80.configs.text:set(v902);
        end;
    end);
    v80.configs.load:set_callback(function()
        -- upvalues: v80 (ref), v871 (ref)
        local v903 = v80.configs.list:get();
        local v904 = {
            [1] = "Default"
        };
        for v905, _ in pairs(v871) do
            if v905 ~= "Default" then
                table.insert(v904, v905);
            end;
        end;
        local v907 = v904[v903];
        if v907 then
            load_config(v907);
        else
            print_raw("\ad6f1ffFFstellar\aFFFFFFFF \226\128\162 No config selected");
            cvar.play:call("resource/warning.wav");
        end;
    end);
    v80.configs.save:set_callback(function()
        -- upvalues: v80 (ref)
        local v908 = v80.configs.text:get();
        save_config(v908);
    end);
    v80.configs.delete:set_callback(function()
        -- upvalues: v80 (ref), v871 (ref)
        local v909 = v80.configs.list:get();
        local v910 = {
            [1] = "Default"
        };
        for v911, _ in pairs(v871) do
            if v911 ~= "Default" then
                table.insert(v910, v911);
            end;
        end;
        local v913 = v910[v909];
        if v913 then
            delete_config(v913);
        else
            print_raw("\ad6f1ffFFstellar\aFFFFFFFF \226\128\162 No config selected");
            cvar.play:call("resource/warning.wav");
        end;
    end);
    v80.configs.export:set_callback(function()
        -- upvalues: v80 (ref), v871 (ref)
        local v914 = v80.configs.list:get();
        local v915 = {
            [1] = "Default"
        };
        for v916, _ in pairs(v871) do
            if v916 ~= "Default" then
                table.insert(v915, v916);
            end;
        end;
        local v918 = v915[v914];
        if v918 then
            export_config(v918);
        else
            print_raw("\ad6f1ffFFstellar\aFFFFFFFF \226\128\162 No config selected");
            cvar.play:call("resource/warning.wav");
        end;
    end);
    v80.configs.import:set_callback(function()
        import_config();
    end);
    update_config_list();
    return v869;
end;
config_system();
events.render:set(function(_)
    -- upvalues: v604 (ref), l_monylinear_0 (ref)
    watermark();
    crosshair();
    damage();
    velocity();
    aspect_ratio();
    viewmodel();
    v604();
    scope();
    if ui.get_alpha() > 0.1 then
        local v920 = l_monylinear_0:Animate("stellar.nightly", {
            ui.get_style("Link Active"), 
            color(50)
        }, -2.5, 1);
        ui.sidebar(v920, ui.get_icon("dove"));
    end;
end);
events.createmove:set(function(v921)
    -- upvalues: v595 (ref), v597 (ref)
    if ui.get_alpha() > 0 then
        v921.in_attack = false;
        v921.in_attack2 = false;
        v921.in_use = false;
    end;
    v595.on_createmove_1(v921);
    v597.no_fall_damage(v921);
    v597.jumping(v921);
    v597.fast_ladder(v921);
    v597.edge_stop(v921);
    antiaim(v921);
    hitchance();
end);
events.grenade_prediction:set(function(v922)
    -- upvalues: v595 (ref)
    v595.grenade_release(v922);
end);
events.grenade_override_view:set(function(v923)
    -- upvalues: v595 (ref)
    v595.on_grenade_override_view(v923);
end);