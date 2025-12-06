luaname = "polygone";
branch = "slim";
last_update = "01 | 08 | 25";
if common.get_username() == "Saf1x" then
    username = "admin";
else
    username = common.get_username();
end;
local l_x_0 = render.screen_size().x;
y = render.screen_size().y;
x = l_x_0;
l_x_0 = {};
local v1 = {
    [1] = "Shared", 
    [2] = "Standing", 
    [3] = "Moving", 
    [4] = "Walking", 
    [5] = "Crouching", 
    [6] = "Sneaking", 
    [7] = "Aerobic", 
    [8] = "Aerobic+", 
    [9] = "Fake Lag"
};
local v2 = {
    [1] = "Terrorist", 
    [2] = "Counter-Terrorist"
};
if branch == "dreamcore" then
    yaw_conds = {
        [1] = "Disabled", 
        [2] = "Default", 
        [3] = "Switch", 
        [4] = "Vladick"
    };
else
    yaw_conds = {
        [1] = "Disabled", 
        [2] = "Default", 
        [3] = "Switch"
    };
end;
if branch == "dreamcore" then
    defensive_yaw_conds = {
        [1] = "Disabled", 
        [2] = "Static", 
        [3] = "Switch", 
        [4] = "Random", 
        [5] = "Spin", 
        [6] = "Distortion", 
        [7] = "X-Way", 
        [8] = "Vladick", 
        [9] = "Secret"
    };
elseif build == "slim" then
    defensive_yaw_conds = {
        [1] = "Disabled", 
        [2] = "Static", 
        [3] = "Switch", 
        [4] = "Random", 
        [5] = "Spin", 
        [6] = "Distortion", 
        [7] = "X-Way", 
        [8] = "Secret"
    };
else
    defensive_yaw_conds = {
        [1] = "Disabled", 
        [2] = "Static", 
        [3] = "Switch", 
        [4] = "Random", 
        [5] = "Spin", 
        [6] = "Distortion", 
        [7] = "X-Way"
    };
end;
if branch == "dreamcore" then
    defensive_pitch_conds = {
        [1] = "Disabled", 
        [2] = "Down", 
        [3] = "Up", 
        [4] = "Random", 
        [5] = "Distortion", 
        [6] = "Spin", 
        [7] = "Switch", 
        [8] = "Swap", 
        [9] = "Vladick", 
        [10] = "Custom"
    };
elseif build == "slim" then
    defensive_pitch_conds = {
        [1] = "Disabled", 
        [2] = "Down", 
        [3] = "Up", 
        [4] = "Random", 
        [5] = "Distortion", 
        [6] = "Spin", 
        [7] = "Switch", 
        [8] = "Swap", 
        [9] = "Custom"
    };
else
    defensive_pitch_conds = {
        [1] = "Disabled", 
        [2] = "Down", 
        [3] = "Up", 
        [4] = "Random", 
        [5] = "Distortion", 
        [6] = "Spin", 
        [7] = "Switch", 
        [8] = "Custom"
    };
end;
local v3 = {
    pui = require("neverlose/pui"), 
    gradient = require("neverlose/gradient"), 
    base64 = require("neverlose/base64"), 
    clipboard = require("neverlose/clipboard"), 
    ffi = require("ffi"), 
    drag_system = require("neverlose/drag_system"), 
    mtools = require("neverlose/MTools")
};
local v4 = {
    ragebot = {
        hide_shots = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"), 
        hs_options = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options"), 
        double_tap = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"), 
        backtrack = ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Extended Backtrack"), 
        dt_options = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"), 
        dt_teleport = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Immediate Teleport"), 
        dt_limit = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Fake Lag Limit"), 
        qp_options = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist", "Auto Stop"), 
        fake_latency = ui.find("Miscellaneous", "Main", "Other", "Fake Latency"), 
        weapon_actions = ui.find("Miscellaneous", "Main", "Other", "Weapon Actions"), 
        min_damage = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"), 
        hitchance = ui.find("Aimbot", "Ragebot", "Selection", "Hit Chance"), 
        auto_hitchance = ui.find("Aimbot", "Ragebot", "Selection", "AutoSnipers", "Hit Chance"), 
        awp_hitchance = ui.find("Aimbot", "Ragebot", "Selection", "AWP", "Hit Chance"), 
        scout_hitchance = ui.find("Aimbot", "Ragebot", "Selection", "SSG-08", "Hit Chance"), 
        r8_hitchance = ui.find("Aimbot", "Ragebot", "Selection", "R8 Revolver", "Hit Chance"), 
        da = ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot"), 
        force_body = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim"), 
        safe_point = ui.find("Aimbot", "Ragebot", "Safety", "Safe Points"), 
        peek_assist = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist")
    }, 
    antiaims = {
        enable = ui.find("Aimbot", "Anti Aim", "Angles", "Enabled"), 
        pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"), 
        yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"), 
        yaw_base = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"), 
        yaw_offset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"), 
        avoid_backstab = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab"), 
        hidden = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden"), 
        yaw_modifier = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"), 
        modifier_offset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"), 
        body_yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"), 
        left_limit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"), 
        right_limit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"), 
        options = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"), 
        freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"), 
        freestanding_modifier = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Disable Yaw Modifiers"), 
        freestanding_body = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Body Freestanding"), 
        fl_limit = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Limit")
    }, 
    misc_antiaims = {
        fake_duck = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"), 
        slow_walk = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"), 
        legs_movement = ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement")
    }, 
    visuals = {
        scope_overlay = ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay"), 
        nl_souls = ui.find("Miscellaneous", "Main", "Other", "Windows")
    }, 
    misc = {
        auto_strafe = ui.find("Miscellaneous", "Main", "Movement", "Air Strafe"), 
        strafe_assist = ui.find("Miscellaneous", "Main", "Movement", "Strafe Assist")
    }
};
local v5 = {
    [1] = "\240\157\149\159\240\157\149\150\240\157\149\167\240\157\149\150\240\157\149\163\240\157\149\157\240\157\149\160\240\157\149\164\240\157\149\150.\240\157\149\148\240\157\149\148/\240\157\149\158\240\157\149\146\240\157\149\163\240\157\149\156\240\157\149\150\240\157\149\165/\240\157\149\154\240\157\149\165\240\157\149\150\240\157\149\158?\240\157\149\154\240\157\149\149=\240\157\149\157\240\157\149\147\240\157\149\171\226\132\154\240\157\149\165\240\157\148\185", 
    [2] = "\240\157\149\168\240\157\149\168\240\157\149\168.\240\157\149\170\240\157\149\160\240\157\149\166\240\157\149\165\240\157\149\166\240\157\149\147\240\157\149\150.\240\157\149\148\240\157\149\160\240\157\149\158/@\240\157\149\138\240\157\149\146\240\157\149\151\240\157\159\153\240\157\149\169", 
    [3] = "\208\149\208\145\208\144\208\162\208\172 \208\162\208\175 \208\160\208\144\208\151\208\156\208\144\208\151\208\144\208\155\208\158 \208\165\208\163\208\149\208\161\208\158\208\161", 
    [4] = "\208\177\208\176\208\185 polygone \209\131\208\181\208\177\208\184\209\137\208\181", 
    [5] = "\226\132\153 \240\157\149\134 \240\157\149\131 \240\157\149\144 \240\157\148\190 \240\157\149\134 \226\132\149 \240\157\148\188", 
    [6] = "1", 
    [7] = "1\209\142", 
    [8] = "\209\130\209\139 \209\129\209\130\209\128\208\181\208\187\209\143\208\181\209\136\209\140 \208\186\208\176\208\186 \208\188\208\176\209\130\209\140 \209\130\208\178\208\190\209\143 \208\178\208\181\208\189\209\139 \209\128\208\181\208\182\208\181\209\130 \226\128\148 \208\186\209\128\208\184\208\178\208\190, \208\189\208\190 \209\129\209\130\208\176\208\177\208\184\208\187\209\140\208\189\208\190", 
    [9] = "\209\131 \209\130\209\143 \209\135\208\181 \208\188\209\139\209\136\208\186\208\176 \208\178 \208\182\208\190\208\191\208\181", 
    [10] = "\208\191\208\190\208\187\208\184\208\179\208\190\208\189 \208\191\209\128\208\184\208\186\209\131\208\191\208\184 \208\191\208\190 \209\129\208\186\208\184\208\180\208\186\208\181 \208\177\208\187\209\143", 
    [11] = "1."
};
local v6 = {
    [1] = "jyfdfggsfdgfsdfsgd", 
    [2] = "NDJZ VFNM IFKFDF T,FYFZ CSY IFDRKB", 
    [3] = "\209\132\209\131 \208\189\208\176\209\133\209\131\208\185", 
    [4] = "\208\181\208\177\208\176\208\189\209\139\208\185 \208\186\208\187\208\190\208\191", 
    [5] = "gs09gfddgf90-fgds0-", 
    [6] = "\208\186\209\131\208\180\208\176 \209\130\209\139 \208\188\208\181\208\189\209\143 \208\178 \208\183\208\176\209\131\209\129\208\181\208\189\208\181\209\134 \209\130\209\128\208\181\208\186\208\189\209\131\208\187 \209\131\208\181\208\177\208\184\209\137\208\181", 
    [7] = "T<FYSQ CSY IK>{F}", 
    [8] = "\209\132\209\131 \208\189\208\176\209\133\209\131\208\185", 
    [9] = "\208\152\208\179\209\128\208\190\208\186.", 
    [10] = "\208\190\209\129\209\130\208\190\208\191\208\184\208\183\208\180\208\184\208\187 \208\188\208\181\208\189\209\143 \209\131\208\182\208\181", 
    [11] = "\208\177\208\181\208\183\208\180\208\176\209\128\208\189\208\176\209\143 \209\133\209\131\208\185\208\189\209\143"
};
local v7 = {
    [1] = "1"
};
local v8 = {
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
local function v12(v9, v10, v11)
    return v9 + (v10 - v9) * v11;
end;
math.max_lerp_low_fps = 2.2222222222222223;
math.lerp = function(v13, v14, v15)
    if v13 == v14 then
        return v14;
    else
        local v16 = globals.frametime * 170;
        v15 = v15 * math.min(v16, math.max_lerp_low_fps);
        local v17 = v13 + (v14 - v13) * globals.frametime * v15;
        if math.abs(v17 - v14) < 0.01 then
            return v14;
        else
            return v17;
        end;
    end;
end;
local _ = 0.095;
local v19 = {};
local function v24(v20, v21, v22, v23)
    -- upvalues: v19 (ref)
    if not v22 then

    end;
    if v19[v20] == nil then
        v19[v20] = v23 and v23 or 0;
    end;
    v19[v20] = math.lerp(v19[v20], v21, v22);
    return v19[v20];
end;
clamp = function(v25, v26, v27)
    if v25 < v26 then
        return v26;
    elseif v27 < v25 then
        return v27;
    else
        return v25;
    end;
end;
is_menu_opened = function()
    if ui.get_alpha() > 0 then
        return true;
    else
        return false;
    end;
end;
v3.ffi.cdef("    void* __stdcall URLDownloadToFileA(void* LPUNKNOWN, const char* LPCSTR, const char* LPCSTR2, int a, int LPBINDSTATUSCALLBACK);\n    bool DeleteUrlCacheEntryA(const char* lpszUrlName);\n");
ffi.cdef("    typedef void*(__thiscall* get_client_entity_t)(void*, int);\n    typedef struct {\n        char  pad_0000[20];\n        int m_nOrder; //0x0014\n        int m_nSequence; //0x0018\n        float m_flPrevCycle; //0x001C\n        float m_flWeight; //0x0020\n        float m_flWeightDeltaRate; //0x0024\n        float m_flPlaybackRate; //0x0028\n        float m_flCycle; //0x002C\n        void *m_pOwner; //0x0030\n        char  pad_0038[4]; //0x0034\n    } animstate_layer_t;\n");
ffi.cdef("    typedef struct {\n        float x;\n        float y;\n        float z;\n    } vector_t;\n");
local _ = ffi.typeof("uintptr_t**");
local v29 = utils.get_vfunc("client.dll", "VClientEntityList003", 3, "void*(__thiscall*)(void*, int)");
local v30 = nil;
files.create_folder("nl\\polygone");
local v31 = {
    n = {
        [1] = "Default Preset"
    }, 
    cfg = {
        [1] = ""
    }
};
if files.read("nl/polygone/configs.poly") == nil then
    files.write("nl/polygone/configs.poly", json.stringify(v31));
end;
local v32 = json.parse(files.read("nl/polygone/configs.poly"));
local v33 = {
    calibri = render.load_font("Calibri", 24, "abd"), 
    calibri2 = render.load_font("Calibri", 22, "abd"), 
    calibri3 = render.load_font("Calibri", 12, "ad")
};
local function v35()
    -- upvalues: v3 (ref)
    local v34 = v3.gradient.text_animate("polygone ~ ", -1.5, {
        color(255, 255, 255), 
        color(100, 100, 100)
    });
    v34:animate();
    ui.sidebar(v34:get_animated_text(), "hexagon");
end;
local v36 = {
    infoTab = v3.pui.create("\v\f<hexagon>", "\n\vpolygone \r- INFORMATION", 1), 
    infoTab2 = v3.pui.create("\v\f<hexagon>", "\n\vpolygone \r- poly", 1), 
    cfgTab = v3.pui.create("\v\f<hexagon>", "\n\vpolygone \r- CONFIGS", 2), 
    chooseTab = v3.pui.create("\v\f<shield-halved>", "\n\vpolygone \r- CHOOSE TAB", 1), 
    stateTab = v3.pui.create("\v\f<shield-halved>", "\n\vpolygone \r- CONDITIONS", 1), 
    disablersTab = v3.pui.create("\v\f<shield-halved>", "\n\vpolygone \r- DISABLERS", 1), 
    mainAa = v3.pui.create("\v\f<shield-halved>", "\n\vpolygone \r- MAIN", 2), 
    builderAa = v3.pui.create("\v\f<shield-halved>", "\n\vpolygone \r- BUILDER", 2), 
    builderAa_yaw = v3.pui.create("\v\f<shield-halved>", "\n\vpolygone \r- YAW", 2), 
    builderAa_yawMod = v3.pui.create("\v\f<shield-halved>", "\n\vpolygone \r- YAW MODIFER", 2), 
    builderAa_bodyYaw = v3.pui.create("\v\f<shield-halved>", "\n\vpolygone \r- BODY YAW", 2), 
    builderAa_defensive = v3.pui.create("\v\f<shield-halved>", "\n\vpolygone \r- DEFENSIVE AA", 2), 
    builderAa_defensive_pitch = v3.pui.create("\v\f<shield-halved>", "\n\vpolygone \r- DEFENSIVE AA PITCH", 2), 
    builderAa_defensive_yaw = v3.pui.create("\v\f<shield-halved>", "\n\vpolygone \r- DEFENSIVE AA YAW", 2), 
    sendTab = v3.pui.create("\v\f<shield-halved>", "\n", 2), 
    selectTab = v3.pui.create("\v\f<mistletoe>", "\n\vpolygone \r- select", 1), 
    selectTab2 = v3.pui.create("\v\f<mistletoe>", "\n\vpolygone \r- select2", 1), 
    ragebotTab = v3.pui.create("\v\f<mistletoe>", "\n\vpolygone \r- RAGEBOT", 2), 
    visualsTab = v3.pui.create("\v\f<mistletoe>", "\n\vpolygone \r- VISUALS", 2), 
    visualsTab2 = v3.pui.create("\v\f<mistletoe>", "\n\vpolygone \r- VISUALS2", 1), 
    miscTab = v3.pui.create("\v\f<mistletoe>", "\n\vpolygone \r- MISC", 2)
};
local v72 = {
    info = {
        welcomeLabel0 = v36.infoTab:label(" \v\f<circle-info> Info: "), 
        welcomeLabel = v36.infoTab:label("  \v\f<angle-right>  User "), 
        welcomeLabel = v36.infoTab:button(username, function()

        end, true), 
        branchLabel = v36.infoTab:label("  \v\f<angle-right>  Branch: "), 
        branchLabel = v36.infoTab:button(branch, function()

        end, true), 
        lastUpdateLabel = v36.infoTab:label("  \v\f<angle-right>  Last Update: "), 
        lastUpdateLabel = v36.infoTab:button(last_update, function()

        end, true), 
        welcomeLabel2 = v36.infoTab:label(" \v\f<link>Links: "), 
        cfgLabel = v36.infoTab:button("   \v\f<gears>   ", function()
            panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://neverlose.cc/market/item?id=pnpA5c");
        end, true), 
        discordLabel = v36.infoTab:button("   \v\f<discord>   ", function()
            panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://discord.gg/WUtEsfazp8");
        end, true), 
        youtubeLabel = v36.infoTab:button("   \v\f<youtube>   ", function()
            panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://www.youtube.com/@Saf1x");
        end, true), 
        themeLabel = v36.infoTab:button("    \v\f<droplet>    ", function()
            panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://neverlose.cc/getitem?c=o33uEVIzBjnM72lu-1FwFOWGly6");
        end, true), 
        welcomeLabel0 = v36.infoTab2:label("                             \vpolygone\r ~ 2025")
    }, 
    antiaims = {
        current_tab = v36.chooseTab:list("\n ", {
            [1] = "Main", 
            [2] = "Regular Builder", 
            [3] = "Defensive Builder"
        }), 
        current_team = v36.stateTab:combo("\n  ", v2), 
        current_state = v36.stateTab:combo("\n  ", v1), 
        aa_disablers = v36.disablersTab:listable("\n", {
            [1] = "Disable Jitter Move", 
            [2] = "Disable on Warm Up", 
            [3] = "Disable on Round End", 
            [4] = "Disable when no enemies", 
            [5] = "Disable Defensive AA"
        }), 
        yaw_base = v36.mainAa:label("\v\f<left-right> \rYaw Base", function(v37)
            return {
                select_side = v37:combo("Yaw Base", {
                    [1] = "Local View", 
                    [2] = "At Target", 
                    [3] = "Left", 
                    [4] = "Right", 
                    [5] = "Forward", 
                    [6] = "Backward"
                }), 
                left_side = v37:slider("[\vLeft\r] Offset", -180, 180, -90, 1, "\194\176"), 
                right_side = v37:slider("[\vRight\r] Offset", -180, 180, 90, 1, "\194\176"), 
                manipulations = v37:selectable("Manipulations", {
                    [1] = "Static", 
                    [2] = "Defensive E-Spam"
                })
            };
        end), 
        safe_head = v36.mainAa:switch("\v\f<user-helmet-safety>  \rSafe Head", false, function(v38)
            return {
                select = v38:listable("\n", {
                    [1] = "On Knife", 
                    [2] = "On Taser", 
                    [3] = "Higher than enemy"
                }), 
                e_spam_on_safe = v38:switch("E Spam"), 
                disable_defensive_on_safe = v38:switch("Disable Defensive AA")
            };
        end), 
        auto_osaa = v36.mainAa:switch("\v\f<eye-slash>\rAuto Hide-Shots", false, function(v39)
            return {
                select = v39:selectable("\n", {
                    [1] = "Standing", 
                    [2] = "Walking", 
                    [3] = "Crouching", 
                    [4] = "Sneaking"
                }), 
                disables = v39:selectable("Disable on", {
                    [1] = "Scout", 
                    [2] = "AWP", 
                    [3] = "Auto", 
                    [4] = "Deagle & R8"
                })
            };
        end), 
        air_lag = v36.mainAa:switch("\v\f<rocket-launch> \rAir Lag", false, function(v40)
            return {
                ticks = v40:slider("Ticks", 5, 15, 10, 1, "t")
            };
        end), 
        additions = v36.mainAa:listable("\n", {
            [1] = "Anti-Backstab", 
            [2] = "Ping Safe"
        }), 
        defensive_flick = v36.mainAa:switch("\v\f<bolt>  Defensive \rFlick Exploit", false, function(v41)
            return {
                flick_type = v41:combo("Type", {
                    [1] = "Left", 
                    [2] = "Right", 
                    [3] = "Swap", 
                    [4] = "Jitter", 
                    [5] = "Custom"
                }), 
                flick_limit = v41:slider("Limit", -110, 110, 0, 1, "\194\176"), 
                flick_left = v41:slider("[\vLeft\r] Limit", -110, 110, 0, 1, "\194\176"), 
                flick_right = v41:slider("[\vRight\r] Limit", -110, 110, 0, 1, "\194\176"), 
                ticks = v41:slider("Ticks", 1, 15, 1), 
                pitch = v41:combo("Pitch", {
                    [1] = "Down", 
                    [2] = "Up", 
                    [3] = "Half Up", 
                    [4] = "Half Down", 
                    [5] = "Random", 
                    [6] = "Distortion", 
                    [7] = "Custom"
                }), 
                pitch_value = v41:slider("Value", -89, 89, 0, 1, "\194\176")
            };
        end), 
        freestanding = v36.mainAa:label("\v\f<person>   \rFreestanding", function(v42)
            return {
                switch = v42:switch("Freestanding"), 
                disablers = v42:selectable("Disablers", {
                    [1] = "Standing", 
                    [2] = "Moving", 
                    [3] = "Walking", 
                    [4] = "Crouching", 
                    [5] = "Sneaking", 
                    [6] = "Air", 
                    [7] = "Air Crouching"
                }), 
                manipulations = v42:selectable("Manipulations", {
                    [1] = "Disable Yaw Modifiers", 
                    [2] = "Body Freestanding"
                })
            };
        end)
    }, 
    select_tab = {
        select_main_tab = v36.selectTab:list("\n", {
            [1] = "Visuals", 
            [2] = "Utils"
        }), 
        select_utils_tab = v36.selectTab2:list("\n", {
            [1] = "Ragebot", 
            [2] = "Other"
        })
    }, 
    ragebot = {
        prediction_system = v36.ragebotTab:label("\v\f<hexagon> \r\aFFFFFFFFPrediction System", function(v43)
            return {
                switch = v43:switch("Enable", false), 
                mode = v43:list("\n", {
                    [1] = "Stable", 
                    [2] = "Unstable"
                }), 
                weapons = v43:selectable("\n\n ", {
                    [1] = "Scout", 
                    [2] = "AWP", 
                    [3] = "Auto"
                }), 
                conditions = v43:selectable("\n\n  ", {
                    [1] = "Standing", 
                    [2] = "Walking", 
                    [3] = "Crouching", 
                    [4] = "Sneaking"
                })
            };
        end), 
        ragebot_improvements = v36.ragebotTab:label("\v\f<shuffle> \r\aFFFFFFFFRagebot Improvements", false, function(v44)
            return {
                defensive_improvements = v44:switch("\aFFFFFFFFBetter Defensive"), 
                last_tick_backtrack = v44:switch("\aFFFFFFFFBetter Backtrack")
            };
        end), 
        overrideInAir = v36.ragebotTab:label("\v\f<person-falling>\r \aFFFFFFFFOverride Hitchance in Air", false, function(v45)
            return {
                hitchance_inair_weapon = v45:selectable("\n", {
                    [1] = "Scout", 
                    [2] = "R8"
                }), 
                hitchance_inair_scout = v45:slider("Scout Hitchance", 0, 100, 0, 1), 
                hitchance_inair_r8 = v45:slider("R8 Hitchance", 0, 100, 0, 1)
            };
        end), 
        overrideFD = v36.ragebotTab:label("\v\f<duck>\r \aFFFFFFFFOverride Hitchance on FD", false, function(v46)
            return {
                hitchance_fd_weapon = v46:selectable("\n", {
                    [1] = "Scout", 
                    [2] = "Auto", 
                    [3] = "AWP", 
                    [4] = "R8"
                }), 
                hitchance_fd_scout = v46:slider("Scout Hitchance", 0, 100, 0, 1), 
                hitchance_fd_scar = v46:slider("Auto Hitchance", 0, 100, 0, 1), 
                hitchance_fd_awp = v46:slider("Awp Hitchance", 0, 100, 0, 1), 
                hitchance_fd_r8 = v46:slider("R8 Hitchance", 0, 100, 0, 1)
            };
        end), 
        overrideNoscope = v36.ragebotTab:label("\v\f<telescope>\r\aFFFFFFFFOverride Noscope Hitchance", false, function(v47)
            return {
                hitchance_noscope_weapon = v47:selectable("\n", {
                    [1] = "Scout", 
                    [2] = "Auto", 
                    [3] = "AWP"
                }), 
                hitchance_noscope_scout = v47:slider("Scout Hitchance", 0, 100, 0, 1), 
                hitchance_noscope_scar = v47:slider("Auto Hitchance", 0, 100, 0, 1), 
                hitchance_noscope_awp = v47:slider("Awp Hitchance", 0, 100, 0, 1)
            };
        end)
    }, 
    visuals = {
        aspect_ratio = v36.visualsTab2:switch("\v\f<tv> \rAspect Ratio", false, function(v48)
            return {
                offset = v48:slider("\n", 0, 200, 0, 1, function(v49)
                    return v49 == 0 and "Off" or tostring(v49) .. "X";
                end)
            };
        end), 
        viewmodel = v36.visualsTab2:switch("\v\f<hand>  \rViewmodel Changer", false, function(v50)
            return {
                fov = v50:slider("FOV", -100, 100, 68, 1, function(v51)
                    return v51 == 68 and "Default" or tostring(v51) .. "\194\176";
                end), 
                x = v50:slider("X", -100, 100, 25, 1, function(v52)
                    return v52 == 25 and "Default" or tostring(v52) .. "x";
                end), 
                y = v50:slider("Y", -100, 100, 0, 1, function(v53)
                    return v53 == 0 and "Default" or tostring(v53) .. "y";
                end), 
                z = v50:slider("Z", -100, 100, -15, 1, function(v54)
                    return v54 == -15 and "Default" or tostring(v54) .. "z";
                end), 
                opposite_weapon = v50:switch("Left Hand Weapon"), 
                opposite_knife = v50:switch("Opposite Knife")
            };
        end), 
        crosshair_inds = v36.visualsTab:switch("\v\f<triangle> \rCrosshair Indicators", false, function(v55)
            return {
                inds_type = v55:list("\n ", {
                    [1] = "Old School", 
                    [2] = "Modern Style"
                }), 
                style = v55:list("\n  ", {
                    [1] = "Static", 
                    [2] = "Animated"
                }), 
                additions = v55:selectable("\n   ", {
                    [1] = "Glow", 
                    [2] = "Anti-Aims States", 
                    [3] = "Desync Side", 
                    [4] = "Keybinds"
                }), 
                s_color = v55:color_picker("Color", color(250, 200, 140, 255)), 
                offset = v55:slider("Offset", 25, 200, 32, 1, function(v56)
                    if v56 == 32 then
                        return "Default";
                    else
                        return tostring(v56);
                    end;
                end), 
                g1_color = v55:color_picker("[\vFirst\r] Color", color(250, 200, 140, 255)), 
                g2_color = v55:color_picker("[\vSecond\r] Color", color(55, 55, 55, 255))
            };
        end), 
        damage_ind = v36.visualsTab:switch("\v\f<droplet>  \rDamage Indicator", false, function(v57)
            return {
                pixel = v57:switch("Pixel"), 
                accent_color = v57:color_picker("Accent Color", color(255, 255, 255, 255))
            };
        end), 
        manual_arrows = v36.visualsTab:switch("\v\f<right-left> \rManual Arrows", false, function(v58)
            return {
                select = v58:list("\n", {
                    [1] = "Team Skeet", 
                    [2] = "Invictus", 
                    [3] = "Modern"
                }), 
                color1 = v58:color_picker("[\vMain\r] Color", color(250, 200, 140, 255)), 
                color2 = v58:color_picker("[\vInverter\r] Color", color(255, 255, 255, 255)), 
                velocity_mode = v58:switch("Velocity mode")
            };
        end), 
        custom_scope = v36.visualsTab:switch("\v\f<telescope>\rCustom Scope", false, function(v59)
            return {
                select = v59:listable("\n", {
                    [1] = "Rotated", 
                    [2] = "T-Based", 
                    [3] = "Animated", 
                    [4] = "Inverted"
                }), 
                gap = v59:slider("Gap", 1, 50, 20), 
                lenght = v59:slider("Lenght", 5, 200, 120), 
                accent_color = v59:color_picker("Accent Color", color(255, 255, 255, 255))
            };
        end), 
        gs_inds = v36.visualsTab2:switch(" \a96C83CFF$   \rIndicators", false, function(v60)
            return {
                select = v60:selectable("\n", {
                    [1] = "Dormant Aimbot", 
                    [2] = "Min. Damage", 
                    [3] = "Hitchance Override", 
                    [4] = "Fake Angles", 
                    [5] = "Lag Compensation", 
                    [6] = "Force Baim", 
                    [7] = "Safe Points", 
                    [8] = "Fake Latency", 
                    [9] = "Fake Duck", 
                    [10] = "Freestanding", 
                    [11] = "Hide Shot", 
                    [12] = "Double Tap"
                }), 
                spec_list = v60:switch("Spectator List")
            };
        end), 
        windows = v36.visualsTab2:label("\v\f<window-restore>  \rWindows", false, function(v61)
            return {
                velocity_warning = v61:switch("Velocity Warning"), 
                velocity_warning_color = v61:color_picker("Color", color(250, 200, 140, 255)), 
                defensive_warning = v61:switch("Defensive Indication"), 
                in_air = v61:switch("Only in Air"), 
                defensive_warning_color = v61:color_picker("Color", color(250, 200, 140, 255))
            };
        end), 
        grenade_radius = v36.visualsTab:switch("\v\f<circle-notch>  \rNade Radius", false, function(v62)
            return {
                select = v62:listable("\n", {
                    [1] = "Molotov", 
                    [2] = "Smoke"
                }), 
                molotov_color = v62:color_picker("[\vMolotov\r] Color", color(255, 130, 130, 255)), 
                smoke_color = v62:color_picker("[\vSmoke\r] Color", color(130, 220, 255, 255))
            };
        end), 
        anim_breaker = v36.visualsTab:switch("\v\f<person-falling-burst> \rAnimation Breaker", false, function(v63)
            return {
                other = v63:listable("\n", {
                    [1] = "Move Lean", 
                    [2] = "Pitch 0 on Land", 
                    [3] = "dolbaeb"
                }), 
                on_ground = v63:combo("On Land", {
                    [1] = "Disabled", 
                    [2] = "Static", 
                    [3] = "Jitter", 
                    [4] = "Walking", 
                    [5] = "Kangaroo"
                }), 
                jitter_speed = v63:slider("Jitter speed", 0, 100, 35, "V"), 
                in_air = v63:combo("In Air", {
                    [1] = "Disabled", 
                    [2] = "Static", 
                    [3] = "Walking", 
                    [4] = "Kangaroo"
                })
            };
        end), 
        modern_hitmarker = v36.visualsTab:switch("\v\f<sparkles>  \rHitmarker", false, function(v64)
            return {
                hitmarker_type = v64:list("\n", {
                    [1] = "Circle", 
                    [2] = "Plus", 
                    [3] = "Dot"
                }), 
                hitmarker_color = v64:color_picker("Color")
            };
        end), 
        watermark = v36.visualsTab2:label("\v\f<copyright>  \rBranded Watermark", function(v65)
            return {
                mode = v65:list("\n", {
                    [1] = "Modern", 
                    [2] = "Minimalistic"
                }), 
                pos = v65:list("\n", {
                    [1] = "Bottom", 
                    [2] = "Left", 
                    [3] = "Right"
                }), 
                g1_color = v65:color_picker("[\vFirst\r] Color", color(250, 200, 140, 255)), 
                g2_color = v65:color_picker("[\vSecond\r] Color", color(200, 200, 200, 255))
            };
        end)
    }, 
    other = {
        ragebot_logging = v36.miscTab:switch("\v\f<list-timeline>  \rRagebot Logging", false, function(v66)
            return {
                logs_type = v66:combo("Logs Type", {
                    [1] = "Monochrome", 
                    [2] = "Colored"
                }), 
                logs_color_brand = v66:color_picker("Logs Color [\a78FFA7FFBrand\r]", color(250, 200, 140, 255)), 
                logs_color_hit = v66:color_picker("Logs Color [\a78FFA7FFHit\r]", color(120, 255, 170, 255)), 
                logs_color_miss = v66:color_picker("Logs Color [\aFF7878FFMiss\r]", color(255, 120, 120, 255)), 
                buy_logs = v66:switch("Purchases Logs"), 
                under_crosshair_logs = v66:switch("Under Crosshair Logs"), 
                under_crosshair_logs_color_hit = v66:color_picker("Crosshair Logs Color [\a78FFA7FFHit\r]", color(145, 255, 200, 255)), 
                under_crosshair_logs_color_miss = v66:color_picker("Crosshair Logs Color [\a78FFA7FFMiss\r]", color(255, 120, 120, 255))
            };
        end), 
        trashtalk = v36.miscTab:switch("\v\f<trash-can-list> \rTrash Talk", false, function(v67)
            return {
                mode = v67:list("\n  ", {
                    [1] = "Default", 
                    [2] = "dead inside"
                }), 
                tt_on = v67:listable("\n", {
                    [1] = "On Kill", 
                    [2] = "On Death"
                }, 1, 2)
            };
        end), 
        clantag = v36.miscTab:switch("\v\f<user-tag> \rClan-Tag Spammer"), 
        fake_latency = v36.miscTab:switch("\v\f<wifi> \rUnlock Fake Latency", false, function(v68)
            return {
                value_slider = v68:slider("\n", 0, 200, 100, 1, function(v69)
                    return v69 == 0 and "Off" or tostring(v69) .. "ms";
                end)
            };
        end), 
        movement_manipulations = v36.miscTab:label("\v\f<person-falling>  \rMovement Helpers", false, function(v70)
            return {
                helpers = v70:listable("\n", {
                    [1] = "Fast Ladder", 
                    [2] = "No Fall Damage", 
                    [3] = "Unlock Fake-Duck Speed"
                })
            };
        end), 
        nade_manipulations = v36.miscTab:label("\v\f<screwdriver-wrench>  \rNade Helpers", false, function(v71)
            return {
                manipulations = v71:listable("\n", {
                    [1] = "Nade Throw Fix", 
                    [2] = "Super Toss", 
                    [3] = "Auto Nade Release"
                }), 
                auto_granade_release_damage = v71:slider("Minimum Damage", 1, 50, 0, 1, "hp")
            };
        end)
    }
};
v72.antiaims.current_team:depend({
    [1] = nil, 
    [2] = 2, 
    [3] = 3, 
    [1] = v72.antiaims.current_tab
});
v72.antiaims.current_state:depend({
    [1] = nil, 
    [2] = 2, 
    [3] = 3, 
    [1] = v72.antiaims.current_tab
});
v72.antiaims.safe_head:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v72.antiaims.current_tab
});
v72.antiaims.auto_osaa:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v72.antiaims.current_tab
});
v72.antiaims.air_lag:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v72.antiaims.current_tab
});
v72.antiaims.defensive_flick:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v72.antiaims.current_tab
});
v72.antiaims.yaw_base:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v72.antiaims.current_tab
});
v72.antiaims.freestanding:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v72.antiaims.current_tab
});
v72.antiaims.additions:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v72.antiaims.current_tab
});
v72.antiaims.aa_disablers:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v72.antiaims.current_tab
});
v72.antiaims.safe_head.select:depend({
    [1] = nil, 
    [2] = true, 
    [1] = v72.antiaims.safe_head
});
v72.antiaims.safe_head.e_spam_on_safe:depend({
    [1] = nil, 
    [2] = true, 
    [1] = v72.antiaims.safe_head
}, {
    [1] = nil, 
    [2] = false, 
    [1] = v72.antiaims.safe_head.disable_defensive_on_safe
});
v72.antiaims.safe_head.disable_defensive_on_safe:depend({
    [1] = nil, 
    [2] = true, 
    [1] = v72.antiaims.safe_head
}, {
    [1] = nil, 
    [2] = false, 
    [1] = v72.antiaims.safe_head.e_spam_on_safe
});
v72.antiaims.auto_osaa.select:depend({
    [1] = nil, 
    [2] = true, 
    [1] = v72.antiaims.auto_osaa
});
v72.antiaims.auto_osaa.disables:depend({
    [1] = nil, 
    [2] = true, 
    [1] = v72.antiaims.auto_osaa
});
v72.antiaims.air_lag.ticks:depend({
    [1] = nil, 
    [2] = true, 
    [1] = v72.antiaims.air_lag
});
v72.antiaims.defensive_flick.flick_type:depend(v72.antiaims.defensive_flick);
v72.antiaims.defensive_flick.ticks:depend(v72.antiaims.defensive_flick);
v72.antiaims.defensive_flick.pitch:depend(v72.antiaims.defensive_flick);
v72.antiaims.defensive_flick.pitch_value:depend({
    [1] = nil, 
    [2] = true, 
    [1] = v72.antiaims.defensive_flick
}, {
    [1] = nil, 
    [2] = "Custom", 
    [3] = "Swap", 
    [1] = v72.antiaims.defensive_flick.pitch
});
v72.antiaims.defensive_flick.flick_limit:depend({
    [1] = nil, 
    [2] = true, 
    [1] = v72.antiaims.defensive_flick
}, {
    [1] = nil, 
    [2] = "Custom", 
    [3] = "Swap", 
    [1] = v72.antiaims.defensive_flick.flick_type
});
v72.antiaims.defensive_flick.flick_left:depend({
    [1] = nil, 
    [2] = true, 
    [1] = v72.antiaims.defensive_flick
}, {
    [1] = nil, 
    [2] = "Jitter", 
    [1] = v72.antiaims.defensive_flick.flick_type
});
v72.antiaims.defensive_flick.flick_right:depend({
    [1] = nil, 
    [2] = true, 
    [1] = v72.antiaims.defensive_flick
}, {
    [1] = nil, 
    [2] = "Jitter", 
    [1] = v72.antiaims.defensive_flick.flick_type
});
v72.select_tab.select_utils_tab:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v72.select_tab.select_main_tab
});
v72.ragebot.prediction_system:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v72.select_tab.select_main_tab
}, {
    [1] = nil, 
    [2] = 1, 
    [1] = v72.select_tab.select_utils_tab
});
v72.ragebot.ragebot_improvements:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v72.select_tab.select_main_tab
}, {
    [1] = nil, 
    [2] = 1, 
    [1] = v72.select_tab.select_utils_tab
});
v72.ragebot.overrideInAir:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v72.select_tab.select_main_tab
}, {
    [1] = nil, 
    [2] = 1, 
    [1] = v72.select_tab.select_utils_tab
});
v72.ragebot.overrideNoscope:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v72.select_tab.select_main_tab
}, {
    [1] = nil, 
    [2] = 1, 
    [1] = v72.select_tab.select_utils_tab
});
v72.ragebot.overrideFD:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v72.select_tab.select_main_tab
}, {
    [1] = nil, 
    [2] = 1, 
    [1] = v72.select_tab.select_utils_tab
});
v72.other.ragebot_logging:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v72.select_tab.select_main_tab
}, {
    [1] = nil, 
    [2] = 2, 
    [1] = v72.select_tab.select_utils_tab
});
v72.other.trashtalk:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v72.select_tab.select_main_tab
}, {
    [1] = nil, 
    [2] = 2, 
    [1] = v72.select_tab.select_utils_tab
});
v72.other.clantag:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v72.select_tab.select_main_tab
}, {
    [1] = nil, 
    [2] = 2, 
    [1] = v72.select_tab.select_utils_tab
});
v72.other.fake_latency:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v72.select_tab.select_main_tab
}, {
    [1] = nil, 
    [2] = 2, 
    [1] = v72.select_tab.select_utils_tab
});
v72.other.movement_manipulations:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v72.select_tab.select_main_tab
}, {
    [1] = nil, 
    [2] = 2, 
    [1] = v72.select_tab.select_utils_tab
});
v72.other.nade_manipulations:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v72.select_tab.select_main_tab
}, {
    [1] = nil, 
    [2] = 2, 
    [1] = v72.select_tab.select_utils_tab
});
v72.visuals.aspect_ratio:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v72.select_tab.select_main_tab
});
v72.visuals.viewmodel:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v72.select_tab.select_main_tab
});
v72.visuals.grenade_radius:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v72.select_tab.select_main_tab
});
v72.visuals.anim_breaker:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v72.select_tab.select_main_tab
});
v72.visuals.crosshair_inds:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v72.select_tab.select_main_tab
});
v72.visuals.damage_ind:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v72.select_tab.select_main_tab
});
v72.visuals.windows:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v72.select_tab.select_main_tab
});
v72.visuals.manual_arrows:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v72.select_tab.select_main_tab
});
v72.visuals.custom_scope:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v72.select_tab.select_main_tab
});
v72.visuals.gs_inds:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v72.select_tab.select_main_tab
});
v72.visuals.modern_hitmarker:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v72.select_tab.select_main_tab
});
v72.visuals.watermark:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v72.select_tab.select_main_tab
});
v72.visuals.aspect_ratio.offset:depend(v72.visuals.aspect_ratio);
v72.visuals.viewmodel.fov:depend({
    [1] = nil, 
    [2] = true, 
    [1] = v72.visuals.viewmodel
});
v72.visuals.viewmodel.x:depend({
    [1] = nil, 
    [2] = true, 
    [1] = v72.visuals.viewmodel
});
v72.visuals.viewmodel.y:depend({
    [1] = nil, 
    [2] = true, 
    [1] = v72.visuals.viewmodel
});
v72.visuals.viewmodel.z:depend({
    [1] = nil, 
    [2] = true, 
    [1] = v72.visuals.viewmodel
});
v72.visuals.viewmodel.opposite_knife:depend({
    [1] = nil, 
    [2] = true, 
    [1] = v72.visuals.viewmodel
});
v72.visuals.viewmodel.opposite_weapon:depend({
    [1] = nil, 
    [2] = true, 
    [1] = v72.visuals.viewmodel
});
v72.other.ragebot_logging.logs_type:depend(v72.other.ragebot_logging);
v72.other.ragebot_logging.logs_color_brand:depend(v72.other.ragebot_logging);
v72.other.ragebot_logging.logs_color_hit:depend(v72.other.ragebot_logging, {
    [1] = nil, 
    [2] = "Colored", 
    [1] = v72.other.ragebot_logging.logs_type
});
v72.other.ragebot_logging.logs_color_miss:depend(v72.other.ragebot_logging, {
    [1] = nil, 
    [2] = "Colored", 
    [1] = v72.other.ragebot_logging.logs_type
});
v72.other.ragebot_logging.buy_logs:depend(v72.other.ragebot_logging);
v72.other.ragebot_logging.under_crosshair_logs:depend(v72.other.ragebot_logging);
v72.other.ragebot_logging.under_crosshair_logs_color_hit:depend(v72.other.ragebot_logging.under_crosshair_logs, v72.other.ragebot_logging);
v72.other.ragebot_logging.under_crosshair_logs_color_miss:depend(v72.other.ragebot_logging.under_crosshair_logs, v72.other.ragebot_logging);
v72.visuals.grenade_radius.select:depend({
    [1] = nil, 
    [2] = true, 
    [1] = v72.visuals.grenade_radius
});
v72.visuals.grenade_radius.molotov_color:depend({
    [1] = nil, 
    [2] = true, 
    [1] = v72.visuals.grenade_radius
}, {
    [1] = nil, 
    [2] = 1, 
    [1] = v72.visuals.grenade_radius.select
});
v72.visuals.grenade_radius.smoke_color:depend({
    [1] = nil, 
    [2] = true, 
    [1] = v72.visuals.grenade_radius
}, {
    [1] = nil, 
    [2] = 2, 
    [1] = v72.visuals.grenade_radius.select
});
v72.ragebot.overrideInAir.hitchance_inair_scout:depend({
    [1] = nil, 
    [2] = "Scout", 
    [1] = v72.ragebot.overrideInAir.hitchance_inair_weapon
});
v72.ragebot.overrideInAir.hitchance_inair_r8:depend({
    [1] = nil, 
    [2] = "R8", 
    [1] = v72.ragebot.overrideInAir.hitchance_inair_weapon
});
v72.ragebot.overrideNoscope.hitchance_noscope_scout:depend({
    [1] = nil, 
    [2] = "Scout", 
    [1] = v72.ragebot.overrideNoscope.hitchance_noscope_weapon
});
v72.ragebot.overrideNoscope.hitchance_noscope_scar:depend({
    [1] = nil, 
    [2] = "Auto", 
    [1] = v72.ragebot.overrideNoscope.hitchance_noscope_weapon
});
v72.ragebot.overrideNoscope.hitchance_noscope_awp:depend({
    [1] = nil, 
    [2] = "AWP", 
    [1] = v72.ragebot.overrideNoscope.hitchance_noscope_weapon
});
v72.ragebot.overrideFD.hitchance_fd_scout:depend({
    [1] = nil, 
    [2] = "Scout", 
    [1] = v72.ragebot.overrideFD.hitchance_fd_weapon
});
v72.ragebot.overrideFD.hitchance_fd_scar:depend({
    [1] = nil, 
    [2] = "Auto", 
    [1] = v72.ragebot.overrideFD.hitchance_fd_weapon
});
v72.ragebot.overrideFD.hitchance_fd_awp:depend({
    [1] = nil, 
    [2] = "AWP", 
    [1] = v72.ragebot.overrideFD.hitchance_fd_weapon
});
v72.ragebot.overrideFD.hitchance_fd_r8:depend({
    [1] = nil, 
    [2] = "R8", 
    [1] = v72.ragebot.overrideFD.hitchance_fd_weapon
});
v72.other.trashtalk.mode:depend(v72.other.trashtalk);
v72.other.trashtalk.tt_on:depend(v72.other.trashtalk);
v72.visuals.anim_breaker.on_ground:depend(v72.visuals.anim_breaker);
v72.visuals.anim_breaker.jitter_speed:depend(v72.visuals.anim_breaker, {
    [1] = nil, 
    [2] = "Jitter", 
    [1] = v72.visuals.anim_breaker.on_ground
});
v72.visuals.anim_breaker.in_air:depend(v72.visuals.anim_breaker);
v72.visuals.anim_breaker.other:depend(v72.visuals.anim_breaker);
v72.other.fake_latency.value_slider:depend(v72.other.fake_latency);
v72.other.nade_manipulations.auto_granade_release_damage:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v72.other.nade_manipulations.manipulations
});
v72.visuals.crosshair_inds.inds_type:depend({
    [1] = nil, 
    [2] = true, 
    [1] = v72.visuals.crosshair_inds
});
v72.visuals.crosshair_inds.offset:depend({
    [1] = nil, 
    [2] = true, 
    [1] = v72.visuals.crosshair_inds
});
v72.visuals.crosshair_inds.style:depend({
    [1] = nil, 
    [2] = true, 
    [1] = v72.visuals.crosshair_inds
});
v72.visuals.crosshair_inds.s_color:depend({
    [1] = nil, 
    [2] = true, 
    [1] = v72.visuals.crosshair_inds
}, {
    [1] = nil, 
    [2] = 1, 
    [1] = v72.visuals.crosshair_inds.style
});
v72.visuals.crosshair_inds.g1_color:depend({
    [1] = nil, 
    [2] = true, 
    [1] = v72.visuals.crosshair_inds
}, {
    [1] = nil, 
    [2] = 2, 
    [1] = v72.visuals.crosshair_inds.style
});
v72.visuals.crosshair_inds.g2_color:depend({
    [1] = nil, 
    [2] = true, 
    [1] = v72.visuals.crosshair_inds
}, {
    [1] = nil, 
    [2] = 2, 
    [1] = v72.visuals.crosshair_inds.style
});
v72.visuals.crosshair_inds.additions:depend({
    [1] = nil, 
    [2] = true, 
    [1] = v72.visuals.crosshair_inds
});
v72.visuals.damage_ind.pixel:depend({
    [1] = nil, 
    [2] = true, 
    [1] = v72.visuals.damage_ind
});
v72.visuals.damage_ind.accent_color:depend({
    [1] = nil, 
    [2] = true, 
    [1] = v72.visuals.damage_ind
});
v72.visuals.windows.velocity_warning_color:depend({
    [1] = nil, 
    [2] = true, 
    [1] = v72.visuals.windows.velocity_warning
});
v72.visuals.windows.defensive_warning_color:depend({
    [1] = nil, 
    [2] = true, 
    [1] = v72.visuals.windows.defensive_warning
});
v72.visuals.windows.in_air:depend({
    [1] = nil, 
    [2] = true, 
    [1] = v72.visuals.windows.defensive_warning
});
v72.visuals.manual_arrows.select:depend({
    [1] = nil, 
    [2] = true, 
    [1] = v72.visuals.manual_arrows
});
v72.visuals.manual_arrows.color1:depend({
    [1] = nil, 
    [2] = true, 
    [1] = v72.visuals.manual_arrows
});
v72.visuals.manual_arrows.color2:depend({
    [1] = nil, 
    [2] = true, 
    [1] = v72.visuals.manual_arrows
}, {
    [1] = nil, 
    [2] = 1, 
    [1] = v72.visuals.manual_arrows.select
});
v72.visuals.manual_arrows.velocity_mode:depend({
    [1] = nil, 
    [2] = true, 
    [1] = v72.visuals.manual_arrows
});
v72.visuals.custom_scope.select:depend({
    [1] = nil, 
    [2] = true, 
    [1] = v72.visuals.custom_scope
});
v72.visuals.custom_scope.gap:depend({
    [1] = nil, 
    [2] = true, 
    [1] = v72.visuals.custom_scope
});
v72.visuals.custom_scope.lenght:depend({
    [1] = nil, 
    [2] = true, 
    [1] = v72.visuals.custom_scope
});
v72.visuals.custom_scope.accent_color:depend({
    [1] = nil, 
    [2] = true, 
    [1] = v72.visuals.custom_scope
});
v72.visuals.gs_inds.spec_list:depend({
    [1] = nil, 
    [2] = true, 
    [1] = v72.visuals.gs_inds
});
v72.visuals.gs_inds.select:depend({
    [1] = nil, 
    [2] = true, 
    [1] = v72.visuals.gs_inds
});
v72.visuals.modern_hitmarker.hitmarker_type:depend({
    [1] = nil, 
    [2] = true, 
    [1] = v72.visuals.modern_hitmarker
});
v72.visuals.modern_hitmarker.hitmarker_color:depend({
    [1] = nil, 
    [2] = true, 
    [1] = v72.visuals.modern_hitmarker
});
v72.visuals.watermark.g1_color:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v72.visuals.watermark.mode
});
v72.visuals.watermark.g2_color:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v72.visuals.watermark.mode
});
for v73 = 1, #v1 do
    l_x_0[v73] = {};
    for v74 = 1, #v2 do
        l_x_0[v73][v74] = {};
        l_x_0[v73][v74].enable = v36.builderAa:switch("Enable \v" .. v1[v73]);
        l_x_0[v73][v74].yaw = v36.builderAa_yaw:combo("\v\f<left-right> \rYaw", yaw_conds);
        l_x_0[v73][v74].yaw_ref = l_x_0[v73][v74].yaw:create();
        l_x_0[v73][v74].s_yaw = v36.builderAa_yaw:slider("\v\f<chevron-right>   \rOffset ", -180, 180, 0, 1, "\194\176");
        l_x_0[v73][v74].l_yaw = v36.builderAa_yaw:slider("\v\f<chevron-right>   \rLeft", -180, 180, 0, 1, "\194\176");
        l_x_0[v73][v74].r_yaw = v36.builderAa_yaw:slider("\v\f<chevron-right>   \rRight", -180, 180, 0, 1, "\194\176");
        l_x_0[v73][v74].delayed_ticks = l_x_0[v73][v74].yaw_ref:slider("\v\f<chevron-right>   \rDelay Ticks", 1, 20, 1, 1, function(v75)
            return v75 == 1 and "Off" or tostring(v75) .. "t";
        end);
        l_x_0[v73][v74].delayed_random = l_x_0[v73][v74].yaw_ref:switch("\v\f<chevron-right>   \rDelay Randomization");
        l_x_0[v73][v74].randomization = l_x_0[v73][v74].yaw_ref:slider("\v\f<chevron-right>   \rRandomization", 0, 100, 0, 1, function(v76)
            return v76 == 0 and "Off" or tostring(v76) .. "%";
        end);
        l_x_0[v73][v74].yaw_modifier = v36.builderAa_yawMod:combo("\v\f<ruler-triangle> \rYaw Modifier", {
            [1] = "Disabled", 
            [2] = "Center", 
            [3] = "Offset", 
            [4] = "Random", 
            [5] = "Spin", 
            [6] = "3-Way", 
            [7] = "5-Way", 
            [8] = "Switch"
        });
        l_x_0[v73][v74].yaw_modifier_ref = l_x_0[v73][v74].yaw_modifier:create();
        l_x_0[v73][v74].yaw_modifier_offset = v36.builderAa_yawMod:slider("\v\f<chevron-right>   \rOffset", -180, 180, 0, 1, "\194\176");
        l_x_0[v73][v74].l_jitter = v36.builderAa_yawMod:slider("\v\f<chevron-right>   \rLeft", -180, 180, 0, 1, "\194\176");
        l_x_0[v73][v74].r_jitter = v36.builderAa_yawMod:slider("\v\f<chevron-right>   \rRight", -180, 180, 0, 1, "\194\176");
        l_x_0[v73][v74].center_ticks = l_x_0[v73][v74].yaw_modifier_ref:slider("\v\f<chevron-right>   \rDelay Ticks", 1, 20, 1, 1, function(v77)
            return v77 == 1 and "Off" or tostring(v77) .. "t";
        end);
        l_x_0[v73][v74].center_delay_randomization = l_x_0[v73][v74].yaw_modifier_ref:switch("\v\f<chevron-right>   \rDelay Randomization");
        l_x_0[v73][v74].yaw_modifer_randomization = l_x_0[v73][v74].yaw_modifier_ref:slider("\v\f<chevron-right>   \rRandomization", 0, 100, 0, 1, function(v78)
            return v78 == 0 and "Off" or tostring(v78) .. "%";
        end);
        l_x_0[v73][v74].body_yaw = v36.builderAa_bodyYaw:switch("\v\f<wave-sine>\rDesync");
        l_x_0[v73][v74].body_yaw_ref = l_x_0[v73][v74].body_yaw:create();
        l_x_0[v73][v74].jitter = l_x_0[v73][v74].body_yaw_ref:switch("\v\f<chevron-right>   \rJitter");
        l_x_0[v73][v74].l_limit = v36.builderAa_bodyYaw:slider("\v\f<chevron-right>   \rLeft limit", 1, 60, 60, 1, "\194\176");
        l_x_0[v73][v74].l_limit_ref = l_x_0[v73][v74].l_limit:create();
        l_x_0[v73][v74].l_body_yaw_randomization = l_x_0[v73][v74].l_limit_ref:slider("\v\f<chevron-right>   \rRandomization", 0, 100, 0, 1, function(v79)
            return v79 == 0 and "Off" or tostring(v79) .. "%";
        end);
        l_x_0[v73][v74].r_limit = v36.builderAa_bodyYaw:slider("\v\f<chevron-right>   \rRight limit", 1, 60, 60, 1, "\194\176");
        l_x_0[v73][v74].r_limit_ref = l_x_0[v73][v74].r_limit:create();
        l_x_0[v73][v74].r_body_yaw_randomization = l_x_0[v73][v74].r_limit_ref:slider("\v\f<chevron-right>   \rRandomization", 0, 100, 0, 1, function(v80)
            return v80 == 0 and "Off" or tostring(v80) .. "%";
        end);
        l_x_0[v73][v74].force_def = v36.builderAa_defensive:selectable("\v\f<code-pull-request-draft>  \rDefensive On", {
            [1] = "Hide Shots", 
            [2] = "Double Tap"
        });
        l_x_0[v73][v74].def_tickbase = v36.builderAa_defensive:combo("\v\f<microchip>  \rTickbase", {
            [1] = "Polygone", 
            [2] = "Neverlose"
        });
        l_x_0[v73][v74].def_type = v36.builderAa_defensive:combo("\v\f<hard-drive>  \rType", {
            [1] = "Builder", 
            [2] = "Mode"
        });
        l_x_0[v73][v74].def_mode = v36.builderAa_defensive_pitch:combo("\v\f<code-pull-request-draft>  \rDefensive Mode", {
            [1] = "Sinus", 
            [2] = "Ping Based Sinus"
        });
        l_x_0[v73][v74].def_sinus_yaw = v36.builderAa_defensive_yaw:slider("\v\f<left-right> \r[\vSinus\r] Yaw", -180, 180, 0, 1, "\194\176");
        l_x_0[v73][v74].def_sinus_speed = v36.builderAa_defensive_yaw:slider("\v\f<chevron-right>   \r[\vSinus\r] Speed", 1, 100, 0, 1, "V");
        l_x_0[v73][v74].def_sinus_amp = v36.builderAa_defensive_yaw:slider("\v\f<chevron-right>   \r[\vSinus\r] Amplitude", 0, 180, 0, 1, "\194\176");
        l_x_0[v73][v74].def_pitch = v36.builderAa_defensive_pitch:combo("\v\f<up-down>    \rPitch", defensive_pitch_conds);
        l_x_0[v73][v74].def_pitch_ref = l_x_0[v73][v74].def_pitch:create();
        l_x_0[v73][v74].random1_pitch = v36.builderAa_defensive_pitch:slider("\v\f<chevron-right>   \r[\vFirst\r] Random ", -89, 89, 0, 1, "\194\176");
        l_x_0[v73][v74].random2_pitch = v36.builderAa_defensive_pitch:slider("\v\f<chevron-right>   \r[\vSecond\r] Random ", -89, 89, 0, 1, "\194\176");
        l_x_0[v73][v74].pitch_distortion_speed = l_x_0[v73][v74].def_pitch_ref:slider("\v\f<chevron-right>   \rDistortion Speed", 1, 10, 0, 1, "V");
        l_x_0[v73][v74].distortion_pitch = v36.builderAa_defensive_pitch:slider("\v\f<chevron-right>   \rDistortion Pitch", -89, 89, 0, 1, "\194\176");
        l_x_0[v73][v74].spin_pitch = v36.builderAa_defensive_pitch:slider("\v\f<chevron-right>   \rSpin", 1, 89, 1, 1, "\194\176");
        l_x_0[v73][v74].pitch_spin_speed = l_x_0[v73][v74].def_pitch_ref:slider("\v\f<chevron-right>   \rSpeed", 1, 100, 0, 1, "V");
        l_x_0[v73][v74].jitter1_pitch = v36.builderAa_defensive_pitch:slider("\v\f<chevron-right>   \r[\vUp\r] Switch", -89, 89, 0, 1, "\194\176");
        l_x_0[v73][v74].jitter2_pitch = v36.builderAa_defensive_pitch:slider("\v\f<chevron-right>   \r[\vDown\r] Switch", -89, 89, 0, 1, "\194\176");
        l_x_0[v73][v74].def_pitch_delayed_ticks = l_x_0[v73][v74].def_pitch_ref:slider("\v\f<chevron-right>   \rDelay Ticks", 1, 20, 1, 1, function(v81)
            return v81 == 1 and "Off" or tostring(v81) .. "t";
        end);
        l_x_0[v73][v74].custom_pitch = v36.builderAa_defensive_pitch:slider("\v\f<chevron-right>   \rCustom", -89, 89, 0, 1, "\194\176");
        l_x_0[v73][v74].def_yaw = v36.builderAa_defensive_yaw:combo("\v\f<left-right> \rYaw", defensive_yaw_conds);
        l_x_0[v73][v74].def_yaw_ref = l_x_0[v73][v74].def_yaw:create();
        l_x_0[v73][v74].random1_yaw = v36.builderAa_defensive_yaw:slider("\v\f<chevron-right>   \r[\vFirst\r] Random", -180, 180, 0, 1, "\194\176");
        l_x_0[v73][v74].random2_yaw = v36.builderAa_defensive_yaw:slider("\v\f<chevron-right>   \r[\vSecond\r] Random", -180, 180, 0, 1, "\194\176");
        l_x_0[v73][v74].spin_yaw = v36.builderAa_defensive_yaw:slider("\v\f<chevron-right>   \rSpin", 1, 180, 1, 1, "\194\176");
        l_x_0[v73][v74].yaw_spin_speed = l_x_0[v73][v74].def_yaw_ref:slider("\v\f<chevron-right>   \rSpeed", 1, 100, 0, 1, "V");
        l_x_0[v73][v74].distortion_yaw = v36.builderAa_defensive_yaw:slider("\v\f<chevron-right>   \rDistortion", 1, 180, 1, 1, "\194\176");
        l_x_0[v73][v74].yaw_distortion_speed = l_x_0[v73][v74].def_yaw_ref:slider("\v\f<chevron-right>   \rSpeed", 1, 10, 0, 1, "V");
        l_x_0[v73][v74].yaw_distortion_invert = l_x_0[v73][v74].def_yaw_ref:switch("\v\f<chevron-right>   \rInvert");
        l_x_0[v73][v74].x_way1 = v36.builderAa_defensive_yaw:slider("\v\f<chevron-right>   \r[\vFirst\r] Way", -180, 180, 0, 1, "\194\176");
        l_x_0[v73][v74].x_way2 = v36.builderAa_defensive_yaw:slider("\v\f<chevron-right>   \r[\vSecond\r] Way", -180, 180, 0, 1, "\194\176");
        l_x_0[v73][v74].x_way3 = v36.builderAa_defensive_yaw:slider("\v\f<chevron-right>   \r[\vThird\r] Way", -180, 180, 0, 1, "\194\176");
        l_x_0[v73][v74].jitter1_yaw = v36.builderAa_defensive_yaw:slider("\v\f<chevron-right>   \r[\vLeft\r] Switch", -180, 180, 0, 1, "\194\176");
        l_x_0[v73][v74].jitter2_yaw = v36.builderAa_defensive_yaw:slider("\v\f<chevron-right>   \r[\vRight\r] Switch", -180, 180, 0, 1, "\194\176");
        l_x_0[v73][v74].def_yaw_delayed_ticks = l_x_0[v73][v74].def_yaw_ref:slider("\v\f<chevron-right>   \rDelay Ticks", 1, 20, 1, 1, function(v82)
            return v82 == 1 and "Off" or tostring(v82) .. "t";
        end);
        l_x_0[v73][v74].custom_yaw = v36.builderAa_defensive_yaw:slider("\v\f<chevron-right>   \rCustom", -180, 180, 0, 1, "\194\176");
    end;
end;
for v83 = 1, #v1 do
    do
        local l_v83_0 = v83;
        for v85 = 1, #v2 do
            local v86 = {
                [1] = v72.antiaims.current_state, 
                [2] = v1[l_v83_0]
            };
            local v87 = {
                [1] = nil, 
                [2] = 2, 
                [1] = v72.antiaims.current_tab
            };
            local v88 = {
                [1] = nil, 
                [2] = 3, 
                [1] = v72.antiaims.current_tab
            };
            local v89 = {
                [1] = v72.antiaims.current_team, 
                [2] = v2[v85]
            };
            do
                local l_v85_0 = v85;
                local v91 = {
                    [1] = l_x_0[l_v83_0][l_v85_0].enable, 
                    [2] = function()
                        -- upvalues: l_v83_0 (ref), l_x_0 (ref), l_v85_0 (ref)
                        if l_v83_0 == 1 then
                            return true;
                        else
                            return l_x_0[l_v83_0][l_v85_0].enable:get();
                        end;
                    end
                };
                local v92 = {
                    [1] = l_x_0[l_v83_0][l_v85_0].yaw, 
                    [2] = function()
                        -- upvalues: l_x_0 (ref), l_v83_0 (ref), l_v85_0 (ref)
                        if l_x_0[l_v83_0][l_v85_0].yaw:get() == "Disabled" then
                            return false;
                        else
                            return true;
                        end;
                    end
                };
                local v93 = {
                    [1] = l_x_0[l_v83_0][l_v85_0].yaw_modifier, 
                    [2] = function()
                        -- upvalues: l_x_0 (ref), l_v83_0 (ref), l_v85_0 (ref)
                        if l_x_0[l_v83_0][l_v85_0].yaw_modifier:get() == "Disabled" then
                            return false;
                        else
                            return true;
                        end;
                    end
                };
                local v94 = {
                    [1] = l_x_0[l_v83_0][l_v85_0].yaw_modifier, 
                    [2] = function()
                        -- upvalues: l_x_0 (ref), l_v83_0 (ref), l_v85_0 (ref)
                        if l_x_0[l_v83_0][l_v85_0].yaw_modifier:get() == "Switch" then
                            return false;
                        else
                            return true;
                        end;
                    end
                };
                local v95 = {
                    [1] = l_x_0[l_v83_0][l_v85_0].def_type, 
                    [2] = function()
                        -- upvalues: l_x_0 (ref), l_v83_0 (ref), l_v85_0 (ref)
                        if l_x_0[l_v83_0][l_v85_0].def_type:get() == "Mode" then
                            return false;
                        else
                            return true;
                        end;
                    end
                };
                local v96 = {
                    [1] = l_x_0[l_v83_0][l_v85_0].def_type, 
                    [2] = function()
                        -- upvalues: l_x_0 (ref), l_v83_0 (ref), l_v85_0 (ref)
                        if l_x_0[l_v83_0][l_v85_0].def_type:get() == "Builder" then
                            return false;
                        else
                            return true;
                        end;
                    end
                };
                l_x_0[l_v83_0][l_v85_0].enable:depend(v86, v89, v87);
                l_x_0[l_v83_0][l_v85_0].yaw:depend(v86, v89, v91, v87);
                l_x_0[l_v83_0][l_v85_0].s_yaw:depend(v86, v89, v91, v92, v87, {
                    [1] = nil, 
                    [2] = "Default", 
                    [3] = "Vladick", 
                    [1] = l_x_0[l_v83_0][l_v85_0].yaw
                });
                l_x_0[l_v83_0][l_v85_0].l_yaw:depend(v86, v89, v91, v92, v87, {
                    [1] = nil, 
                    [2] = "Switch", 
                    [1] = l_x_0[l_v83_0][l_v85_0].yaw
                });
                l_x_0[l_v83_0][l_v85_0].r_yaw:depend(v86, v89, v91, v92, v87, {
                    [1] = nil, 
                    [2] = "Switch", 
                    [1] = l_x_0[l_v83_0][l_v85_0].yaw
                });
                l_x_0[l_v83_0][l_v85_0].randomization:depend(v86, v89, v91, v92, v87, v92);
                l_x_0[l_v83_0][l_v85_0].delayed_ticks:depend(v86, v89, v91, v92, v87, {
                    [1] = nil, 
                    [2] = "Switch", 
                    [1] = l_x_0[l_v83_0][l_v85_0].yaw
                });
                l_x_0[l_v83_0][l_v85_0].delayed_random:depend(v86, v89, v91, v92, v87, {
                    [1] = nil, 
                    [2] = "Switch", 
                    [1] = l_x_0[l_v83_0][l_v85_0].yaw
                });
                l_x_0[l_v83_0][l_v85_0].yaw_modifier:depend(v86, v89, v91, v87);
                l_x_0[l_v83_0][l_v85_0].yaw_modifier_offset:depend(v86, v89, v91, v87, v93, v94);
                l_x_0[l_v83_0][l_v85_0].yaw_modifer_randomization:depend(v86, v89, v91, v87, v93);
                l_x_0[l_v83_0][l_v85_0].l_jitter:depend(v86, v89, v91, v93, v87, {
                    [1] = nil, 
                    [2] = "Switch", 
                    [1] = l_x_0[l_v83_0][l_v85_0].yaw_modifier
                });
                l_x_0[l_v83_0][l_v85_0].r_jitter:depend(v86, v89, v91, v93, v87, {
                    [1] = nil, 
                    [2] = "Switch", 
                    [1] = l_x_0[l_v83_0][l_v85_0].yaw_modifier
                });
                l_x_0[l_v83_0][l_v85_0].center_ticks:depend(v86, v89, v91, v93, v87, {
                    [1] = nil, 
                    [2] = "Switch", 
                    [1] = l_x_0[l_v83_0][l_v85_0].yaw_modifier
                });
                l_x_0[l_v83_0][l_v85_0].center_delay_randomization:depend(v86, v89, v91, v93, v87, {
                    [1] = nil, 
                    [2] = "Switch", 
                    [1] = l_x_0[l_v83_0][l_v85_0].yaw_modifier
                });
                l_x_0[l_v83_0][l_v85_0].body_yaw:depend(v86, v89, v91, v87);
                l_x_0[l_v83_0][l_v85_0].jitter:depend(v86, v89, v91, v87, {
                    [1] = nil, 
                    [2] = true, 
                    [1] = l_x_0[l_v83_0][l_v85_0].body_yaw
                });
                l_x_0[l_v83_0][l_v85_0].l_limit:depend(v86, v89, v91, v87, {
                    [1] = nil, 
                    [2] = true, 
                    [1] = l_x_0[l_v83_0][l_v85_0].body_yaw
                });
                l_x_0[l_v83_0][l_v85_0].r_limit:depend(v86, v89, v91, v87, {
                    [1] = nil, 
                    [2] = true, 
                    [1] = l_x_0[l_v83_0][l_v85_0].body_yaw
                });
                l_x_0[l_v83_0][l_v85_0].l_body_yaw_randomization:depend(v86, v89, v87, v91, {
                    [1] = nil, 
                    [2] = true, 
                    [1] = l_x_0[l_v83_0][l_v85_0].body_yaw
                });
                l_x_0[l_v83_0][l_v85_0].r_body_yaw_randomization:depend(v86, v89, v87, v91, {
                    [1] = nil, 
                    [2] = true, 
                    [1] = l_x_0[l_v83_0][l_v85_0].body_yaw
                });
                l_x_0[l_v83_0][l_v85_0].force_def:depend(v86, v89, v88);
                l_x_0[l_v83_0][l_v85_0].def_tickbase:depend(v86, v89, v88);
                l_x_0[l_v83_0][l_v85_0].def_type:depend(v86, v89, v88);
                l_x_0[l_v83_0][l_v85_0].def_mode:depend(v86, v89, v88, v96);
                l_x_0[l_v83_0][l_v85_0].def_sinus_yaw:depend(v86, v89, v88, v96, {
                    [1] = nil, 
                    [2] = "Sinus", 
                    [1] = l_x_0[l_v83_0][l_v85_0].def_mode
                });
                l_x_0[l_v83_0][l_v85_0].def_sinus_speed:depend(v86, v89, v88, v96, {
                    [1] = nil, 
                    [2] = "Sinus", 
                    [1] = l_x_0[l_v83_0][l_v85_0].def_mode
                });
                l_x_0[l_v83_0][l_v85_0].def_sinus_amp:depend(v86, v89, v88, v96, {
                    [1] = nil, 
                    [2] = "Sinus", 
                    [1] = l_x_0[l_v83_0][l_v85_0].def_mode
                });
                l_x_0[l_v83_0][l_v85_0].def_pitch:depend(v86, v89, v88, v95);
                l_x_0[l_v83_0][l_v85_0].random1_pitch:depend(v86, v89, v88, v95, {
                    [1] = nil, 
                    [2] = "Random", 
                    [1] = l_x_0[l_v83_0][l_v85_0].def_pitch
                });
                l_x_0[l_v83_0][l_v85_0].random2_pitch:depend(v86, v89, v88, v95, {
                    [1] = nil, 
                    [2] = "Random", 
                    [1] = l_x_0[l_v83_0][l_v85_0].def_pitch
                });
                l_x_0[l_v83_0][l_v85_0].pitch_distortion_speed:depend(v86, v88, v95, v89, {
                    [1] = nil, 
                    [2] = "Distortion", 
                    [1] = l_x_0[l_v83_0][l_v85_0].def_pitch
                });
                l_x_0[l_v83_0][l_v85_0].distortion_pitch:depend(v86, v89, v88, v95, {
                    [1] = nil, 
                    [2] = "Distortion", 
                    [1] = l_x_0[l_v83_0][l_v85_0].def_pitch
                });
                l_x_0[l_v83_0][l_v85_0].spin_pitch:depend(v86, v89, v88, v95, {
                    [1] = nil, 
                    [2] = "Spin", 
                    [1] = l_x_0[l_v83_0][l_v85_0].def_pitch
                });
                l_x_0[l_v83_0][l_v85_0].pitch_spin_speed:depend(v86, v89, v88, v95, {
                    [1] = nil, 
                    [2] = "Spin", 
                    [1] = l_x_0[l_v83_0][l_v85_0].def_pitch
                });
                l_x_0[l_v83_0][l_v85_0].jitter1_pitch:depend(v86, v89, v88, v95, {
                    [1] = nil, 
                    [2] = "Switch", 
                    [1] = l_x_0[l_v83_0][l_v85_0].def_pitch
                });
                l_x_0[l_v83_0][l_v85_0].jitter2_pitch:depend(v86, v89, v88, v95, {
                    [1] = nil, 
                    [2] = "Switch", 
                    [1] = l_x_0[l_v83_0][l_v85_0].def_pitch
                });
                l_x_0[l_v83_0][l_v85_0].def_pitch_delayed_ticks:depend(v86, v88, v95, v89, {
                    [1] = nil, 
                    [2] = "Switch", 
                    [1] = l_x_0[l_v83_0][l_v85_0].def_pitch
                });
                l_x_0[l_v83_0][l_v85_0].custom_pitch:depend(v86, v89, v88, v95, {
                    [1] = nil, 
                    [2] = "Custom", 
                    [1] = l_x_0[l_v83_0][l_v85_0].def_pitch
                });
                l_x_0[l_v83_0][l_v85_0].def_yaw:depend(v86, v89, v88, v95);
                l_x_0[l_v83_0][l_v85_0].random1_yaw:depend(v86, v89, v88, v95, {
                    [1] = nil, 
                    [2] = "Random", 
                    [1] = l_x_0[l_v83_0][l_v85_0].def_yaw
                });
                l_x_0[l_v83_0][l_v85_0].random2_yaw:depend(v86, v89, v88, v95, {
                    [1] = nil, 
                    [2] = "Random", 
                    [1] = l_x_0[l_v83_0][l_v85_0].def_yaw
                });
                l_x_0[l_v83_0][l_v85_0].spin_yaw:depend(v86, v89, v88, v95, {
                    [1] = nil, 
                    [2] = "Spin", 
                    [1] = l_x_0[l_v83_0][l_v85_0].def_yaw
                });
                l_x_0[l_v83_0][l_v85_0].yaw_spin_speed:depend(v86, v89, v88, v95, {
                    [1] = nil, 
                    [2] = "Spin", 
                    [1] = l_x_0[l_v83_0][l_v85_0].def_yaw
                });
                l_x_0[l_v83_0][l_v85_0].distortion_yaw:depend(v86, v89, v88, v95, {
                    [1] = nil, 
                    [2] = "Distortion", 
                    [1] = l_x_0[l_v83_0][l_v85_0].def_yaw
                });
                l_x_0[l_v83_0][l_v85_0].yaw_distortion_speed:depend(v86, v89, v88, v95, {
                    [1] = nil, 
                    [2] = "Distortion", 
                    [1] = l_x_0[l_v83_0][l_v85_0].def_yaw
                });
                l_x_0[l_v83_0][l_v85_0].yaw_distortion_invert:depend(v86, v89, v88, v95, {
                    [1] = nil, 
                    [2] = "Distortion", 
                    [1] = l_x_0[l_v83_0][l_v85_0].def_yaw
                });
                l_x_0[l_v83_0][l_v85_0].x_way1:depend(v86, v89, v88, v95, {
                    [1] = nil, 
                    [2] = "X-Way", 
                    [1] = l_x_0[l_v83_0][l_v85_0].def_yaw
                });
                l_x_0[l_v83_0][l_v85_0].x_way2:depend(v86, v89, v88, v95, {
                    [1] = nil, 
                    [2] = "X-Way", 
                    [1] = l_x_0[l_v83_0][l_v85_0].def_yaw
                });
                l_x_0[l_v83_0][l_v85_0].x_way3:depend(v86, v89, v88, v95, {
                    [1] = nil, 
                    [2] = "X-Way", 
                    [1] = l_x_0[l_v83_0][l_v85_0].def_yaw
                });
                l_x_0[l_v83_0][l_v85_0].jitter1_yaw:depend(v86, v89, v88, v95, {
                    [1] = nil, 
                    [2] = "Switch", 
                    [3] = "Secret", 
                    [1] = l_x_0[l_v83_0][l_v85_0].def_yaw
                });
                l_x_0[l_v83_0][l_v85_0].jitter2_yaw:depend(v86, v89, v88, v95, {
                    [1] = nil, 
                    [2] = "Switch", 
                    [3] = "Secret", 
                    [1] = l_x_0[l_v83_0][l_v85_0].def_yaw
                });
                l_x_0[l_v83_0][l_v85_0].def_yaw_delayed_ticks:depend(v86, v89, v88, v95, {
                    [1] = nil, 
                    [2] = "Switch", 
                    [1] = l_x_0[l_v83_0][l_v85_0].def_yaw
                });
                l_x_0[l_v83_0][l_v85_0].custom_yaw:depend(v86, v89, v88, v95, {
                    [1] = nil, 
                    [2] = "Custom", 
                    [1] = l_x_0[l_v83_0][l_v85_0].def_yaw
                });
                if l_v83_0 == 9 then
                    l_x_0[l_v83_0][l_v85_0].force_def:disabled(true);
                    l_x_0[l_v83_0][l_v85_0].def_pitch:disabled(true);
                    l_x_0[l_v83_0][l_v85_0].def_yaw:disabled(true);
                    l_x_0[l_v83_0][l_v85_0].def_tickbase:disabled(true);
                    l_x_0[l_v83_0][l_v85_0].def_type:disabled(true);
                end;
            end;
        end;
    end;
end;
events.render:set(function()
    -- upvalues: v72 (ref), v1 (ref), v2 (ref), l_x_0 (ref), v4 (ref)
    if branch == "slim" then
        v72.ragebot.prediction_system:disabled(true);
        v72.ragebot.prediction_system.switch:disabled(true);
        v72.ragebot.prediction_system.mode:disabled(true);
        v72.ragebot.prediction_system.weapons:disabled(true);
        v72.ragebot.prediction_system.conditions:disabled(true);
        v72.ragebot.prediction_system.switch(false);
        v72.ragebot.ragebot_improvements.last_tick_backtrack:disabled(true);
        v72.ragebot.ragebot_improvements.last_tick_backtrack(false);
    elseif branch == "core" then
        v72.antiaims.defensive_flick:disabled(true);
        v72.antiaims.auto_osaa:disabled(true);
        v72.antiaims.air_lag:disabled(true);
        v72.ragebot.prediction_system:disabled(true);
        v72.ragebot.prediction_system.switch:disabled(true);
        v72.ragebot.prediction_system.mode:disabled(true);
        v72.ragebot.prediction_system.weapons:disabled(true);
        v72.ragebot.prediction_system.conditions:disabled(true);
        v72.ragebot.prediction_system.switch(false);
        v72.other.nade_manipulations.manipulations:disabled(true);
        v72.other.nade_manipulations.manipulations(false);
        v72.other.movement_manipulations.helpers:disabled(true);
        v72.ragebot.ragebot_improvements.defensive_improvements:disabled(true);
        v72.ragebot.ragebot_improvements.last_tick_backtrack:disabled(true);
        v72.antiaims.defensive_flick(false);
        v72.antiaims.auto_osaa(false);
        v72.antiaims.air_lag(false);
        v72.other.movement_manipulations.helpers(false);
        v72.ragebot.ragebot_improvements.defensive_improvements(false);
        v72.ragebot.ragebot_improvements.last_tick_backtrack(false);
        for v97 = 1, #v1 do
            for v98 = 1, #v2 do
                l_x_0[v97][v98].def_tickbase:disabled(true);
                l_x_0[v97][v98].def_type:disabled(true);
                l_x_0[v97][v98].def_tickbase("Neverlose");
                l_x_0[v97][v98].def_type("Builder");
                l_x_0[v97][v98].l_body_yaw_randomization:disabled(true);
                l_x_0[v97][v98].r_body_yaw_randomization:disabled(true);
                l_x_0[v97][v98].yaw_modifer_randomization:disabled(true);
                l_x_0[v97][v98].yaw_modifer_randomization(0);
                l_x_0[v97][v98].l_body_yaw_randomization(0);
                l_x_0[v97][v98].r_body_yaw_randomization(0);
                l_x_0[v97][v98].delayed_random:disabled(true);
                l_x_0[v97][v98].center_delay_randomization:disabled(true);
                l_x_0[v97][v98].delayed_random(false);
                l_x_0[v97][v98].center_delay_randomization(false);
            end;
        end;
    end;
    for v99 = 1, #v1 do
        for v100 = 1, #v2 do
            if l_x_0[v99][v100].yaw:get() == "Vladick" then
                l_x_0[v99][v100].yaw_modifier:disabled(true);
                l_x_0[v99][v100].yaw_modifier_offset:disabled(true);
            else
                l_x_0[v99][v100].yaw_modifier:disabled(false);
                l_x_0[v99][v100].yaw_modifier_offset:disabled(false);
            end;
        end;
    end;
    if l_x_0[id][tm].enable:get() then
        v4.antiaims.enable:disabled(true);
        v4.antiaims.pitch:disabled(true);
        v4.antiaims.yaw:disabled(true);
        v4.antiaims.yaw_modifier:disabled(true);
        v4.antiaims.body_yaw:disabled(true);
    else
        v4.antiaims.enable:disabled(false);
        v4.antiaims.pitch:disabled(false);
        v4.antiaims.yaw:disabled(false);
        v4.antiaims.yaw_modifier:disabled(false);
        v4.antiaims.body_yaw:disabled(false);
    end;
end);
cfg_list = v36.cfgTab:list("", v32.n);
cfg_name = v36.cfgTab:input("", "");
create_cfg = v36.cfgTab:button("   \v\f<folder-plus>   ", function()
    create_cfg();
end, true);
load_cfg = v36.cfgTab:button("   \v\f<play>   ", function()
    load_cfg();
end, true);
save_cfg = v36.cfgTab:button("   \v\f<floppy-disk>   ", function()
    save_cfg();
end, true);
cfg_import = v36.cfgTab:button("   \v\f<file-import>    ", function()
    import_cfg();
end, true);
cfg_export = v36.cfgTab:button("    \v\f<file-export>   ", function()
    export_cfg();
end, true);
delete_cfg = v36.cfgTab:button(" \aFF0000FF\f<trash> ", function()
    remove_cfg();
end, true);
v3.pui.setup({
    [1] = l_x_0, 
    [2] = v72
});
local function v104(v101, v102)
    for v103 = 1, #v101 do
        if v101[v103] == v102 then
            return true;
        end;
    end;
    return false;
end;
export_cfg = function()
    -- upvalues: v3 (ref), v32 (ref)
    cvar.play:call("ambient\\tones\\elev1");
    local _ = common.get_date("%m.%d.%Y %H:%M");
    local v106 = v3.base64.encode(json.stringify(v3.pui.save()));
    local _ = username;
    if v32.n[cfg_list:get()] ~= "" then
        name = v32.n[cfg_list:get()];
    else
        name = "-";
    end;
    local v108 = {
        n = name, 
        cfg = v106
    };
    v3.clipboard.set(json.stringify(v108));
end;
import_cfg = function()
    -- upvalues: v3 (ref), v32 (ref)
    local v109 = json.parse(v3.clipboard.get());
    cvar.play:call("ambient\\tones\\elev1");
    table.insert(v32.n, v109.n);
    table.insert(v32.cfg, v109.cfg);
    cfg_list:update(v32.n);
    files.write("nl/polygone/configs.poly", json.stringify(v32));
end;
load_cfg = function()
    -- upvalues: v3 (ref), v32 (ref)
    cvar.play:call("ambient\\tones\\elev1");
    if cfg_list:get() == 1 then
        v3.pui.load(json.parse(v3.base64.decode("W1tbeyJib2R5X3lhdyI6dHJ1ZSwiY2VudGVyX2RlbGF5X3JhbmRvbWl6YXRpb24iOmZhbHNlLCJjZW50ZXJfdGlja3MiOjIuMCwiY3VzdG9tX3BpdGNoIjowLjAsImN1c3RvbV95YXciOjAuMCwiZGVmX21vZGUiOiJTaW51cyIsImRlZl9waXRjaCI6IlVwIiwiZGVmX3BpdGNoX2RlbGF5ZWRfdGlja3MiOjIuMCwiZGVmX3NpbnVzX2FtcCI6MS4wLCJkZWZfc2ludXNfc3BlZWQiOjEuMCwiZGVmX3NpbnVzX3lhdyI6MC4wLCJkZWZfdGlja2Jhc2UiOiJQb2x5Z29uZSIsImRlZl90eXBlIjoiQnVpbGRlciIsImRlZl95YXciOiJSYW5kb20iLCJkZWZfeWF3X2RlbGF5ZWRfdGlja3MiOjIuMCwiZGVsYXllZF9yYW5kb20iOmZhbHNlLCJkZWxheWVkX3RpY2tzIjoxLjAsImRpc3RvcnRpb25fcGl0Y2giOjAuMCwiZGlzdG9ydGlvbl95YXciOjEuMCwiZW5hYmxlIjp0cnVlLCJmb3JjZV9kZWYiOlsiSGlkZSBTaG90cyIsIkRvdWJsZSBUYXAiLCJ+Il0sImppdHRlciI6ZmFsc2UsImppdHRlcjFfcGl0Y2giOjAuMCwiaml0dGVyMV95YXciOjAuMCwiaml0dGVyMl9waXRjaCI6MC4wLCJqaXR0ZXIyX3lhdyI6MC4wLCJsX2JvZHlfeWF3X3JhbmRvbWl6YXRpb24iOjAuMCwibF9qaXR0ZXIiOjAuMCwibF9saW1pdCI6NjAuMCwibF95YXciOjAuMCwicGl0Y2hfZGlzdG9ydGlvbl9zcGVlZCI6MS4wLCJwaXRjaF9zcGluX3NwZWVkIjoxLjAsInJfYm9keV95YXdfcmFuZG9taXphdGlvbiI6MC4wLCJyX2ppdHRlciI6MC4wLCJyX2xpbWl0Ijo2MC4wLCJyX3lhdyI6MC4wLCJyYW5kb20xX3BpdGNoIjowLjAsInJhbmRvbTFfeWF3IjowLjAsInJhbmRvbTJfcGl0Y2giOjAuMCwicmFuZG9tMl95YXciOjAuMCwicmFuZG9taXphdGlvbiI6MC4wLCJzX3lhdyI6LTUuMCwic3Bpbl9waXRjaCI6MS4wLCJzcGluX3lhdyI6MS4wLCJ4X3dheTEiOjAuMCwieF93YXkyIjowLjAsInhfd2F5MyI6MC4wLCJ5YXciOiJEZWZhdWx0IiwieWF3X2Rpc3RvcnRpb25faW52ZXJ0IjpmYWxzZSwieWF3X2Rpc3RvcnRpb25fc3BlZWQiOjEuMCwieWF3X21vZGlmZXJfcmFuZG9taXphdGlvbiI6MC4wLCJ5YXdfbW9kaWZpZXIiOiJDZW50ZXIiLCJ5YXdfbW9kaWZpZXJfb2Zmc2V0IjoxNC4wLCJ5YXdfc3Bpbl9zcGVlZCI6MS4wfSx7ImJvZHlfeWF3Ijp0cnVlLCJjZW50ZXJfZGVsYXlfcmFuZG9taXphdGlvbiI6ZmFsc2UsImNlbnRlcl90aWNrcyI6Mi4wLCJjdXN0b21fcGl0Y2giOjAuMCwiY3VzdG9tX3lhdyI6MC4wLCJkZWZfbW9kZSI6IlNpbnVzIiwiZGVmX3BpdGNoIjoiVXAiLCJkZWZfcGl0Y2hfZGVsYXllZF90aWNrcyI6Mi4wLCJkZWZfc2ludXNfYW1wIjoxLjAsImRlZl9zaW51c19zcGVlZCI6MS4wLCJkZWZfc2ludXNfeWF3IjowLjAsImRlZl90aWNrYmFzZSI6IlBvbHlnb25lIiwiZGVmX3R5cGUiOiJCdWlsZGVyIiwiZGVmX3lhdyI6IlJhbmRvbSIsImRlZl95YXdfZGVsYXllZF90aWNrcyI6Mi4wLCJkZWxheWVkX3JhbmRvbSI6ZmFsc2UsImRlbGF5ZWRfdGlja3MiOjEuMCwiZGlzdG9ydGlvbl9waXRjaCI6MC4wLCJkaXN0b3J0aW9uX3lhdyI6MS4wLCJlbmFibGUiOnRydWUsImZvcmNlX2RlZiI6WyJIaWRlIFNob3RzIiwiRG91YmxlIFRhcCIsIn4iXSwiaml0dGVyIjpmYWxzZSwiaml0dGVyMV9waXRjaCI6MC4wLCJqaXR0ZXIxX3lhdyI6MC4wLCJqaXR0ZXIyX3BpdGNoIjowLjAsImppdHRlcjJfeWF3IjowLjAsImxfYm9keV95YXdfcmFuZG9taXphdGlvbiI6MC4wLCJsX2ppdHRlciI6MC4wLCJsX2xpbWl0Ijo2MC4wLCJsX3lhdyI6MC4wLCJwaXRjaF9kaXN0b3J0aW9uX3NwZWVkIjoxLjAsInBpdGNoX3NwaW5fc3BlZWQiOjEuMCwicl9ib2R5X3lhd19yYW5kb21pemF0aW9uIjowLjAsInJfaml0dGVyIjowLjAsInJfbGltaXQiOjYwLjAsInJfeWF3IjowLjAsInJhbmRvbTFfcGl0Y2giOjAuMCwicmFuZG9tMV95YXciOjAuMCwicmFuZG9tMl9waXRjaCI6MC4wLCJyYW5kb20yX3lhdyI6MC4wLCJyYW5kb21pemF0aW9uIjowLjAsInNfeWF3IjotNS4wLCJzcGluX3BpdGNoIjoxLjAsInNwaW5feWF3IjoxLjAsInhfd2F5MSI6MC4wLCJ4X3dheTIiOjAuMCwieF93YXkzIjowLjAsInlhdyI6IkRlZmF1bHQiLCJ5YXdfZGlzdG9ydGlvbl9pbnZlcnQiOmZhbHNlLCJ5YXdfZGlzdG9ydGlvbl9zcGVlZCI6MS4wLCJ5YXdfbW9kaWZlcl9yYW5kb21pemF0aW9uIjowLjAsInlhd19tb2RpZmllciI6IkNlbnRlciIsInlhd19tb2RpZmllcl9vZmZzZXQiOjE0LjAsInlhd19zcGluX3NwZWVkIjoxLjB9XSxbeyJib2R5X3lhdyI6dHJ1ZSwiY2VudGVyX2RlbGF5X3JhbmRvbWl6YXRpb24iOmZhbHNlLCJjZW50ZXJfdGlja3MiOjIuMCwiY3VzdG9tX3BpdGNoIjowLjAsImN1c3RvbV95YXciOjAuMCwiZGVmX21vZGUiOiJTaW51cyIsImRlZl9waXRjaCI6IkRvd24iLCJkZWZfcGl0Y2hfZGVsYXllZF90aWNrcyI6Mi4wLCJkZWZfc2ludXNfYW1wIjoxLjAsImRlZl9zaW51c19zcGVlZCI6MS4wLCJkZWZfc2ludXNfeWF3IjowLjAsImRlZl90aWNrYmFzZSI6IlBvbHlnb25lIiwiZGVmX3R5cGUiOiJCdWlsZGVyIiwiZGVmX3lhdyI6IlN3aXRjaCIsImRlZl95YXdfZGVsYXllZF90aWNrcyI6MS4wLCJkZWxheWVkX3JhbmRvbSI6dHJ1ZSwiZGVsYXllZF90aWNrcyI6Mi4wLCJkaXN0b3J0aW9uX3BpdGNoIjowLjAsImRpc3RvcnRpb25feWF3IjoxLjAsImVuYWJsZSI6dHJ1ZSwiZm9yY2VfZGVmIjpbIkhpZGUgU2hvdHMiLCJEb3VibGUgVGFwIiwifiJdLCJqaXR0ZXIiOnRydWUsImppdHRlcjFfcGl0Y2giOjAuMCwiaml0dGVyMV95YXciOi04LjAsImppdHRlcjJfcGl0Y2giOjAuMCwiaml0dGVyMl95YXciOjE4LjAsImxfYm9keV95YXdfcmFuZG9taXphdGlvbiI6MjIuMCwibF9qaXR0ZXIiOjAuMCwibF9saW1pdCI6NjAuMCwibF95YXciOi0xOC4wLCJwaXRjaF9kaXN0b3J0aW9uX3NwZWVkIjoxLjAsInBpdGNoX3NwaW5fc3BlZWQiOjEuMCwicl9ib2R5X3lhd19yYW5kb21pemF0aW9uIjoyMy4wLCJyX2ppdHRlciI6MC4wLCJyX2xpbWl0Ijo2MC4wLCJyX3lhdyI6MTUuMCwicmFuZG9tMV9waXRjaCI6MC4wLCJyYW5kb20xX3lhdyI6MC4wLCJyYW5kb20yX3BpdGNoIjowLjAsInJhbmRvbTJfeWF3IjowLjAsInJhbmRvbWl6YXRpb24iOjIwLjAsInNfeWF3IjowLjAsInNwaW5fcGl0Y2giOjEuMCwic3Bpbl95YXciOjEuMCwieF93YXkxIjowLjAsInhfd2F5MiI6MC4wLCJ4X3dheTMiOjAuMCwieWF3IjoiU3dpdGNoIiwieWF3X2Rpc3RvcnRpb25faW52ZXJ0IjpmYWxzZSwieWF3X2Rpc3RvcnRpb25fc3BlZWQiOjEuMCwieWF3X21vZGlmZXJfcmFuZG9taXphdGlvbiI6MC4wLCJ5YXdfbW9kaWZpZXIiOiJDZW50ZXIiLCJ5YXdfbW9kaWZpZXJfb2Zmc2V0IjotMjAuMCwieWF3X3NwaW5fc3BlZWQiOjEuMH0seyJib2R5X3lhdyI6dHJ1ZSwiY2VudGVyX2RlbGF5X3JhbmRvbWl6YXRpb24iOmZhbHNlLCJjZW50ZXJfdGlja3MiOjIuMCwiY3VzdG9tX3BpdGNoIjowLjAsImN1c3RvbV95YXciOjAuMCwiZGVmX21vZGUiOiJTaW51cyIsImRlZl9waXRjaCI6IkRvd24iLCJkZWZfcGl0Y2hfZGVsYXllZF90aWNrcyI6Mi4wLCJkZWZfc2ludXNfYW1wIjoxLjAsImRlZl9zaW51c19zcGVlZCI6MS4wLCJkZWZfc2ludXNfeWF3IjowLjAsImRlZl90aWNrYmFzZSI6IlBvbHlnb25lIiwiZGVmX3R5cGUiOiJCdWlsZGVyIiwiZGVmX3lhdyI6IlN3aXRjaCIsImRlZl95YXdfZGVsYXllZF90aWNrcyI6MS4wLCJkZWxheWVkX3JhbmRvbSI6dHJ1ZSwiZGVsYXllZF90aWNrcyI6Mi4wLCJkaXN0b3J0aW9uX3BpdGNoIjowLjAsImRpc3RvcnRpb25feWF3IjoxLjAsImVuYWJsZSI6dHJ1ZSwiZm9yY2VfZGVmIjpbIkhpZGUgU2hvdHMiLCJEb3VibGUgVGFwIiwifiJdLCJqaXR0ZXIiOnRydWUsImppdHRlcjFfcGl0Y2giOjAuMCwiaml0dGVyMV95YXciOi04LjAsImppdHRlcjJfcGl0Y2giOjAuMCwiaml0dGVyMl95YXciOjE4LjAsImxfYm9keV95YXdfcmFuZG9taXphdGlvbiI6MjIuMCwibF9qaXR0ZXIiOjAuMCwibF9saW1pdCI6NjAuMCwibF95YXciOi0xOC4wLCJwaXRjaF9kaXN0b3J0aW9uX3NwZWVkIjoxLjAsInBpdGNoX3NwaW5fc3BlZWQiOjEuMCwicl9ib2R5X3lhd19yYW5kb21pemF0aW9uIjoyMy4wLCJyX2ppdHRlciI6MC4wLCJyX2xpbWl0Ijo2MC4wLCJyX3lhdyI6MTUuMCwicmFuZG9tMV9waXRjaCI6MC4wLCJyYW5kb20xX3lhdyI6MC4wLCJyYW5kb20yX3BpdGNoIjowLjAsInJhbmRvbTJfeWF3IjowLjAsInJhbmRvbWl6YXRpb24iOjIwLjAsInNfeWF3IjowLjAsInNwaW5fcGl0Y2giOjEuMCwic3Bpbl95YXciOjEuMCwieF93YXkxIjowLjAsInhfd2F5MiI6MC4wLCJ4X3dheTMiOjAuMCwieWF3IjoiU3dpdGNoIiwieWF3X2Rpc3RvcnRpb25faW52ZXJ0IjpmYWxzZSwieWF3X2Rpc3RvcnRpb25fc3BlZWQiOjEuMCwieWF3X21vZGlmZXJfcmFuZG9taXphdGlvbiI6MjUuMCwieWF3X21vZGlmaWVyIjoiQ2VudGVyIiwieWF3X21vZGlmaWVyX29mZnNldCI6LTIwLjAsInlhd19zcGluX3NwZWVkIjoxLjB9XSxbeyJib2R5X3lhdyI6dHJ1ZSwiY2VudGVyX2RlbGF5X3JhbmRvbWl6YXRpb24iOmZhbHNlLCJjZW50ZXJfdGlja3MiOjIuMCwiY3VzdG9tX3BpdGNoIjowLjAsImN1c3RvbV95YXciOjAuMCwiZGVmX21vZGUiOiJTaW51cyIsImRlZl9waXRjaCI6IkRpc2FibGVkIiwiZGVmX3BpdGNoX2RlbGF5ZWRfdGlja3MiOjIuMCwiZGVmX3NpbnVzX2FtcCI6MS4wLCJkZWZfc2ludXNfc3BlZWQiOjEuMCwiZGVmX3NpbnVzX3lhdyI6MC4wLCJkZWZfdGlja2Jhc2UiOiJQb2x5Z29uZSIsImRlZl90eXBlIjoiQnVpbGRlciIsImRlZl95YXciOiJEaXNhYmxlZCIsImRlZl95YXdfZGVsYXllZF90aWNrcyI6Mi4wLCJkZWxheWVkX3JhbmRvbSI6dHJ1ZSwiZGVsYXllZF90aWNrcyI6Mi4wLCJkaXN0b3J0aW9uX3BpdGNoIjowLjAsImRpc3RvcnRpb25feWF3IjoxLjAsImVuYWJsZSI6dHJ1ZSwiZm9yY2VfZGVmIjpbIn4iXSwiaml0dGVyIjp0cnVlLCJqaXR0ZXIxX3BpdGNoIjowLjAsImppdHRlcjFfeWF3IjowLjAsImppdHRlcjJfcGl0Y2giOjAuMCwiaml0dGVyMl95YXciOjAuMCwibF9ib2R5X3lhd19yYW5kb21pemF0aW9uIjowLjAsImxfaml0dGVyIjowLjAsImxfbGltaXQiOjYwLjAsImxfeWF3IjotMzAuMCwicGl0Y2hfZGlzdG9ydGlvbl9zcGVlZCI6MS4wLCJwaXRjaF9zcGluX3NwZWVkIjoxLjAsInJfYm9keV95YXdfcmFuZG9taXphdGlvbiI6MC4wLCJyX2ppdHRlciI6MC4wLCJyX2xpbWl0Ijo2MC4wLCJyX3lhdyI6MzIuMCwicmFuZG9tMV9waXRjaCI6MC4wLCJyYW5kb20xX3lhdyI6MC4wLCJyYW5kb20yX3BpdGNoIjowLjAsInJhbmRvbTJfeWF3IjowLjAsInJhbmRvbWl6YXRpb24iOjUuMCwic195YXciOjAuMCwic3Bpbl9waXRjaCI6MS4wLCJzcGluX3lhdyI6MS4wLCJ4X3dheTEiOjAuMCwieF93YXkyIjowLjAsInhfd2F5MyI6MC4wLCJ5YXciOiJTd2l0Y2giLCJ5YXdfZGlzdG9ydGlvbl9pbnZlcnQiOmZhbHNlLCJ5YXdfZGlzdG9ydGlvbl9zcGVlZCI6MS4wLCJ5YXdfbW9kaWZlcl9yYW5kb21pemF0aW9uIjowLjAsInlhd19tb2RpZmllciI6IkRpc2FibGVkIiwieWF3X21vZGlmaWVyX29mZnNldCI6MC4wLCJ5YXdfc3Bpbl9zcGVlZCI6MS4wfSx7ImJvZHlfeWF3Ijp0cnVlLCJjZW50ZXJfZGVsYXlfcmFuZG9taXphdGlvbiI6ZmFsc2UsImNlbnRlcl90aWNrcyI6Mi4wLCJjdXN0b21fcGl0Y2giOjAuMCwiY3VzdG9tX3lhdyI6MC4wLCJkZWZfbW9kZSI6IlNpbnVzIiwiZGVmX3BpdGNoIjoiRGlzYWJsZWQiLCJkZWZfcGl0Y2hfZGVsYXllZF90aWNrcyI6Mi4wLCJkZWZfc2ludXNfYW1wIjoxLjAsImRlZl9zaW51c19zcGVlZCI6MS4wLCJkZWZfc2ludXNfeWF3IjowLjAsImRlZl90aWNrYmFzZSI6IlBvbHlnb25lIiwiZGVmX3R5cGUiOiJCdWlsZGVyIiwiZGVmX3lhdyI6IkRpc2FibGVkIiwiZGVmX3lhd19kZWxheWVkX3RpY2tzIjoyLjAsImRlbGF5ZWRfcmFuZG9tIjp0cnVlLCJkZWxheWVkX3RpY2tzIjoyLjAsImRpc3RvcnRpb25fcGl0Y2giOjAuMCwiZGlzdG9ydGlvbl95YXciOjEuMCwiZW5hYmxlIjp0cnVlLCJmb3JjZV9kZWYiOlsifiJdLCJqaXR0ZXIiOnRydWUsImppdHRlcjFfcGl0Y2giOjAuMCwiaml0dGVyMV95YXciOjAuMCwiaml0dGVyMl9waXRjaCI6MC4wLCJqaXR0ZXIyX3lhdyI6MC4wLCJsX2JvZHlfeWF3X3JhbmRvbWl6YXRpb24iOjAuMCwibF9qaXR0ZXIiOjAuMCwibF9saW1pdCI6NjAuMCwibF95YXciOi0zMC4wLCJwaXRjaF9kaXN0b3J0aW9uX3NwZWVkIjoxLjAsInBpdGNoX3NwaW5fc3BlZWQiOjEuMCwicl9ib2R5X3lhd19yYW5kb21pemF0aW9uIjowLjAsInJfaml0dGVyIjowLjAsInJfbGltaXQiOjYwLjAsInJfeWF3IjozMi4wLCJyYW5kb20xX3BpdGNoIjowLjAsInJhbmRvbTFfeWF3IjowLjAsInJhbmRvbTJfcGl0Y2giOjAuMCwicmFuZG9tMl95YXciOjAuMCwicmFuZG9taXphdGlvbiI6NS4wLCJzX3lhdyI6MC4wLCJzcGluX3BpdGNoIjoxLjAsInNwaW5feWF3IjoxLjAsInhfd2F5MSI6MC4wLCJ4X3dheTIiOjAuMCwieF93YXkzIjowLjAsInlhdyI6IlN3aXRjaCIsInlhd19kaXN0b3J0aW9uX2ludmVydCI6ZmFsc2UsInlhd19kaXN0b3J0aW9uX3NwZWVkIjoxLjAsInlhd19tb2RpZmVyX3JhbmRvbWl6YXRpb24iOjAuMCwieWF3X21vZGlmaWVyIjoiRGlzYWJsZWQiLCJ5YXdfbW9kaWZpZXJfb2Zmc2V0IjowLjAsInlhd19zcGluX3NwZWVkIjoxLjB9XSxbeyJib2R5X3lhdyI6dHJ1ZSwiY2VudGVyX2RlbGF5X3JhbmRvbWl6YXRpb24iOmZhbHNlLCJjZW50ZXJfdGlja3MiOjIuMCwiY3VzdG9tX3BpdGNoIjowLjAsImN1c3RvbV95YXciOjAuMCwiZGVmX21vZGUiOiJTaW51cyIsImRlZl9waXRjaCI6IkRvd24iLCJkZWZfcGl0Y2hfZGVsYXllZF90aWNrcyI6Mi4wLCJkZWZfc2ludXNfYW1wIjoxLjAsImRlZl9zaW51c19zcGVlZCI6MS4wLCJkZWZfc2ludXNfeWF3IjowLjAsImRlZl90aWNrYmFzZSI6IlBvbHlnb25lIiwiZGVmX3R5cGUiOiJCdWlsZGVyIiwiZGVmX3lhdyI6IlN3aXRjaCIsImRlZl95YXdfZGVsYXllZF90aWNrcyI6MS4wLCJkZWxheWVkX3JhbmRvbSI6dHJ1ZSwiZGVsYXllZF90aWNrcyI6Mi4wLCJkaXN0b3J0aW9uX3BpdGNoIjowLjAsImRpc3RvcnRpb25feWF3IjoxLjAsImVuYWJsZSI6dHJ1ZSwiZm9yY2VfZGVmIjpbIkhpZGUgU2hvdHMiLCJEb3VibGUgVGFwIiwifiJdLCJqaXR0ZXIiOnRydWUsImppdHRlcjFfcGl0Y2giOjAuMCwiaml0dGVyMV95YXciOi04LjAsImppdHRlcjJfcGl0Y2giOjAuMCwiaml0dGVyMl95YXciOjE4LjAsImxfYm9keV95YXdfcmFuZG9taXphdGlvbiI6MC4wLCJsX2ppdHRlciI6MC4wLCJsX2xpbWl0Ijo2MC4wLCJsX3lhdyI6LTMxLjAsInBpdGNoX2Rpc3RvcnRpb25fc3BlZWQiOjEuMCwicGl0Y2hfc3Bpbl9zcGVlZCI6MS4wLCJyX2JvZHlfeWF3X3JhbmRvbWl6YXRpb24iOjAuMCwicl9qaXR0ZXIiOjAuMCwicl9saW1pdCI6NjAuMCwicl95YXciOjM2LjAsInJhbmRvbTFfcGl0Y2giOjAuMCwicmFuZG9tMV95YXciOjAuMCwicmFuZG9tMl9waXRjaCI6MC4wLCJyYW5kb20yX3lhdyI6MC4wLCJyYW5kb21pemF0aW9uIjoxMC4wLCJzX3lhdyI6MC4wLCJzcGluX3BpdGNoIjoxLjAsInNwaW5feWF3IjoxLjAsInhfd2F5MSI6MC4wLCJ4X3dheTIiOjAuMCwieF93YXkzIjowLjAsInlhdyI6IlN3aXRjaCIsInlhd19kaXN0b3J0aW9uX2ludmVydCI6ZmFsc2UsInlhd19kaXN0b3J0aW9uX3NwZWVkIjoxLjAsInlhd19tb2RpZmVyX3JhbmRvbWl6YXRpb24iOjAuMCwieWF3X21vZGlmaWVyIjoiRGlzYWJsZWQiLCJ5YXdfbW9kaWZpZXJfb2Zmc2V0IjowLjAsInlhd19zcGluX3NwZWVkIjoxLjB9LHsiYm9keV95YXciOnRydWUsImNlbnRlcl9kZWxheV9yYW5kb21pemF0aW9uIjpmYWxzZSwiY2VudGVyX3RpY2tzIjoyLjAsImN1c3RvbV9waXRjaCI6MC4wLCJjdXN0b21feWF3IjowLjAsImRlZl9tb2RlIjoiU2ludXMiLCJkZWZfcGl0Y2giOiJEb3duIiwiZGVmX3BpdGNoX2RlbGF5ZWRfdGlja3MiOjIuMCwiZGVmX3NpbnVzX2FtcCI6MS4wLCJkZWZfc2ludXNfc3BlZWQiOjEuMCwiZGVmX3NpbnVzX3lhdyI6MC4wLCJkZWZfdGlja2Jhc2UiOiJQb2x5Z29uZSIsImRlZl90eXBlIjoiQnVpbGRlciIsImRlZl95YXciOiJTd2l0Y2giLCJkZWZfeWF3X2RlbGF5ZWRfdGlja3MiOjEuMCwiZGVsYXllZF9yYW5kb20iOnRydWUsImRlbGF5ZWRfdGlja3MiOjIuMCwiZGlzdG9ydGlvbl9waXRjaCI6MC4wLCJkaXN0b3J0aW9uX3lhdyI6MS4wLCJlbmFibGUiOnRydWUsImZvcmNlX2RlZiI6WyJIaWRlIFNob3RzIiwiRG91YmxlIFRhcCIsIn4iXSwiaml0dGVyIjp0cnVlLCJqaXR0ZXIxX3BpdGNoIjowLjAsImppdHRlcjFfeWF3IjotOC4wLCJqaXR0ZXIyX3BpdGNoIjowLjAsImppdHRlcjJfeWF3IjoxOC4wLCJsX2JvZHlfeWF3X3JhbmRvbWl6YXRpb24iOjAuMCwibF9qaXR0ZXIiOjAuMCwibF9saW1pdCI6NjAuMCwibF95YXciOi0zMS4wLCJwaXRjaF9kaXN0b3J0aW9uX3NwZWVkIjoxLjAsInBpdGNoX3NwaW5fc3BlZWQiOjEuMCwicl9ib2R5X3lhd19yYW5kb21pemF0aW9uIjowLjAsInJfaml0dGVyIjowLjAsInJfbGltaXQiOjYwLjAsInJfeWF3IjozNi4wLCJyYW5kb20xX3BpdGNoIjowLjAsInJhbmRvbTFfeWF3IjowLjAsInJhbmRvbTJfcGl0Y2giOjAuMCwicmFuZG9tMl95YXciOjAuMCwicmFuZG9taXphdGlvbiI6MTAuMCwic195YXciOjAuMCwic3Bpbl9waXRjaCI6MS4wLCJzcGluX3lhdyI6MS4wLCJ4X3dheTEiOjAuMCwieF93YXkyIjowLjAsInhfd2F5MyI6MC4wLCJ5YXciOiJTd2l0Y2giLCJ5YXdfZGlzdG9ydGlvbl9pbnZlcnQiOmZhbHNlLCJ5YXdfZGlzdG9ydGlvbl9zcGVlZCI6MS4wLCJ5YXdfbW9kaWZlcl9yYW5kb21pemF0aW9uIjowLjAsInlhd19tb2RpZmllciI6IkRpc2FibGVkIiwieWF3X21vZGlmaWVyX29mZnNldCI6MC4wLCJ5YXdfc3Bpbl9zcGVlZCI6MS4wfV0sW3siYm9keV95YXciOnRydWUsImNlbnRlcl9kZWxheV9yYW5kb21pemF0aW9uIjpmYWxzZSwiY2VudGVyX3RpY2tzIjoyLjAsImN1c3RvbV9waXRjaCI6MC4wLCJjdXN0b21feWF3IjowLjAsImRlZl9tb2RlIjoiU2ludXMiLCJkZWZfcGl0Y2giOiJEb3duIiwiZGVmX3BpdGNoX2RlbGF5ZWRfdGlja3MiOjIuMCwiZGVmX3NpbnVzX2FtcCI6MS4wLCJkZWZfc2ludXNfc3BlZWQiOjEuMCwiZGVmX3NpbnVzX3lhdyI6MC4wLCJkZWZfdGlja2Jhc2UiOiJQb2x5Z29uZSIsImRlZl90eXBlIjoiQnVpbGRlciIsImRlZl95YXciOiJYLVdheSIsImRlZl95YXdfZGVsYXllZF90aWNrcyI6Mi4wLCJkZWxheWVkX3JhbmRvbSI6dHJ1ZSwiZGVsYXllZF90aWNrcyI6Mi4wLCJkaXN0b3J0aW9uX3BpdGNoIjowLjAsImRpc3RvcnRpb25feWF3IjoxLjAsImVuYWJsZSI6dHJ1ZSwiZm9yY2VfZGVmIjpbIkhpZGUgU2hvdHMiLCJEb3VibGUgVGFwIiwifiJdLCJqaXR0ZXIiOnRydWUsImppdHRlcjFfcGl0Y2giOjAuMCwiaml0dGVyMV95YXciOjAuMCwiaml0dGVyMl9waXRjaCI6MC4wLCJqaXR0ZXIyX3lhdyI6MC4wLCJsX2JvZHlfeWF3X3JhbmRvbWl6YXRpb24iOjAuMCwibF9qaXR0ZXIiOjAuMCwibF9saW1pdCI6NjAuMCwibF95YXciOi0zNC4wLCJwaXRjaF9kaXN0b3J0aW9uX3NwZWVkIjoxLjAsInBpdGNoX3NwaW5fc3BlZWQiOjEuMCwicl9ib2R5X3lhd19yYW5kb21pemF0aW9uIjowLjAsInJfaml0dGVyIjowLjAsInJfbGltaXQiOjYwLjAsInJfeWF3Ijo1NS4wLCJyYW5kb20xX3BpdGNoIjowLjAsInJhbmRvbTFfeWF3IjowLjAsInJhbmRvbTJfcGl0Y2giOjAuMCwicmFuZG9tMl95YXciOjAuMCwicmFuZG9taXphdGlvbiI6NS4wLCJzX3lhdyI6MC4wLCJzcGluX3BpdGNoIjoxLjAsInNwaW5feWF3IjoxLjAsInhfd2F5MSI6LTE4LjAsInhfd2F5MiI6MjkuMCwieF93YXkzIjoxMy4wLCJ5YXciOiJTd2l0Y2giLCJ5YXdfZGlzdG9ydGlvbl9pbnZlcnQiOmZhbHNlLCJ5YXdfZGlzdG9ydGlvbl9zcGVlZCI6MS4wLCJ5YXdfbW9kaWZlcl9yYW5kb21pemF0aW9uIjowLjAsInlhd19tb2RpZmllciI6IkNlbnRlciIsInlhd19tb2RpZmllcl9vZmZzZXQiOi0xLjAsInlhd19zcGluX3NwZWVkIjoxLjB9LHsiYm9keV95YXciOnRydWUsImNlbnRlcl9kZWxheV9yYW5kb21pemF0aW9uIjpmYWxzZSwiY2VudGVyX3RpY2tzIjoyLjAsImN1c3RvbV9waXRjaCI6MC4wLCJjdXN0b21feWF3IjowLjAsImRlZl9tb2RlIjoiU2ludXMiLCJkZWZfcGl0Y2giOiJEb3duIiwiZGVmX3BpdGNoX2RlbGF5ZWRfdGlja3MiOjIuMCwiZGVmX3NpbnVzX2FtcCI6MS4wLCJkZWZfc2ludXNfc3BlZWQiOjEuMCwiZGVmX3NpbnVzX3lhdyI6MC4wLCJkZWZfdGlja2Jhc2UiOiJQb2x5Z29uZSIsImRlZl90eXBlIjoiQnVpbGRlciIsImRlZl95YXciOiJYLVdheSIsImRlZl95YXdfZGVsYXllZF90aWNrcyI6Mi4wLCJkZWxheWVkX3JhbmRvbSI6dHJ1ZSwiZGVsYXllZF90aWNrcyI6Mi4wLCJkaXN0b3J0aW9uX3BpdGNoIjowLjAsImRpc3RvcnRpb25feWF3IjoxLjAsImVuYWJsZSI6dHJ1ZSwiZm9yY2VfZGVmIjpbIkhpZGUgU2hvdHMiLCJEb3VibGUgVGFwIiwifiJdLCJqaXR0ZXIiOnRydWUsImppdHRlcjFfcGl0Y2giOjAuMCwiaml0dGVyMV95YXciOjAuMCwiaml0dGVyMl9waXRjaCI6MC4wLCJqaXR0ZXIyX3lhdyI6MC4wLCJsX2JvZHlfeWF3X3JhbmRvbWl6YXRpb24iOjAuMCwibF9qaXR0ZXIiOjAuMCwibF9saW1pdCI6NjAuMCwibF95YXciOi0zNC4wLCJwaXRjaF9kaXN0b3J0aW9uX3NwZWVkIjoxLjAsInBpdGNoX3NwaW5fc3BlZWQiOjEuMCwicl9ib2R5X3lhd19yYW5kb21pemF0aW9uIjowLjAsInJfaml0dGVyIjowLjAsInJfbGltaXQiOjYwLjAsInJfeWF3Ijo1NS4wLCJyYW5kb20xX3BpdGNoIjowLjAsInJhbmRvbTFfeWF3IjowLjAsInJhbmRvbTJfcGl0Y2giOjAuMCwicmFuZG9tMl95YXciOjAuMCwicmFuZG9taXphdGlvbiI6NS4wLCJzX3lhdyI6MC4wLCJzcGluX3BpdGNoIjoxLjAsInNwaW5feWF3IjoxLjAsInhfd2F5MSI6LTE4LjAsInhfd2F5MiI6MjkuMCwieF93YXkzIjoxMy4wLCJ5YXciOiJTd2l0Y2giLCJ5YXdfZGlzdG9ydGlvbl9pbnZlcnQiOmZhbHNlLCJ5YXdfZGlzdG9ydGlvbl9zcGVlZCI6MS4wLCJ5YXdfbW9kaWZlcl9yYW5kb21pemF0aW9uIjowLjAsInlhd19tb2RpZmllciI6IkNlbnRlciIsInlhd19tb2RpZmllcl9vZmZzZXQiOi0xLjAsInlhd19zcGluX3NwZWVkIjoxLjB9XSxbeyJib2R5X3lhdyI6dHJ1ZSwiY2VudGVyX2RlbGF5X3JhbmRvbWl6YXRpb24iOmZhbHNlLCJjZW50ZXJfdGlja3MiOjIuMCwiY3VzdG9tX3BpdGNoIjowLjAsImN1c3RvbV95YXciOjAuMCwiZGVmX21vZGUiOiJTaW51cyIsImRlZl9waXRjaCI6IkRvd24iLCJkZWZfcGl0Y2hfZGVsYXllZF90aWNrcyI6Mi4wLCJkZWZfc2ludXNfYW1wIjoxLjAsImRlZl9zaW51c19zcGVlZCI6MS4wLCJkZWZfc2ludXNfeWF3IjowLjAsImRlZl90aWNrYmFzZSI6IlBvbHlnb25lIiwiZGVmX3R5cGUiOiJCdWlsZGVyIiwiZGVmX3lhdyI6IlN3aXRjaCIsImRlZl95YXdfZGVsYXllZF90aWNrcyI6Mi4wLCJkZWxheWVkX3JhbmRvbSI6dHJ1ZSwiZGVsYXllZF90aWNrcyI6Mi4wLCJkaXN0b3J0aW9uX3BpdGNoIjowLjAsImRpc3RvcnRpb25feWF3IjoxLjAsImVuYWJsZSI6dHJ1ZSwiZm9yY2VfZGVmIjpbIkhpZGUgU2hvdHMiLCJEb3VibGUgVGFwIiwifiJdLCJqaXR0ZXIiOnRydWUsImppdHRlcjFfcGl0Y2giOjAuMCwiaml0dGVyMV95YXciOi0xNC4wLCJqaXR0ZXIyX3BpdGNoIjowLjAsImppdHRlcjJfeWF3IjoxNS4wLCJsX2JvZHlfeWF3X3JhbmRvbWl6YXRpb24iOjAuMCwibF9qaXR0ZXIiOjAuMCwibF9saW1pdCI6NjAuMCwibF95YXciOi0xNC4wLCJwaXRjaF9kaXN0b3J0aW9uX3NwZWVkIjoxLjAsInBpdGNoX3NwaW5fc3BlZWQiOjEuMCwicl9ib2R5X3lhd19yYW5kb21pemF0aW9uIjowLjAsInJfaml0dGVyIjowLjAsInJfbGltaXQiOjYwLjAsInJfeWF3IjoxMC4wLCJyYW5kb20xX3BpdGNoIjowLjAsInJhbmRvbTFfeWF3IjowLjAsInJhbmRvbTJfcGl0Y2giOjAuMCwicmFuZG9tMl95YXciOjAuMCwicmFuZG9taXphdGlvbiI6MjAuMCwic195YXciOjAuMCwic3Bpbl9waXRjaCI6MS4wLCJzcGluX3lhdyI6MS4wLCJ4X3dheTEiOjAuMCwieF93YXkyIjowLjAsInhfd2F5MyI6MC4wLCJ5YXciOiJTd2l0Y2giLCJ5YXdfZGlzdG9ydGlvbl9pbnZlcnQiOmZhbHNlLCJ5YXdfZGlzdG9ydGlvbl9zcGVlZCI6MS4wLCJ5YXdfbW9kaWZlcl9yYW5kb21pemF0aW9uIjowLjAsInlhd19tb2RpZmllciI6IkNlbnRlciIsInlhd19tb2RpZmllcl9vZmZzZXQiOi03LjAsInlhd19zcGluX3NwZWVkIjoxLjB9LHsiYm9keV95YXciOnRydWUsImNlbnRlcl9kZWxheV9yYW5kb21pemF0aW9uIjpmYWxzZSwiY2VudGVyX3RpY2tzIjoyLjAsImN1c3RvbV9waXRjaCI6MC4wLCJjdXN0b21feWF3IjowLjAsImRlZl9tb2RlIjoiU2ludXMiLCJkZWZfcGl0Y2giOiJEb3duIiwiZGVmX3BpdGNoX2RlbGF5ZWRfdGlja3MiOjIuMCwiZGVmX3NpbnVzX2FtcCI6MS4wLCJkZWZfc2ludXNfc3BlZWQiOjEuMCwiZGVmX3NpbnVzX3lhdyI6MC4wLCJkZWZfdGlja2Jhc2UiOiJQb2x5Z29uZSIsImRlZl90eXBlIjoiQnVpbGRlciIsImRlZl95YXciOiJTd2l0Y2giLCJkZWZfeWF3X2RlbGF5ZWRfdGlja3MiOjIuMCwiZGVsYXllZF9yYW5kb20iOnRydWUsImRlbGF5ZWRfdGlja3MiOjIuMCwiZGlzdG9ydGlvbl9waXRjaCI6MC4wLCJkaXN0b3J0aW9uX3lhdyI6MS4wLCJlbmFibGUiOnRydWUsImZvcmNlX2RlZiI6WyJIaWRlIFNob3RzIiwiRG91YmxlIFRhcCIsIn4iXSwiaml0dGVyIjp0cnVlLCJqaXR0ZXIxX3BpdGNoIjowLjAsImppdHRlcjFfeWF3IjotMTQuMCwiaml0dGVyMl9waXRjaCI6MC4wLCJqaXR0ZXIyX3lhdyI6MTUuMCwibF9ib2R5X3lhd19yYW5kb21pemF0aW9uIjowLjAsImxfaml0dGVyIjowLjAsImxfbGltaXQiOjYwLjAsImxfeWF3IjotMTQuMCwicGl0Y2hfZGlzdG9ydGlvbl9zcGVlZCI6MS4wLCJwaXRjaF9zcGluX3NwZWVkIjoxLjAsInJfYm9keV95YXdfcmFuZG9taXphdGlvbiI6MC4wLCJyX2ppdHRlciI6MC4wLCJyX2xpbWl0Ijo2MC4wLCJyX3lhdyI6MTAuMCwicmFuZG9tMV9waXRjaCI6MC4wLCJyYW5kb20xX3lhdyI6MC4wLCJyYW5kb20yX3BpdGNoIjowLjAsInJhbmRvbTJfeWF3IjowLjAsInJhbmRvbWl6YXRpb24iOjIwLjAsInNfeWF3IjowLjAsInNwaW5fcGl0Y2giOjEuMCwic3Bpbl95YXciOjEuMCwieF93YXkxIjowLjAsInhfd2F5MiI6MC4wLCJ4X3dheTMiOjAuMCwieWF3IjoiU3dpdGNoIiwieWF3X2Rpc3RvcnRpb25faW52ZXJ0IjpmYWxzZSwieWF3X2Rpc3RvcnRpb25fc3BlZWQiOjEuMCwieWF3X21vZGlmZXJfcmFuZG9taXphdGlvbiI6MC4wLCJ5YXdfbW9kaWZpZXIiOiJDZW50ZXIiLCJ5YXdfbW9kaWZpZXJfb2Zmc2V0IjotNy4wLCJ5YXdfc3Bpbl9zcGVlZCI6MS4wfV0sW3siYm9keV95YXciOnRydWUsImNlbnRlcl9kZWxheV9yYW5kb21pemF0aW9uIjpmYWxzZSwiY2VudGVyX3RpY2tzIjoyLjAsImN1c3RvbV9waXRjaCI6MC4wLCJjdXN0b21feWF3IjowLjAsImRlZl9tb2RlIjoiU2ludXMiLCJkZWZfcGl0Y2giOiJEb3duIiwiZGVmX3BpdGNoX2RlbGF5ZWRfdGlja3MiOjIuMCwiZGVmX3NpbnVzX2FtcCI6MS4wLCJkZWZfc2ludXNfc3BlZWQiOjEuMCwiZGVmX3NpbnVzX3lhdyI6MC4wLCJkZWZfdGlja2Jhc2UiOiJQb2x5Z29uZSIsImRlZl90eXBlIjoiQnVpbGRlciIsImRlZl95YXciOiJTd2l0Y2giLCJkZWZfeWF3X2RlbGF5ZWRfdGlja3MiOjEuMCwiZGVsYXllZF9yYW5kb20iOmZhbHNlLCJkZWxheWVkX3RpY2tzIjozLjAsImRpc3RvcnRpb25fcGl0Y2giOjAuMCwiZGlzdG9ydGlvbl95YXciOjEuMCwiZW5hYmxlIjp0cnVlLCJmb3JjZV9kZWYiOlsiSGlkZSBTaG90cyIsIkRvdWJsZSBUYXAiLCJ+Il0sImppdHRlciI6dHJ1ZSwiaml0dGVyMV9waXRjaCI6MC4wLCJqaXR0ZXIxX3lhdyI6LTExLjAsImppdHRlcjJfcGl0Y2giOjAuMCwiaml0dGVyMl95YXciOjEwLjAsImxfYm9keV95YXdfcmFuZG9taXphdGlvbiI6MC4wLCJsX2ppdHRlciI6MC4wLCJsX2xpbWl0Ijo2MC4wLCJsX3lhdyI6LTI3LjAsInBpdGNoX2Rpc3RvcnRpb25fc3BlZWQiOjEuMCwicGl0Y2hfc3Bpbl9zcGVlZCI6MS4wLCJyX2JvZHlfeWF3X3JhbmRvbWl6YXRpb24iOjAuMCwicl9qaXR0ZXIiOjAuMCwicl9saW1pdCI6NjAuMCwicl95YXciOjM1LjAsInJhbmRvbTFfcGl0Y2giOjAuMCwicmFuZG9tMV95YXciOjAuMCwicmFuZG9tMl9waXRjaCI6MC4wLCJyYW5kb20yX3lhdyI6MC4wLCJyYW5kb21pemF0aW9uIjowLjAsInNfeWF3IjowLjAsInNwaW5fcGl0Y2giOjEuMCwic3Bpbl95YXciOjEuMCwieF93YXkxIjowLjAsInhfd2F5MiI6MC4wLCJ4X3dheTMiOjAuMCwieWF3IjoiU3dpdGNoIiwieWF3X2Rpc3RvcnRpb25faW52ZXJ0IjpmYWxzZSwieWF3X2Rpc3RvcnRpb25fc3BlZWQiOjEuMCwieWF3X21vZGlmZXJfcmFuZG9taXphdGlvbiI6MC4wLCJ5YXdfbW9kaWZpZXIiOiJDZW50ZXIiLCJ5YXdfbW9kaWZpZXJfb2Zmc2V0IjotNS4wLCJ5YXdfc3Bpbl9zcGVlZCI6MS4wfSx7ImJvZHlfeWF3Ijp0cnVlLCJjZW50ZXJfZGVsYXlfcmFuZG9taXphdGlvbiI6ZmFsc2UsImNlbnRlcl90aWNrcyI6Mi4wLCJjdXN0b21fcGl0Y2giOjAuMCwiY3VzdG9tX3lhdyI6MC4wLCJkZWZfbW9kZSI6IlNpbnVzIiwiZGVmX3BpdGNoIjoiRG93biIsImRlZl9waXRjaF9kZWxheWVkX3RpY2tzIjoyLjAsImRlZl9zaW51c19hbXAiOjEuMCwiZGVmX3NpbnVzX3NwZWVkIjoxLjAsImRlZl9zaW51c195YXciOjAuMCwiZGVmX3RpY2tiYXNlIjoiUG9seWdvbmUiLCJkZWZfdHlwZSI6IkJ1aWxkZXIiLCJkZWZfeWF3IjoiU3dpdGNoIiwiZGVmX3lhd19kZWxheWVkX3RpY2tzIjoxLjAsImRlbGF5ZWRfcmFuZG9tIjpmYWxzZSwiZGVsYXllZF90aWNrcyI6My4wLCJkaXN0b3J0aW9uX3BpdGNoIjowLjAsImRpc3RvcnRpb25feWF3IjoxLjAsImVuYWJsZSI6dHJ1ZSwiZm9yY2VfZGVmIjpbIkhpZGUgU2hvdHMiLCJEb3VibGUgVGFwIiwifiJdLCJqaXR0ZXIiOnRydWUsImppdHRlcjFfcGl0Y2giOjAuMCwiaml0dGVyMV95YXciOi0xMS4wLCJqaXR0ZXIyX3BpdGNoIjowLjAsImppdHRlcjJfeWF3IjoxMC4wLCJsX2JvZHlfeWF3X3JhbmRvbWl6YXRpb24iOjAuMCwibF9qaXR0ZXIiOjAuMCwibF9saW1pdCI6NjAuMCwibF95YXciOi0yNy4wLCJwaXRjaF9kaXN0b3J0aW9uX3NwZWVkIjoxLjAsInBpdGNoX3NwaW5fc3BlZWQiOjEuMCwicl9ib2R5X3lhd19yYW5kb21pemF0aW9uIjowLjAsInJfaml0dGVyIjowLjAsInJfbGltaXQiOjYwLjAsInJfeWF3IjozNS4wLCJyYW5kb20xX3BpdGNoIjowLjAsInJhbmRvbTFfeWF3IjowLjAsInJhbmRvbTJfcGl0Y2giOjAuMCwicmFuZG9tMl95YXciOjAuMCwicmFuZG9taXphdGlvbiI6MC4wLCJzX3lhdyI6MC4wLCJzcGluX3BpdGNoIjoxLjAsInNwaW5feWF3IjoxLjAsInhfd2F5MSI6MC4wLCJ4X3dheTIiOjAuMCwieF93YXkzIjowLjAsInlhdyI6IlN3aXRjaCIsInlhd19kaXN0b3J0aW9uX2ludmVydCI6ZmFsc2UsInlhd19kaXN0b3J0aW9uX3NwZWVkIjoxLjAsInlhd19tb2RpZmVyX3JhbmRvbWl6YXRpb24iOjAuMCwieWF3X21vZGlmaWVyIjoiQ2VudGVyIiwieWF3X21vZGlmaWVyX29mZnNldCI6LTUuMCwieWF3X3NwaW5fc3BlZWQiOjEuMH1dLFt7ImJvZHlfeWF3Ijp0cnVlLCJjZW50ZXJfZGVsYXlfcmFuZG9taXphdGlvbiI6ZmFsc2UsImNlbnRlcl90aWNrcyI6Mi4wLCJjdXN0b21fcGl0Y2giOjAuMCwiY3VzdG9tX3lhdyI6MC4wLCJkZWZfbW9kZSI6IlNpbnVzIiwiZGVmX3BpdGNoIjoiRG93biIsImRlZl9waXRjaF9kZWxheWVkX3RpY2tzIjoyLjAsImRlZl9zaW51c19hbXAiOjEwMC4wLCJkZWZfc2ludXNfc3BlZWQiOjQxLjAsImRlZl9zaW51c195YXciOi04My4wLCJkZWZfdGlja2Jhc2UiOiJQb2x5Z29uZSIsImRlZl90eXBlIjoiQnVpbGRlciIsImRlZl95YXciOiJTd2l0Y2giLCJkZWZfeWF3X2RlbGF5ZWRfdGlja3MiOjIuMCwiZGVsYXllZF9yYW5kb20iOmZhbHNlLCJkZWxheWVkX3RpY2tzIjozLjAsImRpc3RvcnRpb25fcGl0Y2giOjAuMCwiZGlzdG9ydGlvbl95YXciOjEuMCwiZW5hYmxlIjp0cnVlLCJmb3JjZV9kZWYiOlsiSGlkZSBTaG90cyIsIkRvdWJsZSBUYXAiLCJ+Il0sImppdHRlciI6dHJ1ZSwiaml0dGVyMV9waXRjaCI6MC4wLCJqaXR0ZXIxX3lhdyI6LTEzLjAsImppdHRlcjJfcGl0Y2giOjAuMCwiaml0dGVyMl95YXciOjEyLjAsImxfYm9keV95YXdfcmFuZG9taXphdGlvbiI6MC4wLCJsX2ppdHRlciI6MC4wLCJsX2xpbWl0Ijo2MC4wLCJsX3lhdyI6LTI0LjAsInBpdGNoX2Rpc3RvcnRpb25fc3BlZWQiOjEuMCwicGl0Y2hfc3Bpbl9zcGVlZCI6MS4wLCJyX2JvZHlfeWF3X3JhbmRvbWl6YXRpb24iOjAuMCwicl9qaXR0ZXIiOjAuMCwicl9saW1pdCI6NjAuMCwicl95YXciOjMxLjAsInJhbmRvbTFfcGl0Y2giOjAuMCwicmFuZG9tMV95YXciOjAuMCwicmFuZG9tMl9waXRjaCI6MC4wLCJyYW5kb20yX3lhdyI6MC4wLCJyYW5kb21pemF0aW9uIjoyMC4wLCJzX3lhdyI6MC4wLCJzcGluX3BpdGNoIjoxLjAsInNwaW5feWF3IjoxLjAsInhfd2F5MSI6MC4wLCJ4X3dheTIiOjAuMCwieF93YXkzIjowLjAsInlhdyI6IlN3aXRjaCIsInlhd19kaXN0b3J0aW9uX2ludmVydCI6ZmFsc2UsInlhd19kaXN0b3J0aW9uX3NwZWVkIjoxLjAsInlhd19tb2RpZmVyX3JhbmRvbWl6YXRpb24iOjAuMCwieWF3X21vZGlmaWVyIjoiQ2VudGVyIiwieWF3X21vZGlmaWVyX29mZnNldCI6LTEyLjAsInlhd19zcGluX3NwZWVkIjoxLjB9LHsiYm9keV95YXciOnRydWUsImNlbnRlcl9kZWxheV9yYW5kb21pemF0aW9uIjpmYWxzZSwiY2VudGVyX3RpY2tzIjoyLjAsImN1c3RvbV9waXRjaCI6MC4wLCJjdXN0b21feWF3IjowLjAsImRlZl9tb2RlIjoiU2ludXMiLCJkZWZfcGl0Y2giOiJEb3duIiwiZGVmX3BpdGNoX2RlbGF5ZWRfdGlja3MiOjIuMCwiZGVmX3NpbnVzX2FtcCI6MTAwLjAsImRlZl9zaW51c19zcGVlZCI6NDEuMCwiZGVmX3NpbnVzX3lhdyI6LTgzLjAsImRlZl90aWNrYmFzZSI6IlBvbHlnb25lIiwiZGVmX3R5cGUiOiJCdWlsZGVyIiwiZGVmX3lhdyI6IlN3aXRjaCIsImRlZl95YXdfZGVsYXllZF90aWNrcyI6Mi4wLCJkZWxheWVkX3JhbmRvbSI6ZmFsc2UsImRlbGF5ZWRfdGlja3MiOjMuMCwiZGlzdG9ydGlvbl9waXRjaCI6MC4wLCJkaXN0b3J0aW9uX3lhdyI6MS4wLCJlbmFibGUiOnRydWUsImZvcmNlX2RlZiI6WyJIaWRlIFNob3RzIiwiRG91YmxlIFRhcCIsIn4iXSwiaml0dGVyIjp0cnVlLCJqaXR0ZXIxX3BpdGNoIjowLjAsImppdHRlcjFfeWF3IjotMTMuMCwiaml0dGVyMl9waXRjaCI6MC4wLCJqaXR0ZXIyX3lhdyI6MTIuMCwibF9ib2R5X3lhd19yYW5kb21pemF0aW9uIjowLjAsImxfaml0dGVyIjowLjAsImxfbGltaXQiOjYwLjAsImxfeWF3IjotMjQuMCwicGl0Y2hfZGlzdG9ydGlvbl9zcGVlZCI6MS4wLCJwaXRjaF9zcGluX3NwZWVkIjoxLjAsInJfYm9keV95YXdfcmFuZG9taXphdGlvbiI6MC4wLCJyX2ppdHRlciI6MC4wLCJyX2xpbWl0Ijo2MC4wLCJyX3lhdyI6MzEuMCwicmFuZG9tMV9waXRjaCI6MC4wLCJyYW5kb20xX3lhdyI6MC4wLCJyYW5kb20yX3BpdGNoIjowLjAsInJhbmRvbTJfeWF3IjowLjAsInJhbmRvbWl6YXRpb24iOjIwLjAsInNfeWF3IjowLjAsInNwaW5fcGl0Y2giOjEuMCwic3Bpbl95YXciOjEuMCwieF93YXkxIjowLjAsInhfd2F5MiI6MC4wLCJ4X3dheTMiOjAuMCwieWF3IjoiU3dpdGNoIiwieWF3X2Rpc3RvcnRpb25faW52ZXJ0IjpmYWxzZSwieWF3X2Rpc3RvcnRpb25fc3BlZWQiOjEuMCwieWF3X21vZGlmZXJfcmFuZG9taXphdGlvbiI6MjAuMCwieWF3X21vZGlmaWVyIjoiQ2VudGVyIiwieWF3X21vZGlmaWVyX29mZnNldCI6LTEyLjAsInlhd19zcGluX3NwZWVkIjoxLjB9XSxbeyJib2R5X3lhdyI6dHJ1ZSwiY2VudGVyX2RlbGF5X3JhbmRvbWl6YXRpb24iOmZhbHNlLCJjZW50ZXJfdGlja3MiOjIuMCwiY3VzdG9tX3BpdGNoIjowLjAsImN1c3RvbV95YXciOjAuMCwiZGVmX21vZGUiOiJTaW51cyIsImRlZl9waXRjaCI6IkRpc2FibGVkIiwiZGVmX3BpdGNoX2RlbGF5ZWRfdGlja3MiOjIuMCwiZGVmX3NpbnVzX2FtcCI6MS4wLCJkZWZfc2ludXNfc3BlZWQiOjEuMCwiZGVmX3NpbnVzX3lhdyI6MC4wLCJkZWZfdGlja2Jhc2UiOiJQb2x5Z29uZSIsImRlZl90eXBlIjoiQnVpbGRlciIsImRlZl95YXciOiJEaXNhYmxlZCIsImRlZl95YXdfZGVsYXllZF90aWNrcyI6Mi4wLCJkZWxheWVkX3JhbmRvbSI6dHJ1ZSwiZGVsYXllZF90aWNrcyI6My4wLCJkaXN0b3J0aW9uX3BpdGNoIjowLjAsImRpc3RvcnRpb25feWF3IjoxLjAsImVuYWJsZSI6dHJ1ZSwiZm9yY2VfZGVmIjpbIn4iXSwiaml0dGVyIjpmYWxzZSwiaml0dGVyMV9waXRjaCI6MC4wLCJqaXR0ZXIxX3lhdyI6MC4wLCJqaXR0ZXIyX3BpdGNoIjowLjAsImppdHRlcjJfeWF3IjowLjAsImxfYm9keV95YXdfcmFuZG9taXphdGlvbiI6MC4wLCJsX2ppdHRlciI6MC4wLCJsX2xpbWl0Ijo2MC4wLCJsX3lhdyI6LTExLjAsInBpdGNoX2Rpc3RvcnRpb25fc3BlZWQiOjEuMCwicGl0Y2hfc3Bpbl9zcGVlZCI6MS4wLCJyX2JvZHlfeWF3X3JhbmRvbWl6YXRpb24iOjAuMCwicl9qaXR0ZXIiOjAuMCwicl9saW1pdCI6NjAuMCwicl95YXciOjEwLjAsInJhbmRvbTFfcGl0Y2giOjAuMCwicmFuZG9tMV95YXciOjAuMCwicmFuZG9tMl9waXRjaCI6MC4wLCJyYW5kb20yX3lhdyI6MC4wLCJyYW5kb21pemF0aW9uIjoxNi4wLCJzX3lhdyI6LTQuMCwic3Bpbl9waXRjaCI6MS4wLCJzcGluX3lhdyI6MS4wLCJ4X3dheTEiOjAuMCwieF93YXkyIjowLjAsInhfd2F5MyI6MC4wLCJ5YXciOiJTd2l0Y2giLCJ5YXdfZGlzdG9ydGlvbl9pbnZlcnQiOmZhbHNlLCJ5YXdfZGlzdG9ydGlvbl9zcGVlZCI6MS4wLCJ5YXdfbW9kaWZlcl9yYW5kb21pemF0aW9uIjowLjAsInlhd19tb2RpZmllciI6IjMtV2F5IiwieWF3X21vZGlmaWVyX29mZnNldCI6LTkuMCwieWF3X3NwaW5fc3BlZWQiOjEuMH0seyJib2R5X3lhdyI6dHJ1ZSwiY2VudGVyX2RlbGF5X3JhbmRvbWl6YXRpb24iOmZhbHNlLCJjZW50ZXJfdGlja3MiOjIuMCwiY3VzdG9tX3BpdGNoIjowLjAsImN1c3RvbV95YXciOjAuMCwiZGVmX21vZGUiOiJTaW51cyIsImRlZl9waXRjaCI6IkRpc2FibGVkIiwiZGVmX3BpdGNoX2RlbGF5ZWRfdGlja3MiOjIuMCwiZGVmX3NpbnVzX2FtcCI6MS4wLCJkZWZfc2ludXNfc3BlZWQiOjEuMCwiZGVmX3NpbnVzX3lhdyI6MC4wLCJkZWZfdGlja2Jhc2UiOiJQb2x5Z29uZSIsImRlZl90eXBlIjoiQnVpbGRlciIsImRlZl95YXciOiJEaXNhYmxlZCIsImRlZl95YXdfZGVsYXllZF90aWNrcyI6Mi4wLCJkZWxheWVkX3JhbmRvbSI6dHJ1ZSwiZGVsYXllZF90aWNrcyI6My4wLCJkaXN0b3J0aW9uX3BpdGNoIjowLjAsImRpc3RvcnRpb25feWF3IjoxLjAsImVuYWJsZSI6dHJ1ZSwiZm9yY2VfZGVmIjpbIn4iXSwiaml0dGVyIjpmYWxzZSwiaml0dGVyMV9waXRjaCI6MC4wLCJqaXR0ZXIxX3lhdyI6MC4wLCJqaXR0ZXIyX3BpdGNoIjowLjAsImppdHRlcjJfeWF3IjowLjAsImxfYm9keV95YXdfcmFuZG9taXphdGlvbiI6MC4wLCJsX2ppdHRlciI6MC4wLCJsX2xpbWl0Ijo2MC4wLCJsX3lhdyI6LTExLjAsInBpdGNoX2Rpc3RvcnRpb25fc3BlZWQiOjEuMCwicGl0Y2hfc3Bpbl9zcGVlZCI6MS4wLCJyX2JvZHlfeWF3X3JhbmRvbWl6YXRpb24iOjAuMCwicl9qaXR0ZXIiOjAuMCwicl9saW1pdCI6NjAuMCwicl95YXciOjEwLjAsInJhbmRvbTFfcGl0Y2giOjAuMCwicmFuZG9tMV95YXciOjAuMCwicmFuZG9tMl9waXRjaCI6MC4wLCJyYW5kb20yX3lhdyI6MC4wLCJyYW5kb21pemF0aW9uIjoxNi4wLCJzX3lhdyI6LTQuMCwic3Bpbl9waXRjaCI6MS4wLCJzcGluX3lhdyI6MS4wLCJ4X3dheTEiOjAuMCwieF93YXkyIjowLjAsInhfd2F5MyI6MC4wLCJ5YXciOiJTd2l0Y2giLCJ5YXdfZGlzdG9ydGlvbl9pbnZlcnQiOmZhbHNlLCJ5YXdfZGlzdG9ydGlvbl9zcGVlZCI6MS4wLCJ5YXdfbW9kaWZlcl9yYW5kb21pemF0aW9uIjowLjAsInlhd19tb2RpZmllciI6IjMtV2F5IiwieWF3X21vZGlmaWVyX29mZnNldCI6LTkuMCwieWF3X3NwaW5fc3BlZWQiOjEuMH1dXSx7ImFudGlhaW1zIjp7ImFhX2Rpc2FibGVycyI6WzEuMCwyLjAsIn4iXSwiYWRkaXRpb25zIjpbMS4wLDIuMCwifiJdLCJhaXJfbGFnIjpmYWxzZSwiYXV0b19vc2FhIjp0cnVlLCJjdXJyZW50X3N0YXRlIjoiQWVyb2JpYysiLCJjdXJyZW50X3RhYiI6My4wLCJjdXJyZW50X3RlYW0iOiJUZXJyb3Jpc3QiLCJkZWZlbnNpdmVfZmxpY2siOmZhbHNlLCJmcmVlc3RhbmRpbmciOnsiZGlzYWJsZXJzIjpbIldhbGtpbmciLCJDcm91Y2hpbmciLCJTbmVha2luZyIsIkFpciIsIkFpciBDcm91Y2hpbmciLCJ+Il0sIm1hbmlwdWxhdGlvbnMiOlsiRGlzYWJsZSBZYXcgTW9kaWZpZXJzIiwiQm9keSBGcmVlc3RhbmRpbmciLCJ+Il0sInN3aXRjaCI6ZmFsc2V9LCJzYWZlX2hlYWQiOnRydWUsInlhd19iYXNlIjp7ImxlZnRfc2lkZSI6LTkwLjAsIm1hbmlwdWxhdGlvbnMiOlsiU3RhdGljIiwifiJdLCJyaWdodF9zaWRlIjo5MC4wLCJzZWxlY3Rfc2lkZSI6IkF0IFRhcmdldCJ9LCJ+YWlyX2xhZyI6eyJ0aWNrcyI6MTAuMH0sIn5hdXRvX29zYWEiOnsiZGlzYWJsZXMiOlsiU2NvdXQiLCJBV1AiLCJBdXRvIiwiRGVhZ2xlICYgUjgiLCJ+Il0sInNlbGVjdCI6WyJXYWxraW5nIiwiQ3JvdWNoaW5nIiwiU25lYWtpbmciLCJ+Il19LCJ+ZGVmZW5zaXZlX2ZsaWNrIjp7ImZsaWNrX2xlZnQiOi05NC4wLCJmbGlja19saW1pdCI6LTkwLjAsImZsaWNrX3JpZ2h0Ijo0OC4wLCJmbGlja190eXBlIjoiU3dhcCIsInBpdGNoIjoiQ3VzdG9tIiwicGl0Y2hfdmFsdWUiOjAuMCwidGlja3MiOjEuMH0sIn5zYWZlX2hlYWQiOnsiZGlzYWJsZV9kZWZlbnNpdmVfb25fc2FmZSI6ZmFsc2UsImVfc3BhbV9vbl9zYWZlIjp0cnVlLCJzZWxlY3QiOlsxLjAsMy4wLCJ+Il19fSwib3RoZXIiOnsiY2xhbnRhZyI6dHJ1ZSwiZmFrZV9sYXRlbmN5IjpmYWxzZSwibW92ZW1lbnRfbWFuaXB1bGF0aW9ucyI6eyJoZWxwZXJzIjpbMS4wLDIuMCwzLjAsIn4iXX0sIm5hZGVfbWFuaXB1bGF0aW9ucyI6eyJhdXRvX2dyYW5hZGVfcmVsZWFzZV9kYW1hZ2UiOjEwLjAsIm1hbmlwdWxhdGlvbnMiOlsxLjAsMi4wLDMuMCwifiJdfSwicmFnZWJvdF9sb2dnaW5nIjp0cnVlLCJ0cmFzaHRhbGsiOnRydWUsIn5mYWtlX2xhdGVuY3kiOnsidmFsdWVfc2xpZGVyIjoxMDAuMH0sIn5yYWdlYm90X2xvZ2dpbmciOnsiYnV5X2xvZ3MiOmZhbHNlLCJsb2dzX2NvbG9yX2JyYW5kIjoiI0ZBQzg4Q0ZGIiwibG9nc19jb2xvcl9oaXQiOiIjNzhGRkFBRkYiLCJsb2dzX2NvbG9yX21pc3MiOiIjRkY3ODc4RkYiLCJsb2dzX3R5cGUiOiJNb25vY2hyb21lIiwidW5kZXJfY3Jvc3NoYWlyX2xvZ3MiOnRydWUsInVuZGVyX2Nyb3NzaGFpcl9sb2dzX2NvbG9yX2hpdCI6IiM3OEZGQUFGRiIsInVuZGVyX2Nyb3NzaGFpcl9sb2dzX2NvbG9yX21pc3MiOiIjRkY3ODc4RkYifSwifnRyYXNodGFsayI6eyJtb2RlIjoxLjAsInR0X29uIjpbMS4wLDIuMCwifiJdfX0sInJhZ2Vib3QiOnsib3ZlcnJpZGVGRCI6eyJoaXRjaGFuY2VfZmRfYXdwIjo2NS4wLCJoaXRjaGFuY2VfZmRfcjgiOjUwLjAsImhpdGNoYW5jZV9mZF9zY2FyIjo1MC4wLCJoaXRjaGFuY2VfZmRfc2NvdXQiOjYwLjAsImhpdGNoYW5jZV9mZF93ZWFwb24iOlsifiJdfSwib3ZlcnJpZGVJbkFpciI6eyJoaXRjaGFuY2VfaW5haXJfcjgiOjUwLjAsImhpdGNoYW5jZV9pbmFpcl9zY291dCI6NTAuMCwiaGl0Y2hhbmNlX2luYWlyX3dlYXBvbiI6WyJTY291dCIsIlI4IiwifiJdfSwib3ZlcnJpZGVOb3Njb3BlIjp7ImhpdGNoYW5jZV9ub3Njb3BlX2F3cCI6NzUuMCwiaGl0Y2hhbmNlX25vc2NvcGVfc2NhciI6NDAuMCwiaGl0Y2hhbmNlX25vc2NvcGVfc2NvdXQiOjYwLjAsImhpdGNoYW5jZV9ub3Njb3BlX3dlYXBvbiI6WyJBdXRvIiwifiJdfSwicHJlZGljdGlvbl9zeXN0ZW0iOnsiY29uZGl0aW9ucyI6WyJ+Il0sIm1vZGUiOjEuMCwic3dpdGNoIjpmYWxzZSwid2VhcG9ucyI6WyJ+Il19LCJyYWdlYm90X2ltcHJvdmVtZW50cyI6eyJkZWZlbnNpdmVfaW1wcm92ZW1lbnRzIjpmYWxzZSwibGFzdF90aWNrX2JhY2t0cmFjayI6ZmFsc2V9fSwic2VsZWN0X3RhYiI6eyJzZWxlY3RfbWFpbl90YWIiOjIuMCwic2VsZWN0X3V0aWxzX3RhYiI6MS4wfSwidmlzdWFscyI6eyJhbmltX2JyZWFrZXIiOnRydWUsImFzcGVjdF9yYXRpbyI6dHJ1ZSwiY3Jvc3NoYWlyX2luZHMiOnRydWUsImN1c3RvbV9zY29wZSI6dHJ1ZSwiZGFtYWdlX2luZCI6dHJ1ZSwiZ3JlbmFkZV9yYWRpdXMiOnRydWUsImdzX2luZHMiOnRydWUsIm1hbnVhbF9hcnJvd3MiOnRydWUsIm1vZGVybl9oaXRtYXJrZXIiOnRydWUsInZpZXdtb2RlbCI6dHJ1ZSwid2F0ZXJtYXJrIjp7ImcxX2NvbG9yIjoiI0ZGRkZGRkZGIiwiZzJfY29sb3IiOiIjQzhDOEM4RkYiLCJtb2RlIjoyLjAsInBvcyI6Mi4wfSwid2luZG93cyI6eyJkZWZlbnNpdmVfd2FybmluZyI6dHJ1ZSwiZGVmZW5zaXZlX3dhcm5pbmdfY29sb3IiOiIjRkFDODhDRkYiLCJpbl9haXIiOmZhbHNlLCJ2ZWxvY2l0eV93YXJuaW5nIjp0cnVlLCJ2ZWxvY2l0eV93YXJuaW5nX2NvbG9yIjoiI0ZBQzg4Q0ZGIn0sIn5hbmltX2JyZWFrZXIiOnsiaW5fYWlyIjoiU3RhdGljIiwiaml0dGVyX3NwZWVkIjozNS4wLCJvbl9ncm91bmQiOiJTdGF0aWMiLCJvdGhlciI6WzEuMCwyLjAsIn4iXX0sIn5hc3BlY3RfcmF0aW8iOnsib2Zmc2V0IjoxMDAuMH0sIn5jcm9zc2hhaXJfaW5kcyI6eyJhZGRpdGlvbnMiOlsiR2xvdyIsIkFudGktQWltcyBTdGF0ZXMiLCJLZXliaW5kcyIsIn4iXSwiZzFfY29sb3IiOiIjRkFDODhDRkYiLCJnMl9jb2xvciI6IiMzNzM3MzdGRiIsImluZHNfdHlwZSI6MS4wLCJvZmZzZXQiOjMyLjAsInNfY29sb3IiOiIjRkFDODhDRkYiLCJzdHlsZSI6Mi4wfSwifmN1c3RvbV9zY29wZSI6eyJhY2NlbnRfY29sb3IiOiIjRkZGRkZGRkYiLCJnYXAiOjIwLjAsImxlbmdodCI6MTIwLjAsInNlbGVjdCI6WzEuMCwzLjAsIn4iXX0sIn5kYW1hZ2VfaW5kIjp7ImFjY2VudF9jb2xvciI6IiNGRkZGRkZGRiIsInBpeGVsIjp0cnVlfSwifmdyZW5hZGVfcmFkaXVzIjp7Im1vbG90b3ZfY29sb3IiOiIjRkY4MjgyRkYiLCJzZWxlY3QiOlsxLjAsMi4wLCJ+Il0sInNtb2tlX2NvbG9yIjoiIzgyRENGRkZGIn0sIn5nc19pbmRzIjp7InNlbGVjdCI6WyJ+Il0sInNwZWNfbGlzdCI6dHJ1ZX0sIn5tYW51YWxfYXJyb3dzIjp7ImNvbG9yMSI6IiNGQUM4OENGRiIsImNvbG9yMiI6IiNGRkZGRkZGRiIsInNlbGVjdCI6MS4wLCJ2ZWxvY2l0eV9tb2RlIjpmYWxzZX0sIn5tb2Rlcm5faGl0bWFya2VyIjp7ImhpdG1hcmtlcl9jb2xvciI6IiNGQUM4OENGRiIsImhpdG1hcmtlcl90eXBlIjoxLjB9LCJ+dmlld21vZGVsIjp7ImZvdiI6NjguMCwib3Bwb3NpdGVfa25pZmUiOnRydWUsIm9wcG9zaXRlX3dlYXBvbiI6ZmFsc2UsIngiOjMuMCwieSI6MC4wLCJ6IjotMi4wfX19XQ==")));
    else
        v3.pui.load(json.parse(v3.base64.decode(v32.cfg[cfg_list:get()])));
    end;
end;
save_cfg = function()
    -- upvalues: v32 (ref), v3 (ref)
    cvar.play:call("ambient\\tones\\elev1");
    v32.cfg[cfg_list:get()] = v3.base64.encode(json.stringify(v3.pui.save()));
    files.write("nl/polygone/configs.poly", json.stringify(v32));
end;
create_cfg = function()
    -- upvalues: v3 (ref), v104 (ref), v32 (ref)
    cvar.play:call("ambient\\tones\\elev1");
    local _ = common.get_date("%m.%d.%Y %H:%M");
    local v111 = v3.base64.encode(json.stringify(v3.pui.save()));
    local _ = username;
    local v113 = cfg_name:get();
    if v113 ~= "" and not v104(v32.n, v113) then
        table.insert(v32.n, v113);
        table.insert(v32.cfg, v111);
        files.write("nl/polygone/configs.poly", json.stringify(v32));
    end;
    cfg_list:update(v32.n);
end;
remove_cfg = function()
    -- upvalues: v32 (ref)
    cvar.play:call("ambient\\tones\\floor1");
    if cfg_list:get() ~= 1 then
        table.remove(v32.n, cfg_list:get());
        table.remove(v32.cfg, cfg_list:get());
        files.write("nl/polygone/configs.poly", json.stringify(v32));
        cfg_list:update(v32.n);
    end;
end;
local _ = v36.sendTab:button("                          Send to ct side                              ", function()
    -- upvalues: v1 (ref), v2 (ref), l_x_0 (ref)
    for v114 = 1, #v1 do
        for _ = 1, #v2 do
            l_x_0[v114][2].enable:set(l_x_0[v114][1].enable:get());
            l_x_0[v114][2].yaw:set(l_x_0[v114][1].yaw:get());
            l_x_0[v114][2].s_yaw:set(l_x_0[v114][1].s_yaw:get());
            l_x_0[v114][2].l_yaw:set(l_x_0[v114][1].l_yaw:get());
            l_x_0[v114][2].r_yaw:set(l_x_0[v114][1].r_yaw:get());
            l_x_0[v114][2].randomization:set(l_x_0[v114][1].randomization:get());
            l_x_0[v114][2].delayed_ticks:set(l_x_0[v114][1].delayed_ticks:get());
            l_x_0[v114][2].delayed_random:set(l_x_0[v114][1].delayed_random:get());
            l_x_0[v114][2].yaw_modifier:set(l_x_0[v114][1].yaw_modifier:get());
            l_x_0[v114][2].yaw_modifier_offset:set(l_x_0[v114][1].yaw_modifier_offset:get());
            l_x_0[v114][2].l_jitter:set(l_x_0[v114][1].l_jitter:get());
            l_x_0[v114][2].r_jitter:set(l_x_0[v114][1].r_jitter:get());
            l_x_0[v114][2].center_ticks:set(l_x_0[v114][1].center_ticks:get());
            l_x_0[v114][2].center_delay_randomization:set(l_x_0[v114][1].center_delay_randomization:get());
            l_x_0[v114][2].body_yaw:set(l_x_0[v114][1].body_yaw:get());
            l_x_0[v114][2].jitter:set(l_x_0[v114][1].jitter:get());
            l_x_0[v114][2].l_limit:set(l_x_0[v114][1].l_limit:get());
            l_x_0[v114][2].r_limit:set(l_x_0[v114][1].r_limit:get());
            l_x_0[v114][2].l_body_yaw_randomization:set(l_x_0[v114][1].l_body_yaw_randomization:get());
            l_x_0[v114][2].r_body_yaw_randomization:set(l_x_0[v114][1].r_body_yaw_randomization:get());
            l_x_0[v114][2].force_def:set(l_x_0[v114][1].force_def:get());
            l_x_0[v114][2].def_tickbase:set(l_x_0[v114][1].def_tickbase:get());
            l_x_0[v114][2].def_type:set(l_x_0[v114][1].def_type:get());
            l_x_0[v114][2].def_mode:set(l_x_0[v114][1].def_mode:get());
            l_x_0[v114][2].def_sinus_yaw:set(l_x_0[v114][1].def_sinus_yaw:get());
            l_x_0[v114][2].def_sinus_speed:set(l_x_0[v114][1].def_sinus_speed:get());
            l_x_0[v114][2].def_sinus_amp:set(l_x_0[v114][1].def_sinus_amp:get());
            l_x_0[v114][2].def_pitch:set(l_x_0[v114][1].def_pitch:get());
            l_x_0[v114][2].random1_pitch:set(l_x_0[v114][1].random1_pitch:get());
            l_x_0[v114][2].random2_pitch:set(l_x_0[v114][1].random2_pitch:get());
            l_x_0[v114][2].pitch_distortion_speed:set(l_x_0[v114][1].pitch_distortion_speed:get());
            l_x_0[v114][2].distortion_pitch:set(l_x_0[v114][1].distortion_pitch:get());
            l_x_0[v114][2].spin_pitch:set(l_x_0[v114][1].spin_pitch:get());
            l_x_0[v114][2].pitch_spin_speed:set(l_x_0[v114][1].pitch_spin_speed:get());
            l_x_0[v114][2].jitter1_pitch:set(l_x_0[v114][1].jitter1_pitch:get());
            l_x_0[v114][2].jitter2_pitch:set(l_x_0[v114][1].jitter2_pitch:get());
            l_x_0[v114][2].def_pitch_delayed_ticks:set(l_x_0[v114][1].def_pitch_delayed_ticks:get());
            l_x_0[v114][2].custom_pitch:set(l_x_0[v114][1].custom_pitch:get());
            l_x_0[v114][2].def_yaw:set(l_x_0[v114][1].def_yaw:get());
            l_x_0[v114][2].random1_yaw:set(l_x_0[v114][1].random1_yaw:get());
            l_x_0[v114][2].random2_yaw:set(l_x_0[v114][1].random2_yaw:get());
            l_x_0[v114][2].spin_yaw:set(l_x_0[v114][1].spin_yaw:get());
            l_x_0[v114][2].yaw_spin_speed:set(l_x_0[v114][1].yaw_spin_speed:get());
            l_x_0[v114][2].distortion_yaw:set(l_x_0[v114][1].distortion_yaw:get());
            l_x_0[v114][2].yaw_distortion_speed:set(l_x_0[v114][1].yaw_distortion_speed:get());
            l_x_0[v114][2].yaw_distortion_invert:set(l_x_0[v114][1].yaw_distortion_invert:get());
            l_x_0[v114][2].x_way1:set(l_x_0[v114][1].x_way1:get());
            l_x_0[v114][2].x_way2:set(l_x_0[v114][1].x_way2:get());
            l_x_0[v114][2].x_way3:set(l_x_0[v114][1].x_way3:get());
            l_x_0[v114][2].jitter1_yaw:set(l_x_0[v114][1].jitter1_yaw:get());
            l_x_0[v114][2].jitter2_yaw:set(l_x_0[v114][1].jitter2_yaw:get());
            l_x_0[v114][2].def_yaw_delayed_ticks:set(l_x_0[v114][1].def_yaw_delayed_ticks:get());
            l_x_0[v114][2].custom_yaw:set(l_x_0[v114][1].custom_yaw:get());
            cvar.play:call("ambient\\tones\\floor1");
        end;
    end;
end):depend({
    [1] = nil, 
    [2] = "Terrorist", 
    [1] = v72.antiaims.current_team
}, {
    [1] = nil, 
    [2] = 2, 
    [3] = 3, 
    [1] = v72.antiaims.current_tab
});
local _ = v36.sendTab:button("                             Send to t side                              ", function()
    -- upvalues: v1 (ref), v2 (ref), l_x_0 (ref)
    for v117 = 1, #v1 do
        for _ = 1, #v2 do
            l_x_0[v117][1].enable:set(l_x_0[v117][2].enable:get());
            l_x_0[v117][1].yaw:set(l_x_0[v117][2].yaw:get());
            l_x_0[v117][1].s_yaw:set(l_x_0[v117][2].s_yaw:get());
            l_x_0[v117][1].l_yaw:set(l_x_0[v117][2].l_yaw:get());
            l_x_0[v117][1].r_yaw:set(l_x_0[v117][2].r_yaw:get());
            l_x_0[v117][1].randomization:set(l_x_0[v117][2].randomization:get());
            l_x_0[v117][1].delayed_ticks:set(l_x_0[v117][2].delayed_ticks:get());
            l_x_0[v117][1].delayed_random:set(l_x_0[v117][2].delayed_random:get());
            l_x_0[v117][1].yaw_modifier:set(l_x_0[v117][2].yaw_modifier:get());
            l_x_0[v117][1].yaw_modifier_offset:set(l_x_0[v117][2].yaw_modifier_offset:get());
            l_x_0[v117][1].l_jitter:set(l_x_0[v117][2].l_jitter:get());
            l_x_0[v117][1].r_jitter:set(l_x_0[v117][2].r_jitter:get());
            l_x_0[v117][1].center_ticks:set(l_x_0[v117][2].center_ticks:get());
            l_x_0[v117][1].center_delay_randomization:set(l_x_0[v117][2].center_delay_randomization:get());
            l_x_0[v117][1].body_yaw:set(l_x_0[v117][2].body_yaw:get());
            l_x_0[v117][1].jitter:set(l_x_0[v117][2].jitter:get());
            l_x_0[v117][1].l_limit:set(l_x_0[v117][2].l_limit:get());
            l_x_0[v117][1].r_limit:set(l_x_0[v117][2].r_limit:get());
            l_x_0[v117][1].l_body_yaw_randomization:set(l_x_0[v117][2].l_body_yaw_randomization:get());
            l_x_0[v117][1].r_body_yaw_randomization:set(l_x_0[v117][2].r_body_yaw_randomization:get());
            l_x_0[v117][1].force_def:set(l_x_0[v117][2].force_def:get());
            l_x_0[v117][1].def_tickbase:set(l_x_0[v117][2].def_tickbase:get());
            l_x_0[v117][1].def_type:set(l_x_0[v117][2].def_type:get());
            l_x_0[v117][1].def_mode:set(l_x_0[v117][2].def_mode:get());
            l_x_0[v117][1].def_sinus_yaw:set(l_x_0[v117][2].def_sinus_yaw:get());
            l_x_0[v117][1].def_sinus_speed:set(l_x_0[v117][2].def_sinus_speed:get());
            l_x_0[v117][1].def_sinus_amp:set(l_x_0[v117][2].def_sinus_amp:get());
            l_x_0[v117][1].def_pitch:set(l_x_0[v117][2].def_pitch:get());
            l_x_0[v117][1].random1_pitch:set(l_x_0[v117][2].random1_pitch:get());
            l_x_0[v117][1].random2_pitch:set(l_x_0[v117][2].random2_pitch:get());
            l_x_0[v117][1].pitch_distortion_speed:set(l_x_0[v117][2].pitch_distortion_speed:get());
            l_x_0[v117][1].distortion_pitch:set(l_x_0[v117][2].distortion_pitch:get());
            l_x_0[v117][1].spin_pitch:set(l_x_0[v117][2].spin_pitch:get());
            l_x_0[v117][1].pitch_spin_speed:set(l_x_0[v117][2].pitch_spin_speed:get());
            l_x_0[v117][1].jitter1_pitch:set(l_x_0[v117][2].jitter1_pitch:get());
            l_x_0[v117][1].jitter2_pitch:set(l_x_0[v117][2].jitter2_pitch:get());
            l_x_0[v117][1].def_pitch_delayed_ticks:set(l_x_0[v117][2].def_pitch_delayed_ticks:get());
            l_x_0[v117][1].custom_pitch:set(l_x_0[v117][2].custom_pitch:get());
            l_x_0[v117][1].def_yaw:set(l_x_0[v117][2].def_yaw:get());
            l_x_0[v117][1].random1_yaw:set(l_x_0[v117][2].random1_yaw:get());
            l_x_0[v117][1].random2_yaw:set(l_x_0[v117][2].random2_yaw:get());
            l_x_0[v117][1].spin_yaw:set(l_x_0[v117][2].spin_yaw:get());
            l_x_0[v117][1].yaw_spin_speed:set(l_x_0[v117][2].yaw_spin_speed:get());
            l_x_0[v117][1].distortion_yaw:set(l_x_0[v117][2].distortion_yaw:get());
            l_x_0[v117][1].yaw_distortion_speed:set(l_x_0[v117][2].yaw_distortion_speed:get());
            l_x_0[v117][1].yaw_distortion_invert:set(l_x_0[v117][2].yaw_distortion_invert:get());
            l_x_0[v117][1].x_way1:set(l_x_0[v117][2].x_way1:get());
            l_x_0[v117][1].x_way2:set(l_x_0[v117][2].x_way2:get());
            l_x_0[v117][1].x_way3:set(l_x_0[v117][2].x_way3:get());
            l_x_0[v117][1].jitter1_yaw:set(l_x_0[v117][2].jitter1_yaw:get());
            l_x_0[v117][1].jitter2_yaw:set(l_x_0[v117][2].jitter2_yaw:get());
            l_x_0[v117][1].def_yaw_delayed_ticks:set(l_x_0[v117][2].def_yaw_delayed_ticks:get());
            l_x_0[v117][1].custom_yaw:set(l_x_0[v117][2].custom_yaw:get());
            cvar.play:call("ambient\\tones\\floor1");
        end;
    end;
end):depend({
    [1] = nil, 
    [2] = "Counter-Terrorist", 
    [1] = v72.antiaims.current_team
}, {
    [1] = nil, 
    [2] = 2, 
    [3] = 3, 
    [1] = v72.antiaims.current_tab
});
id = 1;
tm = 1;
local v120 = 1;
end_time = 0;
ground_ticks = v120;
delayed = false;
delayed_center = false;
delayed_flick = false;
swop = false;
randomization = function(v121, v122)
    local v123 = v121 - v121 * v122 / 100;
    local v124 = v121 + v121 * v122 / 100;
    return utils.random_int(v123, v124);
end;
CompensateMovingJitter = function(v125)
    return v125;
end;
Oscillate = function(v126)
    return 180 * (math.sin(v126) + math.cos(v126 * 1.3) * 0.5 + math.sin(v126 * 2.5) * 0.3);
end;
NormalizeAngle = function(v127)
    return (v127 + 180) % 360 - 180;
end;
v120 = function(v128)
    return (v128 + 89) % 178 - 89;
end;
LinearInterpolation = function(v129, v130, v131)
    local v132 = math.random(80, 120) / 100;
    return v129 + (v130 - v129) * v131 * v132;
end;
VladickJitter = function(v133, v134, v135)
    local v136 = entity.get_local_player();
    if v136 == nil then
        return;
    else
        switch = v136.m_flPoseParameter[11] * 120 - 60 > 0;
        local v137 = math.random(0.1, 0.5);
        return switch and (v133 + v134 * v137) / (v135 / 10) or (v134 + v133 * v137) / (v135 / 10);
    end;
end;
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
player_state = function(_)
    -- upvalues: v4 (ref)
    in_air();
    on_ground = bit.band(entity.get_local_player().m_fFlags, bit.lshift(1, 0)) ~= 0;
    jump = end_time > globals.curtime + 0.9;
    slowwalk_key = v4.misc_antiaims.slow_walk:get();
    crouch = bit.band(entity.get_local_player().m_fFlags, bit.lshift(1, 1)) ~= 0 or v4.misc_antiaims.fake_duck:get();
    local l_x_1 = entity.get_local_player().m_vecVelocity.x;
    local l_y_0 = entity.get_local_player().m_vecVelocity.y;
    vz = entity.get_local_player().m_vecVelocity.z;
    vy = l_y_0;
    vx = l_x_1;
    math_velocity = math.sqrt(vx ^ 2 + vy ^ 2);
    move = math_velocity > 5;
    if on_ground and not move and not crouch then
        return "Standing";
    elseif not jump and not crouch and not slowwalk_key then
        return "Moving";
    elseif slowwalk_key and on_ground then
        return "Walking";
    elseif crouch and not move and not jump and on_ground then
        return "Crouching";
    elseif crouch and move and not jump and on_ground then
        return "Sneaking";
    elseif jump and not crouch then
        return "Aerobic";
    elseif crouch and (jump or not on_ground) then
        return "Aerobic+";
    else
        return;
    end;
end;
local v141 = false;
events.round_end:set(function()
    -- upvalues: v141 (ref)
    v141 = true;
end);
events.round_start:set(function()
    -- upvalues: v141 (ref)
    v141 = false;
end);
get_ping = function()
    local v142 = utils.net_channel();
    if v142 == nil then
        return 0;
    else
        return math.floor(v142.latency[1] * 1000);
    end;
end;
local v143 = 0;
local v144 = 0;
is_defensive_active = function(_)
    -- upvalues: v143 (ref), v144 (ref)
    local l_tickcount_0 = globals.tickcount;
    sim_time = to_ticks(entity.get_local_player().m_flSimulationTime);
    sim_diff = sim_time - v143;
    if sim_diff < 0 then
        v144 = l_tickcount_0 + math.abs(sim_diff);
    end;
    v143 = sim_time;
    return l_tickcount_0 < v144;
end;
player_team = function(_)
    if entity.get_local_player().m_iTeamNum == 2 then
        return "Terrorist";
    elseif entity.get_local_player().m_iTeamNum == 3 then
        return "Counter-Terrorist";
    else
        return;
    end;
end;
local v148 = 0;
local function v157(v149, v150, v151)
    -- upvalues: v148 (ref)
    v148 = v148 + v150;
    local l_v148_0 = v148;
    local v153 = v151 * 0.5;
    local v154 = math.sin(l_v148_0);
    local v155 = math.cos(l_v148_0 * 1.3);
    local v156 = v151 * v154 + v153 * v155;
    return NormalizeAngle(v149 + v156);
end;
local function v165(v158, v159)
    -- upvalues: v148 (ref)
    v148 = v148 + v158;
    local l_v148_1 = v148;
    local v161 = v159 / 3;
    local v162 = math.sin(l_v148_1 * 0.8);
    local v163 = math.cos(l_v148_1 * 1.7);
    local v164 = v159 * v162 + v161 * v163;
    if v164 > 89 then
        return 89;
    elseif v164 < -89 then
        return -89;
    else
        return v164;
    end;
end;
local function v178(v166)
    -- upvalues: l_x_0 (ref), v4 (ref), v72 (ref), v157 (ref), v165 (ref), v141 (ref)
    local v167 = entity.get_local_player();
    if v167 == nil then
        return;
    else
        switch = v167.m_flPoseParameter[11] * 120 - 60 > 0;
        ideal_yaw = 0;
        if l_x_0[2][1].enable:get() and player_state(v166) == "Standing" and player_team(v166) == "Terrorist" and rage.exploit:get() > 0 then
            id = 2;
            tm = 1;
        elseif l_x_0[3][1].enable:get() and player_state(v166) == "Moving" and player_team(v166) == "Terrorist" and rage.exploit:get() > 0 then
            id = 3;
            tm = 1;
        elseif l_x_0[4][1].enable:get() and player_state(v166) == "Walking" and player_team(v166) == "Terrorist" and rage.exploit:get() > 0 then
            id = 4;
            tm = 1;
        elseif l_x_0[5][1].enable:get() and player_state(v166) == "Crouching" and player_team(v166) == "Terrorist" and rage.exploit:get() > 0 then
            id = 5;
            tm = 1;
        elseif l_x_0[6][1].enable:get() and player_state(v166) == "Sneaking" and player_team(v166) == "Terrorist" and rage.exploit:get() > 0 then
            id = 6;
            tm = 1;
        elseif l_x_0[7][1].enable:get() and player_state(v166) == "Aerobic" and player_team(v166) == "Terrorist" and rage.exploit:get() > 0 then
            id = 7;
            tm = 1;
        elseif l_x_0[8][1].enable:get() and player_state(v166) == "Aerobic+" and player_team(v166) == "Terrorist" and rage.exploit:get() > 0 then
            id = 8;
            tm = 1;
        elseif l_x_0[9][1].enable:get() and player_team(v166) == "Terrorist" and rage.exploit:get() <= 0 then
            id = 9;
            tm = 1;
        elseif l_x_0[2][2].enable:get() and player_state(v166) == "Standing" and player_team(v166) == "Counter-Terrorist" and rage.exploit:get() > 0 then
            id = 2;
            tm = 2;
        elseif l_x_0[3][2].enable:get() and player_state(v166) == "Moving" and player_team(v166) == "Counter-Terrorist" and rage.exploit:get() > 0 then
            id = 3;
            tm = 2;
        elseif l_x_0[4][2].enable:get() and player_state(v166) == "Walking" and player_team(v166) == "Counter-Terrorist" and rage.exploit:get() > 0 then
            id = 4;
            tm = 2;
        elseif l_x_0[5][2].enable:get() and player_state(v166) == "Crouching" and player_team(v166) == "Counter-Terrorist" and rage.exploit:get() > 0 then
            id = 5;
            tm = 2;
        elseif l_x_0[6][2].enable:get() and player_state(v166) == "Sneaking" and player_team(v166) == "Counter-Terrorist" and rage.exploit:get() > 0 then
            id = 6;
            tm = 2;
        elseif l_x_0[7][2].enable:get() and player_state(v166) == "Aerobic" and player_team(v166) == "Counter-Terrorist" and rage.exploit:get() > 0 then
            id = 7;
            tm = 2;
        elseif l_x_0[8][2].enable:get() and player_state(v166) == "Aerobic+" and player_team(v166) == "Counter-Terrorist" and rage.exploit:get() > 0 then
            id = 8;
            tm = 2;
        elseif l_x_0[9][2].enable:get() and player_team(v166) == "Counter-Terrorist" and rage.exploit:get() <= 0 then
            id = 9;
            tm = 2;
        else
            id = 1;
            if player_team(v166) == "Terrorist" then
                tm = 1;
            elseif player_team(v166) == "Counter-Terrorist" then
                tm = 2;
            end;
        end;
        if not l_x_0[id][tm].delayed_random:get() then
            if globals.tickcount % (l_x_0[id][tm].delayed_ticks:get() * 2) == 0 then
                delayed = not delayed;
            end;
        elseif globals.tickcount % (utils.random_int(1, l_x_0[id][tm].delayed_ticks:get()) * 2) == 0 then
            delayed = not delayed;
        end;
        v4.antiaims.enable:override(l_x_0[id][tm].enable:get());
        v4.antiaims.pitch:override("Down");
        v4.antiaims.yaw:override("Backward");
        if l_x_0[id][tm].yaw:get() == "Default" then
            v4.antiaims.yaw_offset:override(randomization(l_x_0[id][tm].s_yaw:get(), l_x_0[id][tm].randomization:get()));
        elseif l_x_0[id][tm].yaw:get() == "Switch" then
            if l_x_0[id][tm].delayed_ticks:get() > 1 then
                rage.antiaim:inverter(delayed);
            end;
            v4.antiaims.yaw_offset:override(switch and randomization(l_x_0[id][tm].l_yaw:get(), l_x_0[id][tm].randomization:get()) or randomization(l_x_0[id][tm].r_yaw:get(), l_x_0[id][tm].randomization:get()));
        elseif l_x_0[id][tm].yaw:get() == "Vladick" then
            v4.antiaims.yaw_offset:override(switch and randomization(-l_x_0[id][tm].s_yaw:get() / 2, l_x_0[id][tm].randomization:get()) or randomization(l_x_0[id][tm].s_yaw:get() / 2, l_x_0[id][tm].randomization:get()));
        else
            v4.antiaims.yaw_offset:override(0);
        end;
        if l_x_0[id][tm].yaw:get() == "Vladick" then
            v4.antiaims.yaw_modifier:override(switch and "Random" or "3-Way");
            v4.antiaims.modifier_offset:override(randomization(-l_x_0[id][tm].s_yaw:get() / 2, l_x_0[id][tm].randomization:get()));
        elseif l_x_0[id][tm].yaw_modifier:get() == "Switch" then
            v4.antiaims.yaw_modifier:override("Center");
            if l_x_0[id][tm].center_ticks:get() > 1 then
                if not l_x_0[id][tm].center_delay_randomization:get() then
                    if globals.tickcount % (l_x_0[id][tm].center_ticks:get() * 2) == 0 then
                        delayed_center = not delayed_center;
                    end;
                elseif globals.tickcount % utils.random_int(1, l_x_0[id][tm].center_ticks:get() * 2) == 0 then
                    delayed_center = not delayed_center;
                end;
                if globals.tickcount % utils.random_int(1, l_x_0[id][tm].center_ticks:get() * 2) == 0 then
                    delayed_center = not delayed_center;
                end;
                v4.antiaims.modifier_offset:override(switch and randomization(l_x_0[id][tm].l_jitter:get(), l_x_0[id][tm].yaw_modifer_randomization:get()) or randomization(l_x_0[id][tm].r_jitter:get(), l_x_0[id][tm].yaw_modifer_randomization:get()));
                rage.antiaim:inverter(delayed_center);
            else
                v4.antiaims.modifier_offset:override(switch and randomization(l_x_0[id][tm].l_jitter:get(), l_x_0[id][tm].yaw_modifer_randomization:get()) or randomization(l_x_0[id][tm].r_jitter:get(), l_x_0[id][tm].yaw_modifer_randomization:get()));
            end;
        else
            v4.antiaims.yaw_modifier:override(l_x_0[id][tm].yaw_modifier:get());
            v4.antiaims.modifier_offset:override(randomization(l_x_0[id][tm].yaw_modifier_offset:get(), l_x_0[id][tm].yaw_modifer_randomization:get()));
        end;
        if not v72.antiaims.defensive_flick:get() then
            if l_x_0[id][tm].body_yaw:get() then
                v4.antiaims.body_yaw:override(true);
                if l_x_0[id][tm].jitter:get() then
                    v4.antiaims.options:override("Jitter");
                else
                    v4.antiaims.options:override("");
                end;
                v4.antiaims.left_limit:override(l_x_0[id][tm].l_body_yaw_randomization:get() > 0 and utils.random_int(l_x_0[id][tm].l_limit:get() - l_x_0[id][tm].l_body_yaw_randomization:get() / 100 * l_x_0[id][tm].l_limit:get(), l_x_0[id][tm].l_limit:get()) or l_x_0[id][tm].l_limit:get());
                v4.antiaims.right_limit:override(l_x_0[id][tm].r_body_yaw_randomization:get() > 0 and utils.random_int(l_x_0[id][tm].r_limit:get() - l_x_0[id][tm].r_body_yaw_randomization:get() / 100 * l_x_0[id][tm].r_limit:get(), l_x_0[id][tm].r_limit:get()) or l_x_0[id][tm].r_limit:get());
            else
                v4.antiaims.body_yaw:override(false);
                v4.antiaims.options:override("");
                v4.antiaims.left_limit:override(0);
                v4.antiaims.right_limit:override(0);
            end;
            if l_x_0[id][tm].def_tickbase:get() == "Polygone" then
                if l_x_0[id][tm].force_def:get("Hide Shots") then
                    v4.ragebot.hs_options:override("Break LC");
                    if is_defensive_active(v167) then
                        v4.antiaims.hidden:override(true);
                    else
                        v4.antiaims.hidden:override(false);
                    end;
                else
                    v4.ragebot.hs_options:override("Favor Fire Rate");
                end;
                if l_x_0[id][tm].force_def:get("Double Tap") then
                    v4.ragebot.dt_options:override("Always On");
                    if is_defensive_active(v167) then
                        v4.antiaims.hidden:override(true);
                    else
                        v4.antiaims.hidden:override(false);
                    end;
                else
                    v4.ragebot.dt_options:override("On Peek");
                end;
            else
                if l_x_0[id][tm].force_def:get("Hide Shots") then
                    v4.ragebot.hs_options:override("Break LC");
                    v4.antiaims.hidden:override(true);
                else
                    v4.ragebot.hs_options:override("Favor Fire Rate");
                    v4.antiaims.hidden:override(false);
                end;
                if l_x_0[id][tm].force_def:get("Double Tap") then
                    v4.ragebot.dt_options:override("Always On");
                    v4.antiaims.hidden:override(true);
                else
                    v4.ragebot.dt_options:override("On Peek");
                    v4.antiaims.hidden:override(false);
                end;
            end;
        end;
        if l_x_0[id][tm].def_type:get() == "Builder" then
            local v168 = 0;
            local v169 = 0;
            if not v72.antiaims.defensive_flick:get() then
                if l_x_0[id][tm].def_pitch:get() == "Random" then
                    v168 = utils.random_int(l_x_0[id][tm].random1_pitch:get(), l_x_0[id][tm].random2_pitch:get());
                elseif l_x_0[id][tm].def_pitch:get() == "Down" then
                    v168 = 89;
                elseif l_x_0[id][tm].def_pitch:get() == "Up" then
                    v168 = -89;
                elseif l_x_0[id][tm].def_pitch:get() == "Half Up" then
                    v168 = -45;
                elseif l_x_0[id][tm].def_pitch:get() == "Half Down" then
                    v168 = 45;
                elseif l_x_0[id][tm].def_pitch:get() == "Spin" then
                    v168 = -math.fmod(globals.curtime * (l_x_0[id][tm].pitch_spin_speed:get() / 10 * 360), l_x_0[id][tm].spin_pitch:get() * 2) + l_x_0[id][tm].spin_pitch:get();
                elseif l_x_0[id][tm].def_pitch:get() == "Meta" then
                    v168 = switch and -49 or 49;
                elseif l_x_0[id][tm].def_pitch:get() == "Distortion" then
                    v168 = math.sin(globals.curtime * l_x_0[id][tm].pitch_distortion_speed:get()) * l_x_0[id][tm].distortion_pitch:get();
                elseif l_x_0[id][tm].def_pitch:get() == "Switch" then
                    if l_x_0[id][tm].def_pitch_delayed_ticks:get() > 1 then
                        delay_pitch = globals.tickcount % (8 + l_x_0[id][tm].def_pitch_delayed_ticks:get() / 2) > 4 + l_x_0[id][tm].def_pitch_delayed_ticks:get() / 4;
                        v168 = delay_pitch and l_x_0[id][tm].jitter1_pitch:get() or l_x_0[id][tm].jitter2_pitch:get();
                    else
                        v168 = switch and l_x_0[id][tm].jitter1_pitch:get() or l_x_0[id][tm].jitter2_pitch:get();
                    end;
                elseif l_x_0[id][tm].def_pitch:get() == "Swap" then
                    v168 = v169 > 0 and 58 or -58;
                elseif l_x_0[id][tm].def_pitch:get() == "Custom" then
                    v168 = l_x_0[id][tm].custom_pitch:get();
                elseif l_x_0[id][tm].def_pitch:get() == "Vladick" then
                    v168 = math.map(math.abs(globals.realtime % 0.3 - 0.15), 0, 0.15, -89, 89);
                elseif l_x_0[id][tm].def_pitch:get() == "Disabled" then
                    v168 = 89;
                end;
                rage.antiaim:override_hidden_pitch(v168);
            end;
            if not v72.antiaims.defensive_flick:get() then
                if l_x_0[id][tm].def_yaw:get() == "Random" then
                    v169 = math.random(l_x_0[id][tm].random1_yaw:get(), l_x_0[id][tm].random2_yaw:get());
                elseif l_x_0[id][tm].def_yaw:get() == "Spin" then
                    v169 = -math.fmod(globals.curtime * (l_x_0[id][tm].yaw_spin_speed:get() / 10 * 360), l_x_0[id][tm].spin_yaw:get() * 2) + l_x_0[id][tm].spin_yaw:get();
                elseif l_x_0[id][tm].def_yaw:get() == "Distortion" then
                    local v170 = math.sin(globals.curtime * l_x_0[id][tm].yaw_distortion_speed:get()) * l_x_0[id][tm].distortion_yaw:get();
                    if l_x_0[id][tm].yaw_distortion_invert:get() then
                        v169 = -v170;
                    else
                        v169 = v170;
                    end;
                elseif l_x_0[id][tm].def_yaw:get() == "X-Way" then
                    if globals.server_tick % 3 == 0 then
                        v169 = -l_x_0[id][tm].x_way1:get();
                    elseif globals.server_tick % 3 == 1 then
                        v169 = l_x_0[id][tm].x_way2:get();
                    elseif globals.server_tick % 3 == 2 then
                        v169 = -l_x_0[id][tm].x_way3:get();
                    end;
                elseif l_x_0[id][tm].def_yaw:get() == "Switch" then
                    if l_x_0[id][tm].def_yaw_delayed_ticks:get() > 1 then
                        delay_yaw = globals.tickcount % (8 + l_x_0[id][tm].def_yaw_delayed_ticks:get() / 2) > 4 + l_x_0[id][tm].def_yaw_delayed_ticks:get() / 4;
                        v169 = delay_yaw and -l_x_0[id][tm].jitter1_yaw:get() or -l_x_0[id][tm].jitter2_yaw:get();
                    else
                        v169 = switch and -l_x_0[id][tm].jitter1_yaw:get() or -l_x_0[id][tm].jitter2_yaw:get();
                    end;
                elseif l_x_0[id][tm].def_yaw:get() == "Secret" then
                    local v171 = globals.curtime * math.random(0.5, 2);
                    v169 = NormalizeAngle(LinearInterpolation(l_x_0[id][tm].jitter1_yaw:get(), l_x_0[id][tm].jitter2_yaw:get(), Oscillate(v171)));
                elseif l_x_0[id][tm].def_yaw:get() == "Vladick" then
                    v169 = math.map(math.abs(globals.realtime % 0.3 - 0.15), 0, 0.15, -180, 180);
                elseif l_x_0[id][tm].def_yaw:get() == "Static" then
                    v169 = l_x_0[id][tm].custom_yaw:get();
                else
                    v169 = l_x_0[id][tm].def_yaw:get() == "Disabled" and 0 or v4.antiaims.yaw_offset:get();
                end;
                rage.antiaim:override_hidden_yaw_offset(v169);
                if v72.antiaims.additions:get("Ping Safe") and get_ping() > 100 or v72.antiaims.aa_disablers:get("Disable Defensive AA") then
                    v4.antiaims.hidden:override(false);
                end;
            end;
        elseif not v72.antiaims.defensive_flick:get() then
            if l_x_0[id][tm].def_mode:get() == "Sinus" then
                defensive_yaw = v157(l_x_0[id][tm].def_sinus_yaw:get(), l_x_0[id][tm].def_sinus_speed:get(), l_x_0[id][tm].def_sinus_amp:get());
                defensive_pitch = v165(l_x_0[id][tm].def_sinus_speed:get(), l_x_0[id][tm].def_sinus_amp:get());
            elseif l_x_0[id][tm].def_mode:get() == "Ping Based Sinus" then
                defensive_yaw = v157(-get_ping(), get_ping() / 10, get_ping());
                defensive_pitch = v165(get_ping() / 2.5, get_ping() / 2);
            end;
            rage.antiaim:override_hidden_yaw_offset(defensive_yaw);
            rage.antiaim:override_hidden_pitch(defensive_pitch);
        end;
        if v72.antiaims.aa_disablers:get("Disable Jitter Move") then
            v166.jitter_move = false;
        else
            v166.jitter_move = true;
        end;
        local v172 = v72.antiaims.yaw_base.select_side:get();
        if v172 == "Local View" then
            v4.antiaims.yaw_base:override("Local View");
        elseif v172 == "At Target" then
            v4.antiaims.yaw_base:override("At Target");
        elseif v172 == "Left" then
            v4.antiaims.yaw_base:override("Local View");
            v4.antiaims.yaw_offset:override(v72.antiaims.yaw_base.left_side:get());
        elseif v172 == "Right" then
            v4.antiaims.yaw_base:override("Local View");
            v4.antiaims.yaw_offset:override(v72.antiaims.yaw_base.right_side:get());
        elseif v172 == "Forward" then
            v4.antiaims.yaw_base:override("Local View");
            v4.antiaims.yaw_offset:override(180);
        elseif v172 == "Backward" then
            v4.antiaims.yaw_base:override("Local View");
            v4.antiaims.yaw_offset:override(0);
        end;
        if (v172 == "Left" or v172 == "Right" or v172 == "Forward" or v172 == "Backward") and v72.antiaims.yaw_base.manipulations:get("Static") then
            v4.antiaims.yaw_modifier:override("Disabled");
            v4.antiaims.options:override("");
            v4.antiaims.freestanding:override(false);
            v4.antiaims.hidden:override(false);
        end;
        if (v172 == "Left" or v172 == "Right") and v72.antiaims.yaw_base.manipulations:get("Defensive E-Spam") then
            v4.ragebot.dt_options:override("Always On");
            v4.ragebot.hs_options:override("Break LC");
            if is_defensive_active(v167) then
                v4.antiaims.hidden:override(true);
            else
                v4.antiaims.hidden:override(false);
            end;
            rage.antiaim:override_hidden_pitch(0);
            rage.antiaim:override_hidden_yaw_offset(math.random(-160, -180));
        end;
        v4.antiaims.freestanding:override(v72.antiaims.freestanding.switch:get());
        if v72.antiaims.freestanding.disablers:get("Standing") and player_state(v166) == "Standing" then
            v4.antiaims.freestanding:override(false);
        end;
        if v72.antiaims.freestanding.disablers:get("Moving") and player_state(v166) == "Moving" then
            v4.antiaims.freestanding:override(false);
        end;
        if v72.antiaims.freestanding.disablers:get("Walking") and player_state(v166) == "Walking" then
            v4.antiaims.freestanding:override(false);
        end;
        if v72.antiaims.freestanding.disablers:get("Crouching") and player_state(v166) == "Crouching" then
            v4.antiaims.freestanding:override(false);
        end;
        if v72.antiaims.freestanding.disablers:get("Sneaking") and player_state(v166) == "Sneaking" then
            v4.antiaims.freestanding:override(false);
        end;
        if v72.antiaims.freestanding.disablers:get("Aerobic") and player_state(v166) == "Aerobic" then
            v4.antiaims.freestanding:override(false);
        end;
        if v72.antiaims.freestanding.disablers:get("Aerobic+") and player_state(v166) == "Aerobic+" then
            v4.antiaims.freestanding:override(false);
        end;
        if v72.antiaims.freestanding.manipulations:get("Disable Yaw Modifiers") then
            v4.antiaims.freestanding_modifier:override(true);
        else
            v4.antiaims.freestanding_modifier:override();
        end;
        if v72.antiaims.freestanding.manipulations:get("Body Freestanding") then
            v4.antiaims.freestanding_body:override(true);
        else
            v4.antiaims.freestanding_body:override();
        end;
        if v72.antiaims.safe_head:get() then
            local v173 = v172 == "Left" or not (v172 ~= "Right") or not (v172 ~= "Forward") or v172 == "Backward";
            local v174 = v167:get_player_weapon();
            if v174 == nil then
                return;
            else
                local v175 = v174:get_classname();
                local _ = v167.m_bIsScoped;
                if v175 == nil then
                    return;
                elseif entity.get_threat() ~= nil then
                    if v72.antiaims.safe_head.select:get("On Knife") and string.match(v175, "Knife") and player_state(v166) == "Aerobic+" and not v173 then
                        v4.antiaims.yaw_offset:override(0);
                        v4.antiaims.yaw_modifier:override("Disabled");
                        v4.antiaims.options:override("");
                        v4.antiaims.left_limit:override(0);
                        v4.antiaims.right_limit:override(0);
                        if v72.antiaims.safe_head.disable_defensive_on_safe:get() then
                            v4.antiaims.hidden:override(false);
                        end;
                        if v72.antiaims.safe_head.e_spam_on_safe:get() then
                            if v72.antiaims.additions:get("Ping Safe") and get_ping() > 100 or v72.antiaims.aa_disablers:get("Disable Defensive AA") then
                                return;
                            else
                                v4.antiaims.hidden:override(true);
                                rage.antiaim:override_hidden_yaw_offset(180);
                                rage.antiaim:override_hidden_pitch(0);
                            end;
                        end;
                    end;
                    if v72.antiaims.safe_head.select:get("On Taser") and string.match(v175, "Taser") and player_state(v166) == "Aerobic+" and not v173 then
                        v4.antiaims.yaw_offset:override(0);
                        v4.antiaims.yaw_modifier:override("Disabled");
                        v4.antiaims.options:override("");
                        v4.antiaims.left_limit:override(0);
                        v4.antiaims.right_limit:override(0);
                        if v72.antiaims.safe_head.disable_defensive_on_safe:get() then
                            v4.antiaims.hidden:override(false);
                        end;
                        if v72.antiaims.safe_head.e_spam_on_safe:get() then
                            if v72.antiaims.additions:get("Ping Safe") and get_ping() > 100 or v72.antiaims.aa_disablers:get("Disable Defensive AA") then
                                return;
                            else
                                v4.antiaims.hidden:override(true);
                                rage.antiaim:override_hidden_yaw_offset(180);
                                rage.antiaim:override_hidden_pitch(0);
                            end;
                        end;
                    end;
                    if v72.antiaims.safe_head.select:get("Higher than enemy") and v167:get_origin().z - entity.get_threat():get_origin().z > 55 and not v173 then
                        v4.antiaims.yaw_offset:override(0);
                        v4.antiaims.yaw_modifier:override("Disabled");
                        v4.antiaims.options:override("");
                        v4.antiaims.left_limit:override(0);
                        v4.antiaims.right_limit:override(0);
                        if v72.antiaims.safe_head.disable_defensive_on_safe:get() then
                            v4.antiaims.hidden:override(false);
                        end;
                        if v72.antiaims.safe_head.e_spam_on_safe:get() then
                            if v72.antiaims.additions:get("Ping Safe") and get_ping() > 100 or v72.antiaims.aa_disablers:get("Disable Defensive AA") then
                                return;
                            else
                                v4.antiaims.hidden:override(true);
                                rage.antiaim:override_hidden_yaw_offset(180);
                                rage.antiaim:override_hidden_pitch(0);
                            end;
                        end;
                    end;
                end;
            end;
        end;
        v4.antiaims.avoid_backstab:override(v72.antiaims.additions:get("Anti-Backstab"));
        if v72.antiaims.aa_disablers:get("Disable on Warm Up") and entity.get_game_rules().m_bWarmupPeriod then
            v4.antiaims.enable:override(false);
        end;
        if v72.antiaims.aa_disablers:get("Disable on Round End") and v141 then
            v4.antiaims.enable:override(false);
        end;
        if v72.antiaims.aa_disablers:get("Disable when no enemies") and not entity.get_threat() then
            v4.antiaims.enable:override(false);
        end;
        if v72.antiaims.defensive_flick:get() then
            if rage.exploit:get() < 1 then
                return;
            else
                if globals.tickcount % (v72.antiaims.defensive_flick.ticks:get() * 2) == 0 and is_defensive_active(v167) then
                    delayed_flick = not delayed_flick;
                end;
                v4.antiaims.yaw_modifier:override("");
                v4.antiaims.yaw_offset:override(5);
                rage.antiaim:inverter(delayed_flick);
                v4.antiaims.yaw_modifier:override("Disabled");
                v4.antiaims.body_yaw:override(true);
                v4.antiaims.options:override("");
                v4.antiaims.left_limit:override(48);
                v4.antiaims.right_limit:override(48);
                v166.force_defensive = v166.command_number % 3 == 0;
                v4.ragebot.dt_options:override("Always On");
                v4.ragebot.hs_options:override("Break LC");
                v4.antiaims.hidden:override(true);
                if v72.antiaims.defensive_flick.pitch:get() == "Down" then
                    rage.antiaim:override_hidden_pitch(89);
                elseif v72.antiaims.defensive_flick.pitch:get() == "Up" then
                    rage.antiaim:override_hidden_pitch(-89);
                elseif v72.antiaims.defensive_flick.pitch:get() == "Half Up" then
                    rage.antiaim:override_hidden_pitch(-45);
                elseif v72.antiaims.defensive_flick.pitch:get() == "Half Down" then
                    rage.antiaim:override_hidden_pitch(45);
                elseif v72.antiaims.defensive_flick.pitch:get() == "Random" then
                    rage.antiaim:override_hidden_pitch(utils.random_int(-89, 89));
                elseif v72.antiaims.defensive_flick.pitch:get() == "Custom" then
                    rage.antiaim:override_hidden_pitch(v72.antiaims.defensive_flick.pitch_value:get());
                elseif v72.antiaims.defensive_flick.pitch:get() == "Distortion" then
                    local v177 = math.sin(globals.curtime * 5) * v72.antiaims.defensive_flick.pitch_value:get();
                    rage.antiaim:override_hidden_pitch(v177);
                end;
                if v72.antiaims.defensive_flick.flick_type:get() == "Custom" then
                    rage.antiaim:override_hidden_yaw_offset(v72.antiaims.defensive_flick.flick_limit:get());
                elseif v72.antiaims.defensive_flick.flick_type:get() == "Jitter" then
                    rage.antiaim:override_hidden_yaw_offset(delayed_flick and v72.antiaims.defensive_flick.flick_left:get() or v72.antiaims.defensive_flick.flick_right:get());
                elseif v72.antiaims.defensive_flick.flick_type:get() == "Swap" then
                    if delayed_flick == true then
                        rage.antiaim:override_hidden_yaw_offset(v72.antiaims.defensive_flick.flick_limit:get());
                    else
                        rage.antiaim:override_hidden_yaw_offset(90);
                    end;
                elseif v72.antiaims.defensive_flick.flick_type:get() == "Left" then
                    rage.antiaim:override_hidden_yaw_offset(90);
                elseif v72.antiaims.defensive_flick.flick_type:get() == "Right" then
                    rage.antiaim:override_hidden_yaw_offset(-90);
                end;
            end;
        end;
        return;
    end;
end;
local function v184(v179)
    -- upvalues: v72 (ref)
    local v180 = entity.get_local_player();
    if not v180 then
        return;
    elseif not v180:is_alive() then
        return;
    else
        local v181 = v180:get_player_weapon();
        if v181 == nil then
            return;
        else
            local v182 = v181:get_classname();
            if v182 == nil then
                return;
            else
                local v183 = player_state(v179);
                if v72.ragebot.prediction_system.switch:get() then
                    if v72.ragebot.prediction_system.weapons:get("AWP") and string.match(v182, "AWP") then
                        if v72.ragebot.prediction_system.mode:get(1) then
                            if v72.ragebot.prediction_system.conditions:get("Standing") and v183 == "Standing" then
                                cvar.cl_interp:float(0.028);
                                cvar.cl_interpolate:float(0);
                                cvar.cl_interp_ratio:float(1);
                            elseif v72.ragebot.prediction_system.conditions:get("Walking") and v183 == "Walking" then
                                cvar.cl_interp:float(0.028);
                                cvar.cl_interpolate:float(0);
                                cvar.cl_interp_ratio:float(1);
                            elseif v72.ragebot.prediction_system.conditions:get("Crouching") and v183 == "Crouching" then
                                cvar.cl_interp:float(0.028);
                                cvar.cl_interpolate:float(0);
                                cvar.cl_interp_ratio:float(1);
                            elseif v72.ragebot.prediction_system.conditions:get("Sneaking") and v183 == "Sneaking" then
                                cvar.cl_interp:float(0.028);
                                cvar.cl_interpolate:float(0);
                                cvar.cl_interp_ratio:float(1);
                            elseif v72.ragebot.ragebot_improvements.last_tick_backtrack:get() then
                                cvar.cl_interp_ratio:float(1);
                                cvar.sv_max_allowed_net_graph:float(2);
                                cvar.cl_interpolate:float(0);
                            else
                                cvar.cl_interp:float(0.015625);
                                cvar.cl_interp_ratio:int(2);
                                cvar.cl_interpolate:int(1);
                            end;
                        elseif v72.ragebot.prediction_system.conditions:get("Standing") and v183 == "Standing" then
                            cvar.cl_interp:float(0.031);
                            cvar.cl_interpolate:float(0);
                            cvar.cl_interp_ratio:float(1);
                        elseif v72.ragebot.prediction_system.conditions:get("Walking") and v183 == "Walking" then
                            cvar.cl_interp:float(0.031);
                            cvar.cl_interpolate:float(0);
                            cvar.cl_interp_ratio:float(1);
                        elseif v72.ragebot.prediction_system.conditions:get("Crouching") and v183 == "Crouching" then
                            cvar.cl_interp:float(0.031);
                            cvar.cl_interpolate:float(0);
                            cvar.cl_interp_ratio:float(1);
                        elseif v72.ragebot.prediction_system.conditions:get("Sneaking") and v183 == "Sneaking" then
                            cvar.cl_interp:float(0.031);
                            cvar.cl_interpolate:int(0);
                            cvar.cl_interp_ratio:int(1);
                        elseif v72.ragebot.ragebot_improvements.last_tick_backtrack:get() then
                            cvar.cl_interp_ratio:float(1);
                            cvar.sv_max_allowed_net_graph:float(2);
                            cvar.cl_interpolate:float(0);
                        else
                            cvar.cl_interp:float(0.015625);
                            cvar.cl_interp_ratio:int(2);
                            cvar.cl_interpolate:int(1);
                        end;
                    elseif v72.ragebot.prediction_system.weapons:get("Auto") and string.match(v182, "SCAR20") or string.match(v182, "G3SG1") then
                        if v72.ragebot.prediction_system.mode:get(1) then
                            if v72.ragebot.prediction_system.conditions:get("Standing") and v183 == "Standing" then
                                cvar.cl_interp:float(0.028);
                                cvar.cl_interpolate:float(0);
                                cvar.cl_interp_ratio:float(1);
                            elseif v72.ragebot.prediction_system.conditions:get("Walking") and v183 == "Walking" then
                                cvar.cl_interp:float(0.028);
                                cvar.cl_interpolate:float(0);
                                cvar.cl_interp_ratio:float(1);
                            elseif v72.ragebot.prediction_system.conditions:get("Crouching") and v183 == "Crouching" then
                                cvar.cl_interp:float(0.028);
                                cvar.cl_interpolate:float(0);
                                cvar.cl_interp_ratio:float(1);
                            elseif v72.ragebot.prediction_system.conditions:get("Sneaking") and v183 == "Sneaking" then
                                cvar.cl_interp:float(0.028);
                                cvar.cl_interpolate:float(0);
                                cvar.cl_interp_ratio:float(1);
                            elseif v72.ragebot.ragebot_improvements.last_tick_backtrack:get() then
                                cvar.cl_interp_ratio:float(1);
                                cvar.sv_max_allowed_net_graph:float(2);
                                cvar.cl_interpolate:float(0);
                            else
                                cvar.cl_interp:float(0.015625);
                                cvar.cl_interp_ratio:int(2);
                                cvar.cl_interpolate:int(1);
                            end;
                        elseif v72.ragebot.prediction_system.conditions:get("Standing") and v183 == "Standing" then
                            cvar.cl_interp:float(0.031);
                            cvar.cl_interpolate:float(0);
                            cvar.cl_interp_ratio:float(1);
                        elseif v72.ragebot.prediction_system.conditions:get("Walking") and v183 == "Walking" then
                            cvar.cl_interp:float(0.031);
                            cvar.cl_interpolate:float(0);
                            cvar.cl_interp_ratio:float(1);
                        elseif v72.ragebot.prediction_system.conditions:get("Crouching") and v183 == "Crouching" then
                            cvar.cl_interp:float(0.031);
                            cvar.cl_interpolate:float(0);
                            cvar.cl_interp_ratio:float(1);
                        elseif v72.ragebot.prediction_system.conditions:get("Sneaking") and v183 == "Sneaking" then
                            cvar.cl_interp:float(0.031);
                            cvar.cl_interpolate:int(0);
                            cvar.cl_interp_ratio:int(1);
                        elseif v72.ragebot.ragebot_improvements.last_tick_backtrack:get() then
                            cvar.cl_interp_ratio:float(1);
                            cvar.sv_max_allowed_net_graph:float(2);
                            cvar.cl_interpolate:float(0);
                        else
                            cvar.cl_interp:float(0.015625);
                            cvar.cl_interp_ratio:int(2);
                            cvar.cl_interpolate:int(1);
                        end;
                    elseif v72.ragebot.prediction_system.weapons:get("Scout") and string.match(v182, "SSG08") then
                        if v72.ragebot.prediction_system.mode:get(1) then
                            if v72.ragebot.prediction_system.conditions:get("Standing") and v183 == "Standing" then
                                cvar.cl_interp:float(0.028);
                                cvar.cl_interpolate:float(0);
                                cvar.cl_interp_ratio:float(1);
                            elseif v72.ragebot.prediction_system.conditions:get("Walking") and v183 == "Walking" then
                                cvar.cl_interp:float(0.028);
                                cvar.cl_interpolate:float(0);
                                cvar.cl_interp_ratio:float(1);
                            elseif v72.ragebot.prediction_system.conditions:get("Crouching") and v183 == "Crouching" then
                                cvar.cl_interp:float(0.028);
                                cvar.cl_interpolate:float(0);
                                cvar.cl_interp_ratio:float(1);
                            elseif v72.ragebot.prediction_system.conditions:get("Sneaking") and v183 == "Sneaking" then
                                cvar.cl_interp:float(0.028);
                                cvar.cl_interpolate:float(0);
                                cvar.cl_interp_ratio:float(1);
                            elseif v72.ragebot.ragebot_improvements.last_tick_backtrack:get() then
                                cvar.cl_interp_ratio:float(1);
                                cvar.sv_max_allowed_net_graph:float(2);
                                cvar.cl_interpolate:float(0);
                            else
                                cvar.cl_interp:float(0.015625);
                                cvar.cl_interp_ratio:int(2);
                                cvar.cl_interpolate:int(1);
                            end;
                        elseif v72.ragebot.prediction_system.conditions:get("Standing") and v183 == "Standing" then
                            cvar.cl_interp:float(0.031);
                            cvar.cl_interpolate:float(0);
                            cvar.cl_interp_ratio:float(1);
                        elseif v72.ragebot.prediction_system.conditions:get("Walking") and v183 == "Walking" then
                            cvar.cl_interp:float(0.031);
                            cvar.cl_interpolate:float(0);
                            cvar.cl_interp_ratio:float(1);
                        elseif v72.ragebot.prediction_system.conditions:get("Crouching") and v183 == "Crouching" then
                            cvar.cl_interp:float(0.031);
                            cvar.cl_interpolate:float(0);
                            cvar.cl_interp_ratio:float(1);
                        elseif v72.ragebot.prediction_system.conditions:get("Sneaking") and v183 == "Sneaking" then
                            cvar.cl_interp:float(0.031);
                            cvar.cl_interpolate:int(0);
                            cvar.cl_interp_ratio:int(1);
                        elseif v72.ragebot.ragebot_improvements.last_tick_backtrack:get() then
                            cvar.cl_interp_ratio:float(1);
                            cvar.sv_max_allowed_net_graph:float(2);
                            cvar.cl_interpolate:float(0);
                        else
                            cvar.cl_interp:float(0.015625);
                            cvar.cl_interp_ratio:int(2);
                            cvar.cl_interpolate:int(1);
                        end;
                    elseif v72.ragebot.ragebot_improvements.last_tick_backtrack:get() then
                        cvar.cl_interp_ratio:float(1);
                        cvar.sv_max_allowed_net_graph:float(2);
                        cvar.cl_interpolate:float(0);
                    else
                        cvar.cl_interp:float(0.015625);
                        cvar.cl_interp_ratio:int(2);
                        cvar.cl_interpolate:int(1);
                    end;
                elseif v72.ragebot.ragebot_improvements.last_tick_backtrack:get() then
                    cvar.cl_interp_ratio:float(1);
                    cvar.sv_max_allowed_net_graph:float(2);
                    cvar.cl_interpolate:float(0);
                else
                    cvar.cl_interp:float(0.015625);
                    cvar.cl_interp_ratio:int(2);
                    cvar.cl_interpolate:int(1);
                end;
                return;
            end;
        end;
    end;
end;
local function v185()
    -- upvalues: v72 (ref), v4 (ref)
    if not entity.get_local_player() then
        return;
    else
        if v72.ragebot.ragebot_improvements.defensive_improvements:get() then
            v4.ragebot.dt_teleport:override(true);
            v4.ragebot.qp_options:override("Early");
        else
            v4.ragebot.dt_teleport:override();
            v4.ragebot.qp_options:override();
        end;
        return;
    end;
end;
local function v191(v186)
    -- upvalues: v4 (ref), v72 (ref)
    local v187 = entity.get_local_player();
    if not v187:is_alive() then
        return;
    else
        local v188 = v187:get_player_weapon();
        if v188 == nil then
            return;
        else
            local v189 = v188:get_classname();
            local l_m_bIsScoped_1 = v187.m_bIsScoped;
            if v4.misc_antiaims.fake_duck:get() then
                if v72.ragebot.overrideFD.hitchance_fd_weapon:get("Scout") and string.match(v189, "SSG08") then
                    v4.ragebot.scout_hitchance:override(v72.ragebot.overrideFD.hitchance_fd_scout:get());
                end;
                if v72.ragebot.overrideFD.hitchance_fd_weapon:get("Auto") and string.match(v189, "SCAR20") or string.match(v189, "G3SG1") then
                    v4.ragebot.auto_hitchance:override(v72.ragebot.overrideFD.hitchance_fd_scar:get());
                end;
                if v72.ragebot.overrideFD.hitchance_fd_weapon:get("AWP") and string.match(v189, "AWP") then
                    v4.ragebot.awp_hitchance:override(v72.ragebot.overrideFD.hitchance_fd_awp:get());
                end;
                if v72.ragebot.overrideFD.hitchance_fd_weapon:get("R8") and string.match(v189, "DEagle") then
                    v4.ragebot.r8_hitchance:override(v72.ragebot.overrideFD.hitchance_fd_r8:get());
                end;
            elseif player_state(v186) == "Aerobic" or player_state(v186) == "Aerobic+" then
                if v72.ragebot.overrideInAir.hitchance_inair_weapon:get("Scout") and string.match(v189, "SSG08") then
                    v4.ragebot.scout_hitchance:override(v72.ragebot.overrideInAir.hitchance_inair_scout:get());
                end;
                if v72.ragebot.overrideInAir.hitchance_inair_weapon:get("R8") and string.match(v189, "DEagle") then
                    v4.ragebot.r8_hitchance:override(v72.ragebot.overrideInAir.hitchance_inair_r8:get());
                end;
            elseif not l_m_bIsScoped_1 then
                if v72.ragebot.overrideNoscope.hitchance_noscope_weapon:get("Scout") and string.match(v189, "SSG08") then
                    v4.ragebot.scout_hitchance:override(v72.ragebot.overrideNoscope.hitchance_noscope_scout:get());
                end;
                if v72.ragebot.overrideNoscope.hitchance_noscope_weapon:get("Auto") and string.match(v189, "SCAR20") or string.match(v189, "G3SG1") then
                    v4.ragebot.auto_hitchance:override(v72.ragebot.overrideNoscope.hitchance_noscope_scar:get());
                end;
                if v72.ragebot.overrideNoscope.hitchance_noscope_weapon:get("AWP") and string.match(v189, "AWP") then
                    v4.ragebot.awp_hitchance:override(v72.ragebot.overrideNoscope.hitchance_noscope_awp:get());
                end;
            else
                v4.ragebot.awp_hitchance:override();
                v4.ragebot.auto_hitchance:override();
                v4.ragebot.scout_hitchance:override();
                v4.ragebot.r8_hitchance:override();
            end;
            if v72.ragebot.overrideInAir.hitchance_inair_weapon:get("R8") and string.match(v189, "DEagle") and not l_m_bIsScoped_1 and not player_state(v186) == "Aerobic" and not player_state(v186) == "Aerobic+" and not v4.misc_antiaims.fake_duck:get() then
                v4.ragebot.r8_hitchance:override();
            end;
            return;
        end;
    end;
end;
local function v193(_)
    -- upvalues: v72 (ref)
    if v72.visuals.aspect_ratio:get() then
        cvar.r_aspectratio:float(v72.visuals.aspect_ratio.offset:get() / 100);
    else
        cvar.r_aspectratio:float(0);
    end;
end;
local function v198(_)
    -- upvalues: v72 (ref)
    local v195 = entity.get_local_player();
    if not v195 then
        return;
    else
        local v196 = v195:get_player_weapon();
        if v196 == nil then
            return;
        else
            local _ = v196:get_weapon_index();
            if v72.visuals.viewmodel:get() then
                cvar.viewmodel_fov:int(v72.visuals.viewmodel.fov:get(), true);
                cvar.viewmodel_offset_x:float(v72.visuals.viewmodel.x:get() / 10, true);
                cvar.viewmodel_offset_y:float(v72.visuals.viewmodel.y:get() / 10, true);
                cvar.viewmodel_offset_z:float(v72.visuals.viewmodel.z:get() / 10, true);
            else
                cvar.viewmodel_fov:int(68);
                cvar.viewmodel_offset_x:float(2.5);
                cvar.viewmodel_offset_y:float(0);
                cvar.viewmodel_offset_z:float(-1.5);
            end;
            if v72.visuals.viewmodel:get() then
                if v72.visuals.viewmodel.opposite_weapon:get() then
                    cvar.cl_righthand:int(0);
                else
                    cvar.cl_righthand:int(1);
                end;
                if v72.visuals.viewmodel.opposite_knife:get() and v196:get_classname() == "CKnife" and not v72.visuals.viewmodel.opposite_weapon:get() then
                    cvar.cl_righthand:int(0);
                elseif v72.visuals.viewmodel.opposite_knife:get() and v196:get_classname() == "CKnife" and v72.visuals.viewmodel.opposite_weapon:get() then
                    cvar.cl_righthand:int(1);
                elseif v72.visuals.viewmodel.opposite_knife:get() and not v196:get_classname() == "CKnife" and not v72.visuals.viewmodel.opposite_weapon:get() then
                    cvar.cl_righthand:int(1);
                end;
            end;
            return;
        end;
    end;
end;
local function v204(v199)
    -- upvalues: v72 (ref), v4 (ref)
    local v200 = player_state(v199);
    local v201 = entity.get_local_player();
    if not v201 then
        return;
    elseif not v201:is_alive() then
        return;
    else
        local v202 = v201:get_player_weapon();
        if v202 == nil then
            return;
        else
            local v203 = v202:get_classname();
            if v72.antiaims.auto_osaa.disables:get("Auto") and string.match(v203, "SCAR20") or string.match(v203, "G3SG1") then
                v4.ragebot.hide_shots:override();
                v4.ragebot.double_tap:override();
                return;
            elseif v72.antiaims.auto_osaa.disables:get("Deagle & R8") and string.match(v203, "DEagle") then
                v4.ragebot.hide_shots:override();
                v4.ragebot.double_tap:override();
                return;
            elseif v72.antiaims.auto_osaa.disables:get("AWP") and string.match(v203, "AWP") then
                v4.ragebot.hide_shots:override();
                v4.ragebot.double_tap:override();
                return;
            elseif v72.antiaims.auto_osaa.disables:get("Scout") and string.match(v203, "SSG08") then
                v4.ragebot.hide_shots:override();
                v4.ragebot.double_tap:override();
                return;
            elseif string.match(v203, "CKnife") then
                v4.ragebot.hide_shots:override();
                v4.ragebot.double_tap:override();
                return;
            elseif string.match(v203, "Taser") then
                v4.ragebot.hide_shots:override();
                v4.ragebot.double_tap:override();
                return;
            else
                if v72.antiaims.auto_osaa:get() then
                    if v72.antiaims.auto_osaa.select:get("Standing") and v200 == "Standing" then
                        v4.ragebot.hide_shots:override(true);
                        v4.ragebot.double_tap:override(false);
                    elseif v72.antiaims.auto_osaa.select:get("Walking") and v200 == "Walking" then
                        v4.ragebot.hide_shots:override(true);
                        v4.ragebot.double_tap:override(false);
                    elseif v72.antiaims.auto_osaa.select:get("Crouching") and v200 == "Crouching" then
                        v4.ragebot.hide_shots:override(true);
                        v4.ragebot.double_tap:override(false);
                    elseif v72.antiaims.auto_osaa.select:get("Sneaking") and v200 == "Sneaking" then
                        v4.ragebot.hide_shots:override(true);
                        v4.ragebot.double_tap:override(false);
                    else
                        v4.ragebot.hide_shots:override();
                        v4.ragebot.double_tap:override();
                    end;
                else
                    v4.ragebot.hide_shots:override();
                    v4.ragebot.double_tap:override();
                end;
                return;
            end;
        end;
    end;
end;
air_lag_exploit = function(_)
    -- upvalues: v4 (ref), v72 (ref)
    v4.ragebot.dt_limit:override();
    if not v72.antiaims.air_lag:get() then
        return;
    else
        local v206 = entity.get_local_player();
        if not v206 then
            return;
        else
            if bit.band(v206.m_fFlags, bit.lshift(1, 0)) == 0 then
                if globals.tickcount % v72.antiaims.air_lag.ticks:get() == 0 and bit.band(v206.m_fFlags, 1) == 0 then
                    rage.force_defensive = true;
                    v4.ragebot.dt_limit:override(math.random(10));
                    rage.exploit:force_teleport();
                    rage.exploit:allow_charge(false);
                elseif rage.exploit:get() == 0 then
                    rage.exploit:allow_charge(true);
                    rage.exploit:force_charge();
                    v4.ragebot.dt_limit:override();
                else
                    rage.exploit:allow_charge(true);
                    rage.exploit:force_charge();
                    v4.ragebot.dt_limit:override();
                end;
            end;
            return;
        end;
    end;
end;
events.item_purchase:set(function(v207)
    -- upvalues: v72 (ref)
    if v72.other.ragebot_logging.buy_logs:get() then
        local v208 = v72.other.ragebot_logging.logs_color_brand:get();
        local v209 = color(v208.r, v208.g, v208.b, 255):to_hex();
        brand = "polygone";
        local v210 = entity.get(v207.userid, true);
        local l_weapon_0 = v207.weapon;
        if l_weapon_0 == "weapon_unknown" then
            return;
        elseif v210 == nil then
            return;
        elseif not v210:is_enemy() then
            return;
        else
            print_raw(("\a" .. v209 .. brand .. " ~\aD5D5D5FF %s bought %s"):format(v210:get_name(), l_weapon_0));
            print_dev(("%s bought %s"):format(v210:get_name(), l_weapon_0));
        end;
    end;
end);
events.aim_ack:set(function(v212)
    -- upvalues: v72 (ref), v8 (ref)
    if v72.other.ragebot_logging:get() then
        brand = "polygone";
        local _ = entity.get_local_player();
        local v214 = entity.get(v212.target);
        local _ = v212.damage;
        local l_wanted_damage_0 = v212.wanted_damage;
        local v217 = v8[v212.wanted_hitgroup];
        local l_hitchance_0 = v212.hitchance;
        local l_state_0 = v212.state;
        state1 = v212.state;
        local l_backtrack_0 = v212.backtrack;
        if not v214 then
            return;
        elseif v214 == nil then
            return;
        else
            local l_m_iHealth_0 = v214.m_iHealth;
            if state1 == "spread" then
                state1 = "\aFEEA7DFFspread";
            end;
            if state1 == "prediction error" then
                state1 = "\aFEEA7DFFprediction error";
            end;
            if state1 == "correction" then
                state1 = "\aFF5959FFresolver";
            end;
            if state1 == "misprediction" then
                state1 = "\aFEEA7DFFprediction error";
            end;
            if state1 == "backtrack failure" then
                state1 = "\aFF5959FFbacktrack failure";
            end;
            if l_state_0 == "correction" then
                l_state_0 = "resolver";
            end;
            local v222 = v72.other.ragebot_logging.logs_color_brand:get();
            local v223 = color(v222.r, v222.g, v222.b, 255):to_hex();
            local v224 = v72.other.ragebot_logging.logs_color_hit:get();
            local v225 = color(v224.r, v224.g, v224.b, 255):to_hex();
            local v226 = v72.other.ragebot_logging.logs_color_miss:get();
            local v227 = color(v226.r, v226.g, v226.b, 255):to_hex();
            local v228 = v8[v212.hitgroup];
            if v72.other.ragebot_logging.logs_type:get() == "Monochrome" then
                if l_state_0 == nil then
                    print_dev(("\a" .. v223 .. brand .. "\aD5D5D5FF ~ registered %s in the %s for %d(" .. string.format("%.f", l_wanted_damage_0) .. ") damage (hp: " .. l_m_iHealth_0 .. ") (aimed: " .. v217 .. ") (bt: %s)"):format(v214:get_name(), v228, v212.damage, l_backtrack_0));
                    print_raw(("\a" .. v223 .. brand .. "\aD5D5D5FF ~ \aD5D5D5FFregistered %s in the %s for %d(" .. string.format("%.f", l_wanted_damage_0) .. ") damage (hp: " .. l_m_iHealth_0 .. ") (aimed: " .. v217 .. ") (bt: %s)"):format(v214:get_name(), v228, v212.damage, l_backtrack_0));
                else
                    print_dev(("\a" .. v223 .. brand .. "\aD5D5D5FF ~ missed shot in %s in the %s due to " .. l_state_0 .. " (bt: " .. l_backtrack_0 .. ") (hc: " .. string.format("%.f", l_hitchance_0) .. ") (damage: " .. string.format("%.f", l_wanted_damage_0) .. ")"):format(v214:get_name(), v217));
                    print_raw(("\a" .. v223 .. brand .. "\aD5D5D5FF ~ missed shot in %s in the %s due to " .. state1 .. "\aD5D5D5FF (bt: " .. l_backtrack_0 .. ") (hc: " .. string.format("%.f", l_hitchance_0) .. ") (damage: " .. string.format("%.f", l_wanted_damage_0) .. ")"):format(v214:get_name(), v217));
                end;
            elseif v72.other.ragebot_logging.logs_type:get() then
                if l_state_0 == nil then
                    print_dev(("\a" .. v223 .. brand .. "\aD5D5D5FF ~ registered %s in the %s for %d(" .. string.format("%.f", l_wanted_damage_0) .. ") damage (hp: " .. l_m_iHealth_0 .. ") (aimed: " .. v217 .. ") (bt: %s)"):format(v214:get_name(), v228, v212.damage, l_backtrack_0));
                    print_raw(("\a" .. v223 .. brand .. "\a" .. v225 .. " ~ registered %s in the %s for %d(" .. string.format("%.f", l_wanted_damage_0) .. ") damage (hp: " .. l_m_iHealth_0 .. ") (aimed: " .. v217 .. ") (bt: %s)"):format(v214:get_name(), v228, v212.damage, l_backtrack_0));
                else
                    print_dev(("\a" .. v223 .. brand .. "\aD5D5D5FF ~ missed shot in %s in the %s due to " .. l_state_0 .. " (bt: " .. l_backtrack_0 .. ") (hc: " .. string.format("%.f", l_hitchance_0) .. ") (damage: " .. string.format("%.f", l_wanted_damage_0) .. ")"):format(v214:get_name(), v217));
                    print_raw(("\a" .. v223 .. brand .. "\a" .. v227 .. " ~ missed shot in %s in the %s due to " .. state1 .. "\a" .. v227 .. " (bt: " .. l_backtrack_0 .. ") (hc: " .. string.format("%.f", l_hitchance_0) .. ") (damage: " .. string.format("%.f", l_wanted_damage_0) .. ")"):format(v214:get_name(), v217));
                end;
            end;
        end;
    end;
end);
events.player_hurt:set(function(v229)
    -- upvalues: v72 (ref)
    if v72.other.ragebot_logging:get() then
        brand = "polygone";
        local v230 = v72.other.ragebot_logging.logs_color_brand:get();
        local v231 = color(v230.r, v230.g, v230.b, 255):to_hex();
        local v232 = v72.other.ragebot_logging.logs_color_hit:get();
        local v233 = color(v232.r, v232.g, v232.b, 255):to_hex();
        local v234 = entity.get_local_player();
        local v235 = entity.get(v229.attacker, true);
        local l_weapon_1 = v229.weapon;
        local v237 = "Registered";
        if l_weapon_1 == "hegrenade" then
            v237 = "Naded";
        end;
        if l_weapon_1 == "inferno" then
            v237 = "Burned";
        end;
        if l_weapon_1 == "knife" then
            v237 = "Knifed";
        end;
        if (l_weapon_1 == "hegrenade" or l_weapon_1 == "inferno" or l_weapon_1 == "knife") and v234 == v235 then
            local v238 = entity.get(v229.userid, true);
            if v72.other.ragebot_logging.logs_type:get() == "Monochrome" then
                print_raw(("\a" .. v231 .. brand .. " ~ \aD5D5D5FF" .. v237 .. " %s for %d damage (%d health remaining)"):format(v238:get_name(), v229.dmg_health, v229.health));
            else
                print_raw(("\a" .. v231 .. brand .. " ~ \a" .. v233 .. v237 .. " %s for %d damage (%d health remaining)"):format(v238:get_name(), v229.dmg_health, v229.health));
            end;
            print_dev(("\a" .. v231 .. brand .. " ~ \aD5D5D5FF" .. v237 .. " %s for %d damage (%d health remaining)"):format(v238:get_name(), v229.dmg_health, v229.health));
        end;
    end;
end);
local _ = render.screen_size();
local v240 = {
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
local v242 = 1;
local _ = {
    hegrenade = "Naded", 
    knife = "Knifed", 
    inferno = "Burned"
};
local v244 = {};
local function v257()
    -- upvalues: v244 (ref), v12 (ref)
    local v245 = 0;
    local v246 = render.screen_size();
    for v247 = #v244, 1, -1 do
        local v248 = v244[v247];
        if v248.time + 3 > globals.realtime then
            v248.alpha = v12(v248.alpha, 255, 0.1);
        else
            v248.alpha = v12(v248.alpha, 0, 0.1);
        end;
        v248.offset = v248.offset or 25;
        v248.offset = v12(v248.offset, 0, 0.2);
        if v248.alpha < 1 or #v244 > 4 then
            table.remove(v244, v247);
        end;
    end;
    for v249 = 1, #v244 do
        local v250 = v244[v249];
        if v250 then
            local v251 = tostring(v250.text or "");
            local v252 = v250.color or color(255, 255, 255, 255);
            local v253 = render.measure_text(1, "", v251).x + 16;
            local v254 = v253 / 2;
            local v255 = v246.y / 1.15 - v245 + (v250.offset or 0);
            local v256 = v246.x / 2 - v254;
            render.rect(vector(v256 - 10, v255 - 6), vector(v256 + v253 - 10, v255 + 17), color(25, 25, 25, v250.alpha), 10);
            render.shadow(vector(v256 - 10, v255 - 6), vector(v256 + v253 - 10, v255 + 17), color(v252.r, v252.g, v252.b, v250.alpha * 0.8), 50, 0, 10);
            if v250.icon then
                render.text(2, vector(v246.x / 2 - v254 + 2, v255), color(v252.r, v252.g, v252.b, v250.alpha), nil);
            end;
            render.text(1, vector(v256, v255 - 1), color(255, 255, 255, v250.alpha), nil, v251);
            v245 = v245 + 35 * v250.alpha / 255;
        end;
    end;
end;
local function v264(v258, v259)
    -- upvalues: v244 (ref)
    local v260 = "";
    for _, v262 in ipairs(v258) do
        if type(v262) == "table" then
            local v263 = v262[1];
            if v262[2] and v259 then
                v260 = v260 .. "\a" .. v259:to_hex();
            else
                v260 = v260 .. "\aDEFAULT";
            end;
            v260 = v260 .. v263;
        end;
    end;
    table.insert(v244, 1, {
        alpha = 0, 
        text = v260, 
        icon = ui.get_icon("hexagon"), 
        time = globals.realtime, 
        color = v259 or color(255, 255, 255)
    });
end;
events.player_hurt:set(function(v265)
    -- upvalues: v72 (ref), v240 (ref), v264 (ref), v242 (ref)
    if v72.other.ragebot_logging:get() and v72.other.ragebot_logging.under_crosshair_logs:get() and entity.get_local_player() == entity.get(v265.attacker, true) then
        local _ = v265.dmg_health;
        local v267 = entity.get(v265.userid, true);
        local v268 = v240[v265.hitgroup];
        local l_weapon_2 = v265.weapon;
        local _ = v265.health;
        local v271 = v72.other.ragebot_logging.under_crosshair_logs_color_hit:get();
        if l_weapon_2 == "hegrenade" or l_weapon_2 == "inferno" or l_weapon_2 == "knife" then
            return;
        else
            if result == nil then
                v264({
                    [1] = {
                        [1] = "Registered"
                    }, 
                    [2] = {
                        [1] = " "
                    }, 
                    [3] = {
                        v267:get_name()
                    }, 
                    [4] = {
                        [1] = " "
                    }, 
                    [5] = {
                        [1] = "in"
                    }, 
                    [6] = {
                        [1] = " "
                    }, 
                    [7] = {
                        [1] = v268
                    }, 
                    [8] = {
                        [1] = " "
                    }, 
                    [9] = {
                        [1] = "for"
                    }, 
                    [10] = {
                        [1] = " "
                    }, 
                    [11] = {
                        [1] = v265.dmg_health
                    }, 
                    [12] = {
                        [1] = " "
                    }, 
                    [13] = {
                        [1] = "damage"
                    }
                }, v271);
            end;
            v242 = v242 == 999 and 1 or v242 + 1;
        end;
    end;
end);
events.player_hurt:set(function(v272)
    -- upvalues: v72 (ref), v264 (ref)
    if v72.other.ragebot_logging:get() and v72.other.ragebot_logging.under_crosshair_logs:get() then
        local v273 = entity.get_local_player();
        local v274 = entity.get(v272.attacker, true);
        local l_weapon_3 = v272.weapon;
        local v276 = "Registered";
        if l_weapon_3 == "hegrenade" then
            v276 = "Naded";
        end;
        if l_weapon_3 == "inferno" then
            v276 = "Burned";
        end;
        if l_weapon_3 == "knife" then
            v276 = "Knifed";
        end;
        local v277 = v72.other.ragebot_logging.under_crosshair_logs_color_hit:get();
        if (l_weapon_3 == "hegrenade" or l_weapon_3 == "inferno" or l_weapon_3 == "knife") and v273 == v274 then
            local v278 = entity.get(v272.userid, true);
            v264({
                [1] = {
                    [1] = v276
                }, 
                [2] = {
                    [1] = " "
                }, 
                [3] = {
                    v278:get_name()
                }, 
                [4] = {
                    [1] = " "
                }, 
                [5] = {
                    [1] = "for"
                }, 
                [6] = {
                    [1] = " "
                }, 
                [7] = {
                    [1] = v272.dmg_health
                }, 
                [8] = {
                    [1] = " "
                }, 
                [9] = {
                    [1] = "damage"
                }
            }, v277);
        end;
    end;
end);
events.aim_ack:set(function(v279)
    -- upvalues: v72 (ref), v240 (ref), v264 (ref), v242 (ref)
    if v72.other.ragebot_logging:get() then
        player_name = v279.target:get_name();
        damage = v279.damage;
        hitchance = v279.hitchance;
        hitgroup = v240[v279.hitgroup];
        backtrack = v279.backtrack;
        wanted_damage = v279.wanted_damage;
        wanted_hitgroup = v240[v279.wanted_hitgroup];
        state = v279.state;
        local _ = "%";
        local v281 = v72.other.ragebot_logging.under_crosshair_logs_color_miss:get();
        if state ~= nil and v72.other.ragebot_logging.under_crosshair_logs:get() then
            v264({
                [1] = {
                    [1] = "Missed shot in "
                }, 
                [2] = {
                    [1] = nil, 
                    [2] = true, 
                    [1] = player_name
                }, 
                [3] = {
                    [1] = "'s "
                }, 
                [4] = {
                    [1] = nil, 
                    [2] = true, 
                    [1] = wanted_hitgroup .. " "
                }, 
                [5] = {
                    [1] = "due to "
                }, 
                [6] = {
                    [1] = nil, 
                    [2] = true, 
                    [1] = state
                }
            }, v281);
        end;
        v242 = v242 == 999 and 1 or v242 + 1;
    end;
end);
events.render:set(function()
    -- upvalues: v257 (ref)
    v257();
end);
local function v288(v282)
    -- upvalues: v72 (ref), v4 (ref)
    if not v72.other.movement_manipulations.helpers:get(3) then
        return;
    elseif not v4.misc_antiaims.fake_duck:get() then
        return;
    else
        local v283 = entity.get_local_player();
        if not v283 or not v283:is_alive() then
            return;
        else
            local v284 = 5;
            local l_forwardmove_0 = v282.forwardmove;
            local l_sidemove_0 = v282.sidemove;
            if v284 < math.abs(l_forwardmove_0) or v284 < math.abs(l_sidemove_0) then
                local v287 = 150 / (l_forwardmove_0 * l_forwardmove_0 + l_sidemove_0 * l_sidemove_0) ^ 0.5;
                v282.forwardmove = l_forwardmove_0 * v287;
                v282.sidemove = l_sidemove_0 * v287;
            end;
            return;
        end;
    end;
end;
events.player_death:set(function(v289)
    -- upvalues: v72 (ref), v5 (ref), v6 (ref), v7 (ref)
    local l_userid_0 = entity.get_local_player():get_player_info().userid;
    local l_userid_1 = v289.userid;
    local l_attacker_0 = v289.attacker;
    if v72.other.trashtalk:get() then
        if v72.other.trashtalk.mode:get() == 1 then
            if l_userid_1 ~= l_userid_0 and l_userid_0 == l_attacker_0 then
                if v72.other.trashtalk.tt_on:get("On Kill") then
                    utils.execute_after(math.random(2, 3), utils.console_exec, "say " .. v5[math.random(1, #v5)]);
                end;
            elseif l_userid_1 == l_userid_0 and v72.other.trashtalk.tt_on:get("On Death") then
                utils.execute_after(math.random(2, 3), utils.console_exec, "say " .. v6[math.random(1, #v6)]);
            end;
        elseif l_userid_1 ~= l_userid_0 and l_userid_0 == l_attacker_0 then
            if v72.other.trashtalk.tt_on:get("On Kill") then
                utils.execute_after(math.random(1, 2), utils.console_exec, "say " .. v7[math.random(1, #v7)]);
            end;
        elseif l_userid_1 == l_userid_0 and v72.other.trashtalk.tt_on:get("On Death") then
            utils.execute_after(math.random(2, 3), utils.console_exec, "say " .. v6[math.random(1, #v6)]);
        end;
    end;
end);
local v293 = {
    [1] = " ", 
    [2] = "p", 
    [3] = "po", 
    [4] = "pol", 
    [5] = "poly", 
    [6] = "polyg", 
    [7] = "polygo", 
    [8] = "polygon", 
    [9] = "polygone", 
    [10] = "polygone", 
    [11] = "polygone", 
    [12] = "polygone", 
    [13] = "polygon", 
    [14] = "polygo", 
    [15] = "polyg", 
    [16] = "poly", 
    [17] = "pol", 
    [18] = "po", 
    [19] = "p ", 
    [20] = " "
};
ct_animation = function()
    -- upvalues: v293 (ref)
    if utils.net_channel() == nil then
        return;
    else
        local v294 = math.floor(math.fmod((globals.tickcount + utils.net_channel().latency[0] / globals.tickinterval) / 22, #v293 + 1) + 1);
        if entity.get_game_rules().m_gamePhase == 5 or entity.get_game_rules().m_gamePhase == 4 then
            return v293.polygone;
        else
            return v293[v294];
        end;
    end;
end;
ct_check = nil;
clan_tag = function(v295)
    if v295 == ct_check then
        return;
    elseif v295 == nil then
        return;
    else
        common.set_clan_tag(v295);
        ct_check = v295;
        return;
    end;
end;
anim_breaker = function(_)
    -- upvalues: v30 (ref), v29 (ref), v72 (ref), v4 (ref)
    local v297 = entity.get_local_player();
    if not v297 then
        return;
    elseif not v297:is_alive() then
        return;
    elseif v297:get_index() == nil then
        return;
    else
        v30 = v29(v297:get_index());
        move = math.sqrt(v297.m_vecVelocity.x ^ 2 + v297.m_vecVelocity.y ^ 2) > 5;
        jump = bit.band(v297.m_fFlags, 1) == 0;
        if v72.visuals.anim_breaker:get() then
            if v72.visuals.anim_breaker.on_ground:get() == "Static" then
                v297.m_flPoseParameter[0] = 1;
                v4.misc_antiaims.legs_movement:override("Sliding");
            end;
            if v72.visuals.anim_breaker.on_ground:get() == "Jitter" then
                v297.m_flPoseParameter[0] = globals.tickcount % 4 > 1 and v72.visuals.anim_breaker.jitter_speed:get() / 100 or 1;
                v4.misc_antiaims.legs_movement:override("Sliding");
            end;
            if v72.visuals.anim_breaker.on_ground:get() == "Walking" then
                v297.m_flPoseParameter[7] = 1;
                v4.misc_antiaims.legs_movement:override("Walking");
            end;
            if v72.visuals.anim_breaker.on_ground:get() == "Kangaroo" and not jump then
                v297.m_flPoseParameter[6] = globals.tickcount % 4 >= 2 and 86 or 50 / (globals.tickcount % 8 >= 4 and 200 or 400);
                v4.misc_antiaims.legs_movement:override("Sliding");
            end;
            if v72.visuals.anim_breaker.in_air:get() == "Static" then
                v297.m_flPoseParameter[6] = 1;
            end;
            if v72.visuals.anim_breaker.in_air:get() == "Kangaroo" and jump then
                v297.m_flPoseParameter[6] = globals.tickcount % 4 >= 2 and 86 or 50 / (globals.tickcount % 8 >= 4 and 200 or 400);
            end;
            if v72.visuals.anim_breaker.in_air:get() == "Walking" and jump then
                ffi.cast("animstate_layer_t**", ffi.cast("uintptr_t", v30) + 10640)[0][6].m_flWeight = 1;
            end;
            if v72.visuals.anim_breaker.other:get(1) and move then
                ffi.cast("animstate_layer_t**", ffi.cast("uintptr_t", v30) + 10640)[0][12].m_flWeight = 1;
            end;
            if v72.visuals.anim_breaker.other:get(2) and in_air() then
                v297.m_flPoseParameter[12] = 0.5;
            end;
            if v72.visuals.anim_breaker.other:get(3) then
                ffi.cast("animstate_layer_t**", ffi.cast("uintptr_t", v30) + 10640)[0][12].m_flWeight = utils.random_float(0.1, 1);
            end;
        end;
        return;
    end;
end;
local function v299()
    -- upvalues: v72 (ref), v4 (ref)
    local v298 = entity.get_local_player();
    if not v298 then
        return;
    elseif not v298:is_alive() then
        return;
    else
        if v72.other.fake_latency:get() then
            v4.ragebot.fake_latency:override(v72.other.fake_latency.value_slider:get());
        else
            v4.ragebot.fake_latency:override();
        end;
        return;
    end;
end;
local function v310(v300)
    -- upvalues: v72 (ref)
    local v301 = entity.get_local_player();
    if not v301 then
        return;
    elseif not v301:is_alive() then
        return;
    elseif v72.other.movement_manipulations.helpers:get(1) then
        if v300.sidemove ~= 0 or v300.forwardmove == 0 then
            return;
        else
            local v302 = entity.get_local_player();
            if v302.m_MoveType ~= 9 or bit.band(v302.m_fFlags, 1) == 1 then
                return;
            else
                local v303 = v302:get_player_weapon();
                if v303 == nil then
                    return;
                else
                    local l_m_fThrowTime_0 = v303.m_fThrowTime;
                    if l_m_fThrowTime_0 ~= nil and l_m_fThrowTime_0 > 0 then
                        return;
                    else
                        local l_m_vecLadderNormal_0 = v302.m_vecLadderNormal;
                        if l_m_vecLadderNormal_0:normalize() == 0 then
                            return;
                        else
                            local l_view_angles_0 = v300.view_angles;
                            local v307 = l_m_vecLadderNormal_0:angles();
                            local v308 = v300.forwardmove > 0;
                            local v309 = math.normalize_yaw(l_view_angles_0.y - v307.y) <= 0;
                            if l_view_angles_0.x - v307.x > 45 then
                                v308 = not v308;
                            end;
                            v300.in_back = v308 and 1 or 0;
                            v300.in_forward = v308 and 0 or 1;
                            if v309 then
                                v300.in_moveleft = v308 and 1 or 0;
                                v300.in_moveright = v308 and 0 or 1;
                            else
                                v300.in_moveleft = v308 and 0 or 1;
                                v300.in_moveright = v308 and 1 or 0;
                            end;
                            l_view_angles_0.x = 89;
                            l_view_angles_0.y = v307.y + (v309 and 90 or -90);
                            return;
                        end;
                    end;
                end;
            end;
        end;
    else
        return;
    end;
end;
local function v329(v311)
    -- upvalues: v72 (ref)
    local v312 = entity.get_local_player();
    if not v312 then
        return;
    elseif not v312:is_alive() then
        return;
    else
        if v72.other.movement_manipulations.helpers:get(2) then
            local v313 = false;
            local v314 = math.pi * 2;
            local v315 = v314 / 8;
            do
                local l_v314_0, l_v315_0 = v314, v315;
                local function v328(v318, v319)
                    -- upvalues: l_v314_0 (ref), l_v315_0 (ref)
                    local v320 = v318:get_origin();
                    for v321 = 0, l_v314_0, l_v315_0 do
                        local v322 = math.sin(v321);
                        local v323 = math.cos(v321);
                        local v324 = v320.x + v323 * 10;
                        local v325 = v320.y + v322 * 10;
                        local v326 = vector(v324, v325, v320.z);
                        local v327 = v326:clone();
                        v327.z = v327.z - v319;
                        if utils.trace_line(v326, v327, v318).fraction < 1 then
                            return true;
                        end;
                    end;
                    return false;
                end;
                if v312.m_vecVelocity.z <= -500 then
                    if v328(v312, 15) then
                        v313 = false;
                    elseif v328(v312, 75) then
                        v313 = true;
                    end;
                    v311.in_duck = v313;
                end;
            end;
        end;
        return;
    end;
end;
local function v332(_)
    -- upvalues: v72 (ref), v4 (ref)
    local v331 = entity.get_local_player();
    if not v331 then
        return;
    elseif not v331:is_alive() then
        return;
    else
        if v72.other.nade_manipulations.manipulations:get(1) then
            if weapon_id == 43 or not (weapon_id ~= 44) or not (weapon_id ~= 45) or not (weapon_id ~= 46) or not (weapon_id ~= 47) or weapon_id == 48 then
                v4.ragebot.weapon_actions:override({});
            else
                v4.ragebot.weapon_actions:override();
            end;
        end;
        return;
    end;
end;
local function v337(v333)
    -- upvalues: v72 (ref)
    local v334 = entity.get_local_player();
    if v334 == nil or not v334:is_alive() then
        return;
    else
        local v335 = v334:get_player_weapon();
        if v335 == nil then
            return;
        else
            local v336 = v335:get_weapon_index();
            if not v336 == 44 or not v336 == 46 then
                return;
            else
                if v72.other.nade_manipulations.manipulations:get(3) and v335.m_bPinPulled and v333.damage >= v72.other.nade_manipulations.auto_granade_release_damage:get() then
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
weapon_type = 9;
local v338 = nil;
v338 = {};
render_view_angles = vector();
velocity = vector();
last_velocity = vector();
is_grenade = function(v339)
    return v339.weapon_type == weapon_type;
end;
is_auto_strafe = function()
    -- upvalues: v4 (ref)
    return v4.misc.auto_strafe:get();
end;
ray_circle_intersection = function(v340, v341, v342)
    if math.abs(v340.x) > math.abs(v340.y) then
        local v343 = v340.y / v340.x;
        local v344 = 1 + v343 * v343;
        local v345 = -2 * v341.x - 2 * v343 * v341.y;
        local v346 = v341:length2dsqr() - v342 * v342;
        local v347 = v345 * v345 - 4 * v344 * v346;
        if v347 < 0 then
            return v341 + (v340 * v341:dot(v340) - v341):normalized() * v342;
        elseif v347 < 0.001 then
            local v348 = -v345 / (2 * v344);
            local v349 = v343 * v348;
            return vector(v348, v349);
        else
            local v350 = math.sqrt(v347);
            local v351 = (-v345 + v350) / (2 * v344);
            local v352 = v343 * v351;
            local v353 = vector(v351, v352);
            v351 = (-v345 - v350) / (2 * v344);
            v352 = v343 * v351;
            local v354 = vector(v351, v352);
            if v340:dot(v353) > v340:dot(v354) then
                return v353;
            else
                return v354;
            end;
        end;
    else
        local v355 = v340.x / v340.y;
        local v356 = 1 + v355 * v355;
        local v357 = -2 * v341.y - 2 * v355 * v341.x;
        local v358 = v341:length2dsqr() - v342 * v342;
        local v359 = v357 * v357 - 4 * v356 * v358;
        if v359 < 0 then
            return v341 + (v340 * v341:dot(v340) - v341):normalized() * v342;
        elseif v359 < 0.001 then
            local v360 = -v357 / (2 * v356);
            local v361 = v355 * v360;
            return vector(v361, v360);
        else
            local v362 = math.sqrt(v359);
            local v363 = (-v357 + v362) / (2 * v356);
            local v364 = v355 * v363;
            local v365 = vector(v364, v363);
            v363 = (-v357 - v362) / (2 * v356);
            v364 = v355 * v363;
            local v366 = vector(v364, v363);
            if v340:dot(v365) > v340:dot(v366) then
                return v365;
            else
                return v366;
            end;
        end;
    end;
end;
calculate_throw_yaw = function(v367, v368, v369, v370)
    -- upvalues: v72 (ref)
    if not v72.other.nade_manipulations.manipulations:get(2) then
        return;
    else
        local v371 = v367:clone();
        v371.z = 0;
        v371:normalize();
        local v372 = v371:dot(v367) / v367:length();
        return (ray_circle_intersection(v371, v368 * 1.25, clamp(v369 * 0.9, 15, 750) * (clamp(v370, 0, 1) * 0.7 + 0.3) * v372) - v368 * 1.25):angles().y;
    end;
end;
calculate_throw_pitch = function(v373, v374, v375, v376, v377)
    -- upvalues: v72 (ref)
    if not v72.other.nade_manipulations.manipulations:get(2) then
        return;
    else
        local v378 = clamp(v376 * 0.9, 15, 750) * (clamp(v377, 0, 1) * 0.7 + 0.3);
        local v379 = v375 * 1.25 + v373 * v378;
        local _ = vector(v375.x, v375.y, v374) * 1.25 + v373 * v378;
        local v381 = v379:angles();
        local v382 = v373:angles().x - v381.x;
        return v382 * (math.cos(math.rad(v382)) + 1) * 0.5;
    end;
end;
prediction = function(v383)
    -- upvalues: v72 (ref)
    if not v72.other.nade_manipulations.manipulations:get(2) then
        return;
    else
        local v384 = entity.get_local_player();
        if v384 == nil then
            return;
        else
            local v385 = v384:get_player_weapon();
            if v385 == nil then
                return;
            else
                local v386 = v385:get_weapon_info();
                if v386 == nil then
                    return;
                else
                    local l_velocity_0 = v383.velocity;
                    local v388 = v383.angles:clone();
                    local v389 = clamp(v385.m_flThrowStrength, 0, 1);
                    v388.x = v388.x + calculate_throw_pitch(vector():angles(v388), clamp(-l_velocity_0.z, -120, 120), l_velocity_0, v386.throw_velocity, v389);
                    local v390 = vector():angles(v388);
                    local v391 = v390 * (clamp(v386.throw_velocity * 0.9, 15, 750) * (v389 * 0.7 + 0.3));
                    if (l_velocity_0 * 1.25 + v391):dot(v390) > 0 then
                        v388.y = calculate_throw_yaw(v390, l_velocity_0, v386.throw_velocity, v389);
                    end;
                    v383.angles = v388;
                    return;
                end;
            end;
        end;
    end;
end;
throwable = function(v392, v393)
    -- upvalues: v72 (ref)
    local v394 = render.camera_angles();
    local v395 = v392.view_angles:clone();
    if not v72.other.nade_manipulations.manipulations:get(2) then
        return;
    elseif v394 ~= v395 then
        return;
    else
        local v396 = v393:get_player_weapon();
        if v396 == nil then
            return;
        else
            local v397 = v396:get_weapon_info();
            if v397 == nil or not is_grenade(v397) then
                return;
            elseif v396.m_fThrowTime < globals.curtime - to_time(globals.clock_offset) then
                return;
            else
                local v398 = v392.view_angles:clone();
                local v399 = vector():angles(v398);
                local v400 = (velocity + last_velocity) * 0.5;
                local v401 = v399 * (clamp(v397.throw_velocity * 0.9, 15, 750) * (v396.m_flThrowStrength * 0.7 + 0.3));
                local v402 = velocity * 1.25 + v401;
                local v403 = (v401 + v400 * 1.25):normalized();
                if v402:dot(v399) > 0 then
                    v403 = v399;
                end;
                v392.view_angles.x = v392.view_angles.x + calculate_throw_pitch(vector():angles(v392.view_angles), 0, v400, v397.throw_velocity, v396.m_flThrowStrength);
                v392.view_angles.y = calculate_throw_yaw(v403, last_velocity, v397.throw_velocity, v396.m_flThrowStrength);
                return;
            end;
        end;
    end;
end;
override_view = function(v404)
    -- upvalues: v72 (ref)
    if not v72.other.nade_manipulations.manipulations:get(2) then
        return;
    else
        prediction(v404);
        return;
    end;
end;
on_createmove = function(v405)
    local v406 = entity.get_local_player();
    local v407 = v406:simulate_movement();
    v407:think(1);
    velocity = v407.velocity;
    last_velocity = velocity;
    throwable(v405, v406);
end;
events.createmove(on_createmove);
events.grenade_override_view(override_view);
local v408 = nil;
local function v409()
    -- upvalues: v4 (ref)
    v4.misc.auto_strafe:override();
    v4.misc.strafe_assist:override();
end;
local function v417(v410)
    -- upvalues: v4 (ref)
    local v411 = entity.get_local_player();
    if v411 == nil then
        return;
    else
        local v412 = v411:get_player_weapon();
        if v412 == nil then
            return;
        else
            local v413 = v412:get_weapon_info();
            if v413 == nil or v413.weapon_type ~= 9 then
                return;
            elseif v412.m_fThrowTime < globals.curtime - to_time(globals.clock_offset) then
                return;
            else
                local l_m_vecVelocity_0 = v411.m_vecVelocity;
                local v415 = math.rad(math.atan2(l_m_vecVelocity_0.y, l_m_vecVelocity_0.x));
                if v415 < 0 then
                    v415 = v415 + 360;
                end;
                v415 = v415 - math.floor(v415 / 360 + 0.5) * 360;
                local _ = math.normalize_yaw(v410.view_angles.y - v415);
                v4.misc.auto_strafe:override(false);
                v4.misc.strafe_assist:override(false);
                return;
            end;
        end;
    end;
end;
do
    local l_v409_0, l_v417_0 = v409, v417;
    on_createmove = function(v420)
        -- upvalues: l_v409_0 (ref), l_v417_0 (ref)
        l_v409_0();
        l_v417_0(v420);
    end;
    events.createmove(on_createmove, true);
end;
v408 = "none";
v409 = function()
    -- upvalues: v72 (ref), v24 (ref), v408 (ref), v3 (ref), v4 (ref)
    local v421 = entity.get_local_player();
    if not v421 then
        return;
    elseif not v421:is_alive() then
        return;
    else
        if v72.visuals.crosshair_inds:get() then
            local v422 = v72.visuals.crosshair_inds.offset:get();
            local v423 = v72.visuals.crosshair_inds.style:get();
            local v424 = v72.visuals.crosshair_inds.s_color:get();
            local v425 = v72.visuals.crosshair_inds.g1_color:get();
            local v426 = v72.visuals.crosshair_inds.g2_color:get();
            local v427 = color(v424.r, v424.g, v424.b, 255);
            local v428 = color(v425.r, v425.g, v425.b, 255);
            local v429 = color(v426.r, v426.g, v426.b, 255);
            local v430 = v427:to_hex();
            local v431 = v428:to_hex();
            local v432 = math.floor(math.sin(globals.realtime * 4) * 89 + 90) or 180;
            local v433 = 9;
            if not v72.visuals.custom_scope.select:get(1) then
                get_scope = v24("get_scope", v421.m_bIsScoped and 1 or 0, 50);
            else
                get_scope = 0;
            end;
            if rage.antiaim:inverter() == false then
                v408 = "R";
            else
                v408 = "L";
            end;
            v3.mtools.Animation:Register("crosshair_inds");
            v3.mtools.Animation:Update("crosshair_inds", 6);
            if not v72.visuals.custom_scope.select:get(1) then
                scope_anim = v3.mtools.Animation:Lerp("crosshair_inds", string.upper(luaname), v421.m_bIsScoped, vector(x, y), vector(x + 55, y), 10);
            else
                scope_anim = v3.mtools.Animation:Lerp("crosshair_inds", string.upper(luaname), v421.m_bIsScoped, vector(x, y), vector(x, y), 10);
            end;
            local v434 = v3.gradient.text_animate(string.upper(luaname), -2, {
                [1] = v428, 
                [2] = v429
            });
            v434:animate();
            local v435 = v3.gradient.text_animate(string.upper(luaname), -2, {
                [1] = v428, 
                [2] = v429
            });
            v435:animate();
            local v436 = v3.gradient.text_animate(string.upper(luaname), -2, {
                [1] = v427, 
                [2] = v427
            });
            if v72.visuals.crosshair_inds.inds_type:get() == 1 then
                if v423 == 1 then
                    render.text(2, vector(scope_anim.x / 2, y / 2 + v422), v427, "c", string.upper(luaname));
                    if v72.visuals.crosshair_inds.additions:get("Glow") then
                        render.shadow(vector(scope_anim.x / 2 - 21, y / 2 + v422), vector(scope_anim.x / 2 + 20, y / 2 + v422), v427, 30, 0, 0);
                    end;
                elseif v423 == 2 then
                    render.text(2, vector(scope_anim.x / 2, y / 2 + v422), color(), "c", v434:get_animated_text());
                    if v72.visuals.crosshair_inds.additions:get("Glow") then
                        render.shadow(vector(scope_anim.x / 2 - 21, y / 2 + v422), vector(scope_anim.x / 2 + 20, y / 2 + v422), v428, 30, 0, 0);
                    end;
                end;
                if v72.visuals.crosshair_inds.additions:get("Anti-Aims States") then
                    render.text(2, vector(scope_anim.x / 2, y / 2 + v422 + v433), color(255, 255, 255, 255), "c", string.upper(player_state(cmd)));
                    v433 = v433 + 9;
                end;
                if v72.visuals.crosshair_inds.additions:get("Desync Side") then
                    if v423 == 1 then
                        render.text(2, vector(scope_anim.x / 2, y / 2 + v422 + v433), color(255, 255, 255, 255), "c", "SIDE: \a" .. v430 .. v408);
                        v433 = v433 + 9;
                    else
                        render.text(2, vector(scope_anim.x / 2, y / 2 + v422 + v433), color(255, 255, 255, 255), "c", "SIDE: \a" .. v431 .. v408);
                        v433 = v433 + 9;
                    end;
                end;
                if v72.visuals.crosshair_inds.additions:get("Keybinds") then
                    if v4.ragebot.double_tap:get() then
                        render.text(2, vector(scope_anim.x / 2 - 11, y / 2 + v422 + v433), color(255, rage.exploit:get() * 255, rage.exploit:get() * 255, 255), "c", "DT");
                    else
                        render.text(2, vector(scope_anim.x / 2 - 11, y / 2 + v422 + v433), color(255, 255, 255, 100), "c", "DT");
                    end;
                    if v4.ragebot.hide_shots:get() then
                        render.text(2, vector(scope_anim.x / 2 + 6, y / 2 + v422 + v433), color(255, rage.exploit:get() * 255, rage.exploit:get() * 255, 255), "c", "OSAA");
                        v433 = v433 + 9;
                    else
                        render.text(2, vector(scope_anim.x / 2 + 6, y / 2 + v422 + v433), color(255, 255, 255, 100), "c", "OSAA");
                        v433 = v433 + 9;
                    end;
                    if v4.ragebot.safe_point:get() == "Force" then
                        render.text(2, vector(scope_anim.x / 2 - 11, y / 2 + v422 + v433), color(255, 100, 100, 255), "c", "SP");
                    else
                        render.text(2, vector(scope_anim.x / 2 - 11, y / 2 + v422 + v433), color(255, 255, 255, 100), "c", "SP");
                    end;
                    if v4.ragebot.force_body:get() == "Force" then
                        render.text(2, vector(scope_anim.x / 2 + 6, y / 2 + v422 + v433), color(255, 100, 100, 255), "c", "BAIM");
                        v433 = v433 + 9;
                    else
                        render.text(2, vector(scope_anim.x / 2 + 6, y / 2 + v422 + v433), color(255, 255, 255, 100), "c", "BAIM");
                        v433 = v433 + 9;
                    end;
                    if v4.ragebot.fake_latency:get() > 0 or v72.other.fake_latency.value_slider:get() > 0 and v72.other.fake_latency:get() then
                        render.text(2, vector(scope_anim.x / 2, y / 2 + v422 + v433), color(100, 170, 100, 255), "c", "PING");
                        v433 = v433 + 9;
                    end;
                    if v4.ragebot.peek_assist:get() then
                        render.text(2, vector(scope_anim.x / 2, y / 2 + v422 + v433), color(255, 255, 255, 255), "c", "PEEK");
                        v433 = v433 + 9;
                    end;
                    if v4.antiaims.freestanding:get() or v72.antiaims.freestanding.switch:get() then
                        render.text(2, vector(scope_anim.x / 2, y / 2 + v422 + v433), color(255, 255, 255, 255), "c", "FS");
                        v433 = v433 + 9;
                    end;
                end;
            elseif v72.visuals.crosshair_inds.inds_type:get() == 2 then
                render.text(2, vector(x / 2 + (render.measure_text(2, "c", "[" .. string.upper(branch) .. "]").x / 2 + 3) * get_scope, y / 2 + v422), color(255, 255, 255, v432), "c", "[" .. string.upper(branch) .. "]");
                if v423 == 1 then
                    if v72.visuals.crosshair_inds.additions:get("Glow") then
                        render.shadow(vector(x / 2 - 15 + (render.measure_text(2, "c", string.upper(luaname)).x / 2 + 5) * get_scope, y / 2 + v422 + 9), vector(x / 2 + 15 + (render.measure_text(2, "c", string.upper(luaname)).x / 2 + 5) * get_scope, y / 2 + v422 + 9), v427, 30, 0, 0);
                    end;
                    render.text(2, vector(x / 2 + (render.measure_text(2, "c", v436:get_animated_text()).x / 2 + 3) * get_scope, y / 2 + v422 + 9), color(), "c", v436:get_animated_text());
                elseif v423 == 2 then
                    if v72.visuals.crosshair_inds.additions:get("Glow") then
                        render.shadow(vector(x / 2 - 21 + (render.measure_text(2, "c", v435:get_animated_text()).x / 2 + 5) * get_scope, y / 2 + v422 + 9), vector(x / 2 + 20 + (render.measure_text(2, "c", string.upper(luaname)).x / 2 + 9) * get_scope, y / 2 + v422 + 9), v428, 30, 0, 0);
                    end;
                    render.text(2, vector(x / 2 + (render.measure_text(2, "c", v435:get_animated_text()).x / 2 + 3) * get_scope, y / 2 + v422 + 9), color(), "c", v435:get_animated_text());
                end;
                if v72.visuals.crosshair_inds.additions:get("Anti-Aims States") then
                    render.text(2, vector(x / 2 + (render.measure_text(2, "c", string.upper(player_state(cmd))).x / 2 + 3) * get_scope, y / 2 + v422 + v433 + 9), color(255, 255, 255, 255), "c", string.upper(player_state(cmd)));
                    v433 = v433 + 9;
                end;
                v433 = v433 + 9;
                if v72.visuals.crosshair_inds.additions:get("Desync Side") then
                    if v423 == 1 then
                        render.text(2, vector(x / 2 + (render.measure_text(2, "c", "SIDE: " .. v408).x / 2 + 3) * get_scope, y / 2 + v422 + v433), color(255, 255, 255, 255), "c", "SIDE: \a" .. v430 .. v408);
                        v433 = v433 + 9;
                    else
                        render.text(2, vector(x / 2 + (render.measure_text(2, "c", "SIDE: " .. v408).x / 2 + 3) * get_scope, y / 2 + v422 + v433), color(255, 255, 255, 255), "c", "SIDE: \a" .. v431 .. v408);
                        v433 = v433 + 9;
                    end;
                end;
                if v72.visuals.crosshair_inds.additions:get("Keybinds") then
                    if v4.ragebot.force_body:get() == "Force" then
                        render.text(2, vector(x / 2 + (render.measure_text(2, "c", "BAIM").x / 2 + 3) * get_scope, y / 2 + v422 + v433), color(255, 100, 100, 255), "c", "BAIM");
                        v433 = v433 + 9;
                    end;
                    if v4.ragebot.safe_point:get() == "Force" then
                        render.text(2, vector(x / 2 + (render.measure_text(2, "c", "SAFE").x / 2 + 3) * get_scope, y / 2 + v422 + v433), color(255, 100, 100, 255), "c", "SAFE");
                        v433 = v433 + 9;
                    end;
                    if v4.ragebot.fake_latency:get() > 0 or v72.other.fake_latency.value_slider:get() > 0 and v72.other.fake_latency:get() then
                        render.text(2, vector(x / 2 + (render.measure_text(2, "c", "PING").x / 2 + 3) * get_scope, y / 2 + v422 + v433), color(100, 170, 100, 255), "c", "PING");
                        v433 = v433 + 9;
                    end;
                    if v4.ragebot.double_tap:get() then
                        render.text(2, vector(x / 2 + (render.measure_text(2, "c", "DT").x / 2 + 3) * get_scope, y / 2 + v422 + v433), color(255, rage.exploit:get() * 255, rage.exploit:get() * 255, 255), "c", "DT");
                        v433 = v433 + 9;
                    elseif v4.ragebot.hide_shots:get() then
                        render.text(2, vector(x / 2 + (render.measure_text(2, "c", "OSAA").x / 2 + 3) * get_scope, y / 2 + v422 + v433), color(255, rage.exploit:get() * 255, rage.exploit:get() * 255, 255), "c", "OSAA");
                        v433 = v433 + 9;
                    end;
                    if v4.ragebot.peek_assist:get() then
                        render.text(2, vector(x / 2 + (render.measure_text(2, "c", "PEEK").x / 2 + 3) * get_scope, y / 2 + v422 + v433), color(255, 255, 255, 255), "c", "PEEK");
                        v433 = v433 + 9;
                    end;
                    if v4.antiaims.freestanding:get() or v72.antiaims.freestanding.switch:get() then
                        render.text(2, vector(x / 2 + (render.measure_text(2, "c", "FS").x / 2 + 3) * get_scope, y / 2 + v422 + v433), color(255, 255, 255, 255), "c", "FS");
                        v433 = v433 + 9;
                    end;
                end;
            end;
        end;
        return;
    end;
end;
v417 = function()
    -- upvalues: v72 (ref), v4 (ref)
    local v437 = entity.get_local_player();
    if not v437 then
        return;
    elseif not v437:is_alive() then
        return;
    else
        local v438 = v72.visuals.damage_ind.accent_color:get();
        if not v72.visuals.damage_ind.pixel:get() then
            if v4.ragebot.min_damage:get() <= 100 and v4.ragebot.min_damage:get() > 0 then
                render.text(1, vector(x / 2 + 15, y / 2 - 10), v438, "c", v4.ragebot.min_damage:get());
            elseif v4.ragebot.min_damage:get() == 0 then
                render.text(1, vector(x / 2 + 15, y / 2 - 10), v438, "c", "auto");
            elseif v4.ragebot.min_damage:get() > 100 then
                render.text(1, vector(x / 2 + 15, y / 2 - 10), v438, "c", "+", v4.ragebot.min_damage:get() - 100);
            end;
        elseif v4.ragebot.min_damage:get() <= 100 and v4.ragebot.min_damage:get() > 0 then
            render.text(2, vector(x / 2 + 15, y / 2 - 10), v438, "c", v4.ragebot.min_damage:get());
        elseif v4.ragebot.min_damage:get() == 0 then
            render.text(2, vector(x / 2 + 15, y / 2 - 10), v438, "c", "auto");
        elseif v4.ragebot.min_damage:get() > 100 then
            render.text(2, vector(x / 2 + 15, y / 2 - 10), v438, "c", "+", v4.ragebot.min_damage:get() - 100);
        end;
        return;
    end;
end;
local function v442()
    -- upvalues: v72 (ref)
    local v439 = entity.get_local_player();
    if not v439 then
        return;
    elseif not v439:is_alive() then
        return;
    else
        local v440 = v439.m_flVelocityModifier * 100;
        local v441 = math.floor(math.sin(globals.realtime * 4) * 89 + 90) or 180;
        if v440 < 100 or is_menu_opened() then
            render.text(4, vector(x / 2, y / 2 - 365), color(255, 2.55 * v440, 2.55 * v440, v441), "c", "~ velocity ~");
            render.rect(vector(x / 2 - 50, y / 2 - 355), vector(x / 2 + 50, y / 2 - 350), color(0, 0, 0, 150), 3);
            render.rect(vector(x / 2 - 49, y / 2 - 354), vector(x / 2 - 49 + v440 - 2, y / 2 - 351), v72.visuals.windows.velocity_warning_color:get(), 3);
        end;
        return;
    end;
end;
local function v444(v443)
    if v443 < 0 then
        return 0;
    elseif v443 * 9 > 100 then
        return 100;
    else
        return v443 * 9;
    end;
end;
local function v449()
    -- upvalues: v444 (ref), v144 (ref), v72 (ref)
    local l_tickcount_1 = globals.tickcount;
    local v446 = entity.get_local_player();
    if not v446 then
        return;
    elseif not v446:is_alive() then
        return;
    else
        local _ = v446.m_flVelocityModifier * 100;
        local v448 = math.floor(math.sin(globals.realtime * 4) * 89 + 90) or 180;
        if v444(v144 - l_tickcount_1) > 0 and not is_menu_opened() then
            if v72.visuals.windows.in_air:get() and player_state(cmd) ~= "Aerobic" and player_state(cmd) ~= "Aerobic+" then
                return;
            else
                render.text(4, vector(x / 2, y / 2 - 315), color(255, 255, 255, 2.55 * v444(v144 - l_tickcount_1)), "c", "~ safe ~");
                render.rect(vector(x / 2 - 50, y / 2 - 305), vector(x / 2 + 50, y / 2 - 300), color(0, 0, 0, 150), 3);
                render.rect(vector(x / 2 - 49, y / 2 - 304), vector(x / 2 - 51 + v444(v144 - l_tickcount_1), y / 2 - 301), v72.visuals.windows.defensive_warning_color:get(), 3);
            end;
        elseif is_menu_opened() then
            render.text(4, vector(x / 2, y / 2 - 315), color(255, 255, 255, v448), "c", "~ safe ~");
            render.rect(vector(x / 2 - 50, y / 2 - 305), vector(x / 2 + 50, y / 2 - 300), color(0, 0, 0, 150), 3);
            render.rect(vector(x / 2 - 49, y / 2 - 304), vector(x / 2 - 51 + 100, y / 2 - 301), v72.visuals.windows.defensive_warning_color:get(), 3);
        end;
        return;
    end;
end;
local function v456()
    -- upvalues: v72 (ref), v24 (ref), v33 (ref)
    local v450 = entity.get_local_player();
    if not v450 then
        return;
    elseif not v450:is_alive() then
        return;
    else
        if v72.visuals.manual_arrows:get() then
            local v451 = v72.visuals.manual_arrows.select:get();
            local v452 = v72.visuals.manual_arrows.color1:get();
            local v453 = v72.visuals.manual_arrows.color2:get();
            local v454 = v72.visuals.manual_arrows.velocity_mode:get();
            local v455 = vector(v450["m_vecVelocity[0]"], v450["m_vecVelocity[1]"], v450["m_vecVelocity[2]"]):length2d();
            if not v72.visuals.custom_scope.select:get(1) then
                get_scope_man = v24("get_scope", v450.m_bIsScoped and 1 or 0, 50);
            else
                get_scope_man = 0;
            end;
            if v451 == 1 then
                if not v454 then
                    render.poly(v72.antiaims.yaw_base.select_side:get() == "Left" and v452 or color(35, 35, 35, 150), vector(x / 2 - 55, y / 2 - 2 + 2 - (render.measure_text(v33.calibri2, "c", "<").x / 2 + 5) * get_scope_man), vector(x / 2 - 42, y / 2 - 2 - 7 - (render.measure_text(v33.calibri2, "c", "<").x / 2 + 5) * get_scope_man), vector(x / 2 - 42, y / 2 - 2 + 11 - (render.measure_text(v33.calibri2, "c", "<").x / 2 + 5) * get_scope_man));
                    render.poly(v72.antiaims.yaw_base.select_side:get() == "Right" and v452 or color(35, 35, 35, 150), vector(x / 2 + 55, y / 2 - 2 + 2 - (render.measure_text(v33.calibri2, "c", "<").x / 2 + 5) * get_scope_man), vector(x / 2 + 42, y / 2 - 2 - 7 - (render.measure_text(v33.calibri2, "c", "<").x / 2 + 5) * get_scope_man), vector(x / 2 + 42, y / 2 - 2 + 11 - (render.measure_text(v33.calibri2, "c", "<").x / 2 + 5) * get_scope_man));
                    render.rect(vector(x / 2 - 40, y / 2 - 2 - 7 - (render.measure_text(v33.calibri2, "c", "<").x / 2 + 5) * get_scope_man), vector(x / 2 - 38, y / 2 - 2 - 7 + 18 - (render.measure_text(v33.calibri2, "c", "<").x / 2 + 5) * get_scope_man), rage.antiaim:inverter() == false and v453 or color(35, 35, 35, 150));
                    render.rect(vector(x / 2 + 40, y / 2 - 2 - 7 - (render.measure_text(v33.calibri2, "c", "<").x / 2 + 5) * get_scope_man), vector(x / 2 + 38 + 2, y / 2 - 2 - 7 + 18 - (render.measure_text(v33.calibri2, "c", "<").x / 2 + 5) * get_scope_man), rage.antiaim:inverter() == true and v453 or color(35, 35, 35, 150));
                else
                    render.poly(v72.antiaims.yaw_base.select_side:get() == "Left" and v452 or color(35, 35, 35, 150), vector(x / 2 - 55 - v455 / 7, y / 2 - 2 + 2 - (render.measure_text(v33.calibri2, "c", "<").x / 2 + 5) * get_scope_man), vector(x / 2 - 42 - v455 / 7, y / 2 - 2 - 7 - (render.measure_text(v33.calibri2, "c", "<").x / 2 + 5) * get_scope_man), vector(x / 2 - 42 - v455 / 7, y / 2 - 2 + 11 - (render.measure_text(v33.calibri2, "c", "<").x / 2 + 5) * get_scope_man));
                    render.poly(v72.antiaims.yaw_base.select_side:get() == "Right" and v452 or color(35, 35, 35, 150), vector(x / 2 + 55 + v455 / 7, y / 2 - 2 + 2 - (render.measure_text(v33.calibri2, "c", "<").x / 2 + 5) * get_scope_man), vector(x / 2 + 42 + v455 / 7, y / 2 - 2 - 7 - (render.measure_text(v33.calibri2, "c", "<").x / 2 + 5) * get_scope_man), vector(x / 2 + 42 + v455 / 7, y / 2 - 2 + 11 - (render.measure_text(v33.calibri2, "c", "<").x / 2 + 5) * get_scope_man));
                    render.rect(vector(x / 2 - 40 - v455 / 7, y / 2 - 2 - 7 - (render.measure_text(v33.calibri2, "c", "<").x / 2 + 5) * get_scope_man), vector(x / 2 - 38 - v455 / 7, y / 2 - 2 - 7 + 18 - (render.measure_text(v33.calibri2, "c", "<").x / 2 + 5) * get_scope_man), rage.antiaim:inverter() == false and v453 or color(35, 35, 35, 150));
                    render.rect(vector(x / 2 + 40 + v455 / 7, y / 2 - 2 - 7 - (render.measure_text(v33.calibri2, "c", "<").x / 2 + 5) * get_scope_man), vector(x / 2 + 38 + 2 + v455 / 7, y / 2 - 2 - 7 + 18 - (render.measure_text(v33.calibri2, "c", "<").x / 2 + 5) * get_scope_man), rage.antiaim:inverter() == true and v453 or color(35, 35, 35, 150));
                end;
            elseif v451 == 2 then
                if not v454 then
                    render.text(v33.calibri2, vector(x / 2 - 45, y / 2 - 2 - (render.measure_text(v33.calibri2, "c", "<").x / 2 + 5) * get_scope_man), v72.antiaims.yaw_base.select_side:get() == "Left" and v452 or color(35, 35, 35, 100), "c", "<");
                    render.text(v33.calibri2, vector(x / 2 + 45, y / 2 - 2 - (render.measure_text(v33.calibri2, "c", "<").x / 2 + 5) * get_scope_man), v72.antiaims.yaw_base.select_side:get() == "Right" and v452 or color(35, 35, 35, 100), "c", ">");
                else
                    render.text(v33.calibri2, vector(x / 2 - 45 - v455 / 7, y / 2 - 2 - (render.measure_text(v33.calibri2, "c", "<").x / 2 + 5) * get_scope_man), v72.antiaims.yaw_base.select_side:get() == "Left" and v452 or color(35, 35, 35, 100), "c", "<");
                    render.text(v33.calibri2, vector(x / 2 + 45 + v455 / 7, y / 2 - 2 - (render.measure_text(v33.calibri2, "c", "<").x / 2 + 5) * get_scope_man), v72.antiaims.yaw_base.select_side:get() == "Right" and v452 or color(35, 35, 35, 100), "c", ">");
                end;
            elseif v451 == 3 then
                if not v454 then
                    render.text(v33.calibri2, vector(x / 2 - 45, y / 2 - 2 - (render.measure_text(v33.calibri2, "c", "<").x / 2 + 5) * get_scope_man), v72.antiaims.yaw_base.select_side:get() == "Left" and v452 or color(35, 35, 35, 100), "c", "\226\157\176");
                    render.text(v33.calibri2, vector(x / 2 + 45, y / 2 - 2 - (render.measure_text(v33.calibri2, "c", "<").x / 2 + 5) * get_scope_man), v72.antiaims.yaw_base.select_side:get() == "Right" and v452 or color(35, 35, 35, 100), "c", "\226\157\177");
                else
                    render.text(v33.calibri2, vector(x / 2 - 45 - v455 / 7, y / 2 - 2 - (render.measure_text(v33.calibri2, "c", "<").x / 2 + 5) * get_scope_man), v72.antiaims.yaw_base.select_side:get() == "Left" and v452 or color(35, 35, 35, 100), "c", "\226\157\176");
                    render.text(v33.calibri2, vector(x / 2 + 45 + v455 / 7, y / 2 - 2 - (render.measure_text(v33.calibri2, "c", "<").x / 2 + 5) * get_scope_man), v72.antiaims.yaw_base.select_side:get() == "Right" and v452 or color(35, 35, 35, 100), "c", "\226\157\177");
                end;
            end;
        end;
        return;
    end;
end;
local function v473()
    -- upvalues: v72 (ref), v24 (ref), v4 (ref)
    if v72.visuals.custom_scope:get() then
        local v457 = entity.get_local_player();
        if not v457 then
            return;
        elseif not v457:is_alive() then
            return;
        else
            local l_m_bIsScoped_2 = v457.m_bIsScoped;
            local _ = v72.visuals.custom_scope.select:get();
            local v460 = v72.visuals.custom_scope.gap:get();
            local v461 = v72.visuals.custom_scope.lenght:get();
            local _, _, _ = math.floor(v72.visuals.custom_scope.accent_color:get().r, v72.visuals.custom_scope.accent_color:get().g, v72.visuals.custom_scope.accent_color:get().b);
            local v465 = v72.visuals.custom_scope.accent_color:get();
            local v466 = color(v465.r, v465.g, v465.b, 1);
            local v469 = (function(v467, v468)
                -- upvalues: v72 (ref)
                if not v72.visuals.custom_scope.select:get(4) then
                    return v468;
                else
                    return v467;
                end;
            end)(v465, v466);
            local v472 = (function(v470, v471)
                -- upvalues: v72 (ref)
                if not v72.visuals.custom_scope.select:get(4) then
                    return v470;
                else
                    return v471;
                end;
            end)(v465, v466);
            sc_get_scope = v24("get_scope1", v457.m_bIsScoped and 45 or 0, 20);
            nsc_get_scope = v24("get_scope2", v457.m_bIsScoped and 90 or 0, 20);
            if l_m_bIsScoped_2 then
                v4.visuals.scope_overlay:override("Remove All");
                if not v72.visuals.custom_scope.select:get(2) then
                    if v72.visuals.custom_scope.select:get(1) then
                        if v72.visuals.custom_scope.select:get(3) then
                            render.push_rotation(sc_get_scope);
                        else
                            render.push_rotation(45);
                        end;
                    elseif v72.visuals.custom_scope.select:get(3) then
                        render.push_rotation(nsc_get_scope);
                    else
                        render.push_rotation(0);
                    end;
                    render.gradient(vector(x / 2, y / 2 + (v460 - 1) + 1), vector(x / 2 + 1, y / 2 + v461 + (v460 - 1) + 1), v472, v472, v469, v469);
                    render.gradient(vector(x / 2 + 1 + v461 + (v460 - 1), y / 2), vector(x / 2 + 1 + (v460 - 1), y / 2 + 1), v469, v472, v469, v472);
                    render.gradient(vector(x / 2, y / 2 - (v460 - 1) - v461), vector(x / 2 + 1, y / 2 - (v460 - 1)), v469, v469, v472, v472);
                    render.gradient(vector(x / 2 - v461 - (v460 - 1), y / 2), vector(x / 2 - (v460 - 1), y / 2 + 1), v469, v472, v469, v472);
                    if v72.visuals.custom_scope.select:get(1) or v72.visuals.custom_scope.select:get(3) then
                        render.pop_rotation();
                    end;
                else
                    if v72.visuals.custom_scope.select:get(1) then
                        if v72.visuals.custom_scope.select:get(3) then
                            render.push_rotation(sc_get_scope);
                        else
                            render.push_rotation(45);
                        end;
                    elseif v72.visuals.custom_scope.select:get(3) then
                        render.push_rotation(nsc_get_scope);
                    else
                        render.push_rotation(0);
                    end;
                    render.gradient(vector(x / 2, y / 2 + (v460 - 1) + 1), vector(x / 2 + 1, y / 2 + v461 + (v460 - 1) + 1), v472, v472, v469, v469);
                    render.gradient(vector(x / 2 + 1 + v461 + (v460 - 1), y / 2), vector(x / 2 + 1 + (v460 - 1), y / 2 + 1), v469, v472, v469, v472);
                    render.gradient(vector(x / 2, y / 2 - (v460 - 1) - v461), vector(x / 2 + 1, y / 2 - (v460 - 1)), color(0, 0, 0, 0), color(0, 0, 0, 0), color(0, 0, 0, 0), color(0, 0, 0, 1));
                    render.gradient(vector(x / 2 - v461 - (v460 - 1), y / 2), vector(x / 2 - (v460 - 1), y / 2 + 1), v469, v472, v469, v472);
                    if v72.visuals.custom_scope.select:get(1) or v72.visuals.custom_scope.select:get(3) then
                        render.pop_rotation();
                    end;
                end;
            end;
        end;
    else
        v4.visuals.scope_overlay:override();
    end;
end;
local function v481(v474, v475, v476, v477)
    -- upvalues: v33 (ref)
    local v478 = render.measure_text(v33.calibri, "abd", v474);
    local v479 = 30;
    local v480 = y - 350;
    if v477 then
        render.gradient(vector(5, v480 + 3 - v476), vector(v479 + (v477.width + v478.x) / 2 + 3, v480 + 37 - v476), color(0, 0, 0, 0), color(0, 0, 0, 45), color(0, 0, 0, 0), color(0, 0, 0, 45));
        render.gradient(vector(v479 + (v477.width + v478.x) / 2 + 3, v480 + 3 - v476), vector(v479 + v478.x + v477.width + 29, v480 + 37 - v476), color(0, 0, 0, 45), color(0, 0, 0, 0), color(0, 0, 0, 45), color(0, 0, 0, 0));
        render.texture(v477, vector(v479, v480 + 6 - v476), v475);
        render.text(v33.calibri, vector(v479 + v477.width + 6, v480 + 10 - v476), v475, "abd", v474);
    else
        render.gradient(vector(5, v480 + 3 - v476), vector(v479 + v478.x / 2, v480 + 37 - v476), color(0, 0, 0, 0), color(0, 0, 0, 45), color(0, 0, 0, 0), color(0, 0, 0, 45));
        render.gradient(vector(v479 + v478.x / 2, v480 + 3 - v476), vector(v479 + v478.x + 23, v480 + 37 - v476), color(0, 0, 0, 45), color(0, 0, 0, 0), color(0, 0, 0, 45), color(0, 0, 0, 0));
        render.text(v33.calibri, vector(v479, v480 + 4 - v476 + 5), v475, "abd", v474);
    end;
end;
local function v499()
    -- upvalues: v72 (ref), v4 (ref), v481 (ref)
    local v482 = entity.get_local_player();
    if not v482 then
        return;
    elseif not v482:is_alive() then
        return;
    else
        local v483 = 0;
        local v484 = 0;
        local v485 = 40;
        local v486 = ui.get_binds();
        local v487 = v482:get_spectators();
        local l_m_vecVelocity_1 = v482.m_vecVelocity;
        local v489 = math.sqrt(l_m_vecVelocity_1.x * l_m_vecVelocity_1.x + l_m_vecVelocity_1.y * l_m_vecVelocity_1.y);
        if v72.visuals.gs_inds.select:get("Dormant Aimbot") and v4.ragebot.da:get() then
            v481("DA", color(255, 255, 255, 255), v484);
            v484 = v484 + v485;
        end;
        for v490 in pairs(v486) do
            if v72.visuals.gs_inds.select:get("Min. Damage") and v486[v490].name == "Min. Damage" and v486[v490].active then
                v481("MD", color(255, 255, 255, 255), v484);
                v484 = v484 + v485;
            end;
            if v72.visuals.gs_inds.select:get("Hitchance Override") and v486[v490].name == "Hit Chance" and v486[v490].active then
                v481("HC OVR.", color(255, 255, 255, 255), v484);
                v484 = v484 + v485;
            end;
            if v72.visuals.gs_inds.select:get("Fake Angles") then
                local v491 = math.min(60, math.abs(v482.m_flPoseParameter[11] * 120 - 60)) / 60;
                local v492 = 132 * v491 + 250 * (1 - v491);
                local v493 = 196 * v491 + 15 * (1 - v491);
                local v494 = 20 * v491 + 15 * (1 - v491);
                v481("FAKE", color(v492, v493, v494, 255), v484);
                v484 = v484 + v485;
            end;
        end;
        if v72.visuals.gs_inds.select:get("Lag Compensation") and (player_state(cmd) == "Aerobic" or player_state(cmd) == "Aerobic+") then
            clr = v489 >= 270 and globals.choked_commands > 2 and color(163, 194, 43, 255) or color(255, 0, 0, 255);
            v481("LC", clr, v484);
            v484 = v484 + v485;
        end;
        if v72.visuals.gs_inds.select:get("Force Baim") and v4.ragebot.force_body:get() == "Force" then
            v481("BODY", color(255, 255, 255, 255), v484);
            v484 = v484 + v485;
        end;
        if v72.visuals.gs_inds.select:get("Safe Points") and v4.ragebot.safe_point:get() == "Force" then
            v481("SAFE", color(255, 255, 255, 255), v484);
            v484 = v484 + v485;
        end;
        if v72.visuals.gs_inds.select:get("Fake Latency") and (v4.ragebot.fake_latency:get() > 0 or v72.other.fake_latency.value_slider:get() > 0 and v72.other.fake_latency:get()) then
            v481("PING", color(150, 200, 60, 255), v484);
            v484 = v484 + v485;
        end;
        if v72.visuals.gs_inds.select:get("Fake Duck") and v4.misc_antiaims.fake_duck:get() then
            v481("DUCK", color(255, 255, 255, 255), v484);
            v484 = v484 + v485;
        end;
        if v72.visuals.gs_inds.select:get("Freestanding") and (v4.antiaims.freestanding:get() or v72.antiaims.freestanding.switch:get()) then
            v481("FS", color(255, 255, 255, 255), v484);
            v484 = v484 + v485;
        end;
        if v72.visuals.gs_inds.select:get("Hide Shot") and v4.ragebot.hide_shots:get() and not v4.ragebot.double_tap:get() then
            v481("OSAA", color(255, 255, 255, 255), v484);
            v484 = v484 + v485;
        end;
        if v72.visuals.gs_inds.select:get("Double Tap") and v4.ragebot.double_tap:get() then
            v481("DT", color(255, 255 * rage.exploit:get(), 255 * rage.exploit:get(), 255), v484);
            v484 = v484 + v485;
        end;
        if v72.visuals.gs_inds.spec_list:get() then
            for _, v496 in pairs(v487) do
                local v497 = v496:get_name();
                local l_x_2 = render.measure_text(1, nil, v497).x;
                render.text(1, vector(x - (l_x_2 + 10), 5 + v483), color(255, 255, 255, 200), nil, v497);
                v483 = v483 + 18;
            end;
        end;
        return;
    end;
end;
local v500 = {};
local function v502(v501)
    -- upvalues: v500 (ref)
    table.insert(v500, {
        [1] = v501.aim, 
        [2] = globals.realtime + 2
    });
end;
local v503 = 2;
local function v522()
    -- upvalues: v72 (ref), v500 (ref), v503 (ref)
    local v504 = entity.get_local_player();
    if not v504 then
        return;
    elseif not v504:is_alive() then
        return;
    else
        if v72.visuals.modern_hitmarker:get() then
            if v72.visuals.modern_hitmarker.hitmarker_type:get() == 1 then
                for v505, v506 in pairs(v500) do
                    local v507 = v506[1];
                    local v508 = v506[2];
                    local v509 = v508 - v503;
                    if v508 < globals.realtime then
                        table.remove(v500, v505);
                    else
                        local v510 = v507:to_screen();
                        if v510 ~= nil then
                            local v511 = globals.realtime - v509;
                            local v512 = math.min(v511 / v503, 1);
                            local v513 = math.max(4 - v512 * 3, 1);
                            local v514 = math.floor(255 * (1 - v512));
                            local v515 = v72.visuals.modern_hitmarker.hitmarker_color:get();
                            v515.a = v514;
                            render.circle(vector(v510.x, v510.y - 1), v515, v513, 3, 3);
                        end;
                    end;
                end;
            elseif v72.visuals.modern_hitmarker.hitmarker_type:get() == 2 then
                for _, v517 in pairs(v500) do
                    if globals.realtime > v517[2] then
                        table.remove(v500, 1);
                    end;
                    local v518 = v517[1]:to_screen();
                    if v518 ~= nil then
                        render.rect(vector(v518.x - 1, v518.y - 5), vector(v518.x + 1, v518.y + 5), v72.visuals.modern_hitmarker.hitmarker_color:get());
                        render.rect(vector(v518.x - 5, v518.y - 1), vector(v518.x + 5, v518.y + 1), v72.visuals.modern_hitmarker.hitmarker_color:get());
                    end;
                end;
            elseif v72.visuals.modern_hitmarker.hitmarker_type:get() == 3 then
                for _, v520 in pairs(v500) do
                    if globals.realtime > v520[2] then
                        table.remove(v500, 1);
                    end;
                    local v521 = v520[1]:to_screen();
                    if v521 ~= nil then
                        render.circle(vector(v521.x - 1, v521.y), v72.visuals.modern_hitmarker.hitmarker_color:get(), 2, 3, 3);
                    end;
                end;
            end;
        end;
        return;
    end;
end;
distance_2d = function(v523, v524)
    return math.sqrt((v524.x - v523.x) ^ 2 + (v524.y - v523.y) ^ 2);
end;
lerp_position = function(v525, v526, v527)
    return vector((v526.x - v525.x) * v527 + v525.x, (v526.y - v525.y) * v527 + v525.y, (v526.z - v525.z) * v527 + v525.z);
end;
local v528 = 17.55;
local v529 = 125;
local _ = 0;
local function v560()
    -- upvalues: v72 (ref), v528 (ref), v529 (ref)
    if not entity.get_local_player() then
        return;
    else
        if v72.visuals.grenade_radius.select:get(1) then
            local v531 = entity.get_entities("CInferno");
            for v532 = 1, #v531 do
                local v533 = v531[v532];
                local v534 = v533:get_origin();
                local v535 = 40;
                local v536 = {};
                local v537 = 0;
                local v538 = nil;
                local v539 = nil;
                local v540 = v531[v532];
                for v541 = 1, 64 do
                    if v540.m_bFireIsBurning[v541] == true then
                        table.insert(v536, vector(v533.m_fireXDelta[v541], v533.m_fireYDelta[v541], v533.m_fireZDelta[v541]));
                    end;
                end;
                for v542 = 1, #v536 do
                    for v543 = 1, #v536 do
                        local v544 = distance_2d(v536[v542], v536[v543]);
                        if v537 < v544 then
                            v537 = v544;
                            v538 = v536[v542];
                            v539 = v536[v543];
                        end;
                    end;
                end;
                if v538 ~= nil and v539 ~= nil then
                    local v545 = v534 + lerp_position(v538, v539, 0.5);
                    render.circle_3d(v545, color(v72.visuals.grenade_radius.molotov_color:get().r, v72.visuals.grenade_radius.molotov_color:get().g, v72.visuals.grenade_radius.molotov_color:get().b, 255), v537 / 2 + v535, 0, 1, 1);
                end;
            end;
        end;
        if v72.visuals.grenade_radius.select:get(2) then
            local l_tickcount_2 = globals.tickcount;
            local l_tickinterval_0 = globals.tickinterval;
            local v548 = entity.get_entities("CSmokeGrenadeProjectile");
            for v549 = 1, #v548 do
                local v550 = v548[v549];
                local v551 = v550:get_classname();
                local v552 = 1;
                if v551 == "CSmokeGrenadeProjectile" and v550.m_bDidSmokeEffect == true then
                    local l_m_nSmokeEffectTickBegin_0 = v550.m_nSmokeEffectTickBegin;
                    if l_m_nSmokeEffectTickBegin_0 ~= nil then
                        local v554 = l_tickinterval_0 * (l_tickcount_2 - l_m_nSmokeEffectTickBegin_0);
                        if v554 > 0 and v528 - v554 > 0 then
                            if grenade_timer then
                                v552 = 1 - v554 / v528;
                            end;
                            local l_r_0 = v72.visuals.grenade_radius.smoke_color:get().r;
                            local l_g_0 = v72.visuals.grenade_radius.smoke_color:get().g;
                            local l_b_0 = v72.visuals.grenade_radius.smoke_color:get().b;
                            local l_a_0 = v72.visuals.grenade_radius.smoke_color:get().a;
                            local l_v529_0 = v529;
                            if v554 < 0.3 then
                                l_v529_0 = l_v529_0 * 0.6 + l_v529_0 * (v554 / 0.3) * 0.4;
                                l_a_0 = l_a_0 * (v554 / 0.3);
                            end;
                            if v528 - v554 < 1 then
                                l_v529_0 = l_v529_0 * ((v528 - v554) / 1 * 0.3 + 0.7);
                            end;
                            render.circle_3d(v550:get_origin(), color(l_r_0, l_g_0, l_b_0, l_a_0 * math.min(1, v552 * 1.3)), l_v529_0, 0, 1);
                        end;
                    end;
                end;
            end;
        end;
        return;
    end;
end;
local function v569()
    -- upvalues: v72 (ref), v3 (ref), v33 (ref)
    local v561 = v72.visuals.watermark.g1_color:get();
    local v562 = v72.visuals.watermark.g2_color:get();
    local v563 = color(v561.r, v561.g, v561.b, 255);
    local v564 = color(v562.r, v562.g, v562.b, 255);
    local v565 = v72.visuals.watermark.pos:get();
    local v566 = v72.visuals.watermark.mode:get();
    local v567 = math.floor(math.sin(globals.realtime * 4) * 89 + 90) or 180;
    local v568 = v3.gradient.text_animate("P O L Y G O N E", -1.5, {
        [1] = v563, 
        [2] = v564
    });
    v568:animate();
    if v566 == 1 then
        if v565 == 1 then
            render.text(v33.calibri3, vector(x / 2, y / 2 + y / 2.11), color(), "cs", v568:get_animated_text());
        elseif v565 == 2 then
            render.text(v33.calibri3, vector(x / 2 - x / 2.13, y / 2), color(), "cs", v568:get_animated_text());
        elseif v565 == 3 then
            render.text(v33.calibri3, vector(x / 2 + x / 2.13, y / 2), color(), "cs", v568:get_animated_text());
        end;
    elseif v565 == 1 then
        render.text(4, vector(x / 2, y / 2 + y / 2.05), color(255, 255, 255, v567), "cs", string.lower(luaname) .. " ~ " .. string.lower(branch));
    elseif v565 == 2 then
        render.text(4, vector(x / 2 - x / 2.13, y / 2), color(255, 255, 255, v567), "cs", string.lower(luaname) .. " ~ " .. string.lower(branch));
    elseif v565 == 3 then
        render.text(4, vector(x / 2 + x / 2.13, y / 2), color(255, 255, 255, v567), "cs", string.lower(luaname) .. " ~ " .. string.lower(branch));
    end;
end;
local function v571(_)
    cvar.cl_disable_ragdolls:int(1, true);
    cvar.dsp_slow_cpu:int(1, true);
    cvar.mat_disable_bloom:int(1, true);
    cvar.func_break_max_pieces:int(0, true);
    cvar.mat_queue_mode:int(2, true);
    cvar.muzzleflash_light:int(0, true);
    cvar.mat_hdr_enabled:int(0, true);
    cvar.r_eyemove:int(0, true);
    cvar.r_eyegloss:int(0, true);
end;
events.createmove:set(function(v572)
    -- upvalues: v193 (ref), v178 (ref), v184 (ref), v571 (ref), v204 (ref), v185 (ref), v191 (ref), v198 (ref), v299 (ref), v72 (ref), v310 (ref), v329 (ref), v332 (ref)
    local v573 = entity.get_local_player();
    if not v573 then
        return;
    else
        v193(v572);
        get_ping();
        is_defensive_active(v573);
        v178(v572);
        v184(v572);
        v571(v572);
        air_lag_exploit();
        v204(v572);
        v185();
        v191(v572);
        v198(v572);
        v299();
        if v72.other.movement_manipulations.helpers:get(1) then
            v310(v572);
        end;
        if v72.other.movement_manipulations.helpers:get(2) then
            v329(v572);
        end;
        if v72.other.nade_manipulations.manipulations:get(1) then
            v332(v572);
        end;
        return;
    end;
end);
events.createmove_run:set(function(v574)
    -- upvalues: v288 (ref)
    v288(v574);
end);
events.grenade_prediction:set(function(v575)
    -- upvalues: v337 (ref)
    v337(v575);
end);
events.render:set(function()
    -- upvalues: v569 (ref), v72 (ref), v409 (ref), v417 (ref), v456 (ref), v473 (ref), v499 (ref), v522 (ref), v560 (ref), v442 (ref), v449 (ref)
    if not entity.get_local_player() then
        return;
    else
        v569();
        if v72.other.clantag:get() then
            clan_tag(ct_animation());
        else
            clan_tag(" ");
        end;
        if v72.visuals.crosshair_inds:get() then
            v409();
        end;
        if v72.visuals.damage_ind:get() then
            v417();
        end;
        if v72.visuals.manual_arrows:get() then
            v456();
        end;
        v473();
        if v72.visuals.gs_inds:get() then
            v499();
        end;
        if v72.visuals.modern_hitmarker:get() then
            v522();
        end;
        if v72.visuals.grenade_radius:get() then
            v560();
        end;
        if v72.visuals.windows.velocity_warning:get() then
            v442();
        end;
        if v72.visuals.windows.defensive_warning:get() then
            v449();
        end;
        return;
    end;
end);
events.aim_fire:set(function(v576)
    -- upvalues: v502 (ref)
    v502(v576);
end);
events.post_update_clientside_animation:set(anim_breaker);
events.shutdown:set(function(_)
    -- upvalues: v4 (ref)
    v4.visuals.scope_overlay:override();
    v4.visuals.nl_souls:override();
    v4.ragebot.dt_options:override();
    v4.ragebot.hs_options:override();
    v4.ragebot.dt_teleport:override();
    v4.ragebot.backtrack:override();
    v4.ragebot.fake_latency:override();
    v4.ragebot.weapon_actions:override();
    v4.ragebot.hitchance:override();
    v4.ragebot.auto_hitchance:override();
    v4.ragebot.awp_hitchance:override();
    v4.ragebot.scout_hitchance:override();
    v4.ragebot.r8_hitchance:override();
    v4.ragebot.auto_hitchance:override();
    v4.antiaims.freestanding_modifier:override();
    v4.antiaims.freestanding_body:override();
    v4.antiaims.enable:override();
    v4.antiaims.pitch:override();
    v4.antiaims.yaw:override();
    v4.antiaims.yaw_base:override();
    v4.antiaims.yaw_offset:override();
    v4.antiaims.avoid_backstab:override();
    v4.antiaims.hidden:override();
    v4.antiaims.yaw_modifier:override();
    v4.antiaims.modifier_offset:override();
    v4.antiaims.body_yaw:override();
    v4.antiaims.left_limit:override();
    v4.antiaims.right_limit:override();
    v4.antiaims.options:override();
    v4.misc_antiaims.legs_movement:override();
    v4.misc.auto_strafe:override();
    v4.misc.strafe_assist:override();
    cvar.r_aspectratio:float(0);
    cvar.viewmodel_fov:int(68);
    cvar.viewmodel_offset_x:float(2.5);
    cvar.viewmodel_offset_y:float(0);
    cvar.viewmodel_offset_z:float(-1.5);
    cvar.cl_righthand:int(1);
    cvar.cl_interp:float(0.015625);
    cvar.cl_interp_ratio:int(2);
    cvar.cl_interpolate:int(1);
    cvar.cl_disable_ragdolls:int(0, false);
    cvar.dsp_slow_cpu:int(0, false);
    cvar.mat_disable_bloom:int(0, false);
    cvar.r_drawparticles:int(1, false);
    cvar.func_break_max_pieces:int(1, false);
    cvar.mat_queue_mode:int(2, false);
    cvar.muzzleflash_light:int(1, false);
    cvar.mat_hdr_enabled:int(1, false);
    cvar.r_eyemove:int(1, false);
    cvar.r_eyegloss:int(1, false);
end);
events.render:set(function()
    -- upvalues: v35 (ref)
    v35();
end);